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
	
	local Image92 = LUI.UIImage.new()
	Image92:setLeftRight( true, false, 0, 4 )
	Image92:setTopBottom( false, true, -4, 0 )
	Image92:setRGB( 1, 1, 1 )
	Image92:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrll" ) )
	Image92:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image92 )
	self.Image92 = Image92
	
	local Image93 = LUI.UIImage.new()
	Image93:setLeftRight( true, true, 4, -37 )
	Image93:setTopBottom( false, true, -4, 0 )
	Image93:setRGB( 1, 1, 1 )
	Image93:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlm" ) )
	Image93:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image93 )
	self.Image93 = Image93
	
	local Image94 = LUI.UIImage.new()
	Image94:setLeftRight( false, true, -39, -35 )
	Image94:setTopBottom( false, true, -4, 0 )
	Image94:setRGB( 1, 1, 1 )
	Image94:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image94:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image94 )
	self.Image94 = Image94
	
	local Image95 = LUI.UIImage.new()
	Image95:setLeftRight( true, false, 0, 4 )
	Image95:setTopBottom( true, true, 4, -4 )
	Image95:setRGB( 1, 1, 1 )
	Image95:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrml" ) )
	Image95:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image95 )
	self.Image95 = Image95
	
	local Image97 = LUI.UIImage.new()
	Image97:setLeftRight( true, false, 0, 4 )
	Image97:setTopBottom( true, false, 0, 4 )
	Image97:setRGB( 1, 1, 1 )
	Image97:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrul" ) )
	Image97:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image97 )
	self.Image97 = Image97
	
	local Image98 = LUI.UIImage.new()
	Image98:setLeftRight( true, true, 4, -37 )
	Image98:setTopBottom( true, false, 0, 4 )
	Image98:setRGB( 1, 1, 1 )
	Image98:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	Image98:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image98 )
	self.Image98 = Image98
	
	local Image99 = LUI.UIImage.new()
	Image99:setLeftRight( false, true, -39, -35 )
	Image99:setTopBottom( true, false, 0, 4 )
	Image99:setRGB( 1, 1, 1 )
	Image99:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrur" ) )
	Image99:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image99 )
	self.Image99 = Image99
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( false, true, -39, -35 )
	Image100:setTopBottom( true, true, 4, -4 )
	Image100:setRGB( 1, 1, 1 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrmr" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( false, true, -33, 3 )
	Image11:setTopBottom( true, false, 0, 3.5 )
	Image11:setRGB( 1, 1, 1 )
	Image11:setZRot( 360 )
	Image11:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image110 = LUI.UIImage.new()
	Image110:setLeftRight( false, true, -33, 3 )
	Image110:setTopBottom( false, true, -2.5, 1 )
	Image110:setRGB( 1, 1, 1 )
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

