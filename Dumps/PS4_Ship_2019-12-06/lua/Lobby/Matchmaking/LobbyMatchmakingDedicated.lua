require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingDedicated = {}
Lobby.MatchmakingDedicated.SetupMatchmakingStage = function ( f1_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Setting up dedicated matchmaking stage.\n" )
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	Lobby.Matchmaking.SetMapPacks( Dvar.lobbyAdvertiseMapPacks:get() )
	Lobby.Matchmaking.SetNetcodeVersion()
	Lobby.Matchmaking.SetPingBand( Dvar.lobbyAdvertiseLatencyBand:get() )
	Lobby.Matchmaking.SetPingBandWeight( 0 )
	Lobby.Matchmaking.SetPlaylistInfo( Dvar.lobbyAdvertisePlaylistNumber:get() )
	Lobby.Matchmaking.SetServerType( Lobby.Matchmaking.ServerType.DEDICATED_SERVER )
	Lobby.Matchmaking.SetShowInMatchmaking( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE )
	Lobby.Matchmaking.SetSkillWeight( 0.01 )
	Lobby.Matchmaking.SetTeamSize( Lobby.Matchmaking.GetNumSlotsNeededOnTeam( Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1 ) )
	Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED )
	local f1_local0 = Engine.GetLobbyHostInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbySearchServerLocation1:set( f1_local0.serverLocation )
	return true
end

