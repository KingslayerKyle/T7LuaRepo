require( "ui.T6.LeftRightSlider" )

CoD.DvarLeftRightSlider = {}
local CoD_DvarLeftRightSlider_SetValue = function ( self, val )
	Engine.SetDvar( self.m_dvarName, val )
end

CoD.DvarLeftRightSlider.new = function ( controller, label, dvarName, minVal, maxVal, horizontalGap, defaultAnimationState )
	local currentValue = tonumber( Engine.DvarString( nil, dvarName ) )
	local slider = CoD.LeftRightSlider.new( label, horizontalGap, nil, currentValue, minVal, maxVal, defaultAnimationState )
	slider.m_dvarName = dvarName
	slider.m_currentValue = currentValue
	slider.m_currentController = controller
	slider:setSliderCallback( CoD_DvarLeftRightSlider_SetValue )
	return slider
end

