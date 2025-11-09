require( "ui.T6.Lobby" )
require( "ui.T6.EdgeShadow" )
require( "ui_mp.T6.Menus.Playercard" )
require( "ui.T6.Error" )
require( "ui_mp.T6.Menus.PlaylistSelectionPopup" )

CoD.PartyLobby = {}
CoD.PartyLobby.FindMatchEnabled = false
CoD.PartyLobby.Back = function ( self, event )
	if Engine.IsLivestreamEnabled() then
		self:registerEventHandler( "livestream_update_state", CoD.PartyLobby.Back )
		self:openPopup( "LiveStream_Disable", event.controller )
		return 
	elseif CoD.isPartyHost() then
		CoD.SwitchToMainLobby( event.controller )
	else
		Engine.ExecNow( event.controller, "leaveAllParties" )
		Engine.PartyHostClearUIState()
		CoD.StartMainLobby( event.controller )
	end
	self:setPreviousMenu( "MainLobby" )
	self:goBack( event )
end

CoD.PartyLobby.BackAlone = function ( self, event )
	if Engine.IsLivestreamEnabled() then
		self:registerEventHandler( "livestream_update_state", CoD.PartyLobby.BackAlone )
		self:openPopup( "LiveStream_Disable", event.controller )
		return 
	elseif CoD.isPartyHost() then
		Engine.Exec( event.controller, "xstopprivateparty" )
		CoD.StartMainLobby( event.controller )
	else
		Engine.ExecNow( event.controller, "leaveAllParties" )
		Engine.PartyHostClearUIState()
		CoD.StartMainLobby( event.controller )
	end
	self:setPreviousMenu( "MainLobby" )
	self:goBack( event )
end

CoD.PartyLobby.Button_Back = function ( self, event )
	if CoD.Lobby.OpenSignOutPopup( self, event ) == true then
		return 
	elseif not Engine.AloneInPrivatePartyIgnoreSplitscreen( true ) then
		local leaveHandlerTextTable = {
			params = {}
		}
		if CoD.isPartyHost() then
			leaveHandlerTextTable.titleText = Engine.Localize( "MENU_LEAVE_LOBBY_TITLE" )
			leaveHandlerTextTable.messageText = Engine.Localize( "MENU_LEAVE_LOBBY_HOST_WARNING" )
			table.insert( leaveHandlerTextTable.params, {
				leaveHandler = CoD.PartyLobby.BackAlone,
				leaveEvent = "confirm_leave_alone",
				leaveText = Engine.Localize( "MPUI_LEAVE_WITHOUT_PARTY" ),
				debugHelper = "You're the leader of a private party, choosing this will disband your party"
			} )
			table.insert( leaveHandlerTextTable.params, {
				leaveHandler = CoD.PartyLobby.Back,
				leaveEvent = "confirm_leave_with",
				leaveText = Engine.Localize( "MENU_BRING_PARTY" ),
				debugHelper = "You're the leader of a private party, choosing this bring your party along"
			} )
		else
			leaveHandlerTextTable.titleText = Engine.Localize( "MENU_LEAVE_LOBBY_TITLE" )
			leaveHandlerTextTable.messageText = Engine.Localize( "MENU_LEAVE_LOBBY_CLIENT_WARNING" )
			table.insert( leaveHandlerTextTable.params, {
				leaveHandler = CoD.PartyLobby.Back,
				leaveEvent = "confirm_leave",
				leaveText = Engine.Localize( "MENU_LEAVE_LOBBY_AND_PARTY" ),
				debugHelper = "You're a client of a private party, remove you from the party"
			} )
		end
		CoD.Lobby.ConfirmLeave( self, event.controller, "confirm_leave", CoD.PartyLobby.Back, leaveHandlerTextTable )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) == true and CoD.isPartyHost() then
		local leaveHandlerTextTable = {
			params = {},
			titleText = Engine.Localize( "MENU_LEAVE_LOBBY_TITLE" ),
			messageText = Engine.Localize( "MENU_LEAVE_LOBBY_HOST_WARNING" )
		}
		table.insert( leaveHandlerTextTable.params, {
			leaveHandler = CoD.PartyLobby.BackAlone,
			leaveEvent = "confirm_leave_alone",
			leaveText = Engine.Localize( "MPUI_LEAVE_WITHOUT_PARTY" ),
			debugHelper = "You're the leader of a private party, choosing this will disband your party"
		} )
		table.insert( leaveHandlerTextTable.params, {
			leaveHandler = CoD.PartyLobby.Back,
			leaveEvent = "confirm_leave_with",
			leaveText = Engine.Localize( "MENU_BRING_PARTY" ),
			debugHelper = "You're the leader of a private party, choosing this bring your party along"
		} )
		CoD.Lobby.ConfirmLeave( self, event.controller, "confirm_leave", CoD.PartyLobby.Back, leaveHandlerTextTable )
	else
		CoD.PartyLobby.Back( self, event )
	end
