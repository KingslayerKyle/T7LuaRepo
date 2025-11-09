require( "ui.T6.DisplayStatBox" )
require( "ui.T6.PlayerIdentity" )
require( "ui_mp.T6.Menus.LeagueLeaderboard" )
require( "ui_mp.T6.Menus.MiniIdentity" )

CoD.LobbyPanes = {}
CoD.LobbyPanes.VoipOffset = 32
CoD.LobbyPanes.addButtonPaneElements = function ( self )
	CoD.PanelManager.AddPanelElements( self )
	self.body.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.ButtonList.DefaultWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0,
		alpha = 1
	} )
	self.body.buttonList:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	self.body.buttonList:setPriority( 10 )
	self.body.buttonList.id = self.id .. ".LobbyButtons"
	self.body.buttonList.pane = self
	self.body.buttonList.addButton = CoD.Lobby.ButtonListAddButton
	self.body.buttonList:registerEventHandler( "gain_focus", CoD.Lobby.ButtonListGainFocus )
	self.body.buttonList:registerEventHandler( "lose_focus", CoD.Lobby.ButtonListLoseFocus )
	self.body:addElement( self.body.buttonList )
	self:dispatchEventToParent( {
		name = "add_select_button"
	} )
end

CoD.LobbyPanes.addLobbyPaneElements = function ( self, headerText, maxLocalPlayers, enableSearchingRows, showMissingDLC )
	CoD.PanelManager.AddPanelElements( self )
	if headerText ~= nil then
		self.headerText = headerText
	end
	if maxLocalPlayers ~= nil then
		self.maxLocalPlayers = maxLocalPlayers
	end
	if enableSearchingRows ~= nil then
		self.enableSearchingRows = enableSearchingRows
	end
	if showMissingDLC ~= nil then
		self.showMissingDLC = showMissingDLC
	end
	local controller = self.m_ownerController
	local lobbyListDefaultAnimationState = {
		leftAnchor = true,
		rightAnchor = true,
		left = CoD.LobbyPanes.VoipOffset,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight,
		bottom = CoD.Menu.TitleHeight + 1000
	}
	self.body.lobbyList = CoD.LobbyPlayerLists.New( lobbyListDefaultAnimationState, controller, self.headerText, self.id, self.maxLocalPlayers, self.enableSearchingRows, self.showMissingDLC )
	self.body.lobbyList.pane = self
	self.body:addElement( self.body.lobbyList )
	if self.splitscreenSignInAllowed == false then
		self.body.lobbyList:setSplitscreenSignInAllowed( false )
	end
	self:dispatchEventToParent( {
		name = "add_select_button"
	} )
end

CoD.LobbyPanes.addOverviewPaneElements = function ( self )
	CoD.PanelManager.AddPanelElements( self )
	self:dispatchEventToParent( {
		name = "add_select_button"
	} )
end

CoD.LobbyPanes.addStatsPaneElements = function ( self )
	CoD.PanelManager.AddPanelElements( self )
	self:dispatchEventToParent( {
		name = "remove_select_button"
	} )
end

CoD.LobbyPanes.ButtonPaneSetFocus = function ( self )
	self.body.buttonList:processEvent( {
		name = "gain_focus"
	} )
end

CoD.LobbyPanes.LobbyPaneSetFocus = function ( self )
	CoD.LobbyPlayerLists.SetFocus( self.body.lobbyList )
end

CoD.LobbyPanes.OverviewPaneSetFocus = function ( self )
	
end

CoD.LobbyPanes.StatsPaneSetFocus = function ( self )
	
end

CoD.LobbyPanes.populateButtonPaneElements = function ( self )
	
end

CoD.LobbyPanes.populateLobbyPaneElements = function ( self )
	CoD.Lobby.LobbyListUpdate( self, Engine.GetPlayersInLobby() )
end

CoD.LobbyPanes.populateOverviewPaneElements = function ( self )
	if self.body.overviewContainer ~= nil then
		self.body.overviewContainer:removeAllChildren()
	end
	if self.selectedPlayerXuid == nil then
		return 
	end
	local playerInfo = Engine.GetPlayerInfoByXuid( self.controller, self.selectedPlayerXuid )
	local leagueInfo = Engine.GetLeagueTeamInfo( self.controller, self.selectedLeagueTeamID )
	if leagueInfo then
		leagueInfo.leagueTeamMemberCount = self.leagueTeamMemberCount
	end
	self.body.overviewContainer = LUI.UIElement.new()
	self.body.overviewContainer:setLeftRight( true, true, 0, 0 )
	self.body.overviewContainer:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	self.body:addElement( self.body.overviewContainer )
	if CoD.isZombie == false then
		CoD.LobbyPanes.populateOverviewPaneElements_Multiplayer( self, playerInfo, leagueInfo )
	else
		CoD.LobbyPanes.populateOverviewPaneElements_Zombies( self, playerInfo )
	end
end

CoD.LobbyPanes.UpdateDirectionalAssistance = function ( self, text, arrowSideAlignment )
	local arrowOffset = 5
	local arrowSize = CoD.textSize.Default
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( text, CoD.fonts.Default, CoD.textSize.Default )
	self.directionalAssistanceLabel:setText( text )
	self.leftArrow:setAlpha( 0 )
	self.rightArrow:setAlpha( 0 )
	if arrowSideAlignment == LUI.Alignment.Left then
		self.leftArrow:setLeftRight( false, false, -(textRight / 2) - arrowOffset, -(textRight / 2) - arrowOffset - arrowSize )
		self.leftArrow:setAlpha( 1 )
	elseif arrowSideAlignment == LUI.Alignment.Right then
		self.rightArrow:setLeftRight( false, false, textRight / 2 + arrowOffset, textRight / 2 + arrowOffset + arrowSize )
		self.rightArrow:setAlpha( 1 )
	end
end

CoD.LobbyPanes.OverviewSlideLeft = function ( self, event )
	if event.isCurrentPanel ~= nil and event.isCurrentPanel == false then
		CoD.LobbyPanes.UpdateDirectionalAssistance( self, Engine.Localize( "MENU_CAREER_OVERVIEW" ), LUI.Alignment.Right )
	end
end

CoD.LobbyPanes.OverviewSlideRight = function ( self, event )
	if event.isCurrentPanel ~= nil and event.isCurrentPanel == true then
		CoD.LobbyPanes.UpdateDirectionalAssistance( self, Engine.Localize( "MENU_LOBBY_LIST" ), LUI.Alignment.Left )
	end
end

CoD.LobbyPanes.populateOverviewPaneElements_Multiplayer = function ( self, playerInfo, leagueInfo )
	local top = 0
	local sideOffset = 20
	local paneWidth = CoD.Menu.Width / 2 - sideOffset * 2
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		self.titleText = Engine.Localize( "MENU_X_LEAGUE_OVERVIEW", self.selectedPlayerName )
	else
		self.titleText = Engine.Localize( "MENU_N_CAREER_OVERVIEW", self.selectedPlayerName )
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false then
		local playerIdentityTitleLabel = LUI.UIText.new()
		playerIdentityTitleLabel:setLeftRight( true, false, sideOffset, sideOffset + paneWidth )
		playerIdentityTitleLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
		playerIdentityTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		playerIdentityTitleLabel:setAlpha( 0.4 )
		playerIdentityTitleLabel:setFont( CoD.fonts.Default )
		playerIdentityTitleLabel:setAlignment( LUI.Alignment.Left )
		playerIdentityTitleLabel:setText( Engine.Localize( "MENU_PLAYER_IDENTITY" ) )
		self.body.overviewContainer:addElement( playerIdentityTitleLabel )
	elseif self.selectedPlayerShowTruePlayerInfo ~= false and leagueInfo.teamName then
		local teamTitleText = Engine.Localize( "MENU_TEAM" )
		local teamTitleLabel = LUI.UIText.new()
		teamTitleLabel:setLeftRight( true, false, sideOffset, sideOffset + paneWidth )
		teamTitleLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
		teamTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		teamTitleLabel:setAlpha( 0.4 )
		teamTitleLabel:setFont( CoD.fonts.Default )
		teamTitleLabel:setAlignment( LUI.Alignment.Left )
		teamTitleLabel:setText( teamTitleText )
		self.body.overviewContainer:addElement( teamTitleLabel )
		local textLeft, textTop, textRight, textBottom = GetTextDimensions( teamTitleText, CoD.fonts.Default, CoD.textSize.Default )
		local teamNameOffset = 5
		local teamNameLeft = sideOffset + textRight + teamNameOffset
		local teamNameLabel = LUI.UIText.new()
		teamNameLabel:setLeftRight( true, false, teamNameLeft, teamNameLeft + paneWidth )
		teamNameLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
		teamNameLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		teamNameLabel:setFont( CoD.fonts.Default )
		teamNameLabel:setAlignment( LUI.Alignment.Left )
		teamNameLabel:setText( leagueInfo.teamName )
		self.body.overviewContainer:addElement( teamNameLabel )
	end
	top = top + CoD.textSize.Default
	local displayMode = CoD.PlayerIdentity.Default
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		displayMode = CoD.PlayerIdentity.League
	end
	if Engine.IsGameLobbyRunning() or displayMode == CoD.PlayerIdentity.League or Engine.GetXUID( self.controller ) == self.selectedPlayerXuid or playerInfo.status == nil or playerInfo.status == "" then
		local f15_local0 = false
	else
		local showJoinableContainer = true
	end
	local playerIdentityDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = sideOffset,
		right = sideOffset + paneWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = top,
		bottom = 0
	}
	local playerIdentity, textRight = CoD.PlayerIdentity.New( playerIdentityDefaultAnimState, paneWidth, displayMode, f15_local0 )
	self.body.overviewContainer:addElement( playerIdentity )
	playerIdentity:update( self.controller, self.selectedPlayerShowTruePlayerInfo, self.selectedPlayerXuid, playerInfo, leagueInfo )
	top = top + textRight + 15
	self.body.overviewContainer.directionalAssistanceLabel = LUI.UIText.new()
	self.body.overviewContainer.directionalAssistanceLabel:setLeftRight( true, true, 0, 0 )
	self.body.overviewContainer.directionalAssistanceLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	self.body.overviewContainer.directionalAssistanceLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.body.overviewContainer.directionalAssistanceLabel:setFont( CoD.fonts.Default )
	self.body.overviewContainer.directionalAssistanceLabel:setAlignment( LUI.Alignment.Center )
	self.body.overviewContainer:addElement( self.body.overviewContainer.directionalAssistanceLabel )
	local arrowSize = CoD.textSize.Default
	self.body.overviewContainer.leftArrow = LUI.UIImage.new()
	self.body.overviewContainer.leftArrow:setLeftRight( false, false, 0, 0 )
	self.body.overviewContainer.leftArrow:setTopBottom( true, false, top, top + arrowSize )
	self.body.overviewContainer.leftArrow:setImage( RegisterMaterial( "ui_arrow_right" ) )
	self.body.overviewContainer.leftArrow:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.body.overviewContainer.leftArrow:setAlpha( 0 )
	self.body.overviewContainer:addElement( self.body.overviewContainer.leftArrow )
	self.body.overviewContainer.rightArrow = LUI.UIImage.new()
	self.body.overviewContainer.rightArrow:setLeftRight( false, false, 0, 0 )
	self.body.overviewContainer.rightArrow:setTopBottom( true, false, top, top + arrowSize )
	self.body.overviewContainer.rightArrow:setImage( RegisterMaterial( "ui_arrow_right" ) )
	self.body.overviewContainer.rightArrow:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.body.overviewContainer.rightArrow:setAlpha( 0 )
	self.body.overviewContainer:addElement( self.body.overviewContainer.rightArrow )
	local directionalAssistanceText = Engine.Localize( "MENU_CAREER_OVERVIEW" )
	CoD.LobbyPanes.UpdateDirectionalAssistance( self.body.overviewContainer, directionalAssistanceText, LUI.Alignment.Right )
	local isGameLobbyRunning = Engine.IsGameLobbyRunning()
	local f15_local1 = isGameLobbyRunning
	local inPublicGameLobby = Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH )
	local f15_local2 = f15_local1 and inPublicGameLobby
	local f15_local3 = isGameLobbyRunning
	local inLeagueGameLobby = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
	if CoD.isZombie == false and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not f15_local2 and not (f15_local3 and inLeagueGameLobby) then
		CoD.LobbyPanes.AddMissingDLCNames( self, playerInfo, sideOffset )
	end
	self.body.overviewContainer:registerEventHandler( "slide_left", CoD.LobbyPanes.OverviewSlideLeft )
	self.body.overviewContainer:registerEventHandler( "slide_right", CoD.LobbyPanes.OverviewSlideRight )
