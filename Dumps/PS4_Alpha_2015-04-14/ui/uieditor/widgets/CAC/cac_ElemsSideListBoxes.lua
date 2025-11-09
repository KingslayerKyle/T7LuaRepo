CoD.cac_ElemsSideListBoxes = InheritFrom( LUI.UIElement )
CoD.cac_ElemsSideListBoxes.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ElemsSideListBoxes )
	self.id = "cac_ElemsSideListBoxes"
	self.soundSet = "CAC_PrimaryAttachment"
	self:setLeftRight( true, false, 0, 53 )
	self:setTopBottom( true, false, 0, 670 )
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 15.5, 23.5 )
	LineSide:setTopBottom( true, false, 0, 670 )
	LineSide:setRGB( 1, 1, 1 )
	LineSide:setAlpha( 0.27 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 0.5, 5.5 )
	LineSide0:setTopBottom( true, false, 0, 252 )
	LineSide0:setRGB( 1, 1, 1 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 16.87, 52.87 )
	Pixel2:setTopBottom( true, false, 147, 151 )
	Pixel2:setRGB( 1, 1, 1 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, 16.87, 52.87 )
	Pixel20:setTopBottom( true, false, 599, 603 )
	Pixel20:setRGB( 1, 1, 1 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local pixelc0 = LUI.UIImage.new()
	pixelc0:setLeftRight( true, false, 0, 16 )
	pixelc0:setTopBottom( true, false, 177, 229 )
	pixelc0:setRGB( 1, 1, 1 )
	pixelc0:setZoom( -5 )
	pixelc0:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0 )
	self.pixelc0 = pixelc0
	
	local pixelc1 = LUI.UIImage.new()
	pixelc1:setLeftRight( true, false, 0, 16 )
	pixelc1:setTopBottom( true, false, 288, 340 )
	pixelc1:setRGB( 1, 1, 1 )
	pixelc1:setZoom( -5 )
	pixelc1:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc1 )
	self.pixelc1 = pixelc1
	
	local pixelc00 = LUI.UIImage.new()
	pixelc00:setLeftRight( true, false, 0, 16 )
	pixelc00:setTopBottom( true, false, 288, 340 )
	pixelc00:setRGB( 1, 1, 1 )
	pixelc00:setZoom( -5 )
	pixelc00:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc00 )
	self.pixelc00 = pixelc00
	
	local pixelc10 = LUI.UIImage.new()
	pixelc10:setLeftRight( true, false, 0, 16 )
	pixelc10:setTopBottom( true, false, 404, 456 )
	pixelc10:setRGB( 1, 1, 1 )
	pixelc10:setZoom( -5 )
	pixelc10:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc10 )
	self.pixelc10 = pixelc10
	
	local pixelc000 = LUI.UIImage.new()
	pixelc000:setLeftRight( true, false, 0, 16 )
	pixelc000:setTopBottom( true, false, 404, 456 )
	pixelc000:setRGB( 1, 1, 1 )
	pixelc000:setZoom( -5 )
	pixelc000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc000 )
	self.pixelc000 = pixelc000
	
	local pixelc100 = LUI.UIImage.new()
	pixelc100:setLeftRight( true, false, 0, 16 )
	pixelc100:setTopBottom( true, false, 519, 571 )
	pixelc100:setRGB( 1, 1, 1 )
	pixelc100:setZoom( -5 )
	pixelc100:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc100 )
	self.pixelc100 = pixelc100
	
	local pixelc0000 = LUI.UIImage.new()
	pixelc0000:setLeftRight( true, false, 0, 16 )
	pixelc0000:setTopBottom( true, false, 519, 571 )
	pixelc0000:setRGB( 1, 1, 1 )
	pixelc0000:setZoom( -5 )
	pixelc0000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0000 )
	self.pixelc0000 = pixelc0000
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 16.87, 52.87 )
	Pixel200:setTopBottom( true, false, 492, 496 )
	Pixel200:setRGB( 1, 1, 1 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( true, false, 16.87, 52.87 )
	Pixel2000:setTopBottom( true, false, 485, 489 )
	Pixel2000:setRGB( 1, 1, 1 )
	Pixel2000:setYRot( -180 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, 16.87, 52.87 )
	Pixel2001:setTopBottom( true, false, 377, 381 )
	Pixel2001:setRGB( 1, 1, 1 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local Pixel20000 = LUI.UIImage.new()
	Pixel20000:setLeftRight( true, false, 16.87, 52.87 )
	Pixel20000:setTopBottom( true, false, 370, 374 )
	Pixel20000:setRGB( 1, 1, 1 )
	Pixel20000:setYRot( -180 )
	Pixel20000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20000 )
	self.Pixel20000 = Pixel20000
	
	local Pixel20010 = LUI.UIImage.new()
	Pixel20010:setLeftRight( true, false, 16.87, 52.87 )
	Pixel20010:setTopBottom( true, false, 262, 266 )
	Pixel20010:setRGB( 1, 1, 1 )
	Pixel20010:setYRot( -180 )
	Pixel20010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010 )
	self.Pixel20010 = Pixel20010
	
	local Pixel200000 = LUI.UIImage.new()
	Pixel200000:setLeftRight( true, false, 16.87, 52.87 )
	Pixel200000:setTopBottom( true, false, 255, 259 )
	Pixel200000:setRGB( 1, 1, 1 )
	Pixel200000:setYRot( -180 )
	Pixel200000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200000 )
	self.Pixel200000 = Pixel200000
	
	local pixelc01 = LUI.UIImage.new()
	pixelc01:setLeftRight( true, false, 0, 16 )
	pixelc01:setTopBottom( true, false, 177, 229 )
	pixelc01:setRGB( 1, 1, 1 )
	pixelc01:setZoom( -5 )
	pixelc01:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc01 )
	self.pixelc01 = pixelc01
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

