require( "ui.LUI.LUIVerticalList" )
require( "ui_mp.T6.Menus.FileshareManager" )
require( "ui_mp.T6.Menus.FileshareSummary" )
require( "ui_mp.T6.Menus.FilesharePopup" )

CoD.FileshareSave = {}
CoD.FileshareSave.Buttons = {}
CoD.FileshareSave.Upload = {}
CoD.FileshareSave.BtnGainFocus = function ( btn, event )
	local retVal = LUI.UIElement.gainFocus( btn, event )
	btn.border:setAlpha( 1 )
	btn.text:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	return retVal
end

CoD.FileshareSave.BtnLoseFocus = function ( btn, event )
	LUI.UIElement.loseFocus( btn, event )
	btn.border:setAlpha( 0 )
	btn.text:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
end

CoD.FileshareSave.MoveUp = function ( fileshareSave, event )
	local focussedIndex = 0
	for i = 1, #CoD.FileshareSave.Buttons, 1 do
		if CoD.FileshareSave.Buttons[i]:isInFocus() then
			focussedIndex = i
		end
	end
	local newFocussedIndex = focussedIndex - 1
	if newFocussedIndex < 1 then
		newFocussedIndex = #CoD.FileshareSave.Buttons
	end
	CoD.FileshareSave.Buttons[focussedIndex]:processEvent( {
		name = "lose_focus"
	} )
	CoD.FileshareSave.Buttons[newFocussedIndex]:processEvent( {
		name = "gain_focus"
	} )
end

CoD.FileshareSave.MoveDown = function ( fileshareSave, event )
	local focussedIndex = 0
	for i = 1, #CoD.FileshareSave.Buttons, 1 do
		if CoD.FileshareSave.Buttons[i]:isInFocus() then
			focussedIndex = i
		end
	end
	local newFocussedIndex = focussedIndex + 1
	if newFocussedIndex > #CoD.FileshareSave.Buttons then
		newFocussedIndex = 1
	end
	CoD.FileshareSave.Buttons[focussedIndex]:processEvent( {
		name = "lose_focus"
	} )
	CoD.FileshareSave.Buttons[newFocussedIndex]:processEvent( {
		name = "gain_focus"
	} )
end

CoD.FileshareSave.Click = function ( fileshareSave, event )
	for i = 1, #CoD.FileshareSave.Buttons, 1 do
		local btn = CoD.FileshareSave.Buttons[i]
		if btn:isInFocus() and btn.m_callback ~= nil and not btn.m_disabled then
			btn:m_callback( fileshareSave, event )
		end
	end
end

CoD.FileshareSave.ButtonPress = function ( fileshareSave, event )
	if fileshareSave.m_inputDisabled then
		return nil
	elseif CoD.FileshareSave.Buttons and #CoD.FileshareSave.Buttons == 0 then
		return nil
	elseif event.down == true then
		if event.button == "up" then
			CoD.FileshareSave.MoveUp( fileshareSave, event )
			return true
		elseif event.button == "down" then
			CoD.FileshareSave.MoveDown( fileshareSave, event )
			return true
		elseif event.button == "primary" then
			CoD.FileshareSave.Click( fileshareSave, event )
			return true
		end
	end
	fileshareSave:dispatchEventToChildren( event )
	return nil
end

CoD.FileshareSave.UpdateButtonText = function ( btn, event )
	if btn:isInFocus() then
		btn:setText( event.text )
	end
end

CoD.FileshareSave.BtnTitleClick = function ( btn, fileshareSave )
	Engine.ExecNow( fileshareSave.m_controller, "demo_keyboard " .. fileshareSave.m_category .. "Name" )
end

CoD.FileshareSave.BtnDescriptionClick = function ( btn, fileshareSave, event )
	Engine.ExecNow( fileshareSave.m_controller, "demo_keyboard " .. fileshareSave.m_category .. "Desc" )
end

CoD.FileshareSave.SaveAndUploadClip = function ( userData )
	Engine.SaveAndUploadClip( userData.m_controller, userData.m_slot )
end

CoD.FileshareSave.SaveScreenshot = function ( userData )
	Engine.SaveScreenshot( userData.m_controller, false, userData.m_slot )
end

CoD.FileshareSave.UploadGameSettings = function ( userData )
	Engine.UploadGameSettings( userData.m_controller, userData.m_slot )
end

CoD.FileshareSave.FileShareCopy = function ( userData )
	Engine.FileShareCopy( userData.m_controller, userData.m_fileID, userData.m_isPooled, userData.m_slot )