end

CoD.LobbyPanes.populateOverviewPaneElements_Zombies = function ( self, playerInfo )
	local emblemWidth = 200
	local emblemHeight = 200
	local emblemYOffset = 25
	self.body.emblemContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -emblemWidth / 2,
		right = emblemWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = emblemYOffset,
		bottom = emblemYOffset + emblemHeight
	} )
	self.body.overviewContainer:addElement( self.body.emblemContainer )
	self.body.emblem = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	local emblemMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, 3 )
	if playerInfo.daysPlayedInLast5Days == 5 then
		emblemMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, 4 )
	end
	if emblemMaterialName == "" then
		emblemMaterialName = "menu_zm_rank_1"
	end
	self.body.emblem:setImage( RegisterMaterial( emblemMaterialName ) )
	self.body.emblemContainer:addElement( self.body.emblem )
	local backingRatio = 0.25
	local backingWidth = emblemWidth + 50
	local backingHeight = backingWidth * backingRatio
	self.body.backingContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -backingWidth / 2,
		right = backingWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = emblemYOffset + emblemHeight,
		bottom = emblemYOffset + emblemHeight + backingHeight
	} )
	self.body.overviewContainer:addElement( self.body.backingContainer )
	local backingMaterial = RegisterMaterial( "menu_zm_gamertag" )
	self.body.backing = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		material = backingMaterial,
		alpha = 1
	} )
	self.body.backingContainer:addElement( self.body.backing )
	local textSize = CoD.textSize.Default
	local clanTag = ""
	if playerInfo.clanTag ~= nil then
		clanTag = playerInfo.clanTag
	end
	local playerName = self.selectedPlayerName
	if playerInfo.name == nil then
		playerName = playerInfo.name
	end
	self.body.gamerTag = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -1,
		right = 1,
		topAnchor = false,
		bottomAnchor = false,
		top = -textSize / 2,
		bottom = textSize / 2,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	self.body.gamerTag:setText( CoD.getClanTag( clanTag ) .. playerName )
	self.body.backingContainer:addElement( self.body.gamerTag )
	local statusYOffset = 20
	self.body.status = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -backingWidth / 2,
		right = backingWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = emblemYOffset + emblemHeight + backingHeight + statusYOffset,
		bottom = emblemYOffset + emblemHeight + backingHeight + statusYOffset + textSize,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	local playerStatus = ""
	if playerInfo.status ~= nil then
		playerStatus = playerInfo.status
	end
	self.body.status:setText( playerStatus )
	self.body.overviewContainer:addElement( self.body.status )
	local joinableContainer = LUI.UIElement.new()
	local joinableWidth = 150
	local joinableHeight = joinableWidth * 0.25
	joinableContainer:setLeftRight( false, false, -joinableWidth / 2, joinableWidth / 2 )
	joinableContainer:setTopBottom( true, false, emblemYOffset + emblemHeight + backingHeight + statusYOffset + textSize, emblemYOffset + emblemHeight + backingHeight + statusYOffset + textSize + joinableHeight + 10 )
	self.body.overviewContainer:addElement( joinableContainer )
	local joinableFontName = "Condensed"
	local joinableFont = CoD.fonts[joinableFontName]
	local joinableFontHeight = CoD.textSize[joinableFontName]
	local joinableTextSpacing = 5
	local joinableHeight = joinableFontHeight + joinableTextSpacing * 2
	local joinableText = LUI.UIText.new()
	joinableText:setLeftRight( false, false, 0, 0 )
	joinableText:setTopBottom( true, false, 0, joinableFontHeight )
	joinableText:setFont( joinableFont )
	joinableText:setAlignment( LUI.Alignment.Center )
	local joinableIconSize = joinableHeight - joinableTextSpacing * 2
	local joinableIcon = LUI.UIImage.new()
	joinableIcon:setLeftRight( true, false, 0, joinableIconSize )
	joinableIcon:setTopBottom( true, false, 0, joinableIconSize )
	joinableIcon:setImage( RegisterMaterial( "menu_mp_party_ease_icon" ) )
	joinableIcon:setAlignment( LUI.Alignment.Left )
	joinableContainer:addElement( joinableIcon )
	joinableContainer:addElement( joinableText )
	local joinable = Engine.IsPlayerJoinable( self.controller, playerInfo.xuid )
	if joinable.isJoinable then
		joinableText:setText( Engine.Localize( "MENU_JOINABLE" ) )
		joinableIcon:setAlpha( 1 )
	else
		joinableText:setText( "" )
		joinableIcon:setAlpha( 0 )
	end
	if playerInfo.rank ~= nil then
		if playerInfo.rank == "0" then
			playerInfo.rank = "1"
		end
		local daysMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, playerInfo.daysPlayedInLast5Days + 5 )
		local iconWidth = emblemWidth / 4
		local iconHeight = iconWidth
		self.body.rankIconContainer = LUI.UIElement.new( {
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			right = iconWidth,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = iconHeight
		} )
		self.body.emblemContainer:addElement( self.body.rankIconContainer )
		self.body.rankIcon = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0,
			alpha = 1,
			material = RegisterMaterial( daysMaterialName )
		} )
		self.body.rankIconContainer:addElement( self.body.rankIcon )
	end
end

