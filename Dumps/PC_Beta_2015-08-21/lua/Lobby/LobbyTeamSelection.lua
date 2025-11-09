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

Lobby.TeamSelection.IsGametypeTeamBased = function ()
	local f2_local0 = Engine.StructTableLookupString( Lobby.TeamSelection.gametypesStructTable, "name", Dvar.ui_gametype:get(), "is_team_based" )
	if f2_local0 == nil then
		return false
	elseif Engine.ToUpper( f2_local0 ) == "NO" then
		return false
	else
		return true
	end
end

Lobby.TeamSelection.ShouldAssignToTeam = function ( f3_arg0 )
	local f3_local0 = f3_arg0.lobbyModule
	local f3_local1 = f3_arg0.lobbyType
	local f3_local2 = f3_arg0.lobbyMode
	local f3_local3 = LobbyData.GetCurrentMenuTarget()
	if f3_local3.mainMode ~= Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return 
	elseif f3_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f3_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		if f3_local2 == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			if Engine.GameLobbyGetGameType() == Lobby.TeamSelection.GAMETYPE_FFA then
				return false
			else
				return true
			end
		elseif f3_local2 == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			if Lobby.Timer.GetTimerStatus() == Lobby.Timer.LOBBY_STATUS.STARTING then
				return true
			elseif Engine.IsInGame() then
				return true
			end
		end
	end
	return false
end

Lobby.TeamSelection.ClearTeam = function ( f4_arg0 )
	Engine.ClearTeamData( f4_arg0 )
	for f4_local0 = 1, LuaEnums.MAX_CLIENTS, 1 do
		if Lobby.TeamSelection.Clients[f4_local0].team == f4_arg0 or Lobby.TeamSelection.Clients[f4_local0].switchTeam == f4_arg0 then
			Lobby.TeamSelection.Clients[f4_local0] = {
				team = Enum.team_t.TEAM_FREE,
				switchTeam = Enum.team_t.TEAM_FREE,
				switchTeamTime = Lobby.TeamSelection.DONT_SWITCH
			}
		end
	end
end

Lobby.TeamSelection.StoreGamesetting = function ()
	Lobby.TeamSelection.gameSetting.teamBased = Lobby.TeamSelection.IsGametypeTeamBased()
	Lobby.TeamSelection.gameSetting.allowSpectating = Engine.GetGametypeSetting( "allowspectating" ) == 1
	Lobby.TeamSelection.gameSetting.teamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
end

Lobby.TeamSelection.OnSessionStart = function ( f6_arg0 )
	local f6_local0 = f6_arg0.lobbyModule
	local f6_local1 = f6_arg0.lobbyType
	if f6_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f6_arg0.lobbyMode == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.StoreGamesetting()
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnSessionEnd = function ( f7_arg0 )
	local f7_local0 = f7_arg0.lobbyModule
	local f7_local1 = f7_arg0.lobbyType
	local f7_local2 = f7_arg0.lobbyMode
	if f7_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.Clear()
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnClientAdded = function ( f8_arg0 )
	local f8_local0 = f8_arg0.lobbyModule
	local f8_local1 = f8_arg0.lobbyType
	local f8_local2 = f8_arg0.lobbyMode
	local f8_local3 = f8_arg0.xuid
	if f8_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST and f8_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.ClientJoined( f8_arg0 )
	end
end

Lobby.TeamSelection.OnMatchEnd = function ( f9_arg0 )
	local f9_local0 = f9_arg0.lobbyModule
	local f9_local1 = f9_arg0.lobbyType
	local f9_local2 = f9_arg0.lobbyMode
	if f9_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST then
		if f9_local2 == Enum.LobbyMode.LOBBY_MODE_CUSTOM and Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
			Lobby.TeamSelection.Clear()
		elseif f9_local2 == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			Lobby.TeamSelection.Clear()
		end
	end
	Lobby.TeamSelection.random = math.random()
end

