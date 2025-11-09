require( "ui.T6.CoD9Button" )
require( "ui.T6.GametypeSettingLeftRightSelector" )
require( "ui.T6.ProfileLeftRightSelector" )

CoD.ButtonList = {}
CoD.ButtonList.ButtonSpacing = 2
CoD.ButtonList.DefaultWidth = 400
CoD.ButtonList.Button_HintTextListener_GainFocus = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0:getParent()
	local f1_local1 = f1_local0:getParent()
	if f1_local1 and f1_local1.updateHintText then
		f1_local1:updateHintText( f1_local0 )
	end
end

CoD.ButtonList.AssociateHintTextListenerToButton = function ( f2_arg0 )
	local self = LUI.UIElement.new()
	f2_arg0:addElement( self )
	self:registerEventHandler( "gain_focus", CoD.ButtonList.Button_HintTextListener_GainFocus )
end

CoD.ButtonList.UpdateHintText = function ( f3_arg0, f3_arg1 )
	if f3_arg0.hintText ~= nil then
		if f3_arg1.hintText ~= nil then
			f3_arg0.hintText:updateText( f3_arg1.hintText )
		else
			f3_arg0.hintText:removeText()
		end
	end
end

CoD.ButtonList.UpdateHintTextEvent = function ( f4_arg0, f4_arg1 )
	f4_arg0:updateHintText( f4_arg1.button )
end

CoD.ButtonList.DisableInput = function ( f5_arg0 )
	f5_arg0.m_inputDisabled = true
	f5_arg0:dispatchEventToChildren( {
		name = "disable_input"
	} )
	if f5_arg0.hintText then
		f5_arg0.hintText:close()
	end
end

CoD.ButtonList.EnableInput = function ( f6_arg0 )
	f6_arg0.m_inputDisabled = false
	if f6_arg0.hintText then
		f6_arg0:addElement( f6_arg0.hintText )
	end
end

CoD.ButtonList.AddButton = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	local f7_local0 = CoD.CoD9Button.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}, nil, f7_arg0.centerButtons )
	f7_local0.hintText = f7_arg2
	f7_local0:setPriority( f7_arg3 )
	f7_local0:setLabel( f7_arg1 )
	f7_arg0:addElement( f7_local0 )
	f7_arg0[f7_local0.id] = f7_local0
	CoD.ButtonList.AssociateHintTextListenerToButton( f7_local0 )
	if f7_arg0.gainFocusSFX ~= nil then
		f7_local0:setGainFocusSFX( f7_arg0.gainFocusSFX )
	end
	if f7_arg0.actionSFX ~= nil then
		f7_local0:setActionSFX( f7_arg0.actionSFX )
	end
	f7_local0.buttonList = f7_arg0
	if f7_arg0.buttonBackingAnimationState then
		f7_local0:addBackground( f7_arg0.buttonBackingAnimationState )
	end
	return f7_local0
end

CoD.ButtonList.AddRegistrationButton = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	local f8_local0 = CoD.CoD9Button.NewRegistrationButton( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}, nil, f8_arg0.centerButtons, "Default" )
	f8_local0.hintText = f8_arg2
	f8_local0:setPriority( f8_arg3 )
	f8_local0:setLabel( f8_arg1 )
	f8_arg0:addElement( f8_local0 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f8_local0 )
	if f8_arg0.gainFocusSFX ~= nil then
		f8_local0:setGainFocusSFX( f8_arg0.gainFocusSFX )
	end
	if f8_arg0.actionSFX ~= nil then
		f8_local0:setActionSFX( f8_arg0.actionSFX )
	end
	f8_local0.buttonList = f8_arg0
	if f8_arg0.buttonBackingAnimationState then
		f8_local0:addBackground( f8_arg0.buttonBackingAnimationState )
	end
	return f8_local0
end

CoD.ButtonList.AddCustomButton = function ( f9_arg0, f9_arg1 )
	f9_arg0:addElement( f9_arg1 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f9_arg1 )
	if f9_arg0.gainFocusSFX ~= nil then
		f9_arg1:setGainFocusSFX( f9_arg0.gainFocusSFX )
	end
	if f9_arg0.actionSFX ~= nil then
		f9_arg1:setActionSFX( f9_arg0.actionSFX )
	end
