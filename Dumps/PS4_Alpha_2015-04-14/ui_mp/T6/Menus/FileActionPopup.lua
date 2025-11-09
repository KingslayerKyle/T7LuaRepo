require( "ui_mp.T6.Menus.FileshareVote" )

CoD.FileAction = {}
CoD.FileAction.AnyFileshareTaskInProgress = function ( controller )
	if Engine.IsTaskInProgress( controller, "LiveFileShareRemoveFile" ) then
		return true
	elseif Engine.IsTaskInProgress( controller, "LiveFileShareWriteFile" ) then
		return true
	elseif Engine.IsTaskInProgress( controller, "LiveFileShareTransfer" ) then
		return true
	elseif Engine.IsTaskInProgress( controller, "LiveFileShareReadFile" ) then
		return true
	elseif Engine.IsTaskInProgress( controller, "LiveFileGetShareSummary" ) then
		return true
	else
		return false
	end
end

CoD.FileAction.GoToTheater = function ( self, event )
	if not Engine.CanSwitchToLobby( Dvar.party_maxplayers_theater:get(), Dvar.party_maxlocalplayers_theater:get() ) == 0 then
		Dvar.ui_errorTitle:set( Engine.Localize( "MENU_NOTICE_CAPS" ) )
		Dvar.ui_errorMessage:set( Engine.Localize( "MENU_FILESHARE_MAX_LOCAL_PLAYERS" ) )
		CoD.Menu.OpenErrorPopup( self, {
			controller = event.controller
		} )
	else
		local controller = event.controller
		local isGameHost = Engine.GameHost()
		local inLobby = Engine.InLobby()
		local isPrivatePartyHost = Engine.PrivatePartyHost()
		if isGameHost ~= 1 or inLobby ~= 1 then
			local f2_local0 = false
		else
			local isLobbyHost = true
		end
		self:registerEventHandler( "go_to_theater", CoD.NullFunction )
		self:registerEventHandler( "button_prompt_back", CoD.NullFunction )
		Engine.ExecNow( controller, "xstopparty" )
		if f2_local0 then
			Engine.ExecNow( controller, "xstopprivateparty" )
		end
		CoD.SwitchToTheaterLobby( controller )
		Engine.ExecNow( controller, "setactivemenu theater" )
		CoD.FileAction.LoadFile( self.info )
	end
end

CoD.FileAction.LoadFile = function ( info )
	if info == nil then
		return 
	else
		Engine.SetDvar( "ui_mapname", info.map )
		Engine.SetDvar( "ui_gametype", info.gametype )
		Engine.SetDvar( "ui_demoname", "Film.demo" )
		Engine.LobbyUpdateDemoInformation( info )
		Engine.Exec( controller, "xupdatepartystate" )
	end
end

CoD.FileAction.Open = function ( menu, info )
	if CoD.perController[info.controller].fileActionInfo.category == "screenshot" then
		menu:openPopup( "Screenshot_Viewer", info.controller, info.targetCarousel )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			CoD.FileAction.LoadFile( info )
			menu:dispatchEventToRoot( {
				name = "close_all_popups",
				controller = info.controller
			} )
		else
			Dvar.ui_errorTitle:set( Engine.Localize( "MENU_NOTICE_CAPS" ) )
			Dvar.ui_errorMessage:set( Engine.Localize( "MENU_FILESHARE_ONLY_HOST_ALLOWED_TO_LOAD" ) )
			CoD.Menu.OpenErrorPopup( menu, {
				controller = info.controller
			} )
		end
	elseif not Engine.CanSwitchToLobby() then
		Dvar.ui_errorTitle:set( Engine.Localize( "MENU_NOTICE_CAPS" ) )
		Dvar.ui_errorMessage:set( Engine.Localize( "MENU_FILESHARE_MAX_LOCAL_PLAYERS" ) )
		CoD.Menu.OpenErrorPopup( menu, {
			controller = info.controller
		} )
	else
		menu:openPopup( "FileAction", info.controller, info )
	end
