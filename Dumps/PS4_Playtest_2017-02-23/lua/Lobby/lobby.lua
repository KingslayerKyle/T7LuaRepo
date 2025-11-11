require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Shared.LuaUtils" )
require( "lua.Lobby.LobbyAnalytics" )
require( "lua.Lobby.LobbyAnticheat" )
require( "lua.Lobby.LobbyDebug" )
require( "lua.Lobby.LobbyHopper" )
require( "lua.Lobby.LobbyJoin" )
require( "lua.Lobby.LobbyLaunch" )
require( "lua.Lobby.LobbyLeaderboard" )
require( "lua.Lobby.LobbyMapVote" )
require( "lua.Lobby.LobbyMerge" )
require( "lua.Lobby.LobbyPartyPrivacy" )
require( "lua.Lobby.LobbyPlatform" )
require( "lua.Lobby.LobbyScheduler" )
require( "lua.Lobby.LobbyTeamSelection" )
require( "lua.Lobby.LobbyTheater" )
require( "lua.Lobby.LobbyTimer" )
require( "lua.Lobby.LobbyUserGeneratedContent" )
require( "lua.Lobby.CoD.LobbyCP" )
require( "lua.Lobby.CoD.LobbyMP" )
require( "lua.Lobby.CoD.LobbyZM" )
require( "lua.Lobby.Storage.LobbyStats" )
require( "lua.Lobby.Storage.LobbyStorage" )

LobbyVM = {
	DevGui = {},
	lobbyStatus = {
		cleared = true,
		clearedTime = 0
	},
	playSoundHistory = {}
}
LobbyVM.DevGui.LaunchGame = function ( mapname, gametype )
	if mapname ~= nil then
		Dvar.ui_mapname:set( mapname )
	end
	if gametype ~= nil then
		Dvar.ui_gametype:set( gametype )
	end
	if not Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	else
		Lobby.Timer.Clear( true )
		local controller = Engine.GetPrimaryController()
		LobbyVM.LaunchGameExec( controller, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

LobbyVM.DevGui.CustomGameAdvertise = function ()
	if not Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	end
	local curScreenId = Engine.GetLobbyUIScreen()
	local f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
	if curScreenId ~= f2_local0.id then
		return 
	end
	local advertisingOnOff = false
	local advertising = "off"
	if not Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		advertisingOnOff = true
		advertising = "on"
		Lobby.Matchmaking.SetupAdvertisingCustomMatch()
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Turning session advertisement " .. advertising .. ".\n" )
	local controller = Engine.GetPrimaryController()
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.PUBLIC )
	Engine.AdvertiseLobby( Lobby.ProcessQueue.INVALID_ACTION_ID, Enum.LobbyType.LOBBY_TYPE_GAME, advertisingOnOff )
end

LobbyVM.DevGui.LobbyReset = function ()
	local data = {
		controller = Engine.GetPrimaryController(),
		signoutUsers = false
	}
	LobbyVM.OnErrorShutdown( data )
end

LobbyVM.PlaySound = function ( sound, waitTimeBeforeNextPlay )
	local playSound = false
	if LobbyVM.playSoundHistory[sound] == nil then
		playSound = true
	elseif LobbyVM.playSoundHistory[sound] < Engine.milliseconds() then
		playSound = true
	end
	if playSound == true then
		Engine.PlaySound( sound )
		LobbyVM.playSoundHistory[sound] = Engine.milliseconds() + waitTimeBeforeNextPlay
	end
end

LobbyVM.ExecuteLobbyVMRequest = function ( request )
	local lobbyVMRequestModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyVMRequest" )
	local lobbyVMRequest = Engine.GetModelValue( lobbyVMRequestModel )
	if lobbyVMRequest == request then
		Engine.ForceNotifyModelSubscriptions( lobbyVMRequestModel )
	else
		Engine.SetModelValue( lobbyVMRequestModel, request )
	end
end

LobbyVM.ExecuteLobbyVMCreateOverlay = function ( controller, overlay )
	local overlayControllerModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyVMCreateOverlayController" )
	Engine.SetModelValue( overlayControllerModel, controller )
	local overlayModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyVMCreateOverlay" )
	local overlayCurr = Engine.GetModelValue( overlayModel )
	if overlayCurr == overlay then
		Engine.ForceNotifyModelSubscriptions( overlayModel )
	else
		Engine.SetModelValue( overlayModel, overlay )
	end
end

LobbyVM.OnErrorShutdown = function ( data )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Performing emergency shutdown.\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Close all popups in the lobby.\n" )
	local closePopupsModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" )
	Engine.ForceNotifyModelSubscriptions( closePopupsModel )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down joins.\n" )
	Engine.LobbyJoinErrorShutdown()
	if Engine.LobbyClientTaskErrorShutdown then
		Engine.LobbyClientTaskErrorShutdown()
	end
	if Engine.LobbyHostTaskErrorShutdown then
		Engine.LobbyHostTaskErrorShutdown()
	end
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down qos probes.\n" )
		Engine.QoSErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down advertisement.\n" )
		Engine.AdvertiseErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down search.\n" )
		Engine.LobbySearchErrorShutdown()
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down private lobby.\n" )
	Engine.LobbyClientErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
	Engine.LobbyHostErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down game lobby.\n" )
	Engine.LobbyClientErrorShutdown( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	Engine.LobbyHostErrorShutdown( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Clearing process queue.\n" )
	Lobby.ProcessQueue.ErrorShutdown()
	if data.signoutUsers ~= nil and data.signoutUsers == true then
		Engine.SignOutAllUsers()
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Forcing UI screen.\n" )
	local f7_local0 = Engine.ForceLobbyUIScreen
	local f7_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	f7_local0( f7_local1.id )
	Engine.LuiVM_Event( "open_main", {} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby emergency shutdown complete.\n" )
end

LobbyVM.ErrorShutdownMessage = function ( controller, errorMessage )
	local data = {
		controller = controller,
		signoutUsers = false
	}
	LobbyVM.OnErrorShutdown( data )
	LuaUtils.UI_ShowErrorMessageDialog( controller, errorMessage )
end

LobbyVM.LogGlobalData = function ()
	local data = {
		playlistVersion = Engine.GetPlaylistVersionNumber(),
		protocolVersion = Engine.GetProtocolVersion()
	}
	if Engine.GetDDLVersion ~= nil then
		data.ffotdVersion = Engine.GetFFOTDVersion()
		data.mpStatsDDLVersion = Engine.GetDDLVersion( "gamedata/ddl/mp/mp_stats.ddl" )
		data.mpLoadoutsDDLVersion = Engine.GetDDLVersion( "gamedata/ddl/loadouts/mp_loadouts.ddl" )
		data.buildCL = Engine.GetBuildIntField( Enum.BuildIntField.BUILD_INTFIELD_CHANGELIST )
		data.buildMachine = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_MACHINE )
		data.buildTime = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_TIME )
		data.buildType = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_TYPE )
		data.buildName = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_NAME )
	end
	LuaUtils.LogQoS( "global_data", data )
end

