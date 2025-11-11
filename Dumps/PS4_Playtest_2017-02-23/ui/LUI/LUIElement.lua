LUI.UIElement = {
	id = "LUIElement",
	m_defaultAnimationState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1,
		alphaMultiplier = 1
	}
}
LUI.UIContainer = {}
LUI.UIElement.unsubscribeFromAllModels = function ( self )
	self:unregisterAllElementModelBindings()
	self:unsubscribeFromGlobalModels()
	self:unsubscribeFromAllModelsInC()
end

LUI.UIElement.setModel = function ( self, model, controller )
	if model ~= self:getModel() then
		self:setModelInC( model )
		if self.linkedElementModels then
			for index, elementTable in ipairs( self.linkedElementModels ) do
				elementTable.element:updateElementLinkedModels( self )
			end
		end
	end
end

LUI.UIElement.registerElementModelBinding = function ( self, element )
	if not self.linkedElementModels then
		self.linkedElementModels = {}
	end
	for index, registeredElementTable in ipairs( self.linkedElementModels ) do
		if registeredElementTable.element == element then
			registeredElementTable.count = registeredElementTable.count + 1
			return 
		end
	end
	table.insert( self.linkedElementModels, {
		element = element,
		count = 1
	} )
end

LUI.UIElement.unregisterElementModelBinding = function ( self, element )
	for index, registeredElementTable in ipairs( self.linkedElementModels ) do
		if registeredElementTable.element == element then
			registeredElementTable.count = registeredElementTable.count - 1
			if registeredElementTable.count == 0 then
				table.remove( self.linkedElementModels, index )
				break
			end
		end
	end
end

LUI.UIElement.unregisterAllElementModelBindings = function ( self )
	self:unsubscribeFromElementBindings( nil )
	if self.linkedElementModels then
		for index, registeredElementTable in ipairs( self.linkedElementModels ) do
			if registeredElementTable.element then
				registeredElementTable.element:unsubscribeFromElementBindings( self )
			end
		end
	end
end

LUI.UIElement.bindElementModel = function ( self, elementModelTable, ignoreSubscriptionCallback )
	local elementModel = elementModelTable.element:getModel()
	local ourModel = nil
	if elementModel and elementModelTable.modelPath then
		ourModel = Engine.GetModel( elementModel, elementModelTable.modelPath )
	else
		ourModel = elementModel
	end
	if elementModelTable.requiresSubscription then
		if ourModel then
			elementModelTable.subscription = self:subscribeToModel( ourModel, elementModelTable.updateFn, not ignoreSubscriptionCallback )
		end
	else
		elementModelTable.updateFn( ourModel )
	end
end

LUI.UIElement.subscribeToElementModel = function ( self, element, modelPath, updateFn )
	self:linkToElementModel( element, modelPath, true, updateFn )
end

LUI.UIElement.linkToElementModel = function ( self, element, modelPath, requiresSubscription, updateFn, ignoreSubscriptionCallback )
	if not self.elementModelBindings then
		self.elementModelBindings = {}
	end
	element:registerElementModelBinding( self )
	local newModelBindTable = {
		element = element,
		modelPath = modelPath,
		requiresSubscription = requiresSubscription,
		updateFn = updateFn
	}
	table.insert( self.elementModelBindings, newModelBindTable )
	self:bindElementModel( newModelBindTable, ignoreSubscriptionCallback )
end

LUI.UIElement.unsubscribeFromElementBindings = function ( self, element )
	if self.elementModelBindings then
		local index = 1
		while index <= #self.elementModelBindings do
			local bindingTable = self.elementModelBindings[index]
			if bindingTable.element == element or element == nil then
				if bindingTable.subscription ~= nil then
					self:removeSubscription( bindingTable.subscription )
				end
				bindingTable.element:unregisterElementModelBinding( self )
				table.remove( self.elementModelBindings, index )
			end
			index = index + 1
		end
	end
end

LUI.UIElement.updateElementLinkedModels = function ( self, element )
	if not self.elementModelBindings then
		return 
	end
	for index, bindingTable in ipairs( self.elementModelBindings ) do
		if bindingTable.element == element then
			if bindingTable.subscription ~= nil then
				self:removeSubscription( bindingTable.subscription )
			end
			self:bindElementModel( bindingTable )
		end
	end
end

LUI.UIElement.bindGlobalModel = function ( self, controller, bindingTable, ignoreSubscriptionCallback )
	local dataSourceTable = DataSources[bindingTable.dataSource]
	if dataSourceTable and dataSourceTable.getModel then
		local dataSourceModel = dataSourceTable.getModel( controller )
		if dataSourceModel then
			local ourModel = nil
			if bindingTable.modelPath then
				ourModel = Engine.GetModel( dataSourceModel, bindingTable.modelPath )
			else
				ourModel = dataSourceModel
			end
			if ourModel then
				bindingTable.subscription = self:subscribeToModel( ourModel, bindingTable.updateFn, not ignoreSubscriptionCallback )
			end
		end
	end
end

LUI.UIElement.subscribeToGlobalModel = function ( self, controller, datasourceName, modelPath, updateFn, ignoreSubscriptionCallback )
	if not self.globalModelBindings then
		self.globalModelBindings = {}
	end
	local newModelBindTable = {
		dataSource = datasourceName,
		modelPath = modelPath,
		updateFn = updateFn
	}
	table.insert( self.globalModelBindings, newModelBindTable )
	self:bindGlobalModel( controller, newModelBindTable, ignoreSubscriptionCallback )
	return newModelBindTable.subscription
end

LUI.UIElement.unsubscribeFromGlobalModels = function ( self )
	if not self.globalModelBindings then
		return 
	end
	for index, bindingTable in ipairs( self.globalModelBindings ) do
		if bindingTable.subscription ~= nil then
			self:removeSubscription( bindingTable.subscription )
		end
	end
	self.globalModelBindings = nil
end

LUI.UIElement.isClosed = function ( self )
	return self:getParent() == nil
end

LUI.UIElement.close = function ( self )
	self:unsubscribeFromAllModels()
	local controller = self.controller
	if not controller then
		local parent = self:getParent()
		while parent and not controller do
			controller = parent.controller or parent.m_ownerController
			parent = parent:getParent()
		end
		if not controller then
			controller = Engine.GetPrimaryController()
		end
	end
	local parent = self:getParent()
	if parent ~= nil then
		parent:removeElement( self )
	end
	if self == LUI.currentMouseFocus then
		CoD.SetCurrentMouseFocus( controller, nil )
	end
	self:closeElementInC()
end

LUI.UIElement.getFullID = function ( self )
	local path = self.id
	local parent = self:getParent()
	while parent do
		path = parent.id .. "/" .. path
		parent = parent:getParent()
	end
	return path
