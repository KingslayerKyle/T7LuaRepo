-- 244259c0a0fe97b2ec5ddc5efec63530
-- This hash is used for caching, delete to decompile the file again

require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.LobbyPregameManager" )
require( "lua.Shared.LobbyData" )
require( "lua.Shared.LuaEnums" )

Lobby.Timer = {}
Lobby.Timer.MATCH_START_INVALID = -1
Lobby.Timer.LOBBY_STATUS = {
	NOT_RUNNING = -1,
	IDLE = 0,
	WAIT_FOR_LOBBY_LOCK = 1,
	VOTING = 2,
	BEGIN = 3,
	RESET_TO_NEED = 4,
	NEED_PLAYERS = 5,
	NEED_BALANCE = 6,
	NEED_READYUP = 7,
	STARTING = 8,
	POST_GAME = 9,
	FIND_NEW_LOBBY = 10
}
Lobby.Timer.LOBBY_STATUS_STRING = {
	[Lobby.Timer.LOBBY_STATUS.NOT_RUNNING] = "NOT RUNNING",
	[Lobby.Timer.LOBBY_STATUS.IDLE] = "IDLE",
	[Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK] = "WAIT FOR LOBBY LOCK",
	[Lobby.Timer.LOBBY_STATUS.VOTING] = "VOTING",
	[Lobby.Timer.LOBBY_STATUS.BEGIN] = "BEGIN",
	[Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED] = "RESET TO NEED",
	[Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS] = "NEED PLAYERS",
	[Lobby.Timer.LOBBY_STATUS.NEED_BALANCE] = "NEED BALANCE",
	[Lobby.Timer.LOBBY_STATUS.NEED_READYUP] = "NEED READYUP",
	[Lobby.Timer.LOBBY_STATUS.STARTING] = "STARTING",
	[Lobby.Timer.LOBBY_STATUS.POST_GAME] = "POST GAME",
	[Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY] = "FIND NEW LOBBY"
}
Lobby.Timer.lastValue = 0
Lobby.Timer.lobbyTimer = nil
Lobby.Timer.ResetUIModel = function ()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" ), 0 )
end

Lobby.Timer.OnSessionStart = function ( f2_arg0 )
	local f2_local0 = f2_arg0.lobbyModule
	local f2_local1 = f2_arg0.lobbyType
	local f2_local2 = f2_arg0.lobbyMode
	if f2_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
	end
end

Lobby.Timer.OnSessionEnd = function ( f3_arg0 )
	Lobby.Timer.ResetUIModel()
end

Lobby.Timer.OnMatchStart = function ( f4_arg0 )
	local f4_local0 = f4_arg0.lobbyModule
	local f4_local1 = f4_arg0.lobbyType
	local f4_local2 = f4_arg0.lobbyMode
	Lobby.Timer.Clear( true )
	Lobby.Pregame.OnMatchStart( f4_arg0 )
end

Lobby.Timer.OnMatchEnd = function ( f5_arg0 )
	local f5_local0 = f5_arg0.lobbyModule
	local f5_local1 = f5_arg0.lobbyType
	local f5_local2 = f5_arg0.lobbyMode
	if f5_local0 ~= Enum.LobbyModule.LOBBY_MODULE_HOST or f5_local1 ~= Enum.LobbyType.LOBBY_TYPE_GAME or not Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	end
	local f5_local3 = Engine.GetLobbyHostControllerIndex( Enum.LobbyType.LOBBY_TYPE_GAME )
	if f5_local3 == -1 then
		f5_local3 = 0
	end
	local f5_local4 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.MatchEnd: Game must have ended, start host timer.\n" )
	local f5_local5 = {
		controller = f5_local3,
		lobbyType = f5_local1,
		mainMode = f5_local4.mainMode,
		lobbyTimerType = f5_local4.lobbyTimerType,
		matchEnded = true
	}
	Lobby.Timer.HostingLobby( f5_local5 )
	Lobby.Pregame.OnMatchEnd( f5_local5 )
end

Lobby.Timer.OnClientRemoved = function ( f6_arg0 )
	if Lobby.Timer.lobbyTimer == nil then
		return 
	elseif LuaUtils.IsArenaMode() and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and Lobby.Timer.lobbyTimer.status <= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
		Engine.SetGameLobbyStatusInfo( Lobby.Timer.lobbyTimer.status, 0 )
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
	end
end

Lobby.Timer.LockInLobby = function ( f7_arg0 )
	if LuaUtils.IsArenaMode() then
		if not Lobby.Timer.LobbyIsLocked() and Engine.DvarBool( 0, "probation_league_enabled" ) then
			Engine.SetArenaPregameMatchHistory( f7_arg0 )
		end
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyLockedIn" ), true )
	end
end

Lobby.Timer.LobbyIsLocked = function ()
	if LuaUtils.IsArenaMode() then
		return LuaUtils.LobbyIsLocked()
	else
		return false
	end
end

Lobby.Timer.UnlockLobby = function ( f9_arg0, f9_arg1 )
	if Lobby.Timer.LobbyIsLocked() and f9_arg1 == true and Engine.DvarBool( 0, "probation_league_enabled" ) then
		Engine.RollbackArenaPregameMatchHistory( f9_arg0 )
	end
	LuaUtils.UnlockLobby()
end

Lobby.Timer.UpdateAdvertising = function ( f10_arg0 )
	if Engine.DvarBool( nil, "lobbyAdvertiseShowInMatchmaking" ) == f10_arg0 then
		return 
	elseif f10_arg0 then
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE, true )
	else
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_FALSE, true )
	end
end

