require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )
require( "lua.Shared.LuaEnum" )
require( "ui.rat.rat" )

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
Lobby.Debug.jbEvent = LuaEnum.JB_MATCHMAKING_EVENT.START
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
Lobby.Debug.EnableForPrimaryController = function ( gamertagList )
	if Engine.IsDedicatedServer() then
		return false
	end
	local controller = Engine.GetPrimaryController()
	if controller == LuaDefine.INVALID_CONTROLLER_PORT or #gamertagList == 0 then
		return false
	end
	local localGamertag = Engine.GetGamertagForController( controller )
	if localGamertag == nil or localGamertag == "" then
		return false
	end
	for index, gamertag in pairs( gamertagList ) do
		if localGamertag == gamertag then
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
	local currentUIScreen = Engine.GetLobbyUIScreen()
	if currentUIScreen == 0 then
		return 
	elseif currentUIScreen ~= Lobby.Debug.validateInfo.LastScreen then
		Lobby.Debug.validateInfo.LastScreen = currentUIScreen
		Lobby.Debug.validateInfo.CheckTime = Engine.milliseconds() + Lobby.Debug.validateInfo.CheckDelay
	end
	if Engine.milliseconds() < Lobby.Debug.validateInfo.CheckTime then
		return 
	end
	Lobby.Debug.validateInfo.CheckTime = Engine.milliseconds() + Lobby.Debug.validateInfo.CheckInterval
	local uiInfo = LobbyData.GetLobbyMenuByID( currentUIScreen )
	if uiInfo == nil then
		return 
	end
	local networkMode = Engine.GetLobbyNetworkMode()
	local mainMode = Engine.GetLobbyMainMode()
	local privateActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local gameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local privateClientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local gameClientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local privateMaxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local gameMaxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f5_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	if currentUIScreen ~= f5_local0.id then
		f5_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
		if currentUIScreen ~= f5_local0.id then
			f5_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
			if currentUIScreen ~= f5_local0.id and uiInfo.networkMode ~= networkMode then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: Network Mode mismatch. uiInfo.networkMode(" .. uiInfo.networkMode .. ") ~= networkMode(" .. networkMode .. ").\n" )
			end
		end
	end
	if uiInfo.mainMode ~= mainMode then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: Main Mode mismatch. uiInfo.mainMode(" .. uiInfo.mainMode .. ") ~= mainMode(" .. mainMode .. ").\n" )
	end
	if uiInfo.isPrivate ~= privateActive then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, string.format( Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: Private active mismatch. uiInfo.isPrivate(%s) ~= privateActive(%s).\n", tostring( uiInfo.isPrivate ), tostring( privateActive ) ) )
	end
	if uiInfo.isGame ~= gameActive then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, string.format( Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: Game active mismatch. uiInfo.isGame(%s) ~= gameActive(%s).\n", tostring( uiInfo.isGame ), tostring( gameActive ) ) )
	end
	if uiInfo.lobbyType == Enum.LobbyType.LOBBY_TYPE_INVALID then
		if privateClientCount ~= 0 or gameClientCount ~= 0 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_INVALID player count: privateClientCount(" .. privateClientCount .. ") ~= 0 or gameClientCount(" .. gameClientCount .. ") ~= 0.\n" )
		end
	elseif uiInfo.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		if privateClientCount == 0 or gameClientCount ~= 0 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_PRIVATE player count: privateClientCount(" .. privateClientCount .. ") == 0 or gameClientCount(" .. gameClientCount .. ") ~= 0.\n" )
		end
		if uiInfo.maxClients < privateMaxClients then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_PRIVATE maxClient mismatch. uiInfo.maxClients(" .. uiInfo.maxClients .. ") < privateMaxClients(" .. privateMaxClients .. ").\n" )
		end
	elseif uiInfo.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		if privateClientCount == 0 or gameClientCount == 0 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_GAME player count: privateClientCount(" .. privateClientCount .. ") == 0 or gameClientCount(" .. gameClientCount .. ") == 0.\n" )
		end
		if uiInfo.maxClients < gameMaxClients then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, Lobby.Debug.COLOR.MAGENTA .. "Lobby.Debug.LobbyValidate: LobbyType LOBBY_TYPE_GAME maxClient mismatch. uiInfo.maxClients(" .. uiInfo.maxClients .. ") < gameMaxClients(" .. gameMaxClients .. ").\n" )
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
	local getAndSetModelValue = function ( parentModel, modelName, value )
		local model = Engine.GetModel( parentModel, modelName )
		local modelValue = Engine.GetModelValue( model )
		Engine.SetModelValue( model, value )
		return modelValue
	end
	
	local debugModel = Engine.GetModel( Engine.GetGlobalModel(), "debug" )
	if not debugModel then
		return 
	end
	local sessionSQJModel = Engine.GetModel( debugModel, "sessionSQJ" )
	if not sessionSQJModel then
		return 
	end
	local searchStageModel = Engine.GetModel( sessionSQJModel, "searchStage" )
	if not searchStageModel then
		return 
	end
	local searchStage = getAndSetModelValue( sessionSQJModel, "searchStage", 0 )
	local resultsModel = Engine.GetModel( sessionSQJModel, "results" )
	for i = 1, searchStage, 1 do
		local resultEntryModel = Engine.GetModel( resultsModel, tostring( i ) )
		local numResults = getAndSetModelValue( resultEntryModel, "numResults", 0 )
		if numResults > 0 then
			local dataModel = Engine.GetModel( resultEntryModel, "data" )
			for j = 1, numResults, 1 do
				local dataEntryModel = Engine.GetModel( dataModel, tostring( j ) )
				getAndSetModelValue( dataEntryModel, "xuid", 0 )
				getAndSetModelValue( dataEntryModel, "xuidstr", "" )
				getAndSetModelValue( dataEntryModel, "publicIPAddress", "" )
				getAndSetModelValue( dataEntryModel, "privateIPAddress", "" )
				getAndSetModelValue( dataEntryModel, "natType", "" )
				getAndSetModelValue( dataEntryModel, "ping", "" )
				getAndSetModelValue( dataEntryModel, "status", "" )
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

Lobby.Debug.CreateSetModel = function ( parentModel, modelName, modelValue )
	local newModel = Engine.CreateModel( parentModel, modelName )
	Engine.SetModelValue( newModel, modelValue )
	return newModel
end

Lobby.Debug.SessionSQJRefreshInfo = function ()
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	local debugModel = Engine.CreateModel( Engine.GetGlobalModel(), "debug" )
	local sessionSQJModel = Engine.CreateModel( debugModel, "sessionSQJ" )
	Lobby.Debug.CreateSetModel( sessionSQJModel, "searchStage", Lobby.Debug.sessionSQJ.searchStage )
	local resultsModel = Engine.CreateModel( sessionSQJModel, "results" )
	for i = 1, Lobby.Debug.sessionSQJ.searchStage, 1 do
		local resultEntryModel = Engine.CreateModel( resultsModel, tostring( i ) )
		Lobby.Debug.CreateSetModel( resultEntryModel, "numResults", Lobby.Debug.sessionSQJ.results[i].numResults )
		local dataModel = Engine.CreateModel( resultEntryModel, "data" )
		for j, result in ipairs( Lobby.Debug.sessionSQJ.results[i].data ) do
			local dataEntryModel = Engine.CreateModel( dataModel, tostring( j ) )
			Lobby.Debug.CreateSetModel( dataEntryModel, "xuid", result.xuid )
			Lobby.Debug.CreateSetModel( dataEntryModel, "xuidstr", result.xuidstr )
			Lobby.Debug.CreateSetModel( dataEntryModel, "gamertag", result.gamertag )
			Lobby.Debug.CreateSetModel( dataEntryModel, "publicIPAddress", result.publicIPAddress )
			Lobby.Debug.CreateSetModel( dataEntryModel, "privateIPAddress", result.privateIPAddress )
			Lobby.Debug.CreateSetModel( dataEntryModel, "natType", result.natType )
			Lobby.Debug.CreateSetModel( dataEntryModel, "ping", result.ping )
			Lobby.Debug.CreateSetModel( dataEntryModel, "status", result.status )
		end
	end
end

Lobby.Debug.SessionSQJUpdateUIInfo = function ()
	local debugModel = Engine.GetModel( Engine.GetGlobalModel(), "debug" )
	if not debugModel then
		return 
	else
		local sessionSQJModel = Engine.GetModel( debugModel, "sessionSQJ" )
		local updateModel = Engine.GetModel( sessionSQJModel, "update" )
		local updateValue = Engine.GetModelValue( updateModel )
		Engine.SetModelValue( updateModel, updateValue + 1 )
	end
end

Lobby.Debug.SessionSQJSearchResults = function ( data )
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
		numResults = data.numResults,
		data = {}
	}
	if data.numResults == 0 then
		Lobby.Debug.SessionSQJUpdateUIInfo()
		return 
	end
	local sqjData = Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage].data
	for index, result in ipairs( data.remoteHosts ) do
		sqjData[index] = {}
		sqjData[index].xuid = result.xuid
		sqjData[index].xuidstr = result.xuidstr
		local f13_local3 = ""
		if Engine.XUIDToGamertag then
			f13_local3 = Engine.XUIDToGamertag( result.xuid ) or ""
		end
		sqjData[index].gamertag = f13_local3 .. "  " .. tostring( result.teamSizeMax ) .. "-" .. tostring( result.numPlayers ) .. "-" .. tostring( result.maxPlayers ) .. "-" .. tostring( result.showInMatchmaking )
		local hostAddress = Engine.SerializedAdrToLua( result.hostAddress )
		sqjData[index].publicIPAddress = hostAddress.publicIPAddress .. ":" .. tostring( hostAddress.publicIPPort )
		sqjData[index].privateIPAddress = hostAddress.privateIPAddress
		sqjData[index].natType = hostAddress.natTypeStr
	end
	Lobby.Debug.SessionSQJUpdateUIInfo()
