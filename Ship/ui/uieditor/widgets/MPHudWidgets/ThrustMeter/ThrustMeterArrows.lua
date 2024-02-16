-- 8f0fa2998ab61569ddb7188c897e344d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeterChevron" )
require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeterChevronThin" )

CoD.ThrustMeterArrows = InheritFrom( LUI.UIElement )
CoD.ThrustMeterArrows.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeterArrows )
	self.id = "ThrustMeterArrows"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 15 )
	self:setTopBottom( true, false, 0, 300 )
	
	local right1 = CoD.ThrustMeterChevron.new( menu, controller )
	right1:setLeftRight( false, false, 2, -4 )
	right1:setTopBottom( false, true, -324, -8 )
	right1:setZRot( 29 )
	self:addElement( right1 )
	self.right1 = right1
	
	local right2 = CoD.ThrustMeterChevronThin.new( menu, controller )
	right2:setLeftRight( false, false, 2, -2 )
	right2:setTopBottom( false, true, -324, -8 )
	right2:setAlpha( 0 )
	right2:setZRot( 33 )
	self:addElement( right2 )
	self.right2 = right2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.right1:close()
		element.right2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
