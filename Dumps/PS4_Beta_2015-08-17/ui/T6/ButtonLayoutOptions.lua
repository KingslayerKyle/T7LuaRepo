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
CoD.ButtonLayout.GetProfileVar = function ( controller )
	local profileVar = "gpad_buttonsConfig"
	if Engine.IsDemoPlaying() then
		profileVar = "demo_controllerconfig"
	elseif CoD.isWIIU then
		local controllerType = Engine.GetControllerType( controller )
		if controllerType == "remote" then
			profileVar = "gpad_remoteButtonsConfig"
		elseif controllerType == "classic" then
			profileVar = "gpad_classicButtonsConfig"
		end
	end
	return profileVar
end

CoD.ButtonLayout.SelectionChanged = function ( choiceParams, userRequested )
	if userRequested then
		Engine.SetProfileVar( choiceParams.parentSelectorButton.m_currentController, choiceParams.parentSelectorButton.m_profileVarName, choiceParams.value )
	end
	choiceParams.parentSelectorButton:dispatchEventToParent( {
		name = "button_layout_selection_changed",
		choiceParams = choiceParams
	} )
end

CoD.ButtonLayout.TriggerSelectionChanged = function ( choiceParams )
	Engine.SetProfileVar( choiceParams.parentSelectorButton.m_currentController, choiceParams.parentSelectorButton.m_profileVarName, choiceParams.value )
	choiceParams.parentSelectorButton:dispatchEventToParent( {
		name = "button_layout_selection_changed",
		controller = choiceParams.controller
	} )
end

CoD.ButtonLayout.Button_AddChoices = function ( button, selectionChangedCallbackFunc )
	if button.strings == nil or #button.strings == 0 then
		return 
	end
	for index = 1, #button.strings, 1 do
		button:addChoice( button.strings[index], button.values[index], nil, selectionChangedCallbackFunc )
	end
end

