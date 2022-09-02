-- f8cadc027f918847e5264af811d6f5a9
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 204 )
	self:setTopBottom( true, false, 0, 38 )
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, true, 0, 0 )
	Bg:setTopBottom( true, true, 0, 0 )
	Bg:setRGB( 0, 0, 0 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 0, 0 )
	Text:setTopBottom( false, false, -11, 11 )
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

