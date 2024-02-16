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
Lobby.Leaderboard.StartsWith = function ( long, start )
	return string.sub( long, 1, string.len( start ) ) == start
end

Lobby.Leaderboard.GetScorePerMinute = function ( controller )
	local controller = controller
	local score = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "score", "statvalue" )
	score = score + Engine.Leaderboard_GetCachedByColName( controller, "Score" )
	local time = math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "time_played_total", "statvalue" ) )
	local scorePerMinute = score / (time + Engine.Leaderboard_GetCachedByColName( controller, "Time Played" )) * 60
	return math.max( 0, scorePerMinute )
end

Lobby.Leaderboard.GetKillDeathRatio = function ( controller )
	local controller = controller
	local kills = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "kills", "statvalue" )
	kills = kills + Engine.Leaderboard_GetCachedByColName( controller, "Kills" )
	local deaths = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "deaths", "statvalue" )
	local killDeathRatio = kills / (deaths + Engine.Leaderboard_GetCachedByColName( controller, "Deaths" )) * 100
	return math.max( 0, killDeathRatio )
end

Lobby.Leaderboard.GetTimePlayed = function ( controller )
	local time = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "time_played_total", "statvalue" )
	return math.max( Lobby.Leaderboard.MIN_PLAY_TIME, time )
end

Lobby.Leaderboard.GetGamesPlayed = function ( controller )
	return 1
end

Lobby.Leaderboard.LB_MP_GB_CAREER = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Time Played" then
		return Lobby.Leaderboard.GetTimePlayed( controller )
	elseif colName == "Score Per Minute" then
		return Lobby.Leaderboard.GetScorePerMinute( controller )
	elseif colName == "Games Played" then
		return Lobby.Leaderboard.GetGamesPlayed( controller )
	else
		return 0
	end
end

Lobby.Leaderboard.Global = function ( data )
	local lbID = data.lbNameID
	local result = 0
	if Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GB_CAREER" ) then
		result = Lobby.Leaderboard.LB_MP_GB_CAREER( data )
	end
	return result
end

Lobby.Leaderboard.LB_MP_GM_TDM = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Time Played" then
		return Lobby.Leaderboard.GetTimePlayed( controller )
	elseif colName == "Kill/Death Ratio" then
		return Lobby.Leaderboard.GetKillDeathRatio( controller )
	elseif colName == "Score Per Minute" then
		return Lobby.Leaderboard.GetScorePerMinute( controller )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_DOM = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Time Played" then
		return Lobby.Leaderboard.GetTimePlayed( controller )
	elseif colName == "Score Per Minute" then
		return Lobby.Leaderboard.GetScorePerMinute( controller, 2, 3 )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_FR = function ( data )
	local lbID = data.lbNameID
	local colName = data.lbColName
	local controller = data.controller
	local result = 0
	local bestTime = 0
	if Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_FR_TRACK_A" ) then
		if colName == "Best Time Rank" then
			bestTime = Engine.Leaderboard_GetDeltaStat( controller, "freerunTrackTimes", "bestTimeA" )
		end
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_FR_TRACK_B" ) then
		if colName == "Best Time Rank" then
			bestTime = Engine.Leaderboard_GetDeltaStat( controller, "freerunTrackTimes", "bestTimeB" )
		end
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_FR_TRACK_C" ) and colName == "Best Time Rank" then
		bestTime = Engine.Leaderboard_GetDeltaStat( controller, "freerunTrackTimes", "bestTimeC" )
	end
	if bestTime < 0 then
		result = Lobby.Leaderboard.MAX_FR_TIME_MS - bestTime * -1
	end
	return result
end

Lobby.Leaderboard.Gamemode = function ( data )
	local lbID = data.lbNameID
	if Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_TDM_" ) then
		return Lobby.Leaderboard.LB_MP_GM_TDM( data )
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_DOM_" ) then
		return Lobby.Leaderboard.LB_MP_GM_DOM( data )
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_FR_" ) then
		return Lobby.Leaderboard.LB_MP_GM_FR( data )
	else
		return 0
	end
