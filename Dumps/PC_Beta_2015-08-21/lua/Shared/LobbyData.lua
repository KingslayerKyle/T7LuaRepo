require( "lua.Shared.LuaEnums" )
require( "lua.Shared.LuaUtils" )

local f0_local0 = {}
local f0_local1 = {
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
	}
}
f0_local1.UI_MAIN.backTarget = nil
f0_local1.UI_MAIN.errTarget = f0_local1.UI_MAIN
f0_local1.UI_MODESELECT.backTarget = f0_local1.UI_MAIN
f0_local1.UI_MODESELECT.errTarget = f0_local1.UI_MODESELECT
f0_local1.UI_CPLOBBYLANGAME.backTarget = f0_local1.UI_MODESELECT
f0_local1.UI_CPLOBBYLANGAME.errTarget = f0_local1.UI_CPLOBBYLANGAME
f0_local1.UI_CPLOBBYONLINE.backTarget = f0_local1.UI_MODESELECT
f0_local1.UI_CPLOBBYONLINE.errTarget = f0_local1.UI_CPLOBBYONLINE
f0_local1.UI_CPLOBBYONLINEPUBLICGAME.backTarget = f0_local1.UI_CPLOBBYONLINE
f0_local1.UI_CPLOBBYONLINEPUBLICGAME.errTarget = f0_local1.UI_CPLOBBYONLINE
f0_local1.UI_CPLOBBYONLINECUSTOMGAME.backTarget = f0_local1.UI_CPLOBBYONLINE
f0_local1.UI_CPLOBBYONLINECUSTOMGAME.errTarget = f0_local1.UI_CPLOBBYONLINECUSTOMGAME
f0_local1.UI_CP2LOBBYLANGAME.backTarget = f0_local1.UI_MODESELECT
f0_local1.UI_CP2LOBBYLANGAME.errTarget = f0_local1.UI_CP2LOBBYLANGAME
f0_local1.UI_CP2LOBBYONLINE.backTarget = f0_local1.UI_MODESELECT
f0_local1.UI_CP2LOBBYONLINE.errTarget = f0_local1.UI_CP2LOBBYONLINE
f0_local1.UI_CP2LOBBYONLINEPUBLICGAME.backTarget = f0_local1.UI_CP2LOBBYONLINE
f0_local1.UI_CP2LOBBYONLINEPUBLICGAME.errTarget = f0_local1.UI_CP2LOBBYONLINE
f0_local1.UI_CP2LOBBYONLINECUSTOMGAME.backTarget = f0_local1.UI_CP2LOBBYONLINE
f0_local1.UI_CP2LOBBYONLINECUSTOMGAME.errTarget = f0_local1.UI_CP2LOBBYONLINECUSTOMGAME
f0_local1.UI_MPLOBBYLANGAME.backTarget = f0_local1.UI_MODESELECT
f0_local1.UI_MPLOBBYLANGAME.errTarget = f0_local1.UI_MODESELECT
if Dvar.ui_execdemo_beta:get() then
	f0_local1.UI_MPLOBBYONLINE.backTarget = f0_local1.UI_MAIN
	f0_local1.UI_MPLOBBYONLINE.errTarget = f0_local1.UI_MAIN
else
	f0_local1.UI_MPLOBBYONLINE.backTarget = f0_local1.UI_MODESELECT
	f0_local1.UI_MPLOBBYONLINE.errTarget = f0_local1.UI_MPLOBBYONLINE
