--[[ Func length: 0 - 0]]--[[vars: GetMaxValue: 133 - 190GetMinValue: 134 - 190SetGraphValues: 135 - 190AnyItemsUnlockedForRank: 151 - 190GetBlueprintStringPrefixForItem: 152 - 190IsHeroAbility: 153 - 190IsHeroWeapon: 154 - 190CreateRewardInfoModel: 155 - 190]]--[[upvals: ]]CoD.AARUtility = {} --[[ @ 1]]
CoD.AARUtility.RankIdCol = 0 --[[ @ 3]]
CoD.AARUtility.RankTableColMinXP = 2 --[[ @ 4]]
CoD.AARUtility.RankTableColXPToNext = 3 --[[ @ 5]]
CoD.AARUtility.RankDisplayStringCol = 5 --[[ @ 6]]
CoD.AARUtility.RankTableColMaxXP = 7 --[[ @ 7]]
CoD.AARUtility.RankDisplayLevelCol = 14 --[[ @ 8]]
CoD.AARUtility.medalStringCol = 2 --[[ @ 10]]
CoD.AARUtility.medalrefCol = 3 --[[ @ 11]]
CoD.AARUtility.medalSortkeyCol = 10 --[[ @ 12]]
CoD.AARUtility.GunRankCol = 0 --[[ @ 14]]
CoD.AARUtility.GunRefCol = 2 --[[ @ 15]]
CoD.AARUtility.GunAttachmentRefCol = 3 --[[ @ 16]]
CoD.AARUtility.GunRankXPCol = 4 --[[ @ 17]]
CoD.AARUtility.MaxRank = 55 --[[ @ 20]]
CoD.AARUtility.SetCurrLevelModels = function --[[1]] ( controller, rank )
--[[ Func length: 22 - 31]]--[[vars: controller: 0 - 65rank: 0 - 65performanceTabStatsModel: 12 - 65xpBarInfoModel: 19 - 65currLevelModel: 26 - 65currLevelIconModel: 33 - 65level: 51 - 65levelIcon: 51 - 65]]--[[upvals: ]]	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" ) --[[ performanceTabStatsModel, ]] --[[ @ 23]]
	local xpBarInfoModel = Engine.CreateModel( performanceTabStatsModel, "xpBarInfo" ) --[[ xpBarInfoModel, ]] --[[ @ 24]]
	local currLevelModel = Engine.CreateModel( xpBarInfoModel, "currLevel" ) --[[ currLevelModel, ]] --[[ @ 25]]
	local currLevelIconModel = Engine.CreateModel( xpBarInfoModel, "currLevelIcon" ) --[[ currLevelIconModel, ]] --[[ @ 26]]
	local level, levelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( rank, CoD.AARUtility.GetCurrentPrestige( controller ) ) --[[ level, levelIcon, ]] --[[ @ 28]]
	Engine.SetModelValue( currLevelModel, level ) --[[ @ 29]]
	Engine.SetModelValue( currLevelIconModel, levelIcon ) --[[ @ 30]]
end
 --[[ @ 22]]
CoD.AARUtility.SetNextLevelModels = function --[[2]] ( controller, rank )
--[[ Func length: 33 - 42]]--[[vars: controller: 0 - 65rank: 0 - 65performanceTabStatsModel: 12 - 65xpBarInfoModel: 19 - 65nextLevelModel: 26 - 65nextLevelIconModel: 33 - 65level: 51 - 65levelIcon: 51 - 65]]--[[upvals: ]]	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" ) --[[ performanceTabStatsModel, ]] --[[ @ 34]]
	local xpBarInfoModel = Engine.CreateModel( performanceTabStatsModel, "xpBarInfo" ) --[[ xpBarInfoModel, ]] --[[ @ 35]]
	local nextLevelModel = Engine.CreateModel( xpBarInfoModel, "nextLevel" ) --[[ nextLevelModel, ]] --[[ @ 36]]
	local nextLevelIconModel = Engine.CreateModel( xpBarInfoModel, "nextLevelIcon" ) --[[ nextLevelIconModel, ]] --[[ @ 37]]
	local level, levelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( rank, CoD.AARUtility.GetCurrentPrestige( controller ) ) --[[ level, levelIcon, ]] --[[ @ 39]]
	Engine.SetModelValue( nextLevelModel, level ) --[[ @ 40]]
	Engine.SetModelValue( nextLevelIconModel, levelIcon ) --[[ @ 41]]
end
 --[[ @ 33]]
CoD.AARUtility.GetLevelAndLevelIconForRank = function --[[3]] ( rank, prestige )
--[[ Func length: 44 - 48]]--[[vars: rank: 0 - 41prestige: 0 - 41level: 25 - 41levelIcon: 38 - 41]]--[[upvals: ]]	local level = Engine.TableLookup( 0, CoD.rankTable, CoD.AARUtility.RankIdCol, rank, CoD.AARUtility.RankDisplayLevelCol ) --[[ level, ]] --[[ @ 45]]
	local levelIcon = Engine.TableLookup( 0, CoD.rankIconTable, 0, rank, prestige + 1 ) --[[ levelIcon, ]] --[[ @ 46]]
	return level, levelIcon
end
 --[[ @ 44]]
CoD.AARUtility.GetCurrentPrestige = function --[[4]] ( controller )
--[[ Func length: 50 - 52]]--[[vars: controller: 0 - 18]]--[[upvals: ]]	local f4_local0 = CoD.GetPlayerStats( controller ) --[[ @ 51]]
	return f4_local0.PlayerStatsList.PLEVEL.StatValue:get()
end
 --[[ @ 50]]
