CoD.SelectDifficultyLevelPopupZombie = {}
LUI.createMenu.SelectDifficultyLevelZM = function ( controller )
	local self = CoD.Menu.NewSmallPopup( "SelectDifficultyLevelZM" )
	self.m_ownerController = controller
	self.primaryButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), self, "choose_difficultylevel_accepted" )
	self:addLeftButtonPrompt( self.primaryButton )
	self:registerEventHandler( "choose_difficultylevel_accepted", CoD.SelectDifficultyLevelPopupZombie.ChoiceAccepted )
	local firstTimeHostDesc = LUI.UIText.new()
	self:addElement( firstTimeHostDesc )
	firstTimeHostDesc:setLeftRight( true, true, 10, -10 )
	firstTimeHostDesc:setTopBottom( false, false, -10, 20 )
	firstTimeHostDesc:setAlignment( LUI.Alignment.Left )
	firstTimeHostDesc:setText( Engine.Localize( "ZMUI_FIRSTTIME_HOST_DIFFICULTY_DESC" ) )
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 30,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 5,
		bottom = 0
	} )
	self:addElement( buttonList )
	local difficultyLevelOption = nil
	for index, gameOption in pairs( CoD.Zombie.GameOptions ) do
		if gameOption.id == "zmDifficulty" then
			difficultyLevelOption = gameOption
		end
	end
	if difficultyLevelOption ~= nil then
		local difficultyLevelSelector = buttonList:addGametypeSettingLeftRightSelector( controller, Engine.Localize( difficultyLevelOption.name ), difficultyLevelOption.id, Engine.Localize( difficultyLevelOption.hintText ), 250 )
		for index = 1, #difficultyLevelOption.labels, 1 do
			difficultyLevelSelector:addChoice( controller, Engine.Localize( difficultyLevelOption.labels[index] ), difficultyLevelOption.values[index] )
		end
		if CoD.useController and not self:restoreState() then
			difficultyLevelSelector:processEvent( {
				name = "gain_focus"
			} )
		end
	end
	return self
end

CoD.SelectDifficultyLevelPopupZombie.UpdateHint = function ( choiceParams )
	choiceParams.parentSelectorButton.hintText = choiceParams.extraParams.associatedHintText
	local buttonList = choiceParams.parentSelectorButton:getParent()
	if buttonList ~= nil and buttonList.hintText ~= nil then
		buttonList.hintText:updateText( choiceParams.parentSelectorButton.hintText )
	end
end

CoD.SelectDifficultyLevelPopupZombie.ChoiceAccepted = function ( self, event )
	Engine.ExecNow( event.controller, "setprofile com_first_time_privategame_host_zm 0" )
	Engine.Exec( event.controller, "updategamerprofile" )
	Engine.Exec( event.controller, "xupdatepartystate" )
	self:saveState()
	self:goBack( event.controller )
end

