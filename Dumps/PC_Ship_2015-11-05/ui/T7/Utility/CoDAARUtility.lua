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
	Engine.CreateModel( Engine.GetModelForController( f9_arg0 ), "deadSpectator.playerIndex" )
	Engine.CreateModel( Engine.GetModelForController( f9_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
	Engine.CreateModel( Engine.GetModelForController( f9_arg0 ), "gameScore.gameTimeEnd" )
	Engine.CreateModel( Engine.GetModelForController( f9_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
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
			local f9_local12 = f9_local10.hardcore
			if f9_local12 then
				f9_local12 = f9_local10.hardcore:get()
			end
			f9_local11.gameTypeIcon = Engine.StructTableLookupString( "game_types", "name", f9_local2, "image" )
			if f9_local12 ~= nil and f9_local12 == 1 then
				f9_local11.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", f9_local2, "hardcore_name_ref" )
				f9_local11.gameTypeName = LocalizeToUpperString( f9_local11.gameTypeNameNormal )
				f9_local2 = "hc" .. f9_local2
			else
				f9_local11.gameTypeName = Engine.StructTableLookupString( "game_types", "name", f9_local2, "name_ref_caps" )
				f9_local11.gameTypeNameNormal = Engine.StructTableLookupString( "game_types", "name", f9_local2, "name_ref" )
			end
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
	f13_local20 = f0_local0( f13_local1, "spm" )
	f13_local21 = f0_local1( f13_local1, "spm" )
	f13_local22 = math.max( f13_local20, f13_local13 + 200 )
	f13_local23 = math.min( f13_local21, math.max( f13_local13 - 100, 0 ) )
	f13_local24 = f13_local22 - f13_local23
	f13_local22 = math.max( f13_local22, f13_local20 + f13_local24 / 20 )
	f13_local23 = math.min( f13_local23, f13_local21 - f13_local24 / 20 )
	local f13_local27 = f0_local0( f13_local1, "kdr" )
	local f13_local28 = f0_local1( f13_local1, "kdr" )
	local f13_local29 = math.max( f13_local27, f13_local14 + 1.5 )
	local f13_local30 = math.min( f13_local28, math.max( f13_local14 - 0.5, 0 ) )
	local f13_local31 = f13_local29 - f13_local30
	f13_local29 = math.max( f13_local29, f13_local27 + f13_local31 / 20 )
	f13_local30 = math.min( f13_local30, f13_local28 - f13_local31 / 20 )
	f0_local2( f13_local1, "spm", f13_local13, f13_local15, f13_local22, f13_local23 )
	f0_local2( f13_local1, "kdr", f13_local14, f13_local16, f13_local29, f13_local30 )
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

local f0_local7 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4, f19_arg5 )
	local f19_local0 = Engine.CreateModel( f19_arg0, "reward" .. f19_arg1 .. "Info" )
	Engine.SetModelValue( Engine.CreateModel( f19_arg0, "reward" .. f19_arg1 .. "InfoVisible" ), 1 )
	Engine.SetModelValue( Engine.CreateModel( f19_local0, "rewardName" ), f19_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f19_local0, "rewardImage" ), f19_arg3 )
	Engine.SetModelValue( Engine.CreateModel( f19_local0, "rewardDesc" ), f19_arg4 )
	Engine.SetModelValue( Engine.CreateModel( f19_local0, "isCallingCard" ), f19_arg5 or false )
	return f19_local0
end

CoD.AARUtility.CreateModelsForRewards = function ( f20_arg0 )
	local f20_local0, f20_local1 = nil
	f20_local1 = CoD.GetPlayerStats( f20_arg0 )
	local f20_local2 = CoD.AARUtility.UseTestData()
	if f20_local2 then
		f20_local0 = CoD.GetPlayerStats( f20_arg0 )
	else
		f20_local0 = CoD.GetPlayerStats( f20_arg0, CoD.STATS_LOCATION_STABLE )
	end
	local f20_local3 = Engine.CreateModel( Engine.GetModelForController( f20_arg0 ), "aarRewards" )
	local f20_local4 = 0
	local f20_local5 = Engine.GetRecentlyUnlockedItems( f20_arg0 )
	local f20_local6 = f20_local0.PlayerStatsList.RANK.StatValue:get()
	local f20_local7 = f20_local1.PlayerStatsList.RANK.StatValue:get()
	local f20_local8 = f20_local1.PlayerStatsList.PLEVEL.StatValue:get()
	local f20_local9 = 4
	local f20_local10 = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
		f20_local4 = f20_local4 + 1
		local f21_local0 = Engine.CreateModel( f20_local3, "rewardsCarouselItem" .. f20_local4 )
		for f21_local1 = 1, f20_local9, 1 do
			Engine.SetModelValue( Engine.CreateModel( f21_local0, "reward" .. f21_local1 .. "InfoVisible" ), 0 )
		end
		Engine.SetModelValue( Engine.CreateModel( f21_local0, "rewardCarouselItemImage" ), f21_arg0 )
		Engine.SetModelValue( Engine.CreateModel( f21_local0, "rewardCarouselItemTitle" ), f21_arg1 )
		Engine.SetModelValue( Engine.CreateModel( f21_local0, "rewardCarouselItemSubTitle" ), f21_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f21_local0, "rewardCarouselItemType" ), f21_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f21_local0, "rewardCarouselWidgetType" ), f21_arg4 )
		return f21_local0
	end
	
	for f20_local11 = f20_local6, f20_local7, 1 do
		if f0_local3( f20_local11, f20_local5 ) then
			local f20_local14 = 0
			local f20_local15, f20_local16 = CoD.AARUtility.GetLevelAndLevelIconForRank( f20_local11, f20_local8 )
			local f20_local17 = f20_local10( f20_local16 .. "_lrg", CoD.GetRankName( f20_local11, f20_local8 ), Engine.Localize( "MPUI_LEVEL_N", f20_local15 ), "rankup" )
			for f20_local29, f20_local30 in pairs( f20_local5 ) do
				if Engine.GetItemUnlockLevel( f20_local30.itemIndex ) == f20_local11 and f20_local14 < f20_local9 and not f0_local5( f20_local30.itemIndex ) then
					f20_local14 = f20_local14 + 1
					if f0_local6( f20_local30.itemIndex ) then
						local f20_local21 = Engine.CurrentSessionMode()
						for f20_local25, f20_local26 in ipairs( Engine.GetHeroList( f20_local21 ) ) do
							local f20_local27 = Engine.GetLoadoutInfoForHero( f20_local21, f20_local26.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
							if f20_local30.itemIndex == f20_local27.itemIndex then
								f0_local7( f20_local17, f20_local14, Engine.Localize( f20_local26.displayName ), f20_local26.defaultHeroRender, "" )
							end
						end
					end
					local f20_local21 = Engine.GetLoadoutSlotForItem( f20_local30.itemIndex )
					local f20_local28 = Engine.GetItemImage( f20_local30.itemIndex )
					if not IsZombies() or f20_local21 ~= "equippedbubblegumpack" then
						f20_local28 = f20_local28 .. "_rwd"
					end
					f0_local7( f20_local17, f20_local14, Engine.GetItemName( f20_local30.itemIndex ), f20_local28, "MPUI_" .. f0_local4( f20_local30.itemIndex ) )
				end
			end
			if not IsZombies() then
				f0_local7( f20_local17, f20_local14 + 1, "MPUI_UNLOCK_TOKEN", "t7_hud_mp_token_reward", "" )
			end
		end
	end
	local f20_local11 = {}
	local f20_local12 = Engine.GetNumBulletWeapons()
	if f20_local12 ~= nil then
		for f20_local13 = 0, f20_local12 - 1, 1 do
			if Engine.HasRecentItemAttachmentsUnlocked( f20_arg0, f20_local13 ) then
				local f20_local16 = Engine.GetNumItemAttachmentsWithAttachPoint( f20_local13, 0 )
				local f20_local32 = {}
				for f20_local17 = 1, f20_local16 - 1, 1 do
					if Engine.IsItemAttachmentRecentlyUnlocked( f20_arg0, f20_local13, f20_local17 ) then
						local f20_local29 = Engine.GetItemAttachment( f20_local13, f20_local17 )
						local f20_local30 = tonumber( Engine.TableLookup( f20_arg0, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( f20_local13 ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( f20_local29 ), CoD.AARUtility.GunRankCol ) )
						local f20_local21 = tonumber( Engine.TableLookup( f20_arg0, CoD.gunLevelsTable, CoD.AARUtility.GunRefCol, Engine.GetItemRef( f20_local13 ), CoD.AARUtility.GunAttachmentRefCol, Engine.GetAttachmentRefByIndex( f20_local29 ), CoD.AARUtility.GunRankXPCol ) )
						if f20_local30 and f20_local21 then
							table.insert( f20_local32, {
								itemIndex = f20_local13,
								attachmentIndex = f20_local29,
								unlockLevel = f20_local30 + 2,
								xp = f20_local21
							} )
						end
					end
				end
				table.sort( f20_local32, function ( f22_arg0, f22_arg1 )
					return f22_arg0.unlockLevel < f22_arg1.unlockLevel
				end )
				for f20_local20, f20_local29 in pairs( f20_local32 ) do
					local f20_local30 = f20_local10( Engine.GetItemImage( f20_local29.itemIndex ) .. "_pu", Engine.GetItemName( f20_local29.itemIndex ), Engine.Localize( "MPUI_LEVEL_N", f20_local29.unlockLevel ), "weaponRankup" )
					f0_local7( f20_local30, 1, Engine.GetAttachmentNameByIndex( f20_local29.attachmentIndex ), Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, f20_local29.itemIndex, f20_local29.attachmentIndex ) .. "_rwd", "" )
					f0_local7( f20_local30, 2, Engine.Localize( "RANK_XP", f20_local29.xp ), "t7_hud_mp_notifications_xp_blue", "" )
				end
			end
		end
	end
	local f20_local13 = nil
	if f20_local2 then
		f20_local13 = {}
		local f20_local31 = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
			local f23_local0 = CoD.getStatsMilestoneTable( f23_arg0 + 1 )
			local f23_local1 = Engine.TableFindRows( f23_local0, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX, f23_arg1 )
			if not f23_local1 then
				return 
			end
			local f23_local2 = f23_local1[1]
			local f23_local3 = Engine.TableLookupGetColumnValueForRow( f23_local0, f23_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM )
			local f23_local4 = Engine.TableLookupGetColumnValueForRow( f23_local0, f23_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKIMAGE )
			local f23_local5 = Engine.TableLookupGetColumnValueForRow( f23_local0, f23_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKHEROITEM )
			local f23_local6 = Engine.TableLookupGetColumnValueForRow( f23_local0, f23_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STATTYPE )
			local f23_local7 = tonumber( Engine.TableLookupGetColumnValueForRow( f23_local0, f23_local2, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_XPEARNED ) )
			local f23_local8 = nil
			local f23_local9 = true
			if f23_local4 and f23_local4 ~= "" then
				f23_local8 = Engine.TableLookup( nil, CoD.emblemIconsTable, 4, f23_local4, 1 )
				if not f23_local8 or f23_local8 == "" then
					f23_local8 = Engine.TableLookup( nil, CoD.backgroundsTable, 4, f23_local4, 1 )
					f23_local9 = false
				end
				if f23_local8 then
					if f23_local8 == "" then
						f23_local8 = nil
					else
						f23_local8 = tonumber( f23_local8 )
					end
				end
			end
			if f23_local6 == "global" then
				f23_local6 = Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL
			elseif f23_local6 == "gamemode" then
				f23_local6 = Enum.statsMilestoneTypes_t.MILESTONE_GAMEMODE
			elseif f23_local6 == "group" then
				f23_local6 = Enum.statsMilestoneTypes_t.MILESTONE_GROUP
			elseif f23_local6 == "attachment" then
				f23_local6 = Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS
			elseif f23_local6 == "specialist" then
				f23_local6 = Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST
			else
				f23_local6 = Enum.statsMilestoneTypes_t.MILESTONE_WEAPON
			end
			table.insert( f20_local13, {
				tableNumber = f23_arg0,
				row = f23_local2,
				itemIndex = f23_arg2,
				type = f23_local6,
				rewardXp = f23_local7,
				heroUnlock = f23_local5,
				unlockedImageId = f23_local8,
				specialistIndex = f23_arg3
			} )
		end
		
		f20_local31( 0, 0, nil, nil )
		f20_local31( 0, 120, nil, nil )
		f20_local31( 0, 2, nil, nil )
		f20_local31( 1, 324, 7, nil )
		f20_local31( 1, 325, 7, nil )
		f20_local31( 2, 656, 33, nil )
		f20_local31( 2, 657, 33, nil )
		f20_local31( 3, 820, nil, 3 )
		f20_local31( 3, 867, nil, 3 )
		f20_local31( 3, 870, nil, 3 )
		f20_local31( 2, 555, 25, nil )
		f20_local31( 2, 556, 25, nil )
		f20_local31( 2, 648, Enum.itemGroup_t.ITEMGROUP_ASSAULT, nil )
		f20_local31( 2, 649, Enum.itemGroup_t.ITEMGROUP_PISTOL, nil )
		f20_local31( 2, 650, Enum.itemGroup_t.ITEMGROUP_SMG, nil )
		f20_local31( 2, 651, Enum.itemGroup_t.ITEMGROUP_LMG, nil )
		f20_local31( 2, 652, Enum.itemGroup_t.ITEMGROUP_SNIPER, nil )
		f20_local31( 2, 653, Enum.itemGroup_t.ITEMGROUP_CQB, nil )
		f20_local31( 2, 654, Enum.itemGroup_t.ITEMGROUP_LAUNCHER, nil )
		f20_local31( 2, 656, Enum.itemGroup_t.ITEMGROUP_KNIFE, nil )
		f20_local31( 0, 163, nil, nil )
	else
		f20_local13 = Engine.GetRecentChallenges( f20_arg0 )
	end
	if f20_local13 then
		for f20_local16, f20_local32 in ipairs( f20_local13 ) do
			local f20_local17 = false
			if CoD.ChallengesUtility.IsSpecialistTransmissionChallenge( f20_local32.type, f20_local32.tableNumber, f20_local32.row ) then
				f20_local17 = true
			end
			if not f20_local17 then
				local f20_local18 = CoD.ChallengesUtility.GetChallengeRewardInfo( f20_arg0, f20_local32.tableNumber, f20_local32.row, f20_local32.type, f20_local32.itemIndex, f20_local32.specialistIndex )
				if f20_local18.titleText then
					local f20_local19 = nil
					if IsMultiplayer() then
						if f20_local18.specialistInfo then
							if f20_local18.specialistInfo.unlockItemIndex == 9 then
								f20_local19 = "CoD.SpecialistCompletionEpicRewardsCarouselItem"
							elseif f20_local18.specialistInfo.unlockItemIndex == 8 then
								f20_local19 = "CoD.SpecialistEpicRewardsCarouselItem"
							else
								f20_local19 = "CoD.SpecialistRewardsCarouselItem"
							end
						elseif f20_local18.camoInfo then
							if f20_local18.camoInfo.camoRef == "camo_diamond" or f20_local18.camoInfo.camoRef == "camo_darkmatter" then
								f20_local19 = "CoD.CamoDiamondRewardsCarouselItem"
							elseif f20_local18.camoInfo.camoRef == "camo_gold" then
								f20_local19 = "CoD.CamoGoldRewardsCarouselItem"
							else
								f20_local19 = "CoD.CamoRewardsCarouselItem"
							end
						elseif f20_local18.reticleInfo then
							f20_local19 = "CoD.ReticleRewardsCarouselItem"
						elseif f20_local18.emblemInfo then
							if f20_local18.emblemInfo.isMastery then
								f20_local19 = "CoD.MPChallengeMasterRewardsCarouselItem"
							else
								f20_local19 = "CoD.MPChallengeRewardsCarouselItem"
							end
						else
							f20_local19 = "CoD.MPChallengeRewardsCarouselItem"
						end
					elseif IsZombies() then
						if f20_local18.camoInfo then
							f20_local19 = "CoD.CamoRewardsCarouselItem"
						elseif f20_local18.reticleInfo then
							f20_local19 = "CoD.ReticleRewardsCarouselItem"
						else
							f20_local19 = "CoD.MPChallengeRewardsCarouselItem"
						end
					end
					local f20_local20 = f20_local10( f20_local18.icon, f20_local18.titleText, f20_local18.subtitleText, "challenge", f20_local19 )
					local f20_local29 = 1
					for f20_local23, f20_local24 in ipairs( {
						"specialistInfo",
						"camoInfo",
						"emblemInfo",
						"reticleInfo",
						"xpInfo"
					} ) do
						if f20_local18[f20_local24] then
							f0_local7( f20_local20, f20_local29, f20_local18[f20_local24].displayString, f20_local18[f20_local24].image, "", f20_local18[f20_local24].rewardSize == "CallingCard" )
							f20_local29 = f20_local29 + 1
						end
					end
				end
			end
		end
	end
	Engine.SetModelValue( Engine.CreateModel( f20_local3, "rewardsCarouselItemCount" ), f20_local4 )
end

CoD.AARUtility.GetRewardItemCount = function ( f24_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f24_arg0.controller ), "aarRewards.rewardsCarouselItemCount" ) )
end

