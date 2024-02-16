CoD.CardCarousel = {}
CoD.CardCarousel.ItemWidth = 170
CoD.CardCarousel.ItemHeight = 170
CoD.CardCarousel.HighlighedItemWidth = 250
CoD.CardCarousel.HighlighedItemHeight = 230
CoD.CardCarousel.Spacing = 10
CoD.CardCarousel.ScrollTime = 170
CoD.CardCarousel.CardGrowShrinkTime = 170
CoD.CardCarousel.TitleSize = CoD.textSize.Big
CoD.CardCarousel.SpaceBetweenTitleAndCarousel = 10
CoD.CardCarousel.SpaceBetweenCarouselAndTitleList = 10
CoD.CardCarousel.TopOffset = 15
CoD.CardCarousel.EdgeBounceOffset = 20
CoD.CardCarousel.MiniCarouselItemHeight = 10
CoD.CardCarousel.MiniCarouselItemWidth = 10
CoD.CardCarousel.CardBigEvent = {
	name = "card_big"
}
CoD.CardCarousel.CardSmallEvent = {
	name = "card_small"
}
CoD.CardCarousel.HintTextLeft = 0
CoD.CardCarousel.HintTextWidth = 250
CoD.CardCarousel.HintTextHeight = 50
CoD.CardCarousel.HintFadeInTime = 500
CoD.CardCarousel.MouseDragDistance = 80
if CoD.isPC then
	CoD.CardCarousel.FadeTime = 50
else
	CoD.CardCarousel.FadeTime = 200
end
CoD.CardCarousel.GetCurrentCarouselInfo = function ( card )
	return {
		carouselIndex = card.cardCarousel.cardCarouselList.m_currentCardCarouselIndex,
		carouselID = card.cardCarousel.id,
		cardIndex = card.cardIndex
	}
end

CoD.CardCarousel.HorizontalListGainFocus = function ( self, event )
	self.m_scrollTime = 0
	self.cardCarousel.m_cardGrowShrinkTime = 0
	self.cardCarousel:animateToState( "fade_in", 0 )
	self:dispatchEventToChildren( {
		name = "enableGrowShrink"
	} )
	if self.m_currentCardIndex and self.cards[self.m_currentCardIndex] then
		self.cards[self.m_currentCardIndex]:processEvent( {
			name = "gain_focus",
			controller = event.controller
		} )
	elseif self.cards[1] ~= nil then
		self.cards[1]:processEvent( {
			name = "gain_focus",
			controller = event.controller
		} )
	end
	self.cardCarousel.m_isActive = true
end

CoD.CardCarousel.HorizontalListLoseFocus = function ( self, event )
	self.cardCarousel.m_isActive = false
	self:dispatchEventToChildren( {
		name = "disableGrowShrink"
	} )
	local moveDistance = -20
	self.cardCarousel:registerAnimationState( "fade_out", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = -CoD.CoD9Button.Height,
		topAnchor = true,
		bottomAnchor = false,
		top = moveDistance * self.cardCarousel.cardCarouselList.m_lastScrollDirection,
		bottom = self.cardCarousel.cardCarouselList.cardCarouselSize,
		alpha = 0
	} )
	self.cardCarousel:animateToState( "fade_out", self.cardCarousel.m_fadeTime )
	self:dispatchEventToChildren( event )
end

local CoD_CardCarousel_HintTextFadeOut = function ( self, event )
	self.hintTextContainer:beginAnimation( "fade_out", CoD.CardCarousel.HintFadeInTime )
	self.hintTextContainer:setAlpha( 0 )
end

local CoD_CardCarousel_HintTextFadeIn = function ( self, event )
	self.hintTextContainer.hintText:updateText( event.hintText )
	self.hintTextContainer:setAlpha( 0 )
	self.hintTextContainer:beginAnimation( "fade_in", CoD.CardCarousel.HintFadeInTime )
	self.hintTextContainer:setAlpha( 1 )
end

