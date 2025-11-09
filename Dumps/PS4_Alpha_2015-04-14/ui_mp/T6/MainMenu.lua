require( "ui.T6.MainLobby" )
require( "ui_mp.T6.Menus.MOTD" )
require( "ui.uieditor.menus.UIEditorMain" )
require( "ui.uieditor.menus.Lobby.Debug.DebugMain" )
require( "ui_mp.T6.Menus.EliteRegistrationPopup" )
require( "ui_mp.T6.Menus.EliteWelcomePopup" )
require( "ui_mp.T6.Menus.EliteMarketingOptInPopup" )
require( "ui_mp.T6.Menus.DLCPopup" )
require( "ui_mp.T6.Menus.VotingPopup" )
require( "ui_mp.T6.Menus.SPReminderPopup" )
require( "ui_mp.T6.Menus.DSPPromotionPopup" )
require( "ui.uieditor.menus.ClientDemoFiles" )
require( "ui.uieditor.menus.Core_UI_require" )
require( "ui.uieditor.menus.Core_Frontend_require" )

CoD.MainMenu = {}
CoD.MainMenu.SystemLinkLastUsedButton = 0
CoD.MainMenu.ShowStoreButtonEvent = function ( mainMenu, event )
	if CoD.MainMenu.ShowStoreButton( event.controller ) == true and mainMenu.ingameStoreButton == nil then
		CoD.MainMenu.AddStoreButton( mainMenu )
	end
end

CoD.MainMenu.AddStoreButton = function ( mainMenu )
	if not Dvar.ui_execdemo:get() then
		mainMenu.ingameStoreButton = mainMenu.buttonList:addButton( Engine.Localize( "MENU_INGAMESTORE" ), nil, 5 )
		mainMenu.ingameStoreButton:setActionEventName( "open_store" )
	end
end

CoD.MainMenu.ShowStoreButton = function ( controller )
	if not CoD.isPC and not CoD.isWIIU and Engine.IsFFOTDFetched() and Dvar.ui_inGameStoreVisible:get() == true and (CoD.isPS3 ~= true or CoD.isZombie ~= true) then
		return true
	else
		return false
	end
end

