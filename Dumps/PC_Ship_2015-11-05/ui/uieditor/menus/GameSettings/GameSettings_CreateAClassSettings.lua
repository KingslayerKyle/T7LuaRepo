require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeRulesList" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Dvar.ui_gametype:get()
	local f1_local2, f1_local3 = nil
	f1_local2 = "disableCAC"
	f1_local3 = CoD.GameOptions.GameSettings[f1_local2]
	table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local3.name, f1_local3.hintText, f1_local2, f1_local3, "CreateAClassList_" .. f1_local2 ) )
	f1_local2 = "maxAllocation"
	f1_local3 = CoD.GameOptions.GameSettings[f1_local2]
	table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local3.name, f1_local3.hintText, f1_local2, f1_local3, "CreateAClassList_" .. f1_local2 ) )
	if Engine.GetGametypeSetting( "teamCount" ) > 1 then
		f1_local2 = "presetClassesPerTeam"
		f1_local3 = CoD.GameOptions.GameSettings[f1_local2]
		table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local3.name, f1_local3.hintText, f1_local2, f1_local3, "CreateAClassList_" .. f1_local2 ) )
	end
	return f1_local0
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
	if f2_arg1.updateSubscription then
		f2_arg1:removeSubscription( f2_arg1.updateSubscription )
	end
	f2_arg1.updateSubscription = f2_arg1:subscribeToModel( f2_local0, function ()
		f2_arg1:updateDataSource( false )
	end, false )
end

local f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
	local f4_local0 = f4_arg3.team
	CoD.CACUtility.SetDefaultCACRoot( f4_arg2 )
	CoD.CACUtility.SetGametypeSettingsCACRoot( f4_arg2, f4_local0 )
	CoD.perController[f4_arg2].editingPresetClass = f4_local0
	Engine.BeginEditingPresetClass( f4_local0 )
	CoD.OpenCACMenuEditClass( f4_arg4, f4_arg2 )
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = {}
	if Engine.GetGametypeSetting( "teamCount" ) > 1 and Engine.GetGametypeSetting( "presetClassesPerTeam" ) == 1 then
		table.insert( f5_local0, {
			optionDisplay = Engine.Localize( "MENU_CUSTOM_CLASS_TEAM_PRESET", "MPUI_ALLIES_CAPS" ),
			action = f0_local2,
			actionParam = {
				team = Enum.team_t.TEAM_ALLIES
			}
		} )
		table.insert( f5_local0, {
			optionDisplay = Engine.Localize( "MENU_CUSTOM_CLASS_TEAM_PRESET", "MPUI_AXIS_CAPS" ),
			action = f0_local2,
			actionParam = {
				team = Enum.team_t.TEAM_AXIS
			}
		} )
	else
		table.insert( f5_local0, {
			optionDisplay = Engine.Localize( "MENU_EDIT_PRESET_CLASSES" ),
			action = f0_local2,
			actionParam = {
				team = Enum.team_t.TEAM_FREE
			},
			isClassButton = true
		} )
	end
	local f5_local1 = {}
	for f5_local5, f5_local6 in ipairs( f5_local0 ) do
		table.insert( f5_local1, {
			models = {
				displayText = f5_local6.optionDisplay,
				customId = f5_local6.customId
			},
			properties = {
				title = f5_local6.optionDisplay,
				action = f5_local6.action,
				actionParam = f5_local6.actionParam
			}
		} )
	end
	return f5_local1
end

DataSources.CreateAClassSettings = DataSourceHelpers.ListSetup( "CreateAClassSettings", f0_local0, nil, nil, f0_local1 )
DataSources.CreateAClassSettingsButtons = DataSourceHelpers.ListSetup( "CreateAClassSettingsButtons", f0_local3, nil, nil, f0_local1, SpacerFunction )
local f0_local4 = function ( f6_arg0, f6_arg1 )
	if Engine.GetGametypeSetting( "teamCount" ) > 1 and Engine.GetGametypeSetting( "presetClassesPerTeam" ) == 1 then
		f6_arg0.team = Enum.team_t.TEAM_FIRST_PLAYING_TEAM
	else
		f6_arg0.team = Enum.team_t.TEAM_FREE
	end
	CoD.CACUtility.SetGametypeSettingsCACRoot( f6_arg1, f6_arg0.team )
	CoD.perController[f6_arg1].editingPresetClass = nil
	CoD.perController[f6_arg1].isPreset = nil
	Engine.StopEditingPresetClass()
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "presetClassesPerTeam" )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettings_CreateAClassSettings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = CoD.GameSettings_GameModeRulesList.new( self, controller )
	Options:setLeftRight( true, false, 27, 615 )
	Options:setTopBottom( true, false, 134, 855 )
	Options.Title.DescTitle:setText( Engine.Localize( "MENU_SETTINGS_CAPS" ) )
	Options.Sliders:setDataSource( "CreateAClassSettings" )
	Options.Buttions:setDataSource( "CreateAClassSettingsButtons" )
	self:addElement( Options )
	self.Options = Options
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f9_local0 = nil
		MakeElementNotFocusable( self, "TeamClassSettingsButtons", controller )
		if not f9_local0 then
			f9_local0 = self:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if IsMenuInState( menu, "DefaultState" ) then
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsBackground:close()
		element.Options:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettings_CreateAClassSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

