-- 69275489f7bdf4d98425754ff2f732fb
-- This hash is used for caching, delete to decompile the file again

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
CoD.AARUtility.SetCurrLevelModels = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "aarStats.performanceTabStats" ), "xpBarInfo" )
	local f1_local1 = Engine.CreateModel( f1_local0, "currLevel" )
	local f1_local2 = Engine.CreateModel( f1_local0, "currLevelIcon" )
	local f1_local3, f1_local4 = CoD.AARUtility.GetLevelAndLevelIconForRank( f1_arg1, CoD.AARUtility.GetCurrentPrestige( f1_arg0 ) )
	Engine.SetModelValue( f1_local1, f1_local3 )
	Engine.SetModelValue( f1_local2, f1_local4 )
end

CoD.AARUtility.SetCurrLevelModelsForParagon = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "aarStats.performanceTabStats" ), "xpBarInfo" )
	local f2_local1 = Engine.CreateModel( f2_local0, "currLevel" )
	local f2_local2 = Engine.CreateModel( f2_local0, "currLevelIcon" )
	local f2_local3, f2_local4 = CoD.AARUtility.GetLevelAndIconForParagonRank( f2_arg1, f2_arg2 )
	Engine.SetModelValue( f2_local1, f2_local3 )
	Engine.SetModelValue( f2_local2, f2_local4 )
end

CoD.AARUtility.SetNextLevelModels = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f3_arg0 ), "aarStats.performanceTabStats" ), "xpBarInfo" )
	local f3_local1 = Engine.CreateModel( f3_local0, "nextLevel" )
	local f3_local2 = Engine.CreateModel( f3_local0, "nextLevelIcon" )
	local f3_local3, f3_local4 = CoD.AARUtility.GetLevelAndLevelIconForRank( f3_arg1, CoD.AARUtility.GetCurrentPrestige( f3_arg0 ) )
	Engine.SetModelValue( f3_local1, f3_local3 )
	Engine.SetModelValue( f3_local2, f3_local4 )
end

CoD.AARUtility.SetNextLevelModelsForParagon = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f4_arg0 ), "aarStats.performanceTabStats" ), "xpBarInfo" )
	local f4_local1 = Engine.CreateModel( f4_local0, "nextLevel" )
	local f4_local2 = Engine.CreateModel( f4_local0, "nextLevelIcon" )
	local f4_local3, f4_local4 = CoD.AARUtility.GetLevelAndIconForParagonRank( f4_arg1, f4_arg2 )
	Engine.SetModelValue( f4_local1, f4_local3 )
	Engine.SetModelValue( f4_local2, f4_local4 )
end

CoD.AARUtility.GetLevelAndLevelIconForRank = function ( f5_arg0, f5_arg1 )
	return Engine.TableLookup( 0, CoD.rankTable, CoD.AARUtility.RankIdCol, f5_arg0, CoD.AARUtility.RankDisplayLevelCol ), Engine.TableLookup( 0, CoD.rankIconTable, 0, f5_arg0, f5_arg1 + 1 )
end

CoD.AARUtility.GetLevelAndIconForParagonRank = function ( f6_arg0, f6_arg1 )
	local f6_local0 = Engine.GetParagonRankDisplayLevel( f6_arg0 )
	local f6_local1 = Engine.TableLookup( 0, CoD.rankIconTable, 0, 0, CoD.MAX_PRESTIGE + 1 )
	if f6_arg1 ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
		f6_local1 = Engine.GetParagonIconById( f6_arg1 )
	end
	return f6_local0, f6_local1
end

CoD.AARUtility.GetCurrentPrestige = function ( f7_arg0 )
	local f7_local0 = CoD.GetPlayerStats( f7_arg0 )
	return f7_local0.PlayerStatsList.PLEVEL.StatValue:get()
end

CoD.AARUtility.GetMinMaxXPForRank = function ( f8_arg0, f8_arg1 )
	return tonumber( Engine.TableLookup( f8_arg1, CoD.rankTable, CoD.AARUtility.RankIdCol, f8_arg0, CoD.AARUtility.RankTableColMinXP ) ), tonumber( Engine.TableLookup( f8_arg1, CoD.rankTable, CoD.AARUtility.RankIdCol, f8_arg0, CoD.AARUtility.RankTableColMaxXP ) )
end

CoD.AARUtility.GetMinMaxXPForParagonRank = function ( f9_arg0, f9_arg1 )
	return tonumber( Engine.TableLookup( f9_arg1, CoD.paragonRankTable, CoD.AARUtility.RankIdCol, f9_arg0, CoD.AARUtility.RankTableColMinXP ) ), tonumber( Engine.TableLookup( f9_arg1, CoD.paragonRankTable, CoD.AARUtility.RankIdCol, f9_arg0, CoD.AARUtility.RankTableColMaxXP ) )
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

