playerData = {}
UCDAccountUpdate = false
CoD.EliteRegistrationSuccessEmailConfirmationPopup = {}
CoD.EliteRegistrationSuccessTOSPopup = {}
CoD.EliteRegistrationSuccessTOSPopup.Paragraph1 = {}
CoD.EliteRegistrationSuccessTOSPopup.Paragraph2 = {}
CoD.EliteRegistrationSuccessTOSPopup.PageIndicator = {}
CoD.EliteRegistrationSuccessTOSPopup.NextButton = {}
CoD.EliteRegistrationSuccessTOSPopup.PrevButton = {}
CoD.EliteRegistrationSuccessTOSPopup.Page = 1
CoD.EliteRegistrationSuccessTOSPopup.MaxPage = 2
CoD.EliteRegistrationScrollingTOS = {}
CoD.EliteRegistrationSuccessPopup = {}
local SignedOut = function ( self, event )
	self:close( event.controller )
end

CoD.EliteRegistrationSuccessEmailConfirmationPopup.AddButton = function ( inputPopup, buttonText, actionEventName )
	local button = inputPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteRegistrationSuccessEmailConfirmationPopup.AcceptButtonPressed = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "check_email_address_popup_closed",
		controller = event.controller
	} )
end

CoD.EliteRegistrationSuccessEmailConfirmationPopup.CancelButtonPressed = function ( self, event )
	self:goBack( event.controller )
end

