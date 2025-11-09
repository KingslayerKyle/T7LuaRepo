require( "ui.T6.PartyLobby" )
require( "ui.T6.LeagueStats" )
require( "ui_mp.T6.Menus.LeagueTeamNamePopup" )
require( "ui_mp.T6.Menus.LeagueSelectionPopup" )

CoD.LeaguePlayPartyLobby = {}
CoD.LeaguePlayPartyLobby.OpenLeagueSelection = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
		errorPopup.anyControllerAllowed = true
		return 
	else
		Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_SELECTING_PLAYLIST )
		CoD.PlaylistCategoryFilter = "leaguematch"
		local selectionMenu = self:openPopup( "PlaylistSelection", event.controller )
		selectionMenu:addCategoryButtons( event.controller )
		Engine.PlaySound( "cac_screen_fade" )
	end
end

CoD.LeaguePlayPartyLobby.UpdateLeagueInfo = function ( self, controller )
	local leagueInfo = Engine.GetLeague()
	local findMatchButton = nil
	if self.body then
		findMatchButton = self.body.findMatchButton
	end
	if leagueInfo == nil and findMatchButton then
		findMatchButton:disable()
	else
		local leagueStats = Engine.GetLeagueStats( controller )
		if self.body then
			local invalid = CoD.LeagueStats.InvalidTeamForLeague( controller, leagueInfo, leagueStats )
			if CoD.isPartyHost() and not invalid then
				findMatchButton:enable()
				findMatchButton.hintText = Engine.Localize( "MENU_LEAGUE_FIND_MATCH_DESC" )
				if findMatchButton:isInFocus() then
					findMatchButton:dispatchEventToParent( {
						name = "update_hint_text",
						button = self.body.findMatchButton
					} )
				end
			else
				findMatchButton:disable()
				if invalid then
					findMatchButton.hintText = Engine.Localize( invalid )
					if findMatchButton:isInFocus() then
						findMatchButton:dispatchEventToParent( {
							name = "update_hint_text",
							button = self.body.findMatchButton
						} )
					end
				end
			end
			self.body.lobbyLeagueInfo:show()
			CoD.MapInfoImage.ShowLeagueInfo( self.body.lobbyLeagueInfo, leagueInfo )
			if not leagueStats.valid then
				return 
			elseif leagueStats.inPlacement == true then
				self.body.leagueLeaderboardButton:disable()
				self.body.leagueLeaderboardButton.hintText = Engine.Localize( "MENU_LEAGUE_LEADERBOARD_LOCKED_DESC" )
			else
				self.body.leagueLeaderboardButton:enable()
				self.body.leagueLeaderboardButton.hintText = Engine.Localize( "MENU_LEAGUE_LEADERBOARD_DESC" )
			end
		end
	end
	return leagueInfo
end

CoD.LeaguePlayPartyLobby.LeagueChanged = function ( self, event )
	self.leagueInfo = CoD.LeaguePlayPartyLobby.UpdateLeagueInfo( self.buttonPane, event.controller )
	self:dispatchEventToChildren( event )
	if self.aarPrompt then
		if CoD.AfterActionReport.ValidForLeagueTeam( event.controller ) then
			self.aarPrompt:show()
		else
			self.aarPrompt:hide()
		end
	end
end

CoD.LeaguePlayPartyLobby.TeamNameNotSet = function ( controller )
	local leagueStats = Engine.GetLeagueStats( controller )
	if leagueStats.teamName == "" and CoD.isPartyHost() and leagueStats.random == false then
		return true
	else
		return false
	end
end

CoD.LeaguePlayPartyLobby.TeamNameEntered = function ( self, event )
	Engine.SetLeagueTeamName( event.controller, event.teamName )
end

