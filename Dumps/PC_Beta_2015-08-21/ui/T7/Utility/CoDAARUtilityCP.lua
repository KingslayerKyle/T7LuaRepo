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
		local f1_local0 = Dvar.last_map:get()
		if f1_local0 == nil or f1_local0 == false then
			CoD.AARUtilityCP.lastMapName = "cp_mi_cairo_infection"
			return CoD.AARUtilityCP.lastMapName
		elseif string.match( f1_local0, "[0-9]$" ) ~= nil then
			f1_local0 = string.sub( f1_local0, 0, string.len( f1_local0 ) - 1 )
		end
		CoD.AARUtilityCP.lastMapName = f1_local0
	end
	return CoD.AARUtilityCP.lastMapName
end

CoD.AARUtilityCP.GetLastMissionName = function ()
	if CoD.AARUtilityCP.lastMissionName == nil then
		CoD.AARUtilityCP.lastMissionName = string.sub( string.match( CoD.AARUtilityCP.GetLastMapName(), "_[a-z]+$" ), 2 )
	end
	return CoD.AARUtilityCP.lastMissionName
end

CoD.AARUtilityCP.UseTestData = function ()
	return false
end

CoD.AARUtilityCP.UpdateDatasourcesForScoreboard = function ( f4_arg0, f4_arg1 )
	if f4_arg1 == nil then
		return 
	else
		f4_arg1.ScoreboardWidgetCP0.team1List.Team1:setWidgetType( CoD.ScoreboardRowWidgetCP )
		f4_arg1.ScoreboardWidgetCP0.team1List.Team1:setDataSource( "ScoreboardTeam1List" )
		f4_arg1.ScoreboardWidgetCP0.team1List.Team1:updateDataSource()
	end
end

local f0_local0 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = CoD.AARUtilityCP.UseTestData()
	local f5_local1, f5_local2 = nil
	f5_local2 = CoD.GetPlayerStats( f5_arg0 )
	if f5_local0 then
		f5_local1 = CoD.GetPlayerStats( f5_arg0 )
	else
		f5_local1 = CoD.GetPlayerStats( f5_arg0 )
	end
	return f5_local2.PlayerStatsList[f5_arg1].StatValue:get() - f5_local1.PlayerStatsList[f5_arg1].StatValue:get()
end

local f0_local1 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = CoD.AARUtilityCP.GetLastMapName()
	local f6_local1 = CoD.GetPlayerStats( f6_arg0 )
	return f6_local1.PlayerStatsByMap[f6_local0].highestStats[f6_arg1]:get()
end

local f0_local2 = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = CoD.AARUtilityCP.GetLastMapName()
	local f7_local1 = CoD.GetPlayerStats( f7_arg0 )
	f7_local1.PlayerStatsByMap[f7_local0].highestStats[f7_arg1]:set( f7_arg2 )
end

CoD.AARUtilityCP.GetScoreboardTeamTable = function ( f8_arg0, f8_arg1 )
	local f8_local0 = Engine.GetTeamPositions( f8_arg0, Engine.GetCurrentTeamCount() )
	if Engine.GetCurrentTeamCount() < 2 and f8_arg1 == 2 then
		return {}
	end
	local f8_local1 = f8_local0[f8_arg1].team
	local f8_local2 = 0
	local f8_local3 = 0
	if f8_local1 ~= Enum.team_t.TEAM_FREE then
		f8_local2 = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES )
		f8_local3 = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_AXIS )
	else
		f8_local2 = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_FREE )
	end
	local f8_local4 = math.max( CoD.ScoreboardUtility.MinRowsToShowOnEachTeam, math.max( f8_local2, f8_local3 ) )
	local f8_local5 = Engine.GetPlayerStats( f8_arg0 )
	local f8_local6 = {}
	local f8_local7 = Engine.CreateModel( Engine.GetModelForController( f8_arg0 ), "scoreboardInfo" )
	local f8_local8 = {}
	for f8_local9 = 1, f8_local4, 1 do
		local f8_local12 = "team: " .. f8_local1 .. " client: " .. f8_local9 - 1
		local f8_local13 = -1
		if Engine.GetScoreboardTeamClientCount( f8_local1 ) < f8_local9 then
			f8_local12 = "team: " .. f8_local1 .. " client: -1"
		else
			f8_local13 = Engine.GetScoreboardPlayerData( f8_local9 - 1, f8_local1, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_CLIENTNUM )
		end
		f8_local12 = f8_local12 .. " " .. Engine.milliseconds()
		table.insert( f8_local8, {
			models = {
				team = f8_local1,
				clientNum = tonumber( f8_local13 ),
				score = f8_local5.AfterActionReportStats.playerStats[f8_local9 - 1].score:get(),
				kills = f8_local5.AfterActionReportStats.playerStats[f8_local9 - 1].kills:get(),
				deaths = f8_local5.AfterActionReportStats.playerStats[f8_local9 - 1].deaths:get(),
				assists = f8_local5.AfterActionReportStats.playerStats[f8_local9 - 1].assists:get(),
				revives = f8_local5.AfterActionReportStats.playerStats[f8_local9 - 1].revives:get()
			}
		} )
	end
	return f8_local8
