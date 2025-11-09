CoD.AARUtilityCP = {}
CoD.AARUtilityCP.RankIdCol = 0
CoD.AARUtilityCP.RankTableColMinXP = 2
CoD.AARUtilityCP.RankTableColXPToNext = 3
CoD.AARUtilityCP.RankDisplayStringCol = 5
CoD.AARUtilityCP.RankTableColMaxXP = 7
CoD.AARUtilityCP.RankDisplayLevelCol = 14
CoD.AARUtilityCP.ACCOLADE_STATE_NOT_COMPLETED = 0
CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_NOT_SEEN = 1
CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_SEEN = 2
CoD.AARUtilityCP.ACCOLADE_STATE_BITS = 29
CoD.AARUtilityCP.ACCOLADE_STATE_MASK = -536870912
CoD.AARUtilityCP.GetLastMapName = function ()
	if CoD.AARUtilityCP.lastMapName == nil then
		local mapName = Dvar.last_map:get()
		if mapName == nil or mapName == false then
			CoD.AARUtilityCP.lastMapName = "cp_mi_cairo_infection"
			return CoD.AARUtilityCP.lastMapName
		elseif string.match( mapName, "[0-9]$" ) ~= nil then
			mapName = string.sub( mapName, 0, string.len( mapName ) - 1 )
		end
		CoD.AARUtilityCP.lastMapName = mapName
	end
	return CoD.AARUtilityCP.lastMapName
end

CoD.AARUtilityCP.GetLastMissionName = function ()
	if CoD.AARUtilityCP.lastMissionName == nil then
		local missionName = string.match( CoD.AARUtilityCP.GetLastMapName(), "_[a-z]+$" )
		CoD.AARUtilityCP.lastMissionName = string.sub( missionName, 2 )
	end
	return CoD.AARUtilityCP.lastMissionName
end

CoD.AARUtilityCP.UseTestData = function ()
	return false
end

CoD.AARUtilityCP.UpdateDatasourcesForScoreboard = function ( controller, scoreboard )
	if scoreboard == nil then
		return 
	else
		scoreboard.ScoreboardWidgetCP0.team1List.Team1:setWidgetType( CoD.ScoreboardRowWidgetCP )
		scoreboard.ScoreboardWidgetCP0.team1List.Team1:setDataSource( "ScoreboardTeam1List" )
		scoreboard.ScoreboardWidgetCP0.team1List.Team1:updateDataSource()
	end
end

local GetMatchStat = function ( controller, statName )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	local statsBeforeMatch, currentStats = nil
	currentStats = CoD.GetPlayerStats( controller )
	if useTestData then
		statsBeforeMatch = CoD.GetPlayerStats( controller )
	else
		statsBeforeMatch = CoD.GetPlayerStats( controller )
	end
	return currentStats.PlayerStatsList[statName].StatValue:get() - statsBeforeMatch.PlayerStatsList[statName].StatValue:get()
end

local GetMissionHighestStat = function ( controller, statName )
	local missionName = CoD.AARUtilityCP.GetLastMapName()
	local statsBeforeMatch = CoD.GetPlayerStats( controller )
	return statsBeforeMatch.PlayerStatsByMap[missionName].highestStats[statName]:get()
end

local SetMissionHighestStat = function ( controller, statName, statValue )
	local missionName = CoD.AARUtilityCP.GetLastMapName()
	local currentStats = CoD.GetPlayerStats( controller )
	currentStats.PlayerStatsByMap[missionName].highestStats[statName]:set( statValue )
end