CoD.AARUtility.GetMinMaxXPForRank = function --[[5]] ( rank, controller )
--[[ Func length: 54 - 59]]--[[vars: rank: 0 - 57controller: 0 - 57minXP: 27 - 57maxXP: 54 - 57]]--[[upvals: ]]	local minXP = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.AARUtility.RankIdCol, rank, CoD.AARUtility.RankTableColMinXP ) ) --[[ minXP, ]] --[[ @ 55]]
	local maxXP = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.AARUtility.RankIdCol, rank, CoD.AARUtility.RankTableColMaxXP ) ) --[[ maxXP, ]] --[[ @ 56]]
	return minXP, maxXP
end
 --[[ @ 54]]
CoD.AARUtility.XPBarAnimTime = 1000 --[[ @ 61]]
CoD.AARUtility.UseTestData = function --[[6]] ()
--[[ Func length: 63 - 65]]--[[vars: ]]--[[upvals: ]]	local f6_local0 --[[ @ 0]]
	if Dvar.aar_test:get() ~= true and Dvar.aar_test:get() ~= "1" then
		f6_local0 = false --[[ @ 64]]
	else
		f6_local0 = true --[[ @ 64]]
	end
	return f6_local0
end
 --[[ @ 63]]
CoD.AARUtility.TestMultiplePromotions = function --[[7]] ()
--[[ Func length: 67 - 69]]--[[vars: ]]--[[upvals: ]]	local f7_local0 --[[ @ 0]]
	if Dvar.aar_multiple_promo:get() ~= true and Dvar.aar_multiple_promo:get() ~= "1" then
		f7_local0 = false --[[ @ 68]]
	else
		f7_local0 = true --[[ @ 68]]
	end
	return f7_local0
end
 --[[ @ 67]]
CoD.AARUtility.TestSinglePromotion = function --[[8]] ()
--[[ Func length: 71 - 73]]--[[vars: ]]--[[upvals: ]]	local f8_local0 --[[ @ 0]]
	if Dvar.aar_single_promo:get() ~= true and Dvar.aar_single_promo:get() ~= "1" then
		f8_local0 = false --[[ @ 72]]
	else
		f8_local0 = true --[[ @ 72]]
	end
	return f8_local0
end
 --[[ @ 71]]