end

CoD.AARUtilityCP.SetupUIModels = function ( f9_arg0 )
	local f9_local0 = CoD.AARUtilityCP.UseTestData()
	local f9_local1, f9_local2 = nil
	if f9_local0 then
		f9_local1 = CoD.GetPlayerStats( f9_arg0 )
	else
		f9_local1 = CoD.GetPlayerStats( f9_arg0 )
	end
	local f9_local3 = CoD.GetPlayerStats( f9_arg0 )
	local f9_local4 = f9_local3.PlayerStatsList.RANK.StatValue:get()
	local f9_local5 = f9_local3.PlayerStatsList.PLEVEL.StatValue:get()
	local f9_local6 = CoD.AARUtilityCP.GetXPEarnedDuringMatch( f9_local3.PlayerStatsList.RANKXP.StatValue:get(), f9_local1.PlayerStatsList.RANKXP.StatValue:get() )
	local f9_local7 = f9_local3.AfterActionReportStats
	local f9_local8 = {}
	f9_local8.nextLevel, f9_local8.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( f9_local4 + 1, f9_local5 + 1 )
	if f9_local0 then
		f9_local8.kills = 24
		f9_local8.assists = 14
		f9_local8.score = 11550
		f9_local8.revives = 3
		f9_local8.incaps = 2
		f9_local8.completionTime = 1184
		f9_local8.showBestScoreIcon = 1
		f9_local8.showBestKillsIcon = 1
		f9_local8.showBestCompletionTimeIcon = 1
		f9_local8.showBestIncapsIcon = 1
		f9_local8.showBestAssistsIcon = 1
		f9_local8.showBestRevivesIcon = 1
	else
		f9_local8.kills = f0_local0( f9_arg0, "KILLS" )
		f9_local8.assists = f0_local0( f9_arg0, "ASSISTS" )
		f9_local8.score = f0_local0( f9_arg0, "SCORE" )
		f9_local8.revives = f0_local0( f9_arg0, "REVIVES" )
		f9_local8.incaps = f0_local0( f9_arg0, "INCAPS" )
		f9_local8.completionTime = f0_local0( f9_arg0, "TIME_PLAYED_TOTAL" )
		f9_local8.showBestScoreIcon = 0
		f9_local8.showBestKillsIcon = 0
		f9_local8.showBestCompletionTimeIcon = 0
		f9_local8.showBestIncapsIcon = 0
		f9_local8.showBestAssistsIcon = 0
		f9_local8.showBestRevivesIcon = 0
		local f9_local9 = f0_local1( f9_arg0, "HIGHEST_SCORE" )
		local f9_local10 = f0_local1( f9_arg0, "HIGHEST_KILLS" )
		local f9_local11 = f0_local1( f9_arg0, "BEST_COMPLETION_TIME" )
		local f9_local12 = f0_local1( f9_arg0, "HIGHEST_ASSISTS" )
		local f9_local13 = f0_local1( f9_arg0, "HIGHEST_REVIVES" )
		local f9_local14 = f0_local1( f9_arg0, "BEST_INCAPS" )
		if f9_local9 < f9_local8.score and f9_local9 ~= nil then
			f9_local8.showBestScoreIcon = 1
			f0_local2( f9_arg0, "HIGHEST_SCORE", f9_local8.score )
		end
		if f9_local10 < f9_local8.kills and f9_local10 ~= nil then
			f9_local8.showBestKillsIcon = 1
			f0_local2( f9_arg0, "HIGHEST_KILLS", f9_local8.kills )
		end
		if f9_local8.completionTime < f9_local11 and f9_local11 ~= nil then
			f9_local8.showBestCompletionTimeIcon = 1
			f0_local2( f9_arg0, "BEST_COMPLETION_TIME", f9_local8.completionTime )
		end
		if f9_local12 < f9_local8.assists and f9_local12 ~= nil then
			f9_local8.showBestAssistsIcon = 1
			f0_local2( f9_arg0, "HIGHEST_ASSISTS", f9_local8.assists )
		end
		if f9_local13 < f9_local8.revives and f9_local13 ~= nil then
			f9_local8.showBestRevivesIcon = 1
			f0_local2( f9_arg0, "HIGHEST_REVIVES", f9_local8.revives )
		end
		if f9_local8.incaps < f9_local14 and f9_local14 ~= nil then
			f9_local8.showBestIncapsIcon = 1
			f0_local2( f9_arg0, "HIGHEST_ASSISTS", f9_local8.assists )
		end
	end
	f9_local8.xpEarnedDuringMatch = f9_local6
	local f9_local9 = Engine.CreateModel( Engine.GetModelForController( f9_arg0 ), "aarStats.performanceTabStats" )
	for f9_local13, f9_local14 in pairs( f9_local8 ) do
		Engine.SetModelValue( Engine.CreateModel( f9_local9, f9_local13 ), f9_local14 )
	end
