require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingZM = {}
Lobby.MatchmakingZM.SetupMatchmakingStage = function ( f1_arg0 )
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
	Lobby.Matchmaking.SetPlaylistInfo( Engine.GetPlaylistID() )
	Lobby.Matchmaking.SetTeamSize( Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) )
	local f1_local0 = Lobby.Matchmaking.GetConnection( f1_arg0 )
	local f1_local1 = Dvar.excellentPing:get()
	local f1_local2 = Dvar.goodPing:get()
	local f1_local3 = Dvar.terriblePing:get()
	if f1_local0 == Lobby.Matchmaking.Connection.BEST then
		Lobby.Matchmaking.PingRange( 1, f1_local1 )
	elseif f1_local0 == Lobby.Matchmaking.Connection.NORMAL then
		Lobby.Matchmaking.PingRange( f1_local1, f1_local2 )
	else
		Lobby.Matchmaking.PingRange( f1_local2, 999 )
	end
	local f1_local4 = Lobby.Matchmaking.NextStage()
	if Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.LOBBY_MERGE then
		if f1_local4 > 0 then
			return false
		else
			return true
		end
	elseif Lobby.Matchmaking.SearchParams.mode == Lobby.Matchmaking.SearchMode.PUBLIC then
		local f1_local5 = f1_local4 % 3
		if f1_local5 == 1 and f1_local0 == Lobby.Matchmaking.Connection.NORMAL then
			Lobby.Matchmaking.PingRange( f1_local2, f1_local3 )
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

