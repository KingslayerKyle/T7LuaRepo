CoD.LiveStream = {}
CoD.LiveStream.PerformBanChecks = false
CoD.LiveStream.CanPostOnFacebook = function ()
	local canPostLinks, canPostImages = Engine.GetSocialCapabilities()
	if Dvar.fbEnabled:get() == true and canPostLinks and canPostImages then
		return true
	else
		return false
	end
end

CoD.LiveStream.CanPostOnTwitter = function ()
	local canPostLinks, canPostImages = Engine.GetSocialCapabilities()
	if Engine.DvarBool( nil, "twEnabled" ) and canPostLinks then
		return true
	else
		return false
	end
end

CoD.LiveStream.TwitchEnabled = function ()
	if Engine.DvarBool( nil, "webm_encTwitchEnabled" ) or Engine.GetIsSuperUser( Engine.GetPrimaryController() ) then
		return true
	else
		return false
	end
end

local LiveStream_ChooseMode_YouTube = function ( self, event )
	local controller = event.controller
	Dvar.webm_httpAuthMode:set( "youtube" )
	Dvar.webm_httpUploadUrl:set( Dvar.webm_httpUploadUrlYouTube:get() )
	self:goBack()
	if not Engine.IsYouTubeAccountChecked( controller ) or not Engine.IsYouTubeAccountRegistered( controller ) then
		CoD.perController[controller].activatingLiveStream = true
		self.occludedMenu:openPopup( "YouTube_Connect", controller )
		CoD.perController[controller].activatingLiveStream = nil
	else
		self.occludedMenu:openPopup( "LiveStreamTOS", controller )
	end
end

local LiveStream_ChooseMode_Twitch = function ( self, event )
	local controller = event.controller
	Dvar.webm_httpAuthMode:set( "twitch" )
	Dvar.webm_httpUploadUrl:set( Dvar.webm_httpUploadUrlTwitch:get() )
	self:goBack()
	if not Engine.IsTwitchAccountRegistered( controller ) then
		CoD.perController[controller].activatingLiveStream = true
		self.occludedMenu:openPopup( "Twitch_Connect", controller )
		CoD.perController[controller].activatingLiveStream = nil
	else
		local userInfo = Engine.GetTwitchAccountInfo( controller )
		Dvar.webm_httpAuthToken:set( userInfo.authToken )
		self.occludedMenu:openPopup( "LiveStreamTOS", controller )
	end
end

LUI.createMenu.LiveStream_ChooseMode = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "LiveStream_ChooseMode", controller )
	popup.title:setText( Engine.Localize( "MENU_LIVESTREAM_CHOOSE_MODE" ) )
	popup.msg:setText( Engine.Localize( "MENU_LIVESTREAM_CHOOSE_MODE_DESC" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_YOUTUBE" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_TWITCH" ) )
	popup.choiceA:setActionEventName( "livestream_mode_youtube" )
	popup.choiceA:processEvent( {
		name = "gain_focus"
	} )
	popup.choiceB:setActionEventName( "livestream_mode_twitch" )
	if not Engine.IsTwitchAccountChecked( controller ) then
		popup.choiceB:disable()
	end
	popup:registerEventHandler( "livestream_mode_youtube", LiveStream_ChooseMode_YouTube )
	popup:registerEventHandler( "livestream_mode_twitch", LiveStream_ChooseMode_Twitch )
	return popup
end

local LiveStream_CheckDisableState = function ( self, event )
	if Engine.WebM_camera_IsEnabled() then
		Engine.WebM_camera_Disable()
	end
	if Dvar.webm_httpAuthMode:get() == "twitch" then
		Dvar.webm_encStreamEnabled:set( false )
	end
	local disabled = Engine.LivestreamDisableAsync()
	if disabled then
		self.occludedMenu.skipUpdates = nil
		self:goBack()
		self.occludedMenu:processEvent( {
			name = "livestream_update_state",
			controller = self:getOwner(),
			disabled = true
		} )
	end
end

LUI.createMenu.LiveStream_Disable = function ( controller )
	local self = CoD.Popup.SetupPopupBusy( "LiveStream_Disable" )
	self:setOwner( controller )
	self.title:setText( Engine.Localize( "MENU_LIVESTREAM_DISABLING" ) )
	self:registerEventHandler( "check_for_disable_complete", LiveStream_CheckDisableState )
	self.pollTimer = LUI.UITimer.new( 200, {
		name = "check_for_disable_complete",
		controller = controller
	} )
	self:addElement( self.pollTimer )
	return self
end

local LiveStream_GetYouTube = function ( controller )
	return Engine.YouTube_Get( controller )
end

local LiveStream_ToggleStream = function ( params )
	if CoD.LiveStream.PerformBanChecks == true and Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_STREAMING ) then
		Engine.ExecNow( params.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_STREAMING )
		return 
	elseif params.parentButton.active ~= true then
		return 
	elseif params.value == 1 then
		if not Engine.IsLivestreamEnabled() then
			if Dvar.webm_httpAuthMode:get() == "youtube" then
				Engine.YouTube_Set( {
					controlerIndex = params.controller
				} )
			elseif Dvar.webm_httpAuthMode:get() == "twitch" then
				local userInfo = Engine.GetTwitchAccountInfo( controller )
				Engine.Twitch_Set( {
					user = string.lower( userInfo.userName )
				} )
				Dvar.webm_encStreamEnabled:set( true )
			end
			Engine.LivestreamEnable( params.controller )
			Dvar.webm_encStreamEnabled:set( true )
			params.parentMenu.errorOpen = nil
		end
	elseif Engine.IsLivestreamEnabled() then
		if Engine.WebM_camera_IsEnabled() then
			Engine.WebM_camera_Disable()
			params.parentMenu.occludedMenu:processEvent( {
				name = "update_livestream_camera"
			} )
		end
		params.parentMenu.skipUpdates = true
		params.parentMenu:openPopup( "LiveStream_Disable", params.controller )
	end
	LiveStream_UpdateCameraStateBasedOnStreaming( params.parentMenu, true )
	LiveStream_UpdateButtonsBasedOnStreaming( params.parentMenu )
end

local LiveStream_ToggleCamera = function ( params )
	if CoD.LiveStream.PerformBanChecks == true and Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_STREAMING_CAMERA ) then
		Engine.ExecNow( params.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_STREAMING_CAMERA )
		return 
	elseif params.parentButton.active ~= true then
		return 
	elseif params.value == 1 then
		if Engine.IsLivestreamEnabled() and Engine.WebM_camera_IsAvailable() and not Engine.WebM_camera_IsEnabled() then
			Engine.WebM_camera_Enable( "livestream_cam" )
			params.parentMenu.occludedMenu:processEvent( {
				name = "update_livestream_camera"
			} )
		end
	elseif Engine.WebM_camera_IsEnabled() then
		Engine.WebM_camera_Disable()
		params.parentMenu.occludedMenu:processEvent( {
			name = "update_livestream_camera"
		} )
	end
end