CoD.AARUtilityCP.GetScoreboardTeamTable = function ( controller, teamNum )
	local sortedTeams = Engine.GetTeamPositions( controller, Engine.GetCurrentTeamCount() )
	if Engine.GetCurrentTeamCount() < 2 and teamNum == 2 then
		return {}
	end
	local teamEnum = sortedTeams[teamNum].team
	local team1Count = 0
	local team2Count = 0
	if teamEnum ~= Enum.team_t.TEAM_FREE then
		team1Count = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES )
		team2Count = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_AXIS )
	else
		team1Count = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_FREE )
	end
	local rowsToShowOnEachTeam = CoD.ScoreboardUtility.MinRowsToShowOnEachTeam
	rowsToShowOnEachTeam = math.max( rowsToShowOnEachTeam, math.max( team1Count, team2Count ) )
	local currentStats = Engine.GetPlayerStats( controller )
	local scoreboardModels = {}
	local controllerModel = Engine.GetModelForController( controller )
	local scoreboardInfoModel = Engine.CreateModel( controllerModel, "scoreboardInfo" )
	local teamTable = {}
	for index = 1, rowsToShowOnEachTeam, 1 do
		local clientInfoString = "team: " .. teamEnum .. " client: " .. index - 1
		local clientNum = -1
		if Engine.GetScoreboardTeamClientCount( teamEnum ) < index then
			clientInfoString = "team: " .. teamEnum .. " client: -1"
		else
			clientNum = Engine.GetScoreboardPlayerData( index - 1, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_CLIENTNUM )
		end
		clientInfoString = clientInfoString .. " " .. Engine.milliseconds()
		local playerScore = currentStats.AfterActionReportStats.playerStats[index - 1].score:get()
		local playerKills = currentStats.AfterActionReportStats.playerStats[index - 1].kills:get()
		local playerDeaths = currentStats.AfterActionReportStats.playerStats[index - 1].deaths:get()
		local playerAssists = currentStats.AfterActionReportStats.playerStats[index - 1].assists:get()
		local playerRevives = currentStats.AfterActionReportStats.playerStats[index - 1].revives:get()
		local modelsTable = {
			team = teamEnum,
			clientNum = tonumber( clientNum ),
			score = playerScore,
			kills = playerKills,
			deaths = playerDeaths,
			assists = playerAssists,
			revives = playerRevives
		}
		local newTable = {
			models = modelsTable
		}
		table.insert( teamTable, newTable )
	end
	return teamTable
end

CoD.AARUtilityCP.SetupUIModels = function ( controller )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	local statsBeforeMatch, currentStats = nil
	if useTestData then
		statsBeforeMatch = CoD.GetPlayerStats( controller )
	else
		statsBeforeMatch = CoD.GetPlayerStats( controller )
	end
	local currentStats = CoD.GetPlayerStats( controller )
	local currentRank = currentStats.PlayerStatsList.RANK.StatValue:get()
	local currPrestige = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	local currRankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
	local xpBeforeMatch = statsBeforeMatch.PlayerStatsList.RANKXP.StatValue:get()
	local xpEarnedDuringMatch = CoD.AARUtilityCP.GetXPEarnedDuringMatch( currRankXP, xpBeforeMatch )
	local aarStats = currentStats.AfterActionReportStats
	local stats = {}
	stats.nextLevel, stats.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank + 1, currPrestige + 1 )
	if useTestData then
		stats.kills = 24
		stats.assists = 14
		stats.score = 11550
		stats.revives = 3
		stats.incaps = 2
		stats.completionTime = 1184
		stats.showBestScoreIcon = 1
		stats.showBestKillsIcon = 1
		stats.showBestCompletionTimeIcon = 1
		stats.showBestIncapsIcon = 1
		stats.showBestAssistsIcon = 1
		stats.showBestRevivesIcon = 1
	else
		stats.kills = GetMatchStat( controller, "KILLS" )
		stats.assists = GetMatchStat( controller, "ASSISTS" )
		stats.score = GetMatchStat( controller, "SCORE" )
		stats.revives = GetMatchStat( controller, "REVIVES" )
		stats.incaps = GetMatchStat( controller, "INCAPS" )
		stats.completionTime = GetMatchStat( controller, "TIME_PLAYED_TOTAL" )
		stats.showBestScoreIcon = 0
		stats.showBestKillsIcon = 0
		stats.showBestCompletionTimeIcon = 0
		stats.showBestIncapsIcon = 0
		stats.showBestAssistsIcon = 0
		stats.showBestRevivesIcon = 0
		local highestScore = GetMissionHighestStat( controller, "HIGHEST_SCORE" )
		local highestKills = GetMissionHighestStat( controller, "HIGHEST_KILLS" )
		local bestTime = GetMissionHighestStat( controller, "BEST_COMPLETION_TIME" )
		local highestAssists = GetMissionHighestStat( controller, "HIGHEST_ASSISTS" )
		local highestRevives = GetMissionHighestStat( controller, "HIGHEST_REVIVES" )
		local bestIncaps = GetMissionHighestStat( controller, "BEST_INCAPS" )
		if highestScore < stats.score and highestScore ~= nil then
			stats.showBestScoreIcon = 1
			SetMissionHighestStat( controller, "HIGHEST_SCORE", stats.score )
		end
		if highestKills < stats.kills and highestKills ~= nil then
			stats.showBestKillsIcon = 1
			SetMissionHighestStat( controller, "HIGHEST_KILLS", stats.kills )
		end
		if stats.completionTime < bestTime and bestTime ~= nil then
			stats.showBestCompletionTimeIcon = 1
			SetMissionHighestStat( controller, "BEST_COMPLETION_TIME", stats.completionTime )
		end
		if highestAssists < stats.assists and highestAssists ~= nil then
			stats.showBestAssistsIcon = 1
			SetMissionHighestStat( controller, "HIGHEST_ASSISTS", stats.assists )
		end
		if highestRevives < stats.revives and highestRevives ~= nil then
			stats.showBestRevivesIcon = 1
			SetMissionHighestStat( controller, "HIGHEST_REVIVES", stats.revives )
		end
		if stats.incaps < bestIncaps and bestIncaps ~= nil then
			stats.showBestIncapsIcon = 1
			SetMissionHighestStat( controller, "HIGHEST_ASSISTS", stats.assists )
		end
	end
	stats.xpEarnedDuringMatch = xpEarnedDuringMatch
	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	for key, value in pairs( stats ) do
		Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, key ), value )
	end
