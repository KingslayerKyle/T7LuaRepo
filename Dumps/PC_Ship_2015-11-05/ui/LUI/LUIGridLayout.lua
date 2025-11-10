LUI.GridLayout = InheritFrom( LUI.UIElement )
local f0_local0 = function ( f1_arg0 )
	return f1_arg0.gridInfoTable.gridRowIndex + f1_arg0.gridInfoTable.gridRowSpan - 1
end

local f0_local1 = function ( f2_arg0 )
	return f2_arg0.gridInfoTable.gridColIndex + f2_arg0.gridInfoTable.gridColSpan - 1
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if f3_arg0.getWidthInList then
		return f3_arg0:getWidthInList( f3_arg1 )
	elseif f3_arg0.sizeElement then
		local f3_local0, f3_local1 = f3_arg0.sizeElement:getLocalSize()
		return f3_local0
	else
		local f3_local0, f3_local1 = f3_arg0:getLocalSize()
		return f3_local0
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	if f4_arg0.getHeightInList then
		return f4_arg0:getHeightInList( f4_arg1 )
	elseif f4_arg0.sizeElement then
		local f4_local0, f4_local1 = f4_arg0.sizeElement:getLocalSize()
		return f4_local1
	else
		local f4_local0, f4_local1 = f4_arg0:getLocalSize()
		return f4_local1
	end
end

LUI.GridLayout.new = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5, f5_arg6, f5_arg7, f5_arg8, f5_arg9, f5_arg10, f5_arg11, f5_arg12, f5_arg13, f5_arg14 )
	local self = LUI.UIElement.new()
	self:setClass( LUI.GridLayout )
	self.itemStencil = LUI.UIElement.new()
	self.itemStencil:setLeftRight( true, true, 0, 0 )
	self.itemStencil:setTopBottom( true, true, 0, 0 )
	self.itemStencil.anyChildUsesUpdateState = true
	self.itemStencil.id = "itemStencil"
	if f5_arg14 then
		self.itemStencil:setUseStencil( true )
	end
	self:addElement( self.itemStencil )
	self:setForceMouseEventDispatch( true )
	self.itemStencil:setForceMouseEventDispatch( true )
	self.usingStencil = f5_arg14
	self.menu = f5_arg0
	self.elementStateConditions = {}
	self.m_focusable = f5_arg2
	self.filter = f5_arg8
	self.minimumRowHeight = f5_arg3
	self.minimumColumnWidth = f5_arg4
	self.hCount = 1
	self.vCount = 1
	self.spacing = f5_arg5
	self.controller = f5_arg1
	self.layoutItems = {}
	self.activeWidget = nil
	self.lastActiveWidget = nil
	self.loopEdges = f5_arg9 or false
	self:resetCurrentRowAndColumn()
	self.requestedRowCount = self.vCount
	self.requestedColumnCount = self.hCount
	self.customWidgetSetup = f5_arg7
	self.scrollAnimationTime = f5_arg6 or 0
	self.widgetType = nil
	self.isGridLayout = true
	self.activeWidgetInPlace = f5_arg10 or false
	self.firstElementXOffset = f5_arg11 or 0
	self.firstElementYOffset = f5_arg12 or 0
	self.placeMovedElementOnEnd = f5_arg13 or false
	self.anyChildUsesUpdateState = true
	self.prepared = false
	return self
end

LUI.GridLayout.setDataSource = function ( f6_arg0, f6_arg1 )
	f6_arg0.dataSourceName = f6_arg1
	local f6_local0 = f6_arg0:getDataSource()
	if f6_local0 and f6_local0.prepare then
		f6_arg0:updateDataSource()
	else
		f6_arg0:clearLayout( true )
	end
end

LUI.GridLayout.loopEdges = function ( f7_arg0, f7_arg1 )
	f7_arg0.loopEdges = f7_arg1
end

LUI.GridLayout.setHorizontalCount = function ( f8_arg0, f8_arg1, f8_arg2 )
	f8_arg0.hCount = f8_arg1
	f8_arg0:updateDataSource( nil, f8_arg2, true )
end

LUI.GridLayout.setVerticalCount = function ( f9_arg0, f9_arg1, f9_arg2 )
	f9_arg0.vCount = f9_arg1
	f9_arg0:updateDataSource( nil, f9_arg2, true )
end

LUI.GridLayout.getDataSource = function ( f10_arg0 )
	return DataSources[f10_arg0.dataSourceName]
end

LUI.GridLayout.setSpacing = function ( f11_arg0, f11_arg1 )
	if f11_arg0.spacing ~= f11_arg1 then
		f11_arg0.spacing = f11_arg1
		f11_arg0:updateLayout( 0 )
	end
end

LUI.GridLayout.updateCurrentPosition = function ( f12_arg0, f12_arg1, f12_arg2 )
	f12_arg0.previousStartColumn = f12_arg0.currentStartColumn
	f12_arg0.previousStartRow = f12_arg0.currentStartRow
	f12_arg0.currentStartColumn = f12_arg2
	f12_arg0.currentStartRow = f12_arg1
end

LUI.GridLayout.setWidgetType = function ( f13_arg0, f13_arg1 )
	f13_arg0.widgetType = f13_arg1
	f13_arg0:clearLayout( true )
end

LUI.GridLayout.mergeStateConditions = function ( f14_arg0, f14_arg1 )
	f14_arg0.elementStateConditions = {}
	LUI.GridLayout.super.mergeStateConditions( f14_arg0, f14_arg1, f14_arg0.elementStateConditions )
	f14_arg0:clearLayout( true )
	f14_arg0:processEvent( {
		name = "update_state",
		menu = f14_arg0.menu
	} )
end

LUI.GridLayout.setVerticalScrollbar = function ( f15_arg0, f15_arg1 )
	if f15_arg1 and f15_arg1.new then
		if f15_arg0.verticalScrollbar then
			f15_arg0.verticalScrollbar:close()
		end
		f15_arg0.verticalScrollbar = f15_arg1.new( f15_arg0.menu, f15_arg0.controller )
		local f15_local0, f15_local1, f15_local2, f15_local3 = f15_arg0.verticalScrollbar:getLocalRect()
		f15_arg0.verticalScrollbar:setTopBottom( true, true, 0, 0 )
		f15_arg0.verticalScrollbar:setLeftRight( false, true, 5, 5 + f15_local2 - f15_local0 )
		f15_arg0:addElement( f15_arg0.verticalScrollbar )
	end
	f15_arg0:updateScrollbars()
end

LUI.GridLayout.addCustomVerticalCounter = function ( f16_arg0, f16_arg1 )
	if f16_arg0.customVerticalCounter then
		return 
	else
		f16_arg0.customVerticalCounter = f16_arg1
		f16_arg0:updateScrollbars()
	end
end

LUI.GridLayout.setVerticalCounter = function ( f17_arg0, f17_arg1 )
	if f17_arg0.verticalCounter then
		f17_arg0.verticalCounter:close()
		f17_arg0.verticalCounter = nil
	end
	if f17_arg1 and f17_arg1.new then
		f17_arg0.verticalCounter = f17_arg1.new( f17_arg0.menu, f17_arg0.controller )
		local f17_local0, f17_local1, f17_local2, f17_local3 = f17_arg0.verticalCounter:getLocalRect()
		f17_arg0.verticalCounter:setLeftRight( true, true, 0, 0 )
		f17_arg0.verticalCounter:setTopBottom( false, true, 5, 5 + f17_local3 - f17_local1 )
		f17_arg0:addElement( f17_arg0.verticalCounter )
	end
	f17_arg0:updateScrollbars()
end

LUI.GridLayout.setVerticalPips = function ( f18_arg0, f18_arg1 )
	
end

LUI.GridLayout.setHorizontalScrollbar = function ( f19_arg0, f19_arg1 )
	if f19_arg1 and f19_arg1.new then
		if f19_arg0.horizontalScrollbar then
			f19_arg0.horizontalScrollbar:close()
		end
		f19_arg0.horizontalScrollbar = f19_arg1.new( f19_arg0.menu, f19_arg0.controller )
		local f19_local0, f19_local1, f19_local2, f19_local3 = f19_arg0.horizontalScrollbar:getLocalRect()
		f19_arg0.horizontalScrollbar:setLeftRight( true, true, 0, 0 )
		f19_arg0.horizontalScrollbar:setTopBottom( false, true, 5, 5 + f19_local3 - f19_local1 )
		f19_arg0:addElement( f19_arg0.horizontalScrollbar )
	end
	f19_arg0:updateScrollbars()
end

LUI.GridLayout.addCustomHorizontalCounter = function ( f20_arg0, f20_arg1 )
	if f20_arg0.customHorizontalCounter then
		return 
	else
		f20_arg0.customHorizontalCounter = f20_arg1
		f20_arg0:updateScrollbars()
	end
end

LUI.GridLayout.setHorizontalCounter = function ( f21_arg0, f21_arg1 )
	if f21_arg0.horizontalCounter then
		f21_arg0.horizontalCounter:close()
		f21_arg0.horizontalCounter = nil
	end
	if f21_arg1 and f21_arg1.new then
		f21_arg0.horizontalCounter = f21_arg1.new( f21_arg0.menu, f21_arg0.controller )
		local f21_local0, f21_local1, f21_local2, f21_local3 = f21_arg0.horizontalCounter:getLocalRect()
		f21_arg0.horizontalCounter:setLeftRight( true, true, 0, 0 )
		f21_arg0.horizontalCounter:setTopBottom( false, true, 5, 5 + f21_local3 - f21_local1 )
		f21_arg0:addElement( f21_arg0.horizontalCounter )
	end
	f21_arg0:updateScrollbars()
