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
LUI.UIElement.addElement = function ( f1_arg0, f1_arg1 )
	if f1_arg0:canAddElement( f1_arg1 ) then
		f1_arg0:addElementToC( f1_arg1 )
	end
end

LUI.UIElement.addElementBefore = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1:getParent()
	if not f2_local0 then
		error( "LUI Error: Element has no parent!" )
		return 
	elseif f2_local0:canAddElement( f2_arg0 ) then
		f2_arg0:addElementBeforeInC( f2_arg1 )
	end
end

LUI.UIElement.addElementAfter = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1:getParent()
	if not f3_local0 then
		error( "LUI Error: Element has no parent!" )
		return 
	elseif f3_local0:canAddElement( f3_arg0 ) then
		f3_arg0:addElementAfterInC( f3_arg1 )
	end
end

LUI.UIElement.canAddElement = function ( f4_arg0, f4_arg1 )
	if f4_arg1 == nil then
		error( "LUI Error: Tried to add nil element!" )
		return false
	elseif f4_arg1:getParent() == f4_arg0 then
		return false
	else
		return true
	end
end

LUI.UIElement.unsubscribeFromAllModels = function ( f5_arg0 )
	f5_arg0:unregisterAllElementModelBindings()
	f5_arg0:unsubscribeFromGlobalModels()
	f5_arg0:unsubscribeFromAllModelsInC()
end

LUI.UIElement.setModel = function ( f6_arg0, f6_arg1, f6_arg2 )
	if f6_arg1 ~= f6_arg0:getModel() then
		f6_arg0:setModelInC( f6_arg1 )
		if f6_arg0.linkedElementModels then
			for f6_local3, f6_local4 in ipairs( f6_arg0.linkedElementModels ) do
				f6_local4.element:updateElementLinkedModels( f6_arg0 )
			end
		end
	end
end

LUI.UIElement.registerElementModelBinding = function ( f7_arg0, f7_arg1 )
	if not f7_arg0.linkedElementModels then
		f7_arg0.linkedElementModels = {}
	end
	for f7_local3, f7_local4 in ipairs( f7_arg0.linkedElementModels ) do
		if f7_local4.element == f7_arg1 then
			f7_local4.count = f7_local4.count + 1
			return 
		end
	end
	table.insert( f7_arg0.linkedElementModels, {
		element = f7_arg1,
		count = 1
	} )
end

LUI.UIElement.unregisterElementModelBinding = function ( f8_arg0, f8_arg1 )
	for f8_local3, f8_local4 in ipairs( f8_arg0.linkedElementModels ) do
		if f8_local4.element == f8_arg1 then
			f8_local4.count = f8_local4.count - 1
			if f8_local4.count == 0 then
				table.remove( f8_arg0.linkedElementModels, f8_local3 )
				break
			end
		end
	end
end

LUI.UIElement.unregisterAllElementModelBindings = function ( f9_arg0 )
	f9_arg0:unsubscribeFromElementBindings( nil )
	if f9_arg0.linkedElementModels then
		for f9_local3, f9_local4 in ipairs( f9_arg0.linkedElementModels ) do
			if f9_local4.element then
				f9_local4.element:unsubscribeFromElementBindings( f9_arg0 )
			end
		end
	end
end

LUI.UIElement.bindElementModel = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg1.element:getModel()
	if f10_local0 then
		local f10_local1 = nil
		if f10_arg1.modelPath then
			f10_local1 = Engine.GetModel( f10_local0, f10_arg1.modelPath )
		else
			f10_local1 = f10_local0
		end
		if f10_local1 then
			if f10_arg1.requiresSubscription then
				f10_arg1.subscription = f10_arg0:subscribeToModel( f10_local1, f10_arg1.updateFn )
			else
				f10_arg1.updateFn( f10_local1 )
			end
		end
	end
end

LUI.UIElement.subscribeToElementModel = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	f11_arg0:linkToElementModel( f11_arg1, f11_arg2, true, f11_arg3 )
end

LUI.UIElement.linkToElementModel = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	if not f12_arg0.elementModelBindings then
		f12_arg0.elementModelBindings = {}
	end
	f12_arg1:registerElementModelBinding( f12_arg0 )
	local f12_local0 = {
		element = f12_arg1,
		modelPath = f12_arg2,
		requiresSubscription = f12_arg3,
		updateFn = f12_arg4
	}
	table.insert( f12_arg0.elementModelBindings, f12_local0 )
	f12_arg0:bindElementModel( f12_local0 )
end

LUI.UIElement.unsubscribeFromElementBindings = function ( f13_arg0, f13_arg1 )
	if f13_arg0.elementModelBindings then
		local f13_local0 = 1
		while f13_local0 <= #f13_arg0.elementModelBindings do
			local f13_local1 = f13_arg0.elementModelBindings[f13_local0]
			if f13_local1.element == f13_arg1 or f13_arg1 == nil then
				if f13_local1.subscription ~= nil then
					f13_arg0:removeSubscription( f13_local1.subscription )
				end
				f13_local1.element:unregisterElementModelBinding( f13_arg0 )
				table.remove( f13_arg0.elementModelBindings, f13_local0 )
			end
			f13_local0 = f13_local0 + 1
		end
	end
end

LUI.UIElement.updateElementLinkedModels = function ( f14_arg0, f14_arg1 )
	if not f14_arg0.elementModelBindings then
		return 
	end
	for f14_local3, f14_local4 in ipairs( f14_arg0.elementModelBindings ) do
		if f14_local4.element == f14_arg1 then
			if f14_local4.subscription ~= nil then
				f14_arg0:removeSubscription( f14_local4.subscription )
			end
			f14_arg0:bindElementModel( f14_local4 )
		end
	end
end

LUI.UIElement.bindGlobalModel = function ( f15_arg0, f15_arg1, f15_arg2 )
	local f15_local0 = DataSources[f15_arg2.dataSource]
	if f15_local0 and f15_local0.getModel then
		local f15_local1 = f15_local0.getModel( f15_arg1 )
		if f15_local1 then
			local f15_local2 = nil
			if f15_arg2.modelPath then
				f15_local2 = Engine.GetModel( f15_local1, f15_arg2.modelPath )
			else
				f15_local2 = f15_local1
			end
			if f15_local2 then
				f15_arg2.subscription = f15_arg0:subscribeToModel( f15_local2, f15_arg2.updateFn )
			end
		end
	end
end

LUI.UIElement.subscribeToGlobalModel = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	if not f16_arg0.globalModelBindings then
		f16_arg0.globalModelBindings = {}
	end
	local f16_local0 = {
		dataSource = f16_arg2,
		modelPath = f16_arg3,
		updateFn = f16_arg4
	}
	table.insert( f16_arg0.globalModelBindings, f16_local0 )
	f16_arg0:bindGlobalModel( f16_arg1, f16_local0 )
	return f16_local0.subscription
end

LUI.UIElement.unsubscribeFromGlobalModels = function ( f17_arg0 )
	if not f17_arg0.globalModelBindings then
		return 
	end
	for f17_local3, f17_local4 in ipairs( f17_arg0.globalModelBindings ) do
		if f17_local4.subscription ~= nil then
			f17_arg0:removeSubscription( f17_local4.subscription )
		end
	end
	f17_arg0.globalModelBindings = nil
end

LUI.UIElement.isClosed = function ( f18_arg0 )
	return f18_arg0:getParent() == nil
end

LUI.UIElement.close = function ( f19_arg0 )
	f19_arg0:unsubscribeFromAllModels()
	local f19_local0 = f19_arg0:getParent()
	if f19_local0 ~= nil then
		f19_local0:removeElement( f19_arg0 )
	end
	if f19_arg0 == LUI.currentMouseFocus then
		LUI.currentMouseFocus = nil
	end
	f19_arg0:closeElementInC()
end