Lobby.Timer.Clear = function ( f11_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
	if Lobby.Timer.lobbyTimer and (Lobby.Timer.lobbyTimer.lobbyTimerType == LuaEnums.TIMER_TYPE.AUTO_ZM or Lobby.Timer.lobbyTimer.lobbyTimerType == LuaEnums.TIMER_TYPE.AUTO_CP) then
		Engine.ClearReadyUpData( Enum.LobbyModule.LOBBY_MODULE_HOST )
		Engine.ClearReadyUpData( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	end
	Lobby.Timer.ResetUIModel()
	if f11_arg0 == true then
		Engine.SetGameLobbyStatusInfo( Lobby.Timer.LOBBY_STATUS.IDLE, 0 )
	end
	Lobby.Timer.lastValue = 0
	Lobby.Timer.lobbyTimer = nil
end

Lobby.Timer.GetTimerType = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return LuaEnums.TIMER_TYPE.INVALID
	else
		return Lobby.Timer.lobbyTimer.lobbyTimerType
	end
end

Lobby.Timer.GetTimerStatus = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return Lobby.Timer.LOBBY_STATUS.NOT_RUNNING
	else
		return Lobby.Timer.lobbyTimer.status
	end
end

Lobby.Timer.AutoCPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f14_local0 = Lobby.Timer.lobbyTimer.controller
	local f14_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f14_local2 = Lobby.Timer.lobbyTimer.status
	local f14_local3 = Lobby.Timer.lobbyTimer.endTime
	local f14_local4 = 0
	local f14_local5 = 0
	local f14_local6 = Engine.GetLobbyClientCount( f14_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f14_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local f14_local8 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f14_local9 = 0
	local f14_local10 = Dvar.party_minplayers:get()
	local f14_local11 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL )
	local f14_local12 = 0
	local f14_local13 = f14_local11
	local f14_local14 = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_HOST )
	for f14_local18, f14_local19 in pairs( f14_local14.clients ) do
		if f14_local19.readyUp == true then
			f14_local12 = f14_local12 + 1
		end
	end
	if f14_local13 < f14_local10 then
		f14_local13 = f14_local10
	end
	f14_local15 = math.floor( math.ceil( Dvar.lobby_readyUpPercentRequired:get() * f14_local13 ) - f14_local12 )
	if f14_local6 then
		f14_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
		f14_local3 = Lobby.Timer.MATCH_START_INVALID
	elseif f14_local3 == Lobby.Timer.MATCH_START_INVALID then
		f14_local3 = Engine.milliseconds() + Dvar.lobbyCPTimerStartInterval:get()
		if (Engine.IsCampaignModeZombies() or Dvar.ui_gametype:get() == "doa") and Dvar.lobbyCPZMTimerStartInterval.exists() then
			f14_local3 = Engine.milliseconds() + Dvar.lobbyCPZMTimerStartInterval:get()
		end
		if Dvar.ui_gametype:get() == "doa" then
			Engine.GameLobbySetMap( "cp_doa_bo3" )
			f14_local2 = Lobby.Timer.LOBBY_STATUS.NEED_READYUP
		end
	elseif f14_local2 == Lobby.Timer.LOBBY_STATUS.NEED_READYUP then
		if 0 < Dvar.lobby_readyUpPercentRequired:get() then
			if f14_local15 > 0 then
				f14_local16 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
				if f14_local15 == 1 then
					Engine.SetModelValue( f14_local16, Engine.Localize( "MENU_WAITING_FOR_PLAYER_TO_BE_READY" ) )
				else
					Engine.SetModelValue( f14_local16, Engine.Localize( "MENU_WAITING_FOR_PLAYERS_TO_BE_READY", f14_local15 ) )
				end
				f14_local4 = f14_local15
			else
				f14_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
				f14_local3 = Engine.milliseconds() + Dvar.lobbyCPTimerStartInterval:get()
			end
		else
			f14_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		end
	elseif f14_local3 ~= Lobby.Timer.MATCH_START_INVALID then
		f14_local16 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f14_local5 = math.floor( (f14_local3 - Engine.milliseconds()) / 1000 )
		f14_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		if f14_local5 > 0 then
			Engine.SetModelValue( f14_local16, Engine.Localize( "MENU_GAME_STARTING_IN", f14_local5 ) )
			f14_local9 = f14_local5
		else
			Engine.SetModelValue( f14_local16, "" )
		end
		if Dvar.ui_gametype:get() == "doa" and 0 < Dvar.lobby_readyUpPercentRequired:get() and f14_local15 > 0 then
			f14_local2 = Lobby.Timer.LOBBY_STATUS.NEED_READYUP
			f14_local4 = Lobby.Timer.MATCH_START_INVALID
		end
		if f14_local5 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f14_local5
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f14_local7, 1 )
			if f14_local5 <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f14_local5 .. "\n" )
			end
		end
		f14_local17 = false
		if Engine.IsLobbyMigratActive then
			f14_local17 = Engine.IsLobbyMigratActive( Enum.LobbyType.LOBBY_TYPE_GAME )
		end
		if Lobby.ProcessQueue.IsQueueEmpty() and f14_local17 == false and f14_local5 <= 0 and LobbyVM.LaunchGameExec( f14_local0, f14_local1 ) == true then
			Engine.SetModelValue( f14_local16, "" )
			f14_local3 = Lobby.Timer.MATCH_START_INVALID
			Lobby.Timer.Clear( true )
			return 
		end
		f14_local4 = math.max( f14_local5, 0 )
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f14_local7, 0 )
	end
	Engine.SetModelValue( f14_local8, f14_local9 )
	Engine.SetGameLobbyStatusInfo( f14_local2, f14_local4 )
	Lobby.Timer.lobbyTimer.status = f14_local2
	Lobby.Timer.lobbyTimer.endTime = f14_local3
end

Lobby.Timer.AutoCPPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return true
	else
		Lobby.MapVote.Hide()
		Lobby.Timer.Clear( false )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.AutoMPPumpEnd: Kill lobby timer.\n" )
		return true
	end
end

Lobby.Timer.AutoCPPumpClient = function ( f16_arg0 )
	local f16_local0 = f16_arg0.controller
	local f16_local1 = f16_arg0.lobbyType
	local f16_local2 = f16_arg0.status
	local f16_local3 = f16_arg0.statusValue
	local f16_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f16_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f16_local6 = 0
	if f16_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f16_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f16_local4, "" )
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f16_local3 > 0 then
			Engine.SetModelValue( f16_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f16_local3 ) )
			f16_local6 = f16_local3
		else
			Engine.SetModelValue( f16_local4, "" )
		end
		if f16_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f16_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f16_local3 .. "\n" )
		end
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.NEED_READYUP then
		local f16_local7 = f16_local3
		if f16_local7 == 1 then
			Engine.SetModelValue( f16_local4, Engine.Localize( "MENU_WAITING_FOR_PLAYER_TO_BE_READY" ) )
		else
			Engine.SetModelValue( f16_local4, Engine.Localize( "MENU_WAITING_FOR_PLAYERS_TO_BE_READY", f16_local7 ) )
		end
	end
	Engine.SetModelValue( f16_local5, f16_local6 )
end

