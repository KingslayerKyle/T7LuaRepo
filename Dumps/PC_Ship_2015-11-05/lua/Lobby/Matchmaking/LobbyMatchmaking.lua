require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingCP" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingMP" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingZM" )
require( "lua.Lobby.Matchmaking.LobbyMatchmakingArena" )

Lobby.Matchmaking = {}
Lobby.Matchmaking.FFOTD_PLAYLIST_VERSION_OFFSET = 100000
Lobby.Matchmaking.INVALID_PARKING_PLAYLIST = 0
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
Lobby.Matchmaking.OnClientAdded = function ( f1_arg0 )
	local f1_local0 = f1_arg0.lobbyModule
	local f1_local1 = f1_arg0.lobbyType
	local f1_local2 = f1_arg0.lobbyMode
	local f1_local3 = f1_arg0.xuid
	if f1_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f1_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Matchmaking.UpdateLatencyBand()
		Lobby.Matchmaking.UpdateAdvertising( "client joined" )
	end
end

Lobby.Matchmaking.OnClientRemoved = function ( f2_arg0 )
	local f2_local0 = f2_arg0.lobbyModule
	local f2_local1 = f2_arg0.lobbyType
	local f2_local2 = f2_arg0.lobbyMode
	if f2_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f2_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Matchmaking.UpdateLatencyBand()
		Lobby.Matchmaking.UpdateAdvertising( "client left" )
	end
end

Lobby.Matchmaking.OnMatchEnd = function ( f3_arg0 )
	Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE, true )
	Lobby.Matchmaking.OnlineAdvertiseOnMatchEnd( f3_arg0 )
end

Lobby.Matchmaking.OnLobbyOnlineUpdate = function ( f4_arg0 )
	local f4_local0 = f4_arg0.type
	local f4_local1 = f4_arg0.errorCode
	if f4_local1 ~= nil and f4_local1 == LuaEnums.BD_NOT_CONNECTED then
		return 
	elseif f4_local0 == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_PUMP then
		
	elseif f4_local0 == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_SUCCESS then
		Lobby.Matchmaking.OnlineAdvertiseSuccess( f4_arg0 )
	elseif f4_local0 == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_ERROR then
		Lobby.Matchmaking.OnlineAdvertiseError( f4_arg0 )
	end
end

Lobby.Matchmaking.GetFfotdPlaylistVersionNumber = function ()
	return Engine.GetFFOTDVersion() * Lobby.Matchmaking.FFOTD_PLAYLIST_VERSION_OFFSET + Engine.GetPlaylistVersionNumber()
end

Lobby.Matchmaking.ChangeAdvertisedStatus = function ( f6_arg0, f6_arg1 )
	Dvar.lobbyAdvertiseShowInMatchmaking:set( f6_arg0 )
	if f6_arg1 == true then
		Dvar.lobbyAdvertiseDirty:set( f6_arg1 )
	end
end

Lobby.Matchmaking.GetLobbyAverageSkill = function ()
	local f7_local0 = 0
	local f7_local1 = 0
	local f7_local2 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f7_local6, f7_local7 in ipairs( f7_local2.sessionClients ) do
		f7_local0 = f7_local0 + f7_local7.skillRating
		f7_local1 = f7_local1 + 1
	end
	if f7_local1 == 0 then
		return 0
	else
		return f7_local0 / f7_local1
	end
end

