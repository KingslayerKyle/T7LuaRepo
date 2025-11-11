require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.LobbyPregameManager" )
require( "lua.Shared.LobbyData" )
require( "lua.Shared.LuaEnum" )

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
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	Engine.SetModelValue( lobbyTimeRemainingModel, 0 )
end

Lobby.Timer.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		Engine.SetModelValue( lobbyStatusModel, "" )
	end
end

Lobby.Timer.OnSessionEnd = function ( data )
	Lobby.Timer.ResetUIModel()
end

Lobby.Timer.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.Timer.Clear( true )
	Lobby.Pregame.OnMatchStart( data )
end

Lobby.Timer.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule ~= Enum.LobbyModule.LOBBY_MODULE_HOST or lobbyType ~= Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST ) or not Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType ) then
		return 
	end
	local controller = Engine.GetLobbyHostControllerIndex( lobbyType )
	if controller == -1 then
		controller = 0
	end
	local uiScreenId = Engine.GetLobbyUIScreen()
	local uiScreen = LobbyData.GetLobbyMenuByID( uiScreenId )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.MatchEnd: Game must have ended, start host timer.\n" )
	local data = {
		controller = controller,
		lobbyType = lobbyType,
		mainMode = uiScreen.mainMode,
		lobbyTimerType = uiScreen.lobbyTimerType,
		matchEnded = true
	}
	Lobby.Timer.HostingLobby( data )
	Lobby.Pregame.OnMatchEnd( data )
end

Lobby.Timer.OnClientRemoved = function ( data )
	if Lobby.Timer.lobbyTimer == nil then
		return 
	elseif LuaUtils.IsArenaMode() then
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
		if Engine.IsLobbyHost( lobbyType ) and Lobby.Timer.lobbyTimer.status <= Lobby.Timer.LOBBY_STATUS.STARTING then
			Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
			Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
			Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, Lobby.Timer.lobbyTimer.status, 0 )
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
		end
	end
end

Lobby.Timer.LockInLobby = function ( controller )
	if LuaUtils.IsArenaMode() then
		if not Lobby.Timer.LobbyIsLocked() and Engine.GetDvarBool( "probation_league_enabled" ) then
			Engine.SetArenaPregameMatchHistory( controller )
		end
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local lockedInModel = Engine.CreateModel( lobbyRootModel, "lobbyLockedIn" )
		Engine.SetModelValue( lockedInModel, true )
	end
end

Lobby.Timer.LobbyIsLocked = function ()
	if LuaUtils.IsArenaMode() then
		return LuaUtils.LobbyIsLocked()
	else
		return false
	end
end

Lobby.Timer.UnlockLobby = function ( controller, rollbackProbation )
	if Lobby.Timer.LobbyIsLocked() and rollbackProbation == true and Engine.GetDvarBool( "probation_league_enabled" ) then
		Engine.RollbackArenaPregameMatchHistory( controller )
	end
	LuaUtils.UnlockLobby()
end

Lobby.Timer.UpdateAdvertising = function ( showInMatchmaking )
	if Engine.GetDvarBool( "lobbyAdvertiseShowInMatchmaking" ) == showInMatchmaking then
		return 
	elseif showInMatchmaking then
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_TRUE, true )
	else
		Lobby.Matchmaking.ChangeAdvertisedStatus( Enum.ShowInMatchmaking.SHOW_IN_MATCHMAKING_FALSE, true )
	end
end

Lobby.Timer.Clear = function ( clearStatus )
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	Engine.SetModelValue( lobbyStatusModel, "" )
	if Lobby.Timer.lobbyTimer and (Lobby.Timer.lobbyTimer.lobbyTimerType == LuaEnum.TIMER_TYPE.AUTO_ZM or Lobby.Timer.lobbyTimer.lobbyTimerType == LuaEnum.TIMER_TYPE.AUTO_CP) then
		Engine.ClearReadyUpData( Enum.LobbyModule.LOBBY_MODULE_HOST, Lobby.Timer.lobbyType )
		Engine.ClearReadyUpData( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Lobby.Timer.lobbyType )
	end
	Lobby.Timer.ResetUIModel()
	if clearStatus == true and Lobby.Timer.lobbyType ~= nil then
		Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, Lobby.Timer.lobbyType, Lobby.Timer.LOBBY_STATUS.IDLE, 0 )
	end
	Lobby.Timer.lastValue = 0
	Lobby.Timer.lobbyTimer = nil
