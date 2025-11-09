require( "ui.T6.AudioSettingsOptions" )
require( "ui.T6.GraphicsSettingsOptions" )
require( "ui.T6.BrightnessOptions" )
require( "ui.T6.ButtonLayoutOptions" )
require( "ui.T6.StickLayoutOptions" )
require( "ui.T6.Menus.SafeAreaMenu" )
require( "ui.T6.Menus.Stereoscopic3DMenu" )
require( "ui.T6.Menus.SystemInfoMenu" )

if not CoD.isCampaign then
	require( "ui.T6.Menus.DualViewMenu" )
end
CoD.Options = {}
CoD.Options.ConfirmSFX = "uin_cmn_backout"
CoD.Options.Width = 540
CoD.Options.HeightWidth = 540
CoD.Options.CycleSFX = "cac_grid_nav"
CoD.Options.Close = function ( self )
	Engine.PlaySound( CoD.Options.ConfirmSFX )
	Engine.Exec( self:getOwner(), "updategamerprofile" )
	if CoD.isCampaign == false then
		self:saveState()
	end
	CoD.Menu.close( self )
end

CoD.Options.Button_AddChoices = function ( button )
	if button.strings == nil or #button.strings == 0 then
		return 
	elseif not button.m_choices then
		button.m_choices = table.create( #button.strings, 0 )
	end
	for index = 1, #button.strings, 1 do
		button:addChoice( button.strings[index], button.values[index] )
	end
end

CoD.Options.Button_AddChoices_EnabledOrDisabled = function ( button )
	local f3_local0 = {}
	local f3_local1 = Engine.Localize( "MENU_DISABLED_CAPS" )
	local f3_local2 = Engine.Localize( "MENU_ENABLED_CAPS" )
	button.strings = f3_local1
	button.values = {
		0,
		1
	}
	CoD.Options.Button_AddChoices( button )
end

CoD.Options.Button_AddChoices_OnOrOff = function ( button )
	local f4_local0 = {}
	local f4_local1 = Engine.Localize( "MENU_OFF_CAPS" )
	local f4_local2 = Engine.Localize( "MENU_ON_CAPS" )
	button.strings = f4_local1
	button.values = {
		0,
		1
	}
	CoD.Options.Button_AddChoices( button )
end

CoD.Options.Button_Dvar_AddChoices_EnabledOrDisabled = function ( controller, button )
	button:addChoice( controller, Engine.Localize( "MENU_DISABLED_CAPS" ), 0 )
	button:addChoice( controller, Engine.Localize( "MENU_ENABLED_CAPS" ), 1 )
end

CoD.Options.Button_StickLayout = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_stick_layout",
		controller = event.controller
	} )
end

CoD.Options.OpenStickLayout = function ( self, event )
	self:saveState()
	self:openMenu( "StickLayout", event.controller, {
		height = self.buttonList.listHeight
	} )
	self:close()
end

CoD.Options.Button_ButtonLayout = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_button_layout",
		controller = event.controller
	} )
end

CoD.Options.OpenButtonLayout = function ( self, event )
	self:saveState()
	self:openMenu( "ButtonLayout", event.controller, {
		height = self.buttonList.listHeight
	} )
	self:close()
end

CoD.Options.Button_LookSensitivity_AddChoices = function ( button )
	local f10_local0 = {}
	local f10_local1 = Engine.Localize( "MENU_SENSITIVITY_VERY_LOW_CAPS" )
	local f10_local2 = Engine.Localize( "MENU_SENSITIVITY_LOW_CAPS" )
	local f10_local3 = "3"
	local f10_local4 = Engine.Localize( "MENU_SENSITIVITY_MEDIUM_CAPS" )
	local f10_local5 = "5"
	local f10_local6 = "6"
	local f10_local7 = "7"
	local f10_local8 = Engine.Localize( "MENU_SENSITIVITY_HIGH_CAPS" )
	local f10_local9 = "9"
	local f10_local10 = "10"
	local f10_local11 = Engine.Localize( "MENU_SENSITIVITY_VERY_HIGH_CAPS" )
	local f10_local12 = "12"
	local f10_local13 = "13"
	local f10_local14 = Engine.Localize( "MENU_SENSITIVITY_INSANE_CAPS" )
	button.strings = f10_local1
	button.values = {
		CoD.SENSITIVITY_1,
		CoD.SENSITIVITY_2,
		CoD.SENSITIVITY_3,
		CoD.SENSITIVITY_4,
		CoD.SENSITIVITY_5,
		CoD.SENSITIVITY_6,
		CoD.SENSITIVITY_7,
		CoD.SENSITIVITY_8,
		CoD.SENSITIVITY_9,
		CoD.SENSITIVITY_10,
		CoD.SENSITIVITY_11,
		CoD.SENSITIVITY_12,
		CoD.SENSITIVITY_13,
		CoD.SENSITIVITY_14
	}
	CoD.Options.Button_AddChoices( button )
