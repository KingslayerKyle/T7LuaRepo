-- 24293d310c15310d776b9a9ef8ca1bdc
-- This hash is used for caching, delete to decompile the file again

CoD.FE_PanelNoBlur = InheritFrom( LUI.UIElement )
CoD.FE_PanelNoBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_PanelNoBlur )
	self.id = "FE_PanelNoBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -8, 8 )
	Image:setTopBottom( true, true, -2, 2 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0.33, 0.12, 0, 0 )
	Image:setupNineSliceShader( 16, 4 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

