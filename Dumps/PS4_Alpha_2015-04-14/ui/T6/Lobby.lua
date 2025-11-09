require( "ui.T6.CoD9Button" )
require( "ui.T6.ButtonList" )
require( "ui.T6.LobbyPanes" )
require( "ui.T6.LobbyPlayerLists" )
require( "ui.T6.PanelManager" )
require( "ui.T6.UnifiedFriends" )
require( "ui_mp.T6.Menus.MTXPurchasePopup" )
require( "ui.T6.Menus.PartyPrivacyPopup" )
require( "ui_mp.T6.Menus.LiveStream" )
require( "ui.T6.Menus.TexturePackPopup" )
require( "ui_mp.T6.Menus.YouTube" )
require( "ui_mp.T6.Menus.Twitter" )
require( "ui_mp.T6.Menus.Twitch" )

CoD.Lobby = {}
local ShowGlobeEvent = {
	name = "show_globe"
}
CoD.Lobby.OverviewPane_PlayerSelected = function ( self, event )
	if CoD.isZombie == true then
		if event.controller ~= nil then
			local xuid = Engine.GetXUID( event.controller )
			if xuid == event.playerXuid then
				self.panelManager.slideToStatsPaneEnabled = true
			else
				self.panelManager.slideToStatsPaneEnabled = false
			end
		end
	else
		self.selectedPlayerShowTruePlayerInfo = Engine.PartyShowTruePlayerInfoByXuid( event.playerXuid )
		if self.selectedPlayerShowTruePlayerInfo ~= false then
			self.panelManager.slideToStatsPaneEnabled = true
		else
			self.panelManager.slideToStatsPaneEnabled = false
		end
	end
	self.selectedPlayerXuid = event.playerXuid
	self.selectedPlayerName = event.playerName
	self.selectedLeagueTeamID = event.leagueTeamID
	self.leagueTeamMemberCount = event.leagueTeamMemberCount
	if self.body ~= nil then
		self:populatePanelElements()
	end
	self:dispatchEventToChildren( event )
end

CoD.Lobby.StatsPane_PlayerSelected = function ( self, event )
	self.selectedPlayerXuid = event.playerXuid
	self.selectedLeagueTeamID = event.leagueTeamID
	self.leagueTeamMemberCount = event.leagueTeamMemberCount
	self:dispatchEventToChildren( event )
end

CoD.Lobby.ButtonListButtonGainFocus = function ( self, event )
	self.buttonList.pane.selectedButtonName = self.name
	return CoD.CoD9Button.GainFocus( self, event )
end

CoD.Lobby.ButtonListAddButton = function ( self, text, hintText, priority )
	local newButton = CoD.ButtonList.AddButton( self, text, hintText, priority )
	newButton.buttonList = self
	newButton.name = text
	newButton:registerEventHandler( "gain_focus", CoD.Lobby.ButtonListButtonGainFocus )
	return newButton
end

CoD.Lobby.ButtonListGainFocus = function ( self, event )
	if self.pane.selectedButtonName ~= nil then
		local selectedButton = nil
		local childElement = self:getFirstChild()
		while childElement ~= nil do
			if childElement.m_focusable and childElement.name == self.pane.selectedButtonName then
				selectedButton = childElement
				break
			end
			childElement = childElement:getNextSibling()
		end
		if selectedButton ~= nil then
			selectedButton:processEvent( {
				name = "gain_focus"
			} )
			return 
		end
	end
	return LUI.UIVerticalList.gainFocus( self )
end

CoD.Lobby.ButtonListLoseFocus = function ( self, event )
	self:dispatchEventToParent( {
		name = "remove_party_privacy_button"
	} )
end

CoD.Lobby.RemovePartyPrivacyButton = function ( self, event )
	if self.partyPrivacyButton ~= nil then
		self.partyPrivacyButton:close()
		self.partyPrivacyButton = nil
	end
end

CoD.Lobby.AddPartyPrivacyButton = function ( self, event )
	if self.partyPrivacyButton == nil then
		self:addPartyPrivacyButton()
	end
	self:updatePartyPrivacyButton()
	self:addNATType()
end

