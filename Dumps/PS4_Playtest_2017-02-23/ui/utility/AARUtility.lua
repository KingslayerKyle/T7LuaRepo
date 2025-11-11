CoD.AARUtility = {}
CoD.AARUtility.RankIdCol = 0
CoD.AARUtility.RankTableColMinXP = 2
CoD.AARUtility.RankTableColXPToNext = 3
CoD.AARUtility.RankDisplayStringCol = 5
CoD.AARUtility.RankTableColMaxXP = 7
CoD.AARUtility.RankDisplayLevelCol = 14
CoD.AARUtility.medalStringCol = 2
CoD.AARUtility.medalrefCol = 3
CoD.AARUtility.medalSortkeyCol = 10
CoD.AARUtility.GunRankCol = 0
CoD.AARUtility.GunRefCol = 2
CoD.AARUtility.GunAttachmentRefCol = 3
CoD.AARUtility.GunRankXPCol = 4
CoD.AARUtility.GameOrder = {}
CoD.AARUtility.GameOrder.MENU_PRESTIGE_ICONS_GAME_BO3 = 1
CoD.AARUtility.GameOrder.MENU_PRESTIGE_ICONS_GAME_BO2 = 2
CoD.AARUtility.GameOrder.MENU_PRESTIGE_ICONS_GAME_BO1 = 3
CoD.AARUtility.GameOrder.MENU_PRESTIGE_ICONS_GAME_WAW = 4
CoD.AARUtility.MaxRank = 55
CoD.AARUtility.SetCurrLevelModels = function ( controller, rank )
	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	local xpBarInfoModel = Engine.CreateModel( performanceTabStatsModel, "xpBarInfo" )
	local currLevelModel = Engine.CreateModel( xpBarInfoModel, "currLevel" )
	local currLevelIconModel = Engine.CreateModel( xpBarInfoModel, "currLevelIcon" )
	local level, levelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( rank, CoD.AARUtility.GetCurrentPrestige( controller ) )
	Engine.SetModelValue( currLevelModel, level )
	Engine.SetModelValue( currLevelIconModel, levelIcon )
end

CoD.AARUtility.SetCurrLevelModelsForParagon = function ( controller, paragonRank, paragonIconId )
	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	local xpBarInfoModel = Engine.CreateModel( performanceTabStatsModel, "xpBarInfo" )
	local currLevelModel = Engine.CreateModel( xpBarInfoModel, "currLevel" )
	local currLevelIconModel = Engine.CreateModel( xpBarInfoModel, "currLevelIcon" )
	local level, levelIcon = CoD.AARUtility.GetLevelAndIconForParagonRank( paragonRank, paragonIconId )
	Engine.SetModelValue( currLevelModel, level )
	Engine.SetModelValue( currLevelIconModel, levelIcon )
end

CoD.AARUtility.SetNextLevelModels = function ( controller, rank )
	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	local xpBarInfoModel = Engine.CreateModel( performanceTabStatsModel, "xpBarInfo" )
	local nextLevelModel = Engine.CreateModel( xpBarInfoModel, "nextLevel" )
	local nextLevelIconModel = Engine.CreateModel( xpBarInfoModel, "nextLevelIcon" )
	local level, levelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( rank, CoD.AARUtility.GetCurrentPrestige( controller ) )
	Engine.SetModelValue( nextLevelModel, level )
	Engine.SetModelValue( nextLevelIconModel, levelIcon )
end

CoD.AARUtility.SetNextLevelModelsForParagon = function ( controller, paragonRank, paragonIconId )
	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	local xpBarInfoModel = Engine.CreateModel( performanceTabStatsModel, "xpBarInfo" )
	local nextLevelModel = Engine.CreateModel( xpBarInfoModel, "nextLevel" )
	local nextLevelIconModel = Engine.CreateModel( xpBarInfoModel, "nextLevelIcon" )
	local level, levelIcon = CoD.AARUtility.GetLevelAndIconForParagonRank( paragonRank, paragonIconId )
	Engine.SetModelValue( nextLevelModel, level )
	Engine.SetModelValue( nextLevelIconModel, levelIcon )
end

CoD.AARUtility.GetLevelAndLevelIconForRank = function ( rank, prestige )
	local level = Engine.TableLookup( CoD.rankTable, CoD.AARUtility.RankDisplayLevelCol, CoD.AARUtility.RankIdCol, rank )
	local levelIcon = Engine.TableLookup( CoD.rankIconTable, prestige + 1, 0, rank )
	return level, levelIcon
end

CoD.AARUtility.GetLevelAndIconForParagonRank = function ( paragonRank, paragonIconId )
	local level = Engine.GetParagonRankDisplayLevel( paragonRank )
	local levelIcon = Engine.TableLookup( CoD.rankIconTable, CoD.MAX_PRESTIGE + 1, 0, 0 )
	if paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
		levelIcon = Engine.GetParagonIconById( paragonIconId )
	end
	return level, levelIcon
end

CoD.AARUtility.GetCurrentPrestige = function ( controller )
	local f7_local0 = CoD.GetPlayerStats( controller )
	return f7_local0.PlayerStatsList.PLEVEL.StatValue:get()
end

CoD.AARUtility.GetMinMaxXPForRank = function ( rank, controller )
	local minXP = tonumber( Engine.TableLookup( CoD.rankTable, CoD.AARUtility.RankTableColMinXP, CoD.AARUtility.RankIdCol, rank ) )
	local maxXP = tonumber( Engine.TableLookup( CoD.rankTable, CoD.AARUtility.RankTableColMaxXP, CoD.AARUtility.RankIdCol, rank ) )
	return minXP, maxXP
end

CoD.AARUtility.GetMinMaxXPForParagonRank = function ( rank, controller )
	local minXP = tonumber( Engine.TableLookup( CoD.paragonRankTable, CoD.AARUtility.RankTableColMinXP, CoD.AARUtility.RankIdCol, rank ) )
	local maxXP = tonumber( Engine.TableLookup( CoD.paragonRankTable, CoD.AARUtility.RankTableColMaxXP, CoD.AARUtility.RankIdCol, rank ) )
	return minXP, maxXP
end

CoD.AARUtility.XPBarAnimTime = 1000
CoD.AARUtility.UseTestData = function ()
	local f10_local0 = Dvar.aar_test:exists()
	if f10_local0 then
		if Dvar.aar_test:get() ~= true and Dvar.aar_test:get() ~= "1" then
			f10_local0 = false
		else
			f10_local0 = true
		end
	end
	return f10_local0
end

CoD.AARUtility.TestMultiplePromotions = function ()
	local f11_local0 = Dvar.aar_multiple_promo:exists()
	if f11_local0 then
		if Dvar.aar_multiple_promo:get() ~= true and Dvar.aar_multiple_promo:get() ~= "1" then
			f11_local0 = false
		else
			f11_local0 = true
		end
	end
	return f11_local0
end

CoD.AARUtility.TestSinglePromotion = function ()
	local f12_local0 = Dvar.aar_single_promo:exists()
	if f12_local0 then
		if Dvar.aar_single_promo:get() ~= true and Dvar.aar_single_promo:get() ~= "1" then
			f12_local0 = false
		else
			f12_local0 = true
		end
	end
	return f12_local0