end

CoD.FileshareSave.BtnSaveClick = function ( btn, fileshareSave, event )
	local uploadFunc = nil
	if fileshareSave.m_saveSlot ~= nil then
		if fileshareSave.m_isCopy == false then
			if Engine.IsDemoPlaying() then
				local downloadProgress = Engine.GetDemoStreamedDownloadProgress()
				if downloadProgress < 100 then
					local titleText = Engine.Localize( "MENU_NOTICE" )
					local messageText = Engine.Localize( "MPUI_DEMO_DOWNLOAD_IN_PROGRESS", math.floor( downloadProgress ) )
					CoD.Menu.OpenDemoErrorPopup( fileshareSave, {
						controller = event.controller,
						titleText = titleText,
						messageText = messageText
					} )
					return 
				end
			end
			if fileshareSave.m_category == "clip" then
				uploadFunc = CoD.FileshareSave.SaveAndUploadClip
			elseif fileshareSave.m_category == "screenshot" then
				uploadFunc = CoD.FileshareSave.SaveScreenshot
			elseif fileshareSave.m_category == "customgame" then
				uploadFunc = CoD.FileshareSave.UploadGameSettings
			elseif fileshareSave.m_category == "render" then
				Engine.Exec( event.controller, "demo_play film.demo RenderMovie " .. fileshareSave.m_matchID .. " " .. fileshareSave.m_saveSlot )
				return 
			end
		else
			uploadFunc = CoD.FileshareSave.FileShareCopy
		end
	end
	if uploadFunc ~= nil then
		local name = Engine.Localize( Engine.TableLookup( nil, CoD.fileShareCategoriesTable, 0, fileshareSave.m_category, 3 ) .. "_SMALL" )
		local userData = {
			title = Engine.ToUpper( Engine.Localize( "MENU_FILESHARE_SAVE" ) ),
			message = Engine.Localize( "MENU_FILESHARE_SAVE_WAIT", name ),
			successNotice = Engine.Localize( "MENU_FILESHARE_SAVE_SUCCESS", name ),
			failureNotice = Engine.Localize( "MENU_FILESHARE_SAVE_ERROR", name ),
			completionEvent = "fileshare_upload_complete",
			completionNotification = "fileshare_operation_complete",
			actionFunc = uploadFunc,
			m_controller = fileshareSave.m_ownerController,
			m_fileID = fileshareSave.m_fileID,
			m_isPooled = fileshareSave.m_isPooled,
			m_slot = fileshareSave.m_saveSlot,
			inPlace = true
		}
		fileshareSave:openPopup( "Fileshare_BusyPopup", fileshareSave.m_ownerController, userData )
	end
end

CoD.FileshareSave.BtnFileshareManagerClick = function ( btn, fileshareSave, event )
	CoD.FileshareSave.OpenFileManager( fileshareSave, event )
end

CoD.FileshareSave.BtnLeftMouseUp = function ( btn, event )
	btn:dispatchEventToParent( {
		name = "fileshare_mouse_click",
		controller = event.controller
	} )
end

CoD.FileshareSave.MouseClick = function ( fileshareSave, event )
	if not fileshareSave.m_inputDisabled then
		CoD.FileshareSave.Click( fileshareSave, event )
	end
end

CoD.FileshareSave.ButtonSetText = function ( btn, text )
	btn.text:setText( text )
end

CoD.FileshareSave.ButtonDisable = function ( btn, text )
	btn.text:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	btn.m_disabled = true
end

CoD.FileshareSave.ButtonEnable = function ( btn, text )
	btn.text:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	btn.m_disabled = false
end

