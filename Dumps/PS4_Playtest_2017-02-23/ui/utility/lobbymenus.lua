require( "lua.Shared.LobbyData" )
require( "ui.uieditor.menus.CPLevels.CPMissionSelect" )
require( "ui.uieditor.menus.ZM.ZMMapSelection" )
require( "ui.utility.lobbymenubuttons" )

CoD.LobbyMenus = {}
CoD.LobbyMenus.History = {}
CoD.LobbyMenus.AddButtons = function ( controller, hostModelName, buttonsTable, func )
	local model = Engine.GetModel( DataSources.LobbyRoot.getModel( controller ), hostModelName )
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
	if Engine.GetModeName() == "CP" then
		CoD.LobbyMenus.AddButtons( controller, hostModelName, buttonsTable, cpFunc )
	elseif Engine.GetModeName() == "MP" then
		CoD.LobbyMenus.AddButtons( controller, hostModelName, buttonsTable, mpFunc )
	elseif Engine.GetModeName() == "ZM" then
		CoD.LobbyMenus.AddButtons( controller, hostModelName, buttonsTable, zmFunc )
	else
		print( "Error: no mode name set but AddButtonsMPCPZM called." )
	end
end

CoD.LobbyMenus.UpdateHistory = function ( controller, buttonId )
	local lobbyNav = LobbyData.GetLobbyNav()
	CoD.LobbyMenus.History[lobbyNav] = buttonId
end

local IsCPDemo = function ()
	return Dvar.ui_execdemo_cp:get()
end

local IsStarterPack = function ()
	return Engine.IsStarterPack()
end

local IsGamescomDemo = function ()
	return Dvar.ui_execdemo_gamescom:get()
end

local IsBetaDemo = function ()
	return Dvar.ui_execdemo_beta:get()
end

local SetButtonState = function ( button, state )
	if state == nil then
		return 
	elseif state == CoD.LobbyButtons.DISABLED then
		button.disabled = true
	elseif state == CoD.LobbyButtons.HIDDEN then
		button.hidden = true
	end
end

local AddButton = function ( controller, options, button, isLargeButton )
	button.disabled = false
	button.hidden = false
	button.selected = false
	button.warning = false
	if button.defaultState ~= nil then
		if button.defaultState == CoD.LobbyButtons.DISABLED then
			button.disabled = true
		elseif button.defaultState == CoD.LobbyButtons.HIDDEN then
			button.hidden = true
		end
	end
	if button.disabledFunc ~= nil then
		button.disabled = button.disabledFunc( controller )
	end
	if button.visibleFunc ~= nil then
		button.hidden = not button.visibleFunc( controller )
	end
	if IsBetaDemo() then
		SetButtonState( button, button.demo_beta )
	elseif IsGamescomDemo() then
		SetButtonState( button, button.demo_gamescom )
	elseif IsStarterPack() then
		SetButtonState( button, button.starterPack )
	end
	if button.hidden then
		return 
	end
	local lobbyNav = LobbyData.GetLobbyNav()
	if button.selectedFunc ~= nil then
		button.selected = button.selectedFunc( button.selectedParam )
	elseif CoD.LobbyMenus.History[lobbyNav] ~= nil then
		button.selected = CoD.LobbyMenus.History[lobbyNav] == button.customId
	end
	if button.newBreadcrumbFunc then
		local func = button.newBreadcrumbFunc
		if type( func ) == "string" then
			func = LUI.getTableFromPath( func )
		end
		if func then
			button.isBreadcrumbNew = func( controller )
		end
	end
	if button.warningFunc ~= nil then
		button.warning = button.warningFunc( controller )
	end
	table.insert( options, {
		optionDisplay = button.stringRef,
		action = button.action,
		param = button.param,
		customId = button.customId,
		isLargeButton = isLargeButton,
		isLastButtonInGroup = false,
		disabled = button.disabled,
		selected = button.selected,
		isBreadcrumbNew = button.isBreadcrumbNew,
		warning = button.warning
	} )
end

local AddLargeButton = function ( controller, options, button )
	AddButton( controller, options, button, true )
end

local AddSmallButton = function ( controller, options, button )
	AddButton( controller, options, button, false )
end

