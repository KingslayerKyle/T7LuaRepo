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
local f0_local0 = {
	name = "show_globe"
}
CoD.Lobby.OverviewPane_PlayerSelected = function ( f1_arg0, f1_arg1 )
	if CoD.isZombie == true then
		if f1_arg1.controller ~= nil then
			if Engine.GetXUID( f1_arg1.controller ) == f1_arg1.playerXuid then
				f1_arg0.panelManager.slideToStatsPaneEnabled = true
			else
				f1_arg0.panelManager.slideToStatsPaneEnabled = false
			end
		end
	else
		f1_arg0.selectedPlayerShowTruePlayerInfo = Engine.PartyShowTruePlayerInfoByXuid( f1_arg1.playerXuid )
		if f1_arg0.selectedPlayerShowTruePlayerInfo ~= false then
			f1_arg0.panelManager.slideToStatsPaneEnabled = true
		else
			f1_arg0.panelManager.slideToStatsPaneEnabled = false
		end
	end
	f1_arg0.selectedPlayerXuid = f1_arg1.playerXuid
	f1_arg0.selectedPlayerName = f1_arg1.playerName
	f1_arg0.selectedLeagueTeamID = f1_arg1.leagueTeamID
	f1_arg0.leagueTeamMemberCount = f1_arg1.leagueTeamMemberCount
	if f1_arg0.body ~= nil then
		f1_arg0:populatePanelElements()
	end
	f1_arg0:dispatchEventToChildren( f1_arg1 )
end

CoD.Lobby.StatsPane_PlayerSelected = function ( f2_arg0, f2_arg1 )
	f2_arg0.selectedPlayerXuid = f2_arg1.playerXuid
	f2_arg0.selectedLeagueTeamID = f2_arg1.leagueTeamID
	f2_arg0.leagueTeamMemberCount = f2_arg1.leagueTeamMemberCount
	f2_arg0:dispatchEventToChildren( f2_arg1 )
end

CoD.Lobby.ButtonListButtonGainFocus = function ( f3_arg0, f3_arg1 )
	f3_arg0.buttonList.pane.selectedButtonName = f3_arg0.name
	return CoD.CoD9Button.GainFocus( f3_arg0, f3_arg1 )
end

