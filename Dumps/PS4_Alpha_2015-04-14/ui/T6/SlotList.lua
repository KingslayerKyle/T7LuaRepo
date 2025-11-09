CoD.SlotList = {}
CoD.SlotList.Spacing = 15
CoD.SlotList.SlotHeight = 64
CoD.SlotList.SlotWidth = CoD.SlotList.SlotHeight * 1.4
CoD.SlotList.PulseSpeed = 1000
CoD.SlotList.new = function ( defaultAnimationState, slotWidth, slotHeight, spacing )
	local slotList = LUI.UIElement.new( defaultAnimationState )
	slotList.id = "SlotList"
	if slotWidth == nil then
		slotWidth = CoD.SlotList.SlotWidth
	end
	if slotHeight == nil then
		slotHeight = CoD.SlotList.SlotHeight
	end
	slotList.slotWidth = slotWidth
	slotList.slotHeight = slotHeight
	if spacing then
		slotList.spacing = spacing
	else
		slotList.spacing = CoD.SlotList.Spacing
	end
	slotList.slots = {}
	slotList.canEdit = CoD.SlotList.CanEdit
	slotList.edit = CoD.SlotList.Edit
	slotList.highlightSlot = CoD.SlotList.HighlightSlot
	slotList.update = CoD.SlotList.Update
	slotList.setGainFocusSFX = CoD.SlotList.SetGainFocusSFX
	slotList:registerEventHandler( "slot_gain_focus", CoD.SlotList.SlotGainFocus )
	slotList:registerEventHandler( "gain_focus", CoD.NullFunction )
	slotList:registerEventHandler( "button_over", CoD.NullFunction )
	return slotList
end

CoD.SlotList.CanEdit = function ( self )
	if self.editable == false then
		return false
	elseif self.numSlots < 1 then
		return false
	else
		return true
	end
end

CoD.SlotList.Edit = function ( self, controller, slotIndex )
	if not self:canEdit() then
		if self.numSlots >= 1 then
			self.slots[1]:processEvent( {
				name = "button_over",
				controller = controller
			} )
			self.slots[1]:processEvent( {
				name = "button_action",
				controller = controller
			} )
		end
		return false
	elseif self.lastSlotInFocus == nil or self.numSlots < self.lastSlotInFocus then
		self.lastSlotInFocus = 1
	end
	if slotIndex and self.slots[slotIndex] then
		self.lastSlotInFocus = slotIndex
	end
	self.slots[self.lastSlotInFocus]:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
	self:dispatchEventToParent( {
		name = "slotlist_editing_start"
	} )
	return true
end

CoD.SlotList.HighlightSlot = function ( self, slotIndex )
	self.slots[slotIndex]:processEvent( {
		name = "button_over"
	} )
end

CoD.SlotList.Update = function ( self, numRegularSlots, numSpecialSlots, slotImages, preview, showBonuscardPreview, bonusCardInSet )
	local numSlots = numRegularSlots + numSpecialSlots
	if self.numSlots ~= numSlots then
		self.numSlots = numSlots
		CoD.SlotList.PopulateSlots( self, numRegularSlots, numSpecialSlots, preview )
	end
	CoD.SlotList.UpdateSlotImages( self, slotImages, showBonuscardPreview, bonusCardInSet )
end

CoD.SlotList.SetGainFocusSFX = function ( self, sfxName )
	self.gainFocusSFX = sfxName
end

CoD.SlotList.PopulateSlots = function ( slotList, numRegularSlots, numSpecialSlots, preview )
	local slotInFocus, slotIndexInFocus = nil
	if #slotList.slots > 0 then
		for index, slot in ipairs( slotList.slots ) do
			if slot:isInFocus() then
				slotInFocus = slot
				slotIndexInFocus = index
			end
		end
	end
	if slotList.slotContainer ~= nil then
		slotList.slotContainer:close()
		slotList.slotContainer = nil
		slotList.slots = {}
	end
	local slotContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	for index = 1, numRegularSlots, 1 do
		local slotButton = CoD.SlotList.GetNewSlotButton( slotList, index, nil, preview )
		if slotList.gainFocusSFX ~= nil then
			slotButton:setGainFocusSFX( slotList.gainFocusSFX )
		end
		slotContainer:addElement( slotButton )
	end
	for index = numRegularSlots + 1, numRegularSlots + numSpecialSlots, 1 do
		local slotButton = CoD.SlotList.GetNewSlotButton( slotList, index, true, preview )
		if slotList.gainFocusSFX ~= nil then
			slotButton:setGainFocusSFX( slotList.gainFocusSFX )
		end
		slotContainer:addElement( slotButton )
	end
	slotList.slotContainer = slotContainer
	slotList:addElement( slotContainer )
	if slotInFocus ~= nil and slotList.slots[slotIndexInFocus] ~= nil then
		local slot = slotList.slots[slotIndexInFocus]
		slot.navigation.up = slotInFocus.navigation.up
		slot.navigation.down = slotInFocus.navigation.down
		slot.navigation.left = slotInFocus.navigation.left
		if slotList.slots[slotIndexInFocus + 1] ~= nil then
			slot.navigation.right = slotList.slots[slotIndexInFocus + 1]
		else
			slot.navigation.right = slot.navigation.left
		end
		slot:processEvent( {
			name = "gain_focus"
		} )
	end
