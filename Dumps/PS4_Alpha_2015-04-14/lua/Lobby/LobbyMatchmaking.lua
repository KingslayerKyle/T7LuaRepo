require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )

Lobby.Matchmaking = {}
local lobbyMatchmaking = nil
Lobby.Matchmaking.INVALID_PARKING_PLAYLIST = 0
Lobby.Matchmaking.SEARCH_MODE_INVALID = 0
Lobby.Matchmaking.SEARCH_MODE_PUBLIC = 1
Lobby.Matchmaking.SEARCH_MODE_LEAGUE = 2
Lobby.Matchmaking.SEARCH_MODE_LOBBY_MERGE = 3
Lobby.Matchmaking.SEARCH_MODE_DEDICATED_SERVER = 4
local Connection = {
	NORMAL = 0,
	BEST = 1,
	ANY = 2
}
local SearchParams = {
	mode = -1,
	stage = -1
}
local ContentPack = {
	CONTENT_ORIGINALMAPS = 2,
	CONTENT_ALL = 65535
}
Lobby.Matchmaking.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.Matchmaking.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.Matchmaking.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.Matchmaking.UpdateAdvertising()
	end
end

Lobby.Matchmaking.OnClientRemoved = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.Matchmaking.UpdateAdvertising()
	end
end

Lobby.Matchmaking.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.Matchmaking.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

local SetQueryId = function ( value )
	Dvar.lobbySearchQueryId:set( value )
end

local SetShowInMatchmaking = function ( value )
	Dvar.lobbySearchShowInMatchmaking:set( value )
end

local SetNetcodeVersion = function ()
	Dvar.lobbySearchNetcodeVersion:set( Engine.GetProtocolVersion() )
end

local SetMapPacksOriginal = function ()
	Dvar.lobbySearchMapPacks:set( ContentPack.CONTENT_ORIGINALMAPS )
end

local SetMapPacksAll = function ()
	Dvar.lobbySearchMapPacks:set( ContentPack.CONTENT_ORIGINALMAPS )
end

local SetTeamSize = function ( teamSize )
	Dvar.lobbySearchTeamSize:set( teamSize )
end

local SetPlaylistInfo = function ( isDedicated )
	local slotsNeededOnTeam = 0
	local playlistID = Engine.GetPlaylistID()
	if isDedicated == true and playlistID ~= nil then
		local parkingPlaylist = Engine.GetParkingPlaylistForRealPlaylist( playlistID )
		if parkingPlaylist ~= nil and parkingPlaylist ~= Lobby.Matchmaking.INVALID_PARKING_PLAYLIST then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyMatchmaking.SetPlaylistInfo(): No sessions found in playlistID<" .. playlistID .. ">, looking in parkingPlaylist<" .. parkingPlaylist .. ">\n" )
			SetMapPacksOriginal()
			playlistID = parkingPlaylist
		end
		slotsNeededOnTeam = 1
	else
		slotsNeededOnTeam = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if slotsNeededOnTeam < 1 then
			slotsNeededOnTeam = 1
		end
	end
	local playlistVersionNumber = Engine.GetPlaylistVersionNumber()
	local playlistNumber = Engine.EncodePlaylistNumber( playlistID )
	Dvar.lobbySearchPlaylistVersion:set( playlistVersionNumber )
	Dvar.lobbySearchPlaylistNumber:set( playlistNumber )
	SetTeamSize( slotsNeededOnTeam )
end

local SetDedicatedOnly = function ( value )
	SetPlaylistInfo( value )
	local isEmpty = 0
	if value == true then
		isEmpty = 1
	end
	Dvar.lobbySearchIsEmpty:set( isEmpty )
end

local SetSkill = function ( value )
	Dvar.lobbySearchSkill:set( 1 )
	Dvar.lobbySearchSkillWeight:set( value )
end

local SetGeoLocation = function ()
	local geo = Engine.GetGeoLocation()
	if geo == nil then
		Dvar.lobbySearchGeo1:set( 0 )
		Dvar.lobbySearchGeo2:set( 0 )
		Dvar.lobbySearchGeo3:set( 0 )
		Dvar.lobbySearchGeo4:set( 0 )
	else
		Dvar.lobbySearchGeo1:set( geo.geo_1 )
		Dvar.lobbySearchGeo2:set( geo.geo_2 )
		Dvar.lobbySearchGeo3:set( geo.geo_3 )
		Dvar.lobbySearchGeo4:set( geo.geo_4 )
	end
end

