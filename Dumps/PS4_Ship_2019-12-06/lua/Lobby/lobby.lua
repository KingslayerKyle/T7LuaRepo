require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Shared.LuaUtils" )
require( "lua.Lobby.Leaderboard" )
require( "lua.Lobby.LobbyAnalytics" )
require( "lua.Lobby.LobbyAnticheat" )
require( "lua.Lobby.LobbyDebug" )
require( "lua.Lobby.LobbyHopper" )
require( "lua.Lobby.LobbyMapVote" )
require( "lua.Lobby.LobbyMerge" )
require( "lua.Lobby.LobbyPartyPrivacy" )
require( "lua.Lobby.LobbyPlatform" )
require( "lua.Lobby.LobbyStats" )
require( "lua.Lobby.LobbyTeamSelection" )
require( "lua.Lobby.LobbyTheater" )
require( "lua.Lobby.LobbyTimer" )
require( "lua.Lobby.LobbyEvents" )
require( "lua.Lobby.UserGeneratedContent" )

Util = {
	IsNil = function ( f1_arg0 )
		if f1_arg0 == nil then
			return "true"
		else
			return "false"
		end
	end
}
LobbyVM = {
	AutoJoin = {},
	DevGui = {},
	lobbyStatus = {
		cleared = true,
		clearedTime = 0
	},
	playSoundHistory = {},
	hostLaunch = {},
	clientLaunch = {},
	lobbyMonitor = {}
}
LobbyVM.lobbyMonitor.eventRecorded = false
LobbyVM.DevGui.LaunchGame = function ( f2_arg0, f2_arg1 )
	if f2_arg0 ~= nil then
		Dvar.ui_mapname:set( f2_arg0 )
	end
	if f2_arg1 ~= nil then
		Dvar.ui_gametype:set( f2_arg1 )
	end
	if not Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	else
		Lobby.Timer.Clear( true )
		LobbyVM.LaunchGameExec( Engine.GetPrimaryController(), Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

LobbyVM.DevGui.CustomGameAdvertise = function ()
	if not Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif Engine.GetLobbyUIScreen() ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id then
		return 
	end
	local f3_local0 = false
	local f3_local1 = "off"
	if not Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f3_local0 = true
		f3_local1 = "on"
		Lobby.Matchmaking.SetupAdvertisingCustomMatch()
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Turning session advertisement " .. f3_local1 .. ".\n" )
	Lobby.Matchmaking.SetupMatchmakingQuery( Engine.GetPrimaryController(), Lobby.Matchmaking.SearchMode.PUBLIC )
	Engine.AdvertiseLobby( Lobby.ProcessQueue.INVALID_ACTION_ID, Enum.LobbyType.LOBBY_TYPE_GAME, f3_local0 )
end

LobbyVM.DevGui.LobbyReset = function ()
	LobbyVM.ErrorShutdown( {
		controller = Engine.GetPrimaryController(),
		signoutUsers = false
	} )
end

LobbyVM.PlaySound = function ( f5_arg0, f5_arg1 )
	local f5_local0 = false
	if LobbyVM.playSoundHistory[f5_arg0] == nil then
		f5_local0 = true
	elseif LobbyVM.playSoundHistory[f5_arg0] < Engine.milliseconds() then
		f5_local0 = true
	end
	if f5_local0 == true then
		Engine.PlaySound( f5_arg0 )
		LobbyVM.playSoundHistory[f5_arg0] = Engine.milliseconds() + f5_arg1
	end
end

LobbyVM.ExecuteLobbyVMRequest = function ( f6_arg0 )
	local f6_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyVMRequest" )
	if Engine.GetModelValue( f6_local0 ) == f6_arg0 then
		Engine.ForceNotifyModelSubscriptions( f6_local0 )
	else
		Engine.SetModelValue( f6_local0, f6_arg0 )
	end
end

LobbyVM.ErrorShutdown = function ( f7_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Performing emergency shutdown.\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Close all popups in the lobby.\n" )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
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
	if f7_arg0.signoutUsers ~= nil and f7_arg0.signoutUsers == true then
		Engine.SignOutAllUsers()
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Forcing UI screen.\n" )
	Engine.ForceLobbyUIScreen( LobbyData.UITargets.UI_MAIN.id )
	Engine.LuiVM_Event( "open_main", {} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby emergency shutdown complete.\n" )
end

LobbyVM.ErrorShutdownMessage = function ( f8_arg0, f8_arg1 )
	LobbyVM.ErrorShutdown( {
		controller = f8_arg0,
		signoutUsers = false
	} )
	LuaUtils.UI_ShowErrorMessageDialog( f8_arg0, f8_arg1 )
end

LobbyVM.LogGlobalData = function ()
	local f9_local0 = {
		playlistVersion = Engine.GetPlaylistVersionNumber(),
		protocolVersion = Engine.GetProtocolVersion()
	}
	if Engine.GetDDLVersion ~= nil then
		f9_local0.ffotdVersion = Engine.GetFFOTDVersion()
		f9_local0.mpStatsDDLVersion = Engine.GetDDLVersion( "gamedata/ddl/mp/mp_stats.ddl" )
		f9_local0.mpLoadoutsDDLVersion = Engine.GetDDLVersion( "gamedata/ddl/loadouts/mp_loadouts.ddl" )
		f9_local0.buildCL = Engine.GetBuildIntField( Enum.BuildIntField.BUILD_INTFIELD_CHANGELIST )
		f9_local0.buildMachine = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_MACHINE )
		f9_local0.buildTime = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_TIME )
		f9_local0.buildType = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_TYPE )
		f9_local0.buildName = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_NAME )
	end
	LuaUtils.LogQoS( "global_data", f9_local0 )
end

LobbyVM.OnInit = function ( f10_arg0 )
	Lobby.ProcessQueue.Init()
	Lobby.TeamSelection.Init()
	LobbyData.InitLobbyNav()
	Lobby.Platform.OnInit( f10_arg0 )
	Lobby.Debug.OnInit( f10_arg0 )
	Lobby.Anticheat.OnInit()
end

LobbyVM.OnUILoad = function ( f11_arg0 )
	local f11_local0 = f11_arg0.init
	Lobby.Debug.OnUILoad( f11_arg0 )
	if f11_local0 then
		Lobby.MapVote.Init()
	end
end

LobbyVM.OnSessionStart = function ( f12_arg0 )
	local f12_local0 = f12_arg0.lobbyModule
	local f12_local1 = f12_arg0.lobbyType
	local f12_local2 = f12_arg0.lobbyMode
	Lobby.MapVote.OnSessionStart( f12_arg0 )
	Lobby.PartyPrivacy.OnSessionStart( f12_arg0 )
	Lobby.Theater.OnSessionStart( f12_arg0 )
	Lobby.Timer.OnSessionStart( f12_arg0 )
	Lobby.TeamSelection.OnSessionStart( f12_arg0 )
	Lobby.Platform.OnSessionStart( f12_arg0 )
	Lobby.Debug.OnSessionStart( f12_arg0 )
end

LobbyVM.OnSessionEnd = function ( f13_arg0 )
	local f13_local0 = f13_arg0.lobbyModule
	local f13_local1 = f13_arg0.lobbyType
	local f13_local2 = f13_arg0.lobbyMode
	Lobby.Hopper.OnSessionEnd( f13_arg0 )
	Lobby.TeamSelection.OnSessionEnd( f13_arg0 )
	Lobby.Theater.OnSessionEnd( f13_arg0 )
	Lobby.Timer.OnSessionEnd( f13_arg0 )
	Lobby.MapVote.OnSessionEnd( f13_arg0 )
	Lobby.Platform.OnSessionEnd( f13_arg0 )
	Lobby.Debug.OnSessionEnd( f13_arg0 )
end

LobbyVM.OnClientAdded = function ( f14_arg0 )
	local f14_local0 = f14_arg0.lobbyModule
	local f14_local1 = f14_arg0.lobbyType
	local f14_local2 = f14_arg0.lobbyMode
	local f14_local3 = f14_arg0.xuid
	if f14_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST then
		local f14_local4 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.isHost" ) )
		if f14_local4 and f14_local4 ~= 0 then
			LuaUtils.ForceLobbyButtonUpdate()
		end
	end
	Lobby.Matchmaking.OnClientAdded( f14_arg0 )
	Lobby.TeamSelection.OnClientAdded( f14_arg0 )
	Lobby.Pregame.OnClientAdded( f14_arg0 )
	Lobby.Leaderboard.OnClientAdded( f14_arg0 )
	Engine.QoSProbeListenerUpdate( f14_local1 )
	if f14_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.AddLobbyClientExtracam( f14_arg0.xuid )
	end
	if f14_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( f14_local3 ) and not Engine.IsInGame() then
		LobbyVM.PlaySound( LobbyData.Sounds.ClientsAddedToLobby, 500 )
	end
	if LuaUtils.isPS4 == true and Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() and f14_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT and f14_local1 == Enum.LobbyType.LOBBY_TYPE_PRIVATE and Engine.IsLocalClient( f14_local3 ) and not Engine.IsInGame() then
		local f14_local4 = Engine.GetControllerForXuid( f14_local3 )
		if Engine.NotifyPsPlusAsyncMultiplay ~= nil then
			Engine.NotifyPsPlusAsyncMultiplay( f14_local4 )
		end
	end
	f14_arg0.lobbyID = Engine.GetLobbyLobbyID( f14_local1 )
	LuaUtils.LogQoS( "client_added", f14_arg0 )
end

LobbyVM.OnClientRemoved = function ( f15_arg0 )
	local f15_local0 = f15_arg0.lobbyModule
	local f15_local1 = f15_arg0.lobbyType
	local f15_local2 = f15_arg0.lobbyMode
	local f15_local3 = f15_arg0.xuid
	if f15_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST then
		LuaUtils.ForceLobbyButtonUpdate()
	end
	Lobby.Timer.OnClientRemoved( f15_arg0 )
	Lobby.Pregame.OnClientRemoved( f15_arg0 )
	Lobby.Matchmaking.OnClientRemoved( f15_arg0 )
	Engine.QoSProbeListenerUpdate( f15_local1 )
	if f15_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.RemoveLobbyClientExtracam( f15_arg0.xuid )
	end
	if f15_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( f15_local3 ) and not Engine.IsInGame() then
		LobbyVM.PlaySound( LobbyData.Sounds.ClientsRemovedFromLobby, 500 )
	end
	f15_arg0.lobbyID = Engine.GetLobbyLobbyID( f15_local1 )
	LuaUtils.LogQoS( "client_removed", f15_arg0 )
end

LobbyVM.OnMatchStart = function ( f16_arg0 )
	local f16_local0 = f16_arg0.lobbyModule
	local f16_local1 = f16_arg0.lobbyType
	local f16_local2 = f16_arg0.lobbyMode
	Lobby.Timer.OnMatchStart( f16_arg0 )
	Lobby.Stats.OnMatchStart( f16_arg0 )
	Lobby.Matchmaking.OnMatchStart( f16_arg0 )
	Lobby.Platform.OnMatchStart( f16_arg0 )
	Lobby.Debug.OnMatchStart( f16_arg0 )
	Engine.AllowVoiceChatForAll( Enum.LobbyType.LOBBY_TYPE_GAME )
	LuaUtils.CycleContracts()
	LuaUtils.ValidateBlackjackPurchase()
	LuaUtils.UI_ClearErrorMessageDialog()
end

LobbyVM.OnMatchLaunchClient = function ( f17_arg0 )
	local f17_local0 = f17_arg0.lobbyModule
	local f17_local1 = f17_arg0.lobbyType
	local f17_local2 = f17_arg0.lobbyMode
	Lobby.Stats.OnMatchLaunchClient( f17_arg0 )
	LuaUtils.LogQoS( "match_launch_client", f17_arg0 )
end

LobbyVM.OnMatchChangeMap = function ( f18_arg0 )
	local f18_local0 = f18_arg0.lobbyModule
	local f18_local1 = f18_arg0.lobbyType
	local f18_local2 = f18_arg0.lobbyMode
	Lobby.Stats.OnMatchChangeMap( f18_arg0 )
	Lobby.Matchmaking.OnMatchChangeMap( f18_arg0 )
	LuaUtils.LogQoS( "match_change_map", f18_arg0 )
end

