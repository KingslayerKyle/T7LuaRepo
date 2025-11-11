require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingMP = {}
Lobby.MatchmakingMP.DoListenSearch = function ( stage, playlistID )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Setting up Listen Search Parameters\n" )
	Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_ALL )
	Lobby.Matchmaking.SetPlaylistInfo( playlistID )
end

Lobby.MatchmakingMP.DoDedicatedSearch = function ( stage, playlistID )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Setting up Dedicated Search Parameters\n" )
	if Lobby.Matchmaking.SearchMode.LOBBY_MERGE == Lobby.Matchmaking.SearchParams.mode and stage > Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1 then
		Lobby.MatchmakingMP.DoListenSearch( stage, playlistID )
	else
		local queryID = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED
		if not Lobby.Matchmaking.SetServerLocation( queryID, stage ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Couldn't get dediqos results, doing an OPS2 search instead" )
			Lobby.MatchmakingMP.DoListenSearch( stage, playlistID )
		else
			Lobby.Matchmaking.SetPingBandWeight( 1 )
			Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
			Lobby.Matchmaking.SetQueryId( queryID )
		end
	end
	Lobby.Matchmaking.SetPlaylistInfo( playlistID )
end

Lobby.MatchmakingMP.UnparkDedicated = function ( stage, playlistID )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Setting up Dedicated Unpark Search Parameters\n" )
	local queryID = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED
	local parkingPlaylist = Engine.GetParkingPlaylistForRealPlaylist( playlistID )
	if parkingPlaylist ~= nil and parkingPlaylist ~= Lobby.Matchmaking.INVALID_PARKING_PLAYLIST then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyMatchmaking.Lobby.Matchmaking.SetPlaylistInfo(): No sessions found in playlistID<" .. playlistID .. ">, looking in parkingPlaylist<" .. parkingPlaylist .. ">\n" )
		Lobby.Matchmaking.SetMapPacksOriginal()
		playlistID = parkingPlaylist
	end
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_EMPTY )
	if not Lobby.Matchmaking.SetServerLocation( queryID, stage ) then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Couldn't get dediqos results, doing an OPS2 search instead" )
		Lobby.MatchmakingMP.DoListenSearch( stage, playlistID )
	else
		Lobby.Matchmaking.SetSkillWeight( 0 )
		Lobby.Matchmaking.SetQueryId( queryID )
	end
	Lobby.Matchmaking.SetPlaylistInfo( playlistID )
end

Lobby.MatchmakingMP.AllowListenSearch = function ( partySize )
	if Dvar.lobbyDedicatedSearchSkip:exists() and Dvar.lobbyDedicatedSearchSkip:get() == true then
		return true
	elseif Lobby.Matchmaking.SearchParams.searchInfo == nil then
		return true
	else
		local searchStartTime = Lobby.Matchmaking.SearchParams.searchInfo.startTime
		if searchStartTime == nil then
			return true
		else
			local searchTime = (Engine.milliseconds() - searchStartTime) / 1000
			local minDediSearchTime = Engine.GetDvarInt( "lobbySearchMinDediSearchTime" )
			local minDediSearchClientAdd = Engine.GetDvarInt( "lobbySearchMinDediSearchClientAdd" )
			local f4_local0 = minDediSearchTime + minDediSearchClientAdd * partySize < searchTime
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Matchmaking: Allow Listen Search Time: " .. tostring( searchTime ) .. " seconds. Allow Listen Search: " .. tostring( f4_local0 ) .. " \n" )
			return f4_local0
		end
	end
end

Lobby.MatchmakingMP.AllowUnparkSearch = function ( partySize )
	if Lobby.MatchmakingMP.AllowListenSearch( partySize ) then
		return true
	else
		local minSize = Engine.GetDvarInt( "lobbySearchForceUnparkLobbySize" )
		if minSize <= partySize then
			return true
		else
			local prob = Engine.GetDvarFloat( "lobbySearchSkipUnparkProbability" )
			local roll = math.random()
			return prob <= roll
		end
	end
end

Lobby.MatchmakingMP.SetupMatchmakingStage = function ( controller )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Setting up multiplayer matchmaking stage.\n" )
	Lobby.Matchmaking.SetShowInMatchmaking( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE )
	Lobby.Matchmaking.SetNetcodeVersion()
	Lobby.Matchmaking.SetGeoLocation()
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	Lobby.Matchmaking.SetGeoWeightTiered( 0.2 )
	Lobby.Matchmaking.SetSkillWeight( 0.01 )
	local stage = Lobby.Matchmaking.NextStage()
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: SETUP MATCHMAKING STAGE: " .. tostring( stage ) .. "\n" )
	if stage == Lobby.Matchmaking.SearchStage.DONE then
		return false
	elseif Dvar.lobbyDedicatedSearchSkip:exists() and Dvar.lobbyDedicatedSearchSkip:get() == true and stage ~= Lobby.Matchmaking.SearchStage.LISTEN and stage ~= Lobby.Matchmaking.SearchStage.LISTEN_DESPERATE and stage ~= Lobby.Matchmaking.SearchStage.DONE then
		stage = Lobby.Matchmaking.SearchStage.LISTEN
	end
	local connection = Lobby.Matchmaking.GetConnection( controller )
	local playlistID = Engine.GetPlaylistID()
	Dvar.lobbySearchMapPacks:set( Lobby.Matchmaking.GetMapPackBits( Engine.GetDLCBitsForLobby( Enum.LobbyType.LOBBY_TYPE_GAME ), playlistID ) )
	if stage < Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		local prob = Engine.GetDvarFloat( "lobbySearchSkipDLCProbability" )
		local roll = math.random()
		if roll <= prob then
			local currentDLCBits = Dvar.lobbySearchMapPacks:get()
			if LobbyVM.CheckDLCBit( currentDLCBits, Enum.ContentFlagBits.CONTENT_ORIGINALMAPS ) then
				local dlcMask = 16776719
				Dvar.lobbySearchMapPacks:set( currentDLCBits & dlcMask )
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYCLIENT, "Dlcbits was " .. currentDLCBits .. " now it's " .. Dvar.lobbySearchMapPacks:get() .. "\n" )
			end
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "Diceroll failed, not going to fiddle dlc bits\n" )
		end
		Lobby.MatchmakingMP.DoDedicatedSearch( stage, playlistID )
	elseif stage == Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		Lobby.MatchmakingMP.UnparkDedicated( stage, playlistID )
	elseif stage == Lobby.Matchmaking.SearchStage.LISTEN and Lobby.Matchmaking.SearchMode.PUBLIC == Lobby.Matchmaking.SearchParams.mode then
		Lobby.MatchmakingMP.DoListenSearch( stage, playlistID )
	end
	local slotsNeededOnTeam = Lobby.Matchmaking.GetNumSlotsNeededOnTeam( stage )
	Lobby.Matchmaking.SetTeamSize( slotsNeededOnTeam )
	local goodPing = math.max( Dvar.goodPing:get(), Dvar.lobbySearchDediUnparkPingLimit:get() )
	local dediQos = Engine.GetDediQosResultsByType( Lobby.Matchmaking.DatacenterType.ANY )
	if dediQos.numResults > 0 then
		goodPing = math.max( goodPing, dediQos.pingResults[1].ping )
	end
	Lobby.Matchmaking.PingRange( 1, goodPing )
	Lobby.Matchmaking.MinGeoMatch( 2 )
	return true
end

