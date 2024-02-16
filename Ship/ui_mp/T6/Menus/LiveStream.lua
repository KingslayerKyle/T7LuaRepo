-- 28c8557334df18c2364dfb86b7a2dea2
-- This hash is used for caching, delete to decompile the file again

CoD.LiveStream = {}
CoD.LiveStream.PerformBanChecks = false
CoD.LiveStream.CanPostOnFacebook = function ()
	local f1_local0, f1_local1 = Engine.GetSocialCapabilities()
	if Dvar.fbEnabled:get() == true and f1_local0 and f1_local1 then
		return true
	else
		return false
	end
end

CoD.LiveStream.CanPostOnTwitter = function ()
	local f2_local0, f2_local1 = Engine.GetSocialCapabilities()
	if Engine.DvarBool( nil, "twEnabled" ) and f2_local0 then
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

local f0_local0 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.controller
	Dvar.webm_httpAuthMode:set( "youtube" )
	Dvar.webm_httpUploadUrl:set( Dvar.webm_httpUploadUrlYouTube:get() )
	f4_arg0:goBack()
	if not Engine.IsYouTubeAccountChecked( f4_local0 ) or not Engine.IsYouTubeAccountRegistered( f4_local0 ) then
		CoD.perController[f4_local0].activatingLiveStream = true
		f4_arg0.occludedMenu:openPopup( "YouTube_Connect", f4_local0 )
		CoD.perController[f4_local0].activatingLiveStream = nil
	else
		f4_arg0.occludedMenu:openPopup( "LiveStreamTOS", f4_local0 )
	end
end

local f0_local1 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1.controller
	Dvar.webm_httpAuthMode:set( "twitch" )
	Dvar.webm_httpUploadUrl:set( Dvar.webm_httpUploadUrlTwitch:get() )
	f5_arg0:goBack()
	if not Engine.IsTwitchAccountRegistered( f5_local0 ) then
		CoD.perController[f5_local0].activatingLiveStream = true
		f5_arg0.occludedMenu:openPopup( "Twitch_Connect", f5_local0 )
		CoD.perController[f5_local0].activatingLiveStream = nil
	else
		local f5_local1 = Engine.GetTwitchAccountInfo( f5_local0 )
		Dvar.webm_httpAuthToken:set( f5_local1.authToken )
		f5_arg0.occludedMenu:openPopup( "LiveStreamTOS", f5_local0 )
	end
end

LUI.createMenu.LiveStream_ChooseMode = function ( f6_arg0 )
	local f6_local0 = CoD.Popup.SetupPopupChoice( "LiveStream_ChooseMode", f6_arg0 )
	f6_local0.title:setText( Engine.Localize( "MENU_LIVESTREAM_CHOOSE_MODE" ) )
	f6_local0.msg:setText( Engine.Localize( "MENU_LIVESTREAM_CHOOSE_MODE_DESC" ) )
	f6_local0:addBackButton()
	f6_local0.choiceA:setLabel( Engine.Localize( "MENU_YOUTUBE" ) )
	f6_local0.choiceB:setLabel( Engine.Localize( "MENU_TWITCH" ) )
	f6_local0.choiceA:setActionEventName( "livestream_mode_youtube" )
	f6_local0.choiceA:processEvent( {
		name = "gain_focus"
	} )
	f6_local0.choiceB:setActionEventName( "livestream_mode_twitch" )
	if not Engine.IsTwitchAccountChecked( f6_arg0 ) then
		f6_local0.choiceB:disable()
	end
	f6_local0:registerEventHandler( "livestream_mode_youtube", f0_local0 )
	f6_local0:registerEventHandler( "livestream_mode_twitch", f0_local1 )
	return f6_local0
end

local f0_local2 = function ( f7_arg0, f7_arg1 )
	if Engine.WebM_camera_IsEnabled() then
		Engine.WebM_camera_Disable()
	end
	if Dvar.webm_httpAuthMode:get() == "twitch" then
		Dvar.webm_encStreamEnabled:set( false )
	end
	if Engine.LivestreamDisableAsync() then
		f7_arg0.occludedMenu.skipUpdates = nil
		f7_arg0:goBack()
		f7_arg0.occludedMenu:processEvent( {
			name = "livestream_update_state",
			controller = f7_arg0:getOwner(),
			disabled = true
		} )
	end
end

LUI.createMenu.LiveStream_Disable = function ( f8_arg0 )
	local f8_local0 = CoD.Popup.SetupPopupBusy( "LiveStream_Disable" )
	f8_local0:setOwner( f8_arg0 )
	f8_local0.title:setText( Engine.Localize( "MENU_LIVESTREAM_DISABLING" ) )
	f8_local0:registerEventHandler( "check_for_disable_complete", f0_local2 )
	f8_local0.pollTimer = LUI.UITimer.new( 200, {
		name = "check_for_disable_complete",
		controller = f8_arg0
	} )
	f8_local0:addElement( f8_local0.pollTimer )
	return f8_local0
end

local f0_local3 = function ( f9_arg0 )
	return Engine.YouTube_Get( f9_arg0 )
end

local f0_local4 = function ( f10_arg0 )
	if CoD.LiveStream.PerformBanChecks == true and Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_STREAMING ) then
		Engine.ExecNow( f10_arg0.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_STREAMING )
		return 
	elseif f10_arg0.parentButton.active ~= true then
		return 
	elseif f10_arg0.value == 1 then
		if not Engine.IsLivestreamEnabled() then
			if Dvar.webm_httpAuthMode:get() == "youtube" then
				Engine.YouTube_Set( {
					controlerIndex = f10_arg0.controller
				} )
			elseif Dvar.webm_httpAuthMode:get() == "twitch" then
				local f10_local0 = Engine.GetTwitchAccountInfo( controller )
				Engine.Twitch_Set( {
					user = string.lower( f10_local0.userName )
				} )
				Dvar.webm_encStreamEnabled:set( true )
			end
			Engine.LivestreamEnable( f10_arg0.controller )
			Dvar.webm_encStreamEnabled:set( true )
			f10_arg0.parentMenu.errorOpen = nil
		end
	elseif Engine.IsLivestreamEnabled() then
		if Engine.WebM_camera_IsEnabled() then
			Engine.WebM_camera_Disable()
			f10_arg0.parentMenu.occludedMenu:processEvent( {
				name = "update_livestream_camera"
			} )
		end
		f10_arg0.parentMenu.skipUpdates = true
		f10_arg0.parentMenu:openPopup( "LiveStream_Disable", f10_arg0.controller )
	end
	LiveStream_UpdateCameraStateBasedOnStreaming( f10_arg0.parentMenu, true )
	LiveStream_UpdateButtonsBasedOnStreaming( f10_arg0.parentMenu )
end

local f0_local5 = function ( f11_arg0 )
	if CoD.LiveStream.PerformBanChecks == true and Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_STREAMING_CAMERA ) then
		Engine.ExecNow( f11_arg0.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_STREAMING_CAMERA )
		return 
	elseif f11_arg0.parentButton.active ~= true then
		return 
	elseif f11_arg0.value == 1 then
		if Engine.IsLivestreamEnabled() and Engine.WebM_camera_IsAvailable() and not Engine.WebM_camera_IsEnabled() then
			Engine.WebM_camera_Enable( "livestream_cam" )
			f11_arg0.parentMenu.occludedMenu:processEvent( {
				name = "update_livestream_camera"
			} )
		end
	elseif Engine.WebM_camera_IsEnabled() then
		Engine.WebM_camera_Disable()
		f11_arg0.parentMenu.occludedMenu:processEvent( {
			name = "update_livestream_camera"
		} )
	end
end

