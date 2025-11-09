CoD.Stereoscopic3DConfirmation = {}
CoD.Stereoscopic3DConfirmation.Button_Confirm = function ( self, event )
	Engine.Exec( event.controller, "toggle r_stereo3DOn" )
end

CoD.Stereoscopic3DConfirmation.DarkBackgound = function ( self )
	local darkenElement = LUI.UIImage.new()
	darkenElement:setLeftRight( false, false, -1280, 1280 )
	darkenElement:setTopBottom( false, false, -360, 360 )
	darkenElement:setRGB( 0, 0, 0 )
	darkenElement:setAlpha( 0.7 )
	darkenElement:setPriority( -100 )
	self:addElement( darkenElement )
end

LUI.createMenu.Stereoscopic3DConfirmation = function ( controller )
	local darkBackground = nil
	if CoD.isSinglePlayer == true then
		darkBackground = true
	end
	local confirmationMenu = CoD.Menu.NewSmallPopup( "Stereoscopic3DConfirmation", darkBackground, 0.75 )
	CoD.Stereoscopic3DConfirmation.DarkBackgound( confirmationMenu )
	confirmationMenu:addSelectButton()
	confirmationMenu:addBackButton()
	confirmationMenu:registerEventHandler( "confirm_action", CoD.Stereoscopic3DConfirmation.Button_Confirm )
	confirmationMenu:registerEventHandler( "cancel_action", CoD.Menu.goBack )
	local top = 5
	local messageLabel = LUI.UIText.new()
	messageLabel:setLeftRight( true, true, 0, 0 )
	messageLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	messageLabel:setFont( CoD.fonts.Default )
	messageLabel:setAlignment( LUI.Alignment.Left )
	confirmationMenu:addElement( messageLabel )
	local is3DEnabled = Dvar.r_stereo3DOn:get()
	if is3DEnabled then
		messageLabel:setText( Engine.Localize( "PLATFORM_3D_OPTION_TITLE_OFF" ) )
	else
		messageLabel:setText( Engine.Localize( "PLATFORM_3D_OPTION_TITLE_ON" ) )
	end
	local buttonList = CoD.ButtonList.new()
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
	confirmationMenu:addElement( buttonList )
	local yesButtonText = Engine.Localize( "MENU_CONTINUE_CAPS" )
	if CoD.isMultiplayer == true then
		yesButtonText = Engine.Localize( "MENU_CONTINUE" )
	end
	local yesButton = buttonList:addButton( yesButtonText )
	yesButton:setActionEventName( "confirm_action" )
	local noButtonText = Engine.Localize( "MENU_CANCEL_CAPS" )
	if CoD.isMultiplayer == true then
		noButtonText = Engine.Localize( "MENU_CANCEL" )
	end
	local noButton = buttonList:addButton( noButtonText )
	noButton:setActionEventName( "cancel_action" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	return confirmationMenu
end

