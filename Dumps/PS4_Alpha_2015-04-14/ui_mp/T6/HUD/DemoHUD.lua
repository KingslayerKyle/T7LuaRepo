require( "ui_mp.T6.HUD.DemoHighlightReel" )

CoD.DemoHUD = {}
CoD.DEMO_INFORMATION_SCREEN_NONE = 0
CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN = 1
CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT = 2
CoD.DEMO_INFORMATION_SCREEN_TRANSITION = 3
CoD.DEMO_INFORMATION_SCREEN_WAITING_FOR_DOWNLOAD = 4
CoD.DemoHUD.LastActivatedInformationScreen = CoD.DEMO_INFORMATION_SCREEN_NONE
CoD.DemoHUD.AddHUDWidgets = function ( self, event )
	local isDemoPlaying = Engine.IsDemoPlaying()
	local controller = event.controller
	if not isDemoPlaying then
		return 
	end
	local demoControls = LUI.createMenu.DemoControls( controller )
	self:addElement( demoControls )
	CoD.DemoHUD.AddInformationScreen( self )
	CoD.DemoHUD.AddDollyCamPictureWindow( self, controller )
	if Engine.IsDemoShoutcaster() == true then
		if self.SpectateHUD == nil then
			self:processEvent( {
				name = "hud_update_spectate",
				controller = controller
			} )
		end
		self:processEvent( {
			name = "hud_update_spectate",
			controller = controller
		} )
	end
	if event.activateDemoStartScreen then
		if CoD.DemoHUD.LastActivatedInformationScreen ~= CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
			CoD.DemoHUD.ActivateInformationScreen( self, {
				controller = controller,
				informationScreenType = CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN,
				animationTime = 0,
				animationState = "fade_in"
			} )
		end
	elseif event.openHighlightStartScreen then
		CoD.DemoHighlightReel.OpenStartHighlightReel( self, event )
	end
end

CoD.DemoHUD.ActivateInformationScreen = function ( self, event )
	CoD.DemoHUD.LastActivatedInformationScreen = event.informationScreenType
	if LUI.roots.UIRootFull.demoInformationScreenBlackBackground == nil then
		return 
	elseif event == nil then
		return 
	end
	local animationState = "fade_out"
	if event.animationState ~= nil then
		animationState = event.animationState
	end
	if event.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_NONE then
		return 
	elseif event.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN or event.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:animateToState( animationState, event.animationTime )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( Engine.Localize( "MENU_PREPARING" ) )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:animateToState( animationState, event.animationTime * 0.8 )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:animateToState( animationState, event.animationTime * 0.8 )
		if Engine.IsDemoShoutcaster() and event.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_OUT then
			self:processEvent( {
				name = "reload_shoutcaster_hud",
				controller = event.controller
			} )
		end
	end
	if event.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_TRANSITION then
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( "" )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:setAlpha( 0 )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:setAlpha( 1 )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:animateToState( animationState, event.animationTime )
	end
	if event.informationScreenType == CoD.DEMO_INFORMATION_SCREEN_WAITING_FOR_DOWNLOAD then
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground:animateToState( "fade_out", event.animationTime )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:animateToState( animationState, event.animationTime )
		LUI.roots.UIRootFull.demoInformationScreenInformationText:setText( Engine.Localize( "MENU_BUFFERING" ) )
		LUI.roots.UIRootFull.demoInformationScreenSpinner:animateToState( animationState, event.animationTime )
	end
end

