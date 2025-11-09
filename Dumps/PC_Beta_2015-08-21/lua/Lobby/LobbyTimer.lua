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
	VOTING = 1,
	BEGIN = 2,
	NEED_PLAYERS = 3,
	NEED_BALANCE = 4,
	STARTING = 5
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
		lobbyTimerType = f3_local4.lobbyTimerType
	}
	Lobby.Timer.HostingLobby( f3_local5 )
	Lobby.Pregame.OnMatchEnd( f3_local5 )
end

Lobby.Timer.Clear = function ( f4_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
	if f4_arg0 == true then
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
	local f7_local0 = Lobby.Timer.lobbyTimer.controller
	local f7_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f7_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f7_local3 = 0
	local f7_local4 = 0
	local f7_local5 = Engine.GetLobbyClientCount( f7_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f7_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f7_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyCPTimerStartInterval:get()
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f7_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f7_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f7_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		if f7_local4 > 0 then
			Engine.SetModelValue( f7_local7, Engine.Localize( "MENU_GAME_STARTING_IN", f7_local4 ) )
		else
			Engine.SetModelValue( f7_local7, "" )
		end
		if f7_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f7_local4
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f7_local6, 1 )
			if f7_local4 <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f7_local4 .. "\n" )
			end
		end
		if f7_local4 <= 0 then
			Engine.SetModelValue( f7_local7, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f7_local0, f7_local1 )
			Lobby.Timer.Clear( true )
			return 
		end
		f7_local3 = f7_local4
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f7_local6, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f7_local2, f7_local3 )
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

Lobby.Timer.AutoCPPumpClient = function ( f9_arg0 )
	local f9_local0 = f9_arg0.controller
	local f9_local1 = f9_arg0.lobbyType
	local f9_local2 = f9_arg0.status
	local f9_local3 = f9_arg0.statusValue
	local f9_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f9_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f9_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f9_local4, "" )
	elseif f9_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f9_local3 > 0 then
			Engine.SetModelValue( f9_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f9_local3 ) )
		else
			Engine.SetModelValue( f9_local4, "" )
		end
		if f9_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f9_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f9_local3 .. "\n" )
		end
	end
end

