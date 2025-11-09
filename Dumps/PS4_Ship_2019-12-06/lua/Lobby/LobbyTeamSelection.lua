require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LuaEnums" )

Lobby.TeamSelection = {}
Lobby.TeamSelection.DONT_SWITCH = -1
Lobby.TeamSelection.TEAM_SWITCH_DELAY = 1500
Lobby.TeamSelection.LOCAL_CLIENT_COUNT = 4
Lobby.TeamSelection.Clients = {}
Lobby.TeamSelection.lastGameMode = ""
Lobby.TeamSelection.gameSetting = {}
Lobby.TeamSelection.random = math.random()
Lobby.TeamSelection.TeamIdToString = function ( f1_arg0 )
	if f1_arg0 == Enum.team_t.TEAM_ALLIES then
		return "ALLIES"
	elseif f1_arg0 == Enum.team_t.TEAM_AXIS then
		return "AXIS"
	elseif f1_arg0 == Enum.team_t.TEAM_SPECTATOR then
		return "CASTER"
	else
		return "FREE"
	end
end

Lobby.TeamSelection.ShouldAssignToTeam = function ( f2_arg0 )
	local f2_local0 = f2_arg0.lobbyModule
	local f2_local1 = f2_arg0.lobbyType
	local f2_local2 = f2_arg0.lobbyMode
	local f2_local3 = LobbyData.GetCurrentMenuTarget()
	if f2_local3.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ShouldAssignToTeam [false] Reason: curScreen.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP \n" )
		return false
	elseif f2_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f2_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		if f2_local2 == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			if not CoDShared.IsGametypeTeamBased() then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ShouldAssignToTeam [false] Reason: not CoDShared.IsGametypeTeamBased() \n" )
				return false
			elseif Engine.IsInGame() then
				return false
			elseif Enum.GameServerStatus.GAME_SERVER_STATUS_IDLE < Engine.LobbyHostLaunchGetServerStatus() then
				return false
			elseif Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE ~= Engine.GetLobbyPregameState() ~= true and Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO and Lobby.Timer.GetTimerStatus() ~= Lobby.Timer.LOBBY_STATUS.STARTING then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ShouldAssignToTeam [false] Reason: teamAssignment == LuaEnums.TEAM_ASSIGNMENT.AUTO and Lobby.Timer.GetTimerStatus() ~= Lobby.Timer.LOBBY_STATUS.STARTING \n" )
				return false
			else
				return true
			end
		elseif f2_local2 == Enum.LobbyMode.LOBBY_MODE_PUBLIC or f2_local2 == Enum.LobbyMode.LOBBY_MODE_ARENA then
			if Lobby.Timer.GetTimerStatus() == Lobby.Timer.LOBBY_STATUS.STARTING then
				return true
			elseif Engine.IsInGame() then
				return true
			elseif Enum.GameServerStatus.GAME_SERVER_STATUS_IDLE < Engine.LobbyHostLaunchGetServerStatus() then
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

Lobby.TeamSelection.ClearTeam = function ( f3_arg0 )
	Engine.ClearTeamData( f3_arg0 )
	for f3_local0 = 1, LuaEnums.MAX_CLIENTS, 1 do
		if Lobby.TeamSelection.Clients[f3_local0].team == f3_arg0 or Lobby.TeamSelection.Clients[f3_local0].switchTeam == f3_arg0 then
			Lobby.TeamSelection.Clients[f3_local0] = {
				team = Enum.team_t.TEAM_FREE,
				switchTeam = Enum.team_t.TEAM_FREE,
				switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
			}
		end
	end
end

Lobby.TeamSelection.StoreGamesetting = function ()
	Lobby.TeamSelection.gameSetting.teamBased = CoDShared.IsGametypeTeamBased()
	Lobby.TeamSelection.gameSetting.allowSpectating = Engine.GetGametypeSetting( "allowspectating" ) == 1
	Lobby.TeamSelection.gameSetting.teamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
end

Lobby.TeamSelection.OnSessionStart = function ( f5_arg0 )
	local f5_local0 = f5_arg0.lobbyModule
	local f5_local1 = f5_arg0.lobbyType
	local f5_local2 = f5_arg0.lobbyMode
	if f5_local1 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		return 
	elseif f5_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f5_local2 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.StoreGamesetting()
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnSessionEnd = function ( f6_arg0 )
	local f6_local0 = f6_arg0.lobbyModule
	local f6_local1 = f6_arg0.lobbyType
	local f6_local2 = f6_arg0.lobbyMode
	if f6_local1 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		return 
	elseif f6_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.Clear()
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnClientAdded = function ( f7_arg0 )
	local f7_local0 = f7_arg0.lobbyModule
	local f7_local1 = f7_arg0.lobbyType
	local f7_local2 = f7_arg0.lobbyMode
	local f7_local3 = f7_arg0.xuid
	if f7_local1 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		return 
	elseif f7_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f7_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.ClientJoined( f7_arg0 )
	end
	if f7_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and f7_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT and f7_local2 == Enum.LobbyMode.LOBBY_MODE_CUSTOM and Engine.IsLocalClient( f7_local3 ) and Engine.GetUsedControllerCount() > 1 then
		for f7_local4 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f7_local7 = f7_local4 - 1
			local f7_local8 = Engine.GetXUID64( f7_local7 )
			if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f7_local8 ) then
				local f7_local9 = Engine.GetLobbyClientNumByXUID( f7_local0, f7_local1, f7_local8 ) + 1
				local f7_local10 = Lobby.TeamSelection.Clients[f7_local9]
				if Engine.GetTeamForXUID( f7_local8 ) == Enum.team_t.TEAM_SPECTATOR or f7_local10 ~= nil and f7_local10.switchTeam == Enum.team_t.TEAM_SPECTATOR then
					Engine.TeamSelection( f7_local7, Enum.team_t.TEAM_FREE )
					Lobby.TeamSelection.Clients[f7_local9] = {
						team = Enum.team_t.TEAM_FREE,
						switchTeam = Enum.team_t.TEAM_FREE,
						switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
					}
				end
			end
		end
	end