function LiveStream_UpdateCameraButtonState( self )
	if not Engine.DvarBool( nil, "webm_encAllowCamera" ) then
		return 
	end
	local identityVerified = false
	local controller = self:getOwner()
	if not Engine.DvarBool( nil, "webm_encIdentityVerificationRequired" ) then
		identityVerified = true
	end
	if Dvar.webm_httpAuthMode:get() == "youtube" then
		local liveStreamData = LiveStream_GetYouTube( controller )
		if liveStreamData ~= nil and liveStreamData.identityVerified == true then
			identityVerified = true
		end
	else
		identityVerified = true
	end
	if not Engine.WebM_camera_IsAvailable() or not Engine.IsLivestreamEnabled() or not identityVerified then
		if self.buttonList.visionCamera.disabled == nil then
			self.buttonList.visionCamera:disable()
		end
	elseif self.buttonList.visionCamera.disabled then
		self.buttonList.visionCamera:enable()
	end
	local cameraButtonHintText = self.buttonList.visionCamera.hintText
	if not Engine.WebM_camera_IsAvailable() then
		self.buttonList.visionCamera.hintText = Engine.Localize( "PLATFORM_TOGGLE_CAMERA_NOT_ATTACHED" )
	elseif not Engine.IsLivestreamEnabled() then
		self.buttonList.visionCamera.hintText = Engine.Localize( "PLATFORM_TOGGLE_CAMERA_LIVE_STREAM_NOT_ENABLED" )
	elseif not identityVerified then
		self.buttonList.visionCamera.hintText = Engine.Localize( "PLATFORM_TOGGLE_CAMERA_SMS_VERIFICATION_FAILED", Engine.DvarString( nil, "YouTube_verifyUrl" ) )
	else
		self.buttonList.visionCamera.hintText = Engine.Localize( "PLATFORM_TOGGLE_CAMERA_DESC" )
	end
	if self.buttonList.visionCamera:isInFocus() and cameraButtonHintText ~= self.buttonList.visionCamera.hintText then
		self.buttonList:updateHintText( self.buttonList.visionCamera )
	end
end

function LiveStream_UpdateCameraStateBasedOnStreaming( self, modifyButtonState )
	if not Engine.IsLivestreamEnabled() then
		if Engine.WebM_camera_IsEnabled() then
			Engine.WebM_camera_Disable()
			self.updateOccludedMenu = true
		end
	elseif not Engine.WebM_camera_IsAvailable() and Engine.WebM_camera_IsEnabled() then
		Engine.WebM_camera_Disable()
		self.updateOccludedMenu = true
	end
	if modifyButtonState then
		LiveStream_UpdateCameraButtonState( self )
	end
end

function LiveStream_UpdateButtonsBasedOnStreaming( self )
	local controller = self:getOwner()
	if Engine.IsLivestreamEnabled() and Dvar.webm_encStreamEnabled:get() and CoD.LiveStream.GetLiveStreamUrl( controller, true ) then
		local url = CoD.LiveStream.GetLiveStreamUrl( controller, true )
		if self.buttonList.sendToFacebook ~= nil and url ~= nil and self.buttonList.sendToFacebook.disabled then
			self.buttonList.sendToFacebook:enable()
		end
		if self.buttonList.sendToTwitter ~= nil and url ~= nil and self.buttonList.sendToTwitter.disabled then
			self.buttonList.sendToTwitter:enable()
		end
	else
		if self.buttonList.sendToFacebook ~= nil and self.buttonList.sendToFacebook.disabled == nil then
			self.buttonList.sendToFacebook:disable()
		end
		if self.buttonList.sendToTwitter ~= nil and self.buttonList.sendToTwitter.disabled == nil then
			self.buttonList.sendToTwitter:disable()
		end
	end
end

local LiveStream_UpdateStreamData = function ( self )
	local controller = self:getOwner()
	local parent = self:getParent()
	if self.skipUpdates then
		return 
	elseif Dvar.webm_httpAuthMode:get() == "twitch" then
		if Engine.IsLivestreamEnabled() and parent ~= nil then
			if Dvar.webm_encStreamEnabled:get() then
				local url = CoD.LiveStream.GetLiveStreamUrl( controller, true )
				if url ~= nil then
					self.liveStreamUrl:setText( Engine.Localize( "MENU_LIVESTREAM_URL", url ) )
				else
					self.liveStreamUrl:setText( "" )
				end
				self.liveStreamUrl:setTopBottom( true, false, self.miscStatusText.y, self.miscStatusText.y + CoD.textSize.Default )
				self.miscStatusText:setText( "" )
			elseif not self.errorOpen then
				self:openPopup( "LiveStream_Error", controller )
				self.errorOpen = true
				if Dvar.webm_twitchLasterror:get() == 401 then
					self.sessionExpired = true
				end
			end
		else
			self.liveStreamUrl:setText( "" )
			self.miscStatusText:setText( "" )
		end
	elseif Dvar.webm_httpAuthMode:get() == "youtube" then
		local liveStreamData = LiveStream_GetYouTube( controller )
		if Engine.IsLivestreamEnabled() and liveStreamData ~= nil and parent ~= nil then
			if liveStreamData.error and self.errorOpen == nil then
				self:openPopup( "LiveStream_Error", controller )
				self.errorOpen = true
			else
				local minViewersTextActive = nil
				local statusTextR, statusTextG, statusTextB, statusTextA = CoD.LiveStream.GetStatusColor( controller, liveStreamData.viewers )
				if liveStreamData.viewers < Dvar.YouTube_minViewersToStartStream:get() then
					self.miscStatusText:setText( Engine.Localize( "MENU_LIVESTREAM_MIN_VIEWERS_NEEDED", Dvar.YouTube_minViewersToStartStream:get() ) )
					minViewersTextActive = true
				else
					self.miscStatusText:setText( "" )
					minViewersTextActive = false
				end
				self.miscStatusText:setRGB( statusTextR, statusTextG, statusTextB )
				self.miscStatusText:setAlpha( statusTextA )
				local url = CoD.LiveStream.GetLiveStreamUrl( controller, true )
				if url ~= nil then
					self.liveStreamUrl:setText( Engine.Localize( "MENU_LIVESTREAM_URL", url ) )
				else
					self.liveStreamUrl:setText( "" )
				end
				if minViewersTextActive then
					self.liveStreamUrl:setTopBottom( true, false, self.liveStreamUrl.y, self.liveStreamUrl.y + CoD.textSize.Default )
				else
					self.liveStreamUrl:setTopBottom( true, false, self.miscStatusText.y, self.miscStatusText.y + CoD.textSize.Default )
				end
			end
		else
			self.liveStreamUrl:setText( "" )
			self.miscStatusText:setText( "" )
		end
	end
end

local LiveStream_Update = function ( self, event )
	local controller = self:getOwner()
	CoD.LiveStream.UpdateViewersIcon( self.viewersWidget.viewersCountIcon, controller, CoD.LiveStream.GetViewerCount( controller ) )
	CoD.LiveStream.UpdateViewersText( self.viewersWidget.viewersCountText, controller, CoD.LiveStream.GetViewerCount( controller ) )
	if self.updateOccludedMenu and self.occludedMenu ~= nil then
		self.occludedMenu:processEvent( {
			name = "update_livestream_camera"
		} )
		self.updateOccludedMenu = nil
	end
	LiveStream_UpdateStreamData( self )
	LiveStream_UpdateCameraButtonState( self )
	LiveStream_UpdateButtonsBasedOnStreaming( self )
end

local LiveStream_UpdateState = function ( self, event )
	local controller = event.controller
	if event.disabled == true then
		self.buttonList.liveStreaming:setChoice( 0 )
		if Engine.DvarBool( nil, "webm_encAllowCamera" ) then
			self.buttonList.visionCamera:setChoice( 0 )
		end
		if self.sessionExpired and Dvar.webm_httpAuthMode:get() == "twitch" then
			self.sessionExpired = nil
			self:goBack( controller )
			Engine.Exec( controller, "twitchUnregister" )
			self.occludedMenu:openPopup( "Twitch_Connect", controller )
		end
	end
	LiveStream_UpdateCameraStateBasedOnStreaming( self, true )
	LiveStream_UpdateButtonsBasedOnStreaming( self )
end

local LiveStream_SendToFacebook = function ( self, event )
	local controller = event.controller
	if Engine.IsFacebookLinked( controller ) then
		if CoD.LiveStream.GetLiveStreamUrl( controller, false ) then
			Engine.FacebookPost( event.controller, "message", Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_MESSAGE", CoD.LiveStream.GetLiveStreamUrl( controller, false ) ), "link", CoD.LiveStream.GetLiveStreamUrl( controller, false ), "picture", Dvar.YouTube_slateImageUrl:get(), "name", Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_LINK_TITLE" ), "caption", Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_LINK_CAPTION" ), "description", Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_LINK_DESC" ) )
			self:openPopup( "LiveStream_Facebook_Post_Success", controller )
		end
	else
		self:openPopup( "LiveStream_Facebook_Link_Account", controller )
	end