CoD.AARUtility.GetModelForRewardItemByIndex = function ( f25_arg0, f25_arg1 )
	return Engine.GetModel( Engine.GetModelForController( f25_arg0 ), "aarRewards.rewardsCarouselItem" .. f25_arg1 )
end

CoD.AARUtility.AnyRewardsEarnedDuringMatch = function ( f26_arg0 )
	return IsLive() and Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f26_arg0 ), "aarRewards.rewardsCarouselItemCount" ) ) > 0
end

local f0_local8 = CoD.AARUtility
local f0_local9 = function ( f27_arg0, f27_arg1 )
	if f27_arg0.row and f27_arg1.row then
		local f27_local0 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f27_arg0.row, CoD.AARUtility.medalSortkeyCol )
		local f27_local1 = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f27_arg1.row, CoD.AARUtility.medalSortkeyCol )
		if f27_local0 and f27_local1 then
			local f27_local2 = tonumber( f27_local0 )
			local f27_local3 = tonumber( f27_local1 )
			if f27_local2 == f27_local3 then
				return f27_arg0.value < f27_arg1.value
			else
				return f27_local2 < f27_local3
			end
		end
	end
	return true
end

f0_local8.SortMedals = f0_local9
f0_local8 = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3, f28_arg4, f28_arg5 )
	local f28_local0 = CoD.AARUtility.XPBarAnimTime
	local f28_local1 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f28_arg0 ), "aarStats.performanceTabStats" ), "xpNeededToLevelUpStringRefValue" )
	local self = LUI.UITimer.new( 5, "count_down", false, f28_arg1 )
	self.currentValue = f28_arg3
	self.minValue = f28_arg4
	f28_arg1.xpNumberTimer = self
	local f28_local3 = 0
	f28_arg1:registerEventHandler( "count_down", function ( element, event )
		f28_local3 = f28_local3 + event.timeElapsed
		self.currentValue = math.floor( f28_arg3 - f28_local3 / f28_local0 * f28_arg3 )
		if self.currentValue < self.minValue or f28_local0 < f28_local3 then
			self.currentValue = self.minValue
			self:close()
			if f28_arg5 then
				f28_arg5()
			end
		end
		Engine.SetModelValue( f28_local1, self.currentValue )
	end )
	f28_arg1:addElement( f28_arg1.xpNumberTimer )