function LiveStream_UpdateCameraButtonState( f12_arg0 )
	if not Engine.DvarBool( nil, "webm_encAllowCamera" ) then
		return 
	end
	local f12_local0 = false
	local f12_local1 = f12_arg0:getOwner()
	if not Engine.DvarBool( nil, "webm_encIdentityVerificationRequired" ) then
		f12_local0 = true
	end
	if Dvar.webm_httpAuthMode:get() == "youtube" then
		local f12_local2 = f0_local3( f12_local1 )
		if f12_local2 ~= nil and f12_local2.identityVerified == true then
			f12_local0 = true
		end
	else
		f12_local0 = true
	end
	if not Engine.WebM_camera_IsAvailable() or not Engine.IsLivestreamEnabled() or not f12_local0 then
		if f12_arg0.buttonList.visionCamera.disabled == nil then
			f12_arg0.buttonList.visionCamera:disable()
		end
	elseif f12_arg0.buttonList.visionCamera.disabled then
		f12_arg0.buttonList.visionCamera:enable()
	end
	local f12_local2 = f12_arg0.buttonList.visionCamera.hintText
	if not Engine.WebM_camera_IsAvailable() then
		f12_arg0.buttonList.visionCamera.hintText = Engine.Localize( "PLATFORM_TOGGLE_CAMERA_NOT_ATTACHED" )
	elseif not Engine.IsLivestreamEnabled() then
		f12_arg0.buttonList.visionCamera.hintText = Engine.Localize( "PLATFORM_TOGGLE_CAMERA_LIVE_STREAM_NOT_ENABLED" )
	elseif not f12_local0 then
		f12_arg0.buttonList.visionCamera.hintText = Engine.Localize( "PLATFORM_TOGGLE_CAMERA_SMS_VERIFICATION_FAILED", Engine.DvarString( nil, "YouTube_verifyUrl" ) )
	else
		f12_arg0.buttonList.visionCamera.hintText = Engine.Localize( "PLATFORM_TOGGLE_CAMERA_DESC" )
	end
	if f12_arg0.buttonList.visionCamera:isInFocus() and f12_local2 ~= f12_arg0.buttonList.visionCamera.hintText then
		f12_arg0.buttonList:updateHintText( f12_arg0.buttonList.visionCamera )
	end
end

function LiveStream_UpdateCameraStateBasedOnStreaming( f13_arg0, f13_arg1 )
	if not Engine.IsLivestreamEnabled() then
		if Engine.WebM_camera_IsEnabled() then
			Engine.WebM_camera_Disable()
			f13_arg0.updateOccludedMenu = true
		end
	elseif not Engine.WebM_camera_IsAvailable() and Engine.WebM_camera_IsEnabled() then
		Engine.WebM_camera_Disable()
		f13_arg0.updateOccludedMenu = true
	end
	if f13_arg1 then
		LiveStream_UpdateCameraButtonState( f13_arg0 )
	end
end

function LiveStream_UpdateButtonsBasedOnStreaming( f14_arg0 )
	local f14_local0 = f14_arg0:getOwner()
	if Engine.IsLivestreamEnabled() and Dvar.webm_encStreamEnabled:get() and CoD.LiveStream.GetLiveStreamUrl( f14_local0, true ) then
		local f14_local1 = CoD.LiveStream.GetLiveStreamUrl( f14_local0, true )
		if f14_arg0.buttonList.sendToFacebook ~= nil and f14_local1 ~= nil and f14_arg0.buttonList.sendToFacebook.disabled then
			f14_arg0.buttonList.sendToFacebook:enable()
		end
		if f14_arg0.buttonList.sendToTwitter ~= nil and f14_local1 ~= nil and f14_arg0.buttonList.sendToTwitter.disabled then
			f14_arg0.buttonList.sendToTwitter:enable()
		end
	else
		if f14_arg0.buttonList.sendToFacebook ~= nil and f14_arg0.buttonList.sendToFacebook.disabled == nil then
			f14_arg0.buttonList.sendToFacebook:disable()
		end
		if f14_arg0.buttonList.sendToTwitter ~= nil and f14_arg0.buttonList.sendToTwitter.disabled == nil then
			f14_arg0.buttonList.sendToTwitter:disable()
		end
	end
end

local f0_local6 = function ( f15_arg0 )
	local f15_local0 = f15_arg0:getOwner()
	local f15_local1 = f15_arg0:getParent()
	if f15_arg0.skipUpdates then
		return 
	elseif Dvar.webm_httpAuthMode:get() == "twitch" then
		if Engine.IsLivestreamEnabled() and f15_local1 ~= nil then
			if Dvar.webm_encStreamEnabled:get() then
				local f15_local2 = CoD.LiveStream.GetLiveStreamUrl( f15_local0, true )
				if f15_local2 ~= nil then
					f15_arg0.liveStreamUrl:setText( Engine.Localize( "MENU_LIVESTREAM_URL", f15_local2 ) )
				else
					f15_arg0.liveStreamUrl:setText( "" )
				end
				f15_arg0.liveStreamUrl:setTopBottom( true, false, f15_arg0.miscStatusText.y, f15_arg0.miscStatusText.y + CoD.textSize.Default )
				f15_arg0.miscStatusText:setText( "" )
			elseif not f15_arg0.errorOpen then
				f15_arg0:openPopup( "LiveStream_Error", f15_local0 )
				f15_arg0.errorOpen = true
				if Dvar.webm_twitchLasterror:get() == 401 then
					f15_arg0.sessionExpired = true
				end
			end
		else
			f15_arg0.liveStreamUrl:setText( "" )
			f15_arg0.miscStatusText:setText( "" )
		end
	elseif Dvar.webm_httpAuthMode:get() == "youtube" then
		local f15_local2 = f0_local3( f15_local0 )
		if Engine.IsLivestreamEnabled() and f15_local2 ~= nil and f15_local1 ~= nil then
			if f15_local2.error and f15_arg0.errorOpen == nil then
				f15_arg0:openPopup( "LiveStream_Error", f15_local0 )
				f15_arg0.errorOpen = true
			else
				local f15_local3 = nil
				local f15_local4, f15_local5, f15_local6, f15_local7 = CoD.LiveStream.GetStatusColor( f15_local0, f15_local2.viewers )
				if f15_local2.viewers < Dvar.YouTube_minViewersToStartStream:get() then
					f15_arg0.miscStatusText:setText( Engine.Localize( "MENU_LIVESTREAM_MIN_VIEWERS_NEEDED", Dvar.YouTube_minViewersToStartStream:get() ) )
					f15_local3 = true
				else
					f15_arg0.miscStatusText:setText( "" )
					f15_local3 = false
				end
				f15_arg0.miscStatusText:setRGB( f15_local4, f15_local5, f15_local6 )
				f15_arg0.miscStatusText:setAlpha( f15_local7 )
				local f15_local8 = CoD.LiveStream.GetLiveStreamUrl( f15_local0, true )
				if f15_local8 ~= nil then
					f15_arg0.liveStreamUrl:setText( Engine.Localize( "MENU_LIVESTREAM_URL", f15_local8 ) )
				else
					f15_arg0.liveStreamUrl:setText( "" )
				end
				if f15_local3 then
					f15_arg0.liveStreamUrl:setTopBottom( true, false, f15_arg0.liveStreamUrl.y, f15_arg0.liveStreamUrl.y + CoD.textSize.Default )
				else
					f15_arg0.liveStreamUrl:setTopBottom( true, false, f15_arg0.miscStatusText.y, f15_arg0.miscStatusText.y + CoD.textSize.Default )
				end
			end
		else
			f15_arg0.liveStreamUrl:setText( "" )
			f15_arg0.miscStatusText:setText( "" )
		end
	end
end