end

Lobby.Debug.SessionSQJQoSResult = function ( data )
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	for index, result in ipairs( Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage].data ) do
		if result.xuid == data.xuid then
			if data.validResult then
				result.ping = tostring( math.floor( data.latency ) ) .. "ms, s:" .. tostring( data.numAvailableSlots )
			else
				result.ping = "PING-INVALID"
			end
			Lobby.Debug.SessionSQJUpdateUIInfo()
			return 
		end
	end
end

Lobby.Debug.SessionSQJJoinInitiate = function ( xuid )
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	for index, result in ipairs( Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage].data ) do
		if result.xuid == xuid then
			Lobby.Debug.sessionSQJ.joinOrder = Lobby.Debug.sessionSQJ.joinOrder + 1
			result.status = "(" .. tostring( Lobby.Debug.sessionSQJ.joinOrder ) .. ") JOINING"
			Lobby.Debug.SessionSQJUpdateUIInfo()
			return 
		end
	end
end

Lobby.Debug.SessionSQJJoinResult = function ( data )
	if not Lobby.Debug.SessionSQJEnabled() then
		return 
	end
	for index, result in ipairs( Lobby.Debug.sessionSQJ.results[Lobby.Debug.sessionSQJ.searchStage].data ) do
		if result.xuid == data.xuid then
			local joinResultInfo = Lobby.Join.JoinResultToString( data.joinResult, false )
			result.status = "(" .. tostring( Lobby.Debug.sessionSQJ.joinOrder ) .. ") " .. joinResultInfo.debug
			Lobby.Debug.SessionSQJUpdateUIInfo()
			return 
		end
	end
