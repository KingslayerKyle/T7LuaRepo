require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )

Lobby.Pregame = {}
Lobby.Pregame.Timer = {}
Lobby.Pregame.Stage = {
	IDLE = 100,
	PRESTAGE = 101,
	ROUND = 102,
	INTERMISSION = 103,
	POSTSTAGE = 104,
	LAUNCH = 105,
	LAST_STAGE = 106
}
Lobby.Pregame.CurrentState = {}
Lobby.Pregame.LobbyState = {
	IDLE = Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE,
	VOTE = Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE,
	DRAFT = Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT,
	CAC_EDIT = Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT,
	STREAK_EDIT = Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT,
	LAUNCH_GAME = Enum.LobbyPregameState.LOBBY_PREGAME_STATE_LAUNCH_GAME,
	COUNT = Enum.LobbyPregameState.LOBBY_PREGAME_STATE_COUNT
}
Lobby.Pregame.ClientState = {
	IDLE = Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_IDLE,
	SELECTING = Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING,
	SELECTED = Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED,
	FORCED = Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED,
	COMPLETE = Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_COMPLETE,
	RESET = Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_RESET,
	END = Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_END,
	COUNT = Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_COUNT
}
Lobby.Pregame.StateInfo = {
	[Lobby.Pregame.Stage.PRESTAGE] = {
		[Lobby.Pregame.LobbyState.VOTE] = {
			setting = "pregamePreStageTime",
			statusString = "MENU_STARTING_IN"
		},
		[Lobby.Pregame.LobbyState.DRAFT] = {
			setting = "pregamePreStageTime",
			statusString = "MENU_STARTING_IN"
		},
		[Lobby.Pregame.LobbyState.CAC_EDIT] = {
			setting = "pregamePreStageTime",
			statusString = "MENU_STARTING_IN"
		},
		[Lobby.Pregame.LobbyState.STREAK_EDIT] = {
			setting = "pregamePreStageTime",
			statusString = "MENU_STARTING_IN"
		},
		[Lobby.Pregame.LobbyState.LAUNCH_GAME] = {
			setting = "pregamePreStageTime",
			statusString = "MENU_STARTING_IN"
		}
	},
	[Lobby.Pregame.Stage.ROUND] = {
		[Lobby.Pregame.LobbyState.VOTE] = {
			setting = "pregameItemVoteRoundTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.DRAFT] = {
			setting = "pregameDraftRoundTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.CAC_EDIT] = {
			setting = "pregameCACModifyTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.STREAK_EDIT] = {
			setting = "pregameScorestreakModifyTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.LAUNCH_GAME] = {
			setting = nil,
			statusString = ""
		}
	},
	[Lobby.Pregame.Stage.INTERMISSION] = {
		[Lobby.Pregame.LobbyState.VOTE] = {
			setting = "pregamePostRoundTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.DRAFT] = {
			setting = "pregamePostRoundTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.CAC_EDIT] = {
			setting = nil,
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.STREAK_EDIT] = {
			setting = nil,
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.LAUNCH_GAME] = {
			setting = nil,
			statusString = ""
		}
	},
	[Lobby.Pregame.Stage.POSTSTAGE] = {
		[Lobby.Pregame.LobbyState.VOTE] = {
			setting = "pregamePostStageTime",
			statusString = "MENU_COMPLETE"
		},
		[Lobby.Pregame.LobbyState.DRAFT] = {
			setting = "pregamePostStageTime",
			statusString = "MENU_COMPLETE"
		},
		[Lobby.Pregame.LobbyState.CAC_EDIT] = {
			setting = "pregamePostStageTime",
			statusString = "MENU_COMPLETE"
		},
		[Lobby.Pregame.LobbyState.STREAK_EDIT] = {
			setting = "pregamePostStageTime",
			statusString = "MENU_COMPLETE"
		},
		[Lobby.Pregame.LobbyState.LAUNCH_GAME] = {
			setting = "pregamePostStageTime",
			statusString = ""
		}
	},
	[Lobby.Pregame.Stage.LAUNCH] = {
		[Lobby.Pregame.LobbyState.VOTE] = {
			setting = "pregamePostStageTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.DRAFT] = {
			setting = "pregamePostStageTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.CAC_EDIT] = {
			setting = "pregamePostStageTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.STREAK_EDIT] = {
			setting = "pregamePostStageTime",
			statusString = ""
		},
		[Lobby.Pregame.LobbyState.LAUNCH_GAME] = {
			setting = "pregamePostStageTime",
			statusString = ""
		}
	}
}
Lobby.Pregame.Settings = {
	MAX_VOTE_COUNT = "pregameItemMaxVotes",
	VOTE_ENABLED = "pregameItemVoteEnabled",
	DRAFT_ENABLED = "pregameDraftEnabled",
	ALWAYS_EDIT_CAC = "pregameAlwaysShowCACEdit",
	ALWAYS_EDIT_STREAKS = "pregameAlwaysShowStreakEdit",
	SORT_ORDER = "pregamePositionSortType",
	SHUFFLE_METHOD = "pregamePositionShuffleMethod",
	TIMER_WARNING_SOUND = LobbyData.Sounds.ESportsTimerTick,
	TIMER_WARNING_TIME = 9,
	TIMER_FINAL_SOUND = LobbyData.Sounds.ESportsTimerTickLast,
	TIMER_FINAL_TIME = 4
}
Lobby.Pregame.OnClientAdded = function ( data )
	local state = Engine.GetLobbyPregameState()
	if state == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
		return 
	else
		local xuid = data.xuid
		Engine.LobbyHostSetClientPregameState( xuid, Lobby.Pregame.ClientState.SELECTED )
	end
