-- 98a72206ab3078d375858cafce81781a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )

CoD.horizontalScrollingTextBoxGroups = InheritFrom( LUI.UIElement )
CoD.horizontalScrollingTextBoxGroups.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.horizontalScrollingTextBoxGroups )
	self.id = "horizontalScrollingTextBoxGroups"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 22 )
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, true, 0, 0 )
	FEListHeaderGlow0:setTopBottom( false, false, -9.75, 11 )
	FEListHeaderGlow0:setAlpha( 0.08 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( true, false, 0, 10000 )
	textBox:setTopBottom( true, false, 2, 20 )
	textBox:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	textBox:setText( Engine.Localize( "MENU_NEW" ) )
	textBox:setTTF( "fonts/default.ttf" )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textBox )
	self.textBox = textBox
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListHeaderGlow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
