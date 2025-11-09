CoD.AirVehicleHUD = {}
CoD.AirVehicleHUD.TopBarHeight = 64
CoD.AirVehicleHUD.BottomBarHeight = 70
CoD.AirVehicleHUD.LeftBarWidth = 64
CoD.AirVehicleHUD.BottomTextOffset = 8
CoD.AirVehicleHUD.WeaponTypeWidth = 40
CoD.AirVehicleHUD.WeaponTypeHeight = CoD.textSize.Condensed
CoD.AirVehicleHUD.Alpha = 0.5
CoD.AirVehicleHUD.WeaponTypeSpacing = 25
CoD.AirVehicleHUD.HUDColor = {
	r = 0.18,
	g = 0.7,
	b = 0.59
}
CoD.AirVehicleHUD.new = function ( vehicle, controller, colorR, colorG, colorB, filterName )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self.filterName = filterName
	self.vehicle = vehicle
	self.controller = controller
	if not colorR then
		colorR = CoD.AirVehicleHUD.HUDColor.r
		colorG = CoD.AirVehicleHUD.HUDColor.g
		colorB = CoD.AirVehicleHUD.HUDColor.b
	end
	self.colorR = colorR
	self.colorG = colorG
	self.colorB = colorB
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	safeAreaWidth = 4 * safeAreaHeight / 3
	
	local centerBox = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -safeAreaWidth / 2,
		right = safeAreaWidth / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -safeAreaHeight / 2,
		bottom = safeAreaHeight / 2
	} )
	self:addElement( centerBox )
	self.centerBox = centerBox
	
	self.safeAreaContainer = LUI.UIElement.new()
	self.safeAreaContainer:sizeToSafeArea( controller )
	self:addElement( self.safeAreaContainer )
	local leftPromptScaleContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenMultiplier )
	leftPromptScaleContainer:setLeftRight( true, false, 0, 0 )
	leftPromptScaleContainer:setTopBottom( false, true, 0, 0 )
	self.safeAreaContainer:addElement( leftPromptScaleContainer )
	self.leftButtonPrompts = LUI.UIElement.new()
	self.leftButtonPrompts:setLeftRight( true, true, 0, 0 )
	self.leftButtonPrompts:setTopBottom( true, true, 0, 0 )
	leftPromptScaleContainer:addElement( self.leftButtonPrompts )
	local rightPromptScaleContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenMultiplier )
	rightPromptScaleContainer:setLeftRight( false, true, 0, 0 )
	rightPromptScaleContainer:setTopBottom( false, true, 0, 0 )
	self.safeAreaContainer:addElement( rightPromptScaleContainer )
	self.rightButtonPrompts = LUI.UIElement.new()
	self.rightButtonPrompts:setLeftRight( true, true, 0, 0 )
	self.rightButtonPrompts:setTopBottom( true, true, 0, 0 )
	rightPromptScaleContainer:addElement( self.rightButtonPrompts )
	self.addIRToggle = CoD.AirVehicleHUD.AddIRToggle
	self.addCompass = CoD.AirVehicleHUD.AddCompass
	self.addCrosshairDistance = CoD.AirVehicleHUD.AddCrosshairDistance
	self.addPitchMeters = CoD.AirVehicleHUD.AddPitchMeters
	self.addFakeHighAuto = CoD.AirVehicleHUD.AddFakeHighAuto
	self.addFake50mmAuto = CoD.AirVehicleHUD.AddFake50mmAuto
	self.addRecBox = CoD.AirVehicleHUD.AddRecBox
	self.addSignalBox = CoD.AirVehicleHUD.AddSignalBox
	self:registerEventHandler( "killstreak_damage", CoD.AirVehicleHUD.KillstreakDamage )
	self:registerEventHandler( "killstreak_damage_animate", CoD.AirVehicleHUD.KillstreakDamageAnimate )
	self:registerEventHandler( "hud_update_killstreak_hud", CoD.AirVehicleHUD.UpdateKillstreakHUD )
	self:registerEventHandler( "hud_update_refresh", CoD.AirVehicleHUD.UpdateVisibility )
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		CoD.AirVehicleHUD.UpdateVisibility( self, {
			controller = controller
		} )
	end )
	self:setAlpha( 0 )
	CoD.AirVehicleHUD.UpdateVisibility( self, {
		controller = controller
	} )
	Engine.SetSceneFilterConstant( controller, 4, 0, 0 )
	Engine.SetSceneFilterConstant( controller, 4, 0, 0 )
	Engine.SetSceneFilterConstant( controller, 4, 1, 0 )
	return self
