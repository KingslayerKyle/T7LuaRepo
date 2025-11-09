local ClassButton_AddClassOptionsButton, ClassButton_GainFocus, ClassButton_LoseFocus, ClassButton_RemoveClassOptionsButton, ClassButtonGainedFocus, ClassButtonLostFocus, ClassChosen, Close, CreateButtons, CreateClassButtons, CreateTeamButtons, ShowStarForClassButton, ShowStarForTeamButton, OcclusionChange, OpenClassOptions, PopulateButtonList, RefreshClassButtons, RefreshTeamButtons, SelectorChanged, TeamButtonListBackOut, TeamChosen = nil
LUI.createMenu.EditDefaultClasses = function ( controller )
	local self = CoD.GameOptionsMenu.New( controller, "EditDefaultClasses" )
	self:setPreviousMenu( "EditGameOptions" )
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
	self:addElement( background )
	self:addTitle( Engine.Localize( "MENU_PRESET_CLASSES_CAPS" ) )
	self.team = Enum.team_t.TEAM_FIRST_PLAYING_TEAM
	CoD.CACUtility.SetGametypeSettingsCACRoot( self:getOwner(), self.team )
	self.classOptionsButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_CLASS_OPTIONS" ), self, "open_class_options", false, nil, false, nil, "O" )
	self.buttonList = CoD.ButtonList.new()
	self.buttonList.id = "ButtonList.EditDefaultClasses"
	self.buttonList:setLeftRight( true, false, 0, CoD.ButtonList.DefaultWidth )
	self.buttonList:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	self:addElement( self.buttonList )
	self[self.buttonList.id] = self.buttonList
	self.perTeamButtonList = CoD.ButtonList.new()
	self.perTeamButtonList.id = "ButtonList.EditDefaultClassesPerTeam"
	self.perTeamButtonList:setLeftRight( true, false, 0, CoD.ButtonList.DefaultWidth )
	self.perTeamButtonList:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	CreateButtons( self )
	self:registerEventHandler( "class_button_gained_focus", ClassButtonGainedFocus )
	self:registerEventHandler( "class_button_lost_focus", ClassButtonLostFocus )
	self:registerEventHandler( "class_chosen", ClassChosen )
	self:registerEventHandler( "occlusion_change", OcclusionChange )
	self:registerEventHandler( "open_class_options", OpenClassOptions )
	self:registerEventHandler( "selector_changed", SelectorChanged )
	self:registerEventHandler( "team_chosen", TeamChosen )
	PopulateButtonList( self )
	if 1 < Engine.GetGametypeSetting( "teamCount" ) and 1 == Engine.GetGametypeSetting( "presetClassesPerTeam" ) then
		local f1_local0 = CoD.perController
		local f1_local1 = self
		if f1_local0[self:getOwner()].editingPresetClass then
			TeamChosen( self )
		end
	end
	local f1_local0 = CoD.perController
	local f1_local1 = self
	f1_local0[self:getOwner()].editingPresetClass = nil
	self.close = Close
	return self
end

ClassButton_RemoveClassOptionsButton = function ( self, event )
	if self.classOptionsButton ~= nil then
		self.classOptionsButton:close()
		self:setHandleMouseButton( true )
	end
end

ClassButton_GainFocus = function ( self, event )
	local retVal = CoD.CoD9Button.GainFocus( self, event )
	self:dispatchEventToParent( {
		name = "class_button_gained_focus",
		button = self
	} )
	return retVal
end

ClassButton_LoseFocus = function ( self, event )
	CoD.CoD9Button.LoseFocus( self, event )
	if CoD.useMouse then
		ClassButton_RemoveClassOptionsButton( self )
	end
	self:dispatchEventToParent( {
		name = "class_button_lost_focus",
		button = self
	} )
end

ClassButtonGainedFocus = function ( self, event )
	local perControllerData = CoD.perController[self:getOwner()]
	perControllerData.classNum = event.button.classNum
	perControllerData.isPreset = true
	perControllerData.weaponSlot = nil
	perControllerData.grenadeSlot = nil
	perControllerData.perkCategory = nil
	perControllerData.slotIndex = nil
	self:addRightButtonPrompt( self.classOptionsButtonPrompt )
end

ClassButtonLostFocus = function ( self, event )
	self.classOptionsButtonPrompt:close()
end

ClassChosen = function ( self, event )
	self.buttonList:saveState()
	self.perTeamButtonList:saveState()
	CoD.perController[self:getOwner()].editingPresetClass = self.team
	local controller = self:getOwner()
	local classNum = event.button.classNum
	local editClassModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList" )
	local classModel = Engine.CreateModel( editClassModel, "class" .. classNum )
	CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
	CoD.perController[controller].classModel = classModel
	Engine.BeginEditingPresetClass( self.team )
	CoD.CACUtility.SetDefaultCACRoot( event.controller )
	CoD.OpenCACMenu( self, event.controller )
end

Close = function ( self )
	local f8_local0 = CoD.perController
	local f8_local1 = self
	if not f8_local0[self:getOwner()].editingPresetClass then
		Engine.StopEditingPresetClass()
		f8_local0 = CoD.perController
		f8_local1 = self
		f8_local0[self:getOwner()].isPreset = nil
	end
	CoD.Menu.close( self )
end

CreateButtons = function ( self )
	self.presetClassesPerTeamSelector = self:addGametypeSetting( self:getOwner(), "presetClassesPerTeam", true )
	CreateTeamButtons( self )
	CreateClassButtons( self )
end

