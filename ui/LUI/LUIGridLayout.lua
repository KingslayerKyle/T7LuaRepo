-- 8c20ebc63caf2f0c38d4cfb5c7888536
-- This hash is used for caching, delete to decompile the file again

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
	self.itemCount = 0
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
	self.rowColumnIndexMap = {}
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
			if f31_arg0.currentStartRow == 1 then
				f31_local0 = "AtTop"
			elseif f31_arg0.requestedRowCount < f31_arg0.currentStartRow + f31_arg0.vCount then
				f31_local0 = "AtBottom"
			end
		end
		if f31_arg1.currentItem then
			local f31_local1 = 1
			if f31_arg0.activeWidget then
				f31_local1 = f31_arg0:GetTableIndexForPosition( f31_arg0.activeWidget.gridInfoTable.gridRowIndex, f31_arg0.activeWidget.gridInfoTable.gridColIndex ) or 1
			end
			f31_arg1.currentItem:setText( f31_local1 )
		end
		if f31_arg1.count then
			local f31_local1 = f31_arg0.itemCount
			if not f31_local1 then
				f31_local1 = 0
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
				f32_local1 = f32_arg0:GetTableIndexForPosition( f32_arg0.activeWidget.gridInfoTable.gridRowIndex, f32_arg0.activeWidget.gridInfoTable.gridColIndex ) or 1
			end
			f32_arg1.currentItem:setText( f32_local1 )
		end
		if f32_arg1.count then
			local f32_local1 = f32_arg0.itemCount
			if not f32_local1 then
				f32_local1 = 0
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
		if f37_arg0.hasListFocus and f37_arg0.updateButtonPromptsWhenEmptied then
			CoD.Menu.UpdateAllButtonPrompts( f37_arg0.menu, f37_arg0.controller )
		end
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

LUI.GridLayout.findVisibleItem = function ( f40_arg0, f40_arg1, f40_arg2 )
	for f40_local14, f40_local15 in LUI.IterateTableBySortedKeys( f40_arg0.layoutItems ) do
		for f40_local11, f40_local12 in LUI.IterateTableBySortedKeys( f40_local15 ) do
			local f40_local7 = true
			if f40_arg1 then
				local f40_local3 = f40_local12:getModel()
				if f40_local3 then
					for f40_local8, f40_local9 in pairs( f40_arg1 ) do
						local f40_local10 = Engine.GetModel( f40_local3, f40_local8 )
						if not f40_local10 or Engine.GetModelValue( f40_local10 ) ~= f40_local9 then
							f40_local7 = false
						end
					end
				else
					f40_local7 = false
				end
			end
			if f40_local7 and f40_arg2 then
				for f40_local6, f40_local8 in pairs( f40_arg2 ) do
					if f40_local12[f40_local6] ~= f40_local8 then
						f40_local7 = false
						break
					end
				end
			end
			if f40_local7 then
				return f40_local12
			end
		end
	end
	return nil
end

LUI.GridLayout.getItemAtPosition = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
	local f41_local0 = nil
	local f41_local1 = f41_arg0.layoutItems[f41_arg1]
	if f41_local1 then
		f41_local0 = f41_local1[f41_arg2]
	end
	if not f41_local0 and f41_arg3 then
		f41_local0 = f41_arg0:createWidgetForPosition( f41_arg1, f41_arg2, f41_arg0.currentStartRow, f41_arg0.currentStartColumn )
	end
	return f41_local0
end

LUI.GridLayout.setActiveIndex = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4 )
	if not f42_arg1 or not f42_arg2 then
		return false
	elseif f42_arg1 < 1 or f42_arg0.requestedRowCount < f42_arg1 or f42_arg2 < 1 or f42_arg0.requestedColumnCount < f42_arg2 then
		return false
	else
		local f42_local0 = f42_arg0:getItemAtPosition( f42_arg1, f42_arg2, true )
		if f42_local0 and (f42_arg4 or f42_arg0:isWidgetSelectable( f42_local0 )) then
			f42_arg0:setActiveItem( f42_local0, f42_arg3 )
			return true
		else
			return false
		end
	end
end

LUI.GridLayout.getRowAndColumnForIndex = function ( f43_arg0, f43_arg1 )
	local f43_local0, f43_local1 = nil
	if f43_arg0.vCount == 1 then
		f43_local0 = 1
		f43_local1 = f43_arg1 + 1
	else
		f43_local0 = math.floor( f43_arg1 / f43_arg0.hCount ) + 1
		f43_local1 = f43_arg1 % f43_arg0.hCount + 1
	end
	return f43_local0, f43_local1
end

LUI.GridLayout.navigateItemLeft = function ( f44_arg0 )
	f44_arg0.lastDirection = "left"
	if f44_arg0.activeWidget ~= nil then
		local f44_local0 = f44_arg0.activeWidget.gridInfoTable.gridRowIndex
		local f44_local1 = f44_arg0.activeWidget.gridInfoTable.gridColIndex - 1
		for f44_local2 = f44_local1, 1, -1 do
			for f44_local5 = 0, f44_arg0.activeWidget.gridInfoTable.gridRowSpan - 1, 1 do
				local f44_local8 = f44_arg0:getItemAtPosition( f44_local0 + f44_local5, f44_local2, true )
				if f44_local8 and f44_arg0:isWidgetSelectable( f44_local8 ) then
					f44_arg0:setActiveItem( f44_local8 )
					f44_arg0:playSound( "list_left" )
					return true
				end
			end
		end
		if f44_arg0.loopEdges and f44_arg0.hCount > 1 and f44_arg0.vCount > 1 then
			for f44_local2 = f44_arg0.requestedColumnCount, 1, -1 do
				for f44_local5 = f44_local0 - 1, 1, -1 do
					local f44_local8 = f44_arg0:getItemAtPosition( f44_local5, f44_local2, true )
					if f44_local8 and f44_arg0:isWidgetSelectable( f44_local8 ) then
						f44_arg0:setActiveItem( f44_local8 )
						f44_arg0:playSound( "list_left" )
						return true
					end
				end
			end
			return false
		else
			for f44_local2 = f44_local1, 1, -1 do
				for f44_local5 = f44_arg0.requestedRowCount, 1, -1 do
					local f44_local8 = f44_arg0:getItemAtPosition( f44_local5, f44_local2, true )
					if f44_local8 and f44_arg0:isWidgetSelectable( f44_local8 ) then
						f44_arg0:setActiveItem( f44_local8 )
						f44_arg0:playSound( "list_left" )
						return true
					end
				end
			end
			if f44_arg0.loopEdges and (f44_arg0.hCount == 1 or f44_arg0.vCount == 1) then
				for f44_local2 = f44_arg0.requestedColumnCount, f0_local1( f44_arg0.activeWidget ) + 1, -1 do
					for f44_local5 = f44_local0, 1, -1 do
						local f44_local8 = f44_arg0:getItemAtPosition( f44_local5, f44_local2, true )
						if f44_local8 and f44_arg0:isWidgetSelectable( f44_local8 ) then
							f44_arg0:setActiveItem( f44_local8 )
							f44_arg0:playSound( "list_left" )
							return true
						end
					end
				end
				if CoD.isPC and f44_arg0.requestedRowCount == 1 and f44_arg0.requestedColumnCount == 1 then
					return true
				end
			else
				return false
			end
		end
	end
	return false
