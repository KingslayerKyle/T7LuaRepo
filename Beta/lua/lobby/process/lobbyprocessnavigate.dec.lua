require( "lua.Lobby.Process.Nav.LobbyProcessNavCommon" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavCP" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavMP" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavZM" )

Lobby.ProcessNavigate = {}
Lobby.ProcessNavigate.PrivateLobbyInterrupt = function ( interruptType, params, extraParam )
	local controller = params.controller
	local toTarget = params.errorTarget
	local openSpinner = Lobby.Actions.OpenSpinner()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( openSpinner, lobbySettings )
	Lobby.Process.ForceAction( lobbySettings, updateUI )
	Lobby.Process.ForceAction( updateUI, endPrivateClient )
	Lobby.Process.ForceAction( endPrivateClient, endPrivateHost )
	Lobby.Process.ForceAction( endPrivateHost, closeSpinner )
	if interruptType == Lobby.Interrupt.BACK then
		
	elseif interruptType == Lobby.Interrupt.FAILED_ACTION and extraParam.action ~= nil then
		local errorPopup = Lobby.Actions.ErrorPopup( extraParam.action )
		Lobby.Process.ForceAction( closeSpinner, errorPopup )
	elseif interruptType == Lobby.Interrupt.ERROR_MSG and extraParam.errorMsg ~= nil then
		local errorMsg = extraParam.errorMsg
		if Engine.IsDevelopmentBuild() and extraParam.action ~= nil then
			errorMsg = errorMsg .. "\n\n(debug info, failed action: " .. extraParam.action.name .. ")"
		end
		local errorMsgPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
		Lobby.Process.ForceAction( closeSpinner, errorMsgPopup )
	end
	return process
end

Lobby.ProcessNavigate.CreatePrivateLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptBack = Lobby.Interrupt.Back( Lobby.ProcessNavigate.PrivateLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.PrivateLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.PrivateLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local startHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( startHost.lobbyType )
	local startClient = Lobby.Actions.LobbyClientStart( startHost.lobbyType )
	local sessionCreate = Lobby.Actions.PlatformSessionCreate( controller, startHost.lobbyType, toTarget.maxClients )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local process = {
		head = openSpinner,
		interrupt = interruptBack,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, startHost, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startHost, addPrimary, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( addPrimary, startClient, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startClient, sessionCreate, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( sessionCreate, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.LeavePrivateLobby = function ( controller, fromTarget, toTarget )
	Engine.LobbyLaunchClear()
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local sessionLeave = Lobby.Actions.PlatformSessionLeave( controller, fromTarget.lobbyType, Lobby.PlatformSession.GetSessionId() )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, sessionLeave )
	Lobby.Process.AddActions( sessionLeave, lobbySettings )
	Lobby.Process.AddActions( lobbySettings, updateUI )
	Lobby.Process.AddActions( updateUI, closeSpinner )
	Lobby.Process.AddActions( closeSpinner, nil )
	return process
end

Lobby.ProcessNavigate.GameLobbyInterrupt = function ( interruptType, params, extraParam )
	local controller = params.controller
	local toTarget = params.errorTarget
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local stopProbes = function ()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner()
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local stopLobbyTimer = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = controller,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = toTarget.mainMode
	}, true, false, false )
	local stopProbes = Lobby.Actions.ExecuteScript( stopProbes )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local switchMode = Lobby.Actions.SwitchMode( controller, Lobby.Core.GetMainModeStr( toTarget.mainMode ) )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( openSpinner, endMove )
	Lobby.Process.ForceAction( endMove, stopLobbyTimer )
	Lobby.Process.ForceAction( stopLobbyTimer, stopProbes )
	Lobby.Process.ForceAction( stopProbes, lobbySettings )
	Lobby.Process.ForceAction( lobbySettings, updateUI )
	Lobby.Process.ForceAction( updateUI, switchMode )
	Lobby.Process.ForceAction( switchMode, endPrivateClient )
	Lobby.Process.ForceAction( endPrivateClient, endPrivateHost )
	Lobby.Process.ForceAction( endPrivateHost, endGameClient )
	Lobby.Process.ForceAction( endGameClient, endGameHost )
	Lobby.Process.ForceAction( endGameHost, startPrivateHost )
	Lobby.Process.ForceAction( startPrivateHost, addPrimary )
	Lobby.Process.ForceAction( addPrimary, startPrivateClient )
	Lobby.Process.ForceAction( startPrivateClient, closeSpinner )
	if interruptType == Lobby.Interrupt.BACK then
		
	elseif interruptType == Lobby.Interrupt.FAILED_ACTION and extraParam.action ~= nil then
		local errorPopup = Lobby.Actions.ErrorPopup( extraParam.action )
		Lobby.Process.ForceAction( closeSpinner, errorPopup )
	elseif interruptType == Lobby.Interrupt.ERROR_MSG and extraParam.errorMsg ~= nil then
		local errorMsg = extraParam.errorMsg
		if extraParam.action ~= nil and Engine.IsDevelopmentBuild() then
			if extraParam.action.errorFuncPtr then
				errorMsg = errorMsg .. "\n\ndebug: " .. extraParam.action:errorFuncPtr()
			else
				errorMsg = errorMsg .. "\n\n(debug info, failed action: " .. extraParam.action.name .. ")"
			end
		end
		local errorMsgPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
		Lobby.Process.ForceAction( closeSpinner, errorMsgPopup )
	end
	return process
end

Lobby.ProcessNavigate.SwitchLobbiesGetDefaultGametype = function ( controller, toTarget )
	local gametype = "coop"
	if toTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if LuaUtils.IsCPZMTarget( toTarget.id ) then
			gametype = "cpzm"
		end
	elseif toTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		gametype = "tdm"
	elseif toTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		gametype = "zclassic"
	end
	return gametype
end

Lobby.ProcessNavigate.SwitchLobbiesIsGametypeValid = function ( gametype )
	if gametype == "" then
		return false
	elseif not Engine.IsGameTypeValid( gametype ) then
		return false
	else
		return true
	end
end

Lobby.ProcessNavigate.SwitchLobbiesGetGametype = function ( controller, toTarget )
	local gametype = Engine.ProfileValueAsString( controller, "gametype" )
	if not Lobby.ProcessNavigate.SwitchLobbiesIsGametypeValid( gametype ) then
		gametype = Lobby.ProcessNavigate.SwitchLobbiesGetDefaultGametype( controller, toTarget )
	end
	return gametype
end

Lobby.ProcessNavigate.GetDefaultMap = function ( controller, mainMode )
	local map = "cp_mi_eth_prologue"
	if mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if Dvar.ui_execdemo_cp:get() == true then
			map = "cp_mi_cairo_ramses2"
		else
			map = "cp_mi_eth_prologue"
		end
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		map = "mp_sector"
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		map = "zm_factory"
	end
	return map
end

Lobby.ProcessNavigate.SwitchLobbiesIsMapValid = function ( map )
	if map == "" then
		return false
	elseif not Engine.IsMapValid( map ) then
		return false
	else
		return true
	end
end

Lobby.ProcessNavigate.SwitchLobbiesGetMap = function ( controller, mainMode )
	local map = Engine.ProfileValueAsString( controller, "map" )
	if not Lobby.ProcessNavigate.SwitchLobbiesIsMapValid( map ) then
		map = Lobby.ProcessNavigate.GetDefaultMap( controller, mainMode )
	end
	return map
end

Lobby.ProcessNavigate.CreateGameLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptBack = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local lobbySetup = function ()
		if toTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
			return 
		else
			Engine.SetGametype( Lobby.ProcessNavigate.SwitchLobbiesGetGametype( controller, toTarget ) )
			Engine.GameLobbySetMap( Lobby.ProcessNavigate.SwitchLobbiesGetMap( controller, toTarget.mainMode ) )
		end
	end
	
	local startMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
	end
	
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local waitForJoiningClients = Lobby.Actions.WaitForJoiningClients( 5000 )
	local startMove = Lobby.Actions.ExecuteScript( startMoveProcess )
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local switchMode = Lobby.Actions.SwitchMode( controller, Lobby.Core.GetMainModeStr( toTarget.mainMode ) )
	local switchCampaignMode = Lobby.Actions.SwitchCampaignMode( controller, Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
	if LuaUtils.IsCPZMTarget( toTarget.id ) then
		switchCampaignMode = Lobby.Actions.SwitchCampaignMode( controller, Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES )
	end
	local lobbyInit = Lobby.Actions.ExecuteScript( lobbySetup )
	local gameCreateHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, Enum.LobbyType.LOBBY_TYPE_GAME, toTarget.lobbyMode, toTarget.maxClients )
	local hostingEvent = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
		controller = controller,
		lobbyType = gameCreateHost.lobbyType,
		mainMode = toTarget.mainMode,
		lobbyTimerType = toTarget.lobbyTimerType
	} )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = Engine.GetXUID64( controller )
	} )
	local join = Lobby.Actions.LobbyJoinXUID( controller, {
		xuid = Engine.GetXUID64( controller )
	}, Enum.JoinType.JOIN_TYPE_PARTY )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, waitForJoiningClients, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( waitForJoiningClients, startMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startMove, switchMode, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( switchMode, switchCampaignMode, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( switchCampaignMode, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, lobbyInit, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyInit, gameCreateHost, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( gameCreateHost, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, infoProbe, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( infoProbe, join, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( join, hostingEvent, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( hostingEvent, endMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( endMove, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.CreatePublicGameLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptBack = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local maxClientsUpdate = function ()
		local maxClients = Dvar.party_maxplayers:get()
		Engine.SetLobbyMaxClients( toTarget.lobbyType, maxClients )
	end
	
	local hostingLobby = function ()
		Lobby.Timer.HostingLobby( {
			controller = controller,
			lobbyType = toTarget.lobbyType,
			mainMode = toTarget.mainMode,
			lobbyTimerType = toTarget.lobbyTimerType
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local startMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
	end
	
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local resetSearchProcess = function ()
		Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.PUBLIC )
	end
	
	resetSearchProcess()
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local waitForJoiningClients = Lobby.Actions.WaitForJoiningClients( 5000 )
	local startMove = Lobby.Actions.ExecuteScript( startMoveProcess )
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local makeCancellable = Lobby.Actions.SetQueueCancellable( true )
	local createGameHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = Engine.GetXUID64( controller )
	} )
	local join = Lobby.Actions.LobbyJoinXUID( controller, {
		xuid = Engine.GetXUID64( controller )
	}, Enum.JoinType.JOIN_TYPE_PARTY )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
	local skipSearchButton = Lobby.Actions.IsButtonPressed( controller, "BUTTON_X" )
	local skipSearchDvar = Lobby.Actions.IsDvarSet( "lobbySearchSkip", true )
	local skipAdvertiseDvar = Lobby.Actions.IsDvarSet( "lobbyAdvertiseSkip", true )
	local lobbyQoSSearchStage1 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage2 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage3 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage4 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage5 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage6 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSJoinStage1 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage1 )
	local lobbyQoSJoinStage2 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage2 )
	local lobbyQoSJoinStage3 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage3 )
	local lobbyQoSJoinStage4 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage4 )
	local lobbyQoSJoinStage5 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage5 )
	local lobbyQoSJoinStage6 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage6 )
	local searchDelay2 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local searchDelay3 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local searchDelay4 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local searchDelay5 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local searchDelay6 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	lobbyQoSSearchStage1.name = lobbyQoSSearchStage1.name .. "_dedi1"
	lobbyQoSSearchStage2.name = lobbyQoSSearchStage2.name .. "_dedi2"
	lobbyQoSSearchStage3.name = lobbyQoSSearchStage3.name .. "_dedi3"
	lobbyQoSSearchStage4.name = lobbyQoSSearchStage4.name .. "_dediunpark4"
	lobbyQoSSearchStage5.name = lobbyQoSSearchStage5.name .. "_listen5"
	lobbyQoSSearchStage6.name = lobbyQoSSearchStage6.name .. "_listen6"
	lobbyQoSJoinStage1.name = lobbyQoSJoinStage1.name .. "_1"
	lobbyQoSJoinStage2.name = lobbyQoSJoinStage2.name .. "_2"
	lobbyQoSJoinStage3.name = lobbyQoSJoinStage3.name .. "_3"
	lobbyQoSJoinStage4.name = lobbyQoSJoinStage4.name .. "_4"
	lobbyQoSJoinStage5.name = lobbyQoSJoinStage5.name .. "_5"
	lobbyQoSJoinStage6.name = lobbyQoSJoinStage6.name .. "_6"
	local canHostServer = Lobby.Actions.CanHostServer( controller, toTarget.lobbyType )
	local redoSearchDelay = Lobby.Actions.TimeDelay( 1500 )
	local resetSearch = Lobby.Actions.ExecuteScript( resetSearchProcess )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local maxClientsUpdateEvent = Lobby.Actions.ExecuteScript( maxClientsUpdate )
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local process = {
		head = openSpinner,
		interrupt = interruptBack,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, waitForJoiningClients, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( waitForJoiningClients, startMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startMove, createGameHost, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( createGameHost, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, runPlaylistSettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( runPlaylistSettings, maxClientsUpdateEvent, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( maxClientsUpdateEvent, infoProbe, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( infoProbe, join, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( join, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, endMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( endMove, makeCancellable, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( makeCancellable, skipSearchButton, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( skipSearchButton, skipAdvertiseDvar, skipSearchDvar, skipSearchDvar )
	Lobby.Process.AddActions( skipSearchDvar, skipAdvertiseDvar, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, searchDelay2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, nil, searchDelay2, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay2, lobbyQoSSearchStage2 )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, searchDelay3, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, nil, searchDelay3, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay3, lobbyQoSSearchStage3 )
	Lobby.Process.AddActions( lobbyQoSSearchStage3, lobbyQoSJoinStage3, searchDelay4, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage3, nil, searchDelay4, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay4, lobbyQoSSearchStage4 )
	Lobby.Process.AddActions( lobbyQoSSearchStage4, lobbyQoSJoinStage4, searchDelay5, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage4, nil, searchDelay5, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay5, lobbyQoSSearchStage5 )
	Lobby.Process.AddActions( lobbyQoSSearchStage5, lobbyQoSJoinStage5, searchDelay6, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage5, nil, searchDelay6, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay6, lobbyQoSSearchStage6 )
	Lobby.Process.AddActions( lobbyQoSSearchStage6, lobbyQoSJoinStage6, canHostServer, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage6, nil, canHostServer, interruptErrorMsg )
	Lobby.Process.AddActions( canHostServer, skipAdvertiseDvar, redoSearchDelay, interruptErrorMsg )
	Lobby.Process.AddActions( redoSearchDelay, resetSearch, resetSearch, resetSearch )
	Lobby.Process.AddActions( resetSearch, lobbyQoSSearchStage1, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( skipAdvertiseDvar, hostingEvent, lobbyAdvertise, lobbyAdvertise )
	Lobby.Process.AddActions( lobbyAdvertise, hostingEvent, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( hostingEvent, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.ChangeToPublicGameLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptBack = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	Lobby.Debug.SessionSQJClear()
	local hostingLobby = function ()
		Lobby.Timer.HostingLobby( {
			controller = controller,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = toTarget.mainMode,
			lobbyTimerType = toTarget.lobbyTimerType
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local startMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
		Engine.SetLobbyMode( toTarget.lobbyType, toTarget.lobbyMode )
	end
	
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.PUBLIC )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local waitForJoiningClients = Lobby.Actions.WaitForJoiningClients( 5000 )
	local startMove = Lobby.Actions.ExecuteScript( startMoveProcess )
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
	local skipSearch = Lobby.Actions.IsButtonPressed( controller, "BUTTON_X" )
	local lobbyQoSSearchStage1 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage2 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage3 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSJoinStage1 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage1 )
	local lobbyQoSJoinStage2 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage2 )
	local lobbyQoSJoinStage3 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage3 )
	local searchDelay2 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local searchDelay3 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local process = {
		head = openSpinner,
		interrupt = interruptBack,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, waitForJoiningClients, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( waitForJoiningClients, startMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startMove, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, runPlaylistSettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( runPlaylistSettings, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, skipSearch, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( skipSearch, lobbyAdvertise, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, searchDelay2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, endMove, searchDelay2, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay2, lobbyQoSSearchStage2 )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, searchDelay3, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, endMove, searchDelay3, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay3, lobbyQoSSearchStage3 )
	Lobby.Process.AddActions( lobbyQoSSearchStage3, lobbyQoSJoinStage3, lobbyAdvertise, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage3, endMove, lobbyAdvertise, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyAdvertise, hostingEvent, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( hostingEvent, endMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( endMove, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.ChangeToCustomGameLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptBack = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local hostingLobby = function ()
		Lobby.Timer.HostingLobby( {
			controller = controller,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = toTarget.mainMode,
			lobbyTimerType = toTarget.lobbyTimerType
		} )
	end
	
	local startMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
		Engine.SetLobbyMode( toTarget.lobbyType, toTarget.lobbyMode )
	end
	
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.PUBLIC )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local waitForJoiningClients = Lobby.Actions.WaitForJoiningClients( 5000 )
	local startMove = Lobby.Actions.ExecuteScript( startMoveProcess )
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local process = {
		head = openSpinner,
		interrupt = interruptBack,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, waitForJoiningClients, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( waitForJoiningClients, startMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startMove, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, hostingEvent, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( hostingEvent, endMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( endMove, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.ChangeToCPPublicGameLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptBack = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	Lobby.Debug.SessionSQJClear()
	local hostingLobby = function ()
		Lobby.Timer.HostingLobby( {
			controller = controller,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = toTarget.mainMode,
			lobbyTimerType = toTarget.lobbyTimerType
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local startMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
		Engine.SetLobbyMode( toTarget.lobbyType, toTarget.lobbyMode )
	end
	
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.PUBLIC )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local waitForJoiningClients = Lobby.Actions.WaitForJoiningClients( 5000 )
	local startMove = Lobby.Actions.ExecuteScript( startMoveProcess )
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
	local skipSearch = Lobby.Actions.IsButtonPressed( controller, "BUTTON_X" )
	local lobbyQoSSearchStage1 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage2 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage3 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSJoinStage1 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage1 )
	local lobbyQoSJoinStage2 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage2 )
	local lobbyQoSJoinStage3 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage3 )
	local searchDelay2 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local searchDelay3 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local process = {
		head = openSpinner,
		interrupt = interruptBack,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, waitForJoiningClients, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( waitForJoiningClients, startMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startMove, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, runPlaylistSettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( runPlaylistSettings, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, skipSearch, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( skipSearch, lobbyAdvertise, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, searchDelay2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, endMove, searchDelay2, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay2, lobbyQoSSearchStage2 )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, searchDelay3, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, endMove, searchDelay3, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay3, lobbyQoSSearchStage3 )
	Lobby.Process.AddActions( lobbyQoSSearchStage3, lobbyQoSJoinStage3, lobbyAdvertise, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage3, endMove, lobbyAdvertise, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyAdvertise, hostingEvent, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( hostingEvent, endMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( endMove, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.ChangeToPrivateGameLobby = function ( controller, fromTarget, toTarget, withParty )
	local params = {
		controller = controller,
		errorTarget = toTarget
	}
	local interruptBack = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local cleanLobby = function ()
		Engine.SetLobbyMode( toTarget.lobbyType, toTarget.lobbyMode )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local hostingLobby = function ()
		Lobby.Timer.HostingLobby( {
			controller = controller,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = toTarget.mainMode,
			lobbyTimerType = toTarget.lobbyTimerType
		} )
	end
	
	local stopLobbyTimer = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = controller,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = toTarget.mainMode
	}, true, false, false )
	local lobbyAdvertiseOff = Lobby.Actions.AdvertiseLobby( false )
	local stopPublic = Lobby.Actions.ExecuteScript( cleanLobby )
	local startTimer = Lobby.Actions.ExecuteScript( hostingLobby )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local leaveWithParty = Lobby.Actions.LeaveWithParty( 3000 )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local switchMode = Lobby.Actions.SwitchMode( controller, switchToMode )
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local privateLobbyCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local process = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local lastAction = nil
	if isGameHost == true then
		process.head = stopLobbyTimer
		Lobby.Process.AddActions( stopLobbyTimer, openSpinner, Lobby.Process.DO_NOTHING_IF_FAILURE, interruptErrorMsg )
		lastAction = openSpinner
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
		Lobby.Process.AddActions( lastAction, lobbyAdvertiseOff, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( lobbyAdvertiseOff, stopPublic, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( stopPublic, startTimer, interruptErrorMsg, interruptErrorMsg )
		lastAction = startTimer
	else
		process.head = openSpinner
		lastAction = openSpinner
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
	end
	Lobby.Process.AddActions( lastAction, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.LeaveGameLobby = function ( controller, fromTarget, toTarget, withParty, switchToMode )
	local params = {
		controller = controller,
		errorTarget = toTarget
	}
	local interruptBack = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local stopProbes = function ()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local stopLobbyTimer = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = controller,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = toTarget.mainMode
	}, true, false, false )
	local stopProbes = Lobby.Actions.ExecuteScript( stopProbes )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local leaveWithParty = Lobby.Actions.LeaveWithParty( 3000 )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local switchMode = Lobby.Actions.SwitchMode( controller, switchToMode )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local privateLobbyCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local process = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local lastAction = nil
	if isGameHost == true then
		process.head = stopLobbyTimer
		Lobby.Process.AddActions( stopLobbyTimer, openSpinner, Lobby.Process.DO_NOTHING_IF_FAILURE, interruptErrorMsg )
		lastAction = openSpinner
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
		Lobby.Process.AddActions( lastAction, stopProbes, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( stopProbes, endGameClient, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( endGameClient, endGameHost, interruptErrorMsg, interruptErrorMsg )
		lastAction = endGameHost
	else
		process.head = openSpinner
		lastAction = openSpinner
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
		Lobby.Process.AddActions( lastAction, endGameClient, interruptErrorMsg, interruptErrorMsg )
		lastAction = endGameClient
	end
	if isPrivateHost == true then
		if privateLobbyCount > 1 and withParty == LuaEnums.LEAVE_WITH_PARTY.WITHOUT then
			Lobby.Process.AddActions( lastAction, endPrivateClient, interruptErrorMsg, interruptErrorMsg )
			Lobby.Process.AddActions( endPrivateClient, endPrivateHost, interruptErrorMsg, interruptErrorMsg )
			Lobby.Process.AddActions( endPrivateHost, startPrivateHost, interruptErrorMsg, interruptErrorMsg )
			Lobby.Process.AddActions( startPrivateHost, addPrimary, interruptErrorMsg, interruptErrorMsg )
			Lobby.Process.AddActions( addPrimary, startPrivateClient, interruptErrorMsg, interruptErrorMsg )
			lastAction = startPrivateClient
		end
	else
		Lobby.Process.AddActions( lastAction, endPrivateClient, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( endPrivateClient, startPrivateHost, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( startPrivateHost, addPrimary, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( addPrimary, startPrivateClient, interruptErrorMsg, interruptErrorMsg )
		lastAction = startPrivateClient
	end
	Lobby.Process.AddActions( lastAction, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	return process
end