local f0_local7 = function ( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg0:getOwner()
	CoD.LiveStream.UpdateViewersIcon( f16_arg0.viewersWidget.viewersCountIcon, f16_local0, CoD.LiveStream.GetViewerCount( f16_local0 ) )
	CoD.LiveStream.UpdateViewersText( f16_arg0.viewersWidget.viewersCountText, f16_local0, CoD.LiveStream.GetViewerCount( f16_local0 ) )
	if f16_arg0.updateOccludedMenu and f16_arg0.occludedMenu ~= nil then
		f16_arg0.occludedMenu:processEvent( {
			name = "update_livestream_camera"
		} )
		f16_arg0.updateOccludedMenu = nil
	end
	f0_local6( f16_arg0 )
	LiveStream_UpdateCameraButtonState( f16_arg0 )
	LiveStream_UpdateButtonsBasedOnStreaming( f16_arg0 )
end

local f0_local8 = function ( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg1.controller
	if f17_arg1.disabled == true then
		f17_arg0.buttonList.liveStreaming:setChoice( 0 )
		if Engine.DvarBool( nil, "webm_encAllowCamera" ) then
			f17_arg0.buttonList.visionCamera:setChoice( 0 )
		end
		if f17_arg0.sessionExpired and Dvar.webm_httpAuthMode:get() == "twitch" then
			f17_arg0.sessionExpired = nil
			f17_arg0:goBack( f17_local0 )
			Engine.Exec( f17_local0, "twitchUnregister" )
			f17_arg0.occludedMenu:openPopup( "Twitch_Connect", f17_local0 )
		end
	end
	LiveStream_UpdateCameraStateBasedOnStreaming( f17_arg0, true )
	LiveStream_UpdateButtonsBasedOnStreaming( f17_arg0 )
end

local f0_local9 = function ( f18_arg0, f18_arg1 )
	local f18_local0 = f18_arg1.controller
	if Engine.IsFacebookLinked( f18_local0 ) then
		if CoD.LiveStream.GetLiveStreamUrl( f18_local0, false ) then
			Engine.FacebookPost( f18_arg1.controller, "message", Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_MESSAGE", CoD.LiveStream.GetLiveStreamUrl( f18_local0, false ) ), "link", CoD.LiveStream.GetLiveStreamUrl( f18_local0, false ), "picture", Dvar.YouTube_slateImageUrl:get(), "name", Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_LINK_TITLE" ), "caption", Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_LINK_CAPTION" ), "description", Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_LINK_DESC" ) )
			f18_arg0:openPopup( "LiveStream_Facebook_Post_Success", f18_local0 )
		end
	else
		f18_arg0:openPopup( "LiveStream_Facebook_Link_Account", f18_local0 )
	end
end

local f0_local10 = function ( f19_arg0, f19_arg1 )
	local f19_local0 = f19_arg1.controller
	if Engine.IsTwitterAccountRegistered( f19_local0 ) then
		if CoD.LiveStream.GetLiveStreamUrl( f19_local0, true ) then
			f19_arg0:openPopup( "LiveStream_Twitter_Post", f19_local0 )
		end
	else
		f19_arg0:openPopup( "LiveStream_Twitter_Link_Account", f19_local0 )
	end
end

