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
CoD.CardCarousel.GetCurrentCarouselInfo = function ( f1_arg0 )
	return {
		carouselIndex = f1_arg0.cardCarousel.cardCarouselList.m_currentCardCarouselIndex,
		carouselID = f1_arg0.cardCarousel.id,
		cardIndex = f1_arg0.cardIndex
	}
end

CoD.CardCarousel.HorizontalListGainFocus = function ( f2_arg0, f2_arg1 )
	f2_arg0.m_scrollTime = 0
	f2_arg0.cardCarousel.m_cardGrowShrinkTime = 0
	f2_arg0.cardCarousel:animateToState( "fade_in", 0 )
	f2_arg0:dispatchEventToChildren( {
		name = "enableGrowShrink"
	} )
	if f2_arg0.m_currentCardIndex and f2_arg0.cards[f2_arg0.m_currentCardIndex] then
		f2_arg0.cards[f2_arg0.m_currentCardIndex]:processEvent( {
			name = "gain_focus",
			controller = f2_arg1.controller
		} )
	elseif f2_arg0.cards[1] ~= nil then
		f2_arg0.cards[1]:processEvent( {
			name = "gain_focus",
			controller = f2_arg1.controller
		} )
	end
	f2_arg0.cardCarousel.m_isActive = true
end

CoD.CardCarousel.HorizontalListLoseFocus = function ( f3_arg0, f3_arg1 )
	f3_arg0.cardCarousel.m_isActive = false
	f3_arg0:dispatchEventToChildren( {
		name = "disableGrowShrink"
	} )
	f3_arg0.cardCarousel:registerAnimationState( "fade_out", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = -CoD.CoD9Button.Height,
		topAnchor = true,
		bottomAnchor = false,
		top = -20 * f3_arg0.cardCarousel.cardCarouselList.m_lastScrollDirection,
		bottom = f3_arg0.cardCarousel.cardCarouselList.cardCarouselSize,
		alpha = 0
	} )
	f3_arg0.cardCarousel:animateToState( "fade_out", f3_arg0.cardCarousel.m_fadeTime )
	f3_arg0:dispatchEventToChildren( f3_arg1 )
end

local f0_local0 = function ( f4_arg0, f4_arg1 )
	f4_arg0.hintTextContainer:beginAnimation( "fade_out", CoD.CardCarousel.HintFadeInTime )
	f4_arg0.hintTextContainer:setAlpha( 0 )
end

local f0_local1 = function ( f5_arg0, f5_arg1 )
	f5_arg0.hintTextContainer.hintText:updateText( f5_arg1.hintText )
	f5_arg0.hintTextContainer:setAlpha( 0 )
	f5_arg0.hintTextContainer:beginAnimation( "fade_in", CoD.CardCarousel.HintFadeInTime )
	f5_arg0.hintTextContainer:setAlpha( 1 )
end

local f0_local2 = function ( f6_arg0, f6_arg1 )
	f6_arg0:animateToState( "default", 0 )
	CoD.CardCarouselList.UpdateCurrentCarousel( f6_arg0.cardCarouselList )
end

local f0_local3 = function ( f7_arg0, f7_arg1, f7_arg2 )
	if f7_arg0.horizontalList.m_currentCardIndex == f7_arg1 then
		f7_arg2 = 0
	end
	f7_arg0.horizontalList.m_currentCardIndex = f7_arg1
	local f7_local0 = true
	local f7_local1 = 1
	if f7_arg0.m_alignToCenter then
		f7_local0 = false
		f7_local1 = 0
	end
	f7_arg0.horizontalList:registerAnimationState( "move_carousel", {
		leftAnchor = f7_local0,
		rightAnchor = false,
		left = -((f7_arg0.m_itemWidth + f7_arg0.m_spacing) * (f7_arg0.horizontalList.m_currentCardIndex - f7_local1)),
		right = 0
	} )
	f7_arg0.horizontalList:animateToState( "move_carousel", f7_arg2, false, false )
end

