require( "ui_mp.T6.GameOptions" )
require( "ui.T6.MultiSelectionButtonList" )

local AllowItem, ItemButton_IsSelected, RestrictItem = nil
LUI.createMenu.RestrictItems = function ( controller )
	local self = CoD.GameOptionsMenu.New( controller, "RestrictItems" )
	local background = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	background:setPriority( -100 )
	self:addElement( background )
	local groupName = CoD.perController[controller].groupName
	local loadoutSlot = CoD.perController[controller].loadoutSlot
	self.buttonList:close()
	self.buttonList = CoD.MultiSelectionButtonList.New()
	self.buttonList:setLeftRight( true, false, 0, CoD.ButtonList.DefaultWidth )
	self.buttonList:setTopBottom( true, true, CoD.Menu.TitleHeight, -CoD.ButtonPrompt.Height - 1 )
	self.buttonList.selectedMaterialName = "menu_mp_pip_outline_x"
	self:registerEventHandler( "select_multi_selection_button_action", RestrictItem )
	self:registerEventHandler( "deselect_multi_selection_button_action", AllowItem )
	self:addElement( self.buttonList )
	local items = nil
	if groupName then
		items = CoD.GetUnlockablesByGroupName( groupName )
		self:addTitle( Engine.Localize( "MENU_RESTRICT_" .. groupName .. "_CAPS" ) )
		self.buttonList.id = "ButtonList.Restrict" .. groupName
	elseif loadoutSlot then
		items = CoD.GetUnlockablesBySlotName( loadoutSlot )
		self:addTitle( Engine.Localize( "MENU_RESTRICT_" .. loadoutSlot .. "_CAPS" ) )
		self.buttonList.id = "ButtonList.Restrict" .. loadoutSlot
	else
		self:addTitle( Engine.Localize( "MENU_RESTRICT_ATTACHMENTS_CAPS" ) )
		self.buttonList.id = "ButtonList.RestrictAttachments"
		local attachmentIndex = 1
		while true do
			local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
			if attachmentName == "" then
				
			elseif Engine.GetAttachmentAllocationCost( attachmentIndex ) >= 0 then
				local button = self.buttonList:addButton( Engine.Localize( attachmentName ), nil, nil, self, controller )
				button.attachmentIndex = attachmentIndex
				button.isSelected = ItemButton_IsSelected
			end
			attachmentIndex = attachmentIndex + 1
		end
	end
	self[self.buttonList.id] = self.buttonList
	if items then
		for index, itemIndex in ipairs( items ) do
			if not loadoutSlot or Engine.GetLoadoutSlotForItem( itemIndex ) == loadoutSlot then
				local button = self.buttonList:addButton( Engine.Localize( Engine.GetItemName( REG10 ) ), nil, nil, self, controller )
				button.itemIndex = REG10
				button.isSelected = ItemButton_IsSelected
			end
		end
	end
	self.buttonList:processEvent( {
		name = "update_multi_selection_list"
	} )
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( LUI.UIButton.GainFocusEvent )
		self.buttonList:dispatchEventToChildren( LUI.UIButton.GainFocusEvent )
	end
	return self
end

AllowItem = function ( self, event )
	if event.button.itemIndex then
		Engine.SetItemIndexRestricted( event.button.itemIndex, false )
	else
		Engine.SetAttachmentIndexRestricted( event.button.attachmentIndex, false )
	end
	self.buttonList:processEvent( {
		name = "update_multi_selection_list"
	} )
end

ItemButton_IsSelected = function ( button )
	if button.itemIndex then
		return Engine.IsItemIndexRestricted( button.itemIndex )
	else
		return Engine.IsAttachmentIndexRestricted( button.attachmentIndex )
	end
end

RestrictItem = function ( self, event )
	if event.button.itemIndex then
		Engine.SetItemIndexRestricted( event.button.itemIndex, true )
	else
		Engine.SetAttachmentIndexRestricted( event.button.attachmentIndex, true )
	end
	self.buttonList:processEvent( {
		name = "update_multi_selection_list"
	} )
end

