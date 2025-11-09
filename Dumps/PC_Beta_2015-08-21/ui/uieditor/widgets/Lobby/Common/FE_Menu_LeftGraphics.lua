CoD.FE_Menu_LeftGraphics = InheritFrom( LUI.UIElement )
CoD.FE_Menu_LeftGraphics.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_Menu_LeftGraphics )
	self.id = "FE_Menu_LeftGraphics"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 52 )
	self:setTopBottom( true, false, 0, 617 )
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 13, 15 )
	LineSide:setTopBottom( true, false, -9, 590 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, -3, 2 )
	LineSide0:setTopBottom( true, false, 0, 252 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local pixelc000 = LUI.UIImage.new()
	pixelc000:setLeftRight( true, false, -17, -1 )
	pixelc000:setTopBottom( true, false, 39, 91 )
	pixelc000:setZoom( -5 )
	pixelc000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc000 )
	self.pixelc000 = pixelc000
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 8.87, 44.87 )
	Pixel200:setTopBottom( true, false, 569.75, 573.75 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, 8.87, 44.87 )
	Pixel2001:setTopBottom( true, false, 44.75, 48.75 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		SelectingPlaylist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

