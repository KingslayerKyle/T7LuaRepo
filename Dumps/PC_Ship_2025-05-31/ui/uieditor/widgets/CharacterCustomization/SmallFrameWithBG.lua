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
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 22 )
	
	local TempBackground = LUI.UIImage.new()
	TempBackground:setLeftRight( true, true, 0, 0 )
	TempBackground:setTopBottom( true, true, 22, -22 )
	TempBackground:setRGB( 0, 0, 0 )
	TempBackground:setAlpha( 0.6 )
	self:addElement( TempBackground )
	self.TempBackground = TempBackground
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -1, 1 )
	Image:setTopBottom( true, true, -1, 1 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.05, 0.17, 0, 0 )
	Image:setupNineSliceShader( 4, 4 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

