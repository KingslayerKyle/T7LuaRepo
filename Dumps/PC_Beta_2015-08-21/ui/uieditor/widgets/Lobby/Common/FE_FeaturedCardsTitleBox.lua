require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.FE_FeaturedCardsTitleBox = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedCardsTitleBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_FeaturedCardsTitleBox )
	self.id = "FE_FeaturedCardsTitleBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 98 )
	self:setTopBottom( true, false, 0, 28 )
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, true, 0, 0 )
	FEListHeaderGlow0:setTopBottom( true, true, 0, 0 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2.5, 2.5 )
	TitleGlow1:setTopBottom( true, true, -3, 3 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -53.43, 48.57 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ScorestreaksLabel = LUI.UIText.new()
	ScorestreaksLabel:setLeftRight( true, true, 5, 202 )
	ScorestreaksLabel:setTopBottom( false, false, -9, 9 )
	ScorestreaksLabel:setRGB( 0, 0, 0 )
	ScorestreaksLabel:setText( Engine.Localize( "FEATURED" ) )
	ScorestreaksLabel:setTTF( "fonts/escom.ttf" )
	ScorestreaksLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ScorestreaksLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	ScorestreaksLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	ScorestreaksLabel:setShaderVector( 2, 1, 0, 0, 0 )
	ScorestreaksLabel:setLetterSpacing( 2.5 )
	ScorestreaksLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ScorestreaksLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( ScorestreaksLabel, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( ScorestreaksLabel )
	self.ScorestreaksLabel = ScorestreaksLabel
	
	local pixelb = LUI.UIImage.new()
	pixelb:setLeftRight( true, false, -25, 7 )
	pixelb:setTopBottom( false, false, -27, 27 )
	pixelb:setAlpha( 0 )
	pixelb:setYRot( -180 )
	pixelb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelb )
	self.pixelb = pixelb
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListHeaderGlow0:close()
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

