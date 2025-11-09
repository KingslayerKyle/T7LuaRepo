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
	self:setLeftRight( true, false, 0, 638 )
	self:setTopBottom( true, false, 0, 128 )
	
	local FootnoteBackgroundImage = LUI.UIImage.new()
	FootnoteBackgroundImage:setLeftRight( true, true, 0, 0 )
	FootnoteBackgroundImage:setTopBottom( true, true, 0, 0 )
	FootnoteBackgroundImage:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FootnoteBackgroundImage )
	self.FootnoteBackgroundImage = FootnoteBackgroundImage
	
	local FootnoteTextBox = LUI.UIText.new()
	FootnoteTextBox:setLeftRight( true, false, 0, 638 )
	FootnoteTextBox:setTopBottom( true, false, 0, 34 )
	FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_CONSUMABLE_FOOTNOTE" ) )
	FootnoteTextBox:setTTF( "fonts/default.ttf" )
	FootnoteTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FootnoteTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FootnoteTextBox )
	self.FootnoteTextBox = FootnoteTextBox
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