LUI.createMenu.MainMenu = function ( controller )
	local mainMenu = CoD.Menu.New( "MainMenu" )
	mainMenu.anyControllerAllowed = true
	mainMenu:registerEventHandler( "open_main_lobby_requested", CoD.MainMenu.OpenMainLobbyRequested )
	mainMenu:registerEventHandler( "open_system_link_flyout", CoD.MainMenu.OpenSystemLinkFlyout )
	mainMenu:registerEventHandler( "open_system_link_lobby", CoD.MainMenu.OpenSystemLinkLobby )
	mainMenu:registerEventHandler( "open_server_browser", CoD.MainMenu.OpenServerBrowser )
	mainMenu:registerEventHandler( "open_local_match_lobby", CoD.MainMenu.OpenLocalMatchLobby )
	if CoD.isWIIU then
		mainMenu:registerEventHandler( "open_controls_menu", CoD.MainMenu.OpenControlsMenu )
	end
	mainMenu:registerEventHandler( "open_options_menu", CoD.MainMenu.OpenOptionsMenu )
	mainMenu:registerEventHandler( "open_uieditormain", CoD.MainMenu.OpenUIEditorMenu )
	mainMenu:registerEventHandler( "open_client_demo_files", CoD.MainMenu.OpenClientDemoMenu )
	mainMenu:registerEventHandler( "open_quit_popup", CoD.MainMenu.OpenQuitPopup )
	mainMenu:registerEventHandler( "button_prompt_back", CoD.MainMenu.Back )
	mainMenu:registerEventHandler( "first_signed_in", CoD.MainMenu.SignedIntoLive )
	mainMenu:registerEventHandler( "last_signed_out", CoD.MainMenu.SignedOut )
	mainMenu:registerEventHandler( "open_menu", CoD.Lobby.OpenMenu )
	mainMenu:registerEventHandler( "reopen_serverbrowser", CoD.MainMenu.ReopenServerBrowser )
	mainMenu:registerEventHandler( "invite_accepted", CoD.inviteAccepted )
	mainMenu:registerEventHandler( "button_prompt_friends", CoD.MainMenu.ButtonPromptFriendsMenu )
	mainMenu:registerEventHandler( "open_store", CoD.MainLobby.OpenStore )
	mainMenu:registerEventHandler( "showstorebutton", CoD.MainMenu.ShowStoreButtonEvent )
	mainMenu:registerEventHandler( "open_groups_menu", CoD.MainMenu.OpenGroupsMenu )
	if CoD.isPS3 then
		mainMenu:registerEventHandler( "corrupt_install", CoD.MainMenu.CorruptInstall )
	end
	if CoD.isZombie == false then
		mainMenu:registerEventHandler( "elite_registration_ended", CoD.MainMenu.elite_registration_ended )
		mainMenu:registerEventHandler( "elite_registration_email_popup_requested", CoD.EliteRegistrationEmailPopup.EliteRegistrationEmailPopupRequested )
		mainMenu:registerEventHandler( "AutoFillPopup_Closed", CoD.EliteRegistrationEmailPopup.AutoFillPopup_Closed )
		mainMenu:registerEventHandler( "motd_popup_closed", CoD.MainMenu.Popup_Closed )
		mainMenu:registerEventHandler( "dlcpopup_closed", CoD.MainMenu.Popup_Closed )
		mainMenu:registerEventHandler( "voting_popup_closed", CoD.MainMenu.Popup_Closed )
		mainMenu:registerEventHandler( "spreminder_popup_closed", CoD.MainMenu.Popup_Closed )
		mainMenu:registerEventHandler( "dsppromotion_popup_closed", CoD.MainMenu.Popup_Closed )
	end
	mainMenu:addSelectButton()
	if not Dvar.ui_execdemo:get() then
		mainMenu:addBackButton( Engine.Localize( "MENU_MAIN_MENU" ) )
	end
	if Engine.AnySignedInToLive() and not Dvar.ui_execdemo:get() then
		mainMenu:addFriendsButton()
	end
	if CoD.isZombie == false and not Dvar.ui_level_sv:get() then
		local soldiersImage = LUI.UIImage.new()
		soldiersImage:setLeftRight( false, false, -640, 640 )
		soldiersImage:setTopBottom( false, false, -360, 360 )
		soldiersImage:setImage( RegisterMaterial( "menu_mp_soldiers" ) )
		soldiersImage:setPriority( -1 )
		mainMenu:addElement( soldiersImage )
		local smoke = LUI.UIImage.new()
		smoke:setLeftRight( false, false, -640, 640 )
		smoke:setTopBottom( false, false, 180, 360 )
		smoke:setImage( RegisterMaterial( "ui_smoke" ) )
		smoke:setAlpha( 0.1 )
	end
	if CoD.isZombie then
		local backgroundHeight = 192
		local backgroundWidth = backgroundHeight * 2
		local backgroundTopOffset = 230
		local background = LUI.UIImage.new()
		background:setLeftRight( true, false, 0, backgroundWidth )
		background:setTopBottom( true, false, backgroundTopOffset - backgroundHeight / 2, backgroundTopOffset + backgroundHeight / 2 )
		background:setImage( RegisterMaterial( "menu_zm_title_screen" ) )
		mainMenu:addElement( background )
		CoD.GameGlobeZombie.gameGlobe.currentMenu = mainMenu
	else
		local backgroundHeight = 48
		local backgroundWidth = backgroundHeight * 8
		local backgroundTopOffset = 210
		local background = LUI.UIImage.new()
		background:setLeftRight( true, false, 0, backgroundWidth )
		background:setTopBottom( true, false, backgroundTopOffset, backgroundTopOffset + backgroundHeight )
		background:setImage( RegisterMaterial( "menu_mp_title_screen" ) )
		mainMenu:addElement( background )
		if not CoD.isCampaign then
			local currentLanguage = Dvar.loc_language:get()
			if currentLanguage == CoD.LANGUAGE_ENGLISH or currentLanguage == CoD.LANGUAGE_BRITISH then
				local mpHeight = 24
				local mpWidth = mpHeight * 16
				local mpTopOffset = backgroundTopOffset + backgroundHeight + 2
				local mp = LUI.UIImage.new()
				mp:setLeftRight( true, false, 0, mpWidth )
				mp:setTopBottom( true, false, mpTopOffset, mpTopOffset + mpHeight )
				mp:setImage( RegisterMaterial( "menu_mp_title_screen_mp" ) )
				mainMenu:addElement( mp )
			end
		end
	end
	local buttonHeightMultiplier = 8
	if CoD.isWIIU then
		buttonHeightMultiplier = buttonHeightMultiplier + 1
	end
	local buttonListLeft = 6
	local buttonListHeight = CoD.CoD9Button.Height * buttonHeightMultiplier
	local buttonListWidth = CoD.ButtonList.DefaultWidth
	local buttonListTop = -buttonListHeight - CoD.ButtonPrompt.Height
	local buttonListBottom = -CoD.ButtonPrompt.Height
	mainMenu.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = buttonListLeft,
		right = buttonListLeft + buttonListWidth,
		topAnchor = false,
		bottomAnchor = true,
		top = buttonListTop,
		bottom = buttonListBottom,
		alpha = 1
	} )
	mainMenu.buttonList:setPriority( 10 )
	mainMenu.buttonList:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	mainMenu:addElement( mainMenu.buttonList )
	local buttonIndex = 1
	if not Dvar.ui_execdemo:get() then
		mainMenu.mainLobbyButton = mainMenu.buttonList:addButton( Engine.Localize( "PLATFORM_XBOXLIVE_INSTR" ), nil, buttonIndex )
		mainMenu.mainLobbyButton:setActionEventName( "open_main_lobby_requested" )
		buttonIndex = buttonIndex + 1
	end
	local showSystemLink = not Engine.IsBetaBuild()
	local flyoutLeft = 120
	if showSystemLink then
		local systemLinkButtonText = Engine.Localize( "PLATFORM_SYSTEM_LINK_CAPS" )
		local f4_local0 = {}
		local systemLinkButtonTextDim = GetTextDimensions( systemLinkButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
		mainMenu.systemLinkButton = mainMenu.buttonList:addButton( systemLinkButtonText, nil, buttonIndex )
		mainMenu.systemLinkButton:setActionEventName( "open_system_link_flyout" )
		buttonIndex = buttonIndex + 1
		flyoutLeft = systemLinkButtonTextDim[3] + 15
	end
	if not CoD.isPC and not Engine.IsBetaBuild() and not Dvar.ui_execdemo:get() then
		if CoD.isWIIU then
			mainMenu.localButton = mainMenu.buttonList:addButton( Engine.Localize( CoD.MPZM( "MENU_LOCAL_CAPS", "PLATFORM_UI_LOCAL_CAPS" ) ), nil, buttonIndex )
		else
			mainMenu.localButton = mainMenu.buttonList:addButton( Engine.Localize( CoD.MPZM( "MENU_LOCAL_CAPS", "ZMUI_LOCAL_CAPS" ) ), nil, buttonIndex )
		end
		mainMenu.localButton:setActionEventName( "open_local_match_lobby" )
		buttonIndex = buttonIndex + 1
	end
	if CoD.isWIIU then
		mainMenu.controlsButton = mainMenu.buttonList:addButton( Engine.Localize( "MENU_CONTROLLER_SETTINGS_CAPS" ), nil, buttonIndex )
		mainMenu.controlsButton:setActionEventName( "open_controls_menu" )
		buttonIndex = buttonIndex + 1
	end
	if Dvar.groups_enabled:get() then
		mainMenu.groupsButton = mainMenu.buttonList:addButton( Engine.Localize( "GROUPS_CAPS" ), nil, buttonIndex )
		mainMenu.groupsButton:setActionEventName( "open_groups_menu" )
		buttonIndex = buttonIndex + 1
	end
	mainMenu.optionsButton = mainMenu.buttonList:addButton( Engine.Localize( "MENU_OPTIONS_CAPS" ), nil, buttonIndex )
	mainMenu.optionsButton:setActionEventName( "open_options_menu" )
	buttonIndex = buttonIndex + 1
	if CoD.MainMenu.ShowStoreButton( controller ) == true and mainMenu.ingameStoreButton == nil then
		CoD.MainMenu.AddStoreButton( mainMenu )
	end
	if not Dvar.ui_execdemo:get() then
		mainMenu.uieditorbutton = mainMenu.buttonList:addButton( "UIEDITOR", nil, buttonIndex )
		mainMenu.uieditorbutton:setActionEventName( "open_uieditormain" )
		buttonIndex = buttonIndex + 1
	end
	if CoD.isPC then
		mainMenu.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 9 )
		mainMenu.quitButton = mainMenu.buttonList:addButton( Engine.Localize( "MENU_QUIT_CAPS" ), nil, buttonIndex )
		mainMenu.quitButton:setActionEventName( "open_quit_popup" )
		buttonIndex = buttonIndex + 1
		mainMenu.buttonList:setLeftRight( true, false, buttonListLeft, buttonListLeft + 180 )
	end
	if showSystemLink then
		local flyoutTop = nil
		if not Dvar.ui_execdemo:get() then
			flyoutTop = buttonListTop + CoD.CoD9Button.Height + 2
		else
			flyoutTop = buttonListTop
		end
		local flyoutHeight = CoD.CoD9Button.Height * 2 + 2
		local systemLinkButtonText = Engine.Localize( "MENU_CREATE_GAME_CAPS" )
		local f4_local1 = {}
		local systemLinkButtonTextDim = GetTextDimensions( systemLinkButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
		local serverBrowserButtonText = Engine.Localize( "MENU_JOIN_GAME_CAPS" )
		local f4_local2 = {}
		local serverBrowserButtonTextDim = GetTextDimensions( serverBrowserButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
		local flyoutWidth = systemLinkButtonTextDim[3]
		if flyoutWidth < serverBrowserButtonTextDim[3] then
			flyoutWidth = serverBrowserButtonTextDim[3]
		end
		mainMenu.systemLinkFlyoutContainer = LUI.UIElement.new( {
			leftAnchor = true,
			rightAnchor = false,
			left = buttonListLeft + flyoutLeft,
			right = buttonListLeft + flyoutLeft + flyoutWidth + 12,
			topAnchor = false,
			bottomAnchor = true,
			top = flyoutTop,
			bottom = flyoutTop + flyoutHeight,
			alpha = 0
		} )
		mainMenu.systemLinkFlyoutContainer:registerAnimationState( "show", {
			alpha = 1
		} )
		mainMenu:addElement( mainMenu.systemLinkFlyoutContainer )
		local buttonBG = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = false,
			left = -flyoutLeft - 4,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = CoD.CoD9Button.Height,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 0.8
		} )
		mainMenu.systemLinkFlyoutContainer:addElement( buttonBG )
		local background = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 0.8
		} )
		mainMenu.systemLinkFlyoutContainer:addElement( background )
		mainMenu.systemLinkFlyoutContainer.buttonList = CoD.ButtonList.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 4,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0
		} )
		CoD.ButtonList.DisableInput( mainMenu.systemLinkFlyoutContainer.buttonList )
		mainMenu.systemLinkFlyoutContainer:addElement( mainMenu.systemLinkFlyoutContainer.buttonList )
		mainMenu.systemLinkFlyoutContainer.buttonList.hintText:close()
		mainMenu.systemLinkFlyoutContainer.buttonList.hintText = nil
		mainMenu.systemLinkFlyoutContainer.openSystemLinkButton = mainMenu.systemLinkFlyoutContainer.buttonList:addButton( systemLinkButtonText, nil, 1 )
		mainMenu.systemLinkFlyoutContainer.openSystemLinkButton:setActionEventName( "open_system_link_lobby" )
		mainMenu.systemLinkFlyoutContainer.openServerBrowserButton = mainMenu.systemLinkFlyoutContainer.buttonList:addButton( serverBrowserButtonText, nil, 1 )
		mainMenu.systemLinkFlyoutContainer.openServerBrowserButton:setActionEventName( "open_server_browser" )
	end
	if not mainMenu.buttonList:restoreState() then
		mainMenu.buttonList:processEvent( {
			name = "gain_focus"
		} )
	elseif showSystemLink and mainMenu.systemLinkButton:isInFocus() then
		local event = {
			controller = controller
		}
		if true == Engine.CheckNetConnection() and CoD.MainMenu.OfflinePlayAvailable( mainMenu, event, true ) == 1 then
			CoD.MainMenu.OpenSystemLinkFlyout( mainMenu, event )
			if CoD.MainMenu.SystemLinkLastUsedButton == 1 then
				mainMenu.systemLinkFlyoutContainer.openSystemLinkButton:processEvent( {
					name = "lose_focus"
				} )
				mainMenu.systemLinkFlyoutContainer.openServerBrowserButton:processEvent( {
					name = "gain_focus"
				} )
			end
		end
	end
	HideGlobe()
	if CoD.isWIIU then
		Engine.ExecNow( 0, "setclientbeingused" )
	end
	if CoD.isPS3 then
		Engine.ExecNow( controller, "onetimeinstallcorruptioncheck" )
	end
	if not CoD.MainMenuSoundPlayed then
		CoD.MainMenuSoundPlayed = true
		Engine.PlaySound( "uin_startup" )
	end
	return mainMenu
