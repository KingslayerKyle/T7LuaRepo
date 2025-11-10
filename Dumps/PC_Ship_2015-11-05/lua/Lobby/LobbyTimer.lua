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
	NEED_PLAYERS = 4,
	NEED_BALANCE = 5,
	STARTING = 6,
	POST_GAME = 7,
	FIND_NEW_LOBBY = 8
}
Lobby.Timer.lastValue = 0
Lobby.Timer.lobbyTimer = nil
Lobby.Timer.OnSessionStart = function ( f1_arg0 )
	local f1_local0 = f1_arg0.lobbyModule
	local f1_local1 = f1_arg0.lobbyType
	local f1_local2 = f1_arg0.lobbyMode
	if f1_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
	end
end

Lobby.Timer.OnMatchStart = function ( f2_arg0 )
	local f2_local0 = f2_arg0.lobbyModule
	local f2_local1 = f2_arg0.lobbyType
	local f2_local2 = f2_arg0.lobbyMode
	Lobby.Timer.Clear( true )
end

Lobby.Timer.OnMatchEnd = function ( f3_arg0 )
	local f3_local0 = f3_arg0.lobbyModule
	local f3_local1 = f3_arg0.lobbyType
	local f3_local2 = f3_arg0.lobbyMode
	if f3_local0 ~= Enum.LobbyModule.LOBBY_MODULE_HOST or f3_local1 ~= Enum.LobbyType.LOBBY_TYPE_GAME or not Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	end
	local f3_local3 = Engine.GetLobbyHostControllerIndex( Enum.LobbyType.LOBBY_TYPE_GAME )
	if f3_local3 == -1 then
		f3_local3 = 0
	end
	local f3_local4 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.MatchEnd: Game must have ended, start host timer.\n" )
	local f3_local5 = {
		controller = f3_local3,
		lobbyType = f3_local1,
		mainMode = f3_local4.mainMode,
		lobbyTimerType = f3_local4.lobbyTimerType,
		matchEnded = true
	}
	Lobby.Timer.HostingLobby( f3_local5 )
	Lobby.Pregame.OnMatchEnd( f3_local5 )
end

Lobby.Timer.OnClientRemoved = function ( f4_arg0 )
	if Lobby.Timer.lobbyTimer == nil then
		return 
	elseif LuaUtils.IsArenaMode() and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and Lobby.Timer.lobbyTimer.status <= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
		Engine.SetGameLobbyStatusInfo( Lobby.Timer.lobbyTimer.status, 0 )
	end
end

Lobby.Timer.LockInLobby = function ()
	if LuaUtils.IsArenaMode() then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyLockedIn" ), true )
	end
end

Lobby.Timer.LobbyIsLocked = function ()
	if LuaUtils.IsArenaMode() then
		local f6_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyLockedIn" )
		if f6_local0 then
			return Engine.GetModelValue( f6_local0 )
		end
	end
	return false
end

Lobby.Timer.UnlockLobby = function ()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyLockedIn" ), false )
end

Lobby.Timer.Clear = function ( f8_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
	Lobby.Timer.UnlockLobby()
	if f8_arg0 == true then
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
	local f11_local0 = Lobby.Timer.lobbyTimer.controller
	local f11_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f11_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f11_local3 = 0
	local f11_local4 = 0
	local f11_local5 = Engine.GetLobbyClientCount( f11_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f11_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f11_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyCPTimerStartInterval:get()
		if Engine.IsCampaignModeZombies() and Dvar.lobbyCPZMTimerStartInterval.exists() then
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyCPZMTimerStartInterval:get()
		end
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f11_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f11_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f11_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		if f11_local4 > 0 then
			Engine.SetModelValue( f11_local7, Engine.Localize( "MENU_GAME_STARTING_IN", f11_local4 ) )
		else
			Engine.SetModelValue( f11_local7, "" )
		end
		if f11_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f11_local4
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f11_local6, 1 )
			if f11_local4 <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f11_local4 .. "\n" )
			end
		end
		if f11_local4 <= 0 then
			Engine.SetModelValue( f11_local7, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f11_local0, f11_local1 )
			Lobby.Timer.Clear( true )
			return 
		end
		f11_local3 = f11_local4
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f11_local6, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f11_local2, f11_local3 )
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

