require( "lua.Lobby.Common.LobbyCore" )

Lobby.Leaderboard = {}
Lobby.Leaderboard.MP = 0
Lobby.Leaderboard.CALC_NOT_FOUND = 0
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
Lobby.Leaderboard.StartsWith = function ( f1_arg0, f1_arg1 )
	return string.sub( f1_arg0, 1, string.len( f1_arg1 ) ) == f1_arg1
end

Lobby.Leaderboard.GetScore = function ( f2_arg0 )
	return math.max( 0, Engine.Leaderboard_GetDeltaStat( f2_arg0, "playerstatslist", "score", "statvalue" ) )
end

Lobby.Leaderboard.GetScorePerMinute = function ( f3_arg0 )
	local f3_local0 = f3_arg0
	return math.max( 0, (Engine.Leaderboard_GetDeltaStat( f3_local0, "playerstatslist", "score", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f3_local0, "Score" )) / (math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetDeltaStat( f3_local0, "playerstatslist", "time_played_total", "statvalue" ) ) + Engine.Leaderboard_GetCachedByColName( f3_local0, "Time Played" )) * 60 )
end

Lobby.Leaderboard.GetKillDeathRatio = function ( f4_arg0 )
	local f4_local0 = f4_arg0
	return math.max( 0, (Engine.Leaderboard_GetDeltaStat( f4_local0, "playerstatslist", "kills", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f4_local0, "Kills" )) / (Engine.Leaderboard_GetDeltaStat( f4_local0, "playerstatslist", "deaths", "statvalue" ) + Engine.Leaderboard_GetCachedByColName( f4_local0, "Deaths" )) * 100 )
end

Lobby.Leaderboard.GetTimePlayed = function ( f5_arg0 )
	return math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetDeltaStat( f5_arg0, "playerstatslist", "time_played_total", "statvalue" ) )
end

Lobby.Leaderboard.GetGamesPlayed = function ( f6_arg0 )
	return 1
end

Lobby.Leaderboard.GeneralCalc = function ( f7_arg0 )
	local f7_local0 = f7_arg0.lbColName
	local f7_local1 = f7_arg0.controller
	if f7_local0 == "Time Played" then
		return Lobby.Leaderboard.GetTimePlayed( f7_local1 )
	elseif f7_local0 == "Score Per Minute" then
		return Lobby.Leaderboard.GetScorePerMinute( f7_local1 )
	elseif f7_local0 == "Games Played" then
		return Lobby.Leaderboard.GetGamesPlayed( f7_local1 )
	else
		return Lobby.Leaderboard.CALC_NOT_FOUND
	end
end

Lobby.Leaderboard.IsFreeRunMap = function ( f8_arg0, f8_arg1 )
	if f8_arg0[f8_arg1] then
		local f8_local0
		if f8_arg0[f8_arg1].isFreeRunMap == nil or f8_arg0[f8_arg1].isFreeRunMap ~= true then
			f8_local0 = false
		else
			f8_local0 = true
		end
		return f8_local0
	else
		return false
	end
end

Lobby.Leaderboard.GetBestTimeForFreerunMap = function ( f9_arg0, f9_arg1 )
	local f9_local0 = Engine.GetGDTMapsTable()
	if not Lobby.Leaderboard.IsFreeRunMap( f9_local0, f9_arg1 ) then
		return 0
	end
	local f9_local1 = 0
	local f9_local2 = Engine.StorageGetBuffer( f9_arg0, Enum.StorageFileType.STORAGE_FR_STATS_ONLINE )
	if f9_arg1 and f9_local2 then
		local f9_local3 = f9_local0[f9_arg1]
		if f9_local3 then
			local f9_local4 = f9_local3.freerunTrackIndex
			if f9_local4 then
				f9_local1 = f9_local2.freerunTrackTimes.track[f9_local4].topTimes[0].time:get()
			end
		end
	end
	if f9_local1 == nil then
		return 0
	end
	return f9_local1
end

