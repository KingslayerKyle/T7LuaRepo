CoD.DiscreteLeftRightSlider = {}
CoD.DiscreteLeftRightSlider.Width = 100
CoD.DiscreteLeftRightSlider.Height = 32
CoD.DiscreteLeftRightSlider.SetSliderCallback = function ( self, callbackFunc )
	self.m_sliderCallback = callbackFunc
end

CoD.DiscreteLeftRightSlider.UpdateBar = function ( self )
	local normVal = (self.m_currentValue - self.m_barMin) / (self.m_barMax - self.m_barMin)
	local numFilledDashes = math.ceil( normVal * 20 - 0.5 )
	self.bar:setupDashes( 20, numFilledDashes, 0, 8 )
	self.valueText:setText( self.m_currentValue )
end

CoD.DiscreteLeftRightSlider.Slider_Move = function ( self, event )
	if self:isInFocus() then
		if event.name == "discrete_slider_left" then
			self.m_currentValue = LUI.clamp( self.m_currentValue - self.m_barStep, self.m_barMin, self.m_barMax )
		elseif event.name == "discrete_slider_right" then
			self.m_currentValue = LUI.clamp( self.m_currentValue + self.m_barStep, self.m_barMin, self.m_barMax )
		end
		CoD.DiscreteLeftRightSlider.UpdateBar( self )
		if self.m_sliderCallback ~= nil then
			self:m_sliderCallback( self.m_currentValue )
		end
	end
end

CoD.DiscreteLeftRightSlider.new = function ( label, horizontalGap, sliderWidth, currentValue, min, max, step, defaultAnimationState )
	local slider = CoD.OptionElement.new( label, horizontalGap, defaultAnimationState )
	if sliderWidth == nil then
		sliderWidth = CoD.DiscreteLeftRightSlider.Width
	end
	slider.id = "DLRSlider." .. label
	slider.bar = LUI.UIElement.new( {
		left = 0,
		top = -CoD.DiscreteLeftRightSlider.Height / 2,
		right = 16,
		bottom = CoD.DiscreteLeftRightSlider.Height / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	slider.horizontalList:addElement( slider.bar )
	slider.bar:setupDashes( 20, 0, 0, 18 )
	slider.m_barWidth = sliderWidth
	slider.m_barMin = min
	slider.m_barMax = max
	if currentValue == nil then
		slider.m_currentValue = (min + max) / 2
	else
		slider.m_currentValue = currentValue
	end
	slider.setSliderCallback = CoD.DiscreteLeftRightSlider.SetSliderCallback
	if step == nil then
		step = 1
	end
	slider.m_barStep = step
	slider.horizontalList:addSpacer( 160 )
	slider.valueText = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.CoD9Button.TextHeight / 2,
		bottom = CoD.CoD9Button.TextHeight / 2,
		alpha = 1,
		font = CoD.fonts.Condensed
	} )
	if CoD.isSinglePlayer then
		slider.valueText:registerAnimationState( "disabled", {
			red = CoD.visorBlue2.r,
			green = CoD.visorBlue2.g,
			blue = CoD.visorBlue2.b
		} )
	else
		slider.valueText:registerAnimationState( "disabled", {
			red = CoD.offWhite.r,
			green = CoD.offWhite.g,
			blue = CoD.offWhite.b,
			alpha = 0.5
		} )
	end
	slider.valueText:registerAnimationState( "default", {
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1
	} )
	slider.valueText:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		alpha = 1
	} )
	slider.horizontalList:addElement( slider.valueText )
	CoD.CoD9Button.SetupTextElement( slider.valueText )
	slider.valueText.overDuration = nil
	slider.valueText.upDuration = nil
	slider.buttonRepeaterLeft = LUI.UIButtonRepeater.new( "left", "discrete_slider_left" )
	slider:addElement( slider.buttonRepeaterLeft )
	slider.buttonRepeaterRight = LUI.UIButtonRepeater.new( "right", "discrete_slider_right" )
	slider:addElement( slider.buttonRepeaterRight )
	slider:registerEventHandler( "discrete_slider_left", CoD.DiscreteLeftRightSlider.Slider_Move )
	slider:registerEventHandler( "discrete_slider_right", CoD.DiscreteLeftRightSlider.Slider_Move )
	slider:registerEventHandler( "gain_focus", CoD.LeftRightSlider.GainFocus )
	slider:registerEventHandler( "lose_focus", CoD.LeftRightSlider.LoseFocus )
	CoD.DiscreteLeftRightSlider.UpdateBar( slider )
	return slider
end

