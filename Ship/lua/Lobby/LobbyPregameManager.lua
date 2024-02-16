-- 796d02f931daae736a8f3798624f1926
-- This hash is used for caching, delete to decompile the file again

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
Lobby.Pregame.OnClientAdded = function ( f1_arg0 )
	if Engine.GetLobbyPregameState() == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
		return 
	else
		Engine.LobbyHost_SetClientPregameState( f1_arg0.xuid, Lobby.Pregame.ClientState.SELECTED )
	end
end

Lobby.Pregame.OnClientRemoved = function ( f2_arg0 )
	
end

Lobby.Pregame.GetStateInfo = function ( f3_arg0 )
	if Lobby.Pregame.StateInfo[f3_arg0] ~= nil then
		return Lobby.Pregame.StateInfo[f3_arg0][Lobby.Pregame.CurrentState]
	else
		
	end
end

Lobby.Pregame.GetStatusById = function ( f4_arg0 )
	for f4_local3, f4_local4 in pairs( Lobby.Pregame.StateInfo ) do
		if f4_local4.id == f4_arg0 then
			return f4_local4
		end
	end
end

Lobby.Pregame.GetGlobalRoot = function ()
	return Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
end

Lobby.Pregame.GetRootModelForController = function ( f6_arg0 )
	return Engine.CreateModel( Engine.GetModelForController( f6_arg0 ), "Pregame" )
end

Lobby.Pregame.StartTimer = function ( f7_arg0, f7_arg1 )
	local f7_local0 = Engine.milliseconds()
	local f7_local1 = Lobby.Pregame.Timer
	local f7_local2 = Lobby.Pregame.GetStateInfo( f7_arg0 )
	local f7_local3 = Engine.GetGametypeSetting( f7_local2.setting )
	if f7_arg1 ~= nil then
		f7_local3 = f7_arg1
	end
	if f7_local3 == nil then
		f7_local3 = 10
	end
	f7_local1.stage = f7_arg0
	f7_local1.startTime = f7_local0
	f7_local1.endTime = f7_local0 + f7_local3 * 1000
	f7_local1.lastTime = -1
	f7_local1.timerCompleteProcessed = false
end

Lobby.Pregame.LaunchGame = function ()
	LobbyVM.LaunchGameExec( Engine.GetPrimaryController(), Enum.LobbyType.LOBBY_TYPE_GAME )
	Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.IDLE )
end

Lobby.Pregame.GetTeams = function ()
	local f9_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f9_local1 = {}
	for f9_local5, f9_local6 in pairs( f9_local0.sessionClients ) do
		if f9_local6.team ~= Enum.team_t.TEAM_SPECTATOR then
			if f9_local1[f9_local6.team] == nil then
				f9_local1[f9_local6.team] = {}
			end
			table.insert( f9_local1[f9_local6.team], f9_local6 )
		end
	end
	f9_local2 = function ( f10_arg0, f10_arg1 )
		return f10_arg0.pregamePosition < f10_arg1.pregamePosition
	end
	
	for f9_local6, f9_local7 in pairs( f9_local1 ) do
		table.sort( f9_local7, f9_local2 )
	end
	return f9_local1
end

Lobby.Pregame.Shuffle = function ( f11_arg0 )
	local f11_local0 = {}
	while table.getn( f11_arg0 ) > 0 do
		table.insert( f11_local0, table.remove( f11_arg0, math.random( table.getn( f11_arg0 ) ) ) )
	end
	return f11_local0
end

Lobby.Pregame.AssignTeamPositions = function ()
	local f12_local0 = Lobby.Pregame.GetTeams()
	local f12_local1 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.SORT_ORDER )
	if f12_local1 == Enum.PregameSortType.PREGAME_SORT_TYPE_RANDOM then
		for f12_local8, f12_local9 in pairs( f12_local0 ) do
			for f12_local5, f12_local6 in ipairs( Lobby.Pregame.Shuffle( f12_local9 ) ) do
				Engine.LobbyHost_SetClientPregamePosition( f12_local6.xuid, f12_local5 )
			end
		end
	elseif f12_local1 == Enum.PregameSortType.PREGAME_SORT_TYPE_CLIENTNUM then
		for f12_local8, f12_local9 in pairs( f12_local0 ) do
			table.sort( f12_local9, function ( f13_arg0, f13_arg1 )
				return f13_arg0.joinOrder < f13_arg1.joinOrder
			end )
			for f12_local5, f12_local6 in ipairs( f12_local9 ) do
				Engine.LobbyHost_SetClientPregamePosition( f12_local6.xuid, f12_local5 )
			end
		end
	elseif f12_local1 == Enum.PregameSortType.PREGAME_SORT_TYPE_CODCASTER then
		error( "AssignTeamPositions: Unhandled Sort Type" )
	end
