require( "ui.T6.CardCarousel" )

CoD.CardCarouselList = {}
CoD.CardCarouselList.TitleListTextSize = CoD.textSize.Default
CoD.CardCarouselList.TitleListSpacing = 5
CoD.CardCarouselList.LeftMargin = 50
CoD.CardCarouselList.MouseDragDistance = 100
if CoD.isPC then
	CoD.CardCarouselList.ScrollTime = 50
else
	CoD.CardCarouselList.ScrollTime = 200
end
local CoD_CardCarouselList_TitleContainer_TransitionComplete_MoveUpFadeOut = function ( self, event )
	self:close()
end

local CoD_CardCarouselList_TitleContainer_TransitionComplete_MoveDownFadeOut = function ( self, event )
	self:close()
end

local CoD_CardCarouselList_TitleContainer_TransitionComplete_FadeIn = function ( self, event )
	self:setPriority( 0 )
end

local CoD_CardCarouselList_TitleContainer_MouseEnter = function ( self, event )
	self.title:setRGB( 1, 1, 1 )
end

local CoD_CardCarouselList_TitleContainer_MouseLeave = function ( self, event )
	self.title:setRGB( CoD.DefaultTextColor.r, CoD.DefaultTextColor.g, CoD.DefaultTextColor.b )
end

local CoD_CardCarouselList_TitleContainer_LeftMouseUp = function ( self, event )
	self:dispatchEventToParent( {
		name = "scroll_to_cardcarousel_title",
		controller = event.controller,
		titleText = self.titleText
	} )
end

local CoD_CardCarouselList_TitleContainer_ShowNew = function ( titleContainer, show )
	if show then
		if not titleContainer.newIcon then
			local newIcon = LUI.UIImage.new()
			newIcon:setLeftRight( true, false, titleContainer.width, titleContainer.width + CoD.CACUtility.ButtonGridNewImageWidth )
			newIcon:setTopBottom( false, true, -12 - CoD.CACUtility.ButtonGridNewImageHeight / 2, -12 + CoD.CACUtility.ButtonGridNewImageHeight / 2 )
			newIcon:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			titleContainer:addElement( newIcon )
			titleContainer.newIcon = newIcon
			
		end
	elseif titleContainer.newIcon then
		titleContainer.newIcon:close()
		titleContainer.newIcon = nil
	end
end

local CoD_CardCarouselList_GetPrevCardCarouselIndex = function ( cardCarouselList )
	local index = cardCarouselList.m_currentCardCarouselIndex - 1
	if index < 1 then
		index = #cardCarouselList.cardCarousels
	end
	return index
end

local CoD_CardCarouselList_GetNextCardCarouselIndex = function ( cardCarouselList )
	local index = cardCarouselList.m_currentCardCarouselIndex + 1
	if #cardCarouselList.cardCarousels < index then
		index = 1
	end
	return index
end

local CoD_CardCarouselList_TitleListContainer_AddContainerAtBottom = function ( self, event )
	local prevCardCarouselIndex = CoD_CardCarouselList_GetPrevCardCarouselIndex( self.cardCarouselList )
	local cardCarousel = self.cardCarouselList.cardCarousels[prevCardCarouselIndex]
	local titleContainer = CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( self, self.numTitles, cardCarousel, 0 )
	self:addElement( titleContainer )
	titleContainer:animateToState( "fade_in", CoD.CardCarouselList.ScrollTime )
	self.cardCarouselList.scrolling = false
	self:dispatchEventToParent( {
		name = "auto_scroll"
	} )
end

local CoD_CardCarouselList_TitleListContainer_AddContainerOnTop = function ( self, event )
	local nextCardCarouselIndex = CoD_CardCarouselList_GetNextCardCarouselIndex( self.cardCarouselList )
	local cardCarousel = self.cardCarouselList.cardCarousels[nextCardCarouselIndex]
	local titleContainer = CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( self, 1, cardCarousel, 0 )
	titleContainer:setPriority( -100 )
	self:addElement( titleContainer )
	titleContainer:animateToState( "fade_in", CoD.CardCarouselList.ScrollTime )
	self.cardCarouselList.scrolling = false