CoD.LobbyPanes.AddMissingDLCNames = function ( self, playerInfo, sideOffset )
	local missingDLCContainer = LUI.UIElement.new()
	missingDLCContainer:setLeftRight( true, true, sideOffset, -sideOffset )
	missingDLCContainer:setTopBottom( false, true, -(CoD.CoD9Button.Height * 3) - CoD.ButtonPrompt.Height, -CoD.ButtonPrompt.Height )
	missingDLCContainer:setAlpha( 0 )
	self.body.overviewContainer:addElement( missingDLCContainer )
	local warningIconSize = 24
	local warningSpacing = 5
	missingDLCContainer.warningIcon = LUI.UIImage.new()
	missingDLCContainer.warningIcon:setLeftRight( true, false, 0, warningIconSize )
	missingDLCContainer.warningIcon:setTopBottom( true, false, 0, warningIconSize )
	missingDLCContainer.warningIcon:setImage( RegisterMaterial( "cac_restricted" ) )
	missingDLCContainer:addElement( missingDLCContainer.warningIcon )
	local warningFontName = "Default"
	local warningFont = CoD.fonts[warningFontName]
	local warningFontHeight = CoD.textSize[warningFontName]
	missingDLCContainer.warningLabel = LUI.UIText.new()
	missingDLCContainer.warningLabel:setLeftRight( true, true, warningIconSize + warningSpacing, 0 )
	missingDLCContainer.warningLabel:setTopBottom( true, false, 0, warningFontHeight )
	missingDLCContainer.warningLabel:setFont( warningFont )
	missingDLCContainer.warningLabel:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
	missingDLCContainer.warningLabel:setAlignment( LUI.Alignment.Left )
	missingDLCContainer:addElement( missingDLCContainer.warningLabel )
	local missingDLCCount = 0
	local missingDLCNames = ""
	local missingDLC = Engine.PartyGetMissingMapPacks( playerInfo.xuid )
	if missingDLC == nil or #missingDLC <= 0 then
		local f17_local0 = false
	else
		local playerIsMissingDLC = true
	end
	if f17_local0 then
		missingDLCContainer:setAlpha( 1 )
		for dlcIndex, dlc in ipairs( missingDLC ) do
			if missingDLCCount >= 1 then
				missingDLCNames = missingDLCNames .. ", "
			end
			missingDLCNames = missingDLCNames .. Engine.Localize( "MENU_" .. dlc .. "_MAP_PACK_NAME" )
			missingDLCCount = missingDLCCount + 1
		end
	else
		missingDLCContainer:setAlpha( 0 )
	end
	if missingDLCCount == 1 then
		missingDLCContainer.warningLabel:setText( Engine.Localize( "MPUI_MISSING_MAP_PACK" ) .. " " .. missingDLCNames )
	elseif missingDLCCount > 1 then
		missingDLCContainer.warningLabel:setText( Engine.Localize( "MPUI_MISSING_MAP_PACKS" ) .. " " .. missingDLCNames )
	else
		missingDLCContainer.warningLabel:setText( "" )
	end
end

CoD.LobbyPanes.populateStatsPaneElements = function ( self, controller )
	if self.body.statsContainer ~= nil then
		self.body.statsContainer:removeAllChildren()
	end
	if self.selectedPlayerXuid == nil then
		return 
	end
	self.body.statsContainer = LUI.UIElement.new()
	self.body.statsContainer:setLeftRight( true, true, 0, 0 )
	self.body.statsContainer:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	self.body:addElement( self.body.statsContainer )
	if CoD.isZombie == false then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false then
			local playerInfo = Engine.GetPlayerInfoByXuid( self.controller, self.selectedPlayerXuid )
			CoD.LobbyPanes.populateStatsPaneElements_Multiplayer( self, playerInfo )
		else
			local leagueInfo = Engine.GetLeagueTeamInfo( self.controller, self.selectedLeagueTeamID )
			CoD.LobbyPanes.populateStatsPaneElements_MultiplayerLeague( self, leagueInfo )
		end
	else
		CoD.LobbyPanes.populateStatsPaneElements_Zombies( self )
	end
end

CoD.LobbyPanes.populateStatsPaneElements_Multiplayer = function ( self, playerInfo )
	local top = 0
	local sideOffset = 20
	local backgroundInset = 4
	local paneWidth = CoD.Menu.Width / 2 - sideOffset * 2
	local backingWidth = paneWidth * 0.66 + 4
	local backingHeight = backingWidth / 4
	local emblemPaneHeight = backingHeight * 5 - 1
	local statsFontName = "Default"
	local statsFont = CoD.fonts[statsFontName]
	local statsFontHeight = CoD.textSize[statsFontName]
	local careerTitleLabel = LUI.UIText.new()
	careerTitleLabel:setLeftRight( true, false, sideOffset, sideOffset + paneWidth )
	careerTitleLabel:setTopBottom( true, false, top, top + statsFontHeight )
	careerTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	careerTitleLabel:setAlpha( 0.4 )
	careerTitleLabel:setFont( statsFont )
	careerTitleLabel:setAlignment( LUI.Alignment.Left )
	careerTitleLabel:setText( Engine.Localize( "MENU_PUBLIC_MATCH_CAREER" ) )
	self.body.statsContainer:addElement( careerTitleLabel )
	top = top + statsFontHeight
	local careerInfoContainerWidth = backingWidth / 2
	local careerInfoContainerHeight = emblemPaneHeight / 2
	local careerInfoContainerLeft = sideOffset
	local killsContainer = LUI.UIElement.new()
	killsContainer:setLeftRight( true, false, careerInfoContainerLeft, careerInfoContainerLeft + careerInfoContainerWidth )
	killsContainer:setTopBottom( true, false, top, top + careerInfoContainerHeight )
	self.body.statsContainer:addElement( killsContainer )
	local killsContainerBackground = LUI.UIImage.new()
	killsContainerBackground:setLeftRight( true, true, 1, -1 )
	killsContainerBackground:setTopBottom( true, true, 1, -1 )
	killsContainerBackground:setRGB( 0, 0, 0 )
	killsContainerBackground:setAlpha( 0.4 )
	killsContainer:addElement( killsContainerBackground )
	local killsContainerBackgroundGrad = LUI.UIImage.new()
	killsContainerBackgroundGrad:setLeftRight( true, true, backgroundInset, -backgroundInset )
	killsContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, 80 )
	killsContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	killsContainerBackgroundGrad:setAlpha( 0.1 )
	killsContainer:addElement( killsContainerBackgroundGrad )
	if playerInfo.kills then
		local titleOffset = 10
		local killsContainerTitleLabel = LUI.UIText.new()
		killsContainerTitleLabel:setLeftRight( true, true, 0, 0 )
		killsContainerTitleLabel:setTopBottom( false, false, -titleOffset - statsFontHeight, -titleOffset )
		killsContainerTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		killsContainerTitleLabel:setAlpha( 0.5 )
		killsContainerTitleLabel:setAlignment( LUI.Alignment.Center )
		killsContainerTitleLabel:setText( Engine.Localize( "MPUI_KILLS" ) )
		killsContainer:addElement( killsContainerTitleLabel )
		local countFontName = "Big"
		local countFont = CoD.fonts[countFontName]
		local countFontHeight = CoD.textSize[countFontName]
		local countOffset = -10
		local killsContainerCountLabel = LUI.UIText.new()
		killsContainerCountLabel:setLeftRight( true, true, 0, 0 )
		killsContainerCountLabel:setTopBottom( false, false, countOffset, countOffset + countFontHeight )
		killsContainerCountLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		killsContainerCountLabel:setFont( countFont )
		killsContainerCountLabel:setAlignment( LUI.Alignment.Center )
		killsContainerCountLabel:setText( playerInfo.kills )
		killsContainer:addElement( killsContainerCountLabel )
	end
	killsContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	killsContainer:addElement( killsContainer.border )
	careerInfoContainerLeft = careerInfoContainerLeft + careerInfoContainerWidth
	local winsContainer = LUI.UIElement.new()
	winsContainer:setLeftRight( true, false, careerInfoContainerLeft, careerInfoContainerLeft + careerInfoContainerWidth )
	winsContainer:setTopBottom( true, false, top, top + careerInfoContainerHeight )
	self.body.statsContainer:addElement( winsContainer )
	local winsContainerBackground = LUI.UIImage.new()
	winsContainerBackground:setLeftRight( true, true, 1, -1 )
	winsContainerBackground:setTopBottom( true, true, 1, -1 )
	winsContainerBackground:setRGB( 0, 0, 0 )
	winsContainerBackground:setAlpha( 0.4 )
	winsContainer:addElement( winsContainerBackground )
	local winsContainerBackgroundGrad = LUI.UIImage.new()
	winsContainerBackgroundGrad:setLeftRight( true, true, backgroundInset - 1, -backgroundInset )
	winsContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, 80 )
	winsContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	winsContainerBackgroundGrad:setAlpha( 0.1 )
	winsContainer:addElement( winsContainerBackgroundGrad )
	if playerInfo.wins then
		local titleOffset = 10
		local winsContainerTitleLabel = LUI.UIText.new()
		winsContainerTitleLabel:setLeftRight( true, true, 0, 0 )
		winsContainerTitleLabel:setTopBottom( false, false, -titleOffset - statsFontHeight, -titleOffset )
		winsContainerTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		winsContainerTitleLabel:setAlpha( 0.5 )
		winsContainerTitleLabel:setAlignment( LUI.Alignment.Center )
		winsContainerTitleLabel:setText( Engine.Localize( "MPUI_WINS" ) )
		winsContainer:addElement( winsContainerTitleLabel )
		local countFontName = "Big"
		local countFont = CoD.fonts[countFontName]
		local countFontHeight = CoD.textSize[countFontName]
		local countOffset = -10
		local winsContainerCountLabel = LUI.UIText.new()
		winsContainerCountLabel:setLeftRight( true, true, 0, 0 )
		winsContainerCountLabel:setTopBottom( false, false, countOffset, countOffset + countFontHeight )
		winsContainerCountLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		winsContainerCountLabel:setFont( countFont )
		winsContainerCountLabel:setAlignment( LUI.Alignment.Center )
		winsContainerCountLabel:setText( playerInfo.wins )
		winsContainer:addElement( winsContainerCountLabel )
	end
	winsContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	winsContainer.border.leftBorder:close()
	winsContainer:addElement( winsContainer.border )
	top = top + careerInfoContainerHeight + 20
	local showcaseTitleLabel = LUI.UIText.new()
	showcaseTitleLabel:setLeftRight( true, false, sideOffset, sideOffset + paneWidth )
	showcaseTitleLabel:setTopBottom( true, false, top, top + statsFontHeight )
	showcaseTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	showcaseTitleLabel:setAlpha( 0.4 )
	showcaseTitleLabel:setAlignment( LUI.Alignment.Left )
	showcaseTitleLabel:setText( Engine.Localize( "MENU_SHOWCASE" ) )
	self.body.statsContainer:addElement( showcaseTitleLabel )
	top = top + statsFontHeight
	local maxBackings = 3
	local backingSpacing = 10
	for backingIndex = 1, maxBackings, 1 do
		local backingContainer = LUI.UIElement.new()
		backingContainer:setLeftRight( true, false, sideOffset, sideOffset + backingWidth )
		backingContainer:setTopBottom( true, false, top, top + backingHeight )
		self.body.statsContainer:addElement( backingContainer )
		local backingContainerBackground = LUI.UIImage.new()
		backingContainerBackground:setLeftRight( true, true, 1, -1 )
		backingContainerBackground:setTopBottom( true, true, 1, -1 )
		backingContainerBackground:setRGB( 0, 0, 0 )
		backingContainerBackground:setAlpha( 0.4 )
		backingContainer:addElement( backingContainerBackground )
		local backingContainerBackgroundGrad = LUI.UIImage.new()
		backingContainerBackgroundGrad:setLeftRight( true, true, backgroundInset - 1, -backgroundInset )
		backingContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, backingHeight * 0.4 )
		backingContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
		backingContainerBackgroundGrad:setAlpha( 0.1 )
		backingContainer:addElement( backingContainerBackgroundGrad )
		local backing = LUI.UIImage.new()
		backing:setLeftRight( true, true, 2, -2 )
		backing:setTopBottom( true, true, 2, -2 )
		backing:setAlpha( 0 )
		backingContainer:addElement( backing )
		local titleOffset = 2
		local backingContainerTitleLabel = LUI.UIText.new()
		backingContainerTitleLabel:setLeftRight( true, true, titleOffset + 2, 0 )
		backingContainerTitleLabel:setTopBottom( false, true, -titleOffset - statsFontHeight, -titleOffset )
		backingContainerTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		backingContainerTitleLabel:setAlignment( LUI.Alignment.Left )
		backingContainerTitleLabel:setText( "" )
		backingContainer:addElement( backingContainerTitleLabel )
		backingContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
		backingContainer:addElement( backingContainer.border )
		local backgroundId = nil
		if self.selectedPlayerXuid and self.selectedPlayerXuid ~= "" and self.selectedPlayerXuid ~= "0" then
			backgroundId = Engine.GetCombatRecordBackgroundId( self.controller, self.selectedPlayerXuid, backingIndex - 1 )
		end
		if backgroundId and backgroundId ~= 0 then
			backing:setupDrawBackgroundById( backgroundId )
			backing:setAlpha( 1 )
			local bgChallengeInfo = CoD.EmblemBackgroundSelector.GetChallengeInformation( self.controller, backgroundId )
			if bgChallengeInfo and bgChallengeInfo.challengeName then
				backingContainerTitleLabel:setText( bgChallengeInfo.challengeName )
			else
				local challengeName = CoD.EmblemBackgroundSelector.GetDefaultBackgroundName( self.controller, backgroundId )
				backingContainerTitleLabel:setText( Engine.Localize( challengeName ) )
			end
		end
		top = top + backingHeight + backingSpacing
	end
