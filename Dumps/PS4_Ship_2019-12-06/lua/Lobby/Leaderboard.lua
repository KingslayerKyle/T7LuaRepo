require( "lua.Lobby.Common.LobbyCore" )

Lobby.Leaderboard = {}
Lobby.Leaderboard.MP = 0
Lobby.Leaderboard.CALC_NOT_FOUND = -2
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
Lobby.Leaderboard.GAME_RESULT = {
	LOSS = 0,
	TIE = 1,
	WIN = 2
}
Lobby.Leaderboard.MIN_PLAY_TIME = 120
Lobby.Leaderboard.customMatchRecentlyPlayed = {}
Lobby.Leaderboard.StartsWith = function ( f1_arg0, f1_arg1 )
	return string.sub( f1_arg0, 1, string.len( f1_arg1 ) ) == f1_arg1
end

Lobby.Leaderboard.XUIDMismatch = function ( f2_arg0 )
	local f2_local0 = Engine.GetPlayerStats( f2_arg0 )
	if f2_local0.playerxuid:get() ~= Engine.GetXUID( f2_arg0 ) then
		return 1
	else
		return 0
	end
end

Lobby.Leaderboard.OnClientAdded = function ( f3_arg0 )
	if f3_arg0.lobbyModule ~= Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		return 
	elseif Engine.GetLobbyUIScreen() ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id then
		return 
	end
	local f3_local0 = f3_arg0.xuid
	if Engine.IsLocalClient( f3_local0 ) == true or Engine.IsFriendFromXUID( Engine.GetPrimaryController(), f3_local0 ) == true then
		return 
	end
	for f3_local4, f3_local5 in pairs( Lobby.Leaderboard.customMatchRecentlyPlayed ) do
		if f3_local5.xuid == f3_local0 then
			table.remove( Lobby.Leaderboard.customMatchRecentlyPlayed, f3_local4 )
			break
		end
	end
	if #Lobby.Leaderboard.customMatchRecentlyPlayed >= LuaEnums.LEADERBOARD_MAX_ROWS - 1 then
		table.remove( Lobby.Leaderboard.customMatchRecentlyPlayed, 1 )
	end
	table.insert( Lobby.Leaderboard.customMatchRecentlyPlayed, {
		xuid = f3_local0
	} )
end