local SetGeoWeightFlat = function ( value )
	Dvar.lobbySearchGeo1Weight:set( 0 )
	Dvar.lobbySearchGeo2Weight:set( 0 )
	Dvar.lobbySearchGeo3Weight:set( 0 )
	Dvar.lobbySearchGeo4Weight:set( 0 )
end

local SetGeoWeightTiered = function ( value )
	Dvar.lobbySearchGeo1Weight:set( 0 )
	Dvar.lobbySearchGeo2Weight:set( 0 )
	Dvar.lobbySearchGeo3Weight:set( 0 )
	Dvar.lobbySearchGeo4Weight:set( 0 )
end

local DelaySeconds = function ( value )
	Dvar.searchSessionNextTaskDelay:set( value * 1000 )
end

local PingRange = function ( min, max )
	Dvar.qosPreferredPing:set( min )
	Dvar.qosMaxAllowedPing:set( max )
end

local MinGeoMatch = function ( min )
	Dvar.searchSessionGeoMin:set( min )
end

local GetConnection = function ( controller )
	return 0
end

local NextStage = function ()
	local stage = SearchParams.stage
	SearchParams.stage = stage + 1
	return stage
end

local SetupMatchmakingStage_Zombies = function ( controller )
	local stage = NextStage()
	local connection = GetConnection( controller )
	local excellentPing = Dvar.excellentPing:get()
	local goodPing = Dvar.goodPing:get()
	local terriblePing = Dvar.terriblePing:get()
	SetDedicatedOnly( false )
	SetGeoWeightFlat( 1 )
	SetSkill( 1 )
	DelaySeconds( 1 + stage * 3 )
	SetMapPacksAll()
	if connection == Connection.BEST then
		PingRange( 1, excellentPing )
	elseif connection == Connection.NORMAL then
		PingRange( excellentPing, goodPing )
	else
		PingRange( goodPing, 999 )
	end
	if SearchParams.mode == Lobby.Matchmaking.SEARCH_MODE_LOBBY_MERGE then
		if stage > 0 then
			return false
		else
			return true
		end
	elseif SearchParams.mode == Lobby.Matchmaking.SEARCH_MODE_PUBLIC then
		local subStage = stage % 3
		if subStage == 1 and connection == Connection.NORMAL then
			PingRange( goodPing, terriblePing )
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

local SetupMatchmakingStage_Multiplayer = function ( controller )
	local stage = NextStage()
	local connection = GetConnection( controller )
	local excellentPing = Dvar.excellentPing:get()
	local goodPing = Dvar.goodPing:get()
	local terriblePing = Dvar.terriblePing:get()
	SetDedicatedOnly( false )
	SetGeoWeightTiered( 0.2 )
	SetSkill( 0.01 )
	DelaySeconds( 1 + stage * 3 )
	SetMapPacksAll()
	if connection == Connection.BEST then
		PingRange( 1, excellentPing )
		MinGeoMatch( 1 )
	elseif connection == Connection.NORMAL then
		PingRange( excellentPing, goodPing )
		MinGeoMatch( 1 )
	else
		PingRange( goodPing, 999 )
		MinGeoMatch( 0 )
	end
	if SearchParams.mode == Lobby.Matchmaking.SEARCH_MODE_LOBBY_MERGE then
		if stage > 0 then
			return false
		else
			MinGeoMatch( 1 )
			return true
		end
	elseif SearchParams.mode == Lobby.Matchmaking.SEARCH_MODE_DEDICATED_SERVER then
		if stage > 0 then
			return false
		else
			MinGeoMatch( 1 )
			PingRange( 1, 100 )
			SetDedicatedOnly( true )
			SetSkill( 0 )
			return true
		end
	elseif SearchParams.mode == Lobby.Matchmaking.SEARCH_MODE_PUBLIC then
		local subStage = stage % 4
		if subStage == 0 then
			return true
		elseif subStage == 1 then
			PingRange( 1, 100 )
			SetDedicatedOnly( true )
			MinGeoMatch( 1 )
			SetSkill( 0 )
			return true
		elseif subStage == 2 then
			SetSkill( 0 )
			return true
		else
			return false
		end
	elseif SearchParams.mode == Lobby.Matchmaking.SEARCH_MODE_LEAGUE then
		local subStage = stage % 3
		if subStage == 0 then
			return true
		elseif subStage == 1 then
			PingRange( 1, 100 )
			SetDedicatedOnly( true )
			MinGeoMatch( 1 )
			SetSkill( 0 )
			return true
		else
			return false
		end
	else
		return false
	end
