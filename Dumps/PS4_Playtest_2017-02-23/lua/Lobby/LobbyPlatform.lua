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
Lobby.Platform.PlatformSessionGetPartyPrivacyStatus = function ( partyPrivacy )
	local partyPrivacyStatus = "OPEN"
	if partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		partyPrivacyStatus = "OPEN"
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		partyPrivacyStatus = "FRIENDS ONLY"
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		partyPrivacyStatus = "INVITE ONLY"
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		partyPrivacyStatus = "CLOSED"
	end
	return partyPrivacyStatus
end

Lobby.Platform.PlatformSessionOrbisEnabled = function ()
	if LuaDefine.isPS4 == false or Engine.IsDedicatedServer() then
		return false
	else
		return Dvar.platformSessionsOrbis:get() > Enum.PlatformSessions.PLATFORM_SESSIONS_OFF
	end
end

Lobby.Platform.PlatformSessionDurangoEnabled = function ()
	if LuaDefine.isXbox == false or Engine.IsDedicatedServer() then
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
	return Engine.GetDvarBool( "sv_running" )
end

Lobby.Platform.OnInit = function ( data )
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

Lobby.Platform.OnSessionStart = function ( data )
	local lobbyType = data.lobbyType
	Lobby.Platform.PlatformSessionDirty( lobbyType )
end

Lobby.Platform.OnSessionEnd = function ( data )
	local lobbyType = data.lobbyType
	Lobby.Platform.PlatformSessionDirty( lobbyType )
end

Lobby.Platform.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if Lobby.Platform.PlatformSessionDurangoEnabled() then
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.roundStart[i] = true
		end
	end
	if LuaDefine.isXbox then
		Engine.SetDvar( "xblive_rta_enabled", 0 )
	end
end

Lobby.Platform.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if LuaDefine.isPS4 == true and data.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() then
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			local controller = i - 1
			if Engine.NotifyPsPlusAsyncMultiplay ~= nil then
				Engine.NotifyPsPlusAsyncMultiplay( controller )
			end
		end
	end
	if Lobby.Platform.PlatformSessionDurangoEnabled() then
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.roundEnd[i] = true
		end
	end
	if LuaDefine.isXbox then
		Engine.SetDvar( "xblive_rta_enabled", 1 )
	end
end

Lobby.Platform.OnPlatformPlayTogether = function ( data )
	if Dvar.platformSessionsOrbisPlayTogetherEnabled:exists() == false or Dvar.platformSessionsOrbisPlayTogetherEnabled:get() == false then
		return 
	end
	local controller = data.controller
	if Lobby.Timer.LobbyIsLocked() then
		LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CANNOT_JOIN_LOBBY_LOCKED", "MENU_MATCH_LOCKED" )
		return 
	elseif data.error == true then
		local debugInfo = data.debugInfo
		return 
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if not Engine.IsRunningUILevel() then
			local gameJoinData = {
				controller = controller,
				xuid = 0,
				platform = true,
				platformData = data,
				playTogether = true,
				migrating = not CoDShared.QuitGame( controller )
			}
			LobbyVM.OnInGameJoin( gameJoinData, true )
			return 
		end
		local joinProcess = Lobby.Platform.PS4ProcessPlayTogetherEvent( data )
		if joinProcess ~= nil then
			local menuId = Engine.GetLobbyUIScreen()
			local curScreen = LobbyData.GetLobbyMenuByID( menuId )
			local recoverToMenu = nil
			if curScreen.networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				local f12_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
				recoverToMenu = f12_local0.id
			else
				local f12_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
				recoverToMenu = f12_local0.id
			end
			local recoverProcess = Lobby.Process.Recover( controller, recoverToMenu )
			Lobby.Process.AppendProcess( recoverProcess, joinProcess )
			Lobby.ProcessQueue.AddToQueue( "OnPlatformPlayTogether", recoverProcess )
		end
	end
end

Lobby.Platform.OnPlatformSessionDataUpdate = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local gamertag = data.gamertag
	local sessionId = data.sessionId
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "OnPlatformSessionDataUpdate event occurred, sessionId: '" .. sessionId .. "', gamertag: " .. gamertag .. ".\n" )
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "OnPlatformSessionDataUpdate event occurred, sessionId: '" .. sessionId .. "', gamertag: " .. gamertag .. ".\n" )
	end
	Lobby.Platform.PlatformSessionDirty( lobbyType )
end

