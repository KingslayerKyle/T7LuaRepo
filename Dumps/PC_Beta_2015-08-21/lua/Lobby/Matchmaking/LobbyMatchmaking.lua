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
Lobby.Matchmaking.MAX_DATACENTERS_IN_QUERY = 5
Lobby.Matchmaking.SearchParams = {
	mode = -1,
	stage = -1
}
local f0_local0 = function ( f1_arg0 )
	return math.max( math.min( f1_arg0 / 20 + 0.5, 1 ), 0 )
end

Lobby.Matchmaking.OnClientAdded = function ( f2_arg0 )
	local f2_local0 = f2_arg0.lobbyModule
	local f2_local1 = f2_arg0.lobbyType
	local f2_local2 = f2_arg0.lobbyMode
	local f2_local3 = f2_arg0.xuid
	if f2_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f2_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Matchmaking.UpdateLatencyBand()
		Lobby.Matchmaking.UpdateAdvertising( "client joined" )
	end
end

Lobby.Matchmaking.OnClientRemoved = function ( f3_arg0 )
	local f3_local0 = f3_arg0.lobbyModule
	local f3_local1 = f3_arg0.lobbyType
	local f3_local2 = f3_arg0.lobbyMode
	if f3_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f3_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Matchmaking.UpdateLatencyBand()
		Lobby.Matchmaking.UpdateAdvertising( "client left" )
	end
end

Lobby.Matchmaking.OnMatchEnd = function ( f4_arg0 )
	Dvar.lobbyAdvertiseShowInMatchmaking:set( 1 )
	Dvar.lobbyAdvertiseDirty:set( true )
end

Lobby.Matchmaking.GetLobbyAverageSkill = function ()
	local f5_local0 = 0
	local f5_local1 = 0
	local f5_local2 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f5_local6, f5_local7 in ipairs( f5_local2.sessionClients ) do
		f5_local0 = f5_local0 + f5_local7.skillRating
		f5_local1 = f5_local1 + 1
	end
	if f5_local1 == 0 then
		return 0
	else
		return f5_local0 / f5_local1
	end
end

Lobby.Matchmaking.UpdateAdvertising = function ( f6_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "UpdateAdvertising: " .. f6_arg0 .. "\n" )
	local f6_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f6_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbyAdvertiseMaxPlayers:set( f6_local0 )
	Dvar.lobbyAdvertiseNumPlayers:set( f6_local1 )
	if f6_local1 > 0 then
		Dvar.lobbyAdvertiseIsEmpty:set( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	else
		Dvar.lobbyAdvertiseIsEmpty:set( Lobby.Matchmaking.SessionEmpty.IS_EMPTY )
	end
	local f6_local2 = math.max( 0, f6_local0 - f6_local1 )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_MULTIPLAYER then
		local f6_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f6_local4 = {}
		for f6_local8, f6_local9 in ipairs( f6_local3.sessionClients ) do
			Lobby.TeamSelection.AddToPrivateLobbyList( f6_local9, f6_local8, f6_local4 )
		end
		f6_local6 = Lobby.TeamSelection.VladSplit( f6_local4, Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME ) )
		f6_local2 = Engine.GetPlaylistMaxPartySize( Engine.GetPlaylistID() ) - math.min( f6_local6.counts[1], f6_local6.counts[2] )
	end
	Dvar.lobbyAdvertiseTeamSizeMax:set( f6_local2 )
	Dvar.lobbyAdvertiseSkill:set( f0_local0( Lobby.Matchmaking.GetLobbyAverageSkill() ) )
	Dvar.lobbyAdvertiseDirty:set( true )
end

Lobby.Matchmaking.UpdateLatencyBand = function ()
	if Engine.IsDedicatedServer() == false then
		return 
	end
	local f7_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f7_local1 = Dvar.lobbyAdvertiseLatencyBand:get()
	local f7_local2 = 255
	for f7_local6, f7_local7 in ipairs( f7_local0.sessionClients ) do
		if f7_local7.pingBand < f7_local2 then
			f7_local2 = f7_local7.pingBand
		end
	end
	if f7_local1 == 0 or f7_local2 < f7_local1 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Latency band: " .. f7_local1 .. " --> " .. f7_local2 .. "\n" )
		Dvar.lobbyAdvertiseLatencyBand:set( f7_local2 )
	end
