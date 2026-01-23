CoD.ChallengesUtility = {}
CoD.ChallengesUtility.NearCompletionMaxNumChallengesShown = 10
CoD.ChallengesUtility.NearCompletionLists = {}
CoD.ChallengesUtility.GameModeIcons = {}
CoD.ChallengesUtility.GameModeIcons.CP = "uie_t7_menu_frontend_iconmodecp"
CoD.ChallengesUtility.GameModeIcons.MP = "uie_t7_menu_frontend_iconmodemp"
CoD.ChallengesUtility.GameModeIcons.ZM = "uie_t7_menu_frontend_iconmodezm"
CoD.ChallengesUtility.IndexCol = 0
CoD.ChallengesUtility.TierIdCol = 1
CoD.ChallengesUtility.TargetValCol = 2
CoD.ChallengesUtility.StatTypeCol = 3
CoD.ChallengesUtility.StatsNameCol = 4
CoD.ChallengesUtility.NameStringCol = 5
CoD.ChallengesUtility.XpEarnedCol = 6
CoD.ChallengesUtility.ChallengeStatNameCol = 10
CoD.ChallengesUtility.UnlockRankCol = 11
CoD.ChallengesUtility.UnlockPLevelCol = 14
CoD.ChallengesUtility.CategoryCol = 16
CoD.ChallengesUtility.IsMasteryCol = 18
CoD.ChallengesUtility.ChallengeCategoryTable = {
	cp = {},
	mp = {
		operations = {
			"bootcamp",
			"killer",
			"humiliation",
			"career",
			"gamevictories",
			"gameheroics"
		},
		specialist = {
			"weapons",
			"abilities",
			"killjoys"
		},
		scorestreaks = {
			"airassault",
			"groundassault",
			"support",
			"returnfire"
		},
		prestige = {
			"combathandling",
			"combatefficiency",
			"perks1",
			"perks2",
			"perks3",
			"lethals",
			"tacticals",
			"wildcards"
		}
	},
	zm = {}
}
CoD.ChallengesUtility.ChallengeCategoryValues = {
	[Enum.eModes.MODE_CAMPAIGN] = {
		missions = 0,
		tott = 1,
		career = 2
	},
	[Enum.eModes.MODE_MULTIPLAYER] = {
		bootcamp = 0,
		killer = 1,
		humiliation = 2,
		career = 3,
		gamevictories = 4,
		gameheroics = 5,
		darkops = 6,
		weapons = 7,
		abilities = 8,
		killjoys = 9,
		airassault = 10,
		groundassault = 11,
		support = 12,
		returnfire = 13,
		combathandling = 14,
		combatefficiency = 15,
		perks1 = 16,
		perks2 = 17,
		perks3 = 18,
		lethals = 19,
		tacticals = 20,
		wildcards = 21
	},
	[Enum.eModes.MODE_ZOMBIES] = {
		zombiehunter = 0,
		survivalist = 1,
		gumgobbler = 2,
		darkops = 3
	}
}
CoD.ChallengesUtility.AnimatedCallingCards = {
	t7_callingcard_zm_hunter_master = "CallingCards_ZMHunterWidget"
}
CoD.ChallengesUtility.LegendaryCallingCards = {
	t7_loot_callingcard_cartoon_bullets = true,
	t7_loot_callingcard_cartoon_raps = true,
	t7_loot_callingcard_cartoon_hcxd = true,
	t7_loot_callingcard_cartoon_wasp = true,
	t7_loot_callingcard_cartoon_uav = true,
	t7_loot_callingcard_cartoon_mothership = true,
	t7_loot_callingcard_cartoon_master = true,
	t7_loot_callingcard_haunted_ghost = true,
	t7_loot_callingcard_haunted_shade = true,
	t7_loot_callingcard_haunted_possessed = true,
	t7_loot_callingcard_haunted_leech = true,
	t7_loot_callingcard_haunted_spirit = true,
	t7_loot_callingcard_haunted_animal = true,
	t7_loot_callingcard_haunted_master = true,
	t7_loot_callingcard_luchalibre_01 = true,
	t7_loot_callingcard_luchalibre_05 = true,
	t7_loot_callingcard_luchalibre_06 = true,
	t7_loot_callingcard_luchalibre_04 = true,
	t7_loot_callingcard_luchalibre_03 = true,
	t7_loot_callingcard_luchalibre_02 = true,
	t7_loot_callingcard_luchalibre_master = true,
	t7_loot_callingcard_epicspacebattle_6 = true,
	t7_loot_callingcard_epicspacebattle_12 = true,
	t7_loot_callingcard_epicspacebattle_10 = true,
	t7_loot_callingcard_epicspacebattle_1 = true,
	t7_loot_callingcard_epicspacebattle_15 = true,
	t7_loot_callingcard_epicspacebattle_4 = true,
	t7_loot_callingcard_epicspacebattle_master = true
}
CoD.ChallengesUtility.IsLegendaryCallingCard = function ( f1_arg0 )
	if CoD.ChallengesUtility.LegendaryCallingCards[f1_arg0] then
		return true
	else
		return false
	end
