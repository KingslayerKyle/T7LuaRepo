require( "ui.T6.Options" )

CoD.AudioSettings = {}
CoD.AudioSettings.AdjustSFX = "uin_loadout_nav"
CoD.AudioSettings.CycleSFX = "cac_grid_nav"
CoD.AudioSettings.TREYARCH_MIX = 0
CoD.AudioSettings.BASS_BOOST = 1
CoD.AudioSettings.HIGH_BOOST = 2
CoD.AudioSettings.SUPERCRUNCH = 3
CoD.AudioSettings.HEADPHONES = 4
CoD.AudioSettings.SupportsHearingImpairment = function ()
	local currentLanguage = Dvar.loc_language:get()
	if CoD.isSinglePlayer == true then
		return true
	else
		return false
	end
end

CoD.AudioSettings.Button_SystemTestButton = function ( self, event )
	Engine.PlaySound( "tst_test_system" )
end

CoD.AudioSettings.AddBackButtonTimer = function ( self, event )
	self:addBackButton()
	self.backButtonTimer:close()
	self.backButtonTimer = nil
end

LUI.createMenu.AudioSettings = function ( controller, userData )
	local audioSettingsMenu = nil
	if Engine.IsInGame() then
		audioSettingsMenu = CoD.InGameMenu.New( "AudioSettings", controller, Engine.Localize( "MENU_AUDIO_SETTINGS_CAPS" ), CoD.isSinglePlayer )
		if CoD.isSinglePlayer == false and Engine.IsInGame() and Engine.IsSplitscreen() then
			audioSettingsMenu:sizeToSafeArea( controller )
			audioSettingsMenu:updateTitleForSplitscreen()
			audioSettingsMenu:updateButtonPromptBarsForSplitscreen()
		end
	else
		audioSettingsMenu = CoD.Menu.New( "AudioSettings" )
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
		audioSettingsMenu:addElement( background )
		audioSettingsMenu:setOwner( controller )
		audioSettingsMenu:addTitle( Engine.Localize( "MENU_AUDIO_SETTINGS_CAPS" ) )
		if CoD.isSinglePlayer == false then
			audioSettingsMenu:addLargePopupBackground()
			audioSettingsMenu:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	audioSettingsMenu:setPreviousMenu( "OptionsMenu" )
	audioSettingsMenu.controller = controller
	audioSettingsMenu:setOwner( controller )
	audioSettingsMenu:registerEventHandler( "open_speaker_setup", CoD.AudioSettings.OpenSpeakerSetup )
	if CoD.isSinglePlayer == true and CoD.perController[controller].firstTime then
		audioSettingsMenu.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_ACCEPT" ), audioSettingsMenu, "accept_button" )
		audioSettingsMenu:addLeftButtonPrompt( audioSettingsMenu.acceptButton )
		audioSettingsMenu:registerEventHandler( "accept_button", CoD.AudioSettings.CloseFirstTime )
		audioSettingsMenu:registerEventHandler( "remove_accept_button", CoD.AudioSettings.RemoveAcceptButton )
		audioSettingsMenu:registerEventHandler( "readd_accept_button", CoD.AudioSettings.ReaddAcceptButton )
		CoD.AudioSettings.ListHeight = 511.25
	else
		audioSettingsMenu:addSelectButton()
		audioSettingsMenu:registerEventHandler( "add_back_button", CoD.AudioSettings.AddBackButtonTimer )
		audioSettingsMenu.backButtonTimer = LUI.UITimer.new( 350, {
			name = "add_back_button",
			controller = controller
		} )
		audioSettingsMenu:addElement( audioSettingsMenu.backButtonTimer )
	end
	audioSettingsMenu.close = CoD.Options.Close
	local buttonListLeft = 0
	if Engine.IsInGame() and CoD.isSinglePlayer == false and Engine.IsSplitscreen() then
		buttonListLeft = CoD.Menu.SplitscreenSideOffset
	end
	local buttonList = CoD.ButtonList.new()
	buttonList:setLeftRight( true, false, buttonListLeft, buttonListLeft + CoD.ButtonList.DefaultWidth - 20 )
	buttonList:setTopBottom( true, false, CoD.Menu.TitleHeight, CoD.Menu.TitleHeight + 720 )
	if CoD.isSinglePlayer then
		audioSettingsMenu:addElement( buttonList )
		if userData and userData.height ~= nil then
			buttonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			buttonList:setTopBottom( false, false, -userData.height / 2, userData.height / 2 )
			CoD.AudioSettings.ListHeight = userData.height
		elseif CoD.AudioSettings.ListHeight then
			buttonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			buttonList:setTopBottom( false, false, -CoD.AudioSettings.ListHeight / 2, CoD.AudioSettings.ListHeight / 2 )
		end
	else
		local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
		buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
		buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
		audioSettingsMenu:addElement( buttonListScaleContainer )
		buttonListScaleContainer:addElement( buttonList )
	end
	local voiceVolumeSlider = buttonList:addProfileLeftRightSlider( controller, Engine.Localize( "MENU_VOICE_VOLUME_CAPS" ), "snd_menu_voice", 0, 1, Engine.Localize( "MENU_VOICE_VOLUME_DESC" ), nil, nil, CoD.SafeArea.AdjustSFX )
	local musicVolumeSlider = buttonList:addProfileLeftRightSlider( controller, Engine.Localize( "MENU_MUSIC_VOLUME_CAPS" ), "snd_menu_music", 0, 1, Engine.Localize( "MENU_MUSIC_VOLUME_DESC" ), nil, nil, CoD.SafeArea.AdjustSFX )
	local sfxVolumeSlider = buttonList:addProfileLeftRightSlider( controller, Engine.Localize( "MENU_SFX_VOLUME_CAPS" ), "snd_menu_sfx", 0, 1, Engine.Localize( "MENU_SFX_VOLUME_DESC" ), nil, nil, CoD.SafeArea.AdjustSFX )
	local masterVolumeSlider = buttonList:addProfileLeftRightSlider( controller, Engine.Localize( "MENU_MASTER_VOLUME_CAPS" ), "snd_menu_master", 0, 1, Engine.Localize( "MENU_MASTER_VOLUME_DESC" ), nil, nil, CoD.SafeArea.AdjustSFX )
	if CoD.isSinglePlayer == true then
		local cinematicVolumeSlider = buttonList:addProfileLeftRightSlider( controller, Engine.Localize( "MENU_CINEMATICS_VOLUME_CAPS" ), "snd_menu_cinematic", 0, 1, Engine.Localize( "MENU_CINEMATICS_VOLUME_DESC" ), nil, nil, CoD.SafeArea.AdjustSFX )
	end
	if CoD.isSinglePlayer == false and CoD.isZombie == false then
		local shoutcastGameSlider = buttonList:addProfileLeftRightSlider( controller, Engine.Localize( "MENU_SHOUTCAST_GAME_VOLUME_CAPS" ), "snd_shoutcast_game", 0, 2, Engine.Localize( "MENU_SHOUTCAST_GAME_VOLUME_DESC" ), nil, nil, CoD.SafeArea.AdjustSFX )
		local shoutcastVoipSlider = buttonList:addProfileLeftRightSlider( controller, Engine.Localize( "MENU_SHOUTCAST_VOIP_VOLUME_CAPS" ), "snd_shoutcast_voip", 0, 2, Engine.Localize( "MENU_SHOUTCAST_VOIP_VOLUME_DESC" ), nil, nil, CoD.SafeArea.AdjustSFX )
	end
	if CoD.AudioSettings.SupportsHearingImpairment() then
		local hearingImpaired = buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_HEARING_IMPAIRED_CAPS" ), "snd_menu_hearing_impaired", Engine.Localize( "MENU_HEARING_IMPAIRED_DESC" ), nil, nil, CoD.AudioSettings.CycleSFX )
		CoD.Options.Button_AddChoices_OnOrOff( hearingImpaired )
	end
	buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	local presetsOption = buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_AUDIO_PRESETS_CAPS" ), "snd_menu_presets", "", nil, nil, CoD.AudioSettings.CycleSFX )
	CoD.AudioSettings.Button_AudioPresets_AddChoices( presetsOption )
	local isDemoPlaying = Engine.IsDemoPlaying()
	if not Engine.IsInGame() and not isDemoPlaying then
		local systemTestButton = buttonList:addButton( Engine.Localize( "MENU_SYSTEM_TEST_CAPS" ), Engine.Localize( "MENU_SYSTEM_TEST_DESC" ) )
		systemTestButton:registerEventHandler( "button_action", CoD.AudioSettings.Button_SystemTestButton )
		if CoD.isSinglePlayer == true and CoD.perController[controller].firstTime then
			systemTestButton:registerEventHandler( "gain_focus", CoD.AudioSettings.SystemTextGainFocus )
			systemTestButton:registerEventHandler( "lose_focus", CoD.AudioSettings.SystemTextLoseFocus )
		end
	end
	if CoD.useController and not audioSettingsMenu:restoreState() then
		voiceVolumeSlider:processEvent( {
			name = "gain_focus"
		} )
	end
	audioSettingsMenu.buttonList = buttonList
	return audioSettingsMenu