local AddSpacer = function ( options )
	if 0 < #options then
		options[#options].isLastButtonInGroup = true
	end
end

CoD.LobbyMenus.Main = function ( controller, options, isLeader )
	
end

CoD.LobbyMenus.ModeSelectLAN = function ( controller, options, isLeader )
	if IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.PLAY_ONLINE )
	elseif isLeader == 1 then
		if CoDShared.IsDirectorEnabled() == false and IsIntDvarNonZero( "mp_prototype" ) then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_LAN )
			AddLargeButton( controller, options, CoD.LobbyButtons.MP_LAN )
			AddSmallButton( controller, options, CoD.LobbyButtons.FIND_LAN_GAME )
			AddSpacer( options )
		else
			Lobby_SetMaxLocalPlayers( 4 )
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_LAN )
			AddLargeButton( controller, options, CoD.LobbyButtons.MP_LAN )
			AddLargeButton( controller, options, CoD.LobbyButtons.ZM_LAN )
			AddLargeButton( controller, options, CoD.LobbyButtons.BONUSMODES_LAN )
			AddSpacer( options )
			AddSmallButton( controller, options, CoD.LobbyButtons.FIND_LAN_GAME )
			AddSpacer( options )
			AddSmallButton( controller, options, CoD.LobbyButtons.PLAY_ONLINE )
		end
	end
	if CoD.isPC then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
	end
end

CoD.LobbyMenus.ModeSelectOnline = function ( controller, options, isLeader )
	if isLeader == 1 then
		if LuaUtils.IsGamescomBuild() then
			AddSpacer( options )
			AddSmallButton( controller, options, CoD.LobbyButtons.PLAY_LOCAL )
			AddSpacer( options )
		else
			Lobby_SetMaxLocalPlayers( 2 )
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_ONLINE )
			AddLargeButton( controller, options, CoD.LobbyButtons.MP_ONLINE )
			AddLargeButton( controller, options, CoD.LobbyButtons.ZM_ONLINE )
			AddLargeButton( controller, options, CoD.LobbyButtons.BONUSMODES_ONLINE )
			AddSpacer( options )
			AddSmallButton( controller, options, CoD.LobbyButtons.PLAY_LOCAL )
			AddSpacer( options )
		end
	end
	if CoD.isPC then
		AddSmallButton( controller, options, CoD.LobbyButtons.STEAM_STORE )
	else
		AddSmallButton( controller, options, CoD.LobbyButtons.STORE )
	end
	if CoD.isPC then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
	end
end

CoD.LobbyMenus.DOAButtonsOnline = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_DOA_START_GAME )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_DOA_JOIN_PUBLIC_GAME )
		AddSpacer( options )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_DOA_LEADERBOARD )
	else
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_DOA_LEADERBOARD )
	end
end

CoD.LobbyMenus.DOAButtonsPublicGame = function ( controller, options, isLeader )
	if Dvar.lobby_readyUpPercentRequired:get() > 0 then
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_READY_UP )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.CP_DOA_LEADERBOARD )
end

CoD.LobbyMenus.DOAButtonsLAN = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_DOA_START_GAME )
	end
end

CoD.LobbyMenus.CPAddNewGameOrResumeButton = function ( controller, options )
	
end