CoD.Lobby.AddSelectButton = function ( self, event )
	self:addSelectButtonWithPrestigeUnlock()
end

CoD.Lobby.RemoveSelectButton = function ( self, event )
	self:removeSelectButton()
end

CoD.Lobby.saveStateLobbyPaneElements = function ( self )
	if self.body.lobbyList ~= nil then
		CoD.LobbyPlayerLists.SaveState( self.body.lobbyList, self.id )
	end
end

CoD.Lobby.PlayerSelected = function ( lobby, event )
	if Engine.IsGuest( event.controller ) then
		lobby:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	end
	CoD.FriendPopup.SelectedPlayerXuid = event.button.playerXuid
	CoD.FriendPopup.SelectedPlayerName = event.button.gamerTag
	CoD.FriendsListPopup.Mode = CoD.playerListType.friend
	if Engine.PartyShowTruePlayerInfoByXuid( event.button.playerXuid ) == true then
		lobby:openPopup( "FriendPopup", event.controller )
	end
end

CoD.Lobby.SetSplitscreenSignInAllowed = function ( self, allowSplitscreenSignIn )
	self.splitscreenSignInAllowed = allowSplitscreenSignIn
	if self.body.lobbyList then
		self.body.lobbyList:setSplitscreenSignInAllowed( allowSplitscreenSignIn )
	end
end

CoD.Lobby.OpenWiiUControllerSelectorPopup = function ( self, event )
	if not self.m_inputDisabled then
		local popup = self:openPopup( event.popupName, event.controller )
		local playerLists = self.lobbyPane.body.lobbyList.playerLists
		event.newPlayerOption = false
		for index, item in pairs( playerLists ) do
			if item.splitscreenSignInRow ~= nil then
				event.signInAllowed = true
			end
		end
		popup:init( event )
		return true
	else
		
	end
end

