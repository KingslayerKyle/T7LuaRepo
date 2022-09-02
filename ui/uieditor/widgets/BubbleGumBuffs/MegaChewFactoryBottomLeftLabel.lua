-- cdc316661f25d1a125d999351e31f2b5
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 90 )
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, false, 0, 480 )
	TextBox:setTopBottom( true, false, 20, 70 )
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

