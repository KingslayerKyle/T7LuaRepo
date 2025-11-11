CoD.FEMenuLargeGraphics = InheritFrom( LUI.UIElement )
CoD.FEMenuLargeGraphics.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FEMenuLargeGraphics )
	self.id = "FEMenuLargeGraphics"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 54 )
	self:setTopBottom( 0, 0, 0, 927 )
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 30, 33 )
	LineSide:setTopBottom( 0, 0, 0, 928 )
	LineSide:setZRot( 180 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local Pixel20010 = LUI.UIImage.new()
	Pixel20010:setLeftRight( 0, 0, 0, 54 )
	Pixel20010:setTopBottom( 0, 0, 5, 11 )
	Pixel20010:setYRot( -180 )
	Pixel20010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010 )
	self.Pixel20010 = Pixel20010
	
	local Pixel20011 = LUI.UIImage.new()
	Pixel20011:setLeftRight( 0, 0, 0, 54 )
	Pixel20011:setTopBottom( 0, 0, 919, 925 )
	Pixel20011:setYRot( -180 )
	Pixel20011:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20011:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20011 )
	self.Pixel20011 = Pixel20011
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

