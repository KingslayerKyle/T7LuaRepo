LUI.GridLayout = InheritFrom( LUI.UIElement )
local LUI_GridLayout_GetElementEndRow = function ( element )
	return element.gridInfoTable.gridRowIndex + element.gridInfoTable.gridRowSpan - 1
end

local LUI_GridLayout_GetElementEndColumn = function ( element )
	return element.gridInfoTable.gridColIndex + element.gridInfoTable.gridColSpan - 1
end

local LUI_GridLayout_GetElementRequestedWidth = function ( element, controller )
	if element.getWidthInList then
		return element:getWidthInList( controller )
	elseif element.sizeElement then
		local widgetWidth, widgetHeight = element.sizeElement:getLocalSize()
		return widgetWidth
	else
		local widgetWidth, widgetHeight = element:getLocalSize()
		return widgetWidth
	end
end

local LUI_GridLayout_GetElementRequestedHeight = function ( element, controller )
	if element.getHeightInList then
		return element:getHeightInList( controller )
	elseif element.sizeElement then
		local widgetWidth, widgetHeight = element.sizeElement:getLocalSize()
		return widgetHeight
	else
		local widgetWidth, widgetHeight = element:getLocalSize()
		return widgetHeight
	end
end

LUI.GridLayout.new = function ( menu, controller, allowsFocus, minimumRowHeight, minimumColumnWidth, spacing, scrollAnimationTime, customWidgetSetup, filter, loopEdges, activeWidgetInPlace, firstElementXOffset, firstElementYOffset, placeMovedElementOnEnd, itemStencilEnabled )
	local self = LUI.UIElement.new()
	self:setClass( LUI.GridLayout )
	self.itemStencil = LUI.UIElement.new()
	self.itemStencil:setLeftRight( true, true, 0, 0 )
	self.itemStencil:setTopBottom( true, true, 0, 0 )
	self.itemStencil.anyChildUsesUpdateState = true
	self.itemStencil.id = "itemStencil"
	if itemStencilEnabled then
		self.itemStencil:setUseStencil( true )
	end
	self:addElement( self.itemStencil )
	self.usingStencil = itemStencilEnabled
	self.menu = menu
	self.elementStateConditions = {}
	self.m_focusable = allowsFocus
	self.filter = filter
	self.minimumRowHeight = minimumRowHeight
	self.minimumColumnWidth = minimumColumnWidth
	self.hCount = 1
	self.vCount = 1
	self.spacing = spacing
	self.controller = controller
	self.layoutItems = {}
	self.activeWidget = nil
	self.lastActiveWidget = nil
	self.loopEdges = loopEdges or false
	self:resetCurrentRowAndColumn()
	self.requestedRowCount = self.vCount
	self.requestedColumnCount = self.hCount
	self.itemCount = 0
	self.customWidgetSetup = customWidgetSetup
	self.scrollAnimationTime = scrollAnimationTime or 0
	self.widgetType = nil
	self.isGridLayout = true
	self.activeWidgetInPlace = activeWidgetInPlace or false
	self.firstElementXOffset = firstElementXOffset or 0
	self.firstElementYOffset = firstElementYOffset or 0
	self.placeMovedElementOnEnd = placeMovedElementOnEnd or false
	self.anyChildUsesUpdateState = true
	self.prepared = false
	self.backingWidget = nil
	self.backingXPadding = 0
	self.backingYPadding = 0
	self.rowColumnIndexMap = {}
	return self
end

LUI.GridLayout.setDataSource = function ( self, name )
	local dataSource = DataSources[name]
	if dataSource and dataSource.prepare then
		self.dataSourceName = name
		self:updateDataSource()
	else
		self:clearLayout()
		self.dataSourceName = name
	end
end

LUI.GridLayout.loopEdges = function ( self, loop )
	self.loopEdges = loop
end

LUI.GridLayout.setHorizontalCount = function ( self, count, ignoreLayoutClear )
	self.hCount = count
	self:updateDataSource( nil, ignoreLayoutClear, true )
end

LUI.GridLayout.setVerticalCount = function ( self, count, ignoreLayoutClear )
	self.vCount = count
	self:updateDataSource( nil, ignoreLayoutClear, true )
end

LUI.GridLayout.getDataSource = function ( self )
	return DataSources[self.dataSourceName]
end

LUI.GridLayout.setSpacing = function ( self, spacing )
	if self.spacing ~= spacing then
		self.spacing = spacing
		self:updateLayout( 0 )
	end
end

LUI.GridLayout.setBackingWidget = function ( self, backingWidget )
	if self.backingWidget then
		self.backingWidget:close()
		self.backingWidget = nil
	end
	if backingWidget and backingWidget.new then
		self.backingWidget = backingWidget.new( self.menu, self.controller )
		self.backingWidget:setPriority( -100 )
		self.backingWidget:setLeftRight( 0, 1, -self.backingXPadding, self.backingXPadding )
		self.backingWidget:setTopBottom( 0, 1, -self.backingYPadding, self.backingYPadding )
		self:addElement( self.backingWidget )
	end
end

LUI.GridLayout.setBackingWidgetXPadding = function ( self, xPadding )
	self.backingXPadding = xPadding
	if self.backingWidget then
		self.backingWidget:setLeftRight( 0, 1, -self.backingXPadding, self.backingXPadding )
	end
end

LUI.GridLayout.setBackingWidgetYPadding = function ( self, yPadding )
	self.backingYPadding = yPadding
	if self.backingWidget then
		self.backingWidget:setTopBottom( 0, 1, -self.backingYPadding, self.backingYPadding )
	end
end

LUI.GridLayout.updateCurrentPosition = function ( self, row, column )
	self.previousStartColumn = self.currentStartColumn
	self.previousStartRow = self.currentStartRow
	self.currentStartColumn = column
	self.currentStartRow = row
end

LUI.GridLayout.setWidgetType = function ( self, widgetType )
	self.widgetType = widgetType
	self:clearLayout()
end

LUI.GridLayout.mergeStateConditions = function ( self, conditionsTable )
	self.elementStateConditions = {}
	LUI.GridLayout.super.mergeStateConditions( self, conditionsTable, self.elementStateConditions )
	self:clearLayout()
	self:processEvent( {
		name = "update_state",
		menu = self.menu
	} )
end

LUI.GridLayout.setVerticalScrollbar = function ( self, verticalScrollbarWidget )
	if verticalScrollbarWidget and verticalScrollbarWidget.new then
		if self.verticalScrollbar then
			self.verticalScrollbar:close()
		end
		self:setForceMouseEventDispatch( true )
		self.verticalScrollbar = verticalScrollbarWidget.new( self.menu, self.controller )
		self.verticalScrollbar.listWidget = self
		local l, t, r, b = self.verticalScrollbar:getLocalRect()
		self.verticalScrollbar:setTopBottom( true, true, 0, 0 )
		self.verticalScrollbar:setLeftRight( false, true, 5, 5 + r - l )
		self:addElement( self.verticalScrollbar )
	end
	self:updateScrollbars()
end

LUI.GridLayout.addCustomVerticalCounter = function ( self, counterWidget )
	if self.customVerticalCounter then
		return 
	else
		self.customVerticalCounter = counterWidget
		self.customVerticalCounter.listWidget = self
		self:updateScrollbars()
	end
end

LUI.GridLayout.setVerticalCounter = function ( self, verticalCounterWidget )
	if self.verticalCounter then
		self.verticalCounter:close()
		self.verticalCounter = nil
	end
	if verticalCounterWidget and verticalCounterWidget.new then
		self:setForceMouseEventDispatch( true )
		self.verticalCounter = verticalCounterWidget.new( self.menu, self.controller )
		self.verticalCounter.listWidget = self
		local l, t, r, b = self.verticalCounter:getLocalRect()
		self.verticalCounter:setLeftRight( true, true, 0, 0 )
		self.verticalCounter:setTopBottom( false, true, 5, 5 + b - t )
		self:addElement( self.verticalCounter )
	end
	self:updateScrollbars()
end

LUI.GridLayout.setVerticalPips = function ( self, verticalPipsWidget )
	
end

LUI.GridLayout.setHorizontalScrollbar = function ( self, horizontalScrollbarWidget )
	if horizontalScrollbarWidget and horizontalScrollbarWidget.new then
		self:setForceMouseEventDispatch( true )
		if self.horizontalScrollbar then
			self.horizontalScrollbar:close()
		end
		self.horizontalScrollbar = horizontalScrollbarWidget.new( self.menu, self.controller )
		self.horizontalScrollbar.listWidget = self
		local l, t, r, b = self.horizontalScrollbar:getLocalRect()
		self.horizontalScrollbar:setLeftRight( true, true, 0, 0 )
		self.horizontalScrollbar:setTopBottom( false, true, 5, 5 + b - t )
		self:addElement( self.horizontalScrollbar )
	end
	self:updateScrollbars()
