CoD.Menu = InheritFrom( LUI.UIElement )
CoD.InGameMenu = InheritFrom( CoD.Menu )
CoD.Menu.PriorityMenusOpen = 0
CoD.Menu.SpinnerIsActive = false
CoD.Menu.NewFromState = function ( name, controller, leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
	if name == nil then
		error( "LUI Error: Attempted to create a menu without a name." )
	end
	local self = LUI.UIElement.new( leftPct, rightPct, leftPx, rightPx, topPct, bottomPct, topPx, bottomPx )
	if LUI.DEV then
		self.__priorModelCount = Engine.GetModelUsage() or 0
	end
	self:setClass( CoD.Menu )
	if nil ~= CoD.Menu.ModelToUse then
		self:setModel( CoD.Menu.ModelToUse )
	end
	name = CoD.Menu.OverwriteMenuName or name
	self.menuName = name
	self.id = "Menu." .. name
	if RegisterOpenedMenu then
		RegisterOpenedMenu( self, name )
	end
	if self.menuName == "DOA_INGAME_PAUSE" then
		CoD.isDOAPauseMenuOpen = true
	end
	CoD.Menu.AddToCurrMenuNameList( self.menuName )
	if name ~= "MessageDialogBox" and name ~= "main" and name ~= "Migration" and name ~= "FreeCursor" then
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		self:subscribeToGlobalModel( controller, "MessageDialog", "messagePending", function ( model )
			if ShouldOpenMessageDialog( self, controller ) then
				local openingController = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "messageDialog.controller" ) or controller
				local occludedBy = self.occludedBy
				local occludedMenu = self.occludedMenu
				if occludedBy and occludedBy.menuName == "MessageDialogBox" then
					Close( occludedBy, controller )
					occludedBy = nil
				end
				if not CoD.isFrontend then
					if self.id == "Menu.HUD" and (IsGameTypeDOA() == false or openingController == 0) then
						local f2_local0 = occludedBy
						local newOccludedMenu = self
						local popup = CoD.OverlayUtility.CreateOverlay( openingController, f2_local0 or newOccludedMenu, "MessageDialogBox", openingController )
						CoD.Menu.SetAsPriority( popup )
						popup:setOwner( openingController )
						Engine.LockInput( openingController, true )
						Engine.SetUIActive( openingController, true )
					end
				elseif not occludedBy then
					local popup = CoD.OverlayUtility.CreateOverlay( openingController, self, "MessageDialogBox", openingController )
					CoD.Menu.SetAsPriority( popup )
					popup:registerEventHandler( "unused_durango_gamepad_button", function ( self, event )
						self:close()
					end )
				end
			end
		end, false )
	end
	return self
end

CoD.Menu.SetAsPriority = function ( menu )
	CoD.Menu.PriorityMenusOpen = CoD.Menu.PriorityMenusOpen + 1
	menu._isPriorityMenu = true
end

CoD.Menu.NewForUIEditor = function ( name )
	local self = CoD.Menu.NewFromState( name )
	return self
end

CoD.Menu.close = function ( self )
	if self.menuName == "DOA_INGAME_PAUSE" then
		CoD.isDOAPauseMenuOpen = false
	end
	CoD.Menu.RemoveFromCurrMenuNameList( self.menuName )
	if self._isPriorityMenu then
		CoD.Menu.PriorityMenusOpen = CoD.Menu.PriorityMenusOpen - 1
	end
	if CoD.isSinglePlayer == true then
		local ownerController = self:getOwner()
		if ownerController == nil then
			ownerController = 0
		end
		Engine.SendMenuResponse( ownerController, self.menuName, "menu_close" )
	end
	if UnregisterOpenedMenu then
		UnregisterOpenedMenu( self, self.menuName )
	end
	if self.occludedBy ~= nil and self.occludedBy.occludedMenu == self then
		self.occludedBy.occludedMenu = self.occludedMenu
	end
	if self.occludedMenu ~= nil and self.occludedMenu.occludedBy == self then
		if self.occludedBy ~= nil then
			self.occludedMenu.occludedBy = self.occludedBy
		else
			if IsGameTypeDOA() and Engine.IsSplitscreen() then
				local ownerController = self:getOwner()
				self.occludedMenu:setOwner( ownerController )
			end
			self.occludedMenu:processEvent( {
				name = "occlusion_change",
				occluded = false,
				occludedBy = self
			} )
		end
	end
	if self:getSoundSet() then
		self:playSound( "menu_close" )
	end
	CoD.MetricsUtility.CloseMenu( self )
	CoD.Menu.super.close( self )
	if LUI.DEV then
		local f6_local0 = Engine.GetModelUsage()
		if not f6_local0 then
			local newUsage = 0
		end
		DebugPrint( "Menu " .. self.menuName .. " model change = " .. f6_local0 - self.__priorModelCount )
	end
end

CoD.Menu.TransitionCompleteAnimatePopupOut = function ( self, event )
	self:goBack( self:getOwner() )
end