end

CoD.Options.Button_EnumProfile_SelectionChanged = function ( choiceParams, userRequested )
	if userRequested then
		Engine.SetProfileVar( choiceParams.parentSelectorButton.m_currentController, choiceParams.parentSelectorButton.m_profileVarName, choiceParams.value )
	end
	choiceParams.parentSelectorButton.hintText = choiceParams.extraParams.associatedHintText
	local buttonList = choiceParams.parentSelectorButton:getParent()
	if buttonList ~= nil and buttonList.hintText ~= nil then
		buttonList.hintText:updateText( choiceParams.parentSelectorButton.hintText )
	end
end

CoD.Options.Button_PlayerNameIndicator_AddChoices = function ( button )
	button:addChoice( Engine.Localize( "PLATFORM_INDICATOR_FULL_CAPS" ), 0, {
		associatedHintText = Engine.Localize( "PLATFORM_INDICATOR_FULL_DESC" )
	}, CoD.Options.Button_EnumProfile_SelectionChanged )
	button:addChoice( Engine.Localize( "MENU_INDICATOR_ABBREVIATED_CAPS" ), 1, {
		associatedHintText = Engine.Localize( "PLATFORM_INDICATOR_ABBREVIATED_DESC" )
	}, CoD.Options.Button_EnumProfile_SelectionChanged )
	button:addChoice( Engine.Localize( "MENU_INDICATOR_ICON_CAPS" ), 2, {
		associatedHintText = Engine.Localize( "MENU_INDICATOR_ICON_DESC" )
	}, CoD.Options.Button_EnumProfile_SelectionChanged )
end

CoD.Options.Button_LookInversion_AddChoices = function ( button )
	CoD.Options.Button_AddChoices_EnabledOrDisabled( button )
end

CoD.Options.Button_Subtitles_AddChoices = function ( button )
	CoD.Options.Button_AddChoices_EnabledOrDisabled( button )
end

CoD.Options.Button_LoadByDefault_AddChoices = function ( button )
	local f15_local0 = {}
	local f15_local1 = Engine.Localize( "MENU_SINGLE_PLAYER_CAPS" )
	local f15_local2 = Engine.Localize( "MENU_MULTIPLAYER_CAPS" )
	local f15_local3 = Engine.Localize( "MENU_ZOMBIES_CAPS" )
	button.strings = f15_local1
	button.values = {
		CoD.START_GAME_CAMPAIGN,
		CoD.START_GAME_MULTIPLAYER,
		CoD.START_GAME_ZOMBIES
	}
	CoD.Options.Button_AddChoices( button )
end

CoD.Options.Button_AudioSettings = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_audio_settings",
		controller = event.controller
	} )
end

CoD.Options.OpenAudioSettings = function ( self, event )
	self:saveState()
	if CoD.isCampaign == true and LUI.savedMenuStates["Menu.AudioSettings"] then
		LUI.savedMenuStates["Menu.AudioSettings"] = nil
	end
	self:openMenu( "AudioSettings", event.controller, {
		height = self.buttonList.listHeight
	} )
	self:close()
end

CoD.Options.Button_GraphicsSettings = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_graphics_settings",
		controller = event.controller
	} )
end

CoD.Options.OpenGraphicsSettings = function ( self, event )
	self:saveState()
	if CoD.isCampaign == true and LUI.savedMenuStates["Menu.GraphicsSettings"] then
		LUI.savedMenuStates["Menu.GraphicsSettings"] = nil
	end
	self:openMenu( "GraphicsSettings", event.controller, {
		height = self.buttonList.listHeight
	} )
	self:close()
end

CoD.Options.Button_SelectSaveDevice = function ( self, event )
	if Engine.IsInGame() then
		self:dispatchEventToParent( {
			name = "open_save_device_warning",
			controller = event.controller
		} )
	else
		Engine.Exec( event.controller, "force_select_save_device" )
	end
end

CoD.Options.OpenSystemInfo = function ( self, event )
	self:saveState()
	self:openMenu( "SystemInfo", event.controller )
	Engine.PlaySound( "cac_grid_nav" )
	self:close()
end

