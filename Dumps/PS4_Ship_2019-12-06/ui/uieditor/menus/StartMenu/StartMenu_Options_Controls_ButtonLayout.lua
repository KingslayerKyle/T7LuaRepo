require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Controls_GenericControllerItem" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )

local f0_local0 = {}
DataSources.ButtonLayoutLabels = {
	m_isFlipped = false,
	getModel = function ( f1_arg0 )
		DataSources.ButtonLayoutLabels.m_lastController = f1_arg0
		local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "ButtonLayoutLabels" )
		if f1_local0 == nil then
			f1_local0 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "ButtonLayoutLabels" )
			local f1_local1 = function ( f2_arg0 )
				Engine.CreateModel( f1_local0, f2_arg0 .. ".text" )
				Engine.CreateModel( f1_local0, f2_arg0 .. ".isDefault" )
			end
			
			f1_local1( "xbA_psCross" )
			f1_local1( "xbB_psCircle" )
			f1_local1( "xbX_psSquare" )
			f1_local1( "xbY_psTriangle" )
			f1_local1( "back" )
			f1_local1( "start" )
			f1_local1( "lb" )
			f1_local1( "rb" )
			f1_local1( "leftTrig" )
			f1_local1( "rightTrig" )
			f1_local1( "leftDpad" )
			f1_local1( "rightDpad" )
			f1_local1( "upDpad" )
			f1_local1( "downDpad" )
			f1_local1( "leftStick" )
			f1_local1( "rightStick" )
		end
		return f1_local0
	end,
	setButtonModel = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f3_arg0, f3_arg2 .. ".text" ), f3_arg1[f3_arg3] )
		Engine.SetModelValue( Engine.CreateModel( f3_arg0, f3_arg2 .. ".isDefault" ), f3_arg1[f3_arg3] == f0_local0.ButtonStrings[CoD.BUTTONS_DEFAULT + 1][f3_arg3] )
	end,
	setModels = function ()
		local f4_local0 = DataSources.ButtonLayoutLabels.m_lastController
		local f4_local1 = DataSources.ButtonLayoutLabels.m_buttonStringsTable
		local f4_local2 = Engine.GetModel( Engine.GetModelForController( f4_local0 ), "ButtonLayoutLabels" )
		if not f4_local2 or not f4_local1 then
			return 
		end
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "xbA_psCross", "BUTTON_A" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "xbB_psCircle", "BUTTON_B" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "xbX_psSquare", "BUTTON_X" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "xbY_psTriangle", "BUTTON_Y" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "back", "BUTTON_BACK" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "start", "BUTTON_START" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "leftDpad", "BUTTON_LEFT" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "rightDpad", "BUTTON_RIGHT" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "upDpad", "BUTTON_UP" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "downDpad", "BUTTON_DOWN" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "leftStick", "BUTTON_LSTICK" )
		DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "rightStick", "BUTTON_RSTICK" )
		if DataSources.ButtonLayoutLabels.m_isFlipped then
			DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "lb", "BUTTON_LTRIG" )
			DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "rb", "BUTTON_RTRIG" )
			DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "leftTrig", "BUTTON_LBUMP" )
			DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "rightTrig", "BUTTON_RBUMP" )
		else
			DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "lb", "BUTTON_LBUMP" )
			DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "rb", "BUTTON_RBUMP" )
			DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "leftTrig", "BUTTON_LTRIG" )
			DataSources.ButtonLayoutLabels.setButtonModel( f4_local2, f4_local1, "rightTrig", "BUTTON_RTRIG" )
		end
	end
}
f0_local0.ButtonStrings = {}
local f0_local1 = function ()
	f0_local0.ButtonStrings[CoD.BUTTONS_DEFAULT + 1] = {
		BUTTON_A = "MENU_JUMP",
		BUTTON_B = "MENU_CROUCH_PRONE",
		BUTTON_X = "MENU_USE_RELOAD",
		BUTTON_Y = "MENU_SWITCH_WEAPON",
		BUTTON_LBUMP = CoD.CPMPZMINV( "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_SPECIAL_GRENADE", "MENU_THROW_TACTICALS_OR_SPECIAL" ),
		BUTTON_RBUMP = "MENU_THROW_FRAG_GRENADE",
		BUTTON_UP = CoD.CPMPZMINV( "MENU_TOGGLE_ENHANCED_VISION", "MENU_SCORESTREAK_SELECTION", "MENU_USE_GOBBLEGUM", "" ),
		BUTTON_DOWN = CoD.CPMPZMINV( "MENU_CYBERNETIC_WHEEL_CONTROL", "MENU_SCORESTREAK_SELECTION", "MENU_EQUIP_SPECIAL_ITEM", "" ),
		BUTTON_LEFT = CoD.CPMPZMINV( "MENU_EQUIP_HEAVY_WEAPON", "", "", "MENU_DPAD_SESSION_SPECIFIC" ),
		BUTTON_RIGHT = CoD.CPMPZMINV( "MENU_TOGGLE_DNI_TACTICAL_MODE", "MENU_USE_SCORESTREAK", "MENU_PLACE_TRIPMINES", "" ),
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
		BUTTON_LBUMP = CoD.CPMPZMINV( "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_SPECIAL_GRENADE", "MENU_THROW_TACTICALS_OR_SPECIAL" ),
		BUTTON_RBUMP = "MENU_THROW_FRAG_GRENADE",
		BUTTON_UP = CoD.CPMPZMINV( "MENU_TOGGLE_ENHANCED_VISION", "MENU_SCORESTREAK_SELECTION", "MENU_USE_GOBBLEGUM", "" ),
		BUTTON_DOWN = CoD.CPMPZMINV( "MENU_CYBERNETIC_WHEEL_CONTROL", "MENU_SCORESTREAK_SELECTION", "MENU_EQUIP_SPECIAL_ITEM", "" ),
		BUTTON_LEFT = CoD.CPMPZMINV( "MENU_EQUIP_HEAVY_WEAPON", "", "", "MENU_DPAD_SESSION_SPECIFIC" ),
		BUTTON_RIGHT = CoD.CPMPZMINV( "MENU_TOGGLE_DNI_TACTICAL_MODE", "MENU_USE_SCORESTREAK", "MENU_PLACE_TRIPMINES", "" ),
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
		BUTTON_LBUMP = "MENU_THROW_FRAG_GRENADE",
		BUTTON_RBUMP = CoD.CPMPZMINV( "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_SPECIAL_GRENADE", "MENU_THROW_TACTICALS_OR_SPECIAL" ),
		BUTTON_UP = CoD.CPMPZMINV( "MENU_TOGGLE_ENHANCED_VISION", "MENU_SCORESTREAK_SELECTION", "MENU_USE_GOBBLEGUM", "" ),
		BUTTON_DOWN = CoD.CPMPZMINV( "MENU_CYBERNETIC_WHEEL_CONTROL", "MENU_SCORESTREAK_SELECTION", "MENU_EQUIP_SPECIAL_ITEM", "" ),
		BUTTON_LEFT = CoD.CPMPZMINV( "MENU_EQUIP_HEAVY_WEAPON", "", "", "MENU_DPAD_SESSION_SPECIFIC" ),
		BUTTON_RIGHT = CoD.CPMPZMINV( "MENU_TOGGLE_DNI_TACTICAL_MODE", "MENU_USE_SCORESTREAK", "MENU_PLACE_TRIPMINES", "" ),
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
		BUTTON_LBUMP = CoD.CPMPZMINV( "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_SPECIAL_GRENADE", "MENU_THROW_TACTICALS_OR_SPECIAL" ),
		BUTTON_RBUMP = "MENU_THROW_FRAG_GRENADE",
		BUTTON_UP = CoD.CPMPZMINV( "MENU_TOGGLE_ENHANCED_VISION", "MENU_SCORESTREAK_SELECTION", "MENU_USE_GOBBLEGUM", "" ),
		BUTTON_DOWN = CoD.CPMPZMINV( "MENU_CYBERNETIC_WHEEL_CONTROL", "MENU_SCORESTREAK_SELECTION", "MENU_EQUIP_SPECIAL_ITEM", "" ),
		BUTTON_LEFT = CoD.CPMPZMINV( "MENU_EQUIP_HEAVY_WEAPON", "", "", "MENU_DPAD_SESSION_SPECIFIC" ),
		BUTTON_RIGHT = CoD.CPMPZMINV( "MENU_TOGGLE_DNI_TACTICAL_MODE", "MENU_USE_SCORESTREAK", "MENU_PLACE_TRIPMINES", "" ),
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
		BUTTON_LBUMP = CoD.CPMPZMINV( "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_SPECIAL_GRENADE", "MENU_THROW_TACTICALS_OR_SPECIAL" ),
		BUTTON_RBUMP = "MENU_TOGGLE_AIM_DOWN_THE_SIGHT",
		BUTTON_UP = CoD.CPMPZMINV( "MENU_TOGGLE_ENHANCED_VISION", "MENU_SCORESTREAK_SELECTION", "MENU_USE_GOBBLEGUM", "" ),
		BUTTON_DOWN = CoD.CPMPZMINV( "MENU_CYBERNETIC_WHEEL_CONTROL", "MENU_SCORESTREAK_SELECTION", "MENU_EQUIP_SPECIAL_ITEM", "" ),
		BUTTON_LEFT = CoD.CPMPZMINV( "MENU_EQUIP_HEAVY_WEAPON", "", "", "MENU_DPAD_SESSION_SPECIFIC" ),
		BUTTON_RIGHT = CoD.CPMPZMINV( "MENU_TOGGLE_DNI_TACTICAL_MODE", "MENU_USE_SCORESTREAK", "MENU_PLACE_TRIPMINES", "" ),
		BUTTON_LTRIG = "MENU_THROW_FRAG_GRENADE",
		BUTTON_RTRIG = "MENU_FIRE_WEAPON",
		BUTTON_START = "MENU_OBJECTIVES_MENU",
		BUTTON_BACK = "MENU_SCOREBOARD",
		BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
		BUTTON_RSTICK = "MENU_MELEE_ATTACK"
	}
	f0_local0.ButtonStrings[CoD.BUTTONS_BUMPERJUMPER + 1] = {
		BUTTON_A = CoD.CPMPZMINV( "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_SPECIAL_GRENADE", "MENU_THROW_TACTICALS_OR_SPECIAL" ),
		BUTTON_B = "MENU_CROUCH_PRONE",
		BUTTON_X = "MENU_USE_RELOAD",
		BUTTON_Y = "MENU_SWITCH_WEAPON",
		BUTTON_LBUMP = "MENU_JUMP",
		BUTTON_RBUMP = "MENU_THROW_FRAG_GRENADE",
		BUTTON_UP = CoD.CPMPZMINV( "MENU_TOGGLE_ENHANCED_VISION", "MENU_SCORESTREAK_SELECTION", "MENU_USE_GOBBLEGUM", "" ),
		BUTTON_DOWN = CoD.CPMPZMINV( "MENU_CYBERNETIC_WHEEL_CONTROL", "MENU_SCORESTREAK_SELECTION", "MENU_EQUIP_SPECIAL_ITEM", "" ),
		BUTTON_LEFT = CoD.CPMPZMINV( "MENU_EQUIP_HEAVY_WEAPON", "", "", "MENU_DPAD_SESSION_SPECIFIC" ),
		BUTTON_RIGHT = CoD.CPMPZMINV( "MENU_TOGGLE_DNI_TACTICAL_MODE", "MENU_USE_SCORESTREAK", "MENU_PLACE_TRIPMINES", "" ),
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
		BUTTON_LBUMP = CoD.CPMPZMINV( "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_SPECIAL_GRENADE", "MENU_THROW_TACTICALS_OR_SPECIAL" ),
		BUTTON_RBUMP = "MENU_THROW_FRAG_GRENADE",
		BUTTON_UP = CoD.CPMPZMINV( "MENU_TOGGLE_ENHANCED_VISION", "MENU_SCORESTREAK_SELECTION", "MENU_USE_GOBBLEGUM", "" ),
		BUTTON_DOWN = CoD.CPMPZMINV( "MENU_CYBERNETIC_WHEEL_CONTROL", "MENU_SCORESTREAK_SELECTION", "MENU_EQUIP_SPECIAL_ITEM", "" ),
		BUTTON_LEFT = CoD.CPMPZMINV( "MENU_EQUIP_HEAVY_WEAPON", "", "", "MENU_DPAD_SESSION_SPECIFIC" ),
		BUTTON_RIGHT = CoD.CPMPZMINV( "MENU_TOGGLE_DNI_TACTICAL_MODE", "MENU_USE_SCORESTREAK", "MENU_PLACE_TRIPMINES", "" ),
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
		BUTTON_RBUMP = CoD.CPMPZMINV( "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_SPECIAL_GRENADE", "MENU_THROW_TACTICALS_OR_SPECIAL" ),
		BUTTON_UP = CoD.CPMPZMINV( "MENU_TOGGLE_ENHANCED_VISION", "MENU_SCORESTREAK_SELECTION", "MENU_USE_GOBBLEGUM", "" ),
		BUTTON_DOWN = CoD.CPMPZMINV( "MENU_CYBERNETIC_WHEEL_CONTROL", "MENU_SCORESTREAK_SELECTION", "MENU_EQUIP_SPECIAL_ITEM", "" ),
		BUTTON_LEFT = CoD.CPMPZMINV( "MENU_EQUIP_HEAVY_WEAPON", "", "", "MENU_DPAD_SESSION_SPECIFIC" ),
		BUTTON_RIGHT = CoD.CPMPZMINV( "MENU_TOGGLE_DNI_TACTICAL_MODE", "MENU_USE_SCORESTREAK", "MENU_PLACE_TRIPMINES", "" ),
		BUTTON_LTRIG = "MENU_AIM_DOWN_SIGHT",
		BUTTON_RTRIG = "MENU_THROW_FRAG_GRENADE",
		BUTTON_START = "MENU_OBJECTIVES_MENU",
		BUTTON_BACK = "MENU_SCOREBOARD",
		BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
		BUTTON_RSTICK = "MENU_MELEE_ATTACK"
	}
	f0_local0.ButtonStrings[CoD.BUTTONS_BUMPERTACTICAL + 1] = {
		BUTTON_A = CoD.CPMPZMINV( "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_TACTICAL_GRENADE", "MENU_THROW_SPECIAL_GRENADE", "MENU_THROW_TACTICALS_OR_SPECIAL" ),
		BUTTON_B = "MENU_MELEE_ATTACK",
		BUTTON_X = "MENU_USE_RELOAD",
		BUTTON_Y = "MENU_SWITCH_WEAPON",
		BUTTON_LBUMP = "MENU_JUMP",
		BUTTON_RBUMP = "MENU_THROW_FRAG_GRENADE",
		BUTTON_UP = CoD.CPMPZMINV( "MENU_TOGGLE_ENHANCED_VISION", "MENU_SCORESTREAK_SELECTION", "MENU_USE_GOBBLEGUM", "" ),
		BUTTON_DOWN = CoD.CPMPZMINV( "MENU_CYBERNETIC_WHEEL_CONTROL", "MENU_SCORESTREAK_SELECTION", "MENU_EQUIP_SPECIAL_ITEM", "" ),
		BUTTON_LEFT = CoD.CPMPZMINV( "MENU_EQUIP_HEAVY_WEAPON", "", "", "MENU_DPAD_SESSION_SPECIFIC" ),
		BUTTON_RIGHT = CoD.CPMPZMINV( "MENU_TOGGLE_DNI_TACTICAL_MODE", "MENU_USE_SCORESTREAK", "MENU_PLACE_TRIPMINES", "" ),
		BUTTON_LTRIG = "MENU_AIM_DOWN_SIGHT",
		BUTTON_RTRIG = "MENU_FIRE_WEAPON",
		BUTTON_START = "MENU_OBJECTIVES_MENU",
		BUTTON_BACK = "MENU_SCOREBOARD",
		BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
		BUTTON_RSTICK = "MENU_CROUCH_PRONE"
	}
