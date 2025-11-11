require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeRulesList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_SelectedItemInfo" )

local PrepareWinConditionOptions = function ( controller )
	local optionsTable = {}
	local gametype = Dvar.ui_gametype:get()
	local settingInfo = nil
	local topLevelSettings = CoD.OptionsUtility.TopLevelGametypeSettings[gametype]
	if topLevelSettings and #topLevelSettings > 0 then
		for index, setting in ipairs( topLevelSettings ) do
			settingInfo = CoD.OptionsUtility.GameSettings[setting]
			table.insert( optionsTable, CoD.OptionsUtility.CreateListOptions( controller, settingInfo.name, settingInfo.hintText, setting, settingInfo, "GameTypeOptionsList_" .. setting ) )
		end
	end
	return optionsTable
end

local PrepareOtherOptions = function ( controller )
	local gametype = Dvar.ui_gametype:get()
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	local gametypeName = gameTypeInfo.nameRefCaps
	local buttonOptions = {
		[#REG4 + 1] = {
			optionDisplay = Engine.Localize( "MENU_GAME_MODE_ADVANCED_CAPS", Engine.Localize( gametypeName ) ),
			description = "MENU_GAME_MODE_SETTINGS_DESC",
			customId = "btnGameModeSettings",
			action = OpenGameSettings_GameMode,
			actionParam = {
				"GameSettings_EditModeSpecificOptions"
			},
			isLastButtonInGroup = true
		},
		[#REG4 + 1] = {
			optionDisplay = Engine.Localize( "MENU_GENERAL_CAPS" ),
			description = "MENU_GENERAL_SETTINGS_DESC",
			customId = "btnGeneralSettings",
			action = OpenGameSettings_General,
			actionParam = {
				"GameSettings_GeneralSettings"
			}
		},
		[#REG4 + 1] = {
			optionDisplay = Engine.Localize( "MENU_SPAWN_CAPS" ),
			description = "MENU_SPAWN_SETTINGS_DESC",
			customId = "btnSpawnSettings",
			action = OpenGameSettings_Spawn,
			actionParam = {
				"GameSettings_SpawnSettings"
			}
		},
		[#REG4 + 1] = {
			optionDisplay = Engine.Localize( "MENU_HEALTH_AND_DAMAGE_CAPS" ),
			description = "MENU_HEALTH_AND_DAMAGE_SETTINGS_DESC",
			customId = "btnHealthAndDamageSettings",
			action = OpenGameSettings_HealthAndDamage,
			actionParam = {
				"GameSettings_HealthAndDamageSettings"
			},
			isLastButtonInGroup = true
		}
	}
	if IsGametypeTeambased() then
		buttonOptions[#buttonOptions + 1] = {
			optionDisplay = Engine.Localize( "MENU_COMPETITIVE_CAPS" ),
			description = "MENU_COMPETITIVE_SETTINGS_DESC",
			customId = "btnCompetitiveSettings",
			action = OpenGameSettings_Competitive,
			actionParam = {
				"GameSettings_Competitive"
			},
			isLastButtonInGroup = true
		}
	end
	if Engine.GetGametypeSetting( "disableClassSelection", true ) == 0 then
		buttonOptions[#buttonOptions + 1] = {
			optionDisplay = Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ),
			description = "MENU_CAC_SETTINGS_DESC",
			customId = "btnCustomClasses",
			action = OpenGameSettings_CreateAClass,
			actionParam = {
				"GameSettings_CreateAClassSettings"
			}
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
				title = buttonData.optionDisplay,
				desc = buttonData.description,
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

local SettingsUpdate = function ( controller, list, listModel )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource( false )
	end, false )
end

DataSources.GameModeSettings = DataSourceHelpers.ListSetup( "GameModeSettings", PrepareWinConditionOptions, nil, nil, SettingsUpdate )
DataSources.GameModeSettingsButtons = DataSourceHelpers.ListSetup( "GameModeSettingsButtons", PrepareOtherOptions, nil, nil, nil, SpacerFunction )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
	CoD.FileshareUtility.SetCurrentCategory( "customgame" )
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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 877 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Options = CoD.GameSettings_GameModeRulesList.new( menu, controller )
	Options:setLeftRight( 0, 0, 41, 963 )
	Options:setTopBottom( 0, 0, 0, 1080 )
	Options.Title.DescTitle:setText( Engine.Localize( "MENU_WIN_CONDITIONS_CAPS" ) )
	Options.Sliders:setDataSource( "GameModeSettings" )
	Options.Buttions:setDataSource( "GameModeSettingsButtons" )
	self:addElement( Options )
	self.Options = Options
	
	local GameSettingsSelectedItemInfo = CoD.GameSettings_SelectedItemInfo.new( menu, controller )
	GameSettingsSelectedItemInfo:setLeftRight( 0, 1, 0, 0 )
	GameSettingsSelectedItemInfo:setTopBottom( 0, 1, -202, 0 )
	GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsSelectedItemInfo )
	self.GameSettingsSelectedItemInfo = GameSettingsSelectedItemInfo
	
	self.resetProperties = function ()
		GameSettingsSelectedItemInfo:completeAnimation()
		GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local GameSettingsSelectedItemInfoFrame2 = function ( GameSettingsSelectedItemInfo, event )
					if not event.interrupted then
						GameSettingsSelectedItemInfo:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						GameSettingsSelectedItemInfo.GameModeInfo:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
					end
					GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GameSettingsSelectedItemInfo, event )
					else
						GameSettingsSelectedItemInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GameSettingsSelectedItemInfo:completeAnimation()
				GameSettingsSelectedItemInfo.GameModeInfo:completeAnimation()
				self.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
				GameSettingsSelectedItemInfoFrame2( GameSettingsSelectedItemInfo, {} )
			end
		}
	}
	Options.id = "Options"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Options:close()
		self.GameSettingsSelectedItemInfo:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