end

LUI.createMenu.FileAction = function ( controller, info )
	local fileActionPopup = CoD.Menu.NewSmallPopup( "FileAction" )
	fileActionPopup:setOwner( controller )
	fileActionPopup.info = info
	fileActionPopup:addSelectButton()
	fileActionPopup:addBackButton()
	fileActionPopup:registerEventHandler( "go_to_theater", CoD.FileAction.GoToTheater )
	local top = 5
	local messageText = LUI.UIText.new()
	messageText:setLeftRight( true, true, 0, 0 )
	messageText:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	messageText:setFont( CoD.fonts.Condensed )
	messageText:setAlignment( LUI.Alignment.Left )
	messageText:setText( Engine.Localize( "MENU_GO_TO_THEATER_CONFIRMATION" ) )
	fileActionPopup:addElement( messageText )
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
	fileActionPopup:addElement( buttonList )
	local yesButton = buttonList:addButton( Engine.Localize( "MENU_YES" ) )
	yesButton:setActionEventName( "go_to_theater" )
	yesButton:disable()
	local noButton = buttonList:addButton( Engine.Localize( "MENU_NO" ) )
	noButton:setActionEventName( "button_prompt_back" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	return fileActionPopup
end

CoD.FileAction.GoToCustomGames = function ( fileActionPopup, event )
	local controller = event.controller
	local isGameHost = Engine.GameHost()
	local inLobby = Engine.InLobby()
	local isPrivatePartyHost = Engine.PrivatePartyHost()
	if isGameHost ~= 1 or inLobby ~= 1 then
		local f6_local0 = false
	else
		local isLobbyHost = true
	end
	Engine.ExecNow( controller, "xstopparty" )
	if f6_local0 then
		Engine.ExecNow( controller, "xstopprivateparty" )
	end
	Dvar.fshCustomGameName:set( fileActionPopup.m_fileName )
	CoD.SwitchToPrivateLobby( controller )
	Engine.SetActiveMenu( event.controller, CoD.UIMENU_PRIVATELOBBY )
	Engine.DownloadGameSettings( controller, fileActionPopup.m_fileID, fileActionPopup.m_gameType )
end

LUI.createMenu.LoadCustomGames = function ( controller, userInfo )
	local fileActionPopup = CoD.Menu.NewSmallPopup( "LoadCustomGames" )
	fileActionPopup:setOwner( controller )
	fileActionPopup.m_fileID = userInfo.fileID
	fileActionPopup.m_gameType = userInfo.gameType
	fileActionPopup.m_fileName = userInfo.fileName
	fileActionPopup:addSelectButton()
	fileActionPopup:addBackButton()
	fileActionPopup:registerEventHandler( "go_to_customgames", CoD.FileAction.GoToCustomGames )
	local top = 5
	local messageText = LUI.UIText.new()
	messageText:setLeftRight( true, true, 0, 0 )
	messageText:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	messageText:setFont( CoD.fonts.Condensed )
	messageText:setAlignment( LUI.Alignment.Left )
	messageText:setText( Engine.Localize( "MENU_GO_TO_CUSTOM_GAME_CONFIRMATION" ) )
	fileActionPopup:addElement( messageText )
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
	fileActionPopup:addElement( buttonList )
	local yesButton = buttonList:addButton( Engine.Localize( "MENU_YES" ) )
	yesButton:setActionEventName( "go_to_customgames" )
	local noButton = buttonList:addButton( Engine.Localize( "MENU_NO" ) )
	noButton:setActionEventName( "button_prompt_back" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	return fileActionPopup
end

function ScreenshotViewer_Back( self, event )
	Engine.ExecNow( event.controller, "screenshotViewerAbortDownload" )
	self:goBack( event.controller )
end

function ScreenshotViewer_DownloadScreenshot( self, event )
	if CoD.FileAction.AnyFileshareTaskInProgress( self.info.controller ) then
		return 
	else
		Engine.Exec( self.info.controller, "screenshotViewerDownload " .. self.info.fileID .. " " .. self.info.fileSize )
		self.downloadTimer:close()
	end
end

function ScreenshotViewer_ToggleControls( screenshotViewer, event )
	if screenshotViewer.m_controlsVisible == true then
		screenshotViewer.leftButtonPromptBar:setAlpha( 0 )
		screenshotViewer.rightButtonPromptBar:setAlpha( 0 )
		screenshotViewer.buttonBarBg:setAlpha( 0 )
		screenshotViewer.m_controlsVisible = false
	else
		screenshotViewer.leftButtonPromptBar:setAlpha( 1 )
		screenshotViewer.rightButtonPromptBar:setAlpha( 1 )
		screenshotViewer.buttonBarBg:setAlpha( 1 )
		screenshotViewer.m_controlsVisible = true
	end
end

function ScreenshotViewer_DetailsFadeOut( screenshotViewer, event )
	screenshotViewer.detailsPane:completeAnimation()
	screenshotViewer.detailsPane:beginAnimation( "fade_out", 750 )
	screenshotViewer.detailsPane:setAlpha( 0 )
end

function ScreenshotViewer_Vote( screenshotViewer, event )
	CoD.perController[event.controller].voteData = screenshotViewer.info
	CoD.perController[event.controller].voteUpdateTarget = screenshotViewer
	local popup = screenshotViewer:openPopup( "FileshareVote", event.controller )
end

function ScreenshotViewer_CanMoveNext( carouselList )
	local focussedCarousel = carouselList.cardCarousels[carouselList.m_currentCardCarouselIndex]
	if focussedCarousel == nil then
		return false
	else
		local focussedCard = focussedCarousel.horizontalList.cards[focussedCarousel.horizontalList.m_currentCardIndex]
		if focussedCard == nil then
			return false
		elseif focussedCarousel.horizontalList.m_currentCardIndex == #focussedCarousel.horizontalList.cards then
			return false
		else
			local nextCard = focussedCarousel.horizontalList.cards[focussedCarousel.horizontalList.m_currentCardIndex + 1]
			if nextCard.fileData == nil or nextCard.fileData.category ~= "screenshot" then
				return false
			else
				return true
			end
		end
	end
end

function ScreenshotViewer_CanMovePrev( carouselList )
	local focussedCarousel = carouselList.cardCarousels[carouselList.m_currentCardCarouselIndex]
	if focussedCarousel == nil then
		return false
	else
		local focussedCard = focussedCarousel.horizontalList.cards[focussedCarousel.horizontalList.m_currentCardIndex]
		if focussedCard == nil then
			return false
		elseif focussedCarousel.horizontalList.m_currentCardIndex == 1 then
			return false
		else
			local prevCard = focussedCarousel.horizontalList.cards[focussedCarousel.horizontalList.m_currentCardIndex - 1]
			if prevCard.fileData == nil or prevCard.fileData.category ~= "screenshot" then
				return false
			else
				return true
			end
		end
	end
end

function ScreenshotViewer_UpdateButtonPrompts( screenshotViewer )
	screenshotViewer.rightButtonPromptBar:removeAllChildren()
	if CoD.isPS3 then
		local panPrompt = CoD.ButtonPrompt.new( "emblem_move", Engine.Localize( "MPUI_PAN" ), screenshotViewer, nil )
		screenshotViewer:addRightButtonPrompt( panPrompt )
	else
		local panPrompt = CoD.ButtonPrompt.new( "left_stick_up", Engine.Localize( "MPUI_PAN" ), screenshotViewer, nil, false, nil, false, "mouse2" )
		screenshotViewer:addRightButtonPrompt( panPrompt )
	end
	local zoomPrompt = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MPUI_ZOOM" ), screenshotViewer, nil, false, nil, false, "mouse1" )
	screenshotViewer:addRightButtonPrompt( zoomPrompt )
	local votePrompt = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_FILESHARE_LIKEDISLIKE" ), screenshotViewer, "scr_vote" )
	screenshotViewer:addRightButtonPrompt( votePrompt )
	if ScreenshotViewer_CanMoveNext( screenshotViewer.m_targetCarouselList ) then
		local nextPrompt = CoD.ButtonPrompt.new( "shoulderr", Engine.Localize( "MENU_NEXT" ), screenshotViewer, "scr_movenext" )
		screenshotViewer:addRightButtonPrompt( nextPrompt )
	end
	if ScreenshotViewer_CanMovePrev( screenshotViewer.m_targetCarouselList ) then
		local prevPrompt = CoD.ButtonPrompt.new( "shoulderl", Engine.Localize( "MENU_PREVIOUS" ), screenshotViewer, "scr_moveprev" )
		screenshotViewer:addRightButtonPrompt( prevPrompt )
	end
end

function ScreenshotViewer_Reload( screenshotViewer, controller )
	screenshotViewer.info = CoD.perController[controller].fileActionInfo
	if screenshotViewer.info == nil or screenshotViewer.info.category ~= "screenshot" then
		screenshotViewer:goBack( controller )
		return 
	end
	screenshotViewer.detailsPane:completeAnimation()
	screenshotViewer.detailsPane:setAlpha( 1 )
	screenshotViewer.name:setText( screenshotViewer.info.name )
	screenshotViewer.author:setText( Engine.Localize( "MENU_FILESHARE_AUTHOR" ) .. " " .. screenshotViewer.info.author )
	screenshotViewer.description:setText( screenshotViewer.info.description )
	local fullScreenHeight = 720
	local fullScreenWidth = 1280
	if not Dvar.hiDef:get() then
		fullScreenWidth = 960
		fullScreenHeight = fullScreenWidth * 9 / 16
	end
	local screenshot = LUI.UIImage.new()
	screenshot:setLeftRight( false, false, -fullScreenWidth / 2, fullScreenWidth / 2 )
	screenshot:setTopBottom( false, false, -fullScreenHeight / 2, fullScreenHeight / 2 )
	screenshot:setRGB( 1, 1, 1 )
	screenshot:setAlpha( 1 )
	screenshot:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_SCREENSHOT, tostring( screenshotViewer.info.fileID ) )
	screenshot:setPriority( -5 )
	screenshotViewer:addElement( screenshot )
	screenshotViewer.screenshot = screenshot
	
	if screenshotViewer.downloadTimer ~= nil then
		screenshotViewer.downloadTimer:close()
		screenshotViewer.downloadTimer = nil
	end
	screenshotViewer.downloadTimer = LUI.UITimer.new( 2000, {
		name = "download_screenshot",
		controller = controller
	}, false )
	screenshotViewer:addElement( screenshotViewer.downloadTimer )
	if screenshotViewer.detailsFadeOutTime ~= nil then
		screenshotViewer.detailsFadeOutTime:close()
		screenshotViewer.detailsFadeOutTime = nil
	end
	screenshotViewer.detailsFadeOutTime = LUI.UITimer.new( 10000, {
		name = "details_fadeout",
		controller = controller
	}, false )
	screenshotViewer:addElement( screenshotViewer.detailsFadeOutTime )
	ScreenshotViewer_UpdateButtonPrompts( screenshotViewer )
	if CoD.isPC then
		Engine.Exec( controller, "screenshotZoom 0.0f" )
	end
end

function ScreenshotViewer_SimulateMove( screenshotViewer, moveEvent, controller )
	if screenshotViewer.m_targetCarouselList ~= nil then
		Engine.ExecNow( controller, "screenshotViewerAbortDownload" )
		screenshotViewer.screenshot:close()
		screenshotViewer.m_targetCarouselList:processEvent( {
			name = moveEvent,
			controller = controller
		} )
		ScreenshotViewer_Reload( screenshotViewer, controller )
	end
end

function ScreenshotViewer_MoveNext( screenshotViewer, event )
	ScreenshotViewer_SimulateMove( screenshotViewer, "move_next", event.controller )
end

function ScreenshotViewer_MovePrev( screenshotViewer, event )
	ScreenshotViewer_SimulateMove( screenshotViewer, "move_prev", event.controller )
end

LUI.createMenu.Screenshot_Viewer = function ( controller, targetCarousel )
	local screenshotViewer = CoD.Menu.New( "Screenshot_Viewer" )
	screenshotViewer:setOwner( controller )
	screenshotViewer.info = CoD.perController[controller].fileActionInfo
	screenshotViewer.m_targetCarouselList = targetCarousel
	screenshotViewer.m_controlsVisible = true
	screenshotViewer:registerEventHandler( "button_prompt_back", ScreenshotViewer_Back )
	screenshotViewer:registerEventHandler( "download_screenshot", ScreenshotViewer_DownloadScreenshot )
	screenshotViewer:registerEventHandler( "details_fadeout", ScreenshotViewer_DetailsFadeOut )
	screenshotViewer:registerEventHandler( "scr_toggle_controls", ScreenshotViewer_ToggleControls )
	screenshotViewer:registerEventHandler( "scr_vote", ScreenshotViewer_Vote )
	screenshotViewer:registerEventHandler( "scr_movenext", ScreenshotViewer_MoveNext )
	screenshotViewer:registerEventHandler( "scr_moveprev", ScreenshotViewer_MovePrev )
	local fullScreenHeight = 720
	local fullScreenWidth = 1280
	local blackBg = LUI.UIImage.new()
	blackBg:setLeftRight( false, false, -fullScreenWidth / 2, fullScreenWidth / 2 )
	blackBg:setTopBottom( false, false, -fullScreenHeight / 2, fullScreenHeight / 2 )
	blackBg:setRGB( 0, 0, 0 )
	blackBg:setAlpha( 1 )
	blackBg:setPriority( -10 )
	screenshotViewer:addElement( blackBg )
	if not Dvar.hiDef:get() then
		fullScreenWidth = 960
		fullScreenHeight = fullScreenWidth * 9 / 16
	end
	local buttonBarBg = LUI.UIImage.new()
	buttonBarBg:setLeftRight( false, false, -fullScreenWidth / 2, fullScreenWidth / 2 )
	buttonBarBg:setTopBottom( false, true, -28, 5 )
	if CoD.isZombie == true then
		buttonBarBg:setRGB( 0, 0, 0 )
	else
		buttonBarBg:setImage( RegisterMaterial( "hud_shoutcasting_bar_stretch" ) )
	end
	buttonBarBg:setAlpha( 0.8 )
	buttonBarBg:setPriority( -4 )
	screenshotViewer.buttonBarBg = buttonBarBg
	screenshotViewer:addElement( buttonBarBg )
	local detailsPane = LUI.UIElement.new()
	detailsPane:setLeftRight( true, true, 0, 0 )
	detailsPane:setTopBottom( false, true, -90, -25 )
	screenshotViewer:addElement( detailsPane )
	local imgBg = LUI.UIImage.new()
	imgBg:setLeftRight( false, false, -fullScreenWidth / 2, fullScreenWidth / 2 )
	imgBg:setTopBottom( true, true, 0, 0 )
	imgBg:setRGB( 0, 0, 0 )
	imgBg:setAlpha( 0.8 )
	detailsPane:addElement( imgBg )
	local name = LUI.UIText.new()
	name:setLeftRight( true, true, 0, 0 )
	name:setTopBottom( true, false, 0, CoD.textSize.Condensed )
	name:setAlignment( LUI.Alignment.Left )
	name:setText( screenshotViewer.info.name )
	screenshotViewer.name = name
	detailsPane:addElement( name )
	local author = LUI.UIText.new()
	author:setLeftRight( true, true, 0, 0 )
	author:setTopBottom( true, false, 0, CoD.textSize.Condensed )
	author:setAlignment( LUI.Alignment.Right )
	author:setText( Engine.Localize( "MENU_FILESHARE_AUTHOR" ) .. " " .. screenshotViewer.info.author )
	screenshotViewer.author = author
	detailsPane:addElement( author )
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, true, 0, 0 )
	description:setTopBottom( true, false, CoD.textSize.Condensed, CoD.textSize.Condensed + CoD.textSize.ExtraSmall )
	description:setFont( CoD.fonts.ExtraSmall )
	description:setAlignment( LUI.Alignment.Left )
	description:setText( screenshotViewer.info.description )
	detailsPane:addElement( description )
	screenshotViewer.description = description
	
	screenshotViewer.detailsPane = detailsPane
	screenshotViewer:addBackButton()
	local controlsPrompt = CoD.ButtonPrompt.new( "select", Engine.Localize( "MENU_DEMO_CONTROLS_TOGGLE_CONTROLS" ), screenshotViewer, "scr_toggle_controls" )
	screenshotViewer:addLeftButtonPrompt( controlsPrompt )
	if not screenshotViewer.info.CRMode then
		ScreenshotViewer_UpdateButtonPrompts( screenshotViewer )
	end
	local popupTitle = LUI.UIText.new()
	popupTitle:setLeftRight( true, true, 0, 0 )
	popupTitle:setTopBottom( true, false, 0, CoD.textSize.Big )
	popupTitle:setFont( CoD.fonts.Big )
	popupTitle:setAlignment( LUI.Alignment.Left )
	popupTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	popupTitle:setText( Engine.Localize( "MPUI_SCREENSHOT_CAPS" ) )
	popupTitle:setPriority( -6 )
	screenshotViewer:addElement( popupTitle )
	
	local screenshot = LUI.UIImage.new()
	screenshot:setLeftRight( false, false, -fullScreenWidth / 2, fullScreenWidth / 2 )
	screenshot:setTopBottom( false, false, -fullScreenHeight / 2, fullScreenHeight / 2 )
	screenshot:setRGB( 1, 1, 1 )
	screenshot:setAlpha( 1 )
	screenshot:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_SCREENSHOT, tostring( screenshotViewer.info.fileID ) )
	screenshot:setPriority( -5 )
	screenshotViewer:addElement( screenshot )
	screenshotViewer.screenshot = screenshot
	
	screenshotViewer.downloadTimer = LUI.UITimer.new( 200, {
		name = "download_screenshot",
		controller = controller
	}, false )
	screenshotViewer:addElement( screenshotViewer.downloadTimer )
	screenshotViewer.detailsFadeOutTime = LUI.UITimer.new( 10000, {
		name = "details_fadeout",
		controller = controller
	}, false )
	screenshotViewer:addElement( screenshotViewer.detailsFadeOutTime )
	if CoD.isPC then
		Engine.Exec( controller, "screenshotZoom 0.0f" )
	end
	return screenshotViewer
