CoD.vignette_corner_right = InheritFrom( LUI.UIElement )
CoD.vignette_corner_right.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vignette_corner_right )
	self.id = "vignette_corner_right"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 456 )
	self:setTopBottom( true, false, 0, 297 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 456, 0 )
	Image0:setTopBottom( true, false, 0, 297.08 )
	Image0:setImage( RegisterImage( "uie_img_t7_hud_fx_vignette_corner" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

