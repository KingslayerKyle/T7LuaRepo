require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Shared.LobbyData" )

Lobby.PlatformSession = {}
Lobby.PlatformSession.SESSION_STATE = {
	IDLE = 0,
	CREATE = 1,
	SEARCH = 2,
	JOIN = 3,
	LEAVE = 4
}
Lobby.PlatformSession.sessionLocal = {
	state = Lobby.PlatformSession.SESSION_STATE.IDLE,
	sessionId = ""
}
Lobby.PlatformSession.sessionRemote = {
	state = Lobby.PlatformSession.SESSION_STATE.IDLE,
	sessionId = ""
}
Lobby.PlatformSession.SetSessionId = function ( sessionId )
	Lobby.PlatformSession.sessionLocal.sessionId = sessionId
end

Lobby.PlatformSession.GetSessionId = function ()
	return Lobby.PlatformSession.sessionLocal.sessionId
end

Lobby.PlatformSession.PlatformSessionEnabled = function ()
	if Engine.GetCurrentPlatform() ~= "orbis" then
		return false
	elseif Engine.IsDedicatedServer() then
		return false
	else
		return Dvar.platformSessionEnabled:get()
	end
end

Lobby.PlatformSession.InviteFailed = function ( data )
	local controller = data.controller
	local xuid = data.xuid
	local gamertag = data.gamertag
end

Lobby.PlatformSession.OnSessionStart = function ( data )
	if not Lobby.PlatformSession.PlatformSessionEnabled() then
		return 
	else
		local lobbyModule = data.lobbyModule
		local lobbyType = data.lobbyType
		local lobbyMode = data.lobbyMode
	end
end

Lobby.PlatformSession.OnSessionEnd = function ( data )
	if not Lobby.PlatformSession.PlatformSessionEnabled() then
		return 
	else
		local lobbyModule = data.lobbyModule
		local lobbyType = data.lobbyType
		local lobbyMode = data.lobbyMode
	end
end

Lobby.PlatformSession.OnClientAdded = function ( data )
	if not Lobby.PlatformSession.PlatformSessionEnabled() then
		return 
	else
		local lobbyModule = data.lobbyModule
		local lobbyType = data.lobbyType
		local lobbyMode = data.lobbyMode
		local xuid = data.xuid
	end
end

Lobby.PlatformSession.OnClientRemoved = function ( data )
	if not Lobby.PlatformSession.PlatformSessionEnabled() then
		return 
	else
		local lobbyModule = data.lobbyModule
		local lobbyType = data.lobbyType
		local lobbyMode = data.lobbyMode
		local xuid = data.xuid
	end
end

Lobby.PlatformSession.OnPlatformJoin = function ( data )
	if not Lobby.PlatformSession.PlatformSessionEnabled() then
		return 
	elseif data.error == true then
		local debugInfo = data.debugInfo
		return 
	end
	local forController = data.forController
	local forXuid = data.forXuid
	local forGamertag = data.forGamertag
	if Engine.GetCurrentPlatform() == "orbis" then
		local invite = data.invite
		local invitationId = data.invitationId
		local sessionId = data.sessionId
		if invite == true then
			local process = Lobby.Process.PS4AcceptInvite( forController, invitationId, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
			Lobby.ProcessQueue.AddToQueue( "PS4AcceptInvite", process )
		else
			local process = Lobby.Process.PS4SessionJoin( forController, sessionId, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
			Lobby.ProcessQueue.AddToQueue( "PS4SessionJoin", process )
		end
	end
end

Lobby.PlatformSession.InviteFailed = function ( data )
	local controller = data.controller
	local xuid = data.xuid
	local gamertag = data.gamertag
end

Lobby.PlatformSession.Invite = function ( data )
	local controller = data.controller
	local xuid = data.xuid
	local gamertag = data.gamertag
	local message = Engine.LocalizeWithoutLocsMarkers( "MENU_GAME_INVITE_MESSAGE", gamertag )
	Dvar.platformSessionInviteMessage:set( message )
	local retVal = Engine.PlatformSessionInvite( -1, controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	if retVal == false then
		Lobby.PlatformSession.InviteFailed( data )
	end
end

Lobby.PlatformSession.Pump = function ()
	if not Lobby.PlatformSession.PlatformSessionEnabled() then
		return 
	else
		
	end
end

Lobby.PlatformSession.Init = function ()
	if not Lobby.PlatformSession.PlatformSessionEnabled() then
		return 
	else
		
	end
end

Lobby.PlatformSession.Init()
