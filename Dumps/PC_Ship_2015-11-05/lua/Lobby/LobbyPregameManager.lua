require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )

Lobby.Pregame = {}
Lobby.Pregame.Timer = {}
Lobby.Pregame.Stage = {
	IDLE = 0,
	PRESTAGE = 1,
	ROUND = 2,
	INTERMISSION = 3,
	POSTSTAGE = 4,
	LAUNCH = 5
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
	f7_local1.stage = f7_arg0
	f7_local1.startTime = f7_local0
	f7_local1.endTime = f7_local0 + f7_local3 * 1000
	f7_local1.lastTime = -1
	f7_local1.timerCompleteProcessed = false
end

Lobby.Pregame.Recover = function ( f8_arg0, f8_arg1 )
	Lobby.Pregame.StartTimer( f8_arg0, f8_arg1 )
	Engine.SetGameLobbyStatusInfo( f8_arg0, f8_arg1 )
end

Lobby.Pregame.LaunchGame = function ()
	LobbyVM.LaunchGameExec( Engine.GetPrimaryController(), Enum.LobbyType.LOBBY_TYPE_GAME )
	Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.IDLE )
end

Lobby.Pregame.GetTeams = function ()
	local f10_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f10_local1 = {}
	for f10_local5, f10_local6 in pairs( f10_local0.sessionClients ) do
		if f10_local6.team ~= Enum.team_t.TEAM_SPECTATOR then
			if f10_local1[f10_local6.team] == nil then
				f10_local1[f10_local6.team] = {}
			end
			table.insert( f10_local1[f10_local6.team], f10_local6 )
		end
	end
	f10_local2 = function ( f11_arg0, f11_arg1 )
		return f11_arg0.pregamePosition < f11_arg1.pregamePosition
	end
	
	for f10_local6, f10_local7 in pairs( f10_local1 ) do
		table.sort( f10_local7, f10_local2 )
	end
	return f10_local1
end

Lobby.Pregame.Shuffle = function ( f12_arg0 )
	local f12_local0 = {}
	while table.getn( f12_arg0 ) > 0 do
		table.insert( f12_local0, table.remove( f12_arg0, math.random( table.getn( f12_arg0 ) ) ) )
	end
	return f12_local0
end

Lobby.Pregame.AssignTeamPositions = function ()
	local f13_local0 = Lobby.Pregame.GetTeams()
	local f13_local1 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.SORT_ORDER )
	if f13_local1 == Enum.PregameSortType.PREGAME_SORT_TYPE_RANDOM then
		for f13_local8, f13_local9 in pairs( f13_local0 ) do
			for f13_local5, f13_local6 in ipairs( Lobby.Pregame.Shuffle( f13_local9 ) ) do
				Engine.LobbyHost_SetClientPregamePosition( f13_local6.xuid, f13_local5 )
			end
		end
	elseif f13_local1 == Enum.PregameSortType.PREGAME_SORT_TYPE_CLIENTNUM then
		for f13_local8, f13_local9 in pairs( f13_local0 ) do
			table.sort( f13_local9, function ( f14_arg0, f14_arg1 )
				return f14_arg0.joinOrder < f14_arg1.joinOrder
			end )
			for f13_local5, f13_local6 in ipairs( f13_local9 ) do
				Engine.LobbyHost_SetClientPregamePosition( f13_local6.xuid, f13_local5 )
			end
		end
	elseif f13_local1 == Enum.PregameSortType.PREGAME_SORT_TYPE_CODCASTER then
		error( "AssignTeamPositions: Unhandled Sort Type" )
	end
end

Lobby.Pregame.PostVoteShuffle = function ()
	local f15_local0 = Lobby.Pregame.GetTeams()
	local f15_local1 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.SHUFFLE_METHOD )
	if f15_local1 == Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_NONE then
		return 
	elseif f15_local1 == Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_REVERSE then
		for f15_local7, f15_local8 in pairs( f15_local0 ) do
			local f15_local5 = 0
			for f15_local6 = #f15_local8, 1, -1 do
				Engine.LobbyHost_SetClientPregamePosition( f15_local8[f15_local6].xuid, f15_local5 )
				f15_local5 = f15_local5 + 1
			end
		end
	elseif f15_local1 == Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_RANDOM then
		for f15_local7, f15_local8 in pairs( f15_local0 ) do
			for f15_local11, f15_local12 in ipairs( Lobby.Pregame.Shuffle( f15_local8 ) ) do
				Engine.LobbyHost_SetClientPregamePosition( f15_local12.xuid, f15_local11 )
			end
		end
	end
end