CoD.Lobby.New = function ( menuName, controller, enableSearchingRows, buttonPaneTitleText, lobbyListHeaderText, showMissingDLC )
	local lobbyMenu = CoD.Menu.New( menuName )
	lobbyMenu.addButtonPaneElements = CoD.LobbyPanes.addButtonPaneElements
	lobbyMenu.addLobbyPaneElements = CoD.LobbyPanes.addLobbyPaneElements
	lobbyMenu.addOverviewPaneElements = CoD.LobbyPanes.addOverviewPaneElements
	lobbyMenu.addStatsPaneElements = CoD.LobbyPanes.addStatsPaneElements
	lobbyMenu.setFocusButtonPaneElements = CoD.LobbyPanes.ButtonPaneSetFocus
	lobbyMenu.setFocusLobbyPaneElements = CoD.LobbyPanes.LobbyPaneSetFocus
	lobbyMenu.setFocusOverviewPaneElements = CoD.LobbyPanes.OverviewPaneSetFocus
	lobbyMenu.populateButtonPaneElements = CoD.LobbyPanes.populateButtonPaneElements
	lobbyMenu.populateLobbyPaneElements = CoD.LobbyPanes.populateLobbyPaneElements
	lobbyMenu.populateOverviewPaneElements = CoD.LobbyPanes.populateOverviewPaneElements
	lobbyMenu.populateStatsPaneElements = CoD.LobbyPanes.populateStatsPaneElements
	lobbyMenu.saveStateLobbyPaneElements = CoD.Lobby.saveStateLobbyPaneElements
	lobbyMenu.updatePanelFunctions = CoD.Lobby.UpdatePanelFunctions
	lobbyMenu.goBack = CoD.Lobby.GoBack
	if CoD.isZombie == true then
		lobbyMenu.setFocusStatsPaneElements = CoD.LobbyPanes.StatsPaneSetFocus
		lobbyMenu.populateSurvivalStatsPaneElements = CoD.LobbyPanes.populateSurvivalStatsPaneElements
		lobbyMenu.populateEncountersStatsPaneElements = CoD.LobbyPanes.populateEncountersStatsPaneElements
	else
		lobbyMenu:registerEventHandler( "elite_registration_email_popup_requested", CoD.EliteRegistrationEmailPopup.EliteRegistrationEmailPopupRequested )
		lobbyMenu:registerEventHandler( "AutoFillPopup_Closed", CoD.EliteRegistrationEmailPopup.AutoFillPopup_Closed )
		lobbyMenu:registerEventHandler( "elite_registration_ended", CoD.Lobby.EliteRegisterationSuccess )
	end
	lobbyMenu:registerEventHandler( "add_party_privacy_button", CoD.Lobby.AddPartyPrivacyButton )
	lobbyMenu:registerEventHandler( "button_prompt_friends", CoD.Lobby.ButtonPromptFriendsMenu )
	lobbyMenu:registerEventHandler( "button_prompt_partyprivacy", CoD.Lobby.ButtonPromptPartyPrivacy )
	lobbyMenu:registerEventHandler( "current_panel_changed", CoD.Lobby.CurrentPanelChanged )
	lobbyMenu:registerEventHandler( "open_menu", CoD.Lobby.OpenMenu )
	lobbyMenu:registerEventHandler( "open_sign_in", CoD.Lobby.OpenSignInPopup )
	lobbyMenu:registerEventHandler( "playerlist_row_selected", CoD.Lobby.PlayerListRowSelected )
	lobbyMenu:registerEventHandler( "playerlist_row_deselected", CoD.Lobby.PlayerListRowDeselected )
	lobbyMenu:registerEventHandler( "remove_party_privacy_button", CoD.Lobby.RemovePartyPrivacyButton )
	lobbyMenu:registerEventHandler( "open_playeroptions_popup", CoD.Lobby.PlayerSelected )
	lobbyMenu:registerEventHandler( "open_controller_selector_popup", CoD.Lobby.OpenWiiUControllerSelectorPopup )
	lobbyMenu:registerEventHandler( "toggle_livestream", CoD.Lobby.ToggleLivestream )
	lobbyMenu:registerEventHandler( "youtube_connect_complete", CoD.Lobby.OpenLiveStreamTOS )
	lobbyMenu:registerEventHandler( "twitch_connect_complete", CoD.Lobby.OpenLiveStreamTOS )
	lobbyMenu:registerEventHandler( "update_livestream_camera", CoD.Lobby.UpdateLivestreamCamera )
	lobbyMenu:registerEventHandler( "friends_updated", CoD.Lobby.LobbyListUpdateMembers )
	lobbyMenu:registerEventHandler( "sign_in_failed_probation", CoD.Lobby.SignInFailedProbation )
	lobbyMenu:registerEventHandler( "add_select_button", CoD.Lobby.AddSelectButton )
	lobbyMenu:registerEventHandler( "remove_select_button", CoD.Lobby.RemoveSelectButton )
	lobbyMenu.panelManager = CoD.PanelManager.New( Engine.GetPrimaryController(), lobbyMenu.width, lobbyMenu.height )
	lobbyMenu:addElement( lobbyMenu.panelManager )
	lobbyMenu:addSelectButton()
	lobbyMenu:addBackButton()
	lobbyMenu:addFriendsButton()
	lobbyMenu:addPartyPrivacyButton()
	lobbyMenu:addNATType()
	lobbyMenu.buttonPane = lobbyMenu.panelManager:createPanel( "buttonPane", "left" )
	lobbyMenu.buttonPane:close()
	lobbyMenu.buttonPane:setPriority( 10 )
	lobbyMenu.panelManager:addElement( lobbyMenu.buttonPane )
	lobbyMenu.buttonPane.titleText = buttonPaneTitleText
	lobbyMenu.buttonPane.addPanelElements = lobbyMenu.addButtonPaneElements
	lobbyMenu.buttonPane:addPanelElements()
	lobbyMenu.buttonPane.populatePanelElements = lobbyMenu.populateButtonPaneElements
	lobbyMenu.buttonPane.setFocusPanelElements = lobbyMenu.setFocusButtonPaneElements
	lobbyMenu.panelManager.currentPanelIndex = 1
	lobbyMenu.lobbyPane = lobbyMenu.panelManager:createPanel( "lobbyPane", "right" )
	lobbyMenu.lobbyPane.titleText = Engine.Localize( "MENU_LOBBY_LIST_CAPS" )
	lobbyMenu.lobbyPane.addPanelElements = lobbyMenu.addLobbyPaneElements
	lobbyMenu.lobbyPane:addPanelElements( lobbyListHeaderText, Engine.DvarInt( controller, "party_maxlocalplayers" ), enableSearchingRows, showMissingDLC )
	lobbyMenu.lobbyPane.populatePanelElements = lobbyMenu.populateLobbyPaneElements
	lobbyMenu.lobbyPane.setFocusPanelElements = lobbyMenu.setFocusLobbyPaneElements
	lobbyMenu.lobbyPane.saveState = lobbyMenu.saveStateLobbyPaneElements
	lobbyMenu.lobbyPane.setSplitscreenSignInAllowed = CoD.Lobby.SetSplitscreenSignInAllowed
	lobbyMenu.overviewPane = lobbyMenu.panelManager:createPanel( "overviewPane", "right" )
	lobbyMenu.overviewPane.addPanelElements = lobbyMenu.addOverviewPaneElements
	lobbyMenu.overviewPane.populatePanelElements = lobbyMenu.populateOverviewPaneElements
	lobbyMenu.overviewPane.setFocusPanelElements = lobbyMenu.setFocusOverviewPaneElements
	lobbyMenu.overviewPane:registerEventHandler( "player_selected", CoD.Lobby.OverviewPane_PlayerSelected )
	if CoD.isZombie == true then
		lobbyMenu.overviewPane.titleText = Engine.Localize( "MENU_STAT_SUMMARY_CAPS" )
	end
	if not CoD.isSinglePlayer == true and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() then
		lobbyMenu.statsPane = lobbyMenu.panelManager:createPanel( "statsPane", "right" )
		lobbyMenu.statsPane.addPanelElements = lobbyMenu.addStatsPaneElements
		lobbyMenu.statsPane.populatePanelElements = lobbyMenu.populateStatsPaneElements
		lobbyMenu.statsPane.setFocusPanelElements = lobbyMenu.setFocusStatsPaneElements
		lobbyMenu.statsPane:registerEventHandler( "player_selected", CoD.Lobby.StatsPane_PlayerSelected )
		if CoD.isZombie == true then
			lobbyMenu.statsPane.titleText = Engine.Localize( "MENU_STAT_SUMMARY_CAPS" )
			lobbyMenu.survivalStatsPane = lobbyMenu.panelManager:createPanel( "survivalStatsPane", "right" )
			lobbyMenu.survivalStatsPane.addPanelElements = lobbyMenu.addStatsPaneElements
			lobbyMenu.survivalStatsPane.populatePanelElements = lobbyMenu.populateSurvivalStatsPaneElements
			lobbyMenu.survivalStatsPane.setFocusPanelElements = lobbyMenu.setFocusStatsPaneElements
			lobbyMenu.survivalStatsPane.titleText = Engine.Localize( "MENU_STAT_SUMMARY_CAPS" )
			lobbyMenu.encountersStatsPane = lobbyMenu.panelManager:createPanel( "encountersStatsPane", "right" )
			lobbyMenu.encountersStatsPane.addPanelElements = lobbyMenu.addStatsPaneElements
			lobbyMenu.encountersStatsPane.populatePanelElements = lobbyMenu.populateEncountersStatsPaneElements
		end
	end
	CoD.Lobby.LobbyListRefresh( lobbyMenu.lobbyPane )
	lobbyMenu.buttonPane:animateToState( "left_onscreen", CoD.PanelManager.fadeInTime, true, true )
	lobbyMenu.lobbyPane:animateToState( "right_onscreen", CoD.PanelManager.fadeInTime, true, true )
	Engine.Exec( controller, "party_updateActiveMenu" )
	if CoD.isMultiplayer or CoD.isZombie then
		Engine.Exec( controller, "loadcommonff" )
	end
	return lobbyMenu
