require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LuaEnums" )

Lobby.TeamSelection = {}
Lobby.TeamSelection.GAMETYPE_FFA = "dm"
Lobby.TeamSelection.DONT_SWITCH = -1
Lobby.TeamSelection.TEAM_SWITCH_DELAY = 1500
Lobby.TeamSelection.LOCAL_CLIENT_COUNT = 4
Lobby.TeamSelection.Clients = {}
Lobby.TeamSelection.SPECTATOR_ALLOWED = {
	Enum.team_t.TEAM_ALLIES,
	Enum.team_t.TEAM_AXIS,
	Enum.team_t.TEAM_SPECTATOR
}
Lobby.TeamSelection.SPECTATOR_NOT_ALLOWED = {
	Enum.team_t.TEAM_ALLIES,
	Enum.team_t.TEAM_AXIS
}
Lobby.TeamSelection.SPECTATOR_ONLY = {
	Enum.team_t.TEAM_FREE,
	Enum.team_t.TEAM_SPECTATOR
}
Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_ALLOWED
Lobby.TeamSelection.lastGameMode = ""
Lobby.TeamSelection.gameSetting = {}
Lobby.TeamSelection.gametypesStructTable = "game_types"
Lobby.TeamSelection.random = math.random()
Lobby.TeamSelection.TeamIdToString = function ( teamId )
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

Lobby.TeamSelection.IsGametypeTeamBased = function ()
	local gametype = Dvar.ui_gametype:get()
	local teamGame = Engine.StructTableLookupString( Lobby.TeamSelection.gametypesStructTable, "name", gametype, "is_team_based" )
	if teamGame == nil then
		return false
	elseif Engine.ToUpper( teamGame ) == "NO" then
		return false
	else
		return true
	end
end

Lobby.TeamSelection.ShouldAssignToTeam = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local curScreen = LobbyData.GetCurrentMenuTarget()
	if curScreen.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return 
	elseif lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		if lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			if Engine.GameLobbyGetGameType() == Lobby.TeamSelection.GAMETYPE_FFA then
				return false
			else
				return true
			end
		elseif lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			if Lobby.Timer.GetTimerStatus() == Lobby.Timer.LOBBY_STATUS.STARTING then
				return true
			elseif Engine.IsInGame() then
				return true
			end
		end
	end
	return false
end

Lobby.TeamSelection.ClearTeam = function ( team )
	Engine.ClearTeamData( team )
	for clientNum = 1, LuaEnums.MAX_CLIENTS, 1 do
		if Lobby.TeamSelection.Clients[clientNum].team == team or Lobby.TeamSelection.Clients[clientNum].switchTeam == team then
			local client = {
				team = Enum.team_t.TEAM_FREE,
				switchTeam = Enum.team_t.TEAM_FREE,
				switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
			}
			Lobby.TeamSelection.Clients[clientNum] = client
		end
	end
end

Lobby.TeamSelection.StoreGamesetting = function ()
	Lobby.TeamSelection.gameSetting.teamBased = Lobby.TeamSelection.IsGametypeTeamBased()
	Lobby.TeamSelection.gameSetting.allowSpectating = Engine.GetGametypeSetting( "allowspectating" ) == 1
	Lobby.TeamSelection.gameSetting.teamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
end

Lobby.TeamSelection.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyMode == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.StoreGamesetting()
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.Clear()
	end
	Lobby.TeamSelection.random = math.random()
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

Lobby.TeamSelection.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST then
		if lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM and Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
			Lobby.TeamSelection.Clear()
		elseif lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			Lobby.TeamSelection.Clear()
		end
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnGametypeSettingsChange = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule ~= Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.GametypeSettingsChange()
	end
end