end

CoD.AARUtilityCP.GetXPEarnedDuringMatch = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg0 - f10_arg1
	if f10_local0 < 0 then
		f10_local0 = 0
	end
	return f10_local0
end

CoD.AARUtilityCP.CreateModelsForRewards = function ( f11_arg0 )
	local f11_local0 = CoD.AARUtilityCP.UseTestData()
	local f11_local1 = Engine.CreateModel( Engine.GetModelForController( f11_arg0 ), "aarRewards" )
	local f11_local2 = CoD.AARUtilityCP.GetRewardItemCount( f11_arg0 )
	for f11_local3 = 1, f11_local2, 1 do
		local f11_local6 = CoD.AARUtilityCP.Rewards[f11_local3]
		local f11_local7 = Engine.CreateModel( f11_local1, f11_local3 .. "" )
		Engine.SetModelValue( Engine.CreateModel( f11_local7, "rewardCarouselItemImage" ), f11_local6.reward.icon )
		Engine.SetModelValue( Engine.CreateModel( f11_local7, "rewardCarouselItemTitle" ), f11_local6.reward.title )
		Engine.SetModelValue( Engine.CreateModel( f11_local7, "rewardCarouselItemSubtitle" ), f11_local6.reward.description )
		Engine.SetModelValue( Engine.CreateModel( f11_local7, "reward1InfoVisible" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f11_local7, "reward2InfoVisible" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f11_local7, "reward3InfoVisible" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f11_local7, "reward4InfoVisible" ), 0 )
		if f11_local6.reward.Rewards ~= nil and f11_local6.reward.Rewards.count ~= nil then
			for f11_local8 = 1, f11_local6.reward.Rewards.count, 1 do
				local f11_local11 = Engine.CreateModel( f11_local7, "reward" .. f11_local8 .. "Info" )
				local f11_local12 = f11_local6.reward.Rewards[f11_local8]
				Engine.SetModelValue( Engine.CreateModel( f11_local11, "rewardName" ), f11_local12.name )
				Engine.SetModelValue( Engine.CreateModel( f11_local11, "rewardImage" ), f11_local12.icon )
				Engine.SetModelValue( Engine.CreateModel( f11_local11, "rewardDesc" ), f11_local12.description )
				Engine.SetModelValue( Engine.CreateModel( f11_local7, "reward" .. f11_local8 .. "InfoVisible" ), 1 )
			end
		end
	end
end

CoD.AARUtilityCP.GetModelForRewardItemByIndex = function ( f12_arg0, f12_arg1 )
	return Engine.GetModel( Engine.GetModelForController( f12_arg0 ), "aarRewards." .. f12_arg1 )
end

local f0_local3 = function ( f13_arg0, f13_arg1 )
	if f13_arg0.count == nil then
		f13_arg0.count = 0
	end
	f13_arg0.count = f13_arg0.count + 1
	f13_arg0[f13_arg0.count] = f13_arg1
end

local f0_local4 = function ()
	CoD.AARUtilityCP.Rewards = {}
	CoD.AARUtilityCP.Rewards.count = 0
end

local f0_local5 = function ( f15_arg0, f15_arg1 )
	f0_local3( CoD.AARUtilityCP.Rewards, {
		type = f15_arg1,
		reward = f15_arg0
	} )
end