end

Lobby.Pregame.OnClientRemoved = function ( data )
	
end

Lobby.Pregame.GetStateInfo = function ( stage )
	if Lobby.Pregame.StateInfo[stage] ~= nil then
		return Lobby.Pregame.StateInfo[stage][Lobby.Pregame.CurrentState]
	else
		
	end
end

Lobby.Pregame.GetStatusById = function ( statusId )
	for key, value in pairs( Lobby.Pregame.StateInfo ) do
		if value.id == statusId then
			return value
		end
	end
end

Lobby.Pregame.GetGlobalRoot = function ()
	return Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
end

Lobby.Pregame.GetRootModelForController = function ( controller )
	return Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame" )
end

Lobby.Pregame.StartTimer = function ( stage, durationOverride )
	local startTime = Engine.milliseconds()
	local timer = Lobby.Pregame.Timer
	local stateInfo = Lobby.Pregame.GetStateInfo( stage )
	local duration = Engine.GetGametypeSetting( stateInfo.setting )
	if durationOverride ~= nil then
		duration = durationOverride
	end
	timer.stage = stage
	timer.startTime = startTime
	timer.endTime = startTime + duration * 1000
	timer.lastTime = -1
	timer.timerCompleteProcessed = false
end

Lobby.Pregame.LaunchGame = function ()
	LobbyVM.LaunchGameExec( Engine.GetPrimaryController(), Enum.LobbyType.LOBBY_TYPE_GAME )
	Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.IDLE )
end

Lobby.Pregame.GetTeams = function ()
	local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local teams = {}
	for index, client in pairs( session.sessionClients ) do
		if client.team ~= Enum.team_t.TEAM_SPECTATOR then
			if teams[client.team] == nil then
				teams[client.team] = {}
			end
			table.insert( teams[client.team], client )
		end
	end
	local posSort = function ( a, b )
		return a.pregamePosition < b.pregamePosition
	end
	
	for teamID, team in pairs( teams ) do
		table.sort( team, posSort )
	end
	return teams
end

Lobby.Pregame.Shuffle = function ( input )
	local result = {}
	while table.getn( input ) > 0 do
		table.insert( result, table.remove( input, math.random( table.getn( input ) ) ) )
	end
	return result
end

Lobby.Pregame.AssignTeamPositions = function ()
	local teams = Lobby.Pregame.GetTeams()
	local sortType = Engine.GetGametypeSetting( Lobby.Pregame.Settings.SORT_ORDER )
	if sortType == Enum.PregameSortType.PREGAME_SORT_TYPE_RANDOM then
		for teamId, team in pairs( teams ) do
			local shuffledTeam = Lobby.Pregame.Shuffle( team )
			for index, client in ipairs( shuffledTeam ) do
				Engine.LobbyHostSetClientPregamePosition( client.xuid, index )
			end
		end
	elseif sortType == Enum.PregameSortType.PREGAME_SORT_TYPE_CLIENTNUM then
		for teamId, team in pairs( teams ) do
			local joinOrderSort = function ( a, b )
				return a.joinOrder < b.joinOrder
			end
			
			table.sort( team, joinOrderSort )
			for index, client in ipairs( team ) do
				Engine.LobbyHostSetClientPregamePosition( client.xuid, index )
			end
		end
	elseif sortType == Enum.PregameSortType.PREGAME_SORT_TYPE_CODCASTER then
		error( "AssignTeamPositions: Unhandled Sort Type" )
	end
