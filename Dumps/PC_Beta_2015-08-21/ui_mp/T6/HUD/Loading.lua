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
	"MPTIP_HARDCORE_MINIMAP_TIP",
	"MPTIP_WILLY_PETE_TIP"
}
local f0_local3 = "MPTIP_TOMAHAWK_TIP"
local f0_local4 = "MPTIP_C4_OBJECTIVES_TIP"
local f0_local5 = "MPTIP_GRENADE_SOUND_TIP"
local f0_local6 = "MPTIP_NO_COOKING_TIP"
local f0_local7 = "MPTIP_SHOCK_CHARGE_TIP"
local f0_local8 = "MPTIP_THERMITE_TIP"
local f0_local9 = "MPTIP_TRIPMINE_TIP"
local f0_local10 = "MPTIP_FAST_MAG_TIP"
local f0_local11 = "MPTIP_EXTENDED_MAGS_TIP"
local f0_local12 = "MPTIP_DEEP_IMPACT_TIP"
local f0_local13 = "MPTIP_SUPPRESSOR_TIP"
local f0_local14 = "MPTIP_STEADY_AIM_TIP"
local f0_local15 = "MPTIP_ATTACHMENT_VARIETY_TIP"
local f0_local16 = "MPTIP_ATTACHMENTS_TIP"
local f0_local17 = "MPTIP_UTILITY_TIP"
local f0_local18 = "MPTIP_GHILLIE_SUIT_TIP"
local f0_local19 = "MPTIP_FLAK_TIP"
local f0_local20 = "MPTIP_AFTERBURNER_TIP"
local f0_local21 = "MPTIP_BLASTSUPPRESSOR_TIP"
local f0_local22 = "MPTIP_GUNGHO_TIP"
local f0_local23 = "MPTIP_OVERCLOCK_TIP"
local f0_local24 = "MPTIP_SIXTHSENSE_TIP"
local f0_local25 = "MPTIP_TRACKER_TIP"
local f0_local26 = "MPTIP_ANTEUP_TIP"
local f0_local27 = "MPTIP_KILLSTREAKS_MENU_TIP"
local f0_local28 = "MPTIP_LOOPING_KILLSTREAK_TIP"
local f0_local29 = "MPTIP_KILLSTREAKS_STAY_TIP"
local f0_local30 = "MPTIP_SR71_TIP"
local f0_local31 = "MPTIP_TURRET_TIP"
local f0_local32 = "MPTIP_DETONATE_TIP"
local f0_local33 = "MPTIP_BOOST_TIP"
local f0_local34 = "MPTIP_AUTO_EXPLODE_TIP"
local f0_local35 = "MPTIP_TURRET_MELEE_TIP"
local f0_local36 = "MPTIP_SCORESTREAK_OBJECTIVE_TIP"
local f0_local37 = "MPTIP_REMOTE_CONTROL_TIP"
local f0_local38 = "MPTIP_VTOL_MOVEMENT_TIP"
local f0_local39 = "MPTIP_HELLSTORM_CLUSTER_TIP"
local f0_local40 = "MPTIP_GUARDIAN_TIP"
local f0_local41 = "MPTIP_TARGET_DIAMOND_LOS_TIP"
local f0_local42 = "MPTIP_HCXD_WALLS_TIP"
local f0_local43 = "MPTIP_WRAITH_STEALTH_TIP"
local f0_local44 = "MPTIP_RAPS_DESTROY_TIP"
local f0_local45 = "MPTIP_MOTHERSHIP_JOIN_TIP"
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
if not CoD.isCampaign and not CoD.isZombie then
	require( "ui.uieditor.menus.StartGameFlow.LoadingScreenOverlayForNonTeamGames" )
	require( "ui.uieditor.menus.StartGameFlow.LoadingScreenOverlayForTeamGames" )
