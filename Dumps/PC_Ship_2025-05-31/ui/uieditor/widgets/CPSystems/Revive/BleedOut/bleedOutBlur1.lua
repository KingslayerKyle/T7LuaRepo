CoD.bleedOutBlur1 = InheritFrom( LUI.UIElement )
CoD.bleedOutBlur1.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.bleedOutBlur1 )
	self.id = "bleedOutBlur1"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 98 )
	self:setTopBottom( true, false, 0, 98 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -49, 49 )
	Image0:setTopBottom( false, false, -49, 49 )
	Image0:setRGB( 0.93, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_blur" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image0:setShaderVector( 0, 5, 5, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