Lobby.Timer.AutoMPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f17_local0 = Lobby.Timer.lobbyTimer.controller
	local f17_local1 = Lobby.Timer.lobbyTimer.lobbyType
	local f17_local2 = Lobby.Timer.lobbyTimer.mainMode
	local f17_local3 = Lobby.Timer.lobbyTimer.lobbyTimerType
	local f17_local4 = Lobby.Timer.lobbyTimer.status
	local f17_local5 = 0
	local f17_local6 = Lobby.Timer.lobbyTimer.endTime
	local f17_local7 = 0
	local f17_local8 = Engine.GetLobbyClientCount( f17_local1 )
	local f17_local9 = math.max( 0, Dvar.party_minplayers:get() - f17_local8 )
	local f17_local10 = f17_local8 == 0
	local f17_local11 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f17_local12 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f17_local13 = 0
	local f17_local14 = 0
	LobbyVM.CheckSpecialPlaylistRules( f17_local0 )
	if f17_local6 ~= Lobby.Timer.MATCH_START_INVALID then
		f17_local7 = math.floor( math.max( 0, f17_local6 - Engine.milliseconds() ) / 1000 )
	end
	if f17_local4 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	f17_local5 = f17_local7
	if f17_local10 or f17_local4 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		if LuaUtils.IsArenaMode() then
			f17_local4 = Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK
		elseif LuaUtils.Mods_IsUsingMods() then
			f17_local4 = Lobby.Timer.LOBBY_STATUS.BEGIN
		else
			f17_local4 = Lobby.Timer.LOBBY_STATUS.VOTING
		end
		f17_local6 = Lobby.Timer.MATCH_START_INVALID
	elseif f17_local4 == Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK then
		Lobby.Timer.UnlockLobby( f17_local0, true )
		if f17_local9 > 0 then
			if f17_local9 == 1 then
				Engine.SetModelValue( f17_local11, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
			else
				Engine.SetModelValue( f17_local11, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f17_local9 ) )
			end
			f17_local6 = Lobby.Timer.MATCH_START_INVALID
			f17_local4 = Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK
			f17_local5 = f17_local9
		else
			Lobby.Timer.LockInLobby( f17_local0 )
			Lobby.TeamSelection.AutoSplitTeam( true, true )
			Lobby.MapVote.UpdateMapVoteInfo()
			Lobby.MapVote.LockedInVote()
			Engine.LobbyHost_SetAllClientsPregameState( Lobby.Pregame.ClientState.IDLE )
			f17_local6 = Lobby.Timer.MATCH_START_INVALID
			f17_local4 = Lobby.Timer.LOBBY_STATUS.BEGIN
		end
	elseif f17_local4 == Lobby.Timer.LOBBY_STATUS.VOTING then
		Lobby.MapVote.ShowVote()
		if f17_local6 == Lobby.Timer.MATCH_START_INVALID then
			f17_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusVotingInterval:get()
			if LuaUtils.IsArenaMode() then
				if Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1 and Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1 then
					f17_local6 = Engine.milliseconds() + Engine.DvarInt( 0, "lobbyTimerStatusVotingInterval_Arena" )
				end
			else
				Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
			end
		else
			Engine.SetModelValue( f17_local11, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. f17_local7 )
			if math.max( 0, f17_local6 - Engine.milliseconds() ) == 0 then
				f17_local6 = Lobby.Timer.MATCH_START_INVALID
				f17_local4 = Lobby.Timer.LOBBY_STATUS.BEGIN
				Lobby.MapVote.LockedInVote()
			end
		end
	elseif f17_local4 == Lobby.Timer.LOBBY_STATUS.BEGIN then
		Lobby.MapVote.ShowLockedIn()
		if f17_local6 == Lobby.Timer.MATCH_START_INVALID then
			f17_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusBeginInterval:get()
		else
			Engine.SetModelValue( f17_local11, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
			if math.max( 0, f17_local6 - Engine.milliseconds() ) == 0 then
				f17_local6 = Lobby.Timer.MATCH_START_INVALID
				f17_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
				if LuaUtils.IsArenaMode() then
					f17_local4 = Lobby.Timer.LOBBY_STATUS.STARTING
				end
			end
		end
	elseif f17_local4 == Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED then
		f17_local6 = Lobby.Timer.MATCH_START_INVALID
		f17_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
		if LuaUtils.IsArenaMode() then
			f17_local4 = Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK
			Lobby.MapVote.Hide()
			Engine.SetModelValue( f17_local11, "" )
			Lobby.Timer.UpdateAdvertising( true )
		end
	elseif f17_local4 == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		Lobby.MapVote.ShowLockedIn()
		if f17_local9 > 0 then
			if f17_local9 == 1 then
				Engine.SetModelValue( f17_local11, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
				f17_local13 = f17_local7
			else
				Engine.SetModelValue( f17_local11, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f17_local9 ) )
			end
			f17_local6 = Lobby.Timer.MATCH_START_INVALID
			f17_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			f17_local5 = f17_local9
		else
			f17_local6 = Lobby.Timer.MATCH_START_INVALID
			f17_local4 = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
			Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		end
	elseif f17_local4 == Lobby.Timer.LOBBY_STATUS.NEED_BALANCE then
		Lobby.MapVote.ShowLockedIn()
		if f17_local9 > 0 then
			f17_local6 = Lobby.Timer.MATCH_START_INVALID
			f17_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		else
			local f17_local15 = false
			if Engine.milliseconds() - Lobby.Timer.lobbyTimer.balanceStartTime > 10000 then
				f17_local15 = true
				Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
			end
			if Lobby.TeamSelection.AutoSplitTeam( true, f17_local15 ) then
				f17_local6 = Lobby.Timer.MATCH_START_INVALID
				f17_local4 = Lobby.Timer.LOBBY_STATUS.STARTING
				if Dvar.lobbyMigrate_migrateToBestGameHostEnabled:get() == true then
					Engine.MigrateToBestGameHost( f17_local0 )
				end
			else
				f17_local6 = Lobby.Timer.MATCH_START_INVALID
				f17_local4 = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
				Engine.SetModelValue( f17_local11, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS_TEAMS" ) )
			end
		end
	elseif f17_local4 == Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.MapVote.ShowLockedIn()
		if f17_local9 > 0 then
			if LuaUtils.IsArenaMode() then
				f17_local6 = Lobby.Timer.MATCH_START_INVALID
				f17_local4 = Lobby.Timer.LOBBY_STATUS.IDLE
				Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
				Lobby.Timer.UnlockLobby( f17_local0, true )
			else
				f17_local6 = Lobby.Timer.MATCH_START_INVALID
				f17_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
				Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
			end
		elseif not LuaUtils.IsArenaMode() and Lobby.TeamSelection.AutoSplitTeam( true, false ) == false then
			f17_local6 = Lobby.Timer.MATCH_START_INVALID
			f17_local4 = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
			Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
		else
			f17_local4 = Lobby.Timer.LOBBY_STATUS.STARTING
			if f17_local6 == Lobby.Timer.MATCH_START_INVALID then
				f17_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusStartInterval:get()
			else
				if f17_local7 > 0 then
					Engine.SetModelValue( f17_local11, Engine.Localize( "MENU_GAME_STARTING_IN", f17_local7 ) )
					f17_local13 = f17_local7
				else
					Engine.SetModelValue( f17_local11, "" )
				end
				if f17_local7 ~= Lobby.Timer.lastValue then
					Lobby.Timer.lastValue = f17_local7
					Engine.PlaySound( LobbyData.Sounds.TimerTick )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f17_local7 .. "\n" )
				end
				if not LuaUtils.AllClientsSpectating() and (Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED ) == 1 or Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED ) == 1) and f17_local7 <= 0 then
					Lobby.Timer.UpdateAdvertising( false )
					Lobby.Pregame.Start()
					Lobby.Timer.Clear( false )
					return 
				end
				local f17_local15 = false
				if Engine.IsLobbyMigratActive then
					f17_local15 = Engine.IsLobbyMigratActive( Enum.LobbyType.LOBBY_TYPE_GAME )
				end
				if Lobby.ProcessQueue.IsQueueEmpty() and f17_local15 == false and f17_local7 <= 0 then
					if not LuaUtils.IsArenaMode() then
						Lobby.TeamSelection.AutoSplitTeam( true, true )
					end
					if LobbyVM.LaunchGameExec( f17_local0, f17_local1 ) == true then
						Lobby.Timer.lobbyTimer.endFunc()
						Lobby.Timer.Clear( true )
						Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
						return 
					end
				end
			end
		end
	elseif f17_local4 == Lobby.Timer.LOBBY_STATUS.POST_GAME then
		Lobby.MapVote.ShowEndResult()
		if f17_local6 == Lobby.Timer.MATCH_START_INVALID then
			f17_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusPostGameInterval:get()
		else
			Engine.SetModelValue( f17_local11, Engine.Localize( "MENU_GAME_ENDED" ) .. ": " .. f17_local7 )
			if math.max( 0, f17_local6 - Engine.milliseconds() ) == 0 then
				if LuaUtils.IsArenaMode() then
					f17_local6 = Lobby.Timer.MATCH_START_INVALID
					f17_local4 = Lobby.Timer.LOBBY_STATUS.IDLE
					Engine.LobbyHost_SetAllClientsPregameState( Lobby.Pregame.ClientState.END )
				else
					f17_local6 = Lobby.Timer.MATCH_START_INVALID
					f17_local4 = Lobby.Timer.LOBBY_STATUS.IDLE
				end
			end
		end
	elseif f17_local4 == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY then
		local f17_local15 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f17_local16 = {}
		for f17_local20, f17_local21 in ipairs( f17_local15.sessionClients ) do
			if f17_local16[f17_local21.simpleLobbyID] == nil then
				f17_local16[f17_local21.simpleLobbyID] = {}
			end
			table.insert( f17_local16[f17_local21.simpleLobbyID], f17_local21 )
		end
		if Engine.IsDedicatedServer() then
			f17_local17 = 0
			f17_local18 = nil
			for f17_local22, f17_local23 in pairs( f17_local16 ) do
				if f17_local17 < #f17_local23 then
					f17_local17 = #f17_local23
					f17_local18 = f17_local23
				end
			end
			if f17_local18 ~= nil then
				for f17_local22, f17_local23 in ipairs( f17_local16 ) do
					if f17_local23 ~= f17_local18 then
						for f17_local27, f17_local28 in pairs( f17_local23 ) do
							Engine.LobbyHost_DisconnectClient( f17_local0, Enum.LobbyType.LOBBY_TYPE_GAME, f17_local28.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_HOSTRELOAD )
						end
					end
				end
			end
		else
			for f17_local20, f17_local21 in ipairs( f17_local16 ) do
				if f17_local21 ~= partyToStay then
					for f17_local25, f17_local26 in pairs( f17_local21 ) do
						Engine.LobbyHost_DisconnectClient( f17_local0, Enum.LobbyType.LOBBY_TYPE_GAME, f17_local26.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_HOSTRELOAD )
					end
				end
			end
		end
		Lobby.TeamSelection.Clear()
		Lobby.MapVote.Hide()
		f17_local6 = Lobby.Timer.MATCH_START_INVALID
		f17_local4 = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.UpdateAdvertising( true )
	end
	if Lobby.Timer.lobbyTimer.status ~= f17_local4 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.AutoMPPump status update: " .. Lobby.Timer.LOBBY_STATUS_STRING[f17_local4] .. ".\n" )
	end
	Lobby.Timer.lobbyTimer.status = f17_local4
	Lobby.Timer.lobbyTimer.endTime = f17_local6
	Engine.SetModelValue( f17_local12, f17_local13 )
	Engine.SetGameLobbyStatusInfo( Lobby.Timer.lobbyTimer.status, f17_local5 )
