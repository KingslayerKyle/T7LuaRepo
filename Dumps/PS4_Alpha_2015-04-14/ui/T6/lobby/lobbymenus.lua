require( "lua.Shared.LobbyData" )
require( "ui.uieditor.menus.CPLevels.CPMissionSelect" )
require( "ui.uieditor.menus.ZM.ZMMapSelection" )

CoD.LobbyMenus = {}
CoD.LobbyMenus.LastMenu = nil
CoD.LobbyMenus.AddButtons = function ( controller, hostModelName, buttonsTable, func )
	local model = Engine.GetModel( DataSources.Lobby.getModel( controller ), hostModelName )
	local isLeader = nil
	if model ~= nil then
		isLeader = Engine.GetModelValue( model )
	end
	if func ~= nil then
		func( controller, buttonsTable, isLeader )
	else
		print( "Error: No function provided to CoD.LobbyMenus.AddButtons" )
	end
end

CoD.LobbyMenus.AddButtonsMPCPZM = function ( controller, hostModelName, buttonsTable, mpFunc, cpFunc, zmFunc )
	if Engine.GetModeName() == "MP" then
		CoD.LobbyMenus.AddButtons( controller, hostModelName, buttonsTable, mpFunc )
	elseif Engine.GetModeName() == "CP" then
		CoD.LobbyMenus.AddButtons( controller, hostModelName, buttonsTable, cpFunc )
	elseif Engine.GetModeName() == "ZM" then
		CoD.LobbyMenus.AddButtons( controller, hostModelName, buttonsTable, zmFunc )
	else
		print( "Error: no mode name set but AddButtonsMPCPZM called." )
	end
end

local IsDemo = function ()
	return Dvar.ui_execdemo:get()
end

local IsCPDemo = function ()
	return Dvar.ui_execdemo_cp:get()
end

local AddLargeButton = function ( options, customId, stringRef, actionFunc, param, isLastInGroup, disabled, hidden )
	if hidden then
		return 
	else
		table.insert( options, {
			optionDisplay = stringRef,
			action = actionFunc,
			param = param,
			customId = customId,
			isLargeButton = true,
			isLastButtonInGroup = isLastInGroup,
			disabled = disabled
		} )
	end
end

local AddSmallButton = function ( options, customId, stringRef, actionFunc, param, isLastInGroup, disabled, hidden, disabledFunction )
	if hidden then
		return 
	else
		table.insert( options, {
			optionDisplay = stringRef,
			action = actionFunc,
			param = param,
			customId = customId,
			isLargeButton = false,
			isLastButtonInGroup = isLastInGroup,
			disabled = disabled,
			disabledFunction = disabledFunction
		} )
	end
end

local AddLargeEndButton = function ( options, customId, stringRef, actionFunc, param, disabled, hidden )
	AddLargeButton( options, customId, stringRef, actionFunc, param, true, disabled, hidden )
end

local AddSmallEndButton = function ( options, customId, stringRef, actionFunc, param, disabled, hidden )
	AddSmallButton( options, customId, stringRef, actionFunc, param, true, disabled, hidden )
end

