require( "ui.T6.Menus.PrivateGameLobby" )
require( "ui.T6.MapInfoImage" )
require( "ui_mp.T6.Menus.CODTv" )

CoD.TheaterLobby = {}
CoD.TheaterLobby.m_fileInfo = {}
LUI.createMenu.TheaterLobby = function ( controller, userData )
	local theaterLobbyMenu = CoD.PrivateGameLobby.New( "TheaterLobby", controller )
	theaterLobbyMenu:setPreviousMenu( "MainLobby" )
	theaterLobbyMenu.controller = controller
	Engine.Exec( controller, "vote_getHistory" )
	theaterLobbyMenu.addButtonPaneElements = CoD.TheaterLobby.AddButtonPaneElements
	theaterLobbyMenu.populateButtonPaneElements = CoD.TheaterLobby.PopulateButtonPaneElements
	theaterLobbyMenu.addLobbyPaneElements = CoD.TheaterLobby.AddLobbyPaneElements
	theaterLobbyMenu.updateLobbyButtons = CoD.TheaterLobby.UpdateLobbyButtons
	theaterLobbyMenu.populateButtons = CoD.TheaterLobby.PopulateButtons
	theaterLobbyMenu:updatePanelFunctions()
	theaterLobbyMenu:registerEventHandler( "theaterlobby_update", CoD.TheaterLobby.TheaterLobbyUpdate )
	theaterLobbyMenu:registerEventHandler( "button_prompt_back", CoD.TheaterLobby.ButtonBack )
	theaterLobbyMenu:registerEventHandler( "gamelobby_update", CoD.TheaterLobby.GameLobbyUpdate )
	theaterLobbyMenu:registerEventHandler( "button_prompt_team_prev", nil )
	theaterLobbyMenu:registerEventHandler( "button_prompt_team_next", nil )
	theaterLobbyMenu:registerEventHandler( "start_film", CoD.TheaterLobby.StartFilm )
	theaterLobbyMenu:registerEventHandler( "create_highlight_reel", CoD.TheaterLobby.CreateHighlightReel )
	theaterLobbyMenu:registerEventHandler( "shoutcast_film", CoD.TheaterLobby.ShoutcastFilm )
	theaterLobbyMenu:registerEventHandler( "open_select_film", CoD.TheaterLobby.OpenSelectFilm )
	theaterLobbyMenu:registerEventHandler( "open_codtv", CoD.TheaterLobby.OpenCodtv )
	theaterLobbyMenu:registerEventHandler( "render_clip", CoD.TheaterLobby.RenderClip )
	theaterLobbyMenu:registerEventHandler( "film_options_flyout", CoD.TheaterLobby.OpenFilmOptionsFlyout )
	theaterLobbyMenu:registerEventHandler( "film_options_save", CoD.TheaterLobby.FileOptions_Save )
	theaterLobbyMenu:registerEventHandler( "film_options_likedislike", CoD.TheaterLobby.FileOptions_LikeDislike )
	theaterLobbyMenu:registerEventHandler( "theater_render_complete", CoD.TheaterLobby.RenderComplete )
	theaterLobbyMenu:addTitle( Engine.Localize( "MPUI_THEATER_LOBBY_CAPS" ) )
	theaterLobbyMenu.panelManager.panels.buttonPane.titleText = theaterLobbyMenu.titleText
	theaterLobbyMenu.panelManager.panels.buttonPane.isHost = CoD.PrivateGameLobby.IsHost( theaterLobbyMenu, controller )
	theaterLobbyMenu.buttonPane.body.buttonList:removeAllChildren()
	theaterLobbyMenu.buttonPane.body.statusText:close()
	theaterLobbyMenu.buttonPane.body.statusText = nil
	theaterLobbyMenu.buttonPane.body.mapInfoImage:close()
	theaterLobbyMenu.buttonPane.body.mapInfoImage = nil
	CoD.TheaterLobby.PopulateButtons( theaterLobbyMenu.buttonPane )
	CoD.TheaterLobby.UpdateButtonPaneButtons( theaterLobbyMenu.buttonPane, {
		controller = controller
	} )
	theaterLobbyMenu.buttonPane.populatePanelElements = theaterLobbyMenu.populateButtonPaneElements
	theaterLobbyMenu.lobbyPane:setSplitscreenSignInAllowed( false )
	if CoD.isZombie then
		if not userData or not userData.parent or userData.parent ~= "MainLobby" then
			CoD.GameGlobeZombie.MoveToCornerJoinLobby()
		end
		if theaterLobbyMenu.panelManager.panels.buttonPane.isHost == true then
			theaterLobbyMenu.buttonPane.body.buttonList:selectElementIndex( 2 )
		else
			theaterLobbyMenu.buttonPane.body.buttonList:selectElementIndex( 1 )
		end
		theaterLobbyMenu.buttonPane:saveState()
	end
	return theaterLobbyMenu
