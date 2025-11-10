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
CoD.AARUtilityCP.GetLastMapName = function ()
	if CoD.AARUtilityCP.lastMapName == nil then
		local f1_local0 = Dvar.last_map:get()
		if f1_local0 == nil or f1_local0 == false then
			return Dvar.ui_mapname:get()
		end
		CoD.AARUtilityCP.lastMapName = CoD.mapsTable[f1_local0].rootMapName
	end
	return CoD.AARUtilityCP.lastMapName
end

CoD.AARUtilityCP.GetLastMissionName = function ()
	if CoD.AARUtilityCP.lastMissionName == nil then
		CoD.AARUtilityCP.lastMissionName = CoD.mapsTable[CoD.AARUtilityCP.GetLastMapName()].missionName
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
	local f5_local0 = nil
	f5_local0 = CoD.GetPlayerStats( f5_arg0 )
	local f5_local1 = f5_local0.PlayerStatsList[f5_arg1].StatValue:get()
	local f5_local2 = f5_local0.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].currentStats[f5_arg1]:get()
	local f5_local3 = math.floor( f5_local1 )
	local f5_local4 = math.floor( f5_local2 )
	if f5_local3 < f5_local4 then
		DebugPrint( "CoDAARUtilityCP: GetMatchStat was going to be negative!" )
		DebugPrint( "\n PlayerStatsList[" .. f5_arg1 .. "].statValue:get() == " .. f5_local1 )
		DebugPrint( "\n PlayerStatsByMap[currentmap].currentStats[" .. f5_arg1 .. "]:get() == " .. f5_local2 )
		return 0
	else
		return f5_local3 - f5_local4
	end
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

local f0_local3 = function ( f8_arg0, f8_arg1 )
	if f8_arg0.count == nil then
		f8_arg0.count = 0
	end
	f8_arg0.count = f8_arg0.count + 1
	f8_arg0[f8_arg0.count] = f8_arg1
end

local f0_local4 = function ( f9_arg0 )
	f9_arg0 = {
		count = 0
	}
end

local f0_local5 = function ( f10_arg0, f10_arg1, f10_arg2 )
	f0_local3( f10_arg0, {
		type = f10_arg2,
		reward = f10_arg1
	} )
end

CoD.AARUtilityCP.GetScoreboardTeamTable = function ( f11_arg0, f11_arg1 )
	local f11_local0 = Engine.GetTeamPositions( f11_arg0, Engine.GetCurrentTeamCount() )
	if Engine.GetCurrentTeamCount() < 2 and f11_arg1 == 2 then
		return {}
	end
	local f11_local1 = f11_local0[f11_arg1].team
	local f11_local2 = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES )
	local f11_local3 = Engine.GetPlayerStats( f11_arg0 )
	local f11_local4 = {}
	local f11_local5 = Engine.CreateModel( Engine.GetModelForController( f11_arg0 ), "scoreboardInfo" )
	local f11_local6 = {}
	for f11_local7 = 1, f11_local2, 1 do
		local f11_local10 = "team: " .. f11_local1 .. " client: " .. f11_local7 - 1
		local f11_local11 = -1
		if Engine.GetScoreboardTeamClientCount( f11_local1 ) < f11_local7 then
			f11_local10 = "team: " .. f11_local1 .. " client: -1"
		else
			f11_local11 = Engine.GetScoreboardPlayerData( f11_local7 - 1, f11_local1, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_CLIENTNUM )
		end
		f11_local10 = f11_local10 .. " " .. Engine.milliseconds()
		local f11_local12 = {
			models = {
				team = f11_local1,
				clientNum = tonumber( f11_local11 ),
				score = f11_local3.AfterActionReportStats.playerStats[f11_local11].score:get(),
				kills = f11_local3.AfterActionReportStats.playerStats[f11_local11].kills:get(),
				deaths = f11_local3.AfterActionReportStats.playerStats[f11_local11].deaths:get(),
				assists = f11_local3.AfterActionReportStats.playerStats[f11_local11].assists:get(),
				revives = f11_local3.AfterActionReportStats.playerStats[f11_local11].revives:get()
			}
		}
		f11_local12.models.ping = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1." .. f11_local11 .. ".ping" ) )
		table.insert( f11_local6, f11_local12 )
	end
	return f11_local6
