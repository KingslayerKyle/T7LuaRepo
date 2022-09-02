-- eecea1053e33ff8617edce1fa166c9f0
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 64 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_characterboxfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.5, 0.5, 0.22, 0.25 )
	Image:setupNineSliceShader( 36, 32 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

