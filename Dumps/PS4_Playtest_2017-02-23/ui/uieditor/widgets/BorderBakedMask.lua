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
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -4, 4 )
	Image:setTopBottom( 0, 1, -4, 4 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 24, 24 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