end

CoD.TheaterLobby.CanRenderVideo = function ( controller )
	if not CoD.isWIIU then
		if CoD.isPS3 and not Engine.DvarBool( nil, "tu2_luiHacksDisabled" ) then
			local bandWidth = tonumber( Engine.GetDStat( controller, "uploadBandWidth" ) )
			if (bandWidth and bandWidth / 1000) > 2000 then
				return true
			end
		else
			return true
		end
	end
	return false
end

CoD.TheaterLobby.AddFilmOptionsFlyout = function ( self )
	local flyoutLeft = CoD.PrivateGameLobby.DefaultSetupGameFlyoutLeft + 10
	local flyoutTop = CoD.Menu.TitleHeight + CoD.MPZM( CoD.CoD9Button.Height * 6 + 2, CoD.CoD9Button.Height * 5 - 4 )
	local flyoutHeight = CoD.CoD9Button.Height * 5
	local flyoutWidth = CoD.ButtonList.DefaultWidth - 20
	self.body.setupGameFlyoutBG = LUI.UIImage.new()
	self.body.setupGameFlyoutBG:setLeftRight( true, false, -4, flyoutLeft )
	self.body.setupGameFlyoutBG:setTopBottom( true, false, flyoutTop, flyoutTop + CoD.CoD9Button.Height )
	self.body.setupGameFlyoutBG:setRGB( 0, 0, 0 )
	self.body.setupGameFlyoutBG:setAlpha( 0.8 )
	self.body.setupGameFlyoutBG:setPriority( -100 )
	self.body:addElement( self.body.setupGameFlyoutBG )
	self.body.setupGameFlyoutContainer = LUI.UIElement.new()
	self.body.setupGameFlyoutContainer:setLeftRight( true, false, flyoutLeft, flyoutLeft + flyoutWidth )
	self.body.setupGameFlyoutContainer:setTopBottom( true, false, flyoutTop, flyoutTop + flyoutHeight )
	self.body.setupGameFlyoutContainer:setPriority( 1000 )
	self.body:addElement( self.body.setupGameFlyoutContainer )
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.8 )
	self.body.setupGameFlyoutContainer:addElement( background )
	self.body.setupGameFlyoutContainer.buttonList = CoD.ButtonList.new()
	self.body.setupGameFlyoutContainer.buttonList:setLeftRight( true, true, 4, 0 )
	self.body.setupGameFlyoutContainer.buttonList:setTopBottom( true, true, 0, 0 )
	self.body.setupGameFlyoutContainer:addElement( self.body.setupGameFlyoutContainer.buttonList )
	self.body.setupGameFlyoutContainer.likeDislikeButton = self.body.setupGameFlyoutContainer.buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_FILESHARE_LIKEDISLIKE" ) ), Engine.Localize( "MENU_FILESHARE_LIKEDISLIKE_HINT" ) )
	self.body.setupGameFlyoutContainer.likeDislikeButton:setActionEventName( "film_options_likedislike" )
	if CoD.TheaterLobby.m_fileInfo.isPooled == true then
		self.body.setupGameFlyoutContainer.likeDislikeButton.hintText = Engine.Localize( "MENU_FILESHARE_LIKEDISLIKE_ERROR" )
		self.body.setupGameFlyoutContainer.likeDislikeButton:disable()
	end
	self.body.setupGameFlyoutContainer.saveButton = self.body.setupGameFlyoutContainer.buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_FILESHARE_SAVE" ) ), Engine.Localize( "MENU_FILESHARE_SAVE_FILM_HINT" ) )
	self.body.setupGameFlyoutContainer.saveButton:setActionEventName( "film_options_save" )