CoD.Options.OpenMatureContent = function ( self, event )
	self:saveState()
	local maturePopup = self:openMenu( "MatureContentPopup", event.controller )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	maturePopup:addBackButton()
	self:close()
end

CoD.Options.Button_Reticle = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_reticle",
		controller = event.controller
	} )
end

CoD.Options.OpenReticle = function ( self, event )
	self:saveState()
	self:openMenu( "WiiURemoteReticle", event.controller )
	self:close()
end

CoD.Options.OpenSaveDeviceWarning = function ( self, event )
	self:saveState()
	self:openMenu( "SaveDeviceWarningPopup", event.controller )
	self:close()
end

CoD.Options.ControllerChanged = function ( self, event )
	self.buttonList:removeAllButtons()
	CoD.Options.AddElements( self, event.controller )
end

CoD.Options.NumberOfOptions = function ( self )
	local options = -3
	local child = self:getFirstChild()
	if child == nil then
		return 0
	end
	while child ~= nil do
		local nextChild = child:getNextSibling()
		options = options + 1
		child = nextChild
	end
	return options
end

CoD.Options.SupportsSubtitles = function ()
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == CoD.LANGUAGE_ENGLISH or currentLanguage == CoD.LANGUAGE_BRITISH or currentLanguage == CoD.LANGUAGE_POLISH or currentLanguage == CoD.LANGUAGE_JAPANESE or currentLanguage == CoD.LANGUAGE_FULLJAPANESE then
		return true
	else
		return false
	end
end

CoD.Options.SupportsMatureContent = function ()
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == CoD.LANGUAGE_ENGLISH then
		return true
	else
		return false
	end
end

CoD.Options.AddYouTubeButton = function ( self, controller )
	self.youtubeAccountButton = self.buttonList:addButton( Engine.Localize( "MENU_LINK_TO_YOUTUBE_CAPS" ), Engine.Localize( "MENU_LINK_YOUTUBE_DESC" ) )
	CoD.Options.UpdateYouTubeButtonText( self.youtubeAccountButton, controller )
	if Engine.IsPlayerUnderage( controller ) then
		self.youtubeAccountButton:disable()
		self.youtubeAccountButton.hintText = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
	else
		self.youtubeAccountButton:setActionEventName( "youtube_connect" )
	end
end

CoD.Options.UpdateYouTubeButtonText = function ( self, controller )
	if not Engine.IsYouTubeAccountRegistered( controller ) then
		self.label:setText( Engine.Localize( "MENU_LINK_TO_YOUTUBE_CAPS" ) )
	else
		self.label:setText( Engine.Localize( "MENU_UNLINK_FROM_YOUTUBE_CAPS" ) )
	end
end

CoD.Options.CheckForYouTubeAccount = function ( self, event )
	if not Engine.IsYouTubeAccountChecked( event.controller ) then
		return 
	else
		CoD.Options.AddYouTubeButton( self, event.controller )
		self.youtubeCheckTimer:close()
		self.youtubeCheckTimer = nil
	end
end

CoD.Options.OpenYouTubeConnect = function ( self, event )
	if not Engine.IsYouTubeAccountChecked( controller ) or not Engine.IsYouTubeAccountRegistered( controller ) then
		self:openPopup( "YouTube_Connect", event.controller )
	else
		self:openPopup( "YouTube_UnRegister", event.controller )
	end
end

CoD.Options.YouTubeConnectComplete = function ( self, event )
	CoD.Options.UpdateYouTubeButtonText( self.youtubeAccountButton, event.controller )
end

CoD.Options.AddTwitterButton = function ( self, controller )
	self.twitterAccountButton = self.buttonList:addButton( Engine.Localize( "MENU_LINK_TO_TWITTER_CAPS" ), Engine.Localize( "MENU_LINK_TWITTER_DESC" ) )
	CoD.Options.UpdateTwitterButtonText( self.twitterAccountButton, controller )
	if Engine.IsPlayerUnderage( controller ) then
		self.twitterAccountButton:disable()
		self.twitterAccountButton.hintText = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
	else
		self.twitterAccountButton:setActionEventName( "twitter_connect" )
	end
end

CoD.Options.UpdateTwitterButtonText = function ( self, controller )
	if not Engine.IsTwitterAccountRegistered( controller ) then
		self.label:setText( Engine.Localize( "MENU_LINK_TO_TWITTER_CAPS" ) )
	else
		self.label:setText( Engine.Localize( "MENU_UNLINK_FROM_TWITTER_CAPS" ) )
	end
end

