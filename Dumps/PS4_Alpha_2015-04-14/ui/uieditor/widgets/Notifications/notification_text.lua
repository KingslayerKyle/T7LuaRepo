CoD.Notification_Text = InheritFrom( LUI.UIElement )
CoD.Notification_Text.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notification_Text )
	self.id = "Notification_Text"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 120 )
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 0, 500 )
	TextBox0:setTopBottom( true, false, 0, 60 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "MENU_NEW" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 0, 500 )
	TextBox1:setTopBottom( true, false, 60, 120 )
	TextBox1:setRGB( 1, 1, 1 )
	TextBox1:setText( Engine.Localize( "MENU_NEW" ) )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