Lobby.Timer.AutoCPPumpClient = function ( f13_arg0 )
	local f13_local0 = f13_arg0.controller
	local f13_local1 = f13_arg0.lobbyType
	local f13_local2 = f13_arg0.status
	local f13_local3 = f13_arg0.statusValue
	local f13_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f13_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f13_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f13_local4, "" )
	elseif f13_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f13_local3 > 0 then
			Engine.SetModelValue( f13_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f13_local3 ) )
		else
			Engine.SetModelValue( f13_local4, "" )
		end
		if f13_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f13_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f13_local3 .. "\n" )
		end
	end
end

Lobby.Timer.AutoMPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f14_local0 = Lobby.Timer.lobbyTimer.controller
	local f14_local1 = Lobby.Timer.lobbyTimer.lobbyType
	local f14_local2 = Lobby.Timer.lobbyTimer.mainMode
	local f14_local3 = Lobby.Timer.lobbyTimer.lobbyTimerType
	local f14_local4 = Lobby.Timer.lobbyTimer.status
	local f14_local5 = 0
	local f14_local6 = Lobby.Timer.lobbyTimer.endTime
	local f14_local7 = 0
	local f14_local8 = Engine.GetLobbyClientCount( f14_local1 )
	local f14_local9 = math.max( 0, Dvar.party_minplayers:get() - f14_local8 )
	local f14_local10 = f14_local8 == 0
	local f14_local11 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f14_local12 = 0
	if f14_local6 ~= Lobby.Timer.MATCH_START_INVALID then
		f14_local7 = math.floor( math.max( 0, f14_local6 - Engine.milliseconds() ) / 1000 )
	end
	if f14_local4 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	f14_local5 = f14_local7
	if f14_local10 or f14_local4 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		if LuaUtils.IsArenaMode() then
			f14_local4 = Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK
		else
			f14_local4 = Lobby.Timer.LOBBY_STATUS.VOTING
		end
		f14_local6 = Lobby.Timer.MATCH_START_INVALID
	elseif f14_local4 == Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK then
		Lobby.Timer.UnlockLobby()
		if f14_local9 > 0 then
			if f14_local9 == 1 then
				Engine.SetModelValue( f14_local11, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
			else
				Engine.SetModelValue( f14_local11, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f14_local9 ) )
			end
			f14_local6 = Lobby.Timer.MATCH_START_INVALID
			f14_local4 = Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK
			f14_local5 = f14_local9
		else
			Lobby.Timer.LockInLobby()
			Lobby.TeamSelection.AutoSplitTeam( true, true )
			f14_local6 = Lobby.Timer.MATCH_START_INVALID
			f14_local4 = Lobby.Timer.LOBBY_STATUS.VOTING
		end
	elseif f14_local4 == Lobby.Timer.LOBBY_STATUS.VOTING then
		Lobby.MapVote.ShowVote()
		if f14_local6 == Lobby.Timer.MATCH_START_INVALID then
			f14_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusVotingInterval:get()
			if not LuaUtils.IsArenaMode() then
				Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
			end
		else
			Engine.SetModelValue( f14_local11, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. f14_local7 )
			if math.max( 0, f14_local6 - Engine.milliseconds() ) == 0 then
				f14_local6 = Lobby.Timer.MATCH_START_INVALID
				f14_local4 = Lobby.Timer.LOBBY_STATUS.BEGIN
				Lobby.MapVote.LockedInVote()
			end
		end
	elseif f14_local4 == Lobby.Timer.LOBBY_STATUS.BEGIN then
		Lobby.MapVote.ShowLockedIn()
		if f14_local6 == Lobby.Timer.MATCH_START_INVALID then
			f14_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusBeginInterval:get()
		else
			Engine.SetModelValue( f14_local11, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
			if math.max( 0, f14_local6 - Engine.milliseconds() ) == 0 then
				f14_local6 = Lobby.Timer.MATCH_START_INVALID
				f14_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
				if LuaUtils.IsArenaMode() then
					f14_local4 = Lobby.Timer.LOBBY_STATUS.STARTING
				end
			end
		end
	elseif f14_local4 == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		Lobby.MapVote.ShowLockedIn()
		if f14_local9 > 0 then
			if f14_local9 == 1 then
				Engine.SetModelValue( f14_local11, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
			else
				Engine.SetModelValue( f14_local11, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f14_local9 ) )
			end
			f14_local6 = Lobby.Timer.MATCH_START_INVALID
			f14_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			f14_local5 = f14_local9
		else
			f14_local6 = Lobby.Timer.MATCH_START_INVALID
			f14_local4 = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
			Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		end
	elseif f14_local4 == Lobby.Timer.LOBBY_STATUS.NEED_BALANCE then
		Lobby.MapVote.ShowLockedIn()
		if f14_local9 > 0 then
			f14_local6 = Lobby.Timer.MATCH_START_INVALID
			f14_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		else
			local f14_local13 = false
			if Engine.milliseconds() - Lobby.Timer.lobbyTimer.balanceStartTime > 10000 then
				f14_local13 = true
				Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
			end
			if Lobby.TeamSelection.AutoSplitTeam( true, f14_local13 ) then
				f14_local6 = Lobby.Timer.MATCH_START_INVALID
				f14_local4 = Lobby.Timer.LOBBY_STATUS.STARTING
				if Dvar.lobbyMigrate_migrateToBestGameHostEnabled:get() == true then
					Engine.MigrateToBestGameHost( f14_local0 )
				end
			else
				f14_local6 = Lobby.Timer.MATCH_START_INVALID
				f14_local4 = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
				Engine.SetModelValue( f14_local11, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS_TEAMS" ) )
			end
		end
	elseif f14_local4 == Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.MapVote.ShowLockedIn()
		if f14_local9 > 0 then
			f14_local6 = Lobby.Timer.MATCH_START_INVALID
			f14_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		elseif not LuaUtils.IsArenaMode() and Lobby.TeamSelection.AutoSplitTeam( true, false ) == false then
			f14_local6 = Lobby.Timer.MATCH_START_INVALID
			f14_local4 = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
			Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
		else
			f14_local4 = Lobby.Timer.LOBBY_STATUS.STARTING
			if f14_local6 == Lobby.Timer.MATCH_START_INVALID then
				f14_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusStartInterval:get()
			else
				if f14_local7 > 0 then
					Engine.SetModelValue( f14_local11, Engine.Localize( "MENU_GAME_STARTING_IN", f14_local7 ) )
				else
					Engine.SetModelValue( f14_local11, "" )
				end
				if f14_local7 ~= Lobby.Timer.lastValue then
					Lobby.Timer.lastValue = f14_local7
					Engine.PlaySound( LobbyData.Sounds.TimerTick )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f14_local7 .. "\n" )
				end
				if not LuaUtils.AllClientsSpectating() and (Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED ) == 1 or Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED ) == 1) and f14_local7 <= 0 then
					Lobby.Pregame.Start()
					Lobby.Timer.Clear( false )
					return 
				elseif f14_local7 <= 0 then
					Lobby.Timer.lobbyTimer.endFunc()
					if not LuaUtils.IsArenaMode() then
						Lobby.TeamSelection.AutoSplitTeam( true, true )
					end
					LobbyVM.LaunchGameExec( f14_local0, f14_local1 )
					Lobby.Timer.Clear( true )
					return 
				end
			end
		end
	elseif f14_local4 == Lobby.Timer.LOBBY_STATUS.POST_GAME then
		Lobby.MapVote.ShowEndResult()
		if f14_local6 == Lobby.Timer.MATCH_START_INVALID then
			f14_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusPostGameInterval:get()
		else
			Engine.SetModelValue( f14_local11, Engine.Localize( "MENU_GAME_ENDED" ) .. ": " .. f14_local7 )
			if math.max( 0, f14_local6 - Engine.milliseconds() ) == 0 then
				if LuaUtils.IsArenaMode() then
					f14_local6 = Lobby.Timer.MATCH_START_INVALID
					f14_local4 = Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY
				else
					f14_local6 = Lobby.Timer.MATCH_START_INVALID
					f14_local4 = Lobby.Timer.LOBBY_STATUS.IDLE
				end
			end
		end
	elseif f14_local4 == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) == Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Lobby.TeamSelection.Clear()
		f14_local6 = Lobby.Timer.MATCH_START_INVALID
		f14_local4 = Lobby.Timer.LOBBY_STATUS.IDLE
	end
	Lobby.Timer.lobbyTimer.status = f14_local4
	Lobby.Timer.lobbyTimer.endTime = f14_local6
	Engine.SetGameLobbyStatusInfo( Lobby.Timer.lobbyTimer.status, f14_local5 )
