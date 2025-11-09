require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeterChevron" )

CoD.ThrustBootChevron = InheritFrom( LUI.UIElement )
CoD.ThrustBootChevron.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ThrustBootChevron )
	self.id = "ThrustBootChevron"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 5 )
	self:setTopBottom( true, false, 0, 298 )
	
	local ThrustMeterChevron0 = CoD.ThrustMeterChevron.new( menu, controller )
	ThrustMeterChevron0:setLeftRight( true, false, 5, 0 )
	ThrustMeterChevron0:setTopBottom( true, false, 66, 297 )
	ThrustMeterChevron0:setRGB( 1, 1, 1 )
	self:addElement( ThrustMeterChevron0 )
	self.ThrustMeterChevron0 = ThrustMeterChevron0
	
	local ThrustMeterChevron1 = CoD.ThrustMeterChevron.new( menu, controller )
	ThrustMeterChevron1:setLeftRight( true, false, 5, 0 )
	ThrustMeterChevron1:setTopBottom( true, false, 1, 232 )
	ThrustMeterChevron1:setRGB( 1, 1, 1 )
	ThrustMeterChevron1:setAlpha( 0 )
	ThrustMeterChevron1:setZRot( 180 )
	self:addElement( ThrustMeterChevron1 )
	self.ThrustMeterChevron1 = ThrustMeterChevron1
	
	self.close = function ( self )
		self.ThrustMeterChevron0:close()
		self.ThrustMeterChevron1:close()
		CoD.ThrustBootChevron.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