end

Lobby.Pregame.PostVoteShuffle = function ()
	local f14_local0 = Lobby.Pregame.GetTeams()
	local f14_local1 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.SHUFFLE_METHOD )
	if f14_local1 == Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_NONE then
		return 
	elseif f14_local1 == Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_REVERSE then
		for f14_local7, f14_local8 in pairs( f14_local0 ) do
			local f14_local5 = 0
			for f14_local6 = #f14_local8, 1, -1 do
				Engine.LobbyHost_SetClientPregamePosition( f14_local8[f14_local6].xuid, f14_local5 )
				f14_local5 = f14_local5 + 1
			end
		end
	elseif f14_local1 == Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_RANDOM then
		for f14_local7, f14_local8 in pairs( f14_local0 ) do
			for f14_local11, f14_local12 in ipairs( Lobby.Pregame.Shuffle( f14_local8 ) ) do
				Engine.LobbyHost_SetClientPregamePosition( f14_local12.xuid, f14_local11 )
			end
		end
	end
end

Lobby.Pregame.Clear = function ()
	Lobby.Pregame.Timer = {}
	Lobby.Pregame.CurrentState = {}
	Engine.LobbyHost_ClearPregameState()
end

Lobby.Pregame.Shutdown = function ( f16_arg0 )
	Lobby.Timer.UnlockLobby( f16_arg0, true )
	Lobby.Pregame.Clear()
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" ), "state" ), Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "Pregame.shutdown" ) )
end

Lobby.Pregame.SetState = function ( f17_arg0 )
	if Lobby.Pregame.CurrentState ~= f17_arg0 then
		Lobby.Pregame.CurrentState = f17_arg0
		Engine.LobbyHost_SetPregameState( f17_arg0 )
	end
end

Lobby.Pregame.OnMatchStart = function ( f18_arg0 )
	Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.IDLE )
	end
end

Lobby.Pregame.OnMatchEnd = function ( f19_arg0 )
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

Lobby.Pregame.GetRandomUnpickedCharacter = function ( f21_arg0 )
	local f21_local0 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	local f21_local1 = {}
	for f21_local5, f21_local6 in pairs( f21_arg0 ) do
		local f21_local7 = f21_local6.characterDraft.characterIndex
		local f21_local8 = f21_local6.characterDraft.loadout
		if f21_local7 >= 0 and f21_local8 >= 0 and (f21_local6.pregameState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED or f21_local6.pregameState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED) then
			if f21_local0[f21_local7 + 1].loadouts == nil then
				f21_local0[f21_local7 + 1].loadouts = {}
			end
			f21_local0[f21_local7 + 1].loadouts[f21_local8] = {}
		end
	end
	for f21_local5, f21_local6 in ipairs( f21_local0 ) do
		if f21_local6.disabled == false and CoDShared.IsLootHero( f21_local6 ) == false then
			for f21_local8 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
				local f21_local11 = {
					heroIndex = f21_local5 - 1,
					loadoutIndex = f21_local8
				}
				local f21_local12 = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, f21_local11.heroIndex, f21_local8 )
				if f21_local12 and f21_local12.devOnly == false and (f21_local6.loadouts == nil or f21_local6.loadouts[f21_local8] == nil) and Engine.GetItemVote( f21_local12.itemIndex ) ~= Enum.VoteType.VOTE_TYPE_BAN and not Engine.IsItemIndexRestricted( f21_local12.itemIndex ) then
					table.insert( f21_local1, f21_local11 )
				end
			end
		end
	end
	if #f21_local1 > 0 then
		f21_local3 = f21_local1[math.random( 1, #f21_local1 )]
		return f21_local3.heroIndex, f21_local3.loadoutIndex
	else
		return -1, -1
	end
end

Lobby.Pregame.StartNextRound = function ()
	local f22_local0 = false
	for f22_local8, f22_local9 in pairs( Lobby.Pregame.GetTeams() ) do
		local f22_local4 = false
		for f22_local5, f22_local6 in pairs( f22_local9 ) do
			if not f22_local4 and f22_local6.pregameState == Lobby.Pregame.ClientState.IDLE then
				Engine.LobbyHost_SetClientPregameState( f22_local6.xuid, Lobby.Pregame.ClientState.SELECTING )
				f22_local4 = true
				f22_local0 = true
			end
		end
	end
	if f22_local0 then
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.ROUND )
	else
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.POSTSTAGE )
	end