end

CoD.AARUtilityCP.SetupUIModels = function ( f12_arg0 )
	local f12_local0 = CoD.AARUtilityCP.UseTestData()
	local f12_local1 = nil
	local f12_local2 = CoD.GetPlayerStats( f12_arg0 )
	local f12_local3 = f12_local2.PlayerStatsList.RANK.StatValue:get()
	local f12_local4 = f12_local2.PlayerStatsList.PLEVEL.StatValue:get()
	local f12_local5 = CoD.AARUtilityCP.GetXPEarnedDuringMatch( f12_local2.PlayerStatsList.RANKXP.StatValue:get(), f12_local2.currentRankXP:get() )
	local f12_local6 = CoD.AARUtilityCP.GetLastMapName()
	local f12_local7 = f12_local2.AfterActionReportStats
	local f12_local8 = {}
	f12_local8.nextLevel, f12_local8.nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( f12_local3 + 1, f12_local4 + 1 )
	if f12_local0 then
		f12_local8.kills = 24
		f12_local8.assists = 14
		f12_local8.score = 11550
		f12_local8.revives = 3
		f12_local8.incaps = 2
		f12_local8.difficulty = 1
		f12_local8.showBestScoreIcon = 1
		f12_local8.showBestKillsIcon = 1
		f12_local8.showBestCompletionTimeIcon = 1
		f12_local8.showBestIncapsIcon = 1
		f12_local8.showBestAssistsIcon = 1
		f12_local8.showBestRevivesIcon = 1
	else
		f12_local8.kills = f0_local0( f12_arg0, "KILLS" )
		f12_local8.assists = f0_local0( f12_arg0, "ASSISTS" )
		f12_local8.score = f0_local0( f12_arg0, "SCORE" )
		f12_local8.revives = f0_local0( f12_arg0, "REVIVES" )
		f12_local8.incaps = f0_local0( f12_arg0, "INCAPS" )
		f12_local8.difficulty = f12_local2.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].lastCompletedDifficulty:get()
		f12_local8.showBestScoreIcon = 0
		f12_local8.showBestKillsIcon = 0
		f12_local8.showBestDifficultyIcon = 0
		f12_local8.showBestIncapsIcon = 0
		f12_local8.showBestAssistsIcon = 0
		f12_local8.showBestRevivesIcon = 0
		local f12_local9 = f0_local1( f12_arg0, "SCORE" )
		local f12_local10 = f0_local1( f12_arg0, "KILLS" )
		local f12_local11 = f0_local1( f12_arg0, "ASSISTS" )
		local f12_local12 = f0_local1( f12_arg0, "REVIVES" )
		local f12_local13 = f0_local1( f12_arg0, "INCAPS" )
		local f12_local14 = f0_local1( f12_arg0, "HIGHEST_DIFFICULTY" )
		if f12_local9 < f12_local8.score and f12_local9 ~= nil then
			f12_local8.showBestScoreIcon = 1
		end
		if f12_local10 < f12_local8.kills and f12_local10 ~= nil then
			f12_local8.showBestKillsIcon = 1
		end
		if f12_local11 < f12_local8.assists and f12_local11 ~= nil then
			f12_local8.showBestAssistsIcon = 1
		end
		if f12_local12 < f12_local8.revives and f12_local12 ~= nil then
			f12_local8.showBestRevivesIcon = 1
		end
		if f12_local8.incaps < f12_local13 and f12_local13 ~= nil then
			f12_local8.showBestIncapsIcon = 1
		end
		if f12_local14 < f12_local8.difficulty then
			f12_local8.showBestDifficultyIcon = 1
		end
	end
	f12_local8.xpEarnedDuringMatch = f12_local5
	local f12_local9 = Engine.CreateModel( Engine.GetModelForController( f12_arg0 ), "aarStats.performanceTabStats" )
	for f12_local13, f12_local14 in pairs( f12_local8 ) do
		Engine.SetModelValue( Engine.CreateModel( f12_local9, f12_local13 ), f12_local14 )
	end
end