Lobby.TeamSelection.OnGametypeSettingsChange = function ( f10_arg0 )
	local f10_local0 = f10_arg0.lobbyModule
	local f10_local1 = f10_arg0.lobbyType
	local f10_local2 = f10_arg0.lobbyMode
	if f10_local0 ~= Enum.LobbyModule.LOBBY_MODULE_HOST and f10_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Lobby.TeamSelection.GametypeSettingsChange()
	end
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
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		if Engine.GameLobbyGetGameType() == Lobby.TeamSelection.GAMETYPE_FFA or Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
			Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_ONLY
		else
			Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_ALLOWED
		end
	else
		Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_NOT_ALLOWED
	end
	local f11_local5 = 0
	local f11_local6 = 1
	for f11_local7 = 1, #Lobby.TeamSelection.availableTeams, 1 do
		if f11_local4.switchTeam == Lobby.TeamSelection.availableTeams[f11_local7] then
			f11_local5 = f11_local7
			break
		end
	end
	if f11_local1 == 0 then
		if f11_local5 <= 1 then
			f11_local6 = #Lobby.TeamSelection.availableTeams
		else
			f11_local6 = f11_local5 - 1
		end
	elseif f11_local5 >= #Lobby.TeamSelection.availableTeams then
		f11_local6 = 1
	else
		f11_local6 = f11_local5 + 1
	end
	f11_local4.switchTeamType = LuaEnums.TEAM_ASSIGNMENT.CLIENT
	f11_local4.controller = f11_local0
	f11_local4.xuid = f11_local2
	f11_local4.switchTeam = Lobby.TeamSelection.availableTeams[f11_local6]
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
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		if Engine.GameLobbyGetGameType() == Lobby.TeamSelection.GAMETYPE_FFA then
			Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_ONLY
		else
			Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_ALLOWED
		end
	else
		Lobby.TeamSelection.availableTeams = Lobby.TeamSelection.SPECTATOR_NOT_ALLOWED
	end
	local f12_local5 = 0
	local f12_local6 = 1
	for f12_local7 = 1, #Lobby.TeamSelection.availableTeams, 1 do
		if f12_local4.switchTeam == Lobby.TeamSelection.availableTeams[f12_local7] then
			f12_local5 = f12_local7
			break
		end
	end
	if f12_local1 == 0 then
		if f12_local5 <= 1 then
			f12_local6 = #Lobby.TeamSelection.availableTeams
		else
			f12_local6 = f12_local5 - 1
		end
	elseif f12_local5 >= #Lobby.TeamSelection.availableTeams then
		f12_local6 = 1
	else
		f12_local6 = f12_local5 + 1
	end
	f12_local4.switchTeamType = LuaEnums.TEAM_ASSIGNMENT.HOST
	f12_local4.controller = f12_local0
	f12_local4.xuid = f12_local2
	f12_local4.switchTeam = Lobby.TeamSelection.availableTeams[f12_local6]
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
	for f14_local0 = 1, LuaEnums.MAX_CLIENTS, 1 do
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
	for f15_local1 = 1, LuaEnums.MAX_CLIENTS, 1 do
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
			f16_local4.lobbySkill = f16_local4.lobbySkill + f16_arg0.skillRating
			table.insert( f16_local4.memberList, {
				index = f16_arg1,
				xuid = f16_arg0.xuid,
				skill = f16_arg0.skillRating
			} )
			return 
		end
	end
	f16_local0 = {
		lobbyID = f16_arg0.lobbyID,
		lobbySkill = f16_arg0.skillRating,
		memberList = {}
	}
	table.insert( f16_local0.memberList, {
		index = f16_arg1,
		xuid = f16_arg0.xuid,
		skill = f16_arg0.skillRating
	} )
	table.insert( f16_arg2, f16_local0 )
end

