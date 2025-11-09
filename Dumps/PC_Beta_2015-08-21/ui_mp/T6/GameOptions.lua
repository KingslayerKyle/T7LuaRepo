require( "lua.Shared.LuaEnums" )

CoD.GameOptions = {}
CoD.GameOptionsMenu = InheritFrom( CoD.Menu )
local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0.parentSelectorButton
	if f1_arg1 then
		if f1_arg0.value == 0 then
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
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( f1_arg0 )
		f1_local0:dispatchEventToParent( {
			name = "refresh_settings"
		} )
	else
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( f1_arg0 )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.parentSelectorButton
	if f2_arg1 then
		if f2_arg0.value == 0 then
			Engine.SetGametypeSetting( "playerHealthRegenTime", Engine.GetGametypeSetting( "playerHealthRegenTime", true ) )
		else
			Engine.SetGametypeSetting( "playerHealthRegenTime", 0 )
		end
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( f2_arg0 )
		f2_local0:dispatchEventToParent( {
			name = "refresh_settings"
		} )
	else
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( f2_arg0 )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0.parentSelectorButton
	if f3_arg1 then
		if f3_arg0.value == 0 then
			Engine.SetGametypeSetting( "roundLimit", 0 )
			Engine.SetGametypeSetting( "roundWinLimit", 2 )
			Engine.SetGametypeSetting( "scoreLimit", 3 )
		else
			Engine.SetGametypeSetting( "roundLimit", 2 )
			Engine.SetGametypeSetting( "roundWinLimit", 0 )
			Engine.SetGametypeSetting( "scoreLimit", 0 )
		end
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( f3_arg0 )
		f3_local0:dispatchEventToParent( {
			name = "refresh_settings"
		} )
	else
		CoD.GametypeSettingLeftRightSelector.SelectionChanged( f3_arg0 )
	end
end

local f0_local3 = function ()
	return Engine.GetGametypeSetting( "cumulativeRoundScores" ) == 1
end

local f0_local4 = function ()
	return Engine.GetGametypeSetting( "cumulativeRoundScores" ) == 0
end

local f0_local5 = function ()
	return Engine.GetGametypeSetting( "loadoutKillstreaksEnabled", true ) == 1
end