CoD.LeaguePlayPartyLobby.PopulateButtons = function ( self )
	self.body.findMatchButton.hintText = Engine.Localize( "MENU_LEAGUE_FIND_MATCH_DESC" )
	self.body.findMatchButton:setActionEventName( "go_to_finding_games" )
	self.body.findMatchButton:disable()
	self.body.viewLeagueRulesButton = self.body.buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_VIEW_LEAGUE_RULES" ) ), Engine.Localize( "MENU_VIEW_LEAGUE_RULES_DESC" ), 1 )
	self.body.viewLeagueRulesButton:setActionEventName( "open_view_league_rules_popup" )
	self.body.chooseLeagueButton = self.body.buttonList:addButton( Engine.Localize( "MENU_CHANGE_LEAGUE_CAPS" ), Engine.Localize( "MPUI_LEAGUES_DESC" ), 2 )
	self.body.chooseLeagueButton:setActionEventName( "open_playlist_selection" )
	self.body.leagueLeaderboardButton = self.body.buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_LEAGUE_LEADERBOARD" ) ), Engine.Localize( "MENU_LEAGUE_LEADERBOARD_DESC" ), 8 )
	self.body.leagueLeaderboardButton:setActionEventName( "open_league_leaderboard" )
	self.body.leagueLeaderboardButton:disable()
	self.body.buttonList:removeAllButtons()
	self.body.findMatchButton:setPriority( 1 )
	self.body.viewLeagueRulesButton:setPriority( 1 )
	self.body.chooseLeagueButton:setPriority( 2 )
	self.body.createAClassButton:setPriority( 4 )
	self.body.rewardsButton:setPriority( 5 )
	self.body.leagueLeaderboardButton:setPriority( 7 )
	if not Engine.IsBetaBuild() then
		self.body.barracksButton:setPriority( 8 )
	end
	if CoD.isPartyHost() then
		self.body.buttonList:addElement( self.body.findMatchButton )
		self.body.buttonList:addElement( self.body.chooseLeagueButton )
	else
		self.body.buttonList:addElement( self.body.viewLeagueRulesButton )
	end
	self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 3 )
	self.body.buttonList:addElement( self.body.createAClassButton )
	self.body.buttonList:addElement( self.body.rewardsButton )
	self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 6 )
	self.body.buttonList:addElement( self.body.leagueLeaderboardButton )
	if not Engine.IsBetaBuild() then
		self.body.buttonList:addElement( self.body.barracksButton )
		self.body.barracksButton.hintText = Engine.Localize( "MENU_LEAGUE_BARRACKS_DESC" )
	end
	CoD.Lobby.AddLivestreamButton( self, 10 )
	CoD.LeaguePlayPartyLobby.AddLobbyLeagueInfo( self.body )
end

CoD.LeaguePlayPartyLobby.PopulateButtonPaneElements = function ( self )
	CoD.PartyLobby.PopulateButtonPaneElements( self )
	CoD.LeaguePlayPartyLobby.PopulateButtons( self )
	CoD.LeaguePlayPartyLobby.UpdateLeagueInfo( self, self.controller )
end

CoD.LeaguePlayPartyLobby.AddLobbyLeagueInfo = function ( self )
	if self.lobbyLeagueInfo ~= nil then
		self.lobbyLeagueInfo:close()
		self.lobbyLeagueInfo = nil
	end
	local lobbyLeagueInfoImageLeft = 0
	local lobbyLeagueInfoImageWidth = 350 - CoD.CoD9Button.Height - lobbyLeagueInfoImageLeft
	local lobbyLeagueInfoImageHeight = lobbyLeagueInfoImageWidth / CoD.MapInfoImage.AspectRatio
	self.lobbyLeagueInfo = CoD.MapInfoImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = lobbyLeagueInfoImageWidth,
		topAnchor = false,
		bottomAnchor = true,
		top = -lobbyLeagueInfoImageHeight - CoD.ButtonPrompt.Height - 15,
		bottom = -CoD.ButtonPrompt.Height - 15
	} )
	self.lobbyLeagueInfo:registerEventHandler( "gamelobby_update", CoD.NullFunction )
	self.lobbyLeagueInfo:registerEventHandler( "game_options_update", CoD.NullFunction )
	self.lobbyLeagueInfo:hide()
	self:addElement( self.lobbyLeagueInfo )