end

Lobby.Timer.GetTimerType = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return LuaEnum.TIMER_TYPE.INVALID
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
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	local status = Lobby.Timer.lobbyTimer.status
	local endTime = Lobby.Timer.lobbyTimer.endTime
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f14_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	local minPlayers = Dvar.party_minplayers:get()
	local numClients = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_ALL )
	local ready = 0
	local memberCount = numClients
	local gameData = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	for key, value in pairs( gameData.clients ) do
		if value.readyUp == true then
			ready = ready + 1
		end
	end
	if memberCount < minPlayers then
		memberCount = minPlayers
	end
	local readyUpNeeded = math.floor( math.ceil( Dvar.lobby_readyUpPercentRequired:get() * memberCount ) - ready )
	if f14_local0 then
		status = Lobby.Timer.LOBBY_STATUS.IDLE
		endTime = Lobby.Timer.MATCH_START_INVALID
	elseif endTime == Lobby.Timer.MATCH_START_INVALID then
		local startInterval = Dvar.lobbyCPTimerStartInterval:get()
		endTime = Engine.milliseconds() + startInterval
		if (Engine.IsCampaignModeZombies() or Dvar.ui_gametype:get() == "doa") and Dvar.lobbyCPZMTimerStartInterval.exists() then
			endTime = Engine.milliseconds() + Dvar.lobbyCPZMTimerStartInterval:get()
		end
		if Dvar.ui_gametype:get() == "doa" then
			local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
			Engine.LobbySetMap( lobbyType, "cp_doa_bo3" )
			status = Lobby.Timer.LOBBY_STATUS.NEED_READYUP
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_READYUP then
		if 0 < Dvar.lobby_readyUpPercentRequired:get() then
			if readyUpNeeded > 0 then
				local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
				if readyUpNeeded == 1 then
					Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_PLAYER_TO_BE_READY" ) )
				else
					Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_PLAYERS_TO_BE_READY", readyUpNeeded ) )
				end
				statusValue = readyUpNeeded
			else
				status = Lobby.Timer.LOBBY_STATUS.STARTING
				local startInterval = Dvar.lobbyCPTimerStartInterval:get()
				endTime = Engine.milliseconds() + startInterval
			end
		else
			status = Lobby.Timer.LOBBY_STATUS.STARTING
		end
	elseif endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		timeLeft = math.floor( (endTime - Engine.milliseconds()) / 1000 )
		status = Lobby.Timer.LOBBY_STATUS.STARTING
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
			lobbyTimeRemaining = timeLeft
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if Dvar.ui_gametype:get() == "doa" and 0 < Dvar.lobby_readyUpPercentRequired:get() and readyUpNeeded > 0 then
			status = Lobby.Timer.LOBBY_STATUS.NEED_READYUP
			statusValue = Lobby.Timer.MATCH_START_INVALID
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( timerActiveModel, 1 )
			if timeLeft <= 10 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
			end
		end
		local isMigrating = false
		if Engine.IsLobbyMigratActive then
			isMigrating = Engine.IsLobbyMigratActive( lobbyType )
		end
		if Lobby.ProcessQueue.IsQueueEmpty() and isMigrating == false and timeLeft <= 0 and LobbyVM.LaunchGameExec( controller, lobbyType ) == true then
			Engine.SetModelValue( lobbyStatusModel, "" )
			endTime = Lobby.Timer.MATCH_START_INVALID
			Lobby.Timer.Clear( true )
			return 
		end
		statusValue = math.max( timeLeft, 0 )
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
	Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, status, statusValue )
	Lobby.Timer.lobbyTimer.status = status
	Lobby.Timer.lobbyTimer.endTime = endTime
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
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
			lobbyTimeRemaining = timeLeft
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_READYUP then
		local readyUpNeeded = timeLeft
		if readyUpNeeded == 1 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_PLAYER_TO_BE_READY" ) )
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_PLAYERS_TO_BE_READY", readyUpNeeded ) )
		end
	end
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
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
	local f17_local0 = numPlayers == 0
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	local exactTimeLeft = 0
	LobbyVM.CheckSpecialPlaylistRules( controller )
	if endTime ~= Lobby.Timer.MATCH_START_INVALID then
		timeLeft = math.floor( math.max( 0, endTime - Engine.milliseconds() ) / 1000 )
	end
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	statusValue = timeLeft
	if f17_local0 or status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		if LuaUtils.IsArenaMode() then
			status = Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK
		else
			status = Lobby.Timer.LOBBY_STATUS.VOTING
		end
		endTime = Lobby.Timer.MATCH_START_INVALID
	elseif status == Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK then
		Lobby.Timer.UnlockLobby( controller, true )
		if neededPlayers > 0 then
			if neededPlayers == 1 then
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
			else
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", neededPlayers ) )
			end
			endTime = Lobby.Timer.MATCH_START_INVALID
			status = Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK
			statusValue = neededPlayers
		else
			Lobby.Timer.LockInLobby( controller )
			Lobby.TeamSelection.AutoSplitTeam( true, true )
			Lobby.MapVote.UpdateMapVoteInfo()
			Lobby.MapVote.LockedInVote()
			Engine.LobbyHostSetAllClientsPregameState( Lobby.Pregame.ClientState.IDLE )
			endTime = Lobby.Timer.MATCH_START_INVALID
			status = Lobby.Timer.LOBBY_STATUS.BEGIN
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.VOTING then
		Lobby.MapVote.ShowVote()
		if endTime == Lobby.Timer.MATCH_START_INVALID then
			endTime = Engine.milliseconds() + Dvar.lobbyTimerStatusVotingInterval:get()
			if LuaUtils.IsArenaMode() then
				if Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1 and Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1 then
					endTime = Engine.milliseconds() + Engine.GetDvarInt( "lobbyTimerStatusVotingInterval_Arena" )
				end
			else
				Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
			end
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
				if LuaUtils.IsArenaMode() then
					status = Lobby.Timer.LOBBY_STATUS.STARTING
				end
			end
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED then
		endTime = Lobby.Timer.MATCH_START_INVALID
		status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
		if LuaUtils.IsArenaMode() then
			status = Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK
			Lobby.MapVote.Hide()
			Engine.SetModelValue( lobbyStatusModel, "" )
			Lobby.Timer.UpdateAdvertising( true )
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		Lobby.MapVote.ShowLockedIn()
		if neededPlayers > 0 then
			if neededPlayers == 1 then
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
				lobbyTimeRemaining = timeLeft
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
				if Dvar.lobbyMigrate_migrateToBestGameHostEnabled:get() == true then
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
			if LuaUtils.IsArenaMode() then
				endTime = Lobby.Timer.MATCH_START_INVALID
				status = Lobby.Timer.LOBBY_STATUS.IDLE
				Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
				Lobby.Timer.UnlockLobby( controller, true )
			else
				endTime = Lobby.Timer.MATCH_START_INVALID
				status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
				Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_FREE )
			end
		elseif not LuaUtils.IsArenaMode() and Lobby.TeamSelection.AutoSplitTeam( true, false ) == false then
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
					lobbyTimeRemaining = timeLeft
				else
					Engine.SetModelValue( lobbyStatusModel, "" )
				end
				if timeLeft ~= Lobby.Timer.lastValue then
					Lobby.Timer.lastValue = timeLeft
					Engine.PlaySound( LobbyData.Sounds.TimerTick )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
				end
				if not LuaUtils.AllClientsSpectating() and (Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED ) == 1 or Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED ) == 1) and timeLeft <= 0 then
					Lobby.Timer.UpdateAdvertising( false )
					Lobby.Pregame.Start()
					Lobby.Timer.Clear( false )
					return 
				end
				local isMigrating = false
				if Engine.IsLobbyMigratActive then
					isMigrating = Engine.IsLobbyMigratActive( lobbyType )
				end
				if Lobby.ProcessQueue.IsQueueEmpty() and isMigrating == false and timeLeft <= 0 then
					if not LuaUtils.IsArenaMode() then
						Lobby.TeamSelection.AutoSplitTeam( true, true )
					end
					if LobbyVM.LaunchGameExec( controller, lobbyType ) == true then
						Lobby.Timer.lobbyTimer.endFunc()
						Lobby.Timer.Clear( true )
						Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
						return 
					end
				end
			end
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.POST_GAME then
		Lobby.MapVote.ShowEndResult()
		if endTime == Lobby.Timer.MATCH_START_INVALID then
			endTime = Engine.milliseconds() + Dvar.lobbyTimerStatusPostGameInterval:get()
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_ENDED" ) .. ": " .. timeLeft )
			if math.max( 0, endTime - Engine.milliseconds() ) == 0 then
				if LuaUtils.IsArenaMode() then
					endTime = Lobby.Timer.MATCH_START_INVALID
					status = Lobby.Timer.LOBBY_STATUS.IDLE
					Engine.LobbyHostSetAllClientsPregameState( Lobby.Pregame.ClientState.END )
				else
					endTime = Lobby.Timer.MATCH_START_INVALID
					status = Lobby.Timer.LOBBY_STATUS.IDLE
				end
			end
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY then
		local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
		local privateLobbyList = {}
		for index, client in ipairs( gamelobby.sessionClients ) do
			if privateLobbyList[client.simpleLobbyID] == nil then
				privateLobbyList[client.simpleLobbyID] = {}
			end
			table.insert( privateLobbyList[client.simpleLobbyID], client )
		end
		if Engine.IsDedicatedServer() then
			local largestPartySize = 0
			local partyToStay = nil
			for index, privateLobby in pairs( privateLobbyList ) do
				if largestPartySize < #privateLobby then
					largestPartySize = #privateLobby
					partyToStay = privateLobby
				end
			end
			if partyToStay ~= nil then
				for index, privateLobby in ipairs( privateLobbyList ) do
					if privateLobby ~= partyToStay then
						for clientIndex, client in pairs( privateLobby ) do
							Engine.LobbyHost_DisconnectClient( controller, lobbyType, client.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_HOSTRELOAD )
						end
					end
				end
			end
		else
			for index, client in ipairs( privateLobbyList ) do
				if client ~= partyToStay then
					for clientIndex, f17_local6 in pairs( client ) do
						Engine.LobbyHost_DisconnectClient( controller, lobbyType, f17_local6.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_HOSTRELOAD )
					end
				end
			end
		end
		Lobby.TeamSelection.Clear()
		Lobby.MapVote.Hide()
		endTime = Lobby.Timer.MATCH_START_INVALID
		status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.UpdateAdvertising( true )
	end
	if Lobby.Timer.lobbyTimer.status ~= status then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.AutoMPPump status update: " .. Lobby.Timer.LOBBY_STATUS_STRING[status] .. ".\n" )
	end
	Lobby.Timer.lobbyTimer.status = status
	Lobby.Timer.lobbyTimer.endTime = endTime
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
	Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, Lobby.Timer.lobbyTimer.status, statusValue )