LUI.UIElement.closeAndRefocus = function ( f20_arg0, f20_arg1 )
	if f20_arg0:isInFocus() then
		f20_arg0:processEvent( LUI.UIButton.LoseFocusEvent )
		f20_arg1:processEvent( LUI.UIButton.GainFocusEvent )
	end
	f20_arg0:close()
end

LUI.UIElement.getFullID = function ( f21_arg0 )
	local f21_local0 = f21_arg0.id
	local f21_local1 = f21_arg0:getParent()
	while f21_local1 do
		f21_local0 = f21_local1.id .. "/" .. f21_local0
		f21_local1 = f21_local1:getParent()
	end
	return f21_local0
end

LUI.UIElement.isInputDisabledOnChain = function ( f22_arg0 )
	while f22_arg0 do
		if f22_arg0.m_inputDisabled then
			return true
		end
		f22_arg0 = f22_arg0:getParent()
	end
	return false
end

LUI.UIElement.getSoundSet = function ( f23_arg0 )
	local f23_local0 = f23_arg0
	while f23_local0 do
		if f23_local0.soundSet then
			return f23_local0.soundSet
		end
		f23_local0 = f23_local0:getParent()
	end
end

LUI.UIElement.findSoundAlias = function ( f24_arg0, f24_arg1 )
	local f24_local0 = f24_arg0
	while f24_local0 do
		if f24_local0.soundSet and SoundSet[f24_local0.soundSet] and SoundSet[f24_local0.soundSet][f24_arg1] then
			return SoundSet[f24_local0.soundSet][f24_arg1]
		end
		f24_local0 = f24_local0:getParent()
	end
end

LUI.UIElement.playSound = function ( f25_arg0, f25_arg1 )
	local f25_local0 = f25_arg0:findSoundAlias( f25_arg1 )
	if f25_local0 then
		Engine.PlaySound( f25_local0 )
		return true
	else
		
	end
end

LUI.UIElement.playActionSFX = function ( f26_arg0 )
	f26_arg0:playSound( "action" )
end

LUI.UIElement.getLocalSize = function ( f27_arg0 )
	local f27_local0, f27_local1, f27_local2, f27_local3 = nil
	if f27_arg0.getNextRect then
		f27_local0, f27_local1, f27_local2, f27_local3 = f27_arg0:getNextRect()
	else
		f27_local0, f27_local1, f27_local2, f27_local3 = f27_arg0:getLocalRect()
	end
	return f27_local2 - f27_local0, f27_local3 - f27_local1
end

LUI.UIElement.setMouseDisabled = function ( f28_arg0, f28_arg1 )
	f28_arg0.m_mouseDisabled = f28_arg1
	f28_arg0.handleMouseMove = not f28_arg1
	f28_arg0.handleMouseButton = not f28_arg1
end

LUI.UIElement.toggleMouse = function ( f29_arg0 )
	f29_arg0.m_mouseDisabled = not f29_arg0.m_mouseDisabled
end

LUI.UIElement.setHandleMouse = function ( f30_arg0, f30_arg1 )
	f30_arg0.handleMouseMove = f30_arg1
	f30_arg0.handleMouseButton = f30_arg1
end

LUI.UIElement.toggleHandleMouse = function ( f31_arg0 )
	f31_arg0.handleMouseMove = not f31_arg0.handleMouseMove
	f31_arg0.handleMouseButton = not f31_arg0.handleMouseButton
end

LUI.UIElement.setHandleMouseMove = function ( f32_arg0, f32_arg1 )
	f32_arg0.handleMouseMove = f32_arg1
end

LUI.UIElement.toggleHandleMouseMove = function ( f33_arg0 )
	f33_arg0.handleMouseMove = not f33_arg0.handleMouseMove
end

LUI.UIElement.setHandleMouseButton = function ( f34_arg0, f34_arg1 )
	f34_arg0.handleMouseButton = f34_arg1
end

LUI.UIElement.toggleHandleMouseButton = function ( f35_arg0 )
	f35_arg0.handleMouseButton = f35_arg0.handleMouseButton
end

LUI.UIElement.setForceMouseEventDispatch = function ( f36_arg0, f36_arg1 )
	f36_arg0.m_forceMouseEventDispatch = f36_arg1
end

LUI.UIElement.clearMouseFocus = function ( f37_arg0 )
	local f37_local0 = LUI.currentMouseFocus
	if f37_local0 then
		f37_local0.m_mouseOver = nil
	end
end

LUI.UIElement.IsMouseInsideElement = function ( f38_arg0, f38_arg1 )
	local f38_local0, f38_local1 = ProjectRootCoordinate( f38_arg1.rootName, f38_arg1.x, f38_arg1.y )
	if f38_local0 == nil or f38_local1 == nil then
		return false
	end
	local f38_local2 = Engine.IsMouseInsideElement( f38_arg0, f38_arg1.rootName, f38_local0, f38_local1 )
	if f38_local2 ~= nil then
		return f38_local2, f38_local0, f38_local1
	end
	local f38_local3, f38_local4, f38_local5, f38_local6 = f38_arg0:getRect()
	local f38_local7
	if f38_local3 == nil or f38_local4 > f38_local1 or f38_local1 > f38_local6 or f38_local3 > f38_local0 or f38_local0 > f38_local5 then
		f38_local7 = false
	else
		f38_local7 = true
	end
	return f38_local7, f38_local0, f38_local1
end

local f0_local0 = function ( f39_arg0, f39_arg1 )
	if not f39_arg0:hasClip( "Focus" ) then
		return 
	elseif LUI.currentMouseFocus then
		if not LUI.UIElement.IsMouseInsideElement( LUI.currentMouseFocus, f39_arg1 ) then
			LUI.currentMouseFocus:processEvent( {
				name = "lose_focus",
				controller = f39_arg1.controller,
				isMouse = true
			} )
			LUI.currentMouseFocus.m_mouseOver = nil
			LUI.currentMouseFocus = nil
		else
			DebugPrint( "^1LUI_MOUSE: ^2Overlapping elements -- " .. f39_arg0.id .. " and " .. LUI.currentMouseFocus.id )
		end
	end
	if f39_arg0 ~= LUI.currentMouseFocus then
		f39_arg0:processEvent( {
			name = "gain_focus",
			controller = f39_arg1.controller,
			isMouse = true
		} )
		f39_arg0:dispatchEventToParent( {
			name = "mouse_focus",
			element = f39_arg0,
			controller = f39_arg1.controller
		} )
	end
end

LUI.UIElement.MouseMoveEvent = function ( f40_arg0, f40_arg1 )
	if f40_arg0.disabled or f40_arg0.m_inputDisabled or f40_arg0.m_mouseDisabled or not f40_arg0:isVisible() then
		return 
	elseif f40_arg0.handleMouseMove and not f40_arg1.waitingForKeyBind then
		local f40_local0, f40_local1, f40_local2 = LUI.UIElement.IsMouseInsideElement( f40_arg0, f40_arg1 )
		if f40_local0 and LUI.currentMouseFocus ~= nil and f40_arg0 ~= LUI.currentMouseFocus and f40_arg0.m_focusable and not f40_arg0.m_preventFromBeingCurrentMouseFocus and Engine.IsMouseInsideElement( LUI.currentMouseFocus, f40_arg1.rootName, f40_local1, f40_local2 ) then
			return 
		elseif f40_local0 then
			if f40_arg0.m_mouseOver == nil then
				f40_arg0.m_mouseOver = true
				if not f40_arg0:isInFocus() then
					if f40_arg0:hasClip( "Over" ) then
						f40_arg0:processEvent( {
							name = "mouseenter",
							controller = f40_arg1.controller,
							isMouse = true
						} )
					elseif f40_arg0.m_focusable then
						f0_local0( f40_arg0, f40_arg1 )
					end
				elseif f40_arg0.m_focusable and f40_arg0 ~= LUI.currentMouseFocus and not f40_arg0.m_preventFromBeingCurrentMouseFocus then
					DebugPrint( "^1LUI_MOUSE: ^2inside element that is not the currentMouseFocus -- " .. f40_arg0.id )
					LUI.currentMouseFocus = f40_arg0
				end
			elseif not LUI.currentMouseFocus and f40_arg0.m_focusable then
				DebugPrint( "^1LUI_MOUSE: ^2setting currentMouseFocus -- " .. f40_arg0.id )
				LUI.currentMouseFocus = f40_arg0
			end
		elseif f40_arg0 ~= LUI.currentMouseFocus then
			if f40_arg0:isInFocus() then
				f40_arg0:setFocus( false )
			end
			if f40_arg0.m_mouseOver ~= nil then
				f40_arg0.m_mouseOver = nil
				f40_arg0:processEvent( {
					name = "mouseleave",
					controller = f40_arg1.controller,
					isMouse = true
				} )
			end
		end
		if f40_arg0.m_eventHandlers.mousedrag ~= nil and f40_arg0.m_leftMouseDown ~= nil then
			f40_arg0.m_eventHandlers:mousedrag( {
				name = "mousedrag",
				controller = f40_arg1.controller,
				root = f40_arg1.root,
				x = f40_local1,
				y = f40_local2
			} )
		end
	end
	if f40_arg0.m_forceMouseEventDispatch or LUI.UIElement.IsMouseInsideElement( f40_arg0, f40_arg1 ) then
		f40_arg0:dispatchEventToChildren( f40_arg1 )
	end