end

CoD.PartyLobby.GoToFindingGames = function ( self, event )
	Engine.ProbationCheckForDashboardWarning( CoD.GAMEMODE_PUBLIC_MATCH )
	local probation, controller = Engine.ProbationCheckInProbation( CoD.GAMEMODE_PUBLIC_MATCH )
	if probation == true then
		self:openPopup( "popup_public_inprobation", controller )
		return 
	else
		local f4_local0, f4_local1 = Engine.ProbationCheckForProbation( CoD.GAMEMODE_PUBLIC_MATCH )
		controller = f4_local1
		if f4_local0 == true then
			self:openPopup( "popup_public_givenprobation", controller )
			return 
		elseif Engine.ProbationCheckParty( CoD.GAMEMODE_PUBLIC_MATCH, event.controller ) == true then
			self:openPopup( "popup_public_partyprobation", event.controller )
			return 
		else
			Engine.Exec( event.controller, "xstartparty" )
			Engine.Exec( event.controller, "updategamerprofile" )
			self:openMenu( "PublicGameLobby", event.controller )
			self:close()
		end
	end
end

CoD.PartyLobby.OpenPlaylistSelection = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
		errorPopup.anyControllerAllowed = true
		return 
	else
		Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_SELECTING_PLAYLIST )
		local playlistSelectionMenu = self:openPopup( "PlaylistSelection", event.controller )
		playlistSelectionMenu:addCategoryButtons( event.controller )
		Engine.PlaySound( "cac_screen_fade" )
	end
end

CoD.PartyLobby.SetPlaylistFilter = function ( self, name )
	CoD.PlaylistCategoryFilter = name
end

CoD.PartyLobby.Button_CAC = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_cac",
		controller = event.controller,
		isLocked = CoD.CheckButtonLock( self, event.controller )
	} )
end

CoD.PartyLobby.OpenCAC = function ( self, event )
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

CoD.PartyLobby.CacImportAdditionalValidation = function ( self, event )
	Engine.ECACImport_ValidateDecision( event.controller, true )
end

CoD.PartyLobby.CacImportPopupClosed = function ( self, event )
	self:processEvent( {
		name = "open_cac",
		controller = event.controller,
		isLocked = false
	} )
end

CoD.PartyLobby.Button_Rewards = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_rewards",
		controller = event.controller,
		isLocked = CoD.CheckButtonLock( self, event.controller )
	} )
end

CoD.PartyLobby.OpenRewards = function ( self, event )
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

CoD.PartyLobby.OpenBarracks = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	else
		Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_VIEWING_PLAYERCARD )
		self:openPopup( "Barracks", event.controller )
	end
end

CoD.PartyLobby.OpenCoDTV = function ( self, event )
	if Engine.CanViewContent() == false then
		self:openPopup( "popup_contentrestricted", event.controller )
		return 
	elseif Engine.IsLivestreamEnabled() then
		self:openPopup( "CODTv_Error", event.controller )
		return 
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 and Engine.IsCodtvContentLoaded() == true then
		Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_VIEWING_COD_TV )
		CoD.perController[event.controller].codtvRoot = "community"
		self:openPopup( "CODTv", event.controller, "community" )
	end
end

CoD.PartyLobby.UpdateButtonPaneButtonVisibility = function ( self )
	if self == nil or self.body == nil then
		return 
	elseif CoD.isPartyHost() then
		self.body.buttonList:addElement( self.body.findMatchButton )
	else
		self.body.findMatchButton:close()
		if self.body.findMatchButton:isInFocus() == true then
			self.body.buttonList:processEvent( {
				name = "gain_focus"
			} )
		end
	end
	local areAllChunksInstalled = CoD.PartyLobby.AreAllChunksInstalled()
	if self.body.findMatchButton ~= nil and CoD.PartyLobby.FindMatchEnabled == true and areAllChunksInstalled == true then
		self.body.findMatchButton:enable()
	end
	if self.body.rewardsButton ~= nil then
		CoD.SetupButtonLock( self.body.rewardsButton, nil, "FEATURE_KILLSTREAKS", "FEATURE_KILLSTREAKS_DESC", CoD.PartyLobby.Button_Rewards )
	end
	CoD.PartyLobby.UpdateDLCWarning( self )