end

Lobby.Timer.AutoMPPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true ), 0 )
		Lobby.Timer.Clear( false )
		Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.AutoMPPumpEnd: Kill lobby timer.\n" )
		return true
	end
end

Lobby.Timer.AutoMPPumpClient = function ( f19_arg0 )
	local f19_local0 = f19_arg0.controller
	local f19_local1 = f19_arg0.lobbyType
	local f19_local2 = f19_arg0.status
	local f19_local3 = f19_arg0.statusValue
	local f19_local4 = f19_arg0.statusValue
	if Engine.IsLobbyHost( f19_local1 ) then
		return 
	end
	local f19_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f19_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f19_local7 = 0
	if f19_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	if f19_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		Engine.SetModelValue( f19_local5, "" )
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK then
		Lobby.Timer.UnlockLobby( f19_local0, true )
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED then
		Lobby.Timer.UnlockLobby( f19_local0, true )
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.VOTING then
		if LuaUtils.IsArenaMode() then
			Lobby.Timer.LockInLobby( f19_local0 )
		end
		Lobby.MapVote.ShowVote()
		Engine.SetModelValue( f19_local5, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. f19_local3 )
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.BEGIN then
		if LuaUtils.IsArenaMode() then
			Lobby.Timer.LockInLobby( f19_local0 )
		end
		Lobby.MapVote.ShowLockedIn()
		Engine.SetModelValue( f19_local5, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		Lobby.MapVote.ShowLockedIn()
		if f19_local4 == 1 then
			Engine.SetModelValue( f19_local5, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
		else
			Engine.SetModelValue( f19_local5, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f19_local4 ) )
		end
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.NEED_BALANCE then
		Lobby.MapVote.ShowLockedIn()
		Engine.SetModelValue( f19_local5, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS_TEAMS" ) )
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.MapVote.ShowLockedIn()
		if f19_local3 > 0 then
			Engine.SetModelValue( f19_local5, Engine.Localize( "MENU_GAME_STARTING_IN", f19_local3 ) )
			f19_local7 = f19_local3
		else
			Engine.SetModelValue( f19_local5, "" )
		end
		if f19_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f19_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f19_local3 .. "\n" )
		end
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.POST_GAME then
		Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
		Lobby.MapVote.ShowEndResult()
		if f19_local3 > 0 then
			Engine.SetModelValue( f19_local5, Engine.Localize( "MENU_GAME_ENDED" ) .. ": " .. f19_local3 )
		else
			Engine.SetModelValue( f19_local5, "" )
		end
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY then
		Lobby.MapVote.Hide()
		Engine.SetModelValue( f19_local5, "" )
	end
	Engine.SetModelValue( f19_local6, f19_local7 )
end

Lobby.Timer.AutoZMPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f20_local0 = Lobby.Timer.lobbyTimer.controller
	local f20_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f20_local2 = Lobby.Timer.lobbyTimer.status
	local f20_local3 = 0
	local f20_local4 = Lobby.Timer.lobbyTimer.endTime
	local f20_local5 = 0
	local f20_local6 = Engine.GetLobbyClientCount( f20_local1 )
	local f20_local7 = Dvar.party_minplayers:get()
	local f20_local8 = math.max( 0, f20_local7 - f20_local6 )
	local f20_local9 = f20_local6 == 0
	Lobby.MapVote.ShowLockedIn()
	local f20_local10 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f20_local11 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local f20_local12 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f20_local13 = 0
	local f20_local14 = Engine.GetLobbyMaxClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f20_local15 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL )
	local f20_local16 = 0
	local f20_local17 = f20_local15
	local f20_local18 = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_HOST )
	for f20_local22, f20_local23 in pairs( f20_local18.clients ) do
		if f20_local23.readyUp == true then
			f20_local16 = f20_local16 + 1
		end
	end
	if f20_local17 < f20_local7 then
		f20_local17 = f20_local7
	end
	f20_local19 = math.floor( math.ceil( Dvar.lobby_readyUpPercentRequired:get() * f20_local17 ) - f20_local16 )
	if f20_local9 then
		f20_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
		f20_local3 = Lobby.Timer.MATCH_START_INVALID
	elseif f20_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		f20_local2 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
		f20_local3 = Lobby.Timer.MATCH_START_INVALID
	elseif f20_local2 == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		if f20_local8 > 0 then
			if f20_local8 == 1 then
				Engine.SetModelValue( f20_local10, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
				f20_local13 = f20_local5
			else
				Engine.SetModelValue( f20_local10, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f20_local8 ) )
			end
			f20_local2 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			f20_local3 = Lobby.Timer.MATCH_START_INVALID
			f20_local3 = f20_local8
		else
			f20_local2 = Lobby.Timer.LOBBY_STATUS.NEED_READYUP
		end
	elseif f20_local2 == Lobby.Timer.LOBBY_STATUS.NEED_READYUP then
		if 0 < Dvar.lobby_readyUpPercentRequired:get() then
			if f20_local8 > 0 then
				f20_local2 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
				f20_local3 = Lobby.Timer.MATCH_START_INVALID
			elseif f20_local19 > 0 then
				if f20_local19 == 1 then
					Engine.SetModelValue( f20_local10, Engine.Localize( "MENU_WAITING_FOR_PLAYER_TO_BE_READY" ) )
				else
					Engine.SetModelValue( f20_local10, Engine.Localize( "MENU_WAITING_FOR_PLAYERS_TO_BE_READY", f20_local19 ) )
				end
				f20_local3 = f20_local19
			else
				f20_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
				f20_local4 = Engine.milliseconds() + Dvar.lobbyTimerZMStartInterval:get()
			end
		else
			f20_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
			f20_local4 = Engine.milliseconds() + Dvar.lobbyTimerZMStartInterval:get()
		end
	elseif f20_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f20_local8 > 0 then
			f20_local2 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			f20_local3 = Lobby.Timer.MATCH_START_INVALID
		elseif 0 < Dvar.lobby_readyUpPercentRequired:get() and f20_local19 > 0 then
			f20_local2 = Lobby.Timer.LOBBY_STATUS.NEED_READYUP
			f20_local3 = Lobby.Timer.MATCH_START_INVALID
		else
			f20_local5 = math.floor( (f20_local4 - Engine.milliseconds()) / 1000 )
			if f20_local5 > 0 then
				Engine.SetModelValue( f20_local10, Engine.Localize( "MENU_GAME_STARTING_IN", f20_local5 ) )
				f20_local13 = f20_local5
			else
				Engine.SetModelValue( f20_local10, "" )
			end
			if f20_local5 ~= Lobby.Timer.lastValue then
				Lobby.Timer.lastValue = f20_local5
				Engine.SetModelValue( f20_local11, 1 )
				if f20_local5 <= 10 then
					Engine.PlaySound( LobbyData.Sounds.TimerTick )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f20_local5 .. "\n" )
				end
			end
			f20_local20 = false
			if Engine.IsLobbyMigratActive then
				f20_local20 = Engine.IsLobbyMigratActive( Enum.LobbyType.LOBBY_TYPE_GAME )
			end
			if Lobby.ProcessQueue.IsQueueEmpty() and f20_local20 == false and f20_local5 <= 0 and LobbyVM.LaunchGameExec( f20_local0, f20_local1 ) == true then
				Engine.SetModelValue( f20_local10, "" )
				f20_local4 = Lobby.Timer.MATCH_START_INVALID
				Lobby.Timer.Clear( true )
				return 
			end
			f20_local3 = math.max( f20_local5, 0 )
		end
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f20_local11, 0 )
	end
	Lobby.Timer.lobbyTimer.status = f20_local2
	Lobby.Timer.lobbyTimer.endTime = f20_local4
	Engine.SetModelValue( f20_local12, f20_local13 )
	Engine.SetGameLobbyStatusInfo( f20_local2, f20_local3 )
