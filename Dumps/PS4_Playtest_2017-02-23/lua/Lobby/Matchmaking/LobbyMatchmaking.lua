require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingCP" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingMP" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingZM" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingArena" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingPriority" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingDedicated" )

Lobby.Matchmaking = {}
Lobby.Matchmaking.FFOTD_PLAYLIST_VERSION_OFFSET = 100000
Lobby.Matchmaking.INVALID_PARKING_PLAYLIST = 0
Lobby.Matchmaking.MAX_DATACENTERS_IN_QUERY = 5
Lobby.Matchmaking.SearchMode = {
	INVALID = 0,
	PUBLIC = 1,
	PUBLIC_CP_ALL = 2,
	ARENA = 3,
	LOBBY_MERGE = 4
}
Lobby.Matchmaking.ServerType = {
	P2P_SERVER_MP = 1000,
	P2P_SERVER_ZM = 1001,
	P2P_SERVER_CP = 1002,
	P2P_SERVER_CPZM = 1003,
	P2P_SERVER_CPDOA = 1004,
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
	stage = -1,
	retry = -1
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

Lobby.Matchmaking.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local curScreenId = Engine.GetLobbyUIScreen()
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsZombiesGame() and curScreenId == LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC ) then
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_FALSE, true )
	end
	Lobby.MatchmakingPriority.OnMatchStart( data )
end

Lobby.Matchmaking.OnMatchEnd = function ( data )
	if LuaUtils.IsArenaMode() then
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_FALSE, true )
	else
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE, true )
	end
	Lobby.Matchmaking.OnlineAdvertiseOnMatchEnd( data )
end

Lobby.Matchmaking.OnMatchChangeMap = function ( data )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_CAMPAIGN and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		local nextMap = data.nextMap
		if string.sub( nextMap, 1, 6 ) == "cp_sh_" then
			nextMap = Dvar.cp_queued_level:get()
		end
		local playlistID = LuaUtils.GetPlaylistIDForSelectedCPMission( nextMap )
		if playlistID ~= nil and playlistID > 0 then
			local advertisedPlaylist = Dvar.lobbyAdvertisePlaylistNumber:get()
			if advertisedPlaylist ~= playlistID then
				Dvar.lobbyAdvertisePlaylistNumber:set( playlistID )
				Dvar.lobbyAdvertiseDirty:set( true )
			end
		end
	end
end

Lobby.Matchmaking.OnLobbyOnlineUpdate = function ( data )
	local type = data.type
	local errorCode = data.errorCode
	if errorCode ~= nil and errorCode == LuaEnum.BD_NOT_CONNECTED then
		return 
	elseif type == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_PUMP then
		
	elseif type == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_SUCCESS then
		Lobby.Matchmaking.OnlineAdvertiseSuccess( data )
	elseif type == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_ERROR then
		Lobby.Matchmaking.OnlineAdvertiseError( data )
	end
end

Lobby.Matchmaking.OnJoinComplete = function ( data )
	local hostSecId = data.join.to.secIdint
	local joinType = data.join.joinType
	Lobby.MatchmakingPriority.AddHost( hostSecId, joinType )
end

Lobby.Matchmaking.GetFfotdPlaylistVersionNumber = function ()
	local ffotdVersionNumber = Engine.GetFFOTDVersion()
	local playlistVersionNumber = Engine.GetPlaylistVersionNumber()
	local ffotdPlaylistVersionNumber = ffotdVersionNumber * Lobby.Matchmaking.FFOTD_PLAYLIST_VERSION_OFFSET + playlistVersionNumber
	return ffotdPlaylistVersionNumber
end

