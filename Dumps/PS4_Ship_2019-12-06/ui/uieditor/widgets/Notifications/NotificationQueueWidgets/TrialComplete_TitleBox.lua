require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.TrialComplete_TitleBox = InheritFrom( LUI.UIElement )
CoD.TrialComplete_TitleBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TrialComplete_TitleBox )
	self.id = "TrialComplete_TitleBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 352 )
	self:setTopBottom( true, false, 0, 25 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2.5, 2.5 )
	TitleGlow1:setTopBottom( true, true, -3, 3 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -53.43, 48.57 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0.5 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ScorestreaksLabel = LUI.UIText.new()
	ScorestreaksLabel:setLeftRight( false, false, -274.5, 274.5 )
	ScorestreaksLabel:setTopBottom( true, false, 0, 25 )
	ScorestreaksLabel:setRGB( 0, 0, 0 )
	ScorestreaksLabel:setText( LocalizeIntoString( "", "Care Package" ) )
	ScorestreaksLabel:setTTF( "fonts/escom.ttf" )
	ScorestreaksLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ScorestreaksLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	ScorestreaksLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	ScorestreaksLabel:setShaderVector( 2, 1, 0, 0, 0 )
	ScorestreaksLabel:setLetterSpacing( 0.6 )
	ScorestreaksLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScorestreaksLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( ScorestreaksLabel, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 2, 0 )
	end )
	self:addElement( ScorestreaksLabel )
	self.ScorestreaksLabel = ScorestreaksLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