end

Lobby.TeamSelection.OnMatchEnd = function ( f8_arg0 )
	local f8_local0 = f8_arg0.lobbyModule
	local f8_local1 = f8_arg0.lobbyType
	local f8_local2 = f8_arg0.lobbyMode
	if f8_local1 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		return 
	elseif f8_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST then
		local f8_local3 = LobbyData.GetCurrentMenuTarget()
		if f8_local3.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
			Lobby.TeamSelection.Clear()
		elseif f8_local2 == Enum.LobbyMode.LOBBY_MODE_CUSTOM and Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_ALLIES )
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_AXIS )
		elseif f8_local2 == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			Lobby.TeamSelection.Clear()
		end
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnGametypeSettingsChange = function ( f9_arg0 )
	local f9_local0 = f9_arg0.lobbyModule
	local f9_local1 = f9_arg0.lobbyType
	local f9_local2 = f9_arg0.lobbyMode
	if f9_local1 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		return 
	elseif f9_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		if f9_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST then
			Lobby.TeamSelection.GametypeSettingsChange()
		elseif f9_local0 == Enum.LobbyModule.LOBBY_MODULE_CLIENT and Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
			Lobby.TeamSelection.GametypeSettingsChange()
		end
	end
end

Lobby.TeamSelection.GetAllowedTeams = function ( f10_arg0 )
	local f10_local0 = Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO
	local f10_local1 = Engine.GetUsedControllerCount() > 1
	if Engine.IsSplitscreenClient then
		f10_local1 = Engine.IsSplitscreenClient( Enum.LobbyType.LOBBY_TYPE_GAME, f10_arg0 )
	end
	local f10_local2
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		f10_local2 = not f10_local1
	else
		f10_local2 = false
	end
	local f10_local3 = CoDShared.IsGametypeTeamBased()
	local f10_local4 = {}
	if f10_local3 and not f10_local0 then
		table.insert( f10_local4, Enum.team_t.TEAM_ALLIES )
		table.insert( f10_local4, Enum.team_t.TEAM_AXIS )
	else
		table.insert( f10_local4, Enum.team_t.TEAM_FREE )
	end
	if f10_local2 then
		table.insert( f10_local4, Enum.team_t.TEAM_SPECTATOR )
	end
	return f10_local4
end

Lobby.TeamSelection.SwitchTeamClientAssignment = function ( f11_arg0 )
	local f11_local0 = f11_arg0.controller
	local f11_local1 = f11_arg0.selection
	local f11_local2 = f11_arg0.xuid
	if not f11_local2 or f11_local2 == 0 then
		f11_local2 = Engine.GetXUID64( f11_local0 )
	end
	local f11_local3 = Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f11_local2 )
	if f11_local3 == LuaEnums.INVALID_CLIENT_INDEX then
		return 
	end
	local f11_local4 = Lobby.TeamSelection.Clients[f11_local3 + 1]
	local f11_local5 = Lobby.TeamSelection.GetAllowedTeams( f11_local2 )
	local f11_local6 = 0
	local f11_local7 = 1
	for f11_local8 = 1, #f11_local5, 1 do
		if f11_local4.switchTeam == f11_local5[f11_local8] then
			f11_local6 = f11_local8
			break
		end
	end
	if f11_local1 == 0 then
		if f11_local6 <= 1 then
			f11_local7 = #f11_local5
		else
			f11_local7 = f11_local6 - 1
		end
	elseif #f11_local5 <= f11_local6 then
		f11_local7 = 1
	else
		f11_local7 = f11_local6 + 1
	end
	f11_local4.switchTeamType = LuaEnums.TEAM_ASSIGNMENT.CLIENT
	f11_local4.controller = f11_local0
	f11_local4.xuid = f11_local2
	f11_local4.switchTeam = f11_local5[f11_local7]
	Engine.LuiVM_Event( "team_switch", {
		controller = f11_local0,
		switchTeam = f11_local4.switchTeam,
		xuid = f11_local2
	} )
	if f11_local4.team == f11_local4.switchTeam then
		f11_local4.switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
	else
		f11_local4.switchTeamTime = Lobby.TeamSelection.TEAM_SWITCH_DELAY + Engine.milliseconds()
	end
end

