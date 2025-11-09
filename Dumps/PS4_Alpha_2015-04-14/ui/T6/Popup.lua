CoD.Popup = {}
CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME = 30000
if CoD.isPS3 then
	CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME = 40000
end
if CoD.isXbox then
	CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME = 60000
end
CoD.Popup.Type = {}
CoD.Popup.Type.REGULAR = 1
CoD.Popup.Type.WIDE = 2
CoD.Popup.Type.STRETCHED = 3
CoD.Popup.StretchedWidth = CoD.Menu.SmallPopupWidth
CoD.Popup.StretchedHeight = CoD.Menu.SmallPopupHeight
if CoD.isZombie == true then
	CoD.Popup.StretchedWidth = CoD.Menu.SmallPopupWidth
	CoD.Popup.StretchedHeight = 300
end
LUI.createMenu.popup_busy = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_busy", controller )
	return popup
end

LUI.createMenu.popup_joinsession = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_joinsession", controller )
	popup.title:setText( Engine.Localize( "MENU_JOINING_SESSION_IN_PROGRESS" ) )
	return popup
end

LUI.createMenu.popup_reconnectingtoparty = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_reconnectingtoparty", controller )
	popup:registerEventHandler( "menu_changed", CoD.Menu.MenuChanged )
	popup.title:setText( Engine.Localize( "MENU_RECONNECTING_TO_PARTY_CAPS" ) )
	return popup
end

LUI.createMenu.popup_gettingdata = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_gettingdata", controller )
	popup.title:setText( Engine.Localize( "MENU_DOWNLOADING_GAME_SETTINGS_CAPS" ) )
	return popup
end

LUI.createMenu.popup_gettingUCDdata = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_gettingUCDdata", controller )
	popup.title:setText( Engine.Localize( "MPUI_GETTING_UCD_DATA" ) )
	return popup
end

LUI.createMenu.popup_profilelookup = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_profilelookup", controller )
	popup.title:setText( Engine.Localize( "PLATFORM_PROFILE_LOOKUP" ) )
	return popup
end

LUI.createMenu.popup_contentrestricted = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_contentrestricted", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "PLATFORM_FILESHARE_ACCESSERROR_MSG" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_signintolive = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_signintolive", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "XBOXLIVE_SIGNEDOUTOFLIVE" ) )
	popup:addBackButton()
	return popup
end

CoD.Popup.DirectToStoreBackButtonPressed = function ( self, event )
	local categorymenu = self.occludedMenu
	self:goBack( event.controller )
	CoD.ButtonList.EnableInput( categorymenu.categoryButtonList )
	categorymenu.categoryContainer:animateToState( "default" )
	categorymenu.categoryButtonList:restoreState()
end

CoD.Popup.GoToStore = function ( self, event )
	local categoryMenu = self.occludedMenu
	self:goBack( event.controller )
	categoryMenu:goBack( event.controller )
	CoD.MainLobby.OpenStore( categoryMenu.occludedMenu, event )
end

LUI.createMenu.popup_directtostore = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "popup_directtostore", controller )
	popup:setWidthHeight( 620, 380 )
	if CoD.perController[controller].dlcRequiredPopupTitle ~= nil and CoD.perController[controller].dlcRequiredPopupDesc ~= nil then
		popup.title:setText( Engine.Localize( CoD.perController[controller].dlcRequiredPopupTitle ) )
		popup.msg:setText( Engine.Localize( CoD.perController[controller].dlcRequiredPopupDesc ) )
	end
	popup:addBackButton()
	popup:registerEventHandler( "button_prompt_back", CoD.Popup.DirectToStoreBackButtonPressed )
	popup:registerEventHandler( "gotostore", CoD.Popup.GoToStore )
	popup.choiceA:setLabel( Engine.Localize( "MENU_GO_TO_STORE" ) )
	popup.choiceA:setActionEventName( "gotostore" )
	popup.choiceA:processEvent( {
		name = "gain_focus"
	} )
	if popup.choiceB then
		popup.choiceB:close()
	end
	return popup
