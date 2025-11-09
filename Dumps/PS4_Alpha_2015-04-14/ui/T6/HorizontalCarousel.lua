require( "ui.T6.CarouselCommon" )

CoD.HorizontalCarousel = {}
CoD.HorizontalCarousel.ExpansionScale = 1.5
CoD.HorizontalCarousel.ItemWidth = 100
CoD.HorizontalCarousel.ItemHeight = 100
CoD.HorizontalCarousel.Spacing = 10
CoD.HorizontalCarousel.ScrollTime = 100
CoD.HorizontalCarousel.EdgeBounceOffset = 10
CoD.HorizontalCarousel.MiniCarouselSize = 10
if CoD.isSinglePlayer then
	CoD.HorizontalCarousel.ScrollSFX = "uin_main_nav"
else
	CoD.HorizontalCarousel.ScrollSFX = "uin_slide_nav_lr"
end
CoD.HorizontalCarousel.new = function ( defaultAnimationState, itemWidth, itemHeight, spacing, expansionScale, scrollTime, showMiniCarousel )
	local carousel = LUI.UIElement.new( defaultAnimationState )
	carousel.id = "HorizontalCarousel"
	carousel:setUseStencil( true )
	if CoD.HorizontalCarousel.PipMaterial == nil then
		CoD.HorizontalCarousel.PipMaterial = RegisterMaterial( "menu_vis_carousel_pip" )
	end
	if CoD.HorizontalCarousel.PipFillMaterial == nil then
		CoD.HorizontalCarousel.PipFillMaterial = RegisterMaterial( "menu_vis_carousel_pip_fill" )
	end
	carousel.m_itemWidth = CoD.HorizontalCarousel.ItemWidth
	if itemWidth ~= nil then
		carousel.m_itemWidth = itemWidth
	end
	carousel.m_itemHeight = CoD.HorizontalCarousel.ItemHeight
	if itemHeight ~= nil then
		carousel.m_itemHeight = itemHeight
	end
	carousel.m_spacing = CoD.HorizontalCarousel.Spacing
	if spacing ~= nil then
		carousel.m_spacing = spacing
	end
	carousel.m_expansionScale = CoD.HorizontalCarousel.ExpansionScale
	if expansionScale ~= nil then
		carousel.m_expansionScale = expansionScale
	end
	carousel.m_scrollTime = CoD.HorizontalCarousel.ScrollTime
	if scrollTime ~= nil then
		carousel.m_scrollTime = scrollTime
	end
	carousel.m_mouseDragDistance = CoD.CarouselCommon.MouseDragDistance
	carousel.list = LUI.UIHorizontalList.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		spacing = carousel.m_spacing
	} )
	carousel.list.containers = {}
	carousel:addElement( carousel.list )
	carousel.miniList = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.HorizontalCarousel.MiniCarouselSize,
		bottom = 0,
		spacing = 2,
		alignment = LUI.Alignment.Center
	} )
	carousel.miniList.miniContainers = {}
	if showMiniCarousel == true then
		carousel:addElement( carousel.miniList )
	end
	CoD.CarouselCommon.SetupCarousel( carousel )
	carousel.handleGamepadButton = CoD.HorizontalCarousel.HandleGamepadButton
	carousel.addItem = CoD.HorizontalCarousel.AddItem
	carousel.scrollToItem = CoD.HorizontalCarousel.ScrollToItem
	if CoD.useMouse then
		carousel:setHandleMouse( true )
		carousel:registerEventHandler( "leftmouseup", CoD.CarouselCommon.LeftMouseUp )
		carousel:registerEventHandler( "leftmousedown", CoD.CarouselCommon.LeftMouseDown )
		carousel:registerEventHandler( "mousedrag", CoD.HorizontalCarousel.MouseDrag )
	end
	carousel.leftButtonRepeater = LUI.UIButtonRepeater.new( "left", {
		name = "gamepad_button",
		button = "left",
		down = true
	} )
	carousel:addElement( carousel.leftButtonRepeater )
	carousel.rightButtonRepeater = LUI.UIButtonRepeater.new( "right", {
		name = "gamepad_button",
		button = "right",
		down = true
	} )
	carousel:addElement( carousel.rightButtonRepeater )
	return carousel
