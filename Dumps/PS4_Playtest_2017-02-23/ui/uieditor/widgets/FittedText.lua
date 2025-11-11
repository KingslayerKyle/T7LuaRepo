require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

local PostLoadFunc = function ( self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self.text, "setText", function ( text )
		self:setWidth( self.text:getTextWidth() + 6 )
	end )
end

CoD.FittedText = InheritFrom( LUI.UIElement )
CoD.FittedText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FittedText )
	self.id = "FittedText"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 90 )
	self:setTopBottom( 0, 0, 0, 34 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( 0, 1, 0, 0 )
	Panel:setTopBottom( 0, 1, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local text = LUI.UITightText.new()
	text:setLeftRight( 0, 0, 4, 90 )
	text:setTopBottom( 0, 0, 2, 32 )
	text:setText( Engine.Localize( "MENU_NEW" ) )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( text )
	self.text = text
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

