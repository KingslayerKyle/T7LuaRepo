-- 2b3bc205e48cba1bd9b0d10739e6ba43
-- This hash is used for caching, delete to decompile the file again

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
CoD.ChallengesUtility.VialsEarnedCol = 24
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
		wildcards = 21,
		arenavet = 22,
		onehundredpercent = 23
	},
	[Enum.eModes.MODE_ZOMBIES] = {
		zombiehunter = 0,
		survivalist = 1,
		gumgobbler = 2,
		darkops = 3
	}
}
CoD.ChallengesUtility.SpecialContractCategories = {
	"specialcontract",
	"mp_action"
}
CoD.ChallengesUtility.AnimatedCallingCards = {
	t7_callingcard_zm_hunter_master = "CallingCards_ZMHunterWidget"
}
CoD.ChallengesUtility.IsLegendaryCallingCard = function ( f1_arg0 )
	return CoD.BlackMarketUtility.GetRarityTypeForLootItemFromName( f1_arg0 ) == "legendary"
end

CoD.ChallengesUtility.SetCallingCardForWidget = function ( f2_arg0, f2_arg1, f2_arg2 )
	if CoD[f2_arg1] and CoD[f2_arg1].new and f2_arg2 ~= "Menu.PersonalDataVaultMenu" then
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

CoD.ChallengesUtility.GetLocalizedNameAndDescriptionForChallengeInfo = function ( f7_arg0 )
	local f7_local0 = "mp"
	if f7_arg0.mode == Enum.eModes.MODE_CAMPAIGN then
		f7_local0 = "cp"
	elseif f7_arg0.mode == Enum.eModes.MODE_ZOMBIES then
		f7_local0 = "zm"
	end
	local f7_local1 = "gamedata/stats/" .. f7_local0 .. "/statsmilestones" .. f7_arg0.tableNum + 1 .. ".csv"
	local f7_local2 = Engine.TableLookupGetColumnValueForRow( f7_local1, f7_arg0.challengeRow, CoD.ChallengesUtility.NameStringCol )
	local f7_local3 = f7_local2 .. "_DESC"
	if Engine.TableLookupGetColumnValueForRow( f7_local1, f7_arg0.challengeRow, CoD.ChallengesUtility.CategoryCol ) == "sidebet" then
		f7_local2 = Engine.TableLookupGetColumnValueForRow( f7_local1, f7_arg0.challengeRow, 12 )
	end
	local f7_local4 = ""
	if f7_arg0.challengeType == CoD.MILESTONE_WEAPON then
		f7_local4 = Engine.Localize( Engine.GetItemName( f7_arg0.itemIndex, f7_arg0.mode ) )
	elseif f7_arg0.challengeType == CoD.MILESTONE_GROUP then
		f7_local4 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( f7_arg0.itemIndex ) )
	elseif f7_arg0.challengeType == CoD.MILESTONE_ATTACHMENTS then
		f7_local4 = Engine.Localize( Engine.GetAttachmentNameByIndex( f7_arg0.itemIndex ) )
	elseif f7_arg0.challengeType == CoD.MILESTONE_GAMEMODE then
		f7_local4 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetGametypeName( f7_arg0.itemIndex ) )
	end
	local f7_local5 = CoD.GetLocalizedTierText( f7_local1, f7_arg0.challengeRow )
	local f7_local6 = Engine.TableLookupGetColumnValueForRow( f7_local1, f7_arg0.challengeRow, CoD.ChallengesUtility.TargetValCol )
	local f7_local7 = Engine.Localize( f7_local2, "", f7_local4, f7_local5 )
	local f7_local8 = Engine.Localize( f7_local3, f7_local6, f7_local4 )
	if CoD.ChallengesUtility.IsSpecialContractChallenge( f7_arg0.challengeType, f7_arg0.tableNum, f7_arg0.challengeRow ) then
		f7_local7 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f7_arg0.tableNum + 1, f7_arg0.mode ), f7_arg0.challengeRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKIMAGE ) )
		f7_local8 = Engine.Localize( "MENU_UNLOCKED_BY_SPECIAL_CONTRACT" )
	end
	return f7_local7, f7_local8
end

