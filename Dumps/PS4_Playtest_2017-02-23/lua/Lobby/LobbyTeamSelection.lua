require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LuaEnum" )

Lobby.TeamSelection = {}
Lobby.TeamSelection.DONT_SWITCH = -1
Lobby.TeamSelection.TEAM_SWITCH_DELAY = 1500
Lobby.TeamSelection.LOCAL_CLIENT_COUNT = 4
Lobby.TeamSelection.Clients = {}
Lobby.TeamSelection.lastGameMode = ""
Lobby.TeamSelection.gameSetting = {}
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

Lobby.TeamSelection.ShouldAssignToTeam = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local curScreen = LobbyData.GetCurrentMenuTarget()
	if curScreen.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ShouldAssignToTeam [false] Reason: curScreen.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP \n" )
		return false
	elseif lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST ) then
		if lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			if not CoDShared.IsGametypeTeamBased() then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ShouldAssignToTeam [false] Reason: not CoDShared.IsGametypeTeamBased() \n" )
				return false
			elseif Engine.IsInGame() then
				return false
			elseif Engine.LobbyLaunchGetServerStatus( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType ) > Enum.GameServerStatus.GAME_SERVER_STATUS_IDLE then
				return false
			end
			local pregameState = Engine.GetLobbyPregameState()
			if pregameState ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE ~= true then
				local teamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
				if teamAssignment == LuaEnum.TEAM_ASSIGNMENT.AUTO and Lobby.Timer.GetTimerStatus() ~= Lobby.Timer.LOBBY_STATUS.STARTING then
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ShouldAssignToTeam [false] Reason: teamAssignment == LuaEnum.TEAM_ASSIGNMENT.AUTO and Lobby.Timer.GetTimerStatus() ~= Lobby.Timer.LOBBY_STATUS.STARTING \n" )
					return false
				end
			end
			return true
		elseif lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC or lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
			if Lobby.Timer.GetTimerStatus() == Lobby.Timer.LOBBY_STATUS.STARTING then
				return true
			elseif Engine.IsInGame() then
				return true
			elseif Engine.LobbyLaunchGetServerStatus( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType ) > Enum.GameServerStatus.GAME_SERVER_STATUS_IDLE then
				return true
			else
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ShouldAssignToTeam [failed] reason: Enum.LobbyMode.LOBBY_MODE_PUBLIC or Enum.LobbyMode.LOBBY_MODE_ARENA checks failed \n" )
				return 
			end
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ShouldAssignToTeam [failed] default \n" )
	return false
end

Lobby.TeamSelection.ClearTeam = function ( team )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	Engine.ClearTeamData( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, team )
	for clientNum = 1, LuaDefine.MAX_CLIENTS, 1 do
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

Lobby.TeamSelection.AutoAssignFreePlayersCP = function ()
	if CoDShared.IsGametypeTeamBased() then
		local maxTeamSize = 3
		local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local freeTeam = {}
		local alliesTeam = {}
		local axisTeam = {}
		for _, client in ipairs( gamelobby.sessionClients ) do
			if client.team == Enum.team_t.TEAM_ALLIES then
				table.insert( alliesTeam, client )
			end
			if client.team == Enum.team_t.TEAM_AXIS then
				table.insert( axisTeam, client )
			else
				table.insert( freeTeam, client )
			end
		end
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
		for _, client in ipairs( freeTeam ) do
			if #axisTeam < #alliesTeam and #alliesTeam < maxTeamSize then
				table.insert( axisTeam, client )
				Engine.LobbyHostAssignTeamToClient( lobbyType, client.xuid, Enum.team_t.TEAM_AXIS )
			end
			if #alliesTeam <= #axisTeam and #axisTeam < maxTeamSize then
				table.insert( alliesTeam, client )
				Engine.LobbyHostAssignTeamToClient( lobbyType, client.xuid, Enum.team_t.TEAM_ALLIES )
			end
		end
	end
end

Lobby.TeamSelection.StoreGamesetting = function ()
	Lobby.TeamSelection.gameSetting.teamBased = CoDShared.IsGametypeTeamBased()
	Lobby.TeamSelection.gameSetting.allowSpectating = Engine.GetGametypeSetting( "allowspectating" ) == 1
	Lobby.TeamSelection.gameSetting.teamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
end

