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
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 22 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -1, 1 )
	Image:setTopBottom( true, true, -1, 1 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.02, 0.01, 0, 0 )
	Image:setupNineSliceShader( 4, 4 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

