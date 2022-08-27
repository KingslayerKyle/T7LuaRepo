-- a3ed9dc3ed937421d160a5ebbe8f74c5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

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
			name = Engine.Localize( "PLATFORM_CONTROLLER_VIBRATION" ),
			desc = Engine.Localize( "PLATFORM_CONTROLLER_VIBRATION_DESC" ),
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
	local f8_local0 = "input_autoaim"
	local f8_local1 = {
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
			name = Engine.Localize( "MENU_AIM_ASSIST" ),
			desc = Engine.Localize( "MENU_AIM_DOWN_THE_SIGHT_AUTOAIM" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f8_arg0, "ControllerOptions_AutoAim", f8_local1, f8_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f8_arg0, f8_local1, f8_local0 )
		},
		properties = {}
	}
end

local f0_local7 = function ( f9_arg0 )
	local f9_local0 = "gpad_buttonsConfig"
	local f9_local1 = {
		[CoD.BUTTONS_DEFAULT] = Engine.Localize( "MENU_DEFAULT" ),
		[CoD.BUTTONS_EXPERIMENTAL] = Engine.Localize( "MENU_TACTICAL" ),
		[CoD.BUTTONS_LEFTY] = Engine.Localize( "MENU_LEFTY" ),
		[CoD.BUTTONS_NOMAD] = Engine.Localize( "MENU_NOMAD" ),
		[CoD.BUTTONS_CHARLIE] = Engine.Localize( "MENU_CHARLIE" ),
		[CoD.BUTTONS_BUMPERJUMPER] = Engine.Localize( "MENU_BUMPERJUMPER" ),
		[CoD.BUTTONS_BUMPERTACTICAL] = Engine.Localize( "MENU_BUMPERTACTICAL" ),
		[CoD.BUTTONS_GUNSLINGER] = Engine.Localize( "MENU_GUNSLINGER" ),
		[CoD.BUTTONS_STICKMOVE] = Engine.Localize( "MENU_STICKMOVE" )
	}
	return {
		models = {
			name = Engine.Localize( "PLATFORM_BUTTON_LAYOUT" ),
			desc = Engine.Localize( "PLATFORM_BUTTON_LAYOUT_DESC" ),
			image = RegisterMaterial( "" ),
			altText = f9_local1[tonumber( Engine.ProfileValueAsString( f9_arg0, f9_local0 ) ) or 0]
		},
		properties = {
			action = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
				NavigateToMenu( f10_arg4, "StartMenu_Options_Controls_ButtonLayout", true, f10_arg2 )
			end
			
		}
	}
end

local f0_local8 = function ( f11_arg0 )
	local f11_local0 = "gpad_sticksConfig"
	local f11_local1 = {
		[CoD.THUMBSTICK_DEFAULT] = Engine.Localize( "MENU_DEFAULT" ),
		[CoD.THUMBSTICK_SOUTHPAW] = Engine.Localize( "MENU_SOUTHPAW" ),
		[CoD.THUMBSTICK_LEGACY] = Engine.Localize( "MENU_LEGACY" ),
		[CoD.THUMBSTICK_LEGACYSOUTHPAW] = Engine.Localize( "MENU_LEGACY_SOUTHPAW" )
	}
	return {
		models = {
			name = Engine.Localize( "PLATFORM_STICK_LAYOUT" ),
			desc = Engine.Localize( "PLATFORM_STICK_LAYOUT_DESC" ),
			image = RegisterMaterial( "" ),
			altText = f11_local1[tonumber( Engine.ProfileValueAsString( f11_arg0, f11_local0 ) ) or 0]
		},
		properties = {
			action = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
				NavigateToMenu( f12_arg4, "StartMenu_Options_Controls_StickLayout", true, f12_arg2 )
			end
			
		}
	}
end

local f0_local9 = function ( f13_arg0 )
	return {
		models = {
			name = Engine.Localize( "MENU_RESET_TO_DEFAULT" ),
			desc = Engine.Localize( "MENU_RESET_TO_DEFAULT_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f13_arg0, "ControllerOptions_ResetToDefault", {
				{
					name = Engine.Localize( "MENU_RESET" ),
					value = CoD.THUMBSTICK_DEFAULT
				}
			} )
		},
		properties = {
			hideArrows = true,
			action = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
				ResetControlsToDefault( f14_arg0, f14_arg1, f14_arg2, f14_arg4 )
			end
			
		}
	}
end

DataSources.OptionControlsList = DataSourceHelpers.ListSetup( "OptionControlsList", function ( f15_arg0 )
	local f15_local0 = {}
	if Dvar.ui_execdemo_gamescom:get() then
		table.insert( f15_local0, f0_local9( f15_arg0 ) )
	end
	table.insert( f15_local0, f0_local1( f15_arg0 ) )
	table.insert( f15_local0, f0_local2( f15_arg0 ) )
	table.insert( f15_local0, f0_local3( f15_arg0 ) )
	table.insert( f15_local0, f0_local4( f15_arg0 ) )
	table.insert( f15_local0, f0_local5( f15_arg0 ) )
	table.insert( f15_local0, f0_local6( f15_arg0 ) )
	if not Engine.IsDemoPlaying() then
		table.insert( f15_local0, f0_local7( f15_arg0 ) )
	end
	table.insert( f15_local0, f0_local8( f15_arg0 ) )
	return f15_local0
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls.buttonPrompts" )
	local f16_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( false, false, 133, 490 )
	Desc:setTopBottom( true, false, 181, 203 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -11, 13 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, -9, 5 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local ButtonList = LUI.UIList.new( f16_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, false, -608, 62 )
	ButtonList:setTopBottom( true, false, 137.5, 648.5 )
	ButtonList:setDataSource( "OptionControlsList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f16_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	f16_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		ProcessListAction( self, f19_arg0, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, true, -11, 13 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( f16_local1, controller )
	StartMenuOptionHighlight:setLeftRight( false, false, 133, 279 )
	StartMenuOptionHighlight:setTopBottom( true, false, 140.5, 180.5 )
	StartMenuOptionHighlight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( f16_local1, controller )
	StartMenuOptionIconContainer:setLeftRight( false, false, 19, 126 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 139.5, 246.5 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local MenuFrame = CoD.GenericMenuFrame.new( f16_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( f16_local1, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f23_local0 = nil
		ShowHeaderIconOnly( f16_local1 )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "StartMenu_Options_Controls",
			clipName = "intro"
		}, controller )
		PlayClip( self, "intro", controller )
		if not f23_local0 then
			f23_local0 = element:dispatchEventToChildren( event )
		end
		return f23_local0
	end )
	f16_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		GoBack( self, f24_arg2 )
		UpdateGamerprofile( self, f24_arg0, f24_arg2 )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f16_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		CloseStartMenu( f26_arg1, f26_arg2 )
		return true
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
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
		menu = f16_local1
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.StartMenuOptionHighlight:close()
		element.StartMenuOptionIconContainer:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics0:close()
		element.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

