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
	widget:appendEventHandler( "gain_focus", function ( listItem, event )
		if not event.sourceType or event.sourceType ~= "list" then
			if event.isMouse then
				if not self.hasListFocus then
					self:processEvent( {
						name = "gain_focus",
						controller = event.controller,
						selectedIndex = listItem.gridInfoTable.zeroBasedIndex
					} )
				end
				self.super:setActiveItem( listItem )
				self:setListItemInFocus( widget, nil, event.isMouse )
				if not self:playSound( "list_up" ) then
					self:playSound( "list_right" )
				end
				return true
			else
				self:setActiveItem( listItem )
				return true
			end
		elseif not self.m_managedItemPriority then
			listItem:setPriority( 100 )
		end
		listItem:gainFocus( event )
		listItem:dispatchEventToChildren( event )
		local newEvent = LUI.ShallowCopy( event )
		newEvent.name = "list_item_gain_focus"
		listItem:dispatchEventToParentWithSelf( newEvent )
	end )
	widget:appendEventHandler( "lose_focus", function ( listItem, event )
		if not self.m_managedItemPriority then
			listItem:setPriority( 0 )
		end
		local newEvent = LUI.ShallowCopy( event )
		newEvent.keepSelected = listItem == self.currentSelection
		listItem:loseFocus( newEvent )
		newEvent = LUI.ShallowCopy( event )
		newEvent.name = "list_item_lose_focus"
		self:dispatchEventToParentWithElement( newEvent, listItem )
		if listItem == self.activeWidget then
			if self.currentSelection then
				self:setActiveItem( self.currentSelection )
			end
			if not event.isMouse then
				self:processEvent( {
					name = "lose_focus",
					controller = event.controller
				} )
			end
		end
	end )
	widget.navigation = {
		up = self.itemNavigationUp,
		down = self.itemNavigationDown,
		left = self.itemNavigationLeft,
		right = self.itemNavigationRight
	}
end

LUI.UIList.new = function ( menu, controller, spacing, scrollTime, filter, loopEdges, activeWidgetInPlace, firstElementXOffset, firstElementYOffset, placeMovedElementOnEnd, itemStencilEnabled )
	local self = LUI.GridLayout.new( menu, controller, true, 0, 0, spacing, scrollTime, LUI_List_CustomWidgetSetup, filter, loopEdges, activeWidgetInPlace, firstElementXOffset, firstElementYOffset, placeMovedElementOnEnd, itemStencilEnabled )
	self:setClass( LUI.UIList )
	self.isUIList = true
	self.m_focusable = true
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if element == self.activeWidget then
			if CoD.Menu.AnyButtonConditionTrue( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS ) then
				self:playSound( "list_action" )
			elseif CoD.isPC and not IsGamepad( controller ) and not self.m_disableNavigation and self:navigateItemRight() then
				return true
			end
		end
		return false
	end )
	if not IsFreeCursorActive( controller ) then
		CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( element, menu, controller, model )
			if not self.m_disableNavigation and (not (not self.dpadDisabled or not IsDpadButton( model )) or self:navigateItemUp()) then
				return true
			else
				
			end
		end )
		CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( element, menu, controller, model )
			if not self.m_disableNavigation and (not (not self.dpadDisabled or not IsDpadButton( model )) or self:navigateItemDown()) then
				return true
			else
				
			end
		end )
	end
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, model )
		if not self.m_disableNavigation and (not (not self.dpadDisabled or not IsDpadButton( model )) or self:navigateItemLeft()) then
			return true
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, model )
		if not self.m_disableNavigation and (not (not self.dpadDisabled or not IsDpadButton( model )) or self:navigateItemRight()) then
			return true
		else
			
		end
	end )
	if CoD.isPC then
		CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELUP, "MWHEELUP", function ( element, menu, controller, model )
			if not self.m_disableNavigation then
				return self:scrollUp()
			else
				
			end
		end )
		CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELDOWN, "MWHEELDOWN", function ( element, menu, controller, model )
			if not self.m_disableNavigation then
				return self:scrollDown()
			else
				
			end
		end )
	end
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

LUI.UIList.setListItemInFocus = function ( self, listItem, skipGainFocus, isMouse )
	if self.hasListFocus then
		if listItem and (not listItem.gridInfoTable or listItem.gridInfoTable.parentGrid ~= self) then
			listItem = nil
		end
		if listItem and listItem:getModel() then
			listItem:processEvent( {
				name = "gain_focus",
				controller = self.controller,
				sourceType = "list",
				skipGainFocus = skipGainFocus,
				isMouse = isMouse
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

LUI.UIList.setRetainedFocusElement = function ( self, widget )
	if self.currentSelection ~= widget then
		if self.currentSelection then
			self.currentSelection:playClip( "DefaultClip" )
		end
		self.currentSelection = widget
	end
end

LUI.UIList.gainFocus = function ( self, event )
	if not self.m_focusable then
		return false
	end
	local f18_local0 = self.vCount == 1
	local f18_local1 = self.hCount == 1
	local f18_local2
	if not self.ignoreSavedActive then
		if event.button and (not f18_local1 or event.button ~= "left" and event.button ~= "right") then
			local f18_local3 = f18_local0
			if event.button ~= "up" and event.button ~= "down" then
				f18_local2 = false
			end
		end
		local shouldUseSavedActiveIndex = true
		f18_local2 = f18_local3 and shouldUseSavedActiveIndex
	end
	f18_local2 = false
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
	local activeWidget = nil
	if IsFreeCursorActive( event.controller ) then
		if not self.hasListFocus then
			self.hasListFocus = true
			self:processEventToParent( {
				name = "gain_list_focus",
				controller = self.controller
			} )
		end
		if #event.idStack >= 2 and self[event.idStack[1]] then
			if event.idStack[1] == "itemStencil" then
				activeWidget = self[event.idStack[1]][event.idStack[2]]
				self.super:setActiveItem( activeWidget, 0 )
			else
				self:dispatchEventToParent( {
					name = event.name,
					controller = self.controller,
					id = self.id,
					idStack = {
						self.id
					},
					listFocus = event.id,
					originalEvent = event
				} )
				return true
			end
		end
	else
		activeWidget = self.activeWidget
	end
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
	end
	return false
end

LUI.UIList.ClearRecordedFocus = function ( self, event )
	if self.hasListFocus then
		self.hasListFocus = false
		self:processEventToParent( {
			name = "lose_list_focus",
			controller = self.controller
		} )
	end
end

LUI.UIList.processButtonAction = function ( self, event )
	if self.hasListFocus then
		return self:dispatchEventToChildren( event )
	else
		return false
	end
end

LUI.UIList.disableDPadNav = function ( self, disable )
	self.dpadDisabled = disable
end

LUI.UIList:registerEventHandler( "gain_focus", LUI.UIList.gainFocus )
LUI.UIList:registerEventHandler( "lose_focus", LUI.UIList.loseFocus )
LUI.UIList:registerEventHandler( "record_curr_focused_elem_id", LUI.UIList.RecordCurrFocusedElemID )
LUI.UIList:registerEventHandler( "clear_recorded_focus", LUI.UIList.ClearRecordedFocus )
LUI.UIList:registerEventHandler( "button_action", LUI.UIList.processButtonAction )
LUI.UIList.id = "LUIList"
LUI.UIList.setActiveOnUpdate = false