CoD.FileshareSave.NewButton = function ( x, y, width, height, callback, initialText, isTextField, canModify )
	local btn = LUI.UIElement.new()
	if canModify == nil then
		canModify = false
	end
	btn.id = "FileshareSaveButton"
	btn.m_callback = callback
	btn.m_isTextField = isTextField
	btn.m_disabled = false
	btn:setLeftRight( true, false, x, x + width )
	btn:setTopBottom( true, false, y, y + height )
	btn:makeFocusable()
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0.2, 0.2, 0.2 )
	bg:setAlpha( 0.6 )
	btn:addElement( bg )
	if initialText == nil then
		initialText = ""
	end
	local textEl = LUI.UIElement.new()
	textEl:setLeftRight( true, true, 5, -5 )
	textEl:setTopBottom( true, false, 0, CoD.textSize.Default * 2 )
	textEl:setUseStencil( true )
	btn:addElement( textEl )
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 0, 0 )
	text:setTopBottom( true, false, 0, CoD.textSize.Default )
	text:setText( initialText )
	if canModify == false then
		text:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	else
		text:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	end
	if isTextField == true then
		text:setAlignment( LUI.Alignment.Left )
	else
		text:setAlignment( LUI.Alignment.Center )
	end
	textEl:addElement( text )
	btn.text = text
	
	local border = CoD.BorderT6.new( 1, CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b, 0, -5 )
	btn.border = border
	btn.border:setAlpha( 0 )
	btn:addElement( border )
	if isTextField == true then
		local lineUpper = LUI.UIImage.new()
		lineUpper:setLeftRight( true, true, 0, 0 )
		lineUpper:setTopBottom( false, true, -1, 0 )
		lineUpper:setRGB( 0, 0, 0 )
		btn:addElement( lineUpper )
		local lineLeft = LUI.UIImage.new()
		lineLeft:setLeftRight( true, true, 0, 0 )
		lineLeft:setTopBottom( false, true, -1, 0 )
		lineLeft:setRGB( 0, 0, 0 )
		btn:addElement( lineLeft )
		local lineLower = LUI.UIImage.new()
		lineLower:setLeftRight( true, true, 0, 0 )
		lineLower:setTopBottom( false, true, -1, 0 )
		lineLower:setRGB( 0.3, 0.3, 0.3 )
		btn:addElement( lineLower )
		local lineRight = LUI.UIImage.new()
		lineRight:setLeftRight( false, true, -1, 0 )
		lineRight:setTopBottom( true, true, 0, 0 )
		lineRight:setRGB( 0.3, 0.3, 0.3 )
		btn:addElement( lineRight )
	end
	btn.setText = CoD.FileshareSave.ButtonSetText
	btn.disable = CoD.FileshareSave.ButtonDisable
	btn.enable = CoD.FileshareSave.ButtonEnable
	btn:registerEventHandler( "gain_focus", CoD.FileshareSave.BtnGainFocus )
	btn:registerEventHandler( "lose_focus", CoD.FileshareSave.BtnLoseFocus )
	btn:registerEventHandler( "demo_keyboard_complete", CoD.FileshareSave.UpdateButtonText )
	if CoD.useMouse then
		btn:setHandleMouse( true )
		btn:registerEventHandler( "leftmouseup", CoD.FileshareSave.BtnLeftMouseUp )
		btn:registerEventHandler( "leftmousedown", CoD.NullFunction )
	end
	return btn
end