LobbyVM.OnMatchEnd = function ( f19_arg0 )
	local f19_local0 = f19_arg0.lobbyModule
	local f19_local1 = f19_arg0.lobbyType
	local f19_local2 = f19_arg0.lobbyMode
	local f19_local3 = Engine.GetLobbyUIScreen()
	if f19_local3 == LobbyData.UITargets.UI_CPLOBBYLANCUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CPLOBBYLANGAME
		} )
	elseif f19_local3 == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CPLOBBYONLINE
		} )
	elseif f19_local3 == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CPLOBBYONLINE
		} )
	elseif f19_local3 == LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CP2LOBBYLANGAME
		} )
	elseif f19_local3 == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CP2LOBBYONLINE
		} )
	elseif f19_local3 == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CP2LOBBYONLINE
		} )
	elseif f19_local3 == LobbyData.UITargets.UI_DOALOBBYLANCUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_DOALOBBYLANGAME
		} )
	elseif f19_local3 == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_DOALOBBYONLINE
		} )
	end
	Lobby.TeamSelection.OnMatchEnd( f19_arg0 )
	Lobby.Timer.OnMatchEnd( f19_arg0 )
	Lobby.Analytics.OnMatchEnd( f19_arg0 )
	Lobby.Matchmaking.OnMatchEnd( f19_arg0 )
	Lobby.Platform.OnMatchEnd( f19_arg0 )
	Lobby.Debug.OnMatchEnd( f19_arg0 )
	LuaUtils.BuyWeaponContractIfNeededAfterMatch()
	LuaUtils.BuySpecialContractRewardsIfNeededAfterMatch()
	LuaUtils.SaveAfterMatchContractStats()
	LuaUtils.CycleContracts()
	LuaUtils.ResetToLastSelectedSpecialistIfNeededAfterMatch()
end

LobbyVM.OnMatchRecordStart = function ( f20_arg0 )
	LuaUtils.LogQoS( "match_record", f20_arg0 )
end

LobbyVM.ShouldShowContentChangedMessage = function ( f21_arg0, f21_arg1 )
	if LobbyVM.CheckDLCBit( Engine.GetDLCBits(), Engine.GetDLCBitForMapName( Dvar.ui_mapname:get() ) ) then
		return true
	else
		return false
	end
end

LobbyVM.OnDisconnect = function ( f22_arg0 )
	local f22_local0 = f22_arg0.lobbyModule
	local f22_local1 = f22_arg0.lobbyType
	local f22_local2 = f22_arg0.lobbyMode
	local f22_local3 = f22_arg0.disconnectClientXuid
	local f22_local4 = f22_arg0.disconnectClient
	local f22_local5 = Engine.GetPrimaryController()
	local f22_local6 = true
	local f22_local7 = nil
	local f22_local8 = Engine.Localize( "EXE_DISCONNECTED_FROM_SERVER" )
	local f22_local9 = Lobby.Process.Recover( f22_local5 )
	if f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_INVALID then
		
	elseif f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_DROP then
		
	elseif f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_NOPARTYCHAT then
		f22_local6 = false
		f22_local7 = Engine.Localize( "MENU_NOTICE" )
		f22_local8 = Engine.Localize( "PLATFORM_PARTYCHATNOTALLOWED" )
		Dvar.partyChatDisallowed:set( false )
	elseif f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK then
		f22_local6 = false
		f22_local7 = Engine.Localize( "EXE_KICKED_FROM_PARTY_WARNING_TITLE" )
		f22_local8 = Engine.Localize( "EXE_KICKED_FROM_PARTY_WARNING" )
	elseif f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_BADDLC then
		if LobbyVM.ShouldShowContentChangedMessage( f22_local5, f22_local1 ) then
			Engine.ComError( Enum.errorCode.ERROR_DROP, "MENU_NEW_DLC_AVAILABLE" )
		else
			Engine.ComError( Enum.errorCode.ERROR_DROP, "PLATFORM_MISSINGMAP" )
		end
	elseif f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_HOSTRELOAD then
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) and not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			Lobby.ProcessQueue.AddToQueue( "ReloadGameLobby", Lobby.ProcessNavigate.ReloadGameLobby( f22_local5, math.random( Engine.DvarInt( 0, "arena_lobbyReloadSearchDelayMin" ), Engine.DvarInt( 0, "arena_lobbyReloadSearchDelayMax" ) ) ) )
		end
		return 
	elseif f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_ERROR then
		f22_local8 = Engine.Localize( "EXE_DISCONNECTED_FROM_SERVER_ERROR" )
	end
	if f22_local6 == true then
		f22_local9.tail.success = Lobby.Actions.ErrorPopupMsg( f22_local8, f22_local7 )
	else
		f22_local9.tail.success = Lobby.Actions.WarningPopupMsg( f22_local8, f22_local7 )
	end
	Lobby.ProcessQueue.AddToQueue( "DisconnectFromHost", f22_local9 )
end

LobbyVM.OnLobbyOnlineUpdate = function ( f23_arg0 )
	Lobby.Matchmaking.OnLobbyOnlineUpdate( f23_arg0 )
end

LobbyVM.OnLeaveWithParty = function ( f24_arg0 )
	local f24_local0 = f24_arg0.lobbyModule
	local f24_local1 = f24_arg0.lobbyType
	local f24_local2 = f24_arg0.lobbyMode
	LobbyVM.LobbyLeaveWithParty( f24_arg0 )
end

LobbyVM.OnGametypeSettingsChange = function ( f25_arg0 )
	local f25_local0 = f25_arg0.lobbyModule
	local f25_local1 = f25_arg0.lobbyType
	local f25_local2 = f25_arg0.lobbyMode
	Lobby.TeamSelection.OnGametypeSettingsChange( f25_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
end

LobbyVM.OnPartyPrivacyChange = function ( f26_arg0 )
	local f26_local0 = f26_arg0.lobbyType
	local f26_local1 = f26_arg0.partyPrivacy
end

LobbyVM.OnPlatformSessionDataUpdate = function ( f27_arg0 )
	Lobby.Platform.OnPlatformSessionDataUpdate( f27_arg0 )
end

LobbyVM.ComErrorCodeToString = function ( f28_arg0 )
	if f28_arg0 == Enum.errorCode.ERROR_NONE then
		return "ERR_NONE"
	elseif f28_arg0 == Enum.errorCode.ERROR_FATAL then
		return "ERR_FATAL"
	elseif f28_arg0 == Enum.errorCode.ERROR_DROP then
		return "ERR_DROP"
	elseif f28_arg0 == Enum.errorCode.ERROR_FROM_STARTUP then
		return "ERR_FROM_STARTUP"
	elseif f28_arg0 == Enum.errorCode.ERROR_SERVERDISCONNECT then
		return "ERR_SERVERDISCONNECT"
	elseif f28_arg0 == Enum.errorCode.ERROR_DISCONNECT then
		return "ERR_DISCONNECT"
	elseif f28_arg0 == Enum.errorCode.ERROR_SCRIPT then
		return "ERR_SCRIPT"
	elseif f28_arg0 == Enum.errorCode.ERROR_SCRIPT_DROP then
		return "ERR_SCRIPT_DROP"
	elseif f28_arg0 == Enum.errorCode.ERROR_LOCALIZATION then
		return "ERR_LOCALIZATION"
	elseif f28_arg0 == Enum.errorCode.ERROR_UI then
		return "ERR_UI"
	elseif f28_arg0 == Enum.errorCode.ERROR_LUA then
		return "ERR_LUA"
	elseif f28_arg0 == Enum.errorCode.ERROR_SOFTRESTART then
		return "ERR_SOFTRESTART"
	elseif f28_arg0 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
		return "ERR_SOFTRESTART_KEEPDW"
	elseif f28_arg0 == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return "ERR_SOFTRESTART_SILENT"
	else
		return tostring( f28_arg0 )
	end
end

LobbyVM.OnComError = function ( f29_arg0 )
	Lobby.Platform.OnComError( f29_arg0 )
	if f29_arg0.isInCleanup then
		LobbyVM.OnComErrorCleanup( f29_arg0 )
		return 
	end
	local f29_local0 = f29_arg0.controller
	local f29_local1 = f29_arg0.errorCode
	local f29_local2 = f29_arg0.errorMsg
	local f29_local3 = f29_arg0.signoutUsers
	local f29_local4 = f29_arg0.comErrorInProgress
	Lobby.Debug.OnComError( f29_arg0 )
	Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "COM ERROR - errorCode: " .. LobbyVM.ComErrorCodeToString( f29_local1 ) .. ", errorMsg: " .. f29_local2 .. ".\n" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	LuaUtils.LogQoS( "lobby_error", f29_arg0 )
	if f29_local1 == Enum.errorCode.ERROR_SOFTRESTART or f29_local1 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW or f29_local1 == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and not Engine.IsSignedInToDemonware( f29_local0 ) then
		LobbyVM.ErrorShutdown( f29_arg0 )
	end
	if f29_local1 == Enum.errorCode.ERROR_DROP then
		Lobby.Stats.OnServerTimeout( f29_local0 )
	end
	if f29_local1 == Enum.errorCode.ERROR_UI or f29_local1 == Enum.errorCode.ERROR_DISCONNECT or f29_local1 == Enum.errorCode.ERROR_FATAL or f29_local1 == Enum.errorCode.ERROR_DROP or f29_local1 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW or f29_local1 == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return 
	elseif f29_local1 == Enum.errorCode.ERROR_NONE or f29_local1 == Enum.errorCode.ERROR_LUA or f29_local1 == Enum.errorCode.ERROR_FROM_STARTUP or f29_local1 == Enum.errorCode.ERROR_LOCALIZATION or f29_local1 == Enum.errorCode.ERROR_SERVERDISCONNECT then
		LuaUtils.UI_ShowErrorMessageDialog( f29_local0, f29_local2 )
		return 
	elseif f29_local1 == Enum.errorCode.ERROR_SCRIPT or f29_local1 == Enum.errorCode.ERROR_SCRIPT_DROP then
		LuaUtils.UI_ShowErrorMessageDialog( f29_local0, f29_local2 )
		Lobby.ProcessQueue.AddToQueue( "ErrorNonFatal", Lobby.Process.NonFatalError( f29_local2 ) )
		return 
	end
	error( "LobbyVM.OnError - Unhandled COM_ERROR: " .. LobbyVM.ComErrorCodeToString( f29_local1 ) .. ", Message: " .. f29_local2 .. ".\n" )
end

LobbyVM.ShutdownCleanupMP = function ( f30_arg0 )
	
end

LobbyVM.ShutdownCleanupZM = function ( f31_arg0 )
	
end

LobbyVM.ShutdownCleanupCP = function ( f32_arg0 )
	
end

LobbyVM.ShutdownCleanup = function ( f33_arg0 )
	Dvar.ui_gametype:set( "" )
	Dvar.ui_mapname:set( "" )
	LobbyVM.ShutdownCleanupCP( f33_arg0 )
	LobbyVM.ShutdownCleanupMP( f33_arg0 )
	LobbyVM.ShutdownCleanupZM( f33_arg0 )
end

LobbyVM.OnComErrorCleanup = function ( f34_arg0 )
	local f34_local0 = f34_arg0.controller
	local f34_local1 = f34_arg0.errorCode
	local f34_local2 = f34_arg0.errorMsg
	local f34_local3 = f34_arg0.errorShutdown
	Engine.LobbyLaunchClear()
	if f34_local3 ~= nil and f34_local3 == true then
		LobbyVM.ErrorShutdown( f34_arg0 )
		LobbyVM.ShutdownCleanup( f34_arg0 )
	end
	if f34_local1 == Enum.errorCode.ERROR_FATAL then
		LuaUtils.UI_ShowErrorMessageDialog( f34_local0, f34_local2 )
		local f34_local4 = Lobby.Process.Recover( f34_local0 )
		if f34_local4 ~= nil then
			Lobby.ProcessQueue.AddToQueue( "ErrorFatal", f34_local4 )
		end
	elseif f34_local1 == Enum.errorCode.ERROR_DROP then
		local f34_local4 = Lobby.Process.Recover( f34_local0 )
		if f34_local4 then
			local f34_local5 = Lobby.Actions.ErrorPopupMsg( f34_local2 )
			Lobby.Process.AddActions( f34_local4.tail, f34_local5, f34_local5, f34_local5 )
			Lobby.ProcessQueue.AddToQueue( "ERROR_DROP", f34_local4 )
		else
			LuaUtils.UI_ShowErrorMessageDialog( f34_local0, f34_local2 )
		end
	elseif f34_local1 == 1026 then
		Lobby.ProcessQueue.ClearQueue()
		LuaUtils.UI_ShowErrorMessageDialog( f34_local0, f34_local2 )
	elseif f34_local1 == 2050 then
		if string.len( f34_local2 ) > 0 then
			LuaUtils.UI_ShowErrorMessageDialog( f34_local0, f34_local2 )
		end
	elseif f34_local1 == 4098 and string.len( f34_local2 ) > 0 then
		LuaUtils.UI_ShowInfoMessageDialog( f34_local0, f34_local2 )
	end
end

LobbyVM.OnErrorShutdown = function ( f35_arg0 )
	LobbyVM.ErrorShutdown( f35_arg0 )
end

LobbyVM.OnStorageRead = function ( f36_arg0 )
	if f36_arg0.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", f36_arg0 )
	elseif f36_arg0.fileType == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		Lobby.Stats.OnMPOnlineStatsDownloaded( f36_arg0.controller )
	elseif f36_arg0.fileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		Lobby.Stats.ValidateLoadouts( f36_arg0.controller )
	elseif f36_arg0.fileType == Enum.StorageFileType.STORAGE_MP_CLASS_SETS then
		Lobby.Stats.ValidateLoadouts( f36_arg0.controller )
	elseif f36_arg0.fileType == Enum.StorageFileType.STORAGE_COMMON_SETTINGS then
		Lobby.Stats.OnProfileCommonStatsDownloaded( f36_arg0.controller )
	elseif f36_arg0.fileType == Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE then
		Lobby.Stats.OnZMOnlineStatsDownloaded( f36_arg0.controller )
	end
end

LobbyVM.OnStorageWrite = function ( f37_arg0 )
	if f37_arg0.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", f37_arg0 )
	elseif f37_arg0.fileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		Lobby.Stats.ValidateLoadouts( f37_arg0.controller )
	elseif f37_arg0.fileType == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		Lobby.Stats.ValidateLoadouts( f37_arg0.controller )
		Lobby.Stats.OnMPStatsUploaded( f37_arg0.controller )
	end
end

LobbyVM.OnStorageWriteDispatch = function ( f38_arg0 )
	local f38_local0 = f38_arg0.controller
end

LobbyVM.OnRecordComScoreEvent = function ( f39_arg0 )
	local f39_local0 = f39_arg0.controller
	local f39_local1 = f39_arg0.eventCategoryName
	local f39_local2 = {}
	for f39_local6, f39_local7 in pairs( f39_arg0.EventParams ) do
		table.insert( f39_local2, f39_local6 )
		table.insert( f39_local2, f39_local7 )
	end
	if #f39_local2 > 0 and #f39_local2 % 2 == 0 then
		Engine.RecordComScoreEvent( f39_local0, f39_local1, unpack( f39_local2 ) )
	end
end

LobbyVM.OnKVSFlush = function ()
	LobbyVM.LogGlobalData()
end

LobbyVM.OnPreExecFFOTD = function ()
	Lobby.Platform.OnPreExecFFOTD()
	local f41_local0 = {
		controller = Engine.GetPrimaryController(),
		signoutUsers = false
	}
	local f41_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.FFOTDShutdown" )
	Engine.SetModelValue( f41_local1, true )
	LobbyVM.ErrorShutdown( f41_local0 )
	Engine.SetModelValue( f41_local1, false )
end

LobbyVM.OnPostExecFFOTD = function ()
	LobbyVM.LogGlobalData()
	Lobby.Platform.OnPostExecFFOTD()
end

LobbyVM.OnDWDisconnect = function ( f43_arg0 )
	if not Engine.IsDedicatedServer() and f43_arg0.controller == Engine.GetPrimaryController() then
		Engine.LobbyOnlineCancel( true )
	end
end

LobbyVM.DemoEndFinished = function ( f44_arg0 )
	if LobbyVM.AutoJoin.data ~= nil then
		local f44_local0 = nil
		if LobbyVM.AutoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				if LobbyVM.AutoJoin.data.playTogether == true then
					recoverProcess = Lobby.Process.Recover( controller, LobbyData.UITargets.UI_MODESELECT.id )
					f44_local0 = Lobby.Platform.PS4ProcessPlayTogetherEvent( LobbyVM.AutoJoin.data.platformData )
				else
					f44_local0 = Lobby.Platform.InGamePlatformJoinOrbis( LobbyVM.AutoJoin.data.platformData )
				end
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				f44_local0 = Lobby.Platform.InGamePlatformJoinDurango( LobbyVM.AutoJoin.data.platformData )
			end
		else
			f44_local0 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		end
		if f44_local0 ~= nil then
			Lobby.ProcessQueue.AddToQueue( "DemoEnd", f44_local0 )
		end
		LobbyVM.AutoJoin.data = nil
	end
end

LobbyVM.OnLimitedItemPromoUpdate = function ( f45_arg0 )
	local f45_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "LimitedItemPromo" ), "itemCount" )
	local f45_local1 = f45_arg0.count
	local f45_local2 = Engine.DvarInt( nil, "loot_limitedItemPromo_override_count" )
	if f45_local2 > -1 then
		f45_local1 = f45_local2
	end
	Engine.SetModelValue( f45_local0, f45_arg0.count )