Lobby.TeamSelection.SwitchTeamHostAssignment = function ( f12_arg0 )
	local f12_local0 = f12_arg0.controller
	local f12_local1 = f12_arg0.selection
	local f12_local2 = f12_arg0.xuid
	local f12_local3 = Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, f12_local2 )
	if f12_local3 == LuaEnums.INVALID_CLIENT_INDEX then
		return 
	end
	local f12_local4 = Lobby.TeamSelection.Clients[f12_local3 + 1]
	local f12_local5 = Lobby.TeamSelection.GetAllowedTeams( f12_local2 )
	local f12_local6 = 0
	local f12_local7 = 1
	for f12_local8 = 1, #f12_local5, 1 do
		if f12_local4.switchTeam == f12_local5[f12_local8] then
			f12_local6 = f12_local8
			break
		end
	end
	if f12_local1 == 0 then
		if f12_local6 <= 1 then
			f12_local7 = #f12_local5
		else
			f12_local7 = f12_local6 - 1
		end
	elseif #f12_local5 <= f12_local6 then
		f12_local7 = 1
	else
		f12_local7 = f12_local6 + 1
	end
	f12_local4.switchTeamType = LuaEnums.TEAM_ASSIGNMENT.HOST
	f12_local4.controller = f12_local0
	f12_local4.xuid = f12_local2
	f12_local4.switchTeam = f12_local5[f12_local7]
	Engine.LuiVM_Event( "team_switch", {
		controller = f12_local0,
		switchTeam = f12_local4.switchTeam,
		xuid = f12_local2
	} )
	if f12_local4.team == f12_local4.switchTeam then
		f12_local4.switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
	else
		f12_local4.switchTeamTime = Lobby.TeamSelection.TEAM_SWITCH_DELAY + Engine.milliseconds()
	end
end

Lobby.TeamSelection.SwitchTeam = function ( f13_arg0 )
	local f13_local0 = Engine.GetGametypeSetting( "teamAssignment" )
	if f13_local0 == LuaEnums.TEAM_ASSIGNMENT.CLIENT or f13_local0 == LuaEnums.TEAM_ASSIGNMENT.AUTO then
		Lobby.TeamSelection.SwitchTeamClientAssignment( f13_arg0 )
	elseif f13_local0 == LuaEnums.TEAM_ASSIGNMENT.HOST and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		Lobby.TeamSelection.SwitchTeamHostAssignment( f13_arg0 )
	end
end

Lobby.TeamSelection.SendChanges = function ()
	for f14_local0 = 1, #Lobby.TeamSelection.Clients, 1 do
		local f14_local3 = Lobby.TeamSelection.Clients[f14_local0]
		if f14_local3 and f14_local3.switchTeamTime ~= Lobby.TeamSelection.DONT_SWITCH and f14_local3.switchTeamTime < Engine.milliseconds() then
			f14_local3.switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
			if f14_local3.switchTeamType == LuaEnums.TEAM_ASSIGNMENT.CLIENT then
				Engine.TeamSelection( f14_local3.controller, f14_local3.switchTeam )
			end
			if f14_local3.switchTeamType == LuaEnums.TEAM_ASSIGNMENT.HOST then
				Engine.LobbyHostAssignTeamToClient( f14_local3.xuid, f14_local3.switchTeam )
			end
		end
	end
end

Lobby.TeamSelection.GameLobbyClientDataUpdate = function ( f15_arg0 )
	local f15_local0 = f15_arg0
	if f15_arg0.clients ~= nil then
		f15_local0 = f15_arg0.clients
	end
	for f15_local1 = 1, #Lobby.TeamSelection.Clients, 1 do
		local f15_local4 = Lobby.TeamSelection.Clients[f15_local1]
		local f15_local5 = f15_local4.xuid
		for f15_local9, f15_local10 in pairs( f15_local0 ) do
			if f15_local10.xuid ~= 0 and f15_local5 == f15_local10.xuid then
				f15_local4.team = f15_local10.team
				if f15_local4.switchTeam == Enum.team_t.TEAM_FREE then
					f15_local4.switchTeam = f15_local4.team
				end
			end
		end
	end
end

Lobby.TeamSelection.AddToPrivateLobbyList = function ( f16_arg0, f16_arg1, f16_arg2 )
	for f16_local3, f16_local4 in ipairs( f16_arg2 ) do
		if f16_arg0.lobbyID == f16_local4.lobbyID then
			if LuaUtils.IsArenaMode() then
				f16_local4.lobbySkill = f16_local4.lobbySkill + f16_arg0.arenaPoints
			else
				f16_local4.lobbySkill = f16_local4.lobbySkill + f16_arg0.skillRating
			end
			table.insert( f16_local4.memberList, {
				index = f16_arg1,
				xuid = f16_arg0.xuid,
				skill = f16_arg0.skillRating,
				arenaPoints = f16_arg0.arenaPoints
			} )
			return 
		end
	end
	f16_local0 = {
		lobbyID = f16_arg0.lobbyID
	}
	if LuaUtils.IsArenaMode() then
		f16_local0.lobbySkill = f16_arg0.arenaPoints
	else
		f16_local0.lobbySkill = f16_arg0.skillRating
	end
	f16_local0.memberList = {}
	table.insert( f16_local0.memberList, {
		index = f16_arg1,
		xuid = f16_arg0.xuid,
		skill = f16_arg0.skillRating,
		arenaPoints = f16_arg0.arenaPoints
	} )
	table.insert( f16_arg2, f16_local0 )
