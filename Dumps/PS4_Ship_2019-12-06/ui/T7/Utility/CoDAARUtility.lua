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
CoD.AARUtility.SetCurrLevelModels = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "aarStats.performanceTabStats" ), "xpBarInfo" )
	local f1_local1 = Engine.CreateModel( f1_local0, "currLevel" )
	local f1_local2 = Engine.CreateModel( f1_local0, "currLevelIcon" )
	local f1_local3, f1_local4 = CoD.AARUtility.GetLevelAndLevelIconForRank( f1_arg1, CoD.AARUtility.GetCurrentPrestige( f1_arg0 ) )
	Engine.SetModelValue( f1_local1, f1_local3 )
	Engine.SetModelValue( f1_local2, f1_local4 )
end

CoD.AARUtility.SetNextLevelModels = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "aarStats.performanceTabStats" ), "xpBarInfo" )
	local f2_local1 = Engine.CreateModel( f2_local0, "nextLevel" )
	local f2_local2 = Engine.CreateModel( f2_local0, "nextLevelIcon" )
	local f2_local3, f2_local4 = CoD.AARUtility.GetLevelAndLevelIconForRank( f2_arg1, CoD.AARUtility.GetCurrentPrestige( f2_arg0 ) )
	Engine.SetModelValue( f2_local1, f2_local3 )
	Engine.SetModelValue( f2_local2, f2_local4 )
end

CoD.AARUtility.GetLevelAndLevelIconForRank = function ( f3_arg0, f3_arg1 )
	return Engine.TableLookup( 0, CoD.rankTable, CoD.AARUtility.RankIdCol, f3_arg0, CoD.AARUtility.RankDisplayLevelCol ), Engine.TableLookup( 0, CoD.rankIconTable, 0, f3_arg0, f3_arg1 + 1 )
end

CoD.AARUtility.GetCurrentPrestige = function ( f4_arg0 )
	local f4_local0 = CoD.GetPlayerStats( f4_arg0 )
	return f4_local0.PlayerStatsList.PLEVEL.StatValue:get()
end

CoD.AARUtility.GetMinMaxXPForRank = function ( f5_arg0, f5_arg1 )
	return tonumber( Engine.TableLookup( f5_arg1, CoD.rankTable, CoD.AARUtility.RankIdCol, f5_arg0, CoD.AARUtility.RankTableColMinXP ) ), tonumber( Engine.TableLookup( f5_arg1, CoD.rankTable, CoD.AARUtility.RankIdCol, f5_arg0, CoD.AARUtility.RankTableColMaxXP ) )
end

CoD.AARUtility.XPBarAnimTime = 1000
CoD.AARUtility.UseTestData = function ()
	local f6_local0 = Dvar.aar_test:exists()
	if f6_local0 then
		if Dvar.aar_test:get() ~= true and Dvar.aar_test:get() ~= "1" then
			f6_local0 = false
		else
			f6_local0 = true
		end
	end
	return f6_local0
end

CoD.AARUtility.TestMultiplePromotions = function ()
	local f7_local0 = Dvar.aar_multiple_promo:exists()
	if f7_local0 then
		if Dvar.aar_multiple_promo:get() ~= true and Dvar.aar_multiple_promo:get() ~= "1" then
			f7_local0 = false
		else
			f7_local0 = true
		end
	end
	return f7_local0
end

CoD.AARUtility.TestSinglePromotion = function ()
	local f8_local0 = Dvar.aar_single_promo:exists()
	if f8_local0 then
		if Dvar.aar_single_promo:get() ~= true and Dvar.aar_single_promo:get() ~= "1" then
			f8_local0 = false
		else
			f8_local0 = true
		end
	end
	return f8_local0
end

