require( "lua.Lobby.Common.LobbyCore" )

Lobby.Leaderboard = {}
Lobby.Leaderboard.MP = 0
Lobby.Leaderboard.ANTICHEAT_CONDITION = {
	SUCCESS = 1,
	FAILURE = 2
}
Lobby.Leaderboard.STATS_COLUMN = {
	RANK = 65535,
	RATING = 65534,
	GAMERTAG = 65533,
	INCREMENT_BY = 65532,
	UI_CALCULATE_SCALE_AVG = 65531,
	RATING_CALCULATE_PERCENTAGE = 65530
}
Lobby.Leaderboard.MIN_PLAY_TIME = 120
Lobby.Leaderboard.MAX_FR_TIME_MS = 3600000
Lobby.Leaderboard.StartsWith = function ( f1_arg0, f1_arg1 )
	return string.sub( f1_arg0, 1, string.len( f1_arg1 ) ) == f1_arg1
end

Lobby.Leaderboard.GetScorePerMinute = function ( f2_arg0 )
	local f2_local0 = f2_arg0
	return math.max( 0, (Engine.Leaderboard_GetDeltaStat( f2_local0, "playerstatslist", "score", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f2_local0, "Score" )) / (math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetDeltaStat( f2_local0, "playerstatslist", "time_played_total", "statvalue" ) ) + Engine.Leaderboard_GetCachedByColName( f2_local0, "Time Played" )) * 60 )
end

Lobby.Leaderboard.GetKillDeathRatio = function ( f3_arg0 )
	local f3_local0 = f3_arg0
	return math.max( 0, (Engine.Leaderboard_GetDeltaStat( f3_local0, "playerstatslist", "kills", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f3_local0, "Kills" )) / (Engine.Leaderboard_GetDeltaStat( f3_local0, "playerstatslist", "deaths", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f3_local0, "Deaths" )) * 100 )
end

Lobby.Leaderboard.GetTimePlayed = function ( f4_arg0 )
	return math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetDeltaStat( f4_arg0, "playerstatslist", "time_played_total", "statvalue" ) )
end

Lobby.Leaderboard.GetGamesPlayed = function ( f5_arg0 )
	return 1
end

Lobby.Leaderboard.LB_MP_GB_CAREER = function ( f6_arg0 )
	local f6_local0 = f6_arg0.lbColName
	local f6_local1 = f6_arg0.controller
	if f6_local0 == "Time Played" then
		return Lobby.Leaderboard.GetTimePlayed( f6_local1 )
	elseif f6_local0 == "Score Per Minute" then
		return Lobby.Leaderboard.GetScorePerMinute( f6_local1 )
	elseif f6_local0 == "Games Played" then
		return Lobby.Leaderboard.GetGamesPlayed( f6_local1 )
	else
		return 0
	end
end

Lobby.Leaderboard.Global = function ( f7_arg0 )
	local f7_local0 = f7_arg0.lbNameID
	local f7_local1 = 0
	if Lobby.Leaderboard.StartsWith( f7_local0, "LB_MP_GB_CAREER" ) then
		f7_local1 = Lobby.Leaderboard.LB_MP_GB_CAREER( f7_arg0 )
	end
	return f7_local1
end

