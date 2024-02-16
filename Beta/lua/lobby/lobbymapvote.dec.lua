require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.MapVote = {}
Lobby.MapVote.VoteState = LuaEnums.MAP_VOTE_STATE.HIDDEN
Lobby.MapVote.VoteInfo = nil
Lobby.MapVote.VoteData = nil
Lobby.MapVote.mapsTable = Engine.GetGDTMapsTable()
Lobby.MapVote.GetMapValue = function ( mapName, key )
	if not Lobby.MapVote.mapsTable[mapName] then
		return nil
	else
		return Lobby.MapVote.mapsTable[mapName][key]
	end
end

Lobby.MapVote.SetGameModeName = function ( model, modelPath, gameType )
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		Engine.SetModelValue( Engine.CreateModel( model, modelPath ), "" )
	else
		Engine.SetModelValue( Engine.CreateModel( model, modelPath ), Engine.Localize( gameType ) )
	end
end

Lobby.MapVote.UpdateMapVoteInfo = function ()
	local nextMap, previousMap, randomMap, nextGametype, previousGametype, randomGametype = nil
	if Lobby.MapVote.VoteState == LuaEnums.MAP_VOTE_STATE.LOCKEDIN then
		local lobbyGameData = Engine.LobbyGetGameData()
		local map = lobbyGameData.mapname
		local gametype = lobbyGameData.gametype
		local displayGameType = Engine.StructTableLookupString( "game_types", "name", gametype, "name_ref_caps" )
		nextMap = map
		nextGametype = displayGameType
		previousMap = map
		previousGametype = displayGameType
	else
		local mapVoteInfo = Engine.GameLobbyGetMapVote()
		if mapVoteInfo == nil then
			return false
		end
		nextMap = mapVoteInfo[1].nextMapName
		previousMap = mapVoteInfo[1].previousMapName
		nextGametype = Engine.StructTableLookupString( "game_types", "name", mapVoteInfo[1].nextGametype, "name_ref_caps" )
		previousGametype = Engine.StructTableLookupString( "game_types", "name", mapVoteInfo[1].previousGametype, "name_ref_caps" )
	end
	local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" )
	if nextMap ~= nil then
		if string.sub( nextMap, 1, 6 ) == "cp_sh_" then
			local queueudLevel = Dvar.cp_queued_level:get()
			if queuedLevel and queuedLevel ~= "" then
				nextMap = queuedLevel
			end
		end
		Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteMapNext" ), nextMap )
		Lobby.MapVote.SetGameModeName( mapVote, "mapVoteGameModeNext", nextGametype )
	end
	if previousMap ~= nil then
		Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteMapPrevious" ), previousMap )
		Lobby.MapVote.SetGameModeName( mapVote, "mapVoteGameModePrevious", previousGametype )
	end
	return true
end

Lobby.MapVote.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.MapVote.Clear()
	end
end

Lobby.MapVote.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.MapVote.Init = function ()
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote", true )
	local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
	Engine.CreateModel( mapVote, "mapVoteMapNext", true )
	Engine.CreateModel( mapVote, "mapVoteMapPrevious", true )
	Engine.CreateModel( mapVote, "mapVoteGameModeNext", true )
	Engine.CreateModel( mapVote, "mapVoteGameModePrevious", true )
	Engine.CreateModel( mapVote, "mapVoteCountNext", true )
	Engine.CreateModel( mapVote, "mapVoteCountPrevious", true )
	Engine.CreateModel( mapVote, "mapVoteCountRandom", true )
	Engine.CreateModel( mapVote, "mapVoteGameModeRandom", true )
	Engine.CreateModel( mapVote, "mapVoteCountRandom", true )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteMapNext" ), "" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteMapPrevious" ), "" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteGameModeNext" ), "" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteGameModePrevious" ), "" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountNext" ), 0 )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountPrevious" ), 0 )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountRandom" ), 0 )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteGameModeRandom" ), "MENU_MODE_CLASSIFIED_CAPS" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountRandom" ), 0 )
	Lobby.MapVote.Clear()
end

Lobby.MapVote.SetMapVoteStatus = function ( status )
	Lobby.MapVote.VoteState = status
	local mapVoteModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	local currentState = Engine.GetModelValue( mapVoteModel )
	if currentState == status then
		return false
	else
		Engine.SetModelValue( mapVoteModel, status )
		return true
	end
end

Lobby.MapVote.GameLobbyClientDataUpdate = function ( data )
	if Engine.IsInGame() == true then
		return 
	end
	local next = 0
	local prev = 0
	local rand = 0
	local clientList = data
	if data.clients ~= nil then
		clientList = data.clients
	end
	Lobby.MapVote.VoteData = clientList
	for key, value in pairs( clientList ) do
		if value.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT then
			next = next + 1
		end
		if REG9.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
			prev = prev + 1
		end
		if REG9.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
			rand = rand + 1
		end
	end
	local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountNext" ), next )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountPrevious" ), prev )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountRandom" ), rand )
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
	local uiScreenId = Engine.GetLobbyUIScreen()
	local uiScreen = LobbyData:UITargetFromId( uiScreenId )
	if uiScreen.lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
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
	local chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT
	local randomImage, randomMapName, randomGametype = nil
	local next = 0
	local prev = 0
	local rand = 0
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for index, client in ipairs( gamelobby.sessionClients ) do
		if client.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT then
			next = next + 1
		end
		if REG12.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
			prev = prev + 1
		end
		if REG12.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
			rand = rand + 1
		end
	end
	local highestVotes = next
	if highestVotes < prev then
		highestVotes = prev
		chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS
		Engine.GameLobbyChoosePreviousPlaylist()
	end
	if highestVotes < rand then
		highestVotes = rand
		chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM
		Engine.GameLobbyChooseRandomPlaylist()
		local lobbyGameData = Engine.LobbyGetGameData()
		local map = lobbyGameData.mapname
		local gameType = lobbyGameData.gametype
		randomImage = Lobby.MapVote.GetMapValue( map, "previewImage" )
		randomMapName = Lobby.MapVote.GetMapValue( map, "mapNameCaps" )
		randomGametype = Engine.StructTableLookupString( "game_types", "name", gameType, "name_ref_caps" )
	end
	local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountNext" ), next )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountPrevious" ), prev )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountRandom" ), rand )
end

Lobby.MapVote.GameLobbyGameServerDataUpdate = function ( data )
	if Engine.IsInGame() == true then
		return 
	else
		Lobby.MapVote.UpdateMapInfo()
	end
end

Lobby.MapVote.Clear = function ()
	Lobby.MapVote.VoteData = nil
	Lobby.MapVote.SetMapVoteStatus( LuaEnums.MAP_VOTE_STATE.HIDDEN )
	local mapVote = Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
	Engine.ClearMapVoteData()
end

Lobby.MapVote.Pump = function ()
	
end