Lobby.TeamSelection.AddDummyToPrivateLobbyList = function ( f17_arg0, f17_arg1 )
	local f17_local0 = {
		lobbyID = -1,
		lobbySkill = 0,
		memberList = {}
	}
	for f17_local1 = 1, f17_arg0, 1 do
		local f17_local4 = f17_local1
		table.insert( f17_local0.memberList, {
			index = -1,
			xuid = 0,
			skill = 0
		} )
	end
	table.insert( f17_arg1, f17_local0 )
end

Lobby.TeamSelection.VladSplit = function ( f18_arg0, f18_arg1 )
	local f18_local0 = 0
	local f18_local1 = function ( f19_arg0 )
		local f19_local0 = {
			1,
			2,
			2,
			1
		}
		local f19_local1 = 1
		local f19_local2 = {}
		for f19_local3 = 1, f18_local0, 1 do
			f19_local2[f19_local3] = f19_local0[f19_local1]
			f19_local1 = f19_local1 + 1
			if #f19_local0 < f19_local1 then
				f19_local1 = 1
			end
		end
		return f19_local2
	end
	
	local f18_local2 = function ( f20_arg0, f20_arg1 )
		return f20_arg1.lobbySkill < f20_arg0.lobbySkill
	end
	
	local f18_local3 = function ( f21_arg0, f21_arg1 )
		if #f21_arg0.memberList == #f21_arg1.memberList then
			return f18_local2( f21_arg0, f21_arg1 )
		else
			return #f21_arg1.memberList < #f21_arg0.memberList
		end
	end
	
	local f18_local4 = function ( f22_arg0, f22_arg1 )
		local f22_local0 = 0
		local f22_local1 = 0
		local f22_local2 = {}
		local f22_local3 = {}
		for f22_local7, f22_local8 in ipairs( f22_arg0 ) do
			f22_local0 = f22_local0 + f22_local8.lobbySkill
			if #f22_local8.memberList == 1 then
				table.insert( f22_local2, f22_local7 )
			end
		end
		for f22_local7, f22_local8 in ipairs( f22_arg1 ) do
			f22_local1 = f22_local1 + f22_local8.lobbySkill
			if #f22_local8.memberList == 1 then
				table.insert( f22_local3, f22_local7 )
			end
		end
		f22_local4 = f22_local0 - f22_local1
		f22_local5 = f22_local4
		f22_local6 = {}
		for f22_local13, f22_local14 in ipairs( f22_local2 ) do
			for f22_local10, f22_local11 in ipairs( f22_local3 ) do
				delta1 = f22_local4 - 2 * (f22_arg0[f22_local14].lobbySkill - f22_arg1[f22_local11].lobbySkill)
				if math.abs( f22_local5 ) > math.abs( delta1 ) then
					f22_local5 = delta1
					f22_local6 = {
						f22_local14,
						f22_local11
					}
				end
			end
		end
		if math.abs( f22_local5 ) < math.abs( f22_local4 ) then
			f22_local7 = table.remove( f22_arg0, f22_local6[1] )
			table.insert( f22_arg0, table.remove( f22_arg1, f22_local6[2] ) )
			table.insert( f22_arg1, f22_local7 )
			return true
		else
			return false
		end
	end
	
	for f18_local8, f18_local9 in ipairs( f18_arg0 ) do
		f18_local0 = f18_local0 + #f18_local9.memberList
	end
	for f18_local5 = 1, 2, 1 do
		f18_local9 = f18_local1( f18_local0 )
		if f18_local5 == 1 then
			table.sort( f18_arg0, f18_local2 )
		else
			table.sort( f18_arg0, f18_local3 )
		end
		local f18_local10 = 1
		local f18_local11 = {}
		local f18_local12 = {}
		local f18_local13 = 0
		local f18_local14 = 0
		for f18_local24, f18_local25 in ipairs( f18_arg0 ) do
			while f18_local9[f18_local10] == 0 do
				f18_local10 = f18_local10 + 1
			end
			local f18_local18 = f18_local9[f18_local10]
			if f18_local18 == 1 then
				table.insert( f18_local11, f18_local25 )
				f18_local13 = f18_local13 + #f18_local25.memberList
			else
				table.insert( f18_local12, f18_local25 )
				f18_local14 = f18_local14 + #f18_local25.memberList
			end
			local f18_local19 = f18_local10
			for f18_local20 = 0, #f18_local25.memberList - 1, 1 do
				local f18_local23 = f18_local20
			end
			local f18_local23 = f18_local20
		end
		f18_local15 = math.abs( f18_local13 - f18_local14 )
		if f18_arg1 < f18_local13 + f18_local14 then
			return {
				isBalanced = false,
				canBalance = false,
				teams = {
					f18_local11,
					f18_local12
				},
				counts = {
					f18_local13,
					f18_local14
				}
			}
		elseif f18_local15 <= 1 then
			f18_local4( f18_local11, f18_local12 )
			if Lobby.TeamSelection.random > 0.5 then
				return {
					isBalanced = true,
					canBalance = true,
					teams = {
						f18_local11,
						f18_local12
					},
					counts = {
						f18_local13,
						f18_local14
					}
				}
			else
				return {
					isBalanced = true,
					canBalance = true,
					teams = {
						f18_local12,
						f18_local11
					},
					counts = {
						f18_local14,
						f18_local13
					}
				}
			end
		elseif f18_local5 == 2 then
			return {
				isBalanced = false,
				canBalance = f18_local15 <= f18_arg1 - f18_local13 - f18_local14,
				teams = {
					f18_local11,
					f18_local12
				},
				counts = {
					f18_local13,
					f18_local14
				}
			}
		end
	end