CoD.LobbyMenus.CPZMButtonsOnline = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		CoD.LobbyMenus.CPAddNewGameOrResumeButton( controller, options )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_JOIN_PUBLIC_GAME )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.CPZMButtonsPublicGame = function ( controller, options, isLeader )
	AddSmallButton( controller, options, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
end

CoD.LobbyMenus.CPZMButtonsLAN = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		CoD.LobbyMenus.CPAddNewGameOrResumeButton( controller, options )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	end
end

CoD.LobbyMenus.CP2ButtonsLANCUSTOM = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddSmallButton( controller, options, CoD.LobbyButtons.CP_CUSTOM_START_GAME )
		AddSpacer( options )
		AddSmallButton( controller, options, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		AddSmallButton( controller, options, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.CPButtonsOnline = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		CoD.LobbyMenus.CPAddNewGameOrResumeButton( controller, options )
		AddSpacer( options )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_JOIN_PUBLIC_GAME )
		if HighestMapReachedGreaterThan( controller, 1 ) then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_GOTO_SAFEHOUSE )
		end
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.CPButtonsPublicGame = function ( controller, options, isLeader )
	AddSmallButton( controller, options, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
end

CoD.LobbyMenus.CPButtonsCustomGame = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddSmallButton( controller, options, CoD.LobbyButtons.CP_CUSTOM_START_GAME )
		AddSpacer( options )
		AddSmallButton( controller, options, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		AddSmallButton( controller, options, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.CPButtonsLAN = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		if Engine.IsCPInProgress() then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_RESUME_GAME_LAN )
		else
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_LAN_START_GAME )
		end
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
	end
	AddSpacer( options )
	AddLargeButton( controller, options, CoD.LobbyButtons.CP_LOADOUTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHANGE_FACTION )
	if CoD.CPUtility.UseFaceCustomization( controller ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHANGE_FACE )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHANGE_COMPANION )
	AddLargeButton( controller, options, CoD.LobbyButtons.CP_COSMETICS )
end

CoD.LobbyMenus.CPButtonsLANCUSTOM = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddSmallButton( controller, options, CoD.LobbyButtons.CP_CUSTOM_START_GAME )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		AddSpacer( options )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHANGE_FACTION )
		if CoD.CPUtility.UseFaceCustomization( controller ) then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHANGE_FACE )
		end
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHANGE_COMPANION )
	else
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHANGE_FACTION )
		if CoD.CPUtility.UseFaceCustomization( controller ) then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHANGE_FACE )
		end
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHANGE_COMPANION )
	end
end

CoD.LobbyMenus.MPButtonsMain = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_PUBLIC_MATCH )
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_ARENA )
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_CUSTOM_GAMES )
		AddLargeButton( controller, options, CoD.LobbyButtons.THEATER_MP )
	end
	AddSpacer( options )
	if CoD.isPC then
		AddLargeButton( controller, options, CoD.LobbyButtons.STEAM_STORE )
	else
		AddLargeButton( controller, options, CoD.LobbyButtons.STORE )
	end
end

CoD.LobbyMenus.MPButtonsOnline = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_FIND_MATCH )
		AddSpacer( options )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_POSITION_LOADOUTS )
	if Dvar.ui_execdemo_beta:get() and IsStoreAvailable() then
		if CoD.isPC then
			AddLargeButton( controller, options, CoD.LobbyButtons.STEAM_STORE )
		else
			AddLargeButton( controller, options, CoD.LobbyButtons.STORE )
		end
	end
	if Engine.GetDvarBool( "inventory_test_button_visible" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
	AddSpacer( options )
	if not DisableBlackMarket() then
		AddSmallButton( controller, options, CoD.LobbyButtons.BLACK_MARKET )
	end
end

CoD.LobbyMenus.MPButtonsOnlinePublic = function ( controller, options, isLeader )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_POSITION_LOADOUTS )
	if Engine.GetDvarBool( "inventory_test_button_visible" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
	local playlistInfo = Engine.GetPlaylistInfoByID( Engine.GetPlaylistID() )
	if playlistInfo then
		local categoryId = playlistInfo.playlist.category
		if categoryId == Engine.GetPlaylistCategoryIdByName( "core" ) or categoryId == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
			AddSpacer( options )
			AddSmallButton( controller, options, CoD.LobbyButtons.MP_LOBBY_LEADERBOARD )
		end
	end
	if not DisableBlackMarket() then
		AddSpacer( options )
		AddSmallButton( controller, options, CoD.LobbyButtons.BLACK_MARKET )
	end
end

CoD.LobbyMenus.MPButtonsCustomGame = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		AddSmallButton( controller, options, CoD.LobbyButtons.MP_CUSTOM_START_GAME )
		AddSmallButton( controller, options, CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME )
		AddSpacer( options )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_POSITION_LOADOUTS )
	AddSpacer( options )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CODCASTER_SETTINGS )
	if Engine.GetDvarBool( "inventory_test_button_visible" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.MPButtonsArena = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_ARENA_FIND_MATCH )
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_ARENA_SELECT_ARENA )
		AddSpacer( options )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_POSITION_LOADOUTS )
	if not DisableBlackMarket() then
		AddSpacer( options )
		AddSmallButton( controller, options, CoD.LobbyButtons.BLACK_MARKET )
	end
