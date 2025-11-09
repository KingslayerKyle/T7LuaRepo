CoD.cac_ItemTitleGlow = InheritFrom( LUI.UIElement )
CoD.cac_ItemTitleGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ItemTitleGlow )
	self.id = "cac_ItemTitleGlow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.06, 0.3, 0.42, 0.3 )
	Image:setupNineSliceShader( 12, 12 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

