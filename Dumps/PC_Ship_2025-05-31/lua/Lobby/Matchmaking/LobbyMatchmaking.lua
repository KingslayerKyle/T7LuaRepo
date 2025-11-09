require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )
require( "lua.Shared.LuaUtils" )
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
Lobby.Matchmaking.CachedPingLimit = nil
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
Lobby.Matchmaking.ExperimentFlags = {
	PerController = {}
}
Lobby.Matchmaking.IsExperimentActive = function ( f1_arg0 )
	local f1_local0 = false
	local f1_local1 = f1_arg0.controller
	if Lobby.Matchmaking.ExperimentFlags.PerController[f1_local1] ~= nil then
		f1_local0 = Lobby.Matchmaking.ExperimentFlags.PerController[f1_local1]
	end
	return f1_local0
end

Lobby.Matchmaking.ResetExperiment = function ( f2_arg0 )
	Lobby.Matchmaking.ExperimentFlags.PerController[f2_arg0] = false
end

Lobby.Matchmaking.EnableExperiment = function ( f3_arg0 )
	Lobby.Matchmaking.ExperimentFlags.PerController[f3_arg0] = true
end

Lobby.Matchmaking.OnClientAdded = function ( f4_arg0 )
	local f4_local0 = f4_arg0.lobbyModule
	local f4_local1 = f4_arg0.lobbyType
	local f4_local2 = f4_arg0.lobbyMode
	local f4_local3 = f4_arg0.xuid
	if f4_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f4_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Matchmaking.UpdateLatencyBand()
		Lobby.Matchmaking.UpdateAdvertising( "client joined" )
	end
end

Lobby.Matchmaking.OnClientRemoved = function ( f5_arg0 )
	local f5_local0 = f5_arg0.lobbyModule
	local f5_local1 = f5_arg0.lobbyType
	local f5_local2 = f5_arg0.lobbyMode
	if f5_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f5_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Matchmaking.UpdateLatencyBand()
		Lobby.Matchmaking.UpdateAdvertising( "client left" )
	end
end

Lobby.Matchmaking.OnMatchStart = function ( f6_arg0 )
	local f6_local0 = f6_arg0.lobbyModule
	local f6_local1 = f6_arg0.lobbyType
	local f6_local2 = f6_arg0.lobbyMode
	if f6_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f6_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and Engine.IsZombiesGame() and Engine.GetLobbyUIScreen() == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_FALSE, true )
	end
	Lobby.MatchmakingPriority.OnMatchStart( f6_arg0 )
end

Lobby.Matchmaking.OnMatchEnd = function ( f7_arg0 )
	if LuaUtils.IsArenaMode() then
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_FALSE, true )
	else
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE, true )
	end
	Lobby.Matchmaking.OnlineAdvertiseOnMatchEnd( f7_arg0 )
end