local f0_local4 = function ( f8_arg0, f8_arg1 )
	f0_local3( f8_arg0.cardCarousel, f8_arg0.cardCarousel.horizontalList.m_currentCardIndex, f8_arg0.cardCarousel.m_scrollTime / 2 )
end

function CoD_CardCarousel_PerformEdgeBounce( f9_arg0, f9_arg1, f9_arg2 )
	if f9_arg1 == "left" and f9_arg0.horizontalList.m_currentCardIndex == 1 then
		if f9_arg0:getNumCards() > 1 and not f9_arg2 then
			local f9_local0 = true
			local f9_local1 = 1
			if f9_arg0.m_alignToCenter then
				f9_local0 = false
				f9_local1 = 0
			end
			f9_arg0.horizontalList:registerAnimationState( "edge_bounce", {
				leftAnchor = f9_local0,
				rightAnchor = false,
				left = -((f9_arg0.m_itemWidth + f9_arg0.m_spacing) * (f9_arg0.horizontalList.m_currentCardIndex - f9_local1)) + CoD.CardCarousel.EdgeBounceOffset,
				right = 0
			} )
			f9_arg0.horizontalList:animateToState( "edge_bounce", f9_arg0.m_scrollTime / 2, false, false )
			f9_arg0.horizontalList:registerEventHandler( "transition_complete_edge_bounce", f0_local4 )
		end
		if f9_arg0.cardCarouselList then
			f9_arg0.cardCarouselList.leftButtonRepeater:cancelRepetition()
		end
		return true
	elseif f9_arg1 == "right" and f9_arg0.horizontalList.m_currentCardIndex == #f9_arg0.horizontalList.cards then
		if f9_arg0:getNumCards() > 1 and not f9_arg2 then
			local f9_local0 = true
			local f9_local1 = 1
			if f9_arg0.m_alignToCenter then
				f9_local0 = false
				f9_local1 = 0
			end
			f9_arg0.horizontalList:registerAnimationState( "edge_bounce", {
				leftAnchor = f9_local0,
				rightAnchor = false,
				left = -((f9_arg0.m_itemWidth + f9_arg0.m_spacing) * (f9_arg0.horizontalList.m_currentCardIndex - f9_local1)) - CoD.CardCarousel.EdgeBounceOffset,
				right = 0
			} )
			f9_arg0.horizontalList:animateToState( "edge_bounce", f9_arg0.m_scrollTime / 2, false, false )
			f9_arg0.horizontalList:registerEventHandler( "transition_complete_edge_bounce", f0_local4 )
		end
		if f9_arg0.cardCarouselList then
			f9_arg0.cardCarouselList.rightButtonRepeater:cancelRepetition()
		end
		return true
	else
		return false
	end
end

CoD.CardCarousel.Card_GainFocus = function ( f10_arg0, f10_arg1 )
	if f10_arg0.disableGrowShrink ~= true then
		f10_arg0:animateToState( "big", f10_arg0.cardCarousel.m_cardGrowShrinkTime )
		if f10_arg0.centerImageContainer then
			f10_arg0.centerImageContainer:animateToState( "big", f10_arg0.cardCarousel.m_cardGrowShrinkTime )
		end
		f10_arg0:processEvent( CoD.CardCarousel.CardBigEvent )
	end
	if not f10_arg0.cardCarousel.disablePip then
		f10_arg0.miniCard.backGround:animateToState( "fade_in", f10_arg0.cardCarousel.m_cardGrowShrinkTime )
	end
	f0_local3( f10_arg0.cardCarousel, f10_arg0.cardIndex, f10_arg0.cardCarousel.m_scrollTime )
	f10_arg0.cardCarousel.m_scrollTime = CoD.CardCarousel.ScrollTime
	f10_arg0.cardCarousel.m_cardGrowShrinkTime = CoD.CardCarousel.CardGrowShrinkTime
	if f10_arg0.border then
		f10_arg0.border:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	end
	if f10_arg0.highlight then
		if f10_arg0.isLocked == true then
			f10_arg0.highlight:setRGB( 1, 1, 1 )
		else
			f10_arg0.highlight:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		end
	end
	f10_arg0:dispatchEventToParent( {
		name = "card_gain_focus",
		card = f10_arg0,
		hintText = f10_arg1.hintText,
		hintImage = f10_arg1.hintImage,
		controller = f10_arg1.controller
	} )
	return LUI.UIButton.gainFocus( f10_arg0, f10_arg1 )