end

CoD.Lobby.CurrentPanelChanged = function ( self, event )
	if event.titleText ~= nil and self.titleElement ~= nil then
		self:setTitle( event.titleText )
	end
	self:dispatchEventToChildren( event )
end

CoD.Lobby.OpenSignInPopup = function ( self, event )
	self:openPopup( "SignIn", event.controller )
end

CoD.Lobby.OpenSignOutPopup = function ( self, event )
	if CoD.isPS3 or CoD.isWIIU then
		if Engine.IsGuest( event.controller ) and not CoD.isZombie then
			local signOutMenu = self:openPopup( "SignOut", event.controller )
			signOutMenu:addButtons()
			signOutMenu:addTitle( Engine.Localize( "XBOXLIVE_SIGNOUT_GUEST" ) )
			signOutMenu.titleElement:setTopBottom( true, false, 0, CoD.textSize.Default )
			signOutMenu.titleElement:setFont( CoD.fonts.Default )
			signOutMenu:setWarning( Engine.Localize( "MENU_GUEST_SIGNOUT_WARNING" ) )
			return true
		elseif Engine.IsSubUser( event.controller ) then
			local signOutMenu = self:openPopup( "SignOut", event.controller )
			signOutMenu:addButtons()
			signOutMenu:addTitle( Engine.Localize( "XBOXLIVE_SIGNOUT" ) )
			signOutMenu.titleElement:setTopBottom( true, false, 0, CoD.textSize.Default )
			signOutMenu.titleElement:setFont( CoD.fonts.Default )
			signOutMenu:setWarning( Engine.Localize( "MENU_SUBUSER_SIGNOUT_WARNING" ) )
			return true
		end
	end
	return false
