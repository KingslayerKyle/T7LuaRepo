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

Lobby.Merge.IsMergingAllowed = function ( f2_arg0 )
	if Engine.IsInGame() then
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() == false then
		return false
	elseif Engine.LobbyJoinCount() > 0 then
		return false
	elseif Engine.GetLobbyClientCount( f2_arg0 ) >= Dvar.party_minplayers:get() then
		return false
	elseif Engine.GetSessionStatus and Engine.GetSessionStatus( f2_arg0 ) ~= Enum.SessionStatus.SESSION_STATUS_IDLE then
		return false
	else
		local f2_local0 = Lobby.Timer.GetTimerStatus()
		if f2_local0 == Lobby.Timer.LOBBY_STATUS.STARTING or f2_local0 == Lobby.Timer.LOBBY_STATUS.IDLE or f2_local0 == Lobby.Timer.LOBBY_STATUS.NOT_RUNNING or f2_local0 == Lobby.Timer.LOBBY_STATUS.POST_GAME or f2_local0 == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY or f2_local0 == Lobby.Timer.MATCH_START_INVALID then
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
		local f3_local0 = Engine.GetLobbyHostControllerIndex( Enum.LobbyType.LOBBY_TYPE_GAME )
		if f3_local0 == -1 then
			f3_local0 = 0
		end
		if Engine.IsDedicatedServer() == true then
			Lobby.ProcessQueue.AddToQueue( "Merge", Lobby.Process.MergePublicDedicatedLobby( f3_local0 ) )
		else
			Lobby.ProcessQueue.AddToQueue( "Merge", Lobby.Process.MergePublicGameLobby( f3_local0 ) )
		end
		Lobby.Merge.mergeData.merging = true
	end
end

Lobby.Merge.Pump = function ()
	if Dvar.lobbyMergeEnabled:get() == false then
		return 
	elseif Engine.IsDedicatedServer() and Dvar.lobbyMergeDedicatedEnabled:get() == false then
		return 
	elseif false == Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Merge.mergeData = nil
		return 
	elseif Lobby.Timer.GetTimerType() ~= LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Merge.mergeData = nil
		return 
	end
	local f4_local0 = Engine.GetLobbyUIScreen()
	if f4_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f4_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
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

