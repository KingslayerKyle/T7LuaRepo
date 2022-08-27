-- 88112b308ad70893aca455c81ab95042
-- This hash is used for caching, delete to decompile the file again

LUI.UIHorizontalList = {}
local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = f1_arg1,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self:setPriority( f1_arg2 )
	f1_arg0:addElement( self )
	return self
end

LUI.UIHorizontalList.new = function ( f2_arg0 )
	local self = LUI.UIElement.new( f2_arg0 )
	self.id = "LUIHorizontalList"
	self:setupUIHorizontalList()
	self.addSpacer = f0_local0
	self.addElement = LUI.UIHorizontalList.AddElement
	self.removeElement = LUI.UIHorizontalList.RemoveElement
	self:registerEventHandler( "gain_focus", LUI.UIHorizontalList.gainFocus )
	return self
end

LUI.UIHorizontalList.AddElement = function ( f3_arg0, f3_arg1 )
	LUI.UIElement.addElement( f3_arg0, f3_arg1 )
	f3_arg0:setLayoutCached( false )
	LUI.UIHorizontalList.UpdateNavigation( f3_arg0 )
end

LUI.UIHorizontalList.RemoveElement = function ( f4_arg0, f4_arg1 )
	LUI.UIElement.removeElement( f4_arg0, f4_arg1 )
	f4_arg0:setLayoutCached( false )
	LUI.UIHorizontalList.UpdateNavigation( f4_arg0 )
end

LUI.UIHorizontalList.UpdateNavigation = function ( f5_arg0 )
	local f5_local0, f5_local1 = nil
	local f5_local2 = f5_arg0:getFirstChild()
	while f5_local2 ~= nil do
		if f5_local2.m_focusable then
			if f5_local0 == nil then
				f5_local0 = f5_local2
			end
			if f5_local1 ~= nil then
				f5_local1.navigation.right = f5_local2
				f5_local2.navigation.left = f5_local1
			end
			if f5_local2.navigation ~= nil and f5_arg0.navigation ~= nil then
				if f5_local2.navigation.down == nil and f5_arg0.navigation.down ~= nil then
					f5_local2.navigation.down = f5_arg0.navigation.down
				end
				if f5_local2.navigation.up == nil and f5_arg0.navigation.up ~= nil then
					f5_local2.navigation.up = f5_arg0.navigation.up
				end
			end
			f5_local1 = f5_local2
		end
		f5_local2 = f5_local2:getNextSibling()
	end
	if f5_local1 ~= nil then
		if f5_arg0.navigation ~= nil and f5_arg0.navigation.right ~= nil and f5_arg0.navigation.right.m_focusable == true then
			f5_local1.navigation.right = f5_arg0.navigation.right
			f5_arg0.navigation.right.navigation.left = f5_local1
		elseif f5_local1 ~= f5_local0 then
			f5_local1.navigation.right = f5_local0
			f5_local0.navigation.left = f5_local1
		end
		if f5_arg0.navigation ~= nil and f5_arg0.navigation.left ~= nil and f5_arg0.navigation.left.m_focusable == true then
			f5_local0.navigation.left = f5_arg0.navigation.left
			f5_arg0.navigation.left.navigation.right = f5_local0
		end
	end
end

LUI.UIHorizontalList.gainFocus = function ( f6_arg0 )
	local f6_local0 = nil
	local f6_local1 = f6_arg0:getFirstChild()
	while f6_local1 ~= nil do
		if f6_local1.m_focusable and f6_local0 == nil then
			f6_local0 = f6_local1
		end
		f6_local1 = f6_local1:getNextSibling()
	end
	if f6_local0 ~= nil then
		return f6_local0:processEvent( {
			name = "gain_focus"
		} )
	else
		return false
	end
end

