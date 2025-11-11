require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.TipWidgetInternal = InheritFrom( LUI.UIElement )
CoD.TipWidgetInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TipWidgetInternal )
	self.id = "TipWidgetInternal"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 0, 0 )
	FETitleNumBrdr0:setTopBottom( 0.5, 0.5, -18, 18 )
	FETitleNumBrdr0:setAlpha( 0 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local tip = LUI.UIText.new()
	tip:setLeftRight( 0, 0, 17, 1920 )
	tip:setTopBottom( 0, 0, 3, 31 )
	tip:setRGB( 0.7, 0.7, 0.7 )
	tip:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	tip:setLetterSpacing( 0.5 )
	tip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	tip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	tip:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "tip", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			tip:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( tip, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( tip )
	self.tip = tip
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleNumBrdr0:close()
		self.tip:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