LUI.createMenu.LiveStream = function ( f20_arg0, f20_arg1 )
	CoD.LiveStream.PerformBanChecks = false
	local f20_local0 = CoD.Menu.New( "LiveStream" )
	f20_local0:addLargePopupBackground()
	f20_local0:setOwner( f20_arg0 )
	f20_local0.errorOpen = nil
	f20_local0:addTitle( Engine.Localize( "MENU_LIVESTREAMING_CAPS" ) )
	f20_local0:addSelectButton()
	f20_local0:addBackButton()
	f20_local0:registerEventHandler( "livestream_update", f0_local7 )
	f20_local0:registerEventHandler( "livestream_update_state", f0_local8 )
	f20_local0:registerEventHandler( "livestream_send_to_facebook", f0_local9 )
	f20_local0:registerEventHandler( "livestream_send_to_twitter", f0_local10 )
	if CoD.isMultiplayer and not CoD.isZombie then
		f20_local0:addElement( CoD.MiniIdentity.GetMiniIdentity( f20_arg0 ) )
	end
	f20_local0.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0 + CoD.ButtonList.DefaultWidth - 20,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight + CoD.CoD9Button.Height,
		bottom = CoD.Menu.TitleHeight + 720
	} )
	f20_local0:addElement( f20_local0.buttonList )
	if (not (f20_arg1 == nil or not f20_arg1.isHost) or Dvar.r_stereo3DOn:get() or not Engine.CanLivestream() or not Dvar.hiDef:get()) and Engine.IsLivestreamEnabled() then
		Engine.LivestreamDisableAsync()
	end
	local f20_local1 = nil
	if Engine.IsLivestreamEnabled() then
		f20_local1 = 1
	else
		f20_local1 = 0
	end
	local f20_local2 = f20_local0.buttonList:addLeftRightSelector( Engine.Localize( "MENU_LIVESTREAMING_CAPS" ), f20_local1 )
	f20_local2.hintText = Engine.Localize( "MENU_TOGGLE_LIVESTREAM_DESC" )
	local f20_local3 = {}
	local f20_local4 = Engine.Localize( "MENU_OFF_CAPS" )
	local f20_local5 = Engine.Localize( "MENU_ON_CAPS" )
	f20_local2.strings = f20_local4
	f20_local2.values = {
		0,
		1
	}
	f20_local2.active = false
	for f20_local3 = 1, #f20_local2.strings, 1 do
		f20_local2:addChoice( Engine.Localize( f20_local2.strings[f20_local3] ), f0_local4, {
			value = f20_local2.values[f20_local3],
			controller = f20_arg0,
			parentButton = f20_local2,
			parentMenu = f20_local0
		} )
	end
	f20_local2.active = true
	f20_local0.buttonList.liveStreaming = f20_local2
	if f20_arg1 ~= nil and f20_arg1.isHost then
		f20_local0.buttonList.liveStreaming:disable()
		f20_local0.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_HOST" )
	elseif Dvar.r_stereo3DOn:get() or Dvar.r_dualPlayEnable:get() then
		f20_local0.buttonList.liveStreaming:disable()
		f20_local0.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_3D" )
	elseif not Dvar.hiDef:get() then
		f20_local0.buttonList.liveStreaming:disable()
		f20_local0.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_SD" )
	else
		f20_local3 = Engine.GetPrimaryController()
		if f20_local3.GetUsedControllerCount() > 1 then
			f20_local0.buttonList.liveStreaming:disable()
			f20_local0.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_MORE_THAN_ONE_LOCAL_PLAYER" )
		elseif not Engine.CanLivestream() then
			f20_local4 = string.format( "%.1f", Dvar.webm_lq_bandwidth:get() / 1000000 )
			f20_local0.buttonList.liveStreaming:disable()
			f20_local0.buttonList.liveStreaming.hintText = Engine.Localize( "MENU_LIVESTREAMING_DISABLED_FOR_UPLOAD_BANDWIDTH", f20_local4 )
		end
	end
	LiveStream_UpdateCameraStateBasedOnStreaming( f20_local0, false )
	if Engine.DvarBool( nil, "webm_encAllowCamera" ) then
		f20_local3 = nil
		if Engine.WebM_camera_IsEnabled() then
			f20_local3 = 1
		else
			f20_local3 = 0
		end
		f20_local4 = f20_local0.buttonList:addLeftRightSelector( Engine.Localize( "PLATFORM_TOGGLE_CAMERA_CAPS" ), f20_local3 )
		f20_local5 = {}
		local self = Engine.Localize( "MENU_OFF_CAPS" )
		local f20_local7 = Engine.Localize( "MENU_ON_CAPS" )
		f20_local4.strings = self
		f20_local4.values = {
			0,
			1
		}
		f20_local4.active = false
		for f20_local5 = 1, #f20_local4.strings, 1 do
			f20_local4:addChoice( Engine.Localize( f20_local4.strings[f20_local5] ), f0_local5, {
				value = f20_local4.values[f20_local5],
				controller = f20_arg0,
				parentButton = f20_local4,
				parentMenu = f20_local0
			} )
		end
		f20_local4.active = true
		f20_local0.buttonList.visionCamera = f20_local4
		LiveStream_UpdateCameraStateBasedOnStreaming( f20_local0, true )
	end
	f20_local0.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	if CoD.LiveStream.CanPostOnFacebook() then
		f20_local3 = f20_local0.buttonList:addButton( Engine.Localize( "MENU_LIVESTREAM_SEND_TO_FACEBOOK" ) )
		f20_local3.hintText = Engine.Localize( "MENU_LIVESTREAM_SEND_TO_FACEBOOK_DESC" )
		f20_local3:setActionEventName( "livestream_send_to_facebook" )
		f20_local0.buttonList.sendToFacebook = f20_local3
	end
	if CoD.LiveStream.CanPostOnTwitter() then
		f20_local3 = f20_local0.buttonList:addButton( Engine.Localize( "MENU_LIVESTREAM_SEND_TO_TWITTER" ) )
		f20_local3.hintText = Engine.Localize( "MENU_LIVESTREAM_SEND_TO_TWITTER_DESC" )
		f20_local3:setActionEventName( "livestream_send_to_twitter" )
		f20_local0.buttonList.sendToTwitter = f20_local3
	end
	LiveStream_UpdateButtonsBasedOnStreaming( f20_local0 )
	f20_local0.buttonList:processEvent( {
		name = "gain_focus"
	} )
	f20_local3 = 120
	f20_local4 = 400
	f20_local5 = 120
	local self = LUI.UIElement.new()
	self:setLeftRight( false, true, -f20_local4, 0 )
	self:setTopBottom( true, false, f20_local3, f20_local3 + f20_local5 )
	self:setAlignment( LUI.Alignment.Left )
	f20_local0:addElement( self )
	local f20_local7 = LUI.UIElement.new()
	f20_local7:setLeftRight( true, true, 0, 0 )
	f20_local7:setTopBottom( true, false, 0, f20_local5 - 20 )
	self:addElement( f20_local7 )
	f20_local7:addElement( CoD.GetInformationContainer() )
	if Dvar.webm_httpAuthMode:get() == "youtube" then
		local f20_local8 = LUI.UIImage.new()
		f20_local8:setLeftRight( false, true, -125, -5 )
		f20_local8:setTopBottom( true, false, 0, 50 )
		f20_local8:setImage( RegisterMaterial( "youtube_logo" ) )
		f20_local7:addElement( f20_local8 )
	elseif Dvar.webm_httpAuthMode:get() == "twitch" then
		local f20_local8 = LUI.UIImage.new()
		f20_local8:setLeftRight( false, true, -125, -5 )
		f20_local8:setTopBottom( true, false, 0, 50 )
		f20_local8:setImage( RegisterMaterial( "twitch_logo" ) )
		f20_local7:addElement( f20_local8 )
	end
	local f20_local8 = 10
	local f20_local9 = 5
	local f20_local10 = CoD.LiveStream.GetStatusWidget( f20_arg0, LUI.Alignment.Left )
	f20_local10:setLeftRight( true, true, f20_local8, 0 )
	f20_local10:setTopBottom( true, false, f20_local9, f20_local9 + CoD.textSize.Default )
	f20_local7:addElement( f20_local10 )
	
	local viewersWidget = CoD.LiveStream.GetViewersWidget( RegisterMaterial( "menu_livestream_icon_none" ), 32, 64, LUI.Alignment.Center, CoD.fonts.Big, CoD.textSize.Big )
	f20_local7:addElement( viewersWidget )
	f20_local0.viewersWidget = viewersWidget
	
	CoD.LiveStream.UpdateViewersIcon( f20_local0.viewersWidget.viewersCountIcon, f20_arg0, CoD.LiveStream.GetViewerCount( f20_arg0 ) )
	CoD.LiveStream.UpdateViewersText( f20_local0.viewersWidget.viewersCountText, f20_arg0, CoD.LiveStream.GetViewerCount( f20_arg0 ) )
	local f20_local12 = LUI.UIElement.new()
	f20_local12:setLeftRight( true, true, 0, 0 )
	f20_local12:setTopBottom( true, false, 98, 98 + CoD.textSize.Default + 4 )
	self:addElement( f20_local12 )
	f20_local12:addElement( CoD.GetInformationContainer() )
	local f20_local13 = Engine.Localize( "MENU_VIEWERS" )
	local f20_local14 = {}
	f20_local14 = GetTextDimensions( f20_local13, CoD.fonts.Default, CoD.textSize.Default )
	local f20_local15 = f20_local14[3]
	local f20_local16 = LUI.UIText.new()
	f20_local16:setLeftRight( false, false, -f20_local15 / 2, f20_local15 / 2 )
	f20_local16:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	f20_local16:setFont( CoD.fonts.Default )
	f20_local16:setText( f20_local13 )
	f20_local12:addElement( f20_local16 )
	local f20_local17 = f20_local3 + f20_local5 + 10
	f20_local0.miscStatusText = LUI.UITightText.new()
	f20_local0.miscStatusText:setLeftRight( false, true, -f20_local4, 0 )
	f20_local0.miscStatusText:setTopBottom( true, false, f20_local17, f20_local17 + CoD.textSize.Default )
	f20_local0.miscStatusText:setAlignment( LUI.Alignment.Left )
	f20_local0.miscStatusText:setFont( CoD.fonts.Default )
	f20_local0.miscStatusText.y = f20_local17
	f20_local0:addElement( f20_local0.miscStatusText )
	f20_local17 = f20_local17 + 80
	f20_local0.liveStreamUrl = LUI.UITightText.new()
	f20_local0.liveStreamUrl:setLeftRight( false, true, -f20_local4, 0 )
	f20_local0.liveStreamUrl:setTopBottom( true, false, f20_local17, f20_local17 + CoD.textSize.Default )
	f20_local0.liveStreamUrl:setAlignment( LUI.Alignment.Left )
	f20_local0.liveStreamUrl:setFont( CoD.fonts.Default )
	f20_local0.liveStreamUrl.y = f20_local17
	f20_local0:addElement( f20_local0.liveStreamUrl )
	local f20_local18 = 860
	local f20_local19 = 120
	local f20_local20 = Engine.GetPlayerGroupCountInt( "streaming/0" ) * Dvar.webm_usersWaitingToStream:get()
	local f20_local21 = Engine.GetPlayerGroupCountInt( "streaming/1" ) * Dvar.webm_usersStreaming:get()
	local f20_local22 = Dvar.webm_highActivityThreshold:get()
	local f20_local23 = "normal"
	if f20_local22 < f20_local20 + f20_local21 then
		f20_local23 = "high"
	end
	local f20_local24, f20_local25, f20_local26, f20_local27, f20_local28 = nil
	if f20_local23 == "normal" then
		f20_local27 = Engine.Localize( "MENU_LIVESTREAM_USAGE_NORMAL" )
		f20_local28 = Engine.Localize( "MENU_LIVESTREAM_NETWORK_STATUS_DESCRIPTION_NORMAL" )
		f20_local24 = 0.21
		f20_local25 = 0.7
		f20_local26 = 0.7
	else
		f20_local27 = Engine.Localize( "MENU_LIVESTREAM_USAGE_HIGH" )
		f20_local28 = Engine.Localize( "MENU_LIVESTREAM_NETWORK_STATUS_DESCRIPTION_HIGH" )
		f20_local24 = 0.62
		f20_local25 = 0.06
		f20_local26 = 0.06
	end
	local f20_local29 = LUI.UIText.new()
	f20_local29:setLeftRight( false, false, -f20_local18 / 2, -f20_local18 / 2 + 500 )
	f20_local29:setTopBottom( false, true, -f20_local19 - 80 - CoD.textSize.Default, -f20_local19 - 80 )
	f20_local29:setAlignment( LUI.Alignment.Left )
	f20_local29:setFont( CoD.fonts.Default )
	f20_local29:setText( Engine.Localize( "MENU_LIVESTREAM_NETWORK_STATUS" ) )
	f20_local0:addElement( f20_local29 )
	local f20_local30 = LUI.UIElement.new()
	f20_local30:setLeftRight( false, false, -f20_local18 / 2, f20_local18 / 2 )
	f20_local30:setTopBottom( false, true, -f20_local19 - 70, -70 )
	f20_local30:setAlignment( LUI.Alignment.Left )
	f20_local0:addElement( f20_local30 )
	local f20_local31 = LUI.UIElement.new()
	f20_local31:setLeftRight( true, false, 0, 120 )
	f20_local31:setTopBottom( true, true, 0, 0 )
	f20_local30:addElement( f20_local31 )
	f20_local31:addElement( CoD.GetInformationContainer() )
	local f20_local32 = 48
	local f20_local33 = 108
	local f20_local34 = LUI.UIImage.new()
	f20_local34:setLeftRight( false, false, -f20_local32 / 2, f20_local32 / 2 )
	f20_local34:setTopBottom( false, true, -f20_local33 - 16, -16 )
	f20_local34:setImage( RegisterMaterial( "menu_livestream_tower" ) )
	f20_local31:addElement( f20_local34 )
	local f20_local35 = 64
	local f20_local36 = 32
	local f20_local37 = LUI.UIImage.new()
	f20_local37:setLeftRight( false, false, -f20_local35 / 2, f20_local35 / 2 )
	f20_local37:setTopBottom( true, false, 20, 20 + f20_local36 )
	f20_local37:setImage( RegisterMaterial( "menu_livestream_signal" ) )
	f20_local37:setRGB( f20_local24, f20_local25, f20_local26 )
	f20_local31:addElement( f20_local37 )
	local f20_local38 = LUI.UIElement.new()
	f20_local38:setLeftRight( true, true, 118, 0 )
	f20_local38:setTopBottom( true, true, 0, 0 )
	f20_local30:addElement( f20_local38 )
	f20_local38:addElement( CoD.GetInformationContainer() )
	local f20_local39 = {}
	f20_local39 = GetTextDimensions( f20_local27, CoD.fonts.Default, CoD.textSize.Default )
	local f20_local40 = f20_local39[3]
	local f20_local41 = 10
	local f20_local42 = 4
	local f20_local43 = LUI.UIElement.new()
	f20_local43:setLeftRight( true, false, 15, 15 + f20_local40 + f20_local41 )
	f20_local43:setTopBottom( true, false, 15, 15 + f20_local42 + CoD.textSize.Default )
	f20_local38:addElement( f20_local43 )
	local f20_local44 = CoD.GetInformationContainer()
	f20_local44.infoContainerBackground:setRGB( f20_local24, f20_local25, f20_local26 )
	f20_local44.border:setAlpha( 0 )
	f20_local43:addElement( f20_local44 )
	local f20_local45 = LUI.UIText.new()
	f20_local45:setLeftRight( false, false, -f20_local40 / 2, f20_local40 / 2 )
	f20_local45:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	f20_local45:setFont( CoD.fonts.Default )
	f20_local45:setText( f20_local27 )
	f20_local43:addElement( f20_local45 )
	local f20_local46 = LUI.UIText.new()
	f20_local46:setLeftRight( true, true, 15, -15 )
	f20_local46:setTopBottom( true, false, 60, 60 + CoD.textSize.Default )
	f20_local46:setAlignment( LUI.Alignment.Left )
	f20_local46:setFont( CoD.fonts.Default )
	f20_local46:setText( f20_local28 )
	f20_local38:addElement( f20_local46 )
	f20_local0.pollTimer = LUI.UITimer.new( 1000, {
		name = "livestream_update",
		controller = f20_arg0
	} )
	f20_local0:addElement( f20_local0.pollTimer )
	f0_local7( f20_local0, {
		controller = f20_arg0
	} )
	CoD.LiveStream.PerformBanChecks = true
	return f20_local0
