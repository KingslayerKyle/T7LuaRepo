require( "ui.T6.ButtonList" )
require( "ui.T6.MultiSelectionButton" )

CoD.MultiSelectionButtonList = {}
CoD.MultiSelectionButtonList.AddButton = function ( self, text, hintText, priority )
	local newButtonDefaultAnimationState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.textSize.Default,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	if self.buttonCount == nil then
		self.buttonCount = 0
	end
	self.buttonCount = self.buttonCount + 1
	local newButton = CoD.MultiSelectionButton.New( newButtonDefaultAnimationState, nil, "Default", self.buttonCount )
	newButton.hintText = hintText
	newButton.isLocked = CoD.MultiSelectionButtonList.Button_IsLocked
	newButton.isPurchased = CoD.MultiSelectionButtonList.Button_IsPurchased
	newButton.canBeUnlocked = CoD.MultiSelectionButtonList.Button_CanBeUnlocked
	newButton.isSelected = CoD.MultiSelectionButtonList.Button_IsSelected
	newButton:setPriority( priority )
	newButton:setLabel( text, "Default", CoD.MultiSelectionButton.TextLeft )
	if self.selectedMaterialName then
		newButton.selectedMaterialName = self.selectedMaterialName
	end
	self:addElementToList( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	return newButton
end

CoD.MultiSelectionButtonList.SetMaxSelections = function ( self, maxSelections )
	self.maxSelections = maxSelections
end

CoD.MultiSelectionButtonList.IncrementSelectionCount = function ( self )
	if self.maxSelections and self.selectionCount == self.maxSelections then
		error( "LUI Error: MultiSelectionButtonList cannot select more than " .. self.maxSelections .. " at once." )
	else
		self.selectionCount = self.selectionCount + 1
	end
end

CoD.MultiSelectionButtonList.DecrementSelectionCount = function ( self )
	if self.selectionCount > 0 then
		self.selectionCount = self.selectionCount - 1
	else
		error( "LUI Error: MultiSelectionButtonList cannot have a selection count of less than 0." )
	end
end

CoD.MultiSelectionButtonList.UpdateSelectionCount = function ( self )
	self.selectionCount = 0
	self:dispatchEventToChildren( {
		name = "update_selection_count"
	} )
end

CoD.MultiSelectionButtonList.ClearSelectionCount = function ( self )
	self.selectionCount = 0
end

CoD.MultiSelectionButtonList.GetLockedCount = function ( self )
	local lockedCount = 0
	local childElement = self:getFirstChild()
	while childElement ~= nil do
		if childElement.isLocked ~= nil and childElement:isLocked() == true then
			lockedCount = lockedCount + 1
		end
		childElement = childElement:getNextSibling()
	end
	return lockedCount
end

CoD.MultiSelectionButtonList.Button_IsLocked = function ( self )
	return false
end

CoD.MultiSelectionButtonList.Button_IsPurchased = function ( self )
	return true
end

CoD.MultiSelectionButtonList.Button_CanBeUnlocked = function ( self )
	return false
end

CoD.MultiSelectionButtonList.Button_IsSelected = function ( self )
	return false
end

CoD.MultiSelectionButtonList.New = function ( defaultAnimationState, buttonSpacing )
	if buttonSpacing == nil then
		buttonSpacing = CoD.ButtonList.ButtonSpacing
	end
	local multiSelectionButtonList = CoD.ScrollingVerticalList.new( defaultAnimationState )
	multiSelectionButtonList:setSpacing( buttonSpacing )
	multiSelectionButtonList.id = "MultiSelectionButtonList"
	multiSelectionButtonList.selectionCount = 0
	multiSelectionButtonList:makeFocusable()
	multiSelectionButtonList:addElement( LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} ) )
	multiSelectionButtonList:addElement( LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} ) )
	multiSelectionButtonList.addButton = CoD.MultiSelectionButtonList.AddButton
	multiSelectionButtonList.setMaxSelections = CoD.MultiSelectionButtonList.SetMaxSelections
	multiSelectionButtonList.incrementSelectionCount = CoD.MultiSelectionButtonList.IncrementSelectionCount
	multiSelectionButtonList.decrementSelectionCount = CoD.MultiSelectionButtonList.DecrementSelectionCount
	multiSelectionButtonList.updateSelectionCount = CoD.MultiSelectionButtonList.UpdateSelectionCount
	multiSelectionButtonList.clearSelectionCount = CoD.MultiSelectionButtonList.ClearSelectionCount
	multiSelectionButtonList.getLockedCount = CoD.MultiSelectionButtonList.GetLockedCount
	multiSelectionButtonList:registerEventHandler( "increment_selection_count", CoD.MultiSelectionButtonList.IncrementSelectionCount )
	multiSelectionButtonList:registerEventHandler( "increment_locked_count", CoD.MultiSelectionButtonList.IncrementLockedCount )
	multiSelectionButtonList:registerEventHandler( "update_multi_selection_list", CoD.MultiSelectionButtonList.Update )
	multiSelectionButtonList:registerEventHandler( "can_unlock_multi_selection_button_action", CoD.MultiSelectionButtonList.CanUnlockButtonAction )
	multiSelectionButtonList:registerEventHandler( "cannot_unlock_multi_selection_button_action", CoD.MultiSelectionButtonList.CannotUnlockButtonAction )
	multiSelectionButtonList:registerEventHandler( "deselect_multi_selection_button_action", CoD.MultiSelectionButtonList.DeselectButtonAction )
	multiSelectionButtonList:registerEventHandler( "select_multi_selection_button_action", CoD.MultiSelectionButtonList.SelectButtonAction )
	multiSelectionButtonList:registerEventHandler( "can_unlock_multi_selection_button_over", CoD.MultiSelectionButtonList.CanUnlockButtonOver )
	multiSelectionButtonList:registerEventHandler( "cannot_unlock_multi_selection_button_over", CoD.MultiSelectionButtonList.CannotUnlockButtonOver )
	multiSelectionButtonList:registerEventHandler( "selected_multi_selection_button_over", CoD.MultiSelectionButtonList.SelectedButtonOver )
	multiSelectionButtonList:registerEventHandler( "unselected_multi_selection_button_over", CoD.MultiSelectionButtonList.UnselectedButtonOver )
	return multiSelectionButtonList
