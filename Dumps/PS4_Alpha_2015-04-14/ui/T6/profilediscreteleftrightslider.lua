require( "T6.DiscreteLeftRightSlider" )

CoD.ProfileDiscreteLeftRightSlider = {}
local CoD_ProfileDiscreteLeftRightSlider_SetValue = function ( self, val )
	local sliderValue = LUI.clamp( val, self.m_barMin, self.m_barMax )
	local normVal = (sliderValue - self.m_barMin) / (self.m_barMax - self.m_barMin)
	local varVal = self.m_varMin + normVal * (self.m_varMax - self.m_varMin)
	Engine.SetProfileVar( self.m_currentController, self.m_profileVarName, varVal )
end

CoD.ProfileDiscreteLeftRightSlider.RefreshValue = function ( self )
	local varValue = LUI.clamp( tonumber( Engine.ProfileValueAsString( self.m_currentController, self.m_profileVarName ) ), self.m_varMin, self.m_varMax )
	local normVal = (varValue - self.m_varMin) / (self.m_varMax - self.m_varMin)
	local sliderVal = self.m_barMin + normVal * (self.m_barMax - self.m_barMin)
	self.m_currentValue = LUI.clamp( math.ceil( sliderVal - 0.5 ), self.m_barMin, self.m_barMax )
	CoD.DiscreteLeftRightSlider.UpdateBar( self )
end

CoD.ProfileDiscreteLeftRightSlider.new = function ( controller, label, profileVarName, minVarVal, maxVarVal, minSliderVal, maxSliderVal, stepSliderVal, horizontalGap, defaultAnimationState )
	if minVarVal == nil then
		minVarVal = 0
	end
	if maxVarVal == nil then
		maxVarVal = 1
	end
	if minSliderVal == nil then
		minSliderVal = 0
	end
	if maxSliderVal == nil then
		maxSliderVal = 40
	end
	local varValue = LUI.clamp( tonumber( Engine.ProfileValueAsString( controller, profileVarName ) ), minVarVal, maxVarVal )
	local normVal = (varValue - minVarVal) / (maxVarVal - minVarVal)
	local sliderVal = minSliderVal + normVal * (maxSliderVal - minSliderVal)
	local currentValue = LUI.clamp( math.ceil( sliderVal - 0.5 ), minSliderVal, maxSliderVal )
	local slider = CoD.DiscreteLeftRightSlider.new( label, horizontalGap, nil, currentValue, minSliderVal, maxSliderVal, stepSliderVal, defaultAnimationState )
	slider.m_profileVarName = profileVarName
	slider.m_currentController = controller
	slider.m_varMin = minVarVal
	slider.m_varMax = maxVarVal
	slider.refreshValue = CoD.ProfileDiscreteLeftRightSlider.RefreshValue
	slider:setSliderCallback( CoD_ProfileDiscreteLeftRightSlider_SetValue )
	return slider
end

