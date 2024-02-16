-- 78ec82c0d8438092b9b5c5bad107f287
-- This hash is used for caching, delete to decompile the file again

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
CoD.LeftRightSelector.UpdateChoice = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0.m_choices[f1_arg0.m_currentChoice]
	f1_arg0.choiceText:setText( f1_local0.label )
	if f1_local0.callbackFunc ~= nil then
		if f1_local0.callbackFunc( f1_local0.params, f1_arg1 ) == false and f1_arg0.m_lastChoice ~= nil then
			CoD.LeftRightSelector.SetCurrentChoice( f1_arg0, f1_arg0.m_lastChoice )
		else
			f1_arg0:dispatchEventToParent( {
				name = "selector_changed",
				selector = f1_arg0,
				userRequested = f1_arg1
			} )
		end
	end
	f1_arg0.choiceText:setText( f1_arg0.m_choices[f1_arg0.m_currentChoice].label )
end

CoD.LeftRightSelector.FindChoiceForValue = function ( f2_arg0, f2_arg1 )
	local f2_local0, f2_local1 = nil
	if tonumber( f2_arg0.currentValue ) ~= nil then
		f2_local0 = tonumber( f2_arg1 )
	else
		f2_local0 = f2_arg1
	end
	for f2_local5, f2_local6 in pairs( f2_arg0.m_choices ) do
		if tonumber( f2_local6.params.value ) ~= nil then
			f2_local1 = tonumber( f2_local6.params.value )
		else
			f2_local1 = f2_local6.params.value
		end
		if f2_local0 == f2_local1 then
			return f2_local5
		end
	end
end

CoD.LeftRightSelector.PulseDown = function ( f3_arg0, f3_arg1 )
	if not f3_arg1.interrupted then
		f3_arg0:animateToState( "default", 500 )
	end
end

CoD.LeftRightSelector.SetCurrentChoice = function ( f4_arg0, f4_arg1 )
	if f4_arg1 == f4_arg0.m_currentChoice then
		return 
	else
		f4_arg0.m_lastChoice = f4_arg0.m_currentChoice
		f4_arg0.m_currentChoice = f4_arg1
		f4_arg0:dispatchEventToParent( {
			name = "left_right_choice_changed",
			choice = f4_arg1
		} )
	end
end

CoD.LeftRightSelector.SetChoice = function ( f5_arg0, f5_arg1 )
	local f5_local0 = CoD.LeftRightSelector.FindChoiceForValue( f5_arg0, f5_arg1 )
	if f5_local0 == nil then
		return 
	elseif f5_local0 ~= f5_arg0.m_currentChoice then
		if f5_local0 ~= nil then
			CoD.LeftRightSelector.SetCurrentChoice( f5_arg0, f5_local0 )
		end
		f5_arg0:updateChoice()
	end
end

CoD.LeftRightSelector.RefreshChoice = function ( f6_arg0 )
	f6_arg0.currentValue = f6_arg0:getCurrentValue()
	f6_arg0:setChoice( f6_arg0.currentValue )
end

CoD.LeftRightSelector.GetCurrentChoiceValue = function ( f7_arg0 )
	return f7_arg0.m_choices[f7_arg0.m_currentChoice].params.value
end

