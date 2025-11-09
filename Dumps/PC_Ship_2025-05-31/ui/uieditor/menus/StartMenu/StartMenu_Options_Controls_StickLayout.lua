require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Controls_GenericControllerItem" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )

local f0_local0 = function ( f1_arg0 )
	return tonumber( Engine.ProfileValueAsString( f1_arg0, "input_invertpitch" ) ) == 1
end

local f0_local1 = {}
DataSources.StickLayoutLabels = {
	getModel = function ( f2_arg0 )
		DataSources.StickLayoutLabels.m_lastController = f2_arg0
		local f2_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg0 ), "StickLayoutLabels" )
		if f2_local0 == nil then
			f2_local0 = Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "StickLayoutLabels" )
			local f2_local1 = function ( f3_arg0 )
				Engine.CreateModel( f2_local0, f3_arg0 .. ".text" )
				Engine.CreateModel( f2_local0, f3_arg0 .. ".isDefault" )
			end
			
			Engine.CreateModel( f2_local0, "leftStickImg" )
			Engine.CreateModel( f2_local0, "rightStickImg" )
			f2_local1( "leftStickUp" )
			f2_local1( "leftStickDown" )
			f2_local1( "leftStickLeftRight" )
			f2_local1( "rightStickUp" )
			f2_local1( "rightStickDown" )
			f2_local1( "rightStickLeftRight" )
		end
		return f2_local0
	end,
	setStickModel = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
		Engine.SetModelValue( Engine.CreateModel( f4_arg1, f4_arg3 .. ".text" ), f4_arg2[f4_arg4] )
		Engine.SetModelValue( Engine.CreateModel( f4_arg1, f4_arg3 .. ".isDefault" ), f4_arg2[f4_arg4] == f4_arg0[f4_arg4] )
	end,
	setModels = function ( f5_arg0 )
		local f5_local0 = DataSources.StickLayoutLabels.m_lastController
		local f5_local1 = Engine.GetModel( Engine.GetModelForController( f5_local0 ), "StickLayoutLabels" )
		local f5_local2 = f0_local1[CoD.THUMBSTICK_DEFAULT + 1]( f0_local0( f5_local0 ) )
		if not f5_local1 or not f5_arg0 then
			return 
		else
			Engine.SetModelValue( Engine.GetModel( f5_local1, "leftStickImg" ), f5_arg0.STICK_L_IMG )
			Engine.SetModelValue( Engine.GetModel( f5_local1, "rightStickImg" ), f5_arg0.STICK_R_IMG )
			DataSources.StickLayoutLabels.setStickModel( f5_local2, f5_local1, f5_arg0, "leftStickUp", "STICK_L_UP" )
			DataSources.StickLayoutLabels.setStickModel( f5_local2, f5_local1, f5_arg0, "leftStickDown", "STICK_L_DOWN" )
			DataSources.StickLayoutLabels.setStickModel( f5_local2, f5_local1, f5_arg0, "leftStickLeftRight", "STICK_L_LR" )
			DataSources.StickLayoutLabels.setStickModel( f5_local2, f5_local1, f5_arg0, "rightStickUp", "STICK_R_UP" )
			DataSources.StickLayoutLabels.setStickModel( f5_local2, f5_local1, f5_arg0, "rightStickDown", "STICK_R_DOWN" )
			DataSources.StickLayoutLabels.setStickModel( f5_local2, f5_local1, f5_arg0, "rightStickLeftRight", "STICK_R_LR" )
		end
	end
}
local f0_local2 = function ( f6_arg0 )
	local f6_local0 = {
		STICK_L_IMG = "xenon_stick_move",
		STICK_L_UP = "MENU_MOVE_FORWARD",
		STICK_L_DOWN = "MENU_MOVE_BACK",
		STICK_L_LR = "MENU_STRAFE_LEFT_RIGHT",
		STICK_R_IMG = "xenon_stick_turn",
		STICK_R_UP = "MENU_LOOK_UP",
		STICK_R_DOWN = "MENU_LOOK_DOWN",
		STICK_R_LR = "MENU_ROTATE_LEFT_RIGHT"
	}
	if f6_arg0 then
		f6_local0.STICK_R_UP = "MENU_LOOK_DOWN"
		f6_local0.STICK_R_DOWN = "MENU_LOOK_UP"
	end
	return f6_local0