CoD.Options.CheckForTwitterAccount = function ( self, event )
	if not Engine.IsTwitterAccountChecked( event.controller ) then
		return 
	else
		CoD.Options.AddTwitterButton( self, event.controller )
		self.twitterCheckTimer:close()
		self.twitterCheckTimer = nil
	end
end

CoD.Options.OpenTwitterConnect = function ( self, event )
	if not Engine.IsTwitterAccountChecked( event.controller ) or not Engine.IsTwitterAccountRegistered( event.controller ) then
		self:openPopup( "Twitter_Connect", event.controller )
	else
		self:openPopup( "Twitter_UnRegister", event.controller )
	end
end

CoD.Options.TwitterConnectComplete = function ( self, event )
	CoD.Options.UpdateTwitterButtonText( self.twitterAccountButton, event.controller )
end

CoD.Options.AddTwitchButton = function ( self, controller )
	self.twitchAccountButton = self.buttonList:addButton( Engine.Localize( "MENU_LINK_TO_TWITCH_CAPS" ), Engine.Localize( "MENU_LINK_TWITCH_DESC" ) )
	CoD.Options.UpdateTwitchButtonText( self.twitchAccountButton, controller )
	if Engine.IsPlayerUnderage( controller ) then
		self.twitchAccountButton:disable()
		self.twitchAccountButton.hintText = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
	else
		self.twitchAccountButton:setActionEventName( "twitch_connect" )
	end
end

CoD.Options.UpdateTwitchButtonText = function ( self, controller )
	if not Engine.IsTwitchAccountRegistered( controller ) then
		self.label:setText( Engine.Localize( "MENU_LINK_TO_TWITCH_CAPS" ) )
	else
		self.label:setText( Engine.Localize( "MENU_UNLINK_FROM_TWITCH_CAPS" ) )
	end
end

CoD.Options.CheckForTwitchAccount = function ( self, event )
	if not Engine.IsTwitchAccountChecked( event.controller ) then
		return 
	else
		CoD.Options.AddTwitchButton( self, event.controller )
		self.twitchCheckTimer:close()
		self.twitchCheckTimer = nil
	end
end

CoD.Options.OpenTwitchConnect = function ( self, event )
	if not Engine.IsTwitchAccountRegistered( event.controller ) then
		self:openPopup( "Twitch_Connect", event.controller )
	else
		self:openPopup( "Twitch_UnRegister", event.controller )
	end
end

CoD.Options.TwitchConnectComplete = function ( self, event )
	CoD.Options.UpdateTwitchButtonText( self.twitchAccountButton, event.controller )
end

CoD.Options.AddBackButtonTimer = function ( self, event )
	self:addBackButton()
	self.backButtonTimer:close()
	self.backButtonTimer = nil
end

