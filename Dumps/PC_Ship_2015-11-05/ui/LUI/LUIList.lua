require( "ui.LUI.LUIVerticalList" )
require( "ui.LUI.LUIGridLayout" )

LUI.UIList = InheritFrom( LUI.GridLayout )
local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0.m_eventHandlers[f1_arg1]
	if f1_local0 then
		f1_arg0:registerEventHandler( f1_arg1, function ( element, event )
			f1_local0( element, event )
			return f1_arg2( element, event )
		end )
	else
		f1_arg0:registerEventHandler( f1_arg1, f1_arg2 )
	end
end

local f0_local1 = function ( f3_arg0, f3_arg1 )
	f0_local0( f3_arg1, "gain_focus", function ( f4_arg0, f4_arg1 )
		if not f4_arg1.sourceType or f4_arg1.sourceType ~= "list" then
			if f4_arg1.isMouse then
				if not f3_arg0.hasListFocus then
					f3_arg0:processEvent( {
						name = "gain_focus",
						controller = f4_arg1.controller,
						selectedIndex = f4_arg0.gridInfoTable.zeroBasedIndex
					} )
				end
				f3_arg0.super:setActiveItem( f4_arg0 )
				f3_arg0:setListItemInFocus( f3_arg1, nil, f4_arg1.isMouse )
				if not f3_arg0:playSound( "list_up" ) then
					f3_arg0:playSound( "list_right" )
				end
				return true
			else
				f4_arg0:updateFocusEvent()
				return true
			end
		elseif not f3_arg0.m_managedItemPriority then
			f4_arg0:setPriority( 100 )
		end
		f4_arg0.super:gainFocus( f4_arg1 )
		f4_arg0:dispatchEventToChildren( f4_arg1 )
		local f4_local0 = LUI.ShallowCopy( f4_arg1 )
		f4_local0.name = "list_item_gain_focus"
		f4_arg0:dispatchEventToParentWithSelf( f4_local0 )
		if f3_arg0.buttonPromptGainFocusEventHandler then
			f3_arg0.buttonPromptGainFocusEventHandler( f4_arg0, f4_arg1 )
		end
		return true
	end )
	f0_local0( f3_arg1, "lose_focus", function ( f5_arg0, f5_arg1 )
		if not f3_arg0.m_managedItemPriority then
			f5_arg0:setPriority( 0 )
		end
		f5_arg0.super:loseFocus( f5_arg1 )
		local f5_local0 = LUI.ShallowCopy( f5_arg1 )
		f5_local0.name = "list_item_lose_focus"
		f5_arg0:dispatchEventToParentWithSelf( f5_local0 )
		if f5_arg0 == f3_arg0.activeWidget and not f5_arg1.isMouse then
			f3_arg0:processEvent( {
				name = "lose_focus",
				controller = f5_arg1.controller
			} )
		end
		if f3_arg0.buttonPromptLoseFocusEventHandler then
			f3_arg0.buttonPromptLoseFocusEventHandler( f5_arg0, f5_arg1 )
		end
		return true
	end )
	f3_arg1.navigation = {
		up = f3_arg0.itemNavigationUp,
		down = f3_arg0.itemNavigationDown,
		left = f3_arg0.itemNavigationLeft,
		right = f3_arg0.itemNavigationRight
	}
	f3_arg1.updateFocusEvent = f3_arg0.itemActivate
end

LUI.UIList.GetListItemFromFocusElement = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1 and f6_arg1:getParent()
	while f6_local0 do
		if f6_local0 == f6_arg0 then
			break
		end
		f6_arg1 = f6_local0
		f6_local0 = f6_local0:getParent()
	end
	return f6_arg1
end

