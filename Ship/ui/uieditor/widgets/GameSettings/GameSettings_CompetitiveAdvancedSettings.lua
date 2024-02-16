-- e1c8aefb5e1e53f649643d7b59a2b6d7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_SelectedItemInfo" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 585 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GameSettingsSelectedItemInfo = CoD.GameSettings_SelectedItemInfo.new( menu, controller )
	GameSettingsSelectedItemInfo:setLeftRight( true, true, 0, 0 )
	GameSettingsSelectedItemInfo:setTopBottom( true, true, -135, 0 )
	GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsSelectedItemInfo )
	self.GameSettingsSelectedItemInfo = GameSettingsSelectedItemInfo
	
	local StageTimers = CoD.Competitive_SettingsList.new( menu, controller )
	StageTimers:setLeftRight( true, false, 27, 614 )
	StageTimers:setTopBottom( true, false, 1, 148 )
	StageTimers.Title.DescTitle:setText( Engine.Localize( "MENU_TIME_SETTINGS_CAPS" ) )
	StageTimers.ButtonList:setDataSource( "CompetitiveAdvancedSettings" )
	StageTimers.ButtonList:setVerticalCount( 3 )
	self:addElement( StageTimers )
	self.StageTimers = StageTimers
	
	local EditSettings = CoD.Competitive_SettingsList.new( menu, controller )
	EditSettings:setLeftRight( true, false, 27, 614 )
	EditSettings:setTopBottom( true, false, 148, 265.5 )
	EditSettings.Title.DescTitle:setText( Engine.Localize( "MENU_EDIT_SETTINGS" ) )
	EditSettings.ButtonList:setDataSource( "CompetitiveEditSettings" )
	self:addElement( EditSettings )
	self.EditSettings = EditSettings
	
	local PlayerOrderSettings = CoD.Competitive_SettingsList.new( menu, controller )
	PlayerOrderSettings:setLeftRight( true, false, 27, 614 )
	PlayerOrderSettings:setTopBottom( true, false, 265.5, 390.5 )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.StageTimers:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsSelectedItemInfo:close()
		element.StageTimers:close()
		element.EditSettings:close()
		element.PlayerOrderSettings:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