Lobby.Pregame.Clear = function ()
	Lobby.Pregame.Timer = {}
	Lobby.Pregame.CurrentState = {}
	Engine.LobbyHost_ClearPregameState()
end

Lobby.Pregame.SetState = function ( f17_arg0 )
	if Lobby.Pregame.CurrentState ~= f17_arg0 then
		Lobby.Pregame.CurrentState = f17_arg0
		Engine.LobbyHost_SetPregameState( f17_arg0 )
	end
end

Lobby.Pregame.OnMatchEnd = function ( f18_arg0 )
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

Lobby.Pregame.GetRandomUnpickedCharacter = function ( f20_arg0 )
	local f20_local0 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	local f20_local1 = {}
	for f20_local5, f20_local6 in pairs( f20_arg0 ) do
		local f20_local7 = f20_local6.characterDraft.characterIndex
		local f20_local8 = f20_local6.characterDraft.loadout
		if f20_local7 >= 0 and f20_local8 >= 0 and (f20_local6.pregameState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED or f20_local6.pregameState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED) then
			if f20_local0[f20_local7 + 1].loadouts == nil then
				f20_local0[f20_local7 + 1].loadouts = {}
			end
			f20_local0[f20_local7 + 1].loadouts[f20_local8] = {}
		end
	end
	for f20_local5, f20_local6 in ipairs( f20_local0 ) do
		if f20_local6.disabled == false then
			for f20_local7 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
				local f20_local10 = {
					heroIndex = f20_local5 - 1,
					loadoutIndex = f20_local7
				}
				local f20_local11 = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, f20_local10.heroIndex, f20_local7 )
				if f20_local11 and f20_local11.devOnly == false and (f20_local6.loadouts == nil or f20_local6.loadouts[f20_local7] == nil) and Engine.GetItemVote( f20_local11.itemIndex ) ~= Enum.VoteType.VOTE_TYPE_BAN and not Engine.IsItemIndexRestricted( f20_local11.itemIndex ) then
					table.insert( f20_local1, f20_local10 )
				end
			end
		end
	end
	if #f20_local1 > 0 then
		f20_local3 = f20_local1[math.random( 1, #f20_local1 )]
		return f20_local3.heroIndex, f20_local3.loadoutIndex
	else
		return -1, -1
	end
end

Lobby.Pregame.StartNextRound = function ()
	local f21_local0 = false
	for f21_local8, f21_local9 in pairs( Lobby.Pregame.GetTeams() ) do
		local f21_local4 = false
		for f21_local5, f21_local6 in pairs( f21_local9 ) do
			if not f21_local4 and f21_local6.pregameState == Lobby.Pregame.ClientState.IDLE then
				Engine.LobbyHost_SetClientPregameState( f21_local6.xuid, Lobby.Pregame.ClientState.SELECTING )
				f21_local4 = true
				f21_local0 = true
			end
		end
	end
	if f21_local0 then
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.ROUND )
	else
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.POSTSTAGE )
	end
end

Lobby.Pregame.StartRoundForAllPlayers = function ()
	for f22_local6, f22_local7 in pairs( Lobby.Pregame.GetTeams() ) do
		for f22_local3, f22_local4 in pairs( f22_local7 ) do
			Engine.LobbyHost_SetClientPregameState( f22_local4.xuid, Lobby.Pregame.ClientState.SELECTING )
		end
	end
	Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.ROUND )
end

Lobby.Pregame.ForcefullyEndRound = function ()
	local f23_local0 = Lobby.Pregame.GetTeams()
	local f23_local1 = Lobby.Pregame.CurrentState
	for f23_local10, f23_local11 in pairs( f23_local0 ) do
		for f23_local7, f23_local8 in pairs( f23_local11 ) do
			if f23_local8.pregameState == Lobby.Pregame.ClientState.SELECTING then
				if f23_local1 == Lobby.Pregame.LobbyState.VOTE then
					Engine.LobbyHost_ForceClientRoundComplete( f23_local8.xuid )
				end
				if f23_local1 == Lobby.Pregame.LobbyState.DRAFT then
					local f23_local5, f23_local6 = Lobby.Pregame.GetRandomUnpickedCharacter( f23_local11 )
					if f23_local5 < 0 or f23_local6 < 0 then
						Engine.LobbyHost_ForceClientRoundComplete( f23_local8.xuid )
					else
						Engine.LobbyHost_ForceClientCharacterSelection( f23_local8.xuid, f23_local5, f23_local6 )
						goto basicblock_14:
					end
				end
				if f23_local1 == Lobby.Pregame.LobbyState.CAC_EDIT or f23_local1 == Lobby.Pregame.LobbyState.STREAK_EDIT then
					Engine.LobbyHost_ForceClientEditComplete( f23_local8.xuid )
				end
			end
		end
	end
	Lobby.Pregame.AdvanceStateIfAllClientsSelected()