end

LUI.GridLayout.addCustomHorizontalCounter = function ( self, counterWidget )
	if self.customHorizontalCounter then
		return 
	else
		self.customHorizontalCounter = counterWidget
		self.customHorizontalCounter.listWidget = self
		self:updateScrollbars()
	end
end

LUI.GridLayout.setHorizontalCounter = function ( self, horizontalCounterWidget )
	if self.horizontalCounter then
		self.horizontalCounter:close()
		self.horizontalCounter = nil
	end
	if horizontalCounterWidget and horizontalCounterWidget.new then
		self:setForceMouseEventDispatch( true )
		self.horizontalCounter.listWidget = self
		self.horizontalCounter = horizontalCounterWidget.new( self.menu, self.controller )
		local l, t, r, b = self.horizontalCounter:getLocalRect()
		self.horizontalCounter:setLeftRight( true, true, 0, 0 )
		self.horizontalCounter:setTopBottom( false, true, 5, 5 + b - t )
		self:addElement( self.horizontalCounter )
	end
	self:updateScrollbars()
end

LUI.GridLayout.setHorizontalPips = function ( self, horizontalPipsWidget )
	
end

local RoundNumber = function ( number )
	return math.floor( number + 0.5 )
end

LUI.GridLayout.updateLayoutBasedOnVScrollbarMovement = function ( self, yDelta )
	if self.verticalScrollbar.slider.dragStartBarTop then
		local newTop = self.verticalScrollbar.slider.dragStartBarTop + yDelta
		local newBottom = newTop + self.verticalScrollbar.slider.barHeight
		local sliderTop = self.verticalScrollbar.sliderTop
		local sliderBottom = self.verticalScrollbar.sliderTop + self.verticalScrollbar.sliderHeight
		if sliderTop < newTop and newBottom < sliderBottom then
			self.verticalScrollbar.slider:setTopBottom( true, false, newTop, newBottom )
			self.verticalScrollbar.slider.currentBarTop = newTop
			local currentRowOffset = newTop - self.verticalScrollbar.sliderTop
			local currentRowPercent = currentRowOffset / self.verticalScrollbar.sliderHeight
			self.currentStartRow = RoundNumber( currentRowPercent * self.requestedRowCount ) + 1
			self:updateLayout()
		end
	end
end

LUI.GridLayout.updateLayoutBasedOnVScrollbarPercentage = function ( self, percentage )
	local currentStartRow = RoundNumber( percentage * self.requestedRowCount ) + 1
	local maxRowStart = self.requestedRowCount - self.vCount + 1
	self.currentStartRow = math.min( currentStartRow, maxRowStart )
	self:updateLayout()
end

LUI.GridLayout.scrollBarDragStart = function ( self )
	self.scrollbarDragging = true
end

LUI.GridLayout.scrollBarDragStop = function ( self )
	self.scrollbarDragging = false
	self.verticalScrollbar.slider.dragStartBarTop = self.verticalScrollbar.slider.currentBarTop
end

LUI.GridLayout.scrollUp = function ( self )
	if self.vCount < self.requestedRowCount then
		local newStartRow = math.max( self.currentStartRow - 1, 1 )
		self.currentStartRow = newStartRow
		self:updateLayout()
		return true
	else
		return false
	end
end

LUI.GridLayout.scrollDown = function ( self )
	if self.vCount < self.requestedRowCount then
		local newStartRow = math.min( self.currentStartRow + 1, self.requestedRowCount - self.vCount + 1 )
		self.currentStartRow = newStartRow
		self:updateLayout()
		return true
	else
		return false
	end
end

LUI.GridLayout.updateScrollbars = function ( self )
	local listWidth, listHeight = self:getLocalSize()
	if self.verticalScrollbar then
		if self.requestedRowCount <= self.vCount then
			self.verticalScrollbar:close()
		elseif not self.verticalScrollbar:getParent() then
			self:addElement( self.verticalScrollbar )
		end
	end
	if self.verticalScrollbar and not self.scrollbarDragging then
		local newState = "DefaultState"
		if self.requestedRowCount <= self.vCount then
			newState = "AtTopAndBottom"
		elseif self.currentStartRow == 1 and not self.loopEdges then
			newState = "AtTop"
		elseif self.requestedRowCount < self.currentStartRow + self.vCount and not self.loopEdges then
			newState = "AtBottom"
		end
		if self.verticalScrollbar.slider then
			if self.verticalScrollbar.sliderHeight == nil then
				local l, t, r, b = self.verticalScrollbar.slider:getLocalRect()
				self.verticalScrollbar.sliderHeight = listHeight - t + b
				self.verticalScrollbar.sliderTop = t
			end
			local percentVisible = math.min( self.vCount / self.requestedRowCount, 1 )
			local currentRowPercent = (self.currentStartRow - 1) / self.requestedRowCount
			local currentRowOffset = currentRowPercent * self.verticalScrollbar.sliderHeight
			local barHeight = percentVisible * self.verticalScrollbar.sliderHeight
			local barTop = self.verticalScrollbar.sliderTop + currentRowOffset
			self.verticalScrollbar.slider:beginAnimation( "update_position" )
			self.verticalScrollbar.slider:setTopBottom( true, false, barTop, barTop + barHeight )
			self.verticalScrollbar.slider.barHeight = barHeight
			self.verticalScrollbar.slider.dragStartBarTop = barTop
		end
		self.verticalScrollbar:setState( newState )
	end
	if self.horizontalScrollbar then
		local newState = "DefaultState"
		if self.requestedColumnCount <= self.hCount then
			newState = "AtLeftAndRight"
		elseif self.currentStartColumn == 1 then
			newState = "AtLeft"
		elseif self.requestedColumnCount < self.currentStartColumn + self.hCount then
			newState = "AtRight"
		end
		if self.horizontalScrollbar.slider then
			if self.horizontalScrollbar.sliderWidth == nil then
				local l, t, r, b = self.horizontalScrollbar.slider:getLocalRect()
				self.horizontalScrollbar.sliderWidth = listWidth - l + r
				self.horizontalScrollbar.sliderLeft = l
			end
			local percentVisible = math.min( self.hCount / self.requestedColumnCount, 1 )
			local currentColumnPercent = (self.currentStartColumn - 1) / self.requestedColumnCount
			local currentColumnOffset = currentColumnPercent * self.horizontalScrollbar.sliderWidth
			local barWidth = percentVisible * self.horizontalScrollbar.sliderWidth
			local barLeft = self.horizontalScrollbar.sliderLeft + currentColumnOffset
			self.horizontalScrollbar.slider:beginAnimation( "update_position" )
			self.horizontalScrollbar.slider:setLeftRight( true, false, barLeft, barLeft + barWidth )
		end
		self.horizontalScrollbar:setState( newState )
	end
end

local updateVerticalCounter = function ( self, counter )
	if counter then
		local newState = "DefaultState"
		if self.requestedRowCount <= self.vCount then
			newState = "AtTopAndBottom"
		elseif self.activeWidget then
			if self.currentStartRow == 1 then
				newState = "AtTop"
			elseif self.requestedRowCount < self.currentStartRow + self.vCount then
				newState = "AtBottom"
			end
		end
		if counter.currentItem then
			local currentItemIndex = 1
			if self.activeWidget then
				currentItemIndex = self.activeWidget.gridInfoTable.zeroBasedIndex + 1
			end
			counter.currentItem:setText( currentItemIndex )
		end
		if counter.count then
			local f34_local0 = self.itemCount
			if not f34_local0 then
				local count = 0
			end
			counter.count:setText( f34_local0 )
			if f34_local0 == 0 and counter.clipsPerState and counter.clipsPerState.NoItems then
				newState = "NoItems"
			end
		end
		counter:setState( newState )
	end
end

