require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.MapVote = {}
Lobby.MapVote.VoteState = LobbyData.MAP_VOTE_STATE_HIDDEN
Lobby.MapVote.VoteInfo = nil
Lobby.MapVote.VoteData = nil
Lobby.MapVote.mapsTable = Engine.GetGDTMapsTable()
Lobby.MapVote.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.MapVote.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.MapVote.Clear()
end

Lobby.MapVote.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
end

Lobby.MapVote.OnClientRemoved = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.MapVote.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.MapVote.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.MapVote.Clear()
end

Lobby.MapVote.Init = function ()
	Lobby.MapVote.Clear()
end

local GetMapValue = function ( mapName, key )
	if not Lobby.MapVote.mapsTable[mapName] then
		return nil
	else
		return Lobby.MapVote.mapsTable[mapName][key]
	end
end

Lobby.MapVote.SetMapVoteStatus = function ( status )
	Lobby.MapVote.VoteState = status
	local mapVoteModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	if mapVoteModel == nil then
		mapVoteModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote", true )
	end
	local currentState = Engine.GetModelValue( mapVoteModel )
	if currentState == status then
		return false
	else
		Engine.SetModelValue( mapVoteModel, status )
		return true
	end
end

local SetGameModeName = function ( model, modelPath, gameType )
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		Engine.SetModelValue( Engine.CreateModel( model, modelPath ), "" )
	else
		Engine.SetModelValue( Engine.CreateModel( model, modelPath ), Engine.Localize( gameType ) )
	end
end

local UpdateMapVoteInfo = function ()
	local nextMap, previousMap, randomMap, nextGametype, previousGametype, randomGametype = nil
	if Lobby.MapVote.VoteState == LobbyData.MAP_VOTE_STATE_LOCKEDIN then
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
		Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteMapNext" ), nextMap )
		SetGameModeName( mapVote, "mapVoteGameModeNext", nextGametype )
	end
	if previousMap ~= nil then
		Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteMapPrevious" ), previousMap )
		SetGameModeName( mapVote, "mapVoteGameModePrevious", previousGametype )
	end
	return true
end

Lobby.MapVote.GameLobbyClientDataUpdate = function ( data )
	if Engine.IsInGame() == true then
		return 
	end
	local next = 0
	local prev = 0
	local rand = 0
	Lobby.MapVote.VoteData = data
	for key, value in pairs( data ) do
		if value.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT then
			next = next + 1
		end
		if value.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
			prev = prev + 1
		end
		if value.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
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
	if UpdateMapVoteInfo() == false then
		return 
	else
		Lobby.MapVote.SetMapVoteStatus( LobbyData.MAP_VOTE_STATE_VOTING )
	end
end

Lobby.MapVote.UpdateMapInfo = function ()
	if UpdateMapVoteInfo() == false then
		return 
	else
		
	end
end

Lobby.MapVote.ShowLockedIn = function ()
	local uiScreenId = Engine.GetLobbyUIScreen()
	local uiScreen = LobbyData:UITargetFromId( uiScreenId )
	if uiScreen.lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		if LobbyData.TIMER_TYPE_THEATER == Lobby.Timer.GetTimerType() then
			
		elseif Lobby.MapVote.VoteData == nil then
			return 
		end
	end
	Lobby.MapVote.SetMapVoteStatus( LobbyData.MAP_VOTE_STATE_LOCKEDIN )
	UpdateMapVoteInfo()
end

Lobby.MapVote.LockedInVote = function ()
	if Lobby.MapVote.VoteState == LobbyData.MAP_VOTE_STATE_LOCKEDIN then
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
		if client.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
			prev = prev + 1
		end
		if client.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
			rand = rand + 1
		end
	end
	if next < prev then
		chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS
		Engine.GameLobbyChoosePreviousPlaylist()
	end
	if prev < rand then
		chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM
		Engine.GameLobbyChooseRandomPlaylist()
		local lobbyGameData = Engine.LobbyGetGameData()
		local map = lobbyGameData.mapname
		local gameType = lobbyGameData.gametype
		randomImage = GetMapValue( map, "previewImage" )
		randomMapName = GetMapValue( map, "mapNameCaps" )
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
	Lobby.MapVote.SetMapVoteStatus( LobbyData.MAP_VOTE_STATE_HIDDEN )
	local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteGameModeRandom" ), "MENU_MODE_CLASSIFIED_CAPS" )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountRandom" ), 0 )
	Engine.ClearMapVoteData()
end

Lobby.MapVote.Pump = function ()
	
end