end

CoD.ChallengesUtility.SetCallingCardForWidget = function ( f2_arg0, f2_arg1 )
	if CoD[f2_arg1] and CoD[f2_arg1].new then
		f2_arg0:changeFrameWidget( CoD[f2_arg1] )
	else
		if Engine.IsInGame() and (CoD.isCampaign or CoD.isZombie) then
			local f2_local0 = Engine.TableLookup( nil, CoD.backgroundsTable, 3, f2_arg1, 11 )
			if f2_local0 and f2_local0 ~= "" then
				f2_arg1 = f2_local0
			end
		end
		if CoD.ChallengesUtility.IsLegendaryCallingCard( f2_arg1 ) then
			f2_arg0:changeFrameWidget( CoD.CallingCards_LegendaryImage )
		else
			f2_arg0:changeFrameWidget( CoD.CallingCards_BasicImage )
		end
		f2_arg0.framedWidget.CardIcon:setImage( RegisterImage( f2_arg1 ) )
	end
end

CoD.ChallengesUtility.IsBackgroundLockByChallenge = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.GetChallengeInfoByEmblemOrBackingId( f3_arg0, Engine.GetEmblemBackgroundId(), 1, f3_arg1 )
	if not f3_local0 then
		return false
	else
		return f3_local0[1].isLocked
	end
end

CoD.ChallengesUtility.ResetCategoryStats = function ( f4_arg0 )
	DataSources.ChallengesCPCategoryStats.init( f4_arg0 )
	DataSources.ChallengesMPCategoryStats.init( f4_arg0 )
	DataSources.ChallengesZMCategoryStats.init( f4_arg0 )
end

CoD.ChallengesUtility.ResetNearCompletion = function ( f5_arg0 )
	for f5_local6, f5_local7 in pairs( CoD.ChallengesUtility.NearCompletionLists ) do
		for f5_local3, f5_local4 in pairs( f5_local7 ) do
			f5_local7[f5_local3] = nil
		end
		CoD.ChallengesUtility.NearCompletionLists[f5_local6] = nil
	end
	DataSources.ChallengesCPNearCompletion.init( f5_arg0 )
	DataSources.ChallengesMPNearCompletion.init( f5_arg0 )
	DataSources.ChallengesZMNearCompletion.init( f5_arg0 )
end