end

CoD.Lobby.OpenAfterActionReportIfNeeded = function ( menu, controller )
	if menu.menuName == "PublicGameLobby" or menu.menuName == "LeaguePlayPartyLobby" then
		local f19_local0 = CoD.GetPlayerStats( controller )
		local afterActionReportStats = f19_local0.AfterActionReportStats
		local lobbyPopup = afterActionReportStats.lobbyPopup
		local lobbyPopupValue = afterActionReportStats.lobbyPopup:get()
		local valid = afterActionReportStats.valid:get()
		local stableStatsBufferInitialized = Engine.IsStableStatsBufferInitialized( controller )
		local f19_local1 = lobbyPopupValue == "promotion"
		local f19_local2 = lobbyPopupValue == "summary"
		local f19_local3 = lobbyPopupValue == "leaguesummary"
		if (f19_local1 or f19_local2 or f19_local3) and valid and stableStatsBufferInitialized then
			if f19_local3 then
				lobbyPopup:set( "league" )
			else
				lobbyPopup:set( "public" )
			end
			CoD.Menu.disablePopupOpenCloseAnim = true
			CoD.AfterActionReport.OpenAfterActionReport( menu, controller, menu.menuName == "LeaguePlayPartyLobby" )
			CoD.Menu.disablePopupOpenCloseAnim = false
		end
	end
end

CoD.Lobby.OpenMenu = function ( self, event )
	if self.menuName == event.menuName then
		return 
	elseif CoD.isZombie == true and event.menuName == "MainMenu" and self.previousMenuName == "MainMenu" and self.menuName == "PrivateLocalGameLobby" then
		CoD.PrivateGameLobby.LeaveLobby_Project( self, event )
		return 
	end
	local menu = self:openMenu( event.menuName, event.controller )
	self:close()
	local f20_local0 = menu:getParent()
	f20_local0:processEvent( {
		name = "menu_changed",
		prevMenu = self,
		nextMenu = menu,
		controller = event.controller
	} )
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot" )
	if lobbyRootModel ~= nil then
		local errorPendingModel = Engine.GetModel( lobbyRootModel, "lobbyErrorPending" )
		if errorPendingModel ~= nil and Engine.GetModelValue( errorPendingModel ) == 1 then
			menu:openPopup( "LobbyErrorPopup", event.controller )
		end
	end
	if CoD.isZombie == true then
		local zmOutroMovie = Engine.DvarString( self.controller, "ui_zm_outromovie" )
		Engine.SetDvar( "ui_zm_outromovie", "" )
		if zmOutroMovie ~= "" then
			CoD.FileAction.CinematicId = Engine.StartLoadingCinematic( zmOutroMovie, true )
			menu:openPopup( "Cinematic_Player", event.controller )
		end
	end
	if self.menuName == "MainMenu" and CoD.isOnlineGame() then
		menu:setPreviousMenu( "MainLobby" )
	end
	if CoD.isZombie == true and event.menuName == "MainLobby" and CoD.Zombie.OpenMenuSelfMenuNames[self.menuName] == 1 then
		CoD.GameGlobeZombie.MoveToCornerJoinLobby()
	end