CoD.ButtonLayout.AddChoices = function ( button, controller )
	if Engine.IsDemoPlaying() then
		if CoD.isWIIU then
			local f5_local0 = {}
			local f5_local1 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_DEFAULT" ) )
			local f5_local2 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_BADBOT" ) )
			button.strings = f5_local1
			button.values = {
				CoD.DEMO_CONTROLLER_CONFIG_DIGITAL,
				CoD.DEMO_CONTROLLER_CONFIG_BADBOT
			}
		else
			local f5_local0 = {}
			local f5_local1 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_DEFAULT" ) )
			local f5_local2 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_DIGITAL" ) )
			local f5_local3 = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_BADBOT" ) )
			button.strings = f5_local1
			button.values = {
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
		local f5_local8 = Engine.Localize( "MENU_STICKMOVE_CAPS" )
		button.strings = f5_local1
		button.values = {
			CoD.BUTTONS_DEFAULT,
			CoD.BUTTONS_EXPERIMENTAL,
			CoD.BUTTONS_LEFTY,
			CoD.BUTTONS_NOMAD,
			CoD.BUTTONS_CHARLIE,
			CoD.BUTTONS_GUNSLINGER,
			CoD.BUTTONS_BUMPERJUMPER,
			CoD.BUTTONS_STICKMOVE
		}
	end
	CoD.ButtonLayout.Button_AddChoices( button, CoD.ButtonLayout.SelectionChanged )
end

CoD.ButtonLayout.CloseMenu = function ( self )
	if Engine.IsInGame() then
		Engine.Exec( self:getOwner(), "updateVehicleBindings" )
	end
	Engine.PlaySound( "uin_cmn_backout" )
	Engine.Exec( self:getOwner(), "updategamerprofile" )
	if CoD.isCampaign == false then
		self:saveState()
	end
	CoD.Menu.close( self )
end

CoD.ButtonLayout.StreamedImageReady = function ( self, event )
	self:beginAnimation( "fade_in", 250 )
	self:setAlpha( 1 )
end

CoD.ButtonLayout.AddBackButtonTimer = function ( self, event )
	self:addBackButton()
	self.backButtonTimer:close()
	self.backButtonTimer = nil
end

LUI.createMenu.ButtonLayout = function ( controller, userData )
	local buttonLayoutMenu, titleText = nil
	local isDemoPlaying = Engine.IsDemoPlaying()
	if Engine.IsInGame() then
		if isDemoPlaying then
			titleText = Engine.Localize( "MENU_THEATER_BUTTON_LAYOUT_CAPS" )
		else
			titleText = Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" )
		end
		buttonLayoutMenu = CoD.InGameMenu.New( "ButtonLayout", controller, titleText, CoD.isSinglePlayer )
		if CoD.isSinglePlayer == false and Engine.IsInGame() and Engine.IsSplitscreen() then
			buttonLayoutMenu:sizeToSafeArea( controller )
			buttonLayoutMenu:updateTitleForSplitscreen()
			buttonLayoutMenu:updateButtonPromptBarsForSplitscreen()
		end
	else
		buttonLayoutMenu = CoD.Menu.New( "ButtonLayout" )
		buttonLayoutMenu:setOwner( controller )
		buttonLayoutMenu:addTitle( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ) )
		local background = LUI.UIImage.new( {
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
		background:setPriority( -100 )
		buttonLayoutMenu:addElement( background )
		if CoD.isSinglePlayer == false then
			buttonLayoutMenu:addLargePopupBackground()
			buttonLayoutMenu:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	buttonLayoutMenu.close = CoD.ButtonLayout.CloseMenu
	buttonLayoutMenu.controller = controller
	if CoD.isSinglePlayer == true then
		buttonLayoutMenu:addBackButton()
	else
		buttonLayoutMenu:registerEventHandler( "add_back_button", CoD.ButtonLayout.AddBackButtonTimer )
		buttonLayoutMenu.backButtonTimer = LUI.UITimer.new( 350, {
			name = "add_back_button",
			controller = controller
		} )
		buttonLayoutMenu:addElement( buttonLayoutMenu.backButtonTimer )
	end
	buttonLayoutMenu:registerEventHandler( "button_layout_selection_changed", CoD.ButtonLayout.ButtonLayoutSelectionChanged )
	local buttonListLeft = 0
	if Engine.IsInGame() and CoD.isSinglePlayer == false and Engine.IsSplitscreen() then
		buttonListLeft = CoD.Menu.SplitscreenSideOffset
	end
	buttonLayoutMenu.buttonLayoutButtonList = CoD.ButtonList.new()
	buttonLayoutMenu.buttonLayoutButtonList:setLeftRight( true, false, buttonListLeft, buttonListLeft + CoD.ButtonList.DefaultWidth - 20 )
	buttonLayoutMenu.buttonLayoutButtonList:setTopBottom( true, false, CoD.Menu.TitleHeight, CoD.Menu.TitleHeight + 720 )
	if CoD.isSinglePlayer and not CoD.isPS4 then
		buttonLayoutMenu:addElement( buttonLayoutMenu.buttonLayoutButtonList )
		if userData and userData.height ~= nil then
			buttonLayoutMenu.buttonLayoutButtonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			buttonLayoutMenu.buttonLayoutButtonList:setTopBottom( false, false, -userData.height / 2, userData.height / 2 )
		end
	else
		local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
		buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
		buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
		buttonLayoutMenu:addElement( buttonListScaleContainer )
		buttonListScaleContainer:addElement( buttonLayoutMenu.buttonLayoutButtonList )
	end
	local profileVar = CoD.ButtonLayout.GetProfileVar( controller )
	buttonLayoutMenu.buttonLayoutSelector = buttonLayoutMenu.buttonLayoutButtonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ), profileVar )
	CoD.ButtonLayout.AddChoices( buttonLayoutMenu.buttonLayoutSelector, controller )
	if (CoD.isPS4 or CoD.isPC) and not isDemoPlaying then
		buttonLayoutMenu.buttonFlippedSelector = buttonLayoutMenu.buttonLayoutButtonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_TRIGGER_CONFIG_CAPS" ), "flipped_control_config" )
		local f9_local0 = buttonLayoutMenu.buttonFlippedSelector
		local f9_local1 = {}
		local f9_local2 = Engine.Localize( "MENU_DEFAULT_CAPS" )
		local f9_local3 = Engine.Localize( "MENU_FLIPPED_CAPS" )
		f9_local0.strings = f9_local2
		buttonLayoutMenu.buttonFlippedSelector.values = {
			CoD.TRIGGERS_DEFAULT,
			CoD.TRIGGERS_FLIPPED
		}
		CoD.ButtonLayout.Button_AddChoices( buttonLayoutMenu.buttonFlippedSelector, CoD.ButtonLayout.TriggerSelectionChanged )
	end
	buttonLayoutMenu.buttonLayoutImageContainer = LUI.UIElement.new()
	buttonLayoutMenu.buttonLayoutImageContainer:setLeftRight( false, false, 0, 0 )
	buttonLayoutMenu.buttonLayoutImageContainer:setTopBottom( false, false, -50, -50 )
	buttonLayoutMenu.buttonLayoutImageContainer.priority = -100
	buttonLayoutMenu.buttonLayoutImageContainer.isTheaterButtonlayout = isDemoPlaying
	buttonLayoutMenu:addElement( buttonLayoutMenu.buttonLayoutImageContainer )
	local controllerMaterial = nil
	if CoD.isPS4 then
		controllerMaterial = "ps4_controller_top"
	elseif CoD.isWIIU then
		local controllerType = Engine.GetControllerType( controller )
		if controllerType == "classic" then
			controllerMaterial = "wiiu_ccp_top"
		elseif controllerType == "uc" then
			controllerMaterial = "wiiu_uc_top"
		else
			controllerMaterial = "wiiu_drc_top"
		end
	elseif CoD.isPC then
		controllerMaterial = "ps4_controller_top"
	else
		controllerMaterial = "xenon_controller_top"
	end
	if CoD.isPS == true or CoD.isXBOX == true then
		buttonLayoutMenu.controllerImage = LUI.UIStreamedImage.new()
		buttonLayoutMenu.controllerImage:setAlpha( 0 )
		buttonLayoutMenu.controllerImage:registerEventHandler( "streamed_image_ready", CoD.ButtonLayout.StreamedImageReady )
	else
		buttonLayoutMenu.controllerImage = LUI.UIImage.new()
	end
	if CoD.isPS4 or CoD.isPC then
		buttonLayoutMenu.controllerImage:setLeftRight( false, false, -225, 225 )
		buttonLayoutMenu.controllerImage:setTopBottom( false, false, -130, 320 )
	else
		buttonLayoutMenu.controllerImage:setLeftRight( false, false, -250, 240 )
		buttonLayoutMenu.controllerImage:setTopBottom( false, false, -140, 350 )
	end
	buttonLayoutMenu.controllerImage:setImage( RegisterMaterial( controllerMaterial ) )
	buttonLayoutMenu.buttonLayoutImageContainer:addElement( buttonLayoutMenu.controllerImage )
	CoD.ButtonLayout.AddLinesAndLabels( buttonLayoutMenu.buttonLayoutImageContainer, controller )
	local layout = Engine.ProfileValueAsString( controller, profileVar )
	CoD.ButtonLayout.UpdateButtonLinesAndLabels( buttonLayoutMenu.buttonLayoutImageContainer, layout, controller )
	buttonLayoutMenu.buttonLayoutSelector:processEvent( {
		name = "gain_focus"
	} )
	return buttonLayoutMenu
