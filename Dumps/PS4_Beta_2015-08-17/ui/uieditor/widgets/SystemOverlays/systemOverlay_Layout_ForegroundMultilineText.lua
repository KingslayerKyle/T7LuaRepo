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
	self:setLeftRight( true, false, 0, 795 )
	self:setTopBottom( true, false, 0, 24 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 0, 795 )
	text:setTopBottom( true, false, 0, 24 )
	text:setText( Engine.Localize( "MENU_NEW" ) )
	text:setTTF( "fonts/default.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, text )
		UpdateWidgetHeightToMultilineText( self, element, 0 )
	end )
	self:addElement( text )
	self.text = text
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