end

CoD.Lobby.GoBack = function ( self, event )
	if self.buttonPane.body ~= nil then
		self.buttonPane.body.buttonList:saveState()
	end
	self.buttonPane:animateToState( "left_offscreen", self.fadeOutTime, true, true )
	self.lobbyPane:animateToState( "right_offscreen", self.fadeOutTime, true, true )
	CoD.Menu.goBack( self, event.controller )
end

CoD.Lobby.LobbyListUpdateMembers = function ( self )
	CoD.Lobby.LobbyListUpdate( self.lobbyPane, Engine.GetPlayersInLobby() )
end

CoD.Lobby.LobbyListUpdate = function ( self, members )
	if self.body ~= nil and self.body.lobbyList ~= nil then
		CoD.LobbyPlayerLists.Update( self.body.lobbyList, members )
	end
end

CoD.Lobby.LobbyListRefresh = function ( self )
	if self.body ~= nil and self.body.lobbyList ~= nil then
		CoD.LobbyPlayerLists.Refresh( self.body.lobbyList, true )
	end
end

CoD.Lobby.SignInFailedProbation = function ( self, event )
	local popup = self:openPopup( event.popup, event.controller )
	popup.anyControllerAllowed = true
end

CoD.Lobby.CreateInfoPane = function ()
	local infoPane = LUI.UIContainer.new()
	infoPane.backgroundContainer = LUI.UIElement.new( {
		left = 0,
		top = -CoD.CoD9Button.Height,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	infoPane:addElement( infoPane.backgroundContainer )
	infoPane.background = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.05
	} )
	infoPane.backgroundContainer:addElement( infoPane.background )
	infoPane.backgroundShadow = CoD.EdgeShadow.new( "left", false )
	infoPane.backgroundContainer:addElement( infoPane.backgroundShadow )
	infoPane.titleElement = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.textSize.Morris,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Morris
	} )
	infoPane:addElement( infoPane.titleElement )
	local iconSize = 200
	infoPane.icon = LUI.UIImage.new( {
		left = -iconSize / 2,
		top = CoD.textSize.Condensed * 2,
		right = iconSize / 2,
		bottom = CoD.textSize.Condensed * 2 + iconSize,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		alpha = 0
	} )
	infoPane:addElement( infoPane.icon )
	infoPane.description = LUI.UIText.new( {
		left = 10,
		top = CoD.textSize.Condensed * 3 + iconSize,
		right = -10,
		bottom = CoD.textSize.Condensed * 3 + iconSize + CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		alignment = LUI.Alignment.Center,
		font = CoD.fonts.Condensed
	} )
	infoPane:addElement( infoPane.description )
	return infoPane
end

CoD.Lobby.AddLivestreamButton = function ( self, priority, isHost )
	if Engine.DvarBool( nil, "webm_encUiEnabled" ) then
		self.body.liveStreamingButton = self.body.buttonList:addButton( Engine.Localize( "MENU_LIVESTREAMING_CAPS" ), Engine.Localize( "MENU_LIVESTREAMING_DESC" ), priority )
		if Engine.IsPlayerUnderage( controller ) then
			self.body.liveStreamingButton:disable()
			self.body.liveStreamingButton.hintText = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
		else
			self.body.liveStreamingButton:setActionEventName( "toggle_livestream" )
		end
		self.body.liveStreamingButton.isHost = isHost
	end
end

CoD.Lobby.EliteRegisterationSuccess = function ( self, event )
	CoD.Lobby.ToggleLivestream( self, event )
end

CoD.Lobby.OpenLiveStreamTOS = function ( self, event )
	self:openPopup( "LiveStreamTOS", controller )
end

