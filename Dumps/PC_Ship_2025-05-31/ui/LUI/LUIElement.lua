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
	local f10_local1 = nil
	if f10_local0 and f10_arg1.modelPath then
		f10_local1 = Engine.GetModel( f10_local0, f10_arg1.modelPath )
	else
		f10_local1 = f10_local0
	end
	if f10_arg1.requiresSubscription then
		if f10_local1 then
			f10_arg1.subscription = f10_arg0:subscribeToModel( f10_local1, f10_arg1.updateFn )
		end
	else
		f10_arg1.updateFn( f10_local1 )
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
	if f19_arg0 == LUI.currentNavFocus then
		LUI.currentNavFocus = nil
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

LUI.UIElement.setPlaySoundDirect = function ( f25_arg0, f25_arg1 )
	f25_arg0.playSoundDirect = f25_arg1
end

LUI.UIElement.playSound = function ( f26_arg0, f26_arg1, f26_arg2 )
	if not f26_arg0.playSoundDirect then
		local f26_local0 = f26_arg0:findSoundAlias( f26_arg1 )
		if f26_local0 then
			if f26_arg2 ~= nil then
				Engine.PlaySound( f26_local0, f26_arg2 )
			else
				Engine.PlaySound( f26_local0 )
			end
			return true
		end
	elseif f26_arg2 ~= nil then
		Engine.PlaySound( f26_arg1, f26_arg2 )
	else
		Engine.PlaySound( f26_arg1 )
	end
end

LUI.UIElement.playActionSFX = function ( f27_arg0 )
	f27_arg0:playSound( "action" )
end

LUI.UIElement.getLocalSize = function ( f28_arg0 )
	local f28_local0, f28_local1, f28_local2, f28_local3 = nil
	if f28_arg0.getNextRect then
		f28_local0, f28_local1, f28_local2, f28_local3 = f28_arg0:getNextRect()
	else
		f28_local0, f28_local1, f28_local2, f28_local3 = f28_arg0:getLocalRect()
	end
	return f28_local2 - f28_local0, f28_local3 - f28_local1
end

LUI.UIElement.setMouseDisabled = function ( f29_arg0, f29_arg1 )
	f29_arg0.m_mouseDisabled = f29_arg1
	f29_arg0.handleMouseMove = not f29_arg1
	f29_arg0.handleMouseButton = not f29_arg1
end

LUI.UIElement.toggleMouse = function ( f30_arg0 )
	f30_arg0.m_mouseDisabled = not f30_arg0.m_mouseDisabled
end

LUI.UIElement.setHandleMouse = function ( f31_arg0, f31_arg1 )
	f31_arg0.handleMouseMove = f31_arg1
	f31_arg0.handleMouseButton = f31_arg1
end

LUI.UIElement.toggleHandleMouse = function ( f32_arg0 )
	f32_arg0.handleMouseMove = not f32_arg0.handleMouseMove
	f32_arg0.handleMouseButton = not f32_arg0.handleMouseButton
end

LUI.UIElement.setHandleMouseMove = function ( f33_arg0, f33_arg1 )
	f33_arg0.handleMouseMove = f33_arg1
end

LUI.UIElement.toggleHandleMouseMove = function ( f34_arg0 )
	f34_arg0.handleMouseMove = not f34_arg0.handleMouseMove
end

LUI.UIElement.setHandleMouseButton = function ( f35_arg0, f35_arg1 )
	f35_arg0.handleMouseButton = f35_arg1
end

LUI.UIElement.toggleHandleMouseButton = function ( f36_arg0 )
	f36_arg0.handleMouseButton = f36_arg0.handleMouseButton
end

LUI.UIElement.setForceMouseEventDispatch = function ( f37_arg0, f37_arg1 )
	f37_arg0.m_forceMouseEventDispatch = f37_arg1
end

LUI.UIElement.clearMouseFocus = function ( f38_arg0 )
	local f38_local0 = LUI.currentMouseFocus
	if f38_local0 then
		LUI.currentMouseFocus = nil
		f38_local0.m_mouseOver = nil
	end
end

local f0_local0 = LUI.UIElement
f0_local0.IsMouseInsideElement = function ( f39_arg0, f39_arg1 )
	local f39_local0, f39_local1 = ProjectRootCoordinate( f39_arg1.rootName, f39_arg1.x, f39_arg1.y )
	if f39_local0 == nil or f39_local1 == nil then
		return false
	end
	local f39_local2 = Engine.IsMouseInsideElement( f39_arg0, f39_arg1.rootName, f39_local0, f39_local1 )
	if f39_local2 ~= nil then
		return f39_local2, f39_local0, f39_local1
	end
	local f39_local3, f39_local4, f39_local5, f39_local6 = f39_arg0:getRect()
	local f39_local7
	if f39_local3 == nil or f39_local4 > f39_local1 or f39_local1 > f39_local6 or f39_local3 > f39_local0 or f39_local0 > f39_local5 then
		f39_local7 = false
	else
		f39_local7 = true
	end
	return f39_local7, f39_local0, f39_local1
end

f0_local0 = function ( f40_arg0, f40_arg1 )
	if f40_arg0 and not f40_arg0.m_keepFocusAsParent and f40_arg0 ~= LUI.currentMouseFocus and f40_arg0 ~= LUI.currentNavFocus and not LUI.UIElement.IsMouseInsideElement( f40_arg0, f40_arg1 ) then
		if f40_arg0:isInFocus() or f40_arg0.hasListFocus or f40_arg0.hasFrameFocus then
			f40_arg0:processEvent( {
				name = "lose_focus",
				controller = f40_arg1.controller,
				isMouse = true,
				ignoreFocusCheck = true
			} )
		end
		f40_arg0.m_mouseOver = nil
		f0_local0( f40_arg0:getParent(), f40_arg1 )
	end
end

local f0_local1 = function ( f41_arg0, f41_arg1 )
	if not (f41_arg0:hasClip( "Focus" ) or f41_arg0:hasClip( "Active" )) or f41_arg0.m_skipMouseFocus then
		return 
	end
	local f41_local0 = LUI.currentMouseFocus
	if not f41_local0 then
		f41_local0 = LUI.currentNavFocus
	end
	local f41_local1 = false
	if f41_arg0 ~= LUI.currentMouseFocus and f41_arg0:processEvent( {
		name = "gain_focus",
		controller = f41_arg1.controller,
		isMouse = true
	} ) then
		f0_local0( f41_local0, f41_arg1 )
		if not f41_arg0.gridInfoTable then
			f41_arg0:playSound( "gain_focus" )
		end
		f41_arg0:dispatchEventToParent( {
			name = "mouse_focus",
			element = f41_arg0,
			controller = f41_arg1.controller
		} )
	end
end