end

Lobby.Pregame.StartRoundForAllPlayers = function ()
	for f23_local6, f23_local7 in pairs( Lobby.Pregame.GetTeams() ) do
		for f23_local3, f23_local4 in pairs( f23_local7 ) do
			Engine.LobbyHost_SetClientPregameState( f23_local4.xuid, Lobby.Pregame.ClientState.SELECTING )
		end
	end
	Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.ROUND )
end

Lobby.Pregame.ForcefullyEndRound = function ()
	local f24_local0 = Lobby.Pregame.GetTeams()
	local f24_local1 = Lobby.Pregame.CurrentState
	for f24_local10, f24_local11 in pairs( f24_local0 ) do
		for f24_local7, f24_local8 in pairs( f24_local11 ) do
			if f24_local8.pregameState == Lobby.Pregame.ClientState.SELECTING then
				if f24_local1 == Lobby.Pregame.LobbyState.VOTE then
					Engine.LobbyHost_ForceClientRoundComplete( f24_local8.xuid )
				end
				if f24_local1 == Lobby.Pregame.LobbyState.DRAFT then
					local f24_local5, f24_local6 = Lobby.Pregame.GetRandomUnpickedCharacter( f24_local11 )
					if f24_local5 < 0 or f24_local6 < 0 then
						Engine.LobbyHost_ForceClientRoundComplete( f24_local8.xuid )
					else
						Engine.LobbyHost_ForceClientCharacterSelection( f24_local8.xuid, f24_local5, f24_local6 )
						goto basicblock_14:
					end
				end
				if f24_local1 == Lobby.Pregame.LobbyState.CAC_EDIT or f24_local1 == Lobby.Pregame.LobbyState.STREAK_EDIT then
					Engine.LobbyHost_ForceClientEditComplete( f24_local8.xuid )
				end
			end
		end
	end
	Lobby.Pregame.AdvanceStateIfAllClientsSelected()
end

Lobby.Pregame.GetAllBannedItems = function ()
	local f25_local0 = {}
	local f25_local1 = Engine.GetPregameItemVotes()
	if f25_local1 ~= nil and #f25_local1 > 0 then
		for f25_local5, f25_local6 in ipairs( f25_local1 ) do
			if f25_local6.voteType == Enum.VoteType.VOTE_TYPE_BAN then
				table.insert( f25_local0, f25_local6 )
			end
		end
	end
	return f25_local0
end

Lobby.Pregame.AnyCACItemsBanned = function ()
	for f26_local4, f26_local5 in ipairs( Lobby.Pregame.GetAllBannedItems() ) do
		if f26_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if f26_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local f26_local3 = Engine.GetUnlockableInfoByIndex( f26_local5.itemIndex )
				if not LuaUtils.StartsWith( f26_local3.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f26_local3.loadoutSlot, "killstreak" ) and f26_local3.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if f26_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif f26_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif f26_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.AnyStreaksBanned = function ()
	for f27_local4, f27_local5 in ipairs( Lobby.Pregame.GetAllBannedItems() ) do
		if f27_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN and f27_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local f27_local3 = Engine.GetUnlockableInfoByIndex( f27_local5.itemIndex )
			if LuaUtils.StartsWith( f27_local3.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.OnStageEnd = function ( f28_arg0 )
	local f28_local0 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED )
	local f28_local1 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED )
	local f28_local2 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.ALWAYS_EDIT_CAC )
	local f28_local3 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.ALWAYS_EDIT_STREAKS )
	Engine.LobbyHost_SetAllClientsPregameState( Lobby.Pregame.ClientState.IDLE )
	if f28_arg0 == Lobby.Pregame.LobbyState.VOTE then
		if f28_local0 == 1 then
			Lobby.Pregame.PostVoteShuffle()
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.DRAFT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		elseif f28_local2 == 1 or Lobby.Pregame.AnyCACItemsBanned() then
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.CAC_EDIT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		else
			Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.CAC_EDIT )
		end
	elseif f28_arg0 == Lobby.Pregame.LobbyState.DRAFT then
		if f28_local1 == 1 then
			if f28_local2 == 1 or Lobby.Pregame.AnyCACItemsBanned() then
				Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.CAC_EDIT )
				Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
			else
				Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.CAC_EDIT )
			end
		else
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.LAUNCH_GAME )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.LAUNCH )
		end
	elseif f28_arg0 == Lobby.Pregame.LobbyState.CAC_EDIT then
		if f28_local3 == 1 or Lobby.Pregame.AnyStreaksBanned() then
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.STREAK_EDIT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		else
			Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.STREAK_EDIT )
		end
	elseif f28_arg0 == Lobby.Pregame.LobbyState.STREAK_EDIT then
		Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.LAUNCH_GAME )
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.LAUNCH )
	else
		error( "Lobby.Pregame.OnStageEnd - unhandled lobby state" )
	end