local updateHorizontalCounter = function ( self, counter )
	if counter then
		local newState = "DefaultState"
		if self.requestedColumnCount <= self.hCount then
			newState = "AtLeftAndRight"
		elseif self.activeWidget then
			if self.activeWidget.gridInfoTable.gridColIndex == 1 then
				newState = "AtLeft"
			elseif self.requestedColumnCount <= LUI_GridLayout_GetElementEndColumn( self.activeWidget ) then
				newState = "AtRight"
			end
		end
		if counter.currentItem then
			local currentItemIndex = 1
			if self.activeWidget then
				currentItemIndex = self.activeWidget.gridInfoTable.zeroBasedIndex + 1
			end
			counter.currentItem:setText( currentItemIndex )
		end
		if counter.count then
			local f35_local0 = self.itemCount
			if not f35_local0 then
				local count = 0
			end
			counter.count:setText( f35_local0 )
			if f35_local0 == 0 and counter.clipsPerState and counter.clipsPerState.NoItems then
				newState = "NoItems"
			end
		end
		counter:setState( newState )
	end
end

LUI.GridLayout.updateCounters = function ( self )
	updateVerticalCounter( self, self.verticalCounter )
	updateVerticalCounter( self, self.customVerticalCounter )
	updateHorizontalCounter( self, self.horizontalCounter )
	updateHorizontalCounter( self, self.customHorizontalCounter )
end

LUI.GridLayout.resetCurrentRowAndColumn = function ( self )
	self.currentStartRow = 1
	self.currentStartColumn = 1
	self.previousStartRow = 1
	self.previousStartColumn = 1
end

LUI.GridLayout.isWidgetSelectable = function ( self, widget )
	if widget.internal then
		return widget.internal:hasClip( "Active" )
	else
		return widget:hasClip( "Active" )
	end
end

LUI.GridLayout.getWidgetVisiblePosition = function ( self, widget )
	local f39_local0 = 0
	local xPos = 0
	if widget.gridInfoTable.gridRowIndex < self.currentStartRow then
		f39_local0 = widget.gridInfoTable.gridRowIndex - self.currentStartRow
	elseif self.currentStartRow + self.vCount <= LUI_GridLayout_GetElementEndRow( widget ) then
		f39_local0 = LUI_GridLayout_GetElementEndRow( widget ) - self.currentStartRow + self.vCount + 1
	end
	if widget.gridInfoTable.gridColIndex < self.currentStartColumn then
		xPos = widget.gridInfoTable.gridColIndex - self.currentStartColumn
	elseif self.currentStartColumn + self.hCount <= LUI_GridLayout_GetElementEndColumn( widget ) then
		xPos = LUI_GridLayout_GetElementEndColumn( widget ) - self.currentStartColumn + self.hCount + 1
	end
	return f39_local0, xPos
end

LUI.GridLayout.setActiveItem = function ( self, widget, overrideScrollTime )
	if widget == self.activeWidget then
		return 
	elseif self.activeWidget then
		self.activeWidget:processEvent( {
			name = "lose_active",
			controller = self.controller
		} )
	end
	self.lastActiveWidget = self.activeWidget
	self.activeWidget = widget
	if self.activeWidget then
		self.savedActiveIndex = self.activeWidget.gridInfoTable.zeroBasedIndex
		self.activeWidget:processEvent( {
			name = "gain_active",
			controller = self.controller
		} )
		self.activeWidget:dispatchEventToParentWithSelf( {
			name = "list_active_changed",
			list = self,
			model = self.activeWidget:getModel()
		} )
		if self.activeWidgetInPlace then
			if self.currentStartRow ~= widget.gridInfoTable.gridRowIndex or self.currentStartColumn ~= widget.gridInfoTable.gridColIndex then
				self:updateCurrentPosition( widget.gridInfoTable.gridRowIndex, widget.gridInfoTable.gridColIndex )
				self:updateLayout( overrideScrollTime or self.scrollAnimationTime )
			else
				self:updateLayout( 0 )
			end
		else
			local widgetVisX, widgetVisY = self:getWidgetVisiblePosition( widget )
			self:updateCurrentPosition( self.currentStartRow + widgetVisX, self.currentStartColumn + widgetVisY )
			if widgetVisX ~= 0 or widgetVisY ~= 0 then
				local f40_local0 = overrideScrollTime
				local f40_local1
				if math.abs( widgetVisX ) <= 1 and math.abs( widgetVisY ) <= 1 then
					f40_local1 = self.scrollAnimationTime
					if not f40_local1 then
					
					else
						self:updateLayout( f40_local1 )
					end
				end
				local scrollTime = 0
				f40_local1 = f40_local0 or scrollTime
			end
		end
		self:setModel( self.activeWidget:getModel() )
	else
		self:setModel( nil )
		if self.hasListFocus and self.updateButtonPromptsWhenEmptied then
			CoD.Menu.UpdateAllButtonPrompts( self.menu, self.controller )
		end
	end
	self:dispatchEventToParent( {
		name = "grid_item_changed",
		grid = self
	} )
	self:updateCounters()
end

LUI.GridLayout.clearSavedActiveIndex = function ( self )
	self.savedActiveIndex = nil
end

LUI.GridLayout.findItem = function ( self, modelsToFind, propertiesToFind, selectIfFound, overrideScrolltime )
	for row = 1, self.requestedRowCount, 1 do
		for column = 1, self.requestedColumnCount, 1 do
			local isMatch = true
			if modelsToFind then
				local elementModel = self:getModelForPosition( row, column )
				if elementModel then
					for modelName, modelValue in pairs( modelsToFind ) do
						local model = Engine.GetModel( elementModel, modelName )
						if not model or Engine.GetModelValue( model ) ~= modelValue then
							isMatch = false
						end
					end
				else
					isMatch = false
				end
			end
			if isMatch and propertiesToFind then
				local widget = self:getItemAtPosition( row, column, false )
				local f42_local7 = widget
				local propertyTable = self:getPropertiesForPosition( row, column )
				local f42_local4 = f42_local7 or propertyTable
				if f42_local4 then
					for propertyName, propertyValue in pairs( propertiesToFind ) do
						if f42_local4[propertyName] ~= propertyValue then
							isMatch = false
						end
					end
				else
					isMatch = false
				end
			end
			if isMatch then
				local widget = self:getItemAtPosition( row, column, true )
				if selectIfFound then
					self:setActiveItem( widget, overrideScrolltime )
				end
				return widget
			end
		end
	end
	return nil
end

LUI.GridLayout.findVisibleItem = function ( self, modelsToFind, propertiesToFind )
	for row, rowTable in LUI.IterateTableBySortedKeys( self.layoutItems ) do
		for column, widget in LUI.IterateTableBySortedKeys( rowTable ) do
			local f43_local6 = true
			if modelsToFind then
				local elementModel = widget:getModel()
				if elementModel then
					for modelName, modelValue in pairs( modelsToFind ) do
						local model = Engine.GetModel( elementModel, modelName )
						if not model or Engine.GetModelValue( model ) ~= modelValue then
							f43_local6 = false
						end
					end
				else
					f43_local6 = false
				end
			end
			if f43_local6 and propertiesToFind then
				for propertyName, propertyValue in pairs( propertiesToFind ) do
					if widget[propertyName] ~= propertyValue then
						f43_local6 = false
						break
					end
				end
			end
			if f43_local6 then
				return widget
			end
		end
	end
	return nil
end

LUI.GridLayout.getItemAtPosition = function ( self, row, column, createIfNotFound )
	local widget = nil
	local rowTable = self.layoutItems[row]
	if rowTable then
		widget = rowTable[column]
	end
	if not widget and createIfNotFound then
		widget = self:createWidgetForPosition( row, column, self.currentStartRow, self.currentStartColumn )
	end
	return widget
end

LUI.GridLayout.setActiveIndex = function ( self, row, column, overrideScrollTime, setEvenIfNotSelectable )
	if not row or not column then
		return false
	elseif row < 1 or self.requestedRowCount < row or column < 1 or self.requestedColumnCount < column then
		return false
	else
		local widget = self:getItemAtPosition( row, column, true )
		if widget and (setEvenIfNotSelectable or self:isWidgetSelectable( widget )) then
			self:setActiveItem( widget, overrideScrollTime )
			return true
		else
			return false
		end
	end
end

LUI.GridLayout.getRowAndColumnForIndex = function ( self, index )
	local row, column = nil
	if self.vCount == 1 then
		row = 1
		column = index + 1
	else
		row = math.floor( index / self.hCount ) + 1
		column = index % self.hCount + 1
	end
	return row, column
end