end
CoD.Loading.FadeInTime = 1000
CoD.Loading.LoadingDelayTime = 400
CoD.Loading.SpinnerDelayTime = 19000
CoD.Loading.DYKFontName = "Default"
CoD.Loading.DYKFont = CoD.fonts[CoD.Loading.DYKFontName]
CoD.Loading.DYKFontHeight = CoD.textSize[CoD.Loading.DYKFontName]
f0_local0 = function ( f1_arg0, f1_arg1 )
	if Engine.IsCinematicMp4() then
		if not f1_arg0.ismp4 then
			f1_arg0:setImage( RegisterMaterial( "cinematic_mp4" ) )
			f1_arg0.ismp4 = true
		end
	elseif f1_arg0.ismp4 then
		f1_arg0:setImage( RegisterMaterial( "black" ) )
		f1_arg0.ismp4 = nil
	end
end

CoD.Loading.HideContinueButton = function ( f2_arg0, f2_arg1 )
	f2_arg0:beginAnimation( "hide", 1000 )
	f2_arg0:setAlpha( 0 )
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0, f3_local1 = Engine.GetUserSafeArea()
	local f3_local2 = Dvar.ui_errorMessage:get()
	if f3_local2 ~= "" then
		f3_arg0.errorText = LUI.UIText.new()
		f3_arg0.errorText:setLeftRight( false, false, -f3_local0 / 2, f3_local0 / 2 )
		f3_arg0.errorText:setTopBottom( true, false, 36, 36 + CoD.textSize.Condensed )
		f3_arg0.errorText:setFont( CoD.fonts.Condensed )
		f3_arg0.errorText:setAlignment( LUI.Alignment.Left )
		f3_arg0:addElement( f3_arg0.errorText )
		f3_arg0.errorText:setText( f3_local2 )
		Dvar.ui_errorMessage:set( "" )
	end
	f3_arg0.continueButton:registerEventHandler( "hide_continue_button", CoD.Loading.HideContinueButton )
	f3_arg0.continueButton:addElement( LUI.UITimer.new( 5000, "hide_continue_button", true, f3_arg0.continueButton ) )
	f3_arg0.continueButton:beginAnimation( "show", 1000 )
	f3_arg0.continueButton:setAlpha( 1 )
	return LUI.UIButton.gainFocus( f3_arg0.continueButton, f3_arg1 )
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	Engine.Stop3DCinematic( 0 )
end