CoD.AARUtility.SetupUIModels = function ( f13_arg0 )
	local f13_local0 = CoD.AARUtility.UseTestData()
	local f13_local1, f13_local2 = nil
	local f13_local3 = Engine.GetModelForController( f13_arg0 )
	if f13_local0 then
		Engine.SetModelValue( Engine.CreateModel( f13_local3, "aarType" ), "public" )
	end
	Engine.CreateModel( f13_local3, "deadSpectator.playerIndex" )
	Engine.CreateModel( f13_local3, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
	Engine.CreateModel( f13_local3, "gameScore.gameTimeEnd" )
	Engine.CreateModel( f13_local3, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if f13_local0 then
		f13_local1 = CoD.GetPlayerStats( f13_arg0 )
	else
		f13_local1 = CoD.GetPlayerStats( f13_arg0, CoD.STATS_LOCATION_STABLE )
	end
	local f13_local4 = CoD.GetPlayerStats( f13_arg0 )
	local f13_local5 = f13_local1.PlayerStatsList.RANKXP.StatValue:get()
	local f13_local6 = f13_local4.PlayerStatsList.RANK.StatValue:get()
	local f13_local7 = f13_local4.PlayerStatsList.PLEVEL.StatValue:get()
	local f13_local8 = f13_local4.PlayerStatsList.RANKXP.StatValue:get()
	local f13_local9 = CoD.PrestigeNext( f13_arg0 )
	local f13_local10 = CoD.AARUtility.GetXPEarnedDuringMatch( f13_arg0, f13_local8, f13_local5 )
	if IsInParagonCapableGameMode() and f13_local7 == Engine.GetPrestigeCap() then
		f13_local10 = CoD.AARUtility.GetXPEarnedDuringMatch( f13_arg0, f13_local4.PlayerStatsList.PARAGON_RANKXP.StatValue:get(), f13_local1.PlayerStatsList.PARAGON_RANKXP.StatValue:get() )
	end
	local f13_local11 = f13_local4.AfterActionReportStats
	local f13_local12 = {}
	if f13_local9 then
		f13_local12.nextLevel = CoD.PrestigeNextLevelText( f13_arg0 )
		f13_local12.nextLevelIcon = Engine.TableLookup( f13_arg0, CoD.rankIconTable, 0, 0, f13_local7 + 2 )
	else
		f13_local12.nextLevel, f13_local12.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( f13_local6 + 1, f13_local7 + 1 )
	end
	if f13_local0 then
		f13_local2 = "tdm"
		f13_local12.kills = 24
		f13_local12.deaths = 26
		f13_local12.score = 2500
		f13_local12.gameTypeName = Engine.StructTableLookupString( "game_types", "name", f13_local2, "name_ref_caps" )
		f13_local12.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", f13_local2, "name_ref" )
		f13_local12.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", f13_local2, "image" )
		f13_local12.wins = 116
		f13_local12.losses = 90
		f13_local12.winLossRatio = 1.28
		f13_local12.lossesRingClockFrac = string.format( "%.2f", f13_local12.losses / math.max( 1, f13_local12.wins + f13_local12.losses ) )
		f13_local12.showBestScoreIcon = 1
		f13_local12.showBestKillsIcon = 1
		f13_local12.showBestSPMIcon = 1
		f13_local12.showBestKDRIcon = 1
	else
		f13_local2 = Engine.GetCurrentGameType()
		f13_local12.kills = f13_local11.kills:get()
		f13_local12.deaths = f13_local11.deaths:get()
		f13_local12.score = f13_local11.score:get()
		if f13_local2 and f13_local2 ~= "" then
			local f13_local13 = f13_local11.hardcore
			if f13_local13 then
				f13_local13 = f13_local11.hardcore:get()
			end
			f13_local12.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", f13_local2, "image" )
			if f13_local13 ~= nil and f13_local13 == 1 then
				f13_local12.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", f13_local2, "hardcore_name_ref" )
				f13_local12.gameTypeName = LocalizeToUpperString( f13_local12.gameTypeNameNormal )
				if CoD.SafeGetModelValue( f13_local3, "aarType" ) ~= "custom" then
					f13_local2 = "hc" .. f13_local2
				end
			else
				f13_local12.gameTypeName = Engine.StructTableLookupString( "game_types", "name", f13_local2, "name_ref_caps" )
				f13_local12.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", f13_local2, "name_ref" )
			end
			f13_local12.wins = f13_local4.PlayerStatsByGameType[f13_local2].WINS.StatValue:get()
			f13_local12.losses = f13_local4.PlayerStatsByGameType[f13_local2].LOSSES.StatValue:get()
			f13_local12.winLossRatio = string.format( "%.2f", f13_local12.wins / math.max( 1, f13_local12.losses ) )
			f13_local12.lossesRingClockFrac = string.format( "%.2f", f13_local12.losses / math.max( 1, f13_local12.wins + f13_local12.losses ) )
		end
		f13_local12.showBestScoreIcon = 0
		f13_local12.showBestKillsIcon = 0
		f13_local12.showBestSPMIcon = 0
		f13_local12.showBestKDRIcon = 0
	end
	local f13_local13 = f13_local4.HighestStats.HIGHEST_SCORE:get()
	local f13_local14 = f13_local4.HighestStats.HIGHEST_KILLS:get()
	if f13_local13 <= f13_local12.score and f13_local13 ~= 0 then
		f13_local12.showBestScoreIcon = 1
	end
	if f13_local14 <= f13_local12.kills and f13_local14 ~= 0 then
		f13_local12.showBestKillsIcon = 1
	end
	local f13_local15 = (f13_local4.PlayerStatsList.SCORE.StatValue:get() - f13_local1.PlayerStatsList.SCORE.StatValue:get()) / math.max( 1, f13_local4.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() - f13_local1.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() )
	local f13_local16 = f13_local4.HighestStats.HIGHEST_SCORE_PER_MINUTE:get()
	if f13_local16 <= f13_local15 and f13_local16 ~= 0 then
		f13_local12.showBestSPMIcon = 1
	end
	local f13_local17 = f13_local12.kills / math.max( 1, f13_local12.deaths )
	local f13_local18 = f13_local4.HighestStats.HIGHEST_KDRATIO:get()
	if f13_local18 <= f13_local17 and f13_local18 ~= 0 then
		f13_local12.showBestKDRIcon = 1
	end
	f13_local12.xpEarnedDuringMatch = f13_local10
	local f13_local19 = Engine.CreateModel( f13_local3, "aarStats.performanceTabStats" )
	Engine.SetModelValue( Engine.CreateModel( f13_local3, "aarStats.xpScale" ), Engine.GetXPScale( f13_arg0 ) )
	for f13_local23, f13_local24 in pairs( f13_local12 ) do
		Engine.SetModelValue( Engine.CreateModel( f13_local19, f13_local23 ), f13_local24 )
	end
	CoD.AARUtility.CreateUIModelsForPerformanceGraphs( f13_arg0, f13_local19, f13_local2 )
	if CoD.isFrontend and f13_arg0 ~= 0 then
		f13_local20 = Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.xpScale" ), Engine.GetXPScale( 0 ) )
		for f13_local24, f13_local25 in pairs( f13_local12 ) do
			Engine.SetModelValue( Engine.CreateModel( f13_local20, f13_local24 ), f13_local25 )
		end
		f13_local21 = CoD.SafeGetModelValue( f13_local19, "globalSPM" )
		f13_local22 = CoD.SafeGetModelValue( f13_local19, "globalKDR" )
		Engine.SetModelValue( Engine.CreateModel( f13_local20, "globalSPM" ), f13_local21 )
		Engine.SetModelValue( Engine.CreateModel( f13_local20, "globalKDR" ), f13_local22 )
	end
end

CoD.AARUtility.GetMaxValue = function ( f14_arg0, f14_arg1 )
	local f14_local0 = 0
	for f14_local4, f14_local5 in ipairs( f14_arg0 ) do
		if f14_local5[f14_arg1] and f14_local0 < tonumber( f14_local5[f14_arg1] ) then
			f14_local0 = tonumber( f14_local5[f14_arg1] )
		end
	end
	return f14_local0
end

CoD.AARUtility.GetMinValue = function ( f15_arg0, f15_arg1 )
	if not f15_arg0[1] then
		return 
	end
	local f15_local0 = tonumber( f15_arg0[1][f15_arg1] )
	for f15_local4, f15_local5 in ipairs( f15_arg0 ) do
		if f15_local5[f15_arg1] and tonumber( f15_local5[f15_arg1] ) < f15_local0 then
			f15_local0 = tonumber( f15_local5[f15_arg1] )
		end
	end
	return f15_local0
end

CoD.AARUtility.SetGraphValues = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
	local f16_local0 = CoD.AARUtility.UseTestData()
	if CoD.AARUtility.UseTestData() then
		for f16_local4, f16_local5 in ipairs( {
			0.3,
			0.8,
			0.5,
			0.7,
			0.1
		} ) do
			Engine.SetModelValue( Engine.CreateModel( f16_arg3, "graphValue" .. f16_local4 ), string.format( "%.2f", f16_local5 ) .. " 0 0 0" )
		end
	else
		for f16_local3, f16_local4 in ipairs( f16_arg0 ) do
			local f16_local5 = f16_local4[f16_arg1]
			local f16_local7 = 0
			if f16_arg2 <= f16_local5 then
				f16_local7 = 0.5 - (f16_local5 - f16_arg2) / math.max( 1, f16_arg4 - f16_arg2 ) / 2
			else
				f16_local7 = 0.5 + (f16_arg2 - f16_local5) / math.max( 1, f16_arg2 - f16_arg5 ) / 2
			end
			Engine.SetModelValue( Engine.CreateModel( f16_arg3, "graphValue" .. f16_local3 ), string.format( "%.2f", f16_local7 ) .. " 0 0 0" )
		end
	end
end

CoD.AARUtility.CreateUIModelsForPerformanceGraphs = function ( f17_arg0, f17_arg1, f17_arg2 )
	local f17_local0 = CoD.AARUtility.UseTestData()
	local f17_local1 = {}
	local f17_local2 = 5
	local f17_local3 = 10
	local f17_local4 = Engine.GetPlayerStats( f17_arg0 )
	local f17_local5 = f17_local4.PlayerStatsByGameType[f17_arg2].prevScores
	local f17_local6 = f17_local4.PlayerStatsByGameType[f17_arg2].prevScoreIndex:get()
	if f17_local6 < 0 or f17_local3 < f17_local6 then
		f17_local6 = 0
	end
	local f17_local7 = f17_local4.PlayerStatsByGameType[f17_arg2].SCORE.StatValue:get()
	local f17_local8 = f17_local4.PlayerStatsByGameType[f17_arg2].TIME_PLAYED_TOTAL.StatValue:get()
	local f17_local9 = f17_local4.PlayerStatsByGameType[f17_arg2].KILLS.StatValue:get()
	local f17_local10 = f17_local4.PlayerStatsByGameType[f17_arg2].DEATHS.StatValue:get()
	local f17_local11 = math.ceil( f17_local4.PlayerStatsList.SCORE.StatValue:get() / math.max( 1, f17_local4.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get() / 60 ) )
	local f17_local12 = string.format( "%.2f", f17_local4.PlayerStatsList.KILLS.StatValue:get() / math.max( 1, f17_local4.PlayerStatsList.DEATHS.StatValue:get() ) )
	local f17_local13, f17_local14 = nil
	if f17_local0 then
		f17_local13 = 195
		f17_local14 = 0.95
		f17_local11 = 420
		f17_local12 = 1.25
		local f17_local15 = {
			180,
			202,
			175,
			208,
			201
		}
		local f17_local16 = {
			1.5,
			0.87,
			1.2,
			1.65,
			0.65
		}
		for f17_local17 = 1, f17_local2, 1 do
			table.insert( f17_local1, {
				spm = f17_local15[f17_local17],
				kdr = f17_local16[f17_local17],
				valid = 1
			} )
		end
	else
		for f17_local15 = 1, f17_local2, 1 do
			local f17_local18 = f17_local15
			local f17_local19 = {}
			local f17_local20 = f17_local5[f17_local6].score:get()
			local f17_local21 = f17_local5[f17_local6].timePlayed:get()
			local f17_local22 = f17_local5[f17_local6].kills:get()
			local f17_local23 = f17_local5[f17_local6].deaths:get()
			f17_local19.spm = math.floor( f17_local20 / math.max( 1, f17_local21 / 60 ) )
			f17_local19.kdr = string.format( "%.2f", f17_local22 / math.max( 1, f17_local23 ) )
			f17_local19.valid = f17_local5[f17_local6].valid:get()
			table.insert( f17_local1, f17_local19 )
			f17_local6 = f17_local6 - 1
			if f17_local6 < 0 then
				f17_local6 = f17_local3 - 1
			end
		end
	end
	local f17_local15 = Engine.CreateModel( f17_arg1, "spmGraph" )
	local f17_local16 = Engine.CreateModel( f17_arg1, "kdrGraph" )
	local f17_local17 = 0
	local f17_local18 = 0
	local f17_local19 = 0
	for f17_local23, f17_local24 in ipairs( f17_local1 ) do
		Engine.SetModelValue( Engine.CreateModel( f17_local15, "value" .. f17_local23 ), f17_local24.spm )
		Engine.SetModelValue( Engine.CreateModel( f17_local15, "value" .. f17_local23 .. "Valid" ), f17_local24.valid )
		Engine.SetModelValue( Engine.CreateModel( f17_local16, "value" .. f17_local23 ), string.format( "%.2f", f17_local24.kdr ) )
		Engine.SetModelValue( Engine.CreateModel( f17_local16, "value" .. f17_local23 .. "Valid" ), f17_local24.valid )
		if f17_local24.valid == 1 then
			f17_local19 = f17_local19 + 1
			f17_local17 = f17_local17 + f17_local24.spm
			f17_local18 = f17_local18 + f17_local24.kdr
		end
	end
	if f17_local19 == 0 then
		local f17_local25 = "0.00"
	end
	f17_local14 = f17_local25 or string.format( "%.2f", f17_local18 / f17_local19 )
	if f17_local19 == 0 then
		local f17_local26 = 0
	end
	f17_local13 = f17_local26 or math.ceil( f17_local17 / f17_local19 )
	Engine.SetModelValue( Engine.CreateModel( f17_local15, "avgSPM" ), f17_local13 )
	Engine.SetModelValue( Engine.CreateModel( f17_local16, "avgKDR" ), f17_local14 )
	Engine.SetModelValue( Engine.CreateModel( f17_arg1, "globalSPM" ), f17_local11 )
	Engine.SetModelValue( Engine.CreateModel( f17_arg1, "globalKDR" ), f17_local12 )
	f17_local20 = CoD.AARUtility.GetMaxValue( f17_local1, "spm" )
	f17_local21 = CoD.AARUtility.GetMinValue( f17_local1, "spm" )
	f17_local22 = math.max( f17_local20, f17_local13 + 200 )
	f17_local23 = math.min( f17_local21, math.max( f17_local13 - 100, 0 ) )
	f17_local24 = f17_local22 - f17_local23
	f17_local22 = math.max( f17_local22, f17_local20 + f17_local24 / 20 )
	f17_local23 = math.min( f17_local23, f17_local21 - f17_local24 / 20 )
	local f17_local27 = CoD.AARUtility.GetMaxValue( f17_local1, "kdr" )
	local f17_local28 = CoD.AARUtility.GetMinValue( f17_local1, "kdr" )
	local f17_local29 = math.max( f17_local27, f17_local14 + 1.5 )
	local f17_local30 = math.min( f17_local28, math.max( f17_local14 - 0.5, 0 ) )
	local f17_local31 = f17_local29 - f17_local30
	f17_local29 = math.max( f17_local29, f17_local27 + f17_local31 / 20 )
	f17_local30 = math.min( f17_local30, f17_local28 - f17_local31 / 20 )
	CoD.AARUtility.SetGraphValues( f17_local1, "spm", f17_local13, f17_local15, f17_local22, f17_local23 )
	CoD.AARUtility.SetGraphValues( f17_local1, "kdr", f17_local14, f17_local16, f17_local29, f17_local30 )
end

CoD.AARUtility.EstimateEarnedXP = function ( f18_arg0 )
	local f18_local0 = 0
	local f18_local1 = Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, Engine.GetCurrentGameType() .. " XP" )
	local f18_local2 = Engine.GetRecentMedals( f18_arg0, f18_local1 )
	if f18_local2 and 0 < #f18_local2 then
		local f18_local3 = 0
		for f18_local7, f18_local8 in ipairs( f18_local2 ) do
			local f18_local9 = f18_local8.value
			f18_local3 = f18_local3 + tonumber( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f18_local8.row, f18_local1 ) )
		end
		f18_local0 = f18_local0 + f18_local3
	end
	local f18_local3 = Engine.GetRecentChallenges( f18_arg0 )
	if f18_local3 then
		local f18_local4 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4, f19_arg5 )
			local f19_local0 = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f19_arg1 + 1 ), f19_arg2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_XPEARNED ) )
			if f19_local0 ~= nil then
				return f19_local0
			else
				return 0
			end
		end
		
		local f18_local5 = 0
		for f18_local9, f18_local11 in ipairs( f18_local3 ) do
			local f18_local10 = false
			if CoD.ChallengesUtility.IsSpecialistTransmissionChallenge( f18_local11.type, f18_local11.tableNumber, f18_local11.row ) or CoD.ChallengesUtility.IsTerribleKnifeChallenge( f18_local11.type, f18_local11.tableNumber, f18_local11.row ) then
				f18_local10 = true
			end
			if not f18_local10 then
				f18_local5 = f18_local5 + f18_local4( f18_arg0, f18_local11.tableNumber, f18_local11.row, f18_local11.type, f18_local11.itemIndex, f18_local11.specialistIndex )
			end
		end
		f18_local0 = f18_local0 + f18_local5
	end
	local f18_local4 = CoD.GetPlayerStats( f18_arg0 )
	local f18_local5 = CoD.GetPlayerStats( f18_arg0, CoD.STATS_LOCATION_STABLE )
	f18_local0 = f18_local0 + f18_local4.PlayerStatsList.SCORE.StatValue:get() - f18_local5.PlayerStatsList.SCORE.StatValue:get()
	if f18_local0 > 1000 then
		f18_local0 = f18_local0 + 100 + 25 * f18_local4.AfterActionReportStats.kills:get() / math.max( 1, f18_local4.AfterActionReportStats.deaths:get() )
	end
	local f18_local7 = 1
	local f18_local8 = Engine.GetModel( Engine.GetModelForController( f18_arg0 ), "aarStats.xpScale" )
	if f18_local8 then
		f18_local7 = Engine.GetModelValue( f18_local8 )
	end
	return math.floor( f18_local0 * f18_local7 )