LUI.UIList.new = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6, f7_arg7, f7_arg8, f7_arg9, f7_arg10 )
	local f7_local0 = LUI.GridLayout.new( f7_arg0, f7_arg1, true, 0, 0, f7_arg2, f7_arg3, f0_local1, f7_arg4, f7_arg5, f7_arg6, f7_arg7, f7_arg8, f7_arg9, f7_arg10 )
	f7_local0:setClass( LUI.UIList )
	f7_local0.isUIList = true
	f7_local0.m_focusable = true
	CoD.Menu.AddButtonCallbackFunction( f7_arg0, f7_local0, f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, f8_arg3 )
		if element == f7_local0.activeWidget then
			if CoD.Menu.AnyButtonConditionTrue( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS ) then
				f7_local0:playSound( "list_action" )
			elseif CoD.isPC and not IsGamepad( controller ) and not f7_local0.m_disableNavigation then
				local f8_local0 = f7_local0.vCount == 1
				local f8_local1 = f7_local0.hCount == 1
				if f8_local0 and f7_local0:navigateItemRight() then
					return true
				elseif f8_local1 and f7_local0:navigateItemDown() then
					return true
				end
			end
		end
		return false
	end )
	f7_local0.itemActivate = function ( f9_arg0, f9_arg1 )
		f7_local0:setActiveItem( f9_arg0 )
	end
	
	CoD.Menu.AddButtonCallbackFunction( f7_arg0, f7_local0, f7_arg1, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( element, menu, controller, f10_arg3 )
		if not f7_local0.m_disableNavigation and (not (not f7_local0.dpadDisabled or not IsDpadButton( f10_arg3 )) or f7_local0:navigateItemUp()) then
			return true
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f7_arg0, f7_local0, f7_arg1, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( element, menu, controller, f11_arg3 )
		if not f7_local0.m_disableNavigation and (not (not f7_local0.dpadDisabled or not IsDpadButton( f11_arg3 )) or f7_local0:navigateItemDown()) then
			return true
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f7_arg0, f7_local0, f7_arg1, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, f12_arg3 )
		if not f7_local0.m_disableNavigation and (not (not f7_local0.dpadDisabled or not IsDpadButton( f12_arg3 )) or f7_local0:navigateItemLeft()) then
			return true
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f7_arg0, f7_local0, f7_arg1, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, f13_arg3 )
		if not f7_local0.m_disableNavigation and (not (not f7_local0.dpadDisabled or not IsDpadButton( f13_arg3 )) or f7_local0:navigateItemRight()) then
			return true
		else
			
		end
	end )
	if CoD.isPC then
		CoD.Menu.AddButtonCallbackFunction( f7_arg0, f7_local0, f7_arg1, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELUP, "MWHEELUP", function ( element, menu, controller, f14_arg3 )
			if not f7_local0.m_disableNavigation then
				return f7_local0:scrollUp()
			else
				
			end
		end )
		CoD.Menu.AddButtonCallbackFunction( f7_arg0, f7_local0, f7_arg1, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELDOWN, "MWHEELDOWN", function ( element, menu, controller, f15_arg3 )
			if not f7_local0.m_disableNavigation then
				return f7_local0:scrollDown()
			else
				
			end
		end )
	end
	return f7_local0
end

