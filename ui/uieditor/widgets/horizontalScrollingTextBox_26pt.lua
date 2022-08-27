-- b1297cfe25d98a6d8f132817155ea270
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	CoD.setupHorizontalScrollingWidget( self, controller )
end

CoD.horizontalScrollingTextBox_26pt = InheritFrom( LUI.UIElement )
CoD.horizontalScrollingTextBox_26pt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.horizontalScrollingTextBox_26pt )
	self.id = "horizontalScrollingTextBox_26pt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 26 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( true, false, 0, 600 )
	textBox:setTopBottom( false, true, -26, 0 )
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

