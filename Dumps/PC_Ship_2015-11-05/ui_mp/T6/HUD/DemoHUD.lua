require( "ui_mp.T6.HUD.DemoHighlightReel" )

CoD.DemoHUD = {}
CoD.DEMO_INFORMATION_SCREEN_NONE = 0
CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN = 1
CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT = 2
CoD.DEMO_INFORMATION_SCREEN_TRANSITION = 3
CoD.DEMO_INFORMATION_SCREEN_WAITING_FOR_DOWNLOAD = 4
CoD.DemoHUD.LastActivatedInformationScreen = CoD.DEMO_INFORMATION_SCREEN_NONE
CoD.DemoHUD.AddHUDWidgets = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.IsDemoPlaying()
	local f1_local1 = f1_arg1.controller
	if not f1_local0 then
		return 
	end
	CoD.DemoHUD.AddInformationScreen( f1_arg0 )
	if Engine.IsDemoShoutcaster() == true then
		if f1_arg0.SpectateHUD == nil then
			f1_arg0:processEvent( {
				name = "hud_update_spectate",
				controller = f1_local1
			} )
		end
		f1_arg0:processEvent( {
			name = "hud_update_spectate",
			controller = f1_local1
		} )
	end
	if f1_arg1.activateDemoStartScreen then
		if CoD.DemoHUD.LastActivatedInformationScreen ~= CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
			CoD.DemoHUD.ActivateInformationScreen( f1_arg0, {
				controller = f1_local1,
				informationScreenType = CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN,
				animationTime = 0,
				animationState = "fade_in"
			} )
		end
	elseif f1_arg1.openHighlightStartScreen then
		CoD.DemoHighlightReel.OpenStartHighlightReel( f1_arg0, f1_arg1 )
	end
end

CoD.DemoHUD.ActivateInformationScreen = function ( f2_arg0, f2_arg1 )
	CoD.DemoHUD.LastActivatedInformationScreen = f2_arg1.informationScreenType
	if LUI.roots.UIRootFull.demoInformationScreenBlackBackground == nil then
		return 
	elseif f2_arg1 == nil then
		return 
	end
	local f2_local0 = "fade_out"
	if f2_arg1.animationState ~= nil then
		f2_local0 = f2_arg1.animationState
	end
	if f2_arg1.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_NONE then
		return 
	elseif f2_arg1.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN or f2_arg1.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:animateToState( f2_local0, f2_arg1.animationTime )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( Engine.Localize( "MENU_PREPARING" ) )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:animateToState( f2_local0, f2_arg1.animationTime * 0.8 )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:animateToState( f2_local0, f2_arg1.animationTime * 0.8 )
		if Engine.IsDemoShoutcaster() and f2_arg1.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
			f2_arg0:processEvent( {
				name = "reload_shoutcaster_hud",
				controller = f2_arg1.controller
			} )
		end
	end
	if f2_arg1.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_TRANSITION then
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( "" )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:setAlpha( 1 )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:animateToState( f2_local0, f2_arg1.animationTime )
	end
	if f2_arg1.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_WAITING_FOR_DOWNLOAD then
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:animateToState( "fade_out", f2_arg1.animationTime )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:animateToState( f2_local0, f2_arg1.animationTime )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( Engine.Localize( "MENU_BUFFERING" ) )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:animateToState( f2_local0, f2_arg1.animationTime )
	end
end

CoD.DemoHUD.AddInformationScreen = function ( f3_arg0 )
	if LUI.roots.UIRootFull.demoInformationScreenContainer then
		return 
	else
		local self = LUI.UIContainer.new()
		self:setPriority( 100 )
		local f3_local1 = LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 0
		} )
		f3_local1:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		f3_local1:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground = f3_local1
		self:addElement( f3_local1 )
		local f3_local2 = LUI.UIText.new( {
			left = 0,
			top = -CoD.textSize.Condensed / 2,
			right = 0,
			bottom = CoD.textSize.Condensed / 2,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = true,
			bottomAnchor = false,
			font = CoD.fonts.Condensed,
			alignment = LUI.Alignment.Center,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0
		} )
		f3_local2:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		f3_local2:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		LUI.roots.UIRootFull.demoInformationScreenInformationText = f3_local2
		self:addElement( f3_local2 )
		local f3_local3 = 60
		local f3_local4 = LUI.UIImage.new( {
			left = -f3_local3 / 2,
			top = CoD.textSize.Condensed,
			right = f3_local3 / 2,
			bottom = CoD.textSize.Condensed + f3_local3,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0,
			material = RegisterMaterial( "lui_loader" )
		} )
		f3_local4:setShaderVector( 0, 0, 0, 0, 0 )
		f3_local4:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		f3_local4:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		LUI.roots.UIRootFull.demoInformationScreenSpinner = f3_local4
		self:addElement( f3_local4 )
		LUI.roots.UIRootFull:addElement( self )
		LUI.roots.UIRootFull.demoInformationScreenContainer = self
	end
