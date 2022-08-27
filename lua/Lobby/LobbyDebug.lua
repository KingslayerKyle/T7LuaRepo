-- 727536f343c35bb787699def2a8ad400
-- This hash is used for caching, delete to decompile the file again

require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )

Lobby.Debug = {}
Lobby.Debug.COLOR = {
	BLACK = "^0",
	RED = "^1",
	GREEN = "^2",
	YELLOW = "^3",
	BLUE = "^4",
	CYAN = "^5",
	MAGENTA = "^6",
	WHITE = "^7",
	MYTEAM = "^8",
	ENEMYTEAM = "^9"
}
Lobby.Debug.jbEvent = LuaEnums.JB_MATCHMAKING_EVENT.START
if Engine.IsShipBuild() then
	Lobby.Debug.gamertagDebugVisListOrbis = {}
	Lobby.Debug.gamertagDebugVisListDurango = {}
	Lobby.Debug.lobbyValidateListOrbis = {}
	Lobby.Debug.lobbyValidateListDurango = {
		"2 Dev 60168782"
	}
	Lobby.Debug.lobbySQJListOrbis = {}
	Lobby.Debug.lobbySQJListDurango = {}
else
	Lobby.Debug.gamertagDebugVisListOrbis = {}
	Lobby.Debug.gamertagDebugVisListDurango = {}
	Lobby.Debug.lobbyValidateListOrbis = {}
	Lobby.Debug.lobbyValidateListDurango = {}
	Lobby.Debug.lobbySQJListOrbis = {}
	Lobby.Debug.lobbySQJListDurango = {}
end
Lobby.Debug.EnableForPrimaryController = function ( f1_arg0 )
	if Engine.IsDedicatedServer() then
		return false
	end
	local f1_local0 = Engine.GetPrimaryController()
	if f1_local0 == LuaEnums.INVALID_CONTROLLER_PORT or #f1_arg0 == 0 then
		return false
	end
	local f1_local1 = Engine.GetGamertagForController( f1_local0 )
	if f1_local1 == nil or f1_local1 == "" then
		return false
	end
	for f1_local5, f1_local6 in pairs( f1_arg0 ) do
		if f1_local1 == f1_local6 then
			return true
		end
	end
	return false
end

Lobby.Debug.LobbyDebugVisEnable = function ()
	if Engine.GetCurrentPlatform() == "orbis" then
		if not Lobby.Debug.EnableForPrimaryController( Lobby.Debug.gamertagDebugVisListOrbis ) then
			return 
		end
	elseif Engine.GetCurrentPlatform() == "durango" and not Lobby.Debug.EnableForPrimaryController( Lobby.Debug.gamertagDebugVisListDurango ) then
		return 
	end
	Dvar.ui_lobbyDebugVis:set( 1 )
end

Lobby.Debug.validateInfo = {
	Enabled = false,
	LastScreen = 0,
	CheckTime = 0,
	CheckDelay = 3000,
	CheckInterval = 1000
}
Lobby.Debug.LobbyValidateEnable = function ()
	if Engine.GetCurrentPlatform() == "orbis" then
		if not Lobby.Debug.EnableForPrimaryController( Lobby.Debug.lobbyValidateListOrbis ) then
			return 
		end
	elseif Engine.GetCurrentPlatform() == "durango" and not Lobby.Debug.EnableForPrimaryController( Lobby.Debug.lobbyValidateListDurango ) then
		return 
	end
	Lobby.Debug.validateInfo.Enabled = true
end

Lobby.Debug.LobbySQJEnable = function ()
	if Engine.GetCurrentPlatform() == "orbis" then
		if not Lobby.Debug.EnableForPrimaryController( Lobby.Debug.lobbySQJListOrbis ) then
			return 
		end
	elseif Engine.GetCurrentPlatform() == "durango" and not Lobby.Debug.EnableForPrimaryController( Lobby.Debug.lobbySQJListDurango ) then
		return 
	end
	Dvar.ui_lobbyDebugSessionSQJ:set( 1 )
end

