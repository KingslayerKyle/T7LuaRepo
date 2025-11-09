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
require( "lua.Lobby.LobbySteam" )
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
	Lobby.Steam.OnSessionStart( f12_arg0 )
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
	Lobby.Steam.OnSessionEnd( f13_arg0 )
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
	Lobby.Steam.OnClientAdded( f14_arg0 )
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
	Lobby.Steam.OnClientRemoved( f15_arg0 )
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
	Lobby.Steam.OnMatchStart( f16_arg0 )
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

LobbyVM.OnMatchChangeGameType = function ( f18_arg0 )
	Lobby.Steam.OnMatchChangeGameType( f18_arg0 )
end

LobbyVM.OnMatchChangeMap = function ( f19_arg0 )
	local f19_local0 = f19_arg0.lobbyModule
	local f19_local1 = f19_arg0.lobbyType
	local f19_local2 = f19_arg0.lobbyMode
	Lobby.Stats.OnMatchChangeMap( f19_arg0 )
	Lobby.Matchmaking.OnMatchChangeMap( f19_arg0 )
	Lobby.Steam.OnMatchChangeMap( f19_arg0 )
	LuaUtils.LogQoS( "match_change_map", f19_arg0 )
end

LobbyVM.OnMatchEnd = function ( f20_arg0 )
	local f20_local0 = f20_arg0.lobbyModule
	local f20_local1 = f20_arg0.lobbyType
	local f20_local2 = f20_arg0.lobbyMode
	local f20_local3 = Engine.GetLobbyUIScreen()
	if f20_local3 == LobbyData.UITargets.UI_CPLOBBYLANCUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CPLOBBYLANGAME
		} )
	elseif f20_local3 == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CPLOBBYONLINE
		} )
	elseif f20_local3 == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CPLOBBYONLINE
		} )
	elseif f20_local3 == LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CP2LOBBYLANGAME
		} )
	elseif f20_local3 == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CP2LOBBYONLINE
		} )
	elseif f20_local3 == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_CP2LOBBYONLINE
		} )
	elseif f20_local3 == LobbyData.UITargets.UI_DOALOBBYLANCUSTOMGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_DOALOBBYLANGAME
		} )
	elseif f20_local3 == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id then
		LobbyVM.UpdateUI( {
			toTarget = LobbyData.UITargets.UI_DOALOBBYONLINE
		} )
	end
	Lobby.TeamSelection.OnMatchEnd( f20_arg0 )
	Lobby.Timer.OnMatchEnd( f20_arg0 )
	Lobby.Analytics.OnMatchEnd( f20_arg0 )
	Lobby.Matchmaking.OnMatchEnd( f20_arg0 )
	Lobby.Platform.OnMatchEnd( f20_arg0 )
	Lobby.Debug.OnMatchEnd( f20_arg0 )
	Lobby.Steam.OnMatchEnd( f20_arg0 )
	LuaUtils.BuyWeaponContractIfNeededAfterMatch()
	LuaUtils.BuySpecialContractRewardsIfNeededAfterMatch()
	LuaUtils.SaveAfterMatchContractStats()
	LuaUtils.CycleContracts()
	LuaUtils.ResetToLastSelectedSpecialistIfNeededAfterMatch()
end

LobbyVM.OnMatchRecordStart = function ( f21_arg0 )
	LuaUtils.LogQoS( "match_record", f21_arg0 )
end

LobbyVM.OnLobbyServerListRetrieved = function ( f22_arg0 )
	Lobby.Steam.OnLobbyServerListRetrieved( f22_arg0 )
end

LobbyVM.OnLobbyServerCountUpdated = function ( f23_arg0 )
	Lobby.Steam.OnLobbyServerCountUpdated( f23_arg0 )
end

LobbyVM.OnLobbyServerListSorted = function ( f24_arg0 )
	Lobby.Steam.OnLobbyServerListSorted( f24_arg0 )
end

LobbyVM.ShouldShowContentChangedMessage = function ( f25_arg0, f25_arg1 )
	if LobbyVM.CheckDLCBit( Engine.GetDLCBits(), Engine.GetDLCBitForMapName( Dvar.ui_mapname:get() ) ) then
		return true
	else
		return false
	end
end

LobbyVM.OnDisconnect = function ( f26_arg0 )
	local f26_local0 = f26_arg0.lobbyModule
	local f26_local1 = f26_arg0.lobbyType
	local f26_local2 = f26_arg0.lobbyMode
	local f26_local3 = f26_arg0.disconnectClientXuid
	local f26_local4 = f26_arg0.disconnectClient
	local f26_local5 = Engine.GetPrimaryController()
	local f26_local6 = true
	local f26_local7 = nil
	local f26_local8 = f26_arg0.errorMsg
	if not f26_local8 then
		f26_local8 = Engine.Localize( "EXE_DISCONNECTED_FROM_SERVER" )
	end
	local f26_local9 = Lobby.Process.Recover( f26_local5 )
	if f26_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_INVALID then
		
	elseif f26_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_DROP then
		
	elseif f26_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_NOPARTYCHAT then
		f26_local6 = false
		f26_local7 = Engine.Localize( "MENU_NOTICE" )
		f26_local8 = Engine.Localize( "PLATFORM_PARTYCHATNOTALLOWED" )
		Dvar.partyChatDisallowed:set( false )
	elseif f26_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK then
		f26_local6 = false
		f26_local7 = Engine.Localize( "EXE_KICKED_FROM_PARTY_WARNING_TITLE" )
		f26_local8 = Engine.Localize( "EXE_KICKED_FROM_PARTY_WARNING" )
	elseif f26_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_MISSING_CONTENT then
		Engine.ComError( Enum.errorCode.ERROR_DROP, f26_local8 )
	elseif f26_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_BADDLC then
		if LobbyVM.ShouldShowContentChangedMessage( f26_local5, f26_local1 ) then
			Engine.ComError( Enum.errorCode.ERROR_DROP, "MENU_NEW_DLC_AVAILABLE" )
		else
			Engine.ComError( Enum.errorCode.ERROR_DROP, "PLATFORM_MISSINGMAP" )
		end
	elseif f26_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_HOSTRELOAD then
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) and not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			Lobby.ProcessQueue.AddToQueue( "ReloadGameLobby", Lobby.ProcessNavigate.ReloadGameLobby( f26_local5, math.random( Engine.DvarInt( 0, "arena_lobbyReloadSearchDelayMin" ), Engine.DvarInt( 0, "arena_lobbyReloadSearchDelayMax" ) ) ) )
		end
		return 
	elseif f26_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_ERROR then
		f26_local8 = Engine.Localize( "EXE_DISCONNECTED_FROM_SERVER_ERROR" )
	end
	if f26_local6 == true then
		f26_local9.tail.success = Lobby.Actions.ErrorPopupMsg( f26_local8, f26_local7 )
	else
		f26_local9.tail.success = Lobby.Actions.WarningPopupMsg( f26_local8, f26_local7 )
	end
	Lobby.ProcessQueue.AddToQueue( "DisconnectFromHost", f26_local9 )
end

LobbyVM.OnLobbyOnlineUpdate = function ( f27_arg0 )
	Lobby.Matchmaking.OnLobbyOnlineUpdate( f27_arg0 )
end

LobbyVM.OnLeaveWithParty = function ( f28_arg0 )
	local f28_local0 = f28_arg0.lobbyModule
	local f28_local1 = f28_arg0.lobbyType
	local f28_local2 = f28_arg0.lobbyMode
	LobbyVM.LobbyLeaveWithParty( f28_arg0 )
end

