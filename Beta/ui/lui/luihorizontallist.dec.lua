LUI.UIHorizontalList = {}
local LUI_UIHorizontalList_AddSpacer = function ( self, units, priority )
	local spacer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = units,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	spacer:setPriority( priority )
	self:addElement( spacer )
	return spacer
end

LUI.UIHorizontalList.new = function ( defaultAnimationState )
	local list = LUI.UIElement.new( defaultAnimationState )
	list.id = "LUIHorizontalList"
	list:setupUIHorizontalList()
	list.addSpacer = LUI_UIHorizontalList_AddSpacer
	list.addElement = LUI.UIHorizontalList.AddElement
	list.removeElement = LUI.UIHorizontalList.RemoveElement
	list:registerEventHandler( "gain_focus", LUI.UIHorizontalList.gainFocus )
	return list
end

LUI.UIHorizontalList.AddElement = function ( self, newChildElement )
	LUI.UIElement.addElement( self, newChildElement )
	self:setLayoutCached( false )
	LUI.UIHorizontalList.UpdateNavigation( self )
end

LUI.UIHorizontalList.RemoveElement = function ( self, childElementToRemove )
	LUI.UIElement.removeElement( self, childElementToRemove )
	self:setLayoutCached( false )
	LUI.UIHorizontalList.UpdateNavigation( self )
end

LUI.UIHorizontalList.UpdateNavigation = function ( self )
	local firstFocusable, lastFocusable = nil
	local childElement = self:getFirstChild()
	while childElement ~= nil do
		if childElement.m_focusable then
			if firstFocusable == nil then
				firstFocusable = childElement
			end
			if lastFocusable ~= nil then
				lastFocusable.navigation.right = childElement
				childElement.navigation.left = lastFocusable
			end
			if childElement.navigation ~= nil and self.navigation ~= nil then
				if childElement.navigation.down == nil and self.navigation.down ~= nil then
					childElement.navigation.down = self.navigation.down
				end
				if childElement.navigation.up == nil and self.navigation.up ~= nil then
					childElement.navigation.up = self.navigation.up
				end
			end
			lastFocusable = childElement
		end
		childElement = childElement:getNextSibling()
	end
	if lastFocusable ~= nil then
		if self.navigation ~= nil and self.navigation.right ~= nil and self.navigation.right.m_focusable == true then
			lastFocusable.navigation.right = self.navigation.right
			self.navigation.right.navigation.left = lastFocusable
		elseif lastFocusable ~= firstFocusable then
			lastFocusable.navigation.right = firstFocusable
			firstFocusable.navigation.left = lastFocusable
		end
		if self.navigation ~= nil and self.navigation.left ~= nil and self.navigation.left.m_focusable == true then
			firstFocusable.navigation.left = self.navigation.left
			self.navigation.left.navigation.right = firstFocusable
		end
	end
end

LUI.UIHorizontalList.gainFocus = function ( self )
	local firstFocusable = nil
	local childElement = self:getFirstChild()
	while childElement ~= nil do
		if childElement.m_focusable and firstFocusable == nil then
			firstFocusable = childElement
		end
		childElement = childElement:getNextSibling()
	end
	if firstFocusable ~= nil then
		return firstFocusable:processEvent( {
			name = "gain_focus"
		} )
	else
		return false
	end
end

