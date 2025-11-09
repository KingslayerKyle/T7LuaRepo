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
	self.itemStencil.id = "GridLayoutStencil"
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
	self.delayNavigation = false
	return self
end

LUI.GridLayout.setDataSource = function ( self, name )
	self.dataSourceName = name
	local dataSource = self:getDataSource()
	if dataSource and dataSource.prepare then
		self:updateDataSource()
	else
		self:clearLayout( true )
	end
end

LUI.GridLayout.setHorizontalCount = function ( self, count )
	self.hCount = count
	self:updateDataSource( nil, nil, true )
end

LUI.GridLayout.setVerticalCount = function ( self, count )
	self.vCount = count
	self:updateDataSource( nil, nil, true )
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

LUI.GridLayout.updateCurrentPosition = function ( self, row, column )
	self.previousStartColumn = self.currentStartColumn
	self.previousStartRow = self.currentStartRow
	self.currentStartColumn = column
	self.currentStartRow = row
end

LUI.GridLayout.setWidgetType = function ( self, widgetType )
	self.widgetType = widgetType
	self:clearLayout( true )
end

LUI.GridLayout.mergeStateConditions = function ( self, conditionsTable )
	self.elementStateConditions = {}
	LUI.GridLayout.super.mergeStateConditions( self, conditionsTable, self.elementStateConditions )
	self:clearLayout( true )
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
		self.verticalScrollbar = verticalScrollbarWidget.new( self.menu, self.controller )
		local l, t, r, b = self.verticalScrollbar:getLocalRect()
		self.verticalScrollbar:setTopBottom( true, true, 0, 0 )
		self.verticalScrollbar:setLeftRight( false, true, 5, 5 + r - l )
		self:addElement( self.verticalScrollbar )
	end
	self:updateScrollbars()
end

LUI.GridLayout.setVerticalCounter = function ( self, verticalCounterWidget )
	
end

LUI.GridLayout.setVerticalPips = function ( self, verticalPipsWidget )
	
end

LUI.GridLayout.setHorizontalScrollbar = function ( self, horizontalScrollbarWidget )
	if horizontalScrollbarWidget and horizontalScrollbarWidget.new then
		if self.horizontalScrollbar then
			self.horizontalScrollbar:close()
		end
		self.horizontalScrollbar = horizontalScrollbarWidget.new( self.menu, self.controller )
		local l, t, r, b = self.horizontalScrollbar:getLocalRect()
		self.horizontalScrollbar:setTopBottom( true, true, 0, 0 )
		self.horizontalScrollbar:setLeftRight( false, true, 5, 5 + r - l )
		self:addElement( self.horizontalScrollbar )
	end
	self:updateScrollbars()
end

LUI.GridLayout.setHorizontalCounter = function ( self, horizontalCounterWidget )
	
end

LUI.GridLayout.setHorizontalPips = function ( self, horizontalPipsWidget )
	
end

LUI.GridLayout.updateScrollbars = function ( self )
	local listWidth, listHeight = self:getLocalSize()
	if self.verticalScrollbar then
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
	local f23_local0 = 0
	local xPos = 0
	if widget.gridInfoTable.gridRowIndex < self.currentStartRow then
		f23_local0 = widget.gridInfoTable.gridRowIndex - self.currentStartRow
	elseif self.currentStartRow + self.vCount <= LUI_GridLayout_GetElementEndRow( widget ) then
		f23_local0 = LUI_GridLayout_GetElementEndRow( widget ) - self.currentStartRow + self.vCount + 1
	end
	if widget.gridInfoTable.gridColIndex < self.currentStartColumn then
		xPos = widget.gridInfoTable.gridColIndex - self.currentStartColumn
	elseif self.currentStartColumn + self.hCount <= LUI_GridLayout_GetElementEndColumn( widget ) then
		xPos = LUI_GridLayout_GetElementEndColumn( widget ) - self.currentStartColumn + self.hCount + 1
	end
	return f23_local0, xPos
end

LUI.GridLayout.setActiveItem = function ( self, widget, overrideScrollTime )
	if self.activeWidget then
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
				local f24_local0 = overrideScrollTime
				local f24_local1
				if math.abs( widgetVisX ) <= 1 and math.abs( widgetVisY ) <= 1 then
					f24_local1 = self.scrollAnimationTime
					if not f24_local1 then
					
					else
						self:updateLayout( f24_local1 )
					end
				end
				local scrollTime = 0
				f24_local1 = f24_local0 or scrollTime
			end
		end
		self:setModel( self.activeWidget:getModel() )
	end
	self:dispatchEventToParent( {
		name = "grid_item_changed",
		grid = self
	} )
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
				local f25_local7 = widget
				local propertyTable = self:getPropertiesForPosition( row, column )
				local f25_local4 = f25_local7 or propertyTable
				if f25_local4 then
					for propertyName, propertyValue in pairs( propertiesToFind ) do
						if f25_local4[propertyName] ~= propertyValue then
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