end

LUI.GridLayout.getItemAtOffset = function ( f45_arg0, f45_arg1, f45_arg2 )
	if f45_arg0.activeWidget ~= nil then
		local f45_local0 = f45_arg0:getItemAtPosition( f45_arg0.activeWidget.gridInfoTable.gridRowIndex + f45_arg1, f0_local1( f45_arg0.activeWidget ) + f45_arg2, false )
		if f45_local0 and f45_arg0:isWidgetSelectable( f45_local0 ) then
			return f45_local0
		end
	end
end

LUI.GridLayout.navigateItemRight = function ( f46_arg0 )
	f46_arg0.lastDirection = "right"
	if f46_arg0.activeWidget ~= nil then
		local f46_local0 = f46_arg0.activeWidget.gridInfoTable.gridRowIndex
		local f46_local1 = f0_local1( f46_arg0.activeWidget ) + 1
		for f46_local2 = f46_local1, f46_arg0.requestedColumnCount, 1 do
			for f46_local5 = 0, f46_arg0.activeWidget.gridInfoTable.gridRowSpan - 1, 1 do
				local f46_local8 = f46_arg0:getItemAtPosition( f46_local0 + f46_local5, f46_local2, true )
				if f46_local8 and f46_arg0:isWidgetSelectable( f46_local8 ) then
					f46_arg0:setActiveItem( f46_local8 )
					f46_arg0:playSound( "list_right" )
					return true
				end
			end
		end
		if f46_arg0.loopEdges and f46_arg0.hCount > 1 and f46_arg0.vCount > 1 then
			for f46_local2 = 1, f46_arg0.requestedColumnCount, 1 do
				for f46_local5 = f0_local0( f46_arg0.activeWidget ) + 1, f46_arg0.requestedRowCount, 1 do
					local f46_local8 = f46_arg0:getItemAtPosition( f46_local5, f46_local2, true )
					if f46_local8 and f46_arg0:isWidgetSelectable( f46_local8 ) then
						f46_arg0:setActiveItem( f46_local8 )
						f46_arg0:playSound( "list_right" )
						return true
					end
				end
			end
			return false
		else
			for f46_local2 = f46_local1, f46_arg0.requestedColumnCount, 1 do
				for f46_local5 = f46_arg0.requestedRowCount, 1, -1 do
					local f46_local8 = f46_arg0:getItemAtPosition( f46_local5, f46_local2, true )
					if f46_local8 and f46_arg0:isWidgetSelectable( f46_local8 ) then
						f46_arg0:setActiveItem( f46_local8 )
						f46_arg0:playSound( "list_right" )
						return true
					end
				end
			end
			if f46_arg0.loopEdges and (f46_arg0.hCount == 1 or f46_arg0.vCount == 1) then
				for f46_local2 = 1, f46_arg0.activeWidget.gridInfoTable.gridColIndex - 1, 1 do
					for f46_local5 = f46_local0, 1, -1 do
						local f46_local8 = f46_arg0:getItemAtPosition( f46_local5, f46_local2, true )
						if f46_local8 and f46_arg0:isWidgetSelectable( f46_local8 ) then
							f46_arg0:setActiveItem( f46_local8 )
							f46_arg0:playSound( "list_right" )
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
	end
	return false
end

LUI.GridLayout.navigateItemUp = function ( f47_arg0 )
	f47_arg0.lastDirection = "up"
	if f47_arg0.activeWidget ~= nil then
		local f47_local0 = f47_arg0.activeWidget.gridInfoTable.gridRowIndex - 1
		local f47_local1 = f47_arg0.activeWidget.gridInfoTable.gridColIndex
		for f47_local2 = f47_local0, 1, -1 do
			for f47_local5 = 0, f47_arg0.activeWidget.gridInfoTable.gridColSpan - 1, 1 do
				local f47_local8 = f47_arg0:getItemAtPosition( f47_local2, f47_local1 + f47_local5, true )
				if f47_local8 and f47_arg0:isWidgetSelectable( f47_local8 ) then
					f47_arg0:setActiveItem( f47_local8 )
					f47_arg0:playSound( "list_up" )
					return true
				end
			end
		end
		for f47_local2 = f47_local0, 1, -1 do
			for f47_local5 = f47_arg0.requestedColumnCount, 1, -1 do
				local f47_local8 = f47_arg0:getItemAtPosition( f47_local2, f47_local5, true )
				if f47_local8 and f47_arg0:isWidgetSelectable( f47_local8 ) then
					f47_arg0:setActiveItem( f47_local8 )
					f47_arg0:playSound( "list_up" )
					return true
				end
			end
		end
		if f47_arg0.loopEdges and (f47_arg0.hCount == 1 or f47_arg0.vCount == 1) then
			for f47_local2 = f47_arg0.requestedRowCount, f0_local0( f47_arg0.activeWidget ) + 1, -1 do
				for f47_local5 = f47_local1, 1, -1 do
					local f47_local8 = f47_arg0:getItemAtPosition( f47_local2, f47_local5, true )
					if f47_local8 and f47_arg0:isWidgetSelectable( f47_local8 ) then
						f47_arg0:setActiveItem( f47_local8 )
						f47_arg0:playSound( "list_up" )
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

LUI.GridLayout.navigateItemDown = function ( f48_arg0 )
	f48_arg0.lastDirection = "down"
	if f48_arg0.activeWidget ~= nil then
		local f48_local0 = f0_local0( f48_arg0.activeWidget ) + 1
		local f48_local1 = f48_arg0.activeWidget.gridInfoTable.gridColIndex
		for f48_local2 = f48_local0, f48_arg0.requestedRowCount, 1 do
			for f48_local5 = 0, f48_arg0.activeWidget.gridInfoTable.gridColSpan - 1, 1 do
				local f48_local8 = f48_arg0:getItemAtPosition( f48_local2, f48_local1 + f48_local5, true )
				if f48_local8 and f48_arg0:isWidgetSelectable( f48_local8 ) then
					f48_arg0:setActiveItem( f48_local8 )
					f48_arg0:playSound( "list_down" )
					return true
				end
			end
		end
		for f48_local2 = f48_local0, f48_arg0.requestedRowCount, 1 do
			for f48_local5 = f48_arg0.requestedColumnCount, 1, -1 do
				local f48_local8 = f48_arg0:getItemAtPosition( f48_local2, f48_local5, true )
				if f48_local8 and f48_arg0:isWidgetSelectable( f48_local8 ) then
					f48_arg0:setActiveItem( f48_local8 )
					f48_arg0:playSound( "list_down" )
					return true
				end
			end
		end
		if f48_arg0.loopEdges and (f48_arg0.hCount == 1 or f48_arg0.vCount == 1) then
			for f48_local2 = 1, f48_arg0.activeWidget.gridInfoTable.gridRowIndex - 1, 1 do
				for f48_local5 = f48_local1, 1, -1 do
					local f48_local8 = f48_arg0:getItemAtPosition( f48_local2, f48_local5, true )
					if f48_local8 and f48_arg0:isWidgetSelectable( f48_local8 ) then
						f48_arg0:setActiveItem( f48_local8 )
						f48_arg0:playSound( "list_down" )
						return true
					end
				end
			end
			if CoD.isPC and f48_arg0.requestedRowCount == 1 and f48_arg0.requestedColumnCount == 1 then
				return true
			end
		else
			return false
		end
	end
	return false