LobbyVM.OnGametypeSettingsChange = function ( f29_arg0 )
	local f29_local0 = f29_arg0.lobbyModule
	local f29_local1 = f29_arg0.lobbyType
	local f29_local2 = f29_arg0.lobbyMode
	Lobby.TeamSelection.OnGametypeSettingsChange( f29_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
end

LobbyVM.OnPartyPrivacyChange = function ( f30_arg0 )
	local f30_local0 = f30_arg0.lobbyType
	local f30_local1 = f30_arg0.partyPrivacy
	Lobby.Steam.OnPartyPrivacyChange( f30_arg0 )
end

LobbyVM.OnSessionModeChanged = function ( f31_arg0 )
	Lobby.Steam.OnSessionModeChanged( f31_arg0 )
end

LobbyVM.OnMaxClientsChanged = function ( f32_arg0 )
	Lobby.Steam.OnMaxClientsChanged( f32_arg0 )
end

LobbyVM.OnPlatformSessionDataUpdate = function ( f33_arg0 )
	Lobby.Platform.OnPlatformSessionDataUpdate( f33_arg0 )
end

LobbyVM.ComErrorCodeToString = function ( f34_arg0 )
	if f34_arg0 == Enum.errorCode.ERROR_NONE then
		return "ERR_NONE"
	elseif f34_arg0 == Enum.errorCode.ERROR_FATAL then
		return "ERR_FATAL"
	elseif f34_arg0 == Enum.errorCode.ERROR_DROP then
		return "ERR_DROP"
	elseif f34_arg0 == Enum.errorCode.ERROR_FROM_STARTUP then
		return "ERR_FROM_STARTUP"
	elseif f34_arg0 == Enum.errorCode.ERROR_SERVERDISCONNECT then
		return "ERR_SERVERDISCONNECT"
	elseif f34_arg0 == Enum.errorCode.ERROR_DISCONNECT then
		return "ERR_DISCONNECT"
	elseif f34_arg0 == Enum.errorCode.ERROR_SCRIPT then
		return "ERR_SCRIPT"
	elseif f34_arg0 == Enum.errorCode.ERROR_SCRIPT_DROP then
		return "ERR_SCRIPT_DROP"
	elseif f34_arg0 == Enum.errorCode.ERROR_LOCALIZATION then
		return "ERR_LOCALIZATION"
	elseif f34_arg0 == Enum.errorCode.ERROR_UI then
		return "ERR_UI"
	elseif f34_arg0 == Enum.errorCode.ERROR_LUA then
		return "ERR_LUA"
	elseif f34_arg0 == Enum.errorCode.ERROR_SOFTRESTART then
		return "ERR_SOFTRESTART"
	elseif f34_arg0 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
		return "ERR_SOFTRESTART_KEEPDW"
	elseif f34_arg0 == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return "ERR_SOFTRESTART_SILENT"
	else
		return tostring( f34_arg0 )
	end
end

LobbyVM.OnComError = function ( f35_arg0 )
	Lobby.Platform.OnComError( f35_arg0 )
	if f35_arg0.isInCleanup then
		LobbyVM.OnComErrorCleanup( f35_arg0 )
		return 
	end
	local f35_local0 = f35_arg0.controller
	local f35_local1 = f35_arg0.errorCode
	local f35_local2 = f35_arg0.errorMsg
	local f35_local3 = f35_arg0.signoutUsers
	local f35_local4 = f35_arg0.comErrorInProgress
	Lobby.Debug.OnComError( f35_arg0 )
	Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "COM ERROR - errorCode: " .. LobbyVM.ComErrorCodeToString( f35_local1 ) .. ", errorMsg: " .. f35_local2 .. ".\n" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	LuaUtils.LogQoS( "lobby_error", f35_arg0 )
	if f35_local1 == Enum.errorCode.ERROR_SOFTRESTART or f35_local1 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW or f35_local1 == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and not Engine.IsSignedInToDemonware( f35_local0 ) then
		LobbyVM.ErrorShutdown( f35_arg0 )
	end
	if f35_local1 == Enum.errorCode.ERROR_DROP then
		Lobby.Stats.OnServerTimeout( f35_local0 )
	end
	if f35_local1 == Enum.errorCode.ERROR_UI or f35_local1 == Enum.errorCode.ERROR_DISCONNECT or f35_local1 == Enum.errorCode.ERROR_FATAL or f35_local1 == Enum.errorCode.ERROR_DROP or f35_local1 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW or f35_local1 == Enum.errorCode.ERROR_SOFTRESTART_SILENT then
		return 
	elseif f35_local1 == Enum.errorCode.ERROR_NONE or f35_local1 == Enum.errorCode.ERROR_LUA or f35_local1 == Enum.errorCode.ERROR_FROM_STARTUP or f35_local1 == Enum.errorCode.ERROR_LOCALIZATION or f35_local1 == Enum.errorCode.ERROR_SERVERDISCONNECT then
		LuaUtils.UI_ShowErrorMessageDialog( f35_local0, f35_local2 )
		return 
	elseif f35_local1 == Enum.errorCode.ERROR_SCRIPT or f35_local1 == Enum.errorCode.ERROR_SCRIPT_DROP then
		LuaUtils.UI_ShowErrorMessageDialog( f35_local0, f35_local2 )
		Lobby.ProcessQueue.AddToQueue( "ErrorNonFatal", Lobby.Process.NonFatalError( f35_local2 ) )
		return 
	end
	error( "LobbyVM.OnError - Unhandled COM_ERROR: " .. LobbyVM.ComErrorCodeToString( f35_local1 ) .. ", Message: " .. f35_local2 .. ".\n" )
end

LobbyVM.ShutdownCleanupMP = function ( f36_arg0 )
	
end

LobbyVM.ShutdownCleanupZM = function ( f37_arg0 )
	
end

LobbyVM.ShutdownCleanupCP = function ( f38_arg0 )
	
end

LobbyVM.ShutdownCleanup = function ( f39_arg0 )
	Dvar.ui_gametype:set( "" )
	Dvar.ui_mapname:set( "" )
	LobbyVM.ShutdownCleanupCP( f39_arg0 )
	LobbyVM.ShutdownCleanupMP( f39_arg0 )
	LobbyVM.ShutdownCleanupZM( f39_arg0 )
end

LobbyVM.OnComErrorCleanup = function ( f40_arg0 )
	local f40_local0 = f40_arg0.controller
	local f40_local1 = f40_arg0.errorCode
	local f40_local2 = f40_arg0.errorMsg
	local f40_local3 = f40_arg0.errorShutdown
	Engine.LobbyLaunchClear()
	if f40_local3 ~= nil and f40_local3 == true then
		LobbyVM.ErrorShutdown( f40_arg0 )
		LobbyVM.ShutdownCleanup( f40_arg0 )
	end
	if f40_local1 == Enum.errorCode.ERROR_FATAL then
		LuaUtils.UI_ShowErrorMessageDialog( f40_local0, f40_local2 )
		local f40_local4 = Lobby.Process.Recover( f40_local0 )
		if f40_local4 ~= nil then
			Lobby.ProcessQueue.AddToQueue( "ErrorFatal", f40_local4 )
		end
	elseif f40_local1 == Enum.errorCode.ERROR_DROP then
		local f40_local4 = Lobby.Process.Recover( f40_local0 )
		if f40_local4 then
			local f40_local5 = Lobby.Actions.ErrorPopupMsg( f40_local2 )
			Lobby.Process.AddActions( f40_local4.tail, f40_local5, f40_local5, f40_local5 )
			Lobby.ProcessQueue.AddToQueue( "ERROR_DROP", f40_local4 )
		else
			LuaUtils.UI_ShowErrorMessageDialog( f40_local0, f40_local2 )
		end
	elseif f40_local1 == 1026 then
		Lobby.ProcessQueue.ClearQueue()
		LuaUtils.UI_ShowErrorMessageDialog( f40_local0, f40_local2 )
	elseif f40_local1 == 2050 then
		if string.len( f40_local2 ) > 0 then
			LuaUtils.UI_ShowErrorMessageDialog( f40_local0, f40_local2 )
		end
	elseif f40_local1 == 4098 and string.len( f40_local2 ) > 0 then
		LuaUtils.UI_ShowInfoMessageDialog( f40_local0, f40_local2 )
	end
end

LobbyVM.OnErrorShutdown = function ( f41_arg0 )
	LobbyVM.ErrorShutdown( f41_arg0 )
end

LobbyVM.OnStorageRead = function ( f42_arg0 )
	if f42_arg0.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", f42_arg0 )
	elseif f42_arg0.fileType == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		Lobby.Stats.OnMPOnlineStatsDownloaded( f42_arg0.controller )
	elseif f42_arg0.fileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		Lobby.Stats.ValidateLoadouts( f42_arg0.controller )
	elseif f42_arg0.fileType == Enum.StorageFileType.STORAGE_MP_CLASS_SETS then
		Lobby.Stats.ValidateLoadouts( f42_arg0.controller )
	elseif f42_arg0.fileType == Enum.StorageFileType.STORAGE_COMMON_SETTINGS then
		Lobby.Stats.OnProfileCommonStatsDownloaded( f42_arg0.controller )
	elseif f42_arg0.fileType == Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE then
		Lobby.Stats.OnZMOnlineStatsDownloaded( f42_arg0.controller )
	end
end

LobbyVM.OnStorageWrite = function ( f43_arg0 )
	if f43_arg0.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", f43_arg0 )
	elseif f43_arg0.fileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		Lobby.Stats.ValidateLoadouts( f43_arg0.controller )
	elseif f43_arg0.fileType == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		Lobby.Stats.ValidateLoadouts( f43_arg0.controller )
		Lobby.Stats.OnMPStatsUploaded( f43_arg0.controller )
	end
end

LobbyVM.OnStorageWriteDispatch = function ( f44_arg0 )
	local f44_local0 = f44_arg0.controller
end

LobbyVM.OnRecordComScoreEvent = function ( f45_arg0 )
	local f45_local0 = f45_arg0.controller
	local f45_local1 = f45_arg0.eventCategoryName
	local f45_local2 = {}
	for f45_local6, f45_local7 in pairs( f45_arg0.EventParams ) do
		table.insert( f45_local2, f45_local6 )
		table.insert( f45_local2, f45_local7 )
	end
	if #f45_local2 > 0 and #f45_local2 % 2 == 0 then
		Engine.RecordComScoreEvent( f45_local0, f45_local1, unpack( f45_local2 ) )
	end
end

LobbyVM.OnKVSFlush = function ()
	LobbyVM.LogGlobalData()
end

LobbyVM.OnPreExecFFOTD = function ()
	Lobby.Platform.OnPreExecFFOTD()
	local f47_local0 = {
		controller = Engine.GetPrimaryController(),
		signoutUsers = false
	}
	local f47_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.FFOTDShutdown" )
	Engine.SetModelValue( f47_local1, true )
	LobbyVM.ErrorShutdown( f47_local0 )
	Engine.SetModelValue( f47_local1, false )
end

LobbyVM.OnPostExecFFOTD = function ()
	LobbyVM.LogGlobalData()
	Lobby.Platform.OnPostExecFFOTD()
end

LobbyVM.OnDWDisconnect = function ( f49_arg0 )
	if not Engine.IsDedicatedServer() and f49_arg0.controller == Engine.GetPrimaryController() then
		Engine.LobbyOnlineCancel( true )
	end
end

LobbyVM.DemoEndFinished = function ( f50_arg0 )
	if LobbyVM.AutoJoin.data ~= nil then
		local f50_local0 = nil
		if LobbyVM.AutoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				if LobbyVM.AutoJoin.data.playTogether == true then
					recoverProcess = Lobby.Process.Recover( controller, LobbyData.UITargets.UI_MODESELECT.id )
					f50_local0 = Lobby.Platform.PS4ProcessPlayTogetherEvent( LobbyVM.AutoJoin.data.platformData )
				else
					f50_local0 = Lobby.Platform.InGamePlatformJoinOrbis( LobbyVM.AutoJoin.data.platformData )
				end
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				f50_local0 = Lobby.Platform.InGamePlatformJoinDurango( LobbyVM.AutoJoin.data.platformData )
			end
		else
			f50_local0 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		end
		if f50_local0 ~= nil then
			Lobby.ProcessQueue.AddToQueue( "DemoEnd", f50_local0 )
		end
		LobbyVM.AutoJoin.data = nil
	end
end

LobbyVM.OnLimitedItemPromoUpdate = function ( f51_arg0 )
	local f51_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "LimitedItemPromo" ), "itemCount" )
	local f51_local1 = f51_arg0.count
	local f51_local2 = Engine.DvarInt( nil, "loot_limitedItemPromo_override_count" )
	if f51_local2 > -1 then
		f51_local1 = f51_local2
	end
	Engine.SetModelValue( f51_local0, f51_arg0.count )
end

LobbyVM.Gunsmith = {}
LobbyVM.Gunsmith.InitializeBuffer = function ( f52_arg0 )
	local f52_local0 = #f52_arg0.variant
	for f52_local1 = 0, f52_local0 - 1, 1 do
		local f52_local4 = f52_arg0.variant[f52_local1]
		f52_local4.variantIndex:set( f52_local1 )
		f52_local4.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f52_local4.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

LobbyVM.Gunsmith.ClearBuffer = function ( f53_arg0 )
	local f53_local0 = #f53_arg0.variant
	for f53_local1 = 0, f53_local0 - 1, 1 do
		local f53_local4 = f53_arg0.variant[f53_local1]
		f53_local4.variantName:set( "" )
		local f53_local5 = #f53_local4.attachment
		for f53_local6 = 0, f53_local5 - 1, 1 do
			f53_local4.attachment[f53_local6]:set( 0 )
		end
		local f53_local6 = #f53_local4.attachmentVariant
		for f53_local7 = 0, f53_local6 - 1, 1 do
			f53_local4.attachmentVariant[f53_local7]:set( 0 )
		end
		f53_local4.reticleIndex:set( 0 )
		f53_local4.camoIndex:set( 0 )
		f53_local4.paintjobSlot:set( 0 )
		f53_local4.paintjobIndex:set( 0 )
		f53_local4.weaponIndex:set( 0 )
		f53_local4.variantIndex:set( 0 )
		f53_local4.sortIndex:set( 0 )
		f53_local4.readOnly:set( 0 )
		f53_local4.createTime:set( 0 )
	end
end

LobbyVM.InitilizeGunsmithBuffer = function ( f54_arg0 )
	local f54_local0 = f54_arg0.controller
	Engine.StorageReset( f54_local0, Enum.StorageFileType.STORAGE_GUNSMITH )
	LobbyVM.Gunsmith.InitializeBuffer( Engine.StorageGetBuffer( f54_local0, Enum.StorageFileType.STORAGE_GUNSMITH ) )
	Engine.StorageWrite( f54_local0, Enum.StorageFileType.STORAGE_GUNSMITH )
end

LobbyVM.InitilizeZMLoadoutBuffer = function ( f55_arg0 )
	local f55_local0 = Engine.StorageGetBuffer( f55_arg0.controller, f55_arg0.storageFileType )
	if f55_local0 then
		local f55_local1 = f55_local0.cacLoadouts
		if f55_local1 then
			LobbyVM.Gunsmith.ClearBuffer( f55_local1 )
			LobbyVM.Gunsmith.InitializeBuffer( f55_local1 )
		end
	end
end

