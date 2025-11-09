CoD.ComErrorPopup = {}
CoD.ComErrorPopup.Width = 480
CoD.ComErrorPopup.Height = 330
CoD.ComErrorPopup.MenuChanged = function ( self, event )
	if self.occludedMenu == event.prevMenu then
		self:setOccludedMenu( event.nextMenu )
	end
end

CoD.ComErrorPopup.GoBack = function ( self, controller )
	CoD.Menu.goBack( self, controller )
	Engine.ClearError()
	if Engine.IsInGame() and CoD.isSinglePlayer then
		Engine.LockInput( controller, false )
		Engine.SetUIActive( controller, false )
		CoD.ErrorPopupOpen = 0
	end
end

LUI.createMenu.ErrorPopup = function ( controller )
	local errorMessageText = ""
	if "" ~= Engine.DvarString( nil, "ui_errorMessage" ) then
		errorMessageText = Engine.Localize( Dvar.ui_errorMessage:get() )
	end
	local numLines = math.max( 4, Engine.GetNumTextLines( errorMessageText, CoD.fonts.Default, CoD.textSize.Default, CoD.Menu.SmallPopupWidth ) )
	local totalHeight = CoD.textSize.Default * numLines + 160
	local errorMenu = CoD.Menu.NewSmallPopup( "ErrorPopup", nil, nil, CoD.Menu.SmallPopupWidth, totalHeight )
	errorMenu.anyControllerAllowed = true
	if Engine.IsInGame() then
		errorMenu:setOwner( controller )
	end
	errorMenu:addSelectButton()
	errorMenu:addBackButton()
	errorMenu:registerEventHandler( "menu_changed", CoD.ComErrorPopup.MenuChanged )
	errorMenu.goBack = CoD.ComErrorPopup.GoBack
	local top = 0
	local errorTitle = LUI.UIText.new()
	errorTitle:setLeftRight( true, false, 0, 1 )
	errorTitle:setTopBottom( true, false, top, top + CoD.textSize.Big )
	errorTitle:setFont( CoD.fonts.Big )
	errorTitle:setAlignment( LUI.Alignment.Left )
	errorMenu:addElement( errorTitle )
	errorTitle:setText( Engine.Localize( Engine.DvarString( nil, "ui_errorTitle" ) ) )
	top = top + CoD.textSize.Big
	local errorMessage = LUI.UIText.new()
	errorMessage:setLeftRight( true, true, 0, 0 )
	errorMessage:setTopBottom( true, false, top, top + CoD.textSize.Default )
	errorMessage:setFont( CoD.fonts.Default )
	errorMessage:setAlignment( LUI.Alignment.Left )
	errorMenu:addElement( errorMessage )
	errorMessage:setText( errorMessageText )
	CoD.Popup.SetWidthHeight( errorMenu, CoD.Menu.SmallPopupWidth, totalHeight )
	top = top + CoD.textSize.Default * 3
	local errorMessageDebug = LUI.UIText.new()
	errorMessageDebug:setLeftRight( true, true, 0, 0 )
	errorMessageDebug:setTopBottom( true, false, top, top + CoD.textSize.Default )
	errorMessageDebug:setFont( CoD.fonts.Default )
	errorMessageDebug:setAlignment( LUI.Alignment.Left )
	errorMenu:addElement( errorMessageDebug )
	errorMessageDebug:setText( Engine.DvarString( nil, "ui_errorMessageDebug" ) )
	local buttonListTop = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 2 + 10
	if totalHeight >= 300 then
		buttonListTop = buttonListTop - 20
	end
	errorMenu.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = buttonListTop,
		bottom = 0
	} )
	errorMenu:addElement( errorMenu.buttonList )
	local okButton = errorMenu.buttonList:addButton( Engine.Localize( "MENU_OK" ) )
	okButton:setActionEventName( "button_prompt_back" )
	okButton:processEvent( {
		name = "gain_focus"
	} )
	if CoD.isMultiplayer then
		Engine.ClearError()
	end
	return errorMenu
end