end

CoD.AARUtility.GetXPEarnedDuringMatch = function ( f20_arg0, f20_arg1, f20_arg2 )
	local f20_local0 = f20_arg1 - f20_arg2
	if IsStarterPackMaxLevel( f20_arg0 ) then
		f20_local0 = CoD.AARUtility.EstimateEarnedXP( f20_arg0 )
	end
	if f20_local0 < 0 then
		f20_local0 = 0
	end
	return f20_local0
end

CoD.AARUtility.AnyItemsUnlockedForRank = function ( f21_arg0, f21_arg1 )
	for f21_local3, f21_local4 in pairs( f21_arg1 ) do
		if Engine.GetItemUnlockLevel( f21_local4.itemIndex ) == f21_arg0 then
			return true
		end
	end
end

CoD.AARUtility.GetBlueprintStringPrefixForItem = function ( f22_arg0 )
	local f22_local0 = Engine.GetLoadoutSlotForItem( f22_arg0 )
	if f22_local0 == "primary" or f22_local0 == "secondary" then
		return Engine.GetItemGroup( f22_arg0, Enum.eModes.MODE_MULTIPLAYER )
	else
		return f22_local0
	end
end

CoD.AARUtility.IsHeroAbility = function ( f23_arg0 )
	if LUI.startswith( Engine.GetItemRef( f23_arg0 ), "gadget_" ) then
		return true
	else
		
	end
end

CoD.AARUtility.IsHeroWeapon = function ( f24_arg0 )
	if LUI.startswith( Engine.GetItemRef( f24_arg0 ), "hero_" ) then
		return true
	else
		
	end
end

CoD.AARUtility.CreateRewardInfoModel = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4, f25_arg5 )
	local f25_local0 = Engine.CreateModel( f25_arg0, "reward" .. f25_arg1 .. "Info" )
	Engine.SetModelValue( Engine.CreateModel( f25_arg0, "reward" .. f25_arg1 .. "InfoVisible" ), 1 )
	Engine.SetModelValue( Engine.CreateModel( f25_local0, "rewardName" ), f25_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f25_local0, "rewardImage" ), f25_arg3 )
	Engine.SetModelValue( Engine.CreateModel( f25_local0, "rewardDesc" ), f25_arg4 )
	Engine.SetModelValue( Engine.CreateModel( f25_local0, "isCallingCard" ), f25_arg5 or false )
	return f25_local0
end

