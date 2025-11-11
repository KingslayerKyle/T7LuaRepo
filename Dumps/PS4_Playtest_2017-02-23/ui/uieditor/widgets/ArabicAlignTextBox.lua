local PostLoadFunc = function ( self )
	
end

CoD.ArabicAlignTextBox = InheritFrom( LUI.UIElement )
CoD.ArabicAlignTextBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ArabicAlignTextBox )
	self.id = "ArabicAlignTextBox"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 198 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( 0, 1, 0, 0 )
	textBox:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	textBox:setText( Engine.Localize( "+1500 XP" ) )
	textBox:setTTF( "fonts/default.ttf" )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	textBox:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( textBox )
	self.textBox = textBox
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

