require( "lua.Shared.LuaEnums" )

CoD.GameOptions = {}
CoD.GameOptionsMenu = InheritFrom( CoD.Menu )
local HardcoreSettingChanged = function ( params, userRequested )
	local selectorButton = params.parentSelectorButton
	if userRequested then
		if params.value == 0 then
			Engine.SetGametypeSetting( "allowKillcam", Engine.GetGametypeSetting( "allowKillcam", true ) )
			Engine.SetGametypeSetting( "forceRadar", Engine.GetGametypeSetting( "forceRadar", true ) )
			Engine.SetGametypeSetting( "playerMaxHealth", Engine.GetGametypeSetting( "playerMaxHealth", true ) )
			Engine.SetGametypeSetting( "playerHealthRegenTime", Engine.GetGametypeSetting( "playerHealthRegenTime", true ) )
			Engine.SetGametypeSetting( "friendlyfiretype", Engine.GetGametypeSetting( "friendlyfiretype", true ) )
			Engine.SetGametypeSetting( "teamKillPunishCount", Engine.GetGametypeSetting( "teamKillPunishCount", true ) )
			Engine.SetGametypeSetting( "playerRespawnDelay", Engine.GetGametypeSetting( "playerRespawnDelay", true ) )
		else
			Engine.SetGametypeSetting( "allowKillcam", 0 )
			Engine.SetGametypeSetting( "forceRadar", 0 )
			Engine.SetGametypeSetting( "playerMaxHealth", 30 )
			Engine.SetGametypeSetting( "playerHealthRegenTime", 0 )
			Engine.SetGametypeSetting( "friendlyfiretype", 1 )
			Engine.SetGametypeSetting( "teamKillPunishCount", 3 )
			Engine.SetGametypeSetting( "playerRespawnDelay", 7 )
		end
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( params )
		selectorButton:dispatchEventToParent( {
			name = "refresh_settings"
		} )
	else
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( params )
	end
end

local OldSchoolSettingChanged = function ( params, userRequested )
	local selectorButton = params.parentSelectorButton
	if userRequested then
		if params.value == 0 then
			Engine.SetGametypeSetting( "playerHealthRegenTime", Engine.GetGametypeSetting( "playerHealthRegenTime", true ) )
		else
			Engine.SetGametypeSetting( "playerHealthRegenTime", 0 )
		end
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( params )
		selectorButton:dispatchEventToParent( {
			name = "refresh_settings"
		} )
	else
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( params )
	end
end

local CumulativeRoundScoresSettingChanged = function ( params, userRequested )
	local selectorButton = params.parentSelectorButton
	if userRequested then
		if params.value == 0 then
			Engine.SetGametypeSetting( "roundLimit", 0 )
			Engine.SetGametypeSetting( "roundWinLimit", 2 )
			Engine.SetGametypeSetting( "scoreLimit", 3 )
		else
			Engine.SetGametypeSetting( "roundLimit", 2 )
			Engine.SetGametypeSetting( "roundWinLimit", 0 )
			Engine.SetGametypeSetting( "scoreLimit", 0 )
		end
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( params )
		selectorButton:dispatchEventToParent( {
			name = "refresh_settings"
		} )
	else
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( params )
	end
end

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

