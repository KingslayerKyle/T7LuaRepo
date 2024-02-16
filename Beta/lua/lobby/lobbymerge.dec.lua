require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Shared.LobbyData" )

Lobby.Merge = {}
Lobby.Merge.mergeData = nil
Lobby.Merge.Complete = function ()
	if Lobby.Merge.mergeData == nil then
		return 
	else
		Lobby.Merge.mergeData = nil
	end
end

Lobby.Merge.IsMergingAllowed = function ( lobbyType )
	if Engine.IsInGame() then
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() == false then
		return false
	elseif Engine.LobbyJoinCount() > 0 then
		return false
	elseif Engine.GetLobbyClientCount( lobbyType ) >= Dvar.party_minplayers:get() then
		return false
	elseif Engine.GetSessionStatus and Engine.GetSessionStatus( lobbyType ) ~= Enum.SessionStatus.SESSION_STATUS_IDLE then
		return false
	else
		local timerStatus = Lobby.Timer.GetTimerStatus()
		if timerStatus == Lobby.Timer.LOBBY_STATUS.STARTING or timerStatus == Lobby.Timer.LOBBY_STATUS.IDLE or timerStatus == Lobby.Timer.LOBBY_STATUS.NOT_RUNNING or timerStatus == Lobby.Timer.MATCH_START_INVALID then
			return false
		else
			return true
		end
	end
end

Lobby.Merge.Update = function ()
	if Lobby.Merge.mergeData == nil then
		return 
	elseif Lobby.Merge.mergeData.merging == false then
		if Lobby.Merge.mergeData.timer > Engine.milliseconds() then
			return 
		end
		local controller = Engine.GetLobbyHostControllerIndex( Enum.LobbyType.LOBBY_TYPE_GAME )
		if controller == -1 then
			controller = 0
		end
		local process = Lobby.Process.MergePublicGameLobby( controller )
		Lobby.ProcessQueue.AddToQueue( "Merge", process )
		Lobby.Merge.mergeData.merging = true
	end
end

Lobby.Merge.Pump = function ()
	if Dvar.lobbyMergeEnabled and Dvar.lobbyMergeEnabled:get() == false then
		return 
	elseif Engine.IsDedicatedServer() then
		return 
	end
	local isActive = Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	if isActive == false then
		Lobby.Merge.mergeData = nil
		return 
	end
	local timerType = Lobby.Timer.GetTimerType()
	if timerType ~= LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Merge.mergeData = nil
		return 
	end
	local curScreenId = Engine.GetLobbyUIScreen()
	if curScreenId ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
		Lobby.Merge.mergeData = nil
		return 
	elseif Lobby.Merge.IsMergingAllowed( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		if Lobby.Merge.mergeData == nil then
			Lobby.Merge.mergeData = {}
			Lobby.Merge.mergeData.timer = Engine.milliseconds() + Dvar.lobbyMergeInterval:get()
			Lobby.Merge.mergeData.merging = false
		end
		Lobby.Merge.Update()
	else
		Lobby.Merge.mergeData = nil
	end
end

