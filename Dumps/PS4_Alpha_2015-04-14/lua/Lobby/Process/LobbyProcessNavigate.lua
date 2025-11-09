require( "lua.Lobby.Process.Nav.LobbyProcessNavCommon" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavCP" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavMP" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavZM" )

Lobby.ProcessNavigate = {}
local PrivateLobbyInterrupt = function ( interruptType, params, extraParam )
	local controller = params.controller
	local toTarget = params.errorTarget
	local openSpinner = Lobby.Actions.OpenSpinner()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE
	}
	Lobby.Process.ForceAction( openSpinner, lobbySettings )
	Lobby.Process.ForceAction( lobbySettings, endPrivateClient )
	Lobby.Process.ForceAction( endPrivateClient, endPrivateHost )
	Lobby.Process.ForceAction( endPrivateHost, closeSpinner )
	if interruptType == Lobby.Interrupt.BACK then
		
	elseif interruptType == Lobby.Interrupt.FAILED_ACTION and extraParam.action ~= nil then
		local errorPopup = Lobby.Actions.ErrorPopup( extraParam.action )
		Lobby.Process.ForceAction( closeSpinner, errorPopup )
	elseif interruptType == Lobby.Interrupt.ERROR_MSG and extraParam.errorMsg ~= nil then
		local errorMsg = extraParam.errorMsg
		if extraParam.action ~= nil then
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
	local interruptBack = Lobby.Interrupt.Back( PrivateLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( PrivateLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( PrivateLobbyInterrupt, params, "Failed to host lobby" )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local startHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( startHost.lobbyType )
	local startClient = Lobby.Actions.LobbyClientStart( startHost.lobbyType )
	local sessionCreate = Lobby.Actions.PlatformSessionCreate( controller, startHost.lobbyType, toTarget.maxClients )
	local process = {
		head = openSpinner,
		interrupt = interruptBack
	}
	Lobby.Process.AddActions( openSpinner, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, startHost, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startHost, addPrimary, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( addPrimary, startClient, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startClient, sessionCreate, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( sessionCreate, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.LeavePrivateLobby = function ( controller, fromTarget, toTarget )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local sessionLeave = Lobby.Actions.PlatformSessionLeave( controller, fromTarget.lobbyType, Lobby.PlatformSession.GetSessionId() )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE
	}
	Lobby.Process.AddActions( openSpinner, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, sessionLeave )
	Lobby.Process.AddActions( sessionLeave, lobbySettings )
	Lobby.Process.AddActions( lobbySettings, closeSpinner )
	Lobby.Process.AddActions( closeSpinner, nil )
	return process
end

local GameLobbyInterrupt = function ( interruptType, params, extraParam )
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
		interrupt = Lobby.Interrupt.NONE
	}
	Lobby.Process.ForceAction( openSpinner, endMove )
	Lobby.Process.ForceAction( endMove, stopLobbyTimer )
	Lobby.Process.ForceAction( stopLobbyTimer, stopProbes )
	Lobby.Process.ForceAction( stopProbes, lobbySettings )
	Lobby.Process.ForceAction( lobbySettings, switchMode )
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
		if extraParam.action ~= nil then
			errorMsg = errorMsg .. "\n\n(debug info, failed action: " .. extraParam.action.name .. ")"
		end
		local errorMsgPopup = Lobby.Actions.ErrorPopupMsg( errorMsg )
		Lobby.Process.ForceAction( closeSpinner, errorMsgPopup )
	end
	return process
end

local SwitchLobbiesGetDefaultGametype = function ( controller, mainMode )
	local gametype = "coop"
	if mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		gametype = "coop"
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		gametype = "tdm"
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		gametype = "zclassic"
	end
	return gametype
end

local SwitchLobbiesIsGametypeValid = function ( gametype )
	if gametype == "" then
		return false
	elseif not Engine.IsGameTypeValid( gametype ) then
		return false
	else
		return true
	end
end

function SwitchLobbiesGetGametype( controller, mainMode )
	local gametype = Engine.ProfileValueAsString( controller, "gametype" )
	if not SwitchLobbiesIsGametypeValid( gametype ) then
		gametype = SwitchLobbiesGetDefaultGametype( controller, mainMode )
	end
	return gametype
end

local GetDefaultMap = function ( controller, mainMode )
	local map = "cp_mi_sing_blackstation"
	if mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		map = "cp_mi_sing_blackstation"
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		map = "mp_spire"
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		map = "zm_factory"
	end
	return map
end

local SwitchLobbiesIsMapValid = function ( map )
	if map == "" then
		return false
	elseif not Engine.IsMapValid( map ) then
		return false
	else
		return true
	end
end

function SwitchLobbiesGetMap( controller, mainMode )
	local map = Engine.ProfileValueAsString( controller, "map" )
	if not SwitchLobbiesIsMapValid( map ) then
		map = GetDefaultMap( controller, mainMode )
	end
	return map
end

Lobby.ProcessNavigate.CreateGameLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptBack = Lobby.Interrupt.Back( GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( GameLobbyInterrupt, params, "Failed to host lobby" )
	local lobbySetup = function ()
		if toTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
			return 
		else
			Engine.SetGametype( SwitchLobbiesGetGametype( controller, toTarget.mainMode ) )
			Engine.GameLobbySetMap( SwitchLobbiesGetMap( controller, toTarget.mainMode ) )
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
	local switchMode = Lobby.Actions.SwitchMode( controller, Lobby.Core.GetMainModeStr( toTarget.mainMode ) )
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
		interrupt = Lobby.Interrupt.NONE
	}
	Lobby.Process.AddActions( openSpinner, waitForJoiningClients, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( waitForJoiningClients, startMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startMove, switchMode, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( switchMode, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, lobbyInit, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyInit, gameCreateHost, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( gameCreateHost, infoProbe, interruptErrorMsg, interruptErrorMsg )
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
	local interruptBack = Lobby.Interrupt.Back( GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( GameLobbyInterrupt, params, "Failed to join public lobby" )
	local maxClients = Dvar.party_maxplayers:get()
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
	end
	
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SEARCH_MODE_PUBLIC )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local waitForJoiningClients = Lobby.Actions.WaitForJoiningClients( 5000 )
	local startMove = Lobby.Actions.ExecuteScript( startMoveProcess )
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local createGameHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, maxClients )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = Engine.GetXUID64( controller )
	} )
	local join = Lobby.Actions.LobbyJoinXUID( controller, {
		xuid = Engine.GetXUID64( controller )
	}, Enum.JoinType.JOIN_TYPE_PARTY )
	local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
	local skipSearch = Lobby.Actions.IsButtonPressed( controller, "BUTTON_X" )
	local lobbyQoSSearchStage1 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage2 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage3 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSJoinStage1 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage1 )
	local lobbyQoSJoinStage2 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage2 )
	local lobbyQoSJoinStage3 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage3 )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local leaveGameSearch, leaveGameAdvertise = nil
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local process = {
		head = openSpinner,
		interrupt = interruptBack
	}
	Lobby.Process.AddActions( openSpinner, waitForJoiningClients, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( waitForJoiningClients, startMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startMove, createGameHost, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( createGameHost, infoProbe, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( infoProbe, join, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( join, runPlaylistSettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( runPlaylistSettings, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, skipSearch, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( skipSearch, lobbyAdvertise, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, lobbyQoSSearchStage2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, endMove, lobbyQoSSearchStage2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, lobbyQoSSearchStage3, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, endMove, lobbyQoSSearchStage3, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSSearchStage3, lobbyQoSJoinStage3, lobbyAdvertise, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage3, endMove, lobbyAdvertise, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyAdvertise, hostingEvent, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( hostingEvent, endMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( endMove, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.ChangeToPublicGameLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptBack = Lobby.Interrupt.Back( GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( GameLobbyInterrupt, params, "Failed to join public lobby" )
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
	end
	
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SEARCH_MODE_PUBLIC )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local waitForJoiningClients = Lobby.Actions.WaitForJoiningClients( 5000 )
	local startMove = Lobby.Actions.ExecuteScript( startMoveProcess )
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
	local skipSearch = Lobby.Actions.IsButtonPressed( controller, "BUTTON_X" )
	local lobbyQoSSearchStage1 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage2 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage3 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSJoinStage1 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage1 )
	local lobbyQoSJoinStage2 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage2 )
	local lobbyQoSJoinStage3 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage3 )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local leaveGameSearch, leaveGameAdvertise = nil
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local process = {
		head = openSpinner,
		interrupt = interruptBack
	}
	Lobby.Process.AddActions( openSpinner, waitForJoiningClients, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( waitForJoiningClients, startMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startMove, runPlaylistSettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( runPlaylistSettings, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, skipSearch, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( skipSearch, lobbyAdvertise, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, lobbyQoSSearchStage2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, endMove, lobbyQoSSearchStage2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, lobbyQoSSearchStage3, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, endMove, lobbyQoSSearchStage3, interruptErrorMsg )
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
	local interruptBack = Lobby.Interrupt.Back( GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( GameLobbyInterrupt, params, "Failed to host lobby" )
	local stopProbes = function ()
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
	local stopProbes = Lobby.Actions.ExecuteScript( stopProbes )
	local startTimer = Lobby.Actions.ExecuteScript( hostingLobby )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local leaveWithParty = Lobby.Actions.LeaveWithParty()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local switchMode = Lobby.Actions.SwitchMode( controller, switchToMode )
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local privateLobbyCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local process = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE
	}
	local lastAction = nil
	if isGameHost == true then
		process.head = stopLobbyTimer
		Lobby.Process.AddActions( stopLobbyTimer, openSpinner, Lobby.Process.DO_NOTHING_IF_FAILURE, interruptErrorMsg )
		lastAction = openSpinner
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LobbyData.LEAVE_WITH_PARTY_WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
		Lobby.Process.AddActions( lastAction, stopProbes, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( stopProbes, startTimer, interruptErrorMsg, interruptErrorMsg )
		lastAction = startTimer
	else
		process.head = openSpinner
		lastAction = openSpinner
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LobbyData.LEAVE_WITH_PARTY_WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
	end
	Lobby.Process.AddActions( lastAction, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.LeaveGameLobby = function ( controller, fromTarget, toTarget, withParty, switchToMode )
	local params = {
		controller = controller,
		errorTarget = toTarget
	}
	local interruptBack = Lobby.Interrupt.Back( GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( GameLobbyInterrupt, params, "Failed to host lobby" )
	local stopProbes = function ()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local stopLobbyTimer = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = controller,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = toTarget.mainMode
	}, true, false, false )
	local stopProbes = Lobby.Actions.ExecuteScript( stopProbes )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local leaveWithParty = Lobby.Actions.LeaveWithParty()
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
	local process = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE
	}
	local lastAction = nil
	if isGameHost == true then
		process.head = stopLobbyTimer
		Lobby.Process.AddActions( stopLobbyTimer, openSpinner, Lobby.Process.DO_NOTHING_IF_FAILURE, interruptErrorMsg )
		lastAction = openSpinner
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LobbyData.LEAVE_WITH_PARTY_WITH then
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
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LobbyData.LEAVE_WITH_PARTY_WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
		Lobby.Process.AddActions( lastAction, endGameClient, interruptErrorMsg, interruptErrorMsg )
		lastAction = endGameClient
	end
	if isPrivateHost == true then
		if privateLobbyCount > 1 and withParty == LobbyData.LEAVE_WITH_PARTY_WITHOUT then
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
	Lobby.Process.AddActions( lobbySettings, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	return process
end

