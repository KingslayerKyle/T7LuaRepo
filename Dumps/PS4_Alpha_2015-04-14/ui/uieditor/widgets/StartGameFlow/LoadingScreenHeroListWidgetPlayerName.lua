require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.LoadingScreenHeroListWidgetPlayerName = InheritFrom( LUI.UIElement )
CoD.LoadingScreenHeroListWidgetPlayerName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenHeroListWidgetPlayerName )
	self.id = "LoadingScreenHeroListWidgetPlayerName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 2, -2 )
	FEButtonPanel0:setTopBottom( false, true, -2, 22.64 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.9 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local cacButtonBoxLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke:setLeftRight( true, true, -2, 2 )
	cacButtonBoxLrgInactiveStroke:setTopBottom( true, false, -1, 57 )
	cacButtonBoxLrgInactiveStroke:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
	self:addElement( cacButtonBoxLrgInactiveStroke )
	self.cacButtonBoxLrgInactiveStroke = cacButtonBoxLrgInactiveStroke
	
	local IconGlowPanel = LUI.UIImage.new()
	IconGlowPanel:setLeftRight( true, true, -14, 17.5 )
	IconGlowPanel:setTopBottom( false, false, -18, 23.32 )
	IconGlowPanel:setRGB( 1, 1, 1 )
	IconGlowPanel:setAlpha( 0.64 )
	IconGlowPanel:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	IconGlowPanel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IconGlowPanel )
	self.IconGlowPanel = IconGlowPanel
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, 0, 0 )
	TitleGlow1:setTopBottom( true, true, -1, -1 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local PlayerName = LUI.UIText.new()
	PlayerName:setLeftRight( false, false, -80, 80 )
	PlayerName:setTopBottom( true, false, 6, 25 )
	PlayerName:setRGB( 0, 0, 0 )
	PlayerName:setText( Engine.Localize( "WWWWWWWWWWWWWWWW" ) )
	PlayerName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PlayerName:setLetterSpacing( 0.5 )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local WpnName = LUI.UIText.new()
	WpnName:setLeftRight( false, false, -80, 80 )
	WpnName:setTopBottom( true, false, 33, 52 )
	WpnName:setRGB( 0.82, 0.82, 0.82 )
	WpnName:setText( Engine.Localize( "WWWWWWWWWWWWWWWW" ) )
	WpnName:setTTF( "fonts/Entovo.ttf" )
	WpnName:setLetterSpacing( 0.5 )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WpnName )
	self.WpnName = WpnName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				cacButtonBoxLrgInactiveStroke:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
				self.clipFinished( cacButtonBoxLrgInactiveStroke, {} )
				IconGlowPanel:completeAnimation()
				self.IconGlowPanel:setRGB( 1, 1, 1 )
				self.clipFinished( IconGlowPanel, {} )
				TitleGlow1:completeAnimation()
				self.TitleGlow1:setRGB( 0.89, 0.89, 0.89 )
				self.clipFinished( TitleGlow1, {} )
				WpnName:completeAnimation()
				self.WpnName:setRGB( 0.82, 0.82, 0.82 )
				self.clipFinished( WpnName, {} )
			end
		},
		Coloured = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				IconGlowPanel:completeAnimation()
				self.IconGlowPanel:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( IconGlowPanel, {} )
				TitleGlow1:completeAnimation()
				self.TitleGlow1:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( TitleGlow1, {} )
			end
		}
	}
	self.close = function ( self )
		self.FEButtonPanel0:close()
		self.cacButtonBoxLrgInactiveStroke:close()
		self.TitleGlow1:close()
		CoD.LoadingScreenHeroListWidgetPlayerName.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