end

LUI.createMenu.popup_partymissingmappack = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "popup_partymissingmappack", controller )
	popup:setWidthHeight( 620, 300 )
	popup.title:setText( Engine.Localize( "MENU_DLC3_REQUIRED" ) )
	popup.msg:setText( Engine.Localize( "MPUI_DLC_WARNING_PARTY_MISSING_MAP_PACK" ) )
	popup:addBackButton()
	popup:registerEventHandler( "button_prompt_back", CoD.Popup.DirectToStoreBackButtonPressed )
	if popup.selectButton then
		popup.selectButton:close()
	end
	return popup
end

LUI.createMenu.popup_guest_contentrestricted = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_contentrestricted", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "MENU_GUEST_CONTENT_RESTRICTED" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_chatrestricted = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_chatrestricted", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "PLATFORM_CHAT_DISABLED" ) )
	popup.anyControllerAllowed = true
	popup.primaryButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), popup, "restriction_accepted" )
	popup:addLeftButtonPrompt( popup.primaryButton )
	popup:addBackButton()
	popup:registerEventHandler( "restriction_accepted", CoD.Popup.ChatRestrictionAccepted )
	return popup
end

CoD.Popup.ChatRestrictionAccepted = function ( self, event )
	self:goBack( self, event.controller )
	if self.callingMenu ~= nil then
		CoD.MainMenu.OpenMainLobby( self.callingMenu, event )
	end
end

LUI.createMenu.popup_chatrestrictedinvite = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_chatrestrictedinvite", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "PLATFORM_CHAT_DISABLED" ) )
	popup.anyControllerAllowed = true
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_render_complete = function ( controller, userData )
	local popup = CoD.Popup.SetupPopup( "popup_render_complete", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( userData.message )
	popup.anyControllerAllowed = true
	popup.primaryButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), popup, "render_complete_accepted" )
	popup:addLeftButtonPrompt( popup.primaryButton )
	popup:registerEventHandler( "render_complete_accepted", CoD.Popup.RenderCompleteAccepted )
	return popup
end

CoD.Popup.RenderCompleteAccepted = function ( self, event )
	self:goBack( self, event.controller )
end

LUI.createMenu.popup_bookmarked = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_bookmarked", controller )
	popup.title:setText( Engine.Localize( "MENU_BOOKMARKED_HEADER" ) )
	popup.msg:setText( Engine.Localize( "MENU_BOOKMARKED_MESSAGE" ) )
	popup.anyControllerAllowed = true
	popup.primaryButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), popup, "bookmark_accepted" )
	popup:addLeftButtonPrompt( popup.primaryButton )
	popup:registerEventHandler( "bookmark_accepted", CoD.Popup.BookmarkAccepted )
	Engine.PlaySound( "cac_loadout_edit_sel" )
	return popup
end

CoD.Popup.BookmarkAccepted = function ( self, event )
	self:goBack( self, event.controller )
end

