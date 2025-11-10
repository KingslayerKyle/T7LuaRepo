CoD.ChallengesUtility = {}
CoD.ChallengesUtility.NearCompletionMaxNumChallengesShown = 10
CoD.ChallengesUtility.NearCompletionLists = {}
CoD.ChallengesUtility.GameModeColors = {}
CoD.ChallengesUtility.GameModeColors.CP = "255 60 135"
CoD.ChallengesUtility.GameModeColors.MP = "90 166 218"
CoD.ChallengesUtility.GameModeColors.ZM = "0 205 218"
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
		gumgobbler = 2
	}
}
CoD.ChallengesUtility.GetGameModeInfo = function ()
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "challengeGameMode" )
	if not f1_local0 then
		return nil
	end
	local f1_local1 = Engine.GetModelValue( f1_local0 )
	if f1_local1 ~= "cp" and f1_local1 ~= "mp" and f1_local1 ~= "zm" then
		return nil
	end
	local f1_local2 = {
		name = f1_local1,
		index = Enum.eModes.MODE_INVALID
	}
	if f1_local1 == "cp" then
		f1_local2.index = Enum.eModes.MODE_CAMPAIGN
	elseif f1_local1 == "mp" then
		f1_local2.index = Enum.eModes.MODE_MULTIPLAYER
	elseif f1_local1 == "zm" then
		f1_local2.index = Enum.eModes.MODE_ZOMBIES
	end
	return f1_local2
end