end

CoD.SlotList.UpdateSlotImages = function ( slotList, slotImages, showBonuscardPreview, bonusCardInSet )
	for index, slotButton in ipairs( slotList.slots ) do
		local f8_local3 = nil
		if slotImages then
			f8_local3 = slotImages[index]
		end
		if slotButton.icon.materialName ~= f8_local3 then
			if f8_local3 and f8_local3 ~= "" then
				if slotButton.background then
					slotButton.background:setAlpha( 1 )
				end
				if slotButton.glowGradBack then
					slotButton.glowGradBack:animateToState( "equipped" )
				end
				if slotButton.glowGradFront then
					slotButton.glowGradFront:animateToState( "equipped" )
				end
				slotButton.icon:registerAnimationState( "change_material", {
					material = RegisterMaterial( f8_local3 ),
					alpha = 1
				} )
				slotButton.canBeRemoved = true
			else
				if slotButton.background then
					slotButton.background:setAlpha( 0.25 )
				end
				if slotButton.glowGradBack then
					slotButton.glowGradBack:animateToState( "unequipped" )
				end
				if slotButton.glowGradFront then
					slotButton.glowGradFront:animateToState( "unequipped" )
				end
				slotButton.icon:registerAnimationState( "change_material", {
					alpha = 0
				} )
				slotButton.canBeRemoved = nil
			end
			slotButton.icon:animateToState( "change_material" )
			slotButton.icon.materialName = f8_local3
		elseif f8_local3 == nil and slotButton.background then
			slotButton.background:setAlpha( 0.25 )
		end
		if slotButton.bonusCardPreviewBackground ~= nil then
			if bonusCardInSet == true then
				slotButton.bonusCardPreviewBackground:animateToState( "show" )
			else
				slotButton.bonusCardPreviewBackground:animateToState( "default" )
			end
		end
		if slotButton.bonusCardPreviewBackgroundPulse ~= nil then
			if showBonuscardPreview == true and bonusCardInSet == false then
				slotButton.bonusCardPreviewBackgroundPulse:animateToState( "show" )
			else
				slotButton.bonusCardPreviewBackgroundPulse:animateToState( "default" )
			end
			slotButton.showBonuscardPreview = showBonuscardPreview
		end
	end
end

CoD.SlotList.GetNewSlotButton = function ( slotList, index, isSpecial, preview )
	local left = (slotList.slotWidth + slotList.spacing) * (index - 1)
	local newSlotButtonDefaultAnimationState = {
		leftAnchor = true,
		rightAnchor = false,
		left = left,
		right = left + slotList.slotWidth,
		topAnchor = false,
		bottomAnchor = false,
		top = -slotList.slotHeight / 2,
		bottom = slotList.slotHeight / 2
	}
	local button = CoD.GrowingGridButton.new( newSlotButtonDefaultAnimationState, slotList.setupElementsFunction )
	button.index = index
	button.id = button.id .. "." .. slotList.id .. ".Index" .. index
	table.insert( slotList.slots, button )
	if button.grid ~= nil then
		button.grid:close()
		button.grid = nil
	end
	if isSpecial then
		if slotList.addPreviewElementsFunction then
			slotList.addPreviewElementsFunction( button, slotList, index )
		else
			CoD.SlotList.AddBonusCardPreviewElements( button )
		end
	end
	if not button.icon then
		button.icon = LUI.UIImage.new( {
			leftAnchor = false,
			rightAnchor = false,
			left = -slotList.slotHeight / 2,
			right = slotList.slotHeight / 2,
			topAnchor = false,
			bottomAnchor = false,
			top = -slotList.slotHeight / 2,
			bottom = slotList.slotHeight / 2,
			alpha = 0
		} )
		button.icon:setPriority( 0 )
		button.icon.id = "UIImage.Icon"
		button:addElement( button.icon )
	end
	if slotList.slots[index - 1] ~= nil then
		slotList.slots[index - 1].navigation.right = button
		button.navigation.left = slotList.slots[index - 1]
	end
	button.handleUnequipPrompt = CoD.SlotList.SlotButton_Unequip
	button:registerEventHandler( "button_action", CoD.SlotList.ButtonAction )
	button:registerEventHandler( "button_over", CoD.SlotList.SlotButton_ButtonOver )
	button:registerEventHandler( "button_up", CoD.SlotList.SlotButton_ButtonUp )
	return button