local f0_local6 = function ( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = Engine.TableLookup( f16_arg0, CoD.rankTable, 0, f16_arg1.rank, f16_arg2 )
	if f16_arg1.Rewards == nil then
		f16_arg1.Rewards = {}
	end
	for f16_local5 in f16_local0:gmatch( "%S+" ) do
		local f16_local6 = {}
		if f16_local5 == "token" then
			f16_local6.name = ""
			f16_local6.description = "MPUI_UNLOCK_TOKEN"
			f16_local6.icon = "uie_img_t7_menu_cacselection_icontokenlarge"
		else
			local f16_local4 = Engine.TableLookup( f16_arg0, CoD.statsTable, 4, f16_local5, 6 ) .. "_kf"
			f16_local6.name = Engine.TableLookup( f16_arg0, CoD.statsTable, 4, f16_local5, 3 )
			f16_local6.description = Engine.TableLookup( f16_arg0, CoD.statsTable, 4, f16_local5, 7 )
			f16_local6.icon = f16_local4
		end
		f0_local3( f16_arg1.Rewards, f16_local6 )
	end
end

local f0_local7 = function ( f17_arg0, f17_arg1, f17_arg2 )
	local f17_local0 = CoD.AARUtilityCP.UseTestData()
	local f17_local1 = 8
	local f17_local2 = 12
	local f17_local3 = 17
	if f17_local0 then
		local f17_local4 = {
			icon = "rank_lcpl_128",
			title = "SOME HIGH RANK",
			description = "Level Someting",
			rank = 1
		}
		for f17_local5 = f17_local1, f17_local2, 1 do
			f0_local6( f17_arg0, f17_local4, f17_local5 )
		end
		f0_local6( f17_arg0, f17_local4, f17_local3 )
		f0_local5( f17_local4, "RANK" )
	else
		local f17_local4 = f0_local0( f17_arg0, "RANK" )
		if f17_local4 > 0 then
			local f17_local5 = 8
			local f17_local6 = 12
			local f17_local7 = f17_arg2.PlayerStatsList.RANK.StatValue:get()
			for f17_local8 = 1, f17_local4, 1 do
				local f17_local11 = {
					icon = "t7_icon_rank_cp_level_" .. string.format( "%02d", f17_local7 + f17_local8 + 1 ) .. "_lrg",
					title = Engine.GetRankName( f17_local7 + f17_local8 + 1 ),
					description = Engine.Localize( "MENU_LEVEL" ) .. " " .. f17_local7 + f17_local8 + 1,
					rank = f17_local7 + f17_local8
				}
				for f17_local12 = f17_local5, f17_local6, 1 do
					f0_local6( f17_arg0, f17_local11, f17_local12 )
				end
				f0_local6( f17_arg0, f17_local11, f17_local3 )
				f0_local5( f17_local11, "RANK" )
			end
		end
	end
end

local f0_local8 = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
	local f18_local0 = Engine.TableLookup( f18_arg0, CoD.gunLevelsTable, 2, f18_arg2, 0, f18_arg3, 3 )
	local f18_local1 = Engine.TableLookup( f18_arg0, CoD.gunLevelsTable, 2, f18_arg2, 0, f18_arg3, 4 )
	if f18_arg1.Rewards == nil then
		f18_arg1.Rewards = {}
	end
	if f18_local0 ~= nil and f18_local0 ~= "" then
		f0_local3( f18_arg1.Rewards, {
			name = Engine.TableLookup( f18_arg0, CoD.attachmentTable, 4, f18_local0, 3 ),
			icon = Engine.TableLookup( f18_arg0, CoD.attachmentTable, 4, f18_local0, 6 ),
			description = "Attachment"
		} )
	end
	if f18_local1 ~= nil and f18_local1 ~= "0" then
		f0_local3( f18_arg1.Rewards, {
			name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( f18_local1 ) ) ),
			icon = "",
			description = ""
		} )
	end
end