LUI.createMenu.EliteRegistrationSuccessEmailConfirmationPopup = function ( controller, params )
	playerData = params.playerData
	UCDAccountUpdate = params.UCDAccountUpdate
	local newPopup = CoD.Menu.NewMediumPopup( "EliteRegistrationSuccessEmailConfirmationPopup" )
	newPopup:setOwner( controller )
	newPopup:registerEventHandler( "EliteRegistrationSuccessEmailConfirmationPopup_AcceptButtonPressed", CoD.EliteRegistrationSuccessEmailConfirmationPopup.AcceptButtonPressed )
	newPopup:registerEventHandler( "EliteRegistrationSuccessEmailConfirmationPopup_CancelButtonPressed", CoD.EliteRegistrationSuccessEmailConfirmationPopup.CancelButtonPressed )
	newPopup:registerEventHandler( "signed_out", SignedOut )
	newPopup.buttonList = CoD.ButtonList.new( {
		left = 0,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	local acceptButton = CoD.EliteRegistrationSuccessEmailConfirmationPopup.AddButton( newPopup, Engine.Localize( "MENU_ACCEPT_CAPS" ), "EliteRegistrationSuccessEmailConfirmationPopup_AcceptButtonPressed" )
	local cancelButton = CoD.EliteRegistrationSuccessEmailConfirmationPopup.AddButton( newPopup, Engine.Localize( "MENU_CANCEL_CAPS" ), "EliteRegistrationSuccessEmailConfirmationPopup_CancelButtonPressed" )
	cancelButton:processEvent( {
		name = "gain_focus"
	} )
	newPopup:addElement( newPopup.buttonList )
	newPopup.msgTitle = LUI.UIText.new()
	newPopup.msgTitle:setLeftRight( true, true, 0, 0 )
	newPopup.msgTitle:setTopBottom( true, false, 0, CoD.textSize.Condensed )
	newPopup.msgTitle:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
	newPopup.msgTitle:setAlignment( LUI.Alignment.Left )
	newPopup.msgTitle:setFont( CoD.fonts.Condensed )
	newPopup.msgTitle:setText( Engine.Localize( "MPUI_CHECK_EMAIL_CAPS" ) )
	newPopup:addElement( newPopup.msgTitle )
	local yStep = CoD.textSize.Condensed * 2
	newPopup.verifyLabel = LUI.UIText.new()
	newPopup.verifyLabel:setLeftRight( true, true, 0, 0 )
	newPopup.verifyLabel:setTopBottom( true, false, yStep, yStep + CoD.textSize.Default )
	newPopup.verifyLabel:setAlignment( LUI.Alignment.Left )
	newPopup.verifyLabel:setFont( CoD.fonts.Default )
	newPopup.verifyLabel:setText( Engine.Localize( "MPUI_ASK_EMAIL_VERIFY" ) )
	newPopup:addElement( newPopup.verifyLabel )
	yStep = yStep + CoD.textSize.Default * 2
	newPopup.emailLabel = LUI.UIText.new()
	newPopup.emailLabel:setLeftRight( true, true, 0, 0 )
	newPopup.emailLabel:setTopBottom( true, false, yStep, yStep + CoD.textSize.Default )
	newPopup.emailLabel:setRGB( CoD.yellow.r, CoD.yellow.g, CoD.yellow.b )
	newPopup.emailLabel:setAlignment( LUI.Alignment.Left )
	newPopup.emailLabel:setFont( CoD.fonts.Default )
	newPopup.emailLabel:setText( playerData.email )
	newPopup:addElement( newPopup.emailLabel )
	yStep = yStep + CoD.textSize.Default * 2
	newPopup.additionalTextLabel = LUI.UIText.new()
	newPopup.additionalTextLabel:setLeftRight( true, true, 0, 0 )
	newPopup.additionalTextLabel:setTopBottom( true, false, yStep, yStep + CoD.textSize.Default )
	newPopup.additionalTextLabel:setAlignment( LUI.Alignment.Left )
	newPopup.additionalTextLabel:setFont( CoD.fonts.Default )
	newPopup.additionalTextLabel:setText( Engine.Localize( "MPUI_ASK_EMAIL_VERIFY2" ) )
	newPopup:addElement( newPopup.additionalTextLabel )
	newPopup:addSelectButton()
	newPopup:addBackButton()
	return newPopup
end

CoD.EliteRegistrationScrollingTOS.AddButton = function ( inputPopup, buttonText, actionEventName )
	local button = inputPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

local StartTOS = function ( self )
	if self.tosContainer == nil then
		self.tosContainer = LUI.UIElement.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 75,
			bottom = -80
		} )
		self:addElement( self.tosContainer )
		self.tosContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
		self.tosContainer:addElement( self.tosContainer.border )
		self.tosContainer.tosCustomElement = LUI.UIElement.new( {
			left = 0,
			top = 35,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true
		} )
		self.tosContainer:addElement( self.tosContainer.tosCustomElement )
	end
	Engine.SetDvar( "ui_scrollSpeed", 0 )
	self.tosContainer.tosCustomElement:setupEliteLegal()
end

local EndTOS = function ( self )
	if self.tosContainer ~= nil then
		self.tosContainer:close()
		self.tosContainer = nil
	end
	Engine.SetDvar( "ui_scrollSpeed", 0 )
end

CoD.EliteRegistrationScrollingTOS.Select = function ( self, event )
	self:goBack( event.controller )
	Engine.ERegPopup_SubmitRegistration( event.controller, UCDAccountUpdate, playerData )
end

CoD.EliteRegistrationScrollingTOS.Back = function ( self, event )
	EndTOS( self )
	CoD.Menu.ButtonPromptBack( self, event )
end

CoD.EliteRegistrationScrollingTOS.HandleGamepadButton = function ( self, event )
	if LUI.UIElement.handleGamepadButton( self, event ) == true then
		return true
	elseif event.down == true then
		if event.qualifier == nil then
			local scrollSpeed = Engine.GetCustomElementScrollSpeed()
			if event.button == "up" then
				if scrollSpeed < 0 then
					Engine.SetCustomElementScrollSpeed( 0 )
				else
					Engine.SetCustomElementScrollSpeed( scrollSpeed + 1 )
				end
			elseif event.button == "down" then
				if scrollSpeed > 0 then
					Engine.SetCustomElementScrollSpeed( 0 )
				else
					Engine.SetCustomElementScrollSpeed( scrollSpeed - 1 )
				end
			end
			return 
		end
	else
		Engine.SetCustomElementScrollSpeed( 0 )
	end