Lobby.Leaderboard.PopulateCustomList = function ( f4_arg0 )
	table.insert( Lobby.Leaderboard.customMatchRecentlyPlayed, {
		xuid = Engine.GetXUID64( f4_arg0.controller )
	} )
	Engine.LeaderboardPopulateCustomList( Lobby.Leaderboard.customMatchRecentlyPlayed )
	table.remove( Lobby.Leaderboard.customMatchRecentlyPlayed, #Lobby.Leaderboard.customMatchRecentlyPlayed )
end

Lobby.Leaderboard.GetScore = function ( f5_arg0 )
	return math.max( 0, Engine.Leaderboard_GetDeltaStat( f5_arg0, "playerstatslist", "score", "statvalue" ) )
end

Lobby.Leaderboard.GetPointsPerGame = function ( f6_arg0, f6_arg1, f6_arg2 )
	if Lobby.Leaderboard.StartsWith( f6_arg0.lbNameID, "LB_MP_GM_" ) then
		local f6_local0 = Lobby.Leaderboard.GetGamesPlayed( f6_arg1 ) + Engine.Leaderboard_GetCachedByColName( f6_arg1, "Games Played" )
		if f6_arg2 == Enum.LbTrackType.LB_TRK_ALLTIME and f6_local0 < LuaEnums.LB_MP_GAMES_NEEDED.ALLTIME then
			return -1
		elseif f6_arg2 == Enum.LbTrackType.LB_TRK_MONTHLY and f6_local0 < LuaEnums.LB_MP_GAMES_NEEDED.MONTHLY then
			return -1
		elseif f6_arg2 == Enum.LbTrackType.LB_TRK_WEEKLY and f6_local0 < LuaEnums.LB_MP_GAMES_NEEDED.WEEKLY then
			return -1
		end
	end
	return math.max( 0, (Engine.Leaderboard_GetDeltaStat( f6_arg1, "playerstatslist", "score", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f6_arg1, "Points" )) / (Lobby.Leaderboard.GetGamesPlayed( f6_arg1 ) + Engine.Leaderboard_GetCachedByColName( f6_arg1, "Games Played" )) )
end

Lobby.Leaderboard.GetScorePerMinute = function ( f7_arg0, f7_arg1, f7_arg2 )
	if Lobby.Leaderboard.StartsWith( f7_arg0.lbNameID, "LB_MP_GM_" ) then
		local f7_local0 = Lobby.Leaderboard.GetGamesPlayed( f7_arg1 ) + Engine.Leaderboard_GetCachedByColName( f7_arg1, "Games Played" )
		if f7_arg2 == Enum.LbTrackType.LB_TRK_ALLTIME and f7_local0 < LuaEnums.LB_MP_GAMES_NEEDED.ALLTIME then
			return -1
		elseif f7_arg2 == Enum.LbTrackType.LB_TRK_MONTHLY and f7_local0 < LuaEnums.LB_MP_GAMES_NEEDED.MONTHLY then
			return -1
		elseif f7_arg2 == Enum.LbTrackType.LB_TRK_WEEKLY and f7_local0 < LuaEnums.LB_MP_GAMES_NEEDED.WEEKLY then
			return -1
		end
	end
	return math.max( 0, (Engine.Leaderboard_GetDeltaStat( f7_arg1, "playerstatslist", "score", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f7_arg1, "Score" )) / (math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetDeltaStat( f7_arg1, "playerstatslist", "time_played_total", "statvalue" ) ) + Engine.Leaderboard_GetCachedByColName( f7_arg1, "Time Played" )) / 60 )
end

Lobby.Leaderboard.GetKillDeathRatio = function ( f8_arg0 )
	return math.max( 0, (Engine.Leaderboard_GetDeltaStat( f8_arg0, "playerstatslist", "kills", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f8_arg0, "Kills" )) / (Engine.Leaderboard_GetDeltaStat( f8_arg0, "playerstatslist", "deaths", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f8_arg0, "Deaths" )) * 100 )
end

Lobby.Leaderboard.GetTimePlayed = function ( f9_arg0 )
	return math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetDeltaStat( f9_arg0, "playerstatslist", "time_played_total", "statvalue" ) )
end

Lobby.Leaderboard.GetGamesPlayed = function ( f10_arg0 )
	return 1
end

Lobby.Leaderboard.GetPrestige = function ( f11_arg0 )
	local f11_local0 = Engine.GetDStat( f11_arg0, "playerstatslist", "plevel", "statvalue" )
	if LuaUtils.IsGameModeParagonCapable( Engine.CurrentSessionMode() ) and f11_local0 == Engine.GetPrestigeCap() then
		return LuaUtils.ConvertToPrestigeMerged( f11_local0, Engine.GetDStat( f11_arg0, "playerstatslist", "paragon_rank", "statvalue" ), Engine.GetDStat( f11_arg0, "playerstatslist", "paragon_icon_id", "statvalue" ) )
	else
		return f11_local0
	end
end

Lobby.Leaderboard.GeneralCalc = function ( f12_arg0 )
	local f12_local0 = f12_arg0.controller
	local f12_local1 = f12_arg0.lbTrackType
	local f12_local2 = f12_arg0.lbColName
	if f12_local2 == "Time Played" then
		return Lobby.Leaderboard.GetTimePlayed( f12_local0 )
	elseif f12_local2 == "Score Per Minute" then
		return Lobby.Leaderboard.GetScorePerMinute( f12_arg0, f12_local0, f12_local1 )
	elseif f12_local2 == "Games Played" then
		return Lobby.Leaderboard.GetGamesPlayed( f12_local0 )
	elseif f12_local2 == "Points Per Game" then
		return Lobby.Leaderboard.GetPointsPerGame( f12_arg0, f12_local0, f12_local1 )
	elseif f12_local2 == "Prestige Level" then
		return Lobby.Leaderboard.GetPrestige( f12_local0 )
	else
		return Lobby.Leaderboard.CALC_NOT_FOUND
	end