CoD.AARUtility.SetupUIModels = function ( f9_arg0 )
	local f9_local0 = CoD.AARUtility.UseTestData()
	local f9_local1, f9_local2 = nil
	if f9_local0 then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f9_arg0 ), "aarType" ), "public" )
	end
	if f9_local0 then
		f9_local1 = CoD.GetPlayerStats( f9_arg0 )
	else
		f9_local1 = CoD.GetPlayerStats( f9_arg0, CoD.STATS_LOCATION_STABLE )
	end
	local f9_local3 = CoD.GetPlayerStats( f9_arg0 )
	local f9_local4 = f9_local1.PlayerStatsList.RANKXP.StatValue:get()
	local f9_local5 = f9_local3.PlayerStatsList.RANK.StatValue:get()
	local f9_local6 = f9_local3.PlayerStatsList.PLEVEL.StatValue:get()
	local f9_local7 = f9_local3.PlayerStatsList.RANKXP.StatValue:get()
	local f9_local8 = CoD.PrestigeNext( f9_arg0 )
	local f9_local9 = CoD.AARUtility.GetXPEarnedDuringMatch( f9_local7, f9_local4 )
	local f9_local10 = f9_local3.AfterActionReportStats
	local f9_local11 = {}
	if f9_local8 then
		f9_local11.nextLevel = CoD.PrestigeNextLevelText( f9_arg0 )
		f9_local11.nextLevelIcon = Engine.TableLookup( f9_arg0, CoD.rankIconTable, 0, 0, f9_local6 + 2 )
	else
		f9_local11.nextLevel, f9_local11.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( f9_local5 + 1, f9_local6 + 1 )
	end
	if f9_local0 then
		f9_local2 = "tdm"
		f9_local11.kills = 24
		f9_local11.deaths = 26
		f9_local11.score = 2500
		f9_local11.gameTypeName = Engine.StructTableLookupString( "game_types", "name", f9_local2, "name_ref_caps" )
		f9_local11.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", f9_local2, "name_ref" )
		f9_local11.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", f9_local2, "image" )
		f9_local11.wins = 116
		f9_local11.losses = 90
		f9_local11.winLossRatio = 1.28
		f9_local11.lossesRingClockFrac = string.format( "%.2f", f9_local11.losses / math.max( 1, f9_local11.wins + f9_local11.losses ) )
		f9_local11.showBestScoreIcon = 1
		f9_local11.showBestKillsIcon = 1
		f9_local11.showBestSPMIcon = 1
		f9_local11.showBestKDRIcon = 1
	else
		f9_local2 = Engine.GetCurrentGameType()
		f9_local11.kills = f9_local10.kills:get()
		f9_local11.deaths = f9_local10.deaths:get()
		f9_local11.score = f9_local10.score:get()
		if f9_local2 and f9_local2 ~= "" then
			f9_local11.gameTypeName = Engine.StructTableLookupString( "game_types", "name", f9_local2, "name_ref_caps" )
			f9_local11.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", f9_local2, "name_ref" )
			f9_local11.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", f9_local2, "image" )
			f9_local11.wins = f9_local3.PlayerStatsByGameType[f9_local2].WINS.StatValue:get()
			f9_local11.losses = f9_local3.PlayerStatsByGameType[f9_local2].LOSSES.StatValue:get()
			f9_local11.winLossRatio = string.format( "%.2f", f9_local11.wins / math.max( 1, f9_local11.losses ) )
			f9_local11.lossesRingClockFrac = string.format( "%.2f", f9_local11.losses / math.max( 1, f9_local11.wins + f9_local11.losses ) )
		end
		f9_local11.showBestScoreIcon = 0
		f9_local11.showBestKillsIcon = 0
		f9_local11.showBestSPMIcon = 0
		f9_local11.showBestKDRIcon = 0
	end
	local f9_local12 = f9_local3.HighestStats.HIGHEST_SCORE:get()
	local f9_local13 = f9_local3.HighestStats.HIGHEST_KILLS:get()
	if f9_local12 <= f9_local11.score and f9_local12 ~= 0 then
		f9_local11.showBestScoreIcon = 1
	end
	if f9_local13 <= f9_local11.kills and f9_local13 ~= 0 then
		f9_local11.showBestKillsIcon = 1
	end
	local f9_local14 = (f9_local3.PlayerStatsList.SCORE.StatValue:get() - f9_local1.PlayerStatsList.SCORE.StatValue:get()) / math.max( 1, f9_local3.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() - f9_local1.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() )
	local f9_local15 = f9_local3.HighestStats.HIGHEST_SCORE_PER_MINUTE:get()
	if f9_local15 <= f9_local14 and f9_local15 ~= 0 then
		f9_local11.showBestSPMIcon = 1
	end
	local f9_local16 = f9_local11.kills / math.max( 1, f9_local11.deaths )
	local f9_local17 = f9_local3.HighestStats.HIGHEST_KDRATIO:get()
	if f9_local17 <= f9_local16 and f9_local17 ~= 0 then
		f9_local11.showBestKDRIcon = 1
	end
	f9_local11.xpEarnedDuringMatch = f9_local9
	local f9_local18 = Engine.CreateModel( Engine.GetModelForController( f9_arg0 ), "aarStats.performanceTabStats" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f9_arg0 ), "aarStats.xpScale" ), Engine.GetXPScale( f9_arg0 ) )
	for f9_local22, f9_local23 in pairs( f9_local11 ) do
		Engine.SetModelValue( Engine.CreateModel( f9_local18, f9_local22 ), f9_local23 )
	end
	CoD.AARUtility.CreateUIModelsForPerformanceGraphs( f9_arg0, f9_local18, f9_local2 )