CoD.ChallengesUtility.GetChallengeTable = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5 )
	local f8_local0 = {}
	local f8_local1 = Engine.GetChallengeInfoForImages( f8_arg0, f8_arg3, f8_arg1 )
	if not f8_local1 then
		return f8_local0
	end
	local f8_local2 = Engine.GetPlayerStats( f8_arg0, CoD.STATS_LOCATION_NORMAL, f8_arg1 )
	local f8_local3 = f8_local2.PlayerStatsList.RANK.StatValue:get()
	local f8_local4 = f8_local2.PlayerStatsList.PLEVEL.StatValue:get()
	if f8_arg4 then
		table.sort( f8_local1, f8_arg4 )
	end
	for f8_local27, f8_local28 in ipairs( f8_local1 ) do
		local f8_local29 = f8_local28.challengeRow
		local f8_local30 = f8_local28.currentChallengeRow
		local f8_local31 = f8_local28.challengeCategory
		local f8_local32 = f8_local28.tableNum
		local f8_local33 = f8_local28.isLocked
		local f8_local34 = f8_local28.isMastery
		local f8_local35 = f8_local28.challengeType
		local f8_local36 = f8_local28.currChallengeStatValue
		local f8_local37 = f8_local28.imageID
		local f8_local18 = 0
		local f8_local19 = 0
		local f8_local25 = 0
		local f8_local20 = ""
		local f8_local38, f8_local21, f8_local22, f8_local26, f8_local23 = nil
		if f8_local29 ~= nil and (not f8_arg5 or CoD.ChallengesUtility.ChallengeCategoryValues[f8_arg1][f8_local31] ~= nil) then
			local f8_local8 = "gamedata/stats/" .. f8_arg2 .. "/statsmilestones" .. f8_local32 + 1 .. ".csv"
			local f8_local9 = tonumber( Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local29, CoD.ChallengesUtility.TierIdCol ) )
			local f8_local10 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local29, CoD.ChallengesUtility.TargetValCol )
			local f8_local11 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local29, CoD.ChallengesUtility.NameStringCol )
			local f8_local12 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local29, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
			local f8_local13 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local29, CoD.ChallengesUtility.XpEarnedCol )
			local f8_local14 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local29, CoD.ChallengesUtility.UnlockRankCol )
			local f8_local15 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local29, CoD.ChallengesUtility.UnlockPLevelCol )
			local f8_local16 = CoD.GetLocalizedTierText( f8_local8, f8_local29 )
			local f8_local17 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local29, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_ISEXPERT ) == "1"
			if f8_local14 ~= "" then
				f8_local18 = tonumber( f8_local14 )
			end
			if f8_local15 ~= "" then
				f8_local19 = tonumber( f8_local15 )
			end
			if f8_local35 == CoD.MILESTONE_WEAPON then
				f8_local20 = Engine.Localize( Engine.GetItemName( f8_local28.itemIndex, f8_arg1 ) )
			elseif f8_local35 == CoD.MILESTONE_GROUP then
				f8_local20 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( f8_local28.itemIndex ) )
			elseif f8_local35 == CoD.MILESTONE_ATTACHMENTS then
				f8_local20 = Engine.Localize( Engine.GetAttachmentNameByIndex( f8_local28.itemIndex ) )
			elseif f8_local35 == CoD.MILESTONE_GAMEMODE then
				f8_local20 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetGametypeName( f8_local28.itemIndex ) )
			end
			if f8_local16 ~= "" then
				f8_local21 = true
			end
			if not f8_local34 then
				if f8_local4 < f8_local19 then
					f8_local22 = true
					f8_local23 = Engine.Localize( "CLASS_PRESTIGE_UNLOCK_DESC", f8_local19 )
				elseif f8_local4 == 0 and f8_local3 < f8_local18 then
					f8_local22 = true
					f8_local23 = Engine.Localize( "MENU_UNLOCKED_AT", CoD.GetRankName( f8_local18, 0, f8_arg1 ), f8_local18 + 1 )
				end
			end
			if f8_local21 and f8_local22 then
				f8_local16 = Engine.Localize( "CHALLENGE_TIER_" .. 0 )
			end
			local f8_local24 = f8_local28.currentChallengeRow
			if f8_local24 then
				f8_local12 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local24, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
				if f8_local21 then
					f8_local25 = tonumber( Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local24, CoD.ChallengesUtility.TierIdCol ) )
					f8_local10 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local24, CoD.ChallengesUtility.TargetValCol )
					f8_local13 = Engine.TableLookupGetColumnValueForRow( f8_local8, f8_local24, CoD.ChallengesUtility.XpEarnedCol )
					f8_local16 = CoD.GetLocalizedTierText( f8_local8, f8_local24 )
				end
			end
			f8_local26 = Engine.Localize( f8_local11, "", f8_local20, f8_local16 )
			if not f8_local23 then
				f8_local23 = Engine.Localize( f8_local12, f8_local10, f8_local20 )
			end
			if f8_local31 == "darkops" and f8_local33 then
				f8_local26 = Engine.Localize( "MENU_CLASSIFIED" )
				f8_local23 = Engine.Localize( "MENU_CHALLENGES_DARKOPS_LOCKED_DESC" )
			end
			table.insert( f8_local0, {
				models = {
					title = f8_local26,
					description = f8_local23,
					iconId = f8_local37,
					maxTier = f8_local9,
					currentTier = f8_local25,
					statPercent = f8_local36 / f8_local10,
					statFractionText = Engine.Localize( "MPUI_X_SLASH_Y", f8_local36, f8_local10 ),
					tierStatus = Engine.Localize( "CHALLENGE_TIER_STATUS", f8_local25 + 1, f8_local9 + 1 ),
					xp = f8_local13,
					percentComplete = f8_local36 / f8_local10,
					isLocked = f8_local33,
					hideProgress = false
				},
				properties = {
					isMastery = f8_local34,
					isDarkOps = f8_local31 == "darkops",
					isExpert = f8_local17
				}
			} )
		end
	end
	return f8_local0
end