LUI.UIElement.MouseMoveEvent = function ( f42_arg0, f42_arg1 )
	if not (not f42_arg0.disabled or f42_arg0.disabledAllowNav) or f42_arg0.m_inputDisabled or f42_arg0.m_mouseDisabled or not f42_arg0:isVisible() then
		return 
	elseif f42_arg0.handleMouseMove and not f42_arg1.waitingForKeyBind then
		local f42_local0, f42_local1, f42_local2 = LUI.UIElement.IsMouseInsideElement( f42_arg0, f42_arg1 )
		if f42_local0 and LUI.currentMouseFocus ~= nil and f42_arg0 ~= LUI.currentMouseFocus and f42_arg0.m_focusable and not f42_arg0.m_preventFromBeingCurrentMouseFocus and Engine.IsMouseInsideElement( LUI.currentMouseFocus, f42_arg1.rootName, f42_local1, f42_local2 ) then
			return 
		elseif f42_local0 then
			if f42_arg0.m_mouseOver == nil or f42_arg0 ~= LUI.currentMouseFocus then
				if not f42_arg0:isInFocus() then
					if f42_arg0.m_mouseOver == nil and f42_arg0:hasClip( "Over" ) then
						f42_arg0.m_mouseOver = true
						f42_arg0:processEvent( {
							name = "mouseenter",
							controller = f42_arg1.controller,
							isMouse = true
						} )
					elseif f42_arg0.m_focusable and not f42_arg0.m_preventFromBeingCurrentMouseFocus and not f42_arg0:hasClip( "Over" ) then
						f0_local1( f42_arg0, f42_arg1 )
					end
				elseif f42_arg0.m_focusable and f42_arg0 ~= LUI.currentMouseFocus and not f42_arg0.m_preventFromBeingCurrentMouseFocus then
					DebugPrint( "^1LUI_MOUSE: ^2inside element that is not the currentMouseFocus -- " .. f42_arg0.id )
					LUI.currentMouseFocus = f42_arg0
				end
			elseif not LUI.currentMouseFocus and f42_arg0.m_focusable and not f42_arg0.m_preventFromBeingCurrentMouseFocus then
				DebugPrint( "^1LUI_MOUSE: ^2setting currentMouseFocus -- " .. f42_arg0.id )
				LUI.currentMouseFocus = f42_arg0
			end
		else
			if f42_arg0.m_mouseOver ~= nil then
				f42_arg0.m_mouseOver = nil
				f42_arg0:processEvent( {
					name = "mouseleave",
					controller = f42_arg1.controller,
					isMouse = true
				} )
			end
			if f42_arg0 ~= LUI.currentMouseFocus and not f42_arg0.m_preventFromBeingCurrentMouseFocus and f42_arg0 ~= LUI.currentNavFocus and f42_arg0:isInFocus() then
				f42_arg0:processEvent( {
					name = "lose_focus",
					controller = f42_arg1.controller,
					isMouse = true
				} )
			end
		end
		if f42_arg0.m_eventHandlers.mousedrag ~= nil and f42_arg0.m_leftMouseDown ~= nil then
			f42_arg0.m_eventHandlers:mousedrag( {
				name = "mousedrag",
				controller = f42_arg1.controller,
				root = f42_arg1.root,
				x = f42_local1,
				y = f42_local2
			} )
		end
	end
	if f42_arg0.m_forceMouseEventDispatch or LUI.UIElement.IsMouseInsideElement( f42_arg0, f42_arg1 ) then
		f42_arg0:dispatchEventToChildren( f42_arg1 )
	end
end

LUI.UIElement.mouseEnter = function ( f43_arg0, f43_arg1 )
	local f43_local0 = false
	if not f43_arg0.m_active then
		if f43_arg0:playClip( "GainOver" ) then
			f43_arg0.nextClip = "Over"
			f43_local0 = true
		else
			f43_local0 = f43_arg0:playClip( "Over" )
		end
	end
	return f43_local0
end

LUI.UIElement.mouseLeave = function ( f44_arg0, f44_arg1 )
	if not f44_arg0:isInFocus() and not f44_arg0.m_active then
		if f44_arg0:playClip( "LoseOver" ) then
			f44_arg0.nextClip = "DefaultClip"
		else
			f44_arg0:playClip( "DefaultClip" )
		end
	end
end

LUI.UIElement.LeftMouseDown = function ( f45_arg0, f45_arg1 )
	f45_arg0:processEvent( {
		name = "button_over_down",
		controller = f45_arg1.controller
	} )
end

LUI.UIElement.RightMouseDown = function ( f46_arg0, f46_arg1 )
	f46_arg0:processEvent( {
		name = "button_over_down",
		controller = f46_arg1.controller
	} )
end

LUI.UIElement.LeftMouseUp = function ( f47_arg0, f47_arg1 )
	if f47_arg1.inside and (not f47_arg0.disabled or f47_arg0.disabledAllowNav) then
		if f47_arg0.m_eventHandlers.button_action then
			return f47_arg0:processEvent( {
				name = "button_action",
				controller = f47_arg1.controller,
				isMouse = true
			} )
		else
			return f47_arg0:dispatchEventToParent( {
				name = "mouse_left_click",
				element = f47_arg0,
				controller = f47_arg1.controller,
				inside = f47_arg1.inside
			} )
		end
	else
		
	end
end

LUI.UIElement.RightMouseUp = function ( f48_arg0, f48_arg1 )
	if f48_arg1.inside then
		if not f48_arg0.disabled then
			local f48_local0 = f48_arg0:processEvent( {
				name = "button_actionsecondary",
				controller = f48_arg1.controller,
				isMouse = true
			} )
			if f48_local0 then
				return f48_local0
			end
		end
	else
		f48_arg0:processEvent( {
			name = "button_up"
		} )
	end
end

LUI.UIElement.MouseButtonEvent = function ( f49_arg0, f49_arg1 )
	if not (not f49_arg0.disabled or f49_arg0.disabledAllowNav) or f49_arg0.m_inputDisabled or f49_arg0.m_mouseDisabled or not f49_arg0:isVisible() then
		return 
	elseif f49_arg0.handleMouseButton then
		local f49_local0, f49_local1, f49_local2 = LUI.UIElement.IsMouseInsideElement( f49_arg0, f49_arg1 )
		if f49_arg1.name == "mouseup" then
			if f49_arg1.button == "left" then
				if f49_arg0.m_leftMouseDown ~= nil then
					f49_arg0.m_leftMouseDown = nil
					if f49_arg0.m_focusable and f49_arg0:hasClip( "Over" ) then
						if not f49_arg0:isInFocus() then
							f0_local1( f49_arg0, f49_arg1 )
						elseif f49_arg0.m_eventHandlers.leftmouseup ~= nil then
							local f49_local3 = f49_arg0.m_eventHandlers:leftmouseup( {
								name = "leftmouseup",
								controller = f49_arg1.controller,
								root = f49_arg1.root,
								x = f49_local1,
								y = f49_local2,
								inside = f49_local0
							} )
							if f49_local3 then
								return f49_local3
							end
						end
					elseif f49_arg0.m_eventHandlers.leftmouseup ~= nil then
						local f49_local3 = f49_arg0.m_eventHandlers:leftmouseup( {
							name = "leftmouseup",
							controller = f49_arg1.controller,
							root = f49_arg1.root,
							x = f49_local1,
							y = f49_local2,
							inside = f49_local0
						} )
						if f49_local3 then
							return f49_local3
						end
					end
				end
				if not f49_local0 and f49_arg0.m_eventHandlers.leftclick_outside ~= nil then
					local f49_local3 = f49_arg0.m_eventHandlers:leftclick_outside( {
						name = "leftclick_outside",
						controller = f49_arg1.controller,
						root = f49_arg1.root,
						x = f49_local1,
						y = f49_local2,
						inside = f49_local0
					} )
					if f49_local3 then
						return f49_local3
					end
				end
			end
			if f49_arg1.button == "right" and f49_arg0.m_rightMouseDown ~= nil then
				f49_arg0.m_rightMouseDown = nil
				if f49_arg0.m_eventHandlers.rightmouseup ~= nil then
					local f49_local3 = f49_arg0.m_eventHandlers:rightmouseup( {
						name = "rightmouseup",
						controller = f49_arg1.controller,
						root = f49_arg1.root,
						x = f49_local1,
						y = f49_local2,
						inside = f49_local0
					} )
					if f49_local3 then
						return f49_local3
					end
				end
			end
		end
		if f49_local0 and f49_arg1.name == "mousedown" then
			if f49_arg1.button == "left" and f49_arg0.m_eventHandlers.leftmousedown ~= nil and f49_arg0.m_leftMouseDown == nil then
				f49_arg0.m_leftMouseDown = true
				f49_arg0.m_eventHandlers:leftmousedown( {
					name = "leftmousedown",
					controller = f49_arg1.controller,
					root = f49_arg1.root,
					x = f49_local1,
					y = f49_local2,
					inside = f49_local0
				} )
			end
			if f49_arg1.button == "right" and f49_arg0.m_eventHandlers.rightmousedown ~= nil and f49_arg0.m_rightMouseDown == nil then
				f49_arg0.m_rightMouseDown = true
				f49_arg0.m_eventHandlers:rightmousedown( {
					name = "rightmousedown",
					controller = f49_arg1.controller,
					root = f49_arg1.root,
					x = f49_local1,
					y = f49_local2,
					inside = f49_local0
				} )
			end
		end
	end
	if f49_arg0.m_forceMouseEventDispatch or LUI.UIElement.IsMouseInsideElement( f49_arg0, f49_arg1 ) then
		f49_arg0:dispatchEventToChildren( f49_arg1 )
	end
