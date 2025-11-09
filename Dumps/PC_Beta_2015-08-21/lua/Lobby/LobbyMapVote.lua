require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.MapVote = {}
Lobby.MapVote.VoteState = LuaEnums.MAP_VOTE_STATE.HIDDEN
Lobby.MapVote.VoteInfo = nil
Lobby.MapVote.VoteData = nil
Lobby.MapVote.mapsTable = Engine.GetGDTMapsTable()
Lobby.MapVote.GetMapValue = function ( f1_arg0, f1_arg1 )
	if not Lobby.MapVote.mapsTable[f1_arg0] then
		return nil
	else
		return Lobby.MapVote.mapsTable[f1_arg0][f1_arg1]
	end
end

Lobby.MapVote.SetGameModeName = function ( f2_arg0, f2_arg1, f2_arg2 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		Engine.SetModelValue( Engine.CreateModel( f2_arg0, f2_arg1 ), "" )
	else
		Engine.SetModelValue( Engine.CreateModel( f2_arg0, f2_arg1 ), Engine.Localize( f2_arg2 ) )
	end
end

Lobby.MapVote.UpdateMapVoteInfo = function ()
	local f3_local0, f3_local1, f3_local2, f3_local3, f3_local4, f3_local5 = nil
	if Lobby.MapVote.VoteState == LuaEnums.MAP_VOTE_STATE.LOCKEDIN then
		local f3_local6 = Engine.LobbyGetGameData()
		local f3_local7 = f3_local6.mapname
		local f3_local8 = Engine.StructTableLookupString( "game_types", "name", f3_local6.gametype, "name_ref_caps" )
		f3_local0 = f3_local7
		f3_local3 = f3_local8
		f3_local1 = f3_local7
		f3_local4 = f3_local8
	else
		local f3_local6 = Engine.GameLobbyGetMapVote()
		if f3_local6 == nil then
			return false
		end
		f3_local0 = f3_local6[1].nextMapName
		f3_local1 = f3_local6[1].previousMapName
		f3_local3 = Engine.StructTableLookupString( "game_types", "name", f3_local6[1].nextGametype, "name_ref_caps" )
		f3_local4 = Engine.StructTableLookupString( "game_types", "name", f3_local6[1].previousGametype, "name_ref_caps" )
	end
	local f3_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" )
	if f3_local0 ~= nil then
		if string.sub( f3_local0, 1, 6 ) == "cp_sh_" then
			local f3_local7 = Dvar.cp_queued_level:get()
			if queuedLevel and queuedLevel ~= "" then
				f3_local0 = queuedLevel
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f3_local6, "mapVoteMapNext" ), f3_local0 )
		Lobby.MapVote.SetGameModeName( f3_local6, "mapVoteGameModeNext", f3_local3 )
	end
	if f3_local1 ~= nil then
		Engine.SetModelValue( Engine.CreateModel( f3_local6, "mapVoteMapPrevious" ), f3_local1 )
		Lobby.MapVote.SetGameModeName( f3_local6, "mapVoteGameModePrevious", f3_local4 )
	end
	return true
end

Lobby.MapVote.OnSessionStart = function ( f4_arg0 )
	local f4_local0 = f4_arg0.lobbyModule
	local f4_local1 = f4_arg0.lobbyType
	local f4_local2 = f4_arg0.lobbyMode
	if f4_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.MapVote.Clear()
	end
end

Lobby.MapVote.OnMatchEnd = function ( f5_arg0 )
	local f5_local0 = f5_arg0.lobbyModule
	local f5_local1 = f5_arg0.lobbyType
	local f5_local2 = f5_arg0.lobbyMode
end

Lobby.MapVote.Init = function ()
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote", true )
	local f6_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
	Engine.CreateModel( f6_local0, "mapVoteMapNext", true )
	Engine.CreateModel( f6_local0, "mapVoteMapPrevious", true )
	Engine.CreateModel( f6_local0, "mapVoteGameModeNext", true )
	Engine.CreateModel( f6_local0, "mapVoteGameModePrevious", true )
	Engine.CreateModel( f6_local0, "mapVoteCountNext", true )
	Engine.CreateModel( f6_local0, "mapVoteCountPrevious", true )
	Engine.CreateModel( f6_local0, "mapVoteCountRandom", true )
	Engine.CreateModel( f6_local0, "mapVoteGameModeRandom", true )
	Engine.CreateModel( f6_local0, "mapVoteCountRandom", true )
	Engine.SetModelValue( Engine.GetModel( f6_local0, "mapVoteMapNext" ), "" )
	Engine.SetModelValue( Engine.GetModel( f6_local0, "mapVoteMapPrevious" ), "" )
	Engine.SetModelValue( Engine.GetModel( f6_local0, "mapVoteGameModeNext" ), "" )
	Engine.SetModelValue( Engine.GetModel( f6_local0, "mapVoteGameModePrevious" ), "" )
	Engine.SetModelValue( Engine.GetModel( f6_local0, "mapVoteCountNext" ), 0 )
	Engine.SetModelValue( Engine.GetModel( f6_local0, "mapVoteCountPrevious" ), 0 )
	Engine.SetModelValue( Engine.GetModel( f6_local0, "mapVoteCountRandom" ), 0 )
	Engine.SetModelValue( Engine.GetModel( f6_local0, "mapVoteGameModeRandom" ), "MENU_MODE_CLASSIFIED_CAPS" )
	Engine.SetModelValue( Engine.GetModel( f6_local0, "mapVoteCountRandom" ), 0 )
	Lobby.MapVote.Clear()