LUI.createMenu.Loading = function ( f5_arg0 )
	local f5_local0 = CoD.Menu.NewFromState( "Loading", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	f5_local0.id = "loadingMenu"
	f5_local0:setOwner( f5_arg0 )
	f5_local0:registerEventHandler( "start_loading", CoD.Loading.StartLoading )
	f5_local0:registerEventHandler( "start_spinner", CoD.Loading.StartSpinner )
	f5_local0:registerEventHandler( "fade_in_map_location", CoD.Loading.FadeInMapLocation )
	f5_local0:registerEventHandler( "fade_in_gametype", CoD.Loading.FadeInGametype )
	f5_local0:registerEventHandler( "fade_in_map_image", CoD.Loading.FadeInMapImage )
	local f5_local1 = false
	local f5_local2 = Engine.GetCurrentMap()
	local f5_local3 = Engine.GetCurrentGameType()
	local f5_local4 = CoD.GetMapValue( f5_local2, "loadingImage", "black" )
	if Engine.IsMultiplayerGame() then
		Engine.PlayMenuMusic( "load_" .. f5_local2 )
	end
	if true == Dvar.ui_useloadingmovie:get() or CoD.isCampaign then
		if true == Engine.IsCampaignModeZombies() then
			f5_local2 = string.gsub( f5_local2, "mi", "nightmares_mi" )
		end
		local f5_local5 = CoD.GetMapValue( f5_local2, "introMovie" )
		if f5_local2 == "cp_sh_mobile" and Dvar.cp_queued_level:get() == "cp_mi_eth_prologue" then
			f5_local5 = "cp_prologue_load_loadingmovie"
		elseif f5_local2 == "cp_sh_singapore" and Dvar.cp_queued_level:get() == "cp_mi_sing_blackstation" then
			f5_local5 = "CP_safehouse_load_loadingmovie"
		end
		if f5_local5 ~= nil and not Engine.IsCinematicPlaying() then
			Engine.StartLoadingCinematic( f5_local5 )
		end
		Engine.SetDvar( "ui_useloadingmovie", 0 )
	end
	f5_local1 = false
	if Dvar.art_review:get() ~= "1" and (CoD.isCampaign or CoD.isZombie) and Engine.IsCinematicStarted() then
		f5_local1 = true
	end
	if f5_local1 then
		f5_local4 = "black"
	else
		Engine.SetDvar( "ui_useloadingmovie", 0 )
		if f5_local4 == nil or f5_local4 == "" then
			f5_local4 = "black"
		end
	end
	if Engine.IsLevelPreloaded( f5_local2 ) then
		f5_local0.addLoadingElement = function ( f6_arg0, f6_arg1 )
			
		end
		
	else
		f5_local0.addLoadingElement = function ( f7_arg0, f7_arg1 )
			f7_arg0:addElement( f7_arg1 )
		end
		
	end
	f5_local0.mapImage = LUI.UIStreamedImage.new()
	f5_local0.mapImage.id = "mapImage"
	f5_local0.mapImage:setLeftRight( false, false, -640, 640 )
	f5_local0.mapImage:setTopBottom( false, false, -360, 360 )
	f5_local0.mapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	f5_local0.mapImage:setImage( RegisterImage( f5_local4 ) )
	f5_local0.mapImage:setRGB( 0, 0, 0 )
	f5_local0:addElement( f5_local0.mapImage )
	if f5_local1 == true then
		f5_local0.mapImage:setShaderVector( 0, 0, 0, 0, 0 )
		f5_local0.mapImage.ismp4 = false
	end
	local f5_local5 = 10
	local f5_local6 = 70
	local f5_local7 = "Big"
	local f5_local8 = CoD.fonts[f5_local7]
	local f5_local9 = CoD.textSize[f5_local7]
	local f5_local10 = "Condensed"
	local f5_local11 = CoD.fonts[f5_local10]
	local f5_local12 = CoD.textSize[f5_local10]
	f5_local0.mapNameLabel = LUI.UIText.new()
	f5_local0.mapNameLabel.id = "mapNameLabel"
	f5_local0.mapNameLabel:setLeftRight( true, false, f5_local6, f5_local6 + 1 )
	f5_local0.mapNameLabel:setTopBottom( true, false, f5_local5, f5_local5 + f5_local9 )
	f5_local0.mapNameLabel:setFont( f5_local8 )
	f5_local0.mapNameLabel:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	f5_local0.mapNameLabel:setAlpha( 0 )
	f5_local0.mapNameLabel:registerEventHandler( "transition_complete_map_name_fade_in", CoD.Loading.MapNameFadeInComplete )
	f5_local0:addLoadingElement( f5_local0.mapNameLabel )
	f5_local5 = f5_local5 + f5_local9 - 5
	f5_local0.mapLocationLabel = LUI.UIText.new()
	f5_local0.mapLocationLabel.id = "mapLocationLabel"
	f5_local0.mapLocationLabel:setLeftRight( true, false, f5_local6, f5_local6 + 1 )
	f5_local0.mapLocationLabel:setTopBottom( true, false, f5_local5, f5_local5 + f5_local12 )
	f5_local0.mapLocationLabel:setFont( f5_local11 )
	f5_local0.mapLocationLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f5_local0.mapLocationLabel:setAlpha( 0 )
	f5_local0.mapLocationLabel:registerEventHandler( "transition_complete_map_location_fade_in", CoD.Loading.MapLocationFadeInComplete )
	f5_local0:addLoadingElement( f5_local0.mapLocationLabel )
	f5_local5 = f5_local5 + f5_local12 - 2
	f5_local0.gametypeLabel = LUI.UIText.new()
	f5_local0.gametypeLabel.id = "gametypeLabel"
	f5_local0.gametypeLabel:setLeftRight( true, false, f5_local6, f5_local6 + 1 )
	f5_local0.gametypeLabel:setTopBottom( true, false, f5_local5, f5_local5 + f5_local12 )
	f5_local0.gametypeLabel:setFont( f5_local11 )
	f5_local0.gametypeLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f5_local0.gametypeLabel:setAlpha( 0 )
	f5_local0.gametypeLabel:registerEventHandler( "transition_complete_gametype_fade_in", CoD.Loading.GametypeFadeInComplete )
	f5_local0:addLoadingElement( f5_local0.gametypeLabel )
	f5_local5 = f5_local5 + f5_local12 + 5
	local f5_local13 = Engine.Localize( "MPUI_TITLE_CAPS" ) .. ":"
	local f5_local14 = {}
	f5_local14 = GetTextDimensions( f5_local13, f5_local11, f5_local12 )
	local f5_local15 = Engine.Localize( "MPUI_DURATION_CAPS" ) .. ":"
	local f5_local16 = {}
	f5_local16 = GetTextDimensions( f5_local15, f5_local11, f5_local12 )
	local f5_local17 = Engine.Localize( "MPUI_AUTHOR_CAPS" ) .. ":"
	local f5_local18 = {}
	f5_local18 = GetTextDimensions( f5_local17, f5_local11, f5_local12 )
	local f5_local19 = math.max( f5_local14[3], f5_local16[3], f5_local18[3] ) + 5
	local f5_local20 = 0
	if not Engine.IsLevelPreloaded( f5_local2 ) then
		f5_local0.demoInfoContainer = LUI.UIElement.new()
		f5_local0.demoInfoContainer:setLeftRight( true, false, f5_local6, 600 )
		f5_local0.demoInfoContainer:setTopBottom( true, false, f5_local5, f5_local5 + 600 )
		f5_local0.demoInfoContainer:setAlpha( 0 )
		f5_local0:addLoadingElement( f5_local0.demoInfoContainer )
		f5_local0.demoTitleTitle = LUI.UIText.new()
		f5_local0.demoTitleTitle:setLeftRight( true, true, 0, 0 )
		f5_local0.demoTitleTitle:setTopBottom( true, false, f5_local20, f5_local20 + f5_local12 )
		f5_local0.demoTitleTitle:setFont( f5_local11 )
		f5_local0.demoTitleTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		f5_local0.demoTitleTitle:setAlignment( LUI.Alignment.Left )
		f5_local0.demoTitleTitle:setText( f5_local13 )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoTitleTitle )
		f5_local0.demoTitleLabel = LUI.UIText.new()
		f5_local0.demoTitleLabel:setLeftRight( true, true, f5_local19, 0 )
		f5_local0.demoTitleLabel:setTopBottom( true, false, f5_local20, f5_local20 + f5_local12 )
		f5_local0.demoTitleLabel:setFont( f5_local11 )
		f5_local0.demoTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local0.demoTitleLabel:setAlignment( LUI.Alignment.Left )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoTitleLabel )
		f5_local20 = f5_local20 + f5_local12 - 2
		f5_local0.demoDurationTitle = LUI.UIText.new()
		f5_local0.demoDurationTitle:setLeftRight( true, true, 0, 0 )
		f5_local0.demoDurationTitle:setTopBottom( true, false, f5_local20, f5_local20 + f5_local12 )
		f5_local0.demoDurationTitle:setFont( f5_local11 )
		f5_local0.demoDurationTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		f5_local0.demoDurationTitle:setAlignment( LUI.Alignment.Left )
		f5_local0.demoDurationTitle:setText( f5_local15 )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoDurationTitle )
		f5_local0.demoDurationLabel = LUI.UIText.new()
		f5_local0.demoDurationLabel:setLeftRight( true, true, f5_local19, 0 )
		f5_local0.demoDurationLabel:setTopBottom( true, false, f5_local20, f5_local20 + f5_local12 )
		f5_local0.demoDurationLabel:setFont( f5_local11 )
		f5_local0.demoDurationLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local0.demoDurationLabel:setAlignment( LUI.Alignment.Left )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoDurationLabel )
		f5_local20 = f5_local20 + f5_local12 - 2
		f5_local0.demoAuthorTitle = LUI.UIText.new()
		f5_local0.demoAuthorTitle:setLeftRight( true, true, 0, 0 )
		f5_local0.demoAuthorTitle:setTopBottom( true, false, f5_local20, f5_local20 + f5_local12 )
		f5_local0.demoAuthorTitle:setFont( f5_local11 )
		f5_local0.demoAuthorTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		f5_local0.demoAuthorTitle:setAlignment( LUI.Alignment.Left )
		f5_local0.demoAuthorTitle:setText( f5_local17 )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoAuthorTitle )
		f5_local0.demoAuthorLabel = LUI.UIText.new()
		f5_local0.demoAuthorLabel:setLeftRight( true, true, f5_local19, 0 )
		f5_local0.demoAuthorLabel:setTopBottom( true, false, f5_local20, f5_local20 + f5_local12 )
		f5_local0.demoAuthorLabel:setFont( f5_local11 )
		f5_local0.demoAuthorLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local0.demoAuthorLabel:setAlignment( LUI.Alignment.Left )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoAuthorLabel )
	end
	local f5_local21 = 3
	local f5_local22 = CoD.Loading.DYKFontHeight + f5_local21 * 2
	local f5_local23 = 2
	local f5_local24 = f5_local22 + 1 + f5_local23 + CoD.Loading.DYKFontHeight - f5_local5
	local f5_local25 = CoD.Menu.Width - 5 * 2
	local f5_local26 = -200
	local f5_local27 = 0
	local f5_local28 = 2
	local f5_local29 = f5_local22 - f5_local28 * 2
	local f5_local30 = 6
	f5_local0.loadingBarContainer = LUI.UIElement.new()
	f5_local0.loadingBarContainer.id = "loadingBarContainer"
	f5_local0.loadingBarContainer:setLeftRight( false, false, -f5_local25 / 2, f5_local25 / 2 )
	f5_local0.loadingBarContainer:setTopBottom( false, true, f5_local26 - f5_local24, f5_local26 )
	f5_local0.loadingBarContainer:setAlpha( 0 )
	f5_local0:addElement( f5_local0.loadingBarContainer )
	f5_local0.dykContainer = LUI.UIElement.new()
	f5_local0.dykContainer.id = "dykContainer"
	f5_local0.dykContainer:setLeftRight( true, true, 0, 0 )
	f5_local0.dykContainer:setTopBottom( true, false, f5_local27, f5_local27 + f5_local22 )
	f5_local0.dykContainer.containerHeight = f5_local22
	f5_local0.dykContainer.textAreaWidth = f5_local25 - f5_local21 - f5_local30 - f5_local28 - f5_local29 - 1
	if CoD.isZombie == false then
		CoD.Loading.SetupDYKContainerImages( f5_local0.dykContainer )
		f5_local0.didYouKnow = LUI.UIText.new()
		f5_local0.didYouKnow:setLeftRight( true, true, f5_local21 + f5_local30, -f5_local28 - f5_local29 - 1 )
		f5_local0.didYouKnow:setTopBottom( true, false, f5_local21, f5_local21 + CoD.Loading.DYKFontHeight )
		f5_local0.didYouKnow:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local0.didYouKnow:setFont( CoD.Loading.DYKFont )
		f5_local0.didYouKnow:setAlignment( LUI.Alignment.Left )
		f5_local0.didYouKnow:setPriority( 0 )
	else
		f5_local30 = 0
	end
	f5_local27 = f5_local27 + f5_local22 + 1
	f5_local0.spinner = LUI.UIImage.new()
	f5_local0.spinner.id = "spinner"
	f5_local0.spinner:setLeftRight( false, true, -f5_local28 - f5_local29, -f5_local28 )
	f5_local0.spinner:setTopBottom( false, false, -f5_local29 / 2, f5_local29 / 2 )
	f5_local0.spinner:setImage( RegisterMaterial( "lui_loader_32" ) )
	f5_local0.spinner:setShaderVector( 0, 0, 0, 0, 0 )
	f5_local0.spinner:setAlpha( 0 )
	f5_local0.dykContainer:addElement( f5_local0.spinner )
	local f5_local31 = LUI.UIImage.new()
	f5_local31.id = "loadingBarBackground"
	f5_local31:setLeftRight( true, true, 1, -1 )
	f5_local31:setTopBottom( true, false, f5_local27, f5_local27 + f5_local23 )
	f5_local31:setRGB( 0.1, 0.1, 0.1 )
	f5_local0.loadingBarContainer:addElement( f5_local31 )
	local f5_local32 = LUI.UIImage.new()
	f5_local32:setLeftRight( true, true, 1, -1 )
	f5_local32:setTopBottom( true, false, f5_local27, f5_local27 + f5_local23 )
	f5_local32:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	f5_local32:setupLoadingBar()
	f5_local0.loadingBarContainer:addElement( f5_local32 )
	local f5_local33 = 1
	local f5_local34 = LUI.UIImage.new()
	f5_local34:setLeftRight( true, true, 2, -2 )
	f5_local34:setTopBottom( true, false, f5_local27, f5_local27 + f5_local33 )
	f5_local34:setRGB( 1, 1, 1 )
	f5_local34:setAlpha( 0.5 )
	f5_local34:setupLoadingBar()
	f5_local0.loadingBarContainer:addElement( f5_local34 )
	f5_local27 = f5_local27 + f5_local23
	f5_local0.statusLabel = LUI.UIText.new()
	f5_local0.statusLabel:setLeftRight( true, true, f5_local21 + f5_local30, 0 )
	f5_local0.statusLabel:setTopBottom( true, false, f5_local27, f5_local27 + CoD.Loading.DYKFontHeight )
	f5_local0.statusLabel:setAlpha( 0.55 )
	f5_local0.statusLabel:setFont( CoD.Loading.DYKFont )
	f5_local0.statusLabel:setAlignment( LUI.Alignment.Left )
	f5_local0.statusLabel:setupLoadingStatusText()
	f5_local0.loadingBarContainer:addElement( f5_local0.statusLabel )
	if not Engine.IsMultiplayerGame() and not Engine.IsZombiesGame() then
		f5_local0.cinematicSubtitles = CoD.MovieSubtitles.new( self, f5_arg0 )
		f5_local0.cinematicSubtitles:setLeftRight( false, false, -640, 640 )
		f5_local0.cinematicSubtitles:setTopBottom( false, false, -360, 360 )
		f5_local0:addElement( f5_local0.cinematicSubtitles )
	end
	if f5_local1 == true then
		f5_local0.mapImage:registerEventHandler( "loading_updateimage", f0_local0 )
		f5_local0.mapImage.id = "loadingMenu.mapImage"
		f5_local0:addElement( LUI.UITimer.new( 16, "loading_updateimage", false, f5_local0.mapImage ) )
		Engine.SetDvar( "ui_useloadingmovie", 1 )
		local f5_local35 = 15
		local f5_local36 = 15
		local f5_local37, f5_local38 = Engine.GetUserSafeArea()
		f5_local0.continueButton = LUI.UIButton.new()
		f5_local0.continueButton:setLeftRight( false, false, -f5_local37, f5_local37 / 2 - f5_local35 )
		f5_local0.continueButton:setTopBottom( false, false, f5_local38 / 2 - CoD.textSize.Condensed - f5_local36, f5_local38 / 2 - f5_local36 )
		f5_local0.continueButton:setAlignment( LUI.Alignment.Right )
		f5_local0.continueButton:setAlpha( 0 )
		f5_local0.continueButton:setActionEventName( "loading_startplay" )
		f5_local0:addElement( f5_local0.continueButton )
		f5_local0.continueButton:addElement( CoD.ButtonPrompt.new( "start", "", f5_local0, "loading_startplay", true ) )
		f5_local0.continueButton.label = LUI.UIText.new()
		f5_local0.continueButton.label:setLeftRight( true, true, 0, 0 )
		f5_local0.continueButton.label:setTopBottom( true, true, 0, 0 )
		f5_local0.continueButton.label:setFont( CoD.fonts.Condensed )
		f5_local0.continueButton.label:setAlignment( LUI.Alignment.Right )
		f5_local0.continueButton:addElement( f5_local0.continueButton.label )
		f5_local0.continueButton.label:setText( Engine.Localize( "PLATFORM_SKIP" ) )
		f5_local0.continueButton:setHandleMouse( false )
		f5_local0:registerEventHandler( "loading_displaycontinue", f0_local1 )
		f5_local0:registerEventHandler( "loading_startplay", f0_local2 )
	else
		f5_local0:addElement( LUI.UITimer.new( CoD.Loading.LoadingDelayTime, "start_loading", true, f5_local0 ) )
		f5_local0:addElement( LUI.UITimer.new( CoD.Loading.SpinnerDelayTime, "start_spinner", true, f5_local0 ) )
	end
	return f5_local0
