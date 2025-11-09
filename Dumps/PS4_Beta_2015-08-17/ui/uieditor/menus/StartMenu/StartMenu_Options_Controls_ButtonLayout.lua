require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )

DataSources.ButtonLayoutLabels = {
	m_isFlipped = false,
	getModel = function ( controller )
		DataSources.ButtonLayoutLabels.m_lastController = controller
		local buttonLayoutLabelsModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonLayoutLabels" )
		if buttonLayoutLabelsModel == nil then
			buttonLayoutLabelsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ButtonLayoutLabels" )
			Engine.CreateModel( buttonLayoutLabelsModel, "xbA_psCross_text" )
			Engine.CreateModel( buttonLayoutLabelsModel, "xbB_psCircle_text" )
			Engine.CreateModel( buttonLayoutLabelsModel, "xbX_psSquare_text" )
			Engine.CreateModel( buttonLayoutLabelsModel, "xbY_psTriangle_text" )
			Engine.CreateModel( buttonLayoutLabelsModel, "backText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "startText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "lbText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "rbText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "leftTrigText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "rightTrigText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "leftText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "rightText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "upText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "downText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "leftStickText" )
			Engine.CreateModel( buttonLayoutLabelsModel, "rightStickText" )
		end
		return buttonLayoutLabelsModel
	end,
	setModels = function ()
		local controller = DataSources.ButtonLayoutLabels.m_lastController
		local buttonStringsTable = DataSources.ButtonLayoutLabels.m_buttonStringsTable
		local buttonLayoutLabelsModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonLayoutLabels" )
		if not buttonLayoutLabelsModel or not buttonStringsTable then
			return 
		end
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "xbA_psCross_text" ), buttonStringsTable.BUTTON_A )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "xbB_psCircle_text" ), buttonStringsTable.BUTTON_B )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "xbX_psSquare_text" ), buttonStringsTable.BUTTON_X )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "xbY_psTriangle_text" ), buttonStringsTable.BUTTON_Y )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "backText" ), buttonStringsTable.BUTTON_BACK )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "startText" ), buttonStringsTable.BUTTON_START )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "leftText" ), buttonStringsTable.BUTTON_LEFT )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "rightText" ), buttonStringsTable.BUTTON_RIGHT )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "upText" ), buttonStringsTable.BUTTON_UP )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "downText" ), buttonStringsTable.BUTTON_DOWN )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "leftStickText" ), buttonStringsTable.BUTTON_LSTICK )
		Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "rightStickText" ), buttonStringsTable.BUTTON_RSTICK )
		if DataSources.ButtonLayoutLabels.m_isFlipped then
			Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "lbText" ), buttonStringsTable.BUTTON_LTRIG )
			Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "rbText" ), buttonStringsTable.BUTTON_RTRIG )
			Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "leftTrigText" ), buttonStringsTable.BUTTON_LBUMP )
			Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "rightTrigText" ), buttonStringsTable.BUTTON_RBUMP )
		else
			Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "lbText" ), buttonStringsTable.BUTTON_LBUMP )
			Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "rbText" ), buttonStringsTable.BUTTON_RBUMP )
			Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "leftTrigText" ), buttonStringsTable.BUTTON_LTRIG )
			Engine.SetModelValue( Engine.GetModel( buttonLayoutLabelsModel, "rightTrigText" ), buttonStringsTable.BUTTON_RTRIG )
		end
	end
}
local ButtonLayout = {
	ButtonStrings = {},
	FragGrenadeString = "MENU_THROW_FRAG_GRENADE"
}
if CoD.isSinglePlayer then
	ButtonLayout.FragGrenadeString = "MENU_THROW_PRIMARY"
end
ButtonLayout.SpecialGrenadeString = "MENU_THROW_SPECIAL_GRENADE"
if CoD.isSinglePlayer then
	ButtonLayout.SpecialGrenadeString = "MENU_THROW_SECONDARY"
