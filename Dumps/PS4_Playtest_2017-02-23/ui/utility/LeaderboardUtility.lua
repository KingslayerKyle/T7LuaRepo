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
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC0ZM
	},
	LB_ZM_MAP_ZOD = {
		title = "ZMUI_ZOD",
		icon = "t7_menu_zombies_icon_shadowsofevil",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		}
	},
	LB_ZM_MAP_CASTLE = {
		title = "ZMUI_CASTLE",
		icon = "t7_menu_zombies_icon_castle",
		trackTypes = {
			Enum.LbTrackType.LB_TRK_ALLTIME
		},
		dlcBit = CoD.DLCBits.CONTENT_DLC1
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
	"LB_MP_GM_CONF",
	"LB_MP_GM_DOM",
	"LB_MP_GM_SD",
	"LB_MP_GM_CTF"
}
CoD.LeaderboardUtility.leaderboardListArena = {
	"LB_MP_GB_SCORE_ARENA",
	"LB_MP_GM_CONF_ARENA",
	"LB_MP_GM_DOM_ARENA",
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
	"LB_ZM_MAP_ZOD",
	"LB_ZM_MAP_CASTLE"
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
CoD.LeaderboardUtility.LeaderboardGameModeButtonPrepare = function ( controller, defaultLbdef )
	local gameModesList = {}
	local categoryNameModel = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
	if not categoryNameModel then
		return gameModesList
	end
	local categoryName = Engine.GetModelValue( categoryNameModel )
	if not categoryName then
		return gameModesList
	end
	local leaderboardTab = CoD.LeaderboardUtility.leaderboardTab[categoryName]
	local leaderboardList = leaderboardTab.leaderboardList
	local leaderboardSuffix = leaderboardTab.leaderboardSuffix
	for index, leaderboard in pairs( leaderboardList ) do
		local leaderboardInfo = CoD.LeaderboardUtility.leaderboardInfo[leaderboard]
		if not CoD.BaseUtility.IsHiddenDLC( leaderboardInfo.dlcBit ) then
			table.insert( gameModesList, {
				models = {
					title = LocalizeToUpperString( leaderboardInfo.title ),
					icon = leaderboardInfo.icon,
					lbDef = leaderboard .. leaderboardSuffix
				},
				properties = {
					selectIndex = index == 1
				}
			} )
		end
	end
	CoD.LeaderboardUtility.leaderboardGameModeData = gameModesList
	return gameModesList
end

DataSources.LeaderboardGameModeButton = DataSourceHelpers.ListSetup( "LeaderboardGameModeButton", CoD.LeaderboardUtility.LeaderboardGameModeButtonPrepare, true )
CoD.LeaderboardUtility.LeaderboardGameModeTabsPrepare = function ( controller )
	local tabList = {}
	if IsLobbyLeaderboard( controller ) then
		local leaderboardDefModel = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" )
		if leaderboardDefModel then
			local leaderboardDef = Engine.GetModelValue( leaderboardDefModel )
			table.insert( tabList, {
				models = {
					tabName = "",
					tabWidget = "CoD.Leaderboard_GameModeFrame",
					tabIcon = "",
					lbDef = leaderboardDef
				},
				properties = {
					selectIndex = true
				}
			} )
		end
		return tabList
	end
	local leaderboardDefModel = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" )
	local lastSelected = CoD.LeaderboardUtility.leaderboardGameModeData[1].models.lbDef
	if leaderboardDefModel ~= nil then
		lastSelected = Engine.GetModelValue( leaderboardDefModel )
	end
	for _, gameMode in pairs( CoD.LeaderboardUtility.leaderboardGameModeData ) do
		table.insert( tabList, {
			models = {
				tabName = gameMode.models.title,
				tabWidget = "CoD.Leaderboard_GameModeFrame",
				tabIcon = "",
				lbDef = gameMode.models.lbDef
			},
			properties = {
				selectIndex = gameMode.models.lbDef == lastSelected
			}
		} )
	end
	return tabList
end

DataSources.LeaderboardGameModeTabs = DataSourceHelpers.ListSetup( "LeaderboardGameModeTabs", CoD.LeaderboardUtility.LeaderboardGameModeTabsPrepare, true )
CoD.LeaderboardUtility.SetZMMapsNumPlayersFilter = function ( value )
	local controller = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )
	CoD.perController[controller].leaderboardZMMapsNumPlayersFilterTemp = value