CoD.LeftRightSelector.Cycle = function ( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg0.m_choices == nil then
		return 
	end
	local f8_local0 = #f8_arg0.m_choices
	if f8_local0 == 0 then
		return 
	elseif f8_arg0.m_sfx then
		Engine.PlaySound( f8_arg0.m_sfx )
	end
	local f8_local1 = nil
	if f8_arg1 == true then
		f8_local1 = 1
	else
		f8_local1 = -1
	end
	if f8_arg0.m_currentChoice == nil then
		CoD.LeftRightSelector.SetCurrentChoice( f8_arg0, 1 )
	else
		local f8_local2 = f8_arg0.m_currentChoice + f8_local1
		if f8_local2 < 1 then
			f8_local2 = f8_local0
		elseif f8_local0 < f8_local2 then
			f8_local2 = 1
		end
		CoD.LeftRightSelector.SetCurrentChoice( f8_arg0, f8_local2 )
	end
	f8_arg0:updateChoice( f8_arg2 )
end

CoD.LeftRightSelector.AddChoice = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	if f9_arg0.m_choices == nil then
		f9_arg0.m_choices = {}
	end
	table.insert( f9_arg0.m_choices, {
		label = f9_arg1,
		callbackFunc = f9_arg2,
		params = f9_arg3
	} )
	if f9_arg0.m_currentChoice == nil then
		f9_arg0:cycle()
	end
	local f9_local0, f9_local1 = nil
	if tonumber( f9_arg3.value ) ~= nil then
		f9_local1 = tonumber( f9_arg3.value )
	else
		f9_local1 = f9_arg3.value
	end
	if tonumber( f9_arg0.currentValue ) ~= nil then
		f9_local0 = tonumber( f9_arg0.currentValue )
	else
		f9_local0 = f9_arg0.currentValue
	end
	if f9_local0 == f9_local1 then
		CoD.LeftRightSelector.SetCurrentChoice( f9_arg0, #f9_arg0.m_choices )
		f9_arg0:updateChoice()
	end
end

CoD.LeftRightSelector.ClearChoices = function ( f10_arg0 )
	f10_arg0.m_choices = nil
end

CoD.LeftRightSelector.HandleGamepadButton = function ( f11_arg0, f11_arg1 )
	if LUI.UIElement.handleGamepadButton( f11_arg0, f11_arg1 ) == true then
		return true
	elseif f11_arg0:isInFocus() and f11_arg1.down == true and f11_arg0.m_allowCycling ~= false then
		local f11_local0 = f11_arg1.button
		if f11_arg1.button == "key_shortcut" then
			f11_local0 = LUI.UIElement.GetCorrespondingGamepadButtonForKey( f11_arg1.key )
		end
		if f11_local0 == "left" then
			if not f11_arg0.disabled then
				f11_arg0:cycle( nil, true )
			end
			return true
		elseif f11_local0 == "right" then
			if not f11_arg0.disabled then
				f11_arg0:cycle( true, true )
			end
			return true
		end
	end
end

CoD.LeftRightSelector.EnableCycling = function ( f12_arg0 )
	f12_arg0.m_allowCycling = true
	if f12_arg0.leftArrow then
		f12_arg0.leftArrow:registerAnimationState( "default", {
			red = CoD.offWhite.r,
			green = CoD.offWhite.g,
			blue = CoD.offWhite.b,
			alpha = 1
		} )
		f12_arg0.leftArrow:registerAnimationState( "button_over", {
			alpha = 1
		} )
		f12_arg0.leftArrow:animateToState( "default" )
	end
	if f12_arg0.rightArrow then
		f12_arg0.rightArrow:registerAnimationState( "default", {
			red = CoD.offWhite.r,
			green = CoD.offWhite.g,
			blue = CoD.offWhite.b,
			alpha = 1
		} )
		f12_arg0.rightArrow:registerAnimationState( "button_over", {
			alpha = 1
		} )
		f12_arg0.rightArrow:animateToState( "default" )
	end
end

CoD.LeftRightSelector.DisableCycling = function ( f13_arg0 )
	f13_arg0.m_allowCycling = false
	if f13_arg0.leftArrow then
		f13_arg0.leftArrow:registerAnimationState( "default", {
			alpha = 0
		} )
		f13_arg0.leftArrow:registerAnimationState( "disabled", {
			red = 0.4,
			green = 0.4,
			blue = 0.4,
			alpha = 0.8
		} )
		f13_arg0.leftArrow:registerAnimationState( "button_over", {
			alpha = 0
		} )
		f13_arg0.leftArrow:animateToState( "default" )
	end
	if f13_arg0.rightArrow then
		f13_arg0.rightArrow:registerAnimationState( "default", {
			alpha = 0
		} )
		f13_arg0.rightArrow:registerAnimationState( "disabled", {
			red = 0.4,
			green = 0.4,
			blue = 0.4,
			alpha = 0.8
		} )
		f13_arg0.rightArrow:registerAnimationState( "button_over", {
			alpha = 0
		} )
		f13_arg0.rightArrow:animateToState( "default" )
	end
end

CoD.LeftRightSelector.MouseOnlyAction = function ( f14_arg0, f14_arg1 )
	if f14_arg0.m_allowCycling ~= false and f14_arg1.isMouse then
		f14_arg0:cycle( true, true )
		return true
	else
		
	end
end

CoD.LeftRightSelector.MouseOnlyActionSecondary = function ( f15_arg0, f15_arg1 )
	if f15_arg0.m_allowCycling ~= false and f15_arg1.isMouse then
		f15_arg0:cycle( nil, true )
		return true
	else
		
	end
end

CoD.LeftRightSelector.MakeReadOnly = function ( f16_arg0, f16_arg1 )
	f16_arg0:disableCycling()
	if f16_arg0.leftArrow ~= nil then
		f16_arg0.leftArrow:animateToState( "disabled", 0 )
	end
	if f16_arg0.rightArrow ~= nil then
		f16_arg0.rightArrow:animateToState( "disabled", 0 )
	end
	f16_arg0:disable()
end

CoD.LeftRightSelector.ButtonUpdate = function ( f17_arg0, f17_arg1 )
	f17_arg0:refreshChoice()
end

CoD.LeftRightSelector.GainFocus = function ( f18_arg0, f18_arg1 )
	local f18_local0 = CoD.CoD9Button.GainFocus( f18_arg0, f18_arg1 )
	f18_arg0:dispatchEventToParent( CoD.LeftRightSelector.LeftRightSelectorGainFocusEvent )
	if f18_arg0.m_allowCycling == false and not f18_arg0.disabled then
		f18_arg0:dispatchEventToParent( CoD.LeftRightSelector.LeftRightSelectorLoseFocusEvent )
	end
	return f18_local0
end

CoD.LeftRightSelector.LoseFocus = function ( f19_arg0, f19_arg1 )
	CoD.CoD9Button.LoseFocus( f19_arg0, f19_arg1 )
	f19_arg0:dispatchEventToParent( CoD.LeftRightSelector.LeftRightSelectorLoseFocusEvent )
end

CoD.LeftRightSelector.new = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4, f20_arg5 )
	local f20_local0 = CoD.OptionElement.new( f20_arg0, f20_arg2, f20_arg3 )
	f20_local0.label.overDuration = nil
	f20_local0.label.upDuration = nil
	if not f20_arg4 then
		f20_arg4 = CoD.LeftRightSelector.ChangeSFX
	end
	f20_local0.m_sfx = f20_arg4
	f20_local0.id = "LRSelector." .. f20_arg0
	f20_local0.currentValue = f20_arg1
	if not CoD.isPC then
		f20_local0.leftArrow = LUI.UIImage.new( {
			red = CoD.ButtonTextColor.r,
			green = CoD.ButtonTextColor.g,
			blue = CoD.ButtonTextColor.b,
			alpha = 1,
			material = CoD.LeftRightSelector.LeftArrowMaterial
		} )
		f20_local0.leftArrow:setLeftRight( true, false, 0, CoD.LeftRightSelector.ArrowSize )
		f20_local0.leftArrow:setTopBottom( false, false, -CoD.LeftRightSelector.ArrowSize / 2, CoD.LeftRightSelector.ArrowSize / 2 )
		f20_local0.horizontalList:addElement( f20_local0.leftArrow )
		CoD.CoD9Button.SetupTextElement( f20_local0.leftArrow )
		f20_local0.leftArrow.overDuration = nil
		f20_local0.leftArrow.upDuration = nil
		f20_local0.leftArrow:registerAnimationState( "button_over", {
			red = CoD.BOIIOrange.r,
			green = CoD.BOIIOrange.g,
			blue = CoD.BOIIOrange.b,
			alpha = 1
		} )
	end
	f20_local0.choiceText = LUI.UITightText.new( {
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1
	} )
	local f20_local1 = "Condensed"
	local f20_local2 = CoD.CoD9Button.TextHeight
	if f20_arg5 ~= nil then
		f20_local2 = CoD.textSize[f20_arg5]
	end
	f20_local0.choiceText:setLeftRight( true, true, 0, 0 )
	f20_local0.choiceText:setTopBottom( false, false, -f20_local2 / 2, f20_local2 / 2 )
	f20_local0.choiceText:setTTF( "fonts/escom.ttf" )
	f20_local0.choiceText:registerAnimationState( "pulse", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b
	} )
	if CoD.DisabledTextColor then
		f20_local0.choiceText:registerAnimationState( "disabled", {
			red = CoD.DisabledTextColor.r,
			green = CoD.DisabledTextColor.g,
			blue = CoD.DisabledTextColor.b
		} )
	else
		f20_local0.choiceText:registerAnimationState( "disabled", {
			red = CoD.ButtonTextColor.r,
			green = CoD.ButtonTextColor.g,
			blue = CoD.ButtonTextColor.b,
			alpha = 0.5
		} )
	end
	f20_local0.choiceText:registerAnimationState( "default", {
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1
	} )
	f20_local0.choiceText:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		alpha = 1
	} )
	f20_local0.choiceText:registerEventHandler( "transition_complete_pulse", CoD.LeftRightSelector.PulseDown )
	f20_local0.horizontalList:addElement( f20_local0.choiceText )
	CoD.CoD9Button.SetupTextElement( f20_local0.choiceText )
	f20_local0.choiceText.overDuration = nil
	f20_local0.choiceText.upDuration = nil
	if not CoD.isPC then
		f20_local0.rightArrow = LUI.UIImage.new( {
			red = CoD.ButtonTextColor.r,
			green = CoD.ButtonTextColor.g,
			blue = CoD.ButtonTextColor.b,
			alpha = 1,
			material = CoD.LeftRightSelector.RightArrowMaterial
		} )
		f20_local0.rightArrow:setLeftRight( true, false, 0, CoD.LeftRightSelector.ArrowSize )
		f20_local0.rightArrow:setTopBottom( false, false, -CoD.LeftRightSelector.ArrowSize / 2, CoD.LeftRightSelector.ArrowSize / 2 )
		f20_local0.horizontalList:addElement( f20_local0.rightArrow )
		CoD.CoD9Button.SetupTextElement( f20_local0.rightArrow )
		f20_local0.rightArrow.overDuration = nil
		f20_local0.rightArrow.upDuration = nil
		f20_local0.rightArrow:registerAnimationState( "button_over", {
			red = CoD.BOIIOrange.r,
			green = CoD.BOIIOrange.g,
			blue = CoD.BOIIOrange.b,
			alpha = 1
		} )
	end
	f20_local0.addChoice = CoD.LeftRightSelector.AddChoice
	f20_local0.clearChoices = CoD.LeftRightSelector.ClearChoices
	f20_local0.cycle = CoD.LeftRightSelector.Cycle
	f20_local0.updateChoice = CoD.LeftRightSelector.UpdateChoice
	f20_local0.refreshChoice = CoD.LeftRightSelector.RefreshChoice
	f20_local0.setChoice = CoD.LeftRightSelector.SetChoice
	f20_local0.handleGamepadButton = CoD.LeftRightSelector.HandleGamepadButton
	f20_local0.enableCycling = CoD.LeftRightSelector.EnableCycling
	f20_local0.disableCycling = CoD.LeftRightSelector.DisableCycling
	f20_local0.getCurrentChoiceValue = CoD.LeftRightSelector.GetCurrentChoiceValue
	f20_local0:registerEventHandler( "button_action", CoD.LeftRightSelector.MouseOnlyAction )
	f20_local0:registerEventHandler( "button_actionsecondary", CoD.LeftRightSelector.MouseOnlyActionSecondary )
	f20_local0:registerEventHandler( "button_readonly", CoD.LeftRightSelector.MakeReadOnly )
	f20_local0:registerEventHandler( "button_update", CoD.LeftRightSelector.ButtonUpdate )
	f20_local0:registerEventHandler( "gain_focus", CoD.LeftRightSelector.GainFocus )
	f20_local0:registerEventHandler( "lose_focus", CoD.LeftRightSelector.LoseFocus )
	return f20_local0
end