CoD.AARUtilityCP.GetXPEarnedDuringMatch = function ( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg0 - f13_arg1
	if f13_local0 < 0 then
		f13_local0 = 0
	end
	return f13_local0
end

CoD.AARUtilityCP.GetModelForRewardItemByIndex = function ( f14_arg0, f14_arg1 )
	return Engine.GetModel( Engine.GetModelForController( f14_arg0 ), "aarRewards." .. f14_arg1 )
end

local f0_local6 = function ( f15_arg0, f15_arg1, f15_arg2 )
	local f15_local0 = Engine.TableLookup( f15_arg0, CoD.rankTable, 0, f15_arg1.rank, f15_arg2 )
	if f15_arg1.Rewards == nil then
		f15_arg1.Rewards = {}
	end
	for f15_local6 in f15_local0:gmatch( "%S+" ) do
		local f15_local7 = {}
		if f15_local6 == "token" then
			local f15_local4 = 1
			local f15_local5 = Engine.TableLookup( f15_arg0, CoD.rankTable, 0, f15_arg1.rank, 18 )
			if f15_local5 ~= nil and f15_local5 ~= "" then
				f15_local4 = f15_local4 + tonumber( f15_local5 )
			end
			f15_local7.name = Engine.Localize( "CPUI_ADD_UNLOCK_TOKENS", f15_local4 )
			f15_local7.description = ""
			f15_local7.icon = CoD.AARUtilityCP.UnlockTokenIcon
		else
			local f15_local4 = Engine.TableLookup( f15_arg0, CoD.statsTable, 4, f15_local6, 6 ) .. "_rwd"
			if string.find( f15_local6, "cybercom" ) then
				f15_local4 = Engine.TableLookup( f15_arg0, CoD.statsTable, 4, f15_local6, 6 )
			end
			f15_local7.name = Engine.TableLookup( f15_arg0, CoD.statsTable, 4, f15_local6, 3 )
			f15_local7.description = Engine.TableLookup( f15_arg0, CoD.statsTable, 4, f15_local6, 18 )
			f15_local7.icon = f15_local4
		end
		f0_local3( f15_arg1.Rewards, f15_local7 )
	end
end

CoD.AARUtilityCP.GetRankForRankXP = function ( f16_arg0, f16_arg1 )
	for f16_local0 = 0, 19, 1 do
		if f16_arg1 < tonumber( Engine.TableLookup( f16_arg0, CoD.rankTable, 0, f16_local0, 7 ) ) then
			return f16_local0
		end
	end
	return 19
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
		f0_local5( f17_arg2, f17_local4, "RANK" )
	elseif f17_arg1 and f17_arg1.currentRankXP then
		local f17_local5 = CoD.AARUtilityCP.GetRankForRankXP( f17_arg0, f17_arg1.currentRankXP:get() )
		local f17_local7 = f17_arg1.PlayerStatsList.RANK.statValue:get() - f17_local5
		if f17_local7 > 0 then
			local f17_local8 = 8
			local f17_local9 = 12
			for f17_local10 = 1, f17_local7, 1 do
				local f17_local13 = {
					icon = "t7_icon_rank_cp_level_" .. string.format( "%02d", f17_local5 + f17_local10 + 1 ) .. "_lrg",
					title = Engine.GetRankName( f17_local5 + f17_local10 ),
					description = Engine.Localize( "MENU_LEVEL" ) .. " " .. f17_local5 + f17_local10 + 1,
					rank = f17_local5 + f17_local10
				}
				for f17_local14 = f17_local8, f17_local9, 1 do
					f0_local6( f17_arg0, f17_local13, f17_local14 )
				end
				f0_local6( f17_arg0, f17_local13, f17_local3 )
				f0_local5( f17_arg2, f17_local13, "RANK" )
			end
		end
	end
end

local f0_local8 = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	if f18_arg1.Rewards == nil then
		f18_arg1.Rewards = {}
	end
	if f18_arg3 ~= nil and f18_arg3 ~= "" then
		local f18_local0 = {}
		local f18_local1 = Engine.TableLookup( f18_arg0, CoD.attachmentTable, 4, f18_arg3, 0 )
		f18_local0.name = Engine.TableLookup( f18_arg0, CoD.attachmentTable, 4, f18_arg3, 3 )
		f18_local0.icon = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, f18_arg2, tonumber( f18_local1 ) )
		f18_local0.description = "CPUI_ATTACHMENT"
		f0_local3( f18_arg1.Rewards, f18_local0 )
	end
	if f18_arg4 ~= nil and f18_arg4 ~= "0" and f18_arg4 ~= "" then
		f0_local3( f18_arg1.Rewards, {
			name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( f18_arg4 ) ) ),
			icon = "t7_hud_mp_notifications_xp_blue",
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
		f0_local8( f19_arg0, f19_local0, 2, "ar_standard", 2 )
		f0_local5( f19_arg2, f19_local0, "WEAPON" )
	elseif f19_arg1 and f19_arg1.currentWeaponLevels then
		for f19_local0 = 1, 57, 1 do
			local f19_local3 = Engine.TableLookup( f19_arg0, CoD.statsTable, 0, f19_local0, 4 )
			if f19_local3 ~= nil and f19_local3 ~= "" then
				local f19_local4 = Engine.TableLookup( f19_arg0, CoD.statsTable, 0, f19_local0, 3 )
				local f19_local5 = f19_arg1.itemstats[f19_local0].xp:get()
				local f19_local6 = f19_arg1.currentWeaponLevels[f19_local0]:get()
				local f19_local7 = Engine.TableFindRows( CoD.gunLevelsTable, 2, f19_local3 )
				if f19_local7 ~= nil then
					local f19_local8 = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, f19_local7[#f19_local7], 0 ) )
					local f19_local9 = f19_local7[#f19_local7]
					if f19_local6 < f19_local8 then
						local f19_local10 = f19_local7[1]
						while Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, f19_local10, 1 ) == "0" do
							f19_local10 = f19_local10 + 1
						end
						while tonumber( Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, f19_local10, 0 ) ) < f19_local6 do
							local f19_local10 = f19_local10 + 1
						end
						local f19_local11 = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, f19_local10, 1 )
						while tonumber( f19_local11 ) < f19_local5 do
							local f19_local12 = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, f19_local10, 3 )
							local f19_local13 = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, f19_local10, 4 )
							local f19_local14 = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, f19_local10, 0 )
							if f19_local12 ~= "" then
								local f19_local15 = {
									icon = Engine.TableLookup( f19_arg0, CoD.statsTable, 0, f19_local0, 6 ),
									title = f19_local4,
									description = Engine.Localize( "MENU_LEVEL" ) .. " " .. f19_local6 + tonumber( f19_local14 ) + 2
								}
								f0_local8( f19_arg0, f19_local15, f19_local0, f19_local12, f19_local13 )
								f0_local5( f19_arg2, f19_local15, "WEAPON" )
							end
							f19_local10 = f19_local10 + 1
							if f19_local9 < f19_local10 then
								break
							end
							f19_local11 = Engine.TableLookupGetColumnValueForRow( CoD.gunLevelsTable, f19_local10, 1 )
							if f19_local11 == nil then
								break
							end
						end
					end
				end
				local f19_local9 = Engine.TableFindRows( "gamedata/stats/cp/statsmilestones3.csv", 3, Engine.TableLookup( f19_arg0, CoD.statsTable, 0, f19_local0, 2 ) )
				if f19_local9 ~= nil then
					for f19_local10 = 1, #f19_local9, 1 do
						if f19_arg1.ItemStats[f19_local0].challengeCompleted[f19_local10 - 1]:get() == 1 then
							local f19_local15 = Engine.TableLookupGetColumnValueForRow( "gamedata/stats/cp/statsmilestones3.csv", f19_local9[f19_local10], 9 )
							local f19_local16 = {
								icon = Engine.TableLookup( controller, CoD.attachmentTable, 4, f19_local15, 6 ),
								title = Engine.TableLookup( controller, CoD.attachmentTable, 4, f19_local15, 3 ),
								description = Engine.TableLookup( f19_arg0, CoD.statsTable, 0, f19_local0, 3 ),
								Rewards = {}
							}
							f0_local3( f19_local16.Rewards, {
								name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( Engine.TableLookupGetColumnValueForRow( "gamedata/stats/cp/statsmilestones3.csv", f19_local9[f19_local10], 6 ) ) ) ),
								icon = "t7_hud_mp_notifications_xp_blue",
								description = ""
							} )
							f0_local5( f19_arg2, f19_local16, "CHALLENGE" )
							f19_arg1.ItemStats[f19_local0].challengeCompleted[f19_local10 - 1]:set( 0 )
						end
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
		return f20_arg0.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[f20_arg1].value:get()
	end