end

CoD.HorizontalCarousel.MouseDrag = function ( carousel, event )
	if carousel.m_curX == nil then
		return 
	end
	local scrollDirection = nil
	local numChildren = carousel.list:getNumChildren()
	if numChildren > 1 and carousel.m_mouseDragDistance < math.abs( carousel.m_curX - event.x ) then
		if carousel.m_curX < event.x then
			scrollDirection = -1
		else
			scrollDirection = 1
		end
		if carousel.m_currentItem ~= nil then
			carousel:scrollToItem( carousel.m_currentItem + scrollDirection, carousel.m_scrollTime )
		end
		carousel.m_curX = event.x
		carousel.m_mouseDrag = true
	end
end

CoD.HorizontalCarousel.HandleGamepadButton = function ( carousel, event )
	if LUI.UIElement.handleGamepadButton( carousel, event ) == true then
		return true
	end
	local numChildren = carousel.list:getNumChildren()
	if numChildren > 1 then
		local scrollDirection = nil
		if event.down == true then
			if event.button == "right" then
				scrollDirection = 1
			elseif event.button == "left" then
				scrollDirection = -1
			end
		end
		if scrollDirection ~= nil and carousel.m_currentItem ~= nil then
			carousel:scrollToItem( carousel.m_currentItem + scrollDirection, carousel.m_scrollTime )
		end
	end
end

CoD.HorizontalCarousel.ScrollToItem = function ( carousel, itemIndex, duration )
	local numChildren = carousel.list:getNumChildren()
	if numChildren == 0 or carousel.list.m_scrolling == true then
		return 
	end
	local f4_local0 = duration ~= 0
	if duration == nil then
		duration = carousel.m_scrollTime
		f4_local0 = false
	end
	local currentContainer = nil
	if itemIndex < 1 then
		carousel.list:beginAnimation( "edge_bounce", duration / 4, false, false )
		carousel.list:setLeftRight( false, false, -(carousel.m_itemWidth * carousel.m_expansionScale) / 2 + CoD.HorizontalCarousel.EdgeBounceOffset, 0 )
		carousel.leftButtonRepeater:cancelRepetition()
	elseif numChildren < itemIndex then
		local offsetFromFirstItem = (carousel.m_itemWidth + carousel.m_spacing) * (numChildren - 1) + carousel.m_itemWidth * carousel.m_expansionScale / 2
		carousel.list:beginAnimation( "edge_bounce", duration / 4, false, false )
		carousel.list:setLeftRight( false, false, -offsetFromFirstItem - CoD.HorizontalCarousel.EdgeBounceOffset, 0 )
		carousel.rightButtonRepeater:cancelRepetition()
	else
		currentContainer = carousel.list.containers[carousel.m_currentItem]
		if itemIndex ~= carousel.m_currentItem and currentContainer ~= nil then
			CoD.HorizontalCarousel.ElemContainer_DefaultAnim( currentContainer, carousel, duration )
			currentContainer:processEvent( {
				name = "lose_focus"
			} )
			currentContainer.miniContainer.background:beginAnimation( "default", duration )
			currentContainer.miniContainer.background:setImage( CoD.HorizontalCarousel.PipMaterial )
		end
		carousel.m_currentItem = itemIndex
		currentContainer = carousel.list.containers[carousel.m_currentItem]
		currentContainer:processEvent( {
			name = "gain_focus"
		} )
		CoD.HorizontalCarousel.ElemContainer_ExpandAnim( currentContainer, carousel, duration )
		currentContainer.miniContainer.background:beginAnimation( "selected", duration )
		currentContainer.miniContainer.background:setImage( CoD.HorizontalCarousel.PipFillMaterial )
		local offsetFromFirstItem = (carousel.m_itemWidth + carousel.m_spacing) * (carousel.m_currentItem - 1)
		carousel.list:beginAnimation( "carousel_scroll", duration, false, false )
		carousel:processEvent( {
			name = "carousel_scroll"
		} )
		carousel.list:setLeftRight( false, false, -(carousel.m_itemWidth * carousel.m_expansionScale) / 2 - offsetFromFirstItem, 0 )
		if f4_local0 == true then
			Engine.PlaySound( CoD.HorizontalCarousel.ScrollSFX )
		end
		carousel.list.m_scrolling = true
	end
	return currentContainer
