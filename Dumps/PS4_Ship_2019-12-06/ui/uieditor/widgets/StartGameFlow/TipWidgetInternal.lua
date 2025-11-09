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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 22 )
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( false, false, -12, 12 )
	FETitleNumBrdr0:setAlpha( 0 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local tip = LUI.UIText.new()
	tip:setLeftRight( true, false, 11.5, 1280 )
	tip:setTopBottom( true, false, 2, 21 )
	tip:setRGB( 0.7, 0.7, 0.7 )
	tip:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	tip:setLetterSpacing( 0.5 )
	tip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	tip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	tip:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "tip", function ( model )
		local _tip = Engine.GetModelValue( model )
		if _tip then
			tip:setText( Engine.Localize( _tip ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( tip, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( tip )
	self.tip = tip
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleNumBrdr0:close()
		element.tip:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