end

CoD.CardCarousel.Card_LoseFocus = function ( f11_arg0, f11_arg1 )
	LUI.UIButton.loseFocus( f11_arg0, f11_arg1 )
	if f11_arg0.disableGrowShrink ~= true then
		f11_arg0:animateToState( "small", f11_arg0.cardCarousel.m_cardGrowShrinkTime )
		if f11_arg0.centerImageContainer then
			f11_arg0.centerImageContainer:animateToState( "default", f11_arg0.cardCarousel.m_cardGrowShrinkTime )
		end
		f11_arg0:processEvent( CoD.CardCarousel.CardSmallEvent )
	end
	if f11_arg0.border then
		f11_arg0.border:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	end
	if not f11_arg0.cardCarousel.disablePip then
		f11_arg0.miniCard.backGround:animateToState( "default", f11_arg0.cardCarousel.m_cardGrowShrinkTime )
	end
	f11_arg0:dispatchEventToParent( {
		name = "card_lose_focus",
		controller = f11_arg1.controller,
		card = f11_arg0
	} )
end

local f0_local5 = function ( f12_arg0 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.CardCarousel.MiniCarouselItemWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	if not f12_arg0.cardCarousel.disablePip then
		self.backGround = LUI.UIImage.new( {
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
		self:addElement( self.backGround )
		self.backGround:setPriority( 10 )
		local f12_local1 = LUI.UIImage.new()
		f12_local1:setLeftRight( true, true, 0, 0 )
		f12_local1:setTopBottom( true, true, 0, 0 )
		f12_local1:setImage( RegisterMaterial( "menu_vis_carousel_pip" ) )
		self:addElement( f12_local1 )
		self.backGround:registerAnimationState( "fade_in", {
			alpha = 1
		} )
	end
	f12_arg0.miniCard = self
	f12_arg0.cardCarousel.miniCarousel:addElement( self )
end

function CoD_CardCarousel_Card_EnableGrowShrink( f13_arg0, f13_arg1 )
	f13_arg0.disableGrowShrink = false
end

function CoD_CardCarousel_Card_DisableGrowShrink( f14_arg0, f14_arg1 )
	f14_arg0.disableGrowShrink = true
end

CoD.CardCarousel.Card_SetupCenterImage = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5 )
	local f15_local0 = false
	local f15_local1 = -f15_arg3 / 2
	local f15_local2 = f15_arg3 / 2
	local f15_local3 = 1
	if f15_arg4 then
		f15_local3 = f15_arg4
	end
	local f15_local4 = f15_arg2 * f15_local3
	local f15_local5 = f15_arg3 * f15_local3
	local f15_local6 = CoD.textSize.Default / 2
	local self = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -f15_arg2 / 2,
		right = f15_arg2 / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -f15_local6 - f15_arg3 / 2,
		bottom = -f15_local6 + f15_arg3 / 2
	} )
	self:registerAnimationState( "big", {
		leftAnchor = false,
		rightAnchor = false,
		left = -f15_local4 / 2,
		right = f15_local4 / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -f15_local6 - f15_local5 / 2,
		bottom = -f15_local6 + f15_local5 / 2
	} )
	local centerImage = nil
	if f15_arg5 then
		centerImage = LUI.UIStreamedImage.new( nil, nil, true )
	else
		centerImage = LUI.UIImage.new()
	end
	centerImage:setLeftRight( true, true, 0, 0 )
	centerImage:setTopBottom( true, true, 0, 0 )
	self.centerImage = centerImage
	if f15_arg1 then
		centerImage:setImage( RegisterMaterial( f15_arg1 ) )
	end
	self:addElement( centerImage )
	self.centerImage = centerImage
	
	f15_arg0.centerImageContainer = self
	f15_arg0:addElement( self )
end

