CoD.CompassMinimapItems = InheritFrom( LUI.UIElement )
CoD.CompassMinimapItems.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CompassMinimapItems )
	self.id = "CompassMinimapItems"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local CompassMinimapItems = LUI.UIImage.new()
	CompassMinimapItems:setLeftRight( true, true, 0, 0 )
	CompassMinimapItems:setTopBottom( true, true, 0, 0 )
	CompassMinimapItems:setupCompassItems( Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self:addElement( CompassMinimapItems )
	self.CompassMinimapItems = CompassMinimapItems
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

