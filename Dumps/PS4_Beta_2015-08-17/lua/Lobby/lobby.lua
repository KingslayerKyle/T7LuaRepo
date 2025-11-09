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
	IsNil = function ( object )
		if object == nil then
			return "true"
		else
			return "false"
		end
	end
}
LobbyVM = {
	AutoJoin = {},
	DevGui = {}
}
LobbyVM.DevGui.LaunchGame = function ( mapname, gametype )
	if mapname ~= nil then
		Dvar.ui_mapname:set( mapname )
	end
	if gametype ~= nil then
		Dvar.ui_gametype:set( gametype )
	end
	if not Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
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
	if not Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	end
	local curScreenId = Engine.GetLobbyUIScreen()
	if curScreenId ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id then
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
	Engine.AdvertiseLobby( -1, Enum.LobbyType.LOBBY_TYPE_GAME, advertisingOnOff )
end

LobbyVM.DevGui.LobbyReset = function ()
	local data = {
		controller = Engine.GetPrimaryController(),
		signoutUsers = false
	}
	LobbyVM.ErrorShutdown( data )
end

LobbyVM.playSoundHistory = {}
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

LobbyVM.ErrorShutdown = function ( data )
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
	if data.signoutUsers ~= nil and data.signoutUsers == true and Engine.SignOutAllUsers ~= nil then
		Engine.SignOutAllUsers()
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Forcing UI screen.\n" )
	Engine.ForceLobbyUIScreen( LobbyData.UITargets.UI_MAIN.id )
	Engine.LuiVM_Event( "open_main", {} )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby emergency shutdown complete.\n" )
end

LobbyVM.OnInit = function ()
	
end

LobbyVM.OnUILoad = function ( data )
	local init = data.init
	Lobby.Debug.OnUILoad( data )
	if init then
		Lobby.MapVote.Init()
	end
end

LobbyVM.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.MapVote.OnSessionStart( data )
	Lobby.PartyPrivacy.OnSessionStart( data )
	Lobby.Theater.OnSessionStart( data )
	Lobby.Timer.OnSessionStart( data )
	Lobby.TeamSelection.OnSessionStart( data )
	Lobby.PlatformSession.OnSessionStart( data )
	data.lobbyID = Engine.GetLobbyLobbyID( lobbyType )
	LuaUtils.LogQoS( "session_start", data )
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST then
		Lobby.Debug.SessionSQJClear()
	end
end

LobbyVM.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.TeamSelection.OnSessionEnd( data )
	Lobby.Theater.OnSessionEnd( data )
	Lobby.PlatformSession.OnSessionEnd( data )
	data.lobbyID = Engine.GetLobbyLobbyID( lobbyType )
	LuaUtils.LogQoS( "session_end", data )
end

LobbyVM.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	Lobby.Matchmaking.OnClientAdded( data )
	Lobby.TeamSelection.OnClientAdded( data )
	Lobby.PlatformSession.OnClientAdded( data )
	Lobby.Pregame.OnClientAdded( data )
	Engine.QoSProbeListenerUpdate( lobbyType )
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.AddLobbyClientExtracam( data.xuid )
	end
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( xuid ) then
		LobbyVM.PlaySound( LobbyData.Sounds.ClientsAddedToLobby, 500 )
	end
	data.lobbyID = Engine.GetLobbyLobbyID( lobbyType )
	LuaUtils.LogQoS( "client_added", data )
end

LobbyVM.OnClientRemoved = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	Lobby.PlatformSession.OnClientRemoved( data )
	Lobby.Pregame.OnClientRemoved( data )
	Engine.QoSProbeListenerUpdate( lobbyType )
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.RemoveLobbyClientExtracam( data.xuid )
	end
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( xuid ) and not Engine.IsInGame() then
		LobbyVM.PlaySound( LobbyData.Sounds.ClientsRemovedFromLobby, 500 )
	end
	data.lobbyID = Engine.GetLobbyLobbyID( lobbyType )
	LuaUtils.LogQoS( "client_removed", data )
end

LobbyVM.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.Timer.OnMatchStart( data )
	LuaUtils.LogQoS( "match_start", data )
	LuaUtils.UI_ClearErrorMessageDialog()