Lobby.Matchmaking.UpdateAdvertising = function ( f8_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "UpdateAdvertising: " .. f8_arg0 .. "\n" )
	local f8_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f8_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbyAdvertiseMaxPlayers:set( f8_local0 )
	Dvar.lobbyAdvertiseNumPlayers:set( f8_local1 )
	if f8_local1 > 0 then
		Dvar.lobbyAdvertiseIsEmpty:set( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	else
		Dvar.lobbyAdvertiseIsEmpty:set( Lobby.Matchmaking.SessionEmpty.IS_EMPTY )
	end
	local f8_local2 = math.max( 0, f8_local0 - f8_local1 )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_MULTIPLAYER then
		local f8_local3 = Engine.GetPlaylistID()
		local f8_local4 = math.floor( f8_local0 / 2 )
		local f8_local5 = Engine.GetPlaylistMaxPartySize( f8_local3 )
		local f8_local6 = f8_local0 - f8_local1
		local f8_local7 = {
			lobbyID = -1,
			lobbySkill = 0,
			skillRating = 0,
			xuid = 0
		}
		local f8_local8 = math.min( math.min( f8_local5, f8_local4 ), f8_local6 )
		f8_local2 = f8_local8
		if CoDShared.IsGametypeTeamBased() then
			local f8_local9 = Engine.IsInGame()
			local f8_local10 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			for f8_local11 = f8_local8, 1, -1 do
				if f8_local9 then
					if Lobby.TeamSelection.CanSplitInProgress( f8_local10.sessionClients, {
						f8_local11
					}, f8_local0 ) then
						f8_local2 = f8_local11
					end
				end
				local f8_local14 = {}
				for f8_local18, f8_local19 in ipairs( f8_local10.sessionClients ) do
					if f8_local9 then
						Lobby.TeamSelection.AddToPrivateLobbyListAsTeam( f8_local19, f8_local18, f8_local14 )
					else
						Lobby.TeamSelection.AddToPrivateLobbyList( f8_local19, f8_local18, f8_local14 )
					end
				end
				for f8_local15 = 1, f8_local11, 1 do
					Lobby.TeamSelection.AddToPrivateLobbyList( f8_local7, f8_local15 + #f8_local10.sessionClients, f8_local14 )
				end
				f8_local15 = Lobby.TeamSelection.VladSplit( f8_local14, f8_local0 )
				if math.max( f8_local15.counts[1], f8_local15.counts[2] ) <= f8_local4 then
					f8_local2 = f8_local11
				end
			end
		else
			f8_local2 = math.min( f8_local5, f8_local0 - Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) )
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "UpdateAdvertising: setting max team size to: " .. f8_local2 .. "\n" )
	Dvar.lobbyAdvertiseTeamSizeMax:set( f8_local2 )
	local f8_local3 = 0
	if LuaUtils.IsArenaMode() then
		f8_local3 = Lobby.MatchmakingArena.GetLobbyArenaSkill()
	else
		f8_local3 = Lobby.Matchmaking.GetLobbyAverageSkill()
	end
	Dvar.lobbyAdvertiseSkill:set( f8_local3 )
	Dvar.lobbyAdvertiseDirty:set( true )
end

Lobby.Matchmaking.UpdateLatencyBand = function ()
	if Engine.IsDedicatedServer() == false then
		return 
	end
	local f9_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f9_local1 = Dvar.lobbyAdvertiseLatencyBand:get()
	local f9_local2 = 255
	for f9_local6, f9_local7 in ipairs( f9_local0.sessionClients ) do
		if f9_local7.pingBand < f9_local2 then
			f9_local2 = f9_local7.pingBand
		end
	end
	if f9_local1 == 0 or f9_local2 < f9_local1 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Latency band: " .. f9_local1 .. " --> " .. f9_local2 .. "\n" )
		Dvar.lobbyAdvertiseLatencyBand:set( f9_local2 )
	end
end

Lobby.Matchmaking.GetServerType = function ()
	if Engine.IsDedicatedServer() == true then
		return Lobby.Matchmaking.ServerType.DEDICATED_SERVER
	else
		local f10_local0 = Engine.CurrentSessionMode()
		if f10_local0 == Enum.eModes.MODE_CAMPAIGN then
			if not Engine.IsCampaignModeZombies() then
				return Lobby.Matchmaking.ServerType.P2P_SERVER_CP
			else
				return Lobby.Matchmaking.ServerType.P2P_SERVER_CPZM
			end
		elseif f10_local0 == Enum.eModes.MODE_MULTIPLAYER then
			return Lobby.Matchmaking.ServerType.P2P_SERVER_MP
		elseif f10_local0 == Enum.eModes.MODE_ZOMBIES then
			return Lobby.Matchmaking.ServerType.P2P_SERVER_ZM
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "No SessionMode was set. Defaulting to Lobby.Matchmaking.ServerType.P2P_SERVER_MP.\n" )
			return Lobby.Matchmaking.ServerType.P2P_SERVER_MP
		end
	end
