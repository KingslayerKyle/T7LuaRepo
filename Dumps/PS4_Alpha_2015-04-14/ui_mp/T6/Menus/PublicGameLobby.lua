require( "ui.T6.GameLobby" )
require( "ui.T6.MapVoter" )
require( "ui.T6.Menus.MutePopup" )
require( "ui_mp.T6.Menus.AfterActionReportMenu" )
require( "ui_mp.T6.Menus.LeaderboardMP" )

CoD.PublicGameLobby = {}
CoD.PublicGameLobby.PopulateButtons = function ( self, isSlidingFromPanel )
	if CoD.isZombie == true then
		CoD.PublicGameLobby.PopulateButtons_Zombies( self )
	elseif CoD.isCampaign == true then
		CoD.PublicGameLobby.PopulateButtons_Campaign( self )
	else
		CoD.PublicGameLobby.PopulateButtons_Multiplayer( self )
	end
	self.body.buttonList:addSpacer( 5 )
	local mapVoterWidth = 350 - CoD.CoD9Button.Height
	local mapVoterHeight = mapVoterWidth / CoD.MapVoter.AspectRatio
	self.body.mapVoter = CoD.MapVoter.new( {
		left = 0,
		top = -mapVoterHeight - CoD.ButtonPrompt.Height - 15,
		right = mapVoterWidth,
		bottom = -CoD.ButtonPrompt.Height - 15,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true
	}, isSlidingFromPanel )
	self.body:addElement( self.body.mapVoter )
	self.body.mapVoter.focusResetElement = self.body.lobbyLeaderboardButton
	self.body.mapVoter.buttonList = self.body.buttonList
	self.body.mapVoter:addElements()
	CoD.GameLobby.PopulateButtons( self, mapVoterHeight )
	CoD.PublicGameLobby.AddDetailedStatusText( self, mapVoterHeight )
end

CoD.PublicGameLobby.AddButtonPrompts = function ( self, controller )
	local f2_local0 = CoD.GetPlayerStats( controller )
	local afterActionReportStats = f2_local0.AfterActionReportStats
	local lobbyPopup = afterActionReportStats.lobbyPopup:get()
	if CoD.isZombie ~= true and Engine.IsStableStatsBufferInitialized( controller ) and (lobbyPopup == "public" or lobbyPopup == "summary" or lobbyPopup == "promotion" or lobbyPopup == "none" and Engine.IsSplitscreen()) then
		self:addRightButtonPrompt( CoD.ButtonPrompt.new( "select", Engine.Localize( "MPUI_AFTER_ACTION_REPORT" ), self, "open_aar", false, nil, false, nil, "TAB" ) )
	end
end

CoD.PublicGameLobby.Button_LobbyLeaderboard = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	end
	local lb = nil
	if CoD.isZombie == false then
		lb = self:openPopup( "LeaderboardMP", event.controller )
	else
		lb = self:openPopup( "LeaderboardZM", event.controller )
	end
	local gameMode = Dvar.ui_gameType:get()
	if gameMode ~= nil then
		lb:processEvent( {
			name = "leaderboard_loadnew",
			controller = event.controller,
			lbGameMode = gameMode,
			lobbyFilters = true
		} )
	end
end

CoD.PublicGameLobby.PopulateButtons_Campaign = function ( self )
	self.body.createAClassButton = self.body.buttonList:addButton( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	self.body.createAClassButton.id = "CoD9Button." .. "PublicGameLobby." .. Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" )
	CoD.CACUtility.SetupCACLock( self.body.createAClassButton )
	self.body.createAClassButton:registerEventHandler( "button_action", CoD.GameLobby.Button_CAC )
	if Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 1 then
		self.body.rewardsButton = self.body.buttonList:addButton( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ) )
		self.body.rewardsButton.id = "CoD9Button." .. "PublicGameLobby." .. Engine.Localize( "MENU_SCORE_STREAKS_CAPS" )
		CoD.SetupButtonLock( self.body.rewardsButton, nil, "FEATURE_KILLSTREAKS", "FEATURE_KILLSTREAKS_DESC" )
		CoD.CACUtility.SetupScorestreaksNew( self.body.rewardsButton )
		self.body.rewardsButton:registerEventHandler( "button_action", CoD.GameLobby.Button_Rewards )
	end
	self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	if Dvar.ui_hideLeaderboards:get() == false then
		self.body.lobbyLeaderboardButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_LOBBY_LEADERBOARD_CAPS" ) )
		self.body.lobbyLeaderboardButton.hintText = Engine.Localize( "MPUI_LOBBY_LEADERBOARD_DESC" )
		self.body.lobbyLeaderboardButton:setActionEventName( "open_lobbyleaderboard" )
	end
