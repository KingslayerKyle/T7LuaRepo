require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Description" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeName" )

DataSources.GeneralSettings = DataSourceHelpers.ListSetup( "GeneralSettings", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = nil
	for f1_local5, f1_local6 in ipairs( CoD.GameOptions.GeneralSettings ) do
		f1_local1 = CoD.GameOptions.GameSettings[f1_local6]
		table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local1.name, f1_local1.hintText, f1_local6, f1_local1, "GeneralSettingsOptionsList_" .. f1_local6 ) )
	end
	return f1_local0
end, nil, nil, nil )
LUI.createMenu.GameSettings_GeneralSettings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettings_GeneralSettings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettings_GeneralSettings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( false, false, -649, 645 )
	TitleBacking:setTopBottom( false, false, -361, -275 )
	TitleBacking:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_TEAM_DEATHMATCH_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local CompetitiveSettingsList0 = CoD.Competitive_SettingsList.new( self, controller )
	CompetitiveSettingsList0:setLeftRight( true, false, 31, 746 )
	CompetitiveSettingsList0:setTopBottom( true, false, 83.5, 178.5 )
	CompetitiveSettingsList0.ButtonList:setDataSource( "GeneralSettings" )
	CompetitiveSettingsList0.ButtonList:setVerticalCount( 20 )
	CompetitiveSettingsList0.Title.DescTitle:setText( Engine.Localize( "" ) )
	self:addElement( CompetitiveSettingsList0 )
	self.CompetitiveSettingsList0 = CompetitiveSettingsList0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -11, 1293 )
	Image0:setTopBottom( true, false, 80, 88 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local GameSettingsDescription0 = CoD.GameSettings_Description.new( self, controller )
	GameSettingsDescription0:setLeftRight( true, false, 690.5, 1179.5 )
	GameSettingsDescription0:setTopBottom( true, false, 125, 260 )
	self:addElement( GameSettingsDescription0 )
	self.GameSettingsDescription0 = GameSettingsDescription0
	
	local GameSettingsGameModeName0 = CoD.GameSettings_GameModeName.new( self, controller )
	GameSettingsGameModeName0:setLeftRight( true, false, 690.5, 1179.5 )
	GameSettingsGameModeName0:setTopBottom( true, false, 560, 598 )
	self:addElement( GameSettingsGameModeName0 )
	self.GameSettingsGameModeName0 = GameSettingsGameModeName0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	CompetitiveSettingsList0.id = "CompetitiveSettingsList0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.CompetitiveSettingsList0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cac3dTitleIntermediary0:close()
		element.StartMenulineGraphicsOptions0:close()
		element.CompetitiveSettingsList0:close()
		element.GameSettingsDescription0:close()
		element.GameSettingsGameModeName0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettings_GeneralSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