end

Lobby.Timer.AutoMPPumpEnd = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return true
	else
		local mapVoteModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
		Engine.SetModelValue( mapVoteModel, 0 )
		Lobby.Timer.Clear( false )
		Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
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
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Lobby.MapVote.Hide()
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.WAIT_FOR_LOBBY_LOCK then
		Lobby.Timer.UnlockLobby( controller, true )
	elseif status == Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED then
		Lobby.Timer.UnlockLobby( controller, true )
	elseif status == Lobby.Timer.LOBBY_STATUS.VOTING then
		if LuaUtils.IsArenaMode() then
			Lobby.Timer.LockInLobby( controller )
		end
		Lobby.MapVote.ShowVote()
		Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_VOTINGTIMEREMAINING" ) .. ": " .. timeLeft )
	elseif status == Lobby.Timer.LOBBY_STATUS.BEGIN then
		if LuaUtils.IsArenaMode() then
			Lobby.Timer.LockInLobby( controller )
		end
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
			lobbyTimeRemaining = timeLeft
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.POST_GAME then
		Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
		Lobby.MapVote.ShowEndResult()
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_ENDED" ) .. ": " .. timeLeft )
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY then
		Lobby.MapVote.Hide()
		Engine.SetModelValue( lobbyStatusModel, "" )
	end
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
end