end

LUI.GridLayout.getRowHeight = function ( f49_arg0, f49_arg1 )
	if not f49_arg0.layoutItems[f49_arg1] then
		return f49_arg0.minimumRowHeight
	end
	local f49_local0 = f49_arg0.minimumRowHeight
	for f49_local1 = 1, f49_arg0.requestedColumnCount, 1 do
		local f49_local4 = f49_arg0.layoutItems[f49_arg1][f49_local1]
		if f49_local4 ~= nil then
			local f49_local5 = f0_local3( f49_local4, f49_arg0.controller )
			if f49_local4.gridInfoTable.gridRowSpan == 1 then
				f49_local0 = math.max( f49_local0, f49_local5 )
			end
			if f49_arg1 == f49_local4.gridInfoTable.gridRowIndex + f49_local4.gridInfoTable.gridRowSpan - 1 then
				for f49_local6 = f49_local4.gridInfoTable.gridRowIndex, f49_local4.gridInfoTable.gridRowIndex + f49_local4.gridInfoTable.gridRowSpan - 2, 1 do
					f49_local5 = f49_local5 - f49_arg0:getRowHeight( f49_local6 ) - f49_arg0.spacing
				end
				f49_local0 = math.max( f49_local0, f49_local5 )
			end
		end
	end
	local f49_local1 = f49_arg0:getDataSource()
	if f49_local1 then
		f49_local0 = f49_local0 + (f49_local1.getSpacerAfterRow and f49_local1.getSpacerAfterRow( f49_arg0, f49_arg1, f49_local0 ) or 0)
	end
	return f49_local0
end

LUI.GridLayout.getColumnWidth = function ( f50_arg0, f50_arg1 )
	local f50_local0 = f50_arg0.minimumColumnWidth
	for f50_local1 = 1, f50_arg0.requestedRowCount, 1 do
		local f50_local4 = f50_arg0.layoutItems[f50_local1]
		if f50_local4 then
			local f50_local5 = f50_local4[f50_arg1]
			if f50_local5 ~= nil then
				local f50_local6 = f0_local2( f50_local5, f50_arg0.controller )
				if f50_local5.gridInfoTable.gridColSpan == 1 then
					f50_local0 = math.max( f50_local0, f50_local6 )
				end
				if f50_arg1 == f50_local5.gridInfoTable.gridColIndex + f50_local5.gridInfoTable.gridColSpan - 1 then
					for f50_local7 = f50_local5.gridInfoTable.gridColIndex, f50_local5.gridInfoTable.gridColIndex + f50_local5.gridInfoTable.gridColSpan - 2, 1 do
						f50_local6 = f50_local6 - f50_arg0:getColumnWidth( f50_local7 ) - f50_arg0.spacing
					end
					f50_local0 = math.max( f50_local0, f50_local6 )
				end
			end
		end
	end
	local f50_local1 = f50_arg0:getDataSource()
	if f50_local1 then
		f50_local0 = f50_local0 + (f50_local1.getSpacerAfterColumn and f50_local1.getSpacerAfterColumn( f50_arg0, f50_arg1, f50_local0 ) or 0)
	end
	return f50_local0
end

LUI.GridLayout.GetTableIndexForPosition = function ( f51_arg0, f51_arg1, f51_arg2 )
	local f51_local0 = f51_arg0.rowColumnIndexMap[f51_arg1]
	if f51_local0 then
		f51_local0 = f51_arg0.rowColumnIndexMap[f51_arg1][f51_arg2]
		if f51_local0 then
			f51_local0 = f51_arg0.rowColumnIndexMap[f51_arg1][f51_arg2].index
		end
	end
	return f51_local0
end

local f0_local7 = function ( f52_arg0 )
	return f52_arg0.gridInfoTable.zeroBasedIndex == 0
end

local f0_local8 = function ( f53_arg0 )
	local f53_local0 = f53_arg0.gridInfoTable.parentGrid:getDataSource()
	return f53_local0 and f53_arg0.gridInfoTable.zeroBasedIndex + 1 == f53_local0.getCount( f53_arg0.gridInfoTable.parentGrid )
end

local f0_local9 = function ( f54_arg0, f54_arg1, f54_arg2 )
	f54_arg0[f54_arg1.id] = nil
	f54_arg1.id = f54_arg2
	f54_arg0[f54_arg1.id] = f54_arg1
end

local f0_local10 = function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3, f55_arg4, f55_arg5 )
	local f55_local0 = (f55_arg2 - 1) * f55_arg0.requestedColumnCount + f55_arg3 - 1
	f55_arg1.isFirstItem = f0_local7
	f55_arg1.isLastItem = f0_local8
	f55_arg1.gridInfoTable = {}
	f55_arg1.gridInfoTable.gridRowIndex = f55_arg2
	f55_arg1.gridInfoTable.gridColIndex = f55_arg3
	f55_arg1.gridInfoTable.gridRowSpan = f55_arg4
	f55_arg1.gridInfoTable.gridColSpan = f55_arg5
	f55_arg1.gridInfoTable.parentGrid = f55_arg0
	f55_arg1.gridInfoTable.zeroBasedIndex = f55_local0
	f0_local9( f55_arg0.itemStencil, f55_arg1, f55_arg1.id .. f55_local0 )
end

LUI.GridLayout.addItemToNextAvailable = function ( f56_arg0, f56_arg1, f56_arg2 )
	local f56_local0 = 1
	local f56_local1 = 1
	local f56_local2 = function ( f57_arg0, f57_arg1, f57_arg2 )
		f0_local10( f56_arg0, f57_arg0, f57_arg1, f57_arg2, 1, 1 )
		f56_arg0.layoutItems[f57_arg1][f57_arg2] = f57_arg0
		f56_arg0.itemStencil:addElement( f57_arg0 )
		if f56_arg0.customWidgetSetup then
			f56_arg0:customWidgetSetup( f57_arg0 )
		end
		if f56_arg2 then
			f56_arg0:updateLayout()
		end
	end
	
	while f56_local0 <= f56_arg0.vCount or f56_arg0.hCount == 1 do
		while f56_local1 <= f56_arg0.hCount or f56_arg0.vCount == 1 do
			if not f56_arg0.layoutItems[f56_local0] then
				f56_arg0.layoutItems[f56_local0] = {}
			end
			if not f56_arg0.layoutItems[f56_local0][f56_local1] then
				f56_local2( f56_arg1, f56_local0, f56_local1 )
				return true
			end
			f56_local1 = f56_local1 + 1
		end
		f56_local1 = 1
		f56_local0 = f56_local0 + 1
	end
	while f56_local1 <= f56_arg0.hCount or f56_arg0.vCount == 1 do
		if not f56_arg0.layoutItems[f56_local0] then
			f56_arg0.layoutItems[f56_local0] = {}
		end
		if not f56_arg0.layoutItems[f56_local0][f56_local1] then
			f56_local2( f56_arg1, f56_local0, f56_local1 )
			return true
		end
		f56_local1 = f56_local1 + 1
	end
	f56_local1 = 1
	f56_local0 = f56_local0 + 1
