-- 55d7fb20eeb658b51f95bbd720fdbf07
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 135 )
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, false, 8, 354 )
	TextBox:setTopBottom( true, false, 27.5, 97.5 )
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
