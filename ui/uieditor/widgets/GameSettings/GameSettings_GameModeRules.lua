-- ff098c4d9ff5e058028c4b5086eba5b6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeRulesList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_SelectedItemInfo" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Dvar.ui_gametype:get()
	local f1_local2 = nil
	local f1_local3 = CoD.GameOptions.TopLevelGametypeSettings[f1_local1]
	if f1_local3 and #f1_local3 > 0 then
		for f1_local7, f1_local8 in ipairs( f1_local3 ) do
			f1_local2 = CoD.GameOptions.GameSettings[f1_local8]
			table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local2.name, f1_local2.hintText, f1_local8, f1_local2, "GameTypeOptionsList_" .. f1_local8 ) )
		end
	end
	return f1_local0
end

local f0_local1 = function ( f2_arg0 )
	local f2_local0 = Dvar.ui_gametype:get()
	local f2_local1 = {
		[#f2_local1 + 1] = {
			optionDisplay = Engine.Localize( "MENU_GAME_MODE_ADVANCED_CAPS", Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f2_local0, "name_ref_caps" ) ) ),
			description = "MENU_GAME_MODE_SETTINGS_DESC",
			customId = "btnGameModeSettings",
			action = OpenGameSettings_GameMode,
			actionParam = {
				"GameSettings_EditModeSpecificOptions"
			},
			isLastButtonInGroup = true
		},
		[#f2_local1 + 1] = {
			optionDisplay = Engine.Localize( "MENU_GENERAL_CAPS" ),
			description = "MENU_GENERAL_SETTINGS_DESC",
			customId = "btnGeneralSettings",
			action = OpenGameSettings_General,
			actionParam = {
				"GameSettings_GeneralSettings"
			}
		},
		[#f2_local1 + 1] = {
			optionDisplay = Engine.Localize( "MENU_SPAWN_CAPS" ),
			description = "MENU_SPAWN_SETTINGS_DESC",
			customId = "btnSpawnSettings",
			action = OpenGameSettings_Spawn,
			actionParam = {
				"GameSettings_SpawnSettings"
			}
		},
		[#f2_local1 + 1] = {
			optionDisplay = Engine.Localize( "MENU_HEALTH_AND_DAMAGE_CAPS" ),
			description = "MENU_HEALTH_AND_DAMAGE_SETTINGS_DESC",
			customId = "btnHealthAndDamageSettings",
			action = OpenGameSettings_HealthAndDamage,
			actionParam = {
				"GameSettings_HealthAndDamageSettings"
			},
			isLastButtonInGroup = true
		}
	}
	if IsGametypeTeambased() and f2_local0 ~= "sniperonly" then
		f2_local1[#f2_local1 + 1] = {
			optionDisplay = Engine.Localize( "MENU_COMPETITIVE_CAPS" ),
			description = "MENU_COMPETITIVE_SETTINGS_DESC",
			customId = "btnCompetitiveSettings",
			action = OpenGameSettings_Competitive,
			actionParam = {
				"GameSettings_Competitive"
			},
			isLastButtonInGroup = true
		}
	end
	if Engine.GetGametypeSetting( "disableClassSelection", true ) == 0 then
		f2_local1[#f2_local1 + 1] = {
			optionDisplay = Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ),
			description = "MENU_CAC_SETTINGS_DESC",
			customId = "btnCustomClasses",
			action = OpenGameSettings_CreateAClass,
			actionParam = {
				"GameSettings_CreateAClassSettings"
			}
		}
	end
	local f2_local2 = {}
	for f2_local6, f2_local7 in ipairs( f2_local1 ) do
		table.insert( f2_local2, {
			models = {
				displayText = f2_local7.optionDisplay,
				customId = f2_local7.customId
			},
			properties = {
				title = f2_local7.optionDisplay,
				desc = f2_local7.description,
				action = f2_local7.action,
				actionParam = f2_local7.actionParam,
				isLastButtonInGroup = f2_local7.isLastButtonInGroup,
				spacing = f2_local7.spacing
			}
		} )
	end
	return f2_local2
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg0.GameModeSettingsButtons[f3_arg1].properties.isLastButtonInGroup then
		return 10
	else
		
	end
end

DataSources.GameModeSettings = DataSourceHelpers.ListSetup( "GameModeSettings", f0_local0, nil, nil, function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
	if f4_arg1.updateSubscription then
		f4_arg1:removeSubscription( f4_arg1.updateSubscription )
	end
	f4_arg1.updateSubscription = f4_arg1:subscribeToModel( f4_local0, function ()
		f4_arg1:updateDataSource( false )
	end, false )
end )
DataSources.GameModeSettingsButtons = DataSourceHelpers.ListSetup( "GameModeSettingsButtons", f0_local1, nil, nil, nil, f0_local2 )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
	CoD.FileshareUtility.SetCurrentCategory( "customgame" )
end

CoD.GameSettings_GameModeRules = InheritFrom( LUI.UIElement )
CoD.GameSettings_GameModeRules.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_GameModeRules )
	self.id = "GameSettings_GameModeRules"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 585 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Options = CoD.GameSettings_GameModeRulesList.new( menu, controller )
	Options:setLeftRight( true, false, 27, 642 )
	Options:setTopBottom( true, false, 0, 720 )
	Options.Title.DescTitle:setText( Engine.Localize( "MENU_WIN_CONDITIONS_CAPS" ) )
	Options.Sliders:setDataSource( "GameModeSettings" )
	Options.Buttions:setDataSource( "GameModeSettingsButtons" )
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
				self:setupElementClipCounter( 2 )

				Options:completeAnimation()

				Options.Title.DescTitle:completeAnimation()
				self.Options.Title.DescTitle:setText( Engine.Localize( "MENU_WIN_CONDITIONS_CAPS" ) )
				self.clipFinished( Options, {} )
				local GameSettingsSelectedItemInfoFrame2 = function ( GameSettingsSelectedItemInfo, event )
					if not event.interrupted then
						GameSettingsSelectedItemInfo:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						GameSettingsSelectedItemInfo.GameModeInfo:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
					end
					GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GameSettingsSelectedItemInfo, event )
					else
						GameSettingsSelectedItemInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GameSettingsSelectedItemInfo:completeAnimation()

				GameSettingsSelectedItemInfo.GameModeInfo:completeAnimation()
				self.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
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