LobbyVM.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST then
		local isUIHost = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.isHost" ) )
		if isUIHost and isUIHost ~= 0 then
			LuaUtils.ForceLobbyButtonUpdate()
		end
	end
	Lobby.Matchmaking.OnClientAdded( data )
	Lobby.TeamSelection.OnClientAdded( data )
	Lobby.Pregame.OnClientAdded( data )
	Lobby.Leaderboard.OnClientAdded( data )
	Engine.QoSProbeListenerUpdate( lobbyType )
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.AddLobbyClientExtracam( data.xuid )
	end
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( xuid ) and not Engine.IsInGame() then
		LobbyVM.PlaySound( LobbyData.Sounds.ClientsAddedToLobby, 500 )
	end
	if LuaDefine.isPS4 == true and Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() and lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT and lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE and Engine.IsLocalClient( xuid ) and not Engine.IsInGame() then
		local controller = Engine.GetControllerForXuid( xuid )
		if Engine.NotifyPsPlusAsyncMultiplay ~= nil then
			Engine.NotifyPsPlusAsyncMultiplay( controller )
		end
	end
	data.lobbyID = Engine.GetLobbyLobbyID( lobbyModule, lobbyType )
	LuaUtils.LogQoS( "client_added", data )
end

LobbyVM.OnClientRemoved = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST then
		LuaUtils.ForceLobbyButtonUpdate()
	end
	Lobby.Timer.OnClientRemoved( data )
	Lobby.Pregame.OnClientRemoved( data )
	Lobby.Matchmaking.OnClientRemoved( data )
	Engine.QoSProbeListenerUpdate( lobbyType )
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.RemoveLobbyClientExtracam( data.xuid )
	end
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( xuid ) and not Engine.IsInGame() then
		LobbyVM.PlaySound( LobbyData.Sounds.ClientsRemovedFromLobby, 500 )
	end
	data.lobbyID = Engine.GetLobbyLobbyID( lobbyModule, lobbyType )
	LuaUtils.LogQoS( "client_removed", data )
end

LobbyVM.OnUILevelRunningChanged = function ( data )
	local uiLevelRunning = data.running
	for controllerIndex = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
		Engine.SendClientHeartbeat( controllerIndex, Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT ) )
	end
end

LobbyVM.OnMatchChangeMap = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.Stats.OnMatchChangeMap( data )
	Lobby.Matchmaking.OnMatchChangeMap( data )
	local f13_local0 = Engine.GetGlobalModel()
	f13_local0 = f13_local0:create( "lobbyRoot.selectedMapId" )
	f13_local0:set( data.nextMap )
	LuaUtils.LogQoS( "match_change_map", data )
end

LobbyVM.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.CP.OnMatchEnd( data )
	Lobby.TeamSelection.OnMatchEnd( data )
	Lobby.Timer.OnMatchEnd( data )
	Lobby.Analytics.OnMatchEnd( data )
	Lobby.Matchmaking.OnMatchEnd( data )
	Lobby.Platform.OnMatchEnd( data )
	Lobby.Debug.OnMatchEnd( data )
	LuaUtils.BuyWeaponContractIfNeededAfterMatch()
	LuaUtils.SaveAfterMatchContractStats()
	LuaUtils.CycleContracts()
	LuaUtils.ResetToLastSelectedSpecialistIfNeededAfterMatch()
end

LobbyVM.ShouldShowContentChangedMessage = function ( controller, lobbyType )
	local mapName = Dvar.ui_mapname:get()
	local dlcBit = Engine.GetDLCBitForMapName( mapName )
	local ourDlcBits = Engine.GetDLCBits()
	if LobbyVM.CheckDLCBit( ourDlcBits, dlcBit ) then
		return true
	else
		return false
	end
end

LobbyVM.OnDisconnect = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local disconnectClientXuid = data.disconnectClientXuid
	local disconnectClient = data.disconnectClient
	local controller = Engine.GetPrimaryController()
	local errorDialog = true
	local errorMsgTitle = nil
	local errorMsg = Engine.Localize( "EXE_DISCONNECTED_FROM_SERVER" )
	local process = Lobby.Process.Recover( controller )
	if disconnectClient == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_INVALID then
		
	elseif disconnectClient == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_DROP then
		
	elseif disconnectClient == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_NOPARTYCHAT then
		errorDialog = false
		errorMsgTitle = Engine.Localize( "MENU_NOTICE" )
		errorMsg = Engine.Localize( "PLATFORM_PARTYCHATNOTALLOWED" )
		Dvar.partyChatDisallowed:set( false )
	elseif disconnectClient == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK then
		errorDialog = false
		errorMsgTitle = Engine.Localize( "EXE_KICKED_FROM_PARTY_WARNING_TITLE" )
		errorMsg = Engine.Localize( "EXE_KICKED_FROM_PARTY_WARNING" )
	elseif disconnectClient == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_BADDLC then
		if LobbyVM.ShouldShowContentChangedMessage( controller, lobbyType ) then
			Engine.ComError( Enum.errorCode.ERROR_DROP, "MENU_NEW_DLC_AVAILABLE" )
		else
			Engine.ComError( Enum.errorCode.ERROR_DROP, "PLATFORM_MISSINGMAP" )
		end
	elseif disconnectClient == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_HOSTRELOAD then
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) and not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			local minReloadSearchTime = Engine.GetDvarInt( "arena_lobbyReloadSearchDelayMin" )
			local maxReloadSearchTime = Engine.GetDvarInt( "arena_lobbyReloadSearchDelayMax" )
			local process = Lobby.ProcessNavigate.ReloadGameLobby( controller, math.random( minReloadSearchTime, maxReloadSearchTime ) )
			Lobby.ProcessQueue.AddToQueue( "ReloadGameLobby", process )
		end
		return 
	end
	if errorDialog == true then
		process.tail.success = Lobby.Actions.ErrorPopupMsg( errorMsg, errorMsgTitle )
	else
		process.tail.success = Lobby.Actions.WarningPopupMsg( errorMsg, errorMsgTitle )
	end
	Lobby.ProcessQueue.AddToQueue( "DisconnectFromHost", process )
end

LobbyVM.ComErrorCodeToString = function ( errorCode )
	if errorCode == Enum.errorCode.ERROR_NONE then
		return "ERR_NONE"
	elseif errorCode == Enum.errorCode.ERROR_FATAL then
		return "ERR_FATAL"
	elseif errorCode == Enum.errorCode.ERROR_DROP then
		return "ERR_DROP"
	elseif errorCode == Enum.errorCode.ERROR_FROM_STARTUP then
		return "ERR_FROM_STARTUP"
	elseif errorCode == Enum.errorCode.ERROR_SERVERDISCONNECT then
		return "ERR_SERVERDISCONNECT"
	elseif errorCode == Enum.errorCode.ERROR_DISCONNECT then
		return "ERR_DISCONNECT"
	elseif errorCode == Enum.errorCode.ERROR_SCRIPT then
		return "ERR_SCRIPT"
	elseif errorCode == Enum.errorCode.ERROR_SCRIPT_DROP then
		return "ERR_SCRIPT_DROP"
	elseif errorCode == Enum.errorCode.ERROR_LOCALIZATION then
		return "ERR_LOCALIZATION"
	elseif errorCode == Enum.errorCode.ERROR_UI then
		return "ERR_UI"
	elseif errorCode == Enum.errorCode.ERROR_LUA then
		return "ERR_LUA"
	elseif errorCode == Enum.errorCode.ERROR_SOFTRESTART then
		return "ERR_SOFTRESTART"
	elseif errorCode == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
		return "ERR_SOFTRESTART_KEEPDW"
	elseif errorCode == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return "ERR_SOFTRESTART_SILENT"
	else
		return tostring( errorCode )
	end