CoD.LobbyMenus.ModeSelect = function ( controller, options, isLeader )
	print( "Lobby Buttons: ModeSelectHost" )
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if isLeader == 1 then
			local f9_local0 = AddLargeButton
			local f9_local1 = options
			local f9_local2 = "btnCP"
			local f9_local3 = "MENU_SINGLEPLAYER_CAPS"
			local f9_local4 = NavigateToLobby_SelectionList
			local f9_local5 = "CPLobbyOnline"
			local f9_local6 = false
			local f9_local7 = false
			local f9_local8 = IsDemo()
			if f9_local8 then
				f9_local8 = not IsCPDemo()
			end
			f9_local0( f9_local1, f9_local2, f9_local3, f9_local4, f9_local5, f9_local6, f9_local7, f9_local8 )
			if Engine.IsCampaignModeUnlocked( Enum.CampaignMode.CAMPAIGNMODE_NIGHTMARES ) == 1 then
				f9_local0 = AddLargeButton
				f9_local1 = options
				f9_local2 = "btnCP"
				f9_local3 = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS"
				f9_local4 = NavigateToLobby_SelectionList
				f9_local5 = "CPLobbyOnline"
				f9_local6 = false
				f9_local7 = false
				f9_local8 = IsDemo()
				if f9_local8 then
					f9_local8 = not IsCPDemo()
				end
				f9_local0( f9_local1, f9_local2, f9_local3, f9_local4, f9_local5, f9_local6, f9_local7, f9_local8 )
			end
			f9_local0 = AddLargeButton
			f9_local1 = options
			f9_local2 = "btnMP"
			f9_local3 = "MENU_MULTIPLAYER_CAPS"
			f9_local4 = NavigateToLobby_SelectionList
			f9_local5 = "MPLobbyOnline"
			f9_local6 = false
			f9_local7 = false
			f9_local8 = IsDemo()
			if f9_local8 then
				f9_local8 = IsCPDemo()
			end
			f9_local0( f9_local1, f9_local2, f9_local3, f9_local4, f9_local5, f9_local6, f9_local7, f9_local8 )
			AddLargeButton( options, "btnZM", "MENU_ZOMBIES_CAPS", NavigateToLobby_SelectionList, "ZMLobbyOnline", false, false, IsDemo() )
			AddLargeButton( options, "btnTheater", "MENU_THEATER_CAPS", NavigateToLobby_SelectionList, "THLobbyOnline", true, false, IsDemo() )
			AddSmallEndButton( options, "btnPlayLocal", "MENU_PLAY_LOCAL_CAPS", OpenLobbyToggleNetworkConfirmation )
		end
		AddSmallButton( options, "btnStore", "MENU_STORE_CAPS", LobbyNoAction, nil, true, true, IsDemo() )
	elseif isLeader == 1 then
		local mpTitle = "MENU_MULTIPLAYER_CAPS"
		if IsDemo() then
			mpTitle = "MENU_CREATE_GAME_CAPS"
		end
		local f9_local1 = AddLargeButton
		local f9_local2 = options
		local f9_local3 = "btnCP"
		local f9_local4 = "MENU_SINGLEPLAYER_CAPS"
		local f9_local5 = NavigateToLobby_SelectionList
		local f9_local6 = "CPLobbyLANGame"
		local f9_local7 = false
		local f9_local8 = false
		local f9_local9 = IsDemo()
		if f9_local9 then
			f9_local9 = not IsCPDemo()
		end
		f9_local1( f9_local2, f9_local3, f9_local4, f9_local5, f9_local6, f9_local7, f9_local8, f9_local9 )
		if Engine.IsCampaignModeUnlocked( Enum.CampaignMode.CAMPAIGNMODE_NIGHTMARES ) == 1 then
			f9_local1 = AddLargeButton
			f9_local2 = options
			f9_local3 = "btnCP"
			f9_local4 = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS"
			f9_local5 = NavigateToLobby_SelectionList
			f9_local6 = "CPLobbyOnline"
			f9_local7 = false
			f9_local8 = false
			f9_local9 = IsDemo()
			if f9_local9 then
				f9_local9 = not IsCPDemo()
			end
			f9_local1( f9_local2, f9_local3, f9_local4, f9_local5, f9_local6, f9_local7, f9_local8, f9_local9 )
		end
		f9_local1 = AddLargeButton
		f9_local2 = options
		f9_local3 = "btnMP"
		f9_local4 = mpTitle
		f9_local5 = NavigateToLobby_SelectionList
		f9_local6 = "MPLobbyLANGame"
		f9_local7 = false
		f9_local8 = false
		f9_local9 = IsDemo()
		if f9_local9 then
			f9_local9 = IsCPDemo()
		end
		f9_local1( f9_local2, f9_local3, f9_local4, f9_local5, f9_local6, f9_local7, f9_local8, f9_local9 )
		AddLargeEndButton( options, "btnZM", "MENU_ZOMBIES_CAPS", NavigateToLobby_SelectionList, "ZMLobbyLANGame", false, IsDemo() )
		AddSmallButton( options, "btnFindGame", "MENU_FIND_LAN_GAME", OpenFindLANGame, nil, true )
		AddSmallEndButton( options, "btnPlayLocal", "MENU_PLAY_ONLINE_CAPS", OpenLobbyToggleNetworkConfirmation )
	end
	if CoD.isPC then
		AddSmallButton( options, "btnQuit", "MENU_QUIT_CAPS", OpenPCQuit )
	end