local CoD_CardCarousel_TransitionComplete_FadeOut = function ( self, event )
	self:animateToState( "default", 0 )
	CoD.CardCarouselList.UpdateCurrentCarousel( self.cardCarouselList )
end

local CoD_CardCarousel_MoveCarousel = function ( cardCarousel, cardIndex, duration )
	if cardCarousel.horizontalList.m_currentCardIndex == cardIndex then
		duration = 0
	end
	cardCarousel.horizontalList.m_currentCardIndex = cardIndex
	local leftAnchor = true
	local cardOffset = 1
	if cardCarousel.m_alignToCenter then
		leftAnchor = false
		cardOffset = 0
	end
	local offset = (cardCarousel.m_itemWidth + cardCarousel.m_spacing) * (cardCarousel.horizontalList.m_currentCardIndex - cardOffset)
	cardCarousel.horizontalList:registerAnimationState( "move_carousel", {
		leftAnchor = leftAnchor,
		rightAnchor = false,
		left = -offset,
		right = 0
	} )
	cardCarousel.horizontalList:animateToState( "move_carousel", duration, false, false )
end

local CoD_CardCarousel_TransitionComplete_EdgeBounce = function ( self, event )
	CoD_CardCarousel_MoveCarousel( self.cardCarousel, self.cardCarousel.horizontalList.m_currentCardIndex, self.cardCarousel.m_scrollTime / 2 )
end

function CoD_CardCarousel_PerformEdgeBounce( cardCarousel, direction, isRepeat )
	if direction == "left" and cardCarousel.horizontalList.m_currentCardIndex == 1 then
		if cardCarousel:getNumCards() > 1 and not isRepeat then
			local leftAnchor = true
			local cardOffset = 1
			if cardCarousel.m_alignToCenter then
				leftAnchor = false
				cardOffset = 0
			end
			local offset = (cardCarousel.m_itemWidth + cardCarousel.m_spacing) * (cardCarousel.horizontalList.m_currentCardIndex - cardOffset)
			cardCarousel.horizontalList:registerAnimationState( "edge_bounce", {
				leftAnchor = leftAnchor,
				rightAnchor = false,
				left = -offset + CoD.CardCarousel.EdgeBounceOffset,
				right = 0
			} )
			cardCarousel.horizontalList:animateToState( "edge_bounce", cardCarousel.m_scrollTime / 2, false, false )
			cardCarousel.horizontalList:registerEventHandler( "transition_complete_edge_bounce", CoD_CardCarousel_TransitionComplete_EdgeBounce )
		end
		if cardCarousel.cardCarouselList then
			cardCarousel.cardCarouselList.leftButtonRepeater:cancelRepetition()
		end
		return true
	elseif direction == "right" and cardCarousel.horizontalList.m_currentCardIndex == #cardCarousel.horizontalList.cards then
		if cardCarousel:getNumCards() > 1 and not isRepeat then
			local leftAnchor = true
			local cardOffset = 1
			if cardCarousel.m_alignToCenter then
				leftAnchor = false
				cardOffset = 0
			end
			local offset = (cardCarousel.m_itemWidth + cardCarousel.m_spacing) * (cardCarousel.horizontalList.m_currentCardIndex - cardOffset)
			cardCarousel.horizontalList:registerAnimationState( "edge_bounce", {
				leftAnchor = leftAnchor,
				rightAnchor = false,
				left = -offset - CoD.CardCarousel.EdgeBounceOffset,
				right = 0
			} )
			cardCarousel.horizontalList:animateToState( "edge_bounce", cardCarousel.m_scrollTime / 2, false, false )
			cardCarousel.horizontalList:registerEventHandler( "transition_complete_edge_bounce", CoD_CardCarousel_TransitionComplete_EdgeBounce )
		end
		if cardCarousel.cardCarouselList then
			cardCarousel.cardCarouselList.rightButtonRepeater:cancelRepetition()
		end
		return true
	else
		return false
	end
end