end

CoD.PartyLobby.UpdateButtonPromptVisibility = function ( self )
	if self == nil then
		return 
	elseif self.partyPrivacyButton ~= nil and CoD.isPartyHost() == false then
		self.partyPrivacyButton:close()
	end
	if self.partyPrivacyButton ~= nil then
		self:updatePartyPrivacyButton()
	end
end

CoD.PartyLobby.AreAllChunksInstalled = function ()
	local areMPChunksInstalled = Engine.AreAllChunksInstalledByGameType( "mp" )
	local areCPChunksInstalled = Engine.AreAllChunksInstalledByGameType( "cp" )
	local areZMChunksInstalled = Engine.AreAllChunksInstalledByGameType( "zm" )
	local f17_local0 = areMPChunksInstalled
	local f17_local1 = areCPChunksInstalled
	local areAllChunksInstalled = areZMChunksInstalled
	return f17_local1 and f17_local0 and areAllChunksInstalled
end

CoD.PartyLobby.PopulateButtons = function ( self )
	self.body.findMatchButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_FIND_MATCH_CAPS" ), nil, 1 )
	self.body.findMatchButton.hintText = Engine.Localize( "MPUI_FIND_MATCH_DESC" )
	self.body.findMatchButton:setActionEventName( "open_playlist_selection" )
	local areAllChunksInstalled = CoD.PartyLobby.AreAllChunksInstalled()
	if CoD.PartyLobby.FindMatchEnabled == false or areAllChunksInstalled == false then
		self.body.findMatchButton:disable()
	end
	if CoD.isZombie == true then
		CoD.PartyLobby.PopulateButtons_Zombies( self )
	else
		CoD.PartyLobby.PopulateButtons_Multiplayer( self )
	end
	CoD.PartyLobby.AddDLCWarning( self )
end

CoD.PartyLobby.AddDLCWarning = function ( self )
	self.body.dlcWarningContainer = LUI.UIElement.new()
	self.body.dlcWarningContainer:setLeftRight( true, true, 0, 0 )
	self.body.dlcWarningContainer:setTopBottom( true, true, CoD.CoD9Button.Height * 12, 0 )
	self.body.dlcWarningContainer:setAlpha( 0 )
	self.body:addElement( self.body.dlcWarningContainer )
	local warningIconSize = 24
	local warningSpacing = 5
	self.body.dlcWarningContainer.warningIcon = LUI.UIImage.new()
	self.body.dlcWarningContainer.warningIcon:setLeftRight( true, false, 0, warningIconSize )
	self.body.dlcWarningContainer.warningIcon:setTopBottom( true, false, 0, warningIconSize )
	self.body.dlcWarningContainer.warningIcon:setImage( RegisterMaterial( "cac_restricted" ) )
	self.body.dlcWarningContainer:addElement( self.body.dlcWarningContainer.warningIcon )
	local warningFontName = "Default"
	local warningFont = CoD.fonts[warningFontName]
	local warningFontHeight = CoD.textSize[warningFontName]
	local warningRightOffset = 30
	self.body.dlcWarningContainer.warningLabel = LUI.UIText.new()
	self.body.dlcWarningContainer.warningLabel:setLeftRight( true, true, warningIconSize + warningSpacing, -warningRightOffset )
	self.body.dlcWarningContainer.warningLabel:setTopBottom( true, false, 0, warningFontHeight )
	self.body.dlcWarningContainer.warningLabel:setFont( warningFont )
	self.body.dlcWarningContainer.warningLabel:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
	self.body.dlcWarningContainer.warningLabel:setAlignment( LUI.Alignment.Left )
	self.body.dlcWarningContainer:addElement( self.body.dlcWarningContainer.warningLabel )
	CoD.PartyLobby.UpdateDLCWarning( self )
end