LobbyVM.OnInitializeStats = function ( f56_arg0 )
	local f56_local0 = f56_arg0.controller
	local f56_local1 = f56_arg0.storageFileType
	if f56_local1 == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		local f56_local2 = Engine.StorageGetBuffer( f56_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		f56_local2 = f56_local2.itemStats
		if f56_local2 then
			for f56_local3 = 1, 255, 1 do
				if Engine.ItemIndexValid( f56_local3, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemUnlockLevel( f56_local3, Enum.eModes.MODE_MULTIPLAYER ) == 0 and not Engine.ItemIndexIsBlackMarket( f56_local3, Enum.eModes.MODE_MULTIPLAYER ) then
					f56_local2[f56_local3].markedOld:set( 1 )
				end
				f56_local2[f56_local3].attachmentMarkedOld.gmod6:set( 1 )
				f56_local2[f56_local3].attachmentMarkedOld.gmod7:set( 1 )
			end
		end
	elseif f56_local1 == Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE then
		local f56_local2 = Engine.StorageGetBuffer( f56_local0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		f56_local2 = f56_local2.itemStats
		if f56_local2 then
			for f56_local3 = 1, 255, 1 do
				if Engine.ItemIndexValid( f56_local3, Enum.eModes.MODE_ZOMBIES ) and Engine.GetItemUnlockLevel( f56_local3, Enum.eModes.MODE_ZOMBIES ) == 0 and Engine.GetDLCNameForItem( f56_local3, Enum.eModes.MODE_ZOMBIES ) == nil then
					f56_local2[f56_local3].markedOld:set( 1 )
				end
			end
		end
	end
end

LobbyVM.SetDefaultShowcaseWeapon = function ( f57_arg0, f57_arg1 )
	local f57_local0 = Engine.GetItemIndexFromReference( "ar_standard", f57_arg1 )
	for f57_local1 = 0, #f57_arg0.characters - 1, 1 do
		local f57_local4 = f57_arg0.characters[f57_local1].showcaseWeapon
		f57_local4.weaponIndex:set( f57_local0 )
		f57_local4.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f57_local4.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

LobbyVM.OnInitializeLoadouts = function ( f58_arg0 )
	local f58_local0 = f58_arg0.controller
	local f58_local1 = f58_arg0.storageFileType
	local f58_local2 = f58_arg0.statsNetworkType
	if f58_local1 == Enum.StorageFileType.STORAGE_ZM_LOADOUTS then
		local f58_local3 = Engine.StorageGetBuffer( f58_local0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		f58_local3 = f58_local3.cacLoadouts
		LobbyVM.Gunsmith.InitializeBuffer( f58_local3 )
		f58_local3.characterContext.characterIndex:set( 6 )
		LobbyVM.SetDefaultShowcaseWeapon( f58_local3, Enum.eModes.MODE_ZOMBIES )
	elseif f58_local1 == Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE then
		local f58_local3 = Engine.StorageGetBuffer( f58_local0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
		f58_local3 = f58_local3.cacLoadouts
		LobbyVM.Gunsmith.InitializeBuffer( f58_local3 )
		f58_local3.characterContext.characterIndex:set( 6 )
		LobbyVM.SetDefaultShowcaseWeapon( f58_local3, Enum.eModes.MODE_ZOMBIES )
	elseif f58_local1 == Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE then
		local f58_local3 = Engine.StorageGetBuffer( f58_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
		f58_local3 = f58_local3.cacLoadouts
		LobbyVM.SetDefaultShowcaseWeapon( f58_local3, Enum.eModes.MODE_MULTIPLAYER )
		local f58_local4 = Engine.GetEquippedHeroForCACType( f58_local0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_OFFLINE )
		if f58_local4 then
			local f58_local5 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f58_local4, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if f58_local3 and f58_local3.heroweapon then
				f58_local3.heroweapon:set( f58_local5 )
			end
		end
	elseif f58_local1 == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		local f58_local3 = Engine.StorageGetBuffer( f58_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f58_local3 = f58_local3.cacLoadouts
		local f58_local4 = Engine.StorageGetBuffer( f58_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f58_local4 = f58_local4.customMatchCacLoadouts
		local f58_local5 = Engine.StorageGetBuffer( f58_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f58_local5 = f58_local5.leagueCacLoadouts
		LobbyVM.SetDefaultShowcaseWeapon( f58_local3, Enum.eModes.MODE_MULTIPLAYER )
		LobbyVM.SetDefaultShowcaseWeapon( f58_local4, Enum.eModes.MODE_MULTIPLAYER )
		LobbyVM.SetDefaultShowcaseWeapon( f58_local5, Enum.eModes.MODE_MULTIPLAYER )
		local f58_local6 = Engine.GetEquippedHeroForCACType( f58_local0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC )
		if f58_local6 then
			local f58_local7 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f58_local6, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if f58_local3 and f58_local3.heroweapon then
				f58_local3.heroweapon:set( f58_local7 )
			end
			if f58_local4 and f58_local4.heroweapon then
				f58_local4.heroweapon:set( f58_local7 )
			end
		end
		if f58_local3 then
			local f58_local8 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
			for f58_local9 = 0, #f58_local8 - 1, 1 do
				if f58_local3.characters[f58_local9].itemList then
					f58_local3.characters[f58_local9].itemList.body.items[0].markedOld:set( 1 )
					f58_local3.characters[f58_local9].itemList.helmet.items[0].markedOld:set( 1 )
				end
				if f58_local3.characters[f58_local9].tauntMarkedOld and f58_local3.characters[f58_local9].tauntMarkedOld.first_place and f58_local3.characters[f58_local9].tauntMarkedOld.first_place.markedOld then
					f58_local3.characters[f58_local9].tauntMarkedOld.first_place.markedOld[0]:set( 1 )
				end
			end
		end
	elseif f58_local1 == Enum.StorageFileType.STORAGE_CP_LOADOUTS then
		local f58_local3 = Engine.StorageGetBuffer( f58_local0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
		f58_local3 = f58_local3.cacLoadouts
		LobbyVM.SetDefaultShowcaseWeapon( f58_local3, Enum.eModes.MODE_CAMPAIGN )
		if f58_local3 then
			local f58_local5 = Engine.GetHeroList( Enum.eModes.MODE_CAMPAIGN )
			for f58_local6 = 0, #f58_local5 - 1, 1 do
				if f58_local3.characters[f58_local6].itemList then
					f58_local3.characters[f58_local6].itemList.body.items[0].markedOld:set( 1 )
					f58_local3.characters[f58_local6].itemList.helmet.items[0].markedOld:set( 1 )
					f58_local3.characters[f58_local6].itemList.helmet.items[1].markedOld:set( 1 )
				end
			end
		end
	elseif f58_local1 == Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE then
		local f58_local3 = Engine.StorageGetBuffer( f58_local0, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
		LobbyVM.SetDefaultShowcaseWeapon( f58_local3.cacLoadouts, Enum.eModes.MODE_CAMPAIGN )
	end
end

LobbyVM.LobbyHostLeftNoMigration = function ( f59_arg0 )
	local f59_local0 = f59_arg0.controller
	local f59_local1 = f59_arg0.lobbyType
	local f59_local2 = f59_arg0.lobbyMainMode
	local f59_local3 = f59_arg0.lobbyNetworkMode
	local f59_local4 = f59_arg0.maxClients
	local f59_local5 = f59_arg0.isGameLobbyActive
	local f59_local6 = f59_arg0.isPrivateHost
	if not LobbyVM.CanClientLaunch( f59_arg0 ) then
		return 
	elseif Engine.IsLobbyInRecovery( f59_local1 ) then
		return 
	elseif f59_local5 == true and f59_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		if Lobby.ProcessQueue.GetCurrentRunningProcessName() ~= "HostLeftNoMigrationGame" then
			Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigrationGame", Lobby.Process.Recover( f59_local0 ) )
		end
	else
		Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigration", Lobby.Process.HostLeftNoMigrationCreatePrivateLobby( f59_local0, f59_local2, f59_local4 ) )
	end
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "host_left_no_migration", f59_arg0 )
end

LobbyVM.LobbyHostLeft_InGameMigrateFinished = function ( f60_arg0 )
	local f60_local0 = f60_arg0.controller
	local f60_local1 = Lobby.Process.Recover( f60_local0 )
	if LobbyVM.AutoJoin.data ~= nil then
		local f60_local2 = nil
		if LobbyVM.AutoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				if LobbyVM.AutoJoin.data.playTogether == true then
					f60_local1 = Lobby.Process.Recover( f60_local0, LobbyData.UITargets.UI_MODESELECT.id )
					f60_local2 = Lobby.Platform.PS4ProcessPlayTogetherEvent( LobbyVM.AutoJoin.data.platformData )
				else
					f60_local2 = Lobby.Platform.InGamePlatformJoinOrbis( LobbyVM.AutoJoin.data.platformData )
				end
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				f60_local2 = Lobby.Platform.InGamePlatformJoinDurango( LobbyVM.AutoJoin.data.platformData )
			end
		else
			f60_local2 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		end
		if f60_local2 ~= nil then
			Lobby.Process.AppendProcess( f60_local1, f60_local2 )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyHostLeft_InGameMigrateFinished", f60_local1 )
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "ingame_migrate_finished", f60_arg0 )
end

LobbyVM.LobbyClientLeftEvent = function ( f61_arg0 )
	local f61_local0 = f61_arg0.controller
	local f61_local1 = f61_arg0.lobbyType
	local f61_local2 = f61_arg0.lobbyMainMode
	local f61_local3 = f61_arg0.lobbyNetworkMode
	local f61_local4 = f61_arg0.maxClients
	local f61_local5 = Lobby.Process.Recover( f61_local0 )
	if LobbyVM.AutoJoin.data ~= nil then
		local f61_local6 = nil
		if LobbyVM.AutoJoin.data.platform == true then
			if Lobby.Platform.PlatformSessionOrbisEnabled() then
				if LobbyVM.AutoJoin.data.playTogether == true then
					f61_local5 = Lobby.Process.Recover( f61_local0, LobbyData.UITargets.UI_MODESELECT.id )
					f61_local6 = Lobby.Platform.PS4ProcessPlayTogetherEvent( LobbyVM.AutoJoin.data.platformData )
				else
					f61_local6 = Lobby.Platform.InGamePlatformJoinOrbis( LobbyVM.AutoJoin.data.platformData )
				end
			elseif Lobby.Platform.PlatformSessionDurangoEnabled() then
				f61_local6 = Lobby.Platform.InGamePlatformJoinDurango( LobbyVM.AutoJoin.data.platformData )
			end
		else
			f61_local6 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		end
		if f61_local6 ~= nil then
			Lobby.Process.AppendProcess( f61_local5, f61_local6 )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyClientLeft", f61_local5 )
end

LobbyVM.Devmap = function ( f62_arg0 )
	Lobby.ProcessQueue.AddToQueue( "Devmap", Lobby.Process.Devmap( f62_arg0.controller, f62_arg0.mainMode ) )
end

LobbyVM.DevmapClient = function ( f63_arg0 )
	Lobby.ProcessQueue.AddToQueue( "DevmapClient", Lobby.Process.DevmapClient( f63_arg0.controller ) )
end

LobbyVM.MatchmakingPriorityQuit = function ( f64_arg0 )
	local f64_local0 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f64_local0.id == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f64_local0.id == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id then
		Lobby.MatchmakingPriority.AddHost( f64_arg0.hostSecId, Enum.JoinType.JOIN_TYPE_PLAYLIST )
	end
end

LobbyVM.NetworkModeChanged = function ( f65_arg0 )
	Lobby.ProcessQueue.AddToQueue( "NetworkModeChanged", Lobby.Process.ReloadPrivateLobby( f65_arg0.controller, f65_arg0.networkMode ) )
end

LobbyVM.GoForward = function ( f66_arg0 )
	if LobbyVM.IsHostLaunching() then
		return 
	end
	local f66_local0 = Engine.GetPrimaryController()
	local f66_local1 = f66_arg0.navToMenu
	local f66_local2 = f66_arg0.withParty
	local f66_local3 = f66_arg0.disbandParty
	local f66_local4 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	local f66_local5 = LobbyData:UITargetFromName( f66_local1 )
	if f66_local4 == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if f66_local5 == nil then
		error( "LobbyVM: No menu called '" .. f66_local1 .. "' found." )
	end
	local f66_local6 = Lobby.Process.GetForwardFunc( f66_local4, f66_local5 )
	if f66_local6 == nil then
		error( "LobbyVM: No forward process function found to move from '" .. f66_local4.name .. "' to '" .. f66_local1 .. "'." )
	end
	local f66_local7 = f66_local6( f66_local0, f66_local4, f66_local5 )
	if f66_local7 ~= nil and f66_local3 == true then
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
			local f66_local8 = Lobby.Process.ManagePartyLeave( f66_local0 )
			Lobby.Process.AppendProcess( f66_local8, f66_local7 )
			Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f66_local4.name .. "' menu to '" .. f66_local5.name .. "' menu AND ManagePartyLeave", f66_local8 )
		else
			local f66_local8 = Lobby.Process.ReloadPrivateLobby( f66_local0, Engine.GetLobbyNetworkMode() )
			Lobby.Process.AppendProcess( f66_local8, f66_local7 )
			Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f66_local4.name .. "' menu to '" .. f66_local5.name .. "' menu AND PartyMemberLeave", f66_local8 )
		end
		return 
	end
	Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f66_local4.name .. "' menu to '" .. f66_local5.name .. "' menu.", f66_local7 )
end

LobbyVM.GoBack = function ( f67_arg0 )
	if LobbyVM.IsHostLaunching() then
		return 
	end
	local f67_local0 = Engine.GetPrimaryController()
	local f67_local1 = f67_arg0.withParty
	local f67_local2 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f67_local2 == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	local f67_local3, f67_local4 = Lobby.Process.GetBackFunc( f67_local2 )
	if f67_local3 == nil or f67_local4 == nil then
		error( "LobbyVM: No back process function found for '" .. currentMenu( "'." ) )
	end
	Lobby.ProcessQueue.AddToQueue( "GoBackFrom" .. f67_local2.name, f67_local4( f67_local0, f67_local2, f67_local3, f67_local1 ) )
end

LobbyVM.ManagePartyLeave = function ( f68_arg0 )
	if LobbyVM.IsHostLaunching() then
		return 
	end
	local f68_local0 = f68_arg0.controller
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
		Lobby.ProcessQueue.AddToQueue( "ManagePartyLeave", Lobby.Process.ManagePartyLeave( f68_local0 ) )
	else
		Lobby.ProcessQueue.AddToQueue( "PartyMemberLeave", Lobby.Process.ReloadPrivateLobby( f68_local0, Engine.GetLobbyNetworkMode() ) )
	end
end

LobbyVM.InGameJoin = function ( f69_arg0, f69_arg1 )
	LobbyVM.AutoJoin.data = f69_arg0
	if f69_arg0.migrating ~= nil and f69_arg0.migrating == false and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
		if f69_arg1 == true then
			LobbyVM.AutoJoin.leaveServerImmediately = true
			return 
		elseif not LobbyVM.IsInTheaterLobby() then
			Engine.LeaveServerImmediately()
		end
	end
end

LobbyVM.GetJoinProcess = function ( f70_arg0 )
	local f70_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f70_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.LobbyIsPlayerInLobby( f70_local0, f70_arg0.xuid ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of\n" )
		return nil
	elseif not LuaUtils.isPC and (Engine.IsCpStillDownloading() or Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading()) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Cannot process a join when the game is still being installed.\n" )
		return nil
	else
		return Lobby.Process.Join( f70_arg0.controller, f70_arg0.xuid, f70_arg0.joinType, LuaEnums.LEAVE_WITH_PARTY.WITH )
	end
end

LobbyVM.Join = function ( f71_arg0 )
	local f71_local0 = LobbyVM.GetJoinProcess( f71_arg0 )
	if f71_local0 ~= nil then
		Lobby.ProcessQueue.AddToQueue( "Join", f71_local0 )
	end
end

LobbyVM.OnJoinComplete = function ( f72_arg0 )
	Lobby.Matchmaking.OnJoinComplete( f72_arg0 )
	Lobby.Debug.OnJoinComplete( f72_arg0 )
end

LobbyVM.JoinSystemlink = function ( f73_arg0 )
	Lobby.ProcessQueue.AddToQueue( "JoinSystemLink", Lobby.Process.JoinSystemlink( f73_arg0.controller, f73_arg0.lobbyMainMode, f73_arg0.lobbyNetworkMode, f73_arg0.hostXuid, f73_arg0.hostInfo, f73_arg0.ugcInfo ) )
end

LobbyVM.CreateDedicatedLANLobby = function ()
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLANLobby", Lobby.Process.CreateDedicatedLANLobby( 0, LobbyData.UITargets.UI_MPLOBBYLANGAME ) )
end

LobbyVM.CreateDedicatedLobby = function ( f75_arg0 )
	local f75_local0 = {}
	local f75_local1 = LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME
	if Engine.IsDedicatedServerMods() then
		f75_local1 = LobbyData.UITargets.UI_MPLOBBYONLINEMODGAME
	end
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLobby", Lobby.Process.CreateDedicatedLobby( 0, f75_local1 ) )
end

LobbyVM.CreateDedicatedModsLobby = function ( f76_arg0 )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedModsLobby", Lobby.Process.CreateDedicatedModsLobby( 0, LobbyData.UITargets.UI_MPLOBBYONLINEMODGAME ) )
end

LobbyVM.ForceToMenu = function ( f77_arg0 )
	Lobby.ProcessQueue.AddToQueue( "ForceToMenu", Lobby.Process.ForceToMenu( f77_arg0.controller, LobbyData:UITargetFromName( f77_arg0.menuName ), f77_arg0.msg ) )
end

LobbyVM.LobbyClientPromoteToHost = function ( f78_arg0 )
	Lobby.ProcessQueue.AddToQueue( "PromoteClientToHost", Lobby.Process.PromoteClientToHost( f78_arg0.controller, f78_arg0.lobbyMainMode, f78_arg0.lobbyType, f78_arg0.lobbyMode, f78_arg0.maxClients, f78_arg0.hostInfo, f78_arg0.isAdvertised, f78_arg0.isInGame, f78_arg0.newMigrateIndex ) )
end

LobbyVM.LobbyLeaveWithParty = function ( f79_arg0 )
	local f79_local0 = Lobby.Process.LeaveWithParty( f79_arg0.lobbyModule, f79_arg0.lobbyType, f79_arg0.lobbyMode )
	if f79_local0 == nil then
		return 
	else
		Lobby.ProcessQueue.AddToQueue( "LeaveWithParty", f79_local0 )
	end
end

LobbyVM.CanLobbyCanMigrate = function ( f80_arg0 )
	local f80_local0 = f80_arg0.lobbyType
	local f80_local1 = f80_arg0.lobbyMode
	if f80_local1 == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		return false
	elseif f80_local1 == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return false
	elseif Engine.IsLobbyInRecovery ~= nil and Engine.IsLobbyInRecovery( f80_local0 ) then
		return false
	else
		return true
	end
end

LobbyVM.LobbyLocalClientLeave = function ( f81_arg0 )
	if not Lobby.ProcessQueue.IsQueueEmpty() then
		return false
	else
		local f81_local0 = Lobby.Process.LocalClientLeave( f81_arg0.controller, f81_arg0.xuid )
		if f81_local0 == nil then
			return false
		else
			Lobby.ProcessQueue.AddToQueue( "LobbyLocalClientLeave", f81_local0 )
			return true
		end
	end
end

LobbyVM.SetMaxLocalPlayers = function ( f82_arg0 )
	Dvar.lobby_maxLocalPlayers:set( math.min( f82_arg0.maxLocalClients, Engine.GetMaxLocalControllers() ) )
end

LobbyVM.LobbySettings = function ( f83_arg0 )
	local f83_local0 = f83_arg0.controller
	local f83_local1 = f83_arg0.toTarget
	local f83_local2 = f83_arg0.skipSwitchMode
	local f83_local3 = f83_arg0.isDevMap
	if type( f83_local1 ) == "number" then
		f83_local1 = LobbyData:UITargetFromId( f83_local1 )
	end
	if f83_local1 == nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Tried to apply settings for an invalid target.\n" )
		return 
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Applying settings for menu: " .. f83_local1.name .. ".\n" )
	if not f83_local2 then
		local f83_local4 = Engine.GetLobbyMainMode()
		local f83_local5 = f83_local1.mainMode
		if LuaUtils.isPC then
			if f83_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP and Engine.IsCpStillDownloading() then
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "MENU_JOIN_RESULT_CP_REQUIRED" )
			end
			if f83_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP and Engine.IsMpStillDownloading() then
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "MENU_JOIN_RESULT_MP_REQUIRED" )
			end
			if f83_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM and Engine.IsZmStillDownloading() then
				Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, "MENU_JOIN_RESULT_ZM_REQUIRED" )
			end
		end
		if Engine.SwitchCampaignMode then
			if f83_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				if LuaUtils.IsCPZMTarget( f83_local1.id ) then
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES )
				else
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
				end
			else
				Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
			end
		end
		if f83_local4 ~= f83_local5 then
			if f83_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				Engine.SwitchMode( f83_local0, "mp" )
			elseif f83_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				Engine.SwitchMode( f83_local0, "cp" )
			elseif f83_local5 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
				Engine.SwitchMode( f83_local0, "zm" )
			else
				Engine.SwitchMode( f83_local0, "" )
			end
		end
	end
	if f83_local3 ~= true and f83_local1.eGameModes == Enum.eGameModes.MODE_GAME_INVALID then
		Engine.ResetGametypeSettings()
	end
	LobbyVM.SetMaxLocalPlayers( f83_local1 )
	Engine.SetLobbyMode( f83_local1.lobbyType, f83_local1.lobbyMode )
	Engine.TEMPGameModeSetMode( f83_local1.eGameModes )
end

LobbyVM.UpdateUI = function ( f84_arg0 )
	local f84_local0 = f84_arg0.toTarget
	local f84_local1 = f84_arg0.controller
	if type( f84_local0 ) == "number" then
		f84_local0 = LobbyData:UITargetFromId( f84_local0 )
	end
	local f84_local2 = function ( f85_arg0 )
		if f85_arg0 == "auto" then
			return "room2"
		else
			return f85_arg0
		end
	end
	
	LobbyData.SetLobbyNav( f84_local0 )
	Engine.SetLobbyUIScreen( f84_local0.id )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMode", true ), f84_local0.lobbyMode )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode", true ), f84_local0.mainMode )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode", true ), f84_local0.eGameModes )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room", true ), f84_local2( f84_local0.room ) )