end

LUI.GridLayout.setHorizontalPips = function ( f22_arg0, f22_arg1 )
	
end

local f0_local4 = function ( f23_arg0 )
	return math.floor( f23_arg0 + 0.5 )
end

LUI.GridLayout.updateLayoutBasedOnVScrollbarMovement = function ( f24_arg0, f24_arg1 )
	if f24_arg0.verticalScrollbar.slider.dragStartBarTop then
		local f24_local0 = f24_arg0.verticalScrollbar.slider.dragStartBarTop + f24_arg1
		local f24_local1 = f24_local0 + f24_arg0.verticalScrollbar.slider.barHeight
		if f24_arg0.verticalScrollbar.sliderTop < f24_local0 and f24_local1 < f24_arg0.verticalScrollbar.sliderTop + f24_arg0.verticalScrollbar.sliderHeight then
			f24_arg0.verticalScrollbar.slider:setTopBottom( true, false, f24_local0, f24_local1 )
			f24_arg0.verticalScrollbar.slider.currentBarTop = f24_local0
			f24_arg0.currentStartRow = f0_local4( (f24_local0 - f24_arg0.verticalScrollbar.sliderTop) / f24_arg0.verticalScrollbar.sliderHeight * f24_arg0.requestedRowCount ) + 1
			f24_arg0:updateLayout()
		end
	end
end

LUI.GridLayout.updateLayoutBasedOnVScrollbarPercentage = function ( f25_arg0, f25_arg1 )
	f25_arg0.currentStartRow = math.min( f0_local4( f25_arg1 * f25_arg0.requestedRowCount ) + 1, f25_arg0.requestedRowCount - f25_arg0.vCount + 1 )
	f25_arg0:updateLayout()
end

LUI.GridLayout.scrollBarDragStart = function ( f26_arg0 )
	f26_arg0.scrollbarDragging = true
end

LUI.GridLayout.scrollBarDragStop = function ( f27_arg0 )
	f27_arg0.scrollbarDragging = false
	f27_arg0.verticalScrollbar.slider.dragStartBarTop = f27_arg0.verticalScrollbar.slider.currentBarTop
end

LUI.GridLayout.scrollUp = function ( f28_arg0 )
	if f28_arg0.vCount < f28_arg0.requestedRowCount then
		f28_arg0.currentStartRow = math.max( f28_arg0.currentStartRow - 1, 1 )
		f28_arg0:updateLayout()
		return true
	else
		return false
	end
end

LUI.GridLayout.scrollDown = function ( f29_arg0 )
	if f29_arg0.vCount < f29_arg0.requestedRowCount then
		f29_arg0.currentStartRow = math.min( f29_arg0.currentStartRow + 1, f29_arg0.requestedRowCount - f29_arg0.vCount + 1 )
		f29_arg0:updateLayout()
		return true
	else
		return false
	end
end

LUI.GridLayout.updateScrollbars = function ( f30_arg0 )
	local f30_local0, f30_local1 = f30_arg0:getLocalSize()
	if f30_arg0.verticalScrollbar then
		if f30_arg0.requestedRowCount <= f30_arg0.vCount then
			f30_arg0.verticalScrollbar:close()
		elseif not f30_arg0.verticalScrollbar:getParent() then
			f30_arg0:addElement( f30_arg0.verticalScrollbar )
		end
	end
	if f30_arg0.verticalScrollbar and not f30_arg0.scrollbarDragging then
		local f30_local2 = "DefaultState"
		if f30_arg0.requestedRowCount <= f30_arg0.vCount then
			f30_local2 = "AtTopAndBottom"
		elseif f30_arg0.currentStartRow == 1 and not f30_arg0.loopEdges then
			f30_local2 = "AtTop"
		elseif f30_arg0.requestedRowCount < f30_arg0.currentStartRow + f30_arg0.vCount and not f30_arg0.loopEdges then
			f30_local2 = "AtBottom"
		end
		if f30_arg0.verticalScrollbar.slider then
			if f30_arg0.verticalScrollbar.sliderHeight == nil then
				local f30_local3, f30_local4, f30_local5, f30_local6 = f30_arg0.verticalScrollbar.slider:getLocalRect()
				f30_arg0.verticalScrollbar.sliderHeight = f30_local1 - f30_local4 + f30_local6
				f30_arg0.verticalScrollbar.sliderTop = f30_local4
			end
			local f30_local3 = math.min( f30_arg0.vCount / f30_arg0.requestedRowCount, 1 )
			local f30_local5 = (f30_arg0.currentStartRow - 1) / f30_arg0.requestedRowCount * f30_arg0.verticalScrollbar.sliderHeight
			local f30_local6 = f30_local3 * f30_arg0.verticalScrollbar.sliderHeight
			local f30_local7 = f30_arg0.verticalScrollbar.sliderTop + f30_local5
			f30_arg0.verticalScrollbar.slider:beginAnimation( "update_position" )
			f30_arg0.verticalScrollbar.slider:setTopBottom( true, false, f30_local7, f30_local7 + f30_local6 )
			f30_arg0.verticalScrollbar.slider.barHeight = f30_local6
			f30_arg0.verticalScrollbar.slider.dragStartBarTop = f30_local7
		end
		f30_arg0.verticalScrollbar:setState( f30_local2 )
	end
	if f30_arg0.horizontalScrollbar then
		local f30_local2 = "DefaultState"
		if f30_arg0.requestedColumnCount <= f30_arg0.hCount then
			f30_local2 = "AtLeftAndRight"
		elseif f30_arg0.currentStartColumn == 1 then
			f30_local2 = "AtLeft"
		elseif f30_arg0.requestedColumnCount < f30_arg0.currentStartColumn + f30_arg0.hCount then
			f30_local2 = "AtRight"
		end
		if f30_arg0.horizontalScrollbar.slider then
			if f30_arg0.horizontalScrollbar.sliderWidth == nil then
				local f30_local3, f30_local4, f30_local5, f30_local6 = f30_arg0.horizontalScrollbar.slider:getLocalRect()
				f30_arg0.horizontalScrollbar.sliderWidth = f30_local0 - f30_local3 + f30_local5
				f30_arg0.horizontalScrollbar.sliderLeft = f30_local3
			end
			local f30_local3 = math.min( f30_arg0.hCount / f30_arg0.requestedColumnCount, 1 )
			local f30_local5 = (f30_arg0.currentStartColumn - 1) / f30_arg0.requestedColumnCount * f30_arg0.horizontalScrollbar.sliderWidth
			local f30_local6 = f30_local3 * f30_arg0.horizontalScrollbar.sliderWidth
			local f30_local7 = f30_arg0.horizontalScrollbar.sliderLeft + f30_local5
			f30_arg0.horizontalScrollbar.slider:beginAnimation( "update_position" )
			f30_arg0.horizontalScrollbar.slider:setLeftRight( true, false, f30_local7, f30_local7 + f30_local6 )
		end
		f30_arg0.horizontalScrollbar:setState( f30_local2 )
	end
end

local f0_local5 = function ( f31_arg0, f31_arg1 )
	if f31_arg1 then
		local f31_local0 = "DefaultState"
		if f31_arg0.requestedRowCount <= f31_arg0.vCount then
			f31_local0 = "AtTopAndBottom"
		elseif f31_arg0.activeWidget then
			if f31_arg0.activeWidget.gridInfoTable.gridRowIndex == 1 then
				f31_local0 = "AtTop"
			elseif f31_arg0.requestedRowCount <= f0_local0( f31_arg0.activeWidget ) then
				f31_local0 = "AtBottom"
			end
		end
		if f31_arg1.currentItem then
			local f31_local1 = 1
			if f31_arg0.activeWidget then
				f31_local1 = f31_arg0.activeWidget.gridInfoTable.zeroBasedIndex + 1
			end
			f31_arg1.currentItem:setText( f31_local1 )
		end
		if f31_arg1.count then
			local f31_local1 = 0
			local f31_local2 = f31_arg0:getDataSource()
			if f31_local2 and f31_local2.getCount then
				f31_local1 = f31_local2.getCount( f31_arg0 )
			end
			f31_arg1.count:setText( f31_local1 )
			if f31_local1 == 0 and f31_arg1.clipsPerState and f31_arg1.clipsPerState.NoItems then
				f31_local0 = "NoItems"
			end
		end
		f31_arg1:setState( f31_local0 )
	end
end