end

local LiveStream_SendToTwitter = function ( self, event )
	local controller = event.controller
	if Engine.IsTwitterAccountRegistered( controller ) then
		if CoD.LiveStream.GetLiveStreamUrl( controller, true ) then
			self:openPopup( "LiveStream_Twitter_Post", controller )
		end
	else
		self:openPopup( "LiveStream_Twitter_Link_Account", controller )
	end
end

LUI.createMenu.LiveStream = function ( controller, userData )
	CoD.LiveStream.PerformBanChecks = false
	local self = CoD.Menu.New( "LiveStream" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self.errorOpen = nil
	self:addTitle( Engine.Localize( "MENU_LIVESTREAMING_CAPS" ) )
	self:addSelectButton()
	self:addBackButton()
	self:registerEventHandler( "livestream_update", LiveStream_Update )
	self:registerEventHandler( "livestream_update_state", LiveStream_UpdateState )
	self:registerEventHandler( "livestream_send_to_facebook", LiveStream_SendToFacebook )
	self:registerEventHandler( "livestream_send_to_twitter", LiveStream_SendToTwitter )
	if CoD.isMultiplayer and not CoD.isZombie then
		local miniIdentity = CoD.MiniIdentity.GetMiniIdentity( controller )
		self:addElement( miniIdentity )
	end
	self.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0 + CoD.ButtonList.DefaultWidth - 20,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight + CoD.CoD9Button.Height,
		bottom = CoD.Menu.TitleHeight + 720
	} )
	self:addElement( self.buttonList )
	if (not (userData == nil or not userData.isHost) or Dvar.r_stereo3DOn:get() or not Engine.CanLivestream() or not Dvar.hiDef:get()) and Engine.IsLivestreamEnabled() then
		Engine.LivestreamDisableAsync()
	end
	local liveStreamEnabled = nil
	if Engine.IsLivestreamEnabled() then
		liveStreamEnabled = 1
	else
		liveStreamEnabled = 0
	end
	local liveStreaming = self.buttonList:addLeftRightSelector( Engine.Localize( "MENU_LIVESTREAMING_CAPS" ), liveStreamEnabled )
	liveStreaming.hintText = Engine.Localize( "MENU_TOGGLE_LIVESTREAM_DESC" )
	local f20_local0 = {}
	local f20_local1 = Engine.Localize( "MENU_OFF_CAPS" )
	local f20_local2 = Engine.Localize( "MENU_ON_CAPS" )
	liveStreaming.strings = f20_local1
	liveStreaming.values = {
		0,
		1
	}
	liveStreaming.active = false
	for index = 1, #liveStreaming.strings, 1 do
		liveStreaming:addChoice( Engine.Localize( liveStreaming.strings[index] ), LiveStream_ToggleStream, {
			value = liveStreaming.values[index],
			controller = controller,
			parentButton = liveStreaming,
			parentMenu = self
		} )
	end
	liveStreaming.active = true
	self.buttonList.liveStreaming = liveStreaming
	if userData ~= nil and userData.isHost then
		self.buttonList.liveStreaming:disable()
		self.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_HOST" )
	elseif Dvar.r_stereo3DOn:get() or Dvar.r_dualPlayEnable:get() then
		self.buttonList.liveStreaming:disable()
		self.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_3D" )
	elseif not Dvar.hiDef:get() then
		self.buttonList.liveStreaming:disable()
		self.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_SD" )
	else
		local index = Engine.GetPrimaryController()
		if index.GetUsedControllerCount() > 1 then
			self.buttonList.liveStreaming:disable()
			self.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_MORE_THAN_ONE_LOCAL_PLAYER" )
		elseif not Engine.CanLivestream() then
			local bandwidth = Dvar.webm_lq_bandwidth:get() / 1000000
			local bandwidthString = string.format( "%.1f", bandwidth )
			self.buttonList.liveStreaming:disable()
			self.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_UPLOAD_BANDWIDTH", bandwidthString )
		end
	end
	LiveStream_UpdateCameraStateBasedOnStreaming( self, false )
	if Engine.DvarBool( nil, "webm_encAllowCamera" ) then
		local visionCameraEnabled = nil
		if Engine.WebM_camera_IsEnabled() then
			visionCameraEnabled = 1
		else
			visionCameraEnabled = 0
		end
		local visionCamera = self.buttonList:addLeftRightSelector( Engine.Localize( "PLATFORM_TOGGLE_CAMERA_CAPS" ), visionCameraEnabled )
		f20_local2 = {}
		local f20_local3 = Engine.Localize( "MENU_OFF_CAPS" )
		local f20_local4 = Engine.Localize( "MENU_ON_CAPS" )
		visionCamera.strings = f20_local3
		visionCamera.values = {
			0,
			1
		}
		visionCamera.active = false
		for index = 1, #visionCamera.strings, 1 do
			visionCamera:addChoice( Engine.Localize( visionCamera.strings[index] ), LiveStream_ToggleCamera, {
				value = visionCamera.values[index],
				controller = controller,
				parentButton = visionCamera,
				parentMenu = self
			} )
		end
		visionCamera.active = true
		self.buttonList.visionCamera = visionCamera
		LiveStream_UpdateCameraStateBasedOnStreaming( self, true )
	end
	self.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	if CoD.LiveStream.CanPostOnFacebook() then
		local sendToFacebook = self.buttonList:addButton( Engine.Localize( "MENU_LIVESTREAM_SEND_TO_FACEBOOK" ) )
		sendToFacebook.hintText = Engine.Localize( "MENU_LIVESTREAM_SEND_TO_FACEBOOK_DESC" )
		sendToFacebook:setActionEventName( "livestream_send_to_facebook" )
		self.buttonList.sendToFacebook = sendToFacebook
	end
	if CoD.LiveStream.CanPostOnTwitter() then
		local sendToTwitter = self.buttonList:addButton( Engine.Localize( "MENU_LIVESTREAM_SEND_TO_TWITTER" ) )
		sendToTwitter.hintText = Engine.Localize( "MENU_LIVESTREAM_SEND_TO_TWITTER_DESC" )
		sendToTwitter:setActionEventName( "livestream_send_to_twitter" )
		self.buttonList.sendToTwitter = sendToTwitter
	end
	LiveStream_UpdateButtonsBasedOnStreaming( self )
	self.buttonList:processEvent( {
		name = "gain_focus"
	} )
	local viewersInformationTop = 120
	local viewersInformationWidgetWidth = 400
	local viewersInformationWidgetHeight = 120
	local viewersInformationWidget = LUI.UIElement.new()
	viewersInformationWidget:setLeftRight( false, true, -viewersInformationWidgetWidth, 0 )
	viewersInformationWidget:setTopBottom( true, false, viewersInformationTop, viewersInformationTop + viewersInformationWidgetHeight )
	viewersInformationWidget:setAlignment( LUI.Alignment.Left )
	self:addElement( viewersInformationWidget )
	local viewersInformationContainerTop = LUI.UIElement.new()
	viewersInformationContainerTop:setLeftRight( true, true, 0, 0 )
	viewersInformationContainerTop:setTopBottom( true, false, 0, viewersInformationWidgetHeight - 20 )
	viewersInformationWidget:addElement( viewersInformationContainerTop )
	local viewersInformationContainerTopBg = CoD.GetInformationContainer()
	viewersInformationContainerTop:addElement( viewersInformationContainerTopBg )
	if Dvar.webm_httpAuthMode:get() == "youtube" then
		local youtubeLogo = LUI.UIImage.new()
		youtubeLogo:setLeftRight( false, true, -125, -5 )
		youtubeLogo:setTopBottom( true, false, 0, 50 )
		youtubeLogo:setImage( RegisterMaterial( "youtube_logo" ) )
		viewersInformationContainerTop:addElement( youtubeLogo )
	elseif Dvar.webm_httpAuthMode:get() == "twitch" then
		local twitchLogo = LUI.UIImage.new()
		twitchLogo:setLeftRight( false, true, -125, -5 )
		twitchLogo:setTopBottom( true, false, 0, 50 )
		twitchLogo:setImage( RegisterMaterial( "twitch_logo" ) )
		viewersInformationContainerTop:addElement( twitchLogo )
	end
	local liveStatusTextXOffset = 10
	local liveStatusTextYOffset = 5
	local statusWidget = CoD.LiveStream.GetStatusWidget( controller, LUI.Alignment.Left )
	statusWidget:setLeftRight( true, true, liveStatusTextXOffset, 0 )
	statusWidget:setTopBottom( true, false, liveStatusTextYOffset, liveStatusTextYOffset + CoD.textSize.Default )
	viewersInformationContainerTop:addElement( statusWidget )
	
	local viewersWidget = CoD.LiveStream.GetViewersWidget( RegisterMaterial( "menu_livestream_icon_none" ), 32, 64, LUI.Alignment.Center, CoD.fonts.Big, CoD.textSize.Big )
	viewersInformationContainerTop:addElement( viewersWidget )
	self.viewersWidget = viewersWidget
	
	CoD.LiveStream.UpdateViewersIcon( self.viewersWidget.viewersCountIcon, controller, CoD.LiveStream.GetViewerCount( controller ) )
	CoD.LiveStream.UpdateViewersText( self.viewersWidget.viewersCountText, controller, CoD.LiveStream.GetViewerCount( controller ) )
	local viewersInformationContainerBottom = LUI.UIElement.new()
	viewersInformationContainerBottom:setLeftRight( true, true, 0, 0 )
	viewersInformationContainerBottom:setTopBottom( true, false, 98, 98 + CoD.textSize.Default + 4 )
	viewersInformationWidget:addElement( viewersInformationContainerBottom )
	local viewersInformationContainerBottomBg = CoD.GetInformationContainer()
	viewersInformationContainerBottom:addElement( viewersInformationContainerBottomBg )
	local viewersText = Engine.Localize( "MENU_VIEWERS" )
	local f20_local5 = {}
	local viewersTextDimensions = GetTextDimensions( viewersText, CoD.fonts.Default, CoD.textSize.Default )
	local viewersTextWidth = viewersTextDimensions[3]
	local viewersTextElement = LUI.UIText.new()
	viewersTextElement:setLeftRight( false, false, -viewersTextWidth / 2, viewersTextWidth / 2 )
	viewersTextElement:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	viewersTextElement:setFont( CoD.fonts.Default )
	viewersTextElement:setText( viewersText )
	viewersInformationContainerBottom:addElement( viewersTextElement )
	local elementY = viewersInformationTop + viewersInformationWidgetHeight + 10
	self.miscStatusText = LUI.UITightText.new()
	self.miscStatusText:setLeftRight( false, true, -viewersInformationWidgetWidth, 0 )
	self.miscStatusText:setTopBottom( true, false, elementY, elementY + CoD.textSize.Default )
	self.miscStatusText:setAlignment( LUI.Alignment.Left )
	self.miscStatusText:setFont( CoD.fonts.Default )
	self.miscStatusText.y = elementY
	self:addElement( self.miscStatusText )
	elementY = elementY + 80
	self.liveStreamUrl = LUI.UITightText.new()
	self.liveStreamUrl:setLeftRight( false, true, -viewersInformationWidgetWidth, 0 )
	self.liveStreamUrl:setTopBottom( true, false, elementY, elementY + CoD.textSize.Default )
	self.liveStreamUrl:setAlignment( LUI.Alignment.Left )
	self.liveStreamUrl:setFont( CoD.fonts.Default )
	self.liveStreamUrl.y = elementY
	self:addElement( self.liveStreamUrl )
	local liveStreamNetworkStatusWidgetWidth = 860
	local liveStreamNetworkStatusWidgetHeight = 120
	local usersWaitingToStreamCount = Engine.GetPlayerGroupCountInt( "streaming/0" ) * Dvar.webm_usersWaitingToStream:get()
	local usersStreamingCount = Engine.GetPlayerGroupCountInt( "streaming/1" ) * Dvar.webm_usersStreaming:get()
	local highActivityThresholdCount = Dvar.webm_highActivityThreshold:get()
	local networkStatus = "normal"
	if highActivityThresholdCount < usersWaitingToStreamCount + usersStreamingCount then
		networkStatus = "high"
	end
	local networkColorR, networkColorG, networkColorB, networkStatusText, networkStatusDescriptionText = nil
	if networkStatus == "normal" then
		networkStatusText = Engine.Localize( "MENU_LIVESTREAM_USAGE_NORMAL" )
		networkStatusDescriptionText = Engine.Localize( "MENU_LIVESTREAM_NETWORK_STATUS_DESCRIPTION_NORMAL" )
		networkColorR = 0.21
		networkColorG = 0.7
		networkColorB = 0.7
	else
		networkStatusText = Engine.Localize( "MENU_LIVESTREAM_USAGE_HIGH" )
		networkStatusDescriptionText = Engine.Localize( "MENU_LIVESTREAM_NETWORK_STATUS_DESCRIPTION_HIGH" )
		networkColorR = 0.62
		networkColorG = 0.06
		networkColorB = 0.06
	end
	local statusTitle = LUI.UIText.new()
	statusTitle:setLeftRight( false, false, -liveStreamNetworkStatusWidgetWidth / 2, -liveStreamNetworkStatusWidgetWidth / 2 + 500 )
	statusTitle:setTopBottom( false, true, -liveStreamNetworkStatusWidgetHeight - 80 - CoD.textSize.Default, -liveStreamNetworkStatusWidgetHeight - 80 )
	statusTitle:setAlignment( LUI.Alignment.Left )
	statusTitle:setFont( CoD.fonts.Default )
	statusTitle:setText( Engine.Localize( "MENU_LIVESTREAM_NETWORK_STATUS" ) )
	self:addElement( statusTitle )
	local liveStreamNetworkStatusWidget = LUI.UIElement.new()
	liveStreamNetworkStatusWidget:setLeftRight( false, false, -liveStreamNetworkStatusWidgetWidth / 2, liveStreamNetworkStatusWidgetWidth / 2 )
	liveStreamNetworkStatusWidget:setTopBottom( false, true, -liveStreamNetworkStatusWidgetHeight - 70, -70 )
	liveStreamNetworkStatusWidget:setAlignment( LUI.Alignment.Left )
	self:addElement( liveStreamNetworkStatusWidget )
	local liveStreamNetworkStatusContainerLeft = LUI.UIElement.new()
	liveStreamNetworkStatusContainerLeft:setLeftRight( true, false, 0, 120 )
	liveStreamNetworkStatusContainerLeft:setTopBottom( true, true, 0, 0 )
	liveStreamNetworkStatusWidget:addElement( liveStreamNetworkStatusContainerLeft )
	local liveStreamNetworkStatusContainerLeftBg = CoD.GetInformationContainer()
	liveStreamNetworkStatusContainerLeft:addElement( liveStreamNetworkStatusContainerLeftBg )
	local liveStreamNetworkStatusTowerWidth = 48
	local liveStreamNetworkStatusTowerHeight = 108
	local liveStreamNetworkStatusTower = LUI.UIImage.new()
	liveStreamNetworkStatusTower:setLeftRight( false, false, -liveStreamNetworkStatusTowerWidth / 2, liveStreamNetworkStatusTowerWidth / 2 )
	liveStreamNetworkStatusTower:setTopBottom( false, true, -liveStreamNetworkStatusTowerHeight - 16, -16 )
	liveStreamNetworkStatusTower:setImage( RegisterMaterial( "menu_livestream_tower" ) )
	liveStreamNetworkStatusContainerLeft:addElement( liveStreamNetworkStatusTower )
	local liveStreamNetworkStatusSignalWidth = 64
	local liveStreamNetworkStatusSignalHeight = 32
	local liveStreamNetworkStatusSignal = LUI.UIImage.new()
	liveStreamNetworkStatusSignal:setLeftRight( false, false, -liveStreamNetworkStatusSignalWidth / 2, liveStreamNetworkStatusSignalWidth / 2 )
	liveStreamNetworkStatusSignal:setTopBottom( true, false, 20, 20 + liveStreamNetworkStatusSignalHeight )
	liveStreamNetworkStatusSignal:setImage( RegisterMaterial( "menu_livestream_signal" ) )
	liveStreamNetworkStatusSignal:setRGB( networkColorR, networkColorG, networkColorB )
	liveStreamNetworkStatusContainerLeft:addElement( liveStreamNetworkStatusSignal )
	local liveStreamNetworkStatusContainerRight = LUI.UIElement.new()
	liveStreamNetworkStatusContainerRight:setLeftRight( true, true, 118, 0 )
	liveStreamNetworkStatusContainerRight:setTopBottom( true, true, 0, 0 )
	liveStreamNetworkStatusWidget:addElement( liveStreamNetworkStatusContainerRight )
	local liveStreamNetworkStatusContainerRightBg = CoD.GetInformationContainer()
	liveStreamNetworkStatusContainerRight:addElement( liveStreamNetworkStatusContainerRightBg )
	local f20_local6 = {}
	local networkStatusTextDimensions = GetTextDimensions( networkStatusText, CoD.fonts.Default, CoD.textSize.Default )
	local networkStatusTextWidth = networkStatusTextDimensions[3]
	local networkStatusTextPaddingX = 10
	local networkStatusTextPaddingY = 4
	local networkStatusTextContainer = LUI.UIElement.new()
	networkStatusTextContainer:setLeftRight( true, false, 15, 15 + networkStatusTextWidth + networkStatusTextPaddingX )
	networkStatusTextContainer:setTopBottom( true, false, 15, 15 + networkStatusTextPaddingY + CoD.textSize.Default )
	liveStreamNetworkStatusContainerRight:addElement( networkStatusTextContainer )
	local netowrkStatusTextBg = CoD.GetInformationContainer()
	netowrkStatusTextBg.infoContainerBackground:setRGB( networkColorR, networkColorG, networkColorB )
	netowrkStatusTextBg.border:setAlpha( 0 )
	networkStatusTextContainer:addElement( netowrkStatusTextBg )
	local networkStatusTextElement = LUI.UIText.new()
	networkStatusTextElement:setLeftRight( false, false, -networkStatusTextWidth / 2, networkStatusTextWidth / 2 )
	networkStatusTextElement:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	networkStatusTextElement:setFont( CoD.fonts.Default )
	networkStatusTextElement:setText( networkStatusText )
	networkStatusTextContainer:addElement( networkStatusTextElement )
	local networkStatusDescription = LUI.UIText.new()
	networkStatusDescription:setLeftRight( true, true, 15, -15 )
	networkStatusDescription:setTopBottom( true, false, 60, 60 + CoD.textSize.Default )
	networkStatusDescription:setAlignment( LUI.Alignment.Left )
	networkStatusDescription:setFont( CoD.fonts.Default )
	networkStatusDescription:setText( networkStatusDescriptionText )
	liveStreamNetworkStatusContainerRight:addElement( networkStatusDescription )
	self.pollTimer = LUI.UITimer.new( 1000, {
		name = "livestream_update",
		controller = controller
	} )
	self:addElement( self.pollTimer )
	LiveStream_Update( self, {
		controller = controller
	} )
	CoD.LiveStream.PerformBanChecks = true
	return self
