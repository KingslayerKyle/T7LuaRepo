require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )

Lobby.Timer = {}
Lobby.Timer.MATCH_START_INVALID = -1
Lobby.Timer.LOBBY_STATUS_NOT_RUNNING = -1
Lobby.Timer.LOBBY_STATUS_IDLE = 0
Lobby.Timer.LOBBY_STATUS_VOTING = 1
Lobby.Timer.LOBBY_STATUS_BEGIN = 2
Lobby.Timer.LOBBY_STATUS_WAITING = 3
Lobby.Timer.LOBBY_STATUS_STARTING = 4
local lastValue = 0
local lobbyTimer = nil
Lobby.Timer.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.Timer.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	Engine.SetModelValue( lobbyStatusModel, "" )
end

Lobby.Timer.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
end

Lobby.Timer.OnClientRemoved = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.Timer.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
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
end

Lobby.Timer.Clear = function ( clearStatus )
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	Engine.SetModelValue( lobbyStatusModel, "" )
	if clearStatus == true then
		Engine.SetGameLobbyStatusInfo( Lobby.Timer.LOBBY_STATUS_IDLE, 0 )
	end
	lastValue = 0
	lobbyTimer = nil
end

Lobby.Timer.GetTimerType = function ()
	if lobbyTimer == nil then
		return LobbyData.TIMER_TYPE_INVALID
	else
		return lobbyTimer.lobbyTimerType
	end
end

Lobby.Timer.GetTimerStatus = function ()
	if lobbyTimer == nil then
		return Lobby.Timer.LOBBY_STATUS_NOT_RUNNING
	else
		return lobbyTimer.status
	end
end

local AutoPump = function ()
	if lobbyTimer == nil then
		return 
	end
	local controller = lobbyTimer.controller
	local lobbyType = lobbyTimer.lobbyType
	local mainMode = lobbyTimer.mainMode
	local timerType = lobbyTimer.lobbyTimerType
	local status = lobbyTimer.status
	local statusValue = 0
	local endTime = lobbyTimer.endTime
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local minPlayers = Dvar.party_minplayers:get()
	local neededPlayers = math.max( 0, minPlayers - numPlayers )
	local f10_local0 = numPlayers == 0
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if endTime ~= Lobby.Timer.MATCH_START_INVALID then
		timeLeft = math.floor( math.max( 0, endTime - Engine.milliseconds() ) / 1000 )
	end
	if status ~= Lobby.Timer.LOBBY_STATUS_STARTING then
		lastValue = 0
	end
	statusValue = timeLeft
	if f10_local0 or status == Lobby.Timer.LOBBY_STATUS_IDLE then
		Lobby.MapVote.Hide()
		status = Lobby.Timer.LOBBY_STATUS_VOTING
		endTime = Lobby.Timer.MATCH_START_INVALID
	elseif status == Lobby.Timer.LOBBY_STATUS_VOTING then
		Lobby.MapVote.ShowVote()
		if endTime == Lobby.Timer.MATCH_START_INVALID then
			endTime = Engine.milliseconds() + Dvar.lobbyTimerStatusVotingInterval:get()
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. timeLeft )
			if math.max( 0, endTime - Engine.milliseconds() ) == 0 then
				endTime = Lobby.Timer.MATCH_START_INVALID
				status = Lobby.Timer.LOBBY_STATUS_BEGIN
				Lobby.MapVote.LockedInVote()
			end
		end
	elseif status == Lobby.Timer.LOBBY_STATUS_BEGIN then
		Lobby.MapVote.ShowLockedIn()
		if endTime == Lobby.Timer.MATCH_START_INVALID then
			endTime = Engine.milliseconds() + Dvar.lobbyTimerStatusBeginInterval:get()
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
			if math.max( 0, endTime - Engine.milliseconds() ) == 0 then
				endTime = Lobby.Timer.MATCH_START_INVALID
				if neededPlayers > 0 then
					status = Lobby.Timer.LOBBY_STATUS_WAITING
				else
					Lobby.TeamSelection.AutoSplitTeam()
					status = Lobby.Timer.LOBBY_STATUS_STARTING
				end
			end
		end
	elseif status == Lobby.Timer.LOBBY_STATUS_WAITING or status == Lobby.Timer.LOBBY_STATUS_STARTING then
		Lobby.MapVote.ShowLockedIn()
		if neededPlayers > 0 then
			if neededPlayers == 1 then
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
			else
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", neededPlayers ) )
			end
			endTime = Lobby.Timer.MATCH_START_INVALID
			status = Lobby.Timer.LOBBY_STATUS_WAITING
			statusValue = neededPlayers
		else
			status = Lobby.Timer.LOBBY_STATUS_STARTING
			if endTime == Lobby.Timer.MATCH_START_INVALID then
				endTime = Engine.milliseconds() + Dvar.lobbyTimerStatusStartInterval:get()
			else
				if timeLeft > 0 then
					Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
				else
					Engine.SetModelValue( lobbyStatusModel, "" )
				end
				if timeLeft ~= lastValue then
					lastValue = timeLeft
					Engine.PlaySound( LobbyData.Sounds.TimerTick )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
				end
				if timeLeft <= 0 then
					lobbyTimer.endFunc()
					LobbyVM.LaunchGameExec( controller, lobbyType )
					Lobby.Timer.Clear( true )
					return 
				end
			end
		end
	end
	lobbyTimer.status = status
	lobbyTimer.endTime = endTime
	Engine.SetGameLobbyStatusInfo( lobbyTimer.status, statusValue )
