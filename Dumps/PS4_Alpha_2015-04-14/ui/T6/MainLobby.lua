require( "ui.T6.CoDBase" )
require( "ui.T6.Lobby" )
require( "ui.T6.EdgeShadow" )
require( "ui_mp.T6.Menus.Playercard" )
require( "ui.T6.JoinableList" )
require( "ui.T6.Error" )
require( "ui_mp.T6.Menus.CODTv" )
require( "ui.T6.Menus.SignOutPopup" )
require( "ui_mp.T6.Menus.RejoinSessionPopup" )

if CoD.isXBOX or CoD.isPS3 then
	require( "T6.Menus.EliteAppPopup" )
end
CoD.MainLobby = {}
CoD.MainLobby.ShouldPreventCreateLobby = function ()
	if Engine.AcceptingInvite() == 1 or Engine.IsJoiningAnotherParty() == 1 or not Engine.PrivatePartyHost() or Engine.IsGameLobbyRunning() then
		return true
	else
		return false
	end
end

CoD.MainLobby.OnlinePlayAvailable = function ( self, event, openingStore )
	local controller = event.controller
	if openingStore == nil then
		openingStore = false
	end
	if CoD.isWIIU and Engine.IsSignedInToDemonware( contoller ) == false then
		if Engine.IsPrimaryLocalClient( controller ) then
			Engine.Exec( controller, "xsigninlive" )
		end
		return 0
	elseif Engine.IsGuest( controller ) then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
		errorPopup.anyControllerAllowed = true
	elseif Engine.DvarBool( controller, "live_betaexpired" ) then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "MP_BETACLOSED" ) )
	elseif not Engine.IsSignedInToLive( controller ) then
		if CoD.isPS3 or CoD.isWIIU then
			if Engine.IsPrimaryLocalClient( controller ) then
				Engine.Exec( controller, "xsigninlive" )
			else
				Engine.Exec( controller, "signclientin" )
			end
		elseif Engine.GetUsedControllerCount() == 0 then
			Engine.Exec( controller, "xsigninlivenoguests" )
		elseif Engine.IsSignedIn( controller ) then
			self:openPopup( "popup_signintolive", controller )
		else
			Engine.Exec( controller, "xsigninlive" )
		end
	elseif (not Engine.IsContentRatingAllowed( controller ) == 0 or Engine.IsAnyControllerMPRestricted()) and not openingStore then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_MPNOTALLOWED" ) )
		errorPopup.anyControllerAllowed = true
	elseif Engine.IsDemonwareFetchingDone( controller ) then
		local f2_local0 = CoD.GetPlayerStats( controller )
		local resetWarning = f2_local0.cacLoadouts.resetWarningDisplayed
		local f2_local1 = CoD.GetPlayerStats( controller )
		local classWarning = f2_local1.cacLoadouts.classWarningDisplayed
		if resetWarning:get() == 0 then
			resetWarning:set( 1 )
			if classWarning ~= nil then
				classWarning:set( 1 )
			end
			local errorPopup = self:openPopup( "Error", controller )
			errorPopup:setMessage( Engine.Localize( "MENU_STATS_RESET" ) )
			errorPopup.anyControllerAllowed = true
		elseif CoD.isMultiplayer == true and classWarning ~= nil and classWarning:get() == 0 then
			classWarning:set( 1 )
			local errorPopup = self:openPopup( "Error", controller )
			errorPopup:setMessage( Engine.Localize( "MENU_RESETCUSTOMCLASSES" ) )
			errorPopup.anyControllerAllowed = true
		else
			return 1
		end
	else
		Engine.ExecNow( nil, "initiatedemonwareconnect" )
		local connectingPopup = self:openPopup( "popup_connectingdw", controller )
		connectingPopup.openingStore = openingStore
		connectingPopup.callingMenu = self
	end
	return 0
end

CoD.MainLobby.IsControllerCountValid = function ( self, controller, validControllerCount )
	if validControllerCount < Engine.GetUsedControllerCount() then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_TOOMANYCONTROLLERS" ) )
		errorPopup.anyControllerAllowed = true
		return 0
	else
		return 1
	end
end

CoD.MainLobby.OpenPlayerMatchPartyLobby = function ( self, event )
	if CoD.MainLobby.ShouldPreventCreateLobby() then
		return 
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
		Engine.ProbationCheckForDashboardWarning( CoD.GAMEMODE_PUBLIC_MATCH )
		local probation, controller = Engine.ProbationCheckInProbation( CoD.GAMEMODE_PUBLIC_MATCH )
		if probation == true then
			self:openPopup( "popup_public_inprobation", controller )
			return 
		end
		local f4_local0, f4_local1 = Engine.ProbationCheckForProbation( CoD.GAMEMODE_PUBLIC_MATCH )
		controller = f4_local1
		if f4_local0 == true then
			self:openPopup( "popup_public_givenprobation", controller )
			return 
		elseif Engine.ProbationCheckParty( CoD.GAMEMODE_PUBLIC_MATCH, event.controller ) == true then
			self:openPopup( "popup_public_partyprobation", event.controller )
			return 
		end
		local maxControllersAllowed = Engine.DvarInt( controller, "party_maxlocalplayers_playermatch" )
		if CoD.MainLobby.IsControllerCountValid( self, event.controller, maxControllersAllowed ) == 1 then
			self.lobbyPane.body.lobbyList.maxLocalPlayers = maxControllersAllowed
			CoD.SwitchToPlayerMatchLobby( event.controller )
			self:openMenu( "PlayerMatchPartyLobby", event.controller )
			self:close()
		end
	end
