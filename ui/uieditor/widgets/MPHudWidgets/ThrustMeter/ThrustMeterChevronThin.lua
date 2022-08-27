-- e83f4eab112ed3c94998d50f47789b07
-- This hash is used for caching, delete to decompile the file again

CoD.ThrustMeterChevronThin = InheritFrom( LUI.UIElement )
CoD.ThrustMeterChevronThin.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeterChevronThin )
	self.id = "ThrustMeterChevronThin"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 4 )
	self:setTopBottom( true, false, 0, 229 )
	
	local leftChevron1 = LUI.UIImage.new()
	leftChevron1:setLeftRight( true, true, 0, 0 )
	leftChevron1:setTopBottom( false, true, -6, -2 )
	leftChevron1:setImage( RegisterImage( "uie_t7_hud_boost_meter_dots_arrow_thin" ) )
	self:addElement( leftChevron1 )
	self.leftChevron1 = leftChevron1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