CoD.Options.AddElements = function ( self, controller )
	self.fadeInTime = 250
	self.fadeOutTime = 150
	local isDemoPlaying = Engine.IsDemoPlaying()
	if not CoD.isWIIU then
		if isDemoPlaying then
			self.theaterButtonLayoutButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_THEATER_BUTTON_LAYOUT_CAPS" ), "demo_controllerconfig", Engine.Localize( "MENU_THEATER_BUTTON_LAYOUT_DESC" ) )
			CoD.ButtonLayout.AddChoices( self.theaterButtonLayoutButton, controller )
			self.theaterButtonLayoutButton:disableCycling()
			self.theaterButtonLayoutButton:registerEventHandler( "button_action", CoD.Options.Button_ButtonLayout )
		end
		self.lookInversionButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_LOOK_INVERSION_CAPS" ), "input_invertpitch", Engine.Localize( "MENU_LOOK_INVERSION_DESC" ) )
		CoD.Options.Button_AddChoices_EnabledOrDisabled( self.lookInversionButton )
		if not isDemoPlaying then
			self.controllerVibrationButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_CONTROLLER_VIBRATION_CAPS" ), "gpad_rumble", Engine.Localize( "MENU_CONTROLLER_VIBRATION_DESC" ) )
			CoD.Options.Button_AddChoices_EnabledOrDisabled( self.controllerVibrationButton )
			self.stickLayoutButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "PLATFORM_THUMBSTICK_LAYOUT_CAPS" ), "gpad_sticksConfig", Engine.Localize( "PLATFORM_THUMBSTICK_LAYOUT_DESC" ) )
			CoD.StickLayout.AddChoices( self.stickLayoutButton )
			self.stickLayoutButton:disableCycling()
			self.stickLayoutButton:registerEventHandler( "button_action", CoD.Options.Button_StickLayout )
			self.buttonLayoutButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ), "gpad_buttonsConfig", Engine.Localize( "MENU_BUTTON_LAYOUT_DESC" ) )
			CoD.ButtonLayout.AddChoices( self.buttonLayoutButton, controller )
			self.buttonLayoutButton:disableCycling()
			self.buttonLayoutButton:registerEventHandler( "button_action", CoD.Options.Button_ButtonLayout )
		end
		if Engine.DvarBool( nil, "aim_view_sensitivity_component" ) then
			self.lookSensitivityHorizontalButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_LOOK_SENSITIVITY_HORIZONTAL_CAPS" ), "input_viewSensitivityHorizontal", Engine.Localize( "MENU_LOOK_SENSITIVITY_HORIZONTAL_DESC" ) )
			CoD.Options.Button_LookSensitivity_AddChoices( self.lookSensitivityHorizontalButton )
			self.lookSensitivityVerticalButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL_CAPS" ), "input_viewSensitivityVertical", Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL_DESC" ) )
			CoD.Options.Button_LookSensitivity_AddChoices( self.lookSensitivityVerticalButton )
		else
			self.lookSensitivityButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_LOOK_SENSITIVITY_CAPS" ), "input_viewSensitivity", Engine.Localize( "MENU_LOOK_SENSITIVITY_DESC" ) )
			CoD.Options.Button_LookSensitivity_AddChoices( self.lookSensitivityButton )
		end
	end
	if not isDemoPlaying then
		if Engine.GetGametypeSetting( "disallowaimslowdown" ) == 1 then
			self.targetAssistButton = self.buttonList:addButton( Engine.Localize( "MENU_TARGET_ASSIST_CAPS" ), Engine.Localize( "MENU_TARGET_ASSIST_DESC" ) )
			self.targetAssistButton:disable()
		else
			local targetAssistVarName = "input_targetassist"
			if CoD.isCampaign or CoD.isZombie then
				targetAssistVarName = "input_autoAim"
			end
			self.targetAssistButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_TARGET_ASSIST_CAPS" ), targetAssistVarName, Engine.Localize( "MENU_TARGET_ASSIST_DESC" ) )
			CoD.Options.Button_AddChoices_EnabledOrDisabled( self.targetAssistButton )
		end
	end
	if CoD.isCampaign == false then
		self.playerNameIndicatorButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.ToUpper( Engine.Localize( "PLATFORM_TEAM_INDICATOR" ) ), "team_indicator", "" )
		CoD.Options.Button_PlayerNameIndicator_AddChoices( self.playerNameIndicatorButton )
	end
	if CoD.isCampaign == false then
		self.colorBlindAssistButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_COLOR_BLIND_ASSIST_CAPS" ), "colorblind_assist", Engine.Localize( "MENU_COLOR_BLIND_ASSIST_DESC" ) )
		CoD.Options.Button_AddChoices_OnOrOff( self.colorBlindAssistButton )
	end
	if Engine.SplitscreenNum() == 1 or Engine.IsPrimaryLocalClient( controller ) then
		self.audioSettingsButton = self.buttonList:addButton( Engine.Localize( "MENU_AUDIO_SETTINGS_CAPS" ), Engine.Localize( "MENU_AUDIO_SETTINGS_DESC" ) )
		self.audioSettingsButton:registerEventHandler( "button_action", CoD.Options.Button_AudioSettings )
	end
	self.graphicsSettingsButton = self.buttonList:addButton( Engine.Localize( "MENU_GRAPHICS_SETTINGS_CAPS" ), Engine.Localize( "MENU_GRAPHICS_SETTINGS_DESC" ) )
	self.graphicsSettingsButton:registerEventHandler( "button_action", CoD.Options.Button_GraphicsSettings )
	if CoD.isCampaign == true and CoD.Options.SupportsSubtitles() then
		self.subtitlesButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_SUBTITLES_CAPS" ), "cg_subtitles", Engine.Localize( "MENU_SUBTITLES_DESC" ) )
		CoD.Options.Button_AddChoices_EnabledOrDisabled( self.subtitlesButton )
	end
	if CoD.Options.SupportsMatureContent() then
		self.matureContentButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_MATURE_CAPS" ), "cg_mature", Engine.Localize( "MENU_MATURE_CONTENT_DESC" ) )
		self.matureContentButton.parent = self
		CoD.Options.Button_AddChoices_EnabledOrDisabled( self.matureContentButton )
		self.matureContentButton:disableCycling()
		self.matureContentButton:registerEventHandler( "button_action", function ( self, event )
			CoD.Options.OpenMatureContent( self.parent, event )
		end )
	end
	if not Engine.IsInGame() and Engine.IsProfileSignedIn( controller ) and not Engine.IsBetaBuild() then
		self.loadByDefaultButton = self.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_DEFAULT_LOAD_CAPS" ), "quick_launch_mode", Engine.Localize( "MENU_DEFAULT_LOAD_DESC" ) )
		CoD.Options.Button_LoadByDefault_AddChoices( self.loadByDefaultButton )
	end
	if CoD.isMultiplayer == true and CoD.isZombie == false and not Engine.IsInGame() and Engine.IsSignedInToDemonware( contoller ) then
		if Engine.IsYouTubeAccountChecked( controller ) then
			CoD.Options.AddYouTubeButton( self, controller )
		elseif self.youtubeCheckTimer == nil then
			self.youtubeCheckTimer = LUI.UITimer.new( 200, {
				name = "check_for_youtube_account",
				controller = controller
			} )
			self:addElement( self.youtubeCheckTimer )
		end
		if Engine.DvarBool( nil, "twEnabled" ) then
			if Engine.IsTwitterAccountChecked( controller ) then
				CoD.Options.AddTwitterButton( self, controller )
			elseif self.twitterCheckTimer == nil then
				self.twitterCheckTimer = LUI.UITimer.new( 200, {
					name = "check_for_twitter_account",
					controller = controller
				} )
				self:addElement( self.twitterCheckTimer )
			end
		end
		if CoD.LiveStream.TwitchEnabled() then
			if Engine.IsTwitchAccountChecked( controller ) then
				CoD.Options.AddTwitchButton( self, controller )
			elseif self.twitchCheckTimer == nil then
				self.twitchCheckTimer = LUI.UITimer.new( 200, {
					name = "check_for_twitch_account",
					controller = controller
				} )
				self:addElement( self.twitchCheckTimer )
			end
		end
	end
	if isDemoPlaying then
		self:setPreviousMenu( "Demo_InGame" )
	elseif CoD.isCampaign == true and Engine.IsMenuLevel() == true then
		self:setPreviousMenu( "CampaignMenu" )
	end
	if CoD.useController and not self:restoreState() then
		if isDemoPlaying then
			if not CoD.isWIIU then
				self.theaterButtonLayoutButton:processEvent( {
					name = "gain_focus"
				} )
			else
				self.playerNameIndicatorButton:processEvent( {
					name = "gain_focus"
				} )
			end
		elseif CoD.isWIIU then
			self.targetAssistButton:processEvent( {
				name = "gain_focus"
			} )
		else
			self.lookInversionButton:processEvent( {
				name = "gain_focus"
			} )
		end
	end