end

CoD.EliteRegistrationScrollingTOS.addButtonPrompt = function ( self, buttonPrompt )
	self.buttonPromptList:addElement( buttonPrompt )
end

LUI.createMenu.EliteRegistrationScrollingTOS = function ( controller )
	local newPopup = CoD.Menu.New( "EliteRegistrationScrollingTOS" )
	newPopup:setOwner( controller )
	newPopup:registerEventHandler( "button_select_prompt", CoD.EliteRegistrationScrollingTOS.Select )
	newPopup:registerEventHandler( "button_prompt_back", CoD.EliteRegistrationScrollingTOS.Back )
	newPopup:registerEventHandler( "signed_out", SignedOut )
	newPopup.button = LUI.UIButton.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	newPopup.button.handleGamepadButton = CoD.EliteRegistrationScrollingTOS.HandleGamepadButton
	newPopup:addElement( newPopup.button )
	newPopup.button:processEvent( {
		name = "gain_focus"
	} )
	newPopup.buttonRepeaterUp = LUI.UIButtonRepeater.new( "up", "moveup" )
	newPopup:addElement( newPopup.buttonRepeaterUp )
	newPopup.buttonRepeaterDown = LUI.UIButtonRepeater.new( "down", "movedown" )
	newPopup:addElement( newPopup.buttonRepeaterDown )
	newPopup:addLargePopupBackground()
	newPopup.msgTitle = LUI.UIText.new()
	newPopup.msgTitle:setLeftRight( true, true, 0, 0 )
	newPopup.msgTitle:setTopBottom( true, false, 0, 0 + CoD.textSize.Condensed )
	newPopup.msgTitle:setAlignment( LUI.Alignment.Left )
	newPopup.msgTitle:setFont( CoD.fonts.Condensed )
	newPopup.msgTitle:setText( Engine.Localize( "MPUI_TOS_TITLE" ) )
	newPopup:addElement( newPopup.msgTitle )
	newPopup.subTitle = LUI.UIText.new()
	newPopup.subTitle:setLeftRight( true, true, 0, 0 )
	newPopup.subTitle:setTopBottom( true, false, 30, 30 + CoD.textSize.ExtraSmall )
	newPopup.subTitle:setAlignment( LUI.Alignment.Left )
	newPopup.subTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	newPopup.subTitle:setFont( CoD.fonts.ExtraSmall )
	newPopup.subTitle:setText( Engine.Localize( "MPUI_TOS_SUBTITLE" ) )
	newPopup:addElement( newPopup.subTitle )
	newPopup:addSelectButton( Engine.Localize( "MPUI_TOS_AGREE" ), nil, "button_select_prompt" )
	newPopup:addBackButton( Engine.Localize( "MPUI_TOS_REFUSE" ) )
	StartTOS( newPopup )
	newPopup.upRepeater = LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} )
	newPopup.downRepeater = LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} )
	newPopup:addElement( newPopup.upRepeater )
	newPopup:addElement( newPopup.downRepeater )
	newPopup.buttonPromptList = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -65,
		bottom = 0,
		spacing = 5,
		alignment = LUI.Alignment.Left
	} )
	newPopup:addElement( newPopup.buttonPromptList )
	newPopup.addButtonPrompt = CoD.EliteRegistrationScrollingTOS.addButtonPrompt
	newPopup.moveImage = CoD.ButtonPrompt.new( "emblem_move", Engine.Localize( "MENU_LB_SCROLL_UP_SCROLL_DOWN" ) )
	newPopup:addButtonPrompt( newPopup.moveImage )
	return newPopup
end

