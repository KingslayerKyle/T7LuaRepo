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
CoD.AARUtilityCP.UnlockTokenIcon = "uie_img_t7_menu_cacselection_icontokenlarge_CP"
CoD.AARUtilityCP.GetLastMapName = function ( controller )
	if CoD.perController[controller].playedTrainingSim then
		CoD.perController[controller].playedTrainingSim = nil
		return Dvar.ui_mapname:get()
	elseif CoD.perController[controller].lastAARMapName == nil then
		local mapName = Dvar.last_map:get()
		if mapName == nil or mapName == false then
			return Dvar.ui_mapname:get()
		end
		local mapData = CoD.MapUtility.MapsTable[mapName]
		CoD.perController[controller].lastAARMapName = mapData.rootMapName
	end
	return CoD.perController[controller].lastAARMapName
end

CoD.AARUtilityCP.GetLastMissionName = function ( controller )
	if CoD.AARUtilityCP.lastMissionName == nil then
		local mapData = CoD.MapUtility.MapsTable[CoD.AARUtilityCP.GetLastMapName( controller )]
		CoD.AARUtilityCP.lastMissionName = mapData.missionName
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

CoD.AARUtilityCP.GetMatchStat = function ( controller, statName )
	local currentStats = nil
	currentStats = CoD.GetPlayerStats( controller )
	local newStatValue = currentStats.PlayerStatsList[statName].StatValue:get()
	local oldStatValue = currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName( controller )].currentStats[statName]:get()
	local newStatValueNum = math.floor( newStatValue )
	local oldStatValueNum = math.floor( oldStatValue )
	if newStatValueNum < oldStatValueNum then
		DebugPrint( "CoDAARUtilityCP: GetMatchStat was going to be negative!" )
		DebugPrint( "\n PlayerStatsList[" .. statName .. "].statValue:get() == " .. newStatValue )
		DebugPrint( "\n PlayerStatsByMap[currentmap].currentStats[" .. statName .. "]:get() == " .. oldStatValue )
		return 0
	else
		return newStatValueNum - oldStatValueNum
	end
end

CoD.AARUtilityCP.GetMissionHighestStat = function ( controller, statName )
	local missionName = CoD.AARUtilityCP.GetLastMapName( controller )
	local currentStats = CoD.GetPlayerStats( controller )
	return currentStats.PlayerStatsByMap[missionName].highestStats[statName]:get()
end

CoD.AARUtilityCP.SetMissionHighestStat = function ( controller, statName, statValue )
	local missionName = CoD.AARUtilityCP.GetLastMapName( controller )
	local currentStats = CoD.GetPlayerStats( controller )
	currentStats.PlayerStatsByMap[missionName].highestStats[statName]:set( statValue )
end

CoD.AARUtilityCP.AddToArray = function ( array, element )
	if array.count == nil then
		array.count = 0
	end
	array.count = array.count + 1
	array[array.count] = element
end

CoD.AARUtilityCP.InitRewards = function ( rewardsArray )
	rewardsArray = {
		count = 0
	}
end

CoD.AARUtilityCP.AddReward = function ( rewardsArray, reward, type )
	local rewardContainer = {
		type = type,
		reward = reward
	}
	CoD.AARUtilityCP.AddToArray( rewardsArray, rewardContainer )
end

CoD.AARUtilityCP.GetScoreboardTeamTable = function ( controller, teamNum )
	local sortedTeams = Engine.GetTeamPositions( controller, Engine.GetCurrentTeamCount() )
	if Engine.GetCurrentTeamCount() < 2 and teamNum == 2 then
		return {}
	end
	local teamEnum = sortedTeams[teamNum].team
	local team1Count = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES )
	local currentStats = Engine.GetPlayerStats( controller )
	local scoreboardModels = {}
	local controllerModel = Engine.GetModelForController( controller )
	local scoreboardInfoModel = Engine.CreateModel( controllerModel, "scoreboardInfo" )
	local teamTable = {}
	for index = 1, team1Count, 1 do
		local clientInfoString = "team: " .. teamEnum .. " client: " .. index - 1
		local clientNum = -1
		if Engine.GetScoreboardTeamClientCount( teamEnum ) < index then
			clientInfoString = "team: " .. teamEnum .. " client: -1"
		else
			clientNum = Engine.GetScoreboardPlayerData( index - 1, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_CLIENTNUM )
		end
		clientInfoString = clientInfoString .. " " .. Engine.milliseconds()
		local playerScore = currentStats.AfterActionReportStats.playerStats[clientNum].score:get()
		local playerKills = currentStats.AfterActionReportStats.playerStats[clientNum].kills:get()
		local playerDeaths = currentStats.AfterActionReportStats.playerStats[clientNum].deaths:get()
		local playerAssists = currentStats.AfterActionReportStats.playerStats[clientNum].assists:get()
		local playerRevives = currentStats.AfterActionReportStats.playerStats[clientNum].revives:get()
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
		newTable.models.ping = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1." .. clientNum .. ".ping" ) )
		table.insert( teamTable, newTable )
	end
	return teamTable
end

