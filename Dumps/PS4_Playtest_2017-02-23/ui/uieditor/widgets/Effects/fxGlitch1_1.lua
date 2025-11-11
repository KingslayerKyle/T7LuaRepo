CoD.fxGlitch1_1 = InheritFrom( LUI.UIElement )
CoD.fxGlitch1_1.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fxGlitch1_1 )
	self.id = "fxGlitch1_1"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 708 )
	self:setTopBottom( 0, 0, 0, 264 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 0, 0 )
	Image0:setTopBottom( 0, 1, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_effect_glitches_menu1" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 1, 0, 0 )
	Image00:setTopBottom( 0, 1, 0, 0 )
	Image00:setZoom( 150 )
	Image00:setImage( RegisterImage( "uie_t7_effect_glitches_menu1blur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