end

LUI.GridLayout.setItemAtPosition = function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3, f58_arg4, f58_arg5, f58_arg6, f58_arg7, f58_arg8 )
	if not f58_arg7 then
		f58_arg7 = 1
	end
	if not f58_arg8 then
		f58_arg8 = 1
	end
	if 1 <= f58_arg2 and f58_arg2 + f58_arg7 - 1 <= f58_arg0.requestedRowCount and 1 <= f58_arg3 and f58_arg3 + f58_arg8 - 1 <= f58_arg0.requestedColumnCount then
		f0_local10( f58_arg0, f58_arg1, f58_arg2, f58_arg3, f58_arg7, f58_arg8 )
		f58_arg0.itemStencil:addElement( f58_arg1 )
		if f58_arg0.customWidgetSetup then
			f58_arg0:customWidgetSetup( f58_arg1 )
		end
		for f58_local0 = f58_arg2, f58_arg2 + f58_arg7 - 1, 1 do
			for f58_local3 = f58_arg3, f58_arg3 + f58_arg8 - 1, 1 do
				if not f58_arg0.layoutItems[f58_local0] then
					f58_arg0.layoutItems[f58_local0] = {}
				end
				f58_arg0.layoutItems[f58_local0][f58_local3] = f58_arg1
			end
		end
		f58_arg0:positionElementWithStart( f58_arg1, f58_arg5, f58_arg6 )
		if f58_arg4 then
			f58_arg0:updateLayout()
		end
		return true
	else
		return false
	end
end

LUI.GridLayout.removeItem = function ( f59_arg0, f59_arg1, f59_arg2 )
	local f59_local0 = false
	for f59_local7, f59_local8 in pairs( f59_arg0.layoutItems ) do
		for f59_local4, f59_local5 in pairs( f59_local8 ) do
			if f59_arg1 == f59_local5 then
				f59_local0 = true
				f59_local8[f59_local4] = nil
			end
		end
	end
	f59_arg1:close()
	if f59_local0 and f59_arg2 then
		f59_arg0:updateLayout()
	end
end

LUI.GridLayout.getLastSelectableItem = function ( f60_arg0, f60_arg1 )
	for f60_local0 = f60_arg0.requestedRowCount, 1, -1 do
		for f60_local3 = f60_arg0.requestedColumnCount, 1, -1 do
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

LUI.GridLayout.getFirstSelectableItem = function ( f61_arg0, f61_arg1 )
	for f61_local0 = 1, f61_arg0.requestedRowCount, 1 do
		for f61_local3 = 1, f61_arg0.requestedColumnCount, 1 do
			local f61_local6 = f61_arg0:getItemAtPosition( f61_local0, f61_local3, true )
			if f61_local6 and f61_arg0:isWidgetSelectable( f61_local6 ) then
				if f61_arg1 then
					f61_arg0:setActiveItem( f61_local6 )
				end
				return f61_local6
			end
		end
	end
	return nil
end

LUI.GridLayout.getItemAt = function ( f62_arg0, f62_arg1 )
	local f62_local0 = 0
	for f62_local1 = 1, f62_arg0.requestedRowCount, 1 do
		for f62_local4 = 1, f62_arg0.requestedColumnCount, 1 do
			local f62_local7 = false
			local f62_local8 = f62_arg0:getItemAtPosition( f62_local1, f62_local4, false )
			if not f62_local8 then
				f62_local7 = true
				f62_local8 = f62_arg0:getItemAtPosition( f62_local1, f62_local4, true )
			end
			if f62_local8 then
				f62_local0 = f62_local0 + 1
				if f62_local0 == f62_arg1 then
					return f62_local8
				elseif f62_local7 then
					f62_arg0:removeItem( f62_local8, false )
				end
			end
		end
	end
	return nil
end

LUI.GridLayout.clearLayout = function ( f63_arg0, f63_arg1, f63_arg2 )
	for f63_local6, f63_local7 in pairs( f63_arg0.layoutItems ) do
		for f63_local3, f63_local4 in pairs( f63_local7 ) do
			if f63_arg1 and f63_local4.gridInfoTable.gridRowIndex == f63_local6 and f63_local4.gridInfoTable.gridColIndex == f63_local3 then
				f63_local7[f63_local3]:close()
			end
			f63_local7[f63_local3] = nil
		end
	end
	f63_arg0.layoutItems = {}
	f63_arg0:resetCurrentRowAndColumn()
	if f63_arg1 then
		f63_arg0:setActiveItem( nil, 0 )
	end
	if f63_arg2 then
		f63_arg0:updateLayout()
	end
end

LUI.GridLayout.positionElementWithStart = function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3 )
	local f64_local0 = f64_arg1.gridInfoTable.gridRowIndex
	local f64_local1 = f64_arg1.gridInfoTable.gridColIndex
	local f64_local2 = 1
	if f64_local1 < f64_arg3 then
		f64_local2 = -1
	end
	local f64_local3 = f64_arg0.firstElementXOffset
	for f64_local4 = f64_arg3, f64_local1, f64_local2 do
		if f64_local2 == -1 or f64_local4 ~= f64_local1 then
			f64_local3 = f64_local3 + f64_arg0:getColumnWidth( f64_local4 ) * f64_local2
		end
	end
	local f64_local4 = 1
	if f64_local0 < f64_arg2 then
		f64_local4 = -1
	end
	local f64_local5 = f64_arg0.firstElementYOffset
	for f64_local6 = f64_arg2, f64_local0, f64_local4 do
		if f64_local4 == -1 or f64_local6 ~= f64_local0 then
			f64_local5 = f64_local5 + f64_arg0:getRowHeight( f64_local6 ) * f64_local4
		end
	end
	local f64_local6 = f0_local2( f64_arg1, f64_arg0.controller )
	local f64_local7 = f0_local3( f64_arg1, f64_arg0.controller )
	f64_arg1:beginAnimation( "position" )
	f64_arg1:setLeftRight( true, false, f64_local3, f64_local3 + f64_local6 )
	f64_arg1:setTopBottom( true, false, f64_local5, f64_local5 + f64_local7 )