end

CoD.AirVehicleHUD.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) then
		if self.visible ~= true or event.forceUpdate == true then
			self:setAlpha( 1 )
			self.visible = true
			local filterName = self.filterName
			filterName = filterName or "digital_noise_filter"
			if not self.disableSceneFilter then
				Engine.EnableSceneFilter( event.controller, 4, RegisterMaterial( filterName ) )
			else
				Engine.DisableSceneFilter( event.controller, 4 )
			end
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.visible = nil
		Engine.DisableSceneFilter( event.controller, 4 )
	end
end

CoD.AirVehicleHUD.KillstreakDamage = function ( self, event )
	if event.damage < 0 then
		return 
	end
	event.damage = math.max( event.damage, 25 )
	if not self.killstreakDamageTimer then
		self.killstreakDamageTimer = LUI.UITimer.new( 1, {
			name = "killstreak_damage_animate",
			controller = event.controller
		}, false, self )
	end
	self:addElement( self.killstreakDamageTimer )
	local damageValue = math.min( 2, event.damage / 200 )
	local damageDuration = math.min( 1000, 1000 * event.damage / 100 )
	if event.damage >= 600 then
		damageDuration = 5000
		self:setAlpha( 0 )
	end
	if not self.killstreakDamageValue then
		self.killstreakDamageValue = damageValue
		self.killstreakDamageDuration = damageDuration
		self.killstreakDamageTime = 0
	else
		self.killstreakDamageValue = math.max( self.killstreakDamageValue, damageValue )
		if self.killstreakDamageDuration - self.killstreakDamageTime < damageDuration then
			self.killstreakDamageDuration = damageDuration
			self.killstreakDamageTime = 0
		end
	end
end

CoD.AirVehicleHUD.KillstreakDamageAnimate = function ( self, event )
	self.killstreakDamageTime = self.killstreakDamageTime + event.timeElapsed
	local scaleFraction = 1 - self.killstreakDamageTime / self.killstreakDamageDuration
	if scaleFraction < 0 then
		self.killstreakDamageValue = nil
		self.killstreakDamageTime = nil
		self.killstreakDamageDuration = nil
		scaleFraction = 0
		event.timer:close()
		Engine.SetSceneFilterConstant( event.controller, 4, 0, 0 )
		return 
	else
		Engine.SetSceneFilterConstant( event.controller, 4, 0, self.killstreakDamageValue * scaleFraction )
	end
end

CoD.AirVehicleHUD.UpdateKillstreakHUD = function ( self, event )
	if event[self.vehicle] ~= true then
		self:close()
		Engine.DisableSceneFilter( event.controller, 4 )
		return 
	elseif self.opticalContainerText ~= nil then
		if event.infrared == true then
			self.opticalBorder:animateToState( "disabled" )
			self.opticalContainerText:animateToState( "disabled" )
			self.IRBorder:animateToState( "enabled" )
			self.IRContainerText:animateToState( "enabled" )
		else
			self.opticalBorder:animateToState( "enabled" )
			self.opticalContainerText:animateToState( "enabled" )
			self.IRBorder:animateToState( "disabled" )
			self.IRContainerText:animateToState( "default" )
		end
	end
end

