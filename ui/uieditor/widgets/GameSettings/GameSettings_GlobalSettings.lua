-- d8328234dd0f31be559cc7c8b5346751
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeRulesList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_SelectedItemInfo" )

DataSources.GlobalSettings = DataSourceHelpers.ListSetup( "GlobalSettings", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Dvar.ui_gametype:get()
	local f1_local2 = nil
	local f1_local3 = CoD.GameOptions.GlobalSettings
	if f1_local3 and #f1_local3 > 0 then
		for f1_local7, f1_local8 in ipairs( f1_local3 ) do
			f1_local2 = CoD.GameOptions.GameSettings[f1_local8]
			table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local2.name, f1_local2.hintText, f1_local8, f1_local2, "GameTypeOptionsList_" .. f1_local8 ) )
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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 585 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Options = CoD.GameSettings_GameModeRulesList.new( menu, controller )
	Options:setLeftRight( true, false, 27, 630 )
	Options:setTopBottom( true, false, 0, 720 )
	Options.Title.DescTitle:setText( Engine.Localize( "MENU_SETTINGS_CAPS" ) )
	Options.Sliders:setDataSource( "GlobalSettings" )
	self:addElement( Options )
	self.Options = Options
	
	local GameSettingsSelectedItemInfo = CoD.GameSettings_SelectedItemInfo.new( menu, controller )
	GameSettingsSelectedItemInfo:setLeftRight( true, true, 0, 0 )
	GameSettingsSelectedItemInfo:setTopBottom( true, true, -135, 0 )
	GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsSelectedItemInfo )
	self.GameSettingsSelectedItemInfo = GameSettingsSelectedItemInfo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Options:close()
		element.GameSettingsSelectedItemInfo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