end

LUI.UIElement.isInputDisabledOnChain = function ( self )
	while self do
		if self.m_inputDisabled then
			return true
		end
		self = self:getParent()
	end
	return false
end

LUI.UIElement.getSoundSet = function ( self )
	local element = self
	while element do
		if element.soundSet then
			return element.soundSet
		end
		element = element:getParent()
	end
end

LUI.UIElement.findSoundAlias = function ( self, alias )
	local element = self
	while element do
		if element.soundSet and SoundSet[element.soundSet] and SoundSet[element.soundSet][alias] then
			return SoundSet[element.soundSet][alias]
		end
		element = element:getParent()
	end
end

LUI.UIElement.setPlaySoundDirect = function ( self, playDirect )
	self.playSoundDirect = playDirect
end

LUI.UIElement.playSound = function ( self, alias, controller )
	if not self.playSoundDirect then
		local soundAlias = self:findSoundAlias( alias )
		if soundAlias then
			if controller ~= nil then
				Engine.PlaySound( soundAlias, controller )
			else
				Engine.PlaySound( soundAlias )
			end
			return true
		end
	elseif controller ~= nil then
		Engine.PlaySound( alias, controller )
	else
		Engine.PlaySound( alias )
	end
end

LUI.UIElement.playActionSFX = function ( self )
	self:playSound( "action" )
end

LUI.UIElement.getLocalSize = function ( self )
	local left, top, right, bottom = nil
	if self.getNextRect then
		left, top, right, bottom = self:getNextRect()
	else
		left, top, right, bottom = self:getLocalRect()
	end
	local height = bottom - top
	local width = right - left
	return width, height
end

LUI.UIElement.setMouseDisabled = function ( self, disabled )
	self.m_mouseDisabled = disabled
	self.handleMouseMove = not disabled
	self.handleMouseButton = not disabled
end

LUI.UIElement.toggleMouse = function ( self )
	self.m_mouseDisabled = not self.m_mouseDisabled
end

LUI.UIElement.setHandleMouse = function ( self, handleMouse )
	self.handleMouseMove = handleMouse
	self.handleMouseButton = handleMouse
end

LUI.UIElement.toggleHandleMouse = function ( self )
	self.handleMouseMove = not self.handleMouseMove
	self.handleMouseButton = not self.handleMouseButton
end

LUI.UIElement.setHandleMouseMove = function ( self, handleMouseMove )
	self.handleMouseMove = handleMouseMove
end

LUI.UIElement.toggleHandleMouseMove = function ( self )
	self.handleMouseMove = not self.handleMouseMove
end

LUI.UIElement.setHandleMouseButton = function ( self, handleMouseButton )
	self.handleMouseButton = handleMouseButton
end

LUI.UIElement.toggleHandleMouseButton = function ( self )
	self.handleMouseButton = self.handleMouseButton
end

LUI.UIElement.setForceMouseEventDispatch = function ( self, forceDispatch )
	self.m_forceMouseEventDispatch = forceDispatch
end

LUI.UIElement.clearMouseFocus = function ( self, controller )
	local currentFocus = LUI.currentMouseFocus
	if currentFocus then
		CoD.SetCurrentMouseFocus( controller, nil )
		currentFocus.m_mouseOver = nil
	end
end

LUI.UIElement.GetMouseElementIntersection = function ( self, mouseEvent )
	if mouseEvent.x == nil or mouseEvent.y == nil then
		return false
	end
	local insideElement = nil
	if IsLuaCodeVersionAtLeast( 27 ) then
		insideElement = Engine.GetCircleInsideElement( mouseEvent.controller, self, mouseEvent.rootName, mouseEvent.x, mouseEvent.y )
	else
		if Engine.IsMouseInsideElement( mouseEvent.controller, self, mouseEvent.rootName, mouseEvent.x, mouseEvent.y ) then
			local f34_local0 = 1
		end
		insideElement = f34_local0 or 0
	end
	return insideElement
end

local f0_local0 = LUI.UIElement
f0_local0.IsMouseInsideElement = function ( self, mouseEvent )
	return self:GetMouseElementIntersection( mouseEvent ) > 0
end

f0_local0 = function ( element, event )
	if element and element ~= LUI.currentMouseFocus and element ~= LUI.currentNavFocus and not LUI.UIElement.IsMouseInsideElement( element, event ) then
		if element:isInFocus() or element.hasListFocus then
			element:processEvent( {
				name = "lose_focus",
				controller = event.controller,
				isMouse = true,
				ignoreFocusCheck = true
			} )
		end
		element.m_mouseOver = nil
		local parent = element:getParent()
		f0_local0( parent, event )
	end
end

local SwitchMouseFocus = function ( newFocus, event )
	if not newFocus:hasClip( "Focus" ) then
		return false
	end
	local prevFocus = LUI.currentMouseFocus
	if not prevFocus then
		prevFocus = LUI.currentNavFocus
	end
	local newFocusSuccess = false
	if newFocus ~= LUI.currentMouseFocus then
		newFocusSuccess = newFocus:processEvent( {
			name = "gain_focus",
			controller = event.controller,
			isMouse = true
		} )
		if newFocusSuccess then
			CoD.SetCurrentMouseFocus( event.controller, newFocus )
			if prevFocus then
				prevFocus:processEvent( {
					name = "lose_focus",
					controller = event.controller
				} )
			end
			if not newFocus.gridInfoTable then
				newFocus:playSound( "gain_focus" )
			end
			newFocus:dispatchEventToParent( {
				name = "mouse_focus",
				element = newFocus,
				controller = event.controller
			} )
		end
	end
	return newFocusSuccess
end

local UpdateFreeCursorState = function ( controller )
	if Engine.UsingFreeCursor() then
		local freeCursor = DataSources.FreeCursor.getModel( controller )
		freeCursor.hasFocus:set( LUI.currentMouseFocus ~= nil )
		DataSources.FreeCursor.setupContext( controller, LUI.currentMouseFocus and LUI.currentMouseFocus:getModel() or nil )
	end
end