end

LobbyVM.OnComError = function ( data )
	Lobby.Platform.OnComError( data )
	if data.isInCleanup then
		LobbyVM.OnComErrorCleanup( data )
		return 
	end
	local controller = data.controller
	local errorCode = data.errorCode
	local errorMsg = data.errorMsg
	local signoutUsers = data.signoutUsers
	local comErrorInProgress = data.comErrorInProgress
	Lobby.Debug.OnComError( data )
	Engine.PrintError( Enum.consoleLabel.LABEL_DEFAULT, "COM ERROR - errorCode: " .. LobbyVM.ComErrorCodeToString( errorCode ) .. ", errorMsg: " .. errorMsg .. ".\n" )
	local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
	Engine.SetModelValue( lobbyHideForStartModel, 0 )
	LuaUtils.LogQoS( "lobby_error", data )
	if errorCode == Enum.errorCode.ERROR_SOFTRESTART or errorCode == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW or errorCode == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and not Engine.IsSignedInToDemonware( controller ) then
		LobbyVM.OnErrorShutdown( data )
	end
	if errorCode == Enum.errorCode.ERROR_UI or errorCode == Enum.errorCode.ERROR_DISCONNECT or errorCode == Enum.errorCode.ERROR_FATAL or errorCode == Enum.errorCode.ERROR_DROP or errorCode == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW or errorCode == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return 
	elseif errorCode == Enum.errorCode.ERROR_NONE or errorCode == Enum.errorCode.ERROR_LUA or errorCode == Enum.errorCode.ERROR_FROM_STARTUP or errorCode == Enum.errorCode.ERROR_LOCALIZATION or errorCode == Enum.errorCode.ERROR_SERVERDISCONNECT then
		LuaUtils.UI_ShowErrorMessageDialog( controller, errorMsg )
		return 
	elseif errorCode == Enum.errorCode.ERROR_SCRIPT or errorCode == Enum.errorCode.ERROR_SCRIPT_DROP then
		LuaUtils.UI_ShowErrorMessageDialog( controller, errorMsg )
		local process = Lobby.Process.NonFatalError( errorMsg )
		Lobby.ProcessQueue.AddToQueue( "ErrorNonFatal", process )
		return 
	end
	error( "LobbyVM.OnError - Unhandled COM_ERROR: " .. LobbyVM.ComErrorCodeToString( errorCode ) .. ", Message: " .. errorMsg .. ".\n" )
end

LobbyVM.ShutdownCleanupMP = function ( data )
	
end

LobbyVM.ShutdownCleanupZM = function ( data )
	
end

LobbyVM.ShutdownCleanupCP = function ( data )
	
end

LobbyVM.ShutdownCleanup = function ( data )
	Dvar.ui_gametype:set( "" )
	Dvar.ui_mapname:set( "" )
	LobbyVM.ShutdownCleanupCP( data )
	LobbyVM.ShutdownCleanupMP( data )
	LobbyVM.ShutdownCleanupZM( data )
end

LobbyVM.OnComErrorCleanup = function ( data )
	local controller = data.controller
	local errorCode = data.errorCode
	local errorMsg = data.errorMsg
	local errorShutdown = data.errorShutdown
	Engine.LobbyLaunchClear()
	if errorShutdown ~= nil and errorShutdown == true then
		LobbyVM.OnErrorShutdown( data )
		LobbyVM.ShutdownCleanup( data )
	end
	if errorCode == Enum.errorCode.ERROR_FATAL then
		LuaUtils.UI_ShowErrorMessageDialog( controller, errorMsg )
		local process = Lobby.Process.Recover( controller )
		if process ~= nil then
			Lobby.ProcessQueue.AddToQueue( "ErrorFatal", process )
		end
	elseif errorCode == Enum.errorCode.ERROR_DROP then
		local process = Lobby.Process.Recover( controller )
		if process then
			local errorPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
			Lobby.Process.AddActions( process.tail, errorPopup, errorPopup, errorPopup )
			Lobby.ProcessQueue.AddToQueue( "ERROR_DROP", process )
		else
			LuaUtils.UI_ShowErrorMessageDialog( controller, errorMsg )
		end
	elseif errorCode == 1026 then
		Lobby.ProcessQueue.ClearQueue()
		LuaUtils.UI_ShowErrorMessageDialog( controller, errorMsg )
	elseif errorCode == 2050 then
		if string.len( errorMsg ) > 0 then
			LuaUtils.UI_ShowErrorMessageDialog( controller, errorMsg )
		end
	elseif errorCode == 4098 and string.len( errorMsg ) > 0 then
		LuaUtils.UI_ShowInfoMessageDialog( controller, errorMsg )
	end
end

LobbyVM.OnRecordComScoreEvent = function ( data )
	local controller = data.controller
	local categoryName = data.eventCategoryName
	local flatTable = {}
	for k, v in pairs( data.EventParams ) do
		table.insert( flatTable, k )
		table.insert( flatTable, v )
	end
	if #flatTable > 0 and #flatTable % 2 == 0 then
		Engine.RecordComScoreEvent( controller, categoryName, unpack( flatTable ) )
	end
end

LobbyVM.OnPreExecFFOTD = function ()
	Lobby.Platform.OnPreExecFFOTD()
	local data = {
		controller = Engine.GetPrimaryController(),
		signoutUsers = false
	}
	local FFOTDShutdownModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.FFOTDShutdown" )
	Engine.SetModelValue( FFOTDShutdownModel, true )
	LobbyVM.OnErrorShutdown( data )
	Engine.SetModelValue( FFOTDShutdownModel, false )
end

LobbyVM.OnDWDisconnect = function ( data )
	local controller = data.controller
	if not Engine.IsDedicatedServer() and controller == Engine.GetPrimaryController() then
		Engine.LobbyOnlineCancel( true )
	end
end

LobbyVM.OnDemoEndFinished = function ( data )
	if Lobby.Join.autoJoin.data ~= nil then
		local joinProcess = nil
		if Lobby.Join.autoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				if Lobby.Join.autoJoin.data.playTogether == true then
					local f27_local0 = Lobby.Process.Recover
					local f27_local1 = controller
					local f27_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
					recoverProcess = f27_local0( f27_local1, f27_local2.id )
					joinProcess = Lobby.Platform.PS4ProcessPlayTogetherEvent( Lobby.Join.autoJoin.data.platformData )
				else
					joinProcess = Lobby.Platform.InGamePlatformJoinOrbis( Lobby.Join.autoJoin.data.platformData )
				end
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				joinProcess = Lobby.Platform.InGamePlatformJoinDurango( Lobby.Join.autoJoin.data.platformData )
			end
		else
			joinProcess = Lobby.Join.GetJoinProcess( Lobby.Join.autoJoin.data )
		end
		if joinProcess ~= nil then
			Lobby.ProcessQueue.AddToQueue( "DemoEnd", joinProcess )
		end
		Lobby.Join.autoJoin.data = nil
	end
end

