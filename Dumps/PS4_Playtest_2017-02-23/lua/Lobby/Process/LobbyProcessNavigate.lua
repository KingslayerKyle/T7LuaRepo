require( "lua.Lobby.Process.Nav.LobbyProcessNavCommon" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavCP" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavMP" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavZM" )

Lobby.ProcessNavigate = {}
Lobby.ProcessNavigate.FailedDWConnection = false
Lobby.ProcessNavigate.DisplayedFirstTimeDurangoDownloadSetting = false
Lobby.ProcessNavigate.DoFirstTimeProfileSetup = function ( self, controller )
	if CoDShared.IsMainFirstTimeSetup( controller ) then
		if CoDShared.IsCurrentTextLanguageEnglish() then
			LobbyVM.ExecuteLobbyVMCreateOverlay( controller, "FirstTimeGraphicContentSetting" )
		else
			LobbyVM.ExecuteLobbyVMCreateOverlay( controller, "FirstTimeBrightnessSetting" )
		end
		return true
	elseif LuaDefine.isXbox and not CoDShared.IsGameInstalled() and not Lobby.ProcessNavigate.DisplayedFirstTimeDurangoDownloadSetting then
		Lobby.ProcessNavigate.DisplayedFirstTimeDurangoDownloadSetting = true
		LobbyVM.ExecuteLobbyVMCreateOverlay( controller, "FirstTimeBrightnessSetting" )
		return true
	else
		return false
	end
end

Lobby.ProcessNavigate.BeginIfLocalFilesReady = function ( self, controller )
	if Engine.AreLocalFilesReady( controller ) then
		Engine.LoadSaveGame()
		Engine.ExecNow( controller, "invalidateEmblemComponent" )
		if not Lobby.ProcessNavigate.DoFirstTimeProfileSetup( self, controller ) then
			local menuName = LuaEnum.UI.MODE_SELECT_LAN
			local data = {
				controller = controller,
				navToMenu = menuName
			}
			LobbyVM.OnGoForward( data )
		end
	else
		LobbyVM.ExecuteLobbyVMCreateOverlay( controller, "LoadingProfile" )
	end
end

Lobby.ProcessNavigate.ShouldBeginLAN = function ( controller )
	local isSignedInToLive = Engine.IsSignedInToLive( controller )
	local isWaitingInQueue = Engine.IsPlayerQueued( controller )
	local f3_local0 = Engine.IsPlusAuthorized( controller )
	if not f3_local0 then
		local isPlusAuthorized = LuaDefine.isPC
	end
	if not isSignedInToLive and not isWaitingInQueue then
		return true
	else
		local forceLAN = Dvar.lobby_forceLAN:get()
		if forceLAN > 0 then
			return true
		elseif Lobby.ProcessNavigate.FailedDWConnection == true then
			return true
		elseif not f3_local0 then
			return true
		elseif CoDShared.ChunkAllDownloading() then
			return true
		elseif Engine.GetAnticheatReputation( controller ) >= LuaEnum.DW_REPUTATION_BAN then
			return true
		else
			return false
		end
	end
end

Lobby.ProcessNavigate.BeginLocalPlay = function ( self, controller )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL )
	Lobby.ProcessNavigate.BeginIfLocalFilesReady( self, controller )
end

Lobby.ProcessNavigate.BeginLANPlay = function ( self, controller )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	Lobby.ProcessNavigate.BeginIfLocalFilesReady( self, controller )
end