end

Lobby.Timer.AutoZMPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return true
	else
		Lobby.MapVote.Hide()
		Lobby.Timer.Clear( false )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.AutoMPPumpEnd: Kill lobby timer.\n" )
		return true
	end
end

Lobby.Timer.AutoZMPumpClient = function ( f22_arg0 )
	local f22_local0 = f22_arg0.controller
	local f22_local1 = f22_arg0.lobbyType
	local f22_local2 = f22_arg0.status
	local f22_local3 = f22_arg0.statusValue
	local f22_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f22_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f22_local6 = 0
	if f22_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f22_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f22_local4, "" )
	elseif f22_local2 == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		local f22_local7 = f22_local3
		if f22_local7 == 1 then
			Engine.SetModelValue( f22_local4, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
		else
			Engine.SetModelValue( f22_local4, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f22_local7 ) )
		end
	elseif f22_local2 == Lobby.Timer.LOBBY_STATUS.NEED_READYUP then
		local f22_local7 = f22_local3
		if f22_local7 == 1 then
			Engine.SetModelValue( f22_local4, Engine.Localize( "MENU_WAITING_FOR_PLAYER_TO_BE_READY" ) )
		else
			Engine.SetModelValue( f22_local4, Engine.Localize( "MENU_WAITING_FOR_PLAYERS_TO_BE_READY", f22_local7 ) )
		end
	elseif f22_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		local f22_local7 = f22_local3
		if f22_local7 > 0 then
			Engine.SetModelValue( f22_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f22_local7 ) )
			f22_local6 = f22_local7
		else
			Engine.SetModelValue( f22_local4, "" )
		end
		if f22_local7 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f22_local7
			if f22_local7 <= 10 then
				Engine.PlaySound( LobbyData.Sounds.TimerTick )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f22_local7 .. "\n" )
			end
		end
	end
	Engine.SetModelValue( f22_local5, f22_local6 )