CoD.AARUtility.CreateModelsForRewards = function ( f26_arg0 )
	local f26_local0, f26_local1 = nil
	f26_local1 = CoD.GetPlayerStats( f26_arg0 )
	local f26_local2 = CoD.AARUtility.UseTestData()
	if f26_local2 then
		f26_local0 = CoD.GetPlayerStats( f26_arg0 )
	else
		f26_local0 = CoD.GetPlayerStats( f26_arg0, CoD.STATS_LOCATION_STABLE )
	end
	local f26_local3 = Engine.CreateModel( Engine.GetModelForController( f26_arg0 ), "aarRewards" )
	local f26_local4 = 0
	local f26_local5 = Engine.GetRecentlyUnlockedItems( f26_arg0 )
	local f26_local6 = f26_local0.PlayerStatsList.RANK.StatValue:get()
	local f26_local7 = f26_local1.PlayerStatsList.RANK.StatValue:get()
	local f26_local8 = f26_local1.PlayerStatsList.PLEVEL.StatValue:get()
	local f26_local9 = nil
	local f26_local10 = 4
	local f26_local11 = IsInParagonCapableGameMode()
	if f26_local11 then
		f26_local11 = CoD.AARUtility.GetCurrentPrestige( f26_arg0 ) == Engine.GetPrestigeCap()
	end
	if f26_local11 then
		f26_local9 = f26_local1.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
		f26_local6 = f26_local0.PlayerStatsList.PARAGON_RANK.StatValue:get()
		f26_local7 = f26_local1.PlayerStatsList.PARAGON_RANK.StatValue:get()
	end
	local f26_local12 = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4, f27_arg5, f27_arg6, f27_arg7 )
		f26_local4 = f26_local4 + 1
		local f27_local0 = Engine.CreateModel( f26_local3, "rewardsCarouselItem" .. f26_local4 )
		for f27_local1 = 1, f26_local10, 1 do
			Engine.SetModelValue( Engine.CreateModel( f27_local0, "reward" .. f27_local1 .. "InfoVisible" ), 0 )
		end
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "rewardCarouselItemImage" ), f27_arg0 or "$white" )
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "rewardCarouselItemTitle" ), f27_arg1 or "" )
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "rewardCarouselItemSubTitle" ), f27_arg2 or "" )
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "rewardCarouselItemType" ), f27_arg3 or "" )
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "rewardCarouselWidgetType" ), f27_arg4 or "" )
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "paragonRankDescVisible" ), f27_arg5 or 0 )
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "extraParagonIconsVisible" ), f27_arg6 or 0 )
		Engine.SetModelValue( Engine.CreateModel( f27_local0, "showBonusCryptokeys" ), f27_arg7 or false )
		return f27_local0
	end
	
	local f26_local13 = function ()
		local f28_local0 = IsCampaign()
		if not f28_local0 then
			if not IsMultiplayer() then
				f28_local0 = IsZombies()
				if f28_local0 then
				
				else
					return f28_local0
				end
			end
			f28_local0 = IsProgressionEnabled( f26_arg0 )
		end
		return f28_local0
	end
	
	if IsMultiplayer() and Engine.SessionMode_IsPublicOnlineGame() then
		if Dvar.enable_weapon_contract:get() and f26_local0.weaponContractData.completeTimestamp:get() == 0 and f26_local1.weaponContractData.completeTimestamp:get() ~= 0 then
			local f26_local14 = f26_local12( "uie_t7_hud_aar_bm_challenge", Engine.Localize( "MPUI_BM_CONTRACT_TOTAL_VICTORY" ), Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL_DESC", Dvar.weapon_contract_target_value:get() ), "weaponContract", "CoD.IncentiveRewardsCarouselItem" )
			CoD.AARUtility.CreateRewardInfoModel( f26_local14, 1, Engine.Localize( "MPUI_BM_INCENTIVE_AAR_WEAPON_BRIBE" ), "t7_hud_notif_blackmarket_weapon_bribe", Engine.Localize( "MPUI_BM_INCENTIVE_AAR_REWARD" ), false )
			CoD.AARUtility.CreateRewardInfoModel( f26_local14, 2, Engine.Localize( "MPUI_BM_INCENTIVE_AAR_BUNDLE" ), "t7_hud_notif_blackmarket_supplydrop_bundle", Engine.Localize( "MPUI_BM_INCENTIVE_AAR_REWARD" ), false )
		end
		local f26_local14 = CoD.GetContractStatValuesForIndex( f26_arg0, LuaUtils.BMContracts.specialContractIndex, f26_local0, false )
		local f26_local15 = CoD.GetContractStatValuesForIndex( f26_arg0, LuaUtils.BMContracts.specialContractIndex, f26_local1, true )
		if f26_local14 and f26_local15 and f26_local15.isActive and f26_local14.progress < f26_local14.targetValue and f26_local15.targetValue <= f26_local15.progress then
			local f26_local16 = 1
			local f26_local17 = f26_local12( "uie_t7_hud_aar_bm_challenge", Engine.Localize( f26_local15.titleRef ), Engine.Localize( f26_local15.descRef, f26_local15.targetValue ), "weaponContract", "CoD.IncentiveRewardsCarouselItem" )
			if f26_local15.category == "trifecta" then
				CoD.AARUtility.CreateRewardInfoModel( f26_local17, f26_local16, Engine.Localize( "MPUI_BM_INCENTIVE_AAR_RANGE_WEAPON_BRIBE" ), "t7_blackmarket_contracts_ranged_reward", Engine.Localize( "MPUI_BM_INCENTIVE_AAR_REWARD" ), false )
				CoD.AARUtility.CreateRewardInfoModel( f26_local17, f26_local16 + 1, Engine.Localize( "MPUI_BM_INCENTIVE_AAR_MELEE_WEAPON_BRIBE" ), "t7_blackmarket_contracts_melee_reward", Engine.Localize( "MPUI_BM_INCENTIVE_AAR_REWARD" ), false )
				CoD.AARUtility.CreateRewardInfoModel( f26_local17, f26_local16 + 2, Engine.Localize( "MPUI_BM_INCENTIVE_AAR_BUNDLE" ), "t7_hud_notif_blackmarket_supplydrop_bundle", Engine.Localize( "MPUI_BM_INCENTIVE_AAR_REWARD" ), false )
				f26_local16 = f26_local16 + 3
			end
			if f26_local15.backgroundId and f26_local15.backgroundId ~= 0 then
				CoD.AARUtility.CreateRewardInfoModel( f26_local17, f26_local16, Engine.Localize( "MENU_CALLING_CARD" ), GetBackgroundByID( f26_local15.backgroundId ), "", true )
				f26_local16 = f26_local16 + 1
			end
			if f26_local15.category == "camo" and f26_local15.camoName ~= "" and f26_local15.image ~= "" then
				CoD.AARUtility.CreateRewardInfoModel( f26_local17, f26_local16, Engine.Localize( f26_local15.camoName ), f26_local15.image, "", false )
				f26_local16 = f26_local16 + 1
			end
		end
	end
	if IsMultiplayer() and Engine.SessionMode_IsPublicOnlineGame() then
		local f26_local14 = CoD.GetContractStatValuesForIndex( f26_arg0, LuaUtils.BMContracts.dailyContractIndex, f26_local0, false )
		local f26_local15 = CoD.GetContractStatValuesForIndex( f26_arg0, LuaUtils.BMContracts.dailyContractIndex, f26_local1, true )
		if f26_local14 and f26_local15 and f26_local15.isActive and f26_local14.progress < f26_local14.targetValue and f26_local15.targetValue <= f26_local15.progress then
			CoD.AARUtility.CreateRewardInfoModel( f26_local12( "uie_t7_hud_aar_bm_challenge", Engine.Localize( f26_local15.titleRef ), Engine.Localize( f26_local15.descRef, f26_local15.targetValue ), "dailyContract", "CoD.DailyContractRewardsCarouselItem" ), 1, Engine.Localize( "MPUI_BM_CRYPTOKEY_COUNT", Dvar.daily_contract_cryptokey_reward_count:get() ), IsDoubleDailyContract( f26_arg0 ) and "uie_t7_icon_blackmarket_doubleloot_small" or "t7_icon_cryptokeys_rwd", "", false )
		end
		local f26_local16 = CoD.GetContractStatValuesForIndex( f26_arg0, LuaUtils.BMContracts.weeklyContractIndex1, f26_local0, false )
		local f26_local17 = CoD.GetContractStatValuesForIndex( f26_arg0, LuaUtils.BMContracts.weeklyContractIndex1, f26_local1, true )
		local f26_local18 = CoD.GetContractStatValuesForIndex( f26_arg0, LuaUtils.BMContracts.weeklyContractIndex2, f26_local0, false )
		local f26_local19 = CoD.GetContractStatValuesForIndex( f26_arg0, LuaUtils.BMContracts.weeklyContractIndex2, f26_local1, true )
		if f26_local16 and f26_local17 and f26_local18 and f26_local19 then
			if f26_local17.isActive and f26_local16.progress < f26_local16.targetValue and f26_local17.targetValue <= f26_local17.progress then
				local f26_local20 = f26_local18.targetValue <= f26_local18.progress
				local f26_local21 = "first"
				local f26_local22 = 1
				if f26_local20 then
					f26_local21 = "second"
					f26_local22 = 2
				end
				local f26_local23 = f26_local12( "uie_t7_hud_aar_bm_challenge", Engine.Localize( f26_local17.titleRef ), Engine.Localize( f26_local17.descRef, f26_local17.targetValue ), f26_local21, "CoD.WeeklyContractRewardsCarouselItem" )
				Engine.SetModelValue( Engine.CreateModel( f26_local23, "requirementCompleteText" ), Engine.Localize( "MPUI_BM_CONTRACT_REQUIREMENTS_COMPLETE", f26_local22, 2 ) )
				if f26_local20 then
					CoD.AARUtility.CreateRewardInfoModel( f26_local23, 1, Engine.Localize( "MPUI_BM_CRYPTOKEY_COUNT", Dvar.weekly_contract_cryptokey_reward_count:get() ), "t7_icon_cryptokeys_rwd", "", false )
					CoD.AARUtility.CreateRewardInfoModel( f26_local23, 2, Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK_CONTRACT" ), "t7_icon_contracts_rwd", "", false )
				end
			end
			if f26_local19.isActive and f26_local18.progress < f26_local18.targetValue and f26_local19.targetValue <= f26_local19.progress then
				local f26_local20 = f26_local17.targetValue <= f26_local17.progress
				local f26_local21 = "first"
				local f26_local22 = 1
				if f26_local20 then
					f26_local21 = "second"
					f26_local22 = 2
				end
				local f26_local23 = f26_local12( "uie_t7_hud_aar_bm_challenge", Engine.Localize( f26_local19.titleRef ), Engine.Localize( f26_local19.descRef, f26_local19.targetValue ), f26_local21, "CoD.WeeklyContractRewardsCarouselItem" )
				Engine.SetModelValue( Engine.CreateModel( f26_local23, "requirementCompleteText" ), Engine.Localize( "MPUI_BM_CONTRACT_REQUIREMENTS_COMPLETE", f26_local22, 2 ) )
				if f26_local20 then
					CoD.AARUtility.CreateRewardInfoModel( f26_local23, 1, Engine.Localize( "MPUI_BM_CRYPTOKEY_COUNT", Dvar.weekly_contract_cryptokey_reward_count:get() ), "t7_icon_cryptokeys_rwd", "", false )
					CoD.AARUtility.CreateRewardInfoModel( f26_local23, 2, Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK_CONTRACT" ), "t7_icon_contracts_rwd", "", false )
				end
			end
		end
	end
	local f26_local14 = f26_local1.AfterActionReportStats
	local f26_local15 = CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f26_arg0 )
	local f26_local16 = f26_local15
	local f26_local17 = false
	local f26_local18 = CoD.BlackMarketUtility.GetCryptoKeysFromMatchChallenges( f26_arg0, CoD.BlackMarketUtility.MatchChallengeType.dailyAndWeeklyContract )
	if f26_local2 then
		f26_local15 = 11 + f26_local18
		f26_local16 = 9
		f26_local17 = false
	elseif f26_local14.cryptoKeysBeforeMatch then
		f26_local16 = f26_local14.cryptoKeysBeforeMatch:get()
		f26_local15 = CoD.BlackMarketUtility.GetCryptoKeyCountPostMatch( f26_arg0, f26_local14 )
		f26_local17 = f26_local15 ~= CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f26_arg0 )
	end
	if not f26_local17 and f26_local16 < f26_local15 then
		local f26_local19 = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON )
		local f26_local20 = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.RARE )
		local f26_local21 = f26_local15 - f26_local16
		if math.floor( f26_local16 / f26_local20 ) < math.floor( f26_local15 / f26_local20 ) then
			local f26_local22 = math.floor( f26_local15 / f26_local20 )
			local f26_local23 = math.floor( f26_local15 / f26_local19 )
			local f26_local24 = ""
			if f26_local22 > 1 then
				f26_local24 = Engine.Localize( "MENU_BLACKMARKET_REWARD_DESC_RARE_PLU", f26_local22, f26_local23 )
			else
				f26_local24 = Engine.Localize( "MENU_BLACKMARKET_REWARD_DESC_RARE", f26_local23 )
			end
			local f26_local25 = f26_local12( "uie_t7_blackmarket_crate_rare_focus", f26_local24, tostring( f26_local15 ), "blackMarket", "CoD.BlackmarketRewardsCarouselItemRare", nil, nil, f26_local18 ~= 0 )
			CoD.AARUtility.CreateRewardInfoModel( f26_local25, 1, tostring( f26_local21 - f26_local18 ), "", "" )
			CoD.AARUtility.CreateRewardInfoModel( f26_local25, 2, tostring( f26_local18 ), "", "" )
		elseif math.floor( f26_local16 / f26_local19 ) < math.floor( f26_local15 / f26_local19 ) then
			local f26_local22 = math.floor( f26_local15 / f26_local19 )
			local f26_local23 = ""
			if f26_local22 > 1 then
				f26_local23 = Engine.Localize( "MENU_BLACKMARKET_REWARD_DESC_COMMON_PLU", f26_local22 )
			else
				f26_local23 = Engine.Localize( "MENU_BLACKMARKET_REWARD_DESC_COMMON", f26_local22 )
			end
			local f26_local24 = f26_local12( "uie_t7_blackmarket_crate_common_focus", f26_local23, tostring( f26_local15 ), "blackMarket", "CoD.BlackmarketRewardsCarouselItem", nil, nil, f26_local18 ~= 0 )
			CoD.AARUtility.CreateRewardInfoModel( f26_local24, 1, tostring( f26_local21 - f26_local18 ), "", "" )
			CoD.AARUtility.CreateRewardInfoModel( f26_local24, 2, tostring( f26_local18 ), "", "" )
		end
	end
	for f26_local19 = f26_local6 + 1, f26_local7, 1 do
		if f26_local13() or CoD.AARUtility.AnyItemsUnlockedForRank( f26_local19, f26_local5 ) then
			local f26_local23 = 0
			local f26_local24, f26_local25 = CoD.AARUtility.GetLevelAndLevelIconForRank( f26_local19, f26_local8 )
			local f26_local26 = CoD.GetRankName( f26_local19, f26_local8 )
			local f26_local27 = {}
			local f26_local28 = "rankup"
			local f26_local29 = 0
			local f26_local30 = 0
			if f26_local11 then
				f26_local24, f26_local25 = CoD.AARUtility.GetLevelAndIconForParagonRank( f26_local19, f26_local9 )
				f26_local27 = Engine.GetUnlockedParagonIconsForParagonRank( f26_local19 )
				f26_local28 = "paragonRankUp"
				if #f26_local27 == 0 then
					f26_local29 = 1
				end
				if f26_local19 == CoD.MAX_PARAGON_RANK then
					f26_local30 = 1
				end
			end
			local f26_local31 = f26_local12( f26_local25 .. "_lrg", f26_local26, Engine.Localize( "MPUI_LEVEL_N", f26_local24 ), f26_local28, nil, f26_local29, f26_local30 )
			for f26_local43, f26_local44 in pairs( f26_local5 ) do
				if Engine.GetItemUnlockLevel( f26_local44.itemIndex ) == f26_local19 and f26_local23 < f26_local10 and not CoD.AARUtility.IsHeroAbility( f26_local44.itemIndex ) then
					f26_local23 = f26_local23 + 1
					if CoD.AARUtility.IsHeroWeapon( f26_local44.itemIndex ) then
						local f26_local35 = Engine.CurrentSessionMode()
						for f26_local39, f26_local40 in ipairs( Engine.GetHeroList( f26_local35 ) ) do
							local f26_local41 = Engine.GetLoadoutInfoForHero( f26_local35, f26_local40.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
							if f26_local44.itemIndex == f26_local41.itemIndex then
								CoD.AARUtility.CreateRewardInfoModel( f26_local31, f26_local23, Engine.Localize( f26_local40.displayName ), f26_local40.defaultHeroRender, "" )
							end
						end
					end
					local f26_local35 = Engine.GetLoadoutSlotForItem( f26_local44.itemIndex )
					local f26_local42 = Engine.GetItemImage( f26_local44.itemIndex )
					if not IsZombies() or f26_local35 ~= "equippedbubblegumpack" then
						f26_local42 = f26_local42 .. "_rwd"
					end
					CoD.AARUtility.CreateRewardInfoModel( f26_local31, f26_local23, Engine.GetItemName( f26_local44.itemIndex ), f26_local42, "MPUI_" .. CoD.AARUtility.GetBlueprintStringPrefixForItem( f26_local44.itemIndex ) )
				end
			end
			f26_local32 = {}
			for f26_local44, f26_local35 in pairs( f26_local27 ) do
				if not f26_local32[CoD.AARUtility.GameOrder[f26_local35.gameTitle]] then
					f26_local32[CoD.AARUtility.GameOrder[f26_local35.gameTitle]] = f26_local35
				end
				if f26_local32[CoD.AARUtility.GameOrder[f26_local35.gameTitle]].plevel < f26_local35.plevel then
					f26_local32[CoD.AARUtility.GameOrder[f26_local35.gameTitle]] = f26_local35
				end
			end
			for f26_local44, f26_local35 in pairs( f26_local32 ) do
				if f26_local23 < f26_local10 then
					CoD.AARUtility.CreateRewardInfoModel( f26_local31, f26_local23 + 1, "MENU_AAR_CUSTOM_PRESTIGE_ICON", f26_local35.imageName .. "_lrg", f26_local35.gameTitle )
				end
			end
			if not f26_local11 and f26_local13() and not IsZombies() then
				CoD.AARUtility.CreateRewardInfoModel( f26_local31, f26_local23 + 1, "MPUI_UNLOCK_TOKEN", "t7_hud_mp_token_reward", "" )
			end
		end
	end
	local f26_local19 = {}
	local f26_local20 = Engine.GetNumBulletWeapons()
	if f26_local20 ~= nil then
		for f26_local21 = 0, f26_local20 - 1, 1 do
			if Engine.HasRecentItemAttachmentsUnlocked( f26_arg0, f26_local21 ) then
				local f26_local25 = Engine.GetNumItemAttachmentsWithAttachPoint( f26_local21, 0 )
				local f26_local26 = {}
				for f26_local27 = 1, f26_local25 - 1, 1 do
					if Engine.IsItemAttachmentRecentlyUnlocked( f26_arg0, f26_local21, f26_local27 ) then
						local f26_local31 = Engine.GetItemAttachment( f26_local21, f26_local27 )
						local f26_local32 = tonumber( Engine.TableLookup( f26_arg0, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( f26_local21 ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( f26_local31 ), CoD.AARUtility.GunRankCol ) )
						local f26_local33 = tonumber( Engine.TableLookup( f26_arg0, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( f26_local21 ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( f26_local31 ), CoD.AARUtility.GunRankXPCol ) )
						if f26_local32 and f26_local33 then
							table.insert( f26_local26, {
								itemIndex = f26_local21,
								attachmentIndex = f26_local31,
								unlockLevel = f26_local32 + 2,
								xp = f26_local33
							} )
						end
					end
				end
				table.sort( f26_local26, function ( f29_arg0, f29_arg1 )
					return f29_arg0.unlockLevel < f29_arg1.unlockLevel
				end )
				for f26_local30, f26_local31 in pairs( f26_local26 ) do
					local f26_local32 = f26_local12( Engine.GetItemImage( f26_local31.itemIndex ) .. "_pu", Engine.GetItemName( f26_local31.itemIndex ), Engine.Localize( "MPUI_LEVEL_N", f26_local31.unlockLevel ), "weaponRankup" )
					CoD.AARUtility.CreateRewardInfoModel( f26_local32, 1, Engine.GetAttachmentNameByIndex( f26_local31.attachmentIndex ), Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, f26_local31.itemIndex, f26_local31.attachmentIndex ) .. "_rwd", "" )
					CoD.AARUtility.CreateRewardInfoModel( f26_local32, 2, Engine.Localize( "RANK_XP", f26_local31.xp * Engine.GetXPScale( f26_arg0 ) ), "t7_hud_mp_notifications_xp_blue", "" )
				end
			end
		end
	end
	local f26_local21 = nil
	if f26_local2 then
		f26_local21 = {}
		local f26_local22 = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
			local f30_local0 = CoD.getStatsMilestoneTable( f30_arg0 + 1 )
			local f30_local1 = Engine.TableFindRows( f30_local0, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX, f30_arg1 )
			if not f30_local1 then
				return 
			end
			local f30_local2 = f30_local1[1]
			local f30_local3 = Engine.TableLookupGetColumnValueForRow( f30_local0, f30_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM )
			local f30_local4 = Engine.TableLookupGetColumnValueForRow( f30_local0, f30_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKIMAGE )
			local f30_local5 = Engine.TableLookupGetColumnValueForRow( f30_local0, f30_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKHEROITEM )
			local f30_local6 = Engine.TableLookupGetColumnValueForRow( f30_local0, f30_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STATTYPE )
			local f30_local7 = tonumber( Engine.TableLookupGetColumnValueForRow( f30_local0, f30_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_XPEARNED ) )
			local f30_local8 = nil
			local f30_local9 = true
			if f30_local4 and f30_local4 ~= "" then
				f30_local8 = Engine.TableLookup( nil, CoD.emblemIconsTable, 4, f30_local4, 1 )
				if not f30_local8 or f30_local8 == "" then
					f30_local8 = Engine.TableLookup( nil, CoD.backgroundsTable, 4, f30_local4, 1 )
					f30_local9 = false
				end
				if f30_local8 then
					if f30_local8 == "" then
						f30_local8 = nil
					else
						f30_local8 = tonumber( f30_local8 )
					end
				end
			end
			if f30_local6 == "global" then
				f30_local6 = Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL
			elseif f30_local6 == "gamemode" then
				f30_local6 = Enum.statsMilestoneTypes_t.MILESTONE_GAMEMODE
			elseif f30_local6 == "group" then
				f30_local6 = Enum.statsMilestoneTypes_t.MILESTONE_GROUP
			elseif f30_local6 == "attachment" then
				f30_local6 = Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS
			elseif f30_local6 == "specialist" then
				f30_local6 = Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST
			else
				f30_local6 = Enum.statsMilestoneTypes_t.MILESTONE_WEAPON
			end
			table.insert( f26_local21, {
				tableNumber = f30_arg0,
				row = f30_local2,
				itemIndex = f30_arg2,
				type = f30_local6,
				rewardXp = f30_local7,
				heroUnlock = f30_local5,
				unlockedImageId = f30_local8,
				specialistIndex = f30_arg3
			} )
		end
		
		f26_local22( 0, 0, nil, nil )
		f26_local22( 0, 120, nil, nil )
		f26_local22( 0, 2, nil, nil )
		f26_local22( 1, 324, 7, nil )
		f26_local22( 1, 325, 7, nil )
		f26_local22( 2, 656, 33, nil )
		f26_local22( 2, 657, 33, nil )
		f26_local22( 3, 820, nil, 3 )
		f26_local22( 3, 867, nil, 3 )
		f26_local22( 3, 870, nil, 3 )
		f26_local22( 2, 555, 25, nil )
		f26_local22( 2, 556, 25, nil )
		f26_local22( 2, 648, Enum.itemGroup_t.ITEMGROUP_ASSAULT, nil )
		f26_local22( 2, 649, Enum.itemGroup_t.ITEMGROUP_PISTOL, nil )
		f26_local22( 2, 650, Enum.itemGroup_t.ITEMGROUP_SMG, nil )
		f26_local22( 2, 651, Enum.itemGroup_t.ITEMGROUP_LMG, nil )
		f26_local22( 2, 652, Enum.itemGroup_t.ITEMGROUP_SNIPER, nil )
		f26_local22( 2, 653, Enum.itemGroup_t.ITEMGROUP_CQB, nil )
		f26_local22( 2, 654, Enum.itemGroup_t.ITEMGROUP_LAUNCHER, nil )
		f26_local22( 2, 656, Enum.itemGroup_t.ITEMGROUP_KNIFE, nil )
		f26_local22( 0, 163, nil, nil )
		f26_local22( 5, 1400, 0, nil )
		f26_local22( 5, 1401, 0, nil )
		f26_local22( 5, 1402, 0, nil )
		f26_local22( 5, 1403, 0, nil )
		f26_local22( 5, 1404, 0, nil )
		f26_local22( 5, 1405, 0, nil )
		f26_local22( 5, 1406, 0, nil )
	else
		f26_local21 = Engine.GetRecentChallenges( f26_arg0 )
	end
	local f26_local22 = {}
	if f26_local21 then
		for f26_local26, f26_local27 in ipairs( f26_local21 ) do
			local f26_local28 = true
			if not f26_local22[f26_local27.tableNumber] then
				f26_local22[f26_local27.tableNumber] = {}
			end
			if not f26_local22[f26_local27.tableNumber][f26_local27.row] then
				f26_local28 = false
				f26_local22[f26_local27.tableNumber][f26_local27.row] = {}
			end
			if f26_local27.itemIndex and not f26_local22[f26_local27.tableNumber][f26_local27.row][f26_local27.itemIndex] then
				f26_local28 = false
				f26_local22[f26_local27.tableNumber][f26_local27.row][f26_local27.itemIndex] = true
			end
			local f26_local29 = false
			if f26_local28 or CoD.ChallengesUtility.IsSpecialistTransmissionChallenge( f26_local27.type, f26_local27.tableNumber, f26_local27.row ) or CoD.ChallengesUtility.IsTerribleKnifeChallenge( f26_local27.type, f26_local27.tableNumber, f26_local27.row ) or CoD.ChallengesUtility.IsHiddenPostShipChallenge( f26_local27.type, f26_local27.tableNumber, f26_local27.row ) or CoD.ChallengesUtility.IsSideBetMasteryChallenge( f26_local27.type, f26_local27.tableNumber, f26_local27.row ) or CoD.ChallengesUtility.IsSpecialContractChallenge( f26_local27.type, f26_local27.tableNumber, f26_local27.row ) then
				f26_local29 = true
			end
			if IsZombies() and f26_local27.type == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
				CoD.ChallengesUtility.UpdateDailyChallengeModel( f26_arg0, Engine.CreateModel( Engine.GetModelForController( f26_arg0 ), "AARDailyChallengeModel" ), Enum.eModes.MODE_ZOMBIES, tonumber( Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f26_local27.tableNumber + 1 ), f26_local27.row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX ) ) )
			end
			if not f26_local29 then
				local f26_local30 = CoD.ChallengesUtility.GetChallengeRewardInfo( f26_arg0, f26_local27.tableNumber, f26_local27.row, f26_local27.type, f26_local27.itemIndex, f26_local27.specialistIndex )
				if f26_local30.titleText then
					local f26_local31 = nil
					if IsMultiplayer() then
						if f26_local30.specialistInfo then
							if f26_local30.specialistInfo.unlockItemIndex == 9 then
								f26_local31 = "CoD.SpecialistCompletionEpicRewardsCarouselItem"
							elseif f26_local30.specialistInfo.unlockItemIndex == 8 then
								f26_local31 = "CoD.SpecialistEpicRewardsCarouselItem"
							else
								f26_local31 = "CoD.SpecialistRewardsCarouselItem"
							end
						elseif f26_local30.camoInfo then
							if f26_local30.camoInfo.camoRef == "camo_diamond" or f26_local30.camoInfo.camoRef == "camo_darkmatter" then
								f26_local31 = "CoD.CamoDiamondRewardsCarouselItem"
							elseif f26_local30.camoInfo.camoRef == "camo_gold" then
								f26_local31 = "CoD.CamoGoldRewardsCarouselItem"
							else
								f26_local31 = "CoD.CamoRewardsCarouselItem"
							end
						elseif f26_local30.reticleInfo then
							f26_local31 = "CoD.ReticleRewardsCarouselItem"
						elseif f26_local30.emblemInfo then
							if f26_local30.emblemInfo.category == "sidebet" then
								f26_local31 = "CoD.SideBetRewardsCarouselItem"
							elseif f26_local30.emblemInfo.isMastery then
								f26_local31 = "CoD.MPChallengeMasterRewardsCarouselItem"
							else
								f26_local31 = "CoD.MPChallengeRewardsCarouselItem"
							end
						else
							f26_local31 = "CoD.MPChallengeRewardsCarouselItem"
						end
					elseif IsZombies() then
						if f26_local30.camoInfo then
							f26_local31 = "CoD.CamoRewardsCarouselItem"
						elseif f26_local30.reticleInfo then
							f26_local31 = "CoD.ReticleRewardsCarouselItem"
						elseif f26_local27.type == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
							f26_local31 = "CoD.ZMDailyChallengeRewardsCarouselItem"
						else
							f26_local31 = "CoD.MPChallengeRewardsCarouselItem"
						end
					end
					local f26_local32 = f26_local12( f26_local30.icon, f26_local30.titleText, f26_local30.subtitleText, "challenge", f26_local31 )
					local f26_local33 = 1
					for f26_local42, f26_local36 in ipairs( {
						"specialistInfo",
						"camoInfo",
						"emblemInfo",
						"reticleInfo",
						"transmissionInfo",
						"xpInfo",
						"vialInfo"
					} ) do
						if f26_local30[f26_local36] then
							CoD.AARUtility.CreateRewardInfoModel( f26_local32, f26_local33, f26_local30[f26_local36].displayString, f26_local30[f26_local36].image, "", f26_local30[f26_local36].rewardSize == "CallingCard" )
							f26_local33 = f26_local33 + 1
						end
					end
				end
			end
		end
	end
	if IsZombies() then
		local f26_local23 = f26_local1.PlayerStatsList.BGB_TOKENS_GAINED_THIS_GAME.StatValue:get()
		if f26_local23 and f26_local23 > 0 then
			local f26_local24 = nil
			local f26_local25 = IsZMDoubleVialActive( f26_arg0 ) and "uie_t7_hud_zm_vial_aar" or "t7_hud_zm_vial_256"
			if f26_local23 == 1 then
				f26_local24 = f26_local12( f26_local25, "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_TITLE", "ZMUI_VIAL_DISCOVERED", "rankup" )
			else
				f26_local24 = f26_local12( f26_local25, "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_TITLE", "ZMUI_VIALS_DISCOVERED", "rankup" )
			end
			CoD.AARUtility.CreateRewardInfoModel( f26_local24, 1, Engine.Localize( "ZMUI_BGB_TOKENS_GAINED_REWARD", f26_local23 ), IsZMDoubleVialActive( f26_arg0 ) and "uie_t7_icon_zm_double_vial_backer" or "t7_hud_zm_vial_256", "", false )
		end
	end
	if IsMultiplayer() and ArenaChallengesEnabled() then
		for f26_local27, f26_local28 in ipairs( CoD.ArenaUtility.GetRecentArenaVetChallenges( f26_arg0, f26_local0, f26_local1, true ) ) do
			CoD.AARUtility.CreateRewardInfoModel( f26_local12( "uie_t7_icons_challenges_mp_arena_seasonvet", f26_local28.models.title, f26_local28.models.description, "arena", "CoD.MPChallengeRewardsCarouselItem" ), 1, Engine.Localize( "MENU_CALLING_CARD" ), GetBackgroundByID( f26_local28.models.iconId ), "", true )
		end
		for f26_local28, f26_local29 in ipairs( CoD.ArenaUtility.GetRecentArenaBestChallenges( f26_arg0, f26_local0, f26_local1 ) ) do
			CoD.AARUtility.CreateRewardInfoModel( f26_local12( "uie_t7_icons_challenges_mp_arena_bestranked", f26_local29.models.title, f26_local29.models.description, "arena", "CoD.MPChallengeRewardsCarouselItem" ), 1, Engine.Localize( "MENU_CALLING_CARD" ), GetBackgroundByID( f26_local29.models.iconId ), "", true )
		end
	end
	Engine.SetModelValue( Engine.CreateModel( f26_local3, "rewardsCarouselItemCount" ), f26_local4 )
