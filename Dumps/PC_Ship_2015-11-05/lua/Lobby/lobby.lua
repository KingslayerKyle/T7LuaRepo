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
	clientLaunch = {}
}
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
	Lobby.TeamSelection.OnSessionEnd( f13_arg0 )
	Lobby.Theater.OnSessionEnd( f13_arg0 )
	Lobby.Platform.OnSessionEnd( f13_arg0 )
	Lobby.Debug.OnSessionEnd( f13_arg0 )
end

LobbyVM.OnClientAdded = function ( f14_arg0 )
	local f14_local0 = f14_arg0.lobbyModule
	local f14_local1 = f14_arg0.lobbyType
	local f14_local2 = f14_arg0.lobbyMode
	local f14_local3 = f14_arg0.xuid
	if f14_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST then
		LuaUtils.ForceLobbyButtonUpdate()
	end
	Lobby.Matchmaking.OnClientAdded( f14_arg0 )
	Lobby.TeamSelection.OnClientAdded( f14_arg0 )
	Lobby.Pregame.OnClientAdded( f14_arg0 )
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
	Lobby.Platform.OnMatchStart( f16_arg0 )
	Lobby.Debug.OnMatchStart( f16_arg0 )
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
	LuaUtils.LogQoS( "match_change_map", f18_arg0 )
	if Dvar.ui_gametype:get() == "doa" then
		local f18_local3 = Engine.GetLobbyUIScreen()
		if f18_local3 == LobbyData.UITargets.UI_CPLOBBYLANCUSTOMGAME.id then
			LobbyVM.UpdateUI( {
				toTarget = LobbyData.UITargets.UI_CPLOBBYLANGAME
			} )
		elseif f18_local3 == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id then
			LobbyVM.UpdateUI( {
				toTarget = LobbyData.UITargets.UI_CPLOBBYONLINE
			} )
		elseif f18_local3 == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id then
			LobbyVM.UpdateUI( {
				toTarget = LobbyData.UITargets.UI_CPLOBBYONLINE
			} )
		elseif f18_local3 == LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id then
			LobbyVM.UpdateUI( {
				toTarget = LobbyData.UITargets.UI_CP2LOBBYLANGAME
			} )
		elseif f18_local3 == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id then
			LobbyVM.UpdateUI( {
				toTarget = LobbyData.UITargets.UI_CP2LOBBYONLINE
			} )
		elseif f18_local3 == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id then
			LobbyVM.UpdateUI( {
				toTarget = LobbyData.UITargets.UI_CP2LOBBYONLINE
			} )
		end
	end
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
	end
	Lobby.TeamSelection.OnMatchEnd( f19_arg0 )
	Lobby.Timer.OnMatchEnd( f19_arg0 )
	Lobby.MapVote.OnMatchEnd( f19_arg0 )
	Lobby.Analytics.OnMatchEnd( f19_arg0 )
	Lobby.Matchmaking.OnMatchEnd( f19_arg0 )
	Lobby.Platform.OnMatchEnd( f19_arg0 )
	Lobby.Debug.OnMatchEnd( f19_arg0 )
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
	local f22_local6 = "EXE_DISCONNECTED_FROM_SERVER"
	local f22_local7 = Lobby.Process.Recover( f22_local5 )
	if f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_INVALID then
		
	elseif f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_DROP then
		
	elseif f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK then
		f22_local6 = "EXE_KICKED_FROM_PARTY"
	elseif f22_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_BADDLC then
		if LobbyVM.ShouldShowContentChangedMessage( f22_local5, f22_local1 ) then
			Engine.ComError( Enum.errorCode.ERROR_DROP, "MENU_NEW_DLC_AVAILABLE" )
		else
			Engine.ComError( Enum.errorCode.ERROR_DROP, "PLATFORM_MISSINGMAP" )
		end
	end
	f22_local7.tail.success = Lobby.Actions.ErrorPopupMsg( Engine.Localize( f22_local6 ) )
	Lobby.ProcessQueue.AddToQueue( "DisconnectFromHost", f22_local7 )
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
	local f26_local0 = f26_arg0.partyPrivacy
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
	Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyVM.OnComError - errorCode: " .. LobbyVM.ComErrorCodeToString( f29_local1 ) .. ", errorMsg: " .. f29_local2 .. ".\n" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	LuaUtils.LogQoS( "lobby_error", f29_arg0 )
	if f29_local1 == Enum.errorCode.ERROR_SOFTRESTART or f29_local1 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW or f29_local1 == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and not Engine.IsSignedInToDemonware( f29_local0 ) then
		LobbyVM.ErrorShutdown( f29_arg0 )
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
	LobbyVM.ErrorShutdown( {
		controller = Engine.GetPrimaryController(),
		signoutUsers = false
	} )
end

LobbyVM.OnPostExecFFOTD = function ()
	LobbyVM.LogGlobalData()
end

LobbyVM.Gunsmith = {}
LobbyVM.Gunsmith.InitializeBuffer = function ( f43_arg0 )
	local f43_local0 = #f43_arg0.variant
	for f43_local1 = 0, f43_local0 - 1, 1 do
		local f43_local4 = f43_arg0.variant[f43_local1]
		f43_local4.variantIndex:set( f43_local1 )
		f43_local4.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f43_local4.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

LobbyVM.InitilizeGunsmithBuffer = function ( f44_arg0 )
	local f44_local0 = f44_arg0.controller
	Engine.StorageReset( f44_local0, Enum.StorageFileType.STORAGE_GUNSMITH )
	LobbyVM.Gunsmith.InitializeBuffer( Engine.StorageGetBuffer( f44_local0, Enum.StorageFileType.STORAGE_GUNSMITH ) )
	Engine.StorageWrite( f44_local0, Enum.StorageFileType.STORAGE_GUNSMITH )
end

