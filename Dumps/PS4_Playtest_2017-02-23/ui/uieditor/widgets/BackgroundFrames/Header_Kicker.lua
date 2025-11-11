require( "ui.uieditor.widgets.BackgroundFrames.Kicker_Background" )

CoD.Header_Kicker = InheritFrom( LUI.UIElement )
CoD.Header_Kicker.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Header_Kicker )
	self.id = "Header_Kicker"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 24 )
	
	local KickerBackground = CoD.Kicker_Background.new( menu, controller )
	KickerBackground:setLeftRight( 0, 1, 0, 0 )
	KickerBackground:setTopBottom( 0, 1, 0, 0 )
	KickerBackground:setAlpha( 0.75 )
	self:addElement( KickerBackground )
	self.KickerBackground = KickerBackground
	
	local Kickertxt = LUI.UITightText.new()
	Kickertxt:setLeftRight( 0, 0, 5, 180 )
	Kickertxt:setTopBottom( 0, 0, 3, 27 )
	Kickertxt:setText( Engine.Localize( "Public Match" ) )
	Kickertxt:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( Kickertxt, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( Kickertxt )
	self.Kickertxt = Kickertxt
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.KickerBackground:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