Lobby.Timer.AutoZMPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	local status = Lobby.Timer.lobbyTimer.status
	local statusValue = 0
	local endTime = Lobby.Timer.lobbyTimer.endTime
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local minPlayers = Dvar.party_minplayers:get()
	local neededPlayers = math.max( 0, minPlayers - numPlayers )
	local f20_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	local numClients = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_ALL )
	local ready = 0
	local memberCount = numClients
	local gameData = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	for key, value in pairs( gameData.clients ) do
		if value.readyUp == true then
			ready = ready + 1
		end
	end
	if memberCount < minPlayers then
		memberCount = minPlayers
	end
	local readyUpNeeded = math.floor( math.ceil( Dvar.lobby_readyUpPercentRequired:get() * memberCount ) - ready )
	if f20_local0 then
		status = Lobby.Timer.LOBBY_STATUS.IDLE
		statusValue = Lobby.Timer.MATCH_START_INVALID
	elseif status == Lobby.Timer.LOBBY_STATUS.IDLE then
		status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
		statusValue = Lobby.Timer.MATCH_START_INVALID
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		if neededPlayers > 0 then
			if neededPlayers == 1 then
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
				lobbyTimeRemaining = timeLeft
			else
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", neededPlayers ) )
			end
			status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			statusValue = Lobby.Timer.MATCH_START_INVALID
			statusValue = neededPlayers
		else
			status = Lobby.Timer.LOBBY_STATUS.NEED_READYUP
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_READYUP then
		if 0 < Dvar.lobby_readyUpPercentRequired:get() then
			if neededPlayers > 0 then
				status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
				statusValue = Lobby.Timer.MATCH_START_INVALID
			elseif readyUpNeeded > 0 then
				if readyUpNeeded == 1 then
					Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_PLAYER_TO_BE_READY" ) )
				else
					Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_PLAYERS_TO_BE_READY", readyUpNeeded ) )
				end
				statusValue = readyUpNeeded
			else
				status = Lobby.Timer.LOBBY_STATUS.STARTING
				local startInterval = Dvar.lobbyTimerZMStartInterval:get()
				endTime = Engine.milliseconds() + startInterval
			end
		else
			status = Lobby.Timer.LOBBY_STATUS.STARTING
			local startInterval = Dvar.lobbyTimerZMStartInterval:get()
			endTime = Engine.milliseconds() + startInterval
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if neededPlayers > 0 then
			status = Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS
			statusValue = Lobby.Timer.MATCH_START_INVALID
		elseif 0 < Dvar.lobby_readyUpPercentRequired:get() and readyUpNeeded > 0 then
			status = Lobby.Timer.LOBBY_STATUS.NEED_READYUP
			statusValue = Lobby.Timer.MATCH_START_INVALID
		else
			timeLeft = math.floor( (endTime - Engine.milliseconds()) / 1000 )
			if timeLeft > 0 then
				Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
				lobbyTimeRemaining = timeLeft
			else
				Engine.SetModelValue( lobbyStatusModel, "" )
			end
			if timeLeft ~= Lobby.Timer.lastValue then
				Lobby.Timer.lastValue = timeLeft
				Engine.SetModelValue( timerActiveModel, 1 )
				if timeLeft <= 10 then
					Engine.PlaySound( LobbyData.Sounds.TimerTick )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
				end
			end
			local isMigrating = false
			if Engine.IsLobbyMigratActive then
				isMigrating = Engine.IsLobbyMigratActive( lobbyType )
			end
			if Lobby.ProcessQueue.IsQueueEmpty() and isMigrating == false and timeLeft <= 0 and LobbyVM.LaunchGameExec( controller, lobbyType ) == true then
				Engine.SetModelValue( lobbyStatusModel, "" )
				endTime = Lobby.Timer.MATCH_START_INVALID
				Lobby.Timer.Clear( true )
				return 
			end
			statusValue = math.max( timeLeft, 0 )
		end
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Lobby.Timer.lobbyTimer.status = status
	Lobby.Timer.lobbyTimer.endTime = endTime
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
	Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, status, statusValue )
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
	local statusValue = data.statusValue
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_PLAYERS then
		local neededPlayers = statusValue
		if neededPlayers == 1 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_1_MORE_PLAYER" ) )
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", neededPlayers ) )
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.NEED_READYUP then
		local readyUpNeeded = statusValue
		if readyUpNeeded == 1 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_PLAYER_TO_BE_READY" ) )
		else
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_WAITING_FOR_PLAYERS_TO_BE_READY", readyUpNeeded ) )
		end
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		local timeLeft = statusValue
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
			lobbyTimeRemaining = timeLeft
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			if timeLeft <= 10 then
				Engine.PlaySound( LobbyData.Sounds.TimerTick )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
			end
		end
	end
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
end