end

LUI.GridLayout.updateLayout = function ( f65_arg0, f65_arg1 )
	if f65_arg0.originalListWidth == nil then
		local f65_local0, f65_local1, f65_local2, f65_local3 = f65_arg0:getLocalLeftRight()
		if f65_local0 + f65_local1 == 0 then
			f65_arg0.originalListWidth = f65_local3 - f65_local2
		elseif f65_local0 == 0 and f65_local1 == 1 then
			local f65_local4 = f65_arg0:getParent()
			if f65_local4 then
				local f65_local5, f65_local6, f65_local7, f65_local8 = f65_local4:getLocalLeftRight()
				f65_arg0.originalListWidth = f65_local8 - f65_local7 - f65_local2 + f65_local3
			end
		end
	end
	local f65_local0 = f65_arg1 or 0
	local f65_local1 = {}
	local f65_local2 = {}
	local f65_local3 = f65_arg0:getDataSource()
	if not f65_local3 then
		f65_arg0:clearLayout( true, false )
		return 
	elseif f65_local3.prepare and not f65_arg0.prepared then
		f65_arg0:updateDataSource( true, true, false )
	end
	local f65_local4 = f65_arg0.currentStartRow
	local f65_local5 = f65_arg0.currentStartColumn
	if f65_arg0.firstElementYOffset > 0 then
		local f65_local6 = f65_arg0.firstElementYOffset - f65_arg0.spacing
		for f65_local7 = f65_arg0.currentStartRow - 1, 1, -1 do
			if not f65_local1[f65_local7] then
				for f65_local10 = 1, f65_arg0.hCount, 1 do
					local f65_local13 = f65_arg0.currentStartColumn + f65_local10 - 1
					if not f65_arg0:getItemAtPosition( f65_local7, f65_local13, false ) then
						f65_arg0:createWidgetForPosition( f65_local7, f65_local13, f65_arg0.previousStartRow, f65_arg0.previousStartColumn )
					end
				end
				f65_local1[f65_local7] = f65_arg0:getRowHeight( f65_local7 )
			end
			if not f65_local1[f65_local7] then
				
			end
			f65_local6 = f65_local6 - f65_local1[f65_local7]
			f65_local4 = f65_local7
			if f65_local6 <= 0 then
				
			end
			f65_local6 = f65_local6 - f65_arg0.spacing
		end
	end
	if f65_arg0.firstElementXOffset > 0 then
		local f65_local6 = f65_arg0.firstElementXOffset - f65_arg0.spacing
		for f65_local7 = f65_arg0.currentStartColumn - 1, 1, -1 do
			if not f65_local2[f65_local7] then
				for f65_local10 = 1, f65_arg0.vCount, 1 do
					local f65_local13 = f65_arg0.currentStartRow + f65_local10 - 1
					if not f65_arg0:getItemAtPosition( f65_local13, f65_local7, false ) then
						f65_arg0:createWidgetForPosition( f65_local13, f65_local7, f65_arg0.previousStartRow, f65_arg0.previousStartColumn )
					end
				end
				f65_local2[f65_local7] = f65_arg0:getColumnWidth( f65_local7 )
			end
			if not f65_local2[f65_local7] then
				
			end
			f65_local6 = f65_local6 - f65_local2[f65_local7]
			f65_local5 = f65_local7
			if f65_local6 <= 0 then
				
			end
			f65_local6 = f65_local6 - f65_arg0.spacing
		end
	end
	for f65_local6 = f65_local4, math.min( f65_arg0.requestedRowCount, f65_local4 + f65_arg0.vCount - 1 ), 1 do
		if not f65_arg0.layoutItems[f65_local6] then
			f65_arg0.layoutItems[f65_local6] = {}
		end
		local f65_local14 = f65_arg0.layoutItems[f65_local6]
		for f65_local10 = f65_local5, math.min( f65_arg0.requestedColumnCount, f65_local5 + f65_arg0.hCount - 1 ), 1 do
			if f65_arg0.rowColumnIndexMap[f65_local6] and f65_arg0.rowColumnIndexMap[f65_local6][f65_local10] then
				if not f65_local14[f65_local10] then
					f65_arg0:createWidgetForPosition( f65_local6, f65_local10, f65_arg0.previousStartRow, f65_arg0.previousStartColumn )
				end
				local f65_local13 = f65_arg0:getModelForPosition( f65_local6, f65_local10 )
				if f65_local13 ~= f65_local14[f65_local10]:getModel() then
					f65_local14[f65_local10]:setModel( f65_local13 )
					if f65_local14[f65_local10] == f65_arg0.activeWidget then
						f65_arg0:setModel( f65_local13 )
					end
				end
				f65_arg0:updateCustomWidgetProperties( f65_local6, f65_local10, f65_local14[f65_local10] )
			end
		end
	end
	for f65_local9, f65_local14 in pairs( f65_arg0.layoutItems ) do
		f65_local1[f65_local9] = f65_arg0:getRowHeight( f65_local9 )
		for f65_local15, f65_local13 in pairs( f65_local14 ) do
			if not f65_local2[f65_local15] then
				f65_local2[f65_local15] = f65_arg0:getColumnWidth( f65_local15 )
			end
		end
	end
	f65_local6 = f65_arg0.lastFirstVisibleRow or f65_arg0.currentStartRow
	f65_local7 = f65_arg0.lastFirstVisibleColumn or f65_arg0.currentStartColumn
	f65_local8 = function ( f66_arg0 )
		local f66_local0 = f65_arg0.firstElementXOffset
		local f66_local1 = f65_arg0.firstElementYOffset
		if f65_arg0.currentStartColumn < f66_arg0.gridInfoTable.gridColIndex then
			for f66_local2 = f65_arg0.currentStartColumn, f66_arg0.gridInfoTable.gridColIndex - 1, 1 do
				f66_local0 = f66_local0 + (f65_local2[f66_local2] or 0) + f65_arg0.spacing
			end
		elseif f66_arg0.gridInfoTable.gridColIndex < f65_arg0.currentStartColumn then
			for f66_local2 = f66_arg0.gridInfoTable.gridColIndex, f65_arg0.currentStartColumn - 1, 1 do
				f66_local0 = f66_local0 - (f65_local2[f66_local2] or 0) - f65_arg0.spacing
			end
		end
		if f65_arg0.currentStartRow < f66_arg0.gridInfoTable.gridRowIndex then
			for f66_local2 = f65_arg0.currentStartRow, f66_arg0.gridInfoTable.gridRowIndex - 1, 1 do
				f66_local1 = f66_local1 + (f65_local1[f66_local2] or 0) + f65_arg0.spacing
			end
		elseif f66_arg0.gridInfoTable.gridRowIndex < f65_arg0.currentStartRow then
			for f66_local2 = f66_arg0.gridInfoTable.gridRowIndex, f65_arg0.currentStartRow - 1, 1 do
				f66_local1 = f66_local1 - (f65_local1[f66_local2] or 0) - f65_arg0.spacing
			end
		end
		return f66_local0, f66_local1
	end
	
	f65_local9 = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
		if not f67_arg1 or not f67_arg2 then
			return false
		elseif not f65_local1[f67_arg0.gridInfoTable.gridRowIndex] or not f65_local2[f67_arg0.gridInfoTable.gridColIndex] then
			return false
		elseif f67_arg1 <= f0_local0( f67_arg0 ) and f67_arg0.gridInfoTable.gridRowIndex < f67_arg1 + math.min( f65_arg0.vCount, f65_arg0.requestedRowCount ) and f67_arg2 <= f0_local1( f67_arg0 ) and f67_arg0.gridInfoTable.gridColIndex < f67_arg2 + math.min( f65_arg0.hCount, f65_arg0.requestedColumnCount ) then
			return true
		elseif f67_arg1 + math.min( f65_arg0.vCount, f65_arg0.requestedRowCount ) <= f67_arg0.gridInfoTable.gridRowIndex or f67_arg2 + math.min( f65_arg0.hCount, f65_arg0.requestedColumnCount ) <= f67_arg0.gridInfoTable.gridColIndex then
			return false
		elseif f65_arg0.firstElementXOffset > 0 or f65_arg0.firstElementYOffset > 0 then
			local f67_local0, f67_local1 = f65_local8( f67_arg0 )
			if f67_local0 + f0_local2( f67_arg0, f65_arg0.controller ) > 0 and f67_local1 + f0_local3( f67_arg0, f65_arg0.controller ) > 0 then
				return true
			end
		end
		return false
	end
	
	f65_local14 = {}
	local f65_local10 = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4, f68_arg5, f68_arg6 )
		f68_arg0:beginAnimation( "layoutChange", f65_local0 )
		if f68_arg5 ~= nil then
			f68_arg0:setAlpha( f68_arg5 )
		end
		f68_arg0:setLeftRight( true, false, f68_arg1, f68_arg1 + f68_arg3 )
		f68_arg0:setTopBottom( true, false, f68_arg2, f68_arg2 + f68_arg4 )
		if f68_arg6 then
			f68_arg0:registerEventHandler( "transition_complete_layoutChange", function ( element, event )
				if not event.interrupted then
					f65_arg0:removeItem( element )
				end
			end )
		else
			f68_arg0:registerEventHandler( "transition_complete_layoutChange", nil )
		end
	end
	
	for f65_local13, f65_local24 in LUI.IterateTableBySortedKeys( f65_arg0.layoutItems ) do
		for f65_local21, f65_local22 in LUI.IterateTableBySortedKeys( f65_local24 ) do
			if f65_local22.gridInfoTable.gridRowIndex == f65_local13 and f65_local22.gridInfoTable.gridColIndex == f65_local21 then
				local f65_local16 = f0_local2( f65_local22, f65_arg0.controller )
				local f65_local17 = f0_local3( f65_local22, f65_arg0.controller )
				local f65_local18 = 0
				if f65_arg0.usingStencil then
					f65_local18 = 1
				end
				if f65_local9( f65_local22, f65_local4, f65_local5 ) then
					local f65_local19, f65_local20 = f65_local8( f65_local22 )
					if Engine.IsCurrentLanguageReversed() and f65_arg0.hCount == 1 and f65_arg0.originalListWidth ~= nil then
						f65_local10( f65_local22, f65_local19 + f65_arg0.originalListWidth - f65_local16, f65_local20, f65_local16, f65_local17, 1 )
					else
						f65_local10( f65_local22, f65_local19, f65_local20, f65_local16, f65_local17, 1 )
						goto basicblock_84:
					end
				end
				if f65_local9( f65_local22, f65_local6, f65_local7 ) then
					if f65_local0 == 0 then
						table.insert( f65_local14, f65_local22 )
					end
					local f65_local19, f65_local20 = f65_local8( f65_local22 )
					if Engine.IsCurrentLanguageReversed() and f65_arg0.hCount == 1 and f65_arg0.originalListWidth ~= nil then
						f65_local10( f65_local22, f65_local19 + f65_arg0.originalListWidth - f65_local16, f65_local20, f65_local16, f65_local17, f65_local18, true )
					else
						f65_local10( f65_local22, f65_local19, f65_local20, f65_local16, f65_local17, f65_local18, true )
						goto basicblock_84:
					end
				end
				table.insert( f65_local14, f65_local22 )
			end
		end
	end
	f65_local11 = function ( f70_arg0, f70_arg1 )
		for f70_local3, f70_local4 in pairs( f70_arg1 ) do
			if LuaUtils.GetTableKeyForElement( f70_local4, f70_arg0 ) then
				return true
			end
		end
		return false
	end
	
	f65_local12 = f65_arg0.itemStencil:getFirstChild()
	while f65_local12 do
		if not LuaUtils.GetTableKeyForElement( f65_local14, f65_local12 ) and not f65_local11( f65_local12, f65_arg0.layoutItems ) then
			table.insert( f65_local14, f65_local12 )
		end
		f65_local12 = f65_local12:getNextSibling()
	end
	for f65_local25, f65_local26 in ipairs( f65_local14 ) do
		f65_arg0:removeItem( f65_local26 )
	end
	f65_local15 = 0
	f65_local13 = 0
	for f65_local24 = 1, math.min( f65_arg0.hCount, f65_arg0.requestedColumnCount ), 1 do
		if f65_local2[f65_arg0.currentStartColumn + f65_local24 - 1] then
			f65_local15 = f65_local15 + f65_local2[f65_arg0.currentStartColumn + f65_local24 - 1] + f65_arg0.spacing
		end
	end
	if f65_local15 ~= 0 then
		f65_local15 = f65_local15 - f65_arg0.spacing
	end
	for f65_local24 = 1, math.min( f65_arg0.vCount, f65_arg0.requestedRowCount ), 1 do
		if f65_local1[f65_arg0.currentStartRow + f65_local24 - 1] then
			f65_local13 = f65_local13 + f65_local1[f65_arg0.currentStartRow + f65_local24 - 1] + f65_arg0.spacing
		end
	end
	if f65_local13 ~= 0 then
		f65_local13 = f65_local13 - f65_arg0.spacing
	end
	if not f65_arg0.scrollbarDragging then
		f65_arg0:setWidth( f65_local15 )
		f65_arg0:setHeight( f65_local13 )
	end
	f65_arg0.width = f65_local15
	f65_arg0.height = f65_local13
	f65_arg0.lastFirstVisibleRow = f65_local4
	f65_arg0.lastFirstVisibleColumn = f65_local5
	f65_arg0:updateScrollbars()
