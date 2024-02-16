require( "ui.T6.CoD9Button" )
require( "ui.T6.GametypeSettingLeftRightSelector" )
require( "ui.T6.ProfileLeftRightSelector" )

CoD.ButtonList = {}
CoD.ButtonList.ButtonSpacing = 2
CoD.ButtonList.DefaultWidth = 400
CoD.ButtonList.Button_HintTextListener_GainFocus = function ( self, event )
	local button = self:getParent()
	local buttonList = button:getParent()
	if buttonList and buttonList.updateHintText then
		buttonList:updateHintText( button )
	end
end

CoD.ButtonList.AssociateHintTextListenerToButton = function ( button )
	local hintTextListener = LUI.UIElement.new()
	button:addElement( hintTextListener )
	hintTextListener:registerEventHandler( "gain_focus", CoD.ButtonList.Button_HintTextListener_GainFocus )
end

CoD.ButtonList.UpdateHintText = function ( self, button )
	if self.hintText ~= nil then
		if button.hintText ~= nil then
			self.hintText:updateText( button.hintText )
		else
			self.hintText:removeText()
		end
	end
end

CoD.ButtonList.UpdateHintTextEvent = function ( self, event )
	self:updateHintText( event.button )
end

CoD.ButtonList.DisableInput = function ( self )
	self.m_inputDisabled = true
	self:dispatchEventToChildren( {
		name = "disable_input"
	} )
	if self.hintText then
		self.hintText:close()
	end
end

CoD.ButtonList.EnableInput = function ( self )
	self.m_inputDisabled = false
	if self.hintText then
		self:addElement( self.hintText )
	end
end

CoD.ButtonList.AddButton = function ( self, text, hintText, priority )
	local newButton = CoD.CoD9Button.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}, nil, self.centerButtons )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	newButton:setLabel( text )
	self:addElement( newButton )
	self[newButton.id] = newButton
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.gainFocusSFX ~= nil then
		newButton:setGainFocusSFX( self.gainFocusSFX )
	end
	if self.actionSFX ~= nil then
		newButton:setActionSFX( self.actionSFX )
	end
	newButton.buttonList = self
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddRegistrationButton = function ( self, text, hintText, priority )
	local newButton = CoD.CoD9Button.NewRegistrationButton( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}, nil, self.centerButtons, "Default" )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	newButton:setLabel( text )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.gainFocusSFX ~= nil then
		newButton:setGainFocusSFX( self.gainFocusSFX )
	end
	if self.actionSFX ~= nil then
		newButton:setActionSFX( self.actionSFX )
	end
	newButton.buttonList = self
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddCustomButton = function ( self, button )
	self:addElement( button )
	CoD.ButtonList.AssociateHintTextListenerToButton( button )
	if self.gainFocusSFX ~= nil then
		button:setGainFocusSFX( self.gainFocusSFX )
	end
	if self.actionSFX ~= nil then
		button:setActionSFX( self.actionSFX )
	end
end

CoD.ButtonList.AddNavButton = function ( self, text, actionEventName, priority )
	local buttonHeight = 50
	local button = CoD.NavButton.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = buttonHeight
	}, text, actionEventName )
	button:setPriority( priority )
	self:addElement( button )
	return button
end

CoD.ButtonList.AddText = function ( self, text )
	local textField = LUI.UIText.new()
	textField:setLeftRight( true, false, 0, 0 )
	textField:setTopBottom( true, false, 0, CoD.CoD9Button.Height )
	textField:setText( text )
	self:addElement( textField )
	return textField
end

