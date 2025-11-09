require( "lua.Shared.LobbyData" )
require( "ui_mp.T6.Menus.CACUtility" )

CoD.LobbyButtons = {}
CoD.LobbyButtons.DISABLED = 1
CoD.LobbyButtons.HIDDEN = 2
CoD.LobbyButtons.STARTERPACK_UPGRADE = 3
local f0_local0 = function ( f1_arg0 )
	local f1_local0 = Engine.GetMostRecentPlayedMode( Engine.GetPrimaryController() )
	local f1_local1 = Engine.ToUpper( Dvar.ui_gametype:get() )
	if f1_local0 == Enum.eModes.MODE_CAMPAIGN and f1_local1 == "DOA" then
		return true
	elseif f1_local0 == Enum.eModes.MODE_CAMPAIGN and f1_local1 == "CPZM" then
		return true
	elseif f1_local0 == Enum.eModes.MODE_MULTIPLAYER and f1_local1 == "FR" then
		return true
	else
		return false
	end
end

function IsMostRecentSessionMode( f2_arg0 )
	local f2_local0 = Engine.GetMostRecentPlayedMode( Engine.GetPrimaryController() )
	if f0_local0( f2_arg0 ) then
		return false
	else
		return f2_local0 == f2_arg0
	end
end

function IsMpUnavailable()
	if CoD.isPC then
		return not Engine.IsMpOwned()
	else
		return Engine.IsMpInitialStillDownloading()
	end
end

local f0_local1 = function ()
	if CoD.isPC then
		local f4_local0 = Engine.IsMpOwned()
		local f4_local1 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
		local f4_local2 = Engine.IsShipBuild()
		local f4_local3 = Mods_IsUsingMods()
		local f4_local4
		if f4_local0 then
			if not f4_local3 and not f4_local1 then
				f4_local4 = f4_local2
			else
				f4_local4 = false
			end
		else
			f4_local4 = true
		end
		return f4_local4
	end
	local f4_local0 = Engine.IsMpInitialStillDownloading()
	if not f4_local0 then
		f4_local0 = Engine.IsMpStillDownloading()
	end
	return f4_local0
end

local f0_local2 = function ()
	if CoD.isPC then
		return not Engine.IsZmOwned()
	else
		return Engine.IsZmInitialStillDownloading()
	end
end

local f0_local3 = function ()
	if CoD.isPC then
		return not Engine.IsZmOwned()
	end
	local f6_local0 = Engine.IsZmInitialStillDownloading()
	if not f6_local0 then
		f6_local0 = Engine.IsZmStillDownloading()
	end
	return f6_local0
end

function IsCpUnavailable()
	if CoD.isPC then
		return not Engine.IsCpOwned()
	else
		return Engine.IsCpStillDownloading()
	end
end

local f0_local4 = function ()
	local f8_local0 = Engine.IsCpStillDownloading()
	if not f8_local0 then
		f8_local0 = f0_local3()
	end
	return f8_local0
end

local f0_local5 = function ()
	local f9_local0 = IsMpUnavailable()
	if not f9_local0 then
		f9_local0 = Engine.IsMpStillDownloading()
	end
	return f9_local0
end

local f0_local6 = function ()
	local f10_local0 = f0_local2()
	if not f10_local0 then
		f10_local0 = Engine.IsZmStillDownloading()
	end
	return f10_local0
end

local f0_local7 = function ()
	local f11_local0 = Engine.IsCpStillDownloading()
	if not f11_local0 then
		f11_local0 = Engine.IsZmStillDownloading()
		if not f11_local0 then
			f11_local0 = Engine.IsMpStillDownloading()
		end
	end
	return f11_local0
end

local f0_local8 = function ()
	local f12_local0
	if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 and Engine.GetUsedControllerCount() <= 1 and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= 0 then
		f12_local0 = false
	else
		f12_local0 = true
	end
	return f12_local0
end

function MPStartCustomButtonDisabled()
	if MapVoteTimerActive() then
		return true
	elseif Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_SPLITSCREEN_ALL ) > 0 and CompetitiveSettingsEnabled() then
		return true
	else
		return CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing()
	end
end

function ZMStartCustomButtonDisabled()
	if MapVoteTimerActive() then
		return true
	else
		return CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing()
	end
end

local f0_local9 = function ()
	return false
end