Lobby.Leaderboard.Global = function ( f10_arg0 )
	local f10_local0 = f10_arg0.lbNameID
	local f10_local1 = 0
	f10_local1 = Lobby.Leaderboard.GeneralCalc( f10_arg0 )
	if f10_local1 ~= Lobby.Leaderboard.CALC_NOT_FOUND then
		return f10_local1
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_KOTH = function ( f11_arg0 )
	local f11_local0 = f11_arg0.lbColName
	local f11_local1 = f11_arg0.controller
	if f11_local0 == "KOTH Avg Time" then
		return (Engine.Leaderboard_GetCachedByColName( f11_local1, "Captured Time" ) + Engine.Leaderboard_GetDeltaStat( f11_local1, "playerstatslist", "objective_time", "statvalue" )) / math.max( 1, Engine.Leaderboard_GetCachedByColName( f11_local1, "Games Played" ) + 1 )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_ESCORT = function ( f12_arg0 )
	local f12_local0 = f12_arg0.lbColName
	local f12_local1 = f12_arg0.controller
	if f12_local0 == "ESCORT Avg Time" then
		return (Engine.Leaderboard_GetCachedByColName( f12_local1, "Escort Time" ) + Engine.Leaderboard_GetDeltaStat( f12_local1, "playerstatslist", "escorts", "statvalue" )) / math.max( 1, Engine.Leaderboard_GetCachedByColName( f12_local1, "Games Played" ) + 1 )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_FR = function ( f13_arg0 )
	local f13_local0 = f13_arg0.lbNameID
	local f13_local1 = f13_arg0.lbColName
	local f13_local2 = f13_arg0.controller
	local f13_local3 = 0
	if f13_local1 == "FREERUN Time" then
		f13_local3 = math.max( 0, LuaUtils.LUA_INT_MAX - Lobby.Leaderboard.GetBestTimeForFreerunMap( f13_local2, Dvar.ui_mapname:get() ) )
	end
	return f13_local3
end

Lobby.Leaderboard.Friend = function ( f14_arg0 )
	local f14_local0 = 0
	local f14_local1 = f14_arg0.lbColName
	local f14_local2 = f14_arg0.controller
	local f14_local3 = Engine.LobbyGetGameData()
	if f14_local1 == f14_local3.gametype then
		f14_local0 = Lobby.Leaderboard.GetScore( f14_local2 )
	end
	return f14_local0
end

Lobby.Leaderboard.Gamemode = function ( f15_arg0 )
	local f15_local0 = f15_arg0.lbNameID
	local f15_local1 = 0
	f15_local1 = Lobby.Leaderboard.GeneralCalc( f15_arg0 )
	if f15_local1 ~= Lobby.Leaderboard.CALC_NOT_FOUND then
		return f15_local1
	else
		f15_local1 = 0
		if Lobby.Leaderboard.StartsWith( f15_local0, "LB_MP_GM_KOTH" ) then
			return Lobby.Leaderboard.LB_MP_GM_KOTH( f15_arg0 )
		elseif Lobby.Leaderboard.StartsWith( f15_local0, "LB_MP_GM_ESCORT" ) then
			return Lobby.Leaderboard.LB_MP_GM_ESCORT( f15_arg0 )
		elseif Lobby.Leaderboard.StartsWith( f15_local0, "LB_MP_GM_FR_" ) then
			return Lobby.Leaderboard.LB_MP_GM_FR( f15_arg0 )
		else
			return f15_local1
		end
	end
end