CoD.FileshareSave.PopulateDetails = function ( fileshareSave, slotsRemaining )
	local details = LUI.UIElement.new()
	details:setLeftRight( true, false, 0, 400 )
	details:setTopBottom( true, false, 80, 600 )
	local mapWidth = 350
	local mapHeight = 200
	local y = 0
	local mapImageElement = LUI.UIElement.new()
	mapImageElement:setLeftRight( true, false, 0, mapWidth )
	mapImageElement:setTopBottom( true, false, 0, mapHeight )
	details:addElement( mapImageElement )
	local mapImage = LUI.UIImage.new()
	mapImage:setLeftRight( false, false, -mapWidth / 2, mapWidth / 2 )
	mapImage:setTopBottom( false, false, -mapHeight / 2, mapHeight / 2 )
	mapImageElement:addElement( mapImage )
	y = y + mapHeight + 10
	if not Engine.IsInGame() then
		if fileshareSave.m_skipThumbnail == false and (fileshareSave.m_category == "clip" or fileshareSave.m_category == "screenshot") then
			mapImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, tostring( fileshareSave.m_fileID ) )
		elseif fileshareSave.m_category == "customgame" then
			mapImage:setLeftRight( false, false, -100, 100 )
			mapImage:setImage( RegisterMaterial( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Dvar.ui_gameType:get(), "image" ) ) )
		elseif fileshareSave.m_map ~= nil then
			if CoD.isZombie then
				if fileshareSave.m_gameType == nil then
					fileshareSave.m_gameType = Dvar.ui_gameType:get()
				end
				if fileshareSave.m_startLocation == nil then
					fileshareSave.m_startLocation = Dvar.ui_zm_mapstartlocation:get()
				end
				local gameTypeGroup = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", fileshareSave.m_gameType, "groupname" )
				if fileshareSave.m_map ~= nil and gameTypeGroup ~= nil and fileshareSave.m_startLocation ~= nil then
					mapImage:setImage( RegisterMaterial( "menu_" .. CoD.Zombie.GetMapName( fileshareSave.m_map ) .. "_" .. gameTypeGroup .. "_" .. fileshareSave.m_startLocation ) )
				end
			elseif fileshareSave.m_map ~= nil then
				mapImage:setImage( RegisterMaterial( "menu_" .. fileshareSave.m_map .. "_map_select_final" ) )
			end
		else
			mapImage:setAlpha( 0 )
		end
	elseif Engine.IsDemoPlaying() and fileshareSave.m_category ~= nil then
		Engine.ExecNow( fileshareSave.m_ownerController, "setupThumbnailForFileshareSave " .. fileshareSave.m_category )
		mapImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, 1 )
	else
		mapImage:setAlpha( 0 )
	end
	local txtTitleHeader = LUI.UIText.new()
	txtTitleHeader:setLeftRight( true, true, 0, 0 )
	txtTitleHeader:setTopBottom( true, false, y, y + CoD.textSize.Default )
	txtTitleHeader:setText( Engine.Localize( "MPUI_TITLE" ) )
	txtTitleHeader:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	txtTitleHeader:setAlignment( LUI.Alignment.Left )
	txtTitleHeader:setFont( CoD.fonts.Default )
	details:addElement( txtTitleHeader )
	y = y + CoD.textSize.Default + 8
	fileshareSave.btnTitle = CoD.FileshareSave.NewButton( 0, y, mapWidth, CoD.textSize.Default + 5, CoD.FileshareSave.BtnTitleClick, fileshareSave.m_defaultName, true, fileshareSave.m_canEdit )
	details:addElement( fileshareSave.btnTitle )
	y = y + CoD.textSize.Default + 12
	local txtDescHeader = LUI.UIText.new()
	txtDescHeader:setLeftRight( true, true, 0, 0 )
	txtDescHeader:setTopBottom( true, false, y, y + CoD.textSize.Default )
	txtDescHeader:setText( Engine.Localize( "MENU_FILESHARE_DESCRIPTION" ) )
	txtDescHeader:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	txtDescHeader:setAlignment( LUI.Alignment.Left )
	txtDescHeader:setFont( CoD.fonts.Default )
	details:addElement( txtDescHeader )
	y = y + CoD.textSize.Default + 8
	fileshareSave.btnDescription = CoD.FileshareSave.NewButton( 0, y, mapWidth, (CoD.textSize.Default + 5) * 2, CoD.FileshareSave.BtnDescriptionClick, fileshareSave.m_defaultDescription, true, fileshareSave.m_canEdit )
	details:addElement( fileshareSave.btnDescription )
	y = y + CoD.textSize.Default * 2 + 25
	if slotsRemaining <= 0 then
		fileshareSave.saveButton = CoD.FileshareSave.NewButton( 0, y, mapWidth, CoD.textSize.Default + 5, CoD.FileshareSave.BtnFileshareManagerClick, Engine.Localize( "MENU_FILEMANAGER" ), false, false )
	else
		fileshareSave.saveButton = CoD.FileshareSave.NewButton( 0, y, mapWidth, CoD.textSize.Default + 5, CoD.FileshareSave.BtnSaveClick, Engine.ToUpper( Engine.Localize( "MENU_FILESHARE_SAVE" ) ), false, false )
	end
	details:addElement( fileshareSave.saveButton )
	y = y + CoD.textSize.Default + 25
	local restrictedIcon = LUI.UIImage.new()
	restrictedIcon:setLeftRight( true, false, 0, 32 )
	restrictedIcon:setTopBottom( true, false, y, y + 32 )
	restrictedIcon:setImage( RegisterMaterial( "cac_restricted" ) )
	fileshareSave.restrictedIcon = restrictedIcon
	details:addElement( restrictedIcon )
	local txtFullWarning = LUI.UIText.new()
	txtFullWarning:setLeftRight( true, true, 40, 400 )
	txtFullWarning:setTopBottom( true, false, y, y + CoD.textSize.Default )
	if CoD.FileshareManager.ShouldShowMtx( fileshareSave.m_ownerController ) then
		txtFullWarning:setText( Engine.Localize( "MENU_FILESHARE_SLOTSFULL_MTX" ) )
	else
		txtFullWarning:setText( Engine.Localize( "MENU_FILESHARE_SLOTSFULL" ) )
	end
	txtFullWarning:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
	txtFullWarning:setAlignment( LUI.Alignment.Left )
	txtFullWarning:setFont( CoD.fonts.Default )
	fileshareSave.txtFullWarning = txtFullWarning
	details:addElement( txtFullWarning )
	if slotsRemaining <= 0 then
		fileshareSave.restrictedIcon:setAlpha( 1 )
		fileshareSave.txtFullWarning:setAlpha( 1 )
	else
		fileshareSave.restrictedIcon:setAlpha( 0 )
		fileshareSave.txtFullWarning:setAlpha( 0 )
	end
	for i = 1, #CoD.FileshareSave.Buttons, 1 do
		local f22_local2 = i
		table.remove( CoD.FileshareSave.Buttons )
	end
	if fileshareSave.m_canEdit == true then
		table.insert( CoD.FileshareSave.Buttons, fileshareSave.btnTitle )
		table.insert( CoD.FileshareSave.Buttons, fileshareSave.btnDescription )
	end
	table.insert( CoD.FileshareSave.Buttons, fileshareSave.saveButton )
	fileshareSave.saveButton:processEvent( {
		name = "gain_focus"
	} )
	return details