Lobby.TeamSelection.SwitchTeamClientAssignment = function ( data )
	local controller = data.controller
	local selection = data.selection
	local xuid = data.xuid
	if not xuid or xuid == 0 then
		xuid = Engine.GetXUID64( controller )
	end
	local clientNum = Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, xuid )
	if clientNum == LuaEnums.INVALID_CLIENT_INDEX then
		return 
	end
	local client = Lobby.TeamSelection.Clients[clientNum + 1]
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		if Engine.GameLobbyGetGameType() == Lobby.TeamSelection.GAMETYPE_FFA or Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
			Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_ONLY
		else
			Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_ALLOWED
		end
	else
		Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_NOT_ALLOWED
	end
	local currTeam = 0
	local newTeam = 1
	for index = 1, #Lobby.TeamSelection.availableTeams, 1 do
		if client.switchTeam == Lobby.TeamSelection.availableTeams[index] then
			currTeam = index
			break
		end
	end
	if selection == 0 then
		if currTeam <= 1 then
			newTeam = #Lobby.TeamSelection.availableTeams
		else
			newTeam = currTeam - 1
		end
	elseif currTeam >= #Lobby.TeamSelection.availableTeams then
		newTeam = 1
	else
		newTeam = currTeam + 1
	end
	client.switchTeamType = LuaEnums.TEAM_ASSIGNMENT.CLIENT
	client.controller = controller
	client.xuid = xuid
	client.switchTeam = Lobby.TeamSelection.availableTeams[newTeam]
	Engine.LuiVM_Event( "team_switch", {
		controller = controller,
		switchTeam = client.switchTeam,
		xuid = xuid
	} )
	if client.team == client.switchTeam then
		client.switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
	else
		client.switchTeamTime = Lobby.TeamSelection.TEAM_SWITCH_DELAY + Engine.milliseconds()
	end
end

Lobby.TeamSelection.SwitchTeamHostAssignment = function ( data )
	local controller = data.controller
	local selection = data.selection
	local xuid = data.xuid
	local clientNum = Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, xuid )
	if clientNum == LuaEnums.INVALID_CLIENT_INDEX then
		return 
	end
	local client = Lobby.TeamSelection.Clients[clientNum + 1]
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		if Engine.GameLobbyGetGameType() == Lobby.TeamSelection.GAMETYPE_FFA then
			Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_ONLY
		else
			Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_ALLOWED
		end
	else
		Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_NOT_ALLOWED
	end
	local currTeam = 0
	local newTeam = 1
	for index = 1, #Lobby.TeamSelection.availableTeams, 1 do
		if client.switchTeam == Lobby.TeamSelection.availableTeams[index] then
			currTeam = index
			break
		end
	end
	if selection == 0 then
		if currTeam <= 1 then
			newTeam = #Lobby.TeamSelection.availableTeams
		else
			newTeam = currTeam - 1
		end
	elseif currTeam >= #Lobby.TeamSelection.availableTeams then
		newTeam = 1
	else
		newTeam = currTeam + 1
	end
	client.switchTeamType = LuaEnums.TEAM_ASSIGNMENT.HOST
	client.controller = controller
	client.xuid = xuid
	client.switchTeam = Lobby.TeamSelection.availableTeams[newTeam]
	Engine.LuiVM_Event( "team_switch", {
		controller = controller,
		switchTeam = client.switchTeam,
		xuid = xuid
	} )
	if client.team == client.switchTeam then
		client.switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
	else
		client.switchTeamTime = Lobby.TeamSelection.TEAM_SWITCH_DELAY + Engine.milliseconds()
	end
end

Lobby.TeamSelection.SwitchTeam = function ( data )
	local teamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
	if teamAssignment == LuaEnums.TEAM_ASSIGNMENT.CLIENT or teamAssignment == LuaEnums.TEAM_ASSIGNMENT.AUTO then
		Lobby.TeamSelection.SwitchTeamClientAssignment( data )
	elseif teamAssignment == LuaEnums.TEAM_ASSIGNMENT.HOST and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.TeamSelection.SwitchTeamHostAssignment( data )
	end
end

Lobby.TeamSelection.SendChanges = function ()
	for clientNum = 1, LuaEnums.MAX_CLIENTS, 1 do
		local client = Lobby.TeamSelection.Clients[clientNum]
		if client and client.switchTeamTime ~= Lobby.TeamSelection.DONT_SWITCH and client.switchTeamTime < Engine.milliseconds() then
			client.switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
			if client.switchTeamType == LuaEnums.TEAM_ASSIGNMENT.CLIENT then
				Engine.TeamSelection( client.controller, client.switchTeam )
			end
			if client.switchTeamType == LuaEnums.TEAM_ASSIGNMENT.HOST then
				Engine.LobbyHostAssignTeamToClient( client.xuid, client.switchTeam )
			end
		end
	end
end