end

f0_local9 = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3, f30_arg4, f30_arg5 )
	local f30_local0 = CoD.AARUtility.XPBarAnimTime
	local f30_local1 = f30_arg1.XpBarContainer.XpBar
	local f30_local2, f30_local3 = CoD.AARUtility.GetMinMaxXPForRank( f30_arg3, f30_arg0 )
	local f30_local4 = (f30_arg2 - f30_local2) / math.max( 1, f30_local3 - f30_local2 )
	local f30_local5 = 1
	local f30_local6 = 0
	local f30_local7 = 0
	if f30_arg3 == f30_arg4 then
		f30_local5 = (f30_arg5 - f30_local2) / math.max( 1, f30_local3 - f30_local2 )
		f30_local6 = f30_local3 - f30_arg5
	end
	f30_local1.XpBarCurrXPBg:setShaderVector( 0, f30_local4, 0, 0, 0 )
	f30_local1.XpBarEarnedXPBg:setShaderVector( 0, f30_local4, 0, 0, 0 )
	f30_local1.XpBarEarnedXPBg:beginAnimation( "animate_bar", f30_local0, true, true )
	f30_local1.XpBarEarnedXPBg:setShaderVector( 0, f30_local5, 0, 0, 0 )
	Engine.PlaySound( "uin_aar_bar_fill_main" )
	f0_local8( f30_arg0, f30_arg1, f30_local1, f30_local3 - f30_arg2, f30_local6, function ()
		Engine.PlaySound( "uin_aar_bar_fill_tail" )
		if f30_arg4 <= f30_arg3 then
			if Engine.IsCampaignGame() then
				CoD.AARUtilityCP.hasSeenXPBarAnim = true
			end
			return 
		else
			f30_arg1.XpBarContainer:playClip( "Update" )
			f30_arg1.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
				local f32_local0 = math.min( CoD.MAX_RANK, f30_arg3 + 1 )
				local f32_local1, f32_local2 = CoD.AARUtility.GetMinMaxXPForRank( f32_local0, f30_arg0 )
				CoD.AARUtility.SetCurrLevelModels( f30_arg0, f32_local0 )
				CoD.AARUtility.SetNextLevelModels( f30_arg0, math.min( CoD.MAX_RANK, f32_local0 + 1 ) )
				f30_local1.XpBarCurrXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				f30_local1.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
				if IsCampaign() and f32_local0 == CoD.MAX_RANK then
					f30_arg1.XpBarContainer:playClip( "FlashLastLevel" )
				else
					f30_arg1.XpBarContainer:playClip( "FlashNextLevel" )
				end
				f30_arg1.XpBarContainer:registerEventHandler( "clip_over", function ( element, event )
					f0_local9( f30_arg0, f30_arg1, f32_local1, f32_local0, f30_arg4, f30_arg5 )
				end )
			end )
		end
	end )
