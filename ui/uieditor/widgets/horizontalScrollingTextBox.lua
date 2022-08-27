-- a31086dabdafa53aca9aa01b903eaaba
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 22 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( true, false, 0, 10000 )
	textBox:setTopBottom( true, false, 0, 22 )
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

