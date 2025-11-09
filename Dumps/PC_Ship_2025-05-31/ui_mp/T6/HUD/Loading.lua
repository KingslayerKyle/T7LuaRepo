CoD.Loading = {}
local f0_local0 = CoD.Loading
local f0_local1 = {
	theater = {}
}
local f0_local2 = {
	"MPTIP_AAR_TIP",
	"MPTIP_ACTIVE_CAMO_TIP",
	"MPTIP_ADS_TIP",
	"MPTIP_AFTERBURNER_TIP",
	"MPTIP_ANNIHILATOR_TIP",
	"MPTIP_ANTEUP_TIP",
	"MPTIP_ARM_BLADES_TIP",
	"MPTIP_ASSIST_TIP",
	"MPTIP_ATTACHMENTS_TIP",
	"MPTIP_ATTACHMENT_VARIETY_TIP",
	"MPTIP_AUTOMATIC_WEAPONS_TIP",
	"MPTIP_AUTO_EXPLODE_TIP",
	"MPTIP_BLASTSUPPRESSOR_TIP",
	"MPTIP_BOOST_TIP",
	"MPTIP_BOW_LAUNCHER_TIP",
	"MPTIP_C4_OBJECTIVES_TIP",
	"MPTIP_CHALLENGE_REWARDS_TIP",
	"MPTIP_CHEMICAL_GEL_GUN_TIP",
	"MPTIP_CLONE_TIP",
	"MPTIP_COMBATFOCUS_TIP",
	"MPTIP_COMBAT_ROBOT_TIP",
	"MPTIP_CREATE_A_CLASS_TIP",
	"MPTIP_CUSTOM_CLASS_TIP",
	"MPTIP_CUSTOM_GAME_TIP",
	"MPTIP_DART_TIP",
	"MPTIP_DEAD_ALLIES_TIP",
	"MPTIP_DEEP_IMPACT_TIP",
	"MPTIP_DETONATE_TIP",
	"MPTIP_DRONE_STRIKE_TIP",
	"MPTIP_EMP_TIP",
	"MPTIP_ENEMY_ON_MINIMAP_TIP",
	"MPTIP_EXTENDED_MAGS_TIP",
	"MPTIP_FAST_ADS_WALK_TIP",
	"MPTIP_FAST_MAG_TIP",
	"MPTIP_FLAK_TIP",
	"MPTIP_FLAMETHROWER_TIP",
	"MPTIP_FOOTSTEPS_TIP",
	"MPTIP_FRIENDS_BAR_TIP",
	"MPTIP_FRIENDS_LIST_TIP",
	"MPTIP_GHILLIE_SUIT_TIP",
	"MPTIP_GHOST_FADE_TIP",
	"MPTIP_GLITCH_TIP",
	"MPTIP_GRAVITY_SPIKES_TIP",
	"MPTIP_GRAVITY_SPIKES_OBJECTIVE_TIP",
	"MPTIP_GROUND_WEAPONS_TIP",
	"MPTIP_GUARDIAN_TIP",
	"MPTIP_GUNGHO_TIP",
	"MPTIP_HACKER_TOOL_TIP",
	"MPTIP_HARDCORE_HUD_TIP",
	"MPTIP_HARDCORE_MINIMAP_TIP"
}
local f0_local3 = "MPTIP_HCXD_WALLS_TIP"
local f0_local4 = "MPTIP_HEAT_WAVE_TIP"
local f0_local5 = "MPTIP_HELD_KNIFE_TIP"
local f0_local6 = "MPTIP_HELLSTORM_CLUSTER_TIP"
local f0_local7 = "MPTIP_HUD_TIP"
local f0_local8 = "MPTIP_KILLSTREAKS_MENU_TIP"
local f0_local9 = "MPTIP_KILLSTREAKS_STAY_TIP"
local f0_local10 = "MPTIP_LIGHTNING_GUN_TIP"
local f0_local11 = "MPTIP_LOCK_ON_TIP"
local f0_local12 = "MPTIP_LOOK_SENSITIVITY_TIP"
local f0_local13 = "MPTIP_LOOPING_KILLSTREAK_TIP"
local f0_local14 = "MPTIP_MANTLE_FIRE_TIP"
local f0_local15 = "MPTIP_MATCH_BONUS_TIP"
local f0_local16 = "MPTIP_MINIGUN_TIP"
local f0_local17 = "MPTIP_MOTD_TIP"
local f0_local18 = "MPTIP_MOTHERSHIP_JOIN_TIP"
local f0_local19 = "MPTIP_MUTE_TIP"
local f0_local20 = "MPTIP_NO_COOKING_TIP"
local f0_local21 = "MPTIP_ONE_GUN_PICKUP_TIP"
local f0_local22 = "MPTIP_OVERCLOCK_TIP"
local f0_local23 = "MPTIP_OVERDRIVE_TIP"
local f0_local24 = "MPTIP_PAUSE_MENU_MAP_TIP"
local f0_local25 = "MPTIP_PISTOL_TIP"
local f0_local26 = "MPTIP_POWER_ARMOR_TIP"
local f0_local27 = "MPTIP_POWER_STEALTH_TIP"
local f0_local28 = "MPTIP_RAPS_DESTROY_SHIP_TIP"
local f0_local29 = "MPTIP_REJACK_TIP"
local f0_local30 = "MPTIP_REMOTE_CONTROL_TIP"
local f0_local31 = "MPTIP_SCORESTREAK_OBJECTIVE_TIP"
local f0_local32 = "MPTIP_SHOCK_CHARGE_TIP"
local f0_local33 = "MPTIP_SHOOTING_AIRCRAFT_TIP"
local f0_local34 = "MPTIP_SIXTHSENSE_TIP"
local f0_local35 = "MPTIP_SLIDE_BOOST_TIP"
local f0_local36 = "MPTIP_SLIDE_DIRECTION_TIP"
local f0_local37 = "MPTIP_SLIDE_TIP"
local f0_local38 = "MPTIP_SPECIALIST_ABILITY_TIP"
local f0_local39 = "MPTIP_SPECIALIST_ACTIVATION_TIP"
local f0_local40 = "MPTIP_SPECIALIST_WEAPON_TIP"
local f0_local41 = "MPTIP_SPRINT_RELOAD_TIP"
local f0_local42 = "MPTIP_STAY_INSIDE_TIP"
local f0_local43 = "MPTIP_STEADY_AIM_TIP"
local f0_local44 = "MPTIP_SUPPRESSOR_TIP"
local f0_local45 = "MPTIP_TARGET_DIAMOND_LOS_TIP"
local f0_local46 = "MPTIP_THERMITE_TIP"
local f0_local47 = "MPTIP_THRUSTERS_TIP"
local f0_local48 = "MPTIP_TOMAHAWK_TIP"
local f0_local49 = "MPTIP_TRACKER_TIP"
local f0_local50 = "MPTIP_TRIPMINE_TIP"
local f0_local51 = "MPTIP_TURRET_MELEE_TIP"
local f0_local52 = "MPTIP_TURRET_TIP"
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
f0_local2[78] = f0_local48
f0_local2[79] = f0_local49
f0_local2[80] = f0_local50
f0_local2[81] = f0_local51
f0_local2[82] = f0_local52
f0_local3 = "MPTIP_UTILITY_TIP"
f0_local4 = "MPTIP_VISIONPULSE_TIP"
f0_local5 = "MPTIP_VTOL_MOVEMENT_TIP"
f0_local6 = "MPTIP_WALL_RUN_SECONDSTAGE_TIP"
f0_local7 = "MPTIP_WALL_RUN_TIP"
f0_local8 = "MPTIP_PINEAPPLE_GUN_TIP"
f0_local9 = "MPTIP_WEAPON_BUTT_TIP"
f0_local10 = "MPTIP_WILDCARDS_TIP"
f0_local11 = "MPTIP_WILLY_PETE_TIP"
f0_local12 = "MPTIP_WRAITH_STEALTH_TIP"
f0_local2[65] = f0_local3
f0_local2[66] = f0_local4
f0_local2[67] = f0_local5
f0_local2[68] = f0_local6
f0_local2[69] = f0_local7
f0_local2[70] = f0_local8
f0_local2[71] = f0_local9
f0_local2[72] = f0_local10
f0_local2[73] = f0_local11
f0_local2[74] = f0_local12
f0_local1.general = f0_local2
f0_local1.public = {
	"MPTIP_XP_SOURCES_TIP",
	"MPTIP_LEADERBOARD_TIP",
	"MPTIP_CHALLENGE_REWARDS_TIP"
}
f0_local1.league = {}
f0_local1.sd = {
	"MPTIP_SEARCH_AND_DESTROY_TIP"
}
f0_local1.dom = {
	"MPTIP_DOMINATION_TIP"
}
f0_local1.ball = {
	"MPTIP_BALL_TIP"
}
f0_local1.escort = {
	"MPTIP_ESCORT_ATTACK_TIP",
	"MPTIP_ESCORT_ATTACK__SCORE_TIP",
	"MPTIP_ESCORT_DEFEND_TIP"
}
f0_local1.koth = {
	"MPTIP_HARDPOINT_TIP"
}
f0_local1.gun = {
	"MPTIP_WAGER_GUN_DEMOTE",
	"MPTIP_WAGER_GUN_SUICIDE"
}
f0_local1.prop = {
	"MPTIP_PROP_HUNT_TIP_01",
	"MPTIP_PROP_HUNT_TIP_02",
	"MPTIP_PROP_HUNT_TIP_03",
	"MPTIP_PROP_HUNT_TIP_04",
	"MPTIP_PROP_HUNT_TIP_05",
	"MPTIP_PROP_HUNT_TIP_06",
	"MPTIP_PROP_HUNT_TIP_07",
	"MPTIP_PROP_HUNT_TIP_08",
	"MPTIP_PROP_HUNT_TIP_09",
	"MPTIP_PROP_HUNT_TIP_10",
	"MPTIP_PROP_HUNT_TIP_11",
	"MPTIP_PROP_HUNT_TIP_12",
	"MPTIP_PROP_HUNT_TIP_13"
}
f0_local1.sas = {
	"MPTIP_SAS_AXE",
	"MPTIP_SAS_GOLD_DOT",
	"MPTIP_SAS_POINTS",
	"MPTIP_SAS_SPYPLANE",
	"MPTIP_SAS_SPECIALIST",
	"MPTIP_SAS_AXE",
	"MPTIP_SAS_GOLD_DOT",
	"MPTIP_SAS_POINTS",
	"MPTIP_SAS_SPYPLANE",
	"MPTIP_SAS_SPECIALIST",
	"MPTIP_ACTIVE_CAMO_TIP",
	"MPTIP_ADS_TIP",
	"MPTIP_CLONE_TIP",
	"MPTIP_DEAD_ALLIES_TIP",
	"MPTIP_ENEMY_ON_MINIMAP_TIP",
	"MPTIP_FOOTSTEPS_TIP",
	"MPTIP_GROUND_WEAPONS_TIP",
	"MPTIP_HUD_TIP",
	"MPTIP_LOOK_SENSITIVITY_TIP",
	"MPTIP_MANTLE_FIRE_TIP",
	"MPTIP_MATCH_BONUS_TIP",
	"MPTIP_PAUSE_MENU_MAP_TIP",
	"MPTIP_POWER_STEALTH_TIP",
	"MPTIP_SLIDE_BOOST_TIP",
	"MPTIP_SLIDE_DIRECTION_TIP",
	"MPTIP_SLIDE_TIP",
	"MPTIP_SPECIALIST_ACTIVATION_TIP",
	"MPTIP_SPRINT_RELOAD_TIP",
	"MPTIP_THRUSTERS_TIP",
	"MPTIP_TOMAHAWK_TIP",
	"MPTIP_TRACKER_TIP",
	"MPTIP_WALL_RUN_SECONDSTAGE_TIP",
	"MPTIP_WALL_RUN_TIP",
	"MPTIP_WEAPON_BUTT_TIP"
}
f0_local1.sniperonly = {
	"MPTIP_SNIPERONLY_MELEE",
	"MPTIP_SNIPERONLY_RANGE",
	"MPTIP_SNIPERONLY_SPECIALIST",
	"MPTIP_SNIPERONLY_MELEE",
	"MPTIP_SNIPERONLY_RANGE",
	"MPTIP_SNIPERONLY_SPECIALIST",
	"MPTIP_SNIPERONLY_MELEE",
	"MPTIP_SNIPERONLY_RANGE",
	"MPTIP_SNIPERONLY_SPECIALIST",
	"MPTIP_ACTIVE_CAMO_TIP",
	"MPTIP_ADS_TIP",
	"MPTIP_AFTERBURNER_TIP",
	"MPTIP_ATTACHMENTS_TIP",
	"MPTIP_ATTACHMENT_VARIETY_TIP",
	"MPTIP_BLASTSUPPRESSOR_TIP",
	"MPTIP_CLONE_TIP",
	"MPTIP_DEAD_ALLIES_TIP",
	"MPTIP_DEEP_IMPACT_TIP",
	"MPTIP_ENEMY_ON_MINIMAP_TIP",
	"MPTIP_EXTENDED_MAGS_TIP",
	"MPTIP_FAST_MAG_TIP",
	"MPTIP_FOOTSTEPS_TIP",
	"MPTIP_GHILLIE_SUIT_TIP",
	"MPTIP_GHOST_FADE_TIP",
	"MPTIP_GLITCH_TIP",
	"MPTIP_GROUND_WEAPONS_TIP",
	"MPTIP_HEAT_WAVE_TIP",
	"MPTIP_HUD_TIP",
	"MPTIP_LOOK_SENSITIVITY_TIP",
	"MPTIP_ONE_GUN_PICKUP_TIP",
	"MPTIP_OVERCLOCK_TIP",
	"MPTIP_OVERDRIVE_TIP",
	"MPTIP_PAUSE_MENU_MAP_TIP",
	"MPTIP_POWER_ARMOR_TIP",
	"MPTIP_POWER_STEALTH_TIP",
	"MPTIP_REJACK_TIP",
	"MPTIP_SIXTHSENSE_TIP",
	"MPTIP_SLIDE_BOOST_TIP",
	"MPTIP_SLIDE_DIRECTION_TIP",
	"MPTIP_SLIDE_TIP",
	"MPTIP_SPECIALIST_ACTIVATION_TIP",
	"MPTIP_SPRINT_RELOAD_TIP",
	"MPTIP_STEADY_AIM_TIP",
	"MPTIP_SUPPRESSOR_TIP",
	"MPTIP_THRUSTERS_TIP",
	"MPTIP_TRACKER_TIP",
	"MPTIP_UTILITY_TIP",
	"MPTIP_VISIONPULSE_TIP",
	"MPTIP_WALL_RUN_SECONDSTAGE_TIP",
	"MPTIP_WALL_RUN_TIP"
}
f0_local1.zombies = {}
f0_local0.DidYouKnow = f0_local1
if not CoD.isCampaign and not CoD.isZombie then
	require( "ui.uieditor.menus.StartGameFlow.LoadingScreenOverlayForNonTeamGames" )
	require( "ui.uieditor.menus.StartGameFlow.LoadingScreenOverlayForTeamGames" )
	require( "ui.uieditor.menus.StartGameFlow.LoadingScreenOverlayForFreeRun" )