Lobby.Timer.ManualPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Lobby.Timer.lobbyTimer.lobbyType
	local status = Lobby.Timer.LOBBY_STATUS.IDLE
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f23_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	if f23_local0 then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
		Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	elseif Lobby.Timer.lobbyTimer.endTime ~= Lobby.Timer.MATCH_START_INVALID then
		local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
		local exactTimeLeft = (Lobby.Timer.lobbyTimer.endTime - Engine.milliseconds()) / 1000
		timeLeft = math.floor( exactTimeLeft )
		status = Lobby.Timer.LOBBY_STATUS.STARTING
		Lobby.Timer.lobbyTimer.status = status
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
			lobbyTimeRemaining = timeLeft
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.SetModelValue( timerActiveModel, 1 )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
		end
		if not CoDShared.IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_THEATER ) and not LuaUtils.AllClientsSpectating() and (Engine.GetGametypeSetting( Lobby.Pregame.Settings.VOTE_ENABLED ) == 1 or Engine.GetGametypeSetting( Lobby.Pregame.Settings.DRAFT_ENABLED ) == 1) and timeLeft <= 0 then
			Lobby.Pregame.Start()
			Lobby.Timer.Clear( false )
			return 
		end
		local isMigrating = false
		if Engine.IsLobbyMigratActive then
			isMigrating = Engine.IsLobbyMigratActive( lobbyType )
		end
		if Lobby.ProcessQueue.IsQueueEmpty() and isMigrating == false and timeLeft <= 0 then
			if Lobby.Timer.GetTimerType() == LuaEnum.TIMER_TYPE.THEATER then
				Engine.SetModelValue( lobbyStatusModel, "" )
				Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
				LobbyVM.LaunchDemoExec( controller, lobbyType )
				return 
			elseif LobbyVM.LaunchGameExec( controller, lobbyType ) == true then
				Engine.SetModelValue( lobbyStatusModel, "" )
				Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
				return 
			end
		end
		statusValue = math.max( timeLeft, 0 )
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
	Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, status, statusValue )
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
			if Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnum.TEAM_ASSIGNMENT.AUTO then
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