end

CoD.PublicGameLobby.PopulateButtons_Multiplayer = function ( self )
	self.body.createAClassButton = self.body.buttonList:addButton( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	self.body.createAClassButton.id = "CoD9Button." .. "PublicGameLobby." .. Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" )
	self.body.createAClassButton:registerEventHandler( "button_action", CoD.GameLobby.Button_CAC )
	if Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 1 then
		self.body.rewardsButton = self.body.buttonList:addButton( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ) )
		self.body.rewardsButton.id = "CoD9Button." .. "PublicGameLobby." .. Engine.Localize( "MENU_SCORE_STREAKS_CAPS" )
		CoD.SetupButtonLock( self.body.rewardsButton, nil, "FEATURE_KILLSTREAKS", "FEATURE_KILLSTREAKS_DESC" )
		CoD.CACUtility.SetupScorestreaksNew( self.body.rewardsButton )
		self.body.rewardsButton:registerEventHandler( "button_action", CoD.GameLobby.Button_Rewards )
	end
	self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	self.body.barracksButton = self.body.buttonList:addButton( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	self.body.barracksButton.id = "CoD9Button." .. "PublicGameLobby." .. Engine.Localize( "MENU_BARRACKS_CAPS" )
	CoD.SetupBarracksLock( self.body.barracksButton )
	CoD.SetupBarracksNew( self.body.barracksButton )
	self.body.barracksButton:setActionEventName( "open_barracks" )
	if Dvar.ui_hideLeaderboards:get() == false then
		self.body.lobbyLeaderboardButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_LOBBY_LEADERBOARD_CAPS" ) )
		self.body.lobbyLeaderboardButton.hintText = Engine.Localize( "MPUI_LOBBY_LEADERBOARD_DESC" )
		self.body.lobbyLeaderboardButton:setActionEventName( "open_lobbyleaderboard" )
	end
end

CoD.PublicGameLobby.Button_ReadyUp = function ( self, event )
	self:dispatchEventToParent( {
		name = "ready_up",
		controller = event.controller
	} )
end

CoD.PublicGameLobby.ReadyUp = function ( self, event )
	Engine.ExecNow( event.controller, "xpartyready 1" )
	if not Engine.DvarBool( nil, "party_readyButtonVisible" ) then
		self.buttonPane.body.readyupButton:disable()
	end
end

CoD.PublicGameLobby.PopulateButtons_Zombies = function ( self )
	local readyUpText = "MPUI_VOTE_TO_START_CAPS"
	local readyUpHintText = "ZMUI_READYUP_DESC"
	if CoD.PlaylistCategoryFilter == nil then
		local currentPlaylist = Engine.GetPlaylistID()
		CoD.PlaylistCategoryFilter = Engine.GetPlaylistCategoryFilter( Engine.GetPrimaryController(), currentPlaylist )
	end
	if CoD.PlaylistCategoryFilter == CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH then
		readyUpText = "MPUI_START_MATCH_CAPS"
		readyUpHintText = "MPUI_START_MATCH_DESC"
	end
	self.body.readyupButton = self.body.buttonList:addButton( Engine.Localize( readyUpText ), nil, 1 )
	self.body.readyupButton.hintText = Engine.Localize( readyUpHintText )
	self.body.readyupButton:registerEventHandler( "button_action", CoD.PublicGameLobby.Button_ReadyUp )
	self.body.readyupButton:disable()
	self.body.barracksButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_LEADERBOARDS_CAPS" ), nil, 2 )
	CoD.SetupBarracksLock( self.body.barracksButton )
	self.body.barracksButton:setActionEventName( "open_barracks" )
	self.body.changePlaylistButton = self.body.buttonList:addButton( Engine.Localize( "ZMUI_MAP_CAPS" ), nil, 3 )
	self.body.changePlaylistButton.hintText = Engine.Localize( "ZMUI_MAP_SELECTION_DESC" )
	self.body.changePlaylistButton:setActionEventName( "change_playlist" )
	CoD.GameGlobeZombie.MoveToUpDirectly()
end

CoD.PublicGameLobby.UpdateButtonPaneButtonVisibility = function ( self )
	if self == nil or self.body == nil then
		return 
	elseif self.body.mapVoter ~= nil then
		Engine.SystemNeedsUpdate( nil, "lobby" )
	end
end

CoD.PublicGameLobby.UpdateButtonPromptVisibility = function ( self )
	if self == nil then
		return 
	elseif self.partyPrivacyButton ~= nil then
		self.partyPrivacyButton:close()
	end
end

CoD.PublicGameLobby.Update = function ( self, event )
	local playlistName = Engine.GetPlaylistName( event.controller, Engine.GetPlaylistID() )
	local titleText = ""
	local gameType = Dvar.ui_gameType:get()
	if CoD.isZombie == true and gameType == CoD.Zombie.GAMETYPE_ZCLASSIC then
		titleText = playlistName
	else
		titleText = Engine.ToUpper( Engine.GetPlaylistCategoryName( event.controller ) ) .. " / " .. Engine.ToUpper( Engine.GetPlaylistName( event.controller, Engine.GetPlaylistID() ) )
	end
	self:setTitle( titleText )
	if CoD.isZombie == true and self.buttonPane.body ~= nil and self.buttonPane.body.readyupButton ~= nil then
		if Engine.DvarFloat( "party_readyPercentRequired" ) > 0 and Engine.PartyIsWaiting() then
			self.buttonPane.body.readyupButton:enable()
		else
			self.buttonPane.body.readyupButton:disable()
		end
		if Engine.PartyIsWaiting() and gameType ~= CoD.Zombie.GAMETYPE_ZCLASSIC and gameType ~= CoD.Zombie.GAMETYPE_ZSTANDARD then
			self.buttonPane.body.readyupButton:closeAndRefocus( self.buttonPane.body.barracksButton )
		end
		local currentPlaylist = Engine.GetPlaylistID()
		local playlistCategoryFilter = Engine.GetPlaylistCategoryFilter( Engine.GetPrimaryController(), currentPlaylist )
		if playlistCategoryFilter ~= CoD.PlaylistCategoryFilter then
			CoD.PlaylistCategoryFilter = playlistCategoryFilter
			if CoD.PlaylistCategoryFilter ~= CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH then
				local desc = Engine.Localize( "ZMUI_READYUP_DESC" )
				local text = Engine.Localize( "MPUI_VOTE_TO_START_CAPS" )
				self.buttonPane.body.readyupButton.hintText = desc
				self.buttonPane.body.readyupButton:setLabel( text )
				self.buttonPane.body.readyupButton.name = text
				CoD.PublicGameLobby.AddMuteButton( self )
				self:addNATType()
				CoD.PublicGameLobby.AddDetailedStatusText( self.buttonPane, (350 - CoD.CoD9Button.Height) / CoD.MapVoter.AspectRatio )
				CoD.GameMapZombie.SwitchToMapDirect( 2, true, 0 )
			end
		end
	end
	self:dispatchEventToChildren( event )
end

CoD.PublicGameLobby.PopulateButtonPaneElements = function ( self, isSlidingFromPanel )
	CoD.PublicGameLobby.PopulateButtons( self, isSlidingFromPanel )
	CoD.PublicGameLobby.UpdateButtonPaneButtonVisibility( self )
end

CoD.PublicGameLobby.AddMuteButton = function ( self )
	self.muteButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_MUTING" ), self, "button_prompt_mute", false, nil, false, nil, "M" )
	self:addRightButtonPrompt( self.muteButton )
end

CoD.PublicGameLobby.GoBack = function ( self, event )
	if CoD.isZombie == true then
		self:setPreviousMenu( "MainLobby" )
	end
	CoD.Lobby.GoBack( self, event )
end

CoD.PublicGameLobby.ChangePlaylist_LeaveLobby_Zombie = function ( self, event )
	CoD.PublicGameLobby.ShutdownLobby( self, event )
	Engine.SetDvar( "party_readyPercentRequired", 0 )
	CoD.SwitchToPlayerMatchLobby( event.controller )
	local menu = self:openMenu( "SelectStartLocZM", event.controller )
	menu:setPreviousMenu( "SelectMapZM" )
	menu.skipOpenMenuEvent = true
	if menu.startLocsPopulated == true then
		CoD.SelectStartLocZombie.GoToPreChoices( menu, event )
	end
	self:close()
end

CoD.PublicGameLobby.ChangePlaylist_Zombie = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
		errorPopup.anyControllerAllowed = true
		return 
	elseif CoD.Lobby.OpenSignOutPopup( self, event ) == true then
		return 
	else
		CoD.Lobby.ConfirmLeaveGameLobby( self, {
			controller = event.controller,
			leaveLobbyHandler = CoD.PublicGameLobby.ChangePlaylist_LeaveLobby_Zombie
		} )
	end
end

CoD.PublicGameLobby.New = function ( name, controller, buttonPaneTitleText )
	local publicGameLobby = CoD.GameLobby.new( name, controller, true, buttonPaneTitleText, Engine.Localize( "MENU_LOBBY_LIST_CAPS" ) )
	publicGameLobby:registerEventHandler( "button_prompt_back", CoD.PublicGameLobby.Button_Back )
	publicGameLobby:registerEventHandler( "button_prompt_mute", CoD.PublicGameLobby.ButtonPromptMute )
	publicGameLobby:registerEventHandler( "open_aar", CoD.PublicGameLobby.OpenAAR )
	publicGameLobby:registerEventHandler( "open_lobbyleaderboard", CoD.PublicGameLobby.Button_LobbyLeaderboard )
	publicGameLobby:registerEventHandler( "gamelobby_update", CoD.PublicGameLobby.Update )
	if CoD.isZombie == true then
		publicGameLobby:registerEventHandler( "ready_up", CoD.PublicGameLobby.ReadyUp )
	end
	if not CoD.isZombie then
		CoD.PublicGameLobby.AddMuteButton( publicGameLobby )
	elseif CoD.PlaylistCategoryFilter ~= CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH then
		CoD.PublicGameLobby.AddMuteButton( publicGameLobby )
	end
	publicGameLobby:addNATType()
	publicGameLobby.lobbyPane:setSplitscreenSignInAllowed( false )
	return publicGameLobby
end

LUI.createMenu.PublicGameLobby = function ( controller )
	local playlistName = Engine.GetPlaylistName( controller, Engine.GetPlaylistID() )
	local titleText = ""
	if string.lower( playlistName ) ~= "tranzit" then
		titleText = Engine.ToUpper( Engine.GetPlaylistCategoryName( controller ) ) .. " / " .. Engine.ToUpper( Engine.GetPlaylistName( controller, Engine.GetPlaylistID() ) )
	else
		titleText = playlistName
	end
	local publicGameLobby = CoD.PublicGameLobby.New( "PublicGameLobby", controller, titleText )
	if CoD.isMultiplayer then
		publicGameLobby:setPreviousMenu( "PlayerMatchPartyLobby" )
	end
	publicGameLobby:addTitle( titleText )
	publicGameLobby.populateButtonPaneElements = CoD.PublicGameLobby.PopulateButtonPaneElements
	publicGameLobby.goBack = CoD.PublicGameLobby.GoBack
	publicGameLobby:updatePanelFunctions()
	CoD.PublicGameLobby.PopulateButtons( publicGameLobby.buttonPane )
	CoD.PublicGameLobby.AddButtonPrompts( publicGameLobby, controller )
	CoD.PublicGameLobby.UpdateButtonPromptVisibility( publicGameLobby )
	if CoD.useController then
		if not CoD.isZombie then
			publicGameLobby.buttonPane.body.createAClassButton:processEvent( {
				name = "gain_focus"
			} )
		else
			publicGameLobby.buttonPane.body.buttonList:selectElementIndex( 1 )
		end
	end
	return publicGameLobby
end

CoD.PublicGameLobby.OpenAAR = function ( self, event )
	
end

CoD.PublicGameLobby.Button_Back = function ( self, event )
	if CoD.Lobby.OpenSignOutPopup( self, event ) == true then
		return 
	else
		CoD.Lobby.ConfirmLeaveGameLobby( self, {
			controller = event.controller,
			leaveLobbyHandler = CoD.PublicGameLobby.LeaveLobby
		} )
	end
end

CoD.PublicGameLobby.ShutdownLobby = function ( self, event )
	if Engine.AloneInPrivatePartyIgnoreSplitscreen( true ) and Engine.InPrivateParty() then
		CoD.PublicGameLobby.LeaveLobby3( event.controller )
		return 
	elseif Engine.InPrivateParty() then
		if Engine.PrivatePartyHost() then
			if event.name ~= nil and event.name == "confirm_leave_alone" then
				CoD.PublicGameLobby.LeaveLobby2( event.controller )
			else
				CoD.PublicGameLobby.LeaveLobby3( event.controller )
			end
		elseif Engine.PrivatePartyHostInLobby() then
			CoD.PublicGameLobby.LeaveLobby2( event.controller )
		else
			CoD.PublicGameLobby.LeaveLobby1( event.controller )
		end
	elseif Engine.AloneInPrivatePartyIgnoreSplitscreen( true ) then
		CoD.PublicGameLobby.LeaveLobby3( event.controller )
	else
		CoD.PublicGameLobby.LeaveLobby1( event.controller )
	end
end

CoD.PublicGameLobby.LeaveLobby_Project_Multiplayer = function ( self, event )
	if Engine.PartyLockedIn() then
		return 
	else
		CoD.PublicGameLobby.ShutdownLobby( self, event )
		self:goBack( event )
	end
end

CoD.PublicGameLobby.LeaveLobby_Project_Zombie = function ( self, event )
	CoD.PublicGameLobby.LeaveLobby_Project_Multiplayer( self, {
		name = event.name,
		controller = event.controller
	} )
	Engine.SetDvar( "party_readyPercentRequired", 0 )
end

CoD.PublicGameLobby.LeaveLobby_Project = function ( self, event )
	if CoD.isZombie == true then
		CoD.PublicGameLobby.LeaveLobby_Project_Zombie( self, event )
	else
		CoD.PublicGameLobby.LeaveLobby_Project_Multiplayer( self, event )
	end
end

CoD.PublicGameLobby.LeaveLobby = function ( self, event )
	CoD.PublicGameLobby.LeaveLobby_Project( self, event )
end

CoD.PublicGameLobby.LeaveLobby1 = function ( controller )
	Engine.ExecNow( controller, "xstopparty" )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, false )
	Engine.SessionModeSetPrivate( false )
	Engine.SetDvar( "invite_visible", 1 )
	Engine.PartySetMaxPlayerCount( Engine.DvarInt( controller, "party_maxplayers_partylobby" ) )