end

LUI.UIElement.AcceptGamePadButtonInput = function ( f50_arg0, f50_arg1 )
	if f50_arg0.m_inputDisabled or f50_arg0.occludedBy then
		return false
	elseif not f50_arg0.m_ownerController or f50_arg0.m_ownerController == f50_arg1.controller or f50_arg0.anyControllerAllowed or Engine.IsControllerBeingUsed( f50_arg1.controller ) then
		return true
	elseif f50_arg0.m_ownerController and f50_arg0.m_ownerController ~= f50_arg1.controller then
		local f50_local0 = f50_arg1.name
		f50_arg1.name = "unused_gamepad_button"
		f50_arg0:processEvent( f50_arg1 )
		f50_arg0:dispatchEventToChildren( f50_arg1 )
		f50_arg1.name = f50_local0
	end
end

LUI.UIElement.AcceptGamePadButtonInputFromModelCallback = function ( f51_arg0, f51_arg1 )
	if f51_arg0.m_inputDisabled or f51_arg0.occludedBy then
		return false
	elseif not f51_arg0.m_ownerController or f51_arg0.m_ownerController == f51_arg1 or f51_arg0.anyControllerAllowed or Engine.IsControllerBeingUsed( f51_arg1 ) then
		return true
	else
		return false
	end
end

LUI.UIElement.DoNavigationForGamePadButton = function ( f52_arg0, f52_arg1 )
	return f52_arg0:handleGamepadButton( f52_arg1 )
end

LUI.UIElement.GamepadButton = function ( f53_arg0, f53_arg1 )
	if f53_arg0.m_inputDisabled then
		return 
	elseif not f53_arg0:handleGamepadButton( f53_arg1 ) then
		if f53_arg0.m_ownerController == nil or f53_arg0.m_ownerController == f53_arg1.controller then
			return f53_arg0:dispatchEventToChildren( f53_arg1 )
		else
			
		end
	else
		return true
	end
end

LUI.UIElement.GamepadButton_DPadOnly = function ( f54_arg0, f54_arg1 )
	if f54_arg1.qualifier ~= "dpad" then
		return 
	else
		LUI.UIElement.GamepadButton( f54_arg0, f54_arg1 )
	end
end

LUI.UIElement.doNavigationForElement = function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
	local f55_local0 = {}
	while f55_arg2 and not f55_local0[f55_arg2] and f55_arg2 ~= f55_arg0 do
		if type( f55_arg2 ) == "table" then
			for f55_local4, f55_local5 in ipairs( f55_arg2 ) do
				if f55_arg0:doNavigationForElement( f55_arg1, f55_local5, f55_arg3 ) then
					return true
				end
			end
			return false
		elseif f55_arg2:processEvent( {
			name = "gain_focus",
			controller = f55_arg1.controller,
			button = f55_arg1.button
		} ) then
			if f55_arg3 then
				f55_arg3:processEvent( {
					name = "lose_focus",
					controller = f55_arg1.controller,
					button = f55_arg1.button,
					ignoreFocusCheck = true
				} )
			else
				f55_arg0:processEvent( {
					name = "lose_focus",
					controller = f55_arg1.controller,
					button = f55_arg1.button,
					ignoreFocusCheck = true
				} )
			end
			if not f55_arg2:playSound( "gain_focus" ) and f55_arg2.gainFocusSFX then
				Engine.PlaySound( f55_arg2.gainFocusSFX )
			end
			return true
		end
		f55_local0[f55_arg2] = true
		f55_arg2 = f55_arg2.navigation[f55_arg1.button]
	end
end

LUI.UIElement.doNavigationForElementFromModelCallback = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3, f56_arg4 )
	local f56_local0 = {}
	while f56_arg3 and not f56_local0[f56_arg3] and f56_arg3 ~= f56_arg0 do
		if type( f56_arg3 ) == "table" then
			for f56_local4, f56_local5 in ipairs( f56_arg3 ) do
				if f56_arg0:doNavigationForElementFromModelCallback( f56_arg1, f56_arg2, f56_local5, f56_arg4 ) then
					return true
				end
			end
			return false
		elseif f56_arg3:processEvent( {
			name = "gain_focus",
			controller = f56_arg1,
			button = f56_arg2
		} ) then
			if f56_arg4 then
				f56_arg4:processEvent( {
					name = "lose_focus",
					controller = f56_arg1,
					button = f56_arg2,
					ignoreFocusCheck = true
				} )
			else
				f56_arg0:processEvent( {
					name = "lose_focus",
					controller = f56_arg1,
					button = f56_arg2,
					ignoreFocusCheck = true
				} )
			end
			if not f56_arg3:playSound( "gain_focus" ) and f56_arg3.gainFocusSFX then
				Engine.PlaySound( f56_arg3.gainFocusSFX )
			end
			return true
		end
		f56_local0[f56_arg3] = true
		f56_arg3 = f56_arg3.navigation[f56_arg2]
	end
end

LUI.UIElement.GetCorrespondingGamepadButtonForKey = function ( f57_arg0 )
	if f57_arg0 == "DOWNARROW" or f57_arg0 == "MWHEELDOWN" then
		return "down"
	elseif f57_arg0 == "UPARROW" or f57_arg0 == "MWHEELUP" then
		return "up"
	elseif f57_arg0 == "RIGHTARROW" then
		return "right"
	elseif f57_arg0 == "LEFTARROW" then
		return "left"
	elseif f57_arg0 == "ENTER" then
		return "primary"
	else
		return nil
	end
end