LobbyVM.OnInitializeStats = function ( f45_arg0 )
	local f45_local0 = f45_arg0.controller
	local f45_local1 = f45_arg0.storageFileType
	if f45_local1 == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		local f45_local2 = Engine.StorageGetBuffer( f45_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		f45_local2 = f45_local2.itemStats
		if f45_local2 then
			for f45_local3 = 1, 255, 1 do
				if Engine.ItemIndexValid( f45_local3, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemUnlockLevel( f45_local3, Enum.eModes.MODE_MULTIPLAYER ) == 0 then
					f45_local2[f45_local3].markedOld:set( 1 )
				end
				f45_local2[f45_local3].attachmentMarkedOld.gmod6:set( 1 )
				f45_local2[f45_local3].attachmentMarkedOld.gmod7:set( 1 )
			end
		end
	elseif f45_local1 == Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE then
		local f45_local2 = Engine.StorageGetBuffer( f45_local0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		f45_local2 = f45_local2.itemStats
		if f45_local2 then
			for f45_local3 = 1, 255, 1 do
				if Engine.ItemIndexValid( f45_local3, Enum.eModes.MODE_ZOMBIES ) and Engine.GetItemUnlockLevel( f45_local3, Enum.eModes.MODE_ZOMBIES ) == 0 and Engine.GetItemGroup( f45_local3, Enum.eModes.MODE_ZOMBIES ) == "bubblegum" then
					f45_local2[f45_local3].markedOld:set( 1 )
				end
			end
		end
	end
end

LobbyVM.SetDefaultShowcaseWeapon = function ( f46_arg0, f46_arg1 )
	local f46_local0 = Engine.GetItemIndexFromReference( "ar_standard", f46_arg1 )
	for f46_local1 = 0, #f46_arg0.characters - 1, 1 do
		local f46_local4 = f46_arg0.characters[f46_local1].showcaseWeapon
		f46_local4.weaponIndex:set( f46_local0 )
		f46_local4.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f46_local4.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

LobbyVM.OnInitializeLoadouts = function ( f47_arg0 )
	local f47_local0 = f47_arg0.controller
	local f47_local1 = f47_arg0.storageFileType
	local f47_local2 = f47_arg0.statsNetworkType
	if f47_local1 == Enum.StorageFileType.STORAGE_ZM_LOADOUTS then
		local f47_local3 = Engine.StorageGetBuffer( f47_local0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		f47_local3 = f47_local3.cacLoadouts
		LobbyVM.Gunsmith.InitializeBuffer( f47_local3 )
		f47_local3.characterContext.characterIndex:set( 6 )
		LobbyVM.SetDefaultShowcaseWeapon( f47_local3, Enum.eModes.MODE_ZOMBIES )
	elseif f47_local1 == Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE then
		local f47_local3 = Engine.StorageGetBuffer( f47_local0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
		f47_local3 = f47_local3.cacLoadouts
		LobbyVM.Gunsmith.InitializeBuffer( f47_local3 )
		f47_local3.characterContext.characterIndex:set( 6 )
		LobbyVM.SetDefaultShowcaseWeapon( f47_local3, Enum.eModes.MODE_ZOMBIES )
	elseif f47_local1 == Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE then
		local f47_local3 = Engine.StorageGetBuffer( f47_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
		f47_local3 = f47_local3.cacLoadouts
		LobbyVM.SetDefaultShowcaseWeapon( f47_local3, Enum.eModes.MODE_MULTIPLAYER )
		local f47_local4 = Engine.GetEquippedHeroForCACType( f47_local0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_OFFLINE )
		if f47_local4 then
			local f47_local5 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f47_local4, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if f47_local3 and f47_local3.heroweapon then
				f47_local3.heroweapon:set( f47_local5 )
			end
		end
	elseif f47_local1 == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		local f47_local3 = Engine.StorageGetBuffer( f47_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f47_local3 = f47_local3.cacLoadouts
		local f47_local4 = Engine.StorageGetBuffer( f47_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f47_local4 = f47_local4.customMatchCacLoadouts
		local f47_local5 = Engine.StorageGetBuffer( f47_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f47_local5 = f47_local5.leagueCacLoadouts
		LobbyVM.SetDefaultShowcaseWeapon( f47_local3, Enum.eModes.MODE_MULTIPLAYER )
		LobbyVM.SetDefaultShowcaseWeapon( f47_local4, Enum.eModes.MODE_MULTIPLAYER )
		LobbyVM.SetDefaultShowcaseWeapon( f47_local5, Enum.eModes.MODE_MULTIPLAYER )
		local f47_local6 = Engine.GetEquippedHeroForCACType( f47_local0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC )
		if f47_local6 then
			local f47_local7 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f47_local6, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if f47_local3 and f47_local3.heroweapon then
				f47_local3.heroweapon:set( f47_local7 )
			end
			if f47_local4 and f47_local4.heroweapon then
				f47_local4.heroweapon:set( f47_local7 )
			end
		end
		if f47_local3 then
			local f47_local8 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
			for f47_local9 = 0, #f47_local8 - 1, 1 do
				if f47_local3.characters[f47_local9].itemList then
					f47_local3.characters[f47_local9].itemList.body.items[0].markedOld:set( 1 )
					f47_local3.characters[f47_local9].itemList.helmet.items[0].markedOld:set( 1 )
				end
				if f47_local3.characters[f47_local9].tauntMarkedOld and f47_local3.characters[f47_local9].tauntMarkedOld.first_place and f47_local3.characters[f47_local9].tauntMarkedOld.first_place.markedOld then
					f47_local3.characters[f47_local9].tauntMarkedOld.first_place.markedOld[0]:set( 1 )
				end
			end
		end
	elseif f47_local1 == Enum.StorageFileType.STORAGE_CP_LOADOUTS then
		local f47_local3 = Engine.StorageGetBuffer( f47_local0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
		LobbyVM.SetDefaultShowcaseWeapon( f47_local3.cacLoadouts, Enum.eModes.MODE_CAMPAIGN )
	elseif f47_local1 == Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE then
		local f47_local3 = Engine.StorageGetBuffer( f47_local0, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
		LobbyVM.SetDefaultShowcaseWeapon( f47_local3.cacLoadouts, Enum.eModes.MODE_CAMPAIGN )
	end
end

LobbyVM.LobbyHostLeftNoMigration = function ( f48_arg0 )
	local f48_local0 = f48_arg0.controller
	local f48_local1 = f48_arg0.lobbyType
	local f48_local2 = f48_arg0.lobbyMainMode
	local f48_local3 = f48_arg0.lobbyNetworkMode
	local f48_local4 = f48_arg0.maxClients
	local f48_local5 = f48_arg0.isGameLobbyActive
	local f48_local6 = f48_arg0.isPrivateHost
	if f48_local5 == true and f48_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		if Lobby.ProcessQueue.GetCurrentRunningProcessName() ~= "HostLeftNoMigrationGame" then
			Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigrationGame", Lobby.Process.Recover( f48_local0 ) )
		end
	else
		Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigration", Lobby.Process.HostLeftNoMigrationCreatePrivateLobby( f48_local0, f48_local2, f48_local4 ) )
	end
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "host_left_no_migration", f48_arg0 )
end

LobbyVM.LobbyHostLeft_InGameMigrateFinished = function ( f49_arg0 )
	local f49_local0 = Lobby.Process.Recover( f49_arg0.controller )
	if LobbyVM.AutoJoin.data ~= nil then
		local f49_local1 = nil
		if LobbyVM.AutoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				f49_local1 = Lobby.Platform.InGamePlatformJoinOrbis( LobbyVM.AutoJoin.data.platformData )
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				f49_local1 = Lobby.Platform.InGamePlatformJoinDurango( LobbyVM.AutoJoin.data.platformData )
			end
		else
			f49_local1 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		end
		if f49_local1 ~= nil then
			Lobby.Process.AppendProcess( f49_local0, f49_local1 )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyHostLeft_InGameMigrateFinished", f49_local0 )
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "ingame_migrate_finished", f49_arg0 )
end

LobbyVM.LobbyClientLeftEvent = function ( f50_arg0 )
	local f50_local0 = f50_arg0.controller
	local f50_local1 = f50_arg0.lobbyType
	local f50_local2 = f50_arg0.lobbyMainMode
	local f50_local3 = f50_arg0.lobbyNetworkMode
	local f50_local4 = f50_arg0.maxClients
	local f50_local5 = Lobby.Process.Recover( f50_local0 )
	if LobbyVM.AutoJoin.data ~= nil then
		local f50_local6 = nil
		if LobbyVM.AutoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				f50_local6 = Lobby.Platform.InGamePlatformJoinOrbis( LobbyVM.AutoJoin.data.platformData )
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				f50_local6 = Lobby.Platform.InGamePlatformJoinDurango( LobbyVM.AutoJoin.data.platformData )
			end
		else
			f50_local6 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		end
		if f50_local6 ~= nil then
			Lobby.Process.AppendProcess( f50_local5, f50_local6 )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyClientLeft", f50_local5 )
end

LobbyVM.Devmap = function ( f51_arg0 )
	Lobby.ProcessQueue.AddToQueue( "Devmap", Lobby.Process.Devmap( f51_arg0.controller, f51_arg0.mainMode ) )
end

LobbyVM.DevmapClient = function ( f52_arg0 )
	Lobby.ProcessQueue.AddToQueue( "DevmapClient", Lobby.Process.DevmapClient( f52_arg0.controller ) )
end

LobbyVM.NetworkModeChanged = function ( f53_arg0 )
	Lobby.ProcessQueue.AddToQueue( "NetworkModeChanged", Lobby.Process.ReloadPrivateLobby( f53_arg0.controller, f53_arg0.networkMode ) )
end

LobbyVM.GoForward = function ( f54_arg0 )
	local f54_local0 = f54_arg0.controller
	local f54_local1 = f54_arg0.navToMenu
	local f54_local2 = f54_arg0.withParty
	local f54_local3 = f54_arg0.disbandParty
	local f54_local4 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	local f54_local5 = LobbyData:UITargetFromName( f54_local1 )
	if f54_local4 == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if f54_local5 == nil then
		error( "LobbyVM: No menu called '" .. f54_local1 .. "' found." )
	end
	local f54_local6 = Lobby.Process.GetForwardFunc( f54_local4, f54_local5 )
	if f54_local6 == nil then
		error( "LobbyVM: No forward process function found to move from '" .. f54_local4.name .. "' to '" .. f54_local1 .. "'." )
	end
	local f54_local7 = f54_local6( f54_local0, f54_local4, f54_local5 )
	if f54_local7 ~= nil and f54_local3 == true then
		if true == Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			local f54_local8 = Lobby.Process.ManagePartyLeave( f54_local0 )
			Lobby.Process.AppendProcess( f54_local8, f54_local7 )
			Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f54_local4.name .. "' menu to '" .. f54_local5.name .. "' menu AND ManagePartyLeave", f54_local8 )
		else
			local f54_local8 = Lobby.Process.ReloadPrivateLobby( f54_local0, Engine.GetLobbyNetworkMode() )
			Lobby.Process.AppendProcess( f54_local8, f54_local7 )
			Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f54_local4.name .. "' menu to '" .. f54_local5.name .. "' menu AND PartyMemberLeave", f54_local8 )
		end
		return 
	else
		Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f54_local4.name .. "' menu to '" .. f54_local5.name .. "' menu.", f54_local7 )
	end
end

LobbyVM.GoBack = function ( f55_arg0 )
	local f55_local0 = f55_arg0.controller
	local f55_local1 = f55_arg0.withParty
	local f55_local2 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f55_local2 == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	local f55_local3, f55_local4 = Lobby.Process.GetBackFunc( f55_local2 )
	if f55_local3 == nil or f55_local4 == nil then
		error( "LobbyVM: No back process function found for '" .. currentMenu( "'." ) )
	end
	Lobby.ProcessQueue.AddToQueue( "GoBackFrom" .. f55_local2.name, f55_local4( f55_local0, f55_local2, f55_local3, f55_local1 ) )
end

LobbyVM.ManagePartyLeave = function ( f56_arg0 )
	local f56_local0 = f56_arg0.controller
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
		Lobby.ProcessQueue.AddToQueue( "ManagePartyLeave", Lobby.Process.ManagePartyLeave( f56_local0 ) )
	else
		Lobby.ProcessQueue.AddToQueue( "PartyMemberLeave", Lobby.Process.ReloadPrivateLobby( f56_local0, Engine.GetLobbyNetworkMode() ) )
	end
end

LobbyVM.InGameJoin = function ( f57_arg0, f57_arg1 )
	LobbyVM.AutoJoin.data = f57_arg0
	if f57_arg0.migrating ~= nil and f57_arg0.migrating == false and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
		if f57_arg1 == true then
			LobbyVM.AutoJoin.leaveServerImmediately = true
			return 
		end
		Engine.LeaveServerImmediately()
	end
end

LobbyVM.GetJoinProcess = function ( f58_arg0 )
	local f58_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f58_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.LobbyIsPlayerInLobby( f58_local0, f58_arg0.xuid ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of\n" )
		return nil
	elseif Engine.IsCpStillDownloading() or Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Cannot process a join when the game is still being installed.\n" )
		return nil
	else
		return Lobby.Process.Join( f58_arg0.controller, f58_arg0.xuid, f58_arg0.joinType, LuaEnums.LEAVE_WITH_PARTY.WITH )
	end
end

LobbyVM.Join = function ( f59_arg0 )
	local f59_local0 = LobbyVM.GetJoinProcess( f59_arg0 )
	if f59_local0 ~= nil then
		Lobby.ProcessQueue.AddToQueue( "Join", f59_local0 )
	end
end

LobbyVM.OnJoinComplete = function ( f60_arg0 )
	Lobby.Debug.OnJoinComplete( f60_arg0 )
end

LobbyVM.JoinSystemlink = function ( f61_arg0 )
	Lobby.ProcessQueue.AddToQueue( "JoinSystemLink", Lobby.Process.JoinSystemlink( f61_arg0.controller, f61_arg0.lobbyMainMode, f61_arg0.lobbyNetworkMode, f61_arg0.hostXuid, f61_arg0.hostInfo ) )
end

LobbyVM.CreateDedicatedLANLobby = function ()
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLANLobby", Lobby.Process.CreateDedicatedLANLobby( 0, LobbyData.UITargets.UI_MPLOBBYLANGAME ) )
end

LobbyVM.CreateDedicatedLobby = function ( f63_arg0 )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLobby", Lobby.Process.CreateDedicatedLobby( 0, LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME ) )
end

LobbyVM.ForceToMenu = function ( f64_arg0 )
	Lobby.ProcessQueue.AddToQueue( "ForceToMenu", Lobby.Process.ForceToMenu( f64_arg0.controller, LobbyData:UITargetFromName( f64_arg0.menuName ), f64_arg0.msg ) )
end

LobbyVM.LobbyClientPromoteToHost = function ( f65_arg0 )
	Lobby.ProcessQueue.AddToQueue( "PromoteClientToHost", Lobby.Process.PromoteClientToHost( f65_arg0.controller, f65_arg0.lobbyMainMode, f65_arg0.lobbyType, f65_arg0.lobbyMode, f65_arg0.maxClients, f65_arg0.hostInfo, f65_arg0.isAdvertised, f65_arg0.isInGame, f65_arg0.newMigrateIndex ) )
end

LobbyVM.LobbyLeaveWithParty = function ( f66_arg0 )
	local f66_local0 = Lobby.Process.LeaveWithParty( f66_arg0.lobbyModule, f66_arg0.lobbyType, f66_arg0.lobbyMode )
	if f66_local0 == nil then
		return 
	else
		Lobby.ProcessQueue.AddToQueue( "LeaveWithParty", f66_local0 )
	end
end

LobbyVM.CanLobbyCanMigrate = function ( f67_arg0 )
	local f67_local0 = f67_arg0.lobbyType
	local f67_local1 = f67_arg0.lobbyMode
	if f67_local1 == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		return false
	elseif f67_local1 == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return false
	elseif Engine.IsLobbyInRecovery ~= nil and Engine.IsLobbyInRecovery( f67_local0 ) then
		return false
	else
		return true
	end
end

LobbyVM.LobbyLocalClientLeave = function ( f68_arg0 )
	if not Lobby.ProcessQueue.IsQueueEmpty() then
		return false
	else
		local f68_local0 = Lobby.Process.LocalClientLeave( f68_arg0.controller, f68_arg0.xuid )
		if f68_local0 == nil then
			return false
		else
			Lobby.ProcessQueue.AddToQueue( "LobbyLocalClientLeave", f68_local0 )
			return true
		end
	end
end

LobbyVM.SetMaxLocalPlayers = function ( f69_arg0 )
	Dvar.lobby_maxLocalPlayers:set( math.min( f69_arg0.maxLocalClients, Engine.GetMaxLocalControllers() ) )
end

LobbyVM.LobbySettings = function ( f70_arg0 )
	local f70_local0 = f70_arg0.controller
	local f70_local1 = f70_arg0.toTarget
	local f70_local2 = f70_arg0.skipSwitchMode
	local f70_local3 = f70_arg0.isDevMap
	if type( f70_local1 ) == "number" then
		f70_local1 = LobbyData:UITargetFromId( f70_local1 )
	end
	if f70_local1 == nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Tried to apply settings for an invalid target.\n" )
		return 
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Applying settings for menu: " .. f70_local1.name .. ".\n" )
	if not f70_local2 then
		local f70_local4 = Engine.GetLobbyMainMode()
		local f70_local5 = f70_local1.mainMode
		if Engine.SwitchCampaignMode then
			if f70_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				if LuaUtils.IsCPZMTarget( f70_local1.id ) then
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES )
				else
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
				end
			else
				Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
			end
		end
		if f70_local4 ~= f70_local5 then
			if f70_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				Engine.SwitchMode( f70_local0, "mp" )
			elseif f70_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				Engine.SwitchMode( f70_local0, "cp" )
			elseif f70_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
				Engine.SwitchMode( f70_local0, "zm" )
			else
				Engine.SwitchMode( f70_local0, "" )
			end
		end
	end
	if f70_local3 ~= true and f70_local1.eGameModes == Enum.eGameModes.MODE_GAME_INVALID then
		Engine.ResetGametypeSettings()
	end
	LobbyVM.SetMaxLocalPlayers( f70_local1 )
	Engine.SetLobbyMode( f70_local1.lobbyType, f70_local1.lobbyMode )
	Engine.TEMPGameModeSetMode( f70_local1.eGameModes )
end

LobbyVM.UpdateUI = function ( f71_arg0 )
	local f71_local0 = f71_arg0.toTarget
	local f71_local1 = f71_arg0.controller
	if type( f71_local0 ) == "number" then
		f71_local0 = LobbyData:UITargetFromId( f71_local0 )
	end
	local f71_local2 = function ( f72_arg0 )
		if f72_arg0 == "auto" then
			return "room2"
		else
			return f72_arg0
		end
	end
	
	LobbyData.SetLobbyNav( f71_local0 )
	Engine.SetLobbyUIScreen( f71_local0.id )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMode", true ), f71_local0.lobbyMode )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode", true ), f71_local0.mainMode )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode", true ), f71_local0.eGameModes )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room", true ), f71_local2( f71_local0.room ) )
end

LobbyVM.Leaderboard_CalculateLBColValue = function ( f73_arg0 )
	return Lobby.Leaderboard.CalculateLBColValue( f73_arg0 )
end

LobbyVM.OnShouldWriteLeaderboard = function ( f74_arg0 )
	return Lobby.Leaderboard.OnShouldWriteLeaderboard( f74_arg0 )
end

LobbyVM.CheckDLCBit = function ( f75_arg0, f75_arg1 )
	return 0 < f75_arg0 & f75_arg1
end

LobbyVM.ValidateClientDLCBits = function ( f76_arg0, f76_arg1 )
	local f76_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f76_local1 = Dvar.ui_mapname:get()
	local f76_local2 = Engine.GetDLCBitForMapName( f76_local1 )
	for f76_local6, f76_local7 in pairs( f76_local0.sessionClients ) do
		if not LobbyVM.CheckDLCBit( f76_local7.dlcBits, f76_local2 ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Kicking client " .. f76_local7.gamertag .. " because map " .. f76_local1 .. " is in contentpack " .. f76_local2 .. " but their dlcbits is " .. f76_local7.dlcBits .. "\n" )
			Engine.LobbyDisconnectClient( f76_arg0, f76_arg1, f76_local7.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_BADDLC )
		end
	end
	return true
end

LobbyVM.LaunchGameExec = function ( f77_arg0, f77_arg1 )
	if f77_arg1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch game not supported for this lobby type(" .. f77_arg1 .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		local f77_local0 = Dvar.ui_mapname:get()
		local f77_local1 = Dvar.ui_gametype:get()
		LobbyVM.ValidateClientDLCBits( f77_arg0, f77_arg1 )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching game... **\n" )
		Engine.Exec( f77_arg0, "lobbyLaunchGame " .. f77_arg1 .. " " .. f77_local0 .. " " .. f77_local1 )
	else
		local f77_local0 = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch game. Lobby process '" .. f77_local0.name .. "' in progress.\n" )
	end
end

LobbyVM.LaunchDemoExec = function ( f78_arg0, f78_arg1 )
	if f78_arg1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch demo not supported for this lobby type(" .. f78_arg1 .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching demo... **\n" )
		Engine.Exec( f78_arg0, "lobbyLaunchDemo" )
	else
		local f78_local0 = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch damo. Lobby process '" .. f78_local0.name .. "' in progress.\n" )
	end
end

LobbyVM.HostLaunchInit = function ()
	LobbyVM.hostLaunch = {}
	LobbyVM.hostLaunch.fadeToBlack = false
	local f79_local0 = Engine.milliseconds()
	LobbyVM.hostLaunch.startTime = f79_local0
	LobbyVM.hostLaunch.fadeToBlackTime = f79_local0 + Dvar.lobbyLaunch_fadeToBlackDelay:get()
	LobbyVM.hostLaunch.launchTime = f79_local0 + Dvar.lobbyLaunch_gameLaunchDelay:get()
	LobbyVM.hostLaunch.waitForClientAckTime = f79_local0 + Dvar.lobbyLaunch_waitForClientAckDelay:get()
	Engine.LuiVM_Event( "lobby_spinner_popup", {
		openPopup = true,
		showCancelButton = false,
		immediate = true
	} )
	return true
end

LobbyVM.HostLaunchPump = function ( f80_arg0 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ) ) == false then
		Engine.LuiVM_Event( "lobby_spinner_popup", {
			openPopup = true,
			showCancelButton = false,
			immediate = true
		} )
	end
	if not Engine.IsDedicatedServer() then
		if false == LobbyVM.hostLaunch.fadeToBlack and Engine.milliseconds() > LobbyVM.hostLaunch.fadeToBlackTime then
			LobbyVM.hostLaunch.fadeToBlack = true
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 1 )
		end
		if Engine.milliseconds() < LobbyVM.hostLaunch.launchTime then
			return false
		end
	end
	if Engine.IsWaitingForDatabase and Engine.IsWaitingForDatabase() then
		return false
	elseif not f80_arg0.hasAllClientsGotLatestStateMsg or Engine.milliseconds() < LobbyVM.hostLaunch.waitForClientAckTime then
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
	Engine.LuiVM_Event( "lobby_spinner_popup", {
		openPopup = false,
		immediate = true
	} )
end

LobbyVM.HostLaunch = function ( f82_arg0 )
	if f82_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.HostLaunchInit()
	elseif f82_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.HostLaunchPump( f82_arg0 )
	else
		LobbyVM.HostLaunchClear()
	end
end

LobbyVM.ClientLaunchInit = function ( f83_arg0 )
	LobbyVM.clientLaunch = {}
	LobbyVM.clientLaunch.fadeToBlack = false
	local f83_local0 = Dvar.lobbyLaunch_fadeToBlackDelay:get()
	local f83_local1 = Dvar.lobbyLaunch_gameLaunchDelay:get()
	if f83_arg0 then
		f83_local0 = Dvar.lobbyLaunch_fadeToBlackDelayOnConnect:get()
		f83_local1 = Dvar.lobbyLaunch_gameLaunchDelayOnConnect:get()
	end
	local f83_local2 = Engine.milliseconds()
	LobbyVM.clientLaunch.startTime = f83_local2
	LobbyVM.clientLaunch.fadeToBlackTime = f83_local2 + f83_local0
	LobbyVM.clientLaunch.launchTime = f83_local2 + f83_local1
	Engine.LuiVM_Event( "lobby_spinner_popup", {
		openPopup = true,
		showCancelButton = false,
		immediate = true
	} )
	return true
end

LobbyVM.ClientLaunchPump = function ()
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ) ) == false then
		Engine.LuiVM_Event( "lobby_spinner_popup", {
			openPopup = true,
			showCancelButton = false,
			immediate = true
		} )
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

