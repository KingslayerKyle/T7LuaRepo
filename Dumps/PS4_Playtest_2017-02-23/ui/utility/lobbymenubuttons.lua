require( "lua.Shared.LobbyData" )
require( "ui.utility.CACUtility" )

CoD.LobbyButtons = {}
CoD.LobbyButtons.DISABLED = 1
CoD.LobbyButtons.HIDDEN = 2
local IsMostRecentBonusSessionMode = function ( eModes )
	local mode = Engine.GetMostRecentPlayedMode( Engine.GetPrimaryController() )
	local gametype = Engine.ToUpper( Dvar.ui_gametype:get() )
	if mode == Enum.eModes.MODE_CAMPAIGN and gametype == "DOA" then
		return true
	elseif mode == Enum.eModes.MODE_CAMPAIGN and gametype == "CPZM" then
		return true
	elseif mode == Enum.eModes.MODE_MULTIPLAYER and gametype == "FR" then
		return true
	else
		return false
	end
end

CoD.LobbyButtons.IsMostRecentSessionMode = function ( eModes )
	local mode = Engine.GetMostRecentPlayedMode( Engine.GetPrimaryController() )
	if IsMostRecentBonusSessionMode( eModes ) then
		return false
	else
		return mode == eModes
	end
end

CoD.LobbyButtons.IsMpUnavailable = function ()
	return Engine.IsMpInitialStillDownloading()
end

local IsFullMpUnavailable = function ()
	local f4_local0 = Engine.IsMpInitialStillDownloading()
	if not f4_local0 then
		f4_local0 = Engine.IsMpStillDownloading()
	end
	return f4_local0
end

local IsZmUnavailable = function ()
	return Engine.IsZmInitialStillDownloading()
end

local IsFullZmUnavailable = function ()
	local f6_local0 = Engine.IsZmInitialStillDownloading()
	if not f6_local0 then
		f6_local0 = Engine.IsZmStillDownloading()
	end
	return f6_local0
end

CoD.LobbyButtons.IsCpUnavailable = function ()
	return Engine.IsCpStillDownloading()
end

local IsCpZmUnavailable = function ()
	local f8_local0 = Engine.IsCpStillDownloading()
	if not f8_local0 then
		f8_local0 = IsFullZmUnavailable()
	end
	return f8_local0
end

local IsAnyModeUnavailable = function ()
	local f9_local0 = Engine.IsCpStillDownloading()
	if not f9_local0 then
		f9_local0 = Engine.IsZmStillDownloading()
		if not f9_local0 then
			f9_local0 = Engine.IsMpStillDownloading()
		end
	end
	return f9_local0
end

local MoreThanOnePlayer = function ()
	local f10_local0
	if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 and Engine.GetUsedControllerCount() <= 1 and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= 0 then
		f10_local0 = false
	else
		f10_local0 = true
	end
	return f10_local0
end

local IsCPStartDisabled = function ()
	local maxClientsPerTeam = 3
	local teams = CoD.LobbyUtility.GetTeams()
	for teamIndex, team in pairs( teams ) do
		if maxClientsPerTeam < #team then
			return true
		end
	end
	return false
end

local MPStartCustomButtonDisabled = function ()
	if MapVoteTimerActive() then
		return true
	else
		local splitscreenClientCount = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_SPLITSCREEN_ALL )
		if splitscreenClientCount > 0 and CompetitiveSettingsEnabled() then
			return true
		else
			return CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing()
		end
	end
end

local ZMStartCustomButtonDisabled = function ()
	if MapVoteTimerActive() then
		return true
	else
		return CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing()
	end
end

local IsReadyUpUnavailable = function ()
	if Dvar.lobby_readyUpPercentRequired:get() <= 0 then
		return true
	else
		return false
	end
end

