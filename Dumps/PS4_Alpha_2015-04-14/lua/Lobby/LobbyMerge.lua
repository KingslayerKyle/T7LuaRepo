require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Shared.LobbyData" )

Lobby.Merge = {}
local lobbyMerge = nil
Lobby.Merge.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.Merge.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.Merge.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
end

Lobby.Merge.OnClientRemoved = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
end

Lobby.Merge.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.Merge.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.Merge.Complete = function ()
	if lobbyMerge == nil then
		return 
	else
		lobbyMerge = nil
	end
end

Lobby.Merge.Update = function ()
	if lobbyMerge == nil then
		return 
	elseif lobbyMerge.merging == false then
		if lobbyMerge.timer > Engine.milliseconds() then
			return 
		end
		local controller = Engine.GetLobbyHostControllerIndex( Enum.LobbyType.LOBBY_TYPE_GAME )
		if controller == -1 then
			controller = 0
		end
		local process = Lobby.Process.MergePublicGameLobby( controller )
		Lobby.ProcessQueue.AddToQueue( "Merge", process )
		lobbyMerge.merging = true
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
		lobbyMerge = nil
		return 
	end
	local timerType = Lobby.Timer.GetTimerType()
	if timerType ~= LobbyData.TIMER_TYPE_AUTO then
		lobbyMerge = nil
		return 
	end
	local timerStatus = Lobby.Timer.GetTimerStatus()
	if timerStatus == Lobby.Timer.LOBBY_STATUS_VOTING or timerStatus == Lobby.Timer.LOBBY_STATUS_BEGIN or timerStatus == Lobby.Timer.LOBBY_STATUS_WAITING then
		if lobbyMerge == nil then
			lobbyMerge = {}
			lobbyMerge.timer = Engine.milliseconds() + Dvar.lobbyMergeInterval:get()
			lobbyMerge.merging = false
		end
		Lobby.Merge.Update()
	else
		lobbyMerge = nil
	end
end

