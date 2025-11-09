require( "ui.T6.ContentGridButton" )

CoD.ScrollableContentGrid = {}
CoD.ScrollableContentGrid.Spacing = 5
CoD.ScrollableContentGrid.ItemSize = 100
CoD.ScrollableContentGrid.ItemWidth = 110
CoD.ScrollableContentGrid.ItemHeight = 90
CoD.ScrollableContentGrid.PositionTextFont = "ExtraSmall"
local Grid_UpdateScrollBar = function ( grid, index )
	if grid.m_numTotalItems <= grid.m_numItems and grid.m_scrollBarContainer then
		grid.m_scrollBarContainer:close()
		return 
	end
	local scrollBar, barBG, barBgGrad = nil
	if not grid.m_scrollBarContainer:getParent() then
		grid:addElement( grid.m_scrollBarContainer )
	end
	if grid.m_scrollBarContainer and grid.m_scrollBarContainer.scrollBar then
		scrollBar = grid.m_scrollBarContainer.scrollBar
		scrollBar:beginAnimation( "scroll", 100 )
	else
		scrollBar = LUI.UIElement.new()
		scrollBar.barBG = LUI.UIImage.new()
		scrollBar.barBgGrad = LUI.UIImage.new()
	end
	local inset = 2
	local scrollBarContainerHeight = grid.m_totalHeight
	local totalRows = math.ceil( grid.m_numTotalItems / grid.m_numItemsWide )
	local scrollBarHeight = grid.m_numItemsTall / totalRows * scrollBarContainerHeight - inset * 2
	local rowsAbove = math.ceil( (grid.m_pageStartIndex - 1) / grid.m_numItemsWide )
	local scrollBarTopOffset = rowsAbove / totalRows * scrollBarContainerHeight + inset
	scrollBar:setLeftRight( true, true, inset, -inset )
	scrollBar:setTopBottom( true, false, scrollBarTopOffset, scrollBarTopOffset + scrollBarHeight )
	barBG = scrollBar.barBG
	barBG:setLeftRight( true, true, 0, 0 )
	barBG:setTopBottom( true, true, 0, 0 )
	barBG:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	scrollBar:addElement( barBG )
	barBgGrad = scrollBar.barBgGrad
	barBgGrad:setLeftRight( true, true, 0, 0 )
	barBgGrad:setTopBottom( true, true, 0, 0 )
	barBgGrad:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	barBgGrad:setAlpha( 0.4 )
	scrollBar:addElement( barBgGrad )
	grid.m_scrollBarContainer.scrollBar = scrollBar
	grid.m_scrollBarContainer:addElement( scrollBar )
end