end

CoD.AudioSettings.RemoveAcceptButton = function ( self, event )
	self.acceptButton:close()
	self.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_SELECT" ), self )
	self:addLeftButtonPrompt( self.acceptButton )
end

CoD.AudioSettings.ReaddAcceptButton = function ( self, event )
	self.acceptButton:close()
	self.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_ACCEPT" ), self, "accept_button" )
	self:addLeftButtonPrompt( self.acceptButton )
end

CoD.AudioSettings.SystemTextGainFocus = function ( self, event )
	local retVal = LUI.UIButton.gainFocus( self, event )
	self:dispatchEventToParent( {
		name = "remove_accept_button"
	} )
	return retVal
end

CoD.AudioSettings.SystemTextLoseFocus = function ( self, event )
	LUI.UIButton.loseFocus( self, event )
	self:dispatchEventToParent( {
		name = "readd_accept_button"
	} )
end

CoD.AudioSettings.CloseFirstTime = function ( self, event )
	if CoD.isPC then
		if not CoD.Options.SupportsMatureContent() then
			Engine.ExecNow( event.controller, "setprofile com_first_time 0" )
			Engine.ExecNow( event.controller, "updategamerprofile" )
			self:dispatchEventToParent( {
				name = "open_main_menu",
				controller = event.controller
			} )
			CoD.perController[event.controller].firstTime = nil
		else
			self:openMenu( "MatureContentPopup", event.controller )
		end
		self:close()
	else
		self:openMenu( "SafeArea", event.controller )
		self:close()
	end