end

LobbyVM.Gunsmith = {}
LobbyVM.Gunsmith.InitializeBuffer = function ( f46_arg0 )
	local f46_local0 = #f46_arg0.variant
	for f46_local1 = 0, f46_local0 - 1, 1 do
		local f46_local4 = f46_arg0.variant[f46_local1]
		f46_local4.variantIndex:set( f46_local1 )
		f46_local4.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f46_local4.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

LobbyVM.Gunsmith.ClearBuffer = function ( f47_arg0 )
	local f47_local0 = #f47_arg0.variant
	for f47_local1 = 0, f47_local0 - 1, 1 do
		local f47_local4 = f47_arg0.variant[f47_local1]
		f47_local4.variantName:set( "" )
		local f47_local5 = #f47_local4.attachment
		for f47_local6 = 0, f47_local5 - 1, 1 do
			f47_local4.attachment[f47_local6]:set( 0 )
		end
		local f47_local6 = #f47_local4.attachmentVariant
		for f47_local7 = 0, f47_local6 - 1, 1 do
			f47_local4.attachmentVariant[f47_local7]:set( 0 )
		end
		f47_local4.reticleIndex:set( 0 )
		f47_local4.camoIndex:set( 0 )
		f47_local4.paintjobSlot:set( 0 )
		f47_local4.paintjobIndex:set( 0 )
		f47_local4.weaponIndex:set( 0 )
		f47_local4.variantIndex:set( 0 )
		f47_local4.sortIndex:set( 0 )
		f47_local4.readOnly:set( 0 )
		f47_local4.createTime:set( 0 )
	end
end

LobbyVM.InitilizeGunsmithBuffer = function ( f48_arg0 )
	local f48_local0 = f48_arg0.controller
	Engine.StorageReset( f48_local0, Enum.StorageFileType.STORAGE_GUNSMITH )
	LobbyVM.Gunsmith.InitializeBuffer( Engine.StorageGetBuffer( f48_local0, Enum.StorageFileType.STORAGE_GUNSMITH ) )
	Engine.StorageWrite( f48_local0, Enum.StorageFileType.STORAGE_GUNSMITH )
end

LobbyVM.InitilizeZMLoadoutBuffer = function ( f49_arg0 )
	local f49_local0 = Engine.StorageGetBuffer( f49_arg0.controller, f49_arg0.storageFileType )
	if f49_local0 then
		local f49_local1 = f49_local0.cacLoadouts
		if f49_local1 then
			LobbyVM.Gunsmith.ClearBuffer( f49_local1 )
			LobbyVM.Gunsmith.InitializeBuffer( f49_local1 )
		end
	end
end