end
f0_local1.UI_MPLOBBYONLINEPUBLICGAME.backTarget = f0_local1.UI_MPLOBBYONLINE
f0_local1.UI_MPLOBBYONLINEPUBLICGAME.errTarget = f0_local1.UI_MPLOBBYONLINE
f0_local1.UI_MPLOBBYONLINECUSTOMGAME.backTarget = f0_local1.UI_MPLOBBYONLINE
f0_local1.UI_MPLOBBYONLINECUSTOMGAME.errTarget = f0_local1.UI_MPLOBBYONLINECUSTOMGAME
f0_local1.UI_ZMLOBBYLANGAME.backTarget = f0_local1.UI_MODESELECT
f0_local1.UI_ZMLOBBYLANGAME.errTarget = f0_local1.UI_ZMLOBBYLANGAME
f0_local1.UI_ZMLOBBYONLINE.backTarget = f0_local1.UI_MODESELECT
f0_local1.UI_ZMLOBBYONLINE.errTarget = f0_local1.UI_ZMLOBBYONLINE
f0_local1.UI_ZMLOBBYONLINEPUBLICGAME.backTarget = f0_local1.UI_ZMLOBBYONLINE
f0_local1.UI_ZMLOBBYONLINEPUBLICGAME.errTarget = f0_local1.UI_ZMLOBBYONLINE
f0_local1.UI_ZMLOBBYONLINECUSTOMGAME.backTarget = f0_local1.UI_ZMLOBBYONLINE
f0_local1.UI_ZMLOBBYONLINECUSTOMGAME.errTarget = f0_local1.UI_ZMLOBBYONLINECUSTOMGAME
f0_local1.UI_THLOBBYONLINEGAME.backTarget = f0_local1.UI_MODESELECT
f0_local1.UI_THLOBBYONLINEGAME.errTarget = f0_local1.UI_MODESELECT
local f0_local2 = {
	LobbyClosed = "uin_lobby_closed",
	ClientsAddedToLobby = "uin_lobby_enter",
	ClientsRemovedFromLobby = "uin_lobby_exit",
	TimerTick = "uin_timer",
	ESportsTimerTick = "uin_timer_esports_beep",
	ESportsTimerTickLast = "uin_timer_esports_last_beep"
}
f0_local0.InitLobbyNav = function ()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav", true ), f0_local0.UITargets.UI_MAIN.id )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room", true ), "room1" )
	if LUI then
		LUI.CoDMetrics.LobbyInit()
	end
end

f0_local0.GetLobbyNavModel = function ()
	return Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
end

f0_local0.GetLobbyNav = function ()
	return Engine.GetModelValue( f0_local0.GetLobbyNavModel() )
end

f0_local0.GetCurrentMenuTarget = function ()
	return LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
end

f0_local0.SetLobbyNav = function ( f5_arg0 )
	local f5_local0 = f0_local0.GetLobbyNavModel()
	if not f5_local0 then
		f0_local0.InitLobbyNav()
		f5_local0 = f0_local0.GetLobbyNavModel()
	end
	Engine.SetModelValue( f5_local0, f5_arg0.id )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTitle" ), f5_arg0.title )
	local f5_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" )
	local f5_local2 = Engine.SetModelValue
	local f5_local3 = f5_local1
	if f5_arg0.kicker then
		local f5_local4 = f5_arg0.kicker
		local f5_local5 = Engine.Localize( f5_arg0.kicker )
	end
	f5_local2( f5_local3, f5_local4 and f5_local5 or "" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
end

f0_local0.UITargetFromName = function ( f6_arg0, f6_arg1 )
	for f6_local3, f6_local4 in pairs( f6_arg0.UITargets._originalTable ) do
		if f6_local4.name == f6_arg1 then
			return f6_local4
		end
	end
	print( "Lobby VM: No valid ui target found for menu name: " .. f6_arg1 )
	return nil
end

f0_local0.UITargetFromId = function ( f7_arg0, f7_arg1 )
	for f7_local3, f7_local4 in pairs( f7_arg0.UITargets._originalTable ) do
		if f7_local4.id == f7_arg1 then
			return f7_local4
		end
	end
	print( "Lobby VM: No valid ui target found for menu id: " .. f7_arg1 )
	return nil
end

f0_local0.PartyPrivacyToString = function ( f8_arg0 )
	local f8_local0 = "MENU_PARTY_PRIVACY_CLOSED"
	if f8_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_OPEN then
		f8_local0 = "MENU_PARTY_PRIVACY_OPEN"
	elseif f8_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY then
		f8_local0 = "MENU_PARTY_PRIVACY_FRIENDS_ONLY"
	elseif f8_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY then
		f8_local0 = "MENU_PARTY_PRIVACY_INVITE_ONLY"
	elseif f8_arg0 == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
		f8_local0 = "MENU_PARTY_PRIVACY_CLOSED"
	end
	return Engine.Localize( f8_local0 )
end

f0_local0.ButtonStates_ReevaluateDisabledState = function ()
	local f9_local0 = Engine.GetModel( Engine.GetGlobalModel(), "ButtonStates.ReevaluateDisabledStates" )
	if f9_local0 then
		Engine.SetModelValue( f9_local0, not Engine.GetModelValue( f9_local0 ) )
	end
end

f0_local0.Sounds = LuaReadOnlyTables.ReadOnlyTable( f0_local2 )
f0_local0.UITargets = LuaReadOnlyTables.ReadOnlyTable( f0_local1 )
LobbyData = LuaReadOnlyTables.ReadOnlyTable( f0_local0 )
LobbyData.InitLobbyNav()