CoD.Menu.safeCreateMenu = function ( menuName, controller, userData )
	Engine.GCStop()
	Engine.BeginPIXEvent( "createMenu('" .. menuName .. "')" )
	local createFunc = LUI.createMenu[menuName]
	if createFunc == nil then
		if LUI.DEV then
			error( "LUI Error: no createMenu function for menu '" .. menuName .. "'" )
		end
		Engine.EndPIXEvent()
		return nil
	else
		local retVal = createFunc( controller, userData )
		CoD.MetricsUtility.OpenMenu( retVal )
		Engine.GCRestart()
		Engine.EndPIXEvent()
		return retVal
	end
end

CoD.Menu.DebugCloseMenu = function ( self )
	self:close()
end

CoD.Menu.DebugReload = function ( self, event )
	if self.occludedBy then
		return 
	end
	local controller = self.m_ownerController
	if not controller then
		controller = Engine.GetPrimaryController()
	end
	local nextSibling = self:getNextSibling()
	local oldMenuParent = self:getParent()
	local oldMenuController = self.m_ownerController
	local oldMenuOccludedMenu = self.occludedMenu
	local oldMenuPreviousMenuName = self.previousMenuName
	local menuName = self.menuName
	CoD.Menu.DebugCloseMenu( self )
	self = nil
	if menuName == "MessageDialogBox" then
		return 
	end
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller )
	newMenu.m_ownerController = oldMenuController
	newMenu.occludedMenu = oldMenuOccludedMenu
	newMenu.previousMenuName = oldMenuPreviousMenuName
	if nextSibling ~= nil then
		newMenu:addElementBefore( nextSibling )
	else
		oldMenuParent:addElement( newMenu )
	end
	newMenu:updateBlur()
end

CoD.Menu.goBack = function ( self, controller )
	if self:getSoundSet() then
		self:playSound( "menu_go_back" )
	end
	return self:returnToPreviousMenu( controller )
end

CoD.Menu.OcclusionChange = function ( self, event )
	if event.occluded then
		if self.id == "Menu.Lobby" and event.occludedBy.id == "Menu.Spinner" then
			local oldOccludedBy = self.occludedBy
			self.occludedBy = event.occludedBy
			if oldOccludedBy then
				oldOccludedBy:setOccludedMenu( self.occludedBy )
			else
				self.m_inputDisabled = true
			end
		elseif self.occludedBy then
			local top = self
			repeat
				top = top.occludedBy
			until not top.occludedBy
			event.occludedBy:setOccludedMenu( top )
			top.occludedBy = event.occludedBy
			self.m_inputDisabled = true
		else
			self.occludedBy = event.occludedBy
			self.m_inputDisabled = true
		end
	elseif self.occludedBy == nil or event.occludedBy.id == self.occludedBy.id then
		self.m_inputDisabled = nil
		local f12_local0 = self.occludedBy
		if f12_local0 then
			f12_local0 = self.occludedBy.animateInFromOffset ~= nil
		end
		self.occludedBy = nil
		if f12_local0 then
			CoD.Menu.UpdateAllButtonPrompts( self, self:getOwner() )
		end
		if self.updateBlur then
			self:updateBlur()
		end
	end
	if Engine.UsingFreeCursor() and not self.occludedBy then
		DataSources.FreeCursor.registerButtonPrompts( self:getOwner(), self.buttonModel )
	end
end