LobbyVM.OnLobbyHostLeftNoMigration = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local lobbyMainMode = data.lobbyMainMode
	local lobbyNetworkMode = data.lobbyNetworkMode
	local maxClients = data.maxClients
	local isGameLobbyActive = data.isGameLobbyActive
	local isPrivateHost = data.isPrivateHost
	if not LobbyVM.CanClientLaunch( false ) then
		return 
	elseif Engine.IsLobbyInRecovery( lobbyType ) then
		return 
	elseif isGameLobbyActive == true and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		if Lobby.ProcessQueue.GetCurrentRunningProcessName() ~= "HostLeftNoMigrationGame" then
			local process = Lobby.Process.Recover( controller )
			Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigrationGame", process )
		end
	else
		local process = Lobby.Process.HostLeftNoMigrationCreatePrivateLobby( controller, lobbyMainMode, maxClients )
		Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigration", process )
	end
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "host_left_no_migration", data )
end

LobbyVM.OnLobbyHostLeftInGameMigrateFinished = function ( data )
	local controller = data.controller
	local recoverProcess = Lobby.Process.Recover( controller )
	if Lobby.Join.autoJoin.data ~= nil then
		local joinProcess = nil
		if Lobby.Join.autoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				if Lobby.Join.autoJoin.data.playTogether == true then
					local f29_local0 = Lobby.Process.Recover
					local f29_local1 = controller
					local f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
					recoverProcess = f29_local0( f29_local1, f29_local2.id )
					joinProcess = Lobby.Platform.PS4ProcessPlayTogetherEvent( Lobby.Join.autoJoin.data.platformData )
				else
					joinProcess = Lobby.Platform.InGamePlatformJoinOrbis( Lobby.Join.autoJoin.data.platformData )
				end
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				joinProcess = Lobby.Platform.InGamePlatformJoinDurango( Lobby.Join.autoJoin.data.platformData )
			end
		else
			joinProcess = Lobby.Join.GetJoinProcess( Lobby.Join.autoJoin.data )
		end
		if joinProcess ~= nil then
			Lobby.Process.AppendProcess( recoverProcess, joinProcess )
		end
		Lobby.Join.autoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyHostLeft_InGameMigrateFinished", recoverProcess )
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "ingame_migrate_finished", data )
end

LobbyVM.OnLobbyClientLeftEvent = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local lobbyMainMode = data.lobbyMainMode
	local lobbyNetworkMode = data.lobbyNetworkMode
	local maxClients = data.maxClients
	local recoverProcess = Lobby.Process.Recover( controller )
	if Lobby.Join.autoJoin.data ~= nil then
		local joinProcess = nil
		if Lobby.Join.autoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				if Lobby.Join.autoJoin.data.playTogether == true then
					local f30_local0 = Lobby.Process.Recover
					local f30_local1 = controller
					local f30_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
					recoverProcess = f30_local0( f30_local1, f30_local2.id )
					joinProcess = Lobby.Platform.PS4ProcessPlayTogetherEvent( Lobby.Join.autoJoin.data.platformData )
				else
					joinProcess = Lobby.Platform.InGamePlatformJoinOrbis( Lobby.Join.autoJoin.data.platformData )
				end
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				joinProcess = Lobby.Platform.InGamePlatformJoinDurango( Lobby.Join.autoJoin.data.platformData )
			end
		else
			joinProcess = Lobby.Join.GetJoinProcess( Lobby.Join.autoJoin.data )
		end
		if joinProcess ~= nil then
			Lobby.Process.AppendProcess( recoverProcess, joinProcess )
		end
		Lobby.Join.autoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyClientLeft", recoverProcess )
end

LobbyVM.OnDevmap = function ( data )
	local controller = data.controller
	local mainMode = data.mainMode
	local process = Lobby.Process.Devmap( controller, mainMode )
	Lobby.ProcessQueue.AddToQueue( "Devmap", process )
end

LobbyVM.OnDevmapClient = function ( data )
	local controller = data.controller
	local process = Lobby.Process.DevmapClient( controller )
	Lobby.ProcessQueue.AddToQueue( "DevmapClient", process )
end

LobbyVM.OnNetworkModeChanged = function ( data )
	
end

LobbyVM.OnGoForward = function ( data )
	if Lobby.Launch.IsHostLaunching() then
		return 
	end
	local controller = Engine.GetPrimaryController()
	local openMenu = data.navToMenu
	local withParty = data.withParty
	local disbandParty = data.disbandParty
	local currentMenuId = LobbyData.GetLobbyNav()
	local fromTarget = LobbyData.GetLobbyMenuByID( currentMenuId )
	local toTarget = LobbyData.GetLobbyMenuByName( openMenu )
	if fromTarget == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if toTarget == nil then
		error( "LobbyVM: No menu called '" .. openMenu .. "' found." )
	end
	local processFunc = Lobby.Process.GetForwardFunc( fromTarget, toTarget )
	if processFunc == nil then
		error( "LobbyVM: No forward process function found to move from '" .. fromTarget.name .. "' to '" .. openMenu .. "'." )
	end
	local goForwardProcess = processFunc( controller, fromTarget, toTarget )
	if goForwardProcess ~= nil and disbandParty == true then
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
			local leavePartyProcess = Lobby.Process.ManagePartyLeave( controller )
			Lobby.Process.AppendProcess( leavePartyProcess, goForwardProcess )
			Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. fromTarget.name .. "' menu to '" .. toTarget.name .. "' menu AND ManagePartyLeave", leavePartyProcess )
		else
			local leavePartyProcess = Lobby.Process.ReloadPrivateLobby( controller, Engine.GetLobbyNetworkMode() )
			Lobby.Process.AppendProcess( leavePartyProcess, goForwardProcess )
			Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. fromTarget.name .. "' menu to '" .. toTarget.name .. "' menu AND PartyMemberLeave", leavePartyProcess )
		end
		return 
	end
	Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. fromTarget.name .. "' menu to '" .. toTarget.name .. "' menu.", goForwardProcess )
end

LobbyVM.OnGoBack = function ( data )
	if Lobby.Launch.IsHostLaunching() then
		return 
	end
	local controller = Engine.GetPrimaryController()
	local withParty = data.withParty
	local fromTarget = LobbyData.GetLobbyMenuByID( LobbyData.GetLobbyNav() )
	if fromTarget == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	local toTarget, processFunc = Lobby.Process.GetBackFunc( fromTarget )
	if toTarget == nil or processFunc == nil then
		error( "LobbyVM: No back process function found for '" .. currentMenu( "'." ) )
	end
	local process = processFunc( controller, fromTarget, toTarget, withParty )
	Lobby.ProcessQueue.AddToQueue( "GoBackFrom" .. fromTarget.name, process )
end

LobbyVM.OnManagePartyLeave = function ( data )
	if Lobby.Launch.IsHostLaunching() then
		return 
	end
	local controller = data.controller
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
		local process = Lobby.Process.ManagePartyLeave( controller )
		Lobby.ProcessQueue.AddToQueue( "ManagePartyLeave", process )
	else
		local process = Lobby.Process.ReloadPrivateLobby( controller, Engine.GetLobbyNetworkMode() )
		Lobby.ProcessQueue.AddToQueue( "PartyMemberLeave", process )
	end
end

