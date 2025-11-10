require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_VignetteInternal" )

CoD.AbilityWheel_Vignette = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_Vignette.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_Vignette )
	self.id = "AbilityWheel_Vignette"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local AbilityWheelVignetteInternal0 = CoD.AbilityWheel_VignetteInternal.new( menu, controller )
	AbilityWheelVignetteInternal0:setLeftRight( true, true, 0, 0 )
	AbilityWheelVignetteInternal0:setTopBottom( true, false, 0, 720 )
	AbilityWheelVignetteInternal0:setAlpha( 0.99 )
	self:addElement( AbilityWheelVignetteInternal0 )
	self.AbilityWheelVignetteInternal0 = AbilityWheelVignetteInternal0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelVignetteInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