end

CoD.LeaderboardUtility.SetDOANumPlayersFilter = function ( value )
	local controller = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )
	CoD.perController[controller].leaderboardDOANumPlayersFilterTemp = value
end

CoD.LeaderboardUtility.SetPlayerFilter = function ( value )
	local controller = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )
	CoD.perController[controller].leaderboardPlayerFilterTemp = value
end

CoD.LeaderboardUtility.SetDurationFilter = function ( value )
	local controller = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ) )
	CoD.perController[controller].leaderboardDurationFilterTemp = value
end

CoD.LeaderboardUtility.GetZMMapsNumPlayersFilterString = function ( filterValue )
	if filterValue == 1 then
		return Engine.Localize( "MENU_SOLO" )
	else
		return Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", filterValue )
	end
end

CoD.LeaderboardUtility.GetDOANumPlayersFilterString = function ( filterValue )
	if filterValue == 0 then
		return Engine.Localize( "MENU_ALL" )
	elseif filterValue == 1 then
		return Engine.Localize( "MENU_SOLO" )
	else
		return Engine.Localize( "MPUI_SHOUTCASTER_NUMBER_PLAYERS", filterValue )
	end
end

CoD.LeaderboardUtility.GetPlayerFilterString = function ( filterValue )
	if filterValue == Enum.LbFilter.LB_FILTER_FRIENDS then
		return Engine.Localize( "MENU_LB_PFILTER_FRIENDS" )
	elseif filterValue == Enum.LbFilter.LB_FILTER_LOBBY_MEMBERS then
		return Engine.Localize( "MENU_LB_PFILTER_LOBBY" )
	elseif filterValue == Enum.LbFilter.LB_FILTER_NONE then
		return Engine.Localize( "MENU_LB_PFILTER_ALL" )
	else
		
	end
end

CoD.LeaderboardUtility.GetDurationFilterString = function ( filterValue )
	if filterValue == Enum.LbTrackType.LB_TRK_ALLTIME then
		return Engine.Localize( "MENU_LB_DFILTER_ALL_TIME" )
	elseif filterValue == Enum.LbTrackType.LB_TRK_MONTHLY then
		return Engine.Localize( "MENU_LB_DFILTER_MONTHLY" )
	elseif filterValue == Enum.LbTrackType.LB_TRK_WEEKLY then
		return Engine.Localize( "MENU_LB_DFILTER_WEEKLY" )
	else
		
	end
end