end

Lobby.Leaderboard.IsFreeRunMap = function ( f13_arg0, f13_arg1 )
	if f13_arg0[f13_arg1] then
		local f13_local0
		if f13_arg0[f13_arg1].isFreeRunMap == nil or f13_arg0[f13_arg1].isFreeRunMap ~= true then
			f13_local0 = false
		else
			f13_local0 = true
		end
		return f13_local0
	else
		return false
	end
end

Lobby.Leaderboard.GetBestTimeForFreerunMap = function ( f14_arg0, f14_arg1 )
	local f14_local0 = Engine.GetGDTMapsTable()
	if not Lobby.Leaderboard.IsFreeRunMap( f14_local0, f14_arg1 ) then
		return 0
	end
	local f14_local1 = 0
	local f14_local2 = Engine.StorageGetBuffer( f14_arg0, Enum.StorageFileType.STORAGE_FR_STATS_ONLINE )
	if f14_arg1 and f14_local2 then
		local f14_local3 = f14_local0[f14_arg1]
		if f14_local3 then
			local f14_local4 = f14_local3.freerunTrackIndex
			if f14_local4 then
				f14_local1 = f14_local2.freerunTrackTimes.track[f14_local4].topTimes[0].time:get()
			end
		end
	end
	if f14_local1 == nil then
		return 0
	end
	return f14_local1
end

Lobby.Leaderboard.Global = function ( f15_arg0 )
	local f15_local0 = f15_arg0.lbNameID
	local f15_local1 = 0
	f15_local1 = Lobby.Leaderboard.GeneralCalc( f15_arg0 )
	if f15_local1 ~= Lobby.Leaderboard.CALC_NOT_FOUND then
		return f15_local1
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_KOTH = function ( f16_arg0 )
	local f16_local0 = f16_arg0.lbColName
	local f16_local1 = f16_arg0.controller
	if f16_local0 == "KOTH Avg Time" then
		return (Engine.Leaderboard_GetCachedByColName( f16_local1, "Captured Time" ) + Engine.Leaderboard_GetDeltaStat( f16_local1, "playerstatslist", "objective_time", "statvalue" )) / math.max( 1, Engine.Leaderboard_GetCachedByColName( f16_local1, "Games Played" ) + 1 )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_ESCORT = function ( f17_arg0 )
	local f17_local0 = f17_arg0.lbColName
	local f17_local1 = f17_arg0.controller
	if f17_local0 == "ESCORT Avg Time" then
		return (Engine.Leaderboard_GetCachedByColName( f17_local1, "Escort Time" ) + Engine.Leaderboard_GetDeltaStat( f17_local1, "playerstatslist", "escorts", "statvalue" )) / math.max( 1, Engine.Leaderboard_GetCachedByColName( f17_local1, "Games Played" ) + 1 )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_FR = function ( f18_arg0 )
	local f18_local0 = f18_arg0.lbNameID
	local f18_local1 = f18_arg0.lbColName
	local f18_local2 = f18_arg0.controller
	local f18_local3 = 0
	if f18_local1 == "FREERUN Time" then
		f18_local3 = math.max( 0, LuaUtils.LUA_INT_MAX - Lobby.Leaderboard.GetBestTimeForFreerunMap( f18_local2, Dvar.ui_mapname:get() ) )
	end
	return f18_local3
end