end

local AutoPumpEnd = function ()
	if lobbyTimer == nil then
		return true
	else
		Lobby.Timer.Clear( false )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.AutoPumpEnd: Kill lobby timer.\n" )
		return true
	end
end

local AutoPumpClient = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local neededPlayers = data.statusValue
	if Engine.IsLobbyHost( lobbyType ) then
		return 
	end
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if status ~= Lobby.Timer.LOBBY_STATUS_STARTING then
		lastValue = 0
	end
	if status == Lobby.Timer.LOBBY_STATUS_IDLE then
		Lobby.MapVote.Hide()
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS_VOTING then
		Lobby.MapVote.ShowVote()
		Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. timeLeft )
	elseif status == Lobby.Timer.LOBBY_STATUS_BEGIN then
		Lobby.MapVote.ShowLockedIn()
		Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_MATCH_WILL_BEGIN" ) )
	elseif status == Lobby.Timer.LOBBY_STATUS_WAITING then
		Lobby.MapVote.ShowLockedIn()
		if neededPlayers == 1 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", neededPlayers ) )
		end
	elseif status == Lobby.Timer.LOBBY_STATUS_STARTING then
		Lobby.MapVote.ShowLockedIn()
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= lastValue then
			lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
end

local ManualPump = function ()
	if lobbyTimer == nil then
		return 
	end
	local controller = lobbyTimer.controller
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	local status = Lobby.Timer.LOBBY_STATUS_IDLE
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f13_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f13_local0 then
		lobbyTimer.status = Lobby.Timer.LOBBY_STATUS_IDLE
		lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		timeLeft = math.floor( (lobbyTimer.endTime - Engine.milliseconds()) / 1000 )
		status = Lobby.Timer.LOBBY_STATUS_STARTING
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= lastValue then
			lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( timerActiveModel, 1 )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
		end
		if timeLeft <= 0 then
			Engine.SetModelValue( lobbyStatusModel, "" )
			lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			if Lobby.Timer.GetTimerType() == LobbyData.TIMER_TYPE_THEATER then
				LobbyVM.LaunchDemoExec( controller, lobbyType )
			else
				LobbyVM.LaunchGameExec( controller, lobbyType )
			end
			Lobby.Timer.Clear( true )
			return 
		end
		statusValue = timeLeft
	else
		lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Engine.SetGameLobbyStatusInfo( status, statusValue )
end

local ManualPumpEnd = function ()
	if lobbyTimer == nil then
		return 
	else
		Lobby.MapVote.ShowLockedIn()
		if lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
			lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
			Engine.SetModelValue( lobbyStatusModel, "" )
			if Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 then
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

local ManualPumpClient = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	if status ~= Lobby.Timer.LOBBY_STATUS_STARTING then
		lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS_IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS_STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= lastValue then
			lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
end

local NonePump = function ()
	
end

local NonePumpEnd = function ()
	Lobby.Timer.Clear( false )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.NonePumpEnd: Kill lobby timer.\n" )
	return true
end