end

Lobby.Matchmaking.SetupMatchmakingQuery = function ( controller, mode )
	SearchParams.mode = mode
	SearchParams.stage = 0
end

Lobby.Matchmaking.SetupMatchmakingStage = function ( controller )
	SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_ALL )
	SetShowInMatchmaking( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE )
	SetNetcodeVersion()
	SetGeoLocation()
	Dvar.lobbySearchIsEmpty:set( 0 )
	if CoD.isZombie then
		return SetupMatchmakingStage_Zombies( controller )
	else
		return SetupMatchmakingStage_Multiplayer( controller )
	end
end

local ServerType = {
	P2P_SERVER_MP = 1000,
	P2P_SERVER_ZM = 1001,
	P2P_SERVER_CP = 1002,
	DEDICATED_SERVER = 2000
}
local GetServerType = function ()
	if Engine.IsDedicatedServer() == true then
		return ServerType.DEDICATED_SERVER
	elseif true == CoD.isCampaign then
		return ServerType.P2P_SERVER_CP
	elseif true == CoD.isMultiplayer then
		return ServerType.P2P_SERVER_MP
	elseif true == CoD.isZombie then
		return ServerType.P2P_SERVER_ZM
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "No SessionMode was set. Defaulting to ServerType.P2P_SERVER_MP.\n" )
		return ServerType.P2P_SERVER_MP
	end
end

Lobby.Matchmaking.SetupAdvertising = function ()
	if Engine.IsDedicatedServer() == true then
		return 
	end
	local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbyAdvertiseMaxPlayers:set( maxClients )
	Dvar.lobbyAdvertiseNumPlayers:set( clientCount )
	local serverType = GetServerType()
	Dvar.lobbyAdvertiseServerType:set( serverType )
	Dvar.lobbyAdvertiseShowInMatchmaking:set( 1 )
	local protocolVersion = Engine.GetProtocolVersion()
	Dvar.lobbyAdvertiseNetcodeVersion:set( protocolVersion )
	Dvar.lobbyAdvertiseMapPacks:set( ContentPack.CONTENT_ORIGINALMAPS )
	local playlistID = Engine.GetPlaylistID()
	local playlistVersionNumber = Engine.GetPlaylistVersionNumber()
	local playlistNumber = Engine.EncodePlaylistNumber( playlistID )
	Dvar.lobbyAdvertisePlaylistVersion:set( playlistVersionNumber )
	Dvar.lobbyAdvertisePlaylistNumber:set( playlistNumber )
	if clientCount > 0 then
		Dvar.lobbyAdvertiseIsEmpty:set( 0 )
	else
		Dvar.lobbyAdvertiseIsEmpty:set( 1 )
	end
	local teamSize = math.max( 0, maxClients - clientCount )
	Dvar.lobbyAdvertiseTeamSizeMax:set( teamSize )
	Dvar.lobbyAdvertiseSkill:set( 1 )
	local geo = Engine.GetGeoLocation()
	if geo == nil then
		Dvar.lobbyAdvertiseGeo1:set( 0 )
		Dvar.lobbyAdvertiseGeo2:set( 0 )
		Dvar.lobbyAdvertiseGeo3:set( 0 )
		Dvar.lobbyAdvertiseGeo4:set( 0 )
	else
		Dvar.lobbyAdvertiseGeo1:set( geo.geo_1 )
		Dvar.lobbyAdvertiseGeo2:set( geo.geo_2 )
		Dvar.lobbyAdvertiseGeo3:set( geo.geo_3 )
		Dvar.lobbyAdvertiseGeo4:set( geo.geo_4 )
	end
end

Lobby.Matchmaking.UpdateAdvertising = function ()
	if Engine.IsDedicatedServer() == true then
		return 
	elseif Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		return 
	end
	local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbyAdvertiseMaxPlayers:set( maxClients )
	Dvar.lobbyAdvertiseNumPlayers:set( clientCount )
	if clientCount > 0 then
		Dvar.lobbyAdvertiseIsEmpty:set( 0 )
	else
		Dvar.lobbyAdvertiseIsEmpty:set( 1 )
	end
	local teamSize = math.max( 0, maxClients - clientCount )
	Dvar.lobbyAdvertiseTeamSizeMax:set( teamSize )
	Dvar.lobbyAdvertiseSkill:set( 1 )
	Dvar.lobbyAdvertiseDirty:set( true )
end

Lobby.Matchmaking.Pump = function ()
	if Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		return 
	elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		return 
	else
		
	end
end