local Grid_UpdatePositionText = function ( grid, index )
	local padding = 20
	local totalRows = math.ceil( grid.m_numTotalItems / grid.m_numItemsWide )
	local maxRowsDisplayed = math.min( totalRows, grid.m_numItemsTall )
	local topOffset = maxRowsDisplayed * grid.m_itemHeight + grid.m_spacing * (maxRowsDisplayed - 1) + padding
	local textSize = CoD.textSize[CoD.ScrollableContentGrid.PositionTextFont]
	local font = CoD.fonts[CoD.ScrollableContentGrid.PositionTextFont]
	local positionText = Engine.Localize( "MENU_SHOWING_X_OF_Y", index, grid.m_numTotalItems )
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( positionText, font, textSize )
	local textWidth = textRight - textLeft
	local positionTextContainer = nil
	if not grid.m_positionTextContainer then
		local leftOffset = 0
		local spaceBetweenTextAndUpArrow = 15
		local spaceBetweenUpAndDownArrow = 15
		local arrowSize = 20
		local positionTextContainerWidth = textWidth + arrowSize * 2 + spaceBetweenTextAndUpArrow + spaceBetweenUpAndDownArrow
		positionTextContainer = LUI.UIElement.new()
		local randomValueToMakeItLookGood = 10
		leftOffset = grid.m_totalWidth / 2 - positionTextContainerWidth / 2 + randomValueToMakeItLookGood
		positionTextContainer:setLeftRight( true, false, leftOffset, leftOffset + positionTextContainerWidth )
		positionTextContainer:setTopBottom( true, false, topOffset, topOffset + textSize )
		grid:addElement( positionTextContainer )
		grid.m_positionTextContainer = positionTextContainer
		
		leftOffset = 0
		
		local textElem = LUI.UIText.new()
		textElem:setLeftRight( true, false, leftOffset, leftOffset + textWidth )
		textElem:setTopBottom( true, true, 0, 0 )
		textElem:setFont( font )
		positionTextContainer.textElem = textElem
		positionTextContainer:addElement( textElem )
		positionTextContainer.textElem = textElem
		
		leftOffset = leftOffset + textWidth + spaceBetweenTextAndUpArrow
		
		local upArrow = LUI.UIImage.new()
		upArrow:setLeftRight( true, false, leftOffset, leftOffset + arrowSize )
		upArrow:setTopBottom( false, false, -arrowSize / 2, arrowSize / 2 )
		upArrow:setZRot( 90 )
		upArrow:setImage( RegisterMaterial( "ui_arrow_right" ) )
		positionTextContainer:addElement( upArrow )
		positionTextContainer.upArrow = upArrow
		
		leftOffset = leftOffset + spaceBetweenUpAndDownArrow
		local downArrow = LUI.UIImage.new()
		downArrow:setLeftRight( true, false, leftOffset, leftOffset + arrowSize )
		downArrow:setTopBottom( false, false, -arrowSize / 2, arrowSize / 2 )
		downArrow:setZRot( -90 )
		downArrow:setImage( RegisterMaterial( "ui_arrow_right" ) )
		positionTextContainer:addElement( downArrow )
		positionTextContainer.downArrow = downArrow
	end
	positionTextContainer = grid.m_positionTextContainer
	positionTextContainer.textElem:setText( positionText )
	if grid.m_numTotalItems <= grid.m_numItems then
		positionTextContainer.upArrow:hide()
		positionTextContainer.downArrow:hide()
		local positionTextContainerWidth = textWidth
		local leftOffset = grid.m_totalWidth / 2 - positionTextContainerWidth / 2
		positionTextContainer:setLeftRight( true, false, leftOffset, leftOffset + positionTextContainerWidth )
		positionTextContainer.textElem:setLeftRight( true, false, 0, textWidth )
	else
		if math.ceil( (grid.m_pageStartIndex - 1) / grid.m_numItemsWide ) > 0 then
			positionTextContainer.upArrow:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		else
			positionTextContainer.upArrow:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
		end
		if grid.m_pageStartIndex - 1 + grid.m_numItems < grid.m_numTotalItems then
			positionTextContainer.downArrow:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		else
			positionTextContainer.downArrow:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
		end
	end
	Grid_UpdateScrollBar( grid, index )
end

local Grid_UpdateFocussedItem = function ( grid, itemToFocus )
	Engine.PlaySound( "cac_grid_nav" )
	if grid and grid.m_focussedItem and grid.m_focussedItem == itemToFocus then
		grid:dispatchEventToParent( {
			name = "grid_focus_changed",
			index = grid.m_focussedItem.m_index
		} )
		Grid_UpdatePositionText( grid, grid.m_focussedItem.m_index )
		return 
	elseif grid.m_focussedItem ~= nil then
		grid.m_focussedItem.button:processEvent( {
			name = "lose_focus",
			controller = grid.m_controller
		} )
	end
	grid.m_focussedItem = itemToFocus
	grid.m_focussedItem.button:processEvent( {
		name = "gain_focus",
		controller = grid.m_controller
	} )
	Grid_UpdatePositionText( grid, grid.m_focussedItem.m_index )
	grid:dispatchEventToParent( {
		name = "grid_focus_changed",
		index = grid.m_focussedItem.m_index
	} )
end

CoD.ScrollableContentGrid.SetTotalItems = function ( grid, n )
	if n <= 0 and grid.m_scrollBarContainer then
		grid.m_scrollBarContainer:close()
	end
	if grid.m_numTotalItems == nil or grid.m_numTotalItems ~= n then
		grid.m_numTotalItems = n
	end
	grid:generate()
end

local Grid_HideAllItems = function ( grid )
	for index, item in ipairs( grid.items ) do
		item:hide()
	end
end

local Grid_BuildPage = function ( grid, itemToFocus )
	if grid.m_numTotalItems == 0 then
		Grid_HideAllItems( grid )
		return 
	end
	for index, item in ipairs( grid.items ) do
		item.m_index = grid.m_pageStartIndex + index - 1
		if item.m_index <= grid.m_numTotalItems then
			item.dataCallback( grid.m_controller, item, grid )
			item:show()
		else
			item:hide()
		end
	end
	Grid_UpdateFocussedItem( grid, itemToFocus )
end

local Grid_MoveLeft = function ( grid )
	if grid.m_focussedItem == nil then
		return 
	end
	local currentItemContentIndex = grid.m_focussedItem.contentIndex
	local currentItemIndex = grid.m_focussedItem.m_index
	local nextItemContentIndex = currentItemContentIndex - 1
	local nextItemIndex = currentItemIndex - grid.m_numItemsWide
	if currentItemContentIndex == 1 and nextItemContentIndex < 1 and nextItemIndex >= 1 then
		grid.m_pageStartIndex = grid.m_pageStartIndex - grid.m_numItemsWide
		Grid_BuildPage( grid, grid.items[grid.m_numItemsWide] )
		return 
	elseif nextItemContentIndex >= 1 then
		Grid_UpdateFocussedItem( grid, grid.items[nextItemContentIndex] )
	end
