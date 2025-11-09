CoD.FBPopup = {}
local FBPopup_EnterUsername = function ( self, event )
	Engine.Exec( event.controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_FACEBOOK_USER )
end

local FBPopup_EnterPassword = function ( self, event )
	Engine.Exec( event.controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_FACEBOOK_PASS )
end

local FBPopup_UpdateButtonText = function ( self, event )
	self:setLabel( event.text )
end

local FBPopup_SignInHandler = function ( self, event )
	Engine.Exec( event.controller, "fbRegister" )
	self:goBack( event.controller )
end

LUI.createMenu.FBPopup = function ( controller )
	local fbPopup = CoD.Menu.NewSmallPopup( "FBPopup" )
	fbPopup.m_ownerController = controller
	fbPopup:addBackButton()
	local fbImageSize = 50
	local fbImage = LUI.UIImage.new()
	fbImage:setLeftRight( false, true, -fbImageSize, 0 )
	fbImage:setTopBottom( true, false, 0, fbImageSize )
	fbImage:setImage( RegisterMaterial( "menu_lobby_icon_facebook" ) )
	fbPopup:addElement( fbImage )
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 5,
		bottom = 0
	} )
	fbPopup:addElement( buttonList )
	buttonList:addText( Engine.Localize( "MENU_USERNAME_CAPS" ) )
	local usernameBtn = buttonList:addButton( Engine.Localize( "MENU_USERNAME" ) )
	usernameBtn:setActionEventName( "fb_enter_username" )
	usernameBtn:registerEventHandler( "fb_username_entered", FBPopup_UpdateButtonText )
	fbPopup:registerEventHandler( "fb_enter_username", FBPopup_EnterUsername )
	local usernameBG = LUI.UIImage.new()
	usernameBG:setLeftRight( true, true, 0, -fbImageSize * 2 )
	usernameBG:setTopBottom( true, true, 0, 0 )
	usernameBG:setRGB( 0.5, 0.5, 0.5 )
	usernameBG:setAlpha( 0.5 )
	usernameBtn:addElement( usernameBG )
	buttonList:addText( Engine.Localize( "MENU_PASSWORD_CAPS" ) )
	local passwordBtn = buttonList:addButton( Engine.Localize( "MENU_PASSWORD" ) )
	passwordBtn:setActionEventName( "fb_enter_password" )
	passwordBtn:registerEventHandler( "fb_password_entered", FBPopup_UpdateButtonText )
	fbPopup:registerEventHandler( "fb_enter_password", FBPopup_EnterPassword )
	local passwordBG = LUI.UIImage.new()
	passwordBG:setLeftRight( true, true, 0, -fbImageSize * 2 )
	passwordBG:setTopBottom( true, true, 0, 0 )
	passwordBG:setRGB( 0.5, 0.5, 0.5 )
	passwordBG:setAlpha( 0.5 )
	passwordBtn:addElement( passwordBG )
	buttonList:addSpacer( CoD.CoD9Button.Height )
	local signinBtn = buttonList:addButton( Engine.Localize( "MENU_SIGN_IN_CAPS" ) )
	signinBtn:setActionEventName( "fb_signin" )
	fbPopup:registerEventHandler( "fb_signin", FBPopup_SignInHandler )
	usernameBtn:processEvent( {
		name = "gain_focus"
	} )
	return fbPopup
end