CoD.LobbyButtons.BONUSMODES_ONLINE = {
	stringRef = "MENU_BONUSMODES",
	action = OpenBonusModesFlyout,
	customId = "btnBonusModes",
	selectedFunc = IsMostRecentBonusSessionMode,
	selectedParam = Enum.eModes.MODE_CAMPAIGN
}
CoD.LobbyButtons.BONUSMODES_LAN = {
	stringRef = "MENU_BONUSMODES",
	action = OpenBonusModesFlyout,
	customId = "btnBonusModes",
	selectedFunc = IsMostRecentBonusSessionMode,
	selectedParam = Enum.eModes.MODE_CAMPAIGN
}
CoD.LobbyButtons.CP_ONLINE = {
	stringRef = "MENU_SINGLEPLAYER_CAPS",
	action = NavigateCheckForFirstTime,
	param = {
		targetName = LuaEnum.UI.ONLINE_CP,
		mode = Enum.eModes.MODE_CAMPAIGN,
		firstTimeFlowAction = OpenCPFirstTimeFlow
	},
	selectedFunc = CoD.LobbyButtons.IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_CAMPAIGN,
	starterPack = CoD.LobbyButtons.HIDDEN,
	disabledFunc = AlwaysTrue
}
CoD.LobbyButtons.CP_LAN = {
	stringRef = "MENU_SINGLEPLAYER_CAPS",
	action = NavigateCheckForFirstTime,
	param = {
		targetName = LuaEnum.UI.LAN_CP,
		mode = Enum.eModes.MODE_CAMPAIGN,
		firstTimeFlowAction = OpenCPFirstTimeFlow
	},
	customId = "btnCP",
	selectedFunc = CoD.LobbyButtons.IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_CAMPAIGN,
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = CoD.LobbyButtons.IsCpUnavailable
}
CoD.LobbyButtons.CPZM_ONLINE = {
	stringRef = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
	action = NavigateToLobby_SelectionListCampaignZombies,
	param = {
		targetName = LuaEnum.UI.ONLINE_CP2,
		mode = Enum.eModes.MODE_CAMPAIGN,
		firstTimeFlowAction = OpenCPFirstTimeFlow
	},
	customId = "btnCPZM",
	disabledFunc = IsCpZmUnavailable,
	visibleFunc = ShouldShowNightmares
}
CoD.LobbyButtons.CPZM_LAN = {
	stringRef = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
	action = NavigateToLobby_SelectionListCampaignZombies,
	param = {
		targetName = LuaEnum.UI.LAN_CP2,
		mode = Enum.eModes.MODE_CAMPAIGN,
		firstTimeFlowAction = OpenCPFirstTimeFlow
	},
	customId = "btnCPZM",
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = IsCpZmUnavailable,
	visibleFunc = ShouldShowNightmares
}
CoD.LobbyButtons.MP_ONLINE = {
	stringRef = "MENU_MULTIPLAYER_CAPS",
	action = NavigateCheckForFirstTime,
	param = {
		targetName = LuaEnum.UI.ONLINE_MP,
		mode = Enum.eModes.MODE_MULTIPLAYER,
		firstTimeFlowAction = OpenMPFirstTimeFlow
	},
	customId = "btnMP",
	selectedFunc = CoD.LobbyButtons.IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	disabledFunc = IsFullMpUnavailable
}
CoD.LobbyButtons.MP_PUBLIC_MATCH = {
	stringRef = "MENU_MATCHMAKING_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING,
	customId = "btnPublicMatch",
	disabledFunc = IsFullMpUnavailable
}
CoD.LobbyButtons.MP_ARENA = {
	stringRef = "MENU_ARENA_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.ONLINE_MP_ARENA_STAGING,
	customId = "btnArena"
}
CoD.LobbyButtons.MP_LAN = {
	stringRef = "MENU_MULTIPLAYER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.LAN_MP,
	customId = "btnMP",
	selectedFunc = CoD.LobbyButtons.IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = IsFullMpUnavailable
}
CoD.LobbyButtons.ZM_ONLINE = {
	stringRef = "MENU_ZOMBIES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.ONLINE_ZM,
	customId = "btnZM",
	selectedFunc = CoD.LobbyButtons.IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_ZOMBIES,
	disabledFunc = IsFullZmUnavailable
}
CoD.LobbyButtons.ZM_LAN = {
	stringRef = "MENU_ZOMBIES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.LAN_ZM,
	customId = "btnZM",
	selectedFunc = CoD.LobbyButtons.IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_ZOMBIES,
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = IsZmUnavailable
}
CoD.LobbyButtons.FR_LAN = {
	stringRef = "MENU_FREERUN_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.LAN_FR,
	customId = "btnFRLan",
	selectedFunc = CoD.LobbyButtons.IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	disabledFunc = CoD.LobbyButtons.IsMpUnavailable
}
CoD.LobbyButtons.THEATER_MP = {
	stringRef = "MENU_THEATER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.ONLINE_MP_THEATER,
	customId = "btnTheater",
	disabledFunc = IsAnyModeUnavailable
}
CoD.LobbyButtons.THEATER_ZM = {
	stringRef = "MENU_THEATER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.ONLINE_ZM_THEATER,
	customId = "btnTheater",
	disabledFunc = IsAnyModeUnavailable
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
	disabledFunc = CoD.LobbyUtility.ChunkAllDownloading
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
	newBreadcrumbFunc = IsBlackMarketBreadcrumbActive,
	disabledFunc = DisableBlackMarket
}
CoD.LobbyButtons.CP_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = StartNewGame,
	customId = "btnStartMatch",
	disabledFunc = IsCPStartDisabled
}
CoD.LobbyButtons.CP_LAN_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = ReplaySelectedMission,
	customId = "btnStartMatch",
	disabledFunc = IsCPStartDisabled
}
CoD.LobbyButtons.CP_RESUME_GAME = {
	stringRef = "MENU_RESUMESTORY_CAPS",
	action = ResumeFromCheckpoint,
	customId = "btnResumeGame",
	disabledFunc = IsCPStartDisabled
}
CoD.LobbyButtons.CP_GOTO_SAFEHOUSE = {
	stringRef = "MENU_GOTO_SAFEHOUSE_CAPS",
	action = GotoSafehouse,
	customId = "btnGotoSafehouse"
}
CoD.LobbyButtons.CP_RESUME_GAME_LAN = {
	stringRef = "MENU_RESUMESTORY_CAPS",
	action = ReplaySelectedMission,
	customId = "btnResumeGame",
	disabledFunc = IsCPStartDisabled
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
	customId = "btnMissionOverview",
	disabledFunc = GrayOutMissionOverviewButton
}
CoD.LobbyButtons.CP_SELECT_MISSION = {
	stringRef = LocalizeToUpperString( "CPUI_SELECT_EPISODE" ),
	action = OpenMissionSelect,
	customId = "btnSelectMission",
	disabledFunc = GrayOutReplayMissionButton,
	image = "uie_t8_change_cp_map",
	flyoutAction = OpenMissionSelect,
	freeCursorTitle = "CPUI_SELECT_EPISODE"
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
CoD.LobbyButtons.CP_CHANGE_FACTION = {
	stringRef = "MENU_CHANGE_FACTION_CAPS",
	action = OpenChangeFaction,
	customId = "btnChangeFaction",
	freeCursorTitle = "MENU_CHANGE_FACTION_CAPS",
	image = function ( controller )
		return CoD.TeamUtility.GetSimplifiedTeamFactionIcon( CoD.CPUtility.GetFactionFromStatsByController( controller ) )
	end,
	flyoutDatasource = "CPFactions_Lobby"
}
CoD.LobbyButtons.CP_CHANGE_FACE = {
	stringRef = LocalizeToUpperString( "MENU_CHANGE_FACE" ),
	action = CoD.CPUtility.OpenChangeFace,
	flyoutAction = CoD.CPUtility.OpenChangeFace,
	customId = "btnChangeFace",
	image = "uie_t8_cp_customization",
	freeCursorTitle = LocalizeToUpperString( "MENU_CHANGE_FACE" )
}
CoD.LobbyButtons.CP_CHANGE_COMPANION = {
	stringRef = "MENU_CHANGE_COMPANION_CAPS",
	action = OpenChangeCompanion,
	customId = "btnChangeCompanion",
	freeCursorTitle = "MENU_CHANGE_COMPANION_CAPS",
	image = function ( controller )
		local storageBuffer = Engine.GetPlayerStats( controller )
		local f16_local0 = storageBuffer.companion
		local f16_local1 = storageBuffer.companion:get()
		local companion = 0
		local f16_local2 = f16_local0 and f16_local1 or companion
		local faction = Engine.GetFactionForTeam( CoD.CPUtility.GetFactionFromStats( storageBuffer ) )
		local characterData = Engine.GetHeroBundleInfo( Enum.eModes.MODE_CAMPAIGN, f16_local2 )
		return characterData["cpsimple_" .. faction] or "$white"
	end,
	flyoutDatasource = "CompanionList_Lobby"
}
CoD.LobbyButtons.CP_LOADOUTS = {
	stringRef = "MENU_LOADOUTS_CAPS",
	customId = "btnLoadouts",
	disabledFunc = AlwaysTrue,
	freeCursorTitle = "MENU_LOADOUTS_CAPS",
	image = "uie_t8_cp_loadouts"
}
CoD.LobbyButtons.CP_COSMETICS = {
	stringRef = "MENU_COSMETICS_CAPS",
	customId = "btnCosmetics",
	disabledFunc = AlwaysTrue,
	freeCursorTitle = "MENU_COSMETICS_CAPS",
	image = "uie_t8_cp_cosmetics"
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
	disabledFunc = IsFullMpUnavailable
}
CoD.LobbyButtons.MP_CUSTOM_GAMES = {
	stringRef = "MENU_CUSTOMGAMES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.ONLINE_MP_CUSTOM,
	customId = "btnCustomMatch",
	starterPack = CoD.LobbyButtons.HIDDEN
}
CoD.LobbyButtons.MP_CAC = {
	stringRef = "MENU_CREATE_A_CLASS_CAPS",
	action = OpenCAC,
	customId = "btnCAC",
	newBreadcrumbFunc = "IsCACAnythingInCACItemNew",
	warningFunc = CoD.CACUtility.AnyClassContainsRestrictedItems,
	image = "uie_t8_mp_cac",
	flyoutAction = OpenCAC,
	freeCursorTitle = "MENU_CREATE_A_CLASS_CAPS"
}
CoD.LobbyButtons.MP_SPECIALISTS = {
	stringRef = "MPUI_HEROES_CAPS",
	action = OpenChooseCharacterLoadout,
	param = LuaEnum.CHOOSE_CHARACTER_OPENED_FROM.LOBBY,
	customId = "btnSpecialists",
	newBreadcrumbFunc = IsCACAnySpecialistsNew,
	warningFunc = EquippedSpecialistBanned,
	image = "uie_t8_mp_specialists",
	flyoutAction = OpenChooseCharacterLoadout,
	freeCursorTitle = "MPUI_HEROES_CAPS"
}
CoD.LobbyButtons.MP_POSITION_LOADOUTS = {
	stringRef = Engine.ToUpper( Engine.Localize( "MPUI_POSITION_LOADOUTS" ) ),
	action = OpenChoosePositionLoadout,
	customId = "btnPositionLoadouts",
	disabledFunc = function ()
		local f17_local0
		if Engine.UsingFreeCursor() then
			f17_local0 = not IsIntDvarNonZero( "mp_prototype" )
		else
			f17_local0 = true
		end
		return f17_local0
	end,
	image = "uie_t8_mp_position_loadouts",
	flyoutAction = OpenChoosePositionLoadout,
	freeCursorTitle = "MPUI_POSITION_LOADOUTS"
}
CoD.LobbyButtons.LOBBYBOTS_ADD_BOT = {
	stringRef = Engine.ToUpper( Engine.Localize( "MPUI_ADD_LOBBYBOT" ) ),
	action = AddLobbyBots,
	customId = "btnAddLobbyBot",
	disabledFunc = function ()
		local f18_local0
		if Engine.UsingFreeCursor() then
			f18_local0 = not IsIntDvarNonZero( "mp_prototype" )
		else
			f18_local0 = true
		end
		return f18_local0
	end,
	image = "uie_t8_mp_specialists",
	flyoutAction = AddLobbyBots,
	freeCursorTitle = "MPUI_ADD_LOBBYBOT"
}
CoD.LobbyButtons.LOBBYBOTS_REMOVE_BOT = {
	stringRef = Engine.ToUpper( Engine.Localize( "MPUI_REMOVE_LOBBYBOT" ) ),
	action = RemoveLobbyBots,
	customId = "btnRemoveLobbyBot",
	disabledFunc = function ()
		local f19_local0
		if Engine.UsingFreeCursor() then
			f19_local0 = not IsIntDvarNonZero( "mp_prototype" )
		else
			f19_local0 = true
		end
		return f19_local0
	end,
	image = "uie_t8_mp_specialists",
	flyoutAction = RemoveLobbyBots,
	freeCursorTitle = "MPUI_REMOVE_LOBBYBOT"
}
CoD.LobbyButtons.MP_SCORESTREAKS = {
	stringRef = "MENU_SCORE_STREAKS_CAPS",
	action = OpenScorestreaks,
	customId = "btnScorestreaks",
	newBreadcrumbFunc = IsCACAnyScorestreaksNew,
	warningFunc = CoD.CACUtility.AnyEquippedScorestreaksBanned,
	image = "uie_t8_mp_scorestreaks",
	flyoutAction = OpenScorestreaks,
	freeCursorTitle = "MENU_SCORE_STREAKS_CAPS"
}
CoD.LobbyButtons.MP_CODCASTER_SETTINGS = {
	stringRef = "CODCASTER_CAPS",
	action = OpenEditCodcasterSettings,
	customId = "btnCodcasterSettings",
	disabledFunc = ShouldDisableEditCodCasterSettingsButton,
	visibleFunc = ShouldShowEditCodCasterSettingsButton,
	image = "uie_t8_mp_codcaster_settings",
	flyoutAction = OpenEditCodcasterSettings,
	freeCursorTitle = "CODCASTER_CAPS"
}
CoD.LobbyButtons.MP_INVENTORY_TEST = {
	stringRef = "DW Inventory Test",
	action = OpenTest,
	customId = "btnInventoryTest",
	image = "blacktransparent",
	flyoutAction = OpenTest,
	freeCursorTitle = "DW Inventory Test"
}
CoD.LobbyButtons.MP_LOBBY_LEADERBOARD = {
	stringRef = "MENU_CUSTOM_LOBBY_LEADERBOARDS_CAPS",
	action = OpenMPLobbyLeaderboard,
	customId = "btnLobbyLeaderboard",
	disabledFunc = function ()
		return IsBooleanDvarSet( "tu1_build" )
	end
}
CoD.LobbyButtons.MP_CUSTOM_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyOnlineCustomLaunchGame_SelectionList,
	customId = "btnStartGame",
	disabledFunc = MPStartCustomButtonDisabled
}
CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME = {
	stringRef = "MPUI_SETUP_GAME_CAPS",
	action = OpenSetupGameMP,
	customId = "btnSetupGame",
	disabledFunc = MapVoteTimerActive,
	image = "uie_t8_mp_setup_custom_game",
	flyoutDatasource = "GameSettingsFlyoutButtons"
}
CoD.LobbyButtons.MP_ARENA_FIND_MATCH = {
	stringRef = "MENU_FIND_ARENA_MATCH_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.ONLINE_MP_ARENA,
	customId = "btnArenaFindMatch",
	disabledFunc = IsFullMpUnavailable
}
CoD.LobbyButtons.MP_ARENA_SELECT_ARENA = {
	stringRef = "MENU_SELECT_ARENA_CAPS",
	action = OpenCompetitivePlaylist,
	customId = "btnSelectArena",
	disabledFunc = IsFullMpUnavailable
}
CoD.LobbyButtons.MP_ARENA_LEADERBOARD = {
	stringRef = "MENU_LEADERBOARDS_CAPS",
	action = OpenArenaMasterLeaderboards,
	actionParam = 0,
	customId = "btnLeaderboards",
	disabledFunc = function ()
		return IsBooleanDvarSet( "tu1_build" )
	end
}
CoD.LobbyButtons.FR_ONLINE = {
	stringRef = "MENU_FREERUN_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.ONLINE_FR,
	customId = "btnFROnline"
}
CoD.LobbyButtons.FR_LEADERBOARD = {
	stringRef = "MENU_LEADERBOARDS_CAPS",
	action = OpenFreerunLeaderboards,
	actionParam = 0,
	customId = "btnLeaderboards",
	disabledFunc = function ()
		return IsBooleanDvarSet( "tu1_build" )
	end
}
CoD.LobbyButtons.ZM_SOLO_GAME = {
	stringRef = "MENU_SOLO_GAME_CAPS",
	action = OpenZMMapSelectLaunch,
	customId = "btnSoloMatch"
}
CoD.LobbyButtons.ZM_FIND_MATCH = {
	stringRef = "MENU_JOIN_PUBLIC_GAME_CAPS",
	action = OpenZMFindMatch,
	customId = "btnFindMatch"
}
CoD.LobbyButtons.ZM_CUSTOM_GAMES = {
	stringRef = "MENU_PRIVATE_GAME_CAPS",
	action = NavigateToLobby_SelectionList,
	param = LuaEnum.UI.ONLINE_ZM_CUSTOM,
	customId = "btnCustomMatch"
}
CoD.LobbyButtons.ZM_READY_UP = {
	stringRef = "MPUI_VOTE_TO_START_CAPS",
	action = SetPlayerReady,
	customId = "btnReadyUp",
	disabledFunc = IsReadyUpUnavailable
}
CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS = {
	stringRef = "MENU_BUBBLEGUM_BUFFS_CAPS",
	action = OpenBubbleGumPacksMenu,
	customId = "btnBubblegumBuffs",
	newBreadcrumbFunc = IsCACAnyBubblegumNew
}
CoD.LobbyButtons.ZM_MEGACHEW_FACTORY = {
	stringRef = "MENU_MEGACHEW_FACTORY_CAPS",
	action = OpenMegaChewFactorymenu,
	customId = "btnMegaChewFactory",
	newBreadcrumbFunc = CheckMegaChewFactoryShowBreadcrumb
}
CoD.LobbyButtons.ZM_BUILD_KITS = {
	stringRef = "MENU_WEAPON_BUILD_KITS_CAPS",
	action = OpenWeaponBuildKits,
	customId = "btnWeaponBuildKits",
	newBreadcrumbFunc = Gunsmith_AnyNewWeaponsOrAttachments
}
CoD.LobbyButtons.ZM_LOBBY_LEADERBOARD = {
	stringRef = "MENU_LOBBY_LEADERBOARD_CAPS",
	action = LobbyNoAction,
	customId = "btnLobbyLeaderboard",
	disabledFunc = function ()
		return IsBooleanDvarSet( "tu1_build" )
	end
}
CoD.LobbyButtons.ZM_START_CUSTOM_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyOnlineCustomLaunchGame_SelectionList,
	customId = "btnStartCustomGame",
	disabledFunc = ZMStartCustomButtonDisabled
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
CoD.LobbyButtons.ZM_CHANGE_RANKED_SETTTINGS = {
	stringRef = "MENU_CHANGE_RANKED_SETTINGS_CAPS",
	action = OpenChangeRankedSettingsPopup,
	customId = "btnChangeRankedSettings"
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
	stringRef = "MENU_START_CAPS",
	action = LobbyTheaterStartFilm,
	customId = "btnStartFilm",
	disabledFunc = IsStartFilmButtonDisabled
}
CoD.LobbyButtons.TH_SELECT_FILM = {
	stringRef = "MENU_SELECT_CAPS",
	action = OpenTheaterSelectFilm,
	customId = "btnSelectFilm",
	disabledFunc = MapVoteTimerActive,
	selectedFunc = IsFilmNotSelected
}
CoD.LobbyButtons.TH_CREATE_HIGHLIGHT = {
	stringRef = "MPUI_HIGHLIGHT_REEL_CAPS",
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
CoD.LobbyButtons.CP_DOA_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = StartDOAGame,
	customId = "bthDOAStartMatch"
}
CoD.LobbyButtons.CP_DOA_JOIN_PUBLIC_GAME = {
	stringRef = "MENU_JOIN_PUBLIC_GAME_CAPS",
	action = LaunchDOA,
	customId = "btnJoinPublicGame"
}
CoD.LobbyButtons.CP_DOA_LEADERBOARD = {
	stringRef = "MENU_LEADERBOARDS_CAPS",
	action = OpenDOALeaderboards,
	actionParam = 0,
	customId = "btnLeaderboards",
	disabledFunc = function ()
		return IsBooleanDvarSet( "tu1_build" )
	end
}