end

CoD.AARUtility.SetupUIModels = function ( controller )
	local useTestData = CoD.AARUtility.UseTestData()
	local statsBeforeMatch, gameType = nil
	if useTestData then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "aarType" ), "public" )
	end
	Engine.CreateModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
	Engine.CreateModel( Engine.GetModelForController( controller ), "gameScore.gameTimeEnd" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if useTestData then
		statsBeforeMatch = CoD.GetPlayerStats( controller )
	else
		statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE )
	end
	local currentStats = CoD.GetPlayerStats( controller )
	local rankXPBeforeMatch = statsBeforeMatch.PlayerStatsList.RANKXP.StatValue:get()
	local currentRank = currentStats.PlayerStatsList.RANK.StatValue:get()
	local currPrestige = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	local currRankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
	local prestigeNext = CoD.PrestigeNext( controller )
	local xpEarnedDuringMatch = CoD.AARUtility.GetXPEarnedDuringMatch( currRankXP, rankXPBeforeMatch )
	if IsInParagonCapableGameMode() and currPrestige == Engine.GetPrestigeCap() then
		xpEarnedDuringMatch = CoD.AARUtility.GetXPEarnedDuringMatch( currentStats.PlayerStatsList.PARAGON_RANKXP.StatValue:get(), statsBeforeMatch.PlayerStatsList.PARAGON_RANKXP.StatValue:get() )
	end
	local aarStats = currentStats.AfterActionReportStats
	local stats = {}
	if prestigeNext then
		stats.nextLevel = CoD.PrestigeNextLevelText( controller )
		stats.nextLevelIcon = Engine.TableLookup( CoD.rankIconTable, currPrestige + 2, 0, 0 )
	else
		stats.nextLevel, stats.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank + 1, currPrestige + 1 )
	end
	if useTestData then
		gameType = "tdm"
		stats.kills = 24
		stats.deaths = 26
		stats.score = 2500
		local gameTypeInfo = Engine.GetGameTypeInfo( gameType )
		stats.gameTypeName = gameTypeInfo.nameRefCaps
		stats.gameTypeNameNormal = gameTypeInfo.nameRef
		stats.gameTypeIcon = gameTypeInfo.image
		stats.wins = 116
		stats.losses = 90
		stats.winLossRatio = 1.28
		stats.lossesRingClockFrac = string.format( "%.2f", stats.losses / math.max( 1, stats.wins + stats.losses ) )
		stats.showBestScoreIcon = 1
		stats.showBestKillsIcon = 1
		stats.showBestSPMIcon = 1
		stats.showBestKDRIcon = 1
	else
		gameType = Engine.GetCurrentGameType()
		local gameTypeInfo = Engine.GetGameTypeInfo( gameType )
		stats.kills = aarStats.kills:get()
		stats.deaths = aarStats.deaths:get()
		stats.score = aarStats.score:get()
		if gameType and gameType ~= "" then
			local f13_local0 = aarStats.hardcore
			if f13_local0 then
				local hardcore = aarStats.hardcore:get()
			end
			stats.gameTypeIcon = gameTypeInfo.image
			if f13_local0 ~= nil and f13_local0 == 1 then
				stats.gameTypeNameNormal = gameTypeInfo.hardcoreNameRef
				stats.gameTypeName = LocalizeToUpperString( stats.gameTypeNameNormal )
				gameType = "hc" .. gameType
			else
				stats.gameTypeName = gameTypeInfo.nameRefCaps
				stats.gameTypeNameNormal = gameTypeInfo.nameRef
			end
			stats.wins = currentStats.PlayerStatsByGameType[gameType].WINS.StatValue:get()
			stats.losses = currentStats.PlayerStatsByGameType[gameType].LOSSES.StatValue:get()
			stats.winLossRatio = string.format( "%.2f", stats.wins / math.max( 1, stats.losses ) )
			stats.lossesRingClockFrac = string.format( "%.2f", stats.losses / math.max( 1, stats.wins + stats.losses ) )
		end
		stats.showBestScoreIcon = 0
		stats.showBestKillsIcon = 0
		stats.showBestSPMIcon = 0
		stats.showBestKDRIcon = 0
	end
	local currHighestScore = currentStats.HighestStats.HIGHEST_SCORE:get()
	local currHighestKills = currentStats.HighestStats.HIGHEST_KILLS:get()
	if currHighestScore <= stats.score and currHighestScore ~= 0 then
		stats.showBestScoreIcon = 1
	end
	if currHighestKills <= stats.kills and currHighestKills ~= 0 then
		stats.showBestKillsIcon = 1
	end
	local matchScore = currentStats.PlayerStatsList.SCORE.StatValue:get() - statsBeforeMatch.PlayerStatsList.SCORE.StatValue:get()
	local matchTimePlayed = currentStats.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() - statsBeforeMatch.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get()
	local matchSPM = matchScore / math.max( 1, matchTimePlayed )
	local currHighestSPM = currentStats.HighestStats.HIGHEST_SCORE_PER_MINUTE:get()
	if currHighestSPM <= matchSPM and currHighestSPM ~= 0 then
		stats.showBestSPMIcon = 1
	end
	local killDeathRatio = stats.kills / math.max( 1, stats.deaths )
	local currHighestKDR = currentStats.HighestStats.HIGHEST_KDRATIO:get()
	if currHighestKDR <= killDeathRatio and currHighestKDR ~= 0 then
		stats.showBestKDRIcon = 1
	end
	stats.xpEarnedDuringMatch = xpEarnedDuringMatch
	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.xpScale" ), Engine.GetXPScale( controller ) )
	for key, value in pairs( stats ) do
		Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, key ), value )
	end
	CoD.AARUtility.CreateUIModelsForPerformanceGraphs( controller, performanceTabStatsModel, gameType )
	if CoD.isFrontend and controller ~= 0 then
		local performanceTabStatsModelControllerZero = Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.xpScale" ), Engine.GetXPScale( 0 ) )
		for key, value in pairs( stats ) do
			Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModelControllerZero, key ), value )
		end
		local totalSPM = CoD.SafeGetModelValue( performanceTabStatsModel, "globalSPM" )
		local totalKDR = CoD.SafeGetModelValue( performanceTabStatsModel, "globalKDR" )
		Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModelControllerZero, "globalSPM" ), totalSPM )
		Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModelControllerZero, "globalKDR" ), totalKDR )
	end
end

CoD.AARUtility.GetMaxValue = function ( valuesTable, key )
	local max = 0
	for index, valueTable in ipairs( valuesTable ) do
		if valueTable[key] and max < tonumber( valueTable[key] ) then
			max = tonumber( valueTable[key] )
		end
	end
	return max
end

CoD.AARUtility.GetMinValue = function ( valuesTable, key )
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

