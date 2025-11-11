CoD.MegaChewFactoryBottomLeftLabel = InheritFrom( LUI.UIElement )
CoD.MegaChewFactoryBottomLeftLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MegaChewFactoryBottomLeftLabel )
	self.id = "MegaChewFactoryBottomLeftLabel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 135 )
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 0, 0, 720 )
	TextBox:setTopBottom( 0, 0, 30, 105 )
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