LUI.UIElement.GetCorrespondingGamepadButtonString = function ( f58_arg0 )
	if f58_arg0 == Enum.LUIButton.LUI_KEY_DOWN then
		return "down"
	elseif f58_arg0 == Enum.LUIButton.LUI_KEY_UP then
		return "up"
	elseif f58_arg0 == Enum.LUIButton.LUI_KEY_LEFT then
		return "left"
	elseif f58_arg0 == Enum.LUIButton.LUI_KEY_RIGHT then
		return "right"
	else
		return nil
	end
end

LUI.UIElement.handleGamepadButton = function ( f59_arg0, f59_arg1, f59_arg2 )
	if f59_arg1.simulated or f59_arg0.forceChildNavigation then
		return 
	elseif (f59_arg0:isInFocus() or f59_arg0.navigation and f59_arg2) and f59_arg1.down == true then
		local f59_local0 = f59_arg1.button
		if f59_local0 == "key_shortcut" then
			f59_local0 = LUI.UIElement.GetCorrespondingGamepadButtonForKey( f59_arg1.key )
			if f59_local0 then
				f59_arg1.button = f59_local0
			end
		end
		if f59_local0 ~= nil and f59_arg0.m_disableNavigation ~= true then
			if f59_arg0.navigationSounds and f59_arg0.navigationSounds[f59_local0] then
				Engine.PlaySound( f59_arg0.navigationSounds[f59_local0] )
			end
			local f59_local1 = f59_arg0.navigation[f59_local0]
			if f59_local1 ~= nil then
				if type( f59_local1 ) == "function" then
					f59_local1 = f59_local1( f59_arg0, f59_arg1.controller )
					if f59_local1 == true then
						return true
					end
				end
				if type( f59_local1 ) == "table" then
					local f59_local2 = f59_local1
					local f59_local3 = nil
					f59_local1 = f59_local2[1]
					for f59_local7, f59_local8 in ipairs( f59_local2 ) do
						local f59_local9 = f59_local8.lastFocusedTimestamp
						if f59_local9 and (not f59_local3 or f59_local3 < f59_local9) then
							f59_local1 = f59_local8
							f59_local3 = f59_local9
						end
					end
				end
				if f59_arg0:doNavigationForElement( f59_arg1, f59_local1, f59_arg2 ) then
					return true
				end
			end
			if f59_local0 == "primary" and not f59_arg0.disabled then
				f59_arg0:processEvent( {
					name = "button_action",
					controller = f59_arg1.controller
				} )
				return true
			end
		end
		if not f59_arg2 then
			f59_arg2 = f59_arg0
		end
		local f59_local1 = f59_arg0:getParent()
		if f59_local1 then
			return f59_local1:handleGamepadButton( f59_arg1, f59_arg2 )
		end
	elseif f59_arg0.navigation and f59_arg2 and f59_arg1.down == true then
		local f59_local0 = f59_arg0:getParent()
		if f59_local0 then
			return f59_local0:handleGamepadButton( f59_arg1, f59_arg2 )
		end
	end
end

LUI.UIElement.setActive = function ( f60_arg0, f60_arg1 )
	if f60_arg0.m_preventFromBeingActive then
		return 
	elseif f60_arg0:playClip( "GainActive" ) then
		f60_arg0.nextClip = "Active"
	else
		f60_arg0:playClip( "Active" )
	end
	f60_arg0.m_active = true
	f60_arg0:dispatchEventToChildren( f60_arg1 )
end

LUI.UIElement.setInactive = function ( f61_arg0, f61_arg1 )
	if f61_arg0.m_preventFromBeingActive and not f61_arg0.m_active then
		return 
	elseif f61_arg0:playClip( "LoseActive" ) then
		f61_arg0.nextClip = "DefaultClip"
	else
		f61_arg0:playClip( "DefaultClip" )
	end
	f61_arg0.m_active = nil
	f61_arg0:dispatchEventToChildren( f61_arg1 )
end

LUI.UIElement.gainFocus = function ( f62_arg0, f62_arg1 )
	local f62_local0 = false
	if f62_arg0.m_focusable and not f62_arg0.onlyChildrenFocusable then
		f62_arg0:setFocus( true )
		f62_arg0.lastFocusedTimestamp = Engine.milliseconds()
		if not f62_arg0.m_preventFromBeingCurrentNavFocus then
			LUI.currentNavFocus = f62_arg0
		end
		if not f62_arg0.m_preventFromBeingCurrentMouseFocus then
			LUI.currentMouseFocus = f62_arg0
		end
		if not f62_arg1.skipGainFocus and f62_arg0:playClip( "GainFocus" ) then
			f62_arg0.nextClip = "Focus"
			f62_local0 = true
		else
			f62_local0 = f62_arg0:playClip( "Focus" )
		end
		if not f62_arg0.clipsPerState then
			f62_local0 = true
		end
		if f62_local0 then
			f62_arg0:dispatchEventToParent( {
				name = "record_curr_focused_elem_id",
				id = f62_arg0.id,
				controller = f62_arg1.controller,
				idStack = {
					f62_arg0.id
				},
				isMouse = f62_arg1.isMouse
			} )
		end
	elseif not f62_arg0.m_focusable then
		return false
	end
	if f62_local0 then
		return true
	end
	return f62_arg0:dispatchEventToChildren( f62_arg1 )
end

LUI.UIElement.loseFocus = function ( f63_arg0, f63_arg1 )
	if f63_arg0.m_focusable and (f63_arg0:isInFocus() or f63_arg1.ignoreFocusCheck) then
		f63_arg0:setFocus( false )
		if f63_arg0 == LUI.currentMouseFocus then
			LUI.currentMouseFocus = nil
		end
		if f63_arg0 == LUI.currentNavFocus then
			LUI.currentNavFocus = nil
		end
		if not f63_arg1.keepSelected or not f63_arg0:playClip( "Selected" ) then
			if not f63_arg1.skipLoseFocus and f63_arg0:playClip( "LoseFocus" ) then
				f63_arg0.nextClip = "DefaultClip"
			else
				f63_arg0:playClip( "DefaultClip" )
			end
		end
	end
	f63_arg0:dispatchEventToChildren( f63_arg1 )
end

LUI.UIElement.processEvent = function ( f64_arg0, f64_arg1 )
	local f64_local0 = f64_arg0.m_eventHandlers[f64_arg1.name]
	if f64_local0 ~= nil then
		return f64_local0( f64_arg0, f64_arg1 )
	else
		return f64_arg0:dispatchEventToChildren( f64_arg1 )
	end
end

LUI.UIElement.processEventToParent = function ( f65_arg0, f65_arg1 )
	local f65_local0 = f65_arg0.m_eventHandlers[f65_arg1.name]
	if f65_local0 ~= nil then
		return f65_local0( f65_arg0, f65_arg1 )
	else
		return f65_arg0:dispatchEventToParent( f65_arg1 )
	end
end

LUI.UIElement.getRoot = function ( f66_arg0 )
	if not f66_arg0 then
		return 
	end
	local f66_local0 = f66_arg0:getParent()
	while f66_local0 do
		f66_arg0 = f66_local0
		f66_local0 = f66_local0:getParent()
	end
	return f66_arg0
end