end

CoD.SlotList.AddBonusCardPreviewElements = function ( button )
	button.bonusCardPreviewBackground = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 2,
		right = -2,
		topAnchor = true,
		bottomAnchor = true,
		top = 2,
		bottom = -2,
		red = CoD.trueOrange.r,
		green = CoD.trueOrange.g,
		blue = CoD.trueOrange.b,
		alpha = 0
	} )
	button.bonusCardPreviewBackground:registerAnimationState( "show", {
		alpha = 1
	} )
	button:addElement( button.bonusCardPreviewBackground )
	button.bonusCardPreviewBackgroundPulse = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 2,
		right = -2,
		topAnchor = true,
		bottomAnchor = true,
		top = 2,
		bottom = -2,
		red = CoD.trueOrange.r,
		green = CoD.trueOrange.g,
		blue = CoD.trueOrange.b,
		alpha = 0
	} )
	button.bonusCardPreviewBackgroundPulse:registerAnimationState( "hide", {
		alpha = 0.05
	} )
	button.bonusCardPreviewBackgroundPulse:registerAnimationState( "show", {
		alpha = 0.2
	} )
	button.bonusCardPreviewBackgroundPulse:registerEventHandler( "transition_complete_show", button.bonusCardPreviewBackgroundPulse:animateToNextState( "hide", CoD.SlotList.PulseSpeed ) )
	button.bonusCardPreviewBackgroundPulse:registerEventHandler( "transition_complete_hide", button.bonusCardPreviewBackgroundPulse:animateToNextState( "show", CoD.SlotList.PulseSpeed ) )
	button:addElement( button.bonusCardPreviewBackgroundPulse )
end

CoD.SlotList.ButtonAction = function ( self, event )
	self:dispatchEventToParent( {
		name = "slotlist_button_action",
		slotIndex = self.index,
		controller = event.controller
	} )
end

CoD.SlotList.ButtonPromptBack = function ( slotList, event )
	slotList:registerEventHandler( "button_prompt_back", nil )
	slotList:processEvent( {
		name = "lose_focus"
	} )
	slotList:dispatchEventToParent( {
		name = "slotlist_editing_stop"
	} )
end

CoD.SlotList.SlotGainFocus = function ( slotList, event )
	slotList.lastSlotInFocus = event.slotIndex
	slotList:dispatchEventToParent( event )
end

CoD.SlotList.SlotButton_ButtonOver = function ( slotButton, event )
	if CoD.CACUtility.highLightedGridButtonSlotIndex ~= nil then
		CoD.CACUtility.lastHighLightedGridButtonSlotIndex = CoD.CACUtility.highLightedGridButtonSlotIndex
	end
	CoD.CACUtility.highLightedGridButtonSlotIndex = slotButton.index
	slotButton:dispatchEventToParent( {
		name = "slot_gain_focus",
		slotIndex = slotButton.index,
		controller = event.controller
	} )
	CoD.GrowingGridButton.Over( slotButton, event )
end

CoD.SlotList.SlotButton_ButtonUp = function ( slotButton, event )
	slotButton:dispatchEventToParent( {
		name = "slot_lose_focus",
		slotIndex = slotButton.index,
		controller = event.controller
	} )
	CoD.GrowingGridButton.Up( slotButton, event )
end

CoD.SlotList.SlotButton_Unequip = function ( slotButton, event )
	slotButton:dispatchEventToParent( {
		name = "slotlist_unequip",
		slotIndex = slotButton.index,
		controller = event.controller
	} )
	CoD.GrowingGridButton.ButtonPromptUnequip( slotButton, event )
end