end

Lobby.TeamSelection.AutoSplitTeam = function ( f23_arg0, f23_arg1 )
	local f23_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local1 = 0
	for f23_local2 = #f23_local0.sessionClients, 1, -1 do
		if f23_local0.sessionClients[f23_local2].team == Enum.team_t.TEAM_SPECTATOR then
			table.remove( f23_local0.sessionClients, f23_local2 )
			f23_local1 = f23_local1 + 1
		end
	end
	if f23_local1 == Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return true
	end
	local f23_local2 = {}
	for f23_local6, f23_local7 in ipairs( f23_local0.sessionClients ) do
		Lobby.TeamSelection.AddToPrivateLobbyList( f23_local7, f23_local6, f23_local2 )
	end
	f23_local4 = Lobby.TeamSelection.VladSplit( f23_local2, Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME ) )
	if f23_arg1 then
		LuaUtils.LogQoS( "teamsplit/input", f23_local2 )
		LuaUtils.LogQoS( "teamsplit/output", f23_local4 )
	end
	if f23_arg1 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.AutoSplitTeam start\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "gamelobby data:\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
		for f23_local8, f23_local9 in ipairs( f23_local0.sessionClients ) do
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( f23_local8 ) .. ") " .. f23_local9.gamertag .. " - lobbyID(" .. tostring( f23_local9.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f23_local9.simpleLobbyID ) .. " -- skill: " .. tostring( f23_local9.skillRating ) .. "\n" )
		end
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	end
	if f23_arg0 == true and f23_local4.isBalanced == false then
		if f23_arg1 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Could not create balanced teams.\n" )
		end
		return false
	elseif f23_arg1 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Team Assignment:\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	end
	for f23_local8, f23_local9 in ipairs( f23_local4.teams[1] ) do
		local f23_local14 = Enum.team_t.TEAM_ALLIES
		for f23_local10, f23_local11 in ipairs( f23_local9.memberList ) do
			local f23_local13 = f23_local0.sessionClients[f23_local11.index]
			if f23_arg1 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( f23_local8 ) .. ") " .. f23_local13.gamertag .. " - lobbyID(" .. tostring( f23_local13.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f23_local13.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( f23_local14 ) .. " -- lobbySkill: " .. tostring( f23_local9.lobbySkill ) .. " -- skill: " .. tostring( f23_local13.skillRating ) .. "\n" )
			end
			Engine.LobbyHostAssignTeamToClient( f23_local13.xuid, f23_local14 )
		end
	end
	for f23_local8, f23_local9 in ipairs( f23_local4.teams[2] ) do
		local f23_local14 = Enum.team_t.TEAM_AXIS
		for f23_local10, f23_local11 in ipairs( f23_local9.memberList ) do
			local f23_local13 = f23_local0.sessionClients[f23_local11.index]
			if f23_arg1 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( f23_local8 ) .. ") " .. f23_local13.gamertag .. " - lobbyID(" .. tostring( f23_local13.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f23_local13.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( f23_local14 ) .. " -- lobbySkill: " .. tostring( f23_local9.lobbySkill ) .. " -- skill: " .. tostring( f23_local13.skillRating ) .. "\n" )
			end
			Engine.LobbyHostAssignTeamToClient( f23_local13.xuid, f23_local14 )
		end
	end
	if f23_arg1 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.AutoSplitTeam end\n" )
	end
	return true