Lobby.Matchmaking.ChangeAdvertisedStatus = function ( onOff, force )
	Dvar.lobbyAdvertiseShowInMatchmaking:set( onOff )
	if force == true then
		Dvar.lobbyAdvertiseDirty:set( force )
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
		local playlistID = Engine.GetPlaylistID()
		local maxTeamSize = math.floor( maxClients / 2 )
		local maxPartySize = Engine.GetPlaylistMaxPartySize( playlistID )
		local numSlots = maxClients - clientCount
		local member = {
			lobbyID = -1,
			lobbySkill = 0,
			skillRating = 0,
			arenaPoints = 0,
			xuid = 0
		}
		local partyTestSize = math.min( math.min( maxPartySize, maxTeamSize ), numSlots )
		teamSize = partyTestSize
		if CoDShared.IsGametypeTeamBased() then
			local inGame = Engine.IsInGame()
			local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			for partySize = partyTestSize, 1, -1 do
				if inGame then
					local lobbys = {
						partySize
					}
					if Lobby.TeamSelection.CanSplitInProgress( gamelobby.sessionClients, lobbys, maxClients ) then
						teamSize = partySize
					end
				end
				local privateLobbyList = {}
				for index, client in ipairs( gamelobby.sessionClients ) do
					if inGame then
						Lobby.TeamSelection.AddToPrivateLobbyListAsTeam( client, index, privateLobbyList )
					else
						Lobby.TeamSelection.AddToPrivateLobbyList( client, index, privateLobbyList )
					end
				end
				for j = 1, partySize, 1 do
					Lobby.TeamSelection.AddToPrivateLobbyList( member, j + #gamelobby.sessionClients, privateLobbyList )
				end
				local split = Lobby.TeamSelection.VladSplit( privateLobbyList, maxClients )
				if math.max( split.counts[1], split.counts[2] ) <= maxTeamSize then
					teamSize = partySize
				end
			end
		else
			local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
			teamSize = math.min( maxPartySize, maxClients - clientCount )
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "UpdateAdvertising: setting max team size to: " .. teamSize .. "\n" )
	Dvar.lobbyAdvertiseTeamSizeMax:set( teamSize )
	local skill = 0
	if LuaUtils.IsArenaMode() then
		skill = Lobby.MatchmakingArena.GetLobbyArenaSkill()
	else
		skill = Lobby.Matchmaking.GetLobbyAverageSkill()
	end
	Dvar.lobbyAdvertiseSkill:set( skill )
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
				if CoDShared.IsGameTypeDOA() then
					return Lobby.Matchmaking.ServerType.P2P_SERVER_CPDOA
				else
					return Lobby.Matchmaking.ServerType.P2P_SERVER_CP
				end
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
	Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE, false )
	local protocolVersion = Engine.GetProtocolVersion()
	Dvar.lobbyAdvertiseNetcodeVersion:set( protocolVersion )
	local playlistID = Engine.GetPlaylistID()
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_MULTIPLAYER then
		Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.GetMapPackBits( Engine.GetDLCBitsForLobby( Enum.LobbyType.LOBBY_TYPE_GAME ), playlistID ) )
	else
		Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ALL )
	end
	if Engine.IsDedicatedServer() == true then
		Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
		Dvar.lobbyAdvertiseServerLocation:set( Dvar.live_serverLocation:get() )
		Dvar.lobbyAdvertiseLatencyBand:set( 0 )
	end
	Dvar.lobbyAdvertisePlaylistVersion:set( Lobby.Matchmaking.GetFfotdPlaylistVersionNumber() )
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

Lobby.Matchmaking.SetMapPacks = function ( mapPacks )
	Dvar.lobbySearchMapPacks:set( mapPacks )
end