CoD.Lobby.ButtonListAddButton = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	local f4_local0 = CoD.ButtonList.AddButton( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	f4_local0.buttonList = f4_arg0
	f4_local0.name = f4_arg1
	f4_local0:registerEventHandler( "gain_focus", CoD.Lobby.ButtonListButtonGainFocus )
	return f4_local0
end

CoD.Lobby.ButtonListGainFocus = function ( f5_arg0, f5_arg1 )
	if f5_arg0.pane.selectedButtonName ~= nil then
		local f5_local0 = nil
		local f5_local1 = f5_arg0:getFirstChild()
		while f5_local1 ~= nil do
			if f5_local1.m_focusable and f5_local1.name == f5_arg0.pane.selectedButtonName then
				f5_local0 = f5_local1
				break
			end
			f5_local1 = f5_local1:getNextSibling()
		end
		if f5_local0 ~= nil then
			f5_local0:processEvent( {
				name = "gain_focus"
			} )
			return 
		end
	end
	return LUI.UIVerticalList.gainFocus( f5_arg0 )
end

CoD.Lobby.ButtonListLoseFocus = function ( f6_arg0, f6_arg1 )
	f6_arg0:dispatchEventToParent( {
		name = "remove_party_privacy_button"
	} )
end

CoD.Lobby.RemovePartyPrivacyButton = function ( f7_arg0, f7_arg1 )
	if f7_arg0.partyPrivacyButton ~= nil then
		f7_arg0.partyPrivacyButton:close()
		f7_arg0.partyPrivacyButton = nil
	end
end

CoD.Lobby.AddPartyPrivacyButton = function ( f8_arg0, f8_arg1 )
	if f8_arg0.partyPrivacyButton == nil then
		f8_arg0:addPartyPrivacyButton()
	end
	f8_arg0:updatePartyPrivacyButton()
	f8_arg0:addNATType()
end

CoD.Lobby.AddSelectButton = function ( f9_arg0, f9_arg1 )
	f9_arg0:addSelectButtonWithPrestigeUnlock()
end

CoD.Lobby.RemoveSelectButton = function ( f10_arg0, f10_arg1 )
	f10_arg0:removeSelectButton()
end

CoD.Lobby.saveStateLobbyPaneElements = function ( f11_arg0 )
	if f11_arg0.body.lobbyList ~= nil then
		CoD.LobbyPlayerLists.SaveState( f11_arg0.body.lobbyList, f11_arg0.id )
	end
end

CoD.Lobby.PlayerSelected = function ( f12_arg0, f12_arg1 )
	if Engine.IsGuest( f12_arg1.controller ) then
		f12_arg0:openPopup( "popup_guest_contentrestricted", f12_arg1.controller )
		return 
	end
	CoD.FriendPopup.SelectedPlayerXuid = f12_arg1.button.playerXuid
	CoD.FriendPopup.SelectedPlayerName = f12_arg1.button.gamerTag
	CoD.FriendsListPopup.Mode = CoD.playerListType.friend
	if Engine.PartyShowTruePlayerInfoByXuid( f12_arg1.button.playerXuid ) == true then
		f12_arg0:openPopup( "FriendPopup", f12_arg1.controller )
	end
end

CoD.Lobby.SetSplitscreenSignInAllowed = function ( f13_arg0, f13_arg1 )
	f13_arg0.splitscreenSignInAllowed = f13_arg1
	if f13_arg0.body.lobbyList then
		f13_arg0.body.lobbyList:setSplitscreenSignInAllowed( f13_arg1 )
	end
end

CoD.Lobby.OpenWiiUControllerSelectorPopup = function ( f14_arg0, f14_arg1 )
	if not f14_arg0.m_inputDisabled then
		local f14_local0 = f14_arg0:openPopup( f14_arg1.popupName, f14_arg1.controller )
		local f14_local1 = f14_arg0.lobbyPane.body.lobbyList.playerLists
		f14_arg1.newPlayerOption = false
		for f14_local5, f14_local6 in pairs( f14_local1 ) do
			if f14_local6.splitscreenSignInRow ~= nil then
				f14_arg1.signInAllowed = true
			end
		end
		f14_local0:init( f14_arg1 )
		return true
	else
		
	end
end

CoD.Lobby.New = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5 )
	local f15_local0 = CoD.Menu.New( f15_arg0 )
	f15_local0.addButtonPaneElements = CoD.LobbyPanes.addButtonPaneElements
	f15_local0.addLobbyPaneElements = CoD.LobbyPanes.addLobbyPaneElements
	f15_local0.addOverviewPaneElements = CoD.LobbyPanes.addOverviewPaneElements
	f15_local0.addStatsPaneElements = CoD.LobbyPanes.addStatsPaneElements
	f15_local0.setFocusButtonPaneElements = CoD.LobbyPanes.ButtonPaneSetFocus
	f15_local0.setFocusLobbyPaneElements = CoD.LobbyPanes.LobbyPaneSetFocus
	f15_local0.setFocusOverviewPaneElements = CoD.LobbyPanes.OverviewPaneSetFocus
	f15_local0.populateButtonPaneElements = CoD.LobbyPanes.populateButtonPaneElements
	f15_local0.populateLobbyPaneElements = CoD.LobbyPanes.populateLobbyPaneElements
	f15_local0.populateOverviewPaneElements = CoD.LobbyPanes.populateOverviewPaneElements
	f15_local0.populateStatsPaneElements = CoD.LobbyPanes.populateStatsPaneElements
	f15_local0.saveStateLobbyPaneElements = CoD.Lobby.saveStateLobbyPaneElements
	f15_local0.updatePanelFunctions = CoD.Lobby.UpdatePanelFunctions
	f15_local0.goBack = CoD.Lobby.GoBack
	if CoD.isZombie == true then
		f15_local0.setFocusStatsPaneElements = CoD.LobbyPanes.StatsPaneSetFocus
		f15_local0.populateSurvivalStatsPaneElements = CoD.LobbyPanes.populateSurvivalStatsPaneElements
		f15_local0.populateEncountersStatsPaneElements = CoD.LobbyPanes.populateEncountersStatsPaneElements
	else
		f15_local0:registerEventHandler( "elite_registration_email_popup_requested", CoD.EliteRegistrationEmailPopup.EliteRegistrationEmailPopupRequested )
		f15_local0:registerEventHandler( "AutoFillPopup_Closed", CoD.EliteRegistrationEmailPopup.AutoFillPopup_Closed )
		f15_local0:registerEventHandler( "elite_registration_ended", CoD.Lobby.EliteRegisterationSuccess )
	end
	f15_local0:registerEventHandler( "add_party_privacy_button", CoD.Lobby.AddPartyPrivacyButton )
	f15_local0:registerEventHandler( "button_prompt_friends", CoD.Lobby.ButtonPromptFriendsMenu )
	f15_local0:registerEventHandler( "button_prompt_partyprivacy", CoD.Lobby.ButtonPromptPartyPrivacy )
	f15_local0:registerEventHandler( "current_panel_changed", CoD.Lobby.CurrentPanelChanged )
	f15_local0:registerEventHandler( "open_menu", CoD.Lobby.OpenMenu )
	f15_local0:registerEventHandler( "open_sign_in", CoD.Lobby.OpenSignInPopup )
	f15_local0:registerEventHandler( "playerlist_row_selected", CoD.Lobby.PlayerListRowSelected )
	f15_local0:registerEventHandler( "playerlist_row_deselected", CoD.Lobby.PlayerListRowDeselected )
	f15_local0:registerEventHandler( "remove_party_privacy_button", CoD.Lobby.RemovePartyPrivacyButton )
	f15_local0:registerEventHandler( "open_playeroptions_popup", CoD.Lobby.PlayerSelected )
	f15_local0:registerEventHandler( "open_controller_selector_popup", CoD.Lobby.OpenWiiUControllerSelectorPopup )
	f15_local0:registerEventHandler( "toggle_livestream", CoD.Lobby.ToggleLivestream )
	f15_local0:registerEventHandler( "youtube_connect_complete", CoD.Lobby.OpenLiveStreamTOS )
	f15_local0:registerEventHandler( "twitch_connect_complete", CoD.Lobby.OpenLiveStreamTOS )
	f15_local0:registerEventHandler( "update_livestream_camera", CoD.Lobby.UpdateLivestreamCamera )
	f15_local0:registerEventHandler( "friends_updated", CoD.Lobby.LobbyListUpdateMembers )
	f15_local0:registerEventHandler( "sign_in_failed_probation", CoD.Lobby.SignInFailedProbation )
	f15_local0:registerEventHandler( "add_select_button", CoD.Lobby.AddSelectButton )
	f15_local0:registerEventHandler( "remove_select_button", CoD.Lobby.RemoveSelectButton )
	f15_local0.panelManager = CoD.PanelManager.New( Engine.GetPrimaryController(), f15_local0.width, f15_local0.height )
	f15_local0:addElement( f15_local0.panelManager )
	f15_local0:addSelectButton()
	f15_local0:addBackButton()
	f15_local0:addFriendsButton()
	f15_local0:addPartyPrivacyButton()
	f15_local0:addNATType()
	f15_local0.buttonPane = f15_local0.panelManager:createPanel( "buttonPane", "left" )
	f15_local0.buttonPane:close()
	f15_local0.buttonPane:setPriority( 10 )
	f15_local0.panelManager:addElement( f15_local0.buttonPane )
	f15_local0.buttonPane.titleText = f15_arg3
	f15_local0.buttonPane.addPanelElements = f15_local0.addButtonPaneElements
	f15_local0.buttonPane:addPanelElements()
	f15_local0.buttonPane.populatePanelElements = f15_local0.populateButtonPaneElements
	f15_local0.buttonPane.setFocusPanelElements = f15_local0.setFocusButtonPaneElements
	f15_local0.panelManager.currentPanelIndex = 1
	f15_local0.lobbyPane = f15_local0.panelManager:createPanel( "lobbyPane", "right" )
	f15_local0.lobbyPane.titleText = Engine.Localize( "MENU_LOBBY_LIST_CAPS" )
	f15_local0.lobbyPane.addPanelElements = f15_local0.addLobbyPaneElements
	f15_local0.lobbyPane:addPanelElements( f15_arg4, Engine.DvarInt( f15_arg1, "party_maxlocalplayers" ), f15_arg2, f15_arg5 )
	f15_local0.lobbyPane.populatePanelElements = f15_local0.populateLobbyPaneElements
	f15_local0.lobbyPane.setFocusPanelElements = f15_local0.setFocusLobbyPaneElements
	f15_local0.lobbyPane.saveState = f15_local0.saveStateLobbyPaneElements
	f15_local0.lobbyPane.setSplitscreenSignInAllowed = CoD.Lobby.SetSplitscreenSignInAllowed
	f15_local0.overviewPane = f15_local0.panelManager:createPanel( "overviewPane", "right" )
	f15_local0.overviewPane.addPanelElements = f15_local0.addOverviewPaneElements
	f15_local0.overviewPane.populatePanelElements = f15_local0.populateOverviewPaneElements
	f15_local0.overviewPane.setFocusPanelElements = f15_local0.setFocusOverviewPaneElements
	f15_local0.overviewPane:registerEventHandler( "player_selected", CoD.Lobby.OverviewPane_PlayerSelected )
	if CoD.isZombie == true then
		f15_local0.overviewPane.titleText = Engine.Localize( "MENU_STAT_SUMMARY_CAPS" )
	end
	if not CoD.isSinglePlayer == true and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() then
		f15_local0.statsPane = f15_local0.panelManager:createPanel( "statsPane", "right" )
		f15_local0.statsPane.addPanelElements = f15_local0.addStatsPaneElements
		f15_local0.statsPane.populatePanelElements = f15_local0.populateStatsPaneElements
		f15_local0.statsPane.setFocusPanelElements = f15_local0.setFocusStatsPaneElements
		f15_local0.statsPane:registerEventHandler( "player_selected", CoD.Lobby.StatsPane_PlayerSelected )
		if CoD.isZombie == true then
			f15_local0.statsPane.titleText = Engine.Localize( "MENU_STAT_SUMMARY_CAPS" )
			f15_local0.survivalStatsPane = f15_local0.panelManager:createPanel( "survivalStatsPane", "right" )
			f15_local0.survivalStatsPane.addPanelElements = f15_local0.addStatsPaneElements
			f15_local0.survivalStatsPane.populatePanelElements = f15_local0.populateSurvivalStatsPaneElements
			f15_local0.survivalStatsPane.setFocusPanelElements = f15_local0.setFocusStatsPaneElements
			f15_local0.survivalStatsPane.titleText = Engine.Localize( "MENU_STAT_SUMMARY_CAPS" )
			f15_local0.encountersStatsPane = f15_local0.panelManager:createPanel( "encountersStatsPane", "right" )
			f15_local0.encountersStatsPane.addPanelElements = f15_local0.addStatsPaneElements
			f15_local0.encountersStatsPane.populatePanelElements = f15_local0.populateEncountersStatsPaneElements
		end
	end
	CoD.Lobby.LobbyListRefresh( f15_local0.lobbyPane )
	f15_local0.buttonPane:animateToState( "left_onscreen", CoD.PanelManager.fadeInTime, true, true )
	f15_local0.lobbyPane:animateToState( "right_onscreen", CoD.PanelManager.fadeInTime, true, true )
	Engine.Exec( f15_arg1, "party_updateActiveMenu" )
	if CoD.isMultiplayer or CoD.isZombie then
		Engine.Exec( f15_arg1, "loadcommonff" )
	end
	return f15_local0