end

Lobby.Matchmaking.GetServerType = function ()
	if Engine.IsDedicatedServer() == true then
		return Lobby.Matchmaking.ServerType.DEDICATED_SERVER
	else
		local f8_local0 = Engine.CurrentSessionMode()
		if f8_local0 == Enum.eModes.MODE_CAMPAIGN then
			if not Engine.IsCampaignModeZombies() then
				return Lobby.Matchmaking.ServerType.P2P_SERVER_CP
			else
				return Lobby.Matchmaking.ServerType.P2P_SERVER_CPZM
			end
		elseif f8_local0 == Enum.eModes.MODE_MULTIPLAYER then
			return Lobby.Matchmaking.ServerType.P2P_SERVER_MP
		elseif f8_local0 == Enum.eModes.MODE_ZOMBIES then
			return Lobby.Matchmaking.ServerType.P2P_SERVER_ZM
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "No SessionMode was set. Defaulting to Lobby.Matchmaking.ServerType.P2P_SERVER_MP.\n" )
			return Lobby.Matchmaking.ServerType.P2P_SERVER_MP
		end
	end
end

Lobby.Matchmaking.SetupAdvertising = function ()
	local f9_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f9_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbyAdvertiseServerType:set( Lobby.Matchmaking.GetServerType() )
	Dvar.lobbyAdvertiseShowInMatchmaking:set( 1 )
	Dvar.lobbyAdvertiseNetcodeVersion:set( Engine.GetProtocolVersion() )
	Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
	if Engine.IsDedicatedServer() == true then
		Lobby.Matchmaking.SetMapPacksOriginal()
		Dvar.lobbyAdvertiseServerLocation:set( Dvar.live_serverLocation:get() )
		Dvar.lobbyAdvertiseLatencyBand:set( 0 )
	end
	Dvar.lobbyAdvertisePlaylistVersion:set( Engine.GetPlaylistVersionNumber() )
	Dvar.lobbyAdvertisePlaylistNumber:set( Engine.EncodePlaylistNumber( Engine.GetPlaylistID() ) )
	Lobby.Matchmaking.UpdateAdvertising( "session creation" )
	local f9_local2 = Engine.GetGeoLocation()
	if f9_local2 == nil then
		Dvar.lobbyAdvertiseGeo1:set( 0 )
		Dvar.lobbyAdvertiseGeo2:set( 0 )
		Dvar.lobbyAdvertiseGeo3:set( 0 )
		Dvar.lobbyAdvertiseGeo4:set( 0 )
	else
		Dvar.lobbyAdvertiseGeo1:set( f9_local2.geo_1 )
		Dvar.lobbyAdvertiseGeo2:set( f9_local2.geo_2 )
		Dvar.lobbyAdvertiseGeo3:set( f9_local2.geo_3 )
		Dvar.lobbyAdvertiseGeo4:set( f9_local2.geo_4 )
	end
end

Lobby.Matchmaking.SetQueryId = function ( f10_arg0 )
	Dvar.lobbySearchQueryId:set( f10_arg0 )
end

Lobby.Matchmaking.SetShowInMatchmaking = function ( f11_arg0 )
	Dvar.lobbySearchShowInMatchmaking:set( f11_arg0 )
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

Lobby.Matchmaking.SetTeamSize = function ( f15_arg0 )
	Dvar.lobbySearchTeamSize:set( f15_arg0 )
end

Lobby.Matchmaking.SetPlaylistInfo = function ( f16_arg0 )
	Dvar.lobbySearchPlaylistVersion:set( Engine.GetPlaylistVersionNumber() )
	Dvar.lobbySearchPlaylistNumber:set( Engine.EncodePlaylistNumber( f16_arg0 ) )
end

Lobby.Matchmaking.SetIsEmpty = function ( f17_arg0 )
	Dvar.lobbySearchIsEmpty:set( f17_arg0 )
end

