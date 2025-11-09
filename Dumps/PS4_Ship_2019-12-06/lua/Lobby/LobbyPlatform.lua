require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Lobby.Process.LobbyProcessPlatform" )
require( "lua.Shared.CoDShared" )
require( "lua.Shared.LobbyData" )

Lobby.Platform = {}
Lobby.Platform.DISABLE_PLATFORM_SESSIONS = -1
Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG = {
	LOCKED = 0,
	UNLOCKED = 1
}
Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG = {
	PUBLIC = 4,
	PRIVATE = 8
}
Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE = {
	PRIVATE_LOBBY = "PrivateLobbySession",
	GAME_LOBBY = "GameLobbySession"
}
Lobby.Platform.PS4 = {
	updateTime = 0,
	taskInProgress = false,
	sessionFailure = {},
	sessionFailureTime = {},
	sessionId = {},
	lobbyId = {},
	changed = {},
	lastSignedInState = {},
	lockFlag = {},
	sessionTypeFlag = {}
}
Lobby.Platform.XBOX = {
	updateTime = 0,
	taskInProgress = false,
	disabled = {},
	sessionFailure = {},
	sessionFailureTime = {},
	rtaSubscribe = {},
	sessionChangeToken = {},
	subscriptionLostToken = {},
	templateName = {},
	sessionId = {},
	changed = {},
	lastSignedInState = {},
	roundStart = {},
	roundStartSessionId = {},
	roundEnd = {},
	playerSessionId = {},
	roundStartTime = {},
	roundStartCounter = {},
	roundEndCounter = {},
	sessionClosed = {},
	joinRestriction = {},
	visibility = {}
}
Lobby.Platform.PlatformSessionGetPartyPrivacyStatus = function ( f1_arg0 )
	local f1_local0 = "OPEN"
	if f1_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f1_local0 = "OPEN"
	elseif f1_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f1_local0 = "FRIENDS ONLY"
	elseif f1_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f1_local0 = "INVITE ONLY"
	elseif f1_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f1_local0 = "CLOSED"
	end
	return f1_local0
end

Lobby.Platform.PlatformSessionOrbisEnabled = function ()
	if LuaUtils.isPS4 == false or Engine.IsDedicatedServer() then
		return false
	else
		return Dvar.platformSessionsOrbis:get() > Enum.PlatformSessions.PLATFORM_SESSIONS_OFF
	end
end

Lobby.Platform.PlatformSessionDurangoEnabled = function ()
	if LuaUtils.isXbox == false or Engine.IsDedicatedServer() then
		return false
	else
		return Dvar.platformSessionsDurango:get() > Enum.PlatformSessions.PLATFORM_SESSIONS_OFF
	end
end

Lobby.Platform.IsOnlineGame = function ()
	if Engine.SessionMode_IsOnlineGame() then
		return true
	else
		return false
	end
end

Lobby.Platform.IsRankedGame = function ()
	local f5_local0
	if Lobby.Platform.IsOnlineGame() == true then
		f5_local0 = not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL )
	else
		f5_local0 = false
	end
	return f5_local0
end

Lobby.Platform.IsHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

Lobby.Platform.OnInit = function ( f7_arg0 )
	if Engine.IsShipBuild() == false then
		Engine.SetDvar( "platformSessionCreateFailure", 0 )
		Engine.SetDvar( "platformSessionJoinFailure", 0 )
		Engine.SetDvar( "platformSessionLeaveFailure", 0 )
		Engine.SetDvar( "platformSessionSetActivityFailure", 0 )
		Engine.SetDvar( "platformSessionSetPartyPrivacyFailure", 0 )
		Engine.SetDvar( "platformSessionSetSessionClosedFailure", 0 )
		Engine.SetDvar( "platformSessionSetJoinRestrictionFailure", 0 )
		Engine.SetDvar( "platformSessionSetVisibilityFailure", 0 )
	end
end

Lobby.Platform.OnSessionStart = function ( f8_arg0 )
	Lobby.Platform.PlatformSessionDirty( f8_arg0.lobbyType )
end

Lobby.Platform.OnSessionEnd = function ( f9_arg0 )
	Lobby.Platform.PlatformSessionDirty( f9_arg0.lobbyType )
end

Lobby.Platform.OnMatchStart = function ( f10_arg0 )
	local f10_local0 = f10_arg0.lobbyModule
	local f10_local1 = f10_arg0.lobbyType
	local f10_local2 = f10_arg0.lobbyMode
	if Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f10_local3 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.roundStart[f10_local3] = true
		end
	end
	if LuaUtils.isXbox then
		Engine.SetDvar( "xblive_rta_enabled", 0 )
	end
end

Lobby.Platform.OnMatchEnd = function ( f11_arg0 )
	local f11_local0 = f11_arg0.lobbyModule
	local f11_local1 = f11_arg0.lobbyType
	local f11_local2 = f11_arg0.lobbyMode
	if LuaUtils.isPS4 == true and f11_arg0.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() then
		for f11_local3 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f11_local6 = f11_local3 - 1
			if Engine.NotifyPsPlusAsyncMultiplay ~= nil then
				Engine.NotifyPsPlusAsyncMultiplay( f11_local6 )
			end
		end
	end
	if Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f11_local3 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.roundEnd[f11_local3] = true
		end
	end
	if LuaUtils.isXbox then
		Engine.SetDvar( "xblive_rta_enabled", 1 )
	end
end

Lobby.Platform.OnPlatformPlayTogether = function ( f12_arg0 )
	if Dvar.platformSessionsOrbisPlayTogetherEnabled:exists() == false or Dvar.platformSessionsOrbisPlayTogetherEnabled:get() == false then
		return 
	end
	local f12_local0 = f12_arg0.controller
	if Lobby.Timer.LobbyIsLocked() then
		LuaUtils.UI_ShowErrorMessageDialog( f12_local0, "MENU_CANNOT_JOIN_LOBBY_LOCKED", "MENU_MATCH_LOCKED" )
		return 
	elseif f12_arg0.error == true then
		local f12_local1 = f12_arg0.debugInfo
		return 
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if not Engine.IsRunningUILevel() then
			LobbyVM.InGameJoin( {
				controller = f12_local0,
				xuid = 0,
				platform = true,
				platformData = f12_arg0,
				playTogether = true,
				migrating = not CoDShared.QuitGame( f12_local0 )
			}, true )
			return 
		end
		local f12_local1 = Lobby.Platform.PS4ProcessPlayTogetherEvent( f12_arg0 )
		if f12_local1 ~= nil then
			local f12_local2 = Lobby.Process.Recover( f12_local0, LobbyData.UITargets.UI_MODESELECT.id )
			Lobby.Process.AppendProcess( f12_local2, f12_local1 )
			Lobby.ProcessQueue.AddToQueue( "OnPlatformPlayTogether", f12_local2 )
		end
	end
end

Lobby.Platform.OnPlatformSessionDataUpdate = function ( f13_arg0 )
	local f13_local0 = f13_arg0.lobbyModule
	local f13_local1 = f13_arg0.lobbyType
	local f13_local2 = f13_arg0.lobbyMode
	local f13_local3 = f13_arg0.gamertag
	local f13_local4 = f13_arg0.sessionId
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "OnPlatformSessionDataUpdate event occurred, sessionId: '" .. f13_local4 .. "', gamertag: " .. f13_local3 .. ".\n" )
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "OnPlatformSessionDataUpdate event occurred, sessionId: '" .. f13_local4 .. "', gamertag: " .. f13_local3 .. ".\n" )
	end
	Lobby.Platform.PlatformSessionDirty( f13_local1 )
end