end

CoD.FileAction.VideoPlayer = {}
CoD.FileAction.VideoPlayer.CloseTimerHandler = function ( videoPlayer, controller )
	if CoD.Codtv.WebMPlayback ~= nil then
		Engine.WebM_Close( CoD.Codtv.WebMPlayback )
		CoD.Codtv.WebMPlayback = nil
	end
	Engine.PlayMenuMusic( "mus_mp_frontend" )
	videoPlayer.m_closeTimer:close()
	videoPlayer.m_closeTimer = nil
	CoD.Menu.goBack( videoPlayer, controller )
end

CoD.FileAction.VideoPlayer.GoBack = function ( videoPlayer, controller )
	Engine.SetDvar( "lui_disable_blur", 0 )
	Engine.SetDvar( "ui_drawBuildNumber", 1 )
	if videoPlayer ~= nil then
		videoPlayer.webmVideo:setAlpha( 0 )
		if videoPlayer.webmImage ~= nil then
			videoPlayer.webmImage:setAlpha( 1 )
		end
	end
	if videoPlayer.m_closeTimer ~= nil then
		return 
	else
		videoPlayer.m_closeTimer = LUI.UITimer.new( 150, "video_play_end", true )
		videoPlayer:addElement( videoPlayer.m_closeTimer )
	end