end

CoD.LiveStream.GetViewerCount = function ( f21_arg0 )
	local f21_local0 = 0
	if Engine.IsLivestreamEnabled() then
		if Dvar.webm_httpAuthMode:get() == "twitch" then
			local f21_local1 = Engine.Twitch_Get( f21_arg0 )
			if f21_local1 ~= nil then
				f21_local0 = f21_local1.viewers
			end
		elseif Dvar.webm_httpAuthMode:get() == "youtube" then
			local f21_local1 = f0_local3( f21_arg0 )
			if f21_local1 ~= nil then
				f21_local0 = f21_local1.viewers
			end
		end
	end
	return f21_local0
end

CoD.LiveStream.GetLiveStreamLifeCycleState = function ( f22_arg0 )
	local f22_local0 = ""
	if Dvar.webm_httpAuthMode:get() == "twitch" then
		local f22_local1 = Engine.Twitch_Get( f22_arg0 )
		if Engine.IsLivestreamEnabled() then
			if Dvar.webm_encStreamEnabled:get() then
				if f22_local1.connecting then
					f22_local0 = "connecting"
				elseif f22_local1.buffering then
					f22_local0 = "buffering"
				else
					f22_local0 = "live"
				end
			else
				f22_local0 = "stopped"
			end
		end
	elseif Dvar.webm_httpAuthMode:get() == "youtube" then
		local f22_local1 = f0_local3( f22_arg0 )
		if Engine.IsLivestreamEnabled() and f22_local1 ~= nil then
			f22_local0 = f22_local1.streamLifeCycleState
		end
	end
	return f22_local0
end

CoD.LiveStream.GetLiveStreamUrl = function ( f23_arg0, f23_arg1 )
	local f23_local0 = nil
	if Dvar.webm_httpAuthMode:get() == "twitch" then
		if Engine.IsLivestreamEnabled() then
			local f23_local1 = Engine.GetTwitchAccountInfo( f23_arg0 )
			f23_local0 = "http://www.twitch.tv/" .. string.lower( f23_local1.userName )
		end
	elseif Dvar.webm_httpAuthMode:get() == "youtube" then
		local f23_local1 = f0_local3( f23_arg0 )
		if Engine.IsLivestreamEnabled() and f23_local1 ~= nil then
			f23_local0 = f23_local1.url
			if f23_arg1 then
				f23_local0 = CoD.ModifyTextForReadability( f23_local0 )
			end
		end
	end
	return f23_local0
end

CoD.LiveStream.IsStreaming = function ( f24_arg0 )
	local f24_local0 = false
	if Dvar.webm_httpAuthMode:get() == "youtube" then
		local f24_local1 = f0_local3( f24_arg0 )
		if Engine.IsLivestreamEnabled() and f24_local1 ~= nil then
			f24_local0 = f24_local1.streamIsRunning
		end
	elseif Dvar.webm_httpAuthMode:get() == "twitch" and Engine.IsLivestreamEnabled() then
		f24_local0 = Dvar.webm_encStreamEnabled:get()
	end
	return f24_local0
end

CoD.LiveStream.GetStatusColor = function ( f25_arg0, f25_arg1 )
	local f25_local0 = 1
	local f25_local1 = 1
	local f25_local2 = 1
	local f25_local3 = 1
	if Engine.IsLivestreamEnabled() then
		if Dvar.webm_httpAuthMode:get() == "twitch" then
			if not Dvar.webm_encStreamEnabled:get() then
				f25_local0 = CoD.red.r
				f25_local1 = CoD.red.g
				f25_local2 = CoD.red.b
			elseif CoD.LiveStream.GetLiveStreamLifeCycleState( f25_arg0 ) == "buffering" then
				f25_local0 = CoD.BOIIOrange.r
				f25_local1 = CoD.BOIIOrange.g
				f25_local2 = CoD.BOIIOrange.b
			elseif CoD.LiveStream.GetLiveStreamLifeCycleState( f25_arg0 ) == "connecting" then
				f25_local0 = CoD.yellowGlow.r
				f25_local1 = CoD.yellowGlow.g
				f25_local2 = CoD.yellowGlow.b
			else
				f25_local0 = CoD.brightGreen.r
				f25_local1 = CoD.brightGreen.g
				f25_local2 = CoD.brightGreen.b
			end
		elseif Dvar.webm_httpAuthMode:get() == "youtube" then
			if CoD.LiveStream.IsStreaming( f25_arg0 ) and (f25_arg1 == nil or f25_arg1 >= Dvar.YouTube_minViewersToStartStream:get()) then
				f25_local0 = CoD.brightGreen.r
				f25_local1 = CoD.brightGreen.g
				f25_local2 = CoD.brightGreen.b
			elseif not Dvar.webm_encStreamEnabled:get() then
				f25_local0 = CoD.red.r
				f25_local1 = CoD.red.g
				f25_local2 = CoD.red.b
			else
				f25_local0 = CoD.BOIIOrange.r
				f25_local1 = CoD.BOIIOrange.g
				f25_local2 = CoD.BOIIOrange.b
			end
		end
	end
	return f25_local0, f25_local1, f25_local2, f25_local3