CoD.ChallengesUtility.GetDailyChallenge = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = "zm"
	if f9_arg1 == Enum.eModes.MODE_MULTIPLAYER then
		f9_local0 = "mp"
	end
	if not IsLive() or Mods_IsUsingMods() then
		return nil
	end
	local f9_local1 = Engine.GetPlayerStats( f9_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
	local f9_local2 = f9_local1.PlayerStatsList.ZM_CURRENT_DAILY_CHALLENGE.statValue:get()
	if f9_arg2 then
		f9_local2 = f9_arg2
	end
	local f9_local3 = Engine.GetDailyChallengeInfo( f9_arg0, f9_arg1, f9_local2 )
	if f9_local3[1] ~= nil then
		local f9_local4 = f9_local3[1].challengeRow
		local f9_local5 = "gamedata/stats/" .. f9_local0 .. "/statsmilestones" .. f9_local3[1].tableNum + 1 .. ".csv"
		local f9_local6 = tonumber( Engine.TableLookupGetColumnValueForRow( f9_local5, f9_local4, CoD.ChallengesUtility.TierIdCol ) )
		local f9_local7 = Engine.TableLookupGetColumnValueForRow( f9_local5, f9_local4, CoD.ChallengesUtility.TargetValCol )
		local f9_local8 = Engine.TableLookupGetColumnValueForRow( f9_local5, f9_local4, CoD.ChallengesUtility.NameStringCol )
		local f9_local9 = Engine.TableLookupGetColumnValueForRow( f9_local5, f9_local4, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
		local f9_local10 = Engine.TableLookupGetColumnValueForRow( f9_local5, f9_local4, CoD.ChallengesUtility.XpEarnedCol )
		local f9_local11 = Engine.TableLookupGetColumnValueForRow( f9_local5, f9_local4, CoD.ChallengesUtility.VialsEarnedCol )
		local f9_local12 = f9_local3[1].currChallengeStatValue / f9_local7
		f9_local3[1].maxChallengeTier = f9_local6
		f9_local3[1].targetVal = tonumber( f9_local7 )
		f9_local3[1].challengeName = Engine.Localize( f9_local8 )
		f9_local3[1].challengeDescription = Engine.Localize( f9_local9, f9_local7 )
		f9_local3[1].xpReward = f9_local10
		f9_local3[1].vialReward = f9_local11
		f9_local3[1].percentComplete = f9_local12
		if f9_local11 and f9_local11 ~= "" then
			local f9_local13 = "uie_t7_hud_zm_vial_256"
			if IsZMDoubleVialActive( f9_arg0 ) then
				f9_local13 = "uie_t7_icon_zm_double_vial_backer"
				f9_local3[1].vialReward = tonumber( f9_local3[1].vialReward ) * Engine.GetZMVialScale( f9_arg0 )
			end
			f9_local3[1].image = f9_local13
			f9_local3[1].rewardText = Engine.Localize( "ZMUI_BGB_TOKENS_GAINED_REWARD", f9_local3[1].vialReward )
		else
			f9_local3[1].image = "t7_hud_mp_notifications_xp_blue"
			f9_local3[1].rewardText = Engine.Localize( "CHALLENGE_UNLOCK_REWARD", f9_local3[1].xpReward )
		end
		return f9_local3[1]
	end
	return nil
end

CoD.ChallengesUtility.UpdateDailyChallengeModel = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = CoD.ChallengesUtility.GetDailyChallenge( f10_arg0, f10_arg2, f10_arg3 )
	if not f10_local0 then
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "description" ), "" )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "fractionText" ), "0/1" )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "image" ), "" )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "progressPercentage" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "rewardText" ), "" )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "title" ), "" )
		return 
	else
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "description" ), f10_local0.challengeDescription )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "fractionText" ), Engine.Localize( "MPUI_X_SLASH_Y", f10_local0.currChallengeStatValue, f10_local0.targetVal ) )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "image" ), f10_local0.image )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "progressPercentage" ), f10_local0.percentComplete )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "rewardText" ), f10_local0.rewardText )
		Engine.SetModelValue( Engine.CreateModel( f10_arg1, "title" ), f10_local0.challengeName )
	end
end

