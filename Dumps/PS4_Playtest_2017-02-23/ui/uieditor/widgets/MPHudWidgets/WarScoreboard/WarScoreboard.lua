require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.MPHudWidgets.WarScoreboard.WarScoreboardHeadingItem" )
require( "ui.uieditor.widgets.MPHudWidgets.WarScoreboard.WarScoreboardRow" )
require( "ui.uieditor.widgets.MPHudWidgets.WarScoreboard.WarScoreInfoTimer" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardPlayerDetails" )

CoD.WarScoreboard = InheritFrom( LUI.UIElement )
CoD.WarScoreboard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WarScoreboard )
	self.id = "WarScoreboard"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1440 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1.5, -360, -360 )
	Background:setTopBottom( 0, 1.5, -270, -270 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.77 )
	self:addElement( Background )
	self.Background = Background
	
	local BlurBox3 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	BlurBox3:setLeftRight( 0, 0, 0, 1440 )
	BlurBox3:setTopBottom( 0, 0, 44, 247 )
	BlurBox3:setRGB( 0.49, 0.54, 0.56 )
	BlurBox3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	BlurBox3:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( BlurBox3 )
	self.BlurBox3 = BlurBox3
	
	local BlackBox3 = LUI.UIImage.new()
	BlackBox3:setLeftRight( 0, 0, 0, 1440 )
	BlackBox3:setTopBottom( 0, 0, 44, 247 )
	BlackBox3:setRGB( 0, 0, 0 )
	BlackBox3:setAlpha( 0.65 )
	self:addElement( BlackBox3 )
	self.BlackBox3 = BlackBox3
	
	local PlayerScorePanel = CoD.ScoreboardPlayerDetails.new( menu, controller )
	PlayerScorePanel:setLeftRight( 0, 0, 0, 1440 )
	PlayerScorePanel:setTopBottom( 0, 0, 366, 1028 )
	self:addElement( PlayerScorePanel )
	self.PlayerScorePanel = PlayerScorePanel
	
	local Headings = LUI.GridLayout.new( menu, controller, false, 0, 0, -67, 0, nil, nil, false, false, 0, 0, false, false )
	Headings:setLeftRight( 0, 0, 523, 1085 )
	Headings:setTopBottom( 0, 0, 41, 94 )
	Headings:setWidgetType( CoD.WarScoreboardHeadingItem )
	Headings:setHorizontalCount( 5 )
	Headings:setSpacing( -67 )
	Headings:setDataSource( "WarHeadings" )
	self:addElement( Headings )
	self.Headings = Headings
	
	local GameTimer00 = CoD.WarScoreInfoTimer.new( menu, controller )
	GameTimer00:setLeftRight( 0, 0, 18, 130 )
	GameTimer00:setTopBottom( 0, 0, 180, 233 )
	GameTimer00:setAlpha( 0.8 )
	GameTimer00:setScale( 1.2 )
	self:addElement( GameTimer00 )
	self.GameTimer00 = GameTimer00
	
	local EnemyRed = LUI.UIImage.new()
	EnemyRed:setLeftRight( 0, 0, 451, 1011 )
	EnemyRed:setTopBottom( 0, 0, 170, 238 )
	EnemyRed:setRGB( 0, 0, 0 )
	EnemyRed:setAlpha( 0.12 )
	EnemyRed:setYRot( 180 )
	self:addElement( EnemyRed )
	self.EnemyRed = EnemyRed
	
	local FriendlyBlue = LUI.UIImage.new()
	FriendlyBlue:setLeftRight( 0, 0, 451, 1011 )
	FriendlyBlue:setTopBottom( 0, 0, 94, 162 )
	FriendlyBlue:setAlpha( 0.02 )
	FriendlyBlue:setYRot( 180 )
	self:addElement( FriendlyBlue )
	self.FriendlyBlue = FriendlyBlue
	
	local WarScoreboardRowAllies = CoD.WarScoreboardRow.new( menu, controller )
	WarScoreboardRowAllies:setLeftRight( 0, 0, 516, 1021 )
	WarScoreboardRowAllies:setTopBottom( 0, 0, 93, 153 )
	WarScoreboardRowAllies:setAlpha( 0.8 )
	WarScoreboardRowAllies:subscribeToGlobalModel( controller, "WarData", "team1", function ( model )
		WarScoreboardRowAllies:setModel( model, controller )
	end )
	self:addElement( WarScoreboardRowAllies )
	self.WarScoreboardRowAllies = WarScoreboardRowAllies
	
	local WarScoreboardRowAxis = CoD.WarScoreboardRow.new( menu, controller )
	WarScoreboardRowAxis:setLeftRight( 0, 0, 516, 1021 )
	WarScoreboardRowAxis:setTopBottom( 0, 0, 169, 229 )
	WarScoreboardRowAxis:setAlpha( 0.8 )
	WarScoreboardRowAxis:subscribeToGlobalModel( controller, "WarData", "team2", function ( model )
		WarScoreboardRowAxis:setModel( model, controller )
	end )
	self:addElement( WarScoreboardRowAxis )
	self.WarScoreboardRowAxis = WarScoreboardRowAxis
	
	local FactionIcon = LUI.UIImage.new()
	FactionIcon:setLeftRight( 0.5, 0.5, -258, -169 )
	FactionIcon:setTopBottom( 0.5, 0.5, -382, -297 )
	FactionIcon:setAlpha( 0.5 )
	FactionIcon:subscribeToGlobalModel( controller, "Factions", "enemyFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0.5, 0.5, -258, -170 )
	Image:setTopBottom( 0.5, 0.5, -454, -369 )
	Image:setAlpha( 0.5 )
	Image:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local Map = LUI.UIText.new()
	Map:setLeftRight( 0, 0, 84, 286 )
	Map:setTopBottom( 0, 0, 123, 151 )
	Map:setAlpha( 0.4 )
	Map:setText( Engine.Localize( GetMapName( "WARZONES MAP" ) ) )
	Map:setTTF( "fonts/default.ttf" )
	Map:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Map:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Map )
	self.Map = Map
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 0, 18, 286 )
	TextBox:setTopBottom( 0, 0, 55, 130 )
	TextBox:setAlpha( 0.8 )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox:subscribeToGlobalModel( controller, "WarData", "attackingTeam", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox:setText( Engine.Localize( GetScoreboardTeamAttackingOrDefendingString( controller, modelValue ) ) )
		end
	end )
	TextBox:subscribeToGlobalModel( controller, "PerController", "factions.playerFactionTeamEnum", function ( model )
		local element = TextBox
		ForceNotifyGlobalModel( controller, "hudItems.war.attackingTeam" )
	end )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( 0, 0, 18, 70 )
	TextBox2:setTopBottom( 0, 0, 123, 151 )
	TextBox2:setAlpha( 0.4 )
	TextBox2:setText( Engine.Localize( "MPUI_WAR_CAPS" ) )
	TextBox2:setTTF( "fonts/default.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local WhiteBox = LUI.UIImage.new()
	WhiteBox:setLeftRight( 0, 0, 67, 69 )
	WhiteBox:setTopBottom( 0, 0, 124, 151 )
	WhiteBox:setAlpha( 0.4 )
	self:addElement( WhiteBox )
	self.WhiteBox = WhiteBox
	
	local Divider2 = LUI.UIImage.new()
	Divider2:setLeftRight( 0.57, 0.57, 56, 57 )
	Divider2:setTopBottom( 0, 0, 100, 155 )
	Divider2:setAlpha( 0.05 )
	self:addElement( Divider2 )
	self.Divider2 = Divider2
	
	local Divider22 = LUI.UIImage.new()
	Divider22:setLeftRight( 0.57, 0.57, 56, 57 )
	Divider22:setTopBottom( 0, 0, 176, 231 )
	Divider22:setAlpha( 0.05 )
	self:addElement( Divider22 )
	self.Divider22 = Divider22
	
	local Divider23 = LUI.UIImage.new()
	Divider23:setLeftRight( 0.35, 0.35, 56, 57 )
	Divider23:setTopBottom( 0, 0, 100, 155 )
	Divider23:setAlpha( 0.05 )
	self:addElement( Divider23 )
	self.Divider23 = Divider23
	
	local Divider222 = LUI.UIImage.new()
	Divider222:setLeftRight( 0.35, 0.35, 56, 57 )
	Divider222:setTopBottom( 0, 0, 176, 231 )
	Divider222:setAlpha( 0.05 )
	self:addElement( Divider222 )
	self.Divider222 = Divider222
	
	PlayerScorePanel.id = "PlayerScorePanel"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BlurBox3:close()
		self.PlayerScorePanel:close()
		self.Headings:close()
		self.GameTimer00:close()
		self.WarScoreboardRowAllies:close()
		self.WarScoreboardRowAxis:close()
		self.FactionIcon:close()
		self.Image:close()
		self.TextBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