end

Lobby.Timer.AutoMPPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true ), 0 )
		Lobby.Timer.Clear( false )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.AutoMPPumpEnd: Kill lobby timer.\n" )
		return true
	end
end

Lobby.Timer.AutoMPPumpClient = function ( f16_arg0 )
	local f16_local0 = f16_arg0.controller
	local f16_local1 = f16_arg0.lobbyType
	local f16_local2 = f16_arg0.status
	local f16_local3 = f16_arg0.statusValue
	local f16_local4 = f16_arg0.statusValue
	if Engine.IsLobbyHost( f16_local1 ) then
		return 
	end
	local f16_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f16_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	if f16_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		Engine.SetModelValue( f16_local5, "" )
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK then
		Lobby.Timer.UnlockLobby()
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.VOTING then
		if LuaUtils.IsArenaMode() then
			Lobby.Timer.LockInLobby()
		end
		Lobby.MapVote.ShowVote()
		Engine.SetModelValue( f16_local5, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. f16_local3 )
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.BEGIN then
		Lobby.MapVote.ShowLockedIn()
		Engine.SetModelValue( f16_local5, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		Lobby.MapVote.ShowLockedIn()
		if f16_local4 == 1 then
			Engine.SetModelValue( f16_local5, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
		else
			Engine.SetModelValue( f16_local5, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f16_local4 ) )
		end
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.NEED_BALANCE then
		Lobby.MapVote.ShowLockedIn()
		Engine.SetModelValue( f16_local5, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS_TEAMS" ) )
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.MapVote.ShowLockedIn()
		if f16_local3 > 0 then
			Engine.SetModelValue( f16_local5, Engine.Localize( "MENU_GAME_STARTING_IN", f16_local3 ) )
		else
			Engine.SetModelValue( f16_local5, "" )
		end
		if f16_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f16_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f16_local3 .. "\n" )
		end
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.POST_GAME then
		Lobby.MapVote.ShowEndResult()
		if f16_local3 > 0 then
			Engine.SetModelValue( f16_local5, Engine.Localize( "MENU_GAME_ENDED" ) .. ": " .. f16_local3 )
		else
			Engine.SetModelValue( f16_local5, "" )
		end
	elseif f16_local2 == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY and Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Engine.GetLobbyHostXuid( Enum.LobbyType.LOBBY_TYPE_GAME ) ) == false then
		Lobby.ProcessQueue.AddToQueue( "ReloadGameLobby", Lobby.ProcessNavigate.ReloadGameLobby( f16_local0 ) )
	end