Lobby.Leaderboard.Friend = function ( f19_arg0 )
	local f19_local0 = 0
	local f19_local1 = f19_arg0.lbColName
	local f19_local2 = f19_arg0.controller
	local f19_local3 = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	if f19_local1 == f19_local3.gametype then
		f19_local0 = Lobby.Leaderboard.GetScore( f19_local2 )
	end
	return f19_local0
end

Lobby.Leaderboard.Gamemode = function ( f20_arg0 )
	local f20_local0 = f20_arg0.lbNameID
	local f20_local1 = 0
	f20_local1 = Lobby.Leaderboard.GeneralCalc( f20_arg0 )
	if f20_local1 ~= Lobby.Leaderboard.CALC_NOT_FOUND then
		return f20_local1
	else
		f20_local1 = 0
		if Lobby.Leaderboard.StartsWith( f20_local0, "LB_MP_GM_KOTH" ) then
			return Lobby.Leaderboard.LB_MP_GM_KOTH( f20_arg0 )
		elseif Lobby.Leaderboard.StartsWith( f20_local0, "LB_MP_GM_ESCORT" ) then
			return Lobby.Leaderboard.LB_MP_GM_ESCORT( f20_arg0 )
		elseif Lobby.Leaderboard.StartsWith( f20_local0, "LB_MP_GM_FR_" ) then
			return Lobby.Leaderboard.LB_MP_GM_FR( f20_arg0 )
		else
			return f20_local1
		end
	end
end

