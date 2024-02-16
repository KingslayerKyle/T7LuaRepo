require( "lua.Shared.LuaEnums" )
require( "lua.Shared.LuaUtils" )

local lobbyData = {}
local uiTargets = {
	UI_MAIN = {
		id = 0,
		name = "Main",
		title = "",
		kicker = "",
		room = "room1",
		isPrivate = false,
		isGame = false,
		isAdvertised = false,
		maxClients = 0,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_INVALID,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_INVALID,
		eGameModes = Enum.eGameModes.MODE_GAME_INVALID,
		lobbyTimerType = LuaEnums.TIMER_TYPE.INVALID
	},
	UI_MODESELECT = {
		id = 1,
		name = "ModeSelect",
		title = "",
		kicker = "",
		room = "auto",
		isPrivate = true,
		isGame = false,
		isAdvertised = false,
		maxClients = 18,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_INVALID,
		eGameModes = Enum.eGameModes.MODE_GAME_INVALID,
		lobbyTimerType = LuaEnums.TIMER_TYPE.INVALID
	},
	UI_CPLOBBYONLINE = {
		id = 100,
		name = "CPLobbyOnline",
		title = "MENU_CAMPAIGN_CAPS",
		kicker = "MENU_CAMPAIGN",
		room = "cp",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL,
		lobbyTimerType = LuaEnums.TIMER_TYPE.MANUAL_CP
	},
	UI_CPLOBBYONLINEPUBLICGAME = {
		id = 101,
		name = "CPLobbyOnlinePublicGame",
		title = "MENU_CAMPAIGN_CAPS",
		kicker = "MPUI_PUBLIC_MATCH_LOBBY",
		room = "cp",
		isPrivate = true,
		isGame = true,
		isAdvertised = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST,
		lobbyTimerType = LuaEnums.TIMER_TYPE.AUTO_CP
	},
	UI_CPLOBBYONLINECUSTOMGAME = {
		id = 102,
		name = "CPLobbyOnlineCustomGame",
		title = "MENU_CUSTOMGAMES_CAPS",
		kicker = "MENU_FILESHARE_CUSTOMGAMES",
		room = "cp",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL,
		lobbyTimerType = LuaEnums.TIMER_TYPE.MANUAL_CP
	},
	UI_CPLOBBYLANGAME = {
		id = 110,
		name = "CPLobbyLANGame",
		title = "MENU_CAMPAIGN_CAPS",
		kicker = "",
		room = "cp",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_INVALID,
		lobbyTimerType = LuaEnums.TIMER_TYPE.MANUAL_CP
	},
	UI_CP2LOBBYONLINE = {
		id = 200,
		name = "CP2LobbyOnline",
		title = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
		kicker = "",
		room = "cpzm",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL,
		lobbyTimerType = LuaEnums.TIMER_TYPE.NONE
	},
	UI_CP2LOBBYONLINEPUBLICGAME = {
		id = 201,
		name = "CP2LobbyOnlinePublicGame",
		title = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
		kicker = "MPUI_PUBLIC_MATCH_LOBBY",
		room = "cpzm",
		isPrivate = true,
		isGame = true,
		isAdvertised = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST,
		lobbyTimerType = LuaEnums.TIMER_TYPE.NONE
	},
	UI_CP2LOBBYONLINECUSTOMGAME = {
		id = 202,
		name = "CP2LobbyOnlineCustomGame",
		title = "MENU_CUSTOMGAMES_CAPS",
		kicker = "MENU_FILESHARE_CUSTOMGAMES",
		room = "cpzm",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL,
		lobbyTimerType = LuaEnums.TIMER_TYPE.NONE
	},
	UI_CP2LOBBYLANGAME = {
		id = 210,
		name = "CP2LobbyLANGame",
		title = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
		kicker = "",
		room = "cpzm",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_INVALID,
		lobbyTimerType = LuaEnums.TIMER_TYPE.MANUAL
	},
	UI_MPLOBBYONLINE = {
		id = 300,
		name = "MPLobbyOnline",
		title = "MENU_MULTIPLAYER_CAPS",
		kicker = "MENU_MULTIPLAYER",
		room = "mp_online",
		isPrivate = true,
		isGame = false,
		isAdvertised = false,
		maxClients = 18,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_MP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_INVALID,
		lobbyTimerType = LuaEnums.TIMER_TYPE.INVALID
	},
	UI_MPLOBBYONLINEPUBLICGAME = {
		id = 301,
		name = "MPLobbyOnlinePublicGame",
		title = "MENU_MULTIPLAYER_CAPS",
		kicker = "MPUI_PUBLIC_MATCH_LOBBY",
		room = "mp_online",
		isPrivate = true,
		isGame = true,
		isAdvertised = true,
		maxClients = 18,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_MP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST,
		lobbyTimerType = LuaEnums.TIMER_TYPE.AUTO_MP
	},
	UI_MPLOBBYONLINECUSTOMGAME = {
		id = 302,
		name = "MPLobbyOnlineCustomGame",
		title = "MENU_CUSTOMGAMES_CAPS",
		kicker = "MENU_FILESHARE_CUSTOMGAMES",
		room = "mp_custom",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 18,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_MP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL,
		lobbyTimerType = LuaEnums.TIMER_TYPE.MANUAL
	},
	UI_MPLOBBYLANGAME = {
		id = 310,
		name = "MPLobbyLANGame",
		title = "MENU_MULTIPLAYER_CAPS",
		kicker = "MENU_MULTIPLAYER",
		room = "mp",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = Dvar.ui_execdemo_gamescom:get() and 13 or 18,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_MP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_INVALID,
		lobbyTimerType = LuaEnums.TIMER_TYPE.MANUAL
	},
	UI_ZMLOBBYONLINE = {
		id = 400,
		name = "ZMLobbyOnline",
		title = "MENU_ZOMBIES_CAPS",
		kicker = "MENU_ZOMBIES",
		room = "zm",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL,
		lobbyTimerType = LuaEnums.TIMER_TYPE.NONE
	},
	UI_ZMLOBBYONLINEPUBLICGAME = {
		id = 401,
		name = "ZMLobbyOnlinePublicGame",
		title = "MENU_ZOMBIES_CAPS",
		kicker = "MPUI_PUBLIC_MATCH_LOBBY",
		room = "zm",
		isPrivate = true,
		isGame = true,
		isAdvertised = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST,
		lobbyTimerType = LuaEnums.TIMER_TYPE.AUTO_ZM
	},
	UI_ZMLOBBYONLINECUSTOMGAME = {
		id = 402,
		name = "ZMLobbyOnlineCustomGame",
		title = "MENU_CUSTOMGAMES_CAPS",
		kicker = "MENU_FILESHARE_CUSTOMGAMES",
		room = "zm",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL,
		lobbyTimerType = LuaEnums.TIMER_TYPE.MANUAL
	},
	UI_ZMLOBBYLANGAME = {
		id = 410,
		name = "ZMLobbyLANGame",
		title = "MENU_ZOMBIES_CAPS",
		kicker = "",
		room = "zm",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eGameModes = Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL,
		lobbyTimerType = LuaEnums.TIMER_TYPE.MANUAL
	},
	UI_THLOBBYONLINEGAME = {
		id = 500,
		name = "THLobbyOnline",
		title = "MENU_THEATER_CAPS",
		kicker = "",
		room = "room2",
		isPrivate = true,
		isGame = true,
		isAdvertised = false,
		maxClients = 6,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_THEATER,
		eGameModes = Enum.eGameModes.MODE_GAME_THEATER,
		lobbyTimerType = LuaEnums.TIMER_TYPE.THEATER
	},
	UI_MAIN = nil,
	UI_MAIN = REG1.UI_MAIN,
	UI_MODESELECT = REG1.UI_MAIN,
	UI_MODESELECT = REG1.UI_MODESELECT,
	UI_CPLOBBYLANGAME = REG1.UI_MODESELECT,
	UI_CPLOBBYLANGAME = REG1.UI_CPLOBBYLANGAME,
	UI_CPLOBBYONLINE = REG1.UI_MODESELECT,
	UI_CPLOBBYONLINE = REG1.UI_CPLOBBYONLINE,
	UI_CPLOBBYONLINEPUBLICGAME = REG1.UI_CPLOBBYONLINE,
	UI_CPLOBBYONLINEPUBLICGAME = REG1.UI_CPLOBBYONLINE,
	UI_CPLOBBYONLINECUSTOMGAME = REG1.UI_CPLOBBYONLINE,
	UI_CPLOBBYONLINECUSTOMGAME = REG1.UI_CPLOBBYONLINECUSTOMGAME,
	UI_CP2LOBBYLANGAME = REG1.UI_MODESELECT,
	UI_CP2LOBBYLANGAME = REG1.UI_CP2LOBBYLANGAME,
	UI_CP2LOBBYONLINE = REG1.UI_MODESELECT,
	UI_CP2LOBBYONLINE = REG1.UI_CP2LOBBYONLINE,
	UI_CP2LOBBYONLINEPUBLICGAME = REG1.UI_CP2LOBBYONLINE,
	UI_CP2LOBBYONLINEPUBLICGAME = REG1.UI_CP2LOBBYONLINE,
	UI_CP2LOBBYONLINECUSTOMGAME = REG1.UI_CP2LOBBYONLINE,
	UI_CP2LOBBYONLINECUSTOMGAME = REG1.UI_CP2LOBBYONLINECUSTOMGAME,
	UI_MPLOBBYLANGAME = REG1.UI_MODESELECT,
	UI_MPLOBBYLANGAME = REG1.UI_MODESELECT
}
if Dvar.ui_execdemo_beta:get() then
	uiTargets.UI_MPLOBBYONLINE.backTarget = uiTargets.UI_MAIN
	uiTargets.UI_MPLOBBYONLINE.errTarget = uiTargets.UI_MAIN
