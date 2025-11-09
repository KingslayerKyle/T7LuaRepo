require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )

Lobby.Debug = {}
Lobby.Debug.INVALID_CONTROLLER_PORT = -1
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
Lobby.Debug.gamertagDebugVisListOrbis = {
	"danger_cabbage",
	"danger_cucumber",
	"danger_kumquat",
	"FEXTFOX",
	"RJ52",
	"test_store",
	"storetesting2"
}
Lobby.Debug.gamertagDebugVisListDurango = {
	"2 DangerCabbage",
	"2 Dev 861695205"
}
Lobby.Debug.lobbyValidateListOrbis = {
	"danger_cabbage",
	"danger_cucumber",
	"danger_kumquat",
	"FEXTFOX",
	"RJ52",
	"test_store",
	"storetesting2"
}
Lobby.Debug.lobbyValidateListDurango = {
	"2 Dev 60168782"
}
Lobby.Debug.lobbySQJListOrbis = {
	"danger_cabbage",
	"danger_cucumber",
	"danger_kumquat",
	"FEXTFOX",
	"RJ52",
	"test_store",
	"storetesting2"
}
Lobby.Debug.lobbySQJListDurango = {
	"2 Dev 60168782"
}
Lobby.Debug.EnableForPrimaryController = function ( f1_arg0 )
	if Engine.IsDedicatedServer() then
		return false
	end
	local f1_local0 = Engine.GetPrimaryController()
	if f1_local0 == Lobby.Debug.INVALID_CONTROLLER_PORT or #f1_arg0 == 0 then
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
	if not Dvar.ui_lobbyDebugSessionSQJ:exists() or Dvar.ui_lobbyDebugSessionSQJ:get() == false then
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
		f13_local0[f13_local6].gamertag = f13_local4
		local f13_local5 = Engine.SerializedAdrToLua( f13_local7.hostAddress )
		f13_local0[f13_local6].publicIPAddress = f13_local5.publicIPAddress
		f13_local0[f13_local6].privateIPAddress = f13_local5.privateIPAddress
		f13_local0[f13_local6].natType = f13_local5.natType
	end
	Lobby.Debug.SessionSQJUpdateUIInfo()
end

Lobby.Debug.SessionSQJQoSResult = function ( f14_arg0 )
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	for f14_local3, f14_local4 in ipairs( Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage].data ) do
		if Engine.CompareUInt64( f14_local4.xuid, f14_arg0.xuid, "=" ) then
			if f14_arg0.validResult then
				f14_local4.ping = tostring( math.floor( f14_arg0.latency ) ) .. "ms"
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
		if Engine.CompareUInt64( f15_local4.xuid, f15_arg0, "=" ) then
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
		if Engine.CompareUInt64( f16_local5.xuid, f16_arg0.xuid, "=" ) then
			local f16_local3 = LobbyVM.JoinResultToString( f16_arg0.joinResult, false )
			f16_local5.status = f16_local3.debug
			Lobby.Debug.SessionSQJUpdateUIInfo()
			return 
		end
	end
end

Lobby.Debug.SendKVSComError = function ( f17_arg0 )
	local f17_local0 = f17_arg0.controller
	local f17_local1 = f17_arg0.errorCode
	local f17_local2 = f17_arg0.errorMsg
	local f17_local3 = f17_arg0.comErrorInProgress
	f17_arg0.isInCleanup = nil
	f17_arg0.runningTaskCount = Engine.CurrentRunningTaskCount()
	f17_arg0.isInGame = Engine.IsInGame()
	if f17_arg0.isInGame then
		f17_arg0.gameInfo = {}
		local f17_local4 = Engine.LobbyGetGameData()
		f17_arg0.gameInfo.mapName = f17_local4.mapname
		f17_arg0.gameInfo.gameType = f17_local4.gametype
		f17_arg0.gameInfo.serverStatus = f17_local4.serverStatus
		f17_arg0.gameInfo.matchId = Engine.GetMatchID()
		f17_arg0.gameInfo.gameHost = Engine.GetLobbyHostXuid( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	f17_arg0.sessionMode = Engine.CurrentSessionMode()
	f17_arg0.lobbyInfo = {}
	f17_arg0.lobbyInfo.lobbyNetworkMode = Engine.GetLobbyNetworkMode()
	f17_arg0.lobbyInfo.lobbyMode = Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_GAME )
	f17_arg0.lobbyInfo.lobbyMainMode = Engine.GetLobbyMainMode()
	f17_arg0.lobbyInfo.privateHost = Engine.GetLobbyHostXuid( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	f17_arg0.playerInfo = {}
	f17_arg0.playerInfo.xuid = Engine.GetXUID( f17_local0 )
	f17_arg0.playerInfo.signedIn = Engine.IsSignedIn( f17_local0 )
	f17_arg0.playerInfo.signedInToLive = Engine.IsSignedInToLive( f17_local0 )
	f17_arg0.playerInfo.signedInToDemonware = Engine.IsSignedInToDemonware( f17_local0 )
	f17_arg0.playerInfo.isSubUser = Engine.IsSubUser( f17_local0 )
	f17_arg0.playerInfo.statsFetched = Engine.AreStatsFetched( f17_local0 )
	LuaUtils.LogQoS( "com_error", f17_arg0 )
	Engine.FlushKVS( Engine.GetPrimaryController(), Enum.KVSChannel.MATCHMAKING_QOS )
end

Lobby.Debug.SendKVSJoin = function ( f18_arg0 )
	if Dvar.lobbyDebugLogJoins:get() == true then
		if f18_arg0.join.result.code == Enum.JoinResult.JOIN_RESULT_SUCCESS then
			if Dvar.lobbyDebugLogJoinSuccess:get() == true then
				LuaUtils.LogQoS( "join_success", f18_arg0 )
			end
		else
			LuaUtils.LogQoS( "join_failure", f18_arg0 )
		end
	end
end

Lobby.Debug.OnUILoad = function ( f19_arg0 )
	if f19_arg0.init == true then
		if Engine.GetCurrentPlatform() == "orbis" or Engine.GetCurrentPlatform() == "durango" then
			Lobby.Debug.LobbyDebugVisEnable()
			Lobby.Debug.LobbyValidateEnable()
			Lobby.Debug.LobbySQJEnable()
		end
		Lobby.Debug.SessionSQJClear()
	end
end

Lobby.Debug.OnComError = function ( f20_arg0 )
	Lobby.Debug.SendKVSComError( f20_arg0 )
end

Lobby.Debug.OnJoinComplete = function ( f21_arg0 )
	Lobby.Debug.SendKVSJoin( f21_arg0 )
end

Lobby.Debug.Pump = function ()
	Lobby.Debug.LobbyValidate()
end

