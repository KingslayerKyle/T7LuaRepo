require( "lua.Lobby.Process.LobbyActions" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.Process = {}
Lobby.Process.DO_NOTHING_IF_FAILURE = nil
Lobby.Process.DO_NOTHING_IF_ERROR = nil
Lobby.Process.AddActions = function ( process, success, failure, error )
	if success ~= nil and success.require ~= nil then
		local found = false
		local parent = process
		while parent ~= nil and found == false do
			if parent.name == success.require then
				found = true
			end
		end
		if found ~= true then
			error( "LobbyVM: AddAction called for: " .. success.name .. " which requires: " .. success.require .. " but does not precede this action." )
		else
			process.success = success
			process.failure = failure
			process.error = error
			if success ~= nil then
				success.parent = process
			end
		end
		parent = parent.parent
	end
	process.success = success
	process.failure = failure
	process.error = error
	if success ~= nil then
		success.parent = process
	end
end

Lobby.Process.ForceAction = function ( process, action )
	Lobby.Process.AddActions( process, action, action, action )
end

Lobby.Process.AppendProcess = function ( processA, processB )
	local action = processA.head
	while action.success ~= nil do
		action = action.success
	end
	action.success = processB.head
end

Lobby.Process.GetForwardFunc = function ( fromTarget, toTarget )
	return Lobby.Core.GetForwardProcessFunc( fromTarget, toTarget )
end

Lobby.Process.GetBackFunc = function ( fromTarget )
	return Lobby.Core.GetBackProcessFunc( fromTarget )
end

Lobby.Process.Navigate = function ( controller, fromTarget, toTarget, toMainMode )
	local process = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	if toMainMode == nil then
		process.head = navigate
		return process
	end
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local switchMode = Lobby.Actions.SwitchMode( controller, toMainMode )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local setDefaultArenaPlaylist = Lobby.Actions.SetDefaultArenaPlaylist( controller )
	local runPlaylistRules = Lobby.Actions.RunPlaylistRules( controller )
	process.head = openSpinner
	Lobby.Process.AddActions( openSpinner, switchMode )
	Lobby.Process.AddActions( switchMode, lobbySettings )
	local lastAction = lobbySettings
	if toTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
		Lobby.Process.AddActions( lastAction, setDefaultArenaPlaylist )
		Lobby.Process.AddActions( setDefaultArenaPlaylist, runPlaylistRules )
		lastAction = runPlaylistRules
	end
	Lobby.Process.AddActions( lastAction, updateUI )
	Lobby.Process.AddActions( updateUI, closeSpinner )
	return process
end

Lobby.Process.CreateDedicatedLANLobby = function ( controller, toTarget )
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local createGame = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local hostingEvent = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
		controller = controller,
		lobbyType = toTarget.lobbyType,
		mainMode = toTarget.mainMode,
		lobbyTimerType = toTarget.lobbyTimerType
	} )
	local process = {
		head = setNetworkMode,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( setNetworkMode, lobbySettings )
	Lobby.Process.AddActions( lobbySettings, updateUI )
	Lobby.Process.AddActions( updateUI, createGame )
	Lobby.Process.AddActions( createGame, hostingEvent )
	return process
end

Lobby.Process.CreateDedicatedLobby = function ( controller, toTarget )
	local hostingLobby = function ()
		if Dvar.tu9_hostPrivateSessions:get() == true and Engine.LobbyHostSetPrivateSession then
			local f9_local0 = toTarget.id
			local f9_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
			if f9_local0 == f9_local1.id then
				Engine.LobbyHostSetPrivateSession( toTarget.lobbyType, true )
			end
		end
		Engine.QoSProbeListenerEnable( toTarget.lobbyType, true )
		Engine.SetDvar( "live_dedicatedReady", 1 )
	end
	
	local playlistID = Dvar.sv_playlist:get()
	Engine.SetPlaylistID( playlistID )
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local createGameHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local process = {
		head = setNetworkMode,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( setNetworkMode, lobbySettings )
	Lobby.Process.AddActions( lobbySettings, updateUI )
	Lobby.Process.AddActions( updateUI, createGameHost )
	Lobby.Process.AddActions( createGameHost, lobbyAdvertise )
	Lobby.Process.AddActions( lobbyAdvertise, hostingEvent )
	Lobby.Process.AddActions( hostingEvent, nil )
	return process
end

Lobby.Process.MergePublicDedicatedLobby = function ( controller )
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.LOBBY_MERGE )
	local startMergeProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_MERGE )
	end
	
	local endMergeSuccessProcess = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Lobby.Merge.Complete()
		Lobby.Matchmaking.ClearSearchInfo()
	end
	
	local endMergeFailureProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Merge.Complete()
	end
	
	local startMerge = Lobby.Actions.ExecuteScript( startMergeProcess )
	local lobbySearch = Lobby.Actions.SearchForLobby( controller )
	local lobbyJoin = Lobby.Actions.QoSJoinSearchResults( controller, lobbySearch )
	local endMergeSuccess = Lobby.Actions.ExecuteScript( endMergeSuccessProcess )
	local endMergeFailure = Lobby.Actions.ExecuteScript( endMergeFailureProcess )
	local lobbyQoSSearchStage1 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage2 = Lobby.Actions.SearchForLobby( controller )
	lobbyQoSSearchStage1.name = lobbyQoSSearchStage1.name .. "_1"
	lobbyQoSSearchStage2.name = lobbyQoSSearchStage2.name .. "_2"
	local lobbyQoSJoinStage1 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage1 )
	local lobbyQoSJoinStage2 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage2 )
	lobbyQoSJoinStage1.name = lobbyQoSJoinStage1.name .. "_1"
	lobbyQoSJoinStage2.name = lobbyQoSJoinStage2.name .. "_2"
	local searchDelay2 = Lobby.Actions.TimeDelay( 1000 )
	local process = {
		head = startMerge,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( startMerge, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, searchDelay2, endMergeFailure )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, endMergeSuccess, searchDelay2, endMergeFailure )
	Lobby.Process.AddActions( searchDelay2, lobbyQoSSearchStage2, lobbyQoSSearchStage2, endMergeFailure )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, endMergeFailure, endMergeFailure )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, endMergeSuccess, endMergeFailure, endMergeFailure )
	return process
