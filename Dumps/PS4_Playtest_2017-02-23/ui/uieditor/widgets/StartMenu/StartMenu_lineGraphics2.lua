CoD.StartMenu_lineGraphics2 = InheritFrom( LUI.UIElement )
CoD.StartMenu_lineGraphics2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_lineGraphics2 )
	self.id = "StartMenu_lineGraphics2"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 75 )
	self:setTopBottom( 0, 0, 0, 849 )
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( 0, 0, 12, 36 )
	Image0000:setTopBottom( 0, 0, 534, 546 )
	Image0000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( 0, 0, 12, 36 )
	Image00000:setTopBottom( 0, 0, 558, 570 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( 0, 0, 12, 66 )
	Pixel2:setTopBottom( 0, 0, 36, 42 )
	Pixel2:setYRot( 360 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( 0, 0, 14, 68 )
	Pixel20:setTopBottom( 0, 0, 799, 805 )
	Pixel20:setYRot( 360 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local Image00001 = LUI.UIImage.new()
	Image00001:setLeftRight( 0, 0, 12, 36 )
	Image00001:setTopBottom( 0, 0, 270, 282 )
	Image00001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00001 )
	self.Image00001 = Image00001
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( 0, 0, 12, 36 )
	Image000000:setTopBottom( 0, 0, 294, 306 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