end

Lobby.Timer.ManualPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f23_local0 = Lobby.Timer.lobbyTimer.controller
	local f23_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f23_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f23_local3 = 0
	local f23_local4 = 0
	local f23_local5 = Engine.GetLobbyClientCount( f23_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f23_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local f23_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f23_local8 = 0
	if f23_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f23_local9 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f23_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f23_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		Lobby.Timer.lobbyTimer.status = f23_local2
		if f23_local4 > 0 then
			Engine.SetModelValue( f23_local9, Engine.Localize( "MENU_GAME_STARTING_IN", f23_local4 ) )
			f23_local8 = f23_local4
		else
			Engine.SetModelValue( f23_local9, "" )
		end
		if f23_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f23_local4
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f23_local6, 1 )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f23_local4 .. "\n" )
		end
		if not CoDShared.IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_THEATER ) and not LuaUtils.AllClientsSpectating() and (Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED ) == 1 or Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED ) == 1) and f23_local4 <= 0 then
			Lobby.Pregame.Start()
			Lobby.Timer.Clear( false )
			return 
		end
		local f23_local10 = false
		if Engine.IsLobbyMigratActive then
			f23_local10 = Engine.IsLobbyMigratActive( Enum.LobbyType.LOBBY_TYPE_GAME )
		end
		if Lobby.ProcessQueue.IsQueueEmpty() and f23_local10 == false and f23_local4 <= 0 then
			if Lobby.Timer.GetTimerType() == LuaEnums.TIMER_TYPE.THEATER then
				Engine.SetModelValue( f23_local9, "" )
				Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
				LobbyVM.LaunchDemoExec( f23_local0, f23_local1 )
				return 
			elseif LobbyVM.LaunchGameExec( f23_local0, f23_local1 ) == true then
				Engine.SetModelValue( f23_local9, "" )
				Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
				return 
			end
		end
		f23_local3 = math.max( f23_local4, 0 )
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f23_local6, 0 )
	end
	Engine.SetModelValue( f23_local7, f23_local8 )
	Engine.SetGameLobbyStatusInfo( f23_local2, f23_local3 )
end

Lobby.Timer.ManualPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	else
		Lobby.MapVote.ShowLockedIn()
		if Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
			if Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
				Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_ALLIES )
				Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_AXIS )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.ManualPumpEnd: Stop lobby timer.\n" )
			return false
		else
			Lobby.Timer.Clear( false )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.ManualPumpEnd: Kill lobby timer.\n" )
			return true
		end
	end
end

Lobby.Timer.ManualPumpClient = function ( f25_arg0 )
	local f25_local0 = f25_arg0.controller
	local f25_local1 = f25_arg0.lobbyType
	local f25_local2 = f25_arg0.status
	local f25_local3 = f25_arg0.statusValue
	local f25_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f25_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f25_local6 = 0
	if f25_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f25_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f25_local4, "" )
	elseif f25_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f25_local3 > 0 then
			Engine.SetModelValue( f25_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f25_local3 ) )
			f25_local6 = f25_local3
		else
			Engine.SetModelValue( f25_local4, "" )
		end
		if f25_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f25_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f25_local3 .. "\n" )
		end
	end
	Engine.SetModelValue( f25_local5, f25_local6 )
end

Lobby.Timer.ModLoadPumpClient = function ( f26_arg0 )
	local f26_local0 = f26_arg0.controller
	local f26_local1 = f26_arg0.lobbyType
end

Lobby.Timer.ModLoadPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	elseif not Lobby.ProcessQueue.IsQueueEmpty() then
		local f27_local0 = Lobby.ProcessQueue.GetQueueHead()
		if f27_local0.name == "LoadMod" then
			return 
		end
	end
	LobbyVM.LaunchGameExec( Lobby.Timer.lobbyTimer.controller, Enum.LobbyType.LOBBY_TYPE_GAME )
	Lobby.Timer.ModLoadEnd()
end

Lobby.Timer.ModLoadEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return true
	else
		Lobby.Timer.Clear( false )
		Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.ModLoadEndClient: Kill lobby timer.\n" )
		return true
	end
end

Lobby.Timer.ManualCPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f29_local0 = Lobby.Timer.lobbyTimer.controller
	local f29_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f29_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f29_local3 = 0
	local f29_local4 = 0
	local f29_local5 = Engine.GetLobbyClientCount( f29_local1 )
	local f29_local6 = f29_local5 == 0
	Lobby.MapVote.ShowLockedIn()
	local f29_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local f29_local8 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f29_local9 = 0
	if f29_local6 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f29_local10 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		if f29_local5 == 1 then
			Engine.SetModelValue( f29_local10, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f29_local0, f29_local1 )
		else
			f29_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
			f29_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
			if f29_local4 > 0 then
				Engine.SetModelValue( f29_local10, Engine.Localize( "MENU_GAME_STARTING_IN", f29_local4 ) )
				f29_local9 = f29_local4
			else
				Engine.SetModelValue( f29_local10, "" )
			end
			if f29_local4 ~= Lobby.Timer.lastValue then
				Lobby.Timer.lastValue = f29_local4
				Engine.PlaySound( LobbyData.Sounds.TimerTick )
				Engine.SetModelValue( f29_local7, 1 )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f29_local4 .. "\n" )
			end
			local f29_local11 = false
			if Engine.IsLobbyMigratActive then
				f29_local11 = Engine.IsLobbyMigratActive( Enum.LobbyType.LOBBY_TYPE_GAME )
			end
			if Lobby.ProcessQueue.IsQueueEmpty() and f29_local11 == false and f29_local4 <= 0 and LobbyVM.LaunchGameExec( f29_local0, f29_local1 ) == true then
				Engine.SetModelValue( f29_local10, "" )
				Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
				return 
			end
			f29_local3 = math.max( f29_local4, 0 )
		end
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f29_local7, 0 )
	end
	Engine.SetModelValue( f29_local8, f29_local9 )
	Engine.SetGameLobbyStatusInfo( f29_local2, f29_local3 )