LUI.UIElement.MouseMoveEvent = function ( self, event )
	if self.disabled or self.m_inputDisabled or self.m_mouseDisabled or not self:isVisible() then
		return 
	elseif self.handleMouseMove and not event.waitingForKeyBind then
		local insidePercent = self:GetMouseElementIntersection( event )
		if not event.highestFocusInteresction or event.highestFocusInteresction.perc < insidePercent then
			if self.m_mouseOver == nil or self ~= LUI.currentMouseFocus then
				if not self:isInFocus() then
					if self.m_mouseOver == nil and self:hasClip( "Over" ) then
						self.m_mouseOver = true
						self:processEvent( {
							name = "mouseenter",
							controller = event.controller,
							isMouse = true
						} )
					elseif self.m_focusable and not self.m_preventFromBeingCurrentMouseFocus and not self:hasClip( "Over" ) and SwitchMouseFocus( self, event ) then
						event.highestFocusInteresction = {
							element = self,
							perc = insidePercent
						}
						if insidePercent >= 1 then
							return true
						end
					end
				elseif self.m_focusable and self ~= LUI.currentMouseFocus and not self.m_preventFromBeingCurrentMouseFocus and SwitchMouseFocus( self, event ) then
					DebugPrint( "^1LUI_MOUSE: ^2inside element that is not the currentMouseFocus -- " .. self.id )
					event.highestFocusInteresction = {
						element = self,
						perc = insidePercent
					}
					if insidePercent >= 1 then
						return true
					end
				end
			elseif not LUI.currentMouseFocus and self.m_focusable and not self.m_preventFromBeingCurrentMouseFocus and SwitchMouseFocus( self, event ) then
				DebugPrint( "^1LUI_MOUSE: ^2setting currentMouseFocus -- " .. self.id )
				event.highestFocusInteresction = {
					element = self,
					perc = insidePercent
				}
				if insidePercent >= 1 then
					return true
				end
			end
		elseif self ~= LUI.currentMouseFocus or insidePercent == 0 then
			if self.m_mouseOver ~= nil then
				self.m_mouseOver = nil
				self:processEvent( {
					name = "mouseleave",
					controller = event.controller,
					isMouse = true
				} )
			end
			if self ~= LUI.currentMouseFocus and not self.m_preventFromBeingCurrentMouseFocus and self ~= LUI.currentNavFocus and self:isInFocus() then
				self:processEvent( {
					name = "lose_focus",
					controller = event.controller,
					isMouse = true
				} )
			end
			if Engine.UsingFreeCursor() and self == LUI.currentMouseFocus then
				self:processEvent( {
					name = "lose_focus",
					controller = event.controller,
					isMouse = true
				} )
				self:dispatchEventToParent( {
					name = "clear_recorded_focus",
					controller = event.controller
				} )
			end
		end
		if self.m_eventHandlers.mousedrag ~= nil and self.m_leftMouseDown ~= nil then
			self.m_eventHandlers:mousedrag( {
				name = "mousedrag",
				controller = event.controller,
				root = event.root,
				x = mouseX,
				y = mouseY
			} )
		end
		UpdateFreeCursorState( event.controller )
	end
	if (self.m_forceMouseEventDispatch or LUI.UIElement.IsMouseInsideElement( self, event ) or LUI.currentMouseFocus and self:isParentOf( LUI.currentMouseFocus )) and self:dispatchEventToChildren( event ) then
		return 
	end
end

LUI.UIElement.isParentOf = function ( self, element )
	local parent = element:getParent()
	while parent do
		if parent == self then
			return true
		end
		parent = parent:getParent()
	end
	return false
end

LUI.UIElement.mouseEnter = function ( self, event )
	local mouseOverSuccess = false
	if not self.m_active then
		if self:playClip( "GainOver" ) then
			self.nextClip = "Over"
			mouseOverSuccess = true
		else
			mouseOverSuccess = self:playClip( "Over" )
		end
	end
	return mouseOverSuccess
end

LUI.UIElement.mouseLeave = function ( self, event )
	if not self:isInFocus() and not self.m_active then
		if self:playClip( "LoseOver" ) then
			self.nextClip = "DefaultClip"
		else
			self:playClip( "DefaultClip" )
		end
	end
end

LUI.UIElement.LeftMouseDown = function ( self, event )
	self:processEvent( {
		name = "button_over_down",
		controller = event.controller
	} )
	if event.inside and not self.disabled and self:isInFocus() then
		LUI.UIElement.LeftMousePlayDownClip( self, event )
		self:dispatchEventToParent( {
			name = "left_mouse_play_down_clip",
			element = self,
			controller = event.controller,
			inside = event.inside
		} )
	end
end

LUI.UIElement.RightMouseDown = function ( self, event )
	self:processEvent( {
		name = "button_over_down",
		controller = event.controller
	} )
end

LUI.UIElement.LeftMousePlayDownClip = function ( self, event )
	if self:hasClip( "Down" ) and self:isInFocus() then
		self:playClip( "Down" )
		return true
	else
		return false
	end
end

LUI.UIElement.LeftMousePlayUpClip = function ( self, event )
	if self:isInFocus() then
		if self:hasClip( "Up" ) then
			self:playClip( "Up" )
		elseif self:hasClip( "Focus" ) then
			self:playClip( "Focus" )
		end
		return true
	else
		return false
	end
end

LUI.UIElement.LeftMouseUp = function ( self, event )
	if event.inside and not self.disabled then
		if self:isInFocus() then
			LUI.UIElement.LeftMousePlayUpClip( self, event )
			self:dispatchEventToParent( {
				name = "left_mouse_play_up_clip",
				element = self,
				controller = event.controller,
				inside = event.inside
			} )
		end
		if self.m_eventHandlers.button_action then
			return self:processEvent( {
				name = "button_action",
				controller = event.controller,
				isMouse = true
			} )
		else
			return self:dispatchEventToParent( {
				name = "mouse_left_click",
				element = self,
				controller = event.controller,
				inside = event.inside
			} )
		end
	else
		
	end
end

LUI.UIElement.RightMouseUp = function ( self, event )
	if event.inside then
		if not self.disabled then
			local returnValue = self:processEvent( {
				name = "button_actionsecondary",
				controller = event.controller,
				isMouse = true
			} )
			if returnValue then
				return returnValue
			end
		end
	else
		self:processEvent( {
			name = "button_up"
		} )
	end
end