end

local f0_local2 = function ( f6_arg0 )
	DataSources.ButtonLayoutLabels.m_buttonStringsTable = f0_local0.ButtonStrings[f6_arg0 + 1]
	DataSources.ButtonLayoutLabels.setModels()
end

local f0_local3 = function ( f7_arg0 )
	DataSources.ButtonLayoutLabels.m_isFlipped = f7_arg0 == CoD.TRIGGERS_FLIPPED
	DataSources.ButtonLayoutLabels.setModels()
end

local f0_local4 = function ( f8_arg0 )
	local f8_local0 = "gpad_buttonsConfig"
	local f8_local1 = {
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
			name = Engine.Localize( "MENU_BUMPERTACTICAL_CAPS" ),
			value = CoD.BUTTONS_BUMPERTACTICAL
		},
		{
			name = Engine.Localize( "MENU_STICKMOVE_CAPS" ),
			value = CoD.BUTTONS_STICKMOVE
		}
	}
	return {
		models = {
			name = "PLATFORM_BUTTON_LAYOUT_CAPS",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f8_arg0, "ButtonLayoutOptions_ButtonLayout", f8_local1, f8_local0, f0_local2, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f8_arg0, f8_local1, f8_local0 )
		},
		properties = {}
	}
end

local f0_local5 = function ( f9_arg0 )
	local f9_local0 = "flipped_control_config"
	local f9_local1 = {
		{
			name = Engine.Localize( "MENU_DEFAULT_CAPS" ),
			value = CoD.TRIGGERS_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_FLIPPED_CAPS" ),
			value = CoD.TRIGGERS_FLIPPED
		}
	}
	local f9_local2 = {
		models = {
			name = "PLATFORM_TRIGGER_CONFIG",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f9_arg0, "ButtonLayoutOptions_TriggerConfig", f9_local1, f9_local0, f0_local3, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f9_arg0, f9_local1, f9_local0 )
		},
		properties = {}
	}
	DataSources.ButtonLayoutLabels.m_isFlipped = f9_local2.models.currentSelection - 1 == CoD.TRIGGERS_FLIPPED
	return f9_local2