Lobby.Debug.LobbyValidate = function ()
	if Engine.IsDedicatedServer() then
		return 
	elseif Lobby.Debug.validateInfo.Enabled == false then
		return 
	elseif not Lobby.ProcessQueue.IsQueueEmpty() then
		return 
	end
	local f5_local0 = Engine.GetLobbyUIScreen()
	if f5_local0 == 0 then
		return 
	elseif f5_local0 ~= Lobby.Debug.validateInfo.LastScreen then
		Lobby.Debug.validateInfo.LastScreen = f5_local0
		Lobby.Debug.validateInfo.CheckTime = Engine.milliseconds() + Lobby.Debug.validateInfo.CheckDelay
	end
	if Engine.milliseconds() < Lobby.Debug.validateInfo.CheckTime then
		return 
	end
	Lobby.Debug.validateInfo.CheckTime = Engine.milliseconds() + Lobby.Debug.validateInfo.CheckInterval
	local f5_local1 = LobbyData:UITargetFromId( f5_local0 )
	if f5_local1 == nil then
		return 
	end
	local f5_local2 = Engine.GetLobbyNetworkMode()
	local f5_local3 = Engine.GetLobbyMainMode()
	local f5_local4 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local5 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f5_local6 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local7 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f5_local8 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local9 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	if f5_local0 ~= LobbyData.UITargets.UI_MAIN.id and f5_local0 ~= LobbyData.UITargets.UI_MODESELECT.id and f5_local1.networkMode ~= f5_local2 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: Network Mode mismatch. uiInfo.networkMode(" .. f5_local1.networkMode .. ") ~= networkMode(" .. f5_local2 .. ").\n" )
	end
	if f5_local1.mainMode ~= f5_local3 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: Main Mode mismatch. uiInfo.mainMode(" .. f5_local1.mainMode .. ") ~= mainMode(" .. f5_local3 .. ").\n" )
	end
	if f5_local1.isPrivate ~= f5_local4 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, string.format( Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: Private active mismatch. uiInfo.isPrivate(%s) ~= privateActive(%s).\n", tostring( f5_local1.isPrivate ), tostring( f5_local4 ) ) )
	end
	if f5_local1.isGame ~= f5_local5 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, string.format( Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: Game active mismatch. uiInfo.isGame(%s) ~= gameActive(%s).\n", tostring( f5_local1.isGame ), tostring( f5_local5 ) ) )
	end
	if f5_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_INVALID then
		if f5_local6 ~= 0 or f5_local7 ~= 0 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_INVALID player count: privateClientCount(" .. f5_local6 .. ") ~= 0 or gameClientCount(" .. f5_local7 .. ") ~= 0.\n" )
		end
	elseif f5_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		if f5_local6 == 0 or f5_local7 ~= 0 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_PRIVATE player count: privateClientCount(" .. f5_local6 .. ") == 0 or gameClientCount(" .. f5_local7 .. ") ~= 0.\n" )
		end
		if f5_local1.maxClients < f5_local8 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_PRIVATE maxClient mismatch. uiInfo.maxClients(" .. f5_local1.maxClients .. ") < privateMaxClients(" .. f5_local8 .. ").\n" )
		end
	elseif f5_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		if f5_local6 == 0 or f5_local7 == 0 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_GAME player count: privateClientCount(" .. f5_local6 .. ") == 0 or gameClientCount(" .. f5_local7 .. ") == 0.\n" )
		end
		if f5_local1.maxClients < f5_local9 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_GAME maxClient mismatch. uiInfo.maxClients(" .. f5_local1.maxClients .. ") < gameMaxClients(" .. f5_local9 .. ").\n" )
		end
	end
end

Lobby.Debug.sessionSQJ = {
	searchStage = 0,
	results = {},
	joinOrder = 0
}
Lobby.Debug.SessionSQJEnabled = function ()
	if Dvar.ui_lobbyDebugSessionSQJ:get() == false then
		return false
	else
		return true
	end
end

Lobby.Debug.SessionSQJClearModels = function ()
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	local f7_local0 = function ( f8_arg0, f8_arg1, f8_arg2 )
		local f8_local0 = Engine.GetModel( f8_arg0, f8_arg1 )
		local f8_local1 = Engine.GetModelValue( f8_local0 )
		Engine.SetModelValue( f8_local0, f8_arg2 )
		return f8_local1
	end
	
	local f7_local1 = Engine.GetModel( Engine.GetGlobalModel(), "debug" )
	if not f7_local1 then
		return 
	end
	local f7_local2 = Engine.GetModel( f7_local1, "sessionSQJ" )
	if not f7_local2 then
		return 
	elseif not Engine.GetModel( f7_local2, "searchStage" ) then
		return 
	end
	local f7_local3 = f7_local0( f7_local2, "searchStage", 0 )
	local f7_local4 = Engine.GetModel( f7_local2, "results" )
	for f7_local5 = 1, f7_local3, 1 do
		local f7_local8 = Engine.GetModel( f7_local4, tostring( f7_local5 ) )
		local f7_local9 = f7_local0( f7_local8, "numResults", 0 )
		if f7_local9 > 0 then
			local f7_local10 = Engine.GetModel( f7_local8, "data" )
			for f7_local11 = 1, f7_local9, 1 do
				local f7_local14 = Engine.GetModel( f7_local10, tostring( f7_local11 ) )
				f7_local0( f7_local14, "xuid", 0 )
				f7_local0( f7_local14, "xuidstr", "" )
				f7_local0( f7_local14, "publicIPAddress", "" )
				f7_local0( f7_local14, "privateIPAddress", "" )
				f7_local0( f7_local14, "natType", "" )
				f7_local0( f7_local14, "ping", "" )
				f7_local0( f7_local14, "status", "" )
			end
		end
	end
end

Lobby.Debug.SessionSQJClear = function ()
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	else
		Lobby.Debug.SessionSQJClearModels()
		Lobby.Debug.sessionSQJ.searchStage = 0
		Lobby.Debug.sessionSQJ.results = {}
		Lobby.Debug.sessionSQJ.joinOrder = 0
		Lobby.Debug.SessionSQJUpdateUIInfo()
	end
end

Lobby.Debug.CreateSetModel = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = Engine.CreateModel( f10_arg0, f10_arg1 )
	Engine.SetModelValue( f10_local0, f10_arg2 )
	return f10_local0
end

Lobby.Debug.SessionSQJRefreshInfo = function ()
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	local f11_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "debug" ), "sessionSQJ" )
	Lobby.Debug.CreateSetModel( f11_local0, "searchStage", Lobby.Debug.sessionSQJ.searchStage )
	local f11_local1 = Engine.CreateModel( f11_local0, "results" )
	for f11_local2 = 1, Lobby.Debug.sessionSQJ.searchStage, 1 do
		local f11_local5 = Engine.CreateModel( f11_local1, tostring( f11_local2 ) )
		Lobby.Debug.CreateSetModel( f11_local5, "numResults", Lobby.Debug.sessionSQJ.results[f11_local2].numResults )
		local f11_local6 = Engine.CreateModel( f11_local5, "data" )
		for f11_local10, f11_local11 in ipairs( Lobby.Debug.sessionSQJ.results[f11_local2].data ) do
			local f11_local12 = Engine.CreateModel( f11_local6, tostring( f11_local10 ) )
			Lobby.Debug.CreateSetModel( f11_local12, "xuid", f11_local11.xuid )
			Lobby.Debug.CreateSetModel( f11_local12, "xuidstr", f11_local11.xuidstr )
			Lobby.Debug.CreateSetModel( f11_local12, "gamertag", f11_local11.gamertag )
			Lobby.Debug.CreateSetModel( f11_local12, "publicIPAddress", f11_local11.publicIPAddress )
			Lobby.Debug.CreateSetModel( f11_local12, "privateIPAddress", f11_local11.privateIPAddress )
			Lobby.Debug.CreateSetModel( f11_local12, "natType", f11_local11.natType )
			Lobby.Debug.CreateSetModel( f11_local12, "ping", f11_local11.ping )
			Lobby.Debug.CreateSetModel( f11_local12, "status", f11_local11.status )
		end
	end
