require( "ui.T6.Menus.Stereoscopic3DConfirmationPopup" )

CoD.Stereoscopic3D = {}
CoD.Stereoscopic3D.WarningFontName = "Default"
CoD.Stereoscopic3D.Button_3D = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_stereo_confirmation_popup",
		controller = event.controller
	} )
end

CoD.Stereoscopic3D.OpenStereoConfirmationPopup = function ( self, event )
	self:openPopup( "Stereoscopic3DConfirmation", event.controller )
end

CoD.Stereoscopic3D.WarningText = function ( textString, topOffset )
	local warningFont = CoD.fonts[CoD.Stereoscopic3D.WarningFontName]
	local warningTextSize = CoD.textSize[CoD.Stereoscopic3D.WarningFontName]
	local numLines = Engine.GetNumTextLines( textString, warningFont, warningTextSize, CoD.Menu.Width - 20 )
	local textLabel = LUI.UIText.new()
	textLabel:setLeftRight( true, true, 0, 0 )
	textLabel:setTopBottom( true, false, topOffset, topOffset + warningTextSize )
	textLabel:setFont( warningFont )
	textLabel:setAlignment( LUI.Alignment.Left )
	textLabel:setText( textString )
	return textLabel, numLines
end

LUI.createMenu.Stereoscopic3D = function ( controller )
	local stereoscopic3DMenu = nil
	if Engine.IsInGame() then
		stereoscopic3DMenu = CoD.InGameMenu.New( "Stereoscopic3D", controller, Engine.Localize( "MENU_STEREO_3D_SETTINGS_CAPS" ), CoD.isSinglePlayer )
	else
		stereoscopic3DMenu = CoD.Menu.New( "Stereoscopic3D" )
		stereoscopic3DMenu:setOwner( controller )
		stereoscopic3DMenu:addTitle( Engine.Localize( "MENU_STEREO_3D_SETTINGS_CAPS" ) )
		if CoD.isMultiplayer == true then
			stereoscopic3DMenu:addLargePopupBackground()
			stereoscopic3DMenu:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	stereoscopic3DMenu.controller = controller
	stereoscopic3DMenu:registerEventHandler( "open_stereo_confirmation_popup", CoD.Stereoscopic3D.OpenStereoConfirmationPopup )
	stereoscopic3DMenu:addSelectButton()
	stereoscopic3DMenu:addBackButton()
	local warningTop = CoD.Menu.TitleHeight + 30
	local warningOffset = 10
	local warningFont = CoD.fonts[CoD.Stereoscopic3D.WarningFontName]
	local warningTextSize = CoD.textSize[CoD.Stereoscopic3D.WarningFontName]
	local warningHeight = warningTextSize * 12
	local warningContainer = LUI.UIElement.new()
	warningContainer:setLeftRight( true, true, warningOffset, -warningOffset )
	warningContainer:setTopBottom( true, false, warningTop, warningTop + warningHeight )
	stereoscopic3DMenu:addElement( warningContainer )
	local warningTextTop = 0
	local warningTitleLabel = LUI.UIText.new()
	warningTitleLabel:setLeftRight( true, true, 0, 0 )
	warningTitleLabel:setTopBottom( true, false, warningTextTop, warningTextTop + warningTextSize )
	warningTitleLabel:setFont( warningFont )
	warningTitleLabel:setAlignment( LUI.Alignment.Left )
	warningTitleLabel:setText( Engine.Localize( "PLATFORM_3D_WARNING_TITLE_CAPS" ) )
	warningContainer:addElement( warningTitleLabel )
	local warningTextTop1 = warningTextSize + 20
	local warningText1, warningText1Lines = CoD.Stereoscopic3D.WarningText( Engine.Localize( "PLATFORM_3D_WARNING_TEXT_1" ), warningTextTop1 )
	warningContainer:addElement( warningText1 )
	local warningTextTop2 = warningTextTop1 + warningTextSize * (warningText1Lines + 1)
	local warningText2, warningText2Lines = CoD.Stereoscopic3D.WarningText( Engine.Localize( "PLATFORM_3D_WARNING_TEXT_2" ), warningTextTop2 )
	warningContainer:addElement( warningText2 )
	local warningTextTop3 = warningTextTop2 + warningTextSize * (warningText2Lines + 1)
	local warningText3, warningText3Lines = CoD.Stereoscopic3D.WarningText( Engine.Localize( "PLATFORM_3D_WARNING_TEXT_3" ), warningTextTop3 )
	warningContainer:addElement( warningText3 )
	local buttonListHeight = CoD.CoD9Button.Height * 3
	local buttonListOffset = CoD.CoD9Button.Height * 3 - 20
	local buttonList = CoD.ButtonList.new()
	buttonList:setLeftRight( true, false, warningOffset, warningOffset + CoD.ButtonList.DefaultWidth )
	buttonList:setTopBottom( false, true, -buttonListHeight - buttonListOffset, buttonListOffset )
	stereoscopic3DMenu:addElement( buttonList )
	local defaultAnimationState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local currentValue = Dvar.r_stereo3DOn:get()
	local enable3DButton = CoD.LeftRightSelector.new( Engine.Localize( "MENU_STEREO_3D_CAPS" ), currentValue, nil, defaultAnimationState )
	enable3DButton.hintText = Engine.Localize( "MENU_STEREO_3D_DESC" )
	CoD.ButtonList.AssociateHintTextListenerToButton( enable3DButton )
	enable3DButton:registerEventHandler( "button_action", CoD.Stereoscopic3D.Button_3D )
	enable3DButton:disableCycling()
	buttonList:addElement( enable3DButton )
	if Engine.IsInGame() then
		enable3DButton:disable()
	end
	if currentValue then
		enable3DButton.choiceText:setText( Engine.Localize( "MENU_ENABLED_CAPS" ) )
	else
		enable3DButton.choiceText:setText( Engine.Localize( "MENU_DISABLED_CAPS" ) )
	end
	enable3DButton:processEvent( {
		name = "gain_focus"
	} )
	return stereoscopic3DMenu
end

