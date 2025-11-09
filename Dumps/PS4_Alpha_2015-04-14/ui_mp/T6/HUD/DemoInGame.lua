require( "ui_mp.T6.Menus.FileshareSave" )

CoD.DemoInGame = {}
CoD.DemoInGame.Open = function ( self, event )
	self:openPopup( "Demo_InGame", event.controller )
	if Engine.IsDemoShoutcaster() == true and self.SpectateHUD ~= nil then
		self.SpectateHUD:processEvent( {
			name = "spectate_ingame_menu_opened",
			controller = event.controller
		} )
	end
end

CoD.DemoInGame.Back = function ( self, event )
	self:clearSavedState()
	self:goBack( event.controller )
	if Engine.IsDemoShoutcaster() == true and self.occludedMenu.SpectateHUD ~= nil then
		self.occludedMenu.SpectateHUD:processEvent( {
			name = "spectate_ingame_menu_closed",
			controller = event.controller
		} )
	end
end

local DemoInGame_OpenManageSegments = function ( self, event )
	self:saveState()
	self:openMenu( "Demo_Manage_Segments", event.controller )
	self:close()
end

local DemoInGame_UploadClip = function ( self, event )
	local downloadProgress = Engine.GetDemoStreamedDownloadProgress()
	if downloadProgress < 100 then
		local titleText = Engine.Localize( "MENU_NOTICE" )
		local messageText = Engine.Localize( "MPUI_DEMO_DOWNLOAD_IN_PROGRESS", math.floor( downloadProgress ) )
		CoD.Menu.OpenDemoErrorPopup( self, {
			controller = event.controller,
			titleText = titleText,
			messageText = messageText
		} )
		return 
	else
		CoD.DemoPopup.isClipSaveScreen = true
		self:saveState()
		CoD.perController[event.controller].fileshareSaveCategory = "clip"
		CoD.perController[event.controller].fileshareSaveIsCopy = false
		CoD.perController[event.controller].fileshareSaveIsPooled = false
		self:openMenu( "FileshareSave", event.controller )
		self:close()
	end
end

local DemoInGame_OpenCustomizeHighlightReel = function ( self, event )
	local popup = self:openPopup( "CustomizeHighlightReel", event.controller )
end

local DemoInGame_JumpToStart = function ( self, event )
	CoD.DemoInGame.Back( self, event )
	Engine.Exec( event.controller, "demo_jumptostart" )
end

local DemoInGame_OpenOptions = function ( self, event )
	self:saveState()
	self:openMenu( "OptionsMenu", event.controller )
	self:close()
end

local DemoInGame_End = function ( self, event )
	self:openPopup( "DemoInGameEnd", event.controller )
end

local DemoInGame_OpenControls = function ( self, event )
	local menu = self:openMenu( "WiiUControllerSettings", event.controller, true )
	menu:setPreviousMenu( "Demo_InGame" )
	self:close()
end

local DemoInGame_AddButtons = function ( self )
	local isClipPlaying = Engine.IsDemoClipPlaying()
	local isClipRecording = Engine.IsDemoClipRecording()
	local segmentCount = Engine.GetDemoSegmentCount()
	local isRepositioningCameraMarker = Engine.IsRepositioningCameraMarker()
	local isHighlightReelMode = Engine.IsDemoHighlightReelMode()
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isInLobby = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	self:registerEventHandler( "manage_segments", DemoInGame_OpenManageSegments )
	self:registerEventHandler( "upload_clip", DemoInGame_UploadClip )
	self:registerEventHandler( "customize_highlight_reel", DemoInGame_OpenCustomizeHighlightReel )
	self:registerEventHandler( "demo_jump_to_start", DemoInGame_JumpToStart )
	self:registerEventHandler( "open_options", DemoInGame_OpenOptions )
	self:registerEventHandler( "demo_end", DemoInGame_End )
	if CoD.isWIIU then
		self:registerEventHandler( "open_controls", DemoInGame_OpenControls )
	end
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, false, 0, CoD.ButtonList.DefaultWidth )
	buttonList:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	buttonList.uploadClip = buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_UPLOAD_CLIP", segmentCount ) ) )
	buttonList.uploadClip:setActionEventName( "upload_clip" )
	if isClipPlaying or isClipRecording or segmentCount <= 0 or isRepositioningCameraMarker then
		buttonList.uploadClip:disable()
	end
	buttonList.manageSegments = buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_DEMO_MANAGE_SEGMENTS" ) ) )
	buttonList.manageSegments:setActionEventName( "manage_segments" )
	if isClipPlaying or isClipRecording or segmentCount <= 0 or isRepositioningCameraMarker then
		buttonList.manageSegments:disable()
	end
	if isHighlightReelMode then
		buttonList.customizeHighlightReel = buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) ) )
		if isClipRecording or isRepositioningCameraMarker or not isGameHost or not isInLobby then
			buttonList.customizeHighlightReel:disable()
		end
		buttonList.customizeHighlightReel:setActionEventName( "customize_highlight_reel" )
	end
	buttonList.options = buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_OPTIONS" ) ) )
	buttonList.options:setActionEventName( "open_options" )
	if CoD.isWIIU then
		buttonList.controls = buttonList:addButton( Engine.Localize( "MENU_CONTROLLER_SETTINGS_CAPS" ) )
		buttonList.controls:setActionEventName( "open_controls" )
	end
	buttonList.jumpToStart = buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_JUMP_TO_START" ) ) )
	buttonList.jumpToStart:setActionEventName( "demo_jump_to_start" )
	if isClipRecording or isRepositioningCameraMarker or not isGameHost or not isInLobby then
		buttonList.jumpToStart:disable()
	end
	local endDemoButtonText = nil
	if isClipPlaying then
		endDemoButtonText = Engine.ToUpper( Engine.Localize( "MENU_END_CLIP" ) )
	else
		endDemoButtonText = Engine.ToUpper( Engine.Localize( "MENU_END_FILM" ) )
	end
	buttonList.endDemo = buttonList:addButton( endDemoButtonText )
	buttonList.endDemo:setActionEventName( "demo_end" )
	self.buttonList = buttonList
	self:addElement( buttonList )
	if not self:restoreState() then
		self.buttonList.uploadClip:processEvent( {
			name = "gain_focus"
		} )
	end