end

CoD.AARUtilityCP.GetXPEarnedDuringMatch = function ( currRankXP, rankXPBeforeMatch )
	local xpEarnedDuringMatch = currRankXP - rankXPBeforeMatch
	if xpEarnedDuringMatch < 0 then
		xpEarnedDuringMatch = 0
	end
	return xpEarnedDuringMatch
end

CoD.AARUtilityCP.CreateModelsForRewards = function ( controller )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	local perControllerModel = Engine.GetModelForController( controller )
	local aarRewardsModel = Engine.CreateModel( perControllerModel, "aarRewards" )
	local numRewardCarouselItems = CoD.AARUtilityCP.GetRewardItemCount( controller )
	for currRewardCarouselItem = 1, numRewardCarouselItems, 1 do
		local currRewardContainer = CoD.AARUtilityCP.Rewards[currRewardCarouselItem]
		local currRewardCarouselItemModel = Engine.CreateModel( aarRewardsModel, currRewardCarouselItem .. "" )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemImage" ), currRewardContainer.reward.icon )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemTitle" ), currRewardContainer.reward.title )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemSubtitle" ), currRewardContainer.reward.description )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "reward1InfoVisible" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "reward2InfoVisible" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "reward3InfoVisible" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "reward4InfoVisible" ), 0 )
		if currRewardContainer.reward.Rewards ~= nil and currRewardContainer.reward.Rewards.count ~= nil then
			for currRewardIndex = 1, currRewardContainer.reward.Rewards.count, 1 do
				local currRewardItemModel = Engine.CreateModel( currRewardCarouselItemModel, "reward" .. currRewardIndex .. "Info" )
				local currReward = currRewardContainer.reward.Rewards[currRewardIndex]
				Engine.SetModelValue( Engine.CreateModel( currRewardItemModel, "rewardName" ), currReward.name )
				Engine.SetModelValue( Engine.CreateModel( currRewardItemModel, "rewardImage" ), currReward.icon )
				Engine.SetModelValue( Engine.CreateModel( currRewardItemModel, "rewardDesc" ), currReward.description )
				Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "reward" .. currRewardIndex .. "InfoVisible" ), 1 )
			end
		end
	end
end

CoD.AARUtilityCP.GetModelForRewardItemByIndex = function ( controller, index )
	return Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards." .. index )
end

local AddToArray = function ( array, element )
	if array.count == nil then
		array.count = 0
	end
	array.count = array.count + 1
	array[array.count] = element
end

local InitRewards = function ()
	CoD.AARUtilityCP.Rewards = {}
	CoD.AARUtilityCP.Rewards.count = 0
end

local AddReward = function ( reward, type )
	local rewardContainer = {
		type = type,
		reward = reward
	}
	AddToArray( CoD.AARUtilityCP.Rewards, rewardContainer )
end

