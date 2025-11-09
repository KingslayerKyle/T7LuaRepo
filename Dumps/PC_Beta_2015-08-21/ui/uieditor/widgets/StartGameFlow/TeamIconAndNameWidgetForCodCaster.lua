require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )

CoD.TeamIconAndNameWidgetForCodCaster = InheritFrom( LUI.UIElement )
CoD.TeamIconAndNameWidgetForCodCaster.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TeamIconAndNameWidgetForCodCaster )
	self.id = "TeamIconAndNameWidgetForCodCaster"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 442 )
	self:setTopBottom( true, false, 0, 85 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, -6, 6 )
	FEButtonPanel0:setTopBottom( true, true, 11.5, -18.5 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, true, 6, -6 )
	FEListHeaderGlow0:setTopBottom( true, true, 21.5, -28.5 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local FactionName = LUI.UIText.new()
	FactionName:setLeftRight( false, false, -112, 208 )
	FactionName:setTopBottom( true, false, 25.5, 55.5 )
	FactionName:setRGB( 0, 0, 0 )
	FactionName:setText( Engine.Localize( "WWWWWWWWWWWW" ) )
	FactionName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionName:setLetterSpacing( 2.5 )
	FactionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FactionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FactionName )
	self.FactionName = FactionName
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, -20.48, 25.52 )
	Image0:setTopBottom( false, false, -34, 27 )
	Image0:setAlpha( 0.21 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ImageBorder0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder0:setLeftRight( true, true, -6, 6 )
	ImageBorder0:setTopBottom( false, false, -31, 24 )
	ImageBorder0:setAlpha( 0 )
	self:addElement( ImageBorder0 )
	self.ImageBorder0 = ImageBorder0
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( true, false, -40.63, 156.13 )
	GlowPanel:setTopBottom( false, false, -106.38, 90.38 )
	GlowPanel:setAlpha( 0.35 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local FactionIconSolid = LUI.UIImage.new()
	FactionIconSolid:setLeftRight( true, false, -41, 141 )
	FactionIconSolid:setTopBottom( true, false, -13, 101 )
	FactionIconSolid:setRGB( 0, 0, 0 )
	FactionIconSolid:setAlpha( 0.97 )
	FactionIconSolid:setImage( RegisterImage( "uie_t7_icon_team_winslow" ) )
	self:addElement( FactionIconSolid )
	self.FactionIconSolid = FactionIconSolid
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( true, false, -41, 141 )
	FactionIcon:setTopBottom( true, false, -13, 101 )
	FactionIcon:setImage( RegisterImage( "uie_t7_icon_team_winslow" ) )
	FactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local Pixel20100 = LUI.UIImage.new()
	Pixel20100:setLeftRight( true, false, -22.5, 13.5 )
	Pixel20100:setTopBottom( false, false, 12, 16 )
	Pixel20100:setAlpha( 0.73 )
	Pixel20100:setYRot( -180 )
	Pixel20100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100 )
	self.Pixel20100 = Pixel20100
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( true, false, -23, 13 )
	Pixel201000:setTopBottom( false, false, -22, -18 )
	Pixel201000:setAlpha( 0.73 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel201001 = LUI.UIImage.new()
	Pixel201001:setLeftRight( false, true, -13, 23 )
	Pixel201001:setTopBottom( false, false, 12, 16 )
	Pixel201001:setAlpha( 0.73 )
	Pixel201001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201001 )
	self.Pixel201001 = Pixel201001
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( false, true, -13, 23 )
	Pixel2010000:setTopBottom( false, false, -22, -18 )
	Pixel2010000:setAlpha( 0.73 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.FEListHeaderGlow0:close()
		element.ImageBorder0:close()
		element.GlowPanel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

