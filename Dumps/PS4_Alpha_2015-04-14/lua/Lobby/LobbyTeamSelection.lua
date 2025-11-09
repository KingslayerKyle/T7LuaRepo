require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.TeamSelection = {}
local GAMETYPE_FFA = "dm"
local DONT_SWITCH = -1
local TEAM_SWITCH_DELAY = 1500
local LOCAL_CLIENT_COUNT = 4
Lobby.TeamSelection.Clients = {}
SPECTATOR_ALLOWED = {
	Enum.team_t.TEAM_ALLIES,
	Enum.team_t.TEAM_AXIS,
	Enum.team_t.TEAM_SPECTATOR
}
SPECTATOR_NOT_ALLOWED = {
	Enum.team_t.TEAM_ALLIES,
	Enum.team_t.TEAM_AXIS
}
SPECTATOR_ONLY = {
	Enum.team_t.TEAM_FREE,
	Enum.team_t.TEAM_SPECTATOR
}
local availableTeams = SPECTATOR_ALLOWED
local lastGameMode = ""
Lobby.TeamSelection.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.TeamSelection.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.Clear()
	end
end

Lobby.TeamSelection.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.ClientJoined( data )
	end
end

Lobby.TeamSelection.OnClientRemoved = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.TeamSelection.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
end

Lobby.TeamSelection.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST then
		if lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM and Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 then
			Lobby.TeamSelection.Clear()
		elseif lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			Lobby.TeamSelection.Clear()
		end
	end
end

Lobby.TeamSelection.OnGametypeSettingsChange = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.GametypeSettingsChange()
	end
end

local TeamIdToString = function ( teamId )
	if teamId == Enum.team_t.TEAM_ALLIES then
		return "ALLIES"
	elseif teamId == Enum.team_t.TEAM_AXIS then
		return "AXIS"
	elseif teamId == Enum.team_t.TEAM_SPECTATOR then
		return "CASTER"
	else
		return "FREE"
	end
end

Lobby.TeamSelection.SwitchTeam = function ( data )
	local controller = data.controller
	local selection = data.selection
	local client = Lobby.TeamSelection.Clients[controller + 1]
	if 1 == Engine.GetGametypeSetting( "autoTeamBalance" ) then
		return 
	elseif 1 == Engine.GetGametypeSetting( "allowspectating" ) then
		if GAMETYPE_FFA == Engine.GameLobbyGetGameType() then
			availableTeams = SPECTATOR_ONLY
		else
			availableTeams = SPECTATOR_ALLOWED
		end
	else
		availableTeams = SPECTATOR_NOT_ALLOWED
	end
	local currTeam = 0
	local newTeam = 1
	for index = 1, #availableTeams, 1 do
		if client.switchTeam == availableTeams[index] then
			currTeam = index
			break
		end
	end
	if selection == 0 then
		if currTeam <= 1 then
			newTeam = #availableTeams
		else
			newTeam = currTeam - 1
		end
	elseif #availableTeams <= currTeam then
		newTeam = 1
	else
		newTeam = currTeam + 1
	end
	client.switchTeam = availableTeams[newTeam]
	Engine.LuiVM_Event( "team_switch", {
		controller = controller,
		switchTeam = client.switchTeam
	} )
	if client.team == client.switchTeam then
		client.switchTeamTime = DONT_SWITCH
	else
		client.switchTeamTime = TEAM_SWITCH_DELAY + Engine.milliseconds()
	end
end

Lobby.TeamSelection.GameModeChanged = function ( data )
	local controller = data.controller
	local gameType = Engine.GameLobbyGetGameType()
	if lastGameMode == gameType then
		return 
	end
	lastGameMode = gameType
	if gameType == GAMETYPE_FFA then
		Engine.ClearTeamData( Enum.team_t.TEAM_ALLIES )
		Engine.ClearTeamData( Enum.team_t.TEAM_AXIS )
	else
		Lobby.TeamSelection.GametypeSettingsChange()
	end
end

Lobby.TeamSelection.SendChanges = function ()
	for controller = 1, LOCAL_CLIENT_COUNT, 1 do
		local client = Lobby.TeamSelection.Clients[controller]
		if client.switchTeamTime ~= DONT_SWITCH and client.switchTeamTime < Engine.milliseconds() then
			client.switchTeamTime = DONT_SWITCH
			Engine.TeamSelection( controller - 1, client.switchTeam )
		end
	end
