require( "ui_mp.T6.Menus.EliteRegistrationEmailPopup" )

CoD.EliteRegistrationPopup = {}
CoD.EliteRegistrationPopup.Width = 700
CoD.EliteRegistrationPopup.Height = 440
CoD.EliteRegistrationAutoFillPopup = {}
CoD.EliteRegistrationAutoFillPopup.NO_DATA_REF = ""
CoD.EliteRegistrationAutoFillPopup.processing_type = 0
CoD.EliteRegistrationAutoFillPopup.account_name_button = {}
CoD.EliteRegistrationAutoFillPopup.account_name_text = ""
CoD.EliteRegistrationAutoFillPopup.password_button = {}
CoD.EliteRegistrationAutoFillPopup.password_text = ""
CoD.EliteRegistrationAutoFillPopup.submit_button = {}
CoD.EliteRegistrationPopup.AddButton = function ( inputPopup, buttonText, actionEventName )
	local button = inputPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteRegistrationPopup.YesButtonPressed = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "elite_registration_email_popup_requested",
		controller = event.controller
	} )
end

CoD.EliteRegistrationPopup.NoButtonPressed = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "elite_registration_ended",
		controller = event.controller
	} )
	Engine.EReg_PlayerRefusedOrError( event.controller )
end

CoD.EliteRegistrationPopup.GoBack = function ( self, controller )
	Engine.Exec( controller, "resetThumbnailViewer" )
	CoD.Menu.goBack( self, controller )
end

CoD.EliteRegistrationPopup.GetLogoContainer = function ( data, isFounder )
	local logoSize = 230
	local logoTopOffset = 90
	local logoContainer = LUI.UIElement.new()
	logoContainer:setLeftRight( false, true, -logoSize, 0 )
	logoContainer:setTopBottom( false, false, -(logoSize / 2) - logoTopOffset, logoSize / 2 - logoTopOffset )
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, true, 0, 0 )
	logo:setTopBottom( true, true, 0, 0 )
	logo:setImage( RegisterMaterial( "motd_elite_logo" ) )
	logoContainer:addElement( logo )
	local image = nil
	if isFounder == true then
		image = data.founderImage
	else
		image = data.eliteImage
	end
	if data ~= nil and data.isValid == true and image ~= nil and image ~= "" then
		local memberIconSize = logoSize * 1.5
		local memberIconTopOffset = 120
		local memberIconLeftOffset = -60
		local memberIcon = LUI.UIImage.new()
		memberIcon:setLeftRight( true, false, memberIconLeftOffset, memberIconLeftOffset + memberIconSize )
		memberIcon:setTopBottom( true, false, memberIconTopOffset, memberIconTopOffset + memberIconSize )
		memberIcon:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_MOTD, CoD.MOTD.GetImageFileID( image ) )
		logoContainer:addElement( memberIcon )
		Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_MOTD, CoD.MOTD.GetImageFileID( image ), 1 )
	end
	return logoContainer
end