end

CoD.TheaterLobby.RemoveFilmOptionsFlyout = function ( self )
	if self.body.setupGameFlyoutBG ~= nil then
		self.body.setupGameFlyoutBG:close()
		self.body.setupGameFlyoutBG = nil
	end
	if self.body.setupGameFlyoutContainer ~= nil then
		self.body.setupGameFlyoutContainer:close()
		self.body.setupGameFlyoutContainer = nil
	end
end

CoD.TheaterLobby.OpenFilmOptionsFlyout = function ( self, event )
	if self.buttonPane ~= nil and self.buttonPane.body ~= nil then
		CoD.TheaterLobby.RemoveFilmOptionsFlyout( self.buttonPane )
		CoD.TheaterLobby.AddFilmOptionsFlyout( self.buttonPane )
		self.panelManager.slidingEnabled = false
		CoD.ButtonList.DisableInput( self.buttonPane.body.buttonList )
		self.buttonPane.body.buttonList:animateToState( "disabled" )
		self.buttonPane.body.setupGameFlyoutContainer:processEvent( {
			name = "gain_focus"
		} )
		self:registerEventHandler( "button_prompt_back", CoD.TheaterLobby.CloseFilmOptionsFlyout )
	end
end

CoD.TheaterLobby.CloseFilmOptionsFlyout = function ( self, event )
	if self.buttonPane ~= nil and self.buttonPane.body ~= nil and self.buttonPane.body.setupGameFlyoutContainer ~= nil then
		CoD.TheaterLobby.RemoveFilmOptionsFlyout( self.buttonPane )
		CoD.ButtonList.EnableInput( self.buttonPane.body.buttonList )
		self.buttonPane.body.buttonList:animateToState( "default" )
		self:registerEventHandler( "button_prompt_back", CoD.TheaterLobby.ButtonBack )
		self.panelManager.slidingEnabled = true
		Engine.PlaySound( "cac_cmn_backout" )
	end
end

