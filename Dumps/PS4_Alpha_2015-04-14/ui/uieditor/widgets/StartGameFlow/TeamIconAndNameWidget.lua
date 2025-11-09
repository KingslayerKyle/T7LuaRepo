require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )

CoD.TeamIconAndNameWidget = InheritFrom( LUI.UIElement )
CoD.TeamIconAndNameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TeamIconAndNameWidget )
	self.id = "TeamIconAndNameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 345 )
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
	FEListHeaderGlow0:setRGB( 1, 1, 1 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local FactionName = LUI.UIText.new()
	FactionName:setLeftRight( false, false, -28.75, 186.75 )
	FactionName:setTopBottom( true, false, 26.5, 56.5 )
	FactionName:setRGB( 0, 0, 0 )
	FactionName:setText( Engine.Localize( "SPEC OPS" ) )
	FactionName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionName:setLetterSpacing( 2.5 )
	FactionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FactionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FactionName )
	self.FactionName = FactionName
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, -20.48, 25.52 )
	Image0:setTopBottom( false, false, -34, 27 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0.21 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ImageBorder0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder0:setLeftRight( true, true, -6, 6 )
	ImageBorder0:setTopBottom( false, false, -31, 24 )
	ImageBorder0:setRGB( 1, 1, 1 )
	ImageBorder0:setAlpha( 0 )
	self:addElement( ImageBorder0 )
	self.ImageBorder0 = ImageBorder0
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( true, false, -40.63, 156.13 )
	GlowPanel:setTopBottom( false, false, -106.38, 90.38 )
	GlowPanel:setRGB( 1, 1, 1 )
	GlowPanel:setAlpha( 0.35 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local FactionIconSolid = LUI.UIImage.new()
	FactionIconSolid:setLeftRight( true, false, -4.25, 119.75 )
	FactionIconSolid:setTopBottom( true, true, -27.5, 11.5 )
	FactionIconSolid:setRGB( 0, 0, 0 )
	FactionIconSolid:setAlpha( 0 )
	FactionIconSolid:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	FactionIconSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FactionIconSolid )
	self.FactionIconSolid = FactionIconSolid
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( true, false, -4.25, 119.75 )
	FactionIcon:setTopBottom( true, true, -27.5, 11.5 )
	FactionIcon:setRGB( 1, 1, 1 )
	FactionIcon:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1" ) )
	FactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
	FactionIcon:setShaderVector( 0, 0.08, 0, 0, 0 )
	FactionIcon:setShaderVector( 1, 0.02, 0, 0, 0 )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local Pixel20100 = LUI.UIImage.new()
	Pixel20100:setLeftRight( true, false, -22.5, 13.5 )
	Pixel20100:setTopBottom( false, false, 12, 16 )
	Pixel20100:setRGB( 1, 1, 1 )
	Pixel20100:setAlpha( 0.73 )
	Pixel20100:setYRot( -180 )
	Pixel20100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100 )
	self.Pixel20100 = Pixel20100
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( true, false, -23, 13 )
	Pixel201000:setTopBottom( false, false, -22, -18 )
	Pixel201000:setRGB( 1, 1, 1 )
	Pixel201000:setAlpha( 0.73 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel201001 = LUI.UIImage.new()
	Pixel201001:setLeftRight( false, true, -13, 23 )
	Pixel201001:setTopBottom( false, false, 12, 16 )
	Pixel201001:setRGB( 1, 1, 1 )
	Pixel201001:setAlpha( 0.73 )
	Pixel201001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201001 )
	self.Pixel201001 = Pixel201001
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( false, true, -13, 23 )
	Pixel2010000:setTopBottom( false, false, -22, -18 )
	Pixel2010000:setRGB( 1, 1, 1 )
	Pixel2010000:setAlpha( 0.73 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	self.close = function ( self )
		self.FEButtonPanel0:close()
		self.FEListHeaderGlow0:close()
		self.ImageBorder0:close()
		self.GlowPanel:close()
		CoD.TeamIconAndNameWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

