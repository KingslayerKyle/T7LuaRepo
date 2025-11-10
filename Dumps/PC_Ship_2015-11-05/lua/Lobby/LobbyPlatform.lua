require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Lobby.Process.LobbyProcessPlatform" )
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
Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE = {
	PRIVATE_LOBBY = "PrivateLobbySession",
	GAME_LOBBY = "GameLobbySession"
}
Lobby.Platform.PS4 = {
	updateTime = 0,
	taskInProgress = false,
	sessionId = {},
	lobbyId = {},
	changed = {},
	sessionFailure = {},
	lastSignedInState = {}
}
Lobby.Platform.XBOX = {
	updateTime = 0,
	taskInProgress = false,
	rtaSubscribe = {},
	templateName = {},
	sessionId = {},
	changed = {},
	sessionFailure = {},
	lastSignedInState = {},
	roundStart = {},
	roundStartSessionId = {},
	roundEnd = {},
	playerSessionId = {},
	roundStartTime = {},
	roundStartCounter = {},
	roundEndCounter = {}
}
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

Lobby.Platform.isOnlineGame = function ()
	if Engine.SessionMode_IsOnlineGame() then
		return true
	else
		return false
	end
end

Lobby.Platform.isRankedGame = function ()
	local f5_local0
	if Lobby.Platform.isOnlineGame() == true then
		f5_local0 = not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL )
	else
		f5_local0 = false
	end
	return f5_local0
end

Lobby.Platform.isHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

Lobby.Platform.QuitGame = function ( f7_arg0 )
	if not Engine.IsInGame() then
		return true
	elseif not Lobby.Platform.isRankedGame() and Lobby.Platform.isHost() then
		if Engine.DvarInt( nil, "g_gameEnded" ) == 1 then
			return true
		end
		Engine.SendMenuResponse( f7_arg0, "popup_leavegame", "endround" )
	elseif not Lobby.Platform.isHost() then
		Engine.UpdateStatsForQuit( f7_arg0, false )
		Engine.Exec( f7_arg0, "disconnect" )
	elseif Lobby.Platform.isRankedGame() and Lobby.Platform.isHost() and not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
		Engine.UpdateStatsForQuit( f7_arg0, true )
		if (Engine.IsZombiesGame() or Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_FREERUN )) and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) < Dvar.migration_minclientcount:get() then
			Engine.SendMenuResponse( f7_arg0, "popup_leavegame", "endround" )
		else
			Engine.Exec( f7_arg0, "hostmigration_start" )
			return false
		end
	end
	return true
end

Lobby.Platform.OnInit = function ( f8_arg0 )
	if Engine.IsShipBuild() == false then
		Engine.SetDvar( "platformSessionCreateFailure", 0 )
		Engine.SetDvar( "platformSessionJoinFailure", 0 )
		Engine.SetDvar( "platformSessionLeaveFailure", 0 )
		Engine.SetDvar( "platformSessionSetActivityFailure", 0 )
		Engine.SetDvar( "platformSessionSetJoinRestrictionFailure", 0 )
		Engine.SetDvar( "platformSessionSetSessionClosedFailure", 0 )
	end
end

Lobby.Platform.OnSessionStart = function ( f9_arg0 )
	Lobby.Platform.PlatformSessionDirty( f9_arg0.lobbyType )
end

Lobby.Platform.OnSessionEnd = function ( f10_arg0 )
	Lobby.Platform.PlatformSessionDirty( f10_arg0.lobbyType )
end

Lobby.Platform.OnMatchStart = function ( f11_arg0 )
	if Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f11_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.roundStart[f11_local0] = true
		end
	end
end

Lobby.Platform.OnMatchEnd = function ( f12_arg0 )
	if LuaUtils.isPS4 == true and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() then
		for f12_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f12_local3 = f12_local0 - 1
			if Engine.NotifyPsPlusAsyncMultiplay ~= nil then
				Engine.NotifyPsPlusAsyncMultiplay( f12_local3 )
			end
		end
	end
	if Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f12_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.roundEnd[f12_local0] = true
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
	if Engine.IsInGame() then
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
			end
		end
		f14_local8 = Enum.JoinType.JOIN_TYPE_FRIEND
	end
	if f14_local3 == true then
		local f14_local7 = Lobby.ProcessPlatform.PS4AcceptInvite( f14_local0, f14_local4, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	else
		local f14_local7 = Lobby.ProcessPlatform.PS4SessionJoin( f14_local0, f14_local5, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
	return process
end

Lobby.Platform.OnPlatformJoinDurango = function ( f15_arg0 )
	local f15_local0 = f15_arg0.invite
	local f15_local1 = 0
	local f15_local2 = 0
	if f15_local0 == true then
		f15_local2 = f15_arg0.senderXuid
		f15_local1 = Engine.GetControllerForXuid( f15_arg0.invitedXuid )
	else
		f15_local2 = f15_arg0.joineeXuid
		f15_local1 = Engine.GetControllerForXuid( f15_arg0.joinerXuid )
	end
	if Engine.IsInGame() then
		local f15_local3 = {
			controller = f15_local1,
			xuid = f15_local2
		}
		local f15_local4
		if f15_local0 then
			f15_local4 = Enum.JoinType.JOIN_TYPE_INVITE
			if not f15_local4 then
			
			else
				f15_local3.joinType = f15_local4
				f15_local3.platform = true
				f15_local3.platformData = f15_arg0
				if Engine.LobbyIsPlayerInLobbyByXuid( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f15_local3.xuid ) then
					Engine.PlatformSessionClearInviteJoinInfo()
					return nil
				else
					f15_local3.migrating = not Lobby.Platform.QuitGame( f15_local1 )
					LobbyVM.InGameJoin( f15_local3, true )
					return nil
				end
			end
		end
		f15_local4 = Enum.JoinType.JOIN_TYPE_FRIEND
	else
		if f15_arg0.invite == true then
			local f15_local5 = Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f15_arg0.invitedXuid ), f15_arg0.senderXuid, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		else
			local f15_local5 = Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f15_arg0.joinerXuid ), f15_arg0.joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		end
		return process
	end