end

CoD.ButtonList.AddNavButton = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = CoD.NavButton.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = 50
	}, f10_arg1, f10_arg2 )
	f10_local0:setPriority( f10_arg3 )
	f10_arg0:addElement( f10_local0 )
	return f10_local0
end

CoD.ButtonList.AddText = function ( menu, controller )
	local self = LUI.UIText.new()
	self:setLeftRight( true, false, 0, 0 )
	self:setTopBottom( true, false, 0, CoD.CoD9Button.Height )
	self:setText( controller )
	menu:addElement( self )
	return self
end

CoD.ButtonList.AddLeftRightSelector = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5, f12_arg6 )
	local f12_local0 = CoD.CoD9Button.Height
	if f12_arg6 ~= nil then
		f12_local0 = CoD.textSize[f12_arg6]
	end
	local f12_local1 = CoD.LeftRightSelector.new( f12_arg1, f12_arg2, f12_arg3, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = f12_local0
	}, nil, f12_arg6 )
	f12_local1.hintText = f12_arg4
	f12_local1:setPriority( f12_arg5 )
	f12_arg0:addElement( f12_local1 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f12_local1 )
	if f12_arg0.buttonBackingAnimationState then
		f12_local1:addBackground( f12_arg0.buttonBackingAnimationState )
	end
	return f12_local1
end

CoD.ButtonList.AddLeftRightSlider = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4, f13_arg5, f13_arg6, f13_arg7 )
	local f13_local0 = CoD.LeftRightSlider.new( f13_arg1, f13_arg4, f13_arg5, nil, f13_arg2, f13_arg3, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	} )
	f13_local0.hintText = f13_arg6
	f13_local0:setPriority( f13_arg7 )
	f13_arg0:addElement( f13_local0 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f13_local0 )
	if f13_arg0.buttonBackingAnimationState then
		f13_local0:addBackground( f13_arg0.buttonBackingAnimationState )
	end
	return f13_local0
end

CoD.ButtonList.AddDiscreteLeftRightSlider = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5, f14_arg6, f14_arg7, f14_arg8 )
	local f14_local0 = CoD.DiscreteLeftRightSlider.new( f14_arg1, f14_arg5, f14_arg6, nil, f14_arg2, f14_arg3, f14_arg4, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	} )
	f14_local0.hintText = f14_arg7
	f14_local0:setPriority( f14_arg8 )
	f14_arg0:addElement( f14_local0 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f14_local0 )
	if f14_arg0.buttonBackingAnimationState then
		f14_local0:addBackground( f14_arg0.buttonBackingAnimationState )
	end
	return f14_local0
end

CoD.ButtonList.AddProfileLeftRightSelector = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5, f15_arg6, f15_arg7 )
	local f15_local0 = CoD.ProfileLeftRightSelector.new( f15_arg1, f15_arg2, f15_arg3, f15_arg5, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}, f15_arg7 )
	f15_local0.hintText = f15_arg4
	f15_local0:setPriority( f15_arg6 )
	f15_arg0:addElement( f15_local0 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f15_local0 )
	if f15_arg0.buttonBackingAnimationState then
		f15_local0:addBackground( f15_arg0.buttonBackingAnimationState )
	end
	return f15_local0
end

CoD.ButtonList.AddProfileLeftRightSlider = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4, f16_arg5, f16_arg6, f16_arg7, f16_arg8, f16_arg9 )
	local f16_local0 = CoD.ProfileLeftRightSlider.new( f16_arg1, f16_arg2, f16_arg3, f16_arg4, f16_arg5, f16_arg7, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	}, f16_arg9 )
	f16_local0.hintText = f16_arg6
	f16_local0:setPriority( f16_arg8 )
	f16_arg0:addElement( f16_local0 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f16_local0 )
	if f16_arg0.buttonBackingAnimationState then
		f16_local0:addBackground( f16_arg0.buttonBackingAnimationState )
	end
	return f16_local0
end