end

CoD.ButtonLayout.AddLine = function ( self, p1, p2 )
	local newLine = CoD.Line.new( p1, p2, CoD.ButtonLayout.LineWidth, CoD.ButtonLayout.LineColor )
	self:addElement( newLine )
	return newLine
end

CoD.ButtonLayout.AddLeftAlignLabel = function ( self, left, top )
	local newLabel = LUI.UIText.new()
	newLabel:setLeftRight( true, false, left, left + 1 )
	newLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	newLabel:setRGB( CoD.ButtonLayout.LineColor[1], CoD.ButtonLayout.LineColor[2], CoD.ButtonLayout.LineColor[3] )
	newLabel:setFont( CoD.fonts.Default )
	self:addElement( newLabel )
	return newLabel
end

CoD.ButtonLayout.AddRightAlignLabel = function ( self, right, top )
	local newLabel = LUI.UIText.new()
	newLabel:setLeftRight( false, true, right, right - 1 )
	newLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	newLabel:setRGB( CoD.ButtonLayout.LineColor[1], CoD.ButtonLayout.LineColor[2], CoD.ButtonLayout.LineColor[3] )
	newLabel:setFont( CoD.fonts.Default )
	self:addElement( newLabel )
	return newLabel
end

CoD.ButtonLayout.AddCenterAlignLabel = function ( self, center, top )
	local newLabel = LUI.UIText.new()
	newLabel:setLeftRight( false, false, center - 1, center + 1 )
	newLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	newLabel:setRGB( CoD.ButtonLayout.LineColor[1], CoD.ButtonLayout.LineColor[2], CoD.ButtonLayout.LineColor[3] )
	newLabel:setFont( CoD.fonts.Default )
	self:addElement( newLabel )
	return newLabel
end