CoD.TheaterLobby.PopulateButtons = function ( self )
	if self.body == nil then
		return 
	end
	self.body.buttonList:removeAllButtons()
	local controller = self.panelManager.ownerController
	local isHost = CoD.PrivateGameLobby.IsHost( self, controller )
	if isHost == true then
		self.body.startFilmButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_START_FILM_CAPS" ) )
		self.body.startFilmButton.hintText = Engine.Localize( "MENU_THEATER_LOAD_HINT" )
		self.body.startFilmButton:setActionEventName( "start_film" )
		self.body.startFilmButton:disable()
		self.body.selectFilmButton = self.body.buttonList:addButton( Engine.Localize( "MENU_FILESHARE_SELECT_FILM_CAPS" ) )
		self.body.selectFilmButton.hintText = Engine.Localize( "MENU_FILESHARE_SELECT_FILM_DESC" )
		self.body.selectFilmButton:setActionEventName( "open_select_film" )
		self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
		self.body.createHighlightReelButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_CREATE_HIGHLIGHT_CAPS" ) )
		self.body.createHighlightReelButton.hintText = Engine.Localize( "MENU_THEATER_LOAD_HINT" )
		self.body.createHighlightReelButton:setActionEventName( "create_highlight_reel" )
		self.body.createHighlightReelButton:disable()
		if CoD.isZombie == false then
			self.body.shoutcastFilmButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_SHOUTCAST_FILM_CAPS" ) )
			self.body.shoutcastFilmButton.hintText = Engine.Localize( "MENU_THEATER_LOAD_HINT" )
			self.body.shoutcastFilmButton:setActionEventName( "shoutcast_film" )
			self.body.shoutcastFilmButton:disable()
		end
		if CoD.TheaterLobby.CanRenderVideo( controller ) then
			self.body.renderClipButton = self.body.buttonList:addButton( Engine.Localize( "MENU_DEMO_RENDER_CLIP_CAPS" ) )
			self.body.renderClipButton.hintText = Engine.Localize( "MENU_THEATER_LOAD_HINT" )
			self.body.renderClipButton:setActionEventName( "render_clip" )
			self.body.renderClipButton:disable()
		end
		self.body.fileOptionsButton = self.body.buttonList:addButton( Engine.Localize( "MENU_FILM_OPTIONS" ) )
		self.body.fileOptionsButton.hintText = Engine.Localize( "MENU_THEATER_LOAD_HINT" )
		self.body.fileOptionsButton:setActionEventName( "film_options_flyout" )
		self.body.fileOptionsButton:disable()
		self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	end
	if Engine.IsBetaBuild() then
		self.body.codtvButton = self.body.buttonList:addButton( Engine.Localize( "MENU_FILESHARE_COMMUNITY_CAPS" ) )
		self.body.codtvButton:setActionEventName( "open_codtv" )
		self.body.codtvButton.hintText = Engine.Localize( "MPUI_COD_TV_DESC" )
	else
		self.body.codtvButton = self.body.buttonList:addButton( Engine.Localize( "MENU_COD_TV_CAPS" ) )
		self.body.codtvButton.hintText = Engine.Localize( "MPUI_COD_TV_DESC" )
		self.body.codtvButton:setActionEventName( "open_codtv" )
	end
	if not Engine.IsBetaBuild() then
		self.body.barracksButton = self.body.buttonList:addButton( Engine.Localize( CoD.MPZM( "MENU_BARRACKS_CAPS", "MPUI_LEADERBOARDS_CAPS" ) ) )
		CoD.SetupBarracksLock( self.body.barracksButton )
		self.body.barracksButton:setActionEventName( "open_barracks" )
	end
	if isHost == true then
		if not self:restoreState() then
			self.body.startFilmButton:processEvent( {
				name = "gain_focus"
			} )
		end
	elseif not self:restoreState() then
		if Engine.IsBetaBuild() then
			self.body.codtvButton:processEvent( {
				name = "gain_focus"
			} )
		else
			self.body.barracksButton:processEvent( {
				name = "gain_focus"
			} )
		end
	end
	if self.body.mapInfoImage ~= nil then
		self.body.mapInfoImage:close()
		self.body.mapInfoImage = nil
	end
	local mapInfoImageLeft = 0
	local mapInfoImageWidth = 350 - CoD.CoD9Button.Height - mapInfoImageLeft
	local mapInfoImageHeight = mapInfoImageWidth / CoD.MapInfoImage.AspectRatio
	self.body.mapInfoImage = CoD.MapInfoImage.new( {
		left = 0,
		top = -mapInfoImageHeight - CoD.ButtonPrompt.Height - 15,
		right = mapInfoImageWidth,
		bottom = -CoD.ButtonPrompt.Height - 15,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true
	} )
	self.body.mapInfoImage:setPriority( 200 )
	self.body.mapInfoImage.id = "TheaterInfo"
	self.body.mapInfoImage.theaterUpdate = CoD.MapInfoImage.TheaterUpdate
	self.body.mapInfoImage:registerEventHandler( "gamelobby_update", nil )
	self.body.mapInfoImage:registerEventHandler( "gametype_update", nil )
	self.body.mapInfoImage:registerEventHandler( "game_options_update", nil )
	self.body.mapInfoImage:registerEventHandler( "map_update", nil )
	self.body.mapInfoImage:theaterUpdate( isHost, Engine.DvarString( self.controller, "ui_mapname" ), Engine.DvarString( self.controller, "ui_gametype" ) )
	self.body:addElement( self.body.mapInfoImage )
	CoD.PrivateGameLobby.AddDLCWarning( self, isHost )
end