end

LUI.UIElement.mouseEnter = function ( f41_arg0, f41_arg1 )
	local f41_local0 = false
	if not f41_arg0.m_active then
		if f41_arg0:playClip( "GainOver" ) then
			f41_arg0.nextClip = "Over"
			f41_local0 = true
		else
			f41_local0 = f41_arg0:playClip( "Over" )
		end
	end
	return f41_local0
end

LUI.UIElement.mouseLeave = function ( f42_arg0, f42_arg1 )
	if not f42_arg0:isInFocus() and not f42_arg0.m_active then
		if f42_arg0:playClip( "LoseOver" ) then
			f42_arg0.nextClip = "DefaultClip"
		else
			f42_arg0:playClip( "DefaultClip" )
		end
	end
end

LUI.UIElement.LeftMouseDown = function ( f43_arg0, f43_arg1 )
	f43_arg0:processEvent( {
		name = "button_over_down",
		controller = f43_arg1.controller
	} )
end

LUI.UIElement.RightMouseDown = function ( f44_arg0, f44_arg1 )
	f44_arg0:processEvent( {
		name = "button_over_down",
		controller = f44_arg1.controller
	} )
end

LUI.UIElement.LeftMouseUp = function ( f45_arg0, f45_arg1 )
	if f45_arg1.inside and not f45_arg0.disabled then
		if f45_arg0.m_eventHandlers.button_action then
			return f45_arg0:processEvent( {
				name = "button_action",
				controller = f45_arg1.controller,
				isMouse = true
			} )
		else
			return f45_arg0:dispatchEventToParent( {
				name = "mouse_left_click",
				element = f45_arg0,
				controller = f45_arg1.controller,
				inside = f45_arg1.inside
			} )
		end
	else
		
	end
end

LUI.UIElement.RightMouseUp = function ( f46_arg0, f46_arg1 )
	if f46_arg1.inside then
		if not f46_arg0.disabled then
			local f46_local0 = f46_arg0:processEvent( {
				name = "button_actionsecondary",
				controller = f46_arg1.controller,
				isMouse = true
			} )
			if f46_local0 then
				return f46_local0
			end
		end
	else
		f46_arg0:processEvent( {
			name = "button_up"
		} )
	end
end

LUI.UIElement.MouseButtonEvent = function ( f47_arg0, f47_arg1 )
	if f47_arg0.disabled or f47_arg0.m_inputDisabled or f47_arg0.m_mouseDisabled or not f47_arg0:isVisible() then
		return 
	elseif f47_arg0.handleMouseButton then
		local f47_local0, f47_local1, f47_local2 = LUI.UIElement.IsMouseInsideElement( f47_arg0, f47_arg1 )
		if f47_arg1.name == "mouseup" then
			if f47_arg1.button == "left" then
				if f47_arg0.m_leftMouseDown ~= nil then
					f47_arg0.m_leftMouseDown = nil
					if f47_arg0.m_focusable and f47_arg0:hasClip( "Over" ) then
						if not f47_arg0:isInFocus() then
							f0_local0( f47_arg0, f47_arg1 )
						elseif f47_arg0.m_eventHandlers.leftmouseup ~= nil then
							local f47_local3 = f47_arg0.m_eventHandlers:leftmouseup( {
								name = "leftmouseup",
								controller = f47_arg1.controller,
								root = f47_arg1.root,
								x = f47_local1,
								y = f47_local2,
								inside = f47_local0
							} )
							if f47_local3 then
								return f47_local3
							end
						end
					elseif f47_arg0.m_eventHandlers.leftmouseup ~= nil then
						local f47_local3 = f47_arg0.m_eventHandlers:leftmouseup( {
							name = "leftmouseup",
							controller = f47_arg1.controller,
							root = f47_arg1.root,
							x = f47_local1,
							y = f47_local2,
							inside = f47_local0
						} )
						if f47_local3 then
							return f47_local3
						end
					end
				end
				if not f47_local0 and f47_arg0.m_eventHandlers.leftclick_outside ~= nil then
					local f47_local3 = f47_arg0.m_eventHandlers:leftclick_outside( {
						name = "leftclick_outside",
						controller = f47_arg1.controller,
						root = f47_arg1.root,
						x = f47_local1,
						y = f47_local2,
						inside = f47_local0
					} )
					if f47_local3 then
						return f47_local3
					end
				end
			end
			if f47_arg1.button == "right" and f47_arg0.m_rightMouseDown ~= nil then
				f47_arg0.m_rightMouseDown = nil
				if f47_arg0.m_eventHandlers.rightmouseup ~= nil then
					local f47_local3 = f47_arg0.m_eventHandlers:rightmouseup( {
						name = "rightmouseup",
						controller = f47_arg1.controller,
						root = f47_arg1.root,
						x = f47_local1,
						y = f47_local2,
						inside = f47_local0
					} )
					if f47_local3 then
						return f47_local3
					end
				end
			end
		end
		if f47_local0 and f47_arg1.name == "mousedown" then
			if f47_arg1.button == "left" and f47_arg0.m_eventHandlers.leftmousedown ~= nil and f47_arg0.m_leftMouseDown == nil then
				f47_arg0.m_leftMouseDown = true
				f47_arg0.m_eventHandlers:leftmousedown( {
					name = "leftmousedown",
					controller = f47_arg1.controller,
					root = f47_arg1.root,
					x = f47_local1,
					y = f47_local2,
					inside = f47_local0
				} )
			end
			if f47_arg1.button == "right" and f47_arg0.m_eventHandlers.rightmousedown ~= nil and f47_arg0.m_rightMouseDown == nil then
				f47_arg0.m_rightMouseDown = true
				f47_arg0.m_eventHandlers:rightmousedown( {
					name = "rightmousedown",
					controller = f47_arg1.controller,
					root = f47_arg1.root,
					x = f47_local1,
					y = f47_local2,
					inside = f47_local0
				} )
			end
		end
	end
	if f47_arg0.m_forceMouseEventDispatch or LUI.UIElement.IsMouseInsideElement( f47_arg0, f47_arg1 ) then
		f47_arg0:dispatchEventToChildren( f47_arg1 )
	end
end

LUI.UIElement.AcceptGamePadButtonInput = function ( f48_arg0, f48_arg1 )
	if f48_arg0.m_inputDisabled or f48_arg0.occludedBy then
		return false
	elseif not f48_arg0.m_ownerController or f48_arg0.m_ownerController == f48_arg1.controller or f48_arg0.anyControllerAllowed or Engine.IsControllerBeingUsed( f48_arg1.controller ) then
		return true
	elseif f48_arg0.m_ownerController and f48_arg0.m_ownerController ~= f48_arg1.controller then
		local f48_local0 = f48_arg1.name
		f48_arg1.name = "unused_gamepad_button"
		f48_arg0:processEvent( f48_arg1 )
		f48_arg0:dispatchEventToChildren( f48_arg1 )
		f48_arg1.name = f48_local0
	end