CoD.ButtonLayout.AddLinesAndLabels = function ( self, controller )
	if CoD.isPS4 then
		CoD.ButtonLayout.AddPS4LinesAndLabels( self, controller )
	elseif CoD.isWIIU then
		CoD.ButtonLayout.AddWiiULinesAndLabels( self, controller )
	elseif CoD.isPC then
		CoD.ButtonLayout.AddPS4LinesAndLabels( self, controller )
	else
		CoD.ButtonLayout.AddXenonLinesAndLabels( self )
	end
end

CoD.ButtonLayout.UpdateButtonLinesAndLabels = function ( self, layout, controller )
	if self == nil then
		return 
	end
	local flipped = nil
	if Engine.IsDemoPlaying() then
		flipped = true
	else
		flipped = Engine.ProfileBool( controller, "flipped_control_config" )
	end
	for index, buttonRef in pairs( CoD.ButtonLayout.ButtonRefs ) do
		local f15_local3 = buttonRef
		if CoD.isPS4 and flipped == true then
			if buttonRef == "BUTTON_LTRIG" then
				f15_local3 = "BUTTON_LBUMP"
			end
			if buttonRef == "BUTTON_RTRIG" then
				f15_local3 = "BUTTON_RBUMP"
			end
			if buttonRef == "BUTTON_LBUMP" then
				f15_local3 = "BUTTON_LTRIG"
			end
			if buttonRef == "BUTTON_RBUMP" then
				f15_local3 = "BUTTON_RTRIG"
			end
		end
		if self.buttonLabels ~= nil and self.buttonLabels[f15_local3] ~= nil then
			local string = nil
			if self.isTheaterButtonlayout then
				string = CoD.ButtonLayout.TheaterButtonStrings[layout + 1][f15_local3]
			else
				string = CoD.ButtonLayout.ButtonStrings[layout + 1][f15_local3]
			end
			if self.buttonLines[buttonRef] then
				if string ~= "" then
					self.buttonLines[buttonRef]:setAlpha( 1 )
				else
					self.buttonLines[buttonRef]:setAlpha( 0 )
				end
			end
			self.buttonLabels[buttonRef]:setText( Engine.Localize( string ) )
		end
	end
end

CoD.ButtonLayout.ButtonLayoutSelectionChanged = function ( self, event )
	local profileVar = CoD.ButtonLayout.GetProfileVar( self.m_ownerController )
	local layout = Engine.ProfileValueAsString( self.m_ownerController, profileVar )
	CoD.ButtonLayout.UpdateButtonLinesAndLabels( self.buttonLayoutImageContainer, layout, self.m_ownerController )
end

