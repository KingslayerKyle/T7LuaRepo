-- 971db9780a800ba5a8a9e88523ee477b
-- This hash is used for caching, delete to decompile the file again

CoD.ThrustMeterDots = InheritFrom( LUI.UIElement )
CoD.ThrustMeterDots.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeterDots )
	self.id = "ThrustMeterDots"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 138 )
	self:setTopBottom( true, false, 0, 36 )
	
	local dots = LUI.UIImage.new()
	dots:setLeftRight( true, false, -11, 149 )
	dots:setTopBottom( true, false, -5, 43 )
	dots:setRGB( 0.84, 0.95, 0.97 )
	dots:setAlpha( 0.65 )
	dots:setImage( RegisterImage( "uie_t7_hud_boost_dots" ) )
	dots:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	dots:setShaderVector( 0, 0.52, 0, 0, 0 )
	dots:setShaderVector( 1, 0.5, 0, 0, 0 )
	dots:setShaderVector( 2, -2.84, 0, 0, 0 )
	dots:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( dots )
	self.dots = dots
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( true, false, -11, 149 )
	fill:setTopBottom( true, false, -5, 43 )
	fill:setYRot( 180 )
	fill:setImage( RegisterImage( "uie_t7_hud_boost_fill" ) )
	fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	fill:setShaderVector( 0, 0.52, 0, 0, 0 )
	fill:setShaderVector( 1, 0.5, 0, 0, 0 )
	fill:setShaderVector( 2, -2.84, 0, 0, 0 )
	fill:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( fill )
	self.fill = fill
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
