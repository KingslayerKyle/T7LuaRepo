require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Barracks.CombatRecordCallingCard" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStat" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_BoxLabel" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Primary_Profile_Snapshot" )
require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )

LUI.createMenu.Social_InspectPlayerPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_InspectPlayerPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_InspectPlayerPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( true, true, 0, 0 )
	VignetteBack:setTopBottom( true, true, 0, 0 )
	VignetteBack:setAlpha( 0.75 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 0, 0 )
	darkbg:setTopBottom( true, true, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.7 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, true, 0, 0 )
	Black:setTopBottom( true, true, 105, -107 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.9 )
	self:addElement( Black )
	self.Black = Black
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( true, false, 13.5, 1294 )
	TextureBackground:setTopBottom( true, false, 0, 720 )
	TextureBackground:setAlpha( 0.25 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg2" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( true, true, -21, 25 )
	FEFocusBarSolid:setTopBottom( false, false, -254, -246 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( true, true, -24, 25 )
	FEFocusBarAdd:setTopBottom( false, false, -257, -249 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local FEFocusBarSolid0 = LUI.UIImage.new()
	FEFocusBarSolid0:setLeftRight( true, true, -21, 25 )
	FEFocusBarSolid0:setTopBottom( false, false, 248.5, 256.5 )
	FEFocusBarSolid0:setRGB( 0, 0, 0 )
	FEFocusBarSolid0:setAlpha( 0.7 )
	FEFocusBarSolid0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid0:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarSolid0:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid0 )
	self.FEFocusBarSolid0 = FEFocusBarSolid0
	
	local FEFocusBarAdd0 = LUI.UIImage.new()
	FEFocusBarAdd0:setLeftRight( true, true, -24, 25 )
	FEFocusBarAdd0:setTopBottom( false, false, 248.5, 256.5 )
	FEFocusBarAdd0:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd0:setAlpha( 0.99 )
	FEFocusBarAdd0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd0:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarAdd0:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd0 )
	self.FEFocusBarAdd0 = FEFocusBarAdd0
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( true, true, 0, 0 )
	buttonBacking:setTopBottom( false, true, -147.5, -111.5 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( true, false, 53, 485 )
	buttons:setTopBottom( false, true, -153.5, -121.5 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( false, false, -160, -59 )
	RankIcon:setTopBottom( true, false, 148, 249 )
	RankIcon:setImage( RegisterImage( GetRankIconLarge( CombatRecordGetRankIcon( controller, "uie_t7_icon_rank_mp_level_25_lrg" ) ) ) )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local ArenaRankIcon = LUI.UIImage.new()
	ArenaRankIcon:setLeftRight( false, false, -165, -37 )
	ArenaRankIcon:setTopBottom( true, false, 133, 261 )
	ArenaRankIcon:setImage( RegisterImage( GetArenaRankIconLG( CombatRecordGetStat( controller, "arenaBest.points", "uie_t7_icon_rank_arena_level_21_lrg" ) ) ) )
	self:addElement( ArenaRankIcon )
	self.ArenaRankIcon = ArenaRankIcon
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( false, false, -19, 127 )
	RankNameBackground:setTopBottom( true, false, 169, 197 )
	RankNameBackground:setAlpha( 0.7 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( false, false, -19, 127 )
	RankBackground:setTopBottom( true, false, 197, 225 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( false, false, -19, 127 )
	RankName:setTopBottom( true, false, 173, 193 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setText( Engine.Localize( CombatRecordGetRankTitle( controller, "Vindicator" ) ) )
	RankName:setTTF( "fonts/escom.ttf" )
	RankName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	RankName:setShaderVector( 0, 0.05, 0, 0, 0 )
	RankName:setShaderVector( 1, 0, 0, 0, 0 )
	RankName:setShaderVector( 2, 1, 0, 0, 0 )
	RankName:setLetterSpacing( 1 )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankName )
	self.RankName = RankName
	
	local ArenaRankName = LUI.UIText.new()
	ArenaRankName:setLeftRight( false, false, -11, 135 )
	ArenaRankName:setTopBottom( true, false, 173, 193 )
	ArenaRankName:setRGB( 0, 0, 0 )
	ArenaRankName:setText( Engine.Localize( SetValueIfEmptyString( "--", CombatRecordGetArenaBestPlaylistName( controller, "-" ) ) ) )
	ArenaRankName:setTTF( "fonts/escom.ttf" )
	ArenaRankName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ArenaRankName:setShaderVector( 0, 0.05, 0, 0, 0 )
	ArenaRankName:setShaderVector( 1, 0, 0, 0, 0 )
	ArenaRankName:setShaderVector( 2, 1, 0, 0, 0 )
	ArenaRankName:setLetterSpacing( 1 )
	ArenaRankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ArenaRankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ArenaRankName )
	self.ArenaRankName = ArenaRankName
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( false, false, -19, 127 )
	Rank:setTopBottom( true, false, 197, 225 )
	Rank:setRGB( CombatRecordGetParagonColorByRank( controller, 255, 255, 255, 1, 1, 1 ) )
	Rank:setText( RankToLevelString( "mp", CombatRecordGetStat( controller, "playerstatslist.rank", "Level 88" ) ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local ArenaRank = LUI.UIText.new()
	ArenaRank:setLeftRight( false, false, -11, 135 )
	ArenaRank:setTopBottom( true, false, 198.5, 223.5 )
	ArenaRank:setText( Engine.Localize( GetArenaRankName( CombatRecordGetStat( controller, "arenaBest.points", "Rank 15" ) ) ) )
	ArenaRank:setTTF( "fonts/escom.ttf" )
	ArenaRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ArenaRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ArenaRank )
	self.ArenaRank = ArenaRank
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( self, controller )
	StartMenuframenoBG00:setLeftRight( false, false, -22, 130 )
	StartMenuframenoBG00:setTopBottom( true, false, 165.5, 226.5 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local CallingCardShowcaseList = LUI.UIList.new( self, controller, 4, 0, nil, false, false, 0, 0, false, false )
	CallingCardShowcaseList:makeFocusable()
	CallingCardShowcaseList:setLeftRight( true, false, 490.5, 790.5 )
	CallingCardShowcaseList:setTopBottom( true, false, 312.5, 545.5 )
	CallingCardShowcaseList:setWidgetType( CoD.CombatRecordCallingCard )
	CallingCardShowcaseList:setVerticalCount( 3 )
	CallingCardShowcaseList:setSpacing( 4 )
	CallingCardShowcaseList:setDataSource( "CombatRecordCallingCardShowcase" )
	self:addElement( CallingCardShowcaseList )
	self.CallingCardShowcaseList = CallingCardShowcaseList
	
	local CallingCardShowcaseLabel = LUI.UITightText.new()
	CallingCardShowcaseLabel:setLeftRight( true, false, 490.5, 650.5 )
	CallingCardShowcaseLabel:setTopBottom( true, false, 281.5, 306.5 )
	CallingCardShowcaseLabel:setText( Engine.Localize( "MENU_CALLING_CARD_SHOWCASE_CAPS" ) )
	CallingCardShowcaseLabel:setTTF( "fonts/default.ttf" )
	self:addElement( CallingCardShowcaseLabel )
	self.CallingCardShowcaseLabel = CallingCardShowcaseLabel
	
	local callingCard = CoD.Social_CallingCard.new( self, controller )
	callingCard:setLeftRight( true, false, 83, 411 )
	callingCard:setTopBottom( true, false, 156.2, 235.8 )
	callingCard:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		callingCard:setModel( model, controller )
	end )
	callingCard:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		callingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( callingCard )
	self.callingCard = callingCard
	
	local Kills = CoD.CombatRecordSummaryStat.new( self, controller )
	Kills:setLeftRight( true, false, 840.25, 945.42 )
	Kills:setTopBottom( true, false, 189.8, 235.8 )
	Kills.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills", "888" ) ) )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Wins = CoD.CombatRecordSummaryStat.new( self, controller )
	Wins:setLeftRight( true, false, 956.42, 1071.09 )
	Wins:setTopBottom( true, false, 189.8, 235.8 )
	Wins.StatLabel:setText( Engine.Localize( "MENU_WINS_CAPS" ) )
	Wins.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.wins", "888" ) ) )
	self:addElement( Wins )
	self.Wins = Wins
	
	local Score = CoD.CombatRecordSummaryStat.new( self, controller )
	Score:setLeftRight( true, false, 1077.09, 1200.75 )
	Score:setTopBottom( true, false, 190.8, 236.8 )
	Score.StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	Score.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.score", "888" ) ) )
	self:addElement( Score )
	self.Score = Score
	
	local PublicMatchCareerLabel = LUI.UIText.new()
	PublicMatchCareerLabel:setLeftRight( true, false, 863.75, 1163.75 )
	PublicMatchCareerLabel:setTopBottom( true, false, 137.5, 162.5 )
	PublicMatchCareerLabel:setText( Engine.Localize( "MENU_PUBLIC_MATCH_CAREER_CAPS" ) )
	PublicMatchCareerLabel:setTTF( "fonts/default.ttf" )
	PublicMatchCareerLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PublicMatchCareerLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PublicMatchCareerLabel )
	self.PublicMatchCareerLabel = PublicMatchCareerLabel
	
	local ArenaCareerLabel = LUI.UIText.new()
	ArenaCareerLabel:setLeftRight( true, false, 863.75, 1163.75 )
	ArenaCareerLabel:setTopBottom( true, false, 136.5, 161.5 )
	ArenaCareerLabel:setAlpha( 0 )
	ArenaCareerLabel:setText( Engine.Localize( "MENU_ARENA_CAREER_CAPS" ) )
	ArenaCareerLabel:setTTF( "fonts/default.ttf" )
	ArenaCareerLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ArenaCareerLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ArenaCareerLabel )
	self.ArenaCareerLabel = ArenaCareerLabel
	
	local FavoriteSpecialistLabel = LUI.UITightText.new()
	FavoriteSpecialistLabel:setLeftRight( true, false, 83.25, 243.25 )
	FavoriteSpecialistLabel:setTopBottom( true, false, 281.5, 306.5 )
	FavoriteSpecialistLabel:setText( Engine.Localize( "MENU_DEADLIEST_SPECIALIST_CAPS" ) )
	FavoriteSpecialistLabel:setTTF( "fonts/default.ttf" )
	self:addElement( FavoriteSpecialistLabel )
	self.FavoriteSpecialistLabel = FavoriteSpecialistLabel
	
	local FavoriteSpecialistImage = LUI.UIImage.new()
	FavoriteSpecialistImage:setLeftRight( true, false, 83.25, 316.25 )
	FavoriteSpecialistImage:setTopBottom( true, false, 312.5, 545.5 )
	FavoriteSpecialistImage:subscribeToGlobalModel( controller, "FavoriteSpecialist", "heroImage", function ( model )
		local heroImage = Engine.GetModelValue( model )
		if heroImage then
			FavoriteSpecialistImage:setImage( RegisterImage( heroImage ) )
		end
	end )
	self:addElement( FavoriteSpecialistImage )
	self.FavoriteSpecialistImage = FavoriteSpecialistImage
	
	local FavoriteSpecialistName = CoD.scorestreaks_BoxLabel.new( self, controller )
	FavoriteSpecialistName:setLeftRight( true, false, 83.25, 316.25 )
	FavoriteSpecialistName:setTopBottom( true, false, 526.5, 545.5 )
	FavoriteSpecialistName:subscribeToGlobalModel( controller, "FavoriteSpecialist", "displayString", function ( model )
		local displayString = Engine.GetModelValue( model )
		if displayString then
			FavoriteSpecialistName.name:setText( Engine.Localize( displayString ) )
		end
	end )
	self:addElement( FavoriteSpecialistName )
	self.FavoriteSpecialistName = FavoriteSpecialistName
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( self, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, 83.25, -831.5 )
	BoxButtonLrgInactive:setTopBottom( true, true, 312.5, -174.5 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CombatRecordSummaryStat0 = CoD.CombatRecordSummaryStat.new( self, controller )
	CombatRecordSummaryStat0:setLeftRight( true, false, 324.84, 430 )
	CombatRecordSummaryStat0:setTopBottom( true, false, 336, 382 )
	CombatRecordSummaryStat0.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	CombatRecordSummaryStat0:subscribeToGlobalModel( controller, "FavoriteSpecialist", "numKills", function ( model )
		local numKills = Engine.GetModelValue( model )
		if numKills then
			CombatRecordSummaryStat0.StatValue:setText( Engine.Localize( numKills ) )
		end
	end )
	self:addElement( CombatRecordSummaryStat0 )
	self.CombatRecordSummaryStat0 = CombatRecordSummaryStat0
	
	local PrimaryProfileSnapshot = CoD.Primary_Profile_Snapshot.new( self, controller )
	PrimaryProfileSnapshot:setLeftRight( true, false, 817.75, 1209.75 )
	PrimaryProfileSnapshot:setTopBottom( true, false, 312.5, 545.5 )
	PrimaryProfileSnapshot.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_screenshots" ) )
	self:addElement( PrimaryProfileSnapshot )
	self.PrimaryProfileSnapshot = PrimaryProfileSnapshot
	
	local CallingCardShowcaseLabel0 = LUI.UITightText.new()
	CallingCardShowcaseLabel0:setLeftRight( true, false, 817.75, 935.75 )
	CallingCardShowcaseLabel0:setTopBottom( true, false, 281.5, 306.5 )
	CallingCardShowcaseLabel0:setText( Engine.Localize( "MENU_PROFILE_SNAPSHOT_CAPS" ) )
	CallingCardShowcaseLabel0:setTTF( "fonts/default.ttf" )
	self:addElement( CallingCardShowcaseLabel0 )
	self.CallingCardShowcaseLabel0 = CallingCardShowcaseLabel0
	
	local Image500 = LUI.UIImage.new()
	Image500:setLeftRight( true, true, 64, -64 )
	Image500:setTopBottom( true, false, 135.5, 138 )
	Image500:setAlpha( 0.25 )
	Image500:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image500:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image500 )
	self.Image500 = Image500
	
	local Image50 = LUI.UIImage.new()
	Image50:setLeftRight( true, true, 64, -64 )
	Image50:setTopBottom( true, false, 260.5, 263.5 )
	Image50:setAlpha( 0.25 )
	Image50:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image50:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image50 )
	self.Image50 = Image50
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 448.5, 450.5 )
	Image0:setTopBottom( true, false, 136.75, 261.8 )
	Image0:setAlpha( 0.35 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( true, false, 816.5, 818.5 )
	Image000:setTopBottom( true, false, 136.75, 261.8 )
	Image000:setAlpha( 0.35 )
	Image000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local CombatRecordLineDivider20 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider20:setLeftRight( true, false, 437, 462 )
	CombatRecordLineDivider20:setTopBottom( true, false, 253, 266 )
	CombatRecordLineDivider20:setZRot( 180 )
	self:addElement( CombatRecordLineDivider20 )
	self.CombatRecordLineDivider20 = CombatRecordLineDivider20
	
	local CombatRecordLineDivider1 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider1:setLeftRight( true, false, 437, 462 )
	CombatRecordLineDivider1:setTopBottom( true, false, 133, 146 )
	self:addElement( CombatRecordLineDivider1 )
	self.CombatRecordLineDivider1 = CombatRecordLineDivider1
	
	local CombatRecordLineDivider200 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider200:setLeftRight( true, false, 805, 830 )
	CombatRecordLineDivider200:setTopBottom( true, false, 253, 266 )
	CombatRecordLineDivider200:setZRot( 180 )
	self:addElement( CombatRecordLineDivider200 )
	self.CombatRecordLineDivider200 = CombatRecordLineDivider200
	
	local CombatRecordLineDivider10 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider10:setLeftRight( true, false, 805, 830 )
	CombatRecordLineDivider10:setTopBottom( true, false, 133, 146 )
	self:addElement( CombatRecordLineDivider10 )
	self.CombatRecordLineDivider10 = CombatRecordLineDivider10
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 818.5, -64 )
	Image00:setTopBottom( false, true, -560.5, -554.5 )
	Image00:setAlpha( 0.25 )
	Image00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( true, false, 952.5, 954.5 )
	Image0000:setTopBottom( true, false, 193, 230.8 )
	Image0000:setAlpha( 0.35 )
	Image0000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( true, false, 1073.5, 1075.5 )
	Image00000:setTopBottom( true, false, 193, 230.8 )
	Image00000:setAlpha( 0.35 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 64, -1190 )
	Image3:setTopBottom( true, false, 132.5, 140.5 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, true, 64, -1190 )
	Image30:setTopBottom( true, false, 257.8, 265.8 )
	Image30:setAlpha( 0.66 )
	Image30:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( true, true, 1190, -64 )
	Image31:setTopBottom( true, false, 257.8, 265.8 )
	Image31:setAlpha( 0.66 )
	Image31:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image310 = LUI.UIImage.new()
	Image310:setLeftRight( true, true, 1190, -64 )
	Image310:setTopBottom( true, false, 132.5, 140.5 )
	Image310:setAlpha( 0.66 )
	Image310:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image310:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image310 )
	self.Image310 = Image310
	
	local Image001 = LUI.UIImage.new()
	Image001:setLeftRight( true, true, 324.84, -850 )
	Image001:setTopBottom( false, true, -395.5, -389.5 )
	Image001:setAlpha( 0.25 )
	Image001:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image001 )
	self.Image001 = Image001
	
	local Image0010 = LUI.UIImage.new()
	Image0010:setLeftRight( true, true, 324.84, -850 )
	Image0010:setTopBottom( false, true, -334.5, -328.5 )
	Image0010:setAlpha( 0.25 )
	Image0010:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image0010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0010 )
	self.Image0010 = Image0010
	
	CallingCardShowcaseList.navigation = {
		right = PrimaryProfileSnapshot
	}
	PrimaryProfileSnapshot.navigation = {
		left = CallingCardShowcaseList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				RankIcon:completeAnimation()
				self.RankIcon:setAlpha( 1 )
				self.clipFinished( RankIcon, {} )
				ArenaRankIcon:completeAnimation()
				self.ArenaRankIcon:setAlpha( 0 )
				self.clipFinished( ArenaRankIcon, {} )
				RankName:completeAnimation()
				self.RankName:setAlpha( 1 )
				self.clipFinished( RankName, {} )
				ArenaRankName:completeAnimation()
				self.ArenaRankName:setAlpha( 0 )
				self.clipFinished( ArenaRankName, {} )
				ArenaRank:completeAnimation()
				self.ArenaRank:setAlpha( 0 )
				self.clipFinished( ArenaRank, {} )
				PublicMatchCareerLabel:completeAnimation()
				self.PublicMatchCareerLabel:setAlpha( 1 )
				self.clipFinished( PublicMatchCareerLabel, {} )
				ArenaCareerLabel:completeAnimation()
				self.ArenaCareerLabel:setAlpha( 0 )
				self.clipFinished( ArenaCareerLabel, {} )
			end
		},
		Arena = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				RankIcon:completeAnimation()
				self.RankIcon:setAlpha( 1 )
				self.clipFinished( RankIcon, {} )
				ArenaRankIcon:completeAnimation()
				self.ArenaRankIcon:setAlpha( 1 )
				self.clipFinished( ArenaRankIcon, {} )
				RankName:completeAnimation()
				self.RankName:setAlpha( 1 )
				self.clipFinished( RankName, {} )
				ArenaRankName:completeAnimation()
				self.ArenaRankName:setAlpha( 1 )
				self.clipFinished( ArenaRankName, {} )
				Rank:completeAnimation()
				self.Rank:setAlpha( 1 )
				self.clipFinished( Rank, {} )
				PublicMatchCareerLabel:completeAnimation()
				self.PublicMatchCareerLabel:setAlpha( 0 )
				self.clipFinished( PublicMatchCareerLabel, {} )
				ArenaCareerLabel:completeAnimation()
				self.ArenaCareerLabel:setAlpha( 1 )
				self.clipFinished( ArenaCareerLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Arena",
			condition = function ( menu, element, event )
				return IsArenaMode()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	buttons:setModel( self.buttonModel, controller )
	CallingCardShowcaseList.id = "CallingCardShowcaseList"
	PrimaryProfileSnapshot.id = "PrimaryProfileSnapshot"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.PrimaryProfileSnapshot:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteBack:close()
		element.buttons:close()
		element.StartMenuframenoBG00:close()
		element.CallingCardShowcaseList:close()
		element.callingCard:close()
		element.Kills:close()
		element.Wins:close()
		element.Score:close()
		element.FavoriteSpecialistName:close()
		element.BoxButtonLrgInactive:close()
		element.CombatRecordSummaryStat0:close()
		element.PrimaryProfileSnapshot:close()
		element.CombatRecordLineDivider20:close()
		element.CombatRecordLineDivider1:close()
		element.CombatRecordLineDivider200:close()
		element.CombatRecordLineDivider10:close()
		element.FavoriteSpecialistImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_InspectPlayerPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