Lobby.TeamSelection.OnSessionModeChange = function ( fromMode, toMode )
	if Engine.GetCurrentMap() == "core_frontend" and toMode == Enum.eModes.MODE_CAMPAIGN then
		for index = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			local controller = index - 1
			local storageBuffer = Engine.GetPlayerStats( controller )
			if storageBuffer ~= nil and storageBuffer.faction ~= nil then
				local team = storageBuffer.faction:get()
				local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
				Engine.TeamSelection( controller, lobbyType, team )
			end
		end
	end
end

Lobby.TeamSelection.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		return 
	elseif lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		Lobby.TeamSelection.StoreGamesetting()
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		return 
	elseif lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.Clear()
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		return 
	elseif lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST and lobbyType == Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST ) then
		Lobby.TeamSelection.ClientJoined( data )
	end
	if lobbyType == Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT ) and lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT and lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM and Engine.IsLocalClient( xuid ) and Engine.GetUsedControllerCount() > 1 then
		for index = 1, LuaDefine.MAX_CONTROLLER_COUNT, 1 do
			local controller = index - 1
			local localClientXuid = Engine.GetXUID64( controller )
			if Engine.LobbyIsPlayerInLobby( lobbyType, localClientXuid ) then
				local clientNum = Engine.GetLobbyClientNumByXUID( lobbyModule, lobbyType, localClientXuid ) + 1
				local client = Lobby.TeamSelection.Clients[clientNum]
				if Engine.GetTeamForXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType, localClientXuid ) == Enum.team_t.TEAM_SPECTATOR or client ~= nil and client.switchTeam == Enum.team_t.TEAM_SPECTATOR then
					Engine.TeamSelection( controller, lobbyType, Enum.team_t.TEAM_FREE )
					Lobby.TeamSelection.Clients[clientNum] = {
						team = Enum.team_t.TEAM_FREE,
						switchTeam = Enum.team_t.TEAM_FREE,
						switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
					}
				end
			end
		end
	end
end

Lobby.TeamSelection.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyModule ~= Enum.LobbyModule.LOBBY_MODULE_HOST or lobbyType ~= Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST ) then
		return 
	end
	local curScreen = LobbyData.GetCurrentMenuTarget()
	if curScreen.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		Lobby.TeamSelection.Clear()
	elseif lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM and Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnum.TEAM_ASSIGNMENT.AUTO then
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_ALLIES )
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_AXIS )
	elseif lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
		Lobby.TeamSelection.Clear()
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnGametypeSettingsChange = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyType ~= Engine.LobbyGetControllingLobbySession( lobbyModule ) then
		return 
	elseif lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST then
		Lobby.TeamSelection.GametypeSettingsChange()
	elseif lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT and Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType ) == false then
		Lobby.TeamSelection.GametypeSettingsChange()
	end
end

Lobby.TeamSelection.GetAllowedTeams = function ( clientXuid )
	local f12_local0 = Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnum.TEAM_ASSIGNMENT.AUTO
	local f12_local1 = Engine.GetUsedControllerCount() > 1
	if Engine.IsSplitscreenClient then
		f12_local1 = Engine.IsSplitscreenClient( Enum.LobbyType.LOBBY_TYPE_GAME, clientXuid )
	end
	local f12_local2
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		f12_local2 = not f12_local1
	else
		f12_local2 = false
	end
	local teamBased = CoDShared.IsGametypeTeamBased()
	local teamsAllowed = {}
	if teamBased and not f12_local0 then
		table.insert( teamsAllowed, Enum.team_t.TEAM_ALLIES )
		table.insert( teamsAllowed, Enum.team_t.TEAM_AXIS )
	else
		table.insert( teamsAllowed, Enum.team_t.TEAM_FREE )
	end
	if f12_local2 then
		table.insert( teamsAllowed, Enum.team_t.TEAM_SPECTATOR )
	end
	return teamsAllowed
end

