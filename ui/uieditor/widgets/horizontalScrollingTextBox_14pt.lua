-- c4ec533aadc7d2f33e301c937ec19c8d
-- This hash is used for caching, delete to decompile the file again

CoD.horizontalScrollingTextBox_14pt = InheritFrom( LUI.UIElement )
CoD.horizontalScrollingTextBox_14pt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.horizontalScrollingTextBox_14pt )
	self.id = "horizontalScrollingTextBox_14pt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 14 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( true, false, 0, 10000 )
	textBox:setTopBottom( true, false, 0, 14 )
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
