require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.PartyPrivacy = {}
Lobby.PartyPrivacy.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if Dvar.partyPrivacyEnabled:get() == false then
		return 
	elseif Engine.IsDedicatedServer() == true or lobbyModule ~= Enum.LobbyModule.LOBBY_MODULE_HOST or Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL or Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return 
	end
	local partyPrivacyModel = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local controller = Engine.GetPrimaryController()
	local partyPrivacy = Engine.GetProfileVarInt( controller, "party_privacyStatus" )
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
		partyPrivacy = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	else
		local lobbyMaxClients = Engine.GetLobbyMaxClients( lobbyType )
		local profileMaxClients = Engine.GetProfileVarInt( controller, "party_maxplayers" )
		local maxClients = math.min( math.max( 1, profileMaxClients ), lobbyMaxClients )
		Engine.SetLobbyMaxClients( lobbyType, maxClients )
		Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "maxPlayers" ), maxClients )
	end
	partyPrivacy = math.min( math.max( Enum.PartyPrivacy.PARTY_PRIVACY_OPEN, partyPrivacy ), Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED )
	Engine.SetPartyPrivacy( partyPrivacy )
	local privacy = LobbyData.PartyPrivacyToString( partyPrivacy )
	Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacyStatus" ), privacy )
end

Lobby.PartyPrivacy.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if Engine.IsDedicatedServer() == true then
		return 
	else
		
	end
end

Lobby.PartyPrivacy.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if Engine.IsDedicatedServer() == true then
		return 
	else
		
	end
end

Lobby.PartyPrivacy.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if Engine.IsDedicatedServer() == true then
		return 
	else
		
	end
end