CoD.EliteRegistrationPopup.DescriptorsDone = function ( newPopup, event )
	local controller = event.controller
	newPopup.spinner:hide()
	local data = Engine.GetMOTD()
	local top = 0
	if CoD.perController[controller].openedEliteFromLiveStream ~= true then
		newPopup:addTitle( Engine.Localize( "MENU_MESSAGE_OF_THE_DAY" ) )
		top = top + CoD.textSize.Big + 30
		newPopup.codEliteLabel = LUI.UIText.new()
		newPopup.codEliteLabel:setLeftRight( true, true, 0, 0 )
		newPopup.codEliteLabel:setTopBottom( true, false, top, top + CoD.textSize.Big )
		newPopup.codEliteLabel:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		newPopup.codEliteLabel:setAlignment( LUI.Alignment.Left )
		newPopup.codEliteLabel:setFont( CoD.fonts.Big )
		newPopup.codEliteLabel:setText( Engine.Localize( "MPUI_COD_ELITE_CAPS" ) )
		newPopup:addElement( newPopup.codEliteLabel )
		top = top + CoD.textSize.Big + 15
	else
		newPopup:addTitle( Engine.Localize( "MPUI_COD_ELITE_CAPS" ) )
		top = top + CoD.textSize.Big + 15
		local liveStreamMessage = LUI.UIText.new()
		liveStreamMessage:setLeftRight( true, true, 0, 0 )
		liveStreamMessage:setTopBottom( true, false, top, top + CoD.textSize.Default )
		liveStreamMessage:setAlignment( LUI.Alignment.Left )
		liveStreamMessage:setFont( CoD.fonts.Default )
		liveStreamMessage:setText( Engine.Localize( "MPUI_LIVESTREAM_ELITE_MSG" ) )
		liveStreamMessage:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		liveStreamMessage:setAlpha( 1 )
		newPopup:addElement( liveStreamMessage )
		top = top + CoD.textSize.Default * 2
	end
	local alreadyRegistered = Engine.IsPlayerEliteRegistered( controller )
	if alreadyRegistered then
		top = top + CoD.textSize.Default * 1
		newPopup.benefit1Label = LUI.UIText.new()
		newPopup.benefit1Label:setLeftRight( true, false, 0, 530 )
		newPopup.benefit1Label:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
		newPopup.benefit1Label:setAlignment( LUI.Alignment.Left )
		newPopup.benefit1Label:setFont( CoD.fonts.Condensed )
		local localizedText = Engine.Localize( "MPUI_ELITE_VERIFY_MSG2" )
		newPopup.benefit1Label:setText( localizedText )
		newPopup:addElement( newPopup.benefit1Label )
	else
		newPopup.signupLabel = LUI.UIText.new()
		newPopup.signupLabel:setLeftRight( true, false, 0, 415 )
		newPopup.signupLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
		newPopup.signupLabel:setAlignment( LUI.Alignment.Left )
		newPopup.signupLabel:setFont( CoD.fonts.Default )
		newPopup.signupLabel:setAlpha( 0.4 )
		newPopup.signupLabel:setText( Engine.Localize( "MPUI_ELITE_ACTIVATE_MSG" ) )
		newPopup:addElement( newPopup.signupLabel )
		top = top + CoD.textSize.Default * 3
		local benefitLeftOffset = 30
		newPopup.benefit1Label = LUI.UIText.new()
		newPopup.benefit1Label:setLeftRight( true, false, benefitLeftOffset, 530 )
		newPopup.benefit1Label:setTopBottom( true, false, top, top + CoD.textSize.Default )
		newPopup.benefit1Label:setAlignment( LUI.Alignment.Left )
		newPopup.benefit1Label:setFont( CoD.fonts.Default )
		local localizedText = Engine.Localize( "MPUI_ELITE_BENEFITS_1" )
		newPopup.benefit1Label:setText( localizedText )
		newPopup:addElement( newPopup.benefit1Label )
	end
	local logoContainer = CoD.EliteRegistrationPopup.GetLogoContainer( data, false )
	newPopup:addElement( logoContainer )
	local bannerFontName = "Default"
	local bannerFont = CoD.fonts[bannerFontName]
	local bannerFontHeight = CoD.textSize[bannerFontName]
	local bannerTextSpacing = 2
	local bannerHeight = bannerFontHeight * 2 + bannerTextSpacing
	local bannerWidthOffset = 10
	local bannerWidth = CoD.Menu.Width - bannerWidthOffset * 2
	local bannerBottomOffset = CoD.ButtonPrompt.Height + 20
	local backgroundInset = 4
	local activateFontName = "Default"
	local activateFont = CoD.fonts[activateFontName]
	local activateFontHeight = CoD.textSize[activateFontName]
	local activateWidth = 350
	local activateHeight = activateFontHeight + 8
	local activateBottomOffset = bannerBottomOffset + bannerHeight + 15
	local activateContainer = LUI.UIElement.new()
	activateContainer:setLeftRight( true, false, bannerWidthOffset, bannerWidthOffset + activateWidth )
	activateContainer:setTopBottom( false, true, -activateBottomOffset - activateHeight, -activateBottomOffset )
	newPopup:addElement( activateContainer )
	local activateContainerBackground = LUI.UIImage.new()
	activateContainerBackground:setLeftRight( true, true, 1, -1 )
	activateContainerBackground:setTopBottom( true, true, 1, -1 )
	activateContainerBackground:setRGB( 0, 0, 0 )
	activateContainerBackground:setAlpha( 0.6 )
	activateContainer:addElement( activateContainerBackground )
	local activateContainerBackgroundGrad = LUI.UIImage.new()
	activateContainerBackgroundGrad:setLeftRight( true, true, backgroundInset, -backgroundInset )
	activateContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, bannerHeight * 0.6 )
	activateContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	activateContainerBackgroundGrad:setAlpha( 0.1 )
	activateContainer:addElement( activateContainerBackgroundGrad )
	local activatePromptContainer = LUI.UIElement.new()
	activatePromptContainer:setLeftRight( true, true, 8, 0 )
	activatePromptContainer:setTopBottom( true, true, 0, 0 )
	activateContainer:addElement( activatePromptContainer )
	activatePromptContainer:addElement( newPopup.activateButton )
	activateContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	activateContainer:addElement( activateContainer.border )
