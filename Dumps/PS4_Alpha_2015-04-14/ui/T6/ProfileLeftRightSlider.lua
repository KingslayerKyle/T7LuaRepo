require( "ui.T6.LeftRightSlider" )

CoD.ProfileLeftRightSlider = {}
CoD.ProfileLeftRightSlider.SetValue = function ( self, val )
	Engine.SetProfileVar( self.m_currentController, self.m_profileVarName, val )
end

CoD.ProfileLeftRightSlider.new = function ( controller, label, profileVarName, minVal, maxVal, horizontalGap, defaultAnimationState, changeSFX )
	local currentValue = tonumber( Engine.ProfileValueAsString( controller, profileVarName ) )
	local slider = CoD.LeftRightSlider.new( label, horizontalGap, nil, currentValue, minVal, maxVal, defaultAnimationState, changeSFX )
	slider.m_profileVarName = profileVarName
	slider.m_currentController = controller
	slider:setSliderCallback( CoD.ProfileLeftRightSlider.SetValue )
	return slider
end