end

Lobby.Matchmaking.SetupAdvertising = function ()
	local f11_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f11_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbyAdvertiseServerType:set( Lobby.Matchmaking.GetServerType() )
	Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE, false )
	Dvar.lobbyAdvertiseNetcodeVersion:set( Engine.GetProtocolVersion() )
	local f11_local2 = Engine.GetPlaylistID()
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_MULTIPLAYER then
		Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.GetMapPackBits( Engine.GetDLCBits(), f11_local2 ) )
	else
		Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ALL )
	end
	if Engine.IsDedicatedServer() == true then
		Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
		Dvar.lobbyAdvertiseServerLocation:set( Dvar.live_serverLocation:get() )
		Dvar.lobbyAdvertiseLatencyBand:set( 0 )
	end
	Dvar.lobbyAdvertisePlaylistVersion:set( Lobby.Matchmaking.GetFfotdPlaylistVersionNumber() )
	Dvar.lobbyAdvertisePlaylistNumber:set( Engine.EncodePlaylistNumber( f11_local2 ) )
	Lobby.Matchmaking.UpdateAdvertising( "session creation" )
	local f11_local3 = Engine.GetGeoLocation()
	if f11_local3 == nil then
		Dvar.lobbyAdvertiseGeo1:set( 0 )
		Dvar.lobbyAdvertiseGeo2:set( 0 )
		Dvar.lobbyAdvertiseGeo3:set( 0 )
		Dvar.lobbyAdvertiseGeo4:set( 0 )
	else
		Dvar.lobbyAdvertiseGeo1:set( f11_local3.geo_1 )
		Dvar.lobbyAdvertiseGeo2:set( f11_local3.geo_2 )
		Dvar.lobbyAdvertiseGeo3:set( f11_local3.geo_3 )
		Dvar.lobbyAdvertiseGeo4:set( f11_local3.geo_4 )
	end
end

Lobby.Matchmaking.SetQueryId = function ( f12_arg0 )
	Dvar.lobbySearchQueryId:set( f12_arg0 )
end

Lobby.Matchmaking.SetShowInMatchmaking = function ( f13_arg0 )
	Dvar.lobbySearchShowInMatchmaking:set( f13_arg0 )
end

Lobby.Matchmaking.SetNetcodeVersion = function ()
	Dvar.lobbySearchNetcodeVersion:set( Engine.GetProtocolVersion() )
end

Lobby.Matchmaking.SetMapPacksOriginal = function ()
	Dvar.lobbySearchMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
end

Lobby.Matchmaking.SetMapPacksAll = function ()
	Dvar.lobbySearchMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ALL )
end

Lobby.Matchmaking.GetMapPackBits = function ( f17_arg0, f17_arg1 )
	local f17_local0 = Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS
	local f17_local1 = Engine.GetPlaylistInfoByID( f17_arg1 )
	if f17_local1 then
		playlistBits = f17_local1.playlist.requiredDLCMask
		if playlistBits == 0 then
			playlistBits = Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS
		end
		f17_local0 = playlistBits & f17_arg0
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.GetMapPackBits: Setting dlc bits to " .. f17_local0 .. " from client dlcBits " .. f17_arg0 .. " and playlist dlcBits " .. f17_local1.playlist.requiredDLCMask .. "\n" )
	else
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.GetMapPackBits: Invalid playlistID " .. f17_arg1 .. ", setting dlc bits to originalmaps!\n" )
	end
	return f17_local0
end

