require( "ui_mp.T6.RewardGridButton" )
require( "ui.T6.SelectedReward" )

CoD.T6Rewards = {}
CoD.T6Rewards.GridColumns = 6
CoD.T6Rewards.GridItemSpacing = 8
CoD.T6Rewards.GridItemWidth = (CoD.Menu.Width - CoD.T6Rewards.GridItemSpacing * (CoD.T6Rewards.GridColumns - 1)) / CoD.T6Rewards.GridColumns
CoD.T6Rewards.GridItemHeight = 64 + CoD.ContentGridButton.TitleHeight + 10
LUI.createMenu.T6Rewards = function ( controller )
	local rewardsMenu = CoD.Menu.New( "T6Rewards" )
	rewardsMenu:addLargePopupBackground()
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
	rewardsMenu:addElement( background )
	rewardsMenu.m_ownerController = controller
	rewardsMenu:addTitle( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ) )
	rewardsMenu.goBack = CoD.T6Rewards.GoBack
	rewardsMenu:registerEventHandler( "content_button_highlighted", CoD.T6Rewards.ContentButtonHighlighted )
	rewardsMenu:registerEventHandler( "content_button_selected", CoD.T6Rewards.ContentButtonSelected )
	rewardsMenu:registerEventHandler( "equip", CoD.T6Rewards.Equip )
	rewardsMenu:registerEventHandler( "unequip", CoD.T6Rewards.Unequip )
	rewardsMenu:registerEventHandler( "purchased", CoD.T6Rewards.Purchased )
	rewardsMenu:registerEventHandler( "button_prompt_clear_all_rewards", CoD.T6Rewards.ClearAllRewards )
	rewardsMenu:registerEventHandler( "prestige_unlock", CoD.T6Rewards.PrestigeUnlock )
	rewardsMenu:registerEventHandler( "remove_prestige_unlock_button", CoD.T6Rewards.RemovePrestigeUnlockButton )
	rewardsMenu:registerEventHandler( "add_prestige_unlock_button", CoD.T6Rewards.AddPrestigeUnlockButton )
	if not Engine.AreAllItemsFree() then
		local currentStats = CoD.GetPlayerStats( controller )
		local pLevel = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
		if pLevel < tonumber( CoD.MAX_PRESTIGE ) then
			local footer = CoD.CAC.CreateUnlockTokensFooter( rewardsMenu, controller )
			CoD.CAC.SetUnlockItemText( footer, controller )
			rewardsMenu:addElement( footer )
		end
	end
	CoD.T6Rewards.AddElements( rewardsMenu )
	CoD.T6Rewards.UpdateSelectedRewards( rewardsMenu, controller )
	return rewardsMenu
end

CoD.T6Rewards.GoBack = function ( self, controller )
	self.contentGrid:saveState()
	Engine.Exec( controller, "uploadstats" )
	Engine.CommitProfileChanges( controller )
	Engine.PartyHostClearUIState()
	if self.occludedMenu then
		self.occludedMenu:processEvent( {
			name = "scorestreaks_closed",
			controller = controller
		} )
	end
	CoD.Menu.goBack( self, controller )
end

CoD.T6Rewards.AddDeselectButtonPrompt = function ( self )
	local replacePrestigeUnlockButton = false
	self:removeSelectButton()
	self:removeBackButton()
	if self.prestigeUnlockButton then
		replacePrestigeUnlockButton = true
		self.prestigeUnlockButton:close()
		self.prestigeUnlockButton = nil
	end
	self:addSelectButton( Engine.Localize( "MPUI_CLEAR" ) )
	self:addBackButton()
	if replacePrestigeUnlockButton == true then
		self:addPrestigeUnlockButton()
	end
end

CoD.T6Rewards.AddSelectButtonPrompt = function ( self )
	local replacePrestigeUnlockButton = false
	self:removeSelectButton()
	self:removeBackButton()
	if self.prestigeUnlockButton then
		replacePrestigeUnlockButton = true
		self.prestigeUnlockButton:close()
		self.prestigeUnlockButton = nil
	end
	self:addSelectButton()
	self:addBackButton()
	if replacePrestigeUnlockButton == true then
		self:addPrestigeUnlockButton()
	end