end

CoD.Loading.GetDidYouKnowString = function ()
	local f8_local0 = 0
	local f8_local1 = ""
	local f8_local2 = 0
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return ""
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
		f8_local0 = #CoD.Loading.DidYouKnow.theater
		if f8_local0 ~= nil and 0 < f8_local0 then
			f8_local1 = CoD.Loading.DidYouKnow.theater[math.random( f8_local0 )]
		end
	elseif CoD.isZombie == true then
		f8_local0 = #CoD.Loading.DidYouKnow.zombies
		if f8_local0 ~= nil and 0 < f8_local0 then
			f8_local1 = CoD.Loading.DidYouKnow.zombies[math.random( f8_local0 )]
		end
	else
		local f8_local3 = #CoD.Loading.DidYouKnow.general
		f8_local0 = f8_local0 + f8_local3
		local f8_local4 = Dvar.ui_gametype:get()
		local f8_local5 = 0
		if f8_local4 ~= nil and f8_local4 ~= "" and CoD.Loading.DidYouKnow[f8_local4] then
			f8_local5 = #CoD.Loading.DidYouKnow[f8_local4]
		end
		f8_local0 = f8_local0 + f8_local5
		local f8_local6 = 0
		local f8_local7 = 0
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
			f8_local6 = #CoD.Loading.DidYouKnow.league
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
			f8_local7 = #CoD.Loading.DidYouKnow.public
		end
		f8_local2 = math.random( f8_local0 + f8_local6 + f8_local7 )
		if f8_local2 <= f8_local3 then
			f8_local1 = CoD.Loading.DidYouKnow.general[f8_local2]
		elseif 0 < f8_local5 and f8_local2 <= f8_local3 + f8_local5 then
			f8_local1 = CoD.Loading.DidYouKnow[f8_local4][f8_local2 - f8_local3]
		elseif 0 < f8_local7 and f8_local2 <= f8_local3 + f8_local5 + f8_local7 then
			f8_local1 = CoD.Loading.DidYouKnow.public[f8_local2 - f8_local3 - f8_local5]
		elseif 0 < f8_local6 and f8_local2 <= f8_local3 + f8_local5 + f8_local7 + f8_local6 then
			f8_local1 = CoD.Loading.DidYouKnow.league[f8_local2 - f8_local3 - f8_local5 - f8_local7]
		end
	end
	if f8_local1 == nil or f8_local1 == "" then
		return ""
	end
	return Engine.Localize( f8_local1 )