end

LUI.UIElement.AcceptGamePadButtonInputFromModelCallback = function ( f49_arg0, f49_arg1 )
	if f49_arg0.m_inputDisabled or f49_arg0.occludedBy then
		return false
	elseif not f49_arg0.m_ownerController or f49_arg0.m_ownerController == f49_arg1 or f49_arg0.anyControllerAllowed or Engine.IsControllerBeingUsed( f49_arg1 ) then
		return true
	else
		return false
	end
end

LUI.UIElement.DoNavigationForGamePadButton = function ( f50_arg0, f50_arg1 )
	return f50_arg0:handleGamepadButton( f50_arg1 )
end

LUI.UIElement.GamepadButton = function ( f51_arg0, f51_arg1 )
	if f51_arg0.m_inputDisabled then
		return 
	elseif not f51_arg0:handleGamepadButton( f51_arg1 ) then
		if f51_arg0.m_ownerController == nil or f51_arg0.m_ownerController == f51_arg1.controller then
			return f51_arg0:dispatchEventToChildren( f51_arg1 )
		else
			
		end
	else
		return true
	end
end

LUI.UIElement.GamepadButton_DPadOnly = function ( f52_arg0, f52_arg1 )
	if f52_arg1.qualifier ~= "dpad" then
		return 
	else
		LUI.UIElement.GamepadButton( f52_arg0, f52_arg1 )
	end
end

LUI.UIElement.doNavigationForElement = function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
	local f53_local0 = {}
	while f53_arg2 and not f53_local0[f53_arg2] and f53_arg2 ~= f53_arg0 do
		if type( f53_arg2 ) == "table" then
			for f53_local4, f53_local5 in ipairs( f53_arg2 ) do
				if f53_arg0:doNavigationForElement( f53_arg1, f53_local5, f53_arg3 ) then
					return true
				end
			end
			return false
		elseif f53_arg2:processEvent( {
			name = "gain_focus",
			controller = f53_arg1.controller,
			button = f53_arg1.button
		} ) then
			if f53_arg3 then
				f53_arg3:processEvent( {
					name = "lose_focus",
					controller = f53_arg1.controller,
					button = f53_arg1.button,
					ignoreFocusCheck = true
				} )
			else
				f53_arg0:processEvent( {
					name = "lose_focus",
					controller = f53_arg1.controller,
					button = f53_arg1.button,
					ignoreFocusCheck = true
				} )
			end
			if not f53_arg2:playSound( "gain_focus" ) and f53_arg2.gainFocusSFX then
				Engine.PlaySound( f53_arg2.gainFocusSFX )
			end
			return true
		end
		f53_local0[f53_arg2] = true
		f53_arg2 = f53_arg2.navigation[f53_arg1.button]
	end
end

LUI.UIElement.doNavigationForElementFromModelCallback = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3, f54_arg4 )
	local f54_local0 = {}
	while f54_arg3 and not f54_local0[f54_arg3] and f54_arg3 ~= f54_arg0 do
		if type( f54_arg3 ) == "table" then
			for f54_local4, f54_local5 in ipairs( f54_arg3 ) do
				if f54_arg0:doNavigationForElementFromModelCallback( f54_arg1, f54_arg2, f54_local5, f54_arg4 ) then
					return true
				end
			end
			return false
		elseif f54_arg3:processEvent( {
			name = "gain_focus",
			controller = f54_arg1,
			button = f54_arg2
		} ) then
			if f54_arg4 then
				f54_arg4:processEvent( {
					name = "lose_focus",
					controller = f54_arg1,
					button = f54_arg2,
					ignoreFocusCheck = true
				} )
			else
				f54_arg0:processEvent( {
					name = "lose_focus",
					controller = f54_arg1,
					button = f54_arg2,
					ignoreFocusCheck = true
				} )
			end
			if not f54_arg3:playSound( "gain_focus" ) and f54_arg3.gainFocusSFX then
				Engine.PlaySound( f54_arg3.gainFocusSFX )
			end
			return true
		end
		f54_local0[f54_arg3] = true
		f54_arg3 = f54_arg3.navigation[f54_arg2]
	end
end

LUI.UIElement.GetCorrespondingGamepadButtonForKey = function ( f55_arg0 )
	if f55_arg0 == "DOWNARROW" or f55_arg0 == "MWHEELDOWN" then
		return "down"
	elseif f55_arg0 == "UPARROW" or f55_arg0 == "MWHEELUP" then
		return "up"
	elseif f55_arg0 == "RIGHTARROW" then
		return "right"
	elseif f55_arg0 == "LEFTARROW" then
		return "left"
	elseif f55_arg0 == "ENTER" then
		return "primary"
	else
		return nil
	end
end

LUI.UIElement.GetCorrespondingGamepadButtonString = function ( f56_arg0 )
	if f56_arg0 == Enum.LUIButton.LUI_KEY_DOWN then
		return "down"
	elseif f56_arg0 == Enum.LUIButton.LUI_KEY_UP then
		return "up"
	elseif f56_arg0 == Enum.LUIButton.LUI_KEY_LEFT then
		return "left"
	elseif f56_arg0 == Enum.LUIButton.LUI_KEY_RIGHT then
		return "right"
	else
		return nil
	end
end

LUI.UIElement.handleGamepadButton = function ( f57_arg0, f57_arg1, f57_arg2 )
	if f57_arg1.simulated or f57_arg0.forceChildNavigation then
		return 
	elseif (f57_arg0:isInFocus() or f57_arg0.navigation and f57_arg2) and f57_arg1.down == true then
		local f57_local0 = f57_arg1.button
		if f57_local0 == "key_shortcut" then
			f57_local0 = LUI.UIElement.GetCorrespondingGamepadButtonForKey( f57_arg1.key )
			if f57_local0 then
				f57_arg1.button = f57_local0
			end
		end
		if f57_local0 ~= nil and f57_arg0.m_disableNavigation ~= true then
			if f57_arg0.navigationSounds and f57_arg0.navigationSounds[f57_local0] then
				Engine.PlaySound( f57_arg0.navigationSounds[f57_local0] )
			end
			local f57_local1 = f57_arg0.navigation[f57_local0]
			if f57_local1 ~= nil then
				if type( f57_local1 ) == "function" then
					f57_local1 = f57_local1( f57_arg0, f57_arg1.controller )
					if f57_local1 == true then
						return true
					end
				end
				if type( f57_local1 ) == "table" then
					local f57_local2 = f57_local1
					local f57_local3 = nil
					f57_local1 = f57_local2[1]
					for f57_local7, f57_local8 in ipairs( f57_local2 ) do
						local f57_local9 = f57_local8.lastFocusedTimestamp
						if f57_local9 and (not f57_local3 or f57_local3 < f57_local9) then
							f57_local1 = f57_local8
							f57_local3 = f57_local9
						end
					end
				end
				if f57_arg0:doNavigationForElement( f57_arg1, f57_local1, f57_arg2 ) then
					return true
				end
			end
			if f57_local0 == "primary" and not f57_arg0.disabled then
				f57_arg0:processEvent( {
					name = "button_action",
					controller = f57_arg1.controller
				} )
				return true
			end
		end
		if not f57_arg2 then
			f57_arg2 = f57_arg0
		end
		local f57_local1 = f57_arg0:getParent()
		if f57_local1 then
			return f57_local1:handleGamepadButton( f57_arg1, f57_arg2 )
		end
	elseif f57_arg0.navigation and f57_arg2 and f57_arg1.down == true then
		local f57_local0 = f57_arg0:getParent()
		if f57_local0 then
			return f57_local0:handleGamepadButton( f57_arg1, f57_arg2 )
		end
	end
end