CoD.CardCarousel.Card_GainFocus = function ( self, event )
	if self.disableGrowShrink ~= true then
		self:animateToState( "big", self.cardCarousel.m_cardGrowShrinkTime )
		if self.centerImageContainer then
			self.centerImageContainer:animateToState( "big", self.cardCarousel.m_cardGrowShrinkTime )
		end
		self:processEvent( CoD.CardCarousel.CardBigEvent )
	end
	if not self.cardCarousel.disablePip then
		self.miniCard.backGround:animateToState( "fade_in", self.cardCarousel.m_cardGrowShrinkTime )
	end
	CoD_CardCarousel_MoveCarousel( self.cardCarousel, self.cardIndex, self.cardCarousel.m_scrollTime )
	self.cardCarousel.m_scrollTime = CoD.CardCarousel.ScrollTime
	self.cardCarousel.m_cardGrowShrinkTime = CoD.CardCarousel.CardGrowShrinkTime
	if self.border then
		self.border:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	end
	if self.highlight then
		if self.isLocked == true then
			self.highlight:setRGB( 1, 1, 1 )
		else
			self.highlight:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		end
	end
	self:dispatchEventToParent( {
		name = "card_gain_focus",
		card = self,
		hintText = event.hintText,
		hintImage = event.hintImage,
		controller = event.controller
	} )
	return LUI.UIButton.gainFocus( self, event )
end

CoD.CardCarousel.Card_LoseFocus = function ( self, event )
	LUI.UIButton.loseFocus( self, event )
	if self.disableGrowShrink ~= true then
		self:animateToState( "small", self.cardCarousel.m_cardGrowShrinkTime )
		if self.centerImageContainer then
			self.centerImageContainer:animateToState( "default", self.cardCarousel.m_cardGrowShrinkTime )
		end
		self:processEvent( CoD.CardCarousel.CardSmallEvent )
	end
	if self.border then
		self.border:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	end
	if not self.cardCarousel.disablePip then
		self.miniCard.backGround:animateToState( "default", self.cardCarousel.m_cardGrowShrinkTime )
	end
	self:dispatchEventToParent( {
		name = "card_lose_focus",
		controller = event.controller,
		card = self
	} )
end

local CoD_CardCarousel_Card_AddMiniCard = function ( card )
	local miniCard = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.CardCarousel.MiniCarouselItemWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	if not card.cardCarousel.disablePip then
		miniCard.backGround = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0,
			material = RegisterMaterial( "menu_vis_carousel_pip_fill" )
		} )
		miniCard:addElement( miniCard.backGround )
		miniCard.backGround:setPriority( 10 )
		local defaultPip = LUI.UIImage.new()
		defaultPip:setLeftRight( true, true, 0, 0 )
		defaultPip:setTopBottom( true, true, 0, 0 )
		defaultPip:setImage( RegisterMaterial( "menu_vis_carousel_pip" ) )
		miniCard:addElement( defaultPip )
		miniCard.backGround:registerAnimationState( "fade_in", {
			alpha = 1
		} )
	end
	card.miniCard = miniCard
	card.cardCarousel.miniCarousel:addElement( miniCard )
end

function CoD_CardCarousel_Card_EnableGrowShrink( self, event )
	self.disableGrowShrink = false
end

function CoD_CardCarousel_Card_DisableGrowShrink( self, event )
	self.disableGrowShrink = true
end

CoD.CardCarousel.Card_SetupCenterImage = function ( card, imageMaterialName, width, height, multiplier, isStreamed )
	local topAnchor = false
	local top = -height / 2
	local bottom = height / 2
	local sizeMultiplier = 1
	if multiplier then
		sizeMultiplier = multiplier
	end
	local newWidth = width * sizeMultiplier
	local newHeight = height * sizeMultiplier
	local bottomOffset = CoD.textSize.Default / 2
	local centerImageContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -width / 2,
		right = width / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -bottomOffset - height / 2,
		bottom = -bottomOffset + height / 2
	} )
	centerImageContainer:registerAnimationState( "big", {
		leftAnchor = false,
		rightAnchor = false,
		left = -newWidth / 2,
		right = newWidth / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -bottomOffset - newHeight / 2,
		bottom = -bottomOffset + newHeight / 2
	} )
	local centerImage = nil
	if isStreamed then
		centerImage = LUI.UIStreamedImage.new( nil, nil, true )
	else
		centerImage = LUI.UIImage.new()
	end
	centerImage:setLeftRight( true, true, 0, 0 )
	centerImage:setTopBottom( true, true, 0, 0 )
	centerImageContainer.centerImage = centerImage
	if imageMaterialName then
		centerImage:setImage( RegisterMaterial( imageMaterialName ) )
	end
	centerImageContainer:addElement( centerImage )
	centerImageContainer.centerImage = centerImage
	
	card.centerImageContainer = centerImageContainer
	card:addElement( centerImageContainer )