function StoreButtonOpenSteamStore( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	if IsStarterPack( f16_arg2 ) then
		OpenSteamStore( f16_arg0, f16_arg1, f16_arg2, 437351, f16_arg4 )
	else
		OpenSteamStore( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	end
end

CoD.LobbyButtons.BONUSMODES_ONLINE = {
	stringRef = "MENU_BONUSMODES",
	action = OpenBonusModesFlyout,
	customId = "btnBonusModes",
	selectedFunc = f0_local0
}
CoD.LobbyButtons.BONUSMODES_LAN = {
	stringRef = "MENU_BONUSMODES",
	action = OpenBonusModesFlyout,
	customId = "btnBonusModes",
	selectedFunc = f0_local0
}
CoD.LobbyButtons.MODS_LOAD = {
	stringRef = "MENU_MODS_CAPS",
	action = Mods_OpenLoadMenu,
	customId = "btnModsLoad",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_ONLINE = {
	stringRef = "MENU_SINGLEPLAYER_CAPS",
	action = NavigateCheckForFirstTime,
	param = {
		targetName = "CPLobbyOnline",
		mode = Enum.eModes.MODE_CAMPAIGN,
		firstTimeFlowAction = OpenCPFirstTimeFlow
	},
	customId = "btnCP",
	selectedFunc = IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_CAMPAIGN,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE,
	disabledFunc = IsCpUnavailable
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
	selectedFunc = IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_CAMPAIGN,
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE,
	disabledFunc = IsCpUnavailable
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
	disabledFunc = f0_local4,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE,
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
	disabledFunc = f0_local4,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE,
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
	selectedFunc = IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	disabledFunc = f0_local1
}
CoD.LobbyButtons.MP_PUBLIC_MATCH = {
	stringRef = "MENU_MATCHMAKING_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyOnline",
	customId = "btnPublicMatch",
	disabledFunc = f0_local1,
	unloadMod = true
}
CoD.LobbyButtons.MP_ARENA = {
	stringRef = "MENU_ARENA_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyOnlineArena",
	customId = "btnArena",
	unloadMod = true
}
CoD.LobbyButtons.MP_LAN = {
	stringRef = "MENU_MULTIPLAYER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyLANGame",
	customId = "btnMP",
	selectedFunc = IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = f0_local1
}
CoD.LobbyButtons.ZM_ONLINE = {
	stringRef = "MENU_ZOMBIES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyOnline",
	customId = "btnZM",
	selectedFunc = IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_ZOMBIES,
	disabledFunc = f0_local3,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.ZM_LAN = {
	stringRef = "MENU_ZOMBIES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyLANGame",
	customId = "btnZM",
	selectedFunc = IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_ZOMBIES,
	demo_gamescom = CoD.LobbyButtons.HIDDEN,
	disabledFunc = f0_local2,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.FR_LAN = {
	stringRef = "MENU_FREERUN_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "FRLobbyLANGame",
	customId = "btnFRLan",
	selectedFunc = IsMostRecentSessionMode,
	selectedParam = Enum.eModes.MODE_MULTIPLAYER,
	disabledFunc = IsMpUnavailable
}
CoD.LobbyButtons.THEATER_MP = {
	stringRef = "MENU_THEATER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyOnlineTheater",
	customId = "btnTheater",
	disabledFunc = f0_local5,
	unloadMod = true
}
CoD.LobbyButtons.THEATER_ZM = {
	stringRef = "MENU_THEATER_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyOnlineTheater",
	customId = "btnTheater",
	disabledFunc = f0_local6,
	unloadMod = true
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
	action = StoreButtonOpenSteamStore,
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
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_LAN_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = StartNewGame,
	customId = "btnStartMatch",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_RESUME_GAME = {
	stringRef = "MENU_RESUMESTORY_CAPS",
	action = ResumeFromCheckpoint,
	customId = "btnResumeGame",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_GOTO_SAFEHOUSE = {
	stringRef = "MENU_GOTO_SAFEHOUSE_CAPS",
	action = GotoSafehouse,
	customId = "btnGotoSafehouse",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_RESUME_GAME_LAN = {
	stringRef = "MENU_RESUMESTORY_CAPS",
	action = ResumeFromCheckpoint,
	customId = "btnResumeGame",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_LAN_REPLAY_MISSION = {
	stringRef = "MENU_REPLAY_MISSION_CAPS",
	action = ReplaySelectedMission,
	customId = "btnReplayMission",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_JOIN_PUBLIC_GAME = {
	stringRef = "MENU_JOIN_PUBLIC_GAME_CAPS",
	action = OpenPublicGameSelect,
	customId = "btnJoinPublicGame",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE,
	unloadMod = true
}
CoD.LobbyButtons.CP_MISSION_OVERVIEW = {
	stringRef = "MENU_MISSION_OVERVIEW_CAP",
	action = OpenMissionOverview,
	customId = "btnMissionOverview",
	disabledFunc = GrayOutMissionOverviewButton,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_SELECT_MISSION = {
	stringRef = "MENU_SELECT_MISSION_CAPS",
	action = OpenMissionSelect,
	customId = "btnSelectMission",
	disabledFunc = GrayOutReplayMissionButton,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY = {
	stringRef = "MENU_CHANGE_DIFFICULTY_CAPS",
	action = OpenDifficultySelect,
	customId = "btnChooseDifficulty",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CP_CUSTOM_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyOnlineCustomLaunchGame_SelectionList,
	customId = "btnStartGame",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CPZM_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = StartNewGame,
	customId = "btnStartMatch",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CPZM_RESUME_GAME = {
	stringRef = "MENU_RESUMESTORY_CAPS",
	action = ResumeFromCheckpoint,
	customId = "btnResumeGame",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.CPZM_FIND_MATCH = {
	stringRef = "MPUI_FIND_MATCH_CAPS",
	action = OpenFindMatch,
	customId = "btnFindMatch",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE,
	unloadMod = true
}
CoD.LobbyButtons.CPZM_SELECT_MISSION = {
	stringRef = "MENU_SELECT_MISSION_CAPS",
	action = OpenMissionSelect,
	customId = "btnSelectMission",
	disabledFunc = GrayOutReplayMissionButton,
	demo_CP = CoD.LobbyButtons.HIDDEN,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.MP_FIND_MATCH = {
	stringRef = "MPUI_FIND_MATCH_CAPS",
	action = OpenFindMatch,
	customId = "btnFindMatch",
	disabledFunc = f0_local1,
	unloadMod = true
}
CoD.LobbyButtons.MP_CUSTOM_GAMES = {
	stringRef = "MENU_CUSTOMGAMES_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "MPLobbyOnlineCustomGame",
	customId = "btnCustomMatch",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.MP_CAC = {
	stringRef = "MENU_CREATE_A_CLASS_CAPS",
	action = OpenCAC,
	customId = "btnCAC",
	newBreadcrumbFunc = "IsCACAnythingInCACItemNew",
	warningFunc = CoD.CACUtility.AnyClassContainsRestrictedItems
}
CoD.LobbyButtons.MP_CAC_NO_WARNING = {
	stringRef = CoD.LobbyButtons.MP_CAC.stringRef,
	action = CoD.LobbyButtons.MP_CAC.action,
	customId = CoD.LobbyButtons.MP_CAC.customId,
	newBreadcrumbFunc = CoD.LobbyButtons.MP_CAC.newBreadcrumbFunc
}
CoD.LobbyButtons.MP_SPECIALISTS = {
	stringRef = "MPUI_HEROES_CAPS",
	action = OpenChooseCharacterLoadout,
	param = LuaEnums.CHOOSE_CHARACTER_OPENED_FROM.LOBBY,
	customId = "btnSpecialists",
	newBreadcrumbFunc = IsCACAnySpecialistsNew,
	warningFunc = EquippedSpecialistBanned
}
CoD.LobbyButtons.MP_SPECIALISTS_NO_WARNING = {
	stringRef = CoD.LobbyButtons.MP_SPECIALISTS.stringRef,
	action = CoD.LobbyButtons.MP_SPECIALISTS.action,
	param = CoD.LobbyButtons.MP_SPECIALISTS.param,
	customId = CoD.LobbyButtons.MP_SPECIALISTS.customId,
	newBreadcrumbFunc = CoD.LobbyButtons.MP_SPECIALISTS.newBreadcrumbFunc
}
CoD.LobbyButtons.MP_SCORESTREAKS = {
	stringRef = "MENU_SCORE_STREAKS_CAPS",
	action = OpenScorestreaks,
	customId = "btnScorestreaks",
	newBreadcrumbFunc = IsCACAnyScorestreaksNew,
	warningFunc = CoD.CACUtility.AnyEquippedScorestreaksBanned
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
CoD.LobbyButtons.MP_PUBLIC_LOBBY_LEADERBOARD = {
	stringRef = "MENU_CUSTOM_LOBBY_LEADERBOARDS_CAPS",
	action = OpenMPPublicLobbyLeaderboard,
	customId = "btnLobbyLeaderboard"
}
CoD.LobbyButtons.MP_CUSTOM_LOBBY_LEADERBOARD = {
	stringRef = "MENU_CUSTOM_LOBBY_LEADERBOARDS_CAPS",
	action = OpenMPCustomLobbyLeaderboard,
	customId = "btnLobbyLeaderboard"
}
CoD.LobbyButtons.MP_CUSTOM_START_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyOnlineCustomLaunchGame_SelectionList,
	customId = "btnStartGame",
	disabledFunc = MPStartCustomButtonDisabled,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
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
	disabledFunc = f0_local1,
	unloadMod = true
}
CoD.LobbyButtons.MP_ARENA_SELECT_ARENA = {
	stringRef = "MENU_SELECT_ARENA_CAPS",
	action = OpenCompetitivePlaylist,
	customId = "btnSelectArena",
	disabledFunc = f0_local1,
	unloadMod = true
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
	param = "FRLobbyOnlineGame",
	customId = "btnFROnline",
	disabledFunc = IsMpUnavailable
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
	customId = "btnSoloMatch",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.ZM_FIND_MATCH = {
	stringRef = "MENU_JOIN_PUBLIC_GAME_CAPS",
	action = OpenZMFindMatch,
	customId = "btnFindMatch",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE,
	unloadMod = true
}
CoD.LobbyButtons.ZM_CUSTOM_GAMES = {
	stringRef = "MENU_PRIVATE_GAME_CAPS",
	action = NavigateToLobby_SelectionList,
	param = "ZMLobbyOnlineCustomGame",
	customId = "btnCustomMatch",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.ZM_READY_UP = {
	stringRef = "MPUI_VOTE_TO_START_CAPS",
	action = SetPlayerReady,
	customId = "btnReadyUp",
	disabledFunc = f0_local9
}
CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS = {
	stringRef = "MENU_BUBBLEGUM_BUFFS_CAPS",
	action = OpenBubbleGumPacksMenu,
	customId = "btnBubblegumBuffs",
	newBreadcrumbFunc = IsCACAnyBubblegumNew,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.ZM_MEGACHEW_FACTORY = {
	stringRef = "MENU_MEGACHEW_FACTORY_CAPS",
	action = OpenMegaChewFactorymenu,
	customId = "btnMegaChewFactory",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.ZM_GOBBLEGUM_RECIPES = {
	stringRef = "MENU_NEWTONS_COOKBOOK_CAPS",
	action = OpenGobbleGumCookbookMenu,
	customId = "btnGobbleGumRecipes",
	visibleFunc = function ()
		return IsIntDvarNonZero( "tu18_enable_newtons_cookbook" )
	end,
	newBreadcrumbFunc = IsNewtonsCookbookBreadcrumbActive
}
CoD.LobbyButtons.ZM_BUILD_KITS = {
	stringRef = "MENU_WEAPON_BUILD_KITS_CAPS",
	action = OpenWeaponBuildKits,
	customId = "btnWeaponBuildKits",
	newBreadcrumbFunc = Gunsmith_AnyNewWeaponsOrAttachments,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
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
	disabledFunc = ZMStartCustomButtonDisabled,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.ZM_START_LAN_GAME = {
	stringRef = "MENU_START_GAME_CAPS",
	action = LobbyLANLaunchGame,
	customId = "btnStartLanGame",
	disabledFunc = MapVoteTimerActive,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.ZM_CHANGE_MAP = {
	stringRef = "MPUI_CHANGE_MAP_CAPS",
	action = OpenChangeMapZM,
	customId = "btnChangeMap",
	disabledFunc = MapVoteTimerActive,
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.ZM_CHANGE_RANKED_SETTTINGS = {
	stringRef = "MENU_CHANGE_RANKED_SETTINGS_CAPS",
	action = OpenChangeRankedSettingsPopup,
	customId = "btnChangeRankedSettings",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
}
CoD.LobbyButtons.ZM_SERVER_SETTINGS = {
	stringRef = "PLATFORM_SERVER_SETTINGS_CAPS",
	action = OpenServerSettings,
	customId = "btnServerSettings",
	starterPack = CoD.LobbyButtons.STARTERPACK_UPGRADE
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
	action = LaunchDOAJoin,
	customId = "btnJoinPublicGame",
	unloadMod = true
}
CoD.LobbyButtons.CP_DOA_CREATE_PUBLIC_GAME = {
	stringRef = "MENU_CREATE_PUBLIC_GAME_CAPS",
	action = LaunchDOACreate,
	customId = "btnJCreatePublicGame",
	unloadMod = true,
	disabledFunc = function ()
		local f21_local0, f21_local1 = Engine.CanHostServer( Engine.GetPrimaryController(), Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME ) )
		return not f21_local0
	end
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
