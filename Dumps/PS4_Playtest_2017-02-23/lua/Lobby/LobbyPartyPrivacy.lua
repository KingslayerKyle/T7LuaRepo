require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.PartyPrivacy = {}
Lobby.PartyPrivacy.checkTime = 0
Lobby.PartyPrivacy.ON_SESSION_START_RECHECK_TIME = 500
Lobby.PartyPrivacy.GetGameLobbyPartyPrivacy = function ()
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
	if currentMenuIdx ~= f1_local0.id then
		f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_CUSTOM )
		if currentMenuIdx ~= f1_local0.id then
			f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
			if currentMenuIdx == f1_local0.id then
				local privacySetting = Engine.GetProfileVarInt( Engine.GetPrimaryController(), "party_privacyStatus" )
				return privacySetting
			end
			f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
			if currentMenuIdx == f1_local0.id then
				return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
			end
			f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
			if currentMenuIdx == f1_local0.id and (Lobby.Launch.IsHostLaunching() or Engine.IsInGame() or not Engine.IsRunningUILevel()) then
				return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
			elseif Engine.IsCampaignGame() then
				
			elseif Engine.IsMultiplayerGame() then
				if Engine.SessionMode_IsPublicOnlineGame() then
					local playlistID = Engine.GetPlaylistID()
					local maxPartySize = Engine.GetPlaylistMaxPartySize( playlistID )
					if maxPartySize == 1 then
						return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
					end
				end
				if LuaUtils.IsArenaMode() then
					if ((Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1) or Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1) and Engine.SessionMode_IsPublicOnlineGame() and (not Engine.IsRunningUILevel() or Engine.IsInGame() or Lobby.Launch.IsHostLaunching()) then
						return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
					elseif Lobby.Timer.LobbyIsLocked() then
						return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
					end
				end
			elseif Engine.IsZombiesGame() and (Lobby.Launch.IsHostLaunching() or Engine.IsInGame() or not Engine.IsRunningUILevel()) then
				if Engine.SessionMode_IsOnlineGame() and Dvar.zm_private_rankedmatch:get() then
					return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
				elseif Engine.SessionMode_IsPublicOnlineGame() then
					return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
				end
			end
			if CoDShared.IsInTheaterLobby() then
				return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
			else
				return Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
			end
		end
	end
	local privacySetting = Engine.GetProfileVarInt( Engine.GetPrimaryController(), "party_privacyStatus" )
	return privacySetting
end

Lobby.PartyPrivacy.SetPartyPrivacy = function ()
	local isHostPrivate = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isActivePrivate = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isHostGame = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isActiveGame = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local target = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local privateLobbyPrivacy = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	local gameLobbyPrivacy = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	if isHostPrivate then
		privateLobbyPrivacy = Engine.GetProfileVarInt( Engine.GetPrimaryController(), "party_privacyStatus" )
		Engine.SetSessionPartyPrivacy( Enum.LobbyType.LOBBY_TYPE_PRIVATE, privateLobbyPrivacy )
	elseif isActivePrivate then
		privateLobbyPrivacy = Engine.GetSessionPartyPrivacy( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	if isHostGame then
		gameLobbyPrivacy = Lobby.PartyPrivacy.GetGameLobbyPartyPrivacy()
		Engine.SetSessionPartyPrivacy( Enum.LobbyType.LOBBY_TYPE_GAME, gameLobbyPrivacy )
	elseif isActiveGame then
		gameLobbyPrivacy = Engine.GetSessionPartyPrivacy( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local newPartyPrivacy = math.max( privateLobbyPrivacy, gameLobbyPrivacy )
	Engine.SetPartyPrivacy( newPartyPrivacy )
	local privacy = LobbyData.PartyPrivacyToString( newPartyPrivacy )
	local partyPrivacyModel = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	if partyPrivacyModel then
		Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacyStatus" ), privacy )
	end
end

Lobby.PartyPrivacy.SetLobbyMaxClients = function ( controller, lobbyType )
	local partyPrivacyModel = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local lobbyMaxClients = Engine.GetLobbyMaxClients( lobbyType )
	local profileMaxClients = Engine.GetProfileVarInt( controller, "party_maxplayers" )
	local maxClients = math.min( math.max( 1, profileMaxClients ), lobbyMaxClients )
	Engine.SetLobbyMaxClients( lobbyType, maxClients )
	Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "maxPlayers" ), maxClients )
end

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
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and (lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC or lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA) then
		partyPrivacy = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	else
		Lobby.PartyPrivacy.SetLobbyMaxClients( controller, lobbyType )
	end
	partyPrivacy = math.min( math.max( Enum.PartyPrivacy.PARTY_PRIVACY_OPEN, partyPrivacy ), Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED )
	if Dvar.tu4_partyPrivacyUseGlobal:get() == true then
		Engine.SetPartyPrivacy( partyPrivacy )
	else
		Engine.SetSessionPartyPrivacy( lobbyType, partyPrivacy )
	end
	local privacy = LobbyData.PartyPrivacyToString( partyPrivacy )
	if partyPrivacyModel then
		Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacyStatus" ), privacy )
	end
	Lobby.PartyPrivacy.checkTime = Lobby.PartyPrivacy.ON_SESSION_START_RECHECK_TIME + Engine.milliseconds()
end

Lobby.PartyPrivacy.OnJoinPartyPrivacyCheck = function ( data )
	local lobbyType = data.lobbyType
	local joinType = data.joinType
	local fromXUID = data.fromXUID
	if joinType == Enum.JoinType.JOIN_TYPE_PARTY or joinType == Enum.JoinType.JOIN_TYPE_PLAYLIST then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	else
		local partyPrivacy = Engine.GetPartyPrivacy()
		if partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting join request from xuid(" .. tostring( fromXUID ) .. ") because we are not joinable, session party privacy is closed.\n" )
			return Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_CLOSED
		elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY and joinType ~= Enum.JoinType.JOIN_TYPE_INVITE then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting join request from xuid(" .. tostring( fromXUID ) .. ") because we are not joinable, session party privacy is invite only.\n" )
			return Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY
		elseif partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY and joinType ~= Enum.JoinType.JOIN_TYPE_INVITE and joinType ~= Enum.JoinType.JOIN_TYPE_FRIEND then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting join request from xuid(" .. tostring( fromXUID ) .. ") because we are not joinable, session party privacy is friends only.\n" )
			return Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY
		else
			return Enum.JoinResult.JOIN_RESULT_SUCCESS
		end
	end
end

Lobby.PartyPrivacy.Pump = function ()
	if Dvar.partyPrivacyEnabled:get() == false or Dvar.partyPrivacyPumpEnabled:get() == false then
		return 
	elseif Lobby.PartyPrivacy.checkTime > Engine.milliseconds() then
		return 
	else
		Lobby.PartyPrivacy.checkTime = Dvar.partyPrivacyCheckInterval:get() + Engine.milliseconds()
		Lobby.PartyPrivacy.SetPartyPrivacy()
	end
end

