LUI.UIButton = InheritFrom( LUI.UIElement )
LUI.UIButton.GainFocusEvent = {
	name = "gain_focus"
}
LUI.UIButton.LoseFocusEvent = {
	name = "lose_focus"
}
LUI.UIButton.gainFocus = function ( self, event )
	local retVal = LUI.UIButton.super.gainFocus( self, event )
	self:processEvent( {
		name = "button_over",
		controller = event.controller
	} )
	if self.actionPromptString then
		self:dispatchEventToParent( {
			name = "set_action_prompt_string",
			promptString = self.actionPromptString
		} )
	end
	return retVal
end

LUI.UIButton.loseFocus = function ( self, event )
	LUI.UIButton.super.loseFocus( self, event )
	self:processEvent( {
		name = "button_up",
		controller = event.controller
	} )
end

LUI.UIButton.Up = function ( self, event )
	if self.disabled and self.m_animationStates.disabled ~= nil then
		self:animateToState( "disabled", self.disableDuration )
	else
		self:animateToState( "default", self.upDuration, self.upEaseIn, self.upEaseOut )
	end
	self:dispatchEventToChildren( event )
	if self:isInFocus() then
		return self:processEvent( LUI.UIButton.GainFocusEvent )
	else
		
	end
end

LUI.UIButton.Over = function ( self, event )
	if self.disabled and self.m_animationStates.button_over_disabled ~= nil then
		self:animateToState( "button_over_disabled", self.disableDuration )
	elseif self.m_animationStates.button_over ~= nil then
		self:animateToState( "button_over", self.overDuration, self.overEaseIn, self.overEaseOut )
	end
	self:dispatchEventToChildren( event )
end

LUI.UIButton.ElementUp = function ( self, event )
	
end

LUI.UIButton.ElementDown = function ( self, event )
	if self.m_animationStates.button_down ~= nil then
		self:animateToState( "button_down", self.downDuration )
	else
		LUI.UIButton.ElementUp( self, event )
	end
	self:dispatchEventToChildren( event )
end

LUI.UIButton.ElementOverDown = function ( self, event )
	if self.m_animationStates.button_over_down ~= nil then
		self:animateToState( "button_over_down", self.overDownDuration )
	else
		
	end
	self:dispatchEventToChildren( event )
end

LUI.UIButton.ElementEnable = function ( self, event )
	self.disabled = nil
	self:dispatchEventToChildren( event )
	self:processEvent( {
		name = "button_up"
	} )
end

LUI.UIButton.ElementDisable = function ( self, event )
	self.disabled = true
	self:dispatchEventToChildren( event )
	self:processEvent( {
		name = "button_up"
	} )
end

LUI.UIButton.enable = function ( self )
	self:processEvent( {
		name = "enable"
	} )
	self:processEvent( {
		name = "button_up"
	} )
end

LUI.UIButton.disable = function ( self )
	self:processEvent( {
		name = "disable"
	} )
	self:processEvent( {
		name = "button_up"
	} )
end

LUI.UIButton.SetupElement = function ( element )
	element:registerEventHandler( "enable", LUI.UIButton.ElementEnable )
	element:registerEventHandler( "disable", LUI.UIButton.ElementDisable )
	element:registerEventHandler( "button_up", LUI.UIButton.Up )
	element:registerEventHandler( "button_over", LUI.UIButton.Over )
	element:registerEventHandler( "button_down", LUI.UIButton.ElementDown )
	element:registerEventHandler( "button_over_down", LUI.UIButton.ElementOverDown )
end

LUI.UIButton.buttonAction = function ( self, event )
	if self.actionEventName ~= nil then
		self:dispatchEventToParent( {
			name = self.actionEventName,
			controller = event.controller,
			button = self
		} )
		if self.actionSFX ~= nil then
			Engine.PlaySound( self.actionSFX )
		end
	end
end

LUI.UIButton.setActionEventName = function ( self, eventName )
	self.actionEventName = eventName
end

LUI.UIButton.setActionEventNameNewStyle = function ( self, menu, controller, eventName )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		self:dispatchEventToParent( {
			name = eventName,
			controller = controller,
			button = self
		} )
		if self.actionSFX ~= nil then
			Engine.PlaySound( self.actionSFX )
		end
		return true
	end )
	self.id = eventName
	local f15_local0 = self:getParent()
	f15_local0[eventName] = self
end

LUI.UIButton.setActionPromptString = function ( self, promptString )
	self.actionPromptString = promptString
end

LUI.UIButton.setGainFocusSFX = function ( self, sfxName )
	self.gainFocusSFX = sfxName
end

LUI.UIButton.setActionSFX = function ( self, sfxName )
	self.actionSFX = sfxName
end

LUI.UIButton.clearGainFocusSFX = function ( self )
	self.gainFocusSFX = nil
end

LUI.UIButton.clearActionSFX = function ( self )
	self.actionSFX = nil
end

LUI.UIButton.new = function ( defaultAnimationState, actionEventName )
	local button = LUI.UIElement.new( defaultAnimationState )
	button:setClass( LUI.UIButton )
	button.id = "LUIButton"
	button:makeFocusable()
	button:setHandleMouse( true )
	button.actionEventName = actionEventName
	if CoD.isSinglePlayer then
		button.gainFocusSFX = "uin_slide_nav_up"
		button.actionSFX = "uin_main_enter"
	else
		button.gainFocusSFX = "cac_grid_nav"
		button.actionSFX = "uin_press_generic"
	end
	return button
end

LUI.UIButton:registerEventHandler( "gain_focus", LUI.UIButton.gainFocus )
LUI.UIButton:registerEventHandler( "lose_focus", LUI.UIButton.loseFocus )
LUI.UIButton:registerEventHandler( "button_action", LUI.UIButton.buttonAction )
LUI.UIButton:SetupElement()