end

CoD.LiveStream.UpdateViewersIcon = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0, f26_local1, f26_local2, f26_local3 = CoD.LiveStream.GetStatusColor( f26_arg1, f26_arg2 )
	f26_arg0:setRGB( f26_local0, f26_local1, f26_local2 )
	f26_arg0:setAlpha( f26_local3 )
end

CoD.LiveStream.UpdateViewersText = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = f27_arg2
	local f27_local1 = {}
	f27_local1 = GetTextDimensions( f27_local0, f27_arg0.font, f27_arg0.fontSize )
	local f27_local2 = f27_local1[3]
	local f27_local3, f27_local4, f27_local5, f27_local6 = CoD.LiveStream.GetStatusColor( f27_arg1, f27_arg2 )
	f27_arg0:setRGB( f27_local3, f27_local4, f27_local5 )
	f27_arg0:setAlpha( f27_local6 )
	f27_arg0:setLeftRight( true, false, 10, 10 + f27_local2 )
	f27_arg0:setText( f27_local0 )
end

CoD.LiveStream.GetViewersIcon = function ( f28_arg0, f28_arg1, f28_arg2 )
	local self = LUI.UIImage.new()
	self:setLeftRight( true, false, 0, f28_arg1 )
	self:setTopBottom( false, true, -f28_arg2, 0 )
	if f28_arg0 ~= nil then
		self:setImage( f28_arg0 )
	end
	return self
end

CoD.LiveStream.GetViewersText = function ( menu, controller )
	local self = LUI.UITightText.new()
	self.font = menu
	self.fontSize = controller
	self:setTopBottom( false, false, -controller / 2, controller / 2 )
	return self
end

CoD.LiveStream.GetViewersWidget = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3, f30_arg4, f30_arg5 )
	local self = LUI.UIHorizontalList.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( false, false, -f30_arg5 / 2, f30_arg5 / 2 )
	self:setSpacing( 5 )
	self:setAlignment( f30_arg3 )
	self.font = f30_arg4
	self.fontSize = f30_arg5
	
	local viewersCountIcon = CoD.LiveStream.GetViewersIcon( f30_arg0, f30_arg1, f30_arg2 )
	self:addElement( viewersCountIcon )
	self.viewersCountIcon = viewersCountIcon
	
	local viewersCountText = CoD.LiveStream.GetViewersText( f30_arg4, f30_arg5 )
	self:addElement( viewersCountText )
	self.viewersCountText = viewersCountText
	
	return self
end

local f0_local11 = function ( f31_arg0, f31_arg1 )
	local f31_local0 = f31_arg0.controller
	if f31_arg0.hideWhenLiveStreamDisabled and not Engine.IsLivestreamEnabled() then
		f31_arg0:setAlpha( 0 )
	else
		f31_arg0:setAlpha( 1 )
	end
	local f31_local1 = Engine.Localize( "MENU_OFF_CAPS" )
	local f31_local2, f31_local3, f31_local4, f31_local5 = CoD.LiveStream.GetStatusColor( f31_local0 )
	local f31_local6 = RegisterMaterial( "menu_livestream_hollow_circle" )
	if Engine.IsLivestreamEnabled() then
		if CoD.LiveStream.IsStreaming( f31_local0 ) then
			if CoD.LiveStream.GetLiveStreamLifeCycleState( f31_local0 ) == "live" then
				f31_local1 = Engine.Localize( "MENU_LIVE_CAPS" )
			elseif CoD.LiveStream.GetLiveStreamLifeCycleState( f31_local0 ) == "buffering" then
				f31_local1 = Engine.Localize( "MENU_BUFFERING_CAPS" )
			elseif CoD.LiveStream.GetLiveStreamLifeCycleState( f31_local0 ) == "connecting" then
				f31_local1 = Engine.Localize( "MENU_CONNECTING_CAPS" )
			else
				f31_local1 = Engine.Localize( "MENU_INITIALIZING_CAPS" )
			end
		elseif not Dvar.webm_encStreamEnabled:get() then
			f31_local1 = Engine.Localize( "MENU_STOPPED_CAPS" )
		else
			f31_local1 = Engine.Localize( "MENU_WAITING_CAPS" )
		end
		f31_local6 = RegisterMaterial( "menu_livestream_hollow_fill" )
	end
	local f31_local7 = {}
	f31_local7 = GetTextDimensions( f31_local1, CoD.fonts.Default, CoD.textSize.Default )
	local f31_local8 = f31_local7[3]
	f31_arg0.liveStatusTextElement:setText( f31_local1 )
	f31_arg0.liveStatusTextElement:setLeftRight( true, false, 0, f31_local8 )
	f31_arg0.liveStatusTextElement:setRGB( f31_local2, f31_local3, f31_local4 )
	f31_arg0.liveStatusTextElement:setAlpha( f31_local5 )
	f31_arg0.liveStatusIcon:setRGB( f31_local2, f31_local3, f31_local4 )
	f31_arg0.liveStatusIcon:setAlpha( f31_local5 )
	f31_arg0.liveStatusIcon:setImage( f31_local6 )
	if f31_arg0.hasViewerCount then
		CoD.LiveStream.UpdateViewersIcon( f31_arg0.viewersCountIcon, f31_local0, CoD.LiveStream.GetViewerCount( f31_local0 ) )
		CoD.LiveStream.UpdateViewersText( f31_arg0.viewersCountText, f31_local0, CoD.LiveStream.GetViewerCount( f31_local0 ) )
	end
end

local f0_local12 = function ( f32_arg0 )
	local f32_local0 = CoD.textSize.Default / 2
	
	local liveStatusIcon = LUI.UIImage.new()
	liveStatusIcon:setLeftRight( true, false, 0, f32_local0 )
	liveStatusIcon:setTopBottom( false, false, -f32_local0 / 2, f32_local0 / 2 )
	f32_arg0:addElement( liveStatusIcon )
	f32_arg0.liveStatusIcon = liveStatusIcon
	
end

local f0_local13 = function ( f33_arg0 )
	local liveStatusTextElement = LUI.UITightText.new()
	liveStatusTextElement:setTopBottom( true, false, 0, CoD.textSize.Default )
	f33_arg0:addElement( liveStatusTextElement )
	f33_arg0.liveStatusTextElement = liveStatusTextElement
	
end

local f0_local14 = function ( f34_arg0, f34_arg1 )
	local viewersCountIcon = CoD.LiveStream.GetViewersIcon( RegisterMaterial( "menu_livestream_icon_live" ), 12, 25 )
	f34_arg0:addElement( viewersCountIcon )
	f34_arg0.viewersCountIcon = viewersCountIcon
	
	CoD.LiveStream.UpdateViewersIcon( viewersCountIcon, f34_arg1, CoD.LiveStream.GetViewerCount( f34_arg1 ) )
end

local f0_local15 = function ( f35_arg0, f35_arg1 )
	local viewersCountText = CoD.LiveStream.GetViewersText( CoD.fonts.Default, CoD.textSize.Default )
	f35_arg0:addElement( viewersCountText )
	f35_arg0.viewersCountText = viewersCountText
	
	CoD.LiveStream.UpdateViewersText( viewersCountText, f35_arg1, CoD.LiveStream.GetViewerCount( f35_arg1 ) )
end