LobbyVM.OnInGameJoin = function ( data, platformJoinInvite )
	Lobby.Join.autoJoin.data = data
	if data.migrating ~= nil and data.migrating == false and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
		if platformJoinInvite == true then
			Lobby.Join.autoJoin.leaveServerImmediately = true
			return 
		elseif not CoDShared.IsInTheaterLobby() then
			Engine.LeaveServerImmediately()
		end
	end
end

LobbyVM.OnCreateDedicatedLANLobby = function ()
	local process = Lobby.Process.CreateDedicatedLANLobby( 0, LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP ) )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLANLobby", process )
end

LobbyVM.OnCreateDedicatedLobby = function ( data )
	local process = Lobby.Process.CreateDedicatedLobby( 0, LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC ) )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLobby", process )
end

LobbyVM.OnForceToMenu = function ( data )
	local target = LobbyData.GetLobbyMenuByName( data.menuName )
	local process = Lobby.Process.ForceToMenu( data.controller, target, data.msg )
	Lobby.ProcessQueue.AddToQueue( "ForceToMenu", process )
end

LobbyVM.OnLobbyClientPromoteToHost = function ( data )
	local process = Lobby.Process.PromoteClientToHost( data.controller, data.lobbyMainMode, data.lobbyType, data.lobbyMode, data.maxClients, data.hostInfo, data.isAdvertised, data.isInGame, data.newMigrateIndex )
	Lobby.ProcessQueue.AddToQueue( "PromoteClientToHost", process )
end

LobbyVM.OnLobbyLeaveWithParty = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local process = Lobby.Process.LeaveWithParty( lobbyModule, lobbyType, lobbyMode )
	if process == nil then
		return 
	else
		Lobby.ProcessQueue.AddToQueue( "LeaveWithParty", process )
	end
end

LobbyVM.OnCanLobbyCanMigrate = function ( data )
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		return false
	elseif lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return false
	elseif Engine.IsLobbyInRecovery ~= nil and Engine.IsLobbyInRecovery( lobbyType ) then
		return false
	else
		return true
	end
end

LobbyVM.OnLobbyLocalClientLeave = function ( data )
	if not Lobby.ProcessQueue.IsQueueEmpty() then
		return false
	else
		local controller = data.controller
		local leavingClientXuid = data.xuid
		local process = Lobby.Process.LocalClientLeave( controller, leavingClientXuid )
		if process == nil then
			return false
		else
			Lobby.ProcessQueue.AddToQueue( "LobbyLocalClientLeave", process )
			return true
		end
	end
end

LobbyVM.SetMaxLocalPlayers = function ( toTarget )
	local maxLocalPlayers = math.min( toTarget.maxLocalClients, Engine.GetMaxLocalControllers() )
	Dvar.lobby_maxLocalPlayers:set( maxLocalPlayers )
end

LobbyVM.OnLobbySettings = function ( data )
	local controller = data.controller
	local toTarget = data.toTarget
	local skipSwitchMode = data.skipSwitchMode
	local isDevMap = data.isDevMap
	if type( toTarget ) == "number" then
		toTarget = LobbyData.GetLobbyMenuByID( toTarget )
	end
	if toTarget == nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Tried to apply settings for an invalid target.\n" )
		return 
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Applying settings for menu: " .. toTarget.name .. ".\n" )
	if not skipSwitchMode then
		local currentMainMode = Engine.GetLobbyMainMode()
		local targetMainMode = toTarget.mainMode
		if Engine.SwitchCampaignMode then
			if targetMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				if LuaUtils.IsCPZMTarget( toTarget.id ) then
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES )
				else
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
				end
			else
				Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
			end
		end
		if currentMainMode ~= targetMainMode then
			if targetMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				Engine.SwitchMode( controller, "mp" )
			elseif targetMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				Engine.SwitchMode( controller, "cp" )
			elseif targetMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
				Engine.SwitchMode( controller, "zm" )
			else
				Engine.SwitchMode( controller, "" )
			end
		end
	end
	if isDevMap ~= true and toTarget.eGameModes == Enum.eGameModes.MODE_GAME_INVALID then
		Engine.ResetGametypeSettings()
	end
	LobbyVM.SetMaxLocalPlayers( toTarget )
	Engine.SetLobbyMode( toTarget.lobbyType, toTarget.lobbyMode )
	Engine.TEMPGameModeSetMode( toTarget.eGameModes )
end

LobbyVM.OnSessionModeChange = function ( data )
	local fromMode = data.fromMode
	local toMode = data.toMode
	Lobby.TeamSelection.OnSessionModeChange( fromMode, toMode )
end

LobbyVM.OnUpdateUI = function ( data )
	local target = data.toTarget
	local controller = data.controller
	if type( target ) == "number" then
		target = LobbyData.GetLobbyMenuByID( target )
	end
	local checkForAutoRoom = function ( room )
		if room == "auto" then
			return "room2"
		else
			return room
		end
	end
	
	Engine.SetLobbyUIScreen( target.id )
	LobbyData.SetLobbyNav( target )
	local lobbyModeModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMode", true )
	Engine.SetModelValue( lobbyModeModel, target.lobbyMode )
	local lobbyMainModeModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode", true )
	Engine.SetModelValue( lobbyMainModeModel, target.mainMode )
	local lobbyGameModeModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode", true )
	Engine.SetModelValue( lobbyGameModeModel, target.eGameModes )
	local room = checkForAutoRoom( target.room )
	local roomModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room", true )
	Engine.SetModelValue( roomModel, room )
end

LobbyVM.Leaderboard_PopulateCustomList = function ( data )
	return Lobby.Leaderboard.PopulateCustomList( data )
end

LobbyVM.CheckDLCBit = function ( dlcBits, bit )
	if Engine.GetDvarInt( "ui_freeDLC1" ) == 1 then
		dlcBits = dlcBits | Enum.ContentFlagBits.CONTENT_DLC1
	end
	return dlcBits & bit == bit
end

LobbyVM.LaunchGameExec = function ( controller, lobbyType )
	if lobbyType ~= Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST ) then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch game not supported for this lobby type(" .. lobbyType .. ")\n" )
		return false
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		local mapName = Dvar.ui_mapname:get()
		local gameType = Dvar.ui_gametype:get()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching game... **\n" )
		Engine.Exec( controller, "lobbyLaunchGame " .. lobbyType .. " " .. mapName .. " " .. gameType )
		return true
	else
		local head = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch game. Lobby process '" .. head.name .. "' in progress.\n" )
		return false
	end
end

LobbyVM.LaunchDemoExec = function ( controller, lobbyType )
	if lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch demo not supported for this lobby type(" .. lobbyType .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching demo... **\n" )
		Engine.Exec( controller, "lobbyLaunchDemo" )
		LuaUtils.UI_ClearErrorMessageDialog()
	else
		local head = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch damo. Lobby process '" .. head.name .. "' in progress.\n" )
	end
end

