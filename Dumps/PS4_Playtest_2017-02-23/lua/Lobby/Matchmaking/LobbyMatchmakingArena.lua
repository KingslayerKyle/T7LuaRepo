require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingArena = {}
Lobby.MatchmakingArena.HandleMerge = function ( stage )
	if stage == Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1 then
		Lobby.MatchmakingArena.DoDedicatedSearch( stage )
	else
		Lobby.MatchmakingArena.DoListenSearch( stage )
	end
end

Lobby.MatchmakingArena.HandleDedicatedSearchStage = function ( stage )
	Lobby.MatchmakingArena.DoDedicatedSearch( stage )
end

Lobby.MatchmakingArena.HandleDedicatedParkedStage = function ( stage )
	if not Lobby.MatchmakingArena.CanHostAnyLobby() then
		Lobby.MatchmakingArena.DoDedicatedSearch( stage )
		return 
	end
	local queryID = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED
	local playlistID = Engine.GetPlaylistID()
	local parkingPlaylist = Engine.GetParkingPlaylistForRealPlaylist( playlistID )
	if parkingPlaylist ~= Lobby.Matchmaking.INVALID_PARKING_PLAYLIST then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.MatchmakingArena.HandleDedicatedParkedStage: No sessions found in playlistID<" .. playlistID .. ">, looking in parkingPlaylist<" .. parkingPlaylist .. ">\n" )
		Lobby.Matchmaking.SetMapPacksOriginal()
		Lobby.Matchmaking.SetPlaylistInfo( parkingPlaylist )
	end
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_EMPTY )
	if Lobby.Matchmaking.SetServerLocation( queryID, stage ) ~= true then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Lobby.MatchmakingArena.HandleDedicatedParkedStage: Failed to set server location, doing a listen search instead\n" )
		Lobby.MatchmakingArena.DoListenSearch( stage )
	else
		Lobby.Matchmaking.SetSkillWeight( 0 )
		Lobby.Matchmaking.SetQueryId( queryID )
	end
end

Lobby.MatchmakingArena.HandleListenStage = function ( stage )
	Lobby.MatchmakingArena.DoListenSearch( stage )
end

Lobby.MatchmakingArena.DoDedicatedSearch = function ( stage )
	local queryID = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED
	if Lobby.Matchmaking.SetServerLocation( queryID, stage ) == true then
		Lobby.Matchmaking.SetPingBandWeight( 1 )
		Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
		Lobby.Matchmaking.SetQueryId( queryID )
	else
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Lobby.MatchmakingArena.DoDedicatedSearch: Failed to set server location, doing a listen search instead\n" )
		if Dvar.arena_enableListenHosting:exists() and Dvar.arena_enableListenHosting:get() then
			Lobby.MatchmakingArena.DoListenSearch( stage )
		end
	end
end

Lobby.MatchmakingArena.DoListenSearch = function ( stage )
	if Dvar.arena_enableListenHosting:exists() and Dvar.arena_enableListenHosting:get() then
		Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_ALL )
	else
		Lobby.MatchmakingArena.DoDedicatedSearch( stage )
	end
end

Lobby.MatchmakingArena.SetupConnectionInfo = function ( controller )
	local connection = Lobby.Matchmaking.GetConnection( controller )
	local excellentPing = Dvar.excellentPing:get()
	local goodPing = Dvar.goodPing:get()
	local terriblePing = Dvar.terriblePing:get()
	if connection == Lobby.Matchmaking.Connection.BEST then
		Lobby.Matchmaking.PingRange( 1, excellentPing )
		Lobby.Matchmaking.MinGeoMatch( 1 )
	elseif connection == Lobby.Matchmaking.Connection.NORMAL then
		Lobby.Matchmaking.PingRange( excellentPing, goodPing )
		Lobby.Matchmaking.MinGeoMatch( 1 )
	else
		Lobby.Matchmaking.PingRange( goodPing, 999 )
		Lobby.Matchmaking.MinGeoMatch( 0 )
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.MatchmakingArena.SetupConnectionInfo: Connection: " .. tostring( connection ) .. "\n" )
end