CoD.ChallengesUtility.GetGameModeInfo = function ()
	local f6_local0 = Engine.GetModel( Engine.GetGlobalModel(), "challengeGameMode" )
	if not f6_local0 then
		return nil
	end
	local f6_local1 = Engine.GetModelValue( f6_local0 )
	if f6_local1 ~= "cp" and f6_local1 ~= "mp" and f6_local1 ~= "zm" then
		return nil
	end
	local f6_local2 = {
		name = f6_local1,
		index = Enum.eModes.MODE_INVALID
	}
	if f6_local1 == "cp" then
		f6_local2.index = Enum.eModes.MODE_CAMPAIGN
	elseif f6_local1 == "mp" then
		f6_local2.index = Enum.eModes.MODE_MULTIPLAYER
	elseif f6_local1 == "zm" then
		f6_local2.index = Enum.eModes.MODE_ZOMBIES
	end
	return f6_local2
end

CoD.ChallengesUtility.GetChallengeTable = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	local f7_local0 = {}
	local f7_local1 = Engine.GetChallengeInfoForImages( f7_arg0, f7_arg3, f7_arg1 )
	if not f7_local1 then
		return f7_local0
	end
	local f7_local2 = Engine.GetPlayerStats( f7_arg0, CoD.STATS_LOCATION_NORMAL, f7_arg1 )
	local f7_local3 = f7_local2.PlayerStatsList.RANK.StatValue:get()
	local f7_local4 = f7_local2.PlayerStatsList.PLEVEL.StatValue:get()
	if f7_arg4 then
		table.sort( f7_local1, f7_arg4 )
	end
	for f7_local26, f7_local27 in ipairs( f7_local1 ) do
		local f7_local28 = f7_local27.challengeRow
		local f7_local29 = f7_local27.currentChallengeRow
		local f7_local30 = f7_local27.challengeCategory
		local f7_local31 = f7_local27.tableNum
		local f7_local32 = f7_local27.isLocked
		local f7_local33 = f7_local27.isMastery
		local f7_local34 = f7_local27.challengeType
		local f7_local35 = f7_local27.currChallengeStatValue
		local f7_local36 = f7_local27.imageID
		local f7_local17 = 0
		local f7_local18 = 0
		local f7_local24 = 0
		local f7_local19 = ""
		local f7_local37, f7_local20, f7_local21, f7_local25, f7_local22 = nil
		if f7_local28 ~= nil then
			local f7_local8 = "gamedata/stats/" .. f7_arg2 .. "/statsmilestones" .. f7_local31 + 1 .. ".csv"
			local f7_local9 = tonumber( Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local28, CoD.ChallengesUtility.TierIdCol ) )
			local f7_local10 = Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local28, CoD.ChallengesUtility.TargetValCol )
			local f7_local11 = Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local28, CoD.ChallengesUtility.NameStringCol )
			local f7_local12 = Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local28, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
			local f7_local13 = Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local28, CoD.ChallengesUtility.XpEarnedCol )
			local f7_local14 = Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local28, CoD.ChallengesUtility.UnlockRankCol )
			local f7_local15 = Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local28, CoD.ChallengesUtility.UnlockPLevelCol )
			local f7_local16 = CoD.GetLocalizedTierText( f7_arg0, f7_local8, f7_local28 )
			if f7_local14 ~= "" then
				f7_local17 = tonumber( f7_local14 )
			end
			if f7_local15 ~= "" then
				f7_local18 = tonumber( f7_local15 )
			end
			if f7_local34 == CoD.MILESTONE_WEAPON then
				f7_local19 = Engine.Localize( Engine.GetItemName( f7_local27.itemIndex, f7_arg1 ) )
			elseif f7_local34 == CoD.MILESTONE_GROUP then
				f7_local19 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( f7_local27.itemIndex ) )
			elseif f7_local34 == CoD.MILESTONE_ATTACHMENTS then
				f7_local19 = Engine.Localize( Engine.GetAttachmentNameByIndex( f7_local27.itemIndex ) )
			elseif f7_local34 == CoD.MILESTONE_GAMEMODE then
				f7_local19 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetGametypeName( f7_local27.itemIndex ) )
			end
			if f7_local16 ~= "" then
				f7_local20 = true
			end
			if not f7_local33 then
				if f7_local4 < f7_local18 then
					f7_local21 = true
					f7_local22 = Engine.Localize( "CLASS_PRESTIGE_UNLOCK_DESC", f7_local18 )
				elseif f7_local4 == 0 and f7_local3 < f7_local17 then
					f7_local21 = true
					f7_local22 = Engine.Localize( "MENU_UNLOCKED_AT", CoD.GetRankName( f7_local17, 0, f7_arg1 ), f7_local17 + 1 )
				end
			end
			if f7_local20 and f7_local21 then
				f7_local16 = Engine.Localize( "CHALLENGE_TIER_" .. 0 )
			end
			local f7_local23 = f7_local27.currentChallengeRow
			if f7_local23 then
				f7_local12 = Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local23, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
				if f7_local20 then
					f7_local24 = tonumber( Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local23, CoD.ChallengesUtility.TierIdCol ) )
					f7_local10 = Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local23, CoD.ChallengesUtility.TargetValCol )
					f7_local13 = Engine.TableLookupGetColumnValueForRow( f7_local8, f7_local23, CoD.ChallengesUtility.XpEarnedCol )
					f7_local16 = CoD.GetLocalizedTierText( f7_arg0, f7_local8, f7_local23 )
				end
			end
			f7_local25 = Engine.Localize( f7_local11, "", f7_local19, f7_local16 )
			if not f7_local22 then
				f7_local22 = Engine.Localize( f7_local12, f7_local10, f7_local19 )
			end
			if f7_local30 == "darkops" and f7_local32 then
				f7_local25 = Engine.Localize( "MENU_CLASSIFIED" )
				f7_local22 = Engine.Localize( "MENU_CHALLENGES_DARKOPS_LOCKED_DESC" )
			end
			table.insert( f7_local0, {
				models = {
					title = f7_local25,
					description = f7_local22,
					iconId = f7_local36,
					maxTier = f7_local9,
					currentTier = f7_local24,
					statPercent = f7_local35 / f7_local10,
					statFractionText = Engine.Localize( "MPUI_X_SLASH_Y", f7_local35, f7_local10 ),
					tierStatus = Engine.Localize( "CHALLENGE_TIER_STATUS", f7_local24 + 1, f7_local9 + 1 ),
					xp = f7_local13,
					percentComplete = f7_local35 / f7_local10,
					isLocked = f7_local32
				},
				properties = {
					isMastery = f7_local33,
					isDarkOps = f7_local30 == "darkops"
				}
			} )
		end
	end
	return f7_local0