DataSources.CallingCards = DataSourceHelpers.ListSetup( "CallingCards", function ( f11_arg0 )
	local f11_local0 = {}
	local f11_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	if not f11_local1 then
		return f11_local0
	end
	local f11_local2 = Engine.GetModelValue( f11_local1 )
	if not f11_local2 then
		return f11_local0
	end
	local f11_local3 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f11_local3 then
		return f11_local0
	end
	local f11_local4 = CoD.ChallengesUtility.GetChallengeTable( f11_arg0, f11_local3.index, f11_local3.name, f11_local2, function ( f12_arg0, f12_arg1 )
		return tonumber( f12_arg0.imageID ) < tonumber( f12_arg1.imageID )
	end, true )
	local f11_local5 = 0
	local f11_local6 = 0
	local f11_local7 = nil
	for f11_local11, f11_local12 in ipairs( f11_local4 ) do
		local f11_local13 = f11_local12.models
		if f11_local12.properties.isMastery then
			f11_local7 = f11_local12
		end
		table.insert( f11_local0, f11_local12 )
		f11_local6 = f11_local6 + 1
		if not f11_local13.isLocked then
			f11_local5 = f11_local5 + 1
		end
	end
	if f11_local7 then
		f11_local8 = f11_local7.models
		DataSources.MasterCallingCard.setModelValues( f11_arg0, f11_local8.title, f11_local8.description, f11_local8.iconId, f11_local5 / f11_local6 )
	end
	return f11_local0
end, true )
DataSources.CallingCardsSorted = DataSourceHelpers.ListSetup( "CallingCardsSorted", function ( f13_arg0 )
	local f13_local0 = {}
	local f13_local1 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f13_local1 then
		return f13_local0
	end
	local f13_local2 = CoD.ChallengesUtility.ChallengeCategoryValues[f13_local1.index]
	local f13_local3 = function ( f14_arg0, f14_arg1 )
		if f14_arg0.isLocked ~= f14_arg1.isLocked then
			return f14_arg1.isLocked
		elseif f14_arg0.challengeCategory ~= f14_arg1.challengeCategory then
			if f13_local2[f14_arg0.challengeCategory] and f13_local2[f14_arg1.challengeCategory] then
				return f13_local2[f14_arg0.challengeCategory] < f13_local2[f14_arg1.challengeCategory]
			else
				return f13_local2[f14_arg0.challengeCategory] ~= nil
			end
		else
			return tonumber( f14_arg0.imageID ) < tonumber( f14_arg1.imageID )
		end
	end
	
	local f13_local4 = ArenaChallengesEnabled()
	if f13_local4 then
		f13_local4 = f13_local1.index == Enum.eModes.MODE_MULTIPLAYER
	end
	local f13_local5 = false
	local f13_local6
	if f13_local1.index ~= Enum.eModes.MODE_MULTIPLAYER and f13_local1.index ~= Enum.eModes.MODE_ZOMBIES then
		f13_local6 = false
	else
		f13_local6 = true
	end
	local f13_local7 = false
	for f13_local11, f13_local12 in ipairs( CoD.ChallengesUtility.GetChallengeTable( f13_arg0, f13_local1.index, f13_local1.name, nil, f13_local3, true ) ) do
		local f13_local13 = f13_local12.properties
		if f13_local4 and not f13_local5 and f13_local12.models.isLocked then
			CoD.ArenaUtility.AddArenaVetCallingCards( f13_arg0, f13_local0, true, false )
			CoD.ArenaUtility.AddArenaBestCallingCards( f13_arg0, f13_local0, true, false )
			f13_local5 = true
		end
		if f13_local6 and not f13_local7 and f13_local12.models.isLocked then
			CoD.PrestigeUtility.AddPrestigeCallingCards( f13_arg0, f13_local1.index, f13_local0 )
			f13_local7 = true
		end
		if not f13_local13.isMastery and (not f13_local13.isDarkOps or f13_local12.models.statPercent >= 1) then
			table.insert( f13_local0, f13_local12 )
		end
	end
	if f13_local4 and not f13_local5 then
		CoD.ArenaUtility.AddArenaVetCallingCards( f13_arg0, f13_local0, true, false )
		CoD.ArenaUtility.AddArenaBestCallingCards( f13_arg0, f13_local0, true, false )
	end
	if f13_local6 and not f13_local7 then
		CoD.PrestigeUtility.AddPrestigeCallingCards( f13_arg0, f13_local1.index, f13_local0 )
	end
	if f13_local4 then
		CoD.ArenaUtility.AddArenaVetCallingCards( f13_arg0, f13_local0, false, true )
		CoD.ArenaUtility.AddArenaBestCallingCards( f13_arg0, f13_local0, false, true )
	end
	return f13_local0
end, true )
DataSources.ChallengesNearCompletionList = DataSourceHelpers.ListSetup( "ChallengesNearCompletionList", function ( f15_arg0 )
	local f15_local0 = {}
	local f15_local1 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f15_local1 then
		return f15_local0
	end
	local f15_local2 = function ( f16_arg0, f16_arg1 )
		return tonumber( f16_arg0.imageID ) < tonumber( f16_arg1.imageID )
	end
	
	if CoD.ChallengesUtility.NearCompletionLists[f15_local1.index] ~= nil then
		return CoD.ChallengesUtility.NearCompletionLists[f15_local1.index]
	end
	local f15_local3 = CoD.ChallengesUtility.GetChallengeTable( f15_arg0, f15_local1.index, f15_local1.name, nil, f15_local2, true )
	table.sort( f15_local3, function ( f17_arg0, f17_arg1 )
		if f17_arg0.models.statPercent ~= f17_arg1.models.statPercent then
			return f17_arg1.models.statPercent < f17_arg0.models.statPercent
		else
			return f17_arg0.models.iconId < f17_arg1.models.iconId
		end
	end )
	for f15_local7, f15_local8 in ipairs( f15_local3 ) do
		if not f15_local8.properties.isMastery and not f15_local8.properties.isDarkOps and f15_local8.models.statPercent < 1 then
			table.insert( f15_local0, f15_local8 )
			if CoD.ChallengesUtility.NearCompletionMaxNumChallengesShown <= #f15_local0 then
				break
			end
		end
	end
	CoD.ChallengesUtility.NearCompletionLists[f15_local1.index] = f15_local0
	return f15_local0
end, true )
DataSources.DarkOpsCallingCards = DataSourceHelpers.ListSetup( "DarkOpsCallingCards", function ( f18_arg0 )
	local f18_local0 = {}
	return CoD.ChallengesUtility.GetChallengeTable( f18_arg0, Enum.eModes.MODE_MULTIPLAYER, "mp", "darkops", function ( f19_arg0, f19_arg1 )
		return tonumber( f19_arg0.imageID ) < tonumber( f19_arg1.imageID )
	end
	, true )
end, true )
DataSources.DarkOpsCallingCardsZM = DataSourceHelpers.ListSetup( "DarkOpsCallingCardsZM", function ( f20_arg0 )
	local f20_local0 = {}
	return CoD.ChallengesUtility.GetChallengeTable( f20_arg0, Enum.eModes.MODE_ZOMBIES, "zm", "darkops", function ( f21_arg0, f21_arg1 )
		return tonumber( f21_arg0.imageID ) < tonumber( f21_arg1.imageID )
	end
	, true )
end, true )
DataSources.ArenaBestCallingCards = DataSourceHelpers.ListSetup( "ArenaBestCallingCards", function ( f22_arg0 )
	local f22_local0 = {}
	CoD.ArenaUtility.AddArenaBestCallingCards( f22_arg0, f22_local0 )
	return f22_local0
end, true )
DataSources.ArenaVetCallingCards = DataSourceHelpers.ListSetup( "ArenaVetCallingCards", function ( f23_arg0 )
	local f23_local0 = {}
	CoD.ArenaUtility.AddArenaVetCallingCards( f23_arg0, f23_local0 )
	local f23_local1 = CoD.ArenaUtility.GetArenaVetMasterCard( f23_arg0 )
	local f23_local2 = f23_local1.models
	DataSources.MasterCallingCard.setModelValues( f23_arg0, f23_local2.title, f23_local2.description, f23_local2.iconId, f23_local2.percentComplete )
	return f23_local0
end, true )
CoD.ChallengesUtility.GetEmblemBackgroundImageText = function ( f24_arg0, f24_arg1 )
	local f24_local0, f24_local1 = Engine.GetChallengeUnlockEmblemInfo( f24_arg0, f24_arg1 )
	if f24_local0 < 0 then
		return f24_local1
	end
	local f24_local2 = "MENU_CALLING_CARD"
	local f24_local3 = CoD.backgroundsTable
	local f24_local4 = {
		11,
		3
	}
	if f24_local1 then
		f24_local3 = CoD.emblemIconsTable
		f24_local2 = "MENU_EMBLEM"
		f24_local4 = {
			3
		}
	end
	local f24_local5 = ""
	for f24_local9, f24_local10 in ipairs( f24_local4 ) do
		f24_local5 = Engine.TableLookupGetColumnValueForRow( f24_local3, f24_local0, f24_local10 )
		if f24_local5 ~= "" then
			break
		end
	end
	return f24_local1, f24_local5, f24_local2
