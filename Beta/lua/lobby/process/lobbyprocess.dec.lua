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
	else
		local openSpinner = Lobby.Actions.OpenSpinner()
		local closeSpinner = Lobby.Actions.CloseSpinner()
		local switchMode = Lobby.Actions.SwitchMode( controller, toMainMode )
		local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
		process.head = openSpinner
		Lobby.Process.AddActions( openSpinner, switchMode )
		Lobby.Process.AddActions( switchMode, lobbySettings )
		Lobby.Process.AddActions( lobbySettings, updateUI )
		Lobby.Process.AddActions( updateUI, closeSpinner )
		return process
	end
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
		Lobby.Timer.HostingLobby( {
			controller = controller,
			lobbyType = toTarget.lobbyType,
			mainMode = toTarget.mainMode,
			lobbyTimerType = toTarget.lobbyTimerType
		} )
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

Lobby.Process.JoinSystemlink = function ( controller, mainMode, networkMode, hostXuid, hostInfo )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local join = Lobby.Actions.JoinHost( controller, mainMode, networkMode, hostXuid, hostInfo )
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	Lobby.Process.ForceAction( closeSpinnerError, joinFailed )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, join )
	Lobby.Process.AddActions( join, closeSpinner, closeSpinnerError, closeSpinnerError )
	return process
end