LobbyVM.OnInitializeStats = function ( f50_arg0 )
	local f50_local0 = f50_arg0.controller
	local f50_local1 = f50_arg0.storageFileType
	if f50_local1 == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		local f50_local2 = Engine.StorageGetBuffer( f50_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		f50_local2 = f50_local2.itemStats
		if f50_local2 then
			for f50_local3 = 1, 255, 1 do
				if Engine.ItemIndexValid( f50_local3, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemUnlockLevel( f50_local3, Enum.eModes.MODE_MULTIPLAYER ) == 0 and not Engine.ItemIndexIsBlackMarket( f50_local3, Enum.eModes.MODE_MULTIPLAYER ) then
					f50_local2[f50_local3].markedOld:set( 1 )
				end
				f50_local2[f50_local3].attachmentMarkedOld.gmod6:set( 1 )
				f50_local2[f50_local3].attachmentMarkedOld.gmod7:set( 1 )
			end
		end
	elseif f50_local1 == Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE then
		local f50_local2 = Engine.StorageGetBuffer( f50_local0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		f50_local2 = f50_local2.itemStats
		if f50_local2 then
			for f50_local3 = 1, 255, 1 do
				if Engine.ItemIndexValid( f50_local3, Enum.eModes.MODE_ZOMBIES ) and Engine.GetItemUnlockLevel( f50_local3, Enum.eModes.MODE_ZOMBIES ) == 0 and Engine.GetDLCNameForItem( f50_local3, Enum.eModes.MODE_ZOMBIES ) == nil then
					f50_local2[f50_local3].markedOld:set( 1 )
				end
			end
		end
	end
end

LobbyVM.SetDefaultShowcaseWeapon = function ( f51_arg0, f51_arg1 )
	local f51_local0 = Engine.GetItemIndexFromReference( "ar_standard", f51_arg1 )
	for f51_local1 = 0, #f51_arg0.characters - 1, 1 do
		local f51_local4 = f51_arg0.characters[f51_local1].showcaseWeapon
		f51_local4.weaponIndex:set( f51_local0 )
		f51_local4.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f51_local4.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

LobbyVM.OnInitializeLoadouts = function ( f52_arg0 )
	local f52_local0 = f52_arg0.controller
	local f52_local1 = f52_arg0.storageFileType
	local f52_local2 = f52_arg0.statsNetworkType
	if f52_local1 == Enum.StorageFileType.STORAGE_ZM_LOADOUTS then
		local f52_local3 = Engine.StorageGetBuffer( f52_local0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		f52_local3 = f52_local3.cacLoadouts
		LobbyVM.Gunsmith.InitializeBuffer( f52_local3 )
		f52_local3.characterContext.characterIndex:set( 6 )
		LobbyVM.SetDefaultShowcaseWeapon( f52_local3, Enum.eModes.MODE_ZOMBIES )
	elseif f52_local1 == Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE then
		local f52_local3 = Engine.StorageGetBuffer( f52_local0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
		f52_local3 = f52_local3.cacLoadouts
		LobbyVM.Gunsmith.InitializeBuffer( f52_local3 )
		f52_local3.characterContext.characterIndex:set( 6 )
		LobbyVM.SetDefaultShowcaseWeapon( f52_local3, Enum.eModes.MODE_ZOMBIES )
	elseif f52_local1 == Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE then
		local f52_local3 = Engine.StorageGetBuffer( f52_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
		f52_local3 = f52_local3.cacLoadouts
		LobbyVM.SetDefaultShowcaseWeapon( f52_local3, Enum.eModes.MODE_MULTIPLAYER )
		local f52_local4 = Engine.GetEquippedHeroForCACType( f52_local0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_OFFLINE )
		if f52_local4 then
			local f52_local5 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f52_local4, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if f52_local3 and f52_local3.heroweapon then
				f52_local3.heroweapon:set( f52_local5 )
			end
		end
	elseif f52_local1 == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		local f52_local3 = Engine.StorageGetBuffer( f52_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f52_local3 = f52_local3.cacLoadouts
		local f52_local4 = Engine.StorageGetBuffer( f52_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f52_local4 = f52_local4.customMatchCacLoadouts
		local f52_local5 = Engine.StorageGetBuffer( f52_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f52_local5 = f52_local5.leagueCacLoadouts
		LobbyVM.SetDefaultShowcaseWeapon( f52_local3, Enum.eModes.MODE_MULTIPLAYER )
		LobbyVM.SetDefaultShowcaseWeapon( f52_local4, Enum.eModes.MODE_MULTIPLAYER )
		LobbyVM.SetDefaultShowcaseWeapon( f52_local5, Enum.eModes.MODE_MULTIPLAYER )
		local f52_local6 = Engine.GetEquippedHeroForCACType( f52_local0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC )
		if f52_local6 then
			local f52_local7 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f52_local6, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if f52_local3 and f52_local3.heroweapon then
				f52_local3.heroweapon:set( f52_local7 )
			end
			if f52_local4 and f52_local4.heroweapon then
				f52_local4.heroweapon:set( f52_local7 )
			end
		end
		if f52_local3 then
			local f52_local8 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
			for f52_local9 = 0, #f52_local8 - 1, 1 do
				if f52_local3.characters[f52_local9].itemList then
					f52_local3.characters[f52_local9].itemList.body.items[0].markedOld:set( 1 )
					f52_local3.characters[f52_local9].itemList.helmet.items[0].markedOld:set( 1 )
				end
				if f52_local3.characters[f52_local9].tauntMarkedOld and f52_local3.characters[f52_local9].tauntMarkedOld.first_place and f52_local3.characters[f52_local9].tauntMarkedOld.first_place.markedOld then
					f52_local3.characters[f52_local9].tauntMarkedOld.first_place.markedOld[0]:set( 1 )
				end
			end
		end
	elseif f52_local1 == Enum.StorageFileType.STORAGE_CP_LOADOUTS then
		local f52_local3 = Engine.StorageGetBuffer( f52_local0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
		f52_local3 = f52_local3.cacLoadouts
		LobbyVM.SetDefaultShowcaseWeapon( f52_local3, Enum.eModes.MODE_CAMPAIGN )
		if f52_local3 then
			local f52_local5 = Engine.GetHeroList( Enum.eModes.MODE_CAMPAIGN )
			for f52_local6 = 0, #f52_local5 - 1, 1 do
				if f52_local3.characters[f52_local6].itemList then
					f52_local3.characters[f52_local6].itemList.body.items[0].markedOld:set( 1 )
					f52_local3.characters[f52_local6].itemList.helmet.items[0].markedOld:set( 1 )
					f52_local3.characters[f52_local6].itemList.helmet.items[1].markedOld:set( 1 )
				end
			end
		end
	elseif f52_local1 == Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE then
		local f52_local3 = Engine.StorageGetBuffer( f52_local0, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
		LobbyVM.SetDefaultShowcaseWeapon( f52_local3.cacLoadouts, Enum.eModes.MODE_CAMPAIGN )
	end
end

LobbyVM.LobbyHostLeftNoMigration = function ( f53_arg0 )
	local f53_local0 = f53_arg0.controller
	local f53_local1 = f53_arg0.lobbyType
	local f53_local2 = f53_arg0.lobbyMainMode
	local f53_local3 = f53_arg0.lobbyNetworkMode
	local f53_local4 = f53_arg0.maxClients
	local f53_local5 = f53_arg0.isGameLobbyActive
	local f53_local6 = f53_arg0.isPrivateHost
	if not LobbyVM.CanClientLaunch( false ) then
		return 
	elseif Engine.IsLobbyInRecovery( f53_local1 ) then
		return 
	elseif f53_local5 == true and f53_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		if Lobby.ProcessQueue.GetCurrentRunningProcessName() ~= "HostLeftNoMigrationGame" then
			Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigrationGame", Lobby.Process.Recover( f53_local0 ) )
		end
	else
		Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigration", Lobby.Process.HostLeftNoMigrationCreatePrivateLobby( f53_local0, f53_local2, f53_local4 ) )
	end
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "host_left_no_migration", f53_arg0 )
end

LobbyVM.LobbyHostLeft_InGameMigrateFinished = function ( f54_arg0 )
	local f54_local0 = f54_arg0.controller
	local f54_local1 = Lobby.Process.Recover( f54_local0 )
	if LobbyVM.AutoJoin.data ~= nil then
		local f54_local2 = nil
		if LobbyVM.AutoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				if LobbyVM.AutoJoin.data.playTogether == true then
					f54_local1 = Lobby.Process.Recover( f54_local0, LobbyData.UITargets.UI_MODESELECT.id )
					f54_local2 = Lobby.Platform.PS4ProcessPlayTogetherEvent( LobbyVM.AutoJoin.data.platformData )
				else
					f54_local2 = Lobby.Platform.InGamePlatformJoinOrbis( LobbyVM.AutoJoin.data.platformData )
				end
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				f54_local2 = Lobby.Platform.InGamePlatformJoinDurango( LobbyVM.AutoJoin.data.platformData )
			end
		else
			f54_local2 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		end
		if f54_local2 ~= nil then
			Lobby.Process.AppendProcess( f54_local1, f54_local2 )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyHostLeft_InGameMigrateFinished", f54_local1 )
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "ingame_migrate_finished", f54_arg0 )
end

LobbyVM.LobbyClientLeftEvent = function ( f55_arg0 )
	local f55_local0 = f55_arg0.controller
	local f55_local1 = f55_arg0.lobbyType
	local f55_local2 = f55_arg0.lobbyMainMode
	local f55_local3 = f55_arg0.lobbyNetworkMode
	local f55_local4 = f55_arg0.maxClients
	local f55_local5 = Lobby.Process.Recover( f55_local0 )
	if LobbyVM.AutoJoin.data ~= nil then
		local f55_local6 = nil
		if LobbyVM.AutoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				if LobbyVM.AutoJoin.data.playTogether == true then
					f55_local5 = Lobby.Process.Recover( f55_local0, LobbyData.UITargets.UI_MODESELECT.id )
					f55_local6 = Lobby.Platform.PS4ProcessPlayTogetherEvent( LobbyVM.AutoJoin.data.platformData )
				else
					f55_local6 = Lobby.Platform.InGamePlatformJoinOrbis( LobbyVM.AutoJoin.data.platformData )
				end
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				f55_local6 = Lobby.Platform.InGamePlatformJoinDurango( LobbyVM.AutoJoin.data.platformData )
			end
		else
			f55_local6 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		end
		if f55_local6 ~= nil then
			Lobby.Process.AppendProcess( f55_local5, f55_local6 )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyClientLeft", f55_local5 )
end

LobbyVM.Devmap = function ( f56_arg0 )
	Lobby.ProcessQueue.AddToQueue( "Devmap", Lobby.Process.Devmap( f56_arg0.controller, f56_arg0.mainMode ) )
end

LobbyVM.DevmapClient = function ( f57_arg0 )
	Lobby.ProcessQueue.AddToQueue( "DevmapClient", Lobby.Process.DevmapClient( f57_arg0.controller ) )
end

LobbyVM.MatchmakingPriorityQuit = function ( f58_arg0 )
	local f58_local0 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f58_local0.id == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f58_local0.id == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id then
		Lobby.MatchmakingPriority.AddHost( f58_arg0.hostSecId, Enum.JoinType.JOIN_TYPE_PLAYLIST )
	end
end

LobbyVM.NetworkModeChanged = function ( f59_arg0 )
	Lobby.ProcessQueue.AddToQueue( "NetworkModeChanged", Lobby.Process.ReloadPrivateLobby( f59_arg0.controller, f59_arg0.networkMode ) )
end

LobbyVM.GoForward = function ( f60_arg0 )
	if LobbyVM.IsHostLaunching() then
		return 
	end
	local f60_local0 = Engine.GetPrimaryController()
	local f60_local1 = f60_arg0.navToMenu
	local f60_local2 = f60_arg0.withParty
	local f60_local3 = f60_arg0.disbandParty
	local f60_local4 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	local f60_local5 = LobbyData:UITargetFromName( f60_local1 )
	if f60_local4 == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if f60_local5 == nil then
		error( "LobbyVM: No menu called '" .. f60_local1 .. "' found." )
	end
	local f60_local6 = Lobby.Process.GetForwardFunc( f60_local4, f60_local5 )
	if f60_local6 == nil then
		error( "LobbyVM: No forward process function found to move from '" .. f60_local4.name .. "' to '" .. f60_local1 .. "'." )
	end
	local f60_local7 = f60_local6( f60_local0, f60_local4, f60_local5 )
	if f60_local7 ~= nil and f60_local3 == true then
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
			local f60_local8 = Lobby.Process.ManagePartyLeave( f60_local0 )
			Lobby.Process.AppendProcess( f60_local8, f60_local7 )
			Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f60_local4.name .. "' menu to '" .. f60_local5.name .. "' menu AND ManagePartyLeave", f60_local8 )
		else
			local f60_local8 = Lobby.Process.ReloadPrivateLobby( f60_local0, Engine.GetLobbyNetworkMode() )
			Lobby.Process.AppendProcess( f60_local8, f60_local7 )
			Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f60_local4.name .. "' menu to '" .. f60_local5.name .. "' menu AND PartyMemberLeave", f60_local8 )
		end
		return 
	end
	Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f60_local4.name .. "' menu to '" .. f60_local5.name .. "' menu.", f60_local7 )
end

LobbyVM.GoBack = function ( f61_arg0 )
	if LobbyVM.IsHostLaunching() then
		return 
	end
	local f61_local0 = Engine.GetPrimaryController()
	local f61_local1 = f61_arg0.withParty
	local f61_local2 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f61_local2 == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	local f61_local3, f61_local4 = Lobby.Process.GetBackFunc( f61_local2 )
	if f61_local3 == nil or f61_local4 == nil then
		error( "LobbyVM: No back process function found for '" .. currentMenu( "'." ) )
	end
	Lobby.ProcessQueue.AddToQueue( "GoBackFrom" .. f61_local2.name, f61_local4( f61_local0, f61_local2, f61_local3, f61_local1 ) )
end

LobbyVM.ManagePartyLeave = function ( f62_arg0 )
	if LobbyVM.IsHostLaunching() then
		return 
	end
	local f62_local0 = f62_arg0.controller
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
		Lobby.ProcessQueue.AddToQueue( "ManagePartyLeave", Lobby.Process.ManagePartyLeave( f62_local0 ) )
	else
		Lobby.ProcessQueue.AddToQueue( "PartyMemberLeave", Lobby.Process.ReloadPrivateLobby( f62_local0, Engine.GetLobbyNetworkMode() ) )
	end
end

LobbyVM.InGameJoin = function ( f63_arg0, f63_arg1 )
	LobbyVM.AutoJoin.data = f63_arg0
	if f63_arg0.migrating ~= nil and f63_arg0.migrating == false and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
		if f63_arg1 == true then
			LobbyVM.AutoJoin.leaveServerImmediately = true
			return 
		elseif not LobbyVM.IsInTheaterLobby() then
			Engine.LeaveServerImmediately()
		end
	end
end

LobbyVM.GetJoinProcess = function ( f64_arg0 )
	local f64_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f64_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.LobbyIsPlayerInLobby( f64_local0, f64_arg0.xuid ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of\n" )
		return nil
	elseif Engine.IsCpStillDownloading() or Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Cannot process a join when the game is still being installed.\n" )
		return nil
	else
		return Lobby.Process.Join( f64_arg0.controller, f64_arg0.xuid, f64_arg0.joinType, LuaEnums.LEAVE_WITH_PARTY.WITH )
	end
end

LobbyVM.Join = function ( f65_arg0 )
	local f65_local0 = LobbyVM.GetJoinProcess( f65_arg0 )
	if f65_local0 ~= nil then
		Lobby.ProcessQueue.AddToQueue( "Join", f65_local0 )
	end
end

LobbyVM.OnJoinComplete = function ( f66_arg0 )
	Lobby.Matchmaking.OnJoinComplete( f66_arg0 )
	Lobby.Debug.OnJoinComplete( f66_arg0 )
end

LobbyVM.JoinSystemlink = function ( f67_arg0 )
	Lobby.ProcessQueue.AddToQueue( "JoinSystemLink", Lobby.Process.JoinSystemlink( f67_arg0.controller, f67_arg0.lobbyMainMode, f67_arg0.lobbyNetworkMode, f67_arg0.hostXuid, f67_arg0.hostInfo ) )
end

LobbyVM.CreateDedicatedLANLobby = function ()
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLANLobby", Lobby.Process.CreateDedicatedLANLobby( 0, LobbyData.UITargets.UI_MPLOBBYLANGAME ) )
end

LobbyVM.CreateDedicatedLobby = function ( f69_arg0 )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLobby", Lobby.Process.CreateDedicatedLobby( 0, LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME ) )
end

LobbyVM.ForceToMenu = function ( f70_arg0 )
	Lobby.ProcessQueue.AddToQueue( "ForceToMenu", Lobby.Process.ForceToMenu( f70_arg0.controller, LobbyData:UITargetFromName( f70_arg0.menuName ), f70_arg0.msg ) )
end

LobbyVM.LobbyClientPromoteToHost = function ( f71_arg0 )
	Lobby.ProcessQueue.AddToQueue( "PromoteClientToHost", Lobby.Process.PromoteClientToHost( f71_arg0.controller, f71_arg0.lobbyMainMode, f71_arg0.lobbyType, f71_arg0.lobbyMode, f71_arg0.maxClients, f71_arg0.hostInfo, f71_arg0.isAdvertised, f71_arg0.isInGame, f71_arg0.newMigrateIndex ) )
end

LobbyVM.LobbyLeaveWithParty = function ( f72_arg0 )
	local f72_local0 = Lobby.Process.LeaveWithParty( f72_arg0.lobbyModule, f72_arg0.lobbyType, f72_arg0.lobbyMode )
	if f72_local0 == nil then
		return 
	else
		Lobby.ProcessQueue.AddToQueue( "LeaveWithParty", f72_local0 )
	end
end

LobbyVM.CanLobbyCanMigrate = function ( f73_arg0 )
	local f73_local0 = f73_arg0.lobbyType
	local f73_local1 = f73_arg0.lobbyMode
	if f73_local1 == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		return false
	elseif f73_local1 == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return false
	elseif Engine.IsLobbyInRecovery ~= nil and Engine.IsLobbyInRecovery( f73_local0 ) then
		return false
	else
		return true
	end
end

LobbyVM.LobbyLocalClientLeave = function ( f74_arg0 )
	if not Lobby.ProcessQueue.IsQueueEmpty() then
		return false
	else
		local f74_local0 = Lobby.Process.LocalClientLeave( f74_arg0.controller, f74_arg0.xuid )
		if f74_local0 == nil then
			return false
		else
			Lobby.ProcessQueue.AddToQueue( "LobbyLocalClientLeave", f74_local0 )
			return true
		end
	end
end

LobbyVM.SetMaxLocalPlayers = function ( f75_arg0 )
	Dvar.lobby_maxLocalPlayers:set( math.min( f75_arg0.maxLocalClients, Engine.GetMaxLocalControllers() ) )
end

LobbyVM.LobbySettings = function ( f76_arg0 )
	local f76_local0 = f76_arg0.controller
	local f76_local1 = f76_arg0.toTarget
	local f76_local2 = f76_arg0.skipSwitchMode
	local f76_local3 = f76_arg0.isDevMap
	if type( f76_local1 ) == "number" then
		f76_local1 = LobbyData:UITargetFromId( f76_local1 )
	end
	if f76_local1 == nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Tried to apply settings for an invalid target.\n" )
		return 
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Applying settings for menu: " .. f76_local1.name .. ".\n" )
	if not f76_local2 then
		local f76_local4 = Engine.GetLobbyMainMode()
		local f76_local5 = f76_local1.mainMode
		if Engine.SwitchCampaignMode then
			if f76_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				if LuaUtils.IsCPZMTarget( f76_local1.id ) then
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES )
				else
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
				end
			else
				Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
			end
		end
		if f76_local4 ~= f76_local5 then
			if f76_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				Engine.SwitchMode( f76_local0, "mp" )
			elseif f76_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				Engine.SwitchMode( f76_local0, "cp" )
			elseif f76_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
				Engine.SwitchMode( f76_local0, "zm" )
			else
				Engine.SwitchMode( f76_local0, "" )
			end
		end
	end
	if f76_local3 ~= true and f76_local1.eGameModes == Enum.eGameModes.MODE_GAME_INVALID then
		Engine.ResetGametypeSettings()
	end
	LobbyVM.SetMaxLocalPlayers( f76_local1 )
	Engine.SetLobbyMode( f76_local1.lobbyType, f76_local1.lobbyMode )
	Engine.TEMPGameModeSetMode( f76_local1.eGameModes )
end

LobbyVM.UpdateUI = function ( f77_arg0 )
	local f77_local0 = f77_arg0.toTarget
	local f77_local1 = f77_arg0.controller
	if type( f77_local0 ) == "number" then
		f77_local0 = LobbyData:UITargetFromId( f77_local0 )
	end
	local f77_local2 = function ( f78_arg0 )
		if f78_arg0 == "auto" then
			return "room2"
		else
			return f78_arg0
		end
	end
	
	LobbyData.SetLobbyNav( f77_local0 )
	Engine.SetLobbyUIScreen( f77_local0.id )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMode", true ), f77_local0.lobbyMode )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode", true ), f77_local0.mainMode )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode", true ), f77_local0.eGameModes )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room", true ), f77_local2( f77_local0.room ) )
end

LobbyVM.Leaderboard_PopulateCustomList = function ( f79_arg0 )
	return Lobby.Leaderboard.PopulateCustomList( f79_arg0 )
end

LobbyVM.Leaderboard_CalculateLBColValue = function ( f80_arg0 )
	return Lobby.Leaderboard.CalculateLBColValue( f80_arg0 )
end

LobbyVM.OnShouldWriteLeaderboard = function ( f81_arg0 )
	return Lobby.Leaderboard.OnShouldWriteLeaderboard( f81_arg0 )
end

LobbyVM.CheckDLCBit = function ( f82_arg0, f82_arg1 )
	if Engine.DvarInt( nil, "ui_freeDLC1" ) == 1 then
		f82_arg0 = f82_arg0 | Enum.ContentFlagBits.CONTENT_DLC1
	end
	return f82_arg0 & f82_arg1 == f82_arg1
end

LobbyVM.LaunchGameExec = function ( f83_arg0, f83_arg1 )
	if f83_arg1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch game not supported for this lobby type(" .. f83_arg1 .. ")\n" )
		return false
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		local f83_local0 = Dvar.ui_mapname:get()
		local f83_local1 = Dvar.ui_gametype:get()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching game... **\n" )
		Engine.Exec( f83_arg0, "lobbyLaunchGame " .. f83_arg1 .. " " .. f83_local0 .. " " .. f83_local1 )
		return true
	else
		local f83_local0 = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch game. Lobby process '" .. f83_local0.name .. "' in progress.\n" )
		return false
	end
end

LobbyVM.LaunchDemoExec = function ( f84_arg0, f84_arg1 )
	if f84_arg1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch demo not supported for this lobby type(" .. f84_arg1 .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching demo... **\n" )
		Engine.Exec( f84_arg0, "lobbyLaunchDemo" )
		LuaUtils.UI_ClearErrorMessageDialog()
	else
		local f84_local0 = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch damo. Lobby process '" .. f84_local0.name .. "' in progress.\n" )
	end
end

LobbyVM.HostLaunchInit = function ()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	LobbyVM.hostLaunch = {}
	LobbyVM.hostLaunch.fadeToBlack = false
	local f85_local0 = Engine.milliseconds()
	LobbyVM.hostLaunch.startTime = f85_local0
	LobbyVM.hostLaunch.fadeToBlackTime = f85_local0 + Dvar.lobbyLaunch_fadeToBlackDelay:get()
	LobbyVM.hostLaunch.launchTime = f85_local0 + Dvar.lobbyLaunch_gameLaunchDelay:get()
	LobbyVM.hostLaunch.waitForClientAckTime = f85_local0 + Dvar.lobbyLaunch_waitForClientAckDelay:get()
	Lobby.Timer.ResetUIModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	return true
end

LobbyVM.HostLaunchPump = function ( f86_arg0 )
	local f86_local0 = Engine.GetLobbyUIScreen()
	if f86_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
		local f86_local1 = false
		if Dvar.tu9_hostLaunchCheckMinPlayer:get() == true then
			local f86_local2 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL )
			if f86_local2 < Dvar.party_minplayers:get() then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyVM.LaunchGameExec: Not enough players (" .. tostring( f86_local2 ) .. "/" .. tostring( Dvar.party_minplayers:get() ) .. "), restart timer.\n" )
				f86_local1 = true
			end
		end
		if Dvar.tu9_hostLaunchCheckUnbalancedTeams:get() == true and true == CoDShared.IsGametypeTeamBased() then
			local f86_local2 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			if f86_local2 ~= nil then
				local f86_local3 = 0
				local f86_local4 = 0
				for f86_local8, f86_local9 in ipairs( f86_local2.sessionClients ) do
					if f86_local9.team == Enum.team_t.TEAM_ALLIES then
						f86_local3 = f86_local3 + 1
					end
					if f86_local9.team == Enum.team_t.TEAM_AXIS then
						f86_local4 = f86_local4 + 1
					end
				end
				if math.abs( f86_local3 - f86_local4 ) > 1 then
					Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyVM.LaunchGameExec: Teams are not balanced (teamAlliesCount: " .. tostring( f86_local3 ) .. "/teamAxisCount: " .. tostring( f86_local4 ) .. "), restart timer.\n" )
					f86_local1 = true
				end
			end
		end
		if f86_local1 == true then
			Engine.LobbyLaunchClear()
			LobbyVM.HostLaunchClear()
			local f86_local2 = LobbyData:UITargetFromId( f86_local0 )
			Lobby.Timer.HostingLobby( {
				controller = Engine.GetPrimaryController(),
				lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
				mainMode = f86_local2.mainMode,
				lobbyTimerType = f86_local2.lobbyTimerType,
				matchEnded = true,
				status = Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED
			} )
			return false
		end
	end
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ) ) == false then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	end
	if Engine.DvarBool( nil, "ffotdtempfixHostLaunchPump" ) then
		if not Engine.IsDedicatedServer() then
			if LobbyVM.hostLaunch.fadeToBlack == false and nil ~= LobbyVM.hostLaunch.fadeToBlackTime and Engine.milliseconds() > LobbyVM.hostLaunch.fadeToBlackTime then
				LobbyVM.hostLaunch.fadeToBlack = true
				Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 1 )
			end
			if nil ~= LobbyVM.hostLaunch.launchTime and Engine.milliseconds() < LobbyVM.hostLaunch.launchTime then
				return false
			end
		end
	elseif not Engine.IsDedicatedServer() then
		if LobbyVM.hostLaunch.fadeToBlack == false and Engine.milliseconds() > LobbyVM.hostLaunch.fadeToBlackTime then
			LobbyVM.hostLaunch.fadeToBlack = true
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 1 )
		end
		if nil ~= LobbyVM.hostLaunch.launchTime and Engine.milliseconds() < LobbyVM.hostLaunch.launchTime then
			return false
		end
	end
	if Engine.IsWaitingForDatabase and Engine.IsWaitingForDatabase() then
		return false
	elseif not f86_arg0.hasAllClientsGotLatestStateMsg or Engine.milliseconds() < LobbyVM.hostLaunch.waitForClientAckTime then
		return false
	elseif not Engine.IsDedicatedServer() then
		if Engine.IsWaitingForDatabase() then
			return false
		elseif Engine.IsCommonFastFileLoaded and not Engine.IsCommonFastFileLoaded() then
			return false
		end
	end
	return true