LUI.UIElement.dispatchEventToRoot = function ( f67_arg0, f67_arg1 )
	local f67_local0 = f67_arg0:getParent()
	while f67_local0 do
		local f67_local1 = f67_local0:getParent()
		if f67_local1 == nil then
			local f67_local2 = f67_local0.m_eventHandlers[f67_arg1.name]
			if f67_local2 ~= nil then
				f67_local2( f67_local0, f67_arg1 )
			end
			f67_local0:dispatchEventToChildren( f67_arg1 )
			return 
		end
		f67_local0 = f67_local1
	end
end

LUI.UIElement.dispatchEventToParent = function ( f68_arg0, f68_arg1 )
	local f68_local0 = f68_arg0:getParent()
	while f68_local0 do
		local f68_local1 = f68_local0.m_eventHandlers[f68_arg1.name]
		if f68_local1 then
			return f68_local1( f68_local0, f68_arg1 )
		end
		f68_local0 = f68_local0:getParent()
	end
end

LUI.UIElement.dispatchEventToParentWithSelf = function ( f69_arg0, f69_arg1 )
	local f69_local0 = f69_arg0:getParent()
	while f69_local0 do
		local f69_local1 = f69_local0.m_eventHandlers[f69_arg1.name]
		if f69_local1 then
			return f69_local1( f69_arg0, f69_arg1 )
		end
		f69_local0 = f69_local0:getParent()
	end
end

LUI.UIElement.dispatchEventToParentWithElement = function ( f70_arg0, f70_arg1, f70_arg2 )
	local f70_local0 = f70_arg0
	while f70_local0 do
		local f70_local1 = f70_local0.m_eventHandlers[f70_arg1.name]
		if f70_local1 then
			return f70_local1( f70_arg2, f70_arg1 )
		end
		f70_local0 = f70_local0:getParent()
	end
end

LUI.UIElement.dispatchEventToChildren = function ( f71_arg0, f71_arg1 )
	local f71_local0 = f71_arg0:getFirstChild()
	if f71_local0 == nil then
		return 
	end
	while f71_local0 ~= nil do
		local f71_local1 = f71_local0:getNextSibling()
		local f71_local2 = f71_local0:processEvent( f71_arg1 )
		if f71_local2 then
			return f71_local2
		end
		f71_local0 = f71_local1
	end
end

LUI.UIElement.registerEventHandler = function ( f72_arg0, f72_arg1, f72_arg2 )
	f72_arg0.m_eventHandlers[f72_arg1] = f72_arg2
end

LUI.UIElement.isFocusable = function ( f73_arg0 )
	return f73_arg0.m_focusable
end

LUI.UIElement.clearNavigationTable = function ( f74_arg0 )
	f74_arg0.navigation = {}
end

LUI.UIElement.makeFocusable = function ( f75_arg0 )
	f75_arg0.m_focusable = true
	f75_arg0.navigation = {}
end

LUI.UIElement.makeFocusableWithoutResettingNavigation = function ( f76_arg0 )
	f76_arg0.m_focusable = true
end

LUI.UIElement.makeNotFocusable = function ( f77_arg0 )
	f77_arg0.m_focusable = false
end

LUI.UIElement.isIDNamed = function ( f78_arg0 )
	if string.find( f78_arg0.id, "." ) then
		return true
	else
		return false
	end
end

LUI.UIElement.getFirstInFocus = function ( f79_arg0 )
	if f79_arg0:isInFocus() then
		return f79_arg0
	end
	local f79_local0 = f79_arg0:getFirstChild()
	while f79_local0 do
		local f79_local1 = f79_local0:getFirstInFocus()
		if f79_local1 then
			return f79_local1
		end
		f79_local0 = f79_local0:getNextSibling()
	end
	local f79_local1 = f79_arg0:getNextSibling()
	if f79_local1 then
		return f79_local1:getFirstInFocus()
	end
end

LUI.UIElement.doesElementOrChildHaveFocus = function ( f80_arg0 )
	if f80_arg0:isInFocus() then
		return true
	end
	local f80_local0 = f80_arg0:getFirstChild()
	while f80_local0 do
		if f80_local0:doesElementOrChildHaveFocus() then
			return true
		end
		f80_local0 = f80_local0:getNextSibling()
	end
	return false
end

LUI.UIElement.hasChildWithID = function ( f81_arg0, f81_arg1 )
	if f81_arg0.id == f81_arg1 then
		return true
	end
	local f81_local0 = f81_arg0:getFirstChild()
	while f81_local0 do
		if f81_local0:hasChildWithID( f81_arg1 ) then
			return true
		end
		f81_local0 = f81_local0:getNextSibling()
	end
	return false
end

LUI.UIElement.saveState = function ( f82_arg0 )
	if not f82_arg0:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. f82_arg0:getFullID() )
		return 
	elseif f82_arg0.lastFocusedElemEvent and f82_arg0.lastFocusedElemEvent.id then
		LUI.savedMenuStates[f82_arg0.id] = {
			id = f82_arg0.lastFocusedElemEvent.id,
			saveEvent = f82_arg0.lastFocusedElemEvent
		}
	else
		LUI.savedMenuStates[f82_arg0.id] = nil
	end
end

LUI.UIElement.clearSavedState = function ( f83_arg0 )
	if not f83_arg0:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. f83_arg0:getFullID() )
		return 
	else
		LUI.savedMenuStates[f83_arg0.id] = nil
	end
end

LUI.UIElement.restoreState = function ( f84_arg0 )
	if not f84_arg0:isIDNamed() then
		error( "LUI Error: Tried to restore menu state, but element has no name: " .. f84_arg0:getFullID() )
		return 
	elseif Engine.DvarBool( nil, "rat_playback_enabled" ) then
		return 
	else
		local f84_local0 = LUI.savedMenuStates[f84_arg0.id]
		if f84_local0 ~= nil and f84_local0.id then
			return f84_arg0:processEvent( {
				name = "restore_focus",
				id = f84_local0.id,
				data = f84_local0.data,
				saveEvent = f84_local0.saveEvent
			} )
		else
			
		end
	end
end

LUI.UIElement.restoreFocus = function ( f85_arg0, f85_arg1 )
	local f85_local0 = f85_arg1.saveEvent
	if f85_local0 and f85_local0.idStack and #f85_local0.idStack > 0 and f85_arg0.id == f85_local0.idStack[1] then
		if #f85_local0.idStack == 1 then
			return f85_arg0:processEvent( {
				name = "gain_focus",
				saveEvent = f85_local0
			} )
		else
			table.remove( f85_local0.idStack, 1 )
			return f85_arg0:dispatchEventToChildren( f85_arg1 )
		end
	else
		return false
	end
end

LUI.UIElement.animate = function ( f86_arg0, f86_arg1 )
	if f86_arg0.m_animationStates[f86_arg1.animationStateName] then
		f86_arg0:animateToState( f86_arg1.animationStateName, f86_arg1.duration, f86_arg1.easeIn, f86_arg1.easeOut )
		if f86_arg1.animateChildren then
			f86_arg0:dispatchEventToChildren( f86_arg1 )
		end
	else
		f86_arg0:dispatchEventToChildren( f86_arg1 )
	end
end

LUI.UIElement.hide = function ( f87_arg0 )
	f87_arg0:setAlpha( 0 )
end

LUI.UIElement.show = function ( f88_arg0 )
	f88_arg0:setAlpha( 1 )
end

