CoD.RemoveReward = {}
CoD.RemoveReward.ItemRatio = 1.7
CoD.RemoveReward.ItemWidth = CoD.T6Rewards.GridItemWidth * CoD.RemoveReward.ItemRatio
CoD.RemoveReward.ItemHeight = CoD.T6Rewards.GridItemHeight * CoD.RemoveReward.ItemRatio
CoD.RemoveReward.HighlightedItemRatio = 2.5
CoD.RemoveReward.HighlightedItemWidth = CoD.T6Rewards.GridItemWidth * CoD.RemoveReward.HighlightedItemRatio
CoD.RemoveReward.HighlightedItemHeight = CoD.T6Rewards.GridItemHeight * CoD.RemoveReward.HighlightedItemRatio
LUI.createMenu.RemoveReward = function ( controller )
	local removeRewardMenu = CoD.Menu.NewMediumPopup( "RemoveReward" )
	removeRewardMenu:setOwner( controller )
	removeRewardMenu.equipEventName = "equip"
	removeRewardMenu:addSelectButton( Engine.Localize( "MPUI_REPLACE" ) )
	removeRewardMenu:addBackButton()
	removeRewardMenu:registerEventHandler( "remove_killstreak", CoD.RemoveReward.RemoveKillstreak )
	removeRewardMenu.header = LUI.UIText.new()
	removeRewardMenu.header:setLeftRight( true, false, 0, 1 )
	removeRewardMenu.header:setTopBottom( true, false, 0, CoD.textSize.Big )
	removeRewardMenu.header:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	removeRewardMenu.header:setFont( CoD.fonts.Big )
	removeRewardMenu.header:setText( Engine.Localize( "MPUI_TOO_MANY_STREAKS_CAPS" ) )
	removeRewardMenu:addElement( removeRewardMenu.header )
	local subtitleLeft = 2
	removeRewardMenu.subtitle = LUI.UIText.new()
	removeRewardMenu.subtitle:setLeftRight( true, false, subtitleLeft, subtitleLeft + 1 )
	removeRewardMenu.subtitle:setTopBottom( true, false, CoD.textSize.Big, CoD.textSize.Big + CoD.textSize.Default )
	removeRewardMenu.subtitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	removeRewardMenu.subtitle:setFont( CoD.fonts.Default )
	removeRewardMenu.subtitle:setText( Engine.Localize( "MPUI_TOO_MANY_STREAKS_DESC" ) )
	removeRewardMenu:addElement( removeRewardMenu.subtitle )
	local cardCarouselDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.textSize.Big + 35,
		bottom = 0
	}
	local cardCarouselList = CoD.CardCarouselList.new( cardCarouselDefaultAnimState, controller, CoD.RemoveReward.ItemWidth, CoD.RemoveReward.ItemHeight, CoD.RemoveReward.HighlightedItemWidth, CoD.RemoveReward.HighlightedItemHeight )
	cardCarouselList:setLRSFX( CoD.CACUtility.carouselLRSFX )
	cardCarouselList:setUpSFX( CoD.CACUtility.carouselUpSFX )
	cardCarouselList:setDownSFX( CoD.CACUtility.carouselDownSFX )
	cardCarouselList:setEquipSFX( CoD.CACUtility.carouselEquipSFX )
	removeRewardMenu:addElement( cardCarouselList )
	local cardCarousel = cardCarouselList:addCardCarousel( "" )
	CoD.RemoveReward.AddRewardCards( cardCarousel, controller )
	cardCarouselList.cardCarousels[cardCarouselList.m_currentCardCarouselIndex].horizontalList:processEvent( {
		name = "gain_focus"
	} )
	return removeRewardMenu
end

