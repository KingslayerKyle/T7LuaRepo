CoD.AARUtility = {}
CoD.AARUtility.RankIdCol = 0
CoD.AARUtility.RankTableColMinXP = 2
CoD.AARUtility.RankTableColXPToNext = 3
CoD.AARUtility.RankDisplayStringCol = 5
CoD.AARUtility.RankTableColMaxXP = 7
CoD.AARUtility.RankDisplayLevelCol = 14
CoD.AARUtility.SetupUIModels = function ( controller )
	local statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE )
	local currentStats = CoD.GetPlayerStats( controller )
	local rankBeforeMatch = statsBeforeMatch.PlayerStatsList.RANK.StatValue:get()
	local rankXPBeforeMatch = statsBeforeMatch.PlayerStatsList.RANKXP.StatValue:get()
	local currentRank = currentStats.PlayerStatsList.RANK.StatValue:get()
	local displayLevelForRankBeforeMatch = Engine.TableLookup( controller, CoD.rankTable, CoD.AARUtility.RankIdCol, rankBeforeMatch, CoD.AARUtility.RankDisplayLevelCol )
	local displayLevelForCurrRank = Engine.TableLookup( controller, CoD.rankTable, CoD.AARUtility.RankIdCol, currentRank, CoD.AARUtility.RankDisplayLevelCol )
	local currPrestige = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	local currRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, CoD.AARUtility.RankIdCol, currentRank, currPrestige + 1 )
	local currRankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
	local minXPForCurrRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.AARUtility.RankIdCol, currentRank, CoD.AARUtility.RankTableColMinXP ) )
	local maxXPForCurrRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.AARUtility.RankIdCol, currentRank, CoD.AARUtility.RankTableColMaxXP ) )
	local xpNeededToLevelUp = maxXPForCurrRank - currRankXP
	local prestigeNext = CoD.PrestigeNext( controller )
	local xpEarnedDuringMatch = CoD.AARUtility.GetXPEarnedDuringMatch( currRankXP, rankXPBeforeMatch )
	local aarStats = currentStats.AfterActionReportStats
	local stats = {
		currLevel = displayLevelForCurrRank,
		currLevelIcon = currRankIconMaterialName
	}
	if prestigeNext then
		stats.nextLevel = CoD.PrestigeNextLevelText( controller )
		stats.nextLevelIcon = Engine.TableLookup( controller, CoD.rankIconTable, 0, 0, currPrestige + 2 )
	else
		stats.nextLevel = Engine.TableLookup( controller, CoD.rankTable, CoD.AARUtility.RankIdCol, currentRank + 1, CoD.AARUtility.RankDisplayLevelCol )
		stats.nextLevelIcon = Engine.TableLookup( controller, CoD.rankIconTable, 0, currentRank + 1, currPrestige + 1 )
	end
	stats.kills = aarStats.kills:get()
	stats.deaths = aarStats.deaths:get()
	stats.score = aarStats.score:get()
	local gameType = Engine.GetCurrentGameType()
	stats.gameTypeName = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref_caps" )
	stats.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref" )
	stats.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", gameType, "loading_screen_image" )
	stats.wins = currentStats.PlayerStatsByGameType[gameType].WINS.StatValue:get()
	stats.losses = currentStats.PlayerStatsByGameType[gameType].LOSSES.StatValue:get()
	stats.winLossRatio = string.format( "%.2f", stats.wins / math.max( 1, stats.losses ) )
	stats.lossesRingClockFrac = string.format( "%.2f", stats.losses / math.max( 1, stats.wins + stats.losses ) )
	stats.showBestScoreIcon = 0
	stats.showBestKillsIcon = 0
	stats.showBestSPMIcon = 0
	stats.showBestKDRIcon = 0
	if currentStats.HighestStats.HIGHEST_SCORE:get() <= stats.score then
		stats.showBestScoreIcon = 1
	end
	if currentStats.HighestStats.HIGHEST_KILLS:get() <= stats.kills then
		stats.showBestKillsIcon = 1
	end
	local matchScore = currentStats.PlayerStatsList.SCORE.StatValue:get() - statsBeforeMatch.PlayerStatsList.SCORE.StatValue:get()
	local matchTimePlayed = currentStats.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() - statsBeforeMatch.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get()
	local matchSPM = matchScore / math.max( 1, matchTimePlayed )
	if currentStats.HighestStats.HIGHEST_SCORE_PER_MINUTE:get() <= matchSPM then
		stats.showBestSPMIcon = 1
	end
	local killDeathRatio = stats.kills / math.max( 1, stats.deaths )
	if currentStats.HighestStats.HIGHEST_KDRATIO:get() <= killDeathRatio then
		stats.showBestKDRIcon = 1
	end
	stats.xpEarnedDuringMatch = xpEarnedDuringMatch
	stats.xpNeededToLevelUp = xpNeededToLevelUp
	stats.minXPForCurrRank = minXPForCurrRank
	stats.maxXPForCurrRank = maxXPForCurrRank
	stats.currRankXP = currRankXP
	stats.rankXPBeforeMatch = rankXPBeforeMatch
	stats.xpNeededToLevelUp = stats.maxXPForCurrRank - stats.currRankXP
	local aarStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats" )
	local performanceTabStatsModel = Engine.CreateModel( aarStatsModel, "performanceTabStats" )
	for key, value in pairs( stats ) do
		Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, key ), value )
	end
	CoD.AARUtility.CreateUIModelsForPerformanceGraphs( controller, performanceTabStatsModel, gameType )