end

local f0_local3 = function ( f7_arg0 )
	local f7_local0 = {
		STICK_L_IMG = "xenon_stick_turn",
		STICK_L_UP = "MENU_LOOK_UP",
		STICK_L_DOWN = "MENU_LOOK_DOWN",
		STICK_L_LR = "MENU_ROTATE_LEFT_RIGHT",
		STICK_R_IMG = "xenon_stick_move",
		STICK_R_UP = "MENU_MOVE_FORWARD",
		STICK_R_DOWN = "MENU_MOVE_BACK",
		STICK_R_LR = "MENU_STRAFE_LEFT_RIGHT"
	}
	if f7_arg0 then
		f7_local0.STICK_L_UP = "MENU_LOOK_DOWN"
		f7_local0.STICK_L_DOWN = "MENU_LOOK_UP"
	end
	return f7_local0
end

local f0_local4 = function ( f8_arg0 )
	local f8_local0 = {
		STICK_L_IMG = "xenon_stick_move_turn",
		STICK_L_UP = "MENU_MOVE_FORWARD",
		STICK_L_DOWN = "MENU_MOVE_BACK",
		STICK_L_LR = "MENU_ROTATE_LEFT_RIGHT",
		STICK_R_IMG = "xenon_stick_move_look",
		STICK_R_UP = "MENU_LOOK_UP",
		STICK_R_DOWN = "MENU_LOOK_DOWN",
		STICK_R_LR = "MENU_STRAFE_LEFT_RIGHT"
	}
	if f8_arg0 then
		f8_local0.STICK_R_UP = "MENU_LOOK_DOWN"
		f8_local0.STICK_R_DOWN = "MENU_LOOK_UP"
	end
	return f8_local0
end

local f0_local5 = function ( f9_arg0 )
	local f9_local0 = {
		STICK_L_IMG = "xenon_stick_move_look",
		STICK_L_UP = "MENU_LOOK_UP",
		STICK_L_DOWN = "MENU_LOOK_DOWN",
		STICK_L_LR = "MENU_STRAFE_LEFT_RIGHT",
		STICK_R_IMG = "xenon_stick_move_turn",
		STICK_R_UP = "MENU_MOVE_FORWARD",
		STICK_R_DOWN = "MENU_MOVE_BACK",
		STICK_R_LR = "MENU_ROTATE_LEFT_RIGHT"
	}
	if f9_arg0 then
		f9_local0.STICK_L_UP = "MENU_LOOK_DOWN"
		f9_local0.STICK_L_DOWN = "MENU_LOOK_UP"
	end
	return f9_local0
end

f0_local1[CoD.THUMBSTICK_DEFAULT + 1] = f0_local2
f0_local1[CoD.THUMBSTICK_SOUTHPAW + 1] = f0_local3
f0_local1[CoD.THUMBSTICK_LEGACY + 1] = f0_local4
f0_local1[CoD.THUMBSTICK_LEGACYSOUTHPAW + 1] = f0_local5
local f0_local6 = function ( f10_arg0 )
	DataSources.StickLayoutLabels.setModels( f0_local1[f10_arg0 + 1]( f0_local0( DataSources.StickLayoutLabels.m_lastController ) ) )
end

