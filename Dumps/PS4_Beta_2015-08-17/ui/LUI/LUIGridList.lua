LUI.UIGridList = {}
LUI.UIGridList.RowHeight = 70
LUI.UIGridList.Spacing = 10
local UIGridList_CreateRows = function ( list )
	for i = 1, list.numRows, 1 do
		list.data[i] = LUI.UIHorizontalList.new()
		list.data[i]:setLeftRight( true, true, 0, 0 )
		list.data[i]:setTopBottom( true, false, (list.rowHeight + list.spacing) * (i - 1), (list.rowHeight + list.spacing) * (i - 1) + list.rowHeight )
		list.data[i]:setSpacing( LUI.UIGridList.Spacing )
		list.data:addElement( list.data[i] )
	end
	list.data[1]:processEvent( {
		name = "gain_focus"
	} )
end

LUI.UIGridList.new = function ( defaultAnimationState, numRows, numCols )
	local list = LUI.UIElement.new( defaultAnimationState )
	list.id = "UIGridList"
	list.numRows = numRows
	list.numCols = numCols
	list.setNumRows = LUI.UIGridList.SetNumRows
	list.setNumCols = LUI.UIGridList.SetNumCols
	list.spacing = LUI.UIGridList.Spacing
	list.rowHeight = LUI.UIGridList.RowHeight
	list.addElementToRow = LUI.UIGridList.AddElementToRow
	list.setSpacing = LUI.UIGridList.SetSpacing
	list.setGridRowHeight = LUI.UIGridList.SetGridRowHeight
	list:registerEventHandler( "gain_focus", LUI.UIGridList.gainFocus )
	list.data = LUI.UIContainer.new()
	list:addElement( list.data )
	if numRows ~= nil then
		UIGridList_CreateRows( list )
	end
	return list
end

LUI.UIGridList.SetNumRows = function ( self, numRows )
	self.numRows = numRows
	UIGridList_CreateRows( self )
end

LUI.UIGridList.SetNumCols = function ( self, numCols )
	self.numCols = numCols
end

local UIGridList_ApplySettings = function ( self )
	for i = 1, self.numRows, 1 do
		self.data[i]:setTopBottom( true, false, (self.rowHeight + self.spacing) * (i - 1), (self.rowHeight + self.spacing) * (i - 1) + self.rowHeight )
		self.data[i]:setSpacing( self.spacing )
	end
end

LUI.UIGridList.SetSpacing = function ( self, spacing )
	self.spacing = spacing
	UIGridList_ApplySettings( self )
end

LUI.UIGridList.SetGridRowHeight = function ( self, rowHeight )
	self.rowHeight = rowHeight
	UIGridList_ApplySettings( self )
end

LUI.UIGridList.AddElementToRow = function ( self, newChildElement, rowIndex )
	if self.numRows < rowIndex or rowIndex < 1 then
		error( "LUI Error: Invalid value for rowIndex" )
	end
	local numChildren = self.data[rowIndex]:getNumChildren()
	if self.numCols < numChildren then
		error( "LUI Error: Trying to add more children to the row than maximum." )
	end
	self.data[rowIndex][numChildren + 1] = newChildElement
	self.data[rowIndex]:addElement( newChildElement )
	LUI.UIGridList.UpdateNavigation( self )
end

LUI.UIGridList.UpdateNavigation = function ( self )
	local prevHorizontalList, prevHorizontalListNumChildren, nextHorizontalList, nextHorizontalListNumChildren, currHorizontalList, currHorizontalListNumChildren = nil
	for row = 1, self.numRows, 1 do
		currHorizontalList = self.data[row]
		currHorizontalListNumChildren = currHorizontalList:getNumChildren()
		if self.chainRows and currHorizontalListNumChildren ~= 0 then
			currHorizontalList[1].navigation.left = nil
			currHorizontalList[currHorizontalListNumChildren].navigation.right = nil
		end
		if row == 1 then
			prevHorizontalList = nil
			prevHorizontalListNumChildren = 0
		else
			prevHorizontalList = self.data[row - 1]
			prevHorizontalListNumChildren = prevHorizontalList:getNumChildren()
		end
		if row == self.numRows then
			nextHorizontalList = nil
			nextHorizontalListNumChildren = 0
		else
			nextHorizontalList = self.data[row + 1]
			nextHorizontalListNumChildren = nextHorizontalList:getNumChildren()
		end
		for col = 1, self.numCols, 1 do
			if col <= currHorizontalListNumChildren then
				if prevHorizontalList == nil or prevHorizontalListNumChildren < col or not prevHorizontalList[col].m_focusable then
					currHorizontalList[col].navigation.up = nil
				else
					currHorizontalList[col].navigation.up = prevHorizontalList[col]
				end
				if nextHorizontalList == nil or nextHorizontalListNumChildren < col or not nextHorizontalList[col].m_focusable then
					currHorizontalList[col].navigation.down = nil
				else
					currHorizontalList[col].navigation.down = nextHorizontalList[col]
				end
			end
		end
		if self.chainRows then
			if prevHorizontalList ~= nil and currHorizontalListNumChildren ~= 0 then
				currHorizontalList[1].navigation.left = prevHorizontalList[prevHorizontalListNumChildren]
			end
			if nextHorizontalList ~= nil and currHorizontalListNumChildren ~= 0 then
				currHorizontalList[currHorizontalListNumChildren].navigation.right = nextHorizontalList[1]
			end
		end
	end
end

LUI.UIGridList.gainFocus = function ( self )
	return self.data[1]:processEvent( {
		name = "gain_focus"
	} )
end