CoD.RemoveReward.SetupCard = function ( card, titleText, glowBackColor, glowFrontColor )
	if card.border then
		card.border:close()
	end
	if card.highlightedborder then
		card.highlightedborder:close()
	end
	local defaultBottomTitleHeight = 30
	local largeBottomTitleHeight = 40
	CoD.ContentGridButton.CarouselSetupButtonImages( card, defaultBottomTitleHeight, largeBottomTitleHeight, glowBackColor, glowFrontColor )
	card.titleElement = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 7,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.textSize.Default - 4,
		bottom = -4,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	card.titleText = Engine.Localize( titleText )
	card.titleElement:setText( card.titleText )
	card.titleElement:registerAnimationState( "button_over", {
		leftAnchor = true,
		rightAnchor = true,
		left = 8,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.textSize.Condensed - 5,
		bottom = -5,
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Left
	} )
	LUI.UIButton.SetupElement( card.titleElement )
	card:addElement( card.titleElement )
	card.imageStencilContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 2,
		right = -2,
		topAnchor = true,
		bottomAnchor = true,
		top = 2,
		bottom = -defaultBottomTitleHeight - 2
	} )
	card.imageStencilContainer:registerAnimationState( "button_over", {
		leftAnchor = true,
		rightAnchor = true,
		left = 2,
		right = -2,
		topAnchor = true,
		bottomAnchor = true,
		top = 1,
		bottom = -largeBottomTitleHeight - 2
	} )
	card.imageStencilContainer:setPriority( -70 )
	card:addElement( card.imageStencilContainer )
	card.imageStencilContainer:setUseStencil( true )
	LUI.UIButton.SetupElement( card.imageStencilContainer )
end

CoD.RemoveReward.AddRewardCards = function ( cardCarousel, controller )
	local classNumInternal = CoD.perController[controller].classNumInternal
	local classData = CoD.CACUtility.GetClassData( controller, classNumInternal )
	local rewards = classData.rewards
	for index = 1, CoD.CACUtility.maxRewardSlots, 1 do
		local reward = rewards[index]
		if reward ~= nil and reward.itemIndex then
			local card = cardCarousel:addNewCard()
			card.itemIndex = reward.itemIndex
			CoD.RemoveReward.SetupCard( card, reward.name, CoD.RewardGridButton.glowBackColor, CoD.RewardGridButton.glowFrontColor )
			local defaultImageHeight = 130 * CoD.RemoveReward.ItemRatio
			local defaultImageWidth = defaultImageHeight
			local defaultImageTopOffset = -20 * CoD.RemoveReward.ItemRatio
			local largeImageHeight = 130 * CoD.RemoveReward.HighlightedItemRatio
			local largeImageWidth = largeImageHeight
			local largeImageTopOffset = -20 * CoD.RemoveReward.HighlightedItemRatio
			card.iconMaterial = RegisterMaterial( Engine.GetItemImage( reward.itemIndex ) .. "_menu" )
			card.icon = LUI.UIImage.new( {
				leftAnchor = false,
				rightAnchor = false,
				left = -defaultImageWidth / 2,
				right = defaultImageWidth / 2,
				topAnchor = true,
				bottomAnchor = false,
				top = defaultImageTopOffset,
				bottom = defaultImageTopOffset + defaultImageHeight,
				material = card.iconMaterial
			} )
			card.icon:registerAnimationState( "button_over", {
				leftAnchor = false,
				rightAnchor = false,
				left = -largeImageWidth / 2,
				right = largeImageWidth / 2,
				topAnchor = true,
				bottomAnchor = false,
				top = largeImageTopOffset,
				bottom = largeImageTopOffset + largeImageHeight
			} )
			LUI.UIButton.SetupElement( card.icon )
			card.icon.overDuration = CoD.CardCarousel.CardGrowShrinkTime
			card.icon.upDuration = CoD.CardCarousel.CardGrowShrinkTime
			card.imageStencilContainer:addElement( card.icon )
			card.hintText = Engine.Localize( "MENU_SCORE_STREAK_REQ" ) .. ": " .. reward.momentumCost
			card:setActionEventName( "remove_killstreak" )
		end
	end
end

CoD.RemoveReward.RemoveKillstreak = function ( self, event )
	local classNumInternal = CoD.perController[event.controller].classNumInternal
	local currentItemIndex = CoD.perController[event.controller].chosenItem
	CoD.RemoveItemFromClass( event.controller, classNumInternal, event.button.itemIndex )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = self.equipEventName,
		controller = event.controller,
		itemIndex = currentItemIndex
	} )
end

