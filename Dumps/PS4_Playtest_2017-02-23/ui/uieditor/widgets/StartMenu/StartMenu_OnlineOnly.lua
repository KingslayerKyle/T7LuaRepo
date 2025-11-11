require( "ui.uieditor.widgets.BorderThin" )

CoD.StartMenu_OnlineOnly = InheritFrom( LUI.UIElement )
CoD.StartMenu_OnlineOnly.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_OnlineOnly )
	self.id = "StartMenu_OnlineOnly"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 321 )
	self:setTopBottom( 0, 0, 0, 42 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( 0, 1, 0, 0 )
	BorderThin0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 2, -2 )
	Image0:setTopBottom( 0, 1, 2, -2 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.6 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UITightText.new()
	TextBox0:setLeftRight( 0.5, 0.5, -60, 60 )
	TextBox0:setTopBottom( 0, 0, 7, 35 )
	TextBox0:setText( LocalizeToUpperString( "MENU_ONLINE_ONLY" ) )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setLetterSpacing( 2 )
	LUI.OverrideFunction_CallOriginalFirst( TextBox0, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 5 )
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderThin0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

