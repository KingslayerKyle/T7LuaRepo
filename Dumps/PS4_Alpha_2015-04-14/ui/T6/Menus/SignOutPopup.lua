CoD.SignOutPopup = {}
CoD.SignOutPopup.Back = function ( self, event )
	self:goBack( event.controller )
end

CoD.SignOutPopup.YesButton = function ( self, event )
	Engine.Exec( event.controller, "xsignout" )
	CoD.SignOutPopup.Back( self, event )
end

CoD.SignOutPopup.SetWarning = function ( self, warningText )
	self.warningLabel:setText( warningText )
end

CoD.SignOutPopup.AddButtons = function ( self )
	local yesButton = self.buttonList:addButton( Engine.Localize( "MENU_YES" ) )
	yesButton:setActionEventName( "button_action_yes" )
	local noButton = self.buttonList:addButton( Engine.Localize( "MENU_NO" ) )
	noButton:setActionEventName( "button_action_no" )
	if CoD.useController then
		noButton:processEvent( {
			name = "gain_focus"
		} )
	end
end

LUI.createMenu.SignOut = function ( controller )
	local signOutMenu = CoD.Menu.NewSmallPopup( "SignOut" )
	signOutMenu:setOwner( controller )
	signOutMenu:addSelectButton()
	signOutMenu:addBackButton()
	signOutMenu:registerEventHandler( "button_prompt_back", CoD.SignOutPopup.Back )
	signOutMenu:registerEventHandler( "button_action_yes", CoD.SignOutPopup.YesButton )
	signOutMenu:registerEventHandler( "button_action_no", CoD.SignOutPopup.Back )
	signOutMenu.addButtons = CoD.SignOutPopup.AddButtons
	signOutMenu.setWarning = CoD.SignOutPopup.SetWarning
	local top = CoD.Menu.TitleHeight + 5
	signOutMenu.warningLabel = LUI.UIText.new()
	signOutMenu.warningLabel:setLeftRight( true, true, 0, 0 )
	signOutMenu.warningLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	signOutMenu.warningLabel:setFont( CoD.fonts.Default )
	signOutMenu.warningLabel:setAlignment( LUI.Alignment.Left )
	signOutMenu:addElement( signOutMenu.warningLabel )
	signOutMenu.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		bottom = 0
	} )
	signOutMenu:addElement( signOutMenu.buttonList )
	return signOutMenu
end

