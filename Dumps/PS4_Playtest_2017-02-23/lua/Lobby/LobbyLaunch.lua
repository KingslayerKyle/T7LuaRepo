require( "lua.Lobby.Common.LobbyCore" )

Lobby.Launch = {}
Lobby.Launch.hostLaunch = {}
Lobby.Launch.clientLaunch = {}
Lobby.Launch.IsHostLaunching = function ()
	if Lobby.Launch.hostLaunch.startTime ~= nil then
		return true
	elseif Engine.LobbyHostLaunchTaskInProgress and Engine.LobbyHostLaunchTaskInProgress() then
		return true
	else
		return false
	end
end

Lobby.Launch.OnHostLaunch = function ( data )
	if data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return Lobby.Launch.HostLaunchInit()
	elseif data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return Lobby.Launch.HostLaunchPump( data )
	else
		return Lobby.Launch.HostLaunchClear()
	end
end

Lobby.Launch.HostLaunchInit = function ()
	local closePopupsModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" )
	Engine.ForceNotifyModelSubscriptions( closePopupsModel )
	Lobby.Launch.hostLaunch = {}
	Lobby.Launch.hostLaunch.fadeToBlack = false
	local startTime = Engine.milliseconds()
	Lobby.Launch.hostLaunch.startTime = startTime
	Lobby.Launch.hostLaunch.fadeToBlackTime = startTime + Dvar.lobbyLaunch_fadeToBlackDelay:get()
	Lobby.Launch.hostLaunch.launchTime = startTime + Dvar.lobbyLaunch_gameLaunchDelay:get()
	Lobby.Launch.hostLaunch.waitForClientAckTime = startTime + Dvar.lobbyLaunch_waitForClientAckDelay:get()
	Lobby.Timer.ResetUIModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	return true
end

