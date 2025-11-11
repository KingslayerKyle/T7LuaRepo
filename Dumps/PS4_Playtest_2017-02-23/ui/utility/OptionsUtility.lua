require( "lua.Shared.LuaEnum" )

CoD.OptionsUtility = {}
CoD.OptionsUtility.SENSITIVITY_1 = 0.4
CoD.OptionsUtility.SENSITIVITY_2 = 0.6
CoD.OptionsUtility.SENSITIVITY_3 = 0.8
CoD.OptionsUtility.SENSITIVITY_4 = 1
CoD.OptionsUtility.SENSITIVITY_5 = 1.2
CoD.OptionsUtility.SENSITIVITY_6 = 1.4
CoD.OptionsUtility.SENSITIVITY_7 = 1.6
CoD.OptionsUtility.SENSITIVITY_8 = 1.8
CoD.OptionsUtility.SENSITIVITY_9 = 2
CoD.OptionsUtility.SENSITIVITY_10 = 2.25
CoD.OptionsUtility.SENSITIVITY_11 = 2.5
CoD.OptionsUtility.SENSITIVITY_12 = 3
CoD.OptionsUtility.SENSITIVITY_13 = 3.5
CoD.OptionsUtility.SENSITIVITY_14 = 4
local IsCumulativeRoundScoresOn = function ()
	return Engine.GetGametypeSetting( "cumulativeRoundScores" ) == 1
end

local IsCumulativeRoundScoresOff = function ()
	return Engine.GetGametypeSetting( "cumulativeRoundScores" ) == 0
end

local LoadoutKillstreaksEnabledByDefault = function ()
	return Engine.GetGametypeSetting( "loadoutKillstreaksEnabled", true ) == 1
end

local AreCustomClassesEnabled = function ()
	return Engine.GetGametypeSetting( "disableCAC" ) == 0
end

