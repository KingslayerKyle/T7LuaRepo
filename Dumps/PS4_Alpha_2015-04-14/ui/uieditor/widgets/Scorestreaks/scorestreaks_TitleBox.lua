require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.scorestreaks_TitleBox = InheritFrom( LUI.UIElement )
CoD.scorestreaks_TitleBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.scorestreaks_TitleBox )
	self.id = "scorestreaks_TitleBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 352 )
	self:setTopBottom( true, false, 0, 48 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2.5, 2.5 )
	TitleGlow1:setTopBottom( true, true, -6, 0 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -53.43, 48.57 )
	Glow:setTopBottom( false, false, -33, 40 )
	Glow:setRGB( 1, 1, 1 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ScorestreaksLabel = LUI.UIText.new()
	ScorestreaksLabel:setLeftRight( true, true, 10.5, 205.5 )
	ScorestreaksLabel:setTopBottom( false, false, -16, 16 )
	ScorestreaksLabel:setRGB( 0, 0, 0 )
	ScorestreaksLabel:setTTF( "fonts/Entovo.ttf" )
	ScorestreaksLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ScorestreaksLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	ScorestreaksLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	ScorestreaksLabel:setShaderVector( 2, 1, 0, 0, 0 )
	ScorestreaksLabel:setLetterSpacing( 0.6 )
	ScorestreaksLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ScorestreaksLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ScorestreaksLabel:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScorestreaksLabel:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( ScorestreaksLabel, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( ScorestreaksLabel )
	self.ScorestreaksLabel = ScorestreaksLabel
	
	local pixelb = LUI.UIImage.new()
	pixelb:setLeftRight( true, false, -25, 7 )
	pixelb:setTopBottom( false, false, -30, 24 )
	pixelb:setRGB( 1, 1, 1 )
	pixelb:setAlpha( 0 )
	pixelb:setYRot( -180 )
	pixelb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelb )
	self.pixelb = pixelb
	
	self.close = function ( self )
		self.TitleGlow1:close()
		self.ScorestreaksLabel:close()
		CoD.scorestreaks_TitleBox.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

