require( "ui.T6.CategoryButton" )

CoD.LeagueSelection = {}
CoD.LeagueSelection.AddLeagueButtons = function ( self, controller )
	local leagues = Engine.GetLeagues()
	if leagues == nil or #leagues == 0 then
		DebugPrint( "Unable to retrieve leagues!" )
		return 
	end
	self.leagueButtons = {}
	for index, league in ipairs( leagues ) do
		local defaultAnimationState = {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = CoD.CoD9Button.Height
		}
		local button = CoD.CategoryButton.new( defaultAnimationState, "league_button_action", "league_button_gain_focus", "league_button_lose_focus", league )
		button:setLabel( Engine.ToUpper( league.name ) )
		self.leagueButtonList:addElement( button )
		table.insert( self.leagueButtons, button )
	end
	if #self.leagueButtons > 0 then
		if CoD.useController and not self.leagueButtonList:restoreState() then
			self.leagueButtons[1]:processEvent( {
				name = "gain_focus"
			} )
		end
		self:registerEventHandler( "button_prompt_back", CoD.LeagueSelection.LeagueBack )
	end
end

CoD.LeagueSelection.LeagueButtonGainFocus = function ( self, event )
	self.infoContainer.owner = event.owner
	self:updateInfo( event.itemInfo )
end

CoD.LeagueSelection.LeagueButtonLoseFocus = function ( self, event )
	if self.infoContainer.owner == event.owner then
		self:updateInfo( nil )
	end
end

CoD.LeagueSelection.LeagueBack = function ( self, event )
	self.leagueButtonList:saveState()
	Engine.PartyHostClearUIState()
	self:goBack( event.controller )
end

CoD.LeagueSelection.LeagueButtonAction = function ( self, event )
	self.leagueButtonList:saveState()
	Engine.PartyHostClearUIState()
	self:goBack( event.controller )
	self.occludedMenu:leagueSelected( event.itemInfo.id )
end

CoD.LeagueSelection.UpdateInfo = function ( self, itemInfo )
	local titleText = ""
	local descriptionText = ""
	local iconMaterial = nil
	if itemInfo ~= nil then
		titleText = Engine.ToUpper( itemInfo.name )
		descriptionText = itemInfo.description
		iconMaterial = itemInfo.icon
	end
	self.infoContainer.title:setText( titleText )
	self.infoContainer.description:setText( descriptionText )
	if iconMaterial ~= nil then
		self.infoContainer.icon:registerAnimationState( "icon", {
			material = iconMaterial,
			alpha = 1
		} )
		self.infoContainer.icon:animateToState( "icon" )
	else
		self.infoContainer.icon:animateToState( "default" )
	end
end

LUI.createMenu.LeagueSelection = function ( controller )
	local menu = CoD.Menu.New( "LeagueSelection" )
	menu:addTitle( Engine.Localize( "MENU_LEAGUES_CAPS" ) )
	local buttonOffset = 0
	local selectionContainerWidth = (CoD.Menu.Width - buttonOffset * 2) / 3
	local selectionContainerLeft = buttonOffset
	menu.buttonContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = selectionContainerLeft,
		right = selectionContainerLeft + selectionContainerWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = buttonOffset,
		bottom = 0,
		alpha = 1
	} )
	menu.buttonContainer:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	menu:addElement( menu.buttonContainer )
	menu.leagueButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	menu.leagueButtonList.id = menu.leagueButtonList.id .. ".LeagueButtonList"
	menu.buttonContainer:addElement( menu.leagueButtonList )
	selectionContainerLeft = selectionContainerLeft + selectionContainerWidth - buttonOffset
	local infoContainerWidth = selectionContainerWidth + buttonOffset * 2
	menu.infoContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = selectionContainerLeft,
		right = selectionContainerLeft + infoContainerWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = buttonOffset,
		bottom = 0
	} )
	menu:addElement( menu.infoContainer )
	local iconOffset = 10
	local iconWidth = infoContainerWidth - iconOffset * 2
	local iconHeight = iconWidth
	local iconLeft = iconOffset
	local infoItemTop = 0
	menu.infoContainer.icon = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = iconLeft,
		right = iconLeft + iconWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + iconHeight,
		alpha = 0
	} )
	menu.infoContainer:addElement( menu.infoContainer.icon )
	infoItemTop = infoItemTop + iconHeight + 15
	menu.infoContainer.title = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + CoD.textSize.Big,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Center
	} )
	menu.infoContainer:addElement( menu.infoContainer.title )
	infoItemTop = infoItemTop + CoD.textSize.Big + CoD.textSize.Big
	menu.infoContainer.description = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Center
	} )
	menu.infoContainer:addElement( menu.infoContainer.description )
	menu:registerEventHandler( "league_button_gain_focus", CoD.LeagueSelection.LeagueButtonGainFocus )
	menu:registerEventHandler( "league_button_lose_focus", CoD.LeagueSelection.LeagueButtonLoseFocus )
	menu:registerEventHandler( "league_button_action", CoD.LeagueSelection.LeagueButtonAction )
	menu.addLeagueButtons = CoD.LeagueSelection.AddLeagueButtons
	menu.updateInfo = CoD.LeagueSelection.UpdateInfo
	menu:addSelectButton()
	menu:addBackButton()
	return menu
end

