require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingCP" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingMP" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingZM" )

Lobby.Matchmaking = {}
Lobby.Matchmaking.INVALID_PARKING_PLAYLIST = 0
Lobby.Matchmaking.SearchMode = {
	INVALID = 0,
	PUBLIC = 1,
	LEAGUE = 2,
	LOBBY_MERGE = 3
}
Lobby.Matchmaking.ServerType = {
	P2P_SERVER_MP = 1000,
	P2P_SERVER_ZM = 1001,
	P2P_SERVER_CP = 1002,
	P2P_SERVER_CPZM = 1003,
	DEDICATED_SERVER = 2000
}
Lobby.Matchmaking.SearchStage = {
	DEDICATED_ON_PLAYLIST_1 = 1,
	DEDICATED_ON_PLAYLIST_2 = 2,
	DEDICATED_ON_PLAYLIST_3 = 3,
	DEDICATED_PARKED = 4,
	LISTEN = 5,
	LISTEN_DESPERATE = 6,
	DONE = 7
}
Lobby.Matchmaking.Connection = {
	NORMAL = 0,
	BEST = 1,
	ANY = 2
}
Lobby.Matchmaking.ContentPack = {
	CONTENT_ORIGINALMAPS = 2,
	CONTENT_ALL = 65535
}
Lobby.Matchmaking.SessionEmpty = {
	IS_EMPTY = 1,
	IS_NOT_EMPTY = 0
}
Lobby.Matchmaking.DatacenterType = {
	ANY = 0,
	GAMESERVERS = 1,
	THUNDERHEAD = 2
}
Lobby.Matchmaking.SearchParams = {
	mode = -1,
	stage = -1
}
Lobby.Matchmaking.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Matchmaking.UpdateLatencyBand()
		Lobby.Matchmaking.UpdateAdvertising( "client joined" )
	end
end

Lobby.Matchmaking.OnClientRemoved = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Matchmaking.UpdateLatencyBand()
		Lobby.Matchmaking.UpdateAdvertising( "client left" )
	end
end

Lobby.Matchmaking.GetLobbyAverageSkill = function ()
	local skill = 0
	local memberCount = 0
	local lobbyGame = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for index, gameClient in ipairs( lobbyGame.sessionClients ) do
		skill = skill + gameClient.skillRating
		memberCount = memberCount + 1
	end
	if memberCount == 0 then
		return 0
	else
		return skill / memberCount
	end
end