LUI.GridLayout.setActiveIndex = function ( self, row, column, overrideScrollTime )
	if not row or not column then
		return false
	elseif row < 1 or self.requestedRowCount < row or column < 1 or self.requestedColumnCount < column then
		return false
	else
		local widget = self:getItemAtPosition( row, column, true )
		if widget then
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
	if self.delayNavigation then
		return 
	end
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
				for f29_local4 = self.requestedRowCount, 1, -1 do
					local widget = self:getItemAtPosition( f29_local4, column, true )
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
			else
				return false
			end
		end
	end
	return false
end

LUI.GridLayout.navigateItemRight = function ( self )
	if self.delayNavigation then
		return 
	end
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
				for f30_local4 = self.requestedRowCount, 1, -1 do
					local widget = self:getItemAtPosition( f30_local4, column, true )
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
			else
				return false
			end
		end
	end
	return false
end

LUI.GridLayout.navigateItemUp = function ( self )
	if self.delayNavigation then
		return 
	end
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
			for f31_local4 = self.requestedColumnCount, 1, -1 do
				local widget = self:getItemAtPosition( row, f31_local4, true )
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
		else
			return false
		end
	end
	return false
end

LUI.GridLayout.navigateItemDown = function ( self )
	if self.delayNavigation then
		return 
	end
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
			for f32_local4 = self.requestedColumnCount, 1, -1 do
				local widget = self:getItemAtPosition( row, f32_local4, true )
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
		else
			return false
		end
	end
	return false
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
				for f33_local2 = widget.gridInfoTable.gridRowIndex, widget.gridInfoTable.gridRowIndex + widget.gridInfoTable.gridRowSpan - 2, 1 do
					widgetHeight = widgetHeight - self:getRowHeight( f33_local2 ) - self.spacing
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
					for f34_local2 = widget.gridInfoTable.gridColIndex, widget.gridInfoTable.gridColIndex + widget.gridInfoTable.gridColSpan - 2, 1 do
						widgetWidth = widgetWidth - self:getColumnWidth( f34_local2 ) - self.spacing
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
	return (row - 1) * self.requestedColumnCount + column
end

local LUI_GridWidget_IsFirstElement = function ( widget )
	return widget.gridInfoTable.zeroBasedIndex == 0
end

local LUI_GridWidget_IsLastElement = function ( widget )
	local dataSource = widget.gridInfoTable.parentGrid:getDataSource()
	return dataSource and widget.gridInfoTable.zeroBasedIndex + 1 == dataSource.getCount( widget.gridInfoTable.parentGrid )
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
	widget.id = widget.id .. zeroBasedIndex
end

LUI.GridLayout.addItemToNextAvailable = function ( self, widget, updateLayout )
	local f39_local0 = 1
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
	
	while f39_local0 <= self.vCount or self.hCount == 1 do
		while row <= self.hCount or self.vCount == 1 do
			if not self.layoutItems[f39_local0] then
				self.layoutItems[f39_local0] = {}
			end
			if not self.layoutItems[f39_local0][row] then
				setWidgetInfo( widget, f39_local0, row )
				return true
			end
			row = row + 1
		end
		row = 1
		f39_local0 = f39_local0 + 1
	end
	while row <= self.hCount or self.vCount == 1 do
		if not self.layoutItems[f39_local0] then
			self.layoutItems[f39_local0] = {}
		end
		if not self.layoutItems[f39_local0][row] then
			setWidgetInfo( widget, f39_local0, row )
			return true
		end
		row = row + 1
	end
	row = 1
	f39_local0 = f39_local0 + 1
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
		else
			
		end
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
	for f43_local0 = self.requestedRowCount, 1, -1 do
		for f43_local3 = self.requestedColumnCount, 1, -1 do
			local widget = self:getItemAtPosition( f43_local0, f43_local3, true )
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

