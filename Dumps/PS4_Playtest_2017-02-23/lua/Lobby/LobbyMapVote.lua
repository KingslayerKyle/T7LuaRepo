require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.MapVote = {}
Lobby.MapVote.VoteState = LuaEnum.MAP_VOTE_STATE.HIDDEN
Lobby.MapVote.VoteInfo = nil
Lobby.MapVote.VoteData = nil
Lobby.MapVote.storedNextPrev = false
Lobby.MapVote.GetMapValue = function ( mapName, key )
	if not LuaUtils.mapsTable[mapName] then
		return nil
	else
		return LuaUtils.mapsTable[mapName][key]
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
	local nextMap, previousMap, randomMap, nextGametype, previousGametype, randomGametype, lastGametypeType = nil
	if Lobby.MapVote.VoteState == LuaEnum.MAP_VOTE_STATE.HIDDEN then
		Lobby.MapVote.storedNextPrev = false
	end
	local curScreen = LobbyData.GetCurrentMenuTarget()
	if curScreen.lobbyType == Enum.LobbyType.LOBBY_TYPE_INVALID then
		return 
	elseif Lobby.MapVote.VoteState == LuaEnum.MAP_VOTE_STATE.LOCKEDIN then
		local lobbyGameData = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_HOST, curScreen.lobbyType )
		local map = lobbyGameData.mapname
		local gametype = lobbyGameData.gametype
		local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
		local displayGameType = gameTypeInfo.nameRefCaps
		nextMap = map
		nextGametype = displayGameType
		previousMap = map
		previousGametype = displayGameType
	else
		local mapVoteInfo = Engine.LobbyGetMapVote( Enum.LobbyModule.LOBBY_MODULE_HOST, curScreen.lobbyType )
		if mapVoteInfo == nil then
			return false
		end
		nextMap = mapVoteInfo.nextMapName
		previousMap = mapVoteInfo.previousMapName
		local nextGameTypeInfo = Engine.GetGameTypeInfo( mapVoteInfo.nextGametype )
		local previousGameTypeInfo = Engine.GetGameTypeInfo( mapVoteInfo.previousGametype )
		nextGametype = nextGameTypeInfo.nameRefCaps
		previousGametype = previousGameTypeInfo.nameRefCaps
		previousGametypeType = previousGametype
		if Lobby.MapVote.storedNextPrev == false then
			Lobby.MapVote.storedNextPrev = true
			Engine.StorePlaylistNextPrev( Enum.LobbyModule.LOBBY_MODULE_HOST, curScreen.lobbyType, mapVoteInfo.playlistNext, mapVoteInfo.playlistPrevious )
		end
	end
	local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
	if nil ~= Dvar.ui_gametype and Dvar.ui_gametype:get() == "doa" then
		nextMap = "cp_doa_bo3"
		Dvar.ui_mapname:set( nextMap )
	end
	if nextMap ~= nil then
		if string.sub( nextMap, 1, 6 ) == "cp_sh_" then
			local queueudLevel = Dvar.cp_queued_level:get()
			if queueudLevel and queueudLevel ~= "" then
				nextMap = queueudLevel
			end
		end
		local lobbyGameData = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_HOST, curScreen.lobbyType )
		if Enum.eModes.MODE_CAMPAIGN == Engine.CurrentSessionMode() and lobbyGameData.gametype == "coop" then
			local f3_local0 = LuaUtils.mapsTable[nextMap]
			if f3_local0 then
				local location = LuaUtils.mapsTable[nextMap].mapLocation
			end
			if f3_local0 and f3_local0 ~= "" then
				nextGametype = f3_local0
			end
		end
		if nextMap == "" then
			nextMap = Dvar.ui_mapname:get()
		end
		if nextGametype == "" or nextGametype == nil then
			local f3_local0 = Engine.GetGameTypeInfo( Dvar.ui_gametype:get() )
			nextGametype = f3_local0.nameRefCaps
		end
		Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteMapNext" ), nextMap )
		Lobby.MapVote.SetGameModeName( mapVote, "mapVoteGameModeNext", nextGametype or "" )
		if Enum.eModes.MODE_ZOMBIES == Engine.CurrentSessionMode() then
			local f3_local0 = Engine.SessionMode_IsOnlineGame()
			if f3_local0 then
				local inPrivateOnlineLobby = Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL )
			end
			local isHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
			if f3_local0 and isHost then
				if Dvar.zm_private_rankedmatch:get() then
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteGameModeNext" ), Engine.Localize( "MENU_RANKED_GAME_CAPS" ) )
				else
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteGameModeNext" ), Engine.Localize( "MENU_NON_RANKED_GAME_CAPS" ) )
				end
			end
		end
	end
	if previousGametypeType then
		Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteMapPreviousGametype" ), previousGametypeType )
	end
	if previousMap ~= nil then
		Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteMapPrevious" ), previousMap )
		Lobby.MapVote.SetGameModeName( mapVote, "mapVoteGameModePrevious", previousGametype or "" )
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

Lobby.MapVote.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST ) then
		Engine.SetPlaylistPrevCount( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, 0 )
	end
end

