require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeRulesList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Description" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_MatchSettingsInfo" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Dvar.ui_gametype:get()
	local f1_local2 = nil
	local f1_local3 = CoD.GameOptions.TopLevelGametypeSettings[f1_local1]
	if f1_local3 and #f1_local3 > 0 then
		for f1_local7, f1_local8 in ipairs( f1_local3 ) do
			f1_local2 = CoD.GameOptions.GameSettings[f1_local8]
			table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local2.name, f1_local2.hintText, f1_local8, f1_local2, "GameTypeOptionsList_" .. f1_local8 ) )
		end
	end
	local f1_local4 = CoD.GameOptions.GlobalTopLevelGametypeSettings
	if f1_local4 and #f1_local4 > 0 then
		for f1_local8, f1_local9 in ipairs( f1_local4 ) do
			f1_local2 = CoD.GameOptions.GameSettings[f1_local9]
			table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local2.name, f1_local2.hintText, f1_local9, f1_local2, "GameTypeOptionsList_" .. f1_local9 ) )
		end
	end
	return f1_local0
end

local f0_local1 = function ( f2_arg0 )
	local f2_local0 = {
		[#f2_local0 + 1] = {
			optionDisplay = Engine.Localize( "MPUI_GAME_MODE_SETTINGS_CAPS", Engine.Localize( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" ) ) ),
			customId = "btnGameModeSettings",
			action = OpenMenuByNameParam,
			actionParam = "GameSettings_EditModeSpecificOptions",
			isLastButtonInGroup = true
		},
		[#f2_local0 + 1] = {
			optionDisplay = Engine.Localize( "MPUI_GENERAL_SETTINGS_CAPS" ),
			customId = "btnGeneralSettings",
			action = OpenMenuByNameParam,
			actionParam = "GameSettings_GeneralSettings"
		},
		[#f2_local0 + 1] = {
			optionDisplay = Engine.Localize( "MENU_SPAWN_SETTINGS_CAPS" ),
			customId = "btnSpawnSettings",
			action = OpenMenuByNameParam,
			actionParam = "GameSettings_SpawnSettings"
		},
		[#f2_local0 + 1] = {
			optionDisplay = Engine.Localize( "MENU_HEALTH_AND_DAMAGE_SETTINGS_CAPS" ),
			customId = "btnHealthAndDamageSettings",
			action = OpenMenuByNameParam,
			actionParam = "GameSettings_HealthAndDamageSettings",
			isLastButtonInGroup = true
		},
		[#f2_local0 + 1] = {
			optionDisplay = Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ),
			customId = "btnCompetitiveSettings",
			action = OpenMenuByNameParam,
			actionParam = "Competitive_Settings",
			isLastButtonInGroup = true
		}
	}
	if Engine.GetGametypeSetting( "disableClassSelection", true ) == 0 then
		f2_local0[#f2_local0 + 1] = {
			optionDisplay = Engine.Localize( "MENU_CUSTOM_CLASSES_CAPS" ),
			customId = "btnCustomClasses",
			action = OpenMenuByNameParam,
			actionParam = "CustomClassGameOptions"
		}
		f2_local0[#f2_local0 + 1] = {
			optionDisplay = Engine.Localize( "MENU_PRESET_CLASSES_CAPS" ),
			customId = "btnPresetClasses",
			action = OpenMenuByNameParam,
			actionParam = "EditDefaultClasses"
		}
	end
	local f2_local1 = {}
	for f2_local5, f2_local6 in ipairs( f2_local0 ) do
		table.insert( f2_local1, {
			models = {
				displayText = f2_local6.optionDisplay,
				customId = f2_local6.customId
			},
			properties = {
				action = f2_local6.action,
				actionParam = f2_local6.actionParam,
				isLastButtonInGroup = f2_local6.isLastButtonInGroup,
				spacing = f2_local6.spacing
			}
		} )
	end
	return f2_local1
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg0.GameModeSettingsButtons[f3_arg1].properties.isLastButtonInGroup then
		return 10
	else
		
	end
end

DataSources.GameModeSettings = DataSourceHelpers.ListSetup( "GameModeSettings", f0_local0, nil, nil, nil )
DataSources.GameModeSettingsButtons = DataSourceHelpers.ListSetup( "GameModeSettingsButtons", f0_local1, nil, nil, nil, f0_local2 )
local PostLoadFunc = function ( self, controller, menu )
	self.GameSettingsGameModeRulesList0.StartMenuOptionHighlight0.DescTitle:setText( Engine.Localize( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" ) ) )
end

CoD.GameSettings_GameModeRules = InheritFrom( LUI.UIElement )
CoD.GameSettings_GameModeRules.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_GameModeRules )
	self.id = "GameSettings_GameModeRules"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GameSettingsGameModeRulesList0 = CoD.GameSettings_GameModeRulesList.new( menu, controller )
	GameSettingsGameModeRulesList0:setLeftRight( true, false, -24.5, 590.5 )
	GameSettingsGameModeRulesList0:setTopBottom( true, false, 0, 720 )
	GameSettingsGameModeRulesList0.List0:setDataSource( "GameModeSettings" )
	GameSettingsGameModeRulesList0.List1:setDataSource( "GameModeSettingsButtons" )
	self:addElement( GameSettingsGameModeRulesList0 )
	self.GameSettingsGameModeRulesList0 = GameSettingsGameModeRulesList0
	
	local GameSettingsDescription0 = CoD.GameSettings_Description.new( menu, controller )
	GameSettingsDescription0:setLeftRight( true, false, 638.5, 1127.5 )
	GameSettingsDescription0:setTopBottom( true, false, 35.5, 170.5 )
	self:addElement( GameSettingsDescription0 )
	self.GameSettingsDescription0 = GameSettingsDescription0
	
	local GameSettingsMatchSettingsInfo0 = CoD.GameSettings_MatchSettingsInfo.new( menu, controller )
	GameSettingsMatchSettingsInfo0:setLeftRight( true, false, 726.5, 1039.5 )
	GameSettingsMatchSettingsInfo0:setTopBottom( true, false, 178, 520 )
	self:addElement( GameSettingsMatchSettingsInfo0 )
	self.GameSettingsMatchSettingsInfo0 = GameSettingsMatchSettingsInfo0
	
	GameSettingsGameModeRulesList0.id = "GameSettingsGameModeRulesList0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GameSettingsGameModeRulesList0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsGameModeRulesList0:close()
		element.GameSettingsDescription0:close()
		element.GameSettingsMatchSettingsInfo0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