LUI.GridLayout.navigateItemLeft = function ( self )
	self.lastDirection = "left"
	if self.activeWidget ~= nil then
		local currentRow = self.activeWidget.gridInfoTable.gridRowIndex
		local currentCol = self.activeWidget.gridInfoTable.gridColIndex - 1
		for column = currentCol, 1, -1 do
			for rowOffset = 0, self.activeWidget.gridInfoTable.gridRowSpan - 1, 1 do
				local widget = self:getItemAtPosition( currentRow + rowOffset, column, true )
				if widget and self:isWidgetSelectable( widget ) then
					self:setActiveItem( widget )
					self:playSound( "list_left" )
					return true
				end
			end
		end
		if self.loopEdges and self.hCount > 1 and self.vCount > 1 then
			for column = self.requestedColumnCount, 1, -1 do
				for row = currentRow - 1, 1, -1 do
					local widget = self:getItemAtPosition( row, column, true )
					if widget and self:isWidgetSelectable( widget ) then
						self:setActiveItem( widget )
						self:playSound( "list_left" )
						return true
					end
				end
			end
			return false
		else
			for column = currentCol, 1, -1 do
				for f47_local4 = self.requestedRowCount, 1, -1 do
					local widget = self:getItemAtPosition( f47_local4, column, true )
					if widget and self:isWidgetSelectable( widget ) then
						self:setActiveItem( widget )
						self:playSound( "list_left" )
						return true
					end
				end
			end
			if self.loopEdges and (self.hCount == 1 or self.vCount == 1) then
				for column = self.requestedColumnCount, LUI_GridLayout_GetElementEndColumn( self.activeWidget ) + 1, -1 do
					for row = currentRow, 1, -1 do
						local widget = self:getItemAtPosition( row, column, true )
						if widget and self:isWidgetSelectable( widget ) then
							self:setActiveItem( widget )
							self:playSound( "list_left" )
							return true
						end
					end
				end
				if CoD.isPC and self.requestedRowCount == 1 and self.requestedColumnCount == 1 then
					return true
				end
			else
				return false
			end
		end
	end
	return false
end

LUI.GridLayout.getItemAtOffset = function ( self, rowOffset, colOffset )
	if self.activeWidget ~= nil then
		local currentRow = self.activeWidget.gridInfoTable.gridRowIndex
		local currentCol = LUI_GridLayout_GetElementEndColumn( self.activeWidget )
		local widget = self:getItemAtPosition( currentRow + rowOffset, currentCol + colOffset, false )
		if widget and self:isWidgetSelectable( widget ) then
			return widget
		end
	end
end

LUI.GridLayout.navigateItemRight = function ( self )
	self.lastDirection = "right"
	if self.activeWidget ~= nil then
		local currentRow = self.activeWidget.gridInfoTable.gridRowIndex
		local currentCol = LUI_GridLayout_GetElementEndColumn( self.activeWidget ) + 1
		for column = currentCol, self.requestedColumnCount, 1 do
			for rowOffset = 0, self.activeWidget.gridInfoTable.gridRowSpan - 1, 1 do
				local widget = self:getItemAtPosition( currentRow + rowOffset, column, true )
				if widget and self:isWidgetSelectable( widget ) then
					self:setActiveItem( widget )
					self:playSound( "list_right" )
					return true
				end
			end
		end
		if self.loopEdges and self.hCount > 1 and self.vCount > 1 then
			for column = 1, self.requestedColumnCount, 1 do
				for row = LUI_GridLayout_GetElementEndRow( self.activeWidget ) + 1, self.requestedRowCount, 1 do
					local widget = self:getItemAtPosition( row, column, true )
					if widget and self:isWidgetSelectable( widget ) then
						self:setActiveItem( widget )
						self:playSound( "list_right" )
						return true
					end
				end
			end
			return false
		else
			for column = currentCol, self.requestedColumnCount, 1 do
				for f49_local4 = self.requestedRowCount, 1, -1 do
					local widget = self:getItemAtPosition( f49_local4, column, true )
					if widget and self:isWidgetSelectable( widget ) then
						self:setActiveItem( widget )
						self:playSound( "list_right" )
						return true
					end
				end
			end
			if self.loopEdges and (self.hCount == 1 or self.vCount == 1) then
				for column = 1, self.activeWidget.gridInfoTable.gridColIndex - 1, 1 do
					for row = currentRow, 1, -1 do
						local widget = self:getItemAtPosition( row, column, true )
						if widget and self:isWidgetSelectable( widget ) then
							self:setActiveItem( widget )
							self:playSound( "list_right" )
							return true
						end
					end
				end
				if CoD.isPC and self.requestedRowCount == 1 and self.requestedColumnCount == 1 then
					return true
				end
			else
				return false
			end
		end
	end
	return false
end

LUI.GridLayout.navigateItemUp = function ( self )
	self.lastDirection = "up"
	if self.activeWidget ~= nil then
		local currentRow = self.activeWidget.gridInfoTable.gridRowIndex - 1
		local currentCol = self.activeWidget.gridInfoTable.gridColIndex
		for row = currentRow, 1, -1 do
			for columnOffset = 0, self.activeWidget.gridInfoTable.gridColSpan - 1, 1 do
				local widget = self:getItemAtPosition( row, currentCol + columnOffset, true )
				if widget and self:isWidgetSelectable( widget ) then
					self:setActiveItem( widget )
					self:playSound( "list_up" )
					return true
				end
			end
		end
		for row = currentRow, 1, -1 do
			for f50_local4 = self.requestedColumnCount, 1, -1 do
				local widget = self:getItemAtPosition( row, f50_local4, true )
				if widget and self:isWidgetSelectable( widget ) then
					self:setActiveItem( widget )
					self:playSound( "list_up" )
					return true
				end
			end
		end
		if self.loopEdges and (self.hCount == 1 or self.vCount == 1) then
			for row = self.requestedRowCount, LUI_GridLayout_GetElementEndRow( self.activeWidget ) + 1, -1 do
				for column = currentCol, 1, -1 do
					local widget = self:getItemAtPosition( row, column, true )
					if widget and self:isWidgetSelectable( widget ) then
						self:setActiveItem( widget )
						self:playSound( "list_up" )
						return true
					end
				end
			end
			if CoD.isPC and self.requestedRowCount == 1 and self.requestedColumnCount == 1 then
				return true
			end
		else
			return false
		end
	end
	return false
end

LUI.GridLayout.navigateItemDown = function ( self )
	self.lastDirection = "down"
	if self.activeWidget ~= nil then
		local currentRow = LUI_GridLayout_GetElementEndRow( self.activeWidget ) + 1
		local currentCol = self.activeWidget.gridInfoTable.gridColIndex
		for row = currentRow, self.requestedRowCount, 1 do
			for columnOffset = 0, self.activeWidget.gridInfoTable.gridColSpan - 1, 1 do
				local widget = self:getItemAtPosition( row, currentCol + columnOffset, true )
				if widget and self:isWidgetSelectable( widget ) then
					self:setActiveItem( widget )
					self:playSound( "list_down" )
					return true
				end
			end
		end
		for row = currentRow, self.requestedRowCount, 1 do
			for f51_local4 = self.requestedColumnCount, 1, -1 do
				local widget = self:getItemAtPosition( row, f51_local4, true )
				if widget and self:isWidgetSelectable( widget ) then
					self:setActiveItem( widget )
					self:playSound( "list_down" )
					return true
				end
			end
		end
		if self.loopEdges and (self.hCount == 1 or self.vCount == 1) then
			for row = 1, self.activeWidget.gridInfoTable.gridRowIndex - 1, 1 do
				for column = currentCol, 1, -1 do
					local widget = self:getItemAtPosition( row, column, true )
					if widget and self:isWidgetSelectable( widget ) then
						self:setActiveItem( widget )
						self:playSound( "list_down" )
						return true
					end
				end
			end
			if CoD.isPC and self.requestedRowCount == 1 and self.requestedColumnCount == 1 then
				return true
			end
		else
			return false
		end
	end
	return false
end

LUI.GridLayout.pageDown = function ( self )
	self.lastDirection = "down"
	self.currentStartRow = math.min( self.currentStartRow + self.vCount, self.requestedRowCount - self.vCount + 1 )
	local widget = self:getItemAtPosition( self.currentStartRow, self.currentStartColumn, true )
	if IsFreeCursorActive( self.controller ) then
		LUI.GridLayout.setActiveItem( self, widget )
	else
		self:setActiveItem( widget )
	end
	self:playSound( "list_down" )
	self:updateLayout()
end

