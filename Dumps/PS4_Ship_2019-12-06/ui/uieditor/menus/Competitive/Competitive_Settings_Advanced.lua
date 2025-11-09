require( "ui.uieditor.menus.GameSettings.GameSettings_OptionsMenu" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8 )
	local f1_local0 = {}
	for f1_local4, f1_local5 in ipairs( f1_arg8 ) do
		if f1_local5 == 0 then
			table.insert( f1_local0, {
				name = Engine.Localize( "MENU_UNLIMITED" ),
				value = f1_local5,
				title = f1_arg1,
				desc = f1_arg2
			} )
		end
		if f1_local5 == 1 then
			table.insert( f1_local0, {
				name = Engine.Localize( f1_arg6 ),
				value = f1_local5,
				title = f1_arg1,
				desc = f1_arg2
			} )
		else
			table.insert( f1_local0, {
				name = Engine.Localize( f1_arg7, f1_local5 ),
				value = f1_local5,
				title = f1_arg1,
				desc = f1_arg2
			} )
		end
	end
	return {
		models = {
			name = Engine.Localize( f1_arg1 ),
			desc = Engine.Localize( f1_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f1_arg0, f1_arg3, f1_local0, f1_arg4 ),
			setting = f1_arg4
		},
		properties = {
			enabledWithGametypeSetting = f1_arg5,
			revert = function ( f2_arg0 )
				Engine.SetGametypeSetting( f1_arg4, Engine.GetGametypeSetting( f1_arg4, true ) )
			end
			
		}
	}
end

local f0_local1 = function ( f3_arg0 )
	local f3_local0 = {}
	table.insert( f3_local0, f0_local0( f3_arg0, "MENU_PRE_STAGE_TIME", "MENU_PRE_STAGE_DESC", "SpecialistOptions_preStageTime", "pregamePreStageTime", nil, "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	table.insert( f3_local0, f0_local0( f3_arg0, "MENU_POST_ROUND_TIME", "MENU_POST_ROUND_DESC", "SpecialistOptions_postRoundTime", "pregamePostRoundTime", nil, "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	table.insert( f3_local0, f0_local0( f3_arg0, "MENU_POST_STAGE_TIME", "MENU_POST_STAGE_DESC", "SpecialistOptions_postStageTime", "pregamePostStageTime", nil, "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	return f3_local0
end

local f0_local2 = function ( f4_arg0 )
	local f4_local0 = {}
	table.insert( f4_local0, CoD.OptionsUtility.CreateNamedSettings( f4_arg0, "MENU_ALWAYS_SHOW_CAC_EDIT", "MENU_ALWAYS_SHOW_CAC_DESC", "SpecialistOptions_AlwaysShowCACEdit", "pregameAlwaysShowCACEdit", {
		{
			option = "MENU_ALWAYS",
			value = 1
		},
		{
			option = "MENU_DISABLED",
			value = 0
		}
	} ) )
	table.insert( f4_local0, CoD.OptionsUtility.CreateNamedSettings( f4_arg0, "MENU_ALWAYS_SHOW_STREAK_EDIT", "MENU_ALWAYS_SHOW_STREAK_DESC", "SpecialistOptions_AlwaysShowStreakEdit", "pregameAlwaysShowStreakEdit", {
		{
			option = "MENU_ALWAYS",
			value = 1
		},
		{
			option = "MENU_DISABLED",
			value = 0
		}
	} ) )
	return f4_local0
end

local f0_local3 = function ( f5_arg0 )
	local f5_local0 = {}
	table.insert( f5_local0, CoD.OptionsUtility.CreateNamedSettings( f5_arg0, "MENU_PLAYER_SELECT_ORDER", "MENU_PLAYER_SELECT_ORDER_DESC", "SpecialistOptions_SortType", "pregamePositionSortType", {
		{
			option = "MENU_RANDOM",
			value = Enum.PregameSortType.PREGAME_SORT_TYPE_RANDOM
		},
		{
			option = "MENU_PLAYER_JOIN_ORDER",
			value = Enum.PregameSortType.PREGAME_SORT_TYPE_CLIENTNUM
		}
	} ) )
	table.insert( f5_local0, CoD.OptionsUtility.CreateNamedSettings( f5_arg0, "MENU_PLAYER_SELECT_SHUFFLE", "MENU_PLAYER_SELECT_SHUFFLE_DESC", "SpecialistOptions_ShuffleMethod", "pregamePositionShuffleMethod", {
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
	return f5_local0
end

local f0_local4 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
	if f6_arg1.updateSubscription then
		f6_arg1:removeSubscription( f6_arg1.updateSubscription )
	end
	f6_arg1.updateSubscription = f6_arg1:subscribeToModel( f6_local0, function ()
		f6_arg1:updateDataSource( false )
	end, false )
end

DataSources.CompetitiveAdvancedSettings = DataSourceHelpers.ListSetup( "CompetitiveAdvancedSettings", f0_local1, nil, nil, f0_local4 )
DataSources.CompetitiveEditSettings = DataSourceHelpers.ListSetup( "CompetitiveEditSettings", f0_local2, nil, nil, f0_local4 )
DataSources.CompetitiveOrderSettings = DataSourceHelpers.ListSetup( "CompetitiveOrderSettings", f0_local3, nil, nil, f0_local4 )
LUI.createMenu.Competitive_Settings_Advanced = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Advanced" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Advanced.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local StageTimers = CoD.Competitive_SettingsList.new( self, controller )
	StageTimers:setLeftRight( true, false, 0, 624 )
	StageTimers:setTopBottom( true, false, 90, 240 )
	StageTimers.Title.DescTitle:setText( Engine.Localize( "MENU_TIME_SETTINGS_CAPS" ) )
	StageTimers.ButtonList:setDataSource( "CompetitiveAdvancedSettings" )
	StageTimers.ButtonList:setVerticalCount( 3 )
	self:addElement( StageTimers )
	self.StageTimers = StageTimers
	
	local EditSettings = CoD.Competitive_SettingsList.new( self, controller )
	EditSettings:setLeftRight( true, false, 0, 624 )
	EditSettings:setTopBottom( true, false, 241, 360 )
	EditSettings.Title.DescTitle:setText( Engine.Localize( "MENU_EDIT_SETTINGS" ) )
	EditSettings.ButtonList:setDataSource( "CompetitiveEditSettings" )
	self:addElement( EditSettings )
	self.EditSettings = EditSettings
	
	local PlayerOrderSettings = CoD.Competitive_SettingsList.new( self, controller )
	PlayerOrderSettings:setLeftRight( true, false, 0, 624 )
	PlayerOrderSettings:setTopBottom( true, false, 360, 485 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenPopup( self, "GameSettings_OptionsMenu", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsBackground:close()
		element.StageTimers:close()
		element.EditSettings:close()
		element.PlayerOrderSettings:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Advanced.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