Lobby.Matchmaking.UpdateAdvertising = function ( reason )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "UpdateAdvertising: " .. reason .. "\n" )
	local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbyAdvertiseMaxPlayers:set( maxClients )
	Dvar.lobbyAdvertiseNumPlayers:set( clientCount )
	if clientCount > 0 then
		Dvar.lobbyAdvertiseIsEmpty:set( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	else
		Dvar.lobbyAdvertiseIsEmpty:set( Lobby.Matchmaking.SessionEmpty.IS_EMPTY )
	end
	local teamSize = math.max( 0, maxClients - clientCount )
	local currentMode = Engine.CurrentSessionMode()
	if currentMode == Enum.eModes.MODE_MULTIPLAYER then
		local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local privateLobbyList = {}
		for index, client in ipairs( gamelobby.sessionClients ) do
			Lobby.TeamSelection.AddToPrivateLobbyList( client, index, privateLobbyList )
		end
		local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
		local split = Lobby.TeamSelection.VladSplit( privateLobbyList, maxClients )
		local playlistID = Engine.GetPlaylistID()
		local maxPartySize = Engine.GetPlaylistMaxPartySize( playlistID )
		teamSize = maxPartySize - math.min( split.counts[1], split.counts[2] )
	end
	Dvar.lobbyAdvertiseTeamSizeMax:set( teamSize )
	Dvar.lobbyAdvertiseSkill:set( 1 )
	Dvar.lobbyAdvertiseDirty:set( true )
end

Lobby.Matchmaking.UpdateLatencyBand = function ()
	if Engine.IsDedicatedServer() == false then
		return 
	end
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local advertisedBand = Dvar.lobbyAdvertiseLatencyBand:get()
	local lowestClientBand = 255
	for index, client in ipairs( gamelobby.sessionClients ) do
		if client.pingBand < lowestClientBand then
			lowestClientBand = client.pingBand
		end
	end
	if advertisedBand == 0 or lowestClientBand < advertisedBand then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Latency band: " .. advertisedBand .. " --> " .. lowestClientBand .. "\n" )
		Dvar.lobbyAdvertiseLatencyBand:set( lowestClientBand )
	end
end

Lobby.Matchmaking.GetServerType = function ()
	if Engine.IsDedicatedServer() == true then
		return Lobby.Matchmaking.ServerType.DEDICATED_SERVER
	else
		local currentMode = Engine.CurrentSessionMode()
		if currentMode == Enum.eModes.MODE_CAMPAIGN then
			if not Engine.IsCampaignModeZombies() then
				return Lobby.Matchmaking.ServerType.P2P_SERVER_CP
			else
				return Lobby.Matchmaking.ServerType.P2P_SERVER_CPZM
			end
		elseif currentMode == Enum.eModes.MODE_MULTIPLAYER then
			return Lobby.Matchmaking.ServerType.P2P_SERVER_MP
		elseif currentMode == Enum.eModes.MODE_ZOMBIES then
			return Lobby.Matchmaking.ServerType.P2P_SERVER_ZM
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "No SessionMode was set. Defaulting to Lobby.Matchmaking.ServerType.P2P_SERVER_MP.\n" )
			return Lobby.Matchmaking.ServerType.P2P_SERVER_MP
		end
	end
end

Lobby.Matchmaking.SetupAdvertising = function ()
	local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local serverType = Lobby.Matchmaking.GetServerType()
	Dvar.lobbyAdvertiseServerType:set( serverType )
	Dvar.lobbyAdvertiseShowInMatchmaking:set( 1 )
	local protocolVersion = Engine.GetProtocolVersion()
	Dvar.lobbyAdvertiseNetcodeVersion:set( protocolVersion )
	Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
	if Engine.IsDedicatedServer() == true then
		Lobby.Matchmaking.SetMapPacksOriginal()
		Dvar.lobbyAdvertiseServerLocation:set( Dvar.live_serverLocation:get() )
		Dvar.lobbyAdvertiseLatencyBand:set( 0 )
	end
	local playlistVersionNumber = Engine.GetPlaylistVersionNumber()
	Dvar.lobbyAdvertisePlaylistVersion:set( playlistVersionNumber )
	local playlistID = Engine.GetPlaylistID()
	local playlistNumber = Engine.EncodePlaylistNumber( playlistID )
	Dvar.lobbyAdvertisePlaylistNumber:set( playlistNumber )
	Lobby.Matchmaking.UpdateAdvertising( "session creation" )
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

Lobby.Matchmaking.SetQueryId = function ( value )
	Dvar.lobbySearchQueryId:set( value )
end

Lobby.Matchmaking.SetShowInMatchmaking = function ( value )
	Dvar.lobbySearchShowInMatchmaking:set( value )
end

Lobby.Matchmaking.SetNetcodeVersion = function ()
	Dvar.lobbySearchNetcodeVersion:set( Engine.GetProtocolVersion() )
end

Lobby.Matchmaking.SetMapPacksOriginal = function ()
	Dvar.lobbySearchMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
end

Lobby.Matchmaking.SetMapPacksAll = function ()
	Dvar.lobbySearchMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
end

Lobby.Matchmaking.SetTeamSize = function ( teamSize )
	Dvar.lobbySearchTeamSize:set( teamSize )
end