CoD.LiveStream.GetStatusWidget = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
	local self = LUI.UIContainer.new()
	local f36_local1 = LUI.UIHorizontalList.new()
	f36_local1:setLeftRight( true, true, 0, 0 )
	f36_local1:setTopBottom( true, false, 0, CoD.textSize.Default )
	f36_local1:setSpacing( 5 )
	f36_local1:setAlignment( f36_arg1 )
	f36_local1.hasViewerCount = f36_arg2
	f36_local1.hideWhenLiveStreamDisabled = f36_arg3
	f36_local1.controller = f36_arg0
	f36_local1:registerEventHandler( "livestream_statuswidget_update", f0_local11 )
	self:addElement( f36_local1 )
	if f36_arg1 == LUI.Alignment.Right then
		if f36_arg2 then
			f0_local15( f36_local1, f36_arg0 )
			f0_local14( f36_local1, f36_arg0 )
			f36_local1:addSpacer( 5 )
		end
		f0_local13( f36_local1 )
		f0_local12( f36_local1 )
	else
		f0_local12( f36_local1 )
		f0_local13( f36_local1 )
		if f36_arg2 then
			f36_local1:addSpacer( 5 )
			f0_local14( f36_local1, f36_arg0 )
			f0_local15( f36_local1, f36_arg0 )
		end
	end
	f36_local1.pollTimer = LUI.UITimer.new( 200, {
		name = "livestream_statuswidget_update",
		controller = f36_arg0
	} )
	f36_local1:addElement( f36_local1.pollTimer )
	if f36_arg3 then
		f36_local1:setAlpha( 0 )
	end
	return self
end

CoD.LiveStream.AddInGameStatusWidget = function ( f37_arg0, f37_arg1, f37_arg2 )
	if not Engine.IsLivestreamEnabled() or Engine.IsDemoMovieRendering() then
		return 
	end
	local self = LUI.UIElement.new( f37_arg2 )
	if Engine.WebM_camera_IsAvailable() and Engine.WebM_camera_IsEnabled() then
		local f37_local1 = LUI.UIContainer.new()
		f37_local1:setTopBottom( true, true, 0, -25 )
		self:addElement( f37_local1 )
		f37_local1:addElement( CoD.GetInformationContainer() )
		local f37_local2 = LUI.UIImage.new()
		f37_local2:setLeftRight( true, true, 3, -3 )
		f37_local2:setTopBottom( true, true, 3, -3 )
		f37_local2:setRGB( 1, 1, 1 )
		f37_local2:setAlpha( 1 )
		f37_local2:setImage( RegisterMaterial( "livestream_cam" ) )
		f37_local1:addElement( f37_local2 )
		local f37_local3 = LUI.UIContainer.new()
		f37_local3:setTopBottom( false, true, -27, 0 )
		self:addElement( f37_local3 )
		f37_local3:addElement( CoD.GetInformationContainer() )
		local f37_local4 = LUI.UIContainer.new()
		f37_local4:setLeftRight( true, true, 3, -6 )
		f37_local3:addElement( f37_local4 )
		f37_local4:addElement( CoD.LiveStream.GetStatusWidget( f37_arg1, LUI.Alignment.Right, true, true ) )
	else
		local f37_local1 = LUI.UIContainer.new()
		f37_local1:setLeftRight( true, true, 3, -6 )
		self:addElement( f37_local1 )
		f37_local1:addElement( CoD.LiveStream.GetStatusWidget( f37_arg1, LUI.Alignment.Right, true, true ) )
	end
	f37_arg0.safeArea:addElement( self )
end

local f0_local16 = function ( f38_arg0, f38_arg1 )
	f38_arg0:goBack( f38_arg1.controller )
	if Engine.WebM_camera_IsEnabled() then
		Engine.WebM_camera_Disable()
	end
	f38_arg0.occludedMenu:openPopup( "LiveStream_Disable", f38_arg1.controller )
end

LUI.createMenu.LiveStream_Error = function ( f39_arg0 )
	local f39_local0 = CoD.Popup.SetupPopup( "LiveStream_Error", f39_arg0 )
	f39_local0:registerEventHandler( "button_prompt_back", f0_local16 )
	f39_local0.title:setText( Engine.Localize( "MENU_ERROR" ) )
	f39_local0.msg:setText( Engine.Localize( "MENU_LIVESTREAM_ERROR" ) )
	if Dvar.webm_httpAuthMode:get() == "youtube" then
		local f39_local1 = f0_local3( f39_arg0 )
		if f39_local1 ~= nil then
			if f39_local1.errorCode == 403 then
				f39_local0.msg:setText( Engine.Localize( "MENU_LIVESTREAM_YOUTUBE_ERROR_STRIKES" ) )
			elseif f39_local1.errorCode == 401 then
				f39_local0.msg:setText( Engine.Localize( "MENU_LIVESTREAM_YOUTUBE_ACCOUNT_NOT_FULLY_SETUP" ) )
			elseif f39_local1.errorCode == 503 then
				f39_local0.msg:setText( Engine.Localize( "MENU_LIVESTREAM_YOUTUBE_SERVICE_UNAVAILABLE" ) )
			end
		end
	elseif Dvar.webm_httpAuthMode:get() == "twitch" then
		if Dvar.webm_twitchLasterror:get() == 503 then
			f39_local0.msg:setText( Engine.Localize( "MENU_LIVESTREAM_TWITCH_OVERLOADED" ) )
		elseif Dvar.webm_twitchLasterror:get() == 401 then
			f39_local0.msg:setText( Engine.Localize( "MENU_LIVESTREAM_TWITCH_SESSION_EXPIRED" ) )
		end
	end
	f39_local0:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	f39_local0:addLeftButtonPrompt( CoD.ButtonPrompt.new( "secondary", "", f39_local0, "button_prompt_back", true ) )
	return f39_local0
end

local f0_local17 = function ( f40_arg0, f40_arg1 )
	Engine.ExecNow( controller, "fbLinkFacebook" )
end

local f0_local18 = function ( f41_arg0, f41_arg1 )
	f41_arg0:goBack( f41_arg1.controller )
	f41_arg0.occludedMenu:processEvent( {
		name = "livestream_send_to_facebook",
		controller = f41_arg1.controller
	} )
end

LUI.createMenu.LiveStream_Facebook_Link_Account = function ( f42_arg0 )
	local f42_local0 = CoD.Popup.SetupPopupChoice( "LiveStream_Facebook_Link_Account", f42_arg0 )
	f42_local0.title:setText( Engine.Localize( "MENU_FACEBOOK" ) )
	f42_local0.msg:setText( Engine.Localize( "MENU_FACEBOOK_ACCOUNT_LINK_DESC" ) )
	f42_local0:addBackButton()
	f42_local0.choiceA:setLabel( Engine.Localize( "MENU_LINK_ACCOUNT" ) )
	f42_local0.choiceB:setLabel( Engine.Localize( "MENU_NOT_NOW" ) )
	f42_local0.choiceA:setActionEventName( "link_facebook" )
	f42_local0.choiceB:processEvent( {
		name = "gain_focus"
	} )
	f42_local0:registerEventHandler( "link_facebook", f0_local17 )
	f42_local0:registerEventHandler( "facebook_register_success", f0_local18 )
	return f42_local0
end

LUI.createMenu.LiveStream_Facebook_Post_Success = function ( f43_arg0 )
	local f43_local0 = CoD.Popup.SetupPopup( "LiveStream_Facebook_Post_Success", f43_arg0 )
	local f43_local1 = Engine.Localize( "MENU_LIVESTREAM_FACEBOOK_MESSAGE", CoD.LiveStream.GetLiveStreamUrl( f43_arg0, true ) )
	f43_local0.title:setText( Engine.Localize( "MENU_LINK_SENT" ) )
	f43_local0.msg:setText( Engine.Localize( "MENU_LINK_SENT_TO_FACEBOOK_DESC", f43_local1 ) )
	f43_local0:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	f43_local0:addLeftButtonPrompt( CoD.ButtonPrompt.new( "secondary", "", f43_local0, "button_prompt_back", true ) )
	return f43_local0
end

local f0_local19 = function ( f44_arg0, f44_arg1 )
	CoD.perController[f44_arg1.controller].fromLiveStreamMenu = true
	f44_arg0:openMenu( "Twitter_Connect", f44_arg1.controller )
	f44_arg0:close()
	CoD.perController[f44_arg1.controller].fromLiveStreamMenu = nil
end

