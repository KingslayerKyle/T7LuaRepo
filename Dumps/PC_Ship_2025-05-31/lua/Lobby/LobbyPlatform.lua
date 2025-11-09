require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Lobby.Process.LobbyProcessPlatform" )
require( "lua.Shared.CoDShared" )
require( "lua.Shared.LobbyData" )

Lobby.Platform = {}
Lobby.Platform.LobbyJoinableStrings = {}
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_NOT_IN_LOBBY] = "PRESENCE_NOT_JOINABLE"
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_YES] = "PRESENCE_JOINABLE"
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY] = "PRESENCE_NOT_JOINABLE_PARTY_PRIVACY_IS_FRIENDS_ONLY"
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_PARTY_PRIVACY_INVITE_ONLY] = "PRESENCE_NOT_JOINABLE_PARTY_PRIVACY_IS_INVITE_ONLY"
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_PARTY_PRIVACY_CLOSED] = "PRESENCE_NOT_JOINABLE_PARTY_PRIVACY_IS_CLOSED"
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_PARTY_FULL] = "PRESENCE_NOT_JOINABLE_PARTY_IS_FULL"
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_GAME_FULL] = "PRESENCE_NOT_JOINABLE_GAME_IS_FULL"
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_PLAYING_LOCAL] = "PRESENCE_NOT_JOINABLE_GAME_IS_OFFLINE"
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_GAME_PAUSED] = "PRESENCE_NOT_JOINABLE_GAME_IS_PAUSED"
Lobby.Platform.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO] = "PRESENCE_NOT_JOINABLE"
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
Lobby.Platform.Mods = {
	updateTime = 0
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

Lobby.Platform.PlatformSessionPCEnabled = function ()
	if Engine.IsDedicatedServer() then
		return false
	else
		return LuaUtils.isPC
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
	local f6_local0
	if Lobby.Platform.IsOnlineGame() == true and not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL ) then
		f6_local0 = not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MANUAL_PLAYLIST )
	else
		f6_local0 = false
	end
	return f6_local0
end

Lobby.Platform.IsHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

Lobby.Platform.OnInit = function ( f8_arg0 )
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

Lobby.Platform.OnSessionStart = function ( f9_arg0 )
	Lobby.Platform.PlatformSessionDirty( f9_arg0.lobbyType )
end

Lobby.Platform.OnSessionEnd = function ( f10_arg0 )
	Lobby.Platform.PlatformSessionDirty( f10_arg0.lobbyType )
end

Lobby.Platform.OnMatchStart = function ( f11_arg0 )
	local f11_local0 = f11_arg0.lobbyModule
	local f11_local1 = f11_arg0.lobbyType
	local f11_local2 = f11_arg0.lobbyMode
	if Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f11_local3 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.roundStart[f11_local3] = true
		end
	end
	if LuaUtils.isXbox then
		Engine.SetDvar( "xblive_rta_enabled", 0 )
	end
end

Lobby.Platform.OnMatchEnd = function ( f12_arg0 )
	local f12_local0 = f12_arg0.lobbyModule
	local f12_local1 = f12_arg0.lobbyType
	local f12_local2 = f12_arg0.lobbyMode
	if LuaUtils.isPS4 == true and f12_arg0.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() then
		for f12_local3 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f12_local6 = f12_local3 - 1
			if Engine.NotifyPsPlusAsyncMultiplay ~= nil then
				Engine.NotifyPsPlusAsyncMultiplay( f12_local6 )
			end
		end
	end
	if Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f12_local3 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.roundEnd[f12_local3] = true
		end
	end
	if LuaUtils.isXbox then
		Engine.SetDvar( "xblive_rta_enabled", 1 )
	end
end

Lobby.Platform.OnPlatformPlayTogether = function ( f13_arg0 )
	if Dvar.platformSessionsOrbisPlayTogetherEnabled:exists() == false or Dvar.platformSessionsOrbisPlayTogetherEnabled:get() == false then
		return 
	end
	local f13_local0 = f13_arg0.controller
	if Lobby.Timer.LobbyIsLocked() then
		LuaUtils.UI_ShowErrorMessageDialog( f13_local0, "MENU_CANNOT_JOIN_LOBBY_LOCKED", "MENU_MATCH_LOCKED" )
		return 
	elseif f13_arg0.error == true then
		local f13_local1 = f13_arg0.debugInfo
		return 
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if not Engine.IsRunningUILevel() then
			LobbyVM.InGameJoin( {
				controller = f13_local0,
				xuid = 0,
				platform = true,
				platformData = f13_arg0,
				playTogether = true,
				migrating = not CoDShared.QuitGame( f13_local0 )
			}, true )
			return 
		end
		local f13_local1 = Lobby.Platform.PS4ProcessPlayTogetherEvent( f13_arg0 )
		if f13_local1 ~= nil then
			local f13_local2 = Lobby.Process.Recover( f13_local0, LobbyData.UITargets.UI_MODESELECT.id )
			Lobby.Process.AppendProcess( f13_local2, f13_local1 )
			Lobby.ProcessQueue.AddToQueue( "OnPlatformPlayTogether", f13_local2 )
		end
	end
end

Lobby.Platform.OnPlatformSessionDataUpdate = function ( f14_arg0 )
	local f14_local0 = f14_arg0.lobbyModule
	local f14_local1 = f14_arg0.lobbyType
	local f14_local2 = f14_arg0.lobbyMode
	local f14_local3 = f14_arg0.gamertag
	local f14_local4 = f14_arg0.sessionId
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "OnPlatformSessionDataUpdate event occurred, sessionId: '" .. f14_local4 .. "', gamertag: " .. f14_local3 .. ".\n" )
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "OnPlatformSessionDataUpdate event occurred, sessionId: '" .. f14_local4 .. "', gamertag: " .. f14_local3 .. ".\n" )
	end
	Lobby.Platform.PlatformSessionDirty( f14_local1 )
end

