require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.PartyPrivacy = {}
Lobby.PartyPrivacy.OnSessionStart = function ( f1_arg0 )
	local f1_local0 = f1_arg0.lobbyModule
	local f1_local1 = f1_arg0.lobbyType
	local f1_local2 = f1_arg0.lobbyMode
	if Dvar.partyPrivacyEnabled:get() == false then
		return 
	elseif Engine.IsDedicatedServer() == true or f1_local0 ~= Enum.LobbyModule.LOBBY_MODULE_HOST or Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL or Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return 
	end
	local f1_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local f1_local4 = Engine.GetPrimaryController()
	local f1_local5 = Engine.GetProfileVarInt( f1_local4, "party_privacyStatus" )
	if f1_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and (f1_local2 == Enum.LobbyMode.LOBBY_MODE_PUBLIC or f1_local2 == Enum.LobbyMode.LOBBY_MODE_ARENA) then
		f1_local5 = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	else
		local f1_local6 = math.min( math.max( 1, Engine.GetProfileVarInt( f1_local4, "party_maxplayers" ) ), Engine.GetLobbyMaxClients( f1_local1 ) )
		Engine.SetLobbyMaxClients( f1_local1, f1_local6 )
		Engine.SetModelValue( Engine.CreateModel( f1_local3, "maxPlayers" ), f1_local6 )
	end
	f1_local5 = math.min( math.max( Enum.PartyPrivacy.PARTY_PRIVACY_OPEN, f1_local5 ), Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED )
	Engine.SetPartyPrivacy( f1_local5 )
	Engine.SetModelValue( Engine.CreateModel( f1_local3, "privacyStatus" ), LobbyData.PartyPrivacyToString( f1_local5 ) )
end

Lobby.PartyPrivacy.OnSessionEnd = function ( f2_arg0 )
	local f2_local0 = f2_arg0.lobbyModule
	local f2_local1 = f2_arg0.lobbyType
	local f2_local2 = f2_arg0.lobbyMode
	if Engine.IsDedicatedServer() == true then
		return 
	else
		
	end
end

Lobby.PartyPrivacy.OnMatchStart = function ( f3_arg0 )
	local f3_local0 = f3_arg0.lobbyModule
	local f3_local1 = f3_arg0.lobbyType
	local f3_local2 = f3_arg0.lobbyMode
	if Engine.IsDedicatedServer() == true then
		return 
	else
		
	end
end

Lobby.PartyPrivacy.OnMatchEnd = function ( f4_arg0 )
	local f4_local0 = f4_arg0.lobbyModule
	local f4_local1 = f4_arg0.lobbyType
	local f4_local2 = f4_arg0.lobbyMode
	if Engine.IsDedicatedServer() == true then
		return 
	else
		
	end
end

