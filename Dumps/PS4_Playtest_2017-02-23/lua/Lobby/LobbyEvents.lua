require( "lua.Lobby.Common.LobbyCore" )

Lobby.Events = {}
Lobby.Events.OnInit = {
	Lobby.ProcessQueue.Init,
	Lobby.TeamSelection.Init,
	LobbyData.InitLobbyNav,
	Lobby.Platform.OnInit,
	Lobby.Debug.OnInit,
	Lobby.Anticheat.OnInit
}
Lobby.Events.OnUILoad = {
	Lobby.Debug.OnUILoad,
	Lobby.MapVote.Init
}
Lobby.Events.OnSessionStart = {
	Lobby.MapVote.OnSessionStart,
	Lobby.PartyPrivacy.OnSessionStart,
	Lobby.Theater.OnSessionStart,
	Lobby.Timer.OnSessionStart,
	Lobby.TeamSelection.OnSessionStart,
	Lobby.Platform.OnSessionStart,
	Lobby.Debug.OnSessionStart
}
Lobby.Events.OnSessionEnd = {
	Lobby.Hopper.OnSessionEnd,
	Lobby.TeamSelection.OnSessionEnd,
	Lobby.Theater.OnSessionEnd,
	Lobby.Timer.OnSessionEnd,
	Lobby.MapVote.OnSessionEnd,
	Lobby.Platform.OnSessionEnd,
	Lobby.Debug.OnSessionEnd
}
Lobby.Events.OnMatchStart = {
	Lobby.Timer.OnMatchStart,
	Lobby.Stats.OnMatchStart,
	Lobby.Matchmaking.OnMatchStart,
	Lobby.Platform.OnMatchStart,
	Lobby.Debug.OnMatchStart,
	function ( data )
		Engine.AllowVoiceChatForAll( Enum.LobbyType.LOBBY_TYPE_GAME )
	end,
	LuaUtils.CycleContracts,
	LuaUtils.ValidateBlackjackPurchase,
	LuaUtils.UI_ClearErrorMessageDialog
}
Lobby.Events.OnMatchLaunchClient = {
	Lobby.Stats.OnMatchLaunchClient,
	function ( data )
		LuaUtils.LogQoS( "match_launch_client", data )
	end
}
Lobby.Events.OnClientConnectionStateChanged = {
	function ( data )
		local controllerIndex = data.controllerIndex
		Engine.SendClientHeartbeat( controllerIndex, Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT ) )
	end
}
Lobby.Events.OnMatchRecordStart = {
	function ( data )
		LuaUtils.LogQoS( "match_record", data )
	end
}
Lobby.Events.OnGametypeSettingsChange = {
	Lobby.TeamSelection.OnGametypeSettingsChange,
	function ( data )
		LuaUtils.ForceLobbyButtonUpdate()
	end
}
Lobby.Events.OnPartyPrivacyChange = {}
Lobby.Events.OnErrorShutdown = {
	LobbyVM.OnErrorShutdown
}
Lobby.Events.OnKVSFlush = {
	LobbyVM.LogGlobalData
}
Lobby.Events.OnPostExecFFOTD = {
	LobbyVM.LogGlobalData,
	Lobby.Platform.OnPostExecFFOTD
}
Lobby.Events.eventHandlers = {}
Lobby.Events.eventHandlers.OnInit = Lobby.Events.OnInit
Lobby.Events.eventHandlers.OnUILoad = Lobby.Events.OnUILoad
Lobby.Events.eventHandlers.OnPump = LobbyVM.OnPump
Lobby.Events.eventHandlers.OnPreExecFFOTD = LobbyVM.OnPreExecFFOTD
Lobby.Events.eventHandlers.OnPostExecFFOTD = Lobby.Events.OnPostExecFFOTD
Lobby.Events.eventHandlers.OnSessionStart = Lobby.Events.OnSessionStart
Lobby.Events.eventHandlers.OnSessionEnd = Lobby.Events.OnSessionEnd
Lobby.Events.eventHandlers.OnMatchStart = Lobby.Events.OnMatchStart
Lobby.Events.eventHandlers.OnMatchEnd = LobbyVM.OnMatchEnd
Lobby.Events.eventHandlers.OnClientAdded = LobbyVM.OnClientAdded
Lobby.Events.eventHandlers.OnClientRemoved = LobbyVM.OnClientRemoved
Lobby.Events.eventHandlers.OnHostLaunch = Lobby.Launch.OnHostLaunch
Lobby.Events.eventHandlers.OnClientLaunch = Lobby.Launch.OnClientLaunch
Lobby.Events.eventHandlers.OnMessageReceived = LobbyVM.OnMessageReceived
Lobby.Events.eventHandlers.OnJoin = Lobby.Join.OnJoin
Lobby.Events.eventHandlers.OnJoinSystemlink = Lobby.Join.OnJoinSystemlink
Lobby.Events.eventHandlers.OnJoinComplete = Lobby.Join.OnJoinComplete
Lobby.Events.eventHandlers.OnEnableJoins = Lobby.Join.OnEnableJoins
Lobby.Events.eventHandlers.OnInGameJoin = LobbyVM.OnInGameJoin
Lobby.Events.eventHandlers.OnInvite = Lobby.Platform.Invite
Lobby.Events.eventHandlers.OnStorageOperationReadResult = Lobby.Anticheat.OnStorageOperationReadResult
Lobby.Events.eventHandlers.OnStorageRead = Lobby.Storage.OnStorageRead
Lobby.Events.eventHandlers.OnStorageWrite = Lobby.Storage.OnStorageWrite
Lobby.Events.eventHandlers.OnStorageWriteDispatch = Lobby.Storage.OnStorageWriteDispatch
Lobby.Events.eventHandlers.OnUpdateUI = LobbyVM.OnUpdateUI
Lobby.Events.eventHandlers.OnForceToMenu = LobbyVM.OnForceToMenu
Lobby.Events.eventHandlers.OnUILevelRunningChanged = LobbyVM.OnUILevelRunningChanged
Lobby.Events.eventHandlers.OnDisconnect = LobbyVM.OnDisconnect
Lobby.Events.eventHandlers.OnDWDisconnect = LobbyVM.OnDWDisconnect
Lobby.Events.eventHandlers.OnComError = LobbyVM.OnComError
Lobby.Events.eventHandlers.OnErrorShutdown = Lobby.Events.OnErrorShutdown
Lobby.Events.eventHandlers.OnCreateDedicatedLANLobby = LobbyVM.OnCreateDedicatedLANLobby
Lobby.Events.eventHandlers.OnCreateDedicatedLobby = LobbyVM.OnCreateDedicatedLobby
Lobby.Events.eventHandlers.OnDevmap = LobbyVM.OnDevmap
Lobby.Events.eventHandlers.OnDevmapClient = LobbyVM.OnDevmapClient
Lobby.Events.eventHandlers.OnFeatureBan = Lobby.Anticheat.OnFeatureBan
Lobby.Events.eventHandlers.OnPlayerBanned = Lobby.Anticheat.OnPlayerBanned
Lobby.Events.eventHandlers.OnPopAnticheatMessage = Lobby.Anticheat.OnPopAnticheatMessage
Lobby.Events.eventHandlers.OnCheckPrestigeFeatureBan = Lobby.Anticheat.OnCheckPrestigeFeatureBan
Lobby.Events.eventHandlers.OnPlatformJoin = Lobby.Platform.OnPlatformJoin
Lobby.Events.eventHandlers.OnPlatformPlayTogether = Lobby.Platform.OnPlatformPlayTogether
Lobby.Events.eventHandlers.OnPlatformResume = Lobby.Platform.OnPlatformResume
Lobby.Events.eventHandlers.OnPlatformSessionDataUpdate = Lobby.Platform.OnPlatformSessionDataUpdate
Lobby.Events.eventHandlers.OnPlatformSessionMultiplayerSessionChanged = Lobby.Platform.OnPlatformSessionMultiplayerSessionChanged
Lobby.Events.eventHandlers.OnPlatformSessionMultiplayerSubscriptionLost = Lobby.Platform.OnPlatformSessionMultiplayerSubscriptionLost
Lobby.Events.eventHandlers.OnPlatformSuspend = Lobby.Platform.OnPlatformSuspend
Lobby.Events.eventHandlers.OnPopulateMutableClientDDLBuff = LobbyVM.OnPopulateMutableClientDDLBuff
Lobby.Events.eventHandlers.OnReceiveMutableClientDDLBuff = LobbyVM.OnReceiveMutableClientDDLBuff
Lobby.Events.eventHandlers.OnDemoEndFinished = LobbyVM.OnDemoEndFinished
Lobby.Events.eventHandlers.OnGameLobbyClientDataUpdate = LobbyVM.OnGameLobbyClientDataUpdate
Lobby.Events.eventHandlers.OnGameLobbyGameServerDataUpdate = LobbyVM.OnGameLobbyGameServerDataUpdate
Lobby.Events.eventHandlers.OnInitilizeGunsmithBuffer = Lobby.Gunsmith.OnInitilizeGunsmithBuffer
Lobby.Events.eventHandlers.OnInitilizeZMLoadoutBuffer = Lobby.Storage.OnInitilizeZMLoadoutBuffer
Lobby.Events.eventHandlers.OnLobbyClientLeftEvent = LobbyVM.OnLobbyClientLeftEvent
Lobby.Events.eventHandlers.OnLobbyClientPromoteToHost = LobbyVM.OnLobbyClientPromoteToHost
Lobby.Events.eventHandlers.OnLobbyHostClientSelectionReceived = LobbyVM.OnClientSelectionReceived
Lobby.Events.eventHandlers.OnLobbyHostLeftInGameMigrateFinished = LobbyVM.OnLobbyHostLeftInGameMigrateFinished
Lobby.Events.eventHandlers.OnLobbyHostLeftNoMigration = LobbyVM.OnLobbyHostLeftNoMigration
Lobby.Events.eventHandlers.OnLobbySettings = LobbyVM.OnLobbySettings
Lobby.Events.eventHandlers.OnClientConnectionStateChanged = Lobby.Events.OnClientConnectionStateChanged
Lobby.Events.eventHandlers.OnClientSelectionReceived = LobbyVM.OnClientSelectionReceived
Lobby.Events.eventHandlers.OnDediQosReady = LobbyVM.OnDediQosReady
Lobby.Events.eventHandlers.OnGametypeSettingsChange = Lobby.Events.OnGametypeSettingsChange
Lobby.Events.eventHandlers.OnInitializeLoadouts = Lobby.Storage.OnInitializeLoadouts
Lobby.Events.eventHandlers.OnInitializeStats = Lobby.Storage.OnInitializeStats
Lobby.Events.eventHandlers.OnKVSFlush = Lobby.Events.OnKVSFlush
Lobby.Events.eventHandlers.OnLeaveWithParty = LobbyVM.OnLobbyLeaveWithParty
Lobby.Events.eventHandlers.OnLobbyOnlineUpdate = Lobby.Matchmaking.OnLobbyOnlineUpdate
Lobby.Events.eventHandlers.OnMatchChangeMap = LobbyVM.OnMatchChangeMap
Lobby.Events.eventHandlers.OnMatchLaunchClient = Lobby.Events.OnMatchLaunchClient
Lobby.Events.eventHandlers.OnMatchRecordStart = Lobby.Events.OnMatchRecordStart
Lobby.Events.eventHandlers.OnPartyPrivacyChange = Lobby.Events.OnPartyPrivacyChange
Lobby.Events.eventHandlers.OnRecordComScoreEvent = LobbyVM.OnRecordComScoreEvent
Lobby.Events.eventHandlers.OnUpdateAdvertising = LobbyVM.OnUpdateAdvertising
Lobby.Events.eventHandlers.OnPrivateLobbyServerDataUpdate = LobbyVM.OnPrivateLobbyServerDataUpdate
Lobby.Events.eventHandlers.OnUpdateLobbyStatusInfo = LobbyVM.OnUpdateLobbyStatusInfo
Lobby.Events.eventHandlers.OnChangeSigninState = LobbyVM.OnChangeSigninState
Lobby.Events.eventHandlers.OnErrorShutdown = LobbyVM.OnErrorShutdown
Lobby.Events.eventHandlers.OnGoBack = LobbyVM.OnGoBack
Lobby.Events.eventHandlers.OnGoForward = LobbyVM.OnGoForward
Lobby.Events.eventHandlers.OnLaunchDemo = Lobby.Timer.LaunchGame
Lobby.Events.eventHandlers.OnLaunchGame = Lobby.Timer.LaunchGame
Lobby.Events.eventHandlers.OnManagePartyLeave = LobbyVM.OnManagePartyLeave
Lobby.Events.eventHandlers.OnMatchmakingPriorityQuit = Lobby.MatchmakingPriority.OnMatchmakingPriorityQuit
Lobby.Events.eventHandlers.OnNetworkModeChanged = LobbyVM.OnNetworkModeChanged
Lobby.Events.eventHandlers.OnSessionModeChange = LobbyVM.OnSessionModeChange
Lobby.Events.eventHandlers.OnSessionSQJRefreshInfo = Lobby.Debug.SessionSQJRefreshInfo
Lobby.Events.eventHandlers.OnStopLobbyTimer = Lobby.Timer.HostingLobbyEnd
Lobby.Events.eventHandlers.OnSwitchTeam = Lobby.TeamSelection.SwitchTeam
Lobby.Events.EventDispatcher = function ( event, data )
	if Lobby.Events.eventHandlers[event] then
		if type( Lobby.Events.eventHandlers[event] ) == "function" then
			Lobby.Events.eventHandlers[event]( data )
			return 
		elseif type( Lobby.Events.eventHandlers[event] ) == "table" then
			for index, eventHandler in ipairs( Lobby.Events.eventHandlers[event] ) do
				eventHandler( data )
			end
			return 
		end
	end
	if not Engine.IsShipBuild() then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "Lobby.Events.EventDispatcher() - invalid event: " .. event .. ".\n" )
	else
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "Lobby.Events.EventDispatcher() - invalid event: " .. event .. ".\n" )
	end