end

CoD.MainLobby.OpenLeagueSelectionPopup = function ( self, event )
	if CoD.MainLobby.ShouldPreventCreateLobby() then
		return 
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
		Engine.ProbationCheckForDashboardWarning( CoD.GAMEMODE_PUBLIC_MATCH )
		local probation, controller = Engine.ProbationCheckInProbation( CoD.GAMEMODE_LEAGUE_MATCH )
		if probation == true then
			self:openPopup( "popup_league_inprobation", controller )
			return 
		end
		local f5_local0, f5_local1 = Engine.ProbationCheckForProbation( CoD.GAMEMODE_LEAGUE_MATCH )
		controller = f5_local1
		if f5_local0 == true then
			self:openPopup( "popup_league_givenprobation", controller )
			return 
		elseif Engine.ProbationCheckParty( CoD.GAMEMODE_LEAGUE_MATCH, event.controller ) == true then
			self:openPopup( "popup_league_partyprobation", event.controller )
			return 
		end
		Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_SELECTING_PLAYLIST )
		CoD.PlaylistCategoryFilter = "leaguematch"
		local selectionMenu = self:openPopup( "PlaylistSelection", event.controller )
		selectionMenu:addCategoryButtons( event.controller )
		Engine.PlaySound( "cac_screen_fade" )
	end
end

CoD.MainLobby.OpenLeaguePlayPartyLobby = function ( self, event )
	if CoD.MainLobby.ShouldPreventCreateLobby() then
		return 
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
		local maxControllersAllowed = Engine.DvarInt( controller, "party_maxlocalplayers_playermatch" )
		if CoD.MainLobby.IsControllerCountValid( self, event.controller, maxControllersAllowed ) == 1 then
			self.lobbyPane.body.lobbyList.maxLocalPlayers = maxControllersAllowed
			CoD.SwitchToLeagueMatchLobby( event.controller )
			self:openMenu( "LeaguePlayPartyLobby", event.controller )
			self:close()
		end
	end
end

CoD.MainLobby.OpenCustomGamesLobby = function ( self, event )
	if CoD.MainLobby.ShouldPreventCreateLobby() then
		return 
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
		local maxControllersAllowed = Engine.DvarInt( controller, "party_maxlocalplayers_privatematch" )
		if CoD.MainLobby.IsControllerCountValid( self, event.controller, maxControllersAllowed ) == 1 then
			CoD.SwitchToPrivateLobby( event.controller )
			self:openMenu( "PrivateOnlineGameLobby", event.controller )
			self:close()
		end
	end
end

CoD.MainLobby.OpenSoloLobby_Zombie = function ( self, event )
	if CoD.MainLobby.ShouldPreventCreateLobby() then
		return 
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
		local maxControllersAllowed = 1
		if CoD.MainLobby.IsControllerCountValid( self, event.controller, maxControllersAllowed ) == 1 then
			self.lobbyPane.body.lobbyList.maxLocalPlayers = maxControllersAllowed
			CoD.SwitchToPlayerMatchLobby( event.controller )
			self:openMenu( "PlayerMatchPartyLobby", event.controller )
			Dvar.party_maxplayers:set( 1 )
			self:close()
		end
	end
end

CoD.MainLobby.OpenTheaterLobby = function ( self, event )
	if CoD.MainLobby.ShouldPreventCreateLobby() then
		return 
	elseif not Engine.CanSwitchToLobby( Dvar.party_maxplayers_theater:get(), Dvar.party_maxlocalplayers_theater:get() ) then
		Dvar.ui_errorTitle:set( Engine.Localize( "MENU_NOTICE_CAPS" ) )
		Dvar.ui_errorMessage:set( Engine.Localize( "MENU_FILESHARE_MAX_LOCAL_PLAYERS" ) )
		CoD.Menu.OpenErrorPopup( self, {
			controller = event.controller
		} )
		return 
	elseif Engine.CanViewContent() == false then
		self:openPopup( "popup_contentrestricted", event.controller )
		return 
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
		local maxControllersAllowed = Engine.DvarInt( controller, "party_maxlocalplayers_theater" )
		if CoD.MainLobby.IsControllerCountValid( self, event.controller, maxControllersAllowed ) == 1 then
			CoD.SwitchToTheaterLobby( event.controller )
			local theaterLobby = self:openMenu( "TheaterLobby", event.controller, {
				parent = "MainLobby"
			} )
			self:close()
		end
	end
end