CoD.AARUtility.SetGraphValues = function ( graphData, key, averageValue, model, upperBound, lowerBound )
	local useTestData = CoD.AARUtility.UseTestData()
	if CoD.AARUtility.UseTestData() then
		local graphValues = {
			0.3,
			0.8,
			0.5,
			0.7,
			0.1
		}
		for index, data in ipairs( graphValues ) do
			Engine.SetModelValue( Engine.CreateModel( model, "graphValue" .. index ), string.format( "%.2f", data ) .. " 0 0 0" )
		end
	else
		for index, data in ipairs( graphData ) do
			local currSPM = data[key]
			local f16_local4 = 0
			if averageValue <= currSPM then
				f16_local4 = 0.5 - (currSPM - averageValue) / math.max( 1, upperBound - averageValue ) / 2
			else
				f16_local4 = 0.5 + (averageValue - currSPM) / math.max( 1, averageValue - lowerBound ) / 2
			end
			Engine.SetModelValue( Engine.CreateModel( model, "graphValue" .. index ), string.format( "%.2f", f16_local4 ) .. " 0 0 0" )
		end
	end
end

CoD.AARUtility.CreateUIModelsForPerformanceGraphs = function ( controller, performanceTabStatsModel, gameType )
	local useTestData = CoD.AARUtility.UseTestData()
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
	local gameTypeKills = currentStats.PlayerStatsByGameType[gameType].KILLS.StatValue:get()
	local gameTypeDeaths = currentStats.PlayerStatsByGameType[gameType].DEATHS.StatValue:get()
	local totalScore = currentStats.PlayerStatsList.SCORE.StatValue:get()
	local totalTimePlayed = currentStats.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get()
	local totalSPM = math.ceil( totalScore / math.max( 1, totalTimePlayed / 60 ) )
	local totalKills = currentStats.PlayerStatsList.KILLS.StatValue:get()
	local totalDeaths = currentStats.PlayerStatsList.DEATHS.StatValue:get()
	local totalKDR = string.format( "%.2f", totalKills / math.max( 1, totalDeaths ) )
	local averageSPM, averageKDR = nil
	if useTestData then
		averageSPM = 195
		averageKDR = 0.95
		totalSPM = 420
		totalKDR = 1.25
		local fakeScores = {
			180,
			202,
			175,
			208,
			201
		}
		local fakeKDR = {
			1.5,
			0.87,
			1.2,
			1.65,
			0.65
		}
		for index = 1, maxValuesForGraph, 1 do
			local currScoreTable = {
				spm = fakeScores[index],
				kdr = fakeKDR[index],
				valid = 1
			}
			table.insert( graphData, currScoreTable )
		end
	else
		for index = 1, maxValuesForGraph, 1 do
			local f17_local0 = index
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
	end
	local spmGraphModel = Engine.CreateModel( performanceTabStatsModel, "spmGraph" )
	local kdrGraphModel = Engine.CreateModel( performanceTabStatsModel, "kdrGraph" )
	local recentSumSPM = 0
	local recentSumKDR = 0
	local recentValidGameCount = 0
	for index, data in ipairs( graphData ) do
		Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "value" .. index ), data.spm )
		Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "value" .. index .. "Valid" ), data.valid )
		Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "value" .. index ), string.format( "%.2f", data.kdr ) )
		Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "value" .. index .. "Valid" ), data.valid )
		if data.valid == 1 then
			recentValidGameCount = recentValidGameCount + 1
			recentSumSPM = recentSumSPM + data.spm
			recentSumKDR = recentSumKDR + data.kdr
		end
	end
	if recentValidGameCount == 0 then
		local f17_local7 = "0.00"
	end
	averageKDR = f17_local7 or string.format( "%.2f", recentSumKDR / recentValidGameCount )
	if recentValidGameCount == 0 then
		local f17_local8 = 0
	end
	averageSPM = f17_local8 or math.ceil( recentSumSPM / recentValidGameCount )
	Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "avgSPM" ), averageSPM )
	Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "avgKDR" ), averageKDR )
	Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, "globalSPM" ), totalSPM )
	Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, "globalKDR" ), totalKDR )
	local maxSPM = CoD.AARUtility.GetMaxValue( graphData, "spm" )
	local minSPM = CoD.AARUtility.GetMinValue( graphData, "spm" )
	local spmUpperBound = math.max( maxSPM, averageSPM + 200 )
	local spmLowerBound = math.min( minSPM, math.max( averageSPM - 100, 0 ) )
	local spmRange = spmUpperBound - spmLowerBound
	spmUpperBound = math.max( spmUpperBound, maxSPM + spmRange / 20 )
	spmLowerBound = math.min( spmLowerBound, minSPM - spmRange / 20 )
	local maxKDR = CoD.AARUtility.GetMaxValue( graphData, "kdr" )
	local minKDR = CoD.AARUtility.GetMinValue( graphData, "kdr" )
	local kdrUpperBound = math.max( maxKDR, averageKDR + 1.5 )
	local kdrLowerBound = math.min( minKDR, math.max( averageKDR - 0.5, 0 ) )
	local kdrRange = kdrUpperBound - kdrLowerBound
	kdrUpperBound = math.max( kdrUpperBound, maxKDR + kdrRange / 20 )
	kdrLowerBound = math.min( kdrLowerBound, minKDR - kdrRange / 20 )
	CoD.AARUtility.SetGraphValues( graphData, "spm", averageSPM, spmGraphModel, spmUpperBound, spmLowerBound )
	CoD.AARUtility.SetGraphValues( graphData, "kdr", averageKDR, kdrGraphModel, kdrUpperBound, kdrLowerBound )
end

CoD.AARUtility.GetXPEarnedDuringMatch = function ( currRankXP, rankXPBeforeMatch )
	local xpEarnedDuringMatch = currRankXP - rankXPBeforeMatch
	if xpEarnedDuringMatch < 0 then
		xpEarnedDuringMatch = 0
	end
	return xpEarnedDuringMatch
end

CoD.AARUtility.AnyItemsUnlockedForRank = function ( rank, recentlyUnlockedItems )
	for key, itemTable in pairs( recentlyUnlockedItems ) do
		if Engine.GetItemUnlockLevel( itemTable.itemIndex ) == rank then
			return true
		end
	end
end

CoD.AARUtility.GetBlueprintStringPrefixForItem = function ( itemIndex )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
	if loadoutSlot == "primary" or loadoutSlot == "secondary" then
		return Engine.GetItemGroup( itemIndex, Enum.eModes.MODE_MULTIPLAYER )
	else
		return loadoutSlot
	end
end

CoD.AARUtility.IsHeroAbility = function ( itemIndex )
	local itemRef = Engine.GetItemRef( itemIndex )
	if LUI.startswith( itemRef, "gadget_" ) then
		return true
	else
		
	end
end

CoD.AARUtility.IsHeroWeapon = function ( itemIndex )
	local itemRef = Engine.GetItemRef( itemIndex )
	if LUI.startswith( itemRef, "hero_" ) then
		return true
	else
		
	end
end

CoD.AARUtility.CreateRewardInfoModel = function ( rewardsCarouselItemModel, rewardInfoNum, rewardName, rewardImage, rewardDesc, isCallingCard )
	local rewardInfoModel = Engine.CreateModel( rewardsCarouselItemModel, "reward" .. rewardInfoNum .. "Info" )
	Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "reward" .. rewardInfoNum .. "InfoVisible" ), 1 )
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "rewardName" ), rewardName )
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "rewardImage" ), rewardImage )
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "rewardDesc" ), rewardDesc )
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "isCallingCard" ), isCallingCard or false )
	return rewardInfoModel
end

