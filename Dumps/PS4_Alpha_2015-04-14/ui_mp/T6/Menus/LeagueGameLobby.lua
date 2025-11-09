require( "ui_mp.T6.Menus.PublicGameLobby" )
require( "ui.T6.LeagueStats" )
require( "ui_mp.T6.Menus.LeaguePostGameLobbyInfo" )

local UpdateMapInfoImage = nil
CoD.LeagueGameLobby = {}
CoD.LeagueGameLobby.PopulateButtons = function ( self, controller )
	self.body.createAClassButton = self.body.buttonList:addButton( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	CoD.CACUtility.SetupCACLock( self.body.createAClassButton )
	self.body.createAClassButton:registerEventHandler( "button_action", CoD.GameLobby.Button_CAC )
	self.body.rewardsButton = self.body.buttonList:addButton( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ) )
	CoD.SetupButtonLock( self.body.rewardsButton, nil, "FEATURE_KILLSTREAKS", "FEATURE_KILLSTREAKS_DESC" )
	self.body.rewardsButton:registerEventHandler( "button_action", CoD.GameLobby.Button_Rewards )
	self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	self.body.leagueLeaderboardButton = self.body.buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_LEAGUE_LEADERBOARD" ) ), Engine.Localize( "MENU_LEAGUE_LEADERBOARD_DESC" ), 8 )
	self.body.leagueLeaderboardButton:setActionEventName( "open_league_leaderboard" )
	self.body.leagueLeaderboardButton:disable()
	local leagueStats = Engine.GetLeagueStats( controller )
	if leagueStats.valid then
		if leagueStats.inPlacement == true then
			self.body.leagueLeaderboardButton:disable()
			self.body.leagueLeaderboardButton.hintText = Engine.Localize( "MENU_LEAGUE_LEADERBOARD_LOCKED_DESC" )
		else
			self.body.leagueLeaderboardButton:enable()
			self.body.leagueLeaderboardButton.hintText = Engine.Localize( "MENU_LEAGUE_LEADERBOARD_DESC" )
		end
	end
	if not Engine.IsBetaBuild() then
		self.body.barracksButton = self.body.buttonList:addButton( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
		CoD.SetupBarracksLock( self.body.barracksButton )
		self.body.barracksButton:setActionEventName( "open_barracks" )
	end
	local mapInfoImageLeft = 0
	local mapInfoImageWidth = 350 - CoD.CoD9Button.Height - mapInfoImageLeft
	local mapInfoImageHeight = mapInfoImageWidth / CoD.MapInfoImage.AspectRatio
	self.body.mapInfoImage = CoD.MapInfoImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = mapInfoImageWidth,
		topAnchor = false,
		bottomAnchor = true,
		top = -mapInfoImageHeight - CoD.ButtonPrompt.Height - 15,
		bottom = -CoD.ButtonPrompt.Height - 15
	} )
	self.body.mapInfoImage:setPriority( 200 )
	self.body:addElement( self.body.mapInfoImage )
	self.body.mapInfoImage:registerEventHandler( "gamelobby_update", UpdateMapInfoImage )
	self.body.mapInfoImage:registerEventHandler( "game_options_update", CoD.NullFunction )
	self.body.mapInfoImage:processEvent( {
		name = "gamelobby_update"
	} )
	self.body.postGameLobbyInfo = CoD.LeaguePostGameLobbyInfo.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = mapInfoImageWidth,
		topAnchor = false,
		bottomAnchor = true,
		top = -mapInfoImageHeight - CoD.ButtonPrompt.Height - 15,
		bottom = -CoD.ButtonPrompt.Height - 15
	} )
	self.body:addElement( self.body.postGameLobbyInfo )
	self.body.postGameLobbyInfo:hide()
	CoD.GameLobby.PopulateButtons( self, mapInfoImageHeight + 45 )
	CoD.PublicGameLobby.AddDetailedStatusText( self, mapInfoImageHeight )
end

CoD.LeagueGameLobby.UpdateButtonPaneButtonVisibility = function ( self )
	if self == nil or self.body == nil then
		return 
	else
		
	end
end

CoD.LeagueGameLobby.UpdateButtonPromptVisibility = function ( self )
	if self == nil then
		return 
	end
	self:removeBackButton()
	if not Engine.PartyLockedIn() then
		self:addBackButton()
	end
	if self.partyPrivacyButton then
		self.partyPrivacyButton:close()
	end
end

CoD.LeagueGameLobby.PopulateButtonPaneElements = function ( self )
	CoD.LeagueGameLobby.PopulateButtons( self )
	CoD.LeagueGameLobby.UpdateButtonPaneButtonVisibility( self )
end

CoD.LeagueGameLobby.AddLobbyPaneElements = function ( self )
	CoD.PartyLobby.AddLobbyPaneElements( self )
	CoD.LeaguePlayPartyLobby.AddPlayerLeagueInfo( self )
end

CoD.LeagueGameLobby.AddPlayerLeagueInfo = function ( self )
	if self.playerLeagueInfo ~= nil then
		self.playerLeagueInfo:close()
		self.playerLeagueInfo = nil
	end
	local playerLeagueTop = -CoD.LeagueStats.height - CoD.ButtonPrompt.Height * 2
	local playerLeagueInfoLeft = CoD.LobbyPanes.VoipOffset
	self.body.playerLeagueInfo = CoD.LeagueStats.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = playerLeagueInfoLeft,
		right = playerLeagueInfoLeft + CoD.LeagueStats.width,
		topAnchor = false,
		bottomAnchor = true,
		top = playerLeagueTop,
		bottom = playerLeagueTop + CoD.LeagueStats.height
	} )
	self.body:addElement( self.body.playerLeagueInfo )
end