end

local f0_local0 = function ( f10_arg0, f10_arg1 )
	local f10_local0 = 0
	for f10_local4, f10_local5 in ipairs( f10_arg0 ) do
		if f10_local5[f10_arg1] and f10_local0 < tonumber( f10_local5[f10_arg1] ) then
			f10_local0 = tonumber( f10_local5[f10_arg1] )
		end
	end
	return f10_local0
end

local f0_local1 = function ( f11_arg0, f11_arg1 )
	if not f11_arg0[1] then
		return 
	end
	local f11_local0 = tonumber( f11_arg0[1][f11_arg1] )
	for f11_local4, f11_local5 in ipairs( f11_arg0 ) do
		if f11_local5[f11_arg1] and tonumber( f11_local5[f11_arg1] ) < f11_local0 then
			f11_local0 = tonumber( f11_local5[f11_arg1] )
		end
	end
	return f11_local0
end

local f0_local2 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5 )
	local f12_local0 = CoD.AARUtility.UseTestData()
	if CoD.AARUtility.UseTestData() then
		for f12_local4, f12_local5 in ipairs( {
			0.3,
			0.8,
			0.5,
			0.7,
			0.1
		} ) do
			Engine.SetModelValue( Engine.CreateModel( f12_arg3, "graphValue" .. f12_local4 ), string.format( "%.2f", f12_local5 ) .. " 0 0 0" )
		end
	else
		for f12_local3, f12_local4 in ipairs( f12_arg0 ) do
			local f12_local5 = f12_local4[f12_arg1]
			local f12_local7 = 0
			if f12_arg2 <= f12_local5 then
				f12_local7 = 0.5 - (f12_local5 - f12_arg2) / math.max( 1, f12_arg4 - f12_arg2 ) / 2
			else
				f12_local7 = 0.5 + (f12_arg2 - f12_local5) / math.max( 1, f12_arg2 - f12_arg5 ) / 2
			end
			Engine.SetModelValue( Engine.CreateModel( f12_arg3, "graphValue" .. f12_local3 ), string.format( "%.2f", f12_local7 ) .. " 0 0 0" )
		end
	end
end

