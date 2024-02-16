-- eff6f020bff1df4416f8c13a46242bc9
-- This hash is used for caching, delete to decompile the file again

CoD.LeaderboardUtility = {}
CoD.LeaderboardUtility.PLAYER_POSITION_IN_LEADERBOARD = 6
CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS = 1
CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS = 0
CoD.LeaderboardUtility.TOP = 0
CoD.LeaderboardUtility.BOTTOM = 1
CoD.LeaderboardUtility.DefaultTrackTypes = {
	Enum.LbTrackType.LB_TRK_ALLTIME,
	Enum.LbTrackType.LB_TRK_MONTHLY,
	Enum.LbTrackType.LB_TRK_WEEKLY
}
CoD.LeaderboardUtility.leaderboardInfo = {
	LB_CP_TRAINING_SIM = {
		title = "",
		icon = "playlist_gungame",
		gameType = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GB_SCORE = {
		title = "MPUI_LB_CAREER",
		icon = "uie_t7_menu_mp_icons_gamemode_graphic_career",
		gameType = "career",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_TDM = {
		title = "MPUI_TDM_CAPS",
		icon = "playlist_tdm",
		gameType = "tdm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DM = {
		title = "MPUI_DM_CAPS",
		icon = "playlist_ffa",
		gameType = "dm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DOM = {
		title = "MPUI_DOM_CAPS",
		icon = "playlist_domination",
		gameType = "dom",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_SD = {
		title = "MPUI_SD_CAPS",
		icon = "playlist_search_destroy",
		gameType = "sd",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CTF = {
		title = "MPUI_CTF_CAPS",
		icon = "playlist_ctf",
		gameType = "ctf",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DEM = {
		title = "MPUI_DEM_CAPS",
		icon = "playlist_demolition",
		gameType = "dem",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_KOTH = {
		title = "MPUI_KOTH_CAPS",
		icon = "playlist_koth",
		gameType = "koth",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CONF = {
		title = "MPUI_CONF_CAPS",
		icon = "playlist_kill_confirm",
		gameType = "conf",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_BALL = {
		title = "MPUI_BALL_CAPS",
		icon = "playlist_ball",
		gameType = "ball",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_ESCORT = {
		title = "MPUI_ESCORT_CAPS",
		icon = "playlist_escort",
		gameType = "escort",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_GUN = {
		title = "MPUI_GUN_CAPS",
		icon = "playlist_gungame",
		gameType = "gun",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CLEAN = {
		title = "MPUI_CLEAN_CAPS",
		icon = "playlist_clean",
		gameType = "clean",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_INFECT = {
		title = "MPUI_INFECT_CAPS",
		icon = "playlist_infect",
		gameType = "infect",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_PROP = {
		title = "MPUI_PH_CAPS",
		icon = "playlist_prop_hunt",
		gameType = "prop",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_SAS = {
		title = "MPUI_SAS_CAPS",
		icon = "playlist_sticksnstones",
		gameType = "sas",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_SNIPERONLY = {
		title = "MPUI_SNIPERONLY_CAPS",
		icon = "playlist_sniper_only",
		gameType = "sniperonly",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GB_SCORE_HC = {
		title = "MPUI_LB_CAREER",
		icon = "uie_t7_menu_mp_icons_gamemode_graphic_career",
		gameType = "career",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_TDM_HC = {
		title = "MPUI_TDM_CAPS",
		icon = "playlist_tdm",
		gameType = "tdm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DM_HC = {
		title = "MPUI_DM_CAPS",
		icon = "playlist_ffa",
		gameType = "dm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DOM_HC = {
		title = "MPUI_DOM_CAPS",
		icon = "playlist_domination",
		gameType = "dom",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_SD_HC = {
		title = "MPUI_SD_CAPS",
		icon = "playlist_search_destroy",
		gameType = "sd",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CTF_HC = {
		title = "MPUI_CTF_CAPS",
		icon = "playlist_ctf",
		gameType = "ctf",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DEM_HC = {
		title = "MPUI_DEM_CAPS",
		icon = "playlist_demolition",
		gameType = "dem",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_KOTH_HC = {
		title = "MPUI_KOTH_CAPS",
		icon = "playlist_koth",
		gameType = "koth",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CONF_HC = {
		title = "MPUI_CONF_CAPS",
		icon = "playlist_kill_confirm",
		gameType = "conf",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_BALL_HC = {
		title = "MPUI_BALL_CAPS",
		icon = "playlist_ball",
		gameType = "ball",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_ESCORT_HC = {
		title = "MPUI_ESCORT_CAPS",
		icon = "playlist_escort",
		gameType = "escort",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_GUN_HC = {
		title = "MPUI_GUN_CAPS",
		icon = "playlist_gungame",
		gameType = "gun",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CLEAN_HC = {
		title = "MPUI_CLEAN_CAPS",
		icon = "playlist_clean",
		gameType = "clean",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GB_SCORE_ARENA = {
		title = "MPUI_LB_CAREER",
		icon = "uie_t7_menu_mp_icons_gamemode_graphic_career",
		gameType = "career",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_TDM_ARENA = {
		title = "MPUI_TDM_CAPS",
		icon = "playlist_tdm",
		gameType = "tdm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DM_ARENA = {
		title = "MPUI_DM_CAPS",
		icon = "playlist_ffa",
		gameType = "dm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CONF_ARENA = {
		title = "MPUI_CONF_CAPS",
		icon = "playlist_kill_confirm",
		gameType = "conf",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DOM_ARENA = {
		title = "MPUI_DOM_CAPS",
		icon = "playlist_domination",
		gameType = "dom",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_KOTH_ARENA = {
		title = "MPUI_KOTH_CAPS",
		icon = "playlist_koth",
		gameType = "koth",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_SD_ARENA = {
		title = "MPUI_SD_CAPS",
		icon = "playlist_search_destroy",
		gameType = "sd",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DEM_ARENA = {
		title = "MPUI_DEM_CAPS",
		icon = "playlist_demolition",
		gameType = "dem",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CTF_ARENA = {
		title = "MPUI_CTF_CAPS",
		icon = "playlist_ctf",
		gameType = "ctf",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_BALL_ARENA = {
		title = "MPUI_BALL_CAPS",
		icon = "playlist_ball",
		gameType = "ball",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_ESCORT_ARENA = {
		title = "MPUI_ESCORT_CAPS",
		icon = "playlist_escort",
		gameType = "escort",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_GUN_ARENA = {
		title = "MPUI_GUN_CAPS",
		icon = "playlist_gungame",
		gameType = "gun",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CLEAN_ARENA = {
		title = "MPUI_CLEAN_CAPS",
		icon = "playlist_clean",
		gameType = "clean",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_00 = {
		title = "MENU_PRO_SERIES_CAPS",
		icon = "playlist_arena_champions",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_MONTHLY
		}
	},
	LB_MP_ARENA_MASTERS_01 = {
		title = "MENU_MOSHPIT_CAPS",
		icon = "playlist_arena_moshpit",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_MONTHLY
		}
	},
	LB_MP_ARENA_MASTERS_02 = {
		title = "",
		icon = "",
		gameType = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_03 = {
		title = "",
		icon = "",
		gameType = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_04 = {
		title = "",
		icon = "",
		gameType = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_05 = {
		title = "",
		icon = "",
		gameType = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_06 = {
		title = "",
		icon = "",
		gameType = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_07 = {
		title = "",
		icon = "",
		gameType = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_08 = {
		title = "",
		icon = "",
		gameType = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_FR_FREERUN_01 = {
		title = "MPUI_FREERUN_01",
		icon = "t7_icons_leaderboards_freerun_alpha",
		gameType = "fr",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_FR_FREERUN_02 = {
		title = "MPUI_FREERUN_02",
		icon = "t7_icons_leaderboards_freerun_sidewinder",
		gameType = "fr",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_FR_FREERUN_03 = {
		title = "MPUI_FREERUN_03",
		icon = "t7_icons_leaderboards_freerun_infected",
		gameType = "fr",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_FR_FREERUN_04 = {
		title = "MPUI_FREERUN_04",
		icon = "t7_icons_leaderboards_freerun_blackout",
		gameType = "fr",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_CG_GENERAL = {
		title = "MENU_LB_GENERAL",
		icon = "uie_t7_menu_mp_icons_gamemode_graphic_career",
		gameType = "career",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_TDM = {
		title = "MPUI_TDM_CAPS",
		icon = "playlist_tdm",
		gameType = "tdm",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_DM = {
		title = "MPUI_DM_CAPS",
		icon = "playlist_ffa",
		gameType = "dm",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_DOM = {
		title = "MPUI_DOM_CAPS",
		icon = "playlist_domination",
		gameType = "dom",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_SD = {
		title = "MPUI_SD_CAPS",
		icon = "playlist_search_destroy",
		gameType = "sd",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_CTF = {
		title = "MPUI_CTF_CAPS",
		icon = "playlist_ctf",
		gameType = "ctf",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_DEM = {
		title = "MPUI_DEM_CAPS",
		icon = "playlist_demolition",
		gameType = "dem",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_KOTH = {
		title = "MPUI_KOTH_CAPS",
		icon = "playlist_koth",
		gameType = "koth",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_CONF = {
		title = "MPUI_CONF_CAPS",
		icon = "playlist_kill_confirm",
		gameType = "conf",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_BALL = {
		title = "MPUI_BALL_CAPS",
		icon = "playlist_ball",
		gameType = "ball",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_ESCORT = {
		title = "MPUI_ESCORT_CAPS",
		icon = "playlist_escort",
		gameType = "escort",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_GUN = {
		title = "MPUI_GUN_CAPS",
		icon = "playlist_gungame",
		gameType = "gun",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_CLEAN = {
		title = "MPUI_CLEAN_CAPS",
		icon = "playlist_clean",
		gameType = "clean",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_INFECT = {
		title = "MPUI_INFECT_CAPS",
		icon = "playlist_tdm",
		gameType = "infect",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_PROP = {
		title = "MPUI_PH_CAPS",
		icon = "playlist_prop_hunt",
		gameType = "prop",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_SAS = {
		title = "MPUI_SAS_CAPS",
		icon = "playlist_tdm",
		gameType = "sas",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_MP_CG_SNIPERONLY = {
		title = "MPUI_SNIPERONLY_CAPS",
		icon = "playlist_tdm",
		gameType = "sniperonly",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_DAILY
		}
	},
	LB_ZM_GB_KILLS = {
		title = "MENU_LB_ZMGLOBAL_KILLS",
		icon = "t7_icons_leaderboards_zm_kills",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_BULLETS_FIRED = {
		title = "MENU_LB_ZMGLOBAL_SHOTS_FIRED",
		icon = "t7_icons_leaderboards_zm_shotsfired",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_BULLETS_HIT = {
		title = "MENU_LB_ZMGLOBAL_SHOTS_HIT",
		icon = "t7_icons_leaderboards_zm_shotsontarget",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_HEADSHOTS = {
		title = "MENU_LB_ZMGLOBAL_HEADSHOTS",
		icon = "t7_icons_leaderboards_zm_headshots",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_GRENADE_KILLS = {
		title = "MENU_LB_ZMGLOBAL_EXPLOSIVE_KILLS",
		icon = "t7_icons_leaderboards_zm_explosivekills",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_REVIVES = {
		title = "MENU_LB_ZMGLOBAL_REVIVES",
		icon = "t7_icons_leaderboards_zm_revives",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_DISTANCE_TRAVELED = {
		title = "MENU_LB_ZMGLOBAL_DISTANCE_TRAVELED",
		icon = "t7_icons_leaderboards_zm_distancetraveled",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_DOORS_PURCHASED = {
		title = "MENU_LB_ZMGLOBAL_DOORS_OPENED",
		icon = "t7_icons_leaderboards_zm_doorsopened",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_PERKS_DRANK = {
		title = "MENU_LB_ZMGLOBAL_PERKS_DRANK",
		icon = "t7_icons_leaderboards_zm_perkcolas",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_KILLS_AT = {
		title = "MENU_LB_ZMGLOBAL_KILLS",
		icon = "t7_icons_leaderboards_zm_kills",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_BULLETS_FIRED_AT = {
		title = "MENU_LB_ZMGLOBAL_SHOTS_FIRED",
		icon = "t7_icons_leaderboards_zm_shotsfired",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_BULLETS_HIT_AT = {
		title = "MENU_LB_ZMGLOBAL_SHOTS_HIT",
		icon = "t7_icons_leaderboards_zm_shotsontarget",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_HEADSHOTS_AT = {
		title = "MENU_LB_ZMGLOBAL_HEADSHOTS",
		icon = "t7_icons_leaderboards_zm_headshots",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_GRENADE_KILLS_AT = {
		title = "MENU_LB_ZMGLOBAL_EXPLOSIVE_KILLS",
		icon = "t7_icons_leaderboards_zm_explosivekills",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_REVIVES_AT = {
		title = "MENU_LB_ZMGLOBAL_REVIVES",
		icon = "t7_icons_leaderboards_zm_revives",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_DISTANCE_TRAVELED_AT = {
		title = "MENU_LB_ZMGLOBAL_DISTANCE_TRAVELED",
		icon = "t7_icons_leaderboards_zm_distancetraveled",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_DOORS_PURCHASED_AT = {
		title = "MENU_LB_ZMGLOBAL_DOORS_OPENED",
		icon = "t7_icons_leaderboards_zm_doorsopened",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_PERKS_DRANK_AT = {
		title = "MENU_LB_ZMGLOBAL_PERKS_DRANK",
		icon = "t7_icons_leaderboards_zm_perkcolas",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_MAP_FACTORY = {
		title = "ZMUI_FACTORY",
		icon = "t7_menu_zombies_icon_giant",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC0ZM
	},
	LB_ZM_MAP_ZOD = {
		title = "ZMUI_ZOD",
		icon = "t7_menu_zombies_icon_shadowsofevil",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_MAP_CASTLE = {
		title = "ZMUI_CASTLE",
		icon = "t7_menu_zombies_icon_castle",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC1
	},
	LB_ZM_MAP_ISLAND = {
		title = "ZMUI_ISLAND",
		icon = "t7_menu_zombies_icon_island",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC2
	},
	LB_ZM_MAP_STALINGRAD = {
		title = "DLC3_STALINGRAD",
		icon = "t7_menu_zombies_icon_stalingrad",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC3
	},
	LB_ZM_MAP_GENESIS = {
		title = "DLC4_GENESIS",
		icon = "t7_menu_zombies_icon_genesis",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC4
	},
	LB_ZM_MAP_PROTOTYPE = {
		title = "DLC5_PROTOTYPE",
		icon = "t7_menu_zombies_icon_prototype",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC5
	},
	LB_ZM_MAP_ASYLUM = {
		title = "DLC5_ASYLUM",
		icon = "t7_menu_zombies_icon_asylum",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC5
	},
	LB_ZM_MAP_SUMPF = {
		title = "DLC5_SUMPF",
		icon = "t7_menu_zombies_icon_swamp",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC5
	},
	LB_ZM_MAP_THEATER = {
		title = "DLC5_THEATER",
		icon = "t7_menu_zombies_icon_theater",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC5
	},
	LB_ZM_MAP_COSMODROME = {
		title = "DLC5_COSMODROME",
		icon = "t7_menu_zombies_icon_cosmodrome",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC5
	},
	LB_ZM_MAP_TEMPLE = {
		title = "DLC5_TEMPLE",
		icon = "t7_menu_zombies_icon_temple",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC5
	},
	LB_ZM_MAP_MOON = {
		title = "DLC5_MOON",
		icon = "t7_menu_zombies_icon_moon",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC5
	},
	LB_ZM_MAP_TOMB = {
		title = "DLC5_TOMB",
		icon = "t7_menu_zombies_icon_tomb",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC5
	},
	LB_CP_DOA_BO3_ROUND = {
		title = "MENU_LB_DOA_ROUND",
		icon = "t7_icons_leaderboards_doa_round",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_CP_DOA_BO3_SCORE = {
		title = "MENU_LB_DOA_SCORE",
		icon = "t7_icons_leaderboards_doa_score",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_CP_DOA_BO3_SILVERBACKS = {
		title = "MENU_LB_DOA_SILVERBACK_KILLS",
		icon = "t7_icons_leaderboards_doa_silverback",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_CP_DOA_BO3_GEMS = {
		title = "MENU_LB_DOA_GEMS",
		icon = "t7_icons_leaderboards_doa_gems",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_CP_DOA_BO3_SKULLS = {
		title = "MENU_LB_DOA_SKULLS",
		icon = "t7_icons_leaderboards_doa_skulls",
		gameType = "",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	}
}
CoD.LeaderboardUtility.sortColumns = {
	LB_MP_GB_SCORE = {
		{
			columnStr = "MENU_SCORE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_SCORE_PER_MINUTE",
			offset = 200,
			lbSortType = "SPM"
		},
		{
			columnStr = "MENU_LB_GAMES_PLAYED",
			offset = 300,
			lbSortType = "GAMES_PLAYED"
		},
		{
			columnStr = "MENU_LB_TIME_PLAYED",
			offset = 400,
			lbSortType = "TIME_PLAYED"
		}
	},
	LB_MP_GM_TDM = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_ASSISTS",
			offset = 400,
			lbSortType = "ASSISTS"
		}
	},
	LB_MP_GM_DM = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_SCORE",
			offset = 400,
			lbSortType = "SCORE"
		}
	},
	LB_MP_GM_DOM = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_CAPTURES",
			offset = 300,
			lbSortType = "CAPTURES"
		},
		{
			columnStr = "MENU_LB_DEFENDS",
			offset = 400,
			lbSortType = "DEFENDS"
		}
	},
	LB_MP_GM_SD = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_PLANTS",
			offset = 300,
			lbSortType = "PLANTS"
		},
		{
			columnStr = "MENU_LB_DEFUSES",
			offset = 400,
			lbSortType = "DEFUSES"
		}
	},
	LB_MP_GM_CTF = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_CAPTURES",
			offset = 300,
			lbSortType = "CAPTURES"
		},
		{
			columnStr = "MENU_LB_RETURNS",
			offset = 400,
			lbSortType = "RETURNS"
		}
	},
	LB_MP_GM_DEM = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_PLANTS",
			offset = 300,
			lbSortType = "PLANTS"
		},
		{
			columnStr = "MENU_LB_DEFUSES",
			offset = 400,
			lbSortType = "DEFUSES"
		}
	},
	LB_MP_GM_KOTH = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_AVG_TIME",
			offset = 300,
			lbSortType = "AVG_TIME"
		},
		{
			columnStr = "MENU_LB_DEFENDS",
			offset = 400,
			lbSortType = "DEFENDS"
		}
	},
	LB_MP_GM_CONF = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_CONFIRMS",
			offset = 300,
			lbSortType = "CONFIRMS"
		},
		{
			columnStr = "MENU_LB_DENIES",
			offset = 400,
			lbSortType = "DENIES"
		}
	},
	LB_MP_GM_BALL = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_CARRIES",
			offset = 300,
			lbSortType = "CARRIES"
		},
		{
			columnStr = "MENU_LB_THROWS",
			offset = 400,
			lbSortType = "THROWS"
		}
	},
	LB_MP_GM_ESCORT = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_AVG_TIME",
			offset = 300,
			lbSortType = "AVG_TIME"
		},
		{
			columnStr = "MENU_LB_DISABLES",
			offset = 400,
			lbSortType = "DISABLES"
		}
	},
	LB_MP_GM_GUN = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_MELEES",
			offset = 300,
			lbSortType = "MELEES"
		},
		{
			columnStr = "MENU_LB_SETBACKS",
			offset = 400,
			lbSortType = "SETBACKS"
		}
	},
	LB_MP_GM_CLEAN = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_DENIES",
			offset = 300,
			lbSortType = "DENIES"
		},
		{
			columnStr = "MENU_LB_DEPOSITS",
			offset = 400,
			lbSortType = "DEPOSITS"
		}
	},
	LB_MP_GM_INFECT = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_SCORE",
			offset = 400,
			lbSortType = "SCORE"
		}
	},
	LB_MP_GM_PROP = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_SCORE",
			offset = 400,
			lbSortType = "SCORE"
		}
	},
	LB_MP_GM_SAS = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_AXES",
			offset = 300,
			lbSortType = "AXES"
		},
		{
			columnStr = "MENU_LB_SETBACKS",
			offset = 400,
			lbSortType = "SETBACKS"
		}
	},
	LB_MP_GM_SNIPERONLY = {
		{
			columnStr = "MENU_SCORE_PER_MINUTE",
			offset = 0,
			lbSortType = ""
		},
		{
			columnStr = "MENU_LB_KILLS",
			offset = 200,
			lbSortType = "KILLS"
		},
		{
			columnStr = "MENU_LB_ASSISTS",
			offset = 400,
			lbSortType = "ASSISTS"
		}
	}
}
CoD.LeaderboardUtility.leaderboardListTrainingSim = {
	"LB_CP_TRAINING_SIM"
}
CoD.LeaderboardUtility.leaderboardListCore = {
	"LB_MP_GB_SCORE",
	"LB_MP_GM_TDM",
	"LB_MP_GM_DM",
	"LB_MP_GM_CONF",
	"LB_MP_GM_DOM",
	"LB_MP_GM_KOTH",
	"LB_MP_GM_SD",
	"LB_MP_GM_DEM",
	"LB_MP_GM_CTF",
	"LB_MP_GM_BALL",
	"LB_MP_GM_ESCORT",
	"LB_MP_GM_GUN",
	"LB_MP_GM_CLEAN",
	"LB_MP_GM_INFECT",
	"LB_MP_GM_PROP",
	"LB_MP_GM_SAS",
	"LB_MP_GM_SNIPERONLY"
}
CoD.LeaderboardUtility.leaderboardListHardcore = {
	"LB_MP_GB_SCORE",
	"LB_MP_GM_TDM",
	"LB_MP_GM_DM",
	"LB_MP_GM_CONF",
	"LB_MP_GM_DOM",
	"LB_MP_GM_SD",
	"LB_MP_GM_CTF"
}
CoD.LeaderboardUtility.leaderboardListArena = {
	"LB_MP_GB_SCORE_ARENA",
	"LB_MP_GM_KOTH_ARENA",
	"LB_MP_GM_SD_ARENA",
	"LB_MP_GM_CTF_ARENA",
	"LB_MP_GM_BALL_ARENA"
}
CoD.LeaderboardUtility.leaderboardListFreerun = {
	"LB_MP_GM_FR_FREERUN_01",
	"LB_MP_GM_FR_FREERUN_02",
	"LB_MP_GM_FR_FREERUN_03",
	"LB_MP_GM_FR_FREERUN_04"
}
CoD.LeaderboardUtility.leaderboardListCustom = {
	"LB_MP_CG_GENERAL",
	"LB_MP_CG_TDM",
	"LB_MP_CG_DM",
	"LB_MP_CG_DOM",
	"LB_MP_CG_SD",
	"LB_MP_CG_CTF",
	"LB_MP_CG_DEM",
	"LB_MP_CG_KOTH",
	"LB_MP_CG_CONF",
	"LB_MP_CG_BALL",
	"LB_MP_CG_ESCORT",
	"LB_MP_CG_GUN",
	"LB_MP_CG_CLEAN"
}
CoD.LeaderboardUtility.leaderboardListZMGlobal = {
	"LB_ZM_GB_KILLS",
	"LB_ZM_GB_BULLETS_FIRED",
	"LB_ZM_GB_BULLETS_HIT",
	"LB_ZM_GB_HEADSHOTS",
	"LB_ZM_GB_GRENADE_KILLS",
	"LB_ZM_GB_REVIVES",
	"LB_ZM_GB_DISTANCE_TRAVELED",
	"LB_ZM_GB_DOORS_PURCHASED",
	"LB_ZM_GB_PERKS_DRANK"
}
CoD.LeaderboardUtility.leaderboardListZMMaps = {
	"LB_ZM_MAP_FACTORY",
	"LB_ZM_MAP_ZOD",
	"LB_ZM_MAP_CASTLE",
	"LB_ZM_MAP_ISLAND",
	"LB_ZM_MAP_STALINGRAD",
	"LB_ZM_MAP_GENESIS",
	"LB_ZM_MAP_PROTOTYPE",
	"LB_ZM_MAP_ASYLUM",
	"LB_ZM_MAP_SUMPF",
	"LB_ZM_MAP_THEATER",
	"LB_ZM_MAP_COSMODROME",
	"LB_ZM_MAP_TEMPLE",
	"LB_ZM_MAP_MOON",
	"LB_ZM_MAP_TOMB"
}
CoD.LeaderboardUtility.leaderboardListDOA = {
	"LB_CP_DOA_BO3_ROUND",
	"LB_CP_DOA_BO3_SCORE",
	"LB_CP_DOA_BO3_SILVERBACKS",
	"LB_CP_DOA_BO3_GEMS",
	"LB_CP_DOA_BO3_SKULLS"
}
CoD.LeaderboardUtility.leaderboardTab = {
	trainingSim = {
		leaderboardList = CoD.LeaderboardUtility.leaderboardListTrainingSim,
		leaderboardSuffix = "",
		leaderboardHeaderText = "MENU_LB_TAB_TRAINING_SIM_CAPS"
	},
	core = {
		leaderboardList = CoD.LeaderboardUtility.leaderboardListCore,
		leaderboardSuffix = "",
		leaderboardHeaderText = "MENU_LB_TAB_CORE_CAPS"
	},
	hardcore = {
		leaderboardList = CoD.LeaderboardUtility.leaderboardListHardcore,
		leaderboardSuffix = "_HC",
		leaderboardHeaderText = "MENU_LB_TAB_HARDCORE_CAPS"
	},
	arena = {
		leaderboardList = CoD.LeaderboardUtility.leaderboardListArena,
		leaderboardSuffix = "",
		leaderboardHeaderText = "MENU_LB_TAB_ARENA_CAPS"
	},
	freerun = {
		leaderboardList = CoD.LeaderboardUtility.leaderboardListFreerun,
		leaderboardSuffix = "",
		leaderboardHeaderText = "MENU_LB_TAB_FREERUN_CAPS"
	},
	custom = {
		leaderboardList = CoD.LeaderboardUtility.leaderboardListCustom,
		leaderboardSuffix = "",
		leaderboardHeaderText = "MENU_LB_TAB_CUSTOM_CAPS"
	},
	zm_global = {
		leaderboardList = CoD.LeaderboardUtility.leaderboardListZMGlobal,
		leaderboardSuffix = "_AT",
		leaderboardHeaderText = "MENU_LB_TAB_ZMGLOBAL_CAPS"
	},
	zm_maps = {
		leaderboardList = CoD.LeaderboardUtility.leaderboardListZMMaps,
		leaderboardSuffix = "",
		leaderboardHeaderText = "MENU_LB_TAB_ZMMAPS_CAPS"
	},
	doa = {
		leaderboardList = CoD.LeaderboardUtility.leaderboardListDOA,
		leaderboardSuffix = "",
		leaderboardHeaderText = "MENU_DOA2_TITLE"
	}
}
CoD.LeaderboardUtility.leaderboardGameModeData = {}
CoD.LeaderboardUtility.LeaderboardGameModeButtonPrepare = function ( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	local f1_local1 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not f1_local1 then
		return f1_local0
	end
	local f1_local2 = Engine.GetModelValue( f1_local1 )
	if not f1_local2 then
		return f1_local0
	end
	local f1_local3 = CoD.LeaderboardUtility.leaderboardTab[f1_local2]
	local f1_local4 = f1_local3.leaderboardList
	local f1_local5 = f1_local3.leaderboardSuffix
	for f1_local9, f1_local10 in pairs( f1_local4 ) do
		local f1_local11 = CoD.LeaderboardUtility.leaderboardInfo[f1_local10]
		if not CoD.IsHiddenDLC( f1_local11.dlcBit ) then
			table.insert( f1_local0, {
				models = {
					title = LocalizeToUpperString( f1_local11.title ),
					icon = f1_local11.icon,
					lbDef = f1_local10 .. f1_local5
				},
				properties = {
					selectIndex = f1_local9 == 1
				}
			} )
		end
	end
	CoD.LeaderboardUtility.leaderboardGameModeData = f1_local0
	return f1_local0
end

CoD.LeaderboardUtility.CustomLeaderboardButtonPrepare = function ( f2_arg0, f2_arg1 )
	local f2_local0 = {}
	for f2_local4, f2_local5 in pairs( f2_arg1 ) do
		local f2_local6 = CoD.LeaderboardUtility.leaderboardInfo[f2_local5]
		if not CoD.IsHiddenDLC( f2_local6.dlcBit ) then
			table.insert( f2_local0, {
				models = {
					title = LocalizeToUpperString( f2_local6.title ),
					icon = f2_local6.icon,
					lbDef = f2_local5
				},
				properties = {
					selectIndex = f2_local4 == 1
				}
			} )
		end
	end
	CoD.LeaderboardUtility.leaderboardGameModeData = f2_local0
	return f2_local0
end

DataSources.LeaderboardGameModeButton = DataSourceHelpers.ListSetup( "LeaderboardGameModeButton", CoD.LeaderboardUtility.LeaderboardGameModeButtonPrepare, true )
CoD.LeaderboardUtility.LeaderboardGameModeTabsPrepare = function ( f3_arg0 )
	local f3_local0 = {}
	if IsLobbyLeaderboard( f3_arg0 ) then
		local f3_local1 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" )
		if f3_local1 then
			table.insert( f3_local0, {
				models = {
					tabName = "",
					tabWidget = "CoD.Leaderboard_GameModeFrame",
					tabIcon = "",
					lbDef = Engine.GetModelValue( f3_local1 )
				},
				properties = {
					selectIndex = true
				}
			} )
		end
		return f3_local0
	end
	local f3_local1 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" )
	local f3_local2 = CoD.LeaderboardUtility.leaderboardGameModeData[1].models.lbDef
	if f3_local1 ~= nil then
		f3_local2 = Engine.GetModelValue( f3_local1 )
	end
	for f3_local6, f3_local7 in pairs( CoD.LeaderboardUtility.leaderboardGameModeData ) do
		table.insert( f3_local0, {
			models = {
				tabName = f3_local7.models.title,
				tabWidget = "CoD.Leaderboard_GameModeFrame",
				tabIcon = "",
				lbDef = f3_local7.models.lbDef
			},
			properties = {
				selectIndex = f3_local7.models.lbDef == f3_local2
			}
		} )
	end
	return f3_local0
end

DataSources.LeaderboardGameModeTabs = DataSourceHelpers.ListSetup( "LeaderboardGameModeTabs", CoD.LeaderboardUtility.LeaderboardGameModeTabsPrepare, true )
CoD.LeaderboardUtility.SetZMMapsNumPlayersFilter = function ( f4_arg0 )
	local f4_local0 = Engine.GetModelValue
	local f4_local1 = Engine.GetModel
	local f4_local2 = Engine.GetGlobalModel()
	CoD.perController[f4_local0( f4_local1( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )].leaderboardZMMapsNumPlayersFilter = f4_arg0
end

CoD.LeaderboardUtility.SetDOANumPlayersFilter = function ( f5_arg0 )
	local f5_local0 = Engine.GetModelValue
	local f5_local1 = Engine.GetModel
	local f5_local2 = Engine.GetGlobalModel()
	CoD.perController[f5_local0( f5_local1( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )].leaderboardDOANumPlayersFilter = f5_arg0
end

CoD.LeaderboardUtility.SetPlayerFilter = function ( f6_arg0 )
	local f6_local0 = Engine.GetModelValue
	local f6_local1 = Engine.GetModel
	local f6_local2 = Engine.GetGlobalModel()
	CoD.perController[f6_local0( f6_local1( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )].leaderboardPlayerFilter = f6_arg0
end

CoD.LeaderboardUtility.SetDurationFilter = function ( f7_arg0 )
	local f7_local0 = Engine.GetModelValue
	local f7_local1 = Engine.GetModel
	local f7_local2 = Engine.GetGlobalModel()
	CoD.perController[f7_local0( f7_local1( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )].leaderboardDurationFilter = f7_arg0
end

CoD.LeaderboardUtility.GetZMMapsNumPlayersFilterString = function ( f8_arg0 )
	if f8_arg0 == 1 then
		return Engine.Localize( "MENU_SOLO" )
	else
		return Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", f8_arg0 )
	end
end

CoD.LeaderboardUtility.GetDOANumPlayersFilterString = function ( f9_arg0 )
	if f9_arg0 == 0 then
		return Engine.Localize( "MENU_ALL" )
	elseif f9_arg0 == 1 then
		return Engine.Localize( "MENU_SOLO" )
	else
		return Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", f9_arg0 )
	end
end

CoD.LeaderboardUtility.GetPlayerFilterString = function ( f10_arg0 )
	if f10_arg0 == Enum.LbFilter.LB_FILTER_FRIENDS then
		return Engine.Localize( "MENU_LB_PFILTER_FRIENDS" )
	elseif f10_arg0 == Enum.LbFilter.LB_FILTER_LOBBY_MEMBERS then
		return Engine.Localize( "MENU_LB_PFILTER_LOBBY" )
	elseif f10_arg0 == Enum.LbFilter.LB_FILTER_CUSTOM then
		return Engine.Localize( "MENU_LB_PFILTER_RECENT_LOBBY" )
	elseif f10_arg0 == Enum.LbFilter.LB_FILTER_NONE then
		return Engine.Localize( "MENU_LB_PFILTER_ALL" )
	else
		
	end
end

CoD.LeaderboardUtility.GetDurationFilterString = function ( f11_arg0 )
	if f11_arg0 == Enum.LbTrackType.LB_TRK_ALLTIME then
		return Engine.Localize( "MENU_LB_DFILTER_ALL_TIME" )
	elseif f11_arg0 == Enum.LbTrackType.LB_TRK_MONTHLY then
		return Engine.Localize( "MENU_LB_DFILTER_MONTHLY" )
	elseif f11_arg0 == Enum.LbTrackType.LB_TRK_WEEKLY then
		return Engine.Localize( "MENU_LB_DFILTER_WEEKLY" )
	elseif f11_arg0 == Enum.LbTrackType.LB_TRK_DAILY then
		return Engine.Localize( "MENU_LB_DFILTER_DAILY" )
	else
		
	end
end

CoD.LeaderboardUtility.CreateModels_ZMMapsNumPlayersFilter = function ( f12_arg0 )
	local f12_local0 = {
		{
			name = Engine.Localize( "MENU_SOLO" ),
			value = 1
		},
		{
			name = Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", 2 ),
			value = 2
		},
		{
			name = Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", 3 ),
			value = 3
		},
		{
			name = Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", 4 ),
			value = 4
		}
	}
	local f12_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f12_arg0 ), "leaderboards.leaderboardZMMapsNumPlayersFilter" )
	if not f12_local1 then
		f12_local1 = CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS
	end
	return {
		models = {
			displayText = "MENU_LB_FILTER_NUMBER_OF_PLAYERS",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f12_arg0, "LeaderboardFilterOptions_ZMMapsNumPlayersFilter", f12_local0, nil, CoD.LeaderboardUtility.SetZMMapsNumPlayersFilter, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( f12_arg0, f12_local0, f12_local1 )
		},
		properties = {}
	}
end

CoD.LeaderboardUtility.CreateModels_DOANumPlayersFilter = function ( f13_arg0 )
	local f13_local0 = {
		{
			name = Engine.Localize( "MENU_ALL" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_SOLO" ),
			value = 1
		},
		{
			name = Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", 2 ),
			value = 2
		},
		{
			name = Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", 3 ),
			value = 3
		},
		{
			name = Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", 4 ),
			value = 4
		}
	}
	local f13_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f13_arg0 ), "leaderboards.leaderboardDOANumPlayersFilter" )
	if not f13_local1 then
		f13_local1 = CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS
	end
	return {
		models = {
			displayText = "MENU_LB_FILTER_NUMBER_OF_PLAYERS",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f13_arg0, "LeaderboardFilterOptions_DOANumPlayersFilter", f13_local0, nil, CoD.LeaderboardUtility.SetDOANumPlayersFilter, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( f13_arg0, f13_local0, f13_local1 )
		},
		properties = {}
	}
end

CoD.LeaderboardUtility.LeaderboardPlayerFilterList = function ( f14_arg0 )
	local f14_local0 = IsCustomLeaderboard( f14_arg0 )
	local f14_local1 = {}
	table.insert( f14_local1, {
		name = Engine.Localize( "MENU_LB_PFILTER_FRIENDS" ),
		value = Enum.LbFilter.LB_FILTER_FRIENDS
	} )
	table.insert( f14_local1, {
		name = Engine.Localize( "MENU_LB_PFILTER_LOBBY" ),
		value = Enum.LbFilter.LB_FILTER_LOBBY_MEMBERS
	} )
	if f14_local0 then
		table.insert( f14_local1, {
			name = Engine.Localize( "MENU_LB_PFILTER_RECENT_LOBBY" ),
			value = Enum.LbFilter.LB_FILTER_CUSTOM
		} )
	end
	if not f14_local0 then
		table.insert( f14_local1, {
			name = Engine.Localize( "MENU_LB_PFILTER_ALL" ),
			value = Enum.LbFilter.LB_FILTER_NONE
		} )
	end
	return f14_local1
end

CoD.LeaderboardUtility.CreateModels_PlayerFilter = function ( f15_arg0 )
	local f15_local0 = CoD.LeaderboardUtility.LeaderboardPlayerFilterList( f15_arg0 )
	local f15_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f15_arg0 ), "leaderboards.leaderboardPlayerFilter" )
	if not f15_local1 then
		f15_local1 = Enum.LbFilter.LB_FILTER_FRIENDS
	end
	return {
		models = {
			displayText = "MENU_LB_FILTER_PLAYERS",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f15_arg0, "LeaderboardFilterOptions_PlayerFilter", f15_local0, nil, CoD.LeaderboardUtility.SetPlayerFilter, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( f15_arg0, f15_local0, f15_local1 )
		},
		properties = {}
	}
end

CoD.LeaderboardUtility.CreateModels_DurationFilter = function ( f16_arg0 )
	local f16_local0 = {
		{
			name = Engine.Localize( "MENU_LB_DFILTER_ALL_TIME" ),
			value = Enum.LbTrackType.LB_TRK_ALLTIME
		},
		{
			name = Engine.Localize( "MENU_LB_DFILTER_MONTHLY" ),
			value = Enum.LbTrackType.LB_TRK_MONTHLY
		},
		{
			name = Engine.Localize( "MENU_LB_DFILTER_WEEKLY" ),
			value = Enum.LbTrackType.LB_TRK_WEEKLY
		},
		{
			name = Engine.Localize( "MENU_LB_DFILTER_DAILY" ),
			value = Enum.LbTrackType.LB_TRK_DAILY
		}
	}
	local f16_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f16_arg0 ), "leaderboards.leaderboardDurationFilter" )
	if not f16_local1 then
		f16_local1 = Enum.LbTrackType.LB_TRK_ALLTIME
	end
	local f16_local2 = CoD.LeaderboardUtility.leaderboardInfo[Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )]
	local f16_local3 = {}
	for f16_local10, f16_local11 in ipairs( f16_local2.trackTypes ) do
		for f16_local7, f16_local8 in ipairs( f16_local0 ) do
			if f16_local8.value == f16_local11 then
				table.insert( f16_local3, f16_local0[f16_local7] )
			end
		end
	end
	return {
		models = {
			displayText = "MENU_LB_FILTER_DURATION",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f16_arg0, "LeaderboardFilterOptions_DurationFilter", f16_local3, nil, CoD.LeaderboardUtility.SetDurationFilter, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( f16_arg0, f16_local3, f16_local1 )
		},
		properties = {}
	}
end

CoD.LeaderboardUtility.LeaderboardFilterOptionsPrepare = function ( f17_arg0 )
	local f17_local0 = {}
	local f17_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )
	local f17_local2 = CoD.LeaderboardUtility.leaderboardInfo[f17_local1]
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ), f17_arg0 )
	if IsZMMapsLeaderboard( f17_arg0 ) then
		table.insert( f17_local0, CoD.LeaderboardUtility.CreateModels_ZMMapsNumPlayersFilter( f17_arg0 ) )
	end
	if IsDOALeaderboard( f17_arg0 ) and (LUI.startswith( f17_local1, "LB_CP_DOA_BO3_SCORE" ) or LUI.startswith( f17_local1, "LB_CP_DOA_BO3_ROUND" )) then
		table.insert( f17_local0, CoD.LeaderboardUtility.CreateModels_DOANumPlayersFilter( f17_arg0 ) )
	end
	if not IsLobbyLeaderboard( f17_arg0 ) then
		table.insert( f17_local0, CoD.LeaderboardUtility.CreateModels_PlayerFilter( f17_arg0 ) )
	end
	if #f17_local2.trackTypes > 1 then
		table.insert( f17_local0, CoD.LeaderboardUtility.CreateModels_DurationFilter( f17_arg0 ) )
	end
	return f17_local0
end

CoD.LeaderboardUtility.LeaderboardResetOptionsPrepare = function ( f18_arg0 )
	local f18_local0 = {}
	if IsCustomLeaderboard( f18_arg0 ) == true then
		table.insert( f18_local0, {
			models = {
				displayText = "MENU_LB_RESET_ALL_LEADERBOARDS",
				actionText = "MENU_LB_RESET_MY_STATS",
				hintText = "MENU_LB_RESET_ALL_LEADERBOARDS_INFO",
				action = OpenLeaderboardResetOverlay,
				param = 0,
				disabled = false
			}
		} )
		table.insert( f18_local0, {
			models = {
				displayText = "MENU_LB_RESET_CURRENT_LEADERBOARD",
				actionText = "MENU_LB_RESET_MY_STATS",
				hintText = "MENU_LB_RESET_CURRENT_LEADERBOARD_INFO",
				action = OpenLeaderboardResetOverlay,
				param = 1,
				disabled = false
			}
		} )
	end
	return f18_local0
end

CoD.LeaderboardUtility.GetCareerLeaderboardDef = function ( f19_arg0 )
	return "LB_MP_GB_SCORE"
end

CoD.OverlayUtility.AddSystemOverlay( "LeaderboardsDownForMaintanence", {
	menuName = "SystemOverlay_Compact",
	title = "MENU_LEADERBOARDS_NOT_AVAILABLE",
	description = "MENU_LEADERBOARDS_NOT_AVAILABLE_DESC",
	categoryType = CoD.OverlayUtility.OverlayTypes.Notice,
	listDatasource = function ()
		DataSources.LeaderboardsDownForMaintanenceList = DataSourceHelpers.ListSetup( "LeaderboardsDownForMaintanenceList", function ( f21_arg0 )
			return {
				{
					models = {
						displayText = "MENU_OK"
					},
					properties = {
						action = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
							GoBack( f22_arg4, f22_arg2 )
						end
						
					}
				}
			}
		end, true, nil )
		return "LeaderboardsDownForMaintanenceList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
DataSources.LeaderboardFilterOptions = DataSourceHelpers.ListSetup( "LeaderboardFilterOptions", CoD.LeaderboardUtility.LeaderboardFilterOptionsPrepare, true )
DataSources.LeaderboardResetOptions = DataSourceHelpers.ListSetup( "LeaderboardResetOptions", CoD.LeaderboardUtility.LeaderboardResetOptionsPrepare, true )
