CoD.Social_SideElements = InheritFrom( LUI.UIElement )
CoD.Social_SideElements.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_SideElements )
	self.id = "Social_SideElements"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 670 )
	
	local LineSide1 = LUI.UIImage.new()
	LineSide1:setLeftRight( true, false, 30.5, 38.5 )
	LineSide1:setTopBottom( true, false, 2, 672 )
	LineSide1:setAlpha( 0.8 )
	LineSide1:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide1 )
	self.LineSide1 = LineSide1
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 15.5, 20.5 )
	LineSide00:setTopBottom( true, false, 2, 254 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, 33.87, 69.87 )
	Pixel20:setTopBottom( true, false, 152, 156 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local pixelc2 = LUI.UIImage.new()
	pixelc2:setLeftRight( true, false, 0, 16 )
	pixelc2:setTopBottom( true, false, 157, 209 )
	pixelc2:setZoom( -5 )
	pixelc2:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc2 )
	self.pixelc2 = pixelc2
	
	local pixelc01 = LUI.UIImage.new()
	pixelc01:setLeftRight( true, false, 0, 16 )
	pixelc01:setTopBottom( true, false, 157, 209 )
	pixelc01:setZoom( -5 )
	pixelc01:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc01 )
	self.pixelc01 = pixelc01
	
	local pixelc11 = LUI.UIImage.new()
	pixelc11:setLeftRight( true, false, 0, 16 )
	pixelc11:setTopBottom( true, false, 300, 352 )
	pixelc11:setZoom( -5 )
	pixelc11:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc11 )
	self.pixelc11 = pixelc11
	
	local pixelc001 = LUI.UIImage.new()
	pixelc001:setLeftRight( true, false, 0, 16 )
	pixelc001:setTopBottom( true, false, 300, 352 )
	pixelc001:setZoom( -5 )
	pixelc001:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc001 )
	self.pixelc001 = pixelc001
	
	local pixelc101 = LUI.UIImage.new()
	pixelc101:setLeftRight( true, false, 0, 16 )
	pixelc101:setTopBottom( true, false, 441, 493 )
	pixelc101:setZoom( -5 )
	pixelc101:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc101:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc101 )
	self.pixelc101 = pixelc101
	
	local pixelc0001 = LUI.UIImage.new()
	pixelc0001:setLeftRight( true, false, 0, 16 )
	pixelc0001:setTopBottom( true, false, 441, 493 )
	pixelc0001:setZoom( -5 )
	pixelc0001:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0001 )
	self.pixelc0001 = pixelc0001
	
	local pixelc1000 = LUI.UIImage.new()
	pixelc1000:setLeftRight( true, false, 0, 16 )
	pixelc1000:setTopBottom( true, false, 585, 637 )
	pixelc1000:setZoom( -5 )
	pixelc1000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc1000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc1000 )
	self.pixelc1000 = pixelc1000
	
	local pixelc00000 = LUI.UIImage.new()
	pixelc00000:setLeftRight( true, false, 0, 16 )
	pixelc00000:setTopBottom( true, false, 585, 637 )
	pixelc00000:setZoom( -5 )
	pixelc00000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc00000 )
	self.pixelc00000 = pixelc00000
	
	local Image000012 = LUI.UIImage.new()
	Image000012:setLeftRight( true, false, 33.87, 49.87 )
	Image000012:setTopBottom( true, false, 272, 280 )
	Image000012:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000012:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000012 )
	self.Image000012 = Image000012
	
	local Image0000002 = LUI.UIImage.new()
	Image0000002:setLeftRight( true, false, 33.87, 49.87 )
	Image0000002:setTopBottom( true, false, 279, 287 )
	Image0000002:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000002:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000002 )
	self.Image0000002 = Image0000002
	
	local Image000020 = LUI.UIImage.new()
	Image000020:setLeftRight( true, false, 33.87, 49.87 )
	Image000020:setTopBottom( true, false, 337, 345 )
	Image000020:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000020:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000020 )
	self.Image000020 = Image000020
	
	local Image0000010 = LUI.UIImage.new()
	Image0000010:setLeftRight( true, false, 33.87, 49.87 )
	Image0000010:setTopBottom( true, false, 344, 352 )
	Image0000010:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000010 )
	self.Image0000010 = Image0000010
	
	local Image0000101 = LUI.UIImage.new()
	Image0000101:setLeftRight( true, false, 33.87, 49.87 )
	Image0000101:setTopBottom( true, false, 402, 410 )
	Image0000101:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000101:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000101 )
	self.Image0000101 = Image0000101
	
	local Image00000001 = LUI.UIImage.new()
	Image00000001:setLeftRight( true, false, 33.87, 49.87 )
	Image00000001:setTopBottom( true, false, 409, 417 )
	Image00000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000001 )
	self.Image00000001 = Image00000001
	
	local Image000000000000 = LUI.UIImage.new()
	Image000000000000:setLeftRight( true, false, 33.87, 49.87 )
	Image000000000000:setTopBottom( true, false, 597, 605 )
	Image000000000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000000000 )
	self.Image000000000000 = Image000000000000
	
	local Image0000110 = LUI.UIImage.new()
	Image0000110:setLeftRight( true, false, 33.87, 49.87 )
	Image0000110:setTopBottom( true, false, 207, 215 )
	Image0000110:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000110:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000110 )
	self.Image0000110 = Image0000110
	
	local Image00000010 = LUI.UIImage.new()
	Image00000010:setLeftRight( true, false, 33.87, 49.87 )
	Image00000010:setTopBottom( true, false, 214, 222 )
	Image00000010:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000010 )
	self.Image00000010 = Image00000010
	
	local Image00001001 = LUI.UIImage.new()
	Image00001001:setLeftRight( true, false, 33.87, 49.87 )
	Image00001001:setTopBottom( true, false, 468, 476 )
	Image00001001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00001001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00001001 )
	self.Image00001001 = Image00001001
	
	local Image000000001 = LUI.UIImage.new()
	Image000000001:setLeftRight( true, false, 33.87, 49.87 )
	Image000000001:setTopBottom( true, false, 475, 483 )
	Image000000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000001 )
	self.Image000000001 = Image000000001
	
	local Image000010000 = LUI.UIImage.new()
	Image000010000:setLeftRight( true, false, 33.87, 49.87 )
	Image000010000:setTopBottom( true, false, 532, 540 )
	Image000010000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000010000 )
	self.Image000010000 = Image000010000
	
	local Image0000000000 = LUI.UIImage.new()
	Image0000000000:setLeftRight( true, false, 33.87, 49.87 )
	Image0000000000:setTopBottom( true, false, 539, 547 )
	Image0000000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000000000 )
	self.Image0000000000 = Image0000000000
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 33.87, 69.87 )
	Pixel200:setTopBottom( true, false, 640, 644 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