end

CoD.FileshareSave.SlotsAvailable = function ( fileshareSave, event )
	fileshareSave.spinner:setAlpha( 0 )
	if event.valid == false then
		fileshareSave.occludedMenu:openPopup( "FileshareManager_Error", event.controller )
		fileshareSave:close()
		return 
	end
	local groups = Engine.GetFileshareCategories( event.controller )
	if fileshareSave.groupSummary == nil then
		fileshareSave.groupSummary = CoD.FileshareSummary.new( 80, 400, 341, groups, fileshareSave.m_groupName, true )
		fileshareSave:addElement( fileshareSave.groupSummary )
	end
	fileshareSave.m_slotsRemaining = 0
	for i = 1, #groups, 1 do
		if fileshareSave.m_groupName == groups[i].name then
			fileshareSave.m_slotsRemaining = groups[i].remaining
			break
		end
	end
	if fileshareSave.details == nil then
		fileshareSave.details = CoD.FileshareSave.PopulateDetails( fileshareSave, fileshareSave.m_slotsRemaining )
		fileshareSave:addElement( fileshareSave.details )
	end
	fileshareSave.m_saveSlot = Engine.GetFileshareNextSlot( fileshareSave.m_ownerController, fileshareSave.m_categoryID )
end

CoD.FileshareSave.UpdateSaveButtonState = function ( fileshareSave, event )
	if fileshareSave.m_slotsRemaining == nil or fileshareSave.m_slotsRemaining <= 0 then
		return 
	elseif fileshareSave.saveButton == nil then
		return 
	end
	local numPlayers = Engine.PartyGetPlayerCount()
	if numPlayers <= 1 then
		if fileshareSave.saveButton.m_disabled then
			fileshareSave.saveButton:enable()
			fileshareSave.restrictedIcon:setAlpha( 0 )
			fileshareSave.txtFullWarning:setAlpha( 0 )
		end
	elseif not fileshareSave.saveButton.m_disabled then
		fileshareSave.saveButton:disable()
		fileshareSave.restrictedIcon:setAlpha( 1 )
		fileshareSave.txtFullWarning:setText( Engine.Localize( "MENU_RENDER_TOO_MANY_PLAYERS" ) )
		fileshareSave.txtFullWarning:setAlpha( 1 )
	end
end

CoD.FileshareSave.OpenFileManager = function ( fileshareSave, event )
	local data = {
		category = fileshareSave.m_category,
		groupName = fileshareSave.m_groupName
	}
	local fileManager = fileshareSave:openMenu( "FileshareManager", event.controller, data )
	fileManager:setPreviousMenu( "FileshareSave" )
	fileshareSave:close()
end

CoD.FileshareSave.Back = function ( fileshareSave, event )
	fileshareSave:goBack( event.controller )
	if Engine.IsInGame() then
		Engine.Exec( event.controller, "resetThumbnailViewer" )
	end
end