LUI.UIElement.setActive = function ( f58_arg0, f58_arg1 )
	if f58_arg0:playClip( "GainActive" ) then
		f58_arg0.nextClip = "Active"
	else
		f58_arg0:playClip( "Active" )
	end
	f58_arg0.m_active = true
	f58_arg0:dispatchEventToChildren( f58_arg1 )
end

LUI.UIElement.setInactive = function ( f59_arg0, f59_arg1 )
	if f59_arg0:playClip( "LoseActive" ) then
		f59_arg0.nextClip = "DefaultClip"
	else
		f59_arg0:playClip( "DefaultClip" )
	end
	f59_arg0.m_active = nil
	f59_arg0:dispatchEventToChildren( f59_arg1 )
end

LUI.UIElement.gainFocus = function ( f60_arg0, f60_arg1 )
	local f60_local0 = false
	if f60_arg0.m_focusable and not f60_arg0.onlyChildrenFocusable then
		f60_arg0:setFocus( true )
		f60_arg0.lastFocusedTimestamp = Engine.milliseconds()
		LUI.currentMouseFocus = f60_arg0
		if not f60_arg1.skipGainFocus and f60_arg0:playClip( "GainFocus" ) then
			f60_arg0.nextClip = "Focus"
			f60_local0 = true
		else
			f60_local0 = f60_arg0:playClip( "Focus" )
		end
		if not f60_arg0.clipsPerState then
			f60_local0 = true
		end
		if f60_local0 then
			f60_arg0:dispatchEventToParent( {
				name = "record_curr_focused_elem_id",
				id = f60_arg0.id,
				controller = f60_arg1.controller,
				idStack = {
					f60_arg0.id
				}
			} )
		end
	elseif not f60_arg0.m_focusable then
		return false
	end
	if f60_local0 then
		return true
	end
	return f60_arg0:dispatchEventToChildren( f60_arg1 )
end

LUI.UIElement.loseFocus = function ( f61_arg0, f61_arg1 )
	if f61_arg0.m_focusable and (f61_arg0:isInFocus() or f61_arg1.ignoreFocusCheck) then
		f61_arg0:setFocus( false )
		if not f61_arg1.keepSelected or not f61_arg0:playClip( "Selected" ) then
			if not f61_arg1.skipLoseFocus and f61_arg0:playClip( "LoseFocus" ) then
				f61_arg0.nextClip = "DefaultClip"
			else
				f61_arg0:playClip( "DefaultClip" )
			end
		end
	end
	f61_arg0:dispatchEventToChildren( f61_arg1 )
end

LUI.UIElement.processEvent = function ( f62_arg0, f62_arg1 )
	local f62_local0 = f62_arg0.m_eventHandlers[f62_arg1.name]
	if f62_local0 ~= nil then
		return f62_local0( f62_arg0, f62_arg1 )
	else
		return f62_arg0:dispatchEventToChildren( f62_arg1 )
	end
end

LUI.UIElement.processEventToParent = function ( f63_arg0, f63_arg1 )
	local f63_local0 = f63_arg0.m_eventHandlers[f63_arg1.name]
	if f63_local0 ~= nil then
		return f63_local0( f63_arg0, f63_arg1 )
	else
		return f63_arg0:dispatchEventToParent( f63_arg1 )
	end
end

LUI.UIElement.getRoot = function ( f64_arg0 )
	if not f64_arg0 then
		return 
	end
	local f64_local0 = f64_arg0:getParent()
	while f64_local0 do
		f64_arg0 = f64_local0
		f64_local0 = f64_local0:getParent()
	end
	return f64_arg0
end

LUI.UIElement.dispatchEventToRoot = function ( f65_arg0, f65_arg1 )
	local f65_local0 = f65_arg0:getParent()
	while f65_local0 do
		local f65_local1 = f65_local0:getParent()
		if f65_local1 == nil then
			local f65_local2 = f65_local0.m_eventHandlers[f65_arg1.name]
			if f65_local2 ~= nil then
				f65_local2( f65_local0, f65_arg1 )
			end
			f65_local0:dispatchEventToChildren( f65_arg1 )
			return 
		end
		f65_local0 = f65_local1
	end
end

LUI.UIElement.dispatchEventToParent = function ( f66_arg0, f66_arg1 )
	local f66_local0 = f66_arg0:getParent()
	while f66_local0 do
		local f66_local1 = f66_local0.m_eventHandlers[f66_arg1.name]
		if f66_local1 then
			return f66_local1( f66_local0, f66_arg1 )
		end
		f66_local0 = f66_local0:getParent()
	end
end

LUI.UIElement.dispatchEventToParentWithSelf = function ( f67_arg0, f67_arg1 )
	local f67_local0 = f67_arg0:getParent()
	while f67_local0 do
		local f67_local1 = f67_local0.m_eventHandlers[f67_arg1.name]
		if f67_local1 then
			return f67_local1( f67_arg0, f67_arg1 )
		end
		f67_local0 = f67_local0:getParent()
	end
end

LUI.UIElement.dispatchEventToChildren = function ( f68_arg0, f68_arg1 )
	local f68_local0 = f68_arg0:getFirstChild()
	if f68_local0 == nil then
		return 
	end
	while f68_local0 ~= nil do
		local f68_local1 = f68_local0:getNextSibling()
		local f68_local2 = f68_local0:processEvent( f68_arg1 )
		if f68_local2 then
			return f68_local2
		end
		f68_local0 = f68_local1
	end
end

LUI.UIElement.registerEventHandler = function ( f69_arg0, f69_arg1, f69_arg2 )
	f69_arg0.m_eventHandlers[f69_arg1] = f69_arg2
end

LUI.UIElement.isFocusable = function ( f70_arg0 )
	return f70_arg0.m_focusable
end

LUI.UIElement.clearNavigationTable = function ( f71_arg0 )
	f71_arg0.navigation = {}
end

LUI.UIElement.makeFocusable = function ( f72_arg0 )
	f72_arg0.m_focusable = true
	f72_arg0.navigation = {}
end

LUI.UIElement.makeFocusableWithoutResettingNavigation = function ( f73_arg0 )
	f73_arg0.m_focusable = true
end

LUI.UIElement.makeNotFocusable = function ( f74_arg0 )
	f74_arg0.m_focusable = false
end

LUI.UIElement.isIDNamed = function ( f75_arg0 )
	if string.find( f75_arg0.id, "." ) then
		return true
	else
		return false
	end
end

LUI.UIElement.getFirstInFocus = function ( f76_arg0 )
	if f76_arg0:isInFocus() then
		return f76_arg0
	end
	local f76_local0 = f76_arg0:getFirstChild()
	while f76_local0 do
		local f76_local1 = f76_local0:getFirstInFocus()
		if f76_local1 then
			return f76_local1
		end
		f76_local0 = f76_local0:getNextSibling()
	end
	local f76_local1 = f76_arg0:getNextSibling()
	if f76_local1 then
		return f76_local1:getFirstInFocus()
	end
end

LUI.UIElement.doesElementOrChildHaveFocus = function ( f77_arg0 )
	if f77_arg0:isInFocus() then
		return true
	end
	local f77_local0 = f77_arg0:getFirstChild()
	while f77_local0 do
		if f77_local0:doesElementOrChildHaveFocus() then
			return true
		end
		f77_local0 = f77_local0:getNextSibling()
	end
	return false
end

LUI.UIElement.hasChildWithID = function ( f78_arg0, f78_arg1 )
	if f78_arg0.id == f78_arg1 then
		return true
	end
	local f78_local0 = f78_arg0:getFirstChild()
	while f78_local0 do
		if f78_local0:hasChildWithID( f78_arg1 ) then
			return true
		end
		f78_local0 = f78_local0:getNextSibling()
	end
	return false
end