end

CoD.AARUtility.GetRewardItemCount = function ( f31_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f31_arg0.controller ), "aarRewards.rewardsCarouselItemCount" ) )
end

CoD.AARUtility.GetModelForRewardItemByIndex = function ( f32_arg0, f32_arg1 )
	return Engine.GetModel( Engine.GetModelForController( f32_arg0 ), "aarRewards.rewardsCarouselItem" .. f32_arg1 )
end

CoD.AARUtility.AnyRewardsEarnedDuringMatch = function ( f33_arg0 )
	return IsLive() and Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f33_arg0 ), "aarRewards.rewardsCarouselItemCount" ) ) > 0
end

CoD.AARUtility.SortMedals = function ( f34_arg0, f34_arg1 )
	if f34_arg0.row and f34_arg1.row then
		local f34_local0 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f34_arg0.row, CoD.AARUtility.medalSortkeyCol )
		local f34_local1 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f34_arg1.row, CoD.AARUtility.medalSortkeyCol )
		if f34_local0 and f34_local1 then
			local f34_local2 = tonumber( f34_local0 )
			local f34_local3 = tonumber( f34_local1 )
			if f34_local2 == f34_local3 then
				return f34_arg0.value < f34_arg1.value
			else
				return f34_local2 < f34_local3
			end
		end
	end
	return true
