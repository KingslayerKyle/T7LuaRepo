require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingMP = {}
Lobby.MatchmakingMP.SetupMatchmakingStage = function ( controller )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Setting up multiplayer matchmaking stage.\n" )
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
	local connection = Lobby.Matchmaking.GetConnection( controller )
	local excellentPing = Dvar.excellentPing:get()
	local goodPing = Dvar.goodPing:get()
	local terriblePing = Dvar.terriblePing:get()
	local slotsNeededOnTeam = Lobby.Matchmaking.GetNumSlotsNeededOnTeam( stage )
	local playlistID = Engine.GetPlaylistID()
	if stage < Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		if Lobby.Matchmaking.SearchMode.LOBBY_MERGE == Lobby.Matchmaking.SearchParams.mode and stage > Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1 then
			Lobby.MatchmakingMP.DoListenSearch()
		else
			local queryID = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED
			if not Lobby.Matchmaking.SetServerLocation( queryID, stage ) then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Couldn't get dediqos results, doing an OPS2 search instead" )
				Lobby.MatchmakingMP.DoListenSearch()
			else
				Lobby.Matchmaking.SetPingBandWeight( 1 )
				Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
				Lobby.Matchmaking.SetQueryId( queryID )
			end
		end
	elseif stage == Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		local queryID = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED
		playlistID = Engine.GetPlaylistID()
		local parkingPlaylist = Engine.GetParkingPlaylistForRealPlaylist( playlistID )
		if parkingPlaylist ~= nil and parkingPlaylist ~= Lobby.Matchmaking.INVALID_PARKING_PLAYLIST then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyMatchmaking.Lobby.Matchmaking.SetPlaylistInfo(): No sessions found in playlistID<" .. playlistID .. ">, looking in parkingPlaylist<" .. parkingPlaylist .. ">\n" )
			Lobby.Matchmaking.SetMapPacksOriginal()
			playlistID = parkingPlaylist
		end
		Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_EMPTY )
		if not Lobby.Matchmaking.SetServerLocation( queryID, stage ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Couldn't get dediqos results, doing an OPS2 search instead" )
			Lobby.MatchmakingMP.DoListenSearch()
		else
			Lobby.Matchmaking.SetSkillWeight( 0 )
			Lobby.Matchmaking.SetQueryId( queryID )
		end
	elseif stage == Lobby.Matchmaking.SearchStage.LISTEN and Lobby.Matchmaking.SearchMode.PUBLIC == Lobby.Matchmaking.SearchParams.mode then
		Lobby.MatchmakingMP.DoListenSearch()
	end
	Lobby.Matchmaking.SetPlaylistInfo( playlistID )
	Lobby.Matchmaking.SetTeamSize( slotsNeededOnTeam )
	Lobby.Matchmaking.SetMapPacksAll()
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
	return true
end

Lobby.MatchmakingMP.DoListenSearch = function ()
	Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_ALL )
end