end

Lobby.Debug.SessionSQJUpdateUIInfo = function ()
	local f12_local0 = Engine.GetModel( Engine.GetGlobalModel(), "debug" )
	if not f12_local0 then
		return 
	else
		local f12_local1 = Engine.GetModel( Engine.GetModel( f12_local0, "sessionSQJ" ), "update" )
		Engine.SetModelValue( f12_local1, Engine.GetModelValue( f12_local1 ) + 1 )
	end
end

Lobby.Debug.SessionSQJSearchResults = function ( f13_arg0 )
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	elseif Lobby.Debug.sessionSQJ.searchStage > 5 then
		Lobby.Debug.SessionSQJClearModels()
		Lobby.Debug.sessionSQJ.searchStage = 2
		Lobby.Debug.sessionSQJ.results[1] = Lobby.Debug.sessionSQJ.results[#Lobby.Debug.sessionSQJ.results - 1]
		Lobby.Debug.sessionSQJ.results[2] = Lobby.Debug.sessionSQJ.results[#Lobby.Debug.sessionSQJ.results]
	end
	Lobby.Debug.sessionSQJ.searchStage = Lobby.Debug.sessionSQJ.searchStage + 1
	Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage] = {
		numResults = f13_arg0.numResults,
		data = {}
	}
	if f13_arg0.numResults == 0 then
		Lobby.Debug.SessionSQJUpdateUIInfo()
		return 
	end
	local f13_local0 = Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage].data
	for f13_local6, f13_local7 in ipairs( f13_arg0.remoteHosts ) do
		f13_local0[f13_local6] = {}
		f13_local0[f13_local6].xuid = f13_local7.xuid
		f13_local0[f13_local6].xuidstr = f13_local7.xuidstr
		local f13_local4 = ""
		if Engine.XUIDToGamertag then
			f13_local4 = Engine.XUIDToGamertag( f13_local7.xuid ) or ""
		end
		f13_local0[f13_local6].gamertag = f13_local4 .. "  " .. tostring( f13_local7.teamSizeMax ) .. "-" .. tostring( f13_local7.numPlayers ) .. "-" .. tostring( f13_local7.maxPlayers ) .. "-" .. tostring( f13_local7.showInMatchmaking )
		local f13_local5 = Engine.SerializedAdrToLua( f13_local7.hostAddress )
		f13_local0[f13_local6].publicIPAddress = f13_local5.publicIPAddress .. ":" .. tostring( f13_local5.publicIPPort )
		f13_local0[f13_local6].privateIPAddress = f13_local5.privateIPAddress
		f13_local0[f13_local6].natType = f13_local5.natTypeStr
	end
	Lobby.Debug.SessionSQJUpdateUIInfo()