Lobby.TeamSelection.GameLobbyClientDataUpdate = function ( data )
	local clientList = data
	if data.clients ~= nil then
		clientList = data.clients
	end
	for clientNum = 1, LuaEnums.MAX_CLIENTS, 1 do
		local client = Lobby.TeamSelection.Clients[clientNum]
		local xuid = client.xuid
		for key, value in pairs( clientList ) do
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
		if member.lobbyID == privateLobby.lobbyID then
			privateLobby.lobbySkill = privateLobby.lobbySkill + member.skillRating
			table.insert( privateLobby.memberList, {
				index = memberIndex,
				xuid = member.xuid,
				skill = member.skillRating
			} )
			return 
		end
	end
	local privateLobby = {
		lobbyID = member.lobbyID,
		lobbySkill = member.skillRating,
		memberList = {}
	}
	table.insert( privateLobby.memberList, {
		index = memberIndex,
		xuid = member.xuid,
		skill = member.skillRating
	} )
	table.insert( privateLobbyList, privateLobby )
end

Lobby.TeamSelection.AddDummyToPrivateLobbyList = function ( memberCount, privateLobbyList )
	local privateLobby = {
		lobbyID = -1,
		lobbySkill = 0,
		memberList = {}
	}
	for i = 1, memberCount, 1 do
		local f17_local2 = i
		table.insert( privateLobby.memberList, {
			index = -1,
			xuid = 0,
			skill = 0
		} )
	end
	table.insert( privateLobbyList, privateLobby )
end

Lobby.TeamSelection.VladSplit = function ( privateLobbyList, maxClients )
	local numPlayers = 0
	local buildAllocationMap = function ( n )
		local pattern = {
			1,
			2,
			2,
			1
		}
		local patternIdx = 1
		local map = {}
		for i = 1, numPlayers, 1 do
			map[i] = pattern[patternIdx]
			patternIdx = patternIdx + 1
			if #pattern < patternIdx then
				patternIdx = 1
			end
		end
		return map
	end
	
	local sortBySkill = function ( a, b )
		return b.lobbySkill < a.lobbySkill
	end
	
	local sortBySizeAndSkill = function ( a, b )
		if #a.memberList == #b.memberList then
			return sortBySkill( a, b )
		else
			return #b.memberList < #a.memberList
		end
	end
	
	local swapSolo = function ( a, b )
		local skillA = 0
		local skillB = 0
		local soloA = {}
		local soloB = {}
		for i, g in ipairs( a ) do
			skillA = skillA + g.lobbySkill
			if #g.memberList == 1 then
				table.insert( soloA, i )
			end
		end
		for i, g in ipairs( b ) do
			skillB = skillB + g.lobbySkill
			if #g.memberList == 1 then
				table.insert( soloB, i )
			end
		end
		local delta0 = skillA - skillB
		local deltaMin = delta0
		local deltaMinIdx = {}
		for _ia, idxA in ipairs( soloA ) do
			for _ib, idxB in ipairs( soloB ) do
				delta1 = delta0 - 2 * (a[idxA].lobbySkill - b[idxB].lobbySkill)
				if math.abs( deltaMin ) > math.abs( delta1 ) then
					deltaMin = delta1
					deltaMinIdx = {
						idxA,
						idxB
					}
				end
			end
		end
		if math.abs( deltaMin ) < math.abs( delta0 ) then
			local swapA = table.remove( a, deltaMinIdx[1] )
			local swapB = table.remove( b, deltaMinIdx[2] )
			table.insert( a, swapB )
			table.insert( b, swapA )
			return true
		else
			return false
		end
	end
	
	for i, lobby in ipairs( privateLobbyList ) do
		numPlayers = numPlayers + #lobby.memberList
	end
	for attempt = 1, 2, 1 do
		local allocationMap = buildAllocationMap( numPlayers )
		if attempt == 1 then
			table.sort( privateLobbyList, sortBySkill )
		else
			table.sort( privateLobbyList, sortBySizeAndSkill )
		end
		local x = 1
		local teamA = {}
		local teamB = {}
		local countA = 0
		local countB = 0
		for i, lobby in ipairs( privateLobbyList ) do
			while allocationMap[x] == 0 do
				x = x + 1
			end
			local team = allocationMap[x]
			if team == 1 then
				table.insert( teamA, lobby )
				countA = countA + #lobby.memberList
			else
				table.insert( teamB, lobby )
				countB = countB + #lobby.memberList
			end
			local k = x
			for j = 0, #lobby.memberList - 1, 1 do
				local f18_local8 = j
			end
			local f18_local8 = j
		end
		local delta = math.abs( countA - countB )
		if maxClients < countA + countB then
			return {
				isBalanced = false,
				canBalance = false,
				teams = {
					teamA,
					teamB
				},
				counts = {
					countA,
					countB
				}
			}
		elseif delta <= 1 then
			swapSolo( teamA, teamB )
			if Lobby.TeamSelection.random > 0.5 then
				return {
					isBalanced = true,
					canBalance = true,
					teams = {
						teamA,
						teamB
					},
					counts = {
						countA,
						countB
					}
				}
			else
				return {
					isBalanced = true,
					canBalance = true,
					teams = {
						teamB,
						teamA
					},
					counts = {
						countB,
						countA
					}
				}
			end
		elseif attempt == 2 then
			return {
				isBalanced = false,
				canBalance = delta <= maxClients - countA - countB,
				teams = {
					teamA,
					teamB
				},
				counts = {
					countA,
					countB
				}
			}
		end
	end