end

CoD.Loading.StartLoading = function ( f9_arg0, f9_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "Opening loading screen...\n" )
	if CoD.ShowNewLoadingScreen() then
		CoD.Loading.AddNewLoadingScreen( f9_arg0 )
		return 
	end
	local f9_local0 = Dvar.ls_mapname:get()
	local f9_local1 = Dvar.ls_maplocation:get()
	local f9_local2 = Dvar.ls_gametype:get()
	f9_arg0.mapNameLabel:setText( f9_local0 )
	f9_arg0.mapLocationLabel:setText( f9_local1 )
	f9_arg0.gametypeLabel:setText( f9_local2 )
	if Engine.IsDemoPlaying() then
		local f9_local3 = Dvar.ls_demotitle:get()
		local f9_local4 = Engine.SecondsAsTime( Dvar.ls_demoduration:get() )
		local f9_local5 = Dvar.ls_demoauthor:get()
		f9_arg0.demoTitleLabel:setText( f9_local3 )
		f9_arg0.demoDurationLabel:setText( f9_local4 )
		f9_arg0.demoAuthorLabel:setText( f9_local5 )
		if f9_local5 == "" then
			f9_arg0.demoAuthorTitle:setAlpha( 0 )
		end
	end
	if CoD.isZombie == false then
		local f9_local3 = CoD.Loading.GetDidYouKnowString()
		local f9_local4 = {}
		f9_local4 = GetTextDimensions( f9_local3, CoD.Loading.DYKFont, CoD.Loading.DYKFontHeight )
		if f9_arg0.dykContainer.textAreaWidth < f9_local4[3] then
			f9_arg0.dykContainer:setTopBottom( true, false, -CoD.Loading.DYKFontHeight, f9_arg0.dykContainer.containerHeight )
		end
		f9_arg0.didYouKnow:setText( f9_local3 )
	end
	f9_arg0.mapNameLabel:beginAnimation( "map_name_fade_in", CoD.Loading.FadeInTime )
	f9_arg0.mapNameLabel:setAlpha( 1 )