LUI.UIElement.MouseButtonEvent = function ( self, event )
	if self.disabled or self.m_inputDisabled or self.m_mouseDisabled or not self:isVisible() then
		return 
	elseif self.handleMouseButton then
		local inside = LUI.UIElement.IsMouseInsideElement( self, event )
		if event.name == "mouseup" then
			if event.button == "left" then
				if self.m_leftMouseDown ~= nil then
					self.m_leftMouseDown = nil
					if self.m_focusable and self:hasClip( "Over" ) then
						if not self:isInFocus() then
							SwitchMouseFocus( self, event )
						elseif self.m_eventHandlers.leftmouseup ~= nil then
							local returnValue = self.m_eventHandlers:leftmouseup( {
								name = "leftmouseup",
								controller = event.controller,
								root = event.root,
								x = event.x,
								y = event.y,
								inside = inside
							} )
							if returnValue then
								return returnValue
							end
						end
					elseif self.m_eventHandlers.leftmouseup ~= nil then
						local returnValue = self.m_eventHandlers:leftmouseup( {
							name = "leftmouseup",
							controller = event.controller,
							root = event.root,
							x = event.x,
							y = event.y,
							inside = inside
						} )
						if returnValue then
							return returnValue
						end
					end
				end
				if not inside and self.m_eventHandlers.leftclick_outside ~= nil then
					local returnValue = self.m_eventHandlers:leftclick_outside( {
						name = "leftclick_outside",
						controller = event.controller,
						root = event.root,
						x = event.x,
						y = event.y,
						inside = inside
					} )
					if returnValue then
						return returnValue
					end
				end
			end
			if event.button == "right" and self.m_rightMouseDown ~= nil then
				self.m_rightMouseDown = nil
				if self.m_eventHandlers.rightmouseup ~= nil then
					local returnValue = self.m_eventHandlers:rightmouseup( {
						name = "rightmouseup",
						controller = event.controller,
						root = event.root,
						x = event.x,
						y = event.y,
						inside = inside
					} )
					if returnValue then
						return returnValue
					end
				end
			end
		end
		if inside and event.name == "mousedown" then
			if event.button == "left" and self.m_eventHandlers.leftmousedown ~= nil and self.m_leftMouseDown == nil then
				self.m_leftMouseDown = true
				self.m_eventHandlers:leftmousedown( {
					name = "leftmousedown",
					controller = event.controller,
					root = event.root,
					x = event.x,
					y = event.y,
					inside = inside
				} )
			end
			if event.button == "right" and self.m_eventHandlers.rightmousedown ~= nil and self.m_rightMouseDown == nil then
				self.m_rightMouseDown = true
				self.m_eventHandlers:rightmousedown( {
					name = "rightmousedown",
					controller = event.controller,
					root = event.root,
					x = event.x,
					y = event.y,
					inside = inside
				} )
			end
		end
	end
	if self.m_forceMouseEventDispatch or LUI.UIElement.IsMouseInsideElement( self, event ) then
		self:dispatchEventToChildren( event )
	end
end

LUI.UIElement.AcceptGamePadButtonInput = function ( self, event )
	if self.m_inputDisabled or self.occludedBy then
		return false
	elseif not self.m_ownerController or self.m_ownerController == event.controller or self.anyControllerAllowed or Engine.IsControllerBeingUsed( event.controller ) then
		return true
	elseif self.m_ownerController and self.m_ownerController ~= event.controller then
		local originalName = event.name
		event.name = "unused_gamepad_button"
		self:processEvent( event )
		self:dispatchEventToChildren( event )
		event.name = originalName
	end
end

LUI.UIElement.AcceptGamePadButtonInputFromModelCallback = function ( self, controller )
	if self.m_inputDisabled or self.occludedBy then
		return false
	elseif not self.m_ownerController or self.m_ownerController == controller or self.anyControllerAllowed or Engine.IsControllerBeingUsed( controller ) then
		return true
	else
		return false
	end
end

LUI.UIElement.DoNavigationForGamePadButton = function ( self, event )
	return self:handleGamepadButton( event )
end

LUI.UIElement.GamepadButton = function ( self, event )
	if self.m_inputDisabled then
		return 
	elseif not self:handleGamepadButton( event ) then
		if self.m_ownerController == nil or self.m_ownerController == event.controller then
			return self:dispatchEventToChildren( event )
		else
			
		end
	else
		return true
	end
end

LUI.UIElement.GamepadButton_DPadOnly = function ( self, event )
	if event.qualifier ~= "dpad" then
		return 
	else
		LUI.UIElement.GamepadButton( self, event )
	end
end

LUI.UIElement.doNavigationForElement = function ( self, event, element, traversingUpFromElement )
	local checkedElements = {}
	while element and not checkedElements[element] and element ~= self do
		if type( element ) == "table" then
			for _, subElement in ipairs( element ) do
				if self:doNavigationForElement( event, subElement, traversingUpFromElement ) then
					return true
				end
			end
			return false
		elseif element:processEvent( {
			name = "gain_focus",
			controller = event.controller,
			button = event.button
		} ) then
			if traversingUpFromElement then
				traversingUpFromElement:processEvent( {
					name = "lose_focus",
					controller = event.controller,
					button = event.button,
					ignoreFocusCheck = true
				} )
			else
				self:processEvent( {
					name = "lose_focus",
					controller = event.controller,
					button = event.button,
					ignoreFocusCheck = true
				} )
			end
			if not element:playSound( "gain_focus" ) and element.gainFocusSFX then
				Engine.PlaySound( element.gainFocusSFX )
			end
			return true
		end
		checkedElements[element] = true
		element = element.navigation[event.button]
	end
end

LUI.UIElement.doNavigationForElementFromModelCallback = function ( self, controller, button, element, traversingUpFromElement )
	local checkedElements = {}
	while element and not checkedElements[element] and element ~= self do
		if type( element ) == "table" then
			for _, subElement in ipairs( element ) do
				if self:doNavigationForElementFromModelCallback( controller, button, subElement, traversingUpFromElement ) then
					return true
				end
			end
			return false
		elseif element:processEvent( {
			name = "gain_focus",
			controller = controller,
			button = button
		} ) then
			if traversingUpFromElement then
				traversingUpFromElement:processEvent( {
					name = "lose_focus",
					controller = controller,
					button = button,
					ignoreFocusCheck = true
				} )
			else
				self:processEvent( {
					name = "lose_focus",
					controller = controller,
					button = button,
					ignoreFocusCheck = true
				} )
			end
			if not element:playSound( "gain_focus" ) and element.gainFocusSFX then
				Engine.PlaySound( element.gainFocusSFX )
			end
			return true
		end
		checkedElements[element] = true
		element = element.navigation[button]
	end
end

LUI.UIElement.GetCorrespondingGamepadButtonForKey = function ( key )
	if key == "DOWNARROW" or key == "MWHEELDOWN" then
		return "down"
	elseif key == "UPARROW" or key == "MWHEELUP" then
		return "up"
	elseif key == "RIGHTARROW" then
		return "right"
	elseif key == "LEFTARROW" then
		return "left"
	elseif key == "ENTER" then
		return "primary"
	else
		return nil
	end
end

LUI.UIElement.GetCorrespondingGamepadButtonString = function ( luiButton )
	if luiButton == Enum.LUIButton.LUI_KEY_DOWN then
		return "down"
	elseif luiButton == Enum.LUIButton.LUI_KEY_UP then
		return "up"
	elseif luiButton == Enum.LUIButton.LUI_KEY_LEFT then
		return "left"
	elseif luiButton == Enum.LUIButton.LUI_KEY_RIGHT then
		return "right"
	else
		return nil
	end