CoD.ButtonList.AddProfileDiscreteLeftRightSlider = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4, f17_arg5, f17_arg6, f17_arg7, f17_arg8, f17_arg9, f17_arg10, f17_arg11 )
	local f17_local0 = CoD.ProfileDiscreteLeftRightSlider.new( f17_arg1, f17_arg2, f17_arg3, f17_arg4, f17_arg5, f17_arg7, f17_arg8, f17_arg9, f17_arg10, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	} )
	f17_local0.hintText = f17_arg6
	f17_local0:setPriority( f17_arg11 )
	f17_arg0:addElement( f17_local0 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f17_local0 )
	if f17_arg0.buttonBackingAnimationState then
		f17_local0:addBackground( f17_arg0.buttonBackingAnimationState )
	end
	return f17_local0
end

CoD.ButtonList.AddDvarLeftRightSelector = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4, f18_arg5, f18_arg6 )
	local f18_local0 = CoD.DvarLeftRightSelector.new( f18_arg1, f18_arg2, f18_arg3, f18_arg5, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	} )
	f18_local0.hintText = f18_arg4
	f18_local0:setPriority( f18_arg6 )
	f18_arg0:addElement( f18_local0 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f18_local0 )
	if f18_arg0.buttonBackingAnimationState then
		f18_local0:addBackground( f18_arg0.buttonBackingAnimationState )
	end
	return f18_local0
end

CoD.ButtonList.AddDvarLeftRightSlider = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4, f19_arg5, f19_arg6, f19_arg7, f19_arg8 )
	local f19_local0 = CoD.DvarLeftRightSlider.new( f19_arg1, f19_arg2, f19_arg3, f19_arg4, f19_arg5, f19_arg7, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	} )
	f19_local0.hintText = f19_arg6
	f19_local0:setPriority( f19_arg8 )
	f19_arg0:addElement( f19_local0 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f19_local0 )
	if f19_arg0.buttonBackingAnimationState then
		f19_local0:addBackground( f19_arg0.buttonBackingAnimationState )
	end
	return f19_local0
end

CoD.ButtonList.AddGametypeSettingLeftRightSelector = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4, f20_arg5, f20_arg6, f20_arg7 )
	local f20_local0 = CoD.GametypeSettingLeftRightSelector.new( f20_arg2, f20_arg3, f20_arg4, f20_arg6, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	} )
	f20_local0.hintText = f20_arg5
	f20_local0:setPriority( f20_arg7 )
	f20_arg0:addElement( f20_local0 )
	f20_arg0[f20_local0.id] = f20_local0
	CoD.ButtonList.AssociateHintTextListenerToButton( f20_local0 )
	f20_arg1:AddButtonCallbackFunction( f20_arg0, f20_arg2, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		element:handleGamepadButton( {
			button = "right",
			down = true
		} )
	end, function ( element, menu, controller )
		return false
	end, false )
	f20_arg1:AddButtonCallbackFunction( f20_arg0, f20_arg2, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		element:handleGamepadButton( {
			button = "left",
			down = true
		} )
	end, function ( element, menu, controller )
		return false
	end, false )
	if f20_arg0.buttonBackingAnimationState then
		f20_local0:addBackground( f20_arg0.buttonBackingAnimationState )
	end
	return f20_local0
end

CoD.ButtonList.AddKeyBindSelector = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4, f25_arg5, f25_arg6, f25_arg7 )
	local f25_local0 = CoD.KeyBindSelector.new( f25_arg1, f25_arg2, f25_arg3, f25_arg4, f25_arg6, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.CoD9Button.Height
	} )
	f25_local0.hintText = f25_arg5
	f25_local0:setPriority( f25_arg7 )
	f25_arg0:addElement( f25_local0 )
	CoD.ButtonList.AssociateHintTextListenerToButton( f25_local0 )
	if f25_arg0.buttonBackingAnimationState then
		f25_local0:addBackground( f25_arg0.buttonBackingAnimationState )
	end
	return f25_local0
end

CoD.ButtonList.RemoveAllButtons = function ( f26_arg0 )
	f26_arg0:removeAllChildren()
	f26_arg0:addElement( f26_arg0.upRepeater )
	f26_arg0:addElement( f26_arg0.downRepeater )
	f26_arg0:addElement( f26_arg0.hintText )
end