Lobby.ProcessNavigate.BeginLivePlay = function ( self, controller )
	if LuaDefine.isPS4 then
		if Engine.DisplayNpAvailabilityErrors( controller ) then
			Lobby.ProcessNavigate.FailedDWConnection = true
			Lobby.ProcessNavigate.BeginPlay( self, controller )
			return 
		elseif not Engine.DisplayUpsellAndContentWarnings( controller ) then
			Lobby.ProcessNavigate.FailedDWConnection = true
			Lobby.ProcessNavigate.BeginPlay( self, controller )
			return 
		elseif not Engine.HasCompletedCheckingRestrictions( controller ) then
			LobbyVM.ExecuteLobbyVMCreateOverlay( controller, "CheckingRestrictions" )
			return 
		end
	end
	if Engine.IsPlayerQueued( controller ) then
		LobbyVM.ExecuteLobbyVMCreateOverlay( controller, "LoginQueued" )
	elseif Engine.IsDemonwareFetchingDone( controller ) and Engine.AreLocalFilesReady( controller ) then
		if true == CoDShared.ForceOffline() then
			Lobby.ProcessNavigate.FailedDWConnection = true
			LobbyVM.ExecuteLobbyVMCreateOverlay( controller, "UpdateNeeded" )
			return 
		end
		Lobby.ProcessNavigate.FailedDWConnection = false
		Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		Engine.LoadSaveGame()
		Engine.ExecNow( controller, "invalidateEmblemComponent" )
		if not Lobby.ProcessNavigate.DoFirstTimeProfileSetup( self, controller ) then
			local currentMenuId = LobbyData.GetLobbyNav()
			local fromTarget = LobbyData.GetLobbyMenuByID( currentMenuId )
			local menuName = LuaEnum.UI.MODE_SELECT_ONLINE
			if CoDShared.IsDirectorEnabled() then
				menuName = LuaEnum.UI.DIRECTOR_ONLINE
			elseif LuaUtils.IsBetaBuild() then
				menuName = LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING
			end
			local data = {
				controller = controller,
				navToMenu = menuName
			}
			LobbyVM.OnGoForward( data )
		end
	else
		Engine.LiveConnectEnableDemonwareConnect()
		LobbyVM.ExecuteLobbyVMCreateOverlay( controller, "ConnectingToDemonware" )
	end
end

Lobby.ProcessNavigate.PressStart = function ( controller )
	if Engine.IsCinematicPlaying() then
		return 
	elseif not Engine.LiveIsControllerSignedIn( controller ) then
		local signedIn = Engine.SignIntoPlatformLiveSystem( controller )
		if not signedIn then
			return 
		end
	end
	if Engine.IsUserGuest( controller ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_GUEST_CONTENT_RESTRICTED" )
		return 
	elseif (LuaDefine.isPS4 or LuaDefine.isXbox) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading()) and not CoD.perController[controller].hasShownPlaygoWarning then
		CoD.perController[controller].hasShownPlaygoWarning = true
		return 
	end
	Engine.ActivatePrimaryLocalClient( controller )
	local hasNetworkConnection = Engine.CheckNetConnection()
	local firstController = 0
	if not hasNetworkConnection then
		Lobby.ProcessNavigate.BeginLocalPlay( self, firstController )
	elseif Lobby.ProcessNavigate.ShouldBeginLAN( firstController ) then
		Lobby.ProcessNavigate.BeginLANPlay( self, firstController )
	else
		Lobby.ProcessNavigate.BeginLivePlay( self, firstController )
	end
	LobbyVM.PlaySound( LobbyData.Sounds.Action, 0 )
end

Lobby.ProcessNavigate.ChangeNetworkMode = function ( controller, fromTarget, toTarget )
	local gameLobbyCleanupScript = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local gameLobbyCleanup = Lobby.Actions.ExecuteScript( gameLobbyCleanupScript )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local endGameClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endGameHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local setNetworkMode = Lobby.Actions.SetNetworkMode( controller, toTarget.networkMode )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( toTarget.lobbyType )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( toTarget.lobbyType )
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
	if toTarget.networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		local signLocalUserInToLive = Lobby.Actions.SignUserInToLive( controller )
		Lobby.Process.AddActions( setNetworkMode, signLocalUserInToLive )
		Lobby.Process.AddActions( signLocalUserInToLive, startPrivateHost )
	else
		Lobby.Process.AddActions( setNetworkMode, startPrivateHost )
	end
	Lobby.Process.AddActions( startPrivateHost, addPrimary )
	Lobby.Process.AddActions( addPrimary, startPrivateClient )
	Lobby.Process.AddActions( startPrivateClient, lobbySettings )
	Lobby.Process.AddActions( lobbySettings, updateUI )
	Lobby.Process.AddActions( updateUI, closeSpinner )
	return process
