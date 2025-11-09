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
	Engine.LobbyHost_SetClientPregameState( f1_arg0.xuid, Lobby.Pregame.ClientState.SELECTED )
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
	f7_local1.started = true
	f7_local1.stage = f7_arg0
	f7_local1.stateInfo = f7_local2
	f7_local1.startTime = f7_local0
	f7_local1.duration = Engine.GetGametypeSetting( f7_local2.setting )
	f7_local1.endTime = f7_local0 + f7_local1.duration * 1000
	f7_local1.lastTime = -1
	f7_local1.timerCompleteProcessed = false
	f7_local1.data = f7_arg1
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

Lobby.Pregame.SetState = function ( f16_arg0 )
	if Lobby.Pregame.CurrentState ~= f16_arg0 then
		Lobby.Pregame.CurrentState = f16_arg0
		Engine.LobbyHost_SetPregameState( f16_arg0 )
	end
end

Lobby.Pregame.OnMatchEnd = function ( f17_arg0 )
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

Lobby.Pregame.GetRandomUnpickedCharacter = function ( f19_arg0 )
	local f19_local0 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	local f19_local1 = {}
	for f19_local5, f19_local6 in pairs( f19_arg0 ) do
		local f19_local7 = f19_local6.characterDraft.characterIndex
		local f19_local8 = f19_local6.characterDraft.loadout
		if f19_local6.pregameState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED or f19_local6.pregameState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED then
			if f19_local0[f19_local7 + 1].loadouts == nil then
				f19_local0[f19_local7 + 1].loadouts = {}
			end
			f19_local0[f19_local7 + 1].loadouts[f19_local8] = {}
		end
	end
	for f19_local5, f19_local6 in ipairs( f19_local0 ) do
		if f19_local6.disabled == false then
			for f19_local7 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
				local f19_local10 = {
					heroIndex = f19_local5,
					loadoutIndex = f19_local7
				}
				local f19_local11 = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, f19_local5, f19_local7 )
				if f19_local11 and f19_local11.devOnly == false and (f19_local6.loadouts == nil or f19_local6.loadouts[f19_local7] == nil) and Engine.GetItemVote( f19_local11.itemIndex ) ~= Enum.VoteType.VOTE_TYPE_BAN then
					table.insert( f19_local1, f19_local10 )
				end
			end
		end
	end
	if #f19_local1 > 0 then
		f19_local3 = f19_local1[math.random( 1, #f19_local1 )]
		return f19_local3.heroIndex, f19_local3.loadoutIndex
	else
		return 0, 0
	end
end

Lobby.Pregame.StartNextRound = function ()
	local f20_local0 = false
	for f20_local8, f20_local9 in pairs( Lobby.Pregame.GetTeams() ) do
		local f20_local4 = false
		for f20_local5, f20_local6 in pairs( f20_local9 ) do
			if not f20_local4 and f20_local6.pregameState == Lobby.Pregame.ClientState.IDLE then
				Engine.LobbyHost_SetClientPregameState( f20_local6.xuid, Lobby.Pregame.ClientState.SELECTING )
				f20_local4 = true
				f20_local0 = true
			end
		end
	end
	if f20_local0 then
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.ROUND )
	else
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.POSTSTAGE )
	end
end

Lobby.Pregame.StartRoundForAllPlayers = function ()
	for f21_local6, f21_local7 in pairs( Lobby.Pregame.GetTeams() ) do
		for f21_local3, f21_local4 in pairs( f21_local7 ) do
			Engine.LobbyHost_SetClientPregameState( f21_local4.xuid, Lobby.Pregame.ClientState.SELECTING )
		end
	end
	Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.ROUND )
end

Lobby.Pregame.ForcefullyEndRound = function ()
	local f22_local0 = Lobby.Pregame.GetTeams()
	local f22_local1 = Lobby.Pregame.CurrentState
	for f22_local10, f22_local11 in pairs( f22_local0 ) do
		for f22_local7, f22_local8 in pairs( f22_local11 ) do
			if f22_local8.pregameState == Lobby.Pregame.ClientState.SELECTING then
				if f22_local1 == Lobby.Pregame.LobbyState.VOTE then
					Engine.LobbyHost_ForceClientRoundComplete( f22_local8.xuid )
				end
				if f22_local1 == Lobby.Pregame.LobbyState.DRAFT then
					local f22_local5, f22_local6 = Lobby.Pregame.GetRandomUnpickedCharacter( f22_local11 )
					Engine.LobbyHost_ForceClientCharacterSelection( f22_local8.xuid, f22_local5, f22_local6 )
				end
				if f22_local1 == Lobby.Pregame.LobbyState.CAC_EDIT or f22_local1 == Lobby.Pregame.LobbyState.STREAK_EDIT then
					Engine.LobbyHost_ForceClientEditComplete( f22_local8.xuid )
				end
			end
		end
	end