end

local Grid_MoveRight = function ( grid )
	local currentItem = grid.m_focussedItem
	if currentItem == nil then
		return 
	end
	local currentItemContentIndex = grid.m_focussedItem.contentIndex
	local currentItemIndex = grid.m_focussedItem.m_index
	local nextItemContentIndex = currentItemContentIndex + 1
	local nextItemIndex = currentItemIndex + 1
	if currentItemContentIndex == grid.m_numItems and grid.m_numItems < nextItemContentIndex and nextItemIndex <= grid.m_numTotalItems then
		grid.m_pageStartIndex = grid.m_pageStartIndex + grid.m_numItemsWide
		local firstItemInLastRow = grid.m_numItemsWide * (grid.m_numItemsTall - 1) + 1
		Grid_BuildPage( grid, grid.items[firstItemInLastRow] )
		return 
	elseif nextItemContentIndex <= grid.m_numItems and nextItemIndex <= grid.m_numTotalItems then
		Grid_UpdateFocussedItem( grid, grid.items[nextItemContentIndex] )
	end
end

local Grid_MoveUp = function ( grid )
	local currentItem = grid.m_focussedItem
	if currentItem == nil then
		return 
	else
		local currentItemContentIndex = grid.m_focussedItem.contentIndex
		local currentItemIndex = grid.m_focussedItem.m_index
		local nextItemContentIndex = currentItemContentIndex - grid.m_numItemsWide
		local nextItemIndex = currentItemIndex - grid.m_numItemsWide
		if nextItemIndex < 1 then
			return 
		elseif nextItemContentIndex < 1 then
			grid.m_pageStartIndex = grid.m_pageStartIndex - grid.m_numItemsWide
			Grid_BuildPage( grid, currentItem )
			return 
		else
			Grid_UpdateFocussedItem( grid, grid.items[nextItemContentIndex] )
		end
	end
end

local Grid_MoveDown = function ( grid )
	local currentItem = grid.m_focussedItem
	if currentItem == nil then
		return 
	end
	local currentItemContentIndex = grid.m_focussedItem.contentIndex
	local currentItemIndex = grid.m_focussedItem.m_index
	local nextItemContentIndex = currentItemContentIndex + grid.m_numItemsWide
	local nextItemIndex = currentItemIndex + grid.m_numItemsWide
	local firstItemIndexInNextRow = nil
	if currentItemIndex % grid.m_numItemsWide == 0 then
		firstItemIndexInNextRow = currentItemIndex + 1
	else
		firstItemIndexInNextRow = currentItemIndex + grid.m_numItemsWide - currentItemIndex % grid.m_numItemsWide + 1
	end
	if grid.m_numTotalItems < firstItemIndexInNextRow or nextItemContentIndex <= grid.m_numItems and grid.m_numTotalItems < nextItemIndex then
		return 
	elseif nextItemIndex <= grid.m_numTotalItems and nextItemContentIndex <= grid.m_numItems then
		Grid_UpdateFocussedItem( grid, grid.items[nextItemContentIndex] )
		return 
	elseif grid.m_numItems < nextItemContentIndex and nextItemIndex <= grid.m_numTotalItems then
		grid.m_pageStartIndex = grid.m_pageStartIndex + grid.m_numItemsWide
		Grid_BuildPage( grid, currentItem )
		return 
	end
	local nextItemContentIndex = grid.m_numItemsWide * (grid.m_numItemsTall - 1) + 1
	grid.m_pageStartIndex = grid.m_pageStartIndex + grid.m_numItemsWide
	Grid_BuildPage( grid, grid.items[nextItemContentIndex] )
end

local Grid_Gamepad_Button = function ( grid, event )
	if grid.m_inputDisabled then
		return 
	elseif event.down == true and event.button == "left" then
		Grid_MoveLeft( grid )
	elseif event.down == true and event.button == "right" then
		Grid_MoveRight( grid )
	elseif event.down == true and event.button == "up" then
		Grid_MoveUp( grid )
	elseif event.down == true and event.button == "down" then
		Grid_MoveDown( grid )
	end
	grid:dispatchEventToChildren( event )
end