CoD.PartyLobby.UpdateDLCWarning = function ( self )
	if self.body.dlcWarningContainer ~= nil then
		local whoIsMissingDLC = Engine.WhoIsMissingMapPacks()
		local useShortVersion = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
		local warningText = ""
		if whoIsMissingDLC and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
			self.body.dlcWarningContainer:setAlpha( 1 )
			if whoIsMissingDLC == "me" then
				if useShortVersion then
					warningText = Engine.Localize( "MPUI_DLC_WARNING_YOU_SHORT" )
				else
					warningText = Engine.Localize( "MPUI_DLC_WARNING_YOU" )
				end
			elseif whoIsMissingDLC == "partymember" then
				if useShortVersion then
					warningText = Engine.Localize( "MPUI_DLC_WARNING_OTHER_PLAYERS_SHORT" )
				else
					warningText = Engine.Localize( "MPUI_DLC_WARNING_OTHER_PLAYERS" )
				end
			end
		else
			self.body.dlcWarningContainer:setAlpha( 0 )
		end
		self.body.dlcWarningContainer.warningLabel:setText( warningText )
	end
end

CoD.PartyLobby.PopulateButtons_Multiplayer = function ( self )
	self.body.createAClassButton = self.body.buttonList:addButton( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ), nil, 2 )
	self.body.createAClassButton:registerEventHandler( "button_action", CoD.PartyLobby.Button_CAC )
	if Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 1 then
		self.body.rewardsButton = self.body.buttonList:addButton( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ), nil, 3 )
		CoD.SetupButtonLock( self.body.rewardsButton, nil, "FEATURE_KILLSTREAKS", "FEATURE_KILLSTREAKS_DESC" )
		CoD.CACUtility.SetupScorestreaksNew( self.body.rewardsButton )
		self.body.rewardsButton:registerEventHandler( "button_action", CoD.PartyLobby.Button_Rewards )
	end
	self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 4 )
	if not Engine.IsBetaBuild() then
		self.body.barracksButton = self.body.buttonList:addButton( Engine.Localize( "MENU_BARRACKS_CAPS" ), nil, 5 )
		self.body.barracksButton:setActionEventName( "open_barracks" )
		CoD.SetupBarracksLock( self.body.barracksButton )
		CoD.SetupBarracksNew( self.body.barracksButton )
		self.body.codtvButton = self.body.buttonList:addButton( Engine.Localize( "MENU_COD_TV_CAPS" ), nil, 6 )
		self.body.codtvButton:setActionEventName( "open_cod_tv_party" )
		self.body.codtvButton.hintText = Engine.Localize( "MPUI_COD_TV_DESC" )
	end
	if Engine.DvarBool( nil, "webm_encUiEnabledPublic" ) == 1 then
		CoD.Lobby.AddLivestreamButton( self, 10 )
	end
end

CoD.PartyLobby.PopulateButtons_Zombies = function ( self )
	self.body.barracksButton = self.body.buttonList:addButton( Engine.Localize( CoD.MPZM( "MENU_BARRACKS_CAPS", "MPUI_LEADERBOARDS_CAPS" ) ), nil, 2 )
	self.body.barracksButton:setActionEventName( "open_barracks" )
	CoD.SetupBarracksLock( self.body.barracksButton )
	Engine.SetDvar( "party_readyPercentRequired", 0 )
end

CoD.PartyLobby.Update = function ( self, event )
	if self == nil then
		return 
	elseif CoD.isPartyHost() and not Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) and not Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) then
		Engine.Exec( event.controller, "getLatestWAD" )
	end
	if event ~= nil and event.actualPartyMemberCount ~= nil then
		if event.actualPartyMemberCount > 0 then
			CoD.PartyLobby.FindMatchEnabled = true
		else
			CoD.PartyLobby.FindMatchEnabled = false
		end
	end
	CoD.PartyLobby.UpdateButtonPaneButtonVisibility( self.buttonPane )
	CoD.PartyLobby.UpdateButtonPromptVisibility( self )
	self:dispatchEventToChildren( event )
end

CoD.PartyLobby.UpdateButtonPane = function ( self, event )
	CoD.PartyLobby.UpdateButtonPaneButtonVisibility( self.buttonPane )
	CoD.PartyLobby.UpdateButtonPromptVisibility( self )
end