Lobby.Matchmaking.OnMatchChangeMap = function ( f8_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_CAMPAIGN and Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		local f8_local0 = f8_arg0.nextMap
		if string.sub( f8_local0, 1, 6 ) == "cp_sh_" then
			f8_local0 = Dvar.cp_queued_level:get()
		end
		local f8_local1 = LuaUtils.GetPlaylistIDForSelectedCPMission( f8_local0 )
		if f8_local1 ~= nil and f8_local1 > 0 and f8_local1 ~= Dvar.lobbyAdvertisePlaylistNumber:get() then
			Dvar.lobbyAdvertisePlaylistNumber:set( f8_local1 )
			Dvar.lobbyAdvertiseDirty:set( true )
		end
	end
end

Lobby.Matchmaking.OnLobbyOnlineUpdate = function ( f9_arg0 )
	local f9_local0 = f9_arg0.type
	local f9_local1 = f9_arg0.errorCode
	if f9_local1 ~= nil and f9_local1 == LuaEnums.BD_NOT_CONNECTED then
		return 
	elseif f9_local0 == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_PUMP then
		
	elseif f9_local0 == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_SUCCESS then
		Lobby.Matchmaking.OnlineAdvertiseSuccess( f9_arg0 )
	elseif f9_local0 == Enum.LobbyOnlineUpdateEventType.LOBBY_ONLINE_UPDATE_ERROR then
		Lobby.Matchmaking.OnlineAdvertiseError( f9_arg0 )
	end
end

Lobby.Matchmaking.OnJoinComplete = function ( f10_arg0 )
	Lobby.MatchmakingPriority.AddHost( f10_arg0.join.to.secIdint, f10_arg0.join.joinType )
end

Lobby.Matchmaking.GetFfotdPlaylistVersionNumber = function ()
	return Engine.GetFFOTDVersion() * Lobby.Matchmaking.FFOTD_PLAYLIST_VERSION_OFFSET + Engine.GetPlaylistVersionNumber()
end

Lobby.Matchmaking.ChangeAdvertisedStatus = function ( f12_arg0, f12_arg1 )
	Dvar.lobbyAdvertiseShowInMatchmaking:set( f12_arg0 )
	if f12_arg1 == true then
		Dvar.lobbyAdvertiseDirty:set( f12_arg1 )
	end
end

Lobby.Matchmaking.GetLobbyAverageSkill = function ()
	local f13_local0 = 0
	local f13_local1 = 0
	local f13_local2 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f13_local6, f13_local7 in ipairs( f13_local2.sessionClients ) do
		f13_local0 = f13_local0 + f13_local7.skillRating
		f13_local1 = f13_local1 + 1
	end
	if f13_local1 == 0 then
		return 0
	else
		return f13_local0 / f13_local1
	end
end

Lobby.Matchmaking.UpdateAdvertising = function ( f14_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "UpdateAdvertising: " .. f14_arg0 .. "\n" )
	local f14_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f14_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbyAdvertiseMaxPlayers:set( f14_local0 )
	Dvar.lobbyAdvertiseNumPlayers:set( f14_local1 )
	if f14_local1 > 0 then
		Dvar.lobbyAdvertiseIsEmpty:set( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	else
		Dvar.lobbyAdvertiseIsEmpty:set( Lobby.Matchmaking.SessionEmpty.IS_EMPTY )
	end
	local f14_local2 = math.max( 0, f14_local0 - f14_local1 )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_MULTIPLAYER then
		local f14_local3 = Engine.GetPlaylistID()
		local f14_local4 = math.floor( f14_local0 / 2 )
		local f14_local5 = Engine.GetPlaylistMaxPartySize( f14_local3 )
		local f14_local6 = f14_local0 - f14_local1
		local f14_local7 = {
			lobbyID = -1,
			lobbySkill = 0,
			skillRating = 0,
			arenaPoints = 0,
			xuid = 0
		}
		local f14_local8 = math.min( math.min( f14_local5, f14_local4 ), f14_local6 )
		f14_local2 = f14_local8
		if CoDShared.IsGametypeTeamBased() then
			local f14_local9 = Engine.IsInGame()
			local f14_local10 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			for f14_local11 = f14_local8, 1, -1 do
				if f14_local9 then
					if Lobby.TeamSelection.CanSplitInProgress( f14_local10.sessionClients, {
						f14_local11
					}, f14_local0 ) then
						f14_local2 = f14_local11
					end
				end
				local f14_local14 = {}
				for f14_local18, f14_local19 in ipairs( f14_local10.sessionClients ) do
					if f14_local9 then
						Lobby.TeamSelection.AddToPrivateLobbyListAsTeam( f14_local19, f14_local18, f14_local14 )
					else
						Lobby.TeamSelection.AddToPrivateLobbyList( f14_local19, f14_local18, f14_local14 )
					end
				end
				for f14_local15 = 1, f14_local11, 1 do
					Lobby.TeamSelection.AddToPrivateLobbyList( f14_local7, f14_local15 + #f14_local10.sessionClients, f14_local14 )
				end
				f14_local15 = Lobby.TeamSelection.VladSplit( f14_local14, f14_local0 )
				if math.max( f14_local15.counts[1], f14_local15.counts[2] ) <= f14_local4 then
					f14_local2 = f14_local11
				end
			end
		else
			f14_local2 = math.min( f14_local5, f14_local0 - Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) )
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "UpdateAdvertising: setting max team size to: " .. f14_local2 .. "\n" )
	Dvar.lobbyAdvertiseTeamSizeMax:set( f14_local2 )
	local f14_local3 = 0
	if LuaUtils.IsArenaMode() then
		f14_local3 = Lobby.MatchmakingArena.GetLobbyArenaSkill()
	else
		f14_local3 = Lobby.Matchmaking.GetLobbyAverageSkill()
	end
	Dvar.lobbyAdvertiseSkill:set( f14_local3 )
	Dvar.lobbyAdvertiseDirty:set( true )
end

Lobby.Matchmaking.UpdateLatencyBand = function ()
	if Engine.IsDedicatedServer() == false then
		return 
	end
	local f15_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local1 = Dvar.lobbyAdvertiseLatencyBand:get()
	local f15_local2 = 255
	for f15_local6, f15_local7 in ipairs( f15_local0.sessionClients ) do
		if f15_local7.pingBand < f15_local2 then
			f15_local2 = f15_local7.pingBand
		end
	end
	if f15_local1 == 0 or f15_local2 < f15_local1 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Latency band: " .. f15_local1 .. " --> " .. f15_local2 .. "\n" )
		Dvar.lobbyAdvertiseLatencyBand:set( f15_local2 )
	end
end

Lobby.Matchmaking.GetServerType = function ()
	if Engine.IsDedicatedServer() == true then
		return Lobby.Matchmaking.ServerType.DEDICATED_SERVER
	else
		local f16_local0 = Engine.CurrentSessionMode()
		if f16_local0 == Enum.eModes.MODE_CAMPAIGN then
			if not Engine.IsCampaignModeZombies() then
				if CoDShared.IsGameTypeDOA() then
					return Lobby.Matchmaking.ServerType.P2P_SERVER_CPDOA
				else
					return Lobby.Matchmaking.ServerType.P2P_SERVER_CP
				end
			else
				return Lobby.Matchmaking.ServerType.P2P_SERVER_CPZM
			end
		elseif f16_local0 == Enum.eModes.MODE_MULTIPLAYER then
			return Lobby.Matchmaking.ServerType.P2P_SERVER_MP
		elseif f16_local0 == Enum.eModes.MODE_ZOMBIES then
			return Lobby.Matchmaking.ServerType.P2P_SERVER_ZM
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "No SessionMode was set. Defaulting to Lobby.Matchmaking.ServerType.P2P_SERVER_MP.\n" )
			return Lobby.Matchmaking.ServerType.P2P_SERVER_MP
		end
	end
