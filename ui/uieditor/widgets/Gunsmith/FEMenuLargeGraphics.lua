-- 8c3ac557499ef90fb637793387c66db6
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 618 )
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 20, 22 )
	LineSide:setTopBottom( true, false, 0, 618.34 )
	LineSide:setZRot( 180 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local Pixel20010 = LUI.UIImage.new()
	Pixel20010:setLeftRight( true, false, 0, 36 )
	Pixel20010:setTopBottom( true, false, 3.34, 7.34 )
	Pixel20010:setYRot( -180 )
	Pixel20010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010 )
	self.Pixel20010 = Pixel20010
	
	local Pixel20011 = LUI.UIImage.new()
	Pixel20011:setLeftRight( true, false, 0, 36 )
	Pixel20011:setTopBottom( true, false, 612.34, 616.34 )
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

