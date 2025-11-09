require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.PartyPrivacy = {}
Lobby.PartyPrivacy.checkTime = 0
Lobby.PartyPrivacy.ON_SESSION_START_RECHECK_TIME = 500
Lobby.PartyPrivacy.GetGameLobbyPartyPrivacy = function ()
	local f1_local0 = Engine.GetLobbyUIScreen()
	if f1_local0 == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or f1_local0 == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or f1_local0 == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id then
		return Engine.GetProfileVarInt( Engine.GetPrimaryController(), "party_privacyStatus" )
	elseif f1_local0 == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id then
		return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
	elseif f1_local0 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id and (LobbyVM.IsHostLaunching() or Engine.IsInGame() or not Engine.IsRunningUILevel()) then
		return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
	elseif Engine.IsCampaignGame() then
		
	elseif Engine.IsMultiplayerGame() then
		if Engine.SessionMode_IsPublicOnlineGame() and Engine.GetPlaylistMaxPartySize( Engine.GetPlaylistID() ) == 1 then
			return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
		elseif LuaUtils.IsArenaMode() then
			if ((Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1) or Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1) and Engine.SessionMode_IsPublicOnlineGame() and (not Engine.IsRunningUILevel() or Engine.IsInGame() or LobbyVM.IsHostLaunching()) then
				return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
			elseif Lobby.Timer.LobbyIsLocked() then
				return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
			end
		end
	elseif Engine.IsZombiesGame() and (LobbyVM.IsHostLaunching() or Engine.IsInGame() or not Engine.IsRunningUILevel()) then
		if Engine.SessionMode_IsOnlineGame() and Dvar.zm_private_rankedmatch:get() then
			return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
		elseif Engine.SessionMode_IsPublicOnlineGame() then
			return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
		end
	end
	if LobbyVM.IsInTheaterLobby() then
		return Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
	end
	return Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
end

Lobby.PartyPrivacy.SetPartyPrivacy = function ()
	local f2_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f2_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f2_local2 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f2_local3 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f2_local4 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f2_local5 = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	local f2_local6 = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	if f2_local0 then
		f2_local5 = Engine.GetProfileVarInt( Engine.GetPrimaryController(), "party_privacyStatus" )
		Engine.SetSessionPartyPrivacy( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f2_local5 )
	elseif f2_local1 then
		f2_local5 = Engine.GetSessionPartyPrivacy( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	if f2_local2 then
		f2_local6 = Lobby.PartyPrivacy.GetGameLobbyPartyPrivacy()
		Engine.SetSessionPartyPrivacy( Enum.LobbyType.LOBBY_TYPE_GAME, f2_local6 )
	elseif f2_local3 then
		f2_local6 = Engine.GetSessionPartyPrivacy( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local f2_local7 = math.max( f2_local5, f2_local6 )
	Engine.SetPartyPrivacy( f2_local7 )
	local f2_local8 = LobbyData.PartyPrivacyToString( f2_local7 )
	local f2_local9 = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	if f2_local9 then
		Engine.SetModelValue( Engine.CreateModel( f2_local9, "privacyStatus" ), f2_local8 )
	end
end

Lobby.PartyPrivacy.SetLobbyMaxClients = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local f3_local1 = math.min( math.max( 1, Engine.GetProfileVarInt( f3_arg0, "party_maxplayers" ) ), Engine.GetLobbyMaxClients( f3_arg1 ) )
	Engine.SetLobbyMaxClients( f3_arg1, f3_local1 )
	Engine.SetModelValue( Engine.CreateModel( f3_local0, "maxPlayers" ), f3_local1 )
end

Lobby.PartyPrivacy.OnSessionStart = function ( f4_arg0 )
	local f4_local0 = f4_arg0.lobbyModule
	local f4_local1 = f4_arg0.lobbyType
	local f4_local2 = f4_arg0.lobbyMode
	if Dvar.partyPrivacyEnabled:get() == false then
		return 
	elseif Engine.IsDedicatedServer() == true or f4_local0 ~= Enum.LobbyModule.LOBBY_MODULE_HOST or Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL or Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return 
	end
	local f4_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local f4_local4 = Engine.GetPrimaryController()
	local f4_local5 = Engine.GetProfileVarInt( f4_local4, "party_privacyStatus" )
	if f4_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and (f4_local2 == Enum.LobbyMode.LOBBY_MODE_PUBLIC or f4_local2 == Enum.LobbyMode.LOBBY_MODE_ARENA) then
		f4_local5 = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
	else
		Lobby.PartyPrivacy.SetLobbyMaxClients( f4_local4, f4_local1 )
	end
	f4_local5 = math.min( math.max( Enum.PartyPrivacy.PARTY_PRIVACY_OPEN, f4_local5 ), Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED )
	if Dvar.tu4_partyPrivacyUseGlobal:get() == true then
		Engine.SetPartyPrivacy( f4_local5 )
	else
		Engine.SetSessionPartyPrivacy( f4_local1, f4_local5 )
	end
	local f4_local6 = LobbyData.PartyPrivacyToString( f4_local5 )
	if f4_local3 then
		Engine.SetModelValue( Engine.CreateModel( f4_local3, "privacyStatus" ), f4_local6 )
	end
	Lobby.PartyPrivacy.checkTime = Lobby.PartyPrivacy.ON_SESSION_START_RECHECK_TIME + Engine.milliseconds()
end

Lobby.PartyPrivacy.OnJoinPartyPrivacyCheck = function ( f5_arg0 )
	local f5_local0 = f5_arg0.lobbyType
	local f5_local1 = f5_arg0.joinType
	local f5_local2 = f5_arg0.fromXUID
	if f5_local1 == Enum.JoinType.JOIN_TYPE_PARTY or f5_local1 == Enum.JoinType.JOIN_TYPE_PLAYLIST then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	else
		local f5_local3 = Engine.GetPartyPrivacy()
		if f5_local3 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting join request from xuid(" .. tostring( f5_local2 ) .. ") because we are not joinable, session party privacy is closed.\n" )
			return Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_CLOSED
		elseif f5_local3 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY and f5_local1 ~= Enum.JoinType.JOIN_TYPE_INVITE then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting join request from xuid(" .. tostring( f5_local2 ) .. ") because we are not joinable, session party privacy is invite only.\n" )
			return Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY
		elseif f5_local3 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY and f5_local1 ~= Enum.JoinType.JOIN_TYPE_INVITE and f5_local1 ~= Enum.JoinType.JOIN_TYPE_FRIEND then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting join request from xuid(" .. tostring( f5_local2 ) .. ") because we are not joinable, session party privacy is friends only.\n" )
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