end

Lobby.Matchmaking.SetupAdvertising = function ()
	local f17_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f17_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	Dvar.lobbyAdvertiseServerType:set( Lobby.Matchmaking.GetServerType() )
	Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE, false )
	Dvar.lobbyAdvertiseNetcodeVersion:set( Engine.GetProtocolVersion() )
	local f17_local2 = Engine.GetPlaylistID()
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_MULTIPLAYER then
		Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.GetMapPackBits( Engine.GetDLCBitsForLobby( Enum.LobbyType.LOBBY_TYPE_GAME ), f17_local2 ) )
	else
		Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ALL )
	end
	if Engine.IsDedicatedServer() == true then
		Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
		Dvar.lobbyAdvertiseServerLocation:set( Dvar.live_serverLocation:get() )
		Dvar.lobbyAdvertiseLatencyBand:set( 0 )
	end
	Dvar.lobbyAdvertisePlaylistVersion:set( Lobby.Matchmaking.GetFfotdPlaylistVersionNumber() )
	Dvar.lobbyAdvertisePlaylistNumber:set( Engine.EncodePlaylistNumber( f17_local2 ) )
	Lobby.Matchmaking.UpdateAdvertising( "session creation" )
	local f17_local3 = Engine.GetGeoLocation()
	if f17_local3 == nil then
		Dvar.lobbyAdvertiseGeo1:set( 0 )
		Dvar.lobbyAdvertiseGeo2:set( 0 )
		Dvar.lobbyAdvertiseGeo3:set( 0 )
		Dvar.lobbyAdvertiseGeo4:set( 0 )
	else
		Dvar.lobbyAdvertiseGeo1:set( f17_local3.geo_1 )
		Dvar.lobbyAdvertiseGeo2:set( f17_local3.geo_2 )
		Dvar.lobbyAdvertiseGeo3:set( f17_local3.geo_3 )
		Dvar.lobbyAdvertiseGeo4:set( f17_local3.geo_4 )
	end