LUI.UIElement.saveState = function ( f79_arg0 )
	if not f79_arg0:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. f79_arg0:getFullID() )
		return 
	elseif f79_arg0.lastFocusedElemEvent and f79_arg0.lastFocusedElemEvent.id then
		LUI.savedMenuStates[f79_arg0.id] = {
			id = f79_arg0.lastFocusedElemEvent.id,
			saveEvent = f79_arg0.lastFocusedElemEvent
		}
	else
		LUI.savedMenuStates[f79_arg0.id] = nil
	end
end

LUI.UIElement.clearSavedState = function ( f80_arg0 )
	if not f80_arg0:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. f80_arg0:getFullID() )
		return 
	else
		LUI.savedMenuStates[f80_arg0.id] = nil
	end
end

LUI.UIElement.restoreState = function ( f81_arg0 )
	if not f81_arg0:isIDNamed() then
		error( "LUI Error: Tried to restore menu state, but element has no name: " .. f81_arg0:getFullID() )
		return 
	elseif Engine.DvarBool( nil, "rat_playback_enabled" ) then
		return 
	else
		local f81_local0 = LUI.savedMenuStates[f81_arg0.id]
		if f81_local0 ~= nil and f81_local0.id then
			return f81_arg0:processEvent( {
				name = "restore_focus",
				id = f81_local0.id,
				data = f81_local0.data,
				saveEvent = f81_local0.saveEvent
			} )
		else
			
		end
	end
end

LUI.UIElement.restoreFocus = function ( f82_arg0, f82_arg1 )
	local f82_local0 = f82_arg1.saveEvent
	if f82_local0 and f82_local0.idStack and #f82_local0.idStack > 0 and f82_arg0.id == f82_local0.idStack[1] then
		if #f82_local0.idStack == 1 then
			f82_arg0:processEvent( {
				name = "gain_focus",
				saveEvent = f82_local0
			} )
			return true
		else
			table.remove( f82_local0.idStack, 1 )
			return f82_arg0:dispatchEventToChildren( f82_arg1 )
		end
	else
		return false
	end
end

LUI.UIElement.animate = function ( f83_arg0, f83_arg1 )
	if f83_arg0.m_animationStates[f83_arg1.animationStateName] then
		f83_arg0:animateToState( f83_arg1.animationStateName, f83_arg1.duration, f83_arg1.easeIn, f83_arg1.easeOut )
		if f83_arg1.animateChildren then
			f83_arg0:dispatchEventToChildren( f83_arg1 )
		end
	else
		f83_arg0:dispatchEventToChildren( f83_arg1 )
	end
end

LUI.UIElement.hide = function ( f84_arg0 )
	f84_arg0:setAlpha( 0 )
end

LUI.UIElement.show = function ( f85_arg0 )
	f85_arg0:setAlpha( 1 )
end

LUI.UIElement.rotateRandomly = function ( f86_arg0, f86_arg1 )
	if not f86_arg0.m_eventHandlers.rotate_randomly then
		f86_arg0:registerEventHandler( "rotate_randomly", LUI.UIElement.rotateRandomly )
		f86_arg0:addElement( LUI.UITimer.new( 2500, "rotate_randomly", false, f86_arg0 ) )
	end
	f86_arg0:beginAnimation( "rotate_randomly", 2500, true, true )
	f86_arg0:setXRot( math.random( -45, 45 ) )
	f86_arg0:setYRot( math.random( -45, 45 ) )
end

LUI.UIElement.spinRandomly = function ( f87_arg0, f87_arg1 )
	if not f87_arg0.m_eventHandlers.spin_randomly then
		f87_arg0:registerEventHandler( "spin_randomly", LUI.UIElement.rotateRandomly )
		f87_arg0:addElement( LUI.UITimer.new( 2500, "spin_randomly", false, f87_arg0 ) )
	end
	f87_arg0:beginAnimation( "rotate_randomly", 2500, true, true )
	f87_arg0:setZRot( math.random( -90, 90 ) )
end

LUI.UIElement.flicker = function ( f88_arg0, f88_arg1, f88_arg2, f88_arg3, f88_arg4, f88_arg5, f88_arg6 )
	if not f88_arg1 then
		f88_arg1 = 1000
	end
	if not f88_arg2 then
		f88_arg2 = 1
	end
	if not f88_arg3 then
		f88_arg3 = 0.2
	end
	if not f88_arg4 then
		f88_arg4 = 0.7
	end
	if not f88_arg5 then
		f88_arg5 = 50
	end
	if not f88_arg6 then
		f88_arg6 = 150
	end
	f88_arg0.lowFlickerAlpha = f88_arg3
	f88_arg0.highFlickerAlpha = f88_arg4
	f88_arg0.endFlickerAlpha = f88_arg2
	f88_arg0:registerEventHandler( "close_flicker_timer", LUI.UIElement.CloseFlickerTimer )
	f88_arg0:alternateStates( f88_arg1, LUI.UIElement.LowFlickerAlternate, LUI.UIElement.HighFlickerAlternate, f88_arg5, f88_arg6, LUI.UIElement.EndFlickerAlternate )
end

LUI.UIElement.LowFlickerAlternate = function ( f89_arg0, f89_arg1 )
	f89_arg0:beginAnimation( "lower_alpha", f89_arg1 )
	f89_arg0:setAlpha( f89_arg0.lowFlickerAlpha )
end

LUI.UIElement.HighFlickerAlternate = function ( f90_arg0, f90_arg1 )
	f90_arg0:beginAnimation( "raise_alpha", f90_arg1 )
	f90_arg0:setAlpha( f90_arg0.highFlickerAlpha )
end

LUI.UIElement.EndFlickerAlternate = function ( f91_arg0, f91_arg1 )
	f91_arg0:beginAnimation( "end_alpha", f91_arg1 )
	f91_arg0:setAlpha( f91_arg0.endFlickerAlpha )
	f91_arg0.lowFlickerAlpha = nil
	f91_arg0.highFlickerAlpha = nil
	f91_arg0.endFlickerAlpha = nil
end

LUI.UIElement.CloseFlickerTimer = function ( f92_arg0, f92_arg1 )
	if f92_arg0.lowFlickerAlpha then
		f92_arg0:closeStateAlternator()
	end
end

LUI.UIElement.closeStateAlternator = function ( f93_arg0 )
	if f93_arg0.alternatorTimer then
		f93_arg0.alternatorTimer:close()
		f93_arg0.alternatorTimer = nil
	end
	if f93_arg0.alternatorEnd then
		f93_arg0:alternatorEnd()
		f93_arg0.alternatorEnd = nil
	end
end

LUI.UIElement.UpdateStateAlternater = function ( f94_arg0, f94_arg1 )
	if f94_arg1.next ~= "first" and f94_arg1.next ~= "second" then
		f94_arg0:closeStateAlternator()
		return 
	end
	local f94_local0 = "first"
	local f94_local1 = f94_arg1.func2
	if f94_arg1.next == "first" then
		f94_local0 = "second"
		f94_local1 = f94_arg1.func1
	end
	local f94_local2 = math.random( f94_arg1.lowTime, f94_arg1.highTime )
	if f94_arg1.timeLeft <= f94_local2 and not f94_arg1.isInfinite then
		f94_local2 = f94_arg1.timeLeft + 1
		f94_local0 = "final"
	end
	f94_local1( f94_arg0, f94_local2 )
	local f94_local3 = -1
	if not f94_arg1.isInfinite then
		f94_local3 = f94_arg1.timeLeft - f94_local2
	end
	f94_arg0.alternatorTimer = LUI.UITimer.new( f94_local2, {
		name = "update_state_alternate",
		isInfinite = f94_arg1.isInfinite,
		next = f94_local0,
		func1 = f94_arg1.func1,
		func2 = f94_arg1.func2,
		timeLeft = f94_local3,
		lowTime = f94_arg1.lowTime,
		highTime = f94_arg1.highTime
	}, true, f94_arg0 )
	f94_arg0:addElement( f94_arg0.alternatorTimer )
end

