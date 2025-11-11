CoD.MegaChewFactoryVat = InheritFrom( LUI.UIElement )
CoD.MegaChewFactoryVat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MegaChewFactoryVat )
	self.id = "MegaChewFactoryVat"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 540 )
	self:setTopBottom( 0, 0, 0, 202 )
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 0, 12, 531 )
	TextBox:setTopBottom( 0, 0, 41, 146 )
	TextBox:setRGB( 0, 0, 0 )
	TextBox:setText( Engine.Localize( "MENU_NEW" ) )
	TextBox:setTTF( "fonts/CHARB__.TTF" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