end

Lobby.Timer.AutoZMPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f17_local0 = Lobby.Timer.lobbyTimer.controller
	local f17_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f17_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f17_local3 = 0
	local f17_local4 = 0
	local f17_local5 = Engine.GetLobbyClientCount( f17_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f17_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f17_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyTimerZMStartInterval:get()
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f17_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f17_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f17_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		if f17_local4 > 0 then
			Engine.SetModelValue( f17_local7, Engine.Localize( "MENU_GAME_STARTING_IN", f17_local4 ) )
		else
			Engine.SetModelValue( f17_local7, "" )
		end
		if f17_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f17_local4
			Engine.SetModelValue( f17_local6, 1 )
			if f17_local4 <= 10 then
				Engine.PlaySound( LobbyData.Sounds.TimerTick )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f17_local4 .. "\n" )
			end
		end
		if f17_local4 <= 0 then
			Engine.SetModelValue( f17_local7, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f17_local0, f17_local1 )
			Lobby.Timer.Clear( true )
			return 
		end
		f17_local3 = f17_local4
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f17_local6, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f17_local2, f17_local3 )
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

Lobby.Timer.AutoZMPumpClient = function ( f19_arg0 )
	local f19_local0 = f19_arg0.controller
	local f19_local1 = f19_arg0.lobbyType
	local f19_local2 = f19_arg0.status
	local f19_local3 = f19_arg0.statusValue
	local f19_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f19_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f19_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f19_local4, "" )
	elseif f19_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f19_local3 > 0 then
			Engine.SetModelValue( f19_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f19_local3 ) )
		else
			Engine.SetModelValue( f19_local4, "" )
		end
		if f19_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f19_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f19_local3 .. "\n" )
		end
	end
end