end

Lobby.Pregame.GetAllBannedItems = function ()
	local f23_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local1 = f23_local0.sessionClients
	local f23_local2 = {}
	for f23_local11, f23_local12 in ipairs( f23_local1 ) do
		if f23_local12.voteCount > 0 then
			for f23_local9, f23_local10 in ipairs( f23_local12.votes ) do
				if f23_local10.voteType == Enum.VoteType.VOTE_TYPE_BAN then
					table.insert( f23_local2, f23_local10 )
				end
			end
		end
	end
	return f23_local2
end

Lobby.Pregame.AnyCACItemsBanned = function ()
	for f24_local4, f24_local5 in ipairs( Lobby.Pregame.GetAllBannedItems() ) do
		if f24_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if f24_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local f24_local3 = Engine.GetUnlockableInfoByIndex( f24_local5.itemIndex )
				if not LuaUtils.StartsWith( f24_local3.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f24_local3.loadoutSlot, "killstreak" ) and f24_local3.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if f24_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif f24_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif f24_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.AnyStreaksBanned = function ()
	for f25_local4, f25_local5 in ipairs( Lobby.Pregame.GetAllBannedItems() ) do
		if f25_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN and f25_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local f25_local3 = Engine.GetUnlockableInfoByIndex( f25_local5.itemIndex )
			if LUI.startswith( f25_local3.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

Lobby.Pregame.OnStageEnd = function ( f26_arg0 )
	local f26_local0 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED )
	local f26_local1 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED )
	local f26_local2 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.ALWAYS_EDIT_CAC )
	local f26_local3 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.ALWAYS_EDIT_STREAKS )
	Engine.LobbyHost_SetAllClientsPregameState( Lobby.Pregame.ClientState.IDLE )
	if f26_arg0 == Lobby.Pregame.LobbyState.VOTE then
		if f26_local0 == 1 then
			Lobby.Pregame.PostVoteShuffle()
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.DRAFT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		elseif f26_local2 == 1 or Lobby.Pregame.AnyCACItemsBanned() then
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.CAC_EDIT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		else
			Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.CAC_EDIT )
		end
	elseif f26_arg0 == Lobby.Pregame.LobbyState.DRAFT then
		if f26_local1 == 1 then
			if f26_local2 == 1 or Lobby.Pregame.AnyCACItemsBanned() then
				Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.CAC_EDIT )
				Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
			else
				Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.CAC_EDIT )
			end
		else
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.LAUNCH_GAME )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.LAUNCH )
		end
	elseif f26_arg0 == Lobby.Pregame.LobbyState.CAC_EDIT then
		if f26_local3 == 1 or Lobby.Pregame.AnyStreaksBanned() then
			Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.STREAK_EDIT )
			Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.PRESTAGE )
		else
			Lobby.Pregame.OnStageEnd( Lobby.Pregame.LobbyState.STREAK_EDIT )
		end
	elseif f26_arg0 == Lobby.Pregame.LobbyState.STREAK_EDIT then
		Lobby.Pregame.SetState( Lobby.Pregame.LobbyState.LAUNCH_GAME )
		Lobby.Pregame.StartTimer( Lobby.Pregame.Stage.LAUNCH )
	else
		error( "Lobby.Pregame.OnStageEnd - unhandled lobby state" )
	end
end