end
ButtonLayout.ButtonStrings[CoD.BUTTONS_DEFAULT + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = ButtonLayout.FragGrenadeString,
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
ButtonLayout.ButtonStrings[CoD.BUTTONS_EXPERIMENTAL + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_MELEE_ATTACK",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = ButtonLayout.FragGrenadeString,
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
ButtonLayout.ButtonStrings[CoD.BUTTONS_LEFTY + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = ButtonLayout.FragGrenadeString,
	BUTTON_RBUMP = ButtonLayout.SpecialGrenadeString,
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
ButtonLayout.ButtonStrings[CoD.BUTTONS_NOMAD + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_MELEE_ATTACK",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = ButtonLayout.FragGrenadeString,
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
ButtonLayout.ButtonStrings[CoD.BUTTONS_CHARLIE + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = "MENU_TOGGLE_AIM_DOWN_THE_SIGHT",
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = ButtonLayout.FragGrenadeString,
	BUTTON_RTRIG = "MENU_FIRE_WEAPON",
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_MELEE_ATTACK"
}
ButtonLayout.ButtonStrings[CoD.BUTTONS_BUMPERJUMPER + 1] = {
	BUTTON_A = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = "MENU_JUMP",
	BUTTON_RBUMP = ButtonLayout.FragGrenadeString,
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
ButtonLayout.ButtonStrings[CoD.BUTTONS_STICKMOVE + 1] = {
	BUTTON_A = "MENU_MELEE_ATTACK",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = ButtonLayout.FragGrenadeString,
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
ButtonLayout.ButtonStrings[CoD.BUTTONS_GUNSLINGER + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = "MENU_FIRE_WEAPON",
	BUTTON_RBUMP = ButtonLayout.SpecialGrenadeString,
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = "MENU_AIM_DOWN_SIGHT",
	BUTTON_RTRIG = ButtonLayout.FragGrenadeString,
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_MELEE_ATTACK"
}
local SetButtonLayoutDisplayValues = function ( value )
	DataSources.ButtonLayoutLabels.m_buttonStringsTable = ButtonLayout.ButtonStrings[value + 1]
	DataSources.ButtonLayoutLabels.setModels()
end

local ToggleFlippedShoulderButtons = function ( value )
	DataSources.ButtonLayoutLabels.m_isFlipped = value == CoD.TRIGGERS_FLIPPED
	DataSources.ButtonLayoutLabels.setModels()
end

local CreateModels_ButtonLayout = function ( controller )
	local profileVar = "gpad_buttonsConfig"
	local options = {
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
			name = Engine.Localize( "MENU_NOMAD" ),
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
	local listInfo = {
		models = {
			name = "MENU_BUTTON_LAYOUT_CAPS",
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
			value = CoD.TRIGGERS_DEFAULT
		},
		{
			name = Engine.Localize( "MENU_FLIPPED_CAPS" ),
			value = CoD.TRIGGERS_FLIPPED
		}
	}
	local listInfo = {
		models = {
			name = "MENU_TRIGGER_CONFIG_CAPS",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "ButtonLayoutOptions_TriggerConfig", options, profileVar, ToggleFlippedShoulderButtons, nil, nil ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
		},
		properties = {}
	}
	DataSources.ButtonLayoutLabels.m_isFlipped = listInfo.models.currentSelection - 1 == CoD.TRIGGERS_FLIPPED
	return listInfo
end

DataSources.ButtonLayout = DataSourceHelpers.ListSetup( "ButtonLayout", function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateModels_ButtonLayout( controller ) )
	table.insert( optionsTable, CreateModels_TriggerConfig( controller ) )
	return optionsTable
end, true )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftTriggerText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftBumperText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightTriggerText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightBumperText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XBAPSCrossText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XBBPSCircleText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XBXPSSquareText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XBYPSTriangleText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			backButtonText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			startButtonText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftButtonText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightButtonText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			upButtonText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			downButtonText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftStickText:setText( Engine.Localize( modelValue ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightStickText:setText( Engine.Localize( modelValue ) )
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
	
	local Lines = LUI.UIImage.new()
	Lines:setLeftRight( true, false, 349, 932.5 )
	Lines:setTopBottom( true, false, 273.5, 586.09 )
	Lines:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_lines" ) )
	self:addElement( Lines )
	self.Lines = Lines
	
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
				self:setupElementClipCounter( 2 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 1 )
				self.clipFinished( durangoControllerImage, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
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
		}
	} )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ForceNotifyControllerModel( controller, "forceUpdateVehicleBindings" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	buttonLayoutButtonList.id = "buttonLayoutButtonList"
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
		self.buttonLayoutButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonLayoutButtonList:close()
		self.MenuFrame:close()
		self.StartMenulineGraphicsOptions0:close()
		self.leftTriggerText:close()
		self.leftBumperText:close()
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
		self.leftStickText:close()
		self.rightStickText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Controls_ButtonLayout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