end

LUI.createMenu.EliteRegistrationPopup = function ( controller )
	local newPopup = CoD.Menu.New( "EliteRegistrationPopup" )
	newPopup:setOwner( controller )
	newPopup:addLargePopupBackground()
	newPopup.goBack = CoD.EliteRegistrationPopup.GoBack
	newPopup:registerEventHandler( "EliteRegistrationPopup_YesButtonPressed", CoD.EliteRegistrationPopup.YesButtonPressed )
	newPopup:registerEventHandler( "EliteRegistrationPopup_NoButtonPressed", CoD.EliteRegistrationPopup.NoButtonPressed )
	newPopup:registerEventHandler( "AutoFillPopup_Closed", CoD.EliteRegistrationPopup.AutoFillPopup_Closed )
	newPopup:registerEventHandler( "motd_image_descriptors_done", CoD.EliteRegistrationPopup.DescriptorsDone )
	newPopup:registerEventHandler( "signed_out", CoD.EliteRegistrationEmailPopup.SignedOut )
	if CoD.perController[controller].openedEliteFromLiveStream ~= true then
		newPopup:addSelectButton( Engine.Localize( "MENU_MOTD_ACCEPT" ), nil, "EliteRegistrationPopup_NoButtonPressed" )
	end
	newPopup:addBackButton()
	local buttonPromptStringToUse = "MPUI_ELITE_ENLIST_YES"
	if Engine.IsPlayerEliteRegistered( controller ) then
		buttonPromptStringToUse = "MPUI_ELITE_ENLIST2_YES"
	end
	newPopup.activateButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( buttonPromptStringToUse ), newPopup, "EliteRegistrationPopup_YesButtonPressed" )
	newPopup.spinner = LUI.UIImage.new()
	newPopup.spinner:setLeftRight( false, false, -32, 32 )
	newPopup.spinner:setTopBottom( false, false, -32, 32 )
	newPopup.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	newPopup:addElement( newPopup.spinner )
	Engine.Exec( controller, "resetThumbnailViewer" )
	Engine.Exec( controller, "motdGetImageDescriptors" )
	return newPopup
end

CoD.EliteRegistrationAutoFillPopup.Accept = function ( self, event )
	self:goBack( event.controller )
	Engine.PlayerRequestedAutoFill( event.controller, true )
	self.occludedMenu:processEvent( {
		name = "AutoFillPopup_Closed",
		controller = event.controller
	} )
end

CoD.EliteRegistrationAutoFillPopup.Refuse = function ( self, event )
	self:goBack( event.controller )
	Engine.PlayerRequestedAutoFill( event.controller, false )
	self.occludedMenu:processEvent( {
		name = "AutoFillPopup_Closed",
		controller = event.controller
	} )
end

CoD.EliteRegistrationAutoFillPopup.retrieved_get_user_details_result = function ( self, event )
	local error = nil
	if event.success ~= nil then
		self:goBack( event.controller )
		self.occludedMenu:processEvent( {
			name = "AutoFillPopup_Closed",
			controller = event.controller,
			password = CoD.EliteRegistrationAutoFillPopup.password_text
		} )
	elseif event.login_fail then
		CoD.EliteRegistrationAutoFillPopup.account_name_button:showRestrictedIcon( true )
		CoD.EliteRegistrationAutoFillPopup.password_button:showRestrictedIcon( true )
		CoD.EliteRegistrationAutoFillPopup.account_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_ERROR_UCD_PASSWORD" )
		CoD.EliteRegistrationAutoFillPopup.password_button.hintText = Engine.Localize( "MPUI_HINTTEXT_ERROR_UCD_PASSWORD" )
		CoD.EliteRegistrationAutoFillPopup.account_name_button:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationAutoFillPopup.submit_button:processEvent( {
			name = "lose_focus"
		} )
	else
		self:goBack( event.controller )
		self.occludedMenu:processEvent( {
			name = "AutoFillPopup_Closed",
			controller = event.controller,
			fail = true
		} )
	end
end

CoD.EliteRegistrationAutoFillPopup.Submit = function ( self, event )
	Engine.UCDLoginAttempt( event.controller, CoD.EliteRegistrationAutoFillPopup.account_name_text, CoD.EliteRegistrationAutoFillPopup.password_text )