Lobby.Timer.AutoMPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f10_local0 = Lobby.Timer.lobbyTimer.controller
	local f10_local1 = Lobby.Timer.lobbyTimer.lobbyType
	local f10_local2 = Lobby.Timer.lobbyTimer.mainMode
	local f10_local3 = Lobby.Timer.lobbyTimer.lobbyTimerType
	local f10_local4 = Lobby.Timer.lobbyTimer.status
	local f10_local5 = 0
	local f10_local6 = Lobby.Timer.lobbyTimer.endTime
	local f10_local7 = 0
	local f10_local8 = Engine.GetLobbyClientCount( f10_local1 )
	local f10_local9 = math.max( 0, Dvar.party_minplayers:get() - f10_local8 )
	local f10_local10 = f10_local8 == 0
	local f10_local11 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local f10_local12 = 0
	if f10_local6 ~= Lobby.Timer.MATCH_START_INVALID then
		f10_local7 = math.floor( math.max( 0, f10_local6 - Engine.milliseconds() ) / 1000 )
	end
	if f10_local4 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	f10_local5 = f10_local7
	if f10_local10 or f10_local4 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		f10_local4 = Lobby.Timer.LOBBY_STATUS.VOTING
		f10_local6 = Lobby.Timer.MATCH_START_INVALID
	elseif f10_local4 == Lobby.Timer.LOBBY_STATUS.VOTING then
		Lobby.MapVote.ShowVote()
		if f10_local6 == Lobby.Timer.MATCH_START_INVALID then
			f10_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusVotingInterval:get()
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		else
			Engine.SetModelValue( f10_local11, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. f10_local7 )
			if math.max( 0, f10_local6 - Engine.milliseconds() ) == 0 then
				f10_local6 = Lobby.Timer.MATCH_START_INVALID
				f10_local4 = Lobby.Timer.LOBBY_STATUS.BEGIN
				Lobby.MapVote.LockedInVote()
			end
		end
	elseif f10_local4 == Lobby.Timer.LOBBY_STATUS.BEGIN then
		Lobby.MapVote.ShowLockedIn()
		if f10_local6 == Lobby.Timer.MATCH_START_INVALID then
			f10_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusBeginInterval:get()
		else
			Engine.SetModelValue( f10_local11, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
			if math.max( 0, f10_local6 - Engine.milliseconds() ) == 0 then
				f10_local6 = Lobby.Timer.MATCH_START_INVALID
				f10_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			end
		end
	elseif f10_local4 == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		Lobby.MapVote.ShowLockedIn()
		if f10_local9 > 0 then
			if f10_local9 == 1 then
				Engine.SetModelValue( f10_local11, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
			else
				Engine.SetModelValue( f10_local11, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f10_local9 ) )
			end
			f10_local6 = Lobby.Timer.MATCH_START_INVALID
			f10_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			f10_local5 = f10_local9
		else
			f10_local6 = Lobby.Timer.MATCH_START_INVALID
			f10_local4 = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
			Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		end
	elseif f10_local4 == Lobby.Timer.LOBBY_STATUS.NEED_BALANCE then
		Lobby.MapVote.ShowLockedIn()
		if f10_local9 > 0 then
			f10_local6 = Lobby.Timer.MATCH_START_INVALID
			f10_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		else
			local f10_local13 = false
			if Engine.milliseconds() - Lobby.Timer.lobbyTimer.balanceStartTime > 10000 then
				f10_local13 = true
				Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
			end
			if Lobby.TeamSelection.AutoSplitTeam( true, f10_local13 ) then
				f10_local6 = Lobby.Timer.MATCH_START_INVALID
				f10_local4 = Lobby.Timer.LOBBY_STATUS.STARTING
				if Dvar.lobbyMigrate_migrateToBestGameHostEnabled:exists() and Dvar.lobbyMigrate_migrateToBestGameHostEnabled:get() == true then
					Engine.MigrateToBestGameHost( f10_local0 )
				end
			else
				f10_local6 = Lobby.Timer.MATCH_START_INVALID
				f10_local4 = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
				Engine.SetModelValue( f10_local11, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS_TEAMS" ) )
			end
		end
	elseif f10_local4 == Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.MapVote.ShowLockedIn()
		if f10_local9 > 0 then
			f10_local6 = Lobby.Timer.MATCH_START_INVALID
			f10_local4 = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		elseif Lobby.TeamSelection.AutoSplitTeam( true, false ) == false then
			f10_local6 = Lobby.Timer.MATCH_START_INVALID
			f10_local4 = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
			Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
		else
			f10_local4 = Lobby.Timer.LOBBY_STATUS.STARTING
			if f10_local6 == Lobby.Timer.MATCH_START_INVALID then
				f10_local6 = Engine.milliseconds() + Dvar.lobbyTimerStatusStartInterval:get()
			else
				if f10_local7 > 0 then
					Engine.SetModelValue( f10_local11, Engine.Localize( "MENU_GAME_STARTING_IN", f10_local7 ) )
				else
					Engine.SetModelValue( f10_local11, "" )
				end
				if f10_local7 ~= Lobby.Timer.lastValue then
					Lobby.Timer.lastValue = f10_local7
					Engine.PlaySound( LobbyData.Sounds.TimerTick )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f10_local7 .. "\n" )
				end
				if f10_local7 <= 0 then
					Lobby.Timer.lobbyTimer.endFunc()
					Lobby.TeamSelection.AutoSplitTeam( true, true )
					LobbyVM.LaunchGameExec( f10_local0, f10_local1 )
					Lobby.Timer.Clear( true )
					return 
				end
			end
		end
	end
	Lobby.Timer.lobbyTimer.status = f10_local4
	Lobby.Timer.lobbyTimer.endTime = f10_local6
	Engine.SetGameLobbyStatusInfo( Lobby.Timer.lobbyTimer.status, f10_local5 )
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

Lobby.Timer.AutoMPPumpClient = function ( f12_arg0 )
	local f12_local0 = f12_arg0.controller
	local f12_local1 = f12_arg0.lobbyType
	local f12_local2 = f12_arg0.status
	local f12_local3 = f12_arg0.statusValue
	local f12_local4 = f12_arg0.statusValue
	if Engine.IsLobbyHost( f12_local1 ) then
		return 
	end
	local f12_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f12_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	if f12_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		Engine.SetModelValue( f12_local5, "" )
	elseif f12_local2 == Lobby.Timer.LOBBY_STATUS.VOTING then
		Lobby.MapVote.ShowVote()
		Engine.SetModelValue( f12_local5, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. f12_local3 )
	elseif f12_local2 == Lobby.Timer.LOBBY_STATUS.BEGIN then
		Lobby.MapVote.ShowLockedIn()
		Engine.SetModelValue( f12_local5, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
	elseif f12_local2 == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		Lobby.MapVote.ShowLockedIn()
		if f12_local4 == 1 then
			Engine.SetModelValue( f12_local5, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
		else
			Engine.SetModelValue( f12_local5, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f12_local4 ) )
		end
	elseif f12_local2 == Lobby.Timer.LOBBY_STATUS.NEED_BALANCE then
		Lobby.MapVote.ShowLockedIn()
		Engine.SetModelValue( f12_local5, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS_TEAMS" ) )
	elseif f12_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.MapVote.ShowLockedIn()
		if f12_local3 > 0 then
			Engine.SetModelValue( f12_local5, Engine.Localize( "MENU_GAME_STARTING_IN", f12_local3 ) )
		else
			Engine.SetModelValue( f12_local5, "" )
		end
		if f12_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f12_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f12_local3 .. "\n" )
		end
	end
end

Lobby.Timer.AutoZMPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f13_local0 = Lobby.Timer.lobbyTimer.controller
	local f13_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f13_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f13_local3 = 0
	local f13_local4 = 0
	local f13_local5 = Engine.GetLobbyClientCount( f13_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f13_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f13_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyTimerZMStartInterval:get()
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f13_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f13_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f13_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		if f13_local4 > 0 then
			Engine.SetModelValue( f13_local7, Engine.Localize( "MENU_GAME_STARTING_IN", f13_local4 ) )
		else
			Engine.SetModelValue( f13_local7, "" )
		end
		if f13_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f13_local4
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f13_local6, 1 )
			if f13_local4 <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f13_local4 .. "\n" )
			end
		end
		if f13_local4 <= 0 then
			Engine.SetModelValue( f13_local7, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f13_local0, f13_local1 )
			Lobby.Timer.Clear( true )
			return 
		end
		f13_local3 = f13_local4
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f13_local6, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f13_local2, f13_local3 )
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