CoD.AARUtilityCP.SetupUIModels = function ( controller )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	local currentStats = nil
	local currentStats = CoD.GetPlayerStats( controller )
	local currentRank = currentStats.PlayerStatsList.RANK.StatValue:get()
	local currPrestige = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	local currRankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
	local xpBeforeMatch = currentStats.currentRankXP:get()
	local xpEarnedDuringMatch = CoD.AARUtilityCP.GetXPEarnedDuringMatch( currRankXP, xpBeforeMatch )
	local lastMapName = CoD.AARUtilityCP.GetLastMapName( controller )
	local aarStats = currentStats.AfterActionReportStats
	local stats = {}
	stats.nextLevel, stats.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank + 1, currPrestige + 1 )
	if useTestData then
		stats.kills = 24
		stats.assists = 14
		stats.score = 11550
		stats.revives = 3
		stats.incaps = 2
		stats.difficulty = 1
		stats.showBestScoreIcon = 1
		stats.showBestKillsIcon = 1
		stats.showBestCompletionTimeIcon = 1
		stats.showBestIncapsIcon = 1
		stats.showBestAssistsIcon = 1
		stats.showBestRevivesIcon = 1
	else
		stats.kills = CoD.AARUtilityCP.GetMatchStat( controller, "KILLS" )
		stats.assists = CoD.AARUtilityCP.GetMatchStat( controller, "ASSISTS" )
		stats.score = CoD.AARUtilityCP.GetMatchStat( controller, "SCORE" )
		stats.revives = CoD.AARUtilityCP.GetMatchStat( controller, "REVIVES" )
		stats.incaps = CoD.AARUtilityCP.GetMatchStat( controller, "INCAPS" )
		stats.difficulty = currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName( controller )].lastCompletedDifficulty:get()
		stats.showBestScoreIcon = 0
		stats.showBestKillsIcon = 0
		stats.showBestDifficultyIcon = 0
		stats.showBestIncapsIcon = 0
		stats.showBestAssistsIcon = 0
		stats.showBestRevivesIcon = 0
		local highestScore = CoD.AARUtilityCP.GetMissionHighestStat( controller, "SCORE" )
		local highestKills = CoD.AARUtilityCP.GetMissionHighestStat( controller, "KILLS" )
		local highestAssists = CoD.AARUtilityCP.GetMissionHighestStat( controller, "ASSISTS" )
		local highestRevives = CoD.AARUtilityCP.GetMissionHighestStat( controller, "REVIVES" )
		local bestIncaps = CoD.AARUtilityCP.GetMissionHighestStat( controller, "INCAPS" )
		local highestDifficulty = CoD.AARUtilityCP.GetMissionHighestStat( controller, "HIGHEST_DIFFICULTY" )
		if highestScore < stats.score and highestScore ~= nil then
			stats.showBestScoreIcon = 1
		end
		if highestKills < stats.kills and highestKills ~= nil then
			stats.showBestKillsIcon = 1
		end
		if highestAssists < stats.assists and highestAssists ~= nil then
			stats.showBestAssistsIcon = 1
		end
		if highestRevives < stats.revives and highestRevives ~= nil then
			stats.showBestRevivesIcon = 1
		end
		if stats.incaps < bestIncaps and bestIncaps ~= nil then
			stats.showBestIncapsIcon = 1
		end
		if highestDifficulty < stats.difficulty then
			stats.showBestDifficultyIcon = 1
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

CoD.AARUtilityCP.GetModelForRewardItemByIndex = function ( controller, index )
	return Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards." .. index )
end

CoD.AARUtilityCP.CheckRankRewards = function ( controllerNum, rankReward, column )
	local rewardsString = Engine.TableLookup( CoD.rankTable, column, 0, rankReward.rank )
	if rankReward.Rewards == nil then
		rankReward.Rewards = {}
	end
	for reward in rewardsString:gmatch( "%S+" ) do
		local rewardContainer = {}
		if reward == "token" then
			local unlockTokenCount = 1
			local extraUnlockTokenString = Engine.TableLookup( CoD.rankTable, 18, 0, rankReward.rank )
			if extraUnlockTokenString ~= nil and extraUnlockTokenString ~= "" then
				unlockTokenCount = unlockTokenCount + tonumber( extraUnlockTokenString )
			end
			rewardContainer.name = Engine.Localize( "CPUI_ADD_UNLOCK_TOKENS", unlockTokenCount )
			rewardContainer.description = ""
			rewardContainer.icon = CoD.AARUtilityCP.UnlockTokenIcon
		else
			local iconString = Engine.TableLookup( CoD.statsTable, 6, 4, reward ) .. "_rwd"
			if string.find( reward, "cybercom" ) then
				iconString = Engine.TableLookup( CoD.statsTable, 6, 4, reward )
			end
			rewardContainer.name = Engine.TableLookup( CoD.statsTable, 3, 4, reward )
			rewardContainer.description = Engine.TableLookup( CoD.statsTable, 18, 4, reward )
			rewardContainer.icon = iconString
		end
		CoD.AARUtilityCP.AddToArray( rankReward.Rewards, rewardContainer )
	end
end

CoD.AARUtilityCP.GetRankForRankXP = function ( controller, rankXP )
	for rank = 0, 19, 1 do
		local maxxpForRank = tonumber( Engine.TableLookup( CoD.rankTable, 7, 0, rank ) )
		if rankXP < maxxpForRank then
			return rank
		end
	end
	return 19
end