end

LobbyVM.HostLaunchClear = function ()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	LobbyVM.hostLaunch.startTime = nil
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
end

LobbyVM.IsHostLaunching = function ()
	if LobbyVM.hostLaunch.startTime ~= nil then
		return true
	elseif Engine.LobbyHostLaunchTaskInProgress and Engine.LobbyHostLaunchTaskInProgress() then
		return true
	else
		return false
	end
end

LobbyVM.HostLaunch = function ( f89_arg0 )
	if f89_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.HostLaunchInit()
	elseif f89_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.HostLaunchPump( f89_arg0 )
	else
		LobbyVM.HostLaunchClear()
	end
end

LobbyVM.GetNeededDLCBits = function ()
	local f90_local0 = Engine.GetLobbyUIScreen()
	if f90_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id or f90_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f90_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
		return Lobby.Matchmaking.GetMapPackBits( Engine.GetDLCBitsForLobby( Enum.LobbyType.LOBBY_TYPE_GAME ), Engine.GetPlaylistID() )
	elseif f90_local0 == LobbyData.UITargets.UI_MODESELECT.id or f90_local0 == LobbyData.UITargets.UI_MPLOBBYMAIN.id or f90_local0 == LobbyData.UITargets.UI_MPLOBBYONLINE.id or f90_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id or f90_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		return 0
	end
	local f90_local1 = Dvar.ui_mapname:get()
	if f90_local1 == nil or f90_local1 == "" or f90_local1 == "mp_array" then
		f90_local1 = Engine.GetCurrentMap()
	end
	return Engine.GetDLCBitForMapName( f90_local1 )
end

LobbyVM.DLCMapCheck = function ()
	local f91_local0 = Dvar.ui_mapname:get()
	local f91_local1 = Engine.GetDLCBits()
	local f91_local2 = LobbyVM.GetNeededDLCBits()
	if not LobbyVM.CheckDLCBit( f91_local1, f91_local2 ) then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYCLIENT, "Leaving game because map '" .. f91_local0 .. "' is in contentpack '" .. f91_local2 .. "' but our dlcbits is '" .. f91_local1 .. "'.\n" )
		local f91_local3 = Engine.GetPrimaryController()
		local f91_local4 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
		local f91_local5 = Lobby.Process.ReloadPrivateLobby( f91_local3, Engine.GetLobbyNetworkMode() )
		local f91_local6 = Lobby.Actions.LobbySettings( f91_local3, LobbyData.UITargets.UI_MODESELECT )
		local f91_local7 = Lobby.Actions.UpdateUI( f91_local3, LobbyData.UITargets.UI_MODESELECT )
		local f91_local8 = Lobby.Actions.ErrorPopupMsg( "PLATFORM_MISSINGMAP" )
		Lobby.Process.ForceAction( f91_local4, f91_local5.tail )
		Lobby.Process.ForceAction( f91_local5.tail, f91_local6 )
		Lobby.Process.ForceAction( f91_local6, f91_local7 )
		Lobby.Process.ForceAction( f91_local7, f91_local8 )
		Lobby.ProcessQueue.AddToQueue( "MissingMap", f91_local5 )
		return false
	else
		return true
	end
end

LobbyVM.CanClientLaunch = function ( f92_arg0 )
	if LobbyVM.DLCMapCheck() == false then
		Engine.LobbyLaunchClear()
		return false
	else
		return true
	end
end

LobbyVM.ClientLaunchInit = function ( f93_arg0 )
	if not LobbyVM.CanClientLaunch( f93_arg0 ) then
		return false
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	LobbyVM.clientLaunch = {}
	LobbyVM.clientLaunch.fadeToBlack = false
	local f93_local0 = Dvar.lobbyLaunch_fadeToBlackDelay:get()
	local f93_local1 = Dvar.lobbyLaunch_gameLaunchDelay:get()
	if f93_arg0 then
		f93_local0 = Dvar.lobbyLaunch_fadeToBlackDelayOnConnect:get()
		f93_local1 = Dvar.lobbyLaunch_gameLaunchDelayOnConnect:get()
	end
	local f93_local2 = Engine.milliseconds()
	LobbyVM.clientLaunch.startTime = f93_local2
	LobbyVM.clientLaunch.fadeToBlackTime = f93_local2 + f93_local0
	LobbyVM.clientLaunch.launchTime = f93_local2 + f93_local1
	Lobby.Timer.ResetUIModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	return true