Lobby.Timer.AutoZMPumpClient = function ( f15_arg0 )
	local f15_local0 = f15_arg0.controller
	local f15_local1 = f15_arg0.lobbyType
	local f15_local2 = f15_arg0.status
	local f15_local3 = f15_arg0.statusValue
	local f15_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f15_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f15_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f15_local4, "" )
	elseif f15_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f15_local3 > 0 then
			Engine.SetModelValue( f15_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f15_local3 ) )
		else
			Engine.SetModelValue( f15_local4, "" )
		end
		if f15_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f15_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f15_local3 .. "\n" )
		end
	end
end

Lobby.Timer.ManualPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f16_local0 = Lobby.Timer.lobbyTimer.controller
	local f16_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f16_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f16_local3 = 0
	local f16_local4 = 0
	local f16_local5 = Engine.GetLobbyClientCount( f16_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f16_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f16_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f16_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f16_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f16_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		if f16_local4 > 0 then
			Engine.SetModelValue( f16_local7, Engine.Localize( "MENU_GAME_STARTING_IN", f16_local4 ) )
		else
			Engine.SetModelValue( f16_local7, "" )
		end
		if f16_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f16_local4
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f16_local6, 1 )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f16_local4 .. "\n" )
		end
		if (Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED ) == 1 or Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED ) == 1) and f16_local4 <= 0 then
			Lobby.Pregame.Start()
			Lobby.Timer.Clear( false )
			return 
		elseif f16_local4 <= 0 then
			Engine.SetModelValue( f16_local7, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			if Lobby.Timer.GetTimerType() == LuaEnums.TIMER_TYPE.THEATER then
				LobbyVM.LaunchDemoExec( f16_local0, f16_local1 )
			else
				LobbyVM.LaunchGameExec( f16_local0, f16_local1 )
			end
			return 
		end
		f16_local3 = f16_local4
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f16_local6, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f16_local2, f16_local3 )
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