end

CoD.CardCarousel.AddNewCard = function ( self )
	local newCard = LUI.UIButton.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = self.m_itemWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	newCard.cardCarousel = self
	CoD_CardCarousel_Card_AddMiniCard( newCard )
	local topOffset = CoD.CardCarousel.TopOffset
	newCard:registerAnimationState( "default", {
		zoom = 0
	} )
	newCard:registerAnimationState( "small", {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = self.m_itemWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	newCard:registerAnimationState( "big", {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = self.m_highlightedItemWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = -topOffset,
		bottom = -topOffset + self.m_highlightedItemHeight
	} )
	newCard:registerEventHandler( "gain_focus", CoD.CardCarousel.Card_GainFocus )
	newCard:registerEventHandler( "lose_focus", CoD.CardCarousel.Card_LoseFocus )
	newCard:registerEventHandler( "enableGrowShrink", CoD_CardCarousel_Card_EnableGrowShrink )
	newCard:registerEventHandler( "disableGrowShrink", CoD_CardCarousel_Card_DisableGrowShrink )
	newCard.setupCenterImage = CoD.CardCarousel.Card_SetupCenterImage
	if CoD.useMouse then
		newCard:setHandleMouseMove( false )
		newCard:registerEventHandler( "leftmousedown", CoD.NullFunction )
		newCard:registerEventHandler( "leftmouseup", CoD.CardCarousel.CardLeftMouseUp )
	end
	newCard.border = CoD.BorderT6.new( 2, CoD.offGray.r, CoD.offGray.g, CoD.offGray.b, 1 )
	newCard:addElement( newCard.border )
	if self.cardGainFocusSFX ~= nil then
		newCard:setGainFocusSFX( self.cardGainFocusSFX )
	end
	if self.cardActionSFX ~= nil then
		newCard:setActionSFX( self.cardActionSFX )
	end
	self.horizontalList:addElement( newCard )
	table.insert( self.horizontalList.cards, newCard )
	newCard.cardIndex = #self.horizontalList.cards
	if newCard.cardIndex == 2 then
		self.miniCarouselContainer:close()
		self:addElement( self.miniCarouselContainer )
	end
	return newCard
end

CoD.CardCarousel.GetNumCards = function ( self )
	return #self.horizontalList.cards
end

CoD.CardCarousel.SetCardGainFocusSFX = function ( self, sfxName )
	self.cardGainFocusSFX = sfxName
end

CoD.CardCarousel.SetCardActionSFX = function ( self, sfxName )
	self.cardActionSFX = sfxName
end

CoD.CardCarousel.ClearAllItems = function ( self )
	self.horizontalList:removeAllChildren()
	self.miniCarousel:removeAllChildren()
	for i = 1, #self.horizontalList.cards, 1 do
		self.horizontalList.cards[i]:close()
		self.horizontalList.cards[i] = nil
	end
	self.horizontalList.cards = {}
end

CoD.CardCarousel.SetupHintTextContainer = function ( cardCarousel, titleTop )
	local hintLeft = CoD.CardCarousel.HintTextLeft
	if cardCarousel.m_hintTextParams and cardCarousel.m_hintTextParams.hintTextLeft then
		hintLeft = cardCarousel.m_hintTextParams.hintTextLeft
	end
	local hintWidth = CoD.CardCarousel.HintTextWidth
	if cardCarousel.m_hintTextParams and cardCarousel.m_hintTextParams.hintTextWidth then
		hintWidth = cardCarousel.m_hintTextParams.hintTextWidth
	end
	local hintTop = titleTop
	if cardCarousel.m_hintTextParams and cardCarousel.m_hintTextParams.hintTextTop then
		hintTop = titleTop + cardCarousel.m_hintTextParams.hintTextTop
	end
	local hintHeight = CoD.CardCarousel.HintTextHeight
	if cardCarousel.m_hintTextParams and cardCarousel.m_hintTextParams.hintTextHeight then
		hintHeight = cardCarousel.m_hintTextParams.hintTextHeight
	end
	cardCarousel.hintTextContainer = LUI.UIElement.new()
	cardCarousel.hintTextContainer:setLeftRight( true, false, hintLeft, hintLeft + hintWidth )
	cardCarousel.hintTextContainer:setTopBottom( true, false, hintTop, hintTop + hintHeight )
	cardCarousel.hintTextContainer.hintText = CoD.HintText.new()
	cardCarousel.hintTextContainer.hintText:setLeftRight( true, true, 0, 0 )
	cardCarousel.hintTextContainer.hintText:setTopBottom( true, false, 0, CoD.textSize.Default )
	cardCarousel.hintTextContainer.hintText:setAlignment( LUI.Alignment.Left )
	cardCarousel.hintTextContainer.hintText:setAlpha( 0.6 )
	cardCarousel.hintTextContainer:addElement( cardCarousel.hintTextContainer.hintText )
	cardCarousel:addElement( cardCarousel.hintTextContainer )
end

CoD.CardCarousel.SetupDefaultParams = function ( cardCarousel, itemWidth, itemHeight, highlightedItemWidth, highlightedItemHeight, hintTextParams, alignToCenter )
	cardCarousel.id = "CardCarousel"
	cardCarousel.m_spacing = CoD.CardCarousel.Spacing
	cardCarousel.m_itemWidth = CoD.CardCarousel.ItemWidth
	cardCarousel.m_itemHeight = CoD.CardCarousel.ItemHeight
	cardCarousel.m_highlightedItemWidth = CoD.CardCarousel.HighlighedItemWidth
	cardCarousel.m_highlightedItemHeight = CoD.CardCarousel.HighlighedItemHeight
	cardCarousel.m_hintTextParams = hintTextParams
	cardCarousel.m_scrollTime = 0
	cardCarousel.m_cardGrowShrinkTime = CoD.CardCarousel.CardGrowShrinkTime
	cardCarousel.m_fadeTime = CoD.CardCarousel.FadeTime
	cardCarousel.m_alignToCenter = alignToCenter
	if itemWidth ~= nil then
		cardCarousel.m_itemWidth = itemWidth
	end
	if itemHeight ~= nil then
		cardCarousel.m_itemHeight = itemHeight
	end
	if highlightedItemWidth ~= nil then
		cardCarousel.m_highlightedItemWidth = highlightedItemWidth
	end
	if highlightedItemHeight ~= nil then
		cardCarousel.m_highlightedItemHeight = highlightedItemHeight
	end
	cardCarousel.m_mouseDragDistance = CoD.CardCarousel.MouseDragDistance
end

CoD.CardCarousel.SetupMiniCarousel = function ( cardCarousel, miniCarouselTop )
	local leftAnchor = true
	local left = 0
	if cardCarousel.m_alignToCenter then
		leftAnchor = false
		left = -cardCarousel.m_highlightedItemWidth / 2 - cardCarousel.m_spacing
	end
	cardCarousel.miniCarouselContainer = LUI.UIElement.new( {
		leftAnchor = leftAnchor,
		rightAnchor = false,
		left = left,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = miniCarouselTop,
		bottom = miniCarouselTop + CoD.CardCarousel.MiniCarouselItemHeight
	} )
	cardCarousel.miniCarousel = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		spacing = 2
	} )
	cardCarousel.miniCarouselContainer:addElement( cardCarousel.miniCarousel )
