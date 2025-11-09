require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )

DataSources.StickLayoutLabels = {
	getModel = function ( f1_arg0 )
		DataSources.StickLayoutLabels.m_lastController = f1_arg0
		local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "StickLayoutLabels" )
		if f1_local0 == nil then
			f1_local0 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "StickLayoutLabels" )
			Engine.CreateModel( f1_local0, "leftStickImg" )
			Engine.CreateModel( f1_local0, "leftStickUpText" )
			Engine.CreateModel( f1_local0, "leftStickDownText" )
			Engine.CreateModel( f1_local0, "leftStickLeftRightText" )
			Engine.CreateModel( f1_local0, "rightStickImg" )
			Engine.CreateModel( f1_local0, "rightStickUpText" )
			Engine.CreateModel( f1_local0, "rightStickDownText" )
			Engine.CreateModel( f1_local0, "rightStickLeftRightText" )
		end
		return f1_local0
	end,
	setModels = function ( f2_arg0 )
		local f2_local0 = Engine.GetModel( Engine.GetModelForController( DataSources.StickLayoutLabels.m_lastController ), "StickLayoutLabels" )
		if not f2_local0 or not f2_arg0 then
			return 
		else
			Engine.SetModelValue( Engine.GetModel( f2_local0, "leftStickImg" ), f2_arg0.STICK_L_IMG )
			Engine.SetModelValue( Engine.GetModel( f2_local0, "leftStickUpText" ), f2_arg0.STICK_L_UP )
			Engine.SetModelValue( Engine.GetModel( f2_local0, "leftStickDownText" ), f2_arg0.STICK_L_DOWN )
			Engine.SetModelValue( Engine.GetModel( f2_local0, "leftStickLeftRightText" ), f2_arg0.STICK_L_LR )
			Engine.SetModelValue( Engine.GetModel( f2_local0, "rightStickImg" ), f2_arg0.STICK_R_IMG )
			Engine.SetModelValue( Engine.GetModel( f2_local0, "rightStickUpText" ), f2_arg0.STICK_R_UP )
			Engine.SetModelValue( Engine.GetModel( f2_local0, "rightStickDownText" ), f2_arg0.STICK_R_DOWN )
			Engine.SetModelValue( Engine.GetModel( f2_local0, "rightStickLeftRightText" ), f2_arg0.STICK_R_LR )
		end
	end
}
local f0_local0 = {
	[CoD.THUMBSTICK_DEFAULT + 1] = function ( f3_arg0 )
		local f3_local0 = {
			STICK_L_IMG = "xenon_stick_move",
			STICK_L_UP = "MENU_MOVE_FORWARD",
			STICK_L_DOWN = "MENU_MOVE_BACK",
			STICK_L_LR = "MENU_STRAFE_LEFT_RIGHT",
			STICK_R_IMG = "xenon_stick_turn",
			STICK_R_UP = "MENU_LOOK_UP",
			STICK_R_DOWN = "MENU_LOOK_DOWN",
			STICK_R_LR = "MENU_ROTATE_LEFT_RIGHT"
		}
		if f3_arg0 then
			f3_local0.STICK_R_UP = "MENU_LOOK_DOWN"
			f3_local0.STICK_R_DOWN = "MENU_LOOK_UP"
		end
		return f3_local0
	end,
	[CoD.THUMBSTICK_SOUTHPAW + 1] = function ( f4_arg0 )
		local f4_local0 = {
			STICK_L_IMG = "xenon_stick_turn",
			STICK_L_UP = "MENU_LOOK_UP",
			STICK_L_DOWN = "MENU_LOOK_DOWN",
			STICK_L_LR = "MENU_ROTATE_LEFT_RIGHT",
			STICK_R_IMG = "xenon_stick_move",
			STICK_R_UP = "MENU_MOVE_FORWARD",
			STICK_R_DOWN = "MENU_MOVE_BACK",
			STICK_R_LR = "MENU_STRAFE_LEFT_RIGHT"
		}
		if f4_arg0 then
			f4_local0.STICK_L_UP = "MENU_LOOK_DOWN"
			f4_local0.STICK_L_DOWN = "MENU_LOOK_UP"
		end
		return f4_local0
	end,
	[CoD.THUMBSTICK_LEGACY + 1] = function ( f5_arg0 )
		local f5_local0 = {
			STICK_L_IMG = "xenon_stick_move_turn",
			STICK_L_UP = "MENU_MOVE_FORWARD",
			STICK_L_DOWN = "MENU_MOVE_BACK",
			STICK_L_LR = "MENU_ROTATE_LEFT_RIGHT",
			STICK_R_IMG = "xenon_stick_move_look",
			STICK_R_UP = "MENU_LOOK_UP",
			STICK_R_DOWN = "MENU_LOOK_DOWN",
			STICK_R_LR = "MENU_STRAFE_LEFT_RIGHT"
		}
		if f5_arg0 then
			f5_local0.STICK_R_UP = "MENU_LOOK_DOWN"
			f5_local0.STICK_R_DOWN = "MENU_LOOK_UP"
		end
		return f5_local0
	end,
	[CoD.THUMBSTICK_LEGACYSOUTHPAW + 1] = function ( f6_arg0 )
		local f6_local0 = {
			STICK_L_IMG = "xenon_stick_move_look",
			STICK_L_UP = "MENU_LOOK_UP",
			STICK_L_DOWN = "MENU_LOOK_DOWN",
			STICK_L_LR = "MENU_STRAFE_LEFT_RIGHT",
			STICK_R_IMG = "xenon_stick_move_turn",
			STICK_R_UP = "MENU_MOVE_FORWARD",
			STICK_R_DOWN = "MENU_MOVE_BACK",
			STICK_R_LR = "MENU_ROTATE_LEFT_RIGHT"
		}
		if f6_arg0 then
			f6_local0.STICK_L_UP = "MENU_LOOK_DOWN"
			f6_local0.STICK_L_DOWN = "MENU_LOOK_UP"
		end
		return f6_local0
	end
}
local f0_local1 = function ( f7_arg0 )
	DataSources.StickLayoutLabels.setModels( f0_local0[f7_arg0 + 1]( tonumber( Engine.ProfileValueAsString( DataSources.StickLayoutLabels.m_lastController, "input_invertpitch" ) ) == 1 ) )
