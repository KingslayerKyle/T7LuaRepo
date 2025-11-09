require( "ui_mp.T6.HUD.InGameMenus" )
require( "ui_mp.T6.HUD.InGamePopups" )

CoD.ObjectiveInfoMenu = {}
CoD.ObjectiveInfoMenu.PauseSFX = "uin_main_pause"
CoD.ObjectiveInfoMenu.Pause_ButtonsTopAnchor = CoD.Menu.TitleHeight + 50
CoD.ObjectiveInfoMenu.ElementWidth = 325
CoD.ObjectiveInfoMenu.ObjectivesWidth = 400
CoD.ObjectiveInfoMenu.ElementSpacing = 40
CoD.ObjectiveInfoMenu.LeftRightAlignment = {
	leftAnchor = false,
	rightAnchor = false,
	left = CoD.ObjectiveInfoMenu.ElementSpacing / 2,
	right = CoD.ObjectiveInfoMenu.ElementSpacing / 2 + CoD.ObjectiveInfoMenu.ObjectivesWidth
}
CoD.ObjectiveInfoMenu.TitleHeight = CoD.Menu.TitleHeight
CoD.ObjectiveInfoMenu.TitleColor = {
	r = 1,
	g = 0.64,
	b = 0
}
CoD.ObjectiveInfoMenu.ElementHeight = CoD.textSize.Default
CoD.ObjectiveInfoMenu.PrimaryElementHeight = CoD.textSize.Condensed
CoD.ObjectiveInfoMenu.ObjectivesTop = CoD.ObjectiveInfoMenu.Pause_ButtonsTopAnchor + 8 * CoD.CoD9Button.Height + 50
CoD.ObjectiveInfoMenu.Objectives_LeftAnchor = 470
CoD.ObjectiveInfoMenu.Objectives_TitleTopAnchor = 80
CoD.ObjectiveInfoMenu.Objectives_ListTopAnchor = 140
CoD.ObjectiveInfoMenu.Objectives_ListRightAnchor = -10
CoD.ObjectiveInfoMenu.Objectives_ListBottomAnchor = -10
CoD.ObjectiveInfoMenu.Objectives_ListTextWidth = 300
CoD.ObjectiveInfoMenu.Objectives_ListMaterialSize = CoD.textSize.Default - 10
CoD.ObjectiveInfoMenu.Objectives_ListCheckboxWidth = 2
CoD.ObjectiveInfoMenu.Objectives_ListCheckboxGap = 10
CoD.ObjectiveInfoMenu.Objectives_Colors = {
	invisible = {
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0
	},
	active = {
		red = CoD.white.r,
		green = CoD.white.g,
		blue = CoD.white.b,
		alpha = 1
	},
	done = {
		red = CoD.brightGreen.r,
		green = CoD.brightGreen.g,
		blue = CoD.brightGreen.b,
		alpha = 1
	},
	current = {
		red = CoD.blue.r,
		green = CoD.blue.g,
		blue = CoD.blue.b,
		alpha = 1
	},
	failed = {
		red = CoD.brightRed.r,
		green = CoD.brightRed.g,
		blue = CoD.brightRed.b,
		alpha = 1
	}
}
LUI.createMenu.MissionObjectives = function ( controller, class )
	local missionObjectives = CoD.InGameMenu.New( "MissionObjectives", controller )
	missionObjectives:setOwner( controller )
	CoD.ObjectiveInfoMenu.CreateObjectivesList( missionObjectives, controller, class )
	missionObjectives.close = function ( self )
		CoD.ObjectiveInfoMenu.CloseObjectivesList( missionObjectives, controller )
		CoD.InGameMenu.close( self )
	end
	
	return missionObjectives
end

LUI.createMenu.ObjectiveInfoMenu = function ( controller )
	local objectiveInfoMenu = CoD.InGameMenu.New( "ObjectiveInfoMenu", controller, Engine.Localize( "MENU_PAUSED_CAPS" ) )
	CoD.InGameMenu.addButtonPrompts( objectiveInfoMenu )
	Engine.PlaySound( CoD.ObjectiveInfoMenu.PauseSFX )
	objectiveInfoMenu:setOwner( controller )
	CoD.ObjectiveInfoMenu.RegisterButtonEvents( objectiveInfoMenu )
	CoD.ObjectiveInfoMenu.CreateActionsList( objectiveInfoMenu, controller )
	CoD.ObjectiveInfoMenu.CreateObjectivesList( objectiveInfoMenu, controller )
	objectiveInfoMenu.close = function ( self )
		CoD.ObjectiveInfoMenu.CloseObjectivesList( objectiveInfoMenu, controller )
		CoD.InGameMenu.close( self )
	end
	
	return objectiveInfoMenu
