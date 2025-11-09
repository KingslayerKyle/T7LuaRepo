CoD.SignIn = {}
CoD.SignIn.GuestButton = function ( self, event )
	Engine.Exec( event.controller, "xsigninguest" )
	self:goBack( event.controller )
end

CoD.SignIn.SubButton = function ( self, event )
	Engine.Exec( event.controller, "xsigninlive" )
	self:goBack( event.controller )
end

LUI.createMenu.SignIn = function ( controller )
	local signInMenu = CoD.Menu.NewSmallPopup( "SignIn" )
	signInMenu:addTitle( Engine.Localize( "MENU_SIGN_IN_CAPS" ) )
	signInMenu.m_ownerController = controller
	signInMenu.unusedControllerAllowed = true
	signInMenu:addBackButton()
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
	signInMenu:addElement( buttonList )
	local guestButton = buttonList:addButton( Engine.Localize( "MENU_USE_GUEST" ) )
	guestButton:setActionEventName( "signin_popup_guest" )
	signInMenu:registerEventHandler( "signin_popup_guest", CoD.SignIn.GuestButton )
	local subButton = buttonList:addButton( Engine.Localize( "XBOXLIVE_SIGNIN" ) )
	subButton:setActionEventName( "signin_popup_subuser" )
	signInMenu:registerEventHandler( "signin_popup_subuser", CoD.SignIn.SubButton )
	if CoD.useController then
		buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return signInMenu
end

