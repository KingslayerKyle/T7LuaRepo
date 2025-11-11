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
Lobby.Leaderboard.StartsWith = function ( long, start )
	return string.sub( long, 1, string.len( start ) ) == start
end

Lobby.Leaderboard.XUIDMismatch = function ( controller )
	local currentStats = Engine.GetPlayerStats( controller )
	local controllerXuid = Engine.GetXUIDString( controller )
	if currentStats.playerxuid:get() ~= controllerXuid then
		return 1
	else
		return 0
	end
end

Lobby.Leaderboard.OnClientAdded = function ( data )
	if data.lobbyModule ~= Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		return 
	end
	local currentUIScreen = Engine.GetLobbyUIScreen()
	local f3_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
	if currentUIScreen ~= f3_local0.id then
		return 
	end
	local xuid = data.xuid
	if Engine.IsLocalClient( xuid ) == true or Engine.IsFriendFromXUID( Engine.GetPrimaryController(), xuid ) == true then
		return 
	end
	for index, client in pairs( Lobby.Leaderboard.customMatchRecentlyPlayed ) do
		if client.xuid == xuid then
			table.remove( Lobby.Leaderboard.customMatchRecentlyPlayed, index )
			break
		end
	end
	if #Lobby.Leaderboard.customMatchRecentlyPlayed >= LuaDefine.LEADERBOARD_MAX_ROWS - 1 then
		table.remove( Lobby.Leaderboard.customMatchRecentlyPlayed, 1 )
	end
	table.insert( Lobby.Leaderboard.customMatchRecentlyPlayed, {
		xuid = xuid
	} )
end

Lobby.Leaderboard.PopulateCustomList = function ( data )
	local xuid = Engine.GetXUID64( data.controller )
	table.insert( Lobby.Leaderboard.customMatchRecentlyPlayed, {
		xuid = xuid
	} )
	Engine.LeaderboardPopulateCustomList( Lobby.Leaderboard.customMatchRecentlyPlayed )
	table.remove( Lobby.Leaderboard.customMatchRecentlyPlayed, #Lobby.Leaderboard.customMatchRecentlyPlayed )
end

Lobby.Leaderboard.GetScore = function ( controller )
	local score = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "score", "statvalue" )
	return math.max( 0, score )
end

Lobby.Leaderboard.GetPointsPerGame = function ( data, controller, lbTrackType )
	local lbID = data.lbNameID
	if Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_" ) then
		local games = Lobby.Leaderboard.GetGamesPlayed( controller )
		games = games + Engine.Leaderboard_GetCachedByColName( controller, "Games Played" )
		if lbTrackType == Enum.LbTrackType.LB_TRK_ALLTIME and games < LuaEnum.LB_MP_GAMES_NEEDED.ALLTIME then
			return -1
		elseif lbTrackType == Enum.LbTrackType.LB_TRK_MONTHLY and games < LuaEnum.LB_MP_GAMES_NEEDED.MONTHLY then
			return -1
		elseif lbTrackType == Enum.LbTrackType.LB_TRK_WEEKLY and games < LuaEnum.LB_MP_GAMES_NEEDED.WEEKLY then
			return -1
		end
	end
	local points = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "score", "statvalue" )
	points = points + Engine.Leaderboard_GetCachedByColName( controller, "Points" )
	local games = Lobby.Leaderboard.GetGamesPlayed( controller )
	local pointsPerGame = points / (games + Engine.Leaderboard_GetCachedByColName( controller, "Games Played" ))
	return math.max( 0, pointsPerGame )
end

Lobby.Leaderboard.GetScorePerMinute = function ( data, controller, lbTrackType )
	local lbID = data.lbNameID
	if Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_" ) then
		local games = Lobby.Leaderboard.GetGamesPlayed( controller )
		games = games + Engine.Leaderboard_GetCachedByColName( controller, "Games Played" )
		if lbTrackType == Enum.LbTrackType.LB_TRK_ALLTIME and games < LuaEnum.LB_MP_GAMES_NEEDED.ALLTIME then
			return -1
		elseif lbTrackType == Enum.LbTrackType.LB_TRK_MONTHLY and games < LuaEnum.LB_MP_GAMES_NEEDED.MONTHLY then
			return -1
		elseif lbTrackType == Enum.LbTrackType.LB_TRK_WEEKLY and games < LuaEnum.LB_MP_GAMES_NEEDED.WEEKLY then
			return -1
		end
	end
	local score = Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "score", "statvalue" )
	score = score + Engine.Leaderboard_GetCachedByColName( controller, "Score" )
	local time = math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "time_played_total", "statvalue" ) )
	local scorePerMinute = score / (time + Engine.Leaderboard_GetCachedByColName( controller, "Time Played" )) / 60
	return math.max( 0, scorePerMinute )
