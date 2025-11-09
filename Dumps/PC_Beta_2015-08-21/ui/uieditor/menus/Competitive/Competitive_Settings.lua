require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsButtons_Flyout" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "title" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "description" ), "" )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6, f2_arg7, f2_arg8 )
	local f2_local0 = {}
	for f2_local4, f2_local5 in ipairs( f2_arg8 ) do
		if f2_local5 == 0 then
			table.insert( f2_local0, {
				name = Engine.Localize( "MENU_UNLIMITED" ),
				value = f2_local5,
				title = f2_arg1,
				desc = f2_arg2
			} )
		end
		if f2_local5 == 1 then
			table.insert( f2_local0, {
				name = Engine.Localize( f2_arg6 ),
				value = f2_local5,
				title = f2_arg1,
				desc = f2_arg2
			} )
		else
			table.insert( f2_local0, {
				name = Engine.Localize( f2_arg7, f2_local5 ),
				value = f2_local5,
				title = f2_arg1,
				desc = f2_arg2
			} )
		end
	end
	return {
		models = {
			name = Engine.Localize( f2_arg1 ),
			desc = Engine.Localize( f2_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f2_arg0, f2_arg3, f2_local0, f2_arg4 )
		},
		properties = {
			enabledWithGametypeSetting = f2_arg5
		}
	}
end

local f0_local2 = function ( f3_arg0 )
	local f3_local0 = {}
	table.insert( f3_local0, CoD.OptionsUtility.CreateEnabledDisabledOptions( f3_arg0, "MENU_SPECIALIST_DRAFT", "MENU_SPECIALIST_DRAFT_DESC", "pregameDraftEnabled", "SpecialistOptions_DraftEnabled" ) )
	table.insert( f3_local0, f0_local1( f3_arg0, "MENU_DRAFT_TIME", "MENU_DRAFT_TIME_DESC", "SpecialistOptions_DraftTime", "pregameDraftRoundTime", "pregameDraftEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
		10,
		20,
		30,
		45,
		60,
		90,
		120,
		0
	} ) )
	return f3_local0
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "pregameDraftEnabled" )
	if f4_arg1.updateSubscription then
		f4_arg1:removeSubscription( f4_arg1.updateSubscription )
	end
	f4_arg1.updateSubscription = f4_arg1:subscribeToModel( f4_local0, function ()
		f4_arg1:processEvent( {
			name = "update_state"
		} )
	end, false )
end

