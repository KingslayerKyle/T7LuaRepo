-- f545d12aaf9fc641129d30c9d0672dd5
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 34 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -1, 1 )
	Image:setTopBottom( true, true, -1, 1 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.5, 0.5, 0.42, 0.39 )
	Image:setupNineSliceShader( 26, 18 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