end

Lobby.Process.MergePublicGameLobby = function ( controller )
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.LOBBY_MERGE )
	Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
	local startMergeProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_MERGE )
	end
	
	local endMergeSuccessProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
		Lobby.Merge.Complete()
		Lobby.Matchmaking.ClearSearchInfo()
	end
	
	local endMergeFailureProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Merge.Complete()
	end
	
	local startMerge = Lobby.Actions.ExecuteScript( startMergeProcess )
	local lobbySearch = Lobby.Actions.SearchForLobby( controller )
	local lobbyJoin = Lobby.Actions.QoSJoinSearchResults( controller, lobbySearch )
	local endMergeSuccess = Lobby.Actions.ExecuteScript( endMergeSuccessProcess )
	local endMergeFailure = Lobby.Actions.ExecuteScript( endMergeFailureProcess )
	local lobbyQoSSearchStage1 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage2 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSJoinStage1 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage1 )
	local lobbyQoSJoinStage2 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage2 )
	local searchDelay2 = Lobby.Actions.TimeDelay( 1000 )
	lobbyQoSSearchStage1.name = lobbyQoSSearchStage1.name .. "_1"
	lobbyQoSSearchStage2.name = lobbyQoSSearchStage2.name .. "_2"
	lobbyQoSJoinStage1.name = lobbyQoSJoinStage1.name .. "_1"
	lobbyQoSJoinStage2.name = lobbyQoSJoinStage2.name .. "_2"
	local process = {
		head = startMerge,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( startMerge, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, searchDelay2, endMergeFailure )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, endMergeSuccess, searchDelay2, endMergeFailure )
	Lobby.Process.AddActions( searchDelay2, lobbyQoSSearchStage2, lobbyQoSSearchStage2, endMergeFailure )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, endMergeFailure, endMergeFailure )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, endMergeSuccess, endMergeFailure, endMergeFailure )
	return process
end

Lobby.Process.JoinSystemlinkOld = function ( controller, mainMode, networkMode, hostXuid, hostInfo, sourceLobbyType, destLobbyType )
	local gameLobbyCleanupScript = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		} )
	end
	
	local session = Engine.GetLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local gameLobbyCleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanupScript )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startHost = Lobby.Actions.LobbyHostStart( controller, mainMode, sourceLobbyType, session.lobbyMode, session.sessionHost.maxClients )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( startHost.lobbyType )
	local startClient = Lobby.Actions.LobbyClientStart( startHost.lobbyType )
	local join = Lobby.Actions.JoinHost( controller, mainMode, networkMode, hostXuid, hostInfo, sourceLobbyType, destLobbyType )
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	Lobby.Process.ForceAction( closeSpinnerError, joinFailed )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, gameLobbyCleanup )
	local lastAction = gameLobbyCleanup
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		Lobby.Process.AddActions( lastAction, endPrivateClient )
		Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
		Lobby.Process.AddActions( endPrivateHost, startHost )
		Lobby.Process.AddActions( startHost, addPrimary )
		Lobby.Process.AddActions( addPrimary, startClient )
		lastAction = startClient
	end
	Lobby.Process.AddActions( lastAction, join )
	Lobby.Process.AddActions( join, closeSpinner, closeSpinnerError, closeSpinnerError )
	return process
end

Lobby.Process.JoinSystemlink = function ( controller, mainMode, networkMode, hostXuid, hostInfo, sourceLobbyType, destLobbyType )
	if Dvar.join_transitionLobby:get() == false then
		return Lobby.Process.JoinSystemlinkOld( controller, mainMode, networkMode, hostXuid, hostInfo, sourceLobbyType, destLobbyType )
	else
		local openSpinner = Lobby.Actions.OpenSpinner()
		local closeSpinner = Lobby.Actions.CloseSpinner()
		local startTransitionHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_TRANSITION, Enum.LobbyMode.LOBBY_MODE_INVALID, 18 )
		local joinTransitionHost = Lobby.Actions.LobbyJoinSession( controller, Enum.LobbyType.LOBBY_TYPE_TRANSITION, Enum.JoinType.JOIN_TYPE_PARTY )
		local join = Lobby.Actions.JoinHost( controller, mainMode, networkMode, hostXuid, hostInfo, Enum.LobbyType.LOBBY_TYPE_TRANSITION, destLobbyType )
		local waitForParty = Lobby.Actions.WaitForParty( join.joinResults, 10000 )
		local moveLobbySession = Lobby.Actions.MoveLobbySession( controller, join.joinResults )
		local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_TRANSITION )
		local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_TRANSITION )
		local process = {
			head = openSpinner,
			interrupt = Lobby.Interrupt.NONE,
			force = true,
			cancellable = true
		}
		local successAction = endGameClient
		Lobby.Process.ForceAction( successAction, endGameHost )
		Lobby.Process.ForceAction( endGameHost, closeSpinner )
		local failureAction = Lobby.ProcessQueue.CopyProcess( successAction )
		Lobby.Process.AddActions( openSpinner, startTransitionHost, failureAction, failureAction )
		Lobby.Process.AddActions( startTransitionHost, joinTransitionHost, failureAction, failureAction )
		Lobby.Process.AddActions( joinTransitionHost, join, failureAction, failureAction )
		Lobby.Process.AddActions( join, waitForParty, failureAction, failureAction )
		Lobby.Process.AddActions( waitForParty, moveLobbySession, failureAction, failureAction )
		Lobby.Process.ForceAction( moveLobbySession, closeSpinner )
		return process
	end