end

LobbyVM.Leaderboard_PopulateCustomList = function ( f86_arg0 )
	return Lobby.Leaderboard.PopulateCustomList( f86_arg0 )
end

LobbyVM.Leaderboard_CalculateLBColValue = function ( f87_arg0 )
	return Lobby.Leaderboard.CalculateLBColValue( f87_arg0 )
end

LobbyVM.OnShouldWriteLeaderboard = function ( f88_arg0 )
	return Lobby.Leaderboard.OnShouldWriteLeaderboard( f88_arg0 )
end

LobbyVM.CheckDLCBit = function ( f89_arg0, f89_arg1 )
	if Engine.DvarInt( nil, "ui_freeDLC1" ) == 1 then
		f89_arg0 = f89_arg0 | Enum.ContentFlagBits.CONTENT_DLC1
	end
	if Engine.DvarInt( nil, "ui_freeDLCPC" ) == 1 and f89_arg0 & Enum.ContentFlagBits.CONTENT_DLCPC == Enum.ContentFlagBits.CONTENT_DLCPC then
		return true
	else
		return f89_arg0 & f89_arg1 == f89_arg1
	end
end

LobbyVM.LaunchGameExec = function ( f90_arg0, f90_arg1 )
	if f90_arg1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch game not supported for this lobby type(" .. f90_arg1 .. ")\n" )
		return false
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		local f90_local0 = Dvar.ui_mapname:get()
		local f90_local1 = Dvar.ui_gametype:get()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching game... **\n" )
		Engine.Exec( f90_arg0, "lobbyLaunchGame " .. f90_arg1 .. " " .. f90_local0 .. " " .. f90_local1 )
		return true
	else
		local f90_local0 = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch game. Lobby process '" .. f90_local0.name .. "' in progress.\n" )
		return false
	end
end

LobbyVM.LaunchDemoExec = function ( f91_arg0, f91_arg1 )
	if f91_arg1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch demo not supported for this lobby type(" .. f91_arg1 .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching demo... **\n" )
		Engine.Exec( f91_arg0, "lobbyLaunchDemo" )
		LuaUtils.UI_ClearErrorMessageDialog()
	else
		local f91_local0 = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch damo. Lobby process '" .. f91_local0.name .. "' in progress.\n" )
	end
end

LobbyVM.HostLaunchInit = function ()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	LobbyVM.hostLaunch = {}
	LobbyVM.hostLaunch.fadeToBlack = false
	local f92_local0 = Engine.milliseconds()
	LobbyVM.hostLaunch.startTime = f92_local0
	LobbyVM.hostLaunch.fadeToBlackTime = f92_local0 + Dvar.lobbyLaunch_fadeToBlackDelay:get()
	LobbyVM.hostLaunch.launchTime = f92_local0 + Dvar.lobbyLaunch_gameLaunchDelay:get()
	LobbyVM.hostLaunch.waitForClientAckTime = f92_local0 + Dvar.lobbyLaunch_waitForClientAckDelay:get()
	Lobby.Timer.ResetUIModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	return true
end