end

CoD.ObjectiveInfoMenu.AddButton = function ( buttonList, buttonText, actionEventName )
	local button = buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.ObjectiveInfoMenu.CreateActionsList = function ( self, controller )
	local buttonList = CoD.ButtonList.new()
	buttonList:setLeftRight( false, false, -CoD.ObjectiveInfoMenu.ElementWidth - CoD.ObjectiveInfoMenu.ElementSpacing / 2, -CoD.ObjectiveInfoMenu.ElementSpacing / 2 )
	buttonList:setTopBottom( true, true, CoD.ObjectiveInfoMenu.Pause_ButtonsTopAnchor, 0 )
	self:addElement( buttonList )
	buttonList.upRepeater.minDelay = 100
	buttonList.downRepeater.minDelay = 100
	buttonList.upRepeater.delayReduction = 0
	buttonList.downRepeater.delayReduction = 0
	buttonList:setButtonBackingAnimationState( {
		leftAnchor = true,
		rightAnchor = true,
		left = -5,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		material = RegisterMaterial( "menu_mp_small_row" )
	} )
	local sv_running = Dvar.sv_running:get()
	local cg_development = Dvar.cg_development:get()
	local sv_cheats = Dvar.sv_cheats:get()
	local single_mission = Dvar.ui_singlemission:get()
	local resume_button = CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_RESUMEGAME_CAPS" ), "resume_game" )
	if CoD.isWIIU then
		CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_CONTROLLER_SETTINGS_CAPS" ), "open_controls" )
		CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_FRIENDS_CAPS" ), "open_friends" )
	end
	CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_OPTIONS_CAPS" ), "open_options" )
	if not Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) and 0 == Dvar.ui_singlemission:get() then
		local difficulty = CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_LOWER_DIFFICULTY_CAPS" ), "lower_difficulty" )
		local val = Engine.GetProfileVarInt( controller, "g_gameskill" )
		if not val or val == 0 then
			difficulty:disable()
		end
	end
	if sv_running and not Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) then
		CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_RESTART_MISSION_CAPS" ), "restart_mission" )
	end
	if cg_development then
		CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_RESTART_LEVEL_CAPS" ), "restart_level" )
	end
	local unitsAvailable = Engine.GetDStat( controller, "PlayerCareerStats", "unitsAvailable" )
	if Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) and single_mission == 0 then
		local retryMission = CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_RETRY_MISSION_CAPS" ), "retry_mission" )
		if unitsAvailable <= 0 then
			retryMission:disable()
		end
	end
	if not (Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) or not sv_cheats) or cg_development then
		CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_RESTART_CHECKPOINT_CAPS" ), "restart_from_check" )
	end
	if Dvar.ui_isrtstutorial:get() == 1 and single_mission == 0 then
		CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_SKIP_TUTORIAL_CAPS" ), "skip_tutorial" )
	end
	if 0 == Dvar.ui_isrtstutorial:get() or Dvar.ui_isrtstutorial:get() == 1 and single_mission == 1 and sv_running then
		if not Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) and Engine.IsProfileSignedIn( self:getOwner() ) and single_mission == 0 then
			CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "PLATFORM_SAVE_AND_QUIT_CAPS" ), "save_and_quit_game" )
		else
			CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "PLATFORM_QUIT_CAPS" ), "quit_game" )
		end
	end
	if sv_cheats then
		CoD.ObjectiveInfoMenu.AddButton( buttonList, Engine.Localize( "MENU_SKIP_CAPS" ), "skip_level" )
	end
	if CoD.useController and not self:restoreState() then
		buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
end

