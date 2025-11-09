CoD.CarouselCommon = {}
CoD.CarouselCommon.MouseDragDistance = 25
CoD.CarouselCommon.SetupCarousel = function ( carousel )
	carousel.clearAllItems = CoD.CarouselCommon.ClearAllItems
	carousel.getNumItems = CoD.CarouselCommon.GetNumItems
	carousel.getCurrentItemIndex = CoD.CarouselCommon.GetCurrentItemIndex
	carousel.getCurrentItem = CoD.CarouselCommon.GetCurrentItem
	carousel.setStartItem = CoD.CarouselCommon.SetStartItem
	carousel.setPipPosition = CoD.CarouselCommon.SetPipPosition
	carousel.getMouseRange = CoD.CarouselCommon.GetMouseRange
	carousel.setMouseRange = CoD.CarouselCommon.SetMouseRange
	carousel.setMouseDragDistance = CoD.CarouselCommon.SetMouseDragDistance
	carousel:registerEventHandler( "mouseenter", CoD.CarouselCommon.MouseEnter )
	carousel:registerEventHandler( "mouseleave", CoD.CarouselCommon.MouseLeave )
	carousel:registerEventHandler( "container_mouse_click", CoD.CarouselCommon.ContainerMouseClick )
	carousel:registerEventHandler( "container_mouse_enter", CoD.CarouselCommon.ContainerMouseEnter )
	carousel:registerEventHandler( "container_mouse_leave", CoD.CarouselCommon.ContainerMouseLeave )
	carousel:registerEventHandler( "minicontainer_mouse_click", CoD.CarouselCommon.MiniContainerMouseClick )
	carousel:registerEventHandler( "minicontainer_mouse_enter", CoD.CarouselCommon.MiniContainerMouseEnter )
	carousel:registerEventHandler( "minicontainer_mouse_leave", CoD.CarouselCommon.MiniContainerMouseLeave )
	carousel.list:registerEventHandler( "transition_complete_edge_bounce", CoD.CarouselCommon.List_EdgeBounce )
	carousel.list:registerEventHandler( "transition_complete_carousel_scroll", CoD.CarouselCommon.List_CarouselScrollComplete )
end

CoD.CarouselCommon.List_EdgeBounce = function ( list, event )
	local carousel = list:getParent()
	carousel:scrollToItem( carousel.m_currentItem, carousel.m_scrollTime )
end

CoD.CarouselCommon.List_CarouselScrollComplete = function ( list, event )
	list.m_scrolling = nil
	local carousel = list:getParent()
	local currentContainer = list.containers[carousel.m_currentItem]
	if currentContainer ~= nil then
		currentContainer:dispatchEventToChildren( {
			name = "carousel_scroll_complete"
		} )
	end
end

CoD.CarouselCommon.SetStartItem = function ( carousel, itemIndex )
	local numChildren = carousel.list:getNumChildren()
	if numChildren == 0 then
		return 
	elseif numChildren < itemIndex then
		itemIndex = carousel:getNumItems()
	end
	carousel.list.containers[itemIndex]:dispatchEventToChildren( {
		name = "animate",
		animationStateName = "carousel_set_start"
	} )
	carousel:scrollToItem( itemIndex, 0 )
end

CoD.CarouselCommon.GetNumItems = function ( carousel )
	return carousel.list:getNumChildren()
end

CoD.CarouselCommon.GetCurrentItemIndex = function ( carousel )
	return carousel.m_currentItem
end

CoD.CarouselCommon.GetCurrentItem = function ( carousel )
	local currentIndex = carousel:getCurrentItemIndex()
	local currentContainer = carousel.list.containers[currentIndex]
	return currentContainer.content
end

CoD.CarouselCommon.ClearAllItems = function ( carousel )
	if carousel:getNumItems() == 0 then
		return 
	end
	local currentContainer = nil
	for i = 1, #carousel.list.containers, 1 do
		currentContainer = carousel.list.containers[i]
		currentContainer:processEvent( {
			name = "lose_focus"
		} )
		currentContainer:removeAllChildren()
		carousel.miniList.miniContainers[i]:removeAllChildren()
	end
	carousel.list:removeAllChildren()
	carousel.list.containers = {}
	carousel.miniList:removeAllChildren()
	carousel.miniList.miniContainers = {}
	carousel.m_currentItem = nil
end

CoD.CarouselCommon.SetPipPosition = function ( carousel, animationState )
	carousel.miniList:registerAnimationState( "default", animationState )
	carousel.miniList:animateToState( "default" )
end

CoD.CarouselCommon.GetMouseRange = function ( carousel )
	return carousel.m_mouseRange
end

CoD.CarouselCommon.SetMouseRange = function ( carousel, range )
	carousel.m_mouseRange = range
end

CoD.CarouselCommon.SetMouseDragDistance = function ( carousel, mouseDragDistance )
	carousel.m_mouseDragDistance = mouseDragDistance
end

