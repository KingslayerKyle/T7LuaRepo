require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Shared.LuaUtils" )
require( "lua.Lobby.Leaderboard" )
require( "lua.Lobby.LobbyAnticheat" )
require( "lua.Lobby.LobbyDebug" )
require( "lua.Lobby.LobbyHopper" )
require( "lua.Lobby.LobbyMapVote" )
require( "lua.Lobby.LobbyMerge" )
require( "lua.Lobby.LobbyPartyPrivacy" )
require( "lua.Lobby.LobbyPlatformSession" )
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
	Engine.AdvertiseLobby( -1, Enum.LobbyType.LOBBY_TYPE_GAME, f3_local0 )
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

LobbyVM.ErrorShutdown = function ( f6_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Performing emergency shutdown.\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down joins.\n" )
	Engine.LobbyJoinErrorShutdown()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down qos probes.\n" )
		Engine.QoSErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down advertisement.\n" )
		Engine.AdvertiseErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shuttding down search.\n" )
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
	if f6_arg0.signoutUsers ~= nil and f6_arg0.signoutUsers == true and Engine.SignOutAllUsers ~= nil then
		Engine.SignOutAllUsers()
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Forcing UI screen.\n" )
	Engine.ForceLobbyUIScreen( LobbyData.UITargets.UI_MAIN.id )
	Engine.LuiVM_Event( "open_main", {} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby emergency shutdown complete.\n" )
end

LobbyVM.LogGlobalData = function ()
	local f7_local0 = {
		playlistVersion = Engine.GetPlaylistVersionNumber(),
		protocolVersion = Engine.GetProtocolVersion()
	}
	if Engine.GetDDLVersion ~= nil then
		f7_local0.ffotdVersion = Engine.GetFFOTDVersion()
		f7_local0.mpStatsDDLVersion = Engine.GetDDLVersion( "gamedata/ddl/mp/mp_stats.ddl" )
		f7_local0.mpLoadoutsDDLVersion = Engine.GetDDLVersion( "gamedata/ddl/loadouts/mp_loadouts.ddl" )
		f7_local0.buildCL = Engine.GetBuildIntField( Enum.BuildIntField.BUILD_INTFIELD_CHANGELIST )
		f7_local0.buildMachine = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_MACHINE )
		f7_local0.buildTime = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_TIME )
		f7_local0.buildType = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_TYPE )
		f7_local0.buildName = Engine.GetBuildStringField( Enum.BuildStringField.BUILD_STRINGFIELD_BUILD_NAME )
	end
	LuaUtils.LogQoS( "global_data", f7_local0 )
end

LobbyVM.OnInit = function ( f8_arg0 )
	
end

LobbyVM.OnUILoad = function ( f9_arg0 )
	local f9_local0 = f9_arg0.init
	Lobby.Debug.OnUILoad( f9_arg0 )
	if f9_local0 then
		Lobby.MapVote.Init()
	end
end

LobbyVM.OnSessionStart = function ( f10_arg0 )
	local f10_local0 = f10_arg0.lobbyModule
	local f10_local1 = f10_arg0.lobbyType
	local f10_local2 = f10_arg0.lobbyMode
	Lobby.MapVote.OnSessionStart( f10_arg0 )
	Lobby.PartyPrivacy.OnSessionStart( f10_arg0 )
	Lobby.Theater.OnSessionStart( f10_arg0 )
	Lobby.Timer.OnSessionStart( f10_arg0 )
	Lobby.TeamSelection.OnSessionStart( f10_arg0 )
	f10_arg0.lobbyID = Engine.GetLobbyLobbyID( f10_local1 )
	LuaUtils.LogQoS( "session_start", f10_arg0 )
	if f10_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and f10_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST then
		Lobby.Debug.SessionSQJClear()
	end
end

LobbyVM.OnSessionEnd = function ( f11_arg0 )
	local f11_local0 = f11_arg0.lobbyModule
	local f11_local1 = f11_arg0.lobbyType
	local f11_local2 = f11_arg0.lobbyMode
	Lobby.TeamSelection.OnSessionEnd( f11_arg0 )
	Lobby.Theater.OnSessionEnd( f11_arg0 )
	f11_arg0.lobbyID = Engine.GetLobbyLobbyID( f11_local1 )
	LuaUtils.LogQoS( "session_end", f11_arg0 )
end

LobbyVM.OnClientAdded = function ( f12_arg0 )
	local f12_local0 = f12_arg0.lobbyModule
	local f12_local1 = f12_arg0.lobbyType
	local f12_local2 = f12_arg0.lobbyMode
	local f12_local3 = f12_arg0.xuid
	Lobby.Matchmaking.OnClientAdded( f12_arg0 )
	Lobby.TeamSelection.OnClientAdded( f12_arg0 )
	Lobby.Pregame.OnClientAdded( f12_arg0 )
	Engine.QoSProbeListenerUpdate( f12_local1 )
	if f12_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.AddLobbyClientExtracam( f12_arg0.xuid )
	end
	if f12_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( f12_local3 ) then
		LobbyVM.PlaySound( LobbyData.Sounds.ClientsAddedToLobby, 500 )
	end
	f12_arg0.lobbyID = Engine.GetLobbyLobbyID( f12_local1 )
	LuaUtils.LogQoS( "client_added", f12_arg0 )
end

LobbyVM.OnClientRemoved = function ( f13_arg0 )
	local f13_local0 = f13_arg0.lobbyModule
	local f13_local1 = f13_arg0.lobbyType
	local f13_local2 = f13_arg0.lobbyMode
	local f13_local3 = f13_arg0.xuid
	Lobby.Pregame.OnClientRemoved( f13_arg0 )
	Lobby.Matchmaking.OnClientRemoved( f13_arg0 )
	Engine.QoSProbeListenerUpdate( f13_local1 )
	if f13_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.RemoveLobbyClientExtracam( f13_arg0.xuid )
	end
	if f13_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( f13_local3 ) and not Engine.IsInGame() then
		LobbyVM.PlaySound( LobbyData.Sounds.ClientsRemovedFromLobby, 500 )
	end
	f13_arg0.lobbyID = Engine.GetLobbyLobbyID( f13_local1 )
	LuaUtils.LogQoS( "client_removed", f13_arg0 )
end

LobbyVM.OnMatchStart = function ( f14_arg0 )
	local f14_local0 = f14_arg0.lobbyModule
	local f14_local1 = f14_arg0.lobbyType
	local f14_local2 = f14_arg0.lobbyMode
	Lobby.Timer.OnMatchStart( f14_arg0 )
	LuaUtils.LogQoS( "match_start", f14_arg0 )
	LuaUtils.UI_ClearErrorMessageDialog()