end

CoD.AARUtility.CountdownRequiredXPNumber = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4, f35_arg5 )
	local f35_local0 = CoD.AARUtility.XPBarAnimTime
	local f35_local1 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( CoD.isFrontend and 0 or f35_arg0 ), "aarStats.performanceTabStats" ), "xpNeededToLevelUpStringRefValue" )
	local self = LUI.UITimer.new( 5, "count_down", false, f35_arg1 )
	self.currentValue = f35_arg3
	self.minValue = f35_arg4
	f35_arg1.xpNumberTimer = self
	local f35_local3 = 0
	f35_arg1:registerEventHandler( "count_down", function ( element, event )
		f35_local3 = f35_local3 + event.timeElapsed
		self.currentValue = math.floor( f35_arg3 - f35_local3 / f35_local0 * f35_arg3 )
		if self.currentValue < self.minValue or f35_local0 < f35_local3 then
			self.currentValue = self.minValue
			self:close()
			if f35_arg5 then
				f35_arg5()
			end
		end
		Engine.SetModelValue( f35_local1, self.currentValue )
		if CoD.isFrontend and f35_arg0 ~= 0 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats.xpNeededToLevelUpStringRefValue" ), self.currentValue )
		end
	end )
	f35_arg1:addElement( f35_arg1.xpNumberTimer )