Lobby.Leaderboard.GetArenaStats = function ( f21_arg0 )
	local f21_local0 = Engine.StorageGetBuffer( f21_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	return f21_local0.arenaStats[Engine.GetCurrentArenaSlot()]
end

Lobby.Leaderboard.GetArenaSkill = function ( f22_arg0 )
	local f22_local0 = Lobby.Leaderboard.GetArenaStats( f22_arg0 )
	return f22_local0.skill:get()
end

Lobby.Leaderboard.GetArenaPowerRating = function ( f23_arg0 )
	local f23_local0 = Lobby.Leaderboard.GetArenaStats( f23_arg0 )
	return LuaUtils.GetArenaPowerRating( f23_local0.skill:get() )
end

Lobby.Leaderboard.GetArenaWinPercentage = function ( f24_arg0 )
	local f24_local0 = Lobby.Leaderboard.GetArenaStats( f24_arg0 )
	local f24_local1 = f24_local0.wins:get()
	return f24_local1 / math.max( f24_local1 + f24_local0.losses:get(), 1 )
end

Lobby.Leaderboard.GetArenaAdjustedWinPct = function ( f25_arg0 )
	return Engine.GetAdjustedWinPercentage( f25_arg0, Engine.GetCurrentArenaSlot() )
end

Lobby.Leaderboard.GetArenaScheduleStrength = function ( f26_arg0 )
	local f26_local0 = Lobby.Leaderboard.GetArenaStats( f26_arg0 )
	return Lobby.Leaderboard.GetArenaAdjustedWinPct( f26_arg0 ) / math.max( 1, Lobby.Leaderboard.GetArenaWinPercentage( f26_arg0 ) )
end

Lobby.Leaderboard.GetArenaGamesPlayed = function ( f27_arg0 )
	local f27_local0 = Lobby.Leaderboard.GetArenaStats( f27_arg0 )
	return f27_local0.wins:get() + f27_local0.losses:get() + f27_local0.ties:get()
end

Lobby.Leaderboard.ArenaMasters = function ( f28_arg0 )
	local f28_local0 = f28_arg0.lbNameID
	local f28_local1 = f28_arg0.lbColName
	local f28_local2 = f28_arg0.controller
	if f28_local1 == "Skill" then
		return Lobby.Leaderboard.GetArenaSkill( f28_local2 )
	elseif f28_local1 == "Power Rating" then
		return Lobby.Leaderboard.GetArenaPowerRating( f28_local2 )
	elseif f28_local1 == "Win Pct" then
		return Lobby.Leaderboard.GetArenaWinPercentage( f28_local2 )
	elseif f28_local1 == "Schedule Strength" then
		return Lobby.Leaderboard.GetArenaScheduleStrength( f28_local2 )
	elseif f28_local1 == "Adjusted Win Pct" then
		return Lobby.Leaderboard.GetArenaAdjustedWinPct( f28_local2 )
	elseif f28_local1 == "Games Played" then
		return Lobby.Leaderboard.GetArenaGamesPlayed( f28_local2 )
	else
		return Lobby.Leaderboard.CALC_NOT_FOUND
	end
end

Lobby.Leaderboard.Anticheat = function ( f29_arg0 )
	local f29_local0 = f29_arg0.lbNameID
	local f29_local1 = 0
	local f29_local2 = f29_arg0.controller
	local f29_local3 = f29_arg0.lbTrackType
	if f29_arg0.lbColName == "XUID Mismatch" then
		return Lobby.Leaderboard.XUIDMismatch( f29_local2 )
	else
		return f29_local1
	end
end

Lobby.Leaderboard.CustomData = function ( f30_arg0 )
	local f30_local0 = f30_arg0.lbColName
	local f30_local1 = f30_arg0.controller
	if f30_local0 == "Score Per Minute" then
		return math.max( 0, (Engine.Leaderboard_GetScoreboardStat( f30_local1, "Score" ) + Engine.Leaderboard_GetCachedByColName( f30_local1, "Score" )) / (math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetScoreboardStat( f30_local1, "TimePlayed" ) ) + Engine.Leaderboard_GetCachedByColName( f30_local1, "Time Played" )) / 60 )
	elseif f30_local0 == "Time Played" then
		return math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetScoreboardStat( f30_local1, "TimePlayed" ) )
	elseif f30_local0 == "W/L Ratio" then
		local f30_local2 = Engine.Leaderboard_GetCachedByColName( f30_local1, "Wins" )
		local f30_local3 = Engine.Leaderboard_GetCachedByColName( f30_local1, "Losses" )
		local f30_local4 = Engine.Leaderboard_GetScoreboardStat( f30_local1, "victory" )
		if f30_local4 == Lobby.Leaderboard.GAME_RESULT.WIN then
			f30_local2 = f30_local2 + 1
		elseif f30_local4 == Lobby.Leaderboard.GAME_RESULT.LOSS then
			f30_local3 = f30_local3 + 1
		end
		return math.max( 0, f30_local2 / math.max( 1, f30_local3 ) ) * 100
	elseif f30_local0 == "Wins" then
		if Engine.Leaderboard_GetScoreboardStat( f30_local1, "victory" ) == Lobby.Leaderboard.GAME_RESULT.WIN then
			return 1
		else
			return 0
		end
	elseif f30_local0 == "Losses" then
		if Engine.Leaderboard_GetScoreboardStat( f30_local1, "victory" ) == Lobby.Leaderboard.GAME_RESULT.LOSS then
			return 1
		else
			return 0
		end
	elseif f30_local0 == "Current Win Streak" then
		if Engine.Leaderboard_GetScoreboardStat( f30_local1, "victory" ) == 2 then
			return Engine.Leaderboard_GetCached( f30_local1, 4 ) + 1
		else
			return 0
		end
	elseif f30_local0 == "Max Win Streak" then
		if Engine.Leaderboard_GetScoreboardStat( f30_local1, "victory" ) == 2 then
			return Engine.Leaderboard_GetCached( f30_local1, 4 ) + 1
		else
			return 0
		end
	elseif f30_local0 == "Shots Hit" then
		return Engine.Leaderboard_GetScoreboardStat( f30_local1, "shots_hit" )
	elseif f30_local0 == "Shots Missed" then
		return Engine.Leaderboard_GetScoreboardStat( f30_local1, "shots_missed" )
	elseif f30_local0 == "Confirms" then
		return Engine.Leaderboard_GetScoreboardStat( f30_local1, "kills_confirmed" )
	elseif f30_local0 == "Denies" then
		return Engine.Leaderboard_GetScoreboardStat( f30_local1, "kills_denied" )
	elseif f30_local0 == "Clean Deposits" then
		return Engine.Leaderboard_GetScoreboardStat( f30_local1, "clean_deposits" )
	elseif f30_local0 == "Clean Denies" then
		return Engine.Leaderboard_GetScoreboardStat( f30_local1, "clean_denies" )
	elseif f30_local0 == "Captured Time" then
		return Engine.Leaderboard_GetScoreboardStat( f30_local1, "objtime" )
	elseif f30_local0 == "KOTH Avg Time" then
		return (Engine.Leaderboard_GetCachedByColName( f30_local1, "Captured Time" ) + Engine.Leaderboard_GetScoreboardStat( f30_local1, "objtime" )) / math.max( 1, Engine.Leaderboard_GetCachedByColName( f30_local1, "Games Played" ) + 1 )
	elseif f30_local0 == "Points Per Game" then
		return math.max( 0, (Engine.Leaderboard_GetScoreboardStat( f30_local1, "points" ) + Engine.Leaderboard_GetCachedByColName( f30_local1, "Points" )) / (Lobby.Leaderboard.GetGamesPlayed( f30_local1 ) + Engine.Leaderboard_GetCachedByColName( f30_local1, "Games Played" )) )
	elseif f30_local0 == "Escort Time" then
		return Engine.Leaderboard_GetScoreboardStat( f30_local1, "escorts" )
	elseif f30_local0 == "ESCORT Avg Time" then
		return (Engine.Leaderboard_GetScoreboardStat( f30_local1, "escorts" ) + Engine.Leaderboard_GetCachedByColName( f30_local1, "Escort Time" )) / math.max( 1, Lobby.Leaderboard.GetGamesPlayed( f30_local1 ) + Engine.Leaderboard_GetCachedByColName( f30_local1, "Games Played" ) )
	else
		return Lobby.Leaderboard.CALC_NOT_FOUND
	end