LUI.GridLayout.pageUp = function ( self )
	self.lastDirection = "up"
	self.currentStartRow = math.max( self.currentStartRow - self.vCount, 1 )
	local widget = self:getItemAtPosition( self.currentStartRow, self.currentStartColumn, true )
	if IsFreeCursorActive( self.controller ) then
		LUI.GridLayout.setActiveItem( self, widget )
	else
		self:setActiveItem( widget )
	end
	self:playSound( "list_down" )
	self:updateLayout()
end

LUI.GridLayout.pageLeft = function ( self )
	self.lastDirection = "left"
	self.currentStartColumn = math.min( self.currentStartColumn + self.hCount, self.requestedColumnCount - self.vCount + 1 )
	local widget = self:getItemAtPosition( self.currentStartRow, self.currentStartColumn, true )
	if IsFreeCursorActive( self.controller ) then
		LUI.GridLayout.setActiveItem( self, widget )
	else
		self:setActiveItem( widget )
	end
	self:playSound( "list_down" )
	self:updateLayout()
end

LUI.GridLayout.pageRight = function ( self )
	self.lastDirection = "right"
	self.currentStartColumn = math.max( self.currentStartColumn - self.hCount, 1 )
	local widget = self:getItemAtPosition( self.currentStartRow, self.currentStartColumn, true )
	if IsFreeCursorActive( self.controller ) then
		LUI.GridLayout.setActiveItem( self, widget )
	else
		self:setActiveItem( widget )
	end
	self:playSound( "list_down" )
	self:updateLayout()
end

LUI.GridLayout.getRowHeight = function ( self, rowNum )
	if not self.layoutItems[rowNum] then
		return self.minimumRowHeight
	end
	local height = self.minimumRowHeight
	for column = 1, self.requestedColumnCount, 1 do
		local widget = self.layoutItems[rowNum][column]
		if widget ~= nil then
			local widgetHeight = LUI_GridLayout_GetElementRequestedHeight( widget, self.controller )
			if widget.gridInfoTable.gridRowSpan == 1 then
				height = math.max( height, widgetHeight )
			end
			if rowNum == widget.gridInfoTable.gridRowIndex + widget.gridInfoTable.gridRowSpan - 1 then
				for f56_local2 = widget.gridInfoTable.gridRowIndex, widget.gridInfoTable.gridRowIndex + widget.gridInfoTable.gridRowSpan - 2, 1 do
					widgetHeight = widgetHeight - self:getRowHeight( f56_local2 ) - self.spacing
				end
				height = math.max( height, widgetHeight )
			end
		end
	end
	local dataSource = self:getDataSource()
	if dataSource then
		height = height + (dataSource.getSpacerAfterRow and dataSource.getSpacerAfterRow( self, rowNum, height ) or 0)
	end
	return height
end

LUI.GridLayout.getColumnWidth = function ( self, colNum )
	local width = self.minimumColumnWidth
	for row = 1, self.requestedRowCount, 1 do
		local rowTable = self.layoutItems[row]
		if rowTable then
			local widget = rowTable[colNum]
			if widget ~= nil then
				local widgetWidth = LUI_GridLayout_GetElementRequestedWidth( widget, self.controller )
				if widget.gridInfoTable.gridColSpan == 1 then
					width = math.max( width, widgetWidth )
				end
				if colNum == widget.gridInfoTable.gridColIndex + widget.gridInfoTable.gridColSpan - 1 then
					for f57_local2 = widget.gridInfoTable.gridColIndex, widget.gridInfoTable.gridColIndex + widget.gridInfoTable.gridColSpan - 2, 1 do
						widgetWidth = widgetWidth - self:getColumnWidth( f57_local2 ) - self.spacing
					end
					width = math.max( width, widgetWidth )
				end
			end
		end
	end
	local dataSource = self:getDataSource()
	if dataSource then
		width = width + (dataSource.getSpacerAfterColumn and dataSource.getSpacerAfterColumn( self, colNum, width ) or 0)
	end
	return width
end

LUI.GridLayout.GetTableIndexForPosition = function ( self, row, column )
	local f58_local0 = self.rowColumnIndexMap[row]
	if f58_local0 then
		f58_local0 = self.rowColumnIndexMap[row][column]
		if f58_local0 then
			f58_local0 = self.rowColumnIndexMap[row][column].index
		end
	end
	return f58_local0
end

local LUI_GridWidget_IsFirstElement = function ( widget )
	return widget.gridInfoTable.zeroBasedIndex == 0
end

local LUI_GridWidget_IsLastElement = function ( widget )
	local dataSource = widget.gridInfoTable.parentGrid:getDataSource()
	return dataSource and widget.gridInfoTable.zeroBasedIndex + 1 == dataSource.getCount( widget.gridInfoTable.parentGrid )
end

local LUI_GridLayout_ChangeWidgetId = function ( itemStencil, widget, newId )
	itemStencil[widget.id] = nil
	widget.id = newId
	itemStencil[widget.id] = widget
end

local LUI_GridLayout_SetupWidgetInfoTable = function ( grid, widget, rowIndex, colIndex, rowSpan, colSpan )
	local zeroBasedIndex = (rowIndex - 1) * grid.requestedColumnCount + colIndex - 1
	widget.isFirstItem = LUI_GridWidget_IsFirstElement
	widget.isLastItem = LUI_GridWidget_IsLastElement
	widget.gridInfoTable = {}
	widget.gridInfoTable.gridRowIndex = rowIndex
	widget.gridInfoTable.gridColIndex = colIndex
	widget.gridInfoTable.gridRowSpan = rowSpan
	widget.gridInfoTable.gridColSpan = colSpan
	widget.gridInfoTable.parentGrid = grid
	widget.gridInfoTable.zeroBasedIndex = zeroBasedIndex
	LUI_GridLayout_ChangeWidgetId( grid.itemStencil, widget, widget.id .. zeroBasedIndex )
end

LUI.GridLayout.addItemToNextAvailable = function ( self, widget, updateLayout )
	local f63_local0 = 1
	local row = 1
	local setWidgetInfo = function ( widget, row, column )
		LUI_GridLayout_SetupWidgetInfoTable( self, widget, row, column, 1, 1 )
		self.layoutItems[row][column] = widget
		self.itemStencil:addElement( widget )
		if self.customWidgetSetup then
			self:customWidgetSetup( widget )
		end
		if updateLayout then
			self:updateLayout()
		end
	end
	
	while f63_local0 <= self.vCount or self.hCount == 1 do
		while row <= self.hCount or self.vCount == 1 do
			if not self.layoutItems[f63_local0] then
				self.layoutItems[f63_local0] = {}
			end
			if not self.layoutItems[f63_local0][row] then
				setWidgetInfo( widget, f63_local0, row )
				return true
			end
			row = row + 1
		end
		row = 1
		f63_local0 = f63_local0 + 1
	end
	while row <= self.hCount or self.vCount == 1 do
		if not self.layoutItems[f63_local0] then
			self.layoutItems[f63_local0] = {}
		end
		if not self.layoutItems[f63_local0][row] then
			setWidgetInfo( widget, f63_local0, row )
			return true
		end
		row = row + 1
	end
	row = 1
	f63_local0 = f63_local0 + 1
end

LUI.GridLayout.setItemAtPosition = function ( self, widget, row, column, updateLayout, layoutStartRow, layoutStartColumn, rowSpan, colSpan )
	if not rowSpan then
		rowSpan = 1
	end
	if not colSpan then
		colSpan = 1
	end
	if 1 <= row and row + rowSpan - 1 <= self.requestedRowCount and 1 <= column and column + colSpan - 1 <= self.requestedColumnCount then
		LUI_GridLayout_SetupWidgetInfoTable( self, widget, row, column, rowSpan, colSpan )
		self.itemStencil:addElement( widget )
		if self.customWidgetSetup then
			self:customWidgetSetup( widget )
		end
		for i = row, row + rowSpan - 1, 1 do
			for j = column, column + colSpan - 1, 1 do
				if not self.layoutItems[i] then
					self.layoutItems[i] = {}
				end
				self.layoutItems[i][j] = widget
			end
		end
		self:positionElementWithStart( widget, layoutStartRow, layoutStartColumn )
		if updateLayout then
			self:updateLayout()
		end
		return true
	else
		return false
	end
end

LUI.GridLayout.removeItem = function ( self, widget, updateLayout )
	local foundWidget = false
	for row, rowTable in pairs( self.layoutItems ) do
		for column, table_widget in pairs( rowTable ) do
			if widget == table_widget then
				foundWidget = true
				rowTable[column] = nil
			end
		end
	end
	widget:close()
	if foundWidget and updateLayout then
		self:updateLayout()
	end
end

