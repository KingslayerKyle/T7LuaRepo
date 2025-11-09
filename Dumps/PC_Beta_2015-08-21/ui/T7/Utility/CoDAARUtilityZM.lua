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

local f0_local0 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = CoD.AARUtilityZM.UseTestData()
	local f2_local1, f2_local2 = nil
	f2_local2 = CoD.GetPlayerStats( f2_arg0 )
	if f2_local0 then
		f2_local1 = CoD.GetPlayerStats( f2_arg0 )
	else
		f2_local1 = CoD.GetPlayerStats( f2_arg0, CoD.STATS_LOCATION_STABLE )
	end
	return f2_local2.PlayerStatsList[f2_arg1].StatValue:get() - f2_local1.PlayerStatsList[f2_arg1].StatValue:get()
end

local f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = "cp_mi_cairo_aquifer"
	local f3_local1 = CoD.GetPlayerStats( f3_arg0 )
	return f3_local1.PlayerHighestStatsByMap[f3_local0][f3_arg1]:get()
end

CoD.AARUtilityZM.SetupUIModels = function ( f4_arg0 )
	local f4_local0 = CoD.AARUtilityZM.UseTestData()
	local f4_local1 = nil
	if f4_local0 then
		f4_local1 = CoD.GetPlayerStats( f4_arg0 )
	else
		f4_local1 = CoD.GetPlayerStats( f4_arg0, CoD.STATS_LOCATION_STABLE )
	end
	local f4_local2 = CoD.GetPlayerStats( f4_arg0 )
	local f4_local3 = f4_local1.PlayerStatsList.RANKXP.StatValue:get()
	local f4_local4 = f4_local2.PlayerStatsList.RANK.StatValue:get()
	local f4_local5 = f4_local2.PlayerStatsList.PLEVEL.StatValue:get()
	local f4_local6 = CoD.AARUtilityZM.GetXPEarnedDuringMatch( f4_local2.PlayerStatsList.RANKXP.StatValue:get(), f4_local3 )
	local f4_local7 = f4_local2.AfterActionReportStats
	local f4_local8 = {}
	f4_local8.nextLevel, f4_local8.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( f4_local4 + 1, f4_local5 + 1 )
	if f4_local0 then
		f4_local8.kills = 24
		f4_local8.score = 4550
		f4_local8.headshots = 12
		f4_local8.meleeKills = 13
		f4_local8.pointsPerKill = 110.9
		f4_local8.revives = 3
		f4_local8.showBestScoreIcon = 1
		f4_local8.showBestStyleIcon = 1
		f4_local8.showBestRoundIcon = 1
	else
		f4_local8.kills = f0_local0( f4_arg0, "KILLS" )
		f4_local8.score = f0_local0( f4_arg0, "SCORE" )
		f4_local8.headshots = f0_local0( f4_arg0, "HEADSHOTS" )
		f4_local8.revives = f0_local0( f4_arg0, "REVIVES" )
		f4_local8.downs = f0_local0( f4_arg0, "DOWNS" )
		f4_local8.meleeKills = f0_local0( f4_arg0, "MELEE_KILLS" )
		f4_local8.pointsPerKill = f0_local0( f4_arg0, "TOTAL_SHOTS" )
		f4_local8.showBestScoreIcon = 1
		f4_local8.showBestStyleIcon = 0
		f4_local8.showBestRoundIcon = 1
	end
	f4_local8.xpEarnedDuringMatch = f4_local6
	local f4_local9 = Engine.CreateModel( Engine.GetModelForController( f4_arg0 ), "aarStats.performanceTabStats" )
	for f4_local13, f4_local14 in pairs( f4_local8 ) do
		Engine.SetModelValue( Engine.CreateModel( f4_local9, f4_local13 ), f4_local14 )
	end
end

CoD.AARUtilityZM.GetXPEarnedDuringMatch = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0 - f5_arg1
	if f5_local0 < 0 then
		f5_local0 = 0
	end
	return f5_local0
end

CoD.AARUtilityZM.CreateModelsForRewards = function ( f6_arg0 )
	local f6_local0 = CoD.AARUtilityZM.UseTestData()
	local f6_local1 = Engine.CreateModel( Engine.GetModelForController( f6_arg0 ), "aarRewards" )
	if f6_local0 then
		local f6_local2 = CoD.AARUtilityZM.GetRewardItemCount( f6_arg0 )
		for f6_local3 = 1, f6_local2, 1 do
			local f6_local6 = Engine.CreateModel( f6_local1, f6_local3 .. "" )
			Engine.SetModelValue( Engine.CreateModel( f6_local6, "rewardCarouselItemImage" ), "uie_headicon_dead" )
			Engine.SetModelValue( Engine.CreateModel( f6_local6, "rewardCarouselItemTitle" ), "Master Sergeant" )
			Engine.SetModelValue( Engine.CreateModel( f6_local6, "rewardCarouselItemSubtitle" ), "Level 10" )
			local f6_local7 = 4
			for f6_local8 = 1, f6_local7, 1 do
				local f6_local11 = Engine.CreateModel( f6_local6, "reward" .. f6_local8 .. "Info" )
				Engine.SetModelValue( Engine.CreateModel( f6_local11, "rewardName" ), "Semtex" )
				Engine.SetModelValue( Engine.CreateModel( f6_local11, "rewardImage" ), "uie_headicon_dead" )
				Engine.SetModelValue( Engine.CreateModel( f6_local11, "rewardDesc" ), "Lethal Blueprint" )
			end
		end
	end
end

CoD.AARUtilityZM.GetModelForRewardItemByIndex = function ( f7_arg0, f7_arg1 )
	return Engine.GetModel( Engine.GetModelForController( f7_arg0 ), "aarRewards." .. f7_arg1 )
end

CoD.AARUtilityZM.GetRewardItemCount = function ( f8_arg0 )
	if CoD.AARUtilityZM.UseTestData() then
		return 3
	else
		return 0
	end
end

CoD.AARUtilityZM.CreateQuestItemModels = function ( f9_arg0 )
	local f9_local0 = Engine.CreateModel( Engine.GetModelForController( f9_arg0 ), "aarQuests" )
end