CoD.ButtonList.CancelRepetition = function ( f27_arg0 )
	if f27_arg0.upRepeater ~= nil then
		f27_arg0.upRepeater:cancelRepetition()
	end
	if f27_arg0.downRepeater ~= nil then
		f27_arg0.downRepeater:cancelRepetition()
	end
end

CoD.ButtonList.LoseFocus = function ( f28_arg0, f28_arg1 )
	f28_arg0:cancelRepetition()
	LUI.UIElement.loseFocus( f28_arg0, f28_arg1 )
end

CoD.ButtonList.SetButtonBackingAnimationState = function ( f29_arg0, f29_arg1 )
	f29_arg0.buttonBackingAnimationState = f29_arg1
end

CoD.ButtonList.RecordCurrFocusedElemID = function ( f30_arg0, f30_arg1 )
	f30_arg0.lastFocusedElemEvent = f30_arg1
	if not f30_arg1.idStack then
		error( "LUI Error: " .. f30_arg1.name .. " processed without event.idStack " )
	end
	table.insert( f30_arg1.idStack, 1, f30_arg0.id )
	return f30_arg0:dispatchEventToParent( f30_arg1 )
end

CoD.ButtonList.new = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
	if f31_arg1 == nil then
		f31_arg1 = CoD.ButtonList.ButtonSpacing
	end
	local self = LUI.UIVerticalList.new( f31_arg0 )
	self:setSpacing( f31_arg1 )
	self.id = "ButtonList"
	self:makeFocusable()
	self.upRepeater = LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} )
	self.downRepeater = LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} )
	self:addElement( self.upRepeater )
	self:addElement( self.downRepeater )
	if f31_arg3 == nil then
		self.hintText = CoD.HintText.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = CoD.HintText.Height
		} )
		self:addElement( self.hintText )
	else
		self.hintText = f31_arg3
	end
	if CoD.isMultiplayer == true then
		self.hintText.hintArrow:setRGB( 0.43, 0.49, 0.53 )
		self.hintText.hintArrow:setAlpha( 1 )
		self.hintText.hint:setRGB( 0.43, 0.49, 0.53 )
		self.hintText.hint:setAlpha( 1 )
	end
	self.hintText:setPriority( 200 )
	self.centerButtons = f31_arg2
	self.addButton = CoD.ButtonList.AddButton
	self.addCustomButton = CoD.ButtonList.AddCustomButton
	self.addNavButton = CoD.ButtonList.AddNavButton
	self.addText = CoD.ButtonList.AddText
	self.addLeftRightSelector = CoD.ButtonList.AddLeftRightSelector
	self.addLeftRightSlider = CoD.ButtonList.AddLeftRightSlider
	self.addDiscreteLeftRightSlider = CoD.ButtonList.AddDiscreteLeftRightSlider
	self.addProfileLeftRightSelector = CoD.ButtonList.AddProfileLeftRightSelector
	self.addProfileLeftRightSlider = CoD.ButtonList.AddProfileLeftRightSlider
	self.addProfileDiscreteLeftRightSlider = CoD.ButtonList.AddProfileDiscreteLeftRightSlider
	self.addDvarLeftRightSelector = CoD.ButtonList.AddDvarLeftRightSelector
	self.addDvarLeftRightSlider = CoD.ButtonList.AddDvarLeftRightSlider
	self.addGametypeSettingLeftRightSelector = CoD.ButtonList.AddGametypeSettingLeftRightSelector
	self.addKeyBindSelector = CoD.ButtonList.AddKeyBindSelector
	self.removeAllButtons = CoD.ButtonList.RemoveAllButtons
	self.cancelRepetition = CoD.ButtonList.CancelRepetition
	self.setButtonBackingAnimationState = CoD.ButtonList.SetButtonBackingAnimationState
	self.updateHintText = CoD.ButtonList.UpdateHintText
	self:registerEventHandler( "lose_focus", CoD.ButtonList.LoseFocus )
	self:registerEventHandler( "update_hint_text", CoD.ButtonList.UpdateHintTextEvent )
	self:registerEventHandler( "record_curr_focused_elem_id", CoD.ButtonList.RecordCurrFocusedElemID )
	return self
end

