-- 0fedb6f85b42481c1f3732ef7d91dbd2
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	CoD.setupHorizontalScrollingWidget( self, controller )
end

CoD.horizontalScrollingTextBox_30pt = InheritFrom( LUI.UIElement )
CoD.horizontalScrollingTextBox_30pt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.horizontalScrollingTextBox_30pt )
	self.id = "horizontalScrollingTextBox_30pt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 34 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( true, false, 0, 600 )
	textBox:setTopBottom( false, true, -30, 0 )
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