CoD.AirVehicleHUD.RecordingTimerTick = function ( self, event )
	self.milliseconds = self.milliseconds + event.timeElapsed
	if self.milliseconds >= 1000 then
		self.seconds = self.seconds + 1
		self.milliseconds = self.milliseconds - 1000
	end
	local minutes = self.minutes
	local seconds = self.seconds
	local microseconds = math.floor( self.milliseconds / 10 )
	local secondsText = nil
	if seconds < 10 then
		secondsText = "0" .. seconds
	else
		secondsText = seconds
	end
	local microsecondsText = nil
	if microseconds < 10 then
		microsecondsText = "0" .. microseconds
	else
		microsecondsText = microseconds
	end
	self:setText( "00:" .. secondsText .. "." .. microsecondsText )
end

CoD.AirVehicleHUD.Pulse = function ( self, event )
	if not event.interrupted then
		self:animateToState( "default", 500 )
	end
end

CoD.AirVehicleHUD.Pulse2 = function ( self, event )
	if not event.interrupted then
		self:animateToState( "pulse", 500 )
	end
end

CoD.AirVehicleHUD.AddIRToggle = function ( self )
	if CoD.IS_KILLCAM_OR_SPECTATE( self.controller ) == 0 and not Engine.IsDemoPlaying() then
		local centerBox = self.centerBox
		local toggleBorderSize = 2
		local toggleBorderWidth = (CoD.AirVehicleHUD.WeaponTypeWidth + CoD.AirVehicleHUD.WeaponTypeSpacing) * 2 + 12
		local toggleBorderHeight = 39
		local toggleBorderTop = -toggleBorderHeight / 2 - toggleBorderHeight / 2
		local togglePrompt = LUI.UIText.new( {
			left = 83,
			top = toggleBorderTop + toggleBorderHeight / 2 - CoD.textSize.Default / 2,
			right = 83,
			bottom = toggleBorderTop + toggleBorderHeight / 2 + CoD.textSize.Default / 2,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = true
		} )
		centerBox:addElement( togglePrompt )
		togglePrompt:setText( Engine.Localize( " ^3[{+weapnext_inventory}]^7 " ) )
		local IRContainer = LUI.UIElement.new( {
			left = CoD.AirVehicleHUD.WeaponTypeSpacing - 3,
			top = -toggleBorderHeight + 3,
			right = CoD.AirVehicleHUD.WeaponTypeSpacing + CoD.AirVehicleHUD.WeaponTypeWidth + 6,
			bottom = -3,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = true
		} )
		centerBox:addElement( IRContainer )
		
		local IRBorder = CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, 0 )
		IRBorder:registerAnimationState( "enabled", {
			alpha = CoD.AirVehicleHUD.Alpha
		} )
		IRBorder:registerAnimationState( "disabled", {
			alpha = 0
		} )
		IRContainer:addElement( IRBorder )
		self.IRBorder = IRBorder
		
		local IRContainerText = LUI.UIText.new( {
			left = 0,
			top = -CoD.AirVehicleHUD.WeaponTypeHeight / 2,
			right = 0,
			bottom = CoD.AirVehicleHUD.WeaponTypeHeight / 2,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = true,
			bottomAnchor = false,
			red = self.colorR,
			green = self.colorG,
			blue = self.colorB,
			alpha = 0.25,
			font = CoD.fonts.Condensed
		} )
		IRContainer:addElement( IRContainerText )
		IRContainerText:registerAnimationState( "enabled", {
			alpha = 1
		} )
		IRContainerText:setText( "FLIR" )
		self.IRContainerText = IRContainerText
		local opticalContainer = LUI.UIElement.new( {
			left = -CoD.AirVehicleHUD.WeaponTypeWidth - CoD.AirVehicleHUD.WeaponTypeSpacing - 3,
			top = -toggleBorderHeight + 3,
			right = -CoD.AirVehicleHUD.WeaponTypeSpacing + 3,
			bottom = -3,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = true
		} )
		centerBox:addElement( opticalContainer )
		
		local opticalBorder = CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, CoD.AirVehicleHUD.Alpha )
		opticalBorder:registerAnimationState( "enabled", {
			alpha = CoD.AirVehicleHUD.Alpha
		} )
		opticalBorder:registerAnimationState( "disabled", {
			alpha = 0
		} )
		opticalContainer:addElement( opticalBorder )
		self.opticalBorder = opticalBorder
		
		local opticalContainerText = LUI.UIText.new( {
			left = 0,
			top = -CoD.AirVehicleHUD.WeaponTypeHeight / 2,
			right = 0,
			bottom = CoD.AirVehicleHUD.WeaponTypeHeight / 2,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = true,
			bottomAnchor = false,
			red = self.colorR,
			green = self.colorG,
			blue = self.colorB,
			alpha = 1,
			font = CoD.fonts.Condensed
		} )
		opticalContainer:addElement( opticalContainerText )
		opticalContainerText:registerAnimationState( "enabled", {
			alpha = 1
		} )
		opticalContainerText:registerAnimationState( "disabled", {
			alpha = 0.25
		} )
		opticalContainerText:setText( "OPT" )
		self.opticalContainerText = opticalContainerText
	end
