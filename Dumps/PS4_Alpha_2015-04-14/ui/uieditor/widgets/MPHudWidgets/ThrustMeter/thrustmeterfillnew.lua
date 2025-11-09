CoD.ThrustMeterFillNew = InheritFrom( LUI.UIElement )
CoD.ThrustMeterFillNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeterFillNew )
	self.id = "ThrustMeterFillNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 92 )
	self:setTopBottom( true, false, 0, 48 )
	
	local thrustMeterFill = LUI.UIImage.new()
	thrustMeterFill:setLeftRight( true, true, 0, 0 )
	thrustMeterFill:setTopBottom( true, true, 0, 0 )
	thrustMeterFill:setRGB( 1, 1, 1 )
	thrustMeterFill:setImage( RegisterImage( "uie_t7_hud_boost_meter_dots" ) )
	thrustMeterFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	thrustMeterFill:setShaderVector( 0, 0.54, 0, 0, 0 )
	thrustMeterFill:setShaderVector( 1, 1, 0, 0, 0 )
	thrustMeterFill:setShaderVector( 2, -3, 0, 0, 0 )
	thrustMeterFill:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( thrustMeterFill )
	self.thrustMeterFill = thrustMeterFill
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

