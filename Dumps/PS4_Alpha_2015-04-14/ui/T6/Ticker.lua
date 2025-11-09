if CoD == nil then
	CoD = {}
end
CoD.Ticker = {}
local CoD_Ticker_Reset = function ( self, duration )
	local index = 1
	local tickerItem = self.verticalList:getFirstChild()
	while tickerItem ~= nil do
		if index == 1 then
			tickerItem.categoryItem:animateToState( "default" )
			tickerItem.textItem:animateToState( "default" )
		elseif index == 2 then
			tickerItem.categoryItem:animateToState( "fading", duration )
			tickerItem.textItem:animateToState( "fading", duration )
		else
			tickerItem.categoryItem:animateToState( "faded", duration )
			tickerItem.textItem:animateToState( "faded", duration )
		end
		index = index + 1
		tickerItem = tickerItem:getNextSibling()
	end
end

local CoD_Ticker_Tick = function ( self, event )
	local lastElement = self.verticalList:getLastChild()
	while lastElement.disposable do
		lastElement:close()
		lastElement = self.verticalList:getLastChild()
	end
	lastElement:close()
	lastElement:setPriority( -10000 )
	self.verticalList:addElement( lastElement )
	lastElement:setPriority( nil )
	self:scrollY( -self.itemHeight, 0 )
	self:scrollY( 0, 1000, true, true )
	self:reset( 1000 )
end

local CoD_Ticker_AddMessage = function ( self, category, text, disposable )
	local textSize = self.itemHeight
	local font = CoD.fonts.Condensed
	local categoryWidth = 130
	local newItem = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = textSize,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	} )
	self.verticalList:addElement( newItem )
	newItem.categoryItem = LUI.UIText.new( {
		left = 0,
		top = 0,
		bottom = textSize,
		right = categoryWidth,
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = font,
		red = CoD.orange.r,
		green = CoD.orange.g,
		blue = CoD.orange.b,
		alpha = 1
	} )
	newItem:addElement( newItem.categoryItem )
	newItem.categoryItem:setText( category )
	newItem.categoryItem:registerAnimationState( "fading", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.25
	} )
	newItem.categoryItem:registerAnimationState( "faded", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.05
	} )
	newItem.textItem = LUI.UIText.new( {
		left = 0,
		top = 0,
		bottom = textSize,
		right = 10000,
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = font,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	newItem:addElement( newItem.textItem )
	newItem.textItem:setText( text )
	newItem.textItem:registerAnimationState( "fading", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.25
	} )
	newItem.textItem:registerAnimationState( "faded", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.05
	} )
	if disposable then
		self.timer:reset()
		CoD_Ticker_Tick( self )
		newItem.disposable = true
	end
end

CoD.Ticker.new = function ( defaultAnimationState, itemHeight, scrollInterval )
	local ticker = LUI.UIScrollable.new( defaultAnimationState, 10000, 10000 )
	ticker.itemHeight = itemHeight
	ticker.verticalList = LUI.UIVerticalList.new( {
		left = 0,
		right = 0,
		top = 0,
		bottom = 10000,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false
	} )
	ticker:addElement( ticker.verticalList )
	ticker.timer = LUI.UITimer.new( scrollInterval, "ticker_tick" )
	LUI.UIElement.addElement( ticker, ticker.timer )
	ticker:registerEventHandler( "ticker_tick", CoD_Ticker_Tick )
	ticker.addMessage = CoD_Ticker_AddMessage
	ticker.reset = CoD_Ticker_Reset
	return ticker
end

