require( "ui.uieditor.widgets.GameSettings.GameSettings_SelectedItemInfo" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsButtons_Flyout" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if not CoD.useMouse then
		return 
	else
		f1_arg0:setForceMouseEventDispatch( true )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local0( self, controller )
end

local PreLoadFunc = function ( self, controller )
	local f3_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	Engine.SetModelValue( Engine.CreateModel( f3_local0, "title" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f3_local0, "description" ), "" )
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4, f4_arg5, f4_arg6, f4_arg7, f4_arg8 )
	local f4_local0 = {}
	for f4_local4, f4_local5 in ipairs( f4_arg8 ) do
		if f4_local5 == 0 then
			table.insert( f4_local0, {
				name = Engine.Localize( "MENU_UNLIMITED" ),
				value = f4_local5,
				title = f4_arg1,
				desc = f4_arg2
			} )
		end
		if f4_local5 == 1 then
			table.insert( f4_local0, {
				name = Engine.Localize( f4_arg6 ),
				value = f4_local5,
				title = f4_arg1,
				desc = f4_arg2
			} )
		end
		if f4_local5 < 60 then
			table.insert( f4_local0, {
				name = Engine.Localize( f4_arg7, f4_local5 ),
				value = f4_local5,
				title = f4_arg1,
				desc = f4_arg2
			} )
		end
		if f4_local5 == 60 then
			table.insert( f4_local0, {
				name = Engine.Localize( "MENU_1_MINUTE", f4_local5 ),
				value = f4_local5,
				title = f4_arg1,
				desc = f4_arg2
			} )
		else
			table.insert( f4_local0, {
				name = Engine.Localize( "MENU_X_MINUTES", f4_local5 / 60 ),
				value = f4_local5,
				title = f4_arg1,
				desc = f4_arg2
			} )
		end
	end
	return {
		models = {
			name = Engine.Localize( f4_arg1 ),
			desc = Engine.Localize( f4_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f4_arg0, f4_arg3, f4_local0, f4_arg4 ),
			setting = f4_arg4
		},
		properties = {
			enabledWithGametypeSetting = f4_arg5,
			revert = function ( f5_arg0 )
				Engine.SetGametypeSetting( f4_arg4, Engine.GetGametypeSetting( f4_arg4, true ) )
			end
			
		}
	}
end

local f0_local4 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4, f6_arg5, f6_arg6, f6_arg7, f6_arg8 )
	local f6_local0 = {}
	for f6_local4, f6_local5 in ipairs( f6_arg8 ) do
		if f6_local5 == 0 then
			table.insert( f6_local0, {
				name = Engine.Localize( "MENU_UNLIMITED" ),
				value = f6_local5,
				title = f6_arg1,
				desc = f6_arg2
			} )
		end
		if f6_local5 == 1 then
			table.insert( f6_local0, {
				name = Engine.Localize( f6_arg6 ),
				value = f6_local5,
				title = f6_arg1,
				desc = f6_arg2
			} )
		else
			table.insert( f6_local0, {
				name = Engine.Localize( f6_arg7, f6_local5 ),
				value = f6_local5,
				title = f6_arg1,
				desc = f6_arg2
			} )
		end
	end
	return {
		models = {
			name = Engine.Localize( f6_arg1 ),
			desc = Engine.Localize( f6_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f6_arg0, f6_arg3, f6_local0, f6_arg4 ),
			setting = f6_arg4
		},
		properties = {
			enabledWithGametypeSetting = f6_arg5,
			revert = function ( f7_arg0 )
				Engine.SetGametypeSetting( f6_arg4, Engine.GetGametypeSetting( f6_arg4, true ) )
			end
			
		}
	}
end