end

CoD.LobbyPanes.LeagueLB_ButtonCreator = function ( controller, mutables )
	mutables.loading = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Default / 2,
		bottom = CoD.textSize.Default / 2,
		font = CoD.fonts.Default,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		alignment = LUI.Alignment.Center
	} )
	mutables:addElement( mutables.loading )
	mutables.lbrank = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = CoD.LeagueLeaderboard.LBRANK_XLEFT + CoD.LeagueLeaderboard.PADDING,
		right = CoD.LeagueLeaderboard.LBRANK_XRIGHT - CoD.LeagueLeaderboard.PADDING,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Default / 2,
		bottom = CoD.textSize.Default / 2,
		font = CoD.fonts.Default,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		alignment = LUI.Alignment.Right
	} )
	mutables:addElement( mutables.lbrank )
	mutables.name = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = CoD.LeagueLeaderboard.NAME_XLEFT + CoD.LeagueLeaderboard.PADDING,
		right = CoD.LeagueLeaderboard.NAME_XLEFT - CoD.LeagueLeaderboard.PADDING,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Default / 2,
		bottom = CoD.textSize.Default / 2,
		font = CoD.fonts.Default,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		alignment = LUI.Alignment.Left
	} )
	mutables:addElement( mutables.name )
	mutables.dataCol = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = CoD.LeagueLeaderboard.NAME_XRIGHT + CoD.LeagueLeaderboard.PADDING,
		right = -20,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Default / 2,
		bottom = CoD.textSize.Default / 2,
		font = CoD.fonts.Default,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		alignment = LUI.Alignment.Right
	} )
	mutables:addElement( mutables.dataCol )
end

local UpdateStatsPaneElements = function ( self, event )
	if event.success and self.leagueInfo and self.leagueInfo.teamID and event.teamID == self.leagueInfo.teamID then
		CoD.LobbyPanes.populateStatsPaneElements_MultiplayerLeague( self, self.leagueInfo )
	end
end