end

Lobby.Matchmaking.SetQueryId = function ( f18_arg0 )
	Dvar.lobbySearchQueryId:set( f18_arg0 )
end

Lobby.Matchmaking.SetShowInMatchmaking = function ( f19_arg0 )
	Dvar.lobbySearchShowInMatchmaking:set( f19_arg0 )
end

Lobby.Matchmaking.SetNetcodeVersion = function ()
	Dvar.lobbySearchNetcodeVersion:set( Engine.GetProtocolVersion() )
end

Lobby.Matchmaking.SetMapPacks = function ( f21_arg0 )
	Dvar.lobbySearchMapPacks:set( f21_arg0 )
end

Lobby.Matchmaking.SetMapPacksOriginal = function ()
	Lobby.Matchmaking.SetMapPacks( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
end

Lobby.Matchmaking.SetMapPacksAll = function ()
	Lobby.Matchmaking.SetMapPacks( Lobby.Matchmaking.ContentPack.CONTENT_ALL )
end

Lobby.Matchmaking.GetMapPackBits = function ( f24_arg0, f24_arg1 )
	local f24_local0 = Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS
	local f24_local1 = Engine.GetPlaylistInfoByID( f24_arg1 )
	if f24_local1 then
		f24_local0 = f24_local1.playlist.usedDLCMask & f24_arg0 | f24_local1.playlist.requiredDLCMask
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.GetMapPackBits: Setting dlc bits to " .. f24_local0 .. " from client dlcBits " .. f24_arg0 .. ", playlist requiredBits " .. f24_local1.playlist.requiredDLCMask .. " and playlist usedBits " .. f24_local1.playlist.usedDLCMask .. "\n" )
	else
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.GetMapPackBits: Invalid playlistID " .. f24_arg1 .. ", setting dlc bits to originalmaps!\n" )
	end
	return f24_local0
end

Lobby.Matchmaking.SetTeamSize = function ( f25_arg0 )
	Dvar.lobbySearchTeamSize:set( f25_arg0 )
end

Lobby.Matchmaking.SetPlaylistInfo = function ( f26_arg0 )
	Dvar.lobbySearchPlaylistVersion:set( Lobby.Matchmaking.GetFfotdPlaylistVersionNumber() )
	Dvar.lobbySearchPlaylistNumber:set( Engine.EncodePlaylistNumber( f26_arg0 ) )
end

Lobby.Matchmaking.SetServerType = function ( f27_arg0 )
	Dvar.lobbySearchServerType:set( f27_arg0 )
end

Lobby.Matchmaking.SetIsEmpty = function ( f28_arg0 )
	Dvar.lobbySearchIsEmpty:set( f28_arg0 )
end

Lobby.Matchmaking.SetSkillWeight = function ( f29_arg0 )
	local f29_local0 = 0
	if LuaUtils.IsArenaMode() then
		f29_local0 = Lobby.MatchmakingArena.GetLobbyArenaSkill()
	else
		f29_local0 = Lobby.Matchmaking.GetLobbyAverageSkill()
	end
	Dvar.lobbySearchSkill:set( f29_local0 )
	Dvar.lobbySearchSkillWeight:set( f29_arg0 )
end

Lobby.Matchmaking.SetGeoLocation = function ()
	local f30_local0 = Engine.GetGeoLocation()
	if f30_local0 == nil then
		Dvar.lobbySearchGeo1:set( 0 )
		Dvar.lobbySearchGeo2:set( 0 )
		Dvar.lobbySearchGeo3:set( 0 )
		Dvar.lobbySearchGeo4:set( 0 )
	else
		Dvar.lobbySearchGeo1:set( f30_local0.geo_1 )
		Dvar.lobbySearchGeo2:set( f30_local0.geo_2 )
		Dvar.lobbySearchGeo3:set( f30_local0.geo_3 )
		Dvar.lobbySearchGeo4:set( f30_local0.geo_4 )
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

Lobby.Matchmaking.GetListenCountryCodes = function ()
	local f32_local0 = Engine.DvarString( nil, "lobbySearchListenCountries" )
	if f32_local0 ~= "" then
		return LuaUtils.StringSplit( f32_local0, "," )
	else
		return {}
	end
end

Lobby.Matchmaking.GetPingLimit = function ()
	if Lobby.Matchmaking.CachedPingLimit ~= nil then
		return Lobby.Matchmaking.CachedPingLimit
	end
	local f33_local0 = Engine.GetGeoLocation()
	local f33_local1 = math.max( Dvar.goodPing:get(), Dvar.lobbySearchDediUnparkPingLimit:get() )
	if f33_local0 then
		local f33_local2 = Engine.DvarString( nil, "lobbySearchPingLimits" )
		if f33_local2 ~= "" then
			for f33_local6, f33_local7 in pairs( LuaUtils.StringSplit( f33_local2, "_" ) ) do
				local f33_local8 = LuaUtils.StringSplitToArray( f33_local6, "|" )
				local f33_local9 = LuaUtils.StringSplit( f33_local8[1], "," )
				if f33_local9[f33_local0.country_code] ~= nil then
					f33_local1 = tonumber( f33_local8[2] )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.GetPingLimitForCountryCode: Returning limit of " .. f33_local1 .. "ms, geo.country_code " .. f33_local0.country_code .. " is in country list " .. f33_local8[1] .. "\n" )
					break
				end
			end
		end
	end
	Lobby.Matchmaking.CachedPingLimit = f33_local1
	return f33_local1
end

Lobby.Matchmaking.ShouldForceListen = function ()
	local f34_local0 = false
	local f34_local1 = Lobby.Matchmaking.GetListenCountryCodes()
	local f34_local2 = Engine.GetGeoLocation()
	if f34_local2 and f34_local1[f34_local2.country_code] ~= nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.ShouldForceListen: Returning true, geo.country_code " .. f34_local2.country_code .. " is in country list " .. Engine.DvarString( nil, "lobbySearchListenCountries" ) .. "\n" )
		f34_local0 = true
	end
	return f34_local0
end

Lobby.Matchmaking.SetServerLocation = function ( f35_arg0, f35_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.SetServerLocation(" .. f35_arg0 .. "," .. f35_arg1 .. ")\n" )
	resultsOK = true
	forceServer = Dvar.lobbySearchForceLocation:get()
	if forceServer ~= 0 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Forcing server to " .. forceServer .. "\n" )
		Dvar.lobbySearchServerLocation1:set( forceServer )
		Dvar.lobbySearchPingBand:set( 1 )
		return resultsOK
	end
	local f35_local0 = Engine.GetGeoLocation()
	local f35_local1 = Lobby.Matchmaking.DatacenterType.GAMESERVERS
	if Dvar.lobbySearchDatacenterType:get() ~= Lobby.Matchmaking.DatacenterType.ANY then
		f35_local1 = Dvar.lobbySearchDatacenterType:get()
	end
	if f35_local0 then
		LuaUtils.LogQoS( "geolocation", f35_local0 )
		local f35_local2 = Dvar.lobbySearchDatacenterTypeGeo:get()
		for f35_local6, f35_local7 in pairs( Lobby.Matchmaking.DatacenterType ) do
			local f35_local8 = nil
			if f35_local2:find( "c" .. (f35_local0.country_code or "?") .. "=" .. f35_local6 ) then
				f35_local1 = f35_local7
			end
		end
		if Lobby.Matchmaking.ShouldForceListen() then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Matchmaking.SetServerLocation(" .. f35_arg0 .. "," .. f35_arg1 .. ") - country code " .. f35_local0.country_code .. " matches list " .. Engine.DvarString( nil, "lobbySearchListenCountries" ) .. " - doing a listen search\n" )
			return false
		end
	end
	if Dvar.lobbySearchDatacenterTypeOverride:get() ~= Lobby.Matchmaking.DatacenterType.ANY then
		f35_local1 = Dvar.lobbySearchDatacenterTypeOverride:get()
	end
	local f35_local2 = Engine.GetDediQosResultsByType( f35_local1 )
	if f35_local2.numResults == 0 then
		LuaUtils.LogQoS( "serverlocation", {
			ok = false,
			text = "No dedicated QOS results",
			searchType = f35_local1
		} )
		resultsOK = false
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Tried to get dedicated qos results, but no results available\n" )
	else
		servers = f35_local2.pingResults
		Lobby.Matchmaking.ClearPingBandWeightsAndServerLocations()
		pingCutoff = Lobby.Matchmaking.GetPingLimit()
		if f35_arg0 == Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED then
			resultsOK = false
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking to unpark a server in:\n" )
			for f35_local6, f35_local7 in ipairs( servers ) do
				if f35_local6 <= Lobby.Matchmaking.MAX_DATACENTERS_IN_QUERY then
					if f35_local7.ping > pingCutoff then
						
					end
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, f35_local6 .. " " .. f35_local7.location .. " " .. f35_local7.ping .. "ms away\n" )
					Dvar["lobbySearchServerLocation" .. tostring( f35_local6 )].set( f35_local8["lobbySearchServerLocation" .. tostring( f35_local6 )], f35_local7.location )
					Dvar["lobbySearchPingBandWeight" .. tostring( f35_local6 )].set( f35_local8["lobbySearchPingBandWeight" .. tostring( f35_local6 )], 6 - f35_local6 )
					resultsOK = true
				end
			end
		else
			local f35_local3 = servers[1].ping
			if f35_local3 > pingCutoff then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "There are no acceptable datacenters\n" )
				resultsOK = false
				LuaUtils.LogQoS( "serverlocation", {
					ok = false,
					text = "No good datacenters",
					searchType = f35_local1,
					bestPing = f35_local3
				} )
			else
				if f35_arg1 <= f35_local2.numResults then
					local f35_local9 = f35_arg1
				end
				local f35_local4 = f35_local9 or 1
				if servers[f35_local4].ping > pingCutoff then
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Ping for location " .. servers[f35_local4].location .. " at " .. servers[f35_local4].ping .. "ms is too far away, selecting another suitable datacenter at random\n" )
					local f35_local5 = 1
					for f35_local10, f35_local11 in ipairs( servers ) do
						if f35_local10 <= Lobby.Matchmaking.MAX_DATACENTERS_IN_QUERY then
							if f35_local11.ping > pingCutoff then
								break
							end
							f35_local5 = f35_local10
						end
					end
					f35_local4 = math.random( f35_local5 )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Using index " .. f35_local4 .. " out of a possible " .. f35_local5 .. " good datacenters\n" )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Using location " .. servers[f35_local4].location .. " that is " .. servers[f35_local4].ping .. "ms away\n" )
				end
				local f35_local5 = servers[f35_local4]
				Dvar.lobbySearchServerLocation1:set( f35_local5.location )
				if Engine.DvarBool( 0, "lobbySearchPingBandEnabled" ) then
					Dvar.lobbySearchPingBand:set( 0 )
					if f35_local5.location == Engine.DvarInt( 0, "lobbySearchExperimentDatacenter" ) or Engine.DvarInt( 0, "lobbySearchExperimentDatacenter" ) == 999 then
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "lobbySearchPingBandEnabled is true and the experiment DC matches (" .. f35_local5.location .. ") - setting the ping band to " .. f35_local5.ping .. "ms\n" )
						Dvar.lobbySearchPingBand:set( f35_local5.ping )
					end
				else
					Dvar.zlobbySearchPingBand:set( f35_local5.ping )
				end
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Using datacenter " .. f35_local4 .. " for search stage " .. f35_arg1 .. "\n" )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Looking for an active server in " .. f35_local5.location .. " which is " .. f35_local5.ping .. "ms away\n" )
				LuaUtils.LogQoS( "serverlocation", {
					ok = true,
					text = "Found datacenter",
					searchType = f35_local1,
					server = f35_local5
				} )
				resultsOK = true
			end
		end
	end
	return resultsOK
