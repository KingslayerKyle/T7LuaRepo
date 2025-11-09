CoD.RefetchWADPopup = {}
CoD.RefetchWADPopup.SetupRefetchWAD = function ( self, event )
	local blackImage = LUI.UIImage.new()
	blackImage:setLeftRight( false, false, -800, 800 )
	blackImage:setTopBottom( false, false, -400, 400 )
	blackImage:setRGB( 0, 0, 0 )
	self:addElement( blackImage )
	local fetchTimer = LUI.UITimer.new( 100, {
		name = "refetch_wad",
		controller = event.controller
	}, false, self )
	self:addElement( fetchTimer )
end

CoD.RefetchWADPopup.RefetchWAD = function ( self, event )
	Engine.Exec( event.controller, "getLatestWAD" )
end

CoD.RefetchWADPopup.AddButton = function ( parentPopup, buttonText, actionEventName )
	local button = parentPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
end

LUI.createMenu.RefetchWADConfirmationPopup = function ( controller )
	local popup = CoD.Menu.NewSmallPopup( "RefetchWADConfirmationPopup" )
	popup.anyControllerAllowed = true
	popup:addSelectButton()
	popup:addBackButton()
	popup:registerEventHandler( "setup_refetch_wad", CoD.RefetchWADPopup.SetupRefetchWAD )
	popup:registerEventHandler( "open_refetch_wad_confirmation_popup", CoD.NullFunction )
	popup:registerEventHandler( "refetch_wad", CoD.RefetchWADPopup.RefetchWAD )
	local top = 5
	local errorTitle = LUI.UIText.new()
	errorTitle:setLeftRight( true, true, 0, 0 )
	errorTitle:setTopBottom( true, false, top, top + CoD.textSize.Big )
	errorTitle:setFont( CoD.fonts.Big )
	errorTitle:setAlignment( LUI.Alignment.Left )
	errorTitle:setText( Engine.Localize( "MENU_REFETCH_WAD_CONFIRMATION_TITLE" ) )
	popup:addElement( errorTitle )
	top = top + CoD.textSize.Big + 10
	local errorMessage = LUI.UIText.new()
	errorMessage:setLeftRight( true, true, 0, 0 )
	errorMessage:setTopBottom( true, false, top, top + CoD.textSize.Default )
	errorMessage:setFont( CoD.fonts.Default )
	errorMessage:setAlignment( LUI.Alignment.Left )
	errorMessage:setText( Engine.Localize( "MENU_REFETCH_WAD_CONFIRMATION_MESSAGE" ) )
	popup:addElement( errorMessage )
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
	popup:addElement( popup.buttonList )
	CoD.RefetchWADPopup.AddButton( popup, Engine.Localize( "MENU_REFETCH_WAD_ACCEPT" ), "setup_refetch_wad" )
	CoD.RefetchWADPopup.AddButton( popup, Engine.Localize( "MENU_CANCEL" ), "button_prompt_back" )
	popup.buttonList:processEvent( {
		name = "gain_focus"
	} )
	return popup
end

