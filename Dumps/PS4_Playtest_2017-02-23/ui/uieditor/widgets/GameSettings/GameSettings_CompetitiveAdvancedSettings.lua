require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_SelectedItemInfo" )

CoD.GameSettings_CompetitiveAdvancedSettings = InheritFrom( LUI.UIElement )
CoD.GameSettings_CompetitiveAdvancedSettings.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_CompetitiveAdvancedSettings )
	self.id = "GameSettings_CompetitiveAdvancedSettings"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 877 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GameSettingsSelectedItemInfo = CoD.GameSettings_SelectedItemInfo.new( menu, controller )
	GameSettingsSelectedItemInfo:setLeftRight( 0, 1, 0, 0 )
	GameSettingsSelectedItemInfo:setTopBottom( 0, 1, -202, 0 )
	GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsSelectedItemInfo )
	self.GameSettingsSelectedItemInfo = GameSettingsSelectedItemInfo
	
	local StageTimers = CoD.Competitive_SettingsList.new( menu, controller )
	StageTimers:setLeftRight( 0, 0, 41, 921 )
	StageTimers:setTopBottom( 0, 0, 2, 222 )
	StageTimers.Title.DescTitle:setText( Engine.Localize( "MENU_TIME_SETTINGS_CAPS" ) )
	StageTimers.ButtonList:setVerticalCount( 3 )
	StageTimers.ButtonList:setDataSource( "CompetitiveAdvancedSettings" )
	self:addElement( StageTimers )
	self.StageTimers = StageTimers
	
	local EditSettings = CoD.Competitive_SettingsList.new( menu, controller )
	EditSettings:setLeftRight( 0, 0, 41, 921 )
	EditSettings:setTopBottom( 0, 0, 222, 398 )
	EditSettings.Title.DescTitle:setText( Engine.Localize( "MENU_EDIT_SETTINGS" ) )
	EditSettings.ButtonList:setDataSource( "CompetitiveEditSettings" )
	self:addElement( EditSettings )
	self.EditSettings = EditSettings
	
	local PlayerOrderSettings = CoD.Competitive_SettingsList.new( menu, controller )
	PlayerOrderSettings:setLeftRight( 0, 0, 41, 921 )
	PlayerOrderSettings:setTopBottom( 0, 0, 398, 586 )
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	StageTimers.id = "StageTimers"
	EditSettings.id = "EditSettings"
	PlayerOrderSettings.id = "PlayerOrderSettings"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.StageTimers:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsSelectedItemInfo:close()
		self.StageTimers:close()
		self.EditSettings:close()
		self.PlayerOrderSettings:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