end

CoD.AARUtility.DoXPBarAnimationSequence = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4, f37_arg5, f37_arg6, f37_arg7 )
	local f37_local0 = CoD.AARUtility.XPBarAnimTime
	local f37_local1 = f37_arg1.XpBarContainer.XpBar
	local f37_local2, f37_local3 = CoD.AARUtility.GetMinMaxXPForRank( f37_arg3, f37_arg0 )
	if f37_arg6 then
		f37_local2, f37_local3 = CoD.AARUtility.GetMinMaxXPForParagonRank( f37_arg3, f37_arg0 )
	end
	local f37_local4 = (f37_arg2 - f37_local2) / math.max( 1, f37_local3 - f37_local2 )
	local f37_local5 = 1
	local f37_local6 = 0
	local f37_local7 = 0
	if f37_arg3 == f37_arg4 then
		f37_local5 = (f37_arg5 - f37_local2) / math.max( 1, f37_local3 - f37_local2 )
		f37_local6 = f37_local3 - f37_arg5
	end
	f37_local1.XpBarCurrXPBg:setShaderVector( 0, f37_local4, 0, 0, 0 )
	f37_local1.XpBarEarnedXPBg:setShaderVector( 0, f37_local4, 0, 0, 0 )
	f37_local1.XpBarEarnedXPBg:beginAnimation( "animate_bar", f37_local0, true, true )
	f37_local1.XpBarEarnedXPBg:setShaderVector( 0, f37_local5, 0, 0, 0 )
	Engine.PlaySound( "uin_aar_bar_fill_main" )
	CoD.AARUtility.CountdownRequiredXPNumber( f37_arg0, f37_arg1, f37_local1, f37_local3 - f37_arg2, f37_local6, function ()
		Engine.PlaySound( "uin_aar_bar_fill_tail" )
		if f37_arg4 <= f37_arg3 then
			if Engine.IsCampaignGame() then
				CoD.AARUtilityCP.hasSeenXPBarAnim = true
			end
			return 
		else
			f37_arg1.XpBarContainer:playClip( "Update" )
			f37_arg1.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
				local f39_local0 = math.min( CoD.MAX_RANK, f37_arg3 + 1 )
				local f39_local1, f39_local2 = CoD.AARUtility.GetMinMaxXPForRank( f39_local0, f37_arg0 )
				if f37_arg6 then
					f39_local0 = math.min( CoD.MAX_PARAGON_RANK, f37_arg3 + 1 )
					f39_local1, f39_local2 = CoD.AARUtility.GetMinMaxXPForParagonRank( f39_local0, f37_arg0 )
					CoD.AARUtility.SetCurrLevelModelsForParagon( f37_arg0, f39_local0, f37_arg7 )
					CoD.AARUtility.SetNextLevelModelsForParagon( f37_arg0, math.min( CoD.MAX_PARAGON_RANK, f39_local0 + 1 ), f37_arg7 )
				else
					CoD.AARUtility.SetCurrLevelModels( f37_arg0, f39_local0 )
					CoD.AARUtility.SetNextLevelModels( f37_arg0, math.min( CoD.MAX_RANK, f39_local0 + 1 ) )
				end
				f37_local1.XpBarCurrXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				f37_local1.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				if not (not IsCampaign() or f39_local0 ~= CoD.MAX_RANK) or IsMultiplayer() and f39_local0 == CoD.MAX_PARAGON_RANK then
					f37_arg1.XpBarContainer:playClip( "FlashLastLevel" )
				else
					f37_arg1.XpBarContainer:playClip( "FlashNextLevel" )
				end
				f37_arg1.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
					CoD.AARUtility.DoXPBarAnimationSequence( f37_arg0, f37_arg1, f39_local1, f39_local0, f37_arg4, f37_arg5, f37_arg6, f37_arg7 )
				end )
			end )
		end
	end )
end