CoD.CarouselCommon.IsMouseInsideElement = function ( container, event )
	local mouseX, mouseY = ProjectRootCoordinate( event.rootName, event.x, event.y )
	if mouseX == nil or mouseY == nil then
		return false
	else
		local inside = false
		local pixelsLeft, pixelsTop, pixelsRight, pixelsBottom = container:getRect()
		if event.mouse_outside == nil and pixelsLeft ~= nil and pixelsTop <= mouseY and mouseY <= pixelsBottom and pixelsLeft <= mouseX and mouseX <= pixelsRight then
			return true
		else
			return false
		end
	end
end

CoD.CarouselCommon.Container_LeftMouseUp = function ( container, event )
	if event.inside then
		container:dispatchEventToParent( {
			name = "container_mouse_click",
			controller = event.controller,
			index = container.index
		} )
	end
end

CoD.CarouselCommon.Container_MouseEnter = function ( container, event )
	container:dispatchEventToParent( {
		name = "container_mouse_enter",
		controller = event.controller,
		index = container.index,
		container = container
	} )
end

CoD.CarouselCommon.Container_MouseLeave = function ( container, event )
	container:dispatchEventToParent( {
		name = "container_mouse_leave",
		controller = event.controller,
		index = container.index,
		container = container
	} )
end

CoD.CarouselCommon.MiniContainer_LeftMouseUp = function ( miniContainer, event )
	if event.inside then
		miniContainer:dispatchEventToParent( {
			name = "minicontainer_mouse_click",
			controller = event.controller,
			index = miniContainer.index
		} )
	end
end

CoD.CarouselCommon.MiniContainer_MouseEnter = function ( miniContainer, event )
	miniContainer:dispatchEventToParent( {
		name = "minicontainer_mouse_enter",
		controller = event.controller,
		index = miniContainer.index,
		miniContainer = miniContainer
	} )
end

CoD.CarouselCommon.MiniContainer_MouseLeave = function ( miniContainer, event )
	miniContainer:dispatchEventToParent( {
		name = "minicontainer_mouse_leave",
		controller = event.controller,
		index = miniContainer.index,
		miniContainer = miniContainer
	} )
end

CoD.CarouselCommon.ContainerMouseClick = function ( carousel, event )
	local mouseRange = carousel:getMouseRange()
	local currentCarouselIndex = carousel:getCurrentItemIndex()
	local containerIndex = event.index
	if mouseRange ~= nil and mouseRange < math.abs( containerIndex - currentCarouselIndex ) then
		return 
	elseif containerIndex ~= currentCarouselIndex then
		carousel:scrollToItem( containerIndex, carousel.m_scrollTime )
	else
		local currentItem = carousel:getCurrentItem()
		currentItem:processEvent( {
			name = "button_action",
			controller = event.controller
		} )
	end
end

CoD.CarouselCommon.ContainerMouseEnter = function ( carousel, event )
	local currentCarouselIndex = carousel:getCurrentItemIndex()
	event.container:dispatchEventToChildren( {
		name = "carousel_mouse_enter",
		controller = event.controller,
		isSelected = event.index == currentCarouselIndex
	} )
end

CoD.CarouselCommon.ContainerMouseLeave = function ( carousel, event )
	local currentCarouselIndex = carousel:getCurrentItemIndex()
	event.container:dispatchEventToChildren( {
		name = "carousel_mouse_leave",
		controller = event.controller,
		isSelected = event.index == currentCarouselIndex
	} )
end

CoD.CarouselCommon.MiniContainerMouseClick = function ( carousel, event )
	local currentCarouselIndex = carousel:getCurrentItemIndex()
	local miniContainerIndex = event.index
	if miniContainerIndex ~= currentCarouselIndex then
		carousel:scrollToItem( miniContainerIndex, carousel.m_scrollTime )
	end
end

CoD.CarouselCommon.MiniContainerMouseEnter = function ( carousel, event )
	local currentCarouselIndex = carousel:getCurrentItemIndex()
	if event.index ~= currentCarouselIndex then
		event.miniContainer.background:beginAnimation( "selected", 100 )
		event.miniContainer.background:setImage( CoD.HorizontalCarousel.PipFillMaterial )
	end
end

CoD.CarouselCommon.MiniContainerMouseLeave = function ( carousel, event )
	local currentCarouselIndex = carousel:getCurrentItemIndex()
	if event.index ~= currentCarouselIndex then
		event.miniContainer.background:beginAnimation( "default", 100 )
		event.miniContainer.background:setImage( CoD.HorizontalCarousel.PipMaterial )
	end
end

CoD.CarouselCommon.LeftMouseUp = function ( carousel, event )
	carousel.m_curX = nil
	carousel.m_curY = nil
	if carousel.m_mouseDrag then
		carousel.m_mouseDrag = nil
		return true
	else
		
	end
end

CoD.CarouselCommon.LeftMouseDown = function ( carousel, event )
	carousel.m_curX = event.x
	carousel.m_curY = event.y
end