CoD.LeaderboardUtility.CreateModels_ZMMapsNumPlayersFilter = function ( controller )
	local options = {
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
	local f11_local0 = CoD.perController[controller].leaderboardZMMapsNumPlayersFilter
	if not f11_local0 then
		local currentValue = CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS
	end
	local listInfo = {
		models = {
			displayText = "MENU_LB_FILTER_NUMBER_OF_PLAYERS",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "LeaderboardFilterOptions_ZMMapsNumPlayersFilter", options, nil, CoD.LeaderboardUtility.SetZMMapsNumPlayersFilter, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( controller, options, f11_local0 )
		},
		properties = {}
	}
	return listInfo
end

CoD.LeaderboardUtility.CreateModels_DOANumPlayersFilter = function ( controller )
	local options = {
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
	local f12_local0 = CoD.perController[controller].leaderboardDOANumPlayersFilter
	if not f12_local0 then
		local currentValue = CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS
	end
	local listInfo = {
		models = {
			displayText = "MENU_LB_FILTER_NUMBER_OF_PLAYERS",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "LeaderboardFilterOptions_DOANumPlayersFilter", options, nil, CoD.LeaderboardUtility.SetDOANumPlayersFilter, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( controller, options, f12_local0 )
		},
		properties = {}
	}
	return listInfo
end

CoD.LeaderboardUtility.CreateModels_PlayerFilter = function ( controller )
	local options = {}
	table.insert( options, {
		name = Engine.Localize( "MENU_LB_PFILTER_FRIENDS" ),
		value = Enum.LbFilter.LB_FILTER_FRIENDS
	} )
	if IsMemberOfAnyGroup( controller ) then
		table.insert( options, {
			name = Engine.Localize( "MENU_LB_PFILTER_GROUPS" ),
			value = Enum.LbFilter.LB_FILTER_GROUP_MEMBERS
		} )
	end
	if IsDOALeaderboard( controller ) then
		table.insert( options, {
			name = Engine.Localize( "MENU_LB_PFILTER_LOBBY" ),
			value = Enum.LbFilter.LB_FILTER_LOBBY_MEMBERS
		} )
	end
	table.insert( options, {
		name = Engine.Localize( "MENU_LB_PFILTER_ALL" ),
		value = Enum.LbFilter.LB_FILTER_NONE
	} )
	local f13_local0 = CoD.perController[controller].leaderboardPlayerFilter
	if not f13_local0 then
		local currentValue = Enum.LbFilter.LB_FILTER_FRIENDS
	end
	local listInfo = {
		models = {
			displayText = "MENU_LB_FILTER_PLAYERS",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "LeaderboardFilterOptions_PlayerFilter", options, nil, CoD.LeaderboardUtility.SetPlayerFilter, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( controller, options, f13_local0 )
		},
		properties = {}
	}
	return listInfo
end

CoD.LeaderboardUtility.CreateModels_DurationFilter = function ( controller )
	local options = {
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
	local f14_local0 = CoD.perController[controller].leaderboardDurationFilter
	if not f14_local0 then
		local currentValue = Enum.LbTrackType.LB_TRK_ALLTIME
	end
	local leaderboardDef = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )
	local leaderboardInfo = CoD.LeaderboardUtility.leaderboardInfo[leaderboardDef]
	local availableOptions = {}
	for i, validTrackType in ipairs( leaderboardInfo.trackTypes ) do
		for _, optionTrack in ipairs( options ) do
			if optionTrack.value == validTrackType then
				table.insert( availableOptions, options[i] )
			end
		end
	end
	local listInfo = {
		models = {
			displayText = "MENU_LB_FILTER_DURATION",
			hintText = "",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "LeaderboardFilterOptions_DurationFilter", availableOptions, nil, CoD.LeaderboardUtility.SetDurationFilter, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( controller, availableOptions, f14_local0 )
		},
		properties = {}
	}
	return listInfo
end

CoD.LeaderboardUtility.LeaderboardFilterOptionsPrepare = function ( controller )
	local optionsList = {}
	local leaderboardDef = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )
	local leaderboardInfo = CoD.LeaderboardUtility.leaderboardInfo[leaderboardDef]
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "LeaderboardFilter_LastUsedController" ), controller )
	if IsZMMapsLeaderboard( controller ) then
		table.insert( optionsList, CoD.LeaderboardUtility.CreateModels_ZMMapsNumPlayersFilter( controller ) )
	end
	if IsDOALeaderboard( controller ) and (LUI.startswith( leaderboardDef, "LB_CP_DOA_BO3_SCORE" ) or LUI.startswith( leaderboardDef, "LB_CP_DOA_BO3_ROUND" )) then
		table.insert( optionsList, CoD.LeaderboardUtility.CreateModels_DOANumPlayersFilter( controller ) )
	end
	if not IsLobbyLeaderboard( controller ) then
		table.insert( optionsList, CoD.LeaderboardUtility.CreateModels_PlayerFilter( controller ) )
	end
	if #leaderboardInfo.trackTypes > 1 then
		table.insert( optionsList, CoD.LeaderboardUtility.CreateModels_DurationFilter( controller ) )
	end
	return optionsList
end

DataSources.LeaderboardFilterOptions = DataSourceHelpers.ListSetup( "LeaderboardFilterOptions", CoD.LeaderboardUtility.LeaderboardFilterOptionsPrepare, true )