CoD.AARUtilityCP.CheckRankAndPrestige = function ( controllerNum, currentStats, rewardsArray )
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
			CoD.AARUtilityCP.CheckRankRewards( controllerNum, rankReward, unlockColumn )
		end
		CoD.AARUtilityCP.CheckRankRewards( controllerNum, rankReward, tokenUnlockColumn )
		CoD.AARUtilityCP.AddReward( rewardsArray, rankReward, "RANK" )
	elseif currentStats and currentStats.currentRankXP then
		local prevRankXP = currentStats.currentRankXP:get()
		local prevRank = CoD.AARUtilityCP.GetRankForRankXP( controllerNum, prevRankXP )
		local currRankXP = currentStats.PlayerStatsList.RANKXP.statValue:get()
		local currRank = CoD.AARUtilityCP.GetRankForRankXP( controllerNum, currRankXP )
		local rankUp = currRank - prevRank
		if rankUp > 0 then
			local weaponUnlockColumn = 8
			local attachmentUnlockColumn = 12
			for rank = 1, rankUp, 1 do
				local rankReward = {
					icon = "t7_icon_rank_cp_level_" .. string.format( "%02d", prevRank + rank + 1 ) .. "_lrg",
					title = CoD.GetRankName( prevRank + rank, 0 ),
					description = Engine.Localize( "MENU_LEVEL" ) .. " " .. prevRank + rank + 1,
					rank = prevRank + rank
				}
				for unlockColumn = weaponUnlockColumn, attachmentUnlockColumn, 1 do
					CoD.AARUtilityCP.CheckRankRewards( controllerNum, rankReward, unlockColumn )
				end
				CoD.AARUtilityCP.CheckRankRewards( controllerNum, rankReward, tokenUnlockColumn )
				CoD.AARUtilityCP.AddReward( rewardsArray, rankReward, "RANK" )
			end
		end
	end
end

CoD.AARUtilityCP.CheckWeaponRewards = function ( controllerNum, weaponReward, weaponIndex, unlockString, xpEarnedString )
	if weaponReward.Rewards == nil then
		weaponReward.Rewards = {}
	end
	if unlockString ~= nil and unlockString ~= "" then
		local attachmentReward = {}
		local attachmentIndex = Engine.TableLookup( CoD.attachmentTable, 0, 4, unlockString )
		attachmentReward.name = Engine.TableLookup( CoD.attachmentTable, 3, 4, unlockString )
		attachmentReward.icon = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, weaponIndex, tonumber( attachmentIndex ) )
		attachmentReward.description = "CPUI_ATTACHMENT"
		CoD.AARUtilityCP.AddToArray( weaponReward.Rewards, attachmentReward )
	end
	if xpEarnedString ~= nil and xpEarnedString ~= "0" and xpEarnedString ~= "" then
		local xpReward = {
			name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( xpEarnedString ) ) ),
			icon = "t7_hud_mp_notifications_xp_blue",
			description = ""
		}
		CoD.AARUtilityCP.AddToArray( weaponReward.Rewards, xpReward )
	end
end

CoD.AARUtilityCP.CheckWeaponLevels = function ( controllerNum, currentStats, rewardsArray )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	if useTestData then
		local weaponReward = {
			icon = "t7_icon_weapon_ar_standard_sm",
			title = "ARAK 74",
			description = "Level 2"
		}
		CoD.AARUtilityCP.CheckWeaponRewards( controllerNum, weaponReward, 2, "ar_standard", 2 )
		CoD.AARUtilityCP.AddReward( rewardsArray, weaponReward, "WEAPON" )
	elseif currentStats and currentStats.currentWeaponLevels then
		for currWeaponIndex = 1, 57, 1 do
			local weaponReference = Engine.TableLookup( CoD.statsTable, 4, 0, currWeaponIndex )
			if weaponReference ~= nil and weaponReference ~= "" then
				local weaponName = Engine.TableLookup( CoD.statsTable, 3, 0, currWeaponIndex )
				local currWeaponXP = currentStats.itemstats[currWeaponIndex].xp:get()
				local pastWeaponLevel = currentStats.currentWeaponLevels[currWeaponIndex]:get()
				local weaponLevelRows = Engine.TableFindRows( CoD.gunLevelsTable, 2, weaponReference )
				if weaponLevelRows ~= nil then
					local maxWeaponLevel = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, weaponLevelRows[#weaponLevelRows], 0 ) )
					local maxLevelRow = weaponLevelRows[#weaponLevelRows]
					if pastWeaponLevel < maxWeaponLevel then
						local weaponLevelRow = weaponLevelRows[1]
						while Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, weaponLevelRow, 1 ) == "0" do
							weaponLevelRow = weaponLevelRow + 1
						end
						while tonumber( Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, weaponLevelRow, 0 ) ) < pastWeaponLevel do
							weaponLevelRow = weaponLevelRow + 1
						end
						local xpValue = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, weaponLevelRow, 1 )
						while tonumber( xpValue ) < currWeaponXP do
							local attachmentName = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, weaponLevelRow, 3 )
							local xpEarned = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, weaponLevelRow, 4 )
							local levelUp = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, weaponLevelRow, 0 )
							if attachmentName ~= "" then
								local weaponReward = {
									icon = Engine.TableLookup( CoD.statsTable, 6, 0, currWeaponIndex ),
									title = weaponName,
									description = Engine.Localize( "MENU_LEVEL" ) .. " " .. tonumber( levelUp ) + 2
								}
								CoD.AARUtilityCP.CheckWeaponRewards( controllerNum, weaponReward, currWeaponIndex, attachmentName, xpEarned )
								CoD.AARUtilityCP.AddReward( rewardsArray, weaponReward, "WEAPON" )
							end
							weaponLevelRow = weaponLevelRow + 1
							if maxLevelRow < weaponLevelRow then
								break
							end
							xpValue = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, weaponLevelRow, 1 )
							if xpValue == nil then
								break
							end
						end
					end
				end
				local weaponGroup = Engine.TableLookup( CoD.statsTable, 2, 0, currWeaponIndex )
				local challengeRows = Engine.TableFindRows( CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN ), 3, weaponGroup )
				if challengeRows ~= nil then
					for challengeIndex = 1, #challengeRows, 1 do
						if currentStats.ItemStats[currWeaponIndex].challengeCompleted[challengeIndex - 1]:get() == 1 then
							local camo_reference = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN ), challengeRows[challengeIndex], 9 )
							local camo_name = Engine.TableLookup( CoD.attachmentTable, 3, 4, camo_reference )
							local camo_icon = Engine.TableLookup( CoD.attachmentTable, 6, 4, camo_reference )
							local weaponName = Engine.TableLookup( CoD.statsTable, 3, 0, currWeaponIndex )
							local challengeReward = {
								icon = camo_icon,
								title = camo_name,
								description = weaponName,
								Rewards = {}
							}
							local xpReward = {}
							local xpEarnedString = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN ), challengeRows[challengeIndex], 6 )
							xpReward.name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( xpEarnedString ) ) )
							xpReward.icon = "t7_hud_mp_notifications_xp_blue"
							xpReward.description = ""
							CoD.AARUtilityCP.AddToArray( challengeReward.Rewards, xpReward )
							CoD.AARUtilityCP.AddReward( rewardsArray, challengeReward, "WEAPON_CHALLENGE" )
							currentStats.ItemStats[currWeaponIndex].challengeCompleted[challengeIndex - 1]:set( 0 )
						end
					end
				end
			end
		end
	end