end

LobbyVM.ClientLaunchPump = function ()
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ) ) == false then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	end
	if false == LobbyVM.clientLaunch.fadeToBlack and Engine.milliseconds() > LobbyVM.clientLaunch.fadeToBlackTime then
		LobbyVM.clientLaunch.fadeToBlack = true
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 1 )
	end
	if Engine.IsWaitingForDatabase and Engine.IsWaitingForDatabase() then
		return false
	elseif Engine.milliseconds() < LobbyVM.clientLaunch.launchTime then
		return false
	elseif Engine.IsWaitingForDatabase() then
		return false
	elseif Engine.IsCommonFastFileLoaded and not Engine.IsCommonFastFileLoaded() then
		return false
	else
		return true
	end
end

LobbyVM.ClientLaunchClear = function ()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
end

LobbyVM.ClientLaunch = function ( f96_arg0 )
	if f96_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.ClientLaunchInit( f96_arg0.justConnected )
	elseif f96_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.ClientLaunchPump()
	else
		LobbyVM.ClientLaunchClear()
	end
end

LobbyVM.LaunchGame = function ( f97_arg0 )
	Lobby.Timer.LaunchGame( f97_arg0 )
end

LobbyVM.LaunchDemo = function ( f98_arg0 )
	Lobby.Timer.LaunchGame( f98_arg0 )
end

LobbyVM.UpdateLobbyStatusInfo = function ( f99_arg0 )
	Lobby.Timer.UpdateLobbyStatusInfo( f99_arg0 )
	Lobby.Pregame.UpdateLobbyStatusInfo( f99_arg0 )
end

LobbyVM.OnClientSelectionReceived = function ( f100_arg0 )
	Lobby.Pregame.OnClientSelectionReceived( f100_arg0 )
end

LobbyVM.LobbyHost_ClientSelectionReceived = function ( f101_arg0 )
	Lobby.Pregame.OnClientSelectionReceived( f101_arg0 )
end

LobbyVM.SwitchTeam = function ( f102_arg0 )
	Lobby.TeamSelection.SwitchTeam( f102_arg0 )
end

LobbyVM.GameModeChanged = function ( f103_arg0 )
	Lobby.TeamSelection.GameModeChanged( f103_arg0 )
end

LobbyVM.OnJoinPartyPrivacyCheck = function ( f104_arg0 )
	return Lobby.PartyPrivacy.OnJoinPartyPrivacyCheck( f104_arg0 )
end

LobbyVM.OnCanFitLobbys = function ( f105_arg0 )
	return Lobby.TeamSelection.OnCanFitLobbys( f105_arg0 )
end

LobbyVM.OnCanBroadcastHostInfo = function ( f106_arg0 )
	local f106_local0 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f106_local0.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f106_local0.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
		return false
	else
		return true
	end
end

LobbyVM.OnUpdateAdvertising = function ( f107_arg0 )
	if f107_arg0.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.Matchmaking.UpdateAdvertising( "force update from code" )
	end
end

LobbyVM.UGCOffensiveEmblemAdd = function ( f108_arg0 )
	Lobby.UGC.OffensiveEmblemAdd( f108_arg0 )
end

LobbyVM.OnPlatformJoin = function ( f109_arg0 )
	Lobby.Platform.OnPlatformJoin( f109_arg0 )
end

LobbyVM.Invite = function ( f110_arg0 )
	Lobby.Platform.Invite( f110_arg0 )
end

LobbyVM.OnPlatformSessionMultiplayerSubscriptionLost = function ( f111_arg0 )
	Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost( f111_arg0 )
end

LobbyVM.OnPlatformSessionMultiplayerSessionChanged = function ( f112_arg0 )
	Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged( f112_arg0 )
end

LobbyVM.OnPlatformSuspend = function ( f113_arg0 )
	Lobby.Platform.OnPlatformSuspend( f113_arg0 )
end

LobbyVM.OnPlatformResume = function ( f114_arg0 )
	Lobby.Platform.OnPlatformResume( f114_arg0 )
end

LobbyVM.OnPlatformPlayTogether = function ( f115_arg0 )
	Lobby.Platform.OnPlatformPlayTogether( f115_arg0 )
end

LobbyVM.SessionSQJRefreshInfo = function ( f116_arg0 )
	Lobby.Debug.SessionSQJRefreshInfo()
end

LobbyVM.StopLobbyTimer = function ( f117_arg0 )
	Lobby.Timer.HostingLobbyEnd( f117_arg0 )
end

LobbyVM.ChangeSigninState = function ( f118_arg0 )
	local f118_local0 = nil
	if f118_arg0.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_OUT then
		Lobby.Anticheat.OnControllerSignedOut( f118_arg0.controller )
		if f118_arg0.isPrimary then
			f118_local0 = Lobby.Process.PrimaryControllerSignedOut( f118_arg0.controller )
		end
	elseif f118_arg0.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_IN then
		if f118_arg0.isPrimary then
			f118_local0 = Lobby.Process.PrimaryControllerSignedIn( f118_arg0.controller )
		end
	else
		DebugPrint( "Warning unknown signin State [" .. f118_arg0.onlineState .. "]" )
	end
	if f118_local0 ~= nil then
		Lobby.ProcessQueue.AddToQueue( "ChangeSignInState", f118_local0 )
	end
end

LobbyVM.JoinResultToString = function ( f119_arg0, f119_arg1 )
	local f119_local0 = {
		debug = "",
		errorMsg = ""
	}
	if f119_arg1 == true then
		f119_local0.debug = "Enum.JoinResult.JOIN_RESULT_"
	end
	if f119_arg0 == Enum.JoinResult.JOIN_RESULT_INVALID then
		f119_local0.debug = f119_local0.debug .. "INVALID"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		f119_local0.debug = f119_local0.debug .. "SUCCESS"
		f119_local0.errorMsg = ""
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_CONNECT_TO_HOST_FAILURE then
		f119_local0.debug = f119_local0.debug .. "CONNECT_TO_HOST_FAILURE"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_SEND_FAILURE then
		f119_local0.debug = f119_local0.debug .. "PROBE_SEND_FAILURE"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_TIMEOUT then
		f119_local0.debug = f119_local0.debug .. "PROBE_TIMEOUT"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_LOBBY then
		f119_local0.debug = f119_local0.debug .. "PROBE_INVALID_LOBBY"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_INFO then
		f119_local0.debug = f119_local0.debug .. "PROBE_INVALID_INFO"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_RESULT_INVALID then
		f119_local0.debug = f119_local0.debug .. "PROBE_RESULT_INVALID"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_INVALID_LOBBY then
		f119_local0.debug = f119_local0.debug .. "INVALID_LOBBY"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_SEND_AGREEMENT_REQUEST_FAILED then
		f119_local0.debug = f119_local0.debug .. "SEND_AGREEMENT_REQUEST_FAILED"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED then
		f119_local0.debug = f119_local0.debug .. "JOIN_DISABLED"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_JOIN_ALREADY_IN_PROGRESS then
		f119_local0.debug = f119_local0.debug .. "JOIN_ALREADY_IN_PROGRESS"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_CLOSED then
		f119_local0.debug = f119_local0.debug .. "NOT_JOINABLE_CLOSED"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_CLOSED"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY then
		f119_local0.debug = f119_local0.debug .. "NOT_JOINABLE_INVITE_ONLY"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY then
		f119_local0.debug = f119_local0.debug .. "NOT_JOINABLE_FRIENDS_ONLY"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_SOLO_MODE then
		f119_local0.debug = f119_local0.debug .. "NOT_JOINABLE_SOLO_MODE"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_SOLO_MODE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_OVER_MAX_PARTY_LIMIT then
		f119_local0.debug = f119_local0.debug .. "OVER_MAX_PARTY_LIMIT"
		f119_local0.errorMsg = "EXE_TO_MANY_LOCAL_PLAYERS"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_NO_PARTIES then
		f119_local0.debug = f119_local0.debug .. "NO_PARTIES"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_ALREADY_IN_PROGRESS"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_LOBBY_FULL then
		f119_local0.debug = f119_local0.debug .. "LOBBY_FULL"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_LOBBY_FULL"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_NETWORK_MODE_MISMATCH then
		f119_local0.debug = f119_local0.debug .. "NETWORK_MODE_MISMATCH"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NETWORK_MODE_MISMATCH"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLISTID then
		f119_local0.debug = f119_local0.debug .. "MISMATCH_PLAYLISTID"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLISTID"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW then
		f119_local0.debug = f119_local0.debug .. "MISMATCH_PLAYLIST_VERSION_TO_NEW"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD then
		f119_local0.debug = f119_local0.debug .. "MISMATCH_PLAYLIST_VERSION_TO_OLD"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PROTOCOL_VERSION then
		f119_local0.debug = f119_local0.debug .. "MISMATCH_PROTOCOL_VERSION"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PROTOCOL_VERSION"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM then
		f119_local0.debug = f119_local0.debug .. "MISMATCH_NETFIELD_CHECKSUM"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_NEW then
		f119_local0.debug = f119_local0.debug .. "MISMATCH_FFOTD_VERSION_TO_NEW"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_OLD then
		f119_local0.debug = f119_local0.debug .. "MISMATCH_FFOTD_VERSION_TO_OLD"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_MIGRATE_IN_PROGRESS then
		f119_local0.debug = f119_local0.debug .. "MIGRATE_IN_PROGRESS"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MIGRATE_IN_PROGRESS"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_COULD_NOT_RESERVE then
		f119_local0.debug = f119_local0.debug .. "COULD_NOT_RESERVE"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_COULD_NOT_RESERVE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_HANDSHAKE_WINDOW_EXPIRED then
		f119_local0.debug = f119_local0.debug .. "HANDSHAKE_WINDOW_EXPIRED"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_AGREEMENT_WINDOW_EXPIRED then
		f119_local0.debug = f119_local0.debug .. "AGREEMENT_WINDOW_EXPIRED"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_NOT_IDLE then
		f119_local0.debug = f119_local0.debug .. "NOT_JOINABLE_NOT_IDLE"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS then
		f119_local0.debug = f119_local0.debug .. "NO_JOIN_IN_PROGRESS"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_GAME_PAUSED then
		f119_local0.debug = f119_local0.debug .. "GAME_PAUSED"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_PAUSED"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED then
		f119_local0.debug = f119_local0.debug .. "CHUNK_MP_REQUIRED"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MP_REQUIRED"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED then
		f119_local0.debug = f119_local0.debug .. "CHUNK_ZM_REQUIRED"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_ZM_REQUIRED"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED then
		f119_local0.debug = f119_local0.debug .. "CHUNK_CP_REQUIRED"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_CP_REQUIRED"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED_HOST then
		f119_local0.debug = f119_local0.debug .. "CHUNK_MP_REQUIRED_HOST"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_MP_REQUIRED_HOST"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED_HOST then
		f119_local0.debug = f119_local0.debug .. "CHUNK_ZM_REQUIRED_HOST"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_ZM_REQUIRED_HOST"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED_HOST then
		f119_local0.debug = f119_local0.debug .. "CHUNK_CP_REQUIRED_HOST"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_CP_REQUIRED_HOST"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED then
		f119_local0.debug = f119_local0.debug .. "JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED"
		f119_local0.errorMsg = "MENU_SPLITSCREEN_NOT_ALLOWED"
	elseif Engine.DvarBool( 0, "probation_public_enabled" ) and f119_arg0 == Enum.JoinResult.JOIN_RESULT_IN_PUBLIC_PROBATION then
		f119_local0.debug = f119_local0.debug .. "JOIN_RESULT_IN_PUBLIC_PROBATION"
		f119_local0.errorMsg = "MENU_JOIN_DENIED_PUBLIC_PROBATION"
	elseif Engine.DvarBool( 0, "probation_league_enabled" ) and f119_arg0 == Enum.JoinResult.JOIN_RESULT_IN_ARENA_PROBATION then
		f119_local0.debug = f119_local0.debug .. "JOIN_RESULT_IN_ARENA_PROBATION"
		f119_local0.errorMsg = "MENU_JOIN_DENIED_ARENA_PROBATION"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_BAD_DLC_BITS then
		f119_local0.debug = f119_local0.debug .. "JOIN_RESULT_BAD_DLC_BITS"
		f119_local0.errorMsg = "PLATFORM_MISSINGMAP"
	elseif f119_arg0 == Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1 then
		f119_local0.debug = f119_local0.debug .. "JOIN_RESULT_VM_FAILURE_1"
		f119_local0.errorMsg = "EXE_HOSTUNREACH_TOO_MANY_JOINS"
	else
		f119_local0.debug = f119_local0.debug .. "UNHANDLED JOINRESULT ENUM(" .. tostring( f119_arg0 ) .. ")"
		f119_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	end
	return f119_local0
end

