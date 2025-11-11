CoD.FE_ButtonFocus = InheritFrom( LUI.UIElement )
CoD.FE_ButtonFocus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonFocus )
	self.id = "FE_ButtonFocus"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 126 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -12, 12 )
	Image:setTopBottom( 0, 1, -9, 9 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0, 0, 0.38, 0.2 )
	Image:setupNineSliceShader( 18, 18 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