CoD.ObjectiveInfoMenu.CreateObjectivesList = function ( self, controller, class )
	local objective_table = Engine.GetPlayerObjectives( controller )
	if objective_table == nil then
		return 
	end
	local top = CoD.ObjectiveInfoMenu.Pause_ButtonsTopAnchor
	if not class then
		class = CoD.ObjectiveInfoMenu
	end
	local alignment = class.LeftRightAlignment
	top = top - 25
	local objectivesTitle = LUI.UIText.new()
	objectivesTitle:setLeftRight( alignment.leftAnchor, alignment.rightAnchor, alignment.left, alignment.right )
	objectivesTitle:setTopBottom( true, false, top, top + class.TitleHeight * 0.75 )
	objectivesTitle:setAlignment( LUI.Alignment.Left )
	objectivesTitle:setText( Engine.Localize( "MENU_MISSIONOBJECTIVES_CAPS" ) )
	objectivesTitle:setFont( CoD.Menu.TitleFont )
	objectivesTitle:setRGB( class.TitleColor.r, class.TitleColor.g, class.TitleColor.b )
	self:addElement( objectivesTitle )
	if CoD.isCampaign == true then
		top = top + class.TitleHeight + math.floor( 0.17 * class.TitleHeight ) - 20
	else
		top = top + class.TitleHeight + math.floor( 0.17 * class.TitleHeight )
	end
	local objectivesList = LUI.UIVerticalList.new()
	objectivesList:setLeftRight( alignment.leftAnchor, alignment.rightAnchor, alignment.left, alignment.right )
	objectivesList:setTopBottom( true, true, top, 0 )
	for index, objective in CoD.pairsByKeys( objective_table ) do
		if objective.status ~= "invisible" and objective.objective_desc ~= nil and objective.objective_desc ~= "" then
			local text = Engine.Localize( objective.objective_desc )
			local nextObjective = LUI.UIElement.new()
			nextObjective:setLeftRight( true, true, 0, 0 )
			local currentLeft = 0
			local currentSize = 0
			local textHeight = class.PrimaryElementHeight
			if objective.primary ~= true then
				local imageTop = (class.ElementHeight - CoD.ObjectiveInfoMenu.Objectives_ListMaterialSize) / 2 + 1
				local nextObjectiveImage = LUI.UIImage.new()
				nextObjectiveImage:setLeftRight( true, false, 0, CoD.ObjectiveInfoMenu.Objectives_ListMaterialSize )
				nextObjectiveImage:setTopBottom( true, false, imageTop, imageTop + CoD.ObjectiveInfoMenu.Objectives_ListMaterialSize )
				nextObjectiveImage:beginAnimation( "material_change" )
				local iconName = "com_sup_box"
				if objective.status == "done" then
					iconName = "com_sup_x"
				end
				nextObjectiveImage:setImage( RegisterMaterial( iconName ) )
				nextObjective:addElement( nextObjectiveImage )
				currentLeft = currentLeft + CoD.ObjectiveInfoMenu.Objectives_ListMaterialSize + CoD.ObjectiveInfoMenu.Objectives_ListCheckboxGap
				textHeight = class.ElementHeight
			end
			currentSize = CoD.ObjectiveInfoMenu.Objectives_ListMaterialSize + CoD.ObjectiveInfoMenu.Objectives_ListCheckboxGap
			local numLines = Engine.GetNumTextLines( text, CoD.fonts.Default, textHeight, class.ObjectivesWidth - currentLeft )
			nextObjective:setTopBottom( true, false, 0, math.max( currentSize, numLines * textHeight ) )
			nextObjective:setModel( Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. index - 1 ) )
			local nextObjectiveText = LUI.UITightText.new( {
				alignment = LUI.Alignment.Left,
				font = CoD.fonts.Default
			} )
			nextObjectiveText:setLeftRight( true, true, currentLeft, 0 )
			nextObjectiveText:setTopBottom( true, false, 0, textHeight )
			nextObjectiveText:setAlignment( LUI.Alignment.Left )
			nextObjectiveText:setText( text )
			nextObjective:addElement( nextObjectiveText )
			if CoD.ObjectiveInfoMenu.Objectives_Colors[objective.status] == nil then
				DebugPrint( "LUA Warning: ObjectiveInfoMenu.lua received an unhandled objective status, setting color to default" )
				nextObjectiveText:setRGB( CoD.ObjectiveInfoMenu.Objectives_Colors.current.red, CoD.ObjectiveInfoMenu.Objectives_Colors.current.green, CoD.ObjectiveInfoMenu.Objectives_Colors.current.blue )
				nextObjectiveText:setAlpha( CoD.ObjectiveInfoMenu.Objectives_Colors.current.alpha )
			else
				nextObjectiveText:setRGB( CoD.ObjectiveInfoMenu.Objectives_Colors[objective.status].red, CoD.ObjectiveInfoMenu.Objectives_Colors[objective.status].green, CoD.ObjectiveInfoMenu.Objectives_Colors[objective.status].blue )
				nextObjectiveText:setAlpha( CoD.ObjectiveInfoMenu.Objectives_Colors[objective.status].alpha )
			end
			objectivesList:addElement( nextObjective )
		end
	end
	self.objectivesList = objectivesList
	self:addElement( objectivesList )