end

Lobby.Pregame.PrestageMonitorSpecialRules = function ()
	if LuaUtils.IsArenaMode() and Dvar.party_minplayers:get() > Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.Pregame.Shutdown( Engine.GetPrimaryController() )
		local f29_local0 = Engine.GetLobbyUIScreen()
		Engine.LobbyLaunchClear()
		LobbyVM.HostLaunchClear()
		local f29_local1 = LobbyData:UITargetFromId( f29_local0 )
		Lobby.Timer.HostingLobby( {
			controller = Engine.GetPrimaryController(),
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f29_local1.mainMode,
			lobbyTimerType = f29_local1.lobbyTimerType,
			matchEnded = false,
			status = Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED
		} )
		Engine.LobbyHost_SetAllClientsPregameState( Lobby.Pregame.ClientState.RESET )
		return true
	else
		return false
	end
end

Lobby.Pregame.Pump = function ()
	local f30_local0 = Engine.GetLobbyPregameState()
	if f30_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
		return 
	elseif not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	end
	local f30_local1 = Lobby.Pregame.Timer
	local f30_local2, f30_local3 = Engine.GetGameLobbyStatusInfo()
	if not f30_local1.startTime or not f30_local1.endTime then
		return 
	elseif f30_local1.startTime == f30_local1.endTime then
		Engine.SetGameLobbyStatusInfo( f30_local1.stage, -1 )
		f30_local1.lastTime = -1
		return 
	elseif f30_local1.endTime < Engine.milliseconds() and not f30_local1.timerCompleteProcessed then
		Lobby.Pregame.Timer.timerCompleteProcessed = true
		local f30_local4 = Lobby.Pregame.CurrentState
		if f30_local2 ~= Lobby.Pregame.Stage.INTERMISSION and f30_local2 ~= Lobby.Pregame.Stage.POSTSTAGE and f30_local2 ~= Lobby.Pregame.Stage.PRESTAGE and Lobby.Pregame.PrestageMonitorSpecialRules() then
			return 
		elseif f30_local2 == Lobby.Pregame.Stage.PRESTAGE then
			if f30_local4 == Lobby.Pregame.LobbyState.CAC_EDIT or f30_local4 == Lobby.Pregame.LobbyState.STREAK_EDIT then
				Lobby.Pregame.StartRoundForAllPlayers()
			elseif not Lobby.Pregame.PrestageMonitorSpecialRules() then
				Lobby.Pregame.StartNextRound()
			end
		elseif f30_local2 == Lobby.Pregame.Stage.ROUND then
			Lobby.Pregame.ForcefullyEndRound()
		elseif f30_local2 == Lobby.Pregame.Stage.INTERMISSION then
			Lobby.Pregame.StartNextRound()
		elseif f30_local2 == Lobby.Pregame.Stage.POSTSTAGE then
			Lobby.Pregame.OnStageEnd( f30_local0 )
		elseif f30_local2 == Lobby.Pregame.Stage.LAUNCH then
			Lobby.Pregame.LaunchGame()
		end
	end
	local f30_local4 = math.floor( (f30_local1.endTime - Engine.milliseconds() + 1) / 1000 )
	if f30_local4 ~= f30_local1.lastTime then
		f30_local1.lastTime = f30_local4
		Engine.SetGameLobbyStatusInfo( f30_local1.stage, f30_local4 )
	end