CoD.AARUtility.SetupUIModels = function --[[9]] ( controller )
--[[ Func length: 75 - 188]]--[[vars: controller: 0 - 551useTestData: 8 - 551statsBeforeMatch: 9 - 551gameType: 9 - 551currentStats: 56 - 551rankXPBeforeMatch: 67 - 551currentRank: 78 - 551currPrestige: 89 - 551currRankXP: 100 - 551prestigeNext: 106 - 551xpEarnedDuringMatch: 116 - 551aarStats: 119 - 551stats: 120 - 551currHighestScore: 368 - 551currHighestKills: 376 - 551matchScore: 415 - 551matchTimePlayed: 438 - 551matchSPM: 446 - 551currHighestSPM: 454 - 551killDeathRatio: 472 - 551currHighestKDR: 480 - 551performanceTabStatsModel: 498 - 551key: 525 - 538value: 525 - 538]]--[[upvals: ]]	local useTestData = CoD.AARUtility.UseTestData() --[[ useTestData, ]] --[[ @ 76]]
	local statsBeforeMatch, gameType = nil --[[ statsBeforeMatch, gameType, ]] --[[ @ 77]]
	if useTestData then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "aarType" ), "public" ) --[[ @ 80]]
	end
	if useTestData then
		statsBeforeMatch = CoD.GetPlayerStats( controller ) --[[ @ 84]]
	else
		statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE ) --[[ @ 86]]
	end
	local currentStats = CoD.GetPlayerStats( controller ) --[[ currentStats, ]] --[[ @ 89]]
	local rankXPBeforeMatch = statsBeforeMatch.PlayerStatsList.RANKXP.StatValue:get() --[[ rankXPBeforeMatch, ]] --[[ @ 90]]
	local currentRank = currentStats.PlayerStatsList.RANK.StatValue:get() --[[ currentRank, ]] --[[ @ 91]]
	local currPrestige = currentStats.PlayerStatsList.PLEVEL.StatValue:get() --[[ currPrestige, ]] --[[ @ 92]]
	local currRankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get() --[[ currRankXP, ]] --[[ @ 93]]
	local prestigeNext = CoD.PrestigeNext( controller ) --[[ prestigeNext, ]] --[[ @ 94]]
	local xpEarnedDuringMatch = CoD.AARUtility.GetXPEarnedDuringMatch( currRankXP, rankXPBeforeMatch ) --[[ xpEarnedDuringMatch, ]] --[[ @ 95]]
	local aarStats = currentStats.AfterActionReportStats --[[ aarStats, ]] --[[ @ 97]]
	local stats = {} --[[ stats, ]] --[[ @ 99]]
	if prestigeNext then
		stats.nextLevel = CoD.PrestigeNextLevelText( controller ) --[[ @ 103]]
		stats.nextLevelIcon = Engine.TableLookup( controller, CoD.rankIconTable, 0, 0, currPrestige + 2 ) --[[ @ 104]]
	else
		stats.nextLevel, stats.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank + 1, currPrestige + 1 ) --[[ @ 106]]
	end
	if useTestData then
		gameType = "tdm" --[[ @ 110]]
		stats.kills = 24 --[[ @ 111]]
		stats.deaths = 26 --[[ @ 112]]
		stats.score = 2500 --[[ @ 113]]
		stats.gameTypeName = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref_caps" ) --[[ @ 115]]
		stats.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref" ) --[[ @ 116]]
		stats.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", gameType, "loading_screen_image" ) --[[ @ 117]]
		stats.wins = 116 --[[ @ 119]]
		stats.losses = 90 --[[ @ 120]]
		stats.winLossRatio = 1.28 --[[ @ 121]]
		stats.lossesRingClockFrac = string.format( "%.2f", stats.losses / math.max( 1, stats.wins + stats.losses ) ) --[[ @ 122]]
		stats.showBestScoreIcon = 1 --[[ @ 124]]
		stats.showBestKillsIcon = 1 --[[ @ 125]]
		stats.showBestSPMIcon = 1 --[[ @ 126]]
		stats.showBestKDRIcon = 1 --[[ @ 127]]
	else
		gameType = Engine.GetCurrentGameType() --[[ @ 129]]
		stats.kills = aarStats.kills:get() --[[ @ 130]]
		stats.deaths = aarStats.deaths:get() --[[ @ 131]]
		stats.score = aarStats.score:get() --[[ @ 132]]
		if gameType and gameType ~= "" then
			stats.gameTypeName = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref_caps" ) --[[ @ 135]]
			stats.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref" ) --[[ @ 136]]
			stats.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", gameType, "loading_screen_image" ) --[[ @ 137]]
			stats.wins = currentStats.PlayerStatsByGameType[gameType].WINS.StatValue:get() --[[ @ 139]]
			stats.losses = currentStats.PlayerStatsByGameType[gameType].LOSSES.StatValue:get() --[[ @ 140]]
			stats.winLossRatio = string.format( "%.2f", stats.wins / math.max( 1, stats.losses ) ) --[[ @ 141]]
			stats.lossesRingClockFrac = string.format( "%.2f", stats.losses / math.max( 1, stats.wins + stats.losses ) ) --[[ @ 142]]
		end
		stats.showBestScoreIcon = 0 --[[ @ 145]]
		stats.showBestKillsIcon = 0 --[[ @ 146]]
		stats.showBestSPMIcon = 0 --[[ @ 147]]
		stats.showBestKDRIcon = 0 --[[ @ 148]]
	end
	local currHighestScore = currentStats.HighestStats.HIGHEST_SCORE:get() --[[ currHighestScore, ]] --[[ @ 151]]
	local currHighestKills = currentStats.HighestStats.HIGHEST_KILLS:get() --[[ currHighestKills, ]] --[[ @ 152]]
	if currHighestScore <= stats.score and currHighestScore ~= 0 then
		stats.showBestScoreIcon = 1 --[[ @ 155]]
	end
	if currHighestKills <= stats.kills and currHighestKills ~= 0 then
		stats.showBestKillsIcon = 1 --[[ @ 159]]
	end
	local matchScore = currentStats.PlayerStatsList.SCORE.StatValue:get() - statsBeforeMatch.PlayerStatsList.SCORE.StatValue:get() --[[ matchScore, ]] --[[ @ 162]]
	local matchTimePlayed = currentStats.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() - statsBeforeMatch.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() --[[ matchTimePlayed, ]] --[[ @ 163]]
	local matchSPM = matchScore / math.max( 1, matchTimePlayed ) --[[ matchSPM, ]] --[[ @ 164]]
	local currHighestSPM = currentStats.HighestStats.HIGHEST_SCORE_PER_MINUTE:get() --[[ currHighestSPM, ]] --[[ @ 166]]
	if currHighestSPM <= matchSPM and currHighestSPM ~= 0 then
		stats.showBestSPMIcon = 1 --[[ @ 169]]
	end
	local killDeathRatio = stats.kills / math.max( 1, stats.deaths ) --[[ killDeathRatio, ]] --[[ @ 172]]
	local currHighestKDR = currentStats.HighestStats.HIGHEST_KDRATIO:get() --[[ currHighestKDR, ]] --[[ @ 173]]
	if currHighestKDR <= killDeathRatio and currHighestKDR ~= 0 then
		stats.showBestKDRIcon = 1 --[[ @ 176]]
	end
	stats.xpEarnedDuringMatch = xpEarnedDuringMatch --[[ @ 179]]
	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" ) --[[ performanceTabStatsModel, ]] --[[ @ 180]]
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.xpScale" ), Engine.GetXPScale( controller ) ) --[[ @ 181]]
	for key, value in pairs( stats ) --[[ @ 0]] do
		Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, key ), value ) --[[ @ 184]]
	end
	CoD.AARUtility.CreateUIModelsForPerformanceGraphs( controller, performanceTabStatsModel, gameType ) --[[ @ 187]]
end
 --[[ @ 75]]
local GetMaxValue = function --[[10]] ( valuesTable, key )
--[[ Func length: 190 - 199]]--[[vars: valuesTable: 0 - 26key: 0 - 26max: 1 - 26index: 5 - 23valueTable: 5 - 23]]--[[upvals: ]]	local max = 0 --[[ max, ]] --[[ @ 191]]
	for index, valueTable in ipairs( valuesTable ) --[[ @ 0]] do
		if valueTable[key] and max < tonumber( REG7[key] ) then
			max = tonumber( REG7[key] ) --[[ @ 194]]
		end
	end
	return max
end
 --[[ GetMaxValue, ]] --[[ @ 199]]
local GetMinValue = function --[[11]] ( valuesTable, key )
--[[ Func length: 201 - 215]]--[[vars: valuesTable: 0 - 39key: 0 - 39min: 14 - 39index: 18 - 36valueTable: 18 - 36]]--[[upvals: ]]	if not valuesTable[1] then
		return 
	end
	local min = tonumber( valuesTable[1][key] ) --[[ min, ]] --[[ @ 206]]
	for index, valueTable in ipairs( valuesTable ) --[[ @ 0]] do
		if valueTable[key] and tonumber( REG7[key] ) < min then
			min = tonumber( REG7[key] ) --[[ @ 210]]
		end
	end
	return min
