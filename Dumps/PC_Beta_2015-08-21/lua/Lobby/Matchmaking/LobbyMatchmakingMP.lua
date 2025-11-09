require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingMP = {}
Lobby.MatchmakingMP.SetupMatchmakingStage = function ( f1_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Setting up multiplayer matchmaking stage.\n" )
	Lobby.Matchmaking.SetShowInMatchmaking( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE )
	Lobby.Matchmaking.SetNetcodeVersion()
	Lobby.Matchmaking.SetGeoLocation()
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	Lobby.Matchmaking.SetGeoWeightTiered( 0.2 )
	Lobby.Matchmaking.SetSkillWeight( 0.01 )
	local f1_local0 = Lobby.Matchmaking.NextStage()
	if f1_local0 == Lobby.Matchmaking.SearchStage.DONE then
		return false
	end
	local f1_local1 = Lobby.Matchmaking.GetConnection( f1_arg0 )
	local f1_local2 = Dvar.excellentPing:get()
	local f1_local3 = Dvar.goodPing:get()
	local f1_local4 = Dvar.terriblePing:get()
	local f1_local5 = Lobby.Matchmaking.GetNumSlotsNeededOnTeam( f1_local0 )
	local f1_local6 = Engine.GetPlaylistID()
	if f1_local0 < Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		if Lobby.Matchmaking.SearchMode.LOBBY_MERGE == Lobby.Matchmaking.SearchParams.mode and f1_local0 > Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1 then
			Lobby.MatchmakingMP.DoListenSearch()
		else
			local f1_local7 = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED
			if not Lobby.Matchmaking.SetServerLocation( f1_local7, f1_local0 ) then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Couldn't get dediqos results, doing an OPS2 search instead" )
				Lobby.MatchmakingMP.DoListenSearch()
			else
				Lobby.Matchmaking.SetPingBandWeight( 1 )
				Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
				Lobby.Matchmaking.SetQueryId( f1_local7 )
			end
		end
	elseif f1_local0 == Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		local f1_local7 = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED
		f1_local6 = Engine.GetPlaylistID()
		local f1_local8 = Engine.GetParkingPlaylistForRealPlaylist( f1_local6 )
		if f1_local8 ~= nil and f1_local8 ~= Lobby.Matchmaking.INVALID_PARKING_PLAYLIST then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyMatchmaking.Lobby.Matchmaking.SetPlaylistInfo(): No sessions found in playlistID<" .. f1_local6 .. ">, looking in parkingPlaylist<" .. f1_local8 .. ">\n" )
			Lobby.Matchmaking.SetMapPacksOriginal()
			f1_local6 = f1_local8
		end
		Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_EMPTY )
		if not Lobby.Matchmaking.SetServerLocation( f1_local7, f1_local0 ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Couldn't get dediqos results, doing an OPS2 search instead" )
			Lobby.MatchmakingMP.DoListenSearch()
		else
			Lobby.Matchmaking.SetSkillWeight( 0 )
			Lobby.Matchmaking.SetQueryId( f1_local7 )
		end
	elseif f1_local0 == Lobby.Matchmaking.SearchStage.LISTEN and Lobby.Matchmaking.SearchMode.PUBLIC == Lobby.Matchmaking.SearchParams.mode then
		Lobby.MatchmakingMP.DoListenSearch()
	end
	Lobby.Matchmaking.SetPlaylistInfo( f1_local6 )
	Lobby.Matchmaking.SetTeamSize( f1_local5 )
	Lobby.Matchmaking.SetMapPacksAll()
	if f1_local1 == Lobby.Matchmaking.Connection.BEST then
		Lobby.Matchmaking.PingRange( 1, f1_local2 )
		Lobby.Matchmaking.MinGeoMatch( 1 )
	elseif f1_local1 == Lobby.Matchmaking.Connection.NORMAL then
		Lobby.Matchmaking.PingRange( f1_local2, f1_local3 )
		Lobby.Matchmaking.MinGeoMatch( 1 )
	else
		Lobby.Matchmaking.PingRange( f1_local3, 999 )
		Lobby.Matchmaking.MinGeoMatch( 0 )
	end
	return true
end

Lobby.MatchmakingMP.DoListenSearch = function ()
	Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_ALL )
end

