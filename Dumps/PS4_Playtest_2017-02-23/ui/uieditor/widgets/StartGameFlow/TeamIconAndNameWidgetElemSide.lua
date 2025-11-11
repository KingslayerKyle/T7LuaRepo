CoD.TeamIconAndNameWidgetElemSide = InheritFrom( LUI.UIElement )
CoD.TeamIconAndNameWidgetElemSide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TeamIconAndNameWidgetElemSide )
	self.id = "TeamIconAndNameWidgetElemSide"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 43 )
	self:setTopBottom( 0, 0, 0, 40 )
	
	local Pixel2011 = LUI.UIImage.new()
	Pixel2011:setLeftRight( 0.5, 0.5, -27, 27 )
	Pixel2011:setTopBottom( 0.5, 0.5, 3, 9 )
	Pixel2011:setYRot( -180 )
	Pixel2011:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2011:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2011 )
	self.Pixel2011 = Pixel2011
	
	local Pixel20100 = LUI.UIImage.new()
	Pixel20100:setLeftRight( 0.5, 0.5, -27, 27 )
	Pixel20100:setTopBottom( 0.5, 0.5, 15, 21 )
	Pixel20100:setYRot( -180 )
	Pixel20100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100 )
	self.Pixel20100 = Pixel20100
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

