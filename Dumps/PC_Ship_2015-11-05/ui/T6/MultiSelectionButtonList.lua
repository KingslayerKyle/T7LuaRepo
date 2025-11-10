require( "ui.T6.ButtonList" )
require( "ui.T6.MultiSelectionButton" )
require( "ui.T6.ScrollingVerticalList" )

CoD.MultiSelectionButtonList = {}
CoD.MultiSelectionButtonList.AddButton = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	local f1_local0 = {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.textSize.Default,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	if f1_arg0.buttonCount == nil then
		f1_arg0.buttonCount = 0
	end
	f1_arg0.buttonCount = f1_arg0.buttonCount + 1
	local f1_local1 = CoD.MultiSelectionButton.New( f1_local0, nil, "Default", f1_arg0.buttonCount )
	f1_local1.hintText = f1_arg2
	f1_local1.isLocked = CoD.MultiSelectionButtonList.Button_IsLocked
	f1_local1.isPurchased = CoD.MultiSelectionButtonList.Button_IsPurchased
	f1_local1.canBeUnlocked = CoD.MultiSelectionButtonList.Button_CanBeUnlocked
	f1_local1.isSelected = CoD.MultiSelectionButtonList.Button_IsSelected
	f1_local1:setPriority( f1_arg3 )
	f1_local1:setLabel( f1_arg1, "Default", CoD.MultiSelectionButton.TextLeft )
	if f1_arg0.selectedMaterialName then
		f1_local1.selectedMaterialName = f1_arg0.selectedMaterialName
	end
	f1_arg0:addElementToList( f1_local1 )
	if f1_arg4 ~= nil and f1_arg5 ~= nil then
		CoD.Menu.AddButtonCallbackFunction( f1_arg4, f1_arg0, f1_arg5, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, f2_arg3 )
			element:processEvent( {
				name = "button_action",
				controller = controller,
				button = f1_arg0
			} )
			if f1_arg0.actionSFX ~= nil then
				Engine.PlaySound( f1_arg0.actionSFX )
			end
			return true
		end )
	end
	CoD.ButtonList.AssociateHintTextListenerToButton( f1_local1 )
	return f1_local1
end

CoD.MultiSelectionButtonList.SetMaxSelections = function ( f3_arg0, f3_arg1 )
	f3_arg0.maxSelections = f3_arg1
end

CoD.MultiSelectionButtonList.IncrementSelectionCount = function ( f4_arg0 )
	if f4_arg0.maxSelections and f4_arg0.selectionCount == f4_arg0.maxSelections then
		error( "LUI Error: MultiSelectionButtonList cannot select more than " .. f4_arg0.maxSelections .. " at once." )
	else
		f4_arg0.selectionCount = f4_arg0.selectionCount + 1
	end
end

CoD.MultiSelectionButtonList.DecrementSelectionCount = function ( f5_arg0 )
	if f5_arg0.selectionCount > 0 then
		f5_arg0.selectionCount = f5_arg0.selectionCount - 1
	else
		error( "LUI Error: MultiSelectionButtonList cannot have a selection count of less than 0." )
	end
end

CoD.MultiSelectionButtonList.UpdateSelectionCount = function ( f6_arg0 )
	f6_arg0.selectionCount = 0
	f6_arg0:dispatchEventToChildren( {
		name = "update_selection_count"
	} )
end

CoD.MultiSelectionButtonList.ClearSelectionCount = function ( f7_arg0 )
	f7_arg0.selectionCount = 0
end

CoD.MultiSelectionButtonList.GetLockedCount = function ( f8_arg0 )
	local f8_local0 = 0
	local f8_local1 = f8_arg0:getFirstChild()
	while f8_local1 ~= nil do
		if f8_local1.isLocked ~= nil and f8_local1:isLocked() == true then
			f8_local0 = f8_local0 + 1
		end
		f8_local1 = f8_local1:getNextSibling()
	end
	return f8_local0
end

CoD.MultiSelectionButtonList.Button_IsLocked = function ( f9_arg0 )
	return false
end

CoD.MultiSelectionButtonList.Button_IsPurchased = function ( f10_arg0 )
	return true
end

CoD.MultiSelectionButtonList.Button_CanBeUnlocked = function ( f11_arg0 )
	return false
end

CoD.MultiSelectionButtonList.Button_IsSelected = function ( f12_arg0 )
	return false
end