end

CoD.AARUtilityCP.GetAccoladeMapStatValue = function ( controller, currentStats, accoladeIndex )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	if useTestData then
		return tonumber( Engine.TableLookup( CoD.statsMilestone, 2, 0, accoladeIndex ) )
	else
		return currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName( controller )].accolades[accoladeIndex].value:get()
	end
end

CoD.AARUtilityCP.GetAccoladeMapStatState = function ( controller, currentStats, accoladeIndex )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	if useTestData then
		return CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_NOT_SEEN
	else
		return currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName( controller )].accolades[accoladeIndex].state:get()
	end
end

CoD.AARUtilityCP.SetAccoladeMapStatState = function ( controller, currentStats, accoladeIndex, state )
	currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName( controller )].accolades[accoladeIndex].state:set( state )
end

CoD.AARUtilityCP.SetAccoladeMapStatValue = function ( controller, currentStats, accoladeIndex, value )
	currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName( controller )].accolades[accoladeIndex].value:set( value )
end

CoD.AARUtilityCP.GetAccoladeIconFromType = function ( accoladeType )
	local type = string.lower( accoladeType )
	if type == "accuracy" then
		return "uie_accuracy"
	elseif type == "airvehicledestroy" then
		return "uie_air_vehicle"
	elseif type == "bullshark" then
		return "uie_bullshark"
	elseif type == "cybernetics" then
		return "uie_cybernetics"
	elseif type == "defend" then
		return "uie_protect"
	elseif type == "explosion" then
		return "uie_explosion"
	elseif type == "find" then
		return "uie_collectibles"
	elseif type == "grenade" then
		return "uie_grenade"
	elseif type == "groundvehicledestroy" then
		return "uie_ground_vehicle"
	elseif type == "heavyweapon" then
		return "uie_heavy_weapon"
	elseif type == "kills" then
		return "uie_kill"
	elseif type == "melee" then
		return "uie_melee"
	elseif type == "score" then
		return "uie_score"
	elseif type == "stealth" then
		return "uie_stealth"
	elseif type == "traversal" then
		return "uie_traversal"
	elseif type == "trickshot" then
		return "uie_trickshot"
	elseif type == "untouched" then
		return "uie_indestructible"
	elseif type == "weapon" then
		return "uie_weapons"
	else
		
	end
end