CoD.LobbyPanes.populateStatsPaneElements_MultiplayerLeague = function ( self, leagueInfo )
	if not self or not self.body or not self.body.statsContainer then
		return 
	end
	local top = CoD.textSize.Default - 8
	local sideOffset = 20
	local backgroundInset = 4
	local paneWidth = CoD.Menu.Width / 2 - sideOffset
	local statsFontName = "Default"
	local statsFont = CoD.fonts[statsFontName]
	local statsFontHeight = CoD.textSize[statsFontName]
	local leagueTitleFontName = "Big"
	local leagueTitleFont = CoD.fonts[leagueTitleFontName]
	local leagueTitleFontHeight = CoD.textSize[leagueTitleFontName]
	local subdivisionFontName = "ExtraSmall"
	local subdivisionFont = CoD.fonts[subdivisionFontName]
	local subdivisionFontHeight = CoD.textSize[subdivisionFontName]
	local currLeagueInfo = Engine.GetLeague()
	local currTeamID = leagueInfo.teamID
	local controller = self.controller
	local inPlacement = false
	local isPreSeason = false
	local leagueLbData, leaderboardData, fetchStatus, subdivisionInfos, divisionIconAndBracketPos, teamSubdivisionInfo = nil
	if not currLeagueInfo or not CoD.PlayerIdentity.ShowLeagueInfo( leagueInfo ) then
		return 
	end
	self.leagueInfo = leagueInfo
	local currLeagueID = currLeagueInfo.id
	isPreSeason = Engine.LeagueIsPreSeason( currLeagueID )
	self:registerEventHandler( "league_team_all_info_fetched", UpdateStatsPaneElements )
	self:registerEventHandler( "league_lb_data_fetched", UpdateStatsPaneElements )
	local numResults = 5
	local fetched = Engine.FetchAllInfoForTeamInLeague( controller, currTeamID, currLeagueID, numResults )
	local spinnerSize = 128
	if not self.spinner then
		self.spinner = CoD.GetCenteredImage( spinnerSize, spinnerSize, "lui_loader" )
		self.body.statsContainer:addElement( self.spinner )
	end
	if not fetched then
		return 
	end
	local fetchStatus, subdivisionInfos = Engine.GetLeagueTeamSubdivisionInfos( controller, currTeamID )
	if fetchStatus ~= "fetched" then
		return 
	elseif subdivisionInfos then
		teamSubdivisionInfo = CoD.PlayerIdentity.FindTeamSubdivisionInfo( subdivisionInfos, currLeagueID )
		if not teamSubdivisionInfo then
			inPlacement = true
		end
	end
	leaderboardData = Engine.GetLeagueLbData( controller )
	if leaderboardData then
		leagueLbData = CoD.PlayerIdentity.FindLeagueLbData( leaderboardData, currTeamID )
	end
	local subdivisionName = ""
	if not isPreSeason and not inPlacement and teamSubdivisionInfo and teamSubdivisionInfo.subdivisionName then
		subdivisionName = Engine.Localize( "MENU_SUBDIVISION_X", teamSubdivisionInfo.subdivisionName )
	end
	local leagueDivisionText = ""
	if isPreSeason then
		leagueDivisionText = Engine.Localize( "LEAGUE_PRESEASON" )
	elseif inPlacement then
		leagueDivisionText = Engine.Localize( "LEAGUE_AWAITING_PLACEMENT" )
	elseif teamSubdivisionInfo and teamSubdivisionInfo.divisionName then
		leagueDivisionText = Engine.ToUpper( teamSubdivisionInfo.divisionName )
	end
	self.spinner = nil
	self.body.statsContainer:removeAllChildren()
	local divisionTitleLabel = LUI.UIText.new()
	divisionTitleLabel:setLeftRight( true, false, sideOffset, sideOffset + paneWidth )
	divisionTitleLabel:setTopBottom( true, false, top, top + leagueTitleFontHeight )
	divisionTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	divisionTitleLabel:setFont( leagueTitleFont )
	divisionTitleLabel:setAlignment( LUI.Alignment.Left )
	divisionTitleLabel:setText( leagueDivisionText )
	self.body.statsContainer:addElement( divisionTitleLabel )
	top = top + leagueTitleFontHeight
	local subdivisionTitleLabel = LUI.UIText.new()
	subdivisionTitleLabel:setLeftRight( true, false, sideOffset, sideOffset + paneWidth )
	subdivisionTitleLabel:setTopBottom( true, false, top, top + subdivisionFontHeight )
	subdivisionTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	subdivisionTitleLabel:setFont( subdivisionFont )
	subdivisionTitleLabel:setAlignment( LUI.Alignment.Left )
	subdivisionTitleLabel:setText( subdivisionName )
	self.body.statsContainer:addElement( subdivisionTitleLabel )
	top = top + 10 + CoD.textSize.Default
	local leaderboardHeight = 250
	local leaderboardContainer = LUI.UIElement.new()
	leaderboardContainer:setLeftRight( true, false, sideOffset, sideOffset + paneWidth )
	leaderboardContainer:setTopBottom( true, false, top, top + leaderboardHeight )
	self.body.statsContainer:addElement( leaderboardContainer )
	local leaderboardHeader = LUI.UIElement.new()
	leaderboardHeader:setLeftRight( true, true, 0, 0 )
	leaderboardHeader:setTopBottom( true, false, 0, CoD.textSize.Default )
	local teamNameHeaderText = Engine.Localize( "MENU_TEAM" )
	if subdivisionInfos and subdivisionInfos.valid and subdivisionInfos.isSolo then
		teamNameHeaderText = Engine.Localize( "LEAGUE_SOLO_COMPETITOR" )
	end
	local rankLeft = 8
	local nameLeft = 70
	local rankHeader = CoD.LeagueLeaderboard.GetListBoxHeaderText( rankLeft, rankLeft, Engine.Localize( "MENU_RANK" ), "Left" )
	local teamNameHeader = CoD.LeagueLeaderboard.GetListBoxHeaderText( nameLeft, 0, teamNameHeaderText, "Left" )
	local rankPointsHeader = CoD.LeagueLeaderboard.GetListBoxHeaderText( 0, -8, Engine.Localize( "MENU_RANK_POINTS" ), "Right", true )
	rankHeader:setAlpha( 0.4 )
	teamNameHeader:setAlpha( 0.4 )
	rankPointsHeader:setAlpha( 0.4 )
	leaderboardHeader:addElement( rankHeader )
	leaderboardHeader:addElement( teamNameHeader )
	leaderboardHeader:addElement( rankPointsHeader )
	leaderboardContainer:addElement( leaderboardHeader )
	local leaderboardBlackBG = LUI.UIImage.new()
	leaderboardBlackBG:setLeftRight( true, true, 0, 0 )
	leaderboardBlackBG:setTopBottom( true, true, CoD.textSize.Default, 0 )
	leaderboardBlackBG:setRGB( 0, 0, 0 )
	leaderboardBlackBG:setAlpha( 0.25 )
	leaderboardContainer:addElement( leaderboardBlackBG )
	local listMaxItems = 5
	local listElementHeight = leaderboardHeight / listMaxItems
	local lbPreviewListDefaultAnimState = {
		left = 0,
		top = CoD.textSize.Default,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}
	if not inPlacement and not isPreSeason then
		local lbPreviewList = CoD.LeaderboardPreviewList.new( controller, lbPreviewListDefaultAnimState, listMaxItems, listElementHeight, nil, nil, true )
		lbPreviewList:registerEventHandler( "league_changed", CoD.NullFunction )
		lbPreviewList:processEvent( {
			name = "league_lb_data_fetched",
			controller = self.controller
		} )
		leaderboardContainer:addElement( lbPreviewList )
	elseif isPreSeason then
		leaderboardContainer:addElement( CoD.GetTextElem( "Default", Center, Engine.Localize( "LEAGUE_PRESEASON_DESC" ), CoD.gray, 50 ) )
	elseif inPlacement then
		leaderboardContainer:addElement( CoD.GetTextElem( "Default", Center, Engine.Localize( "LEAGUE_IN_PLACEMENT_MATCHES" ), CoD.gray, 50 ) )
	end
	top = top + leaderboardHeight + 15 + statsFontHeight
	local leagueInfoContainerWidth = paneWidth / 4
	local leagueInfoContainerHeight = 140
	local leagueInfoContainerLeft = sideOffset
	local topTeamContainer = LUI.UIElement.new()
	topTeamContainer:setLeftRight( true, false, leagueInfoContainerLeft, leagueInfoContainerLeft + leagueInfoContainerWidth )
	topTeamContainer:setTopBottom( true, false, top, top + leagueInfoContainerHeight )
	self.body.statsContainer:addElement( topTeamContainer )
	local topTeamContainerBackground = LUI.UIImage.new()
	topTeamContainerBackground:setLeftRight( true, true, 1, -1 )
	topTeamContainerBackground:setTopBottom( true, true, 1, -1 )
	topTeamContainerBackground:setRGB( 0, 0, 0 )
	topTeamContainerBackground:setAlpha( 0.4 )
	topTeamContainer:addElement( topTeamContainerBackground )
	local topTeamContainerBackgroundGrad = LUI.UIImage.new()
	topTeamContainerBackgroundGrad:setLeftRight( true, true, backgroundInset, -backgroundInset )
	topTeamContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, 80 )
	topTeamContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	topTeamContainerBackgroundGrad:setAlpha( 0.1 )
	topTeamContainer:addElement( topTeamContainerBackgroundGrad )
	if leagueLbData and not inPlacement and not isPreSeason then
		divisionIconAndBracketPos = Engine.GetLeagueDivisionIcon( teamSubdivisionInfo.divisionID, false, leagueLbData.rank )
	end
	local topTeamTop = 10
	local topTeamContainerTitleLabel = LUI.UIText.new()
	topTeamContainerTitleLabel:setLeftRight( true, true, 0, 0 )
	topTeamContainerTitleLabel:setTopBottom( true, false, topTeamTop, topTeamTop + CoD.textSize.ExtraSmall )
	topTeamContainerTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	topTeamContainerTitleLabel:setFont( CoD.fonts.ExtraSmall )
	topTeamContainerTitleLabel:setAlignment( LUI.Alignment.Center )
	if divisionIconAndBracketPos and divisionIconAndBracketPos.bracketRankPosition > 0 then
		topTeamContainer:addElement( topTeamContainerTitleLabel )
		topTeamContainerTitleLabel:setText( Engine.Localize( "MENU_LEAGUE_TOP_N", divisionIconAndBracketPos.bracketRankPosition ) )
	end
	topTeamTop = topTeamTop + statsFontHeight
	local divisionIconSize = leagueInfoContainerWidth - 8
	local divisionIconContainer = LUI.UIElement.new()
	divisionIconContainer:setLeftRight( false, false, -divisionIconSize / 2, divisionIconSize / 2 )
	divisionIconContainer:setTopBottom( true, false, topTeamTop, topTeamTop + divisionIconSize )
	topTeamContainer:addElement( divisionIconContainer )
	if divisionIconAndBracketPos then
		local leagueDivisionImageDefaultAnimState = {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0,
			material = divisionIconAndBracketPos.divisionIcon,
			alpha = 1
		}
		local leagueDivisionIcon = LUI.UIStreamedImage.new( leagueDivisionImageDefaultAnimState )
		divisionIconContainer:addElement( leagueDivisionIcon )
	end
	topTeamContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	topTeamContainer:addElement( topTeamContainer.border )
	leagueInfoContainerLeft = leagueInfoContainerLeft + leagueInfoContainerWidth
	local winStreakContainer = LUI.UIElement.new()
	winStreakContainer:setLeftRight( true, false, leagueInfoContainerLeft, leagueInfoContainerLeft + leagueInfoContainerWidth )
	winStreakContainer:setTopBottom( true, false, top, top + leagueInfoContainerHeight )
	self.body.statsContainer:addElement( winStreakContainer )
	local winStreakContainerBackground = LUI.UIImage.new()
	winStreakContainerBackground:setLeftRight( true, true, 1, -1 )
	winStreakContainerBackground:setTopBottom( true, true, 1, -1 )
	winStreakContainerBackground:setRGB( 0, 0, 0 )
	winStreakContainerBackground:setAlpha( 0.4 )
	winStreakContainer:addElement( winStreakContainerBackground )
	local winStreakContainerBackgroundGrad = LUI.UIImage.new()
	winStreakContainerBackgroundGrad:setLeftRight( true, true, backgroundInset - 1, -backgroundInset )
	winStreakContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, 80 )
	winStreakContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	winStreakContainerBackgroundGrad:setAlpha( 0.1 )
	winStreakContainer:addElement( winStreakContainerBackgroundGrad )
	local titleOffset = 10
	local winStreakContainerTitleLabel = LUI.UIText.new()
	winStreakContainerTitleLabel:setLeftRight( true, true, 0, 0 )
	winStreakContainerTitleLabel:setTopBottom( false, false, -titleOffset - statsFontHeight, -titleOffset )
	winStreakContainerTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	winStreakContainerTitleLabel:setAlpha( 0.5 )
	winStreakContainerTitleLabel:setAlignment( LUI.Alignment.Center )
	winStreakContainerTitleLabel:setText( Engine.Localize( "MENU_WIN_STREAK" ) )
	winStreakContainer:addElement( winStreakContainerTitleLabel )
	local winstreak = "--"
	if not inPlacement and not isPreSeason and leagueLbData then
		winstreak = math.max( 0, tonumber( leagueLbData.ints[CoD.LeaguesData.LEAGUE_STAT_INT_STREAK] ) )
	end
	local countFontName = "Big"
	local countFont = CoD.fonts[countFontName]
	local countFontHeight = CoD.textSize[countFontName]
	local countOffset = -10
	local winStreakContainerCountLabel = LUI.UIText.new()
	winStreakContainerCountLabel:setLeftRight( true, true, 0, 0 )
	winStreakContainerCountLabel:setTopBottom( false, false, countOffset, countOffset + countFontHeight )
	winStreakContainerCountLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	winStreakContainerCountLabel:setFont( countFont )
	winStreakContainerCountLabel:setAlignment( LUI.Alignment.Center )
	winStreakContainerCountLabel:setText( winstreak )
	winStreakContainer:addElement( winStreakContainerCountLabel )
	winStreakContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	winStreakContainer.border.leftBorder:close()
	winStreakContainer:addElement( winStreakContainer.border )
	leagueInfoContainerLeft = leagueInfoContainerLeft + leagueInfoContainerWidth
	local seasonWinsContainer = LUI.UIElement.new()
	seasonWinsContainer:setLeftRight( true, false, leagueInfoContainerLeft, leagueInfoContainerLeft + leagueInfoContainerWidth )
	seasonWinsContainer:setTopBottom( true, false, top, top + leagueInfoContainerHeight )
	self.body.statsContainer:addElement( seasonWinsContainer )
	local seasonWinsContainerBackground = LUI.UIImage.new()
	seasonWinsContainerBackground:setLeftRight( true, true, 1, -1 )
	seasonWinsContainerBackground:setTopBottom( true, true, 1, -1 )
	seasonWinsContainerBackground:setRGB( 0, 0, 0 )
	seasonWinsContainerBackground:setAlpha( 0.4 )
	seasonWinsContainer:addElement( seasonWinsContainerBackground )
	local seasonWinsContainerBackgroundGrad = LUI.UIImage.new()
	seasonWinsContainerBackgroundGrad:setLeftRight( true, true, backgroundInset - 1, -backgroundInset )
	seasonWinsContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, 80 )
	seasonWinsContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	seasonWinsContainerBackgroundGrad:setAlpha( 0.1 )
	seasonWinsContainer:addElement( seasonWinsContainerBackgroundGrad )
	local titleOffset = 10
	local seasonWinsContainerTitleLabel = LUI.UIText.new()
	seasonWinsContainerTitleLabel:setLeftRight( true, true, 0, 0 )
	seasonWinsContainerTitleLabel:setTopBottom( false, false, -titleOffset - statsFontHeight, -titleOffset )
	seasonWinsContainerTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	seasonWinsContainerTitleLabel:setAlpha( 0.5 )
	seasonWinsContainerTitleLabel:setAlignment( LUI.Alignment.Center )
	seasonWinsContainerTitleLabel:setText( Engine.Localize( "MENU_SEASON_WINS" ) )
	seasonWinsContainer:addElement( seasonWinsContainerTitleLabel )
	local seasonWins = "--"
	if leagueLbData and not inPlacement and not isPreSeason then
		seasonWins = leagueLbData.ints[CoD.LeaguesData.LEAGUE_STAT_INT_WINS]
	end
	local countFontName = "Big"
	local countFont = CoD.fonts[countFontName]
	local countFontHeight = CoD.textSize[countFontName]
	local countOffset = -10
	local seasonWinsContainerCountLabel = LUI.UIText.new()
	seasonWinsContainerCountLabel:setLeftRight( true, true, 0, 0 )
	seasonWinsContainerCountLabel:setTopBottom( false, false, countOffset, countOffset + countFontHeight )
	seasonWinsContainerCountLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	seasonWinsContainerCountLabel:setFont( countFont )
	seasonWinsContainerCountLabel:setAlignment( LUI.Alignment.Center )
	seasonWinsContainerCountLabel:setText( seasonWins )
	seasonWinsContainer:addElement( seasonWinsContainerCountLabel )
	seasonWinsContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	seasonWinsContainer.border.leftBorder:close()
	seasonWinsContainer:addElement( seasonWinsContainer.border )
	leagueInfoContainerLeft = leagueInfoContainerLeft + leagueInfoContainerWidth
	local careerWinsContainer = LUI.UIElement.new()
	careerWinsContainer:setLeftRight( true, false, leagueInfoContainerLeft, leagueInfoContainerLeft + leagueInfoContainerWidth )
	careerWinsContainer:setTopBottom( true, false, top, top + leagueInfoContainerHeight )
	self.body.statsContainer:addElement( careerWinsContainer )
	local careerWinsContainerBackground = LUI.UIImage.new()
	careerWinsContainerBackground:setLeftRight( true, true, 1, -1 )
	careerWinsContainerBackground:setTopBottom( true, true, 1, -1 )
	careerWinsContainerBackground:setRGB( 0, 0, 0 )
	careerWinsContainerBackground:setAlpha( 0.4 )
	careerWinsContainer:addElement( careerWinsContainerBackground )
	local careerWinsContainerBackgroundGrad = LUI.UIImage.new()
	careerWinsContainerBackgroundGrad:setLeftRight( true, true, backgroundInset - 1, -backgroundInset )
	careerWinsContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, 80 )
	careerWinsContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	careerWinsContainerBackgroundGrad:setAlpha( 0.1 )
	careerWinsContainer:addElement( careerWinsContainerBackgroundGrad )
	local titleOffset = 10
	local careerWinsContainerTitleLabel = LUI.UIText.new()
	careerWinsContainerTitleLabel:setLeftRight( true, true, 0, 0 )
	careerWinsContainerTitleLabel:setTopBottom( false, false, -titleOffset - statsFontHeight, -titleOffset )
	careerWinsContainerTitleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	careerWinsContainerTitleLabel:setAlpha( 0.5 )
	careerWinsContainerTitleLabel:setAlignment( LUI.Alignment.Center )
	careerWinsContainerTitleLabel:setText( Engine.Localize( "CH_LIFETIME_WINS" ) )
	careerWinsContainer:addElement( careerWinsContainerTitleLabel )
	local careerWins = "--"
	if leagueLbData then
		careerWins = leagueLbData.ints[CoD.LeaguesData.LEAGUE_STAT_INT_CAREER_WINS]
	end
	local countFontName = "Big"
	local countFont = CoD.fonts[countFontName]
	local countFontHeight = CoD.textSize[countFontName]
	local countOffset = -10
	local careerWinsContainerCountLabel = LUI.UIText.new()
	careerWinsContainerCountLabel:setLeftRight( true, true, 0, 0 )
	careerWinsContainerCountLabel:setTopBottom( false, false, countOffset, countOffset + countFontHeight )
	careerWinsContainerCountLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	careerWinsContainerCountLabel:setFont( countFont )
	careerWinsContainerCountLabel:setAlignment( LUI.Alignment.Center )
	careerWinsContainerCountLabel:setText( careerWins )
	careerWinsContainer:addElement( careerWinsContainerCountLabel )
	careerWinsContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	careerWinsContainer.border.leftBorder:close()
	careerWinsContainer:addElement( careerWinsContainer.border )
