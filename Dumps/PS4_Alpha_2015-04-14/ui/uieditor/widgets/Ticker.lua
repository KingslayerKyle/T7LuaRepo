require( "ui.uieditor.widgets.Border" )

CoD.Ticker = InheritFrom( LUI.UIElement )
CoD.Ticker.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.Ticker )
	self.id = "Ticker"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 670 )
	self:setTopBottom( true, false, 0, 30 )
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, false, 0, 670 )
	Border:setTopBottom( true, false, 0, 30 )
	Border:setRGB( 0.87, 0.87, 0.87 )
	self:addElement( Border )
	self.Border = Border
	
	local TickerCatergory = LUI.UITightText.new()
	TickerCatergory:setLeftRight( true, false, 0, 114 )
	TickerCatergory:setTopBottom( true, false, 0, 30 )
	TickerCatergory:setRGB( 0.89, 0.53, 0.08 )
	TickerCatergory:setTTF( "fonts/default.ttf" )
	TickerCatergory:setupScrollingMessageCategory()
	self:addElement( TickerCatergory )
	self.TickerCatergory = TickerCatergory
	
	local TickerMessage = LUI.UITightText.new()
	TickerMessage:setLeftRight( true, false, 114, 670 )
	TickerMessage:setTopBottom( true, false, 0, 30 )
	TickerMessage:setRGB( 1, 1, 1 )
	TickerMessage:setTTF( "fonts/default.ttf" )
	TickerMessage:setupScrollingMessage()
	self:addElement( TickerMessage )
	self.TickerMessage = TickerMessage
	
	self.close = function ( self )
		self.Border:close()
		CoD.Ticker.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