CoD.CardCarousel.AddNewCard = function ( f16_arg0 )
	local self = LUI.UIButton.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = f16_arg0.m_itemWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self.cardCarousel = f16_arg0
	f0_local5( self )
	local f16_local1 = CoD.CardCarousel.TopOffset
	self:registerAnimationState( "default", {
		zoom = 0
	} )
	self:registerAnimationState( "small", {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = f16_arg0.m_itemWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self:registerAnimationState( "big", {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = f16_arg0.m_highlightedItemWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = -f16_local1,
		bottom = -f16_local1 + f16_arg0.m_highlightedItemHeight
	} )
	self:registerEventHandler( "gain_focus", CoD.CardCarousel.Card_GainFocus )
	self:registerEventHandler( "lose_focus", CoD.CardCarousel.Card_LoseFocus )
	self:registerEventHandler( "enableGrowShrink", CoD_CardCarousel_Card_EnableGrowShrink )
	self:registerEventHandler( "disableGrowShrink", CoD_CardCarousel_Card_DisableGrowShrink )
	self.setupCenterImage = CoD.CardCarousel.Card_SetupCenterImage
	if CoD.useMouse then
		self:setHandleMouseMove( false )
		self:registerEventHandler( "leftmousedown", CoD.NullFunction )
		self:registerEventHandler( "leftmouseup", CoD.CardCarousel.CardLeftMouseUp )
	end
	self.border = CoD.BorderT6.new( 2, CoD.offGray.r, CoD.offGray.g, CoD.offGray.b, 1 )
	self:addElement( self.border )
	if f16_arg0.cardGainFocusSFX ~= nil then
		self:setGainFocusSFX( f16_arg0.cardGainFocusSFX )
	end
	if f16_arg0.cardActionSFX ~= nil then
		self:setActionSFX( f16_arg0.cardActionSFX )
	end
	f16_arg0.horizontalList:addElement( self )
	table.insert( f16_arg0.horizontalList.cards, self )
	self.cardIndex = #f16_arg0.horizontalList.cards
	if self.cardIndex == 2 then
		f16_arg0.miniCarouselContainer:close()
		f16_arg0:addElement( f16_arg0.miniCarouselContainer )
	end
	return self
end

CoD.CardCarousel.GetNumCards = function ( f17_arg0 )
	return #f17_arg0.horizontalList.cards
end

CoD.CardCarousel.SetCardGainFocusSFX = function ( f18_arg0, f18_arg1 )
	f18_arg0.cardGainFocusSFX = f18_arg1
end

CoD.CardCarousel.SetCardActionSFX = function ( f19_arg0, f19_arg1 )
	f19_arg0.cardActionSFX = f19_arg1
end

CoD.CardCarousel.ClearAllItems = function ( f20_arg0 )
	f20_arg0.horizontalList:removeAllChildren()
	f20_arg0.miniCarousel:removeAllChildren()
	for f20_local0 = 1, #f20_arg0.horizontalList.cards, 1 do
		f20_arg0.horizontalList.cards[f20_local0]:close()
		f20_arg0.horizontalList.cards[f20_local0] = nil
	end
	f20_arg0.horizontalList.cards = {}
end

CoD.CardCarousel.SetupHintTextContainer = function ( f21_arg0, f21_arg1 )
	local f21_local0 = CoD.CardCarousel.HintTextLeft
	if f21_arg0.m_hintTextParams and f21_arg0.m_hintTextParams.hintTextLeft then
		f21_local0 = f21_arg0.m_hintTextParams.hintTextLeft
	end
	local f21_local1 = CoD.CardCarousel.HintTextWidth
	if f21_arg0.m_hintTextParams and f21_arg0.m_hintTextParams.hintTextWidth then
		f21_local1 = f21_arg0.m_hintTextParams.hintTextWidth
	end
	local f21_local2 = f21_arg1
	if f21_arg0.m_hintTextParams and f21_arg0.m_hintTextParams.hintTextTop then
		f21_local2 = f21_arg1 + f21_arg0.m_hintTextParams.hintTextTop
	end
	local f21_local3 = CoD.CardCarousel.HintTextHeight
	if f21_arg0.m_hintTextParams and f21_arg0.m_hintTextParams.hintTextHeight then
		f21_local3 = f21_arg0.m_hintTextParams.hintTextHeight
	end
	f21_arg0.hintTextContainer = LUI.UIElement.new()
	f21_arg0.hintTextContainer:setLeftRight( true, false, f21_local0, f21_local0 + f21_local1 )
	f21_arg0.hintTextContainer:setTopBottom( true, false, f21_local2, f21_local2 + f21_local3 )
	f21_arg0.hintTextContainer.hintText = CoD.HintText.new()
	f21_arg0.hintTextContainer.hintText:setLeftRight( true, true, 0, 0 )
	f21_arg0.hintTextContainer.hintText:setTopBottom( true, false, 0, CoD.textSize.Default )
	f21_arg0.hintTextContainer.hintText:setAlignment( LUI.Alignment.Left )
	f21_arg0.hintTextContainer.hintText:setAlpha( 0.6 )
	f21_arg0.hintTextContainer:addElement( f21_arg0.hintTextContainer.hintText )
	f21_arg0:addElement( f21_arg0.hintTextContainer )
end

CoD.CardCarousel.SetupDefaultParams = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4, f22_arg5, f22_arg6 )
	f22_arg0.id = "CardCarousel"
	f22_arg0.m_spacing = CoD.CardCarousel.Spacing
	f22_arg0.m_itemWidth = CoD.CardCarousel.ItemWidth
	f22_arg0.m_itemHeight = CoD.CardCarousel.ItemHeight
	f22_arg0.m_highlightedItemWidth = CoD.CardCarousel.HighlighedItemWidth
	f22_arg0.m_highlightedItemHeight = CoD.CardCarousel.HighlighedItemHeight
	f22_arg0.m_hintTextParams = f22_arg5
	f22_arg0.m_scrollTime = 0
	f22_arg0.m_cardGrowShrinkTime = CoD.CardCarousel.CardGrowShrinkTime
	f22_arg0.m_fadeTime = CoD.CardCarousel.FadeTime
	f22_arg0.m_alignToCenter = f22_arg6
	if f22_arg1 ~= nil then
		f22_arg0.m_itemWidth = f22_arg1
	end
	if f22_arg2 ~= nil then
		f22_arg0.m_itemHeight = f22_arg2
	end
	if f22_arg3 ~= nil then
		f22_arg0.m_highlightedItemWidth = f22_arg3
	end
	if f22_arg4 ~= nil then
		f22_arg0.m_highlightedItemHeight = f22_arg4
	end
	f22_arg0.m_mouseDragDistance = CoD.CardCarousel.MouseDragDistance
end

CoD.CardCarousel.SetupMiniCarousel = function ( f23_arg0, f23_arg1 )
	local f23_local0 = true
	local f23_local1 = 0
	if f23_arg0.m_alignToCenter then
		f23_local0 = false
		f23_local1 = -f23_arg0.m_highlightedItemWidth / 2 - f23_arg0.m_spacing
	end
	f23_arg0.miniCarouselContainer = LUI.UIElement.new( {
		leftAnchor = f23_local0,
		rightAnchor = false,
		left = f23_local1,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = f23_arg1,
		bottom = f23_arg1 + CoD.CardCarousel.MiniCarouselItemHeight
	} )
	f23_arg0.miniCarousel = LUI.UIHorizontalList.new( {
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
	f23_arg0.miniCarouselContainer:addElement( f23_arg0.miniCarousel )
end

CoD.CardCarousel.SetupTitleAndHorizontalList = function ( f24_arg0, f24_arg1, f24_arg2 )
	f24_arg0.horizontalListContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = f24_arg0.m_highlightedItemHeight
	} )
	f24_arg0.horizontalList = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = f24_arg1,
		bottom = f24_arg1 + f24_arg0.m_itemHeight,
		spacing = f24_arg0.m_spacing
	} )
	f24_arg0.horizontalListContainer:addElement( f24_arg0.horizontalList )
	f24_arg0.horizontalList.cardCarousel = f24_arg0
	f24_arg0.horizontalList.cards = {}
	f24_arg0.horizontalList:registerEventHandler( "gain_focus", CoD.CardCarousel.HorizontalListGainFocus )
	f24_arg0.horizontalList:registerEventHandler( "lose_focus", CoD.CardCarousel.HorizontalListLoseFocus )
	f24_arg0.title = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = f24_arg2,
		bottom = f24_arg2 + CoD.CardCarousel.TitleSize,
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		font = CoD.fonts.Big
	} )
	f24_arg0:addElement( f24_arg0.title )
	f24_arg0:addElement( f24_arg0.horizontalListContainer )