end

Lobby.Leaderboard.Custom = function ( f31_arg0 )
	local f31_local0 = f31_arg0.lbNameID
	local f31_local1 = f31_arg0.lbColName
	local f31_local2 = f31_arg0.controller
	local f31_local3 = 0
	f31_local3 = Lobby.Leaderboard.CustomData( f31_arg0 )
	if f31_local3 == Lobby.Leaderboard.CALC_NOT_FOUND then
		f31_local3 = Engine.Leaderboard_GetScoreboardStat( f31_local2, f31_local1 )
	end
	return f31_local3
end

Lobby.Leaderboard.CalculateLBColValue = function ( f32_arg0 )
	local f32_local0 = f32_arg0.controller
	local f32_local1 = f32_arg0.lbNameID
	local f32_local2 = f32_arg0.lbTrackType
	local f32_local3 = f32_arg0.lbColName
	local f32_local4 = 0
	if Lobby.Leaderboard.StartsWith( f32_local1, "LB_MP_GB_" ) then
		f32_local4 = Lobby.Leaderboard.Global( f32_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f32_local1, "LB_MP_GM_" ) then
		f32_local4 = Lobby.Leaderboard.Gamemode( f32_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f32_local1, "LB_MP_FRIEND_" ) then
		f32_local4 = Lobby.Leaderboard.Friend( f32_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f32_local1, "LB_MP_ARENA_MASTERS_" ) then
		f32_local4 = Lobby.Leaderboard.ArenaMasters( f32_arg0 )
		if f32_local4 == Lobby.Leaderboard.CALC_NOT_FOUND then
			f32_local4 = 0
		end
	elseif Lobby.Leaderboard.StartsWith( f32_local1, "LB_MP_ANTICHEAT_GLOBAL" ) then
		f32_local4 = Lobby.Leaderboard.Anticheat( f32_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f32_local1, "LB_MP_CG_" ) then
		f32_local4 = Lobby.Leaderboard.Custom( f32_arg0 )
	end
	return f32_local4