end

Lobby.Matchmaking.SetPingBand = function ( f36_arg0 )
	Dvar.lobbySearchPingBand:set( f36_arg0 )
end

Lobby.Matchmaking.SetPingBandWeight = function ( f37_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Ping band weight set to " .. f37_arg0 .. "\n" )
	Dvar.lobbySearchPingBandWeight1:set( f37_arg0 )
end

Lobby.Matchmaking.SetGeoWeightFlat = function ( f38_arg0 )
	Dvar.lobbySearchGeo1Weight:set( f38_arg0 )
	Dvar.lobbySearchGeo2Weight:set( f38_arg0 )
	Dvar.lobbySearchGeo3Weight:set( f38_arg0 )
	Dvar.lobbySearchGeo4Weight:set( f38_arg0 )
end

Lobby.Matchmaking.SetGeoWeightTiered = function ( f39_arg0 )
	Dvar.lobbySearchGeo1Weight:set( f39_arg0 * 4 )
	Dvar.lobbySearchGeo2Weight:set( f39_arg0 * 3 )
	Dvar.lobbySearchGeo3Weight:set( f39_arg0 * 2 )
	Dvar.lobbySearchGeo4Weight:set( f39_arg0 )
end

Lobby.Matchmaking.PingRange = function ( f40_arg0, f40_arg1 )
	Dvar.qosPreferredPing:set( 1 )
	Dvar.qosMaxAllowedPing:set( f40_arg1 )
end

Lobby.Matchmaking.MinGeoMatch = function ( f41_arg0 )
	Dvar.lobbySearchGeoMin:set( f41_arg0 )
end

Lobby.Matchmaking.GetConnection = function ( f42_arg0 )
	return 0
end

Lobby.Matchmaking.NextStage = function ()
	local f43_local0 = Lobby.Matchmaking.SearchParams.stage
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_MULTIPLAYER then
		f43_local0 = f43_local0 + 1
		local f43_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if f43_local0 == Lobby.Matchmaking.SearchStage.DEDICATED_PARKED and not Lobby.MatchmakingMP.AllowUnparkSearch( f43_local1 ) then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Unpark Stage Skipped. Setting stage to DEDICATED_ON_PLAYLIST_1\n" )
			f43_local0 = Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1
			Lobby.Matchmaking.SearchParams.retry = Lobby.Matchmaking.SearchParams.retry + 1
		end
		if Lobby.Matchmaking.SearchStage.LISTEN <= f43_local0 and f43_local0 <= Lobby.Matchmaking.SearchStage.LISTEN_DESPERATE and not Lobby.MatchmakingMP.AllowListenSearch( f43_local1 ) then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Listen Host Stage Skipped. Setting stage to DEDICATED_ON_PLAYLIST_1\n" )
			f43_local0 = Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1
			Lobby.Matchmaking.SearchParams.retry = Lobby.Matchmaking.SearchParams.retry + 1
		end
	elseif f43_local0 == 0 then
		f43_local0 = Lobby.Matchmaking.SearchStage.LISTEN
	else
		f43_local0 = f43_local0 + 1
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "NextStage: " .. Lobby.Matchmaking.SearchParams.stage .. "-->" .. f43_local0 .. "\n" )
	Lobby.Matchmaking.SearchParams.stage = f43_local0
	return f43_local0