local f0_local9 = function ( f19_arg0, f19_arg1, f19_arg2 )
	if CoD.AARUtilityCP.UseTestData() then
		local f19_local0 = {
			icon = "t7_icon_weapon_ar_standard_sm",
			title = "ARAK 74",
			description = "Level 2"
		}
		f0_local8( f19_arg0, f19_local0, "ar_standard", 2 )
		f0_local5( f19_local0, "WEAPON" )
	else
		for f19_local0 = 1, 58, 1 do
			local f19_local3 = Engine.TableLookup( f19_arg0, CoD.statsTable, 0, f19_local0, 4 )
			if f19_local3 ~= nil and f19_local3 ~= "" then
				local f19_local4 = Engine.TableLookup( f19_arg0, CoD.statsTable, 0, f19_local0, 3 )
				local f19_local5 = Engine.GetGunCurrentRank( f19_arg0, f19_local0 )
				local f19_local6 = Engine.GetGunStableRank( f19_arg0, f19_local0 )
				local f19_local7 = f19_local5 - f19_local6
				if f19_local7 > 0 then
					for f19_local8 = 1, f19_local7, 1 do
						local f19_local11 = {
							icon = Engine.TableLookup( f19_arg0, CoD.statsTable, 0, f19_local0, 6 ),
							title = f19_local4,
							description = "Level " .. f19_local6 + f19_local8
						}
						f0_local8( f19_arg0, f19_local11, f19_local3, f19_local6 + f19_local8 )
						f0_local5( f19_local11, "WEAPON" )
					end
				end
			end
		end
	end
end

local f0_local10 = function ( f20_arg0, f20_arg1 )
	if CoD.AARUtilityCP.UseTestData() then
		return tonumber( Engine.TableLookup( controllerNum, CoD.statsMilestone, 0, f20_arg1, 2 ) )
	else
		return f20_arg0.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[f20_arg1]:get() << 3 >> 3
	end
end

local f0_local11 = function ( f21_arg0, f21_arg1 )
	if CoD.AARUtilityCP.UseTestData() then
		return CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_NOT_SEEN
	else
		return (f21_arg0.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[f21_arg1]:get() & CoD.AARUtilityCP.ACCOLADE_STATE_MASK) >> CoD.AARUtilityCP.ACCOLADE_STATE_BITS
	end
end

local f0_local12 = function ( f22_arg0, f22_arg1, f22_arg2 )
	f22_arg0.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[f22_arg1]:set( f0_local10( f22_arg0, f22_arg1 ) | f22_arg2 << CoD.AARUtilityCP.ACCOLADE_STATE_BITS )
end

local f0_local13 = function ( f23_arg0, f23_arg1, f23_arg2 )
	local f23_local0 = f0_local11( f23_arg0, f23_arg1 )
	f23_arg0.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[f23_arg1]:set( f23_local0 | f23_local0 << CoD.AARUtilityCP.ACCOLADE_STATE_BITS )
end

local f0_local14 = function ( f24_arg0, f24_arg1, f24_arg2 )
	if CoD.AARUtilityCP.UseTestData() then
		f0_local5( {
			icon = "uie_headicon_dead",
			title = "Accolade",
			description = "Can't Touch This"
		}, "ACCOLADE" )
	else
		local f24_local0 = "MISSION_"
		local f24_local1 = CoD.AARUtilityCP.GetLastMissionName()
		f24_local1 = Engine.TableLookup( f24_arg0, CoD.statsMilestone, 4, f24_local0 .. f24_local1:upper() .. "_UNTOUCHED", 0 )
		for f24_local2 = 0, 18, 1 do
			local f24_local5 = f0_local11( f24_arg1, f24_local2 )
			if f24_local5 ~= CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_SEEN then
				if f24_local5 == CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_NOT_SEEN then
					f0_local5( {
						icon = "uie_headicon_dead",
						title = "Accolade",
						description = Engine.TableLookup( f24_arg0, CoD.statsMilestone, 0, f24_local2 + f24_local1, 5 )
					}, "ACCOLADE" )
					f0_local12( f24_arg1, f24_local2, CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_SEEN )
				else
					f0_local13( f24_arg1, f24_local2, 0 )
				end
			end
		end
	end
end

CoD.AARUtilityCP.GetRewardItemCount = function ( f25_arg0 )
	local f25_local0 = f25_arg0
	if type( f25_local0 ) ~= "number" then
		f25_local0 = f25_arg0.controller
	end
	if CoD.AARUtilityCP.Rewards == nil then
		f0_local4()
		local f25_local1 = CoD.GetPlayerStats( f25_local0 )
		local f25_local2 = CoD.GetPlayerStats( f25_local0 )
		f0_local7( f25_local0, f25_local1, f25_local2 )
		f0_local9( f25_local0, f25_local1, f25_local2 )
		f0_local14( f25_local0, f25_local1, f25_local2 )
		UploadStats( self, f25_arg0 )
	end
	return CoD.AARUtilityCP.Rewards.count
end