end

CoD.Options.CreateFakeStreamedImage = function ( self, image )
	local fakeImage = LUI.UIStreamedImage.new()
	fakeImage:setLeftRight( false, false, 0, 0 )
	fakeImage:setTopBottom( false, false, 0, 0 )
	fakeImage:setImage( RegisterMaterial( image ) )
	fakeImage:setAlpha( 0 )
	self:addElement( fakeImage )
end

CoD.Options.AddControllerFakeStreamedImages = function ( self )
	local controllerMaterial = nil
	if CoD.isPS4 then
		controllerMaterial = "ps4_controller_top"
	else
		controllerMaterial = "xenon_controller_top"
	end
	CoD.Options.CreateFakeStreamedImage( self, controllerMaterial )
	CoD.Options.CreateFakeStreamedImage( self, "xenon_stick_move" )
	CoD.Options.CreateFakeStreamedImage( self, "xenon_stick_turn" )
	CoD.Options.CreateFakeStreamedImage( self, "xenon_stick_move_turn" )
	CoD.Options.CreateFakeStreamedImage( self, "xenon_stick_move_look" )
end

LUI.createMenu.OptionsMenu = function ( controller )
	local optionsMenu = nil
	if Engine.IsInGame() then
		optionsMenu = CoD.InGameMenu.New( "OptionsMenu", controller, Engine.Localize( "MENU_OPTIONS_CAPS" ) )
		optionsMenu:setPreviousMenu( "class" )
		if Engine.IsInGame() and Engine.IsSplitscreen() then
			optionsMenu:sizeToSafeArea( controller )
			optionsMenu:updateTitleForSplitscreen()
			optionsMenu:updateButtonPromptBarsForSplitscreen()
		end
	else
		optionsMenu = CoD.Menu.New( "OptionsMenu" )
		optionsMenu:setOwner( controller )
		optionsMenu:addTitle( Engine.Localize( "MENU_OPTIONS_CAPS" ) )
		local background = LUI.UIImage.new( {
			leftAnchor = false,
			rightAnchor = false,
			left = -640,
			right = 640,
			topAnchor = false,
			bottomAnchor = false,
			top = -360,
			bottom = 360,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 1
		} )
		background:setPriority( -100 )
		optionsMenu:addElement( background )
	end
	optionsMenu.close = CoD.Options.Close
	optionsMenu:registerEventHandler( "open_stick_layout", CoD.Options.OpenStickLayout )
	optionsMenu:registerEventHandler( "open_button_layout", CoD.Options.OpenButtonLayout )
	optionsMenu:registerEventHandler( "open_audio_settings", CoD.Options.OpenAudioSettings )
	optionsMenu:registerEventHandler( "open_graphics_settings", CoD.Options.OpenGraphicsSettings )
	optionsMenu:registerEventHandler( "button_prompt_system_info", CoD.Options.OpenSystemInfo )
	optionsMenu:registerEventHandler( "mature_content_button", CoD.Options.OpenMatureContent )
	optionsMenu:registerEventHandler( "open_reticle", CoD.Options.OpenReticle )
	optionsMenu:registerEventHandler( "open_save_device_warning", CoD.Options.OpenSaveDeviceWarning )
	optionsMenu:registerEventHandler( "check_for_youtube_account", CoD.Options.CheckForYouTubeAccount )
	optionsMenu:registerEventHandler( "youtube_connect", CoD.Options.OpenYouTubeConnect )
	optionsMenu:registerEventHandler( "youtube_connect_complete", CoD.Options.YouTubeConnectComplete )
	optionsMenu:registerEventHandler( "check_for_twitter_account", CoD.Options.CheckForTwitterAccount )
	optionsMenu:registerEventHandler( "twitter_connect", CoD.Options.OpenTwitterConnect )
	optionsMenu:registerEventHandler( "twitter_connect_complete", CoD.Options.TwitterConnectComplete )
	optionsMenu:registerEventHandler( "check_for_twitch_account", CoD.Options.CheckForTwitchAccount )
	optionsMenu:registerEventHandler( "twitch_connect", CoD.Options.OpenTwitchConnect )
	optionsMenu:registerEventHandler( "twitch_connect_complete", CoD.Options.TwitchConnectComplete )
	CoD.Options.AddControllerFakeStreamedImages( optionsMenu )
	optionsMenu:addSelectButton()
	optionsMenu:registerEventHandler( "add_back_button", CoD.Options.AddBackButtonTimer )
	optionsMenu.backButtonTimer = LUI.UITimer.new( 350, {
		name = "add_back_button",
		controller = controller
	} )
	optionsMenu:addElement( optionsMenu.backButtonTimer )
	if CoD.isMultiplayer == true and not Engine.IsInGame() then
		optionsMenu.systemInfoButton = CoD.ButtonPrompt.new( "select", Engine.Localize( "MENU_SYSTEM_INFO_CAPS" ), optionsMenu, "button_prompt_system_info" )
		optionsMenu:addRightButtonPrompt( optionsMenu.systemInfoButton )
	end
	local width = CoD.Options.Width
	local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
	buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
	optionsMenu:addElement( buttonListScaleContainer )
	local buttonListLeft = 0
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		buttonListLeft = CoD.Menu.SplitscreenSideOffset
	end
	optionsMenu.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = buttonListLeft,
		right = buttonListLeft + CoD.ButtonList.DefaultWidth - 20,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight,
		bottom = CoD.Menu.TitleHeight + 720
	} )
	buttonListScaleContainer:addElement( optionsMenu.buttonList )
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		optionsMenu.buttonList.hintText:hide()
	end
	CoD.Options.AddElements( optionsMenu, controller )
	if CoD.isWIIU then
		optionsMenu:registerEventHandler( "controller_changed", CoD.Options.ControllerChanged )
	end
	return optionsMenu