Lobby.Matchmaking.SetSkillWeight = function ( f18_arg0 )
	Dvar.lobbySearchSkill:set( f0_local0( Lobby.Matchmaking.GetLobbyAverageSkill() ) )
	Dvar.lobbySearchSkillWeight:set( f18_arg0 )
end

Lobby.Matchmaking.SetGeoLocation = function ()
	local f19_local0 = Engine.GetGeoLocation()
	if f19_local0 == nil then
		Dvar.lobbySearchGeo1:set( 0 )
		Dvar.lobbySearchGeo2:set( 0 )
		Dvar.lobbySearchGeo3:set( 0 )
		Dvar.lobbySearchGeo4:set( 0 )
	else
		Dvar.lobbySearchGeo1:set( f19_local0.geo_1 )
		Dvar.lobbySearchGeo2:set( f19_local0.geo_2 )
		Dvar.lobbySearchGeo3:set( f19_local0.geo_3 )
		Dvar.lobbySearchGeo4:set( f19_local0.geo_4 )
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

Lobby.Matchmaking.SetServerLocation = function ( f21_arg0, f21_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.SetServerLocation(" .. f21_arg0 .. "," .. f21_arg1 .. ")\n" )
	resultsOK = true
	forceServer = Dvar.lobbySearchForceLocation:get()
	if forceServer ~= 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Forcing server to " .. forceServer .. "\n" )
		Dvar.lobbySearchServerLocation:set( forceServer )
		Dvar.lobbySearchPingBand:set( 1 )
		return resultsOK
	end
	local f21_local0 = Engine.GetGeoLocation()
	local f21_local1 = Lobby.Matchmaking.DatacenterType.GAMESERVERS
	if Dvar.lobbySearchDatacenterType:exists() and Dvar.lobbySearchDatacenterType:get() ~= Lobby.Matchmaking.DatacenterType.ANY then
		f21_local1 = Dvar.lobbySearchDatacenterType:get()
	end
	if f21_local0 and Dvar.lobbySearchDatacenterTypeGeo:exists() then
		local f21_local2 = Dvar.lobbySearchDatacenterTypeGeo:get()
		for f21_local6, f21_local7 in pairs( Lobby.Matchmaking.DatacenterType ) do
			local f21_local8 = nil
			if f21_local2:find( "c" .. (f21_local0.country_code or "?") .. "=" .. f21_local6 ) then
				f21_local1 = f21_local7
			end
		end
	end
	if Dvar.lobbySearchDatacenterTypeOverride:exists() and Dvar.lobbySearchDatacenterTypeOverride:get() ~= Lobby.Matchmaking.DatacenterType.ANY then
		f21_local1 = Dvar.lobbySearchDatacenterTypeOverride:get()
	end
	local f21_local2 = Engine.GetDediQosResultsByType( f21_local1 )
	if f21_local2.numResults == 0 then
		resultsOK = false
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Tried to get dedicated qos results, but no results available\n" )
	else
		servers = f21_local2.pingResults
		Lobby.Matchmaking.ClearPingBandWeightsAndServerLocations()
		pingCutoff = Dvar.lobbySearchDediUnparkPingLimit:get()
		if f21_arg0 == Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED then
			resultsOK = false
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking to unpark a server in:\n" )
			for f21_local6, f21_local7 in ipairs( servers ) do
				if f21_local6 <= Lobby.Matchmaking.MAX_DATACENTERS_IN_QUERY then
					if f21_local7.ping > pingCutoff then
						
					end
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, f21_local6 .. " " .. f21_local7.location .. " " .. f21_local7.ping .. "ms away\n" )
					Dvar["lobbySearchServerLocation" .. tostring( f21_local6 )].set( f21_local8["lobbySearchServerLocation" .. tostring( f21_local6 )], f21_local7.location )
					Dvar["lobbySearchPingBandWeight" .. tostring( f21_local6 )].set( f21_local8["lobbySearchPingBandWeight" .. tostring( f21_local6 )], 6 - f21_local6 )
					resultsOK = true
				end
			end
		elseif servers[1].ping > pingCutoff then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "There are no acceptable datacenters\n" )
			resultsOK = false
		else
			if f21_arg1 <= f21_local2.numResults then
				local f21_local9 = f21_arg1
			end
			local f21_local4 = f21_local9 or 1
			local f21_local5 = servers[f21_local4]
			Dvar.lobbySearchServerLocation1:set( f21_local5.location )
			Dvar.lobbySearchPingBand:set( f21_local5.ping )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Using datacenter " .. f21_local4 .. " for search stage " .. f21_arg1 .. "\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking for an active server in " .. f21_local5.location .. " which is " .. f21_local5.ping .. "ms away\n" )
			resultsOK = true
		end
	end
	return resultsOK
