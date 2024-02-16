require( "ui.LUI.LUIVerticalList" )
require( "ui.LUI.LUIGridLayout" )

LUI.UIList = InheritFrom( LUI.GridLayout )
local LUI_List_SetupNewEVHandler = function ( widget, eventName, eventFn )
	local currentEvFn = widget.m_eventHandlers[eventName]
	if currentEvFn then
		widget:registerEventHandler( eventName, function ( listItem, event )
			currentEvFn( listItem, event )
			return eventFn( listItem, event )
		end )
	else
		widget:registerEventHandler( eventName, eventFn )
	end
end

local LUI_List_CustomWidgetSetup = function ( self, widget )
	LUI_List_SetupNewEVHandler( widget, "gain_focus", function ( listItem, event )
		if not event.sourceType or event.sourceType ~= "list" then
			if event.isMouse then
				self.super:setActiveItem( listItem )
				self:setListItemInFocus( widget )
				self:playSound( "list_up" )
				return true
			else
				listItem:updateFocusEvent()
				return true
			end
		elseif not self.m_managedItemPriority then
			listItem:setPriority( 100 )
		end
		listItem.super:gainFocus( event )
		listItem:dispatchEventToChildren( event )
		local newEvent = LUI.ShallowCopy( event )
		newEvent.name = "list_item_gain_focus"
		listItem:dispatchEventToParentWithSelf( newEvent )
		if self.buttonPromptGainFocusEventHandler then
			self.buttonPromptGainFocusEventHandler( listItem, event )
		end
		return true
	end )
	LUI_List_SetupNewEVHandler( widget, "lose_focus", function ( listItem, event )
		if not self.m_managedItemPriority then
			listItem:setPriority( 0 )
		end
		listItem.super:loseFocus( event )
		local newEvent = LUI.ShallowCopy( event )
		newEvent.name = "list_item_lose_focus"
		listItem:dispatchEventToParentWithSelf( newEvent )
		if listItem == self.activeWidget and not event.isMouse then
			self:processEvent( {
				name = "lose_focus",
				controller = event.controller
			} )
		end
		if self.buttonPromptLoseFocusEventHandler then
			self.buttonPromptLoseFocusEventHandler( listItem, event )
		end
		return true
	end )
	widget.navigation = {
		up = self.itemNavigationUp,
		down = self.itemNavigationDown,
		left = self.itemNavigationLeft,
		right = self.itemNavigationRight
	}
	widget.updateFocusEvent = self.itemActivate
end

LUI.UIList.GetListItemFromFocusElement = function ( list, element )
	local f6_local0 = element
	local parent = element:getParent()
	local f6_local1 = f6_local0 and parent
	while f6_local1 do
		if f6_local1 == list then
			break
		end
		element = f6_local1
		f6_local1 = f6_local1:getParent()
	end
	return element
end

LUI.UIList.new = function ( menu, controller, spacing, scrollTime, filter, loopEdges, activeWidgetInPlace, firstElementXOffset, firstElementYOffset, placeMovedElementOnEnd, itemStencilEnabled )
	local self = LUI.GridLayout.new( menu, controller, true, 0, 0, spacing, scrollTime, LUI_List_CustomWidgetSetup, filter, loopEdges, activeWidgetInPlace, firstElementXOffset, firstElementYOffset, placeMovedElementOnEnd, itemStencilEnabled )
	self:setClass( LUI.UIList )
	self.isUIList = true
	self.m_focusable = true
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if element == self.activeWidget and CoD.Menu.AnyButtonConditionTrue( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS ) then
			self:playSound( "list_action" )
		end
		return false
	end )
	self.itemActivate = function ( element, controller )
		self:setActiveItem( element )
	end
	
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( element, menu, controller, model )
		if not self.m_disableNavigation and self:navigateItemUp() then
			return true
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( element, menu, controller, model )
		if not self.m_disableNavigation and self:navigateItemDown() then
			return true
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, model )
		if not self.m_disableNavigation and self:navigateItemLeft() then
			return true
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, model )
		if not self.m_disableNavigation and self:navigateItemRight() then
			return true
		else
			
		end
	end )
	return self
end

LUI.UIList.isWidgetSelectable = function ( self, widget )
	local f14_local0 = widget:hasClip( "Focus" )
	if not f14_local0 then
		f14_local0 = widget.onlyChildrenFocusable
		if not f14_local0 then
			f14_local0 = self.super:isWidgetSelectable( widget )
		end
	end
	return f14_local0
end

