require( "ui.uieditor.widgets.Border" )

CoD.KeyPrompt = InheritFrom( LUI.UIElement )
CoD.KeyPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KeyPrompt )
	self.id = "KeyPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local keybind = LUI.UIText.new()
	keybind:setLeftRight( false, false, -12, 12 )
	keybind:setTopBottom( true, false, 0, 24 )
	keybind:setText( Engine.Localize( "" ) )
	keybind:setTTF( "fonts/default.ttf" )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( keybind, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 8 )
	end )
	self:addElement( keybind )
	self.keybind = keybind
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, 0 )
	Border:setRGB( 0.79, 0.78, 0.78 )
	self:addElement( Border )
	self.Border = Border
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