LUI.GridLayout.getLastSelectableItem = function ( self, selectIfFound )
	for f67_local0 = self.requestedRowCount, 1, -1 do
		for f67_local3 = self.requestedColumnCount, 1, -1 do
			local widget = self:getItemAtPosition( f67_local0, f67_local3, true )
			if widget and self:isWidgetSelectable( widget ) then
				if selectIfFound then
					self:setActiveItem( widget )
				end
				return widget
			end
		end
	end
	return nil
end

LUI.GridLayout.getFirstSelectableItem = function ( self, selectIfFound )
	for row = 1, self.requestedRowCount, 1 do
		for column = 1, self.requestedColumnCount, 1 do
			local widget = self:getItemAtPosition( row, column, true )
			if widget and self:isWidgetSelectable( widget ) then
				if selectIfFound then
					self:setActiveItem( widget )
				end
				return widget
			end
		end
	end
	return nil
end

LUI.GridLayout.getItemAt = function ( self, itemIndex )
	local encounteredWidgets = 0
	for row = 1, self.requestedRowCount, 1 do
		for column = 1, self.requestedColumnCount, 1 do
			local destroyWidget = false
			local widget = self:getItemAtPosition( row, column, false )
			if not widget then
				destroyWidget = true
				widget = self:getItemAtPosition( row, column, true )
			end
			if widget then
				encounteredWidgets = encounteredWidgets + 1
				if encounteredWidgets == itemIndex then
					return widget
				elseif destroyWidget then
					self:removeItem( widget, false )
				end
			end
		end
	end
	return nil
end

LUI.GridLayout.clearLayout = function ( self, updateLayout )
	for row, rowTable in pairs( self.layoutItems ) do
		for column, widget in pairs( rowTable ) do
			if widget.gridInfoTable.gridRowIndex == row and widget.gridInfoTable.gridColIndex == column then
				rowTable[column]:close()
			end
			rowTable[column] = nil
		end
	end
	self.layoutItems = {}
	self:resetCurrentRowAndColumn()
	self:setActiveItem( nil, 0 )
	if updateLayout then
		self:updateLayout()
	end
end

LUI.GridLayout.positionElementWithStart = function ( self, widget, startRow, startColumn )
	local elementRow = widget.gridInfoTable.gridRowIndex
	local elementColumn = widget.gridInfoTable.gridColIndex
	local colStep = 1
	if elementColumn < startColumn then
		colStep = -1
	end
	local xPos = self.firstElementXOffset
	for column = startColumn, elementColumn, colStep do
		if colStep == -1 or column ~= elementColumn then
			xPos = xPos + self:getColumnWidth( column ) * colStep
		end
	end
	local rowStep = 1
	if elementRow < startRow then
		rowStep = -1
	end
	local yPos = self.firstElementYOffset
	for row = startRow, elementRow, rowStep do
		if rowStep == -1 or row ~= elementRow then
			yPos = yPos + self:getRowHeight( row ) * rowStep
		end
	end
	local widgetWidth = LUI_GridLayout_GetElementRequestedWidth( widget, self.controller )
	local widgetHeight = LUI_GridLayout_GetElementRequestedHeight( widget, self.controller )
	widget:beginAnimation( "position" )
	widget:setLeftRight( true, false, xPos, xPos + widgetWidth )
	widget:setTopBottom( true, false, yPos, yPos + widgetHeight )
end

LUI.GridLayout.updateLayout = function ( self, time )
	if self.originalListWidth == nil then
		local anchorLeft, anchorRight, listLeft, listRight = self:getLocalLeftRight()
		if anchorLeft + anchorRight == 0 then
			self.originalListWidth = listRight - listLeft
		elseif anchorLeft == 0 and anchorRight == 1 then
			local parent = self:getParent()
			if parent then
				local _, _, parentLeft, parentRight = parent:getLocalLeftRight()
				self.originalListWidth = parentRight - parentLeft - listLeft + listRight
			end
		end
	end
	local f72_local0 = time
	local animTime = 0
	local anchorLeft = f72_local0 or animTime
	local anchorRight = {}
	local listLeft = {}
	local dataSource = self:getDataSource()
	if not dataSource then
		self:clearLayout( false )
		return 
	elseif dataSource.prepare and not self.prepared then
		self:updateDataSource( true, true, false )
	end
	local f72_local1 = self.currentStartRow
	local firstVisibleRow = self.currentStartColumn
	if self.firstElementYOffset > 0 then
		local curY = self.firstElementYOffset - self.spacing
		for row = self.currentStartRow - 1, 1, -1 do
			if not anchorRight[row] then
				for column = 1, self.hCount, 1 do
					local createColumn = self.currentStartColumn + column - 1
					if not self:getItemAtPosition( row, createColumn, false ) then
						self:createWidgetForPosition( row, createColumn, self.previousStartRow, self.previousStartColumn )
					end
				end
				anchorRight[row] = self:getRowHeight( row )
			end
			if not anchorRight[row] then
				
			end
			curY = curY - anchorRight[row]
			f72_local1 = row
			if curY <= 0 then
				
			end
			curY = curY - self.spacing
		end
	end
	if self.firstElementXOffset > 0 then
		local curX = self.firstElementXOffset - self.spacing
		for column = self.currentStartColumn - 1, 1, -1 do
			if not listLeft[column] then
				for row = 1, self.vCount, 1 do
					local createRow = self.currentStartRow + row - 1
					if not self:getItemAtPosition( createRow, column, false ) then
						self:createWidgetForPosition( createRow, column, self.previousStartRow, self.previousStartColumn )
					end
				end
				listLeft[column] = self:getColumnWidth( column )
			end
			if not listLeft[column] then
				
			end
			curX = curX - listLeft[column]
			firstVisibleRow = column
			if curX <= 0 then
				
			end
			curX = curX - self.spacing
		end
	end
	for row = f72_local1, math.min( self.requestedRowCount, f72_local1 + self.vCount - 1 ), 1 do
		if not self.layoutItems[row] then
			self.layoutItems[row] = {}
		end
		local rowItems = self.layoutItems[row]
		for column = firstVisibleRow, math.min( self.requestedColumnCount, firstVisibleRow + self.hCount - 1 ), 1 do
			if self.rowColumnIndexMap[row] and self.rowColumnIndexMap[row][column] then
				if not rowItems[column] then
					self:createWidgetForPosition( row, column, self.previousStartRow, self.previousStartColumn )
				end
				local dataItemModel = self:getModelForPosition( row, column )
				if dataItemModel ~= rowItems[column]:getModel() then
					rowItems[column]:setModel( dataItemModel )
					if rowItems[column] == self.activeWidget then
						self:setModel( dataItemModel )
					end
				end
				self:updateCustomWidgetProperties( row, column, rowItems[column] )
			end
		end
	end
	for row, rowTable in pairs( self.layoutItems ) do
		anchorRight[row] = self:getRowHeight( row )
		for column, _ in pairs( rowTable ) do
			if not listLeft[column] then
				listLeft[column] = self:getColumnWidth( column )
			end
		end
	end
	local lastFirstVisibleRow = self.lastFirstVisibleRow or self.currentStartRow
	local lastFirstVisibleColumn = self.lastFirstVisibleColumn or self.currentStartColumn
	parentRight = function ( widget )
		local f73_local0 = self.firstElementXOffset
		local x = self.firstElementYOffset
		if self.currentStartColumn < widget.gridInfoTable.gridColIndex then
			for f73_local1 = self.currentStartColumn, widget.gridInfoTable.gridColIndex - 1, 1 do
				f73_local0 = f73_local0 + (listLeft[f73_local1] or 0) + self.spacing
			end
		elseif widget.gridInfoTable.gridColIndex < self.currentStartColumn then
			for f73_local1 = widget.gridInfoTable.gridColIndex, self.currentStartColumn - 1, 1 do
				f73_local0 = f73_local0 - (listLeft[f73_local1] or 0) - self.spacing
			end
		end
		if self.currentStartRow < widget.gridInfoTable.gridRowIndex then
			for f73_local1 = self.currentStartRow, widget.gridInfoTable.gridRowIndex - 1, 1 do
				x = x + (anchorRight[f73_local1] or 0) + self.spacing
			end
		elseif widget.gridInfoTable.gridRowIndex < self.currentStartRow then
			for f73_local1 = widget.gridInfoTable.gridRowIndex, self.currentStartRow - 1, 1 do
				x = x - (anchorRight[f73_local1] or 0) - self.spacing
			end
		end
		return f73_local0, x
	end
	
	local isWidgetVisibleInRange = function ( widget, startRow, startColumn, rowSpan, columnSpan )
		if not startRow or not startColumn then
			return false
		elseif not anchorRight[widget.gridInfoTable.gridRowIndex] or not listLeft[widget.gridInfoTable.gridColIndex] then
			return false
		elseif startRow <= LUI_GridLayout_GetElementEndRow( widget ) and widget.gridInfoTable.gridRowIndex < startRow + math.min( self.vCount, self.requestedRowCount ) and startColumn <= LUI_GridLayout_GetElementEndColumn( widget ) and widget.gridInfoTable.gridColIndex < startColumn + math.min( self.hCount, self.requestedColumnCount ) then
			return true
		elseif startRow + math.min( self.vCount, self.requestedRowCount ) <= widget.gridInfoTable.gridRowIndex or startColumn + math.min( self.hCount, self.requestedColumnCount ) <= widget.gridInfoTable.gridColIndex then
			return false
		elseif self.firstElementXOffset > 0 or self.firstElementYOffset > 0 then
			local newX, newY = parentRight( widget )
			if newX + LUI_GridLayout_GetElementRequestedWidth( widget, self.controller ) > 0 and newY + LUI_GridLayout_GetElementRequestedHeight( widget, self.controller ) > 0 then
				return true
			end
		end
		return false
	end
	
	local elementsToRemove = {}
	local moveToPosition = function ( widget, x, y, width, height, alpha, destroyWhenFinished )
		widget:beginAnimation( "keyframe", anchorLeft )
		if alpha ~= nil then
			widget:setAlpha( alpha )
		end
		widget:setLeftRight( true, false, x, x + width )
		widget:setTopBottom( true, false, y, y + height )
		if destroyWhenFinished then
			widget:registerEventHandler( "transition_complete_keyframe", function ( widget, event )
				if not event.interrupted then
					self:removeItem( widget )
				end
			end )
		else
			widget:registerEventHandler( "transition_complete_keyframe", nil )
		end
	end
	
	for row, rowTable in LUI.IterateTableBySortedKeys( self.layoutItems ) do
		for column, widget in LUI.IterateTableBySortedKeys( rowTable ) do
			if widget.gridInfoTable.gridRowIndex == row and widget.gridInfoTable.gridColIndex == column then
				local widgetWidth = LUI_GridLayout_GetElementRequestedWidth( widget, self.controller )
				local widgetHeight = LUI_GridLayout_GetElementRequestedHeight( widget, self.controller )
				local movedOffAlpha = 0
				if self.usingStencil then
					movedOffAlpha = 1
				end
				if isWidgetVisibleInRange( widget, f72_local1, firstVisibleRow ) then
					local newX, newY = parentRight( widget )
					if Engine.IsCurrentLanguageReversed() and self.hCount == 1 and self.originalListWidth ~= nil then
						moveToPosition( widget, newX + self.originalListWidth - widgetWidth, newY, widgetWidth, widgetHeight, 1 )
					else
						moveToPosition( widget, newX, newY, widgetWidth, widgetHeight, 1 )
						goto basicblock_84:
					end
				end
				if isWidgetVisibleInRange( widget, lastFirstVisibleRow, lastFirstVisibleColumn ) then
					if anchorLeft == 0 then
						table.insert( elementsToRemove, widget )
					end
					local newX, newY = parentRight( widget )
					if Engine.IsCurrentLanguageReversed() and self.hCount == 1 and self.originalListWidth ~= nil then
						moveToPosition( widget, newX + self.originalListWidth - widgetWidth, newY, widgetWidth, widgetHeight, movedOffAlpha, true )
					else
						moveToPosition( widget, newX, newY, widgetWidth, widgetHeight, movedOffAlpha, true )
						goto basicblock_84:
					end
				end
				table.insert( elementsToRemove, widget )
			end
		end
	end
	for _, rowTable in ipairs( elementsToRemove ) do
		self:removeItem( rowTable )
	end
	f72_local3 = 0
	local width = 0
	for column = 1, math.min( self.hCount, self.requestedColumnCount ), 1 do
		if listLeft[self.currentStartColumn + column - 1] then
			f72_local3 = f72_local3 + listLeft[self.currentStartColumn + column - 1] + self.spacing
		end
	end
	if f72_local3 ~= 0 then
		f72_local3 = f72_local3 - self.spacing
	end
	for row = 1, math.min( self.vCount, self.requestedRowCount ), 1 do
		if anchorRight[self.currentStartRow + row - 1] then
			width = width + anchorRight[self.currentStartRow + row - 1] + self.spacing
		end
	end
	if width ~= 0 then
		width = width - self.spacing
	end
	if not self.scrollbarDragging then
		self:setWidth( f72_local3 )
		self:setHeight( width )
	end
	self.width = f72_local3
	self.height = width
	self.lastFirstVisibleRow = f72_local1
	self.lastFirstVisibleColumn = firstVisibleRow
	self:updateScrollbars()