end

Lobby.TeamSelection.AddAsIndividualToPrivateLobbyList = function ( f17_arg0, f17_arg1, f17_arg2 )
	local f17_local0 = {
		lobbyID = f17_arg0.lobbyID
	}
	if LuaUtils.IsArenaMode() then
		f17_local0.lobbySkill = f17_arg0.arenaPoints
	else
		f17_local0.lobbySkill = f17_arg0.skillRating
	end
	f17_local0.memberList = {}
	table.insert( f17_local0.memberList, {
		index = f17_arg1,
		xuid = f17_arg0.xuid,
		skill = f17_arg0.skillRating,
		arenaPoints = f17_arg0.arenaPoints
	} )
	table.insert( f17_arg2, f17_local0 )
end

Lobby.TeamSelection.AddDummyToPrivateLobbyList = function ( f18_arg0, f18_arg1 )
	local f18_local0 = {
		lobbyID = -1,
		lobbySkill = 0,
		memberList = {}
	}
	for f18_local1 = 1, f18_arg0, 1 do
		local f18_local4 = f18_local1
		table.insert( f18_local0.memberList, {
			index = -1,
			xuid = 0,
			skill = 0,
			arenaPoints = 0
		} )
	end
	table.insert( f18_arg1, f18_local0 )
end

Lobby.TeamSelection.CanSplitInProgress = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
	local f19_local0 = 0
	local f19_local1 = 0
	local f19_local2 = 0
	local f19_local3 = 0
	local f19_local4 = 0
	for f19_local8, f19_local9 in ipairs( f19_arg0 ) do
		local f19_local10 = 1
		local f19_local11 = nil
		if f19_local9.team == Enum.team_t.TEAM_ALLIES then
			f19_local1 = f19_local1 + 1
		end
		if f19_local9.team == Enum.team_t.TEAM_AXIS then
			f19_local2 = f19_local2 + 1
		end
		if f19_local9.team == Enum.team_t.TEAM_FREE then
			f19_local3 = f19_local3 + 1
		else
			f19_local4 = f19_local4 + 1
		end
	end
	f19_local5 = math.floor( (f19_arg2 - f19_local4) / 2 )
	if f19_local2 < f19_local1 then
		f19_local1 = f19_local1 + f19_local3
	else
		f19_local2 = f19_local2 + f19_local3
	end
	table.sort( f19_arg1, function ( f20_arg0, f20_arg1 )
		return f20_arg1 < f20_arg0
	end )
	f19_local7 = math.abs( f19_local1 - f19_local2 )
	for f19_local11, f19_local12 in ipairs( f19_arg1 ) do
		if f19_local1 < f19_local2 then
			f19_local1 = f19_local1 + f19_local12
		else
			f19_local2 = f19_local2 + f19_local12
		end
	end
	if f19_local5 < f19_local1 then
		return false
	elseif f19_local5 < f19_local2 then
		return false
	elseif f19_arg3 == true and true == Dvar.tu9_canSplitInProgressUnbalancedTeams:get() then
		f19_local8 = math.abs( f19_local1 - f19_local2 )
		if f19_local8 > 1 and f19_local7 < f19_local8 then
			return false
		end
	end
	return true
end