LobbyVM.HostLaunchClear = function ()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	Engine.LuiVM_Event( "lobby_spinner_popup", {
		openPopup = false,
		immediate = true
	} )
end

LobbyVM.ClientLaunch = function ( f86_arg0 )
	if f86_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.ClientLaunchInit( f86_arg0.justConnected )
	elseif f86_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.ClientLaunchPump()
	else
		LobbyVM.HostLaunchClear()
	end
end

LobbyVM.LaunchGame = function ( f87_arg0 )
	Lobby.Timer.LaunchGame( f87_arg0 )
end

LobbyVM.LaunchDemo = function ( f88_arg0 )
	Lobby.Timer.LaunchGame( f88_arg0 )
end

LobbyVM.UpdateLobbyStatusInfo = function ( f89_arg0 )
	Lobby.Timer.UpdateLobbyStatusInfo( f89_arg0 )
	Lobby.Pregame.UpdateLobbyStatusInfo( f89_arg0 )
end

LobbyVM.LobbyHost_ClientSelectionReceived = function ( f90_arg0 )
	Lobby.Pregame.LobbyHost_ClientSelectionReceived( f90_arg0 )
end

LobbyVM.SwitchTeam = function ( f91_arg0 )
	Lobby.TeamSelection.SwitchTeam( f91_arg0 )