CoD.AARUtility.CreateUIModelsForPerformanceGraphs = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = CoD.AARUtility.UseTestData()
	local f13_local1 = {}
	local f13_local2 = 5
	local f13_local3 = 10
	local f13_local4 = Engine.GetPlayerStats( f13_arg0 )
	local f13_local5 = f13_local4.PlayerStatsByGameType[f13_arg2].prevScores
	local f13_local6 = f13_local4.PlayerStatsByGameType[f13_arg2].prevScoreIndex:get()
	if f13_local6 < 0 or f13_local3 < f13_local6 then
		f13_local6 = 0
	end
	local f13_local7 = f13_local4.PlayerStatsByGameType[f13_arg2].SCORE.StatValue:get()
	local f13_local8 = f13_local4.PlayerStatsByGameType[f13_arg2].TIME_PLAYED_TOTAL.StatValue:get()
	local f13_local9 = f13_local4.PlayerStatsByGameType[f13_arg2].KILLS.StatValue:get()
	local f13_local10 = f13_local4.PlayerStatsByGameType[f13_arg2].DEATHS.StatValue:get()
	local f13_local11 = math.ceil( f13_local4.PlayerStatsList.SCORE.StatValue:get() / math.max( 1, f13_local4.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() / 60 ) )
	local f13_local12 = string.format( "%.2f", f13_local4.PlayerStatsList.KILLS.StatValue:get() / math.max( 1, f13_local4.PlayerStatsList.DEATHS.StatValue:get() ) )
	local f13_local13, f13_local14 = nil
	if f13_local0 then
		f13_local13 = 195
		f13_local14 = 0.95
		f13_local11 = 420
		f13_local12 = 1.25
		local f13_local15 = {
			180,
			202,
			175,
			208,
			201
		}
		local f13_local16 = {
			1.5,
			0.87,
			1.2,
			1.65,
			0.65
		}
		for f13_local17 = 1, f13_local2, 1 do
			table.insert( f13_local1, {
				spm = f13_local15[f13_local17],
				kdr = f13_local16[f13_local17],
				valid = 1
			} )
		end
	else
		for f13_local15 = 1, f13_local2, 1 do
			local f13_local18 = f13_local15
			local f13_local19 = {}
			local f13_local20 = f13_local5[f13_local6].score:get()
			local f13_local21 = f13_local5[f13_local6].timePlayed:get()
			local f13_local22 = f13_local5[f13_local6].kills:get()
			local f13_local23 = f13_local5[f13_local6].deaths:get()
			f13_local19.spm = math.floor( f13_local20 / math.max( 1, f13_local21 / 60 ) )
			f13_local19.kdr = string.format( "%.2f", f13_local22 / math.max( 1, f13_local23 ) )
			f13_local19.valid = f13_local5[f13_local6].valid:get()
			table.insert( f13_local1, f13_local19 )
			f13_local6 = f13_local6 - 1
			if f13_local6 < 0 then
				f13_local6 = f13_local3 - 1
			end
		end
	end
	local f13_local15 = Engine.CreateModel( f13_arg1, "spmGraph" )
	local f13_local16 = Engine.CreateModel( f13_arg1, "kdrGraph" )
	local f13_local17 = 0
	local f13_local18 = 0
	local f13_local19 = 0
	for f13_local23, f13_local24 in ipairs( f13_local1 ) do
		Engine.SetModelValue( Engine.CreateModel( f13_local15, "value" .. f13_local23 ), f13_local24.spm )
		Engine.SetModelValue( Engine.CreateModel( f13_local15, "value" .. f13_local23 .. "Valid" ), f13_local24.valid )
		Engine.SetModelValue( Engine.CreateModel( f13_local16, "value" .. f13_local23 ), string.format( "%.2f", f13_local24.kdr ) )
		Engine.SetModelValue( Engine.CreateModel( f13_local16, "value" .. f13_local23 .. "Valid" ), f13_local24.valid )
		if f13_local24.valid then
			f13_local19 = f13_local19 + 1
			f13_local17 = f13_local17 + f13_local24.spm
			f13_local18 = f13_local18 + f13_local24.kdr
		end
	end
	if f13_local19 == 0 then
		local f13_local25 = "0.00"
	end
	f13_local14 = f13_local25 or string.format( "%.2f", f13_local18 / f13_local19 )
	if f13_local19 == 0 then
		local f13_local26 = "0"
	end
	f13_local13 = f13_local26 or math.ceil( f13_local17 / f13_local19 )
	Engine.SetModelValue( Engine.CreateModel( f13_local15, "avgSPM" ), f13_local13 )
	Engine.SetModelValue( Engine.CreateModel( f13_local16, "avgKDR" ), f13_local14 )
	Engine.SetModelValue( Engine.CreateModel( f13_arg1, "globalSPM" ), f13_local11 )
	Engine.SetModelValue( Engine.CreateModel( f13_arg1, "globalKDR" ), f13_local12 )
	f13_local20 = f13_local13 + 200
	if f13_local20 < f0_local0( f13_local1, "spm" ) then
		f13_local20 = f0_local0( f13_local1, "spm" ) + 50
	end
	f13_local21 = math.max( f13_local13 - 100, 0 )
	if f0_local1( f13_local1, "spm" ) < f13_local21 then
		f13_local21 = f0_local1( f13_local1, "spm" )
	end
	f13_local22 = f13_local14 + 1.5
	if f13_local22 < f0_local0( f13_local1, "kdr" ) then
		f13_local22 = f0_local0( f13_local1, "kdr" ) + 0.75
	end
	f13_local23 = math.max( f13_local14 - 0.5, 0 )
	if f0_local1( f13_local1, "kdr" ) < f13_local23 then
		f13_local23 = f0_local1( f13_local1, "kdr" )
	end
	f0_local2( f13_local1, "spm", f13_local13, f13_local15, f13_local20, f13_local21 )
	f0_local2( f13_local1, "kdr", f13_local14, f13_local16, f13_local22, f13_local23 )
end

