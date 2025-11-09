require( "ui.T6.CarouselCommon" )

CoD.VerticalCarousel = {}
CoD.VerticalCarousel.ExpansionScale = 1.5
CoD.VerticalCarousel.ItemWidth = 100
CoD.VerticalCarousel.ItemHeight = 100
CoD.VerticalCarousel.Spacing = 10
CoD.VerticalCarousel.ScrollTime = 100
CoD.VerticalCarousel.EdgeBounceOffset = 10
CoD.VerticalCarousel.MiniCarouselSize = 10
if CoD.isSinglePlayer then
	CoD.VerticalCarousel.ScrollUpSFX = "uin_main_nav"
	CoD.VerticalCarousel.ScrollDownSFX = "uin_main_nav"
else
	CoD.VerticalCarousel.ScrollUpSFX = "uin_slide_nav_up"
	CoD.VerticalCarousel.ScrollDownSFX = "uin_slide_nav_down"
end
CoD.VerticalCarousel.new = function ( defaultAnimationState, itemWidth, itemHeight, spacing, expansionScale, scrollTime, showMiniCarousel )
	local carousel = LUI.UIElement.new( defaultAnimationState )
	carousel.id = "VerticalCarousel"
	carousel:setUseStencil( true )
	if CoD.VerticalCarousel.PipMaterial == nil then
		CoD.VerticalCarousel.PipMaterial = RegisterMaterial( "menu_vis_carousel_pip" )
	end
	if CoD.VerticalCarousel.PipFillMaterial == nil then
		CoD.VerticalCarousel.PipFillMaterial = RegisterMaterial( "menu_vis_carousel_pip_fill" )
	end
	carousel.m_itemWidth = CoD.VerticalCarousel.ItemWidth
	if itemWidth ~= nil then
		carousel.m_itemWidth = itemWidth
	end
	carousel.m_itemHeight = CoD.VerticalCarousel.ItemHeight
	if itemHeight ~= nil then
		carousel.m_itemHeight = itemHeight
	end
	carousel.m_spacing = CoD.VerticalCarousel.Spacing
	if spacing ~= nil then
		carousel.m_spacing = spacing
	end
	carousel.m_expansionScale = CoD.VerticalCarousel.ExpansionScale
	if expansionScale ~= nil then
		carousel.m_expansionScale = expansionScale
	end
	carousel.m_scrollTime = CoD.VerticalCarousel.ScrollTime
	if scrollTime ~= nil then
		carousel.m_scrollTime = scrollTime
	end
	carousel.m_mouseDragDistance = CoD.CarouselCommon.MouseDragDistance
	carousel.list = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = 0,
		bottom = 0,
		spacing = carousel.m_spacing,
		alignment = LUI.Alignment.Center
	} )
	carousel.list.containers = {}
	carousel:addElement( carousel.list )
	carousel.miniList = LUI.UIVerticalList.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -CoD.VerticalCarousel.MiniCarouselSize,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		spacing = 2,
		alignment = LUI.Alignment.Middle
	} )
	carousel.miniList.miniContainers = {}
	if showMiniCarousel == true then
		carousel:addElement( carousel.miniList )
	end
	carousel.m_itemWidth = itemWidth
	carousel.m_itemHeight = itemHeight
	carousel.m_scrollSFX = CoD.VerticalCarousel.ScrollDownSFX
	CoD.CarouselCommon.SetupCarousel( carousel )
	carousel.handleGamepadButton = CoD.VerticalCarousel.HandleGamepadButton
	carousel.addItem = CoD.VerticalCarousel.AddItem
	carousel.scrollToItem = CoD.VerticalCarousel.ScrollToItem
	if CoD.useMouse then
		carousel:setHandleMouse( true )
		carousel:registerEventHandler( "leftmouseup", CoD.CarouselCommon.LeftMouseUp )
		carousel:registerEventHandler( "leftmousedown", CoD.CarouselCommon.LeftMouseDown )
		carousel:registerEventHandler( "mousedrag", CoD.VerticalCarousel.MouseDrag )
	end
	carousel.upButtonRepeater = LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} )
	carousel:addElement( carousel.upButtonRepeater )
	carousel.downButtonRepeater = LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} )
	carousel:addElement( carousel.downButtonRepeater )
	return carousel
end

CoD.VerticalCarousel.MouseDrag = function ( carousel, event )
	if carousel.m_curY == nil then
		return 
	end
	local scrollDirection = nil
	local numChildren = carousel.list:getNumChildren()
	if numChildren > 1 and carousel.m_mouseDragDistance < math.abs( carousel.m_curY - event.y ) then
		if carousel.m_curY < event.y then
			scrollDirection = -1
			carousel.m_scrollSFX = CoD.VerticalCarousel.ScrollUpSFX
		else
			scrollDirection = 1
			carousel.m_scrollSFX = CoD.VerticalCarousel.ScrollDownSFX
		end
		if carousel.m_currentItem ~= nil then
			carousel:scrollToItem( carousel.m_currentItem + scrollDirection, carousel.m_scrollTime )
		end
		carousel.m_curY = event.y
		carousel.m_mouseDrag = true
	end
