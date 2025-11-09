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

CoD.AARUtility.SetNextLevelModels = function ( controller, rank )
	local performanceTabStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	local xpBarInfoModel = Engine.CreateModel( performanceTabStatsModel, "xpBarInfo" )
	local nextLevelModel = Engine.CreateModel( xpBarInfoModel, "nextLevel" )
	local nextLevelIconModel = Engine.CreateModel( xpBarInfoModel, "nextLevelIcon" )
	local level, levelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( rank, CoD.AARUtility.GetCurrentPrestige( controller ) )
	Engine.SetModelValue( nextLevelModel, level )
	Engine.SetModelValue( nextLevelIconModel, levelIcon )
end

CoD.AARUtility.GetLevelAndLevelIconForRank = function ( rank, prestige )
	local level = Engine.TableLookup( 0, CoD.rankTable, CoD.AARUtility.RankIdCol, rank, CoD.AARUtility.RankDisplayLevelCol )
	local levelIcon = Engine.TableLookup( 0, CoD.rankIconTable, 0, rank, prestige + 1 )
	return level, levelIcon
end

CoD.AARUtility.GetCurrentPrestige = function ( controller )
	local f4_local0 = CoD.GetPlayerStats( controller )
	return f4_local0.PlayerStatsList.PLEVEL.StatValue:get()
end

CoD.AARUtility.GetMinMaxXPForRank = function ( rank, controller )
	local minXP = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.AARUtility.RankIdCol, rank, CoD.AARUtility.RankTableColMinXP ) )
	local maxXP = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.AARUtility.RankIdCol, rank, CoD.AARUtility.RankTableColMaxXP ) )
	return minXP, maxXP
end

CoD.AARUtility.XPBarAnimTime = 1000
CoD.AARUtility.UseTestData = function ()
	local f6_local0
	if Dvar.aar_test:get() ~= true and Dvar.aar_test:get() ~= "1" then
		f6_local0 = false
	else
		f6_local0 = true
	end
	return f6_local0
end

CoD.AARUtility.TestMultiplePromotions = function ()
	local f7_local0
	if Dvar.aar_multiple_promo:get() ~= true and Dvar.aar_multiple_promo:get() ~= "1" then
		f7_local0 = false
	else
		f7_local0 = true
	end
	return f7_local0
end

CoD.AARUtility.TestSinglePromotion = function ()
	local f8_local0
	if Dvar.aar_single_promo:get() ~= true and Dvar.aar_single_promo:get() ~= "1" then
		f8_local0 = false
	else
		f8_local0 = true
	end
	return f8_local0
end

CoD.AARUtility.SetupUIModels = function ( controller )
	local useTestData = CoD.AARUtility.UseTestData()
	local statsBeforeMatch, gameType = nil
	if useTestData then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "aarType" ), "public" )
	end
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
	local aarStats = currentStats.AfterActionReportStats
	local stats = {}
	if prestigeNext then
		stats.nextLevel = CoD.PrestigeNextLevelText( controller )
		stats.nextLevelIcon = Engine.TableLookup( controller, CoD.rankIconTable, 0, 0, currPrestige + 2 )
	else
		stats.nextLevel, stats.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank + 1, currPrestige + 1 )
	end
	if useTestData then
		gameType = "tdm"
		stats.kills = 24
		stats.deaths = 26
		stats.score = 2500
		stats.gameTypeName = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref_caps" )
		stats.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref" )
		stats.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", gameType, "loading_screen_image" )
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
		stats.kills = aarStats.kills:get()
		stats.deaths = aarStats.deaths:get()
		stats.score = aarStats.score:get()
		if gameType and gameType ~= "" then
			stats.gameTypeName = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref_caps" )
			stats.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref" )
			stats.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", gameType, "loading_screen_image" )
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
			local f12_local4 = 0
			if averageValue <= currSPM then
				f12_local4 = 0.5 - (currSPM - averageValue) / math.max( 1, upperBound - averageValue ) / 2
			else
				f12_local4 = 0.5 + (1 - (currSPM - lowerBound) / math.max( 1, averageValue - lowerBound )) / 2
			end
			Engine.SetModelValue( Engine.CreateModel( model, "graphValue" .. index ), string.format( "%.2f", f12_local4 ) .. " 0 0 0" )
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
			local f13_local0 = index
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
	for index, data in ipairs( graphData ) do
		Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "value" .. index ), data.spm )
		Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "value" .. index .. "Valid" ), data.valid )
		Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "value" .. index ), string.format( "%.2f", data.kdr ) )
		Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "value" .. index .. "Valid" ), data.valid )
	end
	Engine.SetModelValue( Engine.CreateModel( spmGraphModel, "avgSPM" ), averageSPM )
	Engine.SetModelValue( Engine.CreateModel( kdrGraphModel, "avgKDR" ), string.format( "%.2f", averageKDR ) )
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

local AnyItemsUnlockedForRank = function ( rank, recentlyUnlockedItems )
	for key, itemTable in pairs( recentlyUnlockedItems ) do
		if Engine.GetItemUnlockLevel( itemTable.itemIndex ) == rank then
			return true
		end
	end
end

local GetBlueprintStringPrefixForItem = function ( itemIndex )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
	if loadoutSlot == "primary" or loadoutSlot == "secondary" then
		return Engine.GetItemGroup( itemIndex, Enum.eModes.MODE_MULTIPLAYER )
	else
		return loadoutSlot
	end
end

local IsHeroAbility = function ( itemIndex )
	local itemRef = Engine.GetItemRef( itemIndex )
	if LUI.startswith( itemRef, "gadget_" ) then
		return true
	else
		
	end
end