end

LUI.GridLayout.createWidgetFromDataSource = function ( f71_arg0, f71_arg1, f71_arg2, f71_arg3 )
	local f71_local0 = nil
	if f71_arg3 and f71_arg3.new then
		f71_local0 = f71_arg3.new( f71_arg0.menu, f71_arg1 )
	else
		if not f71_arg0.widgetType then
			return nil
		elseif type( f71_arg0.widgetType ) == "string" then
			local f71_local1 = Engine.GetModel( f71_arg2, f71_arg0.widgetTypeDataSource )
			if f71_local1 ~= nil then
				local f71_local2 = LUI.getTableFromPath( Engine.GetModelValue( f71_local1 ) )
				if f71_local2 and f71_local2.new then
					f71_local0 = f71_local2.new( f71_arg0.menu, f71_arg1 )
				end
			end
		elseif type( f71_arg0.widgetType ) == "table" then
			f71_local0 = f71_arg0.widgetType.new( f71_arg0.menu, f71_arg1 )
		end
		if f71_local0 then
			f71_local0:mergeStateConditions( f71_arg0.elementStateConditions )
			f71_local0:setAlpha( 0 )
		end
	end
	if f71_local0 ~= nil then
		f71_arg0.itemStencil[f71_local0.id] = f71_local0
		LUI.OverrideFunction_CallOriginalFirst( f71_local0, "close", function ()
			f71_arg0.itemStencil[f71_local0.id] = nil
		end )
	end
	return f71_local0