end

CoD.Loading.AddNewLoadingScreen = function ( f10_arg0 )
	local f10_local0 = f10_arg0
	local f10_local1 = nil
	if CoD.IsGametypeTeamBased() then
		f10_local1 = LUI.createMenu.LoadingScreenOverlayForTeamGames( f10_local0:getOwner() )
	else
		f10_local1 = LUI.createMenu.LoadingScreenOverlayForNonTeamGames( f10_local0:getOwner() )
	end
	f10_local0.loadingScreenOverlay = f10_local1
	f10_local0:addElement( f10_local1 )
	f10_local1:playClip( "StartLoading" )
	f10_local0.mapImage:setRGB( 1, 1, 1 )
	LUI.OverrideFunction_CallOriginalSecond( f10_local0, "close", function ( element )
		element.loadingScreenOverlay:close()
	end )
end

CoD.Loading.StartSpinner = function ( f12_arg0, f12_arg1 )
	f12_arg0.spinner:beginAnimation( "spinner_fade_in", 200 )
	f12_arg0.spinner:setAlpha( 1 )
end

CoD.Loading.MapNameFadeInComplete = function ( f13_arg0 )
	f13_arg0:dispatchEventToParent( {
		name = "fade_in_map_location"
	} )
end

CoD.Loading.FadeInMapLocation = function ( f14_arg0 )
	f14_arg0.mapLocationLabel:beginAnimation( "map_location_fade_in", CoD.Loading.FadeInTime )
	f14_arg0.mapLocationLabel:setAlpha( 1 )