Lobby.Matchmaking.SetTeamSize = function ( f18_arg0 )
	Dvar.lobbySearchTeamSize:set( f18_arg0 )
end

Lobby.Matchmaking.SetPlaylistInfo = function ( f19_arg0 )
	Dvar.lobbySearchPlaylistVersion:set( Lobby.Matchmaking.GetFfotdPlaylistVersionNumber() )
	Dvar.lobbySearchPlaylistNumber:set( Engine.EncodePlaylistNumber( f19_arg0 ) )
end

Lobby.Matchmaking.SetServerType = function ( f20_arg0 )
	Dvar.lobbySearchServerType:set( f20_arg0 )
end

Lobby.Matchmaking.SetIsEmpty = function ( f21_arg0 )
	Dvar.lobbySearchIsEmpty:set( f21_arg0 )
end

Lobby.Matchmaking.SetSkillWeight = function ( f22_arg0 )
	local f22_local0 = 0
	if LuaUtils.IsArenaMode() then
		f22_local0 = Lobby.MatchmakingArena.GetLobbyArenaSkill()
	else
		f22_local0 = Lobby.Matchmaking.GetLobbyAverageSkill()
	end
	Dvar.lobbySearchSkill:set( f22_local0 )
	Dvar.lobbySearchSkillWeight:set( f22_arg0 )
end

Lobby.Matchmaking.SetGeoLocation = function ()
	local f23_local0 = Engine.GetGeoLocation()
	if f23_local0 == nil then
		Dvar.lobbySearchGeo1:set( 0 )
		Dvar.lobbySearchGeo2:set( 0 )
		Dvar.lobbySearchGeo3:set( 0 )
		Dvar.lobbySearchGeo4:set( 0 )
	else
		Dvar.lobbySearchGeo1:set( f23_local0.geo_1 )
		Dvar.lobbySearchGeo2:set( f23_local0.geo_2 )
		Dvar.lobbySearchGeo3:set( f23_local0.geo_3 )
		Dvar.lobbySearchGeo4:set( f23_local0.geo_4 )
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

Lobby.Matchmaking.SetServerLocation = function ( f25_arg0, f25_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.SetServerLocation(" .. f25_arg0 .. "," .. f25_arg1 .. ")\n" )
	resultsOK = true
	forceServer = Dvar.lobbySearchForceLocation:get()
	if forceServer ~= 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Forcing server to " .. forceServer .. "\n" )
		Dvar.lobbySearchServerLocation:set( forceServer )
		Dvar.lobbySearchPingBand:set( 1 )
		return resultsOK
	end
	local f25_local0 = Engine.GetGeoLocation()
	local f25_local1 = Lobby.Matchmaking.DatacenterType.GAMESERVERS
	if Dvar.lobbySearchDatacenterType:get() ~= Lobby.Matchmaking.DatacenterType.ANY then
		f25_local1 = Dvar.lobbySearchDatacenterType:get()
	end
	if f25_local0 then
		local f25_local2 = Dvar.lobbySearchDatacenterTypeGeo:get()
		for f25_local6, f25_local7 in pairs( Lobby.Matchmaking.DatacenterType ) do
			local f25_local8 = nil
			if f25_local2:find( "c" .. (f25_local0.country_code or "?") .. "=" .. f25_local6 ) then
				f25_local1 = f25_local7
			end
		end
	end
	if Dvar.lobbySearchDatacenterTypeOverride:get() ~= Lobby.Matchmaking.DatacenterType.ANY then
		f25_local1 = Dvar.lobbySearchDatacenterTypeOverride:get()
	end
	local f25_local2 = Engine.GetDediQosResultsByType( f25_local1 )
	if f25_local2.numResults == 0 then
		resultsOK = false
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Tried to get dedicated qos results, but no results available\n" )
	else
		servers = f25_local2.pingResults
		Lobby.Matchmaking.ClearPingBandWeightsAndServerLocations()
		pingCutoff = Dvar.lobbySearchDediUnparkPingLimit:get()
		if f25_arg0 == Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED then
			resultsOK = false
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking to unpark a server in:\n" )
			for f25_local6, f25_local7 in ipairs( servers ) do
				if f25_local6 <= Lobby.Matchmaking.MAX_DATACENTERS_IN_QUERY then
					if f25_local7.ping > pingCutoff then
						
					end
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, f25_local6 .. " " .. f25_local7.location .. " " .. f25_local7.ping .. "ms away\n" )
					Dvar["lobbySearchServerLocation" .. tostring( f25_local6 )].set( f25_local8["lobbySearchServerLocation" .. tostring( f25_local6 )], f25_local7.location )
					Dvar["lobbySearchPingBandWeight" .. tostring( f25_local6 )].set( f25_local8["lobbySearchPingBandWeight" .. tostring( f25_local6 )], 6 - f25_local6 )
					resultsOK = true
				end
			end
		elseif servers[1].ping > pingCutoff then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "There are no acceptable datacenters\n" )
			resultsOK = false
		else
			if f25_arg1 <= f25_local2.numResults then
				local f25_local9 = f25_arg1
			end
			local f25_local4 = f25_local9 or 1
			local f25_local5 = servers[f25_local4]
			Dvar.lobbySearchServerLocation1:set( f25_local5.location )
			Dvar.lobbySearchPingBand:set( f25_local5.location )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Using datacenter " .. f25_local4 .. " for search stage " .. f25_arg1 .. "\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking for an active server in " .. f25_local5.location .. " which is " .. f25_local5.ping .. "ms away\n" )
			resultsOK = true
		end
	end
	return resultsOK
