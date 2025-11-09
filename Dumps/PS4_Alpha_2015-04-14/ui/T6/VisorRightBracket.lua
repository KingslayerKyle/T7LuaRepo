CoD.VisorRightBracket = {}
CoD.VisorRightBracket.DefaultAlpha = 1
CoD.VisorRightBracket.BracketWidth = 64
CoD.VisorRightBracket.BracketHeight = 490
CoD.VisorRightBracket.ExpandDuration = 250
CoD.VisorRightBracket.MoveDuration = 500
CoD.VisorRightBracket.ColorValue = {}
CoD.VisorRightBracket.ColorValue.r = 0.7
CoD.VisorRightBracket.ColorValue.b = 0.7
CoD.VisorRightBracket.ColorValue.g = 0.7
CoD.VisorRightBracket.DataBoxesTopOffset = -28
CoD.VisorRightBracket.AmmoLeftOffset = -45
CoD.VisorRightBracket.AmmoTopOffset = 2
CoD.VisorRightBracket.new = function ()
	local visorRightBracket = CoD.VisorImage.new( "visor_right_bracket", nil, CoD.VisorRightBracket.ColorValue )
	visorRightBracket:setLeftRight( false, false, 0, CoD.VisorRightBracket.BracketWidth )
	visorRightBracket:setTopBottom( false, false, 0, 0 )
	visorRightBracket:setAlpha( CoD.VisorRightBracket.DefaultAlpha )
	visorRightBracket:registerEventHandler( "bootup_expand", CoD.VisorRightBracket.BootupExpand )
	visorRightBracket:registerEventHandler( "bootup_half_right", CoD.VisorRightBracket.BootupHalfRight )
	visorRightBracket:registerEventHandler( "bootup_right", CoD.VisorRightBracket.BootupRight )
	visorRightBracket:registerEventHandler( "bootup_switch_to_hud", CoD.VisorRightBracket.BootupSwitchToHUD )
	CoD.VisorRightBracket.RightBracketUnwarpMaterial = RegisterMaterial( "visor_right_bracket_unwarp" )
	if CoD.ShadesHud.IsStealthLevel == true then
		CoD.VisorRightBracket.StealthRightBracketMaterial = RegisterMaterial( "hud_visor_right_bracket01_blend" )
		visorRightBracket:registerEventHandler( "green_alert", CoD.VisorRightBracket.GreenAlertUpdate )
		visorRightBracket:registerEventHandler( "yellow_alert", CoD.VisorRightBracket.YellowAlertUpdate )
		visorRightBracket:registerEventHandler( "red_alert", CoD.VisorRightBracket.RedAlertUpdate )
	end
	return visorRightBracket
end

CoD.VisorRightBracket.BootupExpand = function ( self, event )
	self:beginAnimation( "expand", CoD.VisorRightBracket.ExpandDuration, true, true )
	self:setTopBottom( false, false, -CoD.VisorRightBracket.BracketHeight / 4, CoD.VisorRightBracket.BracketHeight / 4 )
end

CoD.VisorRightBracket.BootupHalfRight = function ( self, event )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	self:beginAnimation( "half_right", CoD.VisorRightBracket.MoveDuration, true, true )
	self:setLeftRight( false, false, safeAreaWidth / 4 - CoD.VisorRightBracket.BracketWidth / 2, safeAreaWidth / 4 + CoD.VisorRightBracket.BracketWidth / 2 )
	self:setTopBottom( false, false, -CoD.VisorRightBracket.BracketHeight / 4, CoD.VisorRightBracket.BracketHeight / 4 )
end

CoD.VisorRightBracket.BootupRightAnimation = function ( self, duration )
	if not duration then
		duration = 0
	end
	local rightOffset = 15
	local topOffset = -12
	self:beginAnimation( "right", duration, true, true )
	self:setLeftRight( false, true, -CoD.VisorRightBracket.BracketWidth + rightOffset, rightOffset )
	self:setTopBottom( false, false, -CoD.VisorRightBracket.BracketHeight / 2 + topOffset, CoD.VisorRightBracket.BracketHeight / 2 + topOffset )
end

CoD.VisorRightBracket.BootupRight = function ( self, event )
	CoD.VisorRightBracket.BootupRightAnimation( self, CoD.VisorRightBracket.MoveDuration )
end

CoD.VisorRightBracket.BootupSwitchToHUD = function ( self, event )
	CoD.VisorRightBracket.BootupRightAnimation( self )
	if event.isFrontEnd == false and Dvar.ui_mapname:get() ~= "karma" then
		self.image:close()
		local rightOffset = 10
		local heightOffset = 5
		if CoD.ShadesHud.IsStealthLevel == true then
			self.stealthImage = LUI.UIImage.new()
			self.stealthImage:setLeftRight( true, true, -rightOffset, -rightOffset )
			self.stealthImage:setTopBottom( true, true, heightOffset, -heightOffset )
			self.stealthImage:setImage( CoD.VisorRightBracket.StealthRightBracketMaterial )
			self.stealthImage:setAlpha( 0 )
			self:addElement( self.stealthImage )
		end
		self.image = LUI.UIImage.new()
		self.image:setLeftRight( true, true, -rightOffset, -rightOffset )
		self.image:setTopBottom( true, true, heightOffset, -heightOffset )
		self.image:setImage( CoD.VisorRightBracket.RightBracketUnwarpMaterial )
		self.image:setAlpha( 0.25 )
		self:addElement( self.image )
	end
end

CoD.VisorRightBracket.ONSCREEN_DURATION = 5000
CoD.VisorRightBracket.PulseDuration = 500
CoD.VisorRightBracket.GreenAlertUpdate = function ( self, event )
	if self.stealthImage then
		self.stealthImage:setRGB( 1, 1, 1 )
		self.stealthImage:setAlpha( 0 )
		if self.alternatorTimer then
			self:closeStateAlternator()
		end
	end
end

CoD.VisorRightBracket.YellowAlertUpdate = function ( self, event )
	if self.stealthImage then
		self.stealthImage:setRGB( 1, 1, 0 )
		if self.alternatorTimer then
			self:closeStateAlternator()
		end
		self:alternateStates( CoD.VisorRightBracket.ONSCREEN_DURATION, CoD.VisorRightBracket.PulseBright, CoD.VisorRightBracket.PulseLow, CoD.VisorRightBracket.PulseDuration, CoD.VisorRightBracket.PulseDuration )
	end
end

CoD.VisorRightBracket.RedAlertUpdate = function ( self, event )
	if self.stealthImage then
		self.stealthImage:setRGB( 1, 0, 0 )
		if self.alternatorTimer then
			self:closeStateAlternator()
		end
		self:alternateStates( 0, CoD.VisorRightBracket.PulseBright, CoD.VisorRightBracket.PulseLow, CoD.VisorRightBracket.PulseDuration, CoD.VisorRightBracket.PulseDuration )
	end
end

CoD.VisorRightBracket.PulseBright = function ( self, time )
	if self.stealthImage then
		self.stealthImage:beginAnimation( "pulse_bright", time )
		self.stealthImage:setAlpha( 1 )
	end
end

CoD.VisorRightBracket.PulseLow = function ( self, time )
	if self.stealthImage then
		self.stealthImage:beginAnimation( "pulse_low", time )
		self.stealthImage:setAlpha( 0.3 )
	end
end

