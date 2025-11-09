LUI.createMenu.LiveStream_Login = function ( controller )
	local self = CoD.Menu.NewSmallPopup( "LiveStream_Login" )
	self:setOwner( controller )
	self:addSelectButton()
	self:addBackButton()
	self:registerEventHandler( "edit_username", LiveStream_Login_EditUserName )
	self:registerEventHandler( "edit_password", LiveStream_Login_EditPassword )
	self:registerEventHandler( "livestream_login", LiveStream_Login_ProcessLogin )
	self:registerEventHandler( "button_prompt_back", LiveStream_Login_Back )
	self:registerEventHandler( "update_login_process", LiveStream_Login_Update )
	self:registerEventHandler( "ui_keyboard_input", LiveStream_Login_UpdateKeyboard )
	local f1_local0 = CoD.GetPlayerStats( controller )
	self.authToken = f1_local0.liveStreamingAuthToken:get()
	self.loginContainer = LUI.UIContainer.new()
	self.loginContainer:setLeftRight( true, true, 0, 0 )
	self.loginContainer:setTopBottom( true, true, 0, 0 )
	self.loginContainer.visible = true
	self.loginContainer:setAlpha( 1 )
	self:addElement( self.loginContainer )
	local top = 5
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( true, true, 0, 0 )
	titleText:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	titleText:setFont( CoD.fonts.Condensed )
	titleText:setAlignment( LUI.Alignment.Left )
	titleText:setText( Engine.Localize( "MENU_TWITCH_LOGIN" ) )
	self.loginContainer:addElement( titleText )
	top = top + 30
	local userNameText = LUI.UIText.new()
	userNameText:setLeftRight( true, true, 0, 0 )
	userNameText:setTopBottom( true, false, top, top + CoD.textSize.Default )
	userNameText:setFont( CoD.fonts.Default )
	userNameText:setAlignment( LUI.Alignment.Left )
	userNameText:setText( Engine.Localize( "MENU_USERNAME" ) .. ":" )
	self.loginContainer:addElement( userNameText )
	top = top + CoD.textSize.Default
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( true, true, top, 10 )
	buttonList:setFont( CoD.fonts.Default )
	buttonList:setSpacing( CoD.textSize.Default + 5 )
	self.loginContainer:addElement( buttonList )
	local f1_local1 = CoD.GetPlayerStats( controller )
	local authUserName = f1_local1.liveStreamingAuthUsername
	local userName = authUserName:get()
	if userName == "" then
		userName = Dvar.webm_httpAuthLogin:get()
		if userName == "" then
			userName = Engine.Localize( "MENU_EMPTY" )
		end
	else
		Dvar.webm_httpAuthLogin:set( authUserName )
	end
	local userNameButton = buttonList:addButton( userName )
	userNameButton:setActionEventName( "edit_username" )
	self.loginContainer.userNameButton = userNameButton
	top = top + CoD.CoD9Button.Height + 5
	local passwordText = LUI.UIText.new()
	passwordText:setLeftRight( true, true, 0, 0 )
	passwordText:setTopBottom( true, false, top, top + CoD.textSize.Default )
	passwordText:setFont( CoD.fonts.Default )
	passwordText:setAlignment( LUI.Alignment.Left )
	passwordText:setText( Engine.Localize( "MENU_PASSWORD" ) .. ":" )
	self.loginContainer:addElement( passwordText )
	local password = Dvar.webm_httpAuthPass:get()
	local passwordButton = buttonList:addButton( LiveStream_Login_ConvertPasswordToStar( password ) )
	passwordButton:setActionEventName( "edit_password" )
	self.loginContainer.passwordButton = passwordButton
	local loginButton = buttonList:addButton( Engine.Localize( "MENU_LOGIN_CAPS" ) )
	loginButton:setActionEventName( "livestream_login" )
	loginButton:processEvent( {
		name = "gain_focus"
	} )
	self.loginProcessingContainer = LUI.UIContainer.new()
	self.loginProcessingContainer:setLeftRight( true, true, 0, 0 )
	self.loginProcessingContainer:setTopBottom( true, true, 0, 0 )
	self.loginProcessingContainer.visible = false
	self.loginProcessingContainer:setAlpha( 0 )
	self:addElement( self.loginProcessingContainer )
	local iconHeight = 64
	local iconWidth = 64
	self.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	self.spinner:setLeftRight( false, false, -(iconWidth / 2), iconWidth / 2 )
	self.spinner:setTopBottom( false, false, -(iconHeight / 2), iconHeight / 2 )
	self.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	self.loginProcessingContainer:addElement( self.spinner )
	top = 35
	local connectingText = LUI.UIText.new()
	connectingText:setLeftRight( true, true, 0, 0 )
	connectingText:setTopBottom( true, false, top, top + CoD.textSize.Default )
	connectingText:setFont( CoD.fonts.Default )
	connectingText:setAlignment( LUI.Alignment.Center )
	connectingText:setText( Engine.Localize( "MENU_CONNECTING_TO_TWITCH" ) )
	self.loginProcessingContainer:addElement( connectingText )
	self.loginTimer = LUI.UITimer.new( 500, {
		name = "update_login_process",
		controller = controller
	}, false )
	self:addElement( self.loginTimer )
	if self.authToken ~= "" then
		self:processEvent( {
			name = "livestream_login",
			controller = controller
		} )
	end
	return self