end

Lobby.Leaderboard.GetKillDeathRatio = function ( controller )
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

Lobby.Leaderboard.GetPrestige = function ( controller )
	local plevel = Engine.GetDStat( controller, "playerstatslist", "plevel", "statvalue" )
	if LuaUtils.IsGameModeParagonCapable( Engine.CurrentSessionMode() ) and plevel == Engine.GetPrestigeCap() then
		local paragonRank = Engine.GetDStat( controller, "playerstatslist", "paragon_rank", "statvalue" )
		local paragonIconId = Engine.GetDStat( controller, "playerstatslist", "paragon_icon_id", "statvalue" )
		return LuaUtils.ConvertToPrestigeMerged( plevel, paragonRank, paragonIconId )
	else
		return plevel
	end
end

Lobby.Leaderboard.GeneralCalc = function ( data )
	local controller = data.controller
	local lbTrackType = data.lbTrackType
	local colName = data.lbColName
	if colName == "Time Played" then
		return Lobby.Leaderboard.GetTimePlayed( controller )
	elseif colName == "Score Per Minute" then
		return Lobby.Leaderboard.GetScorePerMinute( data, controller, lbTrackType )
	elseif colName == "Games Played" then
		return Lobby.Leaderboard.GetGamesPlayed( controller )
	elseif colName == "Points Per Game" then
		return Lobby.Leaderboard.GetPointsPerGame( data, controller, lbTrackType )
	elseif colName == "Prestige Level" then
		return Lobby.Leaderboard.GetPrestige( controller )
	else
		return Lobby.Leaderboard.CALC_NOT_FOUND
	end
end

Lobby.Leaderboard.IsFreeRunMap = function ( maps, mapName )
	if maps[mapName] then
		local f13_local0
		if maps[mapName].isFreeRunMap == nil or maps[mapName].isFreeRunMap ~= true then
			f13_local0 = false
		else
			f13_local0 = true
		end
		return f13_local0
	else
		return false
	end
end

Lobby.Leaderboard.GetBestTimeForFreerunMap = function ( controller, mapName )
	local maps = Engine.GetGDTMapsTable()
	if not Lobby.Leaderboard.IsFreeRunMap( maps, mapName ) then
		return 0
	end
	local currentMapBest = 0
	local freerunStats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_FR_STATS_ONLINE )
	if mapName and freerunStats then
		local map = maps[mapName]
		if map then
			local trackIndex = map.freerunTrackIndex
			if trackIndex then
				currentMapBest = freerunStats.freerunTrackTimes.track[trackIndex].topTimes[0].time:get()
			end
		end
	end
	if currentMapBest == nil then
		return 0
	end
	return currentMapBest
end

Lobby.Leaderboard.Global = function ( data )
	local lbID = data.lbNameID
	local result = 0
	result = Lobby.Leaderboard.GeneralCalc( data )
	if result ~= Lobby.Leaderboard.CALC_NOT_FOUND then
		return result
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_KOTH = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "KOTH Avg Time" then
		local gamesPlayed = Engine.Leaderboard_GetCachedByColName( controller, "Games Played" ) + 1
		local capturedTime = Engine.Leaderboard_GetCachedByColName( controller, "Captured Time" )
		return (capturedTime + Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "objective_time", "statvalue" )) / math.max( 1, gamesPlayed )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_ESCORT = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "ESCORT Avg Time" then
		local gamesPlayed = Engine.Leaderboard_GetCachedByColName( controller, "Games Played" ) + 1
		local escortTime = Engine.Leaderboard_GetCachedByColName( controller, "Escort Time" )
		return (escortTime + Engine.Leaderboard_GetDeltaStat( controller, "playerstatslist", "escorts", "statvalue" )) / math.max( 1, gamesPlayed )
	else
		return 0
	end
end

Lobby.Leaderboard.LB_MP_GM_FR = function ( data )
	local lbID = data.lbNameID
	local colName = data.lbColName
	local controller = data.controller
	local result = 0
	if colName == "FREERUN Time" then
		local mapName = Dvar.ui_mapname:get()
		local bestTime = Lobby.Leaderboard.GetBestTimeForFreerunMap( controller, mapName )
		result = math.max( 0, LuaDefine.LUA_INT_MAX - bestTime )
	end
	return result
end