CoD.TheaterLobby.UpdateLobbyButtons = function ( self, event )
	local isHost = CoD.PrivateGameLobby.IsHost( self, self.panelManager.ownerController )
	if isHost == true and self.body ~= nil then
		if self.body.startFilmButton == nil then
			CoD.TheaterLobby.PopulateButtons( self )
			self.body.barracksButton:processEvent( {
				name = "lose_focus"
			} )
		end
		local f8_local0 = Engine.DvarString( self.controller, "ui_demoname" ) ~= ""
		local haveAllPlayersFinishedDownloading, task_readFileInProgress, areAllPlayersReadyToLoadDemo, isClip, isFilm, isPooled = nil
		local numPlayers = Engine.PartyGetPlayerCount()
		local renderDurationWithinLimit = nil
		local canRenderClip = Engine.CanRenderClip()
		if event ~= nil then
			task_readFileInProgress = event.task_readFileInProgress
			haveAllPlayersFinishedDownloading = event.haveAllPlayersFinishedDownloading
			areAllPlayersReadyToLoadDemo = event.areAllPlayersReadyToLoadDemo and Engine.IsSignedInToDemonware( self.contoller )
			isPooled = event.isPooled
			isClip = event.category == "clip"
			isFilm = event.category == "film"
			if event.duration ~= nil then
				renderDurationWithinLimit = event.duration <= Dvar.demoRenderDuration:get() * 1000
			else
				renderDurationWithinLimit = false
			end
			CoD.TheaterLobby.m_fileInfo.name = event.fileName
			CoD.TheaterLobby.m_fileInfo.description = event.fileDescription
			CoD.TheaterLobby.m_fileInfo.matchID = event.matchID
			CoD.TheaterLobby.m_fileInfo.fileID = event.fileID
			CoD.TheaterLobby.m_fileInfo.category = event.category
			CoD.TheaterLobby.m_fileInfo.isPooled = event.isPooled
		else
			task_readFileInProgress = false
			haveAllPlayersFinishedDownloading = false
			areAllPlayersReadyToLoadDemo = false
			isClip = false
			isFilm = false
			renderDurationWithinLimit = false
		end
		if f8_local0 then
			self.body.startFilmButton.hintText = Engine.Localize( "MPUI_START_FILM_DESC" )
			self.body.createHighlightReelButton.hintText = Engine.Localize( "MPUI_CREATE_HIGHLIGHTREEL_DESC" )
			self.body.fileOptionsButton.hintText = Engine.Localize( "MENU_FILM_OPTIONS_HINT" )
			if CoD.isZombie == false then
				self.body.shoutcastFilmButton.hintText = Engine.Localize( "MPUI_SHOUTCAST_FILM_DESC" )
			end
			if not CoD.isWIIU and self.body.renderClipButton then
				self.body.renderClipButton.hintText = Engine.GetRenderTooltip()
			end
		else
			self.body.startFilmButton.hintText = Engine.Localize( "MENU_THEATER_LOAD_HINT" )
			self.body.createHighlightReelButton.hintText = Engine.Localize( "MENU_THEATER_LOAD_HINT" )
			if CoD.isZombie == false then
				self.body.shoutcastFilmButton.hintText = Engine.Localize( "MENU_THEATER_LOAD_HINT" )
			end
			if not CoD.isWIIU and self.body.renderClipButton then
				self.body.renderClipButton.hintText = Engine.Localize( "MENU_THEATER_LOAD_HINT" )
			end
		end
		if f8_local0 and areAllPlayersReadyToLoadDemo then
			if self.body.startFilmButton.disabled then
				local partyHasDLCForMap = Engine.DoesPartyHaveDLCForMap( Dvar.ui_mapname:get() )
				if partyHasDLCForMap then
					self.body.startFilmButton:enable()
				end
			end
		elseif self.body.startFilmButton.disabled == nil then
			self.body.startFilmButton:disable()
		end
		if f8_local0 then
			if self.body.fileOptionsButton.disabled then
				self.body.fileOptionsButton:enable()
			end
		elseif self.body.fileOptionsButton.disabled == nil then
			self.body.fileOptionsButton:disable()
		end
		if f8_local0 and isFilm and areAllPlayersReadyToLoadDemo and numPlayers <= 1 then
			if self.body.createHighlightReelButton.disabled then
				self.body.createHighlightReelButton:enable()
			end
		elseif self.body.createHighlightReelButton.disabled == nil then
			self.body.createHighlightReelButton:disable()
		end
		if CoD.isZombie == false then
			if f8_local0 and isFilm and areAllPlayersReadyToLoadDemo and numPlayers <= 1 then
				if self.body.shoutcastFilmButton.disabled then
					self.body.shoutcastFilmButton:enable()
				end
			elseif self.body.shoutcastFilmButton.disabled == nil then
				self.body.shoutcastFilmButton:disable()
			end
		end
		if not CoD.isWIIU and self.body.renderClipButton then
			if f8_local0 and canRenderClip and renderDurationWithinLimit and areAllPlayersReadyToLoadDemo and numPlayers <= 1 then
				if self.body.renderClipButton.disabled then
					self.body.renderClipButton:enable()
				end
			elseif self.body.renderClipButton.disabled == nil then
				self.body.renderClipButton:disable()
			end
		end
	end