end

local GetMaxValue = function ( valuesTable, key )
	local max = 0
	for index, valueTable in ipairs( valuesTable ) do
		if valueTable[key] and max < tonumber( valueTable[key] ) then
			max = tonumber( valueTable[key] )
		end
	end
	return max
end

local GetMinValue = function ( valuesTable, key )
	if not valuesTable[1] then
		return 
	end
	local min = tonumber( valuesTable[1][key] )
	for index, valueTable in ipairs( valuesTable ) do
		if valueTable[key] and tonumber( valueTable[key] ) < min then
			min = tonumber( valueTable[key] )
		end
	end
	return min
end

local SetGraphValues = function ( graphData, key, averageValue, model, upperBound, lowerBound )
	for index, data in ipairs( graphData ) do
		local currSPM = data[key]
		local f4_local3 = 0
		if averageValue <= currSPM then
			f4_local3 = 0.5 - (currSPM - averageValue) / math.max( 1, upperBound - averageValue ) / 2
		else
			f4_local3 = 0.5 + (1 - (currSPM - lowerBound) / math.max( 1, averageValue - lowerBound )) / 2
		end
		Engine.SetModelValue( Engine.CreateModel( model, "graphValue" .. index ), string.format( "%.2f", f4_local3 ) .. " 0 0 0" )
	end
end

