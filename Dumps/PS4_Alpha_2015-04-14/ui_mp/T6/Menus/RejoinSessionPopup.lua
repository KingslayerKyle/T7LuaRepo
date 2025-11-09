CoD.RejoinSessionPopup = {}
LUI.createMenu.RejoinSessionPopup = function ( controller )
	local rejoinSessionMenu = CoD.Menu.NewSmallPopup( "RejoinSessionPopup" )
	rejoinSessionMenu:addBackButton()
	rejoinSessionMenu:addSelectButton()
	rejoinSessionMenu:registerEventHandler( "button_yes", CoD.RejoinSessionPopup.Button_Yes )
	rejoinSessionMenu:registerEventHandler( "button_no", CoD.RejoinSessionPopup.Button_No )
	local top = 5
	local popupBodytext = LUI.UIText.new()
	popupBodytext:setLeftRight( true, true, 0, 0 )
	popupBodytext:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	popupBodytext:setFont( CoD.fonts.Condensed )
	popupBodytext:setAlignment( LUI.Alignment.Left )
	popupBodytext:setText( Engine.Localize( "MENU_REJOIN_SESSION" ) )
	rejoinSessionMenu:addElement( popupBodytext )
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
	rejoinSessionMenu:addElement( buttonList )
	rejoinSessionMenu.yesButton = buttonList:addButton( Engine.Localize( "MENU_YES" ) )
	rejoinSessionMenu.yesButton:setActionEventName( "button_yes" )
	rejoinSessionMenu.noButton = buttonList:addButton( Engine.Localize( "MENU_NO" ) )
	rejoinSessionMenu.noButton:setActionEventName( "button_no" )
	rejoinSessionMenu.noButton:processEvent( {
		name = "gain_focus"
	} )
	return rejoinSessionMenu
end

CoD.RejoinSessionPopup.Button_Yes = function ( popup, event )
	Engine.Exec( event.controller, "session_rejoinsession " .. CoD.SESSION_REJOIN_JOIN_SESSION )
	popup:goBack()
end

CoD.RejoinSessionPopup.Button_No = function ( popup, event )
	Engine.Exec( event.controller, "session_rejoinsession " .. CoD.SESSION_REJOIN_CANCEL_JOIN_SESSION )
	popup:goBack()
end