end

Lobby.Pregame.PostVoteShuffle = function ()
	local teams = Lobby.Pregame.GetTeams()
	local shuffleMethod = Engine.GetGametypeSetting( Lobby.Pregame.Settings.SHUFFLE_METHOD )
	if shuffleMethod == Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_NONE then
		return 
	elseif shuffleMethod == Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_REVERSE then
		for teamId, team in pairs( teams ) do
			local f14_local3 = 0
			for f14_local4 = #team, 1, -1 do
				Engine.LobbyHostSetClientPregamePosition( team[f14_local4].xuid, f14_local3 )
				f14_local3 = f14_local3 + 1
			end
		end
	elseif shuffleMethod == Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_RANDOM then
		for teamId, team in pairs( teams ) do
			local shuffledTeam = Lobby.Pregame.Shuffle( team )
			for index, client in ipairs( shuffledTeam ) do
				Engine.LobbyHostSetClientPregamePosition( client.xuid, index )
			end
		end
	end
end

Lobby.Pregame.Clear = function ()
	Lobby.Pregame.Timer = {}
	Lobby.Pregame.CurrentState = {}
	Engine.LobbyHostClearPregameState()
end

Lobby.Pregame.Shutdown = function ( controller )
	Lobby.Timer.UnlockLobby( controller, true )
	Lobby.Pregame.Clear()
	local pregameRoot = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
	local pregameStateModel = Engine.CreateModel( pregameRoot, "state" )
	Engine.SetModelValue( pregameStateModel, Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE )
	local shutdownModel = Engine.CreateModel( Engine.GetGlobalModel(), "Pregame.shutdown" )
	Engine.ForceNotifyModelSubscriptions( shutdownModel )
end

Lobby.Pregame.SetState = function ( state )
	if Lobby.Pregame.CurrentState ~= state then
		Lobby.Pregame.CurrentState = state
		Engine.LobbyHostSetPregameState( state )
	end
end

Lobby.Pregame.OnMatchStart = function ( data )
	Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.IDLE )
	end
end

Lobby.Pregame.OnMatchEnd = function ( data )
	Lobby.Pregame.Clear()
end

Lobby.Pregame.Start = function ()
	Lobby.Pregame.Clear()
	Lobby.Pregame.AssignTeamPositions()
	if Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED ) == 1 then
		Lobby.Pregame.SetState( Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE )
	elseif Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED ) == 1 then
		Lobby.Pregame.SetState( Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT )
	else
		error( "Attempted to start Pregame with unhandled settings." )
		Lobby.Pregame.LaunchGame()
	end
	Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
end

Lobby.Pregame.GetRandomUnpickedCharacter = function ( team )
	local heroTable = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	local heroLoadoutPool = {}
	for clientId, client in pairs( team ) do
		local characterIndex = client.characterDraft.characterIndex
		local loadout = client.characterDraft.loadout
		if characterIndex >= 0 and loadout >= 0 and (client.pregameState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED or client.pregameState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED) then
			if heroTable[characterIndex + 1].loadouts == nil then
				heroTable[characterIndex + 1].loadouts = {}
			end
			heroTable[characterIndex + 1].loadouts[loadout] = {}
		end
	end
	for heroIndex, client in ipairs( heroTable ) do
		local isLootHero = CoDShared.IsLootHero( client )
		if client.disabled == false and isLootHero == false then
			for i = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
				local item = {
					heroIndex = heroIndex - 1,
					loadoutIndex = i
				}
				local loadoutSlotInfo = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, item.heroIndex, i )
				if loadoutSlotInfo then
					local itemDisabled = loadoutSlotInfo.devOnly
					if itemDisabled == false and (client.loadouts == nil or client.loadouts[i] == nil) and Engine.GetItemVote( loadoutSlotInfo.itemIndex ) ~= Enum.VoteType.VOTE_TYPE_BAN and not Engine.IsItemIndexRestricted( loadoutSlotInfo.itemIndex ) then
						table.insert( heroLoadoutPool, item )
					end
				end
			end
		end
	end
	if #heroLoadoutPool > 0 then
		local randomIndex = math.random( 1, #heroLoadoutPool )
		local selection = heroLoadoutPool[randomIndex]
		return selection.heroIndex, selection.loadoutIndex
	else
		return -1, -1
	end
end

Lobby.Pregame.StartNextRound = function ()
	local shouldStartRound = false
	local teams = Lobby.Pregame.GetTeams()
	for teamID, team in pairs( teams ) do
		local f22_local3 = false
		for clientIndex, client in pairs( team ) do
			if not f22_local3 and client.pregameState == Lobby.Pregame.ClientState.IDLE then
				Engine.LobbyHostSetClientPregameState( client.xuid, Lobby.Pregame.ClientState.SELECTING )
				f22_local3 = true
				shouldStartRound = true
			end
		end
	end
	if shouldStartRound then
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.ROUND )
	else
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.POSTSTAGE )
	end