CoD.EliteRegistrationSuccessTOSPopup.AddButton = function ( inputPopup, buttonText, actionEventName )
	local button = inputPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteRegistrationSuccessTOSPopup.UpdatePageIndicator = function ( self, event )
	CoD.EliteRegistrationSuccessTOSPopup.PageIndicator:setText( CoD.EliteRegistrationSuccessTOSPopup.Page .. " / " .. CoD.EliteRegistrationSuccessTOSPopup.MaxPage )
end

CoD.EliteRegistrationSuccessTOSPopup.PrevButtonPressed = function ( self, event )
	if CoD.EliteRegistrationSuccessTOSPopup.Page > 1 then
		CoD.EliteRegistrationSuccessTOSPopup.Page = CoD.EliteRegistrationSuccessTOSPopup.Page - 1
		CoD.EliteRegistrationSuccessTOSPopup:UpdatePageIndicator( event )
		local localizationIndex = CoD.EliteRegistrationSuccessTOSPopup.Page - 1
		CoD.EliteRegistrationSuccessTOSPopup.Paragraph1:setText( Engine.Localize( "MPUI_ELITE_LEGAL_" .. CoD.EliteRegistrationSuccessTOSPopup.Page + localizationIndex ) )
		CoD.EliteRegistrationSuccessTOSPopup.Paragraph2:setText( Engine.Localize( "MPUI_ELITE_LEGAL_" .. CoD.EliteRegistrationSuccessTOSPopup.Page + localizationIndex + 1 ) )
		if CoD.EliteRegistrationSuccessTOSPopup.Page == 1 then
			CoD.EliteRegistrationSuccessTOSPopup.PrevButton:processEvent( {
				name = "disable"
			} )
			CoD.EliteRegistrationSuccessTOSPopup.NextButton:processEvent( {
				name = "enable"
			} )
		else
			CoD.EliteRegistrationSuccessTOSPopup.PrevButton:processEvent( {
				name = "enable"
			} )
		end
	end
end

CoD.EliteRegistrationSuccessTOSPopup.NextButtonPressed = function ( self, event )
	if CoD.EliteRegistrationSuccessTOSPopup.Page < CoD.EliteRegistrationSuccessTOSPopup.MaxPage then
		CoD.EliteRegistrationSuccessTOSPopup.Page = CoD.EliteRegistrationSuccessTOSPopup.Page + 1
		CoD.EliteRegistrationSuccessTOSPopup:UpdatePageIndicator( event )
		local localizationIndex = CoD.EliteRegistrationSuccessTOSPopup.Page - 1
		CoD.EliteRegistrationSuccessTOSPopup.Paragraph1:setText( Engine.Localize( "MPUI_ELITE_LEGAL_" .. CoD.EliteRegistrationSuccessTOSPopup.Page + localizationIndex ) )
		CoD.EliteRegistrationSuccessTOSPopup.Paragraph2:setText( Engine.Localize( "MPUI_ELITE_LEGAL_" .. CoD.EliteRegistrationSuccessTOSPopup.Page + localizationIndex + 1 ) )
		if CoD.EliteRegistrationSuccessTOSPopup.Page == CoD.EliteRegistrationSuccessTOSPopup.MaxPage then
			CoD.EliteRegistrationSuccessTOSPopup.NextButton:processEvent( {
				name = "disable"
			} )
			CoD.EliteRegistrationSuccessTOSPopup.PrevButton:processEvent( {
				name = "enable"
			} )
		else
			CoD.EliteRegistrationSuccessTOSPopup.NextButton:processEvent( {
				name = "enable"
			} )
		end
	end
end

CoD.EliteRegistrationSuccessTOSPopup.AcceptButtonPressed = function ( self, event )
	self:goBack( event.controller )
	Engine.ERegPopup_SubmitRegistration( event.controller, UCDAccountUpdate, playerData )
end

CoD.EliteRegistrationSuccessTOSPopup.CancelButtonPressed = function ( self, event )
	self:goBack( event.controller )