end

LUI.createMenu.Demo_InGame = function ( controller )
	local isClipPlaying = Engine.IsDemoClipPlaying()
	local titleText = Engine.Localize( "MENU_THEATER_CAPS" )
	local menu = CoD.InGameMenu.New( "Demo_InGame", controller, titleText )
	menu:setOwner( controller )
	CoD.InGameMenu.addButtonPrompts( menu )
	menu:registerEventHandler( "button_prompt_back", CoD.DemoInGame.Back )
	menu:registerEventHandler( "button_prompt_start", CoD.DemoInGame.Back )
	DemoInGame_AddButtons( menu )
	return menu
end

local DemoInGame_End_LeaveDemo = function ( self, event )
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	self:goBack( event.controller )
	if not isGameHost then
		Engine.GameModeResetModes()
		Engine.SessionModeResetModes()
		Engine.Exec( event.controller, "disconnect" )
	else
		Engine.Exec( event.controller, "xpartystopdemo" )
	end
end

local DemoInGame_End_SaveClip = function ( self, event )
	self.occludedMenu:processEvent( event )
	self:goBack( event.controller )
end

LUI.createMenu.DemoInGameEnd = function ( controller )
	local isClipModified = Engine.IsClipModified()
	local isClipPlaying = Engine.IsDemoClipPlaying()
	local isGameHost = Engine.GameHost()
	local menu = CoD.Menu.NewSmallPopup( "DemoInGameEnd" )
	menu:setOwner( controller )
	menu:addSelectButton()
	menu:addBackButton()
	menu:registerEventHandler( "leave_demo", DemoInGame_End_LeaveDemo )
	menu:registerEventHandler( "upload_clip", DemoInGame_End_SaveClip )
	local sliderSpacing = 120
	local top = 5
	local messageText = LUI.UIText.new()
	messageText:setLeftRight( true, true, 0, 0 )
	messageText:setTopBottom( true, false, top, top + CoD.textSize.Big )
	messageText:setFont( CoD.fonts.Big )
	messageText:setAlignment( LUI.Alignment.Left )
	if not isClipPlaying then
		if isGameHost then
			messageText:setText( Engine.Localize( "MPUI_LEAVE_FILM" ) )
		else
			messageText:setText( Engine.Localize( "MPUI_END_FILM" ) )
		end
	elseif isGameHost then
		messageText:setText( Engine.Localize( "MPUI_LEAVE_CLIP" ) )
	else
		messageText:setText( Engine.Localize( "MPUI_END_CLIP" ) )
	end
	menu:addElement( messageText )
	top = top + CoD.textSize.Big + 10
	if isClipModified then
		local subtitleText = LUI.UIText.new()
		subtitleText:setLeftRight( true, true, 0, 0 )
		subtitleText:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
		subtitleText:setFont( CoD.fonts.Condensed )
		subtitleText:setAlignment( LUI.Alignment.Left )
		subtitleText:setText( Engine.Localize( "MENU_DEMO_UNUPLOADED_CLIP" ) )
		menu:addElement( subtitleText )
	end
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 4 + 10, 0 )
	menu:addElement( buttonList )
	if not isClipModified then
		buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
		local leave = buttonList:addButton( Engine.Localize( "MENU_YES" ) )
		leave:setActionEventName( "leave_demo" )
		local cancel = buttonList:addButton( Engine.Localize( "MENU_NO" ) )
		cancel:setActionEventName( "button_prompt_back" )
		cancel:processEvent( {
			name = "gain_focus"
		} )
	else
		local saveClip = buttonList:addButton( Engine.Localize( "MENU_SAVE_CLIP" ) )
		saveClip:processEvent( {
			name = "gain_focus"
		} )
		saveClip:setActionEventName( "upload_clip" )
		local leave = buttonList:addButton( Engine.Localize( "MENU_END_FILM_WITHOUT_SAVING" ) )
		leave:setActionEventName( "leave_demo" )
		local cancel = buttonList:addButton( Engine.Localize( "MENU_CANCEL" ) )
		cancel:setActionEventName( "button_prompt_back" )
	end
	return menu
end