CoD.ButtonLayout.AddPS4LinesAndLabels = function ( self, controller )
	self.buttonLabels = {}
	self.buttonLines = {}
	local labelTopOffset = -10
	local dx = function ( x )
		return x * 0.98 - 250
	end
	
	local dy = function ( y )
		return y * 0.98 - 175
	end
	
	local aLineEndLeft = dx( 460 )
	local aLineEndTop = dy( 345 )
	local f17_local0 = self.buttonLines
	local f17_local1 = CoD.ButtonLayout.AddLine
	local f17_local2 = self
	local f17_local3 = {}
	local f17_local4 = dx( 395 )
	local f17_local5 = dy( 300 )
	f17_local0.BUTTON_A = f17_local1( f17_local2, f17_local4, {
		aLineEndLeft,
		aLineEndTop
	} )
	self.buttonLabels.BUTTON_A = CoD.ButtonLayout.AddLeftAlignLabel( self, aLineEndLeft + 5, aLineEndTop + labelTopOffset )
	local bLineEndLeft = dx( 460 )
	local bLineEndTop = dy( 272 )
	f17_local2 = self.buttonLines
	f17_local3 = CoD.ButtonLayout.AddLine
	f17_local4 = self
	f17_local5 = {}
	local f17_local6 = dx( 425 )
	local f17_local7 = dy( 272 )
	f17_local2.BUTTON_B = f17_local3( f17_local4, f17_local6, {
		bLineEndLeft,
		bLineEndTop
	} )
	self.buttonLabels.BUTTON_B = CoD.ButtonLayout.AddLeftAlignLabel( self, bLineEndLeft + 5, bLineEndTop + labelTopOffset )
	local xLineEndLeft = dx( 460 )
	local xLineEndTop = dy( 310 )
	f17_local4 = self.buttonLines
	f17_local5 = CoD.ButtonLayout.AddLine
	f17_local6 = self
	f17_local7 = {}
	local f17_local8 = dx( 360 )
	local f17_local9 = dy( 272 )
	f17_local4.BUTTON_X = f17_local5( f17_local6, f17_local8, {
		xLineEndLeft,
		xLineEndTop
	} )
	self.buttonLabels.BUTTON_X = CoD.ButtonLayout.AddLeftAlignLabel( self, xLineEndLeft + 5, xLineEndTop + labelTopOffset )
	local yLineEndLeft = dx( 460 )
	local yLineEndTop = dy( 245 )
	f17_local6 = self.buttonLines
	f17_local7 = CoD.ButtonLayout.AddLine
	f17_local8 = self
	f17_local9 = {}
	local f17_local10 = dx( 395 )
	local f17_local11 = dy( 245 )
	f17_local6.BUTTON_Y = f17_local7( f17_local8, f17_local10, {
		yLineEndLeft,
		yLineEndTop
	} )
	self.buttonLabels.BUTTON_Y = CoD.ButtonLayout.AddLeftAlignLabel( self, yLineEndLeft + 5, yLineEndTop + labelTopOffset )
	local lBumpLineStartLeft = dx( 65 )
	local lBumpLineStartTop = dy( 160 )
	f17_local8 = self.buttonLines
	f17_local9 = CoD.ButtonLayout.AddLine
	f17_local10 = self
	f17_local11 = {
		lBumpLineStartLeft,
		lBumpLineStartTop
	}
	local f17_local12 = {}
	local f17_local13 = dx( 105 )
	local f17_local14 = dy( 160 )
	f17_local8.BUTTON_LBUMP = f17_local9( f17_local10, f17_local11, f17_local13 )
	self.buttonLabels.BUTTON_LBUMP = CoD.ButtonLayout.AddRightAlignLabel( self, lBumpLineStartLeft - 5, lBumpLineStartTop + labelTopOffset )
	local rBumpLineEndLeft = dx( 445 )
	local rBumpLineEndTop = dy( 160 )
	f17_local10 = self.buttonLines
	f17_local11 = CoD.ButtonLayout.AddLine
	f17_local12 = self
	f17_local13 = {}
	f17_local14 = dx( 405 )
	local f17_local15 = dy( 160 )
	f17_local10.BUTTON_RBUMP = f17_local11( f17_local12, f17_local14, {
		rBumpLineEndLeft,
		rBumpLineEndTop
	} )
	self.buttonLabels.BUTTON_RBUMP = CoD.ButtonLayout.AddLeftAlignLabel( self, rBumpLineEndLeft + 5, rBumpLineEndTop + labelTopOffset )
	if not CoD.isSinglePlayer then
		local upLineStartLeft = dx( 50 )
		local upLineStartTop = dy( 250 )
		f17_local12 = self.buttonLines
		f17_local13 = CoD.ButtonLayout.AddLine
		f17_local14 = self
		f17_local15 = {
			upLineStartLeft,
			upLineStartTop
		}
		local f17_local16 = {}
		local f17_local17 = dx( 115 )
		local f17_local18 = dy( 250 )
		f17_local12.BUTTON_UP = f17_local13( f17_local14, f17_local15, f17_local17 )
		self.buttonLabels.BUTTON_UP = CoD.ButtonLayout.AddRightAlignLabel( self, upLineStartLeft - 5, upLineStartTop + labelTopOffset )
	end
	if not CoD.isSinglePlayer then
		local downLineStartLeft = dx( 50 )
		local downLineStartTop = dy( 345 )
		f17_local12 = self.buttonLines
		f17_local13 = CoD.ButtonLayout.AddLine
		f17_local14 = self
		f17_local15 = {
			downLineStartLeft,
			downLineStartTop
		}
		local f17_local16 = {}
		local f17_local17 = dx( 115 )
		local f17_local18 = dy( 300 )
		f17_local12.BUTTON_DOWN = f17_local13( f17_local14, f17_local15, f17_local17 )
		self.buttonLabels.BUTTON_DOWN = CoD.ButtonLayout.AddRightAlignLabel( self, downLineStartLeft - 5, downLineStartTop + labelTopOffset )
	end
	local leftLineStartLeft = dx( 50 )
	local leftLineStartTop = dy( 274 )
	f17_local12 = self.buttonLines
	f17_local13 = CoD.ButtonLayout.AddLine
	f17_local14 = self
	f17_local15 = {
		leftLineStartLeft,
		leftLineStartTop
	}
	local f17_local16 = {}
	local f17_local17 = dx( 94 )
	local f17_local18 = dy( 274 )
	f17_local12.BUTTON_LEFT = f17_local13( f17_local14, f17_local15, f17_local17 )
	self.buttonLabels.BUTTON_LEFT = CoD.ButtonLayout.AddRightAlignLabel( self, leftLineStartLeft - 5, leftLineStartTop + labelTopOffset )
	if not CoD.isSinglePlayer then
		local rightLineEndLeft = dx( 50 )
		local rightLineEndTop = dy( 310 )
		f17_local14 = self.buttonLines
		f17_local15 = CoD.ButtonLayout.AddLine
		f17_local16 = self
		f17_local17 = {}
		f17_local18 = dx( 140 )
		local f17_local19 = dy( 274 )
		f17_local14.BUTTON_RIGHT = f17_local15( f17_local16, f17_local18, {
			rightLineEndLeft,
			rightLineEndTop
		} )
		self.buttonLabels.BUTTON_RIGHT = CoD.ButtonLayout.AddRightAlignLabel( self, rightLineEndLeft - 5, rightLineEndTop + labelTopOffset )
	end
	local lTrigLineStartLeft = dx( 92 )
	local lTrigLineStartTop = dy( 108 )
	f17_local14 = self.buttonLines
	f17_local15 = CoD.ButtonLayout.AddLine
	f17_local16 = self
	f17_local17 = {
		lTrigLineStartLeft,
		lTrigLineStartTop
	}
	f17_local18 = {}
	local f17_local19 = dx( 115 )
	local f17_local20 = dy( 130 )
	f17_local14.BUTTON_LTRIG = f17_local15( f17_local16, f17_local17, f17_local19 )
	self.buttonLabels.BUTTON_LTRIG = CoD.ButtonLayout.AddRightAlignLabel( self, lTrigLineStartLeft - 5, lTrigLineStartTop + labelTopOffset )
	local rTrigLineEndLeft = dx( 420 )
	local rTrigLineEndTop = dy( 108 )
	f17_local16 = self.buttonLines
	f17_local17 = CoD.ButtonLayout.AddLine
	f17_local18 = self
	f17_local19 = {}
	f17_local20 = dx( 395 )
	local f17_local21 = dy( 130 )
	f17_local16.BUTTON_RTRIG = f17_local17( f17_local18, f17_local20, {
		rTrigLineEndLeft,
		rTrigLineEndTop
	} )
	self.buttonLabels.BUTTON_RTRIG = CoD.ButtonLayout.AddLeftAlignLabel( self, rTrigLineEndLeft + 5, rTrigLineEndTop + labelTopOffset )
	if not CoD.isSinglePlayer then
		local backLineEndLeft = dx( 255 )
		local backLineEndTop = dy( 140 )
		f17_local18 = self.buttonLines
		f17_local19 = CoD.ButtonLayout.AddLine
		f17_local20 = self
		f17_local21 = {}
		local f17_local22 = dx( 255 )
		local f17_local23 = dy( 220 )
		f17_local18.BUTTON_BACK = f17_local19( f17_local20, f17_local22, {
			backLineEndLeft,
			backLineEndTop
		} )
		self.buttonLabels.BUTTON_BACK = CoD.ButtonLayout.AddCenterAlignLabel( self, backLineEndLeft, backLineEndTop - CoD.textSize.Default )
	end
	local startLineEndLeft = dx( 342 )
	local startLineEndTop = dy( 110 )
	f17_local18 = self.buttonLines
	f17_local19 = CoD.ButtonLayout.AddLine
	f17_local20 = self
	f17_local21 = {}
	local f17_local22 = dx( 342 )
	local f17_local23 = dy( 218 )
	f17_local18.BUTTON_START = f17_local19( f17_local20, f17_local22, {
		startLineEndLeft,
		startLineEndTop
	} )
	self.buttonLabels.BUTTON_START = CoD.ButtonLayout.AddCenterAlignLabel( self, startLineEndLeft, startLineEndTop - CoD.textSize.Default )
	local lStickLineStartLeft = dx( 185 )
	local lStickLineStartTop = dy( 405 )
	f17_local20 = self.buttonLines
	f17_local21 = CoD.ButtonLayout.AddLine
	f17_local22 = self
	f17_local23 = {
		lStickLineStartLeft,
		lStickLineStartTop
	}
	local f17_local24 = {}
	local f17_local25 = dx( 185 )
	local f17_local26 = dy( 344 )
	f17_local20.BUTTON_LSTICK = f17_local21( f17_local22, f17_local23, f17_local25 )
	self.buttonLabels.BUTTON_LSTICK = CoD.ButtonLayout.AddCenterAlignLabel( self, lStickLineStartLeft, lStickLineStartTop )
	local rStickLineEndLeft = dx( 323 )
	local rStickLineEndTop = dy( 375 )
	f17_local22 = self.buttonLines
	f17_local23 = CoD.ButtonLayout.AddLine
	f17_local24 = self
	f17_local25 = {}
	f17_local26 = dx( 323 )
	local f17_local27 = dy( 344 )
	f17_local22.BUTTON_RSTICK = f17_local23( f17_local24, f17_local26, {
		rStickLineEndLeft,
		rStickLineEndTop
	} )
	self.buttonLabels.BUTTON_RSTICK = CoD.ButtonLayout.AddCenterAlignLabel( self, rStickLineEndLeft, rStickLineEndTop )
