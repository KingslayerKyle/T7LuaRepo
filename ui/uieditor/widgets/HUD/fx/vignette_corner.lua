-- 64f992473206a98aaaddd06d8b58e41c
-- This hash is used for caching, delete to decompile the file again

CoD.vignette_corner = InheritFrom( LUI.UIElement )
CoD.vignette_corner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vignette_corner )
	self.id = "vignette_corner"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 458 )
	self:setTopBottom( true, false, 0, 297 )
	
	local VignetteLeft = LUI.UIImage.new()
	VignetteLeft:setLeftRight( true, false, 0, 458 )
	VignetteLeft:setTopBottom( false, true, -297.08, 0 )
	VignetteLeft:setImage( RegisterImage( "uie_img_t7_hud_fx_vignette_corner" ) )
	VignetteLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( VignetteLeft )
	self.VignetteLeft = VignetteLeft
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