CoD.AARUtility.CreateModelsForRewards = function ( controller )
	local statsBeforeMatch, currentStats = nil
	currentStats = CoD.GetPlayerStats( controller )
	local useTestData = CoD.AARUtility.UseTestData()
	if useTestData then
		statsBeforeMatch = CoD.GetPlayerStats( controller )
	else
		statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE )
	end
	local aarRewardsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarRewards" )
	local rewardsCarouselItemCount = 0
	local recentlyUnlockedItems = Engine.GetRecentlyUnlockedItems( controller )
	local rankBeforeMatch = statsBeforeMatch.PlayerStatsList.RANK.StatValue:get()
	local currRank = currentStats.PlayerStatsList.RANK.StatValue:get()
	local currPrestige = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	local paragonIconId = nil
	local maxRewardItemsPerCarouselItem = 4
	local f24_local0 = IsInParagonCapableGameMode()
	if f24_local0 then
		f24_local0 = CoD.AARUtility.GetCurrentPrestige( controller ) == Engine.GetPrestigeCap()
	end
	if f24_local0 then
		paragonIconId = currentStats.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
		rankBeforeMatch = statsBeforeMatch.PlayerStatsList.PARAGON_RANK.StatValue:get()
		currRank = currentStats.PlayerStatsList.PARAGON_RANK.StatValue:get()
	end
	local createNewCarouselEntry = function ( image, title, subTitle, type, widgetType, paragonRankDescVisible, extraParagonIconsVisible, cryptoKeyCountChanged )
		rewardsCarouselItemCount = rewardsCarouselItemCount + 1
		local rewardsCarouselItemModel = Engine.CreateModel( aarRewardsModel, "rewardsCarouselItem" .. rewardsCarouselItemCount )
		for i = 1, maxRewardItemsPerCarouselItem, 1 do
			Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "reward" .. i .. "InfoVisible" ), 0 )
		end
		Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemImage" ), image or "$white" )
		Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemTitle" ), title or "" )
		Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemSubTitle" ), subTitle or "" )
		Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemType" ), type or "" )
		Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselWidgetType" ), widgetType or "" )
		Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "paragonRankDescVisible" ), paragonRankDescVisible or 0 )
		Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "extraParagonIconsVisible" ), extraParagonIconsVisible or 0 )
		Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "cryptoKeyCountChanged" ), cryptoKeyCountChanged or false )
		return rewardsCarouselItemModel
	end
	
	local gameModeHasDefaultLevelReward = function ()
		local f26_local0 = IsCampaign()
		if not f26_local0 then
			if not IsMultiplayer() then
				f26_local0 = IsZombies()
				if f26_local0 then
				
				else
					return f26_local0
				end
			end
			f26_local0 = IsProgressionEnabled( controller )
		end
		return f26_local0
	end
	
	local aarStats = currentStats.AfterActionReportStats
	local matchEndCryptoKeyCount = CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller )
	local cryptoKeysBeforeMatch = matchEndCryptoKeyCount
	local cryptoKeyCountChanged = false
	if IsMultiplayer() then
		cryptoKeysBeforeMatch = aarStats.cryptoKeysBeforeMatch:get()
		cryptoKeyCountChanged = CoD.BlackMarketUtility.GetCryptoKeyCountPostMatch( aarStats ) ~= CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller )
	end
	if useTestData then
		matchEndCryptoKeyCount = 11
		cryptoKeysBeforeMatch = 9
	end
	if not cryptoKeyCountChanged and cryptoKeysBeforeMatch < matchEndCryptoKeyCount then
		local commonDropCrateCost = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON )
		local rareDropCrateCost = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.RARE )
		local cryptoKeysEarnedThisGame = matchEndCryptoKeyCount - cryptoKeysBeforeMatch
		if not cryptoKeyCountChanged and math.floor( cryptoKeysBeforeMatch / rareDropCrateCost ) < math.floor( matchEndCryptoKeyCount / rareDropCrateCost ) then
			local numRareCrates = math.floor( matchEndCryptoKeyCount / rareDropCrateCost )
			local numCommonCrates = math.floor( matchEndCryptoKeyCount / commonDropCrateCost )
			local descString = ""
			if numRareCrates > 1 then
				descString = Engine.Localize( "MENU_BLACKMARKET_REWARD_DESC_RARE_PLU", numRareCrates, numCommonCrates )
			else
				descString = Engine.Localize( "MENU_BLACKMARKET_REWARD_DESC_RARE", numCommonCrates )
			end
			local rewardsCarouselItemModel = createNewCarouselEntry( "uie_t7_blackmarket_crate_rare_focus", descString, tostring( matchEndCryptoKeyCount ), "blackMarket", "CoD.BlackmarketRewardsCarouselItemRare", nil, nil, cryptoKeyCountChanged )
			CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, 1, tostring( cryptoKeysEarnedThisGame ), "", "" )
		elseif math.floor( cryptoKeysBeforeMatch / commonDropCrateCost ) < math.floor( matchEndCryptoKeyCount / commonDropCrateCost ) then
			local numCommonCrates = math.floor( matchEndCryptoKeyCount / commonDropCrateCost )
			local descString = ""
			if numCommonCrates > 1 then
				descString = Engine.Localize( "MENU_BLACKMARKET_REWARD_DESC_COMMON_PLU", numCommonCrates )
			else
				descString = Engine.Localize( "MENU_BLACKMARKET_REWARD_DESC_COMMON", numCommonCrates )
			end
			local rewardsCarouselItemModel = createNewCarouselEntry( "uie_t7_blackmarket_crate_common_focus", descString, tostring( matchEndCryptoKeyCount ), "blackMarket", "CoD.BlackmarketRewardsCarouselItem", nil, nil, cryptoKeyCountChanged )
			CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, 1, tostring( cryptoKeysEarnedThisGame ), "", "" )
		end
	end
	for rank = rankBeforeMatch + 1, currRank, 1 do
		if gameModeHasDefaultLevelReward() or CoD.AARUtility.AnyItemsUnlockedForRank( rank, recentlyUnlockedItems ) then
			local currRankRewardCount = 0
			local level, levelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( rank, currPrestige )
			local levelName = CoD.GetRankName( rank, currPrestige )
			local unlockedParagonIcons = {}
			local widgetType = "rankup"
			local paragonRankDescAlpha = 0
			local extraParagonIconsAlpha = 0
			if f24_local0 then
				level, levelIcon = CoD.AARUtility.GetLevelAndIconForParagonRank( rank, paragonIconId )
				unlockedParagonIcons = Engine.GetUnlockedParagonIconsForParagonRank( rank )
				widgetType = "paragonRankUp"
				if #unlockedParagonIcons == 0 then
					paragonRankDescAlpha = 1
				end
				if rank == CoD.MAX_PARAGON_RANK then
					extraParagonIconsAlpha = 1
				end
			end
			local rewardsCarouselItemModel = createNewCarouselEntry( levelIcon .. "_lrg", levelName, Engine.Localize( "MPUI_LEVEL_N", level ), widgetType, nil, paragonRankDescAlpha, extraParagonIconsAlpha )
			for key, itemTable in pairs( recentlyUnlockedItems ) do
				if Engine.GetItemUnlockLevel( itemTable.itemIndex ) == rank and currRankRewardCount < maxRewardItemsPerCarouselItem and not CoD.AARUtility.IsHeroAbility( itemTable.itemIndex ) then
					currRankRewardCount = currRankRewardCount + 1
					if CoD.AARUtility.IsHeroWeapon( itemTable.itemIndex ) then
						local currentSessionMode = Engine.CurrentSessionMode()
						local heroTable = Engine.GetHeroList( currentSessionMode )
						for _, heroInfoTable in ipairs( heroTable ) do
							local loadoutSlotInfo = Engine.GetLoadoutInfoForHero( currentSessionMode, heroInfoTable.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
							if itemTable.itemIndex == loadoutSlotInfo.itemIndex then
								CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount, Engine.Localize( heroInfoTable.displayName ), heroInfoTable.defaultHeroRender, "" )
							end
						end
					end
					local loadoutSlotType = Engine.GetLoadoutSlotForItem( itemTable.itemIndex )
					local rewardImage = Engine.GetItemImage( itemTable.itemIndex )
					if not IsZombies() or loadoutSlotType ~= "equippedbubblegumpack" then
						rewardImage = rewardImage .. "_rwd"
					end
					CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount, Engine.GetItemName( itemTable.itemIndex ), rewardImage, "MPUI_" .. CoD.AARUtility.GetBlueprintStringPrefixForItem( itemTable.itemIndex ) )
				end
			end
			local iconPerGameTable = {}
			for _, paragonIcon in pairs( unlockedParagonIcons ) do
				if not iconPerGameTable[CoD.AARUtility.GameOrder[paragonIcon.gameTitle]] then
					iconPerGameTable[CoD.AARUtility.GameOrder[paragonIcon.gameTitle]] = paragonIcon
				end
				local topPrestigeIcon = iconPerGameTable[CoD.AARUtility.GameOrder[paragonIcon.gameTitle]]
				if topPrestigeIcon.plevel < paragonIcon.plevel then
					iconPerGameTable[CoD.AARUtility.GameOrder[paragonIcon.gameTitle]] = paragonIcon
				end
			end
			for _, paragonIcon in pairs( iconPerGameTable ) do
				if currRankRewardCount < maxRewardItemsPerCarouselItem then
					CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount + 1, "MENU_AAR_CUSTOM_PRESTIGE_ICON", paragonIcon.imageName .. "_lrg", paragonIcon.gameTitle )
				end
			end
			if not f24_local0 and gameModeHasDefaultLevelReward() and not IsZombies() then
				CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount + 1, "MPUI_UNLOCK_TOKEN", "t7_hud_mp_token_reward", "" )
			end
		end
	end
	local unlockedAttachmentInfo = {}
	local numBulletWeapons = Engine.GetNumBulletWeapons()
	if numBulletWeapons ~= nil then
		for cryptoKeysEarnedThisGame = 0, numBulletWeapons - 1, 1 do
			if Engine.HasRecentItemAttachmentsUnlocked( controller, cryptoKeysEarnedThisGame ) then
				local numAttachments = Engine.GetNumItemAttachmentsWithAttachPoint( cryptoKeysEarnedThisGame, 0 )
				local unlockedAttachmentInfo = {}
				for attachmentNum = 1, numAttachments - 1, 1 do
					if Engine.IsItemAttachmentRecentlyUnlocked( controller, cryptoKeysEarnedThisGame, attachmentNum ) then
						local attachmentIndex = Engine.GetItemAttachment( cryptoKeysEarnedThisGame, attachmentNum )
						local levelForThisAttachment = tonumber( Engine.TableLookup( CoD.gunLevelsTable, CoD.AARUtility.GunRankCol, CoD.AARUtility.GunRefCol, Engine.GetItemRef( cryptoKeysEarnedThisGame ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( attachmentIndex ) ) )
						local xpForThisAttachment = tonumber( Engine.TableLookup( CoD.gunLevelsTable, CoD.AARUtility.GunRankXPCol, CoD.AARUtility.GunRefCol, Engine.GetItemRef( cryptoKeysEarnedThisGame ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( attachmentIndex ) ) )
						if levelForThisAttachment and xpForThisAttachment then
							table.insert( unlockedAttachmentInfo, {
								itemIndex = cryptoKeysEarnedThisGame,
								attachmentIndex = attachmentIndex,
								unlockLevel = levelForThisAttachment + 2,
								xp = xpForThisAttachment
							} )
						end
					end
				end
				table.sort( unlockedAttachmentInfo, function ( a, b )
					return a.unlockLevel < b.unlockLevel
				end )
				for key, info in pairs( unlockedAttachmentInfo ) do
					local rewardsCarouselItemModel = createNewCarouselEntry( Engine.GetItemImage( info.itemIndex ) .. "_pu", Engine.GetItemName( info.itemIndex ), Engine.Localize( "MPUI_LEVEL_N", info.unlockLevel ), "weaponRankup" )
					local attachmentImage = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, info.itemIndex, info.attachmentIndex )
					CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, 1, Engine.GetAttachmentNameByIndex( info.attachmentIndex ), attachmentImage .. "_rwd", "" )
					CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, 2, Engine.Localize( "RANK_XP", info.xp ), "t7_hud_mp_notifications_xp_blue", "" )
				end
			end
		end
	end
	local cryptoKeysEarnedThisGame = nil
	if useTestData then
		cryptoKeysEarnedThisGame = {}
		local addTestItem = function ( tableNumber, id, itemIndex, specialistIndex )
			local tableName = CoD.getStatsMilestoneTable( tableNumber + 1 )
			local rows = Engine.TableFindRows( tableName, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX, id )
			if not rows then
				return 
			end
			local row = rows[1]
			local unlockItem = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM )
			local unlockImage = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKIMAGE )
			local unlockHeroItem = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKHEROITEM )
			local category = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STATTYPE )
			local rewardXp = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_XPEARNED ) )
			local unlockedImageId = nil
			local unlockedImageIsEmblem = true
			if unlockImage and unlockImage ~= "" then
				unlockedImageId = Engine.TableLookup( CoD.emblemIconsTable, 1, 4, unlockImage )
				if not unlockedImageId or unlockedImageId == "" then
					unlockedImageId = Engine.TableLookup( CoD.backgroundsTable, 1, 4, unlockImage )
					unlockedImageIsEmblem = false
				end
				if unlockedImageId then
					if unlockedImageId == "" then
						unlockedImageId = nil
					else
						unlockedImageId = tonumber( unlockedImageId )
					end
				end
			end
			if category == "global" then
				category = Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL
			elseif category == "gamemode" then
				category = Enum.statsMilestoneTypes_t.MILESTONE_GAMEMODE
			elseif category == "group" then
				category = Enum.statsMilestoneTypes_t.MILESTONE_GROUP
			elseif category == "attachment" then
				category = Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS
			elseif category == "specialist" then
				category = Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST
			else
				category = Enum.statsMilestoneTypes_t.MILESTONE_WEAPON
			end
			table.insert( cryptoKeysEarnedThisGame, {
				tableNumber = tableNumber,
				row = row,
				itemIndex = itemIndex,
				type = category,
				rewardXp = rewardXp,
				heroUnlock = unlockHeroItem,
				unlockedImageId = unlockedImageId,
				specialistIndex = specialistIndex
			} )
		end
		
		addTestItem( 0, 0, nil, nil )
		addTestItem( 0, 120, nil, nil )
		addTestItem( 0, 2, nil, nil )
		addTestItem( 1, 324, 7, nil )
		addTestItem( 1, 325, 7, nil )
		addTestItem( 2, 656, 33, nil )
		addTestItem( 2, 657, 33, nil )
		addTestItem( 3, 820, nil, 3 )
		addTestItem( 3, 867, nil, 3 )
		addTestItem( 3, 870, nil, 3 )
		addTestItem( 2, 555, 25, nil )
		addTestItem( 2, 556, 25, nil )
		addTestItem( 2, 648, Enum.itemGroup_t.ITEMGROUP_ASSAULT, nil )
		addTestItem( 2, 649, Enum.itemGroup_t.ITEMGROUP_PISTOL, nil )
		addTestItem( 2, 650, Enum.itemGroup_t.ITEMGROUP_SMG, nil )
		addTestItem( 2, 651, Enum.itemGroup_t.ITEMGROUP_LMG, nil )
		addTestItem( 2, 652, Enum.itemGroup_t.ITEMGROUP_SNIPER, nil )
		addTestItem( 2, 653, Enum.itemGroup_t.ITEMGROUP_CQB, nil )
		addTestItem( 2, 654, Enum.itemGroup_t.ITEMGROUP_LAUNCHER, nil )
		addTestItem( 2, 656, Enum.itemGroup_t.ITEMGROUP_KNIFE, nil )
		addTestItem( 0, 163, nil, nil )
	else
		cryptoKeysEarnedThisGame = Engine.GetRecentChallenges( controller )
	end
	if cryptoKeysEarnedThisGame then
		for _, challenge in ipairs( cryptoKeysEarnedThisGame ) do
			local f24_local13 = false
			if CoD.ChallengesUtility.IsSpecialistTransmissionChallenge( challenge.type, challenge.tableNumber, challenge.row ) or CoD.ChallengesUtility.IsTerribleKnifeChallenge( challenge.type, challenge.tableNumber, challenge.row ) or CoD.ChallengesUtility.IsHiddenPostShipChallenge( challenge.type, challenge.tableNumber, challenge.row ) then
				f24_local13 = true
			end
			if IsZombies() and challenge.type == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
				local tableName = CoD.getStatsMilestoneTable( challenge.tableNumber + 1 )
				local dailyChallengeIndex = Engine.TableLookupGetColumnValueForRow( tableName, challenge.row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX )
				local dailyChallengeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "AARDailyChallengeModel" )
				CoD.ChallengesUtility.UpdateDailyChallengeModel( controller, dailyChallengeModel, Enum.eModes.MODE_ZOMBIES, tonumber( dailyChallengeIndex ) )
			end
			if not f24_local13 then
				local challengeRewardInfo = CoD.ChallengesUtility.GetChallengeRewardInfo( controller, challenge.tableNumber, challenge.row, challenge.type, challenge.itemIndex, challenge.specialistIndex )
				if challengeRewardInfo.titleText then
					local widgetType = nil
					if IsMultiplayer() then
						if challengeRewardInfo.specialistInfo then
							if challengeRewardInfo.specialistInfo.unlockItemIndex == 9 then
								widgetType = "CoD.SpecialistCompletionEpicRewardsCarouselItem"
							elseif challengeRewardInfo.specialistInfo.unlockItemIndex == 8 then
								widgetType = "CoD.SpecialistEpicRewardsCarouselItem"
							else
								widgetType = "CoD.SpecialistRewardsCarouselItem"
							end
						elseif challengeRewardInfo.camoInfo then
							if challengeRewardInfo.camoInfo.camoRef == "camo_diamond" or challengeRewardInfo.camoInfo.camoRef == "camo_darkmatter" then
								widgetType = "CoD.CamoDiamondRewardsCarouselItem"
							elseif challengeRewardInfo.camoInfo.camoRef == "camo_gold" then
								widgetType = "CoD.CamoGoldRewardsCarouselItem"
							else
								widgetType = "CoD.CamoRewardsCarouselItem"
							end
						elseif challengeRewardInfo.reticleInfo then
							widgetType = "CoD.ReticleRewardsCarouselItem"
						elseif challengeRewardInfo.emblemInfo then
							if challengeRewardInfo.emblemInfo.isMastery then
								widgetType = "CoD.MPChallengeMasterRewardsCarouselItem"
							else
								widgetType = "CoD.MPChallengeRewardsCarouselItem"
							end
						else
							widgetType = "CoD.MPChallengeRewardsCarouselItem"
						end
					elseif IsZombies() then
						if challengeRewardInfo.camoInfo then
							widgetType = "CoD.CamoRewardsCarouselItem"
						elseif challengeRewardInfo.reticleInfo then
							widgetType = "CoD.ReticleRewardsCarouselItem"
						elseif challenge.type == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
							widgetType = "CoD.ZMDailyChallengeRewardsCarouselItem"
						else
							widgetType = "CoD.MPChallengeRewardsCarouselItem"
						end
					end
					local rewardsCarouselItemModel = createNewCarouselEntry( challengeRewardInfo.icon, challengeRewardInfo.titleText, challengeRewardInfo.subtitleText, "challenge", widgetType )
					local rewardIndex = 1
					local rewardInfoOrder = {
						"specialistInfo",
						"camoInfo",
						"emblemInfo",
						"reticleInfo",
						"transmissionInfo",
						"xpInfo",
						"vialInfo"
					}
					for _, paragonIcon in ipairs( rewardInfoOrder ) do
						if challengeRewardInfo[paragonIcon] then
							CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, rewardIndex, challengeRewardInfo[paragonIcon].displayString, challengeRewardInfo[paragonIcon].image, "", challengeRewardInfo[paragonIcon].rewardSize == "CallingCard" )
							rewardIndex = rewardIndex + 1
						end
					end
				end
			end
		end
	end
	if IsZombies() then
		local bgbTokensGainedThisGame = currentStats.PlayerStatsList.BGB_TOKENS_GAINED_THIS_GAME.StatValue:get()
		if bgbTokensGainedThisGame and bgbTokensGainedThisGame > 0 then
			local rewardsCarouselItemModel = nil
			if bgbTokensGainedThisGame == 1 then
				rewardsCarouselItemModel = createNewCarouselEntry( "uie_t7_hud_zm_vial_aar", "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_TITLE", "ZMUI_VIAL_DISCOVERED", "rankup" )
			else
				rewardsCarouselItemModel = createNewCarouselEntry( "uie_t7_hud_zm_vial_aar", "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_TITLE", "ZMUI_VIALS_DISCOVERED", "rankup" )
			end
			CoD.AARUtility.CreateRewardInfoModel( rewardsCarouselItemModel, 1, Engine.Localize( "ZMUI_BGB_TOKENS_GAINED_REWARD", bgbTokensGainedThisGame ), "t7_hud_zm_vial_256", "", false )
		end
	end
	Engine.SetModelValue( Engine.CreateModel( aarRewardsModel, "rewardsCarouselItemCount" ), rewardsCarouselItemCount )