end

DataSources.CallingCards = DataSourceHelpers.ListSetup( "CallingCards", function ( f8_arg0 )
	local f8_local0 = {}
	local f8_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	if not f8_local1 then
		return f8_local0
	end
	local f8_local2 = Engine.GetModelValue( f8_local1 )
	if not f8_local2 then
		return f8_local0
	end
	local f8_local3 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f8_local3 then
		return f8_local0
	end
	local f8_local4 = CoD.ChallengesUtility.GetChallengeTable( f8_arg0, f8_local3.index, f8_local3.name, f8_local2, function ( f9_arg0, f9_arg1 )
		return tonumber( f9_arg0.imageID ) < tonumber( f9_arg1.imageID )
	end )
	local f8_local5 = 0
	local f8_local6 = 0
	local f8_local7 = nil
	for f8_local11, f8_local12 in ipairs( f8_local4 ) do
		local f8_local13 = f8_local12.models
		if f8_local12.properties.isMastery then
			f8_local7 = f8_local12
		end
		table.insert( f8_local0, f8_local12 )
		f8_local6 = f8_local6 + 1
		if not f8_local13.isLocked then
			f8_local5 = f8_local5 + 1
		end
	end
	if f8_local7 then
		f8_local8 = f8_local7.models
		DataSources.MasterCallingCard.setModelValues( f8_arg0, f8_local8.title, f8_local8.description, f8_local8.iconId, f8_local5 / f8_local6 )
	end
	return f8_local0
end )
DataSources.CallingCardsSorted = DataSourceHelpers.ListSetup( "CallingCardsSorted", function ( f10_arg0 )
	local f10_local0 = {}
	local f10_local1 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f10_local1 then
		return f10_local0
	end
	local f10_local2 = CoD.ChallengesUtility.ChallengeCategoryValues[f10_local1.index]
	for f10_local6, f10_local7 in ipairs( CoD.ChallengesUtility.GetChallengeTable( f10_arg0, f10_local1.index, f10_local1.name, nil, function ( f11_arg0, f11_arg1 )
		if f11_arg0.isLocked ~= f11_arg1.isLocked then
			return f11_arg1.isLocked
		elseif f11_arg0.challengeCategory ~= f11_arg1.challengeCategory then
			if f10_local2[f11_arg0.challengeCategory] and f10_local2[f11_arg1.challengeCategory] then
				return f10_local2[f11_arg0.challengeCategory] < f10_local2[f11_arg1.challengeCategory]
			else
				return f10_local2[f11_arg0.challengeCategory] ~= nil
			end
		else
			return tonumber( f11_arg0.imageID ) < tonumber( f11_arg1.imageID )
		end
	end ) ) do
		local f10_local8 = f10_local7.properties
		if not f10_local8.isMastery and (not f10_local8.isDarkOps or f10_local7.models.statPercent >= 1) then
			table.insert( f10_local0, f10_local7 )
		end
	end
	return f10_local0
end )
DataSources.ChallengesNearCompletionList = DataSourceHelpers.ListSetup( "ChallengesNearCompletionList", function ( f12_arg0 )
	local f12_local0 = {}
	local f12_local1 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f12_local1 then
		return f12_local0
	end
	local f12_local2 = function ( f13_arg0, f13_arg1 )
		return tonumber( f13_arg0.imageID ) < tonumber( f13_arg1.imageID )
	end
	
	if CoD.ChallengesUtility.NearCompletionLists[f12_local1.index] ~= nil then
		return CoD.ChallengesUtility.NearCompletionLists[f12_local1.index]
	end
	local f12_local3 = CoD.ChallengesUtility.GetChallengeTable( f12_arg0, f12_local1.index, f12_local1.name, nil, f12_local2 )
	table.sort( f12_local3, function ( f14_arg0, f14_arg1 )
		if f14_arg0.models.statPercent ~= f14_arg1.models.statPercent then
			return f14_arg1.models.statPercent < f14_arg0.models.statPercent
		else
			return f14_arg0.models.iconId < f14_arg1.models.iconId
		end
	end )
	for f12_local7, f12_local8 in ipairs( f12_local3 ) do
		if not f12_local8.properties.isMastery and not f12_local8.properties.isDarkOps and f12_local8.models.statPercent < 1 then
			table.insert( f12_local0, f12_local8 )
			if CoD.ChallengesUtility.NearCompletionMaxNumChallengesShown <= #f12_local0 then
				break
			end
		end
	end
	CoD.ChallengesUtility.NearCompletionLists[f12_local1.index] = f12_local0
	return f12_local0
end )
DataSources.DarkOpsCallingCards = DataSourceHelpers.ListSetup( "DarkOpsCallingCards", function ( f15_arg0 )
	local f15_local0 = {}
	return CoD.ChallengesUtility.GetChallengeTable( f15_arg0, Enum.eModes.MODE_MULTIPLAYER, "mp", "darkops", function ( f16_arg0, f16_arg1 )
		return tonumber( f16_arg0.imageID ) < tonumber( f16_arg1.imageID )
	end
	 )
end )
DataSources.DarkOpsCallingCardsZM = DataSourceHelpers.ListSetup( "DarkOpsCallingCardsZM", function ( f17_arg0 )
	local f17_local0 = {}
	return CoD.ChallengesUtility.GetChallengeTable( f17_arg0, Enum.eModes.MODE_ZOMBIES, "zm", "darkops", function ( f18_arg0, f18_arg1 )
		return tonumber( f18_arg0.imageID ) < tonumber( f18_arg1.imageID )
	end
	 )
end )
local f0_local0 = function ( f19_arg0, f19_arg1 )
	local f19_local0, f19_local1 = Engine.GetChallengeUnlockEmblemInfo( f19_arg0, f19_arg1 )
	if f19_local0 < 0 then
		return f19_local1
	end
	local f19_local2 = "MENU_CALLING_CARD"
	local f19_local3 = CoD.backgroundsTable
	local f19_local4 = {
		11,
		3
	}
	if f19_local1 then
		f19_local3 = CoD.emblemIconsTable
		f19_local2 = "MENU_EMBLEM"
		f19_local4 = {
			3
		}
	end
	local f19_local5 = ""
	for f19_local9, f19_local10 in ipairs( f19_local4 ) do
		f19_local5 = Engine.TableLookupGetColumnValueForRow( f19_local3, f19_local0, f19_local10 )
		if f19_local5 ~= "" then
			break
		end
	end
	return f19_local1, f19_local5, f19_local2