CoD.AARUtilityCP.CheckAccolades = function ( controllerNum, currentStats, rewardsArray )
	local useTestData = CoD.AARUtilityCP.UseTestData()
	if useTestData then
		local accoladeReward = {
			icon = "uie_headicon_dead",
			title = "Accolade",
			description = "Can't Touch This"
		}
		CoD.AARUtilityCP.AddReward( rewardsArray, accoladeReward, "ACCOLADE" )
	elseif currentStats ~= nil then
		if CoD.AARUtilityCP.GetLastMissionName( controllerNum ) == nil then
			return 
		end
		local f25_local0 = "MISSION_"
		local f25_local1 = CoD.AARUtilityCP.GetLastMissionName( controllerNum )
		local missionString = f25_local0 .. f25_local1:upper() .. "_UNTOUCHED"
		local startIndex = Engine.TableLookup( CoD.statsMilestone, 0, 4, missionString )
		if startIndex == "" then
			return 
		end
		local mapData = CoD.MapUtility.MapsTable[CoD.AARUtilityCP.GetLastMapName( controllerNum )]
		if mapData.accoladelist == nil then
			return 
		end
		local accoladeList = Engine.GetAssetList( CoD.MapUtility.MapsTable[CoD.AARUtilityCP.GetLastMapName( controllerNum )].accoladelist )
		for accoladeIndex = 0, 18, 1 do
			local accoladeState = CoD.AARUtilityCP.GetAccoladeMapStatState( controllerNum, currentStats, accoladeIndex )
			if accoladeState ~= CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_SEEN then
				if accoladeState == CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_NOT_SEEN then
					local accoladeReference = Engine.TableLookup( CoD.statsMilestone, 4, 0, accoladeIndex + startIndex )
					local accoladeIcon = "uie_headicon_dead"
					for index, accoladeAsset in pairs( accoladeList ) do
						if accoladeAsset.challengeReference == accoladeReference then
							accoladeIcon = CoD.AARUtilityCP.GetAccoladeIconFromType( accoladeAsset.challengeWidget )
							break
						end
					end
					local accoladeReward = {
						icon = accoladeIcon,
						title = Engine.TableLookup( CoD.statsMilestone, 5, 0, accoladeIndex + startIndex ) .. "_NAME",
						description = "ACCOLADES_ACCOLADE_COMPLETED"
					}
					local rewardsToken = Engine.TableLookup( CoD.statsMilestone, 7, 0, accoladeIndex + startIndex )
					accoladeReward.Rewards = {}
					if rewardsToken ~= nil and rewardsToken ~= "" then
						local accoladeRewardItem = {
							name = "CPUI_ADD_UNLOCK_TOKEN",
							description = "",
							icon = CoD.AARUtilityCP.UnlockTokenIcon
						}
						CoD.AARUtilityCP.AddToArray( accoladeReward.Rewards, accoladeRewardItem )
					end
					local rewardsXP = Engine.TableLookup( CoD.statsMilestone, 6, 0, accoladeIndex + startIndex )
					if rewardsXP ~= nil and rewardsXP ~= "" then
						local accoladeXPItem = {
							name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( rewardsXP ) ) ),
							description = "",
							icon = "t7_hud_mp_notifications_xp_blue"
						}
						CoD.AARUtilityCP.AddToArray( accoladeReward.Rewards, accoladeXPItem )
					end
					CoD.AARUtilityCP.AddReward( rewardsArray, accoladeReward, "ACCOLADE" )
					CoD.AARUtilityCP.SetAccoladeMapStatState( controllerNum, currentStats, accoladeIndex, CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_SEEN )
				end
				CoD.AARUtilityCP.SetAccoladeMapStatValue( controllerNum, currentStats, accoladeIndex, 0 )
			end
		end
	end
end

CoD.AARUtilityCP.GetDifficultyFromIndex = function ( index )
	if index == 0 then
		return "RECRUIT"
	elseif index == 1 then
		return "REGULAR"
	elseif index == 2 then
		return "HARDENED"
	elseif index == 3 then
		return "VETERAN"
	else
		return "HEROIC"
	end
end