end

Lobby.Pregame.AnyClientInState = function ( f31_arg0, f31_arg1 )
	for f31_local6, f31_local7 in pairs( f31_arg0 ) do
		for f31_local3, f31_local4 in pairs( f31_local7 ) do
			if f31_local4.pregameState == f31_arg1 then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.AllClientsInState = function ( f32_arg0, f32_arg1 )
	for f32_local6, f32_local7 in pairs( f32_arg0 ) do
		for f32_local3, f32_local4 in pairs( f32_local7 ) do
			if f32_arg1[f32_local4.pregameState] == nil then
				return false
			end
		end
	end
	return true
end

Lobby.Pregame.AdvanceStateIfAllClientsSelected = function ()
	local f33_local0 = Lobby.Pregame.GetTeams()
	local f33_local1 = {
		[Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED] = true,
		[Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED] = true,
		[Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_COMPLETE] = true
	}
	if Lobby.Pregame.AnyClientInState( f33_local0, Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING ) == false then
		if Lobby.Pregame.AllClientsInState( f33_local0, f33_local1 ) == true then
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.POSTSTAGE )
		else
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.INTERMISSION )
		end
	end
end

Lobby.Pregame.OnClientSelectionReceived = function ( f34_arg0 )
	Lobby.Pregame.AdvanceStateIfAllClientsSelected()
end

Lobby.Pregame.GameLobbyClientDataUpdate = function ( f35_arg0 )
	for f35_local4, f35_local5 in pairs( f35_arg0.clients ) do
		if Engine.IsLocalClient( f35_local5.xuid ) then
			Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f35_arg0.controller ), "clientState" ), f35_local5.pregameState )
			local f35_local3 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.MAX_VOTE_COUNT )
			Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f35_arg0.controller ), "maxVotes" ), f35_local3 )
			if f35_local3 > 0 then
				Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f35_arg0.controller ), "remainingVotes" ), f35_local3 - f35_local5.restrictedItemVoteCount )
			end
		end
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Lobby.Pregame.GetGlobalRoot(), "Update" ) )
end

local f0_local0 = -1
Lobby.Pregame.UpdateLobbyStatusInfo = function ( f36_arg0 )
	local f36_local0 = Lobby.Pregame.GetGlobalRoot()
	Lobby.Pregame.CurrentState = f36_arg0.pregameState
	local f36_local1 = f36_arg0.status
	local f36_local2 = f36_arg0.pregameState
	local f36_local3 = f36_arg0.statusValue
	if f36_local3 < 0 then
		f36_local3 = -1
		f0_local0 = -1
	end
	if f36_local3 ~= f0_local0 then
		f0_local0 = f36_local3
		if f36_local1 == Lobby.Pregame.Stage.ROUND and Engine.GetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f36_arg0.controller ), "clientState" ) ) == Lobby.Pregame.ClientState.SELECTING then
			if f36_local3 <= Lobby.Pregame.Settings.TIMER_WARNING_TIME and Lobby.Pregame.Settings.TIMER_FINAL_TIME < f36_local3 then
				Engine.PlaySound( Lobby.Pregame.Settings.TIMER_WARNING_SOUND )
			elseif f36_local3 <= Lobby.Pregame.Settings.TIMER_FINAL_TIME and f36_local3 >= 0 then
				Engine.PlaySound( Lobby.Pregame.Settings.TIMER_FINAL_SOUND )
			end
		end
	end
	local f36_local4 = Lobby.Pregame.GetStateInfo( f36_local1 )
	if f36_local4 then
		Engine.SetModelValue( Engine.CreateModel( f36_local0, "status" ), f36_local4.statusString )
	end
	Engine.SetModelValue( Engine.CreateModel( f36_local0, "stage" ), f36_local1 )
	Engine.SetModelValue( Engine.CreateModel( f36_local0, "state" ), f36_local2 )
	if f36_local3 == -1 then
		Engine.SetModelValue( Engine.CreateModel( f36_local0, "timeleft" ), "" )
	else
		Engine.SetModelValue( Engine.CreateModel( f36_local0, "timeleft" ), tostring( f36_local3 + 1 ) )
	end
end

