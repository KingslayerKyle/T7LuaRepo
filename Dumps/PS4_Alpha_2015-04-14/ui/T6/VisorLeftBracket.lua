CoD.VisorLeftBracket = {}
CoD.VisorLeftBracket.DefaultAlpha = 1
CoD.VisorLeftBracket.BracketWidth = 64
CoD.VisorLeftBracket.BracketHeight = 512
CoD.VisorLeftBracket.ExpandDuration = 250
CoD.VisorLeftBracket.MoveDuration = 500
CoD.VisorLeftBracket.ColorValue = {}
CoD.VisorLeftBracket.ColorValue.r = 0.7
CoD.VisorLeftBracket.ColorValue.b = 0.7
CoD.VisorLeftBracket.ColorValue.g = 0.7
CoD.VisorLeftBracket.new = function ()
	local visorLeftBracket = CoD.VisorImage.new( "visor_left_bracket", nil, CoD.VisorLeftBracket.ColorValue )
	visorLeftBracket:setLeftRight( false, false, -CoD.VisorLeftBracket.BracketWidth, 0 )
	visorLeftBracket:setTopBottom( false, false, 0, 0 )
	visorLeftBracket:setAlpha( CoD.VisorLeftBracket.DefaultAlpha )
	visorLeftBracket:registerEventHandler( "bootup_expand", CoD.VisorLeftBracket.BootupExpand )
	visorLeftBracket:registerEventHandler( "bootup_half_left", CoD.VisorLeftBracket.BootupHalfLeft )
	visorLeftBracket:registerEventHandler( "bootup_left", CoD.VisorLeftBracket.BootupLeft )
	visorLeftBracket:registerEventHandler( "bootup_switch_to_hud", CoD.VisorLeftBracket.BootupSwitchToHUD )
	CoD.VisorLeftBracket.LeftBracketUnwarpMaterial = RegisterMaterial( "visor_left_bracket_unwarp" )
	if CoD.ShadesHud.IsStealthLevel == true then
		CoD.VisorLeftBracket.StealthLeftBracketMaterial = RegisterMaterial( "hud_visor_left_bracket01_blend" )
		visorLeftBracket:registerEventHandler( "green_alert", CoD.VisorLeftBracket.GreenAlertUpdate )
		visorLeftBracket:registerEventHandler( "yellow_alert", CoD.VisorLeftBracket.YellowAlertUpdate )
		visorLeftBracket:registerEventHandler( "red_alert", CoD.VisorLeftBracket.RedAlertUpdate )
	end
	return visorLeftBracket
end

CoD.VisorLeftBracket.BootupExpand = function ( self, event )
	self:beginAnimation( "expand", CoD.VisorLeftBracket.ExpandDuration, true, true )
	self:setTopBottom( false, false, -CoD.VisorLeftBracket.BracketHeight / 4, CoD.VisorLeftBracket.BracketHeight / 4 )
end

CoD.VisorLeftBracket.BootupHalfLeft = function ( self, event )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	self:beginAnimation( "half_left", CoD.VisorLeftBracket.MoveDuration, true, true )
	self:setLeftRight( false, false, -safeAreaWidth / 4 - CoD.VisorLeftBracket.BracketWidth / 2, -safeAreaWidth / 4 + CoD.VisorLeftBracket.BracketWidth / 2 )
	self:setTopBottom( false, false, -CoD.VisorLeftBracket.BracketHeight / 4, CoD.VisorLeftBracket.BracketHeight / 4 )
end

CoD.VisorLeftBracket.BootupLefttAnimation = function ( self, duration )
	if not duration then
		duration = 0
	end
	local leftOffset = -20
	self:beginAnimation( "left", duration, true, true )
	self:setLeftRight( true, false, leftOffset, CoD.VisorLeftBracket.BracketWidth + leftOffset )
	self:setTopBottom( false, false, -CoD.VisorLeftBracket.BracketHeight / 2, CoD.VisorLeftBracket.BracketHeight / 2 )
end

CoD.VisorLeftBracket.BootupLeft = function ( self, event )
	CoD.VisorLeftBracket.BootupLefttAnimation( self, CoD.VisorLeftBracket.MoveDuration )
end

CoD.VisorLeftBracket.BootupSwitchToHUD = function ( self, event )
	CoD.VisorLeftBracket.BootupLefttAnimation( self )
	if event.isFrontEnd == false and Dvar.ui_mapname:get() ~= "karma" then
		self.image:close()
		local leftOffset = 8
		local heightOffset = 5
		if CoD.ShadesHud.IsStealthLevel == true then
			self.stealthImage = LUI.UIImage.new()
			self.stealthImage:setLeftRight( true, true, leftOffset, leftOffset )
			self.stealthImage:setTopBottom( true, true, heightOffset, -heightOffset )
			self.stealthImage:setImage( CoD.VisorLeftBracket.StealthLeftBracketMaterial )
			self.stealthImage:setAlpha( 0 )
			self:addElement( self.stealthImage )
		end
		self.image = LUI.UIImage.new()
		self.image:setLeftRight( true, true, leftOffset, leftOffset )
		self.image:setTopBottom( true, true, heightOffset, -heightOffset )
		self.image:setImage( CoD.VisorLeftBracket.LeftBracketUnwarpMaterial )
		self.image:setAlpha( 0.25 )
		self:addElement( self.image )
	end
end

CoD.VisorLeftBracket.ONSCREEN_DURATION = 5000
CoD.VisorLeftBracket.PulseDuration = 500
CoD.VisorLeftBracket.GreenAlertUpdate = function ( self, event )
	if self.stealthImage then
		self.stealthImage:setRGB( 1, 1, 1 )
		self.stealthImage:setAlpha( 0 )
		if self.alternatorTimer then
			self:closeStateAlternator()
		end
	end
end

CoD.VisorLeftBracket.YellowAlertUpdate = function ( self, event )
	if self.stealthImage then
		self.stealthImage:setRGB( 1, 1, 0 )
		if self.alternatorTimer then
			self:closeStateAlternator()
		end
		self:alternateStates( CoD.VisorLeftBracket.ONSCREEN_DURATION, CoD.VisorLeftBracket.PulseBright, CoD.VisorLeftBracket.PulseLow, CoD.VisorLeftBracket.PulseDuration, CoD.VisorLeftBracket.PulseDuration )
	end
end

CoD.VisorLeftBracket.RedAlertUpdate = function ( self, event )
	if self.stealthImage then
		self.stealthImage:setRGB( 1, 0, 0 )
		if self.alternatorTimer then
			self:closeStateAlternator()
		end
		self:alternateStates( 0, CoD.VisorLeftBracket.PulseBright, CoD.VisorLeftBracket.PulseLow, CoD.VisorLeftBracket.PulseDuration, CoD.VisorLeftBracket.PulseDuration )
	end
end

CoD.VisorLeftBracket.PulseBright = function ( self, time )
	if self.stealthImage then
		self.stealthImage:beginAnimation( "pulse_bright", time )
		self.stealthImage:setAlpha( 1 )
	end
end

CoD.VisorLeftBracket.PulseLow = function ( self, time )
	if self.stealthImage then
		self.stealthImage:beginAnimation( "pulse_low", time )
		self.stealthImage:setAlpha( 0.3 )
	end
end

