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
	if f8_arg2.newBreadcrumbFunc then
		f8_arg2.isBreadcrumbNew = f8_arg2.newBreadcrumbFunc( f8_arg0 )
	end
	table.insert( f8_arg1, {
		optionDisplay = f8_arg2.stringRef,
		action = f8_arg2.action,
		param = f8_arg2.param,
		customId = f8_arg2.customId,
		isLargeButton = f8_arg3,
		isLastButtonInGroup = false,
		disabled = f8_arg2.disabled,
		selected = f8_arg2.selected,
		isBreadcrumbNew = f8_arg2.isBreadcrumbNew
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
				Lobby_SetMaxLocalPlayers( 1 )
				f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.CP_ONLINE )
				f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.MP_ONLINE )
				f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.ZM_ONLINE )
				if Engine.IsCampaignModeUnlocked( Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES ) == true then
					f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.CPZM_ONLINE )
				end
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
			Lobby_SetMaxLocalPlayers( 4 )
			f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.CP_LAN )
			f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.MP_LAN )
			f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.ZM_LAN )
			f0_local6( f12_arg0, f12_arg1, CoD.LobbyButtons.FR_LAN )
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
		if HighestMapReachedGreaterThan( f13_arg0, 0 ) or Engine.IsCPInProgress() then
			f0_local6( f13_arg0, f13_arg1, CoD.LobbyButtons.CP_RESUME_GAME )
		else
			f0_local6( f13_arg0, f13_arg1, CoD.LobbyButtons.CP_START_GAME )
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
		if HighestMapReachedGreaterThan( f15_arg0, 0 ) or Engine.IsCPInProgress() then
			f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_RESUME_GAME )
		else
			f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_START_GAME )
		end
		f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		f0_local6( f15_arg0, f15_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	end
end

CoD.LobbyMenus.CP2ButtonsLANCUSTOM = function ( f16_arg0, f16_arg1, f16_arg2 )
	if f16_arg2 == 1 then
		f0_local7( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_CUSTOM_START_GAME )
		f0_local8( f16_arg1 )
		f0_local7( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
		f0_local6( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		f0_local6( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		f0_local7( f16_arg0, f16_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.CPButtonsOnline = function ( f17_arg0, f17_arg1, f17_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f17_arg0, f17_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f17_arg2 == 1 then
		if HighestMapReachedGreaterThan( f17_arg0, 0 ) or Engine.IsCPInProgress() then
			f0_local6( f17_arg0, f17_arg1, CoD.LobbyButtons.CP_RESUME_GAME )
		else
			f0_local6( f17_arg0, f17_arg1, CoD.LobbyButtons.CP_START_GAME )
		end
		f0_local8( f17_arg1 )
		f0_local6( f17_arg0, f17_arg1, CoD.LobbyButtons.CP_JOIN_PUBLIC_GAME )
		if HighestMapReachedGreaterThan( f17_arg0, 1 ) then
			f0_local6( f17_arg0, f17_arg1, CoD.LobbyButtons.CP_GOTO_SAFEHOUSE )
		end
		f0_local6( f17_arg0, f17_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		f0_local6( f17_arg0, f17_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		f0_local6( f17_arg0, f17_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.CPButtonsPublicGame = function ( f18_arg0, f18_arg1, f18_arg2 )
	f0_local7( f18_arg0, f18_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
end

CoD.LobbyMenus.CPButtonsCustomGame = function ( f19_arg0, f19_arg1, f19_arg2 )
	if f19_arg2 == 1 then
		f0_local7( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_CUSTOM_START_GAME )
		f0_local8( f19_arg1 )
		f0_local7( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
		f0_local6( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		f0_local6( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		f0_local7( f19_arg0, f19_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.CPButtonsLAN = function ( f20_arg0, f20_arg1, f20_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f20_arg0, f20_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f20_arg2 == 1 then
		if HighestMapReachedGreaterThan( f20_arg0, 0 ) or Engine.IsCPInProgress() then
			f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.CP_RESUME_GAME_LAN )
		else
			f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.CP_LAN_START_GAME )
		end
		f0_local8( f20_arg1 )
		if HighestMapReachedGreaterThan( f20_arg0, 1 ) then
			f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.CP_GOTO_SAFEHOUSE )
		end
		f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		f0_local6( f20_arg0, f20_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	end
end

CoD.LobbyMenus.CPButtonsLANCUSTOM = function ( f21_arg0, f21_arg1, f21_arg2 )
	if f21_arg2 == 1 then
		f0_local7( f21_arg0, f21_arg1, CoD.LobbyButtons.CP_CUSTOM_START_GAME )
		f0_local8( f21_arg1 )
		f0_local7( f21_arg0, f21_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
		f0_local6( f21_arg0, f21_arg1, CoD.LobbyButtons.CP_SELECT_MISSION )
		f0_local6( f21_arg0, f21_arg1, CoD.LobbyButtons.CP_CHOOSE_DIFFICULTY )
	else
		f0_local7( f21_arg0, f21_arg1, CoD.LobbyButtons.CP_MISSION_OVERVIEW )
	end
end

CoD.LobbyMenus.MPButtonsMain = function ( f22_arg0, f22_arg1, f22_arg2 )
	if f22_arg2 == 1 then
		f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.MP_PUBLIC_MATCH )
		if CompetitiveEnabled() then
			f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.MP_ARENA )
		end
		f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.MP_CUSTOM_GAMES )
		f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.FR_ONLINE )
		f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.THEATER_MP )
	end
	f0_local8( f22_arg1 )
	if CoD.isPC then
		f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.STEAM_STORE )
	else
		f0_local6( f22_arg0, f22_arg1, CoD.LobbyButtons.STORE )
	end
	if not DisableBlackMarket() then
		f0_local7( f22_arg0, f22_arg1, CoD.LobbyButtons.BLACK_MARKET )
	end
end

CoD.LobbyMenus.MPButtonsOnline = function ( f23_arg0, f23_arg1, f23_arg2 )
	if f23_arg2 == 1 then
		f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_FIND_MATCH )
		f0_local8( f23_arg1 )
	end
	f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	if IsGroupsEnabled() then
		f0_local8( f23_arg1 )
		f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.GROUPS )
	end
	if Dvar.ui_execdemo_beta:get() and IsStoreAvailable() then
		if CoD.isPC then
			f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.STEAM_STORE )
		else
			f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.STORE )
		end
	end
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f23_arg0, f23_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
	f0_local8( f23_arg1 )
	if not DisableBlackMarket() then
		f0_local7( f23_arg0, f23_arg1, CoD.LobbyButtons.BLACK_MARKET )
	end
end

CoD.LobbyMenus.MPButtonsOnlinePublic = function ( f24_arg0, f24_arg1, f24_arg2 )
	f0_local6( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f24_arg0, f24_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.MPButtonsPublicGame = function ( f25_arg0, f25_arg1, f25_arg2 )
	f0_local6( f25_arg0, f25_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f25_arg0, f25_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f25_arg0, f25_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f25_arg0, f25_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
	f0_local7( f25_arg0, f25_arg1, CoD.LobbyButtons.MP_LOBBY_LEADERBOARD )
end

CoD.LobbyMenus.MPButtonsCustomGame = function ( f26_arg0, f26_arg1, f26_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f26_arg0, f26_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f26_arg2 == 1 then
		f0_local7( f26_arg0, f26_arg1, CoD.LobbyButtons.MP_CUSTOM_START_GAME )
		f0_local7( f26_arg0, f26_arg1, CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME )
		f0_local8( f26_arg1 )
	end
	f0_local6( f26_arg0, f26_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f26_arg0, f26_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f26_arg0, f26_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	f0_local8( f26_arg1 )
	f0_local6( f26_arg0, f26_arg1, CoD.LobbyButtons.MP_CODCASTER_SETTINGS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f26_arg0, f26_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.MPButtonsArena = function ( f27_arg0, f27_arg1, f27_arg2 )
	if f27_arg2 == 1 then
		f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.MP_ARENA_FIND_MATCH )
		f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.MP_ARENA_SELECT_ARENA )
		f0_local8( f27_arg1 )
	end
	f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f27_arg0, f27_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
end

CoD.LobbyMenus.MPButtonsArenaGame = function ( f28_arg0, f28_arg1, f28_arg2 )
	f0_local6( f28_arg0, f28_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f28_arg0, f28_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f28_arg0, f28_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
end

CoD.LobbyMenus.MPButtonsLAN = function ( f29_arg0, f29_arg1, f29_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f29_arg0, f29_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f29_arg2 == 1 then
		f0_local7( f29_arg0, f29_arg1, CoD.LobbyButtons.MP_CUSTOM_START_GAME )
		f0_local7( f29_arg0, f29_arg1, CoD.LobbyButtons.MP_CUSTOM_SETUP_GAME )
		f0_local8( f29_arg1 )
	end
	f0_local6( f29_arg0, f29_arg1, CoD.LobbyButtons.MP_CAC )
	f0_local6( f29_arg0, f29_arg1, CoD.LobbyButtons.MP_SPECIALISTS )
	f0_local6( f29_arg0, f29_arg1, CoD.LobbyButtons.MP_SCORESTREAKS )
	f0_local8( f29_arg1 )
	f0_local6( f29_arg0, f29_arg1, CoD.LobbyButtons.MP_CODCASTER_SETTINGS )
	if Engine.DvarBool( nil, "inventory_test_button_visible" ) then
		f0_local6( f29_arg0, f29_arg1, CoD.LobbyButtons.MP_INVENTORY_TEST )
	end
end

CoD.LobbyMenus.ZMButtonsOnline = function ( f30_arg0, f30_arg1, f30_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f30_arg0, f30_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f30_arg2 == 1 then
		f0_local6( f30_arg0, f30_arg1, CoD.LobbyButtons.ZM_SOLO_GAME )
		f0_local6( f30_arg0, f30_arg1, CoD.LobbyButtons.ZM_FIND_MATCH )
		f0_local6( f30_arg0, f30_arg1, CoD.LobbyButtons.ZM_CUSTOM_GAMES )
		f0_local6( f30_arg0, f30_arg1, CoD.LobbyButtons.THEATER_ZM )
		f0_local8( f30_arg1 )
	end
	f0_local6( f30_arg0, f30_arg1, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	f0_local6( f30_arg0, f30_arg1, CoD.LobbyButtons.ZM_MEGACHEW_FACTORY )
	f0_local6( f30_arg0, f30_arg1, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ZMButtonsPublicGame = function ( f31_arg0, f31_arg1 )
	if Engine.IsStarterPack() then
		f0_local7( f31_arg0, f31_arg1, CoD.LobbyButtons.QUIT )
		return 
	else
		f0_local6( f31_arg0, f31_arg1, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
		f0_local6( f31_arg0, f31_arg1, CoD.LobbyButtons.ZM_BUILD_KITS )
		f0_local6( f31_arg0, f31_arg1, CoD.LobbyButtons.ZM_LOBBY_LEADERBOARD )
	end
end

CoD.LobbyMenus.ZMButtonsCustomGame = function ( f32_arg0, f32_arg1, f32_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f32_arg0, f32_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f32_arg2 == 1 then
		f0_local6( f32_arg0, f32_arg1, CoD.LobbyButtons.ZM_START_CUSTOM_GAME )
		f0_local6( f32_arg0, f32_arg1, CoD.LobbyButtons.ZM_CHANGE_MAP )
		f0_local8( f32_arg1 )
	end
	f0_local6( f32_arg0, f32_arg1, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	f0_local6( f32_arg0, f32_arg1, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.ZMButtonsLAN = function ( f33_arg0, f33_arg1, f33_arg2 )
	if Engine.IsStarterPack() then
		f0_local7( f33_arg0, f33_arg1, CoD.LobbyButtons.QUIT )
		return 
	elseif f33_arg2 == 1 then
		f0_local6( f33_arg0, f33_arg1, CoD.LobbyButtons.ZM_START_LAN_GAME )
		f0_local6( f33_arg0, f33_arg1, CoD.LobbyButtons.ZM_CHANGE_MAP )
		f0_local8( f33_arg1 )
	end
	f0_local6( f33_arg0, f33_arg1, CoD.LobbyButtons.ZM_BUBBLEGUM_BUFFS )
	f0_local6( f33_arg0, f33_arg1, CoD.LobbyButtons.ZM_BUILD_KITS )
end

CoD.LobbyMenus.FRButtonsOnlineGame = function ( f34_arg0, f34_arg1, f34_arg2 )
	f0_local6( f34_arg0, f34_arg1, CoD.LobbyButtons.FR_START_RUN_ONLINE )
	f0_local6( f34_arg0, f34_arg1, CoD.LobbyButtons.FR_CHANGE_MAP )
end

CoD.LobbyMenus.FRButtonsLANGame = function ( f35_arg0, f35_arg1, f35_arg2 )
	f0_local6( f35_arg0, f35_arg1, CoD.LobbyButtons.FR_START_RUN_LAN )
	f0_local6( f35_arg0, f35_arg1, CoD.LobbyButtons.FR_CHANGE_MAP )
end

CoD.LobbyMenus.ButtonsTheaterGame = function ( f36_arg0, f36_arg1, f36_arg2 )
	if f36_arg2 == 1 then
		f0_local7( f36_arg0, f36_arg1, CoD.LobbyButtons.TH_START_FILM )
		f0_local7( f36_arg0, f36_arg1, CoD.LobbyButtons.TH_SELECT_FILM )
		f0_local7( f36_arg0, f36_arg1, CoD.LobbyButtons.TH_CREATE_HIGHLIGHT )
		f0_local7( f36_arg0, f36_arg1, CoD.LobbyButtons.TH_SHOUTCAST )
		f0_local7( f36_arg0, f36_arg1, CoD.LobbyButtons.TH_RENDER )
		f0_local7( f36_arg0, f36_arg1, CoD.LobbyButtons.TH_OPTIONS )
	end
end

local f0_local9 = {
	[LobbyData.UITargets.UI_MAIN.id] = CoD.LobbyMenus.ModeSelect,
	[LobbyData.UITargets.UI_MODESELECT.id] = CoD.LobbyMenus.ModeSelect,
	[LobbyData.UITargets.UI_CPLOBBYLANGAME.id] = CoD.LobbyMenus.CPButtonsLAN,
	[LobbyData.UITargets.UI_CPLOBBYLANCUSTOMGAME.id] = CoD.LobbyMenus.CPButtonsLANCUSTOM,
	[LobbyData.UITargets.UI_CPLOBBYONLINE.id] = CoD.LobbyMenus.CPButtonsOnline,
	[LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id] = CoD.LobbyMenus.CPButtonsPublicGame,
	[LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id] = CoD.LobbyMenus.CPButtonsCustomGame,
	[LobbyData.UITargets.UI_CP2LOBBYLANGAME.id] = CoD.LobbyMenus.CPZMButtonsLAN,
	[LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id] = CoD.LobbyMenus.CPButtonsLANCUSTOM,
	[LobbyData.UITargets.UI_CP2LOBBYONLINE.id] = CoD.LobbyMenus.CPZMButtonsOnline,
	[LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id] = CoD.LobbyMenus.CPZMButtonsPublicGame,
	[LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id] = CoD.LobbyMenus.CPButtonsCustomGame,
	[LobbyData.UITargets.UI_MPLOBBYLANGAME.id] = CoD.LobbyMenus.MPButtonsLAN,
	[LobbyData.UITargets.UI_MPLOBBYMAIN.id] = CoD.LobbyMenus.MPButtonsMain,
	[LobbyData.UITargets.UI_MPLOBBYONLINE.id] = CoD.LobbyMenus.MPButtonsOnline,
	[LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id] = CoD.LobbyMenus.MPButtonsOnlinePublic,
	[LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id] = CoD.LobbyMenus.MPButtonsCustomGame,
	[LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id] = CoD.LobbyMenus.MPButtonsArena,
	[LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id] = CoD.LobbyMenus.MPButtonsArenaGame,
	[LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id] = CoD.LobbyMenus.FRButtonsOnlineGame,
	[LobbyData.UITargets.UI_FRLOBBYLANGAME.id] = CoD.LobbyMenus.FRButtonsLANGame,
	[LobbyData.UITargets.UI_ZMLOBBYLANGAME.id] = CoD.LobbyMenus.ZMButtonsLAN,
	[LobbyData.UITargets.UI_ZMLOBBYONLINE.id] = CoD.LobbyMenus.ZMButtonsOnline,
	[LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id] = CoD.LobbyMenus.ZMButtonsPublicGame,
	[LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id] = CoD.LobbyMenus.ZMButtonsCustomGame,
	[LobbyData.UITargets.UI_MPLOBBYONLINETHEATER.id] = CoD.LobbyMenus.ButtonsTheaterGame,
	[LobbyData.UITargets.UI_ZMLOBBYONLINETHEATER.id] = CoD.LobbyMenus.ButtonsTheaterGame
}
CoD.LobbyMenus.AddButtonsForTarget = function ( f37_arg0, f37_arg1 )
	local f37_local0 = f0_local9[f37_arg1]
	local f37_local1 = nil
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f37_local1 = Engine.GetModel( DataSources.LobbyRoot.getModel( f37_arg0 ), "gameClient.isHost" )
	else
		f37_local1 = Engine.GetModel( DataSources.LobbyRoot.getModel( f37_arg0 ), "privateClient.isHost" )
	end
	local f37_local2 = nil
	if f37_local1 ~= nil then
		f37_local2 = Engine.GetModelValue( f37_local1 )
	else
		f37_local2 = 1
	end
	local f37_local3 = {}
	f37_local0( f37_arg0, f37_local3, f37_local2 )
	return f37_local3
end