end

Lobby.Pregame.GetAllBannedItems = function ()
	local f24_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f24_local1 = f24_local0.sessionClients
	local f24_local2 = {}
	for f24_local11, f24_local12 in ipairs( f24_local1 ) do
		if f24_local12.voteCount > 0 then
			for f24_local9, f24_local10 in ipairs( f24_local12.votes ) do
				if f24_local10.voteType == Enum.VoteType.VOTE_TYPE_BAN then
					table.insert( f24_local2, f24_local10 )
				end
			end
		end
	end
	return f24_local2
end

Lobby.Pregame.AnyCACItemsBanned = function ()
	for f25_local4, f25_local5 in ipairs( Lobby.Pregame.GetAllBannedItems() ) do
		if f25_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if f25_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local f25_local3 = Engine.GetUnlockableInfoByIndex( f25_local5.itemIndex )
				if not LuaUtils.StartsWith( f25_local3.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f25_local3.loadoutSlot, "killstreak" ) and f25_local3.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if f25_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif f25_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif f25_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.AnyStreaksBanned = function ()
	for f26_local4, f26_local5 in ipairs( Lobby.Pregame.GetAllBannedItems() ) do
		if f26_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN and f26_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local f26_local3 = Engine.GetUnlockableInfoByIndex( f26_local5.itemIndex )
			if LuaUtils.StartsWith( f26_local3.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.OnStageEnd = function ( f27_arg0 )
	local f27_local0 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED )
	local f27_local1 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED )
	local f27_local2 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.ALWAYS_EDIT_CAC )
	local f27_local3 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.ALWAYS_EDIT_STREAKS )
	Engine.LobbyHost_SetAllClientsPregameState( Lobby.Pregame.ClientState.IDLE )
	if f27_arg0 == Lobby.Pregame.LobbyState.VOTE then
		if f27_local0 == 1 then
			Lobby.Pregame.PostVoteShuffle()
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.DRAFT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		elseif f27_local2 == 1 or Lobby.Pregame.AnyCACItemsBanned() then
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.CAC_EDIT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		else
			Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.CAC_EDIT )
		end
	elseif f27_arg0 == Lobby.Pregame.LobbyState.DRAFT then
		if f27_local1 == 1 then
			if f27_local2 == 1 or Lobby.Pregame.AnyCACItemsBanned() then
				Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.CAC_EDIT )
				Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
			else
				Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.CAC_EDIT )
			end
		else
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.LAUNCH_GAME )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.LAUNCH )
		end
	elseif f27_arg0 == Lobby.Pregame.LobbyState.CAC_EDIT then
		if f27_local3 == 1 or Lobby.Pregame.AnyStreaksBanned() then
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.STREAK_EDIT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		else
			Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.STREAK_EDIT )
		end
	elseif f27_arg0 == Lobby.Pregame.LobbyState.STREAK_EDIT then
		Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.LAUNCH_GAME )
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.LAUNCH )
	else
		error( "Lobby.Pregame.OnStageEnd - unhandled lobby state" )
	end
end

Lobby.Pregame.Pump = function ()
	local f28_local0 = Engine.GetLobbyPregameState()
	if f28_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
		return 
	elseif not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	end
	local f28_local1 = Lobby.Pregame.Timer
	local f28_local2, f28_local3 = Engine.GetGameLobbyStatusInfo()
	if not f28_local1.startTime or not f28_local1.endTime then
		return 
	elseif f28_local1.startTime == f28_local1.endTime then
		Engine.SetGameLobbyStatusInfo( f28_local1.stage, -1 )
		f28_local1.lastTime = -1
		return 
	elseif f28_local1.endTime < Engine.milliseconds() and not f28_local1.timerCompleteProcessed then
		Lobby.Pregame.Timer.timerCompleteProcessed = true
		local f28_local4 = Lobby.Pregame.CurrentState
		if f28_local2 == Lobby.Pregame.Stage.PRESTAGE then
			if f28_local4 == Lobby.Pregame.LobbyState.CAC_EDIT or f28_local4 == Lobby.Pregame.LobbyState.STREAK_EDIT then
				Lobby.Pregame.StartRoundForAllPlayers()
			else
				Lobby.Pregame.StartNextRound()
			end
		elseif f28_local2 == Lobby.Pregame.Stage.ROUND then
			Lobby.Pregame.ForcefullyEndRound()
		elseif f28_local2 == Lobby.Pregame.Stage.INTERMISSION then
			Lobby.Pregame.StartNextRound()
		elseif f28_local2 == Lobby.Pregame.Stage.POSTSTAGE then
			Lobby.Pregame.OnStageEnd( f28_local0 )
		elseif f28_local2 == Lobby.Pregame.Stage.LAUNCH then
			Lobby.Pregame.LaunchGame()
		end
	end
	local f28_local4 = math.floor( (f28_local1.endTime - Engine.milliseconds() + 1) / 1000 )
	if f28_local4 ~= f28_local1.lastTime then
		f28_local1.lastTime = f28_local4
		Engine.SetGameLobbyStatusInfo( f28_local1.stage, f28_local4 )
	end