CoD.AARUtility.CreateUIModelsForPerformanceGraphs = function ( controller, performanceTabStatsModel, gameType )
	local graphData = {}
	local maxValuesForGraph = 5
	local maxScoreValues = 10
	local currentStats = Engine.GetPlayerStats( controller )
	local prevScores = currentStats.PlayerStatsByGameType[gameType].prevScores
	local scoreIndex = currentStats.PlayerStatsByGameType[gameType].prevScoreIndex:get()
	if scoreIndex < 0 or maxScoreValues < scoreIndex then
		scoreIndex = 0
	end
	local gameTypeScore = currentStats.PlayerStatsByGameType[gameType].SCORE.StatValue:get()
	local gameTypeTimePlayed = currentStats.PlayerStatsByGameType[gameType].TIME_PLAYED_TOTAL.StatValue:get()
	local averageSPM = math.ceil( gameTypeScore / math.max( 1, gameTypeTimePlayed / 60 ) )
	local gameTypeKills = currentStats.PlayerStatsByGameType[gameType].KILLS.StatValue:get()
	local gameTypeDeaths = currentStats.PlayerStatsByGameType[gameType].DEATHS.StatValue:get()
	local averageKDR = string.format( "%.2f", gameTypeKills / math.max( 1, gameTypeDeaths ) )
	local totalScore = currentStats.PlayerStatsList.SCORE.StatValue:get()
	local totalTimePlayed = currentStats.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get()
	local totalSPM = math.ceil( totalScore / math.max( 1, totalTimePlayed / 60 ) )
	local totalKills = currentStats.PlayerStatsList.KILLS.StatValue:get()
	local totalDeaths = currentStats.PlayerStatsList.DEATHS.StatValue:get()
	local totalKDR = string.format( "%.2f", totalKills / math.max( 1, totalDeaths ) )
	for index = 1, maxValuesForGraph, 1 do
		local f5_local2 = index
		local currScoreTable = {}
		local currScore = prevScores[scoreIndex].score:get()
		local currTimePlayed = prevScores[scoreIndex].timePlayed:get()
		local currKills = prevScores[scoreIndex].kills:get()
		local currDeaths = prevScores[scoreIndex].deaths:get()
		currScoreTable.spm = math.floor( currScore / math.max( 1, currTimePlayed / 60 ) )
		currScoreTable.kdr = string.format( "%.2f", currKills / math.max( 1, currDeaths ) )
		currScoreTable.valid = prevScores[scoreIndex].valid:get()
		table.insert( graphData, currScoreTable )
		scoreIndex = scoreIndex - 1
		if scoreIndex < 0 then
			scoreIndex = maxScoreValues - 1
		end
	end
	local spmGraphModel = Engine.CreateModel( performanceTabStatsModel, "spmGraph" )
	local kdrGraphModel = Engine.CreateModel( performanceTabStatsModel, "kdrGraph" )
	for index, data in ipairs( graphData ) do
		Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "value" .. index ), data.spm )
		Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "value" .. index .. "Valid" ), data.valid )
		Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "value" .. index ), data.kdr )
		Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "value" .. index .. "Valid" ), data.valid )
	end
	Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "avgSPM" ), averageSPM )
	Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "avgKDR" ), averageKDR )
	Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, "globalSPM" ), totalSPM )
	Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, "globalKDR" ), totalKDR )
	local spmUpperBound = averageSPM + 200
	if spmUpperBound < GetMaxValue( graphData, "spm" ) then
		spmUpperBound = GetMaxValue( graphData, "spm" ) + 50
	end
	local spmLowerBound = math.max( averageSPM - 100, 0 )
	if GetMinValue( graphData, "spm" ) < spmLowerBound then
		spmLowerBound = GetMinValue( graphData, "spm" )
	end
	local kdrUpperBound = averageKDR + 1.5
	if kdrUpperBound < GetMaxValue( graphData, "kdr" ) then
		kdrUpperBound = GetMaxValue( graphData, "kdr" ) + 0.75
	end
	local kdrLowerBound = math.max( averageKDR - 0.5, 0 )
	if GetMinValue( graphData, "kdr" ) < kdrLowerBound then
		kdrLowerBound = GetMinValue( graphData, "kdr" )
	end
	SetGraphValues( graphData, "spm", averageSPM, spmGraphModel, spmUpperBound, spmLowerBound )
	SetGraphValues( graphData, "kdr", averageKDR, kdrGraphModel, kdrUpperBound, kdrLowerBound )
end

CoD.AARUtility.GetXPEarnedDuringMatch = function ( currRankXP, rankXPBeforeMatch )
	local xpEarnedDuringMatch = currRankXP - rankXPBeforeMatch
	if xpEarnedDuringMatch < 0 then
		xpEarnedDuringMatch = 0
	end
	return xpEarnedDuringMatch
end