local f0_local7 = function ( f11_arg0 )
	local f11_local0 = "gpad_sticksConfig"
	local f11_local1 = {
		{
			name = Engine.Localize( "MENU_DEFAULT_CAPS" ),
			value = CoD.THUMBSTICK_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_SOUTHPAW_CAPS" ),
			value = CoD.THUMBSTICK_SOUTHPAW
		},
		{
			name = Engine.Localize( "MENU_LEGACY_CAPS" ),
			value = CoD.THUMBSTICK_LEGACY
		},
		{
			name = Engine.Localize( "MENU_LEGACY_SOUTHPAW_CAPS" ),
			value = CoD.THUMBSTICK_LEGACYSOUTHPAW
		}
	}
	return {
		models = {
			name = "PLATFORM_STICK_LAYOUT_CAPS",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f11_arg0, "StickLayoutOptions_StickLayout", f11_local1, f11_local0, f0_local6, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f11_arg0, f11_local1, f11_local0 )
		},
		properties = {}
	}
end

DataSources.StickLayout = DataSourceHelpers.ListSetup( "StickLayout", function ( f12_arg0 )
	local f12_local0 = {}
	table.insert( f12_local0, f0_local7( f12_arg0 ) )
	return f12_local0
end, true )
if CoD.isPC then
	DataSources.StickLayoutDropdownPresets = DataSourceHelpers.ListSetup( "PC.StickLayoutDropdownPresets", function ( f13_arg0 )
		local f13_local0 = {}
		table.insert( f13_local0, {
			models = {
				value = CoD.THUMBSTICK_DEFAULT,
				valueDisplay = "MENU_DEFAULT_CAPS"
			}
		} )
		table.insert( f13_local0, {
			models = {
				value = CoD.THUMBSTICK_SOUTHPAW,
				valueDisplay = "MENU_SOUTHPAW_CAPS"
			}
		} )
		table.insert( f13_local0, {
			models = {
				value = CoD.THUMBSTICK_LEGACY,
				valueDisplay = "MENU_LEGACY_CAPS"
			}
		} )
		table.insert( f13_local0, {
			models = {
				value = CoD.THUMBSTICK_LEGACYSOUTHPAW,
				valueDisplay = "MENU_LEGACY_SOUTHPAW_CAPS"
			}
		} )
		return f13_local0
	end, true )
	DataSources.StickLayoutDropdown = DataSourceHelpers.ListSetup( "StickLayoutDropdown", function ( f14_arg0 )
		local f14_local0 = {}
		table.insert( f14_local0, {
			models = {
				label = "PLATFORM_STICK_LAYOUT",
				profileVarName = "gpad_sticksConfig",
				profileType = "user",
				datasource = "StickLayoutDropdownPresets",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
		return f14_local0
	end, true )
	DataSources.StickLayoutDropdown.getWidgetTypeForItem = function ( f15_arg0, f15_arg1, f15_arg2 )
		if f15_arg1 and Engine.GetModelValue( Engine.GetModel( f15_arg1, "widgetType" ) ) == "dropdown" then
			return CoD.OptionDropdown
		else
			return nil
		end
	end
	
end
local f0_local8 = function ( f16_arg0, f16_arg1, f16_arg2 )
	f16_arg0:dispatchEventToChildren( {
		name = "options_refresh",
		controller = f16_arg1
	} )
	f16_arg0:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f17_local0 = 1, element.stickLayoutDropdownList.requestedRowCount, 1 do
			local f17_local3 = element.stickLayoutDropdownList:getItemAtPosition( f17_local0, 1 )
			if event.inUse then
				if f17_local3 ~= event.widget then
					f17_local3.m_inputDisabled = true
				end
			end
			f17_local3.m_inputDisabled = nil
		end
	end )
	f16_arg0.stickLayoutDropdownList.m_managedItemPriority = true
	f16_arg0.stickLayoutDropdownList:registerEventHandler( "dropdown_triggered", function ( element, event )
		if not event.inUse then
			f0_local6( event.widget.dropDownCurrentValue( f16_arg1, element ) )
		end
		element:dispatchEventToParent( event )
	end )
	f16_arg0:registerEventHandler( "input_source_changed", function ( element, event )
		f16_arg0:updateState( event )
		f16_arg0.stickLayoutButtonList:updateDataSource()
		f16_arg0.stickLayoutDropdownList:updateDataSource()
		if Engine.LastInput_Gamepad() then
			f16_arg0.stickLayoutButtonList:processEvent( {
				name = "gain_focus",
				controller = f16_arg1
			} )
			f16_arg0.stickLayoutDropdownList:processEvent( {
				name = "lose_focus",
				controller = f16_arg1
			} )
		else
			f16_arg0.stickLayoutButtonList:processEvent( {
				name = "lose_focus",
				controller = f16_arg1
			} )
			f16_arg0.stickLayoutDropdownList:processEvent( {
				name = "gain_focus",
				controller = f16_arg1
			} )
		end
		f16_arg0:dispatchEventToChildren( {
			name = "options_refresh",
			controller = f16_arg1
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( f16_arg0, "close", function ()
		CoD.PCUtil.RefreshAllOptions( f16_arg0, f16_arg1 )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local6( tonumber( Engine.ProfileValueAsString( controller, "gpad_sticksConfig" ) ) )
	self.stickLayoutButtonList.navigation = nil
	self.stickLayoutDropdownList.navigation = nil
	if CoD.isPC then
		f0_local8( self, controller, menu )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ()
		Engine.UnsubscribeAndFreeModel( DataSources.StickLayoutLabels.getModel( controller ) )
	end )
end

LUI.createMenu.StartMenu_Options_Controls_StickLayout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls_StickLayout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_StickLayout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local stickLayoutButtonList = LUI.UIList.new( self, controller, 1, 0, nil, false, false, 0, 0, false, true )
	stickLayoutButtonList:makeFocusable()
	stickLayoutButtonList:setLeftRight( true, false, 219, 889 )
	stickLayoutButtonList:setTopBottom( true, false, 102.5, 157.5 )
	stickLayoutButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	stickLayoutButtonList:setSpacing( 1 )
	stickLayoutButtonList:setDataSource( "StickLayout" )
	self:addElement( stickLayoutButtonList )
	self.stickLayoutButtonList = stickLayoutButtonList
	
	local durangoControllerImage = LUI.UIImage.new()
	durangoControllerImage:setLeftRight( true, false, 415, 865 )
	durangoControllerImage:setTopBottom( true, false, 224, 674 )
	durangoControllerImage:setAlpha( 0 )
	durangoControllerImage:setImage( RegisterImage( "uie_xenonone_controller_top" ) )
	self:addElement( durangoControllerImage )
	self.durangoControllerImage = durangoControllerImage
	
	local orbisControllerImage = LUI.UIImage.new()
	orbisControllerImage:setLeftRight( true, false, 377, 889 )
	orbisControllerImage:setTopBottom( true, false, 183.5, 695.5 )
	orbisControllerImage:setImage( RegisterImage( "uie_ps4_controller_top" ) )
	self:addElement( orbisControllerImage )
	self.orbisControllerImage = orbisControllerImage
	
	local vitaControllerImage = LUI.UIImage.new()
	vitaControllerImage:setLeftRight( true, false, 64, 1216 )
	vitaControllerImage:setTopBottom( true, false, 174.5, 689.22 )
	vitaControllerImage:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_psvita_single" ) )
	self:addElement( vitaControllerImage )
	self.vitaControllerImage = vitaControllerImage
	
	local leftStickOverlay = LUI.UIImage.new()
	leftStickOverlay:setLeftRight( true, false, 432, 532 )
	leftStickOverlay:setTopBottom( true, false, 378, 478 )
	leftStickOverlay:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickImg", function ( model )
		local leftStickImg = Engine.GetModelValue( model )
		if leftStickImg then
			leftStickOverlay:setImage( RegisterImage( leftStickImg ) )
		end
	end )
	self:addElement( leftStickOverlay )
	self.leftStickOverlay = leftStickOverlay
	
	local rightStickOverlay = LUI.UIImage.new()
	rightStickOverlay:setLeftRight( true, false, 654, 754 )
	rightStickOverlay:setTopBottom( true, false, 462, 562 )
	rightStickOverlay:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickImg", function ( model )
		local rightStickImg = Engine.GetModelValue( model )
		if rightStickImg then
			rightStickOverlay:setImage( RegisterImage( rightStickImg ) )
		end
	end )
	self:addElement( rightStickOverlay )
	self.rightStickOverlay = rightStickOverlay
	
	local leftStickUpText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftStickUpText:setLeftRight( true, false, 382, 582 )
	leftStickUpText:setTopBottom( true, false, 360, 378 )
	leftStickUpText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	leftStickUpText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickUp", function ( model )
		leftStickUpText:setModel( model, controller )
	end )
	self:addElement( leftStickUpText )
	self.leftStickUpText = leftStickUpText
	
	local leftStickDownText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftStickDownText:setLeftRight( true, false, 382, 582 )
	leftStickDownText:setTopBottom( true, false, 478, 496 )
	leftStickDownText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	leftStickDownText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickDown", function ( model )
		leftStickDownText:setModel( model, controller )
	end )
	self:addElement( leftStickDownText )
	self.leftStickDownText = leftStickDownText
	
	local leftStickLeftRightText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftStickLeftRightText:setLeftRight( true, false, 226, 426 )
	leftStickLeftRightText:setTopBottom( true, false, 419, 437 )
	leftStickLeftRightText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftStickLeftRightText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickLeftRight", function ( model )
		leftStickLeftRightText:setModel( model, controller )
	end )
	self:addElement( leftStickLeftRightText )
	self.leftStickLeftRightText = leftStickLeftRightText
	
	local rightStickUpText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightStickUpText:setLeftRight( true, false, 604, 804 )
	rightStickUpText:setTopBottom( true, false, 444, 462 )
	rightStickUpText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickUpText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickUp", function ( model )
		rightStickUpText:setModel( model, controller )
	end )
	self:addElement( rightStickUpText )
	self.rightStickUpText = rightStickUpText
	
	local rightStickDownText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightStickDownText:setLeftRight( true, false, 604, 804 )
	rightStickDownText:setTopBottom( true, false, 562, 580 )
	rightStickDownText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickDownText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickDown", function ( model )
		rightStickDownText:setModel( model, controller )
	end )
	self:addElement( rightStickDownText )
	self.rightStickDownText = rightStickDownText
	
	local rightStickLeftRightText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightStickLeftRightText:setLeftRight( true, false, 754, 954 )
	rightStickLeftRightText:setTopBottom( true, false, 503, 521 )
	rightStickLeftRightText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightStickLeftRightText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickLeftRight", function ( model )
		rightStickLeftRightText:setModel( model, controller )
	end )
	self:addElement( rightStickLeftRightText )
	self.rightStickLeftRightText = rightStickLeftRightText
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "PLATFORM_STICK_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "PLATFORM_STICK_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local stickLayoutDropdownList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	stickLayoutDropdownList:makeFocusable()
	stickLayoutDropdownList:setLeftRight( true, false, 261, 761 )
	stickLayoutDropdownList:setTopBottom( true, false, 157.5, 191.5 )
	stickLayoutDropdownList:setAlpha( 0 )
	stickLayoutDropdownList:setWidgetType( CoD.OptionDropdown )
	stickLayoutDropdownList:setSpacing( 0 )
	stickLayoutDropdownList:setDataSource( "StickLayoutDropdown" )
	self:addElement( stickLayoutDropdownList )
	self.stickLayoutDropdownList = stickLayoutDropdownList
	
	stickLayoutButtonList.navigation = {
		down = stickLayoutDropdownList
	}
	stickLayoutDropdownList.navigation = {
		up = stickLayoutButtonList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				stickLayoutButtonList:completeAnimation()
				self.stickLayoutButtonList:setAlpha( 1 )
				self.clipFinished( stickLayoutButtonList, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( true, false, 415, 865 )
				self.durangoControllerImage:setTopBottom( true, false, 224, 674 )
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 1 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( true, false, 504, 604 )
				self.leftStickOverlay:setTopBottom( true, false, 463, 563 )
				self.clipFinished( leftStickOverlay, {} )
				rightStickOverlay:completeAnimation()
				self.rightStickOverlay:setLeftRight( true, false, 654, 754 )
				self.rightStickOverlay:setTopBottom( true, false, 462, 562 )
				self.clipFinished( rightStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( true, false, 454, 654 )
				self.leftStickUpText:setTopBottom( true, false, 445, 463 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( true, false, 454, 654 )
				self.leftStickDownText:setTopBottom( true, false, 563, 581 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( true, false, 298, 498 )
				self.leftStickLeftRightText:setTopBottom( true, false, 504, 522 )
				self.clipFinished( leftStickLeftRightText, {} )
				rightStickUpText:completeAnimation()
				self.rightStickUpText:setLeftRight( true, false, 604, 804 )
				self.rightStickUpText:setTopBottom( true, false, 444, 462 )
				self.clipFinished( rightStickUpText, {} )
				rightStickDownText:completeAnimation()
				self.rightStickDownText:setLeftRight( true, false, 604, 804 )
				self.rightStickDownText:setTopBottom( true, false, 562, 580 )
				self.clipFinished( rightStickDownText, {} )
				rightStickLeftRightText:completeAnimation()
				self.rightStickLeftRightText:setLeftRight( true, false, 754, 954 )
				self.rightStickLeftRightText:setTopBottom( true, false, 503, 521 )
				self.clipFinished( rightStickLeftRightText, {} )
				stickLayoutDropdownList:completeAnimation()
				self.stickLayoutDropdownList:setAlpha( 0 )
				self.clipFinished( stickLayoutDropdownList, {} )
			end
		},
		Orbis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				stickLayoutButtonList:completeAnimation()
				self.stickLayoutButtonList:setAlpha( 1 )
				self.clipFinished( stickLayoutButtonList, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( true, false, 415, 865 )
				self.durangoControllerImage:setTopBottom( true, false, 224, 674 )
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( true, false, 504, 604 )
				self.leftStickOverlay:setTopBottom( true, false, 463, 563 )
				self.clipFinished( leftStickOverlay, {} )
				rightStickOverlay:completeAnimation()
				self.rightStickOverlay:setLeftRight( true, false, 654, 754 )
				self.rightStickOverlay:setTopBottom( true, false, 462, 562 )
				self.clipFinished( rightStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( true, false, 454, 654 )
				self.leftStickUpText:setTopBottom( true, false, 445, 463 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( true, false, 454, 654 )
				self.leftStickDownText:setTopBottom( true, false, 563, 581 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( true, false, 298, 498 )
				self.leftStickLeftRightText:setTopBottom( true, false, 504, 522 )
				self.clipFinished( leftStickLeftRightText, {} )
				rightStickUpText:completeAnimation()
				self.rightStickUpText:setLeftRight( true, false, 604, 804 )
				self.rightStickUpText:setTopBottom( true, false, 444, 462 )
				self.clipFinished( rightStickUpText, {} )
				rightStickDownText:completeAnimation()
				self.rightStickDownText:setLeftRight( true, false, 604, 804 )
				self.rightStickDownText:setTopBottom( true, false, 562, 580 )
				self.clipFinished( rightStickDownText, {} )
				rightStickLeftRightText:completeAnimation()
				self.rightStickLeftRightText:setLeftRight( true, false, 754, 954 )
				self.rightStickLeftRightText:setTopBottom( true, false, 503, 521 )
				self.clipFinished( rightStickLeftRightText, {} )
				stickLayoutDropdownList:completeAnimation()
				self.stickLayoutDropdownList:setAlpha( 0 )
				self.clipFinished( stickLayoutDropdownList, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				stickLayoutButtonList:completeAnimation()
				self.stickLayoutButtonList:setAlpha( 1 )
				self.clipFinished( stickLayoutButtonList, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( true, false, 363.5, 895.5 )
				self.durangoControllerImage:setTopBottom( true, false, 170.5, 702.5 )
				self.durangoControllerImage:setAlpha( 1 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( true, false, 434, 534 )
				self.leftStickOverlay:setTopBottom( true, false, 388.5, 488.5 )
				self.clipFinished( leftStickOverlay, {} )
				rightStickOverlay:completeAnimation()
				self.rightStickOverlay:setLeftRight( true, false, 654, 754 )
				self.rightStickOverlay:setTopBottom( true, false, 462, 562 )
				self.clipFinished( rightStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( true, false, 384, 584 )
				self.leftStickUpText:setTopBottom( true, false, 370.5, 388.5 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( true, false, 384, 584 )
				self.leftStickDownText:setTopBottom( true, false, 488.5, 506.5 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( true, false, 228, 428 )
				self.leftStickLeftRightText:setTopBottom( true, false, 429.5, 447.5 )
				self.clipFinished( leftStickLeftRightText, {} )
				rightStickUpText:completeAnimation()
				self.rightStickUpText:setLeftRight( true, false, 604, 804 )
				self.rightStickUpText:setTopBottom( true, false, 444, 462 )
				self.clipFinished( rightStickUpText, {} )
				rightStickDownText:completeAnimation()
				self.rightStickDownText:setLeftRight( true, false, 604, 804 )
				self.rightStickDownText:setTopBottom( true, false, 562, 580 )
				self.clipFinished( rightStickDownText, {} )
				rightStickLeftRightText:completeAnimation()
				self.rightStickLeftRightText:setLeftRight( true, false, 754, 954 )
				self.rightStickLeftRightText:setTopBottom( true, false, 503, 521 )
				self.clipFinished( rightStickLeftRightText, {} )
				stickLayoutDropdownList:completeAnimation()
				self.stickLayoutDropdownList:setAlpha( 0 )
				self.clipFinished( stickLayoutDropdownList, {} )
			end
		},
		Vita = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				stickLayoutButtonList:completeAnimation()
				self.stickLayoutButtonList:setAlpha( 1 )
				self.clipFinished( stickLayoutButtonList, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( true, false, 415, 865 )
				self.durangoControllerImage:setTopBottom( true, false, 224, 674 )
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 1 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( true, false, 360.5, 435.5 )
				self.leftStickOverlay:setTopBottom( true, false, 435, 510 )
				self.clipFinished( leftStickOverlay, {} )
				rightStickOverlay:completeAnimation()
				self.rightStickOverlay:setLeftRight( true, false, 843, 917 )
				self.rightStickOverlay:setTopBottom( true, false, 436.5, 510.5 )
				self.clipFinished( rightStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( true, false, 367, 567 )
				self.leftStickUpText:setTopBottom( true, false, 427, 445 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( true, false, 377, 577 )
				self.leftStickDownText:setTopBottom( true, false, 510, 528 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( true, false, 155, 355 )
				self.leftStickLeftRightText:setTopBottom( true, false, 463.5, 481.5 )
				self.clipFinished( leftStickLeftRightText, {} )
				rightStickUpText:completeAnimation()
				self.rightStickUpText:setLeftRight( true, false, 717, 917 )
				self.rightStickUpText:setTopBottom( true, false, 426, 444 )
				self.clipFinished( rightStickUpText, {} )
				rightStickDownText:completeAnimation()
				self.rightStickDownText:setLeftRight( true, false, 707, 907 )
				self.rightStickDownText:setTopBottom( true, false, 513.5, 531.5 )
				self.clipFinished( rightStickDownText, {} )
				rightStickLeftRightText:completeAnimation()
				self.rightStickLeftRightText:setLeftRight( true, false, 917, 1117 )
				self.rightStickLeftRightText:setTopBottom( true, false, 463.5, 481.5 )
				self.clipFinished( rightStickLeftRightText, {} )
				stickLayoutDropdownList:completeAnimation()
				self.stickLayoutDropdownList:setAlpha( 0 )
				self.clipFinished( stickLayoutDropdownList, {} )
			end
		},
		PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				stickLayoutButtonList:completeAnimation()
				self.stickLayoutButtonList:setAlpha( 0 )
				self.clipFinished( stickLayoutButtonList, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( true, false, 415, 865 )
				self.durangoControllerImage:setTopBottom( true, false, 224, 674 )
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( true, false, 504, 604 )
				self.leftStickOverlay:setTopBottom( true, false, 463, 563 )
				self.clipFinished( leftStickOverlay, {} )
				rightStickOverlay:completeAnimation()
				self.rightStickOverlay:setLeftRight( true, false, 654, 754 )
				self.rightStickOverlay:setTopBottom( true, false, 462, 562 )
				self.clipFinished( rightStickOverlay, {} )
				leftStickUpText:completeAnimation()
				self.leftStickUpText:setLeftRight( true, false, 454, 654 )
				self.leftStickUpText:setTopBottom( true, false, 445, 463 )
				self.clipFinished( leftStickUpText, {} )
				leftStickDownText:completeAnimation()
				self.leftStickDownText:setLeftRight( true, false, 454, 654 )
				self.leftStickDownText:setTopBottom( true, false, 563, 581 )
				self.clipFinished( leftStickDownText, {} )
				leftStickLeftRightText:completeAnimation()
				self.leftStickLeftRightText:setLeftRight( true, false, 298, 498 )
				self.leftStickLeftRightText:setTopBottom( true, false, 504, 522 )
				self.clipFinished( leftStickLeftRightText, {} )
				rightStickUpText:completeAnimation()
				self.rightStickUpText:setLeftRight( true, false, 604, 804 )
				self.rightStickUpText:setTopBottom( true, false, 444, 462 )
				self.clipFinished( rightStickUpText, {} )
				rightStickDownText:completeAnimation()
				self.rightStickDownText:setLeftRight( true, false, 604, 804 )
				self.rightStickDownText:setTopBottom( true, false, 562, 580 )
				self.clipFinished( rightStickDownText, {} )
				rightStickLeftRightText:completeAnimation()
				self.rightStickLeftRightText:setLeftRight( true, false, 754, 954 )
				self.rightStickLeftRightText:setTopBottom( true, false, 503, 521 )
				self.clipFinished( rightStickLeftRightText, {} )
				stickLayoutDropdownList:completeAnimation()
				self.stickLayoutDropdownList:setAlpha( 1 )
				self.clipFinished( stickLayoutDropdownList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Orbis",
			condition = function ( menu, element, event )
				return IsOrbisGamepad( controller )
			end
		},
		{
			stateName = "Durango",
			condition = function ( menu, element, event )
				return IsDurangoGamepad( controller )
			end
		},
		{
			stateName = "Vita",
			condition = function ( menu, element, event )
				return IsVitaGamepad( controller )
			end
		},
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f23_local17 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f23_local17( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ForceNotifyControllerModel( controller, "forceUpdateVehicleBindings" )
		UpdateGamerprofile( self, element, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsMenuInState( self, "PC" ) then
			SetFocusToElement( self, "buttonLayoutDropdownList", controller )
		end
	end )
	stickLayoutButtonList.id = "stickLayoutButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
	stickLayoutDropdownList.id = "stickLayoutDropdownList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.stickLayoutButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.stickLayoutButtonList:close()
		element.leftStickUpText:close()
		element.leftStickDownText:close()
		element.leftStickLeftRightText:close()
		element.rightStickUpText:close()
		element.rightStickDownText:close()
		element.rightStickLeftRightText:close()
		element.MenuFrame:close()
		element.stickLayoutDropdownList:close()
		element.leftStickOverlay:close()
		element.rightStickOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_StickLayout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

