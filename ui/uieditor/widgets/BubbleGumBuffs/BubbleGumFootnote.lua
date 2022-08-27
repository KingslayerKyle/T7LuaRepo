-- c33aa20df89362860a5a9d5535123de5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.BubbleGumFootnote = InheritFrom( LUI.UIElement )
CoD.BubbleGumFootnote.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumFootnote )
	self.id = "BubbleGumFootnote"
	self.soundSet = "CAC_Perk"
	self:setLeftRight( true, false, 0, 513 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( false, false, -208.5, 258.27 )
	Black:setTopBottom( false, false, -48.5, 47.5 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.7 )
	self:addElement( Black )
	self.Black = Black
	
	local FootnoteTextBox = LUI.UIText.new()
	FootnoteTextBox:setLeftRight( true, false, 71, 495 )
	FootnoteTextBox:setTopBottom( true, false, 16, 38 )
	FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_CONSUMABLE_FOOTNOTE" ) )
	FootnoteTextBox:setTTF( "fonts/default.ttf" )
	FootnoteTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FootnoteTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FootnoteTextBox )
	self.FootnoteTextBox = FootnoteTextBox
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, 47, 2.77 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 0, 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 55.89, -6.11 )
	FEButtonPanel0:setTopBottom( true, true, 6.98, -6.98 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.FEButtonPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