Lobby.Leaderboard.LB_MP_GM_TDM = function ( f8_arg0 )
	local f8_local0 = f8_arg0.lbColName
	local f8_local1 = f8_arg0.controller
	if f8_local0 == "Time Played" then
		return Lobby.Leaderboard.GetTimePlayed( f8_local1 )
	elseif f8_local0 == "Kill/Death Ratio" then
		return Lobby.Leaderboard.GetKillDeathRatio( f8_local1 )
	elseif f8_local0 == "Score Per Minute" then
		return Lobby.Leaderboard.GetScorePerMinute( f8_local1 )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_DOM = function ( f9_arg0 )
	local f9_local0 = f9_arg0.lbColName
	local f9_local1 = f9_arg0.controller
	if f9_local0 == "Time Played" then
		return Lobby.Leaderboard.GetTimePlayed( f9_local1 )
	elseif f9_local0 == "Score Per Minute" then
		return Lobby.Leaderboard.GetScorePerMinute( f9_local1, 2, 3 )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_FR = function ( f10_arg0 )
	local f10_local0 = f10_arg0.lbNameID
	local f10_local1 = f10_arg0.lbColName
	local f10_local2 = f10_arg0.controller
	local f10_local3 = 0
	local f10_local4 = 0
	if Lobby.Leaderboard.StartsWith( f10_local0, "LB_MP_GM_FR_TRACK_A" ) then
		if f10_local1 == "Best Time Rank" then
			f10_local4 = Engine.Leaderboard_GetDeltaStat( f10_local2, "freerunTrackTimes", "bestTimeA" )
		end
	elseif Lobby.Leaderboard.StartsWith( f10_local0, "LB_MP_GM_FR_TRACK_B" ) then
		if f10_local1 == "Best Time Rank" then
			f10_local4 = Engine.Leaderboard_GetDeltaStat( f10_local2, "freerunTrackTimes", "bestTimeB" )
		end
	elseif Lobby.Leaderboard.StartsWith( f10_local0, "LB_MP_GM_FR_TRACK_C" ) and f10_local1 == "Best Time Rank" then
		f10_local4 = Engine.Leaderboard_GetDeltaStat( f10_local2, "freerunTrackTimes", "bestTimeC" )
	end
	if f10_local4 < 0 then
		f10_local3 = Lobby.Leaderboard.MAX_FR_TIME_MS - f10_local4 * -1
	end
	return f10_local3
end

Lobby.Leaderboard.Gamemode = function ( f11_arg0 )
	local f11_local0 = f11_arg0.lbNameID
	if Lobby.Leaderboard.StartsWith( f11_local0, "LB_MP_GM_TDM_" ) then
		return Lobby.Leaderboard.LB_MP_GM_TDM( f11_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f11_local0, "LB_MP_GM_DOM_" ) then
		return Lobby.Leaderboard.LB_MP_GM_DOM( f11_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f11_local0, "LB_MP_GM_FR_" ) then
		return Lobby.Leaderboard.LB_MP_GM_FR( f11_arg0 )
	else
		return 0
	end
end

Lobby.Leaderboard.Map = function ( f12_arg0 )
	return 0
end

Lobby.Leaderboard.LB_MP_CG_KILLS = function ( f13_arg0 )
	local f13_local0 = f13_arg0.lbColName
	local f13_local1 = f13_arg0.controller
	if f13_local0 == "Kills" then
		return Engine.Leaderboard_GetScoreboardStat( f13_arg0.controller, "Kills" )
	elseif f13_local0 == "Assists" then
		return Engine.Leaderboard_GetScoreboardStat( f13_arg0.controller, "Assists" )
	elseif f13_local0 == "Deaths" then
		return Engine.Leaderboard_GetScoreboardStat( f13_arg0.controller, "Deaths" )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_CG_SCORE = function ( f14_arg0 )
	local f14_local0 = f14_arg0.lbColName
	local f14_local1 = f14_arg0.controller
	if f14_local0 == "Score" then
		return Engine.Leaderboard_GetScoreboardStat( f14_arg0.controller, "Score" )
	elseif f14_local0 == "Time Played" then
		return Engine.Leaderboard_GetScoreboardStat( f14_arg0.controller, "TimePlayed" )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_CG_WINS = function ( f15_arg0 )
	local f15_local0 = f15_arg0.lbColName
	local f15_local1 = f15_arg0.controller
	if f15_local0 == "Wins" then
		if Engine.Leaderboard_GetScoreboardStat( f15_arg0.controller, "victory" ) == 2 then
			return 1
		else
			return 0
		end
	elseif f15_local0 == "Losses" then
		if Engine.Leaderboard_GetScoreboardStat( f15_arg0.controller, "victory" ) == 0 then
			return 1
		else
			return 0
		end
	elseif f15_local0 == "Current Win Streak" then
		if Engine.Leaderboard_GetScoreboardStat( f15_arg0.controller, "victory" ) == 2 then
			return Engine.Leaderboard_GetCached( f15_arg0.controller, 4 ) + 1
		else
			return 0
		end
	elseif f15_local0 == "Max Win Streak" then
		if Engine.Leaderboard_GetScoreboardStat( f15_arg0.controller, "victory" ) == 2 then
			return Engine.Leaderboard_GetCached( f15_arg0.controller, 4 ) + 1
		else
			return 0
		end
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_CG_ACCURACY = function ( f16_arg0 )
	local f16_local0 = f16_arg0.lbColName
	local f16_local1 = f16_arg0.controller
	if f16_local0 == "Shots Hit" then
		return Engine.Leaderboard_GetScoreboardStat( f16_arg0.controller, "shots_hit" )
	elseif f16_local0 == "Shots Missed" then
		return Engine.Leaderboard_GetScoreboardStat( f16_arg0.controller, "shots_missed" )
	else
		return 0
	end