end

CoD.TheaterLobby.UpdateButtonPaneButtons = function ( self, event )
	CoD.TheaterLobby.UpdateLobbyButtons( self, event )
	self.body.mapInfoImage:theaterUpdate( CoD.PrivateGameLobby.IsHost( self, self.panelManager.ownerController ), Engine.DvarString( self.controller, "ui_mapname" ), Engine.DvarString( self.controller, "ui_gametype" ) )
end

CoD.TheaterLobby.ButtonListButtonGainFocus = function ( self, event )
	self:dispatchEventToParent( {
		name = "add_party_privacy_button"
	} )
	CoD.Lobby.ButtonListButtonGainFocus( self, event )
end

CoD.TheaterLobby.ButtonListAddButton = function ( self, text, hintText, priority )
	local newButton = CoD.Lobby.ButtonListAddButton( self, text, hintText, priority )
	newButton:registerEventHandler( "gain_focus", CoD.TheaterLobby.ButtonListButtonGainFocus )
	return newButton
end

CoD.TheaterLobby.AddButtonPaneElements = function ( self )
	CoD.LobbyPanes.addButtonPaneElements( self )
	self.body.buttonList.addButton = CoD.TheaterLobby.ButtonListAddButton
end

CoD.TheaterLobby.PopulateButtonPaneElements = function ( self )
	CoD.TheaterLobby.PopulateButtons( self )
	CoD.TheaterLobby.UpdateButtonPaneButtons( self, nil )
end

CoD.TheaterLobby.AddLobbyPaneElements = function ( self )
	CoD.PrivateGameLobby.AddLobbyPaneElements( self, nil, 0 )
end

CoD.TheaterLobby.GameLobbyUpdate = function ( self, event )
	if self.mapInfoImage ~= nil then
		self.mapInfoImage:theaterUpdate( CoD.PrivateGameLobby.IsHost( self, self.panelManager.ownerController ), Engine.DvarString( event.controller, "ui_mapname" ), Engine.DvarString( event.controller, "ui_gametype" ) )
	end
	CoD.PrivateGameLobby.PopulateButtonPrompts( self )
	self:dispatchEventToChildren( event )
end

CoD.TheaterLobby.TheaterLobbyUpdate = function ( self, event )
	self.updateLobbyButtons( self.buttonPane, event )
	if self.buttonPane.body ~= nil and self.buttonPane.body.mapInfoImage.theaterUpdate ~= nil then
		self.buttonPane.body.mapInfoImage:theaterUpdate( CoD.PrivateGameLobby.IsHost( self, self.panelManager.ownerController ), Engine.DvarString( self.controller, "ui_mapname" ), Engine.DvarString( self.controller, "ui_gametype" ), event.downloadPercent, event.areAllPlayersReadyToLoadDemo )
	end
end

CoD.TheaterLobby.LeaveLobby = function ( self, event )
	Engine.ExecNow( event.controller, "demo_abortfilesharedownload" )
	CoD.PrivateGameLobby.LeaveLobby( self, event )
end

CoD.TheaterLobby.ButtonBack = function ( self, event )
	CoD.Lobby.ConfirmLeaveGameLobby( self, {
		controller = event.controller,
		leaveLobbyHandler = CoD.TheaterLobby.LeaveLobby
	} )
end

CoD.TheaterLobby.OpenCodtv = function ( self, event )
	if Engine.IsLivestreamEnabled() then
		self:openPopup( "CODTv_Error", event.controller )
		return 
	elseif Engine.IsCodtvContentLoaded() == true then
		CoD.perController[event.controller].codtvRoot = "community"
		self:openPopup( "CODTv", event.controller )
	end
end