end

LUI.GridLayout.createWidgetFromDataSource = function ( self, controller, dataItemModel, overrideWidgetType )
	local widget = nil
	if type( overrideWidgetType ) == "string" then
		overrideWidgetType = LUI.getTableFromPath( overrideWidgetType )
	end
	if overrideWidgetType and overrideWidgetType.new then
		widget = overrideWidgetType.new( self.menu, controller )
	else
		if not self.widgetType then
			return nil
		elseif type( self.widgetType ) == "string" then
			local widgetTypeModel = Engine.GetModel( dataItemModel, self.widgetTypeDataSource )
			if widgetTypeModel ~= nil then
				local widgetTable = LUI.getTableFromPath( Engine.GetModelValue( widgetTypeModel ) )
				if widgetTable and widgetTable.new then
					widget = widgetTable.new( self.menu, controller )
				end
			end
		elseif type( self.widgetType ) == "table" then
			widget = self.widgetType.new( self.menu, controller )
		end
		if widget then
			widget:mergeStateConditions( self.elementStateConditions )
			widget:setAlpha( 0 )
		end
	end
	if widget ~= nil then
		self.itemStencil[widget.id] = widget
		LUI.OverrideFunction_CallOriginalFirst( widget, "close", function ()
			self.itemStencil[widget.id] = nil
			local dataSource = self:getDataSource()
			if dataSource and dataSource.destroyItem and widget.gridInfoTable then
				dataSource.destroyItem( self.controller, self, widget.gridInfoTable.zeroBasedIndex )
			end
		end )
	end
	return widget
end

LUI.GridLayout.getModelForIndex = function ( self, index )
	local dataSource = self:getDataSource()
	if not dataSource or not dataSource.getCount then
		return nil
	else
		local itemCount = dataSource.getCount( self )
		if index and index <= itemCount then
			return dataSource.getItem( self.controller, self, index )
		else
			return nil
		end
	end
end

LUI.GridLayout.getModelForPosition = function ( self, row, column )
	local index = self:GetTableIndexForPosition( row, column )
	return self:getModelForIndex( index )
end

LUI.GridLayout.getPropertiesForIndex = function ( self, index )
	local dataSource = self:getDataSource()
	if not dataSource or not dataSource.getCount or not dataSource.getCustomPropertiesForItem then
		return nil
	else
		local itemCount = dataSource.getCount( self )
		if index <= itemCount then
			return dataSource.getCustomPropertiesForItem( self, index )
		else
			return nil
		end
	end
end

LUI.GridLayout.getPropertiesForPosition = function ( self, row, column )
	local index = self:GetTableIndexForPosition( row, column )
	return self:getPropertiesForIndex( index )
end

LUI.GridLayout.updateCustomWidgetProperties = function ( self, row, column, widget )
	if not widget then
		return 
	elseif widget.gridInfoTable.customProperties then
		for _, propertyName in ipairs( widget.gridInfoTable.customProperties ) do
			widget[propertyName] = nil
		end
	end
	local propertyTable = self:getPropertiesForPosition( row, column )
	if propertyTable then
		widget.gridInfoTable.customProperties = {}
		for k, v in pairs( propertyTable ) do
			if k == "id" then
				LUI_GridLayout_ChangeWidgetId( self.itemStencil, widget, v )
			else
				widget[k] = v
			end
		end
	end
end