end

CoD.ObjectiveInfoMenu.CloseObjectivesList = function ( self, controller, class )
	if self.objectivesList == nil then
		return 
	end
	local child = self.objectivesList:getFirstChild()
	while child ~= nil do
		local nextChild = child:getNextSibling()
		child:close()
		child = nextChild
	end
end

CoD.ObjectiveInfoMenu.RegisterButtonEvents = function ( self )
	self:registerEventHandler( "resume_game", CoD.ObjectiveInfoMenu.ResumeGame )
	self:registerEventHandler( "open_controls", CoD.ObjectiveInfoMenu.OpenControls )
	self:registerEventHandler( "open_friends", CoD.ObjectiveInfoMenu.OpenFriends )
	self:registerEventHandler( "open_options", CoD.ObjectiveInfoMenu.OpenOptions )
	self:registerEventHandler( "lower_difficulty", CoD.ObjectiveInfoMenu.LowerDifficulty )
	self:registerEventHandler( "restart_mission", CoD.ObjectiveInfoMenu.RestartMission )
	self:registerEventHandler( "restart_level", CoD.ObjectiveInfoMenu.RestartLevel )
	self:registerEventHandler( "restart_from_check", CoD.ObjectiveInfoMenu.RestartFromCheckpoint )
	self:registerEventHandler( "retry_mission", CoD.ObjectiveInfoMenu.RetryMission )
	self:registerEventHandler( "save_and_quit_game", CoD.ObjectiveInfoMenu.SaveAndQuit )
	self:registerEventHandler( "quit_game", CoD.ObjectiveInfoMenu.Quit )
	self:registerEventHandler( "skip_level", CoD.ObjectiveInfoMenu.SkipLevel )
	self:registerEventHandler( "skip_tutorial", CoD.ObjectiveInfoMenu.SkipTutorial )
	self:registerEventHandler( "open_saveandquitgamepopup", CoD.ObjectiveInfoMenu.SaveAndQuit )
end

CoD.ObjectiveInfoMenu.ResumeGame = function ( self, event )
	self:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
end

CoD.ObjectiveInfoMenu.OpenControls = function ( self, event )
	self:saveState()
	local controlsMenu = self:openMenu( "WiiUControllerSettings", event.controller, true )
	self:close()
end

CoD.ObjectiveInfoMenu.OpenFriends = function ( self, event )
	self:saveState()
	local controlsMenu = self:openMenu( "FriendsList", event.controller )
	self:close()
end

CoD.ObjectiveInfoMenu.OpenOptions = function ( self, event )
	self:saveState()
	if LUI.savedMenuStates["Menu.OptionsMenu"] then
		LUI.savedMenuStates["Menu.OptionsMenu"] = nil
	end
	local optionsMenu = self:openMenu( "OptionsMenu", event.controller )
	self:close()
end

CoD.ObjectiveInfoMenu.LowerDifficulty = function ( self, event )
	self:saveState()
	self:openMenu( "LowerDifficultyPopup", event.controller )
	self:close()
end

CoD.ObjectiveInfoMenu.RestartMission = function ( self, event )
	self:saveState()
	self:openMenu( "RestartMissionPopup", event.controller )
	self:close()
end

CoD.ObjectiveInfoMenu.RestartLevel = function ( self, event )
	self:saveState()
	self:openMenu( "RestartLevelPopup", event.controller )
	self:close()
end

CoD.ObjectiveInfoMenu.RetryMission = function ( self, event )
	self:saveState()
	self:openMenu( "RetryMissionPopup", event.controller )
	self:close()
end

CoD.ObjectiveInfoMenu.RestartFromCheckpoint = function ( self, event )
	self:saveState()
	self:openMenu( "RestartFromCheckpointPopup", event.controller )
	self:close()
end

CoD.ObjectiveInfoMenu.SaveAndQuit = function ( self, event )
	self:saveState()
	self:openMenu( "SaveAndQuitGamePopup", event.controller )
	self:close()
end

CoD.ObjectiveInfoMenu.Quit = function ( self, event )
	self:saveState()
	self:openMenu( "QuitGamePopup", event.controller )
	self:close()
end

CoD.ObjectiveInfoMenu.SkipLevel = function ( self, event )
	self:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
	Engine.Exec( event.controller, "skip_level" )
	self:close()
end

CoD.ObjectiveInfoMenu.SkipTutorial = function ( self, event )
	self:saveState()
	self:openMenu( "SkipTutorialPopup", event.controller )
	self:close()
end