local CheckRankRewards = function ( controllerNum, rankReward, column )
	local rewardsString = Engine.TableLookup( controllerNum, CoD.rankTable, 0, rankReward.rank, column )
	if rankReward.Rewards == nil then
		rankReward.Rewards = {}
	end
	for reward in rewardsString:gmatch( "%S+" ) do
		local rewardContainer = {}
		if reward == "token" then
			rewardContainer.name = ""
			rewardContainer.description = "MPUI_UNLOCK_TOKEN"
			rewardContainer.icon = "uie_img_t7_menu_cacselection_icontokenlarge"
		else
			local iconString = Engine.TableLookup( controllerNum, CoD.statsTable, 4, reward, 6 ) .. "_kf"
			rewardContainer.name = Engine.TableLookup( controllerNum, CoD.statsTable, 4, reward, 3 )
			rewardContainer.description = Engine.TableLookup( controllerNum, CoD.statsTable, 4, reward, 7 )
			rewardContainer.icon = iconString
		end
		AddToArray( rankReward.Rewards, rewardContainer )
	end
end

local CheckRankAndPrestige = function ( controllerNum, currentStats, statsBeforeMatch )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	local weaponUnlockColumn = 8
	local attachmentUnlockColumn = 12
	local tokenUnlockColumn = 17
	if useTestData then
		local rankReward = {
			icon = "rank_lcpl_128",
			title = "SOME HIGH RANK",
			description = "Level Someting",
			rank = 1
		}
		for unlockColumn = weaponUnlockColumn, attachmentUnlockColumn, 1 do
			CheckRankRewards( controllerNum, rankReward, unlockColumn )
		end
		CheckRankRewards( controllerNum, rankReward, tokenUnlockColumn )
		AddReward( rankReward, "RANK" )
	else
		local rankUp = GetMatchStat( controllerNum, "RANK" )
		if rankUp > 0 then
			local weaponUnlockColumn = 8
			local attachmentUnlockColumn = 12
			local currRank = statsBeforeMatch.PlayerStatsList.RANK.StatValue:get()
			for rank = 1, rankUp, 1 do
				local rankReward = {
					icon = "t7_icon_rank_cp_level_" .. string.format( "%02d", currRank + rank + 1 ) .. "_lrg",
					title = Engine.GetRankName( currRank + rank + 1 ),
					description = Engine.Localize( "MENU_LEVEL" ) .. " " .. currRank + rank + 1,
					rank = currRank + rank
				}
				for unlockColumn = weaponUnlockColumn, attachmentUnlockColumn, 1 do
					CheckRankRewards( controllerNum, rankReward, unlockColumn )
				end
				CheckRankRewards( controllerNum, rankReward, tokenUnlockColumn )
				AddReward( rankReward, "RANK" )
			end
		end
	end
end

local CheckWeaponRewards = function ( controllerNum, weaponReward, weaponReference, weaponRank )
	local unlockString = Engine.TableLookup( controllerNum, CoD.gunLevelsTable, 2, weaponReference, 0, weaponRank, 3 )
	local xpEarnedString = Engine.TableLookup( controllerNum, CoD.gunLevelsTable, 2, weaponReference, 0, weaponRank, 4 )
	if weaponReward.Rewards == nil then
		weaponReward.Rewards = {}
	end
	if unlockString ~= nil and unlockString ~= "" then
		local attachmentReward = {
			name = Engine.TableLookup( controllerNum, CoD.attachmentTable, 4, unlockString, 3 ),
			icon = Engine.TableLookup( controllerNum, CoD.attachmentTable, 4, unlockString, 6 ),
			description = "Attachment"
		}
		AddToArray( weaponReward.Rewards, attachmentReward )
	end
	if xpEarnedString ~= nil and xpEarnedString ~= "0" then
		local xpReward = {
			name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( xpEarnedString ) ) ),
			icon = "",
			description = ""
		}
		AddToArray( weaponReward.Rewards, xpReward )
	end
end

local CheckWeaponLevels = function ( controllerNum, currentStats, statsBeforeMatch )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	if useTestData then
		local weaponReward = {
			icon = "t7_icon_weapon_ar_standard_sm",
			title = "ARAK 74",
			description = "Level 2"
		}
		CheckWeaponRewards( controllerNum, weaponReward, "ar_standard", 2 )
		AddReward( weaponReward, "WEAPON" )
	else
		for currWeaponIndex = 1, 58, 1 do
			local weaponReference = Engine.TableLookup( controllerNum, CoD.statsTable, 0, currWeaponIndex, 4 )
			if weaponReference ~= nil and weaponReference ~= "" then
				local weaponName = Engine.TableLookup( controllerNum, CoD.statsTable, 0, currWeaponIndex, 3 )
				local currWeaponLevel = Engine.GetGunCurrentRank( controllerNum, currWeaponIndex )
				local pastWeaponLevel = Engine.GetGunStableRank( controllerNum, currWeaponIndex )
				local weaponLevelDelta = currWeaponLevel - pastWeaponLevel
				if weaponLevelDelta > 0 then
					for weaponLevel = 1, weaponLevelDelta, 1 do
						local weaponReward = {
							icon = Engine.TableLookup( controllerNum, CoD.statsTable, 0, currWeaponIndex, 6 ),
							title = weaponName,
							description = "Level " .. pastWeaponLevel + weaponLevel
						}
						CheckWeaponRewards( controllerNum, weaponReward, weaponReference, pastWeaponLevel + weaponLevel )
						AddReward( weaponReward, "WEAPON" )
					end
				end
			end
		end
	end