end

CoD.MainMenu.CorruptInstall = function ( self, event )
	local errorPopup = self:openPopup( "Error", event.controller )
	errorPopup.anyControllerAllowed = true
	errorPopup:setMessage( Engine.Localize( "MENU_PS3_INSTALL_INCOMPLETE" ) )
end

CoD.MainMenu.OpenPopup_EliteRegistration = function ( self, event )
	if Engine.IsCustomElementScrollLanguageOverrideActive() then
		local tosPopup = self:openPopup( "EliteRegistrationScrollingTOS", event.controller )
	else
		local eliteRegPopup = self:openPopup( "EliteRegistrationPopup", event.controller )
	end
end

CoD.MainMenu.OpenPopup_EliteWelcome = function ( self, event )
	if Engine.IsPlayerEliteFounder( event.controller ) then
		local eliteFounderWelomePopup = self:openPopup( "EliteWelcomeFounderPopup", event.controller )
	else
		local eliteWelcomePopup = self:openPopup( "EliteWelcomePopup", event.controller )
	end
end

CoD.MainMenu.elite_registration_ended = function ( self, event )
	CoD.MainMenu.OpenMainLobby( self, event )
end

CoD.MainMenu.Popup_Closed = function ( self, event )
	CoD.MainMenu.OpenMainLobbyRequested( self, event )