local f0_local6 = function ( f32_arg0, f32_arg1 )
	if f32_arg1 then
		local f32_local0 = "DefaultState"
		if f32_arg0.requestedColumnCount <= f32_arg0.hCount then
			f32_local0 = "AtLeftAndRight"
		elseif f32_arg0.activeWidget then
			if f32_arg0.activeWidget.gridInfoTable.gridColIndex == 1 then
				f32_local0 = "AtLeft"
			elseif f32_arg0.requestedColumnCount <= f0_local1( f32_arg0.activeWidget ) then
				f32_local0 = "AtRight"
			end
		end
		if f32_arg1.currentItem then
			local f32_local1 = 1
			if f32_arg0.activeWidget then
				f32_local1 = f32_arg0.activeWidget.gridInfoTable.zeroBasedIndex + 1
			end
			f32_arg1.currentItem:setText( f32_local1 )
		end
		if f32_arg1.count then
			local f32_local1 = 0
			local f32_local2 = f32_arg0:getDataSource()
			if f32_local2 and f32_local2.getCount then
				f32_local1 = f32_local2.getCount( f32_arg0 )
			end
			f32_arg1.count:setText( f32_local1 )
			if f32_local1 == 0 and f32_arg1.clipsPerState and f32_arg1.clipsPerState.NoItems then
				f32_local0 = "NoItems"
			end
		end
		f32_arg1:setState( f32_local0 )
	end
end

LUI.GridLayout.updateCounters = function ( f33_arg0 )
	f0_local5( f33_arg0, f33_arg0.verticalCounter )
	f0_local5( f33_arg0, f33_arg0.customVerticalCounter )
	f0_local6( f33_arg0, f33_arg0.horizontalCounter )
	f0_local6( f33_arg0, f33_arg0.customHorizontalCounter )
end

LUI.GridLayout.resetCurrentRowAndColumn = function ( f34_arg0 )
	f34_arg0.currentStartRow = 1
	f34_arg0.currentStartColumn = 1
	f34_arg0.previousStartRow = 1
	f34_arg0.previousStartColumn = 1
end

LUI.GridLayout.isWidgetSelectable = function ( f35_arg0, f35_arg1 )
	if f35_arg1.internal then
		return f35_arg1.internal:hasClip( "Active" )
	else
		return f35_arg1:hasClip( "Active" )
	end
end

LUI.GridLayout.getWidgetVisiblePosition = function ( f36_arg0, f36_arg1 )
	local f36_local0 = 0
	local f36_local1 = 0
	if f36_arg1.gridInfoTable.gridRowIndex < f36_arg0.currentStartRow then
		f36_local0 = f36_arg1.gridInfoTable.gridRowIndex - f36_arg0.currentStartRow
	elseif f36_arg0.currentStartRow + f36_arg0.vCount <= f0_local0( f36_arg1 ) then
		f36_local0 = f0_local0( f36_arg1 ) - f36_arg0.currentStartRow + f36_arg0.vCount + 1
	end
	if f36_arg1.gridInfoTable.gridColIndex < f36_arg0.currentStartColumn then
		f36_local1 = f36_arg1.gridInfoTable.gridColIndex - f36_arg0.currentStartColumn
	elseif f36_arg0.currentStartColumn + f36_arg0.hCount <= f0_local1( f36_arg1 ) then
		f36_local1 = f0_local1( f36_arg1 ) - f36_arg0.currentStartColumn + f36_arg0.hCount + 1
	end
	return f36_local0, f36_local1
end

LUI.GridLayout.setActiveItem = function ( f37_arg0, f37_arg1, f37_arg2 )
	if f37_arg0.activeWidget then
		f37_arg0.activeWidget:processEvent( {
			name = "lose_active",
			controller = f37_arg0.controller
		} )
	end
	f37_arg0.lastActiveWidget = f37_arg0.activeWidget
	f37_arg0.activeWidget = f37_arg1
	if f37_arg0.activeWidget then
		f37_arg0.savedActiveIndex = f37_arg0.activeWidget.gridInfoTable.zeroBasedIndex
		f37_arg0.activeWidget:processEvent( {
			name = "gain_active",
			controller = f37_arg0.controller
		} )
		f37_arg0.activeWidget:dispatchEventToParentWithSelf( {
			name = "list_active_changed",
			list = f37_arg0,
			model = f37_arg0.activeWidget:getModel()
		} )
		if f37_arg0.activeWidgetInPlace then
			if f37_arg0.currentStartRow ~= f37_arg1.gridInfoTable.gridRowIndex or f37_arg0.currentStartColumn ~= f37_arg1.gridInfoTable.gridColIndex then
				f37_arg0:updateCurrentPosition( f37_arg1.gridInfoTable.gridRowIndex, f37_arg1.gridInfoTable.gridColIndex )
				f37_arg0:updateLayout( f37_arg2 or f37_arg0.scrollAnimationTime )
			else
				f37_arg0:updateLayout( 0 )
			end
		else
			local f37_local0, f37_local1 = f37_arg0:getWidgetVisiblePosition( f37_arg1 )
			f37_arg0:updateCurrentPosition( f37_arg0.currentStartRow + f37_local0, f37_arg0.currentStartColumn + f37_local1 )
			if f37_local0 ~= 0 or f37_local1 ~= 0 then
				local f37_local2 = f37_arg2
				local f37_local3
				if math.abs( f37_local0 ) <= 1 and math.abs( f37_local1 ) <= 1 then
					f37_local3 = f37_arg0.scrollAnimationTime
					if not f37_local3 then
					
					else
						f37_arg0:updateLayout( f37_local3 )
					end
				end
				f37_local3 = f37_local2 or 0
			end
		end
		f37_arg0:setModel( f37_arg0.activeWidget:getModel() )
	else
		f37_arg0:setModel( nil )
	end
	f37_arg0:dispatchEventToParent( {
		name = "grid_item_changed",
		grid = f37_arg0
	} )
	f37_arg0:updateCounters()
end

LUI.GridLayout.clearSavedActiveIndex = function ( f38_arg0 )
	f38_arg0.savedActiveIndex = nil
end

LUI.GridLayout.findItem = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3, f39_arg4 )
	for f39_local0 = 1, f39_arg0.requestedRowCount, 1 do
		for f39_local3 = 1, f39_arg0.requestedColumnCount, 1 do
			local f39_local6 = true
			if f39_arg1 then
				local f39_local7 = f39_arg0:getModelForPosition( f39_local0, f39_local3 )
				if f39_local7 then
					for f39_local11, f39_local12 in pairs( f39_arg1 ) do
						local f39_local13 = Engine.GetModel( f39_local7, f39_local11 )
						if not f39_local13 or Engine.GetModelValue( f39_local13 ) ~= f39_local12 then
							f39_local6 = false
						end
					end
				else
					f39_local6 = false
				end
			end
			if f39_local6 and f39_arg2 then
				local f39_local8 = f39_arg0:getItemAtPosition( f39_local0, f39_local3, false ) or f39_arg0:getPropertiesForPosition( f39_local0, f39_local3 )
				if f39_local8 then
					for f39_local12, f39_local13 in pairs( f39_arg2 ) do
						if f39_local8[f39_local12] ~= f39_local13 then
							f39_local6 = false
						end
					end
				else
					f39_local6 = false
				end
			end
			if f39_local6 then
				local f39_local7 = f39_arg0:getItemAtPosition( f39_local0, f39_local3, true )
				if f39_arg3 then
					f39_arg0:setActiveItem( f39_local7, f39_arg4 )
				end
				return f39_local7
			end
		end
	end
	return nil
end

LUI.GridLayout.getItemAtPosition = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
	local f40_local0 = nil
	local f40_local1 = f40_arg0.layoutItems[f40_arg1]
	if f40_local1 then
		f40_local0 = f40_local1[f40_arg2]
	end
	if not f40_local0 and f40_arg3 then
		f40_local0 = f40_arg0:createWidgetForPosition( f40_arg1, f40_arg2, f40_arg0.currentStartRow, f40_arg0.currentStartColumn )
	end
	return f40_local0
end

LUI.GridLayout.setActiveIndex = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3, f41_arg4 )
	if not f41_arg1 or not f41_arg2 then
		return false
	elseif f41_arg1 < 1 or f41_arg0.requestedRowCount < f41_arg1 or f41_arg2 < 1 or f41_arg0.requestedColumnCount < f41_arg2 then
		return false
	else
		local f41_local0 = f41_arg0:getItemAtPosition( f41_arg1, f41_arg2, true )
		if f41_local0 and (f41_arg4 or f41_arg0:isWidgetSelectable( f41_local0 )) then
			f41_arg0:setActiveItem( f41_local0, f41_arg3 )
			return true
		else
			return false
		end
	end
end

LUI.GridLayout.getRowAndColumnForIndex = function ( f42_arg0, f42_arg1 )
	local f42_local0, f42_local1 = nil
	if f42_arg0.vCount == 1 then
		f42_local0 = 1
		f42_local1 = f42_arg1 + 1
	else
		f42_local0 = math.floor( f42_arg1 / f42_arg0.hCount ) + 1
		f42_local1 = f42_arg1 % f42_arg0.hCount + 1
	end
	return f42_local0, f42_local1
end