end

LUI.createMenu.EliteRegistrationSuccessTOSPopup = function ( controller )
	CoD.EliteRegistrationSuccessTOSPopup.Page = 1
	local newPopup = CoD.Menu.New( "EliteRegistrationSuccessTOSPopup" )
	newPopup:setOwner( controller )
	newPopup:registerEventHandler( "EliteRegistrationSuccessTOSPopup_PrevButtonPressed", CoD.EliteRegistrationSuccessTOSPopup.PrevButtonPressed )
	newPopup:registerEventHandler( "EliteRegistrationSuccessTOSPopup_NextButtonPressed", CoD.EliteRegistrationSuccessTOSPopup.NextButtonPressed )
	newPopup:registerEventHandler( "EliteRegistrationSuccessTOSPopup_AcceptButtonPressed", CoD.EliteRegistrationSuccessTOSPopup.AcceptButtonPressed )
	newPopup:registerEventHandler( "EliteRegistrationSuccessTOSPopup_CancelButtonPressed", CoD.EliteRegistrationSuccessTOSPopup.CancelButtonPressed )
	newPopup:registerEventHandler( "signed_out", SignedOut )
	newPopup.buttonList = CoD.ButtonList.new( {
		left = 0,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 5,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	CoD.EliteRegistrationSuccessTOSPopup.PrevButton = CoD.EliteRegistrationSuccessTOSPopup.AddButton( newPopup, Engine.Localize( "Previous page" ), "EliteRegistrationSuccessTOSPopup_PrevButtonPressed" )
	CoD.EliteRegistrationSuccessTOSPopup.NextButton = CoD.EliteRegistrationSuccessTOSPopup.AddButton( newPopup, Engine.Localize( "Next page" ), "EliteRegistrationSuccessTOSPopup_NextButtonPressed" )
	local acceptButton = CoD.EliteRegistrationSuccessTOSPopup.AddButton( newPopup, Engine.Localize( "MENU_ACCEPT_CAPS" ), "EliteRegistrationSuccessTOSPopup_AcceptButtonPressed" )
	local cancelButton = CoD.EliteRegistrationSuccessTOSPopup.AddButton( newPopup, Engine.Localize( "MENU_CANCEL_CAPS" ), "EliteRegistrationSuccessTOSPopup_CancelButtonPressed" )
	CoD.EliteRegistrationSuccessTOSPopup.PrevButton:processEvent( {
		name = "disable"
	} )
	cancelButton:processEvent( {
		name = "gain_focus"
	} )
	newPopup:addElement( newPopup.buttonList )
	newPopup:addLargePopupBackground()
	newPopup.msgTitle = LUI.UIText.new()
	newPopup.msgTitle:setLeftRight( true, true, 0, 0 )
	newPopup.msgTitle:setTopBottom( true, false, 0, 0 + CoD.textSize.Condensed )
	newPopup.msgTitle:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
	newPopup.msgTitle:setAlignment( LUI.Alignment.Left )
	newPopup.msgTitle:setFont( CoD.fonts.Condensed )
	newPopup.msgTitle:setText( Engine.Localize( "ACCEPT THE SERVICE AGREEMENT AND PRIVACY POLICY" ) )
	newPopup:addElement( newPopup.msgTitle )
	local yStep = CoD.textSize.Condensed * 2
	local localizedText = Engine.Localize( "MPUI_ELITE_LEGAL_1" )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph1 = LUI.UIText.new( nil, true )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph1:setLeftRight( true, true, 0, 0 )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph1:setTopBottom( true, false, yStep, yStep + CoD.textSize.ExtraSmall )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph1:setAlignment( LUI.Alignment.Left )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph1:setFont( CoD.fonts.ExtraSmall )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph1:setText( localizedText )
	newPopup:addElement( CoD.EliteRegistrationSuccessTOSPopup.Paragraph1 )
	local numLines = Engine.GetNumTextLines( localizedText, CoD.fonts.ExtraSmall, CoD.textSize.ExtraSmall, CoD.Menu.Width )
	yStep = yStep + numLines * CoD.textSize.ExtraSmall
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph2 = LUI.UIText.new( nil, true )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph2:setLeftRight( true, true, 0, 0 )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph2:setTopBottom( true, false, yStep, yStep + CoD.textSize.ExtraSmall )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph2:setAlignment( LUI.Alignment.Left )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph2:setFont( CoD.fonts.ExtraSmall )
	CoD.EliteRegistrationSuccessTOSPopup.Paragraph2:setText( Engine.Localize( "MPUI_ELITE_LEGAL_2" ) )
	newPopup:addElement( CoD.EliteRegistrationSuccessTOSPopup.Paragraph2 )
	CoD.EliteRegistrationSuccessTOSPopup.PageIndicator = LUI.UIText.new( nil, true )
	CoD.EliteRegistrationSuccessTOSPopup.PageIndicator:setLeftRight( true, true, 0, 0 )
	CoD.EliteRegistrationSuccessTOSPopup.PageIndicator:setTopBottom( false, true, -CoD.ButtonPrompt.Height * 7, -CoD.ButtonPrompt.Height * 6 )
	CoD.EliteRegistrationSuccessTOSPopup.PageIndicator:setAlignment( LUI.Alignment.Right )
	CoD.EliteRegistrationSuccessTOSPopup.PageIndicator:setFont( CoD.fonts.ExtraSmall )
	CoD.EliteRegistrationSuccessTOSPopup.PageIndicator:setText( CoD.EliteRegistrationSuccessTOSPopup.Page .. " / " .. CoD.EliteRegistrationSuccessTOSPopup.MaxPage )
	newPopup:addElement( CoD.EliteRegistrationSuccessTOSPopup.PageIndicator )
	newPopup:addSelectButton()
	newPopup:addBackButton()
	return newPopup
end

CoD.EliteRegistrationSuccessPopup.AddButton = function ( inputPopup, buttonText, actionEventName )
	local button = inputPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteRegistrationSuccessPopup.ContinueButtonPressed = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "registration_success_popup_closed",
		controller = event.controller
	} )