LobbyVM.ClearLobbyStatus = function ()
	if LobbyVM.lobbyStatus.cleared == true then
		return 
	elseif LobbyVM.lobbyStatus.clearedTime > Engine.milliseconds() then
		return 
	else
		LobbyVM.lobbyStatus.cleared = true
		local f120_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local f120_local1 = Engine.CreateModel( f120_local0, "lobbyStatusString1" )
		local f120_local2 = Engine.CreateModel( f120_local0, "lobbyStatusString2" )
		local f120_local3 = Engine.CreateModel( f120_local0, "lobbyStatusString3" )
		Engine.SetModelValue( f120_local1, "" )
		Engine.SetModelValue( f120_local2, "" )
		Engine.SetModelValue( f120_local3, "" )
	end
end

LobbyVM.LobbyStatusUpdate = function ( f121_arg0 )
	if not Engine.IsMainThreadOrProxy() then
		return 
	end
	local f121_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local f121_local1 = Engine.CreateModel( f121_local0, "lobbyStatusString1" )
	local f121_local2 = Engine.CreateModel( f121_local0, "lobbyStatusString2" )
	local f121_local3 = Engine.CreateModel( f121_local0, "lobbyStatusString3" )
	LobbyVM.lobbyStatus.cleared = false
	LobbyVM.lobbyStatus.clearedTime = Engine.milliseconds() + 10000
	local f121_local4 = f121_arg0.searchStage
	local f121_local5 = ""
	if f121_local4 == 1 then
		local f121_local6 = f121_arg0.numResults
		if f121_local6 == 1 then
			f121_local5 = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE_SINGLE" )
		else
			f121_local5 = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE", f121_local6 )
		end
		Engine.SetModelValue( f121_local1, f121_local5 )
		Engine.SetModelValue( f121_local2, "" )
		Engine.SetModelValue( f121_local3, "" )
	elseif f121_local4 == 2 then
		Engine.SetModelValue( f121_local2, Engine.Localize( "MENU_SESSIONS_QOS_PROGRESS", f121_arg0.contactedResults, f121_arg0.numResults ) )
	elseif f121_local4 == 3 then
		Engine.SetModelValue( f121_local3, Engine.Localize( "MENU_SESSIONS_JOINING", f121_arg0.joiningCurHost, f121_arg0.joiningNumHosts ) )
	end
end

LobbyVM.DoChunksAllowJoin = function ( f122_arg0, f122_arg1 )
	if f122_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		if not f122_arg0.chunkMP then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED
		elseif Engine.IsMpStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED_HOST
		end
	elseif f122_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		if not f122_arg0.chunkZM then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED
		elseif Engine.IsZmStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED_HOST
		end
	elseif f122_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if not f122_arg0.chunkCP then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED
		elseif Engine.IsCpStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED_HOST
		end
	end
	return Enum.JoinResult.JOIN_RESULT_SUCCESS
end

LobbyVM.IsInTheaterLobby = function ()
	local f123_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if f123_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return true
	else
		return false
	end
end

LobbyVM.JoinableCheck = function ( f124_arg0 )
	local f124_local0 = f124_arg0.joinRequest
	local f124_local1 = f124_arg0.joinResponse
	local f124_local2 = LobbyData.GetCurrentMenuTarget()
	if Engine.IsDedicatedServer() == false and Engine.IsProcessingJoin() == true and f124_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and (f124_local2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC or f124_local2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA) then
		if f124_local2.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP and Engine.DvarBool( nil, "cpProcessingJoinCheck" ) then
			return Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1
		elseif f124_local2.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP and Engine.DvarBool( nil, "mpProcessingJoinCheck" ) then
			return Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1
		elseif f124_local2.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM and Engine.DvarBool( nil, "zmProcessingJoinCheck" ) then
			return Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1
		end
	end
	if Engine.IsInGame() or LobbyVM.IsHostLaunching() or Engine.GetCurrentMap() ~= "core_frontend" or Engine.SessionMode_IsPublicOnlineGame() then
		local f124_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f124_local4 = LobbyVM.GetNeededDLCBits()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Incoming client dlc bits are " .. f124_local0.dlcBits .. " while our needed bits are " .. f124_local4 .. "\n" )
		if not LobbyVM.CheckDLCBit( f124_local0.dlcBits, f124_local4 ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Rejecting client due to incompatible dlc bits.\n" )
			return Enum.JoinResult.JOIN_RESULT_BAD_DLC_BITS
		end
	end
	if f124_local1.response == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		if Engine.IsMultiplayerGame() then
			if LuaUtils.IsArenaMode() then
				if ((Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1) or Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1) and Engine.IsInGame() and Engine.SessionMode_IsPublicOnlineGame() then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				elseif f124_arg0.joinRequest.splitscreenClients ~= nil and f124_arg0.joinRequest.splitscreenClients > 0 then
					return Enum.JoinResult.JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED
				elseif Lobby.Timer.LobbyIsLocked() then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				elseif Engine.GetLobbyPregameState() ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				end
				local f124_local5 = Lobby.Timer.GetTimerStatus()
				if f124_local5 == Lobby.Timer.LOBBY_STATUS.POST_GAME or f124_local5 == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				elseif Engine.DvarBool( 0, "probation_league_enabled" ) and f124_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
					for f124_local9, f124_local10 in pairs( f124_local0.members ) do
						if f124_local10.arenaProbation > 0 then
							return Enum.JoinResult.JOIN_RESULT_IN_ARENA_PROBATION
						end
					end
				end
			elseif Engine.DvarBool( 0, "probation_public_enabled" ) and f124_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
				for f124_local5, f124_local6 in pairs( f124_local0.members ) do
					if f124_local6.publicProbation > 0 then
						return Enum.JoinResult.JOIN_RESULT_IN_PUBLIC_PROBATION
					end
				end
			end
		end
		if Engine.IsZombiesGame() then
			local f124_local3 = false
			if Dvar.zm_private_rankedmatch:get() then
				f124_local3 = true
			end
			if LobbyVM.IsInTheaterLobby() then
				return Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED
			elseif LobbyData.UITargets.UI_ZMLOBBYONLINE.id == Engine.GetLobbyUIScreen() and (Engine.IsInGame() or LobbyVM.IsHostLaunching() or Engine.GetCurrentMap() ~= "core_frontend") then
				return Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_SOLO_MODE
			elseif (Engine.IsInGame() or LobbyVM.IsHostLaunching()) and Engine.SessionMode_IsOnlineGame() and f124_local3 then
				return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
			elseif (Engine.IsInGame() or LobbyVM.IsHostLaunching()) and Engine.SessionMode_IsPublicOnlineGame() then
				return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
			end
		end
		local f124_local3 = Engine.GetLobbyMainMode()
		if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
			if not f124_arg0.isLocalRequest then
				if f124_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
					local f124_local4 = LobbyVM.DoChunksAllowJoin( f124_local0, f124_local3 )
					if f124_local4 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
						return f124_local4
					end
				elseif f124_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
					for f124_local4 = 0, Enum.LobbyMainMode.LOBBY_MAINMODE_COUNT - 1, 1 do
						local f124_local7 = LobbyVM.DoChunksAllowJoin( f124_local0, f124_local4 )
						if f124_local7 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
							return f124_local7
						end
					end
				end
			end
		elseif not f124_arg0.isLocalRequest then
			local f124_local4 = LobbyVM.DoChunksAllowJoin( f124_local0, f124_local3 )
			if f124_local4 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
				return f124_local4
			end
		end
	end
	return f124_local1.response
end

LobbyVM.ProcessCompleteSuccess = function ( f125_arg0 )
	Lobby.ProcessQueue.Success( f125_arg0 )
end

LobbyVM.ProcessCompleteFailure = function ( f126_arg0 )
	Lobby.ProcessQueue.Failure( f126_arg0 )
end

LobbyVM.ProcessCompleteError = function ( f127_arg0 )
	Lobby.ProcessQueue.Error( f127_arg0 )
end

LobbyVM.ProcessUpdate = function ( f128_arg0 )
	Lobby.ProcessQueue.Update( f128_arg0 )
end

LobbyVM.GameLobbyGameServerDataUpdate = function ( f129_arg0 )
	if Lobby.ProcessQueue.IsQueueEmpty() == true then
		local f129_local0 = Engine.GetLobbyUIScreen()
		if (f129_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id or f129_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f129_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id) and LobbyVM.DLCMapCheck() == false then
			return 
		end
	end
	local f129_local0 = Engine.GetPlaylistID()
	local f129_local1 = Engine.GetPlaylistName( 0, f129_local0 )
	local f129_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	Engine.SetModelValue( Engine.CreateModel( f129_local2, "name" ), Engine.ToUpper( f129_local1 ) )
	local f129_local3 = ""
	local f129_local4 = Engine.GetPlaylistInfoByID( f129_local0 )
	if f129_local4 and f129_local4.playlist and f129_local4.playlist.category and f129_local4.playlist.category == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
		f129_local3 = "MENU_RULES_HARDCORE"
	end
	Engine.SetModelValue( Engine.CreateModel( f129_local2, "kickerText" ), f129_local3 )
	Lobby.MapVote.GameLobbyGameServerDataUpdate( f129_arg0 )
end

LobbyVM.PrivateLobbyServerDataUpdate = function ( f130_arg0 )
	local f130_local0 = Engine.GetPlaylistID()
	local f130_local1 = Engine.GetPlaylistName( 0, f130_local0 )
	local f130_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	Engine.SetModelValue( Engine.CreateModel( f130_local2, "name" ), Engine.ToUpper( f130_local1 ) )
	local f130_local3 = ""
	local f130_local4 = Engine.GetPlaylistInfoByID( f130_local0 )
	if f130_local4 and f130_local4.playlist and f130_local4.playlist.category and f130_local4.playlist.category == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
		f130_local3 = "MENU_RULES_HARDCORE"
	end
	Engine.SetModelValue( Engine.CreateModel( f130_local2, "kickerText" ), f130_local3 )
end

LobbyVM.GameLobbyClientDataUpdate = function ( f131_arg0 )
	Lobby.MapVote.GameLobbyClientDataUpdate( f131_arg0 )
	Lobby.TeamSelection.GameLobbyClientDataUpdate( f131_arg0 )
	Lobby.Pregame.GameLobbyClientDataUpdate( f131_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClientDataUpdate" ) )
end

LobbyVM.HopperClientJoin = function ( f132_arg0 )
	return Lobby.Hopper.ClientJoin( f132_arg0 )
end

LobbyVM.HopperIsParked = function ()
	return Lobby.Hopper.IsParked()
end

LobbyVM.GetMatchmakingExperimentActive = function ( f134_arg0 )
	return Lobby.Matchmaking.IsExperimentActive( f134_arg0 )
end

LobbyVM.OnExperimentReset = function ( f135_arg0 )
	Lobby.Matchmaking.ResetExperiment( f135_arg0.controller )
end

LobbyVM.OnDediQosReady = function ()
	local f136_local0 = Engine.GetDediQosResultsByType( Lobby.Matchmaking.DatacenterType.ANY )
	if f136_local0.numResults == 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Engine told us results were ready, but no results available\n" )
	else
		servers = f136_local0.pingResults
		for f136_local4, f136_local5 in ipairs( servers ) do
			LuaUtils.LogQoS( "dediqos", f136_local5 )
		end
	end
end

LobbyVM.PopulateMutableClientDDLBuff = function ( f137_arg0 )
	local f137_local0 = f137_arg0.controller
	local f137_local1 = f137_arg0.ddlData
end

LobbyVM.ReceiveMutableClientDDLBuff = function ( f138_arg0 )
	local f138_local0 = f138_arg0.xuid
	local f138_local1 = f138_arg0.ddlData
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
	Lobby.Platform.Pump,
	Lobby.PartyPrivacy.Pump,
	Lobby.Pregame.Pump,
	Lobby.ProcessQueue.Pump,
	Lobby.TeamSelection.Pump,
	Lobby.Theater.Pump,
	Lobby.Timer.Pump,
	Lobby.Events.Pump
}
LobbyVM.Pump = function ()
	LobbyVM.LobbyPumpList.sequence = math.fmod( LobbyVM.LobbyPumpList.sequence, #LobbyVM.LobbyPumpList.funcs )
	LobbyVM.LobbyPumpList.sequence = LobbyVM.LobbyPumpList.sequence + 1
	LobbyVM.LobbyPumpList.funcs[LobbyVM.LobbyPumpList.sequence]()
	if LobbyVM.AutoJoin.leaveServerImmediately == true then
		LobbyVM.AutoJoin.leaveServerImmediately = false
		if not LobbyVM.IsInTheaterLobby() then
			Engine.LeaveServerImmediately()
		end
	end
end

LobbyVM.OnEnableJoins = function ( f140_arg0 )
	if f140_arg0.enable then
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
	else
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_PAUSED )
	end
end

LobbyVM.OnStorageOperationReadResult = function ( f141_arg0 )
	Lobby.Anticheat.OnStorageOperationReadResult( f141_arg0 )
end

LobbyVM.OnIsFeatureBanned = function ( f142_arg0 )
	local f142_local0, f142_local1 = Lobby.Anticheat.CheckIsFeatureBannedForIndex( f142_arg0.controller, f142_arg0.feature )
	return f142_local0
end

LobbyVM.OnPlayerBanned = function ( f143_arg0 )
	Lobby.Anticheat.OnPlayerBanned( f143_arg0 )
end

LobbyVM.OnFeatureBan = function ( f144_arg0 )
	Lobby.Anticheat.OnFeatureBan( f144_arg0 )
end

LobbyVM.OnCheckPrestigeFeatureBan = function ( f145_arg0 )
	Lobby.Anticheat.OnCheckPrestigeFeatureBan( f145_arg0 )
end

LobbyVM.OnIsPermaBanned = function ( f146_arg0 )
	return Lobby.Anticheat.OnIsPermaBanned( f146_arg0 )
end

LobbyVM.OnGetBanTimeRemaining = function ( f147_arg0 )
	return Lobby.Anticheat.OnGetBanTimeRemaining( f147_arg0 )
end

LobbyVM.OnPushAnticheatMessageToUI = function ( f148_arg0 )
	return Lobby.Anticheat.OnPushAnticheatMessageToUI( f148_arg0 )
end

LobbyVM.OnPopAnticheatMessage = function ( f149_arg0 )
	Lobby.Anticheat.OnPopAnticheatMessage( f149_arg0 )
end

LobbyVM.OnGetAnticheatReputation = function ( f150_arg0 )
	return Lobby.Anticheat.OnGetAnticheatReputation( f150_arg0 )
end

LobbyVM.GetLootItemCategory = function ( f151_arg0 )
	local f151_local0 = "gamedata/loot/mplootitems.csv"
	local f151_local1 = 1
	local f151_local2 = 2
	local f151_local3 = Engine.TableFindRows( f151_local0, f151_local1, f151_arg0 )
	if f151_local3 == nil or #f151_local3 == 0 then
		return -1
	else
		local f151_local4 = Engine.TableLookupGetColumnValueForRow( f151_local0, f151_local3[1], f151_local2 )
		if f151_local4 == nil then
			return -1
		else
			return f151_local4
		end
	end
end

LobbyVM.GetRecentItemTags = function ( f152_arg0, f152_arg1 )
	local f152_local0 = Engine.GetLootItems( f152_arg0, Enum.eModes.MODE_MULTIPLAYER, 0, Engine.GetLootItemCount( f152_arg0, Enum.eModes.MODE_MULTIPLAYER ) )
	local f152_local1 = LuaUtils.GetCurrentLootVersion()
	local f152_local2 = "gamedata/loot/mplootitems.csv"
	local f152_local3 = Engine.TableFindRows( f152_local2, 2, f152_arg1 )
	local f152_local4 = 6
	local f152_local5 = 0
	for f152_local10, f152_local11 in ipairs( f152_local3 ) do
		local f152_local9 = Engine.TableLookupGetColumnValueForRow( f152_local2, f152_local11, f152_local4 )
		if f152_local9 == nil or f152_local9 == "" then
			f152_local9 = -1
		else
			f152_local9 = tonumber( f152_local9 )
		end
		if f152_local9 ~= -1 and f152_local9 <= f152_local1 then
			f152_local5 = f152_local5 + 1
		end
	end
	if f152_local0 == nil then
		return ""
	end
	f152_local6 = {}
	for f152_local11, f152_local9 in ipairs( f152_local0 ) do
		if CoDShared.GetLootItemCategory( f152_local9.id ) == f152_arg1 and CoDShared.GetLootItemVersion( f152_local9.id ) <= f152_local1 then
			table.insert( f152_local6, f152_local9.id )
		end
		if f152_local5 <= #f152_local6 then
			return ""
		end
	end
	if #f152_local6 == 0 then
		return ""
	end
	f152_local7 = ""
	for f152_local9, f152_local12 in ipairs( f152_local6 ) do
		f152_local7 = f152_local7 .. "[ 203, " .. f152_local12 .. "]"
		if f152_local9 < #f152_local6 then
			f152_local7 = f152_local7 .. " , "
		end
	end
	return f152_local7
end

LobbyVM.GetLootPossibleCount = function ( f153_arg0 )
	local f153_local0 = LuaUtils.GetCurrentLootVersion()
	local f153_local1 = "gamedata/loot/mplootitems.csv"
	local f153_local2 = Engine.TableFindRows( f153_local1, 2, f153_arg0 )
	local f153_local3 = 6
	local f153_local4 = 0
	for f153_local8, f153_local9 in ipairs( f153_local2 ) do
		local f153_local10 = tonumber( Engine.TableLookupGetColumnValueForRow( f153_local1, f153_local9, f153_local3 ) ) or -1
		if f153_local10 ~= -1 and f153_local10 <= f153_local0 then
			f153_local4 = f153_local4 + 1
		end
	end
	return f153_local4
end

LobbyVM.GetLootItemList = function ( f154_arg0, f154_arg1 )
	local f154_local0 = LuaUtils.GetCurrentLootVersion()
	local f154_local1 = Engine.GetLootItems( f154_arg0, Enum.eModes.MODE_MULTIPLAYER, 0, Engine.GetLootItemCount( f154_arg0, Enum.eModes.MODE_MULTIPLAYER ) )
	local f154_local2 = {}
	if f154_local1 == nil then
		return f154_local2
	end
	for f154_local6, f154_local7 in ipairs( f154_local1 ) do
		if CoDShared.GetLootItemCategory( f154_local7.id ) == f154_arg1 and CoDShared.GetLootItemVersion( f154_local7.id ) <= f154_local0 then
			table.insert( f154_local2, f154_local7.id )
		end
	end
	return f154_local2
end

LobbyVM.OnBuyCrate = function ( f155_arg0 )
	if f155_arg0.crateDWID == 48 then
		local f155_local0 = LobbyVM.GetLootPossibleCount( "melee_weapon" )
		local f155_local1 = LobbyVM.GetLootItemList( f155_arg0.controller, "melee_weapon" )
		if f155_local0 ~= nil and f155_local1 ~= nil and f155_local0 - 1 <= #f155_local1 then
			f155_arg0.crateDWID = 50
		end
	end
	local f155_local0 = " \"SupplyDropID\": " .. f155_arg0.crateDWID .. ", "
	local f155_local1 = " \"PurchaseWith\": \"" .. f155_arg0.currency .. "\", "
	local f155_local2 = " \"Rank\": [], "
	local f155_local3 = " \"ExcludeTag\": [], "
	local f155_local4 = " \"InventoryVersion\": [ " .. Dvar.loot_mpItemVersions:get() .. Dvar.loot_limitedTimeItemVersions:get() .. " ] "
	if Engine.DvarString( nil, "loot_useClientDupes" ) == "1" then
		local f155_local5 = false
		local f155_local6 = ""
		if f155_arg0.crateDWID == 32 then
			f155_local5 = true
			f155_local6 = "weapon"
		elseif f155_arg0.crateDWID == 31 then
			f155_local5 = true
			f155_local6 = "melee_weapon"
		end
		if f155_local5 == true then
			local f155_local7 = LobbyVM.GetRecentItemTags( f155_arg0.controller, f155_local6 )
			f155_local3 = " \"ExcludeTag\": [ "
			if f155_local7 ~= "" then
				f155_local3 = f155_local3 .. f155_local7
			end
			f155_local3 = f155_local3 .. " ], "
			Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "Excluding: " .. f155_local3 .. ".\n" )
		end
	end
	return f155_local0 .. f155_local1 .. f155_local2 .. f155_local3 .. f155_local4
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
	},
	{
		dlcIndex = Enum.dlcIndex_t.CONTENT_DLC5_INDEX,
		dlcPackName = "dlc5",
		inventoryVersion = 105
	}
}
LobbyVM.OnSpendVials = function ( f156_arg0 )
	local f156_local0 = " \"NumVials\": " .. f156_arg0.vialCount .. ", "
	local f156_local1 = " \"InventoryVersion\": [" .. Dvar.loot_zmItemVersions:get() .. " "
	local f156_local2 = Engine.DvarInt( nil, "tu9_highestAvailableDLC" )
	for f156_local6, f156_local7 in ipairs( LobbyVM.DLCInfo ) do
		if f156_local7.dlcIndex <= f156_local2 or f156_local7.dlcPackName == "dlc5" and (Dvar.loot_forceEnableZCGumsInFactory:get() == 1 or Dvar.loot_forceEnableZCGumsInFactory:get() == "1") then
			f156_local1 = f156_local1 .. ", " .. f156_local7.inventoryVersion .. " "
		end
	end
	return f156_local0 .. f156_local1 .. "]"
