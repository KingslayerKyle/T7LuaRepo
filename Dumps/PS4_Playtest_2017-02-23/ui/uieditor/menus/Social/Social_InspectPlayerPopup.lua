require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )
require( "ui.uieditor.widgets.Barracks.CombatRecordCallingCard" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStat" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Primary_Profile_Snapshot" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_BoxLabel" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

LUI.createMenu.Social_InspectPlayerPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_InspectPlayerPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_InspectPlayerPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( 0, 1, 0, 0 )
	VignetteBack:setTopBottom( 0, 1, 0, 0 )
	VignetteBack:setAlpha( 0.75 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( 0, 1, 0, 0 )
	darkbg:setTopBottom( 0, 1, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.7 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 1, 0, 0 )
	Black:setTopBottom( 0, 1, 157, -161 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.9 )
	self:addElement( Black )
	self.Black = Black
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( 0, 0, 20, 1941 )
	TextureBackground:setTopBottom( 0, 0, 0, 1080 )
	TextureBackground:setAlpha( 0.25 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg2" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid:setTopBottom( 0.5, 0.5, -381, -369 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( 0, 1, -36, 38 )
	FEFocusBarAdd:setTopBottom( 0.5, 0.5, -386, -374 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local FEFocusBarSolid0 = LUI.UIImage.new()
	FEFocusBarSolid0:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid0:setTopBottom( 0.5, 0.5, 373, 385 )
	FEFocusBarSolid0:setRGB( 0, 0, 0 )
	FEFocusBarSolid0:setAlpha( 0.7 )
	FEFocusBarSolid0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid0:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarSolid0:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarSolid0 )
	self.FEFocusBarSolid0 = FEFocusBarSolid0
	
	local FEFocusBarAdd0 = LUI.UIImage.new()
	FEFocusBarAdd0:setLeftRight( 0, 1, -36, 38 )
	FEFocusBarAdd0:setTopBottom( 0.5, 0.5, 373, 385 )
	FEFocusBarAdd0:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd0:setAlpha( 0.99 )
	FEFocusBarAdd0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd0:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd0:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd0 )
	self.FEFocusBarAdd0 = FEFocusBarAdd0
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( 0, 1, 0, 0 )
	buttonBacking:setTopBottom( 1, 1, -221, -167 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( 0, 0, 80, 728 )
	buttons:setTopBottom( 1, 1, -230, -182 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( 0.5, 0.5, -240, -88 )
	RankIcon:setTopBottom( 0, 0, 222, 374 )
	RankIcon:setImage( RegisterImage( GetRankIconLarge( CombatRecordGetRankIcon( controller, "uie_t7_icon_rank_mp_level_25_lrg" ) ) ) )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local ArenaRankIcon = LUI.UIImage.new()
	ArenaRankIcon:setLeftRight( 0.5, 0.5, -248, -56 )
	ArenaRankIcon:setTopBottom( 0, 0, 200, 392 )
	ArenaRankIcon:setImage( RegisterImage( GetArenaRankIconLG( CombatRecordGetStat( controller, "arenaBest.points", "t7_icon_rank_arena_level_21_lrg" ) ) ) )
	self:addElement( ArenaRankIcon )
	self.ArenaRankIcon = ArenaRankIcon
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( 0.5, 0.5, -28, 191 )
	RankNameBackground:setTopBottom( 0, 0, 253, 295 )
	RankNameBackground:setAlpha( 0.7 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( 0.5, 0.5, -28, 191 )
	RankBackground:setTopBottom( 0, 0, 295, 337 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( 0.5, 0.5, -28, 191 )
	RankName:setTopBottom( 0, 0, 259, 289 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setText( Engine.Localize( CombatRecordGetRankTitle( controller, "Vindicator" ) ) )
	RankName:setTTF( "fonts/escom.ttf" )
	RankName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	RankName:setShaderVector( 0, 0.05, 0, 0, 0 )
	RankName:setShaderVector( 1, 0, 0, 0, 0 )
	RankName:setShaderVector( 2, 1, 0, 0, 0 )
	RankName:setLetterSpacing( 1 )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankName )
	self.RankName = RankName
	
	local ArenaRankName = LUI.UIText.new()
	ArenaRankName:setLeftRight( 0.5, 0.5, -16, 203 )
	ArenaRankName:setTopBottom( 0, 0, 259, 289 )
	ArenaRankName:setRGB( 0, 0, 0 )
	ArenaRankName:setText( Engine.Localize( SetValueIfEmptyString( "--", CombatRecordGetStat( controller, "arenaBestPlaylist", "-" ) ) ) )
	ArenaRankName:setTTF( "fonts/escom.ttf" )
	ArenaRankName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	ArenaRankName:setShaderVector( 0, 0.05, 0, 0, 0 )
	ArenaRankName:setShaderVector( 1, 0, 0, 0, 0 )
	ArenaRankName:setShaderVector( 2, 1, 0, 0, 0 )
	ArenaRankName:setLetterSpacing( 1 )
	ArenaRankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ArenaRankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ArenaRankName )
	self.ArenaRankName = ArenaRankName
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0.5, 0.5, -28, 191 )
	Rank:setTopBottom( 0, 0, 295, 337 )
	Rank:setRGB( CombatRecordGetParagonColorByRank( controller, 255, 255, 255, 1, 1, 1 ) )
	Rank:setText( RankToLevelString( "mp", CombatRecordGetStat( controller, "playerstatslist.rank", "Level 88" ) ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local ArenaRank = LUI.UIText.new()
	ArenaRank:setLeftRight( 0.5, 0.5, -16, 203 )
	ArenaRank:setTopBottom( 0, 0, 297, 335 )
	ArenaRank:setText( Engine.Localize( GetArenaRankName( CombatRecordGetStat( controller, "arenaBest.points", "Rank 15" ) ) ) )
	ArenaRank:setTTF( "fonts/escom.ttf" )
	ArenaRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ArenaRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ArenaRank )
	self.ArenaRank = ArenaRank
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( self, controller )
	StartMenuframenoBG00:setLeftRight( 0.5, 0.5, -33, 195 )
	StartMenuframenoBG00:setTopBottom( 0, 0, 248, 340 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local CallingCardShowcaseList = LUI.UIList.new( self, controller, 6, 0, nil, false, false, 0, 0, false, false )
	CallingCardShowcaseList:makeFocusable()
	CallingCardShowcaseList:setLeftRight( 0, 0, 736, 1186 )
	CallingCardShowcaseList:setTopBottom( 0, 0, 470, 818 )
	CallingCardShowcaseList:setWidgetType( CoD.CombatRecordCallingCard )
	CallingCardShowcaseList:setVerticalCount( 3 )
	CallingCardShowcaseList:setSpacing( 6 )
	CallingCardShowcaseList:setDataSource( "CombatRecordCallingCardShowcase" )
	self:addElement( CallingCardShowcaseList )
	self.CallingCardShowcaseList = CallingCardShowcaseList
	
	local CallingCardShowcaseLabel = LUI.UITightText.new()
	CallingCardShowcaseLabel:setLeftRight( 0, 0, 736, 976 )
	CallingCardShowcaseLabel:setTopBottom( 0, 0, 422, 460 )
	CallingCardShowcaseLabel:setText( Engine.Localize( "MENU_CALLING_CARD_SHOWCASE_CAPS" ) )
	CallingCardShowcaseLabel:setTTF( "fonts/default.ttf" )
	self:addElement( CallingCardShowcaseLabel )
	self.CallingCardShowcaseLabel = CallingCardShowcaseLabel
	
	local callingCard = CoD.Social_CallingCard.new( self, controller )
	callingCard:setLeftRight( 0, 0, 124, 616 )
	callingCard:setTopBottom( 0, 0, 234, 353 )
	callingCard:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		callingCard:setModel( model, controller )
	end )
	callingCard:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		callingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( callingCard )
	self.callingCard = callingCard
	
	local Kills = CoD.CombatRecordSummaryStat.new( self, controller )
	Kills:setLeftRight( 0, 0, 1260, 1418 )
	Kills:setTopBottom( 0, 0, 284.5, 353.5 )
	Kills.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills", "888" ) ) )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Wins = CoD.CombatRecordSummaryStat.new( self, controller )
	Wins:setLeftRight( 0, 0, 1435, 1607 )
	Wins:setTopBottom( 0, 0, 284.5, 353.5 )
	Wins.StatLabel:setText( Engine.Localize( "MENU_WINS_CAPS" ) )
	Wins.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.wins", "888" ) ) )
	self:addElement( Wins )
	self.Wins = Wins
	
	local Score = CoD.CombatRecordSummaryStat.new( self, controller )
	Score:setLeftRight( 0, 0, 1615, 1801 )
	Score:setTopBottom( 0, 0, 286.5, 355.5 )
	Score.StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	Score.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.score", "888" ) ) )
	self:addElement( Score )
	self.Score = Score
	
	local PublicMatchCareerLabel = LUI.UIText.new()
	PublicMatchCareerLabel:setLeftRight( 0, 0, 1296, 1746 )
	PublicMatchCareerLabel:setTopBottom( 0, 0, 206, 244 )
	PublicMatchCareerLabel:setText( Engine.Localize( "MENU_PUBLIC_MATCH_CAREER_CAPS" ) )
	PublicMatchCareerLabel:setTTF( "fonts/default.ttf" )
	PublicMatchCareerLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PublicMatchCareerLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PublicMatchCareerLabel )
	self.PublicMatchCareerLabel = PublicMatchCareerLabel
	
	local ArenaCareerLabel = LUI.UIText.new()
	ArenaCareerLabel:setLeftRight( 0, 0, 1296, 1746 )
	ArenaCareerLabel:setTopBottom( 0, 0, 205, 243 )
	ArenaCareerLabel:setAlpha( 0 )
	ArenaCareerLabel:setText( Engine.Localize( "MENU_ARENA_CAREER_CAPS" ) )
	ArenaCareerLabel:setTTF( "fonts/default.ttf" )
	ArenaCareerLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ArenaCareerLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ArenaCareerLabel )
	self.ArenaCareerLabel = ArenaCareerLabel
	
	local FavoriteSpecialistLabel = LUI.UITightText.new()
	FavoriteSpecialistLabel:setLeftRight( 0, 0, 125, 365 )
	FavoriteSpecialistLabel:setTopBottom( 0, 0, 422, 460 )
	FavoriteSpecialistLabel:setText( Engine.Localize( "MENU_DEADLIEST_SPECIALIST_CAPS" ) )
	FavoriteSpecialistLabel:setTTF( "fonts/default.ttf" )
	self:addElement( FavoriteSpecialistLabel )
	self.FavoriteSpecialistLabel = FavoriteSpecialistLabel
	
	local FavoriteSpecialistImage = LUI.UIImage.new()
	FavoriteSpecialistImage:setLeftRight( 0, 0, 125, 474 )
	FavoriteSpecialistImage:setTopBottom( 0, 0, 469, 819 )
	FavoriteSpecialistImage:subscribeToGlobalModel( controller, "FavoriteSpecialist", "heroImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FavoriteSpecialistImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( FavoriteSpecialistImage )
	self.FavoriteSpecialistImage = FavoriteSpecialistImage
	
	local FavoriteSpecialistName = CoD.scorestreaks_BoxLabel.new( self, controller )
	FavoriteSpecialistName:setLeftRight( 0, 0, 125, 474 )
	FavoriteSpecialistName:setTopBottom( 0, 0, 790, 818 )
	FavoriteSpecialistName:subscribeToGlobalModel( controller, "FavoriteSpecialist", "displayString", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FavoriteSpecialistName.name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FavoriteSpecialistName )
	self.FavoriteSpecialistName = FavoriteSpecialistName
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( self, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, 125, -1247 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, 469, -261 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CombatRecordSummaryStat0 = CoD.CombatRecordSummaryStat.new( self, controller )
	CombatRecordSummaryStat0:setLeftRight( 0, 0, 487, 645 )
	CombatRecordSummaryStat0:setTopBottom( 0, 0, 503.5, 572.5 )
	CombatRecordSummaryStat0.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	CombatRecordSummaryStat0:subscribeToGlobalModel( controller, "FavoriteSpecialist", "numKills", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatRecordSummaryStat0.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CombatRecordSummaryStat0 )
	self.CombatRecordSummaryStat0 = CombatRecordSummaryStat0
	
	local PrimaryProfileSnapshot = CoD.Primary_Profile_Snapshot.new( self, controller )
	PrimaryProfileSnapshot:setLeftRight( 0, 0, 1227, 1815 )
	PrimaryProfileSnapshot:setTopBottom( 0, 0, 469, 819 )
	PrimaryProfileSnapshot.ImageContainer.ImageContainer:setImage( RegisterImage( "t7_menu_startmenu_identity_screenshots" ) )
	self:addElement( PrimaryProfileSnapshot )
	self.PrimaryProfileSnapshot = PrimaryProfileSnapshot
	
	local CallingCardShowcaseLabel0 = LUI.UITightText.new()
	CallingCardShowcaseLabel0:setLeftRight( 0, 0, 1227, 1404 )
	CallingCardShowcaseLabel0:setTopBottom( 0, 0, 422, 460 )
	CallingCardShowcaseLabel0:setText( Engine.Localize( "MENU_PROFILE_SNAPSHOT_CAPS" ) )
	CallingCardShowcaseLabel0:setTTF( "fonts/default.ttf" )
	self:addElement( CallingCardShowcaseLabel0 )
	self.CallingCardShowcaseLabel0 = CallingCardShowcaseLabel0
	
	local Image500 = LUI.UIImage.new()
	Image500:setLeftRight( 0, 1, 96, -96 )
	Image500:setTopBottom( 0, 0, 203, 207 )
	Image500:setAlpha( 0.25 )
	Image500:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image500:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image500 )
	self.Image500 = Image500
	
	local Image50 = LUI.UIImage.new()
	Image50:setLeftRight( 0, 1, 96, -96 )
	Image50:setTopBottom( 0, 0, 391, 395 )
	Image50:setAlpha( 0.25 )
	Image50:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image50:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image50 )
	self.Image50 = Image50
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 673, 676 )
	Image0:setTopBottom( 0, 0, 205, 393 )
	Image0:setAlpha( 0.35 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( 0, 0, 1225, 1228 )
	Image000:setTopBottom( 0, 0, 205, 393 )
	Image000:setAlpha( 0.35 )
	Image000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local CombatRecordLineDivider20 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider20:setLeftRight( 0, 0, 655, 693 )
	CombatRecordLineDivider20:setTopBottom( 0, 0, 379, 399 )
	CombatRecordLineDivider20:setZRot( 180 )
	self:addElement( CombatRecordLineDivider20 )
	self.CombatRecordLineDivider20 = CombatRecordLineDivider20
	
	local CombatRecordLineDivider1 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider1:setLeftRight( 0, 0, 655, 693 )
	CombatRecordLineDivider1:setTopBottom( 0, 0, 199, 219 )
	self:addElement( CombatRecordLineDivider1 )
	self.CombatRecordLineDivider1 = CombatRecordLineDivider1
	
	local CombatRecordLineDivider200 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider200:setLeftRight( 0, 0, 1207, 1245 )
	CombatRecordLineDivider200:setTopBottom( 0, 0, 379, 399 )
	CombatRecordLineDivider200:setZRot( 180 )
	self:addElement( CombatRecordLineDivider200 )
	self.CombatRecordLineDivider200 = CombatRecordLineDivider200
	
	local CombatRecordLineDivider10 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider10:setLeftRight( 0, 0, 1207, 1245 )
	CombatRecordLineDivider10:setTopBottom( 0, 0, 199, 219 )
	self:addElement( CombatRecordLineDivider10 )
	self.CombatRecordLineDivider10 = CombatRecordLineDivider10
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 1, 1228, -96 )
	Image00:setTopBottom( 1, 1, -841, -832 )
	Image00:setAlpha( 0.25 )
	Image00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( 0, 0, 1429, 1432 )
	Image0000:setTopBottom( 0, 0, 289, 346 )
	Image0000:setAlpha( 0.35 )
	Image0000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( 0, 0, 1610, 1613 )
	Image00000:setTopBottom( 0, 0, 289, 346 )
	Image00000:setAlpha( 0.35 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 1, 96, -1784 )
	Image3:setTopBottom( 0, 0, 199, 211 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 0, 1, 96, -1784 )
	Image30:setTopBottom( 0, 0, 387, 399 )
	Image30:setAlpha( 0.66 )
	Image30:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( 0, 1, 1784, -96 )
	Image31:setTopBottom( 0, 0, 387, 399 )
	Image31:setAlpha( 0.66 )
	Image31:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image310 = LUI.UIImage.new()
	Image310:setLeftRight( 0, 1, 1784, -96 )
	Image310:setTopBottom( 0, 0, 199, 211 )
	Image310:setAlpha( 0.66 )
	Image310:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image310:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image310 )
	self.Image310 = Image310
	
	local Image001 = LUI.UIImage.new()
	Image001:setLeftRight( 0, 1, 487, -1275 )
	Image001:setTopBottom( 1, 1, -593, -584 )
	Image001:setAlpha( 0.25 )
	Image001:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image001 )
	self.Image001 = Image001
	
	local Image0010 = LUI.UIImage.new()
	Image0010:setLeftRight( 0, 1, 487, -1275 )
	Image0010:setTopBottom( 1, 1, -502, -493 )
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
	self.resetProperties = function ()
		ArenaRankIcon:completeAnimation()
		ArenaRankName:completeAnimation()
		ArenaRank:completeAnimation()
		PublicMatchCareerLabel:completeAnimation()
		ArenaCareerLabel:completeAnimation()
		ArenaRankIcon:setAlpha( 1 )
		ArenaRankName:setAlpha( 1 )
		ArenaRank:setAlpha( 1 )
		PublicMatchCareerLabel:setAlpha( 1 )
		ArenaCareerLabel:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				ArenaRankIcon:completeAnimation()
				self.ArenaRankIcon:setAlpha( 0 )
				self.clipFinished( ArenaRankIcon, {} )
				ArenaRankName:completeAnimation()
				self.ArenaRankName:setAlpha( 0 )
				self.clipFinished( ArenaRankName, {} )
				ArenaRank:completeAnimation()
				self.ArenaRank:setAlpha( 0 )
				self.clipFinished( ArenaRank, {} )
			end
		},
		Arena = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	buttons:setModel( self.buttonModel, controller )
	CallingCardShowcaseList.id = "CallingCardShowcaseList"
	callingCard.id = "callingCard"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VignetteBack:close()
		self.buttons:close()
		self.StartMenuframenoBG00:close()
		self.CallingCardShowcaseList:close()
		self.callingCard:close()
		self.Kills:close()
		self.Wins:close()
		self.Score:close()
		self.FavoriteSpecialistName:close()
		self.BoxButtonLrgInactive:close()
		self.CombatRecordSummaryStat0:close()
		self.PrimaryProfileSnapshot:close()
		self.CombatRecordLineDivider20:close()
		self.CombatRecordLineDivider1:close()
		self.CombatRecordLineDivider200:close()
		self.CombatRecordLineDivider10:close()
		self.FavoriteSpecialistImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_InspectPlayerPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

