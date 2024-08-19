CoD.KingslayerMinimap = InheritFrom( LUI.UIElement )
CoD.KingslayerMinimap.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.KingslayerMinimap )
	self.id = "KingslayerMinimap"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.CompassMinimapMap = LUI.UIImage.new()
	self.CompassMinimapMap:setLeftRight( true, false, 0, 225 )
	self.CompassMinimapMap:setTopBottom( true, false, 0, 225 )
	self.CompassMinimapMap:setupCompassMap( Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self:addElement( self.CompassMinimapMap )

	self.CompassMinimapItems = LUI.UIImage.new()
	self.CompassMinimapItems:setLeftRight( true, false, 0, 225 )
	self.CompassMinimapItems:setTopBottom( true, false, 0, 225 )
	self.CompassMinimapItems:setupCompassItems( Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self:addElement( self.CompassMinimapItems )

	self.CompassMinimapMask = LUI.UIImage.new()
	self.CompassMinimapMask:setLeftRight( true, false, 0, 225 )
	self.CompassMinimapMask:setTopBottom( true, false, 0, 225 )
	self.CompassMinimapMask:setImage( RegisterImage( "minimap_circle_mask" ) )
	self.CompassMinimapMask:setScale( 0.9 )
	self:addElement( self.CompassMinimapMask )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CompassMinimapMap:close()
		element.CompassMinimapItems:close()
		element.CompassMinimapMask:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
