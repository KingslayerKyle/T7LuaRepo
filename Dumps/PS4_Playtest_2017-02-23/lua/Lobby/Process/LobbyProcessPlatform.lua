require( "lua.Lobby.Process.LobbyActions" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.ProcessPlatform = {}
Lobby.ProcessPlatform.PS4AcceptInvite = function ( controller, xuid, invitationId, joinType, shouldBringParty )
	Engine.LobbyLaunchClear()
	local privateLobbyActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local activateScript = function ()
		if not privateLobbyActive then
			local currentUIScreen = Engine.GetLobbyUIScreen()
			local f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
			if currentUIScreen == f2_local0.id then
				local activeUsersCount = 0
				for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
					if Engine.IsUserActive( i ) then
						activeUsersCount = activeUsersCount + 1
					end
				end
				if activeUsersCount == 0 or Engine.GetPrimaryController() ~= controller then
					Engine.ActivatePrimaryLocalClient( controller )
				end
			end
		end
	end
	
	controller = Engine.GetPrimaryController()
	local deactivateScript = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local gameLobbyCleanupScript = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local clearInviteJoinInfoScript = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local lobbyNetworkMode = Engine.GetLobbyNetworkMode()
	if lobbyNetworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID then
		lobbyNetworkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	end
	local f1_local0 = lobbyNetworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local shouldJoinPrivateCheck = function ()
		return Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local maxClientCount = 18
	if privateLobbyActive then
		maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local joinFailureRecover = Lobby.Process.ReloadPrivateLobby( controller, lobbyNetworkMode )
	local lobbySettingsRecover = Lobby.Actions.LobbySettings( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE ) )
	local updateUIRecover = Lobby.Actions.UpdateUI( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE ) )
	local joinFailureRecoverFirstTimeFlow = Lobby.Process.ReloadPrivateLobby( controller, lobbyNetworkMode )
	local lobbySettingsRecoverFirstTimeFlow = Lobby.Actions.LobbySettings( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE ) )
	local updateUIRecoverFirstTimeFlow = Lobby.Actions.UpdateUI( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE ) )
	local openSpinner = Lobby.Actions.OpenSpinner( nil, true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	closeSpinnerError.name = closeSpinnerError.name .. "Error"
	local closeSpinnerPlayOnline = Lobby.Actions.CloseSpinner()
	closeSpinnerPlayOnline.name = closeSpinnerPlayOnline.name .. "CannotPlayOnline"
	local closeSpinnerBlocked = Lobby.Actions.CloseSpinner()
	closeSpinnerBlocked.name = closeSpinnerBlocked.name .. "InviteBlocked"
	local closeSpinnerFirstTimeFlow = Lobby.Actions.CloseSpinner()
	closeSpinnerFirstTimeFlow.name = closeSpinnerFirstTimeFlow.name .. "NeedsFirstTimeFlow"
	local closeSpinnerErrorRecover = Lobby.Actions.CloseSpinner()
	closeSpinnerErrorRecover.name = closeSpinnerErrorRecover.name .. "RecoverError"
	local emptyAction = Lobby.Actions.EmptyAction()
	local clearInviteJoinInfo = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinInfoError = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinInviteBlocked = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinNeedsFirstTimeFlow = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinRecover = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local canPlayOnline = {}
	if Engine.GetUsedControllerCount() > 1 then
		local n = 1
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			local controllerIndex = i - 1
			if Engine.IsUserActive( controllerIndex ) then
				canPlayOnline[n] = Lobby.Actions.CanPlayOnline( controllerIndex )
				n = n + 1
			end
		end
	else
		canPlayOnline[1] = Lobby.Actions.CanPlayOnline( controller )
	end
	local demonwareConnect = Lobby.Actions.ConnectingToDemonware( controller, LuaDefine.CONNECTINGDW_MAX_WAIT_TIME, true )
	local canAcceptInvite = Lobby.Actions.CanAcceptPlatformInvite( controller )
	local inviteBlockedMsg = Lobby.Actions.ErrorPopupMsg( "MENU_UPDATE_NEEDED" )
	local activate = Lobby.Actions.ExecuteScript( activateScript )
	local deactivate = Lobby.Actions.ExecuteScript( deactivateScript )
	local gameLobbyCleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanupScript )
	local f1_local3 = Lobby.Actions.ForceLobbyUIScreen
	local f1_local4 = controller
	local f1_local5 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
	local forceMainScreen = f1_local3( f1_local4, f1_local5.id )
	local endGameClientLAN = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHostLAN = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClientLAN = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHostLAN = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local getInviteInfo = Lobby.Actions.PlatformSessionGetInviteInfo( controller, xuid, Enum.LobbyType.LOBBY_TYPE_PRIVATE, invitationId )
	local gamertagsToXuids = Lobby.Actions.GamertagsToXuids( controller, getInviteInfo )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, gamertagsToXuids )
	local checkFirstTimeFlow = Lobby.Actions.CheckFirstTimeFlowRequirements( controller, infoProbe )
	local showFirstTimeFlowError = Lobby.Actions.ShowFirstTimeFlowError( checkFirstTimeFlow )
	local join = Lobby.Actions.LobbyJoinXUID( controller, gamertagsToXuids, joinType )
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	local shouldJoinPrivate = Lobby.Actions.ExecuteScriptWithReturn( shouldJoinPrivateCheck, true, false, false )
	local infoProbePrivate = Lobby.Actions.LobbyInfoProbe( controller, gamertagsToXuids )
	local joinPrivate = Lobby.Actions.LobbyJoinXUIDExt( controller, joinType, infoProbe, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, maxClientCount )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	local lastAction = openSpinner
	Lobby.Process.ForceAction( lastAction, activate )
	lastAction = activate
	for i = 1, #canPlayOnline, 1 do
		Lobby.Process.AddActions( lastAction, canPlayOnline[i], closeSpinnerError, closeSpinnerError )
		lastAction = canPlayOnline[i]
	end
	Lobby.Process.AddActions( lastAction, gameLobbyCleanup, closeSpinnerPlayOnline, closeSpinnerPlayOnline )
	Lobby.Process.AddActions( gameLobbyCleanup, demonwareConnect, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( demonwareConnect, canAcceptInvite, closeSpinnerError, closeSpinnerError )
	Lobby.Process.AddActions( canAcceptInvite, emptyAction, closeSpinnerBlocked, closeSpinnerBlocked )
	lastAction = emptyAction
	if f1_local0 then
		Lobby.Process.ForceAction( lastAction, forceMainScreen )
		Lobby.Process.ForceAction( forceMainScreen, endGameClientLAN )
		Lobby.Process.ForceAction( endGameClientLAN, endGameHostLAN )
		Lobby.Process.ForceAction( endGameHostLAN, endPrivateClientLAN )
		Lobby.Process.ForceAction( endPrivateClientLAN, endPrivateHostLAN )
		lastAction = endPrivateHostLAN
	end
	Lobby.Process.AddActions( lastAction, endGameClient, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( endGameClient, endGameHost, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	lastAction = endGameHost
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Lobby.Process.AddActions( lastAction, endPrivateClient, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		lastAction = endPrivateClient
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( lastAction, endPrivateHost, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
			lastAction = endPrivateHost
		end
	end
	Lobby.Process.AddActions( lastAction, startPrivateHost, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( startPrivateHost, addPrimary, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( addPrimary, startPrivateClient, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( startPrivateClient, getInviteInfo, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( getInviteInfo, gamertagsToXuids, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( gamertagsToXuids, infoProbe, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( infoProbe, checkFirstTimeFlow, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( checkFirstTimeFlow, join, closeSpinnerFirstTimeFlow, closeSpinnerFirstTimeFlow )
	Lobby.Process.AddActions( join, clearInviteJoinInfo, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( clearInviteJoinInfo, shouldJoinPrivate, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( shouldJoinPrivate, infoProbePrivate, closeSpinner, closeSpinner )
	Lobby.Process.AddActions( infoProbePrivate, joinPrivate, closeSpinner, closeSpinner )
	Lobby.Process.AddActions( joinPrivate, closeSpinner, closeSpinner, closeSpinner )
	Lobby.Process.ForceAction( closeSpinnerError, clearInviteJoinInfoError )
	Lobby.Process.ForceAction( clearInviteJoinInfoError, joinFailed )
	Lobby.Process.ForceAction( closeSpinnerBlocked, clearInviteJoinInviteBlocked )
	Lobby.Process.ForceAction( clearInviteJoinInviteBlocked, inviteBlockedMsg )
	Lobby.Process.ForceAction( closeSpinnerFirstTimeFlow, clearInviteJoinNeedsFirstTimeFlow )
	Lobby.Process.ForceAction( clearInviteJoinNeedsFirstTimeFlow, joinFailureRecoverFirstTimeFlow.head )
	Lobby.Process.ForceAction( joinFailureRecoverFirstTimeFlow.tail, lobbySettingsRecoverFirstTimeFlow )
	Lobby.Process.ForceAction( lobbySettingsRecoverFirstTimeFlow, updateUIRecoverFirstTimeFlow )
	Lobby.Process.ForceAction( updateUIRecoverFirstTimeFlow, showFirstTimeFlowError )
	Lobby.Process.ForceAction( closeSpinnerErrorRecover, clearInviteJoinRecover )
	Lobby.Process.ForceAction( clearInviteJoinRecover, joinFailureRecover.head )
	Lobby.Process.ForceAction( joinFailureRecover.tail, lobbySettingsRecover )
	Lobby.Process.ForceAction( lobbySettingsRecover, updateUIRecover )
	Lobby.Process.ForceAction( updateUIRecover, joinFailed )
	return process
end

Lobby.ProcessPlatform.PS4SessionJoin = function ( controller, sessionId, joinType, shouldBringParty )
	Engine.LobbyLaunchClear()
	local privateLobbyActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local activateScript = function ()
		if not privateLobbyActive then
			local currentUIScreen = Engine.GetLobbyUIScreen()
			local f8_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
			if currentUIScreen == f8_local0.id then
				local activeUsersCount = 0
				for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
					if Engine.IsUserActive( i ) then
						activeUsersCount = activeUsersCount + 1
					end
				end
				if activeUsersCount == 0 or Engine.GetPrimaryController() ~= controller then
					Engine.ActivatePrimaryLocalClient( controller )
				end
			end
		end
	end
	
	controller = Engine.GetPrimaryController()
	local deactivateScript = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local gameLobbyCleanupScript = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local clearInviteJoinInfoScript = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local lobbyNetworkMode = Engine.GetLobbyNetworkMode()
	if lobbyNetworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID then
		lobbyNetworkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	end
	local f7_local0 = lobbyNetworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local shouldJoinPrivateCheck = function ()
		return Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local maxClientCount = 18
	if privateLobbyActive == true then
		maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local joinFailureRecover = Lobby.Process.ReloadPrivateLobby( controller, lobbyNetworkMode )
	local lobbySettingsRecover = Lobby.Actions.LobbySettings( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE ) )
	local updateUIRecover = Lobby.Actions.UpdateUI( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE ) )
	local joinFailureRecoverFirstTimeFlow = Lobby.Process.ReloadPrivateLobby( controller, lobbyNetworkMode )
	local lobbySettingsRecoverFirstTimeFlow = Lobby.Actions.LobbySettings( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE ) )
	local updateUIRecoverFirstTimeFlow = Lobby.Actions.UpdateUI( controller, LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE ) )
	local openSpinner = Lobby.Actions.OpenSpinner( nil, true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	local closeSpinnerFirstTimeFlow = Lobby.Actions.CloseSpinner()
	closeSpinnerFirstTimeFlow.name = closeSpinnerFirstTimeFlow.name .. "NeedsFirstTimeFlow"
	local closeSpinnerPlayOnline = Lobby.Actions.CloseSpinner()
	closeSpinnerPlayOnline.name = closeSpinnerPlayOnline.name .. "CannotPlayOnline"
	local closeSpinnerErrorRecover = Lobby.Actions.CloseSpinner()
	closeSpinnerErrorRecover.name = closeSpinnerErrorRecover.name .. "RecoverError"
	local canPlayOnline = {}
	if Engine.GetUsedControllerCount() > 1 then
		local n = 1
		for i = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			local controllerIndex = i - 1
			if Engine.IsUserActive( controllerIndex ) then
				canPlayOnline[n] = Lobby.Actions.CanPlayOnline( controllerIndex )
				n = n + 1
			end
		end
	else
		canPlayOnline[1] = Lobby.Actions.CanPlayOnline( controller )
	end
	local activate = Lobby.Actions.ExecuteScript( activateScript )
	local deactivate = Lobby.Actions.ExecuteScript( deactivateScript )
	local clearInviteJoinInfo = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinInfoError = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinFirstTimeFlow = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinRecover = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local gameLobbyCleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanupScript )
	local demonwareConnect = Lobby.Actions.ConnectingToDemonware( controller, LuaDefine.CONNECTINGDW_MAX_WAIT_TIME, true )
	local f7_local3 = Lobby.Actions.ForceLobbyUIScreen
	local f7_local4 = controller
	local f7_local5 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
	local forceMainScreen = f7_local3( f7_local4, f7_local5.id )
	local endGameClientLAN = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHostLAN = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClientLAN = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHostLAN = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local getSessionInfo = Lobby.Actions.PlatformSessionGetSessionInfo( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local gamertagsToXuids = Lobby.Actions.GamertagsToXuids( controller, getSessionInfo )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, gamertagsToXuids )
	local checkFirstTimeFlow = Lobby.Actions.CheckFirstTimeFlowRequirements( controller, infoProbe )
	local showFirstTimeFlowError = Lobby.Actions.ShowFirstTimeFlowError( checkFirstTimeFlow )
	local join = Lobby.Actions.LobbyJoinXUID( controller, gamertagsToXuids, joinType )
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	local joinFailedRecover = Lobby.Actions.ErrorPopup( join )
	local shouldJoinPrivate = Lobby.Actions.ExecuteScriptWithReturn( shouldJoinPrivateCheck, true, false, false )
	local infoProbePrivate = Lobby.Actions.LobbyInfoProbe( controller, gamertagsToXuids )
	local joinPrivate = Lobby.Actions.LobbyJoinXUIDExt( controller, joinType, infoProbe, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, maxClientCount )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	local lastAction = openSpinner
	Lobby.Process.ForceAction( lastAction, activate )
	lastAction = activate
	for i = 1, #canPlayOnline, 1 do
		Lobby.Process.AddActions( lastAction, canPlayOnline[i], closeSpinnerError, closeSpinnerError )
		lastAction = canPlayOnline[i]
	end
	Lobby.Process.AddActions( lastAction, gameLobbyCleanup, closeSpinnerPlayOnline, closeSpinnerPlayOnline )
	Lobby.Process.AddActions( gameLobbyCleanup, demonwareConnect, closeSpinnerError, closeSpinnerError )
	lastAction = demonwareConnect
	if f7_local0 then
		Lobby.Process.ForceAction( lastAction, forceMainScreen )
		Lobby.Process.ForceAction( forceMainScreen, endGameClientLAN )
		Lobby.Process.ForceAction( endGameClientLAN, endGameHostLAN )
		Lobby.Process.ForceAction( endGameHostLAN, endPrivateClientLAN )
		Lobby.Process.ForceAction( endPrivateClientLAN, endPrivateHostLAN )
		lastAction = endPrivateHostLAN
	end
	Lobby.Process.AddActions( lastAction, endGameClient, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( endGameClient, endGameHost )
	lastAction = endGameHost
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Lobby.Process.AddActions( lastAction, endPrivateClient, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		lastAction = endPrivateClient
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( lastAction, endPrivateHost, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
			lastAction = endPrivateHost
		end
	end
	Lobby.Process.AddActions( lastAction, startPrivateHost, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( startPrivateHost, addPrimary, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( addPrimary, startPrivateClient, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( startPrivateClient, getSessionInfo, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( getSessionInfo, gamertagsToXuids, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( gamertagsToXuids, infoProbe, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( infoProbe, checkFirstTimeFlow, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( checkFirstTimeFlow, join, closeSpinnerFirstTimeFlow, closeSpinnerFirstTimeFlow )
	Lobby.Process.AddActions( join, clearInviteJoinInfo, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( clearInviteJoinInfo, shouldJoinPrivate, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( shouldJoinPrivate, infoProbePrivate, closeSpinner, closeSpinner )
	Lobby.Process.AddActions( infoProbePrivate, joinPrivate, closeSpinner, closeSpinner )
	Lobby.Process.AddActions( joinPrivate, closeSpinner, closeSpinner, closeSpinner )
	Lobby.Process.ForceAction( closeSpinnerError, clearInviteJoinInfoError )
	Lobby.Process.ForceAction( clearInviteJoinInfoError, joinFailed )
	Lobby.Process.ForceAction( joinFailed, deactivate )
	Lobby.Process.ForceAction( closeSpinnerFirstTimeFlow, clearInviteJoinFirstTimeFlow )
	Lobby.Process.ForceAction( clearInviteJoinFirstTimeFlow, joinFailureRecoverFirstTimeFlow.head )
	Lobby.Process.ForceAction( joinFailureRecoverFirstTimeFlow.tail, lobbySettingsRecoverFirstTimeFlow )
	Lobby.Process.ForceAction( lobbySettingsRecoverFirstTimeFlow, updateUIRecoverFirstTimeFlow )
	Lobby.Process.ForceAction( updateUIRecoverFirstTimeFlow, showFirstTimeFlowError )
	Lobby.Process.ForceAction( closeSpinnerErrorRecover, clearInviteJoinRecover )
	Lobby.Process.ForceAction( clearInviteJoinRecover, joinFailureRecover.head )
	Lobby.Process.ForceAction( joinFailureRecover.tail, lobbySettingsRecover )
	Lobby.Process.ForceAction( lobbySettingsRecover, updateUIRecover )
	Lobby.Process.ForceAction( updateUIRecover, joinFailedRecover )
	return process
end

Lobby.ProcessPlatform.XboxJoin = function ( controller, xuid, joinType, shouldBringParty )
	Engine.LobbyLaunchClear()
	local lobbyNetworkMode = Engine.GetLobbyNetworkMode()
	if lobbyNetworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID then
		lobbyNetworkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	end
	local f13_local0 = lobbyNetworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local activateScript = function ()
		Engine.ActivatePrimaryLocalClient( controller )
	end
	
	local deactivateScript = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local clearInviteJoinInfoScript = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local gameLobbyCleanupScript = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local shouldJoinPrivateScript = function ()
		return Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local maxClientCount = 18
	local privateLobbyActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if privateLobbyActive == true then
		maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local modeSelectMenu = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
	local joinFailureRecover = Lobby.Process.ReloadPrivateLobby( controller, lobbyNetworkMode )
	local lobbySettingsRecover = Lobby.Actions.LobbySettings( controller, modeSelectMenu )
	local updateUIRecover = Lobby.Actions.UpdateUI( controller, modeSelectMenu )
	local joinFailureRecoverCanPlayOnline = Lobby.Process.ReloadPrivateLobby( controller, lobbyNetworkMode )
	local lobbySettingsRecoverCanPlayOnline = Lobby.Actions.LobbySettings( controller, modeSelectMenu )
	local updateUIRecoverCanPlayOnline = Lobby.Actions.UpdateUI( controller, modeSelectMenu )
	local joinFailureRecoverFirstTimeFlow = Lobby.Process.ReloadPrivateLobby( controller, lobbyNetworkMode )
	local lobbySettingsRecoverFirstTimeFlow = Lobby.Actions.LobbySettings( controller, modeSelectMenu )
	local updateUIRecoverFirstTimeFlow = Lobby.Actions.UpdateUI( controller, modeSelectMenu )
	local openSpinner = Lobby.Actions.OpenSpinner( nil, true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local closeSpinnerCanPlayOnline = Lobby.Actions.CloseSpinner()
	closeSpinnerCanPlayOnline.name = closeSpinnerCanPlayOnline.name .. "CanPlayOnline"
	local closeSpinnerFirstTimeFlow = Lobby.Actions.CloseSpinner()
	closeSpinnerFirstTimeFlow.name = closeSpinnerFirstTimeFlow.name .. "NeedsFirstTimeFlow"
	local closeSpinnerErrorRecover = Lobby.Actions.CloseSpinner()
	closeSpinnerErrorRecover.name = closeSpinnerErrorRecover.name .. "RecoverError"
	local showCanPlayOnlineError = Lobby.Actions.ErrorPopupMsg( "XBOXLIVE_MPNOTALLOWED" )
	local canPlayOnline = Lobby.Actions.CanPlayOnline( controller )
	local gameLobbyCleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanupScript )
	local demonwareConnect = Lobby.Actions.ConnectingToDemonware( controller, LuaDefine.CONNECTINGDW_MAX_WAIT_TIME, true )
	local activate = Lobby.Actions.ExecuteScript( activateScript )
	local deactivate = Lobby.Actions.ExecuteScript( deactivateScript )
	local forceMainScreen = Lobby.Actions.ForceLobbyUIScreen( controller, modeSelectMenu.id )
	local endGameClientLAN = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHostLAN = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClientLAN = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHostLAN = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local leaveWithParty = Lobby.Actions.LeaveWithParty( 3000 )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local infoProbe = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = xuid
	} )
	local join = Lobby.Actions.LobbyJoinXUIDExt( controller, joinType, infoProbe, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local checkFirstTimeFlow = Lobby.Actions.CheckFirstTimeFlowRequirements( controller, infoProbe )
	local showFirstTimeFlowError = Lobby.Actions.ShowFirstTimeFlowError( checkFirstTimeFlow )
	local shouldJoinPrivate = Lobby.Actions.ExecuteScriptWithReturn( shouldJoinPrivateScript, true, false, false )
	local infoProbePrivate = Lobby.Actions.LobbyInfoProbe( controller, {
		xuid = xuid
	} )
	local joinPrivate = Lobby.Actions.LobbyJoinXUIDExt( controller, joinType, infoProbePrivate, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, maxClientCount )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local clearInviteJoinInfo = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinInfoError = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinCanPlayOnline = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinNeedsFirstTimeFlow = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local clearInviteJoinRecover = Lobby.Actions.ExecuteScript( clearInviteJoinInfoScript )
	local closeSpinnerError = Lobby.Actions.CloseSpinner()
	local joinFailed = Lobby.Actions.ErrorPopup( join )
	local f13_local1 = shouldBringParty == LuaEnum.LEAVE_WITH_PARTY.WITH
	local isInGame = Engine.IsInGame()
	local isPrivateActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isGameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
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
		if f13_local1 == false then
			leavePrivateClient = true
			if isPrivateHost == true then
				leavePrivateHost = true
			end
		end
	elseif isPrivateActive == true then
		if f13_local1 == false then
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
	local process = {
		head = canPlayOnline,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	local lastAction = canPlayOnline
	Lobby.Process.AddActions( lastAction, openSpinner, closeSpinnerCanPlayOnline, closeSpinnerCanPlayOnline )
	Lobby.Process.ForceAction( openSpinner, activate )
	lastAction = activate
	if f13_local0 then
		Lobby.Process.ForceAction( lastAction, forceMainScreen )
		Lobby.Process.ForceAction( forceMainScreen, endGameClientLAN )
		Lobby.Process.ForceAction( endGameClientLAN, endGameHostLAN )
		Lobby.Process.ForceAction( endGameHostLAN, endPrivateClientLAN )
		Lobby.Process.ForceAction( endPrivateClientLAN, endPrivateHostLAN )
		lastAction = endPrivateHostLAN
	end
	Lobby.Process.ForceAction( lastAction, gameLobbyCleanup )
	Lobby.Process.ForceAction( gameLobbyCleanup, demonwareConnect )
	lastAction = demonwareConnect
	if isGameActive == true and f13_local1 == true then
		Lobby.Process.AddActions( lastAction, leaveWithParty, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		lastAction = leaveWithParty
	end
	if leaveGameClient == true then
		Lobby.Process.AddActions( lastAction, endGameClient, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		lastAction = endGameClient
	end
	if leaveGameHost == true then
		Lobby.Process.AddActions( lastAction, endGameHost, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		lastAction = endGameHost
	end
	if leavePrivateClient == true then
		Lobby.Process.AddActions( lastAction, endPrivateClient, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		lastAction = endPrivateClient
	end
	if leavePrivateHost == true then
		Lobby.Process.AddActions( lastAction, endPrivateHost, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		lastAction = endPrivateHost
	end
	if isPrivateHost == false or leavePrivateHost == true then
		Lobby.Process.AddActions( lastAction, startPrivateHost, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		Lobby.Process.AddActions( startPrivateHost, addPrimary, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		lastAction = addPrimary
	end
	if leavePrivateClient == true then
		Lobby.Process.AddActions( lastAction, startPrivateClient, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
		lastAction = startPrivateClient
	end
	Lobby.Process.AddActions( lastAction, infoProbe, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( infoProbe, checkFirstTimeFlow, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( checkFirstTimeFlow, join, closeSpinnerFirstTimeFlow, closeSpinnerFirstTimeFlow )
	Lobby.Process.AddActions( join, shouldJoinPrivate, closeSpinnerErrorRecover, closeSpinnerErrorRecover )
	Lobby.Process.AddActions( shouldJoinPrivate, infoProbePrivate, clearInviteJoinInfo, clearInviteJoinInfo )
	Lobby.Process.AddActions( infoProbePrivate, joinPrivate, clearInviteJoinInfo, clearInviteJoinInfo )
	Lobby.Process.ForceAction( joinPrivate, clearInviteJoinInfo )
	Lobby.Process.ForceAction( clearInviteJoinInfo, closeSpinner )
	Lobby.Process.ForceAction( closeSpinnerCanPlayOnline, clearInviteJoinCanPlayOnline )
	Lobby.Process.ForceAction( clearInviteJoinCanPlayOnline, joinFailureRecoverCanPlayOnline.head )
	Lobby.Process.ForceAction( joinFailureRecoverCanPlayOnline.tail, lobbySettingsRecoverCanPlayOnline )
	Lobby.Process.ForceAction( lobbySettingsRecoverCanPlayOnline, updateUIRecoverCanPlayOnline )
	Lobby.Process.ForceAction( updateUIRecoverCanPlayOnline, showCanPlayOnlineError )
	Lobby.Process.ForceAction( closeSpinnerFirstTimeFlow, clearInviteJoinNeedsFirstTimeFlow )
	Lobby.Process.ForceAction( clearInviteJoinNeedsFirstTimeFlow, joinFailureRecoverFirstTimeFlow.head )
	Lobby.Process.ForceAction( joinFailureRecoverFirstTimeFlow.tail, lobbySettingsRecoverFirstTimeFlow )
	Lobby.Process.ForceAction( lobbySettingsRecoverFirstTimeFlow, updateUIRecoverFirstTimeFlow )
	Lobby.Process.ForceAction( updateUIRecoverFirstTimeFlow, showFirstTimeFlowError )
	Lobby.Process.ForceAction( closeSpinnerErrorRecover, clearInviteJoinRecover )
	Lobby.Process.ForceAction( clearInviteJoinRecover, joinFailureRecover.head )
	Lobby.Process.ForceAction( joinFailureRecover.tail, lobbySettingsRecover )
	Lobby.Process.ForceAction( lobbySettingsRecover, updateUIRecover )
	Lobby.Process.ForceAction( updateUIRecover, joinFailed )
	Lobby.Process.ForceAction( joinFailed, deactivate )
	return process
end

Lobby.ProcessPlatform.PlayTogetherBeginPlay = function ( controller, playTogetherList )
	local clearPlayTogetherFunc = function ()
		Engine.PlatformSessionClearPlayTogetherInfo()
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner( nil, true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local oldSessionId = Lobby.Platform.PS4GetSessionId( controller )
	local playTogetherBeginPlayWait = Lobby.Actions.PlayTogetherBeginPlayWait( controller )
	local playTogetherPSNSessionWait = Lobby.Actions.PlayTogetherPSNSessionWait( controller, oldSessionId )
	local clearPlayTogether = Lobby.Actions.ExecuteScript( clearPlayTogetherFunc, nil )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, playTogetherBeginPlayWait )
	Lobby.Process.AddActions( playTogetherBeginPlayWait, playTogetherPSNSessionWait )
	local lastaction = playTogetherPSNSessionWait
	for index, gamertag in ipairs( playTogetherList ) do
		local invite = Lobby.Actions.SendPlatformInvite( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
		Lobby.Process.AddActions( lastaction, invite )
		lastaction = invite
	end
	Lobby.Process.AddActions( lastaction, clearPlayTogether )
	Lobby.Process.AddActions( clearPlayTogether, closeSpinner )
	return process
end

Lobby.ProcessPlatform.SendPlayTogetherInvites = function ( controller, playTogetherList )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
	local sessionId = Lobby.Platform.PS4GetSessionId( controller )
	local clearPlayTogetherFunc = function ()
		Engine.PlatformSessionClearPlayTogetherInfo()
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner( nil, true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local clearPlayTogether = Lobby.Actions.ExecuteScript( clearPlayTogetherFunc, nil )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local lastaction = openSpinner
	for index, gamertag in ipairs( playTogetherList ) do
		local invite = Lobby.Actions.SendPlatformInvite( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag, sessionId )
		Lobby.Process.AddActions( lastaction, invite )
		lastaction = invite
	end
	Lobby.Process.AddActions( lastaction, clearPlayTogether )
	Lobby.Process.AddActions( clearPlayTogether, closeSpinner )
	return process
end

