CoD.LeftRightSlider = {}
CoD.LeftRightSlider.Width = 100
CoD.LeftRightSlider.Height = 32
CoD.LeftRightSlider.Speed = 0.3
CoD.LeftRightSlider.LeftRightSelectorGainFocusEvent = {
	name = "left_right_slider_gain_focus"
}
CoD.LeftRightSlider.LeftRightSelectorLoseFocusEvent = {
	name = "left_right_slider_lose_focus"
}
CoD.LeftRightSlider.HandleGamepadInput = function ( self, event )
	if LUI.UIElement.handleGamepadButton( self, event ) == true then
		return true
	elseif self:isInFocus() and self.m_allowValueUpdate ~= false then
		if event.button == "left" then
			if event.down == true then
				self:updateSlideDirection( -1 )
				self:addElement( self.m_timer )
			else
				self:updateSlideDirection( nil )
				self.m_timer:close()
			end
		elseif event.button == "right" then
			if event.down == true then
				self:updateSlideDirection( 1 )
				self:addElement( self.m_timer )
			else
				self:updateSlideDirection( nil )
				self.m_timer:close()
			end
		end
	end
end

CoD.LeftRightSlider.UpdateBar = function ( self, event )
	local currentValue = nil
	local barMin = self.m_barMin
	local barMax = self.m_barMax
	local sliderCallback = self.m_sliderCallback
	if not self:isInFocus() then
		self.m_slideDirection = nil
	end
	local slideDirection = self.m_slideDirection
	local previousFilledDashes = math.floor( (self.m_currentValue - barMin) * 100 / (barMax - barMin) / 5 )
	if slideDirection ~= nil then
		currentValue = self.m_currentValue + (barMax - barMin) * self.m_barSpeed * slideDirection * event.timeElapsed / 1000
		if currentValue < barMin then
			currentValue = self.m_barMin
		end
		if barMax < currentValue then
			currentValue = barMax
		end
		self.m_currentValue = currentValue
	else
		currentValue = self.m_currentValue
	end
	local numFilledDashes = math.floor( (currentValue - barMin) * 100 / (barMax - barMin) / 5 )
	if self.m_sfx ~= nil and previousFilledDashes ~= nil and previousFilledDashes ~= numFilledDashes then
		Engine.PlaySound( self.m_sfx )
	end
	self.bar:setupDashes( 20, numFilledDashes, 0, 8 )
	if sliderCallback ~= nil then
		sliderCallback( self, currentValue )
	end
end

CoD.LeftRightSlider.UpdateBarFromProfile = function ( self, event )
	if event.isProfileFloat then
		self.m_currentValue = Engine.ProfileFloat( event.controller, self.m_profileVarName )
	else
		self.m_currentValue = Engine.GetProfileVarInt( event.controller, self.m_profileVarName )
	end
	CoD.LeftRightSlider.UpdateBar( self )
end

CoD.LeftRightSlider.SetSliderCallback = function ( self, callbackFunc )
	self.m_sliderCallback = callbackFunc
end

CoD.LeftRightSlider.GainFocus = function ( self, event )
	local retVal = CoD.CoD9Button.GainFocus( self, event )
	self:dispatchEventToParent( CoD.LeftRightSlider.LeftRightSelectorGainFocusEvent )
	if self.m_allowCycling == false and not self.disabled then
		self:dispatchEventToParent( CoD.LeftRightSlider.LeftRightSelectorLoseFocusEvent )
	end
	return retVal
end

CoD.LeftRightSlider.LoseFocus = function ( self, event )
	CoD.CoD9Button.LoseFocus( self, event )
	self:dispatchEventToParent( CoD.LeftRightSelector.LeftRightSelectorLoseFocusEvent )
end

CoD.LeftRightSlider.new = function ( label, horizontalGap, sliderWidth, currentValue, min, max, defaultAnimationState, changeSFX )
	local slider = CoD.OptionElement.new( label, horizontalGap, defaultAnimationState )
	if sliderWidth == nil then
		sliderWidth = CoD.LeftRightSlider.Width
	end
	slider.id = "LRSlider." .. label
	slider.m_sfx = changeSFX
	slider.bar = LUI.UIElement.new()
	slider.bar:setLeftRight( true, false, 0, 16 )
	slider.bar:setTopBottom( false, false, -CoD.LeftRightSlider.Height / 2, CoD.LeftRightSlider.Height / 2 )
	slider.horizontalList:addElement( slider.bar )
	slider.bar:setupDashes( 20, 0, 0, 18 )
	slider.m_timer = LUI.UITimer.new( 1, "update_bar", false )
	slider.m_barWidth = sliderWidth
	slider.m_barMin = min
	slider.m_barMax = max
	slider.m_barSpeed = CoD.LeftRightSlider.Speed
	if currentValue == nil then
		slider.m_currentValue = (min + max) / 2
	else
		slider.m_currentValue = currentValue
	end
	slider.handleGamepadButton = CoD.LeftRightSlider.HandleGamepadInput
	slider.setSliderCallback = CoD.LeftRightSlider.SetSliderCallback
	slider.updateSlideDirection = CoD.LeftRightSlider.UpdateSlideDirection
	slider.enableCycling = CoD.LeftRightSlider.EnableCycling
	slider.disableCycling = CoD.LeftRightSlider.DisableCycling
	slider:registerEventHandler( "update_bar", CoD.LeftRightSlider.UpdateBar )
	slider:registerEventHandler( "update_bar_from_profile", CoD.LeftRightSlider.UpdateBarFromProfile )
	slider:registerEventHandler( "leftmousedown", CoD.LeftRightSlider.LeftMouseDown )
	slider:registerEventHandler( "leftmouseup", CoD.LeftRightSlider.LeftMouseUp )
	slider:registerEventHandler( "rightmousedown", CoD.LeftRightSlider.RightMouseDown )
	slider:registerEventHandler( "rightmouseup", CoD.LeftRightSlider.RightMouseUp )
	slider:registerEventHandler( "gain_focus", CoD.LeftRightSlider.GainFocus )
	slider:registerEventHandler( "lose_focus", CoD.LeftRightSlider.LoseFocus )
	CoD.LeftRightSlider.UpdateBar( slider )
	return slider
end

CoD.LeftRightSlider.EnableCycling = function ( self, event )
	self.m_allowValueUpdate = true
	self:enable()
end

CoD.LeftRightSlider.DisableCycling = function ( self, event )
	self.m_allowValueUpdate = false
	self:disable()
end

CoD.LeftRightSlider.LeftMouseDown = function ( self, event )
	if self:isInFocus() then
		self:updateSlideDirection( 1 )
		self:addElement( self.m_timer )
	else
		self:updateSlideDirection( nil )
		self.m_timer:close()
	end
end

CoD.LeftRightSlider.LeftMouseUp = function ( self, event )
	self:updateSlideDirection( nil )
	self.m_timer:close()
end

CoD.LeftRightSlider.RightMouseDown = function ( self, event )
	if self:isInFocus() then
		self:updateSlideDirection( -1 )
		self:addElement( self.m_timer )
	else
		self:updateSlideDirection( nil )
		self.m_timer:close()
	end
end

CoD.LeftRightSlider.RightMouseUp = function ( self, event )
	self:updateSlideDirection( nil )
	self.m_timer:close()
end

CoD.LeftRightSlider.UpdateSlideDirection = function ( self, value )
	self.m_slideDirection = value
end