Lobby.Timer.ManualPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f20_local0 = Lobby.Timer.lobbyTimer.controller
	local f20_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f20_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f20_local3 = 0
	local f20_local4 = 0
	local f20_local5 = Engine.GetLobbyClientCount( f20_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f20_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f20_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f20_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f20_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f20_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		Lobby.Timer.lobbyTimer.status = f20_local2
		if f20_local4 > 0 then
			Engine.SetModelValue( f20_local7, Engine.Localize( "MENU_GAME_STARTING_IN", f20_local4 ) )
		else
			Engine.SetModelValue( f20_local7, "" )
		end
		if f20_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f20_local4
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f20_local6, 1 )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f20_local4 .. "\n" )
		end
		if not LuaUtils.AllClientsSpectating() and (Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED ) == 1 or Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED ) == 1) and f20_local4 <= 0 then
			Lobby.Pregame.Start()
			Lobby.Timer.Clear( false )
			return 
		elseif f20_local4 <= 0 then
			Engine.SetModelValue( f20_local7, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			if Lobby.Timer.GetTimerType() == LuaEnums.TIMER_TYPE.THEATER then
				LobbyVM.LaunchDemoExec( f20_local0, f20_local1 )
			else
				LobbyVM.LaunchGameExec( f20_local0, f20_local1 )
			end
			return 
		end
		f20_local3 = f20_local4
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f20_local6, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f20_local2, f20_local3 )
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

Lobby.Timer.ManualPumpClient = function ( f22_arg0 )
	local f22_local0 = f22_arg0.controller
	local f22_local1 = f22_arg0.lobbyType
	local f22_local2 = f22_arg0.status
	local f22_local3 = f22_arg0.statusValue
	local f22_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f22_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f22_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f22_local4, "" )
	elseif f22_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f22_local3 > 0 then
			Engine.SetModelValue( f22_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f22_local3 ) )
		else
			Engine.SetModelValue( f22_local4, "" )
		end
		if f22_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f22_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f22_local3 .. "\n" )
		end
	end
end

Lobby.Timer.ManualCPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f23_local0 = Lobby.Timer.lobbyTimer.controller
	local f23_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f23_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f23_local3 = 0
	local f23_local4 = 0
	local f23_local5 = Engine.GetLobbyClientCount( f23_local1 )
	local f23_local6 = f23_local5 == 0
	Lobby.MapVote.ShowLockedIn()
	local f23_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f23_local6 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f23_local8 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		if f23_local5 == 1 then
			Engine.SetModelValue( f23_local8, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f23_local0, f23_local1 )
		else
			f23_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
			f23_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
			if f23_local4 > 0 then
				Engine.SetModelValue( f23_local8, Engine.Localize( "MENU_GAME_STARTING_IN", f23_local4 ) )
			else
				Engine.SetModelValue( f23_local8, "" )
			end
			if f23_local4 ~= Lobby.Timer.lastValue then
				Lobby.Timer.lastValue = f23_local4
				Engine.PlaySound( LobbyData.Sounds.TimerTick )
				Engine.SetModelValue( f23_local7, 1 )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f23_local4 .. "\n" )
			end
			if f23_local4 <= 0 then
				Engine.SetModelValue( f23_local8, "" )
				Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
				LobbyVM.LaunchGameExec( f23_local0, f23_local1 )
				return 
			end
			f23_local3 = f23_local4
		end
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f23_local7, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f23_local2, f23_local3 )
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

Lobby.Timer.ManualCPPumpClient = function ( f25_arg0 )
	local f25_local0 = f25_arg0.controller
	local f25_local1 = f25_arg0.lobbyType
	local f25_local2 = f25_arg0.status
	local f25_local3 = f25_arg0.statusValue
	local f25_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f25_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f25_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f25_local4, "" )
	elseif f25_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f25_local3 > 0 then
			Engine.SetModelValue( f25_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f25_local3 ) )
		else
			Engine.SetModelValue( f25_local4, "" )
		end
		if f25_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f25_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f25_local3 .. "\n" )
		end
	end
end