Lobby.TeamSelection.VladSplit = function ( f21_arg0, f21_arg1 )
	local f21_local0 = 0
	local f21_local1 = function ( f22_arg0 )
		local f22_local0 = {
			1,
			2,
			2,
			1
		}
		local f22_local1 = 1
		local f22_local2 = {}
		for f22_local3 = 1, f21_local0, 1 do
			f22_local2[f22_local3] = f22_local0[f22_local1]
			f22_local1 = f22_local1 + 1
			if #f22_local0 < f22_local1 then
				f22_local1 = 1
			end
		end
		return f22_local2
	end
	
	local f21_local2 = function ( f23_arg0, f23_arg1 )
		return f23_arg1.lobbySkill < f23_arg0.lobbySkill
	end
	
	local f21_local3 = function ( f24_arg0, f24_arg1 )
		if #f24_arg0.memberList == #f24_arg1.memberList then
			return f21_local2( f24_arg0, f24_arg1 )
		else
			return #f24_arg1.memberList < #f24_arg0.memberList
		end
	end
	
	local f21_local4 = function ( f25_arg0, f25_arg1 )
		local f25_local0 = 0
		local f25_local1 = 0
		local f25_local2 = {}
		local f25_local3 = {}
		for f25_local7, f25_local8 in ipairs( f25_arg0 ) do
			f25_local0 = f25_local0 + f25_local8.lobbySkill
			if #f25_local8.memberList == 1 then
				table.insert( f25_local2, f25_local7 )
			end
		end
		for f25_local7, f25_local8 in ipairs( f25_arg1 ) do
			f25_local1 = f25_local1 + f25_local8.lobbySkill
			if #f25_local8.memberList == 1 then
				table.insert( f25_local3, f25_local7 )
			end
		end
		f25_local4 = f25_local0 - f25_local1
		f25_local5 = f25_local4
		f25_local6 = {}
		for f25_local13, f25_local14 in ipairs( f25_local2 ) do
			for f25_local10, f25_local11 in ipairs( f25_local3 ) do
				delta1 = f25_local4 - 2 * (f25_arg0[f25_local14].lobbySkill - f25_arg1[f25_local11].lobbySkill)
				if math.abs( f25_local5 ) > math.abs( delta1 ) then
					f25_local5 = delta1
					f25_local6 = {
						f25_local14,
						f25_local11
					}
				end
			end
		end
		if math.abs( f25_local5 ) < math.abs( f25_local4 ) then
			f25_local7 = table.remove( f25_arg0, f25_local6[1] )
			table.insert( f25_arg0, table.remove( f25_arg1, f25_local6[2] ) )
			table.insert( f25_arg1, f25_local7 )
			return true
		else
			return false
		end
	end
	
	for f21_local8, f21_local9 in ipairs( f21_arg0 ) do
		f21_local0 = f21_local0 + #f21_local9.memberList
	end
	for f21_local5 = 1, 2, 1 do
		f21_local9 = f21_local1( f21_local0 )
		if f21_local5 == 1 then
			table.sort( f21_arg0, f21_local2 )
		else
			table.sort( f21_arg0, f21_local3 )
		end
		local f21_local10 = 1
		local f21_local11 = {}
		local f21_local12 = {}
		local f21_local13 = 0
		local f21_local14 = 0
		for f21_local24, f21_local25 in ipairs( f21_arg0 ) do
			while f21_local9[f21_local10] == 0 do
				f21_local10 = f21_local10 + 1
			end
			local f21_local18 = f21_local9[f21_local10]
			if f21_local18 == 1 then
				table.insert( f21_local11, f21_local25 )
				f21_local13 = f21_local13 + #f21_local25.memberList
			else
				table.insert( f21_local12, f21_local25 )
				f21_local14 = f21_local14 + #f21_local25.memberList
			end
			local f21_local19 = f21_local10
			for f21_local20 = 0, #f21_local25.memberList - 1, 1 do
				local f21_local23 = f21_local20
			end
			local f21_local23 = f21_local20
		end
		f21_local15 = math.abs( f21_local13 - f21_local14 )
		if f21_arg1 < f21_local13 + f21_local14 then
			return {
				isBalanced = false,
				canBalance = false,
				teams = {
					f21_local11,
					f21_local12
				},
				counts = {
					f21_local13,
					f21_local14
				}
			}
		elseif f21_local15 <= 1 then
			f21_local4( f21_local11, f21_local12 )
			if Lobby.TeamSelection.random > 0.5 then
				return {
					isBalanced = true,
					canBalance = true,
					teams = {
						f21_local11,
						f21_local12
					},
					counts = {
						f21_local13,
						f21_local14
					}
				}
			else
				return {
					isBalanced = true,
					canBalance = true,
					teams = {
						f21_local12,
						f21_local11
					},
					counts = {
						f21_local14,
						f21_local13
					}
				}
			end
		elseif f21_local5 == 2 then
			return {
				isBalanced = false,
				canBalance = f21_local15 <= f21_arg1 - f21_local13 - f21_local14,
				teams = {
					f21_local11,
					f21_local12
				},
				counts = {
					f21_local13,
					f21_local14
				}
			}
		end
	end
end

Lobby.TeamSelection.AutoSplitTeam = function ( f26_arg0, f26_arg1 )
	local f26_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	if not CoDShared.IsGametypeTeamBased() then
		for f26_local4, f26_local5 in ipairs( f26_local0.sessionClients ) do
			if f26_local5.team ~= Enum.team_t.TEAM_SPECTATOR then
				Engine.LobbyHostAssignTeamToClient( f26_local5.xuid, Enum.team_t.TEAM_FREE )
			end
		end
		return true
	else
		local f26_local1 = 0
		for f26_local2 = #f26_local0.sessionClients, 1, -1 do
			if f26_local0.sessionClients[f26_local2].team == Enum.team_t.TEAM_SPECTATOR then
				table.remove( f26_local0.sessionClients, f26_local2 )
				f26_local1 = f26_local1 + 1
			end
		end
		if f26_local1 == Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return true
		end
		local f26_local2 = {}
		local f26_local3 = LobbyData.GetCurrentMenuTarget()
		if f26_local3.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			for f26_local7, f26_local8 in ipairs( f26_local0.sessionClients ) do
				Lobby.TeamSelection.AddAsIndividualToPrivateLobbyList( f26_local8, f26_local7, f26_local2 )
			end
		else
			for f26_local7, f26_local8 in ipairs( f26_local0.sessionClients ) do
				Lobby.TeamSelection.AddToPrivateLobbyList( f26_local8, f26_local7, f26_local2 )
			end
		end
		local f26_local5 = Lobby.TeamSelection.VladSplit( f26_local2, Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME ) )
		if f26_arg1 then
			LuaUtils.LogQoS( "teamsplit/input", f26_local2 )
			LuaUtils.LogQoS( "teamsplit/output", f26_local5 )
		end
		if f26_arg1 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.AutoSplitTeam start\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "gamelobby data:\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
			for f26_local9, f26_local10 in ipairs( f26_local0.sessionClients ) do
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( f26_local9 ) .. ") " .. f26_local10.gamertag .. " - lobbyID(" .. tostring( f26_local10.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f26_local10.simpleLobbyID ) .. " -- skill: " .. tostring( f26_local10.skillRating ) .. "\n" )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
		end
		if f26_arg1 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Team Assignment:\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
		end
		for f26_local9, f26_local10 in ipairs( f26_local5.teams[1] ) do
			local f26_local15 = Enum.team_t.TEAM_ALLIES
			for f26_local11, f26_local12 in ipairs( f26_local10.memberList ) do
				local f26_local14 = f26_local0.sessionClients[f26_local12.index]
				if f26_arg1 then
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( f26_local9 ) .. ") " .. f26_local14.gamertag .. " - lobbyID(" .. tostring( f26_local14.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f26_local14.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( f26_local15 ) .. " -- lobbySkill: " .. tostring( f26_local10.lobbySkill ) .. " -- skill: " .. tostring( f26_local14.skillRating ) .. "\n" )
				end
				Engine.LobbyHostAssignTeamToClient( f26_local14.xuid, f26_local15 )
			end
		end
		for f26_local9, f26_local10 in ipairs( f26_local5.teams[2] ) do
			local f26_local15 = Enum.team_t.TEAM_AXIS
			for f26_local11, f26_local12 in ipairs( f26_local10.memberList ) do
				local f26_local14 = f26_local0.sessionClients[f26_local12.index]
				if f26_arg1 then
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( f26_local9 ) .. ") " .. f26_local14.gamertag .. " - lobbyID(" .. tostring( f26_local14.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f26_local14.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( f26_local15 ) .. " -- lobbySkill: " .. tostring( f26_local10.lobbySkill ) .. " -- skill: " .. tostring( f26_local14.skillRating ) .. "\n" )
				end
				Engine.LobbyHostAssignTeamToClient( f26_local14.xuid, f26_local15 )
			end
		end
		if f26_arg1 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.AutoSplitTeam end\n" )
		end
		if f26_arg0 == true and f26_local5.isBalanced == false then
			if f26_arg1 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Could not create balanced teams.\n" )
			end
			return false
		else
			return true
		end
	end
