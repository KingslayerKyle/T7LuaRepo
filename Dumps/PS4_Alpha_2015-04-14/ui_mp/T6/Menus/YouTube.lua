CoD.YT_ACCOUNT_NOT_CHECKED = 0
CoD.YT_ACCOUNT_CHECKING = 1
CoD.YT_ACCOUNT_CHECKED = 2
CoD.YT_ACCOUNT_GETTING_TOKEN = 3
CoD.YT_ACCOUNT_TOKEN_RECEIVED = 4
CoD.YT_WAITING_FOR_AUTH = 5
CoD.YT_ACCOUNT_NOT_READY = 6
CoD.YT_ACCOUNT_READY = 7
local YouTube_Connect_Back = function ( self, event )
	if self.state ~= CoD.YT_ACCOUNT_READY then
		Engine.ExecNow( event.controller, "youTubeCancel" )
		self:goBack()
	else
		self:goBack()
		self.occludedMenu:processEvent( {
			name = "youtube_connect_complete",
			controller = event.controller
		} )
	end
end

local YouTube_CheckLoginState = function ( self, event )
	local controller = self:getOwner()
	if not self.accountChecked and Engine.IsYouTubeAccountChecked( controller ) then
		if Engine.IsYouTubeAccountRegistered( controller ) then
			self.state = CoD.YT_ACCOUNT_READY
			YouTube_Connect_Back( self, event )
			return 
		else
			Engine.Exec( controller, "youTubeRegister" )
			self.state = CoD.YT_ACCOUNT_NOT_READY
			self.accountChecked = true
			return 
		end
	end
	local youTubeData = Engine.YouTube_Get( controller )
	if youTubeData == nil then
		return 
	end
	local state = youTubeData.state
	if state == self.state then
		return 
	end
	self.state = state
	if state == CoD.YT_WAITING_FOR_AUTH then
		if self.activatingLiveStream == true then
			self.title:setText( Engine.Localize( "MENU_LIVESTREAMING_ACTIVATE" ) )
			self.msg:setText( Engine.Localize( "MENU_LIVESTREAMING_ACTIVATE_DESC", youTubeData.verification_url ) )
		else
			self.title:setText( Engine.Localize( "MENU_YOUTUBE_ACTIVATE" ) )
			self.msg:setText( Engine.Localize( "MENU_YOUTUBE_ACTIVATE_DESC", youTubeData.verification_url ) )
		end
		self.codeText:setText( Engine.Localize( "MENU_LIVESTREAMING_CODE", youTubeData.user_code ) )
		self.spinner:setAlpha( 0 )
	elseif state == CoD.YT_ACCOUNT_CHECKED then
		self.title:setText( Engine.Localize( "MENU_AWAITING_AUTHENTICATION" ) )
		self.msg:setText( "" )
		self.codeText:setText( "" )
		self.spinner:setAlpha( 1 )
	elseif state == CoD.YT_ACCOUNT_READY then
		YouTube_Connect_Back( self, event )
	else
		self.title:setText( Engine.Localize( "MENU_YOUTUBE_CONNECT" ) )
		self.msg:setText( "" )
		self.codeText:setText( "" )
		self.spinner:setAlpha( 1 )
	end
end

local YouTube_Connect_Error = function ( self, event )
	self.title:setText( Engine.Localize( "MENU_ERROR" ) )
	self.msg:setText( event.errorMessage )
	self.spinner:setAlpha( 0 )
	self.codeText:setText( "" )
	if self.pollTimer ~= nil then
		self.pollTimer:close()
		self.pollTimer = nil
	end
end

LUI.createMenu.YouTube_Connect = function ( controller )
	local menuWidth = 480
	local menuHeight = 340
	local self = CoD.Popup.SetupPopup( "YouTube_Connect", controller, CoD.Popup.Type.STRETCHED )
	self:setWidthHeight( menuWidth, menuHeight )
	self:setOwner( controller )
	self.title:setText( Engine.Localize( "MENU_YOUTUBE_CONNECT" ) )
	self.activatingLiveStream = CoD.perController[controller].activatingLiveStream
	self:addBackButton()
	local iconHeight = 96
	local iconWidth = 96
	self.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	self.spinner:setLeftRight( true, true, menuWidth / 2 - iconWidth / 2, -(menuWidth / 2 - iconWidth / 2) )
	self.spinner:setTopBottom( true, true, menuHeight / 2 - iconHeight / 2, -(menuHeight / 2 - iconHeight / 2) )
	self.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	self:addElement( self.spinner )
	self.codeText = LUI.UITightText.new()
	self.codeText:setLeftRight( true, true, 20, -20 )
	self.codeText:setTopBottom( false, true, -40 - CoD.textSize.Big, -40 )
	self.codeText:setFont( CoD.fonts.Big )
	self.codeText:setAlignment( LUI.Alignment.Center )
	self:addElement( self.codeText )
	self:registerEventHandler( "check_login_state", YouTube_CheckLoginState )
	self:registerEventHandler( "button_prompt_back", YouTube_Connect_Back )
	self:registerEventHandler( "button_prompt_ok", YouTube_Connect_Ok )
	self:registerEventHandler( "live_dw_youtube_error", YouTube_Connect_Error )
	self.state = CoD.YT_ACCOUNT_NOT_READY
	self.pollTimer = LUI.UITimer.new( 2000, {
		name = "check_login_state",
		controller = controller
	} )
	self:addElement( self.pollTimer )
	self.accountChecked = false
	self.msg:setText( "" )
	return self
end

local YouTube_UnRegister_Complete = function ( self, event )
	if event.error then
		self.title:setText( Engine.Localize( "MENU_ERROR" ) )
		self.msg:setText( Engine.Localize( "MENU_YOUTUBE_UNLINK_FAILED" ) )
	else
		self.title:setText( Engine.Localize( "MENU_NOTICE" ) )
		self.msg:setText( Engine.Localize( "MENU_YOUTUBE_UNLINK_SUCCESS" ) )
	end
	self.spinner:setAlpha( 0 )
	self:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	self.occludedMenu:processEvent( {
		name = "youtube_connect_complete",
		controller = event.controller
	} )
end

LUI.createMenu.YouTube_UnRegister = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "YouTube_UnRegister", controller )
	popup:registerEventHandler( "live_dw_youtube_unlink_complete", YouTube_UnRegister_Complete )
	popup.title:setText( Engine.Localize( "MENU_UNLINKING_ACCOUNT" ) )
	Engine.Exec( controller, "youTubeUnregister" )
	return popup
end