else
	uiTargets.UI_MPLOBBYONLINE.backTarget = uiTargets.UI_MODESELECT
	uiTargets.UI_MPLOBBYONLINE.errTarget = uiTargets.UI_MPLOBBYONLINE
end
uiTargets.UI_MPLOBBYONLINEPUBLICGAME.backTarget = uiTargets.UI_MPLOBBYONLINE
uiTargets.UI_MPLOBBYONLINEPUBLICGAME.errTarget = uiTargets.UI_MPLOBBYONLINE
uiTargets.UI_MPLOBBYONLINECUSTOMGAME.backTarget = uiTargets.UI_MPLOBBYONLINE
uiTargets.UI_MPLOBBYONLINECUSTOMGAME.errTarget = uiTargets.UI_MPLOBBYONLINECUSTOMGAME
uiTargets.UI_ZMLOBBYLANGAME.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_ZMLOBBYLANGAME.errTarget = uiTargets.UI_ZMLOBBYLANGAME
uiTargets.UI_ZMLOBBYONLINE.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_ZMLOBBYONLINE.errTarget = uiTargets.UI_ZMLOBBYONLINE
uiTargets.UI_ZMLOBBYONLINEPUBLICGAME.backTarget = uiTargets.UI_ZMLOBBYONLINE
uiTargets.UI_ZMLOBBYONLINEPUBLICGAME.errTarget = uiTargets.UI_ZMLOBBYONLINE
uiTargets.UI_ZMLOBBYONLINECUSTOMGAME.backTarget = uiTargets.UI_ZMLOBBYONLINE
uiTargets.UI_ZMLOBBYONLINECUSTOMGAME.errTarget = uiTargets.UI_ZMLOBBYONLINECUSTOMGAME
uiTargets.UI_THLOBBYONLINEGAME.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_THLOBBYONLINEGAME.errTarget = uiTargets.UI_MODESELECT
local sounds = {
	LobbyClosed = "uin_lobby_closed",
	ClientsAddedToLobby = "uin_lobby_enter",
	ClientsRemovedFromLobby = "uin_lobby_exit",
	TimerTick = "uin_timer",
	ESportsTimerTick = "uin_timer_esports_beep",
	ESportsTimerTickLast = "uin_timer_esports_last_beep"
}
lobbyData.InitLobbyNav = function ()
	local lobbyNav = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav", true )
	Engine.SetModelValue( lobbyNav, lobbyData.UITargets.UI_MAIN.id )
	local roomModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room", true )
	Engine.SetModelValue( roomModel, "room1" )
	if LUI then
		LUI.CoDMetrics.LobbyInit()
	end