end

CoD.T6Rewards.AddClearAllButtonPrompt = function ( self )
	if not self.clearAllButtonPrompt then
		self.clearAllButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_CLEAR_ALL" ), self, "button_prompt_clear_all_rewards", false, nil, false, nil, "C" )
		self:addRightButtonPrompt( self.clearAllButtonPrompt )
	end
end

CoD.T6Rewards.RemoveClearAllButtonPrompt = function ( self )
	if self.clearAllButtonPrompt then
		self.clearAllButtonPrompt:close()
		self.clearAllButtonPrompt = nil
	end
end

CoD.T6Rewards.RemovePrestigeUnlockButton = function ( self, event )
	if self.prestigeUnlockButton then
		self.prestigeUnlockButton:close()
		self.prestigeUnlockButton = nil
	end
end

CoD.T6Rewards.AddPrestigeUnlockButton = function ( self, event )
	if self.prestigeUnlockButton == nil then
		self:addPrestigeUnlockButton()
	end
end

CoD.T6Rewards.HowManyInClassData = function ( itemIndex, classData )
	return CoD.HowManyInClassSlot( itemIndex, classData.primaryWeapon ) + CoD.HowManyInClassSlot( itemIndex, classData.secondaryWeapon ) + CoD.HowManyInClassSlot( itemIndex, classData.grenades ) + CoD.HowManyInClassSlot( itemIndex, classData.gadgets ) + CoD.HowManyInClassSlot( itemIndex, classData.perks ) + CoD.HowManyInClassSlot( itemIndex, classData.rewards )
end

CoD.T6Rewards.GetUnlockCountForGroup = function ( controller, weaponGroup )
	local unlockIndex = Engine.GetUnlockIndexFromGroupName( weaponGroup )
	local currentUnlocks = Engine.GetDStat( controller, "unlocks", unlockIndex )
	return currentUnlocks
end

CoD.T6Rewards.IsSelected = function ( itemIndex, classData )
	return CoD.T6Rewards.HowManyInClassData( itemIndex, classData ) > 0
end

CoD.T6Rewards.GetSelectedRewardCount = function ( controller )
	local rewardItems = CoD.GetUnlockablesByGroupName( "killstreak" )
	local classNumInternal = CoD.perController[controller].classNumInternal
	local classData = CoD.CACUtility.GetClassData( controller, classNumInternal )
	local selectedCount = 0
	for rewardItemsIndex, itemIndex in pairs( rewardItems ) do
		if CoD.T6Rewards.IsSelected( itemIndex, classData ) == true then
			selectedCount = selectedCount + 1
		end
	end
	return selectedCount
end

CoD.T6Rewards.GetLockedRewardCount = function ( controller )
	local rewardItems = CoD.GetUnlockablesByGroupName( "killstreak" )
	local classNumInternal = CoD.perController[controller].classNumInternal
	local classData = CoD.CACUtility.GetClassData( controller, classNumInternal )
	local lockedCount = 0
	for rewardItemsIndex, itemIndex in pairs( rewardItems ) do
		if Engine.IsItemLocked( controller, itemIndex ) then
			lockedCount = lockedCount + 1
		end
	end
	return lockedCount
end