end

CoD.LeaguePlayPartyLobby.AddLobbyPaneElements = function ( self )
	CoD.PartyLobby.AddLobbyPaneElements( self )
	CoD.LeaguePlayPartyLobby.AddPlayerLeagueInfo( self )
end

CoD.LeaguePlayPartyLobby.AddPlayerLeagueInfo = function ( self )
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

CoD.LeaguePlayPartyLobby.PopulateLobbyPaneElements = function ( self )
	CoD.LobbyPanes.populateLobbyPaneElements( self )
	self.body.playerLeagueInfo:update( {
		controller = self.controller
	} )
end

CoD.LeaguePlayPartyLobby.SetCurrentLeague = function ( self, controller )
	self:processEvent( {
		name = "league_changed",
		controller = controller
	} )
end

CoD.LeaguePlayPartyLobby.GoToFindingGames = function ( self, event )
	local leagueInfo = Engine.GetLeague()
	local leagueStats = Engine.GetLeagueStats( event.controller )
	local invalid = CoD.LeagueStats.InvalidTeamForLeague( event.controller, leagueInfo, leagueStats )
	if not CoD.isPartyHost() or invalid then
		return 
	else
		local probation, controller = Engine.ProbationCheckInProbation( CoD.GAMEMODE_LEAGUE_MATCH )
		if probation == true then
			self:openPopup( "popup_league_inprobation", controller )
			return 
		else
			local f13_local0, f13_local1 = Engine.ProbationCheckForProbation( CoD.GAMEMODE_LEAGUE_MATCH )
			controller = f13_local1
			if f13_local0 == true then
				self:openPopup( "popup_league_givenprobation", controller )
				return 
			elseif Engine.ProbationCheckParty( CoD.GAMEMODE_LEAGUE_MATCH, event.controller ) == true then
				self:openPopup( "popup_league_partyprobation", event.controller )
				return 
			elseif CoD.LeaguePlayPartyLobby.TeamNameNotSet( event.controller ) then
				self:openPopup( "EnterTeamNamePopup", event.controller )
				return 
			else
				Engine.Exec( event.controller, "xstartparty" )
				Engine.Exec( event.controller, "updategamerprofile" )
				self:openMenu( "LeagueGameLobby", event.controller )
				self:close()
			end
		end
	end
end

CoD.LeaguePlayPartyLobby.UpdateButtonPaneButtonVisibility = function ( self )
	if self == nil or self.body == nil then
		return 
	elseif CoD.isPartyHost() then
		self.body.buttonList:addElement( self.body.findMatchButton )
	else
		self.body.findMatchButton:close()
	end
	CoD.PartyLobby.UpdateDLCWarning( self )
end

CoD.LeaguePlayPartyLobby.Update = function ( self, event )
	if self == nil then
		return 
	end
	CoD.LeaguePlayPartyLobby.LeagueChanged( self, event )
	CoD.LeaguePlayPartyLobby.UpdateButtonPaneButtonVisibility( self.buttonPane )
	CoD.PartyLobby.UpdateButtonPromptVisibility( self )
	if self.buttonPane and self.buttonPane.body then
		if CoD.isPartyHost() then
			self.buttonPane.body.viewLeagueRulesButton:close()
			self.buttonPane.body.buttonList:addElement( self.buttonPane.body.chooseLeagueButton )
		else
			self.buttonPane.body.chooseLeagueButton:close()
			self.buttonPane.body.buttonList:addElement( self.buttonPane.body.viewLeagueRulesButton )
			self.buttonPane.body.buttonList:processEvent( {
				name = "gain_focus"
			} )
		end
		if Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 0 and self.buttonPane and self.buttonPane.body and self.buttonPane.body.rewardsButton then
			self.buttonPane.body.rewardsButton:disable()
			self.buttonPane.body.rewardsButton.hintText = Engine.Localize( "MENU_SCORE_STREAKS_DISABLED" )
		else
			self.buttonPane.body.rewardsButton:enable()
			self.buttonPane.body.rewardsButton.hintText = Engine.Localize( "FEATURE_KILLSTREAKS_DESC" )
		end
	end
	self:dispatchEventToChildren( event )
