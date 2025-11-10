require( "ui.uieditor.widgets.GameSettings.GameSettings_textboxBG" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.GameSettings_titlesecbox = InheritFrom( LUI.UIElement )
CoD.GameSettings_titlesecbox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_titlesecbox )
	self.id = "GameSettings_titlesecbox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 352 )
	self:setTopBottom( true, false, 0, 30 )
	
	local GameSettingstextboxBG = CoD.GameSettings_textboxBG.new( menu, controller )
	GameSettingstextboxBG:setLeftRight( true, true, 0, 0 )
	GameSettingstextboxBG:setTopBottom( true, true, 0, 0 )
	self:addElement( GameSettingstextboxBG )
	self.GameSettingstextboxBG = GameSettingstextboxBG
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2.5, 2.5 )
	TitleGlow1:setTopBottom( true, true, -3, 3 )
	TitleGlow1:setRGB( 0, 0, 0 )
	TitleGlow1:setAlpha( 0.95 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -53.43, 48.57 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setRGB( 0, 0, 0 )
	Glow:setAlpha( 0.5 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Textbox = LUI.UIText.new()
	Textbox:setLeftRight( true, false, 4, 553 )
	Textbox:setTopBottom( false, false, -12, 10 )
	Textbox:setText( Engine.Localize( LocalizeIntoString( "", "MENU_NEXT_LEVEL_XP_ARG" ) ) )
	Textbox:setTTF( "fonts/escom.ttf" )
	Textbox:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Textbox:setShaderVector( 0, 0.06, 0, 0, 0 )
	Textbox:setShaderVector( 1, 0.02, 0, 0, 0 )
	Textbox:setShaderVector( 2, 1, 0, 0, 0 )
	Textbox:setLetterSpacing( 0.6 )
	Textbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Textbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Textbox, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Textbox )
	self.Textbox = Textbox
	
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
		element.GameSettingstextboxBG:close()
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