LUI.GridLayout.navigateItemLeft = function ( f43_arg0 )
	f43_arg0.lastDirection = "left"
	if f43_arg0.activeWidget ~= nil then
		local f43_local0 = f43_arg0.activeWidget.gridInfoTable.gridRowIndex
		local f43_local1 = f43_arg0.activeWidget.gridInfoTable.gridColIndex - 1
		for f43_local2 = f43_local1, 1, -1 do
			for f43_local5 = 0, f43_arg0.activeWidget.gridInfoTable.gridRowSpan - 1, 1 do
				local f43_local8 = f43_arg0:getItemAtPosition( f43_local0 + f43_local5, f43_local2, true )
				if f43_local8 and f43_arg0:isWidgetSelectable( f43_local8 ) then
					f43_arg0:setActiveItem( f43_local8 )
					f43_arg0:playSound( "list_left" )
					return true
				end
			end
		end
		if f43_arg0.loopEdges and f43_arg0.hCount > 1 and f43_arg0.vCount > 1 then
			for f43_local2 = f43_arg0.requestedColumnCount, 1, -1 do
				for f43_local5 = f43_local0 - 1, 1, -1 do
					local f43_local8 = f43_arg0:getItemAtPosition( f43_local5, f43_local2, true )
					if f43_local8 and f43_arg0:isWidgetSelectable( f43_local8 ) then
						f43_arg0:setActiveItem( f43_local8 )
						f43_arg0:playSound( "list_left" )
						return true
					end
				end
			end
			return false
		else
			for f43_local2 = f43_local1, 1, -1 do
				for f43_local5 = f43_arg0.requestedRowCount, 1, -1 do
					local f43_local8 = f43_arg0:getItemAtPosition( f43_local5, f43_local2, true )
					if f43_local8 and f43_arg0:isWidgetSelectable( f43_local8 ) then
						f43_arg0:setActiveItem( f43_local8 )
						f43_arg0:playSound( "list_left" )
						return true
					end
				end
			end
			if f43_arg0.loopEdges and (f43_arg0.hCount == 1 or f43_arg0.vCount == 1) then
				for f43_local2 = f43_arg0.requestedColumnCount, f0_local1( f43_arg0.activeWidget ) + 1, -1 do
					for f43_local5 = f43_local0, 1, -1 do
						local f43_local8 = f43_arg0:getItemAtPosition( f43_local5, f43_local2, true )
						if f43_local8 and f43_arg0:isWidgetSelectable( f43_local8 ) then
							f43_arg0:setActiveItem( f43_local8 )
							f43_arg0:playSound( "list_left" )
							return true
						end
					end
				end
				if CoD.isPC and f43_arg0.requestedRowCount == 1 and f43_arg0.requestedColumnCount == 1 then
					return true
				end
			else
				return false
			end
		end
	end
	return false
end

LUI.GridLayout.getItemAtOffset = function ( f44_arg0, f44_arg1, f44_arg2 )
	if f44_arg0.activeWidget ~= nil then
		local f44_local0 = f44_arg0:getItemAtPosition( f44_arg0.activeWidget.gridInfoTable.gridRowIndex + f44_arg1, f0_local1( f44_arg0.activeWidget ) + f44_arg2, false )
		if f44_local0 and f44_arg0:isWidgetSelectable( f44_local0 ) then
			return f44_local0
		end
	end
end

LUI.GridLayout.navigateItemRight = function ( f45_arg0 )
	f45_arg0.lastDirection = "right"
	if f45_arg0.activeWidget ~= nil then
		local f45_local0 = f45_arg0.activeWidget.gridInfoTable.gridRowIndex
		local f45_local1 = f0_local1( f45_arg0.activeWidget ) + 1
		for f45_local2 = f45_local1, f45_arg0.requestedColumnCount, 1 do
			for f45_local5 = 0, f45_arg0.activeWidget.gridInfoTable.gridRowSpan - 1, 1 do
				local f45_local8 = f45_arg0:getItemAtPosition( f45_local0 + f45_local5, f45_local2, true )
				if f45_local8 and f45_arg0:isWidgetSelectable( f45_local8 ) then
					f45_arg0:setActiveItem( f45_local8 )
					f45_arg0:playSound( "list_right" )
					return true
				end
			end
		end
		if f45_arg0.loopEdges and f45_arg0.hCount > 1 and f45_arg0.vCount > 1 then
			for f45_local2 = 1, f45_arg0.requestedColumnCount, 1 do
				for f45_local5 = f0_local0( f45_arg0.activeWidget ) + 1, f45_arg0.requestedRowCount, 1 do
					local f45_local8 = f45_arg0:getItemAtPosition( f45_local5, f45_local2, true )
					if f45_local8 and f45_arg0:isWidgetSelectable( f45_local8 ) then
						f45_arg0:setActiveItem( f45_local8 )
						f45_arg0:playSound( "list_right" )
						return true
					end
				end
			end
			return false
		else
			for f45_local2 = f45_local1, f45_arg0.requestedColumnCount, 1 do
				for f45_local5 = f45_arg0.requestedRowCount, 1, -1 do
					local f45_local8 = f45_arg0:getItemAtPosition( f45_local5, f45_local2, true )
					if f45_local8 and f45_arg0:isWidgetSelectable( f45_local8 ) then
						f45_arg0:setActiveItem( f45_local8 )
						f45_arg0:playSound( "list_right" )
						return true
					end
				end
			end
			if f45_arg0.loopEdges and (f45_arg0.hCount == 1 or f45_arg0.vCount == 1) then
				for f45_local2 = 1, f45_arg0.activeWidget.gridInfoTable.gridColIndex - 1, 1 do
					for f45_local5 = f45_local0, 1, -1 do
						local f45_local8 = f45_arg0:getItemAtPosition( f45_local5, f45_local2, true )
						if f45_local8 and f45_arg0:isWidgetSelectable( f45_local8 ) then
							f45_arg0:setActiveItem( f45_local8 )
							f45_arg0:playSound( "list_right" )
							return true
						end
					end
				end
				if CoD.isPC and f45_arg0.requestedRowCount == 1 and f45_arg0.requestedColumnCount == 1 then
					return true
				end
			else
				return false
			end
		end
	end
	return false
end

LUI.GridLayout.navigateItemUp = function ( f46_arg0 )
	f46_arg0.lastDirection = "up"
	if f46_arg0.activeWidget ~= nil then
		local f46_local0 = f46_arg0.activeWidget.gridInfoTable.gridRowIndex - 1
		local f46_local1 = f46_arg0.activeWidget.gridInfoTable.gridColIndex
		for f46_local2 = f46_local0, 1, -1 do
			for f46_local5 = 0, f46_arg0.activeWidget.gridInfoTable.gridColSpan - 1, 1 do
				local f46_local8 = f46_arg0:getItemAtPosition( f46_local2, f46_local1 + f46_local5, true )
				if f46_local8 and f46_arg0:isWidgetSelectable( f46_local8 ) then
					f46_arg0:setActiveItem( f46_local8 )
					f46_arg0:playSound( "list_up" )
					return true
				end
			end
		end
		for f46_local2 = f46_local0, 1, -1 do
			for f46_local5 = f46_arg0.requestedColumnCount, 1, -1 do
				local f46_local8 = f46_arg0:getItemAtPosition( f46_local2, f46_local5, true )
				if f46_local8 and f46_arg0:isWidgetSelectable( f46_local8 ) then
					f46_arg0:setActiveItem( f46_local8 )
					f46_arg0:playSound( "list_up" )
					return true
				end
			end
		end
		if f46_arg0.loopEdges and (f46_arg0.hCount == 1 or f46_arg0.vCount == 1) then
			for f46_local2 = f46_arg0.requestedRowCount, f0_local0( f46_arg0.activeWidget ) + 1, -1 do
				for f46_local5 = f46_local1, 1, -1 do
					local f46_local8 = f46_arg0:getItemAtPosition( f46_local2, f46_local5, true )
					if f46_local8 and f46_arg0:isWidgetSelectable( f46_local8 ) then
						f46_arg0:setActiveItem( f46_local8 )
						f46_arg0:playSound( "list_up" )
						return true
					end
				end
			end
			if CoD.isPC and f46_arg0.requestedRowCount == 1 and f46_arg0.requestedColumnCount == 1 then
				return true
			end
		else
			return false
		end
	end
	return false
end

LUI.GridLayout.navigateItemDown = function ( f47_arg0 )
	f47_arg0.lastDirection = "down"
	if f47_arg0.activeWidget ~= nil then
		local f47_local0 = f0_local0( f47_arg0.activeWidget ) + 1
		local f47_local1 = f47_arg0.activeWidget.gridInfoTable.gridColIndex
		for f47_local2 = f47_local0, f47_arg0.requestedRowCount, 1 do
			for f47_local5 = 0, f47_arg0.activeWidget.gridInfoTable.gridColSpan - 1, 1 do
				local f47_local8 = f47_arg0:getItemAtPosition( f47_local2, f47_local1 + f47_local5, true )
				if f47_local8 and f47_arg0:isWidgetSelectable( f47_local8 ) then
					f47_arg0:setActiveItem( f47_local8 )
					f47_arg0:playSound( "list_down" )
					return true
				end
			end
		end
		for f47_local2 = f47_local0, f47_arg0.requestedRowCount, 1 do
			for f47_local5 = f47_arg0.requestedColumnCount, 1, -1 do
				local f47_local8 = f47_arg0:getItemAtPosition( f47_local2, f47_local5, true )
				if f47_local8 and f47_arg0:isWidgetSelectable( f47_local8 ) then
					f47_arg0:setActiveItem( f47_local8 )
					f47_arg0:playSound( "list_down" )
					return true
				end
			end
		end
		if f47_arg0.loopEdges and (f47_arg0.hCount == 1 or f47_arg0.vCount == 1) then
			for f47_local2 = 1, f47_arg0.activeWidget.gridInfoTable.gridRowIndex - 1, 1 do
				for f47_local5 = f47_local1, 1, -1 do
					local f47_local8 = f47_arg0:getItemAtPosition( f47_local2, f47_local5, true )
					if f47_local8 and f47_arg0:isWidgetSelectable( f47_local8 ) then
						f47_arg0:setActiveItem( f47_local8 )
						f47_arg0:playSound( "list_down" )
						return true
					end
				end
			end
			if CoD.isPC and f47_arg0.requestedRowCount == 1 and f47_arg0.requestedColumnCount == 1 then
				return true
			end
		else
			return false
		end
	end
	return false