end

CoD.CardCarousel.SetupTitleAndHorizontalList = function ( cardCarousel, topOffset, titleTop )
	cardCarousel.horizontalListContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = cardCarousel.m_highlightedItemHeight
	} )
	cardCarousel.horizontalList = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = topOffset,
		bottom = topOffset + cardCarousel.m_itemHeight,
		spacing = cardCarousel.m_spacing
	} )
	cardCarousel.horizontalListContainer:addElement( cardCarousel.horizontalList )
	cardCarousel.horizontalList.cardCarousel = cardCarousel
	cardCarousel.horizontalList.cards = {}
	cardCarousel.horizontalList:registerEventHandler( "gain_focus", CoD.CardCarousel.HorizontalListGainFocus )
	cardCarousel.horizontalList:registerEventHandler( "lose_focus", CoD.CardCarousel.HorizontalListLoseFocus )
	cardCarousel.title = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = titleTop,
		bottom = titleTop + CoD.CardCarousel.TitleSize,
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		font = CoD.fonts.Big
	} )
	cardCarousel:addElement( cardCarousel.title )
	cardCarousel:addElement( cardCarousel.horizontalListContainer )
end

CoD.CardCarousel.SetupDefaultFunctions = function ( cardCarousel )
	cardCarousel.addNewCard = CoD.CardCarousel.AddNewCard
	cardCarousel.getNumCards = CoD.CardCarousel.GetNumCards
	cardCarousel.setCardGainFocusSFX = CoD.CardCarousel.SetCardGainFocusSFX
	cardCarousel.setCardActionSFX = CoD.CardCarousel.SetCardActionSFX
	cardCarousel.clearAllItems = CoD.CardCarousel.ClearAllItems