end
 --[[ GetMinValue, ]] --[[ @ 215]]
local SetGraphValues = function --[[12]] ( graphData, key, averageValue, model, upperBound, lowerBound )
--[[ Func length: 217 - 239]]--[[vars: graphData: 0 - 114key: 0 - 114averageValue: 0 - 114model: 0 - 114upperBound: 0 - 114lowerBound: 0 - 114useTestData: 8 - 114graphValues: 25 - 54index: 29 - 52data: 29 - 52index: 59 - 112data: 59 - 112currSPM: 62 - 112graphValue: 63 - 112]]--[[upvals: ]]	local useTestData = CoD.AARUtility.UseTestData() --[[ useTestData, ]] --[[ @ 218]]
	if CoD.AARUtility.UseTestData() then
		local graphValues = {
			0.3,
			0.8,
			0.5,
			0.7,
			0.1
		} --[[ graphValues, graphValues, graphValues, graphValues, graphValues, ]] --[[ @ 221]]
		for index, data in ipairs( graphValues ) --[[ @ 0]] do
			Engine.SetModelValue( Engine.CreateModel( model, "graphValue" .. index ), string.format( "%.2f", data ) .. " 0 0 0" ) --[[ @ 223]]
		end
	else
		for index, data in ipairs( graphData ) --[[ @ 0]] do
			local currSPM = data[key] --[[ currSPM, ]] --[[ @ 227]]
			local f12_local6 = 0 --[[ graphValue, ]] --[[ @ 228]]
			if averageValue <= currSPM then
				f12_local6 = 0.5 - (currSPM - averageValue) / math.max( 1, upperBound - averageValue ) / 2 --[[ @ 231]]
			else
				f12_local6 = 0.5 + (1 - (currSPM - lowerBound) / math.max( 1, averageValue - lowerBound )) / 2 --[[ @ 233]]
			end
			Engine.SetModelValue( Engine.CreateModel( model, "graphValue" .. REG10 ), string.format( "%.2f", f12_local6 ) .. " 0 0 0" ) --[[ @ 236]]
		end
	end
end
 --[[ SetGraphValues, ]] --[[ @ 239]]