end

Lobby.TeamSelection.GameLobbyClientDataUpdate = function ( data )
	for controller = 1, LOCAL_CLIENT_COUNT, 1 do
		local xuid = Engine.GetXUID64( controller - 1 )
		local client = Lobby.TeamSelection.Clients[controller]
		for key, value in pairs( data ) do
			if value.xuid ~= 0 and xuid == value.xuid then
				client.team = value.team
				if client.switchTeam == Enum.team_t.TEAM_FREE then
					client.switchTeam = client.team
				end
			end
		end
	end
end

Lobby.TeamSelection.AddToPrivateLobbyList = function ( member, memberIndex, privateLobbyList )
	for index, privateLobby in ipairs( privateLobbyList ) do
		if member.groupID == privateLobby.groupID then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding Member " .. member.gamertag .. " to privateLobby " .. index .. "\n" )
			privateLobby.groupScore = privateLobby.groupScore + member.score
			table.insert( privateLobby.memberList, memberIndex )
			return 
		end
	end
	local privateLobby = {
		groupID = member.groupID,
		groupScore = member.score,
		memberList = {}
	}
	table.insert( privateLobby.memberList, memberIndex )
	table.insert( privateLobbyList, privateLobby )
end

Lobby.TeamSelection.AutoSplitTeam = function ()
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local clientCount = #gamelobby.sessionClients
	local privateList = {}
	local teamAlliesCount = 0
	local teamAxisCount = 0
	local privateLobbyList = {}
	local sortByGroupSize_func = function ( a, b )
		return #b.memberList < #a.memberList
	end
	
	local sortByScore_func = function ( a, b )
		return b.groupScore < a.groupScore
	end
	
	for index, client in ipairs( gamelobby.sessionClients ) do
		Lobby.TeamSelection.AddToPrivateLobbyList( client, index, privateLobbyList )
	end
	table.sort( privateLobbyList, sortByScore_func )
	table.sort( privateLobbyList, sortByGroupSize_func )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.AutoSplitTeam start\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "gamelobby data:\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	for index, client in ipairs( gamelobby.sessionClients ) do
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( index ) .. ") " .. client.gamertag .. " - groupID(" .. tostring( client.groupID ) .. ") -- debugGroupID: " .. tostring( client.debugGroupID ) .. " -- score: " .. tostring( client.score ) .. "\n" )
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Team Assignment:\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	for i, client in ipairs( privateLobbyList ) do
		local f14_local3 = Enum.team_t.TEAM_ALLIES
		if teamAxisCount < teamAlliesCount then
			f14_local3 = Enum.team_t.TEAM_AXIS
			teamAxisCount = teamAxisCount + #client.memberList
		else
			teamAlliesCount = teamAlliesCount + #client.memberList
		end
		for mIndex, member in ipairs( client.memberList ) do
			local client = gamelobby.sessionClients[member]
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( i ) .. " - " .. tostring( mIndex ) .. ") " .. client.gamertag .. " - groupID(" .. tostring( client.groupID ) .. ") -- debugGroupID: " .. tostring( client.debugGroupID ) .. " -- team: " .. TeamIdToString( f14_local3 ) .. " -- groupScore: " .. tostring( client.groupScore ) .. " -- score: " .. tostring( client.score ) .. "\n" )
			Engine.LobbyHostAssignTeamToClient( Enum.LobbyType.LOBBY_TYPE_GAME, client.xuid, f14_local3 )
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.AutoSplitTeam end\n" )
end

local ShouldAssignToTeam = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local curScreenId = Engine.GetLobbyUIScreen()
	local curScreen = LobbyData:UITargetFromId( curScreenId )
	if curScreen.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return 
	elseif lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		if lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			if GAMETYPE_FFA == Engine.GameLobbyGetGameType() then
				return false
			elseif Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 then
				return false
			else
				return true
			end
		elseif lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			if Lobby.Timer.GetTimerStatus() == Lobby.Timer.LOBBY_STATUS_STARTING then
				return true
			elseif Engine.IsInGame() then
				return true
			end
		end
	end
	return false
end