end

Lobby.Pregame.StartRoundForAllPlayers = function ()
	local teams = Lobby.Pregame.GetTeams()
	for teamID, team in pairs( teams ) do
		for clientIndex, client in pairs( team ) do
			Engine.LobbyHostSetClientPregameState( client.xuid, Lobby.Pregame.ClientState.SELECTING )
		end
	end
	Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.ROUND )
end

Lobby.Pregame.ForcefullyEndRound = function ()
	local teams = Lobby.Pregame.GetTeams()
	local currentLobbyState = Lobby.Pregame.CurrentState
	for teamId, team in pairs( teams ) do
		for clientId, client in pairs( team ) do
			if client.pregameState == Lobby.Pregame.ClientState.SELECTING then
				local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
				if currentLobbyState == Lobby.Pregame.LobbyState.VOTE then
					Engine.LobbyHostForceClientRoundComplete( lobbyType, client.xuid )
				end
				if currentLobbyState == Lobby.Pregame.LobbyState.DRAFT then
					local characterIndex, loadout = Lobby.Pregame.GetRandomUnpickedCharacter( team )
					if characterIndex < 0 or loadout < 0 then
						Engine.LobbyHostForceClientRoundComplete( lobbyType, client.xuid )
					else
						Engine.LobbyHostForceClientCharacterSelection( lobbyType, client.xuid, characterIndex, loadout )
						goto basicblock_14:
					end
				end
				if currentLobbyState == Lobby.Pregame.LobbyState.CAC_EDIT or currentLobbyState == Lobby.Pregame.LobbyState.STREAK_EDIT then
					Engine.LobbyHost_ForceClientEditComplete( lobbyType, client.xuid )
				end
			end
		end
	end
	Lobby.Pregame.AdvanceStateIfAllClientsSelected()
end

Lobby.Pregame.GetAllBannedItems = function ()
	local restrictedItems = {}
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local votes = Engine.GetPregameItemVotes( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	if votes ~= nil and #votes > 0 then
		for index, vote in ipairs( votes ) do
			if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
				table.insert( restrictedItems, vote )
			end
		end
	end
	return restrictedItems
end

Lobby.Pregame.AnyCACItemsBanned = function ()
	local bannedItems = Lobby.Pregame.GetAllBannedItems()
	for voteIndex, vote in ipairs( bannedItems ) do
		if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
				if not LuaUtils.StartsWith( itemInfo.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) and itemInfo.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.AnyStreaksBanned = function ()
	local bannedItems = Lobby.Pregame.GetAllBannedItems()
	for voteIndex, vote in ipairs( bannedItems ) do
		if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN and vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
			if LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.OnStageEnd = function ( state )
	local draftEnabled = Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED )
	local voteEnabled = Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED )
	local alwaysEditCAC = Engine.GetGametypeSetting( Lobby.Pregame.Settings.ALWAYS_EDIT_CAC )
	local alwaysEditStreaks = Engine.GetGametypeSetting( Lobby.Pregame.Settings.ALWAYS_EDIT_STREAKS )
	Engine.LobbyHostSetAllClientsPregameState( Lobby.Pregame.ClientState.IDLE )
	if state == Lobby.Pregame.LobbyState.VOTE then
		if draftEnabled == 1 then
			Lobby.Pregame.PostVoteShuffle()
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.DRAFT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		elseif alwaysEditCAC == 1 or Lobby.Pregame.AnyCACItemsBanned() then
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.CAC_EDIT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		else
			Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.CAC_EDIT )
		end
	elseif state == Lobby.Pregame.LobbyState.DRAFT then
		if voteEnabled == 1 then
			if alwaysEditCAC == 1 or Lobby.Pregame.AnyCACItemsBanned() then
				Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.CAC_EDIT )
				Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
			else
				Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.CAC_EDIT )
			end
		else
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.LAUNCH_GAME )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.LAUNCH )
		end
	elseif state == Lobby.Pregame.LobbyState.CAC_EDIT then
		if alwaysEditStreaks == 1 or Lobby.Pregame.AnyStreaksBanned() then
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.STREAK_EDIT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		else
			Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.STREAK_EDIT )
		end
	elseif state == Lobby.Pregame.LobbyState.STREAK_EDIT then
		Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.LAUNCH_GAME )
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.LAUNCH )
	else
		error( "Lobby.Pregame.OnStageEnd - unhandled lobby state" )
	end