CoD.MainLobby.OpenCODTV = function ( self, event )
	if Engine.CanViewContent() == false then
		self:openPopup( "popup_contentrestricted", event.controller )
		return 
	elseif Engine.IsLivestreamEnabled() then
		self:openPopup( "CODTv_Error", event.controller )
		return 
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 and Engine.IsCodtvContentLoaded() == true then
		CoD.perController[event.controller].codtvRoot = "community"
		self:openPopup( "CODTv", event.controller )
	end
end

CoD.MainLobby.OpenBarracks = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	elseif CoD.MainLobby.OnlinePlayAvailable( self, event ) == 1 then
		if CoD.isZombie == true then
			Engine.Exec( event.controller, "party_setHostUIString ZMUI_VIEWING_LEADERBOARD" )
			self:openPopup( "LeaderboardCarouselZM", event.controller )
		else
			Engine.Exec( event.controller, "party_setHostUIString MENU_VIEWING_PLAYERCARD" )
			self:openPopup( "Barracks", event.controller )
		end
	end
end

CoD.MainLobby.OpenStore = function ( self, event )
	if self.occludedBy then
		return 
	end
	Engine.SetDvar( "ui_openStoreForMTX", 0 )
	if Engine.CheckNetConnection() == false then
		local popup = self:openPopup( "popup_net_connection_store", event.controller )
		popup.callingMenu = self
		return 
	elseif self.id == "Menu.MainMenu" then
		Engine.Exec( event.controller, "setclientbeingusedandprimary" )
	end
	if CoD.MainLobby.OnlinePlayAvailable( self, event, true ) == 1 then
		if not CoD.isPS3 or not Engine.IsSubUser( event.controller ) then
			Dvar.ui_storeButtonPressed:set( true )
			CoD.perController[event.controller].codtvRoot = "ingamestore"
			self:openPopup( "CODTv", event.controller )
		else
			local errorPopup = self:openPopup( "Error", event.controller )
			errorPopup:setMessage( Engine.Localize( "MENU_SUBUSERS_NOTALLOWED" ) )
			errorPopup.anyControllerAllowed = true
		end
	end
end

CoD.MainLobby.OpenControlsMenu = function ( self, event )
	self:openPopup( "WiiUControllerSettings", event.controller, true )
end

CoD.MainLobby.OpenOptionsMenu = function ( self, event )
	self:openPopup( "OptionsMenu", event.controller )
end

CoD.MainLobby.UpdateButtonPaneButtonVisibilty_Multiplayer = function ( self )
	if CoD.isPartyHost() then
		self.body.buttonList:addElement( self.body.matchmakingButton )
		if not Engine.IsBetaBuild() then
			self.body.buttonList:addElement( self.body.customGamesButton )
		end
		self.body.buttonList:addElement( self.body.theaterButton )
		self.body.buttonList:addElement( self.body.postTheaterSpacer )
	else
		self.body.matchmakingButton:closeAndRefocus( self.body.codtvButton )
		if not Engine.IsBetaBuild() then
			self.body.customGamesButton:closeAndRefocus( self.body.codtvButton )
		end
		self.body.theaterButton:closeAndRefocus( self.body.codtvButton )
		self.body.postTheaterSpacer:closeAndRefocus( self.body.codtvButton )
	end
end

CoD.MainLobby.UpdateButtonPaneButtonVisibilty_Zombie = function ( self )
	if CoD.isPartyHost() then
		self.body.buttonList:addElement( self.body.matchmakingButton )
		self.body.buttonList:addElement( self.body.customSpacer )
		self.body.buttonList:addElement( self.body.customGamesButton )
		self.body.buttonList:addElement( self.body.theaterSpacer )
		self.body.buttonList:addElement( self.body.theaterButton )
		if Engine.DvarInt( nil, "party_playerCount" ) <= 1 then
			self.body.buttonList:addElement( self.body.soloPlayButton )
		else
			self.body.soloPlayButton:closeAndRefocus( self.body.theaterButton )
		end
		self.body.buttonList:addElement( self.body.optionSpacer )
	else
		self.body.matchmakingButton:closeAndRefocus( self.body.codtvButton )
		self.body.soloPlayButton:closeAndRefocus( self.body.codtvButton )
		self.body.customSpacer:closeAndRefocus( self.body.codtvButton )
		self.body.customGamesButton:closeAndRefocus( self.body.codtvButton )
		self.body.theaterButton:closeAndRefocus( self.body.codtvButton )
		self.body.theaterSpacer:closeAndRefocus( self.body.codtvButton )
		self.body.optionSpacer:closeAndRefocus( self.body.codtvButton )
	end
end

CoD.MainLobby.UpdateButtonPaneButtonVisibilty = function ( self )
	if self == nil or self.body == nil then
		return 
	elseif CoD.isZombie == true then
		CoD.MainLobby.UpdateButtonPaneButtonVisibilty_Zombie( self )
	else
		CoD.MainLobby.UpdateButtonPaneButtonVisibilty_Multiplayer( self )
	end
	self:setLayoutCached( false )
end