end

CoD.ChallengesUtility.IsSpecialistTransmissionChallenge = function ( f20_arg0, f20_arg1, f20_arg2 )
	if f20_arg0 == Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST and LUI.startswith( Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f20_arg1 + 1 ), f20_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STATNAME ), "transmission" ) then
		return true
	else
		return false
	end
end

CoD.ChallengesUtility.GetChallengeRewardInfo = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4, f21_arg5 )
	local f21_local0 = CoD.getStatsMilestoneTable( f21_arg1 + 1 )
	local f21_local1 = Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STRING )
	local f21_local2 = tonumber( Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TIERID ) )
	local f21_local3 = tonumber( Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2 + 1, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TIERID ) )
	local f21_local4 = tonumber( Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TARGETVALUE ) ) or 0
	local f21_local5 = Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM )
	local f21_local6 = Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKIMAGE )
	local f21_local7 = Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKHEROITEM )
	local f21_local8 = false
	local f21_local9 = Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CATEGORY )
	local f21_local10 = tonumber( Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_XPEARNED ) )
	if f21_local2 and f21_local2 > 0 then
		f21_local8 = true
	elseif f21_local3 and f21_local3 == 1 then
		f21_local8 = true
	end
	local f21_local11 = ""
	if f21_local5 ~= "" then
		f21_local11 = f21_local1 .. "_AWARD"
	else
		f21_local11 = f21_local1
	end
	local f21_local12 = nil
	local f21_local13 = ""
	if f21_local8 == true then
		f21_local13 = Engine.Localize( "CHALLENGE_TIER_" .. f21_local2 )
		local f21_local14 = f21_arg2 + 1
		local f21_local15 = f21_local2
		while not f21_local9 or f21_local9 == "" do
			if (tonumber( Engine.TableLookupGetColumnValueForRow( f21_local0, f21_local14, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TIERID ) ) or -1) <= f21_local15 then
				break
			end
			f21_local9 = Engine.TableLookupGetColumnValueForRow( f21_local0, f21_local14, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CATEGORY )
			local f21_local16 = f21_local15
			f21_local14 = f21_local14 + 1
		end
		if not f21_local9 then
			f21_local9 = ""
		end
	end
	local f21_local14, f21_local15 = nil
	local f21_local16 = "blacktransparent"
	if CoD.isMultiplayer then
		f21_local16 = "t7_icons_challenges_mp_" .. f21_local9
	end
	if CoD.isZombie == true then
		f21_local16 = "t7_icons_challenges_zm_" .. f21_local9
		if f21_local9 == "darkops" then
			f21_local16 = "t7_icons_challenges_mp_darkops"
		end
	end
	local f21_local17 = nil
	if f21_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL then
		f21_local14 = Engine.Localize( f21_local11, f21_local4, "", f21_local13 )
		f21_local15 = Engine.Localize( f21_local1 .. "_DESC", f21_local4, "", f21_local13 )
	elseif f21_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
		local f21_local18 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( f21_arg4 ) )
		f21_local14 = Engine.Localize( f21_local1, f21_local4, f21_local18, f21_local13 )
		f21_local15 = Engine.Localize( f21_local1 .. "_DESC", f21_local4, f21_local18, f21_local13 )
	elseif f21_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GAMEMODE then
		local f21_local18 = Engine.GetCurrentGameType()
		if 0 ~= Dvar.scr_hardcore:get() then
			f21_local18 = "hc" .. f21_local18
		end
		local f21_local19 = Engine.Localize( "CHALLENGE_TYPE_" .. f21_local18 )
		f21_local14 = Engine.Localize( f21_local11, f21_local4, f21_local19, f21_local13 )
		f21_local15 = Engine.Localize( f21_local1 .. "_DESC", f21_local4, f21_local19, f21_local13 )
	elseif f21_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_WEAPON then
		local f21_local18 = Engine.GetItemName( f21_arg4 )
		f21_local14 = Engine.Localize( f21_local11, f21_local4, f21_local18, f21_local13 )
		f21_local15 = Engine.Localize( f21_local1 .. "_DESC", f21_local4, f21_local18, f21_local13 )
	elseif f21_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS then
		local f21_local18 = Engine.GetAttachmentNameByIndex( f21_arg4 )
		f21_local14 = Engine.Localize( f21_local11, f21_local4, f21_local18, f21_local13 )
		f21_local15 = Engine.Localize( f21_local1 .. "_DESC", f21_local4, f21_local18, f21_local13 )
		if f21_local5 and f21_local5 ~= "" then
			f21_local16 = "cac_mods_" .. Engine.GetAttachmentRefByIndex( f21_arg4 )
			local f21_local19 = string.sub( f21_local5, string.len( "reticle_" ) + 1 )
			local f21_local20 = Engine.TableLookup( f21_arg0, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_NAME, f21_local18, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE )
			f21_local17 = {
				displayString = Engine.Localize( "MPUI_RETICLE_" .. f21_local20 .. "_" .. f21_local19 ),
				image = f21_local20 .. "_" .. f21_local19
			}
		end
	elseif f21_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST then
		local f21_local18 = Engine.GetHeroInfo( Engine.CurrentSessionMode(), f21_arg5 )
		local f21_local19 = Engine.GetHeroBundleInfo( Engine.CurrentSessionMode(), f21_arg5 )
		f21_local14 = Engine.Localize( f21_local11, "", f21_local18.displayName )
		f21_local16 = f21_local19.challengeSpecialist
		f21_local15 = Engine.Localize( f21_local1 .. "_DESC", f21_local4, f21_local18.displayName, f21_local13 )
	end
	local f21_local18 = nil
	if LUI.startswith( f21_local5, "camo_" ) then
		local f21_local19 = Engine.TableLookup( f21_arg0, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f21_local5, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_NAME )
		f21_local14 = Engine.Localize( f21_local11, f21_local19 )
		if f21_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL then
			f21_local16 = "t7_icon_weapon_" .. f21_local5
		elseif f21_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
			f21_local16 = "t7_icon_" .. Engine.GetItemGroupByIndex( f21_arg4 ) .. "_" .. f21_local5
		else
			f21_local16 = Engine.GetItemImage( f21_arg4 ) .. "_" .. f21_local5
		end
		f21_local18 = {
			displayString = Engine.Localize( f21_local19 ),
			image = Engine.TableLookup( f21_arg0, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f21_local5, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_IMAGE ),
			camoRef = f21_local5
		}
	end
	local f21_local19 = function ( f22_arg0, f22_arg1 )
		local f22_local0
		if Engine.TableLookupGetColumnValueForRow( f22_arg0, f22_arg1, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_ISMASTERY ) ~= "1" and Engine.TableLookupGetColumnValueForRow( f22_arg0, f22_arg1, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_ISEXPERT ) ~= "1" then
			f22_local0 = false
		else
			f22_local0 = true
		end
		return f22_local0
	end
	
	local f21_local20 = nil
	if f21_arg4 then
		local f21_local21, f21_local22, f21_local23 = f0_local0( tonumber( Engine.TableLookupGetColumnValueForRow( f21_local0, f21_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX ) ), f21_arg4 )
		local f21_local24
		if f21_local21 then
			f21_local24 = ""
			if not f21_local24 then
			
			elseif f21_local22 then
				f21_local20 = {
					displayString = Engine.Localize( f21_local23 ),
					image = f21_local22,
					rewardSize = f21_local24,
					isMastery = f21_local19( f21_local0, f21_arg2 )
				}
			end
		end
		f21_local24 = "CallingCard"
	end
	local f21_local21 = f21_local6 or f21_local5 or ""
	if not f21_local20 and LUI.startswith( f21_local21, "EM_" ) then
		for f21_local30, f21_local31 in ipairs( {
			{
				table = CoD.backgroundsTable,
				title = "MENU_CALLING_CARD",
				descriptionColumn = 4,
				imageNameColumn = {
					11,
					3
				},
				rewardSize = "CallingCard"
			},
			{
				table = CoD.emblemIconsTable,
				title = "MENU_EMBLEM",
				descriptionColumn = 4,
				imageNameColumn = {
					3
				},
				rewardSize = ""
			}
		} ) do
			local f21_local29 = nil
			for f21_local26, f21_local27 in ipairs( f21_local31.imageNameColumn ) do
				f21_local29 = Engine.TableLookup( nil, f21_local31.table, f21_local31.descriptionColumn, f21_local21, f21_local27 )
				if f21_local29 and f21_local29 ~= "" then
					break
				end
			end
			if f21_local29 and f21_local29 ~= "" then
				f21_local20 = {
					displayString = Engine.Localize( f21_local21 ),
					image = f21_local29,
					rewardSize = f21_local31.rewardSize,
					isMastery = f21_local19( f21_local0, f21_arg2 )
				}
			end
		end
	end
	local f21_local22 = nil
	local f21_local23 = {
		{
			prefix = "body_",
			type = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY,
			locString = "HEROES_X_BODY"
		},
		{
			prefix = "helmet_",
			type = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET,
			locString = "HEROES_X_HELMET"
		}
	}
	if f21_local7 and f21_local7 ~= "" then
		local f21_local24 = f21_arg5 or Engine.GetEquippedHero( f21_arg0, Engine.CurrentSessionMode() )
		for f21_local29, f21_local32 in ipairs( f21_local23 ) do
			if LUI.startswith( f21_local7, f21_local32.prefix ) then
				local f21_local33 = tonumber( f21_local7:sub( f21_local32.prefix:len() + 1 ) ) - 1
				local f21_local28 = Engine.GetHeroItemInfo( Engine.CurrentSessionMode(), f21_local24, f21_local32.type, f21_local33 )
				if f21_local28 then
					f21_local22 = {
						displayString = Engine.Localize( f21_local32.locString, f21_local28.name ),
						image = f21_local28.icon,
						unlockItemIndex = f21_local33
					}
					break
				end
			end
		end
	end
	local f21_local24 = nil
	if f21_local10 and f21_local10 > 0 then
		f21_local24 = {
			displayString = Engine.Localize( "RANK_XP", f21_local10 ),
			image = "t7_hud_mp_notifications_xp_blue"
		}
	end
	return {
		challengeString = f21_local1,
		challengeAwardString = f21_local11,
		localizedTierText = f21_local13,
		titleText = f21_local14,
		subtitleText = f21_local15,
		icon = f21_local16,
		reticleInfo = f21_local17,
		camoInfo = f21_local18,
		emblemInfo = f21_local20,
		specialistInfo = f21_local22,
		xpInfo = f21_local24
	}
end

