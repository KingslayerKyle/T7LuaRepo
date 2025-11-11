require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeRulesList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_SelectedItemInfo" )

local PrepareGlobalSettingsOptions = function ( controller )
	local optionsTable = {}
	local gametype = Dvar.ui_gametype:get()
	local settingInfo = nil
	local globalSettings = CoD.OptionsUtility.GlobalSettings
	if globalSettings and #globalSettings > 0 then
		for index, setting in ipairs( globalSettings ) do
			settingInfo = CoD.OptionsUtility.GameSettings[setting]
			table.insert( optionsTable, CoD.OptionsUtility.CreateListOptions( controller, settingInfo.name, settingInfo.hintText, setting, settingInfo, "GameTypeOptionsList_" .. setting ) )
		end
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

DataSources.GlobalSettings = DataSourceHelpers.ListSetup( "GlobalSettings", PrepareGlobalSettingsOptions, nil, nil, SettingsUpdate )
CoD.GameSettings_GlobalSettings = InheritFrom( LUI.UIElement )
CoD.GameSettings_GlobalSettings.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_GlobalSettings )
	self.id = "GameSettings_GlobalSettings"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 877 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Options = CoD.GameSettings_GameModeRulesList.new( menu, controller )
	Options:setLeftRight( 0, 0, 56, 960 )
	Options:setTopBottom( 0, 0, 17, 622 )
	Options.Title.DescTitle:setText( Engine.Localize( "MENU_SETTINGS_CAPS" ) )
	Options.Sliders:setDataSource( "GlobalSettings" )
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
					GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GameSettingsSelectedItemInfo, event )
					else
						GameSettingsSelectedItemInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GameSettingsSelectedItemInfo:completeAnimation()
				GameSettingsSelectedItemInfo.GameModeInfo:completeAnimation()
				self.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 1 )
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