CoD.AARUtility.GetXPEarnedDuringMatch = function ( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg0 - f14_arg1
	if f14_local0 < 0 then
		f14_local0 = 0
	end
	return f14_local0
end

local f0_local3 = function ( f15_arg0, f15_arg1 )
	for f15_local3, f15_local4 in pairs( f15_arg1 ) do
		if Engine.GetItemUnlockLevel( f15_local4.itemIndex ) == f15_arg0 then
			return true
		end
	end
end

local f0_local4 = function ( f16_arg0 )
	local f16_local0 = Engine.GetLoadoutSlotForItem( f16_arg0 )
	if f16_local0 == "primary" or f16_local0 == "secondary" then
		return Engine.GetItemGroup( f16_arg0, Enum.eModes.MODE_MULTIPLAYER )
	else
		return f16_local0
	end
end

local f0_local5 = function ( f17_arg0 )
	if LUI.startswith( Engine.GetItemRef( f17_arg0 ), "gadget_" ) then
		return true
	else
		
	end
end

local f0_local6 = function ( f18_arg0 )
	if LUI.startswith( Engine.GetItemRef( f18_arg0 ), "hero_" ) then
		return true
	else
		
	end
end

local f0_local7 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
	local f19_local0 = Engine.CreateModel( f19_arg0, "reward" .. f19_arg1 .. "Info" )
	Engine.SetModelValue( Engine.CreateModel( f19_arg0, "reward" .. f19_arg1 .. "InfoVisible" ), 1 )
	Engine.SetModelValue( Engine.CreateModel( f19_local0, "rewardName" ), f19_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f19_local0, "rewardImage" ), f19_arg3 )
	Engine.SetModelValue( Engine.CreateModel( f19_local0, "rewardDesc" ), f19_arg4 )
	return f19_local0
end

CoD.AARUtility.CreateModelsForRewards = function ( f20_arg0 )
	local f20_local0, f20_local1 = nil
	f20_local1 = CoD.GetPlayerStats( f20_arg0 )
	if CoD.AARUtility.UseTestData() then
		f20_local0 = CoD.GetPlayerStats( f20_arg0 )
	else
		f20_local0 = CoD.GetPlayerStats( f20_arg0, CoD.STATS_LOCATION_STABLE )
	end
	local f20_local2 = Engine.CreateModel( Engine.GetModelForController( f20_arg0 ), "aarRewards" )
	local f20_local3 = 0
	local f20_local4 = Engine.GetRecentlyUnlockedItems( f20_arg0 )
	local f20_local5 = f20_local0.PlayerStatsList.RANK.StatValue:get()
	local f20_local6 = f20_local1.PlayerStatsList.RANK.StatValue:get()
	local f20_local7 = f20_local1.PlayerStatsList.PLEVEL.StatValue:get()
	local f20_local8 = 4
	for f20_local9 = f20_local5, f20_local6, 1 do
		if f0_local3( f20_local9, f20_local4 ) then
			f20_local3 = f20_local3 + 1
			local f20_local12 = Engine.CreateModel( f20_local2, "rewardsCarouselItem" .. f20_local3 )
			local f20_local13 = 0
			for f20_local14 = 1, f20_local8, 1 do
				Engine.SetModelValue( Engine.CreateModel( f20_local12, "reward" .. f20_local14 .. "InfoVisible" ), 0 )
			end
			local f20_local14, f20_local15 = CoD.AARUtility.GetLevelAndLevelIconForRank( f20_local9, f20_local7 )
			local f20_local16 = Engine.GetRankName( f20_local9 )
			Engine.SetModelValue( Engine.CreateModel( f20_local12, "rewardCarouselItemImage" ), f20_local15 .. "_lrg" )
			Engine.SetModelValue( Engine.CreateModel( f20_local12, "rewardCarouselItemTitle" ), f20_local16 )
			Engine.SetModelValue( Engine.CreateModel( f20_local12, "rewardCarouselItemSubTitle" ), Engine.Localize( "MPUI_LEVEL_N", f20_local14 ) )
			Engine.SetModelValue( Engine.CreateModel( f20_local12, "rewardCarouselItemType" ), "rankup" )
			for f20_local27, f20_local28 in pairs( f20_local4 ) do
				if Engine.GetItemUnlockLevel( f20_local28.itemIndex ) == f20_local9 and f20_local13 < f20_local8 and not f0_local5( f20_local28.itemIndex ) then
					f20_local13 = f20_local13 + 1
					if f0_local6( f20_local28.itemIndex ) then
						local f20_local20 = Engine.CurrentSessionMode()
						for f20_local24, f20_local25 in ipairs( Engine.GetHeroList( f20_local20 ) ) do
							local f20_local26 = Engine.GetLoadoutInfoForHero( f20_local20, f20_local25.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
							if f20_local28.itemIndex == f20_local26.itemIndex then
								f0_local7( f20_local12, f20_local13, Engine.Localize( f20_local25.displayName ), f20_local25.defaultHeroRender, "" )
							end
						end
					end
					f0_local7( f20_local12, f20_local13, Engine.GetItemName( f20_local28.itemIndex ), Engine.GetItemImage( f20_local28.itemIndex ) .. "_rwd", "MPUI_" .. f0_local4( f20_local28.itemIndex ) )
				end
			end
			f0_local7( f20_local12, f20_local13 + 1, "MPUI_UNLOCK_TOKEN", "t7_hud_mp_token_reward", "" )
		end
	end
	local f20_local9 = {}
	local f20_local10 = Engine.GetNumBulletWeapons()
	if f20_local10 ~= nil then
		for f20_local11 = 0, f20_local10 - 1, 1 do
			if Engine.HasRecentItemAttachmentsUnlocked( f20_arg0, f20_local11 ) then
				local f20_local14 = Engine.GetNumItemAttachmentsWithAttachPoint( f20_local11, 0 )
				local f20_local15 = {}
				for f20_local16 = 1, f20_local14 - 1, 1 do
					if Engine.IsItemAttachmentRecentlyUnlocked( f20_arg0, f20_local11, f20_local16 ) then
						local f20_local27 = Engine.GetItemAttachment( f20_local11, f20_local16 )
						local f20_local28 = tonumber( Engine.TableLookup( f20_arg0, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( f20_local11 ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( f20_local27 ), CoD.AARUtility.GunRankCol ) )
						local f20_local20 = tonumber( Engine.TableLookup( f20_arg0, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( f20_local11 ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( f20_local27 ), CoD.AARUtility.GunRankXPCol ) )
						if f20_local28 and f20_local20 then
							table.insert( f20_local15, {
								itemIndex = f20_local11,
								attachmentIndex = f20_local27,
								unlockLevel = f20_local28 + 2,
								xp = f20_local20
							} )
						end
					end
				end
				table.sort( f20_local15, function ( f21_arg0, f21_arg1 )
					return f21_arg0.unlockLevel < f21_arg1.unlockLevel
				end )
				for f20_local19, f20_local27 in pairs( f20_local15 ) do
					f20_local3 = f20_local3 + 1
					local f20_local28 = Engine.CreateModel( f20_local2, "rewardsCarouselItem" .. f20_local3 )
					for f20_local20 = 1, f20_local8, 1 do
						Engine.SetModelValue( Engine.CreateModel( f20_local28, "reward" .. f20_local20 .. "InfoVisible" ), 0 )
					end
					Engine.SetModelValue( Engine.CreateModel( f20_local28, "rewardCarouselItemImage" ), Engine.GetItemImage( f20_local27.itemIndex ) .. "_pu" )
					Engine.SetModelValue( Engine.CreateModel( f20_local28, "rewardCarouselItemTitle" ), Engine.GetItemName( f20_local27.itemIndex ) )
					Engine.SetModelValue( Engine.CreateModel( f20_local28, "rewardCarouselItemType" ), "weaponRankup" )
					Engine.SetModelValue( Engine.CreateModel( f20_local28, "rewardCarouselItemSubTitle" ), Engine.Localize( "MPUI_LEVEL_N", f20_local27.unlockLevel ) )
					f0_local7( f20_local28, 1, Engine.GetAttachmentNameByIndex( f20_local27.attachmentIndex ), Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, f20_local27.itemIndex, f20_local27.attachmentIndex ) .. "_rwd", "" )
					f0_local7( f20_local28, 2, Engine.Localize( "RANK_XP", f20_local27.xp ), "t7_hud_mp_notifications_xp_blue", "" )
				end
			end
		end
	end
	Engine.SetModelValue( Engine.CreateModel( f20_local2, "rewardsCarouselItemCount" ), f20_local3 )
end

CoD.AARUtility.GetRewardItemCount = function ( f22_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f22_arg0.controller ), "aarRewards.rewardsCarouselItemCount" ) )
end