CoD.Menu.AddButtonPromptModel = function ( self, luiButton, defaultPromptState )
	local buttonVisModel = Engine.GetModel( self.buttonModel, luiButton )
	if not buttonVisModel then
		buttonVisModel = Engine.CreateModel( self.buttonModel, luiButton )
		Engine.SetModelValue( buttonVisModel, defaultPromptState or Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
	end
	if CoD.isPC and buttonVisModel and not Engine.GetModel( buttonVisModel, "Button" ) then
		Engine.SetModelValue( Engine.CreateModel( buttonVisModel, "Button" ), luiButton )
	end
	if not buttonVisModel.Label then
		local f13_local0 = buttonVisModel:create( "Label" )
		f13_local0:set( "" )
	end
	if not buttonVisModel.flags then
		local f13_local0 = buttonVisModel:create( "flags" )
		f13_local0:set( 0 )
	end
end

CoD.Menu.AddKeyPressStateModel = function ( controller, keyName, defaultPressState )
	if CoD.isPC then
		local keyPressBitsModel = Engine.GetModel( Engine.GetModelForController( controller ), "KeyPressBits" )
		if not Engine.GetModel( keyPressBitsModel, keyName ) then
			Engine.SetModelValue( Engine.CreateModel( keyPressBitsModel, keyName ), defaultPressState or 0 )
		end
	end
end

CoD.Menu.SetButtonPromptState = function ( self, luiButton, luiButtonState )
	Engine.SetModelValue( Engine.CreateModel( self.buttonModel, luiButton ), luiButtonState )
	if Engine.UsingFreeCursor() then
		DataSources.FreeCursor.updateActivePrompts( self:getOwner() )
	end
end

CoD.Menu.GetElementAndFunctionTableForButton = function ( menu, luiButton, fnTable )
	local getResultTableEntry = function ( element, fn )
		return {
			element = element,
			fn = fn
		}
	end
	
	local results = {}
	local elementToCall = menu
	if menu.lastFocusedElemEvent and menu.lastFocusedElemEvent.idStack then
		local lastFocusedElemEvent = menu.lastFocusedElemEvent
		local element = menu
		local startIndex = 2
		while lastFocusedElemEvent ~= nil do
			for i = startIndex, #lastFocusedElemEvent.idStack, 1 do
				element = element[lastFocusedElemEvent.idStack[i]]
				if not element then
					lastFocusedElemEvent = nil
					break
				end
				elementToCall = element
				if element[fnTable] and element[fnTable][luiButton] then
					if not element.activeWidget then
						local f16_local2 = lastFocusedElemEvent.idStack[i + 1]
						local f16_local3 = element[lastFocusedElemEvent.idStack[i + 1]]
						local elementForFn = element
					end
					table.insert( results, 1, getResultTableEntry( f16_local2 and f16_local3 or REG22, element[fnTable][luiButton] ) )
				end
			end
			startIndex = 1
			if lastFocusedElemEvent then
				lastFocusedElemEvent = lastFocusedElemEvent.originalEvent
			end
		end
	end
	if menu[fnTable] and menu[fnTable][luiButton] then
		table.insert( results, getResultTableEntry( elementToCall, menu[fnTable][luiButton] ) )
	end
	return results
end

CoD.Menu.AnyButtonConditionTrue = function ( element, menu, controller, luiButton )
	local results = menu:GetElementAndFunctionTableForButton( luiButton, "conditionFunctions" )
	for _, data in ipairs( results ) do
		local f18_local3 = data.fn
		if f18_local3 then
			local result = data.fn( data.element, menu, controller )
		end
		if f18_local3 then
			return true
		end
	end
	return false
end

CoD.Menu.UpdateButtonShownState = function ( element, menu, controller, luiButton )
	local results = menu:GetElementAndFunctionTableForButton( luiButton, "conditionFunctions" )
	local buttonState = Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS
	if menu.showButtonDisabled and menu.showButtonDisabled[luiButton] then
		buttonState = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
	end
	for _, data in ipairs( results ) do
		local f19_local3 = data.fn
		if f19_local3 then
			local result = data.fn( data.element, menu, controller )
		end
		if f19_local3 then
			buttonState = Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS
			break
		elseif buttonState ~= Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS and data.element and data.element.showButtonDisabled and data.element.showButtonDisabled[luiButton] then
			buttonState = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
		end
	end
	if buttonState == Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS and menu.occludedBy and menu.occludedBy.animateInFromOffset then
		buttonState = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
	end
	menu:SetButtonPromptState( luiButton, buttonState )
end

CoD.Menu.SetButtonLabel = function ( menu, luiButton, label, flags )
	local buttonModel = menu.buttonModel[luiButton]
	if buttonModel then
		local labelModel = buttonModel.Label
		if labelModel then
			labelModel:set( label or "" )
		end
		if not flags then
			flags = 0
		end
		if not Engine.UsingFreeCursor() then
			flags = CoD.BitUtility.ClearBit( flags, Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
		end
		local flagsModel = buttonModel.flags
		if flagsModel then
			flagsModel:set( flags or 0 )
		end
		if Engine.UsingFreeCursor() then
			DataSources.FreeCursor.updateActivePrompts( menu:getOwner() )
		end
	end
end

CoD.Menu.handleGamepadButtonModelCallback = function ( menu, self, controller, luiButton, traversingUpFromElement )
	local button = LUI.UIElement.GetCorrespondingGamepadButtonString( luiButton )
	if button ~= nil and self.m_disableNavigation ~= true then
		if self.navigationSounds and self.navigationSounds[button] then
			Engine.PlaySound( self.navigationSounds[button] )
		end
		local f21_local0 = self.navigation
		if f21_local0 then
			local navigationChoice = self.navigation[button]
		end
		if f21_local0 ~= nil then
			if type( f21_local0 ) == "function" then
				f21_local0 = f21_local0( self, controller )
				if f21_local0 == true then
					return true
				end
			end
			if type( f21_local0 ) == "table" then
				local choiceList = f21_local0
				local latestTimestamp = nil
				f21_local0 = choiceList[1]
				for index, element in ipairs( choiceList ) do
					local lastFocusedTimestamp = element.lastFocusedTimestamp
					if lastFocusedTimestamp and (not latestTimestamp or latestTimestamp < lastFocusedTimestamp) then
						f21_local0 = element
						latestTimestamp = lastFocusedTimestamp
					end
				end
			end
			if self:doNavigationForElementFromModelCallback( controller, button, f21_local0, self ) then
				return true
			end
		end
		local parent = self:getParent()
		if parent then
			return menu:handleGamepadButtonModelCallback( parent, controller, luiButton, self )
		end
	elseif self.navigation and traversingUpFromElement then
		local parent = self:getParent()
		if parent then
			return menu:handleGamepadButtonModelCallback( parent, controller, luiButton, self )
		end
	end
end

CoD.Menu.AddNavigationHandler = function ( menu, self, controller )
	if not controller then
		controller = menu:getOwner()
	end
	if IsFreeCursorActive( controller ) then
		return 
	elseif not self then
		self = menu
	end
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_UP )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_DOWN )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_LEFT )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		else
			
		end
	end )
	menu:registerEventHandler( "gamepad_button", function ()
		return true
	end )
end