CoD.ButtonList.AddLeftRightSelector = function ( self, text, currentValue, horizontalGap, hintText, priority, fontName )
	local fontHeight = CoD.CoD9Button.Height
	if fontName ~= nil then
		fontHeight = CoD.textSize[fontName]
	end
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = fontHeight
	}
	local newButton = CoD.LeftRightSelector.new( text, currentValue, horizontalGap, newButtonDefaultAnimState, nil, fontName )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddLeftRightSlider = function ( self, text, min, max, horizontalGap, width, hintText, priority )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local newButton = CoD.LeftRightSlider.new( text, horizontalGap, width, nil, min, max, newButtonDefaultAnimState )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddDiscreteLeftRightSlider = function ( self, text, min, max, step, horizontalGap, width, hintText, priority )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local newButton = CoD.DiscreteLeftRightSlider.new( text, horizontalGap, width, nil, min, max, step, newButtonDefaultAnimState )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddProfileLeftRightSelector = function ( self, controller, text, profileVarName, hintText, horizontalGap, priority, sfx )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local newButton = CoD.ProfileLeftRightSelector.new( controller, text, profileVarName, horizontalGap, newButtonDefaultAnimState, sfx )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddProfileLeftRightSlider = function ( self, controller, text, profileVarName, minVal, maxVal, hintText, horizontalGap, priority, sfx )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local newButton = CoD.ProfileLeftRightSlider.new( controller, text, profileVarName, minVal, maxVal, horizontalGap, newButtonDefaultAnimState, sfx )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddProfileDiscreteLeftRightSlider = function ( self, controller, text, profileVarName, minVarVal, maxVarVal, hintText, minSliderVal, maxSliderVal, stepSliderVal, horizontalGap, priority )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local newButton = CoD.ProfileDiscreteLeftRightSlider.new( controller, text, profileVarName, minVarVal, maxVarVal, minSliderVal, maxSliderVal, stepSliderVal, horizontalGap, newButtonDefaultAnimState )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddDvarLeftRightSelector = function ( self, controller, text, dvarName, hintText, horizontalGap, priority )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local newButton = CoD.DvarLeftRightSelector.new( controller, text, dvarName, horizontalGap, newButtonDefaultAnimState )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddDvarLeftRightSlider = function ( self, controller, text, dvarName, minVal, maxVal, hintText, horizontalGap, priority )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local newButton = CoD.DvarLeftRightSlider.new( controller, text, dvarName, minVal, maxVal, horizontalGap, newButtonDefaultAnimState )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddGametypeSettingLeftRightSelector = function ( self, menu, controller, text, settingName, hintText, horizontalGap, priority )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local newButton = CoD.GametypeSettingLeftRightSelector.new( controller, text, settingName, horizontalGap, newButtonDefaultAnimState )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	self[newButton.id] = newButton
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		element:handleGamepadButton( {
			button = "right",
			down = true
		} )
	end, function ( element, menu, controller )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		element:handleGamepadButton( {
			button = "left",
			down = true
		} )
	end, function ( element, menu, controller )
		return false
	end, false )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.AddKeyBindSelector = function ( self, controller, label, command, bindIndex, hintText, horizontalGap, priority )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}
	local newButton = CoD.KeyBindSelector.new( controller, label, command, bindIndex, horizontalGap, newButtonDefaultAnimState )
	newButton.hintText = hintText
	newButton:setPriority( priority )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	if self.buttonBackingAnimationState then
		newButton:addBackground( self.buttonBackingAnimationState )
	end
	return newButton
end

CoD.ButtonList.RemoveAllButtons = function ( buttonList )
	buttonList:removeAllChildren()
	buttonList:addElement( buttonList.upRepeater )
	buttonList:addElement( buttonList.downRepeater )
	buttonList:addElement( buttonList.hintText )
end

CoD.ButtonList.CancelRepetition = function ( buttonList )
	if buttonList.upRepeater ~= nil then
		buttonList.upRepeater:cancelRepetition()
	end
	if buttonList.downRepeater ~= nil then
		buttonList.downRepeater:cancelRepetition()
	end
end

CoD.ButtonList.LoseFocus = function ( buttonList, event )
	buttonList:cancelRepetition()
	LUI.UIElement.loseFocus( buttonList, event )
end

