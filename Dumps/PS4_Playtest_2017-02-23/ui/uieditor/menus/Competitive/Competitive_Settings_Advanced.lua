require( "ui.uieditor.menus.GameSettings.GameSettings_OptionsMenu" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )

local CreateSettings = function ( controller, title, desc, optionsDatasourceName, statName, enabledVar, singleValueString, pluralValueString, values )
	local options = {}
	for index, value in ipairs( values ) do
		if value == 0 then
			table.insert( options, {
				name = Engine.Localize( "MENU_UNLIMITED" ),
				value = value,
				title = title,
				desc = desc
			} )
		end
		if value == 1 then
			table.insert( options, {
				name = Engine.Localize( singleValueString ),
				value = value,
				title = title,
				desc = desc
			} )
		else
			table.insert( options, {
				name = Engine.Localize( pluralValueString, value ),
				value = value,
				title = title,
				desc = desc
			} )
		end
	end
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, statName ),
			setting = statName
		},
		properties = {
			enabledWithGametypeSetting = enabledVar,
			revert = function ( self )
				Engine.SetGametypeSetting( statName, Engine.GetGametypeSetting( statName, true ) )
			end
		}
	}
	return listInfo
end

local PrepareAdvancedOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateSettings( controller, "MENU_PRE_STAGE_TIME", "MENU_PRE_STAGE_DESC", "SpecialistOptions_preStageTime", "pregamePreStageTime", nil, "MENU_1_SECOND", "MENU_X_SECONDS", {
		1,
		2,
		3,
		4,
		5,
		10,
		15,
		20,
		30,
		45,
		60,
		120
	} ) )
	table.insert( optionsTable, CreateSettings( controller, "MENU_POST_ROUND_TIME", "MENU_POST_ROUND_DESC", "SpecialistOptions_postRoundTime", "pregamePostRoundTime", nil, "MENU_1_SECOND", "MENU_X_SECONDS", {
		1,
		2,
		3,
		4,
		5,
		10,
		15,
		20,
		30,
		45,
		60,
		120
	} ) )
	table.insert( optionsTable, CreateSettings( controller, "MENU_POST_STAGE_TIME", "MENU_POST_STAGE_DESC", "SpecialistOptions_postStageTime", "pregamePostStageTime", nil, "MENU_1_SECOND", "MENU_X_SECONDS", {
		1,
		2,
		3,
		4,
		5,
		10,
		15,
		20,
		30,
		45,
		60,
		120
	} ) )
	return optionsTable
end

local PrepareEditOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CoD.OptionsUtility.CreateNamedSettings( controller, "MENU_ALWAYS_SHOW_CAC_EDIT", "MENU_ALWAYS_SHOW_CAC_DESC", "SpecialistOptions_AlwaysShowCACEdit", "pregameAlwaysShowCACEdit", {
		{
			option = "MENU_ALWAYS",
			value = 1
		},
		{
			option = "MENU_DISABLED",
			value = 0
		}
	} ) )
	table.insert( optionsTable, CoD.OptionsUtility.CreateNamedSettings( controller, "MENU_ALWAYS_SHOW_STREAK_EDIT", "MENU_ALWAYS_SHOW_STREAK_DESC", "SpecialistOptions_AlwaysShowStreakEdit", "pregameAlwaysShowStreakEdit", {
		{
			option = "MENU_ALWAYS",
			value = 1
		},
		{
			option = "MENU_DISABLED",
			value = 0
		}
	} ) )
	return optionsTable
end

local PrepareOrderOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CoD.OptionsUtility.CreateNamedSettings( controller, "MENU_PLAYER_SELECT_ORDER", "MENU_PLAYER_SELECT_ORDER_DESC", "SpecialistOptions_SortType", "pregamePositionSortType", {
		{
			option = "MENU_RANDOM",
			value = Enum.PregameSortType.PREGAME_SORT_TYPE_RANDOM
		},
		{
			option = "MENU_PLAYER_JOIN_ORDER",
			value = Enum.PregameSortType.PREGAME_SORT_TYPE_CLIENTNUM
		}
	} ) )
	table.insert( optionsTable, CoD.OptionsUtility.CreateNamedSettings( controller, "MENU_PLAYER_SELECT_SHUFFLE", "MENU_PLAYER_SELECT_SHUFFLE_DESC", "SpecialistOptions_ShuffleMethod", "pregamePositionShuffleMethod", {
		{
			option = "MENU_NONE",
			value = Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_NONE
		},
		{
			option = "MENU_REVERSE",
			value = Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_REVERSE
		},
		{
			option = "MENU_RANDOM",
			value = Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_RANDOM
		}
	} ) )
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

DataSources.CompetitiveAdvancedSettings = DataSourceHelpers.ListSetup( "CompetitiveAdvancedSettings", PrepareAdvancedOptions, nil, nil, SettingsUpdate )
DataSources.CompetitiveEditSettings = DataSourceHelpers.ListSetup( "CompetitiveEditSettings", PrepareEditOptions, nil, nil, SettingsUpdate )
DataSources.CompetitiveOrderSettings = DataSourceHelpers.ListSetup( "CompetitiveOrderSettings", PrepareOrderOptions, nil, nil, SettingsUpdate )
LUI.createMenu.Competitive_Settings_Advanced = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Advanced" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Advanced.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( 0, 1, 0, 0 )
	GameSettingsBackground:setTopBottom( 0, 1, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local StageTimers = CoD.Competitive_SettingsList.new( self, controller )
	StageTimers:setLeftRight( 0, 0, 0, 936 )
	StageTimers:setTopBottom( 0, 0, 135, 360 )
	StageTimers.Title.DescTitle:setText( Engine.Localize( "MENU_TIME_SETTINGS_CAPS" ) )
	StageTimers.ButtonList:setVerticalCount( 3 )
	StageTimers.ButtonList:setDataSource( "CompetitiveAdvancedSettings" )
	self:addElement( StageTimers )
	self.StageTimers = StageTimers
	
	local EditSettings = CoD.Competitive_SettingsList.new( self, controller )
	EditSettings:setLeftRight( 0, 0, 0, 936 )
	EditSettings:setTopBottom( 0, 0, 362, 540 )
	EditSettings.Title.DescTitle:setText( Engine.Localize( "MENU_EDIT_SETTINGS" ) )
	EditSettings.ButtonList:setDataSource( "CompetitiveEditSettings" )
	self:addElement( EditSettings )
	self.EditSettings = EditSettings
	
	local PlayerOrderSettings = CoD.Competitive_SettingsList.new( self, controller )
	PlayerOrderSettings:setLeftRight( 0, 0, 0, 936 )
	PlayerOrderSettings:setTopBottom( 0, 0, 540, 728 )
	PlayerOrderSettings.Title.DescTitle:setText( Engine.Localize( "MENU_PLAYER_ORDER_CAPS" ) )
	PlayerOrderSettings.ButtonList:setDataSource( "CompetitiveOrderSettings" )
	self:addElement( PlayerOrderSettings )
	self.PlayerOrderSettings = PlayerOrderSettings
	
	StageTimers.navigation = {
		down = EditSettings
	}
	EditSettings.navigation = {
		up = StageTimers,
		down = PlayerOrderSettings
	}
	PlayerOrderSettings.navigation = {
		up = EditSettings
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenPopup( self, "GameSettings_OptionsMenu", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	StageTimers.id = "StageTimers"
	EditSettings.id = "EditSettings"
	PlayerOrderSettings.id = "PlayerOrderSettings"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.StageTimers:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsBackground:close()
		self.StageTimers:close()
		self.EditSettings:close()
		self.PlayerOrderSettings:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Advanced.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

