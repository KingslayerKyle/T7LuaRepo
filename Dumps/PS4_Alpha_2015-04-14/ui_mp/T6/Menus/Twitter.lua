require( "ui.T6.TextFieldButton" )

CoD.Twitter = {}
function Twitter_Connect_UpdateKeyboard( self, event )
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_TWITTER_USER then
		self.loginContainer.userNameButton:setText( event.input )
		self.loginContainer.userNameButton.text = event.input
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_TWITTER_PASS then
		self.loginContainer.passwordButton:setText( CoD.TextFieldButton.ConvertToStar( event.input ) )
		self.loginContainer.passwordButton.text = event.input
	end
end

function Twitter_Connect_EditUserName( self, event )
	Engine.Exec( event.controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_TWITTER_USER )
end

function Twitter_Connect_EditPassword( self, event )
	Engine.Exec( event.controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_TWITTER_PASS )
end

function Twitter_Connect_Back( self, event )
	self:goBack()
end

function Twitter_Connect_ProcessLogin( self, event )
	self.loginContainer:setAlpha( 0 )
	self.spinner:setAlpha( 1 )
	self.title:setText( Engine.Localize( "MENU_CONNECTING_TO_TWITTER" ) )
	self:removeBackButton()
	self:removeSelectButton()
	if self.fromLiveStreamMenu == true then
		self:setPreviousMenu( nil )
	end
	Engine.Exec( event.controller, "twitterRegister " .. self.loginContainer.userNameButton.text .. " " .. self.loginContainer.passwordButton.text )
end

function Twitter_Connect_Success( self, event )
	if self.fromLiveStreamMenu == true then
		self:goBack( event.controller )
		self.occludedMenu:processEvent( {
			name = "livestream_send_to_twitter",
			controller = event.controller
		} )
	else
		self.title:setText( Engine.Localize( "MENU_NOTICE" ) )
		self.msg:setText( Engine.Localize( "MENU_TWITTER_REGISTERATION_SUCCESS" ) )
		self.spinner:setAlpha( 0 )
		self.occludedMenu:processEvent( {
			name = "twitter_connect_complete",
			controller = event.controller
		} )
		self:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	end
end

function Twitter_Connect_Error( self, event )
	self.title:setText( Engine.Localize( "MENU_ERROR" ) )
	self.msg:setText( event.errorMessage )
	self.spinner:setAlpha( 0 )
	self:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
end

LUI.createMenu.Twitter_Connect = function ( controller )
	local menuWidth = 480
	local menuHeight = 290
	local popup = CoD.Popup.SetupPopup( "Twitter_Connect", controller, CoD.Popup.Type.STRETCHED )
	popup:setWidthHeight( menuWidth, menuHeight )
	popup:setOwner( controller )
	popup.fromLiveStreamMenu = CoD.perController[controller].fromLiveStreamMenu
	popup:registerEventHandler( "edit_username", Twitter_Connect_EditUserName )
	popup:registerEventHandler( "edit_password", Twitter_Connect_EditPassword )
	popup:registerEventHandler( "button_prompt_back", Twitter_Connect_Back )
	popup:registerEventHandler( "ui_keyboard_input", Twitter_Connect_UpdateKeyboard )
	popup:registerEventHandler( "twitter_login", Twitter_Connect_ProcessLogin )
	popup:registerEventHandler( "live_dw_twitter_success", Twitter_Connect_Success )
	popup:registerEventHandler( "live_dw_twitter_error", Twitter_Connect_Error )
	local iconHeight = 64
	local iconWidth = 64
	popup.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	popup.spinner:setLeftRight( true, true, CoD.Menu.SmallPopupWidth / 2 - iconWidth / 2, -(CoD.Menu.SmallPopupWidth / 2 - iconWidth / 2) )
	popup.spinner:setTopBottom( true, true, CoD.Menu.SmallPopupHeight / 2 - iconHeight / 2, -(CoD.Menu.SmallPopupHeight / 2 - iconHeight / 2) )
	popup.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	popup.spinner:setAlpha( 0 )
	popup:addElement( popup.spinner )
	popup.title:setText( Engine.Localize( "MENU_TWITTER_LOGIN" ) )
	popup:addSelectButton( Engine.Localize( "MPUI_OK" ) )
	popup:addBackButton()
	popup.loginContainer = LUI.UIContainer.new()
	popup.loginContainer:setLeftRight( true, true, 0, 0 )
	popup.loginContainer:setTopBottom( true, true, 0, 0 )
	popup.loginContainer.visible = true
	popup.loginContainer:setAlpha( 1 )
	popup:addElement( popup.loginContainer )
	local vert = LUI.UIVerticalList.new()
	vert:setLeftRight( true, true, 10, -10 )
	vert:setTopBottom( true, true, 55, 0 )
	vert:setSpacing( 5 )
	popup.loginContainer:addElement( vert )
	local userNameText = LUI.UIText.new()
	userNameText:setLeftRight( true, true, 0, 0 )
	userNameText:setTopBottom( true, false, 0, CoD.textSize.Default )
	userNameText:setFont( CoD.fonts.Default )
	userNameText:setAlignment( LUI.Alignment.Left )
	userNameText:setText( Engine.Localize( "MENU_USERNAME" ) .. ":" )
	vert:addElement( userNameText )
	local userNameButton = CoD.TextFieldButton.new( "", "edit_username" )
	vert:addElement( userNameButton )
	userNameButton.text = "None"
	popup.loginContainer.userNameButton = userNameButton
	local passwordText = LUI.UIText.new()
	passwordText:setLeftRight( true, true, 0, 0 )
	passwordText:setTopBottom( true, false, 0, CoD.textSize.Default )
	passwordText:setFont( CoD.fonts.Default )
	passwordText:setAlignment( LUI.Alignment.Left )
	passwordText:setText( Engine.Localize( "MENU_PASSWORD" ) .. ":" )
	vert:addElement( passwordText )
	local passwordButton = CoD.TextFieldButton.new( "", "edit_password" )
	vert:addElement( passwordButton )
	passwordButton.text = "None"
	popup.loginContainer.passwordButton = passwordButton
	vert:addSpacer( 20 )
	local loginButton = CoD.TextFieldButton.new( Engine.Localize( "MENU_LOGIN_CAPS" ), "twitter_login", LUI.Alignment.Center )
	vert:addElement( loginButton )
	popup.loginContainer.loginButton = loginButton
	popup.loginContainer.loginButton:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
	return popup
end

local Twitter_UnRegister_Complete = function ( self, event )
	if event.error then
		self.title:setText( Engine.Localize( "MENU_ERROR" ) )
		self.msg:setText( Engine.Localize( "MENU_TWITTER_UNLINK_FAILED" ) )
	else
		self.title:setText( Engine.Localize( "MENU_NOTICE" ) )
		self.msg:setText( Engine.Localize( "MENU_TWITTER_UNLINK_SUCCESS" ) )
	end
	self.spinner:setAlpha( 0 )
	self:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	self.occludedMenu:processEvent( {
		name = "twitter_connect_complete",
		controller = event.controller
	} )
end

LUI.createMenu.Twitter_UnRegister = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "Twitter_UnRegister", controller )
	popup:registerEventHandler( "live_dw_twitter_unlink_complete", Twitter_UnRegister_Complete )
	popup.title:setText( Engine.Localize( "MENU_UNLINKING_ACCOUNT" ) )
	Engine.Exec( controller, "twitterUnregister" )
	return popup
end

