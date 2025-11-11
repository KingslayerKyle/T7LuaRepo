require( "ui.uieditor.widgets.Competitive.Competitive_SettingsButtons_Flyout" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_SelectedItemInfo" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )

local PreLoadFunc = function ( self, controller )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local titleModel = Engine.CreateModel( gametypeSettingsModel, "title" )
	Engine.SetModelValue( titleModel, "" )
	local descriptionModel = Engine.CreateModel( gametypeSettingsModel, "description" )
	Engine.SetModelValue( descriptionModel, "" )
end

local CreateTimeSettings = function ( controller, title, desc, optionsDatasourceName, statName, enabledVar, singleValueString, pluralValueString, values )
	local options = {}
	for index, value in ipairs( values ) do
		if value == 0 then
			table.insert( options, {
				name = Engine.Localize( "MENU_UNLIMITED" ),
				value = value,
				title = title,
				desc = desc
			} )
		end
		if value == 1 then
			table.insert( options, {
				name = Engine.Localize( singleValueString ),
				value = value,
				title = title,
				desc = desc
			} )
		end
		if value < 60 then
			table.insert( options, {
				name = Engine.Localize( pluralValueString, value ),
				value = value,
				title = title,
				desc = desc
			} )
		end
		if value == 60 then
			table.insert( options, {
				name = Engine.Localize( "MENU_1_MINUTE", value ),
				value = value,
				title = title,
				desc = desc
			} )
		else
			table.insert( options, {
				name = Engine.Localize( "MENU_X_MINUTES", value / 60 ),
				value = value,
				title = title,
				desc = desc
			} )
		end
	end
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, statName ),
			setting = statName
		},
		properties = {
			enabledWithGametypeSetting = enabledVar,
			revert = function ( self )
				Engine.SetGametypeSetting( statName, Engine.GetGametypeSetting( statName, true ) )
			end
		}
	}
	return listInfo
end

local CreateSettings = function ( controller, title, desc, optionsDatasourceName, statName, enabledVar, singleValueString, pluralValueString, values )
	local options = {}
	for index, value in ipairs( values ) do
		if value == 0 then
			table.insert( options, {
				name = Engine.Localize( "MENU_UNLIMITED" ),
				value = value,
				title = title,
				desc = desc
			} )
		end
		if value == 1 then
			table.insert( options, {
				name = Engine.Localize( singleValueString ),
				value = value,
				title = title,
				desc = desc
			} )
		else
			table.insert( options, {
				name = Engine.Localize( pluralValueString, value ),
				value = value,
				title = title,
				desc = desc
			} )
		end
	end
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, statName ),
			setting = statName
		},
		properties = {
			enabledWithGametypeSetting = enabledVar,
			revert = function ( self )
				Engine.SetGametypeSetting( statName, Engine.GetGametypeSetting( statName, true ) )
			end
		}
	}
	return listInfo
end

local PrepareDraftOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CoD.OptionsUtility.CreateEnabledDisabledOptions( controller, "MENU_SPECIALIST_DRAFT", "MENU_SPECIALIST_DRAFT_DESC", "pregameDraftEnabled", "SpecialistOptions_DraftEnabled" ) )
	table.insert( optionsTable, CreateTimeSettings( controller, "MENU_DRAFT_TIME", "MENU_DRAFT_TIME_DESC", "SpecialistOptions_DraftTime", "pregameDraftRoundTime", "pregameDraftEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	return optionsTable
end

local DraftSettingsUpdate = function ( controller, list, listModel )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local draftEnabledModel = Engine.CreateModel( gametypeSettingsModel, "pregameDraftEnabled" )
	if list.draftEnabledSubscription then
		list:removeSubscription( list.draftEnabledSubscription )
	end
	list.draftEnabledSubscription = list:subscribeToModel( draftEnabledModel, function ()
		list:clearSavedActiveIndex()
		list:clearSavedState()
		list:updateDataSource( false )
	end, false )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource( false )
	end, false )
end

local PrepareBanProtectOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CoD.OptionsUtility.CreateEnabledDisabledOptions( controller, "MENU_BAN_PROTECT_VOTES", "MENU_BAN_PROTECT_VOTES_DESC", "pregameItemVoteEnabled", "SpecialistOptions_BanProtectEnabled" ) )
	table.insert( optionsTable, CreateTimeSettings( controller, "MENU_BAN_PROTECT_TIME", "MENU_BAN_PROTECT_TIME_DESC", "SpecialistOptions_DraftTime", "pregameItemVoteRoundTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	table.insert( optionsTable, CreateTimeSettings( controller, "MENU_CAC_MODIFICATION_TIME", "MENU_CAC_MODIFICATION_TIME_DESC", "SpecialistOptions_CACModificationTime", "pregameCACModifyTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	table.insert( optionsTable, CreateTimeSettings( controller, "MENU_STREAK_MODIFICATION_TIME", "MENU_STREAK_MODIFICATION_TIME_DESC", "SpecialistOptions_StreakModificationTime", "pregameScorestreakModifyTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
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
	table.insert( optionsTable, CreateSettings( controller, "MENU_VOTES_PER_PLAYER", "MENU_VOTES_PER_PLAYER_DESC", "SpecialistOptions_VotesPerPlayer", "pregameItemMaxVotes", "pregameItemVoteEnabled", "MENU_1_VOTE", "MENU_X_VOTES", {
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
	return optionsTable
end

local BanProtectUpdate = function ( controller, list, listModel )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local pregameVoteModel = Engine.CreateModel( gametypeSettingsModel, "pregameItemVoteEnabled" )
	if list.pregameVoteSubscription then
		list:removeSubscription( list.pregameVoteSubscription )
	end
	list.pregameVoteSubscription = list:subscribeToModel( pregameVoteModel, function ()
		list:processEvent( {
			name = "update_state"
		} )
	end, false )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource( false )
	end, false )
end

DataSources.CompetitiveDraftSettings = DataSourceHelpers.ListSetup( "CompetitiveDraftSettings", PrepareDraftOptions, nil, nil, DraftSettingsUpdate )
DataSources.CompetitiveBanProtectSettings = DataSourceHelpers.ListSetup( "CompetitiveBanProtectSettings", PrepareBanProtectOptions, nil, nil, BanProtectUpdate )
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
	
	local DraftSettings = CoD.Competitive_SettingsList.new( menu, controller )
	DraftSettings:setLeftRight( 0, 0, 41, 935 )
	DraftSettings:setTopBottom( 0, 0, 308, 480 )
	DraftSettings.Title.DescTitle:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_SETTINGS_CAPS" ) )
	DraftSettings.ButtonList:setDataSource( "CompetitiveDraftSettings" )
	self:addElement( DraftSettings )
	self.DraftSettings = DraftSettings
	
	local BanProtectSettings = CoD.Competitive_SettingsList.new( menu, controller )
	BanProtectSettings:setLeftRight( 0, 0, 40, 936 )
	BanProtectSettings:setTopBottom( 0, 0, 1, 315 )
	BanProtectSettings.Title.DescTitle:setText( Engine.Localize( "MENU_BAN_PROTECT_SETTINGS_CAPS" ) )
	BanProtectSettings.ButtonList:setVerticalCount( 5 )
	BanProtectSettings.ButtonList:setDataSource( "CompetitiveBanProtectSettings" )
	self:addElement( BanProtectSettings )
	self.BanProtectSettings = BanProtectSettings
	
	local BanRestrictionsTitle = CoD.StartMenu_OptionHighlight.new( menu, controller )
	BanRestrictionsTitle:setLeftRight( 0, 0, 103, 616 )
	BanRestrictionsTitle:setTopBottom( 0, 0, 468, 528 )
	BanRestrictionsTitle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	BanRestrictionsTitle.DescTitle:setText( Engine.Localize( "MENU_ITEM_BANS_RESTRICTIONS_CAPS" ) )
	self:addElement( BanRestrictionsTitle )
	self.BanRestrictionsTitle = BanRestrictionsTitle
	
	local CompetitiveSettingsButtonsFlyout = CoD.Competitive_SettingsButtons_Flyout.new( menu, controller )
	CompetitiveSettingsButtonsFlyout:setLeftRight( 0, 0, 101, 1022 )
	CompetitiveSettingsButtonsFlyout:setTopBottom( 0, 0, 520, 760 )
	CompetitiveSettingsButtonsFlyout:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return retVal
	end )
	LUI.OverrideFunction_CallOriginalFirst( CompetitiveSettingsButtonsFlyout, "setState", function ( element, state )
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
		left = BanProtectSettings,
		up = BanProtectSettings,
		down = CompetitiveSettingsButtonsFlyout
	}
	BanProtectSettings.navigation = {
		left = DraftSettings,
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsSelectedItemInfo:close()
		self.DraftSettings:close()
		self.BanProtectSettings:close()
		self.BanRestrictionsTitle:close()
		self.CompetitiveSettingsButtonsFlyout:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

