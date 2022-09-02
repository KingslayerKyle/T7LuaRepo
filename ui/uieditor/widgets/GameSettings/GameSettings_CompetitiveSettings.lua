-- cf385761d2724bfd4112adb76da7d5d7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_SelectedItemInfo" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsButtons_Flyout" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if not CoD.useMouse then
		return 
	else
		f1_arg0:setForceMouseEventDispatch( true )

		LUI.OverrideFunction_CallOriginalFirst( f1_arg0.CompetitiveSettingsButtonsFlyout, "setState", function ( element, controller )
			if not IsInDefaultState( element ) then
				f1_arg0.BanProtectSettings.m_mouseDisabled = true
				f1_arg0.DraftSettings.m_mouseDisabled = true
			elseif IsInDefaultState( element ) then
				f1_arg0.BanProtectSettings.m_mouseDisabled = nil
				f1_arg0.DraftSettings.m_mouseDisabled = nil
			end
		end )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local0( self, controller )
end

local PreLoadFunc = function ( self, controller )
	local f4_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	Engine.SetModelValue( Engine.CreateModel( f4_local0, "title" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f4_local0, "description" ), "" )
end

local f0_local3 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5, f5_arg6, f5_arg7, f5_arg8 )
	local f5_local0 = {}
	for f5_local4, f5_local5 in ipairs( f5_arg8 ) do
		if f5_local5 == 0 then
			table.insert( f5_local0, {
				name = Engine.Localize( "MENU_UNLIMITED" ),
				value = f5_local5,
				title = f5_arg1,
				desc = f5_arg2
			} )
		end
		if f5_local5 == 1 then
			table.insert( f5_local0, {
				name = Engine.Localize( f5_arg6 ),
				value = f5_local5,
				title = f5_arg1,
				desc = f5_arg2
			} )
		end
		if f5_local5 < 60 then
			table.insert( f5_local0, {
				name = Engine.Localize( f5_arg7, f5_local5 ),
				value = f5_local5,
				title = f5_arg1,
				desc = f5_arg2
			} )
		end
		if f5_local5 == 60 then
			table.insert( f5_local0, {
				name = Engine.Localize( "MENU_1_MINUTE", f5_local5 ),
				value = f5_local5,
				title = f5_arg1,
				desc = f5_arg2
			} )
		else
			table.insert( f5_local0, {
				name = Engine.Localize( "MENU_X_MINUTES", f5_local5 / 60 ),
				value = f5_local5,
				title = f5_arg1,
				desc = f5_arg2
			} )
		end
	end
	return {
		models = {
			name = Engine.Localize( f5_arg1 ),
			desc = Engine.Localize( f5_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f5_arg0, f5_arg3, f5_local0, f5_arg4 ),
			setting = f5_arg4
		},
		properties = {
			enabledWithGametypeSetting = f5_arg5,
			revert = function ( f6_arg0 )
				Engine.SetGametypeSetting( f5_arg4, Engine.GetGametypeSetting( f5_arg4, true ) )
			end
			
		}
	}
end

local f0_local4 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6, f7_arg7, f7_arg8 )
	local f7_local0 = {}
	for f7_local4, f7_local5 in ipairs( f7_arg8 ) do
		if f7_local5 == 0 then
			table.insert( f7_local0, {
				name = Engine.Localize( "MENU_UNLIMITED" ),
				value = f7_local5,
				title = f7_arg1,
				desc = f7_arg2
			} )
		end
		if f7_local5 == 1 then
			table.insert( f7_local0, {
				name = Engine.Localize( f7_arg6 ),
				value = f7_local5,
				title = f7_arg1,
				desc = f7_arg2
			} )
		else
			table.insert( f7_local0, {
				name = Engine.Localize( f7_arg7, f7_local5 ),
				value = f7_local5,
				title = f7_arg1,
				desc = f7_arg2
			} )
		end
	end
	return {
		models = {
			name = Engine.Localize( f7_arg1 ),
			desc = Engine.Localize( f7_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f7_arg0, f7_arg3, f7_local0, f7_arg4 ),
			setting = f7_arg4
		},
		properties = {
			enabledWithGametypeSetting = f7_arg5,
			revert = function ( f8_arg0 )
				Engine.SetGametypeSetting( f7_arg4, Engine.GetGametypeSetting( f7_arg4, true ) )
			end
			
		}
	}
end