CoD.Menu.SendButtonPressToParentFromChild = function ( menu, self, controller, luiButton, model )
	local parent = self:getParent()
	while parent do
		if parent.buttonFunctions and parent.buttonFunctions[luiButton] and parent.buttonFunctions[luiButton]( self, menu, controller, model ) then
			return 
		end
		self = parent
		parent = parent:getParent()
	end
end

CoD.Menu.SendButtonPressToParent = function ( menu, self, element, controller, luiButton, model )
	local parent = self:getParent()
	while parent do
		if parent.buttonFunctions and parent.buttonFunctions[luiButton] then
			parent.buttonFunctions[luiButton]( element, menu, controller, model )
		end
		parent = parent:getParent()
	end
end

CoD.Menu.HandleButtonPress = function ( menu, controller, luiButton, model )
	if Engine.IsControllerBeingUsed( controller ) or menu.unusedControllerAllowed then
		local results = menu:GetElementAndFunctionTableForButton( luiButton, "buttonFunctions" )
		for _, data in ipairs( results ) do
			if data.fn( data.element, menu, controller, model ) and (menu.preserveLuiButton == nil or menu.preserveLuiButton[luiButton] == nil) then
				Engine.SetModelValue( model, 0 )
				break
			end
		end
		if #results > 0 and (menu.preserveLuiButton == nil or menu.preserveLuiButton[luiButton] == nil) then
			Engine.SetModelValue( model, 0 )
		end
	else
		if IsGameTypeDOA() and Engine.IsSplitscreen() then
			menu:setOwner( controller )
		end
		menu:processEvent( {
			name = "unused_gamepad_button",
			controller = controller
		} )
	end
end

CoD.Menu.IsAncestorOf = function ( potentialParent, element )
	local elementAncestor = element
	while elementAncestor do
		elementAncestor = elementAncestor:getParent()
		if elementAncestor == potentialParent then
			return true
		end
	end
	return false
end

CoD.Menu.UnsubscribeFromControllerSubscriptionsForElement = function ( menu, element )
	if not menu.controllerSubscriptions then
		return 
	end
	for i = #menu.controllerSubscriptions, 1, -1 do
		local subscribedElement = menu.controllerSubscriptions[i].element
		if element == subscribedElement or CoD.Menu.IsAncestorOf( element, subscribedElement ) then
			menu:removeSubscription( menu.controllerSubscriptions[i].subscription )
			table.remove( menu.controllerSubscriptions, i )
		end
	end
	if menu.buttonSubscriptions then
		if #menu.controllerSubscriptions == 0 then
			menu.buttonSubscriptions = nil
		else
			error( "Trying to reset buttonSubscriptions but controllerSubscriptions is not 0 in menu" .. menu.id )
		end
	end
end

CoD.Menu.AddButtonCallbackFunction = function ( menu, element, controller, luiButton, pcKey, func, conditionFunc, showDisabled )
	if not element.buttonFunctions then
		element.buttonFunctions = {}
	end
	if not element.conditionFunctions then
		element.conditionFunctions = {}
	end
	if not element.showButtonDisabled then
		element.showButtonDisabled = {}
	end
	if not menu.showButtonDisabled then
		menu.showButtonDisabled = {}
	end
	if not menu.buttonSubscriptions then
		menu.buttonSubscriptions = {}
	end
	if not menu.controllerSubscriptions then
		menu.controllerSubscriptions = {}
	end
	if luiButton ~= Enum.LUIButton.LUI_KEY_NONE then
		element.buttonFunctions[luiButton] = func
		element.conditionFunctions[luiButton] = conditionFunc
		element.showButtonDisabled[luiButton] = showDisabled
		menu.showButtonDisabled[luiButton] = menu.showButtonDisabled[luiButton] or showDisabled
		menu:AddButtonPromptModel( luiButton )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, luiButton )
		local firstController = controller
		local lastController = controller
		if menu.anyControllerAllowed then
			firstController = 0
			lastController = Engine.GetMaxLocalControllers() - 1
		end
		if not menu.buttonSubscriptions[luiButton] then
			for contr = firstController, lastController, 1 do
				local f33_local2 = contr
				menu.buttonSubscriptions[luiButton] = true
				local subscription = menu:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f33_local2 ), "ButtonBits." .. luiButton ), function ( model )
					if not menu.occludedBy and not CoD.Menu.SpinnerIsActive and (CoD.Menu.PriorityMenusOpen <= 0 or menu._isPriorityMenu) and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( model ), Enum.LUIButtonFlags.FLAG_DOWN ) and not menu.m_disableAllButtonActions then
						CoD.Menu.HandleButtonPress( menu, f33_local2, luiButton, model )
					end
				end, false )
				table.insert( menu.controllerSubscriptions, {
					element = element,
					subscription = subscription
				} )
			end
		end
	end
	if CursorInputEnabledForBuild() and not menu.hasButtonActionHandler then
		menu.hasButtonActionHandler = true
		local buttonHandler = function ( self, event )
			local buttonModel = menu.buttonModel
			if self.handleMouseButton ~= false and buttonModel then
				local button = Enum.LUIButton.LUI_KEY_XBA_PSCROSS
				local buttonBitModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. button )
				if buttonBitModel then
					Engine.SetModelValue( buttonBitModel, Enum.LUIButtonFlags.FLAG_DOWN )
					Engine.SetModelValue( buttonBitModel, 0 )
					return true
				end
			end
		end
		
		menu:registerEventHandler( "mouse_left_click", buttonHandler )
	end
	if CoD.isPC and pcKey ~= nil then
		if not menu.keyPressSubscriptions then
			menu.keyPressSubscriptions = {}
		end
		local buttonVisModel = Engine.GetModel( menu.buttonModel, luiButton )
		if buttonVisModel then
			Engine.SetModelValue( Engine.CreateModel( buttonVisModel, "KeyShortcut" ), pcKey )
		end
		CoD.Menu.AddKeyPressStateModel( controller, pcKey )
		if not menu.keyPressSubscriptions[pcKey] then
			menu.keyPressSubscriptions[pcKey] = true
			menu:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "KeyPressBits." .. pcKey ), function ( model )
				if not menu.occludedBy and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( model ), Enum.LUIButtonFlags.FLAG_DOWN ) and not menu.m_disableAllButtonActions then
					local results = menu:GetElementAndFunctionTableForButton( luiButton, "buttonFunctions" )
					for _, data in ipairs( results ) do
						if data.fn( data.element, menu, controller, model ) then
							Engine.SetModelValue( model, 0 )
							break
						end
					end
					if #results > 0 then
						Engine.SetModelValue( model, 0 )
					end
				end
			end, false )
		end
	end