Lobby.Timer.ManualPumpClient = function ( f18_arg0 )
	local f18_local0 = f18_arg0.controller
	local f18_local1 = f18_arg0.lobbyType
	local f18_local2 = f18_arg0.status
	local f18_local3 = f18_arg0.statusValue
	local f18_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f18_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f18_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f18_local4, "" )
	elseif f18_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f18_local3 > 0 then
			Engine.SetModelValue( f18_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f18_local3 ) )
		else
			Engine.SetModelValue( f18_local4, "" )
		end
		if f18_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f18_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f18_local3 .. "\n" )
		end
	end
end

Lobby.Timer.ManualCPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f19_local0 = Lobby.Timer.lobbyTimer.controller
	local f19_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f19_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f19_local3 = 0
	local f19_local4 = 0
	local f19_local5 = Engine.GetLobbyClientCount( f19_local1 )
	local f19_local6 = f19_local5 == 0
	Lobby.MapVote.ShowLockedIn()
	local f19_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f19_local6 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f19_local8 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		if f19_local5 == 1 then
			Engine.SetModelValue( f19_local8, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f19_local0, f19_local1 )
		else
			f19_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
			f19_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
			if f19_local4 > 0 then
				Engine.SetModelValue( f19_local8, Engine.Localize( "MENU_GAME_STARTING_IN", f19_local4 ) )
			else
				Engine.SetModelValue( f19_local8, "" )
			end
			if f19_local4 ~= Lobby.Timer.lastValue then
				Lobby.Timer.lastValue = f19_local4
				Engine.PlaySound( LobbyData.Sounds.TimerTick )
				Engine.SetModelValue( f19_local7, 1 )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f19_local4 .. "\n" )
			end
			if f19_local4 <= 0 then
				Engine.SetModelValue( f19_local8, "" )
				Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
				LobbyVM.LaunchGameExec( f19_local0, f19_local1 )
				return 
			end
			f19_local3 = f19_local4
		end
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f19_local7, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f19_local2, f19_local3 )
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

Lobby.Timer.ManualCPPumpClient = function ( f21_arg0 )
	local f21_local0 = f21_arg0.controller
	local f21_local1 = f21_arg0.lobbyType
	local f21_local2 = f21_arg0.status
	local f21_local3 = f21_arg0.statusValue
	local f21_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f21_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f21_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f21_local4, "" )
	elseif f21_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f21_local3 > 0 then
			Engine.SetModelValue( f21_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f21_local3 ) )
		else
			Engine.SetModelValue( f21_local4, "" )
		end
		if f21_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f21_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f21_local3 .. "\n" )
		end
	end
end