end

CoD.LiveStream.GetViewerCount = function ( controller )
	local viewersCount = 0
	if Engine.IsLivestreamEnabled() then
		if Dvar.webm_httpAuthMode:get() == "twitch" then
			local liveStreamData = Engine.Twitch_Get( controller )
			if liveStreamData ~= nil then
				viewersCount = liveStreamData.viewers
			end
		elseif Dvar.webm_httpAuthMode:get() == "youtube" then
			local liveStreamData = LiveStream_GetYouTube( controller )
			if liveStreamData ~= nil then
				viewersCount = liveStreamData.viewers
			end
		end
	end
	return viewersCount
end

CoD.LiveStream.GetLiveStreamLifeCycleState = function ( controller )
	local streamLifeCycleState = ""
	if Dvar.webm_httpAuthMode:get() == "twitch" then
		local liveStreamData = Engine.Twitch_Get( controller )
		if Engine.IsLivestreamEnabled() then
			if Dvar.webm_encStreamEnabled:get() then
				if liveStreamData.connecting then
					streamLifeCycleState = "connecting"
				elseif liveStreamData.buffering then
					streamLifeCycleState = "buffering"
				else
					streamLifeCycleState = "live"
				end
			else
				streamLifeCycleState = "stopped"
			end
		end
	elseif Dvar.webm_httpAuthMode:get() == "youtube" then
		local liveStreamData = LiveStream_GetYouTube( controller )
		if Engine.IsLivestreamEnabled() and liveStreamData ~= nil then
			streamLifeCycleState = liveStreamData.streamLifeCycleState
		end
	end
	return streamLifeCycleState