end

LobbyVM.GameModeChanged = function ( f92_arg0 )
	Lobby.TeamSelection.GameModeChanged( f92_arg0 )
end

LobbyVM.CanFitLobbys = function ( f93_arg0 )
	return Lobby.TeamSelection.CanFitLobbys( f93_arg0 )
end

LobbyVM.OnCanBroadcastHostInfo = function ( f94_arg0 )
	local f94_local0 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f94_local0.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f94_local0.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
		return false
	else
		return true
	end
end

LobbyVM.OnUpdateAdvertising = function ( f95_arg0 )
	if f95_arg0.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.Matchmaking.UpdateAdvertising( "force update from code" )
	end
end

LobbyVM.OnPlatformJoin = function ( f96_arg0 )
	Lobby.Platform.OnPlatformJoin( f96_arg0 )
end

LobbyVM.Invite = function ( f97_arg0 )
	Lobby.Platform.Invite( f97_arg0 )
end

LobbyVM.OnPlatformSessionMultiplayerSubscriptionLost = function ( f98_arg0 )
	Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost( f98_arg0 )
end

LobbyVM.OnPlatformSessionMultiplayerSessionChanged = function ( f99_arg0 )
	Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged( f99_arg0 )
end

LobbyVM.OnPlatformSuspend = function ( f100_arg0 )
	Lobby.Platform.OnPlatformSuspend( f100_arg0 )
