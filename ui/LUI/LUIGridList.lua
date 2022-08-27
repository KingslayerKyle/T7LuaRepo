-- 5c142da90ab05937816d384c051b38f3
-- This hash is used for caching, delete to decompile the file again

LUI.UIGridList = {}
LUI.UIGridList.RowHeight = 70
LUI.UIGridList.Spacing = 10
local f0_local0 = function ( f1_arg0 )
	for f1_local0 = 1, f1_arg0.numRows, 1 do
		f1_arg0.data[f1_local0] = LUI.UIHorizontalList.new()
		f1_arg0.data[f1_local0]:setLeftRight( true, true, 0, 0 )
		f1_arg0.data[f1_local0]:setTopBottom( true, false, (f1_arg0.rowHeight + f1_arg0.spacing) * (f1_local0 - 1), (f1_arg0.rowHeight + f1_arg0.spacing) * (f1_local0 - 1) + f1_arg0.rowHeight )
		f1_arg0.data[f1_local0]:setSpacing( LUI.UIGridList.Spacing )
		f1_arg0.data:addElement( f1_arg0.data[f1_local0] )
	end
	f1_arg0.data[1]:processEvent( {
		name = "gain_focus"
	} )
end

LUI.UIGridList.new = function ( f2_arg0, f2_arg1, f2_arg2 )
	local self = LUI.UIElement.new( f2_arg0 )
	self.id = "UIGridList"
	self.numRows = f2_arg1
	self.numCols = f2_arg2
	self.setNumRows = LUI.UIGridList.SetNumRows
	self.setNumCols = LUI.UIGridList.SetNumCols
	self.spacing = LUI.UIGridList.Spacing
	self.rowHeight = LUI.UIGridList.RowHeight
	self.addElementToRow = LUI.UIGridList.AddElementToRow
	self.setSpacing = LUI.UIGridList.SetSpacing
	self.setGridRowHeight = LUI.UIGridList.SetGridRowHeight
	self:registerEventHandler( "gain_focus", LUI.UIGridList.gainFocus )
	self.data = LUI.UIContainer.new()
	self:addElement( self.data )
	if f2_arg1 ~= nil then
		f0_local0( self )
	end
	return self
end

LUI.UIGridList.SetNumRows = function ( f3_arg0, f3_arg1 )
	f3_arg0.numRows = f3_arg1
	f0_local0( f3_arg0 )
end

LUI.UIGridList.SetNumCols = function ( f4_arg0, f4_arg1 )
	f4_arg0.numCols = f4_arg1
end

local f0_local1 = function ( f5_arg0 )
	for f5_local0 = 1, f5_arg0.numRows, 1 do
		f5_arg0.data[f5_local0]:setTopBottom( true, false, (f5_arg0.rowHeight + f5_arg0.spacing) * (f5_local0 - 1), (f5_arg0.rowHeight + f5_arg0.spacing) * (f5_local0 - 1) + f5_arg0.rowHeight )
		f5_arg0.data[f5_local0]:setSpacing( f5_arg0.spacing )
	end
end

LUI.UIGridList.SetSpacing = function ( f6_arg0, f6_arg1 )
	f6_arg0.spacing = f6_arg1
	f0_local1( f6_arg0 )
end

LUI.UIGridList.SetGridRowHeight = function ( f7_arg0, f7_arg1 )
	f7_arg0.rowHeight = f7_arg1
	f0_local1( f7_arg0 )
end

LUI.UIGridList.AddElementToRow = function ( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg0.numRows < f8_arg2 or f8_arg2 < 1 then
		error( "LUI Error: Invalid value for rowIndex" )
	end
	local f8_local0 = f8_arg0.data[f8_arg2]:getNumChildren()
	if f8_arg0.numCols < f8_local0 then
		error( "LUI Error: Trying to add more children to the row than maximum." )
	end
	f8_arg0.data[f8_arg2][f8_local0 + 1] = f8_arg1
	f8_arg0.data[f8_arg2]:addElement( f8_arg1 )
	LUI.UIGridList.UpdateNavigation( f8_arg0 )
end

LUI.UIGridList.UpdateNavigation = function ( f9_arg0 )
	local f9_local0, f9_local1, f9_local2, f9_local3, f9_local4, f9_local5 = nil
	for f9_local6 = 1, f9_arg0.numRows, 1 do
		f9_local4 = f9_arg0.data[f9_local6]
		f9_local5 = f9_local4:getNumChildren()
		if f9_arg0.chainRows and f9_local5 ~= 0 then
			f9_local4[1].navigation.left = nil
			f9_local4[f9_local5].navigation.right = nil
		end
		if f9_local6 == 1 then
			f9_local0 = nil
			f9_local1 = 0
		else
			f9_local0 = f9_arg0.data[f9_local6 - 1]
			f9_local1 = f9_local0:getNumChildren()
		end
		if f9_local6 == f9_arg0.numRows then
			f9_local2 = nil
			f9_local3 = 0
		else
			f9_local2 = f9_arg0.data[f9_local6 + 1]
			f9_local3 = f9_local2:getNumChildren()
		end
		for f9_local9 = 1, f9_arg0.numCols, 1 do
			if f9_local9 <= f9_local5 then
				if f9_local0 == nil or f9_local1 < f9_local9 or not f9_local0[f9_local9].m_focusable then
					f9_local4[f9_local9].navigation.up = nil
				else
					f9_local4[f9_local9].navigation.up = f9_local0[f9_local9]
				end
				if f9_local2 == nil or f9_local3 < f9_local9 or not f9_local2[f9_local9].m_focusable then
					f9_local4[f9_local9].navigation.down = nil
				else
					f9_local4[f9_local9].navigation.down = f9_local2[f9_local9]
				end
			end
		end
		if f9_arg0.chainRows then
			if f9_local0 ~= nil and f9_local5 ~= 0 then
				f9_local4[1].navigation.left = f9_local0[f9_local1]
			end
			if f9_local2 ~= nil and f9_local5 ~= 0 then
				f9_local4[f9_local5].navigation.right = f9_local2[1]
			end
		end
	end
end

LUI.UIGridList.gainFocus = function ( f10_arg0 )
	return f10_arg0.data[1]:processEvent( {
		name = "gain_focus"
	} )
end

