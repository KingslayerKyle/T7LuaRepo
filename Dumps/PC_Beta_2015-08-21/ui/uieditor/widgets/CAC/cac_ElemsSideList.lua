CoD.cac_ElemsSideList = InheritFrom( LUI.UIElement )
CoD.cac_ElemsSideList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ElemsSideList )
	self.id = "cac_ElemsSideList"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 68 )
	self:setTopBottom( true, false, 0, 670 )
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 30, 38 )
	LineSide:setTopBottom( true, false, 0, 670 )
	LineSide:setAlpha( 0 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 15.5, 20.5 )
	LineSide0:setTopBottom( true, false, 0, 252 )
	LineSide0:setAlpha( 0 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 31.87, 47.87 )
	Image0:setTopBottom( true, false, 212, 220 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 31.87, 47.87 )
	Image00:setTopBottom( true, false, 285, 293 )
	Image00:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( true, false, 31.87, 47.87 )
	Image000:setTopBottom( true, false, 356, 364 )
	Image000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( true, false, 31.87, 47.87 )
	Image0000:setTopBottom( true, false, 428, 436 )
	Image0000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( true, false, 31.87, 47.87 )
	Image00000:setTopBottom( true, false, 501, 509 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 31.87, 47.87 )
	Image000000:setTopBottom( true, false, 571, 579 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 31.87, 67.87 )
	Pixel2:setTopBottom( true, false, 147, 151 )
	Pixel2:setAlpha( 0 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, 24.87, 60.87 )
	Pixel20:setTopBottom( true, false, 504, 508 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local pixelc = LUI.UIImage.new()
	pixelc:setLeftRight( true, false, 0, 16 )
	pixelc:setTopBottom( true, false, 155, 207 )
	pixelc:setZoom( -5 )
	pixelc:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc )
	self.pixelc = pixelc
	
	local pixelc0 = LUI.UIImage.new()
	pixelc0:setLeftRight( true, false, 0, 16 )
	pixelc0:setTopBottom( true, false, 155, 207 )
	pixelc0:setAlpha( 0 )
	pixelc0:setZoom( -5 )
	pixelc0:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0 )
	self.pixelc0 = pixelc0
	
	local pixelc1 = LUI.UIImage.new()
	pixelc1:setLeftRight( true, false, 0, 16 )
	pixelc1:setTopBottom( true, false, 298, 350 )
	pixelc1:setZoom( -5 )
	pixelc1:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc1 )
	self.pixelc1 = pixelc1
	
	local pixelc00 = LUI.UIImage.new()
	pixelc00:setLeftRight( true, false, 0, 16 )
	pixelc00:setTopBottom( true, false, 298, 350 )
	pixelc00:setAlpha( 0 )
	pixelc00:setZoom( -5 )
	pixelc00:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc00 )
	self.pixelc00 = pixelc00
	
	local pixelc10 = LUI.UIImage.new()
	pixelc10:setLeftRight( true, false, 0, 16 )
	pixelc10:setTopBottom( true, false, 439, 491 )
	pixelc10:setZoom( -5 )
	pixelc10:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc10 )
	self.pixelc10 = pixelc10
	
	local pixelc000 = LUI.UIImage.new()
	pixelc000:setLeftRight( true, false, 0, 16 )
	pixelc000:setTopBottom( true, false, 439, 491 )
	pixelc000:setAlpha( 0 )
	pixelc000:setZoom( -5 )
	pixelc000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc000 )
	self.pixelc000 = pixelc000
	
	local pixelc100 = LUI.UIImage.new()
	pixelc100:setLeftRight( true, false, 0, 16 )
	pixelc100:setTopBottom( true, false, 583, 635 )
	pixelc100:setZoom( -5 )
	pixelc100:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc100 )
	self.pixelc100 = pixelc100
	
	local pixelc0000 = LUI.UIImage.new()
	pixelc0000:setLeftRight( true, false, 0, 16 )
	pixelc0000:setTopBottom( true, false, 583, 635 )
	pixelc0000:setZoom( -5 )
	pixelc0000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0000 )
	self.pixelc0000 = pixelc0000
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 24.87, 60.87 )
	Pixel200:setTopBottom( true, false, 86, 90 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local LineSide1 = LUI.UIImage.new()
	LineSide1:setLeftRight( true, false, 49.9, 52.9 )
	LineSide1:setTopBottom( true, false, 1, 670 )
	LineSide1:setAlpha( 0.5 )
	LineSide1:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide1 )
	self.LineSide1 = LineSide1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				LineSide:completeAnimation()
				self.LineSide:setAlpha( 0 )
				self.clipFinished( LineSide, {} )
				pixelc0:completeAnimation()
				self.pixelc0:setAlpha( 0 )
				self.clipFinished( pixelc0, {} )
				pixelc00:completeAnimation()
				self.pixelc00:setAlpha( 0 )
				self.clipFinished( pixelc00, {} )
				pixelc000:completeAnimation()
				self.pixelc000:setAlpha( 0 )
				self.clipFinished( pixelc000, {} )
				pixelc0000:completeAnimation()
				self.pixelc0000:setAlpha( 0 )
				self.clipFinished( pixelc0000, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

