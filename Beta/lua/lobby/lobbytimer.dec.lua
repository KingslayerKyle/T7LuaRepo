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
Lobby.Timer.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		Engine.SetModelValue( lobbyStatusModel, "" )
	end
end

Lobby.Timer.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.Timer.Clear( true )
end

Lobby.Timer.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule ~= Enum.LobbyModule.LOBBY_MODULE_HOST or lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME or not Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	end
	local controller = Engine.GetLobbyHostControllerIndex( Enum.LobbyType.LOBBY_TYPE_GAME )
	if controller == -1 then
		controller = 0
	end
	local uiScreenId = Engine.GetLobbyUIScreen()
	local uiScreen = LobbyData:UITargetFromId( uiScreenId )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.MatchEnd: Game must have ended, start host timer.\n" )
	local data = {
		controller = controller,
		lobbyType = lobbyType,
		mainMode = uiScreen.mainMode,
		lobbyTimerType = uiScreen.lobbyTimerType
	}
	Lobby.Timer.HostingLobby( data )
	Lobby.Pregame.OnMatchEnd( data )
end

Lobby.Timer.Clear = function ( clearStatus )
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	Engine.SetModelValue( lobbyStatusModel, "" )
	if clearStatus == true then
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
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	local status = Lobby.Timer.LOBBY_STATUS.IDLE
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f7_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f7_local0 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		local startInterval = Dvar.lobbyCPTimerStartInterval:get()
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + startInterval
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		timeLeft = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		status = Lobby.Timer.LOBBY_STATUS.STARTING
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( timerActiveModel, 1 )
			if timeLeft <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
			end
		end
		if timeLeft <= 0 then
			Engine.SetModelValue( lobbyStatusModel, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( controller, lobbyType )
			Lobby.Timer.Clear( true )
			return 
		end
		statusValue = timeLeft
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Engine.SetGameLobbyStatusInfo( status, statusValue )
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

Lobby.Timer.AutoCPPumpClient = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
end

Lobby.Timer.AutoMPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Lobby.Timer.lobbyTimer.lobbyType
	local mainMode = Lobby.Timer.lobbyTimer.mainMode
	local timerType = Lobby.Timer.lobbyTimer.lobbyTimerType
	local status = Lobby.Timer.lobbyTimer.status
	local statusValue = 0
	local endTime = Lobby.Timer.lobbyTimer.endTime
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local minPlayers = Dvar.party_minplayers:get()
	local neededPlayers = math.max( 0, minPlayers - numPlayers )
	local f10_local0 = numPlayers == 0
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local exactTimeLeft = 0
	if endTime ~= Lobby.Timer.MATCH_START_INVALID then
		timeLeft = math.floor( math.max( 0, endTime - Engine.milliseconds() ) / 1000 )
	end
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	statusValue = timeLeft
	if f10_local0 or status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		status = Lobby.Timer.LOBBY_STATUS.VOTING
		endTime = Lobby.Timer.MATCH_START_INVALID
	elseif status == Lobby.Timer.LOBBY_STATUS.VOTING then
		Lobby.MapVote.ShowVote()
		if endTime == Lobby.Timer.MATCH_START_INVALID then
			endTime = Engine.milliseconds() + Dvar.lobbyTimerStatusVotingInterval:get()
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. timeLeft )
			if math.max( 0, endTime - Engine.milliseconds() ) == 0 then
				endTime = Lobby.Timer.MATCH_START_INVALID
				status = Lobby.Timer.LOBBY_STATUS.BEGIN
				Lobby.MapVote.LockedInVote()
			end
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.BEGIN then
		Lobby.MapVote.ShowLockedIn()
		if endTime == Lobby.Timer.MATCH_START_INVALID then
			endTime = Engine.milliseconds() + Dvar.lobbyTimerStatusBeginInterval:get()
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
			if math.max( 0, endTime - Engine.milliseconds() ) == 0 then
				endTime = Lobby.Timer.MATCH_START_INVALID
				status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			end
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		Lobby.MapVote.ShowLockedIn()
		if neededPlayers > 0 then
			if neededPlayers == 1 then
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
			else
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", neededPlayers ) )
			end
			endTime = Lobby.Timer.MATCH_START_INVALID
			status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			statusValue = neededPlayers
		else
			endTime = Lobby.Timer.MATCH_START_INVALID
			status = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
			Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_BALANCE then
		Lobby.MapVote.ShowLockedIn()
		if neededPlayers > 0 then
			endTime = Lobby.Timer.MATCH_START_INVALID
			status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		else
			local logBalance = false
			if Engine.milliseconds() - Lobby.Timer.lobbyTimer.balanceStartTime > 10000 then
				logBalance = true
				Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
			end
			local balanced = Lobby.TeamSelection.AutoSplitTeam( true, logBalance )
			if balanced then
				endTime = Lobby.Timer.MATCH_START_INVALID
				status = Lobby.Timer.LOBBY_STATUS.STARTING
				if Dvar.lobbyMigrate_migrateToBestGameHostEnabled:exists() and Dvar.lobbyMigrate_migrateToBestGameHostEnabled:get() == true then
					Engine.MigrateToBestGameHost( controller )
				end
			else
				endTime = Lobby.Timer.MATCH_START_INVALID
				status = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS_TEAMS" ) )
			end
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.MapVote.ShowLockedIn()
		if neededPlayers > 0 then
			endTime = Lobby.Timer.MATCH_START_INVALID
			status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		elseif Lobby.TeamSelection.AutoSplitTeam( true, false ) == false then
			endTime = Lobby.Timer.MATCH_START_INVALID
			status = Lobby.Timer.LOBBY_STATUS.NEED_BALANCE
			Lobby.Timer.lobbyTimer.balanceStartTime = Engine.milliseconds()
		else
			status = Lobby.Timer.LOBBY_STATUS.STARTING
			if endTime == Lobby.Timer.MATCH_START_INVALID then
				endTime = Engine.milliseconds() + Dvar.lobbyTimerStatusStartInterval:get()
			else
				if timeLeft > 0 then
					Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
				else
					Engine.SetModelValue( lobbyStatusModel, "" )
				end
				if timeLeft ~= Lobby.Timer.lastValue then
					Lobby.Timer.lastValue = timeLeft
					Engine.PlaySound( LobbyData.Sounds.TimerTick )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
				end
				if timeLeft <= 0 then
					Lobby.Timer.lobbyTimer.endFunc()
					Lobby.TeamSelection.AutoSplitTeam( true, true )
					LobbyVM.LaunchGameExec( controller, lobbyType )
					Lobby.Timer.Clear( true )
					return 
				end
			end
		end
	end
	Lobby.Timer.lobbyTimer.status = status
	Lobby.Timer.lobbyTimer.endTime = endTime
	Engine.SetGameLobbyStatusInfo( Lobby.Timer.lobbyTimer.status, statusValue )
