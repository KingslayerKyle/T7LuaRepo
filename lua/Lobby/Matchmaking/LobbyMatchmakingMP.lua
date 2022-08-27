-- ee89aa9b6ff4851e104c23b38f17993a
-- This hash is used for caching, delete to decompile the file again

require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingMP = {}
Lobby.MatchmakingMP.DoListenSearch = function ( f1_arg0, f1_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Setting up Listen Search Parameters\n" )
	if Engine.DvarBool( nil, "lobbySearchAllowForceListen" ) and Lobby.Matchmaking.ShouldForceListen() then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Forcing listen search\n" )
		Lobby.Matchmaking.SetServerType( Lobby.Matchmaking.GetServerType() )
		Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_BY_SERVER_TYPE )
	elseif Engine.DvarBool( nil, "lobbySearchOnlyListen" ) then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Doing listen server only query\n" )
		Lobby.Matchmaking.SetServerType( Lobby.Matchmaking.GetServerType() )
		Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_BY_SERVER_TYPE )
	else
		Lobby.Matchmaking.SetQueryId( Enum.QueryID.QUERYID_SEARCH_SESSIONS_ALL )
	end
	Lobby.Matchmaking.SetPlaylistInfo( f1_arg1 )
end

Lobby.MatchmakingMP.DoDedicatedSearch = function ( f2_arg0, f2_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Setting up Dedicated Search Parameters\n" )
	if Lobby.Matchmaking.SearchMode.LOBBY_MERGE == Lobby.Matchmaking.SearchParams.mode and f2_arg0 > Lobby.Matchmaking.SearchStage.DEDICATED_ON_PLAYLIST_1 then
		Lobby.MatchmakingMP.DoListenSearch( f2_arg0, f2_arg1 )
	else
		local f2_local0 = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED
		if not Lobby.Matchmaking.SetServerLocation( f2_local0, f2_arg0 ) then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Couldn't get dediqos results, doing an OPS2 search instead" )
			Lobby.MatchmakingMP.DoListenSearch( f2_arg0, f2_arg1 )
		else
			Lobby.Matchmaking.SetPingBandWeight( 1 )
			Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
			Lobby.Matchmaking.SetQueryId( f2_local0 )
		end
	end
	Lobby.Matchmaking.SetPlaylistInfo( f2_arg1 )
end

Lobby.MatchmakingMP.UnparkDedicated = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Enum.QueryID.QUERYID_SEARCH_SESSION_DEDICATED_PARKED
	if not Lobby.Matchmaking.SetServerLocation( f3_local0, f3_arg0 ) then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBY, "Couldn't get dediqos results, doing an OPS2 search instead" )
		Lobby.MatchmakingMP.DoListenSearch( f3_arg0, f3_arg1 )
	else
		local f3_local1 = Engine.GetParkingPlaylistForRealPlaylist( f3_arg1 )
		if f3_local1 ~= nil and f3_local1 ~= Lobby.Matchmaking.INVALID_PARKING_PLAYLIST then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyMatchmaking.Lobby.Matchmaking.SetPlaylistInfo(): No sessions found in playlistID<" .. f3_arg1 .. ">, looking in parkingPlaylist<" .. f3_local1 .. ">\n" )
			Lobby.Matchmaking.SetMapPacksOriginal()
			f3_arg1 = f3_local1
		end
		Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_EMPTY )
		Lobby.Matchmaking.SetSkillWeight( 0 )
		Lobby.Matchmaking.SetQueryId( f3_local0 )
		Lobby.Matchmaking.SetPlaylistInfo( f3_arg1 )
	end
end

Lobby.MatchmakingMP.AllowListenSearch = function ( f4_arg0 )
	if Dvar.lobbyDedicatedSearchSkip:exists() and Dvar.lobbyDedicatedSearchSkip:get() == true then
		return true
	elseif Lobby.Matchmaking.SearchParams.searchInfo == nil then
		return true
	end
	local f4_local0 = Lobby.Matchmaking.SearchParams.searchInfo.startTime
	if f4_local0 == nil then
		return true
	end
	local f4_local1 = (Engine.milliseconds() - f4_local0) / 1000
	local f4_local2
	if Engine.DvarInt( nil, "lobbySearchMinDediSearchTime" ) + Engine.DvarInt( nil, "lobbySearchMinDediSearchClientAdd" ) * f4_arg0 >= f4_local1 then
		f4_local2 = Lobby.Matchmaking.ShouldForceListen()
	else
		f4_local2 = true
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Matchmaking: Allow Listen Search Time: " .. tostring( f4_local1 ) .. " seconds. Allow Listen Search: " .. tostring( f4_local2 ) .. " \n" )
	return f4_local2
