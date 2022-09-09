-- 38e30ecdb58125fc3141e776c4e47fa4
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_dart_VignetteBlurWidget = InheritFrom( LUI.UIElement )
CoD.vhud_dart_VignetteBlurWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_VignetteBlurWidget )
	self.id = "vhud_dart_VignetteBlurWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 458 )
	self:setTopBottom( true, false, 0, 356 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlevignetteblur" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image0:setShaderVector( 0, 30, 30, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