end

CoD.Menu.GamepadButton = function ( self, event )
	if self.m_inputDisabled then
		return 
	elseif (self.anyControllerAllowed or Engine.IsControllerBeingUsed( event.controller ) or self.unusedControllerAllowed) and (not self.m_ownerController or self.m_ownerController == event.controller) then
		return self:dispatchEventToChildren( event )
	else
		local originalName = event.name
		event.name = "unused_gamepad_button"
		local returnValue = self:processEvent( event )
		event.name = originalName
		return returnValue
	end
end

CoD.Menu.RemoveFromCurrMenuNameList = function ( menuName )
	if menuName == nil or menuName == "" then
		return 
	end
	local menuList = Dvar.ui_currMenuNameList:get()
	if not menuList then
		return 
	end
	local keepMenuString = ""
	for token in string.gmatch( menuList, "[^%s,]+" ) do
		if menuName ~= token then
			if keepMenuString ~= "" then
				keepMenuString = keepMenuString .. ", "
			end
			keepMenuString = keepMenuString .. token
		end
	end
	Dvar.ui_currMenuNameList:set( keepMenuString )
end

CoD.Menu.AddToCurrMenuNameList = function ( menuName )
	if LUI.DEV == nil or menuName == nil or menuName == "" then
		return 
	end
	local menuList = Dvar.ui_currMenuNameList:get()
	if not menuList or menuList == "" then
		Dvar.ui_currMenuNameList:set( menuName )
		return 
	end
	for token in string.gmatch( menuList, "[^%s,]+" ) do
		if token == menuName then
			return 
		end
	end
	Dvar.ui_currMenuNameList:set( menuList .. ", " .. menuName )
end

CoD.Menu.openMenu = function ( self, menuName, controller, userData )
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller, userData )
	if newMenu.previousMenuName == nil then
		newMenu:setPreviousMenu( self.menuName, self.userData )
	end
	if self.occludedMenu then
		newMenu:setOccludedMenu( self.occludedMenu )
	end
	local f40_local0 = self:getParent()
	f40_local0:addElement( newMenu )
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	return newMenu
end

CoD.Menu.replaceMenu = function ( self, menuName, controller, userData, oldUserData, oldMenuName, occludedMenu, parent )
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller, userData )
	if newMenu.previousMenuName == nil then
		newMenu:setPreviousMenu( oldMenuName, oldUserData )
	end
	if occludedMenu then
		newMenu:setOccludedMenu( occludedMenu )
	end
	parent:addElement( newMenu )
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	return newMenu
end

CoD.Menu.ModalDialogInfo = {}
CoD.Menu.ModalDialogInfo.Options = {}
CoD.Menu.OpenModalDialog = function ( menu, element, controller, title, description, buttons, responseFunc )
	CoD.OverlayUtility.CreateOverlay( controller, menu, "GenericModalDialog", title, description, nil, buttons, responseFunc )
end

CoD.Menu.openPopup = function ( self, menuName, controller, userData, parentMenu )
	if CursorInputEnabledForBuild() then
		self:clearMouseFocus( controller )
		Engine.SetMouseCursor( "" )
	end
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller, userData )
	if not newMenu then
		return nil
	end
	newMenu:setOccludedMenu( self )
	if newMenu.animateInFromOffset then
		CoD.Menu.UpdateAllButtonPrompts( self, controller )
	end
	local f43_local0 = parentMenu
	local parent = self:getParent()
	REG6.addElement( f43_local0 or parent, newMenu )
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	return newMenu
end

CoD.Menu.openOverlay = function ( self, menuName, controller, userData, parentMenu )
	local popup = CoD.Menu.openPopup( self, menuName, controller, userData, parentMenu )
	if popup.occludedMenu ~= nil then
		popup.occludedMenu:setAlpha( 0 )
	end
	popup.m_isOverlay = true
	return popup
