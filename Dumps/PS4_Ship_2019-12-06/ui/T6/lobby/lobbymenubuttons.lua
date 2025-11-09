require( "lua.Shared.LobbyData" )

CoD.LobbyButtons = {}
CoD.LobbyButtons.DISABLED = 1
CoD.LobbyButtons.HIDDEN = 2
local f0_local0 = function ( f1_arg0 )
	return Engine.GetMostRecentPlayedMode( Engine.GetPrimaryController() ) == f1_arg0
end

local f0_local1 = function ()
	return Engine.IsMpInitialStillDownloading()
end

local f0_local2 = function ()
	local f3_local0 = Engine.IsMpInitialStillDownloading()
	if not f3_local0 then
		f3_local0 = Engine.IsMpStillDownloading()
	end
	return f3_local0
end

local f0_local3 = function ()
	return Engine.IsZmInitialStillDownloading()
end

local f0_local4 = function ()
	local f5_local0 = Engine.IsZmInitialStillDownloading()
	if not f5_local0 then
		f5_local0 = Engine.IsZmStillDownloading()
	end
	return f5_local0
end

local f0_local5 = function ()
	return Engine.IsCpStillDownloading()
end

local f0_local6 = function ()
	return Engine.IsCpStillDownloading()
end

local f0_local7 = function ()
	local f8_local0 = Engine.IsCpStillDownloading()
	if not f8_local0 then
		f8_local0 = Engine.IsZmStillDownloading()
		if not f8_local0 then
			f8_local0 = Engine.IsMpStillDownloading()
		end
	end
	return f8_local0
end

local f0_local8 = function ()
	return Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) > 1
end

local f0_local9 = function ()
	if MapVoteTimerActive() then
		return true
	elseif Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_SPLITSCREEN_ALL ) > 0 and CompetitiveSettingsEnabled() then
		return true
	else
		return false
	end
end