CoD.MultiSelectionButtonList.New = function ( f13_arg0, f13_arg1 )
	if f13_arg1 == nil then
		f13_arg1 = CoD.ButtonList.ButtonSpacing
	end
	local f13_local0 = CoD.ScrollingVerticalList.new( f13_arg0 )
	f13_local0:setSpacing( f13_arg1 )
	f13_local0.id = "MultiSelectionButtonList"
	f13_local0.selectionCount = 0
	f13_local0:makeFocusable()
	f13_local0:addElement( LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} ) )
	f13_local0:addElement( LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} ) )
	f13_local0.addButton = CoD.MultiSelectionButtonList.AddButton
	f13_local0.setMaxSelections = CoD.MultiSelectionButtonList.SetMaxSelections
	f13_local0.incrementSelectionCount = CoD.MultiSelectionButtonList.IncrementSelectionCount
	f13_local0.decrementSelectionCount = CoD.MultiSelectionButtonList.DecrementSelectionCount
	f13_local0.updateSelectionCount = CoD.MultiSelectionButtonList.UpdateSelectionCount
	f13_local0.clearSelectionCount = CoD.MultiSelectionButtonList.ClearSelectionCount
	f13_local0.getLockedCount = CoD.MultiSelectionButtonList.GetLockedCount
	f13_local0:registerEventHandler( "increment_selection_count", CoD.MultiSelectionButtonList.IncrementSelectionCount )
	f13_local0:registerEventHandler( "increment_locked_count", CoD.MultiSelectionButtonList.IncrementLockedCount )
	f13_local0:registerEventHandler( "update_multi_selection_list", CoD.MultiSelectionButtonList.Update )
	f13_local0:registerEventHandler( "can_unlock_multi_selection_button_action", CoD.MultiSelectionButtonList.CanUnlockButtonAction )
	f13_local0:registerEventHandler( "cannot_unlock_multi_selection_button_action", CoD.MultiSelectionButtonList.CannotUnlockButtonAction )
	f13_local0:registerEventHandler( "deselect_multi_selection_button_action", CoD.MultiSelectionButtonList.DeselectButtonAction )
	f13_local0:registerEventHandler( "select_multi_selection_button_action", CoD.MultiSelectionButtonList.SelectButtonAction )
	f13_local0:registerEventHandler( "can_unlock_multi_selection_button_over", CoD.MultiSelectionButtonList.CanUnlockButtonOver )
	f13_local0:registerEventHandler( "cannot_unlock_multi_selection_button_over", CoD.MultiSelectionButtonList.CannotUnlockButtonOver )
	f13_local0:registerEventHandler( "selected_multi_selection_button_over", CoD.MultiSelectionButtonList.SelectedButtonOver )
	f13_local0:registerEventHandler( "unselected_multi_selection_button_over", CoD.MultiSelectionButtonList.UnselectedButtonOver )
	return f13_local0
end

CoD.MultiSelectionButtonList.Update = function ( f14_arg0, f14_arg1 )
	f14_arg0.lockedCount = 0
	f14_arg0:dispatchEventToChildren( {
		name = "update_multi_selection_list_buttons",
		selectionCountAtMax = f14_arg0.selectionCount == f14_arg0.maxSelections
	} )
end

CoD.MultiSelectionButtonList.CanUnlockButtonAction = function ( f15_arg0, f15_arg1 )
	f15_arg0:dispatchEventToParent( {
		name = "can_unlock_multi_selection_button_action",
		controller = f15_arg1.controller,
		button = f15_arg1.button
	} )
end

CoD.MultiSelectionButtonList.CannotUnlockButtonAction = function ( f16_arg0, f16_arg1 )
	f16_arg0:dispatchEventToParent( {
		name = "cannot_unlock_multi_selection_button_action",
		controller = f16_arg1.controller,
		button = f16_arg1.button
	} )
	Engine.PlaySound( CoD.CACUtility.denySFX )
end

CoD.MultiSelectionButtonList.DeselectButtonAction = function ( f17_arg0, f17_arg1 )
	if not f17_arg0.maxSelections or f17_arg0.selectionCount > 0 then
		f17_arg0:dispatchEventToParent( {
			name = "deselect_multi_selection_button_action",
			controller = f17_arg1.controller,
			button = f17_arg1.button
		} )
	end
end

CoD.MultiSelectionButtonList.SelectButtonAction = function ( f18_arg0, f18_arg1 )
	if not f18_arg0.maxSelections or f18_arg0.selectionCount < f18_arg0.maxSelections then
		f18_arg0:dispatchEventToParent( {
			name = "select_multi_selection_button_action",
			controller = f18_arg1.controller,
			button = f18_arg1.button
		} )
	end
end

CoD.MultiSelectionButtonList.CanUnlockButtonOver = function ( f19_arg0, f19_arg1 )
	f19_arg0:dispatchEventToParent( {
		name = "can_unlock_multi_selection_button_over"
	} )
end

CoD.MultiSelectionButtonList.CannotUnlockButtonOver = function ( f20_arg0, f20_arg1 )
	f20_arg0:dispatchEventToParent( {
		name = "cannot_unlock_multi_selection_button_over"
	} )
end

CoD.MultiSelectionButtonList.SelectedButtonOver = function ( f21_arg0, f21_arg1 )
	f21_arg0:dispatchEventToParent( {
		name = "selected_multi_selection_button_over"
	} )
end

CoD.MultiSelectionButtonList.UnselectedButtonOver = function ( f22_arg0, f22_arg1 )
	f22_arg0:dispatchEventToParent( {
		name = "unselected_multi_selection_button_over"
	} )
end