LUI.createMenu.LiveStream_Twitter_Link_Account = function ( f45_arg0 )
	local f45_local0 = CoD.Popup.SetupPopupChoice( "LiveStream_Twitter_Link_Account", f45_arg0 )
	f45_local0.title:setText( Engine.Localize( "MENU_TWITTER" ) )
	f45_local0.msg:setText( Engine.Localize( "MENU_TWITTER_ACCOUNT_LINK_DESC" ) )
	f45_local0:addBackButton()
	f45_local0.choiceA:setLabel( Engine.Localize( "MENU_LINK_ACCOUNT" ) )
	f45_local0.choiceB:setLabel( Engine.Localize( "MENU_NOT_NOW" ) )
	f45_local0.choiceA:setActionEventName( "link_twitter" )
	f45_local0.choiceB:processEvent( {
		name = "gain_focus"
	} )
	f45_local0:registerEventHandler( "link_twitter", f0_local19 )
	return f45_local0
end

local f0_local20 = function ( f46_arg0, f46_arg1 )
	local f46_local0 = Engine.Localize( "MENU_LIVESTREAM_TWITTER_MESSAGE", CoD.LiveStream.GetLiveStreamUrl( f46_arg1.controller, true ) )
	f46_arg0.title:setText( Engine.Localize( "MENU_LINK_SENT" ) )
	f46_arg0.msg:setText( Engine.Localize( "MENU_LINK_SENT_TO_TWITTER_DESC", f46_local0 ) )
	f46_arg0.spinner:setAlpha( 0 )
	f46_arg0:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	f46_arg0:addLeftButtonPrompt( CoD.ButtonPrompt.new( "secondary", "", f46_arg0, "button_prompt_back", true ) )
end

local f0_local21 = function ( f47_arg0, f47_arg1 )
	f47_arg0.title:setText( Engine.Localize( "MENU_ERROR" ) )
	f47_arg0.msg:setText( f47_arg1.errorMessage )
	f47_arg0.spinner:setAlpha( 0 )
	f47_arg0:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	f47_arg0:addLeftButtonPrompt( CoD.ButtonPrompt.new( "secondary", "", f47_arg0, "button_prompt_back", true ) )
end

LUI.createMenu.LiveStream_Twitter_Post = function ( f48_arg0 )
	local f48_local0 = CoD.Popup.SetupPopupBusy( "LiveStream_Twitter_Post", f48_arg0 )
	f48_local0:registerEventHandler( "live_dw_twitter_post_success", f0_local20 )
	f48_local0:registerEventHandler( "live_dw_twitter_post_failure", f0_local21 )
	f48_local0.title:setText( Engine.Localize( "MENU_SENDING_TO_TWITTER" ) )
	Engine.TwitterPost( f48_arg0, Engine.Localize( "MENU_LIVESTREAM_TWITTER_MESSAGE", CoD.LiveStream.GetLiveStreamUrl( f48_arg0, false ) ) )
	return f48_local0
end

local f0_local22 = function ( f49_arg0, f49_arg1 )
	f49_arg0:goBack( f49_arg1.controller )
	f49_arg0.occludedMenu:openPopup( "LiveStream", f49_arg1.controller )
end

local f0_local23 = function ( f50_arg0, f50_arg1 )
	f50_arg0:goBack()
end

local f0_local24 = function ( f51_arg0, f51_arg1 )
	if LUI.UIElement.handleGamepadButton( f51_arg0, f51_arg1 ) == true then
		return true
	elseif f51_arg1.down == true then
		if f51_arg1.qualifier == nil then
			local f51_local0 = Engine.GetCustomElementScrollSpeed()
			if f51_arg1.button == "up" then
				if f51_local0 < 0 then
					Engine.SetCustomElementScrollSpeed( 0 )
				else
					Engine.SetCustomElementScrollSpeed( f51_local0 + 1 )
				end
			elseif f51_arg1.button == "down" then
				if f51_local0 > 0 then
					Engine.SetCustomElementScrollSpeed( 0 )
				else
					Engine.SetCustomElementScrollSpeed( f51_local0 - 1 )
				end
			end
			return 
		end
	else
		Engine.SetCustomElementScrollSpeed( 0 )
	end
end

function LiveStreamTOS_AddButtonPrompt( f52_arg0, f52_arg1 )
	f52_arg0.buttonPromptList:addElement( f52_arg1 )
end

LUI.createMenu.LiveStreamTOS = function ( f53_arg0 )
	local f53_local0 = CoD.Menu.New( "LiveStreamTOS" )
	f53_local0:setOwner( f53_arg0 )
	f53_local0:registerEventHandler( "button_select_prompt", f0_local22 )
	f53_local0:registerEventHandler( "button_prompt_back", f0_local23 )
	f53_local0.button = LUI.UIButton.new( {
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
	f53_local0.button.handleGamepadButton = f0_local24
	f53_local0:addElement( f53_local0.button )
	f53_local0.button:processEvent( {
		name = "gain_focus"
	} )
	f53_local0.buttonRepeaterUp = LUI.UIButtonRepeater.new( "up", "moveup" )
	f53_local0:addElement( f53_local0.buttonRepeaterUp )
	f53_local0.buttonRepeaterDown = LUI.UIButtonRepeater.new( "down", "movedown" )
	f53_local0:addElement( f53_local0.buttonRepeaterDown )
	f53_local0:addLargePopupBackground()
	f53_local0.msgTitle = LUI.UIText.new()
	f53_local0.msgTitle:setLeftRight( true, true, 0, 0 )
	f53_local0.msgTitle:setTopBottom( true, false, 0, 0 + CoD.textSize.Condensed )
	f53_local0.msgTitle:setAlignment( LUI.Alignment.Left )
	f53_local0.msgTitle:setFont( CoD.fonts.Condensed )
	f53_local0.msgTitle:setText( Engine.Localize( "MPUI_TOS_TITLE" ) )
	f53_local0:addElement( f53_local0.msgTitle )
	f53_local0.subTitle = LUI.UIText.new()
	f53_local0.subTitle:setLeftRight( true, true, 0, 0 )
	f53_local0.subTitle:setTopBottom( true, false, 30, 30 + CoD.textSize.ExtraSmall )
	f53_local0.subTitle:setAlignment( LUI.Alignment.Left )
	f53_local0.subTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	f53_local0.subTitle:setFont( CoD.fonts.ExtraSmall )
	f53_local0.subTitle:setText( Engine.Localize( "MENU_LIVESTREAM_TOS_AGREEMENT" ) )
	f53_local0:addElement( f53_local0.subTitle )
	f53_local0:addSelectButton( Engine.Localize( "MPUI_TOS_AGREE" ), nil, "button_select_prompt" )
	f53_local0:addBackButton( Engine.Localize( "MPUI_TOS_REFUSE" ) )
	f53_local0.creditsContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 60,
		bottom = -90
	} )
	f53_local0:addElement( f53_local0.creditsContainer )
	f53_local0.creditsContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	f53_local0.creditsContainer:addElement( f53_local0.creditsContainer.border )
	f53_local0.creditsContainer.credits = LUI.UIElement.new( {
		left = 0,
		top = 35,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	f53_local0.creditsContainer:addElement( f53_local0.creditsContainer.credits )
	f53_local0.creditsContainer.credits:setupLiveStreamLegal()
	Engine.SetDvar( "ui_scrollSpeed", 0 )
	f53_local0.upRepeater = LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} )
	f53_local0.downRepeater = LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} )
	f53_local0:addElement( f53_local0.upRepeater )
	f53_local0:addElement( f53_local0.downRepeater )
	f53_local0.buttonPromptList = LUI.UIVerticalList.new( {
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
	f53_local0:addElement( f53_local0.buttonPromptList )
	f53_local0.addButtonPrompt = LiveStreamTOS_AddButtonPrompt
	f53_local0.moveImage = CoD.ButtonPrompt.new( "emblem_move", Engine.Localize( "MENU_LB_SCROLL_UP_SCROLL_DOWN" ) )
	f53_local0:addButtonPrompt( f53_local0.moveImage )
	return f53_local0
end

