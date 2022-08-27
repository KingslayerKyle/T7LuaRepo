-- c580385c1c5d0181b1ec1acad4ee4b24
-- This hash is used for caching, delete to decompile the file again

CoD.CompassMinimapOverlay = InheritFrom( LUI.UIElement )
CoD.CompassMinimapOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CompassMinimapOverlay )
	self.id = "CompassMinimapOverlay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local CompassMinimapOverlay = LUI.UIImage.new()
	CompassMinimapOverlay:setLeftRight( true, true, 0, 0 )
	CompassMinimapOverlay:setTopBottom( true, true, 0, 0 )
	CompassMinimapOverlay:setupCompassOverlay( Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self:addElement( CompassMinimapOverlay )
	self.CompassMinimapOverlay = CompassMinimapOverlay
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