end

CoD.MultiSelectionButtonList.Update = function ( self, event )
	self.lockedCount = 0
	self:dispatchEventToChildren( {
		name = "update_multi_selection_list_buttons",
		selectionCountAtMax = self.selectionCount == self.maxSelections
	} )
end

CoD.MultiSelectionButtonList.CanUnlockButtonAction = function ( self, event )
	self:dispatchEventToParent( {
		name = "can_unlock_multi_selection_button_action",
		controller = event.controller,
		button = event.button
	} )
end

CoD.MultiSelectionButtonList.CannotUnlockButtonAction = function ( self, event )
	self:dispatchEventToParent( {
		name = "cannot_unlock_multi_selection_button_action",
		controller = event.controller,
		button = event.button
	} )
	Engine.PlaySound( CoD.CACUtility.denySFX )
end

CoD.MultiSelectionButtonList.DeselectButtonAction = function ( self, event )
	if not self.maxSelections or self.selectionCount > 0 then
		self:dispatchEventToParent( {
			name = "deselect_multi_selection_button_action",
			controller = event.controller,
			button = event.button
		} )
	end
end

CoD.MultiSelectionButtonList.SelectButtonAction = function ( self, event )
	if not self.maxSelections or self.selectionCount < self.maxSelections then
		self:dispatchEventToParent( {
			name = "select_multi_selection_button_action",
			controller = event.controller,
			button = event.button
		} )
	end
end

CoD.MultiSelectionButtonList.CanUnlockButtonOver = function ( self, event )
	self:dispatchEventToParent( {
		name = "can_unlock_multi_selection_button_over"
	} )
end

CoD.MultiSelectionButtonList.CannotUnlockButtonOver = function ( self, event )
	self:dispatchEventToParent( {
		name = "cannot_unlock_multi_selection_button_over"
	} )
end

CoD.MultiSelectionButtonList.SelectedButtonOver = function ( self, event )
	self:dispatchEventToParent( {
		name = "selected_multi_selection_button_over"
	} )
end

CoD.MultiSelectionButtonList.UnselectedButtonOver = function ( self, event )
	self:dispatchEventToParent( {
		name = "unselected_multi_selection_button_over"
	} )
end