end

Lobby.Debug.KVSInit = function ( data )
	
end

Lobby.Debug.SendKVSComError = function ( data )
	local controller = data.controller
	local errorCode = data.errorCode
	local errorMsg = data.errorMsg
	local comErrorAlreadyInProgress = data.comErrorInProgress
	data.isInCleanup = nil
	data.runningTaskCount = Engine.CurrentRunningTaskCount()
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	data.isInGame = Engine.IsInGame()
	if data.isInGame then
		data.gameInfo = {}
		local gameData = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
		data.gameInfo.mapName = gameData.mapname
		data.gameInfo.gameType = gameData.gametype
		data.gameInfo.serverStatus = gameData.serverStatus
		data.gameInfo.matchId = Engine.GetMatchID()
		data.gameInfo.gameHost = Engine.GetLobbyHostXuid( lobbyType )
	end
	data.sessionMode = Engine.CurrentSessionMode()
	data.lobbyInfo = {}
	data.lobbyInfo.lobbyNetworkMode = Engine.GetLobbyNetworkMode()
	data.lobbyInfo.lobbyMode = Engine.GetLobbyMode( lobbyType )
	data.lobbyInfo.lobbyMainMode = Engine.GetLobbyMainMode()
	data.lobbyInfo.privateHost = Engine.GetLobbyHostXuid( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	data.playerInfo = {}
	data.playerInfo.xuid = Engine.GetXUIDString( controller )
	data.playerInfo.signedIn = Engine.IsSignedIn( controller )
	data.playerInfo.signedInToLive = Engine.IsSignedInToLive( controller )
	data.playerInfo.signedInToDemonware = Engine.IsSignedInToDemonware( controller )
	data.playerInfo.statsFetched = Engine.AreStatsFetched( controller )
	LuaUtils.LogQoS( "com_error", data )
	Engine.FlushKVS( Engine.GetPrimaryController(), Enum.KVSChannel.MATCHMAKING_QOS )
end

Lobby.Debug.SendKVSJoin = function ( data )
	if Dvar.lobbyDebugLogJoins:get() == true then
		if data.join.result.code == Enum.JoinResult.JOIN_RESULT_SUCCESS then
			if Dvar.lobbyDebugLogJoinSuccess:get() == true then
				LuaUtils.LogQoS( "join_success", data )
			end
		else
			LuaUtils.LogQoS( "join_failure", data )
		end
	end
end

Lobby.Debug.InitProcessQueueDebug = function ()
	Lobby.Debug.ProcessHistory = {}
	Lobby.Debug.DebugQueueSize = 5
	Lobby.Debug.MaxActions = 10
end

Lobby.Debug.UpdateProcessQueue = function ()
	local debugModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug" )
	local processQueueModel = Engine.CreateModel( debugModel, "processQueue" )
	local dataModel = Engine.CreateModel( processQueueModel, "data" )
	local processQueueCountModel = Engine.CreateModel( processQueueModel, "count" )
	Engine.SetModelValue( processQueueCountModel, #Lobby.Debug.ProcessHistory )
	for index, queueState in ipairs( Lobby.Debug.ProcessHistory ) do
		local itemModel = Engine.CreateModel( dataModel, tostring( index ) )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "processName" ), queueState.processName )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "processCancellable" ), queueState.cancellable )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "type" ), "process" )
		if queueState.actions then
			Engine.SetModelValue( Engine.CreateModel( itemModel, "actionCount" ), #queueState.actions )
			local actionsModel = Engine.CreateModel( itemModel, "actions" )
			for actionIndex, action in ipairs( queueState.actions ) do
				local actionItemModel = Engine.CreateModel( actionsModel, tostring( actionIndex ) )
				Engine.SetModelValue( Engine.CreateModel( actionItemModel, "processName" ), action.name )
				Engine.SetModelValue( Engine.CreateModel( actionItemModel, "processState" ), action.state )
				Engine.SetModelValue( Engine.CreateModel( actionItemModel, "type" ), "action" )
			end
		end
	end
	local updateModel = Engine.CreateModel( processQueueModel, "update" )
	Engine.ForceNotifyModelSubscriptions( updateModel )
end

Lobby.Debug.UpdateProcessAction = function ()
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.Debug.AddDebugProcess = function ()
	if Lobby.Debug.DebugQueueSize <= #Lobby.Debug.ProcessHistory then
		table.remove( Lobby.Debug.ProcessHistory, #Lobby.Debug.ProcessHistory )
	end
	local queueState = Lobby.ProcessQueue.queue
	table.insert( Lobby.Debug.ProcessHistory, 1, queueState )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.Debug.AddDebugAction = function ( action )
	if not Lobby.Debug.ProcessHistory[1].actions then
		Lobby.Debug.ProcessHistory[1].actions = {}
	end
	if Lobby.Debug.MaxActions < #Lobby.Debug.ProcessHistory[1].actions then
		table.remove( Lobby.Debug.ProcessHistory[1].actions, #Lobby.Debug.ProcessHistory[1].actions )
	end
	table.insert( Lobby.Debug.ProcessHistory[1].actions, 1, action )
	Lobby.Debug.UpdateProcessQueue()
end

Lobby.Debug.JBMatchmakingEvent = function ( event )
	Lobby.Debug.jbEvent = event
	if Engine.JBMatchmakingEvent ~= nil then
		Engine.JBMatchmakingEvent( event )
	end
end

Lobby.Debug.OnInit = function ( data )
	Lobby.Debug.KVSInit( data )
	Lobby.Debug.InitProcessQueueDebug()
end

Lobby.Debug.OnUILoad = function ( data )
	local init = data.init
	if init == true then
		if Engine.GetCurrentPlatform() == "orbis" or Engine.GetCurrentPlatform() == "durango" then
			Lobby.Debug.LobbyDebugVisEnable()
			Lobby.Debug.LobbyValidateEnable()
			Lobby.Debug.LobbySQJEnable()
		end
		Lobby.Debug.SessionSQJClear()
	end
end

Lobby.Debug.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	data.lobbyID = Engine.GetLobbyLobbyID( lobbyModule, lobbyType )
	LuaUtils.LogQoS( "session_start", data )
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and lobbyModule == Enum.LobbyModule.LOBBY_MODULE_HOST then
		Lobby.Debug.SessionSQJClear()
	end
end

Lobby.Debug.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	data.lobbyID = Engine.GetLobbyLobbyID( lobbyModule, lobbyType )
	LuaUtils.LogQoS( "session_end", data )
end

Lobby.Debug.OnMatchStart = function ( data )
	LuaUtils.LogQoS( "match_start", data )
end

Lobby.Debug.OnMatchEnd = function ( data )
	LuaUtils.LogQoS( "match_end", data )
	Engine.FlushKVS( Engine.GetPrimaryController(), Enum.KVSChannel.MATCHMAKING_QOS )
end

Lobby.Debug.OnComError = function ( data )
	Lobby.Debug.SendKVSComError( data )
end

Lobby.Debug.OnJoinComplete = function ( data )
	Lobby.Debug.SendKVSJoin( data )
end

Lobby.Debug.Pump = function ()
	Lobby.Debug.LobbyValidate()
end

Lobby.Debug.OnInit( {} )