CoD.AARUtility.GetModelForRewardItemByIndex = function ( f23_arg0, f23_arg1 )
	return Engine.GetModel( Engine.GetModelForController( f23_arg0 ), "aarRewards.rewardsCarouselItem" .. f23_arg1 )
end

CoD.AARUtility.AnyRewardsEarnedDuringMatch = function ( f24_arg0 )
	CoD.AARUtility.CreateModelsForRewards( f24_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f24_arg0 ), "aarRewards.rewardsCarouselItemCount" ) ) > 0
end

local f0_local8 = CoD.AARUtility
local f0_local9 = function ( f25_arg0, f25_arg1 )
	if f25_arg0.row and f25_arg1.row then
		local f25_local0 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f25_arg0.row, CoD.AARUtility.medalSortkeyCol )
		local f25_local1 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f25_arg1.row, CoD.AARUtility.medalSortkeyCol )
		if f25_local0 and f25_local1 then
			local f25_local2 = tonumber( f25_local0 )
			local f25_local3 = tonumber( f25_local1 )
			if f25_local2 == f25_local3 then
				return f25_arg0.value < f25_arg1.value
			else
				return f25_local2 < f25_local3
			end
		end
	end
	return true
end

f0_local8.SortMedals = f0_local9
f0_local8 = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4, f26_arg5 )
	local f26_local0 = CoD.AARUtility.XPBarAnimTime
	local f26_local1 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f26_arg0 ), "aarStats.performanceTabStats" ), "xpNeededToLevelUpStringRefValue" )
	local self = LUI.UITimer.new( 5, "count_down", false, f26_arg1 )
	self.currentValue = f26_arg3
	self.minValue = f26_arg4
	f26_arg1.xpNumberTimer = self
	local f26_local3 = 0
	f26_arg1:registerEventHandler( "count_down", function ( element, event )
		f26_local3 = f26_local3 + event.timeElapsed
		self.currentValue = math.floor( f26_arg3 - f26_local3 / f26_local0 * f26_arg3 )
		if self.currentValue < self.minValue or f26_local0 < f26_local3 then
			self.currentValue = self.minValue
			self:close()
			if f26_arg5 then
				f26_arg5()
			end
		end
		Engine.SetModelValue( f26_local1, self.currentValue )
	end )
	f26_arg1:addElement( f26_arg1.xpNumberTimer )
