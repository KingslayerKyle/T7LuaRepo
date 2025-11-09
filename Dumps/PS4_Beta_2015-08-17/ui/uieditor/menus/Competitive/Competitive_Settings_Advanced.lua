require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )

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
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, statName )
		},
		properties = {
			enabledWithGametypeSetting = enabledVar
		}
	}
	return listInfo
end

local PrepareAdvancedOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateSettings( controller, "MENU_PRE_STAGE_TIME", "MENU_PRE_STAGE_DESC", "SpecialistOptions_preStageTime", "pregamePreStageTime", nil, "MENU_1_SECOND", "MENU_X_SECONDS", {
		1,
		2,
		3,
		4,
		5,
		10,
		20,
		30,
		45,
		60,
		120
	} ) )
	table.insert( optionsTable, CreateSettings( controller, "MENU_POST_ROUND_TIME", "MENU_POST_ROUND_DESC", "SpecialistOptions_postRoundTime", "pregamePostRoundTime", nil, "MENU_1_SECOND", "MENU_X_SECONDS", {
		1,
		2,
		3,
		4,
		5,
		10,
		20,
		30,
		45,
		60,
		120
	} ) )
	table.insert( optionsTable, CreateSettings( controller, "MENU_POST_STAGE_TIME", "MENU_POST_STAGE_DESC", "SpecialistOptions_postStageTime", "pregamePostStageTime", nil, "MENU_1_SECOND", "MENU_X_SECONDS", {
		1,
		2,
		3,
		4,
		5,
		10,
		20,
		30,
		45,
		60,
		120
	} ) )
	return optionsTable
end

local PrepareEditOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CoD.OptionsUtility.CreateNamedSettings( controller, "MENU_ALWAYS_SHOW_CAC_EDIT", "MENU_ALWAYS_SHOW_CAC_DESC", "SpecialistOptions_AlwaysShowCACEdit", "pregameAlwaysShowCACEdit", {
		{
			option = "MENU_ALWAYS",
			value = 1
		},
		{
			option = "MENU_DISABLED",
			value = 0
		}
	} ) )
	table.insert( optionsTable, CoD.OptionsUtility.CreateNamedSettings( controller, "MENU_ALWAYS_SHOW_STREAK_EDIT", "MENU_ALWAYS_SHOW_STREAK_DESC", "SpecialistOptions_AlwaysShowStreakEdit", "pregameAlwaysShowStreakEdit", {
		{
			option = "MENU_ALWAYS",
			value = 1
		},
		{
			option = "MENU_DISABLED",
			value = 0
		}
	} ) )
	return optionsTable
end

local PrepareOrderOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CoD.OptionsUtility.CreateNamedSettings( controller, "MENU_PLAYER_SELECT_ORDER", "MENU_PLAYER_SELECT_ORDER_DESC", "SpecialistOptions_SortType", "pregamePositionSortType", {
		{
			option = "MENU_RANDOM",
			value = Enum.PregameSortType.PREGAME_SORT_TYPE_RANDOM
		},
		{
			option = "MENU_PLAYER_JOIN_ORDER",
			value = Enum.PregameSortType.PREGAME_SORT_TYPE_CLIENTNUM
		}
	} ) )
	table.insert( optionsTable, CoD.OptionsUtility.CreateNamedSettings( controller, "MENU_PLAYER_SELECT_SHUFFLE", "MENU_PLAYER_SELECT_SHUFFLE_DESC", "SpecialistOptions_ShuffleMethod", "pregamePositionShuffleMethod", {
		{
			option = "MENU_NONE",
			value = Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_NONE
		},
		{
			option = "MENU_REVERSE",
			value = Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_REVERSE
		},
		{
			option = "MENU_RANDOM",
			value = Enum.PregameShuffleMethod.PREGAME_SHUFFLE_METHOD_RANDOM
		}
	} ) )
	return optionsTable
end