end

LUI.GridLayout.getModelForIndex = function ( f73_arg0, f73_arg1 )
	local f73_local0 = f73_arg0:getDataSource()
	if not f73_local0 or not f73_local0.getCount then
		return nil
	elseif f73_arg1 and f73_arg1 <= f73_local0.getCount( f73_arg0 ) then
		return f73_local0.getItem( f73_arg0.controller, f73_arg0, f73_arg1 )
	else
		return nil
	end
end

LUI.GridLayout.getModelForPosition = function ( f74_arg0, f74_arg1, f74_arg2 )
	return f74_arg0:getModelForIndex( f74_arg0:GetTableIndexForPosition( f74_arg1, f74_arg2 ) )
end

LUI.GridLayout.getPropertiesForIndex = function ( f75_arg0, f75_arg1 )
	local f75_local0 = f75_arg0:getDataSource()
	if not f75_local0 or not f75_local0.getCount or not f75_local0.getCustomPropertiesForItem then
		return nil
	elseif f75_arg1 <= f75_local0.getCount( f75_arg0 ) then
		return f75_local0.getCustomPropertiesForItem( f75_arg0, f75_arg1 )
	else
		return nil
	end
end

LUI.GridLayout.getPropertiesForPosition = function ( f76_arg0, f76_arg1, f76_arg2 )
	return f76_arg0:getPropertiesForIndex( f76_arg0:GetTableIndexForPosition( f76_arg1, f76_arg2 ) )
end

LUI.GridLayout.updateCustomWidgetProperties = function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3 )
	if not f77_arg3 then
		return 
	elseif f77_arg3.gridInfoTable.customProperties then
		for f77_local3, f77_local4 in ipairs( f77_arg3.gridInfoTable.customProperties ) do
			f77_arg3[f77_local4] = nil
		end
	end
	local f77_local0 = f77_arg0:getPropertiesForPosition( f77_arg1, f77_arg2 )
	if f77_local0 then
		f77_arg3.gridInfoTable.customProperties = {}
		for f77_local4, f77_local5 in pairs( f77_local0 ) do
			if f77_local4 == "id" then
				f0_local9( f77_arg0.itemStencil, f77_arg3, f77_local5 )
			else
				f77_arg3[f77_local4] = f77_local5
			end
		end
	end
end

LUI.GridLayout.createWidgetForPosition = function ( f78_arg0, f78_arg1, f78_arg2, f78_arg3, f78_arg4 )
	local f78_local0 = f78_arg0:getDataSource()
	if not f78_local0 or not f78_local0.getCount then
		return nil
	end
	local f78_local1 = f78_local0.getCount( f78_arg0 )
	local f78_local2 = f78_arg0:GetTableIndexForPosition( f78_arg1, f78_arg2 )
	if f78_local2 and f78_local2 <= f78_local1 then
		local f78_local3 = f78_arg0:getModelForIndex( f78_local2 )
		local f78_local4 = nil
		local f78_local5 = f78_arg0:getPropertiesForPosition( f78_arg1, f78_arg2 )
		if f78_local5 and f78_local5.customWidgetOverride then
			f78_local4 = f78_local5.customWidgetOverride
		elseif f78_local0.getWidgetTypeForItem then
			f78_local4 = f78_local0.getWidgetTypeForItem( f78_arg0, f78_local3, f78_arg1, f78_arg2 )
		end
		local f78_local6 = f78_arg0:createWidgetFromDataSource( f78_arg0.controller, f78_local3, f78_local4 )
		if f78_local6 ~= nil then
			if f78_local3 then
				f78_local6:setModel( f78_local3 )
			end
			local f78_local7
			if f78_local5 then
				f78_local7 = f78_local5.rowSpan
				if not f78_local7 then
				
				else
					local f78_local8
					if f78_local5 then
						f78_local8 = f78_local5.columnSpan
						if not f78_local8 then
						
						else
							if not f78_arg0:setItemAtPosition( f78_local6, f78_arg0.rowColumnIndexMap[f78_arg1][f78_arg2].startRow, f78_arg0.rowColumnIndexMap[f78_arg1][f78_arg2].startColumn, false, f78_arg3, f78_arg4, f78_local7, f78_local8 ) then
								f78_local6:close()
								return nil
							end
							f78_arg0:updateCustomWidgetProperties( f78_arg1, f78_arg2, f78_local6 )
							if f78_local3 then
								local f78_local9 = Engine.GetModel( f78_local3, "customId" )
								if f78_local9 then
									f0_local9( f78_arg0.itemStencil, f78_local6, Engine.GetModelValue( f78_local9 ) )
								end
							end
							if f78_arg0.menuLoaded then
								f78_local6:processEvent( {
									name = "menu_loaded",
									menu = f78_arg0.menu,
									controller = f78_arg0.controller
								} )
							end
							f78_local6:processEvent( {
								name = "update_state",
								menu = f78_arg0.menu
							} )
							if f78_arg0.menuOpened then
								f78_local6:processEvent( {
									name = "menu_opened",
									menu = f78_arg0.menu,
									controller = f78_arg0.controller
								} )
							end
							return f78_local6
						end
					end
					f78_local8 = 1
				end
			end
			f78_local7 = 1
		end
	end
	return nil
end