end

CoD.AirVehicleHUD.AddCompass = function ( self )
	local compass = LUI.UIElement.new()
	compass:setLeftRight( false, false, -234, 234 )
	compass:setTopBottom( true, false, 50, 114 )
	compass:setImage( RegisterMaterial( "hud_horizontal_compass_white" ) )
	compass:setRGB( self.colorR, self.colorG, self.colorB )
	compass:setShaderVector( 0, 1, -0.5, 0, 0 )
	compass:setupHorizontalCompass()
	self:addElement( compass )
end

CoD.AirVehicleHUD.AddCrosshairDistance = function ( self, label )
	local centerBox = self.centerBox
	local distanceTextBox = LUI.UIElement.new( {
		left = 0,
		top = -CoD.textSize.Condensed - 4 - 120,
		right = 40,
		bottom = -120,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true
	} )
	centerBox:addElement( distanceTextBox )
	distanceTextBox:addElement( CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, CoD.AirVehicleHUD.Alpha ) )
	local distanceHeader = LUI.UIText.new( {
		left = 0,
		top = -CoD.textSize.Condensed,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		font = CoD.fonts.Condensed,
		alpha = CoD.AirVehicleHUD.Alpha
	} )
	distanceHeader:setText( label )
	distanceTextBox:addElement( distanceHeader )
	local distanceText = LUI.UIElement.new( {
		left = 0,
		top = -CoD.textSize.Condensed / 2,
		right = 0,
		bottom = CoD.textSize.Condensed / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		font = CoD.fonts.Condensed
	} )
	distanceText:setupCrosshairDistance()
	distanceTextBox:addElement( distanceText )
end