end

CoD.LobbyMenus.MPButtonsArenaGame = function ( controller, options, isLeader )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_POSITION_LOADOUTS )
	if not DisableBlackMarket() then
		AddSpacer( options )
		AddSmallButton( controller, options, CoD.LobbyButtons.BLACK_MARKET )
	end
end

CoD.LobbyMenus.MPButtonsLAN = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		AddSmallButton( controller, options, CoD.LobbyButtons.MP_CUSTOM_START_GAME )
		AddSmallButton( controller, options, CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME )
		AddSpacer( options )
	end
	if CoDShared.IsDirectorEnabled() == false and IsIntDvarNonZero( "mp_prototype" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_POSITION_LOADOUTS )
	else
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
		AddSpacer( options )
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_CODCASTER_SETTINGS )
	end
	if Engine.GetDvarBool( "inventory_test_button_visible" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.ZMButtonsOnline = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_SOLO_GAME )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_FIND_MATCH )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_CUSTOM_GAMES )
		AddLargeButton( controller, options, CoD.LobbyButtons.THEATER_ZM )
		AddSpacer( options )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_MEGACHEW_FACTORY )
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ZMButtonsPublicGame = function ( controller, options )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif Dvar.lobby_readyUpPercentRequired:get() > 0 then
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_READY_UP )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ZMButtonsCustomGame = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_START_CUSTOM_GAME )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_CHANGE_MAP )
		AddSpacer( options )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_CHANGE_RANKED_SETTTINGS )
		AddSpacer( options )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ZMButtonsLAN = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_START_LAN_GAME )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_CHANGE_MAP )
		AddSpacer( options )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.FRButtonsOnlineGame = function ( controller, options, isLeader )
	AddLargeButton( controller, options, CoD.LobbyButtons.FR_START_RUN_ONLINE )
	AddLargeButton( controller, options, CoD.LobbyButtons.FR_CHANGE_MAP )
	AddSpacer( options )
	AddLargeButton( controller, options, CoD.LobbyButtons.FR_LEADERBOARD )
end

CoD.LobbyMenus.FRButtonsLANGame = function ( controller, options, isLeader )
	AddLargeButton( controller, options, CoD.LobbyButtons.FR_START_RUN_LAN )
	AddLargeButton( controller, options, CoD.LobbyButtons.FR_CHANGE_MAP )
end

CoD.LobbyMenus.ButtonsTheaterGame = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddSmallButton( controller, options, CoD.LobbyButtons.TH_START_FILM )
		AddSmallButton( controller, options, CoD.LobbyButtons.TH_SELECT_FILM )
		AddSmallButton( controller, options, CoD.LobbyButtons.TH_CREATE_HIGHLIGHT )
	end
end