LUI.UIElement.alternateStates = function ( f95_arg0, f95_arg1, f95_arg2, f95_arg3, f95_arg4, f95_arg5, f95_arg6 )
	if f95_arg0.alternatorEnd then
		return 
	elseif not f95_arg1 then
		f95_arg1 = 1000
	end
	if f95_arg2 == nil or f95_arg3 == nil then
		return 
	elseif f95_arg6 == nil then
		f95_arg6 = f95_arg3
	end
	if not f95_arg4 then
		f95_arg4 = 50
	end
	if not f95_arg5 then
		f95_arg5 = 150
	end
	f95_arg0.alternatorEnd = f95_arg6
	f95_arg0:registerEventHandler( "update_state_alternate", LUI.UIElement.UpdateStateAlternater )
	f95_arg0:processEvent( {
		name = "update_state_alternate",
		isInfinite = f95_arg1 == 0,
		next = "first",
		func1 = f95_arg2,
		func2 = f95_arg3,
		timeLeft = f95_arg1,
		lowTime = f95_arg4,
		highTime = f95_arg5
	} )
end

LUI.UIElement.CloseAnimationQueue = function ( f96_arg0 )
	if f96_arg0.queueTimer then
		f96_arg0.queueTimer:close()
		f96_arg0.queueTimer = nil
	end
end

local f0_local1 = function ( f97_arg0, f97_arg1, f97_arg2 )
	if #f97_arg1 == 0 then
		return 0
	end
	local f97_local0 = f97_arg1[1].funct
	local f97_local1 = f97_arg1[1].time
	if f97_local1 == nil then
		f97_local1 = 0
	end
	if f97_local0 then
		f97_local0( f97_arg0, f97_local1, f97_arg1[1] )
	end
	if f97_arg2 then
		table.insert( f97_arg1, f97_arg1[1] )
	end
	table.remove( f97_arg1, 1 )
	return f97_local1
end

