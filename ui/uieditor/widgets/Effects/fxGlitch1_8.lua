-- 60613c7b8e169d4bdee1ff777fb33860
-- This hash is used for caching, delete to decompile the file again

CoD.fxGlitch1_8 = InheritFrom( LUI.UIElement )
CoD.fxGlitch1_8.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fxGlitch1_8 )
	self.id = "fxGlitch1_8"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 472 )
	self:setTopBottom( true, false, 0, 56 )
	
	local Image031 = LUI.UIImage.new()
	Image031:setLeftRight( true, true, 0, 0 )
	Image031:setTopBottom( true, true, 0, 0 )
	Image031:setImage( RegisterImage( "uie_t7_effect_glitches_menu9" ) )
	Image031:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image031 )
	self.Image031 = Image031
	
	local Image0310 = LUI.UIImage.new()
	Image0310:setLeftRight( true, true, 0, 0 )
	Image0310:setTopBottom( true, true, 0, 0 )
	Image0310:setZoom( 150 )
	Image0310:setImage( RegisterImage( "uie_t7_effect_glitches_menu9lblur" ) )
	Image0310:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0310 )
	self.Image0310 = Image0310
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

