require( "lua.Lobby.Common.LobbyCore" )

Lobby.Leaderboard = {}
Lobby.Leaderboard.MP = 0
Lobby.Leaderboard.ANTICHEAT_CONDITION_SUCCESS = 1
Lobby.Leaderboard.ANTICHEAT_CONDITION_FAILURE = 2
Lobby.Leaderboard.STATS_COLUMN_RANK = 65535
Lobby.Leaderboard.STATS_COLUMN_RATING = 65534
Lobby.Leaderboard.STATS_COLUMN_GAMERTAG = 65533
Lobby.Leaderboard.STATS_COLUMN_INCREMENT_BY = 65532
Lobby.Leaderboard.STATS_COLUMN_UI_CALCULATE_SCALE_AVG = 65531
Lobby.Leaderboard.STATS_COLUMN_RATING_CALCULATE_PERCENTAGE = 65530
Lobby.Leaderboard.MIN_PLAY_TIME = 120
Lobby.Leaderboard.MAX_FR_TIME_MS = 3600000
local StartsWith = function ( long, start )
	return string.sub( long, 1, string.len( start ) ) == start
end

local Leaderboard_GetScorePerMinute = function ( controller )
	local controller = controller
	local score = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "score", "statvalue" )
	score = score + Engine.Leaderboard_GetCachedByColName( controller, "Score" )
	local time = math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "time_played_total", "statvalue" ) )
	local scorePerMinute = score / (time + Engine.Leaderboard_GetCachedByColName( controller, "Time Played" )) * 60
	return math.max( 0, scorePerMinute )
end

local Leaderboard_GetKillDeathRatio = function ( controller )
	local controller = controller
	local kills = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "kills", "statvalue" )
	kills = kills + Engine.Leaderboard_GetCachedByColName( controller, "Kills" )
	local deaths = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "deaths", "statvalue" )
	local killDeathRatio = kills / (deaths + Engine.Leaderboard_GetCachedByColName( controller, "Deaths" )) * 100
	return math.max( 0, killDeathRatio )
end

local Leaderboard_GetTimePlayed = function ( controller )
	local time = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "time_played_total", "statvalue" )
	return math.max( Lobby.Leaderboard.MIN_PLAY_TIME, time )
end

local Leaderboard_GetGamesPlayed = function ( controller )
	return 1
end

local Leaderboard_LB_MP_GB_CAREER = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Time Played" then
		return Leaderboard_GetTimePlayed( controller )
	elseif colName == "Score Per Minute" then
		return Leaderboard_GetScorePerMinute( controller )
	elseif colName == "Games Played" then
		return Leaderboard_GetGamesPlayed( controller )
	else
		return 0
	end
end

local Leaderboard_Global = function ( data )
	local lbID = data.lbNameID
	local result = 0
	if StartsWith( lbID, "LB_MP_GB_CAREER" ) then
		result = Leaderboard_LB_MP_GB_CAREER( data )
	end
	return result
end

local Leaderboard_LB_MP_GM_TDM = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Time Played" then
		return Leaderboard_GetTimePlayed( controller )
	elseif colName == "Kill/Death Ratio" then
		return Leaderboard_GetKillDeathRatio( controller )
	elseif colName == "Score Per Minute" then
		return Leaderboard_GetScorePerMinute( controller )
	else
		return 0
	end
end

local Leaderboard_LB_MP_GM_DOM = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Time Played" then
		return Leaderboard_GetTimePlayed( controller )
	elseif colName == "Score Per Minute" then
		return Leaderboard_GetScorePerMinute( controller, 2, 3 )
	else
		return 0
	end
end

