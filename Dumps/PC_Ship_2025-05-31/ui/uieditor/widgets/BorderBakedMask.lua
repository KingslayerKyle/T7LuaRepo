CoD.BorderBakedMask = InheritFrom( LUI.UIElement )
CoD.BorderBakedMask.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BorderBakedMask )
	self.id = "BorderBakedMask"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -3, 3 )
	Image:setTopBottom( true, true, -3, 3 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0.13, 0.13, 0, 0 )
	Image:setupNineSliceShader( 16, 16 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