end

Lobby.Leaderboard.Map = function ( data )
	return 0
end

Lobby.Leaderboard.LB_MP_CG_KILLS = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Kills" then
		return Engine.Leaderboard_GetScoreboardStat( data.controller, "Kills" )
	elseif colName == "Assists" then
		return Engine.Leaderboard_GetScoreboardStat( data.controller, "Assists" )
	elseif colName == "Deaths" then
		return Engine.Leaderboard_GetScoreboardStat( data.controller, "Deaths" )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_CG_SCORE = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Score" then
		return Engine.Leaderboard_GetScoreboardStat( data.controller, "Score" )
	elseif colName == "Time Played" then
		return Engine.Leaderboard_GetScoreboardStat( data.controller, "TimePlayed" )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_CG_WINS = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Wins" then
		if Engine.Leaderboard_GetScoreboardStat( data.controller, "victory" ) == 2 then
			return 1
		else
			return 0
		end
	elseif colName == "Losses" then
		if Engine.Leaderboard_GetScoreboardStat( data.controller, "victory" ) == 0 then
			return 1
		else
			return 0
		end
	elseif colName == "Current Win Streak" then
		if Engine.Leaderboard_GetScoreboardStat( data.controller, "victory" ) == 2 then
			return Engine.Leaderboard_GetCached( data.controller, 4 ) + 1
		else
			return 0
		end
	elseif colName == "Max Win Streak" then
		if Engine.Leaderboard_GetScoreboardStat( data.controller, "victory" ) == 2 then
			return Engine.Leaderboard_GetCached( data.controller, 4 ) + 1
		else
			return 0
		end
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_CG_ACCURACY = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Shots Hit" then
		return Engine.Leaderboard_GetScoreboardStat( data.controller, "shots_hit" )
	elseif colName == "Shots Missed" then
		return Engine.Leaderboard_GetScoreboardStat( data.controller, "shots_missed" )
	else
		return 0
	end
end

Lobby.Leaderboard.Custom = function ( data )
	local lbID = data.lbNameID
	local colName = data.lbColName
	local result = 0
	if lbID == "LB_MP_CG_KILLS" then
		result = Lobby.Leaderboard.LB_MP_CG_KILLS( data )
	elseif lbID == "LB_MP_CG_SCORE" then
		result = Lobby.Leaderboard.LB_MP_CG_SCORE( data )
	elseif lbID == "LB_MP_CG_WINS" then
		result = Lobby.Leaderboard.LB_MP_CG_WINS( data )
	elseif lbID == "LB_MP_CG_ACCURACY" then
		result = Lobby.Leaderboard.LB_MP_CG_ACCURACY( data )
	end
	return result
end

Lobby.Leaderboard.CalculateLBColValue = function ( data )
	local controller = data.controller
	local lbID = data.lbNameID
	local colName = data.lbColName
	local result = 0
	if Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GB_" ) then
		result = Lobby.Leaderboard.Global( data )
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_" ) then
		result = Lobby.Leaderboard.Gamemode( data )
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_MAP_" ) then
		result = Lobby.Leaderboard.Map( data )
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_CG_" ) then
		result = Lobby.Leaderboard.Custom( data )
	end
	return result
end

Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS = function ( data )
	local headshots = Engine.Leaderboard_GetDeltaStat( data.controller, "playerstatslist", "headshots", "statvalue" )
	if headshots > 0 then
		return Lobby.Leaderboard.ANTICHEAT_CONDITION.SUCCESS
	else
		return Lobby.Leaderboard.ANTICHEAT_CONDITION.FAILURE
	end
end

Lobby.Leaderboard.ShouldWriteLeaderboard = function ( data )
	local lbID = data.lbNameID
	if lbID == "LB_MP_GB_HEADSHOTS" then
		return Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS( data )
	elseif lbID == "LB_MP_GB_DEATHS" then
		return Lobby.Leaderboard.ANTICHEAT_CONDITION.SUCCESS
	else
		return Lobby.Leaderboard.MP
	end
end

