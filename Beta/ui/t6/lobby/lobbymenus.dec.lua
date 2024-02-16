require( "lua.Shared.LobbyData" )
require( "ui.uieditor.menus.CPLevels.CPMissionSelect" )
require( "ui.uieditor.menus.ZM.ZMMapSelection" )
require( "ui.T6.lobby.lobbymenubuttons" )

CoD.LobbyMenus = {}
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
	elseif button.selectedFunc ~= nil then
		button.selected = button.selectedFunc( button.selectedParam )
	end
	table.insert( options, {
		optionDisplay = button.stringRef,
		action = button.action,
		param = button.param,
		customId = button.customId,
		isLargeButton = isLargeButton,
		isLastButtonInGroup = false,
		disabled = button.disabled,
		selected = button.selected
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

CoD.LobbyMenus.ModeSelect = function ( controller, options, isLeader )
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if isLeader == 1 then
			if LuaUtils.IsGamescomBuild() then
				AddSpacer( options )
				AddSmallButton( controller, options, CoD.LobbyButtons.PLAY_LOCAL )
				AddSpacer( options )
			else
				AddLargeButton( controller, options, CoD.LobbyButtons.CP_ONLINE )
				AddLargeButton( controller, options, CoD.LobbyButtons.MP_ONLINE )
				AddLargeButton( controller, options, CoD.LobbyButtons.ZM_ONLINE )
				if Engine.IsCampaignModeUnlocked( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES ) == true then
					AddLargeButton( controller, options, CoD.LobbyButtons.CPZM_ONLINE )
				end
				AddLargeButton( controller, options, CoD.LobbyButtons.THEATER )
				AddSpacer( options )
				AddSmallButton( controller, options, CoD.LobbyButtons.PLAY_LOCAL )
				AddSpacer( options )
			end
		end
		AddSmallButton( controller, options, CoD.LobbyButtons.STORE )
	elseif IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.PLAY_ONLINE )
	elseif isLeader == 1 then
		if LuaUtils.IsGamescomBuild() then
			AddLargeButton( controller, options, CoD.LobbyButtons.MP_LAN )
			AddSmallButton( controller, options, CoD.LobbyButtons.FIND_LAN_GAME )
			AddSpacer( options )
		else
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_LAN )
			AddLargeButton( controller, options, CoD.LobbyButtons.MP_LAN )
			AddLargeButton( controller, options, CoD.LobbyButtons.ZM_LAN )
			if Engine.IsCampaignModeUnlocked( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES ) == true then
				AddLargeButton( controller, options, CoD.LobbyButtons.CPZM_LAN )
			end
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

CoD.LobbyMenus.CPZMButtonsOnline = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		if not Engine.IsCpInProgress() then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_START_GAME )
		else
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_RESUME_GAME )
		end
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
		if IsCPDemo() then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_START_GAME_E3 )
			return 
		elseif not Engine.IsCpInProgress() then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_START_GAME )
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		else
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_RESUME_GAME )
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		end
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
end

CoD.LobbyMenus.CPButtonsOnline = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		if not Engine.IsCpInProgress() then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_START_GAME )
		else
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_RESUME_GAME )
		end
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_JOIN_PUBLIC_GAME )
		AddLargeButton( controller, options, CoD.LobbyButtons.CP_GOTO_SAFEHOUSE )
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
	end
	AddSmallButton( controller, options, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
end

CoD.LobbyMenus.CPButtonsLAN = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		if IsCPDemo() then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_START_GAME_E3 )
			return 
		elseif not Engine.IsCpInProgress() then
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_LAN_START_GAME )
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		else
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_RESUME_GAME )
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_GOTO_SAFEHOUSE )
			AddLargeButton( controller, options, CoD.LobbyButtons.CP_SELECT_MISSION )
		end
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
end

