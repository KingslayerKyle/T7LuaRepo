require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( self )
		local focusedState = LUI.savedMenuStates[self.id]
		if focusedState ~= nil and focusedState.id then
			focusedState.saveEvent.originalEvent = nil
			return self:processEvent( {
				name = "restore_focus",
				id = focusedState.id,
				data = focusedState.data,
				saveEvent = focusedState.saveEvent
			} )
		else
			
		end
	end
	
end

local ItemSelectedFunction = function ( self, element, controller, actionParam, menu )
	Engine.SetProfileVar( controller, actionParam, element.value )
end

local CreateOptionDataSource = function ( controller, dataSourceName, options, profileStat )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					value = options[index].value,
					actionParam = profileStat,
					action = ItemSelectedFunction
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, true )
	return dataSourceName
end

local GetProfileSelection = function ( controller, options, stat )
	for index, optionTable in ipairs( options ) do
		if options[index].value == tonumber( Engine.ProfileValueAsString( controller, stat ) ) then
			return index
		end
	end
end

local CreateLookInversionModels = function ( controller )
	local profileVar = "input_invertpitch"
	local options = {
		{
			name = Engine.Localize( "MENU_NOT_INVERTED" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_INVERTED" ),
			value = 1
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_LOOK_INVERSION" ),
			desc = Engine.Localize( "MENU_LOOK_INVERSION_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CreateOptionDataSource( controller, "ControllerOptions_LookInversion", options, profileVar ),
			currentSelection = GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

local CreateHorizontalLookSensitivityModels = function ( controller )
	local profileVar = "input_viewSensitivityHorizontal"
	local options = {
		{
			name = Engine.Localize( "MENU_SENSITIVITY_VERY_LOW_CAPS" ),
			value = CoD.SENSITIVITY_1
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_LOW_CAPS" ),
			value = CoD.SENSITIVITY_2
		},
		{
			name = "3",
			value = CoD.SENSITIVITY_3
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_MEDIUM_CAPS" ),
			value = CoD.SENSITIVITY_4
		},
		{
			name = "5",
			value = CoD.SENSITIVITY_5
		},
		{
			name = "6",
			value = CoD.SENSITIVITY_6
		},
		{
			name = "7",
			value = CoD.SENSITIVITY_7
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_HIGH_CAPS" ),
			value = CoD.SENSITIVITY_8
		},
		{
			name = "9",
			value = CoD.SENSITIVITY_9
		},
		{
			name = "10",
			value = CoD.SENSITIVITY_10
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_VERY_HIGH_CAPS" ),
			value = CoD.SENSITIVITY_11
		},
		{
			name = "12",
			value = CoD.SENSITIVITY_12
		},
		{
			name = "13",
			value = CoD.SENSITIVITY_13
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_INSANE_CAPS" ),
			value = CoD.SENSITIVITY_14
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_LOOK_SENSITIVITY_HORIZONTAL" ),
			desc = Engine.Localize( "MENU_LOOK_SENSITIVITY_HORIZONTAL_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CreateOptionDataSource( controller, "ControllerOptions_LookSensitivity_Horizontal", options, profileVar ),
			currentSelection = GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

local CreateVerticalLookSensitivityModels = function ( controller )
	local profileVar = "input_viewSensitivityVertical"
	local options = {
		{
			name = Engine.Localize( "MENU_SENSITIVITY_VERY_LOW_CAPS" ),
			value = CoD.SENSITIVITY_1
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_LOW_CAPS" ),
			value = CoD.SENSITIVITY_2
		},
		{
			name = "3",
			value = CoD.SENSITIVITY_3
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_MEDIUM_CAPS" ),
			value = CoD.SENSITIVITY_4
		},
		{
			name = "5",
			value = CoD.SENSITIVITY_5
		},
		{
			name = "6",
			value = CoD.SENSITIVITY_6
		},
		{
			name = "7",
			value = CoD.SENSITIVITY_7
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_HIGH_CAPS" ),
			value = CoD.SENSITIVITY_8
		},
		{
			name = "9",
			value = CoD.SENSITIVITY_9
		},
		{
			name = "10",
			value = CoD.SENSITIVITY_10
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_VERY_HIGH_CAPS" ),
			value = CoD.SENSITIVITY_11
		},
		{
			name = "12",
			value = CoD.SENSITIVITY_12
		},
		{
			name = "13",
			value = CoD.SENSITIVITY_13
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_INSANE_CAPS" ),
			value = CoD.SENSITIVITY_14
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL" ),
			desc = Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CreateOptionDataSource( controller, "ControllerOptions_LookSensitivity_Vertical", options, profileVar ),
			currentSelection = GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

local CreateControllerVibrationModels = function ( controller )
	local profileVar = "gpad_rumble"
	local options = {
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		},
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_CONTROLLER_VIBRATION" ),
			desc = Engine.Localize( "MENU_CONTROLLER_VIBRATION_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CreateOptionDataSource( controller, "ControllerOptions_Vibration", options, profileVar ),
			currentSelection = GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

local CreateAimAssistModels = function ( controller )
	local profileVar = "input_targetassist"
	if CoD.isCampaign or CoD.isZombie then
		profileVar = "input_autoAim"
	end
	local options = {
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		},
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_TARGET_ASSIST" ),
			desc = Engine.Localize( "MENU_TARGET_ASSIST_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CreateOptionDataSource( controller, "ControllerOptions_AimAssist", options, profileVar ),
			currentSelection = GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

local CreateButtonLayoutModels = function ( controller )
	local profileVar = "gpad_buttonsConfig"
	local options = {
		{
			name = Engine.Localize( "MENU_DEFAULT" ),
			value = CoD.BUTTONS_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_TACTICAL" ),
			value = CoD.BUTTONS_EXPERIMENTAL
		},
		{
			name = Engine.Localize( "MENU_LEFTY" ),
			value = CoD.BUTTONS_LEFTY
		},
		{
			name = Engine.Localize( "MENU_NOMAD" ),
			value = CoD.BUTTONS_NOMAD
		},
		{
			name = Engine.Localize( "MENU_CHARLIE" ),
			value = CoD.BUTTONS_CHARLIE
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_BUTTON_LAYOUT" ),
			desc = Engine.Localize( "MENU_BUTTON_LAYOUT_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CreateOptionDataSource( controller, "ControllerOptions_ButtonLayout", options, profileVar ),
			currentSelection = GetProfileSelection( controller, options, profileVar )
		},
		properties = {
			hideArrows = true,
			action = function ( self, element, controller, actionParam, menu )
				NavigateToMenu( menu, "ButtonLayout", true, controller )
			end
		}
	}
	return listInfo
end

local CreateStickLayoutModels = function ( controller )
	local profileVar = "gpad_sticksConfig"
	local options = {
		{
			name = Engine.Localize( "MENU_DEFAULT" ),
			value = CoD.THUMBSTICK_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_SOUTHPAW" ),
			value = CoD.THUMBSTICK_SOUTHPAW
		},
		{
			name = Engine.Localize( "MENU_LEGACY" ),
			value = CoD.THUMBSTICK_LEGACY
		},
		{
			name = Engine.Localize( "MENU_LEGACY_SOUTHPAW" ),
			value = CoD.THUMBSTICK_LEGACYSOUTHPAW
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_STICK_LAYOUT" ),
			desc = Engine.Localize( "MENU_STICK_LAYOUT_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CreateOptionDataSource( controller, "ControllerOptions_StickLayout", options, profileVar ),
			currentSelection = GetProfileSelection( controller, options, profileVar )
		},
		properties = {
			hideArrows = true,
			action = function ( self, element, controller, actionParam, menu )
				NavigateToMenu( menu, "StickLayout", true, controller )
			end
		}
	}
	return listInfo
end

local PrepareControllerOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateLookInversionModels( controller ) )
	table.insert( optionsTable, CreateHorizontalLookSensitivityModels( controller ) )
	table.insert( optionsTable, CreateVerticalLookSensitivityModels( controller ) )
	table.insert( optionsTable, CreateControllerVibrationModels( controller ) )
	table.insert( optionsTable, CreateAimAssistModels( controller ) )
	table.insert( optionsTable, CreateButtonLayoutModels( controller ) )
	table.insert( optionsTable, CreateStickLayoutModels( controller ) )
	return optionsTable
end

DataSources.OptionControlsList = DataSourceHelpers.ListSetup( "OptionControlsList", PrepareControllerOptions, true )
LUI.createMenu.StartMenu_Options_Controls = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 774, 1020 )
	Desc:setTopBottom( true, false, 154, 174 )
	Desc:setRGB( 1, 1, 1 )
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
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 32, 702 )
	ButtonList:setTopBottom( true, false, 107.5, 618.5 )
	ButtonList:setRGB( 1, 1, 1 )
	ButtonList:setDataSource( "OptionControlsList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	StartMenulineGraphicsOptions0:setRGB( 1, 1, 1 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( true, false, 774, 920 )
	StartMenuOptionHighlight:setTopBottom( true, false, 107.5, 147.5 )
	StartMenuOptionHighlight:setRGB( 1, 1, 1 )
	StartMenuOptionHighlight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( self, controller )
	StartMenuOptionIconContainer:setLeftRight( true, false, 659, 766 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 109.5, 216.5 )
	StartMenuOptionIconContainer:setRGB( 1, 1, 1 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( true, false, 641, 657 )
	Image00000:setTopBottom( true, false, 107.5, 115.5 )
	Image00000:setRGB( 1, 1, 1 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 641, 657 )
	Image000000:setTopBottom( true, false, 209.5, 217.5 )
	Image000000:setRGB( 1, 1, 1 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 769, 805 )
	Pixel2:setTopBottom( true, false, 212.5, 216.5 )
	Pixel2:setRGB( 1, 1, 1 )
	Pixel2:setYRot( 180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
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
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.start = function ( menu, element, event )
		menu:addButtonPrompt( "start", Engine.Localize( "MENU_DISMISS_MENU" ), "M", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.start( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "start" or event.button == "key_shortcut" and event.key == "M") then
			CloseStartMenu( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ButtonList.id = "ButtonList"
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
	self.close = function ( self )
		self.cac3dTitleIntermediary0:close()
		self.ButtonList:close()
		self.StartMenulineGraphicsOptions0:close()
		self.StartMenuOptionHighlight:close()
		self.StartMenuOptionIconContainer:close()
		self.Desc:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