LUI.UIList.setListItemInFocus = function ( self, listItem, skipGainFocus )
	if self.hasListFocus then
		if listItem and (not listItem.gridInfoTable or listItem.gridInfoTable.parentGrid ~= self) then
			listItem = nil
		end
		if listItem and listItem:getModel() then
			listItem:processEvent( {
				name = "gain_focus",
				controller = self.controller,
				sourceType = "list",
				skipGainFocus = skipGainFocus
			} )
			self:dispatchEventToParent( {
				name = "list_focus_changed",
				list = self,
				model = listItem:getModel()
			} )
		end
		return listItem
	else
		return nil
	end
end

LUI.UIList.setActiveItem = function ( self, widget, overrideScrollTime, skipGainFocus, skipLoseFocus )
	local lastActive = self.activeWidget
	self.super:setActiveItem( widget, overrideScrollTime )
	self:setListItemInFocus( widget, skipGainFocus )
	if lastActive and lastActive ~= self.activeWidget then
		lastActive:processEvent( {
			name = "lose_focus",
			controller = self.controller,
			skipLoseFocus = skipLoseFocus
		} )
	end
end

LUI.UIList.gainFocus = function ( self, event )
	if not self.m_focusable then
		return false
	end
	local f17_local0 = self.vCount == 1
	local f17_local1 = self.hCount == 1
	local f17_local2
	if not self.ignoreSavedActive then
		if event.button and (not f17_local1 or event.button ~= "left" and event.button ~= "right") then
			local f17_local3 = f17_local0
			if event.button ~= "up" and event.button ~= "down" then
				f17_local2 = false
			end
		end
		local shouldUseSavedActiveIndex = true
		f17_local2 = f17_local3 and shouldUseSavedActiveIndex
	end
	f17_local2 = false
end

LUI.UIList.loseFocus = function ( self, event )
	if self.hasListFocus then
		local activeWidget = self.activeWidget
		self:setActiveItem( nil )
		self.hasListFocus = false
		self:processEvent( {
			name = "update_state",
			menu = self.menu
		} )
		self.super:setActiveItem( activeWidget )
		self:processEventToParent( {
			name = "lose_list_focus",
			controller = self.controller
		} )
		return true
	else
		return false
	end
end

LUI.UIList.RecordCurrFocusedElemID = function ( self, event )
	local activeWidget = self.activeWidget
	if activeWidget then
		self:dispatchEventToParent( {
			name = event.name,
			controller = self.controller,
			id = self.id,
			idStack = {
				self.id
			},
			listFocus = event.id,
			focusRow = activeWidget.gridInfoTable.gridRowIndex,
			focusColumn = activeWidget.gridInfoTable.gridColIndex,
			originalEvent = event
		} )
		return true
	else
		return false
	end
end

LUI.UIList.processButtonAction = function ( self, event )
	if self.hasListFocus then
		return self:dispatchEventToChildren( event )
	else
		return false
	end
end

LUI.UIList.updateButtonPromptEventHandlers = function ( self )
	self.buttonPromptGainFocusEventHandler = self.m_eventHandlers.gain_focus
	self.buttonPromptLoseFocusEventHandler = self.m_eventHandlers.lose_focus
	self.buttonPromptGamepadButtonEventHandler = self.m_eventHandlers.gamepad_button
	if self.customWidgetSetup then
		local customWidgetSetupFunc = self.customWidgetSetup
		self.customWidgetSetup = function ( self, widget )
			customWidgetSetupFunc( self, widget )
			widget:registerEventHandler( "gamepad_button", function ( widget, event )
				if widget == self.activeWidget then
					local retVal = widget:handleGamepadButton( event )
					if not retVal and self.buttonPromptGamepadButtonEventHandler then
						retVal = self.buttonPromptGamepadButtonEventHandler( widget, event )
					end
					return retVal
				else
					
				end
			end )
			widget.buttonPromptAddFunctions = self.buttonPromptAddFunctions
		end
		
	end
	self:clearLayout( true )
	self:updateLayout( 0 )
	self.m_eventHandlers.gain_focus = LUI.UIList.gainFocus
	self.m_eventHandlers.lose_focus = LUI.UIList.loseFocus
	self.m_eventHandlers.gamepad_button = nil
end

LUI.UIList:registerEventHandler( "gain_focus", LUI.UIList.gainFocus )
LUI.UIList:registerEventHandler( "lose_focus", LUI.UIList.loseFocus )
LUI.UIList:registerEventHandler( "record_curr_focused_elem_id", LUI.UIList.RecordCurrFocusedElemID )
LUI.UIList:registerEventHandler( "button_action", LUI.UIList.processButtonAction )
LUI.UIList.id = "LUIList"
LUI.UIList.setActiveOnUpdate = false