end

Lobby.Matchmaking.SetPingBandWeight = function ( f26_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Ping band weight set to " .. f26_arg0 .. "\n" )
	Dvar.lobbySearchPingBandWeight1:set( f26_arg0 )
end

Lobby.Matchmaking.SetGeoWeightFlat = function ( f27_arg0 )
	Dvar.lobbySearchGeo1Weight:set( f27_arg0 )
	Dvar.lobbySearchGeo2Weight:set( f27_arg0 )
	Dvar.lobbySearchGeo3Weight:set( f27_arg0 )
	Dvar.lobbySearchGeo4Weight:set( f27_arg0 )
end

Lobby.Matchmaking.SetGeoWeightTiered = function ( f28_arg0 )
	Dvar.lobbySearchGeo1Weight:set( f28_arg0 * 4 )
	Dvar.lobbySearchGeo2Weight:set( f28_arg0 * 3 )
	Dvar.lobbySearchGeo3Weight:set( f28_arg0 * 2 )
	Dvar.lobbySearchGeo4Weight:set( f28_arg0 )
end

Lobby.Matchmaking.PingRange = function ( f29_arg0, f29_arg1 )
	Dvar.qosPreferredPing:set( f29_arg0 )
	Dvar.qosMaxAllowedPing:set( f29_arg1 )
end

Lobby.Matchmaking.MinGeoMatch = function ( f30_arg0 )
	Dvar.lobbySearchGeoMin:set( f30_arg0 )
end

Lobby.Matchmaking.GetConnection = function ( f31_arg0 )
	return 0
end

Lobby.Matchmaking.NextStage = function ()
	local f32_local0 = Lobby.Matchmaking.SearchParams.stage
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_MULTIPLAYER then
		f32_local0 = f32_local0 + 1
	elseif f32_local0 == 0 then
		f32_local0 = Lobby.Matchmaking.SearchStage.LISTEN
	else
		f32_local0 = f32_local0 + 1
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "NextStage: " .. Lobby.Matchmaking.SearchParams.stage .. "-->" .. f32_local0 .. "\n" )
	Lobby.Matchmaking.SearchParams.stage = f32_local0
	return f32_local0
end