end

Lobby.Matchmaking.GetNumSlotsNeededOnTeam = function ( f44_arg0 )
	local f44_local0 = 1
	if f44_arg0 ~= Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		f44_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if f44_local0 < 1 then
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "numSlotsNeededOnTeam was 0, why?\n" )
			f44_local0 = 1
		end
	end
	return f44_local0
end

Lobby.Matchmaking.ClearSearchInfo = function ()
	Lobby.Matchmaking.SearchParams.searchInfo = {}
end

Lobby.Matchmaking.SetupMatchmakingQuery = function ( f46_arg0, f46_arg1, f46_arg2 )
	if nil == f46_arg1 then
		error( "Lobby.Matchmaking.SetupMatchmakingQuery called with nil mode" )
	end
	Lobby.Matchmaking.SearchParams.mode = f46_arg1
	Lobby.Matchmaking.SearchParams.stage = 0
	if f46_arg2 == true then
		Lobby.Matchmaking.ClearSearchInfo()
		Lobby.Matchmaking.SearchParams.searchInfo.startTime = Engine.milliseconds()
		Lobby.Matchmaking.SearchParams.retry = 0
	elseif nil == Lobby.Matchmaking.SearchParams.searchInfo or nil == Lobby.Matchmaking.SearchParams.searchInfo.startTime then
		Lobby.Matchmaking.ClearSearchInfo()
		Lobby.Matchmaking.SearchParams.searchInfo.startTime = Engine.milliseconds()
		Lobby.Matchmaking.SearchParams.retry = 0
	end