CoD.MainLobby.UpdateButtonPromptVisibility = function ( self )
	if self == nil then
		return 
	end
	self:removeBackButton()
	local joinButtonWasVisible = false
	if self.joinButton ~= nil then
		self.joinButton:close()
		joinButtonWasVisible = true
	end
	self.friendsButton:close()
	if self.partyPrivacyButton ~= nil then
		self.partyPrivacyButton:close()
	end
	self:addBackButton()
	self:addFriendsButton()
	if joinButtonWasVisible then
		self:addJoinButton()
	end
	if self.panelManager.slidingEnabled ~= true then
		self.friendsButton:disable()
	end
	if self.panelManager:isPanelOnscreen( "buttonPane" ) then
		self:addPartyPrivacyButton()
	end
	self:addNATType()
end

CoD.MainLobby.PopulateButtons_Multiplayer = function ( self )
	self.body.matchmakingButton = self.body.buttonList:addButton( Engine.Localize( "MENU_MATCHMAKING_CAPS" ), nil, 1 )
	self.body.matchmakingButton.hintText = Engine.Localize( CoD.MPZM( "MPUI_PLAYER_MATCH_DESC", "ZMUI_PLAYER_MATCH_DESC" ) )
	self.body.matchmakingButton:setActionEventName( "open_player_match_party_lobby" )
	CoD.SetupMatchmakingLock( self.body.matchmakingButton )
	if not Engine.IsBetaBuild() then
		self.body.customGamesButton = self.body.buttonList:addButton( Engine.Localize( "MENU_CUSTOMGAMES_CAPS" ), nil, 3 )
		self.body.customGamesButton.hintText = Engine.Localize( CoD.MPZM( "MPUI_CUSTOM_MATCH_DESC", "ZMUI_CUSTOM_MATCH_DESC" ) )
		self.body.customGamesButton:setActionEventName( "open_custom_games_lobby" )
		CoD.SetupCustomGamesLock( self.body.customGamesButton )
	end
	self.body.theaterButton = self.body.buttonList:addButton( Engine.Localize( "MENU_THEATER_CAPS" ), nil, 4 )
	self.body.theaterButton:setActionEventName( "open_theater_lobby" )
	self.body.theaterButton.hintText = Engine.Localize( CoD.MPZM( "MPUI_THEATER_DESC", "ZMUI_THEATER_DESC" ) )
	self.body.postTheaterSpacer = self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 5 )
	if Engine.IsBetaBuild() then
		self.body.codtvButton = self.body.buttonList:addButton( Engine.Localize( "MENU_FILESHARE_COMMUNITY_CAPS" ), nil, 6 )
	else
		self.body.codtvButton = self.body.buttonList:addButton( Engine.Localize( "MENU_COD_TV_CAPS" ), nil, 6 )
	end
	self.body.codtvButton.hintText = Engine.Localize( "MPUI_COD_TV_DESC" )
	self.body.codtvButton:setActionEventName( "open_cod_tv" )
	if not Engine.IsBetaBuild() then
		self.body.barracksButton = self.body.buttonList:addButton( Engine.Localize( "MENU_BARRACKS_CAPS" ), nil, 7 )
		self.body.barracksButton.id = "CoD9Button" .. "." .. "MainLobby" .. "." .. Engine.Localize( "MENU_BARRACKS_CAPS" )
		CoD.SetupBarracksLock( self.body.barracksButton )
		CoD.SetupBarracksNew( self.body.barracksButton )
		self.body.barracksButton:setActionEventName( "open_barracks" )
	end
	if CoD.isZombie == false and not Engine.IsBetaBuild() and (CoD.isXBOX or CoD.isPS3) and Engine.IsEliteAvailable() and Engine.IsEliteButtonAvailable() then
		self.body.eliteAppButton = self.body.buttonList:addButton( Engine.Localize( "MENU_ELITE_CAPS" ), nil, 8 )
		self.body.eliteAppButton.hintText = Engine.Localize( "MENU_ELITE_DESC" )
		self.body.eliteAppButton:setActionEventName( "open_eliteapp_popup" )
	end
	self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 8 )
	self.body.optionsButton = self.body.buttonList:addButton( Engine.Localize( "MENU_OPTIONS_CAPS" ), nil, 11 )
	self.body.optionsButton.hintText = Engine.Localize( "MPUI_OPTIONS_DESC" )
	self.body.optionsButton:setActionEventName( "open_options_menu" )
	if not CoD.isPC and not CoD.isWIIU and Dvar.ui_inGameStoreVisible:get() == true and (CoD.isPS3 ~= true or CoD.isZombie ~= true) then
		self.body.ingameStoreButton = self.body.buttonList:addButton( Engine.Localize( "MENU_INGAMESTORE" ), nil, 12 )
		self.body.ingameStoreButton.hintText = Engine.Localize( "MENU_STORE_DESC" )
		self.body.ingameStoreButton:setActionEventName( "open_store" )
	end
end