Lobby.Timer.ManualPumpClient = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local status = data.status
	local timeLeft = data.statusValue
	local lobbyStatusModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" )
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
			lobbyTimeRemaining = timeLeft
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
end

Lobby.Timer.ManualCPPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	local status = Lobby.Timer.LOBBY_STATUS.IDLE
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f26_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	if f26_local0 then
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
				lobbyTimeRemaining = timeLeft
			else
				Engine.SetModelValue( lobbyStatusModel, "" )
			end
			if timeLeft ~= Lobby.Timer.lastValue then
				Lobby.Timer.lastValue = timeLeft
				Engine.PlaySound( LobbyData.Sounds.TimerTick )
				Engine.SetModelValue( timerActiveModel, 1 )
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Time left: " .. timeLeft .. "\n" )
			end
			local isMigrating = false
			if Engine.IsLobbyMigratActive then
				isMigrating = Engine.IsLobbyMigratActive( lobbyType )
			end
			if Lobby.ProcessQueue.IsQueueEmpty() and isMigrating == false and timeLeft <= 0 and LobbyVM.LaunchGameExec( controller, lobbyType ) == true then
				Engine.SetModelValue( lobbyStatusModel, "" )
				Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
				return 
			end
			statusValue = math.max( timeLeft, 0 )
		end
	else
		Lobby.Timer.lastValue = 0
		Engine.SetModelValue( timerActiveModel, 0 )
	end
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
	Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, status, statusValue )
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
			if Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnum.TEAM_ASSIGNMENT.AUTO then
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
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
			lobbyTimeRemaining = timeLeft
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
end