end

CoD.MainMenu.IsGuestRestricted = function ( self, event )
	if not (not CoD.isPS3 or event.controller == 0) or CoD.isXBOX and Engine.IsGuest( event.controller ) then
		local popup = self:openPopup( "popup_guest_contentrestricted", event.controller )
		popup.anyControllerAllowed = true
		return true
	else
		return false
	end
end

CoD.MainMenu.ShowDLC0Popup = function ( controller )
	if CoD.isXBOX == true and Engine.IsContentAvailableByPakName( "dlc0" ) == false and Engine.DvarBool( nil, "ui_isDLCPopupEnabled" ) and CoD.perController[controller].IsDLCPopupViewed == nil then
		return true
	else
		return false
	end
end

CoD.MainMenu.AnyDLCMissing = function ()
	local totalDLCReleased = Dvar.ui_totalDLCReleased:get()
	for i = 1, totalDLCReleased, 1 do
		if not Engine.IsContentAvailableByPakName( "dlc" .. i ) then
			return true
		end
	end
	return false
end

CoD.MainMenu.ShowSPReminderPopup = function ( controller )
	if Engine.ShouldShowSPReminder( controller ) == true and Engine.OwnSeasonPass( controller ) == true and true == CoD.MainMenu.AnyDLCMissing() then
		return true
	else
		return false
	end
