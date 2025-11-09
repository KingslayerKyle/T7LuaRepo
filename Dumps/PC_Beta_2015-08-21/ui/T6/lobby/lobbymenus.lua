require( "lua.Shared.LobbyData" )
require( "ui.uieditor.menus.CPLevels.CPMissionSelect" )
require( "ui.uieditor.menus.ZM.ZMMapSelection" )
require( "ui.T6.lobby.lobbymenubuttons" )

CoD.LobbyMenus = {}
CoD.LobbyMenus.AddButtons = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = Engine.GetModel( DataSources.LobbyRoot.getModel( f1_arg0 ), f1_arg1 )
	local f1_local1 = nil
	if f1_local0 ~= nil then
		f1_local1 = Engine.GetModelValue( f1_local0 )
	end
	if f1_arg3 ~= nil then
		f1_arg3( f1_arg0, f1_arg2, f1_local1 )
	else
		print( "Error: No function provided to CoD.LobbyMenus.AddButtons" )
	end
end

CoD.LobbyMenus.AddButtonsMPCPZM = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5 )
	if Engine.GetModeName() == "CP" then
		CoD.LobbyMenus.AddButtons( f2_arg0, f2_arg1, f2_arg2, f2_arg4 )
	elseif Engine.GetModeName() == "MP" then
		CoD.LobbyMenus.AddButtons( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	elseif Engine.GetModeName() == "ZM" then
		CoD.LobbyMenus.AddButtons( f2_arg0, f2_arg1, f2_arg2, f2_arg5 )
	else
		print( "Error: no mode name set but AddButtonsMPCPZM called." )
	end
end

local f0_local0 = function ()
	return Dvar.ui_execdemo_cp:get()
end

local f0_local1 = function ()
	return Engine.IsStarterPack()
end

local f0_local2 = function ()
	return Dvar.ui_execdemo_gamescom:get()
end

local f0_local3 = function ()
	return Dvar.ui_execdemo_beta:get()
end

local f0_local4 = function ( f7_arg0, f7_arg1 )
	if f7_arg1 == nil then
		return 
	elseif f7_arg1 == CoD.LobbyButtons.DISABLED then
		f7_arg0.disabled = true
	elseif f7_arg1 == CoD.LobbyButtons.HIDDEN then
		f7_arg0.hidden = true
	end
end

local f0_local5 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	f8_arg2.disabled = false
	f8_arg2.hidden = false
	f8_arg2.selected = false
	if f8_arg2.defaultState ~= nil then
		if f8_arg2.defaultState == CoD.LobbyButtons.DISABLED then
			f8_arg2.disabled = true
		elseif f8_arg2.defaultState == CoD.LobbyButtons.HIDDEN then
			f8_arg2.hidden = true
		end
	end
	if f8_arg2.disabledFunc ~= nil then
		f8_arg2.disabled = f8_arg2.disabledFunc( f8_arg0 )
	end
	if f8_arg2.visibleFunc ~= nil then
		f8_arg2.hidden = not f8_arg2.visibleFunc( f8_arg0 )
	end
	if f0_local3() then
		f0_local4( f8_arg2, f8_arg2.demo_beta )
	elseif f0_local2() then
		f0_local4( f8_arg2, f8_arg2.demo_gamescom )
	elseif f0_local1() then
		f0_local4( f8_arg2, f8_arg2.starterPack )
	end
	if f8_arg2.hidden then
		return 
	elseif f8_arg2.selectedFunc ~= nil then
		f8_arg2.selected = f8_arg2.selectedFunc( f8_arg2.selectedParam )
	end
	table.insert( f8_arg1, {
		optionDisplay = f8_arg2.stringRef,
		action = f8_arg2.action,
		param = f8_arg2.param,
		customId = f8_arg2.customId,
		isLargeButton = f8_arg3,
		isLastButtonInGroup = false,
		disabled = f8_arg2.disabled,
		selected = f8_arg2.selected
	} )
end

local f0_local6 = function ( f9_arg0, f9_arg1, f9_arg2 )
	f0_local5( f9_arg0, f9_arg1, f9_arg2, true )
end

local f0_local7 = function ( f10_arg0, f10_arg1, f10_arg2 )
	f0_local5( f10_arg0, f10_arg1, f10_arg2, false )
end

local f0_local8 = function ( f11_arg0 )
	if 0 < #f11_arg0 then
		f11_arg0[#f11_arg0].isLastButtonInGroup = true
	end
end

CoD.LobbyMenus.ModeSelect = function ( f12_arg0, f12_arg1, f12_arg2 )
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if f12_arg2 == 1 then
			if LuaUtils.IsGamescomBuild() then
				f0_local8( f12_arg1 )
				f0_local7( f12_arg0, f12_arg1, CoD.LobbyButtons.PLAY_LOCAL )
				f0_local8( f12_arg1 )
			else
				f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.CP_ONLINE )
				f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.MP_ONLINE )
				f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.ZM_ONLINE )
				if Engine.IsCampaignModeUnlocked( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES ) == true then
					f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.CPZM_ONLINE )
				end
				f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.THEATER )
				f0_local8( f12_arg1 )
				f0_local7( f12_arg0, f12_arg1, CoD.LobbyButtons.PLAY_LOCAL )
				f0_local8( f12_arg1 )
			end
		end
		if CoD.isPC then
			f0_local7( f12_arg0, f12_arg1, CoD.LobbyButtons.STEAM_STORE )
		else
			f0_local7( f12_arg0, f12_arg1, CoD.LobbyButtons.STORE )
		end
	elseif f0_local1() then
		f0_local7( f12_arg0, f12_arg1, CoD.LobbyButtons.PLAY_ONLINE )
	elseif f12_arg2 == 1 then
		if LuaUtils.IsGamescomBuild() then
			f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.MP_LAN )
			f0_local7( f12_arg0, f12_arg1, CoD.LobbyButtons.FIND_LAN_GAME )
			f0_local8( f12_arg1 )
		else
			f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.CP_LAN )
			f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.MP_LAN )
			f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.ZM_LAN )
			if Engine.IsCampaignModeUnlocked( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES ) == true then
				f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.CPZM_LAN )
			end
			f0_local8( f12_arg1 )
			f0_local7( f12_arg0, f12_arg1, CoD.LobbyButtons.FIND_LAN_GAME )
			f0_local8( f12_arg1 )
			f0_local7( f12_arg0, f12_arg1, CoD.LobbyButtons.PLAY_ONLINE )
		end
	end
	if CoD.isPC then
		f0_local7( f12_arg0, f12_arg1, CoD.LobbyButtons.QUIT )
	end
