LUI.UIButton = InheritFrom( LUI.UIElement )
LUI.UIButton.GainFocusEvent = {
	name = "gain_focus"
}
LUI.UIButton.LoseFocusEvent = {
	name = "lose_focus"
}
LUI.UIButton.gainFocus = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.UIButton.super.gainFocus( f1_arg0, f1_arg1 )
	f1_arg0:processEvent( {
		name = "button_over",
		controller = f1_arg1.controller
	} )
	if f1_arg0.actionPromptString then
		f1_arg0:dispatchEventToParent( {
			name = "set_action_prompt_string",
			promptString = f1_arg0.actionPromptString
		} )
	end
	return f1_local0
end

LUI.UIButton.loseFocus = function ( f2_arg0, f2_arg1 )
	LUI.UIButton.super.loseFocus( f2_arg0, f2_arg1 )
	f2_arg0:processEvent( {
		name = "button_up",
		controller = f2_arg1.controller
	} )
end

LUI.UIButton.Up = function ( f3_arg0, f3_arg1 )
	if f3_arg0.disabled and f3_arg0.m_animationStates.disabled ~= nil then
		f3_arg0:animateToState( "disabled", f3_arg0.disableDuration )
	else
		f3_arg0:animateToState( "default", f3_arg0.upDuration, f3_arg0.upEaseIn, f3_arg0.upEaseOut )
	end
	f3_arg0:dispatchEventToChildren( f3_arg1 )
	if f3_arg0:isInFocus() then
		return f3_arg0:processEvent( LUI.UIButton.GainFocusEvent )
	else
		
	end
end

LUI.UIButton.Over = function ( f4_arg0, f4_arg1 )
	if f4_arg0.disabled and f4_arg0.m_animationStates.button_over_disabled ~= nil then
		f4_arg0:animateToState( "button_over_disabled", f4_arg0.disableDuration )
	elseif f4_arg0.m_animationStates.button_over ~= nil then
		f4_arg0:animateToState( "button_over", f4_arg0.overDuration, f4_arg0.overEaseIn, f4_arg0.overEaseOut )
	end
	f4_arg0:dispatchEventToChildren( f4_arg1 )
end

LUI.UIButton.ElementUp = function ( f5_arg0, f5_arg1 )
	
end

LUI.UIButton.ElementDown = function ( f6_arg0, f6_arg1 )
	if f6_arg0.m_animationStates.button_down ~= nil then
		f6_arg0:animateToState( "button_down", f6_arg0.downDuration )
	else
		LUI.UIButton.ElementUp( f6_arg0, f6_arg1 )
	end
	f6_arg0:dispatchEventToChildren( f6_arg1 )
end

LUI.UIButton.ElementOverDown = function ( f7_arg0, f7_arg1 )
	if f7_arg0.m_animationStates.button_over_down ~= nil then
		f7_arg0:animateToState( "button_over_down", f7_arg0.overDownDuration )
	else
		
	end
	f7_arg0:dispatchEventToChildren( f7_arg1 )
end

LUI.UIButton.ElementEnable = function ( f8_arg0, f8_arg1 )
	f8_arg0.disabled = nil
	f8_arg0:dispatchEventToChildren( f8_arg1 )
	f8_arg0:processEvent( {
		name = "button_up"
	} )
end

LUI.UIButton.ElementDisable = function ( f9_arg0, f9_arg1 )
	f9_arg0.disabled = true
	f9_arg0:dispatchEventToChildren( f9_arg1 )
	f9_arg0:processEvent( {
		name = "button_up"
	} )
end

LUI.UIButton.enable = function ( f10_arg0 )
	f10_arg0:processEvent( {
		name = "enable"
	} )
	f10_arg0:processEvent( {
		name = "button_up"
	} )
end

LUI.UIButton.disable = function ( f11_arg0 )
	f11_arg0:processEvent( {
		name = "disable"
	} )
	f11_arg0:processEvent( {
		name = "button_up"
	} )
end

LUI.UIButton.SetupElement = function ( f12_arg0 )
	f12_arg0:registerEventHandler( "enable", LUI.UIButton.ElementEnable )
	f12_arg0:registerEventHandler( "disable", LUI.UIButton.ElementDisable )
	f12_arg0:registerEventHandler( "button_up", LUI.UIButton.Up )
	f12_arg0:registerEventHandler( "button_over", LUI.UIButton.Over )
	f12_arg0:registerEventHandler( "button_down", LUI.UIButton.ElementDown )
	f12_arg0:registerEventHandler( "button_over_down", LUI.UIButton.ElementOverDown )
end

LUI.UIButton.buttonAction = function ( f13_arg0, f13_arg1 )
	if f13_arg0.actionEventName ~= nil then
		f13_arg0:dispatchEventToParent( {
			name = f13_arg0.actionEventName,
			controller = f13_arg1.controller,
			button = f13_arg0
		} )
		if f13_arg0.actionSFX ~= nil then
			Engine.PlaySound( f13_arg0.actionSFX )
		end
	end
end

LUI.UIButton.setActionEventName = function ( f14_arg0, f14_arg1 )
	f14_arg0.actionEventName = f14_arg1
end

LUI.UIButton.setActionEventNameNewStyle = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
	CoD.Menu.AddButtonCallbackFunction( f15_arg1, f15_arg0, f15_arg2, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, f16_arg3 )
		f15_arg0:dispatchEventToParent( {
			name = f15_arg3,
			controller = controller,
			button = f15_arg0
		} )
		if f15_arg0.actionSFX ~= nil then
			Engine.PlaySound( f15_arg0.actionSFX )
		end
		return true
	end )
	f15_arg0.id = f15_arg3
	local f15_local0 = f15_arg0:getParent()
	f15_local0[f15_arg3] = f15_arg0
end

LUI.UIButton.setActionPromptString = function ( f17_arg0, f17_arg1 )
	f17_arg0.actionPromptString = f17_arg1
end

LUI.UIButton.setGainFocusSFX = function ( f18_arg0, f18_arg1 )
	f18_arg0.gainFocusSFX = f18_arg1
end

LUI.UIButton.setActionSFX = function ( f19_arg0, f19_arg1 )
	f19_arg0.actionSFX = f19_arg1
end

LUI.UIButton.clearGainFocusSFX = function ( f20_arg0 )
	f20_arg0.gainFocusSFX = nil
end

LUI.UIButton.clearActionSFX = function ( f21_arg0 )
	f21_arg0.actionSFX = nil
end

LUI.UIButton.new = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
	self:setClass( LUI.UIButton )
	self.id = "LUIButton"
	self:makeFocusable()
	self:setHandleMouse( true )
	self.actionEventName = controller
	if CoD.isSinglePlayer then
		self.gainFocusSFX = "uin_slide_nav_up"
		self.actionSFX = "uin_main_enter"
	else
		self.gainFocusSFX = "cac_grid_nav"
		self.actionSFX = "uin_press_generic"
	end
	return self
end

LUI.UIButton:registerEventHandler( "gain_focus", LUI.UIButton.gainFocus )
LUI.UIButton:registerEventHandler( "lose_focus", LUI.UIButton.loseFocus )
LUI.UIButton:registerEventHandler( "button_action", LUI.UIButton.buttonAction )
LUI.UIButton:SetupElement()