end

LobbyVM.OnMatchLaunchClient = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	LuaUtils.LogQoS( "match_launch_client", data )
end

LobbyVM.OnMatchChangeMap = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	LuaUtils.LogQoS( "match_change_map", data )
end

LobbyVM.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.TeamSelection.OnMatchEnd( data )
	Lobby.Timer.OnMatchEnd( data )
	Lobby.MapVote.OnMatchEnd( data )
	LuaUtils.LogQoS( "match_end", data )
	Engine.FlushKVS( Engine.GetPrimaryController(), Enum.KVSChannel.MATCHMAKING_QOS )
end

LobbyVM.OnMatchRecordStart = function ( data )
	if data.matchId ~= nil then
		LuaUtils.LogQoS( "match_record", data )
	end
end

LobbyVM.OnDisconnect = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local disconnectClientXuid = data.disconnectClientXuid
	local disconnectClient = data.disconnectClient
	local controller = Engine.GetPrimaryController()
	local errorMsg = "EXE_DISCONNECTED_FROM_SERVER"
	local process = Lobby.Process.Recover( controller )
	if disconnectClient == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_INVALID then
		
	elseif disconnectClient == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_DROP then
		
	elseif disconnectClient == Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK then
		errorMsg = "EXE_KICKED_FROM_PARTY"
	end
	process.tail.success = Lobby.Actions.ErrorPopupMsg( Engine.Localize( errorMsg ) )
	Lobby.ProcessQueue.AddToQueue( "DisconnectFromHost", process )
end

LobbyVM.OnLobbyOnlineUpdate = function ( data )
	
end

LobbyVM.OnLeaveWithParty = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	LobbyVM.LobbyLeaveWithParty( data )
end

LobbyVM.OnGametypeSettingsChange = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.TeamSelection.OnGametypeSettingsChange( data )
	LuaUtils.ForceLobbyButtonUpdate()
end

LobbyVM.OnPartyPrivacyChange = function ( data )
	local partyPrivacy = data.partyPrivacy
end

LobbyVM.OnPlatformJoin = function ( data )
	Lobby.PlatformSession.OnPlatformJoin( data )
end

LobbyVM.OnInviteAccepted = function ( data )
	
end

LobbyVM.OnComError = function ( data )
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
	Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "LobbyVM.OnComError - errorCode: " .. errorCode .. ", errorMsg: " .. errorMsg .. ".\n" )
	local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
	Engine.SetModelValue( lobbyHideForStartModel, 0 )
	LuaUtils.LogQoS( "lobby_error", data )
	if errorCode == 1024 or errorCode == 2048 then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and not Engine.IsSignedInToDemonware( controller ) then
		LobbyVM.ErrorShutdown( data )
	end
	if errorCode == Enum.errorCode.ERROR_UI or errorCode == Enum.errorCode.ERROR_DISCONNECT or errorCode == Enum.errorCode.ERROR_FATAL or errorCode == Enum.errorCode.ERROR_DROP or errorCode == Enum.errorCode.ERROR_SOFTRESTART_KEEPDW then
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
	error( "LobbyVM.OnError - Unhandled COM_ERROR: " .. errorCode .. ", Message: " .. errorMsg .. ".\n" )
end

LobbyVM.OnComErrorCleanup = function ( data )
	local controller = data.controller
	local errorCode = data.errorCode
	local errorMsg = data.errorMsg
	local errorShutdoen = data.errorShutdown
	Engine.LobbyLaunchClear()
	if data.errorShutdown ~= nil and data.errorShutdown == true then
		LobbyVM.ErrorShutdown( data )
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
		LuaUtils.UI_ShowErrorMessageDialog( controller, errorMsg )
	elseif errorCode == 2050 and string.len( errorMsg ) > 0 then
		LuaUtils.UI_ShowErrorMessageDialog( controller, errorMsg )
	end
end

LobbyVM.OnErrorShutdown = function ( data )
	LobbyVM.ErrorShutdown( data )
end

LobbyVM.OnPlayerBanned = function ( data )
	Lobby.Anticheat.OnPlayerBanned( data )
end

LobbyVM.OnFeatureBan = function ( data )
	Lobby.Anticheat.OnFeatureBan( data )