end

CoD.MainMenu.ShowDSPPromotionPopup = function ( controller )
	return false
end

CoD.MainMenu.OpenMainLobbyRequested = function ( self, event )
	if CoD.isZombie then
		if Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_ZOMBIE ) then
			Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_ZOMBIE )
			return 
		end
	elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_MP ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_MP )
		return 
	end
	if CoD.MainMenu.IsGuestRestricted( self, event ) == true then
		return 
	elseif Engine.CheckNetConnection() == false then
		local popup = self:openPopup( "popup_net_connection", event.controller )
		popup.callingMenu = self
		return 
	elseif CoD.isZombie == false then
		if CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
			Engine.Exec( event.controller, "setclientbeingusedandprimary" )
			if CoD.MainMenu.ShowDLC0Popup( event.controller ) == true then
				local publisherofferid = Engine.GetDLC0PublisherOfferId( event.controller )
				if publisherofferid ~= nil then
					CoD.perController[event.controller].ContentPublisherOfferID = publisherofferid
					CoD.perController[event.controller].ContentType = "0"
					local dlcpopup = self:openPopup( "DLCPopup", event.controller )
					dlcpopup.callingMenu = self
				end
			elseif Engine.ShouldShowMOTD( event.controller ) ~= nil and Engine.ShouldShowMOTD( event.controller ) == true then
				local motd = self:openPopup( "MOTD", event.controller )
				motd.callingMenu = self
			elseif CoD.MainMenu.ShowSPReminderPopup( event.controller ) then
				local spReminderPopup = self:openPopup( "SPReminderPopup", event.controller )
				spReminderPopup.callingMenu = self
			elseif CoD.MainMenu.ShowDSPPromotionPopup( event.controller ) then
				local dspPromotionPopup = self:openPopup( "DSPPromotionPopup", event.controller )
				dspPromotionPopup.callingMenu = self
			elseif Engine.ShouldShowVoting( event.controller ) == true then
				local votingPopup = self:openPopup( "VotingPopup", event.controller )
				votingPopup.callingMenu = self
			elseif Engine.ERegPopup_ShouldShow( event.controller ) == 1 then
				CoD.MainMenu.OpenPopup_EliteRegistration( self, event )
			elseif Engine.EWelcomePopup_ShouldShow( event.controller ) == 1 then
				CoD.MainMenu.OpenPopup_EliteWelcome( self, event )
			elseif CoD.isPS3 and Engine.IsChatRestricted( event.controller ) then
				local popup = self:openPopup( "popup_chatrestricted", event.controller )
				popup.callingMenu = self
			else
				CoD.perController[event.controller].IsDLCPopupViewed = nil
				CoD.MainMenu.OpenMainLobby( self, event )
			end
		end
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
		Engine.Exec( event.controller, "setclientbeingusedandprimary" )
		if Engine.ShouldShowMOTD( event.controller ) then
			local motd = self:openPopup( "MOTD", event.controller )
			motd.callingMenu = self
		elseif CoD.isPS3 and Engine.IsChatRestricted( event.controller ) then
			local popup = self:openPopup( "popup_chatrestricted", event.controller )
			popup.callingMenu = self
		else
			CoD.MainMenu.OpenMainLobby( self, event )
		end
	end