DataSources.CompetitiveAdvancedSettings = DataSourceHelpers.ListSetup( "CompetitiveAdvancedSettings", PrepareAdvancedOptions, nil, nil, nil )
DataSources.CompetitiveEditSettings = DataSourceHelpers.ListSetup( "CompetitiveEditSettings", PrepareEditOptions, nil, nil, nil )
DataSources.CompetitiveOrderSettings = DataSourceHelpers.ListSetup( "CompetitiveOrderSettings", PrepareOrderOptions, nil, nil, nil )
LUI.createMenu.Competitive_Settings_Advanced = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Advanced" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Advanced.buttonPrompts" )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Desc:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuOptionHighlight.DescTitle:setText( Engine.Localize( modelValue ) )
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
	
	local CompetitiveSettingsList1 = CoD.Competitive_SettingsList.new( self, controller )
	CompetitiveSettingsList1:setLeftRight( true, false, 35, 659 )
	CompetitiveSettingsList1:setTopBottom( true, false, 85, 236 )
	CompetitiveSettingsList1.ButtonList:setDataSource( "CompetitiveAdvancedSettings" )
	CompetitiveSettingsList1.ButtonList:setVerticalCount( 3 )
	CompetitiveSettingsList1.Title.DescTitle:setText( Engine.Localize( "MENU_TIME_SETTINGS_CAPS" ) )
	self:addElement( CompetitiveSettingsList1 )
	self.CompetitiveSettingsList1 = CompetitiveSettingsList1
	
	local CompetitiveSettingsList0 = CoD.Competitive_SettingsList.new( self, controller )
	CompetitiveSettingsList0:setLeftRight( true, false, 35, 659 )
	CompetitiveSettingsList0:setTopBottom( true, false, 236, 387 )
	CompetitiveSettingsList0.ButtonList:setDataSource( "CompetitiveEditSettings" )
	CompetitiveSettingsList0.Title.DescTitle:setText( Engine.Localize( "MENU_EDIT_SETTINGS" ) )
	self:addElement( CompetitiveSettingsList0 )
	self.CompetitiveSettingsList0 = CompetitiveSettingsList0
	
	local CompetitiveSettingsList2 = CoD.Competitive_SettingsList.new( self, controller )
	CompetitiveSettingsList2:setLeftRight( true, false, 35, 659 )
	CompetitiveSettingsList2:setTopBottom( true, false, 360, 511 )
	CompetitiveSettingsList2.ButtonList:setDataSource( "CompetitiveOrderSettings" )
	CompetitiveSettingsList2.Title.DescTitle:setText( Engine.Localize( "MENU_PLAYER_ORDER_CAPS" ) )
	self:addElement( CompetitiveSettingsList2 )
	self.CompetitiveSettingsList2 = CompetitiveSettingsList2
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 774, 1131 )
	TextBox0:setTopBottom( true, false, 111.5, 142 )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "GametypeSettings", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	CompetitiveSettingsList1.navigation = {
		down = CompetitiveSettingsList0
	}
	CompetitiveSettingsList0.navigation = {
		left = CompetitiveSettingsList2,
		up = CompetitiveSettingsList1,
		down = CompetitiveSettingsList2
	}
	CompetitiveSettingsList2.navigation = {
		left = CompetitiveSettingsList0,
		up = CompetitiveSettingsList0
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	CompetitiveSettingsList1.id = "CompetitiveSettingsList1"
	CompetitiveSettingsList0.id = "CompetitiveSettingsList0"
	CompetitiveSettingsList2.id = "CompetitiveSettingsList2"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.CompetitiveSettingsList1:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cac3dTitleIntermediary0:close()
		self.StartMenulineGraphicsOptions0:close()
		self.StartMenuOptionHighlight:close()
		self.StartMenuOptionIconContainer:close()
		self.CompetitiveSettingsList1:close()
		self.CompetitiveSettingsList0:close()
		self.CompetitiveSettingsList2:close()
		self.Desc:close()
		self.TextBox0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Advanced.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