Lobby.Leaderboard.Friend = function ( data )
	local result = 0
	local colName = data.lbColName
	local controller = data.controller
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local gameData = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	local gameType = gameData.gametype
	if colName == gameType then
		result = Lobby.Leaderboard.GetScore( controller )
	end
	return result
end

Lobby.Leaderboard.Gamemode = function ( data )
	local lbID = data.lbNameID
	local result = 0
	result = Lobby.Leaderboard.GeneralCalc( data )
	if result ~= Lobby.Leaderboard.CALC_NOT_FOUND then
		return result
	else
		result = 0
		if Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_KOTH" ) then
			return Lobby.Leaderboard.LB_MP_GM_KOTH( data )
		elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_ESCORT" ) then
			return Lobby.Leaderboard.LB_MP_GM_ESCORT( data )
		elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_FR_" ) then
			return Lobby.Leaderboard.LB_MP_GM_FR( data )
		else
			return result
		end
	end
end

Lobby.Leaderboard.GetArenaStats = function ( controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local arenaSlot = Engine.GetCurrentArenaSlot()
	return stats.arenaStats[arenaSlot]
end

Lobby.Leaderboard.GetArenaSkill = function ( controller )
	local arenaStats = Lobby.Leaderboard.GetArenaStats( controller )
	return arenaStats.skill:get()
end

Lobby.Leaderboard.GetArenaPowerRating = function ( controller )
	local arenaStats = Lobby.Leaderboard.GetArenaStats( controller )
	local skill = arenaStats.skill:get()
	return LuaUtils.GetArenaPowerRating( skill )
end

Lobby.Leaderboard.GetArenaWinPercentage = function ( controller )
	local arenaStats = Lobby.Leaderboard.GetArenaStats( controller )
	local wins = arenaStats.wins:get()
	local losses = arenaStats.losses:get()
	return wins / math.max( wins + losses, 1 )
end

Lobby.Leaderboard.GetArenaAdjustedWinPct = function ( controller )
	local arenaSlot = Engine.GetCurrentArenaSlot()
	local adjustedWinPct = Engine.GetAdjustedWinPercentage( controller, arenaSlot )
	return adjustedWinPct
end

Lobby.Leaderboard.GetArenaScheduleStrength = function ( controller )
	local arenaStats = Lobby.Leaderboard.GetArenaStats( controller )
	local adjustedWinPct = Lobby.Leaderboard.GetArenaAdjustedWinPct( controller )
	local actualWinPct = Lobby.Leaderboard.GetArenaWinPercentage( controller )
	return adjustedWinPct / math.max( 1, actualWinPct )
end

Lobby.Leaderboard.GetArenaGamesPlayed = function ( controller )
	local arenaStats = Lobby.Leaderboard.GetArenaStats( controller )
	local wins = arenaStats.wins:get()
	local losses = arenaStats.losses:get()
	local ties = arenaStats.ties:get()
	return wins + losses + ties
end

Lobby.Leaderboard.ArenaMasters = function ( data )
	local lbID = data.lbNameID
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Skill" then
		return Lobby.Leaderboard.GetArenaSkill( controller )
	elseif colName == "Power Rating" then
		return Lobby.Leaderboard.GetArenaPowerRating( controller )
	elseif colName == "Win Pct" then
		return Lobby.Leaderboard.GetArenaWinPercentage( controller )
	elseif colName == "Schedule Strength" then
		return Lobby.Leaderboard.GetArenaScheduleStrength( controller )
	elseif colName == "Adjusted Win Pct" then
		return Lobby.Leaderboard.GetArenaAdjustedWinPct( controller )
	elseif colName == "Games Played" then
		return Lobby.Leaderboard.GetArenaGamesPlayed( controller )
	else
		return Lobby.Leaderboard.CALC_NOT_FOUND
	end
end

Lobby.Leaderboard.Anticheat = function ( data )
	local lbID = data.lbNameID
	local result = 0
	local controller = data.controller
	local lbTrackType = data.lbTrackType
	local colName = data.lbColName
	if colName == "XUID Mismatch" then
		return Lobby.Leaderboard.XUIDMismatch( controller )
	else
		return result
	end
end

Lobby.Leaderboard.CustomData = function ( data )
	local colName = data.lbColName
	local controller = data.controller
	if colName == "Score Per Minute" then
		local score = Engine.Leaderboard_GetScoreboardStat( controller, "Score" )
		score = score + Engine.Leaderboard_GetCachedByColName( controller, "Score" )
		local time = math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetScoreboardStat( controller, "TimePlayed" ) )
		local scorePerMinute = score / (time + Engine.Leaderboard_GetCachedByColName( controller, "Time Played" )) / 60
		return math.max( 0, scorePerMinute )
	elseif colName == "Time Played" then
		return math.max( Lobby.Leaderboard.MIN_PLAY_TIME, Engine.Leaderboard_GetScoreboardStat( controller, "TimePlayed" ) )
	elseif colName == "W/L Ratio" then
		local wins = Engine.Leaderboard_GetCachedByColName( controller, "Wins" )
		local losses = Engine.Leaderboard_GetCachedByColName( controller, "Losses" )
		local curGameOutcome = Engine.Leaderboard_GetScoreboardStat( controller, "victory" )
		if curGameOutcome == Lobby.Leaderboard.GAME_RESULT.WIN then
			wins = wins + 1
		elseif curGameOutcome == Lobby.Leaderboard.GAME_RESULT.LOSS then
			losses = losses + 1
		end
		local wlRatio = math.max( 0, wins / math.max( 1, losses ) )
		return wlRatio * 100
	elseif colName == "Wins" then
		if Engine.Leaderboard_GetScoreboardStat( controller, "victory" ) == Lobby.Leaderboard.GAME_RESULT.WIN then
			return 1
		else
			return 0
		end
	elseif colName == "Losses" then
		if Engine.Leaderboard_GetScoreboardStat( controller, "victory" ) == Lobby.Leaderboard.GAME_RESULT.LOSS then
			return 1
		else
			return 0
		end
	elseif colName == "Current Win Streak" then
		if Engine.Leaderboard_GetScoreboardStat( controller, "victory" ) == 2 then
			return Engine.Leaderboard_GetCached( controller, 4 ) + 1
		else
			return 0
		end
	elseif colName == "Max Win Streak" then
		if Engine.Leaderboard_GetScoreboardStat( controller, "victory" ) == 2 then
			return Engine.Leaderboard_GetCached( controller, 4 ) + 1
		else
			return 0
		end
	elseif colName == "Shots Hit" then
		return Engine.Leaderboard_GetScoreboardStat( controller, "shots_hit" )
	elseif colName == "Shots Missed" then
		return Engine.Leaderboard_GetScoreboardStat( controller, "shots_missed" )
	elseif colName == "Confirms" then
		return Engine.Leaderboard_GetScoreboardStat( controller, "kills_confirmed" )
	elseif colName == "Denies" then
		return Engine.Leaderboard_GetScoreboardStat( controller, "kills_denied" )
	elseif colName == "Clean Deposits" then
		return Engine.Leaderboard_GetScoreboardStat( controller, "clean_deposits" )
	elseif colName == "Clean Denies" then
		return Engine.Leaderboard_GetScoreboardStat( controller, "clean_denies" )
	elseif colName == "Captured Time" then
		return Engine.Leaderboard_GetScoreboardStat( controller, "objtime" )
	elseif colName == "KOTH Avg Time" then
		local gamesPlayed = Engine.Leaderboard_GetCachedByColName( controller, "Games Played" ) + 1
		local capturedTime = Engine.Leaderboard_GetCachedByColName( controller, "Captured Time" )
		return (capturedTime + Engine.Leaderboard_GetScoreboardStat( controller, "objtime" )) / math.max( 1, gamesPlayed )
	elseif colName == "Points Per Game" then
		local points = Engine.Leaderboard_GetScoreboardStat( controller, "points" )
		points = points + Engine.Leaderboard_GetCachedByColName( controller, "Points" )
		local gamesPlayed = Lobby.Leaderboard.GetGamesPlayed( controller )
		local pointsPerGame = points / (gamesPlayed + Engine.Leaderboard_GetCachedByColName( controller, "Games Played" ))
		return math.max( 0, pointsPerGame )
	elseif colName == "Escort Time" then
		return Engine.Leaderboard_GetScoreboardStat( controller, "escorts" )
	elseif colName == "ESCORT Avg Time" then
		local escortTime = Engine.Leaderboard_GetScoreboardStat( controller, "escorts" )
		escortTime = escortTime + Engine.Leaderboard_GetCachedByColName( controller, "Escort Time" )
		local gamesPlayed = Lobby.Leaderboard.GetGamesPlayed( controller )
		return escortTime / math.max( 1, gamesPlayed + Engine.Leaderboard_GetCachedByColName( controller, "Games Played" ) )
	else
		return Lobby.Leaderboard.CALC_NOT_FOUND
	end