end

Lobby.Process.Join = function ( controller, xuid, joinType, shouldBringParty )
	local maxClientCount = 0
	local gameLobbyActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if gameLobbyActive then
		maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	else
		maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local gameLobbyCleanupScript = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local shouldJoinPrivateCheck = function ()
		return Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local joinFailureScript = function ()
		local data = {
			controller = controller,
			signoutUsers = false
		}
		LobbyVM.OnErrorShutdown( data )
	end
	
	local menuId = Engine.GetLobbyUIScreen()
	local curScreen = LobbyData.GetLobbyMenuByID( menuId )
	local modeSelectMenu = nil
	if curScreen.networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		modeSelectMenu = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
	else
		modeSelectMenu = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
	end
	local joinFailureRecover = Lobby.Process.ReloadPrivateLobby( controller, modeSelectMenu.networkMode )
	local lobbySettingsRecover = Lobby.Actions.LobbySettings( controller, modeSelectMenu )
	local updateUIRecover = Lobby.Actions.UpdateUI( controller, modeSelectMenu )
	local joinFailureRecoverFirstTime = Lobby.Process.ReloadPrivateLobby( controller, modeSelectMenu.networkMode )
	local lobbySettingsRecoverFirstTime = Lobby.Actions.LobbySettings( controller, modeSelectMenu )
	local updateUIRecoverFirstTime = Lobby.Actions.UpdateUI( controller, modeSelectMenu )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	closeSpinnerError.name = closeSpinnerError.name .. "Error"
	local closeSpinnerFirstTimePreCheck = Lobby.Actions.CloseSpinner()
	closeSpinnerFirstTimePreCheck.name = closeSpinnerFirstTimePreCheck.name .. "NeedsFirstTimeFlowPreCheck"
	local closeSpinnerFirstTime = Lobby.Actions.CloseSpinner()
	closeSpinnerFirstTime.name = closeSpinnerFirstTime.name .. "NeedsFirstTimeFlow"
	local gameLobbyCleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanupScript )
	local joinFailure = Lobby.Actions.ExecuteScript( joinFailureScript )
	local leaveWithParty = Lobby.Actions.LeaveWithParty( 3000 )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local infoProbePreCheck = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = xuid
	} )
	local checkFirstTimeFlowPreCheck = Lobby.Actions.CheckFirstTimeFlowRequirements( controller, infoProbePreCheck )
	local showFirstTimeFlowErrorPreCheck = Lobby.Actions.ShowFirstTimeFlowError( checkFirstTimeFlowPreCheck )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = xuid
	} )
	local checkFirstTimeFlow = Lobby.Actions.CheckFirstTimeFlowRequirements( controller, infoProbe )
	local showFirstTimeFlowError = Lobby.Actions.ShowFirstTimeFlowError( checkFirstTimeFlow )
	local join = Lobby.Actions.LobbyJoinXUIDExt( controller, joinType, infoProbe, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local shouldJoinPrivate = Lobby.Actions.ExecuteScriptWithReturn( shouldJoinPrivateCheck, true, false, false )
	local infoProbePrivate = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = xuid
	} )
	local joinPrivate = Lobby.Actions.LobbyJoinXUIDExt( controller, joinType, infoProbe, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, maxClientCount )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local privateDestructiveProcess = false
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local f21_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
	if currentMenuIdx ~= f21_local0.id then
		privateDestructiveProcess = true
	end
	f21_local0 = Lobby.Actions.ForceLobbyUIScreen
	local f21_local1 = controller
	local f21_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING )
	local forceUIScreen = f21_local0( f21_local1, f21_local2.id )
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	local lastAction = gameLobbyCleanup
	local isInGame = Engine.IsInGame()
	local isPrivateActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isGameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local privateLobbyCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local gameLobbyCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f21_local3 = isPrivateHost and shouldBringParty == LuaEnum.LEAVE_WITH_PARTY.WITH
	local leaveGameClient = false
	local leaveGameHost = false
	local leavePrivateClient = false
	local leavePrivateHost = false
	if isInGame == true then
		leaveGameClient = true
		leaveGameHost = true
		leavePrivateClient = true
		if isPrivateHost == true then
			leavePrivateHost = true
		end
	elseif isGameActive == true then
		leaveGameClient = true
		leaveGameHost = true
		if f21_local3 == false then
			leavePrivateClient = true
			if isPrivateHost == true then
				leavePrivateHost = true
			end
		end
	elseif isPrivateActive == true then
		if f21_local3 == false then
			leavePrivateClient = true
			if isPrivateHost == true then
				leavePrivateHost = true
			end
		end
	else
		leaveGameClient = true
		leaveGameHost = true
		leavePrivateClient = true
		leavePrivateHost = true
	end
	local errorAction = joinFailureRecover.head
	Lobby.Process.ForceAction( joinFailureRecover.tail, lobbySettingsRecover )
	Lobby.Process.ForceAction( lobbySettingsRecover, updateUIRecover )
	Lobby.Process.ForceAction( updateUIRecover, joinFailed )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, infoProbePreCheck, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( infoProbePreCheck, checkFirstTimeFlowPreCheck, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( checkFirstTimeFlowPreCheck, gameLobbyCleanup, closeSpinnerFirstTimePreCheck, closeSpinnerFirstTimePreCheck )
	local destructiveProcess = false
	if isGameActive == true and f21_local3 == true then
		Lobby.Process.AddActions( lastAction, leaveWithParty, errorAction, errorAction )
		lastAction = leaveWithParty
		destructiveProcess = true
	end
	if leaveGameClient == true then
		Lobby.Process.AddActions( lastAction, endGameClient, errorAction, errorAction )
		lastAction = endGameClient
		destructiveProcess = true
	end
	if leaveGameHost == true then
		Lobby.Process.AddActions( lastAction, endGameHost, errorAction, errorAction )
		lastAction = endGameHost
		destructiveProcess = true
	end
	if leavePrivateClient == true then
		Lobby.Process.AddActions( lastAction, endPrivateClient, errorAction, errorAction )
		lastAction = endPrivateClient
		privateDestructiveProcess = true
		destructiveProcess = true
	end
	if leavePrivateHost == true then
		Lobby.Process.AddActions( lastAction, endPrivateHost, errorAction, errorAction )
		lastAction = endPrivateHost
		privateDestructiveProcess = true
		destructiveProcess = true
	end
	if isPrivateHost == false or leavePrivateHost == true then
		Lobby.Process.AddActions( lastAction, startPrivateHost, errorAction, errorAction )
		Lobby.Process.AddActions( startPrivateHost, addPrimary, errorAction, errorAction )
		lastAction = addPrimary
		privateDestructiveProcess = true
		destructiveProcess = true
	end
	if leavePrivateClient == true then
		Lobby.Process.AddActions( lastAction, startPrivateClient, errorAction, errorAction )
		lastAction = startPrivateClient
		privateDestructiveProcess = true
		destructiveProcess = true
	end
	local screenChangeRecoveryNeeded = Lobby.Actions.IsConditionTrue( not privateDestructiveProcess )
	local lobbyRecoveryNeeded = Lobby.Actions.IsConditionTrue( destructiveProcess )
	Lobby.Process.AddActions( lastAction, infoProbe, errorAction, errorAction )
	Lobby.Process.AddActions( infoProbe, checkFirstTimeFlow, errorAction, errorAction )
	Lobby.Process.AddActions( checkFirstTimeFlow, join, closeSpinnerFirstTime, closeSpinnerFirstTime )
	Lobby.Process.AddActions( join, shouldJoinPrivate, screenChangeRecoveryNeeded, errorAction )
	Lobby.Process.AddActions( screenChangeRecoveryNeeded, forceUIScreen, lobbyRecoveryNeeded, errorAction )
	Lobby.Process.AddActions( lobbyRecoveryNeeded, errorAction, closeSpinnerError, errorAction )
	Lobby.Process.AddActions( shouldJoinPrivate, infoProbePrivate, closeSpinner, closeSpinner )
	Lobby.Process.AddActions( infoProbePrivate, joinPrivate, errorAction, errorAction )
	Lobby.Process.AddActions( joinPrivate, closeSpinner, closeSpinner, closeSpinner )
	Lobby.Process.ForceAction( forceUIScreen, closeSpinnerError )
	Lobby.Process.ForceAction( closeSpinnerError, joinFailed )
	Lobby.Process.ForceAction( closeSpinnerFirstTimePreCheck, showFirstTimeFlowErrorPreCheck )
	Lobby.Process.ForceAction( closeSpinnerFirstTime, joinFailureRecoverFirstTime.head )
	Lobby.Process.ForceAction( joinFailureRecoverFirstTime.tail, lobbySettingsRecoverFirstTime )
	Lobby.Process.ForceAction( lobbySettingsRecoverFirstTime, updateUIRecoverFirstTime )
	Lobby.Process.ForceAction( updateUIRecoverFirstTime, showFirstTimeFlowError )
	return process
end

Lobby.Process.ReloadPrivateLobby = function ( controller, networkMode )
	local gameLobbyCleanupScript = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local menuId = Engine.GetLobbyUIScreen()
	local curScreen = LobbyData.GetLobbyMenuByID( menuId )
	local modeSelectMenu = nil
	if curScreen.networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		modeSelectMenu = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
	else
		modeSelectMenu = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
	end
	local gameLobbyCleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanupScript )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, networkMode )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, modeSelectMenu.maxClients )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local process = {
		head = openSpinner,
		tail = closeSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, gameLobbyCleanup )
	Lobby.Process.AddActions( gameLobbyCleanup, endGameClient )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	Lobby.Process.AddActions( endGameHost, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, setNetworkMode )
	if networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		local signLocalUserInToLive = Lobby.Actions.SignUserInToLive( controller )
		Lobby.Process.AddActions( setNetworkMode, signLocalUserInToLive )
		Lobby.Process.AddActions( signLocalUserInToLive, startPrivateHost )
	else
		Lobby.Process.AddActions( setNetworkMode, startPrivateHost )
	end
	Lobby.Process.AddActions( startPrivateHost, addPrimary )
	Lobby.Process.AddActions( addPrimary, startPrivateClient )
	Lobby.Process.AddActions( startPrivateClient, closeSpinner )
	return process
