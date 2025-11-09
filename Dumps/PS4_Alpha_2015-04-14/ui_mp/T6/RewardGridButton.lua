CoD.RewardGridButton = {}
CoD.RewardGridButton.glowBackColor = {}
CoD.RewardGridButton.glowBackColor.r = 1
CoD.RewardGridButton.glowBackColor.g = 1
CoD.RewardGridButton.glowBackColor.b = 1
CoD.RewardGridButton.glowFrontColor = {}
CoD.RewardGridButton.glowFrontColor.r = 1
CoD.RewardGridButton.glowFrontColor.g = 1
CoD.RewardGridButton.glowFrontColor.b = 1
CoD.RewardGridButton.new = function ( rewardIndex )
	local self = CoD.ContentGridButton.new( rewardIndex )
	self.statIndex = rewardIndex
	CoD.ContentGridButton.SetupButtonText( self, Engine.Localize( Engine.GetItemName( rewardIndex ) ) )
	CoD.RewardGridButton.SetupButtonImages( self, Engine.GetItemImage( rewardIndex ) )
	self:setRestrictedImage( Engine.IsItemIndexRestricted( rewardIndex ) )
	self:registerEventHandler( "update_class", CoD.RewardGridButton.UpdateClass )
	return self
end

CoD.RewardGridButton.SetupButtonImages = function ( self, rewardImage )
	local imageHeight = 130
	local imageWidth = imageHeight
	local imageTopOffset = -20
	local imageName = rewardImage .. "_menu"
	local bottomTitleHeight = CoD.ContentGridButton.TitleHeight + 4
	if self.itemImage then
		self.itemImage:close()
		self.itemImage = nil
	end
	if imageName then
		local imageStencilContainer = LUI.UIElement.new()
		imageStencilContainer:setLeftRight( true, true, 2, -2 )
		imageStencilContainer:setTopBottom( true, true, 2, -bottomTitleHeight - 1.5 )
		imageStencilContainer:setPriority( -70 )
		self:addElement( imageStencilContainer )
		imageStencilContainer:setUseStencil( true )
		self.itemImage = LUI.UIImage.new()
		self.itemImage:setLeftRight( false, false, -imageWidth / 2, imageWidth / 2 )
		self.itemImage:setTopBottom( true, false, imageTopOffset, imageTopOffset + imageHeight )
		self.itemImage:setImage( RegisterMaterial( imageName ) )
		imageStencilContainer:addElement( self.itemImage )
	end
	CoD.ContentGridButton.SetupButtonImages( self, CoD.RewardGridButton.glowBackColor, CoD.RewardGridButton.glowFrontColor )
end

CoD.RewardGridButton.UpdateClass = function ( self, event )
	self:setMutuallyExclusive( nil )
	self.selectedFill:setAlpha( 0 )
	self.glowGradFront:setRGB( CoD.RewardGridButton.glowFrontColor.r, CoD.RewardGridButton.glowFrontColor.g, CoD.RewardGridButton.glowFrontColor.b )
	self.glowGradFront:setAlpha( 0.05 )
	local controller = event.controller
	local classData = CoD.CACUtility.GetClassData( controller )
	local rewardItems = CoD.GetUnlockablesByGroupName( "killstreak" )
	local currentSelectedRewards = {}
	local currentIndex = 1
	for index, itemIndex in ipairs( rewardItems ) do
		if CoD.T6Rewards.IsSelected( itemIndex, classData ) == true then
			currentSelectedRewards[currentIndex] = {}
			currentSelectedRewards[currentIndex].itemIndex = itemIndex
			currentSelectedRewards[currentIndex].momentumCost = Engine.GetItemMomentumCost( itemIndex )
			currentIndex = currentIndex + 1
		end
	end
	local currentIsSelected = false
	self.currentCostConflict = false
	for index = 1, #currentSelectedRewards, 1 do
		if self.contentIndex == currentSelectedRewards[index].itemIndex then
			self.selectedFill:setAlpha( 0.2 )
			self.glowGradFront:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
			self.glowGradFront:setAlpha( 0.2 )
			self:setHintText( Engine.Localize( "MPUI_ITEM_CURRENTLY_EQUIPPED_IN_ANOTHER_SLOT" ) )
			currentIsSelected = true
			break
		end
		local currentMomentumCost = Engine.GetItemMomentumCost( self.contentIndex )
		if currentMomentumCost == currentSelectedRewards[index].momentumCost then
			self.currentCostConflict = true
		end
	end
	if currentIsSelected == false and (#currentSelectedRewards == CoD.CACUtility.maxRewardSlots or self.currentCostConflict == true) then
		self:setInactive( true )
		self.highlight:setRGB( 1, 1, 1 )
		self.itemNameText:registerAnimationState( "button_over", {
			red = 1,
			green = 1,
			blue = 1
		} )
		self:registerAnimationState( "button_over", {
			alpha = 1,
			zoom = 40
		} )
		if self:isInFocus() then
			self:animateToState( "button_over" )
		end
	else
		self:setInactive( false )
		self.highlight:setRGB( 1, 1, 1 )
		self.itemNameText:registerAnimationState( "button_over", {
			red = CoD.BOIIOrange.r,
			green = CoD.BOIIOrange.g,
			blue = CoD.BOIIOrange.b
		} )
		self:registerAnimationState( "button_over", {
			alpha = 1,
			zoom = 40
		} )
	end
	if Engine.IsItemLocked( controller, self.statIndex ) then
		self:setLocked( true )
	else
		self:setLocked( false )
		if Engine.IsItemPurchased( controller, self.statIndex ) then
			self:setPurchased( true )
		else
			self:setPurchased( false )
		end
	end
	if Engine.IsItemNew( controller, self.statIndex ) then
		self:setNew( true )
	else
		self:setNew( false )
	end
	if self.mutuallyExclusiveIcon == nil and self.lockImage == nil and self.tokenImage == nil then
		self:setHintText( nil )
	end
end