end

local f0_local11 = function ( f21_arg0, f21_arg1 )
	if CoD.AARUtilityCP.UseTestData() then
		return CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_NOT_SEEN
	else
		return f21_arg0.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[f21_arg1].state:get()
	end
end

local f0_local12 = function ( f22_arg0, f22_arg1, f22_arg2 )
	f22_arg0.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[f22_arg1].state:set( f22_arg2 )
end

local f0_local13 = function ( f23_arg0, f23_arg1, f23_arg2 )
	f23_arg0.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].accolades[f23_arg1].value:set( f23_arg2 )
end

local f0_local14 = function ( f24_arg0 )
	local f24_local0 = string.lower( f24_arg0 )
	if f24_local0 == "accuracy" then
		return "uie_accuracy"
	elseif f24_local0 == "airvehicledestroy" then
		return "uie_air_vehicle"
	elseif f24_local0 == "bullshark" then
		return "uie_bullshark"
	elseif f24_local0 == "cybernetics" then
		return "uie_cybernetics"
	elseif f24_local0 == "defend" then
		return "uie_protect"
	elseif f24_local0 == "explosion" then
		return "uie_explosion"
	elseif f24_local0 == "find" then
		return "uie_collectibles"
	elseif f24_local0 == "grenade" then
		return "uie_grenade"
	elseif f24_local0 == "groundvehicledestroy" then
		return "uie_ground_vehicle"
	elseif f24_local0 == "heavyweapon" then
		return "uie_heavy_weapon"
	elseif f24_local0 == "kills" then
		return "uie_kill"
	elseif f24_local0 == "melee" then
		return "uie_melee"
	elseif f24_local0 == "score" then
		return "uie_score"
	elseif f24_local0 == "stealth" then
		return "uie_stealth"
	elseif f24_local0 == "traversal" then
		return "uie_traversal"
	elseif f24_local0 == "trickshot" then
		return "uie_trickshot"
	elseif f24_local0 == "untouched" then
		return "uie_indestructible"
	elseif f24_local0 == "weapon" then
		return "uie_weapons"
	else
		
	end
