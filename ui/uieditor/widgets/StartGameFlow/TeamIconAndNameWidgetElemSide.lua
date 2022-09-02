-- b0af607ef00849f5e601eb1d16d5be07
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 29 )
	self:setTopBottom( true, false, 0, 27 )
	
	local Pixel2011 = LUI.UIImage.new()
	Pixel2011:setLeftRight( false, false, -18, 18 )
	Pixel2011:setTopBottom( false, false, 2, 6 )
	Pixel2011:setYRot( -180 )
	Pixel2011:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2011:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2011 )
	self.Pixel2011 = Pixel2011
	
	local Pixel20100 = LUI.UIImage.new()
	Pixel20100:setLeftRight( false, false, -18, 18 )
	Pixel20100:setTopBottom( false, false, 10, 14 )
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

