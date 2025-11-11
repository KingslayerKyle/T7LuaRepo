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
	self:setLeftRight( 0, 0, 0, 769 )
	self:setTopBottom( 0, 0, 0, 150 )
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0.5, 0.5, -313, 387 )
	Black:setTopBottom( 0.5, 0.5, -73, 71 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.7 )
	self:addElement( Black )
	self.Black = Black
	
	local FootnoteTextBox = LUI.UIText.new()
	FootnoteTextBox:setLeftRight( 0, 0, 106, 742 )
	FootnoteTextBox:setTopBottom( 0, 0, 24, 57 )
	FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_CONSUMABLE_FOOTNOTE" ) )
	FootnoteTextBox:setTTF( "fonts/default.ttf" )
	FootnoteTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FootnoteTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FootnoteTextBox )
	self.FootnoteTextBox = FootnoteTextBox
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 1, 70, 4 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( 0, 1, 83, -9 )
	FEButtonPanel0:setTopBottom( 0, 1, 10, -10 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.FEButtonPanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