LUI.createMenu.FileshareSave = function ( controller )
	local fileshareSave = CoD.Menu.New( "FileshareSave" )
	fileshareSave.m_category = CoD.perController[controller].fileshareSaveCategory
	fileshareSave.m_isCopy = CoD.perController[controller].fileshareSaveIsCopy
	fileshareSave.m_fileID = CoD.perController[controller].fileshareSaveFileID
	fileshareSave.m_isPooled = CoD.perController[controller].fileshareSaveIsPooled
	fileshareSave.m_map = CoD.perController[controller].fileshareSaveMap
	fileshareSave.m_startLocation = CoD.perController[controller].fileshareZmMapStartLocation
	fileshareSave.m_startLocationName = CoD.perController[controller].fileshareZmMapStartLocationName
	fileshareSave.m_gameType = CoD.perController[controller].fileshareGameType
	fileshareSave.m_matchID = CoD.perController[controller].fileshareSaveMatchID
	fileshareSave.m_skipThumbnail = CoD.perController[controller].fileshareSaveSkipThumbnail
	if fileshareSave.m_skipThumbnail == nil then
		fileshareSave.m_skipThumbnail = false
	end
	if fileshareSave.m_category ~= "render" and (fileshareSave.m_isPooled == true or fileshareSave.m_isCopy == false) then
		fileshareSave.m_canEdit = true
	else
		fileshareSave.m_canEdit = false
	end
	if fileshareSave.m_isCopy == true or fileshareSave.m_category == "customgame" then
		fileshareSave.m_defaultName = CoD.perController[controller].fileshareSaveName
		fileshareSave.m_defaultDescription = CoD.perController[controller].fileshareSaveDescription
		Engine.ExecNow( controller, "fileshareClearCopyParams" )
	elseif fileshareSave.m_category == "render" then
		fileshareSave.m_defaultName = CoD.perController[controller].fileshareSaveName
		fileshareSave.m_defaultDescription = CoD.perController[controller].fileshareSaveDescription
	else
		fileshareSave.m_defaultName = Engine.GetDemoSaveScreenName( fileshareSave.m_category )
		fileshareSave.m_defaultDescription = Engine.GetDemoSaveScreenDescription( fileshareSave.m_category )
	end
	fileshareSave.m_categoryID = Engine.TableLookup( nil, CoD.fileShareCategoriesTable, 0, fileshareSave.m_category, 2 )
	fileshareSave.m_groupName = Engine.TableLookup( nil, CoD.fileShareCategoriesTable, 0, fileshareSave.m_category, 1 )
	local name = Engine.TableLookup( nil, CoD.fileShareCategoriesTable, 0, fileshareSave.m_category, 3 )
	if not Engine.IsInGame() then
		fileshareSave:addLargePopupBackground()
	end
	fileshareSave:setOwner( controller )
	fileshareSave:addTitle( Engine.ToUpper( Engine.Localize( "MENU_FILESHARE_SAVE" ) ) .. " " .. Engine.ToUpper( Engine.Localize( name ) ), LUI.Alignment.Left )
	local spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	spinner:setImage( RegisterMaterial( "lui_loader" ) )
	spinner:setTopBottom( false, false, -32, 32 )
	spinner:setLeftRight( false, false, -32, 32 )
	fileshareSave.spinner = spinner
	fileshareSave:addElement( spinner )
	local filemanagerButton = CoD.ButtonPrompt.new( "select", Engine.Localize( "MENU_FILEMANAGER" ), fileshareSave, "fileshare_open_manager", false, nil, false, nil, "TAB" )
	fileshareSave:addSelectButton()
	fileshareSave:addBackButton()
	fileshareSave:addLeftButtonPrompt( filemanagerButton )
	fileshareSave:registerEventHandler( "fileshare_open_manager", CoD.FileshareSave.OpenFileManager )
	fileshareSave:registerEventHandler( "fileshare_slots_available", CoD.FileshareSave.SlotsAvailable )
	fileshareSave:registerEventHandler( "gamepad_button", CoD.FileshareSave.ButtonPress )
	fileshareSave:registerEventHandler( "button_prompt_back", CoD.FileshareSave.Back )
	fileshareSave:registerEventHandler( "fileshare_operation_complete", CoD.FileshareSave.Back )
	if CoD.useMouse then
		fileshareSave:registerEventHandler( "fileshare_mouse_click", CoD.FileshareSave.MouseClick )
	end
	if fileshareSave.m_category == "render" then
		fileshareSave:registerEventHandler( "theaterlobby_update", CoD.FileshareSave.UpdateSaveButtonState )
		fileshareSave:registerEventHandler( "gamelobby_update", CoD.FileshareSave.UpdateSaveButtonState )
	end
	Engine.Exec( controller, "fileshareGetSlots" )
	return fileshareSave
end

