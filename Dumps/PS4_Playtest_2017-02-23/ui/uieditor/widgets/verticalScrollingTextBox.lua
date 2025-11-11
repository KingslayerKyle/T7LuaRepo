local PostLoadFunc = function ( self, controller, menu )
	CoD.setupVerticalScrollingTextWidget( self, controller )
end

CoD.verticalScrollingTextBox = InheritFrom( LUI.UIElement )
CoD.verticalScrollingTextBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.verticalScrollingTextBox )
	self.id = "verticalScrollingTextBox"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 900 )
	self:setTopBottom( 0, 0, 0, 300 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( 0, 1, 0, 0 )
	textBox:setTopBottom( 0, 0, 0, 30 )
	textBox:setText( Engine.Localize( "MENU_NEW" ) )
	textBox:setTTF( "fonts/default.ttf" )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textBox )
	self.textBox = textBox
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

