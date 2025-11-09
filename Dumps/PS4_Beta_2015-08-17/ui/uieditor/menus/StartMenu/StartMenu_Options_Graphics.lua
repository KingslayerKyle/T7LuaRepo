require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local CreateModels_SafeArea = function ( controller )
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_SAFE_AREA" ),
			desc = Engine.Localize( "MENU_SAFE_AREA_DESC" ),
			image = RegisterMaterial( "" ),
			action = function ( self, element, controller, param, menu )
				NavigateToMenu( menu, "StartMenu_Options_Graphics_SafeArea", true, controller )
			end
		},
		properties = {
			disabled = false
		}
	}
	return listInfo
end

local CreateModels_Brightness = function ( controller )
	local profileVar = "r_sceneBrightness"
	local toggle = {
		{
			name = "1",
			value = CoD.BRIGHTNESS_1
		},
		{
			name = "2",
			value = CoD.BRIGHTNESS_2
		},
		{
			name = "3",
			value = CoD.BRIGHTNESS_3
		},
		{
			name = "4",
			value = CoD.BRIGHTNESS_4
		},
		{
			name = "5",
			value = CoD.BRIGHTNESS_5
		},
		{
			name = "6",
			value = CoD.BRIGHTNESS_6
		},
		{
			name = "7",
			value = CoD.BRIGHTNESS_7
		},
		{
			name = "8",
			value = CoD.BRIGHTNESS_8
		},
		{
			name = "9",
			value = CoD.BRIGHTNESS_9
		},
		{
			name = "10",
			value = CoD.BRIGHTNESS_10
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_BRIGHTNESS" ),
			desc = Engine.Localize( "MENU_BRIGHTNESS_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "GraphicsOptions_Brightness", toggle, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, toggle, profileVar )
		},
		properties = {
			disabled = false
		}
	}
	return listInfo
end

local CreateModels_DrawCrosshair = function ( controller )
	local profileVar = "cg_drawCrosshair3D"
	local toggle = {
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_DRAW_CROSSHAIR" ),
			desc = Engine.Localize( "MENU_DRAW_CROSSHAIR_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "GraphicsOptions_Crosshair", toggle, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, toggle, profileVar )
		},
		properties = {
			disabled = true
		}
	}
	return listInfo
end

local CreateModels_DualPlay = function ( controller )
	local profileVar = "start_in_3d"
	local toggle = {
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_DUAL_VIEW_SETTINGS" ),
			desc = Engine.Localize( "MENU_DUAL_VIEW_SETTINGS_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "GraphicsOptions_DualView", toggle, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, toggle, profileVar )
		},
		properties = {
			disabled = true
		}
	}
	return listInfo
end

local CreateModels_GamertagIndicator = function ( controller )
	local profileVar = "gamertag"
	local toggle = {
		{
			name = Engine.Localize( "MENU_INDICATOR_FULL" ),
			value = CoD.SENSITIVITY_1
		},
		{
			name = Engine.Localize( "MENU_INDICATOR_ABBREVIATED" ),
			value = CoD.SENSITIVITY_1
		},
		{
			name = Engine.Localize( "MENU_INDICATOR_ICON" ),
			value = CoD.SENSITIVITY_1
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "PLATFORM_TEAM_INDICATOR" ),
			desc = Engine.Localize( "PLATFORM_TEAM_INDICATOR_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "GraphicsOptions_Indicator", toggle, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, toggle, profileVar )
		},
		properties = {
			disabled = true
		}
	}
	return listInfo
end

local CreateModels_GraphicContent = function ( controller )
	local profileVar = "cg_mature"
	local toggle = {
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_GRAPHIC_CONTENT" ),
			desc = Engine.Localize( "MENU_GRAPHIC_CONTENT_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "GraphicsOptions_GraphicContent", toggle, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, toggle, profileVar )
		},
		properties = {
			disabled = Dvar.ui_execdemo:get()
		}
	}
	return listInfo
end

local CreateModels_LanguageSelection = function ( controller )
	local options = {
		{
			name = Engine.Localize( "MENU_LANGUAGE_SELECTION" ),
			value = Engine.Localize( "MENU_LANGUAGE_SELECTION" )
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_CHOOSE_LANGUAGE" ),
			desc = Engine.Localize( "MENU_CHOOSE_LANGAUGE_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "GraphicsOptions_LanguageSelection", options )
		},
		properties = {
			hideArrows = true,
			action = function ( self, element, controller, actionParam, menu )
				NavigateToMenu( menu, "FirstTimeLanguageSelectionSetting", true, controller )
			end
		}
	}
	return listInfo
end

local PrepareGraphicsOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateModels_SafeArea( controller ) )
	table.insert( optionsTable, CreateModels_Brightness( controller ) )
	if ShouldDisplayLanguageSelectionScreen() then
		table.insert( optionsTable, CreateModels_LanguageSelection( controller ) )
	end
	return optionsTable
end

DataSources.OptionGraphicsList = DataSourceHelpers.ListSetup( "OptionGraphicsList", PrepareGraphicsOptions, true )
LUI.createMenu.StartMenu_Options_Graphics = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Graphics" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 774, 1020 )
	Desc:setTopBottom( true, false, 150, 172 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 32, 702 )
	ButtonList:setTopBottom( true, false, 107.5, 675.5 )
	ButtonList:setDataSource( "OptionGraphicsList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 10 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( true, false, 774, 920 )
	StartMenuOptionHighlight:setTopBottom( true, false, 111.5, 151.5 )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	Desc:linkToElementModel( ButtonList, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Desc:setText( Engine.Localize( modelValue ) )
		end
	end )
	StartMenuOptionHighlight:linkToElementModel( ButtonList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuOptionHighlight.DescTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UpdateGamerprofile( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		CloseStartMenu( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	ButtonList.id = "ButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenulineGraphicsOptions0:close()
		self.ButtonList:close()
		self.StartMenuOptionHighlight:close()
		self.StartMenuOptionIconContainer:close()
		self.MenuFrame:close()
		self.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

