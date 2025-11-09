require( "ui.T6.SlotList" )

CoD.SlotListGridButton = {}
CoD.SlotListGridButton.new = function ( name, defaultAnimationState, slotHeight, slotWidth )
	local self = CoD.GrowingGridButton.new( defaultAnimationState )
	self.id = self.id .. "." .. name
	self:setGainFocusSFX( CoD.CACUtility.GainFocusSFX )
	self.canEdit = CoD.SlotListGridButton.CanEdit
	self.edit = CoD.SlotListGridButton.Edit
	self.setFocusToSlot = CoD.SlotListGridButton.SetFocusToSlot
	self.setSlotListButtonGainFocusSFX = CoD.SlotListGridButton.SetSlotListButtonGainFocusSFX
	if slotHeight == nil then
		slotHeight = CoD.SlotList.SlotHeight
	end
	if slotWidth == nil then
		slotWidth = CoD.SlotList.SlotWidth
	end
	local slotCount = 2
	if name == "primary" or name == "secondary" then
		slotCount = 3
	end
	local slotListDefaultAnimState = {
		leftAnchor = false,
		rightAnchor = true,
		left = -(slotWidth * slotCount) - CoD.SlotList.Spacing * (slotCount - 1),
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = -1,
		bottom = 0
	}
	self.slotList = CoD.SlotList.new( slotListDefaultAnimState, slotWidth, slotHeight )
	self:addToBody( self.slotList )
	self.slotList.id = self.slotList.id .. "." .. name
	self.handleUnequipPrompt = CoD.SlotListGridButton.ButtonPromptUnequip
	self:registerEventHandler( "button_action", CoD.SlotListGridButton.ButtonAction )
	self:registerEventHandler( "button_over", CoD.SlotListGridButton.ButtonOver )
	self:registerEventHandler( "slotlist_editing_stop", CoD.SlotListGridButton.SlotListEditingStop )
	self:registerEventHandler( "mousemove", CoD.SlotListGridButton.MouseEvent )
	self:registerEventHandler( "mousedown", CoD.SlotListGridButton.MouseEvent )
	return self
end

CoD.SlotListGridButton.CanEdit = function ( self )
	return self.slotList:canEdit()
end

CoD.SlotListGridButton.Edit = function ( self, controller, slotIndex )
	if self:canEdit() then
		local prevHandler = self.m_eventHandlers.button_up
		self:registerEventHandler( "button_up", CoD.NullFunction )
		self:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
		self:registerEventHandler( "button_up", prevHandler )
	end
	self.slotList:edit( controller, slotIndex )
end

CoD.SlotListGridButton.SetFocusToSlot = function ( self, controller, slotIndex )
	if self:canEdit() then
		self:edit( controller, slotIndex )
	end
end

CoD.SlotListGridButton.SetSlotListButtonGainFocusSFX = function ( self, sfxName )
	self.slotList:setGainFocusSFX( sfxName )
end

CoD.SlotListGridButton.ButtonAction = function ( self, event )
	self:edit( event.controller )
end

CoD.SlotListGridButton.ButtonOver = function ( self, event )
	if self:canEdit() then
		local parent = self:getParent()
		if parent then
			self:close()
			self:setPriority( 0 )
			parent:addElement( self )
		end
		for index, slot in ipairs( self.slotList.slots ) do
			slot.navigation.down = self.navigation.down
			slot.navigation.up = self.navigation.up
			if index == 1 and CoD.CACUtility.highLightedGridButtonColumn ~= "left" then
				self.slotList.slots[index].navigation.left = self.navigation.left
			end
			if index == #self.slotList.slots and CoD.CACUtility.highLightedGridButtonColumn ~= "right" then
				self.slotList.slots[index].navigation.right = self.navigation.right
			end
		end
		if CoD.CACUtility.highLightedGridButtonColumn ~= CoD.CACUtility.lastHighLightedGridButtonColumn then
			if CoD.CACUtility.highLightedGridButtonColumn == "left" then
				CoD.SlotListGridButton.SetFocusToSlot( self, event.controller, #self.slotList.slots )
			end
			CoD.SlotListGridButton.SetFocusToSlot( self, event.controller, 1 )
		elseif CoD.CACUtility.highLightedGridButtonSlotIndex ~= nil then
			CoD.SlotListGridButton.SetFocusToSlot( self, event.controller, CoD.CACUtility.highLightedGridButtonSlotIndex )
		end
		CoD.SlotListGridButton.SetFocusToSlot( self, event.controller, 1 )
	else
		CoD.GrowingGridButton.Over( self, event )
	end
end

CoD.SlotListGridButton.ButtonPromptUnequip = function ( self, event )
	self.slotList.slots[1]:processEvent( event )
	CoD.GrowingGridButton.ButtonPromptUnequip( self, event )
end

CoD.SlotListGridButton.SlotListEditingStop = function ( self, event )
	self.brackets:animateToState( "hide" )
	self:registerEventHandler( "button_up", CoD.GrowingGridButton.Up )
	self:processEvent( {
		name = "gain_focus"
	} )
	self:dispatchEventToParent( event )
end

CoD.SlotListGridButton.Slot_LoseFocus = function ( self, event )
	self:highlightSubtitle( 0, true )
end

CoD.SlotListGridButton.Slot_GainFocus = function ( self, event )
	self:highlightSubtitle( event.slotIndex )
end

CoD.SlotListGridButton.MouseEvent = function ( self, event )
	self:dispatchEventToChildren( event )
end