CoD.AARUtility.CreateUIModelsForPerformanceGraphs = function --[[13]] ( controller, performanceTabStatsModel, gameType )
--[[ Func length: 241 - 345]]--[[vars: controller: 0 - 556performanceTabStatsModel: 0 - 556gameType: 0 - 556useTestData: 8 - 556graphData: 9 - 556maxValuesForGraph: 10 - 556maxScoreValues: 11 - 556currentStats: 17 - 556prevScores: 26 - 556scoreIndex: 37 - 556gameTypeScore: 56 - 556gameTypeTimePlayed: 70 - 556averageSPM: 83 - 556gameTypeKills: 97 - 556gameTypeDeaths: 111 - 556averageKDR: 125 - 556totalScore: 136 - 556totalTimePlayed: 147 - 556totalSPM: 160 - 556totalKills: 171 - 556totalDeaths: 182 - 556totalKDR: 196 - 556fakeScores: 209 - 238fakeKDR: 216 - 238index: 220 - 237currScoreTable: 221 - 237index: 243 - 325currScoreTable: 244 - 325currScore: 252 - 325currTimePlayed: 260 - 325currKills: 268 - 325currDeaths: 276 - 325spmGraphModel: 333 - 556kdrGraphModel: 340 - 556index: 344 - 420data: 344 - 420spmUpperBound: 481 - 556spmLowerBound: 499 - 556kdrUpperBound: 511 - 556kdrLowerBound: 529 - 556]]--[[upvals: GetMaxValueGetMinValueSetGraphValues]]	local useTestData = CoD.AARUtility.UseTestData() --[[ useTestData, ]] --[[ @ 242]]
	local graphData = {} --[[ graphData, ]] --[[ @ 244]]
	local maxValuesForGraph = 5 --[[ maxValuesForGraph, ]] --[[ @ 245]]
	local maxScoreValues = 10 --[[ maxScoreValues, ]] --[[ @ 246]]
	local currentStats = Engine.GetPlayerStats( controller ) --[[ currentStats, ]] --[[ @ 247]]
	local prevScores = currentStats.PlayerStatsByGameType[gameType].prevScores --[[ prevScores, ]] --[[ @ 249]]
	local scoreIndex = currentStats.PlayerStatsByGameType[gameType].prevScoreIndex:get() --[[ scoreIndex, ]] --[[ @ 250]]
	if scoreIndex < 0 or maxScoreValues < scoreIndex then
		scoreIndex = 0 --[[ @ 253]]
	end
	local gameTypeScore = currentStats.PlayerStatsByGameType[gameType].SCORE.StatValue:get() --[[ gameTypeScore, ]] --[[ @ 256]]
	local gameTypeTimePlayed = currentStats.PlayerStatsByGameType[gameType].TIME_PLAYED_TOTAL.StatValue:get() --[[ gameTypeTimePlayed, ]] --[[ @ 257]]
	local averageSPM = math.ceil( gameTypeScore / math.max( 1, gameTypeTimePlayed / 60 ) ) --[[ averageSPM, ]] --[[ @ 258]]
	local gameTypeKills = currentStats.PlayerStatsByGameType[gameType].KILLS.StatValue:get() --[[ gameTypeKills, ]] --[[ @ 259]]
	local gameTypeDeaths = currentStats.PlayerStatsByGameType[gameType].DEATHS.StatValue:get() --[[ gameTypeDeaths, ]] --[[ @ 260]]
	local averageKDR = string.format( "%.2f", gameTypeKills / math.max( 1, gameTypeDeaths ) ) --[[ averageKDR, ]] --[[ @ 261]]
	local totalScore = currentStats.PlayerStatsList.SCORE.StatValue:get() --[[ totalScore, ]] --[[ @ 263]]
	local totalTimePlayed = currentStats.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() --[[ totalTimePlayed, ]] --[[ @ 264]]
	local totalSPM = math.ceil( totalScore / math.max( 1, totalTimePlayed / 60 ) ) --[[ totalSPM, ]] --[[ @ 265]]
	local totalKills = currentStats.PlayerStatsList.KILLS.StatValue:get() --[[ totalKills, ]] --[[ @ 266]]
	local totalDeaths = currentStats.PlayerStatsList.DEATHS.StatValue:get() --[[ totalDeaths, ]] --[[ @ 267]]
	local totalKDR = string.format( "%.2f", totalKills / math.max( 1, totalDeaths ) ) --[[ totalKDR, ]] --[[ @ 268]]
	if useTestData then
		averageSPM = 195 --[[ @ 271]]
		averageKDR = 0.95 --[[ @ 272]]
		totalSPM = 420 --[[ @ 273]]
		totalKDR = 1.25 --[[ @ 274]]
		local fakeScores = {
			180,
			202,
			175,
			208,
			201
		} --[[ fakeScores, fakeScores, fakeScores, fakeScores, fakeScores, ]] --[[ @ 275]]
		local fakeKDR = {
			1.5,
			0.87,
			1.2,
			1.65,
			0.65
		} --[[ fakeKDR, fakeKDR, fakeKDR, fakeKDR, fakeKDR, ]] --[[ @ 276]]
		for index = 1 --[[ index, ]] --[[ @ 277]], maxValuesForGraph, 1 do
			local currScoreTable = {
				spm = fakeScores[index],
				kdr = fakeKDR[index],
				valid = 1
			} --[[ currScoreTable, ]] --[[ @ 278]]
			table.insert( graphData, currScoreTable ) --[[ @ 282]]
		end
	else
		for index = 1 --[[ index, ]] --[[ @ 285]], maxValuesForGraph, 1 do
			local f13_local0 = index --[[ @ 0]]
			local currScoreTable = {} --[[ currScoreTable, ]] --[[ @ 286]]
			local currScore = prevScores[scoreIndex].score:get() --[[ currScore, ]] --[[ @ 287]]
			local currTimePlayed = prevScores[scoreIndex].timePlayed:get() --[[ currTimePlayed, ]] --[[ @ 288]]
			local currKills = prevScores[scoreIndex].kills:get() --[[ currKills, ]] --[[ @ 289]]
			local currDeaths = prevScores[scoreIndex].deaths:get() --[[ currDeaths, ]] --[[ @ 290]]
			currScoreTable.spm = math.floor( currScore / math.max( 1, currTimePlayed / 60 ) ) --[[ @ 291]]
			currScoreTable.kdr = string.format( "%.2f", currKills / math.max( 1, currDeaths ) ) --[[ @ 292]]
			currScoreTable.valid = prevScores[scoreIndex].valid:get() --[[ @ 293]]
			table.insert( graphData, currScoreTable ) --[[ @ 294]]
			scoreIndex = scoreIndex - 1 --[[ @ 296]]
			if scoreIndex < 0 then
				scoreIndex = maxScoreValues - 1 --[[ @ 298]]
			end
		end
	end
	local spmGraphModel = Engine.CreateModel( performanceTabStatsModel, "spmGraph" ) --[[ spmGraphModel, ]] --[[ @ 303]]
	local kdrGraphModel = Engine.CreateModel( performanceTabStatsModel, "kdrGraph" ) --[[ kdrGraphModel, ]] --[[ @ 304]]
	for index, data in ipairs( graphData ) --[[ @ 0]] do
		Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "value" .. index ), data.spm ) --[[ @ 307]]
		Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "value" .. index .. "Valid" ), data.valid ) --[[ @ 308]]
		Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "value" .. index ), string.format( "%.2f", data.kdr ) ) --[[ @ 309]]
		Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "value" .. index .. "Valid" ), data.valid ) --[[ @ 310]]
	end
	Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "avgSPM" ), averageSPM ) --[[ @ 313]]
	Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "avgKDR" ), string.format( "%.2f", averageKDR ) ) --[[ @ 314]]
	Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, "globalSPM" ), totalSPM ) --[[ @ 316]]
	Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, "globalKDR" ), totalKDR ) --[[ @ 317]]
	local spmUpperBound = averageSPM + 200 --[[ spmUpperBound, ]] --[[ @ 319]]
	if spmUpperBound < GetMaxValue( graphData, "spm" ) then
		spmUpperBound = GetMaxValue( graphData, "spm" ) + 50 --[[ @ 322]]
	end
	local spmLowerBound = math.max( averageSPM - 100, 0 ) --[[ spmLowerBound, ]] --[[ @ 325]]
	if GetMinValue( graphData, "spm" ) < spmLowerBound then
		spmLowerBound = GetMinValue( graphData, "spm" ) --[[ @ 328]]
	end
	local kdrUpperBound = averageKDR + 1.5 --[[ kdrUpperBound, ]] --[[ @ 331]]
	if kdrUpperBound < GetMaxValue( graphData, "kdr" ) then
		kdrUpperBound = GetMaxValue( graphData, "kdr" ) + 0.75 --[[ @ 334]]
	end
	local kdrLowerBound = math.max( averageKDR - 0.5, 0 ) --[[ kdrLowerBound, ]] --[[ @ 337]]
	if GetMinValue( graphData, "kdr" ) < kdrLowerBound then
		kdrLowerBound = GetMinValue( graphData, "kdr" ) --[[ @ 340]]
	end
	SetGraphValues( graphData, "spm", averageSPM, spmGraphModel, spmUpperBound, spmLowerBound ) --[[ @ 343]]
	SetGraphValues( graphData, "kdr", averageKDR, kdrGraphModel, kdrUpperBound, kdrLowerBound ) --[[ @ 344]]