CoD.LeagueGameLobby.PopulateLobbyPaneElements = function ( self )
	CoD.LobbyPanes.populateLobbyPaneElements( self )
	self.body.playerLeagueInfo:update( {
		controller = self.controller
	} )
end

CoD.LeagueGameLobby.GoBack = function ( self, event )
	self:setPreviousMenu( "LeaguePlayPartyLobby" )
	CoD.Lobby.GoBack( self, event )
end

CoD.LeagueGameLobby.AddButtonPrompts = function ( self, controller )
	local f9_local0 = CoD.GetPlayerStats( controller )
	local afterActionReportStats = f9_local0.AfterActionReportStats
	local lobbyPopup = afterActionReportStats.lobbyPopup:get()
	if Engine.IsStableStatsBufferInitialized( controller ) and (lobbyPopup == "league" or lobbyPopup == "leaguesummary") then
		self:addRightButtonPrompt( CoD.ButtonPrompt.new( "select", Engine.Localize( "MPUI_AFTER_ACTION_REPORT" ), self, "open_aar", false, nil, false, nil, "TAB" ) )
	end
end

CoD.LeagueGameLobby.UpdateStatus = function ( self, event )
	if Engine.PartyIsPostGame() == true and self.buttonPane.body and self.buttonPane.body.mapInfoImage and self.buttonPane.body.postGameLobbyInfo then
		self.buttonPane.body.mapInfoImage:hide( 0 )
		self.buttonPane.body.statusText:hide()
		self.buttonPane.body.postGameLobbyInfo:show()
		self.buttonPane.body.postGameLobbyInfo:update( event.controller )
		self:dispatchEventToChildren( {
			name = "set_new_title",
			titleText = Engine.ToUpper( Engine.Localize( "MENU_POST_GAME_LOBBY" ) )
		} )
	elseif self.buttonPane.body and self.buttonPane.body.mapInfoImage and self.buttonPane.body.postGameLobbyInfo then
		self.buttonPane.body.mapInfoImage:show( 0 )
		self.buttonPane.body.statusText:show()
		self.buttonPane.body.postGameLobbyInfo:hide()
		CoD.GameLobby.UpdateStatusText( self, event )
		self:dispatchEventToChildren( {
			name = "set_new_title",
			titleText = self.titleText
		} )
	end
end

CoD.LeagueGameLobby.SetNewTitle = function ( self, event )
	self:setText( event.titleText )
end

CoD.LeagueGameLobby.Update = function ( self, event )
	CoD.LeagueGameLobby.UpdateButtonPromptVisibility( self )
	CoD.GameLobby.Update( self, event )
	if self.buttonPane and self.buttonPane.body and self.buttonPane.body.rewardsButton then
		if Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 0 then
			self.buttonPane.body.rewardsButton:disable()
			self.buttonPane.body.rewardsButton.hintText = Engine.Localize( "MENU_SCORE_STREAKS_DISABLED" )
		else
			self.buttonPane.body.rewardsButton:enable()
			self.buttonPane.body.rewardsButton.hintText = nil
		end
	end
end

LUI.createMenu.LeagueGameLobby = function ( controller )
	local titleText = Engine.ToUpper( Engine.GetPlaylistName( controller ) )
	local leagueGameLobby = CoD.PublicGameLobby.New( "LeagueGameLobby", controller, titleText )
	if CoD.isMultiplayer then
		leagueGameLobby:setPreviousMenu( "MainLobby" )
	end
	leagueGameLobby:addTitle( titleText )
	leagueGameLobby.populateButtonPaneElements = CoD.LeagueGameLobby.PopulateButtonPaneElements
	leagueGameLobby.addLobbyPaneElements = CoD.LeagueGameLobby.AddLobbyPaneElements
	leagueGameLobby.populateLobbyPaneElements = CoD.LeagueGameLobby.PopulateLobbyPaneElements
	leagueGameLobby.goBack = CoD.LeagueGameLobby.GoBack
	leagueGameLobby:updatePanelFunctions()
	CoD.LeagueGameLobby.PopulateButtons( leagueGameLobby.buttonPane, controller )
	CoD.LeagueGameLobby.UpdateButtonPromptVisibility( leagueGameLobby )
	CoD.LeagueGameLobby.AddButtonPrompts( leagueGameLobby, controller )
	CoD.LeaguePlayPartyLobby.AddPlayerLeagueInfo( leagueGameLobby.lobbyPane )
	leagueGameLobby:processEvent( {
		name = "league_changed",
		controller = controller
	} )
	if CoD.useController then
		leagueGameLobby.buttonPane.body.createAClassButton:processEvent( {
			name = "gain_focus"
		} )
	end
	leagueGameLobby.lobbyPane:setSplitscreenSignInAllowed( false )
	leagueGameLobby:registerEventHandler( "party_update_status", CoD.LeagueGameLobby.UpdateStatus )
	leagueGameLobby:registerEventHandler( "open_league_leaderboard", CoD.LeaguePlayPartyLobby.OpenLeagueLeaderboard )
	leagueGameLobby:registerEventHandler( "partylobby_update", CoD.LeagueGameLobby.Update )
	leagueGameLobby:registerEventHandler( "gamelobby_update", CoD.LeagueGameLobby.Update )
	leagueGameLobby.titleElement:registerEventHandler( "set_new_title", CoD.LeagueGameLobby.SetNewTitle )
	return leagueGameLobby
end

UpdateMapInfoImage = function ( mapInfoImage, event )
	if Engine.PartyIsReadyToStart() and not Engine.IsPartyLobbyRunning() then
		CoD.MapInfoImage.RefreshEvent( mapInfoImage, event )
	else
		local league = Engine.GetLeague()
		CoD.MapInfoImage.ShowLeagueInfo( mapInfoImage, league )
	end
end