Lobby.Timer.TestingPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f26_local0 = Lobby.Timer.lobbyTimer.controller
	local f26_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f26_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f26_local3 = 0
	local f26_local4 = 0
	local f26_local5 = Engine.GetLobbyClientCount( f26_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f26_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f26_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + 30000
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f26_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f26_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f26_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		if f26_local4 > 0 then
			Engine.SetModelValue( f26_local7, Engine.Localize( "MENU_GAME_STARTING_IN", f26_local4 ) )
		else
			Engine.SetModelValue( f26_local7, "" )
		end
		if f26_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f26_local4
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f26_local6, 1 )
			if f26_local4 <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f26_local4 .. "\n" )
			end
		end
		if f26_local4 <= 0 then
			Engine.SetModelValue( f26_local7, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f26_local0, f26_local1 )
			Lobby.Timer.Clear( true )
			return 
		end
		f26_local3 = f26_local4
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f26_local6, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f26_local2, f26_local3 )
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

Lobby.Timer.TestingPumpClient = function ( f28_arg0 )
	local f28_local0 = f28_arg0.controller
	local f28_local1 = f28_arg0.lobbyType
	local f28_local2 = f28_arg0.status
	local f28_local3 = f28_arg0.statusValue
	local f28_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f28_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f28_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f28_local4, "" )
	elseif f28_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f28_local3 > 0 then
			Engine.SetModelValue( f28_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f28_local3 ) )
		else
			Engine.SetModelValue( f28_local4, "" )
		end
		if f28_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f28_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f28_local3 .. "\n" )
		end
	end
end

Lobby.Timer.NonePump = function ()
	
end

Lobby.Timer.NonePumpEnd = function ()
	Lobby.Timer.Clear( false )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.NonePumpEnd: Kill lobby timer.\n" )
	return true
end

Lobby.Timer.NonePumpClient = function ( f31_arg0 )
	
end

Lobby.Timer.UpdateLobbyStatusInfo = function ( f32_arg0 )
	local f32_local0 = f32_arg0.controller
	local f32_local1 = f32_arg0.lobbyType
	local f32_local2 = f32_arg0.status
	local f32_local3 = f32_arg0.statusValue
	local f32_local4 = f32_arg0.statusValue
	if Engine.IsLobbyHost( f32_local1 ) then
		return 
	end
	local f32_local5 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f32_local6 = f32_local5.lobbyTimerType
	if f32_local6 == LuaEnums.TIMER_TYPE.NONE then
		
	elseif f32_local6 == LuaEnums.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.AutoCPPumpClient( f32_arg0 )
	elseif f32_local6 == LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.AutoMPPumpClient( f32_arg0 )
	elseif f32_local6 == LuaEnums.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.AutoZMPumpClient( f32_arg0 )
	elseif f32_local6 == LuaEnums.TIMER_TYPE.MANUAL then
		Lobby.Timer.ManualPumpClient( f32_arg0 )
	elseif f32_local6 == LuaEnums.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.ManualCPPumpClient( f32_arg0 )
	elseif f32_local6 == LuaEnums.TIMER_TYPE.READYUP then
		Lobby.Timer.ManualPumpClient( f32_arg0 )
	elseif f32_local6 == LuaEnums.TIMER_TYPE.THEATER then
		Lobby.Timer.ManualPumpClient( f32_arg0 )
	elseif f32_local6 == LuaEnums.TIMER_TYPE.TESTING then
		Lobby.Timer.TestingPumpClient( f32_arg0 )
	end
end

Lobby.Timer.HostingLobby = function ( f33_arg0 )
	local f33_local0 = f33_arg0.controller
	local f33_local1 = f33_arg0.lobbyType
	local f33_local2 = f33_arg0.mainMode
	local f33_local3 = f33_arg0.lobbyTimerType
	local f33_local4 = f33_arg0.matchEnded
	if f33_local1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		return false
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.HostingLobby: Creating a lobby timer.\n" )
	Lobby.Timer.Clear( true )
	Lobby.Timer.lobbyTimer = {}
	Lobby.Timer.lobbyTimer.controller = f33_local0
	Lobby.Timer.lobbyTimer.lobbyType = f33_local1
	Lobby.Timer.lobbyTimer.mainMode = f33_local2
	Lobby.Timer.lobbyTimer.lobbyTimerType = f33_local3
	if LuaUtils.IsArenaMode() and f33_local4 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.POST_GAME
	else
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
	end
	Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	Lobby.Timer.lobbyTimer.balanceStartTime = 0
	if f33_arg0.status ~= nil and f33_arg0.status ~= Lobby.Timer.LOBBY_STATUS.IDLE then
		if Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE ~= Engine.GetLobbyPregameState() then
			Lobby.Pregame.Recover( f33_arg0.status, f33_arg0.statusValue )
			Lobby.Timer.Clear( false )
			return 
		end
		Lobby.Timer.lobbyTimer.status = f33_arg0.status
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + f33_arg0.statusValue * 1000
		Engine.SetGameLobbyStatusInfo( f33_arg0.status, f33_arg0.statusValue )
	end
	if f33_local3 == LuaEnums.TIMER_TYPE.NONE then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.NonePump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.NonePumpEnd
	elseif f33_local3 == LuaEnums.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoCPPumpEnd
	elseif f33_local3 == LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoMPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoMPPumpEnd
	elseif f33_local3 == LuaEnums.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoZMPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoZMPumpEnd
	elseif f33_local3 == LuaEnums.TIMER_TYPE.MANUAL or f33_local3 == LuaEnums.TIMER_TYPE.READYUP or f33_local3 == LuaEnums.TIMER_TYPE.THEATER then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualPumpEnd
	elseif f33_local3 == LuaEnums.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualCPPumpEnd
	elseif f33_local3 == LuaEnums.TIMER_TYPE.TESTING then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.TestingPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.TestingPumpEnd
	end
	return true