CoD.AARUtilityCP.CheckMissionRewards = function ( controller, currentStats, rewardsArray )
	local mapName = CoD.AARUtilityCP.GetLastMapName( controller )
	local getMissionReward = false
	local firstTimeCompleting = true
	local xpCurrentDifficulties = 0
	local xpLowerDifficulties = 0
	for difficulty = 0, 5, 1 do
		local previousCompletionDifficulty = currentStats.PlayerStatsByMap[mapName].previousCompletedDifficulties[difficulty]:get()
		local previousReceivedXPForDifficulty = currentStats.PlayerStatsByMap[mapName].previousReceivedXPForDifficulty[difficulty]:get()
		local receivedXPForDifficulty = currentStats.PlayerStatsByMap[mapName].receivedXPForDifficulty[difficulty]:get()
		if previousCompletionDifficulty == 1 then
			firstTimeCompleting = false
		end
		if previousReceivedXPForDifficulty ~= receivedXPForDifficulty then
			getMissionReward = true
			local difficultyString = "complete_mission_" .. CoD.AARUtilityCP.GetDifficultyFromIndex( difficulty )
			if difficulty == currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName( controller )].lastCompletedDifficulty:get() then
				xpCurrentDifficulties = xpCurrentDifficulties + tonumber( Engine.TableLookup( CoD.scoreInfoTable, 23, 0, difficultyString ) )
			else
				xpLowerDifficulties = xpLowerDifficulties + tonumber( Engine.TableLookup( CoD.scoreInfoTable, 23, 0, difficultyString ) )
			end
		end
	end
	if getMissionReward == true then
		local mapData = CoD.MapUtility.MapsTable[mapName]
		local missionReward = {
			icon = "t7_cp_hud_mission_complete",
			title = "COOP_SMUI_MISSION_COMPLETE",
			description = mapData.mapName,
			Rewards = {}
		}
		local xpReward = {
			name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", xpCurrentDifficulties ) ),
			icon = "t7_hud_mp_notifications_xp_blue",
			description = "MENU_COMPLETED_" .. CoD.AARUtilityCP.GetDifficultyFromIndex( currentStats.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName( controller )].lastCompletedDifficulty:get() )
		}
		CoD.AARUtilityCP.AddToArray( missionReward.Rewards, xpReward )
		if xpLowerDifficulties ~= 0 then
			local lowerXpReward = {
				name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", xpLowerDifficulties ) ),
				icon = "t7_hud_mp_notifications_xp_blue",
				description = "CPUI_LOWER_DIFFICULTIES"
			}
			CoD.AARUtilityCP.AddToArray( missionReward.Rewards, lowerXpReward )
		end
		if firstTimeCompleting == true then
			local unlockTokenReward = {
				name = "CPUI_ADD_UNLOCK_TOKEN",
				description = "",
				icon = CoD.AARUtilityCP.UnlockTokenIcon
			}
			CoD.AARUtilityCP.AddToArray( missionReward.Rewards, unlockTokenReward )
		end
		local outfitReward = {}
		local outfitIndex = tonumber( Engine.TableLookup( CoD.getStatsMilestoneTable( 2, Enum.eModes.MODE_CAMPAIGN ), 2, 1, "bodystyle", 3, CoD.AARUtilityCP.GetLastMapName( controller ) ) ) + 1
		CoD.PlayerRoleUtility.customizationMode = Enum.eModes.MODE_CAMPAIGN
		CoD.PlayerRoleUtility.SetEdittingHero( controller, Engine.GetEquippedHero( controller, CoD.PlayerRoleUtility.customizationMode ) )
		CoD.PlayerRoleUtility.Heroes.heroCustomizationTable = Engine.GetHeroCustomizationTable( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
		local outfitItem = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.bodies[outfitIndex]
		outfitReward.name = "CPUI_OUTFIT"
		outfitReward.icon = outfitItem.icon .. "_nstrm"
		outfitReward.description = outfitItem.name
		CoD.AARUtilityCP.AddToArray( missionReward.Rewards, outfitReward )
		CoD.AARUtilityCP.AddReward( rewardsArray, missionReward, "MISSION" )
	end
end

CoD.AARUtilityCP.CheckRatingRewards = function ( controller, currentStats, rewardsArray )
	local f28_local0 = CoD.MapUtility.MapsTable
	local f28_local1 = Dvar.ui_mapname
	if f28_local0[REG4:get()].isSafeHouse ~= true then
		return 
	end
	local ratingAssets = Engine.GetAssetList( "rating_list" )
	for difficulty = 0, 3, 1 do
		local currentCompletionDifficulty = currentStats.PlayerStatsByMap.cp_sh_cairo.completedDifficulties[difficulty]:get()
		local previousCompletionDifficulty = currentStats.PlayerStatsByMap.cp_sh_cairo.previousCompletedDifficulties[difficulty]:get()
		if currentCompletionDifficulty ~= previousCompletionDifficulty then
			local ratingAsset = ratingAssets[difficulty + 1]
			local ratingReward = {
				icon = ratingAsset.ratingImage,
				title = ratingAsset.ratingName,
				description = "CPUI_RATING_EARNED",
				Rewards = {}
			}
			local unlockTokenReward = {
				name = Engine.Localize( "CPUI_ADD_UNLOCK_TOKENS", ratingAsset.tokensAwarded ),
				icon = CoD.AARUtilityCP.UnlockTokenIcon,
				description = ""
			}
			CoD.AARUtilityCP.AddToArray( ratingReward.Rewards, unlockTokenReward )
			local xpReward = {
				name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", ratingAsset.xpAwarded ) ),
				icon = "t7_hud_mp_notifications_xp_blue",
				description = ""
			}
			CoD.AARUtilityCP.AddToArray( ratingReward.Rewards, xpReward )
			CoD.AARUtilityCP.AddReward( rewardsArray, ratingReward, "RATING" )
		end
	end
end

CoD.AARUtilityCP.contains = function ( array, item )
	for index = 1, #array, 1 do
		if array[index] == item then
			return true
		end
	end
	return false
end

CoD.AARUtilityCP.CheckRedDotRewards = function ( controller, currentStats, rewardsArray )
	local attachmentChallengeTable = Engine.TableFindRows( CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN ), 3, "attachment" )
	local scopeNames = {}
	for challengeTableIndex = 1, #attachmentChallengeTable, 1 do
		local attachmentReference = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN ), attachmentChallengeTable[challengeTableIndex], 13 )
		if not CoD.AARUtilityCP.contains( scopeNames, attachmentReference ) then
			table.insert( scopeNames, attachmentReference )
		end
	end
	for attachmentIndex = 1, #scopeNames, 1 do
		local attachmentReference = scopeNames[attachmentIndex]
		local challengeRows = Engine.TableFindRows( CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN ), 13, attachmentReference )
		if challengeRows ~= nil then
			for challengeIndex = 1, #challengeRows, 1 do
				if currentStats.Attachments[attachmentReference].challengeCompleted[challengeIndex - 1]:get() == 1 then
					local reddot_reference = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN ), challengeRows[challengeIndex], 9 )
					local reddot_name = "mpui_reticle_" .. attachmentReference .. "_" .. challengeIndex
					local reddot_icon = attachmentReference .. "_" .. challengeIndex
					local reddot_description = "mpui_reticle"
					local challengeReward = {
						icon = reddot_icon,
						title = reddot_name,
						description = reddot_description,
						Rewards = {}
					}
					local xpReward = {}
					local xpEarnedString = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN ), challengeRows[challengeIndex], 6 )
					xpReward.name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( xpEarnedString ) ) )
					xpReward.icon = "t7_hud_mp_notifications_xp_blue"
					xpReward.description = ""
					CoD.AARUtilityCP.AddToArray( challengeReward.Rewards, xpReward )
					CoD.AARUtilityCP.AddReward( rewardsArray, challengeReward, "WEAPON_CHALLENGE" )
					currentStats.Attachments[attachmentReference].challengeCompleted[challengeIndex - 1]:set( 0 )
				end
			end
		end
	end