CoD.ButtonList.SetButtonBackingAnimationState = function ( self, animationState )
	self.buttonBackingAnimationState = animationState
end

CoD.ButtonList.RecordCurrFocusedElemID = function ( self, event )
	self.lastFocusedElemEvent = event
	if not event.idStack then
		error( "LUI Error: " .. event.name .. " processed without event.idStack " )
	end
	table.insert( event.idStack, 1, self.id )
	return self:dispatchEventToParent( event )
end

CoD.ButtonList.new = function ( defaultAnimationState, buttonSpacing, centerButtons, hintTextObj )
	if buttonSpacing == nil then
		buttonSpacing = CoD.ButtonList.ButtonSpacing
	end
	local buttonList = LUI.UIVerticalList.new( defaultAnimationState )
	buttonList:setSpacing( buttonSpacing )
	buttonList.id = "ButtonList"
	buttonList:makeFocusable()
	buttonList.upRepeater = LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} )
	buttonList.downRepeater = LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} )
	buttonList:addElement( buttonList.upRepeater )
	buttonList:addElement( buttonList.downRepeater )
	if hintTextObj == nil then
		local hintTextDefaultAnimState = {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = CoD.HintText.Height
		}
		buttonList.hintText = CoD.HintText.new( hintTextDefaultAnimState )
		buttonList:addElement( buttonList.hintText )
	else
		buttonList.hintText = hintTextObj
	end
	if CoD.isMultiplayer == true then
		buttonList.hintText.hintArrow:setRGB( 0.43, 0.49, 0.53 )
		buttonList.hintText.hintArrow:setAlpha( 1 )
		buttonList.hintText.hint:setRGB( 0.43, 0.49, 0.53 )
		buttonList.hintText.hint:setAlpha( 1 )
	end
	buttonList.hintText:setPriority( 200 )
	buttonList.centerButtons = centerButtons
	buttonList.addButton = CoD.ButtonList.AddButton
	buttonList.addCustomButton = CoD.ButtonList.AddCustomButton
	buttonList.addNavButton = CoD.ButtonList.AddNavButton
	buttonList.addText = CoD.ButtonList.AddText
	buttonList.addLeftRightSelector = CoD.ButtonList.AddLeftRightSelector
	buttonList.addLeftRightSlider = CoD.ButtonList.AddLeftRightSlider
	buttonList.addDiscreteLeftRightSlider = CoD.ButtonList.AddDiscreteLeftRightSlider
	buttonList.addProfileLeftRightSelector = CoD.ButtonList.AddProfileLeftRightSelector
	buttonList.addProfileLeftRightSlider = CoD.ButtonList.AddProfileLeftRightSlider
	buttonList.addProfileDiscreteLeftRightSlider = CoD.ButtonList.AddProfileDiscreteLeftRightSlider
	buttonList.addDvarLeftRightSelector = CoD.ButtonList.AddDvarLeftRightSelector
	buttonList.addDvarLeftRightSlider = CoD.ButtonList.AddDvarLeftRightSlider
	buttonList.addGametypeSettingLeftRightSelector = CoD.ButtonList.AddGametypeSettingLeftRightSelector
	buttonList.addKeyBindSelector = CoD.ButtonList.AddKeyBindSelector
	buttonList.removeAllButtons = CoD.ButtonList.RemoveAllButtons
	buttonList.cancelRepetition = CoD.ButtonList.CancelRepetition
	buttonList.setButtonBackingAnimationState = CoD.ButtonList.SetButtonBackingAnimationState
	buttonList.updateHintText = CoD.ButtonList.UpdateHintText
	buttonList:registerEventHandler( "lose_focus", CoD.ButtonList.LoseFocus )
	buttonList:registerEventHandler( "update_hint_text", CoD.ButtonList.UpdateHintTextEvent )
	buttonList:registerEventHandler( "record_curr_focused_elem_id", CoD.ButtonList.RecordCurrFocusedElemID )
	return buttonList
end