end

CoD.LobbyPanes.GetFavoriteMapGameTypeLocation_Zombies = function ( self )
	local playerStats = CoD.GetPlayerStats( self.controller )
	local favoriteMap = CoD.Zombie.MAP_ZM_FACTORY
	local favoriteGameType = CoD.Zombie.GAMETYPE_ZCLASSIC
	local favoriteLocation = CoD.Zombie.START_LOCATION_TRANSIT
	local timePlayed = 0
	local timePLayedMax = 0
	local gameTypeStatList, gameTypes, startLocations = nil
	for l = 1, #CoD.Zombie.Maps, 1 do
		startLocations = Engine.GetStartLocsZombie( CoD.Zombie.Maps[l] )
		if startLocations ~= nil then
			for m, startLoc in pairs( startLocations ) do
				if playerStats.PlayerStatsByStartLocation[startLoc.ref] ~= nil then
					gameTypeStatList = playerStats.PlayerStatsByStartLocation[startLoc.ref].startLocationGameTypeStats
					for n, gameType in pairs( Engine.GetGamemodesZombie( CoD.Zombie.Maps[l], startLoc.ref ) ) do
						if gameTypeStatList[gameType.ref] ~= nil then
							timePlayed = gameTypeStatList[gameType.ref].stats.TIME_PLAYED_TOTAL.statValue:get()
							if timePLayedMax < timePlayed then
								timePLayedMax = timePlayed
								favoriteGameType = gameType.ref
								favoriteLocation = startLoc.ref
								favoriteMap = CoD.Zombie.Maps[l]
							end
						end
					end
				end
			end
		end
	end
	return favoriteMap, favoriteGameType, favoriteLocation
end