end

Lobby.TeamSelection.CanFitMaxPartySize = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = f27_arg0.probedXuid
	if f27_local0 == nil or f27_local0 == LuaEnums.INVALID_XUID then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	end
	local f27_local1 = nil
	for f27_local5, f27_local6 in ipairs( f27_arg1.sessionClients ) do
		if f27_local6.xuid == f27_local0 then
			f27_local1 = f27_local6.lobbyID
			break
		end
	end
	if f27_local1 == nil then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	elseif not Engine.LobbyGetReservationData then
		f27_local2 = 0
		for f27_local6, f27_local7 in ipairs( f27_arg1.sessionClients ) do
			if f27_local7.lobbyID == lobbyID then
				f27_local2 = f27_local2 + 1
			end
		end
		if f27_arg2 < f27_local2 + #f27_arg0.members then
			return Enum.JoinResult.JOIN_RESULT_NO_PARTIES
		end
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "^5 #gamelobby.sessionClients: " .. tostring( #f27_arg1.sessionClients ) .. ".\n" )
		f27_local2 = Engine.milliseconds() + Dvar.lobbyProbedXuidOverride:get()
		f27_local3 = 0
		for f27_local7, f27_local8 in ipairs( f27_arg1.sessionClients ) do
			if f27_local8.probedXuid ~= LuaEnums.INVALID_XUID and f27_local8.probedXuidTimestamp < f27_local2 and f27_local8.probedXuid == f27_local0 then
				f27_local3 = f27_local3 + 1
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "^6 probedXuid client.xuid: " .. tostring( f27_local8.xuid ) .. "\n" )
			end
			if f27_local8.lobbyID == f27_local1 then
				f27_local3 = f27_local3 + 1
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "^6 in lobby client.xuid: " .. tostring( f27_local8.xuid ) .. "\n" )
			end
		end
		f27_local4 = Engine.LobbyGetReservationData()
		f27_local5 = 0
		if f27_local4.count > 0 then
			for f27_local9, f27_local10 in ipairs( f27_local4.status ) do
				if f27_local10.probedXuid == f27_local0 then
					f27_local5 = f27_local5 + 1
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "^6 in reserve client.xuid: " .. tostring( f27_local10.xuid ) .. "\n" )
				end
			end
		end
		if f27_arg2 < f27_local5 + f27_local3 + #f27_arg0.members then
			return Enum.JoinResult.JOIN_RESULT_NO_PARTIES
		end
	end
	return Enum.JoinResult.JOIN_RESULT_SUCCESS
end