end

CoD.AARUtility.GetRewardItemCount = function ( list )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( list.controller ), "aarRewards.rewardsCarouselItemCount" ) )
end

CoD.AARUtility.GetModelForRewardItemByIndex = function ( controller, index )
	return Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards.rewardsCarouselItem" .. index )
end

CoD.AARUtility.AnyRewardsEarnedDuringMatch = function ( controller )
	return IsLive() and Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards.rewardsCarouselItemCount" ) ) > 0
end

CoD.AARUtility.SortMedals = function ( a, b )
	if a.row and b.row then
		local medalSortkeyStrA = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, a.row, CoD.AARUtility.medalSortkeyCol )
		local medalSortkeyStrB = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, b.row, CoD.AARUtility.medalSortkeyCol )
		if medalSortkeyStrA and medalSortkeyStrB then
			local sortkeyA = tonumber( medalSortkeyStrA )
			local sortkeyB = tonumber( medalSortkeyStrB )
			if sortkeyA == sortkeyB then
				return a.value < b.value
			else
				return sortkeyA < sortkeyB
			end
		end
	end
	return true
end

CoD.AARUtility.CountdownRequiredXPNumber = function ( controller, self, xpBar, startValue, endValue, endFunc )
	local animTime = CoD.AARUtility.XPBarAnimTime
	local performanceTabStatsModel = Engine.GetModel( Engine.GetModelForController( CoD.isFrontend and 0 or controller ), "aarStats.performanceTabStats" )
	local xpNeededToLevelUpStringRefValueModel = Engine.CreateModel( performanceTabStatsModel, "xpNeededToLevelUpStringRefValue" )
	local xpNumberCountdownInterval = 5
	local xpNumberTimer = LUI.UITimer.new( xpNumberCountdownInterval, "count_down", false, self )
	xpNumberTimer.currentValue = startValue
	xpNumberTimer.minValue = endValue
	self.xpNumberTimer = xpNumberTimer
	local timeElapsed = 0
	self:registerEventHandler( "count_down", function ( eventOwner, event )
		timeElapsed = timeElapsed + event.timeElapsed
		xpNumberTimer.currentValue = math.floor( startValue - timeElapsed / animTime * startValue )
		if xpNumberTimer.currentValue < xpNumberTimer.minValue or animTime < timeElapsed then
			xpNumberTimer.currentValue = xpNumberTimer.minValue
			xpNumberTimer:close()
			if endFunc then
				endFunc()
			end
		end
		Engine.SetModelValue( xpNeededToLevelUpStringRefValueModel, xpNumberTimer.currentValue )
		if CoD.isFrontend and controller ~= 0 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats.xpNeededToLevelUpStringRefValue" ), xpNumberTimer.currentValue )
		end
	end )
	self:addElement( self.xpNumberTimer )