end

Lobby.Timer.HostingLobbyEnd = function ( f34_arg0 )
	if f34_arg0.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME or Lobby.Timer.lobbyTimer == nil then
		return true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
		return Lobby.Timer.lobbyTimer.endFunc()
	end
end

Lobby.Timer.LaunchGame = function ( f35_arg0 )
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f35_local0 = Lobby.Timer.lobbyTimer.controller
	local f35_local1 = Lobby.Timer.lobbyTimer.lobbyType
	local f35_local2 = Lobby.Timer.lobbyTimer.lobbyTimerType
	Lobby.Timer.lobbyTimer.data = f35_arg0
	if f35_local2 == LuaEnums.TIMER_TYPE.MANUAL or f35_local2 == LuaEnums.TIMER_TYPE.READYUP or f35_local2 == LuaEnums.TIMER_TYPE.THEATER then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting game timer.\n" )
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyTimerStartInterval:get()
			if LuaEnums.TEAM_ASSIGNMENT.AUTO == Engine.GetGametypeSetting( "teamAssignment" ) and not LuaUtils.IsArenaMode() then
				Lobby.TeamSelection.AutoSplitTeam( false )
			end
		end
	elseif f35_local2 == LuaEnums.TIMER_TYPE.MANUAL_CP then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting CP game timer.\n" )
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyCPTimerStartInterval:get()
		end
	elseif f35_local2 == LuaEnums.TIMER_TYPE.NONE then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: starting game.\n" )
		LobbyVM.LaunchGameExec( f35_local0, f35_local1 )
		Lobby.Timer.Clear( true )
	end
end

Lobby.Timer.Pump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f36_local0 = Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	if not f36_local0 then
		f36_local0 = Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	if Lobby.Timer.lobbyTimer.pumpFunc == nil or Lobby.Timer.lobbyTimer.endFunc == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: (Lobby.Timer.lobbyTimer.pumpFunc == nil) == " .. Util.IsNil( Lobby.Timer.lobbyTimer.pumpFunc ) .. ", (Lobby.Timer.lobbyTimer.endFunc == nil) == " .. Util.IsNil( Lobby.Timer.lobbyTimer.endFunc ) .. ".\n" )
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: lobbyType(" .. Lobby.Timer.lobbyTimer.lobbyType .. "), mainMode(" .. Lobby.Timer.lobbyTimer.mainMode .. "), lobbyTimerType(" .. Lobby.Timer.lobbyTimer.lobbyTimerType .. ").\n" )
		Lobby.Timer.lobbyTimer.pumpFunc = Util.IsNil( Lobby.Timer.lobbyTimer.pumpFunc )
		Lobby.Timer.lobbyTimer.endFunc = Util.IsNil( Lobby.Timer.lobbyTimer.endFunc )
		LuaUtils.LogQoS( "timer_pump_issue", Lobby.Timer.lobbyTimer )
		Lobby.Timer.Clear( true )
		return 
	elseif f36_local0 then
		if Lobby.Timer.lobbyTimer.pumpFunc ~= nil then
			Lobby.Timer.lobbyTimer.pumpFunc()
		end
	elseif Lobby.Timer.lobbyTimer.endFunc ~= nil then
		Lobby.Timer.lobbyTimer.endFunc()
	end
end

