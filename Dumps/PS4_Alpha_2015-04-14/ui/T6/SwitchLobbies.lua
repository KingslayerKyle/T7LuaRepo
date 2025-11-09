if CoD == nil then
	CoD = {}
end
CoD.GetDefaultMap = function ( controller )
	local map = CoD.LEVEL_COOP_FIRST
	if CoD.isZombie then
		map = CoD.Zombie.MAP_ZM_FACTORY
	elseif CoD.isMultiplayer and not CoD.isCampaign then
		map = "mp_spire"
	end
	return map
end

CoD.GetDefaultMapStartLocationGameType_Zombie = function ( controller )
	return CoD.Zombie.START_LOCATION_TRANSIT, CoD.Zombie.GAMETYPE_ZCLASSIC
end

local SwitchLobbies_IsMapValid = function ( map )
	if map == "" then
		return false
	elseif not Engine.IsMapValid( map ) then
		return false
	else
		return true
	end
end

function SwitchLobbies_GetMap( controller )
	local map = Engine.ProfileValueAsString( controller, CoD.profileKey_map )
	if not SwitchLobbies_IsMapValid( map ) then
		map = CoD.GetDefaultMap( controller )
	end
	return map
end

local SwitchLobbies_GetSplitscreenMap = function ( controller )
	local map = SwitchLobbies_GetMap( controller )
	local isSplitscreen = CoD.GetMapValue( map, "splitscreen" )
	if isSplitscreen == "NO" then
		map = CoD.GetDefaultMap( controller )
	end
	return map
end

local SwitchLobbies_GetDefaultGametype = function ( controller )
	local gametype = ""
	if CoD.isZombie then
		gametype = CoD.Zombie.GAMETYPE_ZCLASSIC
	elseif CoD.isCampaign then
		gametype = "coop"
	elseif CoD.isMultiplayer then
		gametype = "tdm"
	end
	return gametype
end

local SwitchLobbies_IsGametypeValid = function ( gametype )
	if gametype == "" then
		return false
	elseif not Engine.IsGameTypeValid( gametype ) then
		return false
	else
		return true
	end
end

function SwitchLobbies_GetGametype( controller )
	local gametype = Engine.ProfileValueAsString( controller, CoD.profileKey_gametype )
	if not SwitchLobbies_IsGametypeValid( gametype ) then
		gametype = SwitchLobbies_GetDefaultGametype( controller )
	end
	return gametype
end

local SwitchLobbies_GetSplitscreenGametype = function ( controller )
	local gametype = SwitchLobbies_GetGametype( controller )
	local isSplitscreen = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "splitscreen" )
	if isSplitscreen == "NO" then
		gametype = SwitchLobbies_GetDefaultGametype( controller )
	end
	return gametype
end

function SwitchLobbies_InitializeLobby( controller, maxPartyCount, maxSplitscreenCount, maxPlayerSettingOverride )
	CoD.resetGameModes()
	if maxPlayerSettingOverride == nil or maxPlayerSettingOverride == true then
		maxPartyCount = Engine.GetMaxUserPlayerCount( controller )
	end
	Engine.PartySetMaxPlayerCount( maxPartyCount )
	Engine.SetDvar( "party_maxlocalplayers", maxSplitscreenCount )
end

local SwitchLobbies_StartPrivateOnlineGame = function ( controller )
	Engine.Exec( controller, "xstartprivateparty" )
	Engine.Exec( controller, "xstartpartyhost" )
	Engine.Exec( controller, "party_statechanged" )
end

CoD.SwitchToPlayerMatchLobby = function ( controller )
	Engine.ExecNow( controller, "xstopparty" )
	SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_playermatch" ), Engine.DvarInt( controller, "party_maxlocalplayers_playermatch" ) )
	Engine.SessionModeSetPrivate( false )
	Engine.SessionModeSetOnlineGame( true )
	Engine.SetGametype( SwitchLobbies_GetGametype( controller ) )
	Engine.GameModeSetMode( CoD.GAMEMODE_PUBLIC_MATCH, true )
	Engine.Exec( controller, "party_statechanged" )
end

local SwitchLobbies_InitializePrivateLobby = function ( controller )
	if CoD.isMultiplayer then
		SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_privatematch" ), Engine.DvarInt( controller, "party_maxlocalplayers_privatematch" ) )
	else
		SwitchLobbies_InitializeLobby( controller, 4, 2 )
	end
end

local SwitchToPrivateLobby_Project = function ( controller )
	if CoD.isMultiplayer then
		Engine.ExecNow( controller, "exec gamedata/configs/common/default_private.cfg" )
		Engine.SetGametype( SwitchLobbies_GetGametype( controller ) )
		Engine.ExecNow( controller, "ui_mapname " .. SwitchLobbies_GetMap( controller ) )
	else
		Engine.SetDvar( "ui_mapname", CoD.LEVEL_COOP_FIRST )
	end
end

