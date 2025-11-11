CoD.FE_ListHeaderGlow = InheritFrom( LUI.UIElement )
CoD.FE_ListHeaderGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListHeaderGlow )
	self.id = "FE_ListHeaderGlow"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -12, 12 )
	Image:setTopBottom( 0, 1, -3, 3 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 24, 6 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