CreateClassButtons = function ( self )
	self.classButtons = {}
	local customClassNames = CoD.CACUtility.GetLoadoutNames( self:getOwner() )
	for i = 0, 4, 1 do
		local classButton = self.buttonList:addButton( Engine.Localize( customClassNames[i]:get() ) )
		classButton.classNum = i
		classButton:registerEventHandler( "gain_focus", ClassButton_GainFocus )
		classButton:registerEventHandler( "lose_focus", ClassButton_LoseFocus )
		classButton:setActionEventNameNewStyle( self, self:getOwner(), "class_chosen" )
		table.insert( self.classButtons, classButton )
	end
end

CreateTeamButtons = function ( self )
	self.teamButtons = {}
	local numTeams = Engine.GetGametypeSetting( "teamCount" )
	local teamNames = {
		"MPUI_ALLIES_CAPS",
		"MPUI_AXIS_CAPS"
	}
	for i = 1, numTeams, 1 do
		local buttonName = Engine.Localize( teamNames[i] )
		local teamButton = self.buttonList:addButton( buttonName )
		teamButton.teamText = buttonName
		teamButton.index = i - 1
		teamButton:setActionEventNameNewStyle( self, self:getOwner(), "team_chosen" )
		table.insert( self.teamButtons, teamButton )
	end
end

PopulateButtonList = function ( self )
	self.buttonList:removeAllButtons()
	self.buttonList.hintText:close()
	local numTeams = Engine.GetGametypeSetting( "teamCount" )
	if numTeams > 1 then
		self.buttonList:addElement( self.presetClassesPerTeamSelector )
		self.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	end
	if numTeams > 1 and Engine.GetGametypeSetting( "presetClassesPerTeam" ) == 1 then
		RefreshTeamButtons( self )
		for index, button in ipairs( self.teamButtons ) do
			self.buttonList:addElement( button )
		end
	else
		self.team = Enum.team_t.TEAM_FREE
		CoD.CACUtility.SetGametypeSettingsCACRoot( self:getOwner(), self.team )
		RefreshClassButtons( self )
		for index, button in ipairs( self.classButtons ) do
			self.buttonList:addElement( button )
		end
	end
	LUI.UIVerticalList.UpdateNavigation( self.buttonList )
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( LUI.UIButton.GainFocusEvent )
	end
end

OcclusionChange = function ( self, event )
	CoD.Menu.OcclusionChange( self, event )
	if not event.occluded then
		Engine.StopEditingPresetClass()
		RefreshClassButtons( self )
		RefreshTeamButtons( self )
	end
end

OpenClassOptions = function ( self, event )
	Engine.BeginEditingPresetClass( self.team )
	self:openPopup( "T6ClassOptions", event.controller )
end

SelectorChanged = function ( self )
	self.buttonList:saveState()
	PopulateButtonList( self )
end

RefreshClassButtons = function ( self )
	local customClassNames = CoD.CACUtility.GetLoadoutNames( self:getOwner() )
	for index, button in ipairs( self.classButtons ) do
		button.label:setText( Engine.Localize( customClassNames[button.classNum]:get() ) )
		ShowStarForClassButton( button, self.team )
	end
end

RefreshTeamButtons = function ( self )
	for index, button in ipairs( self.teamButtons ) do
		ShowStarForTeamButton( button )
	end
end

ShowStarForClassButton = function ( classButton, team )
	if Engine.IsPresetClassDefault( team, classButton.classNum ) then
		classButton:showStarIcon( false )
	else
		classButton:showStarIcon( true )
	end
end

ShowStarForTeamButton = function ( teamButton )
	for classNum = 0, 4, 1 do
		local team = Enum.team_t.TEAM_FIRST_PLAYING_TEAM + teamButton.index
		if not Engine.IsPresetClassDefault( team, classNum ) then
			teamButton:showStarIcon( true )
			return 
		end
	end
	teamButton:showStarIcon( false )
end

TeamButtonListBackOut = function ( self, event )
	self.perTeamButtonList:processEvent( LUI.UIButton.LoseFocusEvent )
	self.perTeamButtonList:processEvent( {
		name = "complete_animation"
	} )
	self.perTeamButtonList:removeAllButtons()
	self.perTeamButtonList:clearSavedState()
	self.perTeamButtonList:close()
	self:addElement( self.buttonList )
	self:processEvent( {
		name = "controller_backed_out"
	} )
	self:registerEventHandler( "button_prompt_back", nil )
	self:setTitle( Engine.Localize( "MENU_PRESET_CLASSES_CAPS" ) )
end

TeamChosen = function ( self, event )
	local team, titleText = nil
	if event then
		self.team = Enum.team_t.TEAM_FIRST_PLAYING_TEAM + event.button.index
		titleText = event.button.teamText
	else
		local f21_local0 = CoD.perController
		local f21_local1 = self
		self.team = f21_local0[self:getOwner()].editingPresetClass
		for index, button in ipairs( self.teamButtons ) do
			if button.index == self.team - Enum.team_t.TEAM_FIRST_PLAYING_TEAM then
				titleText = button.teamText
				break
			end
		end
	end
	CoD.CACUtility.SetGametypeSettingsCACRoot( self:getOwner(), self.team )
	self.buttonList:close()
	RefreshClassButtons( self )
	for index, button in ipairs( self.classButtons ) do
		button:close()
		self.perTeamButtonList:addElement( button )
	end
	self:setTitle( titleText )
	self:addElement( self.perTeamButtonList )
	if not self.perTeamButtonList:restoreState() then
		self.perTeamButtonList:processEvent( LUI.UIButton.GainFocusEvent )
		self.perTeamButtonList:processEvent( {
			name = "complete_animation"
		} )
	end
	self:registerEventHandler( "button_prompt_back", TeamButtonListBackOut )
end