end

CoD.ButtonLayout.AddXenonLinesAndLabels = function ( self )
	self.buttonLabels = {}
	self.buttonLines = {}
	local labelTopOffset = -10
	local aLineEndLeft = 200
	local aLineEndTop = 130
	self.buttonLines.BUTTON_A = CoD.ButtonLayout.AddLine( self, {
		120,
		88
	}, {
		aLineEndLeft,
		aLineEndTop
	} )
	self.buttonLabels.BUTTON_A = CoD.ButtonLayout.AddLeftAlignLabel( self, aLineEndLeft + 5, aLineEndTop + labelTopOffset )
	local bLineEndLeft = 200
	local bLineEndTop = 60
	self.buttonLines.BUTTON_B = CoD.ButtonLayout.AddLine( self, {
		163,
		44
	}, {
		bLineEndLeft,
		bLineEndTop
	} )
	self.buttonLabels.BUTTON_B = CoD.ButtonLayout.AddLeftAlignLabel( self, bLineEndLeft + 5, bLineEndTop + labelTopOffset )
	local xLineEndLeft = 205
	local xLineEndTop = 95
	self.buttonLines.BUTTON_X = CoD.ButtonLayout.AddLine( self, {
		100,
		44
	}, {
		xLineEndLeft,
		xLineEndTop
	} )
	self.buttonLabels.BUTTON_X = CoD.ButtonLayout.AddLeftAlignLabel( self, xLineEndLeft + 5, xLineEndTop + labelTopOffset )
	local yLineEndLeft = 195
	local yLineEndTop = 25
	self.buttonLines.BUTTON_Y = CoD.ButtonLayout.AddLine( self, {
		132,
		10
	}, {
		yLineEndLeft,
		yLineEndTop
	} )
	self.buttonLabels.BUTTON_Y = CoD.ButtonLayout.AddLeftAlignLabel( self, yLineEndLeft + 5, yLineEndTop + labelTopOffset )
	local lBumpLineStartLeft = -170
	local lBumpLineStartTop = -23
	self.buttonLines.BUTTON_LBUMP = CoD.ButtonLayout.AddLine( self, {
		lBumpLineStartLeft,
		lBumpLineStartTop
	}, {
		-130,
		-23
	} )
	self.buttonLabels.BUTTON_LBUMP = CoD.ButtonLayout.AddRightAlignLabel( self, lBumpLineStartLeft - 5, lBumpLineStartTop + labelTopOffset )
	local rBumpLineEndLeft = 170
	local rBumpLineEndTop = -23
	self.buttonLines.BUTTON_RBUMP = CoD.ButtonLayout.AddLine( self, {
		130,
		-23
	}, {
		rBumpLineEndLeft,
		rBumpLineEndTop
	} )
	self.buttonLabels.BUTTON_RBUMP = CoD.ButtonLayout.AddLeftAlignLabel( self, rBumpLineEndLeft + 5, rBumpLineEndTop + labelTopOffset )
	if not CoD.isSinglePlayer then
		local upLineStartLeft = -205
		local upLineStartTop = 110
		self.buttonLines.BUTTON_UP = CoD.ButtonLayout.AddLine( self, {
			upLineStartLeft,
			upLineStartTop
		}, {
			-62,
			95
		} )
		self.buttonLabels.BUTTON_UP = CoD.ButtonLayout.AddRightAlignLabel( self, upLineStartLeft - 5, upLineStartTop + labelTopOffset )
	end
	if not CoD.isSinglePlayer then
		local downLineStartLeft = -205
		local downLineStartTop = 180
		self.buttonLines.BUTTON_DOWN = CoD.ButtonLayout.AddLine( self, {
			downLineStartLeft,
			downLineStartTop
		}, {
			-62,
			140
		} )
		self.buttonLabels.BUTTON_DOWN = CoD.ButtonLayout.AddRightAlignLabel( self, downLineStartLeft - 5, downLineStartTop + labelTopOffset )
	end
	local leftLineStartLeft = -210
	local leftLineStartTop = 145
	self.buttonLines.BUTTON_LEFT = CoD.ButtonLayout.AddLine( self, {
		leftLineStartLeft,
		leftLineStartTop
	}, {
		-83,
		119
	} )
	self.buttonLabels.BUTTON_LEFT = CoD.ButtonLayout.AddRightAlignLabel( self, leftLineStartLeft - 5, leftLineStartTop + labelTopOffset )
	if not CoD.isSinglePlayer then
		local rightLineEndLeft = -38
		local rightLineEndTop = 250
		self.buttonLines.BUTTON_RIGHT = CoD.ButtonLayout.AddLine( self, {
			-38,
			119
		}, {
			rightLineEndLeft,
			rightLineEndTop
		} )
		self.buttonLabels.BUTTON_RIGHT = CoD.ButtonLayout.AddCenterAlignLabel( self, rightLineEndLeft, rightLineEndTop )
	end
	local lTrigLineStartLeft = -160
	local lTrigLineStartTop = -70
	self.buttonLines.BUTTON_LTRIG = CoD.ButtonLayout.AddLine( self, {
		lTrigLineStartLeft,
		lTrigLineStartTop
	}, {
		-108,
		-40
	} )
	self.buttonLabels.BUTTON_LTRIG = CoD.ButtonLayout.AddRightAlignLabel( self, lTrigLineStartLeft - 5, lTrigLineStartTop + labelTopOffset )
	local rTrigLineEndLeft = 160
	local rTrigLineEndTop = -70
	self.buttonLines.BUTTON_RTRIG = CoD.ButtonLayout.AddLine( self, {
		108,
		-40
	}, {
		rTrigLineEndLeft,
		rTrigLineEndTop
	} )
	self.buttonLabels.BUTTON_RTRIG = CoD.ButtonLayout.AddLeftAlignLabel( self, rTrigLineEndLeft + 5, rTrigLineEndTop + labelTopOffset )
	if not CoD.isSinglePlayer then
		local backLineEndLeft = -42
		local backLineEndTop = -135
		self.buttonLines.BUTTON_BACK = CoD.ButtonLayout.AddLine( self, {
			-42,
			48
		}, {
			backLineEndLeft,
			backLineEndTop
		} )
		self.buttonLabels.BUTTON_BACK = CoD.ButtonLayout.AddCenterAlignLabel( self, backLineEndLeft, backLineEndTop - CoD.textSize.Default )
	end
	local startLineEndLeft = 42
	local startLineEndTop = -100
	self.buttonLines.BUTTON_START = CoD.ButtonLayout.AddLine( self, {
		42,
		48
	}, {
		startLineEndLeft,
		startLineEndTop
	} )
	self.buttonLabels.BUTTON_START = CoD.ButtonLayout.AddCenterAlignLabel( self, startLineEndLeft, startLineEndTop - CoD.textSize.Default )
	local lStickLineStartLeft = -190
	local lStickLineStartTop = 52
	self.buttonLines.BUTTON_LSTICK = CoD.ButtonLayout.AddLine( self, {
		lStickLineStartLeft,
		lStickLineStartTop
	}, {
		-120,
		52
	} )
	self.buttonLabels.BUTTON_LSTICK = CoD.ButtonLayout.AddRightAlignLabel( self, lStickLineStartLeft - 5, lStickLineStartTop + labelTopOffset )
	local rStickLineEndLeft = 56
	local rStickLineEndTop = 220
	self.buttonLines.BUTTON_RSTICK = CoD.ButtonLayout.AddLine( self, {
		56,
		123
	}, {
		rStickLineEndLeft,
		rStickLineEndTop
	} )
	self.buttonLabels.BUTTON_RSTICK = CoD.ButtonLayout.AddCenterAlignLabel( self, rStickLineEndLeft, rStickLineEndTop )
end