end

Lobby.TeamSelection.CanFitLobbys = function ( f24_arg0 )
	local f24_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f24_local1 = {}
	if #f24_local0.sessionClients == 0 then
		return true
	end
	for f24_local5, f24_local6 in ipairs( f24_local0.sessionClients ) do
		Lobby.TeamSelection.AddToPrivateLobbyList( f24_local6, f24_local5, f24_local1 )
	end
	for f24_local5, f24_local6 in ipairs( f24_arg0.lobbys ) do
		Lobby.TeamSelection.AddDummyToPrivateLobbyList( f24_local6, f24_local1 )
	end
	f24_local3 = Lobby.TeamSelection.VladSplit( f24_local1, Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME ) )
	if f24_local3.isBalanced then
		return true
	elseif f24_local3.canBalance and not Engine.IsInGame() then
		return true
	end
	return false
end

Lobby.TeamSelection.ClientJoined = function ( f25_arg0 )
	if not Lobby.TeamSelection.ShouldAssignToTeam( f25_arg0 ) then
		return 
	end
	local f25_local0 = f25_arg0.xuid
	local f25_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	if f25_local1 == nil then
		return 
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined start.\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby List\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	for f25_local5, f25_local6 in ipairs( f25_local1.sessionClients ) do
		if f25_local0 ~= f25_local6.xuid then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "(" .. tostring( f25_local5 ) .. ") " .. f25_local6.gamertag .. " - lobbyID(" .. tostring( f25_local6.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f25_local6.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( f25_local6.team ) .. " -- score: " .. tostring( f25_local6.score ) .. ".\n" )
		end
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------\n" )
	f25_local2 = nil
	for f25_local6, f25_local7 in ipairs( f25_local1.sessionClients ) do
		if f25_local0 == f25_local7.xuid then
			f25_local2 = f25_local7
			break
		end
	end
	if f25_local2 == nil then
		return 
	end
	for f25_local6, f25_local7 in ipairs( f25_local1.sessionClients ) do
		if f25_local2.xuid ~= f25_local7.xuid and f25_local2.lobbyID == f25_local7.lobbyID then
			Engine.LobbyHostAssignTeamToClient( f25_local2.xuid, f25_local7.team )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Joining client is part of a party.\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. f25_local2.gamertag .. " - lobbyID(" .. tostring( f25_local2.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f25_local2.simpleLobbyID ) .. " -- team: " .. Lobby.TeamSelection.TeamIdToString( f25_local7.team ) .. " -- score: " .. tostring( f25_local7.score ) .. ".\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined end.\n" )
			return 
		end
	end
	f25_local3 = 0
	f25_local4 = 0
	for f25_local8, f25_local9 in ipairs( f25_local1.sessionClients ) do
		if f25_local2.xuid ~= f25_local9.xuid then
			if f25_local9.team == Enum.team_t.TEAM_ALLIES then
				f25_local3 = f25_local3 + 1
			end
			if f25_local9.team == Enum.team_t.TEAM_AXIS then
				f25_local4 = f25_local4 + 1
			end
		end
	end
	f25_local5 = Enum.team_t.TEAM_ALLIES
	if f25_local4 < f25_local3 then
		f25_local5 = Enum.team_t.TEAM_AXIS
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Clients in session: " .. #f25_local1.sessionClients .. ", teamAlliesCount: " .. f25_local3 .. ", teamAxisCount:" .. f25_local4 .. ".\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Adding joining client " .. f25_local2.gamertag .. " - lobbyID(" .. tostring( f25_local2.lobbyID ) .. ") -- simpleLobbyID: " .. tostring( f25_local2.simpleLobbyID ) .. " -- team: " .. tostring( f25_local5 ) .. ".\n" )
	Engine.LobbyHostAssignTeamToClient( f25_local2.xuid, f25_local5 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.TeamSelection.ClientJoined end.\n" )
end

Lobby.TeamSelection.GametypeSettingsChange = function ()
	local f26_local0 = Lobby.TeamSelection.IsGametypeTeamBased()
	local f26_local1 = Engine.GetGametypeSetting( "allowspectating" ) == 1
	local f26_local2 = Engine.GetGametypeSetting( "teamAssignment" )
	local f26_local3 = Lobby.TeamSelection.gameSetting.teamBased ~= f26_local0
	local f26_local4 = Lobby.TeamSelection.gameSetting.allowSpectating ~= f26_local1
	local f26_local5 = Lobby.TeamSelection.gameSetting.teamAssignment ~= f26_local2
	if f26_local3 == false and f26_local4 == false and f26_local5 == false then
		return 
	end
	Engine.LuiVM_Event( "update_team_selection_buttons", {} )
	if f26_local3 and f26_local0 == false then
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_ALLIES )
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_AXIS )
	end
	if f26_local4 and f26_local1 == false then
		Lobby.TeamSelection.ClearTeam( Enum.team_t.TEAM_SPECTATOR )
	end
	if f26_local5 and f26_local0 == true then
		local f26_local6 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		if f26_local2 == LuaEnums.TEAM_ASSIGNMENT.AUTO then
			for f26_local10, f26_local11 in ipairs( f26_local6.sessionClients ) do
				if f26_local11.team ~= Enum.team_t.TEAM_SPECTATOR then
					Engine.LobbyHostAssignTeamToClient( f26_local11.xuid, Enum.team_t.TEAM_FREE )
				end
			end
		else
			for f26_local10, f26_local11 in ipairs( f26_local6.sessionClients ) do
				if f26_local11.team == Enum.team_t.TEAM_FREE then
					Engine.LobbyHostAssignTeamToClient( f26_local11.xuid, Enum.team_t.TEAM_ALLIES )
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
	for f28_local0 = 1, LuaEnums.MAX_CLIENTS, 1 do
		Lobby.TeamSelection.Clients[f28_local0] = {
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
	local f30_local0 = {}
	local f30_local1 = function ( f31_arg0, f31_arg1 )
		local f31_local0 = {}
		for f31_local1 = 1, f31_arg0, 1 do
			f31_local0[f31_local1] = 0
		end
		table.insert( f30_local0, {
			lobbySkill = f31_arg1,
			memberList = f31_local0
		} )
	end
	
	f30_local1( 1, 1 )
	f30_local1( 1, 0.5 )
	f30_local1( 1, 0.5 )
	f30_local1( 1, 0.2 )
	f30_local1( 1, -0.2 )
	f30_local1( 1, 0.1 )
	f30_local1( 1, 1.1 )
	f30_local1( 2, 2 )
	f30_local1( 3, 1 )
	local f30_local2 = Lobby.TeamSelection.VladSplit( f30_local0, 12 )
end

Lobby.TeamSelection.Init()