end

CoD.MainMenu.OpenMainLobby = function ( self, event )
	if CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
		if CoD.isZombie then
			if Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_ZOMBIE ) then
				Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_ZOMBIE )
				return 
			end
		elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_MP ) then
			Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_MP )
			return 
		end
		self.buttonList:saveState()
		Engine.SessionModeSetOnlineGame( true )
		Engine.Exec( event.controller, "xstartprivateparty" )
		Engine.Exec( event.controller, "party_statechanged" )
		CoD.MainMenu.InitializeLocalPlayers( event.controller )
		local mainLobby = self:openMenu( "MainLobby", event.controller )
		Engine.Exec( event.controller, "session_rejoinsession " .. CoD.SESSION_REJOIN_CHECK_FOR_SESSION )
		if CoD.isZombie then
			CoD.GameGlobeZombie.gameGlobe.currentMenu = mainLobby
		end
		self:close()
	end
end

CoD.MainMenu.OpenControlsMenu = function ( self, event )
	if CoD.MainMenu.OfflinePlayAvailable( self, event ) == 0 then
		return 
	else
		CoD.MainMenu.InitializeLocalPlayers( event.controller )
		self:openPopup( "WiiUControllerSettings", event.controller, true )
		Engine.PlaySound( "cac_screen_fade" )
	end
end

CoD.MainMenu.OpenOptionsMenu = function ( self, event )
	if CoD.MainMenu.OfflinePlayAvailable( self, event ) == 0 then
		return 
	else
		CoD.MainMenu.InitializeLocalPlayers( event.controller )
		self:openPopup( "OptionsMenu", event.controller )
		Engine.PlaySound( "cac_screen_fade" )
	end
end

CoD.MainMenu.OpenUIEditorMenu = function ( self, event )
	Engine.ExecNow( event.controller, "disableallclients" )
	Engine.ExecNow( event.controller, "setclientbeingusedandprimary" )
	NavigateToMenu( self, "UIEditorMain", true, event.controller )
end