end

Lobby.Pregame.PrestageMonitorSpecialRules = function ()
	if LuaUtils.IsArenaMode() then
		local minPlayer = Dvar.party_minplayers:get()
		local numPlayers = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if numPlayers < minPlayer then
			local controller = Engine.GetPrimaryController()
			Lobby.Pregame.Shutdown( controller )
			local uiScreenId = Engine.GetLobbyUIScreen()
			Engine.LobbyLaunchClear()
			LobbyVM.HostLaunchClear()
			local uiScreen = LobbyData.GetLobbyMenuByID( uiScreenId )
			local data = {
				controller = Engine.GetPrimaryController(),
				lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
				mainMode = uiScreen.mainMode,
				lobbyTimerType = uiScreen.lobbyTimerType,
				matchEnded = false,
				status = Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED
			}
			Lobby.Timer.HostingLobby( data )
			Engine.LobbyHostSetAllClientsPregameState( Lobby.Pregame.ClientState.RESET )
			return true
		end
	end
	return false
end

Lobby.Pregame.Pump = function ()
	local state = Engine.GetLobbyPregameState()
	if state == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
		return 
	end
	local lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	local lobbyType = Engine.LobbyGetControllingLobbySession( lobbyModule )
	if not Engine.IsLobbyHost( lobbyType ) then
		return 
	end
	local timer = Lobby.Pregame.Timer
	local stage, previousTimeRemaining = Engine.GetGameLobbyStatusInfo( lobbyType )
	if not timer.startTime or not timer.endTime then
		return 
	elseif timer.startTime == timer.endTime then
		Engine.SetGameLobbyStatusInfo( lobbyModule, lobbyType, timer.stage, -1 )
		timer.lastTime = -1
		return 
	end
	local currentTime = Engine.milliseconds()
	if timer.endTime < currentTime and not timer.timerCompleteProcessed then
		Lobby.Pregame.Timer.timerCompleteProcessed = true
		local currentState = Lobby.Pregame.CurrentState
		if stage ~= Lobby.Pregame.Stage.INTERMISSION and stage ~= Lobby.Pregame.Stage.POSTSTAGE and stage ~= Lobby.Pregame.Stage.PRESTAGE and Lobby.Pregame.PrestageMonitorSpecialRules() then
			return 
		elseif stage == Lobby.Pregame.Stage.PRESTAGE then
			if currentState == Lobby.Pregame.LobbyState.CAC_EDIT or currentState == Lobby.Pregame.LobbyState.STREAK_EDIT then
				Lobby.Pregame.StartRoundForAllPlayers()
			elseif not Lobby.Pregame.PrestageMonitorSpecialRules() then
				Lobby.Pregame.StartNextRound()
			end
		elseif stage == Lobby.Pregame.Stage.ROUND then
			Lobby.Pregame.ForcefullyEndRound()
		elseif stage == Lobby.Pregame.Stage.INTERMISSION then
			Lobby.Pregame.StartNextRound()
		elseif stage == Lobby.Pregame.Stage.POSTSTAGE then
			Lobby.Pregame.OnStageEnd( state )
		elseif stage == Lobby.Pregame.Stage.LAUNCH then
			Lobby.Pregame.LaunchGame()
		end
	end
	local timeRemaining = math.floor( (timer.endTime - Engine.milliseconds() + 1) / 1000 )
	if timeRemaining ~= timer.lastTime then
		timer.lastTime = timeRemaining
		Engine.SetGameLobbyStatusInfo( lobbyModule, lobbyType, timer.stage, timeRemaining )
	end