end

Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS = function ( f33_arg0 )
	if Engine.Leaderboard_GetDeltaStat( f33_arg0.controller, "playerstatslist", "headshots", "statvalue" ) > 0 then
		return true
	else
		return false
	end
end

Lobby.Leaderboard.ShouldWriteFriend = function ( f34_arg0 )
	local f34_local0 = f34_arg0.controller
	local f34_local1 = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local f34_local2 = f34_local1.gametype
	local f34_local3 = f34_arg0.lbNameID
	local f34_local4 = "ball conf ctf dem dom escort"
	local f34_local5 = "gun koth sd tdm dm"
	if Lobby.Leaderboard.StartsWith( f34_local3, "LB_MP_FRIEND_A" ) and string.match( f34_local4, f34_local2 ) and Lobby.Leaderboard.GetScore( f34_local0 ) > 0 then
		return true
	elseif Lobby.Leaderboard.StartsWith( f34_local3, "LB_MP_FRIEND_B" ) and string.match( f34_local5, f34_local2 ) and Lobby.Leaderboard.GetScore( f34_local0 ) > 0 then
		return true
	else
		return false
	end
end

Lobby.Leaderboard.OnShouldWriteLeaderboard = function ( f35_arg0 )
	local f35_local0 = f35_arg0.mode
	local f35_local1 = f35_arg0.lbNameID
	local f35_local2 = f35_arg0.controller
	if not Engine.IsDedicatedServer() then
		local f35_local3 = -1
		if f35_local0 == Enum.eModes.MODE_MULTIPLAYER then
			f35_local3 = LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_MP
		elseif f35_local0 == Enum.eModes.MODE_ZOMBIES then
			f35_local3 = LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_ZM
		elseif f35_local0 == Enum.eModes.MODE_CAMPAIGN then
			f35_local3 = LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_CP
		end
		if f35_local3 >= 0 then
			local f35_local4, f35_local5 = Lobby.Anticheat.CheckIsFeatureBannedForIndex( f35_local2, f35_local3 )
			if f35_local4 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LEADERBOARDS, "Controller " .. f35_local2 .. " is banned from writing to this mode's leaderboards\n" )
				return false
			end
		end
	end
	if f35_local1 == "LB_MP_GB_HEADSHOTS" then
		local f35_local3 = Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS( f35_arg0 )
		if not f35_local3 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LEADERBOARDS, "Not uploading anticheat leaderboard " .. f35_local1 .. " on controller index " .. f35_local2 - 1 .. ": Leaderboard condition did not pass, or leaderboard is not registered anticheat in lobby.lua\n" )
		end
		return f35_local3
	elseif f35_local1 == "LB_MP_GB_DEATHS" then
		return true
	elseif Lobby.Leaderboard.StartsWith( f35_local1, "LB_MP_ARENA_MASTERS_" ) then
		return Engine.IsArenaMaster( f35_local2, Engine.GetCurrentArenaSlot() )
	elseif CoDShared.IsGameTypeDOA() and (Lobby.Leaderboard.StartsWith( f35_local1, "LB_CP_DOA_BO3_SCORE_" ) or Lobby.Leaderboard.StartsWith( f35_local1, "LB_CP_DOA_BO3_ROUND_" )) then
		local f35_local3 = Engine.GetPlayerStats( f35_local2 )
		local f35_local4 = f35_local3.deadOpsArcade.numPlayers:get()
		local f35_local5 = tonumber( string.sub( f35_local1, 21, -7 ) )
		return f35_local5 and f35_local5 == f35_local4
	elseif Lobby.Leaderboard.StartsWith( f35_local1, "LB_MP_FRIEND_" ) then
		result = Lobby.Leaderboard.ShouldWriteFriend( f35_arg0 )
		return result
	end
	return true
end