LobbyVM.GetNeededDLCBits = function ()
	local curScreenId = Engine.GetLobbyUIScreen()
	local f54_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
	if curScreenId ~= f54_local0.id then
		f54_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
		if curScreenId ~= f54_local0.id then
			f54_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
			if curScreenId == f54_local0.id then
				local dlcBitsForLobby = Engine.GetDLCBitsForLobby( Enum.LobbyType.LOBBY_TYPE_GAME )
				local playlistID = Engine.GetPlaylistID()
				return Lobby.Matchmaking.GetMapPackBits( dlcBitsForLobby, playlistID )
			end
			f54_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
			if curScreenId ~= f54_local0.id then
				f54_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP )
				if curScreenId ~= f54_local0.id then
					f54_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING )
					if curScreenId ~= f54_local0.id then
						f54_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA_STAGING )
						if curScreenId ~= f54_local0.id then
							f54_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
							if curScreenId == f54_local0.id then
								return 0
							end
							local mapName = Dvar.ui_mapname:get()
							if mapName == nil or mapName == "" or mapName == "mp_array" then
								mapName = Engine.GetCurrentMap()
							end
							return Engine.GetDLCBitForMapName( mapName )
						end
					end
				end
			end
			return 0
		end
	end
	local dlcBitsForLobby = Engine.GetDLCBitsForLobby( Enum.LobbyType.LOBBY_TYPE_GAME )
	local playlistID = Engine.GetPlaylistID()
	return Lobby.Matchmaking.GetMapPackBits( dlcBitsForLobby, playlistID )
end

LobbyVM.DLCMapCheck = function ()
	local mapName = Dvar.ui_mapname:get()
	local dlcBits = Engine.GetDLCBits()
	local dlcMapBit = LobbyVM.GetNeededDLCBits()
	if not LobbyVM.CheckDLCBit( dlcBits, dlcMapBit ) then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYCLIENT, "Leaving game because map '" .. mapName .. "' is in contentpack '" .. dlcMapBit .. "' but our dlcbits is '" .. dlcBits .. "'.\n" )
		local controller = Engine.GetPrimaryController()
		local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
		local failureRecovery = Lobby.Process.ReloadPrivateLobby( controller, Engine.GetLobbyNetworkMode() )
		local lobbySettingsRecovery = Lobby.Actions.LobbySettings( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN ) )
		local updateUIRecovery = Lobby.Actions.UpdateUI( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN ) )
		local dlcFailureMessage = Lobby.Actions.ErrorPopupMsg( "PLATFORM_MISSINGMAP" )
		Lobby.Process.ForceAction( endGameClient, failureRecovery.tail )
		Lobby.Process.ForceAction( failureRecovery.tail, lobbySettingsRecovery )
		Lobby.Process.ForceAction( lobbySettingsRecovery, updateUIRecovery )
		Lobby.Process.ForceAction( updateUIRecovery, dlcFailureMessage )
		Lobby.ProcessQueue.AddToQueue( "MissingMap", failureRecovery )
		return false
	else
		return true
	end
end

LobbyVM.CanClientLaunch = function ( justConnected )
	if LobbyVM.DLCMapCheck() == false then
		Engine.LobbyLaunchClear()
		return false
	else
		return true
	end
end

LobbyVM.OnUpdateLobbyStatusInfo = function ( data )
	Lobby.Timer.UpdateLobbyStatusInfo( data )
	Lobby.Pregame.UpdateLobbyStatusInfo( data )
end

LobbyVM.OnClientSelectionReceived = function ( data )
	Lobby.Pregame.OnClientSelectionReceived( data )
end

LobbyVM.SwitchTeam = function ( data )
	Lobby.TeamSelection.SwitchTeam( data )
end

LobbyVM.GameModeChanged = function ( data )
	Lobby.TeamSelection.GameModeChanged( data )
end

LobbyVM.OnCanBroadcastHostInfo = function ( data )
	local currentMenuId = LobbyData.GetLobbyNav()
	local currentTarget = LobbyData.GetLobbyMenuByID( currentMenuId )
	local f61_local0 = currentTarget.id
	local f61_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
	if f61_local0 ~= f61_local1.id then
		f61_local0 = currentTarget.id
		f61_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
		if f61_local0 == f61_local1.id then
		
		else
			return true
		end
	end
	return false
end

LobbyVM.OnUpdateAdvertising = function ( data )
	if data.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.Matchmaking.UpdateAdvertising( "force update from code" )
	end
end

LobbyVM.UGCOffensiveEmblemAdd = function ( data )
	Lobby.UGC.OffensiveEmblemAdd( data )
end

LobbyVM.OnChangeSigninState = function ( data )
	local process = nil
	if data.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_OUT then
		Lobby.Anticheat.OnControllerSignedOut( data.controller )
		if data.isPrimary then
			process = Lobby.Process.PrimaryControllerSignedOut( data.controller )
		end
	elseif data.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_IN then
		if data.isPrimary then
			process = Lobby.Process.PrimaryControllerSignedIn( data.controller )
		end
	else
		DebugPrint( "Warning unknown signin State [" .. data.onlineState .. "]" )
	end
	if process ~= nil then
		Lobby.ProcessQueue.AddToQueue( "ChangeSignInState", process )
	end
end

LobbyVM.ClearLobbyStatus = function ()
	if LobbyVM.lobbyStatus.cleared == true then
		return 
	elseif LobbyVM.lobbyStatus.clearedTime > Engine.milliseconds() then
		return 
	else
		LobbyVM.lobbyStatus.cleared = true
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local lobbyStatusString1Model = Engine.CreateModel( lobbyRootModel, "lobbyStatusString1" )
		local lobbyStatusString2Model = Engine.CreateModel( lobbyRootModel, "lobbyStatusString2" )
		local lobbyStatusString3Model = Engine.CreateModel( lobbyRootModel, "lobbyStatusString3" )
		Engine.SetModelValue( lobbyStatusString1Model, "" )
		Engine.SetModelValue( lobbyStatusString2Model, "" )
		Engine.SetModelValue( lobbyStatusString3Model, "" )
	end
end

LobbyVM.LobbyStatusUpdate = function ( data )
	if not Engine.IsMainThreadOrProxy() then
		return 
	end
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local lobbyStatusString1Model = Engine.CreateModel( lobbyRootModel, "lobbyStatusString1" )
	local lobbyStatusString2Model = Engine.CreateModel( lobbyRootModel, "lobbyStatusString2" )
	local lobbyStatusString3Model = Engine.CreateModel( lobbyRootModel, "lobbyStatusString3" )
	LobbyVM.lobbyStatus.cleared = false
	LobbyVM.lobbyStatus.clearedTime = Engine.milliseconds() + 10000
	local searchStage = data.searchStage
	local status = ""
	if searchStage == 1 then
		local numResults = data.numResults
		if numResults == 1 then
			status = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE_SINGLE" )
		else
			status = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE", numResults )
		end
		Engine.SetModelValue( lobbyStatusString1Model, status )
		Engine.SetModelValue( lobbyStatusString2Model, "" )
		Engine.SetModelValue( lobbyStatusString3Model, "" )
	elseif searchStage == 2 then
		local numResults = data.numResults
		local contactedResults = data.contactedResults
		Engine.SetModelValue( lobbyStatusString2Model, Engine.Localize( "MENU_SESSIONS_QOS_PROGRESS", contactedResults, numResults ) )
	elseif searchStage == 3 then
		local joiningNumHosts = data.joiningNumHosts
		local joiningCurHost = data.joiningCurHost
		Engine.SetModelValue( lobbyStatusString3Model, Engine.Localize( "MENU_SESSIONS_JOINING", joiningCurHost, joiningNumHosts ) )
	end
end

LobbyVM.ProcessCompleteSuccess = function ( data )
	Lobby.ProcessQueue.Success( data )
end