end

CoD.Loading.MapLocationFadeInComplete = function ( f15_arg0 )
	f15_arg0:dispatchEventToParent( {
		name = "fade_in_gametype"
	} )
end

CoD.Loading.FadeInGametype = function ( f16_arg0 )
	f16_arg0.gametypeLabel:beginAnimation( "gametype_fade_in", CoD.Loading.FadeInTime )
	if not CoD.isZombie then
		f16_arg0.gametypeLabel:setAlpha( 0.6 )
	end
end

CoD.Loading.GametypeFadeInComplete = function ( f17_arg0 )
	f17_arg0:dispatchEventToParent( {
		name = "fade_in_map_image"
	} )
end

CoD.Loading.FadeInMapImage = function ( f18_arg0 )
	f18_arg0.mapImage:beginAnimation( "map_image_fade_in", CoD.Loading.FadeInTime )
	f18_arg0.mapImage:setRGB( 1, 1, 1 )
	f18_arg0.loadingBarContainer:beginAnimation( "loading_bar_fade_in", CoD.Loading.FadeInTime )
	f18_arg0.loadingBarContainer:setAlpha( 1 )
	if Engine.IsDemoPlaying() then
		f18_arg0.demoInfoContainer:beginAnimation( "demo_info_fade_in", CoD.Loading.FadeInTime )
		f18_arg0.demoInfoContainer:setAlpha( 1 )
	end
end

CoD.Loading.SetupDYKContainerImages = function ( f19_arg0 )
	local self = LUI.UIImage.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:setRGB( 0, 0, 0 )
	self:setAlpha( 0.52 )
	self:setPriority( -110 )
	f19_arg0:addElement( self )
	local f19_local1 = CoD.BorderT6.new( 1, 1, 1, 1, 0.05 )
	f19_local1:setPriority( -100 )
	f19_arg0:addElement( f19_local1 )
	local f19_local2 = LUI.UIImage.new()
	f19_local2:setLeftRight( true, true, 2, -2 )
	f19_local2:setTopBottom( true, true, 1, -1 )
	f19_local2:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	f19_local2:setRGB( 0, 0, 0 )
	f19_local2:setAlpha( 0.65 )
	f19_local2:setPriority( -80 )
	f19_arg0:addElement( f19_local2 )
	local f19_local3 = LUI.UIImage.new()
	f19_local3:setLeftRight( true, true, 3, -3 )
	f19_local3:setTopBottom( true, false, 3, 23 )
	f19_local3:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	f19_local3:setPriority( 100 )
	f19_local3:setAlpha( 0.06 )
	f19_arg0:addElement( f19_local3 )
end