end

Lobby.Pregame.AnyClientInState = function ( teams, state )
	for teamId, team in pairs( teams ) do
		for clientId, client in pairs( team ) do
			if client.pregameState == state then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.AllClientsInState = function ( teams, states )
	for teamId, team in pairs( teams ) do
		for clientId, client in pairs( team ) do
			if states[client.pregameState] == nil then
				return false
			end
		end
	end
	return true
end

Lobby.Pregame.AdvanceStateIfAllClientsSelected = function ()
	local teams = Lobby.Pregame.GetTeams()
	local states = {
		[Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED] = true,
		[Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED] = true,
		[Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_COMPLETE] = true
	}
	if Lobby.Pregame.AnyClientInState( teams, Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING ) == false then
		if Lobby.Pregame.AllClientsInState( teams, states ) == true then
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.POSTSTAGE )
		else
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.INTERMISSION )
		end
	end
end

Lobby.Pregame.OnClientSelectionReceived = function ( data )
	Lobby.Pregame.AdvanceStateIfAllClientsSelected()
end

Lobby.Pregame.GameLobbyClientDataUpdate = function ( data )
	for index, client in pairs( data.clients ) do
		if Engine.IsLocalClient( client.xuid ) then
			Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( data.controller ), "clientState" ), client.pregameState )
			local maxVotes = Engine.GetGametypeSetting( Lobby.Pregame.Settings.MAX_VOTE_COUNT )
			Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( data.controller ), "maxVotes" ), maxVotes )
			if maxVotes > 0 then
				local votesRemaining = maxVotes - client.restrictedItemVoteCount
				Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( data.controller ), "remainingVotes" ), votesRemaining )
			end
		end
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Lobby.Pregame.GetGlobalRoot(), "Update" ) )
end

local lastTime = -1
Lobby.Pregame.UpdateLobbyStatusInfo = function ( data )
	local pregameRootModel = Lobby.Pregame.GetGlobalRoot()
	Lobby.Pregame.CurrentState = data.pregameState
	local stage = data.status
	local lobbyPregameState = data.pregameState
	local timeLeft = data.statusValue
	if timeLeft < 0 then
		timeLeft = -1
		lastTime = -1
	end
	if timeLeft ~= lastTime then
		lastTime = timeLeft
		local clientStateModel = Engine.CreateModel( Lobby.Pregame.GetRootModelForController( data.controller ), "clientState" )
		local clientState = Engine.GetModelValue( clientStateModel )
		if stage == Lobby.Pregame.Stage.ROUND and clientState == Lobby.Pregame.ClientState.SELECTING then
			if timeLeft <= Lobby.Pregame.Settings.TIMER_WARNING_TIME and Lobby.Pregame.Settings.TIMER_FINAL_TIME < timeLeft then
				Engine.PlaySound( Lobby.Pregame.Settings.TIMER_WARNING_SOUND )
			elseif timeLeft <= Lobby.Pregame.Settings.TIMER_FINAL_TIME and timeLeft >= 0 then
				Engine.PlaySound( Lobby.Pregame.Settings.TIMER_FINAL_SOUND )
			end
		end
	end
	local stateInfo = Lobby.Pregame.GetStateInfo( stage )
	if stateInfo then
		Engine.SetModelValue( Engine.CreateModel( pregameRootModel, "status" ), stateInfo.statusString )
	end
	Engine.SetModelValue( Engine.CreateModel( pregameRootModel, "stage" ), stage )
	Engine.SetModelValue( Engine.CreateModel( pregameRootModel, "state" ), lobbyPregameState )
	if timeLeft == -1 then
		Engine.SetModelValue( Engine.CreateModel( pregameRootModel, "timeleft" ), "" )
	else
		Engine.SetModelValue( Engine.CreateModel( pregameRootModel, "timeleft" ), tostring( timeLeft + 1 ) )
	end
end

