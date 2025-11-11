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
	self:setLeftRight( 0, 0, 0, 79 )
	self:setTopBottom( 0, 0, 0, 1005 )
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 23, 35 )
	LineSide:setTopBottom( 0, 0, 0, 1005 )
	LineSide:setAlpha( 0.27 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 0, 8 )
	LineSide0:setTopBottom( 0, 0, 0, 378 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( 0, 0, 25, 79 )
	Pixel2:setTopBottom( 0, 0, 221, 227 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( 0, 0, 25, 79 )
	Pixel20:setTopBottom( 0, 0, 899, 905 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local pixelc0 = LUI.UIImage.new()
	pixelc0:setLeftRight( 0, 0, 0, 24 )
	pixelc0:setTopBottom( 0, 0, 265, 343 )
	pixelc0:setZoom( -5 )
	pixelc0:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0 )
	self.pixelc0 = pixelc0
	
	local pixelc1 = LUI.UIImage.new()
	pixelc1:setLeftRight( 0, 0, 0, 24 )
	pixelc1:setTopBottom( 0, 0, 432, 510 )
	pixelc1:setZoom( -5 )
	pixelc1:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc1 )
	self.pixelc1 = pixelc1
	
	local pixelc10 = LUI.UIImage.new()
	pixelc10:setLeftRight( 0, 0, 0, 24 )
	pixelc10:setTopBottom( 0, 0, 606, 684 )
	pixelc10:setZoom( -5 )
	pixelc10:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc10 )
	self.pixelc10 = pixelc10
	
	local pixelc100 = LUI.UIImage.new()
	pixelc100:setLeftRight( 0, 0, 0, 24 )
	pixelc100:setTopBottom( 0, 0, 779, 857 )
	pixelc100:setZoom( -5 )
	pixelc100:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc100 )
	self.pixelc100 = pixelc100
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( 0, 0, 25, 79 )
	Pixel2000:setTopBottom( 0, 0, 727, 733 )
	Pixel2000:setYRot( -180 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Pixel20000 = LUI.UIImage.new()
	Pixel20000:setLeftRight( 0, 0, 25, 79 )
	Pixel20000:setTopBottom( 0, 0, 555, 561 )
	Pixel20000:setYRot( -180 )
	Pixel20000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20000 )
	self.Pixel20000 = Pixel20000
	
	local Pixel200000 = LUI.UIImage.new()
	Pixel200000:setLeftRight( 0, 0, 25, 79 )
	Pixel200000:setTopBottom( 0, 0, 383, 389 )
	Pixel200000:setYRot( -180 )
	Pixel200000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200000 )
	self.Pixel200000 = Pixel200000
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

