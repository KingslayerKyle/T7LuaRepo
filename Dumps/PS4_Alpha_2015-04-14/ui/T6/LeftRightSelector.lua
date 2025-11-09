require( "ui.T6.OptionElement" )

CoD.LeftRightSelector = {}
CoD.LeftRightSelector.ArrowSize = CoD.CoD9Button.TextHeight
CoD.LeftRightSelector.LeftArrowMaterial = RegisterMaterial( "ui_arrow_left" )
CoD.LeftRightSelector.RightArrowMaterial = RegisterMaterial( "ui_arrow_right" )
CoD.LeftRightSelector.HorizontalGap = 400
CoD.LeftRightSelector.ChangeSFX = "cac_grid_nav"
CoD.LeftRightSelector.LeftRightSelectorGainFocusEvent = {
	name = "left_right_selector_gain_focus"
}
CoD.LeftRightSelector.LeftRightSelectorLoseFocusEvent = {
	name = "left_right_selector_lose_focus"
}
CoD.LeftRightSelector.UpdateChoice = function ( self, userRequested )
	local choice = self.m_choices[self.m_currentChoice]
	self.choiceText:setText( choice.label )
	if choice.callbackFunc ~= nil then
		if choice.callbackFunc( choice.params, userRequested ) == false and self.m_lastChoice ~= nil then
			CoD.LeftRightSelector.SetCurrentChoice( self, self.m_lastChoice )
		else
			self:dispatchEventToParent( {
				name = "selector_changed",
				selector = self,
				userRequested = userRequested
			} )
		end
	end
	self.choiceText:setText( self.m_choices[self.m_currentChoice].label )
end

CoD.LeftRightSelector.FindChoiceForValue = function ( self, value )
	local valueToCompare, currentValueToCompare = nil
	if tonumber( self.currentValue ) ~= nil then
		valueToCompare = tonumber( value )
	else
		valueToCompare = value
	end
	for index, choice in pairs( self.m_choices ) do
		if tonumber( choice.params.value ) ~= nil then
			currentValueToCompare = tonumber( choice.params.value )
		else
			currentValueToCompare = choice.params.value
		end
		if valueToCompare == currentValueToCompare then
			return index
		end
	end
end

CoD.LeftRightSelector.PulseDown = function ( self, event )
	if not event.interrupted then
		self:animateToState( "default", 500 )
	end
end

CoD.LeftRightSelector.SetCurrentChoice = function ( self, choice )
	if choice == self.m_currentChoice then
		return 
	else
		self.m_lastChoice = self.m_currentChoice
		self.m_currentChoice = choice
		self:dispatchEventToParent( {
			name = "left_right_choice_changed",
			choice = choice
		} )
	end
end

CoD.LeftRightSelector.SetChoice = function ( self, value )
	local index = CoD.LeftRightSelector.FindChoiceForValue( self, value )
	if index == nil then
		return 
	elseif index ~= self.m_currentChoice then
		if index ~= nil then
			CoD.LeftRightSelector.SetCurrentChoice( self, index )
		end
		self:updateChoice()
	end
end

CoD.LeftRightSelector.RefreshChoice = function ( self )
	self.currentValue = self:getCurrentValue()
	self:setChoice( self.currentValue )
end

CoD.LeftRightSelector.GetCurrentChoiceValue = function ( self )
	local choice = self.m_choices[self.m_currentChoice]
	return choice.params.value
end

CoD.LeftRightSelector.Cycle = function ( self, backward, userRequested )
	if self.m_choices == nil then
		return 
	end
	local numChoices = #self.m_choices
	if numChoices == 0 then
		return 
	elseif self.m_sfx then
		Engine.PlaySound( self.m_sfx )
	end
	local direction = nil
	if backward == true then
		direction = 1
	else
		direction = -1
	end
	if self.m_currentChoice == nil then
		CoD.LeftRightSelector.SetCurrentChoice( self, 1 )
	else
		local newChoice = self.m_currentChoice + direction
		if newChoice < 1 then
			newChoice = numChoices
		elseif numChoices < newChoice then
			newChoice = 1
		end
		CoD.LeftRightSelector.SetCurrentChoice( self, newChoice )
	end
	self:updateChoice( userRequested )
end