end

LUI.UIElement.handleGamepadButton = function ( self, event, traversingUpFromElement )
	if self.forceChildNavigation then
		return 
	elseif (self:isInFocus() or self.navigation and traversingUpFromElement) and event.down == true then
		local button = event.button
		if button == "key_shortcut" then
			button = LUI.UIElement.GetCorrespondingGamepadButtonForKey( event.key )
			if button then
				event.button = button
			end
		end
		if button ~= nil and self.m_disableNavigation ~= true then
			if self.navigationSounds and self.navigationSounds[button] then
				Engine.PlaySound( self.navigationSounds[button] )
			end
			local navigationChoice = self.navigation[button]
			if navigationChoice ~= nil then
				if type( navigationChoice ) == "function" then
					navigationChoice = navigationChoice( self, event.controller )
					if navigationChoice == true then
						return true
					end
				end
				if type( navigationChoice ) == "table" then
					local choiceList = navigationChoice
					local latestTimestamp = nil
					navigationChoice = choiceList[1]
					for index, element in ipairs( choiceList ) do
						local lastFocusedTimestamp = element.lastFocusedTimestamp
						if lastFocusedTimestamp and (not latestTimestamp or latestTimestamp < lastFocusedTimestamp) then
							navigationChoice = element
							latestTimestamp = lastFocusedTimestamp
						end
					end
				end
				if self:doNavigationForElement( event, navigationChoice, traversingUpFromElement ) then
					return true
				end
			end
			if button == "primary" and not self.disabled then
				self:processEvent( {
					name = "button_action",
					controller = event.controller
				} )
				return true
			end
		end
		if not traversingUpFromElement then
			traversingUpFromElement = self
		end
		local parent = self:getParent()
		if parent then
			return parent:handleGamepadButton( event, traversingUpFromElement )
		end
	elseif self.navigation and traversingUpFromElement and event.down == true then
		local parent = self:getParent()
		if parent then
			return parent:handleGamepadButton( event, traversingUpFromElement )
		end
	end
end

LUI.UIElement.setActive = function ( self, event )
	if self.m_preventFromBeingActive then
		return 
	elseif self:playClip( "GainActive" ) then
		self.nextClip = "Active"
	else
		self:playClip( "Active" )
	end
	self.m_active = true
	self:dispatchEventToChildren( event )
end

LUI.UIElement.setInactive = function ( self, event )
	if self.m_preventFromBeingActive and not self.m_active then
		return 
	elseif self:playClip( "LoseActive" ) then
		self.nextClip = "DefaultClip"
	else
		self:playClip( "DefaultClip" )
	end
	self.m_active = nil
	self:dispatchEventToChildren( event )
end

LUI.UIElement.gainFocus = function ( self, event )
	local focusReceived = false
	if self.m_focusable and not self.onlyChildrenFocusable then
		self:setFocus( true )
		self.lastFocusedTimestamp = Engine.milliseconds()
		if not self.m_preventFromBeingCurrentNavFocus then
			LUI.currentNavFocus = self
		end
		if event.isMouse and not self.m_preventFromBeingCurrentMouseFocus then
			CoD.SetCurrentMouseFocus( event.controller, self )
		end
		if not event.skipGainFocus and self:playClip( "GainFocus" ) then
			self.nextClip = "Focus"
			focusReceived = true
		else
			focusReceived = self:playClip( "Focus" )
		end
		if not self.clipsPerState then
			focusReceived = true
		end
		if focusReceived then
			self:dispatchEventToParent( {
				name = "record_curr_focused_elem_id",
				id = self.id,
				controller = event.controller,
				idStack = {
					self.id
				}
			} )
		end
	elseif not self.m_focusable then
		return false
	end
	if focusReceived then
		return true
	end
	return self:dispatchEventToChildren( event )
end

LUI.UIElement.loseFocus = function ( self, event )
	if self.m_focusable and (self:isInFocus() or event.ignoreFocusCheck) then
		self:setFocus( false )
		if not event.keepSelected or not self:playClip( "Selected" ) then
			if not event.skipLoseFocus and self:playClip( "LoseFocus" ) then
				self.nextClip = "DefaultClip"
			else
				self:playClip( "DefaultClip" )
			end
		end
	end
	if self == LUI.currentMouseFocus then
		CoD.SetCurrentMouseFocus( event.controller, nil )
	end
	if self == LUI.currentNavFocus then
		LUI.currentNavFocus = nil
	end
	self:dispatchEventToChildren( event )
end

LUI.UIElement.processEvent = function ( self, event )
	local eventHandler = self.m_eventHandlers[event.name]
	if eventHandler ~= nil then
		return eventHandler( self, event )
	else
		return self:dispatchEventToChildren( event )
	end
end

LUI.UIElement.processEventToParent = function ( self, event )
	local eventHandler = self.m_eventHandlers[event.name]
	if eventHandler ~= nil then
		return eventHandler( self, event )
	else
		return self:dispatchEventToParent( event )
	end
end

LUI.UIElement.getRoot = function ( self )
	if not self then
		return 
	end
	local parent = self:getParent()
	while parent do
		self = parent
		parent = parent:getParent()
	end
	return self
end

LUI.UIElement.dispatchEventToRoot = function ( self, event )
	local parent = self:getParent()
	while parent do
		local newParent = parent:getParent()
		if newParent == nil then
			local eventHandler = parent.m_eventHandlers[event.name]
			if eventHandler ~= nil then
				eventHandler( parent, event )
			end
			parent:dispatchEventToChildren( event )
			return 
		end
		parent = newParent
	end
end

LUI.UIElement.dispatchEventToParent = function ( self, event )
	local parent = self:getParent()
	while parent do
		local eventHandler = parent.m_eventHandlers[event.name]
		if eventHandler then
			return eventHandler( parent, event )
		end
		parent = parent:getParent()
	end
end

LUI.UIElement.dispatchEventToParentWithSelf = function ( self, event )
	local parent = self:getParent()
	while parent do
		local eventHandler = parent.m_eventHandlers[event.name]
		if eventHandler then
			return eventHandler( self, event )
		end
		parent = parent:getParent()
	end
end

LUI.UIElement.dispatchEventToParentWithElement = function ( self, event, element )
	local parent = self
	while parent do
		local eventHandler = parent.m_eventHandlers[event.name]
		if eventHandler then
			return eventHandler( element, event )
		end
		parent = parent:getParent()
	end
end

LUI.UIElement.dispatchEventToChildren = function ( self, event )
	local child = self:getFirstChild()
	if child == nil then
		return 
	end
	while child ~= nil do
		local nextChild = child:getNextSibling()
		local returnValue = child:processEvent( event )
		if returnValue then
			return returnValue
		end
		child = nextChild
	end