Lobby.Process.Join = function ( controller, xuid, joinType, shouldBringParty )
	local gameLobbyCleanup = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local shouldJoinPrivateCheck = function ()
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local cleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanup )
	local leaveWithParty = Lobby.Actions.LeaveWithParty( 3000 )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = xuid
	} )
	local join = Lobby.Actions.LobbyJoinXUIDExt( controller, joinType, infoProbe, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local shouldJoinPrivate = Lobby.Actions.ExecuteScriptWithReturn( shouldJoinPrivateCheck, true, false, false )
	local infoProbePrivate = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = xuid
	} )
	local joinPrivate = Lobby.Actions.LobbyJoinXUIDExt( controller, joinType, infoProbe, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local sessionSearch = Lobby.Actions.PlatformSessionSearch( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local sessionjoin = Lobby.Actions.PlatformSessionJoin( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local menu = LobbyData.GetCurrentMenuTarget()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, menu.backTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, menu.backTarget )
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	Lobby.Process.ForceAction( lobbySettings, updateUI )
	Lobby.Process.ForceAction( updateUI, closeSpinnerError )
	Lobby.Process.ForceAction( closeSpinnerError, joinFailed )
	local errorAction = closeSpinnerError
	if isGameActive then
		errorAction = lobbySettings
	end
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( openSpinner, cleanup )
	local lastAction = cleanup
	local f15_local0 = shouldBringParty == LuaEnums.LEAVE_WITH_PARTY.WITH
	local isInGame = Engine.IsInGame()
	local isPrivateActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isGameActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local privateLobbyCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local gameLobbyCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
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
		if f15_local0 == false then
			leavePrivateClient = true
			if isPrivateHost == true then
				leavePrivateHost = true
			end
		end
	elseif isPrivateActive == true then
		if f15_local0 == false then
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
	if isGameActive == true and f15_local0 == true then
		Lobby.Process.AddActions( lastAction, leaveWithParty, errorAction, errorAction )
		lastAction = leaveWithParty
	end
	if leaveGameClient == true then
		Lobby.Process.AddActions( lastAction, endGameClient, errorAction, errorAction )
		lastAction = endGameClient
	end
	if leaveGameHost == true then
		Lobby.Process.AddActions( lastAction, endGameHost, errorAction, errorAction )
		lastAction = endGameHost
	end
	if leavePrivateClient == true then
		Lobby.Process.AddActions( lastAction, endPrivateClient, errorAction, errorAction )
		lastAction = endPrivateClient
	end
	if leavePrivateHost == true then
		Lobby.Process.AddActions( lastAction, endPrivateHost, errorAction, errorAction )
		lastAction = endPrivateHost
	end
	if isPrivateHost == false or leavePrivateHost == true then
		Lobby.Process.AddActions( lastAction, startPrivateHost, closeSpinnerError, closeSpinnerError )
		Lobby.Process.AddActions( startPrivateHost, addPrimary, closeSpinnerError, closeSpinnerError )
		lastAction = addPrimary
	end
	if leavePrivateClient == true then
		Lobby.Process.AddActions( lastAction, startPrivateClient, closeSpinnerError, closeSpinnerError )
		lastAction = startPrivateClient
	end
	Lobby.Process.AddActions( lastAction, infoProbe, errorAction, errorAction )
	Lobby.Process.AddActions( infoProbe, join, errorAction, errorAction )
	Lobby.Process.AddActions( join, shouldJoinPrivate, errorAction, errorAction )
	Lobby.Process.AddActions( shouldJoinPrivate, infoProbePrivate, sessionSearch, sessionSearch )
	Lobby.Process.AddActions( infoProbePrivate, joinPrivate, errorAction, errorAction )
	Lobby.Process.AddActions( joinPrivate, sessionSearch, errorAction, errorAction )
	Lobby.Process.AddActions( sessionSearch, sessionjoin, errorAction, errorAction )
	Lobby.Process.AddActions( sessionjoin, closeSpinner, errorAction, errorAction )
	return process
end

Lobby.Process.PS4AcceptInvite = function ( controller, invitationId, joinType, shouldBringParty )
	local gameLobbyCleanup = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	closeSpinnerError.name = closeSpinnerError.name .. "Error"
	local demonwareConnect = Lobby.Actions.ConnectingToDemonware( controller, 15000 )
	local cleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanup )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local getInviteInfo = Lobby.Actions.PlatformSessionGetInviteInfo( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, invitationId )
	local gamertagsToXuids = Lobby.Actions.GamertagsToXuids( controller, getInviteInfo )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, gamertagsToXuids )
	local join = Lobby.Actions.LobbyJoinXUID( controller, gamertagsToXuids, joinType )
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	local sessionSearch = Lobby.Actions.PlatformSessionSearch( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local sessionjoin = Lobby.Actions.PlatformSessionJoin( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, cleanup )
	Lobby.Process.AddActions( cleanup, demonwareConnect )
	Lobby.Process.AddActions( demonwareConnect, endGameClient )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	local lastAction = endGameHost
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( lastAction, endPrivateClient, closeSpinnerError, closeSpinnerError )
			lastAction = endPrivateClient
		end
		Lobby.Process.AddActions( lastAction, startPrivateHost, closeSpinnerError, closeSpinnerError )
		Lobby.Process.AddActions( startPrivateHost, addPrimary, closeSpinnerError, closeSpinnerError )
		Lobby.Process.AddActions( addPrimary, startPrivateClient, closeSpinnerError, closeSpinnerError )
		lastAction = startPrivateClient
	end
	Lobby.Process.AddActions( lastAction, getInviteInfo, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( getInviteInfo, gamertagsToXuids, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( gamertagsToXuids, infoProbe, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( infoProbe, join, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( join, sessionSearch, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( sessionSearch, sessionjoin, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( sessionjoin, closeSpinner, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( closeSpinnerError, joinFailed, joinFailed, joinFailed )
	return process
end

Lobby.Process.PS4SessionJoin = function ( controller, sessionId, joinType, shouldBringParty )
	local gameLobbyCleanup = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	local cleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanup )
	local demonwareConnect = Lobby.Actions.ConnectingToDemonware( controller, 15000 )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local getSessionInfo = Lobby.Actions.PlatformSessionGetSessionInfo( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local gamertagsToXuids = Lobby.Actions.GamertagsToXuids( controller, getSessionInfo )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, gamertagsToXuids )
	local join = Lobby.Actions.LobbyJoinXUID( controller, gamertagsToXuids, joinType )
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	local sessionSearch = Lobby.Actions.PlatformSessionSearch( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local sessionjoin = Lobby.Actions.PlatformSessionJoin( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, cleanup )
	Lobby.Process.AddActions( cleanup, demonwareConnect )
	Lobby.Process.AddActions( demonwareConnect, endGameClient )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	local lastAction = endGameHost
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( lastAction, endPrivateClient, closeSpinnerError, closeSpinnerError )
			lastAction = endPrivateClient
		end
		Lobby.Process.AddActions( lastAction, startPrivateHost, closeSpinnerError, closeSpinnerError )
		Lobby.Process.AddActions( startPrivateHost, addPrimary, closeSpinnerError, closeSpinnerError )
		Lobby.Process.AddActions( addPrimary, startPrivateClient, closeSpinnerError, closeSpinnerError )
		lastAction = startPrivateClient
	end
	Lobby.Process.AddActions( lastAction, getSessionInfo, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( getSessionInfo, gamertagsToXuids, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( gamertagsToXuids, infoProbe, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( infoProbe, join, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( join, sessionjoin, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( join, sessionSearch, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( sessionSearch, sessionjoin, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( sessionjoin, closeSpinner, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( closeSpinnerError, joinFailed, joinFailed, joinFailed )
	return process
end

Lobby.Process.ReloadPrivateLobby = function ( controller, networkMode )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, networkMode )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 8 )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, endGameClient )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	Lobby.Process.AddActions( endGameHost, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, setNetworkMode )
	Lobby.Process.AddActions( setNetworkMode, startPrivateHost )
	Lobby.Process.AddActions( startPrivateHost, addPrimary )
	Lobby.Process.AddActions( addPrimary, startPrivateClient )
	Lobby.Process.AddActions( startPrivateClient, closeSpinner )
	return process
end

Lobby.Process.Recover = function ( controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData:UITargetFromId( currentMenuIdx )
	if currTarget.id == LobbyData.UITargets.UI_MAIN.id then
		return nil
	end
	local backTarget = currTarget.errTarget.backTarget
	local target = currTarget.errTarget
	local lobbyInRecovery = Lobby.Actions.LobbyInRecovery()
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, target )
	local forceUIScreen = Lobby.Actions.ForceLobbyUIScreen( controller, target.id )
	local updateUI = Lobby.Actions.UpdateUI( controller, target )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local process = {
		head = lobbyInRecovery,
		interrupt = Lobby.Interrupt.NONE,
		tail = nil,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( lobbyInRecovery, endGameClient )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	Lobby.Process.AddActions( endGameHost, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, lobbySettings )
	local lastAction = lobbySettings
	if backTarget ~= nil then
		if backTarget.lobbyType == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID then
			
		elseif backTarget.lobbyType ~= target.lobbyType then
			local startHost = Lobby.Actions.LobbyHostStart( controller, backTarget.mainMode, backTarget.lobbyType, backTarget.lobbyMode, backTarget.maxClients )
			local addPrimary = Lobby.Actions.LobbyHostAddPrimary( backTarget.lobbyType )
			local startClient = Lobby.Actions.LobbyClientStart( backTarget.lobbyType )
			startHost.name = startHost.name .. "_1"
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
		startHost.name = startHost.name .. "_2"
		Lobby.Process.AddActions( lastAction, startHost )
		Lobby.Process.AddActions( startHost, addPrimary )
		Lobby.Process.AddActions( addPrimary, startClient )
		lastAction = startClient
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
		if target.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			Lobby.Process.AddActions( lastAction, runPlaylistSettings )
			Lobby.Process.AddActions( runPlaylistSettings, lobbyAdvertise )
			Lobby.Process.AddActions( lobbyAdvertise, maxClientsUpdateEvent )
			lastAction = maxClientsUpdateEvent
		end
		Lobby.Process.AddActions( lastAction, hostingEvent )
		lastAction = hostingEvent
	end
	Lobby.Process.AddActions( lastAction, forceUIScreen )
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
	local target = LobbyData:UITargetFromId( currentMenuIdx )
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
	local curScreen = LobbyData:UITargetFromId( menuId )
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
		Engine.LobbyHostAssignMapVoteToClient( client.xuid, REG5.mapVote )
		Engine.LobbyHostAssignTeamToClient( client.xuid, REG5.team )
	end
end

Lobby.Process.PromoteClientToGameLobbyHost = function ( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	local menuId = Engine.GetLobbyUIScreen()
	local curScreen = LobbyData:UITargetFromId( menuId )
	local status, statusValue = Engine.GetGameLobbyStatusInfo()
	local hostingLobby = function ()
		if not Engine.IsInGame() and curScreen.lobbyTimerType ~= LuaEnums.TIMER_TYPE.INVALID then
			Lobby.Timer.HostingLobby( {
				controller = controller,
				lobbyType = lobbyType,
				mainMode = mainMode,
				lobbyTimerType = curScreen.lobbyTimerType,
				status = status,
				statusValue = statusValue
			} )
		end
		Engine.QoSProbeListenerEnable( lobbyType, lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC )
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
		if isAdvertised == true then
			Lobby.Process.AddActions( hostingEvent, lobbyAdvertise )
			if isInGame == true then
				Lobby.Process.AddActions( lobbyAdvertise )
			else
				Lobby.Process.AddActions( lobbyAdvertise, lobbySettings )
				Lobby.Process.AddActions( lobbySettings )
			end
		else
			Lobby.Process.AddActions( hostingEvent )
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

Lobby.Process.LocalClientLeave = function ( controller )
	local leavePrivateClient = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_PRIVATE, controller )
	local leavelocalGameClient = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_GAME, controller )
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
	local isGameActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local process = nil
	if lobbyModule ~= Enum.LobbyModule.LOBBY_MODULE_CLIENT or isGameActive == false then
		return 
	end
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local process = {
		head = endGameClient,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if isGameHost == true then
		Lobby.Process.AddActions( endGameClient, endGameHost )
	end
	return process
end

Lobby.Process.ManagePartyLeave = function ( controller )
	local curTarget = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if curTarget == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isPrivateActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
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
	local target = LobbyData:UITargetFromId( currentMenuIdx )
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
	local fromTarget = LobbyData:UITargetFromId( fromMenuIdx )
	local toTarget = LobbyData.UITargets.UI_MAIN
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
	local fromTarget = LobbyData:UITargetFromId( fromMenuIdx )
	local toTarget = LobbyData.UITargets.UI_MAIN
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
	local targetPrivate = LobbyData.UITargets.UI_MODESELECT
	local mainModePrivate = targetPrivate.mainMode
	local lobbyTypePrivate = targetPrivate.lobbyType
	local lobbyModePrivate = targetPrivate.lobbyMode
	local maxClientsPrivate = targetPrivate.maxClients
	local lobbySettings = Lobby.Actions.LobbySettings( controller, targetPrivate )
	local updateUI = Lobby.Actions.UpdateUI( controller, targetPrivate )
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local startHostPrivate = Lobby.Actions.LobbyHostStart( controller, mainModePrivate, lobbyTypePrivate, lobbyModePrivate, maxClientsPrivate )
	local addPrimaryPrivate = Lobby.Actions.LobbyHostAddPrimary( lobbyTypePrivate )
	local startClientPrivate = Lobby.Actions.LobbyClientStart( lobbyTypePrivate )
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
	return process
end

Lobby.Process.Devmap = function ( controller, mainMode )
	local targetPrivate = LobbyData.UITargets.UI_MODESELECT
	local targetGame = LobbyData.UITargets.UI_MAIN
	if mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		targetGame = LobbyData.UITargets.UI_CPLOBBYLANGAME
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		targetGame = LobbyData.UITargets.UI_ZMLOBBYLANGAME
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		targetGame = LobbyData.UITargets.UI_MPLOBBYLANGAME
	end
	if targetGame == LobbyData.UITargets.UI_CPLOBBYLANGAME and Dvar.ui_gametype:get() == "cpzm" then
		targetGame = LobbyData.UITargets.UI_CP2LOBBYLANGAME
	end
	local mainModePrivate = targetPrivate.mainMode
	local lobbyTypePrivate = targetPrivate.lobbyType
	local lobbyModePrivate = targetPrivate.lobbyMode
	local maxClientsPrivate = targetPrivate.maxClients
	local mainModeGame = targetGame.mainMode
	local lobbyTypeGame = targetGame.lobbyType
	local lobbyModeGame = targetGame.lobbyMode
	local maxClientsGame = targetGame.maxClients
	local lobbySettings = Lobby.Actions.LobbySettings( controller, targetGame )
	local updateUI = Lobby.Actions.UpdateUI( controller, targetGame )
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local startHostPrivate = Lobby.Actions.LobbyHostStart( controller, mainModePrivate, lobbyTypePrivate, lobbyModePrivate, maxClientsPrivate )
	local addPrimaryPrivate = Lobby.Actions.LobbyHostAddPrimary( lobbyTypePrivate )
	local startClientPrivate = Lobby.Actions.LobbyClientStart( lobbyTypePrivate )
	local startHostGame = Lobby.Actions.LobbyHostStart( controller, mainModeGame, lobbyTypeGame, lobbyModeGame, maxClientsGame )
	local addPrimaryGame = Lobby.Actions.LobbyHostAddPrimary( lobbyTypeGame )
	local startGameClientGame = Lobby.Actions.LobbyClientStart( lobbyTypeGame )
	local setGameTypeAndMapName = Lobby.Actions.SetGameAndTypeMapName( controller, lobbyType, Dvar.ui_gametype:get(), Dvar.ui_mapname:get() )
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
	local fromTarget = LobbyData:UITargetFromId( fromMenuIdx )
	local toTarget = LobbyData.UITargets.UI_MAIN
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local settings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local signLocalUserIn = Lobby.Actions.SignUserInToLive( controller )
	local errorPopup = Lobby.Actions.ErrorPopupMsg( XBOXLIVE_SIGNEDOUT )
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
	local fromTarget = LobbyData:UITargetFromId( fromMenuIdx )
	local toTarget = LobbyData.UITargets.UI_MAIN
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local settings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local signLocalUserOut = Lobby.Actions.SignUserOutOfLive( controller )
	local errorPopup = Lobby.Actions.ErrorPopupMsg( XBOXLIVE_SIGNEDOUT )
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

