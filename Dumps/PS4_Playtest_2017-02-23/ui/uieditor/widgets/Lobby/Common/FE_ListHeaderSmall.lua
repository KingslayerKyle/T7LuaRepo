require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )

CoD.FE_ListHeaderSmall = InheritFrom( LUI.UIElement )
CoD.FE_ListHeaderSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListHeaderSmall )
	self.id = "FE_ListHeaderSmall"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 175 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( 0, 1, 0, 0 )
	FEListHeaderGlow0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( 1, 1, -575, -9 )
	btnDisplayTextStroke:setTopBottom( 0.5, 0.5, -15, 15 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	btnDisplayTextStroke:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	btnDisplayTextStroke:setLetterSpacing( 0.5 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, text )
		ScaleWidgetToLabelRightAligned( self, element, 0 )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListHeaderGlow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