CoD.LeftRightSelector.AddChoice = function ( self, label, callbackFunc, params )
	if self.m_choices == nil then
		self.m_choices = {}
	end
	local choice = {
		label = label,
		callbackFunc = callbackFunc,
		params = params
	}
	table.insert( self.m_choices, choice )
	if self.m_currentChoice == nil then
		self:cycle()
	end
	local currentValueToCompare, valueToCompare = nil
	if tonumber( params.value ) ~= nil then
		valueToCompare = tonumber( params.value )
	else
		valueToCompare = params.value
	end
	if tonumber( self.currentValue ) ~= nil then
		currentValueToCompare = tonumber( self.currentValue )
	else
		currentValueToCompare = self.currentValue
	end
	if currentValueToCompare == valueToCompare then
		CoD.LeftRightSelector.SetCurrentChoice( self, #self.m_choices )
		self:updateChoice()
	end
end

CoD.LeftRightSelector.ClearChoices = function ( self )
	self.m_choices = nil
end

CoD.LeftRightSelector.HandleGamepadButton = function ( self, event )
	if LUI.UIElement.handleGamepadButton( self, event ) == true then
		return true
	elseif self:isInFocus() and event.down == true and self.m_allowCycling ~= false then
		if event.button == "left" then
			if not self.disabled then
				self:cycle( nil, true )
			end
			return true
		elseif event.button == "right" then
			if not self.disabled then
				self:cycle( true, true )
			end
			return true
		end
	end
end

CoD.LeftRightSelector.EnableCycling = function ( self )
	self.m_allowCycling = true
	if self.leftArrow then
		self.leftArrow:registerAnimationState( "default", {
			red = CoD.offWhite.r,
			green = CoD.offWhite.g,
			blue = CoD.offWhite.b,
			alpha = 1
		} )
		self.leftArrow:registerAnimationState( "button_over", {
			alpha = 1
		} )
		self.leftArrow:animateToState( "default" )
	end
	if self.rightArrow then
		self.rightArrow:registerAnimationState( "default", {
			red = CoD.offWhite.r,
			green = CoD.offWhite.g,
			blue = CoD.offWhite.b,
			alpha = 1
		} )
		self.rightArrow:registerAnimationState( "button_over", {
			alpha = 1
		} )
		self.rightArrow:animateToState( "default" )
	end
end

CoD.LeftRightSelector.DisableCycling = function ( self )
	self.m_allowCycling = false
	if self.leftArrow then
		self.leftArrow:registerAnimationState( "default", {
			alpha = 0
		} )
		self.leftArrow:registerAnimationState( "disabled", {
			red = 0.4,
			green = 0.4,
			blue = 0.4,
			alpha = 0.8
		} )
		self.leftArrow:registerAnimationState( "button_over", {
			alpha = 0
		} )
		self.leftArrow:animateToState( "default" )
	end
	if self.rightArrow then
		self.rightArrow:registerAnimationState( "default", {
			alpha = 0
		} )
		self.rightArrow:registerAnimationState( "disabled", {
			red = 0.4,
			green = 0.4,
			blue = 0.4,
			alpha = 0.8
		} )
		self.rightArrow:registerAnimationState( "button_over", {
			alpha = 0
		} )
		self.rightArrow:animateToState( "default" )
	end
end

CoD.LeftRightSelector.MouseOnlyAction = function ( self, event )
	if self.m_allowCycling ~= false and event.isMouse then
		self:cycle( true, true )
		return true
	else
		
	end
end

CoD.LeftRightSelector.MouseOnlyActionSecondary = function ( self, event )
	if self.m_allowCycling ~= false and event.isMouse then
		self:cycle( nil, true )
		return true
	else
		
	end
end

CoD.LeftRightSelector.MakeReadOnly = function ( self, event )
	self:disableCycling()
	if self.leftArrow ~= nil then
		self.leftArrow:animateToState( "disabled", 0 )
	end
	if self.rightArrow ~= nil then
		self.rightArrow:animateToState( "disabled", 0 )
	end
	self:disable()
end

CoD.LeftRightSelector.ButtonUpdate = function ( self, event )
	self:refreshChoice()
end

CoD.LeftRightSelector.GainFocus = function ( self, event )
	local retVal = CoD.CoD9Button.GainFocus( self, event )
	self:dispatchEventToParent( CoD.LeftRightSelector.LeftRightSelectorGainFocusEvent )
	if self.m_allowCycling == false and not self.disabled then
		self:dispatchEventToParent( CoD.LeftRightSelector.LeftRightSelectorLoseFocusEvent )
	end
	return retVal
end

CoD.LeftRightSelector.LoseFocus = function ( self, event )
	CoD.CoD9Button.LoseFocus( self, event )
	self:dispatchEventToParent( CoD.LeftRightSelector.LeftRightSelectorLoseFocusEvent )
end

CoD.LeftRightSelector.new = function ( label, currentValue, horizontalGap, defaultAnimationState, changeSFX, fontName )
	local selector = CoD.OptionElement.new( label, horizontalGap, defaultAnimationState )
	selector.label.overDuration = nil
	selector.label.upDuration = nil
	if not changeSFX then
		changeSFX = CoD.LeftRightSelector.ChangeSFX
	end
	selector.m_sfx = changeSFX
	selector.id = "LRSelector." .. label
	selector.currentValue = currentValue
	if not CoD.isPC then
		selector.leftArrow = LUI.UIImage.new( {
			red = CoD.ButtonTextColor.r,
			green = CoD.ButtonTextColor.g,
			blue = CoD.ButtonTextColor.b,
			alpha = 1,
			material = CoD.LeftRightSelector.LeftArrowMaterial
		} )
		selector.leftArrow:setLeftRight( true, false, 0, CoD.LeftRightSelector.ArrowSize )
		selector.leftArrow:setTopBottom( false, false, -CoD.LeftRightSelector.ArrowSize / 2, CoD.LeftRightSelector.ArrowSize / 2 )
		selector.horizontalList:addElement( selector.leftArrow )
		CoD.CoD9Button.SetupTextElement( selector.leftArrow )
		selector.leftArrow.overDuration = nil
		selector.leftArrow.upDuration = nil
		selector.leftArrow:registerAnimationState( "button_over", {
			red = CoD.BOIIOrange.r,
			green = CoD.BOIIOrange.g,
			blue = CoD.BOIIOrange.b,
			alpha = 1
		} )
	end
	selector.choiceText = LUI.UITightText.new( {
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1
	} )
	local fontNameToUse = "Condensed"
	local fontHeight = CoD.CoD9Button.TextHeight
	if fontName ~= nil then
		fontHeight = CoD.textSize[fontName]
	end
	selector.choiceText:setLeftRight( true, true, 0, 0 )
	selector.choiceText:setTopBottom( false, false, -fontHeight / 2, fontHeight / 2 )
	selector.choiceText:setTTF( "fonts/Entovo.ttf" )
	selector.choiceText:registerAnimationState( "pulse", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b
	} )
	if CoD.DisabledTextColor then
		selector.choiceText:registerAnimationState( "disabled", {
			red = CoD.DisabledTextColor.r,
			green = CoD.DisabledTextColor.g,
			blue = CoD.DisabledTextColor.b
		} )
	else
		selector.choiceText:registerAnimationState( "disabled", {
			red = CoD.ButtonTextColor.r,
			green = CoD.ButtonTextColor.g,
			blue = CoD.ButtonTextColor.b,
			alpha = 0.5
		} )
	end
	selector.choiceText:registerAnimationState( "default", {
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1
	} )
	selector.choiceText:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		alpha = 1
	} )
	selector.choiceText:registerEventHandler( "transition_complete_pulse", CoD.LeftRightSelector.PulseDown )
	selector.horizontalList:addElement( selector.choiceText )
	CoD.CoD9Button.SetupTextElement( selector.choiceText )
	selector.choiceText.overDuration = nil
	selector.choiceText.upDuration = nil
	if not CoD.isPC then
		selector.rightArrow = LUI.UIImage.new( {
			red = CoD.ButtonTextColor.r,
			green = CoD.ButtonTextColor.g,
			blue = CoD.ButtonTextColor.b,
			alpha = 1,
			material = CoD.LeftRightSelector.RightArrowMaterial
		} )
		selector.rightArrow:setLeftRight( true, false, 0, CoD.LeftRightSelector.ArrowSize )
		selector.rightArrow:setTopBottom( false, false, -CoD.LeftRightSelector.ArrowSize / 2, CoD.LeftRightSelector.ArrowSize / 2 )
		selector.horizontalList:addElement( selector.rightArrow )
		CoD.CoD9Button.SetupTextElement( selector.rightArrow )
		selector.rightArrow.overDuration = nil
		selector.rightArrow.upDuration = nil
		selector.rightArrow:registerAnimationState( "button_over", {
			red = CoD.BOIIOrange.r,
			green = CoD.BOIIOrange.g,
			blue = CoD.BOIIOrange.b,
			alpha = 1
		} )
	end
	selector.addChoice = CoD.LeftRightSelector.AddChoice
	selector.clearChoices = CoD.LeftRightSelector.ClearChoices
	selector.cycle = CoD.LeftRightSelector.Cycle
	selector.updateChoice = CoD.LeftRightSelector.UpdateChoice
	selector.refreshChoice = CoD.LeftRightSelector.RefreshChoice
	selector.setChoice = CoD.LeftRightSelector.SetChoice
	selector.handleGamepadButton = CoD.LeftRightSelector.HandleGamepadButton
	selector.enableCycling = CoD.LeftRightSelector.EnableCycling
	selector.disableCycling = CoD.LeftRightSelector.DisableCycling
	selector.getCurrentChoiceValue = CoD.LeftRightSelector.GetCurrentChoiceValue
	selector:registerEventHandler( "button_action", CoD.LeftRightSelector.MouseOnlyAction )
	selector:registerEventHandler( "button_actionsecondary", CoD.LeftRightSelector.MouseOnlyActionSecondary )
	selector:registerEventHandler( "button_readonly", CoD.LeftRightSelector.MakeReadOnly )
	selector:registerEventHandler( "button_update", CoD.LeftRightSelector.ButtonUpdate )
	selector:registerEventHandler( "gain_focus", CoD.LeftRightSelector.GainFocus )
	selector:registerEventHandler( "lose_focus", CoD.LeftRightSelector.LoseFocus )
	return selector
end