CoD.LobbyMenus.MPButtonsOnline = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_FIND_MATCH )
		if Dvar.ui_execdemo_beta:get() == false or Dvar.beta_special:get() == true then
			AddLargeButton( controller, options, CoD.LobbyButtons.MP_CUSTOM_GAMES )
		end
		AddSpacer( options )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
	if IsGroupsEnabled() then
		AddSpacer( options )
		AddLargeButton( controller, options, CoD.LobbyButtons.GROUPS )
	end
	if Dvar.ui_execdemo_beta:get() and IsStoreAvailable() then
		AddLargeButton( controller, options, CoD.LobbyButtons.STORE )
	end
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.MPButtonsOnlinePublic = function ( controller, options, isLeader )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.MPButtonsPublicGame = function ( controller, options, isLeader )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
	AddSmallButton( controller, options, CoD.LobbyButtons.MP_LOBBY_LEADERBOARD )
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
	AddSpacer( options )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CODCASTER_SETTINGS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
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
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CAC )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SPECIALISTS )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_SCORESTREAKS )
	AddSpacer( options )
	AddLargeButton( controller, options, CoD.LobbyButtons.MP_CODCASTER_SETTINGS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		AddLargeButton( controller, options, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.ZMButtonsOnline = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_FIND_MATCH )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_CUSTOM_GAMES )
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
	else
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_MEGACHEW_FACTORY )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUILD_KITS )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_LOBBY_LEADERBOARD )
	end
end

CoD.LobbyMenus.ZMButtonsCustomGame = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_START_CUSTOM_GAME )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_SETUP_GAME )
		AddSpacer( options )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_MEGACHEW_FACTORY )
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ZMButtonsLAN = function ( controller, options, isLeader )
	if Engine.IsStarterPack() then
		AddSmallButton( controller, options, CoD.LobbyButtons.QUIT )
		return 
	elseif isLeader == 1 then
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_START_LAN_GAME )
		AddLargeButton( controller, options, CoD.LobbyButtons.ZM_SETUP_GAME )
		AddSpacer( options )
	end
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_MEGACHEW_FACTORY )
	AddLargeButton( controller, options, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ButtonsTheaterGame = function ( controller, options, isLeader )
	if isLeader == 1 then
		AddSmallButton( controller, options, CoD.LobbyButtons.TH_START_FILM )
		AddSmallButton( controller, options, CoD.LobbyButtons.TH_SELECT_FILM )
		AddSmallButton( controller, options, CoD.LobbyButtons.TH_CREATE_HIGHLIGHT )
		AddSmallButton( controller, options, CoD.LobbyButtons.TH_SHOUTCAST )
		AddSmallButton( controller, options, CoD.LobbyButtons.TH_RENDER )
		AddSmallButton( controller, options, CoD.LobbyButtons.TH_OPTIONS )
	end
end

local targetButtons = {
	[LobbyData.UITargets.UI_MAIN.id] = CoD.LobbyMenus.ModeSelect,
	[LobbyData.UITargets.UI_MODESELECT.id] = CoD.LobbyMenus.ModeSelect,
	[LobbyData.UITargets.UI_CPLOBBYLANGAME.id] = CoD.LobbyMenus.CPButtonsLAN,
	[LobbyData.UITargets.UI_CPLOBBYONLINE.id] = CoD.LobbyMenus.CPButtonsOnline,
	[LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id] = CoD.LobbyMenus.CPButtonsPublicGame,
	[LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id] = CoD.LobbyMenus.CPButtonsCustomGame,
	[LobbyData.UITargets.UI_CP2LOBBYLANGAME.id] = CoD.LobbyMenus.CPZMButtonsLAN,
	[LobbyData.UITargets.UI_CP2LOBBYONLINE.id] = CoD.LobbyMenus.CPZMButtonsOnline,
	[LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id] = CoD.LobbyMenus.CPZMButtonsPublicGame,
	[LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id] = CoD.LobbyMenus.CPButtonsCustomGame,
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
	buttonFunc( controller, result, isLeader )
	return result
end