end

CoD.ChallengesUtility.IsSpecialistTransmissionChallenge = function ( f25_arg0, f25_arg1, f25_arg2 )
	if f25_arg0 == Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST then
		if LUI.startswith( Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f25_arg1 + 1 ), f25_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STATNAME ), "transmission" ) then
			return true
		end
	elseif f25_arg0 == Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL then
		local f25_local0 = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f25_arg1 + 1 ), f25_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STATNAME )
		if f25_local0 == "specialist_transmissions" or f25_local0 == "hero_transmissions" then
			return true
		end
	end
	return false
end

CoD.ChallengesUtility.IsTerribleKnifeChallenge = function ( f26_arg0, f26_arg1, f26_arg2 )
	if f26_arg0 == Enum.statsMilestoneTypes_t.MILESTONE_GROUP and Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f26_arg1 + 1 ), f26_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE ) == "weapon_knife" then
		return true
	else
		return false
	end
end

CoD.ChallengesUtility.IsHiddenPostShipChallenge = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = {
		"melee_knuckles",
		"melee_butterfly",
		"melee_wrench",
		"pistol_shotgun",
		"melee_crowbar",
		"melee_sword",
		"ar_garand",
		"special_crossbow",
		"melee_bat",
		"melee_dagger",
		"smg_mp40",
		"sniper_quickscope",
		"melee_mace",
		"melee_fireaxe",
		"ar_famas",
		"launcher_multi",
		"melee_boneglass",
		"melee_improvise",
		"pistol_energy",
		"shotgun_energy",
		"lmg_infinite",
		"sniper_double",
		"ar_peacekeeper",
		"melee_shockbaton",
		"melee_nunchuks",
		"melee_boxing",
		"melee_katana",
		"melee_shovel",
		"smg_nailgun",
		"special_discgun",
		"melee_prosthetic",
		"melee_chainsaw",
		"ar_pulse",
		"smg_rechamber",
		"melee_crescent",
		"ar_m16",
		"smg_ppsh",
		"ar_galil",
		"knife_ballistic",
		"smg_ak74u",
		"pistol_m1911",
		"ar_an94",
		"launcher_ex41",
		"smg_msmc",
		"shotgun_olympia",
		"sniper_xpr50",
		"smg_sten2",
		"lmg_rpk",
		"ar_m14",
		"sniper_mosin"
	}
	local f27_local1 = {
		"_gold",
		"_for_diamond"
	}
	local f27_local2 = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f27_arg1 + 1 ), f27_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CHALLENGESTATNAME )
	if f27_local2 == "" or f27_local2 == "challenges" or f27_local2 == "challenges_tu" then
		return false
	end
	for f27_local9, f27_local10 in ipairs( f27_local0 ) do
		for f27_local6, f27_local7 in ipairs( f27_local1 ) do
			if f27_local2 == f27_local10 .. f27_local7 then
				return true
			elseif LUI.startswith( f27_local2, "z_weap_" ) and LUI.endswith( f27_local2, f27_local7 ) then
				return true
			end
		end
	end
	if f27_local2 == "bowie_knife_gold" or f27_local2 == "bowie_knife_for_diamond" then
		return true
	else
		f27_local3 = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f27_arg1 + 1 ), f27_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE )
		if f27_local2 == "weapons_mastery" and f27_local3 ~= "knife_loadout" then
			return true
		elseif f27_local2 == "secondary_mastery" and f27_local3 ~= "weapon_knife" then
			return true
		else
			return false
		end
	end
end

CoD.ChallengesUtility.IsSpecialContractChallenge = function ( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f28_arg1 + 1, Enum.eModes.MODE_MULTIPLAYER ), f28_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CATEGORY )
	for f28_local4, f28_local5 in ipairs( CoD.ChallengesUtility.SpecialContractCategories ) do
		if f28_local5 == f28_local0 then
			return true
		end
	end
	return false
end

CoD.ChallengesUtility.IsSideBetMasteryChallenge = function ( f29_arg0, f29_arg1, f29_arg2 )
	return Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f29_arg1 + 1, Enum.eModes.MODE_MULTIPLAYER ), f29_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STATNAME ) == "tscc_challenge_mastery"
