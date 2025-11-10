CoD.LeaderboardUtility = {}
CoD.LeaderboardUtility.PLAYER_POSITION_IN_LEADERBOARD = 6
CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS = 1
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
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GB_SCORE = {
		title = "MPUI_LB_CAREER",
		icon = "t7_icons_leaderboards_career",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_TDM = {
		title = "MPUI_TDM_CAPS",
		icon = "playlist_tdm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DM = {
		title = "MPUI_DM_CAPS",
		icon = "playlist_ffa",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DOM = {
		title = "MPUI_DOM_CAPS",
		icon = "playlist_domination",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_SD = {
		title = "MPUI_SD_CAPS",
		icon = "playlist_search_destroy",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CTF = {
		title = "MPUI_CTF_CAPS",
		icon = "playlist_ctf",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DEM = {
		title = "MPUI_DEM_CAPS",
		icon = "playlist_demolition",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_KOTH = {
		title = "MPUI_KOTH_CAPS",
		icon = "playlist_koth",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CONF = {
		title = "MPUI_CONF_CAPS",
		icon = "playlist_kill_confirm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_BALL = {
		title = "MPUI_BALL_CAPS",
		icon = "playlist_ball",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_ESCORT = {
		title = "MPUI_ESCORT_CAPS",
		icon = "playlist_escort",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_GUN = {
		title = "MPUI_GUN_CAPS",
		icon = "playlist_gungame",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GB_SCORE_HC = {
		title = "MPUI_LB_CAREER",
		icon = "t7_icons_leaderboards_career",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_TDM_HC = {
		title = "MPUI_TDM_CAPS",
		icon = "playlist_tdm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DM_HC = {
		title = "MPUI_DM_CAPS",
		icon = "playlist_ffa",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DOM_HC = {
		title = "MPUI_DOM_CAPS",
		icon = "playlist_domination",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_SD_HC = {
		title = "MPUI_SD_CAPS",
		icon = "playlist_search_destroy",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CTF_HC = {
		title = "MPUI_CTF_CAPS",
		icon = "playlist_ctf",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DEM_HC = {
		title = "MPUI_DEM_CAPS",
		icon = "playlist_demolition",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_KOTH_HC = {
		title = "MPUI_KOTH_CAPS",
		icon = "playlist_koth",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CONF_HC = {
		title = "MPUI_CONF_CAPS",
		icon = "playlist_kill_confirm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_BALL_HC = {
		title = "MPUI_BALL_CAPS",
		icon = "playlist_ball",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_ESCORT_HC = {
		title = "MPUI_ESCORT_CAPS",
		icon = "playlist_escort",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_GUN_HC = {
		title = "MPUI_GUN_CAPS",
		icon = "playlist_gungame",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GB_SCORE_ARENA = {
		title = "MPUI_LB_CAREER",
		icon = "t7_icons_leaderboards_career",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_TDM_ARENA = {
		title = "MPUI_TDM_CAPS",
		icon = "playlist_tdm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DM_ARENA = {
		title = "MPUI_DM_CAPS",
		icon = "playlist_ffa",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CONF_ARENA = {
		title = "MPUI_CONF_CAPS",
		icon = "playlist_kill_confirm",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DOM_ARENA = {
		title = "MPUI_DOM_CAPS",
		icon = "playlist_domination",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_KOTH_ARENA = {
		title = "MPUI_KOTH_CAPS",
		icon = "playlist_koth",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_SD_ARENA = {
		title = "MPUI_SD_CAPS",
		icon = "playlist_search_destroy",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_DEM_ARENA = {
		title = "MPUI_DEM_CAPS",
		icon = "playlist_demolition",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_CTF_ARENA = {
		title = "MPUI_CTF_CAPS",
		icon = "playlist_ctf",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_BALL_ARENA = {
		title = "MPUI_BALL_CAPS",
		icon = "playlist_ball",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_ESCORT_ARENA = {
		title = "MPUI_ESCORT_CAPS",
		icon = "playlist_escort",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_GUN_ARENA = {
		title = "MPUI_GUN_CAPS",
		icon = "playlist_gungame",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_00 = {
		title = "MENU_PRO_SERIES_CAPS",
		icon = "playlist_arena_champions",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_MONTHLY
		}
	},
	LB_MP_ARENA_MASTERS_01 = {
		title = "MENU_MOSHPIT_CAPS",
		icon = "playlist_arena_moshpit",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_MONTHLY
		}
	},
	LB_MP_ARENA_MASTERS_02 = {
		title = "",
		icon = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_03 = {
		title = "",
		icon = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_04 = {
		title = "",
		icon = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_05 = {
		title = "",
		icon = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_06 = {
		title = "",
		icon = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_07 = {
		title = "",
		icon = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_ARENA_MASTERS_08 = {
		title = "",
		icon = "",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_FR_FREERUN_01 = {
		title = "MPUI_FREERUN_01",
		icon = "t7_icons_leaderboards_freerun_alpha",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_FR_FREERUN_02 = {
		title = "MPUI_FREERUN_02",
		icon = "t7_icons_leaderboards_freerun_sidewinder",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_FR_FREERUN_03 = {
		title = "MPUI_FREERUN_03",
		icon = "t7_icons_leaderboards_freerun_infected",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_MP_GM_FR_FREERUN_04 = {
		title = "MPUI_FREERUN_04",
		icon = "t7_icons_leaderboards_freerun_blackout",
		trackTypes = CoD.LeaderboardUtility.DefaultTrackTypes
	},
	LB_ZM_GB_KILLS = {
		title = "MENU_LB_ZMGLOBAL_KILLS",
		icon = "t7_icons_leaderboards_zm_kills",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_BULLETS_FIRED = {
		title = "MENU_LB_ZMGLOBAL_SHOTS_FIRED",
		icon = "t7_icons_leaderboards_zm_shotsfired",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_BULLETS_HIT = {
		title = "MENU_LB_ZMGLOBAL_SHOTS_HIT",
		icon = "t7_icons_leaderboards_zm_shotsontarget",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_HEADSHOTS = {
		title = "MENU_LB_ZMGLOBAL_HEADSHOTS",
		icon = "t7_icons_leaderboards_zm_headshots",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_GRENADE_KILLS = {
		title = "MENU_LB_ZMGLOBAL_EXPLOSIVE_KILLS",
		icon = "t7_icons_leaderboards_zm_explosivekills",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_REVIVES = {
		title = "MENU_LB_ZMGLOBAL_REVIVES",
		icon = "t7_icons_leaderboards_zm_revives",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_DISTANCE_TRAVELED = {
		title = "MENU_LB_ZMGLOBAL_DISTANCE_TRAVELED",
		icon = "t7_icons_leaderboards_zm_distancetraveled",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_DOORS_PURCHASED = {
		title = "MENU_LB_ZMGLOBAL_DOORS_OPENED",
		icon = "t7_icons_leaderboards_zm_doorsopened",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_PERKS_DRANK = {
		title = "MENU_LB_ZMGLOBAL_PERKS_DRANK",
		icon = "t7_icons_leaderboards_zm_perkcolas",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_KILLS_AT = {
		title = "MENU_LB_ZMGLOBAL_KILLS",
		icon = "t7_icons_leaderboards_zm_kills",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_BULLETS_FIRED_AT = {
		title = "MENU_LB_ZMGLOBAL_SHOTS_FIRED",
		icon = "t7_icons_leaderboards_zm_shotsfired",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_BULLETS_HIT_AT = {
		title = "MENU_LB_ZMGLOBAL_SHOTS_HIT",
		icon = "t7_icons_leaderboards_zm_shotsontarget",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_HEADSHOTS_AT = {
		title = "MENU_LB_ZMGLOBAL_HEADSHOTS",
		icon = "t7_icons_leaderboards_zm_headshots",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_GRENADE_KILLS_AT = {
		title = "MENU_LB_ZMGLOBAL_EXPLOSIVE_KILLS",
		icon = "t7_icons_leaderboards_zm_explosivekills",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_REVIVES_AT = {
		title = "MENU_LB_ZMGLOBAL_REVIVES",
		icon = "t7_icons_leaderboards_zm_revives",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_DISTANCE_TRAVELED_AT = {
		title = "MENU_LB_ZMGLOBAL_DISTANCE_TRAVELED",
		icon = "t7_icons_leaderboards_zm_distancetraveled",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_DOORS_PURCHASED_AT = {
		title = "MENU_LB_ZMGLOBAL_DOORS_OPENED",
		icon = "t7_icons_leaderboards_zm_doorsopened",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_GB_PERKS_DRANK_AT = {
		title = "MENU_LB_ZMGLOBAL_PERKS_DRANK",
		icon = "t7_icons_leaderboards_zm_perkcolas",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_MAP_FACTORY = {
		title = "ZMUI_FACTORY",
		icon = "t7_menu_zombies_icon_giant",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_MAP_ZOD = {
		title = "ZMUI_ZOD",
		icon = "t7_menu_zombies_icon_shadowsofevil",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_CP_DOA_BO3_ROUND = {
		title = "MENU_LB_DOA_ROUND",
		icon = "t7_icons_leaderboards_doa_round",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_CP_DOA_BO3_SCORE = {
		title = "MENU_LB_DOA_SCORE",
		icon = "t7_icons_leaderboards_doa_score",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_CP_DOA_BO3_SILVERBACKS = {
		title = "MENU_LB_DOA_SILVERBACK_KILLS",
		icon = "t7_icons_leaderboards_doa_silverback",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_CP_DOA_BO3_GEMS = {
		title = "MENU_LB_DOA_GEMS",
		icon = "t7_icons_leaderboards_doa_gems",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_CP_DOA_BO3_SKULLS = {
		title = "MENU_LB_DOA_SKULLS",
		icon = "t7_icons_leaderboards_doa_skulls",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
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
	"LB_MP_GM_GUN"
}
CoD.LeaderboardUtility.leaderboardListHardcore = {
	"LB_MP_GB_SCORE",
	"LB_MP_GM_TDM",
	"LB_MP_GM_DM",
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
	"LB_ZM_MAP_ZOD"
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
function LeaderboardGameModeButtonPrepare( f1_arg0, f1_arg1 )
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
	CoD.LeaderboardUtility.leaderboardGameModeData = f1_local0
	return f1_local0
end

DataSources.LeaderboardGameModeButton = DataSourceHelpers.ListSetup( "LeaderboardGameModeButton", LeaderboardGameModeButtonPrepare, true )
DataSources.LeaderboardGameModeTabs = DataSourceHelpers.ListSetup( "LeaderboardGameModeTabs", function ( f2_arg0 )
	local f2_local0 = {}
	local f2_local1 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" )
	local f2_local2 = CoD.LeaderboardUtility.leaderboardGameModeData[1].models.lbDef
	if f2_local1 ~= nil then
		f2_local2 = Engine.GetModelValue( f2_local1 )
	end
	for f2_local6, f2_local7 in pairs( CoD.LeaderboardUtility.leaderboardGameModeData ) do
		table.insert( f2_local0, {
			models = {
				tabName = f2_local7.models.title,
				tabWidget = "CoD.Leaderboard_GameModeFrame",
				tabIcon = "",
				lbDef = f2_local7.models.lbDef
			},
			properties = {
				selectIndex = false
			}
		} )
	end
	for f2_local3 = 1, #f2_local0, 1 do
		if f2_local0[f2_local3].properties ~= nil then
			if f2_local0[f2_local3].models.lbDef == f2_local2 then
				f2_local0[f2_local3].properties.selectIndex = true
			else
				f2_local0[f2_local3].properties.selectIndex = false
			end
		end
	end
	return f2_local0
end, true )
local f0_local0 = function ( f3_arg0 )
	local f3_local0 = Engine.GetModelValue
	local f3_local1 = Engine.GetModel
	local f3_local2 = Engine.GetGlobalModel()
	CoD.perController[f3_local0( f3_local1( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )].leaderboardZMMapsNumPlayersFilterTemp = f3_arg0
end

local f0_local1 = function ( f4_arg0 )
	local f4_local0 = Engine.GetModelValue
	local f4_local1 = Engine.GetModel
	local f4_local2 = Engine.GetGlobalModel()
	CoD.perController[f4_local0( f4_local1( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )].leaderboardPlayerFilterTemp = f4_arg0
end

local f0_local2 = function ( f5_arg0 )
	local f5_local0 = Engine.GetModelValue
	local f5_local1 = Engine.GetModel
	local f5_local2 = Engine.GetGlobalModel()
	CoD.perController[f5_local0( f5_local1( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )].leaderboardDurationFilterTemp = f5_arg0
end

CoD.LeaderboardUtility.GetZMMapsNumPlayersFilterString = function ( f6_arg0 )
	if f6_arg0 == 1 then
		return Engine.Localize( "MENU_SOLO" )
	else
		return Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", f6_arg0 )
	end
end

CoD.LeaderboardUtility.GetPlayerFilterString = function ( f7_arg0 )
	if f7_arg0 == Enum.LbFilter.LB_FILTER_FRIENDS then
		return Engine.Localize( "MENU_LB_PFILTER_FRIENDS" )
	elseif f7_arg0 == Enum.LbFilter.LB_FILTER_NONE then
		return Engine.Localize( "MENU_LB_PFILTER_ALL" )
	else
		
	end
end

CoD.LeaderboardUtility.GetDurationFilterString = function ( f8_arg0 )
	if f8_arg0 == Enum.LbTrackType.LB_TRK_ALLTIME then
		return Engine.Localize( "MENU_LB_DFILTER_ALL_TIME" )
	elseif f8_arg0 == Enum.LbTrackType.LB_TRK_MONTHLY then
		return Engine.Localize( "MENU_LB_DFILTER_MONTHLY" )
	elseif f8_arg0 == Enum.LbTrackType.LB_TRK_WEEKLY then
		return Engine.Localize( "MENU_LB_DFILTER_WEEKLY" )
	else
		
	end
end

local f0_local3 = function ( f9_arg0 )
	local f9_local0 = {
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
	local f9_local1 = CoD.perController[f9_arg0].leaderboardZMMapsNumPlayersFilter
	if not f9_local1 then
		f9_local1 = CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS
	end
	return {
		models = {
			displayText = "MENU_LB_FILTER_NUMBER_OF_PLAYERS",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f9_arg0, "LeaderboardFilterOptions_ZMMapsNumPlayersFilter", f9_local0, nil, f0_local0, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( f9_arg0, f9_local0, f9_local1 )
		},
		properties = {}
	}
end

local f0_local4 = function ( f10_arg0 )
	local f10_local0 = {}
	table.insert( f10_local0, {
		name = Engine.Localize( "MENU_LB_PFILTER_FRIENDS" ),
		value = Enum.LbFilter.LB_FILTER_FRIENDS
	} )
	if IsMemberOfAnyGroup( f10_arg0 ) then
		table.insert( f10_local0, {
			name = Engine.Localize( "MENU_LB_PFILTER_GROUPS" ),
			value = Enum.LbFilter.LB_FILTER_GROUP_MEMBERS
		} )
	end
	table.insert( f10_local0, {
		name = Engine.Localize( "MENU_LB_PFILTER_ALL" ),
		value = Enum.LbFilter.LB_FILTER_NONE
	} )
	local f10_local1 = CoD.perController[f10_arg0].leaderboardPlayerFilter
	if not f10_local1 then
		f10_local1 = Enum.LbFilter.LB_FILTER_FRIENDS
	end
	return {
		models = {
			displayText = "MENU_LB_FILTER_PLAYERS",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f10_arg0, "LeaderboardFilterOptions_PlayerFilter", f10_local0, nil, f0_local1, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( f10_arg0, f10_local0, f10_local1 )
		},
		properties = {}
	}
end

local f0_local5 = function ( f11_arg0 )
	local f11_local0 = {
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
		}
	}
	local f11_local1 = CoD.perController[f11_arg0].leaderboardDurationFilter
	if not f11_local1 then
		f11_local1 = Enum.LbTrackType.LB_TRK_ALLTIME
	end
	local f11_local2 = CoD.LeaderboardUtility.leaderboardInfo[Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )]
	local f11_local3 = {}
	for f11_local10, f11_local11 in ipairs( f11_local2.trackTypes ) do
		for f11_local7, f11_local8 in ipairs( f11_local0 ) do
			if f11_local8.value == f11_local11 then
				table.insert( f11_local3, f11_local0[f11_local11] )
			end
		end
	end
	return {
		models = {
			displayText = "MENU_LB_FILTER_DURATION",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f11_arg0, "LeaderboardFilterOptions_DurationFilter", f11_local3, nil, f0_local2, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( f11_arg0, f11_local3, f11_local1 )
		},
		properties = {}
	}
end

DataSources.LeaderboardFilterOptions = DataSourceHelpers.ListSetup( "LeaderboardFilterOptions", function ( f12_arg0 )
	local f12_local0 = {}
	local f12_local1 = CoD.LeaderboardUtility.leaderboardInfo[Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )]
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ), f12_arg0 )
	if IsZMMapsLeaderboard( f12_arg0 ) then
		table.insert( f12_local0, f0_local3( f12_arg0 ) )
	end
	table.insert( f12_local0, f0_local4( f12_arg0 ) )
	if #f12_local1.trackTypes > 1 then
		table.insert( f12_local0, f0_local5( f12_arg0 ) )
	end
	return f12_local0
end, true )
