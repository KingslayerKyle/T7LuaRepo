require( "ui.T6.Lobby" )
require( "ui.T6.MapVoter" )

CoD.GameLobby = {}
CoD.GameLobby.Update = function ( self, event )
	self:dispatchEventToChildren( event )
	self:processEvent( {
		name = "party_update_status"
	} )
end

CoD.GameLobby.Button_CAC = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_cac",
		controller = event.controller,
		isLocked = CoD.CheckButtonLock( self, event.controller )
	} )
end

CoD.GameLobby.CacImportAdditionalValidation = function ( self, event )
	Engine.ECACImport_ValidateDecision( event.controller, true )
end

CoD.GameLobby.CacImportPopupClosed = function ( self, event )
	self:processEvent( {
		name = "open_cac",
		controller = event.controller,
		isLocked = false
	} )
end

CoD.GameLobby.OpenCAC = function ( self, event )
	if event.isLocked == true then
		Engine.PlaySound( CoD.CACUtility.denySFX )
		local errorPopup = self:openPopup( "Error", event.controller )
		local lockedMessage = CoD.GetUnlockLevelString( event.controller, "FEATURE_CREATE_A_CLASS" )
		errorPopup:setMessage( Engine.Localize( lockedMessage ) )
	elseif Engine.ECACImport_ShouldShow( event.controller ) == 1 then
		self:openPopup( "CACImportPopup", event.controller )
	else
		Engine.PlaySound( "cac_enter_cac" )
		Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_MODIFYING_CAC )
		CoD.CACUtility.SetDefaultCACRoot( event.controller )
		CoD.OpenCACMenu( self, event.controller )
	end
end

CoD.GameLobby.Button_Rewards = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_rewards",
		controller = event.controller,
		isLocked = CoD.CheckButtonLock( self, event.controller )
	} )
end

CoD.GameLobby.OpenRewards = function ( self, event )
	if event.isLocked == true then
		Engine.PlaySound( CoD.CACUtility.denySFX )
		local errorPopup = self:openPopup( "Error", event.controller )
		local lockedMessage = CoD.GetUnlockLevelString( event.controller, "FEATURE_KILLSTREAKS" )
		errorPopup:setMessage( Engine.Localize( lockedMessage ) )
	else
		Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_MODIFYING_REWARDS )
		self:openPopup( "T6Rewards", event.controller )
		Engine.PlaySound( "cac_screen_fade" )
	end
end

CoD.GameLobby.OpenBarracks = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	elseif CoD.isZombie == true then
		self:openPopup( "LeaderboardCarouselZM", event.controller )
	else
		Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_VIEWING_PLAYERCARD )
		self:openPopup( "Barracks", event.controller )
	end
end

CoD.GameLobby.UpdateStatusTextInternal = function ( statusText )
	local status, timeRemaining = nil
	local hostState = ""
	status, timeRemaining = Engine.GetGameLobbyStatus()
	if status == "" and not Engine.GameHost() then
		hostState = CoD.getPartyHostStateText( Engine.PartyGetHostUIState() )
		if hostState == "" then
			hostState = Engine.Localize( "MENU_READY" )
		end
		status = Engine.Localize( "MENU_PARTY_LEADER" ) .. " " .. hostState
	end
	if statusText.lastStatus ~= status or statusText.lastTimeRemaining ~= timeRemaining then
		statusText.lastStatus = status
		statusText.timeRemaining = timeRemaining
		if timeRemaining ~= nil and timeRemaining > 0 then
			statusText:setText( status .. ":  " .. timeRemaining )
		else
			statusText:setText( status )
			statusText.currentHostState = nil
		end
	end
end

CoD.GameLobby.UpdateStatusText = function ( self, event )
	if self.buttonPane.body == nil or self.buttonPane.body.statusText == nil then
		return 
	else
		local statusText = self.buttonPane.body.statusText
		CoD.GameLobby.UpdateStatusTextInternal( statusText )
	end
end

CoD.GameLobby.PopulateButtons = function ( self, statusOffset )
	CoD.GameLobby.AddStatusText( self, statusOffset )
end

CoD.GameLobby.UpdateButtonPane = function ( self, event )
	CoD.GameLobby.UpdateButtonPaneButtonVisibility( self.buttonPane )
end

CoD.GameLobby.UpdateButtonPaneButtonVisibility = function ( self )
	if self == nil or self.body == nil then
		return 
	elseif self.body.createAClassButton ~= nil then
		CoD.SetupButtonLock( self.body.createAClassButton, nil, "FEATURE_CREATE_A_CLASS", "FEATURE_CREATE_A_CLASS_DESC", CoD.GameLobby.Button_CAC )
	end
	if self.body.rewardsButton ~= nil then
		CoD.SetupButtonLock( self.body.rewardsButton, nil, "FEATURE_KILLSTREAKS", "FEATURE_KILLSTREAKS_DESC", CoD.GameLobby.Button_Rewards )
	end
end

CoD.GameLobby.AddStatusText = function ( self, statusOffset )
	if self.body.statusText ~= nil then
		self.body.statusText:close()
		self.body.statusText = nil
	end
	local statusTextFontName = "Condensed"
	local statusTextFont = CoD.fonts[statusTextFontName]
	local statusTextSize = CoD.textSize[statusTextFontName]
	local statusTextTop = -statusOffset - CoD.ButtonPrompt.Height - 15 - statusTextSize - 3
	self.body.statusText = LUI.UIText.new( {
		left = 0,
		top = statusTextTop,
		right = 100,
		bottom = statusTextTop + statusTextSize,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		font = statusTextFont
	} )
	self.body:addElement( self.body.statusText )
	self:dispatchEventToParent( {
		name = "party_update_status"
	} )
end

CoD.GameLobby.new = function ( menuName, controller, enableSearchingRows, buttonPaneTitleText, lobbyListHeaderText, showMissingDLC )
	if buttonPaneTitleText == nil then
		buttonPaneTitleText = Engine.Localize( "MENU_MULTIPLAYER_CAPS" )
	end
	local gameLobby = CoD.Lobby.New( menuName, controller, enableSearchingRows, buttonPaneTitleText, lobbyListHeaderText, showMissingDLC )
	gameLobby:registerEventHandler( "gamelobby_update", CoD.GameLobby.Update )
	gameLobby:registerEventHandler( "partylobby_update", CoD.GameLobby.Update )
	gameLobby:registerEventHandler( "party_update_status", CoD.GameLobby.UpdateStatusText )
	gameLobby:registerEventHandler( "open_cac", CoD.GameLobby.OpenCAC )
	gameLobby:registerEventHandler( "open_rewards", CoD.GameLobby.OpenRewards )
	gameLobby:registerEventHandler( "open_barracks", CoD.GameLobby.OpenBarracks )
	gameLobby:registerEventHandler( "update_button_pane", CoD.GameLobby.UpdateButtonPane )
	gameLobby:registerEventHandler( "elite_cac_additional_validation", CoD.GameLobby.CacImportAdditionalValidation )
	gameLobby:registerEventHandler( "elite_cac_import_popup_closed", CoD.GameLobby.CacImportPopupClosed )
	gameLobby.panelManager:processEvent( {
		name = "fetching_done"
	} )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	gameLobby:addElement( LUI.UITimer.new( 250, "party_update_status", false ) )
	return gameLobby
end

