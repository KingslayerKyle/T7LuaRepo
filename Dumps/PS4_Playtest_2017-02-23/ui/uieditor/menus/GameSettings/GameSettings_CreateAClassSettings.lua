require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeRulesList" )

local PrepareCreateAClassSettings = function ( controller )
	local optionsTable = {}
	local gametype = Dvar.ui_gametype:get()
	local setting, settingInfo = nil
	setting = "disableCAC"
	settingInfo = CoD.OptionsUtility.GameSettings[setting]
	table.insert( optionsTable, CoD.OptionsUtility.CreateListOptions( controller, settingInfo.name, settingInfo.hintText, setting, settingInfo, "CreateAClassList_" .. setting ) )
	setting = "maxAllocation"
	settingInfo = CoD.OptionsUtility.GameSettings[setting]
	table.insert( optionsTable, CoD.OptionsUtility.CreateListOptions( controller, settingInfo.name, settingInfo.hintText, setting, settingInfo, "CreateAClassList_" .. setting ) )
	local numTeams = Engine.GetGametypeSetting( "teamCount" )
	if numTeams > 1 then
		setting = "presetClassesPerTeam"
		settingInfo = CoD.OptionsUtility.GameSettings[setting]
		table.insert( optionsTable, CoD.OptionsUtility.CreateListOptions( controller, settingInfo.name, settingInfo.hintText, setting, settingInfo, "CreateAClassList_" .. setting ) )
	end
	return optionsTable
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

local ClassAction = function ( self, element, controller, param, menu )
	local team = param.team
	CoD.CACUtility.SetDefaultCACRoot( controller )
	CoD.CACUtility.SetGametypeSettingsCACRoot( controller, team )
	CoD.perController[controller].editingPresetClass = team
	Engine.BeginEditingPresetClass( team )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), 0 )
	CoD.CACUtility.OpenCACMenuEditClass( menu, controller )
end

local PrepareCreateAClassSettingsButtons = function ( controller, element )
	local buttonOptions = {}
	local numTeams = Engine.GetGametypeSetting( "teamCount" )
	if numTeams > 1 and Engine.GetGametypeSetting( "presetClassesPerTeam" ) == 1 then
		table.insert( buttonOptions, {
			optionDisplay = Engine.Localize( "MENU_CUSTOM_CLASS_TEAM_PRESET", "MPUI_ALLIES_CAPS" ),
			action = ClassAction,
			actionParam = {
				team = Enum.team_t.TEAM_ALLIES
			}
		} )
		table.insert( buttonOptions, {
			optionDisplay = Engine.Localize( "MENU_CUSTOM_CLASS_TEAM_PRESET", "MPUI_AXIS_CAPS" ),
			action = ClassAction,
			actionParam = {
				team = Enum.team_t.TEAM_AXIS
			}
		} )
	else
		table.insert( buttonOptions, {
			optionDisplay = Engine.Localize( "MENU_EDIT_PRESET_CLASSES" ),
			desc = Engine.Localize( "MENU_EDIT_PRESET_CLASSES_DESC" ),
			action = ClassAction,
			actionParam = {
				team = Enum.team_t.TEAM_FREE
			},
			isClassButton = true
		} )
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
				desc = buttonData.desc,
				action = buttonData.action,
				actionParam = buttonData.actionParam
			}
		} )
	end
	return buttons
end

DataSources.CreateAClassSettings = DataSourceHelpers.ListSetup( "CreateAClassSettings", PrepareCreateAClassSettings, nil, nil, SettingsUpdate )
DataSources.CreateAClassSettingsButtons = DataSourceHelpers.ListSetup( "CreateAClassSettingsButtons", PrepareCreateAClassSettingsButtons, nil, nil, SettingsUpdate, nil )
local PreLoadFunc = function ( self, controller )
	local numTeams = Engine.GetGametypeSetting( "teamCount" )
	if numTeams > 1 and Engine.GetGametypeSetting( "presetClassesPerTeam" ) == 1 then
		self.team = Enum.team_t.TEAM_FIRST_PLAYING_TEAM
	else
		self.team = Enum.team_t.TEAM_FREE
	end
	CoD.CACUtility.SetGametypeSettingsCACRoot( controller, self.team )
	CoD.perController[controller].editingPresetClass = nil
	CoD.perController[controller].isPreset = nil
	Engine.StopEditingPresetClass()
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	Engine.CreateModel( gametypeSettingsModel, "presetClassesPerTeam" )
end

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.GameSettings_CreateAClassSettings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettings_CreateAClassSettings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettings_CreateAClassSettings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( 0, 1, 0, 0 )
	GameSettingsBackground:setTopBottom( 0, 1, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = CoD.GameSettings_GameModeRulesList.new( self, controller )
	Options:setLeftRight( 0, 0, 41, 923 )
	Options:setTopBottom( 0, 0, 201, 1283 )
	Options.Title.DescTitle:setText( Engine.Localize( "MENU_SETTINGS_CAPS" ) )
	Options.Sliders:setDataSource( "CreateAClassSettings" )
	Options.Buttions:setDataSource( "CreateAClassSettingsButtons" )
	self:addElement( Options )
	self.Options = Options
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		MakeElementNotFocusable( self, "TeamClassSettingsButtons", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		GameSettingsMenuClosed( self, controller )
	end )
	GameSettingsBackground.MenuFrame:setModel( self.buttonModel, controller )
	Options.id = "Options"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Options:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsBackground:close()
		self.Options:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettings_CreateAClassSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