end

CoD.CardCarousel.SetupDefaultFunctions = function ( f25_arg0 )
	f25_arg0.addNewCard = CoD.CardCarousel.AddNewCard
	f25_arg0.getNumCards = CoD.CardCarousel.GetNumCards
	f25_arg0.setCardGainFocusSFX = CoD.CardCarousel.SetCardGainFocusSFX
	f25_arg0.setCardActionSFX = CoD.CardCarousel.SetCardActionSFX
	f25_arg0.clearAllItems = CoD.CardCarousel.ClearAllItems
end

CoD.CardCarousel.RegisterEventHandlers = function ( f26_arg0, f26_arg1 )
	if not f26_arg1 then
		f26_arg0:registerEventHandler( "hint_text_fade_out", f0_local0 )
		f26_arg0:registerEventHandler( "hint_text_fade_in", f0_local1 )
	end
	f26_arg0:registerEventHandler( "card_gain_focus", CoD.CardCarousel.CardGainFocus )
	f26_arg0:registerEventHandler( "card_lose_focus", CoD.CardCarousel.CardLoseFocus )
	f26_arg0:registerEventHandler( "transition_complete_fade_out", f0_local2 )
	if CoD.useMouse then
		f26_arg0:setHandleMouse( true )
		f26_arg0:registerEventHandler( "leftmouseup", CoD.CardCarousel.LeftMouseUp )
		f26_arg0:registerEventHandler( "leftmousedown", CoD.CardCarousel.LeftMouseDown )
		f26_arg0:registerEventHandler( "mousedrag", CoD.CardCarousel.MouseDrag )
		f26_arg0:registerEventHandler( "card_mouse_click", CoD.CardCarousel.CardMouseClick )
	end
