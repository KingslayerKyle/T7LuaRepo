require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )

DataSources.ButtonLayoutLabels = {
	m_isFlipped = false,
	getModel = function ( f1_arg0 )
		DataSources.ButtonLayoutLabels.m_lastController = f1_arg0
		local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "ButtonLayoutLabels" )
		if f1_local0 == nil then
			f1_local0 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "ButtonLayoutLabels" )
			Engine.CreateModel( f1_local0, "xbA_psCross_text" )
			Engine.CreateModel( f1_local0, "xbB_psCircle_text" )
			Engine.CreateModel( f1_local0, "xbX_psSquare_text" )
			Engine.CreateModel( f1_local0, "xbY_psTriangle_text" )
			Engine.CreateModel( f1_local0, "backText" )
			Engine.CreateModel( f1_local0, "startText" )
			Engine.CreateModel( f1_local0, "lbText" )
			Engine.CreateModel( f1_local0, "rbText" )
			Engine.CreateModel( f1_local0, "leftTrigText" )
			Engine.CreateModel( f1_local0, "rightTrigText" )
			Engine.CreateModel( f1_local0, "leftText" )
			Engine.CreateModel( f1_local0, "rightText" )
			Engine.CreateModel( f1_local0, "upText" )
			Engine.CreateModel( f1_local0, "downText" )
			Engine.CreateModel( f1_local0, "leftStickText" )
			Engine.CreateModel( f1_local0, "rightStickText" )
		end
		return f1_local0
	end,
	setModels = function ()
		local f2_local0 = DataSources.ButtonLayoutLabels.m_lastController
		local f2_local1 = DataSources.ButtonLayoutLabels.m_buttonStringsTable
		local f2_local2 = Engine.GetModel( Engine.GetModelForController( f2_local0 ), "ButtonLayoutLabels" )
		if not f2_local2 or not f2_local1 then
			return 
		end
		Engine.SetModelValue( Engine.GetModel( f2_local2, "xbA_psCross_text" ), f2_local1.BUTTON_A )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "xbB_psCircle_text" ), f2_local1.BUTTON_B )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "xbX_psSquare_text" ), f2_local1.BUTTON_X )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "xbY_psTriangle_text" ), f2_local1.BUTTON_Y )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "backText" ), f2_local1.BUTTON_BACK )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "startText" ), f2_local1.BUTTON_START )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "leftText" ), f2_local1.BUTTON_LEFT )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "rightText" ), f2_local1.BUTTON_RIGHT )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "upText" ), f2_local1.BUTTON_UP )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "downText" ), f2_local1.BUTTON_DOWN )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "leftStickText" ), f2_local1.BUTTON_LSTICK )
		Engine.SetModelValue( Engine.GetModel( f2_local2, "rightStickText" ), f2_local1.BUTTON_RSTICK )
		if DataSources.ButtonLayoutLabels.m_isFlipped then
			Engine.SetModelValue( Engine.GetModel( f2_local2, "lbText" ), f2_local1.BUTTON_LTRIG )
			Engine.SetModelValue( Engine.GetModel( f2_local2, "rbText" ), f2_local1.BUTTON_RTRIG )
			Engine.SetModelValue( Engine.GetModel( f2_local2, "leftTrigText" ), f2_local1.BUTTON_LBUMP )
			Engine.SetModelValue( Engine.GetModel( f2_local2, "rightTrigText" ), f2_local1.BUTTON_RBUMP )
		else
			Engine.SetModelValue( Engine.GetModel( f2_local2, "lbText" ), f2_local1.BUTTON_LBUMP )
			Engine.SetModelValue( Engine.GetModel( f2_local2, "rbText" ), f2_local1.BUTTON_RBUMP )
			Engine.SetModelValue( Engine.GetModel( f2_local2, "leftTrigText" ), f2_local1.BUTTON_LTRIG )
			Engine.SetModelValue( Engine.GetModel( f2_local2, "rightTrigText" ), f2_local1.BUTTON_RTRIG )
		end
	end
}
local f0_local0 = {
	ButtonStrings = {},
	FragGrenadeString = "MENU_THROW_FRAG_GRENADE"
}
if CoD.isSinglePlayer then
	f0_local0.FragGrenadeString = "MENU_THROW_PRIMARY"