local f0_local5 = function ( f9_arg0 )
	local f9_local0 = {}
	table.insert( f9_local0, CoD.OptionsUtility.CreateEnabledDisabledOptions( f9_arg0, "MENU_SPECIALIST_DRAFT", "MENU_SPECIALIST_DRAFT_DESC", "pregameDraftEnabled", "SpecialistOptions_DraftEnabled" ) )
	table.insert( f9_local0, f0_local3( f9_arg0, "MENU_DRAFT_TIME", "MENU_DRAFT_TIME_DESC", "SpecialistOptions_DraftTime", "pregameDraftRoundTime", "pregameDraftEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
		10,
		20,
		30,
		45,
		60,
		90,
		120,
		150,
		180,
		210,
		240
	} ) )
	return f9_local0
end

local f0_local6 = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local f10_local1 = Engine.CreateModel( f10_local0, "pregameDraftEnabled" )
	if f10_arg1.draftEnabledSubscription then
		f10_arg1:removeSubscription( f10_arg1.draftEnabledSubscription )
	end
	f10_arg1.draftEnabledSubscription = f10_arg1:subscribeToModel( f10_local1, function ()
		f10_arg1:clearSavedActiveIndex()
		f10_arg1:clearSavedState()
		f10_arg1:updateDataSource( false )
	end, false )
	local f10_local2 = Engine.CreateModel( f10_local0, "Update" )
	if f10_arg1.updateSubscription then
		f10_arg1:removeSubscription( f10_arg1.updateSubscription )
	end
	f10_arg1.updateSubscription = f10_arg1:subscribeToModel( f10_local2, function ()
		f10_arg1:updateDataSource( false )
	end, false )
end

local f0_local7 = function ( f13_arg0 )
	local f13_local0 = {}
	table.insert( f13_local0, CoD.OptionsUtility.CreateEnabledDisabledOptions( f13_arg0, "MENU_BAN_PROTECT_VOTES", "MENU_BAN_PROTECT_VOTES_DESC", "pregameItemVoteEnabled", "SpecialistOptions_BanProtectEnabled" ) )
	table.insert( f13_local0, f0_local3( f13_arg0, "MENU_BAN_PROTECT_TIME", "MENU_BAN_PROTECT_TIME_DESC", "SpecialistOptions_DraftTime", "pregameItemVoteRoundTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
		10,
		15,
		20,
		30,
		45,
		60,
		90,
		120,
		150,
		180,
		210,
		240
	} ) )
	table.insert( f13_local0, f0_local3( f13_arg0, "MENU_CAC_MODIFICATION_TIME", "MENU_CAC_MODIFICATION_TIME_DESC", "SpecialistOptions_CACModificationTime", "pregameCACModifyTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
		10,
		15,
		20,
		30,
		45,
		60,
		90,
		120,
		150,
		180,
		210,
		240
	} ) )
	table.insert( f13_local0, f0_local3( f13_arg0, "MENU_STREAK_MODIFICATION_TIME", "MENU_STREAK_MODIFICATION_TIME_DESC", "SpecialistOptions_StreakModificationTime", "pregameScorestreakModifyTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
		10,
		15,
		20,
		30,
		45,
		60,
		90,
		120,
		150,
		180,
		210,
		240
	} ) )
	table.insert( f13_local0, f0_local4( f13_arg0, "MENU_VOTES_PER_PLAYER", "MENU_VOTES_PER_PLAYER_DESC", "SpecialistOptions_VotesPerPlayer", "pregameItemMaxVotes", "pregameItemVoteEnabled", "MENU_1_VOTE", "MENU_X_VOTES", {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12
	} ) )
	return f13_local0
end

