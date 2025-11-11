require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )

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
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "ControllerOptions_LookInversion", options, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
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
			value = CoD.OptionsUtility.SENSITIVITY_1
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_LOW_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_2
		},
		{
			name = "3",
			value = CoD.OptionsUtility.SENSITIVITY_3
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_MEDIUM_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_4
		},
		{
			name = "5",
			value = CoD.OptionsUtility.SENSITIVITY_5
		},
		{
			name = "6",
			value = CoD.OptionsUtility.SENSITIVITY_6
		},
		{
			name = "7",
			value = CoD.OptionsUtility.SENSITIVITY_7
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_HIGH_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_8
		},
		{
			name = "9",
			value = CoD.OptionsUtility.SENSITIVITY_9
		},
		{
			name = "10",
			value = CoD.OptionsUtility.SENSITIVITY_10
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_VERY_HIGH_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_11
		},
		{
			name = "12",
			value = CoD.OptionsUtility.SENSITIVITY_12
		},
		{
			name = "13",
			value = CoD.OptionsUtility.SENSITIVITY_13
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_INSANE_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_14
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_LOOK_SENSITIVITY_HORIZONTAL" ),
			desc = Engine.Localize( "MENU_LOOK_SENSITIVITY_HORIZONTAL_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "ControllerOptions_LookSensitivity_Horizontal", options, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
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
			value = CoD.OptionsUtility.SENSITIVITY_1
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_LOW_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_2
		},
		{
			name = "3",
			value = CoD.OptionsUtility.SENSITIVITY_3
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_MEDIUM_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_4
		},
		{
			name = "5",
			value = CoD.OptionsUtility.SENSITIVITY_5
		},
		{
			name = "6",
			value = CoD.OptionsUtility.SENSITIVITY_6
		},
		{
			name = "7",
			value = CoD.OptionsUtility.SENSITIVITY_7
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_HIGH_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_8
		},
		{
			name = "9",
			value = CoD.OptionsUtility.SENSITIVITY_9
		},
		{
			name = "10",
			value = CoD.OptionsUtility.SENSITIVITY_10
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_VERY_HIGH_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_11
		},
		{
			name = "12",
			value = CoD.OptionsUtility.SENSITIVITY_12
		},
		{
			name = "13",
			value = CoD.OptionsUtility.SENSITIVITY_13
		},
		{
			name = Engine.Localize( "MENU_SENSITIVITY_INSANE_CAPS" ),
			value = CoD.OptionsUtility.SENSITIVITY_14
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL" ),
			desc = Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "ControllerOptions_LookSensitivity_Vertical", options, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
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
			name = Engine.Localize( "PLATFORM_CONTROLLER_VIBRATION" ),
			desc = Engine.Localize( "PLATFORM_CONTROLLER_VIBRATION_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "ControllerOptions_Vibration", options, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

local CreateAimAssistModels = function ( controller )
	local profileVar = "input_targetassist"
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
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "ControllerOptions_AimAssist", options, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

local CreateAutoAimModels = function ( controller )
	local profileVar = "input_autoaim"
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
			name = Engine.Localize( "MENU_AIM_ASSIST" ),
			desc = Engine.Localize( "MENU_AIM_DOWN_THE_SIGHT_AUTOAIM" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "ControllerOptions_AutoAim", options, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

local CreateButtonLayoutModels = function ( controller )
	local profileVar = "gpad_buttonsConfig"
	local options = {
		[Enum.GPadButtonConfigs.BUTTONS_DEFAULT] = Engine.Localize( "MENU_DEFAULT" ),
		[Enum.GPadButtonConfigs.BUTTONS_EXPERIMENTAL] = Engine.Localize( "MENU_TACTICAL" ),
		[Enum.GPadButtonConfigs.BUTTONS_LEFTY] = Engine.Localize( "MENU_LEFTY" ),
		[Enum.GPadButtonConfigs.BUTTONS_NOMAD] = Engine.Localize( "MENU_NOMAD" ),
		[Enum.GPadButtonConfigs.BUTTONS_CHARLIE] = Engine.Localize( "MENU_CHARLIE" ),
		[Enum.GPadButtonConfigs.BUTTONS_BUMPERJUMPER] = Engine.Localize( "MENU_BUMPERJUMPER" ),
		[Enum.GPadButtonConfigs.BUTTONS_BUMPERTACTICAL] = Engine.Localize( "MENU_BUMPERTACTICAL" ),
		[Enum.GPadButtonConfigs.BUTTONS_GUNSLINGER] = Engine.Localize( "MENU_GUNSLINGER" ),
		[Enum.GPadButtonConfigs.BUTTONS_STICKMOVE] = Engine.Localize( "MENU_STICKMOVE" )
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "PLATFORM_BUTTON_LAYOUT" ),
			desc = Engine.Localize( "PLATFORM_BUTTON_LAYOUT_DESC" ),
			image = RegisterMaterial( "" ),
			altText = options[tonumber( Engine.ProfileValueAsString( controller, profileVar ) ) or 0]
		},
		properties = {
			action = function ( self, element, controller, actionParam, menu )
				NavigateToMenu( menu, "StartMenu_Options_Controls_ButtonLayout", true, controller )
			end
		}
	}
	return listInfo
end

local CreateStickLayoutModels = function ( controller )
	local profileVar = "gpad_sticksConfig"
	local options = {
		[Enum.GPadStickConfigs.THUMBSTICK_DEFAULT] = Engine.Localize( "MENU_DEFAULT" ),
		[Enum.GPadStickConfigs.THUMBSTICK_SOUTHPAW] = Engine.Localize( "MENU_SOUTHPAW" ),
		[Enum.GPadStickConfigs.THUMBSTICK_LEGACY] = Engine.Localize( "MENU_LEGACY" ),
		[Enum.GPadStickConfigs.THUMBSTICK_LEGACYSOUTHPAW] = Engine.Localize( "MENU_LEGACY_SOUTHPAW" )
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "PLATFORM_STICK_LAYOUT" ),
			desc = Engine.Localize( "PLATFORM_STICK_LAYOUT_DESC" ),
			image = RegisterMaterial( "" ),
			altText = options[tonumber( Engine.ProfileValueAsString( controller, profileVar ) ) or 0]
		},
		properties = {
			action = function ( self, element, controller, actionParam, menu )
				NavigateToMenu( menu, "StartMenu_Options_Controls_StickLayout", true, controller )
			end
		}
	}
	return listInfo