end

CoD.ChallengesUtility.SpecialistRewardTiers = LuaEnums.createEnum( "Default", "Epic", "CompletionEpic" )
CoD.ChallengesUtility.CamoRewardTiers = LuaEnums.createEnum( "Default", "Gold", "Diamond", "DarkMatter" )
CoD.ChallengesUtility.EmblemRewardTiers = LuaEnums.createEnum( "Default", "Mastery" )
CoD.ChallengesUtility.DefaultRewardTiers = LuaEnums.createEnum( "Default" )
CoD.ChallengesUtility.GetChallengeRewardDisplayTier = function ( f30_arg0 )
	local f30_local0 = CoD.ChallengesUtility.DefaultRewardTiers.Default
	local f30_local1 = ""
	if IsMultiplayer() then
		if f30_arg0.specialistInfo then
			f30_local1 = "specialist"
			if f30_arg0.specialistInfo.unlockItemIndex == 9 then
				f30_local0 = CoD.ChallengesUtility.SpecialistRewardTiers.CompletionEpic
			elseif f30_arg0.specialistInfo.unlockItemIndex == 8 then
				f30_local0 = CoD.ChallengesUtility.SpecialistRewardTiers.Epic
			else
				f30_local0 = CoD.ChallengesUtility.SpecialistRewardTiers.Default
			end
		elseif f30_arg0.camoInfo then
			f30_local1 = "camo"
			if f30_arg0.camoInfo.camoRef == "camo_darkmatter" then
				f30_local0 = CoD.ChallengesUtility.CamoRewardTiers.DarkMatter
			elseif f30_arg0.camoInfo.camoRef == "camo_diamond" then
				f30_local0 = CoD.ChallengesUtility.CamoRewardTiers.Diamond
			elseif f30_arg0.camoInfo.camoRef == "camo_gold" then
				f30_local0 = CoD.ChallengesUtility.CamoRewardTiers.Gold
			else
				f30_local0 = CoD.ChallengesUtility.CamoRewardTiers.Default
			end
		elseif f30_arg0.reticleInfo then
			f30_local1 = "reticle"
		elseif f30_arg0.emblemInfo then
			f30_local1 = "emblem"
			if f30_arg0.emblemInfo.isMastery then
				f30_local0 = CoD.ChallengesUtility.EmblemRewardTiers.Mastery
			else
				f30_local0 = CoD.ChallengesUtility.EmblemRewardTiers.Default
			end
		end
	end
	return f30_local0, f30_local1
end