end

CoD.LiveStream.GetLiveStreamUrl = function ( controller, modifyTextForReadability )
	local url = nil
	if Dvar.webm_httpAuthMode:get() == "twitch" then
		if Engine.IsLivestreamEnabled() then
			local userInfo = Engine.GetTwitchAccountInfo( controller )
			url = "http://www.twitch.tv/" .. string.lower( userInfo.userName )
		end
	elseif Dvar.webm_httpAuthMode:get() == "youtube" then
		local liveStreamData = LiveStream_GetYouTube( controller )
		if Engine.IsLivestreamEnabled() and liveStreamData ~= nil then
			url = liveStreamData.url
			if modifyTextForReadability then
				url = CoD.ModifyTextForReadability( url )
			end
		end
	end
	return url
end

CoD.LiveStream.IsStreaming = function ( controller )
	local result = false
	if Dvar.webm_httpAuthMode:get() == "youtube" then
		local liveStreamData = LiveStream_GetYouTube( controller )
		if Engine.IsLivestreamEnabled() and liveStreamData ~= nil then
			result = liveStreamData.streamIsRunning
		end
	elseif Dvar.webm_httpAuthMode:get() == "twitch" and Engine.IsLivestreamEnabled() then
		result = Dvar.webm_encStreamEnabled:get()
	end
	return result
end

CoD.LiveStream.GetStatusColor = function ( controller, viewerCount )
	local colorR = 1
	local colorG = 1
	local colorB = 1
	local colorA = 1
	if Engine.IsLivestreamEnabled() then
		if Dvar.webm_httpAuthMode:get() == "twitch" then
			if not Dvar.webm_encStreamEnabled:get() then
				colorR = CoD.red.r
				colorG = CoD.red.g
				colorB = CoD.red.b
			elseif CoD.LiveStream.GetLiveStreamLifeCycleState( controller ) == "buffering" then
				colorR = CoD.BOIIOrange.r
				colorG = CoD.BOIIOrange.g
				colorB = CoD.BOIIOrange.b
			elseif CoD.LiveStream.GetLiveStreamLifeCycleState( controller ) == "connecting" then
				colorR = CoD.yellowGlow.r
				colorG = CoD.yellowGlow.g
				colorB = CoD.yellowGlow.b
			else
				colorR = CoD.brightGreen.r
				colorG = CoD.brightGreen.g
				colorB = CoD.brightGreen.b
			end
		elseif Dvar.webm_httpAuthMode:get() == "youtube" then
			if CoD.LiveStream.IsStreaming( controller ) and (viewerCount == nil or viewerCount >= Dvar.YouTube_minViewersToStartStream:get()) then
				colorR = CoD.brightGreen.r
				colorG = CoD.brightGreen.g
				colorB = CoD.brightGreen.b
			elseif not Dvar.webm_encStreamEnabled:get() then
				colorR = CoD.red.r
				colorG = CoD.red.g
				colorB = CoD.red.b
			else
				colorR = CoD.BOIIOrange.r
				colorG = CoD.BOIIOrange.g
				colorB = CoD.BOIIOrange.b
			end
		end
	end
	return colorR, colorG, colorB, colorA