LUI.GridLayout.clearLayout = function ( self, closeWidgets, updateLayout )
	for row, rowTable in pairs( self.layoutItems ) do
		for column, widget in pairs( rowTable ) do
			if closeWidgets and widget.gridInfoTable.gridRowIndex == row and widget.gridInfoTable.gridColIndex == column then
				rowTable[column]:close()
			end
			rowTable[column] = nil
		end
	end
	self.layoutItems = {}
	self:resetCurrentRowAndColumn()
	if closeWidgets then
		self.activeWidget = nil
	end
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
	local f48_local0 = time
	local animTime = 0
	local f48_local1 = f48_local0 or animTime
	local f48_local2 = {}
	local rowHeights = {}
	for f48_local3 = self.currentStartRow, math.min( self.requestedRowCount, self.currentStartRow + self.vCount - 1 ), 1 do
		if not self.layoutItems[f48_local3] then
			self.layoutItems[f48_local3] = {}
		end
		local rowItems = self.layoutItems[f48_local3]
		if #rowItems ~= self.requestedColumnCount then
			for f48_local6 = self.currentStartColumn, math.min( self.requestedColumnCount, self.currentStartColumn + self.hCount - 1 ), 1 do
				if not rowItems[f48_local6] then
					self:createWidgetForPosition( f48_local3, f48_local6, self.previousStartRow, self.previousStartColumn )
				end
				local dataItemModel = self:getModelForPosition( f48_local3, f48_local6 )
				if dataItemModel ~= rowItems[f48_local6]:getModel() then
					rowItems[f48_local6]:setModel( dataItemModel )
				end
			end
		end
	end
	for row, rowItems in pairs( self.layoutItems ) do
		f48_local2[row] = self:getRowHeight( row )
		for column, _ in pairs( rowItems ) do
			if not rowHeights[column] then
				rowHeights[column] = self:getColumnWidth( column )
			end
		end
	end
	local lastFirstVisibleRow = self.lastFirstVisibleRow or self.currentStartRow
	local lastFirstVisibleColumn = self.lastFirstVisibleColumn or self.currentStartColumn
	f48_local5 = self.currentStartRow
	local firstVisibleRow = self.currentStartColumn
	if 0 < self.firstElementYOffset then
		rowItems = self.firstElementYOffset - self.spacing
		for row = self.currentStartRow - 1, 1, -1 do
			if not f48_local2[row] then
				for column = 1, self.hCount, 1 do
					local createColumn = self.currentStartColumn + column - 1
					if not self:getItemAtPosition( row, createColumn, false ) then
						self:createWidgetForPosition( row, createColumn, self.previousStartRow, self.previousStartColumn )
					end
				end
				f48_local2[row] = self:getRowHeight( row )
			end
			if not f48_local2[row] then
				
			end
			rowItems = rowItems - f48_local2[row]
			f48_local5 = row
			if rowItems <= 0 then
				
			end
			rowItems = rowItems - self.spacing
		end
	end
	if 0 < self.firstElementXOffset then
		rowItems = self.firstElementXOffset - self.spacing
		for column = self.currentStartColumn - 1, 1, -1 do
			if not rowHeights[column] then
				for row = 1, self.vCount, 1 do
					local createRow = self.currentStartRow + row - 1
					if not self:getItemAtPosition( createRow, column, false ) then
						self:createWidgetForPosition( createRow, column, self.previousStartRow, self.previousStartColumn )
					end
				end
				rowHeights[column] = self:getColumnWidth( column )
			end
			if not rowHeights[column] then
				
			end
			rowItems = rowItems - rowHeights[column]
			firstVisibleRow = column
			if rowItems <= 0 then
				
			end
			rowItems = rowItems - self.spacing
		end
	end
	rowItems = function ( widget )
		local f49_local0 = self.firstElementXOffset
		local x = self.firstElementYOffset
		if self.currentStartColumn < widget.gridInfoTable.gridColIndex then
			for f49_local1 = self.currentStartColumn, widget.gridInfoTable.gridColIndex - 1, 1 do
				f49_local0 = f49_local0 + (rowHeights[f49_local1] or 0) + self.spacing
			end
		elseif widget.gridInfoTable.gridColIndex < self.currentStartColumn then
			for f49_local1 = widget.gridInfoTable.gridColIndex, self.currentStartColumn - 1, 1 do
				f49_local0 = f49_local0 - (rowHeights[f49_local1] or 0) - self.spacing
			end
		end
		if self.currentStartRow < widget.gridInfoTable.gridRowIndex then
			for f49_local1 = self.currentStartRow, widget.gridInfoTable.gridRowIndex - 1, 1 do
				x = x + (f48_local2[f49_local1] or 0) + self.spacing
			end
		elseif widget.gridInfoTable.gridRowIndex < self.currentStartRow then
			for f49_local1 = widget.gridInfoTable.gridRowIndex, self.currentStartRow - 1, 1 do
				x = x - (f48_local2[f49_local1] or 0) - self.spacing
			end
		end
		return f49_local0, x
	end
	
	local isWidgetVisibleInRange = function ( widget, startRow, startColumn, rowSpawn, columnSpan )
		if not startRow or not startColumn then
			return false
		elseif not f48_local2[widget.gridInfoTable.gridRowIndex] or not rowHeights[widget.gridInfoTable.gridColIndex] then
			return false
		elseif startRow <= LUI_GridLayout_GetElementEndRow( widget ) and widget.gridInfoTable.gridRowIndex < startRow + self.vCount and startColumn <= LUI_GridLayout_GetElementEndColumn( widget ) and widget.gridInfoTable.gridColIndex < startColumn + self.hCount then
			return true
		elseif startRow + self.vCount <= widget.gridInfoTable.gridRowIndex or startColumn + self.hCount <= widget.gridInfoTable.gridColIndex then
			return false
		elseif self.firstElementXOffset > 0 or self.firstElementYOffset > 0 then
			local newX, newY = rowItems( widget )
			if newX + LUI_GridLayout_GetElementRequestedWidth( widget, self.controller ) > 0 and newY + LUI_GridLayout_GetElementRequestedHeight( widget, self.controller ) > 0 then
				return true
			end
		end
		return false
	end
	
	local elementsToRemove = {}
	local moveToPosition = function ( widget, x, y, width, height, alpha, destroyWhenFinished )
		widget:beginAnimation( "layoutChange", f48_local1 )
		if alpha ~= nil then
			widget:setAlpha( alpha )
		end
		widget:setLeftRight( true, false, x, x + width )
		widget:setTopBottom( true, false, y, y + height )
		if destroyWhenFinished then
			widget:registerEventHandler( "transition_complete_layoutChange", function ( widget, event )
				if not event.interrupted then
					self:removeItem( widget )
				end
			end )
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
				if isWidgetVisibleInRange( widget, f48_local5, firstVisibleRow ) then
					local newX, newY = rowItems( widget )
					moveToPosition( widget, newX, newY, widgetWidth, widgetHeight, 1 )
				end
				if isWidgetVisibleInRange( widget, lastFirstVisibleRow, lastFirstVisibleColumn ) then
					if f48_local1 == 0 then
						table.insert( elementsToRemove, widget )
					else
						local newX, newY = rowItems( widget )
						moveToPosition( widget, newX, newY, widgetWidth, widgetHeight, movedOffAlpha, true )
						goto basicblock_61:
					end
				end
				table.insert( elementsToRemove, widget )
			end
		end
	end
	for _, rowTable in ipairs( elementsToRemove ) do
		self:removeItem( rowTable )
	end
	f48_local11 = 0
	local width = 0
	for column = 1, self.requestedColumnCount, 1 do
		if rowHeights[self.currentStartColumn + column - 1] then
			f48_local11 = f48_local11 + rowHeights[self.currentStartColumn + column - 1] + self.spacing
		end
	end
	for row = 1, self.requestedRowCount, 1 do
		if f48_local2[self.currentStartRow + row - 1] then
			width = width + f48_local2[self.currentStartRow + row - 1] + self.spacing
		end
	end
	self:setWidth( f48_local11 )
	self:setHeight( width )
	self.width = f48_local11
	self.height = width
	self.delayNavigation = true
	if self.delayNavTimer then
		self.delayNavTimer:close()
	end
	self.delayNavTimer = LUI.UITimer.newElementTimer( 20, true, function ()
		self.delayNavigation = false
	end )
	self:addElement( self.delayNavTimer )
	self.lastFirstVisibleRow = f48_local5
	self.lastFirstVisibleColumn = firstVisibleRow
	self:updateScrollbars()