end

CoD.FileAction.VideoPlayer.CloseAllPopups = function ( videoPlayer, event )
	Engine.SetDvar( "lui_disable_blur", 0 )
	Engine.SetDvar( "ui_drawBuildNumber", 1 )
	CoD.FileAction.VideoPlayer.GoBack( videoPlayer, event.controller )
end

CoD.FileAction.VideoPlayer.BackButtonFadeout = function ( videoPlayer, event )
	videoPlayer.leftButtonPromptBar:completeAnimation()
	videoPlayer.leftButtonPromptBar:beginAnimation( "disappear", 1000 )
	videoPlayer.leftButtonPromptBar:setAlpha( 0 )
end

CoD.FileAction.VideoPlayer.PlaybackEnded = function ( videoPlayer, event )
	Engine.SetDvar( "lui_disable_blur", 0 )
	Engine.SetDvar( "ui_drawBuildNumber", 1 )
	CoD.FileAction.VideoPlayer.GoBack( videoPlayer, videoPlayer.m_ownerController )
end

LUI.createMenu.Video_Player = function ( controller )
	local videoPlayer = CoD.Menu.New( "Video_Player" )
	videoPlayer:setOwner( controller )
	videoPlayer.info = CoD.perController[controller].url
	local fullScreenHeight = 720
	local fullScreenWidth = 1280
	local blackBg = LUI.UIImage.new()
	blackBg:setLeftRight( false, false, -fullScreenWidth / 2, fullScreenWidth / 2 )
	blackBg:setTopBottom( false, false, -fullScreenHeight / 2, fullScreenHeight / 2 )
	blackBg:setRGB( 0, 0, 0 )
	blackBg:setAlpha( 1 )
	blackBg:setPriority( -10 )
	videoPlayer:addElement( blackBg )
	if not Dvar.hiDef:get() then
		fullScreenWidth = 960
		fullScreenHeight = fullScreenWidth * 9 / 16
	end
	local webmImage = LUI.UIImage.new()
	webmImage:setLeftRight( false, false, -fullScreenWidth / 2, fullScreenWidth / 2 )
	webmImage:setTopBottom( false, false, -fullScreenHeight / 2, fullScreenHeight / 2 )
	webmImage:setRGB( 0, 0, 0 )
	webmImage:setAlpha( 1 )
	webmImage:setPriority( -4 )
	videoPlayer:addElement( webmImage )
	videoPlayer.webmImage = webmImage
	
	local videoImage = LUI.UIImage.new()
	videoImage:setLeftRight( false, false, -fullScreenWidth / 2, fullScreenWidth / 2 )
	videoImage:setTopBottom( false, false, -fullScreenHeight / 2, fullScreenHeight / 2 )
	videoImage:setAlpha( 0 )
	videoImage:setImage( RegisterMaterial( CoD.Codtv.WebMPlaybackMaterial ) )
	videoImage:setPriority( -5 )
	videoPlayer:addElement( videoImage )
	videoPlayer.webmVideo = videoImage
	
	videoPlayer.goBack = CoD.FileAction.VideoPlayer.GoBack
	Engine.PlayMenuMusic( "" )
	Engine.SetDvar( "lui_disable_blur", 1 )
	Engine.SetDvar( "ui_drawBuildNumber", 0 )
	videoPlayer.animateOutAndGoBack = function ( self, event )
		self:goBack( self:getOwner() )
	end
	
	videoPlayer.animateIn = CoD.NullFunction
	videoPlayer:addBackButton()
	videoPlayer.leftButtonPromptBar:setPriority( 100 )
	videoPlayer.detailsFadeOutTime = LUI.UITimer.new( 5000, {
		name = "back_button_fadeout",
		controller = controller
	}, false )
	videoPlayer:addElement( videoPlayer.detailsFadeOutTime )
	videoPlayer:registerEventHandler( "back_button_fadeout", CoD.FileAction.VideoPlayer.BackButtonFadeout )
	videoPlayer:registerEventHandler( "video_playback_ended", CoD.FileAction.VideoPlayer.PlaybackEnded )
	videoPlayer:registerEventHandler( "close_all_popups", CoD.FileAction.VideoPlayer.CloseAllPopups )
	videoPlayer:registerEventHandler( "video_play_end", CoD.FileAction.VideoPlayer.CloseTimerHandler )
	return videoPlayer