end

CoD.LiveStream.UpdateViewersIcon = function ( self, controller, viewersCount )
	local viewersR, viewersG, viewersB, viewersA = CoD.LiveStream.GetStatusColor( controller, viewersCount )
	self:setRGB( viewersR, viewersG, viewersB )
	self:setAlpha( viewersA )
end

CoD.LiveStream.UpdateViewersText = function ( self, controller, viewersCount )
	local viewersCountText = viewersCount
	local f27_local0 = {}
	local viewersCountTextDimensions = GetTextDimensions( viewersCountText, self.font, self.fontSize )
	local viewersCountTextWidth = viewersCountTextDimensions[3]
	local viewersR, viewersG, viewersB, viewersA = CoD.LiveStream.GetStatusColor( controller, viewersCount )
	self:setRGB( viewersR, viewersG, viewersB )
	self:setAlpha( viewersA )
	self:setLeftRight( true, false, 10, 10 + viewersCountTextWidth )
	self:setText( viewersCountText )
end

CoD.LiveStream.GetViewersIcon = function ( icon, iconWidth, iconHeight )
	local viewersCountIcon = LUI.UIImage.new()
	viewersCountIcon:setLeftRight( true, false, 0, iconWidth )
	viewersCountIcon:setTopBottom( false, true, -iconHeight, 0 )
	if icon ~= nil then
		viewersCountIcon:setImage( icon )
	end
	return viewersCountIcon
end

CoD.LiveStream.GetViewersText = function ( font, fontSize )
	local viewersCountText = LUI.UITightText.new()
	viewersCountText.font = font
	viewersCountText.fontSize = fontSize
	viewersCountText:setTopBottom( false, false, -fontSize / 2, fontSize / 2 )
	return viewersCountText
end

CoD.LiveStream.GetViewersWidget = function ( icon, iconWidth, iconHeight, alignment, font, fontSize )
	local viewersWidget = LUI.UIHorizontalList.new()
	viewersWidget:setLeftRight( true, true, 0, 0 )
	viewersWidget:setTopBottom( false, false, -fontSize / 2, fontSize / 2 )
	viewersWidget:setSpacing( 5 )
	viewersWidget:setAlignment( alignment )
	viewersWidget.font = font
	viewersWidget.fontSize = fontSize
	
	local viewersCountIcon = CoD.LiveStream.GetViewersIcon( icon, iconWidth, iconHeight )
	viewersWidget:addElement( viewersCountIcon )
	viewersWidget.viewersCountIcon = viewersCountIcon
	
	local viewersCountText = CoD.LiveStream.GetViewersText( font, fontSize )
	viewersWidget:addElement( viewersCountText )
	viewersWidget.viewersCountText = viewersCountText
	
	return viewersWidget
end

local LiveStreamStatusWidget_Update = function ( self, event )
	local controller = self.controller
	if self.hideWhenLiveStreamDisabled and not Engine.IsLivestreamEnabled() then
		self:setAlpha( 0 )
	else
		self:setAlpha( 1 )
	end
	local liveStatusText = Engine.Localize( "MENU_OFF_CAPS" )
	local liveStreamTextR, liveStreamTextG, liveStreamTextB, liveStreamTextA = CoD.LiveStream.GetStatusColor( controller )
	local liveStatusIcon = RegisterMaterial( "menu_livestream_hollow_circle" )
	if Engine.IsLivestreamEnabled() then
		if CoD.LiveStream.IsStreaming( controller ) then
			if CoD.LiveStream.GetLiveStreamLifeCycleState( controller ) == "live" then
				liveStatusText = Engine.Localize( "MENU_LIVE_CAPS" )
			elseif CoD.LiveStream.GetLiveStreamLifeCycleState( controller ) == "buffering" then
				liveStatusText = Engine.Localize( "MENU_BUFFERING_CAPS" )
			elseif CoD.LiveStream.GetLiveStreamLifeCycleState( controller ) == "connecting" then
				liveStatusText = Engine.Localize( "MENU_CONNECTING_CAPS" )
			else
				liveStatusText = Engine.Localize( "MENU_INITIALIZING_CAPS" )
			end
		elseif not Dvar.webm_encStreamEnabled:get() then
			liveStatusText = Engine.Localize( "MENU_STOPPED_CAPS" )
		else
			liveStatusText = Engine.Localize( "MENU_WAITING_CAPS" )
		end
		liveStatusIcon = RegisterMaterial( "menu_livestream_hollow_fill" )
	end
	local f31_local0 = {}
	local liveStatusTextDimensions = GetTextDimensions( liveStatusText, CoD.fonts.Default, CoD.textSize.Default )
	local liveStatusTextWidth = liveStatusTextDimensions[3]
	self.liveStatusTextElement:setText( liveStatusText )
	self.liveStatusTextElement:setLeftRight( true, false, 0, liveStatusTextWidth )
	self.liveStatusTextElement:setRGB( liveStreamTextR, liveStreamTextG, liveStreamTextB )
	self.liveStatusTextElement:setAlpha( liveStreamTextA )
	self.liveStatusIcon:setRGB( liveStreamTextR, liveStreamTextG, liveStreamTextB )
	self.liveStatusIcon:setAlpha( liveStreamTextA )
	self.liveStatusIcon:setImage( liveStatusIcon )
	if self.hasViewerCount then
		CoD.LiveStream.UpdateViewersIcon( self.viewersCountIcon, controller, CoD.LiveStream.GetViewerCount( controller ) )
		CoD.LiveStream.UpdateViewersText( self.viewersCountText, controller, CoD.LiveStream.GetViewerCount( controller ) )
	end
end

local LiveStreamStatusWidget_AddLiveStatusIcon = function ( statusWidget )
	local liveStatusIconSize = CoD.textSize.Default / 2
	
	local liveStatusIcon = LUI.UIImage.new()
	liveStatusIcon:setLeftRight( true, false, 0, liveStatusIconSize )
	liveStatusIcon:setTopBottom( false, false, -liveStatusIconSize / 2, liveStatusIconSize / 2 )
	statusWidget:addElement( liveStatusIcon )
	statusWidget.liveStatusIcon = liveStatusIcon
	
end

local LiveStreamStatusWidget_AddLiveStatusText = function ( statusWidget )
	local liveStatusTextElement = LUI.UITightText.new()
	liveStatusTextElement:setTopBottom( true, false, 0, CoD.textSize.Default )
	statusWidget:addElement( liveStatusTextElement )
	statusWidget.liveStatusTextElement = liveStatusTextElement
	
end

local LiveStreamStatusWidget_AddViewersIcon = function ( statusWidget, controller )
	local viewersCountIcon = CoD.LiveStream.GetViewersIcon( RegisterMaterial( "menu_livestream_icon_live" ), 12, 25 )
	statusWidget:addElement( viewersCountIcon )
	statusWidget.viewersCountIcon = viewersCountIcon
	
	CoD.LiveStream.UpdateViewersIcon( viewersCountIcon, controller, CoD.LiveStream.GetViewerCount( controller ) )
end