end

Lobby.Timer.ManualCPPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	else
		Lobby.MapVote.ShowLockedIn()
		if Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
			if Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
				Lobby.TeamSelection.Clear()
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.ManualPumpEnd: Stop lobby timer.\n" )
			return false
		else
			Lobby.Timer.Clear( false )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.ManualPumpEnd: Kill lobby timer.\n" )
			return true
		end
	end
end

Lobby.Timer.ManualCPPumpClient = function ( f31_arg0 )
	local f31_local0 = f31_arg0.controller
	local f31_local1 = f31_arg0.lobbyType
	local f31_local2 = f31_arg0.status
	local f31_local3 = f31_arg0.statusValue
	local f31_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f31_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f31_local6 = 0
	if f31_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f31_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f31_local4, "" )
	elseif f31_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f31_local3 > 0 then
			Engine.SetModelValue( f31_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f31_local3 ) )
			f31_local6 = f31_local3
		else
			Engine.SetModelValue( f31_local4, "" )
		end
		if f31_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f31_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f31_local3 .. "\n" )
		end
	end
	Engine.SetModelValue( f31_local5, f31_local6 )
end

Lobby.Timer.TestingPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f32_local0 = Lobby.Timer.lobbyTimer.controller
	local f32_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f32_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f32_local3 = 0
	local f32_local4 = 0
	local f32_local5 = Engine.GetLobbyClientCount( f32_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f32_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local f32_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f32_local8 = 0
	if f32_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + 30000
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f32_local9 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f32_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f32_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		if f32_local4 > 0 then
			Engine.SetModelValue( f32_local9, Engine.Localize( "MENU_GAME_STARTING_IN", f32_local4 ) )
			f32_local8 = f32_local4
		else
			Engine.SetModelValue( f32_local9, "" )
		end
		if f32_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f32_local4
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f32_local6, 1 )
			if f32_local4 <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f32_local4 .. "\n" )
			end
		end
		if f32_local4 <= 0 then
			Engine.SetModelValue( f32_local9, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f32_local0, f32_local1 )
			Lobby.Timer.Clear( true )
			return 
		end
		f32_local3 = f32_local4
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f32_local6, 0 )
	end
	Engine.SetModelValue( f32_local7, f32_local8 )
	Engine.SetGameLobbyStatusInfo( f32_local2, f32_local3 )
end

Lobby.Timer.TestingPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return true
	else
		Lobby.MapVote.Hide()
		Lobby.Timer.Clear( false )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.TestingPumpEnd: Kill lobby timer.\n" )
		return true
	end
end

Lobby.Timer.TestingPumpClient = function ( f34_arg0 )
	local f34_local0 = f34_arg0.controller
	local f34_local1 = f34_arg0.lobbyType
	local f34_local2 = f34_arg0.status
	local f34_local3 = f34_arg0.statusValue
	local f34_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f34_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local f34_local6 = 0
	if f34_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f34_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f34_local4, "" )
	elseif f34_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f34_local3 > 0 then
			Engine.SetModelValue( f34_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f34_local3 ) )
			f34_local6 = f34_local3
		else
			Engine.SetModelValue( f34_local4, "" )
		end
		if f34_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f34_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f34_local3 .. "\n" )
		end
	end
	Engine.SetModelValue( f34_local5, f34_local6 )
end

Lobby.Timer.NonePump = function ()
	
end

Lobby.Timer.NonePumpEnd = function ()
	Lobby.Timer.Clear( false )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.NonePumpEnd: Kill lobby timer.\n" )
	return true
end

Lobby.Timer.NonePumpClient = function ( f37_arg0 )
	
end

Lobby.Timer.UpdateLobbyStatusInfo = function ( f38_arg0 )
	local f38_local0 = f38_arg0.controller
	local f38_local1 = f38_arg0.lobbyType
	local f38_local2 = f38_arg0.status
	local f38_local3 = f38_arg0.statusValue
	local f38_local4 = f38_arg0.statusValue
	if Engine.IsLobbyHost( f38_local1 ) then
		return 
	end
	local f38_local5 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f38_local6 = f38_local5.lobbyTimerType
	if f38_local6 == LuaEnums.TIMER_TYPE.NONE then
		
	elseif f38_local6 == LuaEnums.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.AutoCPPumpClient( f38_arg0 )
	elseif f38_local6 == LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.AutoMPPumpClient( f38_arg0 )
	elseif f38_local6 == LuaEnums.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.AutoZMPumpClient( f38_arg0 )
	elseif f38_local6 == LuaEnums.TIMER_TYPE.MANUAL then
		Lobby.Timer.ManualPumpClient( f38_arg0 )
	elseif f38_local6 == LuaEnums.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.ManualCPPumpClient( f38_arg0 )
	elseif f38_local6 == LuaEnums.TIMER_TYPE.READYUP then
		Lobby.Timer.ManualPumpClient( f38_arg0 )
	elseif f38_local6 == LuaEnums.TIMER_TYPE.THEATER then
		Lobby.Timer.ManualPumpClient( f38_arg0 )
	elseif f38_local6 == LuaEnums.TIMER_TYPE.MOD_LOAD then
		Lobby.Timer.ModLoadPumpClient( f38_arg0 )
	elseif f38_local6 == LuaEnums.TIMER_TYPE.TESTING then
		Lobby.Timer.TestingPumpClient( f38_arg0 )
	end
end