local f0_local5 = function ( f8_arg0 )
	local f8_local0 = {}
	table.insert( f8_local0, CoD.OptionsUtility.CreateEnabledDisabledOptions( f8_arg0, "MENU_SPECIALIST_DRAFT", "MENU_SPECIALIST_DRAFT_DESC", "pregameDraftEnabled", "SpecialistOptions_DraftEnabled" ) )
	table.insert( f8_local0, f0_local3( f8_arg0, "MENU_DRAFT_TIME", "MENU_DRAFT_TIME_DESC", "SpecialistOptions_DraftTime", "pregameDraftRoundTime", "pregameDraftEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	return f8_local0
end

local f0_local6 = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local f9_local1 = Engine.CreateModel( f9_local0, "pregameDraftEnabled" )
	if f9_arg1.draftEnabledSubscription then
		f9_arg1:removeSubscription( f9_arg1.draftEnabledSubscription )
	end
	f9_arg1.draftEnabledSubscription = f9_arg1:subscribeToModel( f9_local1, function ()
		f9_arg1:clearSavedActiveIndex()
		f9_arg1:clearSavedState()
		f9_arg1:updateDataSource( false )
	end, false )
	local f9_local2 = Engine.CreateModel( f9_local0, "Update" )
	if f9_arg1.updateSubscription then
		f9_arg1:removeSubscription( f9_arg1.updateSubscription )
	end
	f9_arg1.updateSubscription = f9_arg1:subscribeToModel( f9_local2, function ()
		f9_arg1:updateDataSource( false )
	end, false )
end

local f0_local7 = function ( f12_arg0 )
	local f12_local0 = {}
	table.insert( f12_local0, CoD.OptionsUtility.CreateEnabledDisabledOptions( f12_arg0, "MENU_BAN_PROTECT_VOTES", "MENU_BAN_PROTECT_VOTES_DESC", "pregameItemVoteEnabled", "SpecialistOptions_BanProtectEnabled" ) )
	table.insert( f12_local0, f0_local3( f12_arg0, "MENU_BAN_PROTECT_TIME", "MENU_BAN_PROTECT_TIME_DESC", "SpecialistOptions_DraftTime", "pregameItemVoteRoundTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	table.insert( f12_local0, f0_local3( f12_arg0, "MENU_CAC_MODIFICATION_TIME", "MENU_CAC_MODIFICATION_TIME_DESC", "SpecialistOptions_CACModificationTime", "pregameCACModifyTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	table.insert( f12_local0, f0_local3( f12_arg0, "MENU_STREAK_MODIFICATION_TIME", "MENU_STREAK_MODIFICATION_TIME_DESC", "SpecialistOptions_StreakModificationTime", "pregameScorestreakModifyTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	table.insert( f12_local0, f0_local4( f12_arg0, "MENU_VOTES_PER_PLAYER", "MENU_VOTES_PER_PLAYER_DESC", "SpecialistOptions_VotesPerPlayer", "pregameItemMaxVotes", "pregameItemVoteEnabled", "MENU_1_VOTE", "MENU_X_VOTES", {
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
	return f12_local0
end

local f0_local8 = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local f13_local1 = Engine.CreateModel( f13_local0, "pregameItemVoteEnabled" )
	if f13_arg1.pregameVoteSubscription then
		f13_arg1:removeSubscription( f13_arg1.pregameVoteSubscription )
	end
	f13_arg1.pregameVoteSubscription = f13_arg1:subscribeToModel( f13_local1, function ()
		f13_arg1:processEvent( {
			name = "update_state"
		} )
	end, false )
	local f13_local2 = Engine.CreateModel( f13_local0, "Update" )
	if f13_arg1.updateSubscription then
		f13_arg1:removeSubscription( f13_arg1.updateSubscription )
	end
	f13_arg1.updateSubscription = f13_arg1:subscribeToModel( f13_local2, function ()
		f13_arg1:updateDataSource( false )
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
	BanProtectSettings.ButtonList:setDataSource( "CompetitiveBanProtectSettings" )
	BanProtectSettings.ButtonList:setVerticalCount( 5 )
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
		local f17_local0 = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return f17_local0
	end )
	LUI.OverrideFunction_CallOriginalFirst( CompetitiveSettingsButtonsFlyout, "setState", function ( element, controller )
		if not IsInDefaultState( element ) then
			MakeElementNotFocusable( self, "BanProtectSettings", controller )
			MakeElementNotFocusable( self, "DraftSettings", controller )
			MakeElementNotFocusable( self, "AdvancedSettingsButton", controller )
			PlaySoundSetSound( self, "toggle" )
			DisableMouseOnElement( self, "BanProtectSettings", controller )
			DisableMouseOnElement( self, "DraftSettings", controller )
		elseif IsInDefaultState( element ) then
			MakeElementFocusable( self, "AdvancedSettingsButton", controller )
			MakeElementFocusable( self, "BanProtectSettings", controller )
			MakeElementFocusable( self, "DraftSettings", controller )
			EnableMouseOnElement( self, "BanProtectSettings", controller )
			EnableMouseOnElement( self, "DraftSettings", controller )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.BanProtectSettings:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
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