CoD.DemoHUD.AddInformationScreen = function ( self )
	if LUI.roots.UIRootFull.demoInformationScreenContainer then
		return 
	else
		local demoInformationScreenContainer = LUI.UIContainer.new()
		demoInformationScreenContainer:setPriority( 100 )
		local blackBackgroundScreen = LUI.UIImage.new( {
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
		blackBackgroundScreen:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		blackBackgroundScreen:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		LUI.roots.UIRootFull.demoInformationScreenBlackBackground = blackBackgroundScreen
		demoInformationScreenContainer:addElement( blackBackgroundScreen )
		local informationText = LUI.UIText.new( {
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
		informationText:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		informationText:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		LUI.roots.UIRootFull.demoInformationScreenInformationText = informationText
		demoInformationScreenContainer:addElement( informationText )
		local spinnerSize = 60
		local informationSpinner = LUI.UIImage.new( {
			left = -spinnerSize / 2,
			top = CoD.textSize.Condensed,
			right = spinnerSize / 2,
			bottom = CoD.textSize.Condensed + spinnerSize,
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
		informationSpinner:setShaderVector( 0, 0, 0, 0, 0 )
		informationSpinner:registerAnimationState( "fade_in", {
			alpha = 1
		} )
		informationSpinner:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		LUI.roots.UIRootFull.demoInformationScreenSpinner = informationSpinner
		demoInformationScreenContainer:addElement( informationSpinner )
		LUI.roots.UIRootFull:addElement( demoInformationScreenContainer )
		LUI.roots.UIRootFull.demoInformationScreenContainer = demoInformationScreenContainer
	end
end

LUI.createMenu.DemoControls = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "DemoControls", controller )
	local width = 492
	local height = 94
	local demoControls = LUI.UIElement.new()
	demoControls:setLeftRight( false, false, -width / 2, width / 2 )
	demoControls:setTopBottom( false, true, -height - 6, -6 )
	demoControls:setupDemoControls()
	self:addElement( demoControls )
	return self
end

CoD.DemoHUD.DollyCamPictureWindowUpdateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and Engine.IsDemoPlaying() and Engine.IsDemoCameraEditMode() and Engine.GetDollyCamMarkerCount() > 0 and not Engine.IsDemoClipPreviewRunning( controller ) then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

CoD.DemoHUD.UpdateDollyCamPictureWindowInformation = function ( self, event )
	local dollycamContainer = self:getParent()
	local controller = dollycamContainer.controller
	local dollycamMarkerInformation = Engine.GetDollyCamMarkerInformationForTime( controller, "previewMarkerDisplayName" )
	if dollycamMarkerInformation ~= dollycamContainer.previewCameraText then
		if dollycamMarkerInformation == "" then
			dollycamContainer.gameTimer:setTopBottom( true, false, 10, 30 )
			dollycamContainer.previewCameraTitle:setAlpha( 0 )
		else
			dollycamContainer.gameTimer:setTopBottom( true, false, 35, 55 )
			dollycamContainer.previewCameraTitle:setText( dollycamMarkerInformation )
			dollycamContainer.previewCameraTitle:setAlpha( 1 )
			dollycamContainer.previewCameraSpeedTitle:setText( Engine.GetDollyCamMarkerInformationForTime( controller, "timeScaleModeAndInterpolatedValue" ) )
			dollycamContainer.previewCameraSpeedTitle:setAlpha( 1 )
		end
		dollycamContainer.previewCameraText = dollycamMarkerInformation
	end
	if Engine.CurrentGameTime() > 0 then
		self:setTimeLeft( Engine.CurrentGameTime(), true )
	end
end

CoD.DemoHUD.AddDollyCamPictureWindow = function ( self, controller )
	local dollycamWindowContainer = LUI.UIContainer.new()
	local dollycamWindowFrame = LUI.UIImage.new( {
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
	dollycamWindowFrame:setPriority( -100 )
	dollycamWindowContainer:addElement( dollycamWindowFrame )
	local dollycamWindow = LUI.UIImage.new( {
		left = 7,
		top = 7,
		right = 237,
		bottom = 237,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1,
		material = RegisterMaterial( "dollycam2d" )
	} )
	dollycamWindow:setPriority( -50 )
	dollycamWindowContainer:addElement( dollycamWindow )
	dollycamWindowContainer.gameTimer = CoD.DistFieldText.new( {
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
	CoD.CountdownTimer.Setup( dollycamWindowContainer.gameTimer, 0, true )
	dollycamWindowContainer.controller = controller
	dollycamWindowContainer.gameTimer:registerEventHandler( "countdown_tick", CoD.DemoHUD.UpdateDollyCamPictureWindowInformation )
	dollycamWindowContainer:addElement( dollycamWindowContainer.gameTimer )
	dollycamWindowContainer.previewCameraTitle = LUI.UIText.new( {
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
	dollycamWindowContainer:addElement( dollycamWindowContainer.previewCameraTitle )
	dollycamWindowContainer.previewCameraSpeedTitle = LUI.UIText.new( {
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
	dollycamWindowContainer:addElement( dollycamWindowContainer.previewCameraSpeedTitle )
	self.safeArea:addElement( dollycamWindowContainer )
	dollycamWindowContainer.gameTimer:setTimeLeft( 100000 )
	dollycamWindowContainer.visible = true
	dollycamWindowContainer.previewCameraText = nil
	CoD.DemoHUD.DollyCamPictureWindowUpdateVisibility( dollycamWindowContainer, {
		controller = controller
	} )
	dollycamWindowContainer:registerEventHandler( "update_dollycam_window_visibility", CoD.DemoHUD.DollyCamPictureWindowUpdateVisibility )
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		CoD.DemoHUD.DollyCamPictureWindowUpdateVisibility( self, {
			controller = controller
		} )
	end )
end