end

Lobby.Leaderboard.Custom = function ( data )
	local lbID = data.lbNameID
	local colName = data.lbColName
	local controller = data.controller
	local result = 0
	result = Lobby.Leaderboard.CustomData( data )
	if result == Lobby.Leaderboard.CALC_NOT_FOUND then
		result = Engine.Leaderboard_GetScoreboardStat( controller, colName )
	end
	return result
end

Lobby.Leaderboard.OnCalculateLBColValue = function ( data )
	local controller = data.controller
	local lbID = data.lbNameID
	local lbTrackType = data.lbTrackType
	local colName = data.lbColName
	local result = 0
	if Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GB_" ) then
		result = Lobby.Leaderboard.Global( data )
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_GM_" ) then
		result = Lobby.Leaderboard.Gamemode( data )
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_FRIEND_" ) then
		result = Lobby.Leaderboard.Friend( data )
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_ARENA_MASTERS_" ) then
		result = Lobby.Leaderboard.ArenaMasters( data )
		if result == Lobby.Leaderboard.CALC_NOT_FOUND then
			result = 0
		end
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_ANTICHEAT_GLOBAL" ) then
		result = Lobby.Leaderboard.Anticheat( data )
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_CG_" ) then
		result = Lobby.Leaderboard.Custom( data )
	end
	return result