end

CoD.CardCarouselList.SetInitialCarousel = function ( cardCarouselList, carouselIndex, cardIndex )
	if carouselIndex ~= nil and carouselIndex ~= cardCarouselList.m_currentCardCarouselIndex then
		local numCarousels = #cardCarouselList.cardCarousels
		if numCarousels < carouselIndex then
			return 
		end
		cardCarouselList.m_currentCardCarouselIndex = carouselIndex
		local titleListContainer = cardCarouselList.titleListContainer
		titleListContainer:removeAllChildren()
		local titleIndex = 1
		for i = carouselIndex + 1, numCarousels, 1 do
			local titleContainer = CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( titleListContainer, titleIndex, cardCarouselList.cardCarousels[i], 1 )
			cardCarouselList.titleListContainer:addElement( titleContainer )
			titleIndex = titleIndex + 1
		end
		for i = 1, carouselIndex - 1, 1 do
			local titleContainer = CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( titleListContainer, titleIndex, cardCarouselList.cardCarousels[i], 1 )
			cardCarouselList.titleListContainer:addElement( titleContainer )
			titleIndex = titleIndex + 1
		end
	end
	if cardIndex ~= nil then
		if table.getn( cardCarouselList.cardCarousels ) < cardCarouselList.m_currentCardCarouselIndex then
			cardCarouselList.m_currentCardCarouselIndex = 1
		end
		cardCarouselList.cardCarousels[cardCarouselList.m_currentCardCarouselIndex].horizontalList.m_currentCardIndex = cardIndex
	end
end

CoD.CardCarouselList.SetLRSFX = function ( self, sfxName )
	self.lrSFX = sfxName
end

CoD.CardCarouselList.SetUpSFX = function ( self, sfxName )
	self.upSFX = sfxName
end

CoD.CardCarouselList.SetDownSFX = function ( self, sfxName )
	self.downSFX = sfxName
end

CoD.CardCarouselList.SetEquipSFX = function ( self, sfxName )
	self.equipSFX = sfxName
end

local CoD_CardCarouselList_TitleList_ScrollDown = function ( cardCarouselList )
	local titleListContainer = cardCarouselList.titleListContainer
	local titleContainer = titleListContainer:getLastChild()
	if titleContainer then
		if cardCarouselList.downSFX ~= nil then
			Engine.PlaySound( cardCarouselList.downSFX )
		end
		local index = titleListContainer.numTitles
		local top = (titleListContainer.elementSize + titleListContainer.spacing) * (index + 1)
		titleContainer:registerAnimationState( "move_down_fade_out", {
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			right = titleContainer.width,
			topAnchor = true,
			bottomAnchor = false,
			top = top,
			bottom = top + titleListContainer.elementSize,
			alphaMultiplier = 0
		} )
		titleContainer:animateToState( "move_down_fade_out", CoD.CardCarouselList.ScrollTime )
		local child = titleListContainer:getFirstChild()
		index = 1
		while child ~= nil and index < titleListContainer:getNumChildren() do
			top = (titleListContainer.elementSize + titleListContainer.spacing) * (index + 1)
			child:registerAnimationState( "move_down", {
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				right = child.width,
				topAnchor = true,
				bottomAnchor = false,
				top = top,
				bottom = top + titleListContainer.elementSize
			} )
			child:animateToState( "move_down", CoD.CardCarouselList.ScrollTime )
			child = child:getNextSibling()
			index = index + 1
		end
		titleListContainer:addElement( LUI.UITimer.new( CoD.CardCarouselList.ScrollTime, "add_container_on_top", true ) )
	end
end

