CoD.ScrollingTicker = {}
CoD.ScrollingTicker.SocialFontName = "Default"
CoD.ScrollingTicker.new = function ()
	local self = LUI.UIElement.new()
	self.tickerCategory = LUI.UIElement.new()
	self.tickerCategory:setLeftRight( true, true, 0, 0 )
	self.tickerCategory:setTopBottom( true, false, 0, CoD.textSize.Default )
	self:addElement( self.tickerCategory )
	self.tickerTextStencil = LUI.UIElement.new()
	self.tickerTextStencil:setLeftRight( true, true, 0, 0 )
	self.tickerTextStencil:setTopBottom( true, false, 4 + CoD.textSize.Default, 4 + CoD.textSize.Default * 2 )
	self.tickerTextStencil:setUseStencil( true )
	self:addElement( self.tickerTextStencil )
	self.textTicker = LUI.UIElement.new()
	self.textTicker:setLeftRight( true, true, 0, 0 )
	self.textTicker:setTopBottom( true, true, 0, 0 )
	self.tickerTextStencil:addElement( self.textTicker )
	return self
end