end

Lobby.MapVote.SetMapVoteStatus = function ( f7_arg0 )
	Lobby.MapVote.VoteState = f7_arg0
	local f7_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	if Engine.GetModelValue( f7_local0 ) == f7_arg0 then
		return false
	else
		Engine.SetModelValue( f7_local0, f7_arg0 )
		return true
	end
end

Lobby.MapVote.GameLobbyClientDataUpdate = function ( f8_arg0 )
	if Engine.IsInGame() == true then
		return 
	end
	local f8_local0 = 0
	local f8_local1 = 0
	local f8_local2 = 0
	local f8_local3 = f8_arg0
	if f8_arg0.clients ~= nil then
		f8_local3 = f8_arg0.clients
	end
	Lobby.MapVote.VoteData = f8_local3
	for f8_local7, f8_local8 in pairs( f8_local3 ) do
		if f8_local8.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT then
			f8_local0 = f8_local0 + 1
		end
		if f8_local8.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
			f8_local1 = f8_local1 + 1
		end
		if f8_local8.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
			f8_local2 = f8_local2 + 1
		end
	end
	f8_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" )
	Engine.SetModelValue( Engine.CreateModel( f8_local4, "mapVoteCountNext" ), f8_local0 )
	Engine.SetModelValue( Engine.CreateModel( f8_local4, "mapVoteCountPrevious" ), f8_local1 )
	Engine.SetModelValue( Engine.CreateModel( f8_local4, "mapVoteCountRandom" ), f8_local2 )
end

Lobby.MapVote.Hide = function ()
	Lobby.MapVote.Clear()
end

Lobby.MapVote.ShowVote = function ()
	if Lobby.MapVote.UpdateMapVoteInfo() == false then
		return 
	else
		Lobby.MapVote.SetMapVoteStatus( LuaEnums.MAP_VOTE_STATE.VOTING )
	end
end

Lobby.MapVote.UpdateMapInfo = function ()
	if Lobby.MapVote.UpdateMapVoteInfo() == false then
		return 
	else
		
	end
end

Lobby.MapVote.ShowLockedIn = function ()
	local f12_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if f12_local0.lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		if Lobby.Timer.GetTimerType() == LuaEnums.TIMER_TYPE.THEATER then
			
		elseif Lobby.MapVote.VoteData == nil then
			return 
		end
	end
	Lobby.MapVote.SetMapVoteStatus( LuaEnums.MAP_VOTE_STATE.LOCKEDIN )
	Lobby.MapVote.UpdateMapVoteInfo()
end

Lobby.MapVote.LockedInVote = function ()
	if Lobby.MapVote.VoteState == LuaEnums.MAP_VOTE_STATE.LOCKEDIN then
		return 
	end
	local f13_local0 = Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT
	local f13_local1, f13_local2, f13_local3 = nil
	local f13_local4 = 0
	local f13_local5 = 0
	local f13_local6 = 0
	local f13_local7 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f13_local11, f13_local12 in ipairs( f13_local7.sessionClients ) do
		if f13_local12.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT then
			f13_local4 = f13_local4 + 1
		end
		if f13_local12.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
			f13_local5 = f13_local5 + 1
		end
		if f13_local12.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
			f13_local6 = f13_local6 + 1
		end
	end
	f13_local8 = f13_local4
	if f13_local8 < f13_local5 then
		f13_local8 = f13_local5
		f13_local0 = Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS
		Engine.GameLobbyChoosePreviousPlaylist()
	end
	if f13_local8 < f13_local6 then
		f13_local8 = f13_local6
		f13_local0 = Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM
		Engine.GameLobbyChooseRandomPlaylist()
		f13_local9 = Engine.LobbyGetGameData()
		f13_local10 = f13_local9.mapname
		f13_local11 = f13_local9.gametype
		f13_local1 = Lobby.MapVote.GetMapValue( f13_local10, "previewImage" )
		f13_local2 = Lobby.MapVote.GetMapValue( f13_local10, "mapNameCaps" )
		f13_local3 = Engine.StructTableLookupString( "game_types", "name", f13_local11, "name_ref_caps" )
	end
	f13_local9 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" )
	Engine.SetModelValue( Engine.CreateModel( f13_local9, "mapVoteCountNext" ), f13_local4 )
	Engine.SetModelValue( Engine.CreateModel( f13_local9, "mapVoteCountPrevious" ), f13_local5 )
	Engine.SetModelValue( Engine.CreateModel( f13_local9, "mapVoteCountRandom" ), f13_local6 )
end

Lobby.MapVote.GameLobbyGameServerDataUpdate = function ( f14_arg0 )
	if Engine.IsInGame() == true then
		return 
	else
		Lobby.MapVote.UpdateMapInfo()
	end
end

Lobby.MapVote.Clear = function ()
	Lobby.MapVote.VoteData = nil
	Lobby.MapVote.SetMapVoteStatus( LuaEnums.MAP_VOTE_STATE.HIDDEN )
	local f15_local0 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
	Engine.ClearMapVoteData()
end

Lobby.MapVote.Pump = function ()
	
end