Lobby.Matchmaking.SetPlaylistInfo = function ( playlistID )
	local playlistVersionNumber = Engine.GetPlaylistVersionNumber()
	Dvar.lobbySearchPlaylistVersion:set( playlistVersionNumber )
	local playlistNumber = Engine.EncodePlaylistNumber( playlistID )
	Dvar.lobbySearchPlaylistNumber:set( playlistNumber )
end

Lobby.Matchmaking.SetIsEmpty = function ( value )
	Dvar.lobbySearchIsEmpty:set( value )
end

Lobby.Matchmaking.SetSkillWeight = function ( value )
	local lobbySkill = Lobby.Matchmaking.GetLobbyAverageSkill()
	Dvar.lobbySearchSkill:set( lobbySkill )
	Dvar.lobbySearchSkillWeight:set( value )
end

Lobby.Matchmaking.SetGeoLocation = function ()
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

Lobby.Matchmaking.ClearPingBandWeightsAndServerLocations = function ()
	Dvar.lobbySearchPingBandWeight1:set( 0 )
	Dvar.lobbySearchPingBandWeight2:set( 0 )
	Dvar.lobbySearchPingBandWeight3:set( 0 )
	Dvar.lobbySearchPingBandWeight4:set( 0 )
	Dvar.lobbySearchPingBandWeight5:set( 0 )
	Dvar.lobbySearchServerLocation1:set( 33 )
	Dvar.lobbySearchServerLocation2:set( 33 )
	Dvar.lobbySearchServerLocation3:set( 33 )
	Dvar.lobbySearchServerLocation4:set( 33 )
	Dvar.lobbySearchServerLocation5:set( 33 )
end

Lobby.Matchmaking.SetServerLocation = function ( queryID, searchStage )
	resultsOK = true
	forceServer = Dvar.lobbySearchForceLocation:get()
	if forceServer ~= 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Forcing server to " .. forceServer .. "\n" )
		Dvar.lobbySearchServerLocation:set( forceServer )
		Dvar.lobbySearchPingBand:set( 1 )
		return resultsOK
	end
	local searchType = Lobby.Matchmaking.DatacenterType.GAMESERVERS
	if Dvar.lobbySearchDatacenterType:exists() then
		searchType = Dvar.lobbySearchDatacenterType:get()
	end
	local dediQoSResults = Engine.GetDediQosResultsByType( searchType )
	if dediQoSResults.numResults == 0 then
		resultsOK = false
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Tried to get dedicated qos results, but no results available\n" )
	else
		servers = dediQoSResults.pingResults
		Lobby.Matchmaking.ClearPingBandWeightsAndServerLocations()
		pingCutoff = Dvar.lobbySearchDediUnparkPingLimit:get()
		if queryID == Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED then
			if servers[1].ping <= pingCutoff then
				Dvar.lobbySearchServerLocation1:set( servers[1].location )
				Dvar.lobbySearchPingBandWeight1:set( 5 )
			end
			if servers[2].ping <= pingCutoff then
				Dvar.lobbySearchServerLocation2:set( servers[2].location )
				Dvar.lobbySearchPingBandWeight2:set( 4 )
			end
			if servers[3].ping <= pingCutoff then
				Dvar.lobbySearchServerLocation3:set( servers[3].location )
				Dvar.lobbySearchPingBandWeight3:set( 3 )
			end
			if servers[4].ping <= pingCutoff then
				Dvar.lobbySearchServerLocation4:set( servers[4].location )
				Dvar.lobbySearchPingBandWeight4:set( 2 )
			end
			if servers[5].ping <= pingCutoff then
				Dvar.lobbySearchServerLocation5:set( servers[5].location )
				Dvar.lobbySearchPingBandWeight5:set( 1 )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking to unpark a server in:\n" )
			for i = 1, 5, 1 do
				if servers[i].ping > pingCutoff then
					
				end
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, i .. " " .. servers[i].location .. " " .. servers[i].ping .. "ms away\n" )
			end
		elseif dediQoSResults.numResults < searchStage then
			resultsOK = false
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Stage " .. searchStage .. " greater than numresults " .. dediQoSResults.numResults .. "\n" )
		else
			local bestServer = servers[searchStage]
			if bestServer.ping > pingCutoff then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, bestServer.location .. " is over our our ping cutoff at " .. bestServer.ping .. "ms\n" )
				resultsOK = false
			else
				Dvar.lobbySearchServerLocation1:set( bestServer.location )
				Dvar.lobbySearchPingBand:set( bestServer.ping )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking for an active server in " .. bestServer.location .. " which is " .. bestServer.ping .. "ms away\n" )
			end
		end
	end
	return resultsOK