Lobby.Timer.TestingPump = function ()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local controller = Lobby.Timer.lobbyTimer.controller
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	local status = Lobby.Timer.LOBBY_STATUS.IDLE
	local statusValue = 0
	local timeLeft = 0
	local numPlayers = Engine.GetLobbyClientCount( lobbyType )
	local f29_local0 = numPlayers == 0
	Lobby.MapVote.ShowLockedIn()
	local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	if f29_local0 then
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
			lobbyTimeRemaining = timeLeft
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
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
	Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, status, statusValue )
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
	local lobbyTimeRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	local lobbyTimeRemaining = 0
	if status ~= Lobby.Timer.LOBBY_STATUS.STARTING then
		Lobby.Timer.lastValue = 0
	end
	Lobby.MapVote.ShowLockedIn()
	if status == Lobby.Timer.LOBBY_STATUS.IDLE then
		Engine.SetModelValue( lobbyStatusModel, "" )
	elseif status == Lobby.Timer.LOBBY_STATUS.STARTING then
		if timeLeft > 0 then
			Engine.SetModelValue( lobbyStatusModel, Engine.Localize( "MENU_GAME_STARTING_IN", timeLeft ) )
			lobbyTimeRemaining = timeLeft
		else
			Engine.SetModelValue( lobbyStatusModel, "" )
		end
		if timeLeft ~= Lobby.Timer.lastValue then
			Lobby.Timer.lastValue = timeLeft
			Engine.PlaySound( LobbyData.Sounds.TimerTick )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYCLIENT, "client time left: " .. timeLeft .. "\n" )
		end
	end
	Engine.SetModelValue( lobbyTimeRemainingModel, lobbyTimeRemaining )
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
	local uiScreen = LobbyData.GetLobbyMenuByID( uiScreenId )
	local lobbyTimerType = uiScreen.lobbyTimerType
	if lobbyTimerType == LuaEnum.TIMER_TYPE.NONE then
		
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.AutoCPPumpClient( data )
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.AutoMPPumpClient( data )
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.AutoZMPumpClient( data )
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.MANUAL then
		Lobby.Timer.ManualPumpClient( data )
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.ManualCPPumpClient( data )
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.READYUP then
		Lobby.Timer.ManualPumpClient( data )
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.THEATER then
		Lobby.Timer.ManualPumpClient( data )
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.TESTING then
		Lobby.Timer.TestingPumpClient( data )
	end
end

Lobby.Timer.HostingLobby = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local mainMode = data.mainMode
	local lobbyTimerType = data.lobbyTimerType
	local matchEnded = data.matchEnded
	if lobbyType ~= Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST ) then
		return false
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.HostingLobby: Creating a lobby timer.\n" )
	Lobby.Pregame.Shutdown( controller )
	Lobby.Timer.Clear( true )
	Lobby.Timer.lobbyTimer = {}
	Lobby.Timer.lobbyTimer.controller = controller
	Lobby.Timer.lobbyTimer.lobbyType = lobbyType
	Lobby.Timer.lobbyTimer.mainMode = mainMode
	Lobby.Timer.lobbyTimer.lobbyTimerType = lobbyTimerType
	if LuaUtils.IsArenaMode() and matchEnded then
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.POST_GAME
		Lobby.Timer.UpdateAdvertising( false )
	else
		Lobby.Timer.lobbyTimer.status = Lobby.Timer.LOBBY_STATUS.IDLE
	end
	Lobby.Timer.lobbyTimer.endTime = Lobby.Timer.MATCH_START_INVALID
	Lobby.Timer.lobbyTimer.balanceStartTime = 0
	if data.status ~= nil then
		if data.status == Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED then
			Lobby.Timer.lobbyTimer.status = data.status
			Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, data.status, 0 )
		elseif data.status ~= Lobby.Timer.LOBBY_STATUS.IDLE then
			Lobby.Timer.lobbyTimer.status = data.status
			if data.status == Lobby.Timer.LOBBY_STATUS.STARTING and data.statusValue < 5 then
				data.statusValue = Dvar.lobbyTimerStatusStartInterval:get() / 1000
			end
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + data.statusValue * 1000
			Engine.SetGameLobbyStatusInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, data.status, data.statusValue )
		end
	end
	if lobbyTimerType == LuaEnum.TIMER_TYPE.NONE then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.NonePump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.NonePumpEnd
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.AUTO_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoCPPumpEnd
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.AUTO_MP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoMPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoMPPumpEnd
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.AUTO_ZM then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.AutoZMPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.AutoZMPumpEnd
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.MANUAL or lobbyTimerType == LuaEnum.TIMER_TYPE.READYUP or lobbyTimerType == LuaEnum.TIMER_TYPE.THEATER then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualPumpEnd
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.MANUAL_CP then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.ManualCPPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.ManualCPPumpEnd
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.TESTING then
		Lobby.Timer.lobbyTimer.pumpFunc = Lobby.Timer.TestingPump
		Lobby.Timer.lobbyTimer.endFunc = Lobby.Timer.TestingPumpEnd
	end
	return true