end

CoD.Menu.returnToPreviousMenu = function ( self, controller )
	local currentMenu = nil
	if self.previousMenuName then
		local parent = self:getParent()
		local previousMenuName = self.previousMenuName
		local previousUserData = self.previousUserData
		local occludedMenu = self.occludedMenu
		if not occludedMenu then
			self:close()
			self = nil
		end
		local previousMenu = CoD.Menu.safeCreateMenu( previousMenuName, controller, previousUserData )
		parent:addElement( previousMenu )
		if occludedMenu then
			previousMenu:setOccludedMenu( occludedMenu )
		end
		currentMenu = previousMenu
		if currentMenu then
			currentMenu:processEvent( {
				name = "menu_opened",
				controller = controller
			} )
		end
	elseif self.occludedMenu then
		if not self.occludedMenu then
			if IsGameTypeDOA() and Engine.IsSplitscreen() then
				self.occludedMenu:setOwner( controller )
			end
			self.occludedMenu:processEvent( {
				name = "occlusion_change",
				occluded = false,
				occludedBy = self
			} )
		end
		currentMenu = self.occludedMenu
	end
	if self ~= nil then
		self:close()
	end
	if currentMenu and not currentMenu.occludedBy then
		currentMenu:setAlpha( 1 )
	end
	return currentMenu
end

CoD.Menu.updateIngamePopupBg = function ( self )
	if self.occludedMenu then
		local darkenAlpha = nil
		if CoD.isSinglePlayer then
			darkenAlpha = 0.7
		else
			darkenAlpha = 0.8
		end
		if not self.darkenElement and not self.disableDarkenElement and not CoD.isSafehouse then
			self.darkenElement = LUI.UIImage.new( 0.5, 0.5, -2560, 2560, 0.5, 0.5, -720, 720 )
			self.darkenElement:setRGB( 0, 0, 0 )
			self.darkenElement:setAlpha( darkenAlpha )
			self.darkenElement:setPriority( -100 )
			self:addElement( self.darkenElement )
		end
	elseif self.darkenElement then
		self.darkenElement:close()
		self.darkenElement = nil
	end
end

CoD.Menu.setOccludedMenu = function ( self, occludedMenu )
	self.occludedMenu = occludedMenu
	if occludedMenu then
		occludedMenu:processEvent( {
			name = "occlusion_change",
			occluded = true,
			occludedBy = self
		} )
	end
	if CoD.isSinglePlayer or Engine.IsInGame() then
		self:updateIngamePopupBg()
	end
	self:updateBlur()
	if Engine.UsingFreeCursor() then
		DataSources.FreeCursor.registerButtonPrompts( self:getOwner(), self.buttonModel )
	end
end

CoD.Menu.setOwner = function ( self, controller )
	if CoD.isWIIU then
		self:setOwnerControllerIndex( controller )
	end
	self.m_ownerController = controller
end

CoD.Menu.getOwner = function ( self )
	return self.m_ownerController
end

CoD.Menu.setPreviousMenu = function ( self, previousMenuName, prevUserData )
	self.previousMenuName = previousMenuName
	self.previousUserData = prevUserData
end

CoD.Menu.updateBlur = function ( self )
	local owner = self:getOwner() or 0
	if Engine.IsInGame() then
		if self.occludedMenu then
			if not CoD.isSafehouse then
				if self.disableBlur == true then
					Engine.BlurWorld( owner, 0 )
				else
					Engine.BlurWorld( owner, 2 )
				end
			end
			Engine.LockInput( owner, true )
			Engine.SetUIActive( owner, true )
		else
			if not (not CoD.isSafehouse or not CoD.perController[owner].inSafehouseMenu) or self.id == "Menu.RewardsOverlayCP" then
				return 
			end
			Engine.BlurWorld( owner, 0 )
			Engine.LockInput( owner, false )
			Engine.SetUIActive( owner, false )
		end
	elseif self.disableBlur ~= nil and self.disableBlur == true then
		return 
	elseif not self.occludedMenu then
		self:setBlur( false )
	end
end

CoD.Menu.MenuChanged = function ( self, event )
	if self.occludedBy then
		if self.occludedMenu == event.prevMenu then
			self:setOccludedMenu( event.nextMenu )
		end
		return 
	elseif self.occludedMenu then
		self.previousMenuName = nil
		self:goBack( event.controller )
		self.occludedMenu:processEvent( event )
	end
end

CoD.Menu.UserSignedOut = function ( self, event )
	if self.occludedBy or not IsInGame() and event.controller ~= self:getOwner() then
		return 
	elseif self.occludedMenu then
		self.previousMenuName = nil
		self:goBack( event.controller )
		self.occludedMenu:processEvent( event )
	end
end

CoD.Menu.ResolutionChanged = function ( self, event )
	if event.resolutionChanged and not self.occludedBy then
		self:processEvent( {
			name = "occlusion_change",
			occluded = false,
			occludedBy = self
		} )
	end
	Engine.SyncHardwareProfileWithDvars()
	Engine.SaveHardwareProfile()
	self:processEvent( {
		name = "options_refresh",
		controller = event.controller
	} )