Lobby.Matchmaking.SetMapPacksOriginal = function ()
	Lobby.Matchmaking.SetMapPacks( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
end

Lobby.Matchmaking.SetMapPacksAll = function ()
	Lobby.Matchmaking.SetMapPacks( Lobby.Matchmaking.ContentPack.CONTENT_ALL )
end

Lobby.Matchmaking.GetMapPackBits = function ( clientDlcBits, playlistID )
	local bits = Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS
	local playlistInfo = Engine.GetPlaylistInfoByID( playlistID )
	if playlistInfo then
		local requiredBits = playlistInfo.playlist.requiredDLCMask
		local usedBits = playlistInfo.playlist.usedDLCMask
		bits = usedBits & clientDlcBits | requiredBits
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.GetMapPackBits: Setting dlc bits to " .. bits .. " from client dlcBits " .. clientDlcBits .. ", playlist requiredBits " .. playlistInfo.playlist.requiredDLCMask .. " and playlist usedBits " .. playlistInfo.playlist.usedDLCMask .. "\n" )
	else
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.GetMapPackBits: Invalid playlistID " .. playlistID .. ", setting dlc bits to originalmaps!\n" )
	end
	return bits
end

Lobby.Matchmaking.SetTeamSize = function ( teamSize )
	Dvar.lobbySearchTeamSize:set( teamSize )
end

Lobby.Matchmaking.SetPlaylistInfo = function ( playlistID )
	Dvar.lobbySearchPlaylistVersion:set( Lobby.Matchmaking.GetFfotdPlaylistVersionNumber() )
	local playlistNumber = Engine.EncodePlaylistNumber( playlistID )
	Dvar.lobbySearchPlaylistNumber:set( playlistNumber )
end

Lobby.Matchmaking.SetServerType = function ( serverType )
	Dvar.lobbySearchServerType:set( serverType )
end

Lobby.Matchmaking.SetIsEmpty = function ( value )
	Dvar.lobbySearchIsEmpty:set( value )
end

Lobby.Matchmaking.SetSkillWeight = function ( value )
	local lobbySkill = 0
	if LuaUtils.IsArenaMode() then
		lobbySkill = Lobby.MatchmakingArena.GetLobbyArenaSkill()
	else
		lobbySkill = Lobby.Matchmaking.GetLobbyAverageSkill()
	end
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
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.SetServerLocation(" .. queryID .. "," .. searchStage .. ")\n" )
	resultsOK = true
	forceServer = Dvar.lobbySearchForceLocation:get()
	if forceServer ~= 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Forcing server to " .. forceServer .. "\n" )
		Dvar.lobbySearchServerLocation1:set( forceServer )
		Dvar.lobbySearchPingBand:set( 1 )
		return resultsOK
	end
	local geo = Engine.GetGeoLocation()
	local searchType = Lobby.Matchmaking.DatacenterType.GAMESERVERS
	if Dvar.lobbySearchDatacenterType:get() ~= Lobby.Matchmaking.DatacenterType.ANY then
		searchType = Dvar.lobbySearchDatacenterType:get()
	end
	if geo then
		LuaUtils.LogQoS( "geolocation", geo )
		local geoDvar = Dvar.lobbySearchDatacenterTypeGeo:get()
		for name, value in pairs( Lobby.Matchmaking.DatacenterType ) do
			local ss = nil
			if geoDvar:find( "c" .. (geo.country_code or "?") .. "=" .. name ) then
				searchType = value
			end
		end
	end
	if Dvar.lobbySearchDatacenterTypeOverride:get() ~= Lobby.Matchmaking.DatacenterType.ANY then
		searchType = Dvar.lobbySearchDatacenterTypeOverride:get()
	end
	local dediQoSResults = Engine.GetDediQosResultsByType( searchType )
	if dediQoSResults.numResults == 0 then
		LuaUtils.LogQoS( "serverlocation", {
			ok = false,
			text = "No dedicated QOS results",
			searchType = searchType
		} )
		resultsOK = false
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Tried to get dedicated qos results, but no results available\n" )
	else
		servers = dediQoSResults.pingResults
		Lobby.Matchmaking.ClearPingBandWeightsAndServerLocations()
		pingCutoff = Dvar.lobbySearchDediUnparkPingLimit:get()
		if queryID == Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED then
			resultsOK = false
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking to unpark a server in:\n" )
			for idx, value in ipairs( servers ) do
				if idx <= Lobby.Matchmaking.MAX_DATACENTERS_IN_QUERY then
					if value.ping > pingCutoff then
						
					end
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, idx .. " " .. value.location .. " " .. value.ping .. "ms away\n" )
					Dvar["lobbySearchServerLocation" .. tostring( idx )].set( f29_local5["lobbySearchServerLocation" .. tostring( idx )], value.location )
					Dvar["lobbySearchPingBandWeight" .. tostring( idx )].set( f29_local5["lobbySearchPingBandWeight" .. tostring( idx )], 6 - idx )
					resultsOK = true
				end
			end
		else
			local bestPing = servers[1].ping
			if bestPing > pingCutoff then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "There are no acceptable datacenters\n" )
				resultsOK = false
				LuaUtils.LogQoS( "serverlocation", {
					ok = false,
					text = "No good datacenters",
					searchType = searchType,
					bestPing = bestPing
				} )
			else
				if searchStage <= dediQoSResults.numResults then
					local f29_local3 = searchStage
				end
				local chooseServerIndex = 1
				local f29_local1 = f29_local3 or chooseServerIndex
				if servers[f29_local1].ping > pingCutoff then
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Ping for location " .. servers[f29_local1].location .. " at " .. servers[f29_local1].ping .. "ms is too far away, selecting another suitable datacenter at random\n" )
					local lastGoodServer = 1
					for idx, server in ipairs( servers ) do
						if idx <= Lobby.Matchmaking.MAX_DATACENTERS_IN_QUERY then
							if server.ping > pingCutoff then
								break
							end
							lastGoodServer = idx
						end
					end
					f29_local1 = math.random( lastGoodServer )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Using index " .. f29_local1 .. " out of a possible " .. lastGoodServer .. " good datacenters\n" )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Using location " .. servers[f29_local1].location .. " that is " .. servers[f29_local1].ping .. "ms away\n" )
				end
				local chooseServer = servers[f29_local1]
				Dvar.lobbySearchServerLocation1:set( chooseServer.location )
				if Engine.GetDvarBool( "lobbySearchPingBandEnabled" ) then
					Dvar.lobbySearchPingBand:set( 0 )
					if chooseServer.location == Engine.GetDvarInt( "lobbySearchExperimentDatacenter" ) or Engine.GetDvarInt( "lobbySearchExperimentDatacenter" ) == 999 then
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "lobbySearchPingBandEnabled is true and the experiment DC matches (" .. chooseServer.location .. ") - setting the ping band to " .. chooseServer.ping .. "ms\n" )
						Dvar.lobbySearchPingBand:set( chooseServer.ping )
					end
				else
					Dvar.zlobbySearchPingBand:set( chooseServer.ping )
				end
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Using datacenter " .. f29_local1 .. " for search stage " .. searchStage .. "\n" )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking for an active server in " .. chooseServer.location .. " which is " .. chooseServer.ping .. "ms away\n" )
				LuaUtils.LogQoS( "serverlocation", {
					ok = true,
					text = "Found datacenter",
					searchType = searchType,
					server = chooseServer
				} )
				resultsOK = true
			end
		end
	end
	return resultsOK
