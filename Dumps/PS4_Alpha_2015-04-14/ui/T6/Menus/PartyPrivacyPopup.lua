require( "ui.T6.ProfileLeftRightSelector" )

CoD.PartyPrivacy = {}
CoD.PartyPrivacy.UpdateHint = function ( choiceParams )
	choiceParams.parentSelectorButton.hintText = choiceParams.extraParams.associatedHintText
	local buttonList = choiceParams.parentSelectorButton:getParent()
	if buttonList ~= nil and buttonList.hintText ~= nil then
		buttonList.hintText:updateText( choiceParams.parentSelectorButton.hintText )
	end
end

CoD.PartyPrivacy.SelectionChanged = function ( choiceParams )
	Engine.SetProfileVar( choiceParams.parentSelectorButton.m_currentController, choiceParams.parentSelectorButton.m_profileVarName, choiceParams.value )
	CoD.PartyPrivacy.UpdateHint( choiceParams )
end

CoD.PartyPrivacy.Button_Player_SelectionChanged = function ( choiceParams )
	local currentPlayerCount = Engine.PartyGetPlayerCount()
	local newMaximum = choiceParams.value
	if currentPlayerCount ~= nil and newMaximum < currentPlayerCount then
		newMaximum = currentPlayerCount
		return false
	else
		CoD.PartyPrivacy.UpdateHint( choiceParams )
		Engine.SetProfileVar( choiceParams.parentSelectorButton.m_currentController, choiceParams.parentSelectorButton.m_profileVarName, newMaximum )
		return true
	end
end

CoD.PartyPrivacy.Button_Player_AddChoices = function ( button, controller )
	local values = {
		1,
		2,
		3,
		4
	}
	if CoD.isZombie == true then
		values = {
			2,
			3,
			4,
			5,
			6,
			7,
			8
		}
	elseif CoD.isMultiplayer == true then
		values = {
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
			16,
			17,
			18
		}
	end
	for index = 1, #values, 1 do
		button:addChoice( tostring( values[index] ), values[index], {
			associatedHintText = Engine.Localize( "MENU_PLAYER_LIMIT_DESC" )
		}, CoD.PartyPrivacy.Button_Player_SelectionChanged )
	end
end

CoD.PartyPrivacy.getCurrentUserMaxPlayerCount = function ( self )
	local maxPartyCount = Engine.GetMaxUserPlayerCount( self.m_currentController )
	if maxPartyCount == nil then
		maxPartyCount = 18
	end
	return maxPartyCount
end

LUI.createMenu.PartyPrivacy = function ( controller )
	local partyPrivacyMenu = CoD.Menu.NewSmallPopup( "PartyPrivacy" )
	partyPrivacyMenu.m_ownerController = controller
	partyPrivacyMenu:addTitle( Engine.Localize( "MPUI_LOBBY_PRIVACY_CAPS" ) )
	partyPrivacyMenu.partyHostcontroller = Engine.GetPrimaryController()
	partyPrivacyMenu:addBackButton()
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.textSize.Big + 20,
		bottom = 0
	} )
	partyPrivacyMenu:addElement( buttonList )
	local partyPrivacySelector = buttonList:addProfileLeftRightSelector( partyPrivacyMenu.partyHostcontroller, Engine.Localize( "MPUI_LOBBY_PRIVACY_CAPS" ), "party_privacyStatus", "", 260 )
	partyPrivacySelector:addChoice( Engine.Localize( "MPUI_OPEN_CAPS" ), 0, {
		associatedHintText = Engine.Localize( "MENU_OPEN_DESC" )
	}, CoD.PartyPrivacy.SelectionChanged )
	if CoD.isXBOX then
		partyPrivacySelector:addChoice( Engine.Localize( "MPUI_OPEN_FRIENDS_CAPS" ), 1, {
			associatedHintText = Engine.Localize( "MENU_OPEN_FRIENDS_DESC" )
		}, CoD.PartyPrivacy.SelectionChanged )
		partyPrivacySelector:addChoice( Engine.Localize( "MPUI_INVITE_ONLY_CAPS" ), 2, {
			associatedHintText = Engine.Localize( "MENU_INVITE_ONLY_DESC" )
		}, CoD.PartyPrivacy.SelectionChanged )
	end
	partyPrivacySelector:addChoice( Engine.Localize( "MPUI_CLOSE_CAPS" ), 3, {
		associatedHintText = Engine.Localize( "MENU_CLOSE_DESC" )
	}, CoD.PartyPrivacy.SelectionChanged )
	local shouldShowPlayerLimitOption = CoD.PartyPrivacy.ShouldShowPlayerLimitOpion()
	if shouldShowPlayerLimitOption == true then
		partyPrivacyMenu.maxPlayerCap = buttonList:addProfileLeftRightSelector( partyPrivacyMenu.partyHostcontroller, Engine.Localize( "MENU_PLAYER_LIMIT_CAPS" ), "party_maxplayers", "", 260 )
		partyPrivacyMenu.maxPlayerCap.getCurrentValue = CoD.PartyPrivacy.getCurrentUserMaxPlayerCount
		partyPrivacyMenu.maxPlayerCap.currentProfileVarValue = CoD.PartyPrivacy.getCurrentUserMaxPlayerCount( partyPrivacyMenu.maxPlayerCap )
		partyPrivacyMenu.maxPlayerCap.currentValue = partyPrivacyMenu.maxPlayerCap.currentProfileVarValue
		CoD.PartyPrivacy.Button_Player_AddChoices( partyPrivacyMenu.maxPlayerCap, partyPrivacyMenu.partyHostcontroller )
		partyPrivacyMenu:registerEventHandler( "partylobby_update", CoD.PartyPrivacy.UpdatePlayerCount )
		partyPrivacyMenu:registerEventHandler( "gamelobby_update", CoD.PartyPrivacy.UpdatePlayerCount )
	end
	partyPrivacyMenu:registerEventHandler( "button_prompt_back", CoD.PartyPrivacy.Back )
	if CoD.useController and not partyPrivacyMenu:restoreState() then
		partyPrivacySelector:processEvent( {
			name = "gain_focus"
		} )
	end
	Engine.PlaySound( "cac_loadout_edit_sel" )
	return partyPrivacyMenu
end

CoD.PartyPrivacy.ShouldShowPlayerLimitOpion = function ( self )
	if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
		return false
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) and CoD.isZombie then
		return false
	else
		return true
	end
end

CoD.PartyPrivacy.Back = function ( self, event )
	if not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) or not CoD.isZombie then
		Engine.Exec( self.partyHostcontroller, "xsessionupdate" )
	end
	Engine.Exec( self.partyHostcontroller, "xsessionupdateprivacy" )
	Engine.Exec( self.partyHostcontroller, "updategamerprofile" )
	Engine.SystemNeedsUpdate( nil, "party" )
	Engine.SystemNeedsUpdate( nil, "game_options" )
	self:saveState()
	self:goBack( event.controller )
end

CoD.PartyPrivacy.UpdatePlayerCount = function ( self, event )
	local currentPlayerCount = Engine.PartyGetPlayerCount()
	if currentPlayerCount == 0 then
		return 
	end
	local currentValue = self.maxPlayerCap:getCurrentChoiceValue()
	if currentValue < currentPlayerCount then
		self.maxPlayerCap:setChoice( currentPlayerCount )
	end
end

