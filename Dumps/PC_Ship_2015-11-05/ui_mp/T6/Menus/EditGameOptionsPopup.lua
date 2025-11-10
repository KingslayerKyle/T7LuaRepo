require( "ui_mp.T6.GameOptions" )
require( "ui_mp.T6.Menus.EditGeneralOptionsMenu" )
require( "ui_mp.T6.Menus.CustomClassGameOptions" )
require( "ui_mp.T6.Menus.EditDefaultClasses" )
require( "ui.uieditor.menus.Competitive.Competitive_Settings" )

local f0_local0, f0_local1, f0_local2, f0_local3, f0_local4, f0_local5, f0_local6, f0_local7, f0_local8, f0_local9, f0_local10, f0_local11, f0_local12 = nil
LUI.createMenu.EditGameOptions = function ( f1_arg0 )
	local f1_local0 = CoD.GameOptionsMenu.New( f1_arg0, "EditGameOptions" )
	local f1_local1 = Dvar.ui_gametype:get()
	local f1_local2 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f1_local1, "name_ref_caps" )
	local self = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	self:setPriority( -100 )
	self:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
	f1_local0:addElement( self )
	f1_local0:addTitle( Engine.Localize( "MPUI_RULES_CAPS", Engine.Localize( f1_local2 ) ) )
	f1_local0.resetToDefaultButton = CoD.ButtonPrompt.new( "select", Engine.Localize( "MENU_RESET_TO_DEFAULT" ), f1_local0, "button_prompt_reset_to_default", false, nil, false, nil, "R" )
	f1_local0:addRightButtonPrompt( f1_local0.resetToDefaultButton )
	f1_local0.saveButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_SAVE" ), f1_local0, "button_prompt_save_game_settings", false, nil, false, nil, "S" )
	if Engine.SessionModeIsMode( CoD.SESSIONMODE_ONLINE ) then
		f1_local0:addRightButtonPrompt( f1_local0.saveButton )
	end
	f1_local0:registerEventHandler( "button_prompt_back", f0_local1 )
	f1_local0:registerEventHandler( "button_prompt_reset_to_default", f0_local8 )
	f1_local0:registerEventHandler( "button_prompt_save_game_settings", f0_local9 )
	f1_local0:registerEventHandler( "open_game_mode_specific_settings", f0_local2 )
	f1_local0:registerEventHandler( "open_general_settings", f0_local3 )
	f1_local0:registerEventHandler( "open_competitive_settings", OpenCompetitiveSettingsMenu )
	f1_local0:registerEventHandler( "open_health_and_damage_settings", f0_local4 )
	f1_local0:registerEventHandler( "open_spawn_settings", f0_local5 )
	f1_local0:registerEventHandler( "open_custom_classes", f0_local6 )
	f1_local0:registerEventHandler( "open_default_classes", f0_local7 )
	local f1_local4 = CoD.GameOptions.TopLevelGametypeSettings[f1_local1]
	if f1_local4 and #f1_local4 > 0 then
		for f1_local8, f1_local9 in ipairs( f1_local4 ) do
			f1_local0:addGametypeSetting( f1_arg0, f1_local9 )
		end
	end
	local f1_local5 = CoD.GameOptions.GlobalTopLevelGametypeSettings
	if f1_local5 and #f1_local5 > 0 then
		for f1_local9, f1_local10 in ipairs( f1_local5 ) do
			f1_local0:addGametypeSetting( f1_arg0, f1_local10 )
		end
	end
	if not (not f1_local4 or #f1_local4 <= 0) or f1_local5 and #f1_local5 > 0 then
		f1_local0.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	end
	local f1_local6 = CoD.GameOptions.SubLevelGametypeSettings[f1_local1]
	if f1_local6 and #f1_local6 > 0 then
		local f1_local7 = f1_local0.buttonList:addButton( Engine.Localize( "MPUI_GAME_MODE_SETTINGS_CAPS", Engine.Localize( f1_local2 ) ) )
		f1_local7:setActionEventNameNewStyle( f1_local0, f1_arg0, "open_game_mode_specific_settings" )
		f1_local7:registerEventHandler( "button_update", f0_local10 )
		f1_local7.gametypeSettings = f1_local6
		CoD.GameOptions.ShowStarForGametypeSettings( f1_local7, f1_local6 )
	end
	local f1_local7 = f1_local0.buttonList:addButton( Engine.Localize( "MPUI_GENERAL_SETTINGS_CAPS" ) )
	f1_local7.gametypeSettings = CoD.GameOptions.GeneralSettings
	f1_local7:setActionEventNameNewStyle( f1_local0, f1_arg0, "open_general_settings" )
	f1_local7:registerEventHandler( "button_update", f0_local10 )
	CoD.GameOptions.ShowStarForGametypeSettings( f1_local7, CoD.GameOptions.GeneralSettings )
	local f1_local8 = f1_local0.buttonList:addButton( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	f1_local8:setActionEventNameNewStyle( f1_local0, f1_arg0, "open_competitive_settings" )
	f1_local8:registerEventHandler( "button_update", f0_local10 )
	local f1_local9 = f1_local0.buttonList:addButton( Engine.Localize( "MENU_SPAWN_SETTINGS_CAPS" ) )
	f1_local9.gametypeSettings = CoD.GameOptions.SpawnSettings
	f1_local9:setActionEventNameNewStyle( f1_local0, f1_arg0, "open_spawn_settings" )
	f1_local9:registerEventHandler( "button_update", f0_local10 )
	CoD.GameOptions.ShowStarForGametypeSettings( f1_local9, CoD.GameOptions.SpawnSettings )
	local f1_local10 = f1_local0.buttonList:addButton( Engine.Localize( "MENU_HEALTH_AND_DAMAGE_SETTINGS_CAPS" ) )
	f1_local10.gametypeSettings = CoD.GameOptions.HealthAndDamageSettings
	f1_local10:setActionEventNameNewStyle( f1_local0, f1_arg0, "open_health_and_damage_settings" )
	f1_local10:registerEventHandler( "button_update", f0_local10 )
	CoD.GameOptions.ShowStarForGametypeSettings( f1_local10, CoD.GameOptions.HealthAndDamageSettings )
	f1_local0.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	if Engine.GetGametypeSetting( "disableClassSelection", true ) == 0 then
		local f1_local11 = f1_local0.buttonList:addButton( Engine.Localize( "MENU_CUSTOM_CLASSES_CAPS" ) )
		f1_local11:setActionEventNameNewStyle( f1_local0, f1_arg0, "open_custom_classes" )
		f1_local11:registerEventHandler( "button_update", f0_local11 )
		f1_local11.gametypeSettings = CoD.GameOptions.CustomClassSettings
		f0_local11( f1_local11 )
		local f1_local12 = f1_local0.buttonList:addButton( Engine.Localize( "MENU_PRESET_CLASSES_CAPS" ) )
		f1_local12:setActionEventNameNewStyle( f1_local0, f1_arg0, "open_default_classes" )
		f1_local12:registerEventHandler( "button_update", f0_local12 )
		f1_local12.gametypeSettings = CoD.GameOptions.PresetClassSettings
		f0_local12( f1_local12 )
	end
	if not f1_local0.buttonList:restoreState() then
		f1_local0.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return f1_local0
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	Engine.PartyHostClearUIState()
	CoD.GameOptionsMenu.ButtonPromptBack( f2_arg0, f2_arg1 )
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	f3_arg0.buttonList:saveState()
	f3_arg0:openMenu( "EditModeSpecificOptions", f3_arg1.controller )
	f3_arg0:close()
end

f0_local3 = function ( f4_arg0, f4_arg1 )
	f4_arg0.buttonList:saveState()
	f4_arg0:openMenu( "EditGeneralOptions", f4_arg1.controller )
	f4_arg0:close()
end

function OpenCompetitiveSettingsMenu( f5_arg0, f5_arg1 )
	f5_arg0.buttonList:saveState()
	f5_arg0:openMenu( "Competitive_Settings", f5_arg1.controller )
	f5_arg0:close()
end

f0_local6 = function ( f6_arg0, f6_arg1 )
	f6_arg0.buttonList:saveState()
	f6_arg0:openMenu( "CustomClassGameOptions", f6_arg1.controller )
	f6_arg0:close()
end

f0_local7 = function ( f7_arg0, f7_arg1 )
	f7_arg0.buttonList:saveState()
	f7_arg0:openMenu( "EditDefaultClasses", f7_arg1.controller )
	f7_arg0:close()
end

f0_local4 = function ( f8_arg0, f8_arg1 )
	f8_arg0.buttonList:saveState()
	f8_arg0:openMenu( "HealthAndDamageSettings", f8_arg1.controller )
	f8_arg0:close()
end

f0_local5 = function ( f9_arg0, f9_arg1 )
	f9_arg0.buttonList:saveState()
	f9_arg0:openMenu( "SpawnSettings", f9_arg1.controller )
	f9_arg0:close()
end

f0_local8 = function ( f10_arg0, f10_arg1 )
	Engine.SetGametype( Dvar.ui_gametype:get() )
	f10_arg0:processEvent( {
		name = "button_update"
	} )
end

f0_local9 = function ( f11_arg0, f11_arg1 )
	if Engine.CanViewContent() == false then
		f11_arg0:openPopup( "popup_contentrestricted", f11_arg1.controller )
		return 
	else
		Engine.Exec( f11_arg1.controller, "gamesettings_clearuploadinfo" )
		local f11_local0 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" )
		CoD.perController[f11_arg1.controller].fileshareSaveCategory = "customgame"
		CoD.perController[f11_arg1.controller].fileshareSaveIsCopy = false
		CoD.perController[f11_arg1.controller].fileshareSaveIsPooled = false
		CoD.perController[f11_arg1.controller].fileshareSaveName = Engine.Localize( f11_local0 )
		CoD.perController[f11_arg1.controller].fileshareSaveDescription = ""
	end
end

LUI.createMenu.HealthAndDamageSettings = function ( f12_arg0 )
	local f12_local0 = CoD.GameOptionsMenu.New( f12_arg0, "HealthAndDamageSettings" )
	local self = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	self:setPriority( -100 )
	f12_local0:addElement( self )
	f12_local0:addTitle( Engine.Localize( "MENU_HEALTH_AND_DAMAGE_SETTINGS_CAPS" ) )
	for f12_local5, f12_local6 in ipairs( CoD.GameOptions.HealthAndDamageSettings ) do
		f12_local0:addGametypeSetting( f12_arg0, f12_local6 )
	end
	if not f12_local0.buttonList:restoreState() then
		f12_local0.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return f12_local0
end

LUI.createMenu.SpawnSettings = function ( f13_arg0 )
	local f13_local0 = CoD.GameOptionsMenu.New( f13_arg0, "SpawnSettings" )
	local self = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	self:setPriority( -100 )
	f13_local0:addElement( self )
	f13_local0:addTitle( Engine.Localize( "MENU_SPAWN_SETTINGS_CAPS" ) )
	for f13_local5, f13_local6 in ipairs( CoD.GameOptions.SpawnSettings ) do
		f13_local0:addGametypeSetting( f13_arg0, f13_local6 )
	end
	if not f13_local0.buttonList:restoreState() then
		f13_local0.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return f13_local0
end

f0_local0 = function ( f14_arg0 )
	for f14_local0 = 0, 4, 1 do
		if not Engine.IsPresetClassDefault( f14_arg0, f14_local0 ) then
			return false
		end
	end
	return true
end

f0_local10 = function ( f15_arg0, f15_arg1 )
	CoD.GameOptions.ShowStarForGametypeSettings( f15_arg0, f15_arg0.gametypeSettings )
end

f0_local11 = function ( f16_arg0, f16_arg1 )
	if CoD.GameOptions.ShowStarForGametypeSettings( f16_arg0, f16_arg0.gametypeSettings ) then
		return 
	end
	for f16_local0 = 0, 255, 1 do
		if Engine.IsItemIndexRestricted( f16_local0 ) ~= Engine.IsItemIndexRestricted( f16_local0, true ) then
			f16_arg0:showStarIcon( true )
			return 
		end
	end
	if CoD.GameOptions.AreAnyAttachmentsRestricted() then
		f16_arg0:showStarIcon( true )
		return 
	end
	f16_arg0:showStarIcon( false )
end

f0_local12 = function ( f17_arg0, f17_arg1 )
	if CoD.GameOptions.ShowStarForGametypeSettings( f17_arg0, f17_arg0.gametypeSettings ) then
		return 
	elseif Engine.GetGametypeSetting( "presetClassesPerTeam" ) == 0 then
		if not f0_local0( Enum.team_t.TEAM_FREE ) then
			f17_arg0:showStarIcon( true )
			return 
		end
	else
		local f17_local0 = Engine.GetGametypeSetting( "teamCount" )
		for f17_local1 = 0, f17_local0 - 1, 1 do
			if not f0_local0( Enum.team_t.TEAM_FIRST_PLAYING_TEAM + f17_local1 ) then
				f17_arg0:showStarIcon( true )
				return 
			end
		end
	end
	f17_arg0:showStarIcon( false )
end

