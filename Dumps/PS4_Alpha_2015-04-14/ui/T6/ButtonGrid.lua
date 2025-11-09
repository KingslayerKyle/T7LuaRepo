CoD.ButtonGrid = {}
CoD.ButtonGrid.Spacing = 12
CoD.ButtonGrid.ItemSize = 65
CoD.ButtonGrid.UnselectedAlpha = 0.15
CoD.ButtonGrid.AppearTime = 50
CoD.ButtonGrid.FadeInTime = 200
CoD.ButtonGrid.DisappearTime = 50
CoD.ButtonGrid.FadeOutTime = 200
local CoD_ButtonGrid_SetNavigation = nil
CoD.ButtonGrid.new = function ( numItemsWide, defaultAnimationState, itemWidth, itemHeight, spacing )
	if CoD.ButtonGrid.HighlightMaterial == nil then
		CoD.ButtonGrid.HighlightMaterial = RegisterMaterial( "menu_select_highlight" )
	end
	local self = LUI.UIElement.new( defaultAnimationState )
	if spacing == nil then
		spacing = CoD.ButtonGrid.Spacing
	end
	if itemWidth == nil then
		itemWidth = CoD.ButtonGrid.ItemSize
	end
	if itemHeight == nil then
		itemHeight = CoD.ButtonGrid.ItemSize
	end
	self.numItemsWide = numItemsWide
	self.spacing = spacing
	self.itemWidth = itemWidth
	self.itemHeight = itemHeight
	self.buttons = {}
	self.animateIn = CoD.ButtonGrid.AnimateIn
	self.animateOut = CoD.ButtonGrid.AnimateOut
	self.addButton = CoD.ButtonGrid.AddButton
	self:registerEventHandler( "animate_in_next", CoD.ButtonGrid.AnimateInNext )
	self:registerEventHandler( "animate_out_next", CoD.ButtonGrid.AnimateOutNext )
	return self
end

CoD.ButtonGrid.AnimateIn = function ( self, transitionX, transitionY )
	local animateOutTimer = self.animateOutTimer
	if animateOutTimer ~= nil then
		animateOutTimer:close()
		self.animateOutTimer = nil
	end
	self.m_inputDisabled = nil
	for index, button in pairs( self.buttons ) do
		button.flash:animateToState( "default" )
	end
	if transitionX == nil then
		transitionX = 0
	end
	if transitionY == nil then
		transitionY = 0
	end
	self.transitionX = transitionX
	self.transitionY = transitionY
	self.currentButtonNumber = 0
	self.numItemsTransitioned = 0
	local animateInTimer = LUI.UITimer.new( CoD.ButtonGrid.AppearTime, "animate_in_next", nil, self )
	self.animateInTimer = animateInTimer
	self:addElement( animateInTimer )
	CoD.ButtonGrid.AnimateInNext( self )
	Engine.PlaySound( "uin_navigation_wpn_alt" )
end

CoD.ButtonGrid.AnimateOut = function ( self )
	local animateInTimer = self.animateInTimer
	if animateInTimer ~= nil then
		animateInTimer:close()
		self.animateInTimer = nil
	end
	self.m_inputDisabled = true
	local buttonInFocus = 0
	for index, button in pairs( self.buttons ) do
		if button:isInFocus() then
			buttonInFocus = index - 1
			break
		end
	end
	local numItemsWide = self.numItemsWide
	local startingButtonX = buttonInFocus % numItemsWide
	local startingButtonY = (buttonInFocus - startingButtonX) / numItemsWide
	self.transitionX = startingButtonX
	self.transitionY = startingButtonY
	self.currentButtonNumber = 0
	self.numItemsTransitioned = 0
	local animateOutTimer = LUI.UITimer.new( CoD.ButtonGrid.DisappearTime, "animate_out_next", nil, self )
	self.animateOutTimer = animateOutTimer
	self:addElement( animateOutTimer )
	CoD.ButtonGrid.AnimateOutNext( self )
	return startingButtonX, startingButtonY
end