end
 --[[ @ 241]]
CoD.AARUtility.GetXPEarnedDuringMatch = function --[[14]] ( currRankXP, rankXPBeforeMatch )
--[[ Func length: 347 - 355]]--[[vars: currRankXP: 0 - 5rankXPBeforeMatch: 0 - 5xpEarnedDuringMatch: 1 - 5]]--[[upvals: ]]	local xpEarnedDuringMatch = currRankXP - rankXPBeforeMatch --[[ xpEarnedDuringMatch, ]] --[[ @ 348]]
	if xpEarnedDuringMatch < 0 then
		xpEarnedDuringMatch = 0 --[[ @ 351]]
	end
	return xpEarnedDuringMatch
end
 --[[ @ 347]]
local AnyItemsUnlockedForRank = function --[[15]] ( rank, recentlyUnlockedItems )
--[[ Func length: 357 - 363]]--[[vars: rank: 0 - 18recentlyUnlockedItems: 0 - 18key: 4 - 16itemTable: 4 - 16]]--[[upvals: ]]	for key, itemTable in pairs( recentlyUnlockedItems ) --[[ @ 0]] do
		if Engine.GetItemUnlockLevel( itemTable.itemIndex ) == rank then
			return true
		end
	end
end
 --[[ AnyItemsUnlockedForRank, ]] --[[ @ 363]]
local GetBlueprintStringPrefixForItem = function --[[16]] ( itemIndex )
--[[ Func length: 365 - 373]]--[[vars: itemIndex: 0 - 25loadoutSlot: 6 - 25]]--[[upvals: ]]	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex ) --[[ loadoutSlot, ]] --[[ @ 366]]
	if loadoutSlot == "primary" or loadoutSlot == "secondary" then
		return Engine.GetItemGroup( itemIndex, Enum.eModes.MODE_MULTIPLAYER )
	else
		return loadoutSlot
	end
end
 --[[ GetBlueprintStringPrefixForItem, ]] --[[ @ 373]]
local IsHeroAbility = function --[[17]] ( itemIndex )
--[[ Func length: 375 - 380]]--[[vars: itemIndex: 0 - 17itemRef: 6 - 17]]--[[upvals: ]]	local itemRef = Engine.GetItemRef( itemIndex ) --[[ itemRef, ]] --[[ @ 376]]
	if LUI.startswith( itemRef, "gadget_" ) then
		return true
	else
		
	end
end
 --[[ IsHeroAbility, ]] --[[ @ 380]]
local IsHeroWeapon = function --[[18]] ( itemIndex )
--[[ Func length: 382 - 387]]--[[vars: itemIndex: 0 - 17itemRef: 6 - 17]]--[[upvals: ]]	local itemRef = Engine.GetItemRef( itemIndex ) --[[ itemRef, ]] --[[ @ 383]]
	if LUI.startswith( itemRef, "hero_" ) then
		return true
	else
		
	end
end
 --[[ IsHeroWeapon, ]] --[[ @ 387]]
local CreateRewardInfoModel = function --[[19]] ( rewardsCarouselItemModel, rewardInfoNum, rewardName, rewardImage, rewardDesc )
--[[ Func length: 389 - 397]]--[[vars: rewardsCarouselItemModel: 0 - 66rewardInfoNum: 0 - 66rewardName: 0 - 66rewardImage: 0 - 66rewardDesc: 0 - 66rewardInfoModel: 10 - 66]]--[[upvals: ]]	local rewardInfoModel = Engine.CreateModel( rewardsCarouselItemModel, "reward" .. rewardInfoNum .. "Info" ) --[[ rewardInfoModel, ]] --[[ @ 390]]
	Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "reward" .. rewardInfoNum .. "InfoVisible" ), 1 ) --[[ @ 391]]
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "rewardName" ), rewardName ) --[[ @ 392]]
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "rewardImage" ), rewardImage ) --[[ @ 393]]
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "rewardDesc" ), rewardDesc ) --[[ @ 394]]
	return rewardInfoModel
end
 --[[ CreateRewardInfoModel, ]] --[[ @ 397]]