local IsHeroWeapon = function ( itemIndex )
	local itemRef = Engine.GetItemRef( itemIndex )
	if LUI.startswith( itemRef, "hero_" ) then
		return true
	else
		
	end
end

local CreateRewardInfoModel = function ( rewardsCarouselItemModel, rewardInfoNum, rewardName, rewardImage, rewardDesc )
	local rewardInfoModel = Engine.CreateModel( rewardsCarouselItemModel, "reward" .. rewardInfoNum .. "Info" )
	Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "reward" .. rewardInfoNum .. "InfoVisible" ), 1 )
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "rewardName" ), rewardName )
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "rewardImage" ), rewardImage )
	Engine.SetModelValue( Engine.CreateModel( rewardInfoModel, "rewardDesc" ), rewardDesc )
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
	local maxRewardItemsPerCarouselItem = 4
	for rank = rankBeforeMatch, currRank, 1 do
		if AnyItemsUnlockedForRank( rank, recentlyUnlockedItems ) then
			rewardsCarouselItemCount = rewardsCarouselItemCount + 1
			local rewardsCarouselItemModel = Engine.CreateModel( aarRewardsModel, "rewardsCarouselItem" .. rewardsCarouselItemCount )
			local currRankRewardCount = 0
			for i = 1, maxRewardItemsPerCarouselItem, 1 do
				Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "reward" .. i .. "InfoVisible" ), 0 )
			end
			local level, f20_local2 = CoD.AARUtility.GetLevelAndLevelIconForRank( rank, currPrestige )
			local levelName = Engine.GetRankName( rank )
			Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemImage" ), f20_local2 .. "_lrg" )
			Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemTitle" ), levelName )
			Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemSubTitle" ), Engine.Localize( "MPUI_LEVEL_N", level ) )
			Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemType" ), "rankup" )
			for key, itemTable in pairs( recentlyUnlockedItems ) do
				if Engine.GetItemUnlockLevel( itemTable.itemIndex ) == rank and currRankRewardCount < maxRewardItemsPerCarouselItem and not IsHeroAbility( itemTable.itemIndex ) then
					currRankRewardCount = currRankRewardCount + 1
					if IsHeroWeapon( itemTable.itemIndex ) then
						local currentSessionMode = Engine.CurrentSessionMode()
						local heroTable = Engine.GetHeroList( currentSessionMode )
						for index, heroInfoTable in ipairs( heroTable ) do
							local loadoutSlotInfo = Engine.GetLoadoutInfoForHero( currentSessionMode, heroInfoTable.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
							if itemTable.itemIndex == loadoutSlotInfo.itemIndex then
								CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount, Engine.Localize( heroInfoTable.displayName ), heroInfoTable.defaultHeroRender, "" )
							end
						end
					end
					CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount, Engine.GetItemName( itemTable.itemIndex ), Engine.GetItemImage( itemTable.itemIndex ) .. "_rwd", "MPUI_" .. GetBlueprintStringPrefixForItem( itemTable.itemIndex ) )
				end
			end
			CreateRewardInfoModel( rewardsCarouselItemModel, currRankRewardCount + 1, "MPUI_UNLOCK_TOKEN", "t7_hud_mp_token_reward", "" )
		end
	end
	local unlockedAttachmentInfo = {}
	local numBulletWeapons = Engine.GetNumBulletWeapons()
	if numBulletWeapons ~= nil then
		for itemIndex = 0, numBulletWeapons - 1, 1 do
			if Engine.HasRecentItemAttachmentsUnlocked( controller, itemIndex ) then
				local numAttachments = Engine.GetNumItemAttachmentsWithAttachPoint( itemIndex, 0 )
				local unlockedAttachmentInfo = {}
				for attachmentNum = 1, numAttachments - 1, 1 do
					if Engine.IsItemAttachmentRecentlyUnlocked( controller, itemIndex, attachmentNum ) then
						local attachmentIndex = Engine.GetItemAttachment( itemIndex, attachmentNum )
						local levelForThisAttachment = tonumber( Engine.TableLookup( controller, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( itemIndex ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( attachmentIndex ), CoD.AARUtility.GunRankCol ) )
						local xpForThisAttachment = tonumber( Engine.TableLookup( controller, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( itemIndex ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( attachmentIndex ), CoD.AARUtility.GunRankXPCol ) )
						if levelForThisAttachment and xpForThisAttachment then
							table.insert( unlockedAttachmentInfo, {
								itemIndex = itemIndex,
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
					rewardsCarouselItemCount = rewardsCarouselItemCount + 1
					local rewardsCarouselItemModel = Engine.CreateModel( aarRewardsModel, "rewardsCarouselItem" .. rewardsCarouselItemCount )
					for f20_local12 = 1, maxRewardItemsPerCarouselItem, 1 do
						Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "reward" .. f20_local12 .. "InfoVisible" ), 0 )
					end
					Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemImage" ), Engine.GetItemImage( info.itemIndex ) .. "_pu" )
					Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemTitle" ), Engine.GetItemName( info.itemIndex ) )
					Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemType" ), "weaponRankup" )
					Engine.SetModelValue( Engine.CreateModel( rewardsCarouselItemModel, "rewardCarouselItemSubTitle" ), Engine.Localize( "MPUI_LEVEL_N", info.unlockLevel ) )
					CreateRewardInfoModel( rewardsCarouselItemModel, 1, Engine.GetAttachmentNameByIndex( info.attachmentIndex ), Engine.GetAttachmentImageByIndex( info.attachmentIndex ), "" )
					CreateRewardInfoModel( rewardsCarouselItemModel, 2, Engine.Localize( "RANK_XP", info.xp ), "t7_hud_mp_notifications_xp_blue", "" )
				end
			end
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
	CoD.AARUtility.CreateModelsForRewards( controller )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards.rewardsCarouselItemCount" ) ) > 0
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

