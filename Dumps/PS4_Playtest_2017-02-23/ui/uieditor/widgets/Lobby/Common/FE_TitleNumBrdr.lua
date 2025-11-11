CoD.FE_TitleNumBrdr = InheritFrom( LUI.UIElement )
CoD.FE_TitleNumBrdr.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleNumBrdr )
	self.id = "FE_TitleNumBrdr"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 123 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -2, 2 )
	Image:setTopBottom( 0, 1, -2, 2 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 6, 6 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