end

CoD.LobbyMenus.CPButtonsOnline = function ( controller, options, isLeader )
	if isLeader == 1 then
		print( "Lobby Buttons: CPButtonsOnlineHost" )
		if IsFirstTimeSetup( controller ) then
			AddLargeButton( options, "btnStartMatch", "MENU_START_GAME_CAPS", OpenGenders, nil, true, false, false )
		else
			AddLargeButton( options, "btnResumeGame", "MENU_RESUMEGAME_CAPS", OpenResumeGameFlyout, nil, true, false, false )
		end
		AddLargeButton( options, "btnSelectMission", "MENU_SELECT_MISSION_CAPS", OpenMissionSelect, nil, false, false, false )
	end
	AddLargeEndButton( options, "btnChooseDifficulty", "MENU_CHOOSE_DIFFICULTY_CAPS", OpenDifficultySelect, true, false, false, false )
end

CoD.LobbyMenus.CPButtonsPublicGame = function ( controller, options, isLeader )
	print( "Lobby Buttons: CPButtonsPublicGameHost" )
	AddSmallButton( options, "btnStartMatch", "MENU_START_GAME_CAPS", LobbyOnlineCustomLaunchGame_SelectionList )
	AddSmallButton( options, "btnStore", "MENU_STORE_CAPS", LobbyNoAction )
end

CoD.LobbyMenus.CPButtonsLAN = function ( controller, options, isLeader )
	if isLeader == 1 then
		print( "Lobby Buttons: CPButtonsLANHost" )
		if IsFirstTimeSetup( controller ) then
			AddLargeButton( options, "btnStartMatch", "MENU_START_GAME_CAPS", OpenGenders, nil, false, false, false )
		else
			AddLargeButton( options, "btnResumeGame", "MENU_RESUMEGAME_CAPS", OpenResumeGameFlyoutLAN, nil, false, false, false )
		end
		AddLargeButton( options, "btnSelectMission", "MENU_SELECT_MISSION_CAPS", OpenMissionSelect, nil, false, false, false )
	end
	AddLargeEndButton( options, "btnChooseDifficulty", "MENU_CHOOSE_DIFFICULTY_CAPS", OpenDifficultySelect, nil, false, false, false )
end

CoD.LobbyMenus.MPButtonsOnline = function ( controller, options, isLeader )
	if isLeader == 1 then
		print( "Lobby Buttons: MPButtonsOnlineHost" )
		AddLargeButton( options, "btnFindMatch", "MPUI_FIND_MATCH_CAPS", OpenFindMatch, nil, nil, false, IsDemo() )
		AddLargeEndButton( options, "btnCustomMatch", "MENU_CUSTOMGAMES_CAPS", NavigateToLobby_SelectionList, "MPLobbyOnlineCustomGame" )
		AddLargeButton( options, "btnCAC", "MENU_CREATE_A_CLASS_CAPS", OpenCAC, nil, false, false, false )
		AddLargeButton( options, "btnHeroes", "MPUI_HEROES_CAPS", OpenChooseCharacterLoadout, nil, false, false, false )
		AddLargeEndButton( options, "btnScorestreaks", "MENU_SCORE_STREAKS_CAPS", OpenScorestreaks, nil, false, false )
	else
		print( "Lobby Buttons: MPButtonsOnlineClient" )
		AddLargeButton( options, "btnCAC", "MENU_CREATE_A_CLASS_CAPS", OpenCAC, nil, false, false )
		AddLargeButton( options, "btnHeroes", "MPUI_HEROES_CAPS", OpenChooseCharacterLoadout, nil, false, false )
		AddLargeEndButton( options, "btnScorestreaks", "MENU_SCORE_STREAKS_CAPS", OpenScorestreaks, nil, false, false )
	end