Lobby.Leaderboard.GetArenaStats = function ( f16_arg0 )
	local f16_local0 = Engine.StorageGetBuffer( f16_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	return f16_local0.arenaStats[Engine.GetCurrentArenaSlot()]
end

Lobby.Leaderboard.GetArenaSkill = function ( f17_arg0 )
	local f17_local0 = Lobby.Leaderboard.GetArenaStats( f17_arg0 )
	return f17_local0.skill:get()
end

Lobby.Leaderboard.GetArenaPowerRating = function ( f18_arg0 )
	local f18_local0 = Lobby.Leaderboard.GetArenaStats( f18_arg0 )
	return f18_local0.skill:get() * 1000 + 5000
end

Lobby.Leaderboard.GetArenaWinPercentage = function ( f19_arg0 )
	local f19_local0 = Lobby.Leaderboard.GetArenaStats( f19_arg0 )
	local f19_local1 = f19_local0.wins:get()
	return f19_local1 / math.max( f19_local1 + f19_local0.losses:get(), 1 )
end

Lobby.Leaderboard.GetArenaAdjustedWinPct = function ( f20_arg0 )
	local f20_local0 = Engine.GetCurrentArenaSlot()
	return 1
end

Lobby.Leaderboard.GetArenaScheduleStrength = function ( f21_arg0 )
	local f21_local0 = Lobby.Leaderboard.GetArenaStats( f21_arg0 )
	return Lobby.Leaderboard.GetArenaAdjustedWinPct( f21_arg0 ) / math.max( 1, Lobby.Leaderboard.GetArenaWinPercentage( f21_arg0 ) )
end

Lobby.Leaderboard.GetArenaGamesPlayed = function ( f22_arg0 )
	local f22_local0 = Lobby.Leaderboard.GetArenaStats( f22_arg0 )
	return f22_local0.wins:get() + f22_local0.losses:get() + f22_local0.ties:get()
end

Lobby.Leaderboard.ArenaMasters = function ( f23_arg0 )
	local f23_local0 = f23_arg0.lbNameID
	local f23_local1 = f23_arg0.lbColName
	local f23_local2 = f23_arg0.controller
	if f23_local1 == "Skill" then
		return Lobby.Leaderboard.GetArenaSkill( f23_local2 )
	elseif f23_local1 == "Power Rating" then
		return Lobby.Leaderboard.GetArenaPowerRating( f23_local2 )
	elseif f23_local1 == "Win Pct" then
		return Lobby.Leaderboard.GetArenaWinPercentage( f23_local2 )
	elseif f23_local1 == "Schedule Strength" then
		return Lobby.Leaderboard.GetArenaScheduleStrength( f23_local2 )
	elseif f23_local1 == "Adjusted Win Pct" then
		return Lobby.Leaderboard.GetArenaAdjustedWinPct( f23_local2 )
	elseif f23_local1 == "Games Played" then
		return Lobby.Leaderboard.GetArenaGamesPlayed( f23_local2 )
	else
		return Lobby.Leaderboard.CALC_NOT_FOUND
	end
end

Lobby.Leaderboard.CalculateLBColValue = function ( f24_arg0 )
	local f24_local0 = f24_arg0.controller
	local f24_local1 = f24_arg0.lbNameID
	local f24_local2 = f24_arg0.lbColName
	local f24_local3 = 0
	if Lobby.Leaderboard.StartsWith( f24_local1, "LB_MP_GB_" ) then
		f24_local3 = Lobby.Leaderboard.Global( f24_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f24_local1, "LB_MP_GM_" ) then
		f24_local3 = Lobby.Leaderboard.Gamemode( f24_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f24_local1, "LB_MP_FRIEND_" ) then
		f24_local3 = Lobby.Leaderboard.Friend( f24_arg0 )
	elseif Lobby.Leaderboard.StartsWith( f24_local1, "LB_MP_ARENA_MASTERS_" ) then
		f24_local3 = Lobby.Leaderboard.ArenaMasters( f24_arg0 )
	end
	return f24_local3
end

Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS = function ( f25_arg0 )
	if Engine.Leaderboard_GetDeltaStat( f25_arg0.controller, "playerstatslist", "headshots", "statvalue" ) > 0 then
		return true
	else
		return false
	end
end

Lobby.Leaderboard.ShouldWriteFriend = function ( f26_arg0 )
	local f26_local0 = f26_arg0.controller
	local f26_local1 = Engine.LobbyGetGameData()
	local f26_local2 = f26_local1.gametype
	local f26_local3 = f26_arg0.lbNameID
	local f26_local4 = "ball conf ctf dem dom escort"
	local f26_local5 = "gun koth sd tdm dm"
	if Lobby.Leaderboard.StartsWith( f26_local3, "LB_MP_FRIEND_A" ) and string.match( f26_local4, f26_local2 ) and Lobby.Leaderboard.GetScore( f26_local0 ) > 0 then
		return true
	elseif Lobby.Leaderboard.StartsWith( f26_local3, "LB_MP_FRIEND_B" ) and string.match( f26_local5, f26_local2 ) and Lobby.Leaderboard.GetScore( f26_local0 ) > 0 then
		return true
	else
		return false
	end
end

Lobby.Leaderboard.OnShouldWriteLeaderboard = function ( f27_arg0 )
	local f27_local0 = f27_arg0.mode
	local f27_local1 = f27_arg0.lbNameID
	local f27_local2 = f27_arg0.controller
	if not Engine.IsDedicatedServer() then
		local f27_local3 = -1
		if f27_local0 == Enum.eModes.MODE_MULTIPLAYER then
			f27_local3 = LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_MP
		elseif f27_local0 == Enum.eModes.MODE_ZOMBIES then
			f27_local3 = LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_ZM
		elseif f27_local0 == Enum.eModes.MODE_CAMPAIGN then
			f27_local3 = LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_CP
		end
		if f27_local3 >= 0 then
			local f27_local4, f27_local5 = Lobby.Anticheat.CheckIsFeatureBannedForIndex( f27_local2, f27_local3 )
			if f27_local4 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LEADERBOARDS, "Controller " .. f27_local2 .. " is banned from writing to this mode's leaderboards\n" )
				return false
			end
		end
	end
	if f27_local1 == "LB_MP_GB_HEADSHOTS" then
		local f27_local3 = Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS( f27_arg0 )
		if not f27_local3 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LEADERBOARDS, "Not uploading anticheat leaderboard " .. f27_local1 .. " on controller index " .. f27_local2 - 1 .. ": Leaderboard condition did not pass, or leaderboard is not registered anticheat in lobby.lua\n" )
		end
		return f27_local3
	elseif f27_local1 == "LB_MP_GB_DEATHS" then
		return true
	elseif Lobby.Leaderboard.StartsWith( f27_local1, "LB_MP_ARENA_MASTERS_" ) then
		return Engine.GetArenaPoints( f27_arg0.controller, Engine.GetCurrentArenaSlot() ) >= Engine.GetMaxArenaPoints()
	elseif Lobby.Leaderboard.StartsWith( f27_local1, "LB_MP_FRIEND_" ) then
		result = Lobby.Leaderboard.ShouldWriteFriend( f27_arg0 )
		return result
	end
	return true
end