LUI.UIElement.rotateRandomly = function ( f89_arg0, f89_arg1 )
	if not f89_arg0.m_eventHandlers.rotate_randomly then
		f89_arg0:registerEventHandler( "rotate_randomly", LUI.UIElement.rotateRandomly )
		f89_arg0:addElement( LUI.UITimer.new( 2500, "rotate_randomly", false, f89_arg0 ) )
	end
	f89_arg0:beginAnimation( "rotate_randomly", 2500, true, true )
	f89_arg0:setXRot( math.random( -45, 45 ) )
	f89_arg0:setYRot( math.random( -45, 45 ) )
end

LUI.UIElement.spinRandomly = function ( f90_arg0, f90_arg1 )
	if not f90_arg0.m_eventHandlers.spin_randomly then
		f90_arg0:registerEventHandler( "spin_randomly", LUI.UIElement.rotateRandomly )
		f90_arg0:addElement( LUI.UITimer.new( 2500, "spin_randomly", false, f90_arg0 ) )
	end
	f90_arg0:beginAnimation( "rotate_randomly", 2500, true, true )
	f90_arg0:setZRot( math.random( -90, 90 ) )
end

LUI.UIElement.flicker = function ( f91_arg0, f91_arg1, f91_arg2, f91_arg3, f91_arg4, f91_arg5, f91_arg6 )
	if not f91_arg1 then
		f91_arg1 = 1000
	end
	if not f91_arg2 then
		f91_arg2 = 1
	end
	if not f91_arg3 then
		f91_arg3 = 0.2
	end
	if not f91_arg4 then
		f91_arg4 = 0.7
	end
	if not f91_arg5 then
		f91_arg5 = 50
	end
	if not f91_arg6 then
		f91_arg6 = 150
	end
	f91_arg0.lowFlickerAlpha = f91_arg3
	f91_arg0.highFlickerAlpha = f91_arg4
	f91_arg0.endFlickerAlpha = f91_arg2
	f91_arg0:registerEventHandler( "close_flicker_timer", LUI.UIElement.CloseFlickerTimer )
	f91_arg0:alternateStates( f91_arg1, LUI.UIElement.LowFlickerAlternate, LUI.UIElement.HighFlickerAlternate, f91_arg5, f91_arg6, LUI.UIElement.EndFlickerAlternate )
end

LUI.UIElement.LowFlickerAlternate = function ( f92_arg0, f92_arg1 )
	f92_arg0:beginAnimation( "lower_alpha", f92_arg1 )
	f92_arg0:setAlpha( f92_arg0.lowFlickerAlpha )
end

LUI.UIElement.HighFlickerAlternate = function ( f93_arg0, f93_arg1 )
	f93_arg0:beginAnimation( "raise_alpha", f93_arg1 )
	f93_arg0:setAlpha( f93_arg0.highFlickerAlpha )
end

LUI.UIElement.EndFlickerAlternate = function ( f94_arg0, f94_arg1 )
	f94_arg0:beginAnimation( "end_alpha", f94_arg1 )
	f94_arg0:setAlpha( f94_arg0.endFlickerAlpha )
	f94_arg0.lowFlickerAlpha = nil
	f94_arg0.highFlickerAlpha = nil
	f94_arg0.endFlickerAlpha = nil
end

LUI.UIElement.CloseFlickerTimer = function ( f95_arg0, f95_arg1 )
	if f95_arg0.lowFlickerAlpha then
		f95_arg0:closeStateAlternator()
	end
end

LUI.UIElement.closeStateAlternator = function ( f96_arg0 )
	if f96_arg0.alternatorTimer then
		f96_arg0.alternatorTimer:close()
		f96_arg0.alternatorTimer = nil
	end
	if f96_arg0.alternatorEnd then
		f96_arg0:alternatorEnd()
		f96_arg0.alternatorEnd = nil
	end
end

LUI.UIElement.UpdateStateAlternater = function ( f97_arg0, f97_arg1 )
	if f97_arg1.next ~= "first" and f97_arg1.next ~= "second" then
		f97_arg0:closeStateAlternator()
		return 
	end
	local f97_local0 = "first"
	local f97_local1 = f97_arg1.func2
	if f97_arg1.next == "first" then
		f97_local0 = "second"
		f97_local1 = f97_arg1.func1
	end
	local f97_local2 = math.random( f97_arg1.lowTime, f97_arg1.highTime )
	if f97_arg1.timeLeft <= f97_local2 and not f97_arg1.isInfinite then
		f97_local2 = f97_arg1.timeLeft + 1
		f97_local0 = "final"
	end
	f97_local1( f97_arg0, f97_local2 )
	local f97_local3 = -1
	if not f97_arg1.isInfinite then
		f97_local3 = f97_arg1.timeLeft - f97_local2
	end
	f97_arg0.alternatorTimer = LUI.UITimer.new( f97_local2, {
		name = "update_state_alternate",
		isInfinite = f97_arg1.isInfinite,
		next = f97_local0,
		func1 = f97_arg1.func1,
		func2 = f97_arg1.func2,
		timeLeft = f97_local3,
		lowTime = f97_arg1.lowTime,
		highTime = f97_arg1.highTime
	}, true, f97_arg0 )
	f97_arg0:addElement( f97_arg0.alternatorTimer )
end

LUI.UIElement.alternateStates = function ( f98_arg0, f98_arg1, f98_arg2, f98_arg3, f98_arg4, f98_arg5, f98_arg6 )
	if f98_arg0.alternatorEnd then
		return 
	elseif not f98_arg1 then
		f98_arg1 = 1000
	end
	if f98_arg2 == nil or f98_arg3 == nil then
		return 
	elseif f98_arg6 == nil then
		f98_arg6 = f98_arg3
	end
	if not f98_arg4 then
		f98_arg4 = 50
	end
	if not f98_arg5 then
		f98_arg5 = 150
	end
	f98_arg0.alternatorEnd = f98_arg6
	f98_arg0:registerEventHandler( "update_state_alternate", LUI.UIElement.UpdateStateAlternater )
	f98_arg0:processEvent( {
		name = "update_state_alternate",
		isInfinite = f98_arg1 == 0,
		next = "first",
		func1 = f98_arg2,
		func2 = f98_arg3,
		timeLeft = f98_arg1,
		lowTime = f98_arg4,
		highTime = f98_arg5
	} )
end

LUI.UIElement.CloseAnimationQueue = function ( f99_arg0 )
	if f99_arg0.queueTimer then
		f99_arg0.queueTimer:close()
		f99_arg0.queueTimer = nil
	end
end

local f0_local2 = function ( f100_arg0, f100_arg1, f100_arg2 )
	if #f100_arg1 == 0 then
		return 0
	end
	local f100_local0 = f100_arg1[1].funct
	local f100_local1 = f100_arg1[1].time
	if f100_local1 == nil then
		f100_local1 = 0
	end
	if f100_local0 then
		f100_local0( f100_arg0, f100_local1, f100_arg1[1] )
	end
	if f100_arg2 then
		table.insert( f100_arg1, f100_arg1[1] )
	end
	table.remove( f100_arg1, 1 )
	return f100_local1
end