Lobby.Matchmaking.GetNumSlotsNeededOnTeam = function ( f33_arg0 )
	local f33_local0 = 1
	if f33_arg0 ~= Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		f33_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if f33_local0 < 1 then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "numSlotsNeededOnTeam was 0, why?\n" )
			f33_local0 = 1
		end
	end
	return f33_local0
end

Lobby.Matchmaking.ClearSearchInfo = function ()
	Lobby.Matchmaking.SearchParams.searchInfo = {}
end

Lobby.Matchmaking.SetupMatchmakingQuery = function ( f35_arg0, f35_arg1, f35_arg2 )
	if nil == f35_arg1 then
		error( "Lobby.Matchmaking.SetupMatchmakingQuery called with nil mode" )
	end
	Lobby.Matchmaking.SearchParams.mode = f35_arg1
	Lobby.Matchmaking.SearchParams.stage = 0
	if f35_arg2 == true then
		Lobby.Matchmaking.ClearSearchInfo()
		Lobby.Matchmaking.SearchParams.searchInfo.startTime = Engine.milliseconds()
	end
end

Lobby.Matchmaking.SetupMatchmakingStage = function ( f36_arg0 )
	local f36_local0 = Engine.CurrentSessionMode()
	if f36_local0 == Enum.eModes.MODE_CAMPAIGN then
		return Lobby.MatchmakingCP.SetupMatchmakingStage( f36_arg0 )
	elseif f36_local0 == Enum.eModes.MODE_MULTIPLAYER then
		if LuaUtils.IsArenaMode() then
			return Lobby.MatchmakingArena.SetupMatchmakingStage( f36_arg0 )
		else
			return Lobby.MatchmakingMP.SetupMatchmakingStage( f36_arg0 )
		end
	elseif f36_local0 == Enum.eModes.MODE_ZOMBIES then
		return Lobby.MatchmakingZM.SetupMatchmakingStage( f36_arg0 )
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

Lobby.Matchmaking.OnlineAdvertiseSuccess = function ( f38_arg0 )
	Lobby.Matchmaking.OnlineAdvertiseClear()
end

Lobby.Matchmaking.OnlineAdvertiseError = function ( f39_arg0 )
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
		Engine.ComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
	end
end

Lobby.Matchmaking.OnlineAdvertisePump = function ( f40_arg0 )
	if Engine.IsDedicatedServer() == false then
		return 
	elseif Lobby.Matchmaking.LobbyOnline.errorCount == 0 then
		return 
	elseif Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		Lobby.Matchmaking.OnlineAdvertiseClear()
		return 
	elseif Lobby.Matchmaking.LobbyOnline.errorCount > 0 and Lobby.ProcessQueue.IsQueueEmpty() == true then
		if Engine.milliseconds() > Lobby.Matchmaking.LobbyOnline.reAdvertiseTime then
			Lobby.ProcessQueue.AddToQueue( "ReAdvertiseLobby", Lobby.Process.ReAdvertiseLobby( controller ) )
			Lobby.Matchmaking.LobbyOnline.reAdvertiseTime = Engine.milliseconds() + Lobby.Matchmaking.LobbyOnline.RE_ADVERTISE_INTERVAL
		end
		if Engine.milliseconds() > Lobby.Matchmaking.LobbyOnline.errorTime then
			if Engine.IsInGame() then
				Lobby.Matchmaking.LobbyOnline.comError = true
			else
				Engine.AdvertiseErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
				Lobby.Matchmaking.OnlineAdvertiseClear()
				Engine.ComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
			end
		end
	end
end

Lobby.Matchmaking.OnlineAdvertiseOnMatchEnd = function ( f41_arg0 )
	if Lobby.Matchmaking.LobbyOnline.errorCount > 0 and Lobby.Matchmaking.LobbyOnline.comError == true then
		Lobby.Matchmaking.OnlineAdvertiseClear()
		Engine.ComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
	end
end

Lobby.Matchmaking.Pump = function ( f42_arg0 )
	Lobby.Matchmaking.OnlineAdvertisePump( f42_arg0 )
end