CoD.SwitchToPrivateLobby = function ( controller )
	SwitchLobbies_InitializePrivateLobby( controller )
	Engine.SessionModeSetPrivate( true )
	Engine.SessionModeSetOnlineGame( true )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, true )
	SwitchToPrivateLobby_Project( controller )
	SwitchLobbies_StartPrivateOnlineGame( controller )
end

CoD.SwitchToLeagueMatchLobby = function ( controller )
	Engine.ExecNow( controller, "xstopparty" )
	SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_leaguematch" ), Engine.DvarInt( controller, "party_maxlocalplayers_leaguematch" ) )
	Engine.SessionModeSetPrivate( false )
	Engine.SessionModeSetOnlineGame( true )
	Engine.GameModeSetMode( CoD.GAMEMODE_LEAGUE_MATCH, true )
	Engine.Exec( controller, "party_statechanged" )
end

CoD.SwitchToSystemLinkLobby = function ( controller )
	Engine.ExecNow( controller, "leaveAllParties" )
	SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_systemlink" ), Engine.DvarInt( controller, "party_maxlocalplayers_systemlink" ), false )
	Engine.SessionModeSetOnlineGame( false )
	Engine.SessionModeSetSystemLink( true )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, true )
	Engine.ExecNow( controller, "exec gamedata/configs/common/default_private.cfg" )
	Engine.SetGametype( SwitchLobbies_GetGametype( controller ) )
	Engine.ExecNow( controller, "ui_mapname " .. SwitchLobbies_GetMap( controller ) )
	Engine.Exec( controller, "xstartlocalprivateparty" )
	Engine.Exec( controller, "xstartpartyhost" )
	Dvar.party_maxplayers:set( Dvar.party_maxplayers_systemlink:get() )
	Engine.Exec( controller, "party_statechanged" )
end

CoD.SwitchToSystemLinkGame = function ( controller )
	Engine.ExecNow( controller, "leaveAllParties" )
	SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_systemlink" ), Engine.DvarInt( controller, "party_maxlocalplayers_systemlink" ), false )
	Engine.SessionModeSetOnlineGame( false )
	Engine.SessionModeSetSystemLink( true )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, false )
end

CoD.SwitchToLocalLobby = function ( controller )
	Engine.ExecNow( controller, "leaveAllParties" )
	SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_local_splitscreen" ), Engine.DvarInt( controller, "party_maxlocalplayers_local_splitscreen" ), false )
	Engine.SessionModeSetOffline( true )
	Engine.GameModeSetMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN, true )
	Engine.ExecNow( controller, "exec gamedata/configs/common/default_splitscreen.cfg" )
	Engine.SetGametype( SwitchLobbies_GetSplitscreenGametype( controller ) )
	Engine.ExecNow( controller, "ui_mapname " .. SwitchLobbies_GetSplitscreenMap( controller ) )
	Engine.Exec( controller, "xstartlocalprivateparty" )
	Engine.Exec( controller, "xstartpartyhost" )
	Dvar.party_maxplayers:set( Dvar.party_maxplayers_local_splitscreen:get() )
	if CoD.isWIIU and CoD.isZombie then
		Engine.SetDvar( "party_maxplayers", 2 )
		Engine.SetDvar( "party_maxlocalplayers", 2 )
	end
end

CoD.SwitchToTheaterLobby = function ( controller )
	Engine.ExecNow( controller, "xstopparty" )
	SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_theater" ), Engine.DvarInt( controller, "party_maxlocalplayers_theater" ), false )
	Engine.SessionModeSetPrivate( true )
	Engine.SessionModeSetOnlineGame( true )
	Engine.SessionModeSetTheater( true )
	Engine.Exec( controller, "exec gamedata/configs/common/default_private.cfg" )
	Engine.SetDvar( "ui_demoname", "" )
	SwitchLobbies_StartPrivateOnlineGame( controller )
end

CoD.SwitchToMainLobby = function ( controller )
	SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_privatematch" ), Engine.DvarInt( controller, "party_maxlocalplayers_privatematch" ) )
	Engine.SessionModeSetPrivate( false )
	Engine.SessionModeSetOnlineGame( true )
	Engine.Exec( controller, "party_statechanged" )
end

local SwitchLobbies_InitializeMainLobby = function ( controller )
	if CoD.isMultiplayer then
		SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_partylobby" ), Engine.DvarInt( controller, "party_maxlocalplayers_playermatch" ) )
	else
		SwitchLobbies_InitializeLobby( controller, 4, 2 )
	end
end

CoD.StartMainLobby = function ( controller )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	SwitchLobbies_InitializeMainLobby( controller )
	Engine.SessionModeSetOnlineGame( true )
	if Engine.IsSignedInToDemonware( controller ) == true and Engine.HasMPPrivileges( controller ) then
		Engine.Exec( controller, "xstartprivateparty" )
		Engine.Exec( controller, "party_statechanged" )
	end
end

CoD.EndLobby = function ( controller )
	Engine.ExecNow( controller, "xstopallparties" )
	CoD.resetGameModes()
end