local CoD_CardCarouselList_TitleList_ScrollUp = function ( cardCarouselList )
	local titleListContainer = cardCarouselList.titleListContainer
	local titleContainer = titleListContainer:getFirstChild()
	if titleContainer then
		if cardCarouselList.upSFX ~= nil then
			Engine.PlaySound( cardCarouselList.upSFX )
		end
		titleContainer:registerAnimationState( "move_up_fade_out", {
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			right = titleContainer.width,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = titleListContainer.elementSize,
			alphaMultiplier = 0
		} )
		titleContainer:animateToState( "move_up_fade_out", CoD.CardCarouselList.ScrollTime )
		local child = titleContainer:getNextSibling()
		local top = nil
		local index = 1
		while child ~= nil and child.id == "CardCarouselList.TitleContainer" do
			top = (titleListContainer.elementSize + titleListContainer.spacing) * index
			child:registerAnimationState( "move_up", {
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				right = child.width,
				topAnchor = true,
				bottomAnchor = false,
				top = top,
				bottom = top + titleListContainer.elementSize
			} )
			child:animateToState( "move_up", CoD.CardCarouselList.ScrollTime )
			child = child:getNextSibling()
			index = index + 1
		end
		titleListContainer:addElement( LUI.UITimer.new( CoD.CardCarouselList.ScrollTime, "add_container_at_bottom", true ) )
	end
end

function CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( titleListContainer, index, cardCarousel, alpha )
	if not cardCarousel then
		return 
	end
	local titleText = cardCarousel.titleText
	if titleText == nil then
		return 
	end
	local f19_local0 = {}
	local textDim = GetTextDimensions( titleText, CoD.fonts.Default, titleListContainer.elementSize )
	local titleContainerWidth = textDim[3] - textDim[1] + 25
	local top = (titleListContainer.elementSize + titleListContainer.spacing) * index
	local titleContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = titleContainerWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = top,
		bottom = top + titleListContainer.elementSize,
		alpha = alpha
	} )
	titleContainer.id = "CardCarouselList.TitleContainer"
	titleContainer.title = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alignment = LUI.Alignment.Left
	} )
	titleContainer.titleText = titleText
	titleContainer.width = titleContainerWidth
	titleContainer:addElement( titleContainer.title )
	titleContainer.title:setText( titleText )
	local moveDistance = titleListContainer.elementSize + titleListContainer.spacing
	top = top - moveDistance
	titleContainer:registerAnimationState( "fade_in", {
		alphaMultiplier = 1
	} )
	if cardCarousel.shouldShowNewFunction then
		CoD_CardCarouselList_TitleContainer_ShowNew( titleContainer, cardCarousel:shouldShowNewFunction() )
	end
	titleContainer:registerEventHandler( "transition_complete_move_up_fade_out", CoD_CardCarouselList_TitleContainer_TransitionComplete_MoveUpFadeOut )
	titleContainer:registerEventHandler( "transition_complete_fade_in", CoD_CardCarouselList_TitleContainer_TransitionComplete_FadeIn )
	titleContainer:registerEventHandler( "transition_complete_move_down_fade_out", CoD_CardCarouselList_TitleContainer_TransitionComplete_MoveDownFadeOut )
	titleListContainer:registerEventHandler( "add_container_at_bottom", CoD_CardCarouselList_TitleListContainer_AddContainerAtBottom )
	titleListContainer:registerEventHandler( "add_container_on_top", CoD_CardCarouselList_TitleListContainer_AddContainerOnTop )
	if CoD.useMouse then
		titleContainer:setHandleMouse( true )
		titleContainer:registerEventHandler( "mouseenter", CoD_CardCarouselList_TitleContainer_MouseEnter )
		titleContainer:registerEventHandler( "mouseleave", CoD_CardCarouselList_TitleContainer_MouseLeave )
		titleContainer:registerEventHandler( "leftmousedown", CoD.NullFunction )
		titleContainer:registerEventHandler( "leftmouseup", CoD_CardCarouselList_TitleContainer_LeftMouseUp )
	end
	titleContainer.titleListContainer = titleListContainer
	return titleContainer
end

