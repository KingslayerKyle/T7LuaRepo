require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_textboxBG" )

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
	self:setLeftRight( 0, 0, 0, 528 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local GameSettingstextboxBG = CoD.GameSettings_textboxBG.new( menu, controller )
	GameSettingstextboxBG:setLeftRight( 0, 1, 0, 0 )
	GameSettingstextboxBG:setTopBottom( 0, 1, 0, 0 )
	self:addElement( GameSettingstextboxBG )
	self.GameSettingstextboxBG = GameSettingstextboxBG
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, -4, 4 )
	TitleGlow1:setTopBottom( 0, 1, -4, 4 )
	TitleGlow1:setRGB( 0, 0, 0 )
	TitleGlow1:setAlpha( 0.95 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -81, 73 )
	Glow:setTopBottom( 0.5, 0.5, -45, 65 )
	Glow:setRGB( 0, 0, 0 )
	Glow:setAlpha( 0.5 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Textbox = LUI.UIText.new()
	Textbox:setLeftRight( 0, 0, 6, 830 )
	Textbox:setTopBottom( 0.5, 0.5, -18, 15 )
	Textbox:setText( LocalizeIntoString( "", "Care Package" ) )
	Textbox:setTTF( "fonts/escom.ttf" )
	Textbox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Textbox:setShaderVector( 0, 0.06, 0, 0, 0 )
	Textbox:setShaderVector( 1, 0.02, 0, 0, 0 )
	Textbox:setShaderVector( 2, 1, 0, 0, 0 )
	Textbox:setLetterSpacing( 0.6 )
	Textbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Textbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Textbox, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Textbox )
	self.Textbox = Textbox
	
	local pixelb = LUI.UIImage.new()
	pixelb:setLeftRight( 0, 0, -38, 10 )
	pixelb:setTopBottom( 0.5, 0.5, -40.5, 40.5 )
	pixelb:setAlpha( 0 )
	pixelb:setYRot( -180 )
	pixelb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelb )
	self.pixelb = pixelb
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingstextboxBG:close()
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