end

LobbyVM.SessionSQJRefreshInfo = function ( f101_arg0 )
	Lobby.Debug.SessionSQJRefreshInfo()
end

LobbyVM.StopLobbyTimer = function ( f102_arg0 )
	Lobby.Timer.HostingLobbyEnd( f102_arg0 )
end

LobbyVM.ChangeSigninState = function ( f103_arg0 )
	local f103_local0 = nil
	if f103_arg0.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_OUT then
		Lobby.Anticheat.OnControllerSignedOut( f103_arg0.controller )
		if f103_arg0.isPrimary then
			f103_local0 = Lobby.Process.PrimaryControllerSignedOut( f103_arg0.controller )
		end
	elseif f103_arg0.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_IN then
		if f103_arg0.isPrimary then
			f103_local0 = Lobby.Process.PrimaryControllerSignedIn( f103_arg0.controller )
		end
	else
		DebugPrint( "Warning unknown signin State [" .. f103_arg0.onlineState .. "]" )
	end
	if f103_local0 ~= nil then
		Lobby.ProcessQueue.AddToQueue( "ChangeSignInState", f103_local0 )
	end
end

LobbyVM.JoinResultToString = function ( f104_arg0, f104_arg1 )
	local f104_local0 = {
		debug = "",
		errorMsg = ""
	}
	if f104_arg1 == true then
		f104_local0.debug = "Enum.JoinResult.JOIN_RESULT_"
	end
	if f104_arg0 == Enum.JoinResult.JOIN_RESULT_INVALID then
		f104_local0.debug = f104_local0.debug .. "INVALID"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		f104_local0.debug = f104_local0.debug .. "SUCCESS"
		f104_local0.errorMsg = ""
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_CONNECT_TO_HOST_FAILURE then
		f104_local0.debug = f104_local0.debug .. "CONNECT_TO_HOST_FAILURE"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_SEND_FAILURE then
		f104_local0.debug = f104_local0.debug .. "PROBE_SEND_FAILURE"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_TIMEOUT then
		f104_local0.debug = f104_local0.debug .. "PROBE_TIMEOUT"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_LOBBY then
		f104_local0.debug = f104_local0.debug .. "PROBE_INVALID_LOBBY"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_INFO then
		f104_local0.debug = f104_local0.debug .. "PROBE_INVALID_INFO"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_RESULT_INVALID then
		f104_local0.debug = f104_local0.debug .. "PROBE_RESULT_INVALID"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_INVALID_LOBBY then
		f104_local0.debug = f104_local0.debug .. "INVALID_LOBBY"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_SEND_AGREEMENT_REQUEST_FAILED then
		f104_local0.debug = f104_local0.debug .. "SEND_AGREEMENT_REQUEST_FAILED"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED then
		f104_local0.debug = f104_local0.debug .. "JOIN_DISABLED"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_OFFLINE_MODE then
		f104_local0.debug = f104_local0.debug .. "HOST_OFFLINE_MODE"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_HOST_OFFLINE_MODE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_JOIN_ALREADY_IN_PROGRESS then
		f104_local0.debug = f104_local0.debug .. "JOIN_ALREADY_IN_PROGRESS"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_CLOSED then
		f104_local0.debug = f104_local0.debug .. "NOT_JOINABLE_CLOSED"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_CLOSED"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY then
		f104_local0.debug = f104_local0.debug .. "NOT_JOINABLE_INVITE_ONLY"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY then
		f104_local0.debug = f104_local0.debug .. "NOT_JOINABLE_FRIENDS_ONLY"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_LOBBY_FULL then
		f104_local0.debug = f104_local0.debug .. "LOBBY_FULL"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_LOBBY_FULL"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_NETWORK_MODE_MISMATCH then
		f104_local0.debug = f104_local0.debug .. "NETWORK_MODE_MISMATCH"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NETWORK_MODE_MISMATCH"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLISTID then
		f104_local0.debug = f104_local0.debug .. "MISMATCH_PLAYLISTID"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLISTID"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW then
		f104_local0.debug = f104_local0.debug .. "MISMATCH_PLAYLIST_VERSION_TO_NEW"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD then
		f104_local0.debug = f104_local0.debug .. "MISMATCH_PLAYLIST_VERSION_TO_OLD"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PROTOCOL_VERSION then
		f104_local0.debug = f104_local0.debug .. "MISMATCH_PROTOCOL_VERSION"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PROTOCOL_VERSION"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM then
		f104_local0.debug = f104_local0.debug .. "MISMATCH_NETFIELD_CHECKSUM"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_NEW then
		f104_local0.debug = f104_local0.debug .. "MISMATCH_FFOTD_VERSION_TO_NEW"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_OLD then
		f104_local0.debug = f104_local0.debug .. "MISMATCH_FFOTD_VERSION_TO_OLD"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_MIGRATE_IN_PROGRESS then
		f104_local0.debug = f104_local0.debug .. "MIGRATE_IN_PROGRESS"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MIGRATE_IN_PROGRESS"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_COULD_NOT_RESERVE then
		f104_local0.debug = f104_local0.debug .. "COULD_NOT_RESERVE"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_COULD_NOT_RESERVE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_HANDSHAKE_WINDOW_EXPIRED then
		f104_local0.debug = f104_local0.debug .. "HANDSHAKE_WINDOW_EXPIRED"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_AGREEMENT_WINDOW_EXPIRED then
		f104_local0.debug = f104_local0.debug .. "AGREEMENT_WINDOW_EXPIRED"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_NOT_IDLE then
		f104_local0.debug = f104_local0.debug .. "NOT_JOINABLE_NOT_IDLE"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS then
		f104_local0.debug = f104_local0.debug .. "NO_JOIN_IN_PROGRESS"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_GAME_PAUSED then
		f104_local0.debug = f104_local0.debug .. "GAME_PAUSED"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_PAUSED"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED then
		f104_local0.debug = f104_local0.debug .. "CHUNK_MP_REQUIRED"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MP_REQUIRED"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED then
		f104_local0.debug = f104_local0.debug .. "CHUNK_ZM_REQUIRED"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_ZM_REQUIRED"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED then
		f104_local0.debug = f104_local0.debug .. "CHUNK_CP_REQUIRED"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_CP_REQUIRED"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED_HOST then
		f104_local0.debug = f104_local0.debug .. "CHUNK_MP_REQUIRED_HOST"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_MP_REQUIRED_HOST"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED_HOST then
		f104_local0.debug = f104_local0.debug .. "CHUNK_ZM_REQUIRED_HOST"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_ZM_REQUIRED_HOST"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED_HOST then
		f104_local0.debug = f104_local0.debug .. "CHUNK_CP_REQUIRED_HOST"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_CP_REQUIRED_HOST"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED then
		f104_local0.debug = f104_local0.debug .. "JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED"
		f104_local0.errorMsg = "MENU_SPLITSCREEN_NOT_ALLOWED"
	elseif f104_arg0 == Enum.JoinResult.JOIN_RESULT_BAD_DLC_BITS then
		f104_local0.debug = f104_local0.debug .. "JOIN_RESULT_BAD_DLC_BITS"
		f104_local0.errorMsg = "PLATFORM_MISSINGMAP"
	else
		f104_local0.debug = f104_local0.debug .. "UNHANDLED JOINRESULT ENUM(" .. tostring( f104_arg0 ) .. ")"
		f104_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	end
	return f104_local0
