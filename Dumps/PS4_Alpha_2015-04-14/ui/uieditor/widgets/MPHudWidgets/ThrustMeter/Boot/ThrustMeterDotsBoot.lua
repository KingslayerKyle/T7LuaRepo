CoD.ThrustMeterDotsBoot = InheritFrom( LUI.UIElement )
CoD.ThrustMeterDotsBoot.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeterDotsBoot )
	self.id = "ThrustMeterDotsBoot"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 138 )
	self:setTopBottom( true, false, 0, 36 )
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( true, false, 149, -11 )
	fill:setTopBottom( true, false, -4, 40 )
	fill:setRGB( 1, 1, 1 )
	fill:setImage( RegisterImage( "uie_t7_hud_boost_fill" ) )
	fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	fill:setShaderVector( 0, 0.52, 0, 0, 0 )
	fill:setShaderVector( 1, 0.5, 0, 0, 0 )
	fill:setShaderVector( 2, -2.84, 0, 0, 0 )
	fill:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( fill )
	self.fill = fill
	
	local dots = LUI.UIImage.new()
	dots:setLeftRight( true, false, -11, 149 )
	dots:setTopBottom( true, false, -4, 40 )
	dots:setRGB( 1, 1, 1 )
	dots:setImage( RegisterImage( "uie_t7_hud_boost_dots" ) )
	dots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( dots )
	self.dots = dots
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