local LiveStreamStatusWidget_AddViewersText = function ( statusWidget, controller )
	local viewersCountText = CoD.LiveStream.GetViewersText( CoD.fonts.Default, CoD.textSize.Default )
	statusWidget:addElement( viewersCountText )
	statusWidget.viewersCountText = viewersCountText
	
	CoD.LiveStream.UpdateViewersText( viewersCountText, controller, CoD.LiveStream.GetViewerCount( controller ) )
end

CoD.LiveStream.GetStatusWidget = function ( controller, alignment, addViewerCount, hideWhenLiveStreamDisabled )
	local self = LUI.UIContainer.new()
	local statusWidget = LUI.UIHorizontalList.new()
	statusWidget:setLeftRight( true, true, 0, 0 )
	statusWidget:setTopBottom( true, false, 0, CoD.textSize.Default )
	statusWidget:setSpacing( 5 )
	statusWidget:setAlignment( alignment )
	statusWidget.hasViewerCount = addViewerCount
	statusWidget.hideWhenLiveStreamDisabled = hideWhenLiveStreamDisabled
	statusWidget.controller = controller
	statusWidget:registerEventHandler( "livestream_statuswidget_update", LiveStreamStatusWidget_Update )
	self:addElement( statusWidget )
	if alignment == LUI.Alignment.Right then
		if addViewerCount then
			LiveStreamStatusWidget_AddViewersText( statusWidget, controller )
			LiveStreamStatusWidget_AddViewersIcon( statusWidget, controller )
			statusWidget:addSpacer( 5 )
		end
		LiveStreamStatusWidget_AddLiveStatusText( statusWidget )
		LiveStreamStatusWidget_AddLiveStatusIcon( statusWidget )
	else
		LiveStreamStatusWidget_AddLiveStatusIcon( statusWidget )
		LiveStreamStatusWidget_AddLiveStatusText( statusWidget )
		if addViewerCount then
			statusWidget:addSpacer( 5 )
			LiveStreamStatusWidget_AddViewersIcon( statusWidget, controller )
			LiveStreamStatusWidget_AddViewersText( statusWidget, controller )
		end
	end
	statusWidget.pollTimer = LUI.UITimer.new( 200, {
		name = "livestream_statuswidget_update",
		controller = controller
	} )
	statusWidget:addElement( statusWidget.pollTimer )
	if hideWhenLiveStreamDisabled then
		statusWidget:setAlpha( 0 )
	end
	return self
end

CoD.LiveStream.AddInGameStatusWidget = function ( self, controller, defaultAnimationState )
	if not Engine.IsLivestreamEnabled() or Engine.IsDemoMovieRendering() then
		return 
	end
	local statusWindow = LUI.UIElement.new( defaultAnimationState )
	if Engine.WebM_camera_IsAvailable() and Engine.WebM_camera_IsEnabled() then
		local cameraContainer = LUI.UIContainer.new()
		cameraContainer:setTopBottom( true, true, 0, -25 )
		statusWindow:addElement( cameraContainer )
		local background = CoD.GetInformationContainer()
		cameraContainer:addElement( background )
		local camera = LUI.UIImage.new()
		camera:setLeftRight( true, true, 3, -3 )
		camera:setTopBottom( true, true, 3, -3 )
		camera:setRGB( 1, 1, 1 )
		camera:setAlpha( 1 )
		camera:setImage( RegisterMaterial( "livestream_cam" ) )
		cameraContainer:addElement( camera )
		local liveStreamStatusContainer = LUI.UIContainer.new()
		liveStreamStatusContainer:setTopBottom( false, true, -27, 0 )
		statusWindow:addElement( liveStreamStatusContainer )
		local background = CoD.GetInformationContainer()
		liveStreamStatusContainer:addElement( background )
		local liveStreamStatusWidgetContainer = LUI.UIContainer.new()
		liveStreamStatusWidgetContainer:setLeftRight( true, true, 3, -6 )
		liveStreamStatusContainer:addElement( liveStreamStatusWidgetContainer )
		local liveStreamStatusWidget = CoD.LiveStream.GetStatusWidget( controller, LUI.Alignment.Right, true, true )
		liveStreamStatusWidgetContainer:addElement( liveStreamStatusWidget )
	else
		local liveStreamStatusWidgetContainer = LUI.UIContainer.new()
		liveStreamStatusWidgetContainer:setLeftRight( true, true, 3, -6 )
		statusWindow:addElement( liveStreamStatusWidgetContainer )
		local liveStreamStatusWidget = CoD.LiveStream.GetStatusWidget( controller, LUI.Alignment.Right, true, true )
		liveStreamStatusWidgetContainer:addElement( liveStreamStatusWidget )
	end
	self.safeArea:addElement( statusWindow )
end

local LiveStreamError_Back = function ( self, event )
	self:goBack( event.controller )
	if Engine.WebM_camera_IsEnabled() then
		Engine.WebM_camera_Disable()
	end
	self.occludedMenu:openPopup( "LiveStream_Disable", event.controller )
end

LUI.createMenu.LiveStream_Error = function ( controller )
	local popup = CoD.Popup.SetupPopup( "LiveStream_Error", controller )
	popup:registerEventHandler( "button_prompt_back", LiveStreamError_Back )
	popup.title:setText( Engine.Localize( "MENU_ERROR" ) )
	popup.msg:setText( Engine.Localize( "MENU_LIVESTREAM_ERROR" ) )
	if Dvar.webm_httpAuthMode:get() == "youtube" then
		local liveStreamData = LiveStream_GetYouTube( controller )
		if liveStreamData ~= nil then
			if liveStreamData.errorCode == 403 then
				popup.msg:setText( Engine.Localize( "MENU_LIVESTREAM_YOUTUBE_ERROR_STRIKES" ) )
			elseif liveStreamData.errorCode == 401 then
				popup.msg:setText( Engine.Localize( "MENU_LIVESTREAM_YOUTUBE_ACCOUNT_NOT_FULLY_SETUP" ) )
			elseif liveStreamData.errorCode == 503 then
				popup.msg:setText( Engine.Localize( "MENU_LIVESTREAM_YOUTUBE_SERVICE_UNAVAILABLE" ) )
			end
		end
	elseif Dvar.webm_httpAuthMode:get() == "twitch" then
		if Dvar.webm_twitchLasterror:get() == 503 then
			popup.msg:setText( Engine.Localize( "MENU_LIVESTREAM_TWITCH_OVERLOADED" ) )
		elseif Dvar.webm_twitchLasterror:get() == 401 then
			popup.msg:setText( Engine.Localize( "MENU_LIVESTREAM_TWITCH_SESSION_EXPIRED" ) )
		end
	end
	popup:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	local invisibleBackButton = CoD.ButtonPrompt.new( "secondary", "", popup, "button_prompt_back", true )
	popup:addLeftButtonPrompt( invisibleBackButton )
	return popup
end

local LiveStream_LinkToFacebook = function ( self, event )
	Engine.ExecNow( controller, "fbLinkFacebook" )
end

local LiveStream_LinkToFacebookSuccess = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "livestream_send_to_facebook",
		controller = event.controller
	} )
end

LUI.createMenu.LiveStream_Facebook_Link_Account = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "LiveStream_Facebook_Link_Account", controller )
	popup.title:setText( Engine.Localize( "MENU_FACEBOOK" ) )
	popup.msg:setText( Engine.Localize( "MENU_FACEBOOK_ACCOUNT_LINK_DESC" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_LINK_ACCOUNT" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NOT_NOW" ) )
	popup.choiceA:setActionEventName( "link_facebook" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "link_facebook", LiveStream_LinkToFacebook )
	popup:registerEventHandler( "facebook_register_success", LiveStream_LinkToFacebookSuccess )
	return popup
end