end

LUI.UIElement.registerEventHandler = function ( self, eventName, eventHandler )
	self.m_eventHandlers[eventName] = eventHandler
end

LUI.UIElement.appendEventHandler = function ( self, eventName, eventHandler )
	if not self.m_eventHandlers[eventName] then
		self:registerEventHandler( eventName, eventHandler )
	else
		local oldEventHandler = self.m_eventHandlers[eventName]
		self.m_eventHandlers[eventName] = function ( self, event )
			local newResult = eventHandler( self, event )
			local oldResult = oldEventHandler( self, event )
			return newResult or oldResult
		end
		
	end
end

LUI.UIElement.isFocusable = function ( self )
	return self.m_focusable
end

LUI.UIElement.clearNavigationTable = function ( self )
	self.navigation = {}
end

LUI.UIElement.makeFocusable = function ( self )
	self.m_focusable = true
	self.navigation = {}
end

LUI.UIElement.makeFocusableWithoutResettingNavigation = function ( self )
	self.m_focusable = true
end

LUI.UIElement.makeNotFocusable = function ( self )
	self.m_focusable = false
end

LUI.UIElement.isIDNamed = function ( self )
	if string.find( self.id, "." ) then
		return true
	else
		return false
	end
end

LUI.UIElement.getFirstInFocus = function ( self )
	if self:isInFocus() then
		return self
	end
	local child = self:getFirstChild()
	while child do
		local focusedElement = child:getFirstInFocus()
		if focusedElement then
			return focusedElement
		end
		child = child:getNextSibling()
	end
	local sibling = self:getNextSibling()
	if sibling then
		return sibling:getFirstInFocus()
	end
end

LUI.UIElement.doesElementOrChildHaveFocus = function ( self )
	if self:isInFocus() then
		return true
	end
	local child = self:getFirstChild()
	while child do
		if child:doesElementOrChildHaveFocus() then
			return true
		end
		child = child:getNextSibling()
	end
	return false
end

LUI.UIElement.hasChildWithID = function ( self, id )
	if self.id == id then
		return true
	end
	local child = self:getFirstChild()
	while child do
		if child:hasChildWithID( id ) then
			return true
		end
		child = child:getNextSibling()
	end
	return false
end

LUI.UIElement.saveState = function ( self )
	if not self:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. self:getFullID() )
		return 
	elseif self.lastFocusedElemEvent and self.lastFocusedElemEvent.id then
		LUI.savedMenuStates[self.id] = {
			id = self.lastFocusedElemEvent.id,
			saveEvent = self.lastFocusedElemEvent
		}
	else
		LUI.savedMenuStates[self.id] = nil
	end
end

LUI.UIElement.clearSavedState = function ( self )
	if not self:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. self:getFullID() )
		return 
	else
		LUI.savedMenuStates[self.id] = nil
	end
end

LUI.UIElement.restoreState = function ( self )
	if not self:isIDNamed() then
		error( "LUI Error: Tried to restore menu state, but element has no name: " .. self:getFullID() )
		return 
	elseif Engine.GetDvarBool( "rat_playback_enabled" ) then
		return 
	else
		local focusedState = LUI.savedMenuStates[self.id]
		if focusedState ~= nil and focusedState.id then
			return self:processEvent( {
				name = "restore_focus",
				id = focusedState.id,
				data = focusedState.data,
				saveEvent = focusedState.saveEvent
			} )
		else
			
		end
	end
end

LUI.UIElement.restoreFocus = function ( self, event )
	local savedEvent = event.saveEvent
	if savedEvent and savedEvent.idStack and #savedEvent.idStack > 0 and self.id == savedEvent.idStack[1] then
		if #savedEvent.idStack == 1 then
			return self:processEvent( {
				name = "gain_focus",
				saveEvent = savedEvent
			} )
		else
			table.remove( savedEvent.idStack, 1 )
			return self:dispatchEventToChildren( event )
		end
	else
		return false
	end
end

LUI.UIElement.hide = function ( self )
	self:setAlpha( 0 )
end

LUI.UIElement.show = function ( self )
	self:setAlpha( 1 )
end

LUI.UIElement.rotateRandomly = function ( self, event )
	if not self.m_eventHandlers.rotate_randomly then
		self:registerEventHandler( "rotate_randomly", LUI.UIElement.rotateRandomly )
		self:addElement( LUI.UITimer.new( 2500, "rotate_randomly", false, self ) )
	end
	self:beginAnimation( "rotate_randomly", 2500, true, true )
	self:setXRot( math.random( -45, 45 ) )
	self:setYRot( math.random( -45, 45 ) )
end

LUI.UIElement.spinRandomly = function ( self, event )
	if not self.m_eventHandlers.spin_randomly then
		self:registerEventHandler( "spin_randomly", LUI.UIElement.rotateRandomly )
		self:addElement( LUI.UITimer.new( 2500, "spin_randomly", false, self ) )
	end
	self:beginAnimation( "rotate_randomly", 2500, true, true )
	self:setZRot( math.random( -90, 90 ) )
end

LUI.UIElement.flicker = function ( self, duration, defaultAlpha, alphaLow, alphaHigh, randomTimeLow, randomTimeHigh )
	if not duration then
		duration = 1000
	end
	if not defaultAlpha then
		defaultAlpha = 1
	end
	if not alphaLow then
		alphaLow = 0.2
	end
	if not alphaHigh then
		alphaHigh = 0.7
	end
	if not randomTimeLow then
		randomTimeLow = 50
	end
	if not randomTimeHigh then
		randomTimeHigh = 150
	end
	self.lowFlickerAlpha = alphaLow
	self.highFlickerAlpha = alphaHigh
	self.endFlickerAlpha = defaultAlpha
	self:registerEventHandler( "close_flicker_timer", LUI.UIElement.CloseFlickerTimer )
	self:alternateStates( duration, LUI.UIElement.LowFlickerAlternate, LUI.UIElement.HighFlickerAlternate, randomTimeLow, randomTimeHigh, LUI.UIElement.EndFlickerAlternate )
end

LUI.UIElement.LowFlickerAlternate = function ( self, time )
	self:beginAnimation( "lower_alpha", time )
	self:setAlpha( self.lowFlickerAlpha )
end

LUI.UIElement.HighFlickerAlternate = function ( self, time )
	self:beginAnimation( "raise_alpha", time )
	self:setAlpha( self.highFlickerAlpha )
end

LUI.UIElement.EndFlickerAlternate = function ( self, time )
	self:beginAnimation( "end_alpha", time )
	self:setAlpha( self.endFlickerAlpha )
	self.lowFlickerAlpha = nil
	self.highFlickerAlpha = nil
	self.endFlickerAlpha = nil