end

LobbyVM.OnMatchLaunchClient = function ( f15_arg0 )
	local f15_local0 = f15_arg0.lobbyModule
	local f15_local1 = f15_arg0.lobbyType
	local f15_local2 = f15_arg0.lobbyMode
	LuaUtils.LogQoS( "match_launch_client", f15_arg0 )
end

LobbyVM.OnMatchChangeMap = function ( f16_arg0 )
	local f16_local0 = f16_arg0.lobbyModule
	local f16_local1 = f16_arg0.lobbyType
	local f16_local2 = f16_arg0.lobbyMode
	LuaUtils.LogQoS( "match_change_map", f16_arg0 )
end

LobbyVM.OnMatchEnd = function ( f17_arg0 )
	local f17_local0 = f17_arg0.lobbyModule
	local f17_local1 = f17_arg0.lobbyType
	local f17_local2 = f17_arg0.lobbyMode
	Lobby.TeamSelection.OnMatchEnd( f17_arg0 )
	Lobby.Timer.OnMatchEnd( f17_arg0 )
	Lobby.MapVote.OnMatchEnd( f17_arg0 )
	LuaUtils.LogQoS( "match_end", f17_arg0 )
	Engine.FlushKVS( Engine.GetPrimaryController(), Enum.KVSChannel.MATCHMAKING_QOS )
	Lobby.Matchmaking.OnMatchEnd( f17_arg0 )
	LobbyVM.OnlineAdvertiseOnMatchEnd( f17_arg0 )
end

LobbyVM.OnMatchRecordStart = function ( f18_arg0 )
	if f18_arg0.matchId ~= nil then
		LuaUtils.LogQoS( "match_record", f18_arg0 )
	end
end

LobbyVM.OnDisconnect = function ( f19_arg0 )
	local f19_local0 = f19_arg0.lobbyModule
	local f19_local1 = f19_arg0.lobbyType
	local f19_local2 = f19_arg0.lobbyMode
	local f19_local3 = f19_arg0.disconnectClientXuid
	local f19_local4 = f19_arg0.disconnectClient
	local f19_local5 = Engine.GetPrimaryController()
	local f19_local6 = "EXE_DISCONNECTED_FROM_SERVER"
	local f19_local7 = Lobby.Process.Recover( f19_local5 )
	if f19_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_INVALID then
		
	elseif f19_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_DROP then
		
	elseif f19_local4 == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK then
		f19_local6 = "EXE_KICKED_FROM_PARTY"
	end
	f19_local7.tail.success = Lobby.Actions.ErrorPopupMsg( Engine.Localize( f19_local6 ) )
	Lobby.ProcessQueue.AddToQueue( "DisconnectFromHost", f19_local7 )
end

LobbyVM.OnLobbyOnlineUpdate = function ( f20_arg0 )
	local f20_local0 = f20_arg0.type
	if f20_local0 == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_PUMP then
		
	elseif f20_local0 == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_SUCCESS then
		LobbyVM.OnlineAdvertiseSuccess( f20_arg0 )
	elseif f20_local0 == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_ERROR then
		LobbyVM.OnlineAdvertiseError( f20_arg0 )
	end
end

LobbyVM.OnLeaveWithParty = function ( f21_arg0 )
	local f21_local0 = f21_arg0.lobbyModule
	local f21_local1 = f21_arg0.lobbyType
	local f21_local2 = f21_arg0.lobbyMode
	LobbyVM.LobbyLeaveWithParty( f21_arg0 )
end