CoD.T6Rewards.AddElements = function ( self )
	CoD.perController[self.m_ownerController].classNumInternal = 0
	self:addSelectButton()
	self:addBackButton()
	local top = CoD.textSize.Big + 5
	local gridDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = top,
		bottom = 0
	}
	self.contentGrid = CoD.ContentGrid.new( CoD.T6Rewards.GridColumns, gridDefaultAnimState, CoD.T6Rewards.GridItemWidth, CoD.T6Rewards.GridItemHeight, CoD.T6Rewards.GridItemSpacing )
	self:addElement( self.contentGrid )
	local rewardItems = CoD.GetUnlockablesByGroupName( "killstreak" )
	local rowCount = math.ceil( #rewardItems / CoD.T6Rewards.GridColumns )
	local hintTop = top + CoD.T6Rewards.GridItemHeight * rowCount + CoD.T6Rewards.GridItemSpacing * (rowCount - 1) + 3
	self.hintTextElement = CoD.HintText.new()
	self.hintTextElement:setLeftRight( true, true, 0, 0 )
	self.hintTextElement:setTopBottom( true, false, hintTop, hintTop + CoD.HintText.Height )
	self.hintTextElement:setColor( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b, 0.4 )
	self:addElement( self.hintTextElement )
	local gridItemSpacing = 8
	top = top + CoD.T6Rewards.GridItemHeight * 4 + gridItemSpacing * 3 + 3 + CoD.HintText.Height + 5
	local infoContainerTop = 0
	self.infoContainer = LUI.UIElement.new()
	self.infoContainer:setLeftRight( true, true, 0, 0 )
	self.infoContainer:setTopBottom( true, true, top, 0 )
	self:addElement( self.infoContainer )
	self.itemNameLabel = LUI.UIText.new()
	self.itemNameLabel:setLeftRight( true, false, 0, 1 )
	self.itemNameLabel:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Big )
	self.itemNameLabel:setFont( CoD.fonts.Big )
	self.itemNameLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.infoContainer:addElement( self.itemNameLabel )
	infoContainerTop = infoContainerTop + CoD.textSize.Big
	local requirementText = Engine.Localize( "MENU_SCORE_STREAK_REQ" ) .. ":"
	self.requirementLabel = LUI.UIText.new()
	self.requirementLabel:setLeftRight( true, false, 0, CoD.Menu.Width / 2 )
	self.requirementLabel:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Default )
	self.requirementLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.requirementLabel:setFont( CoD.fonts.Default )
	self.requirementLabel:setAlignment( LUI.Alignment.Left )
	self.requirementLabel:setText( requirementText )
	self.infoContainer:addElement( self.requirementLabel )
	local f14_local0 = {}
	local requirementDimensions = GetTextDimensions( requirementText, CoD.fonts.Default, CoD.textSize.Default )
	local costLeft = requirementDimensions[3] + 5
	self.itemMomentumCostLabel = LUI.UIText.new()
	self.itemMomentumCostLabel:setLeftRight( true, false, costLeft, costLeft + 1 )
	self.itemMomentumCostLabel:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Default )
	self.itemMomentumCostLabel:setFont( CoD.fonts.Default )
	self.itemMomentumCostLabel:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self.itemMomentumCostLabel:setAlignment( LUI.Alignment.Left )
	self.infoContainer:addElement( self.itemMomentumCostLabel )
	infoContainerTop = infoContainerTop + CoD.textSize.Default
	self.itemDescriptionLabel = LUI.UIText.new()
	self.itemDescriptionLabel:setLeftRight( true, false, 0, CoD.Menu.Width / 2 + 30 )
	self.itemDescriptionLabel:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Default )
	self.itemDescriptionLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.itemDescriptionLabel:setFont( CoD.fonts.Default )
	self.itemDescriptionLabel:setAlignment( LUI.Alignment.Left )
	self.itemDescriptionLabel:setAlpha( 0.4 )
	self.infoContainer:addElement( self.itemDescriptionLabel )
	infoContainerTop = infoContainerTop + CoD.textSize.Default
	local selectedRewardRatio = 0.7
	local selectedRewardWidth = CoD.T6Rewards.GridItemWidth * selectedRewardRatio
	local selectedRewardHeight = (CoD.T6Rewards.GridItemHeight - CoD.textSize[CoD.ContentGridButton.FontName] - 4) * selectedRewardRatio
	local selectedRewardImageSize = 130 * selectedRewardRatio
	local selectedRewardSpacing = 30
	local selectedRewardsContainerWidth = selectedRewardWidth * CoD.CACUtility.maxRewardSlots + selectedRewardSpacing * CoD.CACUtility.maxRewardSlots
	local selectedRewardsContainerTop = -156
	local selectedRewardsContainerHeight = 90
	local selectedRewardsContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -selectedRewardsContainerWidth,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = selectedRewardsContainerTop,
		bottom = selectedRewardsContainerTop + selectedRewardsContainerHeight
	} )
	self.infoContainer:addElement( selectedRewardsContainer )
	local borderDipCount = 3
	local borderTotalWidth = (selectedRewardWidth + selectedRewardSpacing) * borderDipCount
	selectedRewardsContainer.border = CoD.BorderDip.new( 1, 1, 1, 1, 0.1, nil, borderTotalWidth, borderDipCount )
	selectedRewardsContainer:addElement( selectedRewardsContainer.border )
	local selectedRewardsTitleLabel = LUI.UIText.new()
	selectedRewardsTitleLabel:setLeftRight( true, true, 0, 0 )
	selectedRewardsTitleLabel:setTopBottom( true, false, -CoD.textSize.Default, 0 )
	selectedRewardsTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	selectedRewardsTitleLabel:setAlpha( 0.4 )
	selectedRewardsTitleLabel:setFont( CoD.fonts.Default )
	selectedRewardsTitleLabel:setAlignment( LUI.Alignment.Left )
	selectedRewardsTitleLabel:setText( Engine.Localize( "MPUI_SELECTED_SCORE_STREAKS" ) .. ":" )
	selectedRewardsContainer:addElement( selectedRewardsTitleLabel )
	local selectedRewardsInfoTop = 8
	local selectedRewardLeft = selectedRewardSpacing / 2
	self.selectedRewards = {}
	for selectedRewardIndex = 1, CoD.CACUtility.maxRewardSlots, 1 do
		local selectedRewardDefaultAnimationState = {
			leftAnchor = true,
			rightAnchor = false,
			left = selectedRewardLeft,
			right = selectedRewardLeft + selectedRewardWidth,
			topAnchor = true,
			bottomAnchor = false,
			top = selectedRewardsInfoTop,
			bottom = selectedRewardsInfoTop + selectedRewardHeight
		}
		self.selectedRewards[selectedRewardIndex] = CoD.SelectedReward.New( selectedRewardDefaultAnimationState, selectedRewardImageSize )
		selectedRewardsContainer:addElement( self.selectedRewards[selectedRewardIndex] )
		local triangleSize = 20
		local triangleOffset = 10
		local triangleLeft = selectedRewardLeft + selectedRewardWidth + selectedRewardSpacing / 2 - triangleSize / 2
		local triangleTop = selectedRewardsInfoTop + selectedRewardHeight / 2 - triangleSize / 2
		if selectedRewardIndex < CoD.CACUtility.maxRewardSlots then
			local triangle = LUI.UIImage.new()
			triangle:setLeftRight( true, false, triangleLeft, triangleLeft + triangleSize )
			triangle:setTopBottom( true, false, triangleTop, triangleTop + triangleSize )
			triangle:setImage( RegisterMaterial( "demo_timeline_arrow" ) )
			triangle:setZRot( 270 )
			triangle:setAlpha( 0.2 )
			selectedRewardsContainer:addElement( triangle )
		end
		selectedRewardLeft = selectedRewardLeft + selectedRewardWidth + selectedRewardSpacing
	end
	selectedRewardsInfoTop = selectedRewardsInfoTop + selectedRewardHeight + selectedRewardSpacing
	self.unlockTokenLabel = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = selectedRewardsInfoTop,
		bottom = selectedRewardsInfoTop + CoD.textSize.Default,
		font = CoD.fonts.Default
	} )
	selectedRewardsContainer:addElement( self.unlockTokenLabel )
	CoD.T6Rewards.AddRewards( self, self.m_ownerController )