end

CoD.AARUtilityCP.CheckCampaignDecorations = function ( controller, currentStats, rewardsArray )
	local decorationAssets = Engine.GetAssetList( "cp_medals" )
	for i = 1, #decorationAssets, 1 do
		local decoration = decorationAssets[i]
		local previousDecorationStatus = currentStats.currentPlayerCPDecorations[i - 1]:get()
		local currentDecorationStatus = currentStats.PlayerCPDecorations[i - 1]:get()
		if previousDecorationStatus ~= currentDecorationStatus then
			local decorationReward = {
				icon = decoration.smallIcon,
				title = decoration.displayName,
				description = "CPUI_CAMPAIGN_DECORATION",
				Rewards = {}
			}
			local xpReward = {
				name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", decoration.XPBonus ) ),
				icon = "t7_hud_mp_notifications_xp_blue",
				description = ""
			}
			CoD.AARUtilityCP.AddToArray( decorationReward.Rewards, xpReward )
			CoD.AARUtilityCP.AddReward( rewardsArray, decorationReward, "DECORATION" )
		end
	end
end

CoD.AARUtilityCP.AddRewardsToChallengeReward = function ( controller, challengeReward, n_xpGiven, tierID )
	local xpReward = {}
	if not tierID then
		xpReward.name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", n_xpGiven ) )
		xpReward.icon = "t7_hud_mp_notifications_xp_blue"
		xpReward.description = ""
	else
		xpReward.name = Engine.Localize( LocalizeIntoString( "CP_CHALLENGES_TIER_X", tierID + 1 ) )
		xpReward.icon = "t7_hud_mp_notifications_xp_blue"
		xpReward.description = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", n_xpGiven ) )
	end
	CoD.AARUtilityCP.AddToArray( challengeReward.Rewards, xpReward )
	return challengeReward
end

CoD.AARUtilityCP.CreateChallengeReward = function ( controller, currentStats, n_challengeRow, tierCompleted )
	local statsMilestones3 = CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN )
	local backgrounds = "gamedata/emblems/backgrounds.csv"
	local challengeReward = {
		title = LocalizeIntoString( Engine.TableGetColumnValueForRow( statsMilestones3, n_challengeRow, 5 ), "", "", "" )
	}
	local challengeIconReference = Engine.TableGetColumnValueForRow( statsMilestones3, n_challengeRow, 12 )
	challengeReward.icon = Engine.TableLookup( backgrounds, 3, 4, challengeIconReference ) .. "_nstrm"
	if tierCompleted then
		challengeReward.description = "CP_CHALLENGES_CHALLENGE_TIER_COMPLETED"
	else
		challengeReward.description = "MPUI_AAR_AWARDS_STATS_MILESTONE"
	end
	challengeReward.Rewards = {}
	return challengeReward
end

CoD.AARUtilityCP.BuildChallengeTable = function ( controller )
	CoD.AARUtilityCP.challengeTable = {}
	local statsMilestones3 = CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN )
	local a_challengeTypes = {
		"missions",
		"tott",
		"career"
	}
	for _, challengeType in ipairs( a_challengeTypes ) do
		local a_challengeList = Engine.GetChallengeInfoForImages( controller, challengeType, Enum.eModes.MODE_CAMPAIGN )
		for _, challenge in ipairs( a_challengeList ) do
			if challenge ~= nil then
				local tierColumnValue = Engine.TableLookupGetColumnValueForRow( statsMilestones3, challenge.challengeRow, 1 )
				if tierColumnValue and tierColumnValue ~= "0" then
					tierColumnValue = tonumber( tierColumnValue )
					challenge.tiers = {}
					for n_tierRowNum = challenge.challengeRow - tierColumnValue, challenge.challengeRow, 1 do
						local challengeTier = {
							tierID = tonumber( Engine.TableLookupGetColumnValueForRow( statsMilestones3, n_tierRowNum, 1 ) ),
							tierRowNum = n_tierRowNum,
							tierTargetValue = tonumber( Engine.TableLookupGetColumnValueForRow( statsMilestones3, n_tierRowNum, 2 ) ),
							tierXPEarned = tonumber( Engine.TableLookupGetColumnValueForRow( statsMilestones3, n_tierRowNum, 6 ) )
						}
						table.insert( challenge.tiers, challengeTier )
					end
				end
				table.insert( CoD.AARUtilityCP.challengeTable, challenge )
			end
		end
	end
	return CoD.AARUtilityCP.challengeTable
end