end

LobbyVM.ClearLobbyStatus = function ()
	if LobbyVM.lobbyStatus.cleared == true then
		return 
	elseif LobbyVM.lobbyStatus.clearedTime > Engine.milliseconds() then
		return 
	else
		LobbyVM.lobbyStatus.cleared = true
		local f105_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local f105_local1 = Engine.CreateModel( f105_local0, "lobbyStatusString1" )
		local f105_local2 = Engine.CreateModel( f105_local0, "lobbyStatusString2" )
		local f105_local3 = Engine.CreateModel( f105_local0, "lobbyStatusString3" )
		Engine.SetModelValue( f105_local1, "" )
		Engine.SetModelValue( f105_local2, "" )
		Engine.SetModelValue( f105_local3, "" )
	end
end

LobbyVM.LobbyStatusUpdate = function ( f106_arg0 )
	local f106_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local f106_local1 = Engine.CreateModel( f106_local0, "lobbyStatusString1" )
	local f106_local2 = Engine.CreateModel( f106_local0, "lobbyStatusString2" )
	local f106_local3 = Engine.CreateModel( f106_local0, "lobbyStatusString3" )
	LobbyVM.lobbyStatus.cleared = false
	LobbyVM.lobbyStatus.clearedTime = Engine.milliseconds() + 10000
	local f106_local4 = f106_arg0.searchStage
	local f106_local5 = ""
	if f106_local4 == 1 then
		local f106_local6 = f106_arg0.numResults
		if f106_local6 == 1 then
			f106_local5 = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE_SINGLE" )
		else
			f106_local5 = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE", f106_local6 )
		end
		Engine.SetModelValue( f106_local1, f106_local5 )
		Engine.SetModelValue( f106_local2, "" )
		Engine.SetModelValue( f106_local3, "" )
	elseif f106_local4 == 2 then
		Engine.SetModelValue( f106_local2, Engine.Localize( "MENU_SESSIONS_QOS_PROGRESS", f106_arg0.contactedResults, f106_arg0.numResults ) )
	elseif f106_local4 == 3 then
		Engine.SetModelValue( f106_local3, Engine.Localize( "MENU_SESSIONS_JOINING", f106_arg0.joiningCurHost, f106_arg0.joiningNumHosts ) )
	end