CoD.CardCarouselList.SetupCardCarouselTitleList = function ( cardCarouselList )
	local titleListContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = -CoD.CoD9Button.Height,
		topAnchor = true,
		bottomAnchor = false,
		top = cardCarouselList.cardCarouselSize - 15,
		bottom = 0
	} )
	titleListContainer.numTitles = 0
	titleListContainer.cardCarouselList = cardCarouselList
	titleListContainer.elementSize = CoD.CardCarouselList.TitleListTextSize
	titleListContainer.spacing = CoD.CardCarouselList.TitleListSpacing
	cardCarouselList.titleListContainer = titleListContainer
	cardCarouselList:addElement( titleListContainer )
end

CoD.CardCarouselList.UpdateCurrentCarousel = function ( cardCarouselList )
	if cardCarouselList.m_currentCardCarouselIndex ~= nil and cardCarouselList.m_nextCardCarouselIndex ~= nil then
		local previousCarousel = cardCarouselList.cardCarousels[cardCarouselList.m_currentCardCarouselIndex]
		cardCarouselList:removeElement( cardCarouselList.cardCarousels[cardCarouselList.m_currentCardCarouselIndex] )
		cardCarouselList.m_currentCardCarouselIndex = cardCarouselList.m_nextCardCarouselIndex
		local nextCarousel = cardCarouselList.cardCarousels[cardCarouselList.m_currentCardCarouselIndex]
		cardCarouselList:addElement( cardCarouselList.cardCarousels[cardCarouselList.m_currentCardCarouselIndex] )
		cardCarouselList:dispatchEventToParent( {
			name = "card_carousel_list_changed",
			previous = previousCarousel,
			next = nextCarousel
		} )
		cardCarouselList.cardCarousels[cardCarouselList.m_currentCardCarouselIndex].horizontalList:processEvent( {
			name = "gain_focus",
			controller = cardCarouselList.m_ownerController
		} )
		cardCarouselList.cardCarousels[cardCarouselList.m_currentCardCarouselIndex].m_leftMouseDown = nil
	end
end

CoD.CardCarouselList.ScrollList = function ( cardCarouselList, button, controller )
	local scrollDirection = nil
	if button == "up" then
		scrollDirection = -1
	elseif button == "down" then
		scrollDirection = 1
	end
	local nextCarouselIndex = cardCarouselList.m_currentCardCarouselIndex + scrollDirection
	if #cardCarouselList.cardCarousels < nextCarouselIndex then
		nextCarouselIndex = 1
	end
	if nextCarouselIndex < 1 then
		nextCarouselIndex = #cardCarouselList.cardCarousels
	end
	if nextCarouselIndex ~= cardCarouselList.m_currentCardCarouselIndex then
		cardCarouselList.m_lastScrollDirection = scrollDirection
		cardCarouselList.m_nextCardCarouselIndex = nextCarouselIndex
		local cardCarousel = cardCarouselList.cardCarousels[cardCarouselList.m_currentCardCarouselIndex]
		cardCarousel.horizontalList:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
		local titleContainer = cardCarouselList.titleListContainer:getFirstChild()
		if scrollDirection == 1 then
			CoD_CardCarouselList_TitleList_ScrollUp( cardCarouselList )
		else
			CoD_CardCarouselList_TitleList_ScrollDown( cardCarouselList )
		end
	end
end

CoD.CardCarouselList.Gamepad_Button = function ( self, event )
	if self.m_inputDisabled then
		return 
	elseif event.button ~= "up" and event.button ~= "down" and event.button ~= "left" and event.button ~= "right" then
		self:dispatchEventToChildren( event )
		return nil
	elseif event.down == true and (event.button == "left" or event.button == "right") then
		local performEdgeBounce = CoD_CardCarousel_PerformEdgeBounce( self.cardCarousels[self.m_currentCardCarouselIndex], event.button, event.buttonRepeat )
		if performEdgeBounce == true then
			return true
		else
			self:dispatchEventToChildren( event )
			return nil
		end
	elseif event.down == true and (event.button == "up" or event.button == "down") and (self.scrolling == nil or self.scrolling == false) then
		self.scrolling = true
		CoD.CardCarouselList.ScrollList( self, event.button, event.controller )
		return true
	else
		self:dispatchEventToChildren( event )
	end
end