CoD.MainLobby.PopulateButtons_Zombie = function ( self )
	self.body.matchmakingButton = self.body.buttonList:addButton( Engine.Localize( "MENU_MATCHMAKING_CAPS" ), nil, 1 )
	self.body.matchmakingButton.hintText = Engine.Localize( CoD.MPZM( "MPUI_PLAYER_MATCH_DESC", "ZMUI_PLAYER_MATCH_DESC" ) )
	self.body.matchmakingButton:setActionEventName( "open_player_match_party_lobby" )
	CoD.SetupMatchmakingLock( self.body.matchmakingButton )
	self.body.soloPlayButton = self.body.buttonList:addButton( Engine.Localize( "ZMUI_SOLO_PLAY_CAPS" ), nil, 2 )
	self.body.soloPlayButton.hintText = Engine.Localize( "ZMUI_SOLO_PLAY_DESC" )
	self.body.soloPlayButton:setActionEventName( "open_solo_lobby_zombie" )
	self.body.customSpacer = self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 3 )
	self.body.customGamesButton = self.body.buttonList:addButton( Engine.Localize( "MENU_CUSTOMGAMES_CAPS" ), nil, 4 )
	self.body.customGamesButton.hintText = Engine.Localize( CoD.MPZM( "MPUI_CUSTOM_MATCH_DESC", "ZMUI_CUSTOM_MATCH_DESC" ) )
	self.body.customGamesButton:setActionEventName( "open_custom_games_lobby" )
	CoD.SetupCustomGamesLock( self.body.customGamesButton )
	self.body.theaterButton = self.body.buttonList:addButton( Engine.Localize( "MENU_THEATER_CAPS" ), nil, 5 )
	self.body.theaterButton:setActionEventName( "open_theater_lobby" )
	self.body.theaterButton.hintText = Engine.Localize( CoD.MPZM( "MPUI_THEATER_DESC", "ZMUI_THEATER_DESC" ) )
	self.body.theaterSpacer = self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 6 )
	if Engine.IsBetaBuild() then
		self.body.codtvButton = self.body.buttonList:addButton( Engine.Localize( "MENU_FILESHARE_COMMUNITY_CAPS" ), nil, 7 )
	else
		self.body.codtvButton = self.body.buttonList:addButton( Engine.Localize( "MENU_COD_TV_CAPS" ), nil, 7 )
	end
	self.body.codtvButton.hintText = Engine.Localize( "MPUI_COD_TV_DESC" )
	self.body.codtvButton:setActionEventName( "open_cod_tv" )
	self.body.barracksButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_LEADERBOARDS_CAPS" ), nil, 8 )
	CoD.SetupBarracksLock( self.body.barracksButton )
	self.body.barracksButton:setActionEventName( "open_barracks" )
	self.body.optionSpacer = self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 9 )
	self.body.optionsButton = self.body.buttonList:addButton( Engine.Localize( "MENU_OPTIONS_CAPS" ), nil, 10 )
	self.body.optionsButton.hintText = Engine.Localize( "MPUI_OPTIONS_DESC" )
	self.body.optionsButton:setActionEventName( "open_options_menu" )
	if not CoD.isPC and Dvar.ui_inGameStoreVisible:get() == true and (CoD.isPS3 ~= true or CoD.isZombie ~= true) then
		self.body.ingameStoreButton = self.body.buttonList:addButton( Engine.Localize( "MENU_INGAMESTORE" ), nil, 11 )
		self.body.ingameStoreButton.hintText = Engine.Localize( "MENU_STORE_DESC" )
		self.body.ingameStoreButton:setActionEventName( "open_store" )
	end
end

CoD.MainLobby.PopulateButtons = function ( self )
	if CoD.isZombie == true then
		CoD.MainLobby.PopulateButtons_Zombie( self )
	else
		CoD.MainLobby.PopulateButtons_Multiplayer( self )
	end
	if CoD.isWIIU then
		self.body.controlsButton = self.body.buttonList:addButton( Engine.Localize( "MENU_CONTROLLER_SETTINGS_CAPS" ), nil, 9 )
		self.body.controlsButton.hintText = Engine.Localize( "MENU_CONTROLLER_SETTINGS_DESC" )
		self.body.controlsButton:setActionEventName( "open_controls_menu" )
	end
	if CoD.isOnlineGame() then
		if self.playerCountLabel == nil then
			self.playerCountLabel = LUI.UIText.new()
			self:addElement( self.playerCountLabel )
		end
		self.playerCountLabel:setLeftRight( true, false, 0, 0 )
		self.playerCountLabel:setTopBottom( false, true, -30 - CoD.textSize.Big, -30 )
		self.playerCountLabel:setFont( CoD.fonts.Big )
		self.playerCountLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		local playerCountText = CoD.Menu.GetOnlinePlayerCountText()
		local timer = nil
		if playerCountText ~= "" then
			self.playerCountLabel:setText( playerCountText )
			timer = LUI.UITimer.new( 60000, "update_online_player_count", false, self.playerCountLabel )
		else
			timer = LUI.UITimer.new( 1000, "update_online_player_count", false, self.playerCountLabel )
		end
		self.playerCountLabel:registerEventHandler( "update_online_player_count", CoD.MainLobby.UpdateOnlinePlayerCount )
		self.playerCountLabel.timer = timer
		self:addElement( timer )
	end