end

local f0_local15 = function ( f25_arg0, f25_arg1, f25_arg2 )
	if CoD.AARUtilityCP.UseTestData() then
		f0_local5( f25_arg2, {
			icon = "uie_headicon_dead",
			title = "Accolade",
			description = "Can't Touch This"
		}, "ACCOLADE" )
	elseif f25_arg1 ~= nil then
		if CoD.AARUtilityCP.GetLastMissionName() == nil then
			return 
		end
		local f25_local0 = "MISSION_"
		local f25_local1 = CoD.AARUtilityCP.GetLastMissionName()
		f25_local1 = Engine.TableLookup( f25_arg0, CoD.statsMilestone, 4, f25_local0 .. f25_local1:upper() .. "_UNTOUCHED", 0 )
		if f25_local1 == "" then
			return 
		elseif CoD.mapsTable[CoD.AARUtilityCP.GetLastMapName()].accoladelist == nil then
			return 
		end
		local f25_local2 = Engine.GetAssetList( CoD.mapsTable[CoD.AARUtilityCP.GetLastMapName()].accoladelist )
		for f25_local3 = 0, 18, 1 do
			local f25_local6 = f0_local11( f25_arg1, f25_local3 )
			if f25_local6 ~= CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_SEEN then
				if f25_local6 == CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_NOT_SEEN then
					local f25_local7 = Engine.TableLookup( f25_arg0, CoD.statsMilestone, 0, f25_local3 + f25_local1, 4 )
					local f25_local8 = "uie_headicon_dead"
					for f25_local12, f25_local13 in pairs( f25_local2 ) do
						if f25_local13.challengeReference == f25_local7 then
							f25_local8 = f0_local14( f25_local13.challengeWidget )
							break
						end
					end
					f25_local9 = {
						icon = f25_local8,
						title = Engine.TableLookup( f25_arg0, CoD.statsMilestone, 0, f25_local3 + f25_local1, 5 ) .. "_NAME",
						description = "ACCOLADES_ACCOLADE_COMPLETED"
					}
					f25_local10 = Engine.TableLookup( f25_arg0, CoD.statsMilestone, 0, f25_local3 + f25_local1, 7 )
					f25_local9.Rewards = {}
					if f25_local10 ~= nil and f25_local10 ~= "" then
						f0_local3( f25_local9.Rewards, {
							name = "CPUI_ADD_UNLOCK_TOKEN",
							description = "",
							icon = CoD.AARUtilityCP.UnlockTokenIcon
						} )
					end
					f25_local11 = Engine.TableLookup( f25_arg0, CoD.statsMilestone, 0, f25_local3 + f25_local1, 6 )
					if f25_local11 ~= nil and f25_local11 ~= "" then
						f0_local3( f25_local9.Rewards, {
							name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( f25_local11 ) ) ),
							description = "",
							icon = "t7_hud_mp_notifications_xp_blue"
						} )
					end
					f0_local5( f25_arg2, f25_local9, "ACCOLADE" )
					f0_local12( f25_arg1, f25_local3, CoD.AARUtilityCP.ACCOLADE_STATE_COMPLETED_SEEN )
				end
				f0_local13( f25_arg1, f25_local3, 0 )
			end
		end
	end