end

Lobby.Matchmaking.SetPingBandWeight = function ( f22_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Ping band weight set to " .. f22_arg0 .. "\n" )
	Dvar.lobbySearchPingBandWeight1:set( f22_arg0 )
end

Lobby.Matchmaking.SetGeoWeightFlat = function ( f23_arg0 )
	Dvar.lobbySearchGeo1Weight:set( f23_arg0 )
	Dvar.lobbySearchGeo2Weight:set( f23_arg0 )
	Dvar.lobbySearchGeo3Weight:set( f23_arg0 )
	Dvar.lobbySearchGeo4Weight:set( f23_arg0 )
end

Lobby.Matchmaking.SetGeoWeightTiered = function ( f24_arg0 )
	Dvar.lobbySearchGeo1Weight:set( f24_arg0 * 4 )
	Dvar.lobbySearchGeo2Weight:set( f24_arg0 * 3 )
	Dvar.lobbySearchGeo3Weight:set( f24_arg0 * 2 )
	Dvar.lobbySearchGeo4Weight:set( f24_arg0 )
end

Lobby.Matchmaking.PingRange = function ( f25_arg0, f25_arg1 )
	Dvar.qosPreferredPing:set( f25_arg0 )
	Dvar.qosMaxAllowedPing:set( f25_arg1 )
end

Lobby.Matchmaking.MinGeoMatch = function ( f26_arg0 )
	Dvar.searchSessionGeoMin:set( f26_arg0 )
end

Lobby.Matchmaking.GetConnection = function ( f27_arg0 )
	return 0
end

Lobby.Matchmaking.NextStage = function ()
	local f28_local0 = Lobby.Matchmaking.SearchParams.stage
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_MULTIPLAYER then
		f28_local0 = f28_local0 + 1
	elseif f28_local0 == 0 then
		f28_local0 = Lobby.Matchmaking.SearchStage.LISTEN
	else
		f28_local0 = f28_local0 + 1
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "NextStage: " .. Lobby.Matchmaking.SearchParams.stage .. "-->" .. f28_local0 .. "\n" )
	Lobby.Matchmaking.SearchParams.stage = f28_local0
	return f28_local0
end

Lobby.Matchmaking.GetNumSlotsNeededOnTeam = function ( f29_arg0 )
	local f29_local0 = 1
	if f29_arg0 ~= Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		f29_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if f29_local0 < 1 then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "numSlotsNeededOnTeam was 0, why?\n" )
			f29_local0 = 1
		end
	end
	return f29_local0
end

Lobby.Matchmaking.SetupMatchmakingQuery = function ( f30_arg0, f30_arg1 )
	if nil == f30_arg1 then
		error( "Lobby.Matchmaking.SetupMatchmakingQuery called with nil mode" )
	end
	Lobby.Matchmaking.SearchParams.mode = f30_arg1
	Lobby.Matchmaking.SearchParams.stage = 0
end

Lobby.Matchmaking.SetupMatchmakingStage = function ( f31_arg0 )
	local f31_local0 = Engine.CurrentSessionMode()
	if f31_local0 == Enum.eModes.MODE_CAMPAIGN then
		return Lobby.MatchmakingCP.SetupMatchmakingStage( f31_arg0 )
	elseif f31_local0 == Enum.eModes.MODE_MULTIPLAYER then
		return Lobby.MatchmakingMP.SetupMatchmakingStage( f31_arg0 )
	elseif f31_local0 == Enum.eModes.MODE_ZOMBIES then
		return Lobby.MatchmakingZM.SetupMatchmakingStage( f31_arg0 )
	else
		return false
	end
end