Lobby.MapVote.Init = function ( data )
	if data.init == false then
		return 
	else
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
		Engine.CreateModel( mapVote, "mapVoteMapPreviousGametype", true )
		Engine.CreateModel( mapVote, "mapVoteCustomGameName", true )
		Engine.CreateModel( mapVote, "isOfficialVariant", true )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteMapNext" ), "" )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteMapPrevious" ), "" )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteGameModeNext" ), "" )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteGameModePrevious" ), "" )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountNext" ), 0 )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountPrevious" ), 0 )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountRandom" ), 0 )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteGameModeRandom" ), "MENU_MODE_CLASSIFIED_CAPS" )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountRandom" ), 0 )
		Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCustomGameName" ), "" )
		Engine.SetModelValue( Engine.GetModel( mapVote, "isOfficialVariant" ), true )
		Lobby.MapVote.Clear()
	end
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
		if value.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS then
			prev = prev + 1
		end
		if value.mapVote == Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM then
			rand = rand + 1
		end
	end
	local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
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
		Lobby.MapVote.SetMapVoteStatus( LuaEnum.MAP_VOTE_STATE.VOTING )
	end
end

Lobby.MapVote.UpdateMapInfo = function ()
	if Lobby.MapVote.UpdateMapVoteInfo() == false then
		return 
	elseif Engine.GetLobbyMode( Enum.LobbyMode.LOBBY_MODE_CUSTOM ) then
		local sessionInfo = Engine.GetLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		if sessionInfo and sessionInfo.lobbyData and sessionInfo.lobbyData.lobbyCustomData and sessionInfo.lobbyData.lobbyCustomData.customGameDetails then
			local customGameDetails = sessionInfo.lobbyData.lobbyCustomData.customGameDetails
			local mapVote = Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
			Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCustomGameName" ), customGameDetails.name )
			Engine.SetModelValue( Engine.CreateModel( mapVote, "isOfficialVariant" ), customGameDetails.isOfficial )
			Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( mapVote, "mapVoteGameModeNext" ) )
		end
	end
end

Lobby.MapVote.ShowLockedIn = function ()
	local uiScreenId = Engine.GetLobbyUIScreen()
	local uiScreen = LobbyData.GetLobbyMenuByID( uiScreenId )
	if uiScreen.lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		if Lobby.Timer.GetTimerType() == LuaEnum.TIMER_TYPE.THEATER then
			
		elseif Lobby.MapVote.VoteData == nil then
			return 
		end
	end
	Lobby.MapVote.SetMapVoteStatus( LuaEnum.MAP_VOTE_STATE.LOCKEDIN )
	Lobby.MapVote.UpdateMapVoteInfo()
end

Lobby.MapVote.LockedInVote = function ()
	if Lobby.MapVote.VoteState == LuaEnum.MAP_VOTE_STATE.LOCKEDIN then
		return 
	end
	local chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT
	local randomImage, randomMapName, randomGametype = nil
	local next = 0
	local prev = 0
	local rand = 0
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
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
	local prevSelected = false
	local highestVotes = next
	if highestVotes < prev then
		prevSelected = true
		highestVotes = prev
		chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS
		Engine.LobbyChoosePreviousPlaylist( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	end
	if highestVotes < rand then
		prevSelected = false
		highestVotes = rand
		chosen = Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM
		Engine.LobbyChooseRandomPlaylist( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
		local lobbyGameData = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
		local map = lobbyGameData.mapname
		local gameType = lobbyGameData.gametype
		local gameTypeInfo = Engine.GetGameTypeInfo( gameType )
		randomImage = Lobby.MapVote.GetMapValue( map, "previewImage" )
		randomMapName = Lobby.MapVote.GetMapValue( map, "mapNameCaps" )
		randomGametype = gameTypeInfo.nameRefCaps
	end
	if prevSelected then
		Engine.SetPlaylistPrevCount( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, Engine.GetPlaylistPrevCount( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType ) + 1 )
	else
		Engine.SetPlaylistPrevCount( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, 0 )
	end
	local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountNext" ), next )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountPrevious" ), prev )
	Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountRandom" ), rand )
end

Lobby.MapVote.ShowEndResult = function ()
	if Lobby.MapVote.VoteState == LuaEnum.MAP_VOTE_STATE.RESULT then
		return 
	else
		Lobby.MapVote.SetMapVoteStatus( LuaEnum.MAP_VOTE_STATE.RESULT )
	end
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
	Lobby.MapVote.storedNextPrev = false
	Lobby.MapVote.SetMapVoteStatus( LuaEnum.MAP_VOTE_STATE.HIDDEN )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	Engine.ClearMapVoteData( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	local mapVote = Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteMapNext" ), "" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteMapPrevious" ), "" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteGameModeNext" ), "" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteGameModePrevious" ), "" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountNext" ), 0 )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountPrevious" ), 0 )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountRandom" ), 0 )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteGameModeRandom" ), "MENU_MODE_CLASSIFIED_CAPS" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCountRandom" ), 0 )
	Engine.SetModelValue( Engine.GetModel( mapVote, "mapVoteCustomGameName" ), "" )
	Engine.SetModelValue( Engine.GetModel( mapVote, "isOfficialVariant" ), true )
end

Lobby.MapVote.Pump = function ()
	
end