Lobby.TeamSelection.SwitchTeamClientAssignment = function ( data )
	local controller = data.controller
	local selection = data.selection
	local xuid = data.xuid
	if not xuid or xuid == 0 then
		xuid = Engine.GetXUID64( controller )
	end
	local clientNum = Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, xuid )
	if clientNum == LuaDefine.INVALID_CLIENT_INDEX then
		return 
	end
	local client = Lobby.TeamSelection.Clients[clientNum + 1]
	local teamsAllowed = Lobby.TeamSelection.GetAllowedTeams( xuid )
	local currTeam = 0
	local newTeam = 1
	for index = 1, #teamsAllowed, 1 do
		if client.switchTeam == teamsAllowed[index] then
			currTeam = index
			break
		end
	end
	if selection == 0 then
		if currTeam <= 1 then
			newTeam = #teamsAllowed
		else
			newTeam = currTeam - 1
		end
	elseif #teamsAllowed <= currTeam then
		newTeam = 1
	else
		newTeam = currTeam + 1
	end
	client.switchTeamType = LuaEnum.TEAM_ASSIGNMENT.CLIENT
	client.controller = controller
	client.xuid = xuid
	client.switchTeam = teamsAllowed[newTeam]
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
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	local clientNum = Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, xuid )
	if clientNum == LuaDefine.INVALID_CLIENT_INDEX then
		return 
	end
	local client = Lobby.TeamSelection.Clients[clientNum + 1]
	local teamsAllowed = Lobby.TeamSelection.GetAllowedTeams( xuid )
	local currTeam = 0
	local newTeam = 1
	for index = 1, #teamsAllowed, 1 do
		if client.switchTeam == teamsAllowed[index] then
			currTeam = index
			break
		end
	end
	if selection == 0 then
		if currTeam <= 1 then
			newTeam = #teamsAllowed
		else
			newTeam = currTeam - 1
		end
	elseif #teamsAllowed <= currTeam then
		newTeam = 1
	else
		newTeam = currTeam + 1
	end
	client.switchTeamType = LuaEnum.TEAM_ASSIGNMENT.HOST
	client.controller = controller
	client.xuid = xuid
	client.switchTeam = teamsAllowed[newTeam]
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

Lobby.TeamSelection.SwitchTeamBotAssignment = function ( data )
	local controller = data.controller
	local selection = data.selection
	local xuid = data.xuid
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	local clientNum = Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, xuid )
	if clientNum == LuaEnum.INVALID_CLIENT_INDEX then
		return 
	end
	local client = Lobby.TeamSelection.Clients[clientNum + 1]
	local teamBased = CoDShared.IsGametypeTeamBased()
	local teamsAllowed = {}
	if teamBased then
		table.insert( teamsAllowed, Enum.team_t.TEAM_ALLIES )
		table.insert( teamsAllowed, Enum.team_t.TEAM_AXIS )
	else
		table.insert( teamsAllowed, Enum.team_t.TEAM_FREE )
	end
	local currTeam = 0
	local newTeam = 1
	for index = 1, #teamsAllowed, 1 do
		if client.switchTeam == teamsAllowed[index] then
			currTeam = index
			break
		end
	end
	if selection == 0 then
		if currTeam <= 1 then
			newTeam = #teamsAllowed
		else
			newTeam = currTeam - 1
		end
	elseif #teamsAllowed <= currTeam then
		newTeam = 1
	else
		newTeam = currTeam + 1
	end
	client.switchTeamType = LuaEnum.TEAM_ASSIGNMENT.HOST
	client.controller = controller
	client.xuid = xuid
	client.switchTeam = teamsAllowed[newTeam]
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
	if data.lobbyClientType ~= Enum.LobbyClientType.LOBBY_CLIENT_TYPE_BOT_PERMANENT and data.lobbyClientType ~= Enum.LobbyClientType.LOBBY_CLIENT_TYPE_BOT_TEMP then
		local f16_local0 = false
	else
		local isBot = true
	end
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	if f16_local0 and Engine.IsLobbyHost( lobbyType ) then
		Lobby.TeamSelection.SwitchTeamBotAssignment( data )
	elseif teamAssignment == LuaEnum.TEAM_ASSIGNMENT.CLIENT or teamAssignment == LuaEnum.TEAM_ASSIGNMENT.AUTO then
		Lobby.TeamSelection.SwitchTeamClientAssignment( data )
	elseif teamAssignment == LuaEnum.TEAM_ASSIGNMENT.HOST and Engine.IsLobbyHost( lobbyType ) then
		Lobby.TeamSelection.SwitchTeamHostAssignment( data )
	end
end

Lobby.TeamSelection.SendChanges = function ()
	for clientNum = 1, #Lobby.TeamSelection.Clients, 1 do
		local client = Lobby.TeamSelection.Clients[clientNum]
		if client and client.switchTeamTime ~= Lobby.TeamSelection.DONT_SWITCH and client.switchTeamTime < Engine.milliseconds() then
			client.switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
			if client.switchTeamType == LuaEnum.TEAM_ASSIGNMENT.CLIENT then
				local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
				Engine.TeamSelection( client.controller, lobbyType, client.switchTeam )
			end
			if client.switchTeamType == LuaEnum.TEAM_ASSIGNMENT.HOST then
				local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
				Engine.LobbyHostAssignTeamToClient( lobbyType, client.xuid, client.switchTeam )
			end
		end
	end