end

LUI.createMenu.EliteRegistrationSuccessPopup = function ( controller, params )
	local newPopup = CoD.Menu.NewMediumPopup( "EliteRegistrationSuccessPopup" )
	newPopup:setOwner( controller )
	newPopup:registerEventHandler( "EliteRegistrationSuccessPopup_ContinueButtonPressed", CoD.EliteRegistrationSuccessPopup.ContinueButtonPressed )
	newPopup:registerEventHandler( "signed_out", SignedOut )
	newPopup.buttonList = CoD.ButtonList.new( {
		left = 0,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 2,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	local continueButton = CoD.EliteRegistrationSuccessPopup.AddButton( newPopup, Engine.Localize( "MENU_CONTINUE_CAPS" ), "EliteRegistrationSuccessPopup_ContinueButtonPressed" )
	continueButton:processEvent( {
		name = "gain_focus"
	} )
	newPopup:addElement( newPopup.buttonList )
	newPopup:addMediumPopupBackground()
	if params.fail ~= nil then
		newPopup.msgTitle = LUI.UIText.new()
		newPopup.msgTitle:setLeftRight( true, true, 0, 0 )
		newPopup.msgTitle:setTopBottom( true, false, 0, CoD.textSize.Condensed )
		newPopup.msgTitle:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
		newPopup.msgTitle:setAlignment( LUI.Alignment.Left )
		newPopup.msgTitle:setFont( CoD.fonts.Condensed )
		newPopup.msgTitle:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_FAIL" ) )
		newPopup:addElement( newPopup.msgTitle )
		local yStep = CoD.textSize.Condensed * 2
		newPopup.msgBody = LUI.UIText.new()
		newPopup.msgBody:setLeftRight( true, true, 0, 0 )
		newPopup.msgBody:setTopBottom( true, false, yStep, yStep + CoD.textSize.Default )
		newPopup.msgBody:setAlignment( LUI.Alignment.Left )
		newPopup.msgBody:setFont( CoD.fonts.Default )
		newPopup.msgBody:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_FAIL_BODY" ) )
		newPopup:addElement( newPopup.msgBody )
		Engine.EReg_PlayerRefusedOrError( controller )
	elseif params.alreadyRegistered ~= nil then
		newPopup.msgTitle = LUI.UIText.new()
		newPopup.msgTitle:setLeftRight( true, true, 0, 0 )
		newPopup.msgTitle:setTopBottom( true, false, 0, CoD.textSize.Condensed )
		newPopup.msgTitle:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
		newPopup.msgTitle:setAlignment( LUI.Alignment.Left )
		newPopup.msgTitle:setFont( CoD.fonts.Condensed )
		newPopup.msgTitle:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_FAIL" ) )
		newPopup:addElement( newPopup.msgTitle )
		local yStep = CoD.textSize.Condensed * 2
		newPopup.msgBody = LUI.UIText.new()
		newPopup.msgBody:setLeftRight( true, true, 0, 0 )
		newPopup.msgBody:setTopBottom( true, false, yStep, yStep + CoD.textSize.Default )
		newPopup.msgBody:setAlignment( LUI.Alignment.Left )
		newPopup.msgBody:setFont( CoD.fonts.Default )
		newPopup.msgBody:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_ALREADYREGISTERED" ) )
		newPopup:addElement( newPopup.msgBody )
	else
		newPopup.msgTitle = LUI.UIText.new()
		newPopup.msgTitle:setLeftRight( true, true, 0, 0 )
		newPopup.msgTitle:setTopBottom( true, false, 0, CoD.textSize.Condensed )
		newPopup.msgTitle:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
		newPopup.msgTitle:setAlignment( LUI.Alignment.Left )
		newPopup.msgTitle:setFont( CoD.fonts.Condensed )
		newPopup.msgTitle:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_SUCCESS" ) )
		newPopup:addElement( newPopup.msgTitle )
		local yStep = CoD.textSize.Condensed * 2
		newPopup.msgBody = LUI.UIText.new()
		newPopup.msgBody:setLeftRight( true, true, 0, 0 )
		newPopup.msgBody:setTopBottom( true, false, yStep, yStep + CoD.textSize.Default )
		newPopup.msgBody:setAlignment( LUI.Alignment.Left )
		newPopup.msgBody:setFont( CoD.fonts.Default )
		newPopup.msgBody:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_SUCCESS_BODY" ) )
		newPopup:addElement( newPopup.msgBody )
		local numLines = Engine.GetNumTextLines( Engine.Localize( "MPUI_EMAIL_REGISTRATION_SUCCESS_BODY" ), CoD.fonts.Default, CoD.textSize.Default, CoD.Menu.Width )
		yStep = yStep + numLines * CoD.textSize.Default + CoD.textSize.Default
		newPopup.emailLabel = LUI.UIText.new()
		newPopup.emailLabel:setLeftRight( true, true, 0, 0 )
		newPopup.emailLabel:setTopBottom( true, false, yStep, yStep + CoD.textSize.Default )
		newPopup.emailLabel:setAlignment( LUI.Alignment.Left )
		newPopup.emailLabel:setRGB( CoD.yellow.r, CoD.yellow.g, CoD.yellow.b )
		newPopup.emailLabel:setFont( CoD.fonts.Default )
		newPopup.emailLabel:setText( playerData.email )
		newPopup:addElement( newPopup.emailLabel )
	end
	newPopup:addSelectButton()
	return newPopup
end