LobbyVM.CheckNeedInstallUGC = function ( f93_arg0, f93_arg1 )
	if f93_arg0 then
		if f93_arg0.ugcType == LuaEnums.MODS_BASE_PATH then
			if LobbyVM.OnModUpdate( {
				ugcInfo = f93_arg0
			} ) then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Caller: " .. f93_arg1 .. ", ugcType: " .. f93_arg0.ugcType .. ": " .. f93_arg0.ugcName .. " not installed yet.\n" )
				return true
			end
		elseif f93_arg0.ugcType == LuaEnums.USERMAP_BASE_PATH and LobbyVM.OnUsermapUpdate( {
			ugcInfo = f93_arg0
		}, true ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Caller: " .. f93_arg1 .. ", ugcType: " .. f93_arg0.ugcType .. ": " .. f93_arg0.ugcName .. " not installed yet.\n" )
			return true
		end
	end
	return false
end

LobbyVM.HostLaunchPump = function ( f94_arg0 )
	local f94_local0 = Engine.GetLobbyUIScreen()
	if f94_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
		local f94_local1 = false
		if Dvar.tu9_hostLaunchCheckMinPlayer:get() == true then
			local f94_local2 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL )
			if f94_local2 < Dvar.party_minplayers:get() then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyVM.LaunchGameExec: Not enough players (" .. tostring( f94_local2 ) .. "/" .. tostring( Dvar.party_minplayers:get() ) .. "), restart timer.\n" )
				f94_local1 = true
			end
		end
		if Dvar.tu9_hostLaunchCheckUnbalancedTeams:get() == true and true == CoDShared.IsGametypeTeamBased() then
			local f94_local2 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			if f94_local2 ~= nil then
				local f94_local3 = 0
				local f94_local4 = 0
				for f94_local8, f94_local9 in ipairs( f94_local2.sessionClients ) do
					if f94_local9.team == Enum.team_t.TEAM_ALLIES then
						f94_local3 = f94_local3 + 1
					end
					if f94_local9.team == Enum.team_t.TEAM_AXIS then
						f94_local4 = f94_local4 + 1
					end
				end
				if math.abs( f94_local3 - f94_local4 ) > 1 then
					Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyVM.LaunchGameExec: Teams are not balanced (teamAlliesCount: " .. tostring( f94_local3 ) .. "/teamAxisCount: " .. tostring( f94_local4 ) .. "), restart timer.\n" )
					f94_local1 = true
				end
			end
		end
		if f94_local1 == true then
			Engine.LobbyLaunchClear()
			LobbyVM.HostLaunchClear()
			local f94_local2 = LobbyData:UITargetFromId( f94_local0 )
			Lobby.Timer.HostingLobby( {
				controller = Engine.GetPrimaryController(),
				lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
				mainMode = f94_local2.mainMode,
				lobbyTimerType = f94_local2.lobbyTimerType,
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
	elseif f94_arg0.ugcInfo and LobbyVM.CheckNeedInstallUGC( f94_arg0.ugcInfo, "LobbyVM.HostLaunchPump" ) then
		return false
	elseif not f94_arg0.hasAllClientsGotLatestStateMsg or Engine.milliseconds() < LobbyVM.hostLaunch.waitForClientAckTime then
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

LobbyVM.HostLaunch = function ( f97_arg0 )
	if f97_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.HostLaunchInit()
	elseif f97_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.HostLaunchPump( f97_arg0 )
	else
		LobbyVM.HostLaunchClear()
	end
end

LobbyVM.CheckAdvertizeSteamServer = function ()
	if Engine.IsDedicatedServer() == true and LuaUtils.Mods_IsUsingMods() then
		return true
	elseif Engine.SessionMode_IsPublicOnlineGame() then
		return false
	elseif Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return false
	else
		local f98_local0 = LobbyData.GetCurrentMenuTarget()
		if f98_local0.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP and f98_local0.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			return false
		elseif f98_local0.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
			return false
		elseif f98_local0.lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			return false
		else
			local f98_local1 = Engine.GetLobbyUIScreen()
			if f98_local1 == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id or f98_local1 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id or f98_local1 == LobbyData.UITargets.UI_MPLOBBYMAIN.id or f98_local1 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f98_local1 == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id or f98_local1 == LobbyData.UITargets.UI_MODESELECT.id or f98_local1 == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id then
				return false
			elseif Engine.GetProfileVarInt( Engine.GetPrimaryController(), "party_privacyStatus" ) == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
				return false
			else
				return true
			end
		end
	end
end

LobbyVM.CheckInitSteamServer = function ()
	if Engine.IsInGame() then
		return true
	elseif Engine.IsDedicatedServer() == true then
		return true
	else
		local f99_local0 = LobbyData.GetCurrentMenuTarget()
		if f99_local0.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP and f99_local0.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			return false
		elseif f99_local0.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
			return false
		elseif f99_local0.lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			return false
		else
			local f99_local1 = Engine.GetLobbyUIScreen()
			if f99_local1 == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id or f99_local1 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id or f99_local1 == LobbyData.UITargets.UI_MPLOBBYMAIN.id or f99_local1 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f99_local1 == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id or f99_local1 == LobbyData.UITargets.UI_MODESELECT.id or f99_local1 == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id then
				return false
			else
				return true
			end
		end
	end
end

LobbyVM.GetNeededDLCBits = function ()
	local f100_local0 = Engine.GetLobbyUIScreen()
	if f100_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id or f100_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f100_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
		return Lobby.Matchmaking.GetMapPackBits( Engine.GetDLCBitsForLobby( Enum.LobbyType.LOBBY_TYPE_GAME ), Engine.GetPlaylistID() )
	elseif f100_local0 == LobbyData.UITargets.UI_MODESELECT.id or f100_local0 == LobbyData.UITargets.UI_MPLOBBYMAIN.id or f100_local0 == LobbyData.UITargets.UI_MPLOBBYONLINE.id or f100_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id or f100_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		return 0
	end
	local f100_local1 = Dvar.ui_mapname:get()
	if f100_local1 == nil or f100_local1 == "" or f100_local1 == "mp_array" then
		f100_local1 = Engine.GetCurrentMap()
	end
	return Engine.GetDLCBitForMapName( f100_local1 )
end

LobbyVM.DLCMapCheck = function ( f101_arg0 )
	local f101_local0 = Dvar.ui_mapname:get()
	local f101_local1 = Engine.GetDLCBits()
	local f101_local2 = LobbyVM.GetNeededDLCBits()
	if f101_local2 == Enum.dlcIndex_t.CONTENT_DEV_MAP_INDEX or f101_local2 == Enum.dlcIndex_t.CONTENT_USERMAP_INDEX then
		return true
	elseif not LobbyVM.CheckDLCBit( f101_local1, f101_local2 ) then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYCLIENT, "Leaving game because map '" .. f101_local0 .. "' is in contentpack '" .. f101_local2 .. "' but our dlcbits is '" .. f101_local1 .. "'.\n" )
		local f101_local3 = Engine.GetPrimaryController()
		local f101_local4 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
		local f101_local5 = Lobby.Process.ReloadPrivateLobby( f101_local3, Engine.GetLobbyNetworkMode() )
		local f101_local6 = Lobby.Actions.LobbySettings( f101_local3, LobbyData.UITargets.UI_MODESELECT )
		local f101_local7 = Lobby.Actions.UpdateUI( f101_local3, LobbyData.UITargets.UI_MODESELECT )
		local f101_local8 = "PLATFORM_MISSINGMAP"
		if LobbyVM.CheckDLCBit( f101_local2, Enum.ContentFlagBits.CONTENT_DLC6 ) then
			f101_local8 = "PLATFORM_MISSINGBO4PREORDER"
		end
		local f101_local9 = Lobby.Actions.ErrorPopupMsg( f101_local8 )
		Lobby.Process.ForceAction( f101_local4, f101_local5.tail )
		Lobby.Process.ForceAction( f101_local5.tail, f101_local6 )
		Lobby.Process.ForceAction( f101_local6, f101_local7 )
		Lobby.Process.ForceAction( f101_local7, f101_local9 )
		Lobby.ProcessQueue.AddToQueue( "MissingMap", f101_local5 )
		return false
	else
		return true
	end
end

LobbyVM.CanClientLaunch = function ( f102_arg0 )
	if f102_arg0.modInfo and LobbyVM.CheckNeedInstallUGC( f102_arg0.modInfo.ugcInfo, "LobbyVM.CanClientLaunch" ) then
		return false
	elseif f102_arg0.usermapInfo then
		if LobbyVM.CheckNeedInstallUGC( f102_arg0.usermapInfo.ugcInfo, "LobbyVM.CanClientLaunch" ) then
			return false
		else
			return true
		end
	elseif LobbyVM.DLCMapCheck( f102_arg0 ) == false then
		Engine.LobbyLaunchClear()
		return false
	else
		return true
	end
end

LobbyVM.ClientLaunchInit = function ( f103_arg0 )
	local f103_local0 = f103_arg0.justConnected
	if not LobbyVM.CanClientLaunch( f103_arg0 ) then
		return false
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
	LobbyVM.clientLaunch = {}
	LobbyVM.clientLaunch.fadeToBlack = false
	local f103_local1 = Dvar.lobbyLaunch_fadeToBlackDelay:get()
	local f103_local2 = Dvar.lobbyLaunch_gameLaunchDelay:get()
	if f103_local0 then
		f103_local1 = Dvar.lobbyLaunch_fadeToBlackDelayOnConnect:get()
		f103_local2 = Dvar.lobbyLaunch_gameLaunchDelayOnConnect:get()
	end
	local f103_local3 = Engine.milliseconds()
	LobbyVM.clientLaunch.startTime = f103_local3
	LobbyVM.clientLaunch.fadeToBlackTime = f103_local3 + f103_local1
	LobbyVM.clientLaunch.launchTime = f103_local3 + f103_local2
	Lobby.Timer.ResetUIModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	return true
end

LobbyVM.ClientLaunchPump = function ( f104_arg0 )
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
	elseif f104_arg0.modInfo and LobbyVM.CheckNeedInstallUGC( f104_arg0.modInfo.ugcInfo, "LobbyVM.ClientLaunchPump" ) then
		return false
	elseif f104_arg0.usermapInfo and LobbyVM.CheckNeedInstallUGC( f104_arg0.usermapInfo.ugcInfo, "LobbyVM.ClientLaunchPump" ) then
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

LobbyVM.ClientLaunch = function ( f106_arg0 )
	if f106_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.ClientLaunchInit( f106_arg0 )
	elseif f106_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.ClientLaunchPump( f106_arg0 )
	else
		LobbyVM.ClientLaunchClear()
	end
end

LobbyVM.LaunchGame = function ( f107_arg0 )
	Lobby.Timer.LaunchGame( f107_arg0 )
end

LobbyVM.LaunchDemo = function ( f108_arg0 )
	Lobby.Timer.LaunchGame( f108_arg0 )
end

LobbyVM.UpdateLobbyStatusInfo = function ( f109_arg0 )
	Lobby.Timer.UpdateLobbyStatusInfo( f109_arg0 )
	Lobby.Pregame.UpdateLobbyStatusInfo( f109_arg0 )
end

LobbyVM.OnClientSelectionReceived = function ( f110_arg0 )
	Lobby.Pregame.OnClientSelectionReceived( f110_arg0 )
end

LobbyVM.LobbyHost_ClientSelectionReceived = function ( f111_arg0 )
	Lobby.Pregame.OnClientSelectionReceived( f111_arg0 )
end

LobbyVM.SwitchTeam = function ( f112_arg0 )
	Lobby.TeamSelection.SwitchTeam( f112_arg0 )
end

LobbyVM.GameModeChanged = function ( f113_arg0 )
	Lobby.TeamSelection.GameModeChanged( f113_arg0 )
end

LobbyVM.OnJoinPartyPrivacyCheck = function ( f114_arg0 )
	return Lobby.PartyPrivacy.OnJoinPartyPrivacyCheck( f114_arg0 )
end

LobbyVM.OnCanFitLobbys = function ( f115_arg0 )
	return Lobby.TeamSelection.OnCanFitLobbys( f115_arg0 )
end

LobbyVM.OnCanBroadcastHostInfo = function ( f116_arg0 )
	local f116_local0 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f116_local0.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f116_local0.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
		return false
	else
		return true
	end
end

LobbyVM.OnUpdateAdvertising = function ( f117_arg0 )
	if f117_arg0.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.Matchmaking.UpdateAdvertising( "force update from code" )
	end
end

LobbyVM.UGCOffensiveEmblemAdd = function ( f118_arg0 )
	Lobby.UGC.OffensiveEmblemAdd( f118_arg0 )
end

LobbyVM.OnPlatformJoin = function ( f119_arg0 )
	Lobby.Platform.OnPlatformJoin( f119_arg0 )
end

LobbyVM.Invite = function ( f120_arg0 )
	Lobby.Platform.Invite( f120_arg0 )
end

LobbyVM.OnPlatformSessionMultiplayerSubscriptionLost = function ( f121_arg0 )
	Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost( f121_arg0 )
end

LobbyVM.OnPlatformSessionMultiplayerSessionChanged = function ( f122_arg0 )
	Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged( f122_arg0 )
end

LobbyVM.OnPlatformSuspend = function ( f123_arg0 )
	Lobby.Platform.OnPlatformSuspend( f123_arg0 )
end

LobbyVM.OnPlatformResume = function ( f124_arg0 )
	Lobby.Platform.OnPlatformResume( f124_arg0 )
end

LobbyVM.OnPlatformPlayTogether = function ( f125_arg0 )
	Lobby.Platform.OnPlatformPlayTogether( f125_arg0 )
end

LobbyVM.SessionSQJRefreshInfo = function ( f126_arg0 )
	Lobby.Debug.SessionSQJRefreshInfo()
end

LobbyVM.StopLobbyTimer = function ( f127_arg0 )
	Lobby.Timer.HostingLobbyEnd( f127_arg0 )
end

LobbyVM.ChangeSigninState = function ( f128_arg0 )
	local f128_local0 = nil
	if f128_arg0.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_OUT then
		Lobby.Anticheat.OnControllerSignedOut( f128_arg0.controller )
		if f128_arg0.isPrimary then
			f128_local0 = Lobby.Process.PrimaryControllerSignedOut( f128_arg0.controller )
		end
	elseif f128_arg0.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_IN then
		if f128_arg0.isPrimary then
			f128_local0 = Lobby.Process.PrimaryControllerSignedIn( f128_arg0.controller )
		end
	else
		DebugPrint( "Warning unknown signin State [" .. f128_arg0.onlineState .. "]" )
	end
	if f128_local0 ~= nil then
		Lobby.ProcessQueue.AddToQueue( "ChangeSignInState", f128_local0 )
	end
end

LobbyVM.JoinResultToString = function ( f129_arg0, f129_arg1 )
	local f129_local0 = {
		debug = "",
		errorMsg = ""
	}
	if f129_arg1 == true then
		f129_local0.debug = "Enum.JoinResult.JOIN_RESULT_"
	end
	if f129_arg0 == Enum.JoinResult.JOIN_RESULT_INVALID then
		f129_local0.debug = f129_local0.debug .. "INVALID"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		f129_local0.debug = f129_local0.debug .. "SUCCESS"
		f129_local0.errorMsg = ""
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_CONNECT_TO_HOST_FAILURE then
		f129_local0.debug = f129_local0.debug .. "CONNECT_TO_HOST_FAILURE"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_SEND_FAILURE then
		f129_local0.debug = f129_local0.debug .. "PROBE_SEND_FAILURE"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_TIMEOUT then
		f129_local0.debug = f129_local0.debug .. "PROBE_TIMEOUT"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_LOBBY then
		f129_local0.debug = f129_local0.debug .. "PROBE_INVALID_LOBBY"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_INFO then
		f129_local0.debug = f129_local0.debug .. "PROBE_INVALID_INFO"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_RESULT_INVALID then
		f129_local0.debug = f129_local0.debug .. "PROBE_RESULT_INVALID"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_INVALID_LOBBY then
		f129_local0.debug = f129_local0.debug .. "INVALID_LOBBY"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_SEND_AGREEMENT_REQUEST_FAILED then
		f129_local0.debug = f129_local0.debug .. "SEND_AGREEMENT_REQUEST_FAILED"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED then
		f129_local0.debug = f129_local0.debug .. "JOIN_DISABLED"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_OFFLINE_MODE then
		f129_local0.debug = f129_local0.debug .. "HOST_OFFLINE_MODE"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_HOST_OFFLINE_MODE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_JOIN_ALREADY_IN_PROGRESS then
		f129_local0.debug = f129_local0.debug .. "JOIN_ALREADY_IN_PROGRESS"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_CLOSED then
		f129_local0.debug = f129_local0.debug .. "NOT_JOINABLE_CLOSED"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_CLOSED"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY then
		f129_local0.debug = f129_local0.debug .. "NOT_JOINABLE_INVITE_ONLY"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY then
		f129_local0.debug = f129_local0.debug .. "NOT_JOINABLE_FRIENDS_ONLY"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_SOLO_MODE then
		f129_local0.debug = f129_local0.debug .. "NOT_JOINABLE_SOLO_MODE"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_SOLO_MODE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_OVER_MAX_PARTY_LIMIT then
		f129_local0.debug = f129_local0.debug .. "OVER_MAX_PARTY_LIMIT"
		f129_local0.errorMsg = "EXE_TO_MANY_LOCAL_PLAYERS"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_UNDER_MIN_PARTY_LIMIT then
		f129_local0.debug = f129_local0.debug .. "UNDER_MIN_PARTY_LIMIT"
		f129_local0.errorMsg = "PLATFORM_JOIN_RESULT_UNDER_MIN_PARTY_LIMIT"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_NO_PARTIES then
		f129_local0.debug = f129_local0.debug .. "NO_PARTIES"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_ALREADY_IN_PROGRESS"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_LOBBY_FULL then
		f129_local0.debug = f129_local0.debug .. "LOBBY_FULL"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_LOBBY_FULL"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_NETWORK_MODE_MISMATCH then
		f129_local0.debug = f129_local0.debug .. "NETWORK_MODE_MISMATCH"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NETWORK_MODE_MISMATCH"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLISTID then
		f129_local0.debug = f129_local0.debug .. "MISMATCH_PLAYLISTID"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLISTID"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW then
		f129_local0.debug = f129_local0.debug .. "MISMATCH_PLAYLIST_VERSION_TO_NEW"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD then
		f129_local0.debug = f129_local0.debug .. "MISMATCH_PLAYLIST_VERSION_TO_OLD"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PROTOCOL_VERSION then
		f129_local0.debug = f129_local0.debug .. "MISMATCH_PROTOCOL_VERSION"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PROTOCOL_VERSION"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM then
		f129_local0.debug = f129_local0.debug .. "MISMATCH_NETFIELD_CHECKSUM"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_NEW then
		f129_local0.debug = f129_local0.debug .. "MISMATCH_FFOTD_VERSION_TO_NEW"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_OLD then
		f129_local0.debug = f129_local0.debug .. "MISMATCH_FFOTD_VERSION_TO_OLD"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_MIGRATE_IN_PROGRESS then
		f129_local0.debug = f129_local0.debug .. "MIGRATE_IN_PROGRESS"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MIGRATE_IN_PROGRESS"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_COULD_NOT_RESERVE then
		f129_local0.debug = f129_local0.debug .. "COULD_NOT_RESERVE"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_COULD_NOT_RESERVE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_HANDSHAKE_WINDOW_EXPIRED then
		f129_local0.debug = f129_local0.debug .. "HANDSHAKE_WINDOW_EXPIRED"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_AGREEMENT_WINDOW_EXPIRED then
		f129_local0.debug = f129_local0.debug .. "AGREEMENT_WINDOW_EXPIRED"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_NOT_IDLE then
		f129_local0.debug = f129_local0.debug .. "NOT_JOINABLE_NOT_IDLE"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS then
		f129_local0.debug = f129_local0.debug .. "NO_JOIN_IN_PROGRESS"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_GAME_PAUSED then
		f129_local0.debug = f129_local0.debug .. "GAME_PAUSED"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_PAUSED"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED then
		f129_local0.debug = f129_local0.debug .. "CHUNK_MP_REQUIRED"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MP_REQUIRED"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED then
		f129_local0.debug = f129_local0.debug .. "CHUNK_ZM_REQUIRED"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_ZM_REQUIRED"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED then
		f129_local0.debug = f129_local0.debug .. "CHUNK_CP_REQUIRED"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_CP_REQUIRED"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED_HOST then
		f129_local0.debug = f129_local0.debug .. "CHUNK_MP_REQUIRED_HOST"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_MP_REQUIRED_HOST"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED_HOST then
		f129_local0.debug = f129_local0.debug .. "CHUNK_ZM_REQUIRED_HOST"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_ZM_REQUIRED_HOST"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED_HOST then
		f129_local0.debug = f129_local0.debug .. "CHUNK_CP_REQUIRED_HOST"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_CP_REQUIRED_HOST"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED then
		f129_local0.debug = f129_local0.debug .. "JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED"
		f129_local0.errorMsg = "MENU_SPLITSCREEN_NOT_ALLOWED"
	elseif Engine.DvarBool( 0, "probation_public_enabled" ) and f129_arg0 == Enum.JoinResult.JOIN_RESULT_IN_PUBLIC_PROBATION then
		f129_local0.debug = f129_local0.debug .. "JOIN_RESULT_IN_PUBLIC_PROBATION"
		f129_local0.errorMsg = "MENU_JOIN_DENIED_PUBLIC_PROBATION"
	elseif Engine.DvarBool( 0, "probation_league_enabled" ) and f129_arg0 == Enum.JoinResult.JOIN_RESULT_IN_ARENA_PROBATION then
		f129_local0.debug = f129_local0.debug .. "JOIN_RESULT_IN_ARENA_PROBATION"
		f129_local0.errorMsg = "MENU_JOIN_DENIED_ARENA_PROBATION"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_BAD_DLC_BITS then
		f129_local0.debug = f129_local0.debug .. "JOIN_RESULT_BAD_DLC_BITS"
		if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
			f129_local0.errorMsg = "PLATFORM_MEMBER_MISSING_MAP"
		else
			f129_local0.errorMsg = "PLATFORM_MISSINGMAP"
		end
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_BAD_MPHD_BITS then
		f129_local0.debug = f129_local0.debug .. "JOIN_RESULT_BAD_DLC_BITS"
		f129_local0.errorMsg = "PLATFORM_MISSINGBO4PREORDER"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1 then
		f129_local0.debug = f129_local0.debug .. "JOIN_RESULT_VM_FAILURE_1"
		f129_local0.errorMsg = "EXE_HOSTUNREACH_TOO_MANY_JOINS"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_STARTER_PACK_RESTRICT then
		f129_local0.debug = f129_local0.debug .. "JOIN_RESULT_STARTER_PACK_RESTRICT"
		if LuaUtils.IsStarterPack() then
			f129_local0.errorMsg = "PLATFORM_STARTER_PACK_JOIN_ERROR"
		else
			f129_local0.errorMsg = "PLATFORM_STARTER_PACK_MEMBER_MISSING_CONTENT"
		end
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_INVALID_PASSWORD then
		f129_local0.debug = f129_local0.debug .. "JOIN_RESULT_INVALID_PASSWORD"
		f129_local0.errorMsg = "GAME_INVALIDPASSWORD"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_BANNED then
		f129_local0.debug = f129_local0.debug .. "BANNED"
		f129_local0.errorMsg = "PLATFORM_BANNED_FROM_SERVER"
	elseif f129_arg0 == Enum.JoinResult.JOIN_RESULT_BANNED_MEMBER then
		f129_local0.debug = f129_local0.debug .. "BANNED_MEMBER"
		f129_local0.errorMsg = "PLATFORM_BANNED_MEMBER_FROM_SERVER"
	else
		f129_local0.debug = f129_local0.debug .. "UNHANDLED JOINRESULT ENUM(" .. tostring( f129_arg0 ) .. ")"
		f129_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	end
	return f129_local0
end

LobbyVM.ClearLobbyStatus = function ()
	if LobbyVM.lobbyStatus.cleared == true then
		return 
	elseif LobbyVM.lobbyStatus.clearedTime > Engine.milliseconds() then
		return 
	else
		LobbyVM.lobbyStatus.cleared = true
		local f130_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local f130_local1 = Engine.CreateModel( f130_local0, "lobbyStatusString1" )
		local f130_local2 = Engine.CreateModel( f130_local0, "lobbyStatusString2" )
		local f130_local3 = Engine.CreateModel( f130_local0, "lobbyStatusString3" )
		Engine.SetModelValue( f130_local1, "" )
		Engine.SetModelValue( f130_local2, "" )
		Engine.SetModelValue( f130_local3, "" )
	end
end

LobbyVM.LobbyStatusUpdate = function ( f131_arg0 )
	if not Engine.IsMainThreadOrProxy() then
		return 
	end
	local f131_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local f131_local1 = Engine.CreateModel( f131_local0, "lobbyStatusString1" )
	local f131_local2 = Engine.CreateModel( f131_local0, "lobbyStatusString2" )
	local f131_local3 = Engine.CreateModel( f131_local0, "lobbyStatusString3" )
	LobbyVM.lobbyStatus.cleared = false
	LobbyVM.lobbyStatus.clearedTime = Engine.milliseconds() + 10000
	local f131_local4 = f131_arg0.searchStage
	local f131_local5 = ""
	if f131_local4 == 1 then
		local f131_local6 = f131_arg0.numResults
		if f131_local6 == 1 then
			f131_local5 = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE_SINGLE" )
		else
			f131_local5 = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE", f131_local6 )
		end
		Engine.SetModelValue( f131_local1, f131_local5 )
		Engine.SetModelValue( f131_local2, "" )
		Engine.SetModelValue( f131_local3, "" )
	elseif f131_local4 == 2 then
		Engine.SetModelValue( f131_local2, Engine.Localize( "MENU_SESSIONS_QOS_PROGRESS", f131_arg0.contactedResults, f131_arg0.numResults ) )
	elseif f131_local4 == 3 then
		Engine.SetModelValue( f131_local3, Engine.Localize( "MENU_SESSIONS_JOINING", f131_arg0.joiningCurHost, f131_arg0.joiningNumHosts ) )
	end
end

LobbyVM.CheckStarterPack = function ( f132_arg0 )
	if f132_arg0.isStarterPack == 1 then
		if LuaUtils.Mods_IsUsingMods() then
			return true
		end
		local f132_local0 = LobbyData.GetCurrentMenuTarget()
		if Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and f132_local0.id ~= LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
			return true
		elseif f132_local0.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP or f132_local0.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			return true
		elseif f132_local0.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and f132_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			return true
		end
	end
	return false
end

LobbyVM.LoadMod = function ( f133_arg0 )
	local f133_local0 = Lobby.Process.LoadMod( Engine.GetPrimaryController(), f133_arg0 )
	if f133_local0 ~= nil then
		Lobby.ProcessQueue.AddToQueue( "LoadMod", f133_local0 )
	end
end

LobbyVM.OnModUpdate = function ( f134_arg0 )
	if LuaUtils.Mods_IsModLoaded( f134_arg0.ugcInfo ) then
		return false
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		f134_arg0.ugcInfo.waitForInstall = true
		local f134_local0 = Lobby.Process.NeedInstallUGC( Engine.GetPrimaryController(), f134_arg0.ugcInfo )
		if f134_local0 ~= nil then
			Lobby.ProcessQueue.AddToQueue( "NeedInstallMod", f134_local0 )
		end
	end
	return true
end

LobbyVM.OnUsermapUpdate = function ( f135_arg0, f135_arg1 )
	if not LuaUtils.Mods_IsUGC( f135_arg0.ugcInfo ) then
		return false
	elseif LuaUtils.Mods_Lists_IsInstalled( f135_arg0.ugcInfo ) then
		return false
	elseif f135_arg1 ~= true and Engine.Mods_IsSubscribedItem( f135_arg0.ugcInfo.ugcName ) then
		if Engine.Mods_InstalledUGC( f135_arg0.ugcInfo.ugcName ) then
			Engine.Mods_Lists_UpdateUsermaps()
		end
		return true
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		f135_arg0.ugcInfo.waitForInstall = f135_arg1
		local f135_local0 = Lobby.Process.NeedInstallUGC( Engine.GetPrimaryController(), f135_arg0.ugcInfo )
		if f135_local0 ~= nil then
			Lobby.ProcessQueue.AddToQueue( "NeedInstallUsermap", f135_local0 )
		end
	end
	return true
end

LobbyVM.DoChunksAllowJoin = function ( f136_arg0, f136_arg1 )
	if f136_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		if f136_arg0.chunkMP ~= 3 then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED
		elseif Engine.IsMpStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED_HOST
		end
	elseif f136_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		if f136_arg0.chunkZM ~= 3 then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED
		elseif Engine.IsZmStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED_HOST
		end
	elseif f136_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if f136_arg0.chunkCP ~= 3 then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED
		elseif Engine.IsCpStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED_HOST
		end
	end
	return Enum.JoinResult.JOIN_RESULT_SUCCESS
end

LobbyVM.IsInTheaterLobby = function ()
	local f137_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if f137_local0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return true
	else
		return false
	end
end

LobbyVM.JoinableCheck = function ( f138_arg0 )
	local f138_local0 = f138_arg0.joinRequest
	local f138_local1 = f138_arg0.joinResponse
	local f138_local2 = LobbyData.GetCurrentMenuTarget()
	if Engine.IsDedicatedServer() == false and Engine.IsProcessingJoin() == true and f138_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and (f138_local2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC or f138_local2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA) then
		if f138_local2.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP and Engine.DvarBool( nil, "cpProcessingJoinCheck" ) then
			return Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1
		elseif f138_local2.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP and Engine.DvarBool( nil, "mpProcessingJoinCheck" ) then
			return Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1
		elseif f138_local2.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM and Engine.DvarBool( nil, "zmProcessingJoinCheck" ) then
			return Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1
		end
	end
	if Engine.IsInGame() or LobbyVM.IsHostLaunching() or Engine.GetCurrentMap() ~= "core_frontend" or Engine.SessionMode_IsPublicOnlineGame() then
		local f138_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f138_local4 = LobbyVM.GetNeededDLCBits()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Incoming client dlc bits are " .. f138_local0.dlcBits .. " while our needed bits are " .. f138_local4 .. "\n" )
		if Engine.IsZombiesGame() then
			f138_local0.dlcBits = LuaUtils.UpdateZMDLCBits( f138_local0.dlcBits )
		end
		if not LobbyVM.CheckDLCBit( f138_local0.dlcBits, f138_local4 ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Rejecting client due to incompatible dlc bits.\n" )
			if LobbyVM.CheckDLCBit( f138_local4, Enum.ContentFlagBits.CONTENT_DLC6 ) then
				return Enum.JoinResult.JOIN_RESULT_BAD_MPHD_BITS
			else
				return Enum.JoinResult.JOIN_RESULT_BAD_DLC_BITS
			end
		end
	end
	if f138_local1.response == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		if Engine.IsMultiplayerGame() then
			if LuaUtils.IsArenaMode() then
				if ((Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1) or Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1) and Engine.IsInGame() and Engine.SessionMode_IsPublicOnlineGame() then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				elseif f138_arg0.joinRequest.splitscreenClients ~= nil and f138_arg0.joinRequest.splitscreenClients > 0 then
					return Enum.JoinResult.JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED
				elseif Lobby.Timer.LobbyIsLocked() then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				elseif Engine.GetLobbyPregameState() ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				end
				local f138_local5 = Lobby.Timer.GetTimerStatus()
				if f138_local5 == Lobby.Timer.LOBBY_STATUS.POST_GAME or f138_local5 == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				elseif Engine.DvarBool( 0, "probation_league_enabled" ) and f138_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
					for f138_local9, f138_local10 in pairs( f138_local0.members ) do
						if f138_local10.arenaProbation > 0 then
							return Enum.JoinResult.JOIN_RESULT_IN_ARENA_PROBATION
						end
					end
				end
			elseif Engine.DvarBool( 0, "probation_public_enabled" ) and f138_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
				for f138_local5, f138_local6 in pairs( f138_local0.members ) do
					if f138_local6.publicProbation > 0 then
						return Enum.JoinResult.JOIN_RESULT_IN_PUBLIC_PROBATION
					end
				end
			end
		end
		if Engine.IsZombiesGame() then
			local f138_local3 = false
			if Dvar.zm_private_rankedmatch:get() then
				f138_local3 = true
			end
			if LobbyVM.IsInTheaterLobby() then
				return Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED
			elseif LobbyData.UITargets.UI_ZMLOBBYONLINE.id == Engine.GetLobbyUIScreen() and (Engine.IsInGame() or LobbyVM.IsHostLaunching() or Engine.GetCurrentMap() ~= "core_frontend") then
				return Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_SOLO_MODE
			elseif (Engine.IsInGame() or LobbyVM.IsHostLaunching()) and Engine.SessionMode_IsOnlineGame() and f138_local3 then
				return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
			elseif (Engine.IsInGame() or LobbyVM.IsHostLaunching()) and Engine.SessionMode_IsPublicOnlineGame() then
				return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
			end
		end
		if LuaUtils.isPC and LobbyVM.CheckStarterPack( f138_local0 ) then
			return Enum.JoinResult.JOIN_RESULT_STARTER_PACK_RESTRICT
		elseif LuaUtils.isPC then
			if not f138_arg0.isLocalRequest and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				local f138_local4 = Engine.LiveSteamServer_GetServerPassword()
				if f138_local4 and string.len( f138_local4 ) > 0 and f138_arg0.joinRequest.password ~= f138_local4 then
					return Enum.JoinResult.JOIN_RESULT_INVALID_PASSWORD
				end
			end
		end
		local f138_local3 = Engine.GetLobbyMainMode()
		if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
			if not f138_arg0.isLocalRequest then
				if f138_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
					local f138_local4 = LobbyVM.DoChunksAllowJoin( f138_local0, f138_local3 )
					if f138_local4 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
						return f138_local4
					end
				elseif f138_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
					if LuaUtils.isPC then
						local f138_local4 = LobbyVM.DoChunksAllowJoin( f138_local0, f138_local3 )
						if f138_local4 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
							return f138_local4
						end
					end
					for f138_local4 = 0, Enum.LobbyMainMode.LOBBY_MAINMODE_COUNT - 1, 1 do
						local f138_local7 = LobbyVM.DoChunksAllowJoin( f138_local0, f138_local4 )
						if f138_local7 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
							return f138_local7
						end
					end
				end
			end
		elseif not f138_arg0.isLocalRequest then
			local f138_local4 = LobbyVM.DoChunksAllowJoin( f138_local0, f138_local3 )
			if f138_local4 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
				return f138_local4
			end
		end
	end
	return f138_local1.response
end

LobbyVM.ProcessCompleteSuccess = function ( f139_arg0 )
	Lobby.ProcessQueue.Success( f139_arg0 )
end

LobbyVM.ProcessCompleteFailure = function ( f140_arg0 )
	Lobby.ProcessQueue.Failure( f140_arg0 )
end

LobbyVM.ProcessCompleteError = function ( f141_arg0 )
	Lobby.ProcessQueue.Error( f141_arg0 )
end

LobbyVM.ProcessUpdate = function ( f142_arg0 )
	Lobby.ProcessQueue.Update( f142_arg0 )
end

LobbyVM.GameLobbyGameServerDataUpdate = function ( f143_arg0 )
	if Lobby.ProcessQueue.IsQueueEmpty() == true then
		local f143_local0 = Engine.GetLobbyUIScreen()
		if (f143_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id or f143_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f143_local0 == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id) and LobbyVM.DLCMapCheck( f143_arg0 ) == false then
			return 
		end
	end
	local f143_local0 = Engine.GetPlaylistID()
	local f143_local1 = Engine.GetPlaylistName( 0, f143_local0 )
	local f143_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	Engine.SetModelValue( Engine.CreateModel( f143_local2, "name" ), Engine.ToUpper( f143_local1 ) )
	local f143_local3 = ""
	local f143_local4 = Engine.GetPlaylistInfoByID( f143_local0 )
	if f143_local4 and f143_local4.playlist and f143_local4.playlist.category and f143_local4.playlist.category == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
		f143_local3 = "MENU_RULES_HARDCORE"
	end
	Engine.SetModelValue( Engine.CreateModel( f143_local2, "kickerText" ), f143_local3 )
	Lobby.MapVote.GameLobbyGameServerDataUpdate( f143_arg0 )
end

LobbyVM.PrivateLobbyServerDataUpdate = function ( f144_arg0 )
	local f144_local0 = Engine.GetPlaylistID()
	local f144_local1 = Engine.GetPlaylistName( 0, f144_local0 )
	local f144_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	Engine.SetModelValue( Engine.CreateModel( f144_local2, "name" ), Engine.ToUpper( f144_local1 ) )
	local f144_local3 = ""
	local f144_local4 = Engine.GetPlaylistInfoByID( f144_local0 )
	if f144_local4 and f144_local4.playlist and f144_local4.playlist.category and f144_local4.playlist.category == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
		f144_local3 = "MENU_RULES_HARDCORE"
	end
	Engine.SetModelValue( Engine.CreateModel( f144_local2, "kickerText" ), f144_local3 )
end

LobbyVM.GameLobbyClientDataUpdate = function ( f145_arg0 )
	Lobby.MapVote.GameLobbyClientDataUpdate( f145_arg0 )
	Lobby.TeamSelection.GameLobbyClientDataUpdate( f145_arg0 )
	Lobby.Pregame.GameLobbyClientDataUpdate( f145_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClientDataUpdate" ) )
end

LobbyVM.HopperClientJoin = function ( f146_arg0 )
	return Lobby.Hopper.ClientJoin( f146_arg0 )
end

LobbyVM.HopperIsParked = function ()
	return Lobby.Hopper.IsParked()
end

LobbyVM.GetMatchmakingExperimentActive = function ( f148_arg0 )
	return Lobby.Matchmaking.IsExperimentActive( f148_arg0 )
end

LobbyVM.OnExperimentReset = function ( f149_arg0 )
	Lobby.Matchmaking.ResetExperiment( f149_arg0.controller )
end

LobbyVM.OnDediQosReady = function ()
	local f150_local0 = Engine.GetDediQosResultsByType( Lobby.Matchmaking.DatacenterType.ANY )
	if f150_local0.numResults == 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Engine told us results were ready, but no results available\n" )
	else
		servers = f150_local0.pingResults
		for f150_local4, f150_local5 in ipairs( servers ) do
			LuaUtils.LogQoS( "dediqos", f150_local5 )
		end
	end
end

LobbyVM.PopulateMutableClientDDLBuff = function ( f151_arg0 )
	local f151_local0 = f151_arg0.controller
	local f151_local1 = f151_arg0.ddlData
end

LobbyVM.ReceiveMutableClientDDLBuff = function ( f152_arg0 )
	local f152_local0 = f152_arg0.xuid
	local f152_local1 = f152_arg0.ddlData
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

LobbyVM.OnEnableJoins = function ( f154_arg0 )
	if f154_arg0.enable then
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
	else
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_PAUSED )
	end
end

LobbyVM.OnStorageOperationReadResult = function ( f155_arg0 )
	Lobby.Anticheat.OnStorageOperationReadResult( f155_arg0 )
end

LobbyVM.OnIsFeatureBanned = function ( f156_arg0 )
	local f156_local0, f156_local1 = Lobby.Anticheat.CheckIsFeatureBannedForIndex( f156_arg0.controller, f156_arg0.feature )
	return f156_local0
end

LobbyVM.OnPlayerBanned = function ( f157_arg0 )
	Lobby.Anticheat.OnPlayerBanned( f157_arg0 )
end

LobbyVM.OnFeatureBan = function ( f158_arg0 )
	Lobby.Anticheat.OnFeatureBan( f158_arg0 )
end

LobbyVM.OnCheckPrestigeFeatureBan = function ( f159_arg0 )
	Lobby.Anticheat.OnCheckPrestigeFeatureBan( f159_arg0 )
end

LobbyVM.OnIsPermaBanned = function ( f160_arg0 )
	return Lobby.Anticheat.OnIsPermaBanned( f160_arg0 )
end

LobbyVM.OnGetBanTimeRemaining = function ( f161_arg0 )
	return Lobby.Anticheat.OnGetBanTimeRemaining( f161_arg0 )
end

LobbyVM.OnPushAnticheatMessageToUI = function ( f162_arg0 )
	return Lobby.Anticheat.OnPushAnticheatMessageToUI( f162_arg0 )
end

LobbyVM.OnPopAnticheatMessage = function ( f163_arg0 )
	Lobby.Anticheat.OnPopAnticheatMessage( f163_arg0 )
end

LobbyVM.OnGetAnticheatReputation = function ( f164_arg0 )
	return Lobby.Anticheat.OnGetAnticheatReputation( f164_arg0 )
end

LobbyVM.GetLootItemCategory = function ( f165_arg0 )
	local f165_local0 = "gamedata/loot/mplootitems.csv"
	local f165_local1 = 1
	local f165_local2 = 2
	local f165_local3 = Engine.TableFindRows( f165_local0, f165_local1, f165_arg0 )
	if f165_local3 == nil or #f165_local3 == 0 then
		return -1
	else
		local f165_local4 = Engine.TableLookupGetColumnValueForRow( f165_local0, f165_local3[1], f165_local2 )
		if f165_local4 == nil then
			return -1
		else
			return f165_local4
		end
	end
end

LobbyVM.GetRecentItemTags = function ( f166_arg0, f166_arg1 )
	local f166_local0 = Engine.GetLootItems( f166_arg0, Enum.eModes.MODE_MULTIPLAYER, 0, Engine.GetLootItemCount( f166_arg0, Enum.eModes.MODE_MULTIPLAYER ) )
	local f166_local1 = LuaUtils.GetCurrentLootVersion()
	local f166_local2 = "gamedata/loot/mplootitems.csv"
	local f166_local3 = Engine.TableFindRows( f166_local2, 2, f166_arg1 )
	local f166_local4 = 6
	local f166_local5 = 0
	for f166_local10, f166_local11 in ipairs( f166_local3 ) do
		local f166_local9 = Engine.TableLookupGetColumnValueForRow( f166_local2, f166_local11, f166_local4 )
		if f166_local9 == nil or f166_local9 == "" then
			f166_local9 = -1
		else
			f166_local9 = tonumber( f166_local9 )
		end
		if f166_local9 ~= -1 and f166_local9 <= f166_local1 then
			f166_local5 = f166_local5 + 1
		end
	end
	if f166_local0 == nil then
		return ""
	end
	f166_local6 = {}
	for f166_local11, f166_local9 in ipairs( f166_local0 ) do
		if CoDShared.GetLootItemCategory( f166_local9.id ) == f166_arg1 and CoDShared.GetLootItemVersion( f166_local9.id ) <= f166_local1 then
			table.insert( f166_local6, f166_local9.id )
		end
		if f166_local5 <= #f166_local6 then
			return ""
		end
	end
	if #f166_local6 == 0 then
		return ""
	end
	f166_local7 = ""
	for f166_local9, f166_local12 in ipairs( f166_local6 ) do
		f166_local7 = f166_local7 .. "[ 203, " .. f166_local12 .. "]"
		if f166_local9 < #f166_local6 then
			f166_local7 = f166_local7 .. " , "
		end
	end
	return f166_local7
end

LobbyVM.GetLootPossibleCount = function ( f167_arg0 )
	local f167_local0 = LuaUtils.GetCurrentLootVersion()
	local f167_local1 = "gamedata/loot/mplootitems.csv"
	local f167_local2 = Engine.TableFindRows( f167_local1, 2, f167_arg0 )
	local f167_local3 = 6
	local f167_local4 = 0
	for f167_local8, f167_local9 in ipairs( f167_local2 ) do
		local f167_local10 = tonumber( Engine.TableLookupGetColumnValueForRow( f167_local1, f167_local9, f167_local3 ) ) or -1
		if f167_local10 ~= -1 and f167_local10 <= f167_local0 then
			f167_local4 = f167_local4 + 1
		end
	end
	return f167_local4
end

LobbyVM.GetLootItemList = function ( f168_arg0, f168_arg1 )
	local f168_local0 = LuaUtils.GetCurrentLootVersion()
	local f168_local1 = Engine.GetLootItems( f168_arg0, Enum.eModes.MODE_MULTIPLAYER, 0, Engine.GetLootItemCount( f168_arg0, Enum.eModes.MODE_MULTIPLAYER ) )
	local f168_local2 = {}
	if f168_local1 == nil then
		return f168_local2
	end
	for f168_local6, f168_local7 in ipairs( f168_local1 ) do
		if CoDShared.GetLootItemCategory( f168_local7.id ) == f168_arg1 and CoDShared.GetLootItemVersion( f168_local7.id ) <= f168_local0 then
			table.insert( f168_local2, f168_local7.id )
		end
	end
	return f168_local2
end

LobbyVM.OnBuyCrate = function ( f169_arg0 )
	if f169_arg0.crateDWID == 48 then
		local f169_local0 = LobbyVM.GetLootPossibleCount( "melee_weapon" )
		local f169_local1 = LobbyVM.GetLootItemList( f169_arg0.controller, "melee_weapon" )
		if f169_local0 ~= nil and f169_local1 ~= nil and f169_local0 - 1 <= #f169_local1 then
			f169_arg0.crateDWID = 50
		end
	end
	local f169_local0 = " \"SupplyDropID\": " .. f169_arg0.crateDWID .. ", "
	local f169_local1 = " \"PurchaseWith\": \"" .. f169_arg0.currency .. "\", "
	local f169_local2 = " \"Rank\": [], "
	local f169_local3 = " \"ExcludeTag\": [], "
	local f169_local4 = " \"InventoryVersion\": [ " .. Dvar.loot_mpItemVersions:get() .. Dvar.loot_limitedTimeItemVersions:get() .. " ] "
	if Engine.DvarString( nil, "loot_useClientDupes" ) == "1" then
		local f169_local5 = false
		local f169_local6 = ""
		if f169_arg0.crateDWID == 32 then
			f169_local5 = true
			f169_local6 = "weapon"
		elseif f169_arg0.crateDWID == 31 then
			f169_local5 = true
			f169_local6 = "melee_weapon"
		end
		if f169_local5 == true then
			local f169_local7 = LobbyVM.GetRecentItemTags( f169_arg0.controller, f169_local6 )
			f169_local3 = " \"ExcludeTag\": [ "
			if f169_local7 ~= "" then
				f169_local3 = f169_local3 .. f169_local7
			end
			f169_local3 = f169_local3 .. " ], "
			Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "Excluding: " .. f169_local3 .. ".\n" )
		end
	end
	return f169_local0 .. f169_local1 .. f169_local2 .. f169_local3 .. f169_local4
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
LobbyVM.OnSpendVials = function ( f170_arg0 )
	local f170_local0 = " \"NumVials\": " .. f170_arg0.vialCount .. ", "
	local f170_local1 = " \"InventoryVersion\": [" .. Dvar.loot_zmItemVersions:get() .. " "
	local f170_local2 = Engine.DvarInt( nil, "tu9_highestAvailableDLC" )
	for f170_local6, f170_local7 in ipairs( LobbyVM.DLCInfo ) do
		if f170_local7.dlcIndex <= f170_local2 or f170_local7.dlcPackName == "dlc5" and (Dvar.loot_forceEnableZCGumsInFactory:get() == 1 or Dvar.loot_forceEnableZCGumsInFactory:get() == "1") then
			f170_local1 = f170_local1 .. ", " .. f170_local7.inventoryVersion .. " "
		end
	end
	return f170_local0 .. f170_local1 .. "]"
end

LobbyVM.OnCookGobbleGumRecipe = function ( f171_arg0 )
	return " \"Recipe\": " .. f171_arg0.recipeIndex + f171_arg0.itemOffset
end

LobbyVM.OnInventoryFetched = function ( f172_arg0 )
	local f172_local0 = {
		"na_team_mtx",
		"eu_team_mtx",
		"anz_team_mtx",
		"cwl_mtx",
		"cwl_mtx_v2"
	}
	local f172_local1 = "gamedata/tables/common/inventory_items.csv"
	local f172_local2 = 1
	local f172_local3 = 2
	local f172_local4 = false
	for f172_local8, f172_local9 in ipairs( f172_local0 ) do
		if Engine.GetInventoryItemQuantity( f172_arg0.controller, tonumber( Engine.TableLookup( nil, f172_local1, f172_local2, f172_local9, f172_local3 ) ) ) > 0 then
			Engine.SetProfileVar( f172_arg0.controller, f172_local9, "1" )
			f172_local4 = true
		end
	end
	if f172_local4 then
		Engine.CommitProfileChanges( f172_arg0.controller )
	end
end

LobbyVM.CheckSpecialPlaylistRules = function ( f173_arg0 )
	if Dvar.partyChatDisallowed:get() == true then
		if Engine.IsLocalClientInPlatformPartyChat() and not Engine.IsInComError() then
			Dvar.partyChatDisallowed:set( false )
			Engine.ComError( Enum.errorCode.ERROR_DROP, "PLATFORM_PARTYCHATNOTALLOWED" )
		end
		local f173_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		for f173_local4, f173_local5 in ipairs( f173_local0.sessionClients ) do
			if f173_local5.isInPlatformPartyChat == true then
				Engine.KickClient( f173_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, f173_local5.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_NOPARTYCHAT, "PLATFORM_PARTYCHATNOTALLOWED" )
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
	local f174_local0 = Dvar.tu16_lobbyMonitor:get()
	if f174_local0 == 0 then
		return 
	end
	local f174_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f174_local2 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f174_local3 = Dvar.party_maxplayers:get()
	if f174_local2 == f174_local3 or f174_local1 <= f174_local3 then
		return 
	end
	local f174_local4 = Engine.GetPrimaryController()
	if false == LobbyVM.lobbyMonitor.eventRecorded then
		LobbyVM.lobbyMonitor.eventRecorded = true
		Engine.RecordComScoreEvent( f174_local4, "lobby_monitor", "game_client_count", f174_local1, "game_max_clients", f174_local2, "party_max_players", f174_local3 )
	end
	if f174_local0 == 1 then
		
	elseif f174_local0 == 2 then
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_ERROR )
		local f174_local5 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		for f174_local9, f174_local10 in ipairs( f174_local5.sessionClients ) do
			if f174_local10.isHost == false and f174_local10.isLocal == false then
				Engine.KickClient( f174_local4, Enum.LobbyType.LOBBY_TYPE_GAME, f174_local10.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_ERROR, "LobbyVM.LobbyMonitor() found an issue with the lobby" )
			end
		end
		Engine.ComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER_ERROR" )
	end
end

LobbyVM.IngameMonitor = function ()
	if not Engine.IsInGame() then
		return 
	elseif (Engine.IsDedicatedServer() or CoDShared.IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_PUBLIC )) and Dvar.partyChatDisallowed:get() and Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		local f175_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f175_local1 = Engine.GetLobbyHostControllerIndex( Enum.LobbyType.LOBBY_TYPE_GAME )
		for f175_local5, f175_local6 in ipairs( f175_local0.sessionClients ) do
			if f175_local6.isInPlatformPartyChat == true then
				Engine.KickClient( f175_local1, Enum.LobbyType.LOBBY_TYPE_GAME, f175_local6.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_NOPARTYCHAT, "PLATFORM_PARTYCHATNOTALLOWED" )
			end
		end
	end
end