end

local CreateResetToDefaultModels = function ( controller )
	local options = {
		{
			name = Engine.Localize( "MENU_RESET" ),
			value = Enum.GPadStickConfigs.THUMBSTICK_DEFAULT
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_RESET_TO_DEFAULT" ),
			desc = Engine.Localize( "MENU_RESET_TO_DEFAULT_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "ControllerOptions_ResetToDefault", options )
		},
		properties = {
			hideArrows = true,
			action = function ( self, element, controller, actionParam, menu )
				ResetControlsToDefault( self, element, controller, menu )
			end
		}
	}
	return listInfo
end

local PrepareControllerOptions = function ( controller )
	local optionsTable = {}
	if Dvar.ui_execdemo_gamescom:get() then
		table.insert( optionsTable, CreateResetToDefaultModels( controller ) )
	end
	table.insert( optionsTable, CreateLookInversionModels( controller ) )
	table.insert( optionsTable, CreateHorizontalLookSensitivityModels( controller ) )
	table.insert( optionsTable, CreateVerticalLookSensitivityModels( controller ) )
	table.insert( optionsTable, CreateControllerVibrationModels( controller ) )
	table.insert( optionsTable, CreateAimAssistModels( controller ) )
	table.insert( optionsTable, CreateAutoAimModels( controller ) )
	if not Engine.IsDemoPlaying() then
		table.insert( optionsTable, CreateButtonLayoutModels( controller ) )
	end
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( 0.5, 0.5, -1125, 1125 )
	FooterBacking:setTopBottom( 0.5, 0.5, 446, 540 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( 0.5, 0.5, 199, 735 )
	Desc:setTopBottom( 0, 0, 271, 304 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 1, -16, 20 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( 0, 1, -13, 7 )
	TitleBacking0:setTopBottom( 0.5, 0.5, -541, -412 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0.5, 0.5, -912, 93 )
	ButtonList:setTopBottom( 0, 0, 213, 967 )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:setDataSource( "OptionControlsList" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 1, -16, 20 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( 0.5, 0.5, 200, 419 )
	StartMenuOptionHighlight:setTopBottom( 0, 0, 211, 271 )
	StartMenuOptionHighlight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( self, controller )
	StartMenuOptionIconContainer:setLeftRight( 0.5, 0.5, 29, 189 )
	StartMenuOptionIconContainer:setTopBottom( 0, 0, 210, 370 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics0:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
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
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "StartMenu_Options_Controls",
			clipName = "intro"
		}, controller )
		PlayClip( self, "intro", controller )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		CloseStartMenu( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU", nil )
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
		self.ButtonList:close()
		self.StartMenuOptionHighlight:close()
		self.StartMenuOptionIconContainer:close()
		self.MenuFrame:close()
		self.FEMenuLeftGraphics0:close()
		self.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