end

CoD.T6Rewards.AddRewards = function ( self, controller )
	local rewardItems = CoD.GetUnlockablesByGroupName( "killstreak" )
	table.sort( rewardItems, CoD.CACRewardComparisonFunction )
	local classNumInternal = CoD.perController[controller].classNumInternal
	local classData = CoD.CACUtility.GetClassData( controller, classNumInternal )
	local buttonToGainFocus, currentlyEquippedItem = nil
	for rewardItemsIndex, itemIndex in pairs( rewardItems ) do
		local newButton = CoD.RewardGridButton.new( itemIndex )
		if CoD.T6Rewards.IsSelected( itemIndex, classData ) == true then
			currentlyEquippedItem = itemIndex
		end
		self.contentGrid:addButton( newButton )
		if buttonToGainFocus == nil then
			buttonToGainFocus = newButton
		end
	end
	self:dispatchEventToChildren( {
		name = "highlighted",
		controller = controller,
		weaponItemIndex = currentlyEquippedItem
	} )
	self:dispatchEventToChildren( {
		name = "update_class",
		controller = controller,
		classData = classData
	} )
	CoD.T6Rewards.UpdateSelectedRewards( self, controller )
	if CoD.useController and not self.contentGrid:restoreState() then
		buttonToGainFocus:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