end

f0_local9 = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3, f28_arg4, f28_arg5 )
	local f28_local0 = CoD.AARUtility.XPBarAnimTime
	local f28_local1 = f28_arg1.XpBarContainer.XpBar
	local f28_local2, f28_local3 = CoD.AARUtility.GetMinMaxXPForRank( f28_arg3, f28_arg0 )
	local f28_local4 = (f28_arg2 - f28_local2) / math.max( 1, f28_local3 - f28_local2 )
	local f28_local5 = 1
	local f28_local6 = 0
	local f28_local7 = 0
	if f28_arg3 == f28_arg4 then
		f28_local5 = (f28_arg5 - f28_local2) / math.max( 1, f28_local3 - f28_local2 )
		f28_local6 = f28_local3 - f28_arg5
	end
	f28_local1.XpBarCurrXPBg:setShaderVector( 0, f28_local4, 0, 0, 0 )
	f28_local1.XpBarEarnedXPBg:setShaderVector( 0, f28_local4, 0, 0, 0 )
	f28_local1.XpBarEarnedXPBg:beginAnimation( "animate_bar", f28_local0, true, true )
	f28_local1.XpBarEarnedXPBg:setShaderVector( 0, f28_local5, 0, 0, 0 )
	Engine.PlaySound( "uin_aar_bar_fill_main" )
	f0_local8( f28_arg0, f28_arg1, f28_local1, f28_local3 - f28_arg2, f28_local6, function ()
		Engine.PlaySound( "uin_aar_bar_fill_tail" )
		if f28_arg4 <= f28_arg3 then
			if Engine.IsCampaignGame() then
				CoD.AARUtilityCP.hasSeenXPBarAnim = true
			end
			return 
		else
			f28_arg1.XpBarContainer:playClip( "Update" )
			f28_arg1.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
				local f30_local0 = math.min( CoD.MAX_RANK, f28_arg3 + 1 )
				local f30_local1, f30_local2 = CoD.AARUtility.GetMinMaxXPForRank( f30_local0, f28_arg0 )
				CoD.AARUtility.SetCurrLevelModels( f28_arg0, f30_local0 )
				CoD.AARUtility.SetNextLevelModels( f28_arg0, math.min( CoD.MAX_RANK, f30_local0 + 1 ) )
				f28_local1.XpBarCurrXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				f28_local1.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				if IsCampaign() and f30_local0 == CoD.MAX_RANK then
					f28_arg1.XpBarContainer:playClip( "FlashLastLevel" )
				else
					f28_arg1.XpBarContainer:playClip( "FlashNextLevel" )
				end
				f28_arg1.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
					f0_local9( f28_arg0, f28_arg1, f30_local1, f30_local0, f28_arg4, f28_arg5 )
				end )
			end )
		end
	end )
end