CoD.MainMenu.OpenGroupsMenu = function ( self, event )
	NavigateToMenu( self, "GroupsMain", true, event.controller )
end

CoD.MainMenu.OpenClientDemoMenu = function ( self, event )
	CoD.MainMenu.InitializeLocalPlayers( event.controller )
	Engine.ExecNow( event.controller, "cl_demo_enumeratemetainfo" )
	self:openPopup( "ClientDemoFiles", event.controller )
end

CoD.MainMenu.OpenLocalMatchLobby = function ( self, event )
	if CoD.MainMenu.IsGuestRestricted( self, event ) == true then
		return 
	elseif CoD.MainMenu.OfflinePlayAvailable( self, event ) == 0 then
		return 
	else
		self.buttonList:saveState()
		CoD.MainMenu.InitializeLocalPlayers( event.controller )
		CoD.SwitchToLocalLobby( event.controller )
		self:openMenu( "SplitscreenGameLobby", event.controller )
		self:close()
	end
end

CoD.MainMenu.OfflinePlayAvailable = function ( self, event, noSignInPopup )
	local controller = event.controller
	if not Engine.IsSignedIn( controller ) then
		if noSignInPopup ~= nil and noSignInPopup == true then
			return 0
		elseif CoD.isPS4 then
			if Engine.IsPrimaryLocalClient( controller ) then
				Engine.Exec( controller, "xsigninlive" )
			else
				Engine.Exec( controller, "signclientin" )
			end
		else
			Engine.Exec( controller, "xsignin" )
			if CoD.isPC then
				return 1
			end
		end
		return 0
	else
		return 1
	end
end

CoD.MainMenu.StartZombies = function ( self, event )
	Engine.Exec( event.controller, "startZombies" )
end

CoD.MainMenu.StartMP = function ( self, event )
	Engine.Exec( event.controller, "startMultiplayer" )
end

CoD.MainMenu.StartSP = function ( self, event )
	Engine.Exec( event.controller, "startCampaign" )
end

CoD.MainMenu.OpenQuitPopup = function ( self, event )
	self:openPopup( "QuitPopup", event.controller )
end

CoD.MainMenu.OpenSystemLinkFlyout = function ( self, event )
	if CoD.MainMenu.IsGuestRestricted( self, event ) == true then
		return 
	elseif Engine.CheckNetConnection() == false then
		local popup = self:openPopup( "popup_net_connection", event.controller )
		popup.callingMenu = self
		return 
	elseif CoD.MainMenu.OfflinePlayAvailable( self, event ) == 0 then
		return 
	end
	self.systemLinkFlyoutContainer:animateToState( "show" )
	CoD.ButtonList.DisableInput( self.buttonList )
	self.buttonList:animateToState( "disabled" )
	CoD.ButtonList.EnableInput( self.systemLinkFlyoutContainer.buttonList )
	self.systemLinkFlyoutContainer.openSystemLinkButton:processEvent( {
		name = "gain_focus"
	} )
	if self.backButton ~= nil then
		self.backButton:close()
	end
	self:addBackButton()
	self:registerEventHandler( "button_prompt_back", CoD.MainMenu.CloseSystemLinkFlyout )
end

CoD.MainMenu.CloseSystemLinkFlyout = function ( self, event )
	self.systemLinkFlyoutContainer:animateToState( "default" )
	CoD.ButtonList.EnableInput( self.buttonList )
	self.buttonList:animateToState( "default" )
	self.systemLinkFlyoutContainer.openSystemLinkButton:processEvent( {
		name = "lose_focus"
	} )
	self.systemLinkFlyoutContainer.openServerBrowserButton:processEvent( {
		name = "lose_focus"
	} )
	CoD.ButtonList.DisableInput( self.systemLinkFlyoutContainer.buttonList )
	if self.backButton ~= nil then
		self.backButton:close()
	end
	Engine.PlaySound( "cac_cmn_backout" )
	if not Dvar.ui_execdemo:get() then
		self:addBackButton( Engine.Localize( "MENU_MAIN_MENU" ) )
		self:registerEventHandler( "button_prompt_back", CoD.MainMenu.Back )
	end
end