end

CoD.Lobby.CurrentPanelChanged = function ( f16_arg0, f16_arg1 )
	if f16_arg1.titleText ~= nil and f16_arg0.titleElement ~= nil then
		f16_arg0:setTitle( f16_arg1.titleText )
	end
	f16_arg0:dispatchEventToChildren( f16_arg1 )
end

CoD.Lobby.OpenSignInPopup = function ( f17_arg0, f17_arg1 )
	f17_arg0:openPopup( "SignIn", f17_arg1.controller )
end

CoD.Lobby.OpenSignOutPopup = function ( f18_arg0, f18_arg1 )
	if CoD.isPS3 or CoD.isWIIU then
		if Engine.IsGuest( f18_arg1.controller ) and not CoD.isZombie then
			local f18_local0 = f18_arg0:openPopup( "SignOut", f18_arg1.controller )
			f18_local0:addButtons()
			f18_local0:addTitle( Engine.Localize( "XBOXLIVE_SIGNOUT_GUEST" ) )
			f18_local0.titleElement:setTopBottom( true, false, 0, CoD.textSize.Default )
			f18_local0.titleElement:setFont( CoD.fonts.Default )
			f18_local0:setWarning( Engine.Localize( "MENU_GUEST_SIGNOUT_WARNING" ) )
			return true
		elseif Engine.IsSubUser( f18_arg1.controller ) then
			local f18_local0 = f18_arg0:openPopup( "SignOut", f18_arg1.controller )
			f18_local0:addButtons()
			f18_local0:addTitle( Engine.Localize( "XBOXLIVE_SIGNOUT" ) )
			f18_local0.titleElement:setTopBottom( true, false, 0, CoD.textSize.Default )
			f18_local0.titleElement:setFont( CoD.fonts.Default )
			f18_local0:setWarning( Engine.Localize( "MENU_SUBUSER_SIGNOUT_WARNING" ) )
			return true
		end
	end
	return false
