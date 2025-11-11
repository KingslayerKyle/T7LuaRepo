require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingCP = {}
Lobby.MatchmakingCP.SetupMatchmakingStage = function ( controller )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Setting up CP matchmaking stage.\n" )
	Lobby.Matchmaking.SetShowInMatchmaking( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE )
	Lobby.Matchmaking.SetNetcodeVersion()
	Lobby.Matchmaking.SetGeoLocation()
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	if Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.PUBLIC_CP_ALL then
		Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_BY_SERVER_TYPE )
		Dvar.lobbySearchPlaylistVersion:set( Lobby.Matchmaking.GetFfotdPlaylistVersionNumber() )
		Dvar.lobbySearchPlaylistNumber:set( LuaDefine.INT_MAX )
	else
		Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_ALL )
		local playlistID = Engine.GetPlaylistID()
		Lobby.Matchmaking.SetPlaylistInfo( playlistID )
	end
	local serverType = Lobby.Matchmaking.GetServerType()
	Lobby.Matchmaking.SetServerType( serverType )
	local stage = Lobby.Matchmaking.NextStage()
	local connection = Lobby.Matchmaking.GetConnection( controller )
	local excellentPing = Dvar.excellentPing:get()
	local goodPing = Dvar.goodPing:get()
	local terriblePing = Dvar.terriblePing:get()
	Lobby.Matchmaking.SetGeoWeightTiered( 0.2 )
	Lobby.Matchmaking.SetSkillWeight( 1 )
	Lobby.Matchmaking.SetMapPacksAll()
	Lobby.Matchmaking.MinGeoMatch( 1 )
	local numSlotsNeededOnTeam = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Lobby.Matchmaking.SetTeamSize( numSlotsNeededOnTeam )
	if connection == Lobby.Matchmaking.Connection.BEST then
		Lobby.Matchmaking.PingRange( 1, excellentPing )
	elseif connection == Lobby.Matchmaking.Connection.NORMAL then
		Lobby.Matchmaking.PingRange( excellentPing, goodPing )
	else
		Lobby.Matchmaking.PingRange( goodPing, 999 )
	end
	if Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.LOBBY_MERGE then
		if stage > 0 then
			return false
		else
			return true
		end
	elseif Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.PUBLIC_CP_ALL or Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.PUBLIC then
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

