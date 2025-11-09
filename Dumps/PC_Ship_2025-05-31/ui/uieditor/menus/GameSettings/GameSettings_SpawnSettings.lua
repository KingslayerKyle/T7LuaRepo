require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

DataSources.SpawnSettings = DataSourceHelpers.ListSetup( "SpawnSettings", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = nil
	for f1_local5, f1_local6 in ipairs( CoD.GameOptions.SpawnSettings ) do
		f1_local1 = CoD.GameOptions.GameSettings[f1_local6]
		if f1_local6 ~= "spawnteamkilledpenalty" or CoDShared.IsGametypeTeamBased() then
			table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local1.name, f1_local1.hintText, f1_local6, f1_local1, "SpawnSettingsOptionsList_" .. f1_local6 ) )
		end
	end
	return f1_local0
end, nil, nil, function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
	if f2_arg1.updateSubscription then
		f2_arg1:removeSubscription( f2_arg1.updateSubscription )
	end
	f2_arg1.updateSubscription = f2_arg1:subscribeToModel( f2_local0, function ()
		f2_arg1:updateDataSource( false )
	end, false )
end )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.GameSettings_SpawnSettings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettings_SpawnSettings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettings_SpawnSettings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SPAWN_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SPAWN_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = CoD.Competitive_SettingsList.new( self, controller )
	Options:setLeftRight( true, false, 27, 715 )
	Options:setTopBottom( true, false, 134, 720 )
	Options.Title.DescTitle:setText( Engine.Localize( "MENU_SETTINGS_CAPS" ) )
	Options.ButtonList:setDataSource( "SpawnSettings" )
	Options.ButtonList:setVerticalCount( 15 )
	self:addElement( Options )
	self.Options = Options
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
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
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettings_SpawnSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