CoD.MainMenu.OpenSystemLinkLobby = function ( self, event )
	if CoD.MainMenu.IsGuestRestricted( self, event ) == true then
		return 
	elseif Engine.CheckNetConnection() == false then
		local popup = self:openPopup( "popup_net_connection", event.controller )
		popup.callingMenu = self
		return 
	elseif CoD.MainMenu.OfflinePlayAvailable( self, event ) == 0 then
		return 
	else
		self.buttonList:saveState()
		CoD.MainMenu.SystemLinkLastUsedButton = 0
		CoD.MainMenu.InitializeLocalPlayers( event.controller )
		CoD.SwitchToSystemLinkLobby( event.controller )
		local maxControllersAllowed = Engine.DvarInt( event.controller, "party_maxlocalplayers_privatematch" )
		self:openMenu( "PrivateLocalGameLobby", event.controller )
		self:close()
	end
end

CoD.MainMenu.OpenServerBrowser = function ( self, event )
	if CoD.MainMenu.IsGuestRestricted( self, event ) == true then
		return 
	else
		Engine.Exec( event.controller, "loadcommonff" )
		if Engine.CheckNetConnection() == false then
			local popup = self:openPopup( "popup_net_connection", event.controller )
			popup.callingMenu = self
			return 
		elseif CoD.MainMenu.OfflinePlayAvailable( self, event ) == 0 then
			return 
		else
			self.buttonList:saveState()
			CoD.MainMenu.SystemLinkLastUsedButton = 1
			CoD.MainMenu.InitializeLocalPlayers( event.controller )
			Engine.ServerListUpdateFilter( event.controller )
			self:openPopup( "ServerBrowser", event.controller )
		end
	end
end

CoD.MainMenu.ReopenServerBrowser = function ( self, event )
	CoD.resetGameModes()
	if self.systemLinkButton:isInFocus() then
		return 
	else
		self.buttonList:processEvent( {
			name = "lose_focus"
		} )
		self.systemLinkButton:processEvent( {
			name = "gain_focus"
		} )
		CoD.MainMenu.OpenSystemLinkFlyout( self, event )
		self.systemLinkFlyoutContainer.openSystemLinkButton:processEvent( {
			name = "lose_focus"
		} )
		self.systemLinkFlyoutContainer.openServerBrowserButton:processEvent( {
			name = "gain_focus"
		} )
		CoD.MainMenu.OpenServerBrowser( self, event )
	end
end

CoD.MainMenu.Back = function ( self, event )
	Engine.SwitchMode( event.controller, "none" )
end

CoD.MainMenu.ButtonPromptFriendsMenu = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		local guest = self:openPopup( "popup_guest_contentrestricted", event.controller )
		guest.anyControllerAllowed = true
		guest:setOwner( event.controller )
		return 
	elseif not Engine.IsSignedInToLive( event.controller ) then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_FRIENDS_UNAVAILABLE" ) )
		errorPopup.anyControllerAllowed = true
		return 
	elseif not Engine.IsContentRatingAllowed( event.controller ) or Engine.IsAnyControllerMPRestricted() or not Engine.HasMPPrivileges( event.controller ) then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_MPNOTALLOWED" ) )
		errorPopup.anyControllerAllowed = true
		return 
	elseif not Engine.AreStatsFetched( event.controller ) then
		return 
	elseif not CoD.isPS3 or not Engine.IsSubUser( event.controller ) then
		local friendsList = self:openPopup( "FriendsList", event.controller )
		CoD.MainMenu.InitializeLocalPlayers( event.controller )
		friendsList:setOwner( event.controller )
	end
end

CoD.MainMenu.SignedIntoLive = function ( self, event )
	if self.friendsButton == nil and not Dvar.ui_execdemo:get() then
		self:addFriendsButton()
	end
end

CoD.MainMenu.SignedOut = function ( self, event )
	if self.friendsButton ~= nil then
		self.friendsButton:close()
		self.friendsButton = nil
	end
end

CoD.MainMenu.InitializeLocalPlayers = function ( controller )
	Engine.ExecNow( controller, "disableallclients" )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
end

LUI.createMenu.VCS = function ( controller )
	local vcs = CoD.Menu.New( "VCS" )
	vcs.anyControllerAllowed = true
	local display = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 1080,
		bottom = 600,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1,
		material = RegisterMaterial( "vcs_0" )
	} )
	vcs:addElement( display )
	return vcs
end

