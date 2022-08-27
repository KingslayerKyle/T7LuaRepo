-- 8e91ba552b327c189d0511cdd3b09c1a
-- This hash is used for caching, delete to decompile the file again

require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingCP = {}
Lobby.MatchmakingCP.SetupMatchmakingStage = function ( f1_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Setting up CP matchmaking stage.\n" )
	Lobby.Matchmaking.SetShowInMatchmaking( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE )
	Lobby.Matchmaking.SetNetcodeVersion()
	Lobby.Matchmaking.SetGeoLocation()
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	if Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.PUBLIC_CP_ALL then
		Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_BY_SERVER_TYPE )
		Dvar.lobbySearchPlaylistVersion:set( Lobby.Matchmaking.GetFfotdPlaylistVersionNumber() )
		Dvar.lobbySearchPlaylistNumber:set( LuaUtils.INT_MAX )
	else
		Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_ALL )
		Lobby.Matchmaking.SetPlaylistInfo( Engine.GetPlaylistID() )
	end
	Lobby.Matchmaking.SetServerType( Lobby.Matchmaking.GetServerType() )
	local f1_local0 = Lobby.Matchmaking.NextStage()
	local f1_local1 = Lobby.Matchmaking.GetConnection( f1_arg0 )
	local f1_local2 = Dvar.excellentPing:get()
	local f1_local3 = Dvar.goodPing:get()
	local f1_local4 = Dvar.terriblePing:get()
	Lobby.Matchmaking.SetGeoWeightTiered( 0.2 )
	Lobby.Matchmaking.SetSkillWeight( 1 )
	Lobby.Matchmaking.SetMapPacksAll()
	Lobby.Matchmaking.MinGeoMatch( 1 )
	Lobby.Matchmaking.SetTeamSize( Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) )
	if f1_local1 == Lobby.Matchmaking.Connection.BEST then
		Lobby.Matchmaking.PingRange( 1, f1_local2 )
	elseif f1_local1 == Lobby.Matchmaking.Connection.NORMAL then
		Lobby.Matchmaking.PingRange( f1_local2, f1_local3 )
	else
		Lobby.Matchmaking.PingRange( f1_local3, 999 )
	end
	if Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.LOBBY_MERGE then
		if f1_local0 > 0 then
			return false
		else
			return true
		end
	elseif Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.PUBLIC_CP_ALL or Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.PUBLIC then
		local f1_local5 = f1_local0 % 3
		if f1_local5 == 1 and f1_local1 == Lobby.Matchmaking.Connection.NORMAL then
			Lobby.Matchmaking.PingRange( f1_local3, f1_local4 )
			return true
		elseif f1_local5 == 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end

