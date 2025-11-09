require( "lua.Shared.LuaEnums" )
require( "lua.Shared.LuaUtils" )

Lobby.Steam = {}
Lobby.Steam.OnSessionStart = function ( f1_arg0 )
	local f1_local0 = f1_arg0.lobbyModule
	local f1_local1 = f1_arg0.lobbyType
	local f1_local2 = f1_arg0.lobbyMode
	if f1_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f1_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.LiveSteamServer_Start()
	end
end

Lobby.Steam.OnSessionEnd = function ( f2_arg0 )
	local f2_local0 = f2_arg0.lobbyModule
	local f2_local1 = f2_arg0.lobbyType
	local f2_local2 = f2_arg0.lobbyMode
	if f2_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f2_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.LiveSteamServer_Stop()
	end
end

Lobby.Steam.OnMatchChangeMap = function ( f3_arg0 )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.LiveSteamServer_SetMapName( f3_arg0.nextMap )
	end
end

Lobby.Steam.OnMatchChangeGameType = function ( f4_arg0 )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.LiveSteamLobby_SetLobbyData( "gametype", f4_arg0.gameType )
		Engine.LiveSteamServer_AddKvpToGameTags( "gametype", f4_arg0.gameType )
	end
end

Lobby.Steam.OnLobbyServerListRetrieved = function ( f5_arg0 )
	local f5_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser" ), "serverListCount" )
	if Engine.SetModelValue( f5_local0, f5_arg0.count ) == false then
		Engine.ForceNotifyModelSubscriptions( f5_local0 )
	end
end

Lobby.Steam.OnLobbyServerCountUpdated = function ( f6_arg0 )
	local f6_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser" ), "serverListUpdatedCount" )
	if Engine.SetModelValue( f6_local0, f6_arg0.count ) == false then
		Engine.ForceNotifyModelSubscriptions( f6_local0 )
	end
end

Lobby.Steam.OnLobbyServerListSorted = function ( f7_arg0 )
	local f7_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser" ), "serverListSortType" )
	if Engine.SetModelValue( f7_local0, f7_arg0.sortType ) == false then
		Engine.ForceNotifyModelSubscriptions( f7_local0 )
	end
end

Lobby.Steam.OnSessionModeChanged = function ( f8_arg0 )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.LiveSteamLobby_SetLobbyData( "sessionmode", f8_arg0.mode )
	end
end

Lobby.Steam.OnMatchStart = function ( f9_arg0 )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.LiveSteamLobby_SetLobbyData( "ingame", 1 )
	end
end

Lobby.Steam.OnMatchEnd = function ( f10_arg0 )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.LiveSteamLobby_SetLobbyData( "ingame", 0 )
	end
end

Lobby.Steam.OnPartyPrivacyChange = function ( f11_arg0 )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.LiveSteamLobby_SetLobbyData( "privacy", f11_arg0.partyPrivacy )
	end
end

Lobby.Steam.OnMaxClientsChanged = function ( f12_arg0 )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.LiveSteamLobby_SetLobbyData( "maxclients", f12_arg0.nextMaxClients )
		Engine.LiveSteamServer_SetMaxPlayerCount( f12_arg0.nextMaxClients )
	end
end

Lobby.Steam.OnClientAdded = function ( f13_arg0 )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.LiveSteamLobby_SetLobbyData( "clients", Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) )
	end
end

Lobby.Steam.OnClientRemoved = function ( f14_arg0 )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.LiveSteamLobby_SetLobbyData( "clients", Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) )
	end
end

