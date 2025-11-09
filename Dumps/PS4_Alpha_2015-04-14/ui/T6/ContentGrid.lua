require( "ui.T6.ContentGridButton" )

CoD.ContentGrid = {}
CoD.ContentGrid.Spacing = 5
CoD.ContentGrid.ItemSize = 100
CoD.ContentGrid.ItemWidth = 110
CoD.ContentGrid.ItemHeight = 90
CoD.ContentGrid.new = function ( numItemsWide, defaultAnimationState, itemWidth, itemHeight, spacing )
	if CoD.ContentGrid.HighlightMaterial == nil then
		CoD.ContentGrid.HighlightMaterial = RegisterMaterial( "menu_select_highlight" )
	end
	local self = LUI.UIElement.new( defaultAnimationState )
	if spacing == nil then
		spacing = CoD.ContentGrid.Spacing
	end
	if itemWidth == nil then
		itemWidth = CoD.ContentGrid.ItemWidth
	end
	if itemHeight == nil then
		itemHeight = CoD.ContentGrid.ItemHeight
	end
	self.numItemsWide = numItemsWide
	self.spacing = spacing
	self.itemWidth = itemWidth
	self.itemHeight = itemHeight
	self.buttons = {}
	self.addButton = CoD.ContentGrid.AddButton
	return self
end

CoD.ContentGrid.AddButton = function ( self, button )
	local numItemsWide = self.numItemsWide
	local buttonNumber = #self.buttons
	local buttonX = buttonNumber % numItemsWide
	local buttonY = (buttonNumber - buttonX) / numItemsWide
	local itemWidth = self.itemWidth
	local itemHeight = self.itemHeight
	local spacing = self.spacing
	local left = buttonX * (itemWidth + spacing)
	local top = buttonY * (itemHeight + spacing)
	button:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = false,
		left = left,
		right = left + itemWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = top,
		bottom = top + itemHeight,
		xRot = 0,
		yRot = 0,
		zRot = 0,
		zoom = 0
	} )
	button:animateToState( "default" )
	button.itemHeight = itemHeight
	button.itemWidth = itemWidth
	if buttonX > 0 then
		CoD.ContentGrid.SetNavigation( self, button, buttonNumber, "left", "right" )
	end
	CoD.ContentGrid.SetNavigation( self, button, buttonNumber - buttonX + 1, "right", "left" )
	CoD.ContentGrid.SetNavigation( self, button, buttonNumber - numItemsWide + 1, "up", "down" )
	CoD.ContentGrid.SetNavigation( self, button, buttonX + 1, "down", "up" )
	table.insert( self.buttons, button )
	self:addElement( button )
	return button
end

CoD.ContentGrid.SetNavigation = function ( self, button, buttonNumber, to, from )
	local otherButton = self.buttons[buttonNumber]
	if otherButton ~= nil and otherButton ~= button then
		button.navigation[to] = otherButton
		otherButton.navigation[from] = button
	end
end