end

Lobby.Timer.HostingLobbyEnd = function ( data )
	local lobbyType = data.lobbyType
	if lobbyType ~= Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST ) or Lobby.Timer.lobbyTimer == nil then
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
	if lobbyTimerType == LuaEnum.TIMER_TYPE.MANUAL or lobbyTimerType == LuaEnum.TIMER_TYPE.READYUP or lobbyTimerType == LuaEnum.TIMER_TYPE.THEATER then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting game timer.\n" )
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyTimerStartInterval:get()
			if LuaEnum.TEAM_ASSIGNMENT.AUTO == Engine.GetGametypeSetting( "teamAssignment" ) and not LuaUtils.IsArenaMode() and lobbyTimerType ~= LuaEnum.TIMER_TYPE.THEATER then
				Lobby.TeamSelection.AutoSplitTeam( false )
			end
		end
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.MANUAL_CP then
		if Lobby.Timer.lobbyTimer.endTime == Lobby.Timer.MATCH_START_INVALID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: setting CP game timer.\n" )
			Lobby.Timer.lobbyTimer.endTime = Engine.milliseconds() + Dvar.lobbyCPTimerStartInterval:get()
			Lobby.TeamSelection.AutoAssignFreePlayersCP()
		end
	elseif lobbyTimerType == LuaEnum.TIMER_TYPE.NONE then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch Game: starting game.\n" )
		LobbyVM.LaunchGameExec( controller, lobbyType )
		Lobby.Timer.Clear( true )
		Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
	end
end

Lobby.Timer.Pump = function ()
	LobbyVM.IngameMonitor()
	if Lobby.Timer.lobbyTimer == nil then
		return 
	end
	local f39_local0 = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	if not f39_local0 then
		f39_local0 = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		if not f39_local0 then
			f39_local0 = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			if not f39_local0 then
				local isActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			end
		end
	end
	if Lobby.Timer.lobbyTimer.pumpFunc == nil or Lobby.Timer.lobbyTimer.endFunc == nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: (Lobby.Timer.lobbyTimer.pumpFunc == nil) == " .. LuaUtils.IsNil( Lobby.Timer.lobbyTimer.pumpFunc ) .. ", (Lobby.Timer.lobbyTimer.endFunc == nil) == " .. Util.IsNil( Lobby.Timer.lobbyTimer.endFunc ) .. ".\n" )
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Timer.Pump: lobbyType(" .. Lobby.Timer.lobbyTimer.lobbyType .. "), mainMode(" .. Lobby.Timer.lobbyTimer.mainMode .. "), lobbyTimerType(" .. Lobby.Timer.lobbyTimer.lobbyTimerType .. ").\n" )
		Lobby.Timer.lobbyTimer.pumpFunc = LuaUtils.IsNil( Lobby.Timer.lobbyTimer.pumpFunc )
		Lobby.Timer.lobbyTimer.endFunc = LuaUtils.IsNil( Lobby.Timer.lobbyTimer.endFunc )
		LuaUtils.LogQoS( "timer_pump_issue", Lobby.Timer.lobbyTimer )
		Lobby.Timer.Clear( true )
		Lobby.Timer.UnlockLobby( Engine.GetPrimaryController(), false )
		return 
	elseif f39_local0 then
		if Lobby.Timer.lobbyTimer.pumpFunc ~= nil then
			Lobby.Timer.lobbyTimer.pumpFunc()
		end
	elseif Lobby.Timer.lobbyTimer.endFunc ~= nil then
		Lobby.Timer.lobbyTimer.endFunc()
	end
end