end

Lobby.TeamSelection.GameLobbyClientDataUpdate = function ( data )
	local clientList = data
	if data.clients ~= nil then
		clientList = data.clients
	end
	for clientNum = 1, #Lobby.TeamSelection.Clients, 1 do
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
			if LuaUtils.IsArenaMode() then
				privateLobby.lobbySkill = privateLobby.lobbySkill + member.arenaPoints
			else
				privateLobby.lobbySkill = privateLobby.lobbySkill + member.skillRating
			end
			table.insert( privateLobby.memberList, {
				index = memberIndex,
				xuid = member.xuid,
				skill = member.skillRating,
				arenaPoints = member.arenaPoints
			} )
			return 
		end
	end
	local privateLobby = {
		lobbyID = member.lobbyID
	}
	if LuaUtils.IsArenaMode() then
		privateLobby.lobbySkill = member.arenaPoints
	else
		privateLobby.lobbySkill = member.skillRating
	end
	privateLobby.memberList = {}
	table.insert( privateLobby.memberList, {
		index = memberIndex,
		xuid = member.xuid,
		skill = member.skillRating,
		arenaPoints = member.arenaPoints
	} )
	table.insert( privateLobbyList, privateLobby )
end

Lobby.TeamSelection.AddAsIndividualToPrivateLobbyList = function ( member, memberIndex, privateLobbyList )
	local privateLobby = {
		lobbyID = member.lobbyID
	}
	if LuaUtils.IsArenaMode() then
		privateLobby.lobbySkill = member.arenaPoints
	else
		privateLobby.lobbySkill = member.skillRating
	end
	privateLobby.memberList = {}
	table.insert( privateLobby.memberList, {
		index = memberIndex,
		xuid = member.xuid,
		skill = member.skillRating,
		arenaPoints = member.arenaPoints
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
		local f21_local2 = i
		table.insert( privateLobby.memberList, {
			index = -1,
			xuid = 0,
			skill = 0,
			arenaPoints = 0
		} )
	end
	table.insert( privateLobbyList, privateLobby )
end

Lobby.TeamSelection.CanSplitInProgress = function ( members, joiningCounts, maxClients, unbalancedTeamsCheck )
	local numPlayers = 0
	local countA = 0
	local countB = 0
	local countUnassigned = 0
	local countMisc = 0
	for i, member in ipairs( members ) do
		local s = 1
		local mapId = nil
		if member.team == Enum.team_t.TEAM_ALLIES then
			countA = countA + 1
		end
		if member.team == Enum.team_t.TEAM_AXIS then
			countB = countB + 1
		end
		if member.team == Enum.team_t.TEAM_FREE then
			countUnassigned = countUnassigned + 1
		else
			countMisc = countMisc + 1
		end
	end
	local teamSize = math.floor( (maxClients - countMisc) / 2 )
	if countB < countA then
		countA = countA + countUnassigned
	else
		countB = countB + countUnassigned
	end
	local sortByCount = function ( a, b )
		return b < a
	end
	
	table.sort( joiningCounts, sortByCount )
	local curTeamImbalance = math.abs( countA - countB )
	for i, count in ipairs( joiningCounts ) do
		if countA < countB then
			countA = countA + count
		else
			countB = countB + count
		end
	end
	if teamSize < countA then
		return false
	elseif teamSize < countB then
		return false
	elseif unbalancedTeamsCheck == true and true == Dvar.tu9_canSplitInProgressUnbalancedTeams:get() then
		local newTeamImbalance = math.abs( countA - countB )
		if newTeamImbalance > 1 and curTeamImbalance < newTeamImbalance then
			return false
		end
	end
	return true
end

Lobby.TeamSelection.BuildAllocationMap = function ( nPlayers )
	local pattern = {
		1,
		2,
		2,
		1
	}
	local patternIdx = 1
	local map = {}
	for i = 1, nPlayers, 1 do
		map[i] = pattern[patternIdx]
		patternIdx = patternIdx + 1
		if #pattern < patternIdx then
			patternIdx = 1
		end
	end
	return map
end

Lobby.TeamSelection.SortBySkill = function ( a, b )
	return b.lobbySkill < a.lobbySkill
end

Lobby.TeamSelection.SortBySizeAndSkill = function ( a, b )
	if #a.memberList == #b.memberList then
		return sortBySkill( a, b )
	else
		return #b.memberList < #a.memberList
	end
end

Lobby.TeamSelection.SwapSolo = function ( a, b )
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

Lobby.TeamSelection.VladSplit = function ( privateLobbyList, maxClients )
	local numPlayers = 0
	for i, lobby in ipairs( privateLobbyList ) do
		numPlayers = numPlayers + #lobby.memberList
	end
	for attempt = 1, 2, 1 do
		local allocationMap = Lobby.TeamSelection.BuildAllocationMap( numPlayers )
		if attempt == 1 then
			table.sort( privateLobbyList, Lobby.TeamSelection.SortBySkill )
		else
			table.sort( privateLobbyList, Lobby.TeamSelection.SortBySizeAndSkill )
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
				local f28_local8 = j
			end
			local f28_local8 = j
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
			Lobby.TeamSelection.SwapSolo( teamA, teamB )
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

Lobby.TeamSelection.VladSplitWithBots = function ( privateLobbyList, maxClients, bots )
	local numPlayers = 0
	for i, lobby in ipairs( privateLobbyList ) do
		numPlayers = numPlayers + #lobby.memberList
	end
	for attempt = 1, 2, 1 do
		local allocationMap = Lobby.TeamSelection.BuildAllocationMap( numPlayers + #bots )
		if attempt == 1 then
			table.sort( privateLobbyList, Lobby.TeamSelection.SortBySkill )
		else
			table.sort( privateLobbyList, Lobby.TeamSelection.SortBySizeAndSkill )
		end
		local x = 1
		local teamA = {}
		local teamB = {}
		local countA = 0
		local countB = 0
		for i, bot in ipairs( bots ) do
			local member = {
				index = bot.index,
				xuid = bot.client.xuid,
				skill = bot.client.skillRating,
				arenaPoints = bot.client.arenaPoints
			}
			local fakesolution = {
				lobbyID = "Bot",
				lobbySkill = 0,
				memberList = {
					member
				}
			}
			if bot.client.team == 1 then
				table.insert( teamA, fakesolution )
				countA = countA + 1
			else
				table.insert( teamB, fakesolution )
				countB = countB + 1
			end
		end
		local startingDelta = math.abs( countA - countB )
		local isTeamA = true
		if countA < countB then
			isTeamA = false
		end
		for i, lobby in ipairs( privateLobbyList ) do
			while allocationMap[x] == 0 do
				x = x + 1
			end
			local team = allocationMap[x]
			if 0 < startingDelta then
				if isTeamA then
					team = 2
				else
					team = 1
				end
			end
			if team == 1 then
				table.insert( teamA, lobby )
				countA = countA + #lobby.memberList
			else
				table.insert( teamB, lobby )
				countB = countB + #lobby.memberList
			end
			local k = x
			for j = 0, #lobby.memberList - 1, 1 do
				local f29_local8 = j
			end
			local f29_local8 = j
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
			Lobby.TeamSelection.SwapSolo( teamA, teamB )
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

Lobby.TeamSelection.RemoveCodCaster = function ( gamelobby )
	local codCasters = 0
	for i = #gamelobby.sessionClients, 1, -1 do
		local team = gamelobby.sessionClients[i].team
		if team == Enum.team_t.TEAM_SPECTATOR then
			table.remove( gamelobby.sessionClients, i )
			codCasters = codCasters + 1
		end
	end
	return codCasters
end

Lobby.TeamSelection.AutoSplitTeam = function ( mustBalance, logOutput )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	if not CoDShared.IsGametypeTeamBased() then
		for index, client in ipairs( gamelobby.sessionClients ) do
			if client.team ~= Enum.team_t.TEAM_SPECTATOR then
				Engine.LobbyHostAssignTeamToClient( lobbyType, client.xuid, Enum.team_t.TEAM_FREE )
			end
		end
		return true
	else
		local codCasters = Lobby.TeamSelection.RemoveCodCaster( gamelobby )
		if codCasters == Engine.GetLobbyClientCount( lobbyType ) then
			return true
		end
		botsOnTeam = {}
		for index = #gamelobby.sessionClients, 1, -1 do
			local team = gamelobby.sessionClients[index].team
			local clientType = gamelobby.sessionClients[index].lobbyClientType
			if clientType ~= Enum.LobbyClientType.LOBBY_CLIENT_TYPE_BOT_PERMANENT and clientType ~= Enum.LobbyClientType.LOBBY_CLIENT_TYPE_BOT_TEMP then
				local f31_local4 = false
			else
				local isBot = true
			end
			if f31_local4 and team ~= Enum.team_t.TEAM_FREE then
				table.insert( botsOnTeam, {
					index = index,
					client = gamelobby.sessionClients[index]
				} )
				table.remove( gamelobby.sessionClients, index )
			end
		end
		local privateLobbyList = {}
		local curScreen = LobbyData.GetCurrentMenuTarget()
		if curScreen.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			for index, f31_local4 in ipairs( gamelobby.sessionClients ) do
				Lobby.TeamSelection.AddAsIndividualToPrivateLobbyList( f31_local4, index, privateLobbyList )
			end
		else
			for index, f31_local4 in ipairs( gamelobby.sessionClients ) do
				Lobby.TeamSelection.AddToPrivateLobbyList( f31_local4, index, privateLobbyList )
			end
		end
		local maxClients = Engine.GetLobbyMaxClients( lobbyType )
		local split = {}
		if #botsOnTeam > 0 then
			split = Lobby.TeamSelection.VladSplitWithBots( privateLobbyList, maxClients, botsOnTeam )
			gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
			Lobby.TeamSelection.RemoveCodCaster( gamelobby )
		else
			split = Lobby.TeamSelection.VladSplit( privateLobbyList, maxClients )
		end
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
		if logOutput then
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
				Engine.LobbyHostAssignTeamToClient( lobbyType, member.xuid, team )
			end
		end
		for i, client in ipairs( split.teams[2] ) do
			local team = Enum.team_t.TEAM_AXIS
			for idx, member in ipairs( client.memberList ) do
				local client = gamelobby.sessionClients[member.index]
				if logOutput then
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( i ) .. ") " .. client.gamertag .. " - lobbyID(" .. tostring( client.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( client.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( team ) .. " -- lobbySkill: " .. tostring( client.lobbySkill ) .. " -- skill: " .. tostring( client.skillRating ) .. "\n" )
				end
				Engine.LobbyHostAssignTeamToClient( lobbyType, member.xuid, team )
			end
		end
		if logOutput then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.AutoSplitTeam end\n" )
		end
		if mustBalance == true and split.isBalanced == false then
			if logOutput then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Could not create balanced teams.\n" )
			end
			return false
		else
			return true
		end
	end
end

Lobby.TeamSelection.CanFitMaxPartySize = function ( data, gamelobby, maxPartySize )
	local probedXuid = data.probedXuid
	if probedXuid == nil or probedXuid == LuaDefine.INVALID_XUID then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	end
	local joinLobbyID = nil
	for index, client in ipairs( gamelobby.sessionClients ) do
		if client.xuid == probedXuid then
			joinLobbyID = client.lobbyID
			break
		end
	end
	if joinLobbyID == nil then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	elseif not Engine.LobbyGetReservationData then
		local partyCount = 0
		for index, client in ipairs( gamelobby.sessionClients ) do
			if client.lobbyID == lobbyID then
				partyCount = partyCount + 1
			end
		end
		if maxPartySize < partyCount + #data.members then
			return Enum.JoinResult.JOIN_RESULT_NO_PARTIES
		end
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "^5 #gamelobby.sessionClients: " .. tostring( #gamelobby.sessionClients ) .. ".\n" )
		local probedXuidOverride = Engine.milliseconds() + Dvar.lobbyProbedXuidOverride:get()
		local partyCount = 0
		for index, client in ipairs( gamelobby.sessionClients ) do
			if client.probedXuid ~= LuaDefine.INVALID_XUID and client.probedXuidTimestamp < probedXuidOverride and client.probedXuid == probedXuid then
				partyCount = partyCount + 1
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "^6 probedXuid client.xuid: " .. tostring( client.xuid ) .. "\n" )
			end
			if client.lobbyID == joinLobbyID then
				partyCount = partyCount + 1
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "^6 in lobby client.xuid: " .. tostring( client.xuid ) .. "\n" )
			end
		end
		local reservation = Engine.LobbyGetReservationData()
		local reserveCount = 0
		if reservation.count > 0 then
			for index, client in ipairs( reservation.status ) do
				if client.probedXuid == probedXuid then
					reserveCount = reserveCount + 1
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "^6 in reserve client.xuid: " .. tostring( client.xuid ) .. "\n" )
				end
			end
		end
		if maxPartySize < reserveCount + partyCount + #data.members then
			return Enum.JoinResult.JOIN_RESULT_NO_PARTIES
		end
	end
	return Enum.JoinResult.JOIN_RESULT_SUCCESS
end

Lobby.TeamSelection.OnCanFitLobbys = function ( data )
	local lobbyHostXuid = data.lobbyHostXuid
	LuaUtils.LogQoS( "can_fit/input", data )
	local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local playlistID = Engine.GetPlaylistID()
	local maxPartySize = Engine.GetPlaylistMaxPartySize( playlistID )
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local hostXuid = Engine.GetLobbyHostXuid( Enum.LobbyType.LOBBY_TYPE_GAME )
	if lobbyHostXuid ~= nil and lobbyHostXuid ~= LuaDefine.INVALID_XUID and lobbyHostXuid == hostXuid then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	elseif Engine.IsMultiplayerGame() then
		local canFit = Lobby.TeamSelection.CanFitMaxPartySize( data, gamelobby, maxPartySize )
		if canFit ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
			return canFit
		end
	end
	if CoDShared.IsTeamBasedGame() == false or Engine.IsZombiesGame() or Engine.IsCampaignGame() then
		if Dvar.tu2_skipMaxClientCheck:get() == 0 then
			local expected = 0
			for i, count in ipairs( data.lobbys ) do
				expected = expected + count
			end
			local totalExpected = #gamelobby.sessionClients + expected
			local curScreen = LobbyData.GetCurrentMenuTarget()
			if curScreen.maxClients < totalExpected then
				return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
			elseif maxClients < totalExpected then
				return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
			end
		end
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	end
	local privateLobbyList = {}
	if Engine.IsInGame() then
		local lobbys = {}
		for i, count in ipairs( data.lobbys ) do
			table.insert( lobbys, count )
		end
		local result = Lobby.TeamSelection.CanSplitInProgress( gamelobby.sessionClients, lobbys, maxClients, true )
		LuaUtils.LogQoS( "can_fit/result", result )
		if result then
			return Enum.JoinResult.JOIN_RESULT_SUCCESS
		end
		return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
	end
	for index, count in ipairs( gamelobby.sessionClients ) do
		Lobby.TeamSelection.AddToPrivateLobbyList( count, index, privateLobbyList )
	end
	for index, count in ipairs( data.lobbys ) do
		Lobby.TeamSelection.AddDummyToPrivateLobbyList( count, privateLobbyList )
	end
	if data.members ~= nil and #data.members > Dvar.lobbyAdvertiseTeamSizeMax:get() then
		LuaUtils.LogQoS( "can_fit/result", false )
		return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
	end
	local split = Lobby.TeamSelection.VladSplit( privateLobbyList, maxClients )
	local result = false
	if split.isBalanced then
		result = true
	elseif split.canBalance then
		result = true
	end
	LuaUtils.LogQoS( "can_fit/result", result )
	if result then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	end
	return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
end

Lobby.TeamSelection.ClientJoined = function ( data )
	if not Lobby.TeamSelection.ShouldAssignToTeam( data ) then
		return 
	end
	local xuid = data.xuid
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
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
	elseif data.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		local teamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
		if teamAssignment ~= LuaEnum.TEAM_ASSIGNMENT.AUTO then
			if joinedClient.team == Enum.team_t.TEAM_FREE and CoDShared.IsGametypeTeamBased() then
				Engine.LobbyHostAssignTeamToClient( lobbyType, xuid, Enum.team_t.TEAM_ALLIES )
			end
			return 
		end
		local pregameState = Engine.GetLobbyPregameState()
		if pregameState ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE == true then
			local clients = Engine.GetTeams( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
			local teams = {}
			for clientIndex, client in pairs( clients.clientTeams ) do
				if not teams[client.team] then
					teams[client.team] = {}
				end
			end
			local alliesCount = 0
			if teams[Enum.team_t.TEAM_ALLIES] then
				alliesCount = #teams[Enum.team_t.TEAM_ALLIES]
			end
			local axisCount = 0
			if teams[Enum.team_t.TEAM_AXIS] then
				axisCount = #teams[Enum.team_t.TEAM_AXIS]
			end
			if alliesCount == axisCount then
				if math.random( 0, 1 ) == 1 then
					Engine.LobbyHostAssignTeamToClient( lobbyType, xuid, Enum.team_t.TEAM_ALLIES )
				else
					Engine.LobbyHostAssignTeamToClient( lobbyType, xuid, Enum.team_t.TEAM_AXIS )
				end
			elseif axisCount < alliesCount then
				Engine.LobbyHostAssignTeamToClient( lobbyType, xuid, Enum.team_t.TEAM_AXIS )
			else
				Engine.LobbyHostAssignTeamToClient( lobbyType, xuid, Enum.team_t.TEAM_ALLIES )
			end
			table.insert( teams[client.team], client )
		end
	end
	for index, client in ipairs( gamelobby.sessionClients ) do
		if joinedClient.xuid ~= client.xuid and joinedClient.lobbyID == client.lobbyID then
			Engine.LobbyHostAssignTeamToClient( lobbyType, joinedClient.xuid, client.team )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Joining client is part of a party.\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. joinedClient.gamertag .. " - lobbyID(" .. tostring( joinedClient.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( joinedClient.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( client.team ) .. " -- score: " .. tostring( client.score ) .. ".\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined end.\n" )
			return 
		end
	end
	local teamAlliesCount = 0
	local teamAxisCount = 0
	local team = Enum.team_t.TEAM_FREE
	if CoDShared.IsGametypeTeamBased() then
		for index, f34_local5 in ipairs( gamelobby.sessionClients ) do
			if joinedClient.xuid ~= f34_local5.xuid then
				if f34_local5.team == Enum.team_t.TEAM_ALLIES then
					teamAlliesCount = teamAlliesCount + 1
				end
				if f34_local5.team == Enum.team_t.TEAM_AXIS then
					teamAxisCount = teamAxisCount + 1
				end
			end
		end
		team = Enum.team_t.TEAM_ALLIES
		if teamAxisCount < teamAlliesCount then
			team = Enum.team_t.TEAM_AXIS
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Clients in session: " .. #gamelobby.sessionClients .. ", teamAlliesCount: " .. teamAlliesCount .. ", teamAxisCount:" .. teamAxisCount .. ".\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. joinedClient.gamertag .. " - lobbyID(" .. tostring( joinedClient.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( joinedClient.simpleLobbyID ) .. " -- team: " .. tostring( team ) .. ".\n" )
	Engine.LobbyHostAssignTeamToClient( lobbyType, joinedClient.xuid, team )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined end.\n" )
end

Lobby.TeamSelection.GametypeSettingsChange = function ()
	local teamBased = CoDShared.IsGametypeTeamBased()
	local f35_local0 = Engine.GetGametypeSetting( "allowspectating" ) == 1
	local teamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
	local f35_local1 = teamBased ~= Lobby.TeamSelection.gameSetting.teamBased
	local f35_local2 = f35_local0 ~= Lobby.TeamSelection.gameSetting.allowSpectating
	local f35_local3 = teamAssignment ~= Lobby.TeamSelection.gameSetting.teamAssignment
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	if f35_local1 == false and f35_local2 == false and f35_local3 == false then
		return 
	end
	Engine.LuiVM_Event( "update_team_selection_buttons", {} )
	if f35_local1 and teamBased == false then
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_ALLIES )
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_AXIS )
	end
	if f35_local2 and f35_local0 == false then
		if teamAssignment == LuaEnum.TEAM_ASSIGNMENT.AUTO then
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_SPECTATOR )
		else
			local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			for index, client in ipairs( gamelobby.sessionClients ) do
				if client.team == Enum.team_t.TEAM_SPECTATOR then
					Engine.LobbyHostAssignTeamToClient( lobbyType, client.xuid, Enum.team_t.TEAM_ALLIES )
				end
			end
		end
	end
	if f35_local3 and teamBased == true then
		local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		if teamAssignment == LuaEnum.TEAM_ASSIGNMENT.AUTO then
			for index, client in ipairs( gamelobby.sessionClients ) do
				if client.team ~= Enum.team_t.TEAM_SPECTATOR then
					Engine.LobbyHostAssignTeamToClient( lobbyType, client.xuid, Enum.team_t.TEAM_FREE )
				end
			end
		else
			for index, client in ipairs( gamelobby.sessionClients ) do
				if client.team == Enum.team_t.TEAM_FREE then
					Engine.LobbyHostAssignTeamToClient( lobbyType, client.xuid, Enum.team_t.TEAM_ALLIES )
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
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_CAMPAIGN then
		return 
	end
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	if Engine.IsLobbyHost( lobbyType ) then
		Engine.ClearTeamData( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	end
	for clientNum = 1, LuaDefine.MAX_CLIENTS, 1 do
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