Lobby.Launch.HostLaunchPump = function ( data )
	local uiScreenId = Engine.GetLobbyUIScreen()
	local f4_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
	if uiScreenId == f4_local0.id then
		local cancelLaunch = false
		if Dvar.tu9_hostLaunchCheckMinPlayer:get() == true then
			local clientCount = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_ALL )
			if clientCount < Dvar.party_minplayers:get() then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Launch.LaunchGameExec: Not enough players (" .. tostring( clientCount ) .. "/" .. tostring( Dvar.party_minplayers:get() ) .. "), restart timer.\n" )
				cancelLaunch = true
			end
		end
		if Dvar.tu9_hostLaunchCheckUnbalancedTeams:get() == true and true == CoDShared.IsGametypeTeamBased() then
			local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			if gamelobby ~= nil then
				local teamAlliesCount = 0
				local teamAxisCount = 0
				for index, client in ipairs( gamelobby.sessionClients ) do
					if client.team == Enum.team_t.TEAM_ALLIES then
						teamAlliesCount = teamAlliesCount + 1
					end
					if client.team == Enum.team_t.TEAM_AXIS then
						teamAxisCount = teamAxisCount + 1
					end
				end
				if math.abs( teamAlliesCount - teamAxisCount ) > 1 then
					Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Launch.LaunchGameExec: Teams are not balanced (teamAlliesCount: " .. tostring( teamAlliesCount ) .. "/teamAxisCount: " .. tostring( teamAxisCount ) .. "), restart timer.\n" )
					cancelLaunch = true
				end
			end
		end
		if cancelLaunch == true then
			Engine.LobbyLaunchClear()
			Lobby.Launch.HostLaunchClear()
			local uiScreen = LobbyData.GetLobbyMenuByID( uiScreenId )
			local data = {
				controller = Engine.GetPrimaryController(),
				lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
				mainMode = uiScreen.mainMode,
				lobbyTimerType = uiScreen.lobbyTimerType,
				matchEnded = true,
				status = Lobby.Timer.LOBBY_STATUS.RESET_TO_NEED
			}
			Lobby.Timer.HostingLobby( data )
			return false
		end
	end
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ) ) == false then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	end
	if Engine.GetDvarBool( "ffotdtempfixHostLaunchPump" ) then
		if not Engine.IsDedicatedServer() then
			if Lobby.Launch.hostLaunch.fadeToBlack == false and nil ~= Lobby.Launch.hostLaunch.fadeToBlackTime and Engine.milliseconds() > Lobby.Launch.hostLaunch.fadeToBlackTime then
				Lobby.Launch.hostLaunch.fadeToBlack = true
				local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
				Engine.SetModelValue( lobbyHideForStartModel, 1 )
			end
			if nil ~= Lobby.Launch.hostLaunch.launchTime and Engine.milliseconds() < Lobby.Launch.hostLaunch.launchTime then
				return false
			end
		end
	elseif not Engine.IsDedicatedServer() then
		if Lobby.Launch.hostLaunch.fadeToBlack == false and Engine.milliseconds() > Lobby.Launch.hostLaunch.fadeToBlackTime then
			Lobby.Launch.hostLaunch.fadeToBlack = true
			local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
			Engine.SetModelValue( lobbyHideForStartModel, 1 )
		end
		if Engine.milliseconds() < Lobby.Launch.hostLaunch.launchTime then
			return false
		end
	end
	if Engine.IsWaitingForDatabase and Engine.IsWaitingForDatabase() then
		return false
	elseif not data.hasAllClientsGotLatestStateMsg or Engine.milliseconds() < Lobby.Launch.hostLaunch.waitForClientAckTime then
		return false
	elseif not Engine.IsDedicatedServer() then
		if Engine.IsWaitingForDatabase() then
			return false
		elseif Engine.IsCommonFastFileLoaded and not Engine.IsCommonFastFileLoaded() then
			return false
		end
	end
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	Engine.MarkPlaylistRotationEntryPlayed( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	return true
end

Lobby.Launch.HostLaunchClear = function ()
	local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
	Engine.SetModelValue( lobbyHideForStartModel, 0 )
	Lobby.Launch.hostLaunch.startTime = nil
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
	return true
end

Lobby.Launch.OnClientLaunch = function ( data )
	if data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_START then
		return Lobby.Launch.ClientLaunchInit( data.justConnected )
	elseif data.stage == Enum.LaunchGameState.LAUNCH_GAME_STATE_PUMP then
		return Lobby.Launch.ClientLaunchPump()
	else
		return Lobby.Launch.ClientLaunchClear()
	end
end

Lobby.Launch.ClientLaunchInit = function ( justConnected )
	if not LobbyVM.CanClientLaunch( justConnected ) then
		return false
	end
	local closePopupsModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" )
	Engine.ForceNotifyModelSubscriptions( closePopupsModel )
	Lobby.Launch.clientLaunch = {}
	Lobby.Launch.clientLaunch.fadeToBlack = false
	local fadeToBlackDelay = Dvar.lobbyLaunch_fadeToBlackDelay:get()
	local gameLaunchDelay = Dvar.lobbyLaunch_gameLaunchDelay:get()
	if justConnected then
		fadeToBlackDelay = Dvar.lobbyLaunch_fadeToBlackDelayOnConnect:get()
		gameLaunchDelay = Dvar.lobbyLaunch_gameLaunchDelayOnConnect:get()
	end
	local startTime = Engine.milliseconds()
	Lobby.Launch.clientLaunch.startTime = startTime
	Lobby.Launch.clientLaunch.fadeToBlackTime = startTime + fadeToBlackDelay
	Lobby.Launch.clientLaunch.launchTime = startTime + gameLaunchDelay
	Lobby.Timer.ResetUIModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	return true
end

Lobby.Launch.ClientLaunchPump = function ()
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ) ) == false then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
	end
	if false == Lobby.Launch.clientLaunch.fadeToBlack and Engine.milliseconds() > Lobby.Launch.clientLaunch.fadeToBlackTime then
		Lobby.Launch.clientLaunch.fadeToBlack = true
		local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
		Engine.SetModelValue( lobbyHideForStartModel, 1 )
	end
	if Engine.IsWaitingForDatabase and Engine.IsWaitingForDatabase() then
		return false
	elseif Engine.milliseconds() < Lobby.Launch.clientLaunch.launchTime then
		return false
	elseif Engine.IsWaitingForDatabase() then
		return false
	elseif Engine.IsCommonFastFileLoaded and not Engine.IsCommonFastFileLoaded() then
		return false
	else
		return true
	end
end

Lobby.Launch.ClientLaunchClear = function ()
	local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
	Engine.SetModelValue( lobbyHideForStartModel, 0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
	return true
end