LobbyVM.ProcessCompleteFailure = function ( data )
	Lobby.ProcessQueue.Failure( data )
end

LobbyVM.ProcessCompleteError = function ( data )
	Lobby.ProcessQueue.Error( data )
end

LobbyVM.ProcessUpdate = function ( data )
	Lobby.ProcessQueue.Update( data )
end

LobbyVM.OnGameLobbyGameServerDataUpdate = function ( data )
	if Lobby.ProcessQueue.IsQueueEmpty() == true then
		local curScreenId = Engine.GetLobbyUIScreen()
		local f71_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
		if curScreenId ~= f71_local0.id then
			f71_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
			if curScreenId ~= f71_local0.id then
				f71_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
				if curScreenId == f71_local0.id then
				
				else
					local playlistID = Engine.GetPlaylistID()
					local playlistName = Engine.GetPlaylistName( 0, playlistID )
					local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
					local nameModel = Engine.CreateModel( model, "name" )
					Engine.SetModelValue( nameModel, Engine.ToUpper( playlistName ) )
					local kickerText = ""
					local playlistInfo = Engine.GetPlaylistInfoByID( playlistID )
					if playlistInfo and playlistInfo.playlist and playlistInfo.playlist.category and playlistInfo.playlist.category == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
						kickerText = "MENU_RULES_HARDCORE"
					end
					Engine.SetModelValue( Engine.CreateModel( model, "kickerText" ), kickerText )
					Lobby.MapVote.GameLobbyGameServerDataUpdate( data )
				end
			end
		end
		if LobbyVM.DLCMapCheck() == false then
			return 
		end
	end
	local playlistID = Engine.GetPlaylistID()
	local playlistName = Engine.GetPlaylistName( 0, playlistID )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	local nameModel = Engine.CreateModel( model, "name" )
	Engine.SetModelValue( nameModel, Engine.ToUpper( playlistName ) )
	local kickerText = ""
	local playlistInfo = Engine.GetPlaylistInfoByID( playlistID )
	if playlistInfo and playlistInfo.playlist and playlistInfo.playlist.category and playlistInfo.playlist.category == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
		kickerText = "MENU_RULES_HARDCORE"
	end
	Engine.SetModelValue( Engine.CreateModel( model, "kickerText" ), kickerText )
	Lobby.MapVote.GameLobbyGameServerDataUpdate( data )
end

LobbyVM.OnPrivateLobbyServerDataUpdate = function ( data )
	local playlistID = Engine.GetPlaylistID()
	local playlistName = Engine.GetPlaylistName( 0, playlistID )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	local nameModel = Engine.CreateModel( model, "name" )
	Engine.SetModelValue( nameModel, Engine.ToUpper( playlistName ) )
	local kickerText = ""
	local playlistInfo = Engine.GetPlaylistInfoByID( playlistID )
	if playlistInfo and playlistInfo.playlist and playlistInfo.playlist.category and playlistInfo.playlist.category == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
		kickerText = "MENU_RULES_HARDCORE"
	end
	Engine.SetModelValue( Engine.CreateModel( model, "kickerText" ), kickerText )
end

LobbyVM.OnGameLobbyClientDataUpdate = function ( data )
	Lobby.MapVote.GameLobbyClientDataUpdate( data )
	Lobby.TeamSelection.GameLobbyClientDataUpdate( data )
	Lobby.Pregame.GameLobbyClientDataUpdate( data )
	LuaUtils.ForceLobbyButtonUpdate()
	local gameLobbyClientDataUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClientDataUpdate" )
	Engine.ForceNotifyModelSubscriptions( gameLobbyClientDataUpdateModel )
end

LobbyVM.OnDediQosReady = function ()
	local searchType = Lobby.Matchmaking.DatacenterType.ANY
	local dediQoSResults = Engine.GetDediQosResultsByType( searchType )
	if dediQoSResults.numResults == 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Engine told us results were ready, but no results available\n" )
	else
		servers = dediQoSResults.pingResults
		for index, server in ipairs( servers ) do
			LuaUtils.LogQoS( "dediqos", server )
		end
	end
end

LobbyVM.OnPopulateMutableClientDDLBuff = function ( data )
	local controller = data.controller
	local mutableBuff = data.ddlData
end

LobbyVM.OnReceiveMutableClientDDLBuff = function ( data )
	local xuid = data.xuid
	local mutableBuff = data.ddlData
end

LobbyVM.LobbyPumpList = {}
LobbyVM.LobbyPumpList.sequence = 0
LobbyVM.LobbyPumpList.funcs = {
	LobbyVM.ClearLobbyStatus,
	Lobby.Anticheat.Pump,
	Lobby.Debug.Pump,
	Lobby.Hopper.Pump,
	Lobby.MapVote.Pump,
	Lobby.Matchmaking.Pump,
	Lobby.Merge.Pump,
	Lobby.PartyPrivacy.Pump,
	Lobby.Platform.Pump,
	Lobby.Pregame.Pump,
	Lobby.ProcessQueue.Pump,
	Lobby.Scheduler.Pump,
	Lobby.TeamSelection.Pump,
	Lobby.Theater.Pump,
	Lobby.Timer.Pump
}
LobbyVM.OnPump = function ()
	LobbyVM.LobbyPumpList.sequence = math.fmod( LobbyVM.LobbyPumpList.sequence, #LobbyVM.LobbyPumpList.funcs )
	LobbyVM.LobbyPumpList.sequence = LobbyVM.LobbyPumpList.sequence + 1
	LobbyVM.LobbyPumpList.funcs[LobbyVM.LobbyPumpList.sequence]()
	if Lobby.Join.autoJoin.leaveServerImmediately == true then
		Lobby.Join.autoJoin.leaveServerImmediately = false
		if not CoDShared.IsInTheaterLobby() then
			Engine.LeaveServerImmediately()
		end
	end
end

LobbyVM.OnIsFeatureBanned = function ( data )
	local isBanned, featureBan = Lobby.Anticheat.CheckIsFeatureBannedForIndex( data.controller, data.feature )
	return isBanned
end

LobbyVM.OnGetBanTimeRemaining = function ( data )
	return Lobby.Anticheat.OnGetBanTimeRemaining( data )
end

LobbyVM.GetLootItemCategory = function ( itemId )
	local lootTableName = "gamedata/loot/mplootitems.csv"
	local itemIdColumn = 1
	local categoryColumn = 2
	local lootRows = Engine.TableFindRows( lootTableName, itemIdColumn, itemId )
	if lootRows == nil or #lootRows == 0 then
		return -1
	else
		local itemCategory = Engine.TableLookupGetColumnValueForRow( lootTableName, lootRows[1], categoryColumn )
		if itemCategory == nil then
			return -1
		else
			return itemCategory
		end
	end
end

LobbyVM.GetRecentItemTags = function ( controller, category )
	local numItems = Engine.GetLootItemCount( controller, Enum.eModes.MODE_MULTIPLAYER )
	local items = Engine.GetLootItems( controller, Enum.eModes.MODE_MULTIPLAYER, 0, numItems )
	local currentLootVersion = LuaUtils.GetCurrentLootVersion()
	local lootTableName = "gamedata/loot/mplootitems.csv"
	local categoryColumn = 2
	local lootRows = Engine.TableFindRows( lootTableName, categoryColumn, category )
	local versionColumn = 6
	local maxSize = 0
	for i, rowNum in ipairs( lootRows ) do
		local f81_local3 = Engine.TableLookupGetColumnValueForRow( lootTableName, rowNum, versionColumn )
		if f81_local3 == nil or f81_local3 == "" then
			f81_local3 = -1
		else
			f81_local3 = tonumber( f81_local3 )
		end
		if f81_local3 ~= -1 and f81_local3 <= currentLootVersion then
			maxSize = maxSize + 1
		end
	end
	if items == nil then
		return ""
	end
	local recentItems = {}
	for i, item in ipairs( items ) do
		local itemCategory = CoDShared.GetLootItemCategory( item.id )
		local itemVersion = CoDShared.GetLootItemVersion( item.id )
		if itemCategory == category and itemVersion <= currentLootVersion then
			table.insert( recentItems, item.id )
		end
		if maxSize <= #recentItems then
			return ""
		end
	end
	if #recentItems == 0 then
		return ""
	end
	local tagList = ""
	for i, recentItem in ipairs( recentItems ) do
		tagList = tagList .. "[ 203, " .. recentItem .. "]"
		if i < #recentItems then
			tagList = tagList .. " , "
		end
	end
	return tagList
end

LobbyVM.OnBuyCrate = function ( data )
	local supplyDrop = " \"SupplyDropID\": " .. data.crateDWID .. ", "
	local purchaseWith = " \"PurchaseWith\": \"" .. data.currency .. "\", "
	local rank = " \"Rank\": [], "
	local excludeTag = " \"ExcludeTag\": [], "
	local inventoryVersion = " \"InventoryVersion\": [ " .. Dvar.loot_mpItemVersions:get() .. " ] "
	local useHistory = false
	local excludeCategory = ""
	if data.crateDWID == 32 then
		useHistory = true
		excludeCategory = "weapon"
	elseif data.crateDWID == 31 then
		useHistory = true
		excludeCategory = "melee_weapon"
	end
	if useHistory == true then
		local tags = LobbyVM.GetRecentItemTags( data.controller, excludeCategory )
		excludeTag = " \"ExcludeTag\": [ "
		if tags ~= "" then
			excludeTag = excludeTag .. tags
		end
		excludeTag = excludeTag .. " ], "
		Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "Excluding: " .. excludeTag .. ".\n" )
	end
	local result = supplyDrop .. purchaseWith .. rank .. excludeTag .. inventoryVersion
	return result