end
f0_local0.SpecialGrenadeString = "MENU_THROW_SPECIAL_GRENADE"
if CoD.isSinglePlayer then
	f0_local0.SpecialGrenadeString = "MENU_THROW_SECONDARY"
end
f0_local0.ButtonStrings[CoD.BUTTONS_DEFAULT + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = f0_local0.SpecialGrenadeString,
	BUTTON_RBUMP = f0_local0.FragGrenadeString,
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = "MENU_AIM_DOWN_SIGHT",
	BUTTON_RTRIG = "MENU_FIRE_WEAPON",
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_MELEE_ATTACK"
}
f0_local0.ButtonStrings[CoD.BUTTONS_EXPERIMENTAL + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_MELEE_ATTACK",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = f0_local0.SpecialGrenadeString,
	BUTTON_RBUMP = f0_local0.FragGrenadeString,
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = "MENU_AIM_DOWN_SIGHT",
	BUTTON_RTRIG = "MENU_FIRE_WEAPON",
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_CROUCH_PRONE"
}
f0_local0.ButtonStrings[CoD.BUTTONS_LEFTY + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = f0_local0.FragGrenadeString,
	BUTTON_RBUMP = f0_local0.SpecialGrenadeString,
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = "MENU_FIRE_WEAPON",
	BUTTON_RTRIG = "MENU_AIM_DOWN_SIGHT",
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_MELEE_ATTACK",
	BUTTON_RSTICK = "MENU_SPRINT_HOLD_BREATH"
}
f0_local0.ButtonStrings[CoD.BUTTONS_NOMAD + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_MELEE_ATTACK",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = f0_local0.SpecialGrenadeString,
	BUTTON_RBUMP = f0_local0.FragGrenadeString,
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = "MENU_TOGGLE_AIM_DOWN_THE_SIGHT",
	BUTTON_RTRIG = "MENU_FIRE_WEAPON",
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_CROUCH_PRONE"
}
f0_local0.ButtonStrings[CoD.BUTTONS_CHARLIE + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = f0_local0.SpecialGrenadeString,
	BUTTON_RBUMP = "MENU_TOGGLE_AIM_DOWN_THE_SIGHT",
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = f0_local0.FragGrenadeString,
	BUTTON_RTRIG = "MENU_FIRE_WEAPON",
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_MELEE_ATTACK"
}
f0_local0.ButtonStrings[CoD.BUTTONS_BUMPERJUMPER + 1] = {
	BUTTON_A = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = "MENU_JUMP",
	BUTTON_RBUMP = f0_local0.FragGrenadeString,
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = "MENU_AIM_DOWN_SIGHT",
	BUTTON_RTRIG = "MENU_FIRE_WEAPON",
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_MELEE_ATTACK"
}
f0_local0.ButtonStrings[CoD.BUTTONS_STICKMOVE + 1] = {
	BUTTON_A = "MENU_MELEE_ATTACK",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = f0_local0.SpecialGrenadeString,
	BUTTON_RBUMP = f0_local0.FragGrenadeString,
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = "MENU_AIM_DOWN_SIGHT",
	BUTTON_RTRIG = "MENU_FIRE_WEAPON",
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_JUMP"
}
f0_local0.ButtonStrings[CoD.BUTTONS_GUNSLINGER + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = "MENU_FIRE_WEAPON",
	BUTTON_RBUMP = f0_local0.SpecialGrenadeString,
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = "MENU_AIM_DOWN_SIGHT",
	BUTTON_RTRIG = f0_local0.FragGrenadeString,
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_MELEE_ATTACK"
}
local f0_local1 = function ( f3_arg0 )
	DataSources.ButtonLayoutLabels.m_buttonStringsTable = f0_local0.ButtonStrings[f3_arg0 + 1]
	DataSources.ButtonLayoutLabels.setModels()
end

local f0_local2 = function ( f4_arg0 )
	DataSources.ButtonLayoutLabels.m_isFlipped = f4_arg0 == CoD.TRIGGERS_FLIPPED
	DataSources.ButtonLayoutLabels.setModels()
end