LobbyVM.OnGametypeSettingsChange = function ( f22_arg0 )
	local f22_local0 = f22_arg0.lobbyModule
	local f22_local1 = f22_arg0.lobbyType
	local f22_local2 = f22_arg0.lobbyMode
	Lobby.TeamSelection.OnGametypeSettingsChange( f22_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
end

LobbyVM.OnPartyPrivacyChange = function ( f23_arg0 )
	local f23_local0 = f23_arg0.partyPrivacy
end

LobbyVM.OnPlatformJoin = function ( f24_arg0 )
	Lobby.PlatformSession.OnPlatformJoin( f24_arg0 )
end

LobbyVM.ComErrorCodeToString = function ( f25_arg0 )
	if f25_arg0 == Enum.errorCode.ERROR_NONE then
		return "ERR_NONE"
	elseif f25_arg0 == Enum.errorCode.ERROR_FATAL then
		return "ERR_FATAL"
	elseif f25_arg0 == Enum.errorCode.ERROR_DROP then
		return "ERR_DROP"
	elseif f25_arg0 == Enum.errorCode.ERROR_FROM_STARTUP then
		return "ERR_FROM_STARTUP"
	elseif f25_arg0 == Enum.errorCode.ERROR_SERVERDISCONNECT then
		return "ERR_SERVERDISCONNECT"
	elseif f25_arg0 == Enum.errorCode.ERROR_DISCONNECT then
		return "ERR_DISCONNECT"
	elseif f25_arg0 == Enum.errorCode.ERROR_SCRIPT then
		return "ERR_SCRIPT"
	elseif f25_arg0 == Enum.errorCode.ERROR_SCRIPT_DROP then
		return "ERR_SCRIPT_DROP"
	elseif f25_arg0 == Enum.errorCode.ERROR_LOCALIZATION then
		return "ERR_LOCALIZATION"
	elseif f25_arg0 == Enum.errorCode.ERROR_UI then
		return "ERR_UI"
	elseif f25_arg0 == Enum.errorCode.ERROR_LUA then
		return "ERR_LUA"
	elseif f25_arg0 == Enum.errorCode.ERROR_SOFTRESTART then
		return "ERR_SOFTRESTART"
	elseif f25_arg0 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
		return "ERR_SOFTRESTART_KEEPDW"
	else
		return tostring( f25_arg0 )
	end
end

LobbyVM.OnComError = function ( f26_arg0 )
	if f26_arg0.isInCleanup then
		LobbyVM.OnComErrorCleanup( f26_arg0 )
		return 
	end
	local f26_local0 = f26_arg0.controller
	local f26_local1 = f26_arg0.errorCode
	local f26_local2 = f26_arg0.errorMsg
	local f26_local3 = f26_arg0.signoutUsers
	local f26_local4 = f26_arg0.comErrorInProgress
	Lobby.Debug.OnComError( f26_arg0 )
	Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyVM.OnComError - errorCode: " .. LobbyVM.ComErrorCodeToString( f26_local1 ) .. ", errorMsg: " .. f26_local2 .. ".\n" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	LuaUtils.LogQoS( "lobby_error", f26_arg0 )
	if f26_local1 == Enum.errorCode.ERROR_SOFTRESTART or f26_local1 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and not Engine.IsSignedInToDemonware( f26_local0 ) then
		LobbyVM.ErrorShutdown( f26_arg0 )
	end
	if f26_local1 == Enum.errorCode.ERROR_UI or f26_local1 == Enum.errorCode.ERROR_DISCONNECT or f26_local1 == Enum.errorCode.ERROR_FATAL or f26_local1 == Enum.errorCode.ERROR_DROP or f26_local1 == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
		return 
	elseif f26_local1 == Enum.errorCode.ERROR_NONE or f26_local1 == Enum.errorCode.ERROR_LUA or f26_local1 == Enum.errorCode.ERROR_FROM_STARTUP or f26_local1 == Enum.errorCode.ERROR_LOCALIZATION or f26_local1 == Enum.errorCode.ERROR_SERVERDISCONNECT then
		LuaUtils.UI_ShowErrorMessageDialog( f26_local0, f26_local2 )
		return 
	elseif f26_local1 == Enum.errorCode.ERROR_SCRIPT or f26_local1 == Enum.errorCode.ERROR_SCRIPT_DROP then
		LuaUtils.UI_ShowErrorMessageDialog( f26_local0, f26_local2 )
		Lobby.ProcessQueue.AddToQueue( "ErrorNonFatal", Lobby.Process.NonFatalError( f26_local2 ) )
		return 
	end
	error( "LobbyVM.OnError - Unhandled COM_ERROR: " .. LobbyVM.ComErrorCodeToString( f26_local1 ) .. ", Message: " .. f26_local2 .. ".\n" )
end

LobbyVM.OnComErrorCleanup = function ( f27_arg0 )
	local f27_local0 = f27_arg0.controller
	local f27_local1 = f27_arg0.errorCode
	local f27_local2 = f27_arg0.errorMsg
	local f27_local3 = f27_arg0.errorShutdown
	Engine.LobbyLaunchClear()
	if f27_arg0.errorShutdown ~= nil and f27_arg0.errorShutdown == true then
		LobbyVM.ErrorShutdown( f27_arg0 )
	end
	if f27_local1 == Enum.errorCode.ERROR_FATAL then
		LuaUtils.UI_ShowErrorMessageDialog( f27_local0, f27_local2 )
		local f27_local4 = Lobby.Process.Recover( f27_local0 )
		if f27_local4 ~= nil then
			Lobby.ProcessQueue.AddToQueue( "ErrorFatal", f27_local4 )
		end
	elseif f27_local1 == Enum.errorCode.ERROR_DROP then
		local f27_local4 = Lobby.Process.Recover( f27_local0 )
		if f27_local4 then
			local f27_local5 = Lobby.Actions.ErrorPopupMsg( f27_local2 )
			Lobby.Process.AddActions( f27_local4.tail, f27_local5, f27_local5, f27_local5 )
			Lobby.ProcessQueue.AddToQueue( "ERROR_DROP", f27_local4 )
		else
			LuaUtils.UI_ShowErrorMessageDialog( f27_local0, f27_local2 )
		end
	elseif f27_local1 == 1026 then
		Lobby.ProcessQueue.ClearQueue()
		LuaUtils.UI_ShowErrorMessageDialog( f27_local0, f27_local2 )
	elseif f27_local1 == 2050 and string.len( f27_local2 ) > 0 then
		LuaUtils.UI_ShowErrorMessageDialog( f27_local0, f27_local2 )
	end
end

LobbyVM.OnErrorShutdown = function ( f28_arg0 )
	LobbyVM.ErrorShutdown( f28_arg0 )
end

LobbyVM.OnPlayerBanned = function ( f29_arg0 )
	Lobby.Anticheat.OnPlayerBanned( f29_arg0 )
end

LobbyVM.OnFeatureBan = function ( f30_arg0 )
	Lobby.Anticheat.OnFeatureBan( f30_arg0 )
end

LobbyVM.OnStorageRead = function ( f31_arg0 )
	if f31_arg0.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", f31_arg0 )
	elseif f31_arg0.fileName == "stats_mp" then
		LobbyVM.OnDownloadMPOnlineStats( f31_arg0.controller )
	end
end

LobbyVM.OnStorageWrite = function ( f32_arg0 )
	if f32_arg0.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", f32_arg0 )
	end
end

LobbyVM.OnRecordComScoreEvent = function ( f33_arg0 )
	local f33_local0 = f33_arg0.controller
	local f33_local1 = f33_arg0.eventCategoryName
	local f33_local2 = {}
	for f33_local6, f33_local7 in pairs( f33_arg0.EventParams ) do
		table.insert( f33_local2, f33_local6 )
		table.insert( f33_local2, f33_local7 )
	end
	if #f33_local2 > 0 and #f33_local2 % 2 == 0 then
		Engine.RecordComScoreEvent( f33_local0, f33_local1, unpack( f33_local2 ) )
	end
end

LobbyVM.OnKVSFlush = function ()
	LobbyVM.LogGlobalData()
end

LobbyVM.OnExecFFOTD = function ()
	LobbyVM.LogGlobalData()
end

LobbyVM.InitilizeGunsmithBuffer = function ( f36_arg0 )
	local f36_local0 = f36_arg0.controller
	Engine.StorageReset( f36_local0, Enum.StorageFileType.STORAGE_GUNSMITH )
	LuaUtils.Gunsmith.InitializeBuffer( Engine.StorageGetBuffer( f36_local0, Enum.StorageFileType.STORAGE_GUNSMITH ) )
	Engine.StorageWrite( f36_local0, Enum.StorageFileType.STORAGE_GUNSMITH )
end

LobbyVM.OnDownloadMPOnlineStats = function ( f37_arg0 )
	if not Engine.StorageIsFileReady( f37_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	end
	local f37_local0 = Engine.StorageGetBuffer( f37_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f37_local0 then
		local f37_local1 = f37_local0.itemStats
		if f37_local1 then
			for f37_local2 = 1, 255, 1 do
				if Engine.ItemIndexValid( f37_local2, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemUnlockLevel( f37_local2, Enum.eModes.MODE_MULTIPLAYER ) == 0 then
					f37_local1[f37_local2].markedOld:set( 1 )
				end
			end
		end
	end
end

LobbyVM.OnInitializeLoadouts = function ( f38_arg0 )
	local f38_local0 = f38_arg0.controller
	local f38_local1 = f38_arg0.storageFileType
	local f38_local2 = f38_arg0.statsNetworkType
	if f38_local1 == Enum.StorageFileType.STORAGE_ZM_LOADOUTS then
		local f38_local3 = LuaUtils.Gunsmith.InitializeBuffer
		local f38_local4 = Engine.StorageGetBuffer( f38_local0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		f38_local3( f38_local4.cacLoadouts )
		f38_local3 = LuaUtils.Gunsmith.InitializeBuffer
		f38_local4 = Engine.StorageGetBuffer( f38_local0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		f38_local3( f38_local4.customMatchCacLoadouts )
	elseif f38_local1 == Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE then
		local f38_local3 = LuaUtils.Gunsmith.InitializeBuffer
		local f38_local4 = Engine.StorageGetBuffer( f38_local0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
		f38_local3( f38_local4.cacLoadouts )
	elseif f38_local1 == Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE then
		local f38_local3 = Engine.StorageGetBuffer( f38_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
		f38_local3 = f38_local3.cacLoadouts
		local f38_local4 = Engine.GetEquippedHeroForCACType( f38_local0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_OFFLINE )
		if f38_local4 then
			local f38_local5 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f38_local4, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if f38_local3 and f38_local3.heroweapon then
				f38_local3.heroweapon:set( f38_local5 )
			end
		end
	elseif f38_local1 == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		local f38_local3 = Engine.StorageGetBuffer( f38_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f38_local3 = f38_local3.cacLoadouts
		local f38_local4 = Engine.StorageGetBuffer( f38_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		f38_local4 = f38_local4.customMatchCacLoadouts
		local f38_local5 = Engine.GetEquippedHeroForCACType( f38_local0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC )
		if f38_local5 then
			local f38_local6 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f38_local5, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if f38_local3 and f38_local3.heroweapon then
				f38_local3.heroweapon:set( f38_local6 )
			end
			if f38_local4 and f38_local4.heroweapon then
				f38_local4.heroweapon:set( f38_local6 )
			end
		end
	end
end

LobbyVM.LobbyHostLeftNoMigration = function ( f39_arg0 )
	local f39_local0 = f39_arg0.controller
	local f39_local1 = f39_arg0.lobbyType
	local f39_local2 = f39_arg0.lobbyMainMode
	local f39_local3 = f39_arg0.lobbyNetworkMode
	local f39_local4 = f39_arg0.maxClients
	local f39_local5 = f39_arg0.isGameLobbyActive
	local f39_local6 = f39_arg0.isPrivateHost
	if f39_local5 == true then
		if Lobby.ProcessQueue.GetCurrentRunningProcessName() ~= "HostLeftNoMigrationGame" then
			Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigrationGame", Lobby.Process.Recover( f39_local0 ) )
		end
	else
		Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigration", Lobby.Process.HostLeftNoMigrationCreatePrivateLobby( f39_local0, f39_local2, f39_local4 ) )
	end
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "host_left_no_migration", f39_arg0 )
end

LobbyVM.LobbyHostLeft_InGameMigrateFinished = function ( f40_arg0 )
	local f40_local0 = Lobby.Process.Recover( f40_arg0.controller )
	if LobbyVM.AutoJoin.data ~= nil then
		local f40_local1 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		if f40_local1 ~= nil then
			Lobby.Process.AppendProcess( f40_local0, f40_local1 )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyHostLeft_InGameMigrateFinished", f40_local0 )
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "ingame_migrate_finished", f40_arg0 )
end

LobbyVM.LobbyClientLeftEvent = function ( f41_arg0 )
	local f41_local0 = f41_arg0.controller
	local f41_local1 = f41_arg0.lobbyType
	local f41_local2 = f41_arg0.lobbyMainMode
	local f41_local3 = f41_arg0.lobbyNetworkMode
	local f41_local4 = f41_arg0.maxClients
	local f41_local5 = Lobby.Process.Recover( f41_local0 )
	if LobbyVM.AutoJoin.data ~= nil then
		local f41_local6 = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		if f41_local6 ~= nil then
			Lobby.Process.AppendProcess( f41_local5, f41_local6 )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyClientLeft", f41_local5 )
end

LobbyVM.Devmap = function ( f42_arg0 )
	Lobby.ProcessQueue.AddToQueue( "Devmap", Lobby.Process.Devmap( f42_arg0.controller, f42_arg0.mainMode ) )
end

LobbyVM.DevmapClient = function ( f43_arg0 )
	Lobby.ProcessQueue.AddToQueue( "DevmapClient", Lobby.Process.DevmapClient( f43_arg0.controller ) )
end

LobbyVM.NetworkModeChanged = function ( f44_arg0 )
	Lobby.ProcessQueue.AddToQueue( "NetworkModeChanged", Lobby.Process.ReloadPrivateLobby( f44_arg0.controller, f44_arg0.networkMode ) )
end

LobbyVM.GoForward = function ( f45_arg0 )
	local f45_local0 = f45_arg0.controller
	local f45_local1 = f45_arg0.navToMenu
	local f45_local2 = f45_arg0.withParty
	local f45_local3 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	local f45_local4 = LobbyData:UITargetFromName( f45_local1 )
	if f45_local3 == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if f45_local4 == nil then
		error( "LobbyVM: No menu called '" .. f45_local1 .. "' found." )
	end
	local f45_local5 = Lobby.Process.GetForwardFunc( f45_local3, f45_local4 )
	if f45_local5 == nil then
		error( "LobbyVM: No forward process function found to move from '" .. f45_local3.name .. "' to '" .. f45_local1 .. "'." )
	end
	Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. f45_local3.name .. "' menu to '" .. f45_local4.name .. "' menu.", f45_local5( f45_local0, f45_local3, f45_local4 ) )
end

LobbyVM.GoBack = function ( f46_arg0 )
	local f46_local0 = f46_arg0.controller
	local f46_local1 = f46_arg0.withParty
	local f46_local2 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if f46_local2 == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	local f46_local3, f46_local4 = Lobby.Process.GetBackFunc( f46_local2 )
	if f46_local3 == nil or f46_local4 == nil then
		error( "LobbyVM: No back process function found for '" .. currentMenu( "'." ) )
	end
	Lobby.ProcessQueue.AddToQueue( "GoBackFrom" .. f46_local2.name, f46_local4( f46_local0, f46_local2, f46_local3, f46_local1 ) )
end

LobbyVM.ManagePartyLeave = function ( f47_arg0 )
	local f47_local0 = f47_arg0.controller
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
		Lobby.ProcessQueue.AddToQueue( "ManagePartyLeave", Lobby.Process.ManagePartyLeave( f47_local0 ) )
	else
		Lobby.ProcessQueue.AddToQueue( "PartyMemberLeave", Lobby.Process.ReloadPrivateLobby( f47_local0, Engine.GetLobbyNetworkMode() ) )
	end
end

LobbyVM.InGameJoin = function ( f48_arg0 )
	LobbyVM.AutoJoin.data = f48_arg0
end

LobbyVM.GetJoinProcess = function ( f49_arg0 )
	local f49_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f49_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.LobbyIsPlayerInLobby( f49_local0, f49_arg0.xuid ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of\n" )
		return nil
	else
		return Lobby.Process.Join( f49_arg0.controller, f49_arg0.xuid, f49_arg0.joinType, LuaEnums.LEAVE_WITH_PARTY.WITH )
	end
end

LobbyVM.Join = function ( f50_arg0 )
	local f50_local0 = LobbyVM.GetJoinProcess( f50_arg0 )
	if f50_local0 ~= nil then
		Lobby.ProcessQueue.AddToQueue( "Join", f50_local0 )
	end
end

LobbyVM.OnJoinComplete = function ( f51_arg0 )
	Lobby.Debug.OnJoinComplete( f51_arg0 )
end

LobbyVM.JoinSystemlink = function ( f52_arg0 )
	Lobby.ProcessQueue.AddToQueue( "JoinSystemLink", Lobby.Process.JoinSystemlink( f52_arg0.controller, f52_arg0.lobbyMainMode, f52_arg0.lobbyNetworkMode, f52_arg0.hostXuid, f52_arg0.hostInfo ) )
end

LobbyVM.CreateDedicatedLANLobby = function ()
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLANLobby", Lobby.Process.CreateDedicatedLANLobby( 0, LobbyData.UITargets.UI_MPLOBBYLANGAME ) )
end

LobbyVM.CreateDedicatedLobby = function ( f54_arg0 )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLobby", Lobby.Process.CreateDedicatedLobby( 0, LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME ) )
end

LobbyVM.ForceToMenu = function ( f55_arg0 )
	Lobby.ProcessQueue.AddToQueue( "ForceToMenu", Lobby.Process.ForceToMenu( f55_arg0.controller, LobbyData:UITargetFromName( f55_arg0.menuName ), f55_arg0.msg ) )
end

LobbyVM.LobbyClientPromoteToHost = function ( f56_arg0 )
	Lobby.ProcessQueue.AddToQueue( "PromoteClientToHost", Lobby.Process.PromoteClientToHost( f56_arg0.controller, f56_arg0.lobbyMainMode, f56_arg0.lobbyType, f56_arg0.lobbyMode, f56_arg0.maxClients, f56_arg0.hostInfo, f56_arg0.isAdvertised, f56_arg0.isInGame, f56_arg0.newMigrateIndex ) )
end

LobbyVM.LobbyLeaveWithParty = function ( f57_arg0 )
	local f57_local0 = Lobby.Process.LeaveWithParty( f57_arg0.lobbyModule, f57_arg0.lobbyType, f57_arg0.lobbyMode )
	if f57_local0 == nil then
		return 
	else
		Lobby.ProcessQueue.AddToQueue( "LeaveWithParty", f57_local0 )
	end
end

LobbyVM.LobbyLocalClientLeave = function ( f58_arg0 )
	local f58_local0 = Lobby.Process.LocalClientLeave( f58_arg0.controller )
	if f58_local0 == nil then
		return 
	else
		Lobby.ProcessQueue.AddToQueue( "LocalClientLeave", f58_local0 )
	end
end

LobbyVM.LobbySettings = function ( f59_arg0 )
	local f59_local0 = f59_arg0.controller
	local f59_local1 = f59_arg0.toTarget
	local f59_local2 = f59_arg0.skipSwitchMode
	if type( f59_local1 ) == "number" then
		f59_local1 = LobbyData:UITargetFromId( f59_local1 )
	end
	if f59_local1 == nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Tried to apply settings for an invalid target.\n" )
		return 
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Applying settings for menu: " .. f59_local1.name .. ".\n" )
	if not f59_local2 then
		local f59_local3 = Engine.GetLobbyMainMode()
		local f59_local4 = f59_local1.mainMode
		if Engine.SwitchCampaignMode then
			if f59_local4 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				if LuaUtils.IsCPZMTarget( f59_local1.id ) then
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES )
				else
					Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
				end
			else
				Engine.SwitchCampaignMode( Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
			end
		end
		if f59_local3 ~= f59_local4 then
			if f59_local4 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				Engine.SwitchMode( f59_local0, "mp" )
			elseif f59_local4 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				Engine.SwitchMode( f59_local0, "cp" )
			elseif f59_local4 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
				Engine.SwitchMode( f59_local0, "zm" )
			else
				Engine.SwitchMode( f59_local0, "" )
			end
		end
	end
	if f59_local1.eGameModes == Enum.eGameModes.MODE_GAME_INVALID then
		Engine.GameModeResetModes()
	else
		Engine.TEMPGameModeSetMode( f59_local1.eGameModes )
	end
end

LobbyVM.UpdateUI = function ( f60_arg0 )
	local f60_local0 = f60_arg0.toTarget
	local f60_local1 = f60_arg0.controller
	if type( f60_local0 ) == "number" then
		f60_local0 = LobbyData:UITargetFromId( f60_local0 )
	end
	local f60_local2 = function ( f61_arg0 )
		if f61_arg0 == "auto" then
			return "room2"
		else
			return f61_arg0
		end
	end
	
	LobbyData.SetLobbyNav( f60_local0 )
	Engine.SetLobbyUIScreen( f60_local0.id )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMode", true ), f60_local0.lobbyMode )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode", true ), f60_local0.mainMode )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode", true ), f60_local0.eGameModes )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room", true ), f60_local2( f60_local0.room ) )
end

LobbyVM.Leaderboard_CalculateLBColValue = function ( f62_arg0 )
	return Lobby.Leaderboard.CalculateLBColValue( f62_arg0 )
end

LobbyVM.Leaderboard_ShouldWriteLeaderboard = function ( f63_arg0 )
	return Lobby.Leaderboard.ShouldWriteLeaderboard( f63_arg0 )
end

LobbyVM.LaunchGameExec = function ( f64_arg0, f64_arg1 )
	if f64_arg1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch game not supported for this lobby type(" .. f64_arg1 .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		local f64_local0 = Dvar.ui_mapname:get()
		local f64_local1 = Dvar.ui_gametype:get()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching game... **\n" )
		Engine.Exec( f64_arg0, "lobbyLaunchGame " .. f64_arg1 .. " " .. f64_local0 .. " " .. f64_local1 )
	else
		local f64_local0 = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch game. Lobby process '" .. f64_local0.name .. "' in progress.\n" )
	end
end

LobbyVM.LaunchDemoExec = function ( f65_arg0, f65_arg1 )
	if f65_arg1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch demo not supported for this lobby type(" .. f65_arg1 .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching demo... **\n" )
		Engine.Exec( f65_arg0, "lobbyLaunchDemo" )
	else
		local f65_local0 = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch damo. Lobby process '" .. f65_local0.name .. "' in progress.\n" )
	end
end

LobbyVM.HostLaunchInit = function ()
	LobbyVM.hostLaunch = {}
	LobbyVM.hostLaunch.fadeToBlack = false
	local f66_local0 = Engine.milliseconds()
	LobbyVM.hostLaunch.startTime = f66_local0
	LobbyVM.hostLaunch.fadeToBlackTime = f66_local0 + Dvar.lobbyLaunch_fadeToBlackDelay:get()
	LobbyVM.hostLaunch.launchTime = f66_local0 + Dvar.lobbyLaunch_gameLaunchDelay:get()
	LobbyVM.hostLaunch.waitForClientAckTime = f66_local0 + Dvar.lobbyLaunch_waitForClientAckDelay:get()
	return true
end

LobbyVM.HostLaunchPump = function ( f67_arg0 )
	if not Engine.IsDedicatedServer() then
		if LobbyVM.hostLaunch.fadeToBlack == false and Engine.milliseconds() > LobbyVM.hostLaunch.fadeToBlackTime then
			LobbyVM.hostLaunch.fadeToBlack = true
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 1 )
		end
		if Engine.milliseconds() < LobbyVM.hostLaunch.launchTime then
			return false
		end
	end
	if not f67_arg0.hasAllClientsGotLatestStateMsg or Engine.milliseconds() < LobbyVM.hostLaunch.waitForClientAckTime then
		return false
	end
	return true
end

LobbyVM.HostLaunch = function ( f68_arg0 )
	if f68_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.HostLaunchInit()
	elseif f68_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.HostLaunchPump( f68_arg0 )
	elseif f68_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_CLEAR then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	end
end

LobbyVM.ClientLaunchInit = function ( f69_arg0 )
	LobbyVM.clientLaunch = {}
	LobbyVM.clientLaunch.fadeToBlack = false
	local f69_local0 = Dvar.lobbyLaunch_fadeToBlackDelay:get()
	local f69_local1 = Dvar.lobbyLaunch_gameLaunchDelay:get()
	if f69_arg0 then
		f69_local0 = Dvar.lobbyLaunch_fadeToBlackDelayOnConnect:get()
		f69_local1 = Dvar.lobbyLaunch_gameLaunchDelayOnConnect:get()
	end
	local f69_local2 = Engine.milliseconds()
	LobbyVM.clientLaunch.startTime = f69_local2
	LobbyVM.clientLaunch.fadeToBlackTime = f69_local2 + f69_local0
	LobbyVM.clientLaunch.launchTime = f69_local2 + f69_local1
	return true
end

LobbyVM.ClientLaunchPump = function ()
	if LobbyVM.clientLaunch.fadeToBlack == false and LobbyVM.clientLaunch.fadeToBlackTime < Engine.milliseconds() then
		LobbyVM.clientLaunch.fadeToBlack = true
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 1 )
	end
	if LobbyVM.clientLaunch.launchTime > Engine.milliseconds() then
		return false
	else
		return true
	end
end

LobbyVM.ClientLaunch = function ( f71_arg0 )
	if f71_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.ClientLaunchInit( f71_arg0.justConnected )
	elseif f71_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.ClientLaunchPump()
	elseif f71_arg0.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_CLEAR then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	end
end

LobbyVM.LaunchGame = function ( f72_arg0 )
	Lobby.Timer.LaunchGame( f72_arg0 )
end

LobbyVM.LaunchDemo = function ( f73_arg0 )
	Lobby.Timer.LaunchGame( f73_arg0 )
end

LobbyVM.UpdateLobbyStatusInfo = function ( f74_arg0 )
	Lobby.Timer.UpdateLobbyStatusInfo( f74_arg0 )
	Lobby.Pregame.UpdateLobbyStatusInfo( f74_arg0 )
end

LobbyVM.LobbyHost_ClientSelectionReceived = function ( f75_arg0 )
	Lobby.Pregame.LobbyHost_ClientSelectionReceived( f75_arg0 )
end

LobbyVM.SwitchTeam = function ( f76_arg0 )
	Lobby.TeamSelection.SwitchTeam( f76_arg0 )
end

LobbyVM.GameModeChanged = function ( f77_arg0 )
	Lobby.TeamSelection.GameModeChanged( f77_arg0 )
end

LobbyVM.CanFitLobbys = function ( f78_arg0 )
	return Lobby.TeamSelection.CanFitLobbys( f78_arg0 )
end

LobbyVM.UpdateAdvertising = function ( f79_arg0 )
	if f79_arg0.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.Matchmaking.UpdateAdvertising( "force update from code" )
	end
end

LobbyVM.Invite = function ( f80_arg0 )
	Lobby.PlatformSession.Invite( f80_arg0 )
end

LobbyVM.SessionSQJRefreshInfo = function ( f81_arg0 )
	Lobby.Debug.SessionSQJRefreshInfo()
end

LobbyVM.StopLobbyTimer = function ( f82_arg0 )
	Lobby.Timer.HostingLobbyEnd( f82_arg0 )
end

LobbyVM.ChangeSigninState = function ( f83_arg0 )
	local f83_local0 = nil
	if f83_arg0.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_OUT then
		if f83_arg0.isPrimary then
			f83_local0 = Lobby.Process.PrimaryControllerSignedOut( f83_arg0.controller )
		end
	elseif f83_arg0.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_IN then
		if f83_arg0.isPrimary then
			f83_local0 = Lobby.Process.PrimaryControllerSignedIn( f83_arg0.controller )
		end
	else
		DebugPrint( "Warning unknown signin State [" .. f83_arg0.onlineState .. "]" )
	end
	if f83_local0 ~= nil then
		Lobby.ProcessQueue.AddToQueue( "ChangeSignInState", f83_local0 )
	end
end

LobbyVM.LobbyOnline = {
	errorCount = 0,
	errorTime = -1,
	reAdvertiseTime = -1,
	comError = false,
	RE_ADVERTISE_INTERVAL = 30000,
	ADVERTISE_ERROR_TIME = 300000
}
LobbyVM.OnlineAdvertiseClear = function ()
	LobbyVM.LobbyOnline = {
		errorCount = 0,
		errorTime = -1,
		reAdvertiseTime = -1,
		comError = false,
		RE_ADVERTISE_INTERVAL = 30000,
		ADVERTISE_ERROR_TIME = 300000
	}
end

LobbyVM.OnlineAdvertiseSuccess = function ( f85_arg0 )
	LobbyVM.OnlineAdvertiseClear()
end

LobbyVM.OnlineAdvertiseError = function ( f86_arg0 )
	LobbyVM.LobbyOnline.errorCount = LobbyVM.LobbyOnline.errorCount + 1
	if Engine.IsDedicatedServer() == true then
		if LobbyVM.LobbyOnline.errorCount == 1 then
			LobbyVM.LobbyOnline.errorTime = Engine.milliseconds() + LobbyVM.LobbyOnline.ADVERTISE_ERROR_TIME
		end
		LobbyVM.LobbyOnline.reAdvertiseTime = Engine.milliseconds() + LobbyVM.LobbyOnline.RE_ADVERTISE_INTERVAL
	elseif Engine.IsInGame() then
		LobbyVM.LobbyOnline.comError = true
	else
		LobbyVM.OnlineAdvertiseClear()
		Engine.ComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
	end
end

LobbyVM.OnlineAdvertisePump = function ( f87_arg0 )
	if Engine.IsDedicatedServer() == false then
		return 
	elseif LobbyVM.LobbyOnline.errorCount == 0 then
		return 
	elseif Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		LobbyVM.OnlineAdvertiseClear()
		return 
	elseif LobbyVM.LobbyOnline.errorCount > 0 and Lobby.ProcessQueue.IsQueueEmpty() == true then
		if Engine.milliseconds() > LobbyVM.LobbyOnline.reAdvertiseTime then
			Lobby.ProcessQueue.AddToQueue( "ReAdvertiseLobby", Lobby.Process.ReAdvertiseLobby( controller ) )
			LobbyVM.LobbyOnline.reAdvertiseTime = Engine.milliseconds() + LobbyVM.LobbyOnline.RE_ADVERTISE_INTERVAL
		end
		if Engine.milliseconds() > LobbyVM.LobbyOnline.errorTime then
			if Engine.IsInGame() then
				LobbyVM.LobbyOnline.comError = true
			else
				Engine.AdvertiseErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
				LobbyVM.OnlineAdvertiseClear()
				Engine.ComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
			end
		end
	end
end

LobbyVM.OnlineAdvertiseOnMatchEnd = function ( f88_arg0 )
	if LobbyVM.LobbyOnline.errorCount > 0 and LobbyVM.LobbyOnline.comError == true then
		LobbyVM.OnlineAdvertiseClear()
		Engine.ComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
	end
end

LobbyVM.JoinResultToString = function ( f89_arg0, f89_arg1 )
	local f89_local0 = {
		debug = "",
		errorMsg = ""
	}
	if f89_arg1 == true then
		f89_local0.debug = "Enum.JoinResult.JOIN_RESULT_"
	end
	if f89_arg0 == Enum.JoinResult.JOIN_RESULT_INVALID then
		f89_local0.debug = f89_local0.debug .. "INVALID"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		f89_local0.debug = f89_local0.debug .. "SUCCESS"
		f89_local0.errorMsg = ""
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_CONNECT_TO_HOST_FAILURE then
		f89_local0.debug = f89_local0.debug .. "CONNECT_TO_HOST_FAILURE"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_SEND_FAILURE then
		f89_local0.debug = f89_local0.debug .. "PROBE_SEND_FAILURE"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_TIMEOUT then
		f89_local0.debug = f89_local0.debug .. "PROBE_TIMEOUT"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_LOBBY then
		f89_local0.debug = f89_local0.debug .. "PROBE_INVALID_LOBBY"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_INFO then
		f89_local0.debug = f89_local0.debug .. "PROBE_INVALID_INFO"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_PROBE_RESULT_INVALID then
		f89_local0.debug = f89_local0.debug .. "PROBE_RESULT_INVALID"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_INVALID_LOBBY then
		f89_local0.debug = f89_local0.debug .. "INVALID_LOBBY"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_SEND_AGREEMENT_REQUEST_FAILED then
		f89_local0.debug = f89_local0.debug .. "SEND_AGREEMENT_REQUEST_FAILED"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED then
		f89_local0.debug = f89_local0.debug .. "JOIN_DISABLED"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_JOIN_ALREADY_IN_PROGRESS then
		f89_local0.debug = f89_local0.debug .. "JOIN_ALREADY_IN_PROGRESS"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_CLOSED then
		f89_local0.debug = f89_local0.debug .. "NOT_JOINABLE_CLOSED"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_CLOSED"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY then
		f89_local0.debug = f89_local0.debug .. "NOT_JOINABLE_INVITE_ONLY"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY then
		f89_local0.debug = f89_local0.debug .. "NOT_JOINABLE_FRIENDS_ONLY"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_LOBBY_FULL then
		f89_local0.debug = f89_local0.debug .. "LOBBY_FULL"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_LOBBY_FULL"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_NETWORK_MODE_MISMATCH then
		f89_local0.debug = f89_local0.debug .. "NETWORK_MODE_MISMATCH"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NETWORK_MODE_MISMATCH"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLISTID then
		f89_local0.debug = f89_local0.debug .. "MISMATCH_PLAYLISTID"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLISTID"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW then
		f89_local0.debug = f89_local0.debug .. "MISMATCH_PLAYLIST_VERSION_TO_NEW"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD then
		f89_local0.debug = f89_local0.debug .. "MISMATCH_PLAYLIST_VERSION_TO_OLD"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_PROTOCOL_VERSION then
		f89_local0.debug = f89_local0.debug .. "MISMATCH_PROTOCOL_VERSION"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PROTOCOL_VERSION"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM then
		f89_local0.debug = f89_local0.debug .. "MISMATCH_NETFIELD_CHECKSUM"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_NEW then
		f89_local0.debug = f89_local0.debug .. "MISMATCH_FFOTD_VERSION_TO_NEW"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_OLD then
		f89_local0.debug = f89_local0.debug .. "MISMATCH_FFOTD_VERSION_TO_OLD"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_MIGRATE_IN_PROGRESS then
		f89_local0.debug = f89_local0.debug .. "MIGRATE_IN_PROGRESS"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_MIGRATE_IN_PROGRESS"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_COULD_NOT_RESERVE then
		f89_local0.debug = f89_local0.debug .. "COULD_NOT_RESERVE"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_COULD_NOT_RESERVE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_HANDSHAKE_WINDOW_EXPIRED then
		f89_local0.debug = f89_local0.debug .. "HANDSHAKE_WINDOW_EXPIRED"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif f89_arg0 == Enum.JoinResult.JOIN_RESULT_AGREEMENT_WINDOW_EXPIRED then
		f89_local0.debug = f89_local0.debug .. "AGREEMENT_WINDOW_EXPIRED"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	else
		f89_local0.debug = f89_local0.debug .. "UNHANDLED JOINRESULT ENUM(" .. tostring( f89_arg0 ) .. ")"
		f89_local0.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	end
	return f89_local0
end

LobbyVM.ClearLobbyStatus = function ()
	if LobbyVM.lobbyStatus.cleared == true then
		return 
	elseif LobbyVM.lobbyStatus.clearedTime > Engine.milliseconds() then
		return 
	else
		LobbyVM.lobbyStatus.cleared = true
		local f90_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local f90_local1 = Engine.CreateModel( f90_local0, "lobbyStatusString1" )
		local f90_local2 = Engine.CreateModel( f90_local0, "lobbyStatusString2" )
		local f90_local3 = Engine.CreateModel( f90_local0, "lobbyStatusString3" )
		Engine.SetModelValue( f90_local1, "" )
		Engine.SetModelValue( f90_local2, "" )
		Engine.SetModelValue( f90_local3, "" )
	end
end

LobbyVM.LobbyStatusUpdate = function ( f91_arg0 )
	local f91_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local f91_local1 = Engine.CreateModel( f91_local0, "lobbyStatusString1" )
	local f91_local2 = Engine.CreateModel( f91_local0, "lobbyStatusString2" )
	local f91_local3 = Engine.CreateModel( f91_local0, "lobbyStatusString3" )
	LobbyVM.lobbyStatus.cleared = false
	LobbyVM.lobbyStatus.clearedTime = Engine.milliseconds() + 10000
	local f91_local4 = f91_arg0.searchStage
	local f91_local5 = ""
	if f91_local4 == 1 then
		local f91_local6 = f91_arg0.numResults
		if f91_local6 == 1 then
			f91_local5 = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE_SINGLE" )
		else
			f91_local5 = Engine.Localize( "MENU_SESSIONS_SEARCH_STAGE", f91_local6 )
		end
		Engine.SetModelValue( f91_local1, f91_local5 )
		Engine.SetModelValue( f91_local2, "" )
		Engine.SetModelValue( f91_local3, "" )
	elseif f91_local4 == 2 then
		Engine.SetModelValue( f91_local2, Engine.Localize( "MENU_SESSIONS_QOS_PROGRESS", f91_arg0.contactedResults, f91_arg0.numResults ) )
	elseif f91_local4 == 3 then
		Engine.SetModelValue( f91_local3, Engine.Localize( "MENU_SESSIONS_JOINING", f91_arg0.joiningCurHost, f91_arg0.joiningNumHosts ) )
	end
end

LobbyVM.ProcessCompleteSuccess = function ( f92_arg0 )
	Lobby.ProcessQueue.Success( f92_arg0 )
end

LobbyVM.ProcessCompleteFailure = function ( f93_arg0 )
	Lobby.ProcessQueue.Failure( f93_arg0 )
end

LobbyVM.ProcessCompleteError = function ( f94_arg0 )
	Lobby.ProcessQueue.Error( f94_arg0 )
end

LobbyVM.ProcessUpdate = function ( f95_arg0 )
	Lobby.ProcessQueue.Update( f95_arg0 )
end

LobbyVM.GameLobbyGameServerDataUpdate = function ( f96_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" ), "name" ), Engine.ToUpper( Engine.GetPlaylistName( 0, Engine.GetPlaylistID() ) ) )
	Lobby.MapVote.GameLobbyGameServerDataUpdate( f96_arg0 )
end

LobbyVM.GameLobbyClientDataUpdate = function ( f97_arg0 )
	Lobby.MapVote.GameLobbyClientDataUpdate( f97_arg0 )
	Lobby.TeamSelection.GameLobbyClientDataUpdate( f97_arg0 )
	Lobby.Pregame.GameLobbyClientDataUpdate( f97_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
end

LobbyVM.LobbyPumpList = {}
LobbyVM.LobbyPumpList.sequence = 0
LobbyVM.LobbyPumpList.funcs = {
	Lobby.ProcessQueue.Pump,
	Lobby.MapVote.Pump,
	Lobby.Merge.Pump,
	Lobby.TeamSelection.Pump,
	Lobby.Timer.Pump,
	Lobby.Pregame.Pump,
	Lobby.Debug.Pump,
	Lobby.Theater.Pump,
	Lobby.PlatformSession.Pump,
	Lobby.Hopper.Pump,
	LobbyVM.ClearLobbyStatus,
	Lobby.Anticheat.Pump
}
LobbyVM.Pump = function ()
	LobbyVM.LobbyPumpList.sequence = math.fmod( LobbyVM.LobbyPumpList.sequence, #LobbyVM.LobbyPumpList.funcs )
	LobbyVM.LobbyPumpList.sequence = LobbyVM.LobbyPumpList.sequence + 1
	LobbyVM.LobbyPumpList.funcs[LobbyVM.LobbyPumpList.sequence]()
end

LobbyVM.HopperClientJoin = function ( f99_arg0 )
	return Lobby.Hopper.ClientJoin( f99_arg0 )
end

LobbyVM.HopperIsParked = function ()
	return Lobby.Hopper.IsParked()
end

LobbyVM.OnDediQosReady = function ()
	local f101_local0 = Engine.GetDediQosResultsByType( Lobby.Matchmaking.DatacenterType.GAMESERVERS )
	if f101_local0.numResults == 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Engine told us results were ready, but no results available\n" )
	else
		servers = f101_local0.pingResults
		for f101_local4, f101_local5 in ipairs( servers ) do
			LuaUtils.LogQoS( "dediqos", f101_local5 )
		end
	end
end

LobbyVM.LobbyPumpList = {}
LobbyVM.LobbyPumpList.sequence = 0
LobbyVM.LobbyPumpList.funcs = {
	Lobby.ProcessQueue.Pump,
	Lobby.MapVote.Pump,
	Lobby.Merge.Pump,
	Lobby.TeamSelection.Pump,
	Lobby.Timer.Pump,
	Lobby.Pregame.Pump,
	Lobby.Debug.Pump,
	Lobby.Theater.Pump,
	Lobby.Hopper.Pump,
	LobbyVM.ClearLobbyStatus,
	Lobby.Anticheat.Pump
}
LobbyVM.Pump = function ()
	LobbyVM.LobbyPumpList.sequence = math.fmod( LobbyVM.LobbyPumpList.sequence, #LobbyVM.LobbyPumpList.funcs )
	LobbyVM.LobbyPumpList.sequence = LobbyVM.LobbyPumpList.sequence + 1
	LobbyVM.LobbyPumpList.funcs[LobbyVM.LobbyPumpList.sequence]()
end