end

LobbyVM.DLCInfo = {
	{
		dlcIndex = Enum.dlcIndex_t.CONTENT_DLC1_INDEX,
		dlcPackName = "dlc1",
		inventoryVersion = 101
	},
	{
		dlcIndex = Enum.dlcIndex_t.CONTENT_DLC2_INDEX,
		dlcPackName = "dlc2",
		inventoryVersion = 102
	},
	{
		dlcIndex = Enum.dlcIndex_t.CONTENT_DLC3_INDEX,
		dlcPackName = "dlc3",
		inventoryVersion = 103
	},
	{
		dlcIndex = Enum.dlcIndex_t.CONTENT_DLC4_INDEX,
		dlcPackName = "dlc4",
		inventoryVersion = 104
	}
}
LobbyVM.OnSpendVials = function ( data )
	local numVials = " \"NumVials\": " .. data.vialCount .. ", "
	local inventoryVersion = " \"InventoryVersion\": [" .. Dvar.loot_zmItemVersions:get() .. " "
	local highestAvailableDLC = Engine.GetDvarInt( "tu9_highestAvailableDLC" )
	for index, dlcInfo in ipairs( LobbyVM.DLCInfo ) do
		if dlcInfo.dlcIndex <= highestAvailableDLC and Engine.HasEntitlementByOwnership( data.controller, dlcInfo.dlcPackName ) then
			inventoryVersion = inventoryVersion .. ", " .. dlcInfo.inventoryVersion .. " "
		end
	end
	local result = numVials .. inventoryVersion .. "]"
	return result
end

LobbyVM.OnInventoryFetched = function ( data )
	local cwlPacakgeNames = {
		"na_team_mtx",
		"eu_team_mtx",
		"anz_team_mtx",
		"cwl_mtx",
		"cwl_mtx_v2"
	}
	local inventoryItemsTable = "gamedata/tables/common/inventory_items.csv"
	local packageNameColumn = 1
	local packageIdColumn = 2
	local commitNeeded = false
	for _, packageName in ipairs( cwlPacakgeNames ) do
		local skuid = tonumber( Engine.TableLookup( nil, inventoryItemsTable, packageNameColumn, packageName, packageIdColumn ) )
		if Engine.GetInventoryItemQuantity( data.controller, skuid ) > 0 then
			Engine.SetProfileVar( data.controller, packageName, "1" )
			commitNeeded = true
		end
	end
	if commitNeeded then
		Engine.CommitProfileChanges( data.controller )
	end
end

LobbyVM.CheckSpecialPlaylistRules = function ( controller )
	local isPlatformPartyChatNotAllowed = Dvar.partyChatDisallowed:get()
	if isPlatformPartyChatNotAllowed == true then
		if Engine.IsLocalClientInPlatformPartyChat() and not Engine.IsInComError() then
			Dvar.partyChatDisallowed:set( false )
			Engine.ComError( Enum.errorCode.ERROR_DROP, "PLATFORM_PARTYCHATNOTALLOWED" )
		end
		local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		for index, client in ipairs( gamelobby.sessionClients ) do
			if client.isInPlatformPartyChat == true then
				Engine.KickClient( controller, Enum.LobbyType.LOBBY_TYPE_GAME, client.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_NOPARTYCHAT, "PLATFORM_PARTYCHATNOTALLOWED" )
			end
		end
	end
end

LobbyVM.IngameMonitor = function ()
	if not Engine.IsInGame() then
		return 
	elseif (Engine.IsDedicatedServer() or CoDShared.IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_PUBLIC )) and Dvar.partyChatDisallowed:get() and Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local controller = Engine.GetLobbyHostControllerIndex( Enum.LobbyType.LOBBY_TYPE_GAME )
		for index, client in ipairs( gamelobby.sessionClients ) do
			if client.isInPlatformPartyChat == true then
				Engine.KickClient( controller, Enum.LobbyType.LOBBY_TYPE_GAME, client.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_NOPARTYCHAT, "PLATFORM_PARTYCHATNOTALLOWED" )
			end
		end
	end
end

LobbyVM.OnMessageReceived = function ( data )
	if data.msgType == Enum.MsgType.MESSAGE_TYPE_LOBBY_HOST_LOBBY_MOVE then
		LobbyVM.ProcesMoveLobby( data )
	end
end

LobbyVM.ProcesMoveLobby = function ( data )
	local lobbyTypeMoveTo = data.lobbyType
	local lobbyTypeMoveFrom = data.lobbyTypeMoveFrom
	local sourceLobbyType = lobbyTypeMoveFrom
	local targetLobbyType = lobbyTypeMoveTo
	Engine.CopyLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT, sourceLobbyType, targetLobbyType )
	Engine.ClearLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST, targetLobbyType )
	Engine.ClearLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST, sourceLobbyType )
	Engine.ClearLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT, sourceLobbyType )
end

require( "lua.Lobby.LobbyEvents" )