CoD.ChallengesUtility.GetChallengeTable = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	local f2_local0 = {}
	local f2_local1 = Engine.GetChallengeInfoForImages( f2_arg0, f2_arg3, f2_arg1 )
	if not f2_local1 then
		return f2_local0
	end
	local f2_local2 = Engine.GetPlayerStats( f2_arg0, CoD.STATS_LOCATION_NORMAL, f2_arg1 )
	local f2_local3 = f2_local2.PlayerStatsList.RANK.StatValue:get()
	local f2_local4 = f2_local2.PlayerStatsList.PLEVEL.StatValue:get()
	if f2_arg4 then
		table.sort( f2_local1, f2_arg4 )
	end
	for f2_local26, f2_local27 in ipairs( f2_local1 ) do
		local f2_local28 = f2_local27.challengeRow
		local f2_local29 = f2_local27.currentChallengeRow
		local f2_local30 = f2_local27.challengeCategory
		local f2_local31 = f2_local27.tableNum
		local f2_local32 = f2_local27.isLocked
		local f2_local33 = f2_local27.isMastery
		local f2_local34 = f2_local27.challengeType
		local f2_local35 = f2_local27.currChallengeStatValue
		local f2_local36 = f2_local27.imageID
		local f2_local17 = 0
		local f2_local18 = 0
		local f2_local24 = 0
		local f2_local19 = ""
		local f2_local37, f2_local20, f2_local21, f2_local25, f2_local22 = nil
		if f2_local28 ~= nil then
			local f2_local8 = "gamedata/stats/" .. f2_arg2 .. "/statsmilestones" .. f2_local31 + 1 .. ".csv"
			local f2_local9 = tonumber( Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local28, CoD.ChallengesUtility.TierIdCol ) )
			local f2_local10 = Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local28, CoD.ChallengesUtility.TargetValCol )
			local f2_local11 = Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local28, CoD.ChallengesUtility.NameStringCol )
			local f2_local12 = Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local28, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
			local f2_local13 = Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local28, CoD.ChallengesUtility.XpEarnedCol )
			local f2_local14 = Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local28, CoD.ChallengesUtility.UnlockRankCol )
			local f2_local15 = Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local28, CoD.ChallengesUtility.UnlockPLevelCol )
			local f2_local16 = CoD.GetLocalizedTierText( f2_arg0, f2_local8, f2_local28 )
			if f2_local14 ~= "" then
				f2_local17 = tonumber( f2_local14 )
			end
			if f2_local15 ~= "" then
				f2_local18 = tonumber( f2_local15 )
			end
			if f2_local34 == CoD.MILESTONE_WEAPON then
				f2_local19 = Engine.Localize( Engine.GetItemName( f2_local27.itemIndex ) )
			elseif f2_local34 == CoD.MILESTONE_GROUP then
				f2_local19 = Engine.Localize( "MPUI_" .. Engine.GetItemGroupByIndex( f2_local27.itemIndex ) )
			elseif f2_local34 == CoD.MILESTONE_ATTACHMENTS then
				f2_local19 = Engine.Localize( Engine.GetAttachmentNameByIndex( f2_local27.itemIndex ) )
			elseif f2_local34 == CoD.MILESTONE_GAMEMODE then
				f2_local19 = Engine.Localize( "MPUI_" .. Engine.GetGametypeName( f2_local27.itemIndex ) )
			end
			if f2_local16 ~= "" then
				f2_local20 = true
			end
			if not f2_local33 then
				if f2_local4 < f2_local18 then
					f2_local21 = true
					f2_local22 = Engine.Localize( "CLASS_PRESTIGE_UNLOCK_DESC", f2_local18 )
				elseif f2_local3 < f2_local17 then
					f2_local21 = true
					f2_local22 = Engine.Localize( "MENU_UNLOCKED_AT", Engine.GetRankName( f2_local17, f2_arg1 ), f2_local17 + 1 )
				end
			end
			if f2_local20 and f2_local21 then
				f2_local16 = Engine.Localize( "CHALLENGE_TIER_" .. 0 )
			end
			local f2_local23 = f2_local27.currentChallengeRow
			if f2_local23 then
				f2_local12 = Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local23, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
				if f2_local20 then
					f2_local24 = tonumber( Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local23, CoD.ChallengesUtility.TierIdCol ) )
					f2_local10 = Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local23, CoD.ChallengesUtility.TargetValCol )
					f2_local13 = Engine.TableLookupGetColumnValueForRow( f2_local8, f2_local23, CoD.ChallengesUtility.XpEarnedCol )
					f2_local16 = CoD.GetLocalizedTierText( f2_arg0, f2_local8, f2_local23 )
				end
			end
			f2_local25 = Engine.Localize( f2_local11, "", f2_local19, f2_local16 )
			if not f2_local22 then
				f2_local22 = Engine.Localize( f2_local12, f2_local10, f2_local19 )
			end
			table.insert( f2_local0, {
				models = {
					title = f2_local25,
					description = f2_local22,
					iconId = f2_local36,
					maxTier = f2_local9,
					currentTier = f2_local24,
					statPercent = f2_local35 / f2_local10,
					statFractionText = Engine.Localize( "MPUI_X_SLASH_Y", f2_local35, f2_local10 ),
					tierStatus = Engine.Localize( "CHALLENGE_TIER_STATUS", f2_local24 + 1, f2_local9 + 1 ),
					xp = f2_local13,
					isLocked = f2_local32
				},
				properties = {
					isMastery = f2_local33,
					isDarkOps = f2_local30 == "darkops"
				}
			} )
		end
	end
	return f2_local0
end

