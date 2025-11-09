CoD.DualViewMenu = {}
CoD.DualViewMenu.WarningFontName = "Default"
CoD.DualViewMenu.SelectionChangedCallback = function ( self, event )
	if Dvar[self.parentSelectorButton.m_dvarName]:get() ~= self.value then
		self.parentSelectorButton:dispatchEventToParent( {
			name = "open_dual_view_confirmation_popup",
			controller = self.parentSelectorButton.m_currentController
		} )
	end
end

CoD.DualViewMenu.DualViewMenuConfirmation = function ( self, event )
	self:openPopup( "DualViewMenuConfirmation", event.controller )
end

CoD.DualViewMenu.WarningText = function ( textString, topOffset )
	local warningFont = CoD.fonts[CoD.DualViewMenu.WarningFontName]
	local warningTextSize = CoD.textSize[CoD.DualViewMenu.WarningFontName]
	local numLines = Engine.GetNumTextLines( textString, warningFont, warningTextSize, CoD.Menu.Width - 20 )
	local textLabel = LUI.UIText.new()
	textLabel:setLeftRight( true, true, 0, 0 )
	textLabel:setTopBottom( true, false, topOffset, topOffset + warningTextSize )
	textLabel:setFont( warningFont )
	textLabel:setAlignment( LUI.Alignment.Left )
	textLabel:setText( textString )
	return textLabel, numLines
end

LUI.createMenu.DualViewMenu = function ( controller )
	local dualViewMenu = nil
	if Engine.IsInGame() then
		dualViewMenu = CoD.InGameMenu.New( "DualViewMenu", controller, Engine.Localize( "MENU_DUAL_VIEW_SETTINGS_CAPS" ) )
	else
		dualViewMenu = CoD.Menu.New( "DualViewMenu" )
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
		dualViewMenu:addElement( background )
		dualViewMenu:setOwner( controller )
		dualViewMenu:addTitle( Engine.Localize( "MENU_DUAL_VIEW_SETTINGS_CAPS" ) )
		if CoD.isMultiplayer == true then
			dualViewMenu:addLargePopupBackground()
			dualViewMenu:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	dualViewMenu.controller = controller
	dualViewMenu:registerEventHandler( "open_dual_view_confirmation_popup", CoD.DualViewMenu.DualViewMenuConfirmation )
	dualViewMenu:addSelectButton()
	dualViewMenu:addBackButton()
	local warningTop = CoD.Menu.TitleHeight + 30
	local warningOffset = 10
	local warningFont = CoD.fonts[CoD.DualViewMenu.WarningFontName]
	local warningTextSize = CoD.textSize[CoD.DualViewMenu.WarningFontName]
	local warningHeight = warningTextSize * 12
	local warningContainer = LUI.UIElement.new()
	warningContainer:setLeftRight( true, true, warningOffset, -warningOffset )
	warningContainer:setTopBottom( true, false, warningTop, warningTop + warningHeight )
	dualViewMenu:addElement( warningContainer )
	local warningTextTop = 0
	local warningTitleLabel = LUI.UIText.new()
	warningTitleLabel:setLeftRight( true, true, 0, 0 )
	warningTitleLabel:setTopBottom( true, false, warningTextTop, warningTextTop + warningTextSize )
	warningTitleLabel:setFont( warningFont )
	warningTitleLabel:setAlignment( LUI.Alignment.Left )
	warningTitleLabel:setText( Engine.Localize( "PLATFORM_DUAL_VIEW_WARNING_TITLE_CAPS" ) )
	warningContainer:addElement( warningTitleLabel )
	local warningTextTop1 = warningTextSize + 20
	local warningText1, warningText1Lines = CoD.DualViewMenu.WarningText( Engine.Localize( "PLATFORM_DUAL_VIEW_WARNING_TEXT_1" ), warningTextTop1 )
	warningContainer:addElement( warningText1 )
	local warningTextTop2 = warningTextTop1 + warningTextSize * (warningText1Lines + 1)
	local warningText2, warningText2Lines = CoD.DualViewMenu.WarningText( Engine.Localize( "PLATFORM_DUAL_VIEW_WARNING_TEXT_2" ), warningTextTop2 )
	warningContainer:addElement( warningText2 )
	local warningTextTop3 = warningTextTop2 + warningTextSize * (warningText2Lines + 1)
	local warningText3, warningText3Lines = CoD.DualViewMenu.WarningText( Engine.Localize( "PLATFORM_DUAL_VIEW_WARNING_TEXT_3" ), warningTextTop3 )
	warningContainer:addElement( warningText3 )
	local buttonListHeight = CoD.CoD9Button.Height * 3
	local buttonListOffset = CoD.CoD9Button.Height * 3 - 20
	local buttonList = CoD.ButtonList.new()
	buttonList:setLeftRight( true, false, warningOffset, warningOffset + CoD.ButtonList.DefaultWidth )
	buttonList:setTopBottom( false, true, -buttonListHeight - buttonListOffset, buttonListOffset )
	dualViewMenu:addElement( buttonList )
	local enableDualViewButton = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DUAL_VIEW_SETTINGS_CAPS" ), "r_dualPlayEnable", Engine.Localize( "MENU_DUAL_VIEW_SETTINGS_DESC" ) )
	enableDualViewButton:addChoice( controller, Engine.Localize( "MENU_DISABLED_CAPS" ), 0 )
	enableDualViewButton:addChoice( controller, Engine.Localize( "MENU_ENABLED_CAPS" ), 1 )
	enableDualViewButton.m_choices[1].callbackFunc = CoD.DualViewMenu.SelectionChangedCallback
	enableDualViewButton.m_choices[2].callbackFunc = CoD.DualViewMenu.SelectionChangedCallback
	enableDualViewButton:processEvent( {
		name = "gain_focus"
	} )
	Engine.PlaySound( "cac_grid_nav" )
	return dualViewMenu