end

function LiveStream_Login_ConvertPasswordToStar( password )
	if password == "" then
		password = Engine.Localize( "MENU_EMPTY" )
	end
	local len = string.len( password )
	local changedPassword = ""
	for i = 1, len, 1 do
		local f2_local2 = i
		changedPassword = "*" .. changedPassword
	end
	return changedPassword
end

function LiveStream_Login_UpdateKeyboard( self, event )
	if event.type == CoD.KEYBOARD_TYPE_LIVESTREAM_USER then
		Dvar.webm_httpAuthLogin:set( event.input )
		self.loginContainer.userNameButton:setLabel( event.input )
	elseif event.type == CoD.KEYBOARD_TYPE_LIVESTREAM_PASS then
		Dvar.webm_httpAuthPass:set( event.input )
		self.loginContainer.passwordButton:setLabel( LiveStream_Login_ConvertPasswordToStar( event.input ) )
	end
end

function LiveStream_Login_EditUserName( self, event )
	Engine.Exec( event.controller, "ui_keyboard_new " .. CoD.KEYBOARD_TYPE_LIVESTREAM_USER )
end

function LiveStream_Login_EditPassword( self, event )
	Engine.Exec( event.controller, "ui_keyboard_new " .. CoD.KEYBOARD_TYPE_LIVESTREAM_PASS )
end

function LiveStream_Login_Back( self, event )
	self:goBack()
end

function LiveStream_Login_ProcessLogin( self, event )
	if self.loginProcessStarted then
		return 
	end
	local controller = event.controller
	if self.authToken ~= "" then
		Engine.LivestreamEnable( controller )
		Dvar.webm_httpAuthToken:set( self.authToken )
		Dvar.webm_encStreamEnabled:set( true )
	else
		Engine.LivestreamDisableAsync( controller )
		Engine.LivestreamEnable( controller )
		local f7_local0 = CoD.GetPlayerStats( controller )
		f7_local0.liveStreamingAuthUsername:set( Dvar.webm_httpAuthLogin:get() )
		Dvar.webm_httpAuthToken:set( "" )
		Dvar.webm_encStreamEnabled:set( true )
	end
	self.loginContainer:setAlpha( 0 )
	self.loginContainer.visible = false
	self.loginProcessingContainer:setAlpha( 1 )
	self.loginProcessingContainer.visible = true
	self.loginProcessStarted = true
end

function LiveStream_Login_Update( self, event )
	if not self.loginProcessStarted then
		return 
	elseif Dvar.webm_encStatus:get() ~= "streaming" and Dvar.webm_encStreamEnabled:get() == true then
		return 
	end
	local controller = event.controller
	if Dvar.webm_encStatus:get() ~= "streaming" then
		self.loginContainer:setAlpha( 1 )
		self.loginContainer.visible = true
		self.loginProcessingContainer:setAlpha( 0 )
		self.loginProcessingContainer.visible = false
		local f8_local0 = CoD.GetPlayerStats( controller )
		f8_local0.liveStreamingAuthToken:set( "" )
		Engine.LivestreamDisableAsync( controller )
		self.occludedMenu:processEvent( {
			name = "update_livestream",
			controller = controller
		} )
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "MENU_ERROR_WHILE_LOGGING_IN_TO_TWITCH" ) )
	else
		local f8_local0 = CoD.GetPlayerStats( controller )
		f8_local0.liveStreamingAuthToken:set( Dvar.webm_httpAuthToken:get() )
		Engine.Exec( controller, "uploadstats" )
		self.occludedMenu:processEvent( {
			name = "update_livestream",
			controller = controller
		} )
		self:goBack()
	end
	self.loginProcessStarted = false
end