end

Lobby.Process.Recover = function ( controller, currTargetOverride )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	if currTargetOverride ~= nil then
		currentMenuIdx = currTargetOverride
	end
	local currTarget = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	if currTarget.name == LuaEnum.UI.MAIN then
		return nil
	end
	local target = LobbyData.GetLobbyMenuByName( currTarget.errTarget )
	local backTarget = LobbyData.GetLobbyMenuByName( target.backTarget )
	local openSpinner = Lobby.Actions.OpenSpinner( nil, true )
	local lobbyInRecovery = Lobby.Actions.LobbyInRecovery()
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, target )
	local forceUIScreen = Lobby.Actions.ForceLobbyUIScreen( controller, target.id )
	local updateUI = Lobby.Actions.UpdateUI( controller, target )
	local shutdownArena = Lobby.Actions.ArenaErrorShutdown( controller )
	local setDefaultArenaPlaylist = Lobby.Actions.SetDefaultArenaPlaylist( controller )
	local runPlaylistRules = Lobby.Actions.RunPlaylistRules( controller )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		tail = nil,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, lobbyInRecovery )
	Lobby.Process.AddActions( lobbyInRecovery, endGameClient )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	Lobby.Process.AddActions( endGameHost, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, lobbySettings )
	local lastAction = lobbySettings
	if backTarget ~= nil then
		if backTarget.lobbyType == Enum.LobbyType.LOBBY_TYPE_INVALID then
			
		elseif backTarget.lobbyType ~= target.lobbyType then
			local startHost = Lobby.Actions.LobbyHostStart( controller, backTarget.mainMode, backTarget.lobbyType, backTarget.lobbyMode, backTarget.maxClients )
			local addPrimary = Lobby.Actions.LobbyHostAddPrimary( backTarget.lobbyType )
			local startClient = Lobby.Actions.LobbyClientStart( backTarget.lobbyType )
			startHost.name = startHost.name .. "_1"
			Lobby.Process.AddActions( lastAction, startHost )
			Lobby.Process.AddActions( startHost, addPrimary )
			Lobby.Process.AddActions( addPrimary, startClient )
			lastAction = startClient
		elseif target.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP or target.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			local startHost = Lobby.Actions.LobbyHostStart( controller, target.mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, target.lobbyMode, target.maxClients )
			local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local startClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			startHost.name = startHost.name .. "_4"
			Lobby.Process.AddActions( lastAction, startHost )
			Lobby.Process.AddActions( startHost, addPrimary )
			Lobby.Process.AddActions( addPrimary, startClient )
			lastAction = startClient
		end
	end
	if target.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		local startHost = Lobby.Actions.LobbyHostStart( controller, target.mainMode, target.lobbyType, target.lobbyMode, target.maxClients )
		local addPrimary = Lobby.Actions.LobbyHostAddPrimary( target.lobbyType )
		local startClient = Lobby.Actions.LobbyClientStart( target.lobbyType )
		local hostingEvent = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
			controller = controller,
			lobbyType = target.lobbyType,
			mainMode = target.mainMode,
			lobbyTimerType = target.lobbyTimerType
		} )
		startHost.name = startHost.name .. "_2"
		Lobby.Process.AddActions( lastAction, startHost )
		Lobby.Process.AddActions( startHost, addPrimary )
		Lobby.Process.AddActions( addPrimary, startClient )
		lastAction = startClient
		if target.lobbyTimerType ~= LuaEnum.TIMER_TYPE.INVALID then
			Lobby.Process.AddActions( startClient, hostingEvent )
			lastAction = hostingEvent
		end
	elseif target.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		local maxClientsUpdate = function ()
			local maxClients = Dvar.party_maxplayers:get()
			Engine.SetLobbyMaxClients( target.lobbyType, maxClients )
		end
		
		local startHost = Lobby.Actions.LobbyHostStart( controller, target.mainMode, target.lobbyType, target.lobbyMode, target.maxClients )
		local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, {
			xuid = Engine.GetXUID64( controller )
		} )
		local join = Lobby.Actions.LobbyJoinXUID( controller, {
			xuid = Engine.GetXUID64( controller )
		}, Enum.JoinType.JOIN_TYPE_PARTY )
		local hostingEvent = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
			controller = controller,
			lobbyType = target.lobbyType,
			mainMode = target.mainMode,
			lobbyTimerType = target.lobbyTimerType
		} )
		startHost.name = startHost.name .. "_3"
		local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
		local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
		local maxClientsUpdateEvent = Lobby.Actions.ExecuteScript( maxClientsUpdate )
		Lobby.Process.AddActions( lastAction, startHost )
		Lobby.Process.AddActions( startHost, infoProbe )
		Lobby.Process.AddActions( infoProbe, join )
		lastAction = join
		if target.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC or target.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
			Lobby.Process.AddActions( lastAction, runPlaylistSettings )
			Lobby.Process.AddActions( runPlaylistSettings, lobbyAdvertise )
			Lobby.Process.AddActions( lobbyAdvertise, maxClientsUpdateEvent )
			lastAction = maxClientsUpdateEvent
		end
		Lobby.Process.AddActions( lastAction, hostingEvent )
		lastAction = hostingEvent
	end
	if target.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
		Lobby.Process.AddActions( lastAction, setDefaultArenaPlaylist )
		Lobby.Process.AddActions( setDefaultArenaPlaylist, runPlaylistRules )
		lastAction = runPlaylistRules
	end
	Lobby.Process.AddActions( lastAction, shutdownArena )
	Lobby.Process.AddActions( shutdownArena, forceUIScreen )
	Lobby.Process.AddActions( forceUIScreen, updateUI )
	Lobby.Process.AddActions( updateUI, closeSpinner )
	Lobby.Process.AddActions( closeSpinner, nil )
	process.tail = closeSpinner
	return process