Lobby.Timer.HostingLobby = function ( f39_arg0 )
	local f39_local0 = f39_arg0.controller
	local f39_local1 = f39_arg0.lobbyType
	local f39_local2 = f39_arg0.mainMode
	local f39_local3 = f39_arg0.lobbyTimerType
	local f39_local4 = f39_arg0.matchEnded
	if f39_local1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		return false
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.HostingLobby: Creating a lobby timer.\n" )
	Lobby.Pregame.Shutdown( f39_local0 )
	Lobby.Timer.Clear( true )
	Lobby.Timer.lobbyTimer = {}
	Lobby.Timer.lobbyTimer.controller = f39_local0
	Lobby.Timer.lobbyTimer.lobbyType = f39_local1
	Lobby.Timer.lobbyTimer.mainMode = f39_local2
	Lobby.Timer.lobbyTimer.lobbyTimerType = f39_local3
	if LuaUtils.IsArenaMode() and f39_local4 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.POST_GAME
		Lobby.Timer.UpdateAdvertising( false )
	else
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
	end
	Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	Lobby.Timer.lobbyTimer.balanceStartTime = 0
	if f39_arg0.status ~= nil then
		if f39_arg0.status == Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED then
			Lobby.Timer.lobbyTimer.status = f39_arg0.status
			Engine.SetGameLobbyStatusInfo( f39_arg0.status, 0 )
		elseif f39_arg0.status ~= Lobby.Timer.LOBBY_STATUS.IDLE then
			Lobby.Timer.lobbyTimer.status = f39_arg0.status
			if f39_arg0.status == Lobby.Timer.LOBBY_STATUS.STARTING and f39_arg0.statusValue < 5 then
				f39_arg0.statusValue = Dvar.lobbyTimerStatusStartInterval:get() / 1000
			end
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + f39_arg0.statusValue * 1000
			Engine.SetGameLobbyStatusInfo( f39_arg0.status, f39_arg0.statusValue )
		end
	end
	if f39_local3 == LuaEnums.TIMER_TYPE.NONE then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.NonePump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.NonePumpEnd
	elseif f39_local3 == LuaEnums.TIMER_TYPE.MOD_LOAD then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ModLoadPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ModLoadEnd
	elseif f39_local3 == LuaEnums.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoCPPumpEnd
	elseif f39_local3 == LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoMPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoMPPumpEnd
	elseif f39_local3 == LuaEnums.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoZMPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoZMPumpEnd
	elseif f39_local3 == LuaEnums.TIMER_TYPE.MANUAL or f39_local3 == LuaEnums.TIMER_TYPE.READYUP or f39_local3 == LuaEnums.TIMER_TYPE.THEATER then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualPumpEnd
	elseif f39_local3 == LuaEnums.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualCPPumpEnd
	elseif f39_local3 == LuaEnums.TIMER_TYPE.TESTING then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.TestingPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.TestingPumpEnd
	end
	return true
end

Lobby.Timer.HostingLobbyEnd = function ( f40_arg0 )
	if f40_arg0.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME or Lobby.Timer.lobbyTimer == nil then
		return true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
		return Lobby.Timer.lobbyTimer.endFunc()
	end
end

Lobby.Timer.LaunchGame = function ( f41_arg0 )
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f41_local0 = Lobby.Timer.lobbyTimer.controller
	local f41_local1 = Lobby.Timer.lobbyTimer.lobbyType
	local f41_local2 = Lobby.Timer.lobbyTimer.lobbyTimerType
	Lobby.Timer.lobbyTimer.data = f41_arg0
	if f41_local2 == LuaEnums.TIMER_TYPE.MANUAL or f41_local2 == LuaEnums.TIMER_TYPE.READYUP or f41_local2 == LuaEnums.TIMER_TYPE.THEATER then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting game timer.\n" )
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyTimerStartInterval:get()
			if LuaEnums.TEAM_ASSIGNMENT.AUTO == Engine.GetGametypeSetting( "teamAssignment" ) and not LuaUtils.IsArenaMode() and f41_local2 ~= LuaEnums.TIMER_TYPE.THEATER then
				Lobby.TeamSelection.AutoSplitTeam( false )
			end
		end
	elseif f41_local2 == LuaEnums.TIMER_TYPE.MANUAL_CP then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting CP game timer.\n" )
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyCPTimerStartInterval:get()
		end
	elseif f41_local2 == LuaEnums.TIMER_TYPE.NONE then
		if not Lobby.ProcessQueue.IsQueueEmpty() then
			local f41_local3 = Lobby.ProcessQueue.GetQueueHead()
			if f41_local3.name == "LoadMod" then
				Lobby.Timer.HostingLobby( {
					controller = f41_local0,
					lobbyType = f41_local1,
					mainMode = Lobby.Timer.lobbyTimer.mainMode,
					lobbyTimerType = LuaEnums.TIMER_TYPE.MOD_LOAD,
					status = Lobby.Timer.LOBBY_STATUS_IDLE,
					statusValue = statusValue
				} )
				return 
			end
		end
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: starting game.\n" )
		LobbyVM.LaunchGameExec( f41_local0, f41_local1 )
		Lobby.Timer.Clear( true )
		Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
	end
end

Lobby.Timer.Pump = function ()
	LobbyVM.LobbyMonitor()
	LobbyVM.IngameMonitor()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f42_local0 = Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	if not f42_local0 then
		f42_local0 = Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	if Lobby.Timer.lobbyTimer.pumpFunc == nil or Lobby.Timer.lobbyTimer.endFunc == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: (Lobby.Timer.lobbyTimer.pumpFunc == nil) == " .. Util.IsNil( Lobby.Timer.lobbyTimer.pumpFunc ) .. ", (Lobby.Timer.lobbyTimer.endFunc == nil) == " .. Util.IsNil( Lobby.Timer.lobbyTimer.endFunc ) .. ".\n" )
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: lobbyType(" .. Lobby.Timer.lobbyTimer.lobbyType .. "), mainMode(" .. Lobby.Timer.lobbyTimer.mainMode .. "), lobbyTimerType(" .. Lobby.Timer.lobbyTimer.lobbyTimerType .. ").\n" )
		Lobby.Timer.lobbyTimer.pumpFunc = Util.IsNil( Lobby.Timer.lobbyTimer.pumpFunc )
		Lobby.Timer.lobbyTimer.endFunc = Util.IsNil( Lobby.Timer.lobbyTimer.endFunc )
		LuaUtils.LogQoS( "timer_pump_issue", Lobby.Timer.lobbyTimer )
		Lobby.Timer.Clear( true )
		Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
		return 
	elseif f42_local0 then
		if Lobby.Timer.lobbyTimer.pumpFunc ~= nil then
			Lobby.Timer.lobbyTimer.pumpFunc()
		end
	elseif Lobby.Timer.lobbyTimer.endFunc ~= nil then
		Lobby.Timer.lobbyTimer.endFunc()
	end
end