CoD.CardCarouselList.FocusCurrentCardCarousel = function ( self, controller )
	if self.cardCarousels[self.m_currentCardCarouselIndex] then
		self.cardCarousels[self.m_currentCardCarouselIndex].horizontalList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

CoD.CardCarouselList.new = function ( defaultAnimationState, controller, itemWidth, itemHeight, highlightedItemWidth, highlightedItemHeight, hintTextParams )
	local cardCarouselList = LUI.UIElement.new( defaultAnimationState )
	cardCarouselList.cardCarousels = {}
	cardCarouselList.id = "CardCarouselList"
	cardCarouselList.m_ownerController = controller
	cardCarouselList.m_currentCardCarouselIndex = 1
	cardCarouselList.m_lastScrollDirection = 0
	cardCarouselList.m_itemWidth = itemWidth
	cardCarouselList.m_itemHeight = itemHeight
	cardCarouselList.m_highlightedItemWidth = highlightedItemWidth
	cardCarouselList.m_highlightedItemHeight = highlightedItemHeight
	cardCarouselList.m_hintTextParams = hintTextParams
	cardCarouselList.m_mouseDragDistance = CoD.CardCarouselList.MouseDragDistance
	cardCarouselList.cardCarouselSize = CoD.CardCarousel.TitleSize + CoD.CardCarousel.SpaceBetweenTitleAndCarousel + CoD.CardCarousel.SpaceBetweenCarouselAndTitleList
	cardCarouselList.addCardCarousel = CoD.CardCarouselList.AddCardCarousel
	cardCarouselList.focusCurrentCardCarousel = CoD.CardCarouselList.FocusCurrentCardCarousel
	cardCarouselList.setInitialCarousel = CoD.CardCarouselList.SetInitialCarousel
	cardCarouselList.setLRSFX = CoD.CardCarouselList.SetLRSFX
	cardCarouselList.setUpSFX = CoD.CardCarouselList.SetUpSFX
	cardCarouselList.setDownSFX = CoD.CardCarouselList.SetDownSFX
	cardCarouselList.setEquipSFX = CoD.CardCarouselList.SetEquipSFX
	cardCarouselList:setLRSFX( CoD.CACUtility.carouselLRSFX )
	cardCarouselList:setUpSFX( CoD.CACUtility.carouselUpSFX )
	cardCarouselList:setDownSFX( CoD.CACUtility.carouselDownSFX )
	cardCarouselList:setEquipSFX( CoD.CACUtility.carouselEquipSFX )
	if cardCarouselList.m_highlightedItemHeight ~= nil then
		cardCarouselList.cardCarouselSize = cardCarouselList.cardCarouselSize + cardCarouselList.m_highlightedItemHeight
	else
		cardCarouselList.cardCarouselSize = cardCarouselList.cardCarouselSize + CoD.CardCarousel.HighlighedItemHeight
	end
	CoD.CardCarouselList.SetupCardCarouselTitleList( cardCarouselList )
	cardCarouselList.leftButtonRepeater = LUI.UIButtonRepeater.new( "left", {
		name = "gamepad_button",
		button = "left",
		down = true
	} )
	cardCarouselList.rightButtonRepeater = LUI.UIButtonRepeater.new( "right", {
		name = "gamepad_button",
		button = "right",
		down = true
	} )
	cardCarouselList.leftButtonRepeater.accelInterval = 300
	cardCarouselList.rightButtonRepeater.accelInterval = 300
	cardCarouselList:addElement( cardCarouselList.leftButtonRepeater )
	cardCarouselList:addElement( cardCarouselList.rightButtonRepeater )
	cardCarouselList:registerEventHandler( "gamepad_button", CoD.CardCarouselList.Gamepad_Button )
	if CoD.useMouse then
		cardCarouselList:setHandleMouse( true )
		cardCarouselList:registerEventHandler( "leftmouseup", CoD.CardCarouselList.LeftMouseUp )
		cardCarouselList:registerEventHandler( "leftmousedown", CoD.CardCarouselList.LeftMouseDown )
		cardCarouselList:registerEventHandler( "mousedrag", CoD.CardCarouselList.MouseDrag )
		cardCarouselList:registerEventHandler( "scroll_to_cardcarousel_title", CoD.CardCarouselList.ScrollToCardCarouselTitle )
		cardCarouselList:registerEventHandler( "auto_scroll", CoD.CardCarouselList.AutoScroll )
	end
	return cardCarouselList