local f0_local0 = {}
local f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
f0_local0[f0_local1.id] = CoD.LobbyMenus.Main
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
f0_local0[f0_local1.id] = CoD.LobbyMenus.ModeSelectLAN
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
f0_local0[f0_local1.id] = CoD.LobbyMenus.ModeSelectOnline
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPButtonsLAN
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP_CUSTOM )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPButtonsLANCUSTOM
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPButtonsOnline
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPButtonsPublicGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPButtonsCustomGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2 )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPZMButtonsLAN
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2_CUSTOM )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPButtonsLANCUSTOM
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2 )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPZMButtonsOnline
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_PUBLIC )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPZMButtonsPublicGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_CUSTOM )
f0_local0[f0_local1.id] = CoD.LobbyMenus.CPButtonsCustomGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA )
f0_local0[f0_local1.id] = CoD.LobbyMenus.DOAButtonsLAN
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
f0_local0[f0_local1.id] = CoD.LobbyMenus.DOAButtonsOnline
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
f0_local0[f0_local1.id] = CoD.LobbyMenus.DOAButtonsPublicGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
f0_local0[f0_local1.id] = CoD.LobbyMenus.MPButtonsLAN
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP )
f0_local0[f0_local1.id] = CoD.LobbyMenus.MPButtonsMain
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING )
f0_local0[f0_local1.id] = CoD.LobbyMenus.MPButtonsOnline
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
f0_local0[f0_local1.id] = CoD.LobbyMenus.MPButtonsOnlinePublic
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
f0_local0[f0_local1.id] = CoD.LobbyMenus.MPButtonsCustomGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA_STAGING )
f0_local0[f0_local1.id] = CoD.LobbyMenus.MPButtonsArena
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
f0_local0[f0_local1.id] = CoD.LobbyMenus.MPButtonsArenaGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
f0_local0[f0_local1.id] = CoD.LobbyMenus.FRButtonsOnlineGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
f0_local0[f0_local1.id] = CoD.LobbyMenus.FRButtonsLANGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_ZM )
f0_local0[f0_local1.id] = CoD.LobbyMenus.ZMButtonsLAN
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
f0_local0[f0_local1.id] = CoD.LobbyMenus.ZMButtonsOnline
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
f0_local0[f0_local1.id] = CoD.LobbyMenus.ZMButtonsPublicGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_CUSTOM )
f0_local0[f0_local1.id] = CoD.LobbyMenus.ZMButtonsCustomGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_THEATER )
f0_local0[f0_local1.id] = CoD.LobbyMenus.ButtonsTheaterGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_THEATER )
f0_local0[f0_local1.id] = CoD.LobbyMenus.ButtonsTheaterGame
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE_CP_CUSTOM )
f0_local0[f0_local1.id] = nil
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE_MP_PUBLIC )
f0_local0[f0_local1.id] = nil
f0_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE_MP_CUSTOM )
f0_local0[f0_local1.id] = nil
CoD.LobbyMenus.AddButtonsForTarget = function ( controller, id )
	local buttonFunc = f0_local0[id]
	local model = nil
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		model = Engine.GetModel( DataSources.LobbyRoot.getModel( controller ), "gameClient.isHost" )
	else
		model = Engine.GetModel( DataSources.LobbyRoot.getModel( controller ), "privateClient.isHost" )
	end
	local isLeader = nil
	if model ~= nil then
		isLeader = Engine.GetModelValue( model )
	else
		isLeader = 1
	end
	local result = {}
	if buttonFunc ~= nil then
		buttonFunc( controller, result, isLeader )
	end
	return result
end

f0_local1 = function ( controller, options, button )
	local disabled = false
	local hidden = false
	if button.defaultState ~= nil then
		if button.defaultState == CoD.LobbyButtons.DISABLED then
			disabled = true
		elseif button.defaultState == CoD.LobbyButtons.HIDDEN then
			hidden = true
		end
	end
	if button.visibleFunc ~= nil then
		hidden = not button.visibleFunc( controller )
	end
	if hidden then
		return 
	elseif button.disabledFunc ~= nil then
		disabled = button.disabledFunc( controller )
	end
	local callFnOrGetValue = function ( item, ... )
		local vargs = {
			n = select( "#", ... ),
			...
		}
		if type( item ) == "function" then
			return item( unpack( vargs ) )
		else
			return item
		end
	end
	
	local f44_local0 = table.insert
	local f44_local1 = options
	local f44_local2 = {
		freeCursorTitle = callFnOrGetValue( button.freeCursorTitle, controller )
	}
	local f44_local3 = callFnOrGetValue( button.description, controller )
	if not f44_local3 then
		f44_local3 = ""
	end
	f44_local2.description = f44_local3
	f44_local3 = callFnOrGetValue( button.image, controller )
	if not f44_local3 then
		f44_local3 = "blacktransparent"
	end
	f44_local2.image = f44_local3
	f44_local2.renderInfo = callFnOrGetValue( button.renderInfo, controller )
	f44_local2.action = button.flyoutAction
	f44_local2.param = button.flyoutParam
	f44_local2.customId = button.customId
	f44_local2.overrideWidget = button.overrideWidget
	f44_local2.disabled = disabled
	f44_local2.flyoutDatasource = button.flyoutDatasource
	f44_local0( f44_local1, f44_local2 )
end