CoD.AARUtility.CreateModelsForRewards = function --[[20]] ( controller )
--[[ Func length: 399 - 520]]--[[vars: controller: 0 - 664statsBeforeMatch: 1 - 664currentStats: 1 - 664useTestData: 16 - 664aarRewardsModel: 49 - 664rewardsCarouselItemCount: 50 - 664recentlyUnlockedItems: 56 - 664rankBeforeMatch: 67 - 664currRank: 78 - 664currPrestige: 89 - 664maxRewardItemsPerCarouselItem: 90 - 664rank: 94 - 336rewardsCarouselItemModel: 110 - 336currRankRewardCount: 111 - 336i: 115 - 131level: 142 - 336levelIcon: 142 - 336levelName: 148 - 336key: 212 - 327itemTable: 212 - 327currentSessionMode: 244 - 297heroTable: 250 - 297index: 254 - 295heroInfoTable: 254 - 295loadoutSlotInfo: 270 - 295unlockedAttachmentInfo: 338 - 664numBulletWeapons: 343 - 664itemIndex: 349 - 650numAttachments: 365 - 650unlockedAttachmentInfo: 366 - 650attachmentNum: 370 - 493attachmentIndex: 387 - 493levelForThisAttachment: 432 - 493xpForThisAttachment: 477 - 493key: 505 - 648info: 505 - 648rewardsCarouselItemModel: 515 - 648i: 519 - 535]]--[[upvals: AnyItemsUnlockedForRankIsHeroAbilityIsHeroWeaponCreateRewardInfoModelGetBlueprintStringPrefixForItem]]	local statsBeforeMatch, currentStats = nil --[[ statsBeforeMatch, currentStats, ]] --[[ @ 400]]
	currentStats = CoD.GetPlayerStats( controller ) --[[ @ 401]]
	local useTestData = CoD.AARUtility.UseTestData() --[[ useTestData, ]] --[[ @ 402]]
	if useTestData then
		statsBeforeMatch = CoD.GetPlayerStats( controller ) --[[ @ 405]]
	else
		statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE ) --[[ @ 407]]
	end
	local aarRewardsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarRewards" ) --[[ aarRewardsModel, ]] --[[ @ 411]]
	local rewardsCarouselItemCount = 0 --[[ rewardsCarouselItemCount, ]] --[[ @ 413]]
	local recentlyUnlockedItems = Engine.GetRecentlyUnlockedItems( controller ) --[[ recentlyUnlockedItems, ]] --[[ @ 416]]
	local rankBeforeMatch = statsBeforeMatch.PlayerStatsList.RANK.StatValue:get() --[[ rankBeforeMatch, ]] --[[ @ 417]]
	local currRank = currentStats.PlayerStatsList.RANK.StatValue:get() --[[ currRank, ]] --[[ @ 418]]
	local currPrestige = currentStats.PlayerStatsList.PLEVEL.StatValue:get() --[[ currPrestige, ]] --[[ @ 419]]
	local maxRewardItemsPerCarouselItem = 4 --[[ maxRewardItemsPerCarouselItem, ]] --[[ @ 420]]
	for rank = rankBeforeMatch --[[ rank, ]] --[[ @ 422]], currRank, 1 do
		if AnyItemsUnlockedForRank( rank, recentlyUnlockedItems ) then
			rewardsCarouselItemCount = rewardsCarouselItemCount + 1 --[[ @ 424]]
			local rewardsCarouselItemModel = Engine.CreateModel( aarRewardsModel, "rewardsCarouselItem" .. rewardsCarouselItemCount ) --[[ rewardsCarouselItemModel, ]] --[[ @ 425]]
			local currRankRewardCount = 0 --[[ currRankRewardCount, ]] --[[ @ 426]]
			for i = 1 --[[ i, ]] --[[ @ 428]], maxRewardItemsPerCarouselItem, 1 do
				Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "reward" .. i .. "InfoVisible" ), 0 ) --[[ @ 429]]
			end
			local level, f20_local2 = CoD.AARUtility.GetLevelAndLevelIconForRank( rank, currPrestige ) --[[ level, levelIcon, ]] --[[ @ 432]]
			local levelName = Engine.GetRankName( rank ) --[[ levelName, ]] --[[ @ 433]]
			Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemImage" ), f20_local2 .. "_lrg" ) --[[ @ 435]]
			Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemTitle" ), levelName ) --[[ @ 436]]
			Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemSubTitle" ), Engine.Localize( "MPUI_LEVEL_N", level ) ) --[[ @ 437]]
			Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemType" ), "rankup" ) --[[ @ 438]]
			for key, itemTable in pairs( recentlyUnlockedItems ) --[[ @ 0]] do
				if Engine.GetItemUnlockLevel( itemTable.itemIndex ) == rank and currRankRewardCount < maxRewardItemsPerCarouselItem and not IsHeroAbility( REG24.itemIndex ) then
					currRankRewardCount = currRankRewardCount + 1 --[[ @ 442]]
					if IsHeroWeapon( REG24.itemIndex ) then
						local currentSessionMode = Engine.CurrentSessionMode() --[[ currentSessionMode, ]] --[[ @ 445]]
						local heroTable = Engine.GetHeroList( currentSessionMode ) --[[ heroTable, ]] --[[ @ 446]]
						for index, heroInfoTable in ipairs( heroTable ) --[[ @ 0]] do
							local loadoutSlotInfo = Engine.GetLoadoutInfoForHero( currentSessionMode, heroInfoTable.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON ) --[[ loadoutSlotInfo, ]] --[[ @ 449]]
							if REG24.itemIndex == loadoutSlotInfo.itemIndex then
								CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount, Engine.Localize( REG31.displayName ), REG31.defaultHeroRender, "" ) --[[ @ 451]]
							end
						end
					end
					CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount, Engine.GetItemName( REG24.itemIndex ), Engine.GetItemImage( REG24.itemIndex ) .. "_rwd", "MPUI_" .. GetBlueprintStringPrefixForItem( REG24.itemIndex ) ) --[[ @ 456]]
				end
			end
			CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount + 1, "MPUI_UNLOCK_TOKEN", "t7_hud_mp_token_reward", "" ) --[[ @ 462]]
		end
	end
	local unlockedAttachmentInfo = {} --[[ unlockedAttachmentInfo, ]] --[[ @ 466]]
	local numBulletWeapons = Engine.GetNumBulletWeapons() --[[ numBulletWeapons, ]] --[[ @ 469]]
	if numBulletWeapons ~= nil then
		for itemIndex = 0 --[[ itemIndex, ]] --[[ @ 471]], numBulletWeapons - 1, 1 do
			if Engine.HasRecentItemAttachmentsUnlocked( controller, itemIndex ) then
				local numAttachments = Engine.GetNumItemAttachmentsWithAttachPoint( itemIndex, 0 ) --[[ numAttachments, ]] --[[ @ 473]]
				local unlockedAttachmentInfo = {} --[[ unlockedAttachmentInfo, ]] --[[ @ 475]]
				for attachmentNum = 1 --[[ attachmentNum, ]] --[[ @ 477]], numAttachments - 1, 1 do
					if Engine.IsItemAttachmentRecentlyUnlocked( controller, itemIndex, attachmentNum ) then
						local attachmentIndex = Engine.GetItemAttachment( itemIndex, attachmentNum ) --[[ attachmentIndex, ]] --[[ @ 479]]
						local levelForThisAttachment = tonumber( Engine.TableLookup( controller, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( itemIndex ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( attachmentIndex ), CoD.AARUtility.GunRankCol ) ) --[[ levelForThisAttachment, ]] --[[ @ 480]]
						local xpForThisAttachment = tonumber( Engine.TableLookup( controller, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( itemIndex ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( attachmentIndex ), CoD.AARUtility.GunRankXPCol ) ) --[[ xpForThisAttachment, ]] --[[ @ 481]]
						if levelForThisAttachment and xpForThisAttachment then
							table.insert( unlockedAttachmentInfo, {
								itemIndex = itemIndex,
								attachmentIndex = attachmentIndex,
								unlockLevel = levelForThisAttachment + 2,
								xp = xpForThisAttachment
							} ) --[[ @ 486]]
						end
					end
				end
				table.sort( unlockedAttachmentInfo, function --[[21]] ( a, b )
				--[[ Func length: 491 - 491]]--[[vars: a: 0 - 11b: 0 - 11]]--[[upvals: ]]	return a.unlockLevel < b.unlockLevel
				end ) --[[ @ 491]]
				for key, info in pairs( unlockedAttachmentInfo ) --[[ @ 0]] do
					rewardsCarouselItemCount = rewardsCarouselItemCount + 1 --[[ @ 494]]
					local rewardsCarouselItemModel = Engine.CreateModel( aarRewardsModel, "rewardsCarouselItem" .. rewardsCarouselItemCount ) --[[ rewardsCarouselItemModel, ]] --[[ @ 495]]
					for f20_local14 = 1 --[[ i, ]] --[[ @ 497]], maxRewardItemsPerCarouselItem, 1 do
						Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "reward" .. f20_local14 .. "InfoVisible" ), 0 ) --[[ @ 498]]
					end
					Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemImage" ), Engine.GetItemImage( REG23.itemIndex ) .. "_pu" ) --[[ @ 502]]
					Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemTitle" ), Engine.GetItemName( REG23.itemIndex ) ) --[[ @ 503]]
					Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemType" ), "weaponRankup" ) --[[ @ 504]]
					Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemSubTitle" ), Engine.Localize( "MPUI_LEVEL_N", REG23.unlockLevel ) ) --[[ @ 507]]
					CreateRewardInfoModel( rewardsCarouselItemModel, 1, Engine.GetAttachmentNameByIndex( REG23.attachmentIndex ), Engine.GetAttachmentImageByIndex( REG23.attachmentIndex ), "" ) --[[ @ 510]]
					CreateRewardInfoModel( rewardsCarouselItemModel, 2, Engine.Localize( "RANK_XP", REG23.xp ), "t7_hud_mp_notifications_xp_blue", "" ) --[[ @ 513]]
				end
			end
		end
	end
	Engine.SetModelValue( Engine.CreateModel( aarRewardsModel, "rewardsCarouselItemCount" ), rewardsCarouselItemCount ) --[[ @ 519]]