end

LUI.UIElement.CloseFlickerTimer = function ( self, event )
	if self.lowFlickerAlpha then
		self:closeStateAlternator()
	end
end

LUI.UIElement.closeStateAlternator = function ( self )
	if self.alternatorTimer then
		self.alternatorTimer:close()
		self.alternatorTimer = nil
	end
	if self.alternatorEnd then
		self:alternatorEnd()
		self.alternatorEnd = nil
	end
end

LUI.UIElement.UpdateStateAlternater = function ( self, event )
	if event.next ~= "first" and event.next ~= "second" then
		self:closeStateAlternator()
		return 
	end
	local next = "first"
	local fn = event.func2
	if event.next == "first" then
		next = "second"
		fn = event.func1
	end
	local time = math.random( event.lowTime, event.highTime )
	if event.timeLeft <= time and not event.isInfinite then
		time = event.timeLeft + 1
		next = "final"
	end
	fn( self, time )
	local timeLeft = -1
	if not event.isInfinite then
		timeLeft = event.timeLeft - time
	end
	self.alternatorTimer = LUI.UITimer.new( time, {
		name = "update_state_alternate",
		isInfinite = event.isInfinite,
		next = next,
		func1 = event.func1,
		func2 = event.func2,
		timeLeft = timeLeft,
		lowTime = event.lowTime,
		highTime = event.highTime
	}, true, self )
	self:addElement( self.alternatorTimer )
end

LUI.UIElement.alternateStates = function ( self, duration, functionOne, functionTwo, randomTimeLow, randomTimeHigh, endFunction )
	if self.alternatorEnd then
		return 
	elseif not duration then
		duration = 1000
	end
	if functionOne == nil or functionTwo == nil then
		return 
	elseif endFunction == nil then
		endFunction = functionTwo
	end
	if not randomTimeLow then
		randomTimeLow = 50
	end
	if not randomTimeHigh then
		randomTimeHigh = 150
	end
	self.alternatorEnd = endFunction
	self:registerEventHandler( "update_state_alternate", LUI.UIElement.UpdateStateAlternater )
	self:processEvent( {
		name = "update_state_alternate",
		isInfinite = duration == 0,
		next = "first",
		func1 = functionOne,
		func2 = functionTwo,
		timeLeft = duration,
		lowTime = randomTimeLow,
		highTime = randomTimeHigh
	} )
end

LUI.UIElement.ViewportAnimation = function ( self, event )
	if not self.viewportScaleTime then
		self.viewportScaleTime = event.timeElapsed
	else
		self.viewportScaleTime = self.viewportScaleTime + event.timeElapsed
	end
	local scaleFraction = self.viewportScaleTime / event.scaleDuration
	if scaleFraction > 1 then
		scaleFraction = 1
		event.timer:close()
		self.viewportScaleTime = nil
	end
	local scale = event.startScale + (event.endScale - event.startScale) * scaleFraction
	Engine.SetViewport( event.controller, 0.1 - scale / 10, 0.5 - scale / 2, scale )
end

LUI.UIElement.animateViewport = function ( self, controller, startScale, endScale, duration )
	self:addElement( LUI.UITimer.new( 1, {
		name = "viewport_animation",
		controller = controller,
		startScale = startScale,
		endScale = endScale,
		scaleDuration = duration
	}, false, self ) )
end

LUI.UIElement.UpdateSafeArea = function ( self, event, controller )
	if controller == nil and event ~= nil then
		controller = event.controller
	end
	local safeAreaLeft, safeAreaTop, safeAreaRight, safeAreaBottom = Engine.GetUserSafeAreaForController( controller )
	self:setLeftRight( false, false, safeAreaLeft, safeAreaRight )
	self:setTopBottom( false, false, safeAreaTop, safeAreaBottom )
end

LUI.UIElement.sizeToSafeArea = function ( self, controller )
	self:UpdateSafeArea( nil, controller )
	self:registerEventHandler( "update_safe_area", self.UpdateSafeArea )
end

LUI.UIElement.setState = function ( self, state, ignoreTransitionClip )
	if self.currentState == state and not self.ignoreCurrentStateCheck then
		return 
	end
	local prevState = self.currentState
	local f104_local0
	if not ignoreTransitionClip then
		f104_local0 = self:hasClip( state )
	else
		f104_local0 = false
	end
	self.currentState = state
	local currentClipIsTransitionClip = f104_local0
	local nextClip = "DefaultClip"
	if self:isInFocus() and self:hasClip( "Focus" ) then
		nextClip = "Focus"
		currentClipIsTransitionClip = false
	elseif self:hasClip( "Selected" ) and self.gridInfoTable and self.gridInfoTable.parentGrid.currentSelection == self then
		nextClip = "Selected"
		currentClipIsTransitionClip = false
	end
	if f104_local0 then
		self.nextClip = nextClip
		self.currentClipIsTransitionClip = currentClipIsTransitionClip
		self.clipsPerState[prevState][state]()
	else
		self:playClip( nextClip )
	end
end

LUI.UIElement.mergeStateConditions = function ( self, conditionsTable, mergeIntoTable )
	if not mergeIntoTable then
		if not self.stateConditions then
			self.stateConditions = {}
		end
		mergeIntoTable = self.stateConditions
	end
	local findIndexOfState = function ( stateName )
		for index, stateCondition in ipairs( mergeIntoTable ) do
			if stateCondition.stateName == stateName then
				return index
			end
		end
		return nil
	end
	
	for index, stateCondition in ipairs( conditionsTable ) do
		local match = findIndexOfState( stateCondition.stateName )
		if match == nil then
			table.insert( mergeIntoTable, LUI.ShallowCopy( stateCondition ) )
		else
			mergeIntoTable[match] = LUI.ShallowCopy( stateCondition )
		end
	end
end

LUI.UIElement.clipOver = function ( self, event )
	if self.nextClip then
		self:playClip( self.nextClip )
	end
end

LUI.UIElement.playClip = function ( self, clipName )
	self.nextClip = nil
	self.currentClipIsTransitionClip = false
	if not self.currentState then
		self.currentState = "DefaultState"
	end
	if self.clipsPerState and self.clipsPerState[self.currentState] and self.clipsPerState[self.currentState][clipName] then
		self.clipsPerState[self.currentState][clipName]()
		return true
	else
		return false
	end
end

LUI.UIElement.hasClip = function ( self, clipName )
	if self.clipsPerState and self.clipsPerState[self.currentState] and self.clipsPerState[self.currentState][clipName] then
		return true
	else
		return false
	end
end

LUI.UIElement.setupElementClipCounter = function ( self, elementCount )
	self.elementsPlayingClips = elementCount
	if self.elementsPlayingClips == 0 then
		self:processEvent( {
			name = "clip_over"
		} )
	end