end

local f0_local2 = function ( f8_arg0 )
	local f8_local0 = "gpad_sticksConfig"
	local f8_local1 = {
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
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f8_arg0, "StickLayoutOptions_StickLayout", f8_local1, f8_local0, f0_local1, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f8_arg0, f8_local1, f8_local0 )
		},
		properties = {}
	}
end

DataSources.StickLayout = DataSourceHelpers.ListSetup( "StickLayout", function ( f9_arg0 )
	local f9_local0 = {}
	table.insert( f9_local0, f0_local2( f9_arg0 ) )
	return f9_local0
end, true )
if CoD.isPC then
	DataSources.StickLayoutDropdownPresets = DataSourceHelpers.ListSetup( "PC.StickLayoutDropdownPresets", function ( f10_arg0 )
		local f10_local0 = {}
		table.insert( f10_local0, {
			models = {
				value = CoD.THUMBSTICK_DEFAULT,
				valueDisplay = "MENU_DEFAULT_CAPS"
			}
		} )
		table.insert( f10_local0, {
			models = {
				value = CoD.THUMBSTICK_SOUTHPAW,
				valueDisplay = "MENU_SOUTHPAW_CAPS"
			}
		} )
		table.insert( f10_local0, {
			models = {
				value = CoD.THUMBSTICK_LEGACY,
				valueDisplay = "MENU_LEGACY_CAPS"
			}
		} )
		table.insert( f10_local0, {
			models = {
				value = CoD.THUMBSTICK_LEGACYSOUTHPAW,
				valueDisplay = "MENU_LEGACY_SOUTHPAW_CAPS"
			}
		} )
		return f10_local0
	end, true )
	DataSources.StickLayoutDropdown = DataSourceHelpers.ListSetup( "StickLayoutDropdown", function ( f11_arg0 )
		local f11_local0 = {}
		table.insert( f11_local0, {
			models = {
				label = "PLATFORM_STICK_LAYOUT_CAPS",
				profileVarName = "gpad_sticksConfig",
				profileType = "user",
				datasource = "StickLayoutDropdownPresets",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
		return f11_local0
	end, true )
	DataSources.StickLayoutDropdown.getWidgetTypeForItem = function ( f12_arg0, f12_arg1, f12_arg2 )
		if f12_arg1 and Engine.GetModelValue( Engine.GetModel( f12_arg1, "widgetType" ) ) == "dropdown" then
			return CoD.OptionDropdown
		else
			return nil
		end
	end
	
end
local PostLoadFunc = function ( self, controller, menu )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
	} )
	f0_local1( tonumber( Engine.ProfileValueAsString( controller, "gpad_sticksConfig" ) ) )
	self:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f14_local0 = 1, element.stickLayoutDropdownList.requestedRowCount, 1 do
			local f14_local3 = element.stickLayoutDropdownList:getItemAtPosition( f14_local0, 1 )
			if event.inUse then
				if f14_local3 ~= event.widget then
					f14_local3.m_inputDisabled = true
				end
			end
			f14_local3.m_inputDisabled = false
		end
	end )
	self.stickLayoutDropdownList:registerEventHandler( "dropdown_triggered", function ( element, event )
		if not event.inUse then
			f0_local1( event.widget.dropDownCurrentValue( controller, element ) )
		end
		element:dispatchEventToParent( event )
	end )