end

CoD.LobbyMenus.MPButtonsOnlinePublic = function ( controller, options, isLeader )
	AddSmallButton( options, "btnCAC", "MENU_CREATE_A_CLASS_CAPS", OpenCAC )
	AddSmallButton( options, "btnHeroes", "MPUI_HEROES_CAPS", OpenChooseCharacterLoadout )
	AddSmallEndButton( options, "btnScorestreaks", "MENU_SCORE_STREAKS_CAPS", OpenScorestreaks )
end

CoD.LobbyMenus.MPButtonsPublicGame = function ( controller, options, isLeader )
	print( "Lobby Buttons: MPButtonsPublicGame" )
	AddSmallButton( options, "btnCAC", "MENU_CREATE_A_CLASS_CAPS", OpenCAC )
	AddSmallButton( options, "btnHeroes", "MPUI_HEROES_CAPS", OpenChooseCharacterLoadout, nil, false, false, IsDemo() )
	AddSmallEndButton( options, "btnScorestreaks", "MENU_SCORE_STREAKS_CAPS", OpenScorestreaks )
	AddSmallEndButton( options, "btnLobbyLeaderboard", "MENU_CUSTOM_LOBBY_LEADERBOARDS_CAPS", LobbyNoAction )
end

CoD.LobbyMenus.MPButtonsCustomGame = function ( controller, options, isLeader )
	if isLeader == 1 then
		print( "Lobby Buttons: MPButtonsCustomGameHost" )
		AddSmallButton( options, "btnStartMatch", "MENU_START_GAME_CAPS", LobbyOnlineCustomLaunchGame_SelectionList, nil, false, MapVoteTimerActive() )
		AddSmallButton( options, "btnSetupGame", "MPUI_SETUP_GAME_CAPS", OpenSetupGameMP, nil, true, MapVoteTimerActive() )
		AddSmallButton( options, "btnCAC", "MENU_CREATE_A_CLASS_CAPS", OpenCAC )
		AddSmallButton( options, "btnHeroes", "MPUI_HEROES_CAPS", OpenChooseCharacterLoadout )
		AddSmallButton( options, "btnScorestreaks", "MENU_SCORE_STREAKS_CAPS", OpenScorestreaks, nil, true )
	else
		print( "Lobby Buttons: MPButtonsCustomGameClient" )
		AddSmallButton( options, "btnCAC", "MENU_CREATE_A_CLASS_CAPS", OpenCAC )
		AddSmallButton( options, "btnHeroes", "MPUI_HEROES_CAPS", OpenChooseCharacterLoadout )
		AddSmallEndButton( options, "btnScorestreaks", "MENU_SCORE_STREAKS_CAPS", OpenScorestreaks )
	end
end

CoD.LobbyMenus.MPButtonsLAN = function ( controller, options, isLeader )
	if isLeader == 1 then
		print( "Lobby Buttons: MPButtonsLANHost" )
		AddSmallButton( options, "btnStartMatch", "MENU_START_GAME_CAPS", LobbyOnlineCustomLaunchGame_SelectionList, nil, false, MapVoteTimerActive() )
		AddSmallButton( options, "btnSetupGame", "MPUI_SETUP_GAME_CAPS", OpenSetupGameMP, nil, true, MapVoteTimerActive() )
		AddSmallButton( options, "btnCAC", "MENU_CREATE_A_CLASS_CAPS", OpenCAC )
		AddSmallButton( options, "btnHeroes", "MPUI_HEROES_CAPS", OpenChooseCharacterLoadout )
		AddSmallButton( options, "btnScorestreaks", "MENU_SCORE_STREAKS_CAPS", OpenScorestreaks )
	else
		print( "Lobby Buttons: MPButtonsLANClient" )
		AddSmallButton( options, "btnCAC", "MENU_CREATE_A_CLASS_CAPS", OpenCAC )
		AddSmallButton( options, "btnHeroes", "MPUI_HEROES_CAPS", OpenChooseCharacterLoadout )
		AddSmallButton( options, "btnScorestreaks", "MENU_SCORE_STREAKS_CAPS", OpenScorestreaks )
	end
