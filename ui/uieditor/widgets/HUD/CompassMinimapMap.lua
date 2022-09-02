-- 8ccb529553495f2384a97b3f9e38cace
-- This hash is used for caching, delete to decompile the file again

CoD.CompassMinimapMap = InheritFrom( LUI.UIElement )
CoD.CompassMinimapMap.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CompassMinimapMap )
	self.id = "CompassMinimapMap"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local CompassMinimapMap = LUI.UIImage.new()
	CompassMinimapMap:setLeftRight( true, true, 0, 0 )
	CompassMinimapMap:setTopBottom( true, true, 0, 0 )
	CompassMinimapMap:setupCompassMap( Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self:addElement( CompassMinimapMap )
	self.CompassMinimapMap = CompassMinimapMap
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