end

Lobby.Process.ForceToMenu = function ( controller, target, errorMsg )
	local isTargetPrivate = target.isPrivate
	local mainMode = target.mainMode
	local networkMode = target.networkMode
	local maxClients = target.maxClients
	local lobbySettings = Lobby.Actions.LobbySettings( controller, target )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local forceUIScreen = Lobby.Actions.ForceLobbyUIScreen( controller, target.id )
	local updateUI = Lobby.Actions.UpdateUI( controller, target )
	local process = {
		head = lobbySettings,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( lobbySettings, endGameClient )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	Lobby.Process.AddActions( endGameHost, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	local lastAction = endPrivateHost
	if isTargetPrivate == true then
		local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, target.lobbyMode, maxClients )
		local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		Lobby.Process.AddActions( endGameHost, startPrivateHost )
		Lobby.Process.AddActions( startPrivateHost, addPrimary )
		Lobby.Process.AddActions( addPrimary, startPrivateClient )
		lastAction = startPrivateClient
	end
	Lobby.Process.AddActions( lastAction, forceUIScreen )
	Lobby.Process.AddActions( forceUIScreen, updateUI )
	if errorMsg ~= nil then
		local errorPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
		Lobby.Process.AddActions( updateUI, errorPopup )
	end
	return process
end

Lobby.Process.HostLeftNoMigrationCreatePrivateLobby = function ( controller, mainMode, maxClients )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local target = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinnerSuc = Lobby.Actions.CloseSpinner()
	local closeSpinnerErr = Lobby.Actions.CloseSpinner()
	local startHost = Lobby.Actions.LobbyHostStart( controller, mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, target.lobbyMode, maxClients )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( startHost.lobbyType )
	local startClient = Lobby.Actions.LobbyClientStart( startHost.lobbyType )
	local errorPopup = Lobby.Actions.ErrorPopup( startHost )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, startHost )
	Lobby.Process.AddActions( startHost, addPrimary )
	Lobby.Process.AddActions( addPrimary, startClient )
	Lobby.Process.AddActions( startClient, closeSpinnerSuc )
	Lobby.Process.AddActions( closeSpinnerErr, errorPopup )
	return process