Lobby.TeamSelection.OnCanFitLobbys = function ( f28_arg0 )
	local f28_local0 = f28_arg0.lobbyHostXuid
	LuaUtils.LogQoS( "can_fit/input", f28_arg0 )
	local f28_local1 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f28_local2 = Engine.GetPlaylistMaxPartySize( Engine.GetPlaylistID() )
	local f28_local3 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	if f28_local0 ~= nil and f28_local0 ~= LuaEnums.INVALID_XUID and f28_local0 == Engine.GetLobbyHostXuid( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	elseif Engine.IsMultiplayerGame() then
		local f28_local4 = Lobby.TeamSelection.CanFitMaxPartySize( f28_arg0, f28_local3, f28_local2 )
		if f28_local4 ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
			return f28_local4
		end
	end
	if CoDShared.IsTeamBasedGame() == false or Engine.IsZombiesGame() or Engine.IsCampaignGame() then
		if Dvar.tu2_skipMaxClientCheck:get() == 0 then
			local f28_local4 = 0
			for f28_local8, f28_local9 in ipairs( f28_arg0.lobbys ) do
				f28_local4 = f28_local4 + f28_local9
			end
			f28_local5 = #f28_local3.sessionClients + f28_local4
			f28_local6 = LobbyData.GetCurrentMenuTarget()
			if f28_local6.maxClients < f28_local5 then
				return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
			elseif f28_local1 < f28_local5 then
				return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
			end
		end
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	end
	local f28_local4 = {}
	if Engine.IsInGame() then
		local f28_local5 = {}
		for f28_local9, f28_local10 in ipairs( f28_arg0.lobbys ) do
			table.insert( f28_local5, f28_local10 )
		end
		f28_local6 = Lobby.TeamSelection.CanSplitInProgress( f28_local3.sessionClients, f28_local5, f28_local1, true )
		LuaUtils.LogQoS( "can_fit/result", f28_local6 )
		if f28_local6 then
			return Enum.JoinResult.JOIN_RESULT_SUCCESS
		end
		return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
	end
	for f28_local8, f28_local9 in ipairs( f28_local3.sessionClients ) do
		Lobby.TeamSelection.AddToPrivateLobbyList( f28_local9, f28_local8, f28_local4 )
	end
	for f28_local8, f28_local9 in ipairs( f28_arg0.lobbys ) do
		Lobby.TeamSelection.AddDummyToPrivateLobbyList( f28_local9, f28_local4 )
	end
	if f28_arg0.members ~= nil and #f28_arg0.members > Dvar.lobbyAdvertiseTeamSizeMax:get() then
		LuaUtils.LogQoS( "can_fit/result", false )
		return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
	end
	f28_local5 = Lobby.TeamSelection.VladSplit( f28_local4, f28_local1 )
	f28_local6 = false
	if f28_local5.isBalanced then
		f28_local6 = true
	elseif f28_local5.canBalance then
		f28_local6 = true
	end
	LuaUtils.LogQoS( "can_fit/result", f28_local6 )
	if f28_local6 then
		return Enum.JoinResult.JOIN_RESULT_SUCCESS
	end
	return Enum.JoinResult.JOIN_RESULT_LOBBY_FULL
end

Lobby.TeamSelection.ClientJoined = function ( f29_arg0 )
	if not Lobby.TeamSelection.ShouldAssignToTeam( f29_arg0 ) then
		return 
	end
	local f29_local0 = f29_arg0.xuid
	local f29_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	if f29_local1 == nil then
		return 
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined start.\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby List\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	for f29_local5, f29_local6 in ipairs( f29_local1.sessionClients ) do
		if f29_local0 ~= f29_local6.xuid then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( f29_local5 ) .. ") " .. f29_local6.gamertag .. " - lobbyID(" .. tostring( f29_local6.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f29_local6.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( f29_local6.team ) .. " -- score: " .. tostring( f29_local6.score ) .. ".\n" )
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	f29_local2 = nil
	for f29_local6, f29_local7 in ipairs( f29_local1.sessionClients ) do
		if f29_local0 == f29_local7.xuid then
			f29_local2 = f29_local7
			break
		end
	end
	if f29_local2 == nil then
		return 
	elseif f29_arg0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		if Engine.GetGametypeSetting( "teamAssignment" ) ~= LuaEnums.TEAM_ASSIGNMENT.AUTO then
			if f29_local2.team == Enum.team_t.TEAM_FREE and CoDShared.IsGametypeTeamBased() then
				Engine.LobbyHostAssignTeamToClient( f29_local0, Enum.team_t.TEAM_ALLIES )
			end
			return 
		elseif Engine.GetLobbyPregameState() ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE == true then
			f29_local6 = Engine.GetTeams()
			f29_local7 = {}
			for f29_local11, f29_local12 in pairs( f29_local6.clientTeams ) do
				if not f29_local7[f29_local12.team] then
					f29_local7[f29_local12.team] = {}
				end
			end
			f29_local8 = 0
			if f29_local7[Enum.team_t.TEAM_ALLIES] then
				f29_local8 = #f29_local7[Enum.team_t.TEAM_ALLIES]
			end
			f29_local9 = 0
			if f29_local7[Enum.team_t.TEAM_AXIS] then
				f29_local9 = #f29_local7[Enum.team_t.TEAM_AXIS]
			end
			if f29_local8 == f29_local9 then
				if math.random( 0, 1 ) == 1 then
					Engine.LobbyHostAssignTeamToClient( f29_local0, Enum.team_t.TEAM_ALLIES )
				else
					Engine.LobbyHostAssignTeamToClient( f29_local0, Enum.team_t.TEAM_AXIS )
				end
			elseif f29_local9 < f29_local8 then
				Engine.LobbyHostAssignTeamToClient( f29_local0, Enum.team_t.TEAM_AXIS )
			else
				Engine.LobbyHostAssignTeamToClient( f29_local0, Enum.team_t.TEAM_ALLIES )
			end
			table.insert( f29_local7[f29_local12.team], f29_local12 )
		end
	end
	for f29_local6, f29_local7 in ipairs( f29_local1.sessionClients ) do
		if f29_local2.xuid ~= f29_local7.xuid and f29_local2.lobbyID == f29_local7.lobbyID then
			Engine.LobbyHostAssignTeamToClient( f29_local2.xuid, f29_local7.team )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Joining client is part of a party.\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. f29_local2.gamertag .. " - lobbyID(" .. tostring( f29_local2.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f29_local2.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( f29_local7.team ) .. " -- score: " .. tostring( f29_local7.score ) .. ".\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined end.\n" )
			return 
		end
	end
	f29_local3 = 0
	f29_local4 = 0
	f29_local5 = Enum.team_t.TEAM_FREE
	if CoDShared.IsGametypeTeamBased() then
		for f29_local9, f29_local10 in ipairs( f29_local1.sessionClients ) do
			if f29_local2.xuid ~= f29_local10.xuid then
				if f29_local10.team == Enum.team_t.TEAM_ALLIES then
					f29_local3 = f29_local3 + 1
				end
				if f29_local10.team == Enum.team_t.TEAM_AXIS then
					f29_local4 = f29_local4 + 1
				end
			end
		end
		f29_local5 = Enum.team_t.TEAM_ALLIES
		if f29_local4 < f29_local3 then
			f29_local5 = Enum.team_t.TEAM_AXIS
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Clients in session: " .. #f29_local1.sessionClients .. ", teamAlliesCount: " .. f29_local3 .. ", teamAxisCount:" .. f29_local4 .. ".\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. f29_local2.gamertag .. " - lobbyID(" .. tostring( f29_local2.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f29_local2.simpleLobbyID ) .. " -- team: " .. tostring( f29_local5 ) .. ".\n" )
	Engine.LobbyHostAssignTeamToClient( f29_local2.xuid, f29_local5 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined end.\n" )
end

Lobby.TeamSelection.GametypeSettingsChange = function ()
	local f30_local0 = CoDShared.IsGametypeTeamBased()
	local f30_local1 = Engine.GetGametypeSetting( "allowspectating" ) == 1
	local f30_local2 = Engine.GetGametypeSetting( "teamAssignment" )
	local f30_local3 = f30_local0 ~= Lobby.TeamSelection.gameSetting.teamBased
	local f30_local4 = f30_local1 ~= Lobby.TeamSelection.gameSetting.allowSpectating
	local f30_local5 = f30_local2 ~= Lobby.TeamSelection.gameSetting.teamAssignment
	if f30_local3 == false and f30_local4 == false and f30_local5 == false then
		return 
	end
	Engine.LuiVM_Event( "update_team_selection_buttons", {} )
	if f30_local3 and f30_local0 == false then
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_ALLIES )
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_AXIS )
	end
	if f30_local4 and f30_local1 == false then
		if f30_local2 == LuaEnums.TEAM_ASSIGNMENT.AUTO then
			Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_SPECTATOR )
		else
			local f30_local6 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			for f30_local10, f30_local11 in ipairs( f30_local6.sessionClients ) do
				if f30_local11.team == Enum.team_t.TEAM_SPECTATOR then
					Engine.LobbyHostAssignTeamToClient( f30_local11.xuid, Enum.team_t.TEAM_ALLIES )
				end
			end
		end
	end
	if f30_local5 and f30_local0 == true then
		local f30_local6 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		if f30_local2 == LuaEnums.TEAM_ASSIGNMENT.AUTO then
			for f30_local10, f30_local11 in ipairs( f30_local6.sessionClients ) do
				if f30_local11.team ~= Enum.team_t.TEAM_SPECTATOR then
					Engine.LobbyHostAssignTeamToClient( f30_local11.xuid, Enum.team_t.TEAM_FREE )
				end
			end
		else
			for f30_local10, f30_local11 in ipairs( f30_local6.sessionClients ) do
				if f30_local11.team == Enum.team_t.TEAM_FREE then
					Engine.LobbyHostAssignTeamToClient( f30_local11.xuid, Enum.team_t.TEAM_ALLIES )
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
	for f32_local0 = 1, LuaEnums.MAX_CLIENTS, 1 do
		Lobby.TeamSelection.Clients[f32_local0] = {
			team = Enum.team_t.TEAM_FREE,
			switchTeam = Enum.team_t.TEAM_FREE,
			switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
		}
	end
end

Lobby.TeamSelection.Init = function ()
	Lobby.TeamSelection.Clear()
end

function TeamSelectionTest()
	local f34_local0 = {}
	local f34_local1 = function ( f35_arg0, f35_arg1 )
		local f35_local0 = {}
		for f35_local1 = 1, f35_arg0, 1 do
			f35_local0[f35_local1] = 0
		end
		table.insert( f34_local0, {
			lobbySkill = f35_arg1,
			memberList = f35_local0
		} )
	end
	
	f34_local1( 1, 1 )
	f34_local1( 1, 0.5 )
	f34_local1( 1, 0.5 )
	f34_local1( 1, 0.2 )
	f34_local1( 1, -0.2 )
	f34_local1( 1, 0.1 )
	f34_local1( 1, 1.1 )
	f34_local1( 2, 2 )
	f34_local1( 3, 1 )
	local f34_local2 = Lobby.TeamSelection.VladSplit( f34_local0, 12 )
end