end

LobbyVM.DoChunksAllowJoin = function ( f107_arg0, f107_arg1 )
	if f107_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		if not f107_arg0.chunkMP then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED
		elseif Engine.IsMpStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED_HOST
		end
	elseif f107_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		if not f107_arg0.chunkZM then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED
		elseif Engine.IsZmStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED_HOST
		end
	elseif f107_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if not f107_arg0.chunkCP then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED
		elseif Engine.IsCpStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED_HOST
		end
	end
	return Enum.JoinResult.JOIN_RESULT_SUCCESS
end

LobbyVM.IsInTheaterLobby = function ()
	local f108_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if f108_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return true
	else
		return false
	end
end

LobbyVM.JoinableCheck = function ( f109_arg0 )
	local f109_local0 = f109_arg0.joinRequest
	local f109_local1 = f109_arg0.joinResponse
	if f109_local1.response == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		if Engine.IsCampaignGame() and Engine.IsInGame() and Dvar.cl_paused:get() == 1 then
			return Enum.JoinResult.JOIN_RESULT_GAME_PAUSED
		elseif Engine.IsMultiplayerGame() and LuaUtils.IsArenaMode() then
			if (Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1) or Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1 then
				if f109_arg0.joinRequest.splitscreenClients ~= nil and f109_arg0.joinRequest.splitscreenClients > 0 then
					return Enum.JoinResult.JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED
				elseif Engine.IsInGame() and Engine.SessionMode_IsPublicOnlineGame() then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				end
			end
			if Lobby.Timer.LobbyIsLocked() then
				return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
			end
		end
		if Engine.IsZombiesGame() then
			local f109_local2 = false
			if Dvar.zm_private_rankedmatch:get() then
				f109_local2 = true
			end
			if LobbyVM.IsInTheaterLobby() then
				return Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED
			elseif Engine.IsInGame() and Engine.SessionMode_IsOnlineGame() and f109_local2 then
				return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
			elseif Engine.IsInGame() and Engine.SessionMode_IsPublicOnlineGame() then
				return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
			end
		end
		if Engine.IsInGame() then
			local f109_local2 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			if not LobbyVM.CheckDLCBit( f109_arg0.joinRequest.dlcBits, Engine.GetDLCBitForMapName( Dvar.ui_mapname:get() ) ) then
				return Enum.JoinResult.JOIN_RESULT_BAD_DLC_BITS
			end
		end
		local f109_local2 = Engine.GetLobbyMainMode()
		if Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() then
			if not f109_arg0.isLocalRequest then
				if f109_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
					local f109_local3 = LobbyVM.DoChunksAllowJoin( f109_local0, f109_local2 )
					if f109_local3 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
						return f109_local3
					end
				elseif f109_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
					for f109_local3 = 0, Enum.LobbyMainMode.LOBBY_MAINMODE_COUNT - 1, 1 do
						local f109_local6 = LobbyVM.DoChunksAllowJoin( f109_local0, f109_local3 )
						if f109_local6 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
							return f109_local6
						end
					end
				end
			end
		elseif not f109_arg0.isLocalRequest then
			local f109_local3 = LobbyVM.DoChunksAllowJoin( f109_local0, f109_local2 )
			if f109_local3 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
				return f109_local3
			end
		end
	end
	return f109_local1.response
