CoD.systemOverlay_Layout_ForegroundMultilineText = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Layout_ForegroundMultilineText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Layout_ForegroundMultilineText )
	self.id = "systemOverlay_Layout_ForegroundMultilineText"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1122 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( 0, 0, 0, 1122 )
	text:setTopBottom( 0, 0, 3, 33 )
	text:setText( Engine.Localize( "MENU_NEW" ) )
	text:setTTF( "fonts/default.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, text )
		UpdateWidgetHeightToMultilineTextWithMinimum( self, element, 0, 60 )
	end )
	self:addElement( text )
	self.text = text
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