end

LUI.createMenu.ConfigureSettingsPopup = function ( controller )
	local configurePopup = CoD.Menu.NewSmallPopup( "ConfigureSettingsPopup" )
	CoD.perController[controller].firstTime = true
	configurePopup:registerEventHandler( "confirm_action", CoD.GraphicsSettings.OpenBrightness )
	local font = "Default"
	local top = 0
	configurePopup.title = LUI.UIText.new()
	configurePopup.title:setLeftRight( true, true, 0, 0 )
	configurePopup.title:setTopBottom( true, false, top, top + CoD.textSize[font] )
	configurePopup.title:setAlignment( LUI.Alignment.Left )
	configurePopup.title:setFont( CoD.fonts[font] )
	configurePopup.title:setText( Engine.Localize( "MENU_SETUP_CAPS" ) )
	configurePopup:addElement( configurePopup.title )
	top = top + CoD.textSize[font] * 2
	configurePopup.description = LUI.UIText.new()
	configurePopup.description:setLeftRight( true, true, 0, 0 )
	configurePopup.description:setTopBottom( true, false, top, top + CoD.textSize[font] )
	configurePopup.description:setAlignment( LUI.Alignment.Left )
	configurePopup.description:setFont( CoD.fonts[font] )
	configurePopup.description:setText( Engine.Localize( "MENU_SETUP_INSTRUCTIONS" ) )
	configurePopup:addElement( configurePopup.description )
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height - 20,
		bottom = -20
	} )
	configurePopup:addElement( buttonList )
	local yesButton = buttonList:addButton( Engine.Localize( "MENU_OK_CAPS" ) )
	yesButton:setActionEventName( "confirm_action" )
	yesButton:processEvent( {
		name = "gain_focus"
	} )
	configurePopup:addSelectButton()
	return configurePopup