end

LUI.GridLayout.createWidgetFromDataSource = function ( self, controller, dataItemModel, overrideWidgetType )
	if overrideWidgetType and overrideWidgetType.new then
		return overrideWidgetType.new( self.menu, controller )
	elseif not self.widgetType then
		return nil
	end
	local widget = nil
	if type( self.widgetType ) == "string" then
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
	return widget
end

LUI.GridLayout.getModelForIndex = function ( self, index )
	local dataSource = self:getDataSource()
	if not dataSource or not dataSource.getCount then
		return nil
	else
		local itemCount = dataSource.getCount( self )
		if index <= itemCount then
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

LUI.GridLayout.createWidgetForPosition = function ( self, row, column, layoutStartRow, layoutStartColumn )
	local dataSource = self:getDataSource()
	if not dataSource or not dataSource.getCount then
		return nil
	end
	local itemCount = dataSource.getCount( self )
	local index = self:GetTableIndexForPosition( row, column )
	if index <= itemCount then
		local dataItemModel = self:getModelForIndex( index )
		local overrideWidgetType = nil
		if dataSource.getWidgetTypeForItem then
			overrideWidgetType = dataSource.getWidgetTypeForItem( self, dataItemModel, row )
		end
		local newWidget = self:createWidgetFromDataSource( self.controller, dataItemModel, overrideWidgetType )
		if newWidget ~= nil then
			if dataItemModel then
				newWidget:setModel( dataItemModel )
			end
			self:setItemAtPosition( newWidget, row, column, false, layoutStartRow, layoutStartColumn )
			if dataSource.getCustomPropertiesForItem then
				local propertyTable = dataSource.getCustomPropertiesForItem( self, index )
				if propertyTable then
					for k, v in pairs( propertyTable ) do
						newWidget[k] = v
					end
				end
			end
			if dataItemModel then
				local customIdModel = Engine.GetModel( dataItemModel, "customId" )
				if customIdModel then
					newWidget.id = Engine.GetModelValue( customIdModel )
				end
			end
			newWidget:processEvent( {
				name = "update_state",
				menu = self.menu
			} )
			return newWidget
		end
	end
	return nil
