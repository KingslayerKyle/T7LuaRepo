CoD.cac_CharBox = InheritFrom( LUI.UIElement )
CoD.cac_CharBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_CharBox )
	self.id = "cac_CharBox"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 108 )
	self:setTopBottom( 0, 0, 0, 96 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, 0, 0 )
	Image:setTopBottom( 0, 1, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_characterboxfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0, 0, 0.22, 0.25 )
	Image:setupNineSliceShader( 54, 48 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