CoD.Lobby.ToggleLivestream = function ( self, event )
	local controller = event.controller
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_STREAMING ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_STREAMING )
		return 
	elseif Engine.DvarBool( nil, "webm_encEliteRequired" ) and not Engine.IsPlayerEliteRegistered( event.controller ) then
		CoD.perController[event.controller].openedEliteFromLiveStream = true
		self:openPopup( "EliteRegistrationPopup", controller )
		CoD.perController[event.controller].openedEliteFromLiveStream = nil
	elseif not Engine.IsLivestreamEnabled() then
		if CoD.LiveStream.TwitchEnabled() then
			self:openPopup( "LiveStream_ChooseMode", controller )
		else
			Dvar.webm_httpAuthMode:set( "youtube" )
			if not Engine.IsYouTubeAccountChecked( controller ) or not Engine.IsYouTubeAccountRegistered( controller ) then
				self:openPopup( "YouTube_Connect", controller )
			else
				self:openPopup( "LiveStreamTOS", controller )
			end
		end
	else
		self:openPopup( "LiveStream", controller, {
			isHost = self.buttonPane.body.liveStreamingButton.isHost
		} )
	end
end

CoD.Lobby.UpdateLivestreamCamera = function ( self, event )
	self:dispatchEventToChildren( event )
end

CoD.Lobby.ButtonPromptFriendsMenu = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	elseif not CoD.isPS3 or not Engine.IsSubUser( event.controller ) then
		self:openPopup( "FriendsList", event.controller )
	else
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "MENU_SUBUSERS_NOTALLOWED" ) )
		errorPopup.anyControllerAllowed = true
	end
end

CoD.Lobby.ButtonPromptPartyPrivacy = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	else
		self:openPopup( "PartyPrivacy", event.controller )
	end
end

CoD.Lobby.ConfirmLeave = function ( lobby, controller, leaveEvent, leaveHandler, leaveHandlerTextTable )
	if leaveHandlerTextTable ~= nil then
		local confirmLeavePopup = lobby:openPopup( "ConfirmLeave", controller, leaveHandlerTextTable )
		for index, data in pairs( leaveHandlerTextTable.params ) do
			lobby:registerEventHandler( data.leaveEvent, data.leaveHandler )
		end
	else
		local confirmLeavePopup = lobby:openPopup( "ConfirmLeave", controller )
		confirmLeavePopup:setConfirmEvent( leaveEvent )
		lobby:registerEventHandler( leaveEvent, leaveHandler )
	end
end