CoD.PartyLobby.AddLobbyPaneElements = function ( self )
	local maxControllersAllowed = Engine.DvarInt( controller, "party_maxlocalplayers_playermatch" )
	CoD.LobbyPanes.addLobbyPaneElements( self, nil, maxControllersAllowed )
end

CoD.PartyLobby.ButtonListButtonGainFocus = function ( self, event )
	self:dispatchEventToParent( {
		name = "add_party_privacy_button"
	} )
	CoD.Lobby.ButtonListButtonGainFocus( self, event )
end

CoD.PartyLobby.ButtonListAddButton = function ( self, text, hintText, priority )
	local newButton = CoD.Lobby.ButtonListAddButton( self, text, hintText, priority )
	newButton:registerEventHandler( "gain_focus", CoD.PartyLobby.ButtonListButtonGainFocus )
	return newButton
end

CoD.PartyLobby.AddButtonPaneElements = function ( self )
	CoD.LobbyPanes.addButtonPaneElements( self )
	self.body.buttonList.addButton = CoD.PartyLobby.ButtonListAddButton
end

CoD.PartyLobby.PopulateButtonPaneElements = function ( self )
	CoD.PartyLobby.PopulateButtons( self )
	CoD.PartyLobby.UpdateButtonPaneButtonVisibility( self )
end

CoD.PartyLobby.new = function ( controller, menuName, buttonPaneTitleText )
	local partyLobby = CoD.Lobby.New( menuName, controller, nil, buttonPaneTitleText, Engine.Localize( "MENU_PARTY_CAPS" ), true )
	partyLobby.addButtonPaneElements = CoD.PartyLobby.AddButtonPaneElements
	partyLobby.populateButtonPaneElements = CoD.PartyLobby.PopulateButtonPaneElements
	partyLobby.addLobbyPaneElements = CoD.PartyLobby.AddLobbyPaneElements
	partyLobby.setPlaylistFilter = CoD.PartyLobby.SetPlaylistFilter
	partyLobby:setPlaylistFilter( "" )
	partyLobby:updatePanelFunctions()
	partyLobby:registerEventHandler( "partylobby_update", CoD.PartyLobby.Update )
	partyLobby:registerEventHandler( "playlist_selected", CoD.PartyLobby.GoToFindingGames )
	partyLobby:registerEventHandler( "button_prompt_back", CoD.PartyLobby.Button_Back )
	partyLobby:registerEventHandler( "open_playlist_selection", CoD.PartyLobby.OpenPlaylistSelection )
	partyLobby:registerEventHandler( "open_cac", CoD.PartyLobby.OpenCAC )
	partyLobby:registerEventHandler( "open_rewards", CoD.PartyLobby.OpenRewards )
	partyLobby:registerEventHandler( "open_barracks", CoD.PartyLobby.OpenBarracks )
	partyLobby:registerEventHandler( "open_cod_tv_party", CoD.PartyLobby.OpenCoDTV )
	partyLobby:registerEventHandler( "restartMatchmaking", CoD.PartyLobby.GoToFindingGames )
	partyLobby:registerEventHandler( "update_button_pane", CoD.PartyLobby.UpdateButtonPane )
	partyLobby:registerEventHandler( "elite_cac_additional_validation", CoD.PartyLobby.CacImportAdditionalValidation )
	partyLobby:registerEventHandler( "elite_cac_import_popup_closed", CoD.PartyLobby.CacImportPopupClosed )
	CoD.PartyLobby.PopulateButtons( partyLobby.buttonPane )
	CoD.PartyLobby.UpdateButtonPaneButtonVisibility( partyLobby.buttonPane )
	CoD.PartyLobby.UpdateButtonPromptVisibility( partyLobby )
	if CoD.useController then
		if CoD.isPartyHost() then
			partyLobby.buttonPane.body.findMatchButton:processEvent( {
				name = "gain_focus"
			} )
		elseif CoD.isZombie == true then
			partyLobby.buttonPane.body.barracksButton:processEvent( {
				name = "gain_focus"
			} )
		else
			partyLobby.buttonPane.body.createAClassButton:processEvent( {
				name = "gain_focus"
			} )
		end
	end
	Engine.PartyHostClearUIState()
	partyLobby.panelManager:processEvent( {
		name = "fetching_done"
	} )
	Engine.SystemNeedsUpdate( nil, "party" )
	Engine.SystemNeedsUpdate( nil, "game_options" )
	return partyLobby
end