Lobby.Platform.OnPlatformJoinOrbis = function ( f15_arg0 )
	local f15_local0 = f15_arg0.forController
	local f15_local1 = f15_arg0.forXuid
	local f15_local2 = f15_arg0.forGamertag
	local f15_local3 = f15_arg0.invite
	local f15_local4 = f15_arg0.invitationId
	local f15_local5 = f15_arg0.sessionId
	local f15_local6 = f15_local0
	if not Engine.IsRunningUILevel() then
		local f15_local7 = {
			controller = f15_local6,
			xuid = 0
		}
		local f15_local8
		if f15_local3 then
			f15_local8 = Enum.JoinType.JOIN_TYPE_INVITE
			if not f15_local8 then
			
			else
				f15_local7.joinType = f15_local8
				f15_local7.platform = true
				f15_local7.platformData = f15_arg0
				f15_local7.migrating = not CoDShared.QuitGame( f15_local6 )
				LobbyVM.InGameJoin( f15_local7, true )
				return 
			end
		end
		f15_local8 = Enum.JoinType.JOIN_TYPE_FRIEND
	else
		if f15_local3 == true then
			Lobby.ProcessQueue.AddToQueue( "PS4AcceptInvite", Lobby.ProcessPlatform.PS4AcceptInvite( f15_local0, f15_local1, f15_local4, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
		else
			Lobby.ProcessQueue.AddToQueue( "PS4SessionJoin", Lobby.ProcessPlatform.PS4SessionJoin( f15_local0, f15_local5, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT ) )
		end
	end
end

Lobby.Platform.InGamePlatformJoinOrbis = function ( f16_arg0 )
	local f16_local0 = f16_arg0.forController
	local f16_local1 = f16_arg0.forXuid
	local f16_local2 = f16_arg0.forGamertag
	local f16_local3 = f16_arg0.invite
	local f16_local4 = f16_arg0.invitationId
	local f16_local5 = f16_arg0.sessionId
	local f16_local6 = f16_local0
	if f16_local3 == true then
		return Lobby.ProcessPlatform.PS4AcceptInvite( f16_local0, f16_local1, f16_local4, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	else
		return Lobby.ProcessPlatform.PS4SessionJoin( f16_local0, f16_local5, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
end

Lobby.Platform.OnPlatformJoinDurango = function ( f17_arg0 )
	local f17_local0 = f17_arg0.invite
	local f17_local1 = 0
	local f17_local2 = 0
	if f17_local0 == true then
		f17_local2 = f17_arg0.senderXuid
		f17_local1 = Engine.GetControllerForXuid( f17_arg0.invitedXuid )
	else
		f17_local2 = f17_arg0.joineeXuid
		f17_local1 = Engine.GetControllerForXuid( f17_arg0.joinerXuid )
	end
	if f17_local1 == LuaEnums.INVALID_CONTROLLER_PORT then
		Engine.Durango_TryToSetXUIDToGPad( f17_arg0.invitedXuid )
		return nil
	elseif Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f17_local2 ) or Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f17_local2 ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of.\n" )
		Engine.PlatformSessionClearInviteJoinInfo()
		return nil
	elseif not Engine.IsRunningUILevel() then
		local f17_local3 = {
			controller = f17_local1,
			xuid = f17_local2
		}
		local f17_local4
		if f17_local0 then
			f17_local4 = Enum.JoinType.JOIN_TYPE_INVITE
			if not f17_local4 then
			
			else
				f17_local3.joinType = f17_local4
				f17_local3.platform = true
				f17_local3.platformData = f17_arg0
				f17_local3.migrating = not CoDShared.QuitGame( f17_local1 )
				LobbyVM.InGameJoin( f17_local3, true )
				return nil
			end
		end
		f17_local4 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f17_arg0.invite == true then
		local f17_local5 = Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f17_arg0.invitedXuid ), f17_arg0.senderXuid, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	else
		local f17_local5 = Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f17_arg0.joinerXuid ), f17_arg0.joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
	return process
end

Lobby.Platform.OnPlatformJoinPC = function ( f18_arg0 )
	return Lobby.ProcessPlatform.PCJoin( Engine.GetControllerForXuid( f18_arg0.joinerXuid ), f18_arg0.joineeXuid, f18_arg0.friendXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
end

Lobby.Platform.PlatformJoin = function ( f19_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		local f19_local0 = Lobby.Platform.OnPlatformJoinOrbis( f19_arg0 )
		if invite == true then
			Lobby.ProcessQueue.AddToQueue( "PS4AcceptInvite", f19_local0 )
		else
			Lobby.ProcessQueue.AddToQueue( "PS4SessionJoin", f19_local0 )
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		local f19_local0 = Lobby.Platform.OnPlatformJoinDurango( f19_arg0 )
		if invite == true then
			Lobby.ProcessQueue.AddToQueue( "XboxAcceptInvite", f19_local0 )
		else
			Lobby.ProcessQueue.AddToQueue( "XboxSessionJoin", f19_local0 )
		end
	elseif Lobby.Platform.PlatformSessionPCEnabled() then
		Lobby.ProcessQueue.AddToQueue( "PCSessionJoin", Lobby.Platform.OnPlatformJoinPC( f19_arg0 ) )
	end
end

Lobby.Platform.GetAutoJoinProcess = function ( f20_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		return Lobby.Platform.OnPlatformJoinOrbis( f20_arg0 )
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		return Lobby.Platform.OnPlatformJoinDurango( f20_arg0 )
	elseif Lobby.Platform.PlatformSessionPCEnabled() then
		return Lobby.Platform.OnPlatformJoinPC( f20_arg0 )
	else
		
	end
end

Lobby.Platform.InGamePlatformJoinDurango = function ( f21_arg0 )
	if f21_arg0.invite == true then
		return Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f21_arg0.invitedXuid ), f21_arg0.senderXuid, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	else
		return Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f21_arg0.joinerXuid ), f21_arg0.joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
end

Lobby.Platform.OnPlatformJoin = function ( f22_arg0 )
	if LuaUtils.isPS4 or LuaUtils.isXbox then
		if Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmInitialStillDownloading() or Engine.IsMpInitialStillDownloading() then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CANNOT_JOIN_DURING_INSTALL" )
			return 
		elseif Engine.IsInGame() then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CANNOT_JOIN_MUST_QUIT_GAME_FIRST" )
			return 
		end
	end
	if Lobby.Timer.LobbyIsLocked() then
		LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CANNOT_JOIN_LOBBY_LOCKED", "MENU_MATCH_LOCKED" )
		return 
	elseif LuaUtils.isPC and f22_arg0.joinable ~= true then
		local f22_local0 = nil
		if f22_arg0.joinError then
			f22_local0 = Lobby.Platform.LobbyJoinableStrings[f22_arg0.joinError]
		end
		if not f22_local0 then
			f22_local0 = "PRESENCE_NOT_JOINABLE"
		end
		LuaUtils.UI_ShowErrorMessageDialog( controller, f22_local0 )
		return 
	elseif f22_arg0.error == true then
		local f22_local0 = f22_arg0.debugInfo
		return 
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	if not f22_arg0.controller then
		f22_arg0.controller = Engine.GetControllerForXuid( f22_arg0.joinerXuid )
	end
	local f22_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f22_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.LobbyIsPlayerInLobby( f22_local0, f22_arg0.joineeXuid ) == true then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to AutoJoin lobby we are already part of\n" )
		return 
	end
	Lobby.Platform.AutoJoinData = f22_arg0
end

Lobby.Platform.PlatformSessionDirty = function ( f23_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if f23_arg0 ~= Enum.LobbyType.LOBBY_TYPE_PRIVATE then
			return 
		end
		for f23_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.PS4.changed[f23_local0] = true
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f23_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.changed[f23_local0][f23_arg0 + 1] = true
		end
	end
end

Lobby.Platform.TRCPump = function ()
	if LuaUtils.isPS4 == false then
		return 
	elseif Engine.GetLuaCodeVersion() < 4 then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		for f24_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f24_local3 = f24_local0 - 1
			if Engine.IsControllerBeingUsed( f24_local3 ) then
				Engine.NotifyPsPlus( f24_local3 )
				Engine.DisplayChatRestrictionForUser( f24_local3 )
				Engine.DisplayContentRestrictionForUser( f24_local3 )
			end
		end
	end
end

local f0_local0 = function ( f25_arg0, f25_arg1 )
	Lobby.Platform.PS4.sessionId[f25_arg0 + 1] = f25_arg1
	Lobby.Platform.PS4.lobbyId[f25_arg0 + 1] = Engine.GetLobbyLobbyID( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	Engine.PlatformSessionSetDebugInfo( f25_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f25_arg1 )
end

Lobby.Platform.PS4GetSessionId = function ( f26_arg0 )
	return Lobby.Platform.PS4.sessionId[f26_arg0 + 1]
end

local f0_local1 = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
	Lobby.Platform.PS4.sessionFailure[f27_arg0 + 1] = f27_arg2
	Lobby.Platform.PS4.sessionFailureTime[f27_arg0 + 1] = f27_arg3
end

local f0_local2 = function ( f28_arg0 )
	local f28_local0 = f28_arg0 + 1
	Lobby.Platform.PS4.sessionId[f28_local0] = ""
	Lobby.Platform.PS4.lobbyId[f28_local0] = 0
	Lobby.Platform.PS4.changed[f28_local0] = 0
	Lobby.Platform.PS4.sessionFailure[f28_local0] = false
	Lobby.Platform.PS4.sessionFailureTime[f28_local0] = 0
	Lobby.Platform.PS4.lastSignedInState[f28_local0] = false
	Engine.PlatformSessionSetDebugInfo( f28_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, "" )
end

Lobby.Platform.PlatformSessionPS4Error = function ( f29_arg0, f29_arg1 )
	local f29_local0 = Dvar.platformSessionsOrbis:get()
	Lobby.Platform.PS4.taskInProgress = false
	Engine.PlatformSessionCancelTasks()
	if f29_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_NONFATAL then
		f0_local1( f29_arg0, true, Engine.seconds() + Engine.DvarInt( nil, Lobby.Platform.DISABLE_PLATFORM_SESSIONS ) )
	elseif f29_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_FATAL then
		if Engine.IsInGame() == true then
			return 
		end
		local f29_local1 = LobbyData.GetCurrentMenuTarget()
		if f29_local1.id == LobbyData.UITargets.UI_MAIN.id then
			return 
		end
		local f29_local2 = {
			controller = f29_arg0,
			signoutUsers = false
		}
		LobbyVM.ExecuteLobbyVMRequest( LuaEnums.LOBBYVM_REQUEST.FORCE_LOCAL_MODE )
		Engine.LobbyLaunchClear()
		Lobby.ProcessQueue.ClearQueue()
		LobbyVM.ErrorShutdown( f29_local2 )
		LobbyVM.ShutdownCleanup( f29_local2 )
		if Dvar.platformSessionShowErrorCodes:get() == true then
			LuaUtils.UI_ShowErrorMessageDialog( f29_arg0, "Platform Session Error: " .. f29_arg1 )
		else
			LuaUtils.UI_ShowErrorMessageDialog( f29_arg0, "PLATFORM_PLATFORM_SESSION_ERROR" )
		end
		return 
	end
end

Lobby.Platform.PlatformSessionPS4GetLockFlag = function ( f30_arg0 )
	local f30_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	if f30_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f30_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	elseif f30_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f30_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	elseif f30_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f30_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	elseif f30_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f30_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.LOCKED
	end
	return f30_local0
end

Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag = function ( f31_arg0 )
	local f31_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	if f31_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f31_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	elseif f31_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f31_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	elseif f31_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f31_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PRIVATE
	elseif f31_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f31_local0 = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	end
	return f31_local0
end

Lobby.Platform.PlatformSessionPS4CreateComplete = function ( f32_arg0, f32_arg1, f32_arg2 )
	local f32_local0 = f32_arg1.controller
	local f32_local1 = f32_arg2.isError
	local f32_local2 = f32_arg2.returnCode
	local f32_local3 = f32_arg2.returnCodeHex
	if f32_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f32_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f32_local1 == false then
			f0_local0( f32_local0, f32_arg2.sessionId )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete, we have successfully created session id: '" .. Lobby.Platform.PS4GetSessionId( f32_local0 ) .. "'.\n" )
			if f32_local0 == Engine.GetPrimaryController() and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete, we are host of private session, setting session data.\n" )
				Engine.PlatformSessionPS4SetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Lobby.Platform.PS4GetSessionId( f32_local0 ) )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed: " .. f32_local3 .. "\n" )
		end
	elseif f32_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f32_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed: " .. f32_local3 .. "\n" )
		f32_local1 = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if f32_local1 == true then
		Lobby.Platform.PlatformSessionPS4Error( f32_local0, f32_local3 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Create = function ( f33_arg0, f33_arg1, f33_arg2 )
	Lobby.Platform.PS4.taskInProgress = true
	Dvar.platformSessionOrbisName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_PLATFORM_SESSION_NAME" ) )
	Dvar.platformSessionOrbisStatus:set( "" )
	Dvar.platformSessionOrbisImgPath:set( "" )
	Dvar.platformSessionOrbisImg:set( "platform_session.png" )
	local f33_local0 = Engine.GetPartyPrivacy()
	local f33_local1 = Lobby.Platform.PlatformSessionPS4GetLockFlag( f33_local0 )
	Lobby.Platform.PS4.lockFlag[f33_arg0 + 1] = f33_local0
	Dvar.platformSessionOrbisLockFlag:set( f33_local1 )
	local f33_local2 = Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag( f33_local0 )
	Lobby.Platform.PS4.sessionTypeFlag[f33_arg0 + 1] = f33_local0
	Dvar.platformSessionOrbisSessionTypeFlag:set( f33_local2 )
	local f33_local3 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4CreateComplete, {
		controller = f33_arg0,
		lobbyType = f33_arg1,
		maxSlot = f33_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create started.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionCreateFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f33_local3,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Create( f33_local3, f33_arg0, f33_arg1, f33_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f33_local3,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionJoinCompletePS4 = function ( f34_arg0, f34_arg1, f34_arg2 )
	local f34_local0 = f34_arg1.controller
	local f34_local1 = f34_arg2.isError
	local f34_local2 = f34_arg2.returnCode
	local f34_local3 = f34_arg2.returnCodeHex
	if f34_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionJoinCompletePS4 ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f34_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f34_local1 == false then
			if f34_arg2.sessionId ~= nil then
				f0_local0( f34_local0, f34_arg2.sessionId )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionJoinCompletePS4, we have successfully joined session id: '" .. Lobby.Platform.PS4GetSessionId( f34_local0 ) .. "'.\n" )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed: " .. f34_local3 .. "\n" )
		end
	elseif f34_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f34_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed: " .. f34_local3 .. "\n" )
		f34_local1 = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if f34_local1 == true then
		Lobby.Platform.PlatformSessionPS4Error( f34_local0, f34_local3 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Join = function ( f35_arg0, f35_arg1, f35_arg2 )
	Lobby.Platform.PS4.taskInProgress = true
	local f35_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionJoinCompletePS4, {
		controller = f35_arg0,
		lobbyType = f35_arg1,
		sessionId = f35_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join started, joining sessionId: '" .. f35_arg2 .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionJoinFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f35_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Join( f35_local0, f35_arg0, f35_arg1, f35_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f35_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4LeaveComplete = function ( f36_arg0, f36_arg1, f36_arg2 )
	local f36_local0 = f36_arg1.controller
	local f36_local1 = f36_arg2.isError
	local f36_local2 = f36_arg2.returnCode
	local f36_local3 = f36_arg2.returnCodeHex
	if f36_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f36_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f36_local1 == false then
			local f36_local4 = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete, we have successfully left session id: '" .. Lobby.Platform.PS4GetSessionId( f36_local0 ) .. "'.\n" )
			if f36_local0 == Engine.GetPrimaryController() and f36_local4.sessionId == Lobby.Platform.PS4GetSessionId( f36_local0 ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete, we are host of private session, clearing session data.\n" )
				Engine.PlatformSessionPS4ClearData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed: " .. f36_local3 .. "\n" )
		end
	elseif f36_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f36_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed: " .. f36_local3 .. "\n" )
		f36_local1 = true
	end
	f0_local0( f36_local0, "" )
	Lobby.Platform.PS4.taskInProgress = false
	if f36_local1 == true then
		Lobby.Platform.PlatformSessionPS4Error( f36_local0, f36_local3 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Leave = function ( f37_arg0, f37_arg1, f37_arg2 )
	Lobby.Platform.PS4.taskInProgress = true
	local f37_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4LeaveComplete, {
		controller = f37_arg0,
		lobbyType = f37_arg1,
		sessionId = f37_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave started, leaving sessionId: '" .. f37_arg2 .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionLeaveFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f37_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Leave( f37_local0, f37_arg0, f37_arg1, f37_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f37_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4SetPartyPrivacyComplete = function ( f38_arg0, f38_arg1, f38_arg2 )
	local f38_local0 = f38_arg1.controller
	local f38_local1 = f38_arg1.lobbyType
	local f38_local2 = f38_arg2.isError
	local f38_local3 = f38_arg2.returnCode
	local f38_local4 = f38_arg2.returnCodeHex
	if f38_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacyComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f38_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f38_local2 == false then
			local f38_local5 = f38_arg1.partyPrivacy
			Lobby.Platform.PS4.lockFlag[f38_local0 + 1] = f38_local5
			Lobby.Platform.PS4.sessionTypeFlag[f38_local0 + 1] = f38_local5
			Engine.PlatformSessionSetDebugInfo( f38_local0, Enum.LobbyType.LOBBY_TYPE_GAME, "partyPrivacyStatus: " .. Lobby.Platform.PlatformSessionGetPartyPrivacyStatus( f38_local5 ) )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacyComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy failed: " .. f38_local4 .. "\n" )
		end
	elseif f38_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f38_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy failed: " .. f38_local4 .. "\n" )
		f38_local2 = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if f38_local2 == true then
		Engine.PlatformSessionSetDebugInfo( f38_local0, Enum.LobbyType.LOBBY_TYPE_GAME, "partyPrivacyStatus: ERROR" )
		Lobby.Platform.PlatformSessionPS4Error( f38_local0, f38_local1, f38_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4SetPartyPrivacy = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
	local f39_local0 = Lobby.Platform.PlatformSessionPS4GetLockFlag( Lobby.Platform.PS4.lockFlag[f39_arg0 + 1] )
	local f39_local1 = Lobby.Platform.PlatformSessionPS4GetLockFlag( f39_arg3 )
	local f39_local2 = Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag( Lobby.Platform.PS4.sessionTypeFlag[f39_arg0 + 1] )
	local f39_local3 = Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag( f39_arg3 )
	if f39_local0 == f39_local1 and f39_local2 == f39_local3 then
		Lobby.Platform.PS4.lockFlag[f39_arg0 + 1] = f39_arg3
		Lobby.Platform.PS4.sessionTypeFlag[f39_arg0 + 1] = f39_arg3
		return 
	else
		Lobby.Platform.PS4.taskInProgress = true
		local f39_local4 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4SetPartyPrivacyComplete, {
			controller = f39_arg0,
			lobbyType = f39_arg1,
			sessionId = f39_arg2,
			partyPrivacy = f39_arg3
		} )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy started.\n" )
		if Engine.IsShipBuild() == false and 1 == Engine.DvarInt( 0, "platformSessionSetPartyPrivacyFailure" ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy FAILURE TEST.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f39_local4,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		else
			Dvar.platformSessionOrbisLockFlag:set( f39_local1 )
			Dvar.platformSessionOrbisSessionTypeFlag:set( f39_local3 )
			if Engine.PlatformSessionPS4Update( f39_local4, f39_arg0, f39_arg1, f39_arg2 ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy failed to start.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = f39_local4,
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

Lobby.Platform.PlatformSessionPS4PumpController = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3, f40_arg4, f40_arg5, f40_arg6, f40_arg7 )
	local f40_local0 = f40_arg0 + 1
	local f40_local1 = Lobby.Platform.PS4GetSessionId( f40_arg0 )
	local f40_local2 = Lobby.Platform.PS4.lobbyId[f40_local0]
	local f40_local3 = string.len( f40_local1 ) > 0
	local f40_local4 = Lobby.Platform.PS4.sessionFailure[f40_local0]
	if f40_arg4 == false then
		if f40_local3 == false and f40_local4 == false then
			return 
		elseif f40_local3 == true and f40_local4 == false then
			Lobby.Platform.PlatformSessionPS4Leave( f40_arg0, f40_arg2, f40_local1 )
		else
			f0_local0( f40_arg0, "" )
			Lobby.Platform.PS4.sessionFailure[f40_local0] = false
		end
		return 
	elseif f40_arg5 == false or f40_arg1 == false then
		if f40_local3 == false and f40_local4 == false then
			return 
		elseif f40_local3 == true and f40_local4 == false then
			Lobby.Platform.PlatformSessionPS4Leave( f40_arg0, f40_arg2, f40_local1 )
		else
			f0_local0( f40_arg0, "" )
			Lobby.Platform.PS4.sessionFailure[f40_local0] = false
		end
		return 
	elseif Lobby.Platform.PS4.changed[f40_local0] == true then
		local f40_local5 = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if f40_local3 == true and (f40_local5.sessionId ~= f40_local1 or f40_local2 ~= Engine.GetLobbyLobbyID( Enum.LobbyType.LOBBY_TYPE_PRIVATE )) then
			Lobby.Platform.PlatformSessionPS4Leave( f40_arg0, f40_arg2, f40_local1 )
		end
		Lobby.Platform.PS4.changed[f40_local0] = false
		return 
	elseif f40_local4 == false then
		if f40_local3 == true then
			if true == Dvar.platformSessionPartyPrivacy:get() and f40_arg0 == f40_arg7 and f40_arg2 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
				local f40_local5 = Engine.GetPartyPrivacy()
				if Lobby.Platform.PS4.lockFlag[f40_local0] ~= f40_local5 then
					Lobby.Platform.PlatformSessionPS4SetPartyPrivacy( f40_arg0, f40_arg2, f40_local1, f40_local5 )
					return 
				end
			end
			return 
		elseif f40_arg6 == true and f40_arg0 == f40_arg7 then
			Lobby.Platform.PlatformSessionPS4Create( f40_arg0, f40_arg2, f40_arg3 )
			return 
		end
		local f40_local5 = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if f40_local5.sessionId ~= "" then
			Lobby.Platform.PlatformSessionPS4Join( f40_arg0, f40_arg2, f40_local5.sessionId )
		end
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4Pump = function ()
	if Lobby.Platform.PS4.taskInProgress ~= true and true ~= Engine.IsRequestingJoin() then
		if Lobby.ProcessQueue.IsQueueEmpty() == false then
			local f41_local0 = Lobby.ProcessQueue.GetQueueHead()
			if f41_local0.nonPSNSessionBlocking ~= true then
				Lobby.Platform.PS4.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalOrbis:get()
				return 
			end
		end
		if Lobby.Platform.PS4.updateTime > Engine.milliseconds() then
			return 
		end
		Lobby.Platform.PS4.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalOrbis:get()
		local f41_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		local f41_local1 = 18
		local f41_local2 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
		local f41_local3 = Engine.IsLobbyActive( f41_local0 )
		local f41_local4 = Engine.IsLobbyHost( f41_local0 )
		local f41_local5
		if f41_local4 then
			f41_local5 = Engine.GetLobbyHostControllerIndex( f41_local0 )
			if not f41_local5 then
			
			else
				for f41_local6 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
					local f41_local9 = f41_local6 - 1
					local f41_local10 = Engine.IsSignedInToLive( f41_local9 )
					local f41_local11 = Engine.IsControllerBeingUsed( f41_local9 )
					if f41_local10 == true then
						Lobby.Platform.PlatformSessionPS4PumpController( f41_local9, f41_local11, f41_local0, f41_local1, f41_local2, f41_local3, f41_local4, f41_local5 )
					elseif Lobby.Platform.PS4.lastSignedInState[f41_local6] == true then
						f0_local2( f41_local9 )
					end
					Lobby.Platform.PS4.lastSignedInState[f41_local6] = f41_local10
					if Lobby.Platform.PS4.taskInProgress == true then
						return 
					end
				end
			end
		end
		f41_local5 = LuaEnums.INVALID_CONTROLLER_PORT
	end
	Lobby.Platform.PS4.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalOrbis:get()
	return 
end

local f0_local3 = function ( f42_arg0, f42_arg1, f42_arg2 )
	Lobby.Platform.XBOX.templateName[f42_arg0 + 1][f42_arg1 + 1] = f42_arg2
end

local f0_local4 = function ( f43_arg0, f43_arg1 )
	return Lobby.Platform.XBOX.templateName[f43_arg0 + 1][f43_arg1 + 1]
end

local f0_local5 = function ( f44_arg0, f44_arg1, f44_arg2 )
	Lobby.Platform.XBOX.sessionId[f44_arg0 + 1][f44_arg1 + 1] = f44_arg2
	Engine.PlatformSessionSetDebugInfo( f44_arg0, f44_arg1, f44_arg2 )
end

local f0_local6 = function ( f45_arg0, f45_arg1 )
	return Lobby.Platform.XBOX.sessionId[f45_arg0 + 1][f45_arg1 + 1]
end

local f0_local7 = function ( f46_arg0, f46_arg1, f46_arg2 )
	Lobby.Platform.XBOX.changed[f46_arg0 + 1][f46_arg1 + 1] = f46_arg2
end

local f0_local8 = function ( f47_arg0, f47_arg1 )
	return Lobby.Platform.XBOX.changed[f47_arg0 + 1][f47_arg1 + 1]
end

local f0_local9 = function ( f48_arg0, f48_arg1, f48_arg2 )
	Lobby.Platform.XBOX.sessionFailure[f48_arg0 + 1] = f48_arg1
	Lobby.Platform.XBOX.sessionFailureTime[f48_arg0 + 1] = f48_arg2
end

local f0_local10 = function ( f49_arg0 )
	return Lobby.Platform.XBOX.sessionFailure[f49_arg0 + 1]
end

local f0_local11 = function ( f50_arg0, f50_arg1 )
	return f0_local4( f50_arg0, f50_arg1 ), f0_local6( f50_arg0, f50_arg1 )
end

local f0_local12 = function ( f51_arg0, f51_arg1 )
	Engine.PlatformSessionSetDebugInfo( f51_arg0, f51_arg1, f0_local6( f51_arg0, f51_arg1 ), "  start[ " .. tostring( Lobby.Platform.XBOX.roundStartCounter[f51_arg0 + 1] ) .. " ], end[ " .. tostring( Lobby.Platform.XBOX.roundEndCounter[f51_arg0 + 1] ) .. " ]" )
end

local f0_local13 = function ( f52_arg0, f52_arg1 )
	local f52_local0 = f52_arg0 + 1
	Lobby.Platform.XBOX.disabled[f52_local0] = false
	f0_local9( f52_arg0, false, 0 )
	Lobby.Platform.XBOX.lastSignedInState[f52_local0] = false
	for f52_local1 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
		f0_local5( f52_arg0, f52_local1, "" )
		f0_local7( f52_arg0, f52_local1, false )
		Engine.PlatformSessionXboxXBLiveSessionClear( f52_arg0, f52_local1 )
	end
	Lobby.Platform.XBOX.roundStart[f52_local0] = false
	Lobby.Platform.XBOX.roundStartSessionId[f52_local0] = ""
	Lobby.Platform.XBOX.roundEnd[f52_local0] = false
	Lobby.Platform.XBOX.playerSessionId[f52_local0] = nil
	Lobby.Platform.XBOX.roundStartTime[f52_local0] = 0
	Lobby.Platform.XBOX.roundStartCounter[f52_local0] = 0
	Lobby.Platform.XBOX.roundEndCounter[f52_local0] = 0
	Lobby.Platform.XBOX.sessionClosed[f52_local0] = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	Lobby.Platform.XBOX.joinRestriction[f52_local0] = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	Lobby.Platform.XBOX.visibility[f52_local0] = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	if f52_arg1 == true then
		Lobby.Platform.XBOX.rtaSubscribe[f52_local0] = false
	end
end

Lobby.Platform.PlatformSessionUpdateErrorCount = function ( f53_arg0 )
	local f53_local0 = f53_arg0 + 1
	if not Engine.StorageIsFileReady( f53_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	end
	local f53_local1 = Engine.StorageGetBuffer( f53_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f53_local1 == nil then
		return 
	end
	local f53_local2 = f53_local1.demonwareflags[15]:get() + 1
	if f53_local2 > 255 then
		f53_local2 = 255
	end
	f53_local1.demonwareflags[15]:set( f53_local2 )
	Lobby.Platform.XBOX.disabled[f53_local0] = nil
end

Lobby.Platform.PlatformSessionXboxError = function ( f54_arg0, f54_arg1, f54_arg2 )
	local f54_local0 = Dvar.platformSessionsDurango:get()
	Lobby.Platform.XBOX.taskInProgress = false
	Lobby.Platform.PlatformSessionUpdateErrorCount( f54_arg0 )
	Engine.PlatformSessionCancelTasks()
	if f54_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_NONFATAL then
		f0_local13( f54_arg0, false )
		f0_local9( f54_arg0, true, Lobby.Platform.DISABLE_PLATFORM_SESSIONS )
	elseif f54_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_FATAL then
		LobbyVM.ExecuteLobbyVMRequest( LuaEnums.LOBBYVM_REQUEST.FORCE_LOCAL_MODE )
		if Dvar.platformSessionShowErrorCodes:get() == true then
			Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "Platform Session Error: " .. f54_arg2 )
		else
			Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "PLATFORM_PLATFORM_SESSION_ERROR" )
		end
	end
end

Lobby.Platform.PlatformSessionXboxGenerateSessionId = function ( f55_arg0 )
	local f55_local0 = Engine.GetLobbyHostInfo( Enum.LobbyModule.LOBBY_MODULE_CLIENT, f55_arg0 )
	if f55_local0 == nil then
		return false, ""
	else
		return true, Engine.PlatformSessionXboxSecIdToSessionId( f55_local0.secId )
	end
end

Lobby.Platform.PlatformSessionXboxCreateComplete = function ( f56_arg0, f56_arg1, f56_arg2 )
	local f56_local0 = f56_arg1.controller
	local f56_local1 = f56_arg1.lobbyType
	local f56_local2 = f56_arg2.isError
	local f56_local3 = f56_arg2.returnCode
	local f56_local4 = f56_arg2.returnCodeHex
	if f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreateComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f56_local2 == false then
			f0_local5( f56_local0, f56_local1, f56_arg2.sessionId )
			Engine.PlatformSessionXboxSetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f0_local6( f56_local0, f56_local1 ), f0_local4( f56_local0, f56_local1 ) )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreateComplete, we have successfully created session id: '" .. f56_arg2.sessionId .. "'.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed: " .. f56_local4 .. "\n" )
		end
	elseif f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed: " .. f56_local4 .. "\n" )
		f56_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f56_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f56_local0, f56_local1, f56_local4 )
		return true
	elseif f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS and f56_local2 == false and f56_local1 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		Lobby.Platform.PlatformSessionXboxSetActivity( f56_local0, f56_local1 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxCreate = function ( f57_arg0, f57_arg1 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f57_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxCreateComplete, {
		controller = f57_arg0,
		lobbyType = f57_arg1
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate started.\n" )
	local f57_local1 = f0_local4( f57_arg0, f57_arg1 )
	local f57_local2, f57_local3 = Lobby.Platform.PlatformSessionXboxGenerateSessionId( f57_arg1 )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionCreateFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f57_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif f57_local2 == false or Engine.PlatformSessionXboxCreateJoin( f57_local0, f57_arg0, f57_arg1, f57_local1, f57_local3 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed to start.\n" )
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

Lobby.Platform.PlatformSessionXboxSetActivityComplete = function ( f58_arg0, f58_arg1, f58_arg2 )
	local f58_local0 = f58_arg1.controller
	local f58_local1 = f58_arg1.lobbyType
	local f58_local2 = f58_arg1.sessionId
	local f58_local3 = f58_arg2.isError
	local f58_local4 = f58_arg2.returnCode
	local f58_local5 = f58_arg2.returnCodeHex
	if f58_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivityComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f58_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f58_local3 == false then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivityComplete, we have successfully set sessionId: '" .. f58_local2 .. "' to be the activity session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed: " .. f58_local5 .. "\n" )
		end
	elseif f58_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f58_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed: " .. f58_local5 .. "\n" )
		f58_local3 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f58_local3 == true then
		Lobby.Platform.PlatformSessionXboxError( f58_local0, f58_local1, f58_local5 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxSetActivity = function ( f59_arg0, f59_arg1 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f59_local0, f59_local1 = f0_local11( f59_arg0, f59_arg1 )
	local f59_local2 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetActivityComplete, {
		controller = f59_arg0,
		lobbyType = f59_arg1,
		sessionId = f59_local1
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity started for sessionId: '" .. f59_local1 .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionSetActivityFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f59_local2,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxSetActivity( f59_local2, f59_arg0, f59_arg1, f59_local0, f59_local1 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f59_local2,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxLeaveComplete = function ( f60_arg0, f60_arg1, f60_arg2 )
	local f60_local0 = f60_arg1.controller
	local f60_local1 = f60_arg1.lobbyType
	local f60_local2 = f60_arg2.isError
	local f60_local3 = f60_arg2.returnCode
	local f60_local4 = f60_arg2.returnCodeHex
	if f60_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeaveComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f60_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f60_local2 == false then
			local f60_local5 = Engine.PlatformSessionXboxGetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeaveComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed: " .. f60_local4 .. "\n" )
		end
	elseif f60_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f60_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed: " .. f60_local4 .. "\n" )
		f60_local2 = true
	end
	f0_local5( f60_local0, f60_local1, "" )
	Lobby.Platform.XBOX.taskInProgress = false
	if f60_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f60_local0, f60_local1, f60_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxLeave = function ( f61_arg0, f61_arg1, f61_arg2 )
	Lobby.Platform.XBOX.taskInProgress = true
	Lobby.Platform.PlatformSessionXboxRoundEnd( f61_arg0, f61_arg1 )
	local f61_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxLeaveComplete, {
		controller = f61_arg0,
		lobbyType = f61_arg1
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave started.\n" )
	local f61_local1, f61_local2 = f0_local11( f61_arg0, f61_arg1 )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionLeaveFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f61_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxLeave( f61_local0, f61_arg0, f61_arg1, f61_local1, f61_local2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f61_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxSetSessionClosedSetDebugStatus = function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3 )
	local f62_local0 = "OPEN"
	if f62_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f62_local0 = "OPEN"
	elseif f62_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f62_local0 = "FRIENDS ONLY"
	elseif f62_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f62_local0 = "INVITE ONLY"
	elseif f62_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f62_local0 = "CLOSED"
	end
	Engine.PlatformSessionSetDebugInfo( f62_arg0, f62_arg1, f62_arg2, f62_local0 )
end

Lobby.Platform.PlatformSessionXboxSetSessionClosedComplete = function ( f63_arg0, f63_arg1, f63_arg2 )
	local f63_local0 = f63_arg1.controller
	local f63_local1 = f63_arg1.lobbyType
	local f63_local2 = f63_arg2.isError
	local f63_local3 = f63_arg2.returnCode
	local f63_local4 = f63_arg2.returnCodeHex
	if f63_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosedComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f63_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f63_local2 == false then
			Lobby.Platform.XBOX.sessionClosed[f63_local0 + 1] = f63_arg1.partyPrivacy
			Lobby.Platform.PlatformSessionXboxSetSessionClosedSetDebugStatus( f63_local0, f63_local1, f63_arg1.sessionId, f63_arg1.partyPrivacy )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosedComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed: " .. f63_local4 .. "\n" )
		end
	elseif f63_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f63_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed: " .. f63_local4 .. "\n" )
		f63_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f63_local2 == true then
		Engine.PlatformSessionSetDebugInfo( f63_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f63_arg1.sessionId, "ERROR" )
		Lobby.Platform.PlatformSessionXboxError( f63_local0, f63_local1, f63_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxIsSessionClosed = function ( f64_arg0 )
	local f64_local0 = false
	if f64_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f64_local0 = false
	elseif f64_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f64_local0 = false
	elseif f64_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f64_local0 = false
	elseif f64_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f64_local0 = true
	end
	return f64_local0
end

Lobby.Platform.PlatformSessionXboxSetSessionClosed = function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
	local f65_local0 = Lobby.Platform.PlatformSessionXboxIsSessionClosed( Lobby.Platform.XBOX.sessionClosed[f65_arg0 + 1] )
	local f65_local1 = Lobby.Platform.PlatformSessionXboxIsSessionClosed( f65_arg3 )
	if f65_local0 == f65_local1 then
		Lobby.Platform.XBOX.sessionClosed[f65_arg0 + 1] = f65_arg3
		Lobby.Platform.PlatformSessionXboxSetSessionClosedSetDebugStatus( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
		return 
	else
		Lobby.Platform.XBOX.taskInProgress = true
		local f65_local2 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetSessionClosedComplete, {
			controller = f65_arg0,
			lobbyType = f65_arg1,
			sessionId = f65_arg2,
			partyPrivacy = f65_arg3
		} )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed started.\n" )
		if Engine.IsShipBuild() == false and 1 == Engine.DvarInt( 0, "platformSessionSetSessionClosedFailure" ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed FAILURE TEST.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f65_local2,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		elseif Engine.PlatformSessionXboxSetSessionClosed( f65_local2, f65_arg0, f65_arg1, f65_local1 ) == false then
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed to start.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f65_local2,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		else
			
		end
	end
end

Lobby.Platform.PlatformSessionXboxSetJoinRestrictionComplete = function ( f66_arg0, f66_arg1, f66_arg2 )
	local f66_local0 = f66_arg1.controller
	local f66_local1 = f66_arg1.lobbyType
	local f66_local2 = f66_arg2.isError
	local f66_local3 = f66_arg2.returnCode
	local f66_local4 = f66_arg2.returnCodeHex
	if f66_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestrictionComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f66_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f66_local2 == false then
			Lobby.Platform.XBOX.joinRestriction[f66_local0 + 1] = f66_arg1.partyPrivacy
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestrictionComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed: " .. f66_local4 .. "\n" )
		end
	elseif f66_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f66_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed: " .. f66_local4 .. "\n" )
		f66_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f66_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f66_local0, f66_local1, f66_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxGetJoinRestriction = function ( f67_arg0 )
	local f67_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_NONE
	if f67_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f67_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_NONE
	elseif f67_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f67_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_FOLLOWED
	elseif f67_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f67_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_LOCAL
	elseif f67_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f67_local0 = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_LOCAL
	end
	return f67_local0
end

Lobby.Platform.PlatformSessionXboxSetJoinRestriction = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3 )
	local f68_local0 = Lobby.Platform.PlatformSessionXboxGetJoinRestriction( Lobby.Platform.XBOX.joinRestriction[f68_arg0 + 1] )
	local f68_local1 = Lobby.Platform.PlatformSessionXboxGetJoinRestriction( f68_arg3 )
	if f68_local0 == f68_local1 then
		Lobby.Platform.XBOX.joinRestriction[f68_arg0 + 1] = f68_arg3
		return 
	else
		Lobby.Platform.XBOX.taskInProgress = true
		local f68_local2 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetJoinRestrictionComplete, {
			controller = f68_arg0,
			lobbyType = f68_arg1,
			sessionId = f68_arg2,
			partyPrivacy = f68_arg3,
			joinRestriction = f68_local1
		} )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction started.\n" )
		if Engine.IsShipBuild() == false and 1 == Engine.DvarInt( 0, "platformSessionSetJoinRestrictionFailure" ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction FAILURE TEST.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f68_local2,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		elseif Engine.PlatformSessionXboxSetJoinRestriction( f68_local2, f68_arg0, f68_arg1, f68_local1 ) == false then
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed to start.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f68_local2,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		else
			
		end
	end
end

Lobby.Platform.PlatformSessionXboxSetVisibilityComplete = function ( f69_arg0, f69_arg1, f69_arg2 )
	local f69_local0 = f69_arg1.controller
	local f69_local1 = f69_arg1.lobbyType
	local f69_local2 = f69_arg2.isError
	local f69_local3 = f69_arg2.returnCode
	local f69_local4 = f69_arg2.returnCodeHex
	if f69_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibilityComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f69_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f69_local2 == false then
			Lobby.Platform.XBOX.visibility[f69_local0 + 1] = f69_arg1.partyPrivacy
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibilityComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility failed: " .. f69_local4 .. "\n" )
		end
	elseif f69_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f69_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility failed: " .. f69_local4 .. "\n" )
		f69_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f69_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f69_local0, f69_local1, f69_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxSetVisibility = function ( f70_arg0, f70_arg1, f70_arg2, f70_arg3 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f70_local0 = Enum.DurangoSessionVisibility.DURANGO_SESSION_VISIBILITY_OPEN
	if f70_arg3 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f70_local0 = Enum.DurangoSessionVisibility.DURANGO_SESSION_VISIBILITY_PRIVATE
	end
	local f70_local1 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetVisibilityComplete, {
		controller = f70_arg0,
		lobbyType = f70_arg1,
		sessionId = f70_arg2,
		partyPrivacy = f70_arg3,
		visibility = f70_local0
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility started.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionSetVisibilityFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f70_local1,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxSetSessionVisibility( f70_local1, f70_arg0, f70_arg1, f70_local0 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f70_local1,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxRoundStart = function ( f71_arg0, f71_arg1 )
	local f71_local0 = f71_arg0 + 1
	Lobby.Platform.XBOX.roundStart[f71_local0] = false
	local f71_local1, f71_local2 = f0_local11( f71_arg0, f71_arg1 )
	local f71_local3, f71_local4 = Engine.PlatformSessionXboxMultiplayerRoundStart( f71_arg0, f71_arg1, f71_local1, f71_local2 )
	if f71_local3 == true then
		Lobby.Platform.XBOX.roundStartSessionId[f71_local0] = f71_local2
		Lobby.Platform.XBOX.roundStartTime[f71_local0] = Engine.milliseconds()
		Lobby.Platform.XBOX.roundStartCounter[f71_local0] = Lobby.Platform.XBOX.roundStartCounter[f71_local0] + 1
		f0_local12( f71_arg0, f71_arg1 )
		Lobby.Platform.XBOX.playerSessionId[f71_local0] = f71_local4.guid
	end
end

Lobby.Platform.PlatformSessionXboxRoundEnd = function ( f72_arg0, f72_arg1 )
	local f72_local0 = f72_arg0 + 1
	Lobby.Platform.XBOX.roundEnd[f72_local0] = false
	local f72_local1 = Lobby.Platform.XBOX.playerSessionId[f72_local0]
	if f72_local1 ~= nil then
		local f72_local2 = Lobby.Platform.XBOX.roundStartTime[f72_local0]
		local f72_local3, f72_local4 = f0_local11( f72_arg0, f72_arg1 )
		local f72_local5 = Lobby.Platform.XBOX.roundStartSessionId[f72_local0]
		if f72_local5 == f0_local6( f72_arg0, f72_arg1 ) then
			Engine.PlatformSessionXboxMultiplayerRoundEnd( f72_arg0, f72_arg1, f72_local3, f72_local5, f72_local1, f72_local2 )
			Lobby.Platform.XBOX.roundEndCounter[f72_local0] = Lobby.Platform.XBOX.roundEndCounter[f72_local0] + 1
			f0_local12( f72_arg0, f72_arg1 )
		end
	end
	Lobby.Platform.XBOX.roundStartSessionId[f72_local0] = nil
	Lobby.Platform.XBOX.playerSessionId[f72_local0] = nil
	Lobby.Platform.XBOX.roundStartTime[f72_local0] = 0
end

Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged = function ( f73_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged().\n" )
end

Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost = function ( f74_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost().\n" )
	if Dvar.platformSessionsDurangoAutoRTASubscription:get() == false then
		for f74_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			f0_local13( f74_local0 - 1, false )
		end
	end
end

Lobby.Platform.OnPlatformSuspend = function ( f75_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f75_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.PlatformSessionXboxRoundEnd( f75_local0 - 1, Enum.LobbyType.LOBBY_TYPE_GAME )
		end
	end
end

Lobby.Platform.OnPlatformResume = function ( f76_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "OnPlatformResume(), clear all session data.\n" )
		Engine.PlatformSessionPS4ClearData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		for f76_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			f0_local0( f76_local0 - 1, "" )
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxRTASubscription = function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3 )
	if Dvar.platformSessionsDurangoAutoRTASubscription:get() == false then
		local f77_local0 = f77_arg0 + 1
		if f77_arg1 == true and Lobby.Platform.XBOX.rtaSubscribe[f77_local0] == false and f77_arg3 == true then
			local f77_local1, f77_local2, f77_local3 = Engine.PlatformSessionXboxSubscribeToRTA( f77_arg0 )
			if f77_local1 == true then
				Lobby.Platform.XBOX.rtaSubscribe[f77_local0] = true
				Lobby.Platform.XBOX.sessionChangeToken[f77_local0] = f77_local2
				Lobby.Platform.XBOX.subscriptionLostToken[f77_local0] = f77_local3
			else
				Lobby.Platform.PlatformSessionXboxError( f77_arg0, f77_arg2, "PlatformSessionXboxEnableRTASubscription" )
				return 
			end
		end
		if Lobby.Platform.XBOX.rtaSubscribe[f77_local0] == false then
			return 
		end
	end
end

Lobby.Platform.PlatformSessionXboxDisabled = function ( f78_arg0, f78_arg1, f78_arg2, f78_arg3, f78_arg4 )
	local f78_local0 = f78_arg0 + 1
	if Lobby.Platform.XBOX.disabled[f78_local0] == true then
		return true
	elseif f78_arg3 == true and Lobby.Platform.XBOX.disabled[f78_local0] == nil and Engine.StorageIsFileReady( f78_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		local f78_local1 = Engine.StorageGetBuffer( f78_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f78_local1 then
			Lobby.Platform.XBOX.disabled[f78_local0] = false
			local f78_local2 = Engine.DvarInt( nil, "platformSessionDisableCount" )
			if f78_local2 > -1 and f78_local2 <= f78_local1.demonwareflags[15]:get() then
				Lobby.Platform.XBOX.disabled[f78_local0] = true
				return true
			end
		end
	end
	if Lobby.Platform.XBOX.sessionFailure[f78_local0] == true then
		if Lobby.Platform.XBOX.sessionFailureTime[f78_local0] == Lobby.Platform.DISABLE_PLATFORM_SESSIONS then
			return true
		elseif Lobby.Platform.XBOX.sessionFailureTime[f78_local0] < Engine.seconds() then
			Lobby.Platform.XBOX.sessionFailure[f78_local0] = false
			return false
		end
		return true
	end
end

Lobby.Platform.PlatformSessionXboxPumpController = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3, f79_arg4, f79_arg5, f79_arg6 )
	local f79_local0 = f79_arg0 + 1
	Lobby.Platform.PlatformSessionXboxRTASubscription( f79_arg0, f79_arg1, f79_arg2, f79_arg4 )
	local f79_local1 = string.len( f0_local6( f79_arg0, f79_arg2 ) ) > 0
	local f79_local2 = f0_local8( f79_arg0, f79_arg2 )
	local f79_local3 = Lobby.Platform.XBOX.roundStart[f79_local0]
	local f79_local4 = Lobby.Platform.XBOX.roundEnd[f79_local0]
	if Lobby.Platform.PlatformSessionXboxDisabled( f79_arg0, f79_arg1, f79_arg2, f79_arg3, f79_arg4 ) then
		return 
	elseif f79_arg3 == false then
		if f79_local1 == true then
			Lobby.Platform.PlatformSessionXboxLeave( f79_arg0, f79_arg2 )
		end
		return 
	elseif f79_local1 == true and (f79_arg4 == false or f79_arg1 == false) then
		Lobby.Platform.PlatformSessionXboxLeave( f79_arg0, f79_arg2 )
		return 
	elseif f79_arg4 == false or f79_arg1 == false then
		return 
	elseif f79_local1 == false and f79_local2 == true then
		f0_local7( f79_arg0, f79_arg2, false )
	end
	if f79_local1 == true then
		if f79_arg2 == Enum.LobbyType.LOBBY_TYPE_GAME then
			if f79_local2 == true then
				local f79_local5, f79_local6 = Lobby.Platform.PlatformSessionXboxGenerateSessionId( f79_arg2 )
				if f79_local5 == true and f79_local6 ~= f0_local6( f79_arg0, f79_arg2 ) then
					Lobby.Platform.PlatformSessionXboxLeave( f79_arg0, f79_arg2 )
				end
				f0_local7( f79_arg0, f79_arg2, false )
				return 
			elseif f79_local4 == true then
				Lobby.Platform.PlatformSessionXboxRoundEnd( f79_arg0, f79_arg2 )
				return 
			elseif f79_local3 == true then
				Lobby.Platform.PlatformSessionXboxRoundStart( f79_arg0, f79_arg2 )
				return 
			end
		end
		if true == Dvar.platformSessionPartyPrivacy:get() and f79_arg0 == f79_arg6 and f79_arg2 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
			local f79_local5 = Engine.GetPartyPrivacy()
			local f79_local6 = f0_local6( f79_arg0, f79_arg2 )
			if Lobby.Platform.XBOX.sessionClosed[f79_local0] ~= f79_local5 then
				Lobby.Platform.PlatformSessionXboxSetSessionClosed( f79_arg0, f79_arg2, f79_local6, f79_local5 )
				return 
			elseif Lobby.Platform.XBOX.joinRestriction[f79_local0] ~= f79_local5 then
				Lobby.Platform.PlatformSessionXboxSetJoinRestriction( f79_arg0, f79_arg2, f79_local6, f79_local5 )
				return 
			end
			return 
		end
		return 
	end
	Lobby.Platform.PlatformSessionXboxCreate( f79_arg0, f79_arg2 )
end

Lobby.Platform.PlatformSessionXboxPump = function ()
	if Lobby.Platform.XBOX.taskInProgress == true or true == Engine.IsRequestingJoin() or Lobby.ProcessQueue.IsQueueEmpty() == false or true == Engine.FriendsIsTaskInProgress() then
		Lobby.Platform.XBOX.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalDurango:get()
		return 
	elseif Lobby.Platform.XBOX.updateTime > Engine.milliseconds() then
		return 
	end
	Lobby.Platform.XBOX.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalDurango:get()
	local f80_local0 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	for f80_local1 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
		local f80_local4 = f80_local1 - 1
		local f80_local5 = Engine.PlatformSessionXboxIsLiveContextForControllerReadyRaw( f80_local4 )
		local f80_local6 = Engine.IsControllerBeingUsed( f80_local4 )
		if f80_local5 == true then
			for f80_local7 = Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyType.LOBBY_TYPE_PRIVATE, -1 do
				local f80_local10 = Engine.IsLobbyActive( f80_local7 )
				local f80_local11 = Engine.IsLobbyHost( f80_local7 )
				local f80_local12
				if f80_local11 then
					f80_local12 = Engine.GetLobbyHostControllerIndex( f80_local7 )
					if not f80_local12 then
					
					else
						Lobby.Platform.PlatformSessionXboxPumpController( f80_local4, f80_local6, f80_local7, f80_local0, f80_local10, f80_local11, f80_local12 )
						if Lobby.Platform.XBOX.taskInProgress == true then
							return 
						end
					end
				end
				f80_local12 = LuaEnums.INVALID_CONTROLLER_PORT
			end
		elseif Lobby.Platform.XBOX.lastSignedInState[f80_local1] == true then
			f0_local13( f80_local4, true )
		end
		Lobby.Platform.XBOX.lastSignedInState[f80_local1] = f80_local5
	end
end

Lobby.Platform.InviteFailed = function ( f81_arg0 )
	Engine.LuiVM_Event( "open_toaster_popup", {
		isError = true,
		controller = f81_arg0.controller,
		xuid = f81_arg0.xuid,
		gamertag = f81_arg0.gamertag,
		immediate = true
	} )
end

Lobby.Platform.InviteComplete = function ( f82_arg0, f82_arg1, f82_arg2 )
	local f82_local0 = f82_arg1.controller
	local f82_local1 = f82_arg1.xuid
	local f82_local2 = f82_arg1.gamertag
	if f82_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		return false
	elseif f82_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		Engine.LuiVM_Event( "open_toaster_popup", {
			isError = false,
			controller = f82_local0,
			xuid = f82_local1,
			gamertag = f82_local2,
			immediate = true
		} )
	elseif f82_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f82_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		if true == Dvar.platformSessionShowErrorCodes:get() then
			f82_arg1.gamertag = f82_arg1.gamertag .. " - " .. returnCodeHex
		end
		Lobby.Platform.InviteFailed( f82_arg1 )
	end
	return true
end

Lobby.Platform.Invite = function ( f83_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() == false and Lobby.Platform.PlatformSessionDurangoEnabled() == false then
		return 
	end
	local f83_local0 = f83_arg0.controller
	local f83_local1 = f83_arg0.xuid
	local f83_local2 = f83_arg0.gamertag
	Dvar.platformSessionOrbisInviteMessage:set( Engine.LocalizeWithoutLocsMarkers( "MENU_GAME_INVITE_MESSAGE", Engine.GetGamertagForController( f83_local0 ) ) )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if Lobby.Platform.PS4GetSessionId( f83_local0 ) == "" then
			Lobby.Platform.InviteFailed( f83_arg0 )
			return 
		end
		local f83_local3 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.InviteComplete, f83_arg0 )
		if Engine.PlatformSessionPS4Invite( f83_local3, f83_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f83_local1, f83_local2, Lobby.Platform.PS4GetSessionId( f83_local0 ) ) == false then
			Lobby.Platform.InviteFailed( f83_arg0 )
			Lobby.ProcessQueue.UnRegisterEventHandler( f83_local3 )
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		local f83_local3 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.InviteComplete, f83_arg0 )
		if Engine.PlatformSessionXboxInvite( f83_local3, f83_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f83_local1, f83_local2 ) == false then
			Lobby.Platform.InviteFailed( f83_arg0 )
			Lobby.ProcessQueue.UnRegisterEventHandler( f83_local3 )
		end
	end
end

Lobby.Platform.AutoJoinPump = function ()
	if Lobby.Platform.AutoJoinData ~= nil and Engine.IsClientLoaded( Lobby.Platform.AutoJoinData.controller ) then
		if Engine.IsInGame() then
			CoDShared.QuitGame( Lobby.Platform.AutoJoinData.controller )
			return 
		end
		local f84_local0 = Lobby.Platform.GetAutoJoinProcess( Lobby.Platform.AutoJoinData )
		if f84_local0 ~= nil then
			Lobby.ProcessQueue.AddToQueue( "AutoJoin", f84_local0 )
		end
		Lobby.Platform.AutoJoinData = nil
	end
end

Lobby.Platform.SetModelValue = function ( f85_arg0, f85_arg1 )
	local f85_local0 = Engine.CreateModel( Engine.GetGlobalModel(), f85_arg0, true )
	if f85_local0 == nil then
		return 
	else
		Engine.SetModelValue( f85_local0, f85_arg1 )
	end
end

Lobby.Platform.GetModelValue = function ( f86_arg0, f86_arg1 )
	local f86_local0 = Engine.GetModel( Engine.GetGlobalModel(), f86_arg0 )
	if f86_local0 ~= nil then
		local f86_local1 = Engine.GetModelValue( f86_local0, value )
		if f86_local1 ~= nil then
			Engine.UnsubscribeAndFreeModel( f86_local0 )
			return f86_local1
		end
	end
	return f86_arg1
end

Lobby.Platform.SaveState = function ()
	if Engine.IsDedicatedServer() == true or true == LuaUtils.isPC then
		return 
	elseif true == LuaUtils.isPS4 then
		Lobby.Platform.SetModelValue( "platformSession.taskInProgress", Lobby.Platform.PS4.taskInProgress )
		for f87_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.SetModelValue( "platformSession.sessionId." .. tostring( f87_local0 ), Lobby.Platform.PS4.sessionId[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.lobbyId." .. tostring( f87_local0 ), Lobby.Platform.PS4.lobbyId[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.changed." .. tostring( f87_local0 ), Lobby.Platform.PS4.changed[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailure." .. tostring( f87_local0 ), Lobby.Platform.PS4.sessionFailure[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailureTime." .. tostring( f87_local0 ), Lobby.Platform.PS4.sessionFailureTime[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.lastSignedInState." .. tostring( f87_local0 ), Lobby.Platform.PS4.lastSignedInState[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.lockFlag." .. tostring( f87_local0 ), Lobby.Platform.PS4.lockFlag[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionTypeFlag." .. tostring( f87_local0 ), Lobby.Platform.PS4.sessionTypeFlag[f87_local0] )
		end
	elseif true == LuaUtils.isXbox then
		Lobby.Platform.SetModelValue( "platformSession.taskInProgress", Lobby.Platform.XBOX.taskInProgress )
		for f87_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.SetModelValue( "platformSession.rtaSubscribe." .. tostring( f87_local0 ), Lobby.Platform.XBOX.rtaSubscribe[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionChangeToken." .. tostring( f87_local0 ), Lobby.Platform.XBOX.sessionChangeToken[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.subscriptionLostToken." .. tostring( f87_local0 ), Lobby.Platform.XBOX.subscriptionLostToken[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailure." .. tostring( f87_local0 ), Lobby.Platform.XBOX.sessionFailure[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailureTime." .. tostring( f87_local0 ), Lobby.Platform.XBOX.sessionFailureTime[f87_local0] )
			for f87_local3 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
				local f87_local6 = f87_local3 + 1
				Lobby.Platform.SetModelValue( "platformSession.templateName." .. tostring( f87_local0 ) .. "." .. tostring( f87_local6 ), Lobby.Platform.XBOX.templateName[f87_local0][f87_local6] )
				Lobby.Platform.SetModelValue( "platformSession.sessionId." .. tostring( f87_local0 ) .. "." .. tostring( f87_local6 ), Lobby.Platform.XBOX.sessionId[f87_local0][f87_local6] )
				Lobby.Platform.SetModelValue( "platformSession.changed." .. tostring( f87_local0 ) .. "." .. tostring( f87_local6 ), Lobby.Platform.XBOX.changed[f87_local0][f87_local6] )
			end
			Lobby.Platform.SetModelValue( "platformSession.lastSignedInState." .. tostring( f87_local0 ), Lobby.Platform.XBOX.lastSignedInState[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundStart." .. tostring( f87_local0 ), Lobby.Platform.XBOX.roundStart[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundStartSessionId." .. tostring( f87_local0 ), Lobby.Platform.XBOX.roundStartSessionId[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundEnd." .. tostring( f87_local0 ), Lobby.Platform.XBOX.roundEnd[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.playerSessionId." .. tostring( f87_local0 ), Lobby.Platform.XBOX.playerSessionId[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundStartTime." .. tostring( f87_local0 ), Lobby.Platform.XBOX.roundStartTime[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundStartCounter." .. tostring( f87_local0 ), Lobby.Platform.XBOX.roundStartCounter[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.roundEndCounter." .. tostring( f87_local0 ), Lobby.Platform.XBOX.roundEndCounter[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.sessionClosed." .. tostring( f87_local0 ), Lobby.Platform.XBOX.sessionClosed[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.joinRestriction." .. tostring( f87_local0 ), Lobby.Platform.XBOX.joinRestriction[f87_local0] )
			Lobby.Platform.SetModelValue( "platformSession.visibility." .. tostring( f87_local0 ), Lobby.Platform.XBOX.visibility[f87_local0] )
		end
	end
end

Lobby.Platform.OnComError = function ( f88_arg0 )
	local f88_local0 = f88_arg0.errorCode
	if f88_arg0.isInCleanup then
		return 
	elseif f88_local0 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
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
	Lobby.Platform.PlatformModsPump()
	Lobby.Platform.TRCPump()
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Lobby.Platform.PlatformSessionPS4Pump()
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		Lobby.Platform.PlatformSessionXboxPump()
	end
	Lobby.Platform.PS4PlayTogetherPump()
	Lobby.Platform.AutoJoinPump()
end

Lobby.Platform.Init = function ()
	if Engine.IsDedicatedServer() == true or true == LuaUtils.isPC then
		return 
	elseif true == LuaUtils.isPS4 then
		Lobby.Platform.PS4.taskInProgress = Lobby.Platform.GetModelValue( "platformSession.taskInProgress", false )
		for f92_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.PS4.sessionFailure[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionFailure." .. tostring( f92_local0 ), false )
			Lobby.Platform.PS4.sessionFailureTime[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionFailureTime." .. tostring( f92_local0 ), 0 )
			Lobby.Platform.PS4.sessionId[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionId." .. tostring( f92_local0 ), "" )
			Lobby.Platform.PS4.lobbyId[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.lobbyId." .. tostring( f92_local0 ), 0 )
			Lobby.Platform.PS4.changed[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.changed." .. tostring( f92_local0 ), false )
			Lobby.Platform.PS4.lastSignedInState[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.lastSignedInState." .. tostring( f92_local0 ), false )
			Lobby.Platform.PS4.lockFlag[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.lockFlag." .. tostring( f92_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			Lobby.Platform.PS4.sessionTypeFlag[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionTypeFlag." .. tostring( f92_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
		end
	elseif true == LuaUtils.isXbox then
		Lobby.Platform.XBOX.taskInProgress = Lobby.Platform.GetModelValue( "platformSession.taskInProgress", false )
		for f92_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f92_local3 = f92_local0 - 1
			Lobby.Platform.XBOX.sessionFailure[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionFailure." .. tostring( f92_local0 ), false )
			Lobby.Platform.XBOX.sessionFailureTime[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionFailureTime." .. tostring( f92_local0 ), 0 )
			Lobby.Platform.XBOX.rtaSubscribe[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.rtaSubscribe." .. tostring( f92_local0 ), false )
			Lobby.Platform.XBOX.sessionChangeToken[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionChangeToken." .. tostring( f92_local0 ), nil )
			Lobby.Platform.XBOX.subscriptionLostToken[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.subscriptionLostToken." .. tostring( f92_local0 ), nil )
			Lobby.Platform.XBOX.templateName[f92_local0] = {}
			Lobby.Platform.XBOX.sessionId[f92_local0] = {}
			Lobby.Platform.XBOX.changed[f92_local0] = {}
			Lobby.Platform.XBOX.lastSignedInState[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.lastSignedInState." .. tostring( f92_local0 ), false )
			Lobby.Platform.XBOX.roundStart[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.roundStart." .. tostring( f92_local0 ), false )
			Lobby.Platform.XBOX.roundStartSessionId[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.roundStartSessionId." .. tostring( f92_local0 ), "" )
			Lobby.Platform.XBOX.roundEnd[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.roundEnd." .. tostring( f92_local0 ), false )
			Lobby.Platform.XBOX.playerSessionId[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.playerSessionId." .. tostring( f92_local0 ), nil )
			Lobby.Platform.XBOX.roundStartTime[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.roundStartTime." .. tostring( f92_local0 ), 0 )
			Lobby.Platform.XBOX.roundStartCounter[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.roundStartCounter." .. tostring( f92_local0 ), 0 )
			Lobby.Platform.XBOX.roundEndCounter[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.roundEndCounter." .. tostring( f92_local0 ), 0 )
			Lobby.Platform.XBOX.sessionClosed[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.sessionClosed." .. tostring( f92_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			Lobby.Platform.XBOX.joinRestriction[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.joinRestriction." .. tostring( f92_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			Lobby.Platform.XBOX.visibility[f92_local0] = Lobby.Platform.GetModelValue( "platformSession.visibility." .. tostring( f92_local0 ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			f0_local3( f92_local3, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Lobby.Platform.GetModelValue( "platformSession.templateName." .. tostring( f92_local0 ) .. "." .. tostring( Enum.LobbyType.LOBBY_TYPE_PRIVATE + 1 ), Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE.PRIVATE_LOBBY ) )
			f0_local3( f92_local3, Enum.LobbyType.LOBBY_TYPE_GAME, Lobby.Platform.GetModelValue( "platformSession.templateName." .. tostring( f92_local0 ) .. "." .. tostring( Enum.LobbyType.LOBBY_TYPE_GAME + 1 ), Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE.GAME_LOBBY ) )
			for f92_local4 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
				local f92_local7 = f92_local4 + 1
				f0_local5( f92_local3, f92_local4, Lobby.Platform.GetModelValue( "platformSession.sessionId." .. tostring( f92_local0 ) .. "." .. tostring( f92_local7 ), "" ) )
				f0_local7( f92_local3, f92_local4, Lobby.Platform.GetModelValue( "platformSession.changed." .. tostring( f92_local0 ) .. "." .. tostring( f92_local7 ), false ) )
			end
		end
	end
end

Lobby.Platform.playTogether = {}
Lobby.Platform.PS4ProcessPlayTogetherEvent = function ( f93_arg0 )
	local f93_local0 = f93_arg0.controller
	local f93_local1 = f93_arg0.xuid
	local f93_local2 = f93_arg0.gamertag
	local f93_local3 = Engine.GetLobbyUIScreen()
	local f93_local4 = ""
	local f93_local5 = nil
	Lobby.Platform.playTogether.monitor = false
	Lobby.Platform.playTogether.available = true
	Lobby.Platform.playTogether.data = f93_arg0
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		local f93_local6 = Lobby.Process.ReloadPrivateLobby( f93_local0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		local f93_local7 = Lobby.ProcessPlatform.PlayTogetherBeginPlay( f93_local0, f93_arg0.playTogetherList )
		Lobby.Process.AddActions( f93_local6.tail, f93_local7.head )
		return f93_local6
	elseif f93_local3 == LobbyData.UITargets.UI_MAIN.id then
		Lobby.Platform.playTogether.monitor = true
		Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		return nil
	elseif Engine.IsInGame() then
		return Lobby.ProcessPlatform.PlayTogetherBeginPlay( f93_local0, f93_arg0.playTogetherList )
	else
		return Lobby.ProcessPlatform.PlayTogetherBeginPlay( f93_local0, f93_arg0.playTogetherList )
	end
end

Lobby.Platform.PS4PlayTogetherPump = function ()
	if Engine.IsDedicatedServer() == true or true ~= LuaUtils.isPS4 then
		return 
	elseif true ~= Lobby.Platform.playTogether.monitor then
		return 
	end
	local f94_local0 = Lobby.Platform.playTogether.data.controller
	if Engine.GetLobbyUIScreen() ~= LobbyData.UITargets.UI_MAIN.id then
		if true == Lobby.Platform.PS4.taskInProgress then
			return 
		elseif string.len( Lobby.Platform.PS4GetSessionId( f94_local0 ) ) > 0 then
			Lobby.Platform.playTogether.monitor = false
			Lobby.ProcessQueue.AddToQueue( "PlayTogetherBeginPlay", Lobby.ProcessPlatform.SendPlayTogetherInvites( f94_local0, Lobby.Platform.playTogether.data.playTogetherList ) )
			Engine.PlatformSessionClearPlayTogetherInfo()
		end
	end
	if Engine.GetModel( Engine.GetModelForController( Lobby.Platform.playTogether.data.controller ), "SystemOverlay_MessageDialog.buttonPrompts" ) ~= nil then
		Lobby.Platform.playTogether.monitor = false
	end
end

Lobby.Platform.PlatformModsPump = function ()
	if LuaUtils.isPC ~= true or LuaUtils.Mods_Enabled() ~= true then
		return 
	elseif Engine.IsInGame() then
		return 
	end
	if true ~= Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and true ~= Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return 
	end
	local f95_local0 = Engine.milliseconds()
	if f95_local0 < Lobby.Platform.Mods.updateTime then
		return 
	end
	Lobby.Platform.Mods.updateTime = f95_local0 + 1000
	local f95_local1 = Engine.GetLobbyUgcInfo()
	if f95_local1 ~= nil then
		local f95_local2 = f95_local1.modInfo
		if f95_local2 and f95_local2.ugcInfo and LobbyVM.OnModUpdate( f95_local2 ) then
			return 
		end
		local f95_local3 = f95_local1.usermapInfo
		if f95_local3 and f95_local3.ugcInfo and LobbyVM.OnUsermapUpdate( f95_local3 ) then
			return 
		end
	end
end

Lobby.Platform.Init()