end

local f0_local16 = function ( f26_arg0 )
	if f26_arg0 == 0 then
		return "RECRUIT"
	elseif f26_arg0 == 1 then
		return "REGULAR"
	elseif f26_arg0 == 2 then
		return "HARDENED"
	elseif f26_arg0 == 3 then
		return "VETERAN"
	else
		return "HEROIC"
	end
end

local f0_local17 = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = CoD.AARUtilityCP.GetLastMapName()
	local f27_local1 = false
	local f27_local2 = true
	local f27_local3 = 0
	local f27_local4 = 0
	for f27_local5 = 0, 5, 1 do
		local f27_local8 = f27_arg1.PlayerStatsByMap[f27_local0].previousCompletedDifficulties[f27_local5]:get()
		local f27_local9 = f27_arg1.PlayerStatsByMap[f27_local0].previousReceivedXPForDifficulty[f27_local5]:get()
		local f27_local10 = f27_arg1.PlayerStatsByMap[f27_local0].receivedXPForDifficulty[f27_local5]:get()
		if f27_local8 == 1 then
			f27_local2 = false
		end
		if f27_local9 ~= f27_local10 then
			f27_local1 = true
			local f27_local11 = "complete_mission_" .. f0_local16( f27_local5 )
			if f27_local5 == f27_arg1.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].lastCompletedDifficulty:get() then
				f27_local3 = f27_local3 + tonumber( Engine.TableLookup( f27_arg0, CoD.scoreInfoTable, 0, f27_local11, 23 ) )
			else
				f27_local4 = f27_local4 + tonumber( Engine.TableLookup( f27_arg0, CoD.scoreInfoTable, 0, f27_local11, 23 ) )
			end
		end
	end
	if f27_local1 == true then
		local f27_local6 = {
			icon = "t7_cp_hud_mission_complete",
			title = "COOP_SMUI_MISSION_COMPLETE",
			description = CoD.mapsTable[f27_local0].mapName,
			Rewards = {}
		}
		f0_local3( f27_local6.Rewards, {
			name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", f27_local3 ) ),
			icon = "t7_hud_mp_notifications_xp_blue",
			description = "MENU_COMPLETED_" .. f0_local16( f27_arg1.PlayerStatsByMap[CoD.AARUtilityCP.GetLastMapName()].lastCompletedDifficulty:get() )
		} )
		if f27_local4 ~= 0 then
			f0_local3( f27_local6.Rewards, {
				name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", f27_local4 ) ),
				icon = "t7_hud_mp_notifications_xp_blue",
				description = "CPUI_LOWER_DIFFICULTIES"
			} )
		end
		if f27_local2 == true then
			f0_local3( f27_local6.Rewards, {
				name = "CPUI_ADD_UNLOCK_TOKEN",
				description = "",
				icon = CoD.AARUtilityCP.UnlockTokenIcon
			} )
		end
		local f27_local12 = {}
		local f27_local8 = tonumber( Engine.TableLookup( f27_arg0, "gamedata/stats/cp/statsmilestones2.csv", 1, "bodystyle", 3, CoD.AARUtilityCP.GetLastMapName(), 2 ) ) + 1
		CoD.CCUtility.customizationMode = Enum.eModes.MODE_CAMPAIGN
		CoD.CCUtility.Heroes.HeroIndexForEdits = Engine.GetEquippedHero( f27_arg0, CoD.CCUtility.customizationMode )
		CoD.CCUtility.Heroes.heroCustomizationTable = Engine.GetHeroCustomizationTable( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
		local f27_local9 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[f27_local8]
		f27_local12.name = "CPUI_OUTFIT"
		f27_local12.icon = f27_local9.icon
		f27_local12.description = f27_local9.name
		f0_local3( f27_local6.Rewards, f27_local12 )
		f0_local5( f27_arg2, f27_local6, "MISSION" )
	end
end

local f0_local18 = function ( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = CoD.mapsTable
	local f28_local1 = Dvar.ui_mapname
	if f28_local0[f28_local2:get()].isSafeHouse ~= true then
		return 
	end
	f28_local0 = Engine.GetAssetList( "rating_list" )
	for f28_local2 = 0, 2, 1 do
		if f28_arg1.PlayerStatsByMap.cp_sh_cairo.completedDifficulties[f28_local2]:get() ~= f28_arg1.PlayerStatsByMap.cp_sh_cairo.previousCompletedDifficulties[f28_local2]:get() then
			local f28_local4 = f28_local0[f28_local2 + 1]
			local f28_local5 = {
				icon = f28_local4.ratingImage,
				title = f28_local4.ratingName,
				description = "CPUI_RATING_EARNED",
				Rewards = {}
			}
			f0_local3( f28_local5.Rewards, {
				name = Engine.Localize( "CPUI_ADD_UNLOCK_TOKENS", f28_local4.tokensAwarded ),
				icon = CoD.AARUtilityCP.UnlockTokenIcon,
				description = ""
			} )
			f0_local3( f28_local5.Rewards, {
				name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", f28_local4.xpAwarded ) ),
				icon = "t7_hud_mp_notifications_xp_blue",
				description = ""
			} )
			f0_local5( f28_arg2, f28_local5, "RATING" )
		end
	end
end

local f0_local19 = function ( f29_arg0, f29_arg1 )
	for f29_local0 = 1, #f29_arg0, 1 do
		if f29_arg0[f29_local0] == f29_arg1 then
			return true
		end
	end
	return false
end

local f0_local20 = function ( f30_arg0, f30_arg1, f30_arg2 )
	local f30_local0 = Engine.TableFindRows( "gamedata/stats/cp/statsmilestones3.csv", 3, "attachment" )
	local f30_local1 = {}
	for f30_local2 = 1, #f30_local0, 1 do
		local f30_local5 = Engine.TableLookupGetColumnValueForRow( "gamedata/stats/cp/statsmilestones3.csv", f30_local0[f30_local2], 13 )
		if not f0_local19( f30_local1, f30_local5 ) then
			table.insert( f30_local1, f30_local5 )
		end
	end
	for f30_local2 = 1, #f30_local1, 1 do
		local f30_local5 = f30_local1[f30_local2]
		local f30_local6 = Engine.TableFindRows( "gamedata/stats/cp/statsmilestones3.csv", 13, f30_local5 )
		if f30_local6 ~= nil then
			for f30_local7 = 1, #f30_local6, 1 do
				if f30_arg1.Attachments[f30_local5].challengeCompleted[f30_local7 - 1]:get() == 1 then
					local f30_local10 = Engine.TableLookupGetColumnValueForRow( "gamedata/stats/cp/statsmilestones3.csv", f30_local6[f30_local7], 9 )
					local f30_local11 = {
						icon = f30_local5 .. "_" .. f30_local7,
						title = "mpui_reticle_" .. f30_local5 .. "_" .. f30_local7,
						description = "mpui_reticle",
						Rewards = {}
					}
					f0_local3( f30_local11.Rewards, {
						name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tonumber( Engine.TableLookupGetColumnValueForRow( "gamedata/stats/cp/statsmilestones3.csv", f30_local6[f30_local7], 6 ) ) ) ),
						icon = "t7_hud_mp_notifications_xp_blue",
						description = ""
					} )
					f0_local5( f30_arg2, f30_local11, "CHALLENGE" )
					f30_arg1.Attachments[f30_local5].challengeCompleted[f30_local7 - 1]:set( 0 )
				end
			end
		end
	end