end

CoD.AARUtility.DoXPBarAnimation = function ( f34_arg0, f34_arg1 )
	local f34_local0 = CoD.AARUtility.UseTestData()
	if Engine.IsCampaignGame() then
		f34_local0 = CoD.AARUtilityCP.UseTestData()
	end
	local f34_local1 = CoD.AARUtility.TestSinglePromotion()
	local f34_local2 = CoD.AARUtility.TestMultiplePromotions()
	local f34_local3, f34_local4, f34_local5, f34_local6 = nil
	if not f34_local0 then
		local f34_local7 = CoD.GetPlayerStats( f34_arg1, CoD.STATS_LOCATION_STABLE )
		if Engine.IsCampaignGame() then
			local f34_local8 = CoD.GetPlayerStats( f34_arg1 )
			f34_local3 = CoD.AARUtilityCP.GetRankForRankXP( f34_arg1, f34_local8.currentRankXP:get() )
			f34_local6 = f34_local8.PlayerStatsList.RANK.StatValue:get()
			f34_local5 = f34_local8.PlayerStatsList.RANKXP.StatValue:get()
		else
			f34_local3 = f34_local7.PlayerStatsList.RANK.StatValue:get()
			f34_local4 = f34_local7.PlayerStatsList.RANKXP.StatValue:get()
			local f34_local8 = CoD.GetPlayerStats( f34_arg1 )
			f34_local6 = f34_local8.PlayerStatsList.RANK.StatValue:get()
			f34_local5 = f34_local8.PlayerStatsList.RANKXP.StatValue:get()
		end
	end
	local f34_local7 = Engine.GetModel( Engine.GetModelForController( f34_arg1 ), "aarStats.performanceTabStats" )
	local f34_local8 = f34_arg0.XpBarContainer.XpBar
	if f34_local0 then
		if f34_local2 then
			f34_local3 = 4
			f34_local4 = 20250
			f34_local5 = 35500
			f34_local6 = 6
		elseif f34_local1 then
			f34_local3 = 5
			f34_local4 = 28500
			f34_local5 = 35500
			f34_local6 = 6
		else
			f34_local3 = 5
			f34_local4 = 28500
			f34_local5 = 31500
			f34_local6 = 5
		end
		Engine.SetModelValue( Engine.CreateModel( f34_local7, "xpEarnedDuringMatch" ), f34_local5 - f34_local4 )
	end
	if not Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f34_arg1 ), "doAARXPBarAnimation" ) ) then
		CoD.AARUtility.SetCurrLevelModels( f34_arg1, f34_local6 )
		local f34_local9 = f34_local6 + 1
		if CoD.MAX_RANK < f34_local9 then
			f34_local9 = f34_local6
		end
		if IsCampaign() and f34_local9 == f34_local6 then
			f34_local8.XpBarCurrXPBg:setShaderVector( 0, 0, 0, 0, 0 )
			f34_local8.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
			f34_arg0.XpBarContainer.RankIconAndNumberWidgetNextTop:setAlpha( 0 )
			f34_arg0.XpBarContainer.RankIconAndNumberWidgetNextBase:setAlpha( 0 )
			f34_arg0.XpBarContainer.NextLevelDisplay:setAlpha( 0 )
			f34_arg0.XpBarContainer.XpBar:setAlpha( 0 )
			f34_arg0.XpBarContainer.XpBarFrame:setAlpha( 0 )
			f34_arg0.XpBarContainer.MeterGlow:setAlpha( 0 )
			f34_arg0.XpBarContainer.XPEarnedDisplay:setAlpha( 0 )
		else
			CoD.AARUtility.SetNextLevelModels( f34_arg1, f34_local9 )
			local f34_local10, f34_local11 = CoD.AARUtility.GetMinMaxXPForRank( f34_local6, f34_arg1 )
			f34_local8.XpBarCurrXPBg:setShaderVector( 0, (f34_local5 - f34_local10) / math.max( 1, f34_local11 - f34_local10 ), 0, 0, 0 )
			f34_local8.XpBarEarnedXPBg:setShaderVector( 0, 0, 0, 0, 0 )
		end
	else
		local f34_local9, f34_local10 = CoD.AARUtility.GetMinMaxXPForRank( f34_local3, f34_arg1 )
		local f34_local11 = (f34_local4 - f34_local9) / math.max( 1, f34_local10 - f34_local9 )
		f34_local8.XpBarCurrXPBg:setShaderVector( 0, f34_local11, 0, 0, 0 )
		f34_local8.XpBarEarnedXPBg:setShaderVector( 0, f34_local11, 0, 0, 0 )
		CoD.AARUtility.SetCurrLevelModels( f34_arg1, f34_local3 )
		CoD.AARUtility.SetNextLevelModels( f34_arg1, math.min( CoD.MAX_RANK, f34_local3 + 1 ) )
		Engine.SetModelValue( Engine.CreateModel( f34_local7, "xpNeededToLevelUpStringRefValue" ), f34_local10 - f34_local4 )
		local self = LUI.UITimer.new( 1000, "start_xp_bar_animation", true, f34_arg0 )
		f34_arg0:registerEventHandler( "start_xp_bar_animation", function ()
			f0_local9( f34_arg1, f34_arg0, f34_local4, f34_local3, f34_local6, f34_local5 )
		end )
		f34_arg0:addElement( self )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f34_arg1 ), "doAARXPBarAnimation" ), false )
	end
end