local f0_local8 = function ( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local f14_local1 = Engine.CreateModel( f14_local0, "pregameItemVoteEnabled" )
	if f14_arg1.pregameVoteSubscription then
		f14_arg1:removeSubscription( f14_arg1.pregameVoteSubscription )
	end
	f14_arg1.pregameVoteSubscription = f14_arg1:subscribeToModel( f14_local1, function ()
		f14_arg1:processEvent( {
			name = "update_state"
		} )
	end, false )
	local f14_local2 = Engine.CreateModel( f14_local0, "Update" )
	if f14_arg1.updateSubscription then
		f14_arg1:removeSubscription( f14_arg1.updateSubscription )
	end
	f14_arg1.updateSubscription = f14_arg1:subscribeToModel( f14_local2, function ()
		f14_arg1:updateDataSource( false )
	end, false )
end

DataSources.CompetitiveDraftSettings = DataSourceHelpers.ListSetup( "CompetitiveDraftSettings", f0_local5, nil, nil, f0_local6 )
DataSources.CompetitiveBanProtectSettings = DataSourceHelpers.ListSetup( "CompetitiveBanProtectSettings", f0_local7, nil, nil, f0_local8 )
CoD.GameSettings_CompetitiveSettings = InheritFrom( LUI.UIElement )
CoD.GameSettings_CompetitiveSettings.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_CompetitiveSettings )
	self.id = "GameSettings_CompetitiveSettings"
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
	
	local DraftSettings = CoD.Competitive_SettingsList.new( menu, controller )
	DraftSettings:setLeftRight( true, false, 27, 623 )
	DraftSettings:setTopBottom( true, false, 205, 320 )
	DraftSettings.Title.DescTitle:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_SETTINGS_CAPS" ) )
	DraftSettings.ButtonList:setDataSource( "CompetitiveDraftSettings" )
	self:addElement( DraftSettings )
	self.DraftSettings = DraftSettings
	
	local BanProtectSettings = CoD.Competitive_SettingsList.new( menu, controller )
	BanProtectSettings:setLeftRight( true, false, 27, 624 )
	BanProtectSettings:setTopBottom( true, false, 1, 210 )
	BanProtectSettings.Title.DescTitle:setText( Engine.Localize( "MENU_BAN_PROTECT_SETTINGS_CAPS" ) )
	BanProtectSettings.ButtonList:setVerticalCount( 5 )
	BanProtectSettings.ButtonList:setDataSource( "CompetitiveBanProtectSettings" )
	self:addElement( BanProtectSettings )
	self.BanProtectSettings = BanProtectSettings
	
	local BanRestrictionsTitle = CoD.StartMenu_OptionHighlight.new( menu, controller )
	BanRestrictionsTitle:setLeftRight( true, false, 69, 411 )
	BanRestrictionsTitle:setTopBottom( true, false, 312, 352 )
	BanRestrictionsTitle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	BanRestrictionsTitle.DescTitle:setText( Engine.Localize( "MENU_ITEM_BANS_RESTRICTIONS_CAPS" ) )
	self:addElement( BanRestrictionsTitle )
	self.BanRestrictionsTitle = BanRestrictionsTitle
	
	local CompetitiveSettingsButtonsFlyout = CoD.Competitive_SettingsButtons_Flyout.new( menu, controller )
	CompetitiveSettingsButtonsFlyout:setLeftRight( true, false, 67, 681 )
	CompetitiveSettingsButtonsFlyout:setTopBottom( true, false, 347, 507 )
	CompetitiveSettingsButtonsFlyout:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f18_local0 = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return f18_local0
	end )

	LUI.OverrideFunction_CallOriginalFirst( CompetitiveSettingsButtonsFlyout, "setState", function ( element, controller )
		if not IsInDefaultState( element ) then
			MakeElementNotFocusable( self, "BanProtectSettings", controller )
			MakeElementNotFocusable( self, "DraftSettings", controller )
			MakeElementNotFocusable( self, "AdvancedSettingsButton", controller )
			PlaySoundSetSound( self, "toggle" )
		elseif IsInDefaultState( element ) then
			MakeElementFocusable( self, "AdvancedSettingsButton", controller )
			MakeElementFocusable( self, "BanProtectSettings", controller )
			MakeElementFocusable( self, "DraftSettings", controller )
		end
	end )
	self:addElement( CompetitiveSettingsButtonsFlyout )
	self.CompetitiveSettingsButtonsFlyout = CompetitiveSettingsButtonsFlyout
	
	DraftSettings.navigation = {
		up = BanProtectSettings,
		down = CompetitiveSettingsButtonsFlyout
	}
	BanProtectSettings.navigation = {
		down = DraftSettings
	}
	CompetitiveSettingsButtonsFlyout.navigation = {
		up = DraftSettings
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	DraftSettings.id = "DraftSettings"
	BanProtectSettings.id = "BanProtectSettings"
	CompetitiveSettingsButtonsFlyout.id = "CompetitiveSettingsButtonsFlyout"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.BanProtectSettings:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsSelectedItemInfo:close()
		element.DraftSettings:close()
		element.BanProtectSettings:close()
		element.BanRestrictionsTitle:close()
		element.CompetitiveSettingsButtonsFlyout:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