local f0_local2 = function ( f98_arg0 )
	if not f98_arg0.queueTimer then
		return 
	end
	local f98_local0 = nil
	if f98_arg0.queueTimer.timerEvent then
		f98_local0 = f98_arg0.queueTimer.timerEvent.queue
	end
	if f98_local0 then
		local f98_local1 = f98_local0[#f98_local0].funct
		if f98_local1 then
			f98_local1( f98_arg0, 0, f98_local0[#f98_local0] )
		end
	end
	f98_arg0.queueTimer:close()
	f98_arg0.queueTimer = nil
end

LUI.UIElement.QueueAnimation = function ( f99_arg0, f99_arg1 )
	if #f99_arg1.queue == 0 or not f99_arg0.queueTimer then
		LUI.UIElement.CloseAnimationQueue( f99_arg0 )
		return 
	else
		f99_arg0.queueTimer.interval = f0_local1( f99_arg0, f99_arg1.queue, f99_arg1.repeats )
	end
end

LUI.UIElement.animationQueue = function ( f100_arg0, f100_arg1, f100_arg2, f100_arg3 )
	if not f100_arg1 then
		return 
	elseif f100_arg0.queueTimer then
		f0_local2( f100_arg0 )
	end
	f100_arg0:registerEventHandler( "queue_animation", LUI.UIElement.QueueAnimation )
	local f100_local0 = f100_arg2 or 0
	if f100_local0 == 0 then
		f100_local0 = f0_local1( f100_arg0, f100_arg1, f100_arg3 )
	end
	if #f100_arg1 > 0 then
		f100_arg0.queueTimer = LUI.UITimer.new( f100_local0, {
			name = "queue_animation",
			repeats = f100_arg3,
			queue = f100_arg1
		}, false, f100_arg0 )
		f100_arg0:addElement( f100_arg0.queueTimer )
	end
end

LUI.UIElement.NextListAnimation = function ( f101_arg0, f101_arg1 )
	if f101_arg1._index == 1 and f101_arg0._queueTimer ~= nil then
		f101_arg0._queueTimer:close()
	end
	if f101_arg1.interrupted then
		f101_arg1._index = f101_arg1._lastIndex
	end
	if f101_arg1._index <= f101_arg1._lastIndex then
		local f101_local0 = f101_arg1._anims[f101_arg1._index]( f101_arg0, f101_arg1 )
		f101_arg1._index = f101_arg1._index + 1
		f101_arg0._queueTimer = LUI.UITimer.new( f101_local0, f101_arg1, true, f101_arg0 )
		f101_arg0:addElement( f101_arg0._queueTimer )
	else
		f101_arg0._queueTimer = nil
		f101_arg0:registerEventHandler( "anim_done", nil )
		local f101_local0 = f101_arg0:getParent()
		f101_local0:childClipFinished()
	end
end

LUI.UIElement.ViewportAnimation = function ( f102_arg0, f102_arg1 )
	if not f102_arg0.viewportScaleTime then
		f102_arg0.viewportScaleTime = f102_arg1.timeElapsed
	else
		f102_arg0.viewportScaleTime = f102_arg0.viewportScaleTime + f102_arg1.timeElapsed
	end
	local f102_local0 = f102_arg0.viewportScaleTime / f102_arg1.scaleDuration
	if f102_local0 > 1 then
		f102_local0 = 1
		f102_arg1.timer:close()
		f102_arg0.viewportScaleTime = nil
	end
	local f102_local1 = f102_arg1.startScale + (f102_arg1.endScale - f102_arg1.startScale) * f102_local0
	Engine.SetViewport( f102_arg1.controller, 0.1 - f102_local1 / 10, 0.5 - f102_local1 / 2, f102_local1 )
end

LUI.UIElement.animateViewport = function ( f103_arg0, f103_arg1, f103_arg2, f103_arg3, f103_arg4 )
	f103_arg0:addElement( LUI.UITimer.new( 1, {
		name = "viewport_animation",
		controller = f103_arg1,
		startScale = f103_arg2,
		endScale = f103_arg3,
		scaleDuration = f103_arg4
	}, false, f103_arg0 ) )
end

LUI.UIElement.animateToNextState = function ( f104_arg0, f104_arg1, f104_arg2, f104_arg3, f104_arg4 )
	return function ( f105_arg0, f105_arg1 )
		if not f105_arg1.interrupted then
			f105_arg0:animateToState( f104_arg1, f104_arg2, f104_arg3, f104_arg4 )
		end
	end
	
end

LUI.UIElement.CompleteAnimationEvent = function ( f106_arg0, f106_arg1 )
	f106_arg0:completeAnimation()
	f106_arg0:dispatchEventToChildren( f106_arg1 )
end

LUI.UIElement.UpdateSafeArea = function ( f107_arg0, f107_arg1, f107_arg2 )
	if f107_arg2 == nil and f107_arg1 ~= nil then
		f107_arg2 = f107_arg1.controller
	end
	local f107_local0, f107_local1, f107_local2, f107_local3 = Engine.GetUserSafeAreaForController( f107_arg2 )
	f107_arg0:setLeftRight( false, false, f107_local0, f107_local2 )
	f107_arg0:setTopBottom( false, false, f107_local1, f107_local3 )
end

LUI.UIElement.sizeToSafeArea = function ( f108_arg0, f108_arg1 )
	f108_arg0:UpdateSafeArea( nil, f108_arg1 )
	f108_arg0:registerEventHandler( "update_safe_area", f108_arg0.UpdateSafeArea )
end

LUI.UIElement.setState = function ( f109_arg0, f109_arg1 )
	if f109_arg0.currentState == f109_arg1 then
		return 
	end
	local f109_local0 = f109_arg0.currentState
	local f109_local1 = f109_arg0:hasClip( f109_arg1 )
	f109_arg0.currentState = f109_arg1
	local f109_local2 = "DefaultClip"
	if f109_arg0:isInFocus() and f109_arg0:hasClip( "Focus" ) then
		f109_local2 = "Focus"
	end
	if f109_local1 then
		f109_arg0.nextClip = f109_local2
		f109_arg0.clipsPerState[f109_local0][f109_arg1]()
	else
		f109_arg0:playClip( f109_local2 )
	end
end

LUI.UIElement.mergeStateConditions = function ( f110_arg0, f110_arg1, f110_arg2 )
	if not f110_arg2 then
		if not f110_arg0.stateConditions then
			f110_arg0.stateConditions = {}
		end
		f110_arg2 = f110_arg0.stateConditions
	end
	local f110_local0 = function ( f111_arg0 )
		for f111_local3, f111_local4 in ipairs( f110_arg2 ) do
			if f111_local4.stateName == f111_arg0 then
				return f111_local3
			end
		end
		return nil
	end
	
	for f110_local4, f110_local5 in ipairs( f110_arg1 ) do
		local f110_local6 = f110_local0( f110_local5.stateName )
		if f110_local6 == nil then
			table.insert( f110_arg2, LUI.ShallowCopy( f110_local5 ) )
		else
			f110_arg2[f110_local6] = LUI.ShallowCopy( f110_local5 )
		end
	end
end

LUI.UIElement.clipOver = function ( f112_arg0, f112_arg1 )
	if f112_arg0.nextClip then
		f112_arg0:playClip( f112_arg0.nextClip )
	end
end

LUI.UIElement.playClip = function ( f113_arg0, f113_arg1 )
	f113_arg0.nextClip = nil
	if not f113_arg0.currentState then
		f113_arg0.currentState = "DefaultState"
	end
	if f113_arg0.clipsPerState and f113_arg0.clipsPerState[f113_arg0.currentState] and f113_arg0.clipsPerState[f113_arg0.currentState][f113_arg1] then
		f113_arg0.clipsPerState[f113_arg0.currentState][f113_arg1]()
		return true
	else
		return false
	end
end

LUI.UIElement.hasClip = function ( f114_arg0, f114_arg1 )
	if f114_arg0.clipsPerState and f114_arg0.clipsPerState[f114_arg0.currentState] and f114_arg0.clipsPerState[f114_arg0.currentState][f114_arg1] then
		return true
	else
		return false
	end
end

LUI.UIElement.setupElementClipCounter = function ( f115_arg0, f115_arg1 )
	f115_arg0.elementsPlayingClips = f115_arg1
	if f115_arg0.elementsPlayingClips == 0 then
		f115_arg0:processEvent( {
			name = "clip_over"
		} )
	end
end

LUI.UIElement.childClipFinished = function ( f116_arg0 )
	f116_arg0.elementsPlayingClips = f116_arg0.elementsPlayingClips - 1
	if f116_arg0.elementsPlayingClips == 0 then
		f116_arg0:processEvent( {
			name = "clip_over"
		} )
	end
end

LUI.UIElement.clipFinished = function ( f117_arg0, f117_arg1 )
	if not f117_arg1.interrupted and f117_arg0:getParent() ~= nil then
		local f117_local0 = f117_arg0:getParent()
		f117_local0:childClipFinished()
	end
end

LUI.UIElement.updateState = function ( f118_arg0, f118_arg1 )
	local f118_local0 = f118_arg1.menu or f118_arg0
	while f118_local0 do
		if f118_local0.updateElementState then
			f118_arg1.menu = f118_local0
			f118_local0:updateElementState( f118_arg0, f118_arg1 )
			if f118_arg0.anyChildUsesUpdateState then
				f118_arg0:dispatchEventToChildren( f118_arg1 )
			end
			return 
		end
		f118_local0 = f118_local0:getParent()
	end
end

LUI.UIElement.RecordCurrFocusedElemID = function ( f119_arg0, f119_arg1 )
	if not f119_arg1.idStack then
		error( "LUI Error: " .. f119_arg1.name .. " processed without event.idStack " )
	end
	table.insert( f119_arg1.idStack, 1, f119_arg0.id )
	return f119_arg0:dispatchEventToParent( f119_arg1 )
end

LUI.UIElement.setFontBasedOnSize = function ( f120_arg0, f120_arg1 )
	if CoD.GetFontBasedOnSize then
		f120_arg0:setFont( CoD.GetFontBasedOnSize( f120_arg1 ) )
	end
end

LUI.UIElement.playBitchinFX = function ( f121_arg0, f121_arg1, f121_arg2, f121_arg3 )
	f121_arg0:setShaderVector( 0, 0, 0, 0, 0 )
	f121_arg0:beginAnimation( "bitchin", f121_arg1, f121_arg2, f121_arg3 )
	f121_arg0:setShaderVector( 0, 1, 0, 0, 0 )
end

LUI.UIElement.playBitchinFXReverse = function ( f122_arg0, f122_arg1, f122_arg2, f122_arg3 )
	f122_arg0:setShaderVector( 0, 1, 0, 0, 0 )
	f122_arg0:beginAnimation( "bitchin", f122_arg1, f122_arg2, f122_arg3 )
	f122_arg0:setShaderVector( 0, 0, 0, 0, 0 )
end

LUI.UIElement.setClass = function ( f123_arg0, f123_arg1 )
	local f123_local0 = getmetatable( f123_arg0 )
	local f123_local1 = f123_local0.__newindex
	local f123_local2 = getmetatable( f123_local1 )
	if not f123_local2 then
		setmetatable( f123_local1, {
			__index = f123_arg1
		} )
	else
		f123_local2.__index = f123_arg1
	end
	local f123_local3 = getmetatable( f123_local1.m_eventHandlers )
	if not f123_local3 then
		setmetatable( f123_local1.m_eventHandlers, {
			__index = f123_arg1.m_eventHandlers
		} )
	else
		f123_local3.__index = f123_arg1.m_eventHandlers
	end
end

LUI.UIElement.getParentMenu = function ( f124_arg0 )
	local f124_local0 = f124_arg0
	while not f124_local0.menuName do
		f124_local0 = f124_local0:getParent()
	end
	return f124_local0
end

LUI.UIElement.m_eventHandlers = {
	complete_animation = LUI.UIElement.CompleteAnimationEvent,
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
	animate = LUI.UIElement.animate,
	viewport_animation = LUI.UIElement.ViewportAnimation,
	clip_over = LUI.UIElement.clipOver,
	update_state = LUI.UIElement.updateState,
	record_curr_focused_elem_id = LUI.UIElement.RecordCurrFocusedElemID
}
LUI.UIElement.new = function ( f125_arg0 )
	local f125_local0 = ConstructLUIElement()
	LUI.UIElement.setClass( f125_local0, LUI.UIElement )
	f125_local0:setLayoutCached( false )
	f125_local0.anyChildUsesUpdateState = false
	if not f125_arg0 then
		f125_local0:registerAnimationState( "default", LUI.UIElement.m_defaultAnimationState )
	else
		f125_local0:registerAnimationState( "default", f125_arg0 )
	end
	f125_local0:animateToState( "default" )
	return f125_local0
end

LUI.UIElement.showDebugTimer = function ( f126_arg0, f126_arg1 )
	local f126_local0 = f126_arg0.playClip
	f126_arg0.playClip = function ( f127_arg0, f127_arg1 )
		f126_local0( f127_arg0, f127_arg1 )
		if f127_arg0.elementsPlayingClips ~= nil and f127_arg0.elementsPlayingClips > 0 then
			f127_arg0._debugTimerIndex = Engine.SetDebugTimerInfo( f127_arg0.id .. ":" .. f127_arg0.currentState .. ":" .. f127_arg1, f127_arg0._debugTimerIndex )
		end
	end
	
	f126_arg0:registerEventHandler( "clip_over", function ( element, event )
		if element._debugTimerIndex ~= nil then
			Engine.SetDebugTimerInfo( "", element._debugTimerIndex )
			element._debugTimerIndex = nil
		end
		LUI.UIElement.clipOver( element, event )
	end )
	local f126_local1 = f126_arg0.close
	f126_arg0.close = function ( f129_arg0 )
		f126_local1( f129_arg0 )
		if f129_arg0._debugTimerIndex ~= nil then
			Engine.SetDebugTimerInfo( "", f129_arg0._debugTimerIndex )
			f129_arg0._debugTimerIndex = nil
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

