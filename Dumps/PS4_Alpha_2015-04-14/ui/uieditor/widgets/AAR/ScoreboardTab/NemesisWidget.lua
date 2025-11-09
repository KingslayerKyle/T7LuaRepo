require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.NemesisScoreWidget" )

CoD.NemesisWidget = InheritFrom( LUI.UIElement )
CoD.NemesisWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NemesisWidget )
	self.id = "NemesisWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 228 )
	self:setTopBottom( true, false, 0, 102 )
	self.anyChildUsesUpdateState = true
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, false, 86, 237 )
	FEListHeaderGlow0:setTopBottom( true, false, 12, 35 )
	FEListHeaderGlow0:setRGB( 0.7, 0.07, 0.07 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local KilledBy = CoD.NemesisScoreWidget.new( menu, controller )
	KilledBy:setLeftRight( true, false, 162, 237 )
	KilledBy:setTopBottom( true, false, 36, 89 )
	KilledBy:setRGB( 1, 1, 1 )
	KilledBy.ScoreTitle:setText( Engine.Localize( "MPUI_KILLED_BY_PRE_CAPS" ) )
	KilledBy:subscribeToGlobalModel( controller, "Scoreboard", "nemesisKilledBy", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KilledBy.Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( KilledBy )
	self.KilledBy = KilledBy
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 202, 232 )
	Image1:setTopBottom( true, false, 0.5, 30.5 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_t7_menu_aar_skull36" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Killed = CoD.NemesisScoreWidget.new( menu, controller )
	Killed:setLeftRight( true, false, 87, 162 )
	Killed:setTopBottom( true, false, 36, 89 )
	Killed:setRGB( 1, 1, 1 )
	Killed.ScoreTitle:setText( Engine.Localize( "MENU_KILLED_CAPS" ) )
	Killed:subscribeToGlobalModel( controller, "Scoreboard", "nemesisKills", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Killed.Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Killed )
	self.Killed = Killed
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, false, -1, 86.5 )
	backing:setTopBottom( true, false, -7.11, 103.61 )
	backing:setRGB( 1, 1, 1 )
	backing:setImage( RegisterImage( "uie_t7_mp_menu_scoreboard_nemesisbacking" ) )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backing )
	self.backing = backing
	
	local backingcolor = LUI.UIImage.new()
	backingcolor:setLeftRight( true, false, -1, 86.5 )
	backingcolor:setTopBottom( true, false, -5.11, 81.61 )
	backingcolor:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	backingcolor:setAlpha( 0.45 )
	backingcolor:setImage( RegisterImage( "uie_t7_mp_menu_scoreboard_nemesistop" ) )
	backingcolor:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backingcolor )
	self.backingcolor = backingcolor
	
	local HeroLobbyClientExtraCamRender = LUI.UIImage.new()
	HeroLobbyClientExtraCamRender:setLeftRight( true, false, 5, 80 )
	HeroLobbyClientExtraCamRender:setTopBottom( true, false, 7.39, 81.61 )
	HeroLobbyClientExtraCamRender:setRGB( 1, 1, 1 )
	HeroLobbyClientExtraCamRender:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	HeroLobbyClientExtraCamRender:setShaderVector( 0, 0.21, 0.05, 0.23, 0.62 )
	HeroLobbyClientExtraCamRender:subscribeToGlobalModel( controller, "Scoreboard", "nemesisXuid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( modelValue )
		end
	end )
	self:addElement( HeroLobbyClientExtraCamRender )
	self.HeroLobbyClientExtraCamRender = HeroLobbyClientExtraCamRender
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 61.5, 261.5 )
	Image0:setTopBottom( true, false, -9.5, 62.5 )
	Image0:setRGB( 1, 0, 0 )
	Image0:setAlpha( 0.21 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 95, 295 )
	TextBox0:setTopBottom( true, false, 15.5, 35 )
	TextBox0:setRGB( 0, 0, 0 )
	TextBox0:setText( Engine.Localize( "MPUI_NEMESIS_TITLE_CAPS" ) )
	TextBox0:setTTF( "fonts/Entovo.ttf" )
	TextBox0:setLetterSpacing( 0.4 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, -10.5, 10.5 )
	Arrow:setTopBottom( true, false, 12, 33 )
	Arrow:setRGB( 1, 1, 1 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_aar_redarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self.close = function ( self )
		self.FEListHeaderGlow0:close()
		self.KilledBy:close()
		self.Killed:close()
		self.HeroLobbyClientExtraCamRender:close()
		CoD.NemesisWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