Lobby.TeamSelection.ClientJoined = function ( data )
	if not ShouldAssignToTeam( data ) then
		return 
	end
	local xuid = data.xuid
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	if gamelobby == nil then
		return 
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined start.\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby List\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	for index, client in ipairs( gamelobby.sessionClients ) do
		if xuid ~= client.xuid then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( index ) .. ") " .. client.gamertag .. " - groupID(" .. tostring( client.groupID ) .. ") -- debugGroupID: " .. tostring( client.debugGroupID ) .. " -- team: " .. TeamIdToString( client.team ) .. " -- score: " .. tostring( client.score ) .. ".\n" )
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	local joinedClient = nil
	for index, client in ipairs( gamelobby.sessionClients ) do
		if xuid == client.xuid then
			joinedClient = client
			break
		end
	end
	for index, client in ipairs( gamelobby.sessionClients ) do
		if joinedClient.xuid ~= client.xuid and joinedClient.groupID == client.groupID then
			Engine.LobbyHostAssignTeamToClient( Enum.LobbyType.LOBBY_TYPE_GAME, joinedClient.xuid, client.team )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Joining client is part of a party.\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. joinedClient.gamertag .. " - groupID(" .. tostring( joinedClient.groupID ) .. ") -- debugGroupID: " .. tostring( joinedClient.debugGroupID ) .. " -- team: " .. TeamIdToString( client.team ) .. " -- score: " .. tostring( client.score ) .. ".\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined end.\n" )
			return 
		end
	end
	local teamAlliesCount = 0
	local teamAxisCount = 0
	for index, client in ipairs( gamelobby.sessionClients ) do
		if joinedClient.xuid ~= client.xuid then
			if client.team == Enum.team_t.TEAM_ALLIES then
				teamAlliesCount = teamAlliesCount + 1
			end
			if client.team == Enum.team_t.TEAM_AXIS then
				teamAxisCount = teamAxisCount + 1
			end
		end
	end
	local team = Enum.team_t.TEAM_ALLIES
	if teamAxisCount < teamAlliesCount then
		team = Enum.team_t.TEAM_AXIS
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Clients in session: " .. #gamelobby.sessionClients .. ", teamAlliesCount: " .. teamAlliesCount .. ", teamAxisCount:" .. teamAxisCount .. ".\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. joinedClient.gamertag .. " - groupID(" .. tostring( joinedClient.groupID ) .. ") -- debugGroupID: " .. tostring( joinedClient.debugGroupID ) .. " -- team: " .. tostring( team ) .. ".\n" )
	Engine.LobbyHostAssignTeamToClient( Enum.LobbyType.LOBBY_TYPE_GAME, joinedClient.xuid, team )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined end.\n" )
end

Lobby.TeamSelection.GametypeSettingsChange = function ()
	Engine.LuiVM_Event( "update_team_selection_buttons", {} )
	if Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 then
		Lobby.TeamSelection.Clear()
	else
		Lobby.TeamSelection.AutoSplitTeam()
	end
	if Engine.GetGametypeSetting( "allowspectating" ) ~= 1 then
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			Engine.ClearTeamData( Enum.team_t.TEAM_SPECTATOR )
		end
		for controller = 1, LOCAL_CLIENT_COUNT, 1 do
			if Lobby.TeamSelection.Clients[controller].team == Enum.team_t.TEAM_SPECTATOR or Lobby.TeamSelection.Clients[controller].switchTeam == Enum.team_t.TEAM_SPECTATOR then
				local client = {
					team = Enum.team_t.TEAM_FREE,
					switchTeam = Enum.team_t.TEAM_FREE,
					switchTeamTime = DONT_SWITCH
				}
				Lobby.TeamSelection.Clients[controller] = client
			end
		end
	end
end

Lobby.TeamSelection.Pump = function ()
	Lobby.TeamSelection.SendChanges()
end

Lobby.TeamSelection.Clear = function ()
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.ClearTeamData()
	end
	for controller = 1, LOCAL_CLIENT_COUNT, 1 do
		local client = {
			team = Enum.team_t.TEAM_FREE,
			switchTeam = Enum.team_t.TEAM_FREE,
			switchTeamTime = DONT_SWITCH
		}
		Lobby.TeamSelection.Clients[controller] = client
	end
end

Lobby.TeamSelection.Init = function ()
	Lobby.TeamSelection.Clear()
end