end

Lobby.Debug.SessionSQJQoSResult = function ( f14_arg0 )
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	for f14_local3, f14_local4 in ipairs( Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage].data ) do
		if f14_local4.xuid == f14_arg0.xuid then
			if f14_arg0.validResult then
				f14_local4.ping = tostring( math.floor( f14_arg0.latency ) ) .. "ms, s:" .. tostring( f14_arg0.numAvailableSlots )
			else
				f14_local4.ping = "PING-INVALID"
			end
			Lobby.Debug.SessionSQJUpdateUIInfo()
			return 
		end
	end
end

Lobby.Debug.SessionSQJJoinInitiate = function ( f15_arg0 )
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	for f15_local3, f15_local4 in ipairs( Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage].data ) do
		if f15_local4.xuid == f15_arg0 then
			Lobby.Debug.sessionSQJ.joinOrder = Lobby.Debug.sessionSQJ.joinOrder + 1
			f15_local4.status = "(" .. tostring( Lobby.Debug.sessionSQJ.joinOrder ) .. ") JOINING"
			Lobby.Debug.SessionSQJUpdateUIInfo()
			return 
		end
	end
end

Lobby.Debug.SessionSQJJoinResult = function ( f16_arg0 )
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	for f16_local4, f16_local5 in ipairs( Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage].data ) do
		if f16_local5.xuid == f16_arg0.xuid then
			local f16_local3 = LobbyVM.JoinResultToString( f16_arg0.joinResult, false )
			f16_local5.status = "(" .. tostring( Lobby.Debug.sessionSQJ.joinOrder ) .. ") " .. f16_local3.debug
			Lobby.Debug.SessionSQJUpdateUIInfo()
			return 
		end
	end
end

Lobby.Debug.KVSInit = function ( f17_arg0 )
	
end