Lobby.MatchmakingArena.SetupMatchmakingStage = function ( controller )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.MatchmakingArena.SetupMatchmakingStage: Setting up arena matchmaking stage\n" )
	Lobby.Matchmaking.SetShowInMatchmaking( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE )
	Lobby.Matchmaking.SetNetcodeVersion()
	Lobby.Matchmaking.SetGeoLocation()
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	Lobby.Matchmaking.SetGeoWeightTiered( 0.2 )
	Lobby.Matchmaking.SetSkillWeight( 0.01 )
	local stage = Lobby.Matchmaking.NextStage()
	if stage == Lobby.Matchmaking.SearchStage.DONE then
		return false
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.MatchmakingArena.SetupMatchmakingStage: Next Stage: " .. tostring( stage ) .. "\n" )
	Lobby.Matchmaking.SetPlaylistInfo( Engine.GetPlaylistID() )
	if Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.ARENA then
		if stage < Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
			Lobby.MatchmakingArena.HandleDedicatedSearchStage( stage )
		elseif stage == Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
			Lobby.MatchmakingArena.HandleDedicatedParkedStage( stage )
		elseif stage == Lobby.Matchmaking.SearchStage.LISTEN then
			Lobby.MatchmakingArena.HandleListenStage( stage )
		end
	elseif Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.LOBBY_MERGE then
		Lobby.MatchmakingArena.HandleMerge( stage )
	else
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "Lobby.MatchmakingArena.SetupMatchmakingStage Called with Unhandled Search Mode.\n" )
	end
	local slotsNeededOnTeam = Lobby.Matchmaking.GetNumSlotsNeededOnTeam( stage )
	Lobby.Matchmaking.SetTeamSize( slotsNeededOnTeam )
	local playlistID = Engine.GetPlaylistID()
	Dvar.lobbySearchMapPacks:set( Lobby.Matchmaking.GetMapPackBits( Engine.GetDLCBitsForLobby( Enum.LobbyType.LOBBY_TYPE_GAME ), playlistID ) )
	Lobby.MatchmakingArena.SetupConnectionInfo( controller )
	return true
end

Lobby.MatchmakingArena.CanHostAnyLobby = function ()
	local minSkillRange = 10
	if Dvar.arena_minHostSkillRange:exists() then
		minSkillRange = Dvar.arena_minHostSkillRange:get()
	end
	local maxQOSedRange = Lobby.Matchmaking.SearchParams.searchInfo.maxQOSedRange
	if maxQOSedRange then
		return minSkillRange < maxQOSedRange
	else
		local timeBasedRange = Lobby.MatchmakingArena.GetArenaSkillRange()
		return minSkillRange < timeBasedRange / 2
	end
end

Lobby.MatchmakingArena.GetArenaSkillRange = function ( logQoS )
	local startTime = Lobby.Matchmaking.SearchParams.searchInfo.startTime
	if startTime == nil then
		return 0
	end
	local now = Engine.milliseconds()
	local searchTimeMS = now - startTime
	local searchTimeSeconds = searchTimeMS / 1000
	local baseSkillRange = 0
	if Dvar.arena_qosSkillStart:exists() then
		baseSkillRange = Dvar.arena_qosSkillStart:get()
	end
	local skillStep = 1
	if Dvar.arena_qosBrodenSkillStep:exists() then
		skillStep = Dvar.arena_qosBrodenSkillStep:get()
	end
	local broadenFrequency = 2
	if Dvar.arena_qosBrodenSkillFrequency:exists() then
		broadenFrequency = Dvar.arena_qosBrodenSkillFrequency:get()
	end
	local skillRange = baseSkillRange + searchTimeSeconds / broadenFrequency * skillStep
	local maxArenaPoints = Engine.GetMaxArenaPoints()
	skillRange = math.min( skillRange, maxArenaPoints )
	if logQoS == true then
		Lobby.Matchmaking.SearchParams.searchInfo.maxQOSedRange = skillRange
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.MatchmakingArena.GetArenaSkillRange: Search Time " .. tostring( searchTimeSeconds ) .. " seconds. Skill Range: " .. skillRange .. " points\n" )
	return skillRange
end

Lobby.MatchmakingArena.GetLobbyArenaSkill = function ()
	local skill = {}
	local memberCount = 0
	local lobbyGame = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for index, gameClient in ipairs( lobbyGame.sessionClients ) do
		if not skill[gameClient.simpleLobbyID] then
			skill[gameClient.simpleLobbyID] = gameClient.arenaPoints
			memberCount = memberCount + 1
		else
			skill[gameClient.simpleLobbyID] = math.max( skill[gameClient.simpleLobbyID], gameClient.arenaPoints )
		end
	end
	if memberCount == 0 then
		return 0
	end
	table.sort( skill, arenaSkillSort )
	local median = 0
	if math.fmod( #skill, 2 ) == 0 then
		median = (skill[#skill / 2] + skill[#skill / 2 + 1]) / 2
	else
		median = skill[math.ceil( #skill / 2 )]
	end
	return median
end