CoD.AARUtilityCP.CheckChallengeCompletion = function ( controller, currentStats, rewardsArray )
	local statsMilestones3 = CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_CAMPAIGN )
	CoD.AARUtilityCP.BuildChallengeTable( controller )
	for _, challenge in ipairs( CoD.AARUtilityCP.challengeTable ) do
		if not challenge.tiers then
			if not challenge.isLocked and not Engine.GetChallengeHasBeenSeen( controller, challenge.challengeRow ) then
				Engine.SetChallengeHasBeenSeen( controller, challenge.challengeRow )
				local challengeReward = CoD.AARUtilityCP.CreateChallengeReward( controller, currentStats, challenge.challengeRow )
				local n_xpGiven = tonumber( Engine.TableLookupGetColumnValueForRow( statsMilestones3, challenge.challengeRow, 6 ) )
				CoD.AARUtilityCP.AddReward( rewardsArray, CoD.AARUtilityCP.AddRewardsToChallengeReward( controller, challengeReward, n_xpGiven ), "CHALLENGE" )
			end
		end
		local challengeReward = CoD.AARUtilityCP.CreateChallengeReward( controller, currentStats, challenge.challengeRow, challenge.isLocked )
		local challengeRewardValid = false
		for _, tier in ipairs( challenge.tiers ) do
			if tier.tierTargetValue <= challenge.currChallengeStatValue and not Engine.GetChallengeHasBeenSeen( controller, tier.tierRowNum ) then
				Engine.SetChallengeHasBeenSeen( controller, tier.tierRowNum )
				challengeReward = CoD.AARUtilityCP.AddRewardsToChallengeReward( controller, challengeReward, tier.tierXPEarned, tier.tierID )
				challengeRewardValid = true
			end
		end
		if challengeRewardValid then
			CoD.AARUtilityCP.AddReward( rewardsArray, challengeReward, "CHALLENGE" )
		end
	end
end

CoD.AARUtilityCP.GetRewardItemCount = function ( list )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( list.controller ), "aarRewards.aarRewardsCount" ) )
end

CoD.AARUtilityCP.CreateModelsForRewards = function ( controller )
	if CoD.perController[controller].fromMaxLevelMessage == true then
		return 
	end
	local useTestData = CoD.AARUtilityCP.UseTestData()
	local perControllerModel = Engine.GetModelForController( controller )
	local aarRewardsModel = Engine.GetModel( perControllerModel, "aarRewards" )
	if aarRewardsModel ~= nil then
		Engine.UnsubscribeAndFreeModel( aarRewardsModel )
	end
	aarRewardsModel = Engine.CreateModel( perControllerModel, "aarRewards" )
	local aarRewardsCountModel = Engine.GetModel( perControllerModel, "aarRewardsCount" )
	if aarRewardsCountModel ~= nil then
		Engine.UnsubscribeAndFreeModel( aarRewardsModel )
	end
	aarRewardsCountModel = Engine.CreateModel( aarRewardsModel, "aarRewardsCount" )
	local rewardsArray = {
		count = 0
	}
	local currentStats = CoD.GetPlayerStats( controller )
	CoD.AARUtilityCP.CheckRatingRewards( controller, currentStats, rewardsArray )
	CoD.AARUtilityCP.CheckMissionRewards( controller, currentStats, rewardsArray )
	CoD.AARUtilityCP.CheckRankAndPrestige( controller, currentStats, rewardsArray )
	CoD.AARUtilityCP.CheckCampaignDecorations( controller, currentStats, rewardsArray )
	CoD.AARUtilityCP.CheckChallengeCompletion( controller, currentStats, rewardsArray )
	CoD.AARUtilityCP.CheckWeaponLevels( controller, currentStats, rewardsArray )
	CoD.AARUtilityCP.CheckAccolades( controller, currentStats, rewardsArray )
	UploadStats( controller )
	for currRewardCarouselItem = 1, rewardsArray.count, 1 do
		local currRewardContainer = rewardsArray[currRewardCarouselItem]
		local currRewardCarouselItemModel = Engine.CreateModel( aarRewardsModel, currRewardCarouselItem .. "" )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemImage" ), currRewardContainer.reward.icon )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemTitle" ), currRewardContainer.reward.title )
		Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemSubtitle" ), currRewardContainer.reward.description )
		if currRewardContainer.type == "CHALLENGE" then
			Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "rewardCarouselItemType" ), "challengeCompleted" )
		end
		for rewardsInfoIndex = 1, 4, 1 do
			Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "reward" .. rewardsInfoIndex .. "InfoVisible" ), 0 )
		end
		if currRewardContainer.reward.Rewards ~= nil and currRewardContainer.reward.Rewards.count ~= nil then
			for currRewardIndex = 1, currRewardContainer.reward.Rewards.count, 1 do
				local currRewardItemModel = Engine.CreateModel( currRewardCarouselItemModel, "reward" .. currRewardIndex .. "Info" )
				local currReward = currRewardContainer.reward.Rewards[currRewardIndex]
				Engine.SetModelValue( Engine.CreateModel( currRewardItemModel, "rewardName" ), currReward.name )
				Engine.SetModelValue( Engine.CreateModel( currRewardItemModel, "rewardImage" ), currReward.icon )
				Engine.SetModelValue( Engine.CreateModel( currRewardItemModel, "rewardDesc" ), currReward.description )
				Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "reward" .. currRewardIndex .. "InfoVisible" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "paragonRankDescVisible" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( currRewardCarouselItemModel, "extraParagonIconsVisible" ), 0 )
			end
		end
	end
	Engine.SetModelValue( aarRewardsCountModel, rewardsArray.count )
	CoD.perController[controller].playedTrainingSim = nil
end