LUI.createMenu.popup_xboxlive_lobbyended = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_xboxlive_lobbyended", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "XBOXLIVE_LOBBYENDED" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_xboxlive_partyended = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_xboxlive_partyended", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( Engine.DvarString( nil, "partyend_reason" ) ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_net_connection = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_net_connection", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "XBOXLIVE_NETCONNECTION" ) )
	popup:addBackButton()
	popup.anyControllerAllowed = true
	return popup
end

LUI.createMenu.popup_net_connection_store = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_net_connection_store", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "XBOXLIVE_NETCONNECTION_STORE" ) )
	popup:addBackButton()
	popup.anyControllerAllowed = true
	return popup
end

LUI.createMenu.popup_fetchstats = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_fetchstats", controller )
	popup.title:setText( Engine.Localize( "MENU_FETCH_STATS" ) )
	popup.anyControllerAllowed = true
	return popup
end

LUI.createMenu.popup_fetchstats_failed = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_fetchstats_failed", controller )
	popup.title:setText( Engine.Localize( "MENU_FETCH_STATS_FAILED_TITLE" ) )
	popup.msg:setText( Engine.Localize( "MENU_FETCH_STATS_FAILED" ) )
	popup:addBackButton()
	popup.anyControllerAllowed = true
	return popup
end

LUI.createMenu.popup_downloading = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_downloading", controller )
	popup.title:setText( Engine.Localize( "MENU_DOWNLOADING" ) )
	popup.anyControllerAllowed = true
	return popup
end

LUI.createMenu.popup_downloading_failed = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_downloading_failed", controller )
	popup:addBackButton()
	popup.title:setText( Engine.Localize( "MENU_DOWNLOADING_FAILED" ) )
	popup.anyControllerAllowed = true
	return popup
end

LUI.createMenu.popup_cacimportfailed = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_cacimportfailed", controller )
	popup.title:setText( Engine.Localize( "MENU_CAC_IMPORT" ) )
	popup.msg:setText( Engine.Localize( "MENU_CAC_IMPORT_FAILURE" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_acceptinvite_warning = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "popup_acceptinvite_warning", controller )
	popup.title:setText( Engine.Localize( "MENU_ACCEPTINVITETITLE" ) )
	local InPrivateParty = Engine.PrivatePartyHost()
	local AloneInPrivatePartyIgnoreSplitscreen = Engine.AloneInPrivatePartyIgnoreSplitscreen( true )
	local InLobby = Engine.InLobby()
	if Engine.PrivatePartyHost() and not Engine.AloneInPrivatePartyIgnoreSplitscreen( true ) then
		popup.msg:setText( Engine.Localize( "MENU_LEAVEMPGAMEWARNINGSQUADHOST" ) )
	elseif not Engine.PrivatePartyHost() and not Engine.InLobby() then
		popup.msg:setText( Engine.Localize( "MENU_LEAVESQUADWARNING" ) )
	elseif not Engine.PrivatePartyHost() and Engine.InLobby() then
		popup.msg:setText( Engine.Localize( "MENU_LEAVEMPGAMEWARNING" ) )
	end
	popup.choiceA:setLabel( Engine.Localize( "MENU_RESUMEGAME" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_ACCEPTINVITE" ) )
	popup.choiceB:setActionEventName( "acceptinvite" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "acceptinvite", CoD.Popup.AcceptInvite )
	return popup
end

CoD.Popup.AcceptInvite = function ( popup, event )
	Engine.Exec( event.controller, "acceptinvite" )
	popup:goBack( event.controller )
end

LUI.createMenu.popup_connectingdw_ps3 = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_connectingdw_ps3", controller )
	popup.anyControllerAllowed = true
	popup.title:setText( Engine.Localize( "MENU_CONNECTING_DW" ) )
	return popup
end

LUI.createMenu.popup_connectingdw = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "popup_connectingdw", controller )
	popup.disableBlur = true
	popup.anyControllerAllowed = true
	popup.title:setText( Engine.Localize( "MENU_CONNECTING_DW" ) )
	popup:registerEventHandler( "is_demonware_fetching_done", CoD.Popup.IsDemonwareFetchingDone )
	popup:addBackButton()
	local timer = LUI.UITimer.new( 400, "is_demonware_fetching_done", false )
	timer.controller = controller
	timer.timeElapsedSinceStart = 0
	popup:addElement( timer )
	return popup
end

CoD.Popup.IsDemonwareFetchingDone = function ( self, event )
	if Engine.IsDemonwareFetchingDone( event.timer.controller ) then
		if CoD.isWIIU then
			if Engine.IsSignedInToDemonware( event.timer.controller ) == true then
				self:goBack( self, event.timer.controller )
				self.occludedMenu:processEvent( {
					name = "open_main_lobby_requested",
					controller = event.timer.controller
				} )
			end
			Engine.Exec( event.timer.controller, "loginpopupclosed" )
		else
			Engine.Exec( event.timer.controller, "checkForPS3Invites" )
			self:goBack( self, event.timer.controller )
			if self.callingMenu ~= nil then
				event.controller = event.timer.controller
				if self.inviteAccepted == nil then
					if self.OpenPrivateLobbyMenu == true then
						CoD.MainMenu.OpenPrivateLobbyMenu( self.callingMenu, event )
					elseif self.openingStore == nil or self.openingStore == false then
						CoD.MainMenu.OpenMainLobbyRequested( self.callingMenu, event )
					else
						CoD.MainLobby.OpenStore( self.callingMenu, event )
					end
				end
			end
		end
	end
	local netConnection = true
	if CoD.isPS3 then
		netConnection = Engine.CheckNetConnection()
	end
	if event.timer.timeElapsedSinceStart > CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME or netConnection == false then
		self:goBack( self, event.timer.controller )
		Dvar.ui_errorTitle:set( "@MENU_NOTICE_CAPS" )
		if netConnection == false then
			Dvar.ui_errorMessage:set( "@XBOXLIVE_NETCONNECTION" )
		else
			Dvar.ui_errorMessage:set( "@PLATFORM_DEMONWARE_DISCONNECT" )
		end
		self.occludedMenu:processEvent( {
			name = "open_error_popup",
			controller = event.timer.controller
		} )
		if CoD.isWIIU then
			Engine.Exec( event.timer.controller, "loginpopupclosed" )
		end
		CoD.LobbyBase.FailedDWConnection = true
	end
	event.timer.timeElapsedSinceStart = event.timer.timeElapsedSinceStart + event.timeElapsed
end

LUI.createMenu.popup_controllerremoved = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_controllerremoved", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "PLATFORM_CONTROLLER_DISCONNECTED" ) .. Engine.DvarString( nil, "disconnected_ctrls" ) )
	popup:addBackButton()
	popup.anyControllerAllowed = true
	popup.m_ownerController = nil
	return popup
end

LUI.createMenu.popup_public_inprobation = function ( controller )
	local popup = CoD.Popup.SetupProbationPopup( "popup_public_inprobation", controller, CoD.GAMEMODE_PUBLIC_MATCH )
	popup.title:setText( Engine.Localize( "MENU_PROBATION" ) )
	popup.msg:setText( Engine.Localize( "MENU_PROBATION_IN_PUBLIC_MATCH" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_public_givenprobation = function ( controller )
	local popup = CoD.Popup.SetupProbationPopup( "popup_public_partyprobation", controller, CoD.GAMEMODE_PUBLIC_MATCH )
	popup.title:setText( Engine.Localize( "MENU_PROBATION" ) )
	popup.msg:setText( Engine.Localize( "MENU_PROBATION_GIVEN_PUBLIC_MATCH" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_public_partyprobation = function ( controller )
	local popup = CoD.Popup.SetupPartyProbationPopup( "popup_public_givenprobation", controller, CoD.GAMEMODE_PUBLIC_MATCH )
	popup.title:setText( Engine.Localize( "MENU_PROBATION" ) )
	popup.msg:setText( Engine.Localize( "MENU_PROBATION_PARTY_PUBLIC_MATCH" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_league_inprobation = function ( controller )
	local popup = CoD.Popup.SetupProbationPopup( "popup_league_inprobation", controller, CoD.GAMEMODE_LEAGUE_MATCH )
	popup.title:setText( Engine.Localize( "MENU_PROBATION" ) )
	popup.msg:setText( Engine.Localize( "MENU_PROBATION_IN_LEAGUE_MATCH" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_league_givenprobation = function ( controller )
	local popup = CoD.Popup.SetupProbationPopup( "popup_league_givenprobation", controller, CoD.GAMEMODE_LEAGUE_MATCH )
	popup.title:setText( Engine.Localize( "MENU_PROBATION" ) )
	popup.msg:setText( Engine.Localize( "MENU_PROBATION_GIVEN_LEAGUE_MATCH" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_league_partyprobation = function ( controller )
	local popup = CoD.Popup.SetupPartyProbationPopup( "popup_league_partyprobation", controller, CoD.GAMEMODE_LEAGUE_MATCH )
	popup.title:setText( Engine.Localize( "MENU_PROBATION" ) )
	popup.msg:setText( Engine.Localize( "MENU_PROBATION_PARTY_LEAGUE_MATCH" ) )
	popup:addBackButton()
	return popup
end

CoD.Popup.ClearCustomGameLeaderboard = function ( self, event )
	Engine.ExecNow( event.controller, "ClearCustomLeaderboards" )
	CoD.LeaderboardMP.FilterChanged( self.lbMenu, event )
	self:goBack( event.controller )
end

CoD.Popup.CancelClearCustomGameLeaderboard = function ( popup, event )
	popup:goBack( event.controller )
end

LUI.createMenu.popup_clear_custom_leaderboards = function ( controller, lbMenu )
	local popup = CoD.Popup.SetupPopup( "popup_clear_custom_leaderboards", controller )
	popup.lbMenu = lbMenu
	popup.anyControllerAllowed = true
	popup.title:setText( Engine.Localize( "MENU_CLEAR_CONFIRMATION_TITLE" ) )
	popup.msg:setText( Engine.Localize( "MENU_CLEAR_CONFIRMATION_MESSAGE" ) )
	popup:addSelectButton()
	popup:addBackButton()
	popup.backButtonPrompt = CoD.ButtonPrompt.new( "select", "", popup, "button_prompt_back", true )
	popup.startButtonPrompt = CoD.ButtonPrompt.new( "start", "", popup, "button_prompt_back", true )
	popup:addRightButtonPrompt( popup.backButtonPrompt )
	popup:addRightButtonPrompt( popup.startButtonPrompt )
	popup.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		bottom = 0
	} )
	local yesButton = popup.buttonList:addButton( Engine.Localize( "MENU_YES" ) )
	yesButton:setActionEventName( "clear_custom_game_leaderboards" )
	local noButton = popup.buttonList:addButton( Engine.Localize( "MENU_NO" ) )
	noButton:setActionEventName( "cancel_clear_custom_game_leaderboards" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	popup:addElement( popup.buttonList )
	popup:registerEventHandler( "clear_custom_game_leaderboards", CoD.Popup.ClearCustomGameLeaderboard )
	popup:registerEventHandler( "cancel_clear_custom_game_leaderboards", CoD.Popup.CancelClearCustomGameLeaderboard )
	return popup
end

local Dev_ClearProbation = function ( popup, event )
	Engine.DevOnlyClearProbation( event.controller )
	popup:goBack( event.controller )
end

local Dev_AcceptProbation = function ( popup, event )
	popup:goBack( event.controller )
end

LUI.createMenu.popup_dev_clearprobation = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_league_givenprobation", controller )
	popup.anyControllerAllowed = true
	popup.title:setText( Engine.Localize( "MENU_PROBATION" ) )
	popup.msg:setText( "DEV ONLY:  You have just been given probation.  Would you like to clear it?" )
	popup:addSelectButton()
	popup:addBackButton()
	popup.backButtonPrompt = CoD.ButtonPrompt.new( "select", "", popup, "button_prompt_back", true )
	popup.startButtonPrompt = CoD.ButtonPrompt.new( "start", "", popup, "button_prompt_back", true )
	popup:addRightButtonPrompt( popup.backButtonPrompt )
	popup:addRightButtonPrompt( popup.startButtonPrompt )
	popup.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		bottom = 0
	} )
	local yesButton = popup.buttonList:addButton( Engine.Localize( "MENU_YES" ) )
	yesButton:setActionEventName( "probation_dev_clearprobation" )
	local noButton = popup.buttonList:addButton( Engine.Localize( "MENU_NO" ) )
	noButton:setActionEventName( "probation_dev_acceptprobation" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	popup:addElement( popup.buttonList )
	popup:registerEventHandler( "probation_dev_clearprobation", Dev_ClearProbation )
	popup:registerEventHandler( "probation_dev_acceptprobation", Dev_AcceptProbation )
	return popup
end

CoD.Popup.SetupProbationQuitPopup = function ( popupName, controller )
	local popup = CoD.Popup.SetupPopup( "popup_probation_quit_warning", controller )
	CoD.Popup.AddProbationWarningIcon( popup )
	popup.title:setText( Engine.Localize( "MENU_PROBATION_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_PROBATION_QUIT_WARNING" ) )
	popup:addSelectButton()
	popup:addBackButton()
	popup.backButtonPrompt = CoD.ButtonPrompt.new( "select", "", popup, "button_prompt_back", true )
	popup.startButtonPrompt = CoD.ButtonPrompt.new( "start", "", popup, "button_prompt_back", true )
	popup:addRightButtonPrompt( popup.backButtonPrompt )
	popup:addRightButtonPrompt( popup.startButtonPrompt )
	popup.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		bottom = 0
	} )
	local yesButton = popup.buttonList:addButton( Engine.Localize( "MENU_YES" ) )
	yesButton:setActionEventName( "probation_YesButtonPressed" )
	local noButton = popup.buttonList:addButton( Engine.Localize( "MENU_NO" ) )
	noButton:setActionEventName( "probation_NoButtonPressed" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	popup:addElement( popup.buttonList )
	return popup
end

CoD.Popup.ProbationNoButtonPressed = function ( popup, event )
	popup:setPreviousMenu( nil )
	popup:goBack( event.controller )
end

LUI.createMenu.popup_probation_quit_warning = function ( controller )
	local popup = CoD.Popup.SetupProbationQuitPopup( "popup_probation_quit_warning", controller )
	popup:registerEventHandler( "probation_quit_accepted", CoD.EndGamePopup.FinishEndGame )
	popup:registerEventHandler( "probation_YesButtonPressed", CoD.EndGamePopup.FinishEndGame )
	popup:registerEventHandler( "probation_NoButtonPressed", CoD.Popup.ProbationNoButtonPressed )
	return popup
end

LUI.createMenu.popup_probation_join_quit_warning = function ( controller )
	local popup = CoD.Popup.SetupProbationQuitPopup( "popup_probation_join_quit_warning", controller )
	popup:registerEventHandler( "probation_quit_accepted", function ( self, event )
		self.occludedMenu:processEvent( {
			name = "probation_confirmation",
			controller = event.controller
		} )
	end )
	popup:registerEventHandler( "probation_YesButtonPressed", function ( self, event )
		self.occludedMenu:processEvent( {
			name = "probation_confirmation",
			controller = event.controller
		} )
	end )
	popup:registerEventHandler( "probation_NoButtonPressed", CoD.FriendsListPopup.NoJoinButtonPressed )
	return popup
end

LUI.createMenu.popup_probation_dashboard_warning = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_probation_dashboard_warning", controller )
	CoD.Popup.AddProbationWarningIcon( popup )
	popup.title:setText( Engine.Localize( "MENU_PROBATION_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_PROBATION_DASHBOARD_WARNING" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_dev_probation_dashboard_warning = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_dev_probation_dashboard_warning", controller )
	popup.anyControllerAllowed = true
	CoD.Popup.AddProbationWarningIcon( popup )
	popup.title:setText( Engine.Localize( "MENU_PROBATION_WARNING" ) .. "DEV ONLY" )
	popup.msg:setText( Engine.Localize( "Probation code thinks you did not finish your last game." ) )
	popup:addBackButton()
	return popup
end

CoD.Popup.AddProbationWarningIcon = function ( popup )
	local warningIconWidth = 32
	local warningIconTop = 9
	local titleTextLeft = 3
	popup.warningIcon = LUI.UIImage.new()
	popup.warningIcon:setLeftRight( true, false, 0, warningIconWidth )
	popup.warningIcon:setTopBottom( true, false, warningIconTop, warningIconTop + warningIconWidth )
	popup.warningIcon:setImage( RegisterMaterial( "cac_restricted" ) )
	popup.warningIcon:setAlpha( 0.5 )
	popup:addElement( popup.warningIcon )
	local warningIconLeft = -150
	popup.title:setLeftRight( true, false, titleTextLeft + warningIconWidth, titleTextLeft + warningIconWidth + CoD.Menu.SmallPopupWidth )
end

CoD.Popup.CloseProbationPopup = function ( self, event )
	self:goBack()
end

CoD.Popup.SetupPartyProbationPopup = function ( popupName, controller, gamemode )
	local popup = CoD.Popup.SetupPopup( popupName, controller )
	local top = -80 - CoD.textSize.Default
	local text = ""
	local first = true
	local violators = Engine.GetPartyMembersInProbation( controller, gamemode )
	for index, player in pairs( violators ) do
		if first == true then
			text = player.name
		else
			text = text .. ", " .. player.name
		end
	end
	local playersText = LUI.UIText.new()
	playersText:setLeftRight( true, true, 0, 0 )
	playersText:setTopBottom( false, true, top - CoD.textSize.Default / 2, top + CoD.textSize.Default / 2 )
	playersText:setFont( CoD.fonts.Default )
	playersText:setText( text )
	playersText:setAlignment( LUI.Alignment.Left )
	popup:addElement( playersText )
	return popup
end

CoD.Popup.SetupProbationPopup = function ( popupName, controller, gamemode )
	local popup = CoD.Popup.SetupPopup( popupName, controller )
	local top = -48 - CoD.textSize.Default
	local text = Engine.Localize( "MENU_PROBATION_TIME_REMAINING" )
	local timeText = LUI.UIText.new()
	timeText:setLeftRight( true, true, 0, 0 )
	timeText:setTopBottom( false, true, top - CoD.textSize.Default / 2, top + CoD.textSize.Default / 2 )
	timeText:setFont( CoD.fonts.Default )
	timeText:setText( text )
	timeText:setAlignment( LUI.Alignment.Left )
	popup:addElement( timeText )
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( text, CoD.fonts.Default, CoD.textSize.Default )
	local textWidth = textRight - textLeft + 5
	local time = LUI.UIText.new()
	time:setLeftRight( true, false, textWidth, textWidth + 1280 )
	time:setTopBottom( false, true, top - CoD.textSize.Default / 2, top + CoD.textSize.Default / 2 )
	time:setFont( CoD.fonts.Default )
	time:setAlignment( LUI.Alignment.Left )
	CoD.CountdownTimer.Setup( time, 0, true )
	popup:addElement( time )
	time:addTimedParentEvent( 1, "time_close_popup" )
	popup:registerEventHandler( "time_close_popup", CoD.Popup.CloseProbationPopup )
	local seconds = Engine.GetProbationTime( controller, gamemode )
	time:setTimeLeft( seconds * 1000 )
	return popup
end

CoD.Popup.SetupPopup = function ( popupName, controller, popupType )
	local popup = CoD.Popup.CreatePopup( popupName, popupType )
	popup:setOwner( controller )
	popup:registerEventHandler( "menu_changed", CoD.Popup.MenuChanged )
	popup:registerEventHandler( "close_popup", CoD.Popup.Close )
	local top = 0
	local title = LUI.UIText.new()
	local popupWidth = CoD.Menu.SmallPopupWidth
	title:setLeftRight( true, true, 0, 0 )
	title:setTopBottom( true, false, top, top + CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	title:setAlignment( LUI.Alignment.Left )
	popup.title = title
	popup:addElement( title )
	top = top + CoD.textSize.Big + 10
	local msg = LUI.UIText.new()
	msg:setLeftRight( true, true, 0, 0 )
	if popupType == CoD.Popup.Type.WIDE then
		popupWidth = CoD.Menu.MediumPopupWidth
		msg:setLeftRight( true, false, 0, popupWidth / 2 )
	end
	msg:setTopBottom( true, false, top, top + CoD.textSize.Default )
	msg:setFont( CoD.fonts.Default )
	msg:setAlignment( LUI.Alignment.Left )
	popup.msg = msg
	popup:addElement( msg )
	local rightInfoContainer = LUI.UIElement.new()
	rightInfoContainer:setLeftRight( true, true, popupWidth / 2, 0 )
	rightInfoContainer:setTopBottom( true, true, 0, 0 )
	popup.rightInfoContainer = rightInfoContainer
	popup:addElement( rightInfoContainer )
	return popup
end

CoD.Popup.SetupPopupBusy = function ( popupName, controller, popupType )
	local popup = CoD.Popup.SetupPopup( popupName, controller, popupType )
	local iconHeight = 64
	local iconWidth = 64
	popup.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	popup.spinner:setLeftRight( true, true, CoD.Menu.SmallPopupWidth / 2 - iconWidth / 2, -(CoD.Menu.SmallPopupWidth / 2 - iconWidth / 2) )
	popup.spinner:setTopBottom( true, false, 60, 60 + iconHeight )
	popup.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	popup:addElement( popup.spinner )
	return popup
end

CoD.Popup.SetupPopupChoice = function ( popupName, controller, choiceCount, popupType )
	local popup = CoD.Popup.SetupPopup( popupName, controller, popupType )
	
	local choiceList = CoD.ButtonList.new()
	choiceList:setLeftRight( true, true, 0, 0 )
	choiceList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
	popup:addElement( choiceList )
	popup.choiceList = choiceList
	
	if choiceCount == nil then
		choiceCount = 2
	elseif choiceCount > 5 then
		choiceCount = 5
	end
	for i = 1, choiceCount, 1 do
		local choice = choiceList:addButton( "" )
		choice:setActionEventName( "button_prompt_back" )
		choiceList:addElement( choice )
		if i == 1 then
			popup.choiceA = choice
		end
		if i == 2 then
			popup.choiceB = choice
		end
		if i == 3 then
			popup.choiceC = choice
		end
		if i == 4 then
			popup.choiceD = choice
		end
	end
	popup:addSelectButton()
	return popup
end

CoD.Popup.SetWidthHeight = function ( self, popupWidth, popupHeight )
	local width = CoD.Popup.StretchedWidth
	if popupWidth then
		width = popupWidth
	end
	if Engine.IsInGame() then
		local smallWidth = width / 2 + 25
		local smallHeight = popupHeight / 2 + 10
		local heightOffset = 20
		self.smallPopupBackground:setLeftRight( false, false, -smallWidth, smallWidth )
		self.smallPopupBackground:setTopBottom( false, false, -smallHeight - heightOffset, smallHeight - heightOffset )
		self:setLeftRight( false, false, -width / 2, width / 2 )
		self:setTopBottom( false, false, -popupHeight / 2, popupHeight / 2 )
	elseif self.popupBG then
		self.popupBG:close()
		self:addSmallPopupBackground( nil, width, popupHeight )
	end
end

CoD.Popup.CreatePopup = function ( popupName, popupType )
	local popup = nil
	if popupType == nil then
		popupType = CoD.Popup.Type.REGULAR
	elseif popupType < CoD.Popup.Type.REGULAR or popupType > CoD.Popup.Type.STRETCHED then
		popupType = CoD.Popup.Type.REGULAR
	end
	if popupType == CoD.Popup.Type.WIDE then
		popup = CoD.Menu.NewMediumPopup( popupName )
	elseif popupType == CoD.Popup.Type.STRETCHED then
		popup = CoD.Menu.NewSmallPopup( popupName, nil, nil, CoD.Popup.StretchedWidth, CoD.Popup.StretchedHeight )
	else
		popup = CoD.Menu.NewSmallPopup( popupName )
	end
	popup.setWidthHeight = CoD.Popup.SetWidthHeight
	return popup
end

CoD.Popup.MenuChanged = function ( self, event )
	if self.occludedMenu == event.prevMenu then
		self:setOccludedMenu( event.nextMenu )
	end
end

CoD.Popup.Close = function ( self, event )
	if self.menuName == event.popupName then
		self:goBack()
		return true
	else
		
	end
end

LUI.createMenu.signed_out = function ( controller )
	local errorMenu = LUI.createMenu.Error( controller )
	errorMenu.anyControllerAllowed = true
	errorMenu:setMessage( Engine.Localize( "XBOXLIVE_SIGNINCHANGED" ) )
	return errorMenu
end