end

lobbyData.GetLobbyNavModel = function ()
	return Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
end

lobbyData.GetLobbyNav = function ()
	local navModel = lobbyData.GetLobbyNavModel()
	return Engine.GetModelValue( navModel )
end

lobbyData.GetCurrentMenuTarget = function ()
	local currentMenuId = Engine.GetLobbyUIScreen()
	return LobbyData:UITargetFromId( currentMenuId )
end

lobbyData.SetLobbyNav = function ( target )
	local navModel = lobbyData.GetLobbyNavModel()
	if not navModel then
		lobbyData.InitLobbyNav()
		navModel = lobbyData.GetLobbyNavModel()
	end
	Engine.SetModelValue( navModel, target.id )
	local navTitleModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTitle" )
	Engine.SetModelValue( navTitleModel, target.title )
	local headingKickerModeModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" )
	local f5_local0 = Engine.SetModelValue
	local f5_local1 = headingKickerModeModel
	if target.kicker then
		local f5_local2 = target.kicker
		local f5_local3 = Engine.Localize( target.kicker )
	end
	f5_local0( f5_local1, f5_local2 and f5_local3 or "" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
end

lobbyData.UITargetFromName = function ( lobbyDataProxy, name )
	local uiTargets = lobbyDataProxy.UITargets._originalTable
	for k, v in pairs( uiTargets ) do
		if v.name == name then
			return REG7
		end
	end
	print( "Lobby VM: No valid ui target found for menu name: " .. name )
	return nil
end

lobbyData.UITargetFromId = function ( lobbyDataProxy, id )
	local uiTargets = lobbyDataProxy.UITargets._originalTable
	for k, v in pairs( uiTargets ) do
		if v.id == id then
			return REG7
		end
	end
	print( "Lobby VM: No valid ui target found for menu id: " .. id )
	return nil
end

lobbyData.PartyPrivacyToString = function ( enumValue )
	local privacy = "MENU_PARTY_PRIVACY_CLOSED"
	if enumValue == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		privacy = "MENU_PARTY_PRIVACY_OPEN"
	elseif enumValue == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		privacy = "MENU_PARTY_PRIVACY_FRIENDS_ONLY"
	elseif enumValue == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		privacy = "MENU_PARTY_PRIVACY_INVITE_ONLY"
	elseif enumValue == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		privacy = "MENU_PARTY_PRIVACY_CLOSED"
	end
	return Engine.Localize( privacy )
end

lobbyData.ButtonStates_ReevaluateDisabledState = function ()
	local model = Engine.GetModel( Engine.GetGlobalModel(), "ButtonStates.ReevaluateDisabledStates" )
	if model then
		local modelValue = Engine.GetModelValue( model )
		local newModelValue = not modelValue
		Engine.SetModelValue( model, newModelValue )
	end
end

lobbyData.Sounds = LuaReadOnlyTables.ReadOnlyTable( sounds )
lobbyData.UITargets = LuaReadOnlyTables.ReadOnlyTable( uiTargets )
LobbyData = LuaReadOnlyTables.ReadOnlyTable( lobbyData )
LobbyData.InitLobbyNav()
