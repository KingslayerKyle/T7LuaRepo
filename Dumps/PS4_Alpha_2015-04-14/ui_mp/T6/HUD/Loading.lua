CoD.Loading = {}
local f0_local0 = CoD.Loading
local f0_local1 = {
	theater = {
		"MPTIP_THEATER_CONTROL_SCHEMES",
		"MPTIP_THEATER_CAMERA_MODES",
		"MPTIP_THEATER_TIMELINE",
		"MPTIP_THEATER_SCOREBOARD",
		"MPTIP_THEATER_MONTAGE",
		"MPTIP_THEATER_PAUSE",
		"MPTIP_THEATER_DISCARD",
		"MPTIP_THEATER_PREVIEW",
		"MPTIP_THEATER_TRANSITIONS",
		"MPTIP_THEATER_FILESHARE",
		"MPTIP_THEATER_RATE",
		"MPTIP_THEATER_SCOREBOARD_SWITCH",
		"MPTIP_THEATER_CLIENTS"
	}
}
local f0_local2 = {
	"MPTIP_CREATE_A_CLASS_TIP",
	"MPTIP_CUSTOM_CLASS_TIP",
	"MPTIP_FRIENDS_LIST_TIP",
	"MPTIP_ASSIST_TIP",
	"MPTIP_CUSTOM_GAME_TIP",
	"MPTIP_SHOOTING_AIRCRAFT_TIP",
	"MPTIP_ENEMY_ON_MINIMAP_TIP",
	"MPTIP_MOTD_TIP",
	"MPTIP_LOOK_SENSITIVITY_TIP",
	"MPTIP_PAUSE_MENU_MAP_TIP",
	"MPTIP_FAST_ADS_WALK_TIP",
	"MPTIP_AUTOMATIC_WEAPONS_TIP",
	"MPTIP_DEAD_ALLIES_TIP",
	"MPTIP_GROUND_WEAPONS_TIP",
	"MPTIP_PISTOL_TIP",
	"MPTIP_LOCK_ON_TIP",
	"MPTIP_ADS_TIP",
	"MPTIP_FOOTSTEPS_TIP",
	"MPTIP_STAY_INSIDE_TIP",
	"MPTIP_MUTE_TIP",
	"MPTIP_THEATER_TIP",
	"MPTIP_HUD_TIP",
	"MPTIP_SLIDE_BOOST_TIP",
	"MPTIP_SLIDE_TIP",
	"MPTIP_CROSSBOW_TIP",
	"MPTIP_AAR_TIP",
	"MPTIP_COMBAT_TRAINING_TIP",
	"MPTIP_MATCH_BONUS_TIP",
	"MPTIP_WILDCARDS_TIP",
	"MPTIP_FRIENDS_BAR_TIP",
	"MPTIP_HELD_KNIFE_TIP",
	"MPTIP_ONE_GUN_PICKUP_TIP",
	"MPTIP_GHOST_FADE_TIP",
	"MPTIP_GLITCH_TIP",
	"MPTIP_OVERDRIVE_TIP",
	"MPTIP_VISIONPULSE_TIP",
	"MPTIP_COMBATFOCUS_TIP",
	"MPTIP_POWER_STEALTH_TIP",
	"MPTIP_SPECIALIST_ACTIVATION_TIP",
	"MPTIP_SPECIALIST_WEAPON_TIP",
	"MPTIP_WALL_RUN_TIP",
	"MPTIP_WALL_RUN_SECONDSTAGE_TIP",
	"MPTIP_MANTLE_FIRE_TIP",
	"MPTIP_SPRINT_RELOAD_TIP",
	"MPTIP_WEAPON_BUTT_TIP",
	"MPTIP_SLIDE_DIRECTION_TIP",
	"MPTIP_THRUSTERS_TIP",
	"MPTIP_SPECIALIST_ABILITY_TIP",
	"MPTIP_HARDCORE_HUD_TIP",
	"MPTIP_HARDCORE_MINIMAP_TIP"
}
local f0_local3 = "MPTIP_WILLY_PETE_TIP"
local f0_local4 = "MPTIP_TOMAHAWK_TIP"
local f0_local5 = "MPTIP_C4_OBJECTIVES_TIP"
local f0_local6 = "MPTIP_GRENADE_SOUND_TIP"
local f0_local7 = "MPTIP_NO_COOKING_TIP"
local f0_local8 = "MPTIP_SHOCK_CHARGE_TIP"
local f0_local9 = "MPTIP_THERMITE_TIP"
local f0_local10 = "MPTIP_TRIPMINE_TIP"
local f0_local11 = "MPTIP_FAST_MAG_TIP"
local f0_local12 = "MPTIP_EXTENDED_MAGS_TIP"
local f0_local13 = "MPTIP_DEEP_IMPACT_TIP"
local f0_local14 = "MPTIP_SUPPRESSOR_TIP"
local f0_local15 = "MPTIP_STEADY_AIM_TIP"
local f0_local16 = "MPTIP_ATTACHMENT_VARIETY_TIP"
local f0_local17 = "MPTIP_ATTACHMENTS_TIP"
local f0_local18 = "MPTIP_TARGET_FINDER_TIP"
local f0_local19 = "MPTIP_UTILITY_TIP"
local f0_local20 = "MPTIP_GHILLIE_SUIT_TIP"
local f0_local21 = "MPTIP_FLAK_TIP"
local f0_local22 = "MPTIP_AFTERBURNER_TIP"
local f0_local23 = "MPTIP_BLASTSUPPRESSOR_TIP"
local f0_local24 = "MPTIP_GUNGHO_TIP"
local f0_local25 = "MPTIP_OVERCLOCK_TIP"
local f0_local26 = "MPTIP_SIXTHSENSE_TIP"
local f0_local27 = "MPTIP_TRACKER_TIP"
local f0_local28 = "MPTIP_ANTEUP_TIP"
local f0_local29 = "MPTIP_KILLSTREAKS_MENU_TIP"
local f0_local30 = "MPTIP_LOOPING_KILLSTREAK_TIP"
local f0_local31 = "MPTIP_KILLSTREAKS_STAY_TIP"
local f0_local32 = "MPTIP_SR71_TIP"
local f0_local33 = "MPTIP_TURRET_TIP"
local f0_local34 = "MPTIP_DETONATE_TIP"
local f0_local35 = "MPTIP_BOOST_TIP"
local f0_local36 = "MPTIP_AUTO_EXPLODE_TIP"
local f0_local37 = "MPTIP_TURRET_MELEE_TIP"
local f0_local38 = "MPTIP_SCORESTREAK_OBJECTIVE_TIP"
local f0_local39 = "MPTIP_REMOTE_CONTROL_TIP"
local f0_local40 = "MPTIP_VTOL_MOVEMENT_TIP"
local f0_local41 = "MPTIP_HELLSTORM_CLUSTER_TIP"
local f0_local42 = "MPTIP_GUARDIAN_TIP"
local f0_local43 = "MPTIP_TARGET_DIAMOND_LOS_TIP"
local f0_local44 = "MPTIP_HCXD_WALLS_TIP"
local f0_local45 = "MPTIP_WRAITH_STEALTH_TIP"
local f0_local46 = "MPTIP_RAPS_DESTROY_TIP"
local f0_local47 = "MPTIP_MOTHERSHIP_JOIN_TIP"
f0_local2[33] = f0_local3
f0_local2[34] = f0_local4
f0_local2[35] = f0_local5
f0_local2[36] = f0_local6
f0_local2[37] = f0_local7
f0_local2[38] = f0_local8
f0_local2[39] = f0_local9
f0_local2[40] = f0_local10
f0_local2[41] = f0_local11
f0_local2[42] = f0_local12
f0_local2[43] = f0_local13
f0_local2[44] = f0_local14
f0_local2[45] = f0_local15
f0_local2[46] = f0_local16
f0_local2[47] = f0_local17
f0_local2[48] = f0_local18
f0_local2[49] = f0_local19
f0_local2[50] = f0_local20
f0_local2[51] = f0_local21
f0_local2[52] = f0_local22
f0_local2[53] = f0_local23
f0_local2[54] = f0_local24
f0_local2[55] = f0_local25
f0_local2[56] = f0_local26
f0_local2[57] = f0_local27
f0_local2[58] = f0_local28
f0_local2[59] = f0_local29
f0_local2[60] = f0_local30
f0_local2[61] = f0_local31
f0_local2[62] = f0_local32
f0_local2[63] = f0_local33
f0_local2[64] = f0_local34
f0_local2[65] = f0_local35
f0_local2[66] = f0_local36
f0_local2[67] = f0_local37
f0_local2[68] = f0_local38
f0_local2[69] = f0_local39
f0_local2[70] = f0_local40
f0_local2[71] = f0_local41
f0_local2[72] = f0_local42
f0_local2[73] = f0_local43
f0_local2[74] = f0_local44
f0_local2[75] = f0_local45
f0_local2[76] = f0_local46
f0_local2[77] = f0_local47
f0_local1.general = f0_local2
f0_local1.public = {
	"MPTIP_XP_SOURCES_TIP",
	"MPTIP_LEADERBOARD_TIP",
	"MPTIP_CHALLENGE_REWARDS_TIP",
	"MPTIP_LEAGUE_GAME_TIP"
}
f0_local1.league = {
	"MPTIP_LEAGUE_WINS_TIP",
	"MPTIP_LEAGUE_BONUS_TIP",
	"MPTIP_LEAGUE_LEAVE_TIP",
	"MPTIP_LEAGUE_EARNING_TIP"
}
f0_local1.sd = {
	"MPTIP_SERACH_AND_DESTROY_TIP"
}
f0_local1.dom = {
	"MPTIP_DOMINATION_TIP"
}
f0_local1.koth = {
	"MPTIP_HARDPOINT_TIP"
}
f0_local1.gun = {
	"MPTIP_WAGER_GOLD_DOT",
	"MPTIP_WAGER_GUN_DEMOTE",
	"MPTIP_WAGER_GUN_SUICIDE"
}
f0_local1.oic = {
	"MPTIP_WAGER_GOLD_DOT",
	"MPTIP_WAGER_OIC_KNIFE",
	"MPTIP_WAGER_OIC_LIVES"
}
f0_local1.shrp = {
	"MPTIP_WAGER_GOLD_DOT",
	"MPTIP_WAGER_SHARP_PERKS",
	"MPTIP_WAGER_SHARP_FINAL"
}
f0_local1.sas = {
	"MPTIP_WAGER_GOLD_DOT",
	"MPTIP_WAGER_STICKS_TOMAHAWK",
	"MPTIP_WAGER_STICKS_POINTS",
	"MPTIP_WAGER_STICKS_SPYPLANE"
}
f0_local1.zombies = {}
f0_local0.DidYouKnow = f0_local1
CoD.Loading.FadeInTime = 1000
CoD.Loading.LoadingDelayTime = 400
CoD.Loading.SpinnerDelayTime = 19000
CoD.Loading.DYKFontName = "Default"
CoD.Loading.DYKFont = CoD.fonts[CoD.Loading.DYKFontName]
CoD.Loading.DYKFontHeight = CoD.textSize[CoD.Loading.DYKFontName]
f0_local0 = function ( image, event )
	if Engine.IsCinematicMp4() then
		if not image.ismp4 then
			image:setImage( RegisterMaterial( "cinematic_mp4" ) )
			image.ismp4 = true
		end
	elseif image.ismp4 then
		image:setImage( RegisterMaterial( "black" ) )
		image.ismp4 = nil
	end