end

Lobby.MatchmakingMP.AllowUnparkSearch = function ( f5_arg0 )
	if Lobby.MatchmakingMP.AllowListenSearch( f5_arg0 ) then
		return true
	elseif f5_arg0 >= Engine.DvarInt( nil, "lobbySearchForceUnparkLobbySize" ) then
		return true
	else
		return Engine.DvarFloat( "lobbySearchSkipUnparkProbability" ) <= math.random()
	end
end

Lobby.MatchmakingMP.SetupMatchmakingStage = function ( f6_arg0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: Setting up multiplayer matchmaking stage.\n" )
	Lobby.Matchmaking.SetShowInMatchmaking( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE )
	Lobby.Matchmaking.SetNetcodeVersion()
	Lobby.Matchmaking.SetGeoLocation()
	Lobby.Matchmaking.SetIsEmpty( Lobby.Matchmaking.SessionEmpty.IS_NOT_EMPTY )
	Lobby.Matchmaking.SetGeoWeightTiered( 0.2 )
	Lobby.Matchmaking.SetSkillWeight( 0.01 )
	local f6_local0 = Lobby.Matchmaking.NextStage()
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Matchmaking: SETUP MATCHMAKING STAGE: " .. tostring( f6_local0 ) .. "\n" )
	if f6_local0 == Lobby.Matchmaking.SearchStage.DONE then
		return false
	elseif Dvar.lobbyDedicatedSearchSkip:exists() and Dvar.lobbyDedicatedSearchSkip:get() == true and f6_local0 ~= Lobby.Matchmaking.SearchStage.LISTEN and f6_local0 ~= Lobby.Matchmaking.SearchStage.LISTEN_DESPERATE and f6_local0 ~= Lobby.Matchmaking.SearchStage.DONE then
		f6_local0 = Lobby.Matchmaking.SearchStage.LISTEN
	end
	local f6_local1 = Lobby.Matchmaking.GetConnection( f6_arg0 )
	local f6_local2 = Engine.GetPlaylistID()
	Dvar.lobbySearchMapPacks:set( Lobby.Matchmaking.GetMapPackBits( Engine.GetDLCBitsForLobby( Enum.LobbyType.LOBBY_TYPE_GAME ), f6_local2 ) )
	if f6_local0 < Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		if Engine.DvarFloat( "lobbySearchSkipDLCProbability" ) >= math.random() then
			local f6_local3 = Dvar.lobbySearchMapPacks:get()
			if LobbyVM.CheckDLCBit( f6_local3, Enum.ContentFlagBits.CONTENT_ORIGINALMAPS ) then
				Dvar.lobbySearchMapPacks:set( f6_local3 & 16776207 )
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYCLIENT, "Dlcbits was " .. f6_local3 .. " now it's " .. Dvar.lobbySearchMapPacks:get() .. " for matchmaking search.\n" )
			end
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "Diceroll failed, not going to fiddle dlc bits for matchmaking search.\n" )
		end
		Lobby.MatchmakingMP.DoDedicatedSearch( f6_local0, f6_local2 )
	elseif f6_local0 == Lobby.Matchmaking.SearchStage.DEDICATED_PARKED then
		Lobby.MatchmakingMP.UnparkDedicated( f6_local0, f6_local2 )
	end
	Lobby.Matchmaking.SetTeamSize( Lobby.Matchmaking.GetNumSlotsNeededOnTeam( f6_local0 ) )
	local f6_local4 = math.max( Dvar.goodPing:get(), Dvar.lobbySearchDediUnparkPingLimit:get() )
	local f6_local3 = Engine.GetDediQosResultsByType( Lobby.Matchmaking.DatacenterType.ANY )
	if f6_local3.numResults > 0 then
		f6_local4 = math.max( f6_local4, f6_local3.pingResults[1].ping )
	end
	Lobby.Matchmaking.PingRange( 1, Lobby.Matchmaking.GetPingLimit() )
	Lobby.Matchmaking.MinGeoMatch( 2 )
	return true
end