end

CoD.CardCarouselList.AddCardCarousel = function ( cardCarouselList, title, disablePip, shouldShowNewFunction )
	local cardCarouselDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = cardCarouselList.cardCarouselSize,
		alpha = 0
	}
	local cardCarousel = CoD.CardCarousel.new( cardCarouselDefaultAnimState, cardCarouselList.m_itemWidth, cardCarouselList.m_itemHeight, cardCarouselList.m_highlightedItemWidth, cardCarouselList.m_highlightedItemHeight, cardCarouselList.m_hintTextParams )
	cardCarousel.id = cardCarousel.id .. "." .. title
	cardCarousel.cardCarouselList = cardCarouselList
	cardCarousel.disablePip = disablePip
	cardCarousel.title:setText( title )
	cardCarousel.titleText = title
	cardCarousel.shouldShowNewFunction = shouldShowNewFunction
	table.insert( cardCarouselList.cardCarousels, cardCarousel )
	cardCarouselList:addElement( cardCarousel )
	if cardCarouselList.lrSFX ~= nil then
		cardCarousel:setCardGainFocusSFX( cardCarouselList.lrSFX )
	end
	if cardCarouselList.equipSFX ~= nil then
		cardCarousel:setCardActionSFX( cardCarouselList.equipSFX )
	end
	if #cardCarouselList.cardCarousels > 1 then
		cardCarouselList.titleListContainer.numTitles = cardCarouselList.titleListContainer.numTitles + 1
		local titleContainer = CoD_CardCarouselList_TitleListContainer_GetNewTitleContainer( cardCarouselList.titleListContainer, #cardCarouselList.cardCarousels - 1, cardCarousel, 1 )
		cardCarouselList.titleListContainer:addElement( titleContainer )
	end
	return cardCarousel
end

CoD.CardCarouselList.GetSelectedCarousel = function ( cardCarouselList )
	return cardCarouselList.m_currentCardCarouselIndex
end

CoD.CardCarouselList.AutoScroll = function ( self, event )
	if self.m_autoScroll then
		if self.m_autoScroll ~= self.m_currentCardCarouselIndex and not self.scrolling then
			CoD.CardCarouselList.ScrollList( self, "down" )
		else
			self.m_autoScroll = nil
			self.m_inputDisabled = nil
		end
	end
end

CoD.CardCarouselList.ScrollToCardCarouselTitle = function ( self, event )
	if self.m_autoScroll then
		return 
	end
	self.m_autoScroll = 1
	self.m_inputDisabled = true
	for index = 1, #self.cardCarousels, 1 do
		if event.titleText == self.cardCarousels[index].titleText then
			self.m_autoScroll = index
		end
	end
	CoD.CardCarouselList.AutoScroll( self )
end

CoD.CardCarouselList.LeftMouseUp = function ( self, event )
	if self.m_mouseDrag then
		event.mouseDrag = true
	end
	self.m_mouseDrag = nil
	self.m_curX = nil
	self.m_curY = nil
end

CoD.CardCarouselList.LeftMouseDown = function ( self, event )
	self.m_curX = event.x
	self.m_curY = event.y
end

CoD.CardCarouselList.MouseDrag = function ( self, event )
	if self.m_curY == nil then
		return 
	elseif self.m_mouseDragDistance < math.abs( self.m_curY - event.y ) then
		local scrollDirection = nil
		if self.m_curY < event.y then
			scrollDirection = "up"
		else
			scrollDirection = "down"
		end
		self.m_curY = event.y
		self.m_mouseDrag = true
		if self.scrolling == nil or self.scrolling == false then
			self.scrolling = true
			CoD.CardCarouselList.ScrollList( self, scrollDirection )
		end
	end
end