CoD.ButtonGrid.AnimateInNext = function ( self, event )
	local currentButtonNumber = self.currentButtonNumber
	local numItemsTransitioned = self.numItemsTransitioned
	if numItemsTransitioned == #self.buttons then
		self.animateInTimer:close()
		return 
	end
	local numItemsWide = self.numItemsWide
	local transitionX = self.transitionX
	local transitionY = self.transitionY
	for index, button in pairs( self.buttons ) do
		local buttonNumber = index - 1
		local buttonX = buttonNumber % numItemsWide
		local buttonY = (buttonNumber - buttonX) / numItemsWide
		local distance = math.abs( buttonX - transitionX ) + math.abs( buttonY - transitionY )
		if distance == currentButtonNumber then
			local flash = button.flash
			button:animateToState( "fade_in" )
			flash:animateToState( "fade_in" )
			flash:animateToState( "default", CoD.ButtonGrid.FadeInTime )
			numItemsTransitioned = numItemsTransitioned + 1
		end
	end
	self.currentButtonNumber = currentButtonNumber + 1
	self.numItemsTransitioned = numItemsTransitioned
end

CoD.ButtonGrid.AnimateOutNext = function ( self, event )
	local currentButtonNumber = self.currentButtonNumber
	if currentButtonNumber == nil then
		self.animateOutTimer:close()
		self.m_inputDisabled = nil
		self:close()
		return 
	end
	local numItemsTransitioned = self.numItemsTransitioned
	if numItemsTransitioned == #self.buttons then
		local animateOutTimer = self.animateOutTimer
		animateOutTimer.interval = CoD.ButtonGrid.FadeOutTime
		animateOutTimer:reset()
		self.currentButtonNumber = nil
		return 
	end
	local numItemsWide = self.numItemsWide
	local transitionX = self.transitionX
	local transitionY = self.transitionY
	for index, button in pairs( self.buttons ) do
		local buttonNumber = index - 1
		local buttonX = buttonNumber % numItemsWide
		local buttonY = (buttonNumber - buttonX) / numItemsWide
		local distance = math.abs( buttonX - transitionX ) + math.abs( buttonY - transitionY )
		if distance == currentButtonNumber then
			local flash = button.flash
			flash:animateToState( "fade_in" )
			flash:animateToState( "default", CoD.ButtonGrid.FadeOutTime )
			button:animateToState( "fade_out" )
			numItemsTransitioned = numItemsTransitioned + 1
		end
	end
	self.currentButtonNumber = currentButtonNumber + 1
	self.numItemsTransitioned = numItemsTransitioned
end

CoD.ButtonGrid.AddButton = function ( self )
	local numItemsWide = self.numItemsWide
	local buttonNumber = #self.buttons
	local buttonX = buttonNumber % numItemsWide
	local buttonY = (buttonNumber - buttonX) / numItemsWide
	local itemWidth = self.itemWidth
	local itemHeight = self.itemHeight
	local spacing = self.spacing
	local left = buttonX * (itemWidth + spacing)
	local top = buttonY * (itemHeight + spacing)
	local button = CoD.BracketButton.new( {
		left = left,
		top = top,
		right = left + itemWidth,
		bottom = top + itemHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	button:registerAnimationState( "fade_out", {
		alphaMultiplier = 0
	} )
	button:registerAnimationState( "fade_in", {
		alphaMultiplier = 1
	} )
	button:animateToState( "fade_out" )
	if buttonX > 0 then
		CoD_ButtonGrid_SetNavigation( self, button, buttonNumber, "left", "right" )
	end
	CoD_ButtonGrid_SetNavigation( self, button, buttonNumber - buttonX + 1, "right", "left" )
	CoD_ButtonGrid_SetNavigation( self, button, buttonNumber - numItemsWide + 1, "up", "down" )
	CoD_ButtonGrid_SetNavigation( self, button, buttonX + 1, "down", "up" )
	local background = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = 0,
		green = 0,
		blue = 0,
		alpha = CoD.slotContainerAlpha
	} )
	button:addElement( background )
	background = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 0,
		material = CoD.ButtonGrid.HighlightMaterial
	} )
	button:addElement( background )
	background:registerAnimationState( "selected", {
		alpha = 1
	} )
	button.background = background
	
	local flash = LUI.UIImage.new( {
		left = left,
		top = top,
		right = left + itemWidth,
		bottom = top + itemHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0
	} )
	flash:setPriority( 50 )
	flash:registerAnimationState( "fade_in", {
		alpha = 0.5
	} )
	self:addElement( flash )
	button.flash = flash
	
	table.insert( self.buttons, button )
	self:addElement( button )
	return button
end

CoD_ButtonGrid_SetNavigation = function ( self, button, buttonNumber, to, from )
	local otherButton = self.buttons[buttonNumber]
	if otherButton ~= nil and otherButton ~= button then
		button.navigation[to] = otherButton
		otherButton.navigation[from] = button
	end
end