end

DataSources.ButtonLayout = DataSourceHelpers.ListSetup( "ButtonLayout", function ( f10_arg0 )
	local f10_local0 = {}
	table.insert( f10_local0, f0_local4( f10_arg0 ) )
	table.insert( f10_local0, f0_local5( f10_arg0 ) )
	return f10_local0
end, true )
if CoD.isPC then
	DataSources.ButtonLayoutDropdownPresets = DataSourceHelpers.ListSetup( "PC.ButtonLayoutDropdownPresets", function ( f11_arg0 )
		local f11_local0 = {}
		table.insert( f11_local0, {
			models = {
				value = CoD.BUTTONS_DEFAULT,
				valueDisplay = "MENU_DEFAULT_CAPS"
			}
		} )
		table.insert( f11_local0, {
			models = {
				value = CoD.BUTTONS_EXPERIMENTAL,
				valueDisplay = "MENU_TACTICAL_CAPS"
			}
		} )
		table.insert( f11_local0, {
			models = {
				value = CoD.BUTTONS_LEFTY,
				valueDisplay = "MENU_LEFTY_CAPS"
			}
		} )
		table.insert( f11_local0, {
			models = {
				value = CoD.BUTTONS_NOMAD,
				valueDisplay = "MENU_NOMAD_CAPS"
			}
		} )
		table.insert( f11_local0, {
			models = {
				value = CoD.BUTTONS_CHARLIE,
				valueDisplay = "MENU_CHARLIE_CAPS"
			}
		} )
		table.insert( f11_local0, {
			models = {
				value = CoD.BUTTONS_GUNSLINGER,
				valueDisplay = "MENU_GUNSLINGER_CAPS"
			}
		} )
		table.insert( f11_local0, {
			models = {
				value = CoD.BUTTONS_BUMPERJUMPER,
				valueDisplay = "MENU_BUMPERJUMPER_CAPS"
			}
		} )
		table.insert( f11_local0, {
			models = {
				value = CoD.BUTTONS_BUMPERTACTICAL,
				valueDisplay = "MENU_BUMPERTACTICAL_CAPS"
			}
		} )
		table.insert( f11_local0, {
			models = {
				value = CoD.BUTTONS_STICKMOVE,
				valueDisplay = "MENU_STICKMOVE_CAPS"
			}
		} )
		return f11_local0
	end, true )
	DataSources.ButtonLayoutDropdown = DataSourceHelpers.ListSetup( "ButtonLayoutDropdown", function ( f12_arg0 )
		local f12_local0 = {}
		table.insert( f12_local0, {
			models = {
				label = "PLATFORM_BUTTON_LAYOUT_CAPS",
				profileVarName = "gpad_buttonsConfig",
				profileType = "user",
				datasource = "ButtonLayoutDropdownPresets",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
		table.insert( f12_local0, {
			models = {
				label = "PLATFORM_TRIGGER_CONFIG_CAPS",
				profileVarName = "flipped_control_config",
				profileType = "user",
				lowValue = 0,
				highValue = 1,
				widgetType = "checkbox"
			},
			properties = {
				checkboxAction = function ( f13_arg0, f13_arg1 )
					CoD.PCUtil.OptionsCheckboxAction( f13_arg0, f13_arg1 )
					local f13_local0 = f13_arg1:getModel()
					if f13_local0 then
						local f13_local1 = CoD.PCUtil.GetOptionInfo( f13_local0, f13_arg0 )
						f0_local3( f13_local1.currentValue )
					end
				end
			}
		} )
		return f12_local0
	end, true )
	DataSources.ButtonLayoutDropdown.getWidgetTypeForItem = function ( f14_arg0, f14_arg1, f14_arg2 )
		if f14_arg1 then
			local f14_local0 = Engine.GetModelValue( Engine.GetModel( f14_arg1, "widgetType" ) )
			if f14_local0 == "dropdown" then
				return CoD.OptionDropdown
			elseif f14_local0 == "checkbox" then
				return CoD.StartMenu_Options_CheckBoxOption
			end
		end
		return nil
	end
	
end
local PreLoadFunc = function ()
	f0_local1()
end

local f0_local7 = function ( f16_arg0, f16_arg1, f16_arg2 )
	f16_arg0:dispatchEventToChildren( {
		name = "options_refresh",
		controller = f16_arg1
	} )
	f16_arg0:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f17_local0 = 1, element.buttonLayoutDropdownList.requestedRowCount, 1 do
			local f17_local3 = element.buttonLayoutDropdownList:getItemAtPosition( f17_local0, 1 )
			if event.inUse then
				if f17_local3 ~= event.widget then
					f17_local3.m_inputDisabled = true
				end
			end
			f17_local3.m_inputDisabled = nil
		end
	end )
	f16_arg0.buttonLayoutDropdownList.m_managedItemPriority = true
	f16_arg0.buttonLayoutDropdownList:registerEventHandler( "dropdown_triggered", function ( element, event )
		if not event.inUse then
			f0_local2( event.widget.dropDownCurrentValue( f16_arg1, element ) )
			CoD.PCUtil.RefreshAllOptions( f16_arg0, f16_arg1 )
		end
		element:dispatchEventToParent( event )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	self.buttonLayoutButtonList.navigation = nil
	self.buttonLayoutDropdownList.navigation = nil
	if CoD.isPC then
		f0_local7( self, controller, menu )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ()
		Engine.UnsubscribeAndFreeModel( DataSources.ButtonLayoutLabels.getModel( controller ) )
	end )
end

LUI.createMenu.StartMenu_Options_Controls_ButtonLayout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls_ButtonLayout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
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
	buttonLayoutButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	buttonLayoutButtonList:setVerticalCount( 2 )
	buttonLayoutButtonList:setDataSource( "ButtonLayout" )
	self:addElement( buttonLayoutButtonList )
	self.buttonLayoutButtonList = buttonLayoutButtonList
	
	local durangoControllerImage = LUI.UIImage.new()
	durangoControllerImage:setLeftRight( true, false, 415, 865 )
	durangoControllerImage:setTopBottom( true, false, 234, 684 )
	durangoControllerImage:setAlpha( 0 )
	durangoControllerImage:setImage( RegisterImage( ImageIsOnlyOnDurangoOrPc( "uie_xenonone_controller_top" ) ) )
	self:addElement( durangoControllerImage )
	self.durangoControllerImage = durangoControllerImage
	
	local orbisControllerImage = LUI.UIImage.new()
	orbisControllerImage:setLeftRight( true, false, 415, 865 )
	orbisControllerImage:setTopBottom( true, false, 234, 684 )
	orbisControllerImage:setImage( RegisterImage( ImageIsEverywhereButDurango( "uie_ps4_controller_top" ) ) )
	self:addElement( orbisControllerImage )
	self.orbisControllerImage = orbisControllerImage
	
	local vitaControllerImage = LUI.UIImage.new()
	vitaControllerImage:setLeftRight( true, false, 131.4, 1147.5 )
	vitaControllerImage:setTopBottom( true, false, 226.5, 680.5 )
	vitaControllerImage:setImage( RegisterImage( ImageIsOnlyOnOrbis( "uie_img_t7_menu_startmenu_option_psvita" ) ) )
	self:addElement( vitaControllerImage )
	self.vitaControllerImage = vitaControllerImage
	
	local leftStickText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftStickText:setLeftRight( true, false, 379.5, 579.5 )
	leftStickText:setTopBottom( true, false, 592, 617 )
	leftStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftStickText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "leftStick", function ( model )
		leftStickText:setModel( model, controller )
	end )
	self:addElement( leftStickText )
	self.leftStickText = leftStickText
	
	local leftTriggerText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftTriggerText:setLeftRight( true, false, 162.5, 444.5 )
	leftTriggerText:setTopBottom( true, false, 283, 308 )
	leftTriggerText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftTriggerText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "leftTrig", function ( model )
		leftTriggerText:setModel( model, controller )
	end )
	self:addElement( leftTriggerText )
	self.leftTriggerText = leftTriggerText
	
	local leftBumperText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftBumperText:setLeftRight( true, false, 131.4, 411.5 )
	leftBumperText:setTopBottom( true, false, 309.5, 334.5 )
	leftBumperText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftBumperText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "lb", function ( model )
		leftBumperText:setModel( model, controller )
	end )
	self:addElement( leftBumperText )
	self.leftBumperText = leftBumperText
	
	local rightStickText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightStickText:setLeftRight( true, false, 695, 895 )
	rightStickText:setTopBottom( true, false, 592, 617 )
	rightStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rightStick", function ( model )
		rightStickText:setModel( model, controller )
	end )
	self:addElement( rightStickText )
	self.rightStickText = rightStickText
	
	local rightTriggerText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightTriggerText:setLeftRight( true, false, 831.5, 1190.5 )
	rightTriggerText:setTopBottom( true, false, 270.5, 295.5 )
	rightTriggerText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightTriggerText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rightTrig", function ( model )
		rightTriggerText:setModel( model, controller )
	end )
	self:addElement( rightTriggerText )
	self.rightTriggerText = rightTriggerText
	
	local rightBumperText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightBumperText:setLeftRight( true, false, 852.5, 1190.5 )
	rightBumperText:setTopBottom( true, false, 308, 333 )
	rightBumperText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightBumperText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rb", function ( model )
		rightBumperText:setModel( model, controller )
	end )
	self:addElement( rightBumperText )
	self.rightBumperText = rightBumperText
	
	local XBAPSCrossText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	XBAPSCrossText:setLeftRight( true, false, 947.5, 1147.5 )
	XBAPSCrossText:setTopBottom( true, false, 466, 491 )
	XBAPSCrossText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBAPSCrossText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbA_psCross", function ( model )
		XBAPSCrossText:setModel( model, controller )
	end )
	self:addElement( XBAPSCrossText )
	self.XBAPSCrossText = XBAPSCrossText
	
	local XBBPSCircleText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	XBBPSCircleText:setLeftRight( true, false, 947.5, 1216 )
	XBBPSCircleText:setTopBottom( true, false, 434, 459 )
	XBBPSCircleText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBBPSCircleText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbB_psCircle", function ( model )
		XBBPSCircleText:setModel( model, controller )
	end )
	self:addElement( XBBPSCircleText )
	self.XBBPSCircleText = XBBPSCircleText
	
	local XBXPSSquareText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	XBXPSSquareText:setLeftRight( true, false, 947.5, 1216 )
	XBXPSSquareText:setTopBottom( true, false, 404.79, 429.79 )
	XBXPSSquareText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBXPSSquareText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbX_psSquare", function ( model )
		XBXPSSquareText:setModel( model, controller )
	end )
	self:addElement( XBXPSSquareText )
	self.XBXPSSquareText = XBXPSSquareText
	
	local XBYPSTriangleText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	XBYPSTriangleText:setLeftRight( true, false, 947.5, 1216 )
	XBYPSTriangleText:setTopBottom( true, false, 375, 400 )
	XBYPSTriangleText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBYPSTriangleText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbY_psTriangle", function ( model )
		XBYPSTriangleText:setModel( model, controller )
	end )
	self:addElement( XBYPSTriangleText )
	self.XBYPSTriangleText = XBYPSTriangleText
	
	local backButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	backButtonText:setLeftRight( true, false, 540, 740 )
	backButtonText:setTopBottom( true, false, 283, 308 )
	backButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	backButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "back", function ( model )
		backButtonText:setModel( model, controller )
	end )
	self:addElement( backButtonText )
	self.backButtonText = backButtonText
	
	local startButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	startButtonText:setLeftRight( true, false, 620, 820 )
	startButtonText:setTopBottom( true, false, 245.5, 270.5 )
	startButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	startButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "start", function ( model )
		startButtonText:setModel( model, controller )
	end )
	self:addElement( startButtonText )
	self.startButtonText = startButtonText
	
	local leftButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftButtonText:setLeftRight( true, false, 74, 336.5 )
	leftButtonText:setTopBottom( true, false, 434, 459 )
	leftButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "leftDpad", function ( model )
		leftButtonText:setModel( model, controller )
	end )
	self:addElement( leftButtonText )
	self.leftButtonText = leftButtonText
	
	local rightButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightButtonText:setLeftRight( true, false, 74, 336.5 )
	rightButtonText:setTopBottom( true, false, 404.79, 429.79 )
	rightButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rightButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rightDpad", function ( model )
		rightButtonText:setModel( model, controller )
	end )
	self:addElement( rightButtonText )
	self.rightButtonText = rightButtonText
	
	local upButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	upButtonText:setLeftRight( true, false, 74, 337 )
	upButtonText:setTopBottom( true, false, 375, 400 )
	upButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	upButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "upDpad", function ( model )
		upButtonText:setModel( model, controller )
	end )
	self:addElement( upButtonText )
	self.upButtonText = upButtonText
	
	local downButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	downButtonText:setLeftRight( true, false, 74, 337 )
	downButtonText:setTopBottom( true, false, 466, 491 )
	downButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	downButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "downDpad", function ( model )
		downButtonText:setModel( model, controller )
	end )
	self:addElement( downButtonText )
	self.downButtonText = downButtonText
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "PLATFORM_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "PLATFORM_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
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
	OrbisLines:setImage( RegisterImage( ImageIsEverywhereButDurango( AppendCurrentSessionMode( "uie_img_t7_menu_startmenu_option_lines_orbis" ) ) ) )
	self:addElement( OrbisLines )
	self.OrbisLines = OrbisLines
	
	local DurangoLines = LUI.UIImage.new()
	DurangoLines:setLeftRight( true, false, 375.5, 1047.5 )
	DurangoLines:setTopBottom( true, false, 273.5, 633.5 )
	DurangoLines:setImage( RegisterImage( ImageIsOnlyOnDurangoOrPc( AppendCurrentSessionMode( "uie_img_t7_menu_startmenu_option_lines_durango" ) ) ) )
	self:addElement( DurangoLines )
	self.DurangoLines = DurangoLines
	
	local buttonLayoutDropdownList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	buttonLayoutDropdownList:makeFocusable()
	buttonLayoutDropdownList:setLeftRight( true, false, 74, 574 )
	buttonLayoutDropdownList:setTopBottom( true, false, 130, 198 )
	buttonLayoutDropdownList:setAlpha( 0 )
	buttonLayoutDropdownList:setWidgetType( CoD.OptionDropdown )
	buttonLayoutDropdownList:setVerticalCount( 2 )
	buttonLayoutDropdownList:setSpacing( 0 )
	buttonLayoutDropdownList:setDataSource( "ButtonLayoutDropdown" )
	self:addElement( buttonLayoutDropdownList )
	self.buttonLayoutDropdownList = buttonLayoutDropdownList
	
	local VitaLines = LUI.UIImage.new()
	VitaLines:setLeftRight( true, false, 349, 926.63 )
	VitaLines:setTopBottom( true, false, 232.51, 551.49 )
	VitaLines:setImage( RegisterImage( ImageIsOnlyOnOrbis( "uie_img_t7_menu_startmenu_option_lines_vita" ) ) )
	self:addElement( VitaLines )
	self.VitaLines = VitaLines
	
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
				self:setupElementClipCounter( 27 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				buttonLayoutButtonList:completeAnimation()
				self.buttonLayoutButtonList:setAlpha( 0 )
				self.clipFinished( buttonLayoutButtonList, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickText:completeAnimation()
				self.leftStickText:setAlpha( 0 )
				self.clipFinished( leftStickText, {} )
				leftTriggerText:completeAnimation()
				self.leftTriggerText:setAlpha( 0 )
				self.clipFinished( leftTriggerText, {} )
				leftBumperText:completeAnimation()
				self.leftBumperText:setAlpha( 0 )
				self.clipFinished( leftBumperText, {} )
				rightStickText:completeAnimation()
				self.rightStickText:setAlpha( 0 )
				self.clipFinished( rightStickText, {} )
				rightTriggerText:completeAnimation()
				self.rightTriggerText:setAlpha( 0 )
				self.clipFinished( rightTriggerText, {} )
				rightBumperText:completeAnimation()
				self.rightBumperText:setAlpha( 0 )
				self.clipFinished( rightBumperText, {} )
				XBAPSCrossText:completeAnimation()
				self.XBAPSCrossText:setAlpha( 0 )
				self.clipFinished( XBAPSCrossText, {} )
				XBBPSCircleText:completeAnimation()
				self.XBBPSCircleText:setAlpha( 0 )
				self.clipFinished( XBBPSCircleText, {} )
				XBXPSSquareText:completeAnimation()
				self.XBXPSSquareText:setAlpha( 0 )
				self.clipFinished( XBXPSSquareText, {} )
				XBYPSTriangleText:completeAnimation()
				self.XBYPSTriangleText:setAlpha( 0 )
				self.clipFinished( XBYPSTriangleText, {} )
				backButtonText:completeAnimation()
				self.backButtonText:setAlpha( 0 )
				self.clipFinished( backButtonText, {} )
				startButtonText:completeAnimation()
				self.startButtonText:setAlpha( 0 )
				self.clipFinished( startButtonText, {} )
				leftButtonText:completeAnimation()
				self.leftButtonText:setAlpha( 0 )
				self.clipFinished( leftButtonText, {} )
				rightButtonText:completeAnimation()
				self.rightButtonText:setAlpha( 0 )
				self.clipFinished( rightButtonText, {} )
				upButtonText:completeAnimation()
				self.upButtonText:setAlpha( 0 )
				self.clipFinished( upButtonText, {} )
				downButtonText:completeAnimation()
				self.downButtonText:setAlpha( 0 )
				self.clipFinished( downButtonText, {} )
				MenuFrame:completeAnimation()
				self.MenuFrame:setAlpha( 0 )
				self.clipFinished( MenuFrame, {} )
				StartMenulineGraphicsOptions0:completeAnimation()
				self.StartMenulineGraphicsOptions0:setAlpha( 0 )
				self.clipFinished( StartMenulineGraphicsOptions0, {} )
				OrbisLines:completeAnimation()
				self.OrbisLines:setAlpha( 0 )
				self.clipFinished( OrbisLines, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setAlpha( 0 )
				self.clipFinished( DurangoLines, {} )
				buttonLayoutDropdownList:completeAnimation()
				self.buttonLayoutDropdownList:setAlpha( 0 )
				self.clipFinished( buttonLayoutDropdownList, {} )
				VitaLines:completeAnimation()
				self.VitaLines:setAlpha( 0 )
				self.clipFinished( VitaLines, {} )
			end
		},
		Orbis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickText:completeAnimation()
				leftStickText.defaultText:completeAnimation()
				self.leftStickText:setLeftRight( true, false, 408, 608 )
				self.leftStickText:setTopBottom( true, false, 591, 616 )
				self.leftStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( leftStickText, {} )
				leftTriggerText:completeAnimation()
				self.leftTriggerText:setLeftRight( true, false, 162.5, 444.5 )
				self.leftTriggerText:setTopBottom( true, false, 283, 308 )
				self.clipFinished( leftTriggerText, {} )
				leftBumperText:completeAnimation()
				self.leftBumperText:setLeftRight( true, false, 131.4, 411.5 )
				self.leftBumperText:setTopBottom( true, false, 309.5, 334.5 )
				self.clipFinished( leftBumperText, {} )
				rightStickText:completeAnimation()
				rightStickText.defaultText:completeAnimation()
				self.rightStickText:setLeftRight( true, false, 672, 872 )
				self.rightStickText:setTopBottom( true, false, 591, 616 )
				self.rightStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( rightStickText, {} )
				rightTriggerText:completeAnimation()
				self.rightTriggerText:setLeftRight( true, false, 831.5, 1190.5 )
				self.rightTriggerText:setTopBottom( true, false, 270.5, 295.5 )
				self.clipFinished( rightTriggerText, {} )
				rightBumperText:completeAnimation()
				self.rightBumperText:setLeftRight( true, false, 852.5, 1190.5 )
				self.rightBumperText:setTopBottom( true, false, 308, 333 )
				self.clipFinished( rightBumperText, {} )
				XBAPSCrossText:completeAnimation()
				self.XBAPSCrossText:setLeftRight( true, false, 947.5, 1147.5 )
				self.XBAPSCrossText:setTopBottom( true, false, 466, 491 )
				self.clipFinished( XBAPSCrossText, {} )
				XBBPSCircleText:completeAnimation()
				self.XBBPSCircleText:setLeftRight( true, false, 947.5, 1216 )
				self.XBBPSCircleText:setTopBottom( true, false, 434, 459 )
				self.clipFinished( XBBPSCircleText, {} )
				XBXPSSquareText:completeAnimation()
				self.XBXPSSquareText:setLeftRight( true, false, 947.5, 1216 )
				self.XBXPSSquareText:setTopBottom( true, false, 404.79, 429.79 )
				self.clipFinished( XBXPSSquareText, {} )
				XBYPSTriangleText:completeAnimation()
				self.XBYPSTriangleText:setLeftRight( true, false, 947.5, 1216 )
				self.XBYPSTriangleText:setTopBottom( true, false, 375, 400 )
				self.clipFinished( XBYPSTriangleText, {} )
				backButtonText:completeAnimation()
				self.backButtonText:setLeftRight( true, false, 540, 740 )
				self.backButtonText:setTopBottom( true, false, 283, 308 )
				self.backButtonText:setAlpha( 1 )
				self.clipFinished( backButtonText, {} )
				startButtonText:completeAnimation()
				startButtonText.defaultText:completeAnimation()
				self.startButtonText:setLeftRight( true, false, 620, 820 )
				self.startButtonText:setTopBottom( true, false, 245.5, 270.5 )
				self.startButtonText:setAlpha( 1 )
				self.startButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( startButtonText, {} )
				leftButtonText:completeAnimation()
				self.leftButtonText:setLeftRight( true, false, 74, 336.5 )
				self.leftButtonText:setTopBottom( true, false, 434, 459 )
				self.leftButtonText:setAlpha( 1 )
				self.clipFinished( leftButtonText, {} )
				rightButtonText:completeAnimation()
				self.rightButtonText:setLeftRight( true, false, 74, 336.5 )
				self.rightButtonText:setTopBottom( true, false, 404.79, 429.79 )
				self.rightButtonText:setAlpha( 1 )
				self.clipFinished( rightButtonText, {} )
				upButtonText:completeAnimation()
				self.upButtonText:setLeftRight( true, false, 74, 337 )
				self.upButtonText:setTopBottom( true, false, 375, 400 )
				self.upButtonText:setAlpha( 1 )
				self.clipFinished( upButtonText, {} )
				downButtonText:completeAnimation()
				self.downButtonText:setLeftRight( true, false, 74, 337 )
				self.downButtonText:setTopBottom( true, false, 466, 491 )
				self.downButtonText:setAlpha( 1 )
				self.clipFinished( downButtonText, {} )
				OrbisLines:completeAnimation()
				self.OrbisLines:setAlpha( 1 )
				self.clipFinished( OrbisLines, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setAlpha( 0 )
				self.clipFinished( DurangoLines, {} )
				VitaLines:completeAnimation()
				self.VitaLines:setAlpha( 0 )
				self.clipFinished( VitaLines, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 1 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickText:completeAnimation()
				self.leftStickText:setLeftRight( true, false, 64, 405.5 )
				self.leftStickText:setTopBottom( true, false, 404.79, 429.79 )
				self.clipFinished( leftStickText, {} )
				leftTriggerText:completeAnimation()
				self.leftTriggerText:setLeftRight( true, false, 64, 441 )
				self.leftTriggerText:setTopBottom( true, false, 273.5, 298.5 )
				self.clipFinished( leftTriggerText, {} )
				leftBumperText:completeAnimation()
				self.leftBumperText:setLeftRight( true, false, 64, 420 )
				self.leftBumperText:setTopBottom( true, false, 309.5, 334.5 )
				self.clipFinished( leftBumperText, {} )
				rightStickText:completeAnimation()
				self.rightStickText:setLeftRight( true, false, 483, 920 )
				self.rightStickText:setTopBottom( true, false, 586.09, 611.09 )
				self.clipFinished( rightStickText, {} )
				rightTriggerText:completeAnimation()
				self.rightTriggerText:setLeftRight( true, false, 835.5, 1216 )
				self.rightTriggerText:setTopBottom( true, false, 270.5, 295.5 )
				self.clipFinished( rightTriggerText, {} )
				rightBumperText:completeAnimation()
				self.rightBumperText:setLeftRight( true, false, 856.5, 1216 )
				self.rightBumperText:setTopBottom( true, false, 308, 333 )
				self.clipFinished( rightBumperText, {} )
				XBAPSCrossText:completeAnimation()
				self.XBAPSCrossText:setLeftRight( true, false, 939.5, 1216 )
				self.XBAPSCrossText:setTopBottom( true, false, 466, 491 )
				self.clipFinished( XBAPSCrossText, {} )
				XBBPSCircleText:completeAnimation()
				self.XBBPSCircleText:setLeftRight( true, false, 939.5, 1216 )
				self.XBBPSCircleText:setTopBottom( true, false, 434, 459 )
				self.clipFinished( XBBPSCircleText, {} )
				XBXPSSquareText:completeAnimation()
				self.XBXPSSquareText:setLeftRight( true, false, 939.5, 1216 )
				self.XBXPSSquareText:setTopBottom( true, false, 404.79, 429.79 )
				self.clipFinished( XBXPSSquareText, {} )
				XBYPSTriangleText:completeAnimation()
				self.XBYPSTriangleText:setLeftRight( true, false, 939.5, 1216 )
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
				self.leftButtonText:setLeftRight( true, false, 64, 405 )
				self.leftButtonText:setTopBottom( true, false, 485.5, 510.5 )
				self.clipFinished( leftButtonText, {} )
				rightButtonText:completeAnimation()
				self.rightButtonText:setLeftRight( true, false, 64, 404.5 )
				self.rightButtonText:setTopBottom( true, false, 511, 536 )
				self.clipFinished( rightButtonText, {} )
				upButtonText:completeAnimation()
				self.upButtonText:setLeftRight( true, false, 69, 405.5 )
				self.upButtonText:setTopBottom( true, false, 453.5, 478.5 )
				self.clipFinished( upButtonText, {} )
				downButtonText:completeAnimation()
				self.downButtonText:setLeftRight( true, false, 64, 405 )
				self.downButtonText:setTopBottom( true, false, 541, 566 )
				self.clipFinished( downButtonText, {} )
				OrbisLines:completeAnimation()
				self.OrbisLines:setAlpha( 0 )
				self.clipFinished( OrbisLines, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setLeftRight( true, false, 413.5, 934.5 )
				self.DurangoLines:setTopBottom( true, false, 283, 586.09 )
				self.clipFinished( DurangoLines, {} )
				VitaLines:completeAnimation()
				self.VitaLines:setAlpha( 0 )
				self.clipFinished( VitaLines, {} )
			end
		},
		PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				buttonLayoutButtonList:completeAnimation()
				self.buttonLayoutButtonList:setAlpha( 0 )
				self.clipFinished( buttonLayoutButtonList, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setAlpha( 0 )
				self.clipFinished( DurangoLines, {} )
				buttonLayoutDropdownList:completeAnimation()
				self.buttonLayoutDropdownList:setAlpha( 1 )
				self.clipFinished( buttonLayoutDropdownList, {} )
				VitaLines:completeAnimation()
				self.VitaLines:setAlpha( 0 )
				self.clipFinished( VitaLines, {} )
			end
		},
		Vita = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setLeftRight( true, false, 151.39, 1130.11 )
				self.vitaControllerImage:setTopBottom( true, false, 228.85, 666.15 )
				self.vitaControllerImage:setAlpha( 1 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickText:completeAnimation()
				self.leftStickText:setLeftRight( true, false, 248, 448 )
				self.leftStickText:setTopBottom( true, false, 571, 596 )
				self.clipFinished( leftStickText, {} )
				leftTriggerText:completeAnimation()
				self.leftTriggerText:setLeftRight( true, false, 184, 384 )
				self.leftTriggerText:setTopBottom( true, false, 251, 276 )
				self.clipFinished( leftTriggerText, {} )
				leftBumperText:completeAnimation()
				self.leftBumperText:setLeftRight( true, false, 248, 448 )
				self.leftBumperText:setTopBottom( true, false, 488, 513 )
				self.clipFinished( leftBumperText, {} )
				rightStickText:completeAnimation()
				rightStickText.defaultText:completeAnimation()
				self.rightStickText:setLeftRight( true, false, 832, 1032 )
				self.rightStickText:setTopBottom( true, false, 571, 596 )
				self.rightStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( rightStickText, {} )
				rightTriggerText:completeAnimation()
				self.rightTriggerText:setLeftRight( true, false, 896, 1096 )
				self.rightTriggerText:setTopBottom( true, false, 251, 276 )
				self.clipFinished( rightTriggerText, {} )
				rightBumperText:completeAnimation()
				self.rightBumperText:setLeftRight( true, false, 832, 1032 )
				self.rightBumperText:setTopBottom( true, false, 488, 513 )
				self.clipFinished( rightBumperText, {} )
				XBAPSCrossText:completeAnimation()
				self.XBAPSCrossText:setLeftRight( true, false, 896, 1096 )
				self.XBAPSCrossText:setTopBottom( true, false, 400, 425 )
				self.clipFinished( XBAPSCrossText, {} )
				XBBPSCircleText:completeAnimation()
				self.XBBPSCircleText:setLeftRight( true, false, 896, 1164.5 )
				self.XBBPSCircleText:setTopBottom( true, false, 335.79, 360.79 )
				self.clipFinished( XBBPSCircleText, {} )
				XBXPSSquareText:completeAnimation()
				self.XBXPSSquareText:setLeftRight( true, false, 896, 1164.5 )
				self.XBXPSSquareText:setTopBottom( true, false, 366, 391 )
				self.clipFinished( XBXPSSquareText, {} )
				XBYPSTriangleText:completeAnimation()
				self.XBYPSTriangleText:setLeftRight( true, false, 896, 1164.5 )
				self.XBYPSTriangleText:setTopBottom( true, false, 303, 328 )
				self.clipFinished( XBYPSTriangleText, {} )
				backButtonText:completeAnimation()
				self.backButtonText:setLeftRight( true, false, 544, 736 )
				self.backButtonText:setTopBottom( true, false, 368, 393 )
				self.backButtonText:setAlpha( 1 )
				self.clipFinished( backButtonText, {} )
				startButtonText:completeAnimation()
				startButtonText.defaultText:completeAnimation()
				self.startButtonText:setLeftRight( true, false, 896, 1088 )
				self.startButtonText:setTopBottom( true, false, 443, 468 )
				self.startButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( startButtonText, {} )
				leftButtonText:completeAnimation()
				self.leftButtonText:setLeftRight( true, false, 121.5, 384 )
				self.leftButtonText:setTopBottom( true, false, 363.5, 388.5 )
				self.clipFinished( leftButtonText, {} )
				rightButtonText:completeAnimation()
				self.rightButtonText:setLeftRight( true, false, 89, 351.5 )
				self.rightButtonText:setTopBottom( true, false, 332.79, 357.79 )
				self.rightButtonText:setAlpha( 0 )
				self.clipFinished( rightButtonText, {} )
				upButtonText:completeAnimation()
				self.upButtonText:setLeftRight( true, false, 89, 352 )
				self.upButtonText:setTopBottom( true, false, 303, 328 )
				self.upButtonText:setAlpha( 0 )
				self.clipFinished( upButtonText, {} )
				downButtonText:completeAnimation()
				self.downButtonText:setLeftRight( true, false, 121.5, 384.5 )
				self.downButtonText:setTopBottom( true, false, 331, 356 )
				self.clipFinished( downButtonText, {} )
				OrbisLines:completeAnimation()
				self.OrbisLines:setAlpha( 0 )
				self.clipFinished( OrbisLines, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setAlpha( 0 )
				self.clipFinished( DurangoLines, {} )
				VitaLines:completeAnimation()
				self.VitaLines:setLeftRight( true, false, 343.18, 937 )
				self.VitaLines:setTopBottom( true, false, 264.5, 584.5 )
				self.VitaLines:setAlpha( 1 )
				self.clipFinished( VitaLines, {} )
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
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		},
		{
			stateName = "Vita",
			condition = function ( menu, element, event )
				return IsVitaGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f21_local29 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f21_local29( self, event )
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
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f49_local0 = nil
		if IsPC() then
			SetFocusToElement( self, "buttonLayoutDropdownList", controller )
		end
		if not f49_local0 then
			f49_local0 = self:dispatchEventToChildren( event )
		end
		return f49_local0
	end )
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
		element.leftStickText:close()
		element.leftTriggerText:close()
		element.leftBumperText:close()
		element.rightStickText:close()
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
		element.MenuFrame:close()
		element.StartMenulineGraphicsOptions0:close()
		element.buttonLayoutDropdownList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_ButtonLayout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

