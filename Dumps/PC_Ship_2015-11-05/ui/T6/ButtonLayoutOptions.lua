require( "ui.T6.Line" )

CoD.ButtonLayout = {}
CoD.ButtonLayout.LineWidth = 2
CoD.ButtonLayout.LineColor = {
	CoD.offWhite.r,
	CoD.offWhite.g,
	CoD.offWhite.b,
	1
}
CoD.ButtonLayout.ButtonRefs = {
	"BUTTON_A",
	"BUTTON_B",
	"BUTTON_X",
	"BUTTON_Y",
	"BUTTON_LBUMP",
	"BUTTON_RBUMP",
	"BUTTON_UP",
	"BUTTON_DOWN",
	"BUTTON_LEFT",
	"BUTTON_RIGHT",
	"BUTTON_LTRIG",
	"BUTTON_RTRIG",
	"BUTTON_START",
	"BUTTON_BACK",
	"BUTTON_LSTICK",
	"BUTTON_RSTICK"
}
CoD.ButtonLayout.ButtonStrings = {}
CoD.ButtonLayout.FragGrenadeString = "MENU_THROW_FRAG_GRENADE"
if CoD.isSinglePlayer then
	CoD.ButtonLayout.FragGrenadeString = "MENU_THROW_PRIMARY"
end
CoD.ButtonLayout.SpecialGrenadeString = "MENU_THROW_SPECIAL_GRENADE"
if CoD.isSinglePlayer then
	CoD.ButtonLayout.SpecialGrenadeString = "MENU_THROW_SECONDARY"