end

CoD.EliteRegistrationAutoFillPopup.AddButton = function ( inputPopup, buttonText, actionEventName )
	local button = inputPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteRegistrationAutoFillPopup.AddNonRegistrationButton = function ( inputPopup, buttonText, actionEventName )
	local button = CoD.ButtonList.AddButton( inputPopup.buttonList, buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteRegistrationAutoFillPopup.account_name_button_pressed = function ( inputPopup, event )
	CoD.EliteRegistrationAutoFillPopup.processing_type = 0
	KeyboardExec( event.controller, "MPUI_ENTER_UCD_ACCOUNT_NAME", CoD.EliteRegistrationAutoFillPopup.account_name_text, 21, Enum.KeyboardType.KEYBOARD_TYPE_REGISTRATION_INPUT_ACCOUNTNAME, 0 )
end

CoD.EliteRegistrationAutoFillPopup.password_button_pressed = function ( inputPopup, event )
	CoD.EliteRegistrationAutoFillPopup.processing_type = 1
	KeyboardExec( event.controller, "MPUI_ENTER_PASSWORD", CoD.EliteRegistrationAutoFillPopup.password_text, 21, Enum.KeyboardType.KEYBOARD_TYPE_REGISTRATION_INPUT_PASSWORD, 1 )
end

local CheckButtonValueForError = function ( self, text, button, minStrSize, maxStrSize )
	local error = false
	if text == "" or text == 0 then
		error = true
	end
	if error then
		button:showRestrictedIcon( true )
	else
		button:showRestrictedIcon( false )
	end
	return error
end

CoD.EliteRegistrationAutoFillPopup.ObtainedKeyboardInput = function ( self, event )
	local validController = self.m_ownerController
	local displayedText = ""
	if event.input ~= nil then
		if CoD.EliteRegistrationAutoFillPopup.processing_type == 0 then
			CoD.EliteRegistrationAutoFillPopup.account_name_text = event.input
			CoD.EliteRegistrationAutoFillPopup.account_name_button:setLabel( GetDisplayedText( CoD.EliteRegistrationAutoFillPopup.account_name_text ) )
			local result = CheckButtonValueForError( self, event.input, CoD.EliteRegistrationAutoFillPopup.account_name_button )
			if result then
				CoD.EliteRegistrationAutoFillPopup.account_name_button:showRestrictedIcon( true )
				CoD.EliteRegistrationAutoFillPopup.account_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_NODATA_ERROR" )
			else
				CoD.EliteRegistrationAutoFillPopup.account_name_button:showRestrictedIcon( false )
				CoD.EliteRegistrationAutoFillPopup.account_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_UCD_ACCOUNT_NAME" )
			end
			CoD.EliteRegistrationAutoFillPopup.account_name_button:processEvent( {
				name = "gain_focus"
			} )
		elseif CoD.EliteRegistrationAutoFillPopup.processing_type == 1 then
			CoD.EliteRegistrationAutoFillPopup.password_text = event.input
			CoD.EliteRegistrationAutoFillPopup.password_button:setLabel( GetDisplayedPassword( CoD.EliteRegistrationAutoFillPopup.password_text ) )
			local result = CheckButtonValueForError( self, event.input, CoD.EliteRegistrationAutoFillPopup.password_button )
			if result then
				CoD.EliteRegistrationAutoFillPopup.password_button:showRestrictedIcon( true )
				CoD.EliteRegistrationAutoFillPopup.password_button.hintText = Engine.Localize( "MPUI_HINTTEXT_NODATA_ERROR" )
			else
				CoD.EliteRegistrationAutoFillPopup.password_button:showRestrictedIcon( false )
				CoD.EliteRegistrationAutoFillPopup.password_button.hintText = Engine.Localize( "MPUI_HINTTEXT_UCD_PASSWORD" )
			end
			CoD.EliteRegistrationAutoFillPopup.password_button:processEvent( {
				name = "gain_focus"
			} )
		end
	end
end

LUI.createMenu.EliteRegistrationAutoFillPopup = function ( controller, params )
	local AutoFillPopup = CoD.Menu.NewMediumPopup( "EliteRegistrationAutoFillPopup" )
	AutoFillPopup:addTitle( Engine.Localize( "MPUI_TITLE_AUTOFILL" ) )
	AutoFillPopup.goBack = CoD.EliteRegistrationPopup.GoBack
	Engine.Exec( controller, "resetThumbnailViewer" )
	local data = Engine.GetMOTD()
	CoD.EliteRegistrationAutoFillPopup.account_name_text = ""
	CoD.EliteRegistrationAutoFillPopup.password_text = ""
	AutoFillPopup:addSelectButton()
	AutoFillPopup:addBackButton()
	local top = CoD.textSize.Big + 20
	AutoFillPopup:registerEventHandler( "signed_out", CoD.EliteRegistrationEmailPopup.SignedOut )
	if params ~= nil and params.hasUCDAccount then
		AutoFillPopup:registerEventHandler( "EliteRegistrationAutoFillPopup_Submit", CoD.EliteRegistrationAutoFillPopup.Submit )
		AutoFillPopup:registerEventHandler( "account_name_button_pressed", CoD.EliteRegistrationAutoFillPopup.account_name_button_pressed )
		AutoFillPopup:registerEventHandler( "password_button_pressed", CoD.EliteRegistrationAutoFillPopup.password_button_pressed )
		AutoFillPopup:registerEventHandler( "ui_keyboard_input", CoD.EliteRegistrationAutoFillPopup.ObtainedKeyboardInput )
		AutoFillPopup:registerEventHandler( "retrieved_get_user_details_result", CoD.EliteRegistrationAutoFillPopup.retrieved_get_user_details_result )
		AutoFillPopup.message = LUI.UIText.new()
		AutoFillPopup.message:setLeftRight( true, true, 0, 0 )
		AutoFillPopup.message:setTopBottom( true, false, top, top + CoD.textSize.Default )
		AutoFillPopup.message:setFont( CoD.fonts.Default )
		AutoFillPopup.message:setAlignment( LUI.Alignment.Left )
		AutoFillPopup.message:setText( Engine.GetSelfGamertag( controller ) .. ", " .. Engine.Localize( "MPUI_AUTOFILL_UCDACCOUNT_DETECTED" ) )
		AutoFillPopup:addElement( AutoFillPopup.message )
		top = top + CoD.textSize.Default * 2
		AutoFillPopup.message2 = LUI.UIText.new()
		AutoFillPopup.message2:setLeftRight( true, true, 0, 0 )
		AutoFillPopup.message2:setTopBottom( true, false, top, top + CoD.textSize.Default )
		AutoFillPopup.message2:setFont( CoD.fonts.Default )
		AutoFillPopup.message2:setAlignment( LUI.Alignment.Left )
		AutoFillPopup.message2:setText( Engine.Localize( "MPUI_AUTOFILL_UCDACCOUNT_DETECTED_2" ) )
		AutoFillPopup:addElement( AutoFillPopup.message2 )
		top = top + CoD.textSize.Default * 2.5
		local leftMargin = 0
		local hintTextDefaultAnimState = {
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			right = CoD.Menu.Width,
			topAnchor = true,
			bottomAnchor = false,
			top = 350,
			bottom = CoD.HintText.Height
		}
		AutoFillPopup.hintText = CoD.HintText.new( hintTextDefaultAnimState )
		AutoFillPopup.hintText.hintArrow:setTopBottom( true, false, 0, CoD.HintText.Height )
		local left = CoD.HintText.Height - 13
		AutoFillPopup.hintText.hint:setLeftRight( true, true, left, 0 )
		AutoFillPopup:addElement( AutoFillPopup.hintText )
		local personalInformation_PosX = -650
		local personalInformation_PosY = 10
		local personalInformation_Step = 40
		AutoFillPopup.buttonList = CoD.ButtonList.new( {
			leftAnchor = true,
			rightAnchor = false,
			left = 250,
			right = 250 + CoD.ButtonList.DefaultWidth - 20,
			topAnchor = true,
			bottomAnchor = true,
			top = top,
			bottom = 0
		}, 10, nil, AutoFillPopup.hintText )
		AutoFillPopup.buttonList.addButton = CoD.ButtonList.AddRegistrationButton
		AutoFillPopup:addElement( AutoFillPopup.buttonList )
		CoD.EliteRegistrationAutoFillPopup.account_name_button = CoD.EliteRegistrationAutoFillPopup.AddButton( AutoFillPopup, GetDisplayedText( CoD.EliteRegistrationAutoFillPopup.account_name_text ), "account_name_button_pressed" )
		CoD.EliteRegistrationAutoFillPopup.account_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_UCD_ACCOUNT_NAME" )
		CoD.EliteRegistrationAutoFillPopup.account_name_button:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationAutoFillPopup.password_button = CoD.EliteRegistrationAutoFillPopup.AddButton( AutoFillPopup, GetDisplayedPassword( CoD.EliteRegistrationAutoFillPopup.password_text ), "password_button_pressed" )
		CoD.EliteRegistrationAutoFillPopup.password_button.hintText = Engine.Localize( "MPUI_HINTTEXT_UCD_PASSWORD" )
		CoD.EliteRegistrationAutoFillPopup.submit_button = CoD.EliteRegistrationAutoFillPopup.AddNonRegistrationButton( AutoFillPopup, Engine.Localize( "MPUI_CONFIRM_INFO" ), "EliteRegistrationAutoFillPopup_Submit" )
		personalInformation_PosY = personalInformation_PosY + personalInformation_Step
		AutoFillPopup.li_account = LUI.UIText.new()
		AutoFillPopup.li_account:setLeftRight( true, true, leftMargin, personalInformation_PosX )
		AutoFillPopup.li_account:setTopBottom( true, false, top, top + CoD.textSize.Default )
		AutoFillPopup.li_account:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
		AutoFillPopup.li_account:setAlignment( LUI.Alignment.Right )
		AutoFillPopup.li_account:setFont( CoD.fonts.Default )
		AutoFillPopup.li_account:setText( Engine.Localize( "MPUI_REGISTRATION_UCD_ACCOUNT_NAME" ) )
		AutoFillPopup:addElement( AutoFillPopup.li_account )
		top = top + personalInformation_Step
		personalInformation_PosY = personalInformation_PosY + personalInformation_Step
		AutoFillPopup.li_password = LUI.UIText.new()
		AutoFillPopup.li_password:setLeftRight( true, true, leftMargin, personalInformation_PosX )
		AutoFillPopup.li_password:setTopBottom( true, false, top, top + CoD.textSize.Default )
		AutoFillPopup.li_password:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
		AutoFillPopup.li_password:setAlignment( LUI.Alignment.Right )
		AutoFillPopup.li_password:setFont( CoD.fonts.Default )
		AutoFillPopup.li_password:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_PASSWORD" ) )
		AutoFillPopup:addElement( AutoFillPopup.li_password )
	else
		AutoFillPopup:registerEventHandler( "EliteRegistrationAutoFillPopup_Accept", CoD.EliteRegistrationAutoFillPopup.Accept )
		AutoFillPopup:registerEventHandler( "EliteRegistrationAutoFillPopup_Refuse", CoD.EliteRegistrationAutoFillPopup.Refuse )
		AutoFillPopup.message = LUI.UIText.new()
		AutoFillPopup.message:setLeftRight( true, false, 0, 520 )
		AutoFillPopup.message:setTopBottom( true, false, top, top + CoD.textSize.Default )
		AutoFillPopup.message:setFont( CoD.fonts.Default )
		AutoFillPopup.message:setAlignment( LUI.Alignment.Left )
		AutoFillPopup.message:setText( Engine.Localize( "MPUI_AUTOFILL_MSG1" ) )
		AutoFillPopup:addElement( AutoFillPopup.message )
		top = top + CoD.textSize.Default * 3
		AutoFillPopup.message2 = LUI.UIText.new()
		AutoFillPopup.message2:setLeftRight( true, false, 0, 520 )
		AutoFillPopup.message2:setTopBottom( true, false, top, top + CoD.textSize.Default )
		AutoFillPopup.message2:setFont( CoD.fonts.Default )
		AutoFillPopup.message2:setAlignment( LUI.Alignment.Left )
		AutoFillPopup.message2:setText( Engine.Localize( "MPUI_AUTOFILL_MSG2" ) )
		AutoFillPopup:addElement( AutoFillPopup.message2 )
		local buttonList = CoD.ButtonList.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = false,
			bottomAnchor = true,
			top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
			bottom = 0
		} )
		AutoFillPopup:addElement( buttonList )
		local buttonYes = buttonList:addButton( Engine.Localize( "MENU_ACCEPT" ) )
		buttonYes:setActionEventName( "EliteRegistrationAutoFillPopup_Accept" )
		local buttonNo = buttonList:addButton( Engine.Localize( "MENU_REFUSE" ) )
		buttonNo:setActionEventName( "EliteRegistrationAutoFillPopup_Refuse" )
		buttonNo:processEvent( {
			name = "gain_focus"
		} )
	end
	local logoContainer = CoD.EliteRegistrationPopup.GetLogoContainer( data, false )
	AutoFillPopup:addElement( logoContainer )
	return AutoFillPopup
end