end

CoD.AARUtility.DoXPBarAnimationSequence = function ( controller, self, startRankXP, startRank, endRank, currRankXP, isParagonRank, paragonIconId )
	local animTime = CoD.AARUtility.XPBarAnimTime
	local xpBar = self.XpBarContainer.XpBar
	local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( startRank, controller )
	if isParagonRank then
		minXP, maxXP = CoD.AARUtility.GetMinMaxXPForParagonRank( startRank, controller )
	end
	local startValue = (startRankXP - minXP) / math.max( 1, maxXP - minXP )
	local endValue = 1
	local endValueForCounter = 0
	local endXP = 0
	if startRank == endRank then
		endValue = (currRankXP - minXP) / math.max( 1, maxXP - minXP )
		endValueForCounter = maxXP - currRankXP
	end
	xpBar.XpBarCurrXPBg:setShaderVector( 0, startValue, 0, 0, 0 )
	xpBar.XpBarEarnedXPBg:setShaderVector( 0, startValue, 0, 0, 0 )
	xpBar.XpBarEarnedXPBg:beginAnimation( "animate_bar", animTime, true, true )
	xpBar.XpBarEarnedXPBg:setShaderVector( 0, endValue, 0, 0, 0 )
	Engine.PlaySound( "uin_aar_bar_fill_main" )
	CoD.AARUtility.CountdownRequiredXPNumber( controller, self, xpBar, maxXP - startRankXP, endValueForCounter, function ()
		Engine.PlaySound( "uin_aar_bar_fill_tail" )
		if endRank <= startRank then
			if Engine.IsCampaignGame() then
				CoD.AARUtilityCP.hasSeenXPBarAnim = true
			end
			return 
		else
			self.XpBarContainer:playClip( "Update" )
			self.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
				local newRank = math.min( CoD.MAX_RANK, startRank + 1 )
				local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( newRank, controller )
				if isParagonRank then
					newRank = math.min( CoD.MAX_PARAGON_RANK, startRank + 1 )
					minXP, maxXP = CoD.AARUtility.GetMinMaxXPForParagonRank( newRank, controller )
					CoD.AARUtility.SetCurrLevelModelsForParagon( controller, newRank, paragonIconId )
					CoD.AARUtility.SetNextLevelModelsForParagon( controller, math.min( CoD.MAX_PARAGON_RANK, newRank + 1 ), paragonIconId )
				else
					CoD.AARUtility.SetCurrLevelModels( controller, newRank )
					CoD.AARUtility.SetNextLevelModels( controller, math.min( CoD.MAX_RANK, newRank + 1 ) )
				end
				xpBar.XpBarCurrXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				xpBar.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				if IsCampaign() and newRank == CoD.MAX_RANK then
					self.XpBarContainer:playClip( "FlashLastLevel" )
				else
					self.XpBarContainer:playClip( "FlashNextLevel" )
				end
				self.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
					CoD.AARUtility.DoXPBarAnimationSequence( controller, self, minXP, newRank, endRank, currRankXP, isParagonRank, paragonIconId )
				end )
			end )
		end
	end )
