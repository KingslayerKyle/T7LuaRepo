local PostLoadFunc = function ( self, controller, menu )
	CoD.setupHorizontalScrollingWidget( self, controller )
end

CoD.horizontalScrollingTextBox = InheritFrom( LUI.UIElement )
CoD.horizontalScrollingTextBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.horizontalScrollingTextBox )
	self.id = "horizontalScrollingTextBox"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 900 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( 0, 0, 0, 15000 )
	textBox:setTopBottom( 0, 0, 0, 33 )
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