local f0_local6 = function ()
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
		callback = f0_local0
	},
	oldSchoolMode = {
		name = "MENU_RULES_OLDSCHOOL",
		hintText = "MENU_RULES_OLDSCHOOL_HINT",
		labels = CoD.GameOptions.OffOnLabels,
		values = CoD.GameOptions.OffOnValues,
		callback = f0_local1
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
		shouldShow = f0_local5
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
		shouldShow = f0_local6
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
		callback = f0_local2
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
		shouldShow = f0_local4
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
		shouldShow = f0_local3
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
		shouldShow = f0_local4
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
		shouldShow = f0_local3
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
CoD.GameOptions.ShowStarForGametypeSettings = function ( f8_arg0, f8_arg1 )
	for f8_local4, f8_local3 in ipairs( f8_arg1 ) do
		local f8_local5 = CoD.GameOptions.GameSettings[f8_local3]
		if not f8_local5.shouldShow or f8_local5.shouldShow() then
			if f8_local5.setting then
				f8_local3 = f8_local5.setting
			end
			if not Engine.IsGametypeSettingDefault( f8_local3 ) then
				f8_arg0:showStarIcon( true )
				return true
			end
		end
	end
	f8_arg0:showStarIcon( false )
	return false
end

CoD.GameOptions.Button_AddChoices = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	if f9_arg2 == nil or #f9_arg2 == 0 then
		return 
	end
	for f9_local0 = 1, #f9_arg2, 1 do
		f9_arg1:addChoice( f9_arg0, Engine.Localize( f9_arg2[f9_local0] ), f9_arg3[f9_local0] )
	end
end

CoD.GameOptions.AddSelectorButtons = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	if f10_arg2 == nil or #f10_arg2 == 0 then
		return 0
	end
	for f10_local0 = 1, #f10_arg2, 1 do
		local f10_local3 = nil
		if f10_arg2[f10_local0].hintText ~= nil then
			f10_local3 = f10_arg0.buttonList:addGametypeSettingLeftRightSelector( f10_arg0, f10_arg1, Engine.Localize( f10_arg2[f10_local0].label ), f10_arg2[f10_local0].settingName, Engine.Localize( f10_arg2[f10_local0].hintText ) )
		else
			f10_local3 = f10_arg0.buttonList:addGametypeSettingLeftRightSelector( f10_arg0, f10_arg1, Engine.Localize( f10_arg2[f10_local0].label ), f10_arg2[f10_local0].settingName )
		end
		CoD.GameOptions.Button_AddChoices( f10_arg1, f10_local3, f10_arg2[f10_local0].strings, f10_arg2[f10_local0].values )
		if f10_arg3 == false then
			f10_local3:disableCycling()
		end
	end
	return #f10_arg2
end

CoD.GameOptions.Button_DemoRecording_AddChoices = function ( f11_arg0, f11_arg1 )
	CoD.GameOptions.Button_AddChoices( f11_arg1, f11_arg0, {
		"MENU_DISABLED_CAPS",
		"MENU_ENABLED_CAPS"
	}, {
		0,
		1
	} )
end

CoD.GameOptions.Button_Bot_SelectionChanged = function ( f12_arg0 )
	Engine.SetDvar( f12_arg0.parentSelectorButton.m_dvarName, f12_arg0.value )
	local f12_local0 = Engine.DvarInt( nil, "bot_friends" )
	local f12_local1 = Engine.DvarInt( nil, "bot_enemies" )
	local f12_local2 = 11
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
		f12_local2 = 9
	end
	if f12_local2 < f12_local0 + f12_local1 then
		local f12_local3 = 0
		if f12_arg0.parentSelectorButton.m_dvarName == "bot_friends" and f12_local0 > 0 then
			f12_local3 = f12_local2 - f12_local0 + 1
		else
			f12_local3 = f12_local2 - f12_local1 + 1
		end
		if f12_local3 > 0 then
			f12_arg0.extraParams.otherButton.m_currentChoice = f12_local3
			f12_arg0.extraParams.otherButton:updateChoice()
		else
			return false
		end
	end
end

CoD.GameOptions.Button_Bots_AddChoices = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	local f13_local0 = {
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
	local f13_local1 = {
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
	local f13_local2 = Engine.DvarString( nil, "ui_gameType" )
	local f13_local3 = #f13_local0
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) or f13_local2 ~= "dm" then
		f13_local3 = 10
	end
	if f13_arg0.m_dvarName == "bot_friends" then
		f13_local3 = 9
	end
	for f13_local4 = 1, f13_local3, 1 do
		f13_arg0:addChoice( f13_arg2, Engine.Localize( f13_local0[f13_local4] ), f13_local1[f13_local4], {
			otherButton = f13_arg1
		}, CoD.GameOptions.Button_Bot_SelectionChanged )
	end
	if f13_arg3 == false then
		f13_arg0:disableCycling()
	end
end

CoD.GameOptions.Button_BotDifficulty_AddChoices = function ( f14_arg0, f14_arg1, f14_arg2 )
	CoD.GameOptions.Button_AddChoices( f14_arg1, f14_arg0, {
		"MENU_BASICTRAINING_EASY_CAPS",
		"MENU_BASICTRAINING_NORMAL_CAPS",
		"MENU_BASICTRAINING_HARD_CAPS",
		"MENU_BASICTRAINING_FU_CAPS"
	}, {
		0,
		1,
		2,
		3
	} )
	if f14_arg2 == false then
		f14_arg0:disableCycling()
	end
end

CoD.GameOptions.AddBotSpecificOptions = function ( f15_arg0, f15_arg1, f15_arg2 )
	f15_arg0.friendsButton = f15_arg0.buttonList:addDvarLeftRightSelector( f15_arg1, Engine.Localize( "MPUI_FRIENDLY_PRACTICE_DUMMIES_CAPS" ), "bot_friends", Engine.Localize( "MENU_FRIENDLY_BOTS" ) )
	f15_arg0.enemiesButton = f15_arg0.buttonList:addDvarLeftRightSelector( f15_arg1, Engine.Localize( "MPUI_ENEMY_PRACTICE_DUMMIES_CAPS" ), "bot_enemies", Engine.Localize( "MENU_ENEMY_BOTS" ) )
	CoD.GameOptions.Button_Bots_AddChoices( f15_arg0.friendsButton, f15_arg0.enemiesButton, f15_arg1, f15_arg2 )
	CoD.GameOptions.Button_Bots_AddChoices( f15_arg0.enemiesButton, f15_arg0.friendsButton, f15_arg1, f15_arg2 )
	f15_arg0.difficultyButton = f15_arg0.buttonList:addDvarLeftRightSelector( f15_arg1, Engine.Localize( "MENU_BASICTRAINING_DIFFICULTY_CAPS" ), "bot_difficulty", Engine.Localize( "MENU_BOT_DIFFICULTY" ) )
	CoD.GameOptions.Button_BotDifficulty_AddChoices( f15_arg0.difficultyButton, f15_arg1 )
end

CoD.GameOptions.Button_EnabledDisabled_AddChoices = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
	local f16_local0 = {
		"MENU_DISABLED_CAPS",
		"MENU_ENABLED_CAPS"
	}
	local f16_local1 = {
		0,
		1
	}
	local f16_local2 = f16_arg0.buttonList:addGametypeSettingLeftRightSelector( f16_arg0, f16_arg1, Engine.Localize( f16_arg2 ), f16_arg3 )
	CoD.GameOptions.Button_AddChoices( f16_arg1, f16_local2, f16_local0, f16_local1 )
	return f16_local2
end

CoD.GameOptions.AreAnyAttachmentsRestricted = function ()
	local f17_local0 = 1
	while true do
		if Engine.GetAttachmentNameByIndex( f17_local0 ) == "" then
			
		elseif Engine.GetAttachmentAllocationCost( f17_local0 ) >= 0 and Engine.IsAttachmentIndexRestricted( f17_local0 ) ~= Engine.IsAttachmentIndexRestricted( f17_local0, true ) then
			return true
		end
		f17_local0 = f17_local0 + 1
	end
end

CoD.GameOptionsMenu.New = function ( f18_arg0, f18_arg1 )
	local f18_local0 = CoD.Menu.New( f18_arg1 )
	f18_local0:setClass( CoD.GameOptionsMenu )
	f18_local0:setOwner( f18_arg0 )
	f18_local0:addLargePopupBackground()
	f18_local0:addSelectButton()
	f18_local0.buttonModel = Engine.CreateModel( Engine.GetModelForController( f18_arg0 ), f18_arg1 .. ".buttonPrompts" )
	f18_local0:AddButtonCallbackFunction( f18_local0, f18_arg0, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if f18_local0.id == "Menu.EditGameOptions" then
			Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, 0 )
			Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
				lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
				lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
			} )
		end
		GoBack( f18_local0, controller )
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	CoD.Menu.AddNavigationHandler( f18_local0, f18_local0, f18_arg0 )
	local f18_local1 = 325
	f18_local0.infoPane = LUI.UIElement.new()
	f18_local0.infoPane:setLeftRight( false, true, -f18_local1 + 45, 0 )
	f18_local0.infoPane:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	f18_local0:addElement( f18_local0.infoPane )
	f18_local0.infoPaneTitle = LUI.UIText.new()
	f18_local0.infoPaneTitle:setLeftRight( true, false, 0, 0 )
	f18_local0.infoPaneTitle:setTopBottom( true, false, 0, CoD.textSize.Condensed )
	f18_local0.infoPaneTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f18_local0.infoPaneTitle:setTTF( "fonts/escom.ttf" )
	f18_local0.infoPane:addElement( f18_local0.infoPaneTitle )
	f18_local0.infoPaneDefaultText = LUI.UIText.new()
	f18_local0.infoPaneDefaultText:setLeftRight( true, false, 0, 0 )
	f18_local0.infoPaneDefaultText:setTopBottom( true, false, 30, 30 + CoD.textSize.Default )
	f18_local0.infoPaneDefaultText:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f18_local0.infoPaneDefaultText:setTTF( "fonts/escom.ttf" )
	f18_local0.infoPane:addElement( f18_local0.infoPaneDefaultText )
	f18_local0.infoPaneDescription = LUI.UIText.new()
	f18_local0.infoPaneDescription:setupUITextUncached()
	f18_local0.infoPaneDescription:setLeftRight( true, true, 0, 0 )
	f18_local0.infoPaneDescription:setTopBottom( true, false, 70, 70 + CoD.textSize.Default )
	f18_local0.infoPaneDescription:setAlignment( LUI.Alignment.Left )
	f18_local0.infoPaneDescription:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f18_local0.infoPaneDescription:setTTF( "fonts/escom.ttf" )
	f18_local0.infoPane:addElement( f18_local0.infoPaneDescription )
	local f18_local2 = RegisterMaterial( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Dvar.ui_gametype:get(), "image" ) )
	local f18_local3 = f18_local1
	f18_local0.gametypeIcon = LUI.UIImage.new()
	f18_local0.gametypeIcon:setLeftRight( false, false, -f18_local3 / 2, f18_local3 / 2 )
	f18_local0.gametypeIcon:setTopBottom( false, false, -CoD.Menu.TitleHeight / 2 - f18_local3 / 2, -CoD.Menu.TitleHeight / 2 + f18_local3 / 2 )
	f18_local0.gametypeIcon:setImage( f18_local2 )
	f18_local0.gametypeIcon:setAlpha( 0.25 )
	f18_local0.infoPane:addElement( f18_local0.gametypeIcon )
	f18_local0.buttonList = CoD.ButtonList.new()
	f18_local0.buttonList:setLeftRight( true, false, 0, CoD.ButtonList.DefaultWidth )
	f18_local0.buttonList:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	f18_local0.buttonList.id = f18_local0.id .. "ButtonList"
	f18_local0.buttonList.hintText:close()
	f18_local0[f18_local0.buttonList.id] = f18_local0.buttonList
	f18_local0:addElement( f18_local0.buttonList )
	return f18_local0