CoD.Lobby.ConfirmLeaveGameLobby = function ( self, event )
	local leaveHandlerTextTable = {
		params = {}
	}
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true or Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
		leaveHandlerTextTable.titleText = Engine.Localize( "MENU_LEAVE_LOBBY_TITLE" )
		table.insert( leaveHandlerTextTable.params, {
			leaveHandler = event.leaveLobbyHandler,
			leaveEvent = "confirm_leave",
			leaveText = Engine.Localize( "MPUI_YES" ),
			debugHelper = "You're not in local game"
		} )
		CoD.Lobby.ConfirmLeave( self, event.controller, "confirm_leave", event.leaveLobbyHandler, leaveHandlerTextTable )
		return 
	elseif Engine.AloneInPrivatePartyIgnoreSplitscreen( true ) and Engine.InPrivateParty() then
		leaveHandlerTextTable.titleText = Engine.Localize( "MENU_LEAVE_LOBBY_TITLE" )
		table.insert( leaveHandlerTextTable.params, {
			leaveHandler = event.leaveLobbyHandler,
			leaveEvent = "confirm_leave",
			leaveText = Engine.Localize( "MPUI_YES" ),
			debugHelper = "You're not in a private party"
		} )
		CoD.Lobby.ConfirmLeave( self, event.controller, "confirm_leave", event.leaveLobbyHandler, leaveHandlerTextTable )
		return 
	elseif Engine.InPrivateParty() then
		if Engine.PrivatePartyHost() then
			leaveHandlerTextTable.titleText = Engine.Localize( "MENU_LEAVE_LOBBY_TITLE" )
			leaveHandlerTextTable.messageText = Engine.Localize( "MENU_LEAVE_LOBBY_HOST_WARNING" )
			table.insert( leaveHandlerTextTable.params, {
				leaveHandler = event.leaveLobbyHandler,
				leaveEvent = "confirm_leave_alone",
				leaveText = Engine.Localize( "MPUI_LEAVE_WITHOUT_PARTY" ),
				debugHelper = "You're the leader of a private party, choosing this will disband your party"
			} )
			table.insert( leaveHandlerTextTable.params, {
				leaveHandler = event.leaveLobbyHandler,
				leaveEvent = "confirm_leave_with",
				leaveText = Engine.Localize( "MENU_BRING_PARTY" ),
				debugHelper = "You're the leader of a private party, choosing this bring your party along"
			} )
		else
			leaveHandlerTextTable.titleText = Engine.Localize( "MENU_LEAVE_LOBBY_TITLE" )
			if Engine.PrivatePartyHostInLobby() then
				leaveHandlerTextTable.messageText = Engine.Localize( "MENU_LEAVE_LOBBY_CLIENT_WARNING" )
				table.insert( leaveHandlerTextTable.params, {
					leaveHandler = event.leaveLobbyHandler,
					leaveEvent = "confirm_leave",
					leaveText = Engine.Localize( "MENU_LEAVE_LOBBY_AND_PARTY" ),
					debugHelper = "You're a client of a private party, remove you from the party"
				} )
			else
				table.insert( leaveHandlerTextTable.params, {
					leaveHandler = event.leaveLobbyHandler,
					leaveEvent = "confirm_leave",
					leaveText = Engine.Localize( "MPUI_YES" ),
					debugHelper = "You're not in a private party"
				} )
			end
		end
	else
		leaveHandlerTextTable.titleText = Engine.Localize( "MENU_LEAVE_LOBBY_TITLE" )
		table.insert( leaveHandlerTextTable.params, {
			leaveHandler = event.leaveLobbyHandler,
			leaveEvent = "confirm_leave",
			leaveText = Engine.Localize( "MPUI_YES" ),
			debugHelper = "You're not in a private party"
		} )
	end
	CoD.Lobby.ConfirmLeave( self, event.controller, "confirm_leave", event.leaveLobbyHandler, leaveHandlerTextTable )
end

CoD.Lobby.PlayerListRowSelected = function ( self, event )
	self:processEvent( {
		name = "player_selected",
		playerName = event.playerName,
		playerXuid = event.playerXuid,
		leagueTeamID = event.leagueTeamID,
		leagueTeamMemberCount = event.leagueTeamMemberCount,
		controller = event.controller,
		joinable = event.joinable
	} )
end

CoD.Lobby.PlayerListRowDeselected = function ( self, event )
	self:processEvent( {
		name = "player_deselected",
		playerName = event.playerName,
		playerXuid = event.playerXuid,
		controller = event.controller
	} )
end

CoD.Lobby.UpdatePanelFunctions = function ( self )
	if self.buttonPane ~= nil then
		self.buttonPane.addPanelElements = self.addButtonPaneElements
		self.buttonPane.populatePanelElements = self.populateButtonPaneElements
	end
	if self.lobbyPane ~= nil then
		self.lobbyPane.addPanelElements = self.addLobbyPaneElements
		self.lobbyPane.populatePanelElements = self.populateLobbyPaneElements
	end
	if self.overviewPane ~= nil then
		self.overviewPane.addPanelElements = self.addOverviewPaneElements
		self.overviewPane.populatePanelElements = self.populateOverviewPaneElements
	end
	if self.statsPane ~= nil then
		self.statsPane.addPanelElements = self.addStatsPaneElements
		self.statsPane.populatePanelElements = self.populateStatsPaneElements
	end
	if self.survivalStatsPane ~= nil then
		self.survivalStatsPane.addPanelElements = self.addStatsPaneElements
		self.survivalStatsPane.populatePanelElements = self.populateSurvivalStatsPaneElements
	end
	if self.encountersStatsPane ~= nil then
		self.encountersStatsPane.addPanelElements = self.addStatsPaneElements
		self.encountersStatsPane.populatePanelElements = self.populateEncountersStatsPaneElements
	end
end