end

local f0_local21 = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = Engine.GetAssetList( "cp_medals" )
	for f31_local1 = 1, #f31_local0, 1 do
		local f31_local4 = f31_local0[f31_local1]
		if f31_arg1.currentPlayerCPDecorations[f31_local1 - 1]:get() ~= f31_arg1.PlayerCPDecorations[f31_local1 - 1]:get() then
			local f31_local5 = {
				icon = f31_local4.smallIcon,
				title = f31_local4.displayName,
				description = "CPUI_CAMPAIGN_DECORATION",
				Rewards = {}
			}
			f0_local3( f31_local5.Rewards, {
				name = Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", f31_local4.XPBonus ) ),
				icon = "t7_hud_mp_notifications_xp_blue",
				description = ""
			} )
			f0_local5( f31_arg2, f31_local5, "DECORATION" )
		end
	end
end

CoD.AARUtilityCP.GetRewardItemCount = function ( f32_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f32_arg0.controller ), "aarRewards.aarRewardsCount" ) )
end

CoD.AARUtilityCP.CreateModelsForRewards = function ( f33_arg0 )
	if CoD.perController[f33_arg0].fromMaxLevelMessage == true then
		return 
	end
	local f33_local0 = CoD.AARUtilityCP.UseTestData()
	local f33_local1 = Engine.GetModelForController( f33_arg0 )
	local f33_local2 = Engine.GetModel( f33_local1, "aarRewards" )
	if f33_local2 ~= nil then
		Engine.UnsubscribeAndFreeModel( f33_local2 )
	end
	f33_local2 = Engine.CreateModel( f33_local1, "aarRewards" )
	if Engine.GetModel( f33_local1, "aarRewardsCount" ) ~= nil then
		Engine.UnsubscribeAndFreeModel( f33_local2 )
	end
	local f33_local3 = Engine.CreateModel( f33_local2, "aarRewardsCount" )
	local f33_local4 = {
		count = 0
	}
	local f33_local5 = CoD.GetPlayerStats( f33_arg0 )
	f0_local18( f33_arg0, f33_local5, f33_local4 )
	f0_local17( f33_arg0, f33_local5, f33_local4 )
	f0_local7( f33_arg0, f33_local5, f33_local4 )
	f0_local21( f33_arg0, f33_local5, f33_local4 )
	f0_local9( f33_arg0, f33_local5, f33_local4 )
	f0_local15( f33_arg0, f33_local5, f33_local4 )
	UploadStats( f33_arg0 )
	for f33_local6 = 1, f33_local4.count, 1 do
		local f33_local9 = f33_local4[f33_local6]
		local f33_local10 = Engine.CreateModel( f33_local2, f33_local6 .. "" )
		Engine.SetModelValue( Engine.CreateModel( f33_local10, "rewardCarouselItemImage" ), f33_local9.reward.icon )
		Engine.SetModelValue( Engine.CreateModel( f33_local10, "rewardCarouselItemTitle" ), f33_local9.reward.title )
		Engine.SetModelValue( Engine.CreateModel( f33_local10, "rewardCarouselItemSubtitle" ), f33_local9.reward.description )
		for f33_local11 = 1, 4, 1 do
			Engine.SetModelValue( Engine.CreateModel( f33_local10, "reward" .. f33_local11 .. "InfoVisible" ), 0 )
		end
		if f33_local9.reward.Rewards ~= nil and f33_local9.reward.Rewards.count ~= nil then
			for f33_local11 = 1, f33_local9.reward.Rewards.count, 1 do
				local f33_local14 = Engine.CreateModel( f33_local10, "reward" .. f33_local11 .. "Info" )
				local f33_local15 = f33_local9.reward.Rewards[f33_local11]
				Engine.SetModelValue( Engine.CreateModel( f33_local14, "rewardName" ), f33_local15.name )
				Engine.SetModelValue( Engine.CreateModel( f33_local14, "rewardImage" ), f33_local15.icon )
				Engine.SetModelValue( Engine.CreateModel( f33_local14, "rewardDesc" ), f33_local15.description )
				Engine.SetModelValue( Engine.CreateModel( f33_local10, "reward" .. f33_local11 .. "InfoVisible" ), 1 )
			end
		end
	end
	Engine.SetModelValue( f33_local3, f33_local4.count )
end