end

CoD.Lobby.OpenAfterActionReportIfNeeded = function ( f19_arg0, f19_arg1 )
	if f19_arg0.menuName == "PublicGameLobby" or f19_arg0.menuName == "LeaguePlayPartyLobby" then
		local f19_local0 = CoD.GetPlayerStats( f19_arg1 )
		f19_local0 = f19_local0.AfterActionReportStats
		local f19_local1 = f19_local0.lobbyPopup
		local f19_local2 = f19_local0.lobbyPopup:get()
		local f19_local3 = f19_local0.valid:get()
		local f19_local4 = Engine.IsStableStatsBufferInitialized( f19_arg1 )
		local f19_local5 = f19_local2 == "promotion"
		local f19_local6 = f19_local2 == "summary"
		local f19_local7 = f19_local2 == "leaguesummary"
		if (f19_local5 or f19_local6 or f19_local7) and f19_local3 and f19_local4 then
			if f19_local7 then
				f19_local1:set( "league" )
			else
				f19_local1:set( "public" )
			end
			CoD.Menu.disablePopupOpenCloseAnim = true
			CoD.AfterActionReport.OpenAfterActionReport( f19_arg0, f19_arg1, f19_arg0.menuName == "LeaguePlayPartyLobby" )
			CoD.Menu.disablePopupOpenCloseAnim = false
		end
	end