end

CoD.CardCarousel.RegisterEventHandlers = function ( cardCarousel, hideHintText )
	if not hideHintText then
		cardCarousel:registerEventHandler( "hint_text_fade_out", CoD_CardCarousel_HintTextFadeOut )
		cardCarousel:registerEventHandler( "hint_text_fade_in", CoD_CardCarousel_HintTextFadeIn )
	end
	cardCarousel:registerEventHandler( "card_gain_focus", CoD.CardCarousel.CardGainFocus )
	cardCarousel:registerEventHandler( "card_lose_focus", CoD.CardCarousel.CardLoseFocus )
	cardCarousel:registerEventHandler( "transition_complete_fade_out", CoD_CardCarousel_TransitionComplete_FadeOut )
	if CoD.useMouse then
		cardCarousel:setHandleMouse( true )
		cardCarousel:registerEventHandler( "leftmouseup", CoD.CardCarousel.LeftMouseUp )
		cardCarousel:registerEventHandler( "leftmousedown", CoD.CardCarousel.LeftMouseDown )
		cardCarousel:registerEventHandler( "mousedrag", CoD.CardCarousel.MouseDrag )
		cardCarousel:registerEventHandler( "card_mouse_click", CoD.CardCarousel.CardMouseClick )
	end
end

CoD.CardCarousel.new = function ( defaultAnimationState, itemWidth, itemHeight, highlightedItemWidth, highlightedItemHeight, hintTextParams, alignToCenter, hideHintText )
	local cardCarousel = LUI.UIElement.new( defaultAnimationState )
	local padding = CoD.CardCarousel.SpaceBetweenTitleAndCarousel
	local topOffset = CoD.CardCarousel.TopOffset
	CoD.CardCarousel.SetupDefaultParams( cardCarousel, itemWidth, itemHeight, highlightedItemWidth, highlightedItemHeight, hintTextParams, alignToCenter )
	local miniCarouselTop = padding + cardCarousel.m_highlightedItemHeight
	local titleTop = miniCarouselTop + CoD.CardCarousel.MiniCarouselItemHeight + padding
	CoD.CardCarousel.SetupMiniCarousel( cardCarousel, miniCarouselTop )
	CoD.CardCarousel.SetupTitleAndHorizontalList( cardCarousel, topOffset, titleTop )
	if not hideHintText then
		CoD.CardCarousel.SetupHintTextContainer( cardCarousel, titleTop )
	end
	CoD.CardCarousel.SetupDefaultFunctions( cardCarousel )
	CoD.CardCarousel.RegisterEventHandlers( cardCarousel, hideHintText )
	cardCarousel:registerAnimationState( "fade_in", {
		alphaMultiplier = 1
	} )
	return cardCarousel