end

Lobby.Events.eventReturnHandlers = {}
Lobby.Events.eventReturnHandlers.OnHostLaunch = Lobby.Launch.OnHostLaunch
Lobby.Events.eventReturnHandlers.OnClientLaunch = Lobby.Launch.OnClientLaunch
Lobby.Events.eventReturnHandlers.OnJoinPartyPrivacyCheck = Lobby.PartyPrivacy.OnJoinPartyPrivacyCheck
Lobby.Events.eventReturnHandlers.OnCanFitLobbys = Lobby.TeamSelection.OnCanFitLobbys
Lobby.Events.eventReturnHandlers.OnCanBroadcastHostInfo = LobbyVM.OnCanBroadcastHostInfo
Lobby.Events.eventReturnHandlers.OnJoinableCheck = Lobby.Join.OnJoinableCheck
Lobby.Events.eventReturnHandlers.OnCanLobbyCanMigrate = LobbyVM.OnCanLobbyCanMigrate
Lobby.Events.eventReturnHandlers.OnLobbyLocalClientLeave = LobbyVM.OnLobbyLocalClientLeave
Lobby.Events.eventReturnHandlers.OnIsFeatureBanned = LobbyVM.OnIsFeatureBanned
Lobby.Events.eventReturnHandlers.OnIsPermaBanned = Lobby.Anticheat.OnIsPermaBanned
Lobby.Events.eventReturnHandlers.OnGetAnticheatReputation = Lobby.Anticheat.OnGetAnticheatReputation
Lobby.Events.eventReturnHandlers.OnPushAnticheatMessageToUI = Lobby.Anticheat.OnPushAnticheatMessageToUI
Lobby.Events.eventReturnHandlers.OnEmblemsGenerateForceDefault = Lobby.UGC.EmblemsGenerateForceDefault
Lobby.Events.eventReturnHandlers.OnBuyCrate = LobbyVM.OnBuyCrate
Lobby.Events.eventReturnHandlers.OnSpendVials = LobbyVM.OnSpendVials
Lobby.Events.eventReturnHandlers.OnHopperClientJoin = Lobby.Hopper.OnClientJoin
Lobby.Events.eventReturnHandlers.OnHopperIsParked = Lobby.Hopper.OnIsParked
Lobby.Events.eventReturnHandlers.OnLeaderboardCalculateLBColValue = Lobby.Leaderboard.OnCalculateLBColValue
Lobby.Events.eventReturnHandlers.OnShouldWriteLeaderboard = Lobby.Leaderboard.OnShouldWriteLeaderboard
Lobby.Events.ReturnEventDispatcher = function ( event, data )
	if Lobby.Events.eventReturnHandlers[event] then
		return Lobby.Events.eventReturnHandlers[event]( data )
	elseif not Engine.IsShipBuild() then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "Lobby.Events.ReturnEventDispatcher() - invalid event: " .. event .. ".\n" )
	else
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "Lobby.Events.ReturnEventDispatcher() - invalid event: " .. event .. ".\n" )
	end
end