local f0_local3 = function ( f5_arg0 )
	local f5_local0 = "gpad_buttonsConfig"
	local f5_local1 = {
		{
			name = Engine.Localize( "MENU_DEFAULT_CAPS" ),
			value = CoD.BUTTONS_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_TACTICAL_CAPS" ),
			value = CoD.BUTTONS_EXPERIMENTAL
		},
		{
			name = Engine.Localize( "MENU_LEFTY_CAPS" ),
			value = CoD.BUTTONS_LEFTY
		},
		{
			name = Engine.Localize( "MENU_NOMAD_CAPS" ),
			value = CoD.BUTTONS_NOMAD
		},
		{
			name = Engine.Localize( "MENU_CHARLIE_CAPS" ),
			value = CoD.BUTTONS_CHARLIE
		},
		{
			name = Engine.Localize( "MENU_GUNSLINGER_CAPS" ),
			value = CoD.BUTTONS_GUNSLINGER
		},
		{
			name = Engine.Localize( "MENU_BUMPERJUMPER_CAPS" ),
			value = CoD.BUTTONS_BUMPERJUMPER
		},
		{
			name = Engine.Localize( "MENU_STICKMOVE_CAPS" ),
			value = CoD.BUTTONS_STICKMOVE
		}
	}
	return {
		models = {
			name = "MENU_BUTTON_LAYOUT_CAPS",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f5_arg0, "ButtonLayoutOptions_ButtonLayout", f5_local1, f5_local0, f0_local1, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f5_arg0, f5_local1, f5_local0 )
		},
		properties = {}
	}
end

local f0_local4 = function ( f6_arg0 )
	local f6_local0 = "flipped_control_config"
	local f6_local1 = {
		{
			name = Engine.Localize( "MENU_DEFAULT_CAPS" ),
			value = CoD.TRIGGERS_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_FLIPPED_CAPS" ),
			value = CoD.TRIGGERS_FLIPPED
		}
	}
	local f6_local2 = {
		models = {
			name = "PLATFORM_TRIGGER_CONFIG_CAPS",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f6_arg0, "ButtonLayoutOptions_TriggerConfig", f6_local1, f6_local0, f0_local2, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f6_arg0, f6_local1, f6_local0 )
		},
		properties = {}
	}
	DataSources.ButtonLayoutLabels.m_isFlipped = f6_local2.models.currentSelection - 1 == CoD.TRIGGERS_FLIPPED
	return f6_local2
end