LUI.createMenu.LiveStream_Facebook_Post_Success = function ( controller )
	local popup = CoD.Popup.SetupPopup( "LiveStream_Facebook_Post_Success", controller )
	local message = Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_MESSAGE", CoD.LiveStream.GetLiveStreamUrl( controller, true ) )
	popup.title:setText( Engine.Localize( "MENU_LINK_SENT" ) )
	popup.msg:setText( Engine.Localize( "MENU_LINK_SENT_TO_FACEBOOK_DESC", message ) )
	popup:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	local invisibleBackButton = CoD.ButtonPrompt.new( "secondary", "", popup, "button_prompt_back", true )
	popup:addLeftButtonPrompt( invisibleBackButton )
	return popup
end

local LiveStream_LinkToTwitter = function ( self, event )
	CoD.perController[event.controller].fromLiveStreamMenu = true
	self:openMenu( "Twitter_Connect", event.controller )
	self:close()
	CoD.perController[event.controller].fromLiveStreamMenu = nil
end

LUI.createMenu.LiveStream_Twitter_Link_Account = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "LiveStream_Twitter_Link_Account", controller )
	popup.title:setText( Engine.Localize( "MENU_TWITTER" ) )
	popup.msg:setText( Engine.Localize( "MENU_TWITTER_ACCOUNT_LINK_DESC" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_LINK_ACCOUNT" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NOT_NOW" ) )
	popup.choiceA:setActionEventName( "link_twitter" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "link_twitter", LiveStream_LinkToTwitter )
	return popup
end

local LiveStream_Twitter_Post_Success = function ( self, event )
	local message = Engine.Localize( "MENU_LIVESTREAM_TWITTER_MESSAGE", CoD.LiveStream.GetLiveStreamUrl( event.controller, true ) )
	self.title:setText( Engine.Localize( "MENU_LINK_SENT" ) )
	self.msg:setText( Engine.Localize( "MENU_LINK_SENT_TO_TWITTER_DESC", message ) )
	self.spinner:setAlpha( 0 )
	self:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	local invisibleBackButton = CoD.ButtonPrompt.new( "secondary", "", self, "button_prompt_back", true )
	self:addLeftButtonPrompt( invisibleBackButton )
end

local LiveStream_Twitter_Post_Failure = function ( self, event )
	self.title:setText( Engine.Localize( "MENU_ERROR" ) )
	self.msg:setText( event.errorMessage )
	self.spinner:setAlpha( 0 )
	self:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	local invisibleBackButton = CoD.ButtonPrompt.new( "secondary", "", self, "button_prompt_back", true )
	self:addLeftButtonPrompt( invisibleBackButton )
end

LUI.createMenu.LiveStream_Twitter_Post = function ( controller )
	local popup = CoD.Popup.SetupPopupBusy( "LiveStream_Twitter_Post", controller )
	popup:registerEventHandler( "live_dw_twitter_post_success", LiveStream_Twitter_Post_Success )
	popup:registerEventHandler( "live_dw_twitter_post_failure", LiveStream_Twitter_Post_Failure )
	popup.title:setText( Engine.Localize( "MENU_SENDING_TO_TWITTER" ) )
	Engine.TwitterPost( controller, Engine.Localize( "MENU_LIVESTREAM_TWITTER_MESSAGE", CoD.LiveStream.GetLiveStreamUrl( controller, false ) ) )
	return popup
end

local LiveStreamTOS_Accept = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:openPopup( "LiveStream", event.controller )
end

local LiveStreamTOS_Decline = function ( self, event )
	self:goBack()
end

local LiveStreamTOS_HandleGamepadButton = function ( self, event )
	if LUI.UIElement.handleGamepadButton( self, event ) == true then
		return true
	elseif event.down == true then
		if event.qualifier == nil then
			local scrollSpeed = Engine.GetCustomElementScrollSpeed()
			if event.button == "up" then
				if scrollSpeed < 0 then
					Engine.SetCustomElementScrollSpeed( 0 )
				else
					Engine.SetCustomElementScrollSpeed( scrollSpeed + 1 )
				end
			elseif event.button == "down" then
				if scrollSpeed > 0 then
					Engine.SetCustomElementScrollSpeed( 0 )
				else
					Engine.SetCustomElementScrollSpeed( scrollSpeed - 1 )
				end
			end
			return 
		end
	else
		Engine.SetCustomElementScrollSpeed( 0 )
	end
end

function LiveStreamTOS_AddButtonPrompt( self, buttonPrompt )
	self.buttonPromptList:addElement( buttonPrompt )
end

LUI.createMenu.LiveStreamTOS = function ( controller )
	local newPopup = CoD.Menu.New( "LiveStreamTOS" )
	newPopup:setOwner( controller )
	newPopup:registerEventHandler( "button_select_prompt", LiveStreamTOS_Accept )
	newPopup:registerEventHandler( "button_prompt_back", LiveStreamTOS_Decline )
	newPopup.button = LUI.UIButton.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	newPopup.button.handleGamepadButton = LiveStreamTOS_HandleGamepadButton
	newPopup:addElement( newPopup.button )
	newPopup.button:processEvent( {
		name = "gain_focus"
	} )
	newPopup.buttonRepeaterUp = LUI.UIButtonRepeater.new( "up", "moveup" )
	newPopup:addElement( newPopup.buttonRepeaterUp )
	newPopup.buttonRepeaterDown = LUI.UIButtonRepeater.new( "down", "movedown" )
	newPopup:addElement( newPopup.buttonRepeaterDown )
	newPopup:addLargePopupBackground()
	newPopup.msgTitle = LUI.UIText.new()
	newPopup.msgTitle:setLeftRight( true, true, 0, 0 )
	newPopup.msgTitle:setTopBottom( true, false, 0, 0 + CoD.textSize.Condensed )
	newPopup.msgTitle:setAlignment( LUI.Alignment.Left )
	newPopup.msgTitle:setFont( CoD.fonts.Condensed )
	newPopup.msgTitle:setText( Engine.Localize( "MPUI_TOS_TITLE" ) )
	newPopup:addElement( newPopup.msgTitle )
	newPopup.subTitle = LUI.UIText.new()
	newPopup.subTitle:setLeftRight( true, true, 0, 0 )
	newPopup.subTitle:setTopBottom( true, false, 30, 30 + CoD.textSize.ExtraSmall )
	newPopup.subTitle:setAlignment( LUI.Alignment.Left )
	newPopup.subTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	newPopup.subTitle:setFont( CoD.fonts.ExtraSmall )
	newPopup.subTitle:setText( Engine.Localize( "MENU_LIVESTREAM_TOS_AGREEMENT" ) )
	newPopup:addElement( newPopup.subTitle )
	newPopup:addSelectButton( Engine.Localize( "MPUI_TOS_AGREE" ), nil, "button_select_prompt" )
	newPopup:addBackButton( Engine.Localize( "MPUI_TOS_REFUSE" ) )
	newPopup.creditsContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 60,
		bottom = -90
	} )
	newPopup:addElement( newPopup.creditsContainer )
	newPopup.creditsContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	newPopup.creditsContainer:addElement( newPopup.creditsContainer.border )
	newPopup.creditsContainer.credits = LUI.UIElement.new( {
		left = 0,
		top = 35,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	newPopup.creditsContainer:addElement( newPopup.creditsContainer.credits )
	newPopup.creditsContainer.credits:setupLiveStreamLegal()
	Engine.SetDvar( "ui_scrollSpeed", 0 )
	newPopup.upRepeater = LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} )
	newPopup.downRepeater = LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} )
	newPopup:addElement( newPopup.upRepeater )
	newPopup:addElement( newPopup.downRepeater )
	newPopup.buttonPromptList = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -70,
		bottom = 0,
		spacing = 5,
		alignment = LUI.Alignment.Left
	} )
	newPopup:addElement( newPopup.buttonPromptList )
	newPopup.addButtonPrompt = LiveStreamTOS_AddButtonPrompt
	newPopup.moveImage = CoD.ButtonPrompt.new( "emblem_move", Engine.Localize( "MENU_LB_SCROLL_UP_SCROLL_DOWN" ) )
	newPopup:addButtonPrompt( newPopup.moveImage )
	return newPopup
end