end

Lobby.Matchmaking.SetupMatchmakingStage = function ( f47_arg0 )
	local f47_local0 = Engine.CurrentSessionMode()
	if f47_local0 == Enum.eModes.MODE_CAMPAIGN then
		return Lobby.MatchmakingCP.SetupMatchmakingStage( f47_arg0 )
	elseif f47_local0 == Enum.eModes.MODE_MULTIPLAYER then
		if Engine.IsDedicatedServer() == true then
			return Lobby.MatchmakingDedicated.SetupMatchmakingStage( f47_arg0 )
		elseif LuaUtils.IsArenaMode() then
			return Lobby.MatchmakingArena.SetupMatchmakingStage( f47_arg0 )
		else
			return Lobby.MatchmakingMP.SetupMatchmakingStage( f47_arg0 )
		end
	elseif f47_local0 == Enum.eModes.MODE_ZOMBIES then
		return Lobby.MatchmakingZM.SetupMatchmakingStage( f47_arg0 )
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

Lobby.Matchmaking.OnlineAdvertiseSuccess = function ( f49_arg0 )
	Lobby.Matchmaking.OnlineAdvertiseClear()
end

Lobby.Matchmaking.OnlineAdvertiseError = function ( f50_arg0 )
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

Lobby.Matchmaking.OnlineAdvertisePump = function ( f51_arg0 )
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
				LuaUtils.SafeComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
				return 
			end
		end
	end
end

Lobby.Matchmaking.OnlineAdvertiseOnMatchEnd = function ( f52_arg0 )
	if Lobby.Matchmaking.LobbyOnline.errorCount > 0 and Lobby.Matchmaking.LobbyOnline.comError == true then
		Lobby.Matchmaking.OnlineAdvertiseClear()
		LuaUtils.SafeComError( Enum.errorCode.ERROR_DROP, "EXE_DISCONNECTED_FROM_SERVER" )
		return 
	else
		
	end
end

Lobby.Matchmaking.Pump = function ( f53_arg0 )
	Lobby.Matchmaking.OnlineAdvertisePump( f53_arg0 )
end