end

Lobby.Platform.OnPlatformJoinPC = function ( f16_arg0 )
	return Lobby.ProcessPlatform.PCJoin( Engine.GetControllerForXuid( f16_arg0.joinerXuid ), f16_arg0.joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
end

Lobby.Platform.PlatformJoin = function ( f17_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		local f17_local0 = Lobby.Platform.OnPlatformJoinOrbis( f17_arg0 )
		if invite == true then
			Lobby.ProcessQueue.AddToQueue( "PS4AcceptInvite", f17_local0 )
		else
			Lobby.ProcessQueue.AddToQueue( "PS4SessionJoin", f17_local0 )
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		local f17_local0 = Lobby.Platform.OnPlatformJoinDurango( f17_arg0 )
		if invite == true then
			Lobby.ProcessQueue.AddToQueue( "XboxAcceptInvite", f17_local0 )
		else
			Lobby.ProcessQueue.AddToQueue( "XboxSessionJoin", f17_local0 )
		end
	elseif Lobby.Platform.PlatformSessionPCEnabled() then
		Lobby.ProcessQueue.AddToQueue( "PCSessionJoin", Lobby.Platform.OnPlatformJoinPC( f17_arg0 ) )
	end
end

Lobby.Platform.GetAutoJoinProcess = function ( f18_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		return Lobby.Platform.OnPlatformJoinOrbis( f18_arg0 )
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		return Lobby.Platform.OnPlatformJoinDurango( f18_arg0 )
	elseif Lobby.Platform.PlatformSessionPCEnabled() then
		return Lobby.Platform.OnPlatformJoinPC( f18_arg0 )
	else
		
	end
end

Lobby.Platform.InGamePlatformJoinDurango = function ( f19_arg0 )
	if f19_arg0.invite == true then
		return Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f19_arg0.invitedXuid ), f19_arg0.senderXuid, Enum.JoinType.JOIN_TYPE_INVITE, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	else
		return Lobby.ProcessPlatform.XboxJoin( Engine.GetControllerForXuid( f19_arg0.joinerXuid ), f19_arg0.joineeXuid, Enum.JoinType.JOIN_TYPE_FRIEND, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
end

Lobby.Platform.OnPlatformJoin = function ( f20_arg0 )
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
	elseif LuaUtils.isPC and f20_arg0.joinable ~= true then
		local f20_local0 = nil
		if f20_arg0.joinError then
			f20_local0 = Lobby.Platform.LobbyJoinableStrings[f20_arg0.joinError]
		end
		if not f20_local0 then
			f20_local0 = "PRESENCE_NOT_JOINABLE"
		end
		LuaUtils.UI_ShowErrorMessageDialog( controller, f20_local0 )
		return 
	elseif f20_arg0.error == true then
		local f20_local0 = f20_arg0.debugInfo
		return 
	elseif not f20_arg0.controller then
		f20_arg0.controller = Engine.GetControllerForXuid( f20_arg0.joinerXuid )
	end
	local f20_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f20_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.LobbyIsPlayerInLobby( f20_local0, f20_arg0.joineeXuid ) == true then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to AutoJoin lobby we are already part of\n" )
		return 
	end
	Lobby.Platform.AutoJoinData = f20_arg0
end

Lobby.Platform.PlatformSessionDirty = function ( f21_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if f21_arg0 ~= Enum.LobbyType.LOBBY_TYPE_PRIVATE then
			return 
		end
		for f21_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.PS4.changed[f21_local0] = true
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		for f21_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			Lobby.Platform.XBOX.changed[f21_local0][f21_arg0 + 1] = true
		end
	end
end

Lobby.Platform.TRCPump = function ()
	if LuaUtils.isPS4 == false then
		return 
	elseif Engine.GetLuaCodeVersion() < 4 then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		for f22_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f22_local3 = f22_local0 - 1
			if Engine.IsControllerBeingUsed( f22_local3 ) then
				Engine.NotifyPsPlus( f22_local3 )
				Engine.DisplayChatRestrictionForUser( f22_local3 )
				Engine.DisplayContentRestrictionForUser( f22_local3 )
			end
		end
	end
end

local f0_local0 = function ( f23_arg0, f23_arg1 )
	Lobby.Platform.PS4.sessionId[f23_arg0 + 1] = f23_arg1
	Lobby.Platform.PS4.lobbyId[f23_arg0 + 1] = Engine.GetLobbyLobbyID( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	Engine.PlatformSessionSetDebugInfo( f23_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f23_arg1 )
end

local f0_local1 = function ( f24_arg0 )
	return Lobby.Platform.PS4.sessionId[f24_arg0 + 1]
end

local f0_local2 = function ( f25_arg0 )
	local f25_local0 = f25_arg0 + 1
	Lobby.Platform.PS4.sessionId[f25_local0] = ""
	Lobby.Platform.PS4.lobbyId[f25_local0] = 0
	Lobby.Platform.PS4.changed[f25_local0] = 0
	Lobby.Platform.PS4.sessionFailure[f25_local0] = false
	Lobby.Platform.PS4.lastSignedInState[f25_local0] = false
	Engine.PlatformSessionSetDebugInfo( f25_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, "" )
end

Lobby.Platform.PlatformSessionPS4Error = function ( f26_arg0, f26_arg1 )
	local f26_local0 = Dvar.platformSessionsOrbis:get()
	if f26_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_NONFATAL then
		Lobby.Platform.PS4.sessionFailure[f26_arg0 + 1] = true
		return 
	elseif f26_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_FATAL then
		Lobby.Platform.PS4.sessionFailure[f26_arg0 + 1] = true
		if true == Engine.IsInGame() then
			
		else
			local f26_local1 = LobbyData.GetCurrentMenuTarget()
			if f26_local1.id == LobbyData.UITargets.UI_MAIN.id then
				return 
			end
			local f26_local2 = {
				controller = f26_arg0,
				signoutUsers = false
			}
			LobbyVM.ExecuteLobbyVMRequest( LuaEnums.LOBBYVM_REQUEST.FORCE_LOCAL_MODE )
			Engine.LobbyLaunchClear()
			Lobby.ProcessQueue.ClearQueue()
			LobbyVM.ErrorShutdown( f26_local2 )
			LobbyVM.ShutdownCleanup( f26_local2 )
			if Dvar.platformSessionShowErrorCodes:get() == true then
				LuaUtils.UI_ShowErrorMessageDialog( f26_arg0, "Platform Session Error: " .. f26_arg1 )
			else
				LuaUtils.UI_ShowErrorMessageDialog( f26_arg0, "PLATFORM_PLATFORM_SESSION_ERROR" )
			end
		end
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4CreateComplete = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = f27_arg1.controller
	local f27_local1 = f27_arg2.isError
	local f27_local2 = f27_arg2.returnCode
	local f27_local3 = f27_arg2.returnCodeHex
	if f27_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f27_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f27_local1 == false then
			f0_local0( f27_local0, f27_arg2.sessionId )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete, we have successfully created session id: '" .. f0_local1( f27_local0 ) .. "'.\n" )
			if f27_local0 == Engine.GetPrimaryController() and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4CreateComplete, we are host of private session, setting session data.\n" )
				Engine.PlatformSessionPS4SetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f0_local1( f27_local0 ) )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed: " .. f27_local3 .. "\n" )
		end
	elseif f27_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f27_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed: " .. f27_local3 .. "\n" )
		f27_local1 = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if f27_local1 == true then
		Lobby.Platform.PlatformSessionPS4Error( f27_local0, f27_local3 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Create = function ( f28_arg0, f28_arg1, f28_arg2 )
	Lobby.Platform.PS4.taskInProgress = true
	Dvar.platformSessionOrbisName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_PLATFORM_SESSION_NAME" ) )
	Dvar.platformSessionOrbisStatus:set( "" )
	Dvar.platformSessionOrbisImgPath:set( "" )
	Dvar.platformSessionOrbisImg:set( "platform_session.png" )
	local f28_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4CreateComplete, {
		controller = f28_arg0,
		lobbyType = f28_arg1,
		maxSlot = f28_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create started.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionCreateFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f28_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Create( f28_local0, f28_arg0, f28_arg1, f28_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Create failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f28_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionJoinCompletePS4 = function ( f29_arg0, f29_arg1, f29_arg2 )
	local f29_local0 = f29_arg1.controller
	local f29_local1 = f29_arg2.isError
	local f29_local2 = f29_arg2.returnCode
	local f29_local3 = f29_arg2.returnCodeHex
	if f29_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionJoinCompletePS4 ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f29_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f29_local1 == false then
			f0_local0( f29_local0, f29_arg2.sessionId )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionJoinCompletePS4, we have successfully joined session id: '" .. f0_local1( f29_local0 ) .. "'.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed: " .. f29_local3 .. "\n" )
		end
	elseif f29_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f29_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed: " .. f29_local3 .. "\n" )
		f29_local1 = true
	end
	Lobby.Platform.PS4.taskInProgress = false
	if f29_local1 == true then
		Lobby.Platform.PlatformSessionPS4Error( f29_local0, f29_local3 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Join = function ( f30_arg0, f30_arg1, f30_arg2 )
	Lobby.Platform.PS4.taskInProgress = true
	local f30_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionJoinCompletePS4, {
		controller = f30_arg0,
		lobbyType = f30_arg1,
		sessionId = f30_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join started, joining sessionId: '" .. f30_arg2 .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionJoinFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f30_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Join( f30_local0, f30_arg0, f30_arg1, f30_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Join failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f30_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4LeaveComplete = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = f31_arg1.controller
	local f31_local1 = f31_arg2.isError
	local f31_local2 = f31_arg2.returnCode
	local f31_local3 = f31_arg2.returnCodeHex
	if f31_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f31_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f31_local1 == false then
			local f31_local4 = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete, we have successfully left session id: '" .. f0_local1( f31_local0 ) .. "'.\n" )
			if f31_local0 == Engine.GetPrimaryController() and f31_local4.sessionId == f0_local1( f31_local0 ) then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4LeaveComplete, we are host of private session, clearing session data.\n" )
				Engine.PlatformSessionPS4ClearData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			end
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed: " .. f31_local3 .. "\n" )
		end
	elseif f31_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f31_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed: " .. f31_local3 .. "\n" )
		f31_local1 = true
	end
	f0_local0( f31_local0, "" )
	Lobby.Platform.PS4.taskInProgress = false
	if f31_local1 == true then
		Lobby.Platform.PlatformSessionPS4Error( f31_local0, f31_local3 )
	end
	return true
end

Lobby.Platform.PlatformSessionPS4Leave = function ( f32_arg0, f32_arg1, f32_arg2 )
	Lobby.Platform.PS4.taskInProgress = true
	local f32_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionPS4LeaveComplete, {
		controller = f32_arg0,
		lobbyType = f32_arg1,
		sessionId = f32_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave started, leaving sessionId: '" .. f32_arg2 .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionLeaveFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f32_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionPS4Leave( f32_local0, f32_arg0, f32_arg1, f32_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_PS4, "PlatformSessionPS4Leave failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f32_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4PumpController = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5, f33_arg6, f33_arg7 )
	local f33_local0 = f33_arg0 + 1
	local f33_local1 = f0_local1( f33_arg0 )
	local f33_local2 = Lobby.Platform.PS4.lobbyId[f33_local0]
	local f33_local3 = string.len( f33_local1 ) > 0
	local f33_local4 = Lobby.Platform.PS4.sessionFailure[f33_local0]
	if f33_arg4 == false then
		if f33_local3 == false and f33_local4 == false then
			return 
		elseif f33_local3 == true and f33_local4 == false then
			Lobby.Platform.PlatformSessionPS4Leave( f33_arg0, f33_arg2, f33_local1 )
		else
			f0_local0( f33_arg0, "" )
			Lobby.Platform.PS4.sessionFailure[f33_local0] = false
		end
		return 
	elseif f33_arg5 == false or f33_arg1 == false then
		if f33_local3 == false and f33_local4 == false then
			return 
		elseif f33_local3 == true and f33_local4 == false then
			Lobby.Platform.PlatformSessionPS4Leave( f33_arg0, f33_arg2, f33_local1 )
		else
			f0_local0( f33_arg0, "" )
			Lobby.Platform.PS4.sessionFailure[f33_local0] = false
		end
		return 
	elseif Lobby.Platform.PS4.changed[f33_local0] == true then
		local f33_local5 = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if f33_local3 == true and (f33_local5.sessionId ~= f33_local1 or f33_local2 ~= Engine.GetLobbyLobbyID( Enum.LobbyType.LOBBY_TYPE_PRIVATE )) then
			Lobby.Platform.PlatformSessionPS4Leave( f33_arg0, f33_arg2, f33_local1 )
		end
		Lobby.Platform.PS4.changed[f33_local0] = false
		return 
	elseif f33_local4 == false then
		if f33_local3 == true then
			return 
		elseif f33_arg6 == true and f33_arg0 == f33_arg7 then
			Lobby.Platform.PlatformSessionPS4Create( f33_arg0, f33_arg2, f33_arg3 )
			return 
		end
		local f33_local5 = Engine.PlatformSessionPS4GetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if f33_local5.sessionId ~= "" then
			Lobby.Platform.PlatformSessionPS4Join( f33_arg0, f33_arg2, f33_local5.sessionId )
		end
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionPS4Pump = function ()
	if Lobby.Platform.PS4.taskInProgress == true or true == Engine.IsRequestingJoin() or Lobby.ProcessQueue.IsQueueEmpty() == false then
		Lobby.Platform.PS4.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalOrbis:get()
		return 
	elseif Lobby.Platform.PS4.updateTime > Engine.milliseconds() then
		return 
	end
	Lobby.Platform.PS4.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalOrbis:get()
	local f34_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	local f34_local1 = 18
	local f34_local2 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	local f34_local3 = Engine.IsLobbyActive( f34_local0 )
	local f34_local4 = Engine.IsLobbyHost( f34_local0 )
	local f34_local5
	if f34_local4 then
		f34_local5 = Engine.GetLobbyHostControllerIndex( f34_local0 )
		if not f34_local5 then
		
		else
			for f34_local6 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
				local f34_local9 = f34_local6 - 1
				local f34_local10 = Engine.IsSignedInToLive( f34_local9 )
				local f34_local11 = Engine.IsControllerBeingUsed( f34_local9 )
				if f34_local10 == true then
					Lobby.Platform.PlatformSessionPS4PumpController( f34_local9, f34_local11, f34_local0, f34_local1, f34_local2, f34_local3, f34_local4, f34_local5 )
				elseif Lobby.Platform.PS4.lastSignedInState[f34_local6] == true then
					f0_local2( f34_local9 )
				end
				Lobby.Platform.PS4.lastSignedInState[f34_local6] = f34_local10
				if Lobby.Platform.PS4.taskInProgress == true then
					return 
				end
			end
		end
	end
	f34_local5 = LuaEnums.INVALID_CONTROLLER_PORT
end

local f0_local3 = function ( f35_arg0, f35_arg1, f35_arg2 )
	Lobby.Platform.XBOX.templateName[f35_arg0 + 1][f35_arg1 + 1] = f35_arg2
end

local f0_local4 = function ( f36_arg0, f36_arg1 )
	return Lobby.Platform.XBOX.templateName[f36_arg0 + 1][f36_arg1 + 1]
end

local f0_local5 = function ( f37_arg0, f37_arg1, f37_arg2 )
	Lobby.Platform.XBOX.sessionId[f37_arg0 + 1][f37_arg1 + 1] = f37_arg2
	Engine.PlatformSessionSetDebugInfo( f37_arg0, f37_arg1, f37_arg2 )
end

local f0_local6 = function ( f38_arg0, f38_arg1 )
	return Lobby.Platform.XBOX.sessionId[f38_arg0 + 1][f38_arg1 + 1]
end

local f0_local7 = function ( f39_arg0, f39_arg1, f39_arg2 )
	Lobby.Platform.XBOX.changed[f39_arg0 + 1][f39_arg1 + 1] = f39_arg2
end

local f0_local8 = function ( f40_arg0, f40_arg1 )
	return Lobby.Platform.XBOX.changed[f40_arg0 + 1][f40_arg1 + 1]
end

local f0_local9 = function ( f41_arg0, f41_arg1, f41_arg2 )
	Lobby.Platform.XBOX.sessionFailure[f41_arg0 + 1][f41_arg1 + 1] = f41_arg2
end

local f0_local10 = function ( f42_arg0, f42_arg1 )
	return Lobby.Platform.XBOX.sessionFailure[f42_arg0 + 1][f42_arg1 + 1]
end

local f0_local11 = function ( f43_arg0, f43_arg1 )
	return f0_local4( f43_arg0, f43_arg1 ), f0_local6( f43_arg0, f43_arg1 )
end

local f0_local12 = function ( f44_arg0, f44_arg1 )
	Engine.PlatformSessionSetDebugInfo( f44_arg0, f44_arg1, f0_local6( f44_arg0, f44_arg1 ), "  start[ " .. tostring( Lobby.Platform.XBOX.roundStartCounter[f44_arg0 + 1] ) .. " ], end[ " .. tostring( Lobby.Platform.XBOX.roundEndCounter[f44_arg0 + 1] ) .. " ]" )
end

local f0_local13 = function ( f45_arg0, f45_arg1 )
	local f45_local0 = f45_arg0 + 1
	Lobby.Platform.XBOX.lastSignedInState[f45_local0] = false
	for f45_local1 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
		f0_local5( f45_arg0, f45_local1, "" )
		f0_local7( f45_arg0, f45_local1, false )
		f0_local9( f45_arg0, f45_local1, false )
		if Engine.PlatformSessionXboxXBLiveSessionClear then
			Engine.PlatformSessionXboxXBLiveSessionClear( f45_arg0, f45_local1 )
		end
	end
	Lobby.Platform.XBOX.roundStart[f45_local0] = false
	Lobby.Platform.XBOX.roundStartSessionId[f45_local0] = ""
	Lobby.Platform.XBOX.roundEnd[f45_local0] = false
	Lobby.Platform.XBOX.playerSessionId[f45_local0] = nil
	Lobby.Platform.XBOX.roundStartTime[f45_local0] = 0
	if f45_arg1 == true then
		Lobby.Platform.XBOX.rtaSubscribe[f45_local0] = false
	end
end

Lobby.Platform.PlatformSessionXboxError = function ( f46_arg0, f46_arg1, f46_arg2 )
	local f46_local0 = Dvar.platformSessionsDurango:get()
	if f46_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_NONFATAL then
		Lobby.Platform.XBOX.sessionFailure[f46_arg0 + 1][f46_arg1 + 1] = true
		return 
	elseif f46_local0 == Enum.PlatformSessions.PLATFORM_SESSIONS_ON_FATAL then
		Lobby.Platform.XBOX.sessionFailure[f46_arg0 + 1][f46_arg1 + 1] = true
		if true == Engine.IsInGame() then
			
		else
			local f46_local1 = LobbyData.GetCurrentMenuTarget()
			if f46_local1.id == LobbyData.UITargets.UI_MAIN.id then
				return 
			end
			local f46_local2 = {
				controller = f46_arg0,
				signoutUsers = false
			}
			LobbyVM.ExecuteLobbyVMRequest( LuaEnums.LOBBYVM_REQUEST.FORCE_LOCAL_MODE )
			Engine.LobbyLaunchClear()
			Lobby.ProcessQueue.ClearQueue()
			LobbyVM.ErrorShutdown( f46_local2 )
			LobbyVM.ShutdownCleanup( f46_local2 )
			if Dvar.platformSessionShowErrorCodes:get() == true then
				LuaUtils.UI_ShowErrorMessageDialog( f46_arg0, "Platform Session Error: " .. f46_arg2 )
			else
				LuaUtils.UI_ShowErrorMessageDialog( f46_arg0, "PLATFORM_PLATFORM_SESSION_ERROR" )
			end
		end
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxGenerateSessionId = function ( f47_arg0 )
	local f47_local0 = Engine.GetLobbyHostInfo( Enum.LobbyModule.LOBBY_MODULE_CLIENT, f47_arg0 )
	if f47_local0 == nil then
		return false, ""
	else
		return true, Engine.PlatformSessionXboxSecIdToSessionId( f47_local0.secId )
	end
end

Lobby.Platform.PlatformSessionXboxCreateComplete = function ( f48_arg0, f48_arg1, f48_arg2 )
	local f48_local0 = f48_arg1.controller
	local f48_local1 = f48_arg1.lobbyType
	local f48_local2 = f48_arg2.isError
	local f48_local3 = f48_arg2.returnCode
	local f48_local4 = f48_arg2.returnCodeHex
	if f48_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreateComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f48_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f48_local2 == false then
			f0_local5( f48_local0, f48_local1, f48_arg2.sessionId )
			Engine.PlatformSessionXboxSetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f0_local6( f48_local0, f48_local1 ), f0_local4( f48_local0, f48_local1 ) )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreateComplete, we have successfully created session id: '" .. f48_arg2.sessionId .. "'.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed: " .. f48_local4 .. "\n" )
		end
	elseif f48_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f48_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed: " .. f48_local4 .. "\n" )
		f48_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f48_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f48_local0, f48_local1, f48_local4 )
		return true
	elseif f48_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS and f48_local2 == false and f48_local1 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		Lobby.Platform.PlatformSessionXboxSetActivity( f48_local0, f48_local1 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxCreate = function ( f49_arg0, f49_arg1 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f49_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxCreateComplete, {
		controller = f49_arg0,
		lobbyType = f49_arg1
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate started.\n" )
	local f49_local1 = f0_local4( f49_arg0, f49_arg1 )
	local f49_local2, f49_local3 = Lobby.Platform.PlatformSessionXboxGenerateSessionId( f49_arg1 )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionCreateFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f49_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif f49_local2 == false or Engine.PlatformSessionXboxCreateJoin( f49_local0, f49_arg0, f49_arg1, f49_local1, f49_local3 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxCreate failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f49_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxSetActivityComplete = function ( f50_arg0, f50_arg1, f50_arg2 )
	local f50_local0 = f50_arg1.controller
	local f50_local1 = f50_arg1.lobbyType
	local f50_local2 = f50_arg1.sessionId
	local f50_local3 = f50_arg2.isError
	local f50_local4 = f50_arg2.returnCode
	local f50_local5 = f50_arg2.returnCodeHex
	if f50_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivityComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f50_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f50_local3 == false then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivityComplete, we have successfully set sessionId: '" .. f50_local2 .. "' to be the activity session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed: " .. f50_local5 .. "\n" )
		end
	elseif f50_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f50_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed: " .. f50_local5 .. "\n" )
		f50_local3 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f50_local3 == true then
		Lobby.Platform.PlatformSessionXboxError( f50_local0, f50_local1, f50_local5 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxSetActivity = function ( f51_arg0, f51_arg1 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f51_local0, f51_local1 = f0_local11( f51_arg0, f51_arg1 )
	local f51_local2 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetActivityComplete, {
		controller = f51_arg0,
		lobbyType = f51_arg1,
		sessionId = f51_local1
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity started for sessionId: '" .. f51_local1 .. "'.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionSetActivityFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f51_local2,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxSetActivity( f51_local2, f51_arg0, f51_arg1, f51_local0, f51_local1 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetActivity failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f51_local2,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxLeaveComplete = function ( f52_arg0, f52_arg1, f52_arg2 )
	local f52_local0 = f52_arg1.controller
	local f52_local1 = f52_arg1.lobbyType
	local f52_local2 = f52_arg2.isError
	local f52_local3 = f52_arg2.returnCode
	local f52_local4 = f52_arg2.returnCodeHex
	if f52_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeaveComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f52_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f52_local2 == false then
			local f52_local5 = Engine.PlatformSessionXboxGetData( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeaveComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed: " .. f52_local4 .. "\n" )
		end
	elseif f52_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f52_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed: " .. f52_local4 .. "\n" )
		f52_local2 = true
	end
	f0_local5( f52_local0, f52_local1, "" )
	Lobby.Platform.XBOX.taskInProgress = false
	if f52_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f52_local0, f52_local1, f52_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxLeave = function ( f53_arg0, f53_arg1, f53_arg2 )
	Lobby.Platform.XBOX.taskInProgress = true
	Lobby.Platform.PlatformSessionXboxRoundEnd( f53_arg0, f53_arg1 )
	local f53_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxLeaveComplete, {
		controller = f53_arg0,
		lobbyType = f53_arg1
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave started.\n" )
	local f53_local1, f53_local2 = f0_local11( f53_arg0, f53_arg1 )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionLeaveFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f53_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxLeave( f53_local0, f53_arg0, f53_arg1, f53_local1, f53_local2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxLeave failed to start.\n" )
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

Lobby.Platform.PlatformSessionXboxSetJoinRestrictionComplete = function ( f54_arg0, f54_arg1, f54_arg2 )
	local f54_local0 = f54_arg1.controller
	local f54_local1 = f54_arg1.lobbyType
	local f54_local2 = f54_arg2.isError
	local f54_local3 = f54_arg2.returnCode
	local f54_local4 = f54_arg2.returnCodeHex
	if f54_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestrictionComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f54_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f54_local2 == false then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestrictionComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed: " .. f54_local4 .. "\n" )
		end
	elseif f54_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f54_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed: " .. f54_local4 .. "\n" )
		f54_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f54_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f54_local0, f54_local1, f54_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxSetJoinRestriction = function ( f55_arg0, f55_arg1, f55_arg2 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f55_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetJoinRestrictionComplete, {
		controller = f55_arg0,
		lobbyType = f55_arg1,
		joinRestriction = f55_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction started.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionSetJoinRestrictionFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f55_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxSetJoinRestriction( f55_local0, f55_arg0, f55_arg1, f55_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetJoinRestriction failed to start.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f55_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	else
		
	end
end

Lobby.Platform.PlatformSessionXboxSetSessionClosedComplete = function ( f56_arg0, f56_arg1, f56_arg2 )
	local f56_local0 = f56_arg1.controller
	local f56_local1 = f56_arg1.lobbyType
	local f56_local2 = f56_arg2.isError
	local f56_local3 = f56_arg2.returnCode
	local f56_local4 = f56_arg2.returnCodeHex
	if f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosedComplete ACTIONSTATE.RUNNING should not happen.\n" )
		return false
	elseif f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		if f56_local2 == false then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosedComplete, we have successfully left session.\n" )
		else
			Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed: " .. f56_local4 .. "\n" )
		end
	elseif f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f56_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed: " .. f56_local4 .. "\n" )
		f56_local2 = true
	end
	Lobby.Platform.XBOX.taskInProgress = false
	if f56_local2 == true then
		Lobby.Platform.PlatformSessionXboxError( f56_local0, f56_local1, f56_local4 )
	end
	return true
end

Lobby.Platform.PlatformSessionXboxSetSessionClosed = function ( f57_arg0, f57_arg1, f57_arg2 )
	Lobby.Platform.XBOX.taskInProgress = true
	local f57_local0 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.PlatformSessionXboxSetSessionClosedComplete, {
		controller = f57_arg0,
		lobbyType = f57_arg1,
		closed = f57_arg2
	} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed started.\n" )
	if Engine.IsShipBuild() == false and Engine.DvarInt( 0, "platformSessionSetSessionClosedFailure" ) == 1 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed FAILURE TEST.\n" )
		LobbyVM.ProcessCompleteFailure( {
			actionId = f57_local0,
			isError = true,
			returnCode = Lobby.ProcessQueue.EVENT_START_ERROR,
			returnCodeHex = "EVENT START ERROR"
		} )
		return 
	elseif Engine.PlatformSessionXboxSetSessionClosed( f57_local0, f57_arg0, f57_arg1, f57_arg2 ) == false then
		Engine.PrintError( Enum.consoleLabel.LABEL_LIVE_XBOX, "PlatformSessionXboxSetSessionClosed failed to start.\n" )
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

Lobby.Platform.PlatformSessionXboxRoundStart = function ( f58_arg0, f58_arg1 )
	local f58_local0 = f58_arg0 + 1
	Lobby.Platform.XBOX.roundStart[f58_local0] = false
	local f58_local1, f58_local2 = f0_local11( f58_arg0, f58_arg1 )
	local f58_local3, f58_local4 = Engine.PlatformSessionXboxMultiplayerRoundStart( f58_arg0, f58_arg1, f58_local1, f58_local2 )
	if f58_local3 == true then
		Lobby.Platform.XBOX.roundStartSessionId[f58_local0] = f58_local2
		Lobby.Platform.XBOX.roundStartTime[f58_local0] = Engine.milliseconds()
		Lobby.Platform.XBOX.roundStartCounter[f58_local0] = Lobby.Platform.XBOX.roundStartCounter[f58_local0] + 1
		f0_local12( f58_arg0, f58_arg1 )
		Lobby.Platform.XBOX.playerSessionId[f58_local0] = f58_local4.guid
	end
end

Lobby.Platform.PlatformSessionXboxRoundEnd = function ( f59_arg0, f59_arg1 )
	local f59_local0 = f59_arg0 + 1
	Lobby.Platform.XBOX.roundEnd[f59_local0] = false
	local f59_local1 = Lobby.Platform.XBOX.playerSessionId[f59_local0]
	if f59_local1 ~= nil then
		local f59_local2 = Lobby.Platform.XBOX.roundStartTime[f59_local0]
		local f59_local3, f59_local4 = f0_local11( f59_arg0, f59_arg1 )
		local f59_local5 = Lobby.Platform.XBOX.roundStartSessionId[f59_local0]
		if f59_local5 == f0_local6( f59_arg0, f59_arg1 ) then
			Engine.PlatformSessionXboxMultiplayerRoundEnd( f59_arg0, f59_arg1, f59_local3, f59_local5, f59_local1, f59_local2 )
			Lobby.Platform.XBOX.roundEndCounter[f59_local0] = Lobby.Platform.XBOX.roundEndCounter[f59_local0] + 1
			f0_local12( f59_arg0, f59_arg1 )
		end
	end
	Lobby.Platform.XBOX.roundStartSessionId[f59_local0] = nil
	Lobby.Platform.XBOX.playerSessionId[f59_local0] = nil
	Lobby.Platform.XBOX.roundStartTime[f59_local0] = 0
end

Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged = function ( f60_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged().\n" )
end

Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost = function ( f61_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LIVE_XBOX, "Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost().\n" )
	if Dvar.platformSessionsDurangoAutoRTASubscription:get() == false then
		for f61_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			f0_local13( f61_local0 - 1, false )
		end
	end
end

Lobby.Platform.OnPlatformSuspend = function ( f62_arg0 )
	for f62_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
		Lobby.Platform.PlatformSessionXboxRoundEnd( f62_local0 - 1, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

Lobby.Platform.PlatformSessionXboxPumpController = function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3, f63_arg4 )
	local f63_local0 = f63_arg0 + 1
	local f63_local1 = string.len( f0_local6( f63_arg0, f63_arg2 ) ) > 0
	local f63_local2 = f0_local8( f63_arg0, f63_arg2 )
	local f63_local3 = Lobby.Platform.XBOX.roundStart[f63_local0]
	local f63_local4 = Lobby.Platform.XBOX.roundEnd[f63_local0]
	if f63_arg3 == false then
		if f63_local1 == true then
			Lobby.Platform.PlatformSessionXboxLeave( f63_arg0, f63_arg2 )
		end
		return 
	elseif f63_local1 == true and (f63_arg4 == false or f63_arg1 == false) then
		Lobby.Platform.PlatformSessionXboxLeave( f63_arg0, f63_arg2 )
		return 
	elseif f63_arg4 == false or f63_arg1 == false then
		return 
	elseif f63_local1 == false and f63_local2 == true then
		f0_local7( f63_arg0, f63_arg2, false )
	end
	if f63_local1 == true then
		if f63_arg2 == Enum.LobbyType.LOBBY_TYPE_GAME then
			if f63_local3 == true then
				Lobby.Platform.PlatformSessionXboxRoundStart( f63_arg0, f63_arg2 )
			elseif f63_local4 == true then
				Lobby.Platform.PlatformSessionXboxRoundEnd( f63_arg0, f63_arg2 )
			end
			if f63_local2 == true then
				local f63_local5, f63_local6 = Lobby.Platform.PlatformSessionXboxGenerateSessionId( f63_arg2 )
				if f63_local5 == true and f63_local6 ~= f0_local6( f63_arg0, f63_arg2 ) then
					Lobby.Platform.PlatformSessionXboxLeave( f63_arg0, f63_arg2 )
				end
				f0_local7( f63_arg0, f63_arg2, false )
				return 
			end
		end
		return 
	end
	Lobby.Platform.PlatformSessionXboxCreate( f63_arg0, f63_arg2 )
end

Lobby.Platform.PlatformSessionXboxPump = function ()
	local f64_local0 = false
	if Engine.FriendsIsTaskInProgress then
		f64_local0 = Engine.FriendsIsTaskInProgress()
	end
	if Lobby.Platform.XBOX.taskInProgress == true or Engine.IsRequestingJoin() == true or Lobby.ProcessQueue.IsQueueEmpty() == false or f64_local0 == true then
		Lobby.Platform.XBOX.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalDurango:get()
		return 
	elseif Engine.milliseconds() < Lobby.Platform.XBOX.updateTime then
		return 
	end
	Lobby.Platform.XBOX.updateTime = Engine.milliseconds() + Dvar.platformSessionUpdateIntervalDurango:get()
	local f64_local1 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	for f64_local2 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
		local f64_local5 = f64_local2 - 1
		local f64_local6 = false
		if Engine.PlatformSessionXboxIsLiveContextForControllerReadyRaw then
			f64_local6 = Engine.PlatformSessionXboxIsLiveContextForControllerReadyRaw( f64_local5 )
		else
			f64_local6 = Engine.PlatformSessionXboxIsLiveContextForControllerReady( f64_local5 )
		end
		local f64_local7 = Engine.IsControllerBeingUsed( f64_local5 )
		if f64_local6 == true then
			for f64_local8 = Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyType.LOBBY_TYPE_PRIVATE, -1 do
				Lobby.Platform.PlatformSessionXboxPumpController( f64_local5, f64_local7, f64_local8, f64_local1, Engine.IsLobbyActive( f64_local8 ) )
				if Lobby.Platform.XBOX.taskInProgress == true then
					return 
				end
			end
		elseif Lobby.Platform.XBOX.lastSignedInState[f64_local2] == true then
			f0_local13( f64_local5, true )
		end
		Lobby.Platform.XBOX.lastSignedInState[f64_local2] = f64_local6
	end
end

Lobby.Platform.InviteFailed = function ( f65_arg0 )
	Engine.LuiVM_Event( "open_toaster_popup", {
		isError = true,
		controller = f65_arg0.controller,
		xuid = f65_arg0.xuid,
		gamertag = f65_arg0.gamertag,
		immediate = true
	} )
end

Lobby.Platform.InviteComplete = function ( f66_arg0, f66_arg1, f66_arg2 )
	local f66_local0 = f66_arg1.controller
	local f66_local1 = f66_arg1.xuid
	local f66_local2 = f66_arg1.gamertag
	if f66_arg0 == Lobby.ProcessQueue.ACTIONSTATE.RUNNING then
		return false
	elseif f66_arg0 == Lobby.ProcessQueue.ACTIONSTATE.SUCCESS then
		Engine.LuiVM_Event( "open_toaster_popup", {
			isError = false,
			controller = f66_local0,
			xuid = f66_local1,
			gamertag = f66_local2,
			immediate = true
		} )
	elseif f66_arg0 == Lobby.ProcessQueue.ACTIONSTATE.FAILURE or f66_arg0 == Lobby.ProcessQueue.ACTIONSTATE.ERROR then
		if true == Dvar.platformSessionShowErrorCodes:get() then
			f66_arg1.gamertag = f66_arg1.gamertag .. " - " .. returnCodeHex
		end
		Lobby.Platform.InviteFailed( f66_arg1 )
	end
	return true
end

Lobby.Platform.Invite = function ( f67_arg0 )
	if Lobby.Platform.PlatformSessionOrbisEnabled() == false and Lobby.Platform.PlatformSessionDurangoEnabled() == false then
		return 
	end
	local f67_local0 = f67_arg0.controller
	local f67_local1 = f67_arg0.xuid
	local f67_local2 = f67_arg0.gamertag
	Dvar.platformSessionOrbisInviteMessage:set( Engine.LocalizeWithoutLocsMarkers( "MENU_GAME_INVITE_MESSAGE", f67_local2 ) )
	if Lobby.Platform.PlatformSessionOrbisEnabled() then
		if f0_local1( f67_local0 ) == "" then
			Lobby.Platform.InviteFailed( f67_arg0 )
			return 
		end
		local f67_local3 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.InviteComplete, f67_arg0 )
		if Engine.PlatformSessionPS4Invite( f67_local3, f67_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f67_local1, f67_local2, f0_local1( f67_local0 ) ) == false then
			Lobby.Platform.InviteFailed( f67_arg0 )
			Lobby.ProcessQueue.UnRegisterEventHandler( f67_local3 )
		end
	elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
		local f67_local3 = Lobby.ProcessQueue.RegisterEventHandler( Lobby.Platform.InviteComplete, f67_arg0 )
		if Engine.PlatformSessionXboxInvite( f67_local3, f67_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f67_local1, f67_local2 ) == false then
			Lobby.Platform.InviteFailed( f67_arg0 )
			Lobby.ProcessQueue.UnRegisterEventHandler( f67_local3 )
		end
	end
end

Lobby.Platform.AutoJoinPump = function ()
	if Lobby.Platform.AutoJoinData ~= nil and Engine.IsClientLoaded( Lobby.Platform.AutoJoinData.controller ) then
		if Engine.IsInGame() then
			Lobby.Platform.QuitGame( Lobby.Platform.AutoJoinData.controller )
			return 
		end
		local f68_local0 = Lobby.Platform.GetAutoJoinProcess( Lobby.Platform.AutoJoinData )
		if f68_local0 ~= nil then
			Lobby.ProcessQueue.AddToQueue( "AutoJoin", f68_local0 )
		end
		Lobby.Platform.AutoJoinData = nil
	end
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
	Lobby.Platform.AutoJoinPump()
end

Lobby.Platform.Init = function ()
	if Engine.IsDedicatedServer() == false then
		if LuaUtils.isPS4 == true then
			for f70_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
				Lobby.Platform.PS4.sessionId[f70_local0] = ""
				Lobby.Platform.PS4.lobbyId[f70_local0] = 0
				Lobby.Platform.PS4.changed[f70_local0] = false
				Lobby.Platform.PS4.sessionFailure[f70_local0] = false
				Lobby.Platform.PS4.lastSignedInState[f70_local0] = false
			end
		elseif LuaUtils.isXbox == true then
			for f70_local0 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
				local f70_local3 = f70_local0 - 1
				Lobby.Platform.XBOX.rtaSubscribe[f70_local0] = false
				Lobby.Platform.XBOX.templateName[f70_local0] = {}
				Lobby.Platform.XBOX.sessionId[f70_local0] = {}
				Lobby.Platform.XBOX.changed[f70_local0] = {}
				Lobby.Platform.XBOX.sessionFailure[f70_local0] = {}
				Lobby.Platform.XBOX.lastSignedInState[f70_local0] = false
				Lobby.Platform.XBOX.roundStart[f70_local0] = false
				Lobby.Platform.XBOX.roundStartSessionId[f70_local0] = ""
				Lobby.Platform.XBOX.roundEnd[f70_local0] = false
				Lobby.Platform.XBOX.playerSessionId[f70_local0] = nil
				Lobby.Platform.XBOX.roundStartTime[f70_local0] = 0
				Lobby.Platform.XBOX.roundStartCounter[f70_local0] = 0
				Lobby.Platform.XBOX.roundEndCounter[f70_local0] = 0
				f0_local3( f70_local3, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE.PRIVATE_LOBBY )
				f0_local3( f70_local3, Enum.LobbyType.LOBBY_TYPE_GAME, Lobby.Platform.PLATFORM_SESSION_XBOX_TEMPLATE.GAME_LOBBY )
				for f70_local4 = Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, 1 do
					f0_local5( f70_local3, f70_local4, "" )
					f0_local7( f70_local3, f70_local4, false )
					f0_local9( f70_local3, f70_local4, false )
				end
			end
		end
	end
end

Lobby.Platform.Init()