end
 --[[ @ 399]]
CoD.AARUtility.GetRewardItemCount = function --[[22]] ( list )
--[[ Func length: 522 - 524]]--[[vars: list: 0 - 20]]--[[upvals: ]]	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( list.controller ), "aarRewards.rewardsCarouselItemCount" ) )
end
 --[[ @ 522]]
CoD.AARUtility.GetModelForRewardItemByIndex = function --[[23]] ( controller, index )
--[[ Func length: 526 - 528]]--[[vars: controller: 0 - 15index: 0 - 15]]--[[upvals: ]]	return Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards.rewardsCarouselItem" .. index )
end
 --[[ @ 526]]
CoD.AARUtility.AnyRewardsEarnedDuringMatch = function --[[24]] ( controller )
--[[ Func length: 530 - 533]]--[[vars: controller: 0 - 31]]--[[upvals: ]]	CoD.AARUtility.CreateModelsForRewards( controller ) --[[ @ 531]]
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards.rewardsCarouselItemCount" ) ) > 0
end
 --[[ @ 530]]
CoD.AARUtility.SortMedals = function --[[25]] ( a, b )
--[[ Func length: 535 - 552]]--[[vars: a: 0 - 79b: 0 - 79medalSortkeyStrA: 29 - 77medalSortkeyStrB: 48 - 77sortkeyA: 55 - 77sortkeyB: 58 - 77]]--[[upvals: ]]	if a.row and b.row then
		local medalSortkeyStrA = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, a.row, CoD.AARUtility.medalSortkeyCol ) --[[ medalSortkeyStrA, ]] --[[ @ 537]]
		local medalSortkeyStrB = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, b.row, CoD.AARUtility.medalSortkeyCol ) --[[ medalSortkeyStrB, ]] --[[ @ 538]]
		if medalSortkeyStrA and medalSortkeyStrB then
			local sortkeyA = tonumber( medalSortkeyStrA ) --[[ sortkeyA, ]] --[[ @ 540]]
			local sortkeyB = tonumber( medalSortkeyStrB ) --[[ sortkeyB, ]] --[[ @ 541]]
			if sortkeyA == sortkeyB then
				return a.value < b.value
			else
				return sortkeyA < sortkeyB
			end
		end
	end
	return true
end
 --[[ @ 535]]