CoD.SlotList.GetAttachmentImages = function ( controller, classNum, weaponStatName )
	local attachmentImages = {}
	local class = Engine.GetCustomClass( controller, classNum )
	local weaponIndex = class[weaponStatName]
	for attachmentSlotIndex = 0, 2, 1 do
		local currentAttachmentIndex = class[weaponStatName .. "attachment" .. attachmentSlotIndex + 1]
		if currentAttachmentIndex ~= nil and currentAttachmentIndex ~= 0 then
			local attachmentImage = Engine.GetAttachmentImageByWeaponAndAttachIndex( weaponIndex, currentAttachmentIndex )
			attachmentImages[attachmentSlotIndex + 1] = attachmentImage
		end
	end
	return attachmentImages
end

CoD.SlotList.GetAttachmentCountByStatName = function ( controller, classNum, weaponStatName )
	local class = Engine.GetCustomClass( controller, classNum )
	local weaponIndex = class[weaponStatName]
	local numAttachmentsForWeapon = 0
	if weaponIndex ~= nil then
		numAttachmentsForWeapon = Engine.GetNumItemAttachmentsWithAttachPoint( weaponIndex, 0 ) - 1
	end
	if numAttachmentsForWeapon < 0 then
		numAttachmentsForWeapon = 0
	end
	return numAttachmentsForWeapon
end

CoD.SlotList.GetGadgetModsImages = function ( controller, classNum, weaponStatName )
	local attachmentImages = {}
	local class = Engine.GetCustomClass( controller, classNum )
	local weaponIndex = class[weaponStatName]
	local maxAttachments = CoD.CACUtility.maxGadgetsMods
	for attachmentSlotIndex = 0, maxAttachments, 1 do
		local currentAttachmentIndex = class[weaponStatName .. "attachment" .. attachmentSlotIndex + 1]
		if currentAttachmentIndex ~= nil and currentAttachmentIndex ~= 0 then
			local attachmentImage = Engine.GetAttachmentImageByWeaponAndAttachIndex( weaponIndex, currentAttachmentIndex )
			attachmentImages[attachmentSlotIndex + 1] = attachmentImage
		end
	end
	return attachmentImages
end

CoD.SlotList.GetGadgetModsCountByStatName = function ( controller, classNum, weaponStatName )
	local class = Engine.GetCustomClass( controller, classNum )
	local weaponIndex = class[weaponStatName]
	local numAttachmentsForWeapon = 0
	if weaponIndex ~= nil then
		numAttachmentsForWeapon = Engine.GetNumItemAttachmentsWithAttachPoint( weaponIndex, 0 ) - 1
	end
	if numAttachmentsForWeapon < 0 then
		numAttachmentsForWeapon = 0
	end
	return numAttachmentsForWeapon
end

CoD.SlotList.PopulateWithAttachments = function ( self, controller, classNum, weaponStatName, preview )
	local class = Engine.GetCustomClass( controller, classNum )
	local weaponIndex = class[weaponStatName]
	local numAttachmentsForWeapon = 0
	local attachmentImages = {}
	if weaponIndex ~= nil then
		attachmentImages = CoD.SlotList.GetAttachmentImages( controller, classNum, weaponStatName )
		numAttachmentsForWeapon = CoD.SlotList.GetAttachmentCountByStatName( controller, classNum, weaponStatName )
	end
	local maxAttachments = nil
	if weaponStatName == "primary" then
		maxAttachments = 2
	else
		maxAttachments = 1
	end
	local numSpecialSlots = 0
	local bonusCardInSet = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_" .. weaponStatName .. "_gunfighter" )
	if weaponStatName == "primary" then
		bonusCardInSet = true
	end
	if bonusCardInSet or self.showBonuscardPreview then
		maxAttachments = maxAttachments + 1
		numSpecialSlots = 1
	end
	local numAttachmentSlots = math.min( maxAttachments, numAttachmentsForWeapon )
	if numAttachmentSlots ~= maxAttachments then
		numSpecialSlots = 0
	end
	self:update( numAttachmentSlots - numSpecialSlots, numSpecialSlots, attachmentImages, preview, nil, bonusCardInSet )
	for attachmentSlotIndex = 0, 2, 1 do
		local isRestricted = nil
		local currentAttachmentIndex = class[weaponStatName .. "attachment" .. attachmentSlotIndex + 1]
		if currentAttachmentIndex ~= nil and currentAttachmentIndex ~= 0 then
			local attachmentIndex = Engine.GetItemAttachment( weaponIndex, currentAttachmentIndex )
			if attachmentIndex then
				isRestricted = Engine.IsAttachmentIndexRestricted( attachmentIndex )
			end
		end
		local slot = self.slots[attachmentSlotIndex + 1]
		if slot then
			slot:setRestrictedImage( isRestricted )
		end
	end
	return numAttachmentSlots
