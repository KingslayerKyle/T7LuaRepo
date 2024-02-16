-- 469ade5dab03a36dcf161efb31dbcedd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.backgrounds.MP_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.ServerBrowser.ServerBrowserCheckBox" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )
require( "ui.uieditor.widgets.Groups.GroupsInputButtonScroll" )
require( "ui.uieditor.widgets.Groups.GroupsSubTitle" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = {
		mp_freerun_01 = 1,
		mp_freerun_02 = 2,
		mp_freerun_03 = 3,
		mp_freerun_04 = 4
	}
	return f1_local0[f1_arg0] ~= nil
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	return CoD.mapsTable[f2_arg0].unique_id < CoD.mapsTable[f2_arg1].unique_id
end

DataSources.ServerBrowserFilter = DataSourceHelpers.ListSetup( "ServerBrowserFilter", function ( f3_arg0, f3_arg1 )
	local f3_local0 = function ( f4_arg0 )
		local f4_local0
		if CoD.mapsTable[f4_arg0].dlc_pack == 0 and CoD.mapsTable[f4_arg0].session_mode == Enum.eModes.MODE_MULTIPLAYER then
			f4_local0 = not f0_local0( f4_arg0 )
		else
			f4_local0 = false
		end
		return f4_local0
	end
	
	local f3_local1 = CoD.mapsTable
	local f3_local2 = {}
	table.insert( f3_local2, {
		models = {
			type = Enum.SteamServerFilterType.STEAM_SERVER_BROWSER_FILTERTYPE_MAP,
			id = "any",
			name = "PLATFORM_ANY"
		}
	} )
	for f3_local6, f3_local7 in LUI.IterateTableBySortedKeys( f3_local1, f0_local1, f3_local0 ) do
		table.insert( f3_local2, {
			models = {
				type = Enum.SteamServerFilterType.STEAM_SERVER_BROWSER_FILTERTYPE_MAP,
				id = f3_local6,
				name = f3_local7.mapName
			}
		} )
	end
	return f3_local2
end, true )
DataSources.ServerBrowserDLCFilter = DataSourceHelpers.ListSetup( "ServerBrowserDLCFilter", function ( f5_arg0, f5_arg1 )
	local f5_local0 = function ( f6_arg0 )
		local f6_local0
		if CoD.mapsTable[f6_arg0].dlc_pack > 0 and CoD.mapsTable[f6_arg0].session_mode == Enum.eModes.MODE_MULTIPLAYER then
			f6_local0 = not f0_local0( f6_arg0 )
		else
			f6_local0 = false
		end
		return f6_local0
	end
	
	local f5_local1 = CoD.mapsTable
	local f5_local2 = {}
	for f5_local6, f5_local7 in LUI.IterateTableBySortedKeys( f5_local1, f0_local1, f5_local0 ) do
		table.insert( f5_local2, {
			models = {
				type = Enum.SteamServerFilterType.STEAM_SERVER_BROWSER_FILTERTYPE_MAP,
				id = f5_local6,
				name = f5_local7.mapName
			}
		} )
	end
	return f5_local2
end, true )
DataSources.ServerBrowserGameModeFilter = DataSourceHelpers.ListSetup( "ServerBrowserGameModeFilter", function ( f7_arg0, f7_arg1 )
	local f7_local0 = {}
	local f7_local1 = Engine.GetGametypesBase( Enum.eModes.MODE_MULTIPLAYER )
	table.insert( f7_local0, {
		models = {
			type = Enum.SteamServerFilterType.STEAM_SERVER_BROWSER_FILTERTYPE_GAMETYPE,
			id = "any",
			name = "PLATFORM_ANY"
		}
	} )
	for f7_local5, f7_local6 in pairs( f7_local1 ) do
		if f7_local6.category == "standard" and CoD.AllowGameType( f7_local6.gametype ) then
			table.insert( f7_local0, {
				models = {
					type = Enum.SteamServerFilterType.STEAM_SERVER_BROWSER_FILTERTYPE_GAMETYPE,
					id = f7_local6.gametype,
					name = f7_local6.name
				}
			} )
		end
	end
	return f7_local0
end, true )
DataSources.ServerBrowserAttributeFilter = DataSourceHelpers.ListSetup( "ServerBrowserAttributeFilter", function ( f8_arg0, f8_arg1 )
	local f8_local0 = {}
	table.insert( f8_local0, {
		models = {
			attribute = "any",
			name = "PLATFORM_ANY"
		}
	} )
	table.insert( f8_local0, {
		models = {
			attribute = Enum.SteamServerAttributeFilter.STEAM_SERVER_BROWSER_ATTRIBUTEFILTER_DEDICATED,
			name = "PLATFORM_MODS_DEDICATED"
		}
	} )
	table.insert( f8_local0, {
		models = {
			attribute = Enum.SteamServerAttributeFilter.STEAM_SERVER_BROWSER_ATTRIBUTEFILTER_NOTDEDICATED,
			name = "PLATFORM_MODS_NOTDEDICATED"
		}
	} )
	table.insert( f8_local0, {
		models = {
			attribute = Enum.SteamServerAttributeFilter.STEAM_SERVER_BROWSER_ATTRIBUTEFILTER_RANKED,
			name = "PLATFORM_MODS_RANKED"
		}
	} )
	table.insert( f8_local0, {
		models = {
			attribute = Enum.SteamServerAttributeFilter.STEAM_SERVER_BROWSER_ATTRIBUTEFILTER_UNRANKED,
			name = "PLATFORM_MODS_UNRANKED"
		}
	} )
	table.insert( f8_local0, {
		models = {
			attribute = Enum.SteamServerAttributeFilter.STEAM_SERVER_BROWSER_ATTRIBUTEFILTER_HARDCORE,
			name = "PLATFORM_MODS_HARDCORE"
		}
	} )
	table.insert( f8_local0, {
		models = {
			attribute = Enum.SteamServerAttributeFilter.STEAM_SERVER_BROWSER_ATTRIBUTEFILTER_CORE,
			name = "PLATFORM_MODS_CORE"
		}
	} )
	return f8_local0
end, true )
DataSources.ServerBrowserModsFilter = DataSourceHelpers.ListSetup( "ServerBrowserModsFilter", function ( f9_arg0, f9_arg1 )
	local f9_local0 = {}
	local f9_local1 = Engine.Mods_Lists_GetInfoEntries( LuaEnums.MODS_BASE_PATH, 0, Engine.Mods_Lists_GetInfoEntriesCount( LuaEnums.MODS_BASE_PATH ) )
	if f9_local1 then
		for f9_local2 = 0, #f9_local1, 1 do
			local f9_local5 = f9_local1[f9_local2]
			table.insert( f9_local0, {
				models = {
					type = Enum.SteamServerFilterType.STEAM_SERVER_BROWSER_FILTERTYPE_MOD,
					id = f9_local5.ugcName,
					name = f9_local5.name
				}
			} )
		end
	end
	return f9_local0
end, true )
local PreLoadFunc = function ( self, controller )
	local f10_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "serverBrowser.filterRefresh" )
	local f10_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "steamServer.keywordsFilter" )
	local f10_local2 = Engine.GetModelValue( f10_local1 )
	if f10_local2 then
		CoD.PCUtil.SetServerKeywordsFilter( f10_local2 )
	else
		Engine.SetModelValue( f10_local1, "" )
	end