LUI.GridLayout.updateDataSource = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3 )
	f79_arg0.itemCount = 0
	f79_arg0.rowColumnIndexMap = {}
	local f79_local0 = f79_arg0:getDataSource()
	if not f79_local0 or not f79_local0.getCount or not f79_local0.getItem then
		return 
	elseif not f79_arg0.widgetType then
		return 
	elseif f79_local0.prepare and (not f79_arg0.prepared or not f79_arg3) then
		f79_arg0.prepared = true
		f79_local0.prepare( f79_arg0.controller, f79_arg0, f79_arg0.filter )
	end
	if f79_arg0.hCount > 1 and f79_arg0.vCount > 1 then
		f79_arg0.itemCount = f79_local0.getCount( f79_arg0 )
		f79_arg0.requestedRowCount = 1
		f79_arg0.requestedColumnCount = 0
	elseif f79_arg0.vCount > 1 then
		f79_arg0.itemCount = f79_local0.getCount( f79_arg0 )
		f79_arg0.requestedRowCount = 0
		f79_arg0.requestedColumnCount = 1
	elseif f79_arg0.hCount >= 1 then
		f79_arg0.itemCount = f79_local0.getCount( f79_arg0 )
		f79_arg0.requestedRowCount = 1
		f79_arg0.requestedColumnCount = 0
	else
		return 
	end
	if not f79_arg2 then
		f79_arg0:clearLayout( true, false )
	end
	local f79_local1, f79_local2, f79_local3 = nil
	local f79_local4 = 1
	local f79_local5 = 1
	local f79_local6 = function ( f80_arg0, f80_arg1, f80_arg2 )
		return {
			index = f80_arg0,
			startRow = f80_arg1,
			startColumn = f80_arg2
		}
	end
	
	for f79_local7 = 1, f79_arg0.itemCount, 1 do
		local f79_local10 = f79_arg0:getPropertiesForIndex( f79_local7 )
		local f79_local11 = 1
		local f79_local12 = 1
		if f79_local10 then
			if not f79_local2 and f79_local10.selectIndex then
				f79_local10.selectIndex = false
				f79_local2 = f79_local4
				f79_local3 = f79_local5
			end
			f79_local11 = f79_local10.rowSpan or 1
			f79_local12 = f79_local10.columnSpan or 1
		end
		if f79_arg0.hCount > 1 and f79_arg0.vCount > 1 then
			if f79_arg0.hCount < f79_local5 + f79_local12 - 1 then
				f79_local4 = f79_local4 + 1
				if f79_arg0.rowColumnIndexMap[f79_local4] then
					local f79_local13 = #f79_arg0.rowColumnIndexMap[f79_local4] + 1
				end
				f79_local5 = f79_local13 or 1
			end
			local f79_local14 = f79_local4
			local f79_local15 = f79_local5
			for f79_local16 = 0, f79_local11 - 1, 1 do
				if not f79_arg0.rowColumnIndexMap[f79_local4 + f79_local16] then
					f79_arg0.rowColumnIndexMap[f79_local4 + f79_local16] = {}
				end
				for f79_local19 = 0, f79_local12 - 1, 1 do
					f79_arg0.rowColumnIndexMap[f79_local4 + f79_local16][f79_local5 + f79_local19] = f79_local6( f79_local7, f79_local14, f79_local15 )
				end
			end
			f79_local5 = f79_local5 + f79_local12
			f79_arg0.requestedColumnCount = math.max( f79_arg0.requestedColumnCount, f79_local5 - 1 )
			f79_arg0.requestedRowCount = math.max( f79_arg0.requestedRowCount, f79_local4 + f79_local11 - 1 )
		end
		if f79_arg0.vCount > 1 then
			local f79_local14 = f79_local4
			local f79_local15 = f79_local5
			for f79_local16 = 1, f79_local11, 1 do
				local f79_local22 = f79_local16
				if not f79_arg0.rowColumnIndexMap[f79_local4] then
					f79_arg0.rowColumnIndexMap[f79_local4] = {}
				end
				f79_arg0.rowColumnIndexMap[f79_local4][f79_local5] = f79_local6( f79_local7, f79_local14, f79_local15 )
				f79_arg0.requestedRowCount = f79_local4
				f79_local4 = f79_local4 + 1
			end
		end
		if f79_arg0.hCount >= 1 then
			if not f79_arg0.rowColumnIndexMap[f79_local4] then
				f79_arg0.rowColumnIndexMap[f79_local4] = {}
			end
			local f79_local14 = f79_local4
			local f79_local15 = f79_local5
			for f79_local16 = 1, f79_local12, 1 do
				local f79_local22 = f79_local16
				f79_arg0.rowColumnIndexMap[f79_local4][f79_local5] = f79_local6( f79_local7, f79_local14, f79_local15 )
				f79_arg0.requestedColumnCount = f79_local5
				f79_local5 = f79_local5 + 1
			end
		end
	end
	f79_arg0:processEvent( {
		name = "update_state",
		menu = f79_arg0.menu
	} )
	if f79_local2 then
		f79_local1 = f79_arg0:getItemAtPosition( f79_local2, f79_local3, true )
	end
	if not f79_local1 and f79_arg0.savedActiveIndex and not f79_arg1 then
		local f79_local7, f79_local8 = f79_arg0:getRowAndColumnForIndex( f79_arg0.savedActiveIndex )
		f79_local1 = f79_arg0:getItemAtPosition( f79_local7, f79_local8, true )
	end
	if not f79_local1 and (f79_arg0.hasListFocus or f79_arg0.setActiveOnUpdate) and not f79_arg1 then
		f79_local1 = f79_arg0:getFirstSelectableItem()
	end
	if f79_local1 then
		f79_local7 = nil
		if f79_local2 ~= nil then
			f79_local7 = 0
		end
		f79_arg0:setActiveItem( f79_local1, f79_local7 )
	else
		f79_arg0:updateScrollbars()
		f79_arg0:updateCounters()
		if f79_arg0.itemCount == 0 then
			f79_arg0:setActiveItem( nil, 0 )
		end
	end
	f79_arg0:dispatchEventToParent( {
		name = "grid_updated",
		grid = f79_arg0
	} )
	return true
end

LUI.GridLayout.close = function ( f81_arg0 )
	f81_arg0:unsubscribeFromAllModels()
	f81_arg0:clearLayout( true, false )
	local f81_local0 = f81_arg0:getDataSource()
	LUI.GridLayout.super.close( f81_arg0 )
	if f81_local0 and f81_local0.cleanup then
		f81_local0.cleanup( f81_arg0 )
	end
end

LUI.GridLayout.updateState = function ( f82_arg0, f82_arg1 )
	LUI.GridLayout.super.updateState( f82_arg0, f82_arg1 )
	f82_arg0:updateLayout( 0 )
end

LUI.GridLayout:registerEventHandler( "update_state", LUI.GridLayout.updateState )
LUI.GridLayout.menuLoaded = function ( f83_arg0, f83_arg1 )
	f83_arg0.menuLoaded = true
	f83_arg0:dispatchEventToChildren( f83_arg1 )
end

LUI.GridLayout:registerEventHandler( "menu_loaded", LUI.GridLayout.menuLoaded )
LUI.GridLayout.menuOpened = function ( f84_arg0, f84_arg1 )
	f84_arg0.menuOpened = true
	f84_arg0:dispatchEventToChildren( f84_arg1 )
end

LUI.GridLayout:registerEventHandler( "menu_opened", LUI.GridLayout.menuOpened )
LUI.GridLayout.setActiveOnUpdate = true
LUI.GridLayout.id = "LUIGridLayout"