Lobby.Platform.OnPlatformJoinOrbis = function ( data )
	local forController = data.forController
	local forXuid = data.forXuid
	local forGamertag = data.forGamertag
	local invite = data.invite
	local invitationId = data.invitationId
	local sessionId = data.sessionId
	local controller = forController
	if not Engine.IsRunningUILevel() then
		local f14_local0 = {
			controller = controller,
			xuid = 0
		}
		local f14_local1
		if invite then
			f14_local1 = Enum.JoinType.JOIN_TYPE_INVITE
			if not f14_local1 then
			
			else
				f14_local0.joinType = f14_local1
				f14_local0.platform = true
				f14_local0.platformData = data
				f14_local0.migrating = not CoDShared.QuitGame( controller )
				LobbyVM.OnInGameJoin( f14_local0, true )
				return 
			end
		end
		f14_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	else
		if invite == true then
			local process = Lobby.ProcessPlatform.PS4AcceptInvite( forController, forXuid, invitationId, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
			Lobby.ProcessQueue.AddToQueue( "PS4AcceptInvite", process )
		else
			local process = Lobby.ProcessPlatform.PS4SessionJoin( forController, sessionId, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
			Lobby.ProcessQueue.AddToQueue( "PS4SessionJoin", process )
		end
	end
end

Lobby.Platform.InGamePlatformJoinOrbis = function ( data )
	local forController = data.forController
	local forXuid = data.forXuid
	local forGamertag = data.forGamertag
	local invite = data.invite
	local invitationId = data.invitationId
	local sessionId = data.sessionId
	local controller = forController
	if invite == true then
		return Lobby.ProcessPlatform.PS4AcceptInvite( forController, forXuid, invitationId, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
	else
		return Lobby.ProcessPlatform.PS4SessionJoin( forController, sessionId, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
	end
end

Lobby.Platform.OnPlatformJoinDurango = function ( data )
	local invite = data.invite
	local controller = 0
	local joinXuid = 0
	if invite == true then
		joinXuid = data.senderXuid
		controller = Engine.GetControllerForXuid( data.invitedXuid )
	else
		joinXuid = data.joineeXuid
		controller = Engine.GetControllerForXuid( data.joinerXuid )
	end
	if controller == LuaDefine.INVALID_CONTROLLER_PORT then
		Engine.Durango_TryToSetXUIDToGPad( data.invitedXuid )
		return nil
	elseif Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE, joinXuid ) or Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, joinXuid ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of.\n" )
		Engine.PlatformSessionClearInviteJoinInfo()
		return nil
	elseif not Engine.IsRunningUILevel() then
		local f16_local0 = {
			controller = controller,
			xuid = joinXuid
		}
		local f16_local1
		if invite then
			f16_local1 = Enum.JoinType.JOIN_TYPE_INVITE
			if not f16_local1 then
			
			else
				f16_local0.joinType = f16_local1
				f16_local0.platform = true
				f16_local0.platformData = data
				f16_local0.migrating = not CoDShared.QuitGame( controller )
				LobbyVM.OnInGameJoin( f16_local0, true )
				return nil
			end
		end
		f16_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	end
	local invite = data.invite
	if invite == true then
		local senderXuid = data.senderXuid
		local invitedXuid = data.invitedXuid
		local invitedController = Engine.GetControllerForXuid( invitedXuid )
		local process = Lobby.ProcessPlatform.XboxJoin( invitedController, senderXuid, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
		Lobby.ProcessQueue.AddToQueue( "XboxAcceptInvite", process )
	else
		local joineeXuid = data.joineeXuid
		local joinerXuid = data.joinerXuid
		local joinerController = Engine.GetControllerForXuid( joinerXuid )
		local process = Lobby.ProcessPlatform.XboxJoin( joinerController, joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
		Lobby.ProcessQueue.AddToQueue( "XboxSessionJoin", process )
	end
end

Lobby.Platform.InGamePlatformJoinDurango = function ( data )
	local invite = data.invite
	if invite == true then
		local invitedXuid = data.invitedXuid
		local senderXuid = data.senderXuid
		local invitedController = Engine.GetControllerForXuid( invitedXuid )
		return Lobby.ProcessPlatform.XboxJoin( invitedController, senderXuid, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
	else
		local joinerXuid = data.joinerXuid
		local joineeXuid = data.joineeXuid
		local joinerController = Engine.GetControllerForXuid( joinerXuid )
		return Lobby.ProcessPlatform.XboxJoin( joinerController, joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
	end
end

Lobby.Platform.OnPlatformJoin = function ( data )
	if LuaDefine.isPS4 or LuaDefine.isXbox then
		if Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmInitialStillDownloading() or Engine.IsMpInitialStillDownloading() then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CANNOT_JOIN_DURING_INSTALL" )
			return 
		elseif Lobby.Timer.LobbyIsLocked() then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CANNOT_JOIN_LOBBY_LOCKED", "MENU_MATCH_LOCKED" )
			return 
		elseif LuaDefine.isXbox then
			local invite = data.invite
			local joinXuid = 0
			if invite == true then
				joinXuid = data.senderXuid
			else
				joinXuid = data.joineeXuid
			end
			if Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE, joinXuid ) or Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, joinXuid ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of.\n" )
				Engine.PlatformSessionClearInviteJoinInfo()
				return 
			end
		end
	end
	if data.error == true then
		local debugInfo = data.debugInfo
		return 
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Lobby.Platform.OnPlatformJoinOrbis( data )
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		Lobby.Platform.OnPlatformJoinDurango( data )
	end
end

Lobby.Platform.PlatformSessionDirty = function ( lobbyType )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if lobbyType ~= Enum.LobbyType.LOBBY_TYPE_PRIVATE then
			return 
		end
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.PS4.changed[i] = true
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.changed[i][lobbyType + 1] = true
		end
	end
end

Lobby.Platform.TRCPump = function ()
	if LuaDefine.isPS4 == false then
		return 
	elseif Engine.GetLuaCodeVersion() < 4 then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			local controller = i - 1
			if Engine.IsControllerBeingUsed( controller ) then
				Engine.NotifyPsPlus( controller )
				Engine.DisplayChatRestrictionForUser( controller )
				Engine.DisplayContentRestrictionForUser( controller )
			end
		end
	end
end

local PS4SetSessionId = function ( controller, sessionId )
	Lobby.Platform.PS4.sessionId[controller + 1] = sessionId
	Lobby.Platform.PS4.lobbyId[controller + 1] = Engine.GetLobbyLobbyID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	Engine.PlatformSessionSetDebugInfo( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
end

Lobby.Platform.PS4GetSessionId = function ( controller )
	local sessionId = Lobby.Platform.PS4.sessionId[controller + 1]
	return sessionId
end

local PS4SetSessionFailure = function ( controller, lobbyType, sessionFailure, sessionFailureTime )
	Lobby.Platform.PS4.sessionFailure[controller + 1] = sessionFailure
	Lobby.Platform.PS4.sessionFailureTime[controller + 1] = sessionFailureTime
end

local PS4SignOutClear = function ( controller )
	local luaController = controller + 1
	Lobby.Platform.PS4.sessionId[luaController] = ""
	Lobby.Platform.PS4.lobbyId[luaController] = 0
	Lobby.Platform.PS4.changed[luaController] = 0
	Lobby.Platform.PS4.sessionFailure[luaController] = false
	Lobby.Platform.PS4.sessionFailureTime[luaController] = 0
	Lobby.Platform.PS4.lastSignedInState[luaController] = false
	Engine.PlatformSessionSetDebugInfo( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, "" )
end

Lobby.Platform.PlatformSessionPS4Error = function ( controller, returnCodeHex )
	local errorAction = Dvar.platformSessionsOrbis:get()
	Lobby.Platform.PS4.taskInProgress = false
	Engine.PlatformSessionCancelTasks()
	if errorAction == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_NONFATAL then
		PS4SetSessionFailure( controller, true, Engine.seconds() + Engine.GetDvarInt( Lobby.Platform.DISABLE_PLATFORM_SESSIONS ) )
	elseif errorAction == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_FATAL then
		if Engine.IsInGame() == true then
			return 
		end
		local curScreen = LobbyData.GetCurrentMenuTarget()
		local f25_local0 = curScreen.id
		local f25_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
		if f25_local0 == f25_local1.id then
			return 
		end
		local data = {
			controller = controller,
			signoutUsers = false
		}
		LobbyVM.ExecuteLobbyVMRequest( LuaEnum.LOBBYVM_REQUEST.FORCE_LOCAL_MODE )
		Engine.LobbyLaunchClear()
		Lobby.ProcessQueue.ClearQueue()
		LobbyVM.ErrorShutdown( data )
		LobbyVM.ShutdownCleanup( data )
		if Dvar.platformSessionShowErrorCodes:get() == true then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "Platform Session Error: " .. returnCodeHex )
		else
			LuaUtils.UI_ShowErrorMessageDialog( controller, "PLATFORM_PLATFORM_SESSION_ERROR" )
		end
		return 
	end
end

Lobby.Platform.PlatformSessionPS4GetLockFlag = function ( partyPrivacy )
	local lockFlag = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	if partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		lockFlag = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		lockFlag = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		lockFlag = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.UNLOCKED
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		lockFlag = Lobby.Platform.PLATFORM_SESSION_PS4_LOCK_FLAG.LOCKED
	end
	return lockFlag
end

Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag = function ( partyPrivacy )
	local sessionTypeFlag = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	if partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		sessionTypeFlag = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		sessionTypeFlag = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		sessionTypeFlag = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PRIVATE
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		sessionTypeFlag = Lobby.Platform.PLATFORM_SESSION_PS4_SESSION_FLAG.PUBLIC
	end
	return sessionTypeFlag
end

Lobby.Platform.PlatformSessionPS4CreateComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			PS4SetSessionId( controller, data.sessionId )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete, we have successfully created session id: '" .. Lobby.Platform.PS4GetSessionId( controller ) .. "'.\n" )
			if controller == Engine.GetPrimaryController() and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete, we are host of private session, setting session data.\n" )
				Engine.PlatformSessionPS4SetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Lobby.Platform.PS4GetSessionId( controller ) )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if isError == true then
		Lobby.Platform.PlatformSessionPS4Error( controller, returnCodeHex )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Create = function ( controller, lobbyType, maxSlot )
	Lobby.Platform.PS4.taskInProgress = true
	Dvar.platformSessionOrbisName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_PLATFORM_SESSION_NAME" ) )
	Dvar.platformSessionOrbisStatus:set( "" )
	Dvar.platformSessionOrbisImgPath:set( "" )
	Dvar.platformSessionOrbisImg:set( "platform_session.png" )
	local partyPrivacy = Engine.GetPartyPrivacy()
	local lockFlag = Lobby.Platform.PlatformSessionPS4GetLockFlag( partyPrivacy )
	Lobby.Platform.PS4.lockFlag[controller + 1] = partyPrivacy
	Dvar.platformSessionOrbisLockFlag:set( lockFlag )
	local sessionTypeFlag = Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag( partyPrivacy )
	Lobby.Platform.PS4.sessionTypeFlag[controller + 1] = partyPrivacy
	Dvar.platformSessionOrbisSessionTypeFlag:set( sessionTypeFlag )
	local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4CreateComplete, {
		controller = controller,
		lobbyType = lobbyType,
		maxSlot = maxSlot
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create started.\n" )
	if Engine.IsShipBuild() == false and Engine.GetDvarInt( "platformSessionCreateFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Create( actionId, controller, lobbyType, maxSlot ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionJoinCompletePS4 = function ( completeState, eventData, data )
	local controller = eventData.controller
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionJoinCompletePS4 ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			if data.sessionId ~= nil then
				PS4SetSessionId( controller, data.sessionId )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionJoinCompletePS4, we have successfully joined session id: '" .. Lobby.Platform.PS4GetSessionId( controller ) .. "'.\n" )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if isError == true then
		Lobby.Platform.PlatformSessionPS4Error( controller, returnCodeHex )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Join = function ( controller, lobbyType, sessionId )
	Lobby.Platform.PS4.taskInProgress = true
	local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionJoinCompletePS4, {
		controller = controller,
		lobbyType = lobbyType,
		sessionId = sessionId
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join started, joining sessionId: '" .. sessionId .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.GetDvarInt( "platformSessionJoinFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Join( actionId, controller, lobbyType, sessionId ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4LeaveComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			local platformSession = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete, we have successfully left session id: '" .. Lobby.Platform.PS4GetSessionId( controller ) .. "'.\n" )
			if controller == Engine.GetPrimaryController() and platformSession.sessionId == Lobby.Platform.PS4GetSessionId( controller ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete, we are host of private session, clearing session data.\n" )
				Engine.PlatformSessionPS4ClearData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	PS4SetSessionId( controller, "" )
	Lobby.Platform.PS4.taskInProgress = false
	if isError == true then
		Lobby.Platform.PlatformSessionPS4Error( controller, returnCodeHex )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Leave = function ( controller, lobbyType, sessionId )
	Lobby.Platform.PS4.taskInProgress = true
	local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4LeaveComplete, {
		controller = controller,
		lobbyType = lobbyType,
		sessionId = sessionId
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave started, leaving sessionId: '" .. sessionId .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.GetDvarInt( "platformSessionLeaveFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Leave( actionId, controller, lobbyType, sessionId ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4SetPartyPrivacyComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local lobbyType = eventData.lobbyType
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacyComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			local partyPrivacy = eventData.partyPrivacy
			Lobby.Platform.PS4.lockFlag[controller + 1] = partyPrivacy
			Lobby.Platform.PS4.sessionTypeFlag[controller + 1] = partyPrivacy
			local partyPrivacyStatus = Lobby.Platform.PlatformSessionGetPartyPrivacyStatus( partyPrivacy )
			Engine.PlatformSessionSetDebugInfo( controller, Enum.LobbyType.LOBBY_TYPE_GAME, "partyPrivacyStatus: " .. partyPrivacyStatus )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacyComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if isError == true then
		Engine.PlatformSessionSetDebugInfo( controller, Enum.LobbyType.LOBBY_TYPE_GAME, "partyPrivacyStatus: ERROR" )
		Lobby.Platform.PlatformSessionPS4Error( controller, lobbyType, returnCodeHex )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4SetPartyPrivacy = function ( controller, lobbyType, sessionId, partyPrivacy )
	local curLockFlag = Lobby.Platform.PlatformSessionPS4GetLockFlag( Lobby.Platform.PS4.lockFlag[controller + 1] )
	local lockFlag = Lobby.Platform.PlatformSessionPS4GetLockFlag( partyPrivacy )
	local curSessionTypeFlag = Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag( Lobby.Platform.PS4.sessionTypeFlag[controller + 1] )
	local sessionTypeFlag = Lobby.Platform.PlatformSessionPS4GetSessionTypeFlag( partyPrivacy )
	if curLockFlag == lockFlag and curSessionTypeFlag == sessionTypeFlag then
		Lobby.Platform.PS4.lockFlag[controller + 1] = partyPrivacy
		Lobby.Platform.PS4.sessionTypeFlag[controller + 1] = partyPrivacy
		return 
	else
		Lobby.Platform.PS4.taskInProgress = true
		local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4SetPartyPrivacyComplete, {
			controller = controller,
			lobbyType = lobbyType,
			sessionId = sessionId,
			partyPrivacy = partyPrivacy
		} )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy started.\n" )
		if Engine.IsShipBuild() == false and 1 == Engine.GetDvarInt( "platformSessionSetPartyPrivacyFailure" ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy FAILURE TEST.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = actionId,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		else
			Dvar.platformSessionOrbisLockFlag:set( lockFlag )
			Dvar.platformSessionOrbisSessionTypeFlag:set( sessionTypeFlag )
			if Engine.PlatformSessionPS4Update( actionId, controller, lobbyType, sessionId ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4SetPartyPrivacy failed to start.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = actionId,
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

Lobby.Platform.PlatformSessionPS4PumpController = function ( controller, isBeingUsed, lobbyType, maxSlot, isLiveMode, isActive, isHost, hostController )
	local luaController = controller + 1
	local sessionId = Lobby.Platform.PS4GetSessionId( controller )
	local lobbyId = Lobby.Platform.PS4.lobbyId[luaController]
	local f36_local0 = string.len( sessionId ) > 0
	local sessionFailure = Lobby.Platform.PS4.sessionFailure[luaController]
	if isLiveMode == false then
		if f36_local0 == false and sessionFailure == false then
			return 
		elseif f36_local0 == true and sessionFailure == false then
			Lobby.Platform.PlatformSessionPS4Leave( controller, lobbyType, sessionId )
		else
			PS4SetSessionId( controller, "" )
			Lobby.Platform.PS4.sessionFailure[luaController] = false
		end
		return 
	elseif isActive == false or isBeingUsed == false then
		if f36_local0 == false and sessionFailure == false then
			return 
		elseif f36_local0 == true and sessionFailure == false then
			Lobby.Platform.PlatformSessionPS4Leave( controller, lobbyType, sessionId )
		else
			PS4SetSessionId( controller, "" )
			Lobby.Platform.PS4.sessionFailure[luaController] = false
		end
		return 
	elseif Lobby.Platform.PS4.changed[luaController] == true then
		local platformSession = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local curlobbyId = Engine.GetLobbyLobbyID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if f36_local0 == true and (platformSession.sessionId ~= sessionId or curlobbyId ~= lobbyId) then
			Lobby.Platform.PlatformSessionPS4Leave( controller, lobbyType, sessionId )
		end
		Lobby.Platform.PS4.changed[luaController] = false
		return 
	elseif sessionFailure == false then
		if f36_local0 == true then
			if true == Dvar.platformSessionPartyPrivacy:get() and controller == hostController and lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
				local partyPrivacy = Engine.GetPartyPrivacy()
				if Lobby.Platform.PS4.lockFlag[luaController] ~= partyPrivacy then
					Lobby.Platform.PlatformSessionPS4SetPartyPrivacy( controller, lobbyType, sessionId, partyPrivacy )
					return 
				end
			end
			return 
		elseif isHost == true and controller == hostController then
			Lobby.Platform.PlatformSessionPS4Create( controller, lobbyType, maxSlot )
			return 
		end
		local platformSession = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if platformSession.sessionId ~= "" then
			Lobby.Platform.PlatformSessionPS4Join( controller, lobbyType, platformSession.sessionId )
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
		local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		local maxSlot = 18
		local f37_local1 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
		local isActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
		local isHost = Engine.IsLobbyHost( lobbyType )
		if isHost then
			local f37_local2 = Engine.GetLobbyHostControllerIndex( lobbyType )
			if not f37_local2 then
			
			else
				for luaController = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
					local controller = luaController - 1
					local isSignedIn = Engine.IsSignedInToLive( controller )
					local isBeingUsed = Engine.IsControllerBeingUsed( controller )
					if isSignedIn == true then
						Lobby.Platform.PlatformSessionPS4PumpController( controller, isBeingUsed, lobbyType, maxSlot, f37_local1, isActive, isHost, f37_local2 )
					elseif Lobby.Platform.PS4.lastSignedInState[luaController] == true then
						PS4SignOutClear( controller )
					end
					Lobby.Platform.PS4.lastSignedInState[luaController] = isSignedIn
					if Lobby.Platform.PS4.taskInProgress == true then
						return 
					end
				end
			end
		end
		local hostController = LuaDefine.INVALID_CONTROLLER_PORT
	end
	Lobby.Platform.PS4.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalOrbis:get()
	return 
end

local XboxSetTemplateName = function ( controller, lobbyType, templateName )
	Lobby.Platform.XBOX.templateName[controller + 1][lobbyType + 1] = templateName
end

local XboxGetTemplateName = function ( controller, lobbyType )
	local templateName = Lobby.Platform.XBOX.templateName[controller + 1][lobbyType + 1]
	return templateName
end

local XboxSetSessionId = function ( controller, lobbyType, sessionId )
	Lobby.Platform.XBOX.sessionId[controller + 1][lobbyType + 1] = sessionId
	Engine.PlatformSessionSetDebugInfo( controller, lobbyType, sessionId )
end

local XboxGetSessionId = function ( controller, lobbyType )
	local sessionId = Lobby.Platform.XBOX.sessionId[controller + 1][lobbyType + 1]
	return sessionId
end

local XboxSetChanged = function ( controller, lobbyType, changed )
	Lobby.Platform.XBOX.changed[controller + 1][lobbyType + 1] = changed
end

local XboxGetChanged = function ( controller, lobbyType )
	local changed = Lobby.Platform.XBOX.changed[controller + 1][lobbyType + 1]
	return changed
end

local XboxSetSessionFailure = function ( controller, sessionFailure, sessionFailureTime )
	Lobby.Platform.XBOX.sessionFailure[controller + 1] = sessionFailure
	Lobby.Platform.XBOX.sessionFailureTime[controller + 1] = sessionFailureTime
end

local XboxGetSessionFailure = function ( controller )
	local sessionFailure = Lobby.Platform.XBOX.sessionFailure[controller + 1]
	return sessionFailure
end

local XboxGetTemplateNameSessionId = function ( controller, lobbyType )
	return XboxGetTemplateName( controller, lobbyType ), XboxGetSessionId( controller, lobbyType )
end

local XboxSetDebugInfoMatchStartEnd = function ( controller, lobbyType )
	local startEndInfo = "  start[ " .. tostring( Lobby.Platform.XBOX.roundStartCounter[controller + 1] ) .. " ], end[ " .. tostring( Lobby.Platform.XBOX.roundEndCounter[controller + 1] ) .. " ]"
	Engine.PlatformSessionSetDebugInfo( controller, lobbyType, XboxGetSessionId( controller, lobbyType ), startEndInfo )
end

local XboxClearSessions = function ( controller, signedOut )
	local luaController = controller + 1
	Lobby.Platform.XBOX.disabled[luaController] = false
	XboxSetSessionFailure( controller, false, 0 )
	Lobby.Platform.XBOX.lastSignedInState[luaController] = false
	for f48_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
		XboxSetSessionId( controller, f48_local0, "" )
		XboxSetChanged( controller, f48_local0, false )
		Engine.PlatformSessionXboxXBLiveSessionClear( controller, f48_local0 )
	end
	Lobby.Platform.XBOX.roundStart[luaController] = false
	Lobby.Platform.XBOX.roundStartSessionId[luaController] = ""
	Lobby.Platform.XBOX.roundEnd[luaController] = false
	Lobby.Platform.XBOX.playerSessionId[luaController] = nil
	Lobby.Platform.XBOX.roundStartTime[luaController] = 0
	Lobby.Platform.XBOX.roundStartCounter[luaController] = 0
	Lobby.Platform.XBOX.roundEndCounter[luaController] = 0
	Lobby.Platform.XBOX.sessionClosed[luaController] = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	Lobby.Platform.XBOX.joinRestriction[luaController] = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	Lobby.Platform.XBOX.visibility[luaController] = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	if signedOut == true then
		Lobby.Platform.XBOX.rtaSubscribe[luaController] = false
	end
end

Lobby.Platform.PlatformSessionUpdateErrorCount = function ( controller )
	local luaController = controller + 1
	if not Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	end
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if stats == nil then
		return 
	end
	local errorCount = stats.demonwareflags[15]:get()
	errorCount = errorCount + 1
	if errorCount > 255 then
		errorCount = 255
	end
	stats.demonwareflags[15]:set( errorCount )
	Lobby.Platform.XBOX.disabled[luaController] = nil
end

Lobby.Platform.PlatformSessionXboxError = function ( controller, lobbyType, returnCodeHex )
	local errorAction = Dvar.platformSessionsDurango:get()
	Lobby.Platform.XBOX.taskInProgress = false
	Lobby.Platform.PlatformSessionUpdateErrorCount( controller )
	Engine.PlatformSessionCancelTasks()
	if errorAction == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_NONFATAL then
		XboxClearSessions( controller, false )
		XboxSetSessionFailure( controller, true, Lobby.Platform.DISABLE_PLATFORM_SESSIONS )
	elseif errorAction == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_FATAL then
		LobbyVM.ExecuteLobbyVMRequest( LuaEnum.LOBBYVM_REQUEST.FORCE_LOCAL_MODE )
		if Dvar.platformSessionShowErrorCodes:get() == true then
			Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "Platform Session Error: " .. returnCodeHex )
		else
			Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "PLATFORM_PLATFORM_SESSION_ERROR" )
		end
	end
end

Lobby.Platform.PlatformSessionXboxGenerateSessionId = function ( lobbyType )
	local hostInfo = Engine.GetLobbyHostInfo( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	if hostInfo == nil then
		return false, ""
	else
		local xboxSessionId = Engine.PlatformSessionXboxSecIdToSessionId( hostInfo.secId )
		return true, xboxSessionId
	end
end

Lobby.Platform.PlatformSessionXboxCreateComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local lobbyType = eventData.lobbyType
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreateComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			XboxSetSessionId( controller, lobbyType, data.sessionId )
			Engine.PlatformSessionXboxSetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE, XboxGetSessionId( controller, lobbyType ), XboxGetTemplateName( controller, lobbyType ) )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreateComplete, we have successfully created session id: '" .. data.sessionId .. "'.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if isError == true then
		Lobby.Platform.PlatformSessionXboxError( controller, lobbyType, returnCodeHex )
		return true
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS and isError == false and lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		Lobby.Platform.PlatformSessionXboxSetActivity( controller, lobbyType )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxCreate = function ( controller, lobbyType )
	Lobby.Platform.XBOX.taskInProgress = true
	local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxCreateComplete, {
		controller = controller,
		lobbyType = lobbyType
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate started.\n" )
	local templateName = XboxGetTemplateName( controller, lobbyType )
	local retVal, sessionId = Lobby.Platform.PlatformSessionXboxGenerateSessionId( lobbyType )
	if Engine.IsShipBuild() == false and Engine.GetDvarInt( "platformSessionCreateFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif retVal == false or Engine.PlatformSessionXboxCreateJoin( actionId, controller, lobbyType, templateName, sessionId ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxSetActivityComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local lobbyType = eventData.lobbyType
	local sessionId = eventData.sessionId
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivityComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivityComplete, we have successfully set sessionId: '" .. sessionId .. "' to be the activity session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if isError == true then
		Lobby.Platform.PlatformSessionXboxError( controller, lobbyType, returnCodeHex )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxSetActivity = function ( controller, lobbyType )
	Lobby.Platform.XBOX.taskInProgress = true
	local templateName, sessionId = XboxGetTemplateNameSessionId( controller, lobbyType )
	local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetActivityComplete, {
		controller = controller,
		lobbyType = lobbyType,
		sessionId = sessionId
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity started for sessionId: '" .. sessionId .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.GetDvarInt( "platformSessionSetActivityFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxSetActivity( actionId, controller, lobbyType, templateName, sessionId ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxLeaveComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local lobbyType = eventData.lobbyType
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeaveComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			local platformSession = Engine.PlatformSessionXboxGetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeaveComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	XboxSetSessionId( controller, lobbyType, "" )
	Lobby.Platform.XBOX.taskInProgress = false
	if isError == true then
		Lobby.Platform.PlatformSessionXboxError( controller, lobbyType, returnCodeHex )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxLeave = function ( controller, lobbyType, sessionId )
	Lobby.Platform.XBOX.taskInProgress = true
	Lobby.Platform.PlatformSessionXboxRoundEnd( controller, lobbyType )
	local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxLeaveComplete, {
		controller = controller,
		lobbyType = lobbyType
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave started.\n" )
	local templateName, sessionId = XboxGetTemplateNameSessionId( controller, lobbyType )
	if Engine.IsShipBuild() == false and Engine.GetDvarInt( "platformSessionLeaveFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxLeave( actionId, controller, lobbyType, templateName, sessionId ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxSetSessionClosedSetDebugStatus = function ( controller, lobbyType, sessionId, partyPrivacy )
	local partyPrivacyStatus = "OPEN"
	if partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		partyPrivacyStatus = "OPEN"
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		partyPrivacyStatus = "FRIENDS ONLY"
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		partyPrivacyStatus = "INVITE ONLY"
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		partyPrivacyStatus = "CLOSED"
	end
	Engine.PlatformSessionSetDebugInfo( controller, lobbyType, sessionId, partyPrivacyStatus )
end

Lobby.Platform.PlatformSessionXboxSetSessionClosedComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local lobbyType = eventData.lobbyType
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosedComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			Lobby.Platform.XBOX.sessionClosed[controller + 1] = eventData.partyPrivacy
			Lobby.Platform.PlatformSessionXboxSetSessionClosedSetDebugStatus( controller, lobbyType, eventData.sessionId, eventData.partyPrivacy )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosedComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if isError == true then
		Engine.PlatformSessionSetDebugInfo( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, eventData.sessionId, "ERROR" )
		Lobby.Platform.PlatformSessionXboxError( controller, lobbyType, returnCodeHex )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxIsSessionClosed = function ( partyPrivacy )
	local closed = false
	if partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		closed = false
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		closed = false
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		closed = false
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		closed = true
	end
	return closed
end

Lobby.Platform.PlatformSessionXboxSetSessionClosed = function ( controller, lobbyType, sessionId, partyPrivacy )
	local wasClosed = Lobby.Platform.PlatformSessionXboxIsSessionClosed( Lobby.Platform.XBOX.sessionClosed[controller + 1] )
	local closed = Lobby.Platform.PlatformSessionXboxIsSessionClosed( partyPrivacy )
	if wasClosed == closed then
		Lobby.Platform.XBOX.sessionClosed[controller + 1] = partyPrivacy
		Lobby.Platform.PlatformSessionXboxSetSessionClosedSetDebugStatus( controller, lobbyType, sessionId, partyPrivacy )
		return 
	else
		Lobby.Platform.XBOX.taskInProgress = true
		local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetSessionClosedComplete, {
			controller = controller,
			lobbyType = lobbyType,
			sessionId = sessionId,
			partyPrivacy = partyPrivacy
		} )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed started.\n" )
		if Engine.IsShipBuild() == false and 1 == Engine.GetDvarInt( "platformSessionSetSessionClosedFailure" ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed FAILURE TEST.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = actionId,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		elseif Engine.PlatformSessionXboxSetSessionClosed( actionId, controller, lobbyType, closed ) == false then
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed to start.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = actionId,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		else
			
		end
	end
end

Lobby.Platform.PlatformSessionXboxSetJoinRestrictionComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local lobbyType = eventData.lobbyType
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestrictionComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			Lobby.Platform.XBOX.joinRestriction[controller + 1] = eventData.partyPrivacy
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestrictionComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if isError == true then
		Lobby.Platform.PlatformSessionXboxError( controller, lobbyType, returnCodeHex )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxGetJoinRestriction = function ( partyPrivacy )
	local joinRestriction = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_NONE
	if partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		joinRestriction = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_NONE
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		joinRestriction = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_FOLLOWED
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		joinRestriction = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_LOCAL
	elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		joinRestriction = Enum.DurangoSessionJoinRestriction.DURANGO_SESSION_JOIN_RESTRICTION_LOCAL
	end
	return joinRestriction
end

Lobby.Platform.PlatformSessionXboxSetJoinRestriction = function ( controller, lobbyType, sessionId, partyPrivacy )
	local curJoinRestriction = Lobby.Platform.PlatformSessionXboxGetJoinRestriction( Lobby.Platform.XBOX.joinRestriction[controller + 1] )
	local joinRestriction = Lobby.Platform.PlatformSessionXboxGetJoinRestriction( partyPrivacy )
	if curJoinRestriction == joinRestriction then
		Lobby.Platform.XBOX.joinRestriction[controller + 1] = partyPrivacy
		return 
	else
		Lobby.Platform.XBOX.taskInProgress = true
		local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetJoinRestrictionComplete, {
			controller = controller,
			lobbyType = lobbyType,
			sessionId = sessionId,
			partyPrivacy = partyPrivacy,
			joinRestriction = joinRestriction
		} )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction started.\n" )
		if Engine.IsShipBuild() == false and 1 == Engine.GetDvarInt( "platformSessionSetJoinRestrictionFailure" ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction FAILURE TEST.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = actionId,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		elseif Engine.PlatformSessionXboxSetJoinRestriction( actionId, controller, lobbyType, joinRestriction ) == false then
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed to start.\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = actionId,
				isError = true,
				returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
				returnCodeHex = "EVENT START ERROR"
			} )
			return 
		else
			
		end
	end
end

Lobby.Platform.PlatformSessionXboxSetVisibilityComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local lobbyType = eventData.lobbyType
	local isError = data.isError
	local returnCode = data.returnCode
	local returnCodeHex = data.returnCodeHex
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibilityComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if isError == false then
			Lobby.Platform.XBOX.visibility[controller + 1] = eventData.partyPrivacy
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibilityComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility failed: " .. returnCodeHex .. "\n" )
		end
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility failed: " .. returnCodeHex .. "\n" )
		isError = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if isError == true then
		Lobby.Platform.PlatformSessionXboxError( controller, lobbyType, returnCodeHex )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxSetVisibility = function ( controller, lobbyType, sessionId, partyPrivacy )
	Lobby.Platform.XBOX.taskInProgress = true
	local visibility = Enum.DurangoSessionVisibility.DURANGO_SESSION_VISIBILITY_OPEN
	if partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		visibility = Enum.DurangoSessionVisibility.DURANGO_SESSION_VISIBILITY_PRIVATE
	end
	local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetVisibilityComplete, {
		controller = controller,
		lobbyType = lobbyType,
		sessionId = sessionId,
		partyPrivacy = partyPrivacy,
		visibility = visibility
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility started.\n" )
	if Engine.IsShipBuild() == false and Engine.GetDvarInt( "platformSessionSetVisibilityFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxSetSessionVisibility( actionId, controller, lobbyType, visibility ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetVisibility failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = actionId,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxRoundStart = function ( controller, lobbyType )
	local luaController = controller + 1
	Lobby.Platform.XBOX.roundStart[luaController] = false
	local templateName, sessionId = XboxGetTemplateNameSessionId( controller, lobbyType )
	local retVal, playerSessionId = Engine.PlatformSessionXboxMultiplayerRoundStart( controller, lobbyType, templateName, sessionId )
	if retVal == true then
		Lobby.Platform.XBOX.roundStartSessionId[luaController] = sessionId
		Lobby.Platform.XBOX.roundStartTime[luaController] = Engine.milliseconds()
		Lobby.Platform.XBOX.roundStartCounter[luaController] = Lobby.Platform.XBOX.roundStartCounter[luaController] + 1
		XboxSetDebugInfoMatchStartEnd( controller, lobbyType )
		Lobby.Platform.XBOX.playerSessionId[luaController] = playerSessionId.guid
	end
end

Lobby.Platform.PlatformSessionXboxRoundEnd = function ( controller, lobbyType )
	local luaController = controller + 1
	Lobby.Platform.XBOX.roundEnd[luaController] = false
	local playerSessionId = Lobby.Platform.XBOX.playerSessionId[luaController]
	if playerSessionId ~= nil then
		local roundStartTime = Lobby.Platform.XBOX.roundStartTime[luaController]
		local templateName, sessionId = XboxGetTemplateNameSessionId( controller, lobbyType )
		local roundStartSessionId = Lobby.Platform.XBOX.roundStartSessionId[luaController]
		local currenSessionId = XboxGetSessionId( controller, lobbyType )
		if roundStartSessionId == currenSessionId then
			Engine.PlatformSessionXboxMultiplayerRoundEnd( controller, lobbyType, templateName, roundStartSessionId, playerSessionId, roundStartTime )
			Lobby.Platform.XBOX.roundEndCounter[luaController] = Lobby.Platform.XBOX.roundEndCounter[luaController] + 1
			XboxSetDebugInfoMatchStartEnd( controller, lobbyType )
		end
	end
	Lobby.Platform.XBOX.roundStartSessionId[luaController] = nil
	Lobby.Platform.XBOX.playerSessionId[luaController] = nil
	Lobby.Platform.XBOX.roundStartTime[luaController] = 0
end

Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged = function ( data )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged().\n" )
end

Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost = function ( data )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost().\n" )
	if Dvar.platformSessionsDurangoAutoRTASubscription:get() == false then
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			local controller = i - 1
			XboxClearSessions( controller, false )
		end
	end
end

Lobby.Platform.OnPlatformSuspend = function ( data )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			local controller = i - 1
			Lobby.Platform.PlatformSessionXboxRoundEnd( controller, Enum.LobbyType.LOBBY_TYPE_GAME )
		end
	end
end

Lobby.Platform.OnPlatformResume = function ( data )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "OnPlatformResume(), clear all session data.\n" )
		Engine.PlatformSessionPS4ClearData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			PS4SetSessionId( i - 1, "" )
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxRTASubscription = function ( controller, isBeingUsed, lobbyType, isActive )
	if Dvar.platformSessionsDurangoAutoRTASubscription:get() == false then
		local luaController = controller + 1
		if isBeingUsed == true and Lobby.Platform.XBOX.rtaSubscribe[luaController] == false and isActive == true then
			local retVal, sessionChangeToken, subscriptionLostToken = Engine.PlatformSessionXboxSubscribeToRTA( controller )
			if retVal == true then
				Lobby.Platform.XBOX.rtaSubscribe[luaController] = true
				Lobby.Platform.XBOX.sessionChangeToken[luaController] = sessionChangeToken
				Lobby.Platform.XBOX.subscriptionLostToken[luaController] = subscriptionLostToken
			else
				Lobby.Platform.PlatformSessionXboxError( controller, lobbyType, "PlatformSessionXboxEnableRTASubscription" )
				return 
			end
		end
		if Lobby.Platform.XBOX.rtaSubscribe[luaController] == false then
			return 
		end
	end
end

Lobby.Platform.PlatformSessionXboxDisabled = function ( controller, isBeingUsed, lobbyType, isLiveMode, isActive )
	local luaController = controller + 1
	if Lobby.Platform.XBOX.disabled[luaController] == true then
		return true
	elseif isLiveMode == true and Lobby.Platform.XBOX.disabled[luaController] == nil and Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if stats then
			Lobby.Platform.XBOX.disabled[luaController] = false
			local platformSessionDisableCount = Engine.GetDvarInt( "platformSessionDisableCount" )
			if platformSessionDisableCount > -1 then
				local errorCount = stats.demonwareflags[15]:get()
				if platformSessionDisableCount <= errorCount then
					Lobby.Platform.XBOX.disabled[luaController] = true
					return true
				end
			end
		end
	end
	if Lobby.Platform.XBOX.sessionFailure[luaController] == true then
		if Lobby.Platform.XBOX.sessionFailureTime[luaController] == Lobby.Platform.DISABLE_PLATFORM_SESSIONS then
			return true
		elseif Lobby.Platform.XBOX.sessionFailureTime[luaController] < Engine.seconds() then
			Lobby.Platform.XBOX.sessionFailure[luaController] = false
			return false
		end
		return true
	end
end

Lobby.Platform.PlatformSessionXboxPumpController = function ( controller, isBeingUsed, lobbyType, isLiveMode, isActive, isHost, hostController )
	local luaController = controller + 1
	Lobby.Platform.PlatformSessionXboxRTASubscription( controller, isBeingUsed, lobbyType, isActive )
	local f75_local0 = string.len( XboxGetSessionId( controller, lobbyType ) ) > 0
	local changed = XboxGetChanged( controller, lobbyType )
	local roundStart = Lobby.Platform.XBOX.roundStart[luaController]
	local roundEnd = Lobby.Platform.XBOX.roundEnd[luaController]
	if Lobby.Platform.PlatformSessionXboxDisabled( controller, isBeingUsed, lobbyType, isLiveMode, isActive ) then
		return 
	elseif isLiveMode == false then
		if f75_local0 == true then
			Lobby.Platform.PlatformSessionXboxLeave( controller, lobbyType )
		end
		return 
	elseif f75_local0 == true and (isActive == false or isBeingUsed == false) then
		Lobby.Platform.PlatformSessionXboxLeave( controller, lobbyType )
		return 
	elseif isActive == false or isBeingUsed == false then
		return 
	elseif f75_local0 == false and changed == true then
		XboxSetChanged( controller, lobbyType, false )
	end
	if f75_local0 == true then
		if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
			if changed == true then
				local retVal, sessionId = Lobby.Platform.PlatformSessionXboxGenerateSessionId( lobbyType )
				if retVal == true and sessionId ~= XboxGetSessionId( controller, lobbyType ) then
					Lobby.Platform.PlatformSessionXboxLeave( controller, lobbyType )
				end
				XboxSetChanged( controller, lobbyType, false )
				return 
			elseif roundEnd == true then
				Lobby.Platform.PlatformSessionXboxRoundEnd( controller, lobbyType )
				return 
			elseif roundStart == true then
				Lobby.Platform.PlatformSessionXboxRoundStart( controller, lobbyType )
				return 
			end
		end
		if true == Dvar.platformSessionPartyPrivacy:get() and controller == hostController and lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
			local partyPrivacy = Engine.GetPartyPrivacy()
			local sessionId = XboxGetSessionId( controller, lobbyType )
			if Lobby.Platform.XBOX.sessionClosed[luaController] ~= partyPrivacy then
				Lobby.Platform.PlatformSessionXboxSetSessionClosed( controller, lobbyType, sessionId, partyPrivacy )
				return 
			elseif Lobby.Platform.XBOX.joinRestriction[luaController] ~= partyPrivacy then
				Lobby.Platform.PlatformSessionXboxSetJoinRestriction( controller, lobbyType, sessionId, partyPrivacy )
				return 
			end
			return 
		end
		return 
	end
	Lobby.Platform.PlatformSessionXboxCreate( controller, lobbyType )
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
	for luaController = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
		local controller = luaController - 1
		local isLiveContextReady = Engine.PlatformSessionXboxIsLiveContextForControllerReadyRaw( controller )
		local isBeingUsed = Engine.IsControllerBeingUsed( controller )
		if isLiveContextReady == true then
			for f76_local3 = Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyType.LOBBY_TYPE_PRIVATE, -1 do
				local isActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, f76_local3 )
				local isHost = Engine.IsLobbyHost( f76_local3 )
				if isHost then
					local f76_local6 = Engine.GetLobbyHostControllerIndex( f76_local3 )
					if not f76_local6 then
					
					else
						Lobby.Platform.PlatformSessionXboxPumpController( controller, isBeingUsed, f76_local3, f76_local0, isActive, isHost, f76_local6 )
						if Lobby.Platform.XBOX.taskInProgress == true then
							return 
						end
					end
				end
				local hostController = LuaDefine.INVALID_CONTROLLER_PORT
			end
		elseif Lobby.Platform.XBOX.lastSignedInState[luaController] == true then
			XboxClearSessions( controller, true )
		end
		Lobby.Platform.XBOX.lastSignedInState[luaController] = isLiveContextReady
	end
end

Lobby.Platform.InviteFailed = function ( data )
	local controller = data.controller
	local xuid = data.xuid
	local gamertag = data.gamertag
	Engine.LuiVM_Event( "open_toaster_popup", {
		isError = true,
		controller = controller,
		xuid = xuid,
		gamertag = gamertag,
		immediate = true
	} )
end

Lobby.Platform.InviteComplete = function ( completeState, eventData, data )
	local controller = eventData.controller
	local xuid = eventData.xuid
	local gamertag = eventData.gamertag
	if completeState == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		return false
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		Engine.LuiVM_Event( "open_toaster_popup", {
			isError = false,
			controller = controller,
			xuid = xuid,
			gamertag = gamertag,
			immediate = true
		} )
	elseif completeState == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or completeState == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		if true == Dvar.platformSessionShowErrorCodes:get() then
			eventData.gamertag = eventData.gamertag .. " - " .. returnCodeHex
		end
		Lobby.Platform.InviteFailed( eventData )
	end
	return true
end

Lobby.Platform.Invite = function ( data )
	if Lobby.Platform.PlatformSessionOrbisEnabled() == false and Lobby.Platform.PlatformSessionDurangoEnabled() == false then
		return 
	end
	local controller = data.controller
	local xuid = data.xuid
	local gamertag = data.gamertag
	local inviterGamertag = Engine.GetGamertagForController( controller )
	local message = Engine.LocalizeWithoutLocsMarkers( "MENU_GAME_INVITE_MESSAGE", inviterGamertag )
	Dvar.platformSessionOrbisInviteMessage:set( message )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if Lobby.Platform.PS4GetSessionId( controller ) == "" then
			Lobby.Platform.InviteFailed( data )
			return 
		end
		local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.InviteComplete, data )
		local retVal = Engine.PlatformSessionPS4Invite( actionId, controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, xuid, gamertag, Lobby.Platform.PS4GetSessionId( controller ) )
		if retVal == false then
			Lobby.Platform.InviteFailed( data )
			Lobby.ProcessQueue.UnRegisterEventHandler( actionId )
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		local actionId = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.InviteComplete, data )
		local retVal = Engine.PlatformSessionXboxInvite( actionId, controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, xuid, gamertag )
		if retVal == false then
			Lobby.Platform.InviteFailed( data )
			Lobby.ProcessQueue.UnRegisterEventHandler( actionId )
		end
	end
end

Lobby.Platform.SetModelValue = function ( modelName, value )
	local newModel = Engine.CreateModel( Engine.GetGlobalModel(), modelName, true )
	if newModel == nil then
		return 
	else
		Engine.SetModelValue( newModel, value )
	end
end

Lobby.Platform.GetModelValue = function ( modelName, defaultValue )
	local newModel = Engine.GetModel( Engine.GetGlobalModel(), modelName )
	if newModel ~= nil then
		local val = Engine.GetModelValue( newModel, value )
		if val ~= nil then
			Engine.UnsubscribeAndFreeModel( newModel )
			return val
		end
	end
	return defaultValue
end

Lobby.Platform.SaveState = function ()
	if Engine.IsDedicatedServer() == true or true == LuaDefine.isPC then
		return 
	elseif true == LuaDefine.isPS4 then
		Lobby.Platform.SetModelValue( "platformSession.taskInProgress", Lobby.Platform.PS4.taskInProgress )
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.SetModelValue( "platformSession.sessionId." .. tostring( i ), Lobby.Platform.PS4.sessionId[i] )
			Lobby.Platform.SetModelValue( "platformSession.lobbyId." .. tostring( i ), Lobby.Platform.PS4.lobbyId[i] )
			Lobby.Platform.SetModelValue( "platformSession.changed." .. tostring( i ), Lobby.Platform.PS4.changed[i] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailure." .. tostring( i ), Lobby.Platform.PS4.sessionFailure[i] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailureTime." .. tostring( i ), Lobby.Platform.PS4.sessionFailureTime[i] )
			Lobby.Platform.SetModelValue( "platformSession.lastSignedInState." .. tostring( i ), Lobby.Platform.PS4.lastSignedInState[i] )
			Lobby.Platform.SetModelValue( "platformSession.lockFlag." .. tostring( i ), Lobby.Platform.PS4.lockFlag[i] )
			Lobby.Platform.SetModelValue( "platformSession.sessionTypeFlag." .. tostring( i ), Lobby.Platform.PS4.sessionTypeFlag[i] )
		end
	elseif true == LuaDefine.isXbox then
		Lobby.Platform.SetModelValue( "platformSession.taskInProgress", Lobby.Platform.XBOX.taskInProgress )
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.SetModelValue( "platformSession.rtaSubscribe." .. tostring( i ), Lobby.Platform.XBOX.rtaSubscribe[i] )
			Lobby.Platform.SetModelValue( "platformSession.sessionChangeToken." .. tostring( i ), Lobby.Platform.XBOX.sessionChangeToken[i] )
			Lobby.Platform.SetModelValue( "platformSession.subscriptionLostToken." .. tostring( i ), Lobby.Platform.XBOX.subscriptionLostToken[i] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailure." .. tostring( i ), Lobby.Platform.XBOX.sessionFailure[i] )
			Lobby.Platform.SetModelValue( "platformSession.sessionFailureTime." .. tostring( i ), Lobby.Platform.XBOX.sessionFailureTime[i] )
			for f82_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
				local j = f82_local2 + 1
				Lobby.Platform.SetModelValue( "platformSession.templateName." .. tostring( i ) .. "." .. tostring( j ), Lobby.Platform.XBOX.templateName[i][j] )
				Lobby.Platform.SetModelValue( "platformSession.sessionId." .. tostring( i ) .. "." .. tostring( j ), Lobby.Platform.XBOX.sessionId[i][j] )
				Lobby.Platform.SetModelValue( "platformSession.changed." .. tostring( i ) .. "." .. tostring( j ), Lobby.Platform.XBOX.changed[i][j] )
			end
			Lobby.Platform.SetModelValue( "platformSession.lastSignedInState." .. tostring( i ), Lobby.Platform.XBOX.lastSignedInState[i] )
			Lobby.Platform.SetModelValue( "platformSession.roundStart." .. tostring( i ), Lobby.Platform.XBOX.roundStart[i] )
			Lobby.Platform.SetModelValue( "platformSession.roundStartSessionId." .. tostring( i ), Lobby.Platform.XBOX.roundStartSessionId[i] )
			Lobby.Platform.SetModelValue( "platformSession.roundEnd." .. tostring( i ), Lobby.Platform.XBOX.roundEnd[i] )
			Lobby.Platform.SetModelValue( "platformSession.playerSessionId." .. tostring( i ), Lobby.Platform.XBOX.playerSessionId[i] )
			Lobby.Platform.SetModelValue( "platformSession.roundStartTime." .. tostring( i ), Lobby.Platform.XBOX.roundStartTime[i] )
			Lobby.Platform.SetModelValue( "platformSession.roundStartCounter." .. tostring( i ), Lobby.Platform.XBOX.roundStartCounter[i] )
			Lobby.Platform.SetModelValue( "platformSession.roundEndCounter." .. tostring( i ), Lobby.Platform.XBOX.roundEndCounter[i] )
			Lobby.Platform.SetModelValue( "platformSession.sessionClosed." .. tostring( i ), Lobby.Platform.XBOX.sessionClosed[i] )
			Lobby.Platform.SetModelValue( "platformSession.joinRestriction." .. tostring( i ), Lobby.Platform.XBOX.joinRestriction[i] )
			Lobby.Platform.SetModelValue( "platformSession.visibility." .. tostring( i ), Lobby.Platform.XBOX.visibility[i] )
		end
	end
end

Lobby.Platform.OnComError = function ( data )
	local errorCode = data.errorCode
	if data.isInCleanup then
		return 
	elseif errorCode == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
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
	if Engine.IsDedicatedServer() == true or true == LuaDefine.isPC then
		return 
	elseif true == LuaDefine.isPS4 then
		Lobby.Platform.PS4.taskInProgress = Lobby.Platform.GetModelValue( "platformSession.taskInProgress", false )
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.PS4.sessionFailure[i] = Lobby.Platform.GetModelValue( "platformSession.sessionFailure." .. tostring( i ), false )
			Lobby.Platform.PS4.sessionFailureTime[i] = Lobby.Platform.GetModelValue( "platformSession.sessionFailureTime." .. tostring( i ), 0 )
			Lobby.Platform.PS4.sessionId[i] = Lobby.Platform.GetModelValue( "platformSession.sessionId." .. tostring( i ), "" )
			Lobby.Platform.PS4.lobbyId[i] = Lobby.Platform.GetModelValue( "platformSession.lobbyId." .. tostring( i ), 0 )
			Lobby.Platform.PS4.changed[i] = Lobby.Platform.GetModelValue( "platformSession.changed." .. tostring( i ), false )
			Lobby.Platform.PS4.lastSignedInState[i] = Lobby.Platform.GetModelValue( "platformSession.lastSignedInState." .. tostring( i ), false )
			Lobby.Platform.PS4.lockFlag[i] = Lobby.Platform.GetModelValue( "platformSession.lockFlag." .. tostring( i ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			Lobby.Platform.PS4.sessionTypeFlag[i] = Lobby.Platform.GetModelValue( "platformSession.sessionTypeFlag." .. tostring( i ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
		end
	elseif true == LuaDefine.isXbox then
		Lobby.Platform.XBOX.taskInProgress = Lobby.Platform.GetModelValue( "platformSession.taskInProgress", false )
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			local controller = i - 1
			Lobby.Platform.XBOX.sessionFailure[i] = Lobby.Platform.GetModelValue( "platformSession.sessionFailure." .. tostring( i ), false )
			Lobby.Platform.XBOX.sessionFailureTime[i] = Lobby.Platform.GetModelValue( "platformSession.sessionFailureTime." .. tostring( i ), 0 )
			Lobby.Platform.XBOX.rtaSubscribe[i] = Lobby.Platform.GetModelValue( "platformSession.rtaSubscribe." .. tostring( i ), false )
			Lobby.Platform.XBOX.sessionChangeToken[i] = Lobby.Platform.GetModelValue( "platformSession.sessionChangeToken." .. tostring( i ), nil )
			Lobby.Platform.XBOX.subscriptionLostToken[i] = Lobby.Platform.GetModelValue( "platformSession.subscriptionLostToken." .. tostring( i ), nil )
			Lobby.Platform.XBOX.templateName[i] = {}
			Lobby.Platform.XBOX.sessionId[i] = {}
			Lobby.Platform.XBOX.changed[i] = {}
			Lobby.Platform.XBOX.lastSignedInState[i] = Lobby.Platform.GetModelValue( "platformSession.lastSignedInState." .. tostring( i ), false )
			Lobby.Platform.XBOX.roundStart[i] = Lobby.Platform.GetModelValue( "platformSession.roundStart." .. tostring( i ), false )
			Lobby.Platform.XBOX.roundStartSessionId[i] = Lobby.Platform.GetModelValue( "platformSession.roundStartSessionId." .. tostring( i ), "" )
			Lobby.Platform.XBOX.roundEnd[i] = Lobby.Platform.GetModelValue( "platformSession.roundEnd." .. tostring( i ), false )
			Lobby.Platform.XBOX.playerSessionId[i] = Lobby.Platform.GetModelValue( "platformSession.playerSessionId." .. tostring( i ), nil )
			Lobby.Platform.XBOX.roundStartTime[i] = Lobby.Platform.GetModelValue( "platformSession.roundStartTime." .. tostring( i ), 0 )
			Lobby.Platform.XBOX.roundStartCounter[i] = Lobby.Platform.GetModelValue( "platformSession.roundStartCounter." .. tostring( i ), 0 )
			Lobby.Platform.XBOX.roundEndCounter[i] = Lobby.Platform.GetModelValue( "platformSession.roundEndCounter." .. tostring( i ), 0 )
			Lobby.Platform.XBOX.sessionClosed[i] = Lobby.Platform.GetModelValue( "platformSession.sessionClosed." .. tostring( i ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			Lobby.Platform.XBOX.joinRestriction[i] = Lobby.Platform.GetModelValue( "platformSession.joinRestriction." .. tostring( i ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			Lobby.Platform.XBOX.visibility[i] = Lobby.Platform.GetModelValue( "platformSession.visibility." .. tostring( i ), Enum.PartyPrivacy.PARTY_PRIVACY_OPEN )
			XboxSetTemplateName( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Lobby.Platform.GetModelValue( "platformSession.templateName." .. tostring( i ) .. "." .. tostring( Enum.LobbyType.LOBBY_TYPE_PRIVATE + 1 ), Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE.PRIVATE_LOBBY ) )
			XboxSetTemplateName( controller, Enum.LobbyType.LOBBY_TYPE_GAME, Lobby.Platform.GetModelValue( "platformSession.templateName." .. tostring( i ) .. "." .. tostring( Enum.LobbyType.LOBBY_TYPE_GAME + 1 ), Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE.GAME_LOBBY ) )
			for f87_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
				local j = f87_local2 + 1
				XboxSetSessionId( controller, f87_local2, Lobby.Platform.GetModelValue( "platformSession.sessionId." .. tostring( i ) .. "." .. tostring( j ), "" ) )
				XboxSetChanged( controller, f87_local2, Lobby.Platform.GetModelValue( "platformSession.changed." .. tostring( i ) .. "." .. tostring( j ), false ) )
			end
		end
	end
end

Lobby.Platform.playTogether = {}
Lobby.Platform.PS4ProcessPlayTogetherEvent = function ( data )
	local controller = data.controller
	local xuid = data.xuid
	local gamertag = data.gamertag
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local processName = ""
	local process = nil
	Lobby.Platform.playTogether.monitor = false
	Lobby.Platform.playTogether.available = true
	Lobby.Platform.playTogether.data = data
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		local startLive = Lobby.Process.ReloadPrivateLobby( controller, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		local playTogether = Lobby.ProcessPlatform.PlayTogetherBeginPlay( controller, data.playTogetherList )
		Lobby.Process.AddActions( startLive.tail, playTogether.head )
		return startLive
	else
		local f88_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
		if currentMenuIdx == f88_local0.id then
			Lobby.Platform.playTogether.monitor = true
			Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
			return nil
		elseif Engine.IsInGame() then
			return Lobby.ProcessPlatform.PlayTogetherBeginPlay( controller, data.playTogetherList )
		else
			return Lobby.ProcessPlatform.PlayTogetherBeginPlay( controller, data.playTogetherList )
		end
	end
end

Lobby.Platform.PS4PlayTogetherPump = function ()
	if Engine.IsDedicatedServer() == true or true ~= LuaDefine.isPS4 then
		return 
	elseif true ~= Lobby.Platform.playTogether.monitor then
		return 
	end
	local controller = Lobby.Platform.playTogether.data.controller
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local f89_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	if currentMenuIdx ~= f89_local0.id then
		if true == Lobby.Platform.PS4.taskInProgress then
			return 
		end
		local sessionId = Lobby.Platform.PS4GetSessionId( controller )
		if string.len( sessionId ) > 0 then
			Lobby.Platform.playTogether.monitor = false
			local processName = "PlayTogetherBeginPlay"
			local process = Lobby.ProcessPlatform.SendPlayTogetherInvites( controller, Lobby.Platform.playTogether.data.playTogetherList )
			Lobby.ProcessQueue.AddToQueue( processName, process )
			Engine.PlatformSessionClearPlayTogetherInfo()
		end
	end
	if Engine.GetModel( Engine.GetModelForController( Lobby.Platform.playTogether.data.controller ), "SystemOverlay_MessageDialog.buttonPrompts" ) ~= nil then
		Lobby.Platform.playTogether.monitor = false
	end
end

Lobby.Platform.Init()
