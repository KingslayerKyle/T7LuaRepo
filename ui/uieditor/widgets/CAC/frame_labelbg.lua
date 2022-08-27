-- 1b4331442df5791ea3947eb8368d8da8
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 612 )
	self:setTopBottom( true, false, 0, 35 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, -35 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.01, 0.11, 0, 0 )
	Image:setupNineSliceShader( 4, 4 )
	self:addElement( Image )
	self.Image = Image
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( false, true, -33, 3 )
	Image11:setTopBottom( true, false, 0, 3.5 )
	Image11:setZRot( 360 )
	Image11:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image110 = LUI.UIImage.new()
	Image110:setLeftRight( false, true, -33, 3 )
	Image110:setTopBottom( false, true, -2.5, 1 )
	Image110:setZRot( 360 )
	Image110:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image110:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image110 )
	self.Image110 = Image110
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

