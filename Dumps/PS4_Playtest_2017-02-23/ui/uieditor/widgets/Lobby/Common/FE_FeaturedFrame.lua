CoD.FE_FeaturedFrame = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_FeaturedFrame )
	self.id = "FE_FeaturedFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 75 )
	self:setTopBottom( 0, 0, 0, 51 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -2, 2 )
	Image:setTopBottom( 0, 1, -2, 2 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0, 0, 0.42, 0.39 )
	Image:setupNineSliceShader( 39, 27 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