CoD.LobbyMenus.CPFlyoutsLAN = function ( controller, options, isLeader )
	if isLeader == 1 then
		f0_local1( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
	end
	f0_local1( controller, options, CoD.LobbyButtons.CP_CHANGE_COMPANION )
	f0_local1( controller, options, CoD.LobbyButtons.CP_LOADOUTS )
	f0_local1( controller, options, CoD.LobbyButtons.CP_CHANGE_FACTION )
	if CoD.CPUtility.UseFaceCustomization( controller ) then
		f0_local1( controller, options, CoD.LobbyButtons.CP_CHANGE_FACE )
	end
	f0_local1( controller, options, CoD.LobbyButtons.CP_COSMETICS )
	if Engine.GetDvarBool( "lobby_hostBots" ) then
		f0_local1( controller, options, CoD.LobbyButtons.LOBBYBOTS_ADD_BOT )
		f0_local1( controller, options, CoD.LobbyButtons.LOBBYBOTS_REMOVE_BOT )
	end
end

CoD.LobbyMenus.CPFlyoutsLANCUSTOM = function ( controller, options, isLeader )
	if isLeader == 1 then
		f0_local1( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
	end
	f0_local1( controller, options, CoD.LobbyButtons.CP_CHANGE_COMPANION )
	f0_local1( controller, options, CoD.LobbyButtons.CP_LOADOUTS )
	f0_local1( controller, options, CoD.LobbyButtons.CP_CHANGE_FACTION )
	if CoD.CPUtility.UseFaceCustomization( controller ) then
		f0_local1( controller, options, CoD.LobbyButtons.CP_CHANGE_FACE )
	end
	f0_local1( controller, options, CoD.LobbyButtons.CP_COSMETICS )
	if Engine.GetDvarBool( "lobby_hostBots" ) then
		f0_local1( controller, options, CoD.LobbyButtons.LOBBYBOTS_ADD_BOT )
		f0_local1( controller, options, CoD.LobbyButtons.LOBBYBOTS_REMOVE_BOT )
	end
end

CoD.LobbyMenus.MPFlyoutsLAN = function ( controller, options, isLeader )
	if IsIntDvarNonZero( "mp_prototype" ) or CoDShared.IsDirectorEnabled() == true then
		f0_local1( controller, options, CoD.LobbyButtons.MP_POSITION_LOADOUTS )
	else
		f0_local1( controller, options, CoD.LobbyButtons.MP_CAC )
		f0_local1( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
		f0_local1( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
		f0_local1( controller, options, CoD.LobbyButtons.MP_CODCASTER_SETTINGS )
	end
	if isLeader == 1 then
		f0_local1( controller, options, CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME )
	end
	if Engine.GetDvarBool( "inventory_test_button_visible" ) then
		f0_local1( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
	if Engine.GetDvarBool( "lobby_hostBots" ) then
		f0_local1( controller, options, CoD.LobbyButtons.LOBBYBOTS_ADD_BOT )
		f0_local1( controller, options, CoD.LobbyButtons.LOBBYBOTS_REMOVE_BOT )
	end
end

local f0_local2 = {}
local f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
f0_local2[f0_local3.id] = CoD.LobbyMenus.CPFlyoutsLAN
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP_CUSTOM )
f0_local2[f0_local3.id] = CoD.LobbyMenus.CPFlyoutsLANCUSTOM
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2 )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2_CUSTOM )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2 )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_PUBLIC )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_CUSTOM )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
f0_local2[f0_local3.id] = CoD.LobbyMenus.MPFlyoutsLAN
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA_STAGING )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_ZM )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_CUSTOM )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_THEATER )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_THEATER )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE_CP_CUSTOM )
f0_local2[f0_local3.id] = CoD.LobbyMenus.CPFlyoutsLANCUSTOM
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE_MP_PUBLIC )
f0_local2[f0_local3.id] = nil
f0_local3 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE_MP_CUSTOM )
f0_local2[f0_local3.id] = CoD.LobbyMenus.MPFlyoutsLAN
CoD.LobbyMenus.AddFlyoutsForTarget = function ( controller, id )
	local flyoutFunc = f0_local2[id]
	local model = nil
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		model = Engine.GetModel( DataSources.LobbyRoot.getModel( controller ), "gameClient.isHost" )
	else
		model = Engine.GetModel( DataSources.LobbyRoot.getModel( controller ), "privateClient.isHost" )
	end
	local isLeader = nil
	if model ~= nil then
		isLeader = Engine.GetModelValue( model )
	else
		isLeader = 1
	end
	local result = {}
	if flyoutFunc then
		flyoutFunc( controller, result, isLeader )
	end
	return result
end

