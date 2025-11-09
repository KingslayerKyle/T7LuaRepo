require( "lua.Lobby.Process.LobbyActions" )
require( "lua.Lobby.LobbyMatchmaking" )

Lobby.Process = {}
Lobby.Process.DO_NOTHING_IF_FAILURE = nil
Lobby.Process.DO_NOTHING_IF_ERROR = nil
local AddActions = function ( process, success, failure, error )
	process.success = success
	process.failure = failure
	process.error = error
end

Lobby.Process.AddActions = function ( process, success, failure, error )
	AddActions( process, success, failure, error )
end

Lobby.Process.ForceAction = function ( process, action )
	AddActions( process, action, action, action )
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
		interrupt = Lobby.Interrupt.NONE
	}
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	if toMainMode == nil then
		process.head = navigate
		return process
	else
		local openSpinner = Lobby.Actions.OpenSpinner()
		local closeSpinner = Lobby.Actions.CloseSpinner()
		local switchMode = Lobby.Actions.SwitchMode( controller, toMainMode )
		process.head = openSpinner
		AddActions( openSpinner, switchMode )
		AddActions( switchMode, lobbySettings )
		AddActions( lobbySettings, closeSpinner )
		return process
	end
end

Lobby.Process.CreateDedicatedLANLobby = function ( controller, toTarget )
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local createGame = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local hostingEvent = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
		controller = controller,
		lobbyType = toTarget.lobbyType,
		mainMode = toTarget.mainMode,
		lobbyTimerType = toTarget.lobbyTimerType
	} )
	local process = {
		head = setNetworkMode,
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( setNetworkMode, lobbySettings )
	AddActions( lobbySettings, createGame )
	AddActions( createGame, hostingEvent )
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
	local createGameHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local process = {
		head = setNetworkMode,
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( setNetworkMode, lobbySettings )
	AddActions( lobbySettings, createGameHost )
	AddActions( createGameHost, lobbyAdvertise )
	AddActions( lobbyAdvertise, hostingEvent )
	AddActions( hostingEvent, nil )
	return process
end

Lobby.Process.MergePublicGameLobby = function ( controller )
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SEARCH_MODE_LOBBY_MERGE )
	local startMergeProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_MERGE )
	end
	
	local endMergeProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Merge.Complete()
	end
	
	local startMerge = Lobby.Actions.ExecuteScript( startMergeProcess )
	local lobbySearch = Lobby.Actions.SearchForLobby( controller )
	local lobbyJoin = Lobby.Actions.QoSJoinSearchResults( controller, lobbySearch )
	local endMerge = Lobby.Actions.ExecuteScript( endMergeProcess )
	local process = {
		head = startMerge,
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( startMerge, lobbySearch )
	AddActions( lobbySearch, lobbyJoin, endMerge, endMerge )
	AddActions( lobbyJoin, endMerge, endMerge, endMerge )
	return process
end

Lobby.Process.JoinSystemlink = function ( controller, mainMode, networkMode, hostXuid, hostInfo )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local join = Lobby.Actions.JoinHost( controller, mainMode, networkMode, hostXuid, hostInfo )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( openSpinner, join )
	AddActions( join, closeSpinner, closeSpinner, closeSpinner )
	return process
end

Lobby.Process.Join = function ( controller, xuid, joinType, shouldBringParty )
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
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = xuid
	} )
	local join = Lobby.Actions.LobbyJoinXUID( controller, {
		xuid = xuid
	}, joinType )
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	local sessionSearch = Lobby.Actions.PlatformSessionSearch( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local sessionjoin = Lobby.Actions.PlatformSessionJoin( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( openSpinner, cleanup )
	AddActions( cleanup, endGameClient )
	AddActions( endGameClient, endGameHost )
	local lastAction = endGameHost
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			AddActions( lastAction, endPrivateClient, closeSpinnerError, closeSpinnerError )
			lastAction = endPrivateClient
		end
		AddActions( lastAction, startPrivateHost, closeSpinnerError, closeSpinnerError )
		AddActions( startPrivateHost, addPrimary, closeSpinnerError, closeSpinnerError )
		AddActions( addPrimary, startPrivateClient, closeSpinnerError, closeSpinnerError )
		lastAction = startPrivateClient
	end
	AddActions( lastAction, infoProbe, closeSpinnerError, closeSpinnerError )
	AddActions( infoProbe, join, closeSpinnerError, closeSpinnerError )
	AddActions( join, sessionSearch, closeSpinnerError, closeSpinnerError )
	AddActions( sessionSearch, sessionjoin, closeSpinnerError, closeSpinnerError )
	AddActions( sessionjoin, closeSpinner, closeSpinnerError, closeSpinnerError )
	AddActions( closeSpinnerError, joinFailed, joinFailed, joinFailed )
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
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( openSpinner, cleanup )
	AddActions( cleanup, endGameClient )
	AddActions( endGameClient, endGameHost )
	local lastAction = endGameHost
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			AddActions( lastAction, endPrivateClient, closeSpinnerError, closeSpinnerError )
			lastAction = endPrivateClient
		end
		AddActions( lastAction, startPrivateHost, closeSpinnerError, closeSpinnerError )
		AddActions( startPrivateHost, addPrimary, closeSpinnerError, closeSpinnerError )
		AddActions( addPrimary, startPrivateClient, closeSpinnerError, closeSpinnerError )
		lastAction = startPrivateClient
	end
	AddActions( lastAction, getInviteInfo, closeSpinnerError, closeSpinnerError )
	AddActions( getInviteInfo, gamertagsToXuids, closeSpinnerError, closeSpinnerError )
	AddActions( gamertagsToXuids, infoProbe, closeSpinnerError, closeSpinnerError )
	AddActions( infoProbe, join, closeSpinnerError, closeSpinnerError )
	AddActions( join, sessionSearch, closeSpinnerError, closeSpinnerError )
	AddActions( sessionSearch, sessionjoin, closeSpinnerError, closeSpinnerError )
	AddActions( sessionjoin, closeSpinner, closeSpinnerError, closeSpinnerError )
	AddActions( closeSpinnerError, joinFailed, joinFailed, joinFailed )
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
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( openSpinner, endGameClient )
	AddActions( endGameClient, endGameHost )
	AddActions( endGameHost, endPrivateClient )
	AddActions( endPrivateClient, endPrivateHost )
	AddActions( endPrivateHost, setNetworkMode )
	AddActions( setNetworkMode, startPrivateHost )
	AddActions( startPrivateHost, addPrimary )
	AddActions( addPrimary, startPrivateClient )
	AddActions( startPrivateClient, closeSpinner )
	return process
end

Lobby.Process.Recover = function ( controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData:UITargetFromId( currentMenuIdx )
	local backTarget = currTarget.errTarget.backTarget
	local target = currTarget.errTarget
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, target )
	local forceUIScreen = Lobby.Actions.ForceUIScreen( controller, target.id )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local process = {
		head = endGameClient,
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( endGameClient, endGameHost )
	AddActions( endGameHost, endPrivateClient )
	AddActions( endPrivateClient, endPrivateHost )
	AddActions( endPrivateHost, lobbySettings )
	local lastAction = lobbySettings
	if backTarget.lobbyType == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID then
		
	elseif backTarget.lobbyType ~= target.lobbyType then
		local startHost = Lobby.Actions.LobbyHostStart( controller, backTarget.mainMode, backTarget.lobbyType, backTarget.lobbyMode, backTarget.maxClients )
		local addPrimary = Lobby.Actions.LobbyHostAddPrimary( backTarget.lobbyType )
		local startClient = Lobby.Actions.LobbyClientStart( backTarget.lobbyType )
		AddActions( lastAction, startHost )
		AddActions( startHost, addPrimary )
		AddActions( addPrimary, startClient )
		lastAction = startClient
	end
	if target.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		local startHost = Lobby.Actions.LobbyHostStart( controller, target.mainMode, target.lobbyType, target.lobbyMode, target.maxClients )
		local addPrimary = Lobby.Actions.LobbyHostAddPrimary( target.lobbyType )
		local startClient = Lobby.Actions.LobbyClientStart( target.lobbyType )
		AddActions( lastAction, startHost )
		AddActions( startHost, addPrimary )
		AddActions( addPrimary, startClient )
		lastAction = startClient
	else
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
		AddActions( lastAction, startHost )
		AddActions( startHost, infoProbe )
		AddActions( infoProbe, join )
		AddActions( join, hostingEvent )
		lastAction = hostingEvent
	end
	AddActions( lastAction, forceUIScreen )
	AddActions( forceUIScreen, closeSpinner )
	AddActions( closeSpinner, nil )
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
	local forceUIScreen = Lobby.Actions.ForceUIScreen( controller, target.id )
	local process = {
		head = lobbySettings,
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( lobbySettings, endGameClient )
	AddActions( endGameClient, endGameHost )
	AddActions( endGameHost, endPrivateClient )
	AddActions( endPrivateClient, endPrivateHost )
	local lastAction = endPrivateHost
	if isTargetPrivate == true then
		local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, target.lobbyMode, maxClients )
		local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		AddActions( endGameHost, startPrivateHost )
		AddActions( startPrivateHost, addPrimary )
		AddActions( addPrimary, startPrivateClient )
		lastAction = startPrivateClient
	end
	AddActions( lastAction, forceUIScreen )
	if errorMsg ~= nil then
		local errorPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
		AddActions( forceUIScreen, errorPopup )
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
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( openSpinner, startHost )
	AddActions( startHost, addPrimary )
	AddActions( addPrimary, startClient )
	AddActions( startClient, closeSpinnerSuc )
	AddActions( closeSpinnerErr, errorPopup )
	return process
end

local PromoteClientToPrivateLobbyHost = function ( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	local menuId = Engine.GetLobbyUIScreen()
	local curScreen = LobbyData:UITargetFromId( menuId )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToPrivateLobbyHost: menuId(" .. menuId .. "), lobbyType(" .. lobbyType .. "), mainMode(" .. mainMode .. "), lobbyTimerType(" .. curScreen.lobbyTimerType .. ").\n" )
	local signalDone = Lobby.Actions.PromoteToHostDone( controller, lobbyType, newMigrateIndex, isInGame )
	local createHost = Lobby.Actions.LobbyHostStartMigratedInfo( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo )
	local process = {
		head = signalDone,
		interrupt = Lobby.Interrupt.NONE
	}
	if Engine.IsLobbyHost( lobbyType ) == false then
		process.head = createHost
		AddActions( createHost, signalDone )
		AddActions( signalDone, nil )
	end
	return process
end

local TransferDataFromClientModuleToHostModule = function ()
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	for index, client in ipairs( gamelobby.sessionClients ) do
		Engine.LobbyHostAssignMapVoteToClient( client.xuid, client.mapVote )
		Engine.LobbyHostAssignTeamToClient( client.xuid, client.team )
	end
end

local PromoteClientToGameLobbyHost = function ( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	local menuId = Engine.GetLobbyUIScreen()
	local curScreen = LobbyData:UITargetFromId( menuId )
	local status, statusValue = Engine.GetGameLobbyStatusInfo()
	local hostingLobby = function ()
		if curScreen.lobbyTimerType ~= LobbyData.TIMER_TYPE_INVALID then
			Lobby.Timer.HostingLobby( {
				controller = controller,
				lobbyType = lobbyType,
				mainMode = mainMode,
				lobbyTimerType = curScreen.lobbyTimerType,
				status = status,
				statusValue = statusValue
			} )
		end
		if lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			Engine.QoSProbeListenerEnable( lobbyType, true )
		end
		TransferDataFromClientModuleToHostModule()
	end
	
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToGameLobbyHost: menuId(" .. menuId .. "), lobbyType(" .. lobbyType .. "), mainMode(" .. mainMode .. "), lobbyTimerType(" .. curScreen.lobbyTimerType .. ").\n" )
	local signalDone = Lobby.Actions.PromoteToHostDone( controller, lobbyType, newMigrateIndex, isInGame )
	local createHost = Lobby.Actions.LobbyHostStartMigratedInfo( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo )
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
	local process = {
		head = signalDone,
		interrupt = Lobby.Interrupt.NONE
	}
	if Engine.IsLobbyHost( lobbyType ) == false then
		process.head = createHost
		AddActions( createHost, signalDone )
		AddActions( signalDone, hostingEvent )
		if isAdvertised == true then
			AddActions( hostingEvent, lobbyAdvertise )
			if isInGame == true then
				AddActions( lobbyAdvertise )
			else
				AddActions( lobbyAdvertise, runPlaylistSettings )
				AddActions( runPlaylistSettings )
			end
		else
			AddActions( hostingEvent )
		end
	end
	return process
end

Lobby.Process.PromoteClientToHost = function ( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	local process = nil
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		process = PromoteClientToPrivateLobbyHost( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	elseif lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		process = PromoteClientToGameLobbyHost( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo, isAdvertised, isInGame, newMigrateIndex )
	end
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
		interrupt = Lobby.Interrupt.NONE
	}
	if isGameHost == true then
		AddActions( endGameClient, endGameHost )
	end
	return process
end

Lobby.Process.NonFatalError = function ( errorMsg )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local target = LobbyData:UITargetFromId( currentMenuIdx )
	local errorPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
	local process = {
		head = errorPopup,
		interrupt = Lobby.Interrupt.NONE
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
	local errorPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( openSpinner, settings )
	AddActions( settings, settings )
	AddActions( settings, closeSpinner )
	AddActions( closeSpinner, errorPopup )
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
	local process = {
		head = endGameHost,
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( closeSpinnerA, endGameHost )
	AddActions( endGameHost, endGameClient )
	AddActions( endGameClient, endPrivateHost )
	AddActions( endPrivateHost, endPrivateClient )
	AddActions( endPrivateClient, settings )
	AddActions( settings, closeSpinnerB )
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
	local mainModePrivate = targetPrivate.mainMode
	local lobbyTypePrivate = targetPrivate.lobbyType
	local lobbyModePrivate = targetPrivate.lobbyMode
	local maxClientsPrivate = targetPrivate.maxClients
	local mainModeGame = targetGame.mainMode
	local lobbyTypeGame = targetGame.lobbyType
	local lobbyModeGame = targetGame.lobbyMode
	local maxClientsGame = targetGame.maxClients
	local lobbySettings = Lobby.Actions.LobbySettings( controller, targetGame )
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
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( lobbySettings, setNetworkMode )
	AddActions( setNetworkMode, startHostPrivate )
	AddActions( startHostPrivate, addPrimaryPrivate )
	AddActions( addPrimaryPrivate, startClientPrivate )
	AddActions( startClientPrivate, startHostGame )
	AddActions( startHostGame, setGameTypeAndMapName )
	AddActions( setGameTypeAndMapName, addPrimaryGame )
	AddActions( addPrimaryGame, startGameClientGame )
	return process
end

Lobby.Process.PrimaryControllerSignedIn = function ( controller )
	local fromMenuIdx = Engine.GetLobbyUIScreen()
	local fromTarget = LobbyData:UITargetFromId( fromMenuIdx )
	local toTarget = LobbyData.UITargets.UI_MAIN
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local settings = Lobby.Actions.LobbySettings( controller, toTarget )
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
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( openSpinner, settings )
	AddActions( settings, endGameClient )
	AddActions( endGameClient, endGameHost )
	AddActions( endGameHost, endPrivateClient )
	AddActions( endPrivateClient, endPrivateHost )
	AddActions( endPrivateHost, signLocalUserIn )
	AddActions( signLocalUserIn, closeSpinner )
	AddActions( closeSpinner, errorPopup )
	return process
end

Lobby.Process.PrimaryControllerSignedOut = function ( controller )
	local fromMenuIdx = Engine.GetLobbyUIScreen()
	local fromTarget = LobbyData:UITargetFromId( fromMenuIdx )
	local toTarget = LobbyData.UITargets.UI_MAIN
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local settings = Lobby.Actions.LobbySettings( controller, toTarget )
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
		interrupt = Lobby.Interrupt.NONE
	}
	AddActions( openSpinner, settings )
	AddActions( settings, endGameClient )
	AddActions( endGameClient, endGameHost )
	AddActions( endGameHost, endPrivateClient )
	AddActions( endPrivateClient, endPrivateHost )
	AddActions( endPrivateHost, signLocalUserOut )
	AddActions( signLocalUserOut, closeSpinner )
	AddActions( closeSpinner, errorPopup )
	return process
end