CoD.OptionsUtility.EnabledDisabledLabels = {
	"MENU_ENABLED",
	"MENU_DISABLED"
}
CoD.OptionsUtility.EnabledDisabledValues = {
	1,
	0
}
CoD.OptionsUtility.GameSettings = {
	allowAnnouncer = {
		name = "MENU_ANNOUNCER",
		hintText = {
			"MENU_ANNOUNCER_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	allowBattleChatter = {
		name = "MENU_BATTLECHATTER",
		hintText = {
			"MENU_BATTLECHATTER_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	allowhitmarkers = {
		name = "MENU_HIT_MARKERS",
		hintText = {
			"MENU_HIT_MARKERS_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_OFF_FOR_TACTICALS",
			"MENU_ENABLED"
		},
		values = {
			0,
			1,
			2
		}
	},
	allowInGameTeamChange = {
		name = "MENU_INGAME_TEAM_CHANGE",
		hintText = {
			"MENU_INGAME_TEAM_CHANGE_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	allowKillcam = {
		name = "MENU_ALLOW_KILLCAM",
		hintText = {
			"MENU_ALLOW_KILLCAM_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	allowMapScripting = {
		name = "MENU_ALLOW_MP_MAP_SCRIPTING",
		hintText = {
			"MENU_ALLOW_MP_MAP_SCRIPTING_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	allowProne = {
		name = "MENU_PRONE",
		hintText = {
			"MENU_PRONE_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	allowSpectating = {
		name = "MENU_ALLOW_SHOUTCASTING",
		hintText = {
			"MENU_ALLOW_SHOUTCASTING_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	autoDestroyTime = {
		name = "MENU_AUTO_DESTROY_TIME",
		hintText = {
			"MENU_AUTO_DESTROY_TIME_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_1_MINUTE",
			"MENU_1_5_MINUTES",
			"MENU_2_MINUTES",
			"MENU_2_5_MINUTES",
			"MENU_3_MINUTES",
			"MENU_5_MINUTES"
		},
		values = {
			0,
			30,
			45,
			60,
			90,
			120,
			150,
			180,
			300
		}
	},
	ballCount = {
		setting = "ballCount",
		name = "MENU_BALL_COUNT",
		hintText = {
			"MENU_BALL_COUNT_HINT"
		},
		labels = {
			"MENU_1_BALL",
			"MENU_X_BALLS"
		},
		values = {
			1,
			2,
			3,
			4,
			5
		}
	},
	bootTime = {
		setting = "bootTime",
		name = "MENU_BOOT_TIME",
		hintText = {
			"MENU_BOOT_TIME_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			5,
			10,
			15,
			20,
			30
		}
	},
	teamAssignment = {
		name = "MENU_TEAM_ASSIGNMENT",
		hintText = {
			"MENU_TEAM_ASSIGNMENT_CLIENT_HINT",
			"MENU_TEAM_ASSIGNMENT_HOST_HINT",
			"MENU_TEAM_ASSIGNMENT_AUTO_HINT"
		},
		labels = {
			"MENU_TEAM_ASSIGNMENT_CLIENT",
			"MENU_TEAM_ASSIGNMENT_HOST",
			"MENU_TEAM_ASSIGNMENT_AUTO"
		},
		values = {
			LuaEnum.TEAM_ASSIGNMENT.CLIENT,
			LuaEnum.TEAM_ASSIGNMENT.HOST,
			LuaEnum.TEAM_ASSIGNMENT.AUTO
		}
	},
	bombTimer = {
		name = "MENU_BOMB_TIMER",
		hintText = {
			"MENU_BOMB_TIMER_HINT"
		},
		labels = {
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_1_MINUTE",
			"MENU_1_5_MINUTES",
			"MENU_2_MINUTES",
			"MENU_2_5_MINUTES"
		},
		values = {
			2.5,
			5,
			7.5,
			10,
			15,
			20,
			30,
			45,
			60,
			90,
			120,
			150
		}
	},
	carrierArmor = {
		setting = "carrierArmor",
		name = "MENU_CARRIER_ARMOR",
		hintText = {
			"MENU_CARRIER_ARMOR_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_NORMAL",
			"MENU_DOUBLE",
			"MENU_HALF"
		},
		values = {
			0,
			100,
			200,
			50
		}
	},
	carrierMoveSpeed = {
		setting = "carrierMoveSpeed",
		name = "MENU_CARRIER_MOVE_SPEED",
		hintText = {
			"MENU_CARRIER_MOVE_SPEED_HINT"
		},
		labels = {
			"MENU_SLOW",
			"MENU_NORMAL",
			"MENU_FAST"
		},
		values = {
			1,
			2,
			3
		}
	},
	carryScore = {
		setting = "carryScore",
		name = "MENU_CARRY_SCORE",
		hintText = {
			"MENU_CARRY_SCORE_HINT"
		},
		labels = {
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		}
	},
	destroyTime = {
		name = "MENU_DESTROY_TIME",
		hintText = {
			"MENU_DESTROY_TIME_HINT"
		},
		labels = {
			"MENU_1_SECOND",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_1_MINUTE"
		},
		values = {
			1,
			2.5,
			5,
			7.5,
			10,
			15,
			20,
			30,
			60
		}
	},
	captureTime = {
		name = "MENU_CAPTURE_TIME",
		hintText = {
			"MENU_CAPTURE_TIME_HINT"
		},
		labels = {
			"MENU_1_SECOND",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_1_MINUTE",
			"MENU_1.5_MINUTES",
			"MENU_2_MINUTES"
		},
		values = {
			1,
			2.5,
			5,
			7.5,
			10,
			15,
			20,
			30,
			45,
			60,
			90,
			120
		}
	},
	captureTime_koth = {
		setting = "captureTime",
		name = "MENU_CAPTURE_TIME",
		hintText = {
			"MENU_CAPTURE_TIME_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10
		}
	},
	captureTime_ctf = {
		setting = "captureTime",
		name = "MENU_PICKUP_TIME",
		hintText = {
			"MENU_PICKUP_TIME_HINT"
		},
		labels = {
			"MENU_INSTANT",
			"MENU_X_SECONDS",
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			0.5,
			1,
			1.5,
			2,
			2.5,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10
		}
	},
	defuseTime = {
		name = "MENU_DEFUSE_TIME",
		hintText = {
			"MENU_DEFUSE_TIME_HINT"
		},
		labels = {
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			1,
			2.5,
			3,
			3.5,
			4,
			4.5,
			5,
			5.5,
			6,
			6.5,
			7,
			7.5,
			8,
			8.5,
			9,
			9.5,
			10
		}
	},
	disableCAC = {
		name = "MENU_DISABLE_CAC",
		hintText = {
			"MENU_DISABLE_CAC_HINT"
		},
		labels = {
			"MENU_ENABLED",
			"MENU_DISABLED"
		},
		values = {
			0,
			1
		}
	},
	disableThirdPersonSpectating = {
		name = "MENU_DISABLE_THIRD_PERSON_SPECTATING",
		hintText = {
			"MENU_DISABLE_THIRD_PERSON_SPECTATING_HINT"
		},
		labels = {
			"MENU_ENABLED",
			"MENU_DISABLED"
		},
		values = {
			0,
			1
		}
	},
	draftEnabled = {
		name = "MENU_DRAFT_ENABLED",
		hintText = {
			"MENU_DRAFT_ENABLED_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	draftRequiredClients = {
		name = "MENU_DRAFT_REQUIRED_CLIENTS",
		hintText = {
			"MENU_DRAFT_REQUIRED_CLIENTS_HINT"
		},
		labels = {
			"MENU_NONE",
			"1",
			"2",
			"3",
			"4",
			"5"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5
		}
	},
	draftTime = {
		name = "MENU_DRAFT_TIME",
		hintText = {
			"MENU_DRAFT_TIME_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			15,
			30,
			45,
			60,
			90
		}
	},
	draftEveryRound = {
		name = "MENU_DRAFT_EVERY_ROUND",
		hintText = {
			"MENU_DRAFT_EVERY_ROUND_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	droppedTagRespawn = {
		name = "MENU_DOG_TAGS",
		hintText = {
			"MENU_DOG_TAGS_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	enemyCarrierVisible = {
		name = "MENU_ENEMY_CARRIER",
		hintText = {
			"MENU_ENEMY_CARRIER_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_ENABLED",
			"MENU_DELAYED"
		},
		values = {
			0,
			1,
			2
		}
	},
	escalationEnabled = {
		name = "MENU_ESCALATION",
		hintText = {
			"MENU_ESCALATION_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	extraTime = {
		name = "MENU_EXTRA_TIME",
		hintText = {
			"MENU_EXTRA_TIME_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_30_SECONDS",
			"MENU_1_MINUTE",
			"MENU_X_MINUTES"
		},
		values = {
			0,
			0.5,
			1,
			1.5,
			2,
			2.5,
			3,
			3.5,
			4,
			4.5,
			5
		}
	},
	flagCaptureCondition = {
		name = "MENU_FLAG_CAPTURE_CONDITION",
		hintText = {
			"MENU_FLAG_CAPTURE_CONDITION_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_FLAG_AT_BASE"
		},
		values = {
			0,
			1
		}
	},
	flagCanBeNeutralized = {
		setting = "flagCanBeNeutralized",
		name = "MENU_FLAG_CAN_BE_NEUTRALIZED",
		hintText = {
			"MENU_FLAG_CAN_BE_NEUTRALIZED_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	flagRespawnTime = {
		name = "MENU_FLAG_RESPAWN_TIME",
		hintText = {
			"MENU_FLAG_RESPAWN_TIME_HINT"
		},
		labels = {
			"MENU_1_SECOND",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_1_MINUTE"
		},
		values = {
			1,
			5,
			10,
			15,
			20,
			30,
			40,
			50,
			60
		}
	},
	forceRadar = {
		name = "MENU_RADAR_ALWAYS_ON",
		hintText = {
			"MENU_RADAR_ALWAYS_ON_HINT"
		},
		labels = {
			"MENU_NORMAL",
			"MENU_SWEEPING",
			"MENU_CONSTANT"
		},
		values = {
			0,
			1,
			2
		}
	},
	forwardSpawnEnabled = {
		settings = "forwardSpawnEnabled",
		name = "MENU_FORWARD_SPAWN",
		hintText = {
			"MENU_FORWARD_SPAWN_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	forwardSpawnIsNeutral = {
		settings = "forwardSpawnIsNeutral",
		name = "MENU_NEUTRAL_FORWARD_SPAWN",
		hintText = {
			"MENU_NEUTRAL_FORWARD_SPAWN_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	forwardSpawnProximityActivate = {
		setting = "forwardSpawnProximityActivate",
		name = "MENU_FORWARD_SPAWN_PROXIMITY_ACTIVATION",
		hintText = {
			"MENU_FORWARD_SPAWN_PROXIMITY_ACTIVATION_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	friendlyfiretype = {
		name = "MENU_FRIENDLYFIRE",
		hintText = {
			"MENU_FRIENDLYFIRE_HINT",
			"MENU_FRIENDLYFIRE_HINT",
			"MENU_FRIENDLYFIRE_REFLECT_HINT",
			"MENU_FRIENDLYFIRE_SHARED_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_ENABLED",
			"MPUI_REFLECT",
			"MENU_SHARED"
		},
		values = {
			0,
			1,
			2,
			3
		},
		shouldShow = CoDShared.IsGametypeTeamBased
	},
	gunSelection = {
		name = "MENU_GUNLIST",
		hintText = {
			"MENU_GUNLIST_NORMAL_HINT",
			"MENU_GUNLIST_CQB_HINT",
			"MENU_GUNLIST_MARKSMAN_HINT",
			"MENU_GUNLIST_RANDOM_HINT"
		},
		labels = {
			"MENU_GUNLIST_NORMAL",
			"MENU_GUNLIST_CQB",
			"MENU_GUNLIST_MARKSMAN",
			"MENU_GUNLIST_RANDOM"
		},
		values = {
			0,
			1,
			2,
			3
		}
	},
	gunSelection_sas = {
		setting = "gunSelection",
		name = "MENU_SETBACK_WEAPON",
		hintText = {
			"MENU_SETBACK_WEAPON_HINT"
		},
		labels = {
			"MENU_NONE",
			"WEAPON_HATCHET",
			"WEAPON_CROSSBOW",
			"WEAPON_KNIFE_BALLISTIC"
		},
		values = {
			0,
			1,
			2,
			3
		}
	},
	hardcoreMode = {
		name = "MENU_RULES_HARDCORE",
		hintText = {
			"MENU_RULES_HARDCORE_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	idleFlagResetTime = {
		name = "MENU_FLAG_RETURN_TIME",
		hintText = {
			"MENU_FLAG_RETURN_TIME_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_1_MINUTE"
		},
		values = {
			0,
			5,
			10,
			15,
			20,
			30,
			40,
			50,
			60
		}
	},
	incrementalSpawnDelay = {
		name = "MENU_INCREMENTAL_SPAWN_DELAY",
		hintText = {
			"MENU_INCREMENTAL_SPAWN_DELAY_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_1_SECOND",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_1_MINUTE"
		},
		values = {
			0,
			1,
			2,
			2.5,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			15,
			30,
			40,
			50,
			60
		}
	},
	idleFlagResetTime_ball = {
		setting = "idleFlagResetTime",
		name = "MENU_BALL_RETURN_TIME",
		hintText = {
			"MENU_BALL_RETURN_TIME_HINT"
		},
		labels = {
			"MENU_INSTANT",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_1_MINUTE"
		},
		values = {
			0,
			5,
			10,
			15,
			30,
			45,
			60
		}
	},
	killEventScoreMultiplier = {
		name = "MENU_SCORE_MULTIPLIER",
		hintText = {
			"MENU_SCORE_MULTIPLIER_HINT"
		},
		values = {
			1,
			1.5,
			2,
			2.5,
			3,
			3.5,
			4,
			4.5,
			5
		}
	},
	loadoutKillstreaksEnabled = {
		name = "MENU_SCORESTREAKS",
		hintText = {
			"MENU_SCORESTREAKS_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues,
		shouldShow = LoadoutKillstreaksEnabledByDefault
	},
	killstreaksGiveGameScore = {
		name = "MENU_SCORESTREAK_TEAM_SCORING",
		hintText = {
			"MENU_SCORESTREAK_TEAM_SCORING_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	maxAllocation = {
		name = "MENU_MAX_ALLOCATION",
		hintText = {
			"MENU_MAX_ALLOCATION_HINT"
		},
		values = {
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
			16,
			17
		},
		shouldShow = AreCustomClassesEnabled
	},
	multiBomb = {
		name = "MENU_MULTI_BOMB",
		hintText = {
			"MENU_MULTI_BOMB_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	neutralZone = {
		name = "MENU_NEUTRAL_ZONE",
		hintText = {
			"MENU_NEUTRAL_ZONE_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	decayCapturedZones = {
		name = "MENU_ZONE_DECAY",
		hintText = {
			"MENU_ZONE_DECAY_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	capDecay = {
		name = "MENU_CAP_DECAY",
		hintText = {
			"MENU_CAP_DECAY_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	zoneCount = {
		name = "MENU_MULTI_ZONE",
		hintText = {
			"MENU_MULTI_ZONE_HINT"
		},
		labels = {
			"MENU_1_ZONE",
			"MENU_X_ZONES"
		},
		values = {
			1,
			2,
			3,
			4,
			5
		}
	},
	objectiveSpawnTime = {
		name = "MENU_OBJECTIVE_SPAWN_TIME",
		hintText = {
			"MENU_OBJECTIVE_SPAWN_TIME_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_X_SECONDS",
			"MENU_1_MINUTE"
		},
		values = {
			0,
			5,
			10,
			15,
			30,
			45,
			60
		}
	},
	onlyHeadshots = {
		name = "MENU_HEADSHOTSONLY",
		hintText = {
			"MENU_HEADSHOTSONLY_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	OvertimetimeLimit = {
		name = "MENU_OVERTIME_TIME_LIMIT1",
		hintText = {
			"MENU_OVERTIME_TIME_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_MINUTE",
			"MENU_X_MINUTES"
		},
		values = {
			0,
			1,
			1.5,
			2,
			2.5,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
			20,
			30
		}
	},
	plantTime = {
		name = "MENU_PLANT_TIME",
		hintText = {
			"MENU_PLANT_TIME_HINT"
		},
		labels = {
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			1,
			2.5,
			3,
			3.5,
			4,
			4.5,
			5,
			5.5,
			6,
			6.5,
			7,
			7.5,
			8,
			8.5,
			9,
			9.5,
			10
		}
	},
	playerForceRespawn = {
		name = "MENU_FORCE_RESPAWN",
		hintText = {
			"MENU_FORCE_RESPAWN_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	playerHealthRegenTime = {
		name = "MENU_HEALTH_REGENERATION",
		hintText = {
			"MENU_HEALTH_REGENERATION_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_SLOW",
			"MENU_NORMAL",
			"MENU_FAST"
		},
		values = {
			0,
			10,
			5,
			2
		}
	},
	playerMaxHealth = {
		name = "CGAME_HEALTH",
		hintText = {
			"MENU_HEALTH_HINT"
		},
		labels = {
			"MENU_HEALTH_X_PERCENT"
		},
		values = {
			30,
			35,
			40,
			45,
			50,
			55,
			60,
			65,
			70,
			75,
			80,
			85,
			90,
			95,
			100,
			110,
			120,
			125,
			130,
			140,
			150,
			160,
			170,
			175,
			180,
			190,
			200
		}
	},
	playerNumLives = {
		name = "MENU_NUMBER_OF_LIVES",
		hintText = {
			"MENU_NUMBER_OF_LIVES_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_LIFE",
			"MENU_X_LIVES"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			15,
			20,
			25
		}
	},
	playerRespawnDelay = {
		name = "MENU_RESPAWN_DELAY",
		hintText = {
			"MENU_RESPAWN_DELAY_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			1,
			2,
			2.5,
			3,
			4,
			5,
			6,
			7,
			7.5,
			8,
			9,
			10,
			15,
			20,
			30
		}
	},
	pointsForSurvivalBonus = {
		name = "MENU_POINTS_FOR_SURVIVAL_BONUS",
		hintText = {
			"MENU_POINTS_FOR_SURVIVAL_BONUS_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	pointsPerPrimaryKill = {
		name = "MENU_POINTS_PER_PRIMARY_KILL",
		hintText = {
			"MENU_POINTS_PER_PRIMARY_KILL_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	pointsPerSecondaryKill = {
		name = "MENU_POINTS_PER_SECONDARY_KILL",
		hintText = {
			"MENU_POINTS_PER_SECONDARY_KILL_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	pointsPerPrimaryGrenadeKill = {
		name = "MENU_POINTS_PER_PRIMARY_GRENADE_KILL",
		hintText = {
			"MENU_POINTS_PER_PRIMARY_GRENADE_KILL_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	pointsPerMeleeKill = {
		name = "MENU_POINTS_PER_MELEE_KILL",
		hintText = {
			"MENU_POINTS_PER_MELEE_KILL_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	pointsPerWeaponKill = {
		name = "MENU_POINTS_PER_WEAPON_KILL",
		hintText = {
			"MENU_POINTS_PER_WEAPON_KILL_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	prematchperiod = {
		name = "MENU_PREMATCH_TIMER",
		hintText = {
			"MENU_PREMATCH_TIMER_HINT"
		},
		labels = {
			"MENU_X_SECONDS"
		},
		values = {
			5,
			15,
			30,
			45,
			60
		}
	},
	preroundperiod = {
		name = "MENU_PREROUND_TIMER",
		hintText = {
			"MENU_PREROUND_TIMER_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			12,
			15,
			18,
			20,
			25,
			30
		}
	},
	presetClassesPerTeam = {
		name = "MENU_PRESET_CLASSES_PER_TEAM",
		hintText = {
			"MENU_PRESET_CLASSES_PER_TEAM_HINT"
		},
		labels = {
			"MENU_GLOBAL",
			"MENU_PER_TEAM"
		},
		values = {
			0,
			1
		}
	},
	randomObjectiveLocations = {
		name = "MENU_RANDOM_OBJECTIVE_LOCATIONS",
		hintText = {
			"MENU_RANDOM_OBJECTIVE_LOCATIONS_HINT"
		},
		labels = {
			"MENU_LINEAR",
			"MENU_RANDOM_AFTER_FIRST",
			"MENU_RANDOM"
		},
		values = {
			0,
			2,
			1
		}
	},
	randomObjectiveLocations_koth = {
		setting = "randomObjectiveLocations",
		name = "MENU_RANDOM_OBJECTIVE_LOCATIONS",
		hintText = {
			"MENU_RANDOM_OBJECTIVE_LOCATIONS_HINT"
		},
		labels = {
			"MENU_LINEAR",
			"MENU_RANDOM_AFTER_FIRST"
		},
		values = {
			0,
			2
		}
	},
	rebootPlayers = {
		setting = "rebootPlayers",
		name = "MENU_REBOOT_PLAYERS",
		hintText = {
			"MENU_REBOOT_AUTO_HINT",
			"MENU_REBOOT_INTERACTIVE_HINT"
		},
		labels = {
			"MENU_AUTO",
			"MENU_INTERACTIVE"
		},
		values = {
			0,
			1
		}
	},
	rebootTime = {
		setting = "rebootTime",
		name = "MENU_REBOOT_TIME",
		hintText = {
			"MENU_REBOOT_TIME_HINT"
		},
		labels = {
			"MENU_X_SECONDS"
		},
		values = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			15,
			20,
			25,
			30,
			45,
			60
		}
	},
	robotSpeed = {
		setting = "robotSpeed",
		name = "MENU_ROBOT_SPEED",
		hintText = {
			"MENU_ROBOT_SPEED_HINT"
		},
		labels = {
			"MENU_SLOW",
			"MENU_NORMAL",
			"MENU_FAST"
		},
		values = {
			0,
			1,
			2
		}
	},
	roundLimit = {
		name = "MENU_ROUND_LIMIT1",
		hintText = {
			"MENU_ROUND_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_ROUND",
			"MENU_X_ROUNDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		}
	},
	cumulativeRoundScores = {
		name = "MENU_WIN_RULE",
		hintText = {
			"MENU_TOTAL_FLAG_CAPS_HINT",
			"MENU_CTF_ROUND_WINS_HINT"
		},
		labels = {
			"MENU_TOTAL_FLAG_CAPTURES",
			"MENU_ROUND_WINS"
		},
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	roundswitch = {
		name = "MENU_ROUND_SWITCH",
		hintText = {
			"MENU_ROUND_SWITCH_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_EVERY_ROUND",
			"MENU_EVERY_X_ROUNDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4
		}
	},
	roundStartExplosiveDelay = {
		name = "MENU_EXPLOSIVE_DELAY",
		hintText = {
			"MENU_EXPLOSIVE_DELAY_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			12,
			15,
			20,
			25,
			30,
			45,
			60
		}
	},
	roundStartKillstreakDelay = {
		name = "MENU_KILLSTREAK_DELAY",
		hintText = {
			"MENU_KILLSTREAK_DELAY_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			12,
			15,
			20,
			25,
			30,
			45,
			60
		}
	},
	roundWinLimit = {
		name = "MENU_ROUND_WIN_LIMIT",
		hintText = {
			"MENU_ROUND_WIN_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_ROUNDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		}
	},
	roundWinLimit_ctf = {
		setting = "roundWinLimit",
		name = "MENU_ROUND_WIN_LIMIT",
		hintText = {
			"MENU_ROUND_WIN_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_ROUND",
			"MENU_X_ROUNDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		},
		shouldShow = IsCumulativeRoundScoresOff
	},
	roundWinLimit_escort = {
		setting = "roundWinLimit",
		name = "MENU_ROUND_WIN_LIMIT",
		hintText = {
			"MENU_ROUND_WIN_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_ROUND",
			"MENU_X_ROUNDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			12,
			24
		}
	},
	roundWinLimit_strong = {
		setting = "roundWinLimit",
		name = "MENU_ROUND_WIN_LIMIT",
		hintText = {
			"MENU_ROUND_WIN_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_ROUND",
			"MENU_X_ROUNDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			12,
			24
		}
	},
	scoreLimit = {
		name = "MENU_SCORE_LIMIT",
		hintText = {
			"MENU_SCORE_LIMIT_OPTION"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_POINTS"
		},
		values = {
			0,
			5,
			10,
			15,
			20,
			25,
			30,
			35,
			40,
			45,
			50,
			55,
			60,
			65,
			70,
			75,
			80,
			85,
			90,
			95,
			100,
			125,
			150,
			175,
			200,
			225,
			250,
			275,
			300,
			350,
			400,
			450,
			500,
			550,
			600,
			650,
			700,
			750,
			800,
			850,
			900,
			950,
			1000
		}
	},
	scoreLimit_sd_dem = {
		setting = "scoreLimit",
		name = "MENU_ROUND_WIN_LIMIT",
		hintText = {
			"MENU_ROUND_WIN_LIMIT_HINT"
		},
		labels = {
			"MENU_1_ROUND",
			"MENU_X_ROUNDS"
		},
		values = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			12,
			24
		}
	},
	scoreLimit_dom = {
		setting = "scoreLimit",
		name = "MENU_SCORE_LIMIT",
		hintText = {
			"MENU_SCORE_LIMIT_OPTION"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_POINTS"
		},
		values = {
			0,
			50,
			100,
			110,
			120,
			130,
			140,
			150,
			200,
			250,
			300,
			350,
			400,
			450,
			500,
			750,
			1000,
			1500,
			2000
		}
	},
	scoreLimit_ctf = {
		setting = "scoreLimit",
		name = "MENU_CAPTURE_LIMIT",
		hintText = {
			"MENU_CAPTURE_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_FLAG",
			"MENU_X_FLAGS"
		},
		values = {
			0,
			1,
			3,
			5,
			10,
			15,
			30
		},
		shouldShow = IsCumulativeRoundScoresOn
	},
	scoreLimit_ctfRound = {
		setting = "scoreLimit",
		name = "MENU_CAPTURE_LIMIT",
		hintText = {
			"MENU_ROUND_CAPTURE_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_FLAG",
			"MENU_X_FLAGS"
		},
		values = {
			0,
			1,
			3,
			5,
			10,
			15,
			30
		},
		shouldShow = IsCumulativeRoundScoresOff
	},
	scoreResetOnDeath = {
		name = "MENU_SCORE_RESET_ON_DEATH",
		hintText = {
			"MENU_SCORE_RESET_ON_DEATH_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	spawnSelect = {
		setting = "spawnSelectEnabled",
		name = "MENU_SELECT_SPAWN",
		hintText = {
			"MENU_SELECT_SPAWN_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	roundScoreLimit = {
		name = "MENU_ROUND_SCORE_LIMIT",
		hintText = {
			"MENU_ROUND_SCORE_LIMIT_OPTION"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_POINTS"
		},
		values = {
			0,
			5,
			10,
			15,
			20,
			25,
			30,
			35,
			40,
			45,
			50,
			55,
			60,
			65,
			70,
			75,
			80,
			85,
			90,
			95,
			100,
			150,
			200,
			250,
			300,
			350,
			400,
			450,
			500,
			550,
			600,
			650,
			700,
			750,
			800,
			850,
			900,
			950,
			1000
		}
	},
	roundScoreLimit_dom = {
		setting = "scoreLimit",
		name = "MENU_ROUND_SCORE_LIMIT",
		hintText = {
			"MENU_ROUND_SCORE_LIMIT_OPTION"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_POINTS"
		},
		values = {
			0,
			25,
			50,
			55,
			60,
			65,
			70,
			75,
			100,
			125,
			150,
			175,
			200,
			225,
			250,
			375,
			500,
			750,
			1000
		}
	},
	roundScoreLimit_strong = {
		setting = "scoreLimit",
		name = "MENU_ROUND_SCORE_LIMIT",
		hintText = {
			"MENU_ROUND_SCORE_LIMIT_OPTION"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_POINTS"
		},
		values = {
			0,
			25,
			50,
			55,
			60,
			65,
			70,
			75,
			100,
			125,
			150,
			175,
			200,
			225,
			250,
			375,
			500,
			750,
			1000
		}
	},
	scorePerPlayer = {
		name = "MENU_SCORING",
		hintText = {
			"MENU_SCORING_HINT"
		},
		labels = {
			"MENU_CONSTANT",
			"MENU_PLAYER_ADDITIVE"
		},
		values = {
			0,
			1
		},
		shouldShow = IsCumulativeRoundScoresOn
	},
	setbacks = {
		name = "MENU_SETBACKS",
		hintText = {
			"MENU_SETBACKS_HINT"
		},
		labels = {
			"MENU_X_WEAPONS",
			"MENU_X_WEAPON",
			"MENU_X_WEAPONS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10
		}
	},
	setbacks_sas = {
		setting = "setbacks",
		name = "MENU_SETBACKS",
		hintText = {
			"MENU_SETBACKS_SAS_HINT"
		},
		labels = {
			"MENU_ALL_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			15,
			25,
			50
		}
	},
	shutdownDamage = {
		setting = "shutdownDamage",
		name = "MENU_SHUTDOWN_DAMAGE",
		hintText = {
			"MENU_SHUTDOWN_DAMAGE_HINT"
		},
		labels = {
			"MENU_INVULNERABLE",
			"MENU_LOW",
			"MENU_NORMAL",
			"MENU_HIGH"
		},
		values = {
			0,
			1,
			2,
			3
		}
	},
	silentPlant = {
		name = "MENU_SILENT_PLANT",
		hintText = {
			"MENU_SILENT_PLANT_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	spawnsuicidepenalty = {
		name = "MENU_SPAWN_SUICIDE_PENALTY",
		hintText = {
			"MENU_SPAWN_SUICIDE_PENALTY_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			12,
			14,
			15,
			16,
			18,
			20
		}
	},
	spawnteamkilledpenalty = {
		name = "MENU_SPAWN_TEAMKILLED_PENALTY",
		hintText = {
			"MENU_SPAWN_TEAMKILLED_PENALTY_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			12,
			14,
			15,
			16,
			18,
			20
		}
	},
	teamKillPunishCount = {
		name = "MENU_TEAMKILL_KICK",
		hintText = {
			"MENU_TEAMKILL_KICK_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_1_KILL",
			"MENU_X_KILLS"
		},
		values = {
			0,
			1,
			2,
			3,
			4
		},
		shouldShow = CoDShared.IsGametypeTeamBased
	},
	teamNumLives = {
		name = "MENU_NUMBER_OF_TEAM_LIVES",
		hintText = {
			"MENU_NUMBER_OF_TEAM_LIVES_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_LIFE",
			"MENU_X_LIVES"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			15,
			20,
			25,
			30,
			35,
			40,
			45,
			50,
			55,
			60,
			65,
			70,
			75,
			80,
			85,
			90,
			95,
			100
		}
	},
	teamScorePerDeath = {
		name = "MENU_TEAM_SCORE_PER_DEATH",
		hintText = {
			"MENU_TEAM_SCORE_PER_DEATH_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	teamScorePerHeadshot = {
		name = "MENU_TEAM_SCORE_PER_HEADSHOT",
		hintText = {
			"MENU_TEAM_SCORE_PER_HEADSHOT_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	teamScorePerKill = {
		name = "MENU_TEAM_SCORE_PER_KILL",
		hintText = {
			"MENU_TEAM_SCORE_PER_KILL_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	teamScorePerKillConfirmed = {
		name = "MENU_TEAM_SCORE_PER_KILL_CONFIRMED",
		hintText = {
			"MENU_TEAM_SCORE_PER_KILL_CONFIRMED_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	teamScorePerKillDenied = {
		name = "MENU_TEAM_SCORE_PER_KILL_DENIED",
		hintText = {
			"MENU_TEAM_SCORE_PER_KILL_DENIED_HINT"
		},
		labels = {
			"MENU_X_POINTS",
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			10,
			25
		}
	},
	throwScore = {
		setting = "throwScore",
		name = "MENU_THROW_SCORE",
		hintText = {
			"MENU_THROW_SCORE_HINT"
		},
		labels = {
			"MENU_1_POINT",
			"MENU_X_POINTS"
		},
		values = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		}
	},
	timeLimit = {
		name = "MENU_TIME_LIMIT1",
		hintText = {
			"MENU_TIME_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_MINUTE",
			"MENU_X_MINUTES"
		},
		values = {
			0,
			1,
			1.5,
			2,
			2.5,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
			20,
			30
		}
	},
	timeLimit_dom = {
		setting = "timeLimit",
		name = "MENU_ROUND_TIME_LIMIT1",
		hintText = {
			"MENU_ROUND_TIME_LIMIT_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_1_MINUTE",
			"MENU_X_MINUTES"
		},
		values = {
			0,
			1,
			1.5,
			2,
			2.5,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
			20,
			30
		}
	},
	timePausesWhenInZone = {
		name = "MENU_TIME_PAUSE",
		hintText = {
			"MENU_TIME_PAUSE_DESC"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	touchReturn = {
		setting = "defuseTime",
		name = "MENU_TOUCH_RETURN",
		hintText = {
			"MENU_TOUCH_RETURN_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_INSTANT",
			"MENU_X_SECONDS",
			"MENU_1_SECOND",
			"MENU_X_SECONDS"
		},
		values = {
			63,
			0,
			0.5,
			1,
			1.5,
			2,
			2.5,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10
		}
	},
	voipKillersHearVictim = {
		name = "MENU_VOIP_KILLERS_HEAR_VICTIM",
		hintText = {
			"MENU_VOIP_KILLERS_HEAR_VICTIM_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	useEmblemInsteadOfFactionIcon = {
		name = "MENU_EMBLEMS_INSTEAD_OF_FACTIONS",
		hintText = {
			"MENU_EMBLEMS_INSTEAD_OF_FACTIONS_HINT"
		},
		labels = CoD.OptionsUtility.EnabledDisabledLabels,
		values = CoD.OptionsUtility.EnabledDisabledValues
	},
	waveRespawnDelay = {
		name = "MENU_WAVE_SPAWN_DELAY",
		hintText = {
			"MENU_WAVE_SPAWN_DELAY_HINT"
		},
		labels = {
			"MENU_DISABLED",
			"MENU_X_SECONDS"
		},
		values = {
			0,
			2.5,
			5,
			7.5,
			10,
			15,
			20,
			30
		}
	},
	weaponTimer = {
		name = "MENU_SHRP_WEAPON_TIMER",
		hintText = {
			"MENU_SHRP_WEAPON_TIMER_HINT"
		},
		labels = {
			"MENU_X_SECONDS"
		},
		values = {
			10,
			15,
			20,
			25,
			30,
			35,
			40,
			45,
			50,
			55,
			60,
			90,
			120
		}
	},
	weaponCount = {
		name = "MENU_SHRP_WEAPON_NUMBER",
		hintText = {
			"MENU_SHRP_WEAPON_NUMBER_HINT"
		},
		labels = {
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
			16,
			17,
			18,
			19,
			20
		},
		values = {
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
			16,
			17,
			18,
			19,
			20
		}
	},
	objectiveHealth = {
		setting = "objectiveHealth",
		name = "MENU_OBJECTIVE_HEALTH",
		hintText = {
			"MENU_OBJECTIVE_HEALTH_HINT"
		},
		labels = {
			"MENU_UNLIMITED",
			"MENU_X_FLAT_NUM"
		},
		values = {
			0,
			100,
			200,
			300,
			400,
			500,
			1000,
			1500,
			2000
		}
	},
	pickupTime = {
		setting = "pickupTime",
		name = "MENU_BATTERY_PICKUP_TIME",
		hintText = {
			"MENU_BATTERY_PICKUP_TIME_HINT"
		},
		labels = {
			"MENU_X_SECONDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10
		}
	},
	depositTime = {
		setting = "depositTime",
		name = "MENU_BATTERY_DEPOSIT_TIME",
		hintText = {
			"MENU_BATTERY_DEPOSIT_TIME_HINT"
		},
		labels = {
			"MENU_X_SECONDS"
		},
		values = {
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10
		}
	}
}
CoD.OptionsUtility.GlobalSettings = {
	"teamAssignment",
	"allowInGameTeamChange",
	"allowSpectating",
	"disableThirdPersonSpectating",
	"allowMapScripting",
	"voipKillersHearVictim",
	"allowBattleChatter",
	"allowAnnouncer"
}
CoD.OptionsUtility.DraftSettings = {
	"draftEnabled",
	"draftTime",
	"draftEveryRound",
	"draftRequiredClients"
}
CoD.OptionsUtility.GeneralSettings = {
	"prematchperiod",
	"preroundperiod",
	"forceRadar",
	"roundStartExplosiveDelay",
	"allowKillcam",
	"roundStartKillstreakDelay",
	"killEventScoreMultiplier",
	"escalationEnabled"
}
CoD.OptionsUtility.HealthAndDamageSettings = {
	"playerMaxHealth",
	"playerHealthRegenTime",
	"friendlyfiretype",
	"teamKillPunishCount",
	"onlyHeadshots",
	"allowhitmarkers"
}
CoD.OptionsUtility.SpawnSettings = {
	"playerNumLives",
	"playerRespawnDelay",
	"incrementalSpawnDelay",
	"playerForceRespawn",
	"waveRespawnDelay",
	"spawnsuicidepenalty",
	"spawnteamkilledpenalty",
	"forwardSpawnEnabled",
	"forwardSpawnProximityActivate",
	"forwardSpawnIsNeutral",
	"spawnSelect",
	"teamNumLives"
}
CoD.OptionsUtility.CustomClassSettings = {
	"disableCAC",
	"maxAllocation"
}
CoD.OptionsUtility.PresetClassSettings = {
	"presetClassesPerTeam"
}
CoD.OptionsUtility.TopLevelGametypeSettings = {
	conf = {
		"timeLimit",
		"scoreLimit"
	},
	ctf = {
		"cumulativeRoundScores",
		"timeLimit"
	},
	dem = {
		"timeLimit",
		"scoreLimit_sd_dem"
	},
	dm = {
		"timeLimit",
		"scoreLimit"
	},
	dom = {
		"timeLimit_dom",
		"roundScoreLimit"
	},
	gun = {
		"timeLimit"
	},
	hack = {
		"timeLimit",
		"scoreLimit"
	},
	hq = {
		"timeLimit",
		"scoreLimit"
	},
	koth = {
		"timeLimit",
		"scoreLimit"
	},
	oic = {
		"timeLimit",
		"scoreLimit"
	},
	oneflag = {
		"cumulativeRoundScores",
		"timeLimit"
	},
	osdm = {
		"timeLimit",
		"scoreLimit"
	},
	ostdm = {
		"timeLimit",
		"scoreLimit"
	},
	sas = {
		"timeLimit",
		"scoreLimit"
	},
	sd = {
		"timeLimit",
		"scoreLimit_sd_dem"
	},
	shrp = {
		"scoreLimit"
	},
	tdm = {
		"timeLimit",
		"scoreLimit"
	},
	ball = {
		"timeLimit_dom",
		"roundScoreLimit"
	},
	escort = {
		"timeLimit",
		"roundWinLimit_escort"
	},
	war = {
		"timeLimit"
	},
	strong = {
		"timeLimit",
		"roundWinLimit_strong",
		"roundLimit",
		"roundScoreLimit_strong"
	},
	infil = {
		"timeLimit"
	},
	payload = {
		"timeLimit"
	},
	frontline = {
		"timeLimit"
	}
}
CoD.OptionsUtility.GlobalTopLevelGametypeSettings = {
	"hardcoreMode"
}
CoD.OptionsUtility.SubLevelGametypeSettings = {
	ball = {
		"roundLimit",
		"carrierArmor",
		"carryScore",
		"throwScore",
		"enemyCarrierVisible",
		"idleFlagResetTime_ball",
		"ballCount"
	},
	conf = {
		"teamScorePerKillConfirmed",
		"teamScorePerKillDenied",
		"teamScorePerKill",
		"playerNumLives",
		"teamNumLives"
	},
	ctf = {
		"scoreLimit_ctfRound",
		"roundLimit",
		"roundWinLimit_ctf",
		"enemyCarrierVisible",
		"idleFlagResetTime",
		"flagCaptureCondition",
		"captureTime_ctf",
		"touchReturn"
	},
	dem = {
		"bombTimer",
		"plantTime",
		"defuseTime",
		"extraTime",
		"OvertimetimeLimit",
		"silentPlant",
		"droppedTagRespawn"
	},
	dom = {
		"roundLimit",
		"captureTime",
		"flagCanBeNeutralized",
		"roundswitch"
	},
	dm = {
		"teamScorePerKill",
		"teamScorePerDeath",
		"teamScorePerHeadshot",
		"playerNumLives",
		"roundLimit",
		"roundWinLimit",
		"roundScoreLimit",
		"killstreaksGiveGameScore"
	},
	escort = {
		"roundLimit",
		"shutdownDamage",
		"bootTime",
		"rebootTime",
		"rebootPlayers",
		"robotSpeed"
	},
	gun = {
		"setbacks",
		"gunSelection"
	},
	koth = {
		"autoDestroyTime",
		"captureTime_koth",
		"objectiveSpawnTime",
		"randomObjectiveLocations_koth",
		"scorePerPlayer",
		"timePausesWhenInZone"
	},
	osdm = {
		"teamScorePerKill",
		"teamScorePerDeath",
		"teamScorePerHeadshot",
		"playerNumLives",
		"roundLimit",
		"roundWinLimit",
		"roundScoreLimit"
	},
	ostdm = {
		"teamScorePerKill",
		"teamScorePerDeath",
		"teamScorePerHeadshot",
		"playerNumLives",
		"roundLimit",
		"roundWinLimit",
		"droppedTagRespawn",
		"roundScoreLimit"
	},
	sd = {
		"bombTimer",
		"plantTime",
		"defuseTime",
		"multiBomb",
		"roundswitch",
		"silentPlant",
		"droppedTagRespawn",
		"playerNumLives"
	},
	tdm = {
		"teamScorePerKill",
		"teamScorePerDeath",
		"teamScorePerHeadshot",
		"playerNumLives",
		"roundLimit",
		"roundWinLimit",
		"droppedTagRespawn",
		"roundScoreLimit",
		"killstreaksGiveGameScore"
	},
	war = {},
	strong = {
		"captureTime",
		"objectiveSpawnTime",
		"extraTime",
		"timePausesWhenInZone",
		"neutralZone",
		"zoneCount",
		"decayCapturedZones",
		"capDecay"
	},
	infil = {
		"carrierMoveSpeed",
		"pickupTime",
		"depositTime",
		"objectiveHealth",
		"timePausesWhenInZone",
		"enemyCarrierVisible"
	},
	payload = {},
	frontline = {}
}
CoD.GameSettingsUtility = {}
CoD.GameSettingsUtility.GetRestrictionOptions = function ()
	local options = {
		{
			option = "MENU_BAN_PROTECT",
			desc = "MENU_ITEM_BAN_PROTECT_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE,
			default = true
		},
		{
			option = "MENU_RESTRICTED",
			desc = "MENU_ITEM_RESTRICTED_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
		},
		{
			option = "MENU_BAN_ONLY",
			desc = "MENU_ITEM_BAN_ONLY_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY
		},
		{
			option = "MENU_PROTECTED",
			desc = "MENU_ITEM_PROTECTED_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED
		}
	}
	return options
end

CoD.GameSettingsUtility.GetGroupRestrictionOptions = function ()
	local options = {
		{
			option = "MENU_CUSTOM",
			desc = "",
			value = nil
		},
		{
			option = "MENU_BAN_PROTECT",
			desc = "MENU_ITEM_BAN_PROTECT_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE,
			default = true
		},
		{
			option = "MENU_RESTRICTED",
			desc = "MENU_ITEM_RESTRICTED_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
		},
		{
			option = "MENU_BAN_ONLY",
			desc = "MENU_ITEM_BAN_ONLY_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY
		},
		{
			option = "MENU_PROTECTED",
			desc = "MENU_ITEM_PROTECTED_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED
		}
	}
	return options
end

CoD.GameSettingsUtility.MaxSplitscreenBots = 12
CoD.GameSettingsUtility.GetMaxBotsCount = function ()
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
		return CoD.GameSettingsUtility.MaxSplitscreenBots
	else
		return LuaDefine.MAX_CLIENTS
	end
end

CoD.GameSettingsUtility.UpdateBreadCrumbNodes = function ( menuName )
	local node = CoD.GameSettingsUtility[menuName]
	if node == nil then
		return true
	end
	local children = node.children
	local default = true
	for i, childMenuName in ipairs( children ) do
		default = CoD.GameSettingsUtility.UpdateBreadCrumbNodes( childMenuName )
		if not default then
			break
		end
	end
	if node.defaultFunc then
		node.default = node.defaultFunc()
		return node.default
	end
	local defaultValue, f8_local1 = nil
	if default and node.settingsFunction then
		local settings = node.settingsFunction()
		for i, f8_local4 in ipairs( settings ) do
			local settingInfo = CoD.OptionsUtility.GameSettings[f8_local4]
			if settingInfo then
				f8_local4 = settingInfo.setting or f8_local4
			end
			default = Engine.GetGametypeSetting( f8_local4 ) == Engine.GetGametypeSetting( f8_local4, true )
			if not default then
				break
			end
		end
	end
	node.default = default
	return default
end

CoD.GameSettingsUtility.GameSettings_Main = {
	parent = nil,
	default = true,
	settingsFunction = function ()
		return {}
	end,
	children = {
		"GameSettings_GameModeRules",
		"GameSettings_GlobalSettings"
	}
}
CoD.GameSettingsUtility.GameSettings_GameModeRules = {
	parent = "GameSettings_Main",
	default = true,
	settingsFunction = function ()
		local gametype = Dvar.ui_gametype:get()
		local topLevelSettings = CoD.OptionsUtility.TopLevelGametypeSettings[gametype]
		local globalTopLevelSettings = CoD.OptionsUtility.GlobalTopLevelGametypeSettings
		local settings = {}
		for i, v in ipairs( topLevelSettings ) do
			local settingInfo = CoD.OptionsUtility.GameSettings[v]
			settings[#settings + 1] = settingInfo.setting or v
		end
		for i, v in ipairs( globalTopLevelSettings ) do
			local settingInfo = CoD.OptionsUtility.GameSettings[v]
			settings[#settings + 1] = settingInfo.setting or v
		end
		return settings
	end,
	children = {
		"GameSettings_EditModeSpecificOptions",
		"GameSettings_GeneralSettings",
		"GameSettings_SpawnSettings",
		"GameSettings_HealthAndDamageSettings",
		"GameSettings_Competitive",
		"GameSettings_CreateAClassSettings"
	}
}
CoD.GameSettingsUtility.GameSettings_GlobalSettings = {
	parent = "GameSettings_Main",
	default = true,
	settingsFunction = function ()
		return CoD.OptionsUtility.GlobalSettings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_DraftSettings = {
	parent = "GameSettings_Main",
	default = true,
	settingsFunction = function ()
		return CoD.OptionsUtility.DraftSettings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_EditModeSpecificOptions = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		local gametype = Dvar.ui_gametype:get()
		return CoD.OptionsUtility.SubLevelGametypeSettings[gametype]
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_GeneralSettings = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return CoD.OptionsUtility.GeneralSettings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_SpawnSettings = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return CoD.OptionsUtility.SpawnSettings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_HealthAndDamageSettings = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return CoD.OptionsUtility.HealthAndDamageSettings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_Competitive = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return {}
	end,
	children = {
		"GameSettings_CompetitiveSettings",
		"GameSettings_CompetitiveAdvancedSettings"
	}
}
CoD.GameSettingsUtility.GameSettings_CompetitiveSettings = {
	parent = "GameSettings_Competitive",
	default = true,
	settingsFunction = function ()
		local settings = {
			"pregameItemVoteEnabled",
			"pregameDraftEnabled"
		}
		return settings
	end,
	children = {
		"Competitive_Settings_Weapons",
		"Competitive_Settings_Attachments",
		"Competitive_Settings_Perks",
		"Competitive_Settings_Equipment",
		"Competitive_Settings_Wildcards",
		"Competitive_Settings_Specialists",
		"Competitive_Settings_Scorestreaks"
	}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			local itemId = Engine.GetItemRef( itemIndex )
			if Engine.ItemIndexValid( itemIndex ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and (itemInfo.loadoutSlot == "primary" or itemInfo.loadoutSlot == "secondary") then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_SMG = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			local itemId = Engine.GetItemRef( itemIndex )
			if Engine.ItemIndexValid( itemIndex ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and itemInfo.loadoutSlot == "primary" and itemInfo.groupIndex == Enum.itemGroup_t.ITEMGROUP_SMG then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_AR = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			local itemId = Engine.GetItemRef( itemIndex )
			if Engine.ItemIndexValid( itemIndex ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and itemInfo.loadoutSlot == "primary" and itemInfo.groupIndex == Enum.itemGroup_t.ITEMGROUP_ASSAULT then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_CQB = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			local itemId = Engine.GetItemRef( itemIndex )
			if Engine.ItemIndexValid( itemIndex ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and itemInfo.loadoutSlot == "primary" and itemInfo.groupIndex == Enum.itemGroup_t.ITEMGROUP_CQB then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_LMG = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			local itemId = Engine.GetItemRef( itemIndex )
			if Engine.ItemIndexValid( itemIndex ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and itemInfo.loadoutSlot == "primary" and itemInfo.groupIndex == Enum.itemGroup_t.ITEMGROUP_LMG then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_SNIPER = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			local itemId = Engine.GetItemRef( itemIndex )
			if Engine.ItemIndexValid( itemIndex ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and itemInfo.loadoutSlot == "primary" and itemInfo.groupIndex == Enum.itemGroup_t.ITEMGROUP_SNIPER then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_SECONDARY = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			local itemId = Engine.GetItemRef( itemIndex )
			if Engine.ItemIndexValid( itemIndex ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and itemInfo.loadoutSlot == "secondary" then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Attachments = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		return not Engine.AnyAttachmentRestrictionStateChanged()
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Perks = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			if Engine.ItemIndexValid( itemIndex ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and LUI.startswith( itemInfo.loadoutSlot, "specialty" ) then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Equipment = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			if Engine.ItemIndexValid( itemIndex ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and (itemInfo.loadoutSlot == "primarygadget" or itemInfo.loadoutSlot == "secondarygadget") then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Wildcards = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			if Engine.ItemIndexValid( itemIndex ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and LUI.startswith( itemInfo.loadoutSlot, "bonuscard" ) then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Specialists = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			if Engine.ItemIndexValid( itemIndex ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and (LuaUtils.StartsWith( itemInfo.loadoutSlot, "hero" ) or itemInfo.loadoutSlot == "specialgadget") then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Scorestreaks = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for itemIndex = 0, 255, 1 do
			if Engine.ItemIndexValid( itemIndex ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if 0 <= itemInfo.allocation and LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) then
					local defaultValue = Engine.GetItemRestrictionState( itemIndex, true )
					local currentValue = Engine.GetItemRestrictionState( itemIndex )
					if currentValue ~= defaultValue then
						return false
					end
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_CompetitiveAdvancedSettings = {
	parent = "GameSettings_Competitive",
	default = true,
	settingsFunction = function ()
		local settings = {
			"pregamePreStageTime",
			"pregamePostRoundTime",
			"pregamePostStageTime",
			"pregameAlwaysShowCACEdit",
			"pregameAlwaysShowStreakEdit",
			"pregamePositionSortType",
			"pregamePositionShuffleMethod"
		}
		return settings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_CreateAClassSettings = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		local settings = {
			"disableCAC",
			"maxAllocation",
			"presetClassesPerTeam"
		}
		return settings
	end,
	children = {}
}
CoD.OptionsUtility.ItemSelectedFunction = function ( self, element, controller, actionParam, menu )
	if actionParam then
		Engine.SetProfileVar( controller, actionParam, element.value )
	end
end

CoD.OptionsUtility.GetCustomProfileSelection = function ( controller, options, value )
	for index, optionTable in ipairs( options ) do
		if options[index].value == value then
			return index
		end
	end
end

CoD.OptionsUtility.GetProfileSelection = function ( controller, options, stat )
	local statValue = Engine.ProfileValueAsString( controller, stat )
	return CoD.OptionsUtility.GetCustomProfileSelection( controller, options, tonumber( statValue ) )
end

CoD.OptionsUtility.CreateOptionDataSource = function ( controller, dataSourceName, options, profileStat )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			local newEntry = {
				models = {
					text = optionTable.name
				},
				properties = {
					value = optionTable.value,
					actionParam = profileStat,
					action = CoD.OptionsUtility.ItemSelectedFunction,
					loopEdges = #options <= 2
				}
			}
			if optionTable.customModels then
				for modelName, modelValue in pairs( optionTable.customModels ) do
					newEntry.models[modelName] = modelValue
				end
			end
			table.insert( dataTable, newEntry )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, true )
	return dataSourceName
end

CoD.OptionsUtility.GetPlayerStat = function ( controller, statList )
	local ddlStat = Engine.GetPlayerStats( controller )
	for _, statItem in ipairs( statList ) do
		if not ddlStat then
			break
		end
		ddlStat = ddlStat[statItem]
	end
	return ddlStat
end

CoD.OptionsUtility.StatItemSelectedFunction = function ( self, element, controller, actionParam, menu )
	local ddlStat = CoD.OptionsUtility.GetPlayerStat( controller, actionParam )
	if ddlStat then
		ddlStat:set( element.value )
		Engine.CharMixerUpdate()
	end
end

CoD.OptionsUtility.GetCustomStatSelection = function ( controller, options, statList, list )
	local ddlStat = CoD.OptionsUtility.GetPlayerStat( controller, statList )
	if list._randomize then
		local randomChoice = math.random( 1, #options )
		if ddlStat then
			ddlStat:set( options[randomChoice].value )
		end
		return randomChoice
	end
	local f41_local0 = CoD.OptionsUtility.GetCustomProfileSelection
	local f41_local1 = controller
	local f41_local2 = options
	local f41_local3 = tonumber
	local f41_local4
	if ddlStat then
		f41_local4 = ddlStat:get()
		if not f41_local4 then
		
		else
			return f41_local0( f41_local1, f41_local2, f41_local3( f41_local4 ) )
		end
	end
	f41_local4 = 0
end

CoD.OptionsUtility.CreateStatDataSource = function ( controller, dataSourceName, options, profileStat )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			local newEntry = {
				models = {
					text = optionTable.name
				},
				properties = {
					value = optionTable.value,
					actionParam = profileStat,
					action = CoD.OptionsUtility.StatItemSelectedFunction,
					loopEdges = #options <= 2
				}
			}
			if optionTable.customModels then
				for modelName, modelValue in pairs( optionTable.customModels ) do
					newEntry.models[modelName] = modelValue
				end
			end
			table.insert( dataTable, newEntry )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, true )
	return dataSourceName
end

CoD.OptionsUtility.CustomItemSelectedFunction = function ( self, element, controller, actionParam, menu )
	if actionParam then
		Engine.SetProfileVar( controller, actionParam, element.value )
	end
	element.valueChangedCallback( element.value )
end

CoD.OptionsUtility.CreateCustomOptionDataSource = function ( controller, dataSourceName, options, profileStat, valueChangedCallback, itemSelectedFunction, revertAction )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		if not itemSelectedFunction then
			itemSelectedFunction = CoD.OptionsUtility.CustomItemSelectedFunction
		end
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					value = options[index].value,
					options = options,
					actionParam = profileStat,
					action = itemSelectedFunction,
					valueChangedCallback = valueChangedCallback,
					revertAction = revertAction
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, true )
	return dataSourceName
end

CoD.OptionsUtility.GametypeSettingsItemSelectedFunction = function ( self, element, controller, actionParam, menu )
	local setting = actionParam
	local currentValue = Engine.GetGametypeSetting( setting, false )
	CoD.OptionsUtility.UpdateInfoModels( element )
	if element.value == currentValue then
		return 
	else
		print( "Setting GametypeSetting: " .. actionParam .. " to: " .. element.value )
		Engine.SetGametypeSetting( actionParam, element.value )
		local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		local updateModel = Engine.CreateModel( gametypeSettingsModel, actionParam )
		Engine.SetModelValue( updateModel, element.value )
		Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionDirty.SESSION_DIRTY_UI )
	end
end

CoD.OptionsUtility.CreateGametypeSettingsDataSource = function ( controller, dataSourceName, options, statName, loopEdges )
	local statValue = tonumber( Engine.GetGametypeSetting( statName ) )
	if statValue == nil then
		statValue = 0
	end
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					title = options[index].title,
					desc = options[index].desc,
					image = options[index].image,
					value = options[index].value,
					actionParam = statName,
					action = CoD.OptionsUtility.GametypeSettingsItemSelectedFunction,
					selectIndex = options[index].value == statValue,
					loopEdges = loopEdges,
					revert = function ( self )
						Engine.SetGametypeSetting( statName, Engine.GetGametypeSetting( statName, true ) )
					end
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, nil, nil, nil )
	return dataSourceName
end

CoD.OptionsUtility.CreateEnabledDisabledProfileVar = function ( controller, title, desc, profileVar, optionsDatasourceName )
	local options = {
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1,
			title = title,
			desc = desc
		},
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0,
			title = title,
			desc = desc
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = "blacktransparent",
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, optionsDatasourceName, options, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

CoD.OptionsUtility.CreateEnabledDisabledOptions = function ( controller, title, desc, statName, optionsDatasourceName )
	local options = {
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1,
			title = title,
			desc = desc
		},
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0,
			title = title,
			desc = desc
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = "blacktransparent",
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, statName, true ),
			setting = statName
		},
		properties = {
			revert = function ( self )
				Engine.SetGametypeSetting( statName, Engine.GetGametypeSetting( statName, true ) )
			end
		}
	}
	return listInfo
end

CoD.OptionsUtility.CreateListOptions = function ( controller, title, desc, statName, settingInfo, optionsDatasourceName )
	local setting = settingInfo.setting or statName
	local options = {}
	local localStringDelimiter = Engine.GetDecimalDelimiter()
	for index, value in ipairs( settingInfo.values ) do
		local f54_local3 = value
		if tonumber( value ) then
			f54_local3 = string.gsub( f54_local3, "%.", localStringDelimiter, 1 )
		end
		local label = f54_local3
		if settingInfo.labels then
			if settingInfo.labels[index] then
				label = settingInfo.labels[index]
			else
				label = settingInfo.labels[#settingInfo.labels]
			end
		end
		local itemDesc = ""
		if desc then
			if desc[index] then
				itemDesc = desc[index]
			else
				itemDesc = desc[#desc]
			end
		end
		options[#options + 1] = {
			name = Engine.Localize( label, f54_local3 ),
			value = value,
			title = title,
			desc = itemDesc
		}
	end
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = settingInfo.hintText[1],
			image = "blacktransparent",
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, setting, true ),
			setting = setting
		},
		properties = {
			revert = function ( self )
				Engine.SetGametypeSetting( setting, Engine.GetGametypeSetting( setting, true ) )
			end
		}
	}
	return listInfo
end

CoD.OptionsUtility.CreateDvarSettingsDataSource = function ( controller, dataSourceName, options, dvarName, loopEdges, changedFunc )
	local dvarValue = Engine.GetDvarInt( dvarName )
	if dvarValue == nil then
		dvarValue = 0
	end
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					title = options[index].title,
					desc = options[index].desc,
					image = options[index].image,
					value = options[index].value,
					default = options[index].default,
					actionParam = dvarName,
					action = changedFunc,
					selectIndex = options[index].value == dvarValue,
					loopEdges = loopEdges,
					showChangeIndicator = function ( self, slider, sliderListItem )
						return self.default ~= true
					end
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, nil, nil, nil )
	return dataSourceName
end

CoD.OptionsUtility.CreateDvarSettings = function ( controller, title, desc, optionsDatasourceName, dvarName, values, image, changedFunc )
	local options = {}
	local defaultValue = nil
	for index, value in ipairs( values ) do
		if value.default == true then
			defaultValue = value.value
		end
		table.insert( options, {
			name = value.option,
			value = value.value,
			title = title,
			desc = desc,
			default = value.default
		} )
	end
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = image,
			optionsDatasource = CoD.OptionsUtility.CreateDvarSettingsDataSource( controller, optionsDatasourceName, options, dvarName, false, changedFunc )
		},
		properties = {
			revert = function ( self )
				Engine.SetDvar( dvarName, defaultValue )
			end
		}
	}
	return listInfo
end

CoD.OptionsUtility.CreateNamedSettings = function ( controller, title, desc, optionsDatasourceName, statName, values, image )
	local options = {}
	for index, value in ipairs( values ) do
		table.insert( options, {
			name = value.option,
			value = value.value,
			title = title,
			desc = desc
		} )
	end
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = image,
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, statName ),
			setting = statName
		},
		properties = {
			revert = function ( self )
				Engine.SetGametypeSetting( statName, Engine.GetGametypeSetting( statName, true ) )
			end
		}
	}
	return listInfo
end

CoD.OptionsUtility.UpdateInfoModels = function ( element )
	local title = element.title
	local desc = element.desc
	local image = element.image
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	Engine.SetModelValue( Engine.CreateModel( gametypeSettingsModel, "title" ), title )
	Engine.SetModelValue( Engine.CreateModel( gametypeSettingsModel, "description" ), desc )
	Engine.SetModelValue( Engine.CreateModel( gametypeSettingsModel, "image" ), image )
end

CoD.OptionsUtility.GametypeSettingsSetItemRestrictionState = function ( self, element, controller, actionParam, menu )
	local restrictionState = element.value
	local itemIndex = actionParam.itemIndex
	CoD.OptionsUtility.UpdateInfoModels( element )
	if itemIndex then
		if restrictionState == Engine.GetItemRestrictionState( itemIndex, false ) then
			return 
		end
		Engine.SetItemRestrictionState( itemIndex, restrictionState )
		print( "Setting Item Restriction: Item: " .. itemIndex .. " State: " .. restrictionState )
		local f64_local0 = element:getParent()
		f64_local0 = f64_local0:getParent()
		f64_local0 = f64_local0:getParent()
		f64_local0:processEvent( {
			name = "update_state",
			controller = controller
		} )
		Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionDirty.SESSION_DIRTY_UI )
	end
end

CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionState = function ( self, element, controller, actionParam, menu )
	local attachmentIndex = actionParam.attachmentIndex
	local restrictionState = element.value
	CoD.OptionsUtility.UpdateInfoModels( element )
	if not restrictionState then
		return 
	end
	local items, attachments = CoD.CACUtility.GetAllItems()
	for itemIndex, item in pairs( items ) do
		if item.attachments and item.attachments[attachmentIndex] and restrictionState ~= Engine.GetAttachmentRestrictionState( attachmentIndex, itemIndex, false ) then
			Engine.SetAttachmentRestrictionState( attachmentIndex, itemIndex, restrictionState )
			print( "Setting Weapon Attachment Restriction: Attachment: " .. attachmentIndex .. " Weapon: " .. itemIndex .. " State: " .. restrictionState )
		end
	end
end

CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionStateForGroup = function ( self, element, controller, actionParam, menu )
	local attachmentIndex = actionParam.attachmentIndex
	local weaponGroups = actionParam.weaponGroups
	local restrictionState = element.value
	CoD.OptionsUtility.UpdateInfoModels( element )
	if not restrictionState then
		return 
	end
	local items, attachments = CoD.CACUtility.GetAllItems()
	for itemIndex, item in pairs( items ) do
		if item.attachments and item.attachments[attachmentIndex] and weaponGroups[item.groupIndex] and restrictionState ~= Engine.GetAttachmentRestrictionState( attachmentIndex, itemIndex, false ) then
			Engine.SetAttachmentRestrictionState( attachmentIndex, itemIndex, restrictionState )
			print( "Setting Weapon Attachment Restriction: Attachment: " .. attachmentIndex .. " Weapon: " .. itemIndex .. " State: " .. restrictionState )
		end
	end
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "updateWeaponList" )
	Engine.ForceNotifyModelSubscriptions( updateModel )
	local parent = element:getParent()
	if parent then
		parent = parent:getParent()
		if parent then
			parent = parent:getParent()
			if parent then
				parent:processEvent( {
					name = "update_state",
					controller = controller
				} )
			end
		end
	end
end

CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionStateForWeapon = function ( self, element, controller, actionParam, menu )
	local attachmentIndex = actionParam.attachmentIndex
	local weaponIndex = actionParam.weaponIndex
	local restrictionState = element.value
	CoD.OptionsUtility.UpdateInfoModels( element )
	if restrictionState == Engine.GetAttachmentRestrictionState( attachmentIndex, weaponIndex, false ) then
		return 
	else
		Engine.SetAttachmentRestrictionState( attachmentIndex, weaponIndex, restrictionState )
		print( "Setting Weapon Attachment Restriction: Attachment: " .. attachmentIndex .. " Weapon: " .. weaponIndex .. " State: " .. restrictionState )
		local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		local updateModel = Engine.CreateModel( gametypeSettingsModel, "updateWeaponGroup" )
		Engine.ForceNotifyModelSubscriptions( updateModel )
		local f67_local0 = element:getParent()
		f67_local0 = f67_local0:getParent()
		f67_local0 = f67_local0:getParent()
		f67_local0:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
end

CoD.OptionsUtility.CreateItemRestrictionSettings = function ( controller, title, desc, optionsDatasourceName, values, image, updateFunc, updateParams, restrictedStateFunc, revertFn )
	local options = {}
	for index, value in ipairs( values ) do
		table.insert( options, {
			name = value.option,
			value = value.value,
			title = title,
			desc = value.desc,
			image = image,
			disabled = value.disabled,
			default = value.default
		} )
	end
	DataSources[optionsDatasourceName] = DataSourceHelpers.ListSetup( optionsDatasourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					title = options[index].title,
					desc = options[index].desc,
					image = options[index].image,
					value = options[index].value,
					default = options[index].default,
					actionParam = updateParams,
					action = updateFunc,
					selectIndex = options[index].value == restrictedStateFunc( updateParams ),
					loopEdges = false,
					showChangeIndicator = function ( self, slider, sliderListItem )
						return self.default ~= true
					end,
					revert = function ( element )
						revertFn( element )
					end
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, nil, nil, nil )
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = image,
			optionsDatasource = optionsDatasourceName,
			itemIndex = updateParams.itemIndex,
			attachmentIndex = updateParams.attachmentIndex,
			weaponIndex = updateParams.weaponIndex,
			weaponGroups = updateParams.weaponGroups
		},
		properties = {
			itemIndex = updateParams.itemIndex,
			attachmentIndex = updateParams.attachmentIndex,
			weaponIndex = updateParams.weaponIndex,
			weaponGroups = updateParams.weaponGroups,
			revert = function ( element )
				revertFn( element )
			end
		}
	}
	return listInfo
end

CoD.OptionsUtility.IsProfileIntValue = function ( controller, profileVarName, expressionArg )
	return Engine.GetProfileVarInt( controller, profileVarName ) == expressionArg
end