end

CoD.LeaguePlayPartyLobby.OpenLeagueLeaderboard = function ( self, event )
	local leagueStats = Engine.GetLeagueStats( event.controller )
	local leagueInfo = Engine.GetLeague( event.controller )
	local teamSubdivisionInfo = CoD.LeaguesData.CurrentTeamSubdivisionInfo
	teamSubdivisionInfo.subdivisionID = leagueStats.subdivisionID
	teamSubdivisionInfo.teamID = leagueStats.teamID
	teamSubdivisionInfo.leagueIconName = leagueInfo.iconName
	teamSubdivisionInfo.leagueDesc = leagueInfo.name
	teamSubdivisionInfo.divisionName = leagueStats.divisionName
	teamSubdivisionInfo.divisionIcon = leagueStats.divisionIcon
	teamSubdivisionInfo.subdivisionName = leagueStats.subdivisionName
	teamSubdivisionInfo.bracketRankPosition = leagueStats.bracketRankPosition
	teamSubdivisionInfo.divisionID = leagueStats.divisionID
	CoD.LeaguesData.CurrentTeamInfo.teamName = leagueStats.teamName
	CoD.LeaguesData.CurrentTeamInfo.teamID = leagueStats.teamID
	CoD.LeaguesData.CurrentLeagueID = leagueInfo.id
	CoD.LeaguesData.numTeamMembersToShow = 1
	if leagueStats and not leagueStats.random then
		CoD.LeaguesData.numTeamMembersToShow = leagueStats.memberCount
	end
	self:openPopup( "LeagueLeaderboard", event.controller, true )
end

CoD.LeaguePlayPartyLobby.OpenViewLeagueRulesPopup = function ( self, event )
	self:openPopup( "ViewLeagueRulesPopup", event.controller )
end

CoD.LeaguePlayPartyLobby.AddButtonPrompts = function ( self, controller )
	local f18_local0 = CoD.GetPlayerStats( controller )
	local afterActionReportStats = f18_local0.AfterActionReportStats
	local lobbyPopup = afterActionReportStats.lobbyPopup:get()
	if Engine.IsStableStatsBufferInitialized( controller ) and (lobbyPopup == "league" or lobbyPopup == "leaguesummary") then
		self.aarPrompt = CoD.ButtonPrompt.new( "select", Engine.Localize( "MPUI_AFTER_ACTION_REPORT" ), self, "open_aar", false, nil, false, nil, "TAB" )
		self:addRightButtonPrompt( self.aarPrompt )
	end
end

CoD.LeaguePlayPartyLobby.OpenAAR = function ( self, event )
	if CoD.AfterActionReport.ValidForLeagueTeam( event.controller ) then
		
	else
		
	end
end