CoD.AARUtility.DoXPBarAnimation = function ( f41_arg0, f41_arg1 )
	local f41_local0 = CoD.AARUtility.UseTestData()
	if Engine.IsCampaignGame() then
		f41_local0 = CoD.AARUtilityCP.UseTestData()
	end
	local f41_local1 = CoD.AARUtility.TestSinglePromotion()
	local f41_local2 = CoD.AARUtility.TestMultiplePromotions()
	local f41_local3, f41_local4, f41_local5, f41_local6 = nil
	local f41_local7 = false
	local f41_local8 = CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID
	if not f41_local0 then
		local f41_local9 = CoD.GetPlayerStats( f41_arg1, CoD.STATS_LOCATION_STABLE )
		local f41_local10 = IsInParagonCapableGameMode()
		if f41_local10 then
			f41_local10 = f41_local9.PlayerStatsList.PLEVEL.StatValue:get()
		end
		f41_local7 = IsInParagonCapableGameMode() and f41_local10 == Engine.GetPrestigeCap()
		if Engine.IsCampaignGame() then
			local f41_local11 = CoD.GetPlayerStats( f41_arg1 )
			f41_local3 = CoD.AARUtilityCP.GetRankForRankXP( f41_arg1, f41_local11.currentRankXP:get() )
			f41_local6 = f41_local11.PlayerStatsList.RANK.StatValue:get()
			f41_local5 = f41_local11.PlayerStatsList.RANKXP.StatValue:get()
		elseif f41_local7 then
			f41_local3 = f41_local9.PlayerStatsList.PARAGON_RANK.StatValue:get()
			f41_local4 = f41_local9.PlayerStatsList.PARAGON_RANKXP.StatValue:get()
			local f41_local11 = CoD.GetPlayerStats( f41_arg1 )
			f41_local6 = f41_local11.PlayerStatsList.PARAGON_RANK.StatValue:get()
			f41_local5 = f41_local11.PlayerStatsList.PARAGON_RANKXP.StatValue:get()
			f41_local8 = f41_local11.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
		else
			f41_local3 = f41_local9.PlayerStatsList.RANK.StatValue:get()
			f41_local4 = f41_local9.PlayerStatsList.RANKXP.StatValue:get()
			local f41_local11 = CoD.GetPlayerStats( f41_arg1 )
			f41_local6 = f41_local11.PlayerStatsList.RANK.StatValue:get()
			f41_local5 = f41_local11.PlayerStatsList.RANKXP.StatValue:get()
		end
	end
	local f41_local9 = Engine.GetModel( Engine.GetModelForController( f41_arg1 ), "aarStats.performanceTabStats" )
	local f41_local10 = f41_arg0.XpBarContainer.XpBar
	if f41_local0 then
		if f41_local2 then
			f41_local3 = 4
			f41_local4 = 20250
			f41_local5 = 35500
			f41_local6 = 6
		elseif f41_local1 then
			f41_local3 = 5
			f41_local4 = 28500
			f41_local5 = 35500
			f41_local6 = 6
		else
			f41_local3 = 5
			f41_local4 = 28500
			f41_local5 = 31500
			f41_local6 = 5
		end
		Engine.SetModelValue( Engine.CreateModel( f41_local9, "xpEarnedDuringMatch" ), f41_local5 - f41_local4 )
	end
	if not Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f41_arg1 ), "doAARXPBarAnimation" ) ) then
		local f41_local12 = f41_local6 + 1
		local f41_local13 = CoD.MAX_RANK
		if f41_local7 then
			CoD.AARUtility.SetCurrLevelModelsForParagon( f41_arg1, f41_local6, f41_local8 )
			f41_local13 = CoD.MAX_PARAGON_RANK
		else
			CoD.AARUtility.SetCurrLevelModels( f41_arg1, f41_local6 )
		end
		if f41_local13 < f41_local12 then
			f41_local12 = f41_local6
		end
		local f41_local14 = f41_local5
		local f41_local15 = f41_local5
		if IsCampaign() and f41_local12 == f41_local6 then
			f41_local10.XpBarCurrXPBg:setShaderVector( 0, 0, 0, 0, 0 )
			f41_local10.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
			f41_arg0.XpBarContainer.RankIconAndNumberWidgetNextTop:setAlpha( 0 )
			f41_arg0.XpBarContainer.RankIconAndNumberWidgetNextBase:setAlpha( 0 )
			f41_arg0.XpBarContainer.NextLevelDisplay:setAlpha( 0 )
			f41_arg0.XpBarContainer.XpBar:setAlpha( 0 )
			f41_arg0.XpBarContainer.XpBarFrame:setAlpha( 0 )
			f41_arg0.XpBarContainer.MeterGlow:setAlpha( 0 )
			f41_arg0.XpBarContainer.XPEarnedDisplay:setAlpha( 0 )
		elseif f41_local7 then
			CoD.AARUtility.SetNextLevelModelsForParagon( f41_arg1, f41_local12, f41_local8 )
			f41_local14, f41_local15 = CoD.AARUtility.GetMinMaxXPForParagonRank( f41_local6, f41_arg1 )
			f41_local10.XpBarCurrXPBg:setShaderVector( 0, (f41_local5 - f41_local14) / math.max( 1, f41_local15 - f41_local14 ), 0, 0, 0 )
			f41_local10.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
			if CoD.MAX_PARAGON_RANK <= f41_local3 then
				f41_arg0.XpBarContainer:playClip( "FlashLastLevel" )
			end
		else
			CoD.AARUtility.SetNextLevelModels( f41_arg1, f41_local12 )
			f41_local14, f41_local15 = CoD.AARUtility.GetMinMaxXPForRank( f41_local6, f41_arg1 )
			f41_local10.XpBarCurrXPBg:setShaderVector( 0, (f41_local5 - f41_local14) / math.max( 1, f41_local15 - f41_local14 ), 0, 0, 0 )
			f41_local10.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
		end
		Engine.SetModelValue( Engine.CreateModel( f41_local9, "xpNeededToLevelUpStringRefValue" ), f41_local15 - f41_local5 )
		if CoD.isFrontend and f41_arg1 ~= 0 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats.xpNeededToLevelUpStringRefValue" ), f41_local15 - f41_local5 )
		end
	elseif f41_local7 then
		local f41_local12, f41_local13 = CoD.AARUtility.GetMinMaxXPForParagonRank( f41_local3, f41_arg1 )
		local f41_local14 = (f41_local4 - f41_local12) / math.max( 1, f41_local13 - f41_local12 )
		f41_local10.XpBarCurrXPBg:setShaderVector( 0, f41_local14, 0, 0, 0 )
		f41_local10.XpBarEarnedXPBg:setShaderVector( 0, f41_local14, 0, 0, 0 )
		CoD.AARUtility.SetCurrLevelModelsForParagon( f41_arg1, f41_local3, f41_local8 )
		CoD.AARUtility.SetNextLevelModelsForParagon( f41_arg1, math.min( CoD.MAX_PARAGON_RANK, f41_local3 + 1 ), f41_local8 )
		Engine.SetModelValue( Engine.CreateModel( f41_local9, "xpNeededToLevelUpStringRefValue" ), f41_local13 - f41_local4 )
		if CoD.isFrontend and f41_arg1 ~= 0 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats.xpNeededToLevelUpStringRefValue" ), f41_local13 - f41_local4 )
		end
		if CoD.MAX_PARAGON_RANK <= f41_local3 then
			f41_arg0.XpBarContainer:playClip( "FlashLastLevel" )
			return 
		end
		local self = LUI.UITimer.new( 1000, "start_xp_bar_animation", true, f41_arg0 )
		f41_arg0:registerEventHandler( "start_xp_bar_animation", function ()
			CoD.AARUtility.DoXPBarAnimationSequence( f41_arg1, f41_arg0, f41_local4, f41_local3, f41_local6, f41_local5, f41_local7, f41_local8 )
		end )
		f41_arg0:addElement( self )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f41_arg1 ), "doAARXPBarAnimation" ), false )
	else
		local f41_local12, f41_local13 = CoD.AARUtility.GetMinMaxXPForRank( f41_local3, f41_arg1 )
		local f41_local14 = (f41_local4 - f41_local12) / math.max( 1, f41_local13 - f41_local12 )
		f41_local10.XpBarCurrXPBg:setShaderVector( 0, f41_local14, 0, 0, 0 )
		f41_local10.XpBarEarnedXPBg:setShaderVector( 0, f41_local14, 0, 0, 0 )
		CoD.AARUtility.SetCurrLevelModels( f41_arg1, f41_local3 )
		CoD.AARUtility.SetNextLevelModels( f41_arg1, math.min( CoD.MAX_RANK, f41_local3 + 1 ) )
		Engine.SetModelValue( Engine.CreateModel( f41_local9, "xpNeededToLevelUpStringRefValue" ), f41_local13 - f41_local4 )
		if CoD.isFrontend and f41_arg1 ~= 0 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( 0 ), "aarStats.performanceTabStats.xpNeededToLevelUpStringRefValue" ), f41_local13 - f41_local4 )
		end
		local self = LUI.UITimer.new( 1000, "start_xp_bar_animation", true, f41_arg0 )
		f41_arg0:registerEventHandler( "start_xp_bar_animation", function ()
			CoD.AARUtility.DoXPBarAnimationSequence( f41_arg1, f41_arg0, f41_local4, f41_local3, f41_local6, f41_local5, f41_local7, f41_local8 )
		end )
		f41_arg0:addElement( self )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f41_arg1 ), "doAARXPBarAnimation" ), false )
	end
end