end

CoD.DualViewMenuConfirmation = {}
CoD.DualViewMenuConfirmation.Button_Confirm = function ( self, event )
	Engine.Exec( event.controller, "toggle r_dualPlayEnable" )
	self:goBack( event.controller )
end

LUI.createMenu.DualViewMenuConfirmation = function ( controller )
	local confirmationMenu = CoD.Menu.NewSmallPopup( "DualViewMenuConfirmation" )
	confirmationMenu:registerEventHandler( "confirm_action", CoD.DualViewMenuConfirmation.Button_Confirm )
	confirmationMenu:registerEventHandler( "cancel_action", CoD.Menu.goBack )
	local top = 5
	local messageLabel = LUI.UIText.new()
	messageLabel:setLeftRight( true, true, 0, 0 )
	messageLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	messageLabel:setFont( CoD.fonts.Default )
	messageLabel:setAlignment( LUI.Alignment.Left )
	confirmationMenu:addElement( messageLabel )
	local isDualViewEnabled = Dvar.r_dualPlayEnable:get()
	if isDualViewEnabled == true then
		messageLabel:setText( Engine.Localize( "PLATFORM_DUAL_VIEW_OPTION_TITLE_OFF" ) )
	else
		messageLabel:setText( Engine.Localize( "PLATFORM_DUAL_VIEW_OPTION_TITLE_ON" ) )
	end
	local buttonList = CoD.ButtonList.new()
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height - 21, -15 )
	confirmationMenu:addElement( buttonList )
	local yesText = Engine.Localize( "MENU_CONFIRM_CAPS" )
	if CoD.isMultiplayer == true then
		yesText = Engine.Localize( "MENU_EMBLEM_CONFIRM_CHANGES" )
	end
	local yesButton = buttonList:addButton( yesText )
	yesButton:setActionEventName( "confirm_action" )
	yesButton:processEvent( {
		name = "gain_focus"
	} )
	return confirmationMenu
end