end

CoD.LobbyMenus.ZMButtonsOnline = function ( controller, options, isLeader )
	if isLeader == 1 then
		print( "Lobby Buttons: ZMButtonsOnlineHost" )
		AddLargeButton( options, "btnStartgame", "MENU_START_GAME_CAPS", OpenZMMapSelectLaunch, nil, false, false, false )
		AddLargeButton( options, "btnFindMatch", "MPUI_FIND_MATCH_CAPS", OpenFindMatch, nil, false, false, false )
		AddLargeButton( options, "btnCustomMatch", "MENU_CUSTOMGAMES_CAPS", NavigateToLobby_SelectionList, "ZMLobbyOnlineCustomGame", true, false, false )
	else
		print( "Lobby Buttons: ZMButtonsOnlineClient" )
	end
	AddLargeButton( options, "btnBubblegumBuffs", "MENU_BUBBLEGUM_BUFFS_CAPS", LobbyNoAction, nil, false, true, false )
	AddLargeButton( options, "btnWeaponBuildKits", "MENU_WEAPON_BUILD_KITS_CAPS", LobbyNoAction, nil, true, true, false )
end

CoD.LobbyMenus.ZMButtonsPublicGame = function ( controller, options )
	print( "Lobby Buttons: ZMButtonsPublicGame" )
	AddLargeButton( options, "btnBubblegumBuffs", "MENU_BUBBLEGUM_BUFFS_CAPS", LobbyNoAction, nil, false, true, false )
	AddLargeButton( options, "btnWeaponBuildKits", "MENU_WEAPON_BUILD_KITS_CAPS", LobbyNoAction, nil, true, true, false )
	AddLargeButton( options, "btnLobbyLeaderboard", "MENU_LOBBY_LEADERBOARD_CAPS", LobbyNoAction, nil, false, true, false )
end

CoD.LobbyMenus.ZMButtonsCustomGame = function ( controller, options, isLeader )
	if isLeader == 1 then
		print( "Lobby Buttons: ZMButtonsCustomGameHost" )
		AddLargeButton( options, "btnStartMatch", "MENU_START_GAME_CAPS", LobbyOnlinePublicLaunchGame_SelectionList, nil, false, MapVoteTimerActive() )
		AddLargeButton( options, "btnSetupGame", "MPUI_SETUP_GAME_CAPS", OpenSetupGameZM, nil, true, MapVoteTimerActive() )
	else
		print( "Lobby Buttons: ZMButtonsCustomGameClient" )
	end
	AddLargeButton( options, "btnBubblegumBuffs", "MENU_BUBBLEGUM_BUFFS_CAPS", LobbyNoAction, nil, false, true, false )
	AddLargeButton( options, "btnWeaponBuildKits", "MENU_WEAPON_BUILD_KITS_CAPS", LobbyNoAction, nil, true, true, false )
end

CoD.LobbyMenus.ZMButtonsLAN = function ( controller, options, isLeader )
	if isLeader == 1 then
		print( "Lobby Buttons: ZMButtonsCustomGameHost" )
		AddLargeButton( options, "btnStartMatch", "MENU_START_GAME_CAPS", LobbyLANLaunchGame, nil, false, MapVoteTimerActive() )
		AddLargeButton( options, "btnSetupGame", "MPUI_SETUP_GAME_CAPS", OpenSetupGameZM, nil, true, MapVoteTimerActive() )
	else
		print( "Lobby Buttons: ZMButtonsCustomGameClient" )
	end
	AddLargeButton( options, "btnBubblegumBuffs", "MENU_BUBBLEGUM_BUFFS_CAPS", LobbyNoAction, nil, false, true, false )
	AddLargeButton( options, "btnWeaponBuildKits", "MENU_WEAPON_BUILD_KITS_CAPS", LobbyNoAction, nil, true, true, false )