CoD.ChallengesUtility.GetChallengeRewardInfo = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4, f31_arg5 )
	local f31_local0 = CoD.getStatsMilestoneTable( f31_arg1 + 1 )
	local f31_local1 = Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STRING )
	local f31_local2 = tonumber( Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TIERID ) )
	local f31_local3 = tonumber( Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2 + 1, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TIERID ) )
	local f31_local4 = tonumber( Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TARGETVALUE ) ) or 0
	local f31_local5 = Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM )
	local f31_local6 = Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKIMAGE )
	local f31_local7 = Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKHEROITEM )
	local f31_local8 = Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CHALLENGESTATNAME )
	local f31_local9 = false
	local f31_local10 = Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CATEGORY )
	local f31_local11 = tonumber( Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_XPEARNED ) )
	local f31_local12 = tonumber( Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_VIALSEARNED ) )
	if f31_local2 and f31_local2 > 0 then
		f31_local9 = true
	elseif f31_local3 and f31_local3 == 1 then
		f31_local9 = true
	end
	local f31_local13 = ""
	if f31_local5 ~= "" then
		f31_local13 = f31_local1 .. "_AWARD"
	else
		f31_local13 = f31_local1
	end
	local f31_local14 = nil
	local f31_local15 = ""
	if f31_local9 == true then
		f31_local15 = Engine.Localize( "CHALLENGE_TIER_" .. f31_local2 )
		local f31_local16 = f31_arg2 + 1
		local f31_local17 = f31_local2
		while not f31_local10 or f31_local10 == "" do
			if (tonumber( Engine.TableLookupGetColumnValueForRow( f31_local0, f31_local16, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TIERID ) ) or -1) <= f31_local17 then
				break
			end
			f31_local10 = Engine.TableLookupGetColumnValueForRow( f31_local0, f31_local16, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CATEGORY )
			local f31_local18 = f31_local17
			f31_local16 = f31_local16 + 1
		end
		if not f31_local10 then
			f31_local10 = ""
		end
	end
	local f31_local16, f31_local17 = nil
	local f31_local18 = "blacktransparent"
	if CoD.isMultiplayer then
		f31_local18 = "t7_icons_challenges_mp_" .. f31_local10
	end
	if CoD.isZombie == true then
		if f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
			f31_local18 = "uie_t7_menu_challenges_complete_icon"
		elseif f31_local10 == "darkops" then
			f31_local18 = "t7_icons_challenges_mp_darkops"
		else
			f31_local18 = "t7_icons_challenges_zm_" .. f31_local10
		end
	end
	local f31_local19 = nil
	if f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL then
		f31_local16 = Engine.Localize( f31_local13, f31_local4, "", f31_local15 )
		f31_local17 = Engine.Localize( f31_local1 .. "_DESC", f31_local4, "", f31_local15 )
	elseif f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
		f31_local16 = Engine.Localize( f31_local1 )
		f31_local17 = "MENU_DAILY_CHALLENGE_COMPLETED"
	elseif f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
		local f31_local20 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( f31_arg4 ) )
		f31_local16 = Engine.Localize( f31_local1, f31_local4, f31_local20, f31_local15 )
		f31_local17 = Engine.Localize( f31_local1 .. "_DESC", f31_local4, f31_local20, f31_local15 )
	elseif f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GAMEMODE then
		local f31_local20 = Engine.GetCurrentGameType()
		if 0 ~= Dvar.scr_hardcore:get() then
			f31_local20 = "hc" .. f31_local20
		end
		local f31_local21 = Engine.Localize( "CHALLENGE_TYPE_" .. f31_local20 )
		f31_local16 = Engine.Localize( f31_local13, f31_local4, f31_local21, f31_local15 )
		f31_local17 = Engine.Localize( f31_local1 .. "_DESC", f31_local4, f31_local21, f31_local15 )
	elseif f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_WEAPON then
		local f31_local20 = Engine.GetItemName( f31_arg4 )
		f31_local16 = Engine.Localize( f31_local13, f31_local4, f31_local20, f31_local15 )
		f31_local17 = Engine.Localize( f31_local1 .. "_DESC", f31_local4, f31_local20, f31_local15 )
	elseif f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS then
		local f31_local20 = Engine.GetAttachmentNameByIndex( f31_arg4 )
		f31_local16 = Engine.Localize( f31_local13, f31_local4, f31_local20, f31_local15 )
		f31_local17 = Engine.Localize( f31_local1 .. "_DESC", f31_local4, f31_local20, f31_local15 )
		if f31_local5 and f31_local5 ~= "" then
			f31_local18 = "cac_mods_" .. Engine.GetAttachmentRefByIndex( f31_arg4 )
			local f31_local21 = string.sub( f31_local5, string.len( "reticle_" ) + 1 )
			local f31_local22 = Engine.TableLookup( f31_arg0, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_NAME, f31_local20, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE )
			f31_local19 = {
				displayString = Engine.Localize( "MPUI_RETICLE_" .. f31_local22 .. "_" .. f31_local21 ),
				image = f31_local22 .. "_" .. f31_local21
			}
		end
	elseif f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST then
		local f31_local20 = Engine.GetHeroInfo( Engine.CurrentSessionMode(), f31_arg5 )
		local f31_local21 = Engine.GetHeroBundleInfo( Engine.CurrentSessionMode(), f31_arg5 )
		f31_local16 = Engine.Localize( f31_local13, "", f31_local20.displayName )
		f31_local18 = f31_local21.challengeSpecialist
		f31_local17 = Engine.Localize( f31_local1 .. "_DESC", f31_local4, f31_local20.displayName, f31_local15 )
	end
	local f31_local20 = nil
	if LUI.startswith( f31_local5, "camo_" ) then
		local f31_local21 = Engine.TableLookup( f31_arg0, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f31_local5, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_NAME )
		f31_local16 = Engine.Localize( f31_local13, f31_local21 )
		if f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL then
			local f31_local22 = Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE )
			if f31_local22 == "ar_garand" or f31_local22 == "ar_famas" or f31_local22 == "ar_peacekeeper" or f31_local22 == "ar_pulse" or f31_local22 == "ar_m16" or f31_local22 == "ar_galil" or f31_local22 == "ar_an94" or f31_local22 == "ar_m14" then
				f31_local18 = "t7_icon_weapon_assault_" .. f31_local5
			elseif f31_local22 == "pistol_shotgun" or f31_local22 == "pistol_energy" or f31_local22 == "pistol_m1911" then
				f31_local18 = "t7_icon_weapon_pistol_" .. f31_local5
			elseif f31_local22 == "sniper_quickscope" or f31_local22 == "sniper_double" or f31_local22 == "sniper_xpr50" or f31_local22 == "sniper_mosin" then
				f31_local18 = "t7_icon_weapon_sniper_" .. f31_local5
			elseif f31_local22 == "lmg_infinite" or f31_local22 == "lmg_rpk" then
				f31_local18 = "t7_icon_weapon_lmg_" .. f31_local5
			elseif f31_local22 == "smg_mp40" or f31_local22 == "smg_nailgun" or f31_local22 == "smg_rechamber" or f31_local22 == "smg_ppsh" or f31_local22 == "smg_ak74u" or f31_local22 == "smg_msmc" or f31_local22 == "smg_sten2" then
				f31_local18 = "t7_icon_weapon_smg_" .. f31_local5
			elseif f31_local22 == "launcher_multi" or f31_local22 == "launcher_ex41" then
				f31_local18 = "t7_icon_weapon_launcher_" .. f31_local5
			elseif f31_local22 == "shotgun_energy" or f31_local22 == "shotgun_olympia" then
				f31_local18 = "t7_icon_weapon_shotgun_" .. f31_local5
			else
				f31_local18 = "t7_icon_weapon_" .. f31_local5
			end
		elseif f31_arg3 == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
			f31_local18 = "t7_icon_" .. Engine.GetItemGroupByIndex( f31_arg4 ) .. "_" .. f31_local5
		else
			f31_local18 = Engine.GetItemImage( f31_arg4 ) .. "_" .. f31_local5
		end
		f31_local20 = {
			displayString = Engine.Localize( f31_local21 ),
			image = Engine.TableLookup( f31_arg0, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f31_local5, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_IMAGE ),
			camoRef = f31_local5
		}
	end
	local f31_local21 = function ( f32_arg0, f32_arg1 )
		local f32_local0
		if Engine.TableLookupGetColumnValueForRow( f32_arg0, f32_arg1, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_ISMASTERY ) ~= "1" and Engine.TableLookupGetColumnValueForRow( f32_arg0, f32_arg1, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_ISEXPERT ) ~= "1" then
			f32_local0 = false
		else
			f32_local0 = true
		end
		return f32_local0
	end
	
	local f31_local22 = nil
	if f31_arg4 then
		local f31_local23, f31_local24, f31_local25 = CoD.ChallengesUtility.GetEmblemBackgroundImageText( tonumber( Engine.TableLookupGetColumnValueForRow( f31_local0, f31_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX ) ), f31_arg4 )
		local f31_local26
		if f31_local23 then
			f31_local26 = ""
			if not f31_local26 then
			
			else
				if f31_local10 == "sidebet" then
					f31_local18 = "uie_t7_hud_aar_bm_challenge"
				end
				if f31_local24 then
					f31_local22 = {
						displayString = Engine.Localize( f31_local25 ),
						image = f31_local24,
						rewardSize = f31_local26,
						isMastery = f31_local21( f31_local0, f31_arg2 ),
						category = f31_local10
					}
				end
			end
		end
		f31_local26 = "CallingCard"
	end
	local f31_local23 = f31_local6 or f31_local5 or ""
	if not f31_local22 and LUI.startswith( f31_local23, "EM_" ) then
		for f31_local32, f31_local33 in ipairs( {
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
			local f31_local31 = nil
			for f31_local28, f31_local29 in ipairs( f31_local33.imageNameColumn ) do
				f31_local31 = Engine.TableLookup( nil, f31_local33.table, f31_local33.descriptionColumn, f31_local23, f31_local29 )
				if f31_local31 and f31_local31 ~= "" then
					break
				end
			end
			if f31_local31 and f31_local31 ~= "" then
				f31_local22 = {
					displayString = Engine.Localize( f31_local23 ),
					image = f31_local31,
					rewardSize = f31_local33.rewardSize,
					isMastery = f31_local21( f31_local0, f31_arg2 )
				}
			end
		end
	end
	local f31_local24 = nil
	local f31_local25 = {
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
	if f31_local7 and f31_local7 ~= "" then
		local f31_local26 = f31_arg5 or Engine.GetEquippedHero( f31_arg0, Engine.CurrentSessionMode() )
		for f31_local31, f31_local34 in ipairs( f31_local25 ) do
			if LUI.startswith( f31_local7, f31_local34.prefix ) then
				local f31_local35 = tonumber( f31_local7:sub( f31_local34.prefix:len() + 1 ) ) - 1
				local f31_local30 = Engine.GetHeroItemInfo( Engine.CurrentSessionMode(), f31_local26, f31_local34.type, f31_local35 )
				if f31_local30 then
					f31_local24 = {
						displayString = Engine.Localize( f31_local34.locString, f31_local30.name ),
						image = f31_local30.icon,
						unlockItemIndex = f31_local35
					}
					break
				end
			end
		end
	end
	local f31_local26 = nil
	local f31_local27 = "transmission"
	if f31_local8 and f31_local8 ~= "" and LUI.startswith( f31_local8, f31_local27 ) then
		local f31_local32 = f31_arg5 or Engine.GetEquippedHero( f31_arg0, Engine.CurrentSessionMode() )
		local f31_local33 = tonumber( f31_local8:sub( f31_local27:len() + 1 ) )
		local f31_local31, f31_local34 = Engine.IsSpecialistTransmissionLocked( f31_arg0, f31_local32, f31_local33 )
		if not f31_local31 then
			f31_local26 = {
				displayString = Engine.Localize( "CHALLENGE_TRANSMISSION_N_FOR_X", f31_local33, Engine.GetHeroName( Engine.CurrentSessionMode(), f31_arg5 ) ),
				image = "t7_hud_hero_icon_filetype_audio"
			}
		end
	end
	local f31_local32 = nil
	if f31_local11 and f31_local11 > 0 then
		f31_local32 = {
			displayString = Engine.Localize( "RANK_XP", f31_local11 * Engine.GetXPScale( f31_arg0 ) ),
			image = "t7_hud_mp_notifications_xp_blue"
		}
	end
	local f31_local33 = nil
	if f31_local12 and f31_local12 > 0 then
		local f31_local31 = {}
		local f31_local34 = Engine.Localize
		local f31_local35 = "ZMUI_BGB_TOKENS_GAINED_REWARD"
		local f31_local30 = IsZMDoubleVialActive( f31_arg0 ) and Engine.GetZMVialScale( f31_arg0 ) or 1
		local f31_local36 = f31_local12 * f31_local30
		f31_local31.displayString = f31_local34( f31_local35, f31_local30 )
		f31_local31.image = IsZMDoubleVialActive( f31_arg0 ) and "uie_t7_icon_zm_double_vial_backer" or "t7_hud_zm_vial_256"
		f31_local33 = f31_local31
	end
	return {
		challengeString = f31_local1,
		challengeAwardString = f31_local13,
		localizedTierText = f31_local15,
		titleText = f31_local16,
		subtitleText = f31_local17,
		icon = f31_local18,
		reticleInfo = f31_local19,
		camoInfo = f31_local20,
		emblemInfo = f31_local22,
		specialistInfo = f31_local24,
		transmissionInfo = f31_local26,
		xpInfo = f31_local32,
		vialInfo = f31_local33
	}
end

CoD.ChallengesUtility.GetSideBetCallingCards = function ( f33_arg0, f33_arg1 )
	return CoD.ChallengesUtility.GetChallengeTable( f33_arg0, Enum.eModes.MODE_MULTIPLAYER, "mp", "sidebet", f33_arg1, false )
end