Lobby.Platform.OnPlatformJoinOrbis = function ( f14_arg0 )
	local f14_local0 = f14_arg0.forController
	local f14_local1 = f14_arg0.forXuid
	local f14_local2 = f14_arg0.forGamertag
	local f14_local3 = f14_arg0.invite
	local f14_local4 = f14_arg0.invitationId
	local f14_local5 = f14_arg0.sessionId
	local f14_local6 = f14_local0
	if not Engine.IsRunningUILevel() then
		local f14_local7 = {
			controller = f14_local6,
			xuid = 0
		}
		local f14_local8
		if f14_local3 then
			f14_local8 = Enum.JoinType.JOIN_TYPE_INVITE
			if not f14_local8 then
			
			else
				f14_local7.joinType = f14_local8
				f14_local7.platform = true
				f14_local7.platformData = f14_arg0
				f14_local7.migrating = not CoDShared.QuitGame( f14_local6 )
				LobbyVM.InGameJoin( f14_local7, true )
				return 
			end
		end
		f14_local8 = Enum.JoinType.JOIN_TYPE_FRIEND
	else
		if f14_local3 == true then
			Lobby.ProcessQueue.AddToQueue( "PS4AcceptInvite", Lobby.ProcessPlatform.PS4AcceptInvite( f14_local0, f14_local1, f14_local4, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
		else
			Lobby.ProcessQueue.AddToQueue( "PS4SessionJoin", Lobby.ProcessPlatform.PS4SessionJoin( f14_local0, f14_local5, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
		end
	end
end

Lobby.Platform.InGamePlatformJoinOrbis = function ( f15_arg0 )
	local f15_local0 = f15_arg0.forController
	local f15_local1 = f15_arg0.forXuid
	local f15_local2 = f15_arg0.forGamertag
	local f15_local3 = f15_arg0.invite
	local f15_local4 = f15_arg0.invitationId
	local f15_local5 = f15_arg0.sessionId
	local f15_local6 = f15_local0
	if f15_local3 == true then
		return Lobby.ProcessPlatform.PS4AcceptInvite( f15_local0, f15_local1, f15_local4, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	else
		return Lobby.ProcessPlatform.PS4SessionJoin( f15_local0, f15_local5, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
end

Lobby.Platform.OnPlatformJoinDurango = function ( f16_arg0 )
	local f16_local0 = f16_arg0.invite
	local f16_local1 = 0
	local f16_local2 = 0
	if f16_local0 == true then
		f16_local2 = f16_arg0.senderXuid
		f16_local1 = Engine.GetControllerForXuid( f16_arg0.invitedXuid )
	else
		f16_local2 = f16_arg0.joineeXuid
		f16_local1 = Engine.GetControllerForXuid( f16_arg0.joinerXuid )
	end
	if f16_local1 == LuaEnums.INVALID_CONTROLLER_PORT then
		Engine.Durango_TryToSetXUIDToGPad( f16_arg0.invitedXuid )
		return nil
	elseif Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f16_local2 ) or Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f16_local2 ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of.\n" )
		Engine.PlatformSessionClearInviteJoinInfo()
		return nil
	elseif not Engine.IsRunningUILevel() then
		local f16_local3 = {
			controller = f16_local1,
			xuid = f16_local2
		}
		local f16_local4
		if f16_local0 then
			f16_local4 = Enum.JoinType.JOIN_TYPE_INVITE
			if not f16_local4 then
			
			else
				f16_local3.joinType = f16_local4
				f16_local3.platform = true
				f16_local3.platformData = f16_arg0
				f16_local3.migrating = not CoDShared.QuitGame( f16_local1 )
				LobbyVM.InGameJoin( f16_local3, true )
				return nil
			end
		end
		f16_local4 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f16_arg0.invite == true then
		Lobby.ProcessQueue.AddToQueue( "XboxAcceptInvite", Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f16_arg0.invitedXuid ), f16_arg0.senderXuid, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
	else
		Lobby.ProcessQueue.AddToQueue( "XboxSessionJoin", Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f16_arg0.joinerXuid ), f16_arg0.joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
	end
end

Lobby.Platform.InGamePlatformJoinDurango = function ( f17_arg0 )
	if f17_arg0.invite == true then
		return Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f17_arg0.invitedXuid ), f17_arg0.senderXuid, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	else
		return Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f17_arg0.joinerXuid ), f17_arg0.joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
end

Lobby.Platform.OnPlatformJoin = function ( f18_arg0 )
	if LuaUtils.isPS4 or LuaUtils.isXbox then
		if Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmInitialStillDownloading() or Engine.IsMpInitialStillDownloading() then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CANNOT_JOIN_DURING_INSTALL" )
			return 
		elseif Lobby.Timer.LobbyIsLocked() then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CANNOT_JOIN_LOBBY_LOCKED", "MENU_MATCH_LOCKED" )
			return 
		elseif LuaUtils.isXbox then
			local f18_local0 = f18_arg0.invite
			local f18_local1 = 0
			if f18_local0 == true then
				f18_local1 = f18_arg0.senderXuid
			else
				f18_local1 = f18_arg0.joineeXuid
			end
			if Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f18_local1 ) or Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f18_local1 ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of.\n" )
				Engine.PlatformSessionClearInviteJoinInfo()
				return 
			end
		end
	end
	if f18_arg0.error == true then
		local f18_local0 = f18_arg0.debugInfo
		return 
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Lobby.Platform.OnPlatformJoinOrbis( f18_arg0 )
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		Lobby.Platform.OnPlatformJoinDurango( f18_arg0 )
	end
end

Lobby.Platform.PlatformSessionDirty = function ( f19_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if f19_arg0 ~= Enum.LobbyType.LOBBY_TYPE_PRIVATE then
			return 
		end
		for f19_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.PS4.changed[f19_local0] = true
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f19_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.changed[f19_local0][f19_arg0 + 1] = true
		end
	end
end

Lobby.Platform.TRCPump = function ()
	if LuaUtils.isPS4 == false then
		return 
	elseif Engine.GetLuaCodeVersion() < 4 then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		for f20_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f20_local3 = f20_local0 - 1
			if Engine.IsControllerBeingUsed( f20_local3 ) then
				Engine.NotifyPsPlus( f20_local3 )
				Engine.DisplayChatRestrictionForUser( f20_local3 )
				Engine.DisplayContentRestrictionForUser( f20_local3 )
			end
		end
	end
end

local f0_local0 = function ( f21_arg0, f21_arg1 )
	Lobby.Platform.PS4.sessionId[f21_arg0 + 1] = f21_arg1
	Lobby.Platform.PS4.lobbyId[f21_arg0 + 1] = Engine.GetLobbyLobbyID( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	Engine.PlatformSessionSetDebugInfo( f21_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f21_arg1 )
end

Lobby.Platform.PS4GetSessionId = function ( f22_arg0 )
	return Lobby.Platform.PS4.sessionId[f22_arg0 + 1]
end

local f0_local1 = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
	Lobby.Platform.PS4.sessionFailure[f23_arg0 + 1] = f23_arg2
	Lobby.Platform.PS4.sessionFailureTime[f23_arg0 + 1] = f23_arg3
end

local f0_local2 = function ( f24_arg0 )
	local f24_local0 = f24_arg0 + 1
	Lobby.Platform.PS4.sessionId[f24_local0] = ""
	Lobby.Platform.PS4.lobbyId[f24_local0] = 0
	Lobby.Platform.PS4.changed[f24_local0] = 0
	Lobby.Platform.PS4.sessionFailure[f24_local0] = false
	Lobby.Platform.PS4.sessionFailureTime[f24_local0] = 0
	Lobby.Platform.PS4.lastSignedInState[f24_local0] = false
	Engine.PlatformSessionSetDebugInfo( f24_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, "" )
end

Lobby.Platform.PlatformSessionPS4Error = function ( f25_arg0, f25_arg1 )
	local f25_local0 = Dvar.platformSessionsOrbis:get()
	Lobby.Platform.PS4.taskInProgress = false
	Engine.PlatformSessionCancelTasks()
	if f25_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_NONFATAL then
		f0_local1( f25_arg0, true, Engine.seconds() + Engine.DvarInt( nil, Lobby.Platform.DISABLE_PLATFORM_SESSIONS ) )
	elseif f25_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_FATAL then
		if Engine.IsInGame() == true then
			return 
		end
		local f25_local1 = LobbyData.GetCurrentMenuTarget()
		if f25_local1.id == LobbyData.UITargets.UI_MAIN.id then
			return 
		end
		local f25_local2 = {
			controller = f25_arg0,
			signoutUsers = false
		}
		LobbyVM.ExecuteLobbyVMRequest( LuaEnums.LOBBYVM_REQUEST.FORCE_LOCAL_MODE )
		Engine.LobbyLaunchClear()
		Lobby.ProcessQueue.ClearQueue()
		LobbyVM.ErrorShutdown( f25_local2 )
		LobbyVM.ShutdownCleanup( f25_local2 )
		if Dvar.platformSessionShowErrorCodes:get() == true then
			LuaUtils.UI_ShowErrorMessageDialog( f25_arg0, "Platform Session Error: " .. f25_arg1 )
		else
			LuaUtils.UI_ShowErrorMessageDialog( f25_arg0, "PLATFORM_PLATFORM_SESSION_ERROR" )
		end
		return 
	end
end

Lobby.Platform.PlatformSessionPS4GetLockFlag = function ( f26_arg0 )
	local f26_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	if f26_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f26_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	elseif f26_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f26_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	elseif f26_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f26_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	elseif f26_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f26_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.LOCKED
	end
	return f26_local0
end

Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag = function ( f27_arg0 )
	local f27_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	if f27_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f27_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	elseif f27_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f27_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	elseif f27_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f27_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PRIVATE
	elseif f27_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f27_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	end
	return f27_local0
end

Lobby.Platform.PlatformSessionPS4CreateComplete = function ( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = f28_arg1.controller
	local f28_local1 = f28_arg2.isError
	local f28_local2 = f28_arg2.returnCode
	local f28_local3 = f28_arg2.returnCodeHex
	if f28_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f28_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f28_local1 == false then
			f0_local0( f28_local0, f28_arg2.sessionId )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete, we have successfully created session id: '" .. Lobby.Platform.PS4GetSessionId( f28_local0 ) .. "'.\n" )
			if f28_local0 == Engine.GetPrimaryController() and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete, we are host of private session, setting session data.\n" )
				Engine.PlatformSessionPS4SetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Lobby.Platform.PS4GetSessionId( f28_local0 ) )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed: " .. f28_local3 .. "\n" )
		end
	elseif f28_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f28_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed: " .. f28_local3 .. "\n" )
		f28_local1 = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if f28_local1 == true then
		Lobby.Platform.PlatformSessionPS4Error( f28_local0, f28_local3 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Create = function ( f29_arg0, f29_arg1, f29_arg2 )
	Lobby.Platform.PS4.taskInProgress = true
	Dvar.platformSessionOrbisName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_PLATFORM_SESSION_NAME" ) )
	Dvar.platformSessionOrbisStatus:set( "" )
	Dvar.platformSessionOrbisImgPath:set( "" )
	Dvar.platformSessionOrbisImg:set( "platform_session.png" )
	local f29_local0 = Engine.GetPartyPrivacy()
	local f29_local1 = Lobby.Platform.PlatformSessionPS4GetLockFlag( f29_local0 )
	Lobby.Platform.PS4.lockFlag[f29_arg0 + 1] = f29_local0
	Dvar.platformSessionOrbisLockFlag:set( f29_local1 )
	local f29_local2 = Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag( f29_local0 )
	Lobby.Platform.PS4.sessionTypeFlag[f29_arg0 + 1] = f29_local0
	Dvar.platformSessionOrbisSessionTypeFlag:set( f29_local2 )
	local f29_local3 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4CreateComplete, {
		controller = f29_arg0,
		lobbyType = f29_arg1,
		maxSlot = f29_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create started.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionCreateFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f29_local3,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Create( f29_local3, f29_arg0, f29_arg1, f29_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f29_local3,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionJoinCompletePS4 = function ( f30_arg0, f30_arg1, f30_arg2 )
	local f30_local0 = f30_arg1.controller
	local f30_local1 = f30_arg2.isError
	local f30_local2 = f30_arg2.returnCode
	local f30_local3 = f30_arg2.returnCodeHex
	if f30_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionJoinCompletePS4 ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f30_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f30_local1 == false then
			if f30_arg2.sessionId ~= nil then
				f0_local0( f30_local0, f30_arg2.sessionId )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionJoinCompletePS4, we have successfully joined session id: '" .. Lobby.Platform.PS4GetSessionId( f30_local0 ) .. "'.\n" )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed: " .. f30_local3 .. "\n" )
		end
	elseif f30_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f30_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed: " .. f30_local3 .. "\n" )
		f30_local1 = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if f30_local1 == true then
		Lobby.Platform.PlatformSessionPS4Error( f30_local0, f30_local3 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Join = function ( f31_arg0, f31_arg1, f31_arg2 )
	Lobby.Platform.PS4.taskInProgress = true
	local f31_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionJoinCompletePS4, {
		controller = f31_arg0,
		lobbyType = f31_arg1,
		sessionId = f31_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join started, joining sessionId: '" .. f31_arg2 .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionJoinFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f31_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Join( f31_local0, f31_arg0, f31_arg1, f31_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f31_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4LeaveComplete = function ( f32_arg0, f32_arg1, f32_arg2 )
	local f32_local0 = f32_arg1.controller
	local f32_local1 = f32_arg2.isError
	local f32_local2 = f32_arg2.returnCode
	local f32_local3 = f32_arg2.returnCodeHex
	if f32_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f32_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f32_local1 == false then
			local f32_local4 = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete, we have successfully left session id: '" .. Lobby.Platform.PS4GetSessionId( f32_local0 ) .. "'.\n" )
			if f32_local0 == Engine.GetPrimaryController() and f32_local4.sessionId == Lobby.Platform.PS4GetSessionId( f32_local0 ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete, we are host of private session, clearing session data.\n" )
				Engine.PlatformSessionPS4ClearData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed: " .. f32_local3 .. "\n" )
		end
	elseif f32_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f32_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed: " .. f32_local3 .. "\n" )
		f32_local1 = true
	end
	f0_local0( f32_local0, "" )
	Lobby.Platform.PS4.taskInProgress = false
	if f32_local1 == true then
		Lobby.Platform.PlatformSessionPS4Error( f32_local0, f32_local3 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Leave = function ( f33_arg0, f33_arg1, f33_arg2 )
	Lobby.Platform.PS4.taskInProgress = true
	local f33_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4LeaveComplete, {
		controller = f33_arg0,
		lobbyType = f33_arg1,
		sessionId = f33_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave started, leaving sessionId: '" .. f33_arg2 .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionLeaveFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f33_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Leave( f33_local0, f33_arg0, f33_arg1, f33_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f33_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4SetPartyPrivacyComplete = function ( f34_arg0, f34_arg1, f34_arg2 )
	local f34_local0 = f34_arg1.controller
	local f34_local1 = f34_arg1.lobbyType
	local f34_local2 = f34_arg2.isError
	local f34_local3 = f34_arg2.returnCode
	local f34_local4 = f34_arg2.returnCodeHex
	if f34_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacyComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f34_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f34_local2 == false then
			local f34_local5 = f34_arg1.partyPrivacy
			Lobby.Platform.PS4.lockFlag[f34_local0 + 1] = f34_local5
			Lobby.Platform.PS4.sessionTypeFlag[f34_local0 + 1] = f34_local5
			Engine.PlatformSessionSetDebugInfo( f34_local0, Enum.LobbyType.LOBBY_TYPE_GAME, "partyPrivacyStatus: " .. Lobby.Platform.PlatformSessionGetPartyPrivacyStatus( f34_local5 ) )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacyComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy failed: " .. f34_local4 .. "\n" )
		end
	elseif f34_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f34_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy failed: " .. f34_local4 .. "\n" )
		f34_local2 = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if f34_local2 == true then
		Engine.PlatformSessionSetDebugInfo( f34_local0, Enum.LobbyType.LOBBY_TYPE_GAME, "partyPrivacyStatus: ERROR" )
		Lobby.Platform.PlatformSessionPS4Error( f34_local0, f34_local1, f34_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4SetPartyPrivacy = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
	local f35_local0 = Lobby.Platform.PlatformSessionPS4GetLockFlag( Lobby.Platform.PS4.lockFlag[f35_arg0 + 1] )
	local f35_local1 = Lobby.Platform.PlatformSessionPS4GetLockFlag( f35_arg3 )
	local f35_local2 = Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag( Lobby.Platform.PS4.sessionTypeFlag[f35_arg0 + 1] )
	local f35_local3 = Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag( f35_arg3 )
	if f35_local0 == f35_local1 and f35_local2 == f35_local3 then
		Lobby.Platform.PS4.lockFlag[f35_arg0 + 1] = f35_arg3
		Lobby.Platform.PS4.sessionTypeFlag[f35_arg0 + 1] = f35_arg3
		return 
	else
		Lobby.Platform.PS4.taskInProgress = true
		local f35_local4 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4SetPartyPrivacyComplete, {
			controller = f35_arg0,
			lobbyType = f35_arg1,
			sessionId = f35_arg2,
			partyPrivacy = f35_arg3
		} )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy started.\n" )
		if Engine.IsShipBuild() == false and 1 == Engine.DvarInt( 0, "platformSessionSetPartyPrivacyFailure" ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy FAILURE TEST.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f35_local4,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		else
			Dvar.platformSessionOrbisLockFlag:set( f35_local1 )
			Dvar.platformSessionOrbisSessionTypeFlag:set( f35_local3 )
			if Engine.PlatformSessionPS4Update( f35_local4, f35_arg0, f35_arg1, f35_arg2 ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy failed to start.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = f35_local4,
					isError = true,
					returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
					returnCodeHex = "EVENT START ERROR"
				} )
				return 
			else
				
			end
		end
	end
end

Lobby.Platform.PlatformSessionPS4PumpController = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4, f36_arg5, f36_arg6, f36_arg7 )
	local f36_local0 = f36_arg0 + 1
	local f36_local1 = Lobby.Platform.PS4GetSessionId( f36_arg0 )
	local f36_local2 = Lobby.Platform.PS4.lobbyId[f36_local0]
	local f36_local3 = string.len( f36_local1 ) > 0
	local f36_local4 = Lobby.Platform.PS4.sessionFailure[f36_local0]
	if f36_arg4 == false then
		if f36_local3 == false and f36_local4 == false then
			return 
		elseif f36_local3 == true and f36_local4 == false then
			Lobby.Platform.PlatformSessionPS4Leave( f36_arg0, f36_arg2, f36_local1 )
		else
			f0_local0( f36_arg0, "" )
			Lobby.Platform.PS4.sessionFailure[f36_local0] = false
		end
		return 
	elseif f36_arg5 == false or f36_arg1 == false then
		if f36_local3 == false and f36_local4 == false then
			return 
		elseif f36_local3 == true and f36_local4 == false then
			Lobby.Platform.PlatformSessionPS4Leave( f36_arg0, f36_arg2, f36_local1 )
		else
			f0_local0( f36_arg0, "" )
			Lobby.Platform.PS4.sessionFailure[f36_local0] = false
		end
		return 
	elseif Lobby.Platform.PS4.changed[f36_local0] == true then
		local f36_local5 = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if f36_local3 == true and (f36_local5.sessionId ~= f36_local1 or f36_local2 ~= Engine.GetLobbyLobbyID( Enum.LobbyType.LOBBY_TYPE_PRIVATE )) then
			Lobby.Platform.PlatformSessionPS4Leave( f36_arg0, f36_arg2, f36_local1 )
		end
		Lobby.Platform.PS4.changed[f36_local0] = false
		return 
	elseif f36_local4 == false then
		if f36_local3 == true then
			if true == Dvar.platformSessionPartyPrivacy:get() and f36_arg0 == f36_arg7 and f36_arg2 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
				local f36_local5 = Engine.GetPartyPrivacy()
				if Lobby.Platform.PS4.lockFlag[f36_local0] ~= f36_local5 then
					Lobby.Platform.PlatformSessionPS4SetPartyPrivacy( f36_arg0, f36_arg2, f36_local1, f36_local5 )
					return 
				end
			end
			return 
		elseif f36_arg6 == true and f36_arg0 == f36_arg7 then
			Lobby.Platform.PlatformSessionPS4Create( f36_arg0, f36_arg2, f36_arg3 )
			return 
		end
		local f36_local5 = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if f36_local5.sessionId ~= "" then
			Lobby.Platform.PlatformSessionPS4Join( f36_arg0, f36_arg2, f36_local5.sessionId )
		end
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4Pump = function ()
	if Lobby.Platform.PS4.taskInProgress ~= true and true ~= Engine.IsRequestingJoin() then
		if Lobby.ProcessQueue.IsQueueEmpty() == false then
			local f37_local0 = Lobby.ProcessQueue.GetQueueHead()
			if f37_local0.nonPSNSessionBlocking ~= true then
				Lobby.Platform.PS4.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalOrbis:get()
				return 
			end
		end
		if Lobby.Platform.PS4.updateTime > Engine.milliseconds() then
			return 
		end
		Lobby.Platform.PS4.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalOrbis:get()
		local f37_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		local f37_local1 = 18
		local f37_local2 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
		local f37_local3 = Engine.IsLobbyActive( f37_local0 )
		local f37_local4 = Engine.IsLobbyHost( f37_local0 )
		local f37_local5
		if f37_local4 then
			f37_local5 = Engine.GetLobbyHostControllerIndex( f37_local0 )
			if not f37_local5 then
			
			else
				for f37_local6 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
					local f37_local9 = f37_local6 - 1
					local f37_local10 = Engine.IsSignedInToLive( f37_local9 )
					local f37_local11 = Engine.IsControllerBeingUsed( f37_local9 )
					if f37_local10 == true then
						Lobby.Platform.PlatformSessionPS4PumpController( f37_local9, f37_local11, f37_local0, f37_local1, f37_local2, f37_local3, f37_local4, f37_local5 )
					elseif Lobby.Platform.PS4.lastSignedInState[f37_local6] == true then
						f0_local2( f37_local9 )
					end
					Lobby.Platform.PS4.lastSignedInState[f37_local6] = f37_local10
					if Lobby.Platform.PS4.taskInProgress == true then
						return 
					end
				end
			end
		end
		f37_local5 = LuaEnums.INVALID_CONTROLLER_PORT
	end
	Lobby.Platform.PS4.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalOrbis:get()
	return 
end

local f0_local3 = function ( f38_arg0, f38_arg1, f38_arg2 )
	Lobby.Platform.XBOX.templateName[f38_arg0 + 1][f38_arg1 + 1] = f38_arg2
end

local f0_local4 = function ( f39_arg0, f39_arg1 )
	return Lobby.Platform.XBOX.templateName[f39_arg0 + 1][f39_arg1 + 1]
end

local f0_local5 = function ( f40_arg0, f40_arg1, f40_arg2 )
	Lobby.Platform.XBOX.sessionId[f40_arg0 + 1][f40_arg1 + 1] = f40_arg2
	Engine.PlatformSessionSetDebugInfo( f40_arg0, f40_arg1, f40_arg2 )
end

local f0_local6 = function ( f41_arg0, f41_arg1 )
	return Lobby.Platform.XBOX.sessionId[f41_arg0 + 1][f41_arg1 + 1]
end

local f0_local7 = function ( f42_arg0, f42_arg1, f42_arg2 )
	Lobby.Platform.XBOX.changed[f42_arg0 + 1][f42_arg1 + 1] = f42_arg2
end

local f0_local8 = function ( f43_arg0, f43_arg1 )
	return Lobby.Platform.XBOX.changed[f43_arg0 + 1][f43_arg1 + 1]
end

local f0_local9 = function ( f44_arg0, f44_arg1, f44_arg2 )
	Lobby.Platform.XBOX.sessionFailure[f44_arg0 + 1] = f44_arg1
	Lobby.Platform.XBOX.sessionFailureTime[f44_arg0 + 1] = f44_arg2
end

local f0_local10 = function ( f45_arg0 )
	return Lobby.Platform.XBOX.sessionFailure[f45_arg0 + 1]
end

local f0_local11 = function ( f46_arg0, f46_arg1 )
	return f0_local4( f46_arg0, f46_arg1 ), f0_local6( f46_arg0, f46_arg1 )
end

local f0_local12 = function ( f47_arg0, f47_arg1 )
	Engine.PlatformSessionSetDebugInfo( f47_arg0, f47_arg1, f0_local6( f47_arg0, f47_arg1 ), "  start[ " .. tostring( Lobby.Platform.XBOX.roundStartCounter[f47_arg0 + 1] ) .. " ], end[ " .. tostring( Lobby.Platform.XBOX.roundEndCounter[f47_arg0 + 1] ) .. " ]" )
end

local f0_local13 = function ( f48_arg0, f48_arg1 )
	local f48_local0 = f48_arg0 + 1
	Lobby.Platform.XBOX.disabled[f48_local0] = false
	f0_local9( f48_arg0, false, 0 )
	Lobby.Platform.XBOX.lastSignedInState[f48_local0] = false
	for f48_local1 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
		f0_local5( f48_arg0, f48_local1, "" )
		f0_local7( f48_arg0, f48_local1, false )
		Engine.PlatformSessionXboxXBLiveSessionClear( f48_arg0, f48_local1 )
	end
	Lobby.Platform.XBOX.roundStart[f48_local0] = false
	Lobby.Platform.XBOX.roundStartSessionId[f48_local0] = ""
	Lobby.Platform.XBOX.roundEnd[f48_local0] = false
	Lobby.Platform.XBOX.playerSessionId[f48_local0] = nil
	Lobby.Platform.XBOX.roundStartTime[f48_local0] = 0
	Lobby.Platform.XBOX.roundStartCounter[f48_local0] = 0
	Lobby.Platform.XBOX.roundEndCounter[f48_local0] = 0
	Lobby.Platform.XBOX.sessionClosed[f48_local0] = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	Lobby.Platform.XBOX.joinRestriction[f48_local0] = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	Lobby.Platform.XBOX.visibility[f48_local0] = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	if f48_arg1 == true then
		Lobby.Platform.XBOX.rtaSubscribe[f48_local0] = false
	end
end

Lobby.Platform.PlatformSessionUpdateErrorCount = function ( f49_arg0 )
	local f49_local0 = f49_arg0 + 1
	if not Engine.StorageIsFileReady( f49_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	end
	local f49_local1 = Engine.StorageGetBuffer( f49_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f49_local1 == nil then
		return 
	end
	local f49_local2 = f49_local1.demonwareflags[15]:get() + 1
	if f49_local2 > 255 then
		f49_local2 = 255
	end
	f49_local1.demonwareflags[15]:set( f49_local2 )
	Lobby.Platform.XBOX.disabled[f49_local0] = nil
end

Lobby.Platform.PlatformSessionXboxError = function ( f50_arg0, f50_arg1, f50_arg2 )
	local f50_local0 = Dvar.platformSessionsDurango:get()
	Lobby.Platform.XBOX.taskInProgress = false
	Lobby.Platform.PlatformSessionUpdateErrorCount( f50_arg0 )
	Engine.PlatformSessionCancelTasks()
	if f50_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_NONFATAL then
		f0_local13( f50_arg0, false )
		f0_local9( f50_arg0, true, Lobby.Platform.DISABLE_PLATFORM_SESSIONS )
	elseif f50_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_FATAL then
		LobbyVM.ExecuteLobbyVMRequest( LuaEnums.LOBBYVM_REQUEST.FORCE_LOCAL_MODE )
		if Dvar.platformSessionShowErrorCodes:get() == true then
			Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "Platform Session Error: " .. f50_arg2 )
		else
			Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "PLATFORM_PLATFORM_SESSION_ERROR" )
		end
	end
end

Lobby.Platform.PlatformSessionXboxGenerateSessionId = function ( f51_arg0 )
	local f51_local0 = Engine.GetLobbyHostInfo( Enum.LobbyModule.LOBBY_MODULE_CLIENT, f51_arg0 )
	if f51_local0 == nil then
		return false, ""
	else
		return true, Engine.PlatformSessionXboxSecIdToSessionId( f51_local0.secId )
	end
end

Lobby.Platform.PlatformSessionXboxCreateComplete = function ( f52_arg0, f52_arg1, f52_arg2 )
	local f52_local0 = f52_arg1.controller
	local f52_local1 = f52_arg1.lobbyType
	local f52_local2 = f52_arg2.isError
	local f52_local3 = f52_arg2.returnCode
	local f52_local4 = f52_arg2.returnCodeHex
	if f52_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreateComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f52_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f52_local2 == false then
			f0_local5( f52_local0, f52_local1, f52_arg2.sessionId )
			Engine.PlatformSessionXboxSetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f0_local6( f52_local0, f52_local1 ), f0_local4( f52_local0, f52_local1 ) )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreateComplete, we have successfully created session id: '" .. f52_arg2.sessionId .. "'.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed: " .. f52_local4 .. "\n" )
		end
	elseif f52_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f52_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed: " .. f52_local4 .. "\n" )
		f52_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f52_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f52_local0, f52_local1, f52_local4 )
		return true
	elseif f52_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS and f52_local2 == false and f52_local1 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		Lobby.Platform.PlatformSessionXboxSetActivity( f52_local0, f52_local1 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxCreate = function ( f53_arg0, f53_arg1 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f53_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxCreateComplete, {
		controller = f53_arg0,
		lobbyType = f53_arg1
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate started.\n" )
	local f53_local1 = f0_local4( f53_arg0, f53_arg1 )
	local f53_local2, f53_local3 = Lobby.Platform.PlatformSessionXboxGenerateSessionId( f53_arg1 )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionCreateFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f53_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif f53_local2 == false or Engine.PlatformSessionXboxCreateJoin( f53_local0, f53_arg0, f53_arg1, f53_local1, f53_local3 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f53_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxSetActivityComplete = function ( f54_arg0, f54_arg1, f54_arg2 )
	local f54_local0 = f54_arg1.controller
	local f54_local1 = f54_arg1.lobbyType
	local f54_local2 = f54_arg1.sessionId
	local f54_local3 = f54_arg2.isError
	local f54_local4 = f54_arg2.returnCode
	local f54_local5 = f54_arg2.returnCodeHex
	if f54_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivityComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f54_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f54_local3 == false then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivityComplete, we have successfully set sessionId: '" .. f54_local2 .. "' to be the activity session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed: " .. f54_local5 .. "\n" )
		end
	elseif f54_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f54_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed: " .. f54_local5 .. "\n" )
		f54_local3 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f54_local3 == true then
		Lobby.Platform.PlatformSessionXboxError( f54_local0, f54_local1, f54_local5 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxSetActivity = function ( f55_arg0, f55_arg1 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f55_local0, f55_local1 = f0_local11( f55_arg0, f55_arg1 )
	local f55_local2 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetActivityComplete, {
		controller = f55_arg0,
		lobbyType = f55_arg1,
		sessionId = f55_local1
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity started for sessionId: '" .. f55_local1 .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionSetActivityFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f55_local2,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxSetActivity( f55_local2, f55_arg0, f55_arg1, f55_local0, f55_local1 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f55_local2,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxLeaveComplete = function ( f56_arg0, f56_arg1, f56_arg2 )
	local f56_local0 = f56_arg1.controller
	local f56_local1 = f56_arg1.lobbyType
	local f56_local2 = f56_arg2.isError
	local f56_local3 = f56_arg2.returnCode
	local f56_local4 = f56_arg2.returnCodeHex
	if f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeaveComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f56_local2 == false then
			local f56_local5 = Engine.PlatformSessionXboxGetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeaveComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed: " .. f56_local4 .. "\n" )
		end
	elseif f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed: " .. f56_local4 .. "\n" )
		f56_local2 = true
	end
	f0_local5( f56_local0, f56_local1, "" )
	Lobby.Platform.XBOX.taskInProgress = false
	if f56_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f56_local0, f56_local1, f56_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxLeave = function ( f57_arg0, f57_arg1, f57_arg2 )
	Lobby.Platform.XBOX.taskInProgress = true
	Lobby.Platform.PlatformSessionXboxRoundEnd( f57_arg0, f57_arg1 )
	local f57_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxLeaveComplete, {
		controller = f57_arg0,
		lobbyType = f57_arg1
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave started.\n" )
	local f57_local1, f57_local2 = f0_local11( f57_arg0, f57_arg1 )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionLeaveFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f57_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxLeave( f57_local0, f57_arg0, f57_arg1, f57_local1, f57_local2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f57_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxSetSessionClosedSetDebugStatus = function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
	local f58_local0 = "OPEN"
	if f58_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f58_local0 = "OPEN"
	elseif f58_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f58_local0 = "FRIENDS ONLY"
	elseif f58_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f58_local0 = "INVITE ONLY"
	elseif f58_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f58_local0 = "CLOSED"
	end
	Engine.PlatformSessionSetDebugInfo( f58_arg0, f58_arg1, f58_arg2, f58_local0 )
end

Lobby.Platform.PlatformSessionXboxSetSessionClosedComplete = function ( f59_arg0, f59_arg1, f59_arg2 )
	local f59_local0 = f59_arg1.controller
	local f59_local1 = f59_arg1.lobbyType
	local f59_local2 = f59_arg2.isError
	local f59_local3 = f59_arg2.returnCode
	local f59_local4 = f59_arg2.returnCodeHex
	if f59_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosedComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f59_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f59_local2 == false then
			Lobby.Platform.XBOX.sessionClosed[f59_local0 + 1] = f59_arg1.partyPrivacy
			Lobby.Platform.PlatformSessionXboxSetSessionClosedSetDebugStatus( f59_local0, f59_local1, f59_arg1.sessionId, f59_arg1.partyPrivacy )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosedComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed: " .. f59_local4 .. "\n" )
		end
	elseif f59_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f59_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed: " .. f59_local4 .. "\n" )
		f59_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f59_local2 == true then
		Engine.PlatformSessionSetDebugInfo( f59_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f59_arg1.sessionId, "ERROR" )
		Lobby.Platform.PlatformSessionXboxError( f59_local0, f59_local1, f59_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxIsSessionClosed = function ( f60_arg0 )
	local f60_local0 = false
	if f60_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f60_local0 = false
	elseif f60_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f60_local0 = false
	elseif f60_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f60_local0 = false
	elseif f60_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f60_local0 = true
	end
	return f60_local0
end

Lobby.Platform.PlatformSessionXboxSetSessionClosed = function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
	local f61_local0 = Lobby.Platform.PlatformSessionXboxIsSessionClosed( Lobby.Platform.XBOX.sessionClosed[f61_arg0 + 1] )
	local f61_local1 = Lobby.Platform.PlatformSessionXboxIsSessionClosed( f61_arg3 )
	if f61_local0 == f61_local1 then
		Lobby.Platform.XBOX.sessionClosed[f61_arg0 + 1] = f61_arg3
		Lobby.Platform.PlatformSessionXboxSetSessionClosedSetDebugStatus( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
		return 
	else
		Lobby.Platform.XBOX.taskInProgress = true
		local f61_local2 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetSessionClosedComplete, {
			controller = f61_arg0,
			lobbyType = f61_arg1,
			sessionId = f61_arg2,
			partyPrivacy = f61_arg3
		} )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed started.\n" )
		if Engine.IsShipBuild() == false and 1 == Engine.DvarInt( 0, "platformSessionSetSessionClosedFailure" ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed FAILURE TEST.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f61_local2,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		elseif Engine.PlatformSessionXboxSetSessionClosed( f61_local2, f61_arg0, f61_arg1, f61_local1 ) == false then
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed to start.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f61_local2,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		else
			
		end
	end
end

Lobby.Platform.PlatformSessionXboxSetJoinRestrictionComplete = function ( f62_arg0, f62_arg1, f62_arg2 )
	local f62_local0 = f62_arg1.controller
	local f62_local1 = f62_arg1.lobbyType
	local f62_local2 = f62_arg2.isError
	local f62_local3 = f62_arg2.returnCode
	local f62_local4 = f62_arg2.returnCodeHex
	if f62_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestrictionComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f62_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f62_local2 == false then
			Lobby.Platform.XBOX.joinRestriction[f62_local0 + 1] = f62_arg1.partyPrivacy
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestrictionComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed: " .. f62_local4 .. "\n" )
		end
	elseif f62_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f62_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed: " .. f62_local4 .. "\n" )
		f62_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f62_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f62_local0, f62_local1, f62_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxGetJoinRestriction = function ( f63_arg0 )
	local f63_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_NONE
	if f63_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f63_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_NONE
	elseif f63_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f63_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_FOLLOWED
	elseif f63_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f63_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_LOCAL
	elseif f63_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f63_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_LOCAL
	end
	return f63_local0
end

Lobby.Platform.PlatformSessionXboxSetJoinRestriction = function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3 )
	local f64_local0 = Lobby.Platform.PlatformSessionXboxGetJoinRestriction( Lobby.Platform.XBOX.joinRestriction[f64_arg0 + 1] )
	local f64_local1 = Lobby.Platform.PlatformSessionXboxGetJoinRestriction( f64_arg3 )
	if f64_local0 == f64_local1 then
		Lobby.Platform.XBOX.joinRestriction[f64_arg0 + 1] = f64_arg3
		return 
	else
		Lobby.Platform.XBOX.taskInProgress = true
		local f64_local2 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetJoinRestrictionComplete, {
			controller = f64_arg0,
			lobbyType = f64_arg1,
			sessionId = f64_arg2,
			partyPrivacy = f64_arg3,
			joinRestriction = f64_local1
		} )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction started.\n" )
		if Engine.IsShipBuild() == false and 1 == Engine.DvarInt( 0, "platformSessionSetJoinRestrictionFailure" ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction FAILURE TEST.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f64_local2,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		elseif Engine.PlatformSessionXboxSetJoinRestriction( f64_local2, f64_arg0, f64_arg1, f64_local1 ) == false then
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed to start.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f64_local2,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		else
			
		end
	end
end

Lobby.Platform.PlatformSessionXboxSetVisibilityComplete = function ( f65_arg0, f65_arg1, f65_arg2 )
	local f65_local0 = f65_arg1.controller
	local f65_local1 = f65_arg1.lobbyType
	local f65_local2 = f65_arg2.isError
	local f65_local3 = f65_arg2.returnCode
	local f65_local4 = f65_arg2.returnCodeHex
	if f65_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibilityComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f65_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f65_local2 == false then
			Lobby.Platform.XBOX.visibility[f65_local0 + 1] = f65_arg1.partyPrivacy
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibilityComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility failed: " .. f65_local4 .. "\n" )
		end
	elseif f65_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f65_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility failed: " .. f65_local4 .. "\n" )
		f65_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f65_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f65_local0, f65_local1, f65_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxSetVisibility = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f66_local0 = Enum.DurangoSessionVisibility.DURANGO_SESSION_VISIBILITY_OPEN
	if f66_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f66_local0 = Enum.DurangoSessionVisibility.DURANGO_SESSION_VISIBILITY_PRIVATE
	end
	local f66_local1 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetVisibilityComplete, {
		controller = f66_arg0,
		lobbyType = f66_arg1,
		sessionId = f66_arg2,
		partyPrivacy = f66_arg3,
		visibility = f66_local0
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility started.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionSetVisibilityFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f66_local1,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxSetSessionVisibility( f66_local1, f66_arg0, f66_arg1, f66_local0 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f66_local1,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxRoundStart = function ( f67_arg0, f67_arg1 )
	local f67_local0 = f67_arg0 + 1
	Lobby.Platform.XBOX.roundStart[f67_local0] = false
	local f67_local1, f67_local2 = f0_local11( f67_arg0, f67_arg1 )
	local f67_local3, f67_local4 = Engine.PlatformSessionXboxMultiplayerRoundStart( f67_arg0, f67_arg1, f67_local1, f67_local2 )
	if f67_local3 == true then
		Lobby.Platform.XBOX.roundStartSessionId[f67_local0] = f67_local2
		Lobby.Platform.XBOX.roundStartTime[f67_local0] = Engine.milliseconds()
		Lobby.Platform.XBOX.roundStartCounter[f67_local0] = Lobby.Platform.XBOX.roundStartCounter[f67_local0] + 1
		f0_local12( f67_arg0, f67_arg1 )
		Lobby.Platform.XBOX.playerSessionId[f67_local0] = f67_local4.guid
	end
end

Lobby.Platform.PlatformSessionXboxRoundEnd = function ( f68_arg0, f68_arg1 )
	local f68_local0 = f68_arg0 + 1
	Lobby.Platform.XBOX.roundEnd[f68_local0] = false
	local f68_local1 = Lobby.Platform.XBOX.playerSessionId[f68_local0]
	if f68_local1 ~= nil then
		local f68_local2 = Lobby.Platform.XBOX.roundStartTime[f68_local0]
		local f68_local3, f68_local4 = f0_local11( f68_arg0, f68_arg1 )
		local f68_local5 = Lobby.Platform.XBOX.roundStartSessionId[f68_local0]
		if f68_local5 == f0_local6( f68_arg0, f68_arg1 ) then
			Engine.PlatformSessionXboxMultiplayerRoundEnd( f68_arg0, f68_arg1, f68_local3, f68_local5, f68_local1, f68_local2 )
			Lobby.Platform.XBOX.roundEndCounter[f68_local0] = Lobby.Platform.XBOX.roundEndCounter[f68_local0] + 1
			f0_local12( f68_arg0, f68_arg1 )
		end
	end
	Lobby.Platform.XBOX.roundStartSessionId[f68_local0] = nil
	Lobby.Platform.XBOX.playerSessionId[f68_local0] = nil
	Lobby.Platform.XBOX.roundStartTime[f68_local0] = 0
end

Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged = function ( f69_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged().\n" )
end

Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost = function ( f70_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost().\n" )
	if Dvar.platformSessionsDurangoAutoRTASubscription:get() == false then
		for f70_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			f0_local13( f70_local0 - 1, false )
		end
	end
end

Lobby.Platform.OnPlatformSuspend = function ( f71_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f71_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.PlatformSessionXboxRoundEnd( f71_local0 - 1, Enum.LobbyType.LOBBY_TYPE_GAME )
		end
	end
end

Lobby.Platform.OnPlatformResume = function ( f72_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "OnPlatformResume(), clear all session data.\n" )
		Engine.PlatformSessionPS4ClearData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		for f72_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			f0_local0( f72_local0 - 1, "" )
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxRTASubscription = function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3 )
	if Dvar.platformSessionsDurangoAutoRTASubscription:get() == false then
		local f73_local0 = f73_arg0 + 1
		if f73_arg1 == true and Lobby.Platform.XBOX.rtaSubscribe[f73_local0] == false and f73_arg3 == true then
			local f73_local1, f73_local2, f73_local3 = Engine.PlatformSessionXboxSubscribeToRTA( f73_arg0 )
			if f73_local1 == true then
				Lobby.Platform.XBOX.rtaSubscribe[f73_local0] = true
				Lobby.Platform.XBOX.sessionChangeToken[f73_local0] = f73_local2
				Lobby.Platform.XBOX.subscriptionLostToken[f73_local0] = f73_local3
			else
				Lobby.Platform.PlatformSessionXboxError( f73_arg0, f73_arg2, "PlatformSessionXboxEnableRTASubscription" )
				return 
			end
		end
		if Lobby.Platform.XBOX.rtaSubscribe[f73_local0] == false then
			return 
		end
	end
end

Lobby.Platform.PlatformSessionXboxDisabled = function ( f74_arg0, f74_arg1, f74_arg2, f74_arg3, f74_arg4 )
	local f74_local0 = f74_arg0 + 1
	if Lobby.Platform.XBOX.disabled[f74_local0] == true then
		return true
	elseif f74_arg3 == true and Lobby.Platform.XBOX.disabled[f74_local0] == nil and Engine.StorageIsFileReady( f74_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		local f74_local1 = Engine.StorageGetBuffer( f74_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f74_local1 then
			Lobby.Platform.XBOX.disabled[f74_local0] = false
			local f74_local2 = Engine.DvarInt( nil, "platformSessionDisableCount" )
			if f74_local2 > -1 and f74_local2 <= f74_local1.demonwareflags[15]:get() then
				Lobby.Platform.XBOX.disabled[f74_local0] = true
				return true
			end
		end
	end
	if Lobby.Platform.XBOX.sessionFailure[f74_local0] == true then
		if Lobby.Platform.XBOX.sessionFailureTime[f74_local0] == Lobby.Platform.DISABLE_PLATFORM_SESSIONS then
			return true
		elseif Lobby.Platform.XBOX.sessionFailureTime[f74_local0] < Engine.seconds() then
			Lobby.Platform.XBOX.sessionFailure[f74_local0] = false
			return false
		end
		return true
	end
end

Lobby.Platform.PlatformSessionXboxPumpController = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4, f75_arg5, f75_arg6 )
	local f75_local0 = f75_arg0 + 1
	Lobby.Platform.PlatformSessionXboxRTASubscription( f75_arg0, f75_arg1, f75_arg2, f75_arg4 )
	local f75_local1 = string.len( f0_local6( f75_arg0, f75_arg2 ) ) > 0
	local f75_local2 = f0_local8( f75_arg0, f75_arg2 )
	local f75_local3 = Lobby.Platform.XBOX.roundStart[f75_local0]
	local f75_local4 = Lobby.Platform.XBOX.roundEnd[f75_local0]
	if Lobby.Platform.PlatformSessionXboxDisabled( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4 ) then
		return 
	elseif f75_arg3 == false then
		if f75_local1 == true then
			Lobby.Platform.PlatformSessionXboxLeave( f75_arg0, f75_arg2 )
		end
		return 
	elseif f75_local1 == true and (f75_arg4 == false or f75_arg1 == false) then
		Lobby.Platform.PlatformSessionXboxLeave( f75_arg0, f75_arg2 )
		return 
	elseif f75_arg4 == false or f75_arg1 == false then
		return 
	elseif f75_local1 == false and f75_local2 == true then
		f0_local7( f75_arg0, f75_arg2, false )
	end
	if f75_local1 == true then
		if f75_arg2 == Enum.LobbyType.LOBBY_TYPE_GAME then
			if f75_local2 == true then
				local f75_local5, f75_local6 = Lobby.Platform.PlatformSessionXboxGenerateSessionId( f75_arg2 )
				if f75_local5 == true and f75_local6 ~= f0_local6( f75_arg0, f75_arg2 ) then
					Lobby.Platform.PlatformSessionXboxLeave( f75_arg0, f75_arg2 )
				end
				f0_local7( f75_arg0, f75_arg2, false )
				return 
			elseif f75_local4 == true then
				Lobby.Platform.PlatformSessionXboxRoundEnd( f75_arg0, f75_arg2 )
				return 
			elseif f75_local3 == true then
				Lobby.Platform.PlatformSessionXboxRoundStart( f75_arg0, f75_arg2 )
				return 
			end
		end
		if true == Dvar.platformSessionPartyPrivacy:get() and f75_arg0 == f75_arg6 and f75_arg2 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
			local f75_local5 = Engine.GetPartyPrivacy()
			local f75_local6 = f0_local6( f75_arg0, f75_arg2 )
			if Lobby.Platform.XBOX.sessionClosed[f75_local0] ~= f75_local5 then
				Lobby.Platform.PlatformSessionXboxSetSessionClosed( f75_arg0, f75_arg2, f75_local6, f75_local5 )
				return 
			elseif Lobby.Platform.XBOX.joinRestriction[f75_local0] ~= f75_local5 then
				Lobby.Platform.PlatformSessionXboxSetJoinRestriction( f75_arg0, f75_arg2, f75_local6, f75_local5 )
				return 
			end
			return 
		end
		return 
	end
	Lobby.Platform.PlatformSessionXboxCreate( f75_arg0, f75_arg2 )
end

Lobby.Platform.PlatformSessionXboxPump = function ()
	if Lobby.Platform.XBOX.taskInProgress == true or true == Engine.IsRequestingJoin() or Lobby.ProcessQueue.IsQueueEmpty() == false or true == Engine.FriendsIsTaskInProgress() then
		Lobby.Platform.XBOX.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalDurango:get()
		return 
	elseif Lobby.Platform.XBOX.updateTime > Engine.milliseconds() then
		return 
	end
	Lobby.Platform.XBOX.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalDurango:get()
	local f76_local0 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	for f76_local1 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
		local f76_local4 = f76_local1 - 1
		local f76_local5 = Engine.PlatformSessionXboxIsLiveContextForControllerReadyRaw( f76_local4 )
		local f76_local6 = Engine.IsControllerBeingUsed( f76_local4 )
		if f76_local5 == true then
			for f76_local7 = Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyType.LOBBY_TYPE_PRIVATE, -1 do
				local f76_local10 = Engine.IsLobbyActive( f76_local7 )
				local f76_local11 = Engine.IsLobbyHost( f76_local7 )
				local f76_local12
				if f76_local11 then
					f76_local12 = Engine.GetLobbyHostControllerIndex( f76_local7 )
					if not f76_local12 then
					
					else
						Lobby.Platform.PlatformSessionXboxPumpController( f76_local4, f76_local6, f76_local7, f76_local0, f76_local10, f76_local11, f76_local12 )
						if Lobby.Platform.XBOX.taskInProgress == true then
							return 
						end
					end
				end
				f76_local12 = LuaEnums.INVALID_CONTROLLER_PORT
			end
		elseif Lobby.Platform.XBOX.lastSignedInState[f76_local1] == true then
			f0_local13( f76_local4, true )
		end
		Lobby.Platform.XBOX.lastSignedInState[f76_local1] = f76_local5
	end
end

Lobby.Platform.InviteFailed = function ( f77_arg0 )
	Engine.LuiVM_Event( "open_toaster_popup", {
		isError = true,
		controller = f77_arg0.controller,
		xuid = f77_arg0.xuid,
		gamertag = f77_arg0.gamertag,
		immediate = true
	} )
end

Lobby.Platform.InviteComplete = function ( f78_arg0, f78_arg1, f78_arg2 )
	local f78_local0 = f78_arg1.controller
	local f78_local1 = f78_arg1.xuid
	local f78_local2 = f78_arg1.gamertag
	if f78_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		return false
	elseif f78_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		Engine.LuiVM_Event( "open_toaster_popup", {
			isError = false,
			controller = f78_local0,
			xuid = f78_local1,
			gamertag = f78_local2,
			immediate = true
		} )
	elseif f78_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f78_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		if true == Dvar.platformSessionShowErrorCodes:get() then
			f78_arg1.gamertag = f78_arg1.gamertag .. " - " .. returnCodeHex
		end
		Lobby.Platform.InviteFailed( f78_arg1 )
	end
	return true
end

Lobby.Platform.Invite = function ( f79_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() == false and Lobby.Platform.PlatformSessionDurangoEnabled() == false then
		return 
	end
	local f79_local0 = f79_arg0.controller
	local f79_local1 = f79_arg0.xuid
	local f79_local2 = f79_arg0.gamertag
	Dvar.platformSessionOrbisInviteMessage:set( Engine.LocalizeWithoutLocsMarkers( "MENU_GAME_INVITE_MESSAGE", Engine.GetGamertagForController( f79_local0 ) ) )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if Lobby.Platform.PS4GetSessionId( f79_local0 ) == "" then
			Lobby.Platform.InviteFailed( f79_arg0 )
			return 
		end
		local f79_local3 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.InviteComplete, f79_arg0 )
		if Engine.PlatformSessionPS4Invite( f79_local3, f79_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f79_local1, f79_local2, Lobby.Platform.PS4GetSessionId( f79_local0 ) ) == false then
			Lobby.Platform.InviteFailed( f79_arg0 )
			Lobby.ProcessQueue.UnRegisterEventHandler( f79_local3 )
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		local f79_local3 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.InviteComplete, f79_arg0 )
		if Engine.PlatformSessionXboxInvite( f79_local3, f79_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f79_local1, f79_local2 ) == false then
			Lobby.Platform.InviteFailed( f79_arg0 )
			Lobby.ProcessQueue.UnRegisterEventHandler( f79_local3 )
		end
	end
end

Lobby.Platform.SetModelValue = function ( f80_arg0, f80_arg1 )
	local f80_local0 = Engine.CreateModel( Engine.GetGlobalModel(), f80_arg0, true )
	if f80_local0 == nil then
		return 
	else
		Engine.SetModelValue( f80_local0, f80_arg1 )
	end
end

Lobby.Platform.GetModelValue = function ( f81_arg0, f81_arg1 )
	local f81_local0 = Engine.GetModel( Engine.GetGlobalModel(), f81_arg0 )
	if f81_local0 ~= nil then
		local f81_local1 = Engine.GetModelValue( f81_local0, value )
		if f81_local1 ~= nil then
			Engine.UnsubscribeAndFreeModel( f81_local0 )
			return f81_local1
		end
	end
	return f81_arg1
end

Lobby.Platform.SaveState = function ()
	if Engine.IsDedicatedServer() == true or true == LuaUtils.isPC then
		return 
	elseif true == LuaUtils.isPS4 then
		Lobby.Platform.SetModelValue( "platformSession.taskInProgress", Lobby.Platform.PS4.taskInProgress )
		for f82_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.SetModelValue( "platformSession.sessionId." .. tostring( f82_local0 ), Lobby.Platform.PS4.sessionId[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.lobbyId." .. tostring( f82_local0 ), Lobby.Platform.PS4.lobbyId[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.changed." .. tostring( f82_local0 ), Lobby.Platform.PS4.changed[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailure." .. tostring( f82_local0 ), Lobby.Platform.PS4.sessionFailure[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailureTime." .. tostring( f82_local0 ), Lobby.Platform.PS4.sessionFailureTime[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.lastSignedInState." .. tostring( f82_local0 ), Lobby.Platform.PS4.lastSignedInState[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.lockFlag." .. tostring( f82_local0 ), Lobby.Platform.PS4.lockFlag[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionTypeFlag." .. tostring( f82_local0 ), Lobby.Platform.PS4.sessionTypeFlag[f82_local0] )
		end
	elseif true == LuaUtils.isXbox then
		Lobby.Platform.SetModelValue( "platformSession.taskInProgress", Lobby.Platform.XBOX.taskInProgress )
		for f82_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.SetModelValue( "platformSession.rtaSubscribe." .. tostring( f82_local0 ), Lobby.Platform.XBOX.rtaSubscribe[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionChangeToken." .. tostring( f82_local0 ), Lobby.Platform.XBOX.sessionChangeToken[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.subscriptionLostToken." .. tostring( f82_local0 ), Lobby.Platform.XBOX.subscriptionLostToken[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailure." .. tostring( f82_local0 ), Lobby.Platform.XBOX.sessionFailure[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailureTime." .. tostring( f82_local0 ), Lobby.Platform.XBOX.sessionFailureTime[f82_local0] )
			for f82_local3 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
				local f82_local6 = f82_local3 + 1
				Lobby.Platform.SetModelValue( "platformSession.templateName." .. tostring( f82_local0 ) .. "." .. tostring( f82_local6 ), Lobby.Platform.XBOX.templateName[f82_local0][f82_local6] )
				Lobby.Platform.SetModelValue( "platformSession.sessionId." .. tostring( f82_local0 ) .. "." .. tostring( f82_local6 ), Lobby.Platform.XBOX.sessionId[f82_local0][f82_local6] )
				Lobby.Platform.SetModelValue( "platformSession.changed." .. tostring( f82_local0 ) .. "." .. tostring( f82_local6 ), Lobby.Platform.XBOX.changed[f82_local0][f82_local6] )
			end
			Lobby.Platform.SetModelValue( "platformSession.lastSignedInState." .. tostring( f82_local0 ), Lobby.Platform.XBOX.lastSignedInState[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundStart." .. tostring( f82_local0 ), Lobby.Platform.XBOX.roundStart[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundStartSessionId." .. tostring( f82_local0 ), Lobby.Platform.XBOX.roundStartSessionId[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundEnd." .. tostring( f82_local0 ), Lobby.Platform.XBOX.roundEnd[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.playerSessionId." .. tostring( f82_local0 ), Lobby.Platform.XBOX.playerSessionId[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundStartTime." .. tostring( f82_local0 ), Lobby.Platform.XBOX.roundStartTime[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundStartCounter." .. tostring( f82_local0 ), Lobby.Platform.XBOX.roundStartCounter[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundEndCounter." .. tostring( f82_local0 ), Lobby.Platform.XBOX.roundEndCounter[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionClosed." .. tostring( f82_local0 ), Lobby.Platform.XBOX.sessionClosed[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.joinRestriction." .. tostring( f82_local0 ), Lobby.Platform.XBOX.joinRestriction[f82_local0] )
			Lobby.Platform.SetModelValue( "platformSession.visibility." .. tostring( f82_local0 ), Lobby.Platform.XBOX.visibility[f82_local0] )
		end
	end
end

Lobby.Platform.OnComError = function ( f83_arg0 )
	local f83_local0 = f83_arg0.errorCode
	if f83_arg0.isInCleanup then
		return 
	elseif f83_local0 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
		Lobby.Platform.SaveState()
	end
end

Lobby.Platform.OnPreExecFFOTD = function ()
	Lobby.Platform.SaveState()
end

Lobby.Platform.OnPostExecFFOTD = function ()
	
end

Lobby.Platform.Pump = function ()
	if Engine.IsDedicatedServer() then
		return 
	end
	Lobby.Platform.TRCPump()
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Lobby.Platform.PlatformSessionPS4Pump()
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		Lobby.Platform.PlatformSessionXboxPump()
	end
	Lobby.Platform.PS4PlayTogetherPump()
end

Lobby.Platform.Init = function ()
	if Engine.IsDedicatedServer() == true or true == LuaUtils.isPC then
		return 
	elseif true == LuaUtils.isPS4 then
		Lobby.Platform.PS4.taskInProgress = Lobby.Platform.GetModelValue( "platformSession.taskInProgress", false )
		for f87_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.PS4.sessionFailure[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionFailure." .. tostring( f87_local0 ), false )
			Lobby.Platform.PS4.sessionFailureTime[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionFailureTime." .. tostring( f87_local0 ), 0 )
			Lobby.Platform.PS4.sessionId[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionId." .. tostring( f87_local0 ), "" )
			Lobby.Platform.PS4.lobbyId[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.lobbyId." .. tostring( f87_local0 ), 0 )
			Lobby.Platform.PS4.changed[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.changed." .. tostring( f87_local0 ), false )
			Lobby.Platform.PS4.lastSignedInState[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.lastSignedInState." .. tostring( f87_local0 ), false )
			Lobby.Platform.PS4.lockFlag[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.lockFlag." .. tostring( f87_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			Lobby.Platform.PS4.sessionTypeFlag[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionTypeFlag." .. tostring( f87_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
		end
	elseif true == LuaUtils.isXbox then
		Lobby.Platform.XBOX.taskInProgress = Lobby.Platform.GetModelValue( "platformSession.taskInProgress", false )
		for f87_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f87_local3 = f87_local0 - 1
			Lobby.Platform.XBOX.sessionFailure[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionFailure." .. tostring( f87_local0 ), false )
			Lobby.Platform.XBOX.sessionFailureTime[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionFailureTime." .. tostring( f87_local0 ), 0 )
			Lobby.Platform.XBOX.rtaSubscribe[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.rtaSubscribe." .. tostring( f87_local0 ), false )
			Lobby.Platform.XBOX.sessionChangeToken[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionChangeToken." .. tostring( f87_local0 ), nil )
			Lobby.Platform.XBOX.subscriptionLostToken[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.subscriptionLostToken." .. tostring( f87_local0 ), nil )
			Lobby.Platform.XBOX.templateName[f87_local0] = {}
			Lobby.Platform.XBOX.sessionId[f87_local0] = {}
			Lobby.Platform.XBOX.changed[f87_local0] = {}
			Lobby.Platform.XBOX.lastSignedInState[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.lastSignedInState." .. tostring( f87_local0 ), false )
			Lobby.Platform.XBOX.roundStart[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.roundStart." .. tostring( f87_local0 ), false )
			Lobby.Platform.XBOX.roundStartSessionId[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.roundStartSessionId." .. tostring( f87_local0 ), "" )
			Lobby.Platform.XBOX.roundEnd[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.roundEnd." .. tostring( f87_local0 ), false )
			Lobby.Platform.XBOX.playerSessionId[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.playerSessionId." .. tostring( f87_local0 ), nil )
			Lobby.Platform.XBOX.roundStartTime[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.roundStartTime." .. tostring( f87_local0 ), 0 )
			Lobby.Platform.XBOX.roundStartCounter[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.roundStartCounter." .. tostring( f87_local0 ), 0 )
			Lobby.Platform.XBOX.roundEndCounter[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.roundEndCounter." .. tostring( f87_local0 ), 0 )
			Lobby.Platform.XBOX.sessionClosed[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionClosed." .. tostring( f87_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			Lobby.Platform.XBOX.joinRestriction[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.joinRestriction." .. tostring( f87_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			Lobby.Platform.XBOX.visibility[f87_local0] = Lobby.Platform.GetModelValue( "platformSession.visibility." .. tostring( f87_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			f0_local3( f87_local3, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Lobby.Platform.GetModelValue( "platformSession.templateName." .. tostring( f87_local0 ) .. "." .. tostring( Enum.LobbyType.LOBBY_TYPE_PRIVATE + 1 ), Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE.PRIVATE_LOBBY ) )
			f0_local3( f87_local3, Enum.LobbyType.LOBBY_TYPE_GAME, Lobby.Platform.GetModelValue( "platformSession.templateName." .. tostring( f87_local0 ) .. "." .. tostring( Enum.LobbyType.LOBBY_TYPE_GAME + 1 ), Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE.GAME_LOBBY ) )
			for f87_local4 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
				local f87_local7 = f87_local4 + 1
				f0_local5( f87_local3, f87_local4, Lobby.Platform.GetModelValue( "platformSession.sessionId." .. tostring( f87_local0 ) .. "." .. tostring( f87_local7 ), "" ) )
				f0_local7( f87_local3, f87_local4, Lobby.Platform.GetModelValue( "platformSession.changed." .. tostring( f87_local0 ) .. "." .. tostring( f87_local7 ), false ) )
			end
		end
	end
end

Lobby.Platform.playTogether = {}
Lobby.Platform.PS4ProcessPlayTogetherEvent = function ( f88_arg0 )
	local f88_local0 = f88_arg0.controller
	local f88_local1 = f88_arg0.xuid
	local f88_local2 = f88_arg0.gamertag
	local f88_local3 = Engine.GetLobbyUIScreen()
	local f88_local4 = ""
	local f88_local5 = nil
	Lobby.Platform.playTogether.monitor = false
	Lobby.Platform.playTogether.available = true
	Lobby.Platform.playTogether.data = f88_arg0
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		local f88_local6 = Lobby.Process.ReloadPrivateLobby( f88_local0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		local f88_local7 = Lobby.ProcessPlatform.PlayTogetherBeginPlay( f88_local0, f88_arg0.playTogetherList )
		Lobby.Process.AddActions( f88_local6.tail, f88_local7.head )
		return f88_local6
	elseif f88_local3 == LobbyData.UITargets.UI_MAIN.id then
		Lobby.Platform.playTogether.monitor = true
		Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		return nil
	elseif Engine.IsInGame() then
		return Lobby.ProcessPlatform.PlayTogetherBeginPlay( f88_local0, f88_arg0.playTogetherList )
	else
		return Lobby.ProcessPlatform.PlayTogetherBeginPlay( f88_local0, f88_arg0.playTogetherList )
	end
end

Lobby.Platform.PS4PlayTogetherPump = function ()
	if Engine.IsDedicatedServer() == true or true ~= LuaUtils.isPS4 then
		return 
	elseif true ~= Lobby.Platform.playTogether.monitor then
		return 
	end
	local f89_local0 = Lobby.Platform.playTogether.data.controller
	if Engine.GetLobbyUIScreen() ~= LobbyData.UITargets.UI_MAIN.id then
		if true == Lobby.Platform.PS4.taskInProgress then
			return 
		elseif string.len( Lobby.Platform.PS4GetSessionId( f89_local0 ) ) > 0 then
			Lobby.Platform.playTogether.monitor = false
			Lobby.ProcessQueue.AddToQueue( "PlayTogetherBeginPlay", Lobby.ProcessPlatform.SendPlayTogetherInvites( f89_local0, Lobby.Platform.playTogether.data.playTogetherList ) )
			Engine.PlatformSessionClearPlayTogetherInfo()
		end
	end
	if Engine.GetModel( Engine.GetModelForController( Lobby.Platform.playTogether.data.controller ), "SystemOverlay_MessageDialog.buttonPrompts" ) ~= nil then
		Lobby.Platform.playTogether.monitor = false
	end
end

Lobby.Platform.Init()