end

CoD.PublicGameLobby.LeaveLobby2 = function ( controller )
	Engine.ExecNow( controller, "xstopallparties" )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, false )
	Engine.SessionModeSetPrivate( false )
	Engine.ExecNow( controller, "xstartprivateparty" )
	Engine.SetDvar( "invite_visible", 1 )
	Engine.PartySetMaxPlayerCount( Engine.DvarInt( controller, "party_maxplayers_partylobby" ) )
end

CoD.PublicGameLobby.LeaveLobby3 = function ( controller )
	Engine.ExecNow( controller, "xstoppartykeeptogether" )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, false )
	Engine.SessionModeSetPrivate( false )
	Engine.SetDvar( "invite_visible", 1 )
	Engine.PartySetMaxPlayerCount( Engine.DvarInt( controller, "party_maxplayers_partylobby" ) )
end

CoD.PublicGameLobby.ButtonPromptMute = function ( self, event )
	self:openPopup( "Mute", event.controller )
end

CoD.PublicGameLobby.AddDetailedStatusText = function ( self, statusOffset )
	if CoD.isZombie then
		if CoD.PlaylistCategoryFilter == nil then
			local currentPlaylist = Engine.GetPlaylistID()
			CoD.PlaylistCategoryFilter = Engine.GetPlaylistCategoryFilter( Engine.GetPrimaryController(), currentPlaylist )
		end
		if CoD.PlaylistCategoryFilter == CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH then
			return 
		end
	end
	if self.body.detailedStatusText == nil then
		self.body.detailedStatusText = {}
	end
	local statusTextFontName = "ExtraSmall"
	local statusTextFont = CoD.fonts[statusTextFontName]
	local statusTextSize = 20
	local statusTextTop = -statusOffset - CoD.ButtonPrompt.Height - 15 - statusTextSize - 3 - statusTextSize
	local f30_local0 = {}
	local statusTextStrings = Engine.GetMatchmakingProgress()
	for i = 1, 3, 1 do
		if self.body.detailedStatusText[i] ~= nil then
			self.body.detailedStatusText[i]:close()
			self.body.detailedStatusText[i] = nil
		end
		local detailStatusTop = statusTextTop - statusTextSize * i
		local detailed = LUI.UIText.new()
		detailed:setLeftRight( true, false, 0, 100 )
		detailed:setTopBottom( false, true, detailStatusTop, detailStatusTop + statusTextSize )
		detailed:setFont( statusTextFont )
		if Engine.DvarBool( nil, "ui_detailedMM" ) then
			detailed:setText( statusTextStrings[i] )
		end
		self.body.detailedStatusText[i] = detailed
		self.body:addElement( self.body.detailedStatusText[i] )
	end
	self:registerEventHandler( "matchmaking_progress", CoD.PublicGameLobby.MatchmakingProgress )
	self:registerEventHandler( "matchmaking_hideprogress", CoD.PublicGameLobby.HideMatchmakingProgress )
	self:registerEventHandler( "matchmaking_clearprogress", CoD.PublicGameLobby.ClearMatchmakingProgress )
end

CoD.PublicGameLobby.MatchmakingProgress = function ( self, event )
	if Engine.DvarBool( nil, "ui_detailedMM" ) and self.body ~= nil and self.body.detailedStatusText ~= nil then
		for i = 1, 3, 1 do
			self.body.detailedStatusText[i]:setText( event[i] )
			self.body.detailedStatusText[i]:setAlpha( 1 )
		end
	end
end

CoD.PublicGameLobby.ClearMatchmakingProgress = function ( self, event )
	if self.body ~= nil and self.body.detailedStatusText ~= nil then
		for i = 1, 3, 1 do
			self.body.detailedStatusText[i]:completeAnimation()
			self.body.detailedStatusText[i]:beginAnimation( "fade_out", 250 )
			self.body.detailedStatusText[i]:setAlpha( 0 )
		end
	end
	self.body.hideMatchmakingTimer = nil
end

CoD.PublicGameLobby.HideMatchmakingProgress = function ( self, event )
	if self.body ~= nil and self.body.hideMatchmakingTimer == nil then
		self.body.hideMatchmakingTimer = LUI.UITimer.new( 4000, "matchmaking_clearprogress", true, self )
		self.body:addElement( self.body.hideMatchmakingTimer )
	end
end