CoD.ScrollableContentGrid.AddScrollBar = function ( grid )
	local scrollbarWidth = 12
	local spaceBetweenItemsAndScrollbar = 15
	local leftOffset = grid.m_totalWidth + spaceBetweenItemsAndScrollbar
	local scrollBarContainer = LUI.UIElement.new()
	scrollBarContainer:setLeftRight( true, false, leftOffset, leftOffset + scrollbarWidth )
	scrollBarContainer:setTopBottom( true, false, 0, grid.m_totalHeight )
	scrollBarContainer:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.05 ) )
	local barBG = LUI.UIImage.new()
	barBG:setLeftRight( true, true, 1, -1 )
	barBG:setTopBottom( true, true, 1, -1 )
	barBG:setRGB( 0, 0, 0 )
	barBG:setAlpha( 0.4 )
	scrollBarContainer:addElement( barBG )
	local barBgGrad = LUI.UIImage.new()
	barBgGrad:setLeftRight( true, true, 2, -2 )
	barBgGrad:setTopBottom( true, true, 2, -2 )
	barBgGrad:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	barBgGrad:setAlpha( 0.1 )
	scrollBarContainer:addElement( barBgGrad )
	grid.m_scrollBarContainer = scrollBarContainer
	grid:addElement( grid.m_scrollBarContainer )
end

CoD.ScrollableContentGrid.new = function ( controller, defaultAnimationState, numItemsTall, numItemsWide, itemCreateFnc, itemPopulateFnc, itemWidth, itemHeight, spacing )
	local grid = LUI.UIElement.new( defaultAnimationState )
	grid.id = "scrollableContentGrid"
	grid.m_controller = controller
	grid.m_numItemsTall = numItemsTall
	grid.m_numItemsWide = numItemsWide
	grid.m_numItems = grid.m_numItemsTall * grid.m_numItemsWide
	grid.m_numTotalItems = nil
	grid.m_spacing = CoD.ScrollableContentGrid.Spacing
	grid.m_itemWidth = CoD.ScrollableContentGrid.ItemWidth
	grid.m_itemHeight = CoD.ScrollableContentGrid.ItemHeight
	grid.generate = CoD.ScrollableContentGrid.Generate
	grid.setTotalItems = CoD.ScrollableContentGrid.SetTotalItems
	grid.createItemMutables = itemCreateFnc
	grid.populateItemMutables = itemPopulateFnc
	grid.refresh = CoD.ScrollableContentGrid.Refresh
	grid.items = {}
	if spacing then
		grid.m_spacing = spacing
	end
	if itemWidth then
		grid.m_itemWidth = itemWidth
	end
	if itemHeight then
		grid.m_itemHeight = itemHeight
	end
	grid.m_totalWidth = grid.m_itemWidth * grid.m_numItemsWide + grid.m_spacing * (grid.m_numItemsWide - 1)
	grid.m_totalHeight = grid.m_itemHeight * grid.m_numItemsTall + grid.m_spacing * (grid.m_numItemsTall - 1)
	CoD.ScrollableContentGrid.AddScrollBar( grid )
	grid:registerEventHandler( "gamepad_button", Grid_Gamepad_Button )
	return grid
end

CoD.ScrollableContentGrid.Generate = function ( grid )
	if grid.m_numTotalItems == 0 then
		Grid_HideAllItems( grid )
		return 
	elseif grid.createItemMutables ~= nil then
		for i = 1, grid.m_numItems, 1 do
			local gridItem = LUI.UIElement.new( {
				left = 0,
				top = 0,
				right = 0,
				bottom = 0,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = true,
				bottomAnchor = true
			} )
			gridItem.button = CoD.ContentGridButton.new( i )
			gridItem.dataCallback = grid.populateItemMutables
			grid.createItemMutables( grid.m_controller, gridItem )
			gridItem:addElement( gridItem.button )
			local numItemsWide = grid.m_numItemsWide
			local itemNumber = i - 1
			local itemX = itemNumber % numItemsWide
			local itemY = (itemNumber - itemX) / numItemsWide
			local itemWidth = grid.m_itemWidth
			local itemHeight = grid.m_itemHeight
			local spacing = grid.m_spacing
			local left = itemX * (itemWidth + spacing)
			local top = itemY * (itemHeight + spacing)
			gridItem.itemHolder = LUI.UIElement.new( {
				leftAnchor = true,
				rightAnchor = false,
				left = left,
				right = left + itemWidth,
				topAnchor = true,
				bottomAnchor = false,
				top = top,
				bottom = top + itemHeight
			} )
			gridItem.itemHolder:addElement( gridItem )
			grid:addElement( gridItem.itemHolder )
			gridItem.contentIndex = i
			table.insert( grid.items, gridItem )
		end
	end
	grid.createItemMutables = nil
	grid.m_pageStartIndex = 1
	local itemToFocus = grid.items[1]
	Grid_BuildPage( grid, itemToFocus )
end