end

CoD.FileAction.CinematicPlayer = {}
CoD.FileAction.CinematicId = 0
CoD.FileAction.CinematicPlayer.GoBack = function ( self, controller )
	Engine.SetDvar( "ui_drawBuildNumber", 1 )
	if CoD.FileAction.CinematicId ~= 0 then
		if Engine.IsCinematicPreloading( CoD.FileAction.CinematicId ) == false then
			Engine.Stop3DCinematic( CoD.FileAction.CinematicId )
		end
		CoD.FileAction.CinematicId = 0
		Engine.PlayMenuMusic( "mus_mp_frontend" )
	end
	self:goBack( controller )
end

CoD.FileAction.CinematicPlayer.Cinematic_Update = function ( self, event )
	if CoD.FileAction.CinematicId == 0 then
		return 
	elseif Engine.IsCinematicPreloading( CoD.FileAction.CinematicId ) then
		return 
	elseif self.image.isShowing == false then
		self.image.isShowing = true
		self.image:setAlpha( 1 )
	end
	if Engine.GetCinematicTimeRemaining( CoD.FileAction.CinematicId ) > 0 then
		return 
	end
	CoD.FileAction.CinematicPlayer.GoBack( self, event )
end

LUI.createMenu.Cinematic_Player = function ( controller )
	local self = CoD.Menu.New( "Cinematic_Player" )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self.image = LUI.UIImage.new()
	self.image:setLeftRight( true, true, 0, 0 )
	if CoD.isPC then
		local height = 1280 / Engine.GetAspectRatio()
		local offset = (height - 720) / 2
		self.image:setTopBottom( true, true, offset, -offset )
	elseif Dvar.wideScreen:get() == true then
		self.image:setTopBottom( true, true, 0, 0 )
	else
		self.image:setTopBottom( true, true, 90, -90 )
	end
	self.image:setImage( RegisterMaterial( "webm_720p" ) )
	self.image:setShaderVector( 0, 0, 0, 0, 0 )
	self.image.isShowing = false
	self:addElement( self.image )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	self.safearea = LUI.UIElement.new()
	self.safearea:setLeftRight( false, false, -safeAreaWidth / 2, safeAreaWidth / 2 )
	self.safearea:setTopBottom( false, false, -safeAreaHeight / 2, safeAreaHeight / 2 )
	self:addElement( self.safearea )
	local subtitles = LUI.UIElement.new()
	subtitles:setLeftRight( true, true, 0, 0 )
	subtitles:setTopBottom( true, true, 0, 0 )
	subtitles:setupCinematicSubtitles()
	self.safearea:addElement( subtitles )
	Engine.PlayMenuMusic( "" )
	Engine.SetDvar( "ui_drawBuildNumber", 0 )
	self:registerEventHandler( "cinematic_update", CoD.FileAction.CinematicPlayer.Cinematic_Update )
	self:addElement( LUI.UITimer.new( 16, "cinematic_update", false, self ) )
	return self
end

