require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Lobby.Process.LobbyProcessPlatform" )
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
Lobby.PlatformSession.SetSessionId = function ( f1_arg0 )
	Lobby.PlatformSession.sessionLocal.sessionId = f1_arg0
end

Lobby.PlatformSession.GetSessionId = function ()
	return Lobby.PlatformSession.sessionLocal.sessionId
end

Lobby.PlatformSession.PlatformSessionEnabled = function ()
	if Engine.IsDedicatedServer() then
		return false
	else
		return Dvar.platformSessionEnabled:get()
	end
end

Lobby.PlatformSession.PlatformSessionOrbisEnabled = function ()
	if LuaUtils.isPS4 == false then
		return false
	else
		return Lobby.PlatformSession.PlatformSessionEnabled()
	end
end

Lobby.PlatformSession.PlatformSessionDurangoEnabled = function ()
	if LuaUtils.isXbox == false then
		return false
	elseif Dvar.platformSessionDurangoEnabled:exists() then
		return Dvar.platformSessionDurangoEnabled:get()
	else
		return Lobby.PlatformSession.PlatformSessionEnabled()
	end
end

Lobby.PlatformSession.PlatformSessionPCEnabled = function ()
	if LuaUtils.isPC == false then
		return false
	else
		return Lobby.PlatformSession.PlatformSessionEnabled()
	end
end

Lobby.PlatformSession.OnPlatformJoinOrbis = function ( f7_arg0 )
	local f7_local0 = f7_arg0.forController
	local f7_local1 = f7_arg0.forXuid
	local f7_local2 = f7_arg0.forGamertag
	local f7_local3 = f7_arg0.invite
	local f7_local4 = f7_arg0.invitationId
	local f7_local5 = f7_arg0.sessionId
	if f7_local3 == true then
		Lobby.ProcessQueue.AddToQueue( "PS4AcceptInvite", Lobby.ProcessPlatform.PS4AcceptInvite( f7_local0, f7_local4, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
	else
		Lobby.ProcessQueue.AddToQueue( "PS4SessionJoin", Lobby.ProcessPlatform.PS4SessionJoin( f7_local0, f7_local5, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
	end
end

Lobby.PlatformSession.OnPlatformJoinDurango = function ( f8_arg0 )
	if f8_arg0.invite == true then
		Lobby.ProcessQueue.AddToQueue( "XboxAcceptInvite", Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f8_arg0.invitedXuid ), f8_arg0.senderXuid, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
	else
		Lobby.ProcessQueue.AddToQueue( "XboxSessionJoin", Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f8_arg0.joinerXuid ), f8_arg0.joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
	end
end

Lobby.PlatformSession.OnPlatformJoin = function ( f9_arg0 )
	if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false and Lobby.PlatformSession.PlatformSessionDurangoEnabled() == false then
		return 
	elseif f9_arg0.error == true then
		local f9_local0 = f9_arg0.debugInfo
		return 
	elseif true == LuaUtils.isPS4 then
		Lobby.PlatformSession.OnPlatformJoinOrbis( f9_arg0 )
	elseif true == LuaUtils.isXbox then
		Lobby.PlatformSession.OnPlatformJoinDurango( f9_arg0 )
	elseif LuaUtils.isPC then
		
	else
		
	end
end

Lobby.PlatformSession.InviteFailed = function ( f10_arg0 )
	local f10_local0 = f10_arg0.controller
	local f10_local1 = f10_arg0.xuid
	local f10_local2 = f10_arg0.gamertag
	LuaUtils.UI_ShowErrorMessageDialog( f10_local0, "MENU_INVITE_FAILED_MSG", "MENU_INVITE_FAILED" )
end

Lobby.PlatformSession.Invite = function ( f11_arg0 )
	if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false and Lobby.PlatformSession.PlatformSessionDurangoEnabled() == false then
		return 
	end
	local f11_local0 = f11_arg0.controller
	local f11_local1 = f11_arg0.xuid
	local f11_local2 = f11_arg0.gamertag
	Dvar.platformSessionInviteMessage:set( Engine.LocalizeWithoutLocsMarkers( "MENU_GAME_INVITE_MESSAGE", f11_local2 ) )
	if Engine.GetCurrentPlatform() == "orbis" then
		if Engine.PlatformSessionInvite( -1, f11_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f11_local1, f11_local2 ) == false then
			Lobby.PlatformSession.InviteFailed( f11_arg0 )
		end
	elseif Engine.GetCurrentPlatform() == "durango" then
		if Engine.PlatformSessionInvite( -1, f11_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f11_local1, f11_local2 ) == false then
			Lobby.PlatformSession.InviteFailed( f11_arg0 )
		end
	elseif Engine.GetCurrentPlatform() == "pc" then
		
	else
		
	end
end