end

LUI.createMenu.MatureContentPopup = function ( controller )
	local matureContentPopup = CoD.Menu.NewSmallPopup( "ConfigureSettingsPopup" )
	matureContentPopup:registerEventHandler( "accept_action", CoD.Options.AcceptMatureContent )
	matureContentPopup:registerEventHandler( "decline_action", CoD.Options.DeclineMatureContent )
	matureContentPopup.closePopup = CoD.Options.CloseMatureContentPopup
	local font = "Default"
	local top = 0
	matureContentPopup.title = LUI.UIText.new()
	matureContentPopup.title:setLeftRight( true, true, 0, 0 )
	matureContentPopup.title:setTopBottom( true, false, top, top + CoD.textSize[font] )
	matureContentPopup.title:setAlignment( LUI.Alignment.Left )
	matureContentPopup.title:setFont( CoD.fonts[font] )
	matureContentPopup.title:setText( Engine.Localize( "MENU_GRAPHIC_CONTENT_CAPS" ) )
	matureContentPopup:addElement( matureContentPopup.title )
	top = top + CoD.textSize[font]
	matureContentPopup.description = LUI.UIText.new()
	matureContentPopup.description:setLeftRight( true, true, 0, 0 )
	matureContentPopup.description:setTopBottom( true, false, top, top + CoD.textSize[font] )
	matureContentPopup.description:setAlignment( LUI.Alignment.Left )
	matureContentPopup.description:setFont( CoD.fonts[font] )
	matureContentPopup.description:setText( Engine.Localize( "MENU_DOYOUWANT_MATURE_CONTENT" ) )
	matureContentPopup:addElement( matureContentPopup.description )
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 2 - 21,
		bottom = -15
	} )
	matureContentPopup:addElement( buttonList )
	local yesButton = buttonList:addButton( Engine.Localize( "MENU_YES_CAPS" ) )
	yesButton:setActionEventName( "accept_action" )
	local noButton = buttonList:addButton( Engine.Localize( "MENU_NO_CAPS" ) )
	noButton:setActionEventName( "decline_action" )
	if Engine.ProfileInt( controller, "cg_mature" ) == 0 then
		noButton:processEvent( {
			name = "gain_focus"
		} )
	else
		yesButton:processEvent( {
			name = "gain_focus"
		} )
	end
	matureContentPopup:addSelectButton()
	return matureContentPopup
end

CoD.Options.AcceptMatureContent = function ( self, event )
	local controller = event.controller
	Engine.ExecNow( controller, "setprofile cg_blood 1" )
	Engine.ExecNow( controller, "setprofile cg_mature 1" )
	self:closePopup( controller )
end

CoD.Options.DeclineMatureContent = function ( self, event )
	local controller = event.controller
	Engine.ExecNow( controller, "setprofile cg_blood 0" )
	Engine.ExecNow( controller, "setprofile cg_mature 0" )
	self:closePopup( controller )
end

CoD.Options.CloseMatureContentPopup = function ( self, controller )
	Engine.ExecNow( controller, "setprofile com_first_time 0" )
	Engine.ExecNow( controller, "updategamerprofile" )
	if CoD.perController[controller].firstTime then
		self:dispatchEventToParent( {
			name = "open_main_menu",
			controller = controller
		} )
	else
		self:goBack( controller )
	end
	CoD.perController[controller].firstTime = nil
	self:close()
end

