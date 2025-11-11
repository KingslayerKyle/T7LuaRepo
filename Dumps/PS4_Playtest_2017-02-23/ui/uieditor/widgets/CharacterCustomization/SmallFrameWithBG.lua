CoD.SmallFrameWithBG = InheritFrom( LUI.UIElement )
CoD.SmallFrameWithBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SmallFrameWithBG )
	self.id = "SmallFrameWithBG"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 123 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local TempBackground = LUI.UIImage.new()
	TempBackground:setLeftRight( 0, 1, 0, 0 )
	TempBackground:setTopBottom( 0, 1, 33, -33 )
	TempBackground:setRGB( 0, 0, 0 )
	TempBackground:setAlpha( 0.6 )
	self:addElement( TempBackground )
	self.TempBackground = TempBackground
	
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