end

LUI.GridLayout.getRowHeight = function ( f48_arg0, f48_arg1 )
	if not f48_arg0.layoutItems[f48_arg1] then
		return f48_arg0.minimumRowHeight
	end
	local f48_local0 = f48_arg0.minimumRowHeight
	for f48_local1 = 1, f48_arg0.requestedColumnCount, 1 do
		local f48_local4 = f48_arg0.layoutItems[f48_arg1][f48_local1]
		if f48_local4 ~= nil then
			local f48_local5 = f0_local3( f48_local4, f48_arg0.controller )
			if f48_local4.gridInfoTable.gridRowSpan == 1 then
				f48_local0 = math.max( f48_local0, f48_local5 )
			end
			if f48_arg1 == f48_local4.gridInfoTable.gridRowIndex + f48_local4.gridInfoTable.gridRowSpan - 1 then
				for f48_local6 = f48_local4.gridInfoTable.gridRowIndex, f48_local4.gridInfoTable.gridRowIndex + f48_local4.gridInfoTable.gridRowSpan - 2, 1 do
					f48_local5 = f48_local5 - f48_arg0:getRowHeight( f48_local6 ) - f48_arg0.spacing
				end
				f48_local0 = math.max( f48_local0, f48_local5 )
			end
		end
	end
	local f48_local1 = f48_arg0:getDataSource()
	if f48_local1 then
		f48_local0 = f48_local0 + (f48_local1.getSpacerAfterRow and f48_local1.getSpacerAfterRow( f48_arg0, f48_arg1, f48_local0 ) or 0)
	end
	return f48_local0
end

LUI.GridLayout.getColumnWidth = function ( f49_arg0, f49_arg1 )
	local f49_local0 = f49_arg0.minimumColumnWidth
	for f49_local1 = 1, f49_arg0.requestedRowCount, 1 do
		local f49_local4 = f49_arg0.layoutItems[f49_local1]
		if f49_local4 then
			local f49_local5 = f49_local4[f49_arg1]
			if f49_local5 ~= nil then
				local f49_local6 = f0_local2( f49_local5, f49_arg0.controller )
				if f49_local5.gridInfoTable.gridColSpan == 1 then
					f49_local0 = math.max( f49_local0, f49_local6 )
				end
				if f49_arg1 == f49_local5.gridInfoTable.gridColIndex + f49_local5.gridInfoTable.gridColSpan - 1 then
					for f49_local7 = f49_local5.gridInfoTable.gridColIndex, f49_local5.gridInfoTable.gridColIndex + f49_local5.gridInfoTable.gridColSpan - 2, 1 do
						f49_local6 = f49_local6 - f49_arg0:getColumnWidth( f49_local7 ) - f49_arg0.spacing
					end
					f49_local0 = math.max( f49_local0, f49_local6 )
				end
			end
		end
	end
	local f49_local1 = f49_arg0:getDataSource()
	if f49_local1 then
		f49_local0 = f49_local0 + (f49_local1.getSpacerAfterColumn and f49_local1.getSpacerAfterColumn( f49_arg0, f49_arg1, f49_local0 ) or 0)
	end
	return f49_local0
end

LUI.GridLayout.GetTableIndexForPosition = function ( f50_arg0, f50_arg1, f50_arg2 )
	return (f50_arg1 - 1) * f50_arg0.requestedColumnCount + f50_arg2
end

local f0_local7 = function ( f51_arg0 )
	return f51_arg0.gridInfoTable.zeroBasedIndex == 0
end

local f0_local8 = function ( f52_arg0 )
	local f52_local0 = f52_arg0.gridInfoTable.parentGrid:getDataSource()
	return f52_local0 and f52_arg0.gridInfoTable.zeroBasedIndex + 1 == f52_local0.getCount( f52_arg0.gridInfoTable.parentGrid )
end

local f0_local9 = function ( f53_arg0, f53_arg1, f53_arg2 )
	f53_arg0[f53_arg1.id] = nil
	f53_arg1.id = f53_arg2
	f53_arg0[f53_arg1.id] = f53_arg1
end

local f0_local10 = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3, f54_arg4, f54_arg5 )
	local f54_local0 = (f54_arg2 - 1) * f54_arg0.requestedColumnCount + f54_arg3 - 1
	f54_arg1.isFirstItem = f0_local7
	f54_arg1.isLastItem = f0_local8
	f54_arg1.gridInfoTable = {}
	f54_arg1.gridInfoTable.gridRowIndex = f54_arg2
	f54_arg1.gridInfoTable.gridColIndex = f54_arg3
	f54_arg1.gridInfoTable.gridRowSpan = f54_arg4
	f54_arg1.gridInfoTable.gridColSpan = f54_arg5
	f54_arg1.gridInfoTable.parentGrid = f54_arg0
	f54_arg1.gridInfoTable.zeroBasedIndex = f54_local0
	f0_local9( f54_arg0.itemStencil, f54_arg1, f54_arg1.id .. f54_local0 )
end

LUI.GridLayout.addItemToNextAvailable = function ( f55_arg0, f55_arg1, f55_arg2 )
	local f55_local0 = 1
	local f55_local1 = 1
	local f55_local2 = function ( f56_arg0, f56_arg1, f56_arg2 )
		f0_local10( f55_arg0, f56_arg0, f56_arg1, f56_arg2, 1, 1 )
		f55_arg0.layoutItems[f56_arg1][f56_arg2] = f56_arg0
		f55_arg0.itemStencil:addElement( f56_arg0 )
		if f55_arg0.customWidgetSetup then
			f55_arg0:customWidgetSetup( f56_arg0 )
		end
		if f55_arg2 then
			f55_arg0:updateLayout()
		end
	end
	
	while f55_local0 <= f55_arg0.vCount or f55_arg0.hCount == 1 do
		while f55_local1 <= f55_arg0.hCount or f55_arg0.vCount == 1 do
			if not f55_arg0.layoutItems[f55_local0] then
				f55_arg0.layoutItems[f55_local0] = {}
			end
			if not f55_arg0.layoutItems[f55_local0][f55_local1] then
				f55_local2( f55_arg1, f55_local0, f55_local1 )
				return true
			end
			f55_local1 = f55_local1 + 1
		end
		f55_local1 = 1
		f55_local0 = f55_local0 + 1
	end
	while f55_local1 <= f55_arg0.hCount or f55_arg0.vCount == 1 do
		if not f55_arg0.layoutItems[f55_local0] then
			f55_arg0.layoutItems[f55_local0] = {}
		end
		if not f55_arg0.layoutItems[f55_local0][f55_local1] then
			f55_local2( f55_arg1, f55_local0, f55_local1 )
			return true
		end
		f55_local1 = f55_local1 + 1
	end
	f55_local1 = 1
	f55_local0 = f55_local0 + 1
end

LUI.GridLayout.setItemAtPosition = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg4, f57_arg5, f57_arg6, f57_arg7, f57_arg8 )
	if not f57_arg7 then
		f57_arg7 = 1
	end
	if not f57_arg8 then
		f57_arg8 = 1
	end
	if 1 <= f57_arg2 and f57_arg2 + f57_arg7 - 1 <= f57_arg0.requestedRowCount and 1 <= f57_arg3 and f57_arg3 + f57_arg8 - 1 <= f57_arg0.requestedColumnCount then
		f0_local10( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg7, f57_arg8 )
		f57_arg0.itemStencil:addElement( f57_arg1 )
		if f57_arg0.customWidgetSetup then
			f57_arg0:customWidgetSetup( f57_arg1 )
		end
		for f57_local0 = f57_arg2, f57_arg2 + f57_arg7 - 1, 1 do
			for f57_local3 = f57_arg3, f57_arg3 + f57_arg8 - 1, 1 do
				if not f57_arg0.layoutItems[f57_local0] then
					f57_arg0.layoutItems[f57_local0] = {}
				end
				f57_arg0.layoutItems[f57_local0][f57_local3] = f57_arg1
			end
		end
		f57_arg0:positionElementWithStart( f57_arg1, f57_arg5, f57_arg6 )
		if f57_arg4 then
			f57_arg0:updateLayout()
		else
			
		end
	end
end

LUI.GridLayout.removeItem = function ( f58_arg0, f58_arg1, f58_arg2 )
	local f58_local0 = false
	for f58_local7, f58_local8 in pairs( f58_arg0.layoutItems ) do
		for f58_local4, f58_local5 in pairs( f58_local8 ) do
			if f58_arg1 == f58_local5 then
				f58_local0 = true
				f58_local8[f58_local4] = nil
			end
		end
	end
	f58_arg1:close()
	if f58_local0 and f58_arg2 then
		f58_arg0:updateLayout()
	end