end

CoD.SlotList.PopulateWithGadgetMods = function ( self, controller, classNum, weaponStatName, preview )
	local class = Engine.GetCustomClass( controller, classNum )
	local weaponIndex = class[weaponStatName]
	local numAttachmentsForWeapon = 0
	local attachmentImages = {}
	if weaponIndex ~= nil then
		attachmentImages = CoD.SlotList.GetGadgetModsImages( controller, classNum, weaponStatName )
		numAttachmentsForWeapon = CoD.SlotList.GetGadgetModsCountByStatName( controller, classNum, weaponStatName )
	end
	local maxAttachments = CoD.CACUtility.maxGadgetsMods
	local bonusCardInSet = false
	local numAttachmentSlots = math.min( maxAttachments, numAttachmentsForWeapon )
	local numSpecialSlots = 0
	self:update( numAttachmentSlots - numSpecialSlots, numSpecialSlots, attachmentImages, preview, nil, bonusCardInSet )
	if weaponIndex ~= nil then
		for attachmentSlotIndex = 0, maxAttachments, 1 do
			local isRestricted = nil
			local currentAttachmentIndex = class[weaponStatName .. "attachment" .. attachmentSlotIndex + 1]
			if currentAttachmentIndex ~= nil and currentAttachmentIndex ~= 0 then
				local attachmentIndex = Engine.GetItemAttachment( weaponIndex, currentAttachmentIndex )
				if attachmentIndex then
					isRestricted = Engine.IsAttachmentIndexRestricted( attachmentIndex )
				end
			end
			local slot = self.slots[attachmentSlotIndex + 1]
			if slot then
				slot:setRestrictedImage( isRestricted )
			end
		end
	end
	return numAttachmentSlots
end

CoD.SlotList.GetPerkImages = function ( perkCategory, numPerkSlotsInCurrentPerkCategory, class )
	local perkImages = {}
	for index = 1, numPerkSlotsInCurrentPerkCategory, 1 do
		local currentSpecialtySlotNumber = perkCategory + (index - 1) * CoD.CACUtility.maxPerkCategories
		local itemIndex = class["specialty" .. currentSpecialtySlotNumber]
		local perkImage = ""
		if itemIndex ~= nil then
			perkImage = Engine.GetItemImage( itemIndex ) .. "_256"
		end
		table.insert( perkImages, perkImage )
	end
	return perkImages
end

CoD.SlotList.PopulateWithPerks = function ( self, controller, classNum, perkCategory, class, preview )
	local class = Engine.GetCustomClass( controller, classNum )
	local bonusCardInSet = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_perk_" .. perkCategory .. "_greed" )
	local numPerkSlotsInCurrentPerkCategory = 1
	local numSpecialSlots = 0
	if bonusCardInSet or self.showBonuscardPreview then
		numPerkSlotsInCurrentPerkCategory = 2
		numSpecialSlots = 1
	end
	local perkImages = CoD.SlotList.GetPerkImages( perkCategory, numPerkSlotsInCurrentPerkCategory, class )
	self:update( numPerkSlotsInCurrentPerkCategory - numSpecialSlots, numSpecialSlots, perkImages, preview, nil, bonusCardInSet )
	for index = 1, numPerkSlotsInCurrentPerkCategory, 1 do
		local currentSpecialtySlotNumber = perkCategory + (index - 1) * CoD.CACUtility.maxPerkCategories
		local itemIndex = class["specialty" .. currentSpecialtySlotNumber]
		local isRestricted = nil
		if itemIndex then
			isRestricted = Engine.IsItemIndexRestricted( itemIndex )
		end
		self.slots[index]:setRestrictedImage( isRestricted )
	end
	return numPerkSlotsInCurrentPerkCategory
end

CoD.SlotList.GetGrenadeImages = function ( controller, classNum, weaponStatName, numGrenadeSlots )
	local grenadeImages = {}
	local class = Engine.GetCustomClass( controller, classNum )
	local weaponIndex = class[weaponStatName]
	if weaponIndex ~= nil then
		for grenadeIndex = 1, numGrenadeSlots, 1 do
			local isActive = Engine.GetClassItem( controller, classNum, weaponStatName .. "status" .. grenadeIndex )
			if isActive == 1 then
				grenadeImages[grenadeIndex] = Engine.GetItemImage( weaponIndex ) .. "_256"
			end
		end
	end
	return grenadeImages
end

