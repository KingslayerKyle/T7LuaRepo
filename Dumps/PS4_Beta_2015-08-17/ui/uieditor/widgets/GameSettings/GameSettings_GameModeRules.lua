require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeRulesList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Description" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_MatchSettingsInfo" )

local PrepareGameTypeOptions = function ( controller )
	local optionsTable = {}
	local gametype = Dvar.ui_gametype:get()
	local settingInfo = nil
	local topLevelSettings = CoD.GameOptions.TopLevelGametypeSettings[gametype]
	if topLevelSettings and #topLevelSettings > 0 then
		for index, setting in ipairs( topLevelSettings ) do
			settingInfo = CoD.GameOptions.GameSettings[setting]
			table.insert( optionsTable, CoD.OptionsUtility.CreateListOptions( controller, settingInfo.name, settingInfo.hintText, setting, settingInfo, "GameTypeOptionsList_" .. setting ) )
		end
	end
	local globalTopLevelSettings = CoD.GameOptions.GlobalTopLevelGametypeSettings
	if globalTopLevelSettings and #globalTopLevelSettings > 0 then
		for index, setting in ipairs( globalTopLevelSettings ) do
			settingInfo = CoD.GameOptions.GameSettings[setting]
			table.insert( optionsTable, CoD.OptionsUtility.CreateListOptions( controller, settingInfo.name, settingInfo.hintText, setting, settingInfo, "GameTypeOptionsList_" .. setting ) )
		end
	end
	return optionsTable
end

local PrepareOtherOptions = function ( controller )
	local gametype = Dvar.ui_gametype:get()
	local gametypeName = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref_caps" )
	local buttonOptions = {
		[#REG3 + 1] = {
			optionDisplay = Engine.Localize( "MPUI_GAME_MODE_SETTINGS_CAPS", Engine.Localize( gametypeName ) ),
			customId = "btnGameModeSettings",
			action = OpenMenuByNameParam,
			actionParam = "GameSettings_EditModeSpecificOptions",
			isLastButtonInGroup = true
		},
		[#REG3 + 1] = {
			optionDisplay = Engine.Localize( "MPUI_GENERAL_SETTINGS_CAPS" ),
			customId = "btnGeneralSettings",
			action = OpenMenuByNameParam,
			actionParam = "GameSettings_GeneralSettings"
		},
		[#REG3 + 1] = {
			optionDisplay = Engine.Localize( "MENU_SPAWN_SETTINGS_CAPS" ),
			customId = "btnSpawnSettings",
			action = OpenMenuByNameParam,
			actionParam = "GameSettings_SpawnSettings"
		},
		[#REG3 + 1] = {
			optionDisplay = Engine.Localize( "MENU_HEALTH_AND_DAMAGE_SETTINGS_CAPS" ),
			customId = "btnHealthAndDamageSettings",
			action = OpenMenuByNameParam,
			actionParam = "GameSettings_HealthAndDamageSettings",
			isLastButtonInGroup = true
		},
		[#REG3 + 1] = {
			optionDisplay = Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ),
			customId = "btnCompetitiveSettings",
			action = OpenMenuByNameParam,
			actionParam = "Competitive_Settings",
			isLastButtonInGroup = true
		}
	}
	if Engine.GetGametypeSetting( "disableClassSelection", true ) == 0 then
		buttonOptions[#buttonOptions + 1] = {
			optionDisplay = Engine.Localize( "MENU_CUSTOM_CLASSES_CAPS" ),
			customId = "btnCustomClasses",
			action = OpenMenuByNameParam,
			actionParam = "CustomClassGameOptions"
		}
		buttonOptions[#buttonOptions + 1] = {
			optionDisplay = Engine.Localize( "MENU_PRESET_CLASSES_CAPS" ),
			customId = "btnPresetClasses",
			action = OpenMenuByNameParam,
			actionParam = "EditDefaultClasses"
		}
	end
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = buttonData.optionDisplay,
				customId = buttonData.customId
			},
			properties = {
				action = buttonData.action,
				actionParam = buttonData.actionParam,
				isLastButtonInGroup = buttonData.isLastButtonInGroup,
				spacing = buttonData.spacing
			}
		} )
	end
	return buttons
end

local SpacerFunction = function ( list, row, widgetHeight )
	if list.GameModeSettingsButtons[row].properties.isLastButtonInGroup then
		return 10
	else
		
	end
end

DataSources.GameModeSettings = DataSourceHelpers.ListSetup( "GameModeSettings", PrepareGameTypeOptions, nil, nil, nil )
DataSources.GameModeSettingsButtons = DataSourceHelpers.ListSetup( "GameModeSettingsButtons", PrepareOtherOptions, nil, nil, nil, SpacerFunction )
local PostLoadFunc = function ( self, controller, menu )
	local gametype = Dvar.ui_gametype:get()
	local gametypeName = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref_caps" )
	self.GameSettingsGameModeRulesList0.StartMenuOptionHighlight0.DescTitle:setText( Engine.Localize( gametypeName ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsGameModeRulesList0:close()
		self.GameSettingsDescription0:close()
		self.GameSettingsMatchSettingsInfo0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