end

LUI.GridLayout.getLastSelectableItem = function ( f59_arg0, f59_arg1 )
	for f59_local0 = f59_arg0.requestedRowCount, 1, -1 do
		for f59_local3 = f59_arg0.requestedColumnCount, 1, -1 do
			local f59_local6 = f59_arg0:getItemAtPosition( f59_local0, f59_local3, true )
			if f59_local6 and f59_arg0:isWidgetSelectable( f59_local6 ) then
				if f59_arg1 then
					f59_arg0:setActiveItem( f59_local6 )
				end
				return f59_local6
			end
		end
	end
	return nil
end

LUI.GridLayout.getFirstSelectableItem = function ( f60_arg0, f60_arg1 )
	for f60_local0 = 1, f60_arg0.requestedRowCount, 1 do
		for f60_local3 = 1, f60_arg0.requestedColumnCount, 1 do
			local f60_local6 = f60_arg0:getItemAtPosition( f60_local0, f60_local3, true )
			if f60_local6 and f60_arg0:isWidgetSelectable( f60_local6 ) then
				if f60_arg1 then
					f60_arg0:setActiveItem( f60_local6 )
				end
				return f60_local6
			end
		end
	end
	return nil
end

LUI.GridLayout.getItemAt = function ( f61_arg0, f61_arg1 )
	local f61_local0 = 0
	for f61_local1 = 1, f61_arg0.requestedRowCount, 1 do
		for f61_local4 = 1, f61_arg0.requestedColumnCount, 1 do
			local f61_local7 = false
			local f61_local8 = f61_arg0:getItemAtPosition( f61_local1, f61_local4, false )
			if not f61_local8 then
				f61_local7 = true
				f61_local8 = f61_arg0:getItemAtPosition( f61_local1, f61_local4, true )
			end
			if f61_local8 then
				f61_local0 = f61_local0 + 1
				if f61_local0 == f61_arg1 then
					return f61_local8
				elseif f61_local7 then
					f61_arg0:removeItem( f61_local8, false )
				end
			end
		end
	end
	return nil
end

LUI.GridLayout.clearLayout = function ( f62_arg0, f62_arg1, f62_arg2 )
	for f62_local6, f62_local7 in pairs( f62_arg0.layoutItems ) do
		for f62_local3, f62_local4 in pairs( f62_local7 ) do
			if f62_arg1 and f62_local4.gridInfoTable.gridRowIndex == f62_local6 and f62_local4.gridInfoTable.gridColIndex == f62_local3 then
				f62_local7[f62_local3]:close()
			end
			f62_local7[f62_local3] = nil
		end
	end
	f62_arg0.layoutItems = {}
	f62_arg0:resetCurrentRowAndColumn()
	if f62_arg1 then
		f62_arg0:setActiveItem( nil, 0 )
	end
	if f62_arg2 then
		f62_arg0:updateLayout()
	end
end

LUI.GridLayout.positionElementWithStart = function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3 )
	local f63_local0 = f63_arg1.gridInfoTable.gridRowIndex
	local f63_local1 = f63_arg1.gridInfoTable.gridColIndex
	local f63_local2 = 1
	if f63_local1 < f63_arg3 then
		f63_local2 = -1
	end
	local f63_local3 = f63_arg0.firstElementXOffset
	for f63_local4 = f63_arg3, f63_local1, f63_local2 do
		if f63_local2 == -1 or f63_local4 ~= f63_local1 then
			f63_local3 = f63_local3 + f63_arg0:getColumnWidth( f63_local4 ) * f63_local2
		end
	end
	local f63_local4 = 1
	if f63_local0 < f63_arg2 then
		f63_local4 = -1
	end
	local f63_local5 = f63_arg0.firstElementYOffset
	for f63_local6 = f63_arg2, f63_local0, f63_local4 do
		if f63_local4 == -1 or f63_local6 ~= f63_local0 then
			f63_local5 = f63_local5 + f63_arg0:getRowHeight( f63_local6 ) * f63_local4
		end
	end
	local f63_local6 = f0_local2( f63_arg1, f63_arg0.controller )
	local f63_local7 = f0_local3( f63_arg1, f63_arg0.controller )
	f63_arg1:beginAnimation( "position" )
	f63_arg1:setLeftRight( true, false, f63_local3, f63_local3 + f63_local6 )
	f63_arg1:setTopBottom( true, false, f63_local5, f63_local5 + f63_local7 )
end

