require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Shared.LobbyData" )

Lobby.Debug = {}
local INVALID_CONTROLLER_PORT = -1
local COLOR = {
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
local gamertagDebugVisListOrbis = {
	"danger_cabbage",
	"danger_cucumber",
	"danger_kumquat",
	"FEXTFOX",
	"RJ52",
	"test_store",
	"storetesting2"
}
local gamertagDebugVisListDurango = {
	"2 DangerCabbage",
	"2 Dev 861695205"
}
local lobbyValidateListOrbis = {
	"danger_cabbage",
	"danger_cucumber",
	"danger_kumquat",
	"FEXTFOX",
	"RJ52",
	"test_store",
	"storetesting2"
}
local lobbyValidateListDurango = {
	"2 Dev 60168782"
}
local EnableForPrimaryController = function ( gamertagList )
	if Engine.IsDedicatedServer() then
		return false
	end
	local controller = Engine.GetPrimaryController()
	if controller == INVALID_CONTROLLER_PORT or #gamertagList == 0 then
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

local LobbyDebugVisEnable = function ()
	if Engine.GetCurrentPlatform() == "orbis" then
		if not EnableForPrimaryController( gamertagDebugVisListOrbis ) then
			return 
		end
	elseif Engine.GetCurrentPlatform() == "durango" and not EnableForPrimaryController( gamertagDebugVisListDurango ) then
		return 
	end
	Dvar.ui_lobbyDebugVis:set( 1 )
end

local validateInfo = {
	Enabled = false,
	LastScreen = 0,
	CheckTime = 0,
	CheckDelay = 3000,
	CheckInterval = 1000
}
local LobbyValidateEnable = function ()
	if Engine.GetCurrentPlatform() == "orbis" then
		if not EnableForPrimaryController( lobbyValidateListOrbis ) then
			return 
		end
	elseif Engine.GetCurrentPlatform() == "durango" and not EnableForPrimaryController( lobbyValidateListDurango ) then
		return 
	end
	validateInfo.Enabled = true
end

local LobbyValidate = function ()
	if Engine.IsDedicatedServer() then
		return 
	elseif validateInfo.Enabled == false then
		return 
	elseif not Lobby.ProcessQueue.IsQueueEmpty() then
		return 
	end
	local currentUIScreen = Engine.GetLobbyUIScreen()
	if currentUIScreen == 0 then
		return 
	elseif validateInfo.LastScreen ~= currentUIScreen then
		validateInfo.LastScreen = currentUIScreen
		validateInfo.CheckTime = Engine.milliseconds() + validateInfo.CheckDelay
	end
	if Engine.milliseconds() < validateInfo.CheckTime then
		return 
	end
	validateInfo.CheckTime = Engine.milliseconds() + validateInfo.CheckInterval
	local uiInfo = LobbyData:UITargetFromId( currentUIScreen )
	if uiInfo == nil then
		return 
	end
	local networkMode = Engine.GetLobbyNetworkMode()
	local mainMode = Engine.GetLobbyMainMode()
	local privateActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local gameActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local privateClientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local gameClientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local privateMaxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local gameMaxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	if currentUIScreen ~= LobbyData.UITargets.UI_MAIN.id and currentUIScreen ~= LobbyData.UITargets.UI_MODESELECT.id and uiInfo.networkMode ~= networkMode then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, COLOR.MAGENTA .. "LobbyValidate: Network Mode mismatch. uiInfo.networkMode(" .. uiInfo.networkMode .. ") ~= networkMode(" .. networkMode .. ").\n" )
	end
	if uiInfo.mainMode ~= mainMode then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, COLOR.MAGENTA .. "LobbyValidate: Main Mode mismatch. uiInfo.mainMode(" .. uiInfo.mainMode .. ") ~= mainMode(" .. mainMode .. ").\n" )
	end
	if uiInfo.isPrivate ~= privateActive then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, string.format( COLOR.MAGENTA .. "LobbyValidate: Private active mismatch. uiInfo.isPrivate(%s) ~= privateActive(%s).\n", tostring( uiInfo.isPrivate ), tostring( privateActive ) ) )
	end
	if uiInfo.isGame ~= gameActive then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, string.format( COLOR.MAGENTA .. "LobbyValidate: Game active mismatch. uiInfo.isGame(%s) ~= gameActive(%s).\n", tostring( uiInfo.isGame ), tostring( gameActive ) ) )
	end
	if uiInfo.lobbyType == Enum.LobbyType.LOBBY_TYPE_INVALID then
		if privateClientCount ~= 0 or gameClientCount ~= 0 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, COLOR.MAGENTA .. "LobbyValidate: LobbyType LOBBY_TYPE_INVALID player count: privateClientCount(" .. privateClientCount .. ") ~= 0 or gameClientCount(" .. gameClientCount .. ") ~= 0.\n" )
		end
	elseif uiInfo.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		if privateClientCount == 0 or gameClientCount ~= 0 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, COLOR.MAGENTA .. "LobbyValidate: LobbyType LOBBY_TYPE_PRIVATE player count: privateClientCount(" .. privateClientCount .. ") == 0 or gameClientCount(" .. gameClientCount .. ") ~= 0.\n" )
		end
		if uiInfo.maxClients < privateMaxClients then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, COLOR.MAGENTA .. "LobbyValidate: LobbyType LOBBY_TYPE_PRIVATE maxClient mismatch. uiInfo.maxClients(" .. uiInfo.maxClients .. ") < privateMaxClients(" .. privateMaxClients .. ").\n" )
		end
	elseif uiInfo.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		if privateClientCount == 0 or gameClientCount == 0 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, COLOR.MAGENTA .. "LobbyValidate: LobbyType LOBBY_TYPE_GAME player count: privateClientCount(" .. privateClientCount .. ") == 0 or gameClientCount(" .. gameClientCount .. ") == 0.\n" )
		end
		if uiInfo.maxClients < gameMaxClients then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, COLOR.MAGENTA .. "LobbyValidate: LobbyType LOBBY_TYPE_GAME maxClient mismatch. uiInfo.maxClients(" .. uiInfo.maxClients .. ") < gameMaxClients(" .. gameMaxClients .. ").\n" )
		end
	end
end

Lobby.Debug.OnUILoad = function ( data )
	local init = data.init
	if init == true and (Engine.GetCurrentPlatform() == "orbis" or Engine.GetCurrentPlatform() == "durango") then
		LobbyDebugVisEnable()
		LobbyValidateEnable()
	end
end

Lobby.Debug.Pump = function ()
	LobbyValidate()
end