end

CoD.HorizontalCarousel.AddItem = function ( carousel, element )
	local elemContainer = LUI.UIElement.new()
	elemContainer.id = "HorizontalCarouselContainer"
	CoD.HorizontalCarousel.ElemContainer_DefaultAnim( elemContainer, carousel, 0 )
	carousel.list:addElement( elemContainer )
	table.insert( carousel.list.containers, elemContainer )
	elemContainer.index = #carousel.list.containers
	local miniElemContainer = LUI.UIElement.new()
	miniElemContainer:setLeftRight( true, false, 0, CoD.HorizontalCarousel.MiniCarouselSize )
	miniElemContainer:setTopBottom( true, true, 0, 0 )
	miniElemContainer.background = LUI.UIImage.new()
	miniElemContainer.background:setLeftRight( true, true, 0, 0 )
	miniElemContainer.background:setTopBottom( true, true, 0, 0 )
	miniElemContainer.background:setImage( CoD.HorizontalCarousel.PipMaterial )
	miniElemContainer:addElement( miniElemContainer.background )
	carousel.miniList:addElement( miniElemContainer )
	table.insert( carousel.miniList.miniContainers, miniElemContainer )
	miniElemContainer.index = #carousel.miniList.miniContainers
	elemContainer.miniContainer = miniElemContainer
	element:setHandleMouse( false )
	elemContainer.content = element
	elemContainer:addElement( element )
	if CoD.useMouse then
		elemContainer:setHandleMouse( true )
		elemContainer:registerEventHandler( "leftmousedown", CoD.NullFunction )
		elemContainer:registerEventHandler( "leftmouseup", CoD.CarouselCommon.Container_LeftMouseUp )
		elemContainer:registerEventHandler( "mouseenter", CoD.CarouselCommon.Container_MouseEnter )
		elemContainer:registerEventHandler( "mouseleave", CoD.CarouselCommon.Container_MouseLeave )
		miniElemContainer:setHandleMouse( true )
		miniElemContainer:registerEventHandler( "leftmousedown", CoD.NullFunction )
		miniElemContainer:registerEventHandler( "leftmouseup", CoD.CarouselCommon.MiniContainer_LeftMouseUp )
		miniElemContainer:registerEventHandler( "mouseenter", CoD.CarouselCommon.MiniContainer_MouseEnter )
		miniElemContainer:registerEventHandler( "mouseleave", CoD.CarouselCommon.MiniContainer_MouseLeave )
	end
	if carousel.m_currentItem == nil then
		carousel.m_currentItem = 1
	end
	return elemContainer
end

CoD.HorizontalCarousel.ElemContainer_DefaultAnim = function ( self, carousel, duration )
	self:beginAnimation( "default", duration )
	self:setLeftRight( true, false, 0, carousel.m_itemWidth )
	self:setTopBottom( false, false, -carousel.m_itemHeight / 2, carousel.m_itemHeight / 2 )
end

CoD.HorizontalCarousel.ElemContainer_ExpandAnim = function ( self, carousel, duration )
	self:beginAnimation( "expand", duration )
	self:setLeftRight( true, false, 0, carousel.m_itemWidth * carousel.m_expansionScale )
	self:setTopBottom( false, false, -(carousel.m_itemHeight / 2 * carousel.m_expansionScale), carousel.m_itemHeight / 2 * carousel.m_expansionScale )
end