end

Lobby.Matchmaking.SetPingBand = function ( value )
	Dvar.lobbySearchPingBand:set( value )
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
	Dvar.qosPreferredPing:set( 1 )
	Dvar.qosMaxAllowedPing:set( max )
end

Lobby.Matchmaking.MinGeoMatch = function ( min )
	Dvar.lobbySearchGeoMin:set( min )
end

Lobby.Matchmaking.GetConnection = function ( controller )
	return 0
end

Lobby.Matchmaking.NextStage = function ()
	local stage = Lobby.Matchmaking.SearchParams.stage
	local currentMode = Engine.CurrentSessionMode()
	if currentMode == Enum.eModes.MODE_MULTIPLAYER then
		stage = stage + 1
		local lobbyClientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if stage == Lobby.Matchmaking.SearchStage.DEDICATED_PARKED and not Lobby.MatchmakingMP.AllowUnparkSearch( lobbyClientCount ) then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Unpark Stage Skipped. Setting stage to DEDICATED_ON_PLAYLIST_1\n" )
			stage = Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1
			Lobby.Matchmaking.SearchParams.retry = Lobby.Matchmaking.SearchParams.retry + 1
		end
		if Lobby.Matchmaking.SearchStage.LISTEN <= stage and stage <= Lobby.Matchmaking.SearchStage.LISTEN_DESPERATE and not Lobby.MatchmakingMP.AllowListenSearch( lobbyClientCount ) then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Listen Host Stage Skipped. Setting stage to DEDICATED_ON_PLAYLIST_1\n" )
			stage = Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1
			Lobby.Matchmaking.SearchParams.retry = Lobby.Matchmaking.SearchParams.retry + 1
		end
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

Lobby.Matchmaking.ClearSearchInfo = function ()
	Lobby.Matchmaking.SearchParams.searchInfo = {}
end

Lobby.Matchmaking.SetupMatchmakingQuery = function ( controller, mode, resetSearchInfo )
	if nil == mode then
		error( "Lobby.Matchmaking.SetupMatchmakingQuery called with nil mode" )
	end
	Lobby.Matchmaking.SearchParams.mode = mode
	Lobby.Matchmaking.SearchParams.stage = 0
	if resetSearchInfo == true then
		Lobby.Matchmaking.ClearSearchInfo()
		Lobby.Matchmaking.SearchParams.searchInfo.startTime = Engine.milliseconds()
		Lobby.Matchmaking.SearchParams.retry = 0
	elseif nil == Lobby.Matchmaking.SearchParams.searchInfo or nil == Lobby.Matchmaking.SearchParams.searchInfo.startTime then
		Lobby.Matchmaking.ClearSearchInfo()
		Lobby.Matchmaking.SearchParams.searchInfo.startTime = Engine.milliseconds()
		Lobby.Matchmaking.SearchParams.retry = 0
	end
end