DataSources.CallingCards = DataSourceHelpers.ListSetup( "CallingCards", function ( f3_arg0 )
	local f3_local0 = {}
	local f3_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	if not f3_local1 then
		return f3_local0
	end
	local f3_local2 = Engine.GetModelValue( f3_local1 )
	if not f3_local2 then
		return f3_local0
	end
	local f3_local3 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f3_local3 then
		return f3_local0
	end
	local f3_local4 = CoD.ChallengesUtility.GetChallengeTable( f3_arg0, f3_local3.index, f3_local3.name, f3_local2, function ( f4_arg0, f4_arg1 )
		return tonumber( f4_arg0.imageID ) < tonumber( f4_arg1.imageID )
	end )
	local f3_local5 = 0
	local f3_local6 = 0
	for f3_local10, f3_local11 in ipairs( f3_local4 ) do
		local f3_local12 = f3_local11.models
		if f3_local11.properties.isMastery then
			DataSources.MasterCallingCard.setModelValues( f3_arg0, f3_local12.title, f3_local12.description, f3_local12.iconId, f3_local5 / f3_local6 )
		end
		table.insert( f3_local0, f3_local11 )
		f3_local6 = f3_local6 + 1
		if not f3_local12.isLocked then
			f3_local5 = f3_local5 + 1
		end
	end
	return f3_local0
end )
DataSources.CallingCardsSorted = DataSourceHelpers.ListSetup( "CallingCardsSorted", function ( f5_arg0 )
	local f5_local0 = {}
	local f5_local1 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f5_local1 then
		return f5_local0
	end
	local f5_local2 = CoD.ChallengesUtility.ChallengeCategoryValues[f5_local1.index]
	for f5_local6, f5_local7 in ipairs( CoD.ChallengesUtility.GetChallengeTable( f5_arg0, f5_local1.index, f5_local1.name, nil, function ( f6_arg0, f6_arg1 )
		if f6_arg0.isLocked ~= f6_arg1.isLocked then
			return f6_arg1.isLocked
		elseif f6_arg0.challengeCategory ~= f6_arg1.challengeCategory then
			return f5_local2[f6_arg0.challengeCategory] < f5_local2[f6_arg1.challengeCategory]
		else
			return tonumber( f6_arg0.imageID ) < tonumber( f6_arg1.imageID )
		end
	end ) ) do
		local f5_local8 = f5_local7.properties
		if not f5_local8.isMastery and (not f5_local8.isDarkOps or f5_local7.models.statPercent >= 1) then
			table.insert( f5_local0, f5_local7 )
		end
	end
	return f5_local0
end )
DataSources.ChallengesNearCompletionList = DataSourceHelpers.ListSetup( "ChallengesNearCompletionList", function ( f7_arg0 )
	local f7_local0 = {}
	local f7_local1 = CoD.ChallengesUtility.GetGameModeInfo()
	if not f7_local1 then
		return f7_local0
	end
	local f7_local2 = function ( f8_arg0, f8_arg1 )
		return tonumber( f8_arg0.imageID ) < tonumber( f8_arg1.imageID )
	end
	
	if CoD.ChallengesUtility.NearCompletionLists[f7_local1.index] ~= nil then
		return CoD.ChallengesUtility.NearCompletionLists[f7_local1.index]
	end
	local f7_local3 = CoD.ChallengesUtility.GetChallengeTable( f7_arg0, f7_local1.index, f7_local1.name, nil, f7_local2 )
	table.sort( f7_local3, function ( f9_arg0, f9_arg1 )
		return f9_arg1.models.statPercent < f9_arg0.models.statPercent
	end )
	for f7_local7, f7_local8 in ipairs( f7_local3 ) do
		if not f7_local8.properties.isMastery and not f7_local8.properties.isDarkOps and f7_local8.models.statPercent < 1 then
			table.insert( f7_local0, f7_local8 )
			if CoD.ChallengesUtility.NearCompletionMaxNumChallengesShown <= #f7_local0 then
				break
			end
		end
	end
	CoD.ChallengesUtility.NearCompletionLists[f7_local1.index] = f7_local0
	return f7_local0
end )
DataSources.DarkOpsCallingCards = DataSourceHelpers.ListSetup( "DarkOpsCallingCards", function ( f10_arg0 )
	local f10_local0 = {}
	return CoD.ChallengesUtility.GetChallengeTable( f10_arg0, Enum.eModes.MODE_MULTIPLAYER, "mp", "darkops", function ( f11_arg0, f11_arg1 )
		return tonumber( f11_arg0.imageID ) < tonumber( f11_arg1.imageID )
	end
	 )
end )