CoD.AARUtility.DoXPBarAnimation = function ( f32_arg0, f32_arg1 )
	local f32_local0 = CoD.AARUtility.UseTestData()
	if Engine.IsCampaignGame() then
		f32_local0 = CoD.AARUtilityCP.UseTestData()
	end
	local f32_local1 = CoD.AARUtility.TestSinglePromotion()
	local f32_local2 = CoD.AARUtility.TestMultiplePromotions()
	local f32_local3, f32_local4, f32_local5, f32_local6 = nil
	if not f32_local0 then
		local f32_local7 = CoD.GetPlayerStats( f32_arg1, CoD.STATS_LOCATION_STABLE )
		if Engine.IsCampaignGame() then
			local f32_local8 = CoD.GetPlayerStats( f32_arg1 )
			f32_local3 = CoD.AARUtilityCP.GetRankForRankXP( f32_arg1, f32_local8.currentRankXP:get() )
			f32_local6 = f32_local8.PlayerStatsList.RANK.StatValue:get()
			f32_local5 = f32_local8.PlayerStatsList.RANKXP.StatValue:get()
		else
			f32_local3 = f32_local7.PlayerStatsList.RANK.StatValue:get()
			f32_local4 = f32_local7.PlayerStatsList.RANKXP.StatValue:get()
			local f32_local8 = CoD.GetPlayerStats( f32_arg1 )
			f32_local6 = f32_local8.PlayerStatsList.RANK.StatValue:get()
			f32_local5 = f32_local8.PlayerStatsList.RANKXP.StatValue:get()
		end
	end
	local f32_local7 = Engine.GetModel( Engine.GetModelForController( f32_arg1 ), "aarStats.performanceTabStats" )
	local f32_local8 = f32_arg0.XpBarContainer.XpBar
	if f32_local0 then
		if f32_local2 then
			f32_local3 = 4
			f32_local4 = 20250
			f32_local5 = 35500
			f32_local6 = 6
		elseif f32_local1 then
			f32_local3 = 5
			f32_local4 = 28500
			f32_local5 = 35500
			f32_local6 = 6
		else
			f32_local3 = 5
			f32_local4 = 28500
			f32_local5 = 31500
			f32_local6 = 5
		end
		Engine.SetModelValue( Engine.CreateModel( f32_local7, "xpEarnedDuringMatch" ), f32_local5 - f32_local4 )
	end
	if not Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f32_arg1 ), "doAARXPBarAnimation" ) ) then
		CoD.AARUtility.SetCurrLevelModels( f32_arg1, f32_local6 )
		local f32_local9 = f32_local6 + 1
		if CoD.MAX_RANK < f32_local9 then
			f32_local9 = f32_local6
		end
		if IsCampaign() and f32_local9 == f32_local6 then
			f32_local8.XpBarCurrXPBg:setShaderVector( 0, 0, 0, 0, 0 )
			f32_local8.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
			f32_arg0.XpBarContainer.RankIconAndNumberWidgetNextTop:setAlpha( 0 )
			f32_arg0.XpBarContainer.RankIconAndNumberWidgetNextBase:setAlpha( 0 )
			f32_arg0.XpBarContainer.NextLevelDisplay:setAlpha( 0 )
			f32_arg0.XpBarContainer.XpBar:setAlpha( 0 )
			f32_arg0.XpBarContainer.cacButtonBoxLrgInactiveStroke0:setAlpha( 0 )
			f32_arg0.XpBarContainer.MeterGlow:setAlpha( 0 )
			f32_arg0.XpBarContainer.XPEarnedDisplay:setAlpha( 0 )
		else
			CoD.AARUtility.SetNextLevelModels( f32_arg1, f32_local9 )
			local f32_local10, f32_local11 = CoD.AARUtility.GetMinMaxXPForRank( f32_local6, f32_arg1 )
			f32_local8.XpBarCurrXPBg:setShaderVector( 0, (f32_local5 - f32_local10) / math.max( 1, f32_local11 - f32_local10 ), 0, 0, 0 )
			f32_local8.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
		end
	else
		local f32_local9, f32_local10 = CoD.AARUtility.GetMinMaxXPForRank( f32_local3, f32_arg1 )
		local f32_local11 = (f32_local4 - f32_local9) / math.max( 1, f32_local10 - f32_local9 )
		f32_local8.XpBarCurrXPBg:setShaderVector( 0, f32_local11, 0, 0, 0 )
		f32_local8.XpBarEarnedXPBg:setShaderVector( 0, f32_local11, 0, 0, 0 )
		CoD.AARUtility.SetCurrLevelModels( f32_arg1, f32_local3 )
		CoD.AARUtility.SetNextLevelModels( f32_arg1, math.min( CoD.MAX_RANK, f32_local3 + 1 ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local7, "xpNeededToLevelUpStringRefValue" ), f32_local10 - f32_local4 )
		local self = LUI.UITimer.new( 1000, "start_xp_bar_animation", true, f32_arg0 )
		f32_arg0:registerEventHandler( "start_xp_bar_animation", function ()
			f0_local9( f32_arg1, f32_arg0, f32_local4, f32_local3, f32_local6, f32_local5 )
		end )
		f32_arg0:addElement( self )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f32_arg1 ), "doAARXPBarAnimation" ), false )
	end
end