end

CoD.DemoHUD.DollyCamPictureWindowUpdateVisibility = function ( f4_arg0, f4_arg1 )
	if not Engine.IsVisibilityBitSet( f4_arg1.controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and Engine.IsDemoPlaying() and Engine.IsDemoCameraEditMode() and Engine.GetDollyCamMarkerCount() > 0 and not Engine.IsDemoClipPreviewRunning() then
		if not f4_arg0.visible then
			f4_arg0:setAlpha( 1 )
			f4_arg0.visible = true
		end
	elseif f4_arg0.visible then
		f4_arg0:setAlpha( 0 )
		f4_arg0.visible = nil
	end
end

CoD.DemoHUD.UpdateDollyCamPictureWindowInformation = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0:getParent()
	local f5_local1 = f5_local0.controller
	local f5_local2 = Engine.GetDollyCamMarkerInformationForTime( f5_local1, "previewMarkerDisplayName" )
	if f5_local2 ~= f5_local0.previewCameraText then
		if f5_local2 == "" then
			f5_local0.gameTimer:setTopBottom( true, false, 10, 30 )
			f5_local0.previewCameraTitle:setAlpha( 0 )
		else
			f5_local0.gameTimer:setTopBottom( true, false, 35, 55 )
			f5_local0.previewCameraTitle:setText( f5_local2 )
			f5_local0.previewCameraTitle:setAlpha( 1 )
			f5_local0.previewCameraSpeedTitle:setText( Engine.GetDollyCamMarkerInformationForTime( f5_local1, "timeScaleModeAndInterpolatedValue" ) )
			f5_local0.previewCameraSpeedTitle:setAlpha( 1 )
		end
		f5_local0.previewCameraText = f5_local2
	end
	if Engine.CurrentGameTime() > 0 then
		f5_arg0:setTimeLeft( Engine.CurrentGameTime(), true )
	end
end

CoD.DemoHUD.AddDollyCamPictureWindow = function ( menu, controller )
	local self = LUI.UIContainer.new()
	local f6_local1 = LUI.UIImage.new( {
		left = 4,
		top = 4,
		right = 240,
		bottom = 240,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1,
		material = RegisterMaterial( "demo_timeline_faded" )
	} )
	f6_local1:setPriority( -100 )
	self:addElement( f6_local1 )
	local f6_local2 = LUI.UIImage.new( {
		left = 7,
		top = 7,
		right = 237,
		bottom = 237,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	f6_local2:setPriority( -50 )
	self:addElement( f6_local2 )
	self.gameTimer = CoD.DistFieldText.new( {
		left = 10,
		top = 10,
		right = 237,
		bottom = 30,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	}, nil, nil, -1, -1, 0.08 )
	CoD.CountdownTimer.Setup( self.gameTimer, 0, true )
	self.controller = controller
	self.gameTimer:registerEventHandler( "countdown_tick", CoD.DemoHUD.UpdateDollyCamPictureWindowInformation )
	self:addElement( self.gameTimer )
	self.previewCameraTitle = LUI.UIText.new( {
		left = 10,
		top = 10,
		right = 237,
		bottom = 30,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0
	} )
	self:addElement( self.previewCameraTitle )
	self.previewCameraSpeedTitle = LUI.UIText.new( {
		left = 10,
		top = 215,
		right = 237,
		bottom = 235,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0
	} )
	self:addElement( self.previewCameraSpeedTitle )
	menu.safeArea:addElement( self )
	self.gameTimer:setTimeLeft( 100000 )
	self.visible = true
	self.previewCameraText = nil
	CoD.DemoHUD.DollyCamPictureWindowUpdateVisibility( self, {
		controller = controller
	} )
	self:registerEventHandler( "update_dollycam_window_visibility", CoD.DemoHUD.DollyCamPictureWindowUpdateVisibility )
	menu:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		CoD.DemoHUD.DollyCamPictureWindowUpdateVisibility( menu, {
			controller = controller
		} )
	end )
end