end

CoD.Loading.HideContinueButton = function ( self, event )
	self:beginAnimation( "hide", 1000 )
	self:setAlpha( 0 )
end

f0_local1 = function ( self, event )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	local errorMsg = Dvar.ui_errorMessage:get()
	if errorMsg ~= "" then
		self.errorText = LUI.UIText.new()
		self.errorText:setLeftRight( false, false, -safeAreaWidth / 2, safeAreaWidth / 2 )
		self.errorText:setTopBottom( true, false, 36, 36 + CoD.textSize.Condensed )
		self.errorText:setFont( CoD.fonts.Condensed )
		self.errorText:setAlignment( LUI.Alignment.Left )
		self:addElement( self.errorText )
		self.errorText:setText( errorMsg )
		Dvar.ui_errorMessage:set( "" )
	end
	self.continueButton:registerEventHandler( "hide_continue_button", CoD.Loading.HideContinueButton )
	self.continueButton:addElement( LUI.UITimer.new( 5000, "hide_continue_button", true, self.continueButton ) )
	self.continueButton:beginAnimation( "show", 1000 )
	self.continueButton:setAlpha( 1 )
	return LUI.UIButton.gainFocus( self.continueButton, event )
end

f0_local2 = function ( self, event )
	Engine.Stop3DCinematic( 0 )
