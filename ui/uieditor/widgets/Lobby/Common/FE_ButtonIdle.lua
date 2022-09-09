-- d9d02aa97a6fc8ed2f0e0c7d9d63a385
-- This hash is used for caching, delete to decompile the file again

CoD.FE_ButtonIdle = InheritFrom( LUI.UIElement )
CoD.FE_ButtonIdle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonIdle )
	self.id = "FE_ButtonIdle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -1, 1 )
	Image:setTopBottom( true, true, -2, 2 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.1, 0.33, 0, 0 )
	Image:setupNineSliceShader( 8, 8 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