Lobby.Timer.TestingPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f22_local0 = Lobby.Timer.lobbyTimer.controller
	local f22_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
	local f22_local2 = Lobby.Timer.LOBBY_STATUS.IDLE
	local f22_local3 = 0
	local f22_local4 = 0
	local f22_local5 = Engine.GetLobbyClientCount( f22_local1 ) == 0
	Lobby.MapVote.ShowLockedIn()
	local f22_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f22_local5 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + 30000
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local f22_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		f22_local4 = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		f22_local2 = Lobby.Timer.LOBBY_STATUS.STARTING
		if f22_local4 > 0 then
			Engine.SetModelValue( f22_local7, Engine.Localize( "MENU_GAME_STARTING_IN", f22_local4 ) )
		else
			Engine.SetModelValue( f22_local7, "" )
		end
		if f22_local4 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f22_local4
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( f22_local6, 1 )
			if f22_local4 <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. f22_local4 .. "\n" )
			end
		end
		if f22_local4 <= 0 then
			Engine.SetModelValue( f22_local7, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( f22_local0, f22_local1 )
			Lobby.Timer.Clear( true )
			return 
		end
		f22_local3 = f22_local4
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( f22_local6, 0 )
	end
	Engine.SetGameLobbyStatusInfo( f22_local2, f22_local3 )
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

Lobby.Timer.TestingPumpClient = function ( f24_arg0 )
	local f24_local0 = f24_arg0.controller
	local f24_local1 = f24_arg0.lobbyType
	local f24_local2 = f24_arg0.status
	local f24_local3 = f24_arg0.statusValue
	local f24_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if f24_local2 ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if f24_local2 == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( f24_local4, "" )
	elseif f24_local2 == Lobby.Timer.LOBBY_STATUS.STARTING then
		if f24_local3 > 0 then
			Engine.SetModelValue( f24_local4, Engine.Localize( "MENU_GAME_STARTING_IN", f24_local3 ) )
		else
			Engine.SetModelValue( f24_local4, "" )
		end
		if f24_local3 ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = f24_local3
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. f24_local3 .. "\n" )
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

Lobby.Timer.NonePumpClient = function ( f27_arg0 )
	
end

Lobby.Timer.UpdateLobbyStatusInfo = function ( f28_arg0 )
	local f28_local0 = f28_arg0.controller
	local f28_local1 = f28_arg0.lobbyType
	local f28_local2 = f28_arg0.status
	local f28_local3 = f28_arg0.statusValue
	local f28_local4 = f28_arg0.statusValue
	if Engine.IsLobbyHost( f28_local1 ) then
		return 
	end
	local f28_local5 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f28_local6 = f28_local5.lobbyTimerType
	if f28_local6 == LuaEnums.TIMER_TYPE.NONE then
		
	elseif f28_local6 == LuaEnums.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.AutoCPPumpClient( f28_arg0 )
	elseif f28_local6 == LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.AutoMPPumpClient( f28_arg0 )
	elseif f28_local6 == LuaEnums.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.AutoZMPumpClient( f28_arg0 )
	elseif f28_local6 == LuaEnums.TIMER_TYPE.MANUAL then
		Lobby.Timer.ManualPumpClient( f28_arg0 )
	elseif f28_local6 == LuaEnums.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.ManualCPPumpClient( f28_arg0 )
	elseif f28_local6 == LuaEnums.TIMER_TYPE.READYUP then
		Lobby.Timer.ManualPumpClient( f28_arg0 )
	elseif f28_local6 == LuaEnums.TIMER_TYPE.THEATER then
		Lobby.Timer.ManualPumpClient( f28_arg0 )
	elseif f28_local6 == LuaEnums.TIMER_TYPE.TESTING then
		Lobby.Timer.TestingPumpClient( f28_arg0 )
	end
end