end

LUI.UIElement.childClipFinished = function ( self )
	self.elementsPlayingClips = self.elementsPlayingClips - 1
	if self.elementsPlayingClips == 0 then
		self:processEvent( {
			name = "clip_over"
		} )
	end
end

LUI.UIElement.clipFinished = function ( self, event )
	local parent = self:getParent()
	if parent ~= nil and (not event.interrupted or parent.currentClipIsTransitionClip) then
		parent:childClipFinished()
	end
end

LUI.UIElement.updateState = function ( self, event )
	local menu = event.menu or self
	while menu do
		if menu.updateElementState then
			event.menu = menu
			menu:updateElementState( self, event )
			if self.anyChildUsesUpdateState then
				self:dispatchEventToChildren( event )
			end
			return 
		end
		menu = menu:getParent()
	end
end

LUI.UIElement.RecordCurrFocusedElemID = function ( self, event )
	if not event.idStack then
		error( "LUI Error: " .. event.name .. " processed without event.idStack " )
	end
	table.insert( event.idStack, 1, self.id )
	return self:dispatchEventToParent( event )
end

LUI.UIElement.setFontBasedOnSize = function ( self, size )
	self:setFont( LUI.DefaultFont )
end

LUI.UIElement.playBitchinFX = function ( self, duration, easeIn, easeOut )
	self:setShaderVector( 0, 0, 0, 0, 0 )
	self:beginAnimation( "bitchin", duration, easeIn, easeOut )
	self:setShaderVector( 0, 1, 0, 0, 0 )
end

LUI.UIElement.playBitchinFXReverse = function ( self, duration, easeIn, easeOut )
	self:setShaderVector( 0, 1, 0, 0, 0 )
	self:beginAnimation( "bitchin", duration, easeIn, easeOut )
	self:setShaderVector( 0, 0, 0, 0, 0 )
end

LUI.UIElement.setInitialClass = function ( self, class )
	local elementMetatable = getmetatable( self )
	local elementTable = elementMetatable.__newindex
	local elementTableMetatable = {
		__index = class
	}
	setmetatable( elementTable, elementTableMetatable )
	local eventHandlersMetatable = {
		__index = class.m_eventHandlers
	}
	setmetatable( elementTable.m_eventHandlers, eventHandlersMetatable )
end

LUI.UIElement.setClass = function ( self, class )
	local elementMetatable = getmetatable( self )
	local elementTable = elementMetatable.__newindex
	local elementTableMetatable = getmetatable( elementTable )
	if not elementTableMetatable then
		setmetatable( elementTable, {
			__index = class
		} )
	else
		elementTableMetatable.__index = class
	end
	local eventHandlersMetatable = getmetatable( elementTable.m_eventHandlers )
	if not eventHandlersMetatable then
		setmetatable( elementTable.m_eventHandlers, {
			__index = class.m_eventHandlers
		} )
	else
		eventHandlersMetatable.__index = class.m_eventHandlers
	end
end

LUI.UIElement.getParentMenu = function ( self )
	local menu = self
	while not menu.menuName do
		menu = menu:getParent()
	end
	return menu
end

LUI.UIElement.m_eventHandlers = {
	mousemove = LUI.UIElement.MouseMoveEvent,
	mouseenter = LUI.UIElement.mouseEnter,
	mouseleave = LUI.UIElement.mouseLeave,
	mousedown = LUI.UIElement.MouseButtonEvent,
	leftmousedown = LUI.UIElement.LeftMouseDown,
	rightmousedown = LUI.UIElement.RightMouseDown,
	mouseup = LUI.UIElement.MouseButtonEvent,
	leftmouseup = LUI.UIElement.LeftMouseUp,
	rightmouseup = LUI.UIElement.RightMouseUp,
	gamepad_button = LUI.UIElement.GamepadButton,
	gain_focus = LUI.UIElement.gainFocus,
	lose_focus = LUI.UIElement.loseFocus,
	gain_active = LUI.UIElement.setActive,
	lose_active = LUI.UIElement.setInactive,
	restore_focus = LUI.UIElement.restoreFocus,
	close = LUI.UIElement.close,
	viewport_animation = LUI.UIElement.ViewportAnimation,
	clip_over = LUI.UIElement.clipOver,
	update_state = LUI.UIElement.updateState,
	record_curr_focused_elem_id = LUI.UIElement.RecordCurrFocusedElemID,
	left_mouse_play_down_clip = LUI.UIElement.LeftMousePlayDownClip,
	left_mouse_play_up_clip = LUI.UIElement.LeftMousePlayUpClip
}
LUI.UIElement.new = function ( leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
	if leftPct then
		local f121_local0 = ConstructLUIElement( leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
		if not f121_local0 then
		
		else
			LUI.UIElement.setInitialClass( f121_local0, LUI.UIElement )
			return f121_local0
		end
	end
	local element = ConstructLUIElement( LUI.UIElement.m_defaultAnimationState )
end

LUI.UIElement.fakeElemMetaTable = {
	__index = function ( t, k )
		return t
	end,
	__call = function ()
		return nil
	end,
	__newIndex = function ()
		
	end
}
LUI.UIElement.createFake = function ()
	local element = setmetatable( {}, LUI.UIElement.fakeElemMetaTable )
	return element
end

LUI.UIElement.showDebugTimer = function ( self, controller )
	local existingPlayClipFn = self.playClip
	self.playClip = function ( self, clipName )
		existingPlayClipFn( self, clipName )
		if self.elementsPlayingClips ~= nil and self.elementsPlayingClips > 0 then
			self._debugTimerIndex = Engine.SetDebugTimerInfo( self.id .. ":" .. self.currentState .. ":" .. clipName, self._debugTimerIndex )
		end
	end
	
	self:registerEventHandler( "clip_over", function ( self, event )
		if self._debugTimerIndex ~= nil then
			Engine.SetDebugTimerInfo( "", self._debugTimerIndex )
			self._debugTimerIndex = nil
		end
		LUI.UIElement.clipOver( self, event )
	end )
	local existingCloseFn = self.close
	self.close = function ( self )
		existingCloseFn( self )
		if self._debugTimerIndex ~= nil then
			Engine.SetDebugTimerInfo( "", self._debugTimerIndex )
			self._debugTimerIndex = nil
		end
	end
	
end

LUI.UIElement.ContainerState = {
	left = 0,
	top = 0,
	right = 0,
	bottom = 0,
	leftAnchor = true,
	topAnchor = true,
	rightAnchor = true,
	bottomAnchor = true
}
LUI.UIContainer.new = function ()
	return LUI.UIElement.new( LUI.UIElement.ContainerState )
end