CoD.TheaterLobby.OpenSelectFilm = function ( self, event )
	if Engine.IsCodtvContentLoaded() == true then
		CoD.perController[event.controller].codtvRoot = "recents"
		self:openPopup( "CODTv", event.controller )
	end
end

CoD.TheaterLobby.StartFilm = function ( self, event )
	Engine.Exec( event.controller, "xpartyplaydemo" )
end

CoD.TheaterLobby.CreateHighlightReel = function ( self, event )
	Engine.Exec( event.controller, "demo_play film.demo CreateHighlightReel" )
end

CoD.TheaterLobby.ShoutcastFilm = function ( self, event )
	Engine.Exec( event.controller, "demo_play film.demo Shoutcast" )
end

CoD.TheaterLobby.FileOptions_Save = function ( theaterLobby, event )
	local downloadProgress = Engine.GetDemoStreamedDownloadProgress()
	CoD.perController[event.controller].fileshareSaveFileID = CoD.TheaterLobby.m_fileInfo.fileID
	CoD.perController[event.controller].fileshareSaveCategory = CoD.TheaterLobby.m_fileInfo.category
	CoD.perController[event.controller].fileshareGameType = Dvar.ui_gametype:get()
	CoD.perController[event.controller].fileshareSaveMap = Dvar.ui_mapname:get()
	CoD.perController[event.controller].fileshareSaveName = CoD.TheaterLobby.m_fileInfo.name
	CoD.perController[event.controller].fileshareSaveDescription = CoD.TheaterLobby.m_fileInfo.description
	CoD.perController[event.controller].fileshareSaveIsCopy = true
	CoD.perController[event.controller].fileshareSaveIsPooled = CoD.TheaterLobby.m_fileInfo.isPooled
	CoD.perController[event.controller].fileshareZmMapStartLocation = nil
	CoD.perController[event.controller].fileshareZmMapStartLocationName = nil
	CoD.perController[event.controller].fileshareSaveSkipThumbnail = true
	theaterLobby:openPopup( "FileshareSave", event.controller )
end

CoD.TheaterLobby.FileOptions_LikeDislike = function ( theaterLobby, event )
	local voteData = {
		fileID = CoD.TheaterLobby.m_fileInfo.fileID,
		category = CoD.TheaterLobby.m_fileInfo.category,
		map = Dvar.ui_mapname:get(),
		gameType = Dvar.ui_gametype:get(),
		fromLobby = true,
		description = CoD.TheaterLobby.m_fileInfo.description,
		name = CoD.TheaterLobby.m_fileInfo.name
	}
	CoD.perController[event.controller].voteData = voteData
	CoD.perController[event.controller].voteUpdateTarget = theaterLobby
	local votePopup = theaterLobby:openPopup( "FileshareVote", event.controller )
end

CoD.TheaterLobby.RenderClip = function ( self, event )
	CoD.perController[event.controller].fileshareSaveCategory = "render"
	CoD.perController[event.controller].fileshareSaveIsCopy = false
	CoD.perController[event.controller].fileshareSaveIsPooled = false
	CoD.perController[event.controller].fileshareSaveMap = Dvar.ui_mapname:get()
	CoD.perController[event.controller].fileshareSaveName = CoD.TheaterLobby.m_fileInfo.name
	CoD.perController[event.controller].fileshareSaveDescription = CoD.TheaterLobby.m_fileInfo.description
	CoD.perController[event.controller].fileshareSaveMatchID = CoD.TheaterLobby.m_fileInfo.matchID
	self:openPopup( "FileshareSave", event.controller )
end

CoD.TheaterLobby.RenderComplete = function ( self, event )
	local userData = {}
	if event.cancelled ~= nil and event.cancelled == true then
		userData.message = Engine.Localize( "MENU_RENDER_CANCELLED" )
	elseif event.success ~= nil and event.success == true then
		userData.message = Engine.Localize( "MENU_RENDER_SUCCESS", Dvar.fshRenderSuccessURL:get() )
	else
		userData.message = Engine.Localize( "MENU_RENDER_FAILED" )
	end
	Engine.ExecNow( event.controller, "demo_clearrenderflag" )
	self:openPopup( "popup_render_complete", event.controller, userData )
end