CoD.T6Rewards.UpdateSelectedRewards = function ( self, controller )
	local selectedRewards = self.selectedRewards
	local classNumInternal = CoD.perController[controller].classNumInternal
	local classData = CoD.CACUtility.GetClassData( controller, classNumInternal )
	local rewards = classData.rewards
	for i = 1, CoD.CACUtility.maxRewardSlots, 1 do
		CoD.SelectedReward.Update( selectedRewards[i], rewards[i] )
	end
	if #rewards > 0 then
		CoD.T6Rewards.AddClearAllButtonPrompt( self )
	end
	if #rewards == 0 then
		CoD.T6Rewards.RemoveClearAllButtonPrompt( self )
		CoD.T6Rewards.AddSelectButtonPrompt( self )
	end
end

CoD.T6Rewards.ItemButtonUpdateSelectionPreview = function ( self, event )
	if not self:isInFocus() then
		return 
	else
		self:dispatchEventToParent( {
			name = "update_selection_preview",
			controller = event.controller,
			rewardInfo = self.rewardInfo
		} )
	end
end

CoD.T6Rewards.ContentButtonHighlighted = function ( self, event )
	local controller = self.m_ownerController
	local classNumInternal = CoD.perController[controller].classNumInternal
	local classData = CoD.CACUtility.GetClassData( controller, classNumInternal )
	if event.contentIndex then
		self.itemNameLabel:setText( Engine.Localize( Engine.GetItemName( event.contentIndex ) ) )
		self.itemDescriptionLabel:setText( Engine.Localize( Engine.GetItemDesc( event.contentIndex ) ) )
		self.itemMomentumCostLabel:setText( Engine.GetItemMomentumCost( event.contentIndex ) )
		if CoD.T6Rewards.IsSelected( event.contentIndex, classData ) == true then
			CoD.T6Rewards.AddDeselectButtonPrompt( self )
		else
			local currentUnlocks = CoD.T6Rewards.GetUnlockCountForGroup( controller, Engine.GetItemGroup( event.contentIndex ) )
			if currentUnlocks == 0 or event.locked == true then
				self:removeSelectButton()
			else
				CoD.T6Rewards.AddSelectButtonPrompt( self )
			end
		end
	else
		self.itemNameLabel:setText( "" )
		self.itemDescriptionLabel:setText( "" )
		self.itemMomentumCostLabel:setText( "" )
	end
	self:dispatchEventToChildren( {
		name = "highlighted",
		controller = event.controller,
		weaponItemIndex = event.contentIndex
	} )
	self.weaponItemIndexHighlighted = event.contentIndex
	self.highlightedButton = event.button
	self.hintTextElement:updateText( event.hintText )
end

CoD.T6Rewards.PrestigeUnlock = function ( self, event )
	CoD.ConfirmPrestigeUnlock.OpenIfNecessary( self, event.controller, self.weaponItemIndexHighlighted, self.highlightedButton )
end

CoD.T6Rewards.ContentButtonSelected = function ( self, event )
	CoD.perController[event.controller].chosenItem = event.contentIndex
	local itemIndex = event.contentIndex
	local controller = event.controller
	local classNumInternal = CoD.perController[controller].classNumInternal
	local classData = CoD.CACUtility.GetClassData( controller, classNumInternal )
	if CoD.ConfirmPurchase.OpenIfNecessary( self, controller, itemIndex, event.button ) ~= nil then
		return 
	elseif CoD.T6Rewards.IsSelected( itemIndex, classData ) == true then
		self:processEvent( {
			name = "unequip",
			controller = controller,
			itemIndex = itemIndex
		} )
		CoD.T6Rewards.AddSelectButtonPrompt( self )
	elseif not Engine.IsItemPurchased( controller, itemIndex ) then
		Engine.PlaySound( CoD.CACUtility.denySFX )
	elseif event.button.inactive == true then
		local removeRewardPopup = self:openPopup( "RemoveReward", controller )
		if event.button.currentCostConflict == true then
			removeRewardPopup.header:setText( Engine.Localize( "MPUI_STREAK_REQ_CONFLICT_CAPS" ) )
			removeRewardPopup.subtitle:setText( Engine.Localize( "MPUI_STREAK_REQ_CONFLICT_DESC" ) )
		end
	else
		self:processEvent( {
			name = "equip",
			controller = controller,
			itemIndex = itemIndex
		} )
		CoD.T6Rewards.AddDeselectButtonPrompt( self )
	end