end

local PostLoadFunc = function ( f11_arg0, f11_arg1 )
	f11_arg0.dlcMapFilters:setDataSource( "ServerBrowserDLCFilter" )
	f11_arg0.gameModeFilters:setDataSource( "ServerBrowserGameModeFilter" )
	f11_arg0.attributeFilters:setDataSource( "ServerBrowserAttributeFilter" )
	f11_arg0.modsFilters:setDataSource( "ServerBrowserModsFilter" )
	f11_arg0.keywordsInput.subscription = f11_arg0.keywordsInput:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "steamServer.keywordsFilter" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f11_arg0.keywordsInput.verticalScrollingTextBox.textBox:setText( modelValue )
		end
	end )
end

LUI.createMenu.ServerBrowserFilters = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ServerBrowserFilters" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ServerBrowserFilters.buttonPrompts" )
	local f13_local1 = self
	self.anyChildUsesUpdateState = true
	
	local MPBackground = CoD.MP_Background.new( f13_local1, controller )
	MPBackground:setLeftRight( true, false, 0, 1280 )
	MPBackground:setTopBottom( true, false, 0, 720 )
	self:addElement( MPBackground )
	self.MPBackground = MPBackground
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f13_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 95, 712.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( f13_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FILTER_SERVERS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FILTER_SERVERS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local mapFilters = LUI.UIList.new( f13_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	mapFilters:makeFocusable()
	mapFilters:setLeftRight( true, false, 90, 240 )
	mapFilters:setTopBottom( true, false, 125, 663 )
	mapFilters:setWidgetType( CoD.ServerBrowserCheckBox )
	mapFilters:setVerticalCount( 20 )
	mapFilters:setDataSource( "ServerBrowserFilter" )
	mapFilters:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	mapFilters:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	f13_local1:AddButtonCallbackFunction( mapFilters, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		ServerBrowserToggleFilter( self, f16_arg0, f16_arg1, f16_arg3 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( mapFilters )
	self.mapFilters = mapFilters
	
	local mapsLabel = LUI.UIText.new()
	mapsLabel:setLeftRight( true, false, 90, 290 )
	mapsLabel:setTopBottom( true, false, 95, 125 )
	mapsLabel:setText( Engine.Localize( "MENU_MAPS_CAPS" ) )
	mapsLabel:setTTF( "fonts/default.ttf" )
	mapsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	mapsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( mapsLabel )
	self.mapsLabel = mapsLabel
	
	local dlcMapFilters = LUI.UIList.new( f13_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	dlcMapFilters:makeFocusable()
	dlcMapFilters:setLeftRight( true, false, 255, 405 )
	dlcMapFilters:setTopBottom( true, false, 125, 663 )
	dlcMapFilters:setWidgetType( CoD.ServerBrowserCheckBox )
	dlcMapFilters:setVerticalCount( 20 )
	dlcMapFilters:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	dlcMapFilters:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	f13_local1:AddButtonCallbackFunction( dlcMapFilters, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		ServerBrowserToggleFilter( self, f20_arg0, f20_arg1, f20_arg3 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( dlcMapFilters )
	self.dlcMapFilters = dlcMapFilters
	
	local dlcMapsLabel = LUI.UIText.new()
	dlcMapsLabel:setLeftRight( true, false, 255, 455 )
	dlcMapsLabel:setTopBottom( true, false, 95, 125 )
	dlcMapsLabel:setText( Engine.Localize( "MPUI_DLC_MAPS_CAPS" ) )
	dlcMapsLabel:setTTF( "fonts/default.ttf" )
	dlcMapsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	dlcMapsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( dlcMapsLabel )
	self.dlcMapsLabel = dlcMapsLabel
	
	local gameModeFilters = LUI.UIList.new( f13_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	gameModeFilters:makeFocusable()
	gameModeFilters:setLeftRight( true, false, 419.2, 569.2 )
	gameModeFilters:setTopBottom( true, false, 125, 663 )
	gameModeFilters:setWidgetType( CoD.ServerBrowserCheckBox )
	gameModeFilters:setVerticalCount( 20 )
	gameModeFilters:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f22_local0
	end )
	gameModeFilters:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	f13_local1:AddButtonCallbackFunction( gameModeFilters, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		ServerBrowserToggleFilter( self, f24_arg0, f24_arg1, f24_arg3 )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( gameModeFilters )
	self.gameModeFilters = gameModeFilters
	
	local gameModesLabel = LUI.UIText.new()
	gameModesLabel:setLeftRight( true, false, 419.2, 619.2 )
	gameModesLabel:setTopBottom( true, false, 95, 125 )
	gameModesLabel:setText( Engine.Localize( "MPUI_GAMEMODE_CAPS" ) )
	gameModesLabel:setTTF( "fonts/default.ttf" )
	gameModesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gameModesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( gameModesLabel )
	self.gameModesLabel = gameModesLabel
	
	local attributeFilters = LUI.UIList.new( f13_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	attributeFilters:makeFocusable()
	attributeFilters:setLeftRight( true, false, 581.2, 731.2 )
	attributeFilters:setTopBottom( true, false, 125, 339 )
	attributeFilters:setWidgetType( CoD.ServerBrowserCheckBox )
	attributeFilters:setVerticalCount( 8 )
	attributeFilters:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f26_local0
	end )
	attributeFilters:registerEventHandler( "lose_focus", function ( element, event )
		local f27_local0 = nil
		if element.loseFocus then
			f27_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f27_local0 = element.super:loseFocus( event )
		end
		return f27_local0
	end )
	f13_local1:AddButtonCallbackFunction( attributeFilters, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		ServerBrowserToggleFilter( self, f28_arg0, f28_arg1, f28_arg3 )
		return true
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( attributeFilters )
	self.attributeFilters = attributeFilters
	
	local attributeLabel = LUI.UIText.new()
	attributeLabel:setLeftRight( true, false, 581.2, 781.2 )
	attributeLabel:setTopBottom( true, false, 95, 125 )
	attributeLabel:setText( Engine.Localize( "MENU_TYPE_CAPS" ) )
	attributeLabel:setTTF( "fonts/default.ttf" )
	attributeLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	attributeLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( attributeLabel )
	self.attributeLabel = attributeLabel
	
	local modsLabel = LUI.UITightText.new()
	modsLabel:setLeftRight( true, false, 746.7, 815.7 )
	modsLabel:setTopBottom( true, false, 95, 125 )
	modsLabel:setText( Engine.Localize( "MENU_MODS_CAPS" ) )
	modsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( modsLabel )
	self.modsLabel = modsLabel
	
	local modsFilters = LUI.UIList.new( f13_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	modsFilters:makeFocusable()
	modsFilters:setLeftRight( true, false, 746.7, 896.7 )
	modsFilters:setTopBottom( true, false, 125, 339 )
	modsFilters:setWidgetType( CoD.ServerBrowserCheckBox )
	modsFilters:setVerticalCount( 8 )
	modsFilters:setVerticalScrollbar( CoD.verticalScrollbar )
	modsFilters:registerEventHandler( "gain_focus", function ( element, event )
		local f30_local0 = nil
		if element.gainFocus then
			f30_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f30_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f30_local0
	end )
	modsFilters:registerEventHandler( "lose_focus", function ( element, event )
		local f31_local0 = nil
		if element.loseFocus then
			f31_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f31_local0 = element.super:loseFocus( event )
		end
		return f31_local0
	end )
	f13_local1:AddButtonCallbackFunction( modsFilters, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
		ServerBrowserToggleFilter( self, f32_arg0, f32_arg1, f32_arg3 )
		return true
	end, function ( f33_arg0, f33_arg1, f33_arg2 )
		CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( modsFilters )
	self.modsFilters = modsFilters
	
	local keywordsInput = CoD.GroupsInputButtonScroll.new( f13_local1, controller )
	keywordsInput:setLeftRight( true, false, 569.2, 954.2 )
	keywordsInput:setTopBottom( true, false, 453, 561.5 )
	keywordsInput.verticalScrollingTextBox.textBox:setText( Engine.Localize( "" ) )
	keywordsInput.verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	keywordsInput:registerEventHandler( "gain_focus", function ( element, event )
		local f34_local0 = nil
		if element.gainFocus then
			f34_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f34_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f34_local0
	end )
	keywordsInput:registerEventHandler( "lose_focus", function ( element, event )
		local f35_local0 = nil
		if element.loseFocus then
			f35_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f35_local0 = element.super:loseFocus( event )
		end
		return f35_local0
	end )
	f13_local1:AddButtonCallbackFunction( keywordsInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		ServerFiltersEditKeywords( self, f36_arg0, f36_arg2 )
		return true
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( keywordsInput )
	self.keywordsInput = keywordsInput
	
	local keywordsTitle = CoD.GroupsSubTitle.new( f13_local1, controller )
	keywordsTitle:setLeftRight( true, false, 569.2, 737.2 )
	keywordsTitle:setTopBottom( true, false, 413, 445 )
	keywordsTitle.weaponNameLabel:setText( Engine.Localize( "PLATFORM_KEYWORDS_CAPS" ) )
	self:addElement( keywordsTitle )
	self.keywordsTitle = keywordsTitle
	
	mapFilters.navigation = {
		right = dlcMapFilters
	}
	dlcMapFilters.navigation = {
		left = mapFilters,
		right = gameModeFilters
	}
	gameModeFilters.navigation = {
		left = dlcMapFilters,
		right = keywordsInput
	}
	attributeFilters.navigation = {
		left = gameModeFilters,
		right = modsFilters,
		down = keywordsInput
	}
	modsFilters.navigation = {
		left = attributeFilters,
		down = keywordsInput
	}
	keywordsInput.navigation = {
		left = gameModeFilters,
		up = {
			attributeFilters,
			modsFilters
		}
	}
	CoD.Menu.AddNavigationHandler( f13_local1, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f38_local0 = nil
		ServerFiltersHandleKeyboardComplete( self, element, controller, event )
		if not f38_local0 then
			f38_local0 = element:dispatchEventToChildren( event )
		end
		return f38_local0
	end )
	f13_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		RefreshLobbyServerBrowser( self )
		GoBack( self, f39_arg2 )
		return true
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	mapFilters.id = "mapFilters"
	dlcMapFilters.id = "dlcMapFilters"
	gameModeFilters.id = "gameModeFilters"
	attributeFilters.id = "attributeFilters"
	modsFilters.id = "modsFilters"
	keywordsInput.id = "keywordsInput"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f13_local1
	} )
	if not self:restoreState() then
		self.mapFilters:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MPBackground:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.mapFilters:close()
		element.dlcMapFilters:close()
		element.gameModeFilters:close()
		element.attributeFilters:close()
		element.modsFilters:close()
		element.keywordsInput:close()
		element.keywordsTitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ServerBrowserFilters.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

