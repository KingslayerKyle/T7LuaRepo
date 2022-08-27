-- aa1829e8b4fdf9e5bc9f6f44f72a39d3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.Pregame_DraftedContainer = InheritFrom( LUI.UIElement )
CoD.Pregame_DraftedContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_DraftedContainer )
	self.id = "Pregame_DraftedContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 26 )
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( true, true, 0, 0 )
	FEButtonPanel1:setTopBottom( false, false, -13, 13 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.7 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local FETitleNumBrdr00 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr00:setLeftRight( true, true, 1, 0 )
	FETitleNumBrdr00:setTopBottom( false, false, -12.5, 12.5 )
	self:addElement( FETitleNumBrdr00 )
	self.FETitleNumBrdr00 = FETitleNumBrdr00
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 1, -2 )
	Text:setTopBottom( false, false, -10.5, 9.5 )
	Text:setText( Engine.Localize( "MENU_DRAFTED_CAPS" ) )
	Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Text:setLetterSpacing( 1 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 10 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel1:close()
		element.FETitleNumBrdr00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

