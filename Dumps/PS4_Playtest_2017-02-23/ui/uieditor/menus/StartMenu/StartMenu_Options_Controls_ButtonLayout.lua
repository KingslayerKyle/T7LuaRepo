require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Controls_GenericControllerItem" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )

local ButtonLayout = {}
DataSources.ButtonLayoutLabels = {
	m_isFlipped = false,
	getModel = function ( controller )
		DataSources.ButtonLayoutLabels.m_lastController = controller
		local buttonLayoutLabelsModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonLayoutLabels" )
		if buttonLayoutLabelsModel == nil then
			buttonLayoutLabelsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ButtonLayoutLabels" )
			local createBaseModel = function ( modelStart )
				Engine.CreateModel( buttonLayoutLabelsModel, modelStart .. ".text" )
				Engine.CreateModel( buttonLayoutLabelsModel, modelStart .. ".isDefault" )
			end
			
			createBaseModel( "xbA_psCross" )
			createBaseModel( "xbB_psCircle" )
			createBaseModel( "xbX_psSquare" )
			createBaseModel( "xbY_psTriangle" )
			createBaseModel( "back" )
			createBaseModel( "start" )
			createBaseModel( "lb" )
			createBaseModel( "rb" )
			createBaseModel( "leftTrig" )
			createBaseModel( "rightTrig" )
			createBaseModel( "leftDpad" )
			createBaseModel( "rightDpad" )
			createBaseModel( "upDpad" )
			createBaseModel( "downDpad" )
			createBaseModel( "leftStick" )
			createBaseModel( "rightStick" )
		end
		return buttonLayoutLabelsModel
	end,
	setButtonModel = function ( buttonLayoutLabelsModel, buttonStringsTable, modelName, button )
		Engine.SetModelValue( Engine.CreateModel( buttonLayoutLabelsModel, modelName .. ".text" ), buttonStringsTable[button] )
		Engine.SetModelValue( Engine.CreateModel( buttonLayoutLabelsModel, modelName .. ".isDefault" ), buttonStringsTable[button] == ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_DEFAULT + 1][button] )
	end,
	setModels = function ()
		local controller = DataSources.ButtonLayoutLabels.m_lastController
		local buttonStringsTable = DataSources.ButtonLayoutLabels.m_buttonStringsTable
		local buttonLayoutLabelsModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonLayoutLabels" )
		if not buttonLayoutLabelsModel or not buttonStringsTable then
			return 
		end
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "xbA_psCross", "BUTTON_A" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "xbB_psCircle", "BUTTON_B" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "xbX_psSquare", "BUTTON_X" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "xbY_psTriangle", "BUTTON_Y" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "back", "BUTTON_BACK" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "start", "BUTTON_START" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "leftDpad", "BUTTON_LEFT" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "rightDpad", "BUTTON_RIGHT" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "upDpad", "BUTTON_UP" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "downDpad", "BUTTON_DOWN" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "leftStick", "BUTTON_LSTICK" )
		DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "rightStick", "BUTTON_RSTICK" )
		if DataSources.ButtonLayoutLabels.m_isFlipped then
			DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "lb", "BUTTON_LTRIG" )
			DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "rb", "BUTTON_RTRIG" )
			DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "leftTrig", "BUTTON_LBUMP" )
			DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "rightTrig", "BUTTON_RBUMP" )
		else
			DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "lb", "BUTTON_LBUMP" )
			DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "rb", "BUTTON_RBUMP" )
			DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "leftTrig", "BUTTON_LTRIG" )
			DataSources.ButtonLayoutLabels.setButtonModel( buttonLayoutLabelsModel, buttonStringsTable, "rightTrig", "BUTTON_RTRIG" )
		end
	end
}
ButtonLayout.ButtonStrings = {}
local UpdateButtonStrings = function ()
	ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_DEFAULT + 1] = {
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
	ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_EXPERIMENTAL + 1] = {
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
	ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_LEFTY + 1] = {
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
	ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_NOMAD + 1] = {
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
	ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_CHARLIE + 1] = {
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
	ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_BUMPERJUMPER + 1] = {
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
	ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_STICKMOVE + 1] = {
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
	ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_GUNSLINGER + 1] = {
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
	ButtonLayout.ButtonStrings[Enum.GPadButtonConfigs.BUTTONS_BUMPERTACTICAL + 1] = {
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

local SetButtonLayoutDisplayValues = function ( value )
	DataSources.ButtonLayoutLabels.m_buttonStringsTable = ButtonLayout.ButtonStrings[value + 1]
	DataSources.ButtonLayoutLabels.setModels()
end

local ToggleFlippedShoulderButtons = function ( value )
	DataSources.ButtonLayoutLabels.m_isFlipped = value == 1
	DataSources.ButtonLayoutLabels.setModels()
end

local CreateModels_ButtonLayout = function ( controller )
	local profileVar = "gpad_buttonsConfig"
	local options = {
		{
			name = Engine.Localize( "MENU_DEFAULT_CAPS" ),
			value = Enum.GPadButtonConfigs.BUTTONS_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_TACTICAL_CAPS" ),
			value = Enum.GPadButtonConfigs.BUTTONS_EXPERIMENTAL
		},
		{
			name = Engine.Localize( "MENU_LEFTY_CAPS" ),
			value = Enum.GPadButtonConfigs.BUTTONS_LEFTY
		},
		{
			name = Engine.Localize( "MENU_NOMAD_CAPS" ),
			value = Enum.GPadButtonConfigs.BUTTONS_NOMAD
		},
		{
			name = Engine.Localize( "MENU_CHARLIE_CAPS" ),
			value = Enum.GPadButtonConfigs.BUTTONS_CHARLIE
		},
		{
			name = Engine.Localize( "MENU_GUNSLINGER_CAPS" ),
			value = Enum.GPadButtonConfigs.BUTTONS_GUNSLINGER
		},
		{
			name = Engine.Localize( "MENU_BUMPERJUMPER_CAPS" ),
			value = Enum.GPadButtonConfigs.BUTTONS_BUMPERJUMPER
		},
		{
			name = Engine.Localize( "MENU_BUMPERTACTICAL_CAPS" ),
			value = Enum.GPadButtonConfigs.BUTTONS_BUMPERTACTICAL
		},
		{
			name = Engine.Localize( "MENU_STICKMOVE_CAPS" ),
			value = Enum.GPadButtonConfigs.BUTTONS_STICKMOVE
		}
	}
	local listInfo = {
		models = {
			name = "PLATFORM_BUTTON_LAYOUT_CAPS",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "ButtonLayoutOptions_ButtonLayout", options, profileVar, SetButtonLayoutDisplayValues, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	return listInfo
end

local CreateModels_TriggerConfig = function ( controller )
	local profileVar = "flipped_control_config"
	local options = {
		{
			name = Engine.Localize( "MENU_DEFAULT_CAPS" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_FLIPPED_CAPS" ),
			value = 1
		}
	}
	local listInfo = {
		models = {
			name = "PLATFORM_TRIGGER_CONFIG",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "ButtonLayoutOptions_TriggerConfig", options, profileVar, ToggleFlippedShoulderButtons, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	DataSources.ButtonLayoutLabels.m_isFlipped = listInfo.models.currentSelection - 1 == 1
	return listInfo
end

DataSources.ButtonLayout = DataSourceHelpers.ListSetup( "ButtonLayout", function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateModels_ButtonLayout( controller ) )
	table.insert( optionsTable, CreateModels_TriggerConfig( controller ) )
	return optionsTable
end, true )
if CoD.isPC then
	DataSources.ButtonLayoutDropdownPresets = DataSourceHelpers.ListSetup( "PC.ButtonLayoutDropdownPresets", function ( controller )
		local presetOptions = {}
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadButtonConfigs.BUTTONS_DEFAULT,
				valueDisplay = "MENU_DEFAULT_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadButtonConfigs.BUTTONS_EXPERIMENTAL,
				valueDisplay = "MENU_TACTICAL_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadButtonConfigs.BUTTONS_LEFTY,
				valueDisplay = "MENU_LEFTY_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadButtonConfigs.BUTTONS_NOMAD,
				valueDisplay = "MENU_NOMAD_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadButtonConfigs.BUTTONS_CHARLIE,
				valueDisplay = "MENU_CHARLIE_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadButtonConfigs.BUTTONS_GUNSLINGER,
				valueDisplay = "MENU_GUNSLINGER_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadButtonConfigs.BUTTONS_BUMPERJUMPER,
				valueDisplay = "MENU_BUMPERJUMPER_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadButtonConfigs.BUTTONS_BUMPERTACTICAL,
				valueDisplay = "MENU_BUMPERTACTICAL_CAPS"
			}
		} )
		table.insert( presetOptions, {
			models = {
				value = Enum.GPadButtonConfigs.BUTTONS_STICKMOVE,
				valueDisplay = "MENU_STICKMOVE_CAPS"
			}
		} )
		return presetOptions
	end, true )
	DataSources.ButtonLayoutDropdown = DataSourceHelpers.ListSetup( "ButtonLayoutDropdown", function ( controller )
		local optionsTable = {}
		table.insert( optionsTable, {
			models = {
				label = "PLATFORM_BUTTON_LAYOUT_CAPS",
				profileVarName = "gpad_buttonsConfig",
				profileType = "user",
				datasource = "ButtonLayoutDropdownPresets",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
		table.insert( optionsTable, {
			models = {
				label = "PLATFORM_TRIGGER_CONFIG_CAPS",
				profileVarName = "flipped_control_config",
				profileType = "user",
				lowValue = 0,
				highValue = 1,
				widgetType = "checkbox"
			},
			properties = {
				checkboxAction = function ( controller, checkbox )
					CoD.PCUtil.OptionsCheckboxAction( controller, checkbox )
					local model = checkbox:getModel()
					if model then
						local optionInfo = CoD.PCUtil.GetOptionInfo( model, controller )
						ToggleFlippedShoulderButtons( optionInfo.currentValue )
					end
				end
			}
		} )
		return optionsTable
	end, true )
	DataSources.ButtonLayoutDropdown.getWidgetTypeForItem = function ( list, dataItemModel, row )
		if dataItemModel then
			local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
			if widgetType == "dropdown" then
				return CoD.OptionDropdown
			elseif widgetType == "checkbox" then
				return CoD.StartMenu_Options_CheckBoxOption
			end
		end
		return nil
	end
	
end
local PreLoadFunc = function ()
	UpdateButtonStrings()
end

local SetupPC = function ( self, controller, menu )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
	} )
	self:registerEventHandler( "dropdown_triggered", function ( self, event )
		for row = 1, self.buttonLayoutDropdownList.requestedRowCount, 1 do
			local widget = self.buttonLayoutDropdownList:getItemAtPosition( row, 1 )
			if event.inUse then
				if widget ~= event.widget then
					widget.m_inputDisabled = true
				end
			end
			widget.m_inputDisabled = nil
		end
	end )
	self.buttonLayoutDropdownList.m_managedItemPriority = true
	self.buttonLayoutDropdownList:registerEventHandler( "dropdown_triggered", function ( element, event )
		if not event.inUse then
			local currentValue = event.widget.dropDownCurrentValue( controller, element )
			SetButtonLayoutDisplayValues( currentValue )
			CoD.PCUtil.RefreshAllOptions( self, controller )
		end
		element:dispatchEventToParent( event )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	self.buttonLayoutButtonList.navigation = nil
	self.buttonLayoutDropdownList.navigation = nil
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

LUI.createMenu.StartMenu_Options_Controls_ButtonLayout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Controls_ButtonLayout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_ButtonLayout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1920 )
	Background:setTopBottom( 0, 0, 0, 1080 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local buttonLayoutButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonLayoutButtonList:makeFocusable()
	buttonLayoutButtonList:setLeftRight( 0, 0, 47, 1052 )
	buttonLayoutButtonList:setTopBottom( 0, 0, 163, 329 )
	buttonLayoutButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	buttonLayoutButtonList:setVerticalCount( 2 )
	buttonLayoutButtonList:setDataSource( "ButtonLayout" )
	self:addElement( buttonLayoutButtonList )
	self.buttonLayoutButtonList = buttonLayoutButtonList
	
	local durangoControllerImage = LUI.UIImage.new()
	durangoControllerImage:setLeftRight( 0, 0, 622, 1297 )
	durangoControllerImage:setTopBottom( 0, 0, 351, 1026 )
	durangoControllerImage:setAlpha( 0 )
	self:addElement( durangoControllerImage )
	self.durangoControllerImage = durangoControllerImage
	
	local orbisControllerImage = LUI.UIImage.new()
	orbisControllerImage:setLeftRight( 0, 0, 622, 1297 )
	orbisControllerImage:setTopBottom( 0, 0, 351, 1026 )
	orbisControllerImage:setImage( RegisterImage( ImageIsEverywhereButDurango( "uie_ps4_controller_top" ) ) )
	self:addElement( orbisControllerImage )
	self.orbisControllerImage = orbisControllerImage
	
	local vitaControllerImage = LUI.UIImage.new()
	vitaControllerImage:setLeftRight( 0, 0, 197, 1721 )
	vitaControllerImage:setTopBottom( 0, 0, 340, 1021 )
	vitaControllerImage:setImage( RegisterImage( ImageIsOnlyOnOrbis( "uie_img_t7_menu_startmenu_option_psvita" ) ) )
	self:addElement( vitaControllerImage )
	self.vitaControllerImage = vitaControllerImage
	
	local leftStickText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftStickText:setLeftRight( 0, 0, 569, 869 )
	leftStickText:setTopBottom( 0, 0, 888, 926 )
	leftStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftStickText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "leftStick", function ( model )
		leftStickText:setModel( model, controller )
	end )
	self:addElement( leftStickText )
	self.leftStickText = leftStickText
	
	local leftTriggerText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftTriggerText:setLeftRight( 0, 0, 244, 667 )
	leftTriggerText:setTopBottom( 0, 0, 424, 462 )
	leftTriggerText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftTriggerText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "leftTrig", function ( model )
		leftTriggerText:setModel( model, controller )
	end )
	self:addElement( leftTriggerText )
	self.leftTriggerText = leftTriggerText
	
	local leftBumperText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftBumperText:setLeftRight( 0, 0, 197, 617 )
	leftBumperText:setTopBottom( 0, 0, 464, 502 )
	leftBumperText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftBumperText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "lb", function ( model )
		leftBumperText:setModel( model, controller )
	end )
	self:addElement( leftBumperText )
	self.leftBumperText = leftBumperText
	
	local rightStickText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightStickText:setLeftRight( 0, 0, 1042, 1342 )
	rightStickText:setTopBottom( 0, 0, 888, 926 )
	rightStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rightStickText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rightStick", function ( model )
		rightStickText:setModel( model, controller )
	end )
	self:addElement( rightStickText )
	self.rightStickText = rightStickText
	
	local rightTriggerText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightTriggerText:setLeftRight( 0, 0, 1247, 1785 )
	rightTriggerText:setTopBottom( 0, 0, 405, 443 )
	rightTriggerText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightTriggerText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rightTrig", function ( model )
		rightTriggerText:setModel( model, controller )
	end )
	self:addElement( rightTriggerText )
	self.rightTriggerText = rightTriggerText
	
	local rightBumperText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightBumperText:setLeftRight( 0, 0, 1279, 1786 )
	rightBumperText:setTopBottom( 0, 0, 462, 500 )
	rightBumperText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rightBumperText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rb", function ( model )
		rightBumperText:setModel( model, controller )
	end )
	self:addElement( rightBumperText )
	self.rightBumperText = rightBumperText
	
	local XBAPSCrossText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	XBAPSCrossText:setLeftRight( 0, 0, 1421, 1721 )
	XBAPSCrossText:setTopBottom( 0, 0, 699, 737 )
	XBAPSCrossText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBAPSCrossText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbA_psCross", function ( model )
		XBAPSCrossText:setModel( model, controller )
	end )
	self:addElement( XBAPSCrossText )
	self.XBAPSCrossText = XBAPSCrossText
	
	local XBBPSCircleText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	XBBPSCircleText:setLeftRight( 0, 0, 1421, 1824 )
	XBBPSCircleText:setTopBottom( 0, 0, 651, 689 )
	XBBPSCircleText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBBPSCircleText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbB_psCircle", function ( model )
		XBBPSCircleText:setModel( model, controller )
	end )
	self:addElement( XBBPSCircleText )
	self.XBBPSCircleText = XBBPSCircleText
	
	local XBXPSSquareText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	XBXPSSquareText:setLeftRight( 0, 0, 1421, 1824 )
	XBXPSSquareText:setTopBottom( 0, 0, 607, 645 )
	XBXPSSquareText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBXPSSquareText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbX_psSquare", function ( model )
		XBXPSSquareText:setModel( model, controller )
	end )
	self:addElement( XBXPSSquareText )
	self.XBXPSSquareText = XBXPSSquareText
	
	local XBYPSTriangleText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	XBYPSTriangleText:setLeftRight( 0, 0, 1421, 1824 )
	XBYPSTriangleText:setTopBottom( 0, 0, 562, 600 )
	XBYPSTriangleText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XBYPSTriangleText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "xbY_psTriangle", function ( model )
		XBYPSTriangleText:setModel( model, controller )
	end )
	self:addElement( XBYPSTriangleText )
	self.XBYPSTriangleText = XBYPSTriangleText
	
	local backButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	backButtonText:setLeftRight( 0, 0, 810, 1110 )
	backButtonText:setTopBottom( 0, 0, 424, 462 )
	backButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	backButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "back", function ( model )
		backButtonText:setModel( model, controller )
	end )
	self:addElement( backButtonText )
	self.backButtonText = backButtonText
	
	local startButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	startButtonText:setLeftRight( 0, 0, 930, 1230 )
	startButtonText:setTopBottom( 0, 0, 368, 406 )
	startButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	startButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "start", function ( model )
		startButtonText:setModel( model, controller )
	end )
	self:addElement( startButtonText )
	self.startButtonText = startButtonText
	
	local leftButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	leftButtonText:setLeftRight( 0, 0, 111, 505 )
	leftButtonText:setTopBottom( 0, 0, 651, 689 )
	leftButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	leftButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "leftDpad", function ( model )
		leftButtonText:setModel( model, controller )
	end )
	self:addElement( leftButtonText )
	self.leftButtonText = leftButtonText
	
	local rightButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	rightButtonText:setLeftRight( 0, 0, 111, 505 )
	rightButtonText:setTopBottom( 0, 0, 607, 645 )
	rightButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rightButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "rightDpad", function ( model )
		rightButtonText:setModel( model, controller )
	end )
	self:addElement( rightButtonText )
	self.rightButtonText = rightButtonText
	
	local upButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	upButtonText:setLeftRight( 0, 0, 111, 505 )
	upButtonText:setTopBottom( 0, 0, 562, 600 )
	upButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	upButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "upDpad", function ( model )
		upButtonText:setModel( model, controller )
	end )
	self:addElement( upButtonText )
	self.upButtonText = upButtonText
	
	local downButtonText = CoD.StartMenu_Options_Controls_GenericControllerItem.new( self, controller )
	downButtonText:setLeftRight( 0, 0, 111, 505 )
	downButtonText:setTopBottom( 0, 0, 699, 737 )
	downButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	downButtonText:subscribeToGlobalModel( controller, "ButtonLayoutLabels", "downDpad", function ( model )
		downButtonText:setModel( model, controller )
	end )
	self:addElement( downButtonText )
	self.downButtonText = downButtonText
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "PLATFORM_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "PLATFORM_BUTTON_LAYOUT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( 0, 0, 1, 103 )
	StartMenulineGraphicsOptions0:setTopBottom( 0, 0, -19.5, 985.5 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local OrbisLines = LUI.UIImage.new()
	OrbisLines:setLeftRight( 0, 0, 524, 1399 )
	OrbisLines:setTopBottom( 0, 0, 410, 879 )
	OrbisLines:setImage( RegisterImage( ImageIsEverywhereButDurango( AppendCurrentSessionMode( "uie_img_t7_menu_startmenu_option_lines_orbis" ) ) ) )
	self:addElement( OrbisLines )
	self.OrbisLines = OrbisLines
	
	local DurangoLines = LUI.UIImage.new()
	DurangoLines:setLeftRight( 0, 0, 563, 1571 )
	DurangoLines:setTopBottom( 0, 0, 410, 950 )
	DurangoLines:setImage( RegisterImage( ImageIsOnlyOnDurangoOrPc( AppendCurrentSessionMode( "uie_img_t7_menu_startmenu_option_lines_durango" ) ) ) )
	self:addElement( DurangoLines )
	self.DurangoLines = DurangoLines
	
	local buttonLayoutDropdownList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	buttonLayoutDropdownList:makeFocusable()
	buttonLayoutDropdownList:setLeftRight( 0, 0, 111, 861 )
	buttonLayoutDropdownList:setTopBottom( 0, 0, 195, 297 )
	buttonLayoutDropdownList:setAlpha( 0 )
	buttonLayoutDropdownList:setWidgetType( CoD.OptionDropdown )
	buttonLayoutDropdownList:setVerticalCount( 2 )
	buttonLayoutDropdownList:setSpacing( 0 )
	buttonLayoutDropdownList:setDataSource( "ButtonLayoutDropdown" )
	self:addElement( buttonLayoutDropdownList )
	self.buttonLayoutDropdownList = buttonLayoutDropdownList
	
	local VitaLines = LUI.UIImage.new()
	VitaLines:setLeftRight( 0, 0, 524, 1390 )
	VitaLines:setTopBottom( 0, 0, 349, 827 )
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
	self.resetProperties = function ()
		leftButtonText:completeAnimation()
		VitaLines:completeAnimation()
		DurangoLines:completeAnimation()
		OrbisLines:completeAnimation()
		StartMenulineGraphicsOptions0:completeAnimation()
		MenuFrame:completeAnimation()
		downButtonText:completeAnimation()
		upButtonText:completeAnimation()
		rightButtonText:completeAnimation()
		startButtonText:completeAnimation()
		backButtonText:completeAnimation()
		XBYPSTriangleText:completeAnimation()
		XBXPSSquareText:completeAnimation()
		XBBPSCircleText:completeAnimation()
		XBAPSCrossText:completeAnimation()
		rightBumperText:completeAnimation()
		rightTriggerText:completeAnimation()
		rightStickText:completeAnimation()
		leftBumperText:completeAnimation()
		leftTriggerText:completeAnimation()
		leftStickText:completeAnimation()
		vitaControllerImage:completeAnimation()
		orbisControllerImage:completeAnimation()
		buttonLayoutButtonList:completeAnimation()
		Background:completeAnimation()
		durangoControllerImage:completeAnimation()
		buttonLayoutDropdownList:completeAnimation()
		leftButtonText:setLeftRight( 0, 0, 111, 505 )
		leftButtonText:setTopBottom( 0, 0, 651, 689 )
		leftButtonText:setAlpha( 1 )
		VitaLines:setLeftRight( 0, 0, 524, 1390 )
		VitaLines:setTopBottom( 0, 0, 349, 827 )
		VitaLines:setAlpha( 1 )
		DurangoLines:setLeftRight( 0, 0, 563, 1571 )
		DurangoLines:setTopBottom( 0, 0, 410, 950 )
		DurangoLines:setAlpha( 1 )
		OrbisLines:setAlpha( 1 )
		StartMenulineGraphicsOptions0:setAlpha( 1 )
		MenuFrame:setAlpha( 1 )
		downButtonText:setLeftRight( 0, 0, 111, 505 )
		downButtonText:setTopBottom( 0, 0, 699, 737 )
		downButtonText:setAlpha( 1 )
		upButtonText:setLeftRight( 0, 0, 111, 505 )
		upButtonText:setTopBottom( 0, 0, 562, 600 )
		upButtonText:setAlpha( 1 )
		rightButtonText:setLeftRight( 0, 0, 111, 505 )
		rightButtonText:setTopBottom( 0, 0, 607, 645 )
		rightButtonText:setAlpha( 1 )
		startButtonText:setLeftRight( 0, 0, 930, 1230 )
		startButtonText:setTopBottom( 0, 0, 368, 406 )
		startButtonText:setAlpha( 1 )
		startButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
		backButtonText:setLeftRight( 0, 0, 810, 1110 )
		backButtonText:setTopBottom( 0, 0, 424, 462 )
		backButtonText:setAlpha( 1 )
		XBYPSTriangleText:setLeftRight( 0, 0, 1421, 1824 )
		XBYPSTriangleText:setTopBottom( 0, 0, 562, 600 )
		XBYPSTriangleText:setAlpha( 1 )
		XBXPSSquareText:setLeftRight( 0, 0, 1421, 1824 )
		XBXPSSquareText:setTopBottom( 0, 0, 607, 645 )
		XBXPSSquareText:setAlpha( 1 )
		XBBPSCircleText:setLeftRight( 0, 0, 1421, 1824 )
		XBBPSCircleText:setTopBottom( 0, 0, 651, 689 )
		XBBPSCircleText:setAlpha( 1 )
		XBAPSCrossText:setLeftRight( 0, 0, 1421, 1721 )
		XBAPSCrossText:setTopBottom( 0, 0, 699, 737 )
		XBAPSCrossText:setAlpha( 1 )
		rightBumperText:setLeftRight( 0, 0, 1279, 1786 )
		rightBumperText:setTopBottom( 0, 0, 462, 500 )
		rightBumperText:setAlpha( 1 )
		rightTriggerText:setLeftRight( 0, 0, 1247, 1785 )
		rightTriggerText:setTopBottom( 0, 0, 405, 443 )
		rightTriggerText:setAlpha( 1 )
		rightStickText:setLeftRight( 0, 0, 1042, 1342 )
		rightStickText:setTopBottom( 0, 0, 888, 926 )
		rightStickText:setAlpha( 1 )
		rightStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
		leftBumperText:setLeftRight( 0, 0, 197, 617 )
		leftBumperText:setTopBottom( 0, 0, 464, 502 )
		leftBumperText:setAlpha( 1 )
		leftTriggerText:setLeftRight( 0, 0, 244, 667 )
		leftTriggerText:setTopBottom( 0, 0, 424, 462 )
		leftTriggerText:setAlpha( 1 )
		leftStickText:setLeftRight( 0, 0, 569, 869 )
		leftStickText:setTopBottom( 0, 0, 888, 926 )
		leftStickText:setAlpha( 1 )
		vitaControllerImage:setLeftRight( 0, 0, 197, 1721 )
		vitaControllerImage:setTopBottom( 0, 0, 340, 1021 )
		vitaControllerImage:setAlpha( 1 )
		orbisControllerImage:setAlpha( 1 )
		buttonLayoutButtonList:setAlpha( 1 )
		Background:setAlpha( 1 )
		durangoControllerImage:setAlpha( 0 )
		buttonLayoutDropdownList:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 25 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				buttonLayoutButtonList:completeAnimation()
				self.buttonLayoutButtonList:setAlpha( 0 )
				self.clipFinished( buttonLayoutButtonList, {} )
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
				VitaLines:completeAnimation()
				self.VitaLines:setAlpha( 0 )
				self.clipFinished( VitaLines, {} )
			end
		},
		Orbis = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickText:completeAnimation()
				self.leftStickText:setLeftRight( 0, 0, 612, 912 )
				self.leftStickText:setTopBottom( 0, 0, 886, 924 )
				self.clipFinished( leftStickText, {} )
				rightStickText:completeAnimation()
				rightStickText.defaultText:completeAnimation()
				self.rightStickText:setLeftRight( 0, 0, 1008, 1308 )
				self.rightStickText:setTopBottom( 0, 0, 886, 924 )
				self.rightStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( rightStickText, {} )
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
				self.resetProperties()
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
				self.leftStickText:setLeftRight( 0, 0, 96, 608 )
				self.leftStickText:setTopBottom( 0, 0, 607, 645 )
				self.clipFinished( leftStickText, {} )
				leftTriggerText:completeAnimation()
				self.leftTriggerText:setLeftRight( 0, 0, 95.5, 661.5 )
				self.leftTriggerText:setTopBottom( 0, 0, 410, 448 )
				self.clipFinished( leftTriggerText, {} )
				leftBumperText:completeAnimation()
				self.leftBumperText:setLeftRight( 0, 0, 96, 630 )
				self.leftBumperText:setTopBottom( 0, 0, 464, 502 )
				self.clipFinished( leftBumperText, {} )
				rightStickText:completeAnimation()
				self.rightStickText:setLeftRight( 0, 0, 724, 1380 )
				self.rightStickText:setTopBottom( 0, 0, 879, 917 )
				self.clipFinished( rightStickText, {} )
				rightTriggerText:completeAnimation()
				self.rightTriggerText:setLeftRight( 0, 0, 1253.5, 1824.5 )
				self.rightTriggerText:setTopBottom( 0, 0, 405, 443 )
				self.clipFinished( rightTriggerText, {} )
				rightBumperText:completeAnimation()
				self.rightBumperText:setLeftRight( 0, 0, 1285, 1824 )
				self.rightBumperText:setTopBottom( 0, 0, 462, 500 )
				self.clipFinished( rightBumperText, {} )
				XBAPSCrossText:completeAnimation()
				self.XBAPSCrossText:setLeftRight( 0, 0, 1409.5, 1824.5 )
				self.XBAPSCrossText:setTopBottom( 0, 0, 699, 737 )
				self.clipFinished( XBAPSCrossText, {} )
				XBBPSCircleText:completeAnimation()
				self.XBBPSCircleText:setLeftRight( 0, 0, 1409, 1824 )
				self.XBBPSCircleText:setTopBottom( 0, 0, 651, 689 )
				self.clipFinished( XBBPSCircleText, {} )
				XBXPSSquareText:completeAnimation()
				self.XBXPSSquareText:setLeftRight( 0, 0, 1409, 1824 )
				self.XBXPSSquareText:setTopBottom( 0, 0, 607, 645 )
				self.clipFinished( XBXPSSquareText, {} )
				XBYPSTriangleText:completeAnimation()
				self.XBYPSTriangleText:setLeftRight( 0, 0, 1409, 1824 )
				self.XBYPSTriangleText:setTopBottom( 0, 0, 562, 600 )
				self.clipFinished( XBYPSTriangleText, {} )
				backButtonText:completeAnimation()
				self.backButtonText:setLeftRight( 0, 0, 760, 1060 )
				self.backButtonText:setTopBottom( 0, 0, 424, 462 )
				self.clipFinished( backButtonText, {} )
				startButtonText:completeAnimation()
				self.startButtonText:setLeftRight( 0, 0, 868, 1168 )
				self.startButtonText:setTopBottom( 0, 0, 387, 425 )
				self.clipFinished( startButtonText, {} )
				leftButtonText:completeAnimation()
				self.leftButtonText:setLeftRight( 0, 0, 96, 608 )
				self.leftButtonText:setTopBottom( 0, 0, 728, 766 )
				self.clipFinished( leftButtonText, {} )
				rightButtonText:completeAnimation()
				self.rightButtonText:setLeftRight( 0, 0, 95.5, 606.5 )
				self.rightButtonText:setTopBottom( 0, 0, 766, 804 )
				self.clipFinished( rightButtonText, {} )
				upButtonText:completeAnimation()
				self.upButtonText:setLeftRight( 0, 0, 103.5, 608.5 )
				self.upButtonText:setTopBottom( 0, 0, 680, 718 )
				self.clipFinished( upButtonText, {} )
				downButtonText:completeAnimation()
				self.downButtonText:setLeftRight( 0, 0, 96, 608 )
				self.downButtonText:setTopBottom( 0, 0, 811, 849 )
				self.clipFinished( downButtonText, {} )
				OrbisLines:completeAnimation()
				self.OrbisLines:setAlpha( 0 )
				self.clipFinished( OrbisLines, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setLeftRight( 0, 0, 620, 1402 )
				self.DurangoLines:setTopBottom( 0, 0, 424.5, 879.5 )
				self.clipFinished( DurangoLines, {} )
				VitaLines:completeAnimation()
				self.VitaLines:setAlpha( 0 )
				self.clipFinished( VitaLines, {} )
			end
		},
		PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				buttonLayoutButtonList:completeAnimation()
				self.buttonLayoutButtonList:setAlpha( 0 )
				self.clipFinished( buttonLayoutButtonList, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 21 )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setLeftRight( 0, 0, 227, 1695 )
				self.vitaControllerImage:setTopBottom( 0, 0, 343.5, 999.5 )
				self.clipFinished( vitaControllerImage, {} )
				leftStickText:completeAnimation()
				self.leftStickText:setLeftRight( 0, 0, 372, 672 )
				self.leftStickText:setTopBottom( 0, 0, 856, 894 )
				self.clipFinished( leftStickText, {} )
				leftTriggerText:completeAnimation()
				self.leftTriggerText:setLeftRight( 0, 0, 275.5, 575.5 )
				self.leftTriggerText:setTopBottom( 0, 0, 376, 414 )
				self.clipFinished( leftTriggerText, {} )
				leftBumperText:completeAnimation()
				self.leftBumperText:setLeftRight( 0, 0, 372, 672 )
				self.leftBumperText:setTopBottom( 0, 0, 732, 770 )
				self.clipFinished( leftBumperText, {} )
				rightStickText:completeAnimation()
				rightStickText.defaultText:completeAnimation()
				self.rightStickText:setLeftRight( 0, 0, 1248, 1548 )
				self.rightStickText:setTopBottom( 0, 0, 856, 894 )
				self.rightStickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( rightStickText, {} )
				rightTriggerText:completeAnimation()
				self.rightTriggerText:setLeftRight( 0, 0, 1344, 1644 )
				self.rightTriggerText:setTopBottom( 0, 0, 376, 414 )
				self.clipFinished( rightTriggerText, {} )
				rightBumperText:completeAnimation()
				self.rightBumperText:setLeftRight( 0, 0, 1247.5, 1547.5 )
				self.rightBumperText:setTopBottom( 0, 0, 732, 770 )
				self.clipFinished( rightBumperText, {} )
				XBAPSCrossText:completeAnimation()
				self.XBAPSCrossText:setLeftRight( 0, 0, 1344, 1644 )
				self.XBAPSCrossText:setTopBottom( 0, 0, 600, 638 )
				self.clipFinished( XBAPSCrossText, {} )
				XBBPSCircleText:completeAnimation()
				self.XBBPSCircleText:setLeftRight( 0, 0, 1344, 1747 )
				self.XBBPSCircleText:setTopBottom( 0, 0, 503, 541 )
				self.clipFinished( XBBPSCircleText, {} )
				XBXPSSquareText:completeAnimation()
				self.XBXPSSquareText:setLeftRight( 0, 0, 1344, 1747 )
				self.XBXPSSquareText:setTopBottom( 0, 0, 549, 587 )
				self.clipFinished( XBXPSSquareText, {} )
				XBYPSTriangleText:completeAnimation()
				self.XBYPSTriangleText:setLeftRight( 0, 0, 1344, 1747 )
				self.XBYPSTriangleText:setTopBottom( 0, 0, 454, 492 )
				self.clipFinished( XBYPSTriangleText, {} )
				backButtonText:completeAnimation()
				self.backButtonText:setLeftRight( 0, 0, 816, 1104 )
				self.backButtonText:setTopBottom( 0, 0, 552, 590 )
				self.clipFinished( backButtonText, {} )
				startButtonText:completeAnimation()
				startButtonText.defaultText:completeAnimation()
				self.startButtonText:setLeftRight( 0, 0, 1344, 1632 )
				self.startButtonText:setTopBottom( 0, 0, 664, 702 )
				self.startButtonText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( startButtonText, {} )
				leftButtonText:completeAnimation()
				self.leftButtonText:setLeftRight( 0, 0, 182, 576 )
				self.leftButtonText:setTopBottom( 0, 0, 545, 583 )
				self.clipFinished( leftButtonText, {} )
				rightButtonText:completeAnimation()
				self.rightButtonText:setLeftRight( 0, 0, 133, 527 )
				self.rightButtonText:setTopBottom( 0, 0, 499, 537 )
				self.rightButtonText:setAlpha( 0 )
				self.clipFinished( rightButtonText, {} )
				upButtonText:completeAnimation()
				self.upButtonText:setLeftRight( 0, 0, 134, 528 )
				self.upButtonText:setTopBottom( 0, 0, 454, 492 )
				self.upButtonText:setAlpha( 0 )
				self.clipFinished( upButtonText, {} )
				downButtonText:completeAnimation()
				self.downButtonText:setLeftRight( 0, 0, 183, 577 )
				self.downButtonText:setTopBottom( 0, 0, 496, 534 )
				self.clipFinished( downButtonText, {} )
				OrbisLines:completeAnimation()
				self.OrbisLines:setAlpha( 0 )
				self.clipFinished( OrbisLines, {} )
				DurangoLines:completeAnimation()
				self.DurangoLines:setAlpha( 0 )
				self.clipFinished( DurangoLines, {} )
				VitaLines:completeAnimation()
				self.VitaLines:setLeftRight( 0, 0, 514.5, 1405.5 )
				self.VitaLines:setTopBottom( 0, 0, 397, 877 )
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
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
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
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if IsPC() then
			SetFocusToElement( self, "buttonLayoutDropdownList", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ForceNotifyControllerModel( controller, "forceUpdateVehicleBindings" )
		UpdateGamerprofile( self, element, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonLayoutButtonList:close()
		self.leftStickText:close()
		self.leftTriggerText:close()
		self.leftBumperText:close()
		self.rightStickText:close()
		self.rightTriggerText:close()
		self.rightBumperText:close()
		self.XBAPSCrossText:close()
		self.XBBPSCircleText:close()
		self.XBXPSSquareText:close()
		self.XBYPSTriangleText:close()
		self.backButtonText:close()
		self.startButtonText:close()
		self.leftButtonText:close()
		self.rightButtonText:close()
		self.upButtonText:close()
		self.downButtonText:close()
		self.MenuFrame:close()
		self.StartMenulineGraphicsOptions0:close()
		self.buttonLayoutDropdownList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_ButtonLayout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