end

CoD.LobbyMenus.ButtonsTheaterGame = function ( controller, options, isLeader )
	if isLeader == 1 then
		print( "Lobby Buttons: ButtonsTheaterGameHost" )
		AddSmallButton( options, "btnStartFilm", "MPUI_START_FILM_CAPS", LobbyTheaterStartFilm, nil, false, IsStartFilmButtonDisabled(), false, IsStartFilmButtonDisabled )
		AddSmallButton( options, "btnSelectFilm", "MENU_FILESHARE_SELECT_FILM_CAPS", OpenTheaterSelectFilm, nil, false, MapVoteTimerActive() )
		AddSmallButton( options, "btnCreateHighlightReel", "MPUI_CREATE_HIGHLIGHT_CAPS", LobbyTheaterCreateHighlightReel, nil, false, IsCreateHighlightReelButtonDisabled(), false, IsCreateHighlightReelButtonDisabled )
		AddSmallButton( options, "btnCoDCastFilm", "MPUI_SHOUTCAST_FILM_CAPS", LobbyTheaterShoutcastFilm, nil, false, IsShoutcastFilmButtonDisabled(), false, IsShoutcastFilmButtonDisabled )
		AddSmallButton( options, "btnRenderVideo", "MENU_DEMO_RENDER_CLIP_CAPS", nil, nil, false, true )
		AddSmallButton( options, "btnFilmOptions", "MENU_FILM_OPTIONS", nil, nil, true, true )
	else
		print( "Lobby Buttons: ButtonsTheaterGameClient" )
	end
end

local targetButtons = {
	[LobbyData.UITargets.UI_MAIN.id] = CoD.LobbyMenus.ModeSelect,
	[LobbyData.UITargets.UI_MODESELECT.id] = CoD.LobbyMenus.ModeSelect,
	[LobbyData.UITargets.UI_CPLOBBYLANGAME.id] = CoD.LobbyMenus.CPButtonsLAN,
	[LobbyData.UITargets.UI_CPLOBBYONLINE.id] = CoD.LobbyMenus.CPButtonsOnline,
	[LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id] = CoD.LobbyMenus.CPButtonsPublicGame,
	[LobbyData.UITargets.UI_MPLOBBYLANGAME.id] = CoD.LobbyMenus.MPButtonsLAN,
	[LobbyData.UITargets.UI_MPLOBBYONLINE.id] = CoD.LobbyMenus.MPButtonsOnline,
	[LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id] = CoD.LobbyMenus.MPButtonsOnlinePublic,
	[LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id] = CoD.LobbyMenus.MPButtonsCustomGame,
	[LobbyData.UITargets.UI_ZMLOBBYLANGAME.id] = CoD.LobbyMenus.ZMButtonsLAN,
	[LobbyData.UITargets.UI_ZMLOBBYONLINE.id] = CoD.LobbyMenus.ZMButtonsOnline,
	[LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id] = CoD.LobbyMenus.ZMButtonsPublicGame,
	[LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id] = CoD.LobbyMenus.ZMButtonsCustomGame,
	[LobbyData.UITargets.UI_THLOBBYONLINEGAME.id] = CoD.LobbyMenus.ButtonsTheaterGame
}
CoD.LobbyMenus.AddButtonsForTarget = function ( controller, id )
	local buttonFunc = targetButtons[id]
	local model = nil
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		model = Engine.GetModel( DataSources.Lobby.getModel( controller ), "gameClient.isHost" )
	else
		model = Engine.GetModel( DataSources.Lobby.getModel( controller ), "privateClient.isHost" )
	end
	local isLeader = nil
	if model ~= nil then
		isLeader = Engine.GetModelValue( model )
	else
		isLeader = 1
	end
	local result = {}
	buttonFunc( controller, result, isLeader )
	return result
end