end

CoD.CardCarousel.new = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4, f27_arg5, f27_arg6, f27_arg7 )
	local self = LUI.UIElement.new( f27_arg0 )
	local f27_local1 = CoD.CardCarousel.SpaceBetweenTitleAndCarousel
	local f27_local2 = CoD.CardCarousel.TopOffset
	CoD.CardCarousel.SetupDefaultParams( self, f27_arg1, f27_arg2, f27_arg3, f27_arg4, f27_arg5, f27_arg6 )
	local f27_local3 = f27_local1 + self.m_highlightedItemHeight
	local f27_local4 = f27_local3 + CoD.CardCarousel.MiniCarouselItemHeight + f27_local1
	CoD.CardCarousel.SetupMiniCarousel( self, f27_local3 )
	CoD.CardCarousel.SetupTitleAndHorizontalList( self, f27_local2, f27_local4 )
	if not f27_arg7 then
		CoD.CardCarousel.SetupHintTextContainer( self, f27_local4 )
	end
	CoD.CardCarousel.SetupDefaultFunctions( self )
	CoD.CardCarousel.RegisterEventHandlers( self, f27_arg7 )
	self:registerAnimationState( "fade_in", {
		alphaMultiplier = 1
	} )
	return self
end

CoD.CardCarousel.CardGainFocus = function ( f28_arg0, f28_arg1 )
	f28_arg0:processEvent( {
		name = "hint_text_fade_in",
		hintText = f28_arg1.card.hintText
	} )
	f28_arg0:dispatchEventToParent( f28_arg1 )
end