end

LobbyVM.OnStorageRead = function ( data )
	if data.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", data )
	elseif data.fileType == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		LobbyVM.OnDownloadMPOnlineStats( data.controller )
	end
end

LobbyVM.OnStorageWrite = function ( data )
	if data.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", data )
	end
end

LobbyVM.OnStorageOperationReadResult = function ( data )
	
end

LobbyVM.InitilizeGunsmithBuffer = function ( data )
	local controller = data.controller
	Engine.StorageReset( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	local rootState = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	LuaUtils.Gunsmith.InitializeBuffer( rootState )
	Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
end

LobbyVM.OnDownloadMPOnlineStats = function ( controller )
	local f34_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local itemStats = f34_local0.itemStats
	if itemStats then
		for itemIndex = 1, 255, 1 do
			if Engine.ItemIndexValid( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemUnlockLevel( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) == 0 then
				itemStats[itemIndex].markedOld:set( 1 )
			end
		end
	end
end

LobbyVM.OnInitializeLoadouts = function ( data )
	local controller = data.controller
	local storageFileType = data.storageFileType
	local statsNetworkType = data.statsNetworkType
	if storageFileType == Enum.StorageFileType.STORAGE_ZM_LOADOUTS then
		local f35_local0 = LuaUtils.Gunsmith.InitializeBuffer
		local f35_local1 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		f35_local0( f35_local1.cacLoadouts )
		f35_local0 = LuaUtils.Gunsmith.InitializeBuffer
		f35_local1 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		f35_local0( f35_local1.customMatchCacLoadouts )
	elseif storageFileType == Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE then
		local f35_local0 = LuaUtils.Gunsmith.InitializeBuffer
		local f35_local1 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
		f35_local0( f35_local1.cacLoadouts )
	elseif storageFileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE then
		local f35_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
		local cacLoadouts = f35_local0.cacLoadouts
		local equippedHeroIndex = Engine.GetEquippedHeroForCACType( controller, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_OFFLINE )
		if equippedHeroIndex then
			local heroWeapon = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, equippedHeroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if cacLoadouts and cacLoadouts.heroweapon then
				cacLoadouts.heroweapon:set( heroWeapon )
			end
		end
	elseif storageFileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		local f35_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		local cacLoadouts = f35_local0.cacLoadouts
		local f35_local1 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		local customMatchCacLoadouts = f35_local1.customMatchCacLoadouts
		local equippedHeroIndex = Engine.GetEquippedHeroForCACType( controller, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC )
		if equippedHeroIndex then
			local heroWeapon = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, equippedHeroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if cacLoadouts and cacLoadouts.heroweapon then
				cacLoadouts.heroweapon:set( heroWeapon )
			end
			if customMatchCacLoadouts and customMatchCacLoadouts.heroweapon then
				customMatchCacLoadouts.heroweapon:set( heroWeapon )
			end
		end
	end
end

LobbyVM.LobbyHostLeftNoMigration = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local lobbyMainMode = data.lobbyMainMode
	local lobbyNetworkMode = data.lobbyNetworkMode
	local maxClients = data.maxClients
	local isGameLobbyActive = data.isGameLobbyActive
	local isPrivateHost = data.isPrivateHost
	if isGameLobbyActive == true then
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

LobbyVM.LobbyHostLeft_InGameMigrateFinished = function ( data )
	local recoverProcess = Lobby.Process.Recover( data.controller )
	if LobbyVM.AutoJoin.data ~= nil then
		local joinProcess = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		if joinProcess ~= nil then
			Lobby.Process.AppendProcess( recoverProcess, joinProcess )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyHostLeft_InGameMigrateFinished", recoverProcess )
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
	LuaUtils.LogQoS( "ingame_migrate_finished", data )
end

LobbyVM.LobbyClientLeftEvent = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local lobbyMainMode = data.lobbyMainMode
	local lobbyNetworkMode = data.lobbyNetworkMode
	local maxClients = data.maxClients
	local recoverProcess = Lobby.Process.Recover( controller )
	if LobbyVM.AutoJoin.data ~= nil then
		local joinProcess = LobbyVM.GetJoinProcess( LobbyVM.AutoJoin.data )
		if joinProcess ~= nil then
			Lobby.Process.AppendProcess( recoverProcess, joinProcess )
		end
		LobbyVM.AutoJoin.data = nil
	end
	Lobby.ProcessQueue.AddToQueue( "LobbyClientLeft", recoverProcess )
end

LobbyVM.Devmap = function ( data )
	local controller = data.controller
	local mainMode = data.mainMode
	local process = Lobby.Process.Devmap( controller, mainMode )
	Lobby.ProcessQueue.AddToQueue( "Devmap", process )
end

LobbyVM.DevmapClient = function ( data )
	local controller = data.controller
	local process = Lobby.Process.DevmapClient( controller )
	Lobby.ProcessQueue.AddToQueue( "DevmapClient", process )
end

LobbyVM.NetworkModeChanged = function ( data )
	local controller = data.controller
	local networkMode = data.networkMode
	local process = Lobby.Process.ReloadPrivateLobby( controller, networkMode )
	Lobby.ProcessQueue.AddToQueue( "NetworkModeChanged", process )
end

LobbyVM.GoForward = function ( data )
	local controller = data.controller
	local openMenu = data.navToMenu
	local withParty = data.withParty
	local currentMenuId = LobbyData.GetLobbyNav()
	local fromTarget = LobbyData:UITargetFromId( currentMenuId )
	local toTarget = LobbyData:UITargetFromName( openMenu )
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
	local process = processFunc( controller, fromTarget, toTarget )
	Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. fromTarget.name .. "' menu to '" .. toTarget.name .. "' menu.", process )
end

LobbyVM.GoBack = function ( data )
	local controller = data.controller
	local withParty = data.withParty
	local fromTarget = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
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

LobbyVM.ManagePartyLeave = function ( data )
	local controller = data.controller
	local process = Lobby.Process.ManagePartyLeave( controller )
	Lobby.ProcessQueue.AddToQueue( "ManagePartyLeave", process )
end

LobbyVM.InGameJoin = function ( data )
	LobbyVM.AutoJoin.data = data
end

LobbyVM.GetJoinProcess = function ( data )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.LobbyIsPlayerInLobby( lobbyType, data.xuid ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of\n" )
		return nil
	else
		return Lobby.Process.Join( data.controller, data.xuid, data.joinType, LuaEnums.LEAVE_WITH_PARTY.WITH )
	end
end

LobbyVM.Join = function ( data )
	local process = LobbyVM.GetJoinProcess( data )
	if process ~= nil then
		Lobby.ProcessQueue.AddToQueue( "Join", process )
	end
end

LobbyVM.OnJoinComplete = function ( data )
	Lobby.Debug.OnJoinComplete( data )
end

LobbyVM.JoinSystemlink = function ( data )
	local process = Lobby.Process.JoinSystemlink( data.controller, data.lobbyMainMode, data.lobbyNetworkMode, data.hostXuid, data.hostInfo )
	Lobby.ProcessQueue.AddToQueue( "JoinSystemLink", process )
end

LobbyVM.CreateDedicatedLANLobby = function ()
	local process = Lobby.Process.CreateDedicatedLANLobby( 0, LobbyData.UITargets.UI_MPLOBBYLANGAME )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLANLobby", process )
end

LobbyVM.CreateDedicatedLobby = function ( data )
	local process = Lobby.Process.CreateDedicatedLobby( 0, LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLobby", process )
end

LobbyVM.ForceToMenu = function ( data )
	local target = LobbyData:UITargetFromName( data.menuName )
	local process = Lobby.Process.ForceToMenu( data.controller, target, data.msg )
	Lobby.ProcessQueue.AddToQueue( "ForceToMenu", process )
end

LobbyVM.LobbyClientPromoteToHost = function ( data )
	local process = Lobby.Process.PromoteClientToHost( data.controller, data.lobbyMainMode, data.lobbyType, data.lobbyMode, data.maxClients, data.hostInfo, data.isAdvertised, data.isInGame, data.newMigrateIndex )
	Lobby.ProcessQueue.AddToQueue( "PromoteClientToHost", process )
end

LobbyVM.LobbyLeaveWithParty = function ( data )
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

LobbyVM.LobbyLocalClientLeave = function ( data )
	local controller = data.controller
	local process = Lobby.Process.LocalClientLeave( controller )
	if process == nil then
		return 
	else
		Lobby.ProcessQueue.AddToQueue( "LocalClientLeave", process )
	end
end

LobbyVM.LobbySettings = function ( data )
	local controller = data.controller
	local toTarget = data.toTarget
	local skipSwitchMode = data.skipSwitchMode
	if type( toTarget ) == "number" then
		toTarget = LobbyData:UITargetFromId( toTarget )
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
	if toTarget.eGameModes == Enum.eGameModes.MODE_GAME_INVALID then
		Engine.GameModeResetModes()
	else
		Engine.TEMPGameModeSetMode( toTarget.eGameModes )
	end
end

LobbyVM.UpdateUI = function ( data )
	local target = data.toTarget
	local controller = data.controller
	if type( target ) == "number" then
		target = LobbyData:UITargetFromId( target )
	end
	local checkForAutoRoom = function ( room )
		if room == "auto" then
			return "room2"
		else
			return room
		end
	end
	
	LobbyData.SetLobbyNav( target )
	Engine.SetLobbyUIScreen( target.id )
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

LobbyVM.Leaderboard_CalculateLBColValue = function ( data )
	return Lobby.Leaderboard.CalculateLBColValue( data )
end

LobbyVM.Leaderboard_ShouldWriteLeaderboard = function ( data )
	return Lobby.Leaderboard.ShouldWriteLeaderboard( data )
end

LobbyVM.LaunchGameExec = function ( controller, lobbyType )
	if lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch game not supported for this lobby type(" .. lobbyType .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		local mapName = Dvar.ui_mapname:get()
		local gameType = Dvar.ui_gametype:get()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching game... **\n" )
		Engine.Exec( controller, "lobbyLaunchGame " .. lobbyType .. " " .. mapName .. " " .. gameType )
	else
		local head = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch game. Lobby process '" .. head.name .. "' in progress.\n" )
	end
end

LobbyVM.LaunchDemoExec = function ( controller, lobbyType )
	if lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch demo not supported for this lobby type(" .. lobbyType .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching demo... **\n" )
		Engine.Exec( controller, "lobbyLaunchDemo" )
	else
		local head = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch damo. Lobby process '" .. head.name .. "' in progress.\n" )
	end
end

LobbyVM.hostLaunch = {}
LobbyVM.HostLaunchInit = function ()
	LobbyVM.hostLaunch = {}
	LobbyVM.hostLaunch.fadeToBlack = false
	local startTime = Engine.milliseconds()
	LobbyVM.hostLaunch.startTime = startTime
	LobbyVM.hostLaunch.fadeToBlackTime = startTime + Dvar.lobbyLaunch_fadeToBlackDelay:get()
	LobbyVM.hostLaunch.launchTime = startTime + Dvar.lobbyLaunch_gameLaunchDelay:get()
	LobbyVM.hostLaunch.waitForClientAckTime = startTime + Dvar.lobbyLaunch_waitForClientAckDelay:get()
	return true
end

LobbyVM.HostLaunchPump = function ( data )
	if not Engine.IsDedicatedServer() then
		if LobbyVM.hostLaunch.fadeToBlack == false and Engine.milliseconds() > LobbyVM.hostLaunch.fadeToBlackTime then
			LobbyVM.hostLaunch.fadeToBlack = true
			local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
			Engine.SetModelValue( lobbyHideForStartModel, 1 )
		end
		if Engine.milliseconds() < LobbyVM.hostLaunch.launchTime then
			return false
		end
	end
	if not data.hasAllClientsGotLatestStateMsg or Engine.milliseconds() < LobbyVM.hostLaunch.waitForClientAckTime then
		return false
	end
	return true
end

LobbyVM.HostLaunch = function ( data )
	if data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.HostLaunchInit()
	elseif data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.HostLaunchPump( data )
	elseif data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_CLEAR then
		local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
		Engine.SetModelValue( lobbyHideForStartModel, 0 )
	else
		local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
		Engine.SetModelValue( lobbyHideForStartModel, 0 )
	end
end

LobbyVM.clientLaunch = {}
LobbyVM.ClientLaunchInit = function ( justConnected )
	LobbyVM.clientLaunch = {}
	LobbyVM.clientLaunch.fadeToBlack = false
	local fadeToBlackDelay = Dvar.lobbyLaunch_fadeToBlackDelay:get()
	local gameLaunchDelay = Dvar.lobbyLaunch_gameLaunchDelay:get()
	if justConnected then
		fadeToBlackDelay = Dvar.lobbyLaunch_fadeToBlackDelayOnConnect:get()
		gameLaunchDelay = Dvar.lobbyLaunch_gameLaunchDelayOnConnect:get()
	end
	local startTime = Engine.milliseconds()
	LobbyVM.clientLaunch.startTime = startTime
	LobbyVM.clientLaunch.fadeToBlackTime = startTime + fadeToBlackDelay
	LobbyVM.clientLaunch.launchTime = startTime + gameLaunchDelay
	return true
end

LobbyVM.ClientLaunchPump = function ()
	if LobbyVM.clientLaunch.fadeToBlack == false and LobbyVM.clientLaunch.fadeToBlackTime < Engine.milliseconds() then
		LobbyVM.clientLaunch.fadeToBlack = true
		local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
		Engine.SetModelValue( lobbyHideForStartModel, 1 )
	end
	if LobbyVM.clientLaunch.launchTime > Engine.milliseconds() then
		return false
	else
		return true
	end
end

LobbyVM.ClientLaunch = function ( data )
	if data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return LobbyVM.ClientLaunchInit( data.justConnected )
	elseif data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return LobbyVM.ClientLaunchPump()
	elseif data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_CLEAR then
		local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
		Engine.SetModelValue( lobbyHideForStartModel, 0 )
	else
		local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
		Engine.SetModelValue( lobbyHideForStartModel, 0 )
	end
end

LobbyVM.LaunchGame = function ( data )
	Lobby.Timer.LaunchGame( data )
end

LobbyVM.LaunchDemo = function ( data )
	Lobby.Timer.LaunchGame( data )
end

LobbyVM.UpdateLobbyStatusInfo = function ( data )
	Lobby.Timer.UpdateLobbyStatusInfo( data )
	Lobby.Pregame.UpdateLobbyStatusInfo( data )
end

LobbyVM.LobbyHost_ClientSelectionReceived = function ( data )
	Lobby.Pregame.LobbyHost_ClientSelectionReceived( data )
end

LobbyVM.SwitchTeam = function ( data )
	Lobby.TeamSelection.SwitchTeam( data )
end

LobbyVM.GameModeChanged = function ( data )
	Lobby.TeamSelection.GameModeChanged( data )
end

LobbyVM.CanFitLobbys = function ( data )
	return Lobby.TeamSelection.CanFitLobbys( data )
end

LobbyVM.UpdateAdvertising = function ( data )
	if data.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.Matchmaking.UpdateAdvertising( "force update from code" )
	end
end

LobbyVM.Invite = function ( data )
	Lobby.PlatformSession.Invite( data )
end

LobbyVM.SessionSQJRefreshInfo = function ( data )
	Lobby.Debug.SessionSQJRefreshInfo()
end

LobbyVM.StopLobbyTimer = function ( data )
	Lobby.Timer.HostingLobbyEnd( data )
end

LobbyVM.ChangeSigninState = function ( data )
	local process = nil
	if data.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_OUT then
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

LobbyVM.JoinResultToString = function ( joinResult, verbose )
	local joinResultInfo = {
		debug = "",
		errorMsg = ""
	}
	if verbose == true then
		joinResultInfo.debug = "Enum.JoinResult.JOIN_RESULT_"
	end
	if joinResult == Enum.JoinResult.JOIN_RESULT_INVALID then
		joinResultInfo.debug = joinResultInfo.debug .. "INVALID"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		joinResultInfo.debug = joinResultInfo.debug .. "SUCCESS"
		joinResultInfo.errorMsg = ""
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_CONNECT_TO_HOST_FAILURE then
		joinResultInfo.debug = joinResultInfo.debug .. "CONNECT_TO_HOST_FAILURE"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_SEND_FAILURE then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_SEND_FAILURE"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_TIMEOUT then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_TIMEOUT"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_LOBBY then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_INVALID_LOBBY"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_INFO then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_INVALID_INFO"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_RESULT_INVALID then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_RESULT_INVALID"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_INVALID_LOBBY then
		joinResultInfo.debug = joinResultInfo.debug .. "INVALID_LOBBY"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_SEND_AGREEMENT_REQUEST_FAILED then
		joinResultInfo.debug = joinResultInfo.debug .. "SEND_AGREEMENT_REQUEST_FAILED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED then
		joinResultInfo.debug = joinResultInfo.debug .. "JOIN_DISABLED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_JOIN_ALREADY_IN_PROGRESS then
		joinResultInfo.debug = joinResultInfo.debug .. "JOIN_ALREADY_IN_PROGRESS"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_CLOSED then
		joinResultInfo.debug = joinResultInfo.debug .. "NOT_JOINABLE_CLOSED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_CLOSED"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY then
		joinResultInfo.debug = joinResultInfo.debug .. "NOT_JOINABLE_INVITE_ONLY"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY then
		joinResultInfo.debug = joinResultInfo.debug .. "NOT_JOINABLE_FRIENDS_ONLY"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_LOBBY_FULL then
		joinResultInfo.debug = joinResultInfo.debug .. "LOBBY_FULL"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_LOBBY_FULL"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NETWORK_MODE_MISMATCH then
		joinResultInfo.debug = joinResultInfo.debug .. "NETWORK_MODE_MISMATCH"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NETWORK_MODE_MISMATCH"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLISTID then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_PLAYLISTID"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLISTID"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_PLAYLIST_VERSION_TO_NEW"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_PLAYLIST_VERSION_TO_OLD"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_PROTOCOL_VERSION then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_PROTOCOL_VERSION"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PROTOCOL_VERSION"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_NETFIELD_CHECKSUM"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_NEW then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_FFOTD_VERSION_TO_NEW"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_OLD then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_FFOTD_VERSION_TO_OLD"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MIGRATE_IN_PROGRESS then
		joinResultInfo.debug = joinResultInfo.debug .. "MIGRATE_IN_PROGRESS"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MIGRATE_IN_PROGRESS"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_COULD_NOT_RESERVE then
		joinResultInfo.debug = joinResultInfo.debug .. "COULD_NOT_RESERVE"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_COULD_NOT_RESERVE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_HANDSHAKE_WINDOW_EXPIRED then
		joinResultInfo.debug = joinResultInfo.debug .. "HANDSHAKE_WINDOW_EXPIRED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_AGREEMENT_WINDOW_EXPIRED then
		joinResultInfo.debug = joinResultInfo.debug .. "AGREEMENT_WINDOW_EXPIRED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	else
		joinResultInfo.debug = joinResultInfo.debug .. "UNHANDLED JOINRESULT ENUM"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	end
	return joinResultInfo
end

LobbyVM.lobbyStatus = {
	cleared = true,
	clearedTime = 0
}
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

LobbyVM.GameLobbyGameServerDataUpdate = function ( data )
	local playlistID = Engine.GetPlaylistID()
	local playlistName = Engine.GetPlaylistName( 0, playlistID )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	local nameModel = Engine.CreateModel( model, "name" )
	Engine.SetModelValue( nameModel, Engine.ToUpper( playlistName ) )
	Lobby.MapVote.GameLobbyGameServerDataUpdate( data )
end

LobbyVM.GameLobbyClientDataUpdate = function ( data )
	Lobby.MapVote.GameLobbyClientDataUpdate( data )
	Lobby.TeamSelection.GameLobbyClientDataUpdate( data )
	Lobby.Pregame.GameLobbyClientDataUpdate( data )
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

LobbyVM.HopperClientJoin = function ( data )
	return Lobby.Hopper.ClientJoin( data )
end

LobbyVM.HopperIsParked = function ()
	return Lobby.Hopper.IsParked()
end

LobbyVM.OnDediQosReady = function ()
	local searchType = Lobby.Matchmaking.DatacenterType.GAMESERVERS
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

