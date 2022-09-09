-- b07f226bed638ff4d56b1b24f10381b5
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 84 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -8, 8 )
	Image:setTopBottom( true, true, -6, 6 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.12, 0.3, 0.38, 0.2 )
	Image:setupNineSliceShader( 12, 12 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