CoD.GameOptions.OffOnLabels = {
	"MENU_OFF",
	"MENU_ON"
}
CoD.GameOptions.OffOnValues = {
	0,
	1
}
CoD.GameOptions.AllowedDisallowedLabels = {
	"MENU_NOTALLOWED",
	"MENU_ALLOWED"
}
CoD.GameOptions.AllowedDisallowedValues = {
	0,
	1
}
CoD.GameOptions.EnabledDisabledValues = {
	0,
	1
}
CoD.GameOptions.YesNoLabels = {
	"MENU_NO",
	"MENU_YES"
}
CoD.GameOptions.GameSettings = {
	allowAnnouncer = {
		name = "MENU_ANNOUNCER",
		hintText = "MENU_ANNOUNCER_HINT",
		labels = CoD.GameOptions.OffOnLabels,
		values = CoD.GameOptions.EnabledDisabledValues
	},
	allowBattleChatter = {
		name = "MENU_BATTLECHATTER",
		hintText = "MENU_BATTLECHATTER_HINT",
		labels = CoD.GameOptions.OffOnLabels,
		values = CoD.GameOptions.OffOnValues
	},
	allowhitmarkers = {
		name = "MENU_HIT_MARKERS",
		hintText = "MENU_HIT_MARKERS_HINT",
		labels = {
			"MENU_OFF",
			"MENU_OFF_FOR_TACTICALS",
			"MENU_ON"
		},
		values = {
			0,
			1,
			2
		}
	},
	allowInGameTeamChange = {
		name = "MENU_INGAME_TEAM_CHANGE",
		hintText = "MENU_INGAME_TEAM_CHANGE_HINT",
		labels = CoD.GameOptions.AllowedDisallowedLabels,
		values = CoD.GameOptions.AllowedDisallowedValues
	},
	allowKillcam = {
		name = "MENU_ALLOW_KILLCAM",
		hintText = "MENU_ALLOW_KILLCAM_HINT",
		labels = CoD.GameOptions.OffOnLabels,
		values = CoD.GameOptions.OffOnValues
	},
	allowMapScripting = {
		name = "MENU_ALLOW_MP_MAP_SCRIPTING",
		hintText = "MENU_ALLOW_MP_MAP_SCRIPTING_HINT",
		labels = CoD.GameOptions.YesNoLabels,
		values = CoD.GameOptions.EnabledDisabledValues
	},
	allowProne = {
		name = "MENU_PRONE",
		hintText = "MENU_PRONE_HINT",
		labels = CoD.GameOptions.OffOnLabels,
		values = CoD.GameOptions.OffOnValues
	},
	allowSpectating = {
		name = "MENU_ALLOW_SHOUTCASTING",
		hintText = "MENU_ALLOW_SHOUTCASTING_HINT",
		labels = CoD.GameOptions.AllowedDisallowedLabels,
		values = CoD.GameOptions.AllowedDisallowedValues
	},
	autoDestroyTime = {
		name = "MENU_AUTO_DESTROY_TIME",
		hintText = "MENU_AUTO_DESTROY_TIME_HINT",
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
	bootTime = {
		setting = "bootTime",
		name = "MENU_BOOT_TIME",
		hintText = "MENU_BOOT_TIME_HINT",
		labels = {
			"MENU_OFF",
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
		hintText = "MENU_TEAM_ASSIGNMENT_HINT",
		labels = {
			"MENU_TEAM_ASSIGNMENT_CLIENT",
			"MENU_TEAM_ASSIGNMENT_HOST",
			"MENU_TEAM_ASSIGNMENT_AUTO"
		},
		values = {
			LuaEnums.TEAM_ASSIGNMENT.CLIENT,
			LuaEnums.TEAM_ASSIGNMENT.HOST,
			LuaEnums.TEAM_ASSIGNMENT.AUTO
		}
	},
	bombTimer = {
		name = "MENU_BOMB_TIMER",
		hintText = "MENU_BOMB_TIMER_HINT",
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
		hintText = "MENU_CARRIER_ARMOR_HINT",
		labels = {
			"MENU_NONE",
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
	carryScore = {
		setting = "carryScore",
		name = "MENU_CARRY_SCORE",
		hintText = "MENU_CARRY_SCORE_HINT",
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
		hintText = "MENU_DESTROY_TIME_HINT",
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
		hintText = "MENU_CAPTURE_TIME_HINT",
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
	captureTime_koth = {
		setting = "captureTime",
		name = "MENU_CAPTURE_TIME",
		hintText = "MENU_CAPTURE_TIME_HINT",
		labels = {
			"MENU_NONE",
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
		hintText = "MENU_PICKUP_TIME_HINT",
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
		hintText = "MENU_DEFUSE_TIME_HINT",
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
		hintText = "MENU_DISABLE_CAC_HINT",
		labels = CoD.GameOptions.AllowedDisallowedLabels,
		values = {
			1,
			0
		}
	},
	disableThirdPersonSpectating = {
		name = "MENU_DISABLE_THIRD_PERSON_SPECTATING",
		hintText = "MENU_DISABLE_THIRD_PERSON_SPECTATING_HINT",
		labels = CoD.GameOptions.AllowedDisallowedLabels,
		values = {
			1,
			0
		}
	},
	enemyCarrierVisible = {
		name = "MENU_ENEMY_CARRIER",
		hintText = "MENU_ENEMY_CARRIER_HINT",
		labels = {
			"MENU_NO",
			"MENU_YES",
			"MENU_DELAYED"
		},
		values = {
			0,
			1,
			2
		}
	},
	extraTime = {
		name = "MENU_EXTRA_TIME",
		hintText = "MENU_EXTRA_TIME_HINT",
		labels = {
			"MENU_NO",
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
		hintText = "MENU_FLAG_CAPTURE_CONDITION_HINT",
		labels = {
			"MENU_NONE",
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
		hintText = "MENU_FLAG_CAN_BE_NEUTRALIZED_HINT",
		labels = {
			"MENU_NO",
			"MENU_YES"
		},
		values = {
			0,
			1
		}
	},
	flagRespawnTime = {
		name = "MENU_FLAG_RESPAWN_TIME",
		hintText = "MENU_FLAG_RESPAWN_TIME_HINT",
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
		hintText = "MENU_RADAR_ALWAYS_ON_HINT",
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
	friendlyfiretype = {
		name = "MENU_FRIENDLYFIRE",
		hintText = "MENU_FRIENDLYFIRE_HINT",
		labels = {
			"MENU_OFF",
			"MENU_ON",
			"MPUI_REFLECT",
			"MENU_SHARED"
		},
		values = {
			0,
			1,
			2,
			3
		},
		shouldShow = CoD.IsGametypeTeamBased
	},
	gunSelection = {
		name = "MENU_GUNLIST",
		hintText = "MENU_GUNLIST_HINT",
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
		hintText = "MENU_SETBACK_WEAPON_HINT",
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
		hintText = "MENU_RULES_HARDCORE_HINT",
		labels = CoD.GameOptions.OffOnLabels,
		values = CoD.GameOptions.OffOnValues,
		callback = HardcoreSettingChanged
	},
	oldSchoolMode = {
		name = "MENU_RULES_OLDSCHOOL",
		hintText = "MENU_RULES_OLDSCHOOL_HINT",
		labels = CoD.GameOptions.OffOnLabels,
		values = CoD.GameOptions.OffOnValues,
		callback = OldSchoolSettingChanged
	},
	idleFlagResetTime = {
		name = "MENU_FLAG_RETURN_TIME",
		hintText = "MENU_FLAG_RETURN_TIME_HINT",
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
	idleFlagResetTime_ball = {
		setting = "idleFlagResetTime",
		name = "MENU_BALL_RETURN_TIME",
		hintText = "MENU_BALL_RETURN_TIME_HINT",
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
	loadoutKillstreaksEnabled = {
		name = "MENU_SCORESTREAKS",
		hintText = "MENU_SCORESTREAKS_HINT",
		labels = CoD.GameOptions.AllowedDisallowedLabels,
		values = CoD.GameOptions.AllowedDisallowedValues,
		shouldShow = LoadoutKillstreaksEnabledByDefault
	},
	maxAllocation = {
		name = "MENU_MAX_ALLOCATION",
		hintText = "MENU_MAX_ALLOCATION_HINT",
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
		hintText = "MENU_MULTI_BOMB_HINT",
		labels = CoD.GameOptions.YesNoLabels,
		values = CoD.GameOptions.EnabledDisabledValues
	},
	objectiveSpawnTime = {
		name = "MENU_OBJECTIVE_SPAWN_TIME",
		hintText = "MENU_OBJECTIVE_SPAWN_TIME_HINT",
		labels = {
			"MENU_NONE",
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
		hintText = "MENU_HEADSHOTSONLY_HINT",
		labels = CoD.GameOptions.YesNoLabels,
		values = CoD.GameOptions.EnabledDisabledValues
	},
	OvertimetimeLimit = {
		name = "MENU_OVERTIME_TIME_LIMIT1",
		hintText = "MENU_OVERTIME_TIME_LIMIT_HINT",
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
		hintText = "MENU_PLANT_TIME_HINT",
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
		hintText = "MENU_FORCE_RESPAWN_HINT",
		labels = CoD.GameOptions.YesNoLabels,
		values = CoD.GameOptions.EnabledDisabledValues
	},
	playerHealthRegenTime = {
		name = "MENU_HEALTH_REGENERATION",
		hintText = "MENU_HEALTH_REGENERATION_HINT",
		labels = {
			"MENU_NONE",
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
		hintText = "MENU_HEALTH_HINT",
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
		hintText = "MENU_NUMBER_OF_LIVES_HINT",
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
		hintText = "MENU_RESPAWN_DELAY_HINT",
		labels = {
			"MENU_NONE",
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
		hintText = "MENU_POINTS_FOR_SURVIVAL_BONUS_HINT",
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
		hintText = "MENU_POINTS_PER_PRIMARY_KILL_HINT",
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
		hintText = "MENU_POINTS_PER_SECONDARY_KILL_HINT",
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
		hintText = "MENU_POINTS_PER_PRIMARY_GRENADE_KILL_HINT",
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
		hintText = "MENU_POINTS_PER_MELEE_KILL_HINT",
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
		hintText = "MENU_POINTS_PER_WEAPON_KILL_HINT",
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
		hintText = "MENU_PREMATCH_TIMER_HINT",
		labels = {
			"MENU_X_SECONDS"
		},
		values = {
			15,
			30,
			45,
			60
		}
	},
	preroundperiod = {
		name = "MENU_PREROUND_TIMER",
		hintText = "MENU_PREROUND_TIMER_HINT",
		labels = {
			"MENU_OFF",
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
		hintText = "MENU_PRESET_CLASSES_PER_TEAM_HINT",
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
		hintText = "MENU_RANDOM_OBJECTIVE_LOCATIONS_HINT",
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
		hintText = "MENU_RANDOM_OBJECTIVE_LOCATIONS_HINT",
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
		hintText = "MENU_REBOOT_PLAYERS_HINT",
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
		hintText = "MENU_REBOOT_TIME_HINT",
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
		hintText = "MENU_ROBOT_SPEED_HINT",
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
	robotShield = {
		setting = "robotShield",
		name = "MENU_ROBOT_SHIELD",
		hintText = "MENU_ROBOT_SHIELD_HINT",
		labels = {
			"MENU_DISABLED",
			"MENU_ENABLED"
		},
		values = CoD.GameOptions.EnabledDisabledValues
	},
	roundLimit = {
		name = "MENU_ROUND_LIMIT1",
		hintText = "MENU_ROUND_LIMIT_HINT",
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
		name = "MENU_WIN_CONDITION",
		hintText = "MENU_WIN_CONDITION_HINT",
		labels = {
			"MENU_ROUND_WINS",
			"MENU_TOTAL_FLAG_CAPTURES"
		},
		values = CoD.GameOptions.EnabledDisabledValues,
		callback = CumulativeRoundScoresSettingChanged
	},
	roundswitch = {
		name = "MENU_ROUND_SWITCH",
		hintText = "MENU_ROUND_SWITCH_HINT",
		labels = {
			"MENU_NO",
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
		hintText = "MENU_EXPLOSIVE_DELAY_HINT",
		labels = {
			"MENU_OFF",
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
		hintText = "MENU_KILLSTREAK_DELAY_HINT",
		labels = {
			"MENU_OFF",
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
		hintText = "MENU_ROUND_WIN_LIMIT_HINT",
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
		hintText = "MENU_ROUND_WIN_LIMIT_HINT",
		labels = {
			"MENU_NO",
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
	scoreLimit = {
		name = "MENU_SCORE_LIMIT",
		hintText = "MENU_SCORE_LIMIT_OPTION",
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
		hintText = "MENU_ROUND_WIN_LIMIT_HINT",
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
		hintText = "MENU_SCORE_LIMIT_OPTION",
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
		hintText = "MENU_CAPTURE_LIMIT_HINT",
		labels = {
			"MENU_NO",
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
		hintText = "MENU_ROUND_CAPTURE_LIMIT_HINT",
		labels = {
			"MENU_NO",
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
	roundScoreLimit = {
		name = "MENU_ROUND_SCORE_LIMIT",
		hintText = "MENU_ROUND_SCORE_LIMIT_OPTION",
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
		hintText = "MENU_ROUND_SCORE_LIMIT_OPTION",
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
		hintText = "MENU_SCORING_HINT",
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
		hintText = "MENU_SETBACKS_HINT",
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
		hintText = "MENU_SETBACKS_SAS_HINT",
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
		hintText = "MENU_SHUTDOWN_DAMAGE_HINT",
		labels = {
			"MENU_UNLIMITED",
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
		hintText = "MENU_SILENT_PLANT_HINT",
		labels = CoD.GameOptions.YesNoLabels,
		values = CoD.GameOptions.EnabledDisabledValues
	},
	spawnsuicidepenalty = {
		name = "MENU_SPAWN_SUICIDE_PENALTY",
		hintText = "MENU_SPAWN_SUICIDE_PENALTY_HINT",
		labels = {
			"MENU_NONE",
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
		hintText = "MENU_SPAWN_TEAMKILLED_PENALTY_HINT",
		labels = {
			"MENU_NONE",
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
		hintText = "MENU_TEAMKILL_KICK_HINT",
		labels = {
			"MENU_OFF",
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
		shouldShow = CoD.IsGametypeTeamBased
	},
	teamScorePerDeath = {
		name = "MENU_TEAM_SCORE_PER_DEATH",
		hintText = "MENU_TEAM_SCORE_PER_DEATH_HINT",
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
		hintText = "MENU_TEAM_SCORE_PER_HEADSHOT_HINT",
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
		hintText = "MENU_TEAM_SCORE_PER_KILL_HINT",
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
		hintText = "MENU_TEAM_SCORE_PER_KILL_CONFIRMED_HINT",
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
		hintText = "MENU_TEAM_SCORE_PER_KILL_DENIED_HINT",
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
		hintText = "MENU_THROW_SCORE_HINT",
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
		hintText = "MENU_TIME_LIMIT_HINT",
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
		hintText = "MENU_ROUND_TIME_LIMIT_HINT",
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
		hintText = "MENU_TIME_PAUSE_DESC",
		labels = CoD.GameOptions.YesNoLabels,
		values = CoD.GameOptions.EnabledDisabledValues
	},
	touchReturn = {
		setting = "defuseTime",
		name = "MENU_TOUCH_RETURN",
		hintText = "MENU_TOUCH_RETURN_HINT",
		labels = {
			"MENU_OFF",
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
		hintText = "MENU_VOIP_KILLERS_HEAR_VICTIM_HINT",
		labels = CoD.GameOptions.YesNoLabels,
		values = CoD.GameOptions.EnabledDisabledValues
	},
	waveRespawnDelay = {
		name = "MENU_WAVE_SPAWN_DELAY",
		hintText = "MENU_WAVE_SPAWN_DELAY_HINT",
		labels = {
			"MENU_NONE",
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
		hintText = "MENU_SHRP_WEAPON_TIMER_HINT",
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
		hintText = "MENU_SHRP_WEAPON_NUMBER_HINT",
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
	}
}
CoD.GameOptions.GlobalSettings = {
	"allowInGameTeamChange",
	"disableThirdPersonSpectating",
	"allowMapScripting",
	"voipKillersHearVictim",
	"allowBattleChatter",
	"allowAnnouncer"
}
CoD.GameOptions.GeneralSettings = {
	"loadoutKillstreaksEnabled",
	"prematchperiod",
	"preroundperiod",
	"teamAssignment",
	"allowKillcam",
	"allowSpectating",
	"forceRadar",
	"roundStartExplosiveDelay",
	"roundStartKillstreakDelay"
}
CoD.GameOptions.HealthAndDamageSettings = {
	"playerMaxHealth",
	"playerHealthRegenTime",
	"friendlyfiretype",
	"teamKillPunishCount",
	"onlyHeadshots",
	"allowhitmarkers"
}
CoD.GameOptions.SpawnSettings = {
	"playerRespawnDelay",
	"playerForceRespawn",
	"waveRespawnDelay",
	"spawnsuicidepenalty",
	"spawnteamkilledpenalty"
}
CoD.GameOptions.CustomClassSettings = {
	"disableCAC",
	"maxAllocation"
}
CoD.GameOptions.PresetClassSettings = {
	"presetClassesPerTeam"
}
CoD.GameOptions.TopLevelGametypeSettings = {
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
		"roundLimit",
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
		"roundLimit",
		"roundScoreLimit"
	},
	escort = {
		"timeLimit",
		"scoreLimit_sd_dem"
	}
}
CoD.GameOptions.GlobalTopLevelGametypeSettings = {
	"hardcoreMode",
	"oldSchoolMode"
}
CoD.GameOptions.SubLevelGametypeSettings = {
	ball = {
		"carrierArmor",
		"carryScore",
		"throwScore",
		"enemyCarrierVisible",
		"idleFlagResetTime_ball"
	},
	conf = {
		"teamScorePerKillConfirmed",
		"teamScorePerKillDenied",
		"teamScorePerKill"
	},
	ctf = {
		"scoreLimit_ctf",
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
		"silentPlant"
	},
	dom = {
		"captureTime",
		"flagCanBeNeutralized",
		"roundswitch"
	},
	dm = {
		"teamScorePerKill",
		"teamScorePerDeath",
		"teamScorePerHeadshot",
		"playerNumLives"
	},
	escort = {
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
	hq = {
		"captureTime",
		"destroyTime",
		"autoDestroyTime",
		"objectiveSpawnTime",
		"randomObjectiveLocations"
	},
	koth = {
		"autoDestroyTime",
		"captureTime_koth",
		"objectiveSpawnTime",
		"randomObjectiveLocations_koth",
		"scorePerPlayer",
		"timePausesWhenInZone"
	},
	oic = {
		"pointsPerWeaponKill",
		"pointsPerMeleeKill",
		"pointsForSurvivalBonus"
	},
	oneflag = {
		"scoreLimit_ctf",
		"scoreLimit_ctfRound",
		"roundLimit",
		"roundWinLimit_ctf",
		"enemyCarrierVisible",
		"idleFlagResetTime",
		"captureTime_ctf",
		"flagRespawnTime"
	},
	sas = {
		"gunSelection_sas",
		"setbacks_sas",
		"pointsPerPrimaryKill",
		"pointsPerSecondaryKill",
		"pointsPerPrimaryGrenadeKill",
		"pointsPerMeleeKill"
	},
	shrp = {
		"pointsPerWeaponKill",
		"pointsPerMeleeKill",
		"weaponTimer",
		"weaponCount"
	},
	sd = {
		"bombTimer",
		"plantTime",
		"defuseTime",
		"multiBomb",
		"roundswitch",
		"silentPlant"
	},
	tdm = {
		"teamScorePerKill",
		"teamScorePerDeath",
		"teamScorePerHeadshot",
		"playerNumLives",
		"roundLimit"
	}
}
CoD.GameOptions.ShowStarForGametypeSettings = function ( button, gametypeSettings )
	for index, f8_local3 in ipairs( gametypeSettings ) do
		local settingInfo = CoD.GameOptions.GameSettings[f8_local3]
		if not settingInfo.shouldShow or settingInfo.shouldShow() then
			if settingInfo.setting then
				f8_local3 = settingInfo.setting
			end
			if not Engine.IsGametypeSettingDefault( f8_local3 ) then
				button:showStarIcon( true )
				return true
			end
		end
	end
	button:showStarIcon( false )
	return false
end

CoD.GameOptions.Button_AddChoices = function ( controller, button, strings, values )
	if strings == nil or #strings == 0 then
		return 
	end
	for index = 1, #strings, 1 do
		button:addChoice( controller, Engine.Localize( strings[index] ), values[index] )
	end
end

CoD.GameOptions.AddSelectorButtons = function ( self, controller, options, editable )
	if options == nil or #options == 0 then
		return 0
	end
	for i = 1, #options, 1 do
		local button = nil
		if options[i].hintText ~= nil then
			button = self.buttonList:addGametypeSettingLeftRightSelector( self, controller, Engine.Localize( options[i].label ), options[i].settingName, Engine.Localize( options[i].hintText ) )
		else
			button = self.buttonList:addGametypeSettingLeftRightSelector( self, controller, Engine.Localize( options[i].label ), options[i].settingName )
		end
		CoD.GameOptions.Button_AddChoices( controller, button, options[i].strings, options[i].values )
		if editable == false then
			button:disableCycling()
		end
	end
	return #options
end

CoD.GameOptions.Button_DemoRecording_AddChoices = function ( button, controller )
	local strings = {
		"MENU_DISABLED_CAPS",
		"MENU_ENABLED_CAPS"
	}
	local values = {
		0,
		1
	}
	CoD.GameOptions.Button_AddChoices( controller, button, strings, values )
end

CoD.GameOptions.Button_Bot_SelectionChanged = function ( choiceParams )
	Engine.SetDvar( choiceParams.parentSelectorButton.m_dvarName, choiceParams.value )
	local friends = Engine.DvarInt( nil, "bot_friends" )
	local enemies = Engine.DvarInt( nil, "bot_enemies" )
	local max = 11
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
		max = 9
	end
	if max < friends + enemies then
		local diff = 0
		if choiceParams.parentSelectorButton.m_dvarName == "bot_friends" and friends > 0 then
			diff = max - friends + 1
		else
			diff = max - enemies + 1
		end
		if diff > 0 then
			choiceParams.extraParams.otherButton.m_currentChoice = diff
			choiceParams.extraParams.otherButton:updateChoice()
		else
			return false
		end
	end
end

CoD.GameOptions.Button_Bots_AddChoices = function ( button, otherButton, controller, editable )
	local strings = {
		"MPUI_0_BOTS",
		"MPUI_1_BOTS",
		"MPUI_2_BOTS",
		"MPUI_3_BOTS",
		"MPUI_4_BOTS",
		"MPUI_5_BOTS",
		"MPUI_6_BOTS",
		"MPUI_7_BOTS",
		"MPUI_8_BOTS",
		"MPUI_9_BOTS",
		"MPUI_10_BOTS",
		"MPUI_11_BOTS"
	}
	local values = {
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
		11
	}
	local gameType = Engine.DvarString( nil, "ui_gameType" )
	local max = #strings
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) or gameType ~= "dm" then
		max = 10
	end
	if button.m_dvarName == "bot_friends" then
		max = 9
	end
	for index = 1, max, 1 do
		button:addChoice( controller, Engine.Localize( strings[index] ), values[index], {
			otherButton = otherButton
		}, CoD.GameOptions.Button_Bot_SelectionChanged )
	end
	if editable == false then
		button:disableCycling()
	end
end

CoD.GameOptions.Button_BotDifficulty_AddChoices = function ( button, controller, editable )
	local strings = {
		"MENU_BASICTRAINING_EASY_CAPS",
		"MENU_BASICTRAINING_NORMAL_CAPS",
		"MENU_BASICTRAINING_HARD_CAPS",
		"MENU_BASICTRAINING_FU_CAPS"
	}
	local values = {
		0,
		1,
		2,
		3
	}
	CoD.GameOptions.Button_AddChoices( controller, button, strings, values )
	if editable == false then
		button:disableCycling()
	end
end

CoD.GameOptions.AddBotSpecificOptions = function ( self, controller, editable )
	self.friendsButton = self.buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MPUI_FRIENDLY_PRACTICE_DUMMIES_CAPS" ), "bot_friends", Engine.Localize( "MENU_FRIENDLY_BOTS" ) )
	self.enemiesButton = self.buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MPUI_ENEMY_PRACTICE_DUMMIES_CAPS" ), "bot_enemies", Engine.Localize( "MENU_ENEMY_BOTS" ) )
	CoD.GameOptions.Button_Bots_AddChoices( self.friendsButton, self.enemiesButton, controller, editable )
	CoD.GameOptions.Button_Bots_AddChoices( self.enemiesButton, self.friendsButton, controller, editable )
	self.difficultyButton = self.buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_BASICTRAINING_DIFFICULTY_CAPS" ), "bot_difficulty", Engine.Localize( "MENU_BOT_DIFFICULTY" ) )
	CoD.GameOptions.Button_BotDifficulty_AddChoices( self.difficultyButton, controller )
end

CoD.GameOptions.Button_EnabledDisabled_AddChoices = function ( self, controller, label, settingName )
	local strings = {
		"MENU_DISABLED_CAPS",
		"MENU_ENABLED_CAPS"
	}
	local values = {
		0,
		1
	}
	local button = self.buttonList:addGametypeSettingLeftRightSelector( self, controller, Engine.Localize( label ), settingName )
	CoD.GameOptions.Button_AddChoices( controller, button, strings, values )
	return button
end

CoD.GameOptions.AreAnyAttachmentsRestricted = function ()
	local attachmentIndex = 1
	while true do
		local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
		if attachmentName == "" then
			
		elseif Engine.GetAttachmentAllocationCost( attachmentIndex ) >= 0 and Engine.IsAttachmentIndexRestricted( attachmentIndex ) ~= Engine.IsAttachmentIndexRestricted( attachmentIndex, true ) then
			return true
		end
		attachmentIndex = attachmentIndex + 1
	end
end

CoD.GameOptionsMenu.New = function ( controller, menuName )
	local self = CoD.Menu.New( menuName )
	self:setClass( CoD.GameOptionsMenu )
	self:setOwner( controller )
	self:addLargePopupBackground()
	self:addSelectButton()
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), menuName .. ".buttonPrompts" )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if self.id == "Menu.EditGameOptions" then
			Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, 0 )
			Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
				lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
				lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
			} )
		end
		GoBack( self, controller )
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	local infoPaneWidth = 325
	self.infoPane = LUI.UIElement.new()
	self.infoPane:setLeftRight( false, true, -infoPaneWidth + 45, 0 )
	self.infoPane:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	self:addElement( self.infoPane )
	self.infoPaneTitle = LUI.UIText.new()
	self.infoPaneTitle:setLeftRight( true, false, 0, 0 )
	self.infoPaneTitle:setTopBottom( true, false, 0, CoD.textSize.Condensed )
	self.infoPaneTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.infoPaneTitle:setTTF( "fonts/escom.ttf" )
	self.infoPane:addElement( self.infoPaneTitle )
	self.infoPaneDefaultText = LUI.UIText.new()
	self.infoPaneDefaultText:setLeftRight( true, false, 0, 0 )
	self.infoPaneDefaultText:setTopBottom( true, false, 30, 30 + CoD.textSize.Default )
	self.infoPaneDefaultText:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.infoPaneDefaultText:setTTF( "fonts/escom.ttf" )
	self.infoPane:addElement( self.infoPaneDefaultText )
	self.infoPaneDescription = LUI.UIText.new()
	self.infoPaneDescription:setupUITextUncached()
	self.infoPaneDescription:setLeftRight( true, true, 0, 0 )
	self.infoPaneDescription:setTopBottom( true, false, 70, 70 + CoD.textSize.Default )
	self.infoPaneDescription:setAlignment( LUI.Alignment.Left )
	self.infoPaneDescription:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.infoPaneDescription:setTTF( "fonts/escom.ttf" )
	self.infoPane:addElement( self.infoPaneDescription )
	local gametype = Dvar.ui_gametype:get()
	local gametypeImage = RegisterMaterial( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "image" ) )
	local iconSize = infoPaneWidth
	self.gametypeIcon = LUI.UIImage.new()
	self.gametypeIcon:setLeftRight( false, false, -iconSize / 2, iconSize / 2 )
	self.gametypeIcon:setTopBottom( false, false, -CoD.Menu.TitleHeight / 2 - iconSize / 2, -CoD.Menu.TitleHeight / 2 + iconSize / 2 )
	self.gametypeIcon:setImage( gametypeImage )
	self.gametypeIcon:setAlpha( 0.25 )
	self.infoPane:addElement( self.gametypeIcon )
	self.buttonList = CoD.ButtonList.new()
	self.buttonList:setLeftRight( true, false, 0, CoD.ButtonList.DefaultWidth )
	self.buttonList:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	self.buttonList.id = self.id .. "ButtonList"
	self.buttonList.hintText:close()
	self[self.buttonList.id] = self.buttonList
	self:addElement( self.buttonList )
	return self
end

CoD.GameOptionsMenu.addGametypeSetting = function ( self, controller, setting, forceCreation )
	local settingInfo = CoD.GameOptions.GameSettings[setting]
	if not forceCreation and settingInfo.shouldShow and not settingInfo.shouldShow() then
		return 
	elseif settingInfo.setting then
		setting = settingInfo.setting
	end
	local hintText = settingInfo.hintText
	if hintText then
		hintText = Engine.Localize( hintText )
	end
	local button = self.buttonList:addGametypeSettingLeftRightSelector( self, controller, Engine.Localize( settingInfo.name ), setting, hintText )
	for index, value in ipairs( settingInfo.values ) do
		local f21_local3 = value
		if settingInfo.labels then
			f21_local3 = settingInfo.labels[index]
			if not f21_local3 then
				f21_local3 = settingInfo.labels[#settingInfo.labels]
			end
			f21_local3 = Engine.Localize( f21_local3, value )
		end
		button:addChoice( controller, f21_local3, value, nil, settingInfo.callback )
	end
	return button
end

CoD.GameOptionsMenu.ButtonGainedFocus = function ( self, event )
	local button = event.button
	if button.labelString and (button.hintText or button.m_settingName) then
		self.infoPaneTitle:setText( button.labelString )
	else
		self.infoPaneTitle:setText( "" )
	end
	local defaultText = ""
	if button.m_settingName then
		local defaultValue = Engine.GetGametypeSetting( button.m_settingName, true )
		for index, choice in ipairs( button.m_choices ) do
			if choice.params.value == defaultValue then
				defaultText = Engine.Localize( "MENU_DEFAULT" ) .. ": " .. choice.label
				break
			end
		end
	end
	self.infoPaneDefaultText:setText( defaultText )
	if button.hintText then
		self.infoPaneDescription:setText( button.hintText )
	else
		self.infoPaneDescription:setText( "" )
	end
end

CoD.GameOptionsMenu.ButtonPromptBack = function ( self, event )
	self.buttonList:saveState()
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
	CoD.Menu.ButtonPromptBack( self, event )
end

CoD.GameOptionsMenu.RefreshSettings = function ( self, event )
	self:processEvent( {
		name = "button_update"
	} )
end

CoD.GameOptionsMenu:registerEventHandler( "button_gained_focus", CoD.GameOptionsMenu.ButtonGainedFocus )
CoD.GameOptionsMenu:registerEventHandler( "button_prompt_back", CoD.GameOptionsMenu.ButtonPromptBack )
CoD.GameOptionsMenu:registerEventHandler( "refresh_settings", CoD.GameOptionsMenu.RefreshSettings )
local BotOptions_ButtonPromptBack = function ( self, event )
	Engine.PartyHostClearUIState()
	CoD.GameOptionsMenu.ButtonPromptBack( self, event )
end

LUI.createMenu.EditBotOptions = function ( controller )
	local self = CoD.GameOptionsMenu.New( controller, "EditBotOptions" )
	self:addTitle( Engine.Localize( "MENU_SETUP_BOTS_CAPS" ) )
	local gameType = Engine.DvarString( nil, "ui_gameType" )
	if gameType ~= "dm" then
		self.friendsButton = self.buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MPUI_FRIENDLY_PRACTICE_DUMMIES_CAPS" ), "bot_friends", Engine.Localize( "MENU_FRIENDLY_BOTS" ) )
	end
	self.enemiesButton = self.buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MPUI_ENEMY_PRACTICE_DUMMIES_CAPS" ), "bot_enemies", Engine.Localize( "MENU_ENEMY_BOTS" ) )
	if gameType ~= "dm" then
		CoD.GameOptions.Button_Bots_AddChoices( self.friendsButton, self.enemiesButton, controller, true )
	end
	CoD.GameOptions.Button_Bots_AddChoices( self.enemiesButton, self.friendsButton, controller, true )
	self.difficultyButton = self.buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_BASICTRAINING_DIFFICULTY_CAPS" ), "bot_difficulty", Engine.Localize( "MENU_BOT_DIFFICULTY" ) )
	CoD.GameOptions.Button_BotDifficulty_AddChoices( self.difficultyButton, controller )
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	self:registerEventHandler( "button_prompt_back", BotOptions_ButtonPromptBack )
	return self
end