LUI.UIList.isWidgetSelectable = function ( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg1:hasClip( "Focus" )
	if not f16_local0 then
		f16_local0 = f16_arg1.onlyChildrenFocusable
		if not f16_local0 then
			f16_local0 = f16_arg0.super:isWidgetSelectable( f16_arg1 )
		end
	end
	return f16_local0
end

LUI.UIList.setListItemInFocus = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
	if f17_arg0.hasListFocus then
		if f17_arg1 and (not f17_arg1.gridInfoTable or f17_arg1.gridInfoTable.parentGrid ~= f17_arg0) then
			f17_arg1 = nil
		end
		if f17_arg1 and f17_arg1:getModel() then
			f17_arg1:processEvent( {
				name = "gain_focus",
				controller = f17_arg0.controller,
				sourceType = "list",
				skipGainFocus = f17_arg2,
				isMouse = f17_arg3
			} )
			f17_arg0:dispatchEventToParent( {
				name = "list_focus_changed",
				list = f17_arg0,
				model = f17_arg1:getModel()
			} )
		end
		return f17_arg1
	else
		return nil
	end
end

LUI.UIList.setActiveItem = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	local f18_local0 = f18_arg0.activeWidget
	f18_arg0.super:setActiveItem( f18_arg1, f18_arg2 )
	f18_arg0:setListItemInFocus( f18_arg1, f18_arg3 )
	if f18_local0 and f18_local0 ~= f18_arg0.activeWidget then
		f18_local0:processEvent( {
			name = "lose_focus",
			controller = f18_arg0.controller,
			skipLoseFocus = f18_arg4
		} )
	end
end

LUI.UIList.gainFocus = function ( f19_arg0, f19_arg1 )
	if not f19_arg0.m_focusable then
		return false
	end
	local f19_local0 = f19_arg0.vCount == 1
	local f19_local1 = f19_arg0.hCount == 1
	local f19_local2
	if not f19_arg0.ignoreSavedActive then
		if f19_arg1.button and (not f19_local1 or f19_arg1.button ~= "left" and f19_arg1.button ~= "right") then
			local f19_local3 = f19_local0
			if f19_arg1.button ~= "up" and f19_arg1.button ~= "down" then
				f19_local2 = false
			end
		end
		f19_local2 = f19_local3 and true
	end
	f19_local2 = false
end

LUI.UIList.loseFocus = function ( f20_arg0, f20_arg1 )
	if f20_arg0.hasListFocus then
		local f20_local0 = f20_arg0.activeWidget
		f20_arg0:setActiveItem( nil )
		f20_arg0.hasListFocus = false
		f20_arg0:processEvent( {
			name = "update_state",
			menu = f20_arg0.menu
		} )
		f20_arg0.super:setActiveItem( f20_local0 )
		f20_arg0:processEventToParent( {
			name = "lose_list_focus",
			controller = f20_arg0.controller
		} )
		return true
	else
		return false
	end
end

LUI.UIList.RecordCurrFocusedElemID = function ( f21_arg0, f21_arg1 )
	local f21_local0 = f21_arg0.activeWidget
	if f21_local0 then
		f21_arg0:dispatchEventToParent( {
			name = f21_arg1.name,
			controller = f21_arg0.controller,
			id = f21_arg0.id,
			idStack = {
				f21_arg0.id
			},
			listFocus = f21_arg1.id,
			focusRow = f21_local0.gridInfoTable.gridRowIndex,
			focusColumn = f21_local0.gridInfoTable.gridColIndex,
			originalEvent = f21_arg1
		} )
		return true
	else
		return false
	end
end

LUI.UIList.processButtonAction = function ( f22_arg0, f22_arg1 )
	if f22_arg0.hasListFocus then
		return f22_arg0:dispatchEventToChildren( f22_arg1 )
	else
		return false
	end
end

LUI.UIList.updateButtonPromptEventHandlers = function ( f23_arg0 )
	f23_arg0.buttonPromptGainFocusEventHandler = f23_arg0.m_eventHandlers.gain_focus
	f23_arg0.buttonPromptLoseFocusEventHandler = f23_arg0.m_eventHandlers.lose_focus
	f23_arg0.buttonPromptGamepadButtonEventHandler = f23_arg0.m_eventHandlers.gamepad_button
	if f23_arg0.customWidgetSetup then
		local f23_local0 = f23_arg0.customWidgetSetup
		f23_arg0.customWidgetSetup = function ( f24_arg0, f24_arg1 )
			f23_local0( f24_arg0, f24_arg1 )
			f24_arg1:registerEventHandler( "gamepad_button", function ( element, event )
				if element == f24_arg0.activeWidget then
					local f25_local0 = element:handleGamepadButton( event )
					if not f25_local0 and f24_arg0.buttonPromptGamepadButtonEventHandler then
						f25_local0 = f24_arg0.buttonPromptGamepadButtonEventHandler( element, event )
					end
					return f25_local0
				else
					
				end
			end )
			f24_arg1.buttonPromptAddFunctions = f24_arg0.buttonPromptAddFunctions
		end
		
	end
	f23_arg0:clearLayout( true )
	f23_arg0:updateLayout( 0 )
	f23_arg0.m_eventHandlers.gain_focus = LUI.UIList.gainFocus
	f23_arg0.m_eventHandlers.lose_focus = LUI.UIList.loseFocus
	f23_arg0.m_eventHandlers.gamepad_button = nil
end

LUI.UIList.disableDPadNav = function ( f26_arg0, f26_arg1 )
	f26_arg0.dpadDisabled = f26_arg1
end

LUI.UIList:registerEventHandler( "gain_focus", LUI.UIList.gainFocus )
LUI.UIList:registerEventHandler( "lose_focus", LUI.UIList.loseFocus )
LUI.UIList:registerEventHandler( "record_curr_focused_elem_id", LUI.UIList.RecordCurrFocusedElemID )
LUI.UIList:registerEventHandler( "button_action", LUI.UIList.processButtonAction )
LUI.UIList.id = "LUIList"
LUI.UIList.setActiveOnUpdate = false