local f0_local3 = function ( f101_arg0 )
	if not f101_arg0.queueTimer then
		return 
	end
	local f101_local0 = nil
	if f101_arg0.queueTimer.timerEvent then
		f101_local0 = f101_arg0.queueTimer.timerEvent.queue
	end
	if f101_local0 then
		local f101_local1 = f101_local0[#f101_local0].funct
		if f101_local1 then
			f101_local1( f101_arg0, 0, f101_local0[#f101_local0] )
		end
	end
	f101_arg0.queueTimer:close()
	f101_arg0.queueTimer = nil
end

LUI.UIElement.QueueAnimation = function ( f102_arg0, f102_arg1 )
	if #f102_arg1.queue == 0 or not f102_arg0.queueTimer then
		LUI.UIElement.CloseAnimationQueue( f102_arg0 )
		return 
	else
		f102_arg0.queueTimer.interval = f0_local2( f102_arg0, f102_arg1.queue, f102_arg1.repeats )
	end
end

LUI.UIElement.animationQueue = function ( f103_arg0, f103_arg1, f103_arg2, f103_arg3 )
	if not f103_arg1 then
		return 
	elseif f103_arg0.queueTimer then
		f0_local3( f103_arg0 )
	end
	f103_arg0:registerEventHandler( "queue_animation", LUI.UIElement.QueueAnimation )
	local f103_local0 = f103_arg2 or 0
	if f103_local0 == 0 then
		f103_local0 = f0_local2( f103_arg0, f103_arg1, f103_arg3 )
	end
	if #f103_arg1 > 0 then
		f103_arg0.queueTimer = LUI.UITimer.new( f103_local0, {
			name = "queue_animation",
			repeats = f103_arg3,
			queue = f103_arg1
		}, false, f103_arg0 )
		f103_arg0:addElement( f103_arg0.queueTimer )
	end
end

LUI.UIElement.NextListAnimation = function ( f104_arg0, f104_arg1 )
	if f104_arg1._index == 1 and f104_arg0._queueTimer ~= nil then
		f104_arg0._queueTimer:close()
	end
	if f104_arg1.interrupted then
		f104_arg1._index = f104_arg1._lastIndex
	end
	if f104_arg1._index <= f104_arg1._lastIndex then
		local f104_local0 = f104_arg1._anims[f104_arg1._index]( f104_arg0, f104_arg1 )
		f104_arg1._index = f104_arg1._index + 1
		f104_arg0._queueTimer = LUI.UITimer.new( f104_local0, f104_arg1, true, f104_arg0 )
		f104_arg0:addElement( f104_arg0._queueTimer )
	else
		f104_arg0._queueTimer = nil
		f104_arg0:registerEventHandler( "anim_done", nil )
		local f104_local0 = f104_arg0:getParent()
		f104_local0:childClipFinished()
	end
end

LUI.UIElement.ViewportAnimation = function ( f105_arg0, f105_arg1 )
	if not f105_arg0.viewportScaleTime then
		f105_arg0.viewportScaleTime = f105_arg1.timeElapsed
	else
		f105_arg0.viewportScaleTime = f105_arg0.viewportScaleTime + f105_arg1.timeElapsed
	end
	local f105_local0 = f105_arg0.viewportScaleTime / f105_arg1.scaleDuration
	if f105_local0 > 1 then
		f105_local0 = 1
		f105_arg1.timer:close()
		f105_arg0.viewportScaleTime = nil
	end
	local f105_local1 = f105_arg1.startScale + (f105_arg1.endScale - f105_arg1.startScale) * f105_local0
	Engine.SetViewport( f105_arg1.controller, 0.1 - f105_local1 / 10, 0.5 - f105_local1 / 2, f105_local1 )
end

LUI.UIElement.animateViewport = function ( f106_arg0, f106_arg1, f106_arg2, f106_arg3, f106_arg4 )
	f106_arg0:addElement( LUI.UITimer.new( 1, {
		name = "viewport_animation",
		controller = f106_arg1,
		startScale = f106_arg2,
		endScale = f106_arg3,
		scaleDuration = f106_arg4
	}, false, f106_arg0 ) )
end

LUI.UIElement.animateToNextState = function ( f107_arg0, f107_arg1, f107_arg2, f107_arg3, f107_arg4 )
	return function ( f108_arg0, f108_arg1 )
		if not f108_arg1.interrupted then
			f108_arg0:animateToState( f107_arg1, f107_arg2, f107_arg3, f107_arg4 )
		end
	end
	
end

LUI.UIElement.CompleteAnimationEvent = function ( f109_arg0, f109_arg1 )
	f109_arg0:completeAnimation()
	f109_arg0:dispatchEventToChildren( f109_arg1 )
end

LUI.UIElement.UpdateSafeArea = function ( f110_arg0, f110_arg1, f110_arg2 )
	if f110_arg2 == nil and f110_arg1 ~= nil then
		f110_arg2 = f110_arg1.controller
	end
	local f110_local0, f110_local1, f110_local2, f110_local3 = Engine.GetUserSafeAreaForController( f110_arg2 )
	f110_arg0:setLeftRight( false, false, f110_local0, f110_local2 )
	f110_arg0:setTopBottom( false, false, f110_local1, f110_local3 )
end

LUI.UIElement.sizeToSafeArea = function ( f111_arg0, f111_arg1 )
	f111_arg0:UpdateSafeArea( nil, f111_arg1 )
	f111_arg0:registerEventHandler( "update_safe_area", f111_arg0.UpdateSafeArea )
end

LUI.UIElement.setState = function ( f112_arg0, f112_arg1, f112_arg2 )
	if f112_arg0.currentState == f112_arg1 and not f112_arg0.ignoreCurrentStateCheck then
		return 
	end
	local f112_local0 = f112_arg0.currentState
	local f112_local1
	if not f112_arg2 then
		f112_local1 = f112_arg0:hasClip( f112_arg1 )
	else
		f112_local1 = false
	end
	f112_arg0.currentState = f112_arg1
	local f112_local2 = f112_local1
	local f112_local3 = "DefaultClip"
	if f112_arg0:isInFocus() and f112_arg0:hasClip( "Focus" ) then
		f112_local3 = "Focus"
		f112_local2 = false
	end
	if f112_local1 then
		f112_arg0.nextClip = f112_local3
		f112_arg0.currentClipIsTransitionClip = f112_local2
		f112_arg0.clipsPerState[f112_local0][f112_arg1]()
	else
		f112_arg0:playClip( f112_local3 )
	end
end

LUI.UIElement.mergeStateConditions = function ( f113_arg0, f113_arg1, f113_arg2 )
	if not f113_arg2 then
		if not f113_arg0.stateConditions then
			f113_arg0.stateConditions = {}
		end
		f113_arg2 = f113_arg0.stateConditions
	end
	local f113_local0 = function ( f114_arg0 )
		for f114_local3, f114_local4 in ipairs( f113_arg2 ) do
			if f114_local4.stateName == f114_arg0 then
				return f114_local3
			end
		end
		return nil
	end
	
	for f113_local4, f113_local5 in ipairs( f113_arg1 ) do
		local f113_local6 = f113_local0( f113_local5.stateName )
		if f113_local6 == nil then
			table.insert( f113_arg2, LUI.ShallowCopy( f113_local5 ) )
		else
			f113_arg2[f113_local6] = LUI.ShallowCopy( f113_local5 )
		end
	end
end

LUI.UIElement.clipOver = function ( f115_arg0, f115_arg1 )
	if f115_arg0.nextClip then
		f115_arg0:playClip( f115_arg0.nextClip )
	end
end

LUI.UIElement.playClip = function ( f116_arg0, f116_arg1 )
	f116_arg0.nextClip = nil
	f116_arg0.currentClipIsTransitionClip = false
	if not f116_arg0.currentState then
		f116_arg0.currentState = "DefaultState"
	end
	if f116_arg0.clipsPerState and f116_arg0.clipsPerState[f116_arg0.currentState] and f116_arg0.clipsPerState[f116_arg0.currentState][f116_arg1] then
		f116_arg0.clipsPerState[f116_arg0.currentState][f116_arg1]()
		return true
	else
		return false
	end
end

LUI.UIElement.hasClip = function ( f117_arg0, f117_arg1 )
	if f117_arg0.clipsPerState and f117_arg0.clipsPerState[f117_arg0.currentState] and f117_arg0.clipsPerState[f117_arg0.currentState][f117_arg1] then
		return true
	else
		return false
	end
end

LUI.UIElement.setupElementClipCounter = function ( f118_arg0, f118_arg1 )
	f118_arg0.elementsPlayingClips = f118_arg1
	if f118_arg0.elementsPlayingClips == 0 then
		f118_arg0:processEvent( {
			name = "clip_over"
		} )
	end
end

LUI.UIElement.childClipFinished = function ( f119_arg0 )
	f119_arg0.elementsPlayingClips = f119_arg0.elementsPlayingClips - 1
	if f119_arg0.elementsPlayingClips == 0 then
		f119_arg0:processEvent( {
			name = "clip_over"
		} )
	end
end

LUI.UIElement.clipFinished = function ( f120_arg0, f120_arg1 )
	local f120_local0 = f120_arg0:getParent()
	if f120_local0 ~= nil and (not f120_arg1.interrupted or f120_local0.currentClipIsTransitionClip) then
		f120_local0:childClipFinished()
	end
end

LUI.UIElement.updateState = function ( f121_arg0, f121_arg1 )
	local f121_local0 = f121_arg1.menu or f121_arg0
	while f121_local0 do
		if f121_local0.updateElementState then
			f121_arg1.menu = f121_local0
			f121_local0:updateElementState( f121_arg0, f121_arg1 )
			if f121_arg0.anyChildUsesUpdateState then
				f121_arg0:dispatchEventToChildren( f121_arg1 )
			end
			return 
		end
		f121_local0 = f121_local0:getParent()
	end
end

LUI.UIElement.RecordCurrFocusedElemID = function ( f122_arg0, f122_arg1 )
	if not f122_arg1.idStack then
		error( "LUI Error: " .. f122_arg1.name .. " processed without event.idStack " )
	end
	table.insert( f122_arg1.idStack, 1, f122_arg0.id )
	return f122_arg0:dispatchEventToParent( f122_arg1 )
end

LUI.UIElement.setFontBasedOnSize = function ( f123_arg0, f123_arg1 )
	if CoD.GetFontBasedOnSize then
		f123_arg0:setFont( CoD.GetFontBasedOnSize( f123_arg1 ) )
	end
end

LUI.UIElement.playBitchinFX = function ( f124_arg0, f124_arg1, f124_arg2, f124_arg3 )
	f124_arg0:setShaderVector( 0, 0, 0, 0, 0 )
	f124_arg0:beginAnimation( "bitchin", f124_arg1, f124_arg2, f124_arg3 )
	f124_arg0:setShaderVector( 0, 1, 0, 0, 0 )
end

LUI.UIElement.playBitchinFXReverse = function ( f125_arg0, f125_arg1, f125_arg2, f125_arg3 )
	f125_arg0:setShaderVector( 0, 1, 0, 0, 0 )
	f125_arg0:beginAnimation( "bitchin", f125_arg1, f125_arg2, f125_arg3 )
	f125_arg0:setShaderVector( 0, 0, 0, 0, 0 )
end

LUI.UIElement.setClass = function ( f126_arg0, f126_arg1 )
	local f126_local0 = getmetatable( f126_arg0 )
	local f126_local1 = f126_local0.__newindex
	local f126_local2 = getmetatable( f126_local1 )
	if not f126_local2 then
		setmetatable( f126_local1, {
			__index = f126_arg1
		} )
	else
		f126_local2.__index = f126_arg1
	end
	local f126_local3 = getmetatable( f126_local1.m_eventHandlers )
	if not f126_local3 then
		setmetatable( f126_local1.m_eventHandlers, {
			__index = f126_arg1.m_eventHandlers
		} )
	else
		f126_local3.__index = f126_arg1.m_eventHandlers
	end
end

LUI.UIElement.getParentMenu = function ( f127_arg0 )
	local f127_local0 = f127_arg0
	while not f127_local0.menuName do
		f127_local0 = f127_local0:getParent()
	end
	return f127_local0
end

LUI.UIElement.findSibling = function ( f128_arg0, f128_arg1 )
	while f128_arg0 and not f128_arg0.menuName and not f128_arg0[f128_arg1] do
		f128_arg0 = f128_arg0:getParent()
	end
	if f128_arg0 and f128_arg0[f128_arg1] then
		return f128_arg0[f128_arg1]
	else
		
	end
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
LUI.UIElement.new = function ( f129_arg0 )
	local f129_local0
	if f129_arg0 then
		f129_local0 = ConstructLUIElement()
		if not f129_local0 then
		
		else
			LUI.UIElement.setClass( f129_local0, LUI.UIElement )
			f129_local0:setLayoutCached( false )
			f129_local0.anyChildUsesUpdateState = false
			if f129_arg0 then
				f129_local0:registerAnimationState( "default", f129_arg0 )
				f129_local0:animateToState( "default" )
			end
			return f129_local0
		end
	end
	f129_local0 = ConstructLUIElement( LUI.UIElement.m_defaultAnimationState )
end

LUI.UIElement.fakeElemMetaTable = {
	__index = function ( f130_arg0, f130_arg1 )
		return f130_arg0
	end,
	__call = function ()
		return nil
	end,
	__newIndex = function ()
		
	end
}
LUI.UIElement.createFake = function ()
	return setmetatable( {}, LUI.UIElement.fakeElemMetaTable )
end

LUI.UIElement.showDebugTimer = function ( f134_arg0, f134_arg1 )
	local f134_local0 = f134_arg0.playClip
	f134_arg0.playClip = function ( f135_arg0, f135_arg1 )
		f134_local0( f135_arg0, f135_arg1 )
		if f135_arg0.elementsPlayingClips ~= nil and f135_arg0.elementsPlayingClips > 0 then
			f135_arg0._debugTimerIndex = Engine.SetDebugTimerInfo( f135_arg0.id .. ":" .. f135_arg0.currentState .. ":" .. f135_arg1, f135_arg0._debugTimerIndex )
		end
	end
	
	f134_arg0:registerEventHandler( "clip_over", function ( element, event )
		if element._debugTimerIndex ~= nil then
			Engine.SetDebugTimerInfo( "", element._debugTimerIndex )
			element._debugTimerIndex = nil
		end
		LUI.UIElement.clipOver( element, event )
	end )
	local f134_local1 = f134_arg0.close
	f134_arg0.close = function ( f137_arg0 )
		f134_local1( f137_arg0 )
		if f137_arg0._debugTimerIndex ~= nil then
			Engine.SetDebugTimerInfo( "", f137_arg0._debugTimerIndex )
			f137_arg0._debugTimerIndex = nil
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