Lobby.Matchmaking.SetupMatchmakingStage = function ( controller )
	local currentMode = Engine.CurrentSessionMode()
	if currentMode == Enum.eModes.MODE_CAMPAIGN then
		return Lobby.MatchmakingCP.SetupMatchmakingStage( controller )
	elseif currentMode == Enum.eModes.MODE_MULTIPLAYER then
		if Engine.IsDedicatedServer() == true then
			return Lobby.MatchmakingDedicated.SetupMatchmakingStage( controller )
		elseif LuaUtils.IsArenaMode() then
			return Lobby.MatchmakingArena.SetupMatchmakingStage( controller )
		else
			return Lobby.MatchmakingMP.SetupMatchmakingStage( controller )
		end
	elseif currentMode == Enum.eModes.MODE_ZOMBIES then
		return Lobby.MatchmakingZM.SetupMatchmakingStage( controller )
	else
		return false
	end
end

Lobby.Matchmaking.LobbyOnline = {
	errorCount = 0,
	errorTime = -1,
	reAdvertiseTime = -1,
	comError = false,
	RE_ADVERTISE_INTERVAL = 30000,
	ADVERTISE_ERROR_TIME = 300000
}
Lobby.Matchmaking.OnlineAdvertiseClear = function ()
	Lobby.Matchmaking.LobbyOnline = {
		errorCount = 0,
		errorTime = -1,
		reAdvertiseTime = -1,
		comError = false,
		RE_ADVERTISE_INTERVAL = 30000,
		ADVERTISE_ERROR_TIME = 300000
	}
end

Lobby.Matchmaking.OnlineAdvertiseSuccess = function ( data )
	Lobby.Matchmaking.OnlineAdvertiseClear()
end

Lobby.Matchmaking.OnlineAdvertiseError = function ( data )
	Lobby.Matchmaking.LobbyOnline.errorCount = Lobby.Matchmaking.LobbyOnline.errorCount + 1
	if Engine.IsDedicatedServer() == true then
		if Lobby.Matchmaking.LobbyOnline.errorCount == 1 then
			Lobby.Matchmaking.LobbyOnline.errorTime = Engine.milliseconds() + Lobby.Matchmaking.LobbyOnline.ADVERTISE_ERROR_TIME
		end
		Lobby.Matchmaking.LobbyOnline.reAdvertiseTime = Engine.milliseconds() + Lobby.Matchmaking.LobbyOnline.RE_ADVERTISE_INTERVAL
	elseif Engine.IsInGame() then
		Lobby.Matchmaking.LobbyOnline.comError = true
	else
		Lobby.Matchmaking.OnlineAdvertiseClear()
		LuaUtils.SafeComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
		return 
	end
end

Lobby.Matchmaking.OnlineAdvertisePump = function ( data )
	if Engine.IsDedicatedServer() == false then
		return 
	elseif Lobby.Matchmaking.LobbyOnline.errorCount == 0 then
		return 
	elseif Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		Lobby.Matchmaking.OnlineAdvertiseClear()
		return 
	elseif Lobby.Matchmaking.LobbyOnline.errorCount > 0 and Lobby.ProcessQueue.IsQueueEmpty() == true then
		if Engine.milliseconds() > Lobby.Matchmaking.LobbyOnline.reAdvertiseTime then
			local process = Lobby.Process.ReAdvertiseLobby( controller )
			Lobby.ProcessQueue.AddToQueue( "ReAdvertiseLobby", process )
			Lobby.Matchmaking.LobbyOnline.reAdvertiseTime = Engine.milliseconds() + Lobby.Matchmaking.LobbyOnline.RE_ADVERTISE_INTERVAL
		end
		if Engine.milliseconds() > Lobby.Matchmaking.LobbyOnline.errorTime then
			if Engine.IsInGame() then
				Lobby.Matchmaking.LobbyOnline.comError = true
			else
				Engine.AdvertiseErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
				Lobby.Matchmaking.OnlineAdvertiseClear()
				LuaUtils.SafeComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
				return 
			end
		end
	end
end

Lobby.Matchmaking.OnlineAdvertiseOnMatchEnd = function ( data )
	if Lobby.Matchmaking.LobbyOnline.errorCount > 0 and Lobby.Matchmaking.LobbyOnline.comError == true then
		Lobby.Matchmaking.OnlineAdvertiseClear()
		LuaUtils.SafeComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
		return 
	else
		
	end
end

Lobby.Matchmaking.Pump = function ( data )
	Lobby.Matchmaking.OnlineAdvertisePump( data )
end