CoD.LobbyPanes.populateStatsPaneElements_Zombies = function ( self )
	local titleYOffset = 22
	local titleXOffset = 0
	self.body.titleContainer = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = titleXOffset,
		right = 100,
		topAnchor = true,
		bottomAnchor = false,
		top = titleYOffset,
		bottom = titleYOffset + CoD.textSize.Default
	} )
	self.body.statsContainer:addElement( self.body.titleContainer )
	local statsTitle = LUI.UITightText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.textSize.Default
	} )
	statsTitle:setText( Engine.Localize( "ZMUI_CAREER_STATS_VS_CAPS" ) )
	self.body.titleContainer:addElement( statsTitle )
	local otherPlayerKills = math.random( 0, 100 )
	local yourKills = Engine.GetDStat( self.controller, "PlayerStatsList", "KILLS", "StatValue" )
	local zombieKillsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_kills", otherPlayerKills, yourKills, Engine.Localize( "ZMUI_KILLS_CAPS" ), 0, 0 )
	self.body.statsContainer:addElement( zombieKillsBox )
	local otherPlayerBulletsFired = math.random( 0, 100 )
	local yourBulletsFired = Engine.GetDStat( self.controller, "PlayerStatsList", "TOTAL_SHOTS", "StatValue" )
	local zombieBulletsFired = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_bulletsfired", otherPlayerBulletsFired, yourBulletsFired, Engine.Localize( "ZMUI_TOTAL_SHOTS_CAPS" ), 1, 0 )
	self.body.statsContainer:addElement( zombieBulletsFired )
	local otherPlayerDowns = math.random( 0, 100 )
	local yourDowns = Engine.GetDStat( self.controller, "PlayerStatsList", "DOWNS", "StatValue" )
	local zombieDownsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_downs", otherPlayerDowns, yourDowns, Engine.Localize( "ZMUI_DOWNS_CAPS" ), 2, 0 )
	self.body.statsContainer:addElement( zombieDownsBox )
	local otherPlayerRevives = math.random( 0, 100 )
	local yourRevives = Engine.GetDStat( self.controller, "PlayerStatsList", "REVIVES", "StatValue" )
	local zombieRevivesBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_revives", otherPlayerRevives, yourRevives, Engine.Localize( "ZMUI_REVIVES_CAPS" ), 3, 0 )
	self.body.statsContainer:addElement( zombieRevivesBox )
	local otherPlayerGrenadeKills = math.random( 0, 100 )
	local yourGrenadeKills = Engine.GetDStat( self.controller, "PlayerStatsList", "GRENADE_KILLS", "StatValue" )
	local zombieGrenadeKillsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_grenadekills", otherPlayerGrenadeKills, yourGrenadeKills, Engine.Localize( "ZMUI_GRENADE_KILLS_CAPS" ), 0, 1 )
	self.body.statsContainer:addElement( zombieGrenadeKillsBox )
	local otherPlayerHeadshots = math.random( 0, 100 )
	local yourHeadshots = Engine.GetDStat( self.controller, "PlayerStatsList", "HEADSHOTS", "StatValue" )
	local zombieHeadshotsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_headshots", otherPlayerHeadshots, yourHeadshots, Engine.Localize( "ZMUI_HEADSHOTS_CAPS" ), 1, 1 )
	self.body.statsContainer:addElement( zombieHeadshotsBox )
	local otherPlayerDeaths = math.random( 0, 100 )
	local yourDeaths = Engine.GetDStat( self.controller, "PlayerStatsList", "DEATHS", "StatValue" )
	local zombieDeathsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_dealths", otherPlayerDeaths, yourDeaths, Engine.Localize( "ZMUI_DEATHS_CAPS" ), 2, 1 )
	self.body.statsContainer:addElement( zombieDeathsBox )
	local otherPlayerGibs = math.random( 0, 100 )
	local yourGibs = Engine.GetDStat( self.controller, "PlayerStatsList", "GIBS", "StatValue" )
	local zombieGibsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_gibs", otherPlayerGibs, yourGibs, Engine.Localize( "ZMUI_GIBS_CAPS" ), 3, 1 )
	self.body.statsContainer:addElement( zombieGibsBox )
	local otherPlayerPerksDrank = math.random( 0, 100 )
	local yourPerksDrank = Engine.GetDStat( self.controller, "PlayerStatsList", "PERKS_DRANK", "StatValue" )
	local zombiePerksDrank = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_perksdrank", otherPlayerPerksDrank, yourPerksDrank, Engine.Localize( "ZMUI_PERKS_DRANK_CAPS" ), 0, 2 )
	self.body.statsContainer:addElement( zombiePerksDrank )
	local otherPlayerDoorsPurchased = math.random( 0, 100 )
	local yourDoorsPurchased = Engine.GetDStat( self.controller, "PlayerStatsList", "DOORS_PURCHASED", "StatValue" )
	local zombieDoorsPurchasedBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_doorspurchased", otherPlayerDoorsPurchased, yourDoorsPurchased, Engine.Localize( "ZMUI_DOORS_OPENED_CAPS" ), 1, 2 )
	self.body.statsContainer:addElement( zombieDoorsPurchasedBox )
	local otherPlayerAccuracy = math.random( 0, 100 )
	local yourHits = Engine.GetDStat( self.controller, "PlayerStatsList", "HITS", "StatValue" )
	local yourAccuracyStr = "0.00"
	if yourBulletsFired > 0 then
		yourAccuracyStr = string.format( "%.2f", yourHits / yourBulletsFired )
	end
	local zombieBulletsHitBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_accuracy", otherPlayerAccuracy, yourAccuracyStr, Engine.Localize( "ZMUI_ACCURACY_CAPS" ), 2, 2 )
	self.body.statsContainer:addElement( zombieBulletsHitBox )
	local otherPlayerDistanceTraveled = math.random( 0, 100 )
	local yourDistanceTraveled = Engine.GetDStat( self.controller, "PlayerStatsList", "DISTANCE_TRAVELED", "StatValue" )
	local zombieDistanceTraveledBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_distancetraveled", otherPlayerDistanceTraveled, yourDistanceTraveled, Engine.Localize( "ZMUI_DISTANCE_TRAVELED_CAPS" ), 3, 2 )
	self.body.statsContainer:addElement( zombieDistanceTraveledBox )
	local mapRef, gameTypeRef, startLocationRef = CoD.LobbyPanes.GetFavoriteMapGameTypeLocation_Zombies( self )
	local gameTypeGroupRef = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gameTypeRef, "groupname" )
	local statLargeBoxWidthAdj = 5
	local statLargeBoxWidth = CoD.DisplayStatBox.StatsPaneWidth / 2 - statLargeBoxWidthAdj
	local statLargeBoxRatio = 0.6
	local statLargeBoxHeight = statLargeBoxWidth * statLargeBoxRatio
	local statLargeBoxYOffset = 0
	local statBoxRows = 3
	local gunContainerXAdj = 20
	local statLargeBoxY = CoD.DisplayStatBox.StatBoxY + CoD.DisplayStatBox.StatBoxYIncr * statBoxRows + CoD.textSize.Default + statLargeBoxYOffset
	local favoriteContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -statLargeBoxWidth - statLargeBoxWidthAdj + gunContainerXAdj,
		right = -statLargeBoxWidthAdj + gunContainerXAdj,
		topAnchor = true,
		bottomAnchor = false,
		top = statLargeBoxY,
		bottom = statLargeBoxY + statLargeBoxHeight
	} )
	self.body.statsContainer:addElement( favoriteContainer )
	local favoriteFrameMaterialName = "menu_zm_popup"
	local favoriteFrame = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 5,
		bottom = 5,
		material = RegisterMaterial( favoriteFrameMaterialName )
	} )
	favoriteContainer:addElement( favoriteFrame )
	local favoriteBGMaterialName = "menu_" .. CoD.Zombie.GetMapName( mapRef ) .. "_" .. gameTypeGroupRef .. "_" .. startLocationRef
	local favoriteBG = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 5,
		bottom = -20,
		material = RegisterMaterial( favoriteBGMaterialName )
	} )
	favoriteContainer:addElement( favoriteBG )
	local favoriteTitle = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 1,
		topAnchor = true,
		bottomAnchor = false,
		top = -CoD.textSize.Default,
		bottom = 0
	} )
	favoriteTitle:setText( Engine.Localize( "ZMUI_FAVORITE_CAPS" ) )
	favoriteContainer:addElement( favoriteTitle )
	local locationGameTypeTextHeight = 20
	local mapNameTextHeight = 25
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == CoD.LANGUAGE_FULLJAPANESE or currentLanguage == CoD.LANGUAGE_JAPANESE then
		locationGameTypeTextHeight = locationGameTypeTextHeight * 0.65
		mapNameTextHeight = mapNameTextHeight * 0.65
	end
	local locationGameTypeBottom = -10
	local locationGameTypeTop = locationGameTypeBottom - locationGameTypeTextHeight
	local mapNameBottom = locationGameTypeTop
	local mapNameTop = mapNameBottom - mapNameTextHeight
	local mapName = LUI.UIText.new()
	mapName:setLeftRight( false, true, -11, -10 )
	mapName:setTopBottom( false, true, mapNameTop, mapNameBottom )
	mapName:setFont( CoD.fonts.Condensed )
	mapName:setText( Engine.ToUpper( Engine.Localize( CoD.GetMapValue( mapRef, "mapName", mapRef ) ) ) )
	favoriteContainer:addElement( mapName )
	local locationGameType = LUI.UIText.new()
	locationGameType:setLeftRight( false, true, -11, -10 )
	locationGameType:setTopBottom( false, true, locationGameTypeTop, locationGameTypeBottom )
	locationGameType:setFont( CoD.fonts.Condensed )
	local gameTypeText = Engine.Localize( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gameTypeRef, "name_ref_caps" ) )
	locationGameType:setText( gameTypeText )
	favoriteContainer:addElement( locationGameType )
end

CoD.LobbyPanes.populateSurvivalStatsPaneElements = function ( self )
	CoD.LobbyPanes.populateZombieStatsPaneElements( self, CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL )
end

CoD.LobbyPanes.populateEncountersStatsPaneElements = function ( self )
	CoD.LobbyPanes.populateZombieStatsPaneElements( self, CoD.Zombie.GAMETYPEGROUP_ZENCOUNTER )
end

CoD.LobbyPanes.GetFavoriteWeaponByGameTypeGroup_Zombies = function ( self, gameTypeGroup )
	local f27_local0 = CoD.GetPlayerStats( self.controller )
	local weaponStats = f27_local0.ItemStats
	local favoriteWeaponStatIndex = 7
	local timeUsed = 0
	local timeUsedMax = 0
	local weaponStatsByGameTypeGroupList = nil
	for i = 0, #weaponStats - 1, 1 do
		timeUsed = 0
		if gameTypeGroup == CoD.Zombie.GAMETYPEGROUP_ZENCOUNTER then
			timeUsed = weaponStats[i].itemStatsByGameTypeGroup[gameTypeGroup].stats.TIMEUSED.statValue:get()
		elseif gameTypeGroup == CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
			timeUsed = weaponStats[i].itemStatsByGameTypeGroup[gameTypeGroup].stats.TIMEUSED.statValue:get() + weaponStats[i].itemStatsByGameTypeGroup[CoD.Zombie.GAMETYPEGROUP_ZCLASSIC].stats.TIMEUSED.statValue:get()
		end
		if timeUsedMax < timeUsed then
			timeUsedMax = timeUsed
			favoriteWeaponStatIndex = i
		end
	end
	return favoriteWeaponStatIndex
end