end

CoD.Lobby.OpenMenu = function ( f20_arg0, f20_arg1 )
	if f20_arg0.menuName == f20_arg1.menuName then
		return 
	elseif CoD.isZombie == true and f20_arg1.menuName == "MainMenu" and f20_arg0.previousMenuName == "MainMenu" and f20_arg0.menuName == "PrivateLocalGameLobby" then
		CoD.PrivateGameLobby.LeaveLobby_Project( f20_arg0, f20_arg1 )
		return 
	end
	local f20_local0 = f20_arg0:openMenu( f20_arg1.menuName, f20_arg1.controller )
	f20_arg0:close()
	local f20_local1 = f20_local0:getParent()
	f20_local1:processEvent( {
		name = "menu_changed",
		prevMenu = f20_arg0,
		nextMenu = f20_local0,
		controller = f20_arg1.controller
	} )
	f20_local1 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if f20_local1 ~= nil then
		local f20_local2 = Engine.GetModel( f20_local1, "messagePending" )
		if f20_local2 ~= nil and Engine.GetModelValue( f20_local2 ) > 0 then
			CoD.OverlayUtility.CreateOverlay( f20_arg1.controller, f20_local0, "MessageDialogBox", f20_arg1.controller )
		end
	end
	if CoD.isZombie == true then
		local f20_local2 = Engine.DvarString( f20_arg0.controller, "ui_zm_outromovie" )
		Engine.SetDvar( "ui_zm_outromovie", "" )
		if f20_local2 ~= "" then
			CoD.FileAction.CinematicId = Engine.StartLoadingCinematic( f20_local2, true )
			f20_local0:openPopup( "Cinematic_Player", f20_arg1.controller )
		end
	end
	if f20_arg0.menuName == "MainMenu" and CoD.isOnlineGame() then
		f20_local0:setPreviousMenu( "MainLobby" )
	end
	if CoD.isZombie == true and f20_arg1.menuName == "MainLobby" and CoD.Zombie.OpenMenuSelfMenuNames[f20_arg0.menuName] == 1 then
		CoD.GameGlobeZombie.MoveToCornerJoinLobby()
	end
end

CoD.Lobby.GoBack = function ( f21_arg0, f21_arg1 )
	if f21_arg0.buttonPane.body ~= nil then
		f21_arg0.buttonPane.body.buttonList:saveState()
	end
	f21_arg0.buttonPane:animateToState( "left_offscreen", f21_arg0.fadeOutTime, true, true )
	f21_arg0.lobbyPane:animateToState( "right_offscreen", f21_arg0.fadeOutTime, true, true )
	CoD.Menu.goBack( f21_arg0, f21_arg1.controller )
end