end

CoD.MainLobby.UpdateOnlinePlayerCount = function ( self )
	if CoD.isOnlineGame() then
		local playerCountText = CoD.Menu.GetOnlinePlayerCountText()
		if playerCountText ~= "" then
			self:setText( playerCountText )
			self.timer.interval = 60000
			self.timer:reset()
		end
	end
end

CoD.MainLobby.FirstSignedInToLive = function ( self )
	if self ~= nil then
		if CoD.isXBOX then
			self.anyControllerAllowed = false
		end
		if self.friendsButton == nil then
			self:addFriendsButton()
		end
	end
end

CoD.MainLobby.LastSignedOutOfLive = function ( self )
	if self ~= nil and CoD.isXBOX then
		self.anyControllerAllowed = true
	end
end

CoD.MainLobby.PlayerSelected = function ( self, event )
	local controller = Engine.GetPrimaryController()
	if event.joinable ~= nil and CoD.canJoinSession( controller, event.playerXuid ) then
		if self.joinButton == nil then
			self:addJoinButton()
			self:addNATType()
		end
	elseif self.joinButton ~= nil then
		self.joinButton:close()
		self.joinButton = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.MainLobby.PlayerDeselected = function ( self, event )
	if self.joinButton ~= nil then
		self.joinButton:close()
		self.joinButton = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.MainLobby.BusyList_Update = function ( self, members, previousListsRowCount, setFocus, showCommonStatusRow )
	CoD.PlayerList.Update( self, Engine.GetBusyFriendsOfAllLocalPlayers( self.maxRows - previousListsRowCount ), previousListsRowCount, setFocus, showCommonStatusRow )
end

CoD.MainLobby.Update = function ( self, event )
	if self == nil then
		return 
	elseif Engine.IsDemonwareFetchingDone( event.controller ) then
		self.panelManager:processEvent( {
			name = "fetching_done"
		} )
	end
	CoD.MainLobby.UpdateButtonPaneButtonVisibilty( self.buttonPane )
	CoD.MainLobby.UpdateButtonPromptVisibility( self )
	self:dispatchEventToChildren( event )
end

CoD.MainLobby.ClientLeave = function ( self, event )
	Engine.ExecNow( event.controller, "leaveAllParties" )
	Engine.PartyHostClearUIState()
	CoD.StartMainLobby( event.controller )
	CoD.MainLobby.UpdateButtonPaneButtonVisibilty( self.buttonPane )
	CoD.MainLobby.UpdateButtonPromptVisibility()
end

CoD.MainLobby.GoBack = function ( self, event )
	Engine.SessionModeResetModes()
	Engine.Exec( event.controller, "xstopprivateparty" )
	if CoD.isPS3 then
		Engine.Exec( event.controller, "signoutSubUsers" )
	end
	self:setPreviousMenu( "MainMenu" )
	CoD.Menu.goBack( self, event.controller )
end

CoD.MainLobby.Back = function ( self, event )
	local leaveEvent, leaveHandler = nil
	if CoD.Lobby.OpenSignOutPopup( self, event ) == true then
		return 
	elseif not Engine.IsPrimaryLocalClient( event.controller ) then
		Engine.Exec( event.controller, "signclientout" )
		self:processEvent( {
			name = "controller_backed_out"
		} )
		return 
	elseif not Engine.AloneInPrivatePartyIgnoreSplitscreen( true ) then
		local leaveHandlerTextTable = {
			params = {}
		}
		if not CoD.isPartyHost() then
			leaveHandlerTextTable.titleText = Engine.Localize( "MENU_LEAVE_LOBBY_TITLE" )
			leaveHandlerTextTable.messageText = Engine.Localize( "MENU_LEAVE_LOBBY_CLIENT_WARNING" )
			table.insert( leaveHandlerTextTable.params, {
				leaveHandler = CoD.MainLobby.ClientLeave,
				leaveEvent = "client_leave",
				leaveText = Engine.Localize( "MENU_LEAVE_LOBBY_AND_PARTY" ),
				debugHelper = "You're a client of a private party, remove you from the party"
			} )
		else
			leaveHandlerTextTable.titleText = Engine.Localize( "MENU_DISBAND_PARTY_TITLE" )
			leaveHandlerTextTable.messageText = Engine.Localize( "MENU_DISBAND_PARTY_HOST_WARNING" )
			table.insert( leaveHandlerTextTable.params, {
				leaveHandler = CoD.MainLobby.GoBack,
				leaveEvent = "host_leave",
				leaveText = Engine.Localize( "MENU_LEAVE_AND_DISBAND_PARTY" ),
				debugHelper = "You're the leader of a private party, choosing this will disband your party"
			} )
		end
		CoD.Lobby.ConfirmLeave( self, event.controller, leaveEvent, leaveHandler, leaveHandlerTextTable )
	else
		CoD.MainLobby.GoBack( self, event )
	end