end

local GetAccoladeMapStatValue = function ( currentStats, accoladeIndex )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	if useTestData then
		return tonumber( Engine.TableLookup( controllerNum, CoD.statsMilestone, 0, accoladeIndex, 2 ) )
	else
		local accoladeStatValue = currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[accoladeIndex]:get()
		return accoladeStatValue << 3 >> 3
	end
end

local GetAccoladeMapStatState = function ( currentStats, accoladeIndex )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	if useTestData then
		return CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_NOT_SEEN
	else
		local accoladeStatValue = currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[accoladeIndex]:get()
		return (accoladeStatValue & CoD.AARUtilityCP.ACCOLADE_STATE_MASK) >> CoD.AARUtilityCP.ACCOLADE_STATE_BITS
	end
end

local SetAccoladeMapStatState = function ( currentStats, accoladeIndex, state )
	local accoladeStatValue = GetAccoladeMapStatValue( currentStats, accoladeIndex )
	local shiftedState = state << CoD.AARUtilityCP.ACCOLADE_STATE_BITS
	local finalStatValue = accoladeStatValue | shiftedState
	currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[accoladeIndex]:set( finalStatValue )
end

local SetAccoladeMapStatValue = function ( currentStats, accoladeIndex, value )
	local accoladeStatState = GetAccoladeMapStatState( currentStats, accoladeIndex )
	local shiftedState = accoladeStatState << CoD.AARUtilityCP.ACCOLADE_STATE_BITS
	local finalStatValue = accoladeStatState | shiftedState
	currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[accoladeIndex]:set( finalStatValue )
end

local CheckAccolades = function ( controllerNum, currentStats, statsBeforeMatch )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	if useTestData then
		local accoladeReward = {
			icon = "uie_headicon_dead",
			title = "Accolade",
			description = "Can't Touch This"
		}
		AddReward( accoladeReward, "ACCOLADE" )
	else
		local f24_local0 = "MISSION_"
		local f24_local1 = CoD.AARUtilityCP.GetLastMissionName()
		local missionString = f24_local0 .. f24_local1:upper() .. "_UNTOUCHED"
		local startIndex = Engine.TableLookup( controllerNum, CoD.statsMilestone, 4, missionString, 0 )
		for accoladeIndex = 0, 18, 1 do
			local accoladeState = GetAccoladeMapStatState( currentStats, accoladeIndex )
			if accoladeState ~= CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_SEEN then
				if accoladeState == CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_NOT_SEEN then
					local accoladeReward = {
						icon = "uie_headicon_dead",
						title = "Accolade",
						description = Engine.TableLookup( controllerNum, CoD.statsMilestone, 0, accoladeIndex + startIndex, 5 )
					}
					AddReward( accoladeReward, "ACCOLADE" )
					SetAccoladeMapStatState( currentStats, accoladeIndex, CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_SEEN )
				else
					SetAccoladeMapStatValue( currentStats, accoladeIndex, 0 )
				end
			end
		end
	end
end

CoD.AARUtilityCP.GetRewardItemCount = function ( controller )
	local controllerNum = controller
	if type( controllerNum ) ~= "number" then
		controllerNum = controller.controller
	end
	if CoD.AARUtilityCP.Rewards == nil then
		InitRewards()
		local currentStats = CoD.GetPlayerStats( controllerNum )
		local statsBeforeMatch = CoD.GetPlayerStats( controllerNum )
		CheckRankAndPrestige( controllerNum, currentStats, statsBeforeMatch )
		CheckWeaponLevels( controllerNum, currentStats, statsBeforeMatch )
		CheckAccolades( controllerNum, currentStats, statsBeforeMatch )
		UploadStats( self, controller )
	end
	return CoD.AARUtilityCP.Rewards.count
end

