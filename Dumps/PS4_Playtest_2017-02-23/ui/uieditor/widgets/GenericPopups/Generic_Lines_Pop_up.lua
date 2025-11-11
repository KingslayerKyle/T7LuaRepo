CoD.Generic_Lines_Pop_up = InheritFrom( LUI.UIElement )
CoD.Generic_Lines_Pop_up.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.Generic_Lines_Pop_up )
	self.id = "Generic_Lines_Pop_up"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 24 )
	self:setTopBottom( 0, 0, 0, 78 )
	
	local pixelc0000 = LUI.UIImage.new()
	pixelc0000:setLeftRight( 0, 0, 0, 24 )
	pixelc0000:setTopBottom( 0, 0, 0, 78 )
	pixelc0000:setZoom( -5 )
	pixelc0000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0000 )
	self.pixelc0000 = pixelc0000
	
	local pixelc00000 = LUI.UIImage.new()
	pixelc00000:setLeftRight( 0, 0, 0, 24 )
	pixelc00000:setTopBottom( 0, 0, 0, 78 )
	pixelc00000:setZoom( -5 )
	pixelc00000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc00000 )
	self.pixelc00000 = pixelc00000
	
	local pixelc000000 = LUI.UIImage.new()
	pixelc000000:setLeftRight( 0, 0, 0, 24 )
	pixelc000000:setTopBottom( 0, 0, 0, 78 )
	pixelc000000:setZoom( -5 )
	pixelc000000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc000000 )
	self.pixelc000000 = pixelc000000
	
	local pixelc0000000 = LUI.UIImage.new()
	pixelc0000000:setLeftRight( 0, 0, 0, 24 )
	pixelc0000000:setTopBottom( 0, 0, 0, 78 )
	pixelc0000000:setZoom( -5 )
	pixelc0000000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0000000 )
	self.pixelc0000000 = pixelc0000000
	
	local pixelc00000000 = LUI.UIImage.new()
	pixelc00000000:setLeftRight( 0, 0, 0, 24 )
	pixelc00000000:setTopBottom( 0, 0, 0, 78 )
	pixelc00000000:setZoom( -5 )
	pixelc00000000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc00000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc00000000 )
	self.pixelc00000000 = pixelc00000000
	
	local pixelc000000000 = LUI.UIImage.new()
	pixelc000000000:setLeftRight( 0, 0, 0, 24 )
	pixelc000000000:setTopBottom( 0, 0, 0, 78 )
	pixelc000000000:setZoom( -5 )
	pixelc000000000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc000000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc000000000 )
	self.pixelc000000000 = pixelc000000000
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