CoD.LobbyPanes.populateZombieStatsPaneElements = function ( self, gameMode )
	if self.body.zombieStatsContainer ~= nil then
		self.body.zombieStatsContainer:removeAllChildren()
	end
	self.body.zombieStatsContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	self.body:addElement( self.body.zombieStatsContainer )
	local titleYOffset = 22
	local titleXOffset = 0
	self.body.titleContainer = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = titleXOffset,
		right = 100,
		topAnchor = true,
		bottomAnchor = false,
		top = titleYOffset,
		bottom = titleYOffset + CoD.textSize.Default
	} )
	self.body.zombieStatsContainer:addElement( self.body.titleContainer )
	local statsTitle = LUI.UITightText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.textSize.Default
	} )
	if gameMode == CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
		statsTitle:setText( Engine.Localize( "ZMUI_COOP_STATS_VS_CAPS" ) )
	else
		statsTitle:setText( Engine.Localize( "ZMUI_VERSUS_STATS_VS_CAPS" ) )
	end
	self.body.titleContainer:addElement( statsTitle )
	local otherPlayerKills = math.random( 0, 100 )
	local yourKills = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "KILLS", "StatValue" )
	local otherPlayerGrenadeKills = math.random( 0, 100 )
	local yourGrenadeKills = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "GRENADE_KILLS", "StatValue" )
	local otherPlayerPerksDrank = math.random( 0, 100 )
	local yourPerksDrank = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "PERKS_DRANK", "StatValue" )
	local otherPlayerHeadshots = math.random( 0, 100 )
	local yourHeadshots = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "HEADSHOTS", "StatValue" )
	local otherPlayerDowns = math.random( 0, 100 )
	local yourDowns = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "DOWNS", "StatValue" )
	local otherPlayerDoorsPurchased = math.random( 0, 100 )
	local yourDoorsPurchased = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "DOORS_PURCHASED", "StatValue" )
	local otherPlayerBulletsFired = math.random( 0, 100 )
	local yourBulletsFired = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "TOTAL_SHOTS", "StatValue" )
	local otherPlayerAccuracy = math.random( 0, 100 )
	local yourHits = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "HITS", "StatValue" )
	local otherPlayerGibs = math.random( 0, 100 )
	local yourGibs = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "GIBS", "StatValue" )
	local otherPlayerRevives = math.random( 0, 100 )
	local yourRevives = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "REVIVES", "StatValue" )
	local otherPlayerDeaths = math.random( 0, 100 )
	local yourDeaths = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "DEATHS", "StatValue" )
	local otherPlayerDistanceTraveled = math.random( 0, 100 )
	local yourDistanceTraveled = Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", gameMode, "DISTANCE_TRAVELED", "StatValue" )
	if gameMode == CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
		yourKills = yourKills + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "KILLS", "StatValue" )
		yourGrenadeKills = yourGrenadeKills + yourGrenadeKills + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "GRENADE_KILLS", "StatValue" )
		yourPerksDrank = yourPerksDrank + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "PERKS_DRANK", "StatValue" )
		yourHeadshots = yourHeadshots + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "HEADSHOTS", "StatValue" )
		yourDowns = yourDowns + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "DOWNS", "StatValue" )
		yourDoorsPurchased = yourDoorsPurchased + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "DOORS_PURCHASED", "StatValue" )
		yourBulletsFired = yourBulletsFired + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "TOTAL_SHOTS", "StatValue" )
		yourHits = yourHits + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "HITS", "StatValue" )
		yourGibs = yourGibs + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "GIBS", "StatValue" )
		yourRevives = yourRevives + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "REVIVES", "StatValue" )
		yourDeaths = yourDeaths + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "DEATHS", "StatValue" )
		yourDistanceTraveled = yourDistanceTraveled + Engine.GetDStat( self.controller, "PlayerStatsByGameTypeGroup", CoD.Zombie.GAMETYPEGROUP_ZCLASSIC, "DISTANCE_TRAVELED", "StatValue" )
	end
	local yourAccuracyStr = "0.00"
	if yourBulletsFired > 0 then
		yourAccuracyStr = string.format( "%.2f", yourHits / yourBulletsFired )
	end
	local zombieKillsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_kills", otherPlayerKills, yourKills, Engine.Localize( "ZMUI_KILLS_CAPS" ), 0, 0 )
	self.body.zombieStatsContainer:addElement( zombieKillsBox )
	local zombieBulletsFiredBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_bulletsfired", otherPlayerBulletsFired, yourBulletsFired, Engine.Localize( "ZMUI_TOTAL_SHOTS_CAPS" ), 1, 0 )
	self.body.zombieStatsContainer:addElement( zombieBulletsFiredBox )
	local zombieDownsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_downs", otherPlayerDowns, yourDowns, Engine.Localize( "ZMUI_DOWNS_CAPS" ), 2, 0 )
	self.body.zombieStatsContainer:addElement( zombieDownsBox )
	local zombieRevivesBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_revives", otherPlayerRevives, yourRevives, Engine.Localize( "ZMUI_REVIVES_CAPS" ), 3, 0 )
	self.body.zombieStatsContainer:addElement( zombieRevivesBox )
	local zombieGrenadeKillsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_grenadekills", otherPlayerGrenadeKills, yourGrenadeKills, Engine.Localize( "ZMUI_GRENADE_KILLS_CAPS" ), 0, 1 )
	self.body.zombieStatsContainer:addElement( zombieGrenadeKillsBox )
	local zombieHeadshotsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_headshots", otherPlayerHeadshots, yourHeadshots, Engine.Localize( "ZMUI_HEADSHOTS_CAPS" ), 1, 1 )
	self.body.zombieStatsContainer:addElement( zombieHeadshotsBox )
	local zombieDeathsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_dealths", otherPlayerDeaths, yourDeaths, Engine.Localize( "ZMUI_DEATHS_CAPS" ), 2, 1 )
	self.body.zombieStatsContainer:addElement( zombieDeathsBox )
	local zombieGibsBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_gibs", otherPlayerGibs, yourGibs, Engine.Localize( "ZMUI_GIBS_CAPS" ), 3, 1 )
	self.body.zombieStatsContainer:addElement( zombieGibsBox )
	local zombiePerksDrankBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_perksdrank", otherPlayerPerksDrank, yourPerksDrank, Engine.Localize( "ZMUI_PERKS_DRANK_CAPS" ), 0, 2 )
	self.body.zombieStatsContainer:addElement( zombiePerksDrankBox )
	local zombieDoorsPurchasedBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_doorspurchased", otherPlayerDoorsPurchased, yourDoorsPurchased, Engine.Localize( "ZMUI_DOORS_OPENED_CAPS" ), 1, 2 )
	self.body.zombieStatsContainer:addElement( zombieDoorsPurchasedBox )
	local zombieBulletsHitBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_accuracy", otherPlayerAccuracy, yourAccuracyStr, Engine.Localize( "ZMUI_ACCURACY_CAPS" ), 2, 2 )
	self.body.zombieStatsContainer:addElement( zombieBulletsHitBox )
	local zombieDistanceTraveledBox = CoD.DisplayStatBox.New( "menu_zm_lobby_aar_icons_distancetraveled", otherPlayerDistanceTraveled, yourDistanceTraveled, Engine.Localize( "ZMUI_DISTANCE_TRAVELED_CAPS" ), 3, 2 )
	self.body.zombieStatsContainer:addElement( zombieDistanceTraveledBox )
	local statLargeBoxWidthAdj = 5
	local statLargeBoxWidth = CoD.DisplayStatBox.StatsPaneWidth / 2 - statLargeBoxWidthAdj
	local statLargeBoxRatio = 0.6
	local statLargeBoxHeight = statLargeBoxWidth * statLargeBoxRatio
	local statLargeBoxYOffset = 0
	local statBoxRows = 3
	local gunContainerXAdj = 20
	local statLargeBoxY = CoD.DisplayStatBox.StatBoxY + CoD.DisplayStatBox.StatBoxYIncr * statBoxRows + CoD.textSize.Default + statLargeBoxYOffset
	local gunContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -statLargeBoxWidth - statLargeBoxWidthAdj + gunContainerXAdj,
		right = -statLargeBoxWidthAdj + gunContainerXAdj,
		topAnchor = true,
		bottomAnchor = false,
		top = statLargeBoxY,
		bottom = statLargeBoxY + statLargeBoxHeight
	} )
	self.body.zombieStatsContainer:addElement( gunContainer )
	local gunBG = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 5,
		bottom = 5
	} )
	gunBG:setImage( RegisterMaterial( "menu_zm_popup" ) )
	gunContainer:addElement( gunBG )
	local gunTitle = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 1,
		topAnchor = true,
		bottomAnchor = false,
		top = -CoD.textSize.Default,
		bottom = 0
	} )
	gunTitle:setText( Engine.Localize( "ZMUI_FAVORITE_WEAPON_CAPS" ) )
	gunContainer:addElement( gunTitle )
	local itemIndex = CoD.LobbyPanes.GetFavoriteWeaponByGameTypeGroup_Zombies( self, gameMode )
	if itemIndex > 0 then
		local bestWeaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( itemIndex ) ) )
		local bestWeaponMaterialName = Engine.GetItemImage( itemIndex )
		local bestWeaponMaterial = RegisterMaterial( bestWeaponMaterialName )
		local weaponImageHeight = 2 * statLargeBoxHeight / 3
		local weaponImageWidth = 5 * statLargeBoxWidth / 6
		local weaponImage = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = false,
			left = 10,
			right = 10 + weaponImageWidth,
			topAnchor = true,
			bottomAnchor = false,
			top = statLargeBoxHeight / 9,
			bottom = statLargeBoxHeight / 9 + weaponImageHeight,
			material = bestWeaponMaterial
		} )
		gunContainer:addElement( weaponImage )
	end
end

