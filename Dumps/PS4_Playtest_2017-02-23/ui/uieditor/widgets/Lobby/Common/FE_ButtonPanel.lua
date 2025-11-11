CoD.FE_ButtonPanel = InheritFrom( LUI.UIElement )
CoD.FE_ButtonPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonPanel )
	self.id = "FE_ButtonPanel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 123 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -2, 2 )
	Image:setTopBottom( 0, 1, -3, 3 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_buttonpanelfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 12, 12 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