end

LobbyVM.OnCookGobbleGumRecipe = function ( f157_arg0 )
	return " \"Recipe\": " .. f157_arg0.recipeIndex + f157_arg0.itemOffset
end

LobbyVM.OnInventoryFetched = function ( f158_arg0 )
	local f158_local0 = {
		"na_team_mtx",
		"eu_team_mtx",
		"anz_team_mtx",
		"cwl_mtx",
		"cwl_mtx_v2"
	}
	local f158_local1 = "gamedata/tables/common/inventory_items.csv"
	local f158_local2 = 1
	local f158_local3 = 2
	local f158_local4 = false
	for f158_local8, f158_local9 in ipairs( f158_local0 ) do
		if Engine.GetInventoryItemQuantity( f158_arg0.controller, tonumber( Engine.TableLookup( nil, f158_local1, f158_local2, f158_local9, f158_local3 ) ) ) > 0 then
			Engine.SetProfileVar( f158_arg0.controller, f158_local9, "1" )
			f158_local4 = true
		end
	end
	if f158_local4 then
		Engine.CommitProfileChanges( f158_arg0.controller )
	end
end

LobbyVM.CheckSpecialPlaylistRules = function ( f159_arg0 )
	if Dvar.partyChatDisallowed:get() == true then
		if Engine.IsLocalClientInPlatformPartyChat() and not Engine.IsInComError() then
			Dvar.partyChatDisallowed:set( false )
			Engine.ComError( Enum.errorCode.ERROR_DROP, "PLATFORM_PARTYCHATNOTALLOWED" )
		end
		local f159_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		for f159_local4, f159_local5 in ipairs( f159_local0.sessionClients ) do
			if f159_local5.isInPlatformPartyChat == true then
				Engine.KickClient( f159_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, f159_local5.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_NOPARTYCHAT, "PLATFORM_PARTYCHATNOTALLOWED" )
			end
		end
	end
end

LobbyVM.LobbyMonitor = function ()
	if not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) or Engine.IsDedicatedServer() or Engine.IsInGame() then
		return 
	elseif Engine.GetLobbyUIScreen() ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
		return 
	elseif Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		return 
	elseif false == Dvar.tu16_lobbyMonitor:exists() or Dvar.tu16_lobbyMonitor:get() == 0 then
		return 
	end
	local f160_local0 = Dvar.tu16_lobbyMonitor:get()
	if f160_local0 == 0 then
		return 
	end
	local f160_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f160_local2 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f160_local3 = Dvar.party_maxplayers:get()
	if f160_local2 == f160_local3 or f160_local1 <= f160_local3 then
		return 
	end
	local f160_local4 = Engine.GetPrimaryController()
	if false == LobbyVM.lobbyMonitor.eventRecorded then
		LobbyVM.lobbyMonitor.eventRecorded = true
		Engine.RecordComScoreEvent( f160_local4, "lobby_monitor", "game_client_count", f160_local1, "game_max_clients", f160_local2, "party_max_players", f160_local3 )
	end
	if f160_local0 == 1 then
		
	elseif f160_local0 == 2 then
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_ERROR )
		local f160_local5 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		for f160_local9, f160_local10 in ipairs( f160_local5.sessionClients ) do
			if f160_local10.isHost == false and f160_local10.isLocal == false then
				Engine.KickClient( f160_local4, Enum.LobbyType.LOBBY_TYPE_GAME, f160_local10.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_ERROR, "LobbyVM.LobbyMonitor() found an issue with the lobby" )
			end
		end
		Engine.ComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER_ERROR" )
	end
end

LobbyVM.IngameMonitor = function ()
	if not Engine.IsInGame() then
		return 
	elseif (Engine.IsDedicatedServer() or CoDShared.IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_PUBLIC )) and Dvar.partyChatDisallowed:get() and Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		local f161_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f161_local1 = Engine.GetLobbyHostControllerIndex( Enum.LobbyType.LOBBY_TYPE_GAME )
		for f161_local5, f161_local6 in ipairs( f161_local0.sessionClients ) do
			if f161_local6.isInPlatformPartyChat == true then
				Engine.KickClient( f161_local1, Enum.LobbyType.LOBBY_TYPE_GAME, f161_local6.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_NOPARTYCHAT, "PLATFORM_PARTYCHATNOTALLOWED" )
			end
		end
	end
end