else
	require( "ui.uieditor.menus.StartGameFlow.LoadingScreenOverlayForCPZM" )
end
CoD.Loading.FadeInTime = 1000
CoD.Loading.LoadingDelayTime = 0
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
	f3_arg0.continueButton:registerEventHandler( "hide_continue_button", CoD.Loading.HideContinueButton )
	f3_arg0.continueButton:addElement( LUI.UITimer.new( 5000, "hide_continue_button", true, f3_arg0.continueButton ) )
	f3_arg0.continueButton:beginAnimation( "show", 1000 )
	f3_arg0.continueButton:setAlpha( 1 )
	return LUI.UIButton.gainFocus( f3_arg0.continueButton, f3_arg1 )
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	Engine.Stop3DCinematic( 0 )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.SetLoadingMovieSkippedState( true )
	end
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
	if CoD.isZombie then
		if f5_local2 ~= nil and f5_local2 == "zm_island" and IsJapaneseSku() and CoD.LANGUAGE_JAPANESE == Dvar.loc_language:get() then
			f5_local1 = false
		elseif f5_local2 ~= nil and (f5_local2 == "zm_asylum" or f5_local2 == "zm_cosmodrome" or f5_local2 == "zm_moon" or f5_local2 == "zm_sumpf" or f5_local2 == "zm_temple") then
			f5_local1 = false
		elseif Engine.IsDemoPlaying() or Engine.IsSplitscreen() then
			f5_local1 = false
		elseif Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
			f5_local1 = true
			local f5_local5 = CoD.GetMapValue( f5_local2, "introMovie" )
			if f5_local5 == nil and Mods_IsUsingUsermap() then
				f5_local5 = f5_local2 .. "_load"
			end
			if f5_local5 ~= nil and not Engine.IsCinematicPlaying() then
				Engine.StartLoadingCinematic( f5_local5 )
			end
			f5_local1 = true
		else
			f5_local1 = false
		end
		if not f5_local1 then
			Engine.PlayMenuMusic( "load_" .. f5_local2 )
		end
	else
		if true == Dvar.ui_useloadingmovie:get() or CoD.isCampaign then
			if true == Engine.IsCampaignModeZombies() then
				f5_local2 = f5_local2 .. "_nightmares"
			end
			local f5_local6 = CoD.GetMapValue( f5_local2, "introMovie" )
			if f5_local2 ~= nil and f5_local2 == "cp_sh_singapore" and Dvar.cp_queued_level:get() == "cp_mi_sing_blackstation" then
				f5_local6 = "CP_safehouse_load_loadingmovie"
			end
			if f5_local6 ~= nil and not Engine.IsCinematicPlaying() then
				Engine.StartLoadingCinematic( f5_local6 )
			end
			Engine.SetDvar( "ui_useloadingmovie", 0 )
		end
		f5_local1 = false
		if Dvar.art_review:get() ~= "1" and (CoD.isCampaign or CoD.isZombie) and Engine.IsCinematicStarted() then
			f5_local1 = true
		end
	end
	if f5_local1 then
		if CoD.GetMapValue( f5_local2, "fadeToWhite" ) == 1 then
			local f5_local7 = "$white"
		end
		f5_local4 = f5_local7 or "black"
	else
		Engine.SetDvar( "ui_useloadingmovie", 0 )
		if f5_local4 == nil or f5_local4 == "" or CoD.isMultiplayer then
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
	f5_local0:addElement( f5_local0.mapImage )
	if f5_local1 == true then
		f5_local0.mapImage:setShaderVector( 0, 0, 0, 0, 0 )
		f5_local0.mapImage.ismp4 = false
	end
	local f5_local6 = 10
	local f5_local5 = 70
	local f5_local8 = "Big"
	local f5_local9 = CoD.fonts[f5_local8]
	local f5_local10 = CoD.textSize[f5_local8]
	local f5_local11 = "Condensed"
	local f5_local12 = CoD.fonts[f5_local11]
	local f5_local13 = CoD.textSize[f5_local11]
	f5_local0.mapNameLabel = LUI.UIText.new()
	f5_local0.mapNameLabel.id = "mapNameLabel"
	f5_local0.mapNameLabel:setLeftRight( true, false, f5_local5, f5_local5 + 1 )
	f5_local0.mapNameLabel:setTopBottom( true, false, f5_local6, f5_local6 + f5_local10 )
	f5_local0.mapNameLabel:setFont( f5_local9 )
	f5_local0.mapNameLabel:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	f5_local0.mapNameLabel:setAlpha( 0 )
	f5_local0.mapNameLabel:registerEventHandler( "transition_complete_map_name_fade_in", CoD.Loading.MapNameFadeInComplete )
	f5_local0:addLoadingElement( f5_local0.mapNameLabel )
	f5_local6 = f5_local6 + f5_local10 - 5
	f5_local0.mapLocationLabel = LUI.UIText.new()
	f5_local0.mapLocationLabel.id = "mapLocationLabel"
	f5_local0.mapLocationLabel:setLeftRight( true, false, f5_local5, f5_local5 + 1 )
	f5_local0.mapLocationLabel:setTopBottom( true, false, f5_local6, f5_local6 + f5_local13 )
	f5_local0.mapLocationLabel:setFont( f5_local12 )
	f5_local0.mapLocationLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f5_local0.mapLocationLabel:setAlpha( 0 )
	f5_local0.mapLocationLabel:registerEventHandler( "transition_complete_map_location_fade_in", CoD.Loading.MapLocationFadeInComplete )
	f5_local0:addLoadingElement( f5_local0.mapLocationLabel )
	f5_local6 = f5_local6 + f5_local13 - 2
	f5_local0.gametypeLabel = LUI.UIText.new()
	f5_local0.gametypeLabel.id = "gametypeLabel"
	f5_local0.gametypeLabel:setLeftRight( true, false, f5_local5, f5_local5 + 1 )
	f5_local0.gametypeLabel:setTopBottom( true, false, f5_local6, f5_local6 + f5_local13 )
	f5_local0.gametypeLabel:setFont( f5_local12 )
	f5_local0.gametypeLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f5_local0.gametypeLabel:setAlpha( 0 )
	f5_local0.gametypeLabel:registerEventHandler( "transition_complete_gametype_fade_in", CoD.Loading.GametypeFadeInComplete )
	f5_local0:addLoadingElement( f5_local0.gametypeLabel )
	f5_local6 = f5_local6 + f5_local13 + 5
	local f5_local14 = Engine.Localize( "MPUI_TITLE_CAPS" ) .. ":"
	local f5_local15 = {}
	f5_local15 = GetTextDimensions( f5_local14, f5_local12, f5_local13 )
	local f5_local16 = Engine.Localize( "MPUI_DURATION_CAPS" ) .. ":"
	local f5_local17 = {}
	f5_local17 = GetTextDimensions( f5_local16, f5_local12, f5_local13 )
	local f5_local18 = Engine.Localize( "MPUI_AUTHOR_CAPS" ) .. ":"
	local f5_local19 = {}
	f5_local19 = GetTextDimensions( f5_local18, f5_local12, f5_local13 )
	local f5_local20 = math.max( f5_local15[3], f5_local17[3], f5_local19[3] ) + 10
	local f5_local21 = 0
	if not Engine.IsLevelPreloaded( f5_local2 ) then
		f5_local0.demoInfoContainer = LUI.UIElement.new()
		f5_local0.demoInfoContainer:setLeftRight( true, false, f5_local5, 600 )
		f5_local0.demoInfoContainer:setTopBottom( true, false, f5_local6, f5_local6 + 600 )
		f5_local0.demoInfoContainer:setAlpha( 0 )
		f5_local0:addLoadingElement( f5_local0.demoInfoContainer )
		f5_local0.demoTitleTitle = LUI.UIText.new()
		f5_local0.demoTitleTitle:setLeftRight( true, true, 0, 0 )
		f5_local0.demoTitleTitle:setTopBottom( true, false, f5_local21, f5_local21 + f5_local13 )
		f5_local0.demoTitleTitle:setFont( f5_local12 )
		f5_local0.demoTitleTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		f5_local0.demoTitleTitle:setAlignment( LUI.Alignment.Left )
		f5_local0.demoTitleTitle:setText( f5_local14 )
		SetupAutoHorizontalAlignArabicText( f5_local0.demoTitleTitle )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoTitleTitle )
		f5_local0.demoTitleLabel = LUI.UIText.new()
		f5_local0.demoTitleLabel:setLeftRight( true, true, f5_local20, 0 )
		f5_local0.demoTitleLabel:setTopBottom( true, false, f5_local21, f5_local21 + f5_local13 )
		f5_local0.demoTitleLabel:setFont( f5_local12 )
		f5_local0.demoTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local0.demoTitleLabel:setAlignment( LUI.Alignment.Left )
		SetupAutoHorizontalAlignArabicText( f5_local0.demoTitleLabel )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoTitleLabel )
		f5_local21 = f5_local21 + f5_local13 - 2
		f5_local0.demoDurationTitle = LUI.UIText.new()
		f5_local0.demoDurationTitle:setLeftRight( true, true, 0, 0 )
		f5_local0.demoDurationTitle:setTopBottom( true, false, f5_local21, f5_local21 + f5_local13 )
		f5_local0.demoDurationTitle:setFont( f5_local12 )
		f5_local0.demoDurationTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		f5_local0.demoDurationTitle:setAlignment( LUI.Alignment.Left )
		f5_local0.demoDurationTitle:setText( f5_local16 )
		SetupAutoHorizontalAlignArabicText( f5_local0.demoDurationTitle )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoDurationTitle )
		f5_local0.demoDurationLabel = LUI.UIText.new()
		f5_local0.demoDurationLabel:setLeftRight( true, true, f5_local20, 0 )
		f5_local0.demoDurationLabel:setTopBottom( true, false, f5_local21, f5_local21 + f5_local13 )
		f5_local0.demoDurationLabel:setFont( f5_local12 )
		f5_local0.demoDurationLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local0.demoDurationLabel:setAlignment( LUI.Alignment.Left )
		SetupAutoHorizontalAlignArabicText( f5_local0.demoDurationLabel )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoDurationLabel )
		f5_local21 = f5_local21 + f5_local13 - 2
		f5_local0.demoAuthorTitle = LUI.UIText.new()
		f5_local0.demoAuthorTitle:setLeftRight( true, true, 0, 0 )
		f5_local0.demoAuthorTitle:setTopBottom( true, false, f5_local21, f5_local21 + f5_local13 )
		f5_local0.demoAuthorTitle:setFont( f5_local12 )
		f5_local0.demoAuthorTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		f5_local0.demoAuthorTitle:setAlignment( LUI.Alignment.Left )
		f5_local0.demoAuthorTitle:setText( f5_local18 )
		SetupAutoHorizontalAlignArabicText( f5_local0.demoAuthorTitle )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoAuthorTitle )
		f5_local0.demoAuthorLabel = LUI.UIText.new()
		f5_local0.demoAuthorLabel:setLeftRight( true, true, f5_local20, 0 )
		f5_local0.demoAuthorLabel:setTopBottom( true, false, f5_local21, f5_local21 + f5_local13 )
		f5_local0.demoAuthorLabel:setFont( f5_local12 )
		f5_local0.demoAuthorLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local0.demoAuthorLabel:setAlignment( LUI.Alignment.Left )
		SetupAutoHorizontalAlignArabicText( f5_local0.demoAuthorLabel )
		f5_local0.demoInfoContainer:addElement( f5_local0.demoAuthorLabel )
	end
	local f5_local22 = 3
	local f5_local23 = CoD.Loading.DYKFontHeight + f5_local22 * 2
	local f5_local24 = 2
	local f5_local25 = f5_local23 + 1 + f5_local24 + CoD.Loading.DYKFontHeight - f5_local6
	local f5_local26 = CoD.Menu.Width - 5 * 2
	local f5_local27 = -200
	local f5_local28 = 0
	local f5_local29 = 2
	local f5_local30 = f5_local23 - f5_local29 * 2
	local f5_local31 = 6
	f5_local0.loadingBarContainer = LUI.UIElement.new()
	f5_local0.loadingBarContainer.id = "loadingBarContainer"
	f5_local0.loadingBarContainer:setLeftRight( false, false, -f5_local26 / 2, f5_local26 / 2 )
	f5_local0.loadingBarContainer:setTopBottom( false, true, f5_local27 - f5_local25, f5_local27 )
	f5_local0.loadingBarContainer:setAlpha( 0 )
	f5_local0:addElement( f5_local0.loadingBarContainer )
	f5_local0.dykContainer = LUI.UIElement.new()
	f5_local0.dykContainer.id = "dykContainer"
	f5_local0.dykContainer:setLeftRight( true, true, 0, 0 )
	f5_local0.dykContainer:setTopBottom( true, false, f5_local28, f5_local28 + f5_local23 )
	f5_local0.dykContainer.containerHeight = f5_local23
	f5_local0.dykContainer.textAreaWidth = f5_local26 - f5_local22 - f5_local31 - f5_local29 - f5_local30 - 1
	if CoD.isZombie == true then
		f5_local31 = 0
	else
		CoD.Loading.SetupDYKContainerImages( f5_local0.dykContainer )
		f5_local0.didYouKnow = LUI.UIText.new()
		f5_local0.didYouKnow:setLeftRight( true, true, f5_local22 + f5_local31, -f5_local29 - f5_local30 - 1 )
		f5_local0.didYouKnow:setTopBottom( true, false, f5_local22, f5_local22 + CoD.Loading.DYKFontHeight )
		f5_local0.didYouKnow:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local0.didYouKnow:setFont( CoD.Loading.DYKFont )
		f5_local0.didYouKnow:setAlignment( LUI.Alignment.Left )
		f5_local0.didYouKnow:setPriority( 0 )
	end
	f5_local28 = f5_local28 + f5_local23 + 1
	f5_local0.spinner = LUI.UIImage.new()
	f5_local0.spinner.id = "spinner"
	f5_local29 = 110
	f5_local30 = f5_local30 * 5
	f5_local0.spinner:setLeftRight( false, true, -(f5_local29 + f5_local30 / 2), -(f5_local29 - f5_local30 / 2) )
	f5_local0.spinner:setTopBottom( false, true, -(f5_local29 + f5_local30 / 2), -(f5_local29 - f5_local30 / 2) )
	f5_local0.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	f5_local0.spinner:setShaderVector( 0, 0, 0, 0, 0 )
	f5_local0.spinner:setAlpha( 0 )
	f5_local0.spinner:setPriority( 200 )
	f5_local0:addElement( f5_local0.spinner )
	local f5_local32 = LUI.UIImage.new()
	f5_local32.id = "loadingBarBackground"
	f5_local32:setLeftRight( true, true, 1, -1 )
	f5_local32:setTopBottom( true, false, f5_local28, f5_local28 + f5_local24 )
	f5_local32:setRGB( 0.1, 0.1, 0.1 )
	f5_local0.loadingBarContainer:addElement( f5_local32 )
	local f5_local33 = LUI.UIImage.new()
	f5_local33:setLeftRight( true, true, 1, -1 )
	f5_local33:setTopBottom( true, false, f5_local28, f5_local28 + f5_local24 )
	f5_local33:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	f5_local0.loadingBarContainer:addElement( f5_local33 )
	local f5_local34 = 1
	local f5_local35 = LUI.UIImage.new()
	f5_local35:setLeftRight( true, true, 2, -2 )
	f5_local35:setTopBottom( true, false, f5_local28, f5_local28 + f5_local34 )
	f5_local35:setRGB( 1, 1, 1 )
	f5_local35:setAlpha( 0.5 )
	f5_local0.loadingBarContainer:addElement( f5_local35 )
	f5_local33:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f5_local35:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f5_local33:setShaderVector( 1, 0, 0, 0, 0 )
	f5_local33:setShaderVector( 2, 1, 0, 0, 0 )
	f5_local33:setShaderVector( 3, 0, 0, 0, 0 )
	f5_local35:setShaderVector( 1, 0, 0, 0, 0 )
	f5_local35:setShaderVector( 2, 1, 0, 0, 0 )
	f5_local35:setShaderVector( 3, 0, 0, 0, 0 )
	f5_local33:subscribeToGlobalModel( f5_arg0, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
		local loadedFraction = Engine.GetModelValue( model )
		if loadedFraction then
			f5_local33:setShaderVector( 0, loadedFraction, 0, 0, 0 )
			f5_local35:setShaderVector( 0, loadedFraction, 0, 0, 0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( f5_local0, "close", function ( element )
		f5_local33:close()
	end )
	f5_local28 = f5_local28 + f5_local24
	f5_local0.statusLabel = LUI.UIText.new()
	f5_local0.statusLabel:setLeftRight( true, true, f5_local22 + f5_local31, 0 )
	f5_local0.statusLabel:setTopBottom( true, false, f5_local28, f5_local28 + CoD.Loading.DYKFontHeight )
	f5_local0.statusLabel:setAlpha( 0.55 )
	f5_local0.statusLabel:setFont( CoD.Loading.DYKFont )
	f5_local0.statusLabel:setAlignment( LUI.Alignment.Left )
	f5_local0.statusLabel:setupLoadingStatusText()
	f5_local0.loadingBarContainer:addElement( f5_local0.statusLabel )
	if f5_local1 == true then
		CoD.Loading.AddNewLoadingScreen( f5_local0 )
		f5_local0.cinematicSubtitles = CoD.MovieSubtitles.new( f5_local0, f5_arg0 )
		f5_local0.cinematicSubtitles:setLeftRight( false, false, -640, 640 )
		f5_local0.cinematicSubtitles:setTopBottom( false, false, -360, 360 )
		f5_local0:addElement( f5_local0.cinematicSubtitles )
		f5_local0.mapImage:registerEventHandler( "loading_updateimage", f0_local0 )
		f5_local0.mapImage.id = "loadingMenu.mapImage"
		f5_local0:addElement( LUI.UITimer.new( 16, "loading_updateimage", false, f5_local0.mapImage ) )
		Engine.SetDvar( "ui_useloadingmovie", 1 )
		local f5_local36 = 15
		local f5_local37 = 15
		local f5_local38, f5_local39 = Engine.GetUserSafeArea()
		f5_local0.buttonModel = Engine.CreateModel( Engine.GetModelForController( f5_arg0 ), "Loading.buttonPrompts" )
		LUI.OverrideFunction_CallOriginalSecond( f5_local0, "close", function ( element )
			Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( f5_arg0 ), "LoadingScreenOverlayForTeamGames.buttonPrompts" ) )
		end )
		f5_local0.continueButton = LUI.UIButton.new()
		f5_local0.continueButton:setLeftRight( false, false, -f5_local38, f5_local38 / 2 - f5_local36 )
		f5_local0.continueButton:setTopBottom( false, false, f5_local39 / 2 - CoD.textSize.Condensed - f5_local37, f5_local39 / 2 - f5_local37 )
		f5_local0.continueButton:setAlignment( LUI.Alignment.Right )
		f5_local0.continueButton:setAlpha( 0 )
		f5_local0.continueButton:setActionSFX( "uin_mov_skip" )
		f5_local0:addElement( f5_local0.continueButton )
		f5_local0.continueButton:setActionEventNameNewStyle( f5_local0, f5_arg0, "loading_startplay" )
		f5_local0.continueButton:addElement( CoD.ButtonPrompt.new( "start", "", f5_local0, "loading_startplay", true ) )
		f5_local0.continueButton.label = LUI.UIText.new()
		f5_local0.continueButton.label:setLeftRight( true, true, 0, 0 )
		f5_local0.continueButton.label:setTopBottom( true, true, 0, 0 )
		f5_local0.continueButton.label:setFont( CoD.fonts.Condensed )
		f5_local0.continueButton.label:setAlignment( LUI.Alignment.Right )
		f5_local0.continueButton:addElement( f5_local0.continueButton.label )
		f5_local0.continueButton.label:setText( Engine.Localize( "PLATFORM_SKIP" ) )
		f5_local0.continueButton:setHandleMouse( false )
		if CoD.isPC then
			f5_local0:setForceMouseEventDispatch( true )
			f5_local0.continueButtonContainer = LUI.UIElement.new()
			f5_local0.continueButtonContainer:setLeftRight( true, true, 0, 0 )
			f5_local0.continueButtonContainer:setTopBottom( true, true, 0, 0 )
			f5_local0.continueButtonContainer:setAlpha( 1 )
			f5_local0.continueButtonContainer.id = "continueButtonContainer"
			f5_local0.continueButtonContainer:setHandleMouse( true )
			f5_local0:addElement( f5_local0.continueButtonContainer )
			f5_local0.continueButtonContainer:registerEventHandler( "button_action", function ( element, event )
				SendButtonPressToMenuEx( f5_local0, event.controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			end )
		end
		f5_local0:registerEventHandler( "loading_displaycontinue", f0_local1 )
		f5_local0:registerEventHandler( "loading_startplay", f0_local2 )
		if Engine.GetCurrentMap() == "zm_theater" then
			CoD.Loading.StartLoading( f5_local0 )
			CoD.Loading.StartSpinner( f5_local0 )
			f5_local0:registerEventHandler( "fade_in_map_image", nil )
		end
	else
		CoD.Loading.StartLoading( f5_local0 )
		f5_local0:addElement( LUI.UITimer.new( CoD.Loading.SpinnerDelayTime, "start_spinner", true, f5_local0 ) )
	end
	return f5_local0
end

CoD.Loading.GetDidYouKnowString = function ()
	local f12_local0 = 0
	local f12_local1 = ""
	local f12_local2 = 0
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return ""
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
		f12_local0 = #CoD.Loading.DidYouKnow.theater
		if f12_local0 ~= nil and 0 < f12_local0 then
			f12_local1 = CoD.Loading.DidYouKnow.theater[math.random( f12_local0 )]
		end
	elseif CoD.isZombie == true then
		f12_local0 = #CoD.Loading.DidYouKnow.zombies
		if f12_local0 ~= nil and 0 < f12_local0 then
			f12_local1 = CoD.Loading.DidYouKnow.zombies[math.random( f12_local0 )]
		end
	else
		local f12_local3 = #CoD.Loading.DidYouKnow.general
		local f12_local4 = Dvar.ui_gametype:get()
		if f12_local4 == "prop" or f12_local4 == "sas" or f12_local4 == "sniperonly" then
			f12_local3 = 0
		end
		f12_local0 = f12_local0 + f12_local3
		if f12_local4 == "fr" then
			return ""
		end
		local f12_local5 = 0
		if f12_local4 ~= nil and f12_local4 ~= "" and CoD.Loading.DidYouKnow[f12_local4] then
			f12_local5 = #CoD.Loading.DidYouKnow[f12_local4]
		end
		f12_local0 = f12_local0 + f12_local5
		local f12_local6 = 0
		local f12_local7 = 0
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
			f12_local6 = #CoD.Loading.DidYouKnow.league
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
			f12_local7 = #CoD.Loading.DidYouKnow.public
		end
		f12_local2 = math.random( f12_local0 + f12_local6 + f12_local7 )
		if f12_local2 <= f12_local3 then
			f12_local1 = CoD.Loading.DidYouKnow.general[f12_local2]
		elseif 0 < f12_local5 and f12_local2 <= f12_local3 + f12_local5 then
			f12_local1 = CoD.Loading.DidYouKnow[f12_local4][f12_local2 - f12_local3]
		elseif 0 < f12_local7 and f12_local2 <= f12_local3 + f12_local5 + f12_local7 then
			f12_local1 = CoD.Loading.DidYouKnow.public[f12_local2 - f12_local3 - f12_local5]
		elseif 0 < f12_local6 and f12_local2 <= f12_local3 + f12_local5 + f12_local7 + f12_local6 then
			f12_local1 = CoD.Loading.DidYouKnow.league[f12_local2 - f12_local3 - f12_local5 - f12_local7]
		end
	end
	if f12_local1 == nil or f12_local1 == "" then
		return ""
	end
	return Engine.Localize( f12_local1 )
end

CoD.Loading.StartLoading = function ( f13_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "Opening loading screen...\n" )
	if f13_arg0.loadingScreenOverlay == nil then
		CoD.Loading.AddNewLoadingScreen( f13_arg0 )
	end
	if Engine.IsMultiplayerGame() then
		return 
	end
	local f13_local0 = Engine.GetPrimaryController()
	local f13_local1 = MapNameToLocalizedMapName( Engine.GetCurrentMap() )
	local f13_local2 = MapNameToLocalizedMapLocation( Engine.GetCurrentMap() )
	local f13_local3 = Engine.GetCurrentGametypeName( f13_local0 )
	f13_arg0.mapNameLabel:setText( f13_local1 )
	f13_arg0.mapLocationLabel:setText( f13_local2 )
	f13_arg0.gametypeLabel:setText( f13_local3 )
	if Engine.IsDemoPlaying() then
		local f13_local4 = Dvar.ls_demotitle:get()
		local f13_local5 = Dvar.ls_demoduration:get()
		local f13_local6 = ""
		if f13_local5 > 0 then
			f13_local6 = Engine.SecondsAsTime( Dvar.ls_demoduration:get() )
		end
		local f13_local7 = Dvar.ls_demoauthor:get()
		f13_arg0.demoTitleLabel:setText( f13_local4 )
		f13_arg0.demoDurationLabel:setText( f13_local6 )
		f13_arg0.demoAuthorLabel:setText( f13_local7 )
		if f13_local7 == "" then
			f13_arg0.demoAuthorTitle:setAlpha( 0 )
		end
		if f13_local6 == "" then
			f13_arg0.demoDurationTitle:setAlpha( 0 )
		end
	end
	if CoD.isZombie == false then
		local f13_local4 = CoD.Loading.GetDidYouKnowString()
		local f13_local5 = {}
		f13_local5 = GetTextDimensions( f13_local4, CoD.Loading.DYKFont, CoD.Loading.DYKFontHeight )
		if f13_arg0.dykContainer.textAreaWidth < f13_local5[3] then
			f13_arg0.dykContainer:setTopBottom( true, false, -CoD.Loading.DYKFontHeight, f13_arg0.dykContainer.containerHeight )
		end
		f13_arg0.didYouKnow:setText( f13_local4 )
	end
	f13_arg0.mapNameLabel:beginAnimation( "map_name_fade_in", CoD.Loading.FadeInTime )
	f13_arg0.mapNameLabel:setAlpha( 1 )
end

CoD.Loading.AddNewLoadingScreen = function ( f14_arg0 )
	local f14_local0 = f14_arg0
	local f14_local1 = nil
	if Engine.IsMultiplayerGame() then
		if IsFreeRunMap( Dvar.ui_mapname:get() ) or Dvar.ui_gametype:get() == "fr" then
			f14_local1 = LUI.createMenu.LoadingScreenOverlayForFreeRun( f14_local0:getOwner() )
		elseif CoDShared.IsGametypeTeamBased() then
			f14_local1 = LUI.createMenu.LoadingScreenOverlayForTeamGames( f14_local0:getOwner() )
		else
			f14_local1 = LUI.createMenu.LoadingScreenOverlayForNonTeamGames( f14_local0:getOwner() )
		end
	else
		f14_local1 = LUI.createMenu.LoadingScreenOverlayForCPZM( f14_local0:getOwner() )
	end
	f14_local0.loadingScreenOverlay = f14_local1
	f14_local0:addElement( f14_local1 )
	f14_local1:playClip( "StartLoading" )
	f14_local0.mapImage:setRGB( 1, 1, 1 )
	LUI.OverrideFunction_CallOriginalSecond( f14_local0, "close", function ( element )
		element.loadingScreenOverlay:close()
	end )
end

CoD.Loading.StartSpinner = function ( f16_arg0, f16_arg1 )
	f16_arg0.spinner:beginAnimation( "spinner_fade_in", 200 )
	f16_arg0.spinner:setAlpha( 1 )
end

CoD.Loading.MapNameFadeInComplete = function ( f17_arg0 )
	f17_arg0:dispatchEventToParent( {
		name = "fade_in_map_location"
	} )
end

CoD.Loading.FadeInMapLocation = function ( f18_arg0 )
	f18_arg0.mapLocationLabel:beginAnimation( "map_location_fade_in", CoD.Loading.FadeInTime )
	f18_arg0.mapLocationLabel:setAlpha( 1 )
end

CoD.Loading.MapLocationFadeInComplete = function ( f19_arg0 )
	f19_arg0:dispatchEventToParent( {
		name = "fade_in_gametype"
	} )
end

CoD.Loading.FadeInGametype = function ( f20_arg0 )
	f20_arg0.gametypeLabel:beginAnimation( "gametype_fade_in", CoD.Loading.FadeInTime )
	if not CoD.isZombie then
		f20_arg0.gametypeLabel:setAlpha( 0.6 )
	end
end

CoD.Loading.GametypeFadeInComplete = function ( f21_arg0 )
	f21_arg0:dispatchEventToParent( {
		name = "fade_in_map_image"
	} )
end

CoD.Loading.FadeInMapImage = function ( f22_arg0 )
	f22_arg0.mapImage:beginAnimation( "map_image_fade_in", CoD.Loading.FadeInTime )
	f22_arg0.mapImage:setRGB( 1, 1, 1 )
	f22_arg0.loadingBarContainer:beginAnimation( "loading_bar_fade_in", CoD.Loading.FadeInTime )
	f22_arg0.loadingBarContainer:setAlpha( 1 )
	if Engine.IsDemoPlaying() then
		f22_arg0.demoInfoContainer:beginAnimation( "demo_info_fade_in", CoD.Loading.FadeInTime )
		f22_arg0.demoInfoContainer:setAlpha( 1 )
	end
end

CoD.Loading.SetupDYKContainerImages = function ( f23_arg0 )
	local self = LUI.UIImage.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:setRGB( 0, 0, 0 )
	self:setAlpha( 0.52 )
	self:setPriority( -110 )
	f23_arg0:addElement( self )
	local f23_local1 = CoD.BorderT6.new( 1, 1, 1, 1, 0.05 )
	f23_local1:setPriority( -100 )
	f23_arg0:addElement( f23_local1 )
	local f23_local2 = LUI.UIImage.new()
	f23_local2:setLeftRight( true, true, 2, -2 )
	f23_local2:setTopBottom( true, true, 1, -1 )
	f23_local2:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	f23_local2:setRGB( 0, 0, 0 )
	f23_local2:setAlpha( 0.65 )
	f23_local2:setPriority( -80 )
	f23_arg0:addElement( f23_local2 )
	local f23_local3 = LUI.UIImage.new()
	f23_local3:setLeftRight( true, true, 3, -3 )
	f23_local3:setTopBottom( true, false, 3, 23 )
	f23_local3:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	f23_local3:setPriority( 100 )
	f23_local3:setAlpha( 0.06 )
	f23_arg0:addElement( f23_local3 )
end

