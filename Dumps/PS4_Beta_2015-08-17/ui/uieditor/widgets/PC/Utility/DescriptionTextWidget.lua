CoD.DescriptionTextWidget = InheritFrom( LUI.UIElement )
CoD.DescriptionTextWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DescriptionTextWidget )
	self.id = "DescriptionTextWidget"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 34 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.25 )
	self:addElement( background )
	self.background = background
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 5, -5 )
	text:setTopBottom( true, false, 5, 30 )
	text:setRGB( 0.74, 0.74, 0.74 )
	text:setText( Engine.Localize( "MENU_NEW" ) )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( text )
	self.text = text
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