end

LUI.createMenu.StartMenu_Options_Controls_StickLayout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls_StickLayout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ModeSelection"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_StickLayout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local titleText = LUI.UITightText.new()
	titleText:setLeftRight( true, false, 219, 502 )
	titleText:setTopBottom( true, false, 99, 147 )
	titleText:setText( Engine.Localize( "MENU_STICK_LAYOUT_CAPS" ) )
	titleText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( titleText )
	self.titleText = titleText
	
	local stickLayoutButtonList = LUI.UIList.new( self, controller, 1, 0, nil, false, false, 0, 0, false, true )
	stickLayoutButtonList:makeFocusable()
	stickLayoutButtonList:setLeftRight( true, false, 219, 889 )
	stickLayoutButtonList:setTopBottom( true, false, 147, 202 )
	stickLayoutButtonList:setDataSource( "StickLayout" )
	stickLayoutButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	stickLayoutButtonList:setSpacing( 1 )
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
	
	local leftStickUpText = LUI.UIText.new()
	leftStickUpText:setLeftRight( true, false, 382, 582 )
	leftStickUpText:setTopBottom( true, false, 360, 378 )
	leftStickUpText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	leftStickUpText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	leftStickUpText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftStickUpText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickUpText", function ( model )
		local _leftStickUpText = Engine.GetModelValue( model )
		if _leftStickUpText then
			leftStickUpText:setText( Engine.Localize( _leftStickUpText ) )
		end
	end )
	self:addElement( leftStickUpText )
	self.leftStickUpText = leftStickUpText
	
	local leftStickDownText = LUI.UIText.new()
	leftStickDownText:setLeftRight( true, false, 382, 582 )
	leftStickDownText:setTopBottom( true, false, 478, 496 )
	leftStickDownText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	leftStickDownText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	leftStickDownText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftStickDownText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickDownText", function ( model )
		local _leftStickDownText = Engine.GetModelValue( model )
		if _leftStickDownText then
			leftStickDownText:setText( Engine.Localize( _leftStickDownText ) )
		end
	end )
	self:addElement( leftStickDownText )
	self.leftStickDownText = leftStickDownText
	
	local leftStickLeftRightText = LUI.UIText.new()
	leftStickLeftRightText:setLeftRight( true, false, 226, 426 )
	leftStickLeftRightText:setTopBottom( true, false, 419, 437 )
	leftStickLeftRightText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	leftStickLeftRightText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftStickLeftRightText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftStickLeftRightText:subscribeToGlobalModel( controller, "StickLayoutLabels", "leftStickLeftRightText", function ( model )
		local _leftStickLeftRightText = Engine.GetModelValue( model )
		if _leftStickLeftRightText then
			leftStickLeftRightText:setText( Engine.Localize( _leftStickLeftRightText ) )
		end
	end )
	self:addElement( leftStickLeftRightText )
	self.leftStickLeftRightText = leftStickLeftRightText
	
	local rightStickUpText = LUI.UIText.new()
	rightStickUpText:setLeftRight( true, false, 604, 804 )
	rightStickUpText:setTopBottom( true, false, 444, 462 )
	rightStickUpText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	rightStickUpText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickUpText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightStickUpText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickUpText", function ( model )
		local _rightStickUpText = Engine.GetModelValue( model )
		if _rightStickUpText then
			rightStickUpText:setText( Engine.Localize( _rightStickUpText ) )
		end
	end )
	self:addElement( rightStickUpText )
	self.rightStickUpText = rightStickUpText
	
	local rightStickDownText = LUI.UIText.new()
	rightStickDownText:setLeftRight( true, false, 604, 804 )
	rightStickDownText:setTopBottom( true, false, 562, 580 )
	rightStickDownText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	rightStickDownText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickDownText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightStickDownText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickDownText", function ( model )
		local _rightStickDownText = Engine.GetModelValue( model )
		if _rightStickDownText then
			rightStickDownText:setText( Engine.Localize( _rightStickDownText ) )
		end
	end )
	self:addElement( rightStickDownText )
	self.rightStickDownText = rightStickDownText
	
	local rightStickLeftRightText = LUI.UIText.new()
	rightStickLeftRightText:setLeftRight( true, false, 754, 954 )
	rightStickLeftRightText:setTopBottom( true, false, 503, 521 )
	rightStickLeftRightText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	rightStickLeftRightText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightStickLeftRightText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightStickLeftRightText:subscribeToGlobalModel( controller, "StickLayoutLabels", "rightStickLeftRightText", function ( model )
		local _rightStickLeftRightText = Engine.GetModelValue( model )
		if _rightStickLeftRightText then
			rightStickLeftRightText:setText( Engine.Localize( _rightStickLeftRightText ) )
		end
	end )
	self:addElement( rightStickLeftRightText )
	self.rightStickLeftRightText = rightStickLeftRightText
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local stickLayoutDropdownList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	stickLayoutDropdownList:makeFocusable()
	stickLayoutDropdownList:setLeftRight( true, false, 261, 761 )
	stickLayoutDropdownList:setTopBottom( true, false, 157.5, 191.5 )
	stickLayoutDropdownList:setAlpha( 0 )
	stickLayoutDropdownList:setDataSource( "StickLayoutDropdown" )
	stickLayoutDropdownList:setWidgetType( CoD.OptionDropdown )
	stickLayoutDropdownList:setSpacing( 0 )
	self:addElement( stickLayoutDropdownList )
	self.stickLayoutDropdownList = stickLayoutDropdownList
	
	stickLayoutButtonList.navigation = {
		left = stickLayoutDropdownList,
		up = stickLayoutDropdownList
	}
	stickLayoutDropdownList.navigation = {
		up = stickLayoutButtonList,
		right = stickLayoutButtonList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( true, false, 504, 604 )
				self.leftStickOverlay:setTopBottom( true, false, 463, 563 )
				self.clipFinished( leftStickOverlay, {} )
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
			end
		},
		Orbis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( true, false, 504, 604 )
				self.leftStickOverlay:setTopBottom( true, false, 463, 563 )
				self.clipFinished( leftStickOverlay, {} )
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
			end
		},
		Durango = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setLeftRight( true, false, 363.5, 895.5 )
				self.durangoControllerImage:setTopBottom( true, false, 170.5, 702.5 )
				self.durangoControllerImage:setAlpha( 1 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( true, false, 434, 534 )
				self.leftStickOverlay:setTopBottom( true, false, 388.5, 488.5 )
				self.clipFinished( leftStickOverlay, {} )
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
			end
		},
		PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				stickLayoutButtonList:completeAnimation()
				self.stickLayoutButtonList:setAlpha( 0 )
				self.clipFinished( stickLayoutButtonList, {} )
				leftStickOverlay:completeAnimation()
				self.leftStickOverlay:setLeftRight( true, false, 504, 604 )
				self.leftStickOverlay:setTopBottom( true, false, 463, 563 )
				self.clipFinished( leftStickOverlay, {} )
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
				return IsOrbis()
			end
		},
		{
			stateName = "Durango",
			condition = function ( menu, element, event )
				return IsDurango()
			end
		},
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f32_local0 = nil
		if IsPC() then
			SetFocusToElement( self, "stickLayoutDropdownList", controller )
		end
		if not f32_local0 then
			f32_local0 = self:dispatchEventToChildren( event )
		end
		return f32_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ForceNotifyControllerModel( controller, "forceUpdateVehicleBindings" )
		UpdateGamerprofile( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
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
		element.MenuFrame:close()
		element.stickLayoutDropdownList:close()
		element.leftStickOverlay:close()
		element.rightStickOverlay:close()
		element.leftStickUpText:close()
		element.leftStickDownText:close()
		element.leftStickLeftRightText:close()
		element.rightStickUpText:close()
		element.rightStickDownText:close()
		element.rightStickLeftRightText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_StickLayout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

