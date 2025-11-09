CoD.AbilityWheel_Pixel = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_Pixel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_Pixel )
	self.id = "AbilityWheel_Pixel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 8 )
	
	local Image19 = LUI.UIImage.new()
	Image19:setLeftRight( true, false, 0, 8 )
	Image19:setTopBottom( true, false, 0, 8 )
	Image19:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixel" ) )
	Image19:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image19 )
	self.Image19 = Image19
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, 0, 8 )
	Image20:setTopBottom( true, false, 0, 8 )
	Image20:setZoom( 20 )
	Image20:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixelblur" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