end
CoD.ButtonLayout.ButtonStrings[CoD.BUTTONS_DEFAULT + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = CoD.ButtonLayout.FragGrenadeString,
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
CoD.ButtonLayout.ButtonStrings[CoD.BUTTONS_EXPERIMENTAL + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_MELEE_ATTACK",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = CoD.ButtonLayout.FragGrenadeString,
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
CoD.ButtonLayout.ButtonStrings[CoD.BUTTONS_LEFTY + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = CoD.ButtonLayout.FragGrenadeString,
	BUTTON_RBUMP = CoD.ButtonLayout.SpecialGrenadeString,
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
CoD.ButtonLayout.ButtonStrings[CoD.BUTTONS_NOMAD + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_MELEE_ATTACK",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = CoD.ButtonLayout.FragGrenadeString,
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
CoD.ButtonLayout.ButtonStrings[CoD.BUTTONS_CHARLIE + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = "MENU_TOGGLE_AIM_DOWN_THE_SIGHT",
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = CoD.ButtonLayout.FragGrenadeString,
	BUTTON_RTRIG = "MENU_FIRE_WEAPON",
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_MELEE_ATTACK"
}
CoD.ButtonLayout.ButtonStrings[CoD.BUTTONS_BUMPERJUMPER + 1] = {
	BUTTON_A = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = "MENU_JUMP",
	BUTTON_RBUMP = CoD.ButtonLayout.FragGrenadeString,
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
CoD.ButtonLayout.ButtonStrings[CoD.BUTTONS_STICKMOVE + 1] = {
	BUTTON_A = "MENU_MELEE_ATTACK",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_RBUMP = CoD.ButtonLayout.FragGrenadeString,
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
CoD.ButtonLayout.ButtonStrings[CoD.BUTTONS_GUNSLINGER + 1] = {
	BUTTON_A = "MENU_JUMP",
	BUTTON_B = "MENU_CROUCH_PRONE",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = "MENU_FIRE_WEAPON",
	BUTTON_RBUMP = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_UP = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_ACCESS_EQUIPMENT_INVENTORY" ),
	BUTTON_DOWN = CoD.MPZM( "MENU_SCORESTREAK_SELECTION", "MENU_NONE" ),
	BUTTON_LEFT = "MENU_ATTACHMENTS",
	BUTTON_RIGHT = CoD.MPZM( "MENU_USE_SCORESTREAK", "MENU_EQUIP_CLAYMORES" ),
	BUTTON_LTRIG = "MENU_AIM_DOWN_SIGHT",
	BUTTON_RTRIG = CoD.ButtonLayout.FragGrenadeString,
	BUTTON_START = "MENU_OBJECTIVES_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_SPRINT_HOLD_BREATH",
	BUTTON_RSTICK = "MENU_MELEE_ATTACK"
}
CoD.ButtonLayout.ButtonStrings[CoD.BUTTONS_BUMPERTACTICAL + 1] = {
	BUTTON_A = CoD.ButtonLayout.SpecialGrenadeString,
	BUTTON_B = "MENU_MELEE_ATTACK",
	BUTTON_X = "MENU_USE_RELOAD",
	BUTTON_Y = "MENU_SWITCH_WEAPON",
	BUTTON_LBUMP = "MENU_JUMP",
	BUTTON_RBUMP = CoD.ButtonLayout.FragGrenadeString,
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
CoD.ButtonLayout.TheaterButtonStrings = {}
CoD.ButtonLayout.TheaterButtonStrings[CoD.DEMO_CONTROLLER_CONFIG_DEFAULT + 1] = {
	BUTTON_A = "MENU_DEMO_CONTROLS_PLAY_PAUSE",
	BUTTON_B = "MENU_DEMO_CONTROLS_TOGGLE_HUD",
	BUTTON_X = "MENU_DEMO_CONTROLS_RECORD",
	BUTTON_Y = "MENU_DEMO_CONTROLS_SWITCH_CAMERA",
	BUTTON_LBUMP = "MENU_DEMO_CONTROLS_PREV_PLAYER",
	BUTTON_RBUMP = "MENU_DEMO_CONTROLS_NEXT_PLAYER",
	BUTTON_UP = "",
	BUTTON_DOWN = "",
	BUTTON_LEFT = "",
	BUTTON_RIGHT = "MENU_DEMO_CONTROLS_JUMP_FORWARD",
	BUTTON_LTRIG = "MENU_DEMO_CONTROLS_JUMP_BACK",
	BUTTON_RTRIG = "MENU_DEMO_CONTROLS_PLAYBACK_SPEED",
	BUTTON_START = "MENU_DEMO_CONTROLS_PAUSE_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_DEMO_CONTROLS_TOGGLE_CONTROLS",
	BUTTON_RSTICK = ""
}
CoD.ButtonLayout.TheaterButtonStrings[CoD.DEMO_CONTROLLER_CONFIG_DIGITAL + 1] = {
	BUTTON_A = "MENU_DEMO_CONTROLS_PLAY_PAUSE",
	BUTTON_B = "MENU_DEMO_CONTROLS_TOGGLE_HUD",
	BUTTON_X = "MENU_DEMO_CONTROLS_RECORD",
	BUTTON_Y = "MENU_DEMO_CONTROLS_SWITCH_CAMERA",
	BUTTON_LBUMP = "MENU_DEMO_CONTROLS_PREV_PLAYER",
	BUTTON_RBUMP = "MENU_DEMO_CONTROLS_NEXT_PLAYER",
	BUTTON_UP = "",
	BUTTON_DOWN = "",
	BUTTON_LEFT = "MENU_DEMO_CONTROLS_JUMP_BACK",
	BUTTON_RIGHT = "MENU_DEMO_CONTROLS_JUMP_FORWARD",
	BUTTON_LTRIG = "MENU_DEMO_CONTROLS_SLOW_MO",
	BUTTON_RTRIG = "MENU_DEMO_CONTROLS_FAST_MO",
	BUTTON_START = "MENU_DEMO_CONTROLS_PAUSE_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_DEMO_CONTROLS_TOGGLE_CONTROLS",
	BUTTON_RSTICK = ""
}
CoD.ButtonLayout.TheaterButtonStrings[CoD.DEMO_CONTROLLER_CONFIG_BADBOT + 1] = {
	BUTTON_A = "MENU_DEMO_CONTROLS_PLAY_PAUSE",
	BUTTON_B = "MENU_DEMO_CONTROLS_TOGGLE_HUD",
	BUTTON_X = "MENU_DEMO_CONTROLS_RECORD",
	BUTTON_Y = "MENU_DEMO_CONTROLS_SWITCH_CAMERA",
	BUTTON_LBUMP = "MENU_DEMO_CONTROLS_PREV_PLAYER",
	BUTTON_RBUMP = "MENU_DEMO_CONTROLS_NEXT_PLAYER",
	BUTTON_UP = "MENU_DEMO_CONTROLS_INCREASE_PLAYBACK_SPEED_SMALL",
	BUTTON_DOWN = "MENU_DEMO_CONTROLS_DECREASE_PLAYBACK_SPEED_SMALL",
	BUTTON_LEFT = "MENU_DEMO_CONTROLS_DECREASE_PLAYBACK_SPEED_LARGE",
	BUTTON_RIGHT = "MENU_DEMO_CONTROLS_INCREASE_PLAYBACK_SPEED_LARGE",
	BUTTON_LTRIG = "MENU_DEMO_CONTROLS_JUMP_BACK",
	BUTTON_RTRIG = "MENU_DEMO_CONTROLS_JUMP_FORWARD",
	BUTTON_START = "MENU_DEMO_CONTROLS_PAUSE_MENU",
	BUTTON_BACK = "MENU_SCOREBOARD",
	BUTTON_LSTICK = "MENU_DEMO_CONTROLS_TOGGLE_CONTROLS",
	BUTTON_RSTICK = ""
}
CoD.ButtonLayout.GetProfileVar = function ( f1_arg0 )
	local f1_local0 = "gpad_buttonsConfig"
	if Engine.IsDemoPlaying() then
		f1_local0 = "demo_controllerconfig"
	elseif CoD.isWIIU then
		local f1_local1 = Engine.GetControllerType( f1_arg0 )
		if f1_local1 == "remote" then
			f1_local0 = "gpad_remoteButtonsConfig"
		elseif f1_local1 == "classic" then
			f1_local0 = "gpad_classicButtonsConfig"
		end
	end
	return f1_local0
end

CoD.ButtonLayout.SelectionChanged = function ( f2_arg0, f2_arg1 )
	if f2_arg1 then
		Engine.SetProfileVar( f2_arg0.parentSelectorButton.m_currentController, f2_arg0.parentSelectorButton.m_profileVarName, f2_arg0.value )
	end
	f2_arg0.parentSelectorButton:dispatchEventToParent( {
		name = "button_layout_selection_changed",
		choiceParams = f2_arg0
	} )
end

CoD.ButtonLayout.TriggerSelectionChanged = function ( f3_arg0 )
	Engine.SetProfileVar( f3_arg0.parentSelectorButton.m_currentController, f3_arg0.parentSelectorButton.m_profileVarName, f3_arg0.value )
	f3_arg0.parentSelectorButton:dispatchEventToParent( {
		name = "button_layout_selection_changed",
		controller = f3_arg0.controller
	} )
end

CoD.ButtonLayout.Button_AddChoices = function ( f4_arg0, f4_arg1 )
	if f4_arg0.strings == nil or #f4_arg0.strings == 0 then
		return 
	end
	for f4_local0 = 1, #f4_arg0.strings, 1 do
		f4_arg0:addChoice( f4_arg0.strings[f4_local0], f4_arg0.values[f4_local0], nil, f4_arg1 )
	end
end

CoD.ButtonLayout.AddChoices = function ( f5_arg0, f5_arg1 )
	if Engine.IsDemoPlaying() then
		if CoD.isWIIU then
			local f5_local0 = {}
			local f5_local1 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_DEFAULT" ) )
			local f5_local2 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_BADBOT" ) )
			f5_arg0.strings = f5_local1
			f5_arg0.values = {
				CoD.DEMO_CONTROLLER_CONFIG_DIGITAL,
				CoD.DEMO_CONTROLLER_CONFIG_BADBOT
			}
		else
			local f5_local0 = {}
			local f5_local1 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_DEFAULT" ) )
			local f5_local2 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_DIGITAL" ) )
			local f5_local3 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_BADBOT" ) )
			f5_arg0.strings = f5_local1
			f5_arg0.values = {
				CoD.DEMO_CONTROLLER_CONFIG_DEFAULT,
				CoD.DEMO_CONTROLLER_CONFIG_DIGITAL,
				CoD.DEMO_CONTROLLER_CONFIG_BADBOT
			}
		end
	else
		local f5_local0 = {}
		local f5_local1 = Engine.Localize( "MENU_DEFAULT_CAPS" )
		local f5_local2 = Engine.Localize( "MENU_TACTICAL_CAPS" )
		local f5_local3 = Engine.Localize( "MENU_LEFTY_CAPS" )
		local f5_local4 = Engine.Localize( "MENU_NOMAD" )
		local f5_local5 = Engine.Localize( "MENU_CHARLIE_CAPS" )
		local f5_local6 = Engine.Localize( "MENU_GUNSLINGER_CAPS" )
		local f5_local7 = Engine.Localize( "MENU_BUMPERJUMPER_CAPS" )
		local f5_local8 = Engine.Localize( "MENU_BUMPERTACTICAL_CAPS" )
		local f5_local9 = Engine.Localize( "MENU_STICKMOVE_CAPS" )
		f5_arg0.strings = f5_local1
		f5_arg0.values = {
			CoD.BUTTONS_DEFAULT,
			CoD.BUTTONS_EXPERIMENTAL,
			CoD.BUTTONS_LEFTY,
			CoD.BUTTONS_NOMAD,
			CoD.BUTTONS_CHARLIE,
			CoD.BUTTONS_GUNSLINGER,
			CoD.BUTTONS_BUMPERJUMPER,
			CoD.BUTTONS_BUMPERTACTICAL,
			CoD.BUTTONS_STICKMOVE
		}
	end
	CoD.ButtonLayout.Button_AddChoices( f5_arg0, CoD.ButtonLayout.SelectionChanged )
end

CoD.ButtonLayout.CloseMenu = function ( f6_arg0 )
	if Engine.IsInGame() then
		Engine.Exec( f6_arg0:getOwner(), "updateVehicleBindings" )
	end
	Engine.PlaySound( "uin_cmn_backout" )
	Engine.Exec( f6_arg0:getOwner(), "updategamerprofile" )
	if CoD.isCampaign == false then
		f6_arg0:saveState()
	end
	CoD.Menu.close( f6_arg0 )
end

CoD.ButtonLayout.StreamedImageReady = function ( f7_arg0, f7_arg1 )
	f7_arg0:beginAnimation( "fade_in", 250 )
	f7_arg0:setAlpha( 1 )
end

CoD.ButtonLayout.AddBackButtonTimer = function ( f8_arg0, f8_arg1 )
	f8_arg0:addBackButton()
	f8_arg0.backButtonTimer:close()
	f8_arg0.backButtonTimer = nil
end

LUI.createMenu.ButtonLayout = function ( f9_arg0, f9_arg1 )
	local f9_local0, f9_local1 = nil
	local f9_local2 = Engine.IsDemoPlaying()
	if Engine.IsInGame() then
		if f9_local2 then
			f9_local1 = Engine.Localize( "PLATFORM_THEATER_BUTTON_LAYOUT_CAPS" )
		else
			f9_local1 = Engine.Localize( "PLATFORM_BUTTON_LAYOUT_CAPS" )
		end
		f9_local0 = CoD.InGameMenu.New( "ButtonLayout", f9_arg0, f9_local1, CoD.isSinglePlayer )
		if CoD.isSinglePlayer == false and Engine.IsInGame() and Engine.IsSplitscreen() then
			f9_local0:sizeToSafeArea( f9_arg0 )
			f9_local0:updateTitleForSplitscreen()
			f9_local0:updateButtonPromptBarsForSplitscreen()
		end
	else
		f9_local0 = CoD.Menu.New( "ButtonLayout" )
		f9_local0:setOwner( f9_arg0 )
		f9_local0:addTitle( Engine.Localize( "PLATFORM_BUTTON_LAYOUT_CAPS" ) )
		local self = LUI.UIImage.new( {
			leftAnchor = false,
			rightAnchor = false,
			left = -640,
			right = 640,
			topAnchor = false,
			bottomAnchor = false,
			top = -360,
			bottom = 360,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 1
		} )
		self:setPriority( -100 )
		f9_local0:addElement( self )
		if CoD.isSinglePlayer == false then
			f9_local0:addLargePopupBackground()
			f9_local0:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	f9_local0.close = CoD.ButtonLayout.CloseMenu
	f9_local0.controller = f9_arg0
	if CoD.isSinglePlayer == true then
		f9_local0:addBackButton()
	else
		f9_local0:registerEventHandler( "add_back_button", CoD.ButtonLayout.AddBackButtonTimer )
		f9_local0.backButtonTimer = LUI.UITimer.new( 350, {
			name = "add_back_button",
			controller = f9_arg0
		} )
		f9_local0:addElement( f9_local0.backButtonTimer )
	end
	f9_local0:registerEventHandler( "button_layout_selection_changed", CoD.ButtonLayout.ButtonLayoutSelectionChanged )
	local self = 0
	if Engine.IsInGame() and CoD.isSinglePlayer == false and Engine.IsSplitscreen() then
		self = CoD.Menu.SplitscreenSideOffset
	end
	f9_local0.buttonLayoutButtonList = CoD.ButtonList.new()
	f9_local0.buttonLayoutButtonList:setLeftRight( true, false, self, self + CoD.ButtonList.DefaultWidth - 20 )
	f9_local0.buttonLayoutButtonList:setTopBottom( true, false, CoD.Menu.TitleHeight, CoD.Menu.TitleHeight + 720 )
	if CoD.isSinglePlayer and not CoD.isPS4 then
		f9_local0:addElement( f9_local0.buttonLayoutButtonList )
		if f9_arg1 and f9_arg1.height ~= nil then
			f9_local0.buttonLayoutButtonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			f9_local0.buttonLayoutButtonList:setTopBottom( false, false, -f9_arg1.height / 2, f9_arg1.height / 2 )
		end
	else
		local f9_local4 = CoD.SplitscreenScaler.new( nil, 1.5 )
		f9_local4:setLeftRight( true, false, 0, 0 )
		f9_local4:setTopBottom( true, false, 0, 0 )
		f9_local0:addElement( f9_local4 )
		f9_local4:addElement( f9_local0.buttonLayoutButtonList )
	end
	local f9_local4 = CoD.ButtonLayout.GetProfileVar( f9_arg0 )
	f9_local0.buttonLayoutSelector = f9_local0.buttonLayoutButtonList:addProfileLeftRightSelector( f9_arg0, Engine.Localize( "PLATFORM_BUTTON_LAYOUT_CAPS" ), f9_local4 )
	CoD.ButtonLayout.AddChoices( f9_local0.buttonLayoutSelector, f9_arg0 )
	if (CoD.isPS4 or CoD.isPC) and not f9_local2 then
		f9_local0.buttonFlippedSelector = f9_local0.buttonLayoutButtonList:addProfileLeftRightSelector( f9_arg0, Engine.Localize( "MENU_TRIGGER_CONFIG_CAPS" ), "flipped_control_config" )
		local f9_local5 = f9_local0.buttonFlippedSelector
		local f9_local6 = {}
		local f9_local7 = Engine.Localize( "MENU_DEFAULT_CAPS" )
		local f9_local8 = Engine.Localize( "MENU_FLIPPED_CAPS" )
		f9_local5.strings = f9_local7
		f9_local0.buttonFlippedSelector.values = {
			CoD.TRIGGERS_DEFAULT,
			CoD.TRIGGERS_FLIPPED
		}
		CoD.ButtonLayout.Button_AddChoices( f9_local0.buttonFlippedSelector, CoD.ButtonLayout.TriggerSelectionChanged )
	end
	f9_local0.buttonLayoutImageContainer = LUI.UIElement.new()
	f9_local0.buttonLayoutImageContainer:setLeftRight( false, false, 0, 0 )
	f9_local0.buttonLayoutImageContainer:setTopBottom( false, false, -50, -50 )
	f9_local0.buttonLayoutImageContainer.priority = -100
	f9_local0.buttonLayoutImageContainer.isTheaterButtonlayout = f9_local2
	f9_local0:addElement( f9_local0.buttonLayoutImageContainer )
	local f9_local5 = nil
	if CoD.isPS4 then
		f9_local5 = "ps4_controller_top"
	elseif CoD.isWIIU then
		local f9_local6 = Engine.GetControllerType( f9_arg0 )
		if f9_local6 == "classic" then
			f9_local5 = "wiiu_ccp_top"
		elseif f9_local6 == "uc" then
			f9_local5 = "wiiu_uc_top"
		else
			f9_local5 = "wiiu_drc_top"
		end
	elseif CoD.isPC then
		f9_local5 = "ps4_controller_top"
	else
		f9_local5 = "xenon_controller_top"
	end
	if CoD.isPS4 == true or CoD.isDurango == true then
		f9_local0.controllerImage = LUI.UIStreamedImage.new()
		f9_local0.controllerImage:setAlpha( 0 )
		f9_local0.controllerImage:registerEventHandler( "streamed_image_ready", CoD.ButtonLayout.StreamedImageReady )
	else
		f9_local0.controllerImage = LUI.UIImage.new()
	end
	if CoD.isPS4 or CoD.isPC then
		f9_local0.controllerImage:setLeftRight( false, false, -225, 225 )
		f9_local0.controllerImage:setTopBottom( false, false, -130, 320 )
	else
		f9_local0.controllerImage:setLeftRight( false, false, -250, 240 )
		f9_local0.controllerImage:setTopBottom( false, false, -140, 350 )
	end
	f9_local0.controllerImage:setImage( RegisterMaterial( f9_local5 ) )
	f9_local0.buttonLayoutImageContainer:addElement( f9_local0.controllerImage )
	CoD.ButtonLayout.AddLinesAndLabels( f9_local0.buttonLayoutImageContainer, f9_arg0 )
	CoD.ButtonLayout.UpdateButtonLinesAndLabels( f9_local0.buttonLayoutImageContainer, Engine.ProfileValueAsString( f9_arg0, f9_local4 ), f9_arg0 )
	f9_local0.buttonLayoutSelector:processEvent( {
		name = "gain_focus"
	} )
	return f9_local0
end

CoD.ButtonLayout.AddLine = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = CoD.Line.new( f10_arg1, f10_arg2, CoD.ButtonLayout.LineWidth, CoD.ButtonLayout.LineColor )
	f10_arg0:addElement( f10_local0 )
	return f10_local0
end

CoD.ButtonLayout.AddLeftAlignLabel = function ( f11_arg0, f11_arg1, f11_arg2 )
	local self = LUI.UIText.new()
	self:setLeftRight( true, false, f11_arg1, f11_arg1 + 1 )
	self:setTopBottom( true, false, f11_arg2, f11_arg2 + CoD.textSize.Default )
	self:setRGB( CoD.ButtonLayout.LineColor[1], CoD.ButtonLayout.LineColor[2], CoD.ButtonLayout.LineColor[3] )
	self:setFont( CoD.fonts.Default )
	f11_arg0:addElement( self )
	return self
end

CoD.ButtonLayout.AddRightAlignLabel = function ( f12_arg0, f12_arg1, f12_arg2 )
	local self = LUI.UIText.new()
	self:setLeftRight( false, true, f12_arg1, f12_arg1 - 1 )
	self:setTopBottom( true, false, f12_arg2, f12_arg2 + CoD.textSize.Default )
	self:setRGB( CoD.ButtonLayout.LineColor[1], CoD.ButtonLayout.LineColor[2], CoD.ButtonLayout.LineColor[3] )
	self:setFont( CoD.fonts.Default )
	f12_arg0:addElement( self )
	return self
end

CoD.ButtonLayout.AddCenterAlignLabel = function ( f13_arg0, f13_arg1, f13_arg2 )
	local self = LUI.UIText.new()
	self:setLeftRight( false, false, f13_arg1 - 1, f13_arg1 + 1 )
	self:setTopBottom( true, false, f13_arg2, f13_arg2 + CoD.textSize.Default )
	self:setRGB( CoD.ButtonLayout.LineColor[1], CoD.ButtonLayout.LineColor[2], CoD.ButtonLayout.LineColor[3] )
	self:setFont( CoD.fonts.Default )
	f13_arg0:addElement( self )
	return self
end

CoD.ButtonLayout.AddLinesAndLabels = function ( f14_arg0, f14_arg1 )
	if CoD.isPS4 then
		CoD.ButtonLayout.AddPS4LinesAndLabels( f14_arg0, f14_arg1 )
	elseif CoD.isWIIU then
		CoD.ButtonLayout.AddWiiULinesAndLabels( f14_arg0, f14_arg1 )
	elseif CoD.isPC then
		CoD.ButtonLayout.AddPS4LinesAndLabels( f14_arg0, f14_arg1 )
	else
		CoD.ButtonLayout.AddXenonLinesAndLabels( f14_arg0 )
	end
end

CoD.ButtonLayout.UpdateButtonLinesAndLabels = function ( f15_arg0, f15_arg1, f15_arg2 )
	if f15_arg0 == nil then
		return 
	end
	local f15_local0 = nil
	if Engine.IsDemoPlaying() then
		f15_local0 = true
	else
		f15_local0 = Engine.ProfileBool( f15_arg2, "flipped_control_config" )
	end
	for f15_local6, f15_local7 in pairs( CoD.ButtonLayout.ButtonRefs ) do
		local f15_local4 = f15_local7
		if CoD.isPS4 and f15_local0 == true then
			if f15_local7 == "BUTTON_LTRIG" then
				f15_local4 = "BUTTON_LBUMP"
			end
			if f15_local7 == "BUTTON_RTRIG" then
				f15_local4 = "BUTTON_RBUMP"
			end
			if f15_local7 == "BUTTON_LBUMP" then
				f15_local4 = "BUTTON_LTRIG"
			end
			if f15_local7 == "BUTTON_RBUMP" then
				f15_local4 = "BUTTON_RTRIG"
			end
		end
		if f15_arg0.buttonLabels ~= nil and f15_arg0.buttonLabels[f15_local4] ~= nil then
			local f15_local5 = nil
			if f15_arg0.isTheaterButtonlayout then
				f15_local5 = CoD.ButtonLayout.TheaterButtonStrings[f15_arg1 + 1][f15_local4]
			else
				f15_local5 = CoD.ButtonLayout.ButtonStrings[f15_arg1 + 1][f15_local4]
			end
			if f15_arg0.buttonLines[f15_local7] then
				if f15_local5 ~= "" then
					f15_arg0.buttonLines[f15_local7]:setAlpha( 1 )
				else
					f15_arg0.buttonLines[f15_local7]:setAlpha( 0 )
				end
			end
			f15_arg0.buttonLabels[f15_local7]:setText( Engine.Localize( f15_local5 ) )
		end
	end
end

CoD.ButtonLayout.ButtonLayoutSelectionChanged = function ( f16_arg0, f16_arg1 )
	CoD.ButtonLayout.UpdateButtonLinesAndLabels( f16_arg0.buttonLayoutImageContainer, Engine.ProfileValueAsString( f16_arg0.m_ownerController, CoD.ButtonLayout.GetProfileVar( f16_arg0.m_ownerController ) ), f16_arg0.m_ownerController )
end

CoD.ButtonLayout.AddPS4LinesAndLabels = function ( f17_arg0, f17_arg1 )
	f17_arg0.buttonLabels = {}
	f17_arg0.buttonLines = {}
	local f17_local0 = -10
	local f17_local1 = function ( f18_arg0 )
		return f18_arg0 * 0.98 - 250
	end
	
	local f17_local2 = function ( f19_arg0 )
		return f19_arg0 * 0.98 - 175
	end
	
	local f17_local3 = f17_local1( 460 )
	local f17_local4 = f17_local2( 345 )
	local f17_local5 = f17_arg0.buttonLines
	local f17_local6 = CoD.ButtonLayout.AddLine
	local f17_local7 = f17_arg0
	local f17_local8 = {}
	local f17_local9 = f17_local1( 395 )
	local f17_local10 = f17_local2( 300 )
	f17_local5.BUTTON_A = f17_local6( f17_local7, f17_local9, {
		f17_local3,
		f17_local4
	} )
	f17_arg0.buttonLabels.BUTTON_A = CoD.ButtonLayout.AddLeftAlignLabel( f17_arg0, f17_local3 + 5, f17_local4 + f17_local0 )
	f17_local5 = f17_local1( 460 )
	f17_local6 = f17_local2( 272 )
	f17_local7 = f17_arg0.buttonLines
	f17_local8 = CoD.ButtonLayout.AddLine
	f17_local9 = f17_arg0
	f17_local10 = {}
	local f17_local11 = f17_local1( 425 )
	local f17_local12 = f17_local2( 272 )
	f17_local7.BUTTON_B = f17_local8( f17_local9, f17_local11, {
		f17_local5,
		f17_local6
	} )
	f17_arg0.buttonLabels.BUTTON_B = CoD.ButtonLayout.AddLeftAlignLabel( f17_arg0, f17_local5 + 5, f17_local6 + f17_local0 )
	f17_local7 = f17_local1( 460 )
	f17_local8 = f17_local2( 310 )
	f17_local9 = f17_arg0.buttonLines
	f17_local10 = CoD.ButtonLayout.AddLine
	f17_local11 = f17_arg0
	f17_local12 = {}
	local f17_local13 = f17_local1( 360 )
	local f17_local14 = f17_local2( 272 )
	f17_local9.BUTTON_X = f17_local10( f17_local11, f17_local13, {
		f17_local7,
		f17_local8
	} )
	f17_arg0.buttonLabels.BUTTON_X = CoD.ButtonLayout.AddLeftAlignLabel( f17_arg0, f17_local7 + 5, f17_local8 + f17_local0 )
	f17_local9 = f17_local1( 460 )
	f17_local10 = f17_local2( 245 )
	f17_local11 = f17_arg0.buttonLines
	f17_local12 = CoD.ButtonLayout.AddLine
	f17_local13 = f17_arg0
	f17_local14 = {}
	local f17_local15 = f17_local1( 395 )
	local f17_local16 = f17_local2( 245 )
	f17_local11.BUTTON_Y = f17_local12( f17_local13, f17_local15, {
		f17_local9,
		f17_local10
	} )
	f17_arg0.buttonLabels.BUTTON_Y = CoD.ButtonLayout.AddLeftAlignLabel( f17_arg0, f17_local9 + 5, f17_local10 + f17_local0 )
	f17_local11 = f17_local1( 65 )
	f17_local12 = f17_local2( 160 )
	f17_local13 = f17_arg0.buttonLines
	f17_local14 = CoD.ButtonLayout.AddLine
	f17_local15 = f17_arg0
	f17_local16 = {
		f17_local11,
		f17_local12
	}
	local f17_local17 = {}
	local f17_local18 = f17_local1( 105 )
	local f17_local19 = f17_local2( 160 )
	f17_local13.BUTTON_LBUMP = f17_local14( f17_local15, f17_local16, f17_local18 )
	f17_arg0.buttonLabels.BUTTON_LBUMP = CoD.ButtonLayout.AddRightAlignLabel( f17_arg0, f17_local11 - 5, f17_local12 + f17_local0 )
	f17_local13 = f17_local1( 445 )
	f17_local14 = f17_local2( 160 )
	f17_local15 = f17_arg0.buttonLines
	f17_local16 = CoD.ButtonLayout.AddLine
	f17_local17 = f17_arg0
	f17_local18 = {}
	f17_local19 = f17_local1( 405 )
	local f17_local20 = f17_local2( 160 )
	f17_local15.BUTTON_RBUMP = f17_local16( f17_local17, f17_local19, {
		f17_local13,
		f17_local14
	} )
	f17_arg0.buttonLabels.BUTTON_RBUMP = CoD.ButtonLayout.AddLeftAlignLabel( f17_arg0, f17_local13 + 5, f17_local14 + f17_local0 )
	if not CoD.isSinglePlayer then
		f17_local15 = f17_local1( 50 )
		f17_local16 = f17_local2( 250 )
		f17_local17 = f17_arg0.buttonLines
		f17_local18 = CoD.ButtonLayout.AddLine
		f17_local19 = f17_arg0
		f17_local20 = {
			f17_local15,
			f17_local16
		}
		local f17_local21 = {}
		local f17_local22 = f17_local1( 115 )
		local f17_local23 = f17_local2( 250 )
		f17_local17.BUTTON_UP = f17_local18( f17_local19, f17_local20, f17_local22 )
		f17_arg0.buttonLabels.BUTTON_UP = CoD.ButtonLayout.AddRightAlignLabel( f17_arg0, f17_local15 - 5, f17_local16 + f17_local0 )
	end
	if not CoD.isSinglePlayer then
		f17_local15 = f17_local1( 50 )
		f17_local16 = f17_local2( 345 )
		f17_local17 = f17_arg0.buttonLines
		f17_local18 = CoD.ButtonLayout.AddLine
		f17_local19 = f17_arg0
		f17_local20 = {
			f17_local15,
			f17_local16
		}
		local f17_local21 = {}
		local f17_local22 = f17_local1( 115 )
		local f17_local23 = f17_local2( 300 )
		f17_local17.BUTTON_DOWN = f17_local18( f17_local19, f17_local20, f17_local22 )
		f17_arg0.buttonLabels.BUTTON_DOWN = CoD.ButtonLayout.AddRightAlignLabel( f17_arg0, f17_local15 - 5, f17_local16 + f17_local0 )
	end
	f17_local15 = f17_local1( 50 )
	f17_local16 = f17_local2( 274 )
	f17_local17 = f17_arg0.buttonLines
	f17_local18 = CoD.ButtonLayout.AddLine
	f17_local19 = f17_arg0
	f17_local20 = {
		f17_local15,
		f17_local16
	}
	local f17_local21 = {}
	local f17_local22 = f17_local1( 94 )
	local f17_local23 = f17_local2( 274 )
	f17_local17.BUTTON_LEFT = f17_local18( f17_local19, f17_local20, f17_local22 )
	f17_arg0.buttonLabels.BUTTON_LEFT = CoD.ButtonLayout.AddRightAlignLabel( f17_arg0, f17_local15 - 5, f17_local16 + f17_local0 )
	if not CoD.isSinglePlayer then
		f17_local17 = f17_local1( 50 )
		f17_local18 = f17_local2( 310 )
		f17_local19 = f17_arg0.buttonLines
		f17_local20 = CoD.ButtonLayout.AddLine
		f17_local21 = f17_arg0
		f17_local22 = {}
		f17_local23 = f17_local1( 140 )
		local f17_local24 = f17_local2( 274 )
		f17_local19.BUTTON_RIGHT = f17_local20( f17_local21, f17_local23, {
			f17_local17,
			f17_local18
		} )
		f17_arg0.buttonLabels.BUTTON_RIGHT = CoD.ButtonLayout.AddRightAlignLabel( f17_arg0, f17_local17 - 5, f17_local18 + f17_local0 )
	end
	f17_local17 = f17_local1( 92 )
	f17_local18 = f17_local2( 108 )
	f17_local19 = f17_arg0.buttonLines
	f17_local20 = CoD.ButtonLayout.AddLine
	f17_local21 = f17_arg0
	f17_local22 = {
		f17_local17,
		f17_local18
	}
	f17_local23 = {}
	local f17_local24 = f17_local1( 115 )
	local f17_local25 = f17_local2( 130 )
	f17_local19.BUTTON_LTRIG = f17_local20( f17_local21, f17_local22, f17_local24 )
	f17_arg0.buttonLabels.BUTTON_LTRIG = CoD.ButtonLayout.AddRightAlignLabel( f17_arg0, f17_local17 - 5, f17_local18 + f17_local0 )
	f17_local19 = f17_local1( 420 )
	f17_local20 = f17_local2( 108 )
	f17_local21 = f17_arg0.buttonLines
	f17_local22 = CoD.ButtonLayout.AddLine
	f17_local23 = f17_arg0
	f17_local24 = {}
	f17_local25 = f17_local1( 395 )
	local f17_local26 = f17_local2( 130 )
	f17_local21.BUTTON_RTRIG = f17_local22( f17_local23, f17_local25, {
		f17_local19,
		f17_local20
	} )
	f17_arg0.buttonLabels.BUTTON_RTRIG = CoD.ButtonLayout.AddLeftAlignLabel( f17_arg0, f17_local19 + 5, f17_local20 + f17_local0 )
	if not CoD.isSinglePlayer then
		f17_local21 = f17_local1( 255 )
		f17_local22 = f17_local2( 140 )
		f17_local23 = f17_arg0.buttonLines
		f17_local24 = CoD.ButtonLayout.AddLine
		f17_local25 = f17_arg0
		f17_local26 = {}
		local f17_local27 = f17_local1( 255 )
		local f17_local28 = f17_local2( 220 )
		f17_local23.BUTTON_BACK = f17_local24( f17_local25, f17_local27, {
			f17_local21,
			f17_local22
		} )
		f17_arg0.buttonLabels.BUTTON_BACK = CoD.ButtonLayout.AddCenterAlignLabel( f17_arg0, f17_local21, f17_local22 - CoD.textSize.Default )
	end
	f17_local21 = f17_local1( 342 )
	f17_local22 = f17_local2( 110 )
	f17_local23 = f17_arg0.buttonLines
	f17_local24 = CoD.ButtonLayout.AddLine
	f17_local25 = f17_arg0
	f17_local26 = {}
	local f17_local27 = f17_local1( 342 )
	local f17_local28 = f17_local2( 218 )
	f17_local23.BUTTON_START = f17_local24( f17_local25, f17_local27, {
		f17_local21,
		f17_local22
	} )
	f17_arg0.buttonLabels.BUTTON_START = CoD.ButtonLayout.AddCenterAlignLabel( f17_arg0, f17_local21, f17_local22 - CoD.textSize.Default )
	f17_local23 = f17_local1( 185 )
	f17_local24 = f17_local2( 405 )
	f17_local25 = f17_arg0.buttonLines
	f17_local26 = CoD.ButtonLayout.AddLine
	f17_local27 = f17_arg0
	f17_local28 = {
		f17_local23,
		f17_local24
	}
	local f17_local29 = {}
	local f17_local30 = f17_local1( 185 )
	local f17_local31 = f17_local2( 344 )
	f17_local25.BUTTON_LSTICK = f17_local26( f17_local27, f17_local28, f17_local30 )
	f17_arg0.buttonLabels.BUTTON_LSTICK = CoD.ButtonLayout.AddCenterAlignLabel( f17_arg0, f17_local23, f17_local24 )
	f17_local25 = f17_local1( 323 )
	f17_local26 = f17_local2( 375 )
	f17_local27 = f17_arg0.buttonLines
	f17_local28 = CoD.ButtonLayout.AddLine
	f17_local29 = f17_arg0
	f17_local30 = {}
	f17_local31 = f17_local1( 323 )
	local f17_local32 = f17_local2( 344 )
	f17_local27.BUTTON_RSTICK = f17_local28( f17_local29, f17_local31, {
		f17_local25,
		f17_local26
	} )
	f17_arg0.buttonLabels.BUTTON_RSTICK = CoD.ButtonLayout.AddCenterAlignLabel( f17_arg0, f17_local25, f17_local26 )
end

CoD.ButtonLayout.AddXenonLinesAndLabels = function ( f20_arg0 )
	f20_arg0.buttonLabels = {}
	f20_arg0.buttonLines = {}
	local f20_local0 = -10
	local f20_local1 = 200
	local f20_local2 = 130
	f20_arg0.buttonLines.BUTTON_A = CoD.ButtonLayout.AddLine( f20_arg0, {
		120,
		88
	}, {
		f20_local1,
		f20_local2
	} )
	f20_arg0.buttonLabels.BUTTON_A = CoD.ButtonLayout.AddLeftAlignLabel( f20_arg0, f20_local1 + 5, f20_local2 + f20_local0 )
	local f20_local3 = 200
	local f20_local4 = 60
	f20_arg0.buttonLines.BUTTON_B = CoD.ButtonLayout.AddLine( f20_arg0, {
		163,
		44
	}, {
		f20_local3,
		f20_local4
	} )
	f20_arg0.buttonLabels.BUTTON_B = CoD.ButtonLayout.AddLeftAlignLabel( f20_arg0, f20_local3 + 5, f20_local4 + f20_local0 )
	local f20_local5 = 205
	local f20_local6 = 95
	f20_arg0.buttonLines.BUTTON_X = CoD.ButtonLayout.AddLine( f20_arg0, {
		100,
		44
	}, {
		f20_local5,
		f20_local6
	} )
	f20_arg0.buttonLabels.BUTTON_X = CoD.ButtonLayout.AddLeftAlignLabel( f20_arg0, f20_local5 + 5, f20_local6 + f20_local0 )
	local f20_local7 = 195
	local f20_local8 = 25
	f20_arg0.buttonLines.BUTTON_Y = CoD.ButtonLayout.AddLine( f20_arg0, {
		132,
		10
	}, {
		f20_local7,
		f20_local8
	} )
	f20_arg0.buttonLabels.BUTTON_Y = CoD.ButtonLayout.AddLeftAlignLabel( f20_arg0, f20_local7 + 5, f20_local8 + f20_local0 )
	local f20_local9 = -170
	local f20_local10 = -23
	f20_arg0.buttonLines.BUTTON_LBUMP = CoD.ButtonLayout.AddLine( f20_arg0, {
		f20_local9,
		f20_local10
	}, {
		-130,
		-23
	} )
	f20_arg0.buttonLabels.BUTTON_LBUMP = CoD.ButtonLayout.AddRightAlignLabel( f20_arg0, f20_local9 - 5, f20_local10 + f20_local0 )
	local f20_local11 = 170
	local f20_local12 = -23
	f20_arg0.buttonLines.BUTTON_RBUMP = CoD.ButtonLayout.AddLine( f20_arg0, {
		130,
		-23
	}, {
		f20_local11,
		f20_local12
	} )
	f20_arg0.buttonLabels.BUTTON_RBUMP = CoD.ButtonLayout.AddLeftAlignLabel( f20_arg0, f20_local11 + 5, f20_local12 + f20_local0 )
	if not CoD.isSinglePlayer then
		local f20_local13 = -205
		local f20_local14 = 110
		f20_arg0.buttonLines.BUTTON_UP = CoD.ButtonLayout.AddLine( f20_arg0, {
			f20_local13,
			f20_local14
		}, {
			-62,
			95
		} )
		f20_arg0.buttonLabels.BUTTON_UP = CoD.ButtonLayout.AddRightAlignLabel( f20_arg0, f20_local13 - 5, f20_local14 + f20_local0 )
	end
	if not CoD.isSinglePlayer then
		local f20_local13 = -205
		local f20_local14 = 180
		f20_arg0.buttonLines.BUTTON_DOWN = CoD.ButtonLayout.AddLine( f20_arg0, {
			f20_local13,
			f20_local14
		}, {
			-62,
			140
		} )
		f20_arg0.buttonLabels.BUTTON_DOWN = CoD.ButtonLayout.AddRightAlignLabel( f20_arg0, f20_local13 - 5, f20_local14 + f20_local0 )
	end
	local f20_local13 = -210
	local f20_local14 = 145
	f20_arg0.buttonLines.BUTTON_LEFT = CoD.ButtonLayout.AddLine( f20_arg0, {
		f20_local13,
		f20_local14
	}, {
		-83,
		119
	} )
	f20_arg0.buttonLabels.BUTTON_LEFT = CoD.ButtonLayout.AddRightAlignLabel( f20_arg0, f20_local13 - 5, f20_local14 + f20_local0 )
	if not CoD.isSinglePlayer then
		local f20_local15 = -38
		local f20_local16 = 250
		f20_arg0.buttonLines.BUTTON_RIGHT = CoD.ButtonLayout.AddLine( f20_arg0, {
			-38,
			119
		}, {
			f20_local15,
			f20_local16
		} )
		f20_arg0.buttonLabels.BUTTON_RIGHT = CoD.ButtonLayout.AddCenterAlignLabel( f20_arg0, f20_local15, f20_local16 )
	end
	local f20_local15 = -160
	local f20_local16 = -70
	f20_arg0.buttonLines.BUTTON_LTRIG = CoD.ButtonLayout.AddLine( f20_arg0, {
		f20_local15,
		f20_local16
	}, {
		-108,
		-40
	} )
	f20_arg0.buttonLabels.BUTTON_LTRIG = CoD.ButtonLayout.AddRightAlignLabel( f20_arg0, f20_local15 - 5, f20_local16 + f20_local0 )
	local f20_local17 = 160
	local f20_local18 = -70
	f20_arg0.buttonLines.BUTTON_RTRIG = CoD.ButtonLayout.AddLine( f20_arg0, {
		108,
		-40
	}, {
		f20_local17,
		f20_local18
	} )
	f20_arg0.buttonLabels.BUTTON_RTRIG = CoD.ButtonLayout.AddLeftAlignLabel( f20_arg0, f20_local17 + 5, f20_local18 + f20_local0 )
	if not CoD.isSinglePlayer then
		local f20_local19 = -42
		local f20_local20 = -135
		f20_arg0.buttonLines.BUTTON_BACK = CoD.ButtonLayout.AddLine( f20_arg0, {
			-42,
			48
		}, {
			f20_local19,
			f20_local20
		} )
		f20_arg0.buttonLabels.BUTTON_BACK = CoD.ButtonLayout.AddCenterAlignLabel( f20_arg0, f20_local19, f20_local20 - CoD.textSize.Default )
	end
	local f20_local19 = 42
	local f20_local20 = -100
	f20_arg0.buttonLines.BUTTON_START = CoD.ButtonLayout.AddLine( f20_arg0, {
		42,
		48
	}, {
		f20_local19,
		f20_local20
	} )
	f20_arg0.buttonLabels.BUTTON_START = CoD.ButtonLayout.AddCenterAlignLabel( f20_arg0, f20_local19, f20_local20 - CoD.textSize.Default )
	local f20_local21 = -190
	local f20_local22 = 52
	f20_arg0.buttonLines.BUTTON_LSTICK = CoD.ButtonLayout.AddLine( f20_arg0, {
		f20_local21,
		f20_local22
	}, {
		-120,
		52
	} )
	f20_arg0.buttonLabels.BUTTON_LSTICK = CoD.ButtonLayout.AddRightAlignLabel( f20_arg0, f20_local21 - 5, f20_local22 + f20_local0 )
	local f20_local23 = 56
	local f20_local24 = 220
	f20_arg0.buttonLines.BUTTON_RSTICK = CoD.ButtonLayout.AddLine( f20_arg0, {
		56,
		123
	}, {
		f20_local23,
		f20_local24
	} )
	f20_arg0.buttonLabels.BUTTON_RSTICK = CoD.ButtonLayout.AddCenterAlignLabel( f20_arg0, f20_local23, f20_local24 )
end

