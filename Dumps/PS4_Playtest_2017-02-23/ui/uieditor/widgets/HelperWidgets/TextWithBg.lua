CoD.TextWithBg = InheritFrom( LUI.UIElement )
CoD.TextWithBg.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TextWithBg )
	self.id = "TextWithBg"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 306 )
	self:setTopBottom( 0, 0, 0, 57 )
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( 0, 1, 0, 0 )
	Bg:setTopBottom( 0, 1, 0, 0 )
	Bg:setRGB( 0, 0, 0 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 0, 1, 0, 0 )
	Text:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	Text:setText( Engine.Localize( "MENU_NEW" ) )
	Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