LUI.GridLayout.updateLayout = function ( f64_arg0, f64_arg1 )
	if f64_arg0.originalListWidth == nil then
		local f64_local0, f64_local1, f64_local2, f64_local3 = f64_arg0:getLocalLeftRight()
		if f64_local0 + f64_local1 == 0 then
			f64_arg0.originalListWidth = f64_local3 - f64_local2
		elseif f64_local0 == 0 and f64_local1 == 1 then
			local f64_local4 = f64_arg0:getParent()
			if f64_local4 then
				local f64_local5, f64_local6, f64_local7, f64_local8 = f64_local4:getLocalLeftRight()
				f64_arg0.originalListWidth = f64_local8 - f64_local7 - f64_local2 + f64_local3
			end
		end
	end
	local f64_local0 = f64_arg1 or 0
	local f64_local1 = {}
	local f64_local2 = {}
	local f64_local3 = f64_arg0:getDataSource()
	if f64_local3 and f64_local3.prepare and not f64_arg0.prepared then
		f64_arg0.prepared = true
		f64_local3.prepare( f64_arg0.controller, f64_arg0, f64_arg0.filter )
	end
	local f64_local4 = f64_arg0.currentStartRow
	local f64_local5 = f64_arg0.currentStartColumn
	if f64_arg0.firstElementYOffset > 0 then
		local f64_local6 = f64_arg0.firstElementYOffset - f64_arg0.spacing
		for f64_local7 = f64_arg0.currentStartRow - 1, 1, -1 do
			if not f64_local1[f64_local7] then
				for f64_local10 = 1, f64_arg0.hCount, 1 do
					local f64_local13 = f64_arg0.currentStartColumn + f64_local10 - 1
					if not f64_arg0:getItemAtPosition( f64_local7, f64_local13, false ) then
						f64_arg0:createWidgetForPosition( f64_local7, f64_local13, f64_arg0.previousStartRow, f64_arg0.previousStartColumn )
					end
				end
				f64_local1[f64_local7] = f64_arg0:getRowHeight( f64_local7 )
			end
			if not f64_local1[f64_local7] then
				
			end
			f64_local6 = f64_local6 - f64_local1[f64_local7]
			f64_local4 = f64_local7
			if f64_local6 <= 0 then
				
			end
			f64_local6 = f64_local6 - f64_arg0.spacing
		end
	end
	if f64_arg0.firstElementXOffset > 0 then
		local f64_local6 = f64_arg0.firstElementXOffset - f64_arg0.spacing
		for f64_local7 = f64_arg0.currentStartColumn - 1, 1, -1 do
			if not f64_local2[f64_local7] then
				for f64_local10 = 1, f64_arg0.vCount, 1 do
					local f64_local13 = f64_arg0.currentStartRow + f64_local10 - 1
					if not f64_arg0:getItemAtPosition( f64_local13, f64_local7, false ) then
						f64_arg0:createWidgetForPosition( f64_local13, f64_local7, f64_arg0.previousStartRow, f64_arg0.previousStartColumn )
					end
				end
				f64_local2[f64_local7] = f64_arg0:getColumnWidth( f64_local7 )
			end
			if not f64_local2[f64_local7] then
				
			end
			f64_local6 = f64_local6 - f64_local2[f64_local7]
			f64_local5 = f64_local7
			if f64_local6 <= 0 then
				
			end
			f64_local6 = f64_local6 - f64_arg0.spacing
		end
	end
	for f64_local6 = f64_local4, math.min( f64_arg0.requestedRowCount, f64_local4 + f64_arg0.vCount - 1 ), 1 do
		if not f64_arg0.layoutItems[f64_local6] then
			f64_arg0.layoutItems[f64_local6] = {}
		end
		local f64_local14 = f64_arg0.layoutItems[f64_local6]
		for f64_local10 = f64_local5, math.min( f64_arg0.requestedColumnCount, f64_local5 + f64_arg0.hCount - 1 ), 1 do
			if not f64_local14[f64_local10] then
				f64_arg0:createWidgetForPosition( f64_local6, f64_local10, f64_arg0.previousStartRow, f64_arg0.previousStartColumn )
			end
			local f64_local13 = f64_arg0:getModelForPosition( f64_local6, f64_local10 )
			if f64_local13 ~= f64_local14[f64_local10]:getModel() then
				f64_local14[f64_local10]:setModel( f64_local13 )
				if f64_local14[f64_local10] == f64_arg0.activeWidget then
					f64_arg0:setModel( f64_local13 )
				end
			end
			f64_arg0:updateCustomWidgetProperties( f64_local6, f64_local10, f64_local14[f64_local10] )
		end
	end
	for f64_local9, f64_local14 in pairs( f64_arg0.layoutItems ) do
		f64_local1[f64_local9] = f64_arg0:getRowHeight( f64_local9 )
		for f64_local15, f64_local13 in pairs( f64_local14 ) do
			if not f64_local2[f64_local15] then
				f64_local2[f64_local15] = f64_arg0:getColumnWidth( f64_local15 )
			end
		end
	end
	f64_local6 = f64_arg0.lastFirstVisibleRow or f64_arg0.currentStartRow
	f64_local7 = f64_arg0.lastFirstVisibleColumn or f64_arg0.currentStartColumn
	f64_local8 = function ( f65_arg0 )
		local f65_local0 = f64_arg0.firstElementXOffset
		local f65_local1 = f64_arg0.firstElementYOffset
		if f64_arg0.currentStartColumn < f65_arg0.gridInfoTable.gridColIndex then
			for f65_local2 = f64_arg0.currentStartColumn, f65_arg0.gridInfoTable.gridColIndex - 1, 1 do
				f65_local0 = f65_local0 + (f64_local2[f65_local2] or 0) + f64_arg0.spacing
			end
		elseif f65_arg0.gridInfoTable.gridColIndex < f64_arg0.currentStartColumn then
			for f65_local2 = f65_arg0.gridInfoTable.gridColIndex, f64_arg0.currentStartColumn - 1, 1 do
				f65_local0 = f65_local0 - (f64_local2[f65_local2] or 0) - f64_arg0.spacing
			end
		end
		if f64_arg0.currentStartRow < f65_arg0.gridInfoTable.gridRowIndex then
			for f65_local2 = f64_arg0.currentStartRow, f65_arg0.gridInfoTable.gridRowIndex - 1, 1 do
				f65_local1 = f65_local1 + (f64_local1[f65_local2] or 0) + f64_arg0.spacing
			end
		elseif f65_arg0.gridInfoTable.gridRowIndex < f64_arg0.currentStartRow then
			for f65_local2 = f65_arg0.gridInfoTable.gridRowIndex, f64_arg0.currentStartRow - 1, 1 do
				f65_local1 = f65_local1 - (f64_local1[f65_local2] or 0) - f64_arg0.spacing
			end
		end
		return f65_local0, f65_local1
	end
	
	f64_local9 = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4 )
		if not f66_arg1 or not f66_arg2 then
			return false
		elseif not f64_local1[f66_arg0.gridInfoTable.gridRowIndex] or not f64_local2[f66_arg0.gridInfoTable.gridColIndex] then
			return false
		elseif f66_arg1 <= f0_local0( f66_arg0 ) and f66_arg0.gridInfoTable.gridRowIndex < f66_arg1 + math.min( f64_arg0.vCount, f64_arg0.requestedRowCount ) and f66_arg2 <= f0_local1( f66_arg0 ) and f66_arg0.gridInfoTable.gridColIndex < f66_arg2 + math.min( f64_arg0.hCount, f64_arg0.requestedColumnCount ) then
			return true
		elseif f66_arg1 + math.min( f64_arg0.vCount, f64_arg0.requestedRowCount ) <= f66_arg0.gridInfoTable.gridRowIndex or f66_arg2 + math.min( f64_arg0.hCount, f64_arg0.requestedColumnCount ) <= f66_arg0.gridInfoTable.gridColIndex then
			return false
		elseif f64_arg0.firstElementXOffset > 0 or f64_arg0.firstElementYOffset > 0 then
			local f66_local0, f66_local1 = f64_local8( f66_arg0 )
			if f66_local0 + f0_local2( f66_arg0, f64_arg0.controller ) > 0 and f66_local1 + f0_local3( f66_arg0, f64_arg0.controller ) > 0 then
				return true
			end
		end
		return false
	end
	
	f64_local14 = {}
	local f64_local10 = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4, f67_arg5, f67_arg6 )
		f67_arg0:beginAnimation( "layoutChange", f64_local0 )
		if f67_arg5 ~= nil then
			f67_arg0:setAlpha( f67_arg5 )
		end
		f67_arg0:setLeftRight( true, false, f67_arg1, f67_arg1 + f67_arg3 )
		f67_arg0:setTopBottom( true, false, f67_arg2, f67_arg2 + f67_arg4 )
		if f67_arg6 then
			f67_arg0:registerEventHandler( "transition_complete_layoutChange", function ( element, event )
				if not event.interrupted then
					f64_arg0:removeItem( element )
				end
			end )
		else
			f67_arg0:registerEventHandler( "transition_complete_layoutChange", nil )
		end
	end
	
	for f64_local13, f64_local24 in LUI.IterateTableBySortedKeys( f64_arg0.layoutItems ) do
		for f64_local21, f64_local22 in LUI.IterateTableBySortedKeys( f64_local24 ) do
			if f64_local22.gridInfoTable.gridRowIndex == f64_local13 and f64_local22.gridInfoTable.gridColIndex == f64_local21 then
				local f64_local16 = f0_local2( f64_local22, f64_arg0.controller )
				local f64_local17 = f0_local3( f64_local22, f64_arg0.controller )
				local f64_local18 = 0
				if f64_arg0.usingStencil then
					f64_local18 = 1
				end
				if f64_local9( f64_local22, f64_local4, f64_local5 ) then
					local f64_local19, f64_local20 = f64_local8( f64_local22 )
					if Engine.IsCurrentLanguageReversed() and f64_arg0.hCount == 1 and f64_arg0.originalListWidth ~= nil then
						f64_local10( f64_local22, f64_local19 + f64_arg0.originalListWidth - f64_local16, f64_local20, f64_local16, f64_local17, 1 )
					else
						f64_local10( f64_local22, f64_local19, f64_local20, f64_local16, f64_local17, 1 )
						goto basicblock_81:
					end
				end
				if f64_local9( f64_local22, f64_local6, f64_local7 ) then
					if f64_local0 == 0 then
						table.insert( f64_local14, f64_local22 )
					end
					local f64_local19, f64_local20 = f64_local8( f64_local22 )
					if Engine.IsCurrentLanguageReversed() and f64_arg0.hCount == 1 and f64_arg0.originalListWidth ~= nil then
						f64_local10( f64_local22, f64_local19 + f64_arg0.originalListWidth - f64_local16, f64_local20, f64_local16, f64_local17, f64_local18, true )
					else
						f64_local10( f64_local22, f64_local19, f64_local20, f64_local16, f64_local17, f64_local18, true )
						goto basicblock_81:
					end
				end
				table.insert( f64_local14, f64_local22 )
			end
		end
	end
	for f64_local13, f64_local24 in ipairs( f64_local14 ) do
		f64_arg0:removeItem( f64_local24 )
	end
	f64_local11 = 0
	f64_local12 = 0
	for f64_local15 = 1, math.min( f64_arg0.hCount, f64_arg0.requestedColumnCount ), 1 do
		if f64_local2[f64_arg0.currentStartColumn + f64_local15 - 1] then
			f64_local11 = f64_local11 + f64_local2[f64_arg0.currentStartColumn + f64_local15 - 1] + f64_arg0.spacing
		end
	end
	if f64_local11 ~= 0 then
		f64_local11 = f64_local11 - f64_arg0.spacing
	end
	for f64_local15 = 1, math.min( f64_arg0.vCount, f64_arg0.requestedRowCount ), 1 do
		if f64_local1[f64_arg0.currentStartRow + f64_local15 - 1] then
			f64_local12 = f64_local12 + f64_local1[f64_arg0.currentStartRow + f64_local15 - 1] + f64_arg0.spacing
		end
	end
	if f64_local12 ~= 0 then
		f64_local12 = f64_local12 - f64_arg0.spacing
	end
	if not f64_arg0.scrollbarDragging then
		f64_arg0:setWidth( f64_local11 )
		f64_arg0:setHeight( f64_local12 )
	end
	f64_arg0.width = f64_local11
	f64_arg0.height = f64_local12
	f64_arg0.lastFirstVisibleRow = f64_local4
	f64_arg0.lastFirstVisibleColumn = f64_local5
	f64_arg0:updateScrollbars()
end

LUI.GridLayout.createWidgetFromDataSource = function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3 )
	local f69_local0 = nil
	if f69_arg3 and f69_arg3.new then
		f69_local0 = f69_arg3.new( f69_arg0.menu, f69_arg1 )
	else
		if not f69_arg0.widgetType then
			return nil
		elseif type( f69_arg0.widgetType ) == "string" then
			local f69_local1 = Engine.GetModel( f69_arg2, f69_arg0.widgetTypeDataSource )
			if f69_local1 ~= nil then
				local f69_local2 = LUI.getTableFromPath( Engine.GetModelValue( f69_local1 ) )
				if f69_local2 and f69_local2.new then
					f69_local0 = f69_local2.new( f69_arg0.menu, f69_arg1 )
				end
			end
		elseif type( f69_arg0.widgetType ) == "table" then
			f69_local0 = f69_arg0.widgetType.new( f69_arg0.menu, f69_arg1 )
		end
		if f69_local0 then
			f69_local0:mergeStateConditions( f69_arg0.elementStateConditions )
			f69_local0:setAlpha( 0 )
		end
	end
	if f69_local0 ~= nil then
		f69_arg0.itemStencil[f69_local0.id] = f69_local0
		LUI.OverrideFunction_CallOriginalFirst( f69_local0, "close", function ()
			f69_arg0.itemStencil[f69_local0.id] = nil
		end )
	end
	return f69_local0