end

CoD.MainLobby.AddLobbyPaneElements = function ( self, playerlistHeaderText )
	local maxControllersAllowed = Engine.DvarInt( nil, "party_maxlocalplayers_mainlobby" )
	CoD.LobbyPanes.addLobbyPaneElements( self, playerlistHeaderText, maxControllersAllowed )
	local joinableListDefaultAnimationState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = 0
	}
	self.body.lobbyList.joinableList = CoD.JoinableList.New( joinableListDefaultAnimationState, false, "", "joinableList", self.id )
	self.body.lobbyList.joinableList.pane = self
	self.body.lobbyList.joinableList.maxRows = CoD.MaxPlayerListRows - 2
	self.body.lobbyList.joinableList.statusText = Engine.Localize( "MENU_PLAYERLIST_FRIENDS_PLAYING" )
	self.body.lobbyList:addElement( self.body.lobbyList.joinableList )
end

CoD.MainLobby.ButtonListButtonGainFocus = function ( self, event )
	self:dispatchEventToParent( {
		name = "add_party_privacy_button"
	} )
	CoD.Lobby.ButtonListButtonGainFocus( self, event )
end

CoD.MainLobby.ButtonListAddButton = function ( self, text, hintText, priority )
	local newButton = CoD.Lobby.ButtonListAddButton( self, text, hintText, priority )
	newButton:registerEventHandler( "gain_focus", CoD.MainLobby.ButtonListButtonGainFocus )
	return newButton
end

CoD.MainLobby.AddButtonPaneElements = function ( self )
	CoD.LobbyPanes.addButtonPaneElements( self )
	self.body.buttonList.addButton = CoD.MainLobby.ButtonListAddButton
end

CoD.MainLobby.PopulateButtonPaneElements = function ( self )
	CoD.MainLobby.PopulateButtons( self )
	CoD.MainLobby.UpdateButtonPaneButtonVisibilty( self )
end

CoD.MainLobby.GoToFindingGames_Zombie = function ( self, event )
	Engine.Exec( event.controller, "xstartparty" )
	Engine.Exec( event.controller, "updategamerprofile" )
	local publicLobby = self:openMenu( "PublicGameLobby", event.controller )
	publicLobby:setPreviousMenu( "MainLobby" )
	publicLobby:registerAnimationState( "hide", {
		alpha = 0
	} )
	publicLobby:animateToState( "hide" )
	publicLobby:registerAnimationState( "show", {
		alpha = 1
	} )
	publicLobby:animateToState( "show", 500 )
	self:close()
end

CoD.MainLobby.ButtonPromptJoin = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
		errorPopup.anyControllerAllowed = true
		return 
	end
	local playerXuid = self.lobbyPane.body.lobbyList.selectedPlayerXuid
	if playerXuid ~= nil then
		Engine.SetDvar( "selectedPlayerXuid", playerXuid )
		CoD.joinPlayer( event.controller, playerXuid )
	end
end