end

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
		cancellable = false
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
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local process = {
		head = openSpinner,
		interrupt = interruptBack,
		force = false,
		cancellable = false
	}
	local netowrkMode = Engine.GetLobbyNetworkMode()
	if netowrkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		Lobby.Process.AddActions( openSpinner, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	elseif Dvar.lobby_forceLAN:get() == 1 then
		local disconnectFromDW = Lobby.Actions.DisconnectFromDemonware( controller, 3 )
		Lobby.Process.AddActions( openSpinner, disconnectFromDW, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( disconnectFromDW, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	elseif Dvar.lobby_forceLAN:get() == 2 then
		Lobby.Process.AddActions( openSpinner, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	end
	Lobby.Process.AddActions( lobbySettings, startHost, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startHost, addPrimary, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( addPrimary, startClient, interruptErrorMsg, interruptErrorMsg )
	if toTarget.name == LuaEnum.UI.MODE_SELECT_LAN and false == CoDShared.IsDirectorEnabled() and Engine.GetDvarInt( "mp_prototype" ) ~= 0 and Engine.IsUsingCursor() and Engine.GetDvarBool( "ui_usingFreeCursor" ) then
		Lobby.Process.AddActions( startClient, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	else
		Lobby.Process.AddActions( startClient, updateUI, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	end
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
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, endPrivateClient )
	Lobby.Process.AddActions( endPrivateClient, endPrivateHost )
	Lobby.Process.AddActions( endPrivateHost, lobbySettings )
	Lobby.Process.AddActions( lobbySettings, updateUI )
	Lobby.Process.AddActions( updateUI, closeSpinner )
	Lobby.Process.AddActions( closeSpinner, nil )
	return process
end

Lobby.ProcessNavigate.EnterLANLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.PrivateLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local lobbySetup = function ()
		Engine.SetLobbyMaxClients( toTarget.lobbyType, toTarget.maxClients )
		Lobby.ProcessNavigate.SetupLobbyMapAndGameType( controller, toTarget )
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local switchMode = Lobby.Actions.SwitchMode( controller, Lobby.Core.GetMainModeStr( toTarget.mainMode ) )
	local switchCampaignMode = Lobby.Actions.SwitchCampaignMode( controller, Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
	if LuaUtils.IsCPZMTarget( toTarget.id ) then
		switchCampaignMode = Lobby.Actions.SwitchCampaignMode( controller, Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES )
	end
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local lobbyInit = Lobby.Actions.ExecuteScript( lobbySetup )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local hostingEvent = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
		controller = controller,
		lobbyType = toTarget.lobbyType,
		mainMode = toTarget.mainMode,
		lobbyTimerType = toTarget.lobbyTimerType
	} )
	local restoreMap = Lobby.Actions.SetSavedOrDefaultMap( controller, toTarget )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, switchMode, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( switchMode, switchCampaignMode, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( switchCampaignMode, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, lobbyInit, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyInit, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, hostingEvent, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( hostingEvent, restoreMap, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( restoreMap, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.ExitLANLobby = function ( controller, fromTarget, toTarget, withParty )
	local params = {
		controller = controller,
		errorTarget = toTarget
	}
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.PrivateLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local privateLobbyCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local stopProbes = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local stopLobbyTimer = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = controller,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = toTarget.mainMode
	}, true, false, false )
	local switchMode = Lobby.Actions.SwitchMode( controller, Lobby.Core.GetMainModeStr( toTarget.mainMode ) )
	local endPrivateClient = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local endPrivateHost = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateHost = Lobby.Actions.LobbyHostStart( controller, toTarget.mainMode, toTarget.lobbyType, toTarget.lobbyMode, toTarget.maxClients )
	local addPrimary = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local startPrivateClient = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local process = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local lastAction = nil
	process.head = openSpinner
	Lobby.Process.AddActions( openSpinner, stopLobbyTimer, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( stopLobbyTimer, switchMode, closeSpinner, interruptErrorMsg )
	lastAction = switchMode
	if isPrivateHost == true and privateLobbyCount > 1 and withParty == LuaEnum.LEAVE_WITH_PARTY.WITHOUT then
		Lobby.Process.AddActions( lastAction, endPrivateClient, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( endPrivateClient, endPrivateHost, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( endPrivateHost, startPrivateHost, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( startPrivateHost, addPrimary, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( addPrimary, startPrivateClient, interruptErrorMsg, interruptErrorMsg )
		lastAction = startPrivateClient
	end
	Lobby.Process.AddActions( lastAction, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	if toTarget.name == LuaEnum.UI.MODE_SELECT_LAN and false == CoDShared.IsDirectorEnabled() and Engine.GetDvarInt( "mp_prototype" ) ~= 0 and Engine.IsUsingCursor() and Engine.GetDvarBool( "ui_usingFreeCursor" ) then
		Lobby.Process.AddActions( lobbySettings, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	else
		Lobby.Process.AddActions( lobbySettings, updateUI, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	end
	return process
end

Lobby.ProcessNavigate.GameLobbyInterrupt = function ( interruptType, params, extraParam )
	local matchmakingFailedProcess = function ()
		Lobby.Debug.JBMatchmakingEvent( LuaEnum.JB_MATCHMAKING_EVENT.FAILED )
	end
	
	local matchmakingEndFailed = Lobby.Actions.ExecuteScript( matchmakingFailedProcess )
	local controller = params.controller
	local toTarget = params.errorTarget
	local isPublic = params.isPublic
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
		cancellable = false
	}
	if isPublic == true then
		process.head = matchmakingEndFailed
		Lobby.Process.ForceAction( matchmakingEndFailed, openSpinner )
	end
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
	local gametype = "pvp"
	if toTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if LuaUtils.IsCPZMTarget( toTarget.id ) then
			gametype = "cpzm"
		elseif LuaUtils.IsDOATarget( toTarget.id ) then
			gametype = "doa"
		end
	elseif toTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		local f21_local0 = toTarget.id
		local f21_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
		if f21_local0 ~= f21_local1.id then
			f21_local0 = toTarget.id
			f21_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
			if f21_local0 == f21_local1.id then
				gametype = "fr"
			elseif CoDShared.IsDirectorEnabled() == false and CoDShared.IsIntDvarNonZero( "mp_prototype" ) then
				gametype = "war"
			else
				gametype = "tdm"
			end
		end
		gametype = "fr"
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
	local gametype = nil
	local f23_local0 = toTarget.id
	local f23_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
	if f23_local0 ~= f23_local1.id then
		f23_local0 = toTarget.id
		f23_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
		if f23_local0 == f23_local1.id then
			gametype = "fr"
		end
		gametype = Engine.ProfileValueAsString( controller, "gametype" )
	end
	gametype = "fr"
end

Lobby.ProcessNavigate.SwitchLobbiesIsMapValid = function ( map )
	if map == "" or map == nil then
		return false
	elseif not Engine.IsMapValid( map ) then
		return false
	else
		return true
	end
end

Lobby.ProcessNavigate.SwitchLobbiesGetMap = function ( controller, toTarget )
	local map = nil
	if Engine.IsCampaignGame() then
		map = Engine.GetSavedMapQueuedMap()
		if map == nil or map == "" then
			map = Engine.GetSavedMap()
		end
	elseif Engine.IsMultiplayerGame() then
		local f25_local0 = toTarget.id
		local f25_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
		if f25_local0 ~= f25_local1.id then
			f25_local0 = toTarget.id
			f25_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
			if f25_local0 == f25_local1.id then
				map = Engine.ProfileValueAsString( controller, "map_fr" )
			else
				map = Engine.ProfileValueAsString( controller, "map" )
			end
		end
		map = Engine.ProfileValueAsString( controller, "map_fr" )
	elseif Engine.IsZombiesGame() then
		map = Engine.ProfileValueAsString( controller, "map_zm" )
	end
	if not Lobby.ProcessNavigate.SwitchLobbiesIsMapValid( map ) then
		map = LuaUtils.GetDefaultMap( toTarget )
	end
	return map
end

Lobby.ProcessNavigate.SetupLobbyMapAndGameType = function ( controller, toTarget )
	if toTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	else
		Engine.SetGametype( Lobby.ProcessNavigate.SwitchLobbiesGetGametype( controller, toTarget ) )
		local mapName = Lobby.ProcessNavigate.SwitchLobbiesGetMap( controller, toTarget )
		Engine.LobbySetMap( toTarget.lobbyType, mapName )
		local selectedMapModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" )
		Engine.SetModelValue( selectedMapModel, mapName )
	end
end

Lobby.ProcessNavigate.CreateCustomLobby = function ( controller, fromTarget, toTarget )
	local params = {
		controller = controller,
		errorTarget = fromTarget
	}
	local interruptBack = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptFailedAction = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, params )
	local interruptErrorMsg = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, params, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local lobbySetup = function ()
		Lobby.ProcessNavigate.SetupLobbyMapAndGameType( controller, toTarget )
	end
	
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local switchMode = Lobby.Actions.SwitchMode( controller, Lobby.Core.GetMainModeStr( toTarget.mainMode ) )
	local switchCampaignMode = Lobby.Actions.SwitchCampaignMode( controller, Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
	local lobbyInit = Lobby.Actions.ExecuteScript( lobbySetup )
	local hostingEvent = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
		controller = controller,
		lobbyType = toTarget.lobbyType,
		mainMode = toTarget.mainMode,
		lobbyTimerType = toTarget.lobbyTimerType
	} )
	local restoreMap = Lobby.Actions.SetSavedOrDefaultMap( controller, toTarget )
	local process = {
		head = openSpinner,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( openSpinner, switchMode, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( switchMode, switchCampaignMode, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( switchCampaignMode, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, lobbyInit, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyInit, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, hostingEvent, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( hostingEvent, restoreMap, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( restoreMap, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, nil, interruptErrorMsg, interruptErrorMsg )
	return process
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
		Lobby.ProcessNavigate.SetupLobbyMapAndGameType( controller, toTarget )
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
	local restoreMap = Lobby.Actions.SetSavedOrDefaultMap( controller, toTarget )
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
	Lobby.Process.AddActions( hostingEvent, restoreMap, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( restoreMap, endMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( endMove, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, nil, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.CreatePublicGameLobby = function ( controller, fromTarget, toTarget, initialSearchDelay )
	local matchmakingEndProcess = function ()
		Lobby.Debug.JBMatchmakingEvent( LuaEnum.JB_MATCHMAKING_EVENT.END )
	end
	
	local matchmakingEndJoin = Lobby.Actions.ExecuteScript( matchmakingEndProcess )
	local matchmakingEndAdvertise = Lobby.Actions.ExecuteScript( matchmakingEndProcess )
	local params = {
		controller = controller,
		errorTarget = fromTarget,
		isPublic = true
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
		Lobby.Matchmaking.ClearSearchInfo()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local startMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
	end
	
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local resetSearchProcess = function ( resetSearchInfo )
		if LuaUtils.IsArenaMode() then
			Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.ARENA, resetSearchInfo )
		else
			Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.PUBLIC, resetSearchInfo )
		end
	end
	
	resetSearchProcess( true )
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
	local searchDelayTime = 0
	if initialSearchDelay and initialSearchDelay > 0 then
		searchDelayTime = initialSearchDelay
	end
	local initialSearchDelayAction = Lobby.Actions.TimeDelay( searchDelayTime )
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
	lobbyQoSSearchStage1.name = lobbyQoSSearchStage1.name .. "_1"
	lobbyQoSSearchStage2.name = lobbyQoSSearchStage2.name .. "_2"
	lobbyQoSSearchStage3.name = lobbyQoSSearchStage3.name .. "_3"
	lobbyQoSSearchStage4.name = lobbyQoSSearchStage4.name .. "_4"
	lobbyQoSSearchStage5.name = lobbyQoSSearchStage5.name .. "_5"
	lobbyQoSSearchStage6.name = lobbyQoSSearchStage6.name .. "_6"
	lobbyQoSJoinStage1.name = lobbyQoSJoinStage1.name .. "_1"
	lobbyQoSJoinStage2.name = lobbyQoSJoinStage2.name .. "_2"
	lobbyQoSJoinStage3.name = lobbyQoSJoinStage3.name .. "_3"
	lobbyQoSJoinStage4.name = lobbyQoSJoinStage4.name .. "_4"
	lobbyQoSJoinStage5.name = lobbyQoSJoinStage5.name .. "_5"
	lobbyQoSJoinStage6.name = lobbyQoSJoinStage6.name .. "_6"
	local canHostServer = Lobby.Actions.CanHostServer( controller, toTarget )
	local redoSearchDelay = Lobby.Actions.TimeDelay( 1500 )
	local resetSearch = Lobby.Actions.ExecuteScript( resetSearchProcess, false )
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
	Lobby.Process.AddActions( skipSearchDvar, skipAdvertiseDvar, initialSearchDelayAction, initialSearchDelayAction )
	Lobby.Process.ForceAction( initialSearchDelayAction, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, searchDelay2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, matchmakingEndJoin, searchDelay2, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay2, lobbyQoSSearchStage2 )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, searchDelay3, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, matchmakingEndJoin, searchDelay3, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay3, lobbyQoSSearchStage3 )
	Lobby.Process.AddActions( lobbyQoSSearchStage3, lobbyQoSJoinStage3, searchDelay4, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage3, matchmakingEndJoin, searchDelay4, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay4, lobbyQoSSearchStage4 )
	Lobby.Process.AddActions( lobbyQoSSearchStage4, lobbyQoSJoinStage4, searchDelay5, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage4, matchmakingEndJoin, searchDelay5, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay5, lobbyQoSSearchStage5 )
	Lobby.Process.AddActions( lobbyQoSSearchStage5, lobbyQoSJoinStage5, searchDelay6, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage5, matchmakingEndJoin, searchDelay6, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay6, lobbyQoSSearchStage6 )
	Lobby.Process.AddActions( lobbyQoSSearchStage6, lobbyQoSJoinStage6, canHostServer, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage6, matchmakingEndJoin, canHostServer, interruptErrorMsg )
	Lobby.Process.AddActions( canHostServer, skipAdvertiseDvar, redoSearchDelay, interruptErrorMsg )
	Lobby.Process.AddActions( redoSearchDelay, resetSearch, resetSearch, resetSearch )
	Lobby.Process.AddActions( resetSearch, lobbyQoSSearchStage1, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( skipAdvertiseDvar, hostingEvent, matchmakingEndAdvertise, matchmakingEndAdvertise )
	Lobby.Process.AddActions( matchmakingEndAdvertise, lobbyAdvertise, interruptErrorMsg, interruptErrorMsg )
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
		local maxPlayers = math.min( toTarget.maxClients, Dvar.party_maxplayers:get() )
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, maxPlayers )
	end
	
	local endMoveProcess = function ()
		local maxPlayers = math.min( toTarget.maxClients, Dvar.party_maxplayers:get() )
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, maxPlayers )
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local resetSearchProcess = function ( resetSearchInfo )
		Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.PUBLIC, resetSearchInfo )
	end
	
	local isFullParty = function ()
		if toTarget.maxClients <= Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_ALL ) then
			return true
		else
			return false
		end
	end
	
	resetSearchProcess( true )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local waitForJoiningClients = Lobby.Actions.WaitForJoiningClients( 5000 )
	local startMove = Lobby.Actions.ExecuteScript( startMoveProcess )
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local makeCancellable = Lobby.Actions.SetQueueCancellable( true )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
	local skipSearch = Lobby.Actions.IsButtonPressed( controller, "BUTTON_X" )
	local fullPartySkipSearch = Lobby.Actions.EvaluateFunction( isFullParty )
	local lobbyQoSSearchStage1 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage2 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage3 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSJoinStage1 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage1 )
	local lobbyQoSJoinStage2 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage2 )
	local lobbyQoSJoinStage3 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage3 )
	local searchDelay2 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local searchDelay3 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local canHostServer = Lobby.Actions.CanHostServer( controller, toTarget )
	local redoSearchDelay = Lobby.Actions.TimeDelay( 1500 )
	local resetSearch = Lobby.Actions.ExecuteScript( resetSearchProcess, false )
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
	Lobby.Process.AddActions( closeSpinner, makeCancellable, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( makeCancellable, skipSearch, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( skipSearch, lobbyAdvertise, fullPartySkipSearch, fullPartySkipSearch )
	Lobby.Process.AddActions( fullPartySkipSearch, lobbyAdvertise, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, searchDelay2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, endMove, searchDelay2, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay2, lobbyQoSSearchStage2 )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, searchDelay3, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, endMove, searchDelay3, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay3, lobbyQoSSearchStage3 )
	Lobby.Process.AddActions( lobbyQoSSearchStage3, lobbyQoSJoinStage3, canHostServer, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage3, endMove, canHostServer, interruptErrorMsg )
	Lobby.Process.AddActions( canHostServer, lobbyAdvertise, redoSearchDelay, interruptErrorMsg )
	Lobby.Process.AddActions( redoSearchDelay, resetSearch, resetSearch, resetSearch )
	Lobby.Process.AddActions( resetSearch, lobbyQoSSearchStage1, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
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
	local skipMatchmakingSearch = false
	local f50_local0 = toTarget.id
	local f50_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
	if f50_local0 == f50_local1.id and Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.doaSkipSearch" ) ) then
		skipMatchmakingSearch = true
	end
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
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, Dvar.party_maxplayers:get() )
	end
	
	local endMoveProcess = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local resetSearchProcess = function ( resetSearchInfo )
		local cpPublicLobbySearchAllModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.cpPublicLobbySearchAll" )
		local searchAll = Engine.GetModelValue( cpPublicLobbySearchAllModel )
		if searchAll == true then
			Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.PUBLIC_CP_ALL, resetSearchInfo )
		else
			Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SearchMode.PUBLIC, resetSearchInfo )
		end
	end
	
	resetSearchProcess( true )
	local openSpinner = Lobby.Actions.OpenSpinner( true )
	local closeSpinner = Lobby.Actions.CloseSpinner()
	local waitForJoiningClients = Lobby.Actions.WaitForJoiningClients( 5000 )
	local startMove = Lobby.Actions.ExecuteScript( startMoveProcess )
	local endMove = Lobby.Actions.ExecuteScript( endMoveProcess )
	local lobbySettings = Lobby.Actions.LobbySettings( controller, toTarget )
	local updateUI = Lobby.Actions.UpdateUI( controller, toTarget )
	local runPlaylistSettings = Lobby.Actions.RunPlaylistSettings( controller )
	local skipSearchButtonPress = Lobby.Actions.IsButtonPressed( controller, "BUTTON_X" )
	local skipSearch = Lobby.Actions.IsConditionTrue( skipMatchmakingSearch )
	local lobbyQoSSearchStage1 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage2 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSSearchStage3 = Lobby.Actions.SearchForLobby( controller )
	local lobbyQoSJoinStage1 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage1 )
	local lobbyQoSJoinStage2 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage2 )
	local lobbyQoSJoinStage3 = Lobby.Actions.QoSJoinSearchResults( controller, lobbyQoSSearchStage3 )
	local searchDelay2 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local searchDelay3 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local canHostServer = Lobby.Actions.CanHostServer( controller, toTarget )
	local redoSearchDelay = Lobby.Actions.TimeDelay( 1500 )
	local resetSearch = Lobby.Actions.ExecuteScript( resetSearchProcess, false )
	local lobbyAdvertise = Lobby.Actions.AdvertiseLobby( true )
	local hostingEvent = Lobby.Actions.ExecuteScript( hostingLobby )
	local process = {
		head = openSpinner,
		interrupt = interruptBack,
		force = false,
		cancellable = true
	}
	Lobby.Process.AddActions( openSpinner, waitForJoiningClients, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( waitForJoiningClients, startMove, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( startMove, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, runPlaylistSettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( runPlaylistSettings, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( closeSpinner, skipSearchButtonPress, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( skipSearchButtonPress, lobbyAdvertise, skipSearch, skipSearch )
	Lobby.Process.AddActions( skipSearch, canHostServer, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
	Lobby.Process.AddActions( lobbyQoSSearchStage1, lobbyQoSJoinStage1, searchDelay2, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage1, endMove, searchDelay2, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay2, lobbyQoSSearchStage2 )
	Lobby.Process.AddActions( lobbyQoSSearchStage2, lobbyQoSJoinStage2, searchDelay3, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage2, endMove, searchDelay3, interruptErrorMsg )
	Lobby.Process.ForceAction( searchDelay3, lobbyQoSSearchStage3 )
	Lobby.Process.AddActions( lobbyQoSSearchStage3, lobbyQoSJoinStage3, canHostServer, interruptErrorMsg )
	Lobby.Process.AddActions( lobbyQoSJoinStage3, endMove, canHostServer, interruptErrorMsg )
	Lobby.Process.AddActions( canHostServer, lobbyAdvertise, redoSearchDelay, interruptErrorMsg )
	Lobby.Process.AddActions( redoSearchDelay, resetSearch, resetSearch, resetSearch )
	Lobby.Process.AddActions( resetSearch, lobbyQoSSearchStage1, lobbyQoSSearchStage1, lobbyQoSSearchStage1 )
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
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isPrivateHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isAdvertised = Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME )
	local gameLobbyRemoteClientCount = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_REMOTE )
	local privateLobbyRemoteClientCount = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_REMOTE )
	local f55_local0 = fromTarget.id
	local f55_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
	if f55_local0 ~= f55_local1.id then
		f55_local0 = fromTarget.id
		f55_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_PUBLIC )
		if f55_local0 ~= f55_local1.id then
			f55_local0 = fromTarget.id
			f55_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
			if f55_local0 ~= f55_local1.id then
				f55_local0 = fromTarget.id
				f55_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
				if f55_local0 ~= f55_local1.id then
					f55_local0 = false
				end
			end
		end
	end
	local isPublicLobby = true
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
	local emptyAction = Lobby.Actions.EmptyAction()
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
		process.head = openSpinner
		Lobby.Process.AddActions( openSpinner, stopLobbyTimer, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( stopLobbyTimer, emptyAction, closeSpinner, interruptErrorMsg )
		lastAction = emptyAction
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LuaEnum.LEAVE_WITH_PARTY.WITH then
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
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LuaEnum.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
		Lobby.Process.AddActions( lastAction, endGameClient, interruptErrorMsg, interruptErrorMsg )
		lastAction = endGameClient
	end
	if isPrivateHost == true then
		if privateLobbyCount > 1 and withParty == LuaEnum.LEAVE_WITH_PARTY.WITHOUT then
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
	if toTarget.name == LuaEnum.UI.MODE_SELECT_LAN and false == CoDShared.IsDirectorEnabled() and Engine.GetDvarInt( "mp_prototype" ) ~= 0 and Engine.IsUsingCursor() and Engine.GetDvarBool( "ui_usingFreeCursor" ) then
		Lobby.Process.AddActions( lobbySettings, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	else
		Lobby.Process.AddActions( lobbySettings, updateUI, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	end
	return process
end

Lobby.ProcessNavigate.ReloadGameLobby = function ( controller, minSearchDelay, maxSearchDelay )
	local currentTarget = LobbyData.GetCurrentMenuTarget()
	local backTarget = LobbyData.GetLobbyMenuByName( currentTarget.backTarget )
	local leaveGameLobbyProcess = Lobby.ProcessNavigate.LeaveGameLobby( controller, currentTarget, currentTarget, LuaEnum.LEAVE_WITH_PARTY.WITH )
	local searchDelay = 0
	if minSearchDelay > 0 and maxSearchDelay > 0 and minSearchDelay <= maxSearchDelay then
		searchDelay = math.random( minSearchDelay, maxSearchDelay )
	end
	local createGameLobbyProcess = Lobby.ProcessNavigate.CreatePublicGameLobby( controller, backTarget, currentTarget, searchDelay )
	local process = leaveGameLobbyProcess
	Lobby.Process.AppendProcess( process, createGameLobbyProcess )
	return process
end

Lobby.ProcessNavigate.ChangeToCPLANCustomGameLobby = function ( controller, fromTarget, toTarget, withParty )
	local params = {
		controller = controller,
		errorTarget = toTarget
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
	
	local stopLobbyTimer = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = controller,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = toTarget.mainMode
	}, true, false, false )
	local startTimer = Lobby.Actions.ExecuteScript( hostingLobby )
	local openSpinner = Lobby.Actions.OpenSpinner()
	local closeSpinner = Lobby.Actions.CloseSpinner()
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
		Lobby.Process.AddActions( openSpinner, startTimer, interruptErrorMsg, interruptErrorMsg )
		lastAction = startTimer
	else
		process.head = openSpinner
		lastAction = openSpinner
	end
	Lobby.Process.AddActions( lastAction, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	return process
end

Lobby.ProcessNavigate.LeaveCPLANGameLobby = function ( controller, fromTarget, toTarget, withParty )
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
		Engine.SetGametype( Lobby.ProcessNavigate.SwitchLobbiesGetGametype( controller, toTarget ) )
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
	local restoreMap = Lobby.Actions.SetSavedOrDefaultMap( controller, toTarget )
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
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LuaEnum.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
		Lobby.Process.AddActions( lastAction, stopPublic, interruptErrorMsg, interruptErrorMsg )
		Lobby.Process.AddActions( stopPublic, startTimer, interruptErrorMsg, interruptErrorMsg )
		lastAction = startTimer
	else
		process.head = openSpinner
		lastAction = openSpinner
		if isPrivateHost == true and privateLobbyCount > 1 and withParty == LuaEnum.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( lastAction, leaveWithParty, interruptErrorMsg, interruptErrorMsg )
			lastAction = leaveWithParty
		end
	end
	Lobby.Process.AddActions( lastAction, lobbySettings, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( lobbySettings, restoreMap, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( restoreMap, updateUI, interruptErrorMsg, interruptErrorMsg )
	Lobby.Process.AddActions( updateUI, closeSpinner, interruptErrorMsg, interruptErrorMsg )
	return process
end