LUI.createMenu.LeaguePlayPartyLobby = function ( controller )
	local leaguePlayLobby = CoD.PartyLobby.new( controller, "LeaguePlayPartyLobby", Engine.Localize( "MENU_LEAGUE_PLAY_CAPS" ) )
	leaguePlayLobby:addTitle( Engine.Localize( "MENU_LEAGUE_PLAY_CAPS" ) )
	leaguePlayLobby.populateButtonPaneElements = CoD.LeaguePlayPartyLobby.PopulateButtonPaneElements
	leaguePlayLobby.addLobbyPaneElements = CoD.LeaguePlayPartyLobby.AddLobbyPaneElements
	leaguePlayLobby.populateLobbyPaneElements = CoD.LeaguePlayPartyLobby.PopulateLobbyPaneElements
	leaguePlayLobby:updatePanelFunctions()
	leaguePlayLobby:registerEventHandler( "open_playlist_selection", CoD.LeaguePlayPartyLobby.OpenLeagueSelection )
	leaguePlayLobby:registerEventHandler( "league_changed", CoD.LeaguePlayPartyLobby.LeagueChanged )
	leaguePlayLobby:registerEventHandler( "playlist_selected", CoD.LeaguePlayPartyLobby.LeagueChanged )
	leaguePlayLobby:registerEventHandler( "go_to_finding_games", CoD.LeaguePlayPartyLobby.GoToFindingGames )
	leaguePlayLobby:registerEventHandler( "partylobby_update", CoD.LeaguePlayPartyLobby.Update )
	leaguePlayLobby:registerEventHandler( "open_league_leaderboard", CoD.LeaguePlayPartyLobby.OpenLeagueLeaderboard )
	leaguePlayLobby:registerEventHandler( "open_view_league_rules_popup", CoD.LeaguePlayPartyLobby.OpenViewLeagueRulesPopup )
	leaguePlayLobby:registerEventHandler( "open_aar", CoD.LeaguePlayPartyLobby.OpenAAR )
	leaguePlayLobby:setOwner( controller )
	CoD.LeaguePlayPartyLobby.PopulateButtons( leaguePlayLobby.buttonPane )
	CoD.LeaguePlayPartyLobby.AddButtonPrompts( leaguePlayLobby, controller )
	CoD.LeaguePlayPartyLobby.AddPlayerLeagueInfo( leaguePlayLobby.lobbyPane )
	leaguePlayLobby.lobbyPane:setSplitscreenSignInAllowed( false )
	CoD.LeaguePlayPartyLobby.SetCurrentLeague( leaguePlayLobby, controller )
	return leaguePlayLobby
end

local ViewLeagueRulesPopup_LeagueChanged = function ( self, event )
	self.infoContainer.icon:setImage( RegisterMaterial( Engine.GetPlaylistIconName( event.controller, Engine.GetPlaylistID() ) ) )
	self.infoContainer.titleElement:setText( Engine.GetPlaylistName( event.controller, Engine.GetPlaylistID() ) )
	self.infoContainer.description:setText( Engine.GetPlaylistDesc( event.controller, Engine.GetPlaylistID() ) )
end

LUI.createMenu.ViewLeagueRulesPopup = function ( controller )
	local self = CoD.Menu.New( "EnterTeamNamePopup" )
	self:addLargePopupBackground()
	self:addBackButton()
	self:registerEventHandler( "league_changed", ViewLeagueRulesPopup_LeagueChanged )
	local infoContainerWidth = 388
	self.infoContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -infoContainerWidth / 2,
		right = infoContainerWidth / 2,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	self:addElement( self.infoContainer )
	local iconWidth = 384
	local iconHeight = iconWidth / 2
	local infoItemTop = 0
	self.infoContainer.icon = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -iconWidth / 2,
		right = iconWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + iconHeight,
		alpha = 1
	} )
	self.infoContainer.icon:setImage( RegisterMaterial( Engine.GetPlaylistIconName( controller, Engine.GetPlaylistID() ) ) )
	self.infoContainer:addElement( self.infoContainer.icon )
	local infoWidth = infoContainerWidth
	self.infoContainer.infoWidth = infoWidth
	infoItemTop = infoItemTop + iconHeight + 15
	self.infoContainer.titleElement = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -infoWidth / 2,
		right = infoWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + CoD.textSize.Big,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Center
	} )
	self.infoContainer.titleElement:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.infoContainer.titleElement:setText( Engine.GetPlaylistName( controller, Engine.GetPlaylistID() ) )
	self.infoContainer:addElement( self.infoContainer.titleElement )
	infoItemTop = infoItemTop + CoD.textSize.Big * 2 + 5
	self.infoContainer.description = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -infoWidth / 2,
		right = infoWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	self.infoContainer.description:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.infoContainer.description:setText( Engine.GetPlaylistDesc( controller, Engine.GetPlaylistID() ) )
	self.infoContainer:addElement( self.infoContainer.description )
	return self
end

