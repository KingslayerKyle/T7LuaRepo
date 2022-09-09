-- 89caa6f501ca3fce9b6bf6e28fd3753b
-- This hash is used for caching, delete to decompile the file again

CoD.BorderBakedBlur = InheritFrom( LUI.UIElement )
CoD.BorderBakedBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BorderBakedBlur )
	self.id = "BorderBakedBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -3, 3 )
	Image:setTopBottom( true, true, -3, 3 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxblurfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.13, 0.13, 0, 0 )
	Image:setupNineSliceShader( 16, 16 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
