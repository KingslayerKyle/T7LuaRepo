-- 9ca24629ae7b97a2149215318bf7010f
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	CoD.setupVerticalScrollingTextWidget( self, controller )
end

CoD.verticalScrollingTextBox18 = InheritFrom( LUI.UIElement )
CoD.verticalScrollingTextBox18.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.verticalScrollingTextBox18 )
	self.id = "verticalScrollingTextBox18"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 200 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( true, true, 4, -4 )
	textBox:setTopBottom( true, false, 0, 18 )
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