end

Lobby.Leaderboard.Custom = function ( f17_arg0 )
	local f17_local0 = f17_arg0.lbNameID
	local f17_local1 = f17_arg0.lbColName
	local f17_local2 = 0
	if f17_local0 == "LB_MP_CG_KILLS" then
		f17_local2 = Lobby.Leaderboard.LB_MP_CG_KILLS( f17_arg0 )
	elseif f17_local0 == "LB_MP_CG_SCORE" then
		f17_local2 = Lobby.Leaderboard.LB_MP_CG_SCORE( f17_arg0 )
	elseif f17_local0 == "LB_MP_CG_WINS" then
		f17_local2 = Lobby.Leaderboard.LB_MP_CG_WINS( f17_arg0 )
	elseif f17_local0 == "LB_MP_CG_ACCURACY" then
		f17_local2 = Lobby.Leaderboard.LB_MP_CG_ACCURACY( f17_arg0 )
	end
	return f17_local2
end

Lobby.Leaderboard.CalculateLBColValue = function ( f18_arg0 )
	local f18_local0 = f18_arg0.controller
	local f18_local1 = f18_arg0.lbNameID
	local f18_local2 = f18_arg0.lbColName
	local f18_local3 = 0
	if Lobby.Leaderboard.StartsWith( f18_local1, "LB_MP_GB_" ) then
		f18_local3 = Lobby.Leaderboard.Global( f18_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f18_local1, "LB_MP_GM_" ) then
		f18_local3 = Lobby.Leaderboard.Gamemode( f18_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f18_local1, "LB_MP_MAP_" ) then
		f18_local3 = Lobby.Leaderboard.Map( f18_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f18_local1, "LB_MP_CG_" ) then
		f18_local3 = Lobby.Leaderboard.Custom( f18_arg0 )
	end
	return f18_local3
end

Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS = function ( f19_arg0 )
	if Engine.Leaderboard_GetDeltaStat( f19_arg0.controller, "playerstatslist", "headshots", "statvalue" ) > 0 then
		return Lobby.Leaderboard.ANTICHEAT_CONDITION.SUCCESS
	else
		return Lobby.Leaderboard.ANTICHEAT_CONDITION.FAILURE
	end
end

Lobby.Leaderboard.ShouldWriteLeaderboard = function ( f20_arg0 )
	local f20_local0 = f20_arg0.lbNameID
	if f20_local0 == "LB_MP_GB_HEADSHOTS" then
		return Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS( f20_arg0 )
	elseif f20_local0 == "LB_MP_GB_DEATHS" then
		return Lobby.Leaderboard.ANTICHEAT_CONDITION.SUCCESS
	else
		return Lobby.Leaderboard.MP
	end
end

