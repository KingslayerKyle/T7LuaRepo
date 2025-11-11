CoD.AARUtilityZM = {}
CoD.AARUtilityZM.RankIdCol = 0
CoD.AARUtilityZM.RankTableColMinXP = 2
CoD.AARUtilityZM.RankTableColXPToNext = 3
CoD.AARUtilityZM.RankDisplayStringCol = 5
CoD.AARUtilityZM.RankTableColMaxXP = 7
CoD.AARUtilityZM.RankDisplayLevelCol = 14
CoD.AARUtilityZM.UseTestData = function ()
	return false
end

CoD.AARUtilityZM.GetMatchStat = function ( controller, statName )
	local useTestData = CoD.AARUtilityZM.UseTestData()
	local statsBeforeMatch, currentStats = nil
	currentStats = CoD.GetPlayerStats( controller )
	if useTestData then
		statsBeforeMatch = CoD.GetPlayerStats( controller )
	else
		statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE )
	end
	return currentStats.PlayerStatsList[statName].StatValue:get() - statsBeforeMatch.PlayerStatsList[statName].StatValue:get()
end

CoD.AARUtilityZM.GetMissionHighestStat = function ( controller, statName )
	local missionName = CoD.AARUtilityCP.GetLastMapName( controller )
	local currentStats = CoD.GetPlayerStats( controller )
	return currentStats.PlayerStatsByMap[missionName].currentStats[statName]:get()
end

CoD.AARUtilityZM.SetupUIModels = function ( controller )
	local useTestData = CoD.AARUtilityZM.UseTestData()
	local statsBeforeMatch = nil
	if useTestData then
		statsBeforeMatch = CoD.GetPlayerStats( controller )
	else
		statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE )
	end
	local currentStats = CoD.GetPlayerStats( controller )
	if statsBeforeMatch then
		local f4_local0 = statsBeforeMatch.PlayerStatsList.RANKXP.StatValue:get()
		if not f4_local0 then
		
		else
			local currentRank = currentStats.PlayerStatsList.RANK.StatValue:get()
			local currPrestige = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
			local currRankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
			local xpEarnedDuringMatch = CoD.AARUtilityZM.GetXPEarnedDuringMatch( currRankXP, f4_local0 )
			local aarStats = currentStats.AfterActionReportStats
			local stats = {}
			stats.nextLevel, stats.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank + 1, currPrestige + 1 )
			if useTestData then
				stats.kills = 24
				stats.points = 4550
				stats.rounds = 14
				stats.headshots = 12
				stats.meleeKills = 13
				stats.pointsPerKill = 110.9
				stats.revives = 3
				stats.bgbTokensGainedThisGame = 1
				stats.showBestScoreIcon = 1
				stats.showBestStyleIcon = 1
				stats.showBestRoundIcon = 1
			else
				stats.kills = CoD.AARUtilityZM.GetMatchStat( controller, "KILLS" )
				stats.total_points = currentStats.PlayerStatsList.TOTAL_POINTS.StatValue:get()
				stats.rounds = CoD.AARUtilityZM.GetMatchStat( controller, "ROUNDS" )
				stats.headshots = CoD.AARUtilityZM.GetMatchStat( controller, "HEADSHOTS" )
				stats.revives = CoD.AARUtilityZM.GetMatchStat( controller, "REVIVES" )
				stats.downs = CoD.AARUtilityZM.GetMatchStat( controller, "DOWNS" )
				stats.meleeKills = CoD.AARUtilityZM.GetMatchStat( controller, "MELEE_KILLS" )
				stats.pointsPerKill = CoD.AARUtilityZM.GetMatchStat( controller, "BGBS_CHEWED" )
				stats.bgbTokensGainedThisGame = currentStats.PlayerStatsList.BGB_TOKENS_GAINED_THIS_GAME.StatValue:get()
				local completedChallenges = Engine.GetRecentChallenges( controller )
				for _, challenge in ipairs( completedChallenges ) do
					if challenge.type == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
						local tableName = CoD.getStatsMilestoneTable( challenge.tableNumber + 1 )
						local rewardVials = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, challenge.row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_VIALSEARNED ) )
						if rewardVials then
							stats.bgbTokensGainedThisGame = stats.bgbTokensGainedThisGame + rewardVials
						end
					end
				end
				stats.showBestScoreIcon = 0
				stats.showBestStyleIcon = 0
				stats.showBestRoundIcon = 0
			end
			if stats.bgbTokensGainedThisGame ~= 0 then
				currentStats.showMegaChewFactoryBreadcrumb:set( 1 )
			end
			stats.xpEarnedDuringMatch = xpEarnedDuringMatch
			local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
			for key, challenge in pairs( stats ) do
				Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, key ), challenge )
			end
			if CoD.isFrontend and controller ~= 0 then
				local performanceTabStatsModelControllerZero = Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats" )
				for key, value in pairs( stats ) do
					Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModelControllerZero, key ), value )
				end
			end
			UploadStats( nil, controller )
		end
	end
	local rankXPBeforeMatch = 0
end

CoD.AARUtilityZM.GetXPEarnedDuringMatch = function ( currRankXP, rankXPBeforeMatch )
	local xpEarnedDuringMatch = currRankXP - rankXPBeforeMatch
	if xpEarnedDuringMatch < 0 then
		xpEarnedDuringMatch = 0
	end
	return xpEarnedDuringMatch
end

CoD.AARUtilityZM.CreateModelsForRewards = function ( controller )
	local useTestData = CoD.AARUtilityZM.UseTestData()
	local perControllerModel = Engine.GetModelForController( controller )
	local aarRewardsModel = Engine.CreateModel( perControllerModel, "aarRewards" )
	if useTestData then
		local numRewardCarouselItems = CoD.AARUtilityZM.GetRewardItemCount( controller )
		for currRewardCarouselItem = 1, numRewardCarouselItems, 1 do
			local currRewardCarouselItemModel = Engine.CreateModel( aarRewardsModel, currRewardCarouselItem .. "" )
			Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemImage" ), "uie_headicon_dead" )
			Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemTitle" ), "Master Sergeant" )
			Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemSubtitle" ), "Level 10" )
			local numRewardsPerItem = 4
			for currReward = 1, numRewardsPerItem, 1 do
				local currRewardItemModel = Engine.CreateModel( currRewardCarouselItemModel, "reward" .. currReward .. "Info" )
				Engine.SetModelValue( Engine.CreateModel( currRewardItemModel, "rewardName" ), "Semtex" )
				Engine.SetModelValue( Engine.CreateModel( currRewardItemModel, "rewardImage" ), "uie_headicon_dead" )
				Engine.SetModelValue( Engine.CreateModel( currRewardItemModel, "rewardDesc" ), "Lethal Blueprint" )
			end
		end
	end
end

CoD.AARUtilityZM.GetModelForRewardItemByIndex = function ( controller, index )
	return Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards." .. index )
end

CoD.AARUtilityZM.GetRewardItemCount = function ( controller )
	if CoD.AARUtilityZM.UseTestData() then
		return 3
	else
		return 0
	end
end

CoD.AARUtilityZM.CreateQuestItemModels = function ( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local aarQuestsModel = Engine.CreateModel( perControllerModel, "aarQuests" )
end