end

LUI.createMenu.Loading = function ( controller )
	local loadingMenu = CoD.Menu.NewFromState( "Loading", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	loadingMenu:setOwner( controller )
	loadingMenu:registerEventHandler( "start_loading", CoD.Loading.StartLoading )
	loadingMenu:registerEventHandler( "start_spinner", CoD.Loading.StartSpinner )
	loadingMenu:registerEventHandler( "fade_in_map_location", CoD.Loading.FadeInMapLocation )
	loadingMenu:registerEventHandler( "fade_in_gametype", CoD.Loading.FadeInGametype )
	loadingMenu:registerEventHandler( "fade_in_map_image", CoD.Loading.FadeInMapImage )
	local showMovie = false
	local mapName = Dvar.ui_mapname:get()
	local gameType = Dvar.ui_gametype:get()
	local mapImageName = CoD.GetMapValue( mapName, "loadingImage", "black" )
	if true == Dvar.ui_useloadingmovie:get() then
		local movie = CoD.GetMapValue( mapName, "introMovie" )
		if movie ~= nil and not Engine.IsCinematicPlaying() then
			Engine.StartLoadingCinematic( movie )
		end
		Engine.SetDvar( "ui_useloadingmovie", 0 )
	end
	showMovie = false
	if Dvar.art_review:get() ~= "1" and (CoD.isCampaign or CoD.isZombie) and Engine.IsCinematicStarted() then
		showMovie = true
	end
	if showMovie then
		mapImageName = "black"
	else
		Engine.SetDvar( "ui_useloadingmovie", 0 )
		if mapImageName == nil or mapImageName == "" then
			mapImageName = "black"
		end
	end
	loadingMenu.addLoadingElement = function ( self, element )
		if not Engine.IsLevelPreloaded( mapName ) then
			self:addElement( element )
		end
	end
	
	loadingMenu.mapImage = LUI.UIStreamedImage.new()
	loadingMenu.mapImage.id = "mapImage"
	loadingMenu.mapImage:setLeftRight( false, false, -640, 640 )
	loadingMenu.mapImage:setTopBottom( false, false, -360, 360 )
	loadingMenu.mapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	loadingMenu.mapImage:setImage( RegisterImage( mapImageName ) )
	loadingMenu.mapImage:setRGB( 0, 0, 0 )
	loadingMenu:addLoadingElement( loadingMenu.mapImage )
	if showMovie == true then
		loadingMenu.mapImage:setShaderVector( 0, 0, 0, 0, 0 )
		loadingMenu.mapImage.ismp4 = false
	end
	local infoTop = 10
	local infoLeft = 70
	local mapNameFontName = "Big"
	local mapNameFont = CoD.fonts[mapNameFontName]
	local mapNameFontHeight = CoD.textSize[mapNameFontName]
	local infoFontName = "Condensed"
	local infoFont = CoD.fonts[infoFontName]
	local infoFontHeight = CoD.textSize[infoFontName]
	loadingMenu.mapNameLabel = LUI.UIText.new()
	loadingMenu.mapNameLabel.id = "mapNameLabel"
	loadingMenu.mapNameLabel:setLeftRight( true, false, infoLeft, infoLeft + 1 )
	loadingMenu.mapNameLabel:setTopBottom( true, false, infoTop, infoTop + mapNameFontHeight )
	loadingMenu.mapNameLabel:setFont( mapNameFont )
	loadingMenu.mapNameLabel:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	loadingMenu.mapNameLabel:setAlpha( 0 )
	loadingMenu.mapNameLabel:registerEventHandler( "transition_complete_map_name_fade_in", CoD.Loading.MapNameFadeInComplete )
	loadingMenu:addLoadingElement( loadingMenu.mapNameLabel )
	infoTop = infoTop + mapNameFontHeight - 5
	loadingMenu.mapLocationLabel = LUI.UIText.new()
	loadingMenu.mapLocationLabel.id = "mapLocationLabel"
	loadingMenu.mapLocationLabel:setLeftRight( true, false, infoLeft, infoLeft + 1 )
	loadingMenu.mapLocationLabel:setTopBottom( true, false, infoTop, infoTop + infoFontHeight )
	loadingMenu.mapLocationLabel:setFont( infoFont )
	loadingMenu.mapLocationLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	loadingMenu.mapLocationLabel:setAlpha( 0 )
	loadingMenu.mapLocationLabel:registerEventHandler( "transition_complete_map_location_fade_in", CoD.Loading.MapLocationFadeInComplete )
	loadingMenu:addLoadingElement( loadingMenu.mapLocationLabel )
	infoTop = infoTop + infoFontHeight - 2
	loadingMenu.gametypeLabel = LUI.UIText.new()
	loadingMenu.gametypeLabel.id = "gametypeLabel"
	loadingMenu.gametypeLabel:setLeftRight( true, false, infoLeft, infoLeft + 1 )
	loadingMenu.gametypeLabel:setTopBottom( true, false, infoTop, infoTop + infoFontHeight )
	loadingMenu.gametypeLabel:setFont( infoFont )
	loadingMenu.gametypeLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	loadingMenu.gametypeLabel:setAlpha( 0 )
	loadingMenu.gametypeLabel:registerEventHandler( "transition_complete_gametype_fade_in", CoD.Loading.GametypeFadeInComplete )
	loadingMenu:addLoadingElement( loadingMenu.gametypeLabel )
	infoTop = infoTop + infoFontHeight + 5
	local demoTitleTitleText = Engine.Localize( "MPUI_TITLE_CAPS" ) .. ":"
	local f5_local0 = {}
	local demoTitleTitleTextDim = GetTextDimensions( demoTitleTitleText, infoFont, infoFontHeight )
	local demoDurationTitleText = Engine.Localize( "MPUI_DURATION_CAPS" ) .. ":"
	local f5_local1 = {}
	local demoDurationTitleTextDim = GetTextDimensions( demoDurationTitleText, infoFont, infoFontHeight )
	local demoAuthorTitleText = Engine.Localize( "MPUI_AUTHOR_CAPS" ) .. ":"
	local f5_local2 = {}
	local demoAuthorTitleTextDim = GetTextDimensions( demoAuthorTitleText, infoFont, infoFontHeight )
	local maxTitleWidth = math.max( demoTitleTitleTextDim[3], demoDurationTitleTextDim[3], demoAuthorTitleTextDim[3] )
	local demoInfoLeft = maxTitleWidth + 5
	local demoInfoTop = 0
	if not Engine.IsLevelPreloaded( mapName ) then
		loadingMenu.demoInfoContainer = LUI.UIElement.new()
		loadingMenu.demoInfoContainer:setLeftRight( true, false, infoLeft, 600 )
		loadingMenu.demoInfoContainer:setTopBottom( true, false, infoTop, infoTop + 600 )
		loadingMenu.demoInfoContainer:setAlpha( 0 )
		loadingMenu:addLoadingElement( loadingMenu.demoInfoContainer )
		loadingMenu.demoTitleTitle = LUI.UIText.new()
		loadingMenu.demoTitleTitle:setLeftRight( true, true, 0, 0 )
		loadingMenu.demoTitleTitle:setTopBottom( true, false, demoInfoTop, demoInfoTop + infoFontHeight )
		loadingMenu.demoTitleTitle:setFont( infoFont )
		loadingMenu.demoTitleTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		loadingMenu.demoTitleTitle:setAlignment( LUI.Alignment.Left )
		loadingMenu.demoTitleTitle:setText( demoTitleTitleText )
		loadingMenu.demoInfoContainer:addElement( loadingMenu.demoTitleTitle )
		loadingMenu.demoTitleLabel = LUI.UIText.new()
		loadingMenu.demoTitleLabel:setLeftRight( true, true, demoInfoLeft, 0 )
		loadingMenu.demoTitleLabel:setTopBottom( true, false, demoInfoTop, demoInfoTop + infoFontHeight )
		loadingMenu.demoTitleLabel:setFont( infoFont )
		loadingMenu.demoTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		loadingMenu.demoTitleLabel:setAlignment( LUI.Alignment.Left )
		loadingMenu.demoInfoContainer:addElement( loadingMenu.demoTitleLabel )
		demoInfoTop = demoInfoTop + infoFontHeight - 2
		loadingMenu.demoDurationTitle = LUI.UIText.new()
		loadingMenu.demoDurationTitle:setLeftRight( true, true, 0, 0 )
		loadingMenu.demoDurationTitle:setTopBottom( true, false, demoInfoTop, demoInfoTop + infoFontHeight )
		loadingMenu.demoDurationTitle:setFont( infoFont )
		loadingMenu.demoDurationTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		loadingMenu.demoDurationTitle:setAlignment( LUI.Alignment.Left )
		loadingMenu.demoDurationTitle:setText( demoDurationTitleText )
		loadingMenu.demoInfoContainer:addElement( loadingMenu.demoDurationTitle )
		loadingMenu.demoDurationLabel = LUI.UIText.new()
		loadingMenu.demoDurationLabel:setLeftRight( true, true, demoInfoLeft, 0 )
		loadingMenu.demoDurationLabel:setTopBottom( true, false, demoInfoTop, demoInfoTop + infoFontHeight )
		loadingMenu.demoDurationLabel:setFont( infoFont )
		loadingMenu.demoDurationLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		loadingMenu.demoDurationLabel:setAlignment( LUI.Alignment.Left )
		loadingMenu.demoInfoContainer:addElement( loadingMenu.demoDurationLabel )
		demoInfoTop = demoInfoTop + infoFontHeight - 2
		loadingMenu.demoAuthorTitle = LUI.UIText.new()
		loadingMenu.demoAuthorTitle:setLeftRight( true, true, 0, 0 )
		loadingMenu.demoAuthorTitle:setTopBottom( true, false, demoInfoTop, demoInfoTop + infoFontHeight )
		loadingMenu.demoAuthorTitle:setFont( infoFont )
		loadingMenu.demoAuthorTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		loadingMenu.demoAuthorTitle:setAlignment( LUI.Alignment.Left )
		loadingMenu.demoAuthorTitle:setText( demoAuthorTitleText )
		loadingMenu.demoInfoContainer:addElement( loadingMenu.demoAuthorTitle )
		loadingMenu.demoAuthorLabel = LUI.UIText.new()
		loadingMenu.demoAuthorLabel:setLeftRight( true, true, demoInfoLeft, 0 )
		loadingMenu.demoAuthorLabel:setTopBottom( true, false, demoInfoTop, demoInfoTop + infoFontHeight )
		loadingMenu.demoAuthorLabel:setFont( infoFont )
		loadingMenu.demoAuthorLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		loadingMenu.demoAuthorLabel:setAlignment( LUI.Alignment.Left )
		loadingMenu.demoInfoContainer:addElement( loadingMenu.demoAuthorLabel )
	end
	local dykOffset = 3
	local dykHeight = CoD.Loading.DYKFontHeight + dykOffset * 2
	local loadingBarHeight = 2
	local statusHeight = CoD.Loading.DYKFontHeight
	local loadingBarContainerHeight = dykHeight + 1 + loadingBarHeight + statusHeight - infoTop
	local loadingBarSideOffset = 5
	local loadingBarWidth = CoD.Menu.Width - loadingBarSideOffset * 2
	local loadingBarBottom = -200
	local top = 0
	local spinnerOffset = 2
	local spinnerSize = dykHeight - spinnerOffset * 2
	local textLeftOffset = 6
	loadingMenu.loadingBarContainer = LUI.UIElement.new()
	loadingMenu.loadingBarContainer.id = "loadingBarContainer"
	loadingMenu.loadingBarContainer:setLeftRight( false, false, -loadingBarWidth / 2, loadingBarWidth / 2 )
	loadingMenu.loadingBarContainer:setTopBottom( false, true, loadingBarBottom - loadingBarContainerHeight, loadingBarBottom )
	loadingMenu.loadingBarContainer:setAlpha( 0 )
	loadingMenu:addElement( loadingMenu.loadingBarContainer )
	loadingMenu.dykContainer = LUI.UIElement.new()
	loadingMenu.dykContainer.id = "dykContainer"
	loadingMenu.dykContainer:setLeftRight( true, true, 0, 0 )
	loadingMenu.dykContainer:setTopBottom( true, false, top, top + dykHeight )
	loadingMenu.dykContainer.containerHeight = dykHeight
	loadingMenu.dykContainer.textAreaWidth = loadingBarWidth - dykOffset - textLeftOffset - spinnerOffset - spinnerSize - 1
	if CoD.isZombie == false then
		CoD.Loading.SetupDYKContainerImages( loadingMenu.dykContainer )
		loadingMenu.didYouKnow = LUI.UIText.new()
		loadingMenu.didYouKnow:setLeftRight( true, true, dykOffset + textLeftOffset, -spinnerOffset - spinnerSize - 1 )
		loadingMenu.didYouKnow:setTopBottom( true, false, dykOffset, dykOffset + CoD.Loading.DYKFontHeight )
		loadingMenu.didYouKnow:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		loadingMenu.didYouKnow:setFont( CoD.Loading.DYKFont )
		loadingMenu.didYouKnow:setAlignment( LUI.Alignment.Left )
		loadingMenu.didYouKnow:setPriority( 0 )
	else
		textLeftOffset = 0
	end
	top = top + dykHeight + 1
	loadingMenu.spinner = LUI.UIImage.new()
	loadingMenu.spinner.id = "spinner"
	loadingMenu.spinner:setLeftRight( false, true, -spinnerOffset - spinnerSize, -spinnerOffset )
	loadingMenu.spinner:setTopBottom( false, false, -spinnerSize / 2, spinnerSize / 2 )
	loadingMenu.spinner:setImage( RegisterMaterial( "lui_loader_32" ) )
	loadingMenu.spinner:setShaderVector( 0, 0, 0, 0, 0 )
	loadingMenu.spinner:setAlpha( 0 )
	loadingMenu.dykContainer:addElement( loadingMenu.spinner )
	local loadingBarBackground = LUI.UIImage.new()
	loadingBarBackground.id = "loadingBarBackground"
	loadingBarBackground:setLeftRight( true, true, 1, -1 )
	loadingBarBackground:setTopBottom( true, false, top, top + loadingBarHeight )
	loadingBarBackground:setRGB( 0.1, 0.1, 0.1 )
	loadingMenu.loadingBarContainer:addElement( loadingBarBackground )
	local loadingBar = LUI.UIImage.new()
	loadingBar:setLeftRight( true, true, 1, -1 )
	loadingBar:setTopBottom( true, false, top, top + loadingBarHeight )
	loadingBar:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	loadingBar:setupLoadingBar()
	loadingMenu.loadingBarContainer:addElement( loadingBar )
	local loadingBarHighlightHeight = 1
	local loadingBarHighlight = LUI.UIImage.new()
	loadingBarHighlight:setLeftRight( true, true, 2, -2 )
	loadingBarHighlight:setTopBottom( true, false, top, top + loadingBarHighlightHeight )
	loadingBarHighlight:setRGB( 1, 1, 1 )
	loadingBarHighlight:setAlpha( 0.5 )
	loadingBarHighlight:setupLoadingBar()
	loadingMenu.loadingBarContainer:addElement( loadingBarHighlight )
	top = top + loadingBarHeight
	loadingMenu.statusLabel = LUI.UIText.new()
	loadingMenu.statusLabel:setLeftRight( true, true, dykOffset + textLeftOffset, 0 )
	loadingMenu.statusLabel:setTopBottom( true, false, top, top + CoD.Loading.DYKFontHeight )
	loadingMenu.statusLabel:setAlpha( 0.55 )
	loadingMenu.statusLabel:setFont( CoD.Loading.DYKFont )
	loadingMenu.statusLabel:setAlignment( LUI.Alignment.Left )
	loadingMenu.statusLabel:setupLoadingStatusText()
	loadingMenu.loadingBarContainer:addElement( loadingMenu.statusLabel )
	if showMovie == true then
		loadingMenu.mapImage:registerEventHandler( "loading_updateimage", f0_local0 )
		loadingMenu:addElement( LUI.UITimer.new( 16, "loading_updateimage", false, loadingMenu.mapImage ) )
		Engine.SetDvar( "ui_useloadingmovie", 1 )
		local leftOffset = 15
		local topOffset = 15
		local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
		loadingMenu.continueButton = LUI.UIButton.new()
		loadingMenu.continueButton:setLeftRight( false, false, -safeAreaWidth, safeAreaWidth / 2 - leftOffset )
		loadingMenu.continueButton:setTopBottom( false, false, safeAreaHeight / 2 - CoD.textSize.Condensed - topOffset, safeAreaHeight / 2 - topOffset )
		loadingMenu.continueButton:setAlignment( LUI.Alignment.Right )
		loadingMenu.continueButton:setAlpha( 0 )
		loadingMenu.continueButton:setActionEventName( "loading_startplay" )
		loadingMenu:addElement( loadingMenu.continueButton )
		loadingMenu.continueButton:addElement( CoD.ButtonPrompt.new( "start", "", loadingMenu, "loading_startplay", true ) )
		loadingMenu.continueButton.label = LUI.UIText.new()
		loadingMenu.continueButton.label:setLeftRight( true, true, 0, 0 )
		loadingMenu.continueButton.label:setTopBottom( true, true, 0, 0 )
		loadingMenu.continueButton.label:setFont( CoD.fonts.Condensed )
		loadingMenu.continueButton.label:setAlignment( LUI.Alignment.Right )
		loadingMenu.continueButton:addElement( loadingMenu.continueButton.label )
		loadingMenu.continueButton.label:setText( Engine.Localize( "PLATFORM_SKIP" ) )
		loadingMenu.continueButton:setHandleMouse( false )
		loadingMenu:registerEventHandler( "loading_displaycontinue", f0_local1 )
		loadingMenu:registerEventHandler( "loading_startplay", f0_local2 )
	else
		loadingMenu:addElement( LUI.UITimer.new( CoD.Loading.LoadingDelayTime, "start_loading", true, loadingMenu ) )
		loadingMenu:addElement( LUI.UITimer.new( CoD.Loading.SpinnerDelayTime, "start_spinner", true, loadingMenu ) )
	end
	return loadingMenu
end

CoD.Loading.GetDidYouKnowString = function ()
	local dykTotalStringCount = 0
	local dykText = ""
	local dykStringIndex = 0
	if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
		dykTotalStringCount = #CoD.Loading.DidYouKnow.theater
		if dykTotalStringCount ~= nil and 0 < dykTotalStringCount then
			dykText = CoD.Loading.DidYouKnow.theater[math.random( dykTotalStringCount )]
		end
	elseif CoD.isZombie == true then
		dykTotalStringCount = #CoD.Loading.DidYouKnow.zombies
		if dykTotalStringCount ~= nil and 0 < dykTotalStringCount then
			dykText = CoD.Loading.DidYouKnow.zombies[math.random( dykTotalStringCount )]
		end
	else
		local generalStringCount = #CoD.Loading.DidYouKnow.general
		dykTotalStringCount = dykTotalStringCount + generalStringCount
		local gametype = Dvar.ui_gametype:get()
		local gametypeStringCount = 0
		if gametype ~= nil and gametype ~= "" and CoD.Loading.DidYouKnow[gametype] then
			gametypeStringCount = #CoD.Loading.DidYouKnow[gametype]
		end
		dykTotalStringCount = dykTotalStringCount + gametypeStringCount
		local leagueStringCount = 0
		local publicStringCount = 0
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
			leagueStringCount = #CoD.Loading.DidYouKnow.league
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
			publicStringCount = #CoD.Loading.DidYouKnow.public
		end
		dykStringIndex = math.random( dykTotalStringCount + leagueStringCount + publicStringCount )
		if dykStringIndex <= generalStringCount then
			dykText = CoD.Loading.DidYouKnow.general[dykStringIndex]
		elseif 0 < gametypeStringCount and dykStringIndex <= generalStringCount + gametypeStringCount then
			dykText = CoD.Loading.DidYouKnow[gametype][dykStringIndex - generalStringCount]
		elseif 0 < publicStringCount and dykStringIndex <= generalStringCount + gametypeStringCount + publicStringCount then
			dykText = CoD.Loading.DidYouKnow.public[dykStringIndex - generalStringCount - gametypeStringCount]
		elseif 0 < leagueStringCount and dykStringIndex <= generalStringCount + gametypeStringCount + publicStringCount + leagueStringCount then
			dykText = CoD.Loading.DidYouKnow.league[dykStringIndex - generalStringCount - gametypeStringCount - publicStringCount]
		end
	end
	if dykText == nil or dykText == "" then
		return ""
	else
		return Engine.Localize( dykText )
	end
end

CoD.Loading.StartLoading = function ( self, event )
	if CoD.ShowNewLoadingScreen() then
		CoD.Loading.AddNewLoadingScreen( self )
		return 
	end
	local mapNameText = Dvar.ls_mapname:get()
	local mapLocationText = Dvar.ls_maplocation:get()
	local gametypeText = Dvar.ls_gametype:get()
	self.mapNameLabel:setText( mapNameText )
	self.mapLocationLabel:setText( mapLocationText )
	self.gametypeLabel:setText( gametypeText )
	if Engine.IsDemoPlaying() then
		local demoTitleText = Dvar.ls_demotitle:get()
		local demoDurationText = Engine.SecondsAsTime( Dvar.ls_demoduration:get() )
		local demoAuthorText = Dvar.ls_demoauthor:get()
		self.demoTitleLabel:setText( demoTitleText )
		self.demoDurationLabel:setText( demoDurationText )
		self.demoAuthorLabel:setText( demoAuthorText )
		if demoAuthorText == "" then
			self.demoAuthorTitle:setAlpha( 0 )
		end
	end
	if CoD.isZombie == false then
		local dykText = CoD.Loading.GetDidYouKnowString()
		local f8_local0 = {}
		local dykTextDim = GetTextDimensions( dykText, CoD.Loading.DYKFont, CoD.Loading.DYKFontHeight )
		if self.dykContainer.textAreaWidth < dykTextDim[3] then
			self.dykContainer:setTopBottom( true, false, -CoD.Loading.DYKFontHeight, self.dykContainer.containerHeight )
		end
		self.didYouKnow:setText( dykText )
	end
	self.mapNameLabel:beginAnimation( "map_name_fade_in", CoD.Loading.FadeInTime )
	self.mapNameLabel:setAlpha( 1 )
end

CoD.Loading.AddNewLoadingScreen = function ( self )
	local menu = self
	local loadingScreenOverlay = nil
	if CoD.IsGametypeTeamBased() then
		loadingScreenOverlay = LUI.createMenu.LoadingScreenOverlayForTeamGames( menu:getOwner() )
	else
		loadingScreenOverlay = LUI.createMenu.LoadingScreenOverlayForNonTeamGames( menu:getOwner() )
	end
	menu:addElement( loadingScreenOverlay )
	loadingScreenOverlay:playClip( "StartLoading" )
	menu.mapImage:setRGB( 1, 1, 1 )
end

CoD.Loading.StartSpinner = function ( self, event )
	self.spinner:beginAnimation( "spinner_fade_in", 200 )
	self.spinner:setAlpha( 1 )
end

CoD.Loading.MapNameFadeInComplete = function ( self )
	self:dispatchEventToParent( {
		name = "fade_in_map_location"
	} )
end

CoD.Loading.FadeInMapLocation = function ( self )
	self.mapLocationLabel:beginAnimation( "map_location_fade_in", CoD.Loading.FadeInTime )
	self.mapLocationLabel:setAlpha( 1 )
end

CoD.Loading.MapLocationFadeInComplete = function ( self )
	self:dispatchEventToParent( {
		name = "fade_in_gametype"
	} )
end

CoD.Loading.FadeInGametype = function ( self )
	self.gametypeLabel:beginAnimation( "gametype_fade_in", CoD.Loading.FadeInTime )
	self.gametypeLabel:setAlpha( 0.6 )
end

CoD.Loading.GametypeFadeInComplete = function ( self )
	self:dispatchEventToParent( {
		name = "fade_in_map_image"
	} )
end

CoD.Loading.FadeInMapImage = function ( self )
	self.mapImage:beginAnimation( "map_image_fade_in", CoD.Loading.FadeInTime )
	self.mapImage:setRGB( 1, 1, 1 )
	self.loadingBarContainer:beginAnimation( "loading_bar_fade_in", CoD.Loading.FadeInTime )
	self.loadingBarContainer:setAlpha( 1 )
	if Engine.IsDemoPlaying() then
		self.demoInfoContainer:beginAnimation( "demo_info_fade_in", CoD.Loading.FadeInTime )
		self.demoInfoContainer:setAlpha( 1 )
	end
end

CoD.Loading.SetupDYKContainerImages = function ( self )
	local blackBackground = LUI.UIImage.new()
	blackBackground:setLeftRight( true, true, 0, 0 )
	blackBackground:setTopBottom( true, true, 0, 0 )
	blackBackground:setRGB( 0, 0, 0 )
	blackBackground:setAlpha( 0.52 )
	blackBackground:setPriority( -110 )
	self:addElement( blackBackground )
	local outline = CoD.BorderT6.new( 1, 1, 1, 1, 0.05 )
	outline:setPriority( -100 )
	self:addElement( outline )
	local blackGrad = LUI.UIImage.new()
	blackGrad:setLeftRight( true, true, 2, -2 )
	blackGrad:setTopBottom( true, true, 1, -1 )
	blackGrad:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	blackGrad:setRGB( 0, 0, 0 )
	blackGrad:setAlpha( 0.65 )
	blackGrad:setPriority( -80 )
	self:addElement( blackGrad )
	local whiteGrad = LUI.UIImage.new()
	whiteGrad:setLeftRight( true, true, 3, -3 )
	whiteGrad:setTopBottom( true, false, 3, 23 )
	whiteGrad:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	whiteGrad:setPriority( 100 )
	whiteGrad:setAlpha( 0.06 )
	self:addElement( whiteGrad )
end