end

LUI.GridLayout.getModelForIndex = function ( f71_arg0, f71_arg1 )
	local f71_local0 = f71_arg0:getDataSource()
	if not f71_local0 or not f71_local0.getCount then
		return nil
	elseif f71_arg1 <= f71_local0.getCount( f71_arg0 ) then
		return f71_local0.getItem( f71_arg0.controller, f71_arg0, f71_arg1 )
	else
		return nil
	end
end

LUI.GridLayout.getModelForPosition = function ( f72_arg0, f72_arg1, f72_arg2 )
	return f72_arg0:getModelForIndex( f72_arg0:GetTableIndexForPosition( f72_arg1, f72_arg2 ) )
end

LUI.GridLayout.getPropertiesForIndex = function ( f73_arg0, f73_arg1 )
	local f73_local0 = f73_arg0:getDataSource()
	if not f73_local0 or not f73_local0.getCount or not f73_local0.getCustomPropertiesForItem then
		return nil
	elseif f73_arg1 <= f73_local0.getCount( f73_arg0 ) then
		return f73_local0.getCustomPropertiesForItem( f73_arg0, f73_arg1 )
	else
		return nil
	end
end

LUI.GridLayout.getPropertiesForPosition = function ( f74_arg0, f74_arg1, f74_arg2 )
	return f74_arg0:getPropertiesForIndex( f74_arg0:GetTableIndexForPosition( f74_arg1, f74_arg2 ) )
end

LUI.GridLayout.updateCustomWidgetProperties = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
	if not f75_arg3 then
		return 
	elseif f75_arg3.gridInfoTable.customProperties then
		for f75_local3, f75_local4 in ipairs( f75_arg3.gridInfoTable.customProperties ) do
			f75_arg3[f75_local4] = nil
		end
	end
	local f75_local0 = f75_arg0:getPropertiesForPosition( f75_arg1, f75_arg2 )
	if f75_local0 then
		f75_arg3.gridInfoTable.customProperties = {}
		for f75_local4, f75_local5 in pairs( f75_local0 ) do
			if f75_local4 == "id" then
				f0_local9( f75_arg0.itemStencil, f75_arg3, f75_local5 )
			else
				f75_arg3[f75_local4] = f75_local5
			end
		end
	end
end

LUI.GridLayout.createWidgetForPosition = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3, f76_arg4 )
	local f76_local0 = f76_arg0:getDataSource()
	if not f76_local0 or not f76_local0.getCount then
		return nil
	end
	local f76_local1 = f76_local0.getCount( f76_arg0 )
	local f76_local2 = f76_arg0:GetTableIndexForPosition( f76_arg1, f76_arg2 )
	if f76_local2 <= f76_local1 then
		local f76_local3 = f76_arg0:getModelForIndex( f76_local2 )
		local f76_local4 = nil
		local f76_local5 = f76_arg0:getPropertiesForPosition( f76_arg1, f76_arg2 )
		if f76_local5 and f76_local5.customWidgetOverride then
			f76_local4 = f76_local5.customWidgetOverride
		elseif f76_local0.getWidgetTypeForItem then
			f76_local4 = f76_local0.getWidgetTypeForItem( f76_arg0, f76_local3, f76_arg1, f76_arg2 )
		end
		local f76_local6 = f76_arg0:createWidgetFromDataSource( f76_arg0.controller, f76_local3, f76_local4 )
		if f76_local6 ~= nil then
			if f76_local3 then
				f76_local6:setModel( f76_local3 )
			end
			f76_arg0:setItemAtPosition( f76_local6, f76_arg1, f76_arg2, false, f76_arg3, f76_arg4 )
			f76_arg0:updateCustomWidgetProperties( f76_arg1, f76_arg2, f76_local6 )
			if f76_local3 then
				local f76_local7 = Engine.GetModel( f76_local3, "customId" )
				if f76_local7 then
					f0_local9( f76_arg0.itemStencil, f76_local6, Engine.GetModelValue( f76_local7 ) )
				end
			end
			if f76_arg0.menuLoaded then
				f76_local6:processEvent( {
					name = "menu_loaded",
					menu = f76_arg0.menu,
					controller = f76_arg0.controller
				} )
			end
			f76_local6:processEvent( {
				name = "update_state",
				menu = f76_arg0.menu
			} )
			if f76_arg0.menuOpened then
				f76_local6:processEvent( {
					name = "menu_opened",
					menu = f76_arg0.menu,
					controller = f76_arg0.controller
				} )
			end
			return f76_local6
		end
	end
	return nil
end

LUI.GridLayout.updateDataSource = function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3 )
	local f77_local0 = f77_arg0:getDataSource()
	if not f77_local0 or not f77_local0.getCount or not f77_local0.getItem then
		return 
	elseif not f77_arg0.widgetType then
		return 
	elseif f77_local0.prepare and (not f77_arg0.prepared or not f77_arg3) then
		f77_arg0.prepared = true
		f77_local0.prepare( f77_arg0.controller, f77_arg0, f77_arg0.filter )
	end
	if f77_arg0.hCount > 1 and f77_arg0.vCount > 1 then
		local f77_local1 = f77_local0.getCount( f77_arg0 )
		f77_arg0.requestedColumnCount = f77_arg0.hCount
		f77_arg0.requestedRowCount = math.floor( math.max( 0, f77_local1 - 1 ) / f77_arg0.hCount ) + 1
	elseif f77_arg0.vCount > 1 then
		f77_arg0.requestedRowCount = f77_local0.getCount( f77_arg0 )
		f77_arg0.requestedColumnCount = 1
	elseif f77_arg0.hCount >= 1 then
		local f77_local1 = f77_local0.getCount( f77_arg0 )
		f77_arg0.requestedRowCount = 1
		f77_arg0.requestedColumnCount = f77_local1
	else
		return 
	end
	if not f77_arg2 then
		f77_arg0:clearLayout( true, false )
	end
	f77_arg0:processEvent( {
		name = "update_state",
		menu = f77_arg0.menu
	} )
	f77_arg0.activeWidget = nil
	local f77_local1, f77_local2, f77_local3 = nil
	for f77_local4 = 1, f77_arg0.requestedRowCount, 1 do
		for f77_local7 = 1, f77_arg0.requestedColumnCount, 1 do
			local f77_local10 = f77_arg0:getPropertiesForPosition( f77_local4, f77_local7 )
			if f77_local10 and f77_local10.selectIndex then
				f77_local10.selectIndex = false
				f77_local2 = f77_local4
				f77_local3 = f77_local7
				break
			end
		end
		if f77_local2 then
			
		end
	end
	if f77_local2 then
		f77_local1 = f77_arg0:getItemAtPosition( f77_local2, f77_local3, true )
	end
	if not f77_local1 and f77_arg0.savedActiveIndex and not f77_arg1 then
		local f77_local4, f77_local5 = f77_arg0:getRowAndColumnForIndex( f77_arg0.savedActiveIndex )
		f77_local1 = f77_arg0:getItemAtPosition( f77_local4, f77_local5, true )
	end
	if not f77_local1 and (f77_arg0.hasListFocus or f77_arg0.setActiveOnUpdate) and not f77_arg1 then
		f77_local1 = f77_arg0:getFirstSelectableItem()
	end
	if f77_local1 then
		f77_local4 = nil
		if f77_local2 ~= nil then
			f77_local4 = 0
		end
		f77_arg0:setActiveItem( f77_local1, f77_local4 )
	else
		f77_arg0:updateScrollbars()
		f77_arg0:updateCounters()
	end
	f77_arg0:dispatchEventToParent( {
		name = "grid_updated",
		grid = f77_arg0
	} )
	return true
end

LUI.GridLayout.close = function ( f78_arg0 )
	f78_arg0:unsubscribeFromAllModels()
	f78_arg0:clearLayout( true, false )
	local f78_local0 = f78_arg0:getDataSource()
	LUI.GridLayout.super.close( f78_arg0 )
	if f78_local0 and f78_local0.cleanup then
		f78_local0.cleanup( f78_arg0 )
	end
end

LUI.GridLayout.updateState = function ( f79_arg0, f79_arg1 )
	LUI.GridLayout.super.updateState( f79_arg0, f79_arg1 )
	f79_arg0:updateLayout( 0 )
end

LUI.GridLayout:registerEventHandler( "update_state", LUI.GridLayout.updateState )
LUI.GridLayout.menuLoaded = function ( f80_arg0, f80_arg1 )
	f80_arg0.menuLoaded = true
	f80_arg0:dispatchEventToChildren( f80_arg1 )
end

LUI.GridLayout:registerEventHandler( "menu_loaded", LUI.GridLayout.menuLoaded )
LUI.GridLayout.menuOpened = function ( f81_arg0, f81_arg1 )
	f81_arg0.menuOpened = true
	f81_arg0:dispatchEventToChildren( f81_arg1 )
end

LUI.GridLayout:registerEventHandler( "menu_opened", LUI.GridLayout.menuOpened )
LUI.GridLayout.setActiveOnUpdate = true
LUI.GridLayout.id = "LUIGridLayout"