end

CoD.LobbyMenus.CPZMButtonsOnline = function ( f13_arg0, f13_arg1, f13_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f13_arg0, f13_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f13_arg2 == 1 then
		if not Engine.IsCpInProgress() then
			f0_local6( f13_arg0, f13_arg1, CoD.LobbyButtons.CP_START_GAME )
		else
			f0_local6( f13_arg0, f13_arg1, CoD.LobbyButtons.CP_RESUME_GAME )
		end
		f0_local6( f13_arg0, f13_arg1, CoD.LobbyButtons.CP_JOIN_PUBLIC_GAME )
		f0_local6( f13_arg0, f13_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		f0_local6( f13_arg0, f13_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		f0_local6( f13_arg0, f13_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.CPZMButtonsPublicGame = function ( f14_arg0, f14_arg1, f14_arg2 )
	f0_local7( f14_arg0, f14_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
end

CoD.LobbyMenus.CPZMButtonsLAN = function ( f15_arg0, f15_arg1, f15_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f15_arg0, f15_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f15_arg2 == 1 then
		if f0_local0() then
			f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_START_GAME_E3 )
			return 
		elseif not Engine.IsCpInProgress() then
			f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_START_GAME )
			f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		else
			f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_RESUME_GAME )
			f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		end
	end
	f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
end

CoD.LobbyMenus.CPButtonsOnline = function ( f16_arg0, f16_arg1, f16_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f16_arg0, f16_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f16_arg2 == 1 then
		if not Engine.IsCpInProgress() then
			f0_local6( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_START_GAME )
		else
			f0_local6( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_RESUME_GAME )
		end
		f0_local6( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_JOIN_PUBLIC_GAME )
		f0_local6( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_GOTO_SAFEHOUSE )
		f0_local6( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		f0_local6( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		f0_local6( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.CPButtonsPublicGame = function ( f17_arg0, f17_arg1, f17_arg2 )
	f0_local7( f17_arg0, f17_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
end

CoD.LobbyMenus.CPButtonsCustomGame = function ( f18_arg0, f18_arg1, f18_arg2 )
	if f18_arg2 == 1 then
		f0_local7( f18_arg0, f18_arg1, CoD.LobbyButtons.CP_CUSTOM_START_GAME )
	end
	f0_local7( f18_arg0, f18_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
end

CoD.LobbyMenus.CPButtonsLAN = function ( f19_arg0, f19_arg1, f19_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f19_arg0, f19_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f19_arg2 == 1 then
		if f0_local0() then
			f0_local6( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_START_GAME_E3 )
			return 
		elseif not Engine.IsCpInProgress() then
			f0_local6( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_LAN_START_GAME )
			f0_local6( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		else
			f0_local6( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_RESUME_GAME )
			f0_local6( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_GOTO_SAFEHOUSE )
			f0_local6( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		end
	end
	f0_local6( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
end

CoD.LobbyMenus.MPButtonsOnline = function ( f20_arg0, f20_arg1, f20_arg2 )
	if f20_arg2 == 1 then
		f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.MP_FIND_MATCH )
		if Dvar.ui_execdemo_beta:get() == false or Dvar.beta_special:get() == true then
			f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.MP_CUSTOM_GAMES )
		end
		f0_local8( f20_arg1 )
	end
	f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	if IsGroupsEnabled() then
		f0_local8( f20_arg1 )
		f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.GROUPS )
	end
	if Dvar.ui_execdemo_beta:get() and IsStoreAvailable() then
		if CoD.isPC then
			f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.STEAM_STORE )
		else
			f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.STORE )
		end
	end
	if CoD.isPC and Dvar.ui_execdemo_beta:get() then
		f0_local8( f20_arg1 )
		f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.QUIT )
	end
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.MPButtonsOnlinePublic = function ( f21_arg0, f21_arg1, f21_arg2 )
	f0_local6( f21_arg0, f21_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f21_arg0, f21_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f21_arg0, f21_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f21_arg0, f21_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.MPButtonsPublicGame = function ( f22_arg0, f22_arg1, f22_arg2 )
	f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
	f0_local7( f22_arg0, f22_arg1, CoD.LobbyButtons.MP_LOBBY_LEADERBOARD )
end

CoD.LobbyMenus.MPButtonsCustomGame = function ( f23_arg0, f23_arg1, f23_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f23_arg0, f23_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f23_arg2 == 1 then
		f0_local7( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_CUSTOM_START_GAME )
		f0_local7( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME )
		f0_local8( f23_arg1 )
	end
	f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	f0_local8( f23_arg1 )
	f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_CODCASTER_SETTINGS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.MPButtonsLAN = function ( f24_arg0, f24_arg1, f24_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f24_arg0, f24_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f24_arg2 == 1 then
		f0_local7( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_CUSTOM_START_GAME )
		f0_local7( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME )
		f0_local8( f24_arg1 )
	end
	f0_local6( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	f0_local8( f24_arg1 )
	f0_local6( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_CODCASTER_SETTINGS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.ZMButtonsOnline = function ( f25_arg0, f25_arg1, f25_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f25_arg0, f25_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f25_arg2 == 1 then
		f0_local6( f25_arg0, f25_arg1, CoD.LobbyButtons.ZM_FIND_MATCH )
		f0_local6( f25_arg0, f25_arg1, CoD.LobbyButtons.ZM_CUSTOM_GAMES )
		f0_local8( f25_arg1 )
	end
	f0_local6( f25_arg0, f25_arg1, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	f0_local6( f25_arg0, f25_arg1, CoD.LobbyButtons.ZM_MEGACHEW_FACTORY )
	f0_local6( f25_arg0, f25_arg1, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ZMButtonsPublicGame = function ( f26_arg0, f26_arg1 )
	if Engine.IsStarterPack() then
		f0_local7( f26_arg0, f26_arg1, CoD.LobbyButtons.QUIT )
		return 
	else
		f0_local6( f26_arg0, f26_arg1, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
		f0_local6( f26_arg0, f26_arg1, CoD.LobbyButtons.ZM_MEGACHEW_FACTORY )
		f0_local6( f26_arg0, f26_arg1, CoD.LobbyButtons.ZM_BUILD_KITS )
		f0_local6( f26_arg0, f26_arg1, CoD.LobbyButtons.ZM_LOBBY_LEADERBOARD )
	end
end

CoD.LobbyMenus.ZMButtonsCustomGame = function ( f27_arg0, f27_arg1, f27_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f27_arg0, f27_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f27_arg2 == 1 then
		f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.ZM_START_CUSTOM_GAME )
		f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.ZM_SETUP_GAME )
		f0_local8( f27_arg1 )
	end
	f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.ZM_MEGACHEW_FACTORY )
	f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ZMButtonsLAN = function ( f28_arg0, f28_arg1, f28_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f28_arg0, f28_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f28_arg2 == 1 then
		f0_local6( f28_arg0, f28_arg1, CoD.LobbyButtons.ZM_START_LAN_GAME )
		f0_local6( f28_arg0, f28_arg1, CoD.LobbyButtons.ZM_SETUP_GAME )
		f0_local8( f28_arg1 )
	end
	f0_local6( f28_arg0, f28_arg1, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	f0_local6( f28_arg0, f28_arg1, CoD.LobbyButtons.ZM_MEGACHEW_FACTORY )
	f0_local6( f28_arg0, f28_arg1, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ButtonsTheaterGame = function ( f29_arg0, f29_arg1, f29_arg2 )
	if f29_arg2 == 1 then
		f0_local7( f29_arg0, f29_arg1, CoD.LobbyButtons.TH_START_FILM )
		f0_local7( f29_arg0, f29_arg1, CoD.LobbyButtons.TH_SELECT_FILM )
		f0_local7( f29_arg0, f29_arg1, CoD.LobbyButtons.TH_CREATE_HIGHLIGHT )
		f0_local7( f29_arg0, f29_arg1, CoD.LobbyButtons.TH_SHOUTCAST )
		f0_local7( f29_arg0, f29_arg1, CoD.LobbyButtons.TH_RENDER )
		f0_local7( f29_arg0, f29_arg1, CoD.LobbyButtons.TH_OPTIONS )
	end
end

local f0_local9 = {
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
CoD.LobbyMenus.AddButtonsForTarget = function ( f30_arg0, f30_arg1 )
	local f30_local0 = f0_local9[f30_arg1]
	local f30_local1 = nil
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f30_local1 = Engine.GetModel( DataSources.LobbyRoot.getModel( f30_arg0 ), "gameClient.isHost" )
	else
		f30_local1 = Engine.GetModel( DataSources.LobbyRoot.getModel( f30_arg0 ), "privateClient.isHost" )
	end
	local f30_local2 = nil
	if f30_local1 ~= nil then
		f30_local2 = Engine.GetModelValue( f30_local1 )
	else
		f30_local2 = 1
	end
	local f30_local3 = {}
	f30_local0( f30_arg0, f30_local3, f30_local2 )
	return f30_local3
end