end

Lobby.Pregame.AnyClientInState = function ( f29_arg0, f29_arg1 )
	for f29_local6, f29_local7 in pairs( f29_arg0 ) do
		for f29_local3, f29_local4 in pairs( f29_local7 ) do
			if f29_local4.pregameState == f29_arg1 then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.AllClientsInState = function ( f30_arg0, f30_arg1 )
	for f30_local6, f30_local7 in pairs( f30_arg0 ) do
		for f30_local3, f30_local4 in pairs( f30_local7 ) do
			if f30_arg1[f30_local4.pregameState] == nil then
				return false
			end
		end
	end
	return true
end

Lobby.Pregame.AdvanceStateIfAllClientsSelected = function ()
	local f31_local0 = Lobby.Pregame.GetTeams()
	local f31_local1 = {
		[Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED] = true,
		[Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED] = true
	}
	if Lobby.Pregame.AnyClientInState( f31_local0, Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING ) == false then
		if Lobby.Pregame.AllClientsInState( f31_local0, f31_local1 ) == true then
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.POSTSTAGE )
		else
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.INTERMISSION )
		end
	end
end

Lobby.Pregame.LobbyHost_ClientSelectionReceived = function ( f32_arg0 )
	Lobby.Pregame.AdvanceStateIfAllClientsSelected()
end

Lobby.Pregame.GameLobbyClientDataUpdate = function ( f33_arg0 )
	for f33_local4, f33_local5 in pairs( f33_arg0.clients ) do
		if Engine.IsLocalClient( f33_local5.xuid ) then
			Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f33_arg0.controller ), "clientState" ), f33_local5.pregameState )
			local f33_local3 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.MAX_VOTE_COUNT )
			Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f33_arg0.controller ), "maxVotes" ), f33_local3 )
			if f33_local3 > 0 then
				Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f33_arg0.controller ), "remainingVotes" ), f33_local3 - f33_local5.restrictedItemVoteCount )
			end
		end
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Lobby.Pregame.GetGlobalRoot(), "Update" ) )
end

local f0_local0 = -1
Lobby.Pregame.UpdateLobbyStatusInfo = function ( f34_arg0 )
	local f34_local0 = Lobby.Pregame.GetGlobalRoot()
	Lobby.Pregame.CurrentState = f34_arg0.pregameState
	local f34_local1 = f34_arg0.status
	local f34_local2 = f34_arg0.pregameState
	local f34_local3 = f34_arg0.statusValue
	if f34_local3 < 0 then
		f34_local3 = -1
		f0_local0 = -1
	end
	if f34_local3 ~= f0_local0 then
		f0_local0 = f34_local3
		if f34_local1 == Lobby.Pregame.Stage.ROUND and Engine.GetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f34_arg0.controller ), "clientState" ) ) == Lobby.Pregame.ClientState.SELECTING then
			if f34_local3 <= Lobby.Pregame.Settings.TIMER_WARNING_TIME and Lobby.Pregame.Settings.TIMER_FINAL_TIME < f34_local3 then
				Engine.PlaySound( Lobby.Pregame.Settings.TIMER_WARNING_SOUND )
			elseif f34_local3 <= Lobby.Pregame.Settings.TIMER_FINAL_TIME and f34_local3 >= 0 then
				Engine.PlaySound( Lobby.Pregame.Settings.TIMER_FINAL_SOUND )
			end
		end
	end
	local f34_local4 = Lobby.Pregame.GetStateInfo( f34_local1 )
	if f34_local4 then
		Engine.SetModelValue( Engine.CreateModel( f34_local0, "status" ), f34_local4.statusString )
	end
	Engine.SetModelValue( Engine.CreateModel( f34_local0, "stage" ), f34_local1 )
	Engine.SetModelValue( Engine.CreateModel( f34_local0, "state" ), f34_local2 )
	if f34_local3 == -1 then
		Engine.SetModelValue( Engine.CreateModel( f34_local0, "timeleft" ), "" )
	else
		Engine.SetModelValue( Engine.CreateModel( f34_local0, "timeleft" ), tostring( f34_local3 + 1 ) )
	end
end

