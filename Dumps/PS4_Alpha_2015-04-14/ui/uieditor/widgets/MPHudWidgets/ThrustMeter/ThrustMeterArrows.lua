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
	right1:setRGB( 1, 1, 1 )
	right1:setZRot( 29 )
	self:addElement( right1 )
	self.right1 = right1
	
	local right2 = CoD.ThrustMeterChevronThin.new( menu, controller )
	right2:setLeftRight( false, false, 2, -2 )
	right2:setTopBottom( false, true, -324, -8 )
	right2:setRGB( 1, 1, 1 )
	right2:setAlpha( 0 )
	right2:setZRot( 33 )
	self:addElement( right2 )
	self.right2 = right2
	
	self.close = function ( self )
		self.right1:close()
		self.right2:close()
		CoD.ThrustMeterArrows.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

