require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( f2_arg0 )
		local f2_local0 = LUI.savedMenuStates[f2_arg0.id]
		if f2_local0 ~= nil and f2_local0.id then
			f2_local0.saveEvent.originalEvent = nil
			return f2_arg0:processEvent( {
				name = "restore_focus",
				id = f2_local0.id,
				data = f2_local0.data,
				saveEvent = f2_local0.saveEvent
			} )
		else
			
		end
	end
	
end

local f0_local1 = function ( f3_arg0 )
	local f3_local0 = "input_invertpitch"
	local f3_local1 = {
		{
			name = Engine.Localize( "MENU_NOT_INVERTED" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_INVERTED" ),
			value = 1
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_LOOK_INVERSION" ),
			desc = Engine.Localize( "MENU_LOOK_INVERSION_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f3_arg0, "ControllerOptions_LookInversion", f3_local1, f3_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f3_arg0, f3_local1, f3_local0 )
		},
		properties = {}
	}
end

local f0_local2 = function ( f4_arg0 )
	local f4_local0 = "input_viewSensitivityHorizontal"
	local f4_local1 = {
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
	return {
		models = {
			name = Engine.Localize( "MENU_LOOK_SENSITIVITY_HORIZONTAL" ),
			desc = Engine.Localize( "MENU_LOOK_SENSITIVITY_HORIZONTAL_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f4_arg0, "ControllerOptions_LookSensitivity_Horizontal", f4_local1, f4_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f4_arg0, f4_local1, f4_local0 )
		},
		properties = {}
	}
end

local f0_local3 = function ( f5_arg0 )
	local f5_local0 = "input_viewSensitivityVertical"
	local f5_local1 = {
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
	return {
		models = {
			name = Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL" ),
			desc = Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f5_arg0, "ControllerOptions_LookSensitivity_Vertical", f5_local1, f5_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f5_arg0, f5_local1, f5_local0 )
		},
		properties = {}
	}
end

local f0_local4 = function ( f6_arg0 )
	local f6_local0 = "gpad_rumble"
	local f6_local1 = {
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		},
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_CONTROLLER_VIBRATION" ),
			desc = Engine.Localize( "MENU_CONTROLLER_VIBRATION_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f6_arg0, "ControllerOptions_Vibration", f6_local1, f6_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f6_arg0, f6_local1, f6_local0 )
		},
		properties = {}
	}
end

local f0_local5 = function ( f7_arg0 )
	local f7_local0 = "input_targetassist"
	local f7_local1 = {
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		},
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_TARGET_ASSIST" ),
			desc = Engine.Localize( "MENU_TARGET_ASSIST_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f7_arg0, "ControllerOptions_AimAssist", f7_local1, f7_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f7_arg0, f7_local1, f7_local0 )
		},
		properties = {}
	}
end

local f0_local6 = function ( f8_arg0 )
	local f8_local0 = "gpad_buttonsConfig"
	local f8_local1 = {
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
		},
		{
			name = Engine.Localize( "MENU_BUMPERJUMPER" ),
			value = CoD.BUTTONS_BUMPERJUMPER
		},
		{
			name = Engine.Localize( "MENU_STICKMOVE" ),
			value = CoD.BUTTONS_STICKMOVE
		},
		{
			name = Engine.Localize( "MENU_GUNSLINGER" ),
			value = CoD.BUTTONS_GUNSLINGER
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_BUTTON_LAYOUT" ),
			desc = Engine.Localize( "MENU_BUTTON_LAYOUT_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f8_arg0, "ControllerOptions_ButtonLayout", f8_local1, f8_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f8_arg0, f8_local1, f8_local0 )
		},
		properties = {
			hideArrows = true,
			action = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
				NavigateToMenu( f9_arg4, "StartMenu_Options_Controls_ButtonLayout", true, f9_arg2 )
			end
			
		}
	}
end

local f0_local7 = function ( f10_arg0 )
	local f10_local0 = "gpad_sticksConfig"
	local f10_local1 = {
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
	return {
		models = {
			name = Engine.Localize( "MENU_STICK_LAYOUT" ),
			desc = Engine.Localize( "MENU_STICK_LAYOUT_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f10_arg0, "ControllerOptions_StickLayout", f10_local1, f10_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f10_arg0, f10_local1, f10_local0 )
		},
		properties = {
			hideArrows = true,
			action = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
				NavigateToMenu( f11_arg4, "StartMenu_Options_Controls_StickLayout", true, f11_arg2 )
			end
			
		}
	}
end

local f0_local8 = function ( f12_arg0 )
	return {
		models = {
			name = Engine.Localize( "MENU_RESET_TO_DEFAULT" ),
			desc = Engine.Localize( "MENU_RESET_TO_DEFAULT_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f12_arg0, "ControllerOptions_ResetToDefault", {
				{
					name = Engine.Localize( "MENU_RESET" ),
					value = CoD.THUMBSTICK_DEFAULT
				}
			} )
		},
		properties = {
			hideArrows = true,
			action = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
				ResetControlsToDefault( f13_arg0, f13_arg1, f13_arg2, f13_arg4 )
			end
			
		}
	}
end

DataSources.OptionControlsList = DataSourceHelpers.ListSetup( "OptionControlsList", function ( f14_arg0 )
	local f14_local0 = {}
	if Dvar.ui_execdemo_gamescom:get() then
		table.insert( f14_local0, f0_local8( f14_arg0 ) )
	end
	table.insert( f14_local0, f0_local1( f14_arg0 ) )
	table.insert( f14_local0, f0_local2( f14_arg0 ) )
	table.insert( f14_local0, f0_local3( f14_arg0 ) )
	table.insert( f14_local0, f0_local4( f14_arg0 ) )
	table.insert( f14_local0, f0_local5( f14_arg0 ) )
	table.insert( f14_local0, f0_local6( f14_arg0 ) )
	table.insert( f14_local0, f0_local7( f14_arg0 ) )
	return f14_local0
end, true )
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
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 773, 1130 )
	Desc:setTopBottom( true, false, 151, 173 )
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
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 32, 702 )
	ButtonList:setTopBottom( true, false, 107.5, 618.5 )
	ButtonList:setDataSource( "OptionControlsList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
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
	StartMenuOptionHighlight:setLeftRight( true, false, 773, 919 )
	StartMenuOptionHighlight:setTopBottom( true, false, 110.5, 150.5 )
	StartMenuOptionHighlight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	Desc:linkToElementModel( ButtonList, "desc", true, function ( model )
		local desc = Engine.GetModelValue( model )
		if desc then
			Desc:setText( Engine.Localize( desc ) )
		end
	end )
	StartMenuOptionHighlight:linkToElementModel( ButtonList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			StartMenuOptionHighlight.DescTitle:setText( Engine.Localize( name ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f22_local0 = nil
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "StartMenu_Options_Controls",
			clipName = "intro"
		}, controller )
		PlayClip( self, "intro", controller )
		if not f22_local0 then
			f22_local0 = self:dispatchEventToChildren( event )
		end
		return f22_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cac3dTitleIntermediary0:close()
		element.ButtonList:close()
		element.StartMenulineGraphicsOptions0:close()
		element.StartMenuOptionHighlight:close()
		element.StartMenuOptionIconContainer:close()
		element.MenuFrame:close()
		element.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

