require( "ui.uieditor.widgets.Minimap.MinimapHelper" )

CoD.TabletLocationSelector_Internal = InheritFrom( LUI.UIElement )
CoD.TabletLocationSelector_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TabletLocationSelector_Internal )
	self.id = "TabletLocationSelector_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 300 )
	
	local MinimapHelper0 = CoD.MinimapHelper.new( menu, controller )
	MinimapHelper0:setLeftRight( true, true, 0, 0 )
	MinimapHelper0:setTopBottom( true, true, 0, 0 )
	MinimapHelper0:setRGB( 1, 1, 1 )
	MinimapHelper0.map:setupCompassMap( Enum.CompassType.COMPASS_TYPE_FULL )
	MinimapHelper0.underlay:setupCompassUnderlay( Enum.CompassType.COMPASS_TYPE_FULL )
	MinimapHelper0.items:setupCompassItems( Enum.CompassType.COMPASS_TYPE_FULL )
	MinimapHelper0.overlay:setupCompassOverlay( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( MinimapHelper0 )
	self.MinimapHelper0 = MinimapHelper0
	
	self.close = function ( self )
		self.MinimapHelper0:close()
		CoD.TabletLocationSelector_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