CoD.AirVehicleHUD.AddPitchMeters = function ( self )
	local centerBox = self.centerBox
	local pitchMeterLength = 280.8
	local leftBar = LUI.UIElement.new( {
		left = -pitchMeterLength / 2,
		top = -32,
		right = pitchMeterLength / 2,
		bottom = 32,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		zRot = 90
	} )
	centerBox:addElement( leftBar )
	local leftPitchMeter = LUI.UIElement.new( {
		left = 0,
		top = -1,
		right = 0,
		bottom = -1,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		material = RegisterMaterial( "hud_pitch_meter" ),
		shaderVector0 = {
			pitchMeterLength / 468,
			-0.5,
			0,
			0
		}
	} )
	leftPitchMeter:setupPitchMeter()
	leftBar:addElement( leftPitchMeter )
	local leftBarBorder = LUI.UIElement.new( {
		left = 0,
		top = 35,
		right = 0,
		bottom = 5,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	leftBar:addElement( leftBarBorder )
	leftBarBorder:addElement( CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, CoD.AirVehicleHUD.Alpha ) )
	local rightBar = LUI.UIElement.new( {
		left = -pitchMeterLength / 2,
		top = -32,
		right = pitchMeterLength / 2,
		bottom = 32,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		zRot = -90
	} )
	centerBox:addElement( rightBar )
	local rightPitchMeter = LUI.UIElement.new( {
		left = 0,
		top = 31,
		right = 0,
		bottom = -31,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		material = RegisterMaterial( "hud_pitch_meter" ),
		shaderVector0 = {
			pitchMeterLength / 468,
			-0.5,
			0,
			0
		}
	} )
	rightPitchMeter:setupPitchMeter()
	rightBar:addElement( rightPitchMeter )
	local rightBarBorder = LUI.UIElement.new( {
		left = 0,
		top = -5,
		right = 0,
		bottom = -36,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	rightBar:addElement( rightBarBorder )
	rightBarBorder:addElement( CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, CoD.AirVehicleHUD.Alpha ) )
end

CoD.AirVehicleHUD.AddFakeHighAuto = function ( self )
	local centerBox = self.centerBox
	local highTextBox = LUI.UIElement.new( {
		left = 0,
		top = CoD.AirVehicleHUD.TopBarHeight,
		right = 50,
		bottom = CoD.AirVehicleHUD.TopBarHeight + CoD.textSize.Condensed + 4,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	centerBox:addElement( highTextBox )
	highTextBox:addElement( CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, CoD.AirVehicleHUD.Alpha ) )
	local highText = LUI.UIText.new( {
		left = 0,
		top = -CoD.textSize.Condensed / 2,
		right = 0,
		bottom = CoD.textSize.Condensed / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		alpha = 1,
		font = CoD.fonts.Condensed
	} )
	highText:setText( "HIGH" )
	highText:registerAnimationState( "pulse", {
		alpha = 0.4
	} )
	highText:registerEventHandler( "transition_complete_pulse", CoD.AirVehicleHUD.Pulse )
	highText:registerEventHandler( "transition_complete_default", CoD.AirVehicleHUD.Pulse2 )
	highText:animateToState( "pulse" )
	highTextBox:addElement( highText )
	local autoText = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		font = CoD.fonts.Condensed,
		alpha = 0.25
	} )
	autoText:setText( "AUTO" )
	highTextBox:addElement( autoText )
end

CoD.AirVehicleHUD.AddFake50mmAuto = function ( self )
	local centerBox = self.centerBox
	local top = 20
	local width = 55
	local leftContainer = LUI.UIElement.new( {
		left = -width - CoD.AirVehicleHUD.WeaponTypeSpacing - 3,
		top = top + 3,
		right = -CoD.AirVehicleHUD.WeaponTypeSpacing + 3,
		bottom = top + CoD.AirVehicleHUD.BottomBarHeight - 3,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	centerBox:addElement( leftContainer )
	leftContainer:addElement( CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, CoD.AirVehicleHUD.Alpha ) )
	local leftContainerText = LUI.UIText.new( {
		left = 0,
		top = -CoD.AirVehicleHUD.WeaponTypeHeight / 2,
		right = 0,
		bottom = CoD.AirVehicleHUD.WeaponTypeHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		alpha = 1
	} )
	leftContainer:addElement( leftContainerText )
	leftContainerText:setText( "50MM" )
	leftContainerText:registerAnimationState( "pulse", {
		alpha = 0.4
	} )
	leftContainerText:registerEventHandler( "transition_complete_pulse", CoD.AirVehicleHUD.Pulse )
	leftContainerText:registerEventHandler( "transition_complete_default", CoD.AirVehicleHUD.Pulse2 )
	leftContainerText:animateToState( "pulse" )
	local rightContainer = LUI.UIElement.new( {
		left = CoD.AirVehicleHUD.WeaponTypeSpacing - 3,
		top = top + 3,
		right = CoD.AirVehicleHUD.WeaponTypeSpacing + width + 3,
		bottom = top + CoD.AirVehicleHUD.BottomBarHeight - 3,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	centerBox:addElement( rightContainer )
	rightContainer:addElement( CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, CoD.AirVehicleHUD.Alpha ) )
	local rightContainerText = LUI.UIText.new( {
		left = 0,
		top = -CoD.AirVehicleHUD.WeaponTypeHeight / 2,
		right = 0,
		bottom = CoD.AirVehicleHUD.WeaponTypeHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		alpha = 1
	} )
	rightContainer:addElement( rightContainerText )
	rightContainerText:setText( "AUTO" )
end

CoD.AirVehicleHUD.AddRecBox = function ( self )
	local recordingTextBox = LUI.UIElement.new( {
		left = -110,
		top = -CoD.textSize.Condensed - 4 - CoD.AirVehicleHUD.BottomBarHeight,
		right = -10,
		bottom = -CoD.AirVehicleHUD.BottomBarHeight,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self.centerBox:addElement( recordingTextBox )
	recordingTextBox:addElement( CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, CoD.AirVehicleHUD.Alpha * 0.5 ) )
	local recordingHeader = LUI.UIText.new( {
		left = -40,
		top = -CoD.textSize.Condensed / 2,
		right = 0,
		bottom = CoD.textSize.Condensed / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		font = CoD.fonts.Condensed,
		alpha = CoD.AirVehicleHUD.Alpha * 0.5
	} )
	recordingHeader:setText( "REC" )
	recordingTextBox:addElement( recordingHeader )
	local recordingText = LUI.UIText.new( {
		left = 13,
		top = -CoD.textSize.Condensed / 2,
		right = 14,
		bottom = CoD.textSize.Condensed / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		font = CoD.fonts.Condensed,
		alpha = CoD.AirVehicleHUD.Alpha * 0.5
	} )
	recordingText:setUseGameTime( true )
	recordingText:setText( "00:00.00" )
	recordingText.milliseconds = 0
	recordingText.seconds = 0
	recordingText:registerEventHandler( "countup_tick", CoD.AirVehicleHUD.RecordingTimerTick )
	recordingTextBox:addElement( LUI.UITimer.new( 10, "countup_tick", false, recordingText ) )
	recordingTextBox:addElement( recordingText )
end

CoD.AirVehicleHUD.AddSignalBox = function ( self )
	local signalTextBox = LUI.UIElement.new( {
		left = -110,
		top = -CoD.textSize.Condensed - 4 - CoD.AirVehicleHUD.BottomBarHeight - 42,
		right = -10,
		bottom = -CoD.AirVehicleHUD.BottomBarHeight - 42,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self.centerBox:addElement( signalTextBox )
	signalTextBox:addElement( CoD.BorderT6.new( 2, self.colorR, self.colorG, self.colorB, CoD.AirVehicleHUD.Alpha * 0.5 ) )
	local signalHeader = LUI.UIText.new( {
		left = -68,
		top = -CoD.textSize.Condensed / 2,
		right = 0,
		bottom = CoD.textSize.Condensed / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		font = CoD.fonts.Condensed,
		alpha = CoD.AirVehicleHUD.Alpha * 0.5
	} )
	signalHeader:setText( "SIGNAL" )
	signalTextBox:addElement( signalHeader )
	local strongText = LUI.UIText.new( {
		left = 0,
		top = -CoD.textSize.Condensed / 2,
		right = 0,
		bottom = CoD.textSize.Condensed / 2,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = self.colorR,
		green = self.colorG,
		blue = self.colorB,
		font = CoD.fonts.Condensed,
		alpha = CoD.AirVehicleHUD.Alpha * 0.5
	} )
	strongText:setText( "STRONG" )
	signalTextBox:addElement( strongText )
end