LUI.GridLayout.createWidgetForPosition = function ( self, row, column, layoutStartRow, layoutStartColumn )
	local dataSource = self:getDataSource()
	if not dataSource or not dataSource.getCount then
		return nil
	end
	local itemCount = dataSource.getCount( self )
	local index = self:GetTableIndexForPosition( row, column )
	if index and index <= itemCount then
		local dataItemModel = self:getModelForIndex( index )
		local overrideWidgetType = nil
		local propertyTable = self:getPropertiesForIndex( index )
		if propertyTable and propertyTable.customWidgetOverride then
			overrideWidgetType = propertyTable.customWidgetOverride
		elseif dataSource.getWidgetTypeForItem then
			overrideWidgetType = dataSource.getWidgetTypeForItem( self, dataItemModel, row, column )
		end
		local newWidget = self:createWidgetFromDataSource( self.controller, dataItemModel, overrideWidgetType )
		if newWidget ~= nil then
			if not self.rowColumnIndexMap[row] then
				newWidget:close()
				return 
			elseif dataItemModel then
				newWidget:setModel( dataItemModel )
			end
			if propertyTable then
				local f84_local0 = propertyTable.rowSpan
				if not f84_local0 then
				
				else
					if propertyTable then
						local f84_local1 = propertyTable.columnSpan
						if not f84_local1 then
						
						else
							if not self:setItemAtPosition( newWidget, self.rowColumnIndexMap[row][column].startRow, self.rowColumnIndexMap[row][column].startColumn, false, layoutStartRow, layoutStartColumn, f84_local0, f84_local1 ) then
								newWidget:close()
								return nil
							end
							self:updateCustomWidgetProperties( row, column, newWidget )
							if dataItemModel then
								local customIdModel = Engine.GetModel( dataItemModel, "customId" )
								if customIdModel then
									LUI_GridLayout_ChangeWidgetId( self.itemStencil, newWidget, Engine.GetModelValue( customIdModel ) )
								end
							end
							if self.menuLoaded then
								newWidget:processEvent( {
									name = "menu_loaded",
									menu = self.menu,
									controller = self.controller
								} )
							end
							newWidget:processEvent( {
								name = "update_state",
								menu = self.menu
							} )
							if self.menuOpened then
								newWidget:processEvent( {
									name = "menu_opened",
									menu = self.menu,
									controller = self.controller
								} )
							end
							return newWidget
						end
					end
					local colSpan = 1
				end
			end
			local rowSpan = 1
		end
	end
	return nil
end

LUI.GridLayout.updateDataSource = function ( self, ignoreFocusRestore, ignoreLayoutClear, ignorePrepare )
	self.itemCount = 0
	self.rowColumnIndexMap = {}
	if not self.menuOpened then
		return 
	end
	local dataSource = self:getDataSource()
	if not dataSource or not dataSource.getCount or not dataSource.getItem then
		return 
	elseif not self.widgetType then
		return 
	elseif dataSource.prepare and (not self.prepared or not ignorePrepare) then
		self.prepared = false
		dataSource.prepare( self.controller, self, self.filter )
		self.prepared = true
	end
	if self.hCount > 1 and self.vCount > 1 then
		local itemCount = dataSource.getCount( self )
		self.itemCount = itemCount
		self.requestedRowCount = 1
		self.requestedColumnCount = 0
	elseif self.vCount > 1 then
		local itemCount = dataSource.getCount( self )
		self.itemCount = itemCount
		self.requestedRowCount = 0
		self.requestedColumnCount = 1
	elseif self.hCount >= 1 then
		local itemCount = dataSource.getCount( self )
		self.itemCount = itemCount
		self.requestedRowCount = 1
		self.requestedColumnCount = 0
	else
		return 
	end
	if not ignoreLayoutClear then
		self:clearLayout( false )
	end
	local selectionWidget, selectRow, selectColumn = nil
	local currentRow = 1
	local currentCol = 1
	local getWidgetEntry = function ( index, startRow, startColumn )
		return {
			index = index,
			startRow = startRow,
			startColumn = startColumn
		}
	end
	
	for index = 1, self.itemCount, 1 do
		local propertyTable = self:getPropertiesForIndex( index )
		local rowSpan = 1
		local colSpan = 1
		if propertyTable then
			if not selectRow and propertyTable.selectIndex then
				propertyTable.selectIndex = false
				selectRow = currentRow
				selectColumn = currentCol
			end
			rowSpan = propertyTable.rowSpan or 1
			colSpan = propertyTable.columnSpan or 1
		end
		if self.hCount > 1 and self.vCount > 1 then
			if self.hCount < currentCol + colSpan - 1 then
				currentRow = currentRow + 1
				if self.rowColumnIndexMap[currentRow] then
					local f85_local2 = #self.rowColumnIndexMap[currentRow] + 1
				end
				currentCol = f85_local2 or 1
			end
			local startRow = currentRow
			local startCol = currentCol
			for i = 0, rowSpan - 1, 1 do
				if not self.rowColumnIndexMap[currentRow + i] then
					self.rowColumnIndexMap[currentRow + i] = {}
				end
				for j = 0, colSpan - 1, 1 do
					self.rowColumnIndexMap[currentRow + i][currentCol + j] = getWidgetEntry( index, startRow, startCol )
				end
			end
			currentCol = currentCol + colSpan
			self.requestedColumnCount = math.max( self.requestedColumnCount, currentCol - 1 )
			self.requestedRowCount = math.max( self.requestedRowCount, currentRow + rowSpan - 1 )
		end
		if self.vCount > 1 then
			local startRow = currentRow
			local startCol = currentCol
			for i = 1, rowSpan, 1 do
				local f85_local7 = i
				if not self.rowColumnIndexMap[currentRow] then
					self.rowColumnIndexMap[currentRow] = {}
				end
				self.rowColumnIndexMap[currentRow][currentCol] = getWidgetEntry( index, startRow, startCol )
				self.requestedRowCount = currentRow
				currentRow = currentRow + 1
			end
		end
		if self.hCount >= 1 then
			if not self.rowColumnIndexMap[currentRow] then
				self.rowColumnIndexMap[currentRow] = {}
			end
			local startRow = currentRow
			local startCol = currentCol
			for i = 1, colSpan, 1 do
				local f85_local7 = i
				self.rowColumnIndexMap[currentRow][currentCol] = getWidgetEntry( index, startRow, startCol )
				self.requestedColumnCount = currentCol
				currentCol = currentCol + 1
			end
		end
	end
	self:processEvent( {
		name = "update_state",
		menu = self.menu
	} )
	if selectRow then
		selectionWidget = self:getItemAtPosition( selectRow, selectColumn, true )
	end
	if not selectionWidget and self.savedActiveIndex and not ignoreFocusRestore then
		local savedRow, f85_local0 = self:getRowAndColumnForIndex( self.savedActiveIndex )
		selectionWidget = self:getItemAtPosition( savedRow, f85_local0, true )
	end
	if not selectionWidget and (self.hasListFocus or self.setActiveOnUpdate) and not ignoreFocusRestore then
		selectionWidget = self:getFirstSelectableItem()
	end
	if selectionWidget then
		local scrollTime = nil
		if selectRow ~= nil then
			scrollTime = 0
		end
		self:setActiveItem( selectionWidget, scrollTime )
	else
		self:updateScrollbars()
		self:updateCounters()
		if self.itemCount == 0 then
			self:setActiveItem( nil, 0 )
		end
	end
	self:dispatchEventToParent( {
		name = "grid_updated",
		grid = self
	} )
	return true
end

LUI.GridLayout.close = function ( self )
	self:unsubscribeFromAllModels()
	self:clearLayout( false )
	local dataSource = self:getDataSource()
	LUI.GridLayout.super.close( self )
	if dataSource and dataSource.cleanup then
		dataSource.cleanup( self, self.controller )
	end
end

LUI.GridLayout.updateState = function ( self, event )
	LUI.GridLayout.super.updateState( self, event )
	self:updateLayout( 0 )
end

LUI.GridLayout:registerEventHandler( "update_state", LUI.GridLayout.updateState )
LUI.GridLayout.menuLoaded = function ( self, event )
	self.menuLoaded = true
	self:dispatchEventToChildren( event )
end

LUI.GridLayout:registerEventHandler( "menu_loaded", LUI.GridLayout.menuLoaded )
LUI.GridLayout.menuOpened = function ( self, event )
	if not self.menuOpened then
		self.menuOpened = true
		self:updateDataSource()
	end
	self:dispatchEventToChildren( event )
end

LUI.GridLayout:registerEventHandler( "menu_opened", LUI.GridLayout.menuOpened )
LUI.GridLayout.setActiveOnUpdate = true
LUI.GridLayout.id = "LUIGridLayout"
