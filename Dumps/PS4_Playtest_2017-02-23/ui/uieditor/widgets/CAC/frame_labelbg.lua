CoD.frame_labelbg = InheritFrom( LUI.UIElement )
CoD.frame_labelbg.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.frame_labelbg )
	self.id = "frame_labelbg"
	self.soundSet = "CAC_Overcapacity"
	self:setLeftRight( 0, 0, 0, 918 )
	self:setTopBottom( 0, 0, 0, 52 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, 0, -52 )
	Image:setTopBottom( 0, 1, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 6, 6 )
	self:addElement( Image )
	self.Image = Image
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( 1, 1, -49, 5 )
	Image11:setTopBottom( 0, 0, 0, 5 )
	Image11:setZRot( 360 )
	Image11:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image110 = LUI.UIImage.new()
	Image110:setLeftRight( 1, 1, -49, 5 )
	Image110:setTopBottom( 1, 1, -4, 1 )
	Image110:setZRot( 360 )
	Image110:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image110:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image110 )
	self.Image110 = Image110
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