CoD.LobbyButtons.CP_ONLINE = {
	stringRef = "MENU_SINGLEPLAYER_CAPS",
	action = NavigateCheckForFirstTime,
	param = {
		targetName = "CPLobbyOnline",
		mode = Enum.eModes.MODE_CAMPAIGN,
		firstTimeFlowAction = OpenCPFirstTimeFlow
	},
	customId = "btnCP",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_CAMPAIGN,
	starterPack = CoD.LobbyButtons.HIDDEN,
	disabledFunc = f0_local5
}
CoD.LobbyButtons.CP_LAN = {
	stringRef = "MENU_SINGLEPLAYER_CAPS",
	action = NavigateCheckForFirstTime,
	param = {
		targetName = "CPLobbyLANGame",
		mode = Enum.eModes.MODE_CAMPAIGN,
		firstTimeFlowAction = OpenCPFirstTimeFlow
	},
	customId = "btnCP",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_CAMPAIGN,
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = f0_local5
}
CoD.LobbyButtons.CPZM_ONLINE = {
	stringRef = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
	action = NavigateToLobby_SelectionListCampaignZombies,
	param = {
		targetName = "CP2LobbyOnline",
		mode = Enum.eModes.MODE_CAMPAIGN,
		firstTimeFlowAction = OpenCPFirstTimeFlow
	},
	customId = "btnCPZM",
	disabledFunc = f0_local6,
	visibleFunc = ShouldShowNightmares
}
CoD.LobbyButtons.CPZM_LAN = {
	stringRef = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
	action = NavigateToLobby_SelectionListCampaignZombies,
	param = {
		targetName = "CP2LobbyLANGame",
		mode = Enum.eModes.MODE_CAMPAIGN,
		firstTimeFlowAction = OpenCPFirstTimeFlow
	},
	customId = "btnCPZM",
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = f0_local6,
	visibleFunc = ShouldShowNightmares
}
CoD.LobbyButtons.MP_ONLINE = {
	stringRef = "MENU_MULTIPLAYER_CAPS",
	action = NavigateCheckForFirstTime,
	param = {
		targetName = "MPLobbyMain",
		mode = Enum.eModes.MODE_MULTIPLAYER,
		firstTimeFlowAction = OpenMPFirstTimeFlow
	},
	customId = "btnMP",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	disabledFunc = f0_local2
}
CoD.LobbyButtons.MP_PUBLIC_MATCH = {
	stringRef = "MENU_MATCHMAKING_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyOnline",
	customId = "btnPublicMatch",
	disabledFunc = f0_local2
}
CoD.LobbyButtons.MP_ARENA = {
	stringRef = "MENU_ARENA_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyOnlineArena",
	customId = "btnArena"
}
CoD.LobbyButtons.MP_LAN = {
	stringRef = "MENU_MULTIPLAYER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyLANGame",
	customId = "btnMP",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = f0_local2
}
CoD.LobbyButtons.ZM_ONLINE = {
	stringRef = "MENU_ZOMBIES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyOnline",
	customId = "btnZM",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_ZOMBIES,
	disabledFunc = f0_local4
}
CoD.LobbyButtons.ZM_LAN = {
	stringRef = "MENU_ZOMBIES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyLANGame",
	customId = "btnZM",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_ZOMBIES,
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = f0_local3
}
CoD.LobbyButtons.FR_LAN = {
	stringRef = "MENU_FREERUN_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "FRLobbyLANGame",
	customId = "btnFRLan",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	disabledFunc = f0_local1
}
CoD.LobbyButtons.THEATER_MP = {
	stringRef = "MENU_THEATER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyOnlineTheater",
	customId = "btnTheater",
	disabledFunc = AlwaysTrue
}
CoD.LobbyButtons.THEATER_ZM = {
	stringRef = "MENU_THEATER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyOnlineTheater",
	customId = "btnTheater",
	disabledFunc = AlwaysTrue
}
CoD.LobbyButtons.GROUPS = {
	stringRef = "GROUPS_CAPS",
	action = OpenGroups,
	customId = "btnGroups"
}
CoD.LobbyButtons.PLAY_LOCAL = {
	stringRef = "MENU_PLAY_LOCAL_CAPS",
	action = OpenLobbyToggleNetworkConfirmation,
	customId = "btnPlayLocal"
}
CoD.LobbyButtons.PLAY_ONLINE = {
	stringRef = "XBOXLIVE_PLAY_ONLINE_CAPS",
	action = OpenLobbyToggleNetworkConfirmation,
	customId = "btnPlayLocal",
	disabledFunc = CoD.LobbyBase.ChunkAllDownloading
}
CoD.LobbyButtons.STORE = {
	stringRef = "MENU_STORE_CAPS",
	action = OpenStore,
	customId = "btnStore",
	param = "StoreButton",
	disabledFunc = DisableStore
}
CoD.LobbyButtons.STEAM_STORE = {
	stringRef = "MENU_STORE_CAPS",
	action = OpenSteamStore,
	customId = "btnSteamStore",
	param = "StoreButton",
	disabledFunc = DisableSteamStore
}
CoD.LobbyButtons.FIND_LAN_GAME = {
	stringRef = "PLATFORM_FIND_LAN_GAME",
	action = OpenFindLANGame,
	customId = "btnFindGame"
}
CoD.LobbyButtons.QUIT = {
	stringRef = "MENU_QUIT_CAPS",
	action = OpenPCQuit,
	customId = "btnQuit"
}
CoD.LobbyButtons.BLACK_MARKET = {
	stringRef = "MENU_BLACK_MARKET",
	action = OpenBlackMarket,
	customId = "btnBlackMarket",
	disabledFunc = DisableBlackMarket
}
CoD.LobbyButtons.CP_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = StartNewGame,
	customId = "btnStartMatch"
}
CoD.LobbyButtons.CP_LAN_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = StartNewGame,
	customId = "btnStartMatch"
}
CoD.LobbyButtons.CP_RESUME_GAME = {
	stringRef = "MENU_RESUMESTORY_CAPS",
	action = ResumeFromCheckpoint,
	customId = "btnResumeGame"
}
CoD.LobbyButtons.CP_GOTO_SAFEHOUSE = {
	stringRef = "MENU_GOTO_SAFEHOUSE_CAPS",
	action = GotoSafehouse,
	customId = "btnGotoSafehouse"
}
CoD.LobbyButtons.CP_RESUME_GAME_LAN = {
	stringRef = "MENU_RESUMESTORY_CAPS",
	action = ResumeFromCheckpoint,
	customId = "btnResumeGame"
}
CoD.LobbyButtons.CP_LAN_REPLAY_MISSION = {
	stringRef = "MENU_REPLAY_MISSION_CAPS",
	action = ReplaySelectedMission,
	customId = "btnReplayMission"
}
CoD.LobbyButtons.CP_JOIN_PUBLIC_GAME = {
	stringRef = "MENU_JOIN_PUBLIC_GAME_CAPS",
	action = OpenPublicGameSelect,
	customId = "btnJoinPublicGame"
}
CoD.LobbyButtons.CP_MISSION_OVERVIEW = {
	stringRef = "MENU_MISSION_OVERVIEW_CAP",
	action = OpenMissionOverview,
	customId = "btnMissionOverview"
}
CoD.LobbyButtons.CP_SELECT_MISSION = {
	stringRef = "MENU_SELECT_MISSION_CAPS",
	action = OpenMissionSelect,
	customId = "btnSelectMission",
	disabledFunc = GrayOutReplayMissionButton
}
CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY = {
	stringRef = "MENU_CHANGE_DIFFICULTY_CAPS",
	action = OpenDifficultySelect,
	customId = "btnChooseDifficulty"
}
CoD.LobbyButtons.CP_CUSTOM_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyOnlineCustomLaunchGame_SelectionList,
	customId = "btnStartGame"
}
CoD.LobbyButtons.CPZM_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = StartNewGame,
	customId = "btnStartMatch"
}
CoD.LobbyButtons.CPZM_RESUME_GAME = {
	stringRef = "MENU_RESUMESTORY_CAPS",
	action = ResumeFromCheckpoint,
	customId = "btnResumeGame"
}
CoD.LobbyButtons.CPZM_FIND_MATCH = {
	stringRef = "MPUI_FIND_MATCH_CAPS",
	action = OpenFindMatch,
	customId = "btnFindMatch"
}
CoD.LobbyButtons.CPZM_SELECT_MISSION = {
	stringRef = "MENU_SELECT_MISSION_CAPS",
	action = OpenMissionSelect,
	customId = "btnSelectMission",
	disabledFunc = GrayOutReplayMissionButton,
	demo_CP = CoD.LobbyButtons.HIDDEN
}
CoD.LobbyButtons.MP_FIND_MATCH = {
	stringRef = "MPUI_FIND_MATCH_CAPS",
	action = OpenFindMatch,
	customId = "btnFindMatch",
	disabledFunc = f0_local2
}
CoD.LobbyButtons.MP_CUSTOM_GAMES = {
	stringRef = "MENU_CUSTOMGAMES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyOnlineCustomGame",
	customId = "btnCustomMatch",
	starterPack = CoD.LobbyButtons.HIDDEN
}
CoD.LobbyButtons.MP_CAC = {
	stringRef = "MENU_CREATE_A_CLASS_CAPS",
	action = OpenCAC,
	customId = "btnCAC",
	newBreadcrumbFunc = IsCACAnythingInCACItemNew
}
CoD.LobbyButtons.MP_SPECIALISTS = {
	stringRef = "MPUI_HEROES_CAPS",
	action = OpenChooseCharacterLoadout,
	customId = "btnSpecialists",
	newBreadcrumbFunc = IsCACAnySpecialistsNew
}
CoD.LobbyButtons.MP_SCORESTREAKS = {
	stringRef = "MENU_SCORE_STREAKS_CAPS",
	action = OpenScorestreaks,
	customId = "btnScorestreaks",
	newBreadcrumbFunc = IsCACAnyScorestreaksNew
}
CoD.LobbyButtons.MP_CODCASTER_SETTINGS = {
	stringRef = "CODCASTER_CAPS",
	action = OpenEditCodcasterSettings,
	customId = "btnCodcasterSettings",
	disabledFunc = ShouldDisableEditCodCasterSettingsButton,
	visibleFunc = ShouldShowEditCodCasterSettingsButton
}
CoD.LobbyButtons.MP_INVENTORY_TEST = {
	stringRef = "DW Inventory Test",
	action = OpenTest,
	customId = "btnInventoryTest"
}
CoD.LobbyButtons.MP_LOBBY_LEADERBOARD = {
	stringRef = "MENU_CUSTOM_LOBBY_LEADERBOARDS_CAPS",
	action = LobbyNoAction,
	customId = "btnLobbyLeaderboard"
}
CoD.LobbyButtons.MP_CUSTOM_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyOnlineCustomLaunchGame_SelectionList,
	customId = "btnStartGame",
	disabledFunc = f0_local9
}
CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME = {
	stringRef = "MPUI_SETUP_GAME_CAPS",
	action = OpenSetupGameMP,
	customId = "btnSetupGame",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.MP_ARENA_FIND_MATCH = {
	stringRef = "MENU_FIND_ARENA_MATCH_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyOnlineArenaGame",
	customId = "btnArenaFindMatch",
	disabledFunc = f0_local2
}
CoD.LobbyButtons.MP_ARENA_SELECT_ARENA = {
	stringRef = "MENU_SELECT_ARENA_CAPS",
	action = OpenCompetitivePlaylist,
	customId = "btnSelectArena",
	disabledFunc = f0_local2
}
CoD.LobbyButtons.FR_ONLINE = {
	stringRef = "MENU_FREERUN_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "FRLobbyOnlineGame",
	customId = "btnFROnline"
}
CoD.LobbyButtons.ZM_SOLO_GAME = {
	stringRef = "MENU_SOLO_GAME_CAPS",
	action = OpenZMMapSelectLaunch,
	customId = "btnSoloMatch",
	disabledFunc = f0_local8
}
CoD.LobbyButtons.ZM_FIND_MATCH = {
	stringRef = "MENU_JOIN_PUBLIC_GAME_CAPS",
	action = OpenZMFindMatch,
	customId = "btnFindMatch"
}
CoD.LobbyButtons.ZM_CUSTOM_GAMES = {
	stringRef = "MENU_PRIVATE_GAME_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyOnlineCustomGame",
	customId = "btnCustomMatch"
}
CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS = {
	stringRef = "MENU_BUBBLEGUM_BUFFS_CAPS",
	action = OpenBubbleGumPacksMenu,
	customId = "btnBubblegumBuffs"
}
CoD.LobbyButtons.ZM_MEGACHEW_FACTORY = {
	stringRef = "MENU_MEGACHEW_FACTORY_CAPS",
	action = OpenMegaChewFactorymenu,
	customId = "btnMegaChewFactory"
}
CoD.LobbyButtons.ZM_BUILD_KITS = {
	stringRef = "MENU_WEAPON_BUILD_KITS_CAPS",
	action = OpenWeaponBuildKits,
	customId = "btnWeaponBuildKits"
}
CoD.LobbyButtons.ZM_LOBBY_LEADERBOARD = {
	stringRef = "MENU_LOBBY_LEADERBOARD_CAPS",
	action = LobbyNoAction,
	customId = "btnLobbyLeaderboard"
}
CoD.LobbyButtons.ZM_START_CUSTOM_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyOnlineCustomLaunchGame_SelectionList,
	customId = "btnStartCustomGame",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.ZM_START_LAN_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyLANLaunchGame,
	customId = "btnStartLanGame",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.ZM_CHANGE_MAP = {
	stringRef = "MPUI_CHANGE_MAP_CAPS",
	action = OpenChangeMapZM,
	customId = "btnChangeMap",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.FR_START_RUN_ONLINE = {
	stringRef = "MENU_START_RUN_CAPS",
	action = LobbyOnlineCustomLaunchGame_SelectionList,
	customId = "btnStartRun",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.FR_START_RUN_LAN = {
	stringRef = "MENU_START_RUN_CAPS",
	action = LobbyLANLaunchGame,
	customId = "btnStartRun",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.FR_CHANGE_MAP = {
	stringRef = "MENU_FREERUN_COURSES_CAPS",
	action = OpenFreerunMapSelection,
	customId = "btnChangeMap",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.TH_START_FILM = {
	stringRef = "MPUI_START_FILM_CAPS",
	action = LobbyTheaterStartFilm,
	customId = "btnStartFilm",
	disabledFunc = IsStartFilmButtonDisabled
}
CoD.LobbyButtons.TH_SELECT_FILM = {
	stringRef = "MENU_FILESHARE_SELECT_FILM_CAPS",
	action = OpenTheaterSelectFilm,
	customId = "btnSelectFilm",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.TH_CREATE_HIGHLIGHT = {
	stringRef = "MPUI_CREATE_HIGHLIGHT_CAPS",
	action = LobbyTheaterCreateHighlightReel,
	customId = "btnCreateHighlightReel",
	disabledFunc = IsCreateHighlightReelButtonDisabled
}
CoD.LobbyButtons.TH_SHOUTCAST = {
	stringRef = "MPUI_SHOUTCAST_FILM_CAPS",
	action = LobbyTheaterShoutcastFilm,
	customId = "btnCoDCastFilm",
	disabledFunc = IsShoutcastFilmButtonDisabled
}
CoD.LobbyButtons.TH_RENDER = {
	stringRef = "MENU_DEMO_RENDER_CLIP_CAPS",
	customId = "btnRenderVideo",
	disabledFunc = AlwaysTrue
}
CoD.LobbyButtons.TH_OPTIONS = {
	stringRef = "MENU_FILM_OPTIONS",
	customId = "btnFilmOptions",
	disabledFunc = AlwaysTrue
}
