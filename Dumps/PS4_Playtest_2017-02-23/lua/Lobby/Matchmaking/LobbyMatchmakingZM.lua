require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingZM = {}
Lobby.MatchmakingZM.SetupMatchmakingStage = function ( controller )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Setting up ZM matchmaking stage.\n" )
	Lobby.Matchmaking.SetShowInMatchmaking( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE )
	Lobby.Matchmaking.SetNetcodeVersion()
	Lobby.Matchmaking.SetGeoLocation()
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_ALL )
	Lobby.Matchmaking.SetGeoWeightTiered( 0.2 )
	Lobby.Matchmaking.SetSkillWeight( 1 )
	Lobby.Matchmaking.SetMapPacksAll()
	Lobby.Matchmaking.MinGeoMatch( 1 )
	local playlistID = Engine.GetPlaylistID()
	Lobby.Matchmaking.SetPlaylistInfo( playlistID )
	local numSlotsNeededOnTeam = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Lobby.Matchmaking.SetTeamSize( numSlotsNeededOnTeam )
	local connection = Lobby.Matchmaking.GetConnection( controller )
	local excellentPing = Dvar.excellentPing:get()
	local goodPing = Dvar.goodPing:get()
	local terriblePing = Dvar.terriblePing:get()
	if connection == Lobby.Matchmaking.Connection.BEST then
		Lobby.Matchmaking.PingRange( 1, excellentPing )
	elseif connection == Lobby.Matchmaking.Connection.NORMAL then
		Lobby.Matchmaking.PingRange( excellentPing, goodPing )
	else
		Lobby.Matchmaking.PingRange( goodPing, 999 )
	end
	local stage = Lobby.Matchmaking.NextStage()
	if Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.LOBBY_MERGE then
		if stage > 0 then
			return false
		else
			return true
		end
	elseif Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.PUBLIC then
		local subStage = stage % 3
		if subStage == 1 and connection == Lobby.Matchmaking.Connection.NORMAL then
			Lobby.Matchmaking.PingRange( goodPing, terriblePing )
			return true
		elseif subStage == 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end