end

CoD.AARUtility.DoXPBarAnimation = function ( self, controller )
	local useTestData = CoD.AARUtility.UseTestData()
	if Engine.IsCampaignGame() then
		useTestData = CoD.AARUtilityCP.UseTestData()
	end
	local singlePromotion = CoD.AARUtility.TestSinglePromotion()
	local multiplePromotions = CoD.AARUtility.TestMultiplePromotions()
	local rankBeforeMatch, rankXPBeforeMatch, currRankXP, currRank = nil
	local isParagonRank = false
	local paragonIconId = CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID
	if not useTestData then
		local statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE )
		local f39_local0 = IsInParagonCapableGameMode()
		if f39_local0 then
			local prevPLevel = statsBeforeMatch.PlayerStatsList.PLEVEL.StatValue:get()
		end
		isParagonRank = IsInParagonCapableGameMode() and f39_local0 == Engine.GetPrestigeCap()
		if Engine.IsCampaignGame() then
			local currentStats = CoD.GetPlayerStats( controller )
			rankBeforeMatch = CoD.AARUtilityCP.GetRankForRankXP( controller, currentStats.currentRankXP:get() )
			currRank = currentStats.PlayerStatsList.RANK.StatValue:get()
			currRankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
		elseif isParagonRank then
			rankBeforeMatch = statsBeforeMatch.PlayerStatsList.PARAGON_RANK.StatValue:get()
			rankXPBeforeMatch = statsBeforeMatch.PlayerStatsList.PARAGON_RANKXP.StatValue:get()
			local currentStats = CoD.GetPlayerStats( controller )
			currRank = currentStats.PlayerStatsList.PARAGON_RANK.StatValue:get()
			currRankXP = currentStats.PlayerStatsList.PARAGON_RANKXP.StatValue:get()
			paragonIconId = currentStats.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
		else
			rankBeforeMatch = statsBeforeMatch.PlayerStatsList.RANK.StatValue:get()
			rankXPBeforeMatch = statsBeforeMatch.PlayerStatsList.RANKXP.StatValue:get()
			local currentStats = CoD.GetPlayerStats( controller )
			currRank = currentStats.PlayerStatsList.RANK.StatValue:get()
			currRankXP = currentStats.PlayerStatsList.RANKXP.StatValue:get()
		end
	end
	local performanceTabStatsModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	local xpBar = self.XpBarContainer.XpBar
	if useTestData then
		if multiplePromotions then
			rankBeforeMatch = 4
			rankXPBeforeMatch = 20250
			currRankXP = 35500
			currRank = 6
		elseif singlePromotion then
			rankBeforeMatch = 5
			rankXPBeforeMatch = 28500
			currRankXP = 35500
			currRank = 6
		else
			rankBeforeMatch = 5
			rankXPBeforeMatch = 28500
			currRankXP = 31500
			currRank = 5
		end
		Engine.SetModelValue( Engine.CreateModel( performanceTabStatsModel, "xpEarnedDuringMatch" ), currRankXP - rankXPBeforeMatch )
	end
	local actuallyAnimate = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doAARXPBarAnimation" ) )
	if not actuallyAnimate then
		local nextRank = currRank + 1
		local maxRank = CoD.MAX_RANK
		if isParagonRank then
			CoD.AARUtility.SetCurrLevelModelsForParagon( controller, currRank, paragonIconId )
			maxRank = CoD.MAX_PARAGON_RANK
		else
			CoD.AARUtility.SetCurrLevelModels( controller, currRank )
		end
		if maxRank < nextRank then
			nextRank = currRank
		end
		local minXP = currRankXP
		local maxXP = currRankXP
		if IsCampaign() and nextRank == currRank then
			xpBar.XpBarCurrXPBg:setShaderVector( 0, 0, 0, 0, 0 )
			xpBar.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
			self.XpBarContainer.RankIconAndNumberWidgetNextTop:setAlpha( 0 )
			self.XpBarContainer.RankIconAndNumberWidgetNextBase:setAlpha( 0 )
			self.XpBarContainer.NextLevelDisplay:setAlpha( 0 )
			self.XpBarContainer.XpBar:setAlpha( 0 )
			self.XpBarContainer.XpBarFrame:setAlpha( 0 )
			self.XpBarContainer.MeterGlow:setAlpha( 0 )
			self.XpBarContainer.XPEarnedDisplay:setAlpha( 0 )
		elseif isParagonRank then
			CoD.AARUtility.SetNextLevelModelsForParagon( controller, nextRank, paragonIconId )
			minXP, maxXP = CoD.AARUtility.GetMinMaxXPForParagonRank( currRank, controller )
			local currXPFrac = (currRankXP - minXP) / math.max( 1, maxXP - minXP )
			xpBar.XpBarCurrXPBg:setShaderVector( 0, currXPFrac, 0, 0, 0 )
			xpBar.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
		else
			CoD.AARUtility.SetNextLevelModels( controller, nextRank )
			minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( currRank, controller )
			local currXPFrac = (currRankXP - minXP) / math.max( 1, maxXP - minXP )
			xpBar.XpBarCurrXPBg:setShaderVector( 0, currXPFrac, 0, 0, 0 )
			xpBar.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
		end
		local xpNeededToLevelUpStringRefValueModel = Engine.CreateModel( performanceTabStatsModel, "xpNeededToLevelUpStringRefValue" )
		Engine.SetModelValue( xpNeededToLevelUpStringRefValueModel, maxXP - currRankXP )
		if CoD.isFrontend and controller ~= 0 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats.xpNeededToLevelUpStringRefValue" ), maxXP - currRankXP )
		end
	elseif isParagonRank then
		local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForParagonRank( rankBeforeMatch, controller )
		local progressionAtStart = (rankXPBeforeMatch - minXP) / math.max( 1, maxXP - minXP )
		xpBar.XpBarCurrXPBg:setShaderVector( 0, progressionAtStart, 0, 0, 0 )
		xpBar.XpBarEarnedXPBg:setShaderVector( 0, progressionAtStart, 0, 0, 0 )
		CoD.AARUtility.SetCurrLevelModelsForParagon( controller, rankBeforeMatch, paragonIconId )
		CoD.AARUtility.SetNextLevelModelsForParagon( controller, math.min( CoD.MAX_PARAGON_RANK, rankBeforeMatch + 1 ), paragonIconId )
		local xpNeededToLevelUpStringRefValueModel = Engine.CreateModel( performanceTabStatsModel, "xpNeededToLevelUpStringRefValue" )
		Engine.SetModelValue( xpNeededToLevelUpStringRefValueModel, maxXP - rankXPBeforeMatch )
		if CoD.isFrontend and controller ~= 0 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats.xpNeededToLevelUpStringRefValue" ), maxXP - rankXPBeforeMatch )
		end
		local delayTimer = LUI.UITimer.new( 1000, "start_xp_bar_animation", true, self )
		self:registerEventHandler( "start_xp_bar_animation", function ()
			CoD.AARUtility.DoXPBarAnimationSequence( controller, self, rankXPBeforeMatch, rankBeforeMatch, currRank, currRankXP, isParagonRank, paragonIconId )
		end )
		self:addElement( delayTimer )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doAARXPBarAnimation" ), false )
	else
		local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( rankBeforeMatch, controller )
		local progressionAtStart = (rankXPBeforeMatch - minXP) / math.max( 1, maxXP - minXP )
		xpBar.XpBarCurrXPBg:setShaderVector( 0, progressionAtStart, 0, 0, 0 )
		xpBar.XpBarEarnedXPBg:setShaderVector( 0, progressionAtStart, 0, 0, 0 )
		CoD.AARUtility.SetCurrLevelModels( controller, rankBeforeMatch )
		CoD.AARUtility.SetNextLevelModels( controller, math.min( CoD.MAX_RANK, rankBeforeMatch + 1 ) )
		local xpNeededToLevelUpStringRefValueModel = Engine.CreateModel( performanceTabStatsModel, "xpNeededToLevelUpStringRefValue" )
		Engine.SetModelValue( xpNeededToLevelUpStringRefValueModel, maxXP - rankXPBeforeMatch )
		if CoD.isFrontend and controller ~= 0 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats.xpNeededToLevelUpStringRefValue" ), maxXP - rankXPBeforeMatch )
		end
		local delayTimer = LUI.UITimer.new( 1000, "start_xp_bar_animation", true, self )
		self:registerEventHandler( "start_xp_bar_animation", function ()
			CoD.AARUtility.DoXPBarAnimationSequence( controller, self, rankXPBeforeMatch, rankBeforeMatch, currRank, currRankXP, isParagonRank, paragonIconId )
		end )
		self:addElement( delayTimer )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doAARXPBarAnimation" ), false )
	end
end