end

CoD.CardCarousel.CardGainFocus = function ( self, event )
	local hintText = event.card.hintText
	self:processEvent( {
		name = "hint_text_fade_in",
		hintText = hintText
	} )
	self:dispatchEventToParent( event )
end

CoD.CardCarousel.CardLoseFocus = function ( self, event )
	self:processEvent( {
		name = "hint_text_fade_out"
	} )
	self:dispatchEventToParent( event )
end

CoD.CardCarousel.GetCardByIndex = function ( selectedCarousel, index )
	if selectedCarousel then
		return selectedCarousel.horizontalList.cards[index]
	else
		return nil
	end
end

CoD.CardCarousel.GetSelectedCardIndex = function ( selectedCarousel )
	return selectedCarousel.horizontalList.m_currentCardIndex
end

CoD.CardCarousel.LeftMouseUp = function ( self, event )
	self.m_curX = nil
	self.m_curY = nil
	if self.m_mouseDrag then
		self.m_mouseDrag = nil
		return true
	else
		
	end
end

CoD.CardCarousel.LeftMouseDown = function ( self, event )
	self.m_curX = event.x
	self.m_curY = event.y
end

CoD.CardCarousel.MouseDrag = function ( self, event )
	if self.m_curX == nil or not self.m_isActive then
		return 
	elseif self.m_mouseDragDistance < math.abs( self.m_curX - event.x ) then
		local scrollDirection = nil
		if self.m_curX < event.x then
			scrollDirection = -1
		else
			scrollDirection = 1
		end
		self.m_curX = event.x
		self.m_mouseDrag = true
		local cards = self.horizontalList.cards
		local currentCardIndex = self.horizontalList.m_currentCardIndex
		if not (currentCardIndex ~= nil and (currentCardIndex > 1 or scrollDirection ~= -1)) or self:getNumCards() <= currentCardIndex and scrollDirection == 1 then
			return 
		end
		local currentCard = cards[currentCardIndex]
		local nextCard = cards[currentCardIndex + scrollDirection]
		if currentCard ~= nil then
			currentCard:processEvent( {
				name = "lose_focus",
				controller = event.controller
			} )
		end
		if nextCard ~= nil then
			nextCard:processEvent( {
				name = "gain_focus",
				controller = event.controller
			} )
		end
	end
end

CoD.CardCarousel.CardLeftMouseUp = function ( self, event )
	if event.inside then
		self:dispatchEventToParent( {
			name = "card_mouse_click",
			controller = event.controller,
			cardIndex = self.cardIndex
		} )
	end
end

CoD.CardCarousel.CardMouseClick = function ( self, event )
	if not self.m_isActive then
		return 
	end
	local cards = self.horizontalList.cards
	local currentIndex = self.horizontalList.m_currentCardIndex
	local nextIndex = event.cardIndex
	local currentCard = cards[currentIndex]
	local nextCard = cards[nextIndex]
	if nextIndex ~= currentIndex then
		if currentCard ~= nil then
			currentCard:processEvent( {
				name = "lose_focus",
				controller = event.controller
			} )
		end
		if nextCard ~= nil then
			nextCard:processEvent( {
				name = "gain_focus",
				controller = event.controller
			} )
		end
	elseif currentCard ~= nil and currentCard:isInFocus() then
		if currentCard.m_eventHandlers.button_action then
			currentCard:processEvent( {
				name = "button_action",
				controller = event.controller
			} )
		elseif currentCard.actionEventName then
			currentCard:dispatchEventToParent( {
				name = currentCard.actionEventName,
				controller = event.controller,
				button = currentCard
			} )
		end
	end
end