Lobby.Debug.SendKVSComError = function ( f18_arg0 )
	local f18_local0 = f18_arg0.controller
	local f18_local1 = f18_arg0.errorCode
	local f18_local2 = f18_arg0.errorMsg
	local f18_local3 = f18_arg0.comErrorInProgress
	f18_arg0.isInCleanup = nil
	f18_arg0.runningTaskCount = Engine.CurrentRunningTaskCount()
	f18_arg0.isInGame = Engine.IsInGame()
	if f18_arg0.isInGame then
		f18_arg0.gameInfo = {}
		local f18_local4 = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
		f18_arg0.gameInfo.mapName = f18_local4.mapname
		f18_arg0.gameInfo.gameType = f18_local4.gametype
		f18_arg0.gameInfo.serverStatus = f18_local4.serverStatus
		f18_arg0.gameInfo.matchId = Engine.GetMatchID()
		f18_arg0.gameInfo.gameHost = Engine.GetLobbyHostXuid( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	f18_arg0.sessionMode = Engine.CurrentSessionMode()
	f18_arg0.lobbyInfo = {}
	f18_arg0.lobbyInfo.lobbyNetworkMode = Engine.GetLobbyNetworkMode()
	f18_arg0.lobbyInfo.lobbyMode = Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_GAME )
	f18_arg0.lobbyInfo.lobbyMainMode = Engine.GetLobbyMainMode()
	f18_arg0.lobbyInfo.privateHost = Engine.GetLobbyHostXuid( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	f18_arg0.playerInfo = {}
	f18_arg0.playerInfo.xuid = Engine.GetXUID( f18_local0 )
	f18_arg0.playerInfo.signedIn = Engine.IsSignedIn( f18_local0 )
	f18_arg0.playerInfo.signedInToLive = Engine.IsSignedInToLive( f18_local0 )
	f18_arg0.playerInfo.signedInToDemonware = Engine.IsSignedInToDemonware( f18_local0 )
	f18_arg0.playerInfo.isSubUser = Engine.IsSubUser( f18_local0 )
	f18_arg0.playerInfo.statsFetched = Engine.AreStatsFetched( f18_local0 )
	LuaUtils.LogQoS( "com_error", f18_arg0 )
	Engine.FlushKVS( Engine.GetPrimaryController(), Enum.KVSChannel.MATCHMAKING_QOS )
end

Lobby.Debug.SendKVSJoin = function ( f19_arg0 )
	if Dvar.lobbyDebugLogJoins:get() == true then
		if f19_arg0.join.result.code == Enum.JoinResult.JOIN_RESULT_SUCCESS then
			if Dvar.lobbyDebugLogJoinSuccess:get() == true then
				LuaUtils.LogQoS( "join_success", f19_arg0 )
			end
		else
			LuaUtils.LogQoS( "join_failure", f19_arg0 )
		end
	end
end

Lobby.Debug.InitProcessQueueDebug = function ()
	Lobby.Debug.ProcessHistory = {}
	Lobby.Debug.DebugQueueSize = 5
	Lobby.Debug.MaxActions = 10
end

Lobby.Debug.UpdateProcessQueue = function ()
	local f21_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug" ), "processQueue" )
	local f21_local1 = Engine.CreateModel( f21_local0, "data" )
	Engine.SetModelValue( Engine.CreateModel( f21_local0, "count" ), #Lobby.Debug.ProcessHistory )
	for f21_local12, f21_local13 in ipairs( Lobby.Debug.ProcessHistory ) do
		local f21_local14 = Engine.CreateModel( f21_local1, tostring( f21_local12 ) )
		Engine.SetModelValue( Engine.CreateModel( f21_local14, "processName" ), f21_local13.processName )
		Engine.SetModelValue( Engine.CreateModel( f21_local14, "processCancellable" ), f21_local13.cancellable )
		Engine.SetModelValue( Engine.CreateModel( f21_local14, "type" ), "process" )
		if f21_local13.actions then
			Engine.SetModelValue( Engine.CreateModel( f21_local14, "actionCount" ), #f21_local13.actions )
			local f21_local5 = Engine.CreateModel( f21_local14, "actions" )
			for f21_local9, f21_local10 in ipairs( f21_local13.actions ) do
				local f21_local11 = Engine.CreateModel( f21_local5, tostring( f21_local9 ) )
				Engine.SetModelValue( Engine.CreateModel( f21_local11, "processName" ), f21_local10.name )
				Engine.SetModelValue( Engine.CreateModel( f21_local11, "processState" ), f21_local10.state )
				Engine.SetModelValue( Engine.CreateModel( f21_local11, "type" ), "action" )
			end
		end
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( f21_local0, "update" ) )
end

Lobby.Debug.UpdateProcessAction = function ()
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.Debug.AddDebugProcess = function ()
	if Lobby.Debug.DebugQueueSize <= #Lobby.Debug.ProcessHistory then
		table.remove( Lobby.Debug.ProcessHistory, #Lobby.Debug.ProcessHistory )
	end
	table.insert( Lobby.Debug.ProcessHistory, 1, Lobby.ProcessQueue.queue )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.Debug.AddDebugAction = function ( f24_arg0 )
	if not Lobby.Debug.ProcessHistory[1].actions then
		Lobby.Debug.ProcessHistory[1].actions = {}
	end
	if Lobby.Debug.MaxActions < #Lobby.Debug.ProcessHistory[1].actions then
		table.remove( Lobby.Debug.ProcessHistory[1].actions, #Lobby.Debug.ProcessHistory[1].actions )
	end
	table.insert( Lobby.Debug.ProcessHistory[1].actions, 1, f24_arg0 )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.Debug.JBMatchmakingEvent = function ( f25_arg0 )
	Lobby.Debug.jbEvent = f25_arg0
	if Engine.JBMatchmakingEvent ~= nil then
		Engine.JBMatchmakingEvent( f25_arg0 )
	end
end

Lobby.Debug.OnInit = function ( f26_arg0 )
	Lobby.Debug.KVSInit( f26_arg0 )
	Lobby.Debug.InitProcessQueueDebug()
end

Lobby.Debug.OnUILoad = function ( f27_arg0 )
	if f27_arg0.init == true then
		if Engine.GetCurrentPlatform() == "orbis" or Engine.GetCurrentPlatform() == "durango" then
			Lobby.Debug.LobbyDebugVisEnable()
			Lobby.Debug.LobbyValidateEnable()
			Lobby.Debug.LobbySQJEnable()
		end
		Lobby.Debug.SessionSQJClear()
	end
end

Lobby.Debug.OnSessionStart = function ( f28_arg0 )
	local f28_local0 = f28_arg0.lobbyModule
	local f28_local1 = f28_arg0.lobbyType
	local f28_local2 = f28_arg0.lobbyMode
	f28_arg0.lobbyID = Engine.GetLobbyLobbyID( f28_local1 )
	LuaUtils.LogQoS( "session_start", f28_arg0 )
	if f28_local1 == Enum.LobbyType.LOBBY_TYPE_GAME and f28_local0 == Enum.LobbyModule.LOBBY_MODULE_HOST then
		Lobby.Debug.SessionSQJClear()
	end
end

Lobby.Debug.OnSessionEnd = function ( f29_arg0 )
	local f29_local0 = f29_arg0.lobbyModule
	local f29_local1 = f29_arg0.lobbyType
	local f29_local2 = f29_arg0.lobbyMode
	f29_arg0.lobbyID = Engine.GetLobbyLobbyID( f29_local1 )
	LuaUtils.LogQoS( "session_end", f29_arg0 )
end

Lobby.Debug.OnMatchStart = function ( f30_arg0 )
	LuaUtils.LogQoS( "match_start", f30_arg0 )
end

Lobby.Debug.OnMatchEnd = function ( f31_arg0 )
	LuaUtils.LogQoS( "match_end", f31_arg0 )
	Engine.FlushKVS( Engine.GetPrimaryController(), Enum.KVSChannel.MATCHMAKING_QOS )
end

Lobby.Debug.OnComError = function ( f32_arg0 )
	Lobby.Debug.SendKVSComError( f32_arg0 )
end

Lobby.Debug.OnJoinComplete = function ( f33_arg0 )
	Lobby.Debug.SendKVSJoin( f33_arg0 )
end

Lobby.Debug.Pump = function ()
	Lobby.Debug.LobbyValidate()
end

Lobby.Debug.OnInit( {} )