end

Lobby.Process.PromoteClientToPrivateLobbyHost = function ( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	local menuId = Engine.GetLobbyUIScreen()
	local curScreen = LobbyData.GetLobbyMenuByID( menuId )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToPrivateLobbyHost: menuId(" .. menuId .. "), lobbyType(" .. lobbyType .. "), mainMode(" .. mainMode .. "), lobbyTimerType(" .. curScreen.lobbyTimerType .. ").\n" )
	local signalDone = Lobby.Actions.PromoteToHostDone( controller, lobbyType, newMigrateIndex, isInGame )
	local createHost = Lobby.Actions.LobbyHostStartMigratedInfo( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo )
	local process = {
		head = signalDone,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( lobbyType ) == false then
		process.head = createHost
		Lobby.Process.AddActions( createHost, signalDone )
		Lobby.Process.AddActions( signalDone, nil )
	end
	return process
end

Lobby.Process.TransferDataFromClientModuleToHostModule = function ()
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	for index, client in ipairs( gamelobby.sessionClients ) do
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
		Engine.LobbyHostAssignMapVoteToClient( lobbyType, client.xuid, client.mapVote )
		Engine.LobbyHostAssignTeamToClient( lobbyType, client.xuid, client.team )
	end
end

Lobby.Process.PromoteClientToGameLobbyHost = function ( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	local menuId = Engine.GetLobbyUIScreen()
	local curScreen = LobbyData.GetLobbyMenuByID( menuId )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local status, statusValue = Engine.GetGameLobbyStatusInfo( lobbyType )
	local hostingLobby = function ()
		if not Engine.IsInGame() and curScreen.lobbyTimerType ~= LuaEnum.TIMER_TYPE.INVALID then
			Lobby.Timer.HostingLobby( {
				controller = controller,
				lobbyType = lobbyType,
				mainMode = mainMode,
				lobbyTimerType = curScreen.lobbyTimerType,
				status = status,
				statusValue = statusValue
			} )
		end
		if curScreen.isAdvertised == true then
			if lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_PUBLIC and lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_ARENA then
				local f34_local0 = false
			else
				local enable = true
			end
			Engine.QoSProbeListenerEnable( lobbyType, f34_local0 )
		end
		Lobby.Process.TransferDataFromClientModuleToHostModule()
	end
	
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToGameLobbyHost: menuId(" .. menuId .. "), lobbyType(" .. lobbyType .. "), mainMode(" .. mainMode .. "), lobbyTimerType(" .. curScreen.lobbyTimerType .. ").\n" )
	local signalDone = Lobby.Actions.PromoteToHostDone( controller, lobbyType, newMigrateIndex, isInGame )
	local createHost = Lobby.Actions.LobbyHostStartMigratedInfo( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo )
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, curScreen )
	local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
	local process = {
		head = signalDone,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( lobbyType ) == false then
		process.head = createHost
		Lobby.Process.AddActions( createHost, signalDone )
		Lobby.Process.AddActions( signalDone, hostingEvent )
		if curScreen.isAdvertised == true then
			Lobby.Process.AddActions( hostingEvent, lobbyAdvertise )
			if isInGame == false then
				Lobby.Process.AddActions( lobbyAdvertise, lobbySettings )
			end
		end
	end
	return process
end

Lobby.Process.PromoteClientToHost = function ( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	local process = nil
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		process = Lobby.Process.PromoteClientToPrivateLobbyHost( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	elseif lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		process = Lobby.Process.PromoteClientToGameLobbyHost( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	end
	return process
end

Lobby.Process.LocalClientLeave = function ( controller, leavingClientXuid )
	local leavePrivateClient = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_PRIVATE, controller, leavingClientXuid )
	local leavelocalGameClient = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_GAME, controller, leavingClientXuid )
	local process = {
		head = leavelocalGameClient,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.AddActions( leavelocalGameClient, leavePrivateClient )
	Lobby.Process.AddActions( leavePrivateClient )
	return process
end

Lobby.Process.LeaveWithParty = function ( lobbyModule, lobbyType, lobbyMode )
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isGameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local process = nil
	if lobbyModule ~= Enum.LobbyModule.LOBBY_MODULE_CLIENT or isGameActive == false then
		return 
	end
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local process = {
		head = endGameClient,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = true
	}
	local lastAction = endGameClient
	if isGameHost == true then
		Lobby.Process.ForceAction( lastAction, endGameHost )
		lastAction = endGameHost
	end
	Lobby.Process.ForceAction( lastAction, closeSpinner )
	return process
end

Lobby.Process.ManagePartyLeave = function ( controller )
	local curTarget = LobbyData.GetLobbyMenuByID( LobbyData.GetLobbyNav() )
	if curTarget == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isPrivateActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if isPrivateHost == false or isPrivateActive == false then
		return nil
	else
		local mainMode = Engine.GetLobbyMainMode()
		local lobbyMode = Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local startHost = Lobby.Actions.LobbyHostStart( controller, mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, lobbyMode, maxClients )
		local addPrimary = Lobby.Actions.LobbyHostAddPrimary( startHost.lobbyType )
		local startClient = Lobby.Actions.LobbyClientStart( startHost.lobbyType )
		local process = {
			head = endPrivateClient,
			interrupt = Lobby.Interrupt.NONE,
			force = true,
			cancellable = true
		}
		Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
		Lobby.Process.AddActions( endPrivateHost, startHost )
		Lobby.Process.AddActions( startHost, addPrimary )
		Lobby.Process.AddActions( addPrimary, startClient )
		return process
	end
end

Lobby.Process.NonFatalError = function ( errorMsg )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local target = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local errorPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
	local process = {
		head = errorPopup,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	return process
end

Lobby.Process.FatalError = function ( errorMsg )
	local controller = Engine.GetPrimaryController()
	local fromMenuIdx = Engine.GetLobbyUIScreen()
	local fromTarget = LobbyData.GetLobbyMenuByID( fromMenuIdx )
	local toTarget = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local settings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local errorPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, settings )
	Lobby.Process.AddActions( settings, settings )
	Lobby.Process.AddActions( settings, updateUI )
	Lobby.Process.AddActions( updateUI, closeSpinner )
	Lobby.Process.AddActions( closeSpinner, errorPopup )
	return process
end

Lobby.Process.Reset = function ()
	local controller = Engine.GetPrimaryController()
	local fromMenuIdx = Engine.GetLobbyUIScreen()
	local fromTarget = LobbyData.GetLobbyMenuByID( fromMenuIdx )
	local toTarget = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	local closeSpinnerA = Lobby.Actions.CloseSpinner()
	local closeSpinnerB = Lobby.Actions.CloseSpinner()
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local settings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local process = {
		head = endGameHost,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( closeSpinnerA, endGameHost )
	Lobby.Process.AddActions( endGameHost, endGameClient )
	Lobby.Process.AddActions( endGameClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, settings )
	Lobby.Process.AddActions( settings, updateUI )
	Lobby.Process.AddActions( updateUI, closeSpinnerB )
	return process
end

Lobby.Process.DevmapClient = function ( controller )
	local targetPrivate = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
	local mainModePrivate = targetPrivate.mainMode
	local lobbyTypePrivate = targetPrivate.lobbyType
	local lobbyModePrivate = targetPrivate.lobbyMode
	local maxClientsPrivate = targetPrivate.maxClients
	local lobbySettings = Lobby.Actions.LobbySettings( controller, targetPrivate, nil, true )
	local networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	if Engine.GetDvarBool( "devmaponline" ) == true then
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	end
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, networkMode )
	local startHostPrivate = Lobby.Actions.LobbyHostStart( controller, mainModePrivate, lobbyTypePrivate, lobbyModePrivate, maxClientsPrivate )
	local addPrimaryPrivate = Lobby.Actions.LobbyHostAddPrimary( lobbyTypePrivate )
	local startClientPrivate = Lobby.Actions.LobbyClientStart( lobbyTypePrivate )
	local process = {
		head = lobbySettings,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( lobbySettings, setNetworkMode )
	Lobby.Process.AddActions( setNetworkMode, startHostPrivate )
	Lobby.Process.AddActions( startHostPrivate, addPrimaryPrivate )
	Lobby.Process.AddActions( addPrimaryPrivate, startClientPrivate )
	return process
end

Lobby.Process.Devmap = function ( controller, mainMode )
	local targetPrivate = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
	local targetGame = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	if mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		targetGame = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		targetGame = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_ZM )
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		targetGame = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
	end
	if targetGame == LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP ) and Dvar.ui_gametype:get() == "cpzm" then
		targetGame = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2 )
	end
	local mainModePrivate = targetPrivate.mainMode
	local lobbyTypePrivate = targetPrivate.lobbyType
	local lobbyModePrivate = targetPrivate.lobbyMode
	local maxClientsPrivate = targetPrivate.maxClients
	local mainModeGame = targetGame.mainMode
	local lobbyTypeGame = targetGame.lobbyType
	local lobbyModeGame = targetGame.lobbyMode
	local maxClientsGame = targetGame.maxClients
	local lobbySettings = Lobby.Actions.LobbySettings( controller, targetGame, nil, true )
	local updateUI = Lobby.Actions.UpdateUI( controller, targetGame )
	local networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	if Engine.GetDvarBool( "devmaponline" ) == true then
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	end
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, networkMode )
	local startHostPrivate = Lobby.Actions.LobbyHostStart( controller, mainModePrivate, lobbyTypePrivate, lobbyModePrivate, maxClientsPrivate )
	local addPrimaryPrivate = Lobby.Actions.LobbyHostAddPrimary( lobbyTypePrivate )
	local startClientPrivate = Lobby.Actions.LobbyClientStart( lobbyTypePrivate )
	local startHostGame = Lobby.Actions.LobbyHostStart( controller, mainModeGame, Enum.LobbyType.LOBBY_TYPE_GAME, lobbyModeGame, maxClientsGame )
	local addPrimaryGame = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_GAME )
	local startGameClientGame = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_GAME )
	local setGameTypeAndMapName = Lobby.Actions.SetGameAndTypeMapName( controller, Enum.LobbyType.LOBBY_TYPE_GAME, Dvar.ui_gametype:get(), Dvar.ui_mapname:get() )
	local process = {
		head = lobbySettings,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( lobbySettings, updateUI )
	Lobby.Process.AddActions( updateUI, setNetworkMode )
	Lobby.Process.AddActions( setNetworkMode, startHostPrivate )
	Lobby.Process.AddActions( startHostPrivate, addPrimaryPrivate )
	Lobby.Process.AddActions( addPrimaryPrivate, startClientPrivate )
	Lobby.Process.AddActions( startClientPrivate, startHostGame )
	Lobby.Process.AddActions( startHostGame, setGameTypeAndMapName )
	Lobby.Process.AddActions( setGameTypeAndMapName, addPrimaryGame )
	if Dvar.splitscreen:get() == true and Dvar.splitscreen_playerCount:get() > 1 then
		local secondClient = Lobby.Actions.LobbyHostAddLocal( 1, lobbyTypeGame )
		Lobby.Process.AddActions( addPrimaryGame, secondClient )
		Lobby.Process.AddActions( secondClient, startGameClientGame )
	else
		Lobby.Process.AddActions( addPrimaryGame, startGameClientGame )
	end
	return process
end

Lobby.Process.PrimaryControllerSignedIn = function ( controller )
	local fromMenuIdx = Engine.GetLobbyUIScreen()
	local fromTarget = LobbyData.GetLobbyMenuByID( fromMenuIdx )
	local toTarget = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local settings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local signLocalUserIn = Lobby.Actions.SignUserInToLive( controller )
	local errorPopup = Lobby.Actions.ErrorPopupMsg( "XBOXLIVE_SIGNEDOUT" )
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, settings )
	Lobby.Process.AddActions( settings, updateUI )
	Lobby.Process.AddActions( updateUI, endGameClient )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	Lobby.Process.AddActions( endGameHost, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, signLocalUserIn )
	Lobby.Process.AddActions( signLocalUserIn, closeSpinner )
	Lobby.Process.AddActions( closeSpinner, errorPopup )
	return process