end

Lobby.Matchmaking.SetPingBandWeight = function ( value )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Ping band weight set to " .. value .. "\n" )
	Dvar.lobbySearchPingBandWeight1:set( value )
end

Lobby.Matchmaking.SetGeoWeightFlat = function ( value )
	Dvar.lobbySearchGeo1Weight:set( value )
	Dvar.lobbySearchGeo2Weight:set( value )
	Dvar.lobbySearchGeo3Weight:set( value )
	Dvar.lobbySearchGeo4Weight:set( value )
end

Lobby.Matchmaking.SetGeoWeightTiered = function ( value )
	Dvar.lobbySearchGeo1Weight:set( value * 4 )
	Dvar.lobbySearchGeo2Weight:set( value * 3 )
	Dvar.lobbySearchGeo3Weight:set( value * 2 )
	Dvar.lobbySearchGeo4Weight:set( value )
end

Lobby.Matchmaking.PingRange = function ( min, max )
	Dvar.qosPreferredPing:set( min )
	Dvar.qosMaxAllowedPing:set( max )
end

Lobby.Matchmaking.MinGeoMatch = function ( min )
	Dvar.searchSessionGeoMin:set( min )
end

Lobby.Matchmaking.GetConnection = function ( controller )
	return 0
end

Lobby.Matchmaking.NextStage = function ()
	local stage = Lobby.Matchmaking.SearchParams.stage
	local currentMode = Engine.CurrentSessionMode()
	if currentMode == Enum.eModes.MODE_MULTIPLAYER then
		stage = stage + 1
	elseif stage == 0 then
		stage = Lobby.Matchmaking.SearchStage.LISTEN
	else
		stage = stage + 1
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "NextStage: " .. Lobby.Matchmaking.SearchParams.stage .. "-->" .. stage .. "\n" )
	Lobby.Matchmaking.SearchParams.stage = stage
	return stage
end

Lobby.Matchmaking.GetNumSlotsNeededOnTeam = function ( stage )
	local numSlotsNeededOnTeam = 1
	if stage ~= Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		numSlotsNeededOnTeam = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if numSlotsNeededOnTeam < 1 then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "numSlotsNeededOnTeam was 0, why?\n" )
			numSlotsNeededOnTeam = 1
		end
	end
	return numSlotsNeededOnTeam
end

Lobby.Matchmaking.SetupMatchmakingQuery = function ( controller, mode )
	if nil == mode then
		error( "Lobby.Matchmaking.SetupMatchmakingQuery called with nil mode" )
	end
	Lobby.Matchmaking.SearchParams.mode = mode
	Lobby.Matchmaking.SearchParams.stage = 0
end

Lobby.Matchmaking.SetupMatchmakingStage = function ( controller )
	local currentMode = Engine.CurrentSessionMode()
	if currentMode == Enum.eModes.MODE_CAMPAIGN then
		return Lobby.MatchmakingCP.SetupMatchmakingStage( controller )
	elseif currentMode == Enum.eModes.MODE_MULTIPLAYER then
		return Lobby.MatchmakingMP.SetupMatchmakingStage( controller )
	elseif currentMode == Enum.eModes.MODE_ZOMBIES then
		return Lobby.MatchmakingZM.SetupMatchmakingStage( controller )
	else
		return false
	end
end

