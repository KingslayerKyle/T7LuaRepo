CoD.RCCar = {}
LUI.createMenu.rc_car_mp = function ( controller )
	local self = CoD.AirVehicleHUD.new( "rc_car_mp", controller, CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.disableSceneFilter = true
	CoD.AirVehicleHUD.UpdateVisibility( self, {
		controller = controller,
		forceUpdate = true
	} )
	self:addCompass()
	if CoD.IS_KILLCAM_OR_SPECTATE( controller ) == 0 and not Engine.IsDemoPlaying() then
		local boostPrompt = LUI.UIText.new()
		boostPrompt:setLeftRight( true, false, 0, 0 )
		boostPrompt:setTopBottom( false, true, -CoD.textSize.Default * 3, -CoD.textSize.Default * 2 )
		boostPrompt:setText( Engine.Localize( "PLATFORM_RC_BOMB_BOOST", Engine.KeyBinding( controller, "+vehicleboost" ) ) )
		boostPrompt:setFont( CoD.fonts.Default )
		boostPrompt:setRGB( self.colorR, self.colorG, self.colorB )
		self.leftButtonPrompts:addElement( boostPrompt )
		local detonatePrompt = LUI.UIText.new()
		detonatePrompt:setLeftRight( true, false, 0, 0 )
		detonatePrompt:setTopBottom( false, true, -CoD.textSize.Default * 2, -CoD.textSize.Default )
		detonatePrompt:setText( Engine.Localize( "PLATFORM_RC_BOMB_DETONATE", Engine.KeyBinding( controller, "+attack" ) ) )
		detonatePrompt:setFont( CoD.fonts.Default )
		detonatePrompt:setRGB( self.colorR, self.colorG, self.colorB )
		self.leftButtonPrompts:addElement( detonatePrompt )
		local handbrakePrompt = LUI.UIText.new()
		handbrakePrompt:setLeftRight( true, false, 0, 0 )
		handbrakePrompt:setTopBottom( false, true, -CoD.textSize.Default, 0 )
		handbrakePrompt:setText( Engine.Localize( "PLATFORM_RC_BOMB_HANDBRAKE", Engine.KeyBinding( controller, "+speed_throw" ) ) )
		handbrakePrompt:setFont( CoD.fonts.Default )
		handbrakePrompt:setRGB( self.colorR, self.colorG, self.colorB )
		self.leftButtonPrompts:addElement( handbrakePrompt )
	end
	return self
end