end

Lobby.Process.PrimaryControllerSignedOut = function ( controller )
	local fromMenuIdx = Engine.GetLobbyUIScreen()
	local fromTarget = LobbyData.GetLobbyMenuByID( fromMenuIdx )
	local toTarget = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local settings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local signLocalUserOut = Lobby.Actions.SignUserOutOfLive( controller )
	local errorPopup = Lobby.Actions.ErrorPopupMsg( "XBOXLIVE_SIGNEDOUT" )
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, settings )
	Lobby.Process.AddActions( settings, updateUI )
	Lobby.Process.AddActions( updateUI, endGameClient )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	Lobby.Process.AddActions( endGameHost, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, signLocalUserOut )
	Lobby.Process.AddActions( signLocalUserOut, closeSpinner )
	Lobby.Process.AddActions( closeSpinner, errorPopup )
	return process
end

Lobby.Process.ReAdvertiseLobby = function ( controller )
	local forceUpdate = function ()
		Dvar.lobbyAdvertiseDirty:set( true )
	end
	
	local advertiseOff = Lobby.Actions.AdvertiseLobby( false )
	local advertiseOn = Lobby.Actions.AdvertiseLobby( true )
	local forceUpdateEvent = Lobby.Actions.ExecuteScript( forceUpdate )
	local process = {
		head = advertiseOff,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.ForceAction( advertiseOff, advertiseOn )
	Lobby.Process.ForceAction( advertiseOn, forceUpdateEvent )
	return process
end