end

LobbyVM.ProcessCompleteSuccess = function ( f110_arg0 )
	Lobby.ProcessQueue.Success( f110_arg0 )
end

LobbyVM.ProcessCompleteFailure = function ( f111_arg0 )
	Lobby.ProcessQueue.Failure( f111_arg0 )
end

LobbyVM.ProcessCompleteError = function ( f112_arg0 )
	Lobby.ProcessQueue.Error( f112_arg0 )
end

LobbyVM.ProcessUpdate = function ( f113_arg0 )
	Lobby.ProcessQueue.Update( f113_arg0 )
end

LobbyVM.GameLobbyGameServerDataUpdate = function ( f114_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" ), "name" ), Engine.ToUpper( Engine.GetPlaylistName( 0, Engine.GetPlaylistID() ) ) )
	Lobby.MapVote.GameLobbyGameServerDataUpdate( f114_arg0 )
end

LobbyVM.GameLobbyClientDataUpdate = function ( f115_arg0 )
	Lobby.MapVote.GameLobbyClientDataUpdate( f115_arg0 )
	Lobby.TeamSelection.GameLobbyClientDataUpdate( f115_arg0 )
	Lobby.Pregame.GameLobbyClientDataUpdate( f115_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
end

LobbyVM.HopperClientJoin = function ( f116_arg0 )
	return Lobby.Hopper.ClientJoin( f116_arg0 )
end

LobbyVM.HopperIsParked = function ()
	return Lobby.Hopper.IsParked()
end

LobbyVM.OnDediQosReady = function ()
	local f118_local0 = Engine.GetDediQosResultsByType( Lobby.Matchmaking.DatacenterType.GAMESERVERS )
	if f118_local0.numResults == 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Engine told us results were ready, but no results available\n" )
	else
		servers = f118_local0.pingResults
		for f118_local4, f118_local5 in ipairs( servers ) do
			LuaUtils.LogQoS( "dediqos", f118_local5 )
		end
	end
end

LobbyVM.PopulateMutableClientDDLBuff = function ( f119_arg0 )
	local f119_local0 = f119_arg0.controller
	local f119_local1 = f119_arg0.ddlData
end

LobbyVM.ReceiveMutableClientDDLBuff = function ( f120_arg0 )
	local f120_local0 = f120_arg0.xuid
	local f120_local1 = f120_arg0.ddlData
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
	Lobby.Pregame.Pump,
	Lobby.ProcessQueue.Pump,
	Lobby.TeamSelection.Pump,
	Lobby.Theater.Pump,
	Lobby.Timer.Pump
}
LobbyVM.Pump = function ()
	LobbyVM.LobbyPumpList.sequence = math.fmod( LobbyVM.LobbyPumpList.sequence, #LobbyVM.LobbyPumpList.funcs )
	LobbyVM.LobbyPumpList.sequence = LobbyVM.LobbyPumpList.sequence + 1
	LobbyVM.LobbyPumpList.funcs[LobbyVM.LobbyPumpList.sequence]()
	if LobbyVM.AutoJoin.leaveServerImmediately == true then
		LobbyVM.AutoJoin.leaveServerImmediately = false
		Engine.LeaveServerImmediately()
	end
end

LobbyVM.OnEnableJoins = function ( f122_arg0 )
	if f122_arg0.enable then
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
	else
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_PAUSED )
	end
end

LobbyVM.OnStorageOperationReadResult = function ( f123_arg0 )
	Lobby.Anticheat.OnStorageOperationReadResult( f123_arg0 )
end

LobbyVM.OnIsFeatureBanned = function ( f124_arg0 )
	local f124_local0, f124_local1 = Lobby.Anticheat.CheckIsFeatureBannedForIndex( f124_arg0.controller, f124_arg0.feature )
	return f124_local0
end

LobbyVM.OnPlayerBanned = function ( f125_arg0 )
	Lobby.Anticheat.OnPlayerBanned( f125_arg0 )
end

LobbyVM.OnFeatureBan = function ( f126_arg0 )
	Lobby.Anticheat.OnFeatureBan( f126_arg0 )
end

LobbyVM.OnCheckPrestigeFeatureBan = function ( f127_arg0 )
	Lobby.Anticheat.OnCheckPrestigeFeatureBan( f127_arg0 )
end

LobbyVM.OnIsPermaBanned = function ( f128_arg0 )
	return Lobby.Anticheat.OnIsPermaBanned( f128_arg0 )
end

LobbyVM.OnGetBanTimeRemaining = function ( f129_arg0 )
	return Lobby.Anticheat.OnGetBanTimeRemaining( f129_arg0 )
end

LobbyVM.OnPushAnticheatMessageToUI = function ( f130_arg0 )
	return Lobby.Anticheat.OnPushAnticheatMessageToUI( f130_arg0 )
end

LobbyVM.OnPopAnticheatMessage = function ( f131_arg0 )
	Lobby.Anticheat.OnPopAnticheatMessage( f131_arg0 )
end

LobbyVM.OnGetAnticheatReputation = function ( f132_arg0 )
	return Lobby.Anticheat.OnGetAnticheatReputation( f132_arg0 )
end