end

LUI.GridLayout.updateDataSource = function ( self, ignoreFocusRestore, ignoreLayoutClear, ignorePrepare )
	local dataSource = self:getDataSource()
	if not dataSource or not dataSource.getCount or not dataSource.getItem then
		return 
	elseif not self.widgetType then
		return 
	elseif dataSource.prepare and (not self.prepared or not ignorePrepare) then
		self.prepared = true
		dataSource.prepare( self.controller, self, self.filter )
	end
	if self.hCount > 1 and self.vCount > 1 then
		local itemCount = dataSource.getCount( self )
		self.requestedColumnCount = self.hCount
		self.requestedRowCount = math.floor( math.max( 0, itemCount - 1 ) / self.hCount ) + 1
	elseif self.vCount > 1 then
		local itemCount = dataSource.getCount( self )
		self.requestedRowCount = itemCount
		self.requestedColumnCount = 1
	elseif self.hCount >= 1 then
		local itemCount = dataSource.getCount( self )
		self.requestedRowCount = 1
		self.requestedColumnCount = itemCount
	else
		return 
	end
	if not ignoreLayoutClear then
		self:clearLayout( true, false )
	end
	self:processEvent( {
		name = "update_state",
		menu = self.menu
	} )
	self.activeWidget = nil
	local selectionWidget, selectRow, selectColumn = nil
	for row = 1, self.requestedRowCount, 1 do
		for column = 1, self.requestedColumnCount, 1 do
			local propertyTable = self:getPropertiesForPosition( row, column )
			if propertyTable and propertyTable.selectIndex then
				propertyTable.selectIndex = false
				selectRow = row
				selectColumn = column
				break
			end
		end
		if selectRow then
			
		end
	end
	if selectRow then
		selectionWidget = self:getItemAtPosition( selectRow, selectColumn, true )
	end
	if not selectionWidget and self.savedActiveIndex and not ignoreFocusRestore then
		local savedRow, f60_local0 = self:getRowAndColumnForIndex( self.savedActiveIndex )
		selectionWidget = self:getItemAtPosition( savedRow, f60_local0, true )
	end
	if not selectionWidget and (self.hasListFocus or self.setActiveOnUpdate) and not ignoreFocusRestore then
		selectionWidget = self:getFirstSelectableItem()
	end
	if selectionWidget then
		self:setActiveItem( selectionWidget )
	end
	self:dispatchEventToParent( {
		name = "grid_updated",
		grid = self
	} )
	return true
end

LUI.GridLayout.close = function ( self )
	self:unsubscribeFromAllModels()
	self:clearLayout( true, false )
	local dataSource = self:getDataSource()
	LUI.GridLayout.super.close( self )
	if dataSource and dataSource.cleanup then
		dataSource.cleanup( self )
	end
end

LUI.GridLayout.updateState = function ( self, event )
	LUI.GridLayout.super.updateState( self, event )
	self:updateLayout( 0 )
end

LUI.GridLayout:registerEventHandler( "update_state", LUI.GridLayout.updateState )
LUI.GridLayout.setActiveOnUpdate = true
LUI.GridLayout.id = "LUIGridLayout"