CoD.CardCarousel.CardLoseFocus = function ( f29_arg0, f29_arg1 )
	f29_arg0:processEvent( {
		name = "hint_text_fade_out"
	} )
	f29_arg0:dispatchEventToParent( f29_arg1 )
end

CoD.CardCarousel.GetCardByIndex = function ( f30_arg0, f30_arg1 )
	if f30_arg0 then
		return f30_arg0.horizontalList.cards[f30_arg1]
	else
		return nil
	end
end

CoD.CardCarousel.GetSelectedCardIndex = function ( f31_arg0 )
	return f31_arg0.horizontalList.m_currentCardIndex
end

CoD.CardCarousel.LeftMouseUp = function ( f32_arg0, f32_arg1 )
	f32_arg0.m_curX = nil
	f32_arg0.m_curY = nil
	if f32_arg0.m_mouseDrag then
		f32_arg0.m_mouseDrag = nil
		return true
	else
		
	end
end

CoD.CardCarousel.LeftMouseDown = function ( f33_arg0, f33_arg1 )
	f33_arg0.m_curX = f33_arg1.x
	f33_arg0.m_curY = f33_arg1.y
end

CoD.CardCarousel.MouseDrag = function ( f34_arg0, f34_arg1 )
	if f34_arg0.m_curX == nil or not f34_arg0.m_isActive then
		return 
	elseif f34_arg0.m_mouseDragDistance < math.abs( f34_arg0.m_curX - f34_arg1.x ) then
		local f34_local0 = nil
		if f34_arg0.m_curX < f34_arg1.x then
			f34_local0 = -1
		else
			f34_local0 = 1
		end
		f34_arg0.m_curX = f34_arg1.x
		f34_arg0.m_mouseDrag = true
		local f34_local1 = f34_arg0.horizontalList.cards
		local f34_local2 = f34_arg0.horizontalList.m_currentCardIndex
		if not (f34_local2 ~= nil and (f34_local2 > 1 or f34_local0 ~= -1)) or f34_arg0:getNumCards() <= f34_local2 and f34_local0 == 1 then
			return 
		end
		local f34_local3 = f34_local1[f34_local2]
		local f34_local4 = f34_local1[f34_local2 + f34_local0]
		if f34_local3 ~= nil then
			f34_local3:processEvent( {
				name = "lose_focus",
				controller = f34_arg1.controller
			} )
		end
		if f34_local4 ~= nil then
			f34_local4:processEvent( {
				name = "gain_focus",
				controller = f34_arg1.controller
			} )
		end
	end
end

CoD.CardCarousel.CardLeftMouseUp = function ( f35_arg0, f35_arg1 )
	if f35_arg1.inside then
		f35_arg0:dispatchEventToParent( {
			name = "card_mouse_click",
			controller = f35_arg1.controller,
			cardIndex = f35_arg0.cardIndex
		} )
	end
end

CoD.CardCarousel.CardMouseClick = function ( f36_arg0, f36_arg1 )
	if not f36_arg0.m_isActive then
		return 
	end
	local f36_local0 = f36_arg0.horizontalList.cards
	local f36_local1 = f36_arg0.horizontalList.m_currentCardIndex
	local f36_local2 = f36_arg1.cardIndex
	local f36_local3 = f36_local0[f36_local1]
	local f36_local4 = f36_local0[f36_local2]
	if f36_local2 ~= f36_local1 then
		if f36_local3 ~= nil then
			f36_local3:processEvent( {
				name = "lose_focus",
				controller = f36_arg1.controller
			} )
		end
		if f36_local4 ~= nil then
			f36_local4:processEvent( {
				name = "gain_focus",
				controller = f36_arg1.controller
			} )
		end
	elseif f36_local3 ~= nil and f36_local3:isInFocus() then
		if f36_local3.m_eventHandlers.button_action then
			f36_local3:processEvent( {
				name = "button_action",
				controller = f36_arg1.controller
			} )
		elseif f36_local3.actionEventName then
			f36_local3:dispatchEventToParent( {
				name = f36_local3.actionEventName,
				controller = f36_arg1.controller,
				button = f36_local3
			} )
		end
	end
end