end

CoD.GameOptionsMenu.addGametypeSetting = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
	local f21_local0 = CoD.GameOptions.GameSettings[f21_arg2]
	if not f21_arg3 and f21_local0.shouldShow and not f21_local0.shouldShow() then
		return 
	elseif f21_local0.setting then
		f21_arg2 = f21_local0.setting
	end
	local f21_local1 = f21_local0.hintText
	if f21_local1 then
		f21_local1 = Engine.Localize( f21_local1 )
	end
	local f21_local2 = f21_arg0.buttonList:addGametypeSettingLeftRightSelector( f21_arg0, f21_arg1, Engine.Localize( f21_local0.name ), f21_arg2, f21_local1 )
	for f21_local7, f21_local8 in ipairs( f21_local0.values ) do
		local f21_local6 = f21_local8
		if f21_local0.labels then
			f21_local6 = f21_local0.labels[f21_local7]
			if not f21_local6 then
				f21_local6 = f21_local0.labels[#f21_local0.labels]
			end
			f21_local6 = Engine.Localize( f21_local6, f21_local8 )
		end
		f21_local2:addChoice( f21_arg1, f21_local6, f21_local8, nil, f21_local0.callback )
	end
	return f21_local2
end

CoD.GameOptionsMenu.ButtonGainedFocus = function ( f22_arg0, f22_arg1 )
	local f22_local0 = f22_arg1.button
	if f22_local0.labelString and (f22_local0.hintText or f22_local0.m_settingName) then
		f22_arg0.infoPaneTitle:setText( f22_local0.labelString )
	else
		f22_arg0.infoPaneTitle:setText( "" )
	end
	local f22_local1 = ""
	if f22_local0.m_settingName then
		local f22_local2 = Engine.GetGametypeSetting( f22_local0.m_settingName, true )
		for f22_local6, f22_local7 in ipairs( f22_local0.m_choices ) do
			if f22_local7.params.value == f22_local2 then
				f22_local1 = Engine.Localize( "MENU_DEFAULT" ) .. ": " .. f22_local7.label
				break
			end
		end
	end
	f22_arg0.infoPaneDefaultText:setText( f22_local1 )
	if f22_local0.hintText then
		f22_arg0.infoPaneDescription:setText( f22_local0.hintText )
	else
		f22_arg0.infoPaneDescription:setText( "" )
	end
end

CoD.GameOptionsMenu.ButtonPromptBack = function ( f23_arg0, f23_arg1 )
	f23_arg0.buttonList:saveState()
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
	CoD.Menu.ButtonPromptBack( f23_arg0, f23_arg1 )
end

CoD.GameOptionsMenu.RefreshSettings = function ( f24_arg0, f24_arg1 )
	f24_arg0:processEvent( {
		name = "button_update"
	} )
end

CoD.GameOptionsMenu:registerEventHandler( "button_gained_focus", CoD.GameOptionsMenu.ButtonGainedFocus )
CoD.GameOptionsMenu:registerEventHandler( "button_prompt_back", CoD.GameOptionsMenu.ButtonPromptBack )
CoD.GameOptionsMenu:registerEventHandler( "refresh_settings", CoD.GameOptionsMenu.RefreshSettings )
local f0_local7 = function ( f25_arg0, f25_arg1 )
	Engine.PartyHostClearUIState()
	CoD.GameOptionsMenu.ButtonPromptBack( f25_arg0, f25_arg1 )
end

LUI.createMenu.EditBotOptions = function ( f26_arg0 )
	local f26_local0 = CoD.GameOptionsMenu.New( f26_arg0, "EditBotOptions" )
	f26_local0:addTitle( Engine.Localize( "MENU_SETUP_BOTS_CAPS" ) )
	local f26_local1 = Engine.DvarString( nil, "ui_gameType" )
	if f26_local1 ~= "dm" then
		f26_local0.friendsButton = f26_local0.buttonList:addDvarLeftRightSelector( f26_arg0, Engine.Localize( "MPUI_FRIENDLY_PRACTICE_DUMMIES_CAPS" ), "bot_friends", Engine.Localize( "MENU_FRIENDLY_BOTS" ) )
	end
	f26_local0.enemiesButton = f26_local0.buttonList:addDvarLeftRightSelector( f26_arg0, Engine.Localize( "MPUI_ENEMY_PRACTICE_DUMMIES_CAPS" ), "bot_enemies", Engine.Localize( "MENU_ENEMY_BOTS" ) )
	if f26_local1 ~= "dm" then
		CoD.GameOptions.Button_Bots_AddChoices( f26_local0.friendsButton, f26_local0.enemiesButton, f26_arg0, true )
	end
	CoD.GameOptions.Button_Bots_AddChoices( f26_local0.enemiesButton, f26_local0.friendsButton, f26_arg0, true )
	f26_local0.difficultyButton = f26_local0.buttonList:addDvarLeftRightSelector( f26_arg0, Engine.Localize( "MENU_BASICTRAINING_DIFFICULTY_CAPS" ), "bot_difficulty", Engine.Localize( "MENU_BOT_DIFFICULTY" ) )
	CoD.GameOptions.Button_BotDifficulty_AddChoices( f26_local0.difficultyButton, f26_arg0 )
	if not f26_local0.buttonList:restoreState() then
		f26_local0.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	f26_local0:registerEventHandler( "button_prompt_back", f0_local7 )
	return f26_local0
end