DataSources.ButtonLayout = DataSourceHelpers.ListSetup( "ButtonLayout", function ( f7_arg0 )
	local f7_local0 = {}
	table.insert( f7_local0, f0_local3( f7_arg0 ) )
	table.insert( f7_local0, f0_local4( f7_arg0 ) )
	return f7_local0
end, true )
if CoD.isPC then
	DataSources.ButtonLayoutDropdownPresets = DataSourceHelpers.ListSetup( "PC.ButtonLayoutDropdownPresets", function ( f8_arg0 )
		local f8_local0 = {}
		table.insert( f8_local0, {
			models = {
				value = CoD.BUTTONS_DEFAULT,
				valueDisplay = "MENU_DEFAULT_CAPS"
			}
		} )
		table.insert( f8_local0, {
			models = {
				value = CoD.BUTTONS_EXPERIMENTAL,
				valueDisplay = "MENU_TACTICAL_CAPS"
			}
		} )
		table.insert( f8_local0, {
			models = {
				value = CoD.BUTTONS_LEFTY,
				valueDisplay = "MENU_LEFTY_CAPS"
			}
		} )
		table.insert( f8_local0, {
			models = {
				value = CoD.BUTTONS_NOMAD,
				valueDisplay = "MENU_NOMAD_CAPS"
			}
		} )
		table.insert( f8_local0, {
			models = {
				value = CoD.BUTTONS_CHARLIE,
				valueDisplay = "MENU_CHARLIE_CAPS"
			}
		} )
		table.insert( f8_local0, {
			models = {
				value = CoD.BUTTONS_GUNSLINGER,
				valueDisplay = "MENU_GUNSLINGER_CAPS"
			}
		} )
		table.insert( f8_local0, {
			models = {
				value = CoD.BUTTONS_BUMPERJUMPER,
				valueDisplay = "MENU_BUMPERJUMPER_CAPS"
			}
		} )
		table.insert( f8_local0, {
			models = {
				value = CoD.BUTTONS_STICKMOVE,
				valueDisplay = "MENU_STICKMOVE_CAPS"
			}
		} )
		return f8_local0
	end, true )
	DataSources.ButtonLayoutDropdown = DataSourceHelpers.ListSetup( "ButtonLayoutDropdown", function ( f9_arg0 )
		local f9_local0 = {}
		table.insert( f9_local0, {
			models = {
				label = "MENU_BUTTON_LAYOUT_CAPS",
				profileVarName = "gpad_buttonsConfig",
				profileType = "user",
				datasource = "ButtonLayoutDropdownPresets",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
		table.insert( f9_local0, {
			models = {
				label = "PLATFORM_TRIGGER_CONFIG_CAPS",
				profileVarName = "flipped_control_config",
				profileType = "user",
				lowValue = 0,
				highValue = 1,
				widgetType = "checkbox"
			},
			properties = {
				checkboxAction = function ( f10_arg0, f10_arg1 )
					CoD.PCUtil.OptionsCheckboxAction( f10_arg0, f10_arg1 )
					local f10_local0 = f10_arg1:getModel()
					if f10_local0 then
						local f10_local1 = CoD.PCUtil.GetOptionInfo( f10_local0, f10_arg0 )
						f0_local2( f10_local1.currentValue )
					end
				end
			}
		} )
		return f9_local0
	end, true )
	DataSources.ButtonLayoutDropdown.getWidgetTypeForItem = function ( f11_arg0, f11_arg1, f11_arg2 )
		if f11_arg1 then
			local f11_local0 = Engine.GetModelValue( Engine.GetModel( f11_arg1, "widgetType" ) )
			if f11_local0 == "dropdown" then
				return CoD.OptionDropdown
			elseif f11_local0 == "checkbox" then
				return CoD.StartMenu_Options_CheckBoxOption
			end
		end
		return nil
	end
	
end
local PostLoadFunc = function ( self, controller, menu )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
	} )
	self:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f13_local0 = 1, element.buttonLayoutDropdownList.requestedRowCount, 1 do
			local f13_local3 = element.buttonLayoutDropdownList:getItemAtPosition( f13_local0, 1 )
			if event.inUse then
				if f13_local3 ~= event.widget then
					f13_local3.m_inputDisabled = true
				end
			end
			f13_local3.m_inputDisabled = false
		end
	end )
	self.buttonLayoutDropdownList:registerEventHandler( "dropdown_triggered", function ( element, event )
		if not event.inUse then
			f0_local1( event.widget.dropDownCurrentValue( controller, element ) )
		end
		element:dispatchEventToParent( event )
	end )
end