CoD.Lobby.LobbyListUpdateMembers = function ( f22_arg0 )
	CoD.Lobby.LobbyListUpdate( f22_arg0.lobbyPane, Engine.GetPlayersInLobby() )
end

CoD.Lobby.LobbyListUpdate = function ( f23_arg0, f23_arg1 )
	if f23_arg0.body ~= nil and f23_arg0.body.lobbyList ~= nil then
		CoD.LobbyPlayerLists.Update( f23_arg0.body.lobbyList, f23_arg1 )
	end
end

CoD.Lobby.LobbyListRefresh = function ( f24_arg0 )
	if f24_arg0.body ~= nil and f24_arg0.body.lobbyList ~= nil then
		CoD.LobbyPlayerLists.Refresh( f24_arg0.body.lobbyList, true )
	end
end

CoD.Lobby.SignInFailedProbation = function ( f25_arg0, f25_arg1 )
	local f25_local0 = f25_arg0:openPopup( f25_arg1.popup, f25_arg1.controller )
	f25_local0.anyControllerAllowed = true
end

CoD.Lobby.CreateInfoPane = function ()
	local self = LUI.UIContainer.new()
	self.backgroundContainer = LUI.UIElement.new( {
		left = 0,
		top = -CoD.CoD9Button.Height,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( self.backgroundContainer )
	self.background = LUI.UIImage.new( {
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
	self.backgroundContainer:addElement( self.background )
	self.backgroundShadow = CoD.EdgeShadow.new( "left", false )
	self.backgroundContainer:addElement( self.backgroundShadow )
	self.titleElement = LUI.UIText.new( {
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
	self:addElement( self.titleElement )
	local f26_local1 = 200
	self.icon = LUI.UIImage.new( {
		left = -f26_local1 / 2,
		top = CoD.textSize.Condensed * 2,
		right = f26_local1 / 2,
		bottom = CoD.textSize.Condensed * 2 + f26_local1,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		alpha = 0
	} )
	self:addElement( self.icon )
	self.description = LUI.UIText.new( {
		left = 10,
		top = CoD.textSize.Condensed * 3 + f26_local1,
		right = -10,
		bottom = CoD.textSize.Condensed * 3 + f26_local1 + CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		alignment = LUI.Alignment.Center,
		font = CoD.fonts.Condensed
	} )
	self:addElement( self.description )
	return self
end

CoD.Lobby.AddLivestreamButton = function ( f27_arg0, f27_arg1, f27_arg2 )
	if Engine.DvarBool( nil, "webm_encUiEnabled" ) then
		f27_arg0.body.liveStreamingButton = f27_arg0.body.buttonList:addButton( Engine.Localize( "MENU_LIVESTREAMING_CAPS" ), Engine.Localize( "MENU_LIVESTREAMING_DESC" ), f27_arg1 )
		if Engine.IsPlayerUnderage( controller ) then
			f27_arg0.body.liveStreamingButton:disable()
			f27_arg0.body.liveStreamingButton.hintText = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
		else
			f27_arg0.body.liveStreamingButton:setActionEventName( "toggle_livestream" )
		end
		f27_arg0.body.liveStreamingButton.isHost = f27_arg2
	end
end

CoD.Lobby.EliteRegisterationSuccess = function ( f28_arg0, f28_arg1 )
	CoD.Lobby.ToggleLivestream( f28_arg0, f28_arg1 )
end

CoD.Lobby.OpenLiveStreamTOS = function ( f29_arg0, f29_arg1 )
	f29_arg0:openPopup( "LiveStreamTOS", controller )
end

CoD.Lobby.ToggleLivestream = function ( f30_arg0, f30_arg1 )
	local f30_local0 = f30_arg1.controller
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_LIVE_STREAMING ) then
		Engine.ExecNow( f30_arg1.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_STREAMING )
		return 
	elseif Engine.DvarBool( nil, "webm_encEliteRequired" ) and not Engine.IsPlayerEliteRegistered( f30_arg1.controller ) then
		CoD.perController[f30_arg1.controller].openedEliteFromLiveStream = true
		f30_arg0:openPopup( "EliteRegistrationPopup", f30_local0 )
		CoD.perController[f30_arg1.controller].openedEliteFromLiveStream = nil
	elseif not Engine.IsLivestreamEnabled() then
		if CoD.LiveStream.TwitchEnabled() then
			f30_arg0:openPopup( "LiveStream_ChooseMode", f30_local0 )
		else
			Dvar.webm_httpAuthMode:set( "youtube" )
			if not Engine.IsYouTubeAccountChecked( f30_local0 ) or not Engine.IsYouTubeAccountRegistered( f30_local0 ) then
				f30_arg0:openPopup( "YouTube_Connect", f30_local0 )
			else
				f30_arg0:openPopup( "LiveStreamTOS", f30_local0 )
			end
		end
	else
		f30_arg0:openPopup( "LiveStream", f30_local0, {
			isHost = f30_arg0.buttonPane.body.liveStreamingButton.isHost
		} )
	end
end

CoD.Lobby.UpdateLivestreamCamera = function ( f31_arg0, f31_arg1 )
	f31_arg0:dispatchEventToChildren( f31_arg1 )
end

CoD.Lobby.ButtonPromptFriendsMenu = function ( f32_arg0, f32_arg1 )
	if Engine.IsGuest( f32_arg1.controller ) then
		f32_arg0:openPopup( "popup_guest_contentrestricted", f32_arg1.controller )
		return 
	elseif not CoD.isPS3 or not Engine.IsSubUser( f32_arg1.controller ) then
		f32_arg0:openPopup( "FriendsList", f32_arg1.controller )
	else
		local f32_local0 = f32_arg0:openPopup( "Error", controller )
		f32_local0:setMessage( Engine.Localize( "MENU_SUBUSERS_NOTALLOWED" ) )
		f32_local0.anyControllerAllowed = true
	end
end

CoD.Lobby.ButtonPromptPartyPrivacy = function ( f33_arg0, f33_arg1 )
	if Engine.IsGuest( f33_arg1.controller ) then
		f33_arg0:openPopup( "popup_guest_contentrestricted", f33_arg1.controller )
		return 
	else
		f33_arg0:openPopup( "PartyPrivacy", f33_arg1.controller )
	end
end

CoD.Lobby.PlayerListRowSelected = function ( f34_arg0, f34_arg1 )
	f34_arg0:processEvent( {
		name = "player_selected",
		playerName = f34_arg1.playerName,
		playerXuid = f34_arg1.playerXuid,
		leagueTeamID = f34_arg1.leagueTeamID,
		leagueTeamMemberCount = f34_arg1.leagueTeamMemberCount,
		controller = f34_arg1.controller,
		joinable = f34_arg1.joinable
	} )
end

CoD.Lobby.PlayerListRowDeselected = function ( f35_arg0, f35_arg1 )
	f35_arg0:processEvent( {
		name = "player_deselected",
		playerName = f35_arg1.playerName,
		playerXuid = f35_arg1.playerXuid,
		controller = f35_arg1.controller
	} )
end

CoD.Lobby.UpdatePanelFunctions = function ( f36_arg0 )
	if f36_arg0.buttonPane ~= nil then
		f36_arg0.buttonPane.addPanelElements = f36_arg0.addButtonPaneElements
		f36_arg0.buttonPane.populatePanelElements = f36_arg0.populateButtonPaneElements
	end
	if f36_arg0.lobbyPane ~= nil then
		f36_arg0.lobbyPane.addPanelElements = f36_arg0.addLobbyPaneElements
		f36_arg0.lobbyPane.populatePanelElements = f36_arg0.populateLobbyPaneElements
	end
	if f36_arg0.overviewPane ~= nil then
		f36_arg0.overviewPane.addPanelElements = f36_arg0.addOverviewPaneElements
		f36_arg0.overviewPane.populatePanelElements = f36_arg0.populateOverviewPaneElements
	end
	if f36_arg0.statsPane ~= nil then
		f36_arg0.statsPane.addPanelElements = f36_arg0.addStatsPaneElements
		f36_arg0.statsPane.populatePanelElements = f36_arg0.populateStatsPaneElements
	end
	if f36_arg0.survivalStatsPane ~= nil then
		f36_arg0.survivalStatsPane.addPanelElements = f36_arg0.addStatsPaneElements
		f36_arg0.survivalStatsPane.populatePanelElements = f36_arg0.populateSurvivalStatsPaneElements
	end
	if f36_arg0.encountersStatsPane ~= nil then
		f36_arg0.encountersStatsPane.addPanelElements = f36_arg0.addStatsPaneElements
		f36_arg0.encountersStatsPane.populatePanelElements = f36_arg0.populateEncountersStatsPaneElements
	end
end