LUI.createMenu.MainLobby = function ( controller )
	local buttonPaneTitleText = Engine.Localize( CoD.CPMPZM( "MENU_SINGLEPLAYER_CAPS", "MENU_MULTIPLAYER_CAPS", "MENU_ZOMBIES_CAPS" ) )
	local mainLobby = CoD.Lobby.New( "MainLobby", controller, nil, buttonPaneTitleText )
	mainLobby.controller = controller
	mainLobby.anyControllerAllowed = true
	mainLobby:setPreviousMenu( "MainMenu" )
	if CoD.isZombie == true then
		Engine.Exec( controller, "xsessionupdate" )
		mainLobby:registerEventHandler( "open_solo_lobby_zombie", CoD.MainLobby.OpenSoloLobby_Zombie )
		mainLobby:registerEventHandler( "restartMatchmaking", CoD.MainLobby.GoToFindingGames_Zombie )
		Engine.SetDvar( "party_readyPercentRequired", 0 )
	elseif (CoD.isXBOX or CoD.isPS3) and Engine.IsEliteAvailable() and Engine.IsEliteButtonAvailable() then
		mainLobby:registerEventHandler( "open_eliteapp_popup", CoD.MainLobby.OpenEliteAppPopup )
		mainLobby:registerEventHandler( "elite_registration_ended", CoD.MainLobby.elite_registration_ended )
	end
	mainLobby:addTitle( buttonPaneTitleText )
	mainLobby.addButtonPaneElements = CoD.MainLobby.AddButtonPaneElements
	mainLobby.populateButtonPaneElements = CoD.MainLobby.PopulateButtonPaneElements
	mainLobby.addLobbyPaneElements = CoD.MainLobby.AddLobbyPaneElements
	mainLobby:updatePanelFunctions()
	mainLobby:registerEventHandler( "partylobby_update", CoD.MainLobby.Update )
	mainLobby:registerEventHandler( "button_prompt_back", CoD.MainLobby.Back )
	mainLobby:registerEventHandler( "first_signed_in", CoD.MainLobby.FirstSignedInToLive )
	mainLobby:registerEventHandler( "last_signed_out", CoD.MainLobby.LastSignedOutOfLive )
	mainLobby:registerEventHandler( "player_selected", CoD.MainLobby.PlayerSelected )
	mainLobby:registerEventHandler( "player_deselected", CoD.MainLobby.PlayerDeselected )
	mainLobby:registerEventHandler( "open_player_match_party_lobby", CoD.MainLobby.OpenPlayerMatchPartyLobby )
	mainLobby:registerEventHandler( "open_league_play_party_lobby", CoD.MainLobby.OpenLeagueSelectionPopup )
	mainLobby:registerEventHandler( "playlist_selected", CoD.MainLobby.OpenLeaguePlayPartyLobby )
	mainLobby:registerEventHandler( "open_custom_games_lobby", CoD.MainLobby.OpenCustomGamesLobby )
	mainLobby:registerEventHandler( "open_theater_lobby", CoD.MainLobby.OpenTheaterLobby )
	mainLobby:registerEventHandler( "open_cod_tv", CoD.MainLobby.OpenCODTV )
	mainLobby:registerEventHandler( "open_barracks", CoD.MainLobby.OpenBarracks )
	if CoD.isWIIU then
		mainLobby:registerEventHandler( "open_controls_menu", CoD.MainLobby.OpenControlsMenu )
	end
	mainLobby:registerEventHandler( "open_options_menu", CoD.MainLobby.OpenOptionsMenu )
	mainLobby:registerEventHandler( "open_session_rejoin_popup", CoD.MainLobby.OpenSessionRejoinPopup )
	mainLobby:registerEventHandler( "button_prompt_join", CoD.MainLobby.ButtonPromptJoin )
	mainLobby:registerEventHandler( "open_store", CoD.MainLobby.OpenStore )
	mainLobby.lobbyPane.body.lobbyList:setSplitscreenSignInAllowed( true )
	CoD.MainLobby.PopulateButtons( mainLobby.buttonPane )
	CoD.MainLobby.UpdateButtonPaneButtonVisibilty( mainLobby.buttonPane )
	CoD.MainLobby.UpdateButtonPromptVisibility( mainLobby )
	if CoD.useController then
		if CoD.isZombie then
			mainLobby.buttonPane.body.buttonList:selectElementIndex( 1 )
		elseif not mainLobby.buttonPane.body.buttonList:restoreState() then
			if CoD.isPartyHost() then
				if Engine.IsBetaBuild() then
					mainLobby.buttonPane.body.leaguePlayButton:processEvent( {
						name = "gain_focus"
					} )
				else
					mainLobby.buttonPane.body.matchmakingButton:processEvent( {
						name = "gain_focus"
					} )
				end
			else
				mainLobby.buttonPane.body.theaterButton:processEvent( {
					name = "gain_focus"
				} )
			end
		end
	end
	mainLobby.categoryInfo = CoD.Lobby.CreateInfoPane()
	mainLobby.playlistInfo = CoD.Lobby.CreateInfoPane()
	mainLobby.lobbyPane.body:close()
	mainLobby.lobbyPane.body = nil
	CoD.MainLobby.AddLobbyPaneElements( mainLobby.lobbyPane, Engine.Localize( "MENU_PARTY_CAPS" ) )
	if Engine.AnySignedInToLive() then
		CoD.MainLobby.FirstSignedInToLive( mainLobby )
	else
		CoD.MainLobby.LastSignedOutOfLive( mainLobby )
	end
	Engine.SystemNeedsUpdate( nil, "party" )
	if CoD.isPS3 then
		mainLobby.anyControllerAllowed = false
	end
	if not CoD.isZombie then
		CoD.CheckClasses.CheckClasses()
	end
	if CoD.isPartyHost() then
		Engine.SessionModeSetOnlineGame( true )
	end
	return mainLobby
end

CoD.MainLobby.OpenSessionRejoinPopup = function ( self, event )
	self:openPopup( "RejoinSessionPopup", event.controller )
end

CoD.MainLobby.elite_registration_ended = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	elseif Engine.IsPlayerEliteRegistered( event.controller ) then
		if Engine.ELaunchAppSearch( event.controller ) then
			local eliteAppLaunchExecPopup = self:openPopup( "EliteAppLaunchExecPopup", event.controller )
		else
			local eliteAppDownloadPopup = self:openPopup( "EliteAppDownloadPopup", event.controller )
		end
	end
end

CoD.MainLobby.OpenEliteAppPopup = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	elseif Engine.IsPlayerEliteRegistered( event.controller ) then
		if Engine.ELaunchAppSearch( event.controller ) then
			local eliteAppLaunchExecPopup = self:openPopup( "EliteAppLaunchExecPopup", event.controller )
		else
			local eliteAppDownloadPopup = self:openPopup( "EliteAppDownloadPopup", event.controller )
		end
	else
		local eliteRegPopup = self:openPopup( "EliteRegistrationPopup", event.controller )
	end
end