Lobby.Pregame.CheckTimer = function ( f27_arg0 )
	local f27_local0 = Lobby.Pregame.Timer
	if f27_local0.started ~= true then
		return 
	end
	local f27_local1 = Engine.milliseconds()
	local f27_local2 = f27_local0.stage
	if f27_local0.startTime == f27_local0.endTime then
		Engine.SetGameLobbyStatusInfo( f27_local0.stage, -1 )
		f27_local0.lastTime = -1
		return 
	elseif f27_local0.endTime < f27_local1 and not f27_local0.timerCompleteProcessed then
		Lobby.Pregame.Timer.timerCompleteProcessed = true
		local f27_local3 = Lobby.Pregame.CurrentState
		if f27_local2 == Lobby.Pregame.Stage.PRESTAGE then
			if f27_local3 == Lobby.Pregame.LobbyState.CAC_EDIT or f27_local3 == Lobby.Pregame.LobbyState.STREAK_EDIT then
				Lobby.Pregame.StartRoundForAllPlayers()
			else
				Lobby.Pregame.StartNextRound()
			end
		elseif f27_local2 == Lobby.Pregame.Stage.ROUND then
			Lobby.Pregame.ForcefullyEndRound()
		elseif f27_local2 == Lobby.Pregame.Stage.INTERMISSION then
			Lobby.Pregame.StartNextRound()
		elseif f27_local2 == Lobby.Pregame.Stage.POSTSTAGE then
			Lobby.Pregame.OnStageEnd( f27_arg0 )
		elseif f27_local2 == Lobby.Pregame.Stage.LAUNCH then
			Lobby.Pregame.LaunchGame()
		end
	end
	local f27_local3 = math.floor( (f27_local0.endTime - Engine.milliseconds() + 1) / 1000 )
	if f27_local3 ~= f27_local0.lastTime then
		f27_local0.lastTime = f27_local3
		Engine.SetGameLobbyStatusInfo( f27_local0.stage, f27_local3 )
	end
end

Lobby.Pregame.Pump = function ()
	local f28_local0 = Engine.GetLobbyPregameState()
	if f28_local0 == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
		return 
	else
		Lobby.Pregame.CheckTimer( f28_local0 )
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

Lobby.Pregame.LobbyHost_ClientSelectionReceived = function ( f31_arg0 )
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

Lobby.Pregame.GameLobbyClientDataUpdate = function ( f32_arg0 )
	for f32_local4, f32_local5 in pairs( f32_arg0.clients ) do
		if Engine.IsLocalClient( f32_local5.xuid ) then
			Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f32_arg0.controller ), "clientState" ), f32_local5.pregameState )
			local f32_local3 = Engine.GetGametypeSetting( Lobby.Pregame.Settings.MAX_VOTE_COUNT )
			if f32_local3 > 0 then
				Engine.SetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f32_arg0.controller ), "remainingVotes" ), f32_local3 - f32_local5.restrictedItemVoteCount )
			end
		end
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Lobby.Pregame.GetGlobalRoot(), "Update" ) )
end

local f0_local0 = -1
Lobby.Pregame.UpdateLobbyStatusInfo = function ( f33_arg0 )
	local f33_local0 = Lobby.Pregame.GetGlobalRoot()
	Lobby.Pregame.CurrentState = f33_arg0.pregameState
	local f33_local1 = f33_arg0.status
	local f33_local2 = f33_arg0.pregameState
	local f33_local3 = f33_arg0.statusValue
	if f33_local3 < 0 then
		f33_local3 = -1
		f0_local0 = -1
	end
	if f33_local3 ~= f0_local0 then
		f0_local0 = f33_local3
		if f33_local1 == Lobby.Pregame.Stage.ROUND and Engine.GetModelValue( Engine.CreateModel( Lobby.Pregame.GetRootModelForController( f33_arg0.controller ), "clientState" ) ) == Lobby.Pregame.ClientState.SELECTING then
			if f33_local3 <= Lobby.Pregame.Settings.TIMER_WARNING_TIME and Lobby.Pregame.Settings.TIMER_FINAL_TIME < f33_local3 then
				Engine.PlaySound( Lobby.Pregame.Settings.TIMER_WARNING_SOUND )
			elseif f33_local3 <= Lobby.Pregame.Settings.TIMER_FINAL_TIME and f33_local3 >= 0 then
				Engine.PlaySound( Lobby.Pregame.Settings.TIMER_FINAL_SOUND )
			end
		end
	end
	local f33_local4 = Lobby.Pregame.GetStateInfo( f33_local1 )
	if f33_local4 then
		Engine.SetModelValue( Engine.CreateModel( f33_local0, "status" ), f33_local4.statusString )
	end
	Engine.SetModelValue( Engine.CreateModel( f33_local0, "stage" ), f33_local1 )
	Engine.SetModelValue( Engine.CreateModel( f33_local0, "state" ), f33_local2 )
	if f33_local3 == -1 then
		Engine.SetModelValue( Engine.CreateModel( f33_local0, "timeleft" ), "" )
	else
		Engine.SetModelValue( Engine.CreateModel( f33_local0, "timeleft" ), tostring( f33_local3 + 1 ) )
	end
end