end

Lobby.Timer.AutoMPPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return true
	else
		local mapVoteModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
		Engine.SetModelValue( mapVoteModel, 0 )
		Lobby.Timer.Clear( false )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.AutoMPPumpEnd: Kill lobby timer.\n" )
		return true
	end
end

Lobby.Timer.AutoMPPumpClient = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local neededPlayers = data.statusValue
	if Engine.IsLobbyHost( lobbyType ) then
		return 
	end
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.VOTING then
		Lobby.MapVote.ShowVote()
		Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. timeLeft )
	elseif status == Lobby.Timer.LOBBY_STATUS.BEGIN then
		Lobby.MapVote.ShowLockedIn()
		Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		Lobby.MapVote.ShowLockedIn()
		if neededPlayers == 1 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", neededPlayers ) )
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_BALANCE then
		Lobby.MapVote.ShowLockedIn()
		Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS_TEAMS" ) )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.MapVote.ShowLockedIn()
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
end

Lobby.Timer.AutoZMPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	local status = Lobby.Timer.LOBBY_STATUS.IDLE
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f13_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f13_local0 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		local startInterval = Dvar.lobbyTimerZMStartInterval:get()
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + startInterval
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		timeLeft = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		status = Lobby.Timer.LOBBY_STATUS.STARTING
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( timerActiveModel, 1 )
			if timeLeft <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
			end
		end
		if timeLeft <= 0 then
			Engine.SetModelValue( lobbyStatusModel, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( controller, lobbyType )
			Lobby.Timer.Clear( true )
			return 
		end
		statusValue = timeLeft
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Engine.SetGameLobbyStatusInfo( status, statusValue )
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

Lobby.Timer.AutoZMPumpClient = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
end

Lobby.Timer.ManualPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	local status = Lobby.Timer.LOBBY_STATUS.IDLE
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f16_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f16_local0 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		local exactTimeLeft = (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000
		timeLeft = math.floor( exactTimeLeft )
		status = Lobby.Timer.LOBBY_STATUS.STARTING
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( timerActiveModel, 1 )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
		end
		if (Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED ) == 1 or Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED ) == 1) and timeLeft <= 0 then
			Lobby.Pregame.Start()
			Lobby.Timer.Clear( false )
			return 
		elseif timeLeft <= 0 then
			Engine.SetModelValue( lobbyStatusModel, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			if Lobby.Timer.GetTimerType() == LuaEnums.TIMER_TYPE.THEATER then
				LobbyVM.LaunchDemoExec( controller, lobbyType )
			else
				LobbyVM.LaunchGameExec( controller, lobbyType )
			end
			return 
		end
		statusValue = timeLeft
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Engine.SetGameLobbyStatusInfo( status, statusValue )
end

Lobby.Timer.ManualPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	else
		Lobby.MapVote.ShowLockedIn()
		if Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
			Engine.SetModelValue( lobbyStatusModel, "" )
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

Lobby.Timer.ManualPumpClient = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
end

Lobby.Timer.ManualCPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	local status = Lobby.Timer.LOBBY_STATUS.IDLE
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f19_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f19_local0 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		if numPlayers == 1 then
			Engine.SetModelValue( lobbyStatusModel, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( controller, lobbyType )
		else
			local exactTimeLeft = (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000
			timeLeft = math.floor( exactTimeLeft )
			status = Lobby.Timer.LOBBY_STATUS.STARTING
			if timeLeft > 0 then
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
			else
				Engine.SetModelValue( lobbyStatusModel, "" )
			end
			if timeLeft ~= Lobby.Timer.lastValue then
				Lobby.Timer.lastValue = timeLeft
				Engine.PlaySound( LobbyData.Sounds.TimerTick )
				Engine.SetModelValue( timerActiveModel, 1 )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
			end
			if timeLeft <= 0 then
				Engine.SetModelValue( lobbyStatusModel, "" )
				Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
				LobbyVM.LaunchGameExec( controller, lobbyType )
				return 
			end
			statusValue = timeLeft
		end
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Engine.SetGameLobbyStatusInfo( status, statusValue )
end

Lobby.Timer.ManualCPPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	else
		Lobby.MapVote.ShowLockedIn()
		if Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
			Engine.SetModelValue( lobbyStatusModel, "" )
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

Lobby.Timer.ManualCPPumpClient = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
end

Lobby.Timer.TestingPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	local status = Lobby.Timer.LOBBY_STATUS.IDLE
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f22_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f22_local0 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
		local startInterval = 30000
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + startInterval
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		timeLeft = math.floor( (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		status = Lobby.Timer.LOBBY_STATUS.STARTING
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( timerActiveModel, 1 )
			if timeLeft <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
			end
		end
		if timeLeft <= 0 then
			Engine.SetModelValue( lobbyStatusModel, "" )
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			LobbyVM.LaunchGameExec( controller, lobbyType )
			Lobby.Timer.Clear( true )
			return 
		end
		statusValue = timeLeft
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Engine.SetGameLobbyStatusInfo( status, statusValue )
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

Lobby.Timer.TestingPumpClient = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
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

Lobby.Timer.NonePumpClient = function ( data )
	
end

Lobby.Timer.UpdateLobbyStatusInfo = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local neededPlayers = data.statusValue
	if Engine.IsLobbyHost( lobbyType ) then
		return 
	end
	local uiScreenId = Engine.GetLobbyUIScreen()
	local uiScreen = LobbyData:UITargetFromId( uiScreenId )
	local lobbyTimerType = uiScreen.lobbyTimerType
	if lobbyTimerType == LuaEnums.TIMER_TYPE.NONE then
		
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.AutoCPPumpClient( data )
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.AutoMPPumpClient( data )
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.AutoZMPumpClient( data )
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL then
		Lobby.Timer.ManualPumpClient( data )
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.ManualCPPumpClient( data )
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.READYUP then
		Lobby.Timer.ManualPumpClient( data )
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.THEATER then
		Lobby.Timer.ManualPumpClient( data )
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.TESTING then
		Lobby.Timer.TestingPumpClient( data )
	end
end

Lobby.Timer.HostingLobby = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local mainMode = data.mainMode
	local lobbyTimerType = data.lobbyTimerType
	if lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		return false
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.HostingLobby: Creating a lobby timer.\n" )
	Lobby.Timer.Clear( true )
	Lobby.Timer.lobbyTimer = {}
	Lobby.Timer.lobbyTimer.controller = controller
	Lobby.Timer.lobbyTimer.lobbyType = lobbyType
	Lobby.Timer.lobbyTimer.mainMode = mainMode
	Lobby.Timer.lobbyTimer.lobbyTimerType = lobbyTimerType
	Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
	Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	Lobby.Timer.lobbyTimer.balanceStartTime = 0
	if data.status ~= nil and data.status ~= Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.Timer.lobbyTimer.status = data.status
		Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + data.statusValue * 1000
		Engine.SetGameLobbyStatusInfo( data.status, data.statusValue )
	end
	if lobbyTimerType == LuaEnums.TIMER_TYPE.NONE then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.NonePump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.NonePumpEnd
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoCPPumpEnd
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoMPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoMPPumpEnd
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoZMPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoZMPumpEnd
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL or lobbyTimerType == LuaEnums.TIMER_TYPE.READYUP or lobbyTimerType == LuaEnums.TIMER_TYPE.THEATER then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualPumpEnd
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualCPPumpEnd
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.TESTING then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.TestingPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.TestingPumpEnd
	end
	return true
end

Lobby.Timer.HostingLobbyEnd = function ( data )
	local lobbyType = data.lobbyType
	if lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME or Lobby.Timer.lobbyTimer == nil then
		return true
	else
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		Engine.SetModelValue( lobbyStatusModel, "" )
		local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
		Engine.SetModelValue( lobbyHideForStartModel, 0 )
		return Lobby.Timer.lobbyTimer.endFunc()
	end
end

Lobby.Timer.LaunchGame = function ( data )
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Lobby.Timer.lobbyTimer.lobbyType
	local lobbyTimerType = Lobby.Timer.lobbyTimer.lobbyTimerType
	Lobby.Timer.lobbyTimer.data = data
	if lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL or lobbyTimerType == LuaEnums.TIMER_TYPE.READYUP or lobbyTimerType == LuaEnums.TIMER_TYPE.THEATER then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting game timer.\n" )
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyTimerStartInterval:get()
			if LuaEnums.TEAM_ASSIGNMENT.AUTO == Engine.GetGametypeSetting( "teamAssignment" ) then
				Lobby.TeamSelection.AutoSplitTeam( false )
			end
		end
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL_CP then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting CP game timer.\n" )
			if Dvar.lobbyCPTimerStartInterval:exists() then
				Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyCPTimerStartInterval:get()
			else
				Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + 4000
			end
		end
	elseif lobbyTimerType == LuaEnums.TIMER_TYPE.NONE then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: starting game.\n" )
		LobbyVM.LaunchGameExec( controller, lobbyType )
		Lobby.Timer.Clear( true )
	end
end

Lobby.Timer.Pump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f32_local0 = Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	if not f32_local0 then
		local isActive = Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME )
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