end

CoD.VerticalCarousel.HandleGamepadButton = function ( carousel, event )
	if LUI.UIElement.handleGamepadButton( carousel, event ) == true then
		return true
	end
	local numChildren = carousel.list:getNumChildren()
	if numChildren > 1 then
		local scrollDirection = nil
		if event.down == true then
			if event.button == "down" then
				scrollDirection = 1
				carousel.m_scrollSFX = CoD.VerticalCarousel.ScrollDownSFX
			elseif event.button == "up" then
				scrollDirection = -1
				carousel.m_scrollSFX = CoD.VerticalCarousel.ScrollUpSFX
			end
		end
		if scrollDirection ~= nil and carousel.m_currentItem ~= nil then
			carousel:scrollToItem( carousel.m_currentItem + scrollDirection, carousel.m_scrollTime )
		end
	end
end

CoD.VerticalCarousel.ScrollToItem = function ( carousel, itemIndex, duration )
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
		carousel.list:setTopBottom( false, false, -(carousel.m_itemHeight * carousel.m_expansionScale) / 2 + CoD.VerticalCarousel.EdgeBounceOffset, 0 )
		carousel.upButtonRepeater:cancelRepetition()
	elseif numChildren < itemIndex then
		local offsetFromFirstItem = (carousel.m_itemHeight + carousel.m_spacing) * (numChildren - 1) + carousel.m_itemHeight * carousel.m_expansionScale / 2
		carousel.list:beginAnimation( "edge_bounce", duration / 4, false, false )
		carousel.list:setTopBottom( false, false, -offsetFromFirstItem - CoD.VerticalCarousel.EdgeBounceOffset, 0 )
		carousel.downButtonRepeater:cancelRepetition()
	else
		currentContainer = carousel.list.containers[carousel.m_currentItem]
		if itemIndex ~= carousel.m_currentItem and currentContainer ~= nil then
			CoD.VerticalCarousel.ElemContainer_DefaultAnim( currentContainer, carousel, duration )
			currentContainer:processEvent( {
				name = "lose_focus"
			} )
			currentContainer.miniContainer.background:beginAnimation( "default", duration )
			currentContainer.miniContainer.background:setImage( CoD.VerticalCarousel.PipMaterial )
		end
		carousel.m_currentItem = itemIndex
		currentContainer = carousel.list.containers[carousel.m_currentItem]
		currentContainer:processEvent( {
			name = "gain_focus"
		} )
		CoD.VerticalCarousel.ElemContainer_ExpandAnim( currentContainer, carousel, duration )
		currentContainer.miniContainer.background:beginAnimation( "selected", duration )
		currentContainer.miniContainer.background:setImage( CoD.VerticalCarousel.PipFillMaterial )
		local offsetFromFirstItem = (carousel.m_itemHeight + carousel.m_spacing) * (carousel.m_currentItem - 1)
		carousel.list:beginAnimation( "carousel_scroll", duration, false, false )
		carousel.list:setTopBottom( false, false, -(carousel.m_itemHeight * carousel.m_expansionScale) / 2 - offsetFromFirstItem, 0 )
		if f4_local0 == true then
			Engine.PlaySound( carousel.m_scrollSFX )
		end
		carousel.list.m_scrolling = true
	end
	return currentContainer
end

CoD.VerticalCarousel.AddItem = function ( carousel, element )
	local elemContainer = LUI.UIElement.new()
	elemContainer.id = "VerticalCarouselContainer"
	CoD.VerticalCarousel.ElemContainer_DefaultAnim( elemContainer, carousel, 0 )
	carousel.list:addElement( elemContainer )
	table.insert( carousel.list.containers, elemContainer )
	elemContainer.index = #carousel.list.containers
	local miniElemContainer = LUI.UIElement.new()
	miniElemContainer:setLeftRight( true, true, 0, 0 )
	miniElemContainer:setTopBottom( true, false, 0, CoD.VerticalCarousel.MiniCarouselSize )
	miniElemContainer.background = LUI.UIImage.new()
	miniElemContainer.background:setLeftRight( true, true, 0, 0 )
	miniElemContainer.background:setTopBottom( true, true, 0, 0 )
	miniElemContainer.background:setImage( CoD.VerticalCarousel.PipMaterial )
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

CoD.VerticalCarousel.ElemContainer_DefaultAnim = function ( self, carousel, duration )
	self:beginAnimation( "default", duration )
	self:setLeftRight( false, false, -carousel.m_itemWidth / 2, carousel.m_itemWidth / 2 )
	self:setTopBottom( true, false, 0, carousel.m_itemHeight )
end

CoD.VerticalCarousel.ElemContainer_ExpandAnim = function ( self, carousel, duration )
	self:beginAnimation( "expand", duration )
	self:setLeftRight( false, false, -(carousel.m_itemWidth / 2 * carousel.m_expansionScale), carousel.m_itemWidth / 2 * carousel.m_expansionScale )
	self:setTopBottom( true, false, 0, carousel.m_itemHeight * carousel.m_expansionScale )
end