end

CoD.Menu.OpenRefetchWADConfirmationPopup = function ( self, event )
	if not self.occludedBy then
		self:openPopup( event.popupName, event.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenTexturePackConfirmationPopup = function ( self, event )
	if not self.occludedBy then
		self:openPopup( event.popupName, event.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenKeyboardTextFieldPopup = function ( self, event )
	if CoD.isPC and not self.occludedBy then
		local popup = OpenPopup( self, "KeyboardTextField", event.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenPopupEventHandler = function ( self, event )
	if self.occludedBy then
		if event.recursive then
			return 
		else
			return 
		end
	elseif self.menuName ~= event.popupName then
		self:openPopup( event.popupName, event.controller )
	end
	return true
end

CoD.Menu.OpenPlayercard = function ( self, event )
	if self.occludedBy then
		return 
	elseif Engine.IsUserGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	elseif self.menuName ~= "FriendPopup" and self.menuName ~= "MainMenu" then
		CoD.FriendPopup.SelectedPlayerXuid = event.selectedPlayerXuid
		CoD.FriendPopup.SelectedPlayerName = event.selectedFriendName
		self:openPopup( "FriendPopup", event.controller )
	end
	return true
end

CoD.Menu.updateButtonPromptBarsForSplitscreen = function ( self )
	
end

CoD.Menu.OpenFrontendSaveGameWarningPopup = function ( self, event )
	local controller = Engine.GetPrimaryController()
	self:openPopup( "FrontendSaveGameWarningPopup", controller, event )
end

CoD.Menu.OpenFrontendSaveGameErrorPopup = function ( self, event )
	local controller = Engine.GetPrimaryController()
	self:openPopup( "FrontendSaveGameErrorPopup", controller, event )
end

CoD.Menu.updateElementState = function ( self, element, event )
	local newState = nil
	if element.stateConditions then
		for index, stateCondition in ipairs( element.stateConditions ) do
			if not stateCondition.condition or stateCondition.condition( self, element, event ) then
				newState = stateCondition.stateName
				break
			end
		end
	end
	if not newState then
		newState = "DefaultState"
	end
	if newState ~= element.currentState or element.ignoreCurrentStateCheck then
		local inFocus = element:isInFocus()
		element:setState( newState )
		if inFocus then
			element:playClip( "Focus" )
		end
		element.currentState = newState
	end
end

CoD.Menu.removeButtonPrompt = function ( self, button, element )
	local buttonPromptWidgetName = "buttonPrompt_" .. button
	local buttonPromptWidget = self[buttonPromptWidgetName]
	if buttonPromptWidget then
		if buttonPromptWidget.elementThatAddedButtonPrompt and buttonPromptWidget.elementThatAddedButtonPrompt ~= element then
			return 
		end
		buttonPromptWidget:close()
	end
end

CoD.Menu.OpenMenu = function ( self, event )
	if self.occludedMenu then
		return 
	elseif self.menuName == event.menuName then
		return 
	else
		local userData = self.userData
		local menuName = self.menuName
		local occludedMenu = self.occludedMenu
		local parent = self:getParent()
		self:close()
		local menu = self:replaceMenu( event.menuName, event.controller, nil, nil, menuName, occludedMenu, parent )
		local f65_local0 = menu:getParent()
		f65_local0:processEvent( {
			name = "menu_changed",
			prevMenu = self,
			nextMenu = menu,
			controller = event.controller
		} )
	end
end

CoD.Menu.GetNavigationForMenu = function ( controller, menuName )
	if not CoD.MenuNavigation then
		return 
	end
	local navStack = CoD.MenuNavigation[controller]
	if not navStack then
		return 
	end
	for navStackIndex = #navStack, 1, -1 do
		local stack = navStack[navStackIndex]
		for menuIndex = #stack, 1, -1 do
			if stack[menuIndex] == menuName then
				return navStackIndex, menuIndex
			end
		end
	end
end

CoD.Menu.GetNavigationForMenuToMenu = function ( controller, menuName, otherMenu )
	if not CoD.MenuNavigation then
		return 
	end
	local navStack = CoD.MenuNavigation[controller]
	if not navStack then
		return 
	end
	for navStackIndex = #navStack, 1, -1 do
		local stack = navStack[navStackIndex]
		for menuIndex = #stack, 1, -1 do
			if stack[menuIndex] == menuName then
				for previousMenuIndex = menuIndex - 1, 1, -1 do
					if stack[previousMenuIndex] == otherMenu then
						return navStackIndex, previousMenuIndex
					end
				end
			end
		end
	end
end

CoD.Menu.RatGetMenuInfo = function ( self, event )
	if Rat ~= nil then
		Rat.HandleGetRatMenuInfo( self, event )
	end
end

CoD.Menu.UpdateAllButtonPrompts = function ( self, controller )
	if self.buttonSubscriptions ~= nil then
		for key, value in pairs( self.buttonSubscriptions ) do
			CoD.Menu.UpdateButtonShownState( nil, self, controller, key )
		end
	end
end

CoD.Menu.RecordCurrFocusedElemID = function ( self, event )
	if event.idStack then
		table.insert( event.idStack, 1, self.id )
	end
	self.lastFocusedElemEvent = event
	if LUI.DEV ~= nil then
		local focusStringWithStates = ""
		if Dvar.ui_currFocusList:exists() then
			local focusString = ""
			if self.lastFocusedElemEvent and self.lastFocusedElemEvent.idStack then
				local lastFocusedElemEvent = self.lastFocusedElemEvent
				local element = self
				local startIndex = 2
				focusStringWithStates = self.id .. "(" .. (self.currentState or "none") .. ")"
				while lastFocusedElemEvent ~= nil do
					for i = startIndex, #lastFocusedElemEvent.idStack, 1 do
						element = element[lastFocusedElemEvent.idStack[i]]
						if not element then
							focusString = focusString .. ".<not found>"
							focusStringWithStates = focusStringWithStates .. ".<not found>"
							break
						end
						focusString = focusString .. "." .. element.id
						local extraData = element.currentState
						focusStringWithStates = focusStringWithStates .. "." .. element.id .. "(" .. (extraData or "none") .. ")"
					end
					if not element then
						
					end
					lastFocusedElemEvent = lastFocusedElemEvent.originalEvent
					startIndex = 1
				end
			end
			Dvar.ui_currFocusList:set( focusString )
		end
		if Dvar.ui_currFocusStates:exists() then
			Dvar.ui_currFocusStates:set( focusStringWithStates )
		end
	end
	if event.controller ~= nil then
		CoD.Menu.UpdateAllButtonPrompts( self, event.controller )
	end
	return true
end

CoD.Menu.ClearRecordedFocus = function ( self, event )
	self.lastFocusedElemEvent = nil
	if nil ~= LUI.DEV and Dvar.ui_currFocusList:exists() then
		Dvar.ui_currFocusList:set( "" )
		Dvar.ui_currFocusStates:set( "" )
	end
	if event.controller ~= nil then
		CoD.Menu.UpdateAllButtonPrompts( self, event.controller )
	end
	return true
end

CoD.Menu.subscribeToCurrAnimationModel = function ( self )
	local model = Engine.CreateModel( self:getModel(), "current_animation" )
	self:subscribeToModel( model, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			if modelValue == "" and self.lastAnimPlayed then
				modelValue = self.lastAnimPlayed
			elseif modelValue ~= "" then
				self.lastAnimPlayed = modelValue
			end
			self:playClip( modelValue )
		end
	end )
end

CoD.Menu.subscribeToCloseMenuModel = function ( self )
	local model = self:getModel( Engine.GetPrimaryController(), "close_current_menu" )
	if model then
		self:subscribeToModel( model, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue and modelValue == 1 then
				self:close()
			end
		end )
	end
end

CoD.Menu:registerEventHandler( "debug_reload", CoD.Menu.DebugReload )
CoD.Menu:registerEventHandler( "occlusion_change", CoD.Menu.OcclusionChange )
CoD.Menu:registerEventHandler( "open_menu", CoD.Menu.OpenMenu )
CoD.Menu:registerEventHandler( "gamepad_button", CoD.Menu.GamepadButton )
CoD.Menu:registerEventHandler( "menu_changed", CoD.Menu.MenuChanged )
CoD.Menu:registerEventHandler( "signed_out", CoD.Menu.UserSignedOut )
CoD.Menu:registerEventHandler( "close_all_popups", CoD.Menu.MenuChanged )
CoD.Menu:registerEventHandler( "open_refetch_wad_confirmation_popup", CoD.Menu.OpenRefetchWADConfirmationPopup )
CoD.Menu:registerEventHandler( "open_texture_pack_confirmation_popup", CoD.Menu.OpenTexturePackConfirmationPopup )
CoD.Menu:registerEventHandler( "open_keyboard_text_field_popup", CoD.Menu.OpenKeyboardTextFieldPopup )
CoD.Menu:registerEventHandler( "open_popup", CoD.Menu.OpenPopupEventHandler )
CoD.Menu:registerEventHandler( "open_overlay", CoD.Menu.OpenOverlay )
CoD.Menu:registerEventHandler( "open_friend_popup", CoD.Menu.OpenPlayercard )
CoD.Menu:registerEventHandler( "set_action_prompt_string", CoD.Menu.SetActionPromptString )
CoD.Menu:registerEventHandler( "resolution_changed", CoD.Menu.ResolutionChanged )
CoD.Menu:registerEventHandler( "rat_get_menu_info_internal", CoD.Menu.RatGetMenuInfo )
CoD.Menu:registerEventHandler( "record_curr_focused_elem_id", CoD.Menu.RecordCurrFocusedElemID )
CoD.Menu:registerEventHandler( "clear_recorded_focus", CoD.Menu.ClearRecordedFocus )
CoD.InGameMenu.CloseAllInGameMenus = function ( self, event )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		if CoD.InGameMenu.m_unpauseDisabled == nil then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] = 0
	end
	self:dispatchEventToChildren( event )
	if not self.m_inputDisabled then
		self.previousMenuName = nil
		self:goBack()
		if self.occludedMenu then
			self.occludedMenu:processEvent( event )
		end
	end
end

CoD.InGameMenu:registerEventHandler( "close_all_ingame_menus", CoD.InGameMenu.CloseAllInGameMenus )