LUI.createMenu.StartMenu_Options_Controls_ButtonLayout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls_ButtonLayout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ModeSelection"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_ButtonLayout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local buttonLayoutButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	buttonLayoutButtonList:makeFocusable()
	buttonLayoutButtonList:setLeftRight( true, false, 31.5, 701.5 )
	buttonLayoutButtonList:setTopBottom( true, false, 108, 220 )
	buttonLayoutButtonList:setDataSource( "ButtonLayout" )
	buttonLayoutButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	buttonLayoutButtonList:setVerticalCount( 2 )
	self:addElement( buttonLayoutButtonList )
	self.buttonLayoutButtonList = buttonLayoutButtonList
	
	local durangoControllerImage = LUI.UIImage.new()
	durangoControllerImage:setLeftRight( true, false, 415, 865 )
	durangoControllerImage:setTopBottom( true, false, 234, 684 )
	durangoControllerImage:setAlpha( 0 )
	durangoControllerImage:setImage( RegisterImage( "uie_xenonone_controller_top" ) )
	self:addElement( durangoControllerImage )
	self.durangoControllerImage = durangoControllerImage
	
	local orbisControllerImage = LUI.UIImage.new()
	orbisControllerImage:setLeftRight( true, false, 415, 865 )
	orbisControllerImage:setTopBottom( true, false, 234, 684 )
	orbisControllerImage:setImage( RegisterImage( "uie_ps4_controller_top" ) )
	self:addElement( orbisControllerImage )
	self.orbisControllerImage = orbisControllerImage
	
	local leftTriggerText = LUI.UIText.new()
	leftTriggerText:setLeftRight( true, false, 244.5, 444.5 )
	leftTriggerText:setTopBottom( true, false, 283, 308 )
	leftTriggerText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	leftTriggerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftTriggerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftTriggerText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "leftTrigText", function ( model )
		local leftTrigText = Engine.GetModelValue( model )
		if leftTrigText then
			leftTriggerText:setText( Engine.Localize( leftTrigText ) )
		end
	end )
	self:addElement( leftTriggerText )
	self.leftTriggerText = leftTriggerText
	
	local leftBumperText = LUI.UIText.new()
	leftBumperText:setLeftRight( true, false, 211.5, 411.5 )
	leftBumperText:setTopBottom( true, false, 309.5, 334.5 )
	leftBumperText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	leftBumperText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftBumperText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftBumperText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "lbText", function ( model )
		local lbText = Engine.GetModelValue( model )
		if lbText then
			leftBumperText:setText( Engine.Localize( lbText ) )
		end
	end )
	self:addElement( leftBumperText )
	self.leftBumperText = leftBumperText
	
	local rightTriggerText = LUI.UIText.new()
	rightTriggerText:setLeftRight( true, false, 831.5, 1031.5 )
	rightTriggerText:setTopBottom( true, false, 270.5, 295.5 )
	rightTriggerText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rightTriggerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightTriggerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightTriggerText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rightTrigText", function ( model )
		local rightTrigText = Engine.GetModelValue( model )
		if rightTrigText then
			rightTriggerText:setText( Engine.Localize( rightTrigText ) )
		end
	end )
	self:addElement( rightTriggerText )
	self.rightTriggerText = rightTriggerText
	
	local rightBumperText = LUI.UIText.new()
	rightBumperText:setLeftRight( true, false, 852.5, 1052.5 )
	rightBumperText:setTopBottom( true, false, 308, 333 )
	rightBumperText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rightBumperText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightBumperText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightBumperText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rbText", function ( model )
		local rbText = Engine.GetModelValue( model )
		if rbText then
			rightBumperText:setText( Engine.Localize( rbText ) )
		end
	end )
	self:addElement( rightBumperText )
	self.rightBumperText = rightBumperText
	
	local XBAPSCrossText = LUI.UIText.new()
	XBAPSCrossText:setLeftRight( true, false, 947.5, 1147.5 )
	XBAPSCrossText:setTopBottom( true, false, 466, 491 )
	XBAPSCrossText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	XBAPSCrossText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBAPSCrossText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	XBAPSCrossText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbA_psCross_text", function ( model )
		local xbAPsCrossText = Engine.GetModelValue( model )
		if xbAPsCrossText then
			XBAPSCrossText:setText( Engine.Localize( xbAPsCrossText ) )
		end
	end )
	self:addElement( XBAPSCrossText )
	self.XBAPSCrossText = XBAPSCrossText
	
	local XBBPSCircleText = LUI.UIText.new()
	XBBPSCircleText:setLeftRight( true, false, 947.5, 1147.5 )
	XBBPSCircleText:setTopBottom( true, false, 434, 459 )
	XBBPSCircleText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	XBBPSCircleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBBPSCircleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	XBBPSCircleText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbB_psCircle_text", function ( model )
		local xbBPsCircleText = Engine.GetModelValue( model )
		if xbBPsCircleText then
			XBBPSCircleText:setText( Engine.Localize( xbBPsCircleText ) )
		end
	end )
	self:addElement( XBBPSCircleText )
	self.XBBPSCircleText = XBBPSCircleText
	
	local XBXPSSquareText = LUI.UIText.new()
	XBXPSSquareText:setLeftRight( true, false, 947.5, 1147.5 )
	XBXPSSquareText:setTopBottom( true, false, 404.79, 429.79 )
	XBXPSSquareText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	XBXPSSquareText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBXPSSquareText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	XBXPSSquareText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbX_psSquare_text", function ( model )
		local xbXPsSquareText = Engine.GetModelValue( model )
		if xbXPsSquareText then
			XBXPSSquareText:setText( Engine.Localize( xbXPsSquareText ) )
		end
	end )
	self:addElement( XBXPSSquareText )
	self.XBXPSSquareText = XBXPSSquareText
	
	local XBYPSTriangleText = LUI.UIText.new()
	XBYPSTriangleText:setLeftRight( true, false, 947.5, 1147.5 )
	XBYPSTriangleText:setTopBottom( true, false, 375, 400 )
	XBYPSTriangleText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	XBYPSTriangleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBYPSTriangleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	XBYPSTriangleText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbY_psTriangle_text", function ( model )
		local xbYPsTriangleText = Engine.GetModelValue( model )
		if xbYPsTriangleText then
			XBYPSTriangleText:setText( Engine.Localize( xbYPsTriangleText ) )
		end
	end )
	self:addElement( XBYPSTriangleText )
	self.XBYPSTriangleText = XBYPSTriangleText
	
	local backButtonText = LUI.UIText.new()
	backButtonText:setLeftRight( true, false, 540, 740 )
	backButtonText:setTopBottom( true, false, 283, 308 )
	backButtonText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	backButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	backButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	backButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "backText", function ( model )
		local backText = Engine.GetModelValue( model )
		if backText then
			backButtonText:setText( Engine.Localize( backText ) )
		end
	end )
	self:addElement( backButtonText )
	self.backButtonText = backButtonText
	
	local startButtonText = LUI.UIText.new()
	startButtonText:setLeftRight( true, false, 620, 820 )
	startButtonText:setTopBottom( true, false, 245.5, 270.5 )
	startButtonText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	startButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	startButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	startButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "startText", function ( model )
		local startText = Engine.GetModelValue( model )
		if startText then
			startButtonText:setText( Engine.Localize( startText ) )
		end
	end )
	self:addElement( startButtonText )
	self.startButtonText = startButtonText
	
	local leftButtonText = LUI.UIText.new()
	leftButtonText:setLeftRight( true, false, 152, 336.5 )
	leftButtonText:setTopBottom( true, false, 434, 459 )
	leftButtonText:setAlpha( 0 )
	leftButtonText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	leftButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "leftText", function ( model )
		local leftText = Engine.GetModelValue( model )
		if leftText then
			leftButtonText:setText( Engine.Localize( leftText ) )
		end
	end )
	self:addElement( leftButtonText )
	self.leftButtonText = leftButtonText
	
	local rightButtonText = LUI.UIText.new()
	rightButtonText:setLeftRight( true, false, 152, 336.5 )
	rightButtonText:setTopBottom( true, false, 404.79, 429.79 )
	rightButtonText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rightButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rightButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rightText", function ( model )
		local rightText = Engine.GetModelValue( model )
		if rightText then
			rightButtonText:setText( Engine.Localize( rightText ) )
		end
	end )
	self:addElement( rightButtonText )
	self.rightButtonText = rightButtonText
	
	local upButtonText = LUI.UIText.new()
	upButtonText:setLeftRight( true, false, 152, 337 )
	upButtonText:setTopBottom( true, false, 375, 400 )
	upButtonText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	upButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	upButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	upButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "upText", function ( model )
		local upText = Engine.GetModelValue( model )
		if upText then
			upButtonText:setText( Engine.Localize( upText ) )
		end
	end )
	self:addElement( upButtonText )
	self.upButtonText = upButtonText
	
	local downButtonText = LUI.UIText.new()
	downButtonText:setLeftRight( true, false, 152, 337 )
	downButtonText:setTopBottom( true, false, 466, 491 )
	downButtonText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	downButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	downButtonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	downButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "downText", function ( model )
		local downText = Engine.GetModelValue( model )
		if downText then
			downButtonText:setText( Engine.Localize( downText ) )
		end
	end )
	self:addElement( downButtonText )
	self.downButtonText = downButtonText
	
	local leftStickText = LUI.UIText.new()
	leftStickText:setLeftRight( true, false, 379.5, 579.5 )
	leftStickText:setTopBottom( true, false, 592, 617 )
	leftStickText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	leftStickText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftStickText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	leftStickText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "leftStickText", function ( model )
		local _leftStickText = Engine.GetModelValue( model )
		if _leftStickText then
			leftStickText:setText( Engine.Localize( _leftStickText ) )
		end
	end )
	self:addElement( leftStickText )
	self.leftStickText = leftStickText
	
	local rightStickText = LUI.UIText.new()
	rightStickText:setLeftRight( true, false, 695, 895 )
	rightStickText:setTopBottom( true, false, 592, 617 )
	rightStickText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rightStickText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightStickText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rightStickText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rightStickText", function ( model )
		local _rightStickText = Engine.GetModelValue( model )
		if _rightStickText then
			rightStickText:setText( Engine.Localize( _rightStickText ) )
		end
	end )
	self:addElement( rightStickText )
	self.rightStickText = rightStickText
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local OrbisLines = LUI.UIImage.new()
	OrbisLines:setLeftRight( true, false, 349, 932.5 )
	OrbisLines:setTopBottom( true, false, 273.5, 586.09 )
	OrbisLines:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_lines" ) )
	self:addElement( OrbisLines )
	self.OrbisLines = OrbisLines
	
	local DurangoLines = LUI.UIImage.new()
	DurangoLines:setLeftRight( true, false, 375.5, 1047.5 )
	DurangoLines:setTopBottom( true, false, 273.5, 633.5 )
	DurangoLines:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_lines_durango" ) )
	self:addElement( DurangoLines )
	self.DurangoLines = DurangoLines
	
	local buttonLayoutDropdownList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	buttonLayoutDropdownList:makeFocusable()
	buttonLayoutDropdownList:setLeftRight( true, false, 74, 574 )
	buttonLayoutDropdownList:setTopBottom( true, false, 130, 198 )
	buttonLayoutDropdownList:setAlpha( 0 )
	buttonLayoutDropdownList:setDataSource( "ButtonLayoutDropdown" )
	buttonLayoutDropdownList:setWidgetType( CoD.OptionDropdown )
	buttonLayoutDropdownList:setVerticalCount( 2 )
	buttonLayoutDropdownList:setSpacing( 0 )
	self:addElement( buttonLayoutDropdownList )
	self.buttonLayoutDropdownList = buttonLayoutDropdownList
	
	buttonLayoutButtonList.navigation = {
		left = buttonLayoutDropdownList,
		up = buttonLayoutDropdownList
	}
	buttonLayoutDropdownList.navigation = {
		up = buttonLayoutButtonList,
		right = buttonLayoutButtonList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				leftButtonText:completeAnimation()
				self.leftButtonText:setAlpha( 0 )
				self.clipFinished( leftButtonText, {} )
			end
		},
		Orbis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setAlpha( 0 )
				self.clipFinished( DurangoLines, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 1 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				leftTriggerText:completeAnimation()
				self.leftTriggerText:setLeftRight( true, false, 241, 441 )
				self.leftTriggerText:setTopBottom( true, false, 273.5, 298.5 )
				self.clipFinished( leftTriggerText, {} )
				leftBumperText:completeAnimation()
				self.leftBumperText:setLeftRight( true, false, 220, 420 )
				self.leftBumperText:setTopBottom( true, false, 309.5, 334.5 )
				self.clipFinished( leftBumperText, {} )
				rightTriggerText:completeAnimation()
				self.rightTriggerText:setLeftRight( true, false, 835.5, 1035.5 )
				self.rightTriggerText:setTopBottom( true, false, 270.5, 295.5 )
				self.clipFinished( rightTriggerText, {} )
				rightBumperText:completeAnimation()
				self.rightBumperText:setLeftRight( true, false, 856.5, 1056.5 )
				self.rightBumperText:setTopBottom( true, false, 308, 333 )
				self.clipFinished( rightBumperText, {} )
				XBAPSCrossText:completeAnimation()
				self.XBAPSCrossText:setLeftRight( true, false, 939.5, 1139.5 )
				self.XBAPSCrossText:setTopBottom( true, false, 466, 491 )
				self.clipFinished( XBAPSCrossText, {} )
				XBBPSCircleText:completeAnimation()
				self.XBBPSCircleText:setLeftRight( true, false, 939.5, 1139.5 )
				self.XBBPSCircleText:setTopBottom( true, false, 434, 459 )
				self.clipFinished( XBBPSCircleText, {} )
				XBXPSSquareText:completeAnimation()
				self.XBXPSSquareText:setLeftRight( true, false, 939.5, 1139.5 )
				self.XBXPSSquareText:setTopBottom( true, false, 404.79, 429.79 )
				self.clipFinished( XBXPSSquareText, {} )
				XBYPSTriangleText:completeAnimation()
				self.XBYPSTriangleText:setLeftRight( true, false, 939.5, 1139.5 )
				self.XBYPSTriangleText:setTopBottom( true, false, 375, 400 )
				self.clipFinished( XBYPSTriangleText, {} )
				backButtonText:completeAnimation()
				self.backButtonText:setLeftRight( true, false, 507, 707 )
				self.backButtonText:setTopBottom( true, false, 283, 308 )
				self.clipFinished( backButtonText, {} )
				startButtonText:completeAnimation()
				self.startButtonText:setLeftRight( true, false, 578.5, 778.5 )
				self.startButtonText:setTopBottom( true, false, 258, 283 )
				self.clipFinished( startButtonText, {} )
				leftButtonText:completeAnimation()
				self.leftButtonText:setLeftRight( true, false, 220.5, 405 )
				self.leftButtonText:setTopBottom( true, false, 450.5, 475.5 )
				self.leftButtonText:setAlpha( 0 )
				self.clipFinished( leftButtonText, {} )
				rightButtonText:completeAnimation()
				self.rightButtonText:setLeftRight( true, false, 220, 404.5 )
				self.rightButtonText:setTopBottom( true, false, 511, 536 )
				self.clipFinished( rightButtonText, {} )
				upButtonText:completeAnimation()
				self.upButtonText:setLeftRight( true, false, 220.5, 405.5 )
				self.upButtonText:setTopBottom( true, false, 474.21, 499.21 )
				self.clipFinished( upButtonText, {} )
				downButtonText:completeAnimation()
				self.downButtonText:setLeftRight( true, false, 220, 405 )
				self.downButtonText:setTopBottom( true, false, 541, 566 )
				self.clipFinished( downButtonText, {} )
				leftStickText:completeAnimation()
				self.leftStickText:setLeftRight( true, false, 205.5, 405.5 )
				self.leftStickText:setTopBottom( true, false, 404.79, 429.79 )
				self.clipFinished( leftStickText, {} )
				rightStickText:completeAnimation()
				self.rightStickText:setLeftRight( true, false, 697, 897 )
				self.rightStickText:setTopBottom( true, false, 588, 613 )
				self.clipFinished( rightStickText, {} )
				OrbisLines:completeAnimation()
				self.OrbisLines:setAlpha( 0 )
				self.clipFinished( OrbisLines, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setLeftRight( true, false, 413.5, 934.5 )
				self.DurangoLines:setTopBottom( true, false, 283, 586.09 )
				self.clipFinished( DurangoLines, {} )
			end
		},
		PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				buttonLayoutButtonList:completeAnimation()
				self.buttonLayoutButtonList:setAlpha( 0 )
				self.clipFinished( buttonLayoutButtonList, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setAlpha( 0 )
				self.clipFinished( DurangoLines, {} )
				buttonLayoutDropdownList:completeAnimation()
				self.buttonLayoutDropdownList:setAlpha( 1 )
				self.clipFinished( buttonLayoutDropdownList, {} )
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
		local f39_local0 = nil
		if IsPC() then
			SetFocusToElement( self, "buttonLayoutDropdownList", controller )
		end
		if not f39_local0 then
			f39_local0 = self:dispatchEventToChildren( event )
		end
		return f39_local0
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
	buttonLayoutButtonList.id = "buttonLayoutButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
	buttonLayoutDropdownList.id = "buttonLayoutDropdownList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonLayoutButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonLayoutButtonList:close()
		element.MenuFrame:close()
		element.StartMenulineGraphicsOptions0:close()
		element.buttonLayoutDropdownList:close()
		element.leftTriggerText:close()
		element.leftBumperText:close()
		element.rightTriggerText:close()
		element.rightBumperText:close()
		element.XBAPSCrossText:close()
		element.XBBPSCircleText:close()
		element.XBXPSSquareText:close()
		element.XBYPSTriangleText:close()
		element.backButtonText:close()
		element.startButtonText:close()
		element.leftButtonText:close()
		element.rightButtonText:close()
		element.upButtonText:close()
		element.downButtonText:close()
		element.leftStickText:close()
		element.rightStickText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_ButtonLayout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