local Leaderboard_LB_MP_GM_FR = function ( data )
	local lbID = data.lbNameID
	local colName = data.lbColName
	local controller = data.controller
	local result = 0
	local bestTime = 0
	if StartsWith( lbID, "LB_MP_GM_FR_TRACK_A" ) then
		if colName == "Best Time Rank" then
			bestTime = Engine.Leaderboard_GetDeltaStat( controller, "freerunTrackTimes", "bestTimeA" )
		end
	elseif StartsWith( lbID, "LB_MP_GM_FR_TRACK_B" ) then
		if colName == "Best Time Rank" then
			bestTime = Engine.Leaderboard_GetDeltaStat( controller, "freerunTrackTimes", "bestTimeB" )
		end
	elseif StartsWith( lbID, "LB_MP_GM_FR_TRACK_C" ) and colName == "Best Time Rank" then
		bestTime = Engine.Leaderboard_GetDeltaStat( controller, "freerunTrackTimes", "bestTimeC" )
	end
	if bestTime < 0 then
		result = Lobby.Leaderboard.MAX_FR_TIME_MS - bestTime * -1
	end
	return result
end

local Leaderboard_Gamemode = function ( data )
	local lbID = data.lbNameID
	if StartsWith( lbID, "LB_MP_GM_TDM_" ) then
		return Leaderboard_LB_MP_GM_TDM( data )
	elseif StartsWith( lbID, "LB_MP_GM_DOM_" ) then
		return Leaderboard_LB_MP_GM_DOM( data )
	elseif StartsWith( lbID, "LB_MP_GM_FR_" ) then
		return Leaderboard_LB_MP_GM_FR( data )
	else
		return 0
	end
end

local Leaderboard_Map = function ( data )
	return 0
end

local Leaderboard_LB_MP_CG_KILLS = function ( data )
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

local Leaderboard_LB_MP_CG_SCORE = function ( data )
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

local Leaderboard_LB_MP_CG_WINS = function ( data )
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

local Leaderboard_LB_MP_CG_ACCURACY = function ( data )
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

local Leaderboard_Custom = function ( data )
	local lbID = data.lbNameID
	local colName = data.lbColName
	local result = 0
	if lbID == "LB_MP_CG_KILLS" then
		result = Leaderboard_LB_MP_CG_KILLS( data )
	elseif lbID == "LB_MP_CG_SCORE" then
		result = Leaderboard_LB_MP_CG_SCORE( data )
	elseif lbID == "LB_MP_CG_WINS" then
		result = Leaderboard_LB_MP_CG_WINS( data )
	elseif lbID == "LB_MP_CG_ACCURACY" then
		result = Leaderboard_LB_MP_CG_ACCURACY( data )
	end
	return result
end

Lobby.Leaderboard.CalculateLBColValue = function ( data )
	local controller = data.controller
	local lbID = data.lbNameID
	local colName = data.lbColName
	local result = 0
	if StartsWith( lbID, "LB_MP_GB_" ) then
		result = Leaderboard_Global( data )
	elseif StartsWith( lbID, "LB_MP_GM_" ) then
		result = Leaderboard_Gamemode( data )
	elseif StartsWith( lbID, "LB_MP_MAP_" ) then
		result = Leaderboard_Map( data )
	elseif StartsWith( lbID, "LB_MP_CG_" ) then
		result = Leaderboard_Custom( data )
	end
	return result
end

local Leaderboard_ShouldWrite_LB_MP_GB_HEADSHOTS = function ( data )
	local headshots = Engine.Leaderboard_GetDeltaStat( data.controller, "playerstatslist", "headshots", "statvalue" )
	if headshots > 0 then
		return Lobby.Leaderboard.ANTICHEAT_CONDITION_SUCCESS
	else
		return Lobby.Leaderboard.ANTICHEAT_CONDITION_FAILURE
	end
end

Lobby.Leaderboard.ShouldWriteLeaderboard = function ( data )
	local lbID = data.lbNameID
	if lbID == "LB_MP_GB_HEADSHOTS" then
		return Leaderboard_ShouldWrite_LB_MP_GB_HEADSHOTS( data )
	elseif lbID == "LB_MP_GB_DEATHS" then
		return Lobby.Leaderboard.ANTICHEAT_CONDITION_SUCCESS
	else
		return Lobby.Leaderboard.MP
	end
end

