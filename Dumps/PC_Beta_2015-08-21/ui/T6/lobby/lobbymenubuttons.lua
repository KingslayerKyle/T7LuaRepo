require( "lua.Shared.LobbyData" )

CoD.LobbyButtons = {}
CoD.LobbyButtons.DISABLED = 1
CoD.LobbyButtons.HIDDEN = 2
local f0_local0 = function ( f1_arg0 )
	return Engine.GetMostRecentPlayedMode( Engine.GetPrimaryController() ) == f1_arg0
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
	starterPack = CoD.LobbyButtons.HIDDEN
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
	demo_gamescom = CoD.LobbyButtons.HIDDEN
}
CoD.LobbyButtons.CPZM_ONLINE = {
	stringRef = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
	action = NavigateToLobby_SelectionListCampaignZombies,
	param = "CP2LobbyOnline",
	customId = "btnCPZM"
}
CoD.LobbyButtons.CPZM_LAN = {
	stringRef = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
	action = NavigateToLobby_SelectionListCampaignZombies,
	param = "CP2LobbyLANGame",
	customId = "btnCPZM",
	demo_gamescom = CoD.LobbyButtons.HIDDEN
}
CoD.LobbyButtons.MP_ONLINE = {
	stringRef = "MENU_MULTIPLAYER_CAPS",
	action = NavigateCheckForFirstTime,
	param = {
		targetName = "MPLobbyOnline",
		mode = Enum.eModes.MODE_MULTIPLAYER,
		firstTimeFlowAction = OpenMPFirstTimeFlow
	},
	customId = "btnMP",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER
}
CoD.LobbyButtons.MP_LAN = {
	stringRef = "MENU_MULTIPLAYER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyLANGame",
	customId = "btnMP",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	demo_gamescom = CoD.LobbyButtons.HIDDEN
}
CoD.LobbyButtons.ZM_ONLINE = {
	stringRef = "MENU_ZOMBIES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyOnline",
	customId = "btnZM",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_ZOMBIES
}
CoD.LobbyButtons.ZM_LAN = {
	stringRef = "MENU_ZOMBIES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyLANGame",
	customId = "btnZM",
	selectedFunc = f0_local0,
	selectedParam = Enum.eModes.MODE_ZOMBIES,
	demo_gamescom = CoD.LobbyButtons.HIDDEN
}
CoD.LobbyButtons.THEATER = {
	stringRef = "MENU_THEATER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "THLobbyOnline",
	customId = "btnTheater"
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
	stringRef = "MENU_PLAY_ONLINE_CAPS",
	action = OpenLobbyToggleNetworkConfirmation,
	customId = "btnPlayLocal",
	demo_gamescom = CoD.LobbyButtons.HIDDEN
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
CoD.LobbyButtons.CP_START_GAME_E3 = {
	stringRef = "MENU_NEW_STORY_CAPS",
	action = StartCPE3Demo,
	customId = "btnStartMatch"
}
CoD.LobbyButtons.CP_RESUME_GAME_LAN = {
	stringRef = "MENU_RESUMESTORY_CAPS",
	action = ResumeFromCheckpoint,
	customId = "btnResumeGame"
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
	customId = "btnFindMatch"
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
	customId = "btnCAC"
}
CoD.LobbyButtons.MP_SPECIALISTS = {
	stringRef = "MPUI_HEROES_CAPS",
	action = OpenChooseCharacterLoadout,
	customId = "btnSpecialists"
}
CoD.LobbyButtons.MP_SCORESTREAKS = {
	stringRef = "MENU_SCORE_STREAKS_CAPS",
	action = OpenScorestreaks,
	customId = "btnScorestreaks"
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
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME = {
	stringRef = "MPUI_SETUP_GAME_CAPS",
	action = OpenSetupGameMP,
	customId = "btnSetupGame",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.ZM_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = OpenZMMapSelectLaunch,
	customId = "btnStartgame"
}
CoD.LobbyButtons.ZM_FIND_MATCH = {
	stringRef = "MPUI_FIND_MATCH_CAPS",
	action = OpenFindMatch,
	customId = "btnFindMatch"
}
CoD.LobbyButtons.ZM_CUSTOM_GAMES = {
	stringRef = "MENU_CUSTOMGAMES_CAPS",
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
	action = LobbyOnlinePublicLaunchGame_SelectionList,
	customId = "btnStartCustomGame",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.ZM_START_LAN_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyLANLaunchGame,
	customId = "btnStartLanGame",
	disabledFunc = MapVoteTimerActive
}
CoD.LobbyButtons.ZM_SETUP_GAME = {
	stringRef = "MPUI_SETUP_GAME_CAPS",
	action = OpenSetupGameZM,
	customId = "btnSetupGame",
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
