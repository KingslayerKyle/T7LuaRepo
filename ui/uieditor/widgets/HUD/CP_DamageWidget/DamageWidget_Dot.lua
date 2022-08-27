-- 089b81b76c5ab00b697dea35b0a35bb2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.DamageWidget_Dot = InheritFrom( LUI.UIElement )
CoD.DamageWidget_Dot.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_Dot )
	self.id = "DamageWidget_Dot"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 4 )
	self:setTopBottom( true, false, 0, 4 )
	
	local AbilityWheelPixel0 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel0:setLeftRight( true, false, -2, 6 )
	AbilityWheelPixel0:setTopBottom( true, false, -2, 6 )
	AbilityWheelPixel0:setAlpha( 0 )
	AbilityWheelPixel0.Image20:setAlpha( 0.7 )
	AbilityWheelPixel0.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel0 )
	self.AbilityWheelPixel0 = AbilityWheelPixel0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelPixel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