local NonePumpClient = function ( data )
	
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
	if lobbyTimerType == LobbyData.TIMER_TYPE_NONE then
		
	elseif lobbyTimerType == LobbyData.TIMER_TYPE_AUTO then
		AutoPumpClient( data )
	elseif lobbyTimerType == LobbyData.TIMER_TYPE_MANUAL then
		ManualPumpClient( data )
	elseif lobbyTimerType == LobbyData.TIMER_TYPE_READYUP then
		ManualPumpClient( data )
	elseif lobbyTimerType == LobbyData.TIMER_TYPE_THEATER then
		ManualPumpClient( data )
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
	lobbyTimer = {}
	lobbyTimer.controller = controller
	lobbyTimer.lobbyType = lobbyType
	lobbyTimer.mainMode = mainMode
	lobbyTimer.lobbyTimerType = lobbyTimerType
	lobbyTimer.status = Lobby.Timer.LOBBY_STATUS_IDLE
	lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	if data.status ~= nil and data.status ~= Lobby.Timer.LOBBY_STATUS_IDLE then
		lobbyTimer.status = data.status
		lobbyTimer.endTime = Engine.milliseconds() + data.statusValue * 1000
		Engine.SetGameLobbyStatusInfo( data.status, data.statusValue )
	end
	if lobbyTimerType == LobbyData.TIMER_TYPE_NONE then
		lobbyTimer.pumpFunc = NonePump
		lobbyTimer.endFunc = NonePumpEnd
	elseif lobbyTimerType == LobbyData.TIMER_TYPE_AUTO then
		lobbyTimer.pumpFunc = AutoPump
		lobbyTimer.endFunc = AutoPumpEnd
	elseif lobbyTimerType == LobbyData.TIMER_TYPE_MANUAL then
		lobbyTimer.pumpFunc = ManualPump
		lobbyTimer.endFunc = ManualPumpEnd
	elseif lobbyTimerType == LobbyData.TIMER_TYPE_READYUP then
		lobbyTimer.pumpFunc = ManualPump
		lobbyTimer.endFunc = ManualPumpEnd
	elseif lobbyTimerType == LobbyData.TIMER_TYPE_THEATER then
		lobbyTimer.pumpFunc = ManualPump
		lobbyTimer.endFunc = ManualPumpEnd
	end
	return true
end

Lobby.Timer.HostingLobbyEnd = function ( data )
	local lobbyType = data.lobbyType
	if lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME or lobbyTimer == nil then
		return true
	else
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		Engine.SetModelValue( lobbyStatusModel, "" )
		return lobbyTimer.endFunc()
	end
end

Lobby.Timer.LaunchGame = function ( data )
	if lobbyTimer == nil then
		return 
	end
	local controller = lobbyTimer.controller
	local lobbyType = lobbyTimer.lobbyType
	local lobbyTimerType = lobbyTimer.lobbyTimerType
	lobbyTimer.data = data
	if lobbyTimerType == LobbyData.TIMER_TYPE_MANUAL or lobbyTimerType == LobbyData.TIMER_TYPE_READYUP or lobbyTimerType == LobbyData.TIMER_TYPE_THEATER then
		if lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting game timer.\n" )
			lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyTimerStartInterval:get()
			if Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 then
				Lobby.TeamSelection.AutoSplitTeam()
			end
		end
	elseif lobbyTimerType == LobbyData.TIMER_TYPE_NONE then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: starting game.\n" )
		LobbyVM.LaunchGameExec( controller, lobbyType )
		Lobby.Timer.Clear( true )
	end
end

Lobby.Timer.Pump = function ()
	if lobbyTimer == nil then
		return 
	end
	local f23_local0 = Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	if not f23_local0 then
		local isActive = Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	if lobbyTimer.pumpFunc == nil or lobbyTimer.endFunc == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: (lobbyTimer.pumpFunc == nil) == " .. Util.IsNil( lobbyTimer.pumpFunc ) .. ", (lobbyTimer.endFunc == nil) == " .. Util.IsNil( lobbyTimer.endFunc ) .. ".\n" )
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: lobbyType(" .. lobbyTimer.lobbyType .. "), mainMode(" .. lobbyTimer.mainMode .. "), lobbyTimerType(" .. lobbyTimer.lobbyTimerType .. ").\n" )
	end
	if f23_local0 then
		lobbyTimer.pumpFunc()
	else
		lobbyTimer.endFunc()
	end
end