Lobby.Timer.HostingLobby = function ( f29_arg0 )
	local f29_local0 = f29_arg0.controller
	local f29_local1 = f29_arg0.lobbyType
	local f29_local2 = f29_arg0.mainMode
	local f29_local3 = f29_arg0.lobbyTimerType
	if f29_local1 ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		return false
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.HostingLobby: Creating a lobby timer.\n" )
	Lobby.Timer.Clear( true )
	Lobby.Timer.lobbyTimer = {}
	Lobby.Timer.lobbyTimer.controller = f29_local0
	Lobby.Timer.lobbyTimer.lobbyType = f29_local1
	Lobby.Timer.lobbyTimer.mainMode = f29_local2
	Lobby.Timer.lobbyTimer.lobbyTimerType = f29_local3
	Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
	Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	Lobby.Timer.lobbyTimer.balanceStartTime = 0
	if f29_arg0.status ~= nil and f29_arg0.status ~= Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.Timer.lobbyTimer.status = f29_arg0.status
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + f29_arg0.statusValue * 1000
		Engine.SetGameLobbyStatusInfo( f29_arg0.status, f29_arg0.statusValue )
	end
	if f29_local3 == LuaEnums.TIMER_TYPE.NONE then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.NonePump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.NonePumpEnd
	elseif f29_local3 == LuaEnums.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoCPPumpEnd
	elseif f29_local3 == LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoMPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoMPPumpEnd
	elseif f29_local3 == LuaEnums.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoZMPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoZMPumpEnd
	elseif f29_local3 == LuaEnums.TIMER_TYPE.MANUAL or f29_local3 == LuaEnums.TIMER_TYPE.READYUP or f29_local3 == LuaEnums.TIMER_TYPE.THEATER then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualPumpEnd
	elseif f29_local3 == LuaEnums.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualCPPumpEnd
	elseif f29_local3 == LuaEnums.TIMER_TYPE.TESTING then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.TestingPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.TestingPumpEnd
	end
	return true
end

Lobby.Timer.HostingLobbyEnd = function ( f30_arg0 )
	if f30_arg0.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME or Lobby.Timer.lobbyTimer == nil then
		return true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), "" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
		return Lobby.Timer.lobbyTimer.endFunc()
	end
end

Lobby.Timer.LaunchGame = function ( f31_arg0 )
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f31_local0 = Lobby.Timer.lobbyTimer.controller
	local f31_local1 = Lobby.Timer.lobbyTimer.lobbyType
	local f31_local2 = Lobby.Timer.lobbyTimer.lobbyTimerType
	Lobby.Timer.lobbyTimer.data = f31_arg0
	if f31_local2 == LuaEnums.TIMER_TYPE.MANUAL or f31_local2 == LuaEnums.TIMER_TYPE.READYUP or f31_local2 == LuaEnums.TIMER_TYPE.THEATER then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting game timer.\n" )
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyTimerStartInterval:get()
			if LuaEnums.TEAM_ASSIGNMENT.AUTO == Engine.GetGametypeSetting( "teamAssignment" ) then
				Lobby.TeamSelection.AutoSplitTeam( false )
			end
		end
	elseif f31_local2 == LuaEnums.TIMER_TYPE.MANUAL_CP then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting CP game timer.\n" )
			if Dvar.lobbyCPTimerStartInterval:exists() then
				Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyCPTimerStartInterval:get()
			else
				Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + 4000
			end
		end
	elseif f31_local2 == LuaEnums.TIMER_TYPE.NONE then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: starting game.\n" )
		LobbyVM.LaunchGameExec( f31_local0, f31_local1 )
		Lobby.Timer.Clear( true )
	end
end

Lobby.Timer.Pump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f32_local0 = Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	if not f32_local0 then
		f32_local0 = Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	if Lobby.Timer.lobbyTimer.pumpFunc == nil or Lobby.Timer.lobbyTimer.endFunc == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: (Lobby.Timer.lobbyTimer.pumpFunc == nil) == " .. Util.IsNil( Lobby.Timer.lobbyTimer.pumpFunc ) .. ", (Lobby.Timer.lobbyTimer.endFunc == nil) == " .. Util.IsNil( Lobby.Timer.lobbyTimer.endFunc ) .. ".\n" )
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: lobbyType(" .. Lobby.Timer.lobbyTimer.lobbyType .. "), mainMode(" .. Lobby.Timer.lobbyTimer.mainMode .. "), lobbyTimerType(" .. Lobby.Timer.lobbyTimer.lobbyTimerType .. ").\n" )
	end
	if f32_local0 then
		Lobby.Timer.lobbyTimer.pumpFunc()
	else
		Lobby.Timer.lobbyTimer.endFunc()
	end
end