end

Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS = function ( data )
	local headshots = Engine.Leaderboard_GetDeltaStat( data.controller, "playerstatslist", "headshots", "statvalue" )
	if headshots > 0 then
		return true
	else
		return false
	end
end

Lobby.Leaderboard.ShouldWriteFriend = function ( data )
	local controller = data.controller
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local gameData = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	local gameType = gameData.gametype
	local lbID = data.lbNameID
	local friendACols = "ball conf ctf dem dom escort"
	local friendBCols = "gun koth sd tdm dm"
	if Lobby.Leaderboard.StartsWith( lbID, "LB_MP_FRIEND_A" ) and string.match( friendACols, gameType ) and Lobby.Leaderboard.GetScore( controller ) > 0 then
		return true
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_FRIEND_B" ) and string.match( friendBCols, gameType ) and Lobby.Leaderboard.GetScore( controller ) > 0 then
		return true
	else
		return false
	end
end

Lobby.Leaderboard.OnShouldWriteLeaderboard = function ( data )
	local mode = data.mode
	local lbID = data.lbNameID
	local controller = data.controller
	if not Engine.IsDedicatedServer() then
		local featureBan = -1
		if mode == Enum.eModes.MODE_MULTIPLAYER then
			featureBan = LuaEnum.FEATURE_BAN.LEADERBOARD_WRITE_MP
		elseif mode == Enum.eModes.MODE_ZOMBIES then
			featureBan = LuaEnum.FEATURE_BAN.LEADERBOARD_WRITE_ZM
		elseif mode == Enum.eModes.MODE_CAMPAIGN then
			featureBan = LuaEnum.FEATURE_BAN.LEADERBOARD_WRITE_CP
		end
		if featureBan >= 0 then
			local isBanned, feature = Lobby.Anticheat.CheckIsFeatureBannedForIndex( controller, featureBan )
			if isBanned then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LEADERBOARDS, "Controller " .. controller .. " is banned from writing to this mode's leaderboards\n" )
				return false
			end
		end
	end
	if lbID == "LB_MP_GB_HEADSHOTS" then
		local success = Lobby.Leaderboard.ShouldWrite_LB_MP_GB_HEADSHOTS( data )
		if not success then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LEADERBOARDS, "Not uploading anticheat leaderboard " .. lbID .. " on controller index " .. controller - 1 .. ": Leaderboard condition did not pass, or leaderboard is not registered anticheat in lobby.lua\n" )
		end
		return success
	elseif lbID == "LB_MP_GB_DEATHS" then
		return true
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_ARENA_MASTERS_" ) then
		local arenaSlot = Engine.GetCurrentArenaSlot()
		return Engine.IsArenaMaster( controller, arenaSlot )
	elseif CoDShared.IsGameTypeDOA() and (Lobby.Leaderboard.StartsWith( lbID, "LB_CP_DOA_BO3_SCORE_" ) or Lobby.Leaderboard.StartsWith( lbID, "LB_CP_DOA_BO3_ROUND_" )) then
		local currentStats = Engine.GetPlayerStats( controller )
		local numPlayersLastGame = currentStats.deadOpsArcade.numPlayers:get()
		local leaderboardNumPlayers = tonumber( string.sub( lbID, 21, -7 ) )
		return leaderboardNumPlayers and leaderboardNumPlayers == numPlayersLastGame
	elseif Lobby.Leaderboard.StartsWith( lbID, "LB_MP_FRIEND_" ) then
		result = Lobby.Leaderboard.ShouldWriteFriend( data )
		return result
	end
	return true
end

