require( "lua.Shared.LuaUtils" )

local lobbyData = {
	EMODE_INVALID = -1,
	EMODE_PUBLIC_MATCH = 0,
	EMODE_PRIVATE_MATCH = 1,
	EMODE_THEATER = 4,
	TIMER_TYPE_INVALID = 0,
	TIMER_TYPE_NONE = 1,
	TIMER_TYPE_AUTO = 2,
	TIMER_TYPE_MANUAL = 3,
	TIMER_TYPE_READYUP = 4,
	TIMER_TYPE_THEATER = 5,
	LEAVE_WITH_PARTY_WITHOUT = 0,
	LEAVE_WITH_PARTY_WITH = 1,
	MAP_VOTE_STATE_HIDDEN = 0,
	MAP_VOTE_STATE_VOTING = 1,
	MAP_VOTE_STATE_LOCKEDIN = 2
}
local uiTargets = {
	UI_MAIN = {
		id = 0,
		name = "Main",
		title = "",
		room = "room1",
		isPrivate = false,
		isGame = false,
		maxClients = 0,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_INVALID,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_INVALID,
		eMode = lobbyData.EMODE_INVALID,
		lobbyTimerType = lobbyData.TIMER_TYPE_INVALID
	},
	UI_MODESELECT = {
		id = 1,
		name = "ModeSelect",
		title = "",
		room = "room2",
		isPrivate = true,
		isGame = false,
		maxClients = 18,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_INVALID,
		eMode = lobbyData.EMODE_INVALID,
		lobbyTimerType = lobbyData.TIMER_TYPE_INVALID
	},
	UI_CPLOBBYONLINE = {
		id = 100,
		name = "CPLobbyOnline",
		title = "MENU_CAMPAIGN_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PRIVATE_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_NONE
	},
	UI_CPLOBBYONLINEPUBLIC = {
		id = 101,
		name = "CPLobbyOnlinePublic",
		title = "MENU_CAMPAIGN_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PUBLIC_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_INVALID
	},
	UI_CPLOBBYONLINEPUBLICGAME = {
		id = 102,
		name = "CPLobbyOnlinePublicGame",
		title = "MENU_CAMPAIGN_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PUBLIC_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_NONE
	},
	UI_CPLOBBYONLINECUSTOMGAME = {
		id = 103,
		name = "CPLobbyOnlineCustomGame",
		title = "MENU_CUSTOMGAMES_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eMode = lobbyData.EMODE_PRIVATE_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_NONE
	},
	UI_CPLOBBYLANGAME = {
		id = 110,
		name = "CPLobbyLANGame",
		title = "MENU_CAMPAIGN_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eMode = lobbyData.EMODE_INVALID,
		lobbyTimerType = lobbyData.TIMER_TYPE_MANUAL
	},
	UI_CP2LOBBYONLINE = {
		id = 200,
		name = "CP2LobbyOnline",
		title = "MENU_CAMPAIGN_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PRIVATE_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_NONE
	},
	UI_CP2LOBBYONLINEPUBLIC = {
		id = 201,
		name = "CP2LobbyOnlinePublic",
		title = "MENU_CAMPAIGN_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = false,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PUBLIC_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_INVALID
	},
	UI_CP2LOBBYONLINEPUBLICGAME = {
		id = 202,
		name = "CP2LobbyOnlinePublicGame",
		title = "MENU_CAMPAIGN_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PUBLIC_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_NONE
	},
	UI_CP2LOBBYONLINECUSTOMGAME = {
		id = 203,
		name = "CP2LobbyOnlineCustomGame",
		title = "MENU_CUSTOMGAMES_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eMode = lobbyData.EMODE_PRIVATE_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_NONE
	},
	UI_CP2LOBBYLANGAME = {
		id = 210,
		name = "CP2LobbyLANGame",
		title = "MENU_CAMPAIGN_CAPS",
		room = "cp",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_CP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eMode = lobbyData.EMODE_INVALID,
		lobbyTimerType = lobbyData.TIMER_TYPE_MANUAL
	},
	UI_MPLOBBYONLINE = {
		id = 300,
		name = "MPLobbyOnline",
		title = "MENU_MULTIPLAYER_CAPS",
		room = "mp",
		isPrivate = true,
		isGame = false,
		maxClients = 18,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_MP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PUBLIC_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_INVALID
	},
	UI_MPLOBBYONLINEPUBLICGAME = {
		id = 301,
		name = "MPLobbyOnlinePublicGame",
		title = "MENU_MULTIPLAYER_CAPS",
		room = "mp",
		isPrivate = true,
		isGame = true,
		maxClients = 12,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_MP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PUBLIC_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_AUTO
	},
	UI_MPLOBBYONLINECUSTOMGAME = {
		id = 302,
		name = "MPLobbyOnlineCustomGame",
		title = "MENU_CUSTOMGAMES_CAPS",
		room = "mp",
		isPrivate = true,
		isGame = true,
		maxClients = 18,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_MP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eMode = lobbyData.EMODE_PRIVATE_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_MANUAL
	},
	UI_MPLOBBYLANGAME = {
		id = 310,
		name = "MPLobbyLANGame",
		title = "MENU_MULTIPLAYER_CAPS",
		room = "mp",
		isPrivate = true,
		isGame = true,
		maxClients = 18,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_MP,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eMode = lobbyData.EMODE_INVALID,
		lobbyTimerType = lobbyData.TIMER_TYPE_MANUAL
	},
	UI_ZMLOBBYONLINE = {
		id = 400,
		name = "ZMLobbyOnline",
		title = "MENU_ZOMBIES_CAPS",
		room = "zm",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PRIVATE_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_NONE
	},
	UI_ZMLOBBYONLINEPUBLICGAME = {
		id = 401,
		name = "ZMLobbyOnlinePublicGame",
		title = "MENU_ZOMBIES_CAPS",
		room = "zm",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_PUBLIC,
		eMode = lobbyData.EMODE_PUBLIC_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_AUTO
	},
	UI_ZMLOBBYONLINECUSTOMGAME = {
		id = 402,
		name = "ZMLobbyOnlineCustomGame",
		title = "MENU_CUSTOMGAMES_CAPS",
		room = "zm",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eMode = lobbyData.EMODE_PRIVATE_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_MANUAL
	},
	UI_ZMLOBBYLANGAME = {
		id = 410,
		name = "ZMLobbyLANGame",
		title = "MENU_ZOMBIES_CAPS",
		room = "zm",
		isPrivate = true,
		isGame = true,
		maxClients = 4,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_CUSTOM,
		eMode = lobbyData.EMODE_PRIVATE_MATCH,
		lobbyTimerType = lobbyData.TIMER_TYPE_MANUAL
	},
	UI_THLOBBYONLINEGAME = {
		id = 500,
		name = "THLobbyOnline",
		title = "MENU_THEATER_CAPS",
		room = "room2",
		isPrivate = true,
		isGame = true,
		maxClients = 6,
		mainMode = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID,
		networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyMode = Enum.LobbyMode.LOBBY_MODE_THEATER,
		eMode = lobbyData.EMODE_THEATER,
		lobbyTimerType = lobbyData.TIMER_TYPE_THEATER
	}
}
uiTargets.UI_MAIN.backTarget = nil
uiTargets.UI_MAIN.errTarget = uiTargets.UI_MAIN
uiTargets.UI_MODESELECT.backTarget = uiTargets.UI_MAIN
uiTargets.UI_MODESELECT.errTarget = uiTargets.UI_MODESELECT
uiTargets.UI_CPLOBBYLANGAME.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_CPLOBBYLANGAME.errTarget = uiTargets.UI_CPLOBBYLANGAME
uiTargets.UI_CPLOBBYONLINE.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_CPLOBBYONLINE.errTarget = uiTargets.UI_CPLOBBYONLINE
uiTargets.UI_CPLOBBYONLINEPUBLIC.backTarget = uiTargets.UI_CPLOBBYONLINE
uiTargets.UI_CPLOBBYONLINEPUBLIC.errTarget = uiTargets.UI_CPLOBBYONLINEPUBLIC
uiTargets.UI_CPLOBBYONLINEPUBLICGAME.backTarget = uiTargets.UI_CPLOBBYONLINEPUBLIC
uiTargets.UI_CPLOBBYONLINEPUBLICGAME.errTarget = uiTargets.UI_CPLOBBYONLINEPUBLIC
uiTargets.UI_CPLOBBYONLINECUSTOMGAME.backTarget = uiTargets.UI_CPLOBBYONLINE
uiTargets.UI_CPLOBBYONLINECUSTOMGAME.errTarget = uiTargets.UI_CPLOBBYONLINE
uiTargets.UI_CP2LOBBYLANGAME.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_CP2LOBBYLANGAME.errTarget = uiTargets.UI_CPLOBBYLANGAME
uiTargets.UI_CP2LOBBYONLINE.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_CP2LOBBYONLINE.errTarget = uiTargets.UI_CPLOBBYONLINE
uiTargets.UI_CP2LOBBYONLINEPUBLIC.backTarget = uiTargets.UI_CPLOBBYONLINE
uiTargets.UI_CP2LOBBYONLINEPUBLIC.errTarget = uiTargets.UI_CPLOBBYONLINEPUBLIC
uiTargets.UI_CP2LOBBYONLINEPUBLICGAME.backTarget = uiTargets.UI_CPLOBBYONLINEPUBLIC
uiTargets.UI_CP2LOBBYONLINEPUBLICGAME.errTarget = uiTargets.UI_CPLOBBYONLINEPUBLIC
uiTargets.UI_CP2LOBBYONLINECUSTOMGAME.backTarget = uiTargets.UI_CPLOBBYONLINE
uiTargets.UI_CP2LOBBYONLINECUSTOMGAME.errTarget = uiTargets.UI_CPLOBBYONLINE
uiTargets.UI_MPLOBBYLANGAME.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_MPLOBBYLANGAME.errTarget = uiTargets.UI_MPLOBBYLANGAME
uiTargets.UI_MPLOBBYONLINE.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_MPLOBBYONLINE.errTarget = uiTargets.UI_MPLOBBYONLINE
uiTargets.UI_MPLOBBYONLINEPUBLICGAME.backTarget = uiTargets.UI_MPLOBBYONLINE
uiTargets.UI_MPLOBBYONLINEPUBLICGAME.errTarget = uiTargets.UI_MPLOBBYONLINE
uiTargets.UI_MPLOBBYONLINECUSTOMGAME.backTarget = uiTargets.UI_MPLOBBYONLINE
uiTargets.UI_MPLOBBYONLINECUSTOMGAME.errTarget = uiTargets.UI_MPLOBBYONLINE
uiTargets.UI_ZMLOBBYLANGAME.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_ZMLOBBYLANGAME.errTarget = uiTargets.UI_ZMLOBBYLANGAME
uiTargets.UI_ZMLOBBYONLINE.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_ZMLOBBYONLINE.errTarget = uiTargets.UI_ZMLOBBYONLINE
uiTargets.UI_ZMLOBBYONLINEPUBLICGAME.backTarget = uiTargets.UI_ZMLOBBYONLINE
uiTargets.UI_ZMLOBBYONLINEPUBLICGAME.errTarget = uiTargets.UI_ZMLOBBYONLINE
uiTargets.UI_ZMLOBBYONLINECUSTOMGAME.backTarget = uiTargets.UI_ZMLOBBYONLINE
uiTargets.UI_ZMLOBBYONLINECUSTOMGAME.errTarget = uiTargets.UI_ZMLOBBYONLINE
uiTargets.UI_THLOBBYONLINEGAME.backTarget = uiTargets.UI_MODESELECT
uiTargets.UI_THLOBBYONLINEGAME.errTarget = uiTargets.UI_MODESELECT
local sounds = {
	LobbyClosed = "uin_lobby_closed",
	ClientsAddedToLobby = "uin_lobby_enter",
	ClientsRemovedFromLobby = "uin_lobby_exit",
	TimerTick = "uin_timer"
}
lobbyData.InitLobbyNav = function ()
	local lobbyNav = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	Engine.SetModelValue( lobbyNav, lobbyData.UITargets.UI_MAIN.id )
end

lobbyData.GetLobbyNavModel = function ()
	return Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
end

lobbyData.GetLobbyNav = function ()
	local navModel = lobbyData.GetLobbyNavModel()
	return Engine.GetModelValue( navModel )
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
end

lobbyData.UITargetFromName = function ( lobbyDataProxy, name )
	local uiTargets = lobbyDataProxy.UITargets._originalTable
	for k, v in pairs( uiTargets ) do
		if v.name == name then
			return v
		end
	end
	print( "Lobby VM: No valid ui target found for menu name: " .. name )
	return nil
end

lobbyData.UITargetFromId = function ( lobbyDataProxy, id )
	local uiTargets = lobbyDataProxy.UITargets._originalTable
	for k, v in pairs( uiTargets ) do
		if v.id == id then
			return v
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

lobbyData.Sounds = LuaUtils.ReadOnlyTable( sounds )
lobbyData.UITargets = LuaUtils.ReadOnlyTable( uiTargets )
LobbyData = LuaUtils.ReadOnlyTable( lobbyData )