end

CoD.AudioSettings.Button_AudioPresets_SelectionChanged = function ( choiceParams )
	Engine.SetProfileVar( choiceParams.parentSelectorButton.m_currentController, choiceParams.parentSelectorButton.m_profileVarName, choiceParams.value )
	choiceParams.parentSelectorButton.hintText = choiceParams.extraParams.associatedHintText
	local buttonList = choiceParams.parentSelectorButton:getParent()
	if buttonList ~= nil and buttonList.hintText ~= nil then
		buttonList.hintText:updateText( choiceParams.parentSelectorButton.hintText )
	end
end

CoD.AudioSettings.Button_AudioPresets_AddChoices = function ( button )
	button:addChoice( Engine.Localize( "MENU_TREYARCH_MIX_CAPS" ), CoD.AudioSettings.TREYARCH_MIX, {
		associatedHintText = Engine.Localize( "MENU_TREYARCH_MIX_DESC" )
	}, CoD.Options.Button_EnumProfile_SelectionChanged )
	button:addChoice( Engine.Localize( "MENU_BASS_BOOST_CAPS" ), CoD.AudioSettings.BASS_BOOST, {
		associatedHintText = Engine.Localize( "MENU_BASS_BOOST_DESC" )
	}, CoD.Options.Button_EnumProfile_SelectionChanged )
	button:addChoice( Engine.Localize( "MENU_HIGH_BOOST_CAPS" ), CoD.AudioSettings.HIGH_BOOST, {
		associatedHintText = Engine.Localize( "MENU_HIGH_BOOST_DESC" )
	}, CoD.Options.Button_EnumProfile_SelectionChanged )
	button:addChoice( Engine.Localize( "MENU_SUPERCRUNCH_CAPS" ), CoD.AudioSettings.SUPERCRUNCH, {
		associatedHintText = Engine.Localize( "MENU_SUPERCRUNCH_DESC" )
	}, CoD.Options.Button_EnumProfile_SelectionChanged )
	button:addChoice( Engine.Localize( "MENU_HEADPHONES_CAPS" ), CoD.AudioSettings.HEADPHONES, {
		associatedHintText = Engine.Localize( "MENU_HEADPHONES_DESC" )
	}, CoD.Options.Button_EnumProfile_SelectionChanged )
end

