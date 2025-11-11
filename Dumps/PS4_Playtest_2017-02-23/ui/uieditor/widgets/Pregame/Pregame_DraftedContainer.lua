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
	self:setLeftRight( 0, 0, 0, 121 )
	self:setTopBottom( 0, 0, 0, 39 )
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanel1:setTopBottom( 0.5, 0.5, -19.5, 19.5 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.7 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local FETitleNumBrdr00 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr00:setLeftRight( 0, 1, 2, 0 )
	FETitleNumBrdr00:setTopBottom( 0.5, 0.5, -19, 19 )
	self:addElement( FETitleNumBrdr00 )
	self.FETitleNumBrdr00 = FETitleNumBrdr00
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 0, 1, 1, -3 )
	Text:setTopBottom( 0.5, 0.5, -16, 14 )
	Text:setText( Engine.Localize( "MENU_DRAFTED_CAPS" ) )
	Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Text:setLetterSpacing( 1 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 10 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel1:close()
		self.FETitleNumBrdr00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