end

CoD.T6Rewards.UpdateUIFromClassData = function ( self, controller )
	self:dispatchEventToChildren( {
		name = "update_class",
		controller = controller
	} )
	CoD.T6Rewards.UpdateSelectedRewards( self, controller )
	local currentUnlocks = CoD.T6Rewards.GetUnlockCountForGroup( controller, "killstreak" )
	if CoD.T6Rewards.GetLockedRewardCount( controller ) > 0 then
		self.unlockTokenLabel:setText( currentUnlocks .. " " .. Engine.Localize( "MPUI_UNLOCKS_CAPS" ) )
	else
		self.unlockTokenLabel:setText( "" )
	end
end

CoD.T6Rewards.Equip = function ( self, event )
	local controller = event.controller
	local itemIndex = event.itemIndex
	local classNumInternal = CoD.perController[controller].classNumInternal
	for i = 1, CoD.CACUtility.maxRewardSlots, 1 do
		local itemSlot = CoD.CACUtility.loadoutSlotNames["reward" .. i]
		local itemInSlot = CoD.GetClassItem( controller, classNumInternal, itemSlot )
		if Engine.IsItemPurchased( controller, itemIndex ) and (itemInSlot == nil or itemInSlot == 0 or itemInSlot == Engine.GetItemIndex( CoD.nullKillstreakName )) then
			CoD.SetClassItem( controller, classNumInternal, itemSlot, itemIndex )
			break
		end
	end
	CoD.T6Rewards.UpdateUIFromClassData( self, controller )
end

CoD.T6Rewards.Purchased = function ( self, event )
	self:dispatchEventToChildren( {
		name = "update_class",
		controller = event.controller
	} )
	self:dispatchEventToChildren( event )
	self.hintTextElement:updateText( nil )
	if event.button.itemNameText then
		local selectedCount = CoD.T6Rewards.GetSelectedRewardCount( event.controller )
		if selectedCount == CoD.CACUtility.maxRewardSlots then
			event.button.itemNameText:registerAnimationState( "button_over", {
				red = CoD.offWhite.r,
				green = CoD.offWhite.g,
				blue = CoD.offWhite.b
			} )
		else
			event.button.itemNameText:registerAnimationState( "button_over", {
				red = CoD.BOIIOrange.r,
				green = CoD.BOIIOrange.g,
				blue = CoD.BOIIOrange.b
			} )
		end
		event.button.itemNameText:animateToState( "button_over" )
	end
	if event.button.highlight then
		event.button.highlight:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	end
	CoD.T6Rewards.AddSelectButtonPrompt( self )
	self:processEvent( {
		name = "remove_prestige_unlock_button"
	} )
end

CoD.T6Rewards.Unequip = function ( self, event )
	local controller = event.controller
	local classNumInternal = CoD.perController[controller].classNumInternal
	local itemIndex = event.itemIndex
	CoD.RemoveItemFromClass( controller, classNumInternal, itemIndex )
	CoD.T6Rewards.UpdateUIFromClassData( self, controller )
end

CoD.T6Rewards.ClearAllRewards = function ( self, event )
	local controller = event.controller
	local classNumInternal = CoD.perController[controller].classNumInternal
	for i = 1, CoD.CACUtility.maxRewardSlots, 1 do
		local itemSlot = CoD.CACUtility.loadoutSlotNames["reward" .. i]
		CoD.SetClassItem( controller, classNumInternal, itemSlot, 0 )
	end
	Engine.PlaySound( "cac_grid_equip_item" )
	CoD.T6Rewards.UpdateUIFromClassData( self, controller )
end