end

Lobby.TeamSelection.AutoSplitTeam = function ( mustBalance, logOutput )
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local codCasters = 0
	for i = #gamelobby.sessionClients, 1, -1 do
		local team = gamelobby.sessionClients[i].team
		if team == Enum.team_t.TEAM_SPECTATOR then
			table.remove( gamelobby.sessionClients, i )
			codCasters = codCasters + 1
		end
	end
	if codCasters == Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return true
	end
	local privateLobbyList = {}
	for index, client in ipairs( gamelobby.sessionClients ) do
		Lobby.TeamSelection.AddToPrivateLobbyList( client, index, privateLobbyList )
	end
	local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local split = Lobby.TeamSelection.VladSplit( privateLobbyList, maxClients )
	if logOutput then
		LuaUtils.LogQoS( "teamsplit/input", privateLobbyList )
		LuaUtils.LogQoS( "teamsplit/output", split )
	end
	if logOutput then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.AutoSplitTeam start\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "gamelobby data:\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
		for index, client in ipairs( gamelobby.sessionClients ) do
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( index ) .. ") " .. client.gamertag .. " - lobbyID(" .. tostring( client.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( client.simpleLobbyID ) .. " -- skill: " .. tostring( client.skillRating ) .. "\n" )
		end
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	end
	if mustBalance == true and split.isBalanced == false then
		if logOutput then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Could not create balanced teams.\n" )
		end
		return false
	elseif logOutput then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Team Assignment:\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	end
	for i, client in ipairs( split.teams[1] ) do
		local team = Enum.team_t.TEAM_ALLIES
		for idx, member in ipairs( client.memberList ) do
			local client = gamelobby.sessionClients[member.index]
			if logOutput then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( i ) .. ") " .. client.gamertag .. " - lobbyID(" .. tostring( client.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( client.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( team ) .. " -- lobbySkill: " .. tostring( client.lobbySkill ) .. " -- skill: " .. tostring( client.skillRating ) .. "\n" )
			end
			Engine.LobbyHostAssignTeamToClient( client.xuid, team )
		end
	end
	for i, client in ipairs( split.teams[2] ) do
		local team = Enum.team_t.TEAM_AXIS
		for idx, member in ipairs( client.memberList ) do
			local client = gamelobby.sessionClients[member.index]
			if logOutput then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( i ) .. ") " .. client.gamertag .. " - lobbyID(" .. tostring( client.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( client.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( team ) .. " -- lobbySkill: " .. tostring( client.lobbySkill ) .. " -- skill: " .. tostring( client.skillRating ) .. "\n" )
			end
			Engine.LobbyHostAssignTeamToClient( client.xuid, team )
		end
	end
	if logOutput then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.AutoSplitTeam end\n" )
	end
	return true
end

Lobby.TeamSelection.CanFitLobbys = function ( data )
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local privateLobbyList = {}
	if #gamelobby.sessionClients == 0 then
		return true
	end
	for index, client in ipairs( gamelobby.sessionClients ) do
		Lobby.TeamSelection.AddToPrivateLobbyList( client, index, privateLobbyList )
	end
	for index, client in ipairs( data.lobbys ) do
		Lobby.TeamSelection.AddDummyToPrivateLobbyList( client, privateLobbyList )
	end
	local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local split = Lobby.TeamSelection.VladSplit( privateLobbyList, maxClients )
	if split.isBalanced then
		return true
	elseif split.canBalance and not Engine.IsInGame() then
		return true
	end
	return false
end

Lobby.TeamSelection.ClientJoined = function ( data )
	if not Lobby.TeamSelection.ShouldAssignToTeam( data ) then
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
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( index ) .. ") " .. client.gamertag .. " - lobbyID(" .. tostring( client.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( client.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( client.team ) .. " -- score: " .. tostring( client.score ) .. ".\n" )
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
	if joinedClient == nil then
		return 
	end
	for index, client in ipairs( gamelobby.sessionClients ) do
		if joinedClient.xuid ~= client.xuid and joinedClient.lobbyID == client.lobbyID then
			Engine.LobbyHostAssignTeamToClient( joinedClient.xuid, client.team )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Joining client is part of a party.\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. joinedClient.gamertag .. " - lobbyID(" .. tostring( joinedClient.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( joinedClient.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( client.team ) .. " -- score: " .. tostring( client.score ) .. ".\n" )
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
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. joinedClient.gamertag .. " - lobbyID(" .. tostring( joinedClient.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( joinedClient.simpleLobbyID ) .. " -- team: " .. tostring( team ) .. ".\n" )
	Engine.LobbyHostAssignTeamToClient( joinedClient.xuid, team )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined end.\n" )
end

Lobby.TeamSelection.GametypeSettingsChange = function ()
	local teamBased = Lobby.TeamSelection.IsGametypeTeamBased()
	local f26_local0 = Engine.GetGametypeSetting( "allowspectating" ) == 1
	local teamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
	local f26_local1 = Lobby.TeamSelection.gameSetting.teamBased ~= teamBased
	local f26_local2 = Lobby.TeamSelection.gameSetting.allowSpectating ~= f26_local0
	local f26_local3 = Lobby.TeamSelection.gameSetting.teamAssignment ~= teamAssignment
	if f26_local1 == false and f26_local2 == false and f26_local3 == false then
		return 
	end
	Engine.LuiVM_Event( "update_team_selection_buttons", {} )
	if f26_local1 and teamBased == false then
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_ALLIES )
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_AXIS )
	end
	if f26_local2 and f26_local0 == false then
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_SPECTATOR )
	end
	if f26_local3 and teamBased == true then
		local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		if teamAssignment == LuaEnums.TEAM_ASSIGNMENT.AUTO then
			for index, client in ipairs( gamelobby.sessionClients ) do
				if client.team ~= Enum.team_t.TEAM_SPECTATOR then
					Engine.LobbyHostAssignTeamToClient( client.xuid, Enum.team_t.TEAM_FREE )
				end
			end
		else
			for index, client in ipairs( gamelobby.sessionClients ) do
				if client.team == Enum.team_t.TEAM_FREE then
					Engine.LobbyHostAssignTeamToClient( client.xuid, Enum.team_t.TEAM_ALLIES )
				end
			end
		end
	end
	Lobby.TeamSelection.StoreGamesetting()
end

Lobby.TeamSelection.Pump = function ()
	Lobby.TeamSelection.SendChanges()
end

Lobby.TeamSelection.Clear = function ()
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Engine.ClearTeamData()
	end
	for clientNum = 1, LuaEnums.MAX_CLIENTS, 1 do
		local client = {
			team = Enum.team_t.TEAM_FREE,
			switchTeam = Enum.team_t.TEAM_FREE,
			switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
		}
		Lobby.TeamSelection.Clients[clientNum] = client
	end
end

Lobby.TeamSelection.Init = function ()
	Lobby.TeamSelection.Clear()
end

function TeamSelectionTest()
	local players = {}
	local addGroup = function ( size, skill )
		local memberList = {}
		for i = 1, size, 1 do
			memberList[i] = 0
		end
		table.insert( players, {
			lobbySkill = skill,
			memberList = memberList
		} )
	end
	
	addGroup( 1, 1 )
	addGroup( 1, 0.5 )
	addGroup( 1, 0.5 )
	addGroup( 1, 0.2 )
	addGroup( 1, -0.2 )
	addGroup( 1, 0.1 )
	addGroup( 1, 1.1 )
	addGroup( 2, 2 )
	addGroup( 3, 1 )
	local split = Lobby.TeamSelection.VladSplit( players, 12 )
end

Lobby.TeamSelection.Init()