local f0_local4 = function ( f6_arg0 )
	local f6_local0 = {}
	table.insert( f6_local0, CoD.OptionsUtility.CreateEnabledDisabledOptions( f6_arg0, "MENU_BAN_PROTECT_VOTES", "MENU_BAN_PROTECT_VOTES_DESC", "pregameItemVoteEnabled", "SpecialistOptions_BanProtectEnabled" ) )
	table.insert( f6_local0, f0_local1( f6_arg0, "MENU_BAN_PROTECT_TIME", "MENU_BAN_PROTECT_TIME_DESC", "SpecialistOptions_DraftTime", "pregameItemVoteRoundTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
		10,
		20,
		30,
		45,
		60,
		90,
		120,
		0
	} ) )
	table.insert( f6_local0, f0_local1( f6_arg0, "MENU_CAC_MODIFICATION_TIME", "MENU_CAC_MODIFICATION_TIME_DESC", "SpecialistOptions_CACModificationTime", "pregameCACModifyTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
		10,
		20,
		30,
		45,
		60,
		90,
		120,
		0
	} ) )
	table.insert( f6_local0, f0_local1( f6_arg0, "MENU_STREAK_MODIFICATION_TIME", "MENU_STREAK_MODIFICATION_TIME_DESC", "SpecialistOptions_StreakModificationTime", "pregameScorestreakModifyTime", "pregameItemVoteEnabled", "MENU_1_SECOND", "MENU_X_SECONDS", {
		10,
		20,
		30,
		45,
		60,
		90,
		120,
		0
	} ) )
	table.insert( f6_local0, f0_local1( f6_arg0, "MENU_VOTES_PER_PLAYER", "MENU_VOTES_PER_PLAYER_DESC", "SpecialistOptions_VotesPerPlayer", "pregameItemMaxVotes", "pregameItemVoteEnabled", "MENU_1_VOTE", "MENU_X_VOTES", {
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
	return f6_local0
end

local f0_local5 = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "pregameItemVoteEnabled" )
	if f7_arg1.updateSubscription then
		f7_arg1:removeSubscription( f7_arg1.updateSubscription )
	end
	f7_arg1.updateSubscription = f7_arg1:subscribeToModel( f7_local0, function ()
		f7_arg1:processEvent( {
			name = "update_state"
		} )
	end, false )
end

local f0_local6 = function ( f9_arg0 )
	local f9_local0 = {
		{
			optionDisplay = "MENU_ADVANCED_SETTINGS",
			customId = "btnAdvSettings",
			action = OpenMenuByNameParam,
			actionParam = "Competitive_Settings_Advanced"
		}
	}
	local f9_local1 = {}
	for f9_local5, f9_local6 in ipairs( f9_local0 ) do
		table.insert( f9_local1, {
			models = {
				displayText = Engine.Localize( f9_local6.optionDisplay ),
				customId = f9_local6.customId
			},
			properties = {
				action = f9_local6.action,
				actionParam = f9_local6.actionParam
			}
		} )
	end
	return f9_local1
end

DataSources.CompetitiveDraftSettings = DataSourceHelpers.ListSetup( "CompetitiveDraftSettings", f0_local2, nil, nil, f0_local3 )
DataSources.CompetitiveBanProtectSettings = DataSourceHelpers.ListSetup( "CompetitiveBanProtectSettings", f0_local4, nil, nil, f0_local5 )
DataSources.CompetitiveAdvancedSettingsButtons = DataSourceHelpers.ListSetup( "CompetitiveAdvancedSettingsButtons", f0_local6, nil, nil, nil )
LUI.createMenu.Competitive_Settings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 774, 1131 )
	Desc:setTopBottom( true, false, 154, 176 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Desc:subscribeToGlobalModel( controller, "GametypeSettings", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Desc:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( Desc )
	self.Desc = Desc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( true, false, 774, 920 )
	StartMenuOptionHighlight:setTopBottom( true, false, 107.5, 147.5 )
	StartMenuOptionHighlight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	StartMenuOptionHighlight:subscribeToGlobalModel( controller, "GametypeSettings", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			StartMenuOptionHighlight.DescTitle:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( self, controller )
	StartMenuOptionIconContainer:setLeftRight( true, false, 659, 766 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 109.5, 216.5 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( true, false, 641, 657 )
	Image00000:setTopBottom( true, false, 107.5, 115.5 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 641, 657 )
	Image000000:setTopBottom( true, false, 209.5, 217.5 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local DraftSettings = CoD.Competitive_SettingsList.new( self, controller )
	DraftSettings:setLeftRight( true, false, 35, 659 )
	DraftSettings:setTopBottom( true, false, 297.5, 405.5 )
	DraftSettings.ButtonList:setDataSource( "CompetitiveDraftSettings" )
	DraftSettings.Title.DescTitle:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_SETTINGS_CAPS" ) )
	self:addElement( DraftSettings )
	self.DraftSettings = DraftSettings
	
	local BanProtectSettings = CoD.Competitive_SettingsList.new( self, controller )
	BanProtectSettings:setLeftRight( true, false, 35, 659 )
	BanProtectSettings:setTopBottom( true, false, 85, 302.5 )
	BanProtectSettings.ButtonList:setDataSource( "CompetitiveBanProtectSettings" )
	BanProtectSettings.ButtonList:setVerticalCount( 5 )
	BanProtectSettings.Title.DescTitle:setText( Engine.Localize( "MENU_BAN_PROTECT_SETTINGS_CAPS" ) )
	self:addElement( BanProtectSettings )
	self.BanProtectSettings = BanProtectSettings
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 774, 1131 )
	TextBox0:setTopBottom( true, false, 111.5, 142 )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "GametypeSettings", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			TextBox0:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Title0 = CoD.StartMenu_OptionHighlight.new( self, controller )
	Title0:setLeftRight( true, false, 75, 417 )
	Title0:setTopBottom( true, false, 405.5, 445.5 )
	Title0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Title0.DescTitle:setRGB( 1, 1, 1 )
	Title0.DescTitle:setText( Engine.Localize( "MENU_ADVANCED_SETTINGS_CAPS" ) )
	self:addElement( Title0 )
	self.Title0 = Title0
	
	local AdvancedSettingsButton = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, true )
	AdvancedSettingsButton:makeFocusable()
	AdvancedSettingsButton:setLeftRight( true, false, 75, 355 )
	AdvancedSettingsButton:setTopBottom( true, false, 445.5, 477.5 )
	AdvancedSettingsButton:setDataSource( "CompetitiveAdvancedSettingsButtons" )
	AdvancedSettingsButton:setWidgetType( CoD.List1ButtonLarge_PH )
	AdvancedSettingsButton:setSpacing( 0 )
	AdvancedSettingsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	AdvancedSettingsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( AdvancedSettingsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( AdvancedSettingsButton )
	self.AdvancedSettingsButton = AdvancedSettingsButton
	
	local BanRestrictionsTitle = CoD.StartMenu_OptionHighlight.new( self, controller )
	BanRestrictionsTitle:setLeftRight( true, false, 176, 518 )
	BanRestrictionsTitle:setTopBottom( true, false, 486, 526 )
	BanRestrictionsTitle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	BanRestrictionsTitle.DescTitle:setRGB( 1, 1, 1 )
	BanRestrictionsTitle.DescTitle:setText( Engine.Localize( "MENU_ITEM_BANS_RESTRICTIONS_CAPS" ) )
	self:addElement( BanRestrictionsTitle )
	self.BanRestrictionsTitle = BanRestrictionsTitle
	
	local CompetitiveSettingsButtonsFlyout = CoD.Competitive_SettingsButtons_Flyout.new( self, controller )
	CompetitiveSettingsButtonsFlyout:setLeftRight( true, false, 69, 683 )
	CompetitiveSettingsButtonsFlyout:setTopBottom( true, false, 526, 686 )
	LUI.OverrideFunction_CallOriginalFirst( CompetitiveSettingsButtonsFlyout, "setState", function ( element, controller )
		if not IsInDefaultState( element ) then
			MakeElementNotFocusable( self, "BanProtectSettings", controller )
			MakeElementNotFocusable( self, "DraftSettings", controller )
			MakeElementNotFocusable( self, "AdvancedSettingsButton", controller )
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
		down = AdvancedSettingsButton
	}
	BanProtectSettings.navigation = {
		down = DraftSettings
	}
	AdvancedSettingsButton.navigation = {
		up = DraftSettings,
		down = CompetitiveSettingsButtonsFlyout
	}
	CompetitiveSettingsButtonsFlyout.navigation = {
		up = AdvancedSettingsButton
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	DraftSettings.id = "DraftSettings"
	BanProtectSettings.id = "BanProtectSettings"
	AdvancedSettingsButton.id = "AdvancedSettingsButton"
	CompetitiveSettingsButtonsFlyout.id = "CompetitiveSettingsButtonsFlyout"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.BanProtectSettings:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cac3dTitleIntermediary0:close()
		element.StartMenulineGraphicsOptions0:close()
		element.StartMenuOptionHighlight:close()
		element.StartMenuOptionIconContainer:close()
		element.DraftSettings:close()
		element.BanProtectSettings:close()
		element.Title0:close()
		element.AdvancedSettingsButton:close()
		element.BanRestrictionsTitle:close()
		element.CompetitiveSettingsButtonsFlyout:close()
		element.Desc:close()
		element.TextBox0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

