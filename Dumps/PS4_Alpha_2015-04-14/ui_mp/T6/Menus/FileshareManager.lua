require( "ui.LUI.LUIVerticalList" )
require( "ui.T6.ListBox" )
require( "ui_mp.T6.Menus.FileshareSummary" )
require( "ui_mp.T6.HUD.DemoPopup" )

CoD.FileshareManager = {}
CoD.FileshareManager.Row = {}
CoD.FileshareManager.List = {}
CoD.FileshareManager.FileDetails = {}
CoD.FileshareManager.Delete = {}
CoD.FileshareManager.SkipMtx = false
LUI.createMenu.FileshareManager_Error = function ( controller )
	local popup = CoD.Popup.SetupPopup( "FileshareManager_Error", controller )
	popup.title:setText( Engine.Localize( "MENU_ERROR" ) )
	popup.msg:setText( Engine.Localize( "MENU_FILESHARE_ERROR" ) )
	popup:addBackButton()
	return popup
end

CoD.FileshareManager.Delete.Action = function ( popup, event )
	local userData = {
		title = Engine.ToUpper( Engine.Localize( "MENU_DELETE" ) ),
		message = Engine.Localize( "MENU_FILESHARE_DELETE_WAIT", popup.m_categoryName ),
		successNotice = Engine.Localize( "MENU_FILESHARE_DELETE_SUCCESS", popup.m_categoryName ),
		failureNotice = Engine.Localize( "MENU_FILESHARE_DELETE_ERROR", popup.m_categoryName ),
		actionFunc = popup.actionFunc,
		m_controller = popup.m_controller,
		m_fileID = popup.m_fileID,
		completionEvent = "fileshare_delete_slot_done",
		completionNotification = "fileshare_slots_refresh"
	}
	popup:openMenu( "Fileshare_BusyPopup", event.controller, userData )
	popup:close()
end

LUI.createMenu.FileshareManager_ConfirmDelete = function ( controller, userData )
	local popup = CoD.Popup.SetupPopupChoice( "FileshareManager_ConfirmDelete", controller )
	local categoryName = Engine.Localize( Engine.TableLookup( nil, CoD.fileShareCategoriesTable, 2, userData.category, 3 ) .. "_SMALL" )
	popup.title:setText( Engine.Localize( "MENU_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_FILESHARE_DELETECONFIRMATION", categoryName ) )
	popup:addBackButton()
	popup.actionFunc = userData.actionFunc
	popup.m_categoryName = categoryName
	popup.actionFunc = userData.actionFunc
	popup.m_controller = userData.m_controller
	popup.m_fileID = userData.m_fileID
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "fileshare_deleteconfirmation_yes" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "fileshare_deleteconfirmation_yes", CoD.FileshareManager.Delete.Action )
	return popup
end

CoD.FileshareManager.StatPanelUpdate = function ( statPanel, text, color )
	if text ~= nil then
		statPanel.value:setText( text )
	else
		statPanel.value:setText( "" )
	end
	if color ~= nil then
		statPanel.iconBackground:setRGB( color.r, color.g, color.b )
		statPanel.icon:setRGB( color.r, color.g, color.b )
	end
end

CoD.FileshareManager.StatPanel = function ( left, top, type )
	local statPanel = LUI.UIElement.new()
	statPanel:setLeftRight( true, false, left, left + 140 )
	statPanel:setTopBottom( true, false, top, top + 50 )
	local border = CoD.BorderT6.new( 1, 0.2, 0.2, 0.2, 0.5 )
	statPanel:addElement( border )
	
	local iconBackground = LUI.UIImage.new()
	iconBackground:setLeftRight( true, false, 5, 37 )
	iconBackground:setTopBottom( false, false, -16, 16 )
	iconBackground:setImage( RegisterMaterial( "menu_mp_lobby_views_bg" ) )
	statPanel:addElement( iconBackground )
	statPanel.iconBackground = iconBackground
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, false, 5, 37 )
	icon:setTopBottom( false, false, -16, 16 )
	statPanel:addElement( icon )
	statPanel.icon = icon
	
	local padding = 3
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 50, 0 )
	text:setTopBottom( true, false, padding, padding + CoD.textSize.ExtraSmall )
	text:setFont( CoD.fonts.ExtraSmall )
	text:setAlignment( LUI.Alignment.Left )
	text:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	statPanel:addElement( text )
	statPanel.value = LUI.UIText.new()
	statPanel.value:setLeftRight( true, true, 50, 0 )
	statPanel.value:setTopBottom( true, false, padding + CoD.textSize.ExtraSmall, padding + CoD.textSize.ExtraSmall + CoD.textSize.ExtraSmall )
	statPanel.value:setFont( CoD.fonts.ExtraSmall )
	statPanel.value:setAlignment( LUI.Alignment.Left )
	statPanel.value:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	statPanel:addElement( statPanel.value )
	if type == "views" then
		text:setText( Engine.Localize( "MENU_FILESHARE_VIEWS" ) )
		icon:setImage( RegisterMaterial( "menu_mp_lobby_views" ) )
		icon:setRGB( 1, 1, 1 )
	elseif type == "likes" then
		text:setText( Engine.Localize( "MENU_FILESHARE_LIKES" ) )
		icon:setImage( RegisterMaterial( "menu_mp_lobby_like" ) )
		icon:setRGB( CoD.green.r, CoD.green.g, CoD.green.b )
	elseif type == "dislikes" then
		text:setText( Engine.Localize( "MENU_FILESHARE_DISLIKES" ) )
		icon:setImage( RegisterMaterial( "menu_mp_lobby_like" ) )
		icon:setTopBottom( false, false, -14, 18 )
		icon:setZRot( 180 )
		icon:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
	else
		error( "Invalid panel type" )
	end
	statPanel.value:setText( "0" )
	statPanel.update = CoD.FileshareManager.StatPanelUpdate
	return statPanel
end

CoD.FileshareManager.GetName = function ( data )
	local categoryName = Engine.Localize( Engine.TableLookup( nil, CoD.fileShareCategoriesTable, 2, data.category, 3 ) )
	if categoryName == nil then
		categoryName = ""
	end
	if not data.isSupported then
		if CoD.isZombie == true then
			return Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) .. " " .. categoryName
		else
			return Engine.Localize( "MENU_ZOMBIE_CAPS" ) .. " " .. categoryName
		end
	elseif data.category == 6 then
		return Engine.Localize( "MENU_EMBLEM_DEFAULT_TITLE" )
	elseif data.name ~= nil then
		return data.name
	elseif data.gameTypeName ~= nil then
		return data.gameTypeName
	else
		return ""
	end
end

CoD.FileshareManager.SetThumbnailImage = function ( thumbnail, data )
	local thumbWidth = 180
	local thumbHeight = 100
	local thumbImage = nil
	if not data.isSupported then
		if CoD.isZombie == true then
			thumbImage = RegisterMaterial( "menu_mp_fileshare" )
		else
			thumbImage = RegisterMaterial( "menu_zm_fileshare" )
		end
	elseif data.map ~= nil then
		if CoD.isZombie then
			local gameTypeGroup = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", data.gameType, "image" )
			thumbImage = RegisterMaterial( "menu_" .. CoD.Zombie.GetMapName( data.map ) .. "_" .. gameTypeGroup .. "_" .. data.zmMapStartLoc )
		else
			thumbImage = RegisterMaterial( "menu_" .. data.map .. "_map_select_final" )
		end
	elseif data.gameType ~= nil then
		thumbWidth = 100
		thumbImage = RegisterMaterial( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", data.gameType, "image" ) )
	elseif data.category ~= nil and data.category == 6 then
		thumbWidth = 100
		thumbImage = RegisterMaterial( "menu_mp_lobby_icon_emblem" )
	end
	if thumbImage == nil then
		thumbnail:setAlpha( 0 )
	else
		thumbnail:setImage( thumbImage )
		thumbnail:setLeftRight( false, false, -thumbWidth / 2, thumbWidth / 2 )
		thumbnail:setTopBottom( false, false, -thumbHeight / 2, thumbHeight / 2 )
		thumbnail:setAlpha( 1 )
	end
end

CoD.FileshareManager.GetDescription = function ( data )
	if data.isSupported == false then
		return ""
	elseif data.description == nil then
		if data.gameTypeName == nil or data.mapName == nil then
			return ""
		else
			return Engine.Localize( "MENU_FILESHARE_GAMEONMAP", data.gameTypeName, Engine.Localize( data.mapName ) )
		end
	else
		return data.description
	end
end

CoD.FileshareManager.GetPlaylistString = function ( data )
	if data.isSupported == false then
		return ""
	elseif false == CoD.isZombie and data.playlistType ~= nil then
		local lobby = nil
		if data.playlistType == 0 then
			lobby = Engine.Localize( "MPUI_PUBLIC_MATCH_LOBBY" )
		elseif data.playlistType == 1 then
			lobby = Engine.Localize( "MENU_FILESHARE_CUSTOMGAMES" )
		elseif data.playlistType == 2 then
			lobby = Engine.Localize( "MENU_LEAGUE_PLAY" )
		end
		if lobby ~= nil and lobby ~= "" then
			return Engine.Localize( "MENU_FILESHARE_MODE", lobby )
		end
	end
	return ""
end

CoD.FileshareManager.GetGametypeString = function ( data )
	if data.isSupported == false then
		return ""
	elseif false == CoD.isZombie and data.gameType ~= nil then
		local gametypeName = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", data.gameType, "name_ref" )
		return Engine.Localize( "MENU_GAME_TYPE" ) .. Engine.Localize( gametypeName )
	else
		return ""
	end
end

CoD.FileshareManager.FileDetails.Refresh = function ( details, data, controller, isMtx )
	if isMtx == true then
		details.name:setText( Engine.Localize( "MENU_MEDIA_STORAGE_PACK" ) )
		if CoD.FileshareManager.DisableMTXForPS3() then
			details.description:setText( Engine.Localize( "MENU_MTX_MEDIA_STORAGE_WARNING" ) )
			details.description:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
		else
			details.description:setText( Engine.Localize( "MENU_MTX_MEDIA_STORAGE_DESC" ) )
			details.description:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		end
		if details.thumbnail ~= nil then
			details.thumbnail:show()
			details.thumbnail:setImage( RegisterMaterial( "menu_purchase_unlock_token_128" ) )
			details.thumbnail:setLeftRight( false, false, -50, 50 )
			details.thumbnail:setTopBottom( false, false, -50, 50 )
		end
		if details.playlistInfo ~= nil then
			details.playlistInfo:hide()
		end
		if details.durationBacking ~= nil then
			details.durationBacking:hide()
		end
		if details.durationText ~= nil then
			details.durationText:hide()
		end
		if details.profileShotInfo ~= nil then
			details.profileShotInfo:hide()
		end
		if details.author ~= nil then
			details.author:hide()
		end
		if details.date ~= nil then
			details.date:hide()
		end
		details.body:setAlpha( 1 )
		return 
	elseif data == nil or data.valid == false then
		details.body:setAlpha( 0 )
		return 
	end
	details.body:setAlpha( 1 )
	details.name:setText( CoD.FileshareManager.GetName( data ) )
	details.description:setText( CoD.FileshareManager.GetDescription( data ) )
	details.description:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	local categoryString = Engine.TableLookup( nil, CoD.fileShareCategoriesTable, 2, data.category, 0 )
	if CoD.isZombie == false then
		if categoryString == "film" or categoryString == "customgame" then
			details.playlistInfo:setText( CoD.FileshareManager.GetGametypeString( data ) )
			details.playlistInfo:setAlpha( 1 )
		elseif details.playlistInfo ~= nil then
			details.playlistInfo:setAlpha( 0 )
		end
	end
	if not Engine.IsInGame() then
		if categoryString == "film" or categoryString == "clip" then
			details.durationBacking:setAlpha( 1 )
			details.durationText:setAlpha( 1 )
			details.durationText:setText( data.duration )
		else
			details.durationBacking:setAlpha( 0 )
			details.durationText:setAlpha( 0 )
		end
	end
	local fileID = Engine.GetCombatRecordScreenshotInfo( controller, Engine.GetXUID64( controller ) )
	details.profileShotInfo:hide()
	if fileID == data.fileID then
		details.profileShotInfo:show()
	end
	details.author:show()
	if data.category == 1 then
		details.author:setText( Engine.Localize( "MENU_FILESHARE_SAVED_BY" ) .. " " .. data.author )
	else
		details.author:setText( Engine.Localize( "MENU_FILESHARE_AUTHOR" ) .. " " .. data.author )
	end
	details.date:show()
	details.date:setText( data.time )
	if not Engine.IsInGame() then
		CoD.FileshareManager.SetThumbnailImage( details.thumbnail, data )
	end
end

CoD.FileshareManager.GetProfileShot = function ( top, font, fontSize )
	local profileShotInfo = LUI.UIHorizontalList.new()
	profileShotInfo:setLeftRight( true, true, 0, 0 )
	profileShotInfo:setTopBottom( true, false, top, top + fontSize )
	profileShotInfo.starImage = LUI.UIImage.new()
	profileShotInfo.starImage:setLeftRight( true, false, 0, fontSize )
	profileShotInfo.starImage:setTopBottom( false, false, -fontSize / 2, fontSize / 2 )
	profileShotInfo.starImage:setImage( RegisterMaterial( "menu_mp_star_rating" ) )
	profileShotInfo.starImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	profileShotInfo:addElement( profileShotInfo.starImage )
	profileShotInfo:addSpacer( 5 )
	profileShotInfo.profileShotInfoText = LUI.UIText.new()
	profileShotInfo.profileShotInfoText:setLeftRight( true, false, 0, fontSize )
	profileShotInfo.profileShotInfoText:setTopBottom( false, false, -fontSize / 2, fontSize / 2 )
	profileShotInfo.profileShotInfoText:setFont( font )
	profileShotInfo.profileShotInfoText:setText( Engine.Localize( "MENU_PROFILE_SHOT" ) )
	profileShotInfo.profileShotInfoText:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	profileShotInfo:addElement( profileShotInfo.profileShotInfoText )
	return profileShotInfo
end

CoD.FileshareManager.FileDetails.new = function ( top, width, height )
	local details = LUI.UIElement.new()
	details:setLeftRight( false, true, -width, 0 )
	details:setTopBottom( true, false, top, top + height )
	local body = LUI.UIElement.new()
	body:setLeftRight( true, true, 0, 0 )
	body:setTopBottom( true, true, 0, 0 )
	details.body = body
	details:addElement( body )
	local font, fontSize, thumbWidth, thumbHeight = nil
	local y = 0
	if not Engine.IsInGame() then
		thumbWidth = 180
		thumbHeight = 100
		local thumbElement = LUI.UIElement.new()
		thumbElement:setLeftRight( true, false, 0, thumbWidth )
		thumbElement:setTopBottom( true, false, y, y + thumbHeight )
		details.body:addElement( thumbElement )
		local thumbnail = LUI.UIImage.new()
		thumbnail:setLeftRight( false, false, -thumbWidth / 2, thumbWidth / 2 )
		thumbnail:setTopBottom( false, false, -thumbHeight / 2, thumbHeight / 2 )
		details.thumbnail = thumbnail
		thumbElement:addElement( thumbnail )
		details.durationBacking = LUI.UIImage.new()
		details.durationBacking:setLeftRight( false, true, -55, -8 )
		details.durationBacking:setTopBottom( true, false, 5, 5 + CoD.textSize.ExtraSmall )
		details.durationBacking:setRGB( 0, 0, 0 )
		details.durationBacking:setAlpha( 0.8 )
		thumbElement:addElement( details.durationBacking )
		details.durationText = LUI.UIText.new()
		details.durationText:setLeftRight( false, true, -55, -8 )
		details.durationText:setTopBottom( true, false, 5, 5 + CoD.textSize.ExtraSmall )
		details.durationText:setFont( CoD.fonts.ExtraSmall )
		details.durationText:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		details.durationText:setAlignment( LUI.Alignment.Center )
		thumbElement:addElement( details.durationText )
		fontSize = CoD.textSize.ExtraSmall
		font = CoD.fonts.ExtraSmall
		thumbWidth = thumbWidth + 5
	else
		thumbWidth = 0
		thumbHeight = 80
		fontSize = CoD.textSize.Default
		font = CoD.fonts.Default
	end
	local name = LUI.UIText.new()
	name:setLeftRight( true, true, thumbWidth, 0 )
	name:setTopBottom( true, false, y, y + fontSize )
	name:setAlignment( LUI.Alignment.Left )
	name:setFont( font )
	name:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	details.name = name
	details.body:addElement( name )
	y = y + fontSize + 10
	local descEl = LUI.UIElement.new()
	descEl:setLeftRight( true, true, thumbWidth, 0 )
	descEl:setTopBottom( true, false, y, y + fontSize * 3 )
	descEl:setUseStencil( true )
	details.body:addElement( descEl )
	local description = LUI.UIText.new()
	description:setLeftRight( true, true, 0, 0 )
	description:setTopBottom( true, false, 0, fontSize )
	description:setAlignment( LUI.Alignment.Left )
	description:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	description:setFont( font )
	details.description = description
	descEl:addElement( description )
	y = thumbHeight + 10
	local author = LUI.UIText.new()
	author:setLeftRight( true, true, 0, 0 )
	author:setTopBottom( true, false, y, y + fontSize )
	author:setAlignment( LUI.Alignment.Left )
	author:setFont( font )
	author:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	details.author = author
	details.body:addElement( author )
	y = y + fontSize + 5
	local date = LUI.UIText.new()
	date:setLeftRight( true, true, 0, 0 )
	date:setTopBottom( true, false, y, y + fontSize )
	date:setAlignment( LUI.Alignment.Left )
	date:setFont( font )
	if not Engine.IsInGame() then
		date:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	else
		date:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	end
	details.date = date
	details.body:addElement( date )
	y = y + fontSize + 5
	local profileShotInfo = CoD.FileshareManager.GetProfileShot( y, font, fontSize )
	details.profileShotInfo = profileShotInfo
	details.body:addElement( profileShotInfo )
	if CoD.isZombie == false then
		local playlistInfo = LUI.UIText.new()
		playlistInfo:setLeftRight( true, true, 0, 0 )
		playlistInfo:setTopBottom( true, false, y, y + fontSize )
		playlistInfo:setFont( font )
		playlistInfo:setAlignment( LUI.Alignment.Left )
		playlistInfo:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
		playlistInfo:setAlpha( 0 )
		details.playlistInfo = playlistInfo
		details.body:addElement( playlistInfo )
	end
	details.body:setAlpha( 0 )
	details.refresh = CoD.FileshareManager.FileDetails.Refresh
	return details
end

CoD.FileshareManager.List.CreatorCallback = function ( controller, mutables )
	mutables.icon = CoD.FileshareSummary.GetShadedIcon()
	mutables.icon:setLeftRight( true, false, 6, 56 )
	mutables.icon:setTopBottom( false, false, -16, 16 )
	mutables:addElement( mutables.icon )
	mutables.rowText = LUI.UIText.new()
	mutables.rowText:setLeftRight( true, true, 70, 0 )
	mutables.rowText:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	mutables.rowText:setFont( CoD.fonts.Default )
	mutables.rowText:setAlignment( LUI.Alignment.Left )
	mutables:addElement( mutables.rowText )
	mutables.starImage = LUI.UIImage.new()
	mutables.starImage:setLeftRight( false, true, -32, 0 )
	mutables.starImage:setTopBottom( false, false, -16, 16 )
	mutables.starImage:setImage( RegisterMaterial( "menu_mp_star_rating" ) )
	mutables.starImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	mutables.starImage:hide()
	mutables:addElement( mutables.starImage )
end

CoD.FileshareManager.List.DataCallback = function ( controller, itemIndex, mutables )
	local showMtx = CoD.FileshareManager.ShouldShowMtx( controller )
	if CoD.FileshareManager.SkipMtx then
		showMtx = false
	end
	if showMtx then
		if itemIndex == 1 then
			mutables.rowText:setText( Engine.Localize( "MENU_MTX_BUY_MEDIA_STORAGE" ) )
			if CoD.FileshareManager.DisableMTXForPS3() then
				mutables.rowText:setAlpha( 0.5 )
				mutables.icon:hide()
			else
				mutables.icon:update( 1, 1, 1, 0, 0, "menu_purchase_unlock_token_64" )
				mutables.icon:show()
				mutables.rowText:setAlpha( 1 )
				mutables.starImage:hide()
			end
			return 
		end
		itemIndex = itemIndex - 1
	end
	local data = Engine.GetFileshareData( controller, itemIndex - 1 )
	if data ~= nil and data.valid == true then
		mutables.icon:update( data.r, data.g, data.b, 1, 0.3, data.groupIcon )
		mutables.icon:setAlpha( 1 )
		mutables.rowText:setText( CoD.FileshareManager.GetName( data ) )
		mutables.m_fileID = data.fileID
		mutables.m_category = data.category
		mutables.starImage:hide()
		local fileID = Engine.GetCombatRecordScreenshotInfo( controller, Engine.GetXUID64( controller ) )
		if fileID == data.fileID then
			mutables.starImage:show()
		end
	elseif data ~= nil then
		mutables.rowText:setText( Engine.Localize( "MENU_ERROR" ) )
		mutables.m_category = data.category
		mutables.m_fileID = data.fileID
		mutables.icon:setAlpha( 0 )
	end
end

CoD.FileshareManager.List.FocusChanged = function ( list )
	local index = list.listBox:getFocussedIndex()
	local mutables = list.listBox.getFocussedMutables()
	local showMtx = CoD.FileshareManager.ShouldShowMtx( list.m_ownerController )
	if CoD.FileshareManager.SkipMtx then
		showMtx = false
	end
	local isMtxRow = false
	if showMtx then
		if index == 1 then
			isMtxRow = true
		else
			index = index - 1
		end
	end
	if isMtxRow then
		if list.m_fileDetails ~= nil then
			list.m_fileDetails:refresh( data, list.m_ownerController, true )
		end
	else
		local data = Engine.GetFileshareData( list.m_ownerController, index - 1 )
		if list.m_fileDetails ~= nil then
			list.m_fileDetails:refresh( data, list.m_ownerController, false )
		end
	end
	local fileshareManager = list.fileshareManager
	if fileshareManager ~= nil then
		fileshareManager.leftButtonPromptBar:removeAllChildren()
		if isMtxRow then
			if fileshareManager.buyButton ~= nil then
				fileshareManager:addLeftButtonPrompt( fileshareManager.buyButton )
			end
		else
			fileshareManager:addLeftButtonPrompt( fileshareManager.deleteButton )
		end
		fileshareManager:addBackButton()
	end
end

CoD.FileshareManager.List.new = function ( controller, left, top, width, height, numRows, fileDetails )
	local list = LUI.UIElement.new()
	list.m_ownerController = controller
	list.m_fileDetails = fileDetails
	local showMtx = CoD.FileshareManager.ShouldShowMtx( controller )
	if CoD.FileshareManager.SkipMtx then
		showMtx = false
	end
	if showMtx then
		numRows = numRows + 1
	end
	list:registerEventHandler( "listbox_focus_changed", CoD.FileshareManager.List.FocusChanged )
	list:setLeftRight( true, false, left, left + width )
	list:setTopBottom( true, false, top, top + height )
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, -8, 8 )
	bg:setTopBottom( true, true, -8, 14 )
	bg:setRGB( 0.3, 0.3, 0.3 )
	bg:setAlpha( 0.2 )
	list:addElement( bg )
	local listBoxDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
	list.listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, 11, 42, width, CoD.FileshareManager.List.CreatorCallback, CoD.FileshareManager.List.DataCallback, 0, 0 )
	list.listBox:addScrollBar( 30, 2 )
	list.listBox.m_pageArrowsOn = true
	list:addElement( list.listBox )
	list.listBox:setTotalItems( numRows, nil )
	list.listBox:refresh()
	return list
end

function FileshareManager_ReloadList( fileshareManager, controller, category, groupName )
	if fileshareManager.list ~= nil then
		fileshareManager.m_groupName = groupName
		local event = {
			controller = controller
		}
		CoD.FileshareManager.Refresh( fileshareManager, event )
	end
end

function FileshareManager_AllTab( tabManager, controller )
	CoD.FileshareManager.SkipMtx = false
	FileshareManager_ReloadList( tabManager.popup, controller, nil, nil )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

function FileshareManager_VideosTab( tabManager, controller )
	CoD.FileshareManager.SkipMtx = true
	FileshareManager_ReloadList( tabManager.popup, controller, "render", "renders" )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

function FileshareManager_FilmsTab( tabManager, controller )
	CoD.FileshareManager.SkipMtx = false
	FileshareManager_ReloadList( tabManager.popup, controller, "film", "gamefilms" )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

function FileshareManager_ScreenshotsTab( tabManager, controller )
	CoD.FileshareManager.SkipMtx = false
	FileshareManager_ReloadList( tabManager.popup, controller, "screenshot", "screenshots" )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

function FileshareManager_CustomGamesTab( tabManager, controller )
	CoD.FileshareManager.SkipMtx = false
	FileshareManager_ReloadList( tabManager.popup, controller, "customgame", "customgames" )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

function FileshareManager_EmblemsTab( tabManager, controller )
	CoD.FileshareManager.SkipMtx = false
	FileshareManager_ReloadList( tabManager.popup, controller, "emblem", "emblems" )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

CoD.FileshareManager.SlotsAvailable = function ( fileshareManager, event )
	fileshareManager.spinner:setAlpha( 0 )
	if event.valid == false then
		fileshareManager.occludedMenu:openPopup( "FileshareManager_Error", event.controller )
		fileshareManager:close()
		return 
	elseif fileshareManager.tabManager == nil and fileshareManager.m_tabbed == true then
		local tabManagerDefaultAnimationState = {
			left = 0,
			top = 55,
			right = 0,
			bottom = CoD.ButtonPrompt.Height,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false
		}
		fileshareManager.tabContentPane = LUI.UIElement.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = -CoD.ButtonPrompt.Height,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true
		} )
		local tabManager = CoD.MFTabManager.new( fileshareManager.tabContentPane, tabManagerDefaultAnimationState )
		tabManager:keepRightBumperAlignedToHeader( true )
		tabManager.popup = fileshareManager
		fileshareManager.tabManager = tabManager
		fileshareManager:addElement( tabManager )
		tabManager:addTab( event.controller, "MENU_FILESHARE_ALL", FileshareManager_AllTab )
		tabManager:addTab( event.controller, "MENU_FILESHARE_GAME_FILMSCLIPS", FileshareManager_FilmsTab )
		tabManager:addTab( event.controller, "MENU_FILESHARE_SCREENSHOTS", FileshareManager_ScreenshotsTab )
		tabManager:addTab( event.controller, "MENU_FILESHARE_CUSTOMGAMES", FileshareManager_CustomGamesTab )
		tabManager:addTab( event.controller, "MENU_FILESHARE_EMBLEMS", FileshareManager_EmblemsTab )
		tabManager:addTab( event.controller, "MENU_FILESHARE_RENDEREDVIDEOS", FileshareManager_VideosTab )
		tabManager:refreshTab( event.controller )
	end
	local groups = Engine.GetFileshareCategories( event.controller )
	if fileshareManager.groupSummary == nil then
		if not Engine.IsInGame() then
			fileshareManager.groupSummary = CoD.FileshareSummary.new( 287, 430, 371, groups, fileshareManager.m_groupName, fileshareManager.m_pulse )
		else
			fileshareManager.groupSummary = CoD.FileshareSummary.new( 270, 430, 371, groups, fileshareManager.m_groupName, fileshareManager.m_pulse )
		end
		fileshareManager:addElement( fileshareManager.groupSummary )
	end
	if fileshareManager.details == nil then
		fileshareManager.details = CoD.FileshareManager.FileDetails.new( 95, 430, 300 )
		fileshareManager:addElement( fileshareManager.details )
	end
	local totalFiles = 0
	for i = 1, #groups, 1 do
		if fileshareManager.m_groupName == nil then
			totalFiles = totalFiles + groups[i].occupied
		end
		if fileshareManager.m_groupName == groups[i].name then
			totalFiles = totalFiles + groups[i].occupied
		end
	end
	if fileshareManager.list == nil then
		fileshareManager.list = CoD.FileshareManager.List.new( event.controller, 0, 95, 385, 487, totalFiles, fileshareManager.details )
		fileshareManager.list.fileshareManager = fileshareManager
		fileshareManager:addElement( fileshareManager.list )
	end
	local showMtx = CoD.FileshareManager.ShouldShowMtx( event.controller )
	if CoD.FileshareManager.SkipMtx then
		showMtx = false
	end
	fileshareManager.leftButtonPromptBar:removeAllChildren()
	if not showMtx then
		if totalFiles > 0 then
			fileshareManager:addLeftButtonPrompt( fileshareManager.deleteButton )
		end
	elseif fileshareManager.buyButton ~= nil then
		fileshareManager:addLeftButtonPrompt( fileshareManager.buyButton )
	end
	fileshareManager:addBackButton()
end

CoD.FileshareManager.ExecuteDelete = function ( userData )
	Engine.FileShareDelete( userData.m_controller, userData.m_fileID )
end

CoD.FileshareManager.SlotDeleteConfirmation = function ( fileshareManager, event )
	local mutables = fileshareManager.list.listBox:getFocussedMutables()
	if mutables ~= nil and mutables.m_fileID ~= nil then
		CoD.perController[event.controller].FileshareManagerCurrFileID = mutables.m_fileID
		local userData = {
			category = mutables.m_category,
			actionFunc = CoD.FileshareManager.ExecuteDelete,
			m_controller = event.controller,
			m_fileID = mutables.m_fileID
		}
		local deletePopup = fileshareManager:openPopup( "FileshareManager_ConfirmDelete", event.controller, userData )
		deletePopup.callingMenu = fileshareManager
	end
end

CoD.FileshareManager.Refresh = function ( fileshareManager, event )
	fileshareManager.spinner:setAlpha( 1 )
	fileshareManager.details:close()
	fileshareManager.details = nil
	fileshareManager.groupSummary:close()
	fileshareManager.groupSummary = nil
	fileshareManager.list:close()
	fileshareManager.list = nil
	fileshareManager.leftButtonPromptBar:removeAllChildren()
	fileshareManager:addBackButton()
	fileshareManager.m_isRefresh = true
	if fileshareManager.m_groupName == nil then
		Engine.Exec( event.controller, "fileshareGetSlots" )
	else
		Engine.Exec( event.controller, "fileshareGetSlots " .. fileshareManager.m_groupName )
	end
end

CoD.FileshareManager.ShouldShowMtx = function ( controller )
	if not Engine.IsMTXAvailable( Dvar.fshMtxName:get() ) then
		return false
	elseif Engine.HasMTX( controller, Dvar.fshMtxName:get() ) then
		return false
	else
		return true
	end
end

CoD.FileshareManager.HasMtx = function ( controller )
	return Engine.HasMTX( controller, Dvar.fshMtxName:get() )
end

CoD.FileshareManager.BuyStorage = function ( self, event )
	if Engine.IsGuest( event.controller ) then
		local errorPopup = self:openPopup( "Error", controller )
		errorPopup:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
	elseif CoD.isPS3 then
		self:openPopup( "MTXPurchase", event.controller, {
			mtxName = Dvar.fshMtxName:get(),
			openingMenuName = "fileshare"
		} )
	else
		Engine.SetStartCheckoutTimestampUTC()
		Engine.PurchaseMTX( event.controller, Dvar.fshMtxName:get(), "fileshare" )
	end
end

CoD.FileshareManager.HandleMTXChanged = function ( self, event )
	if event.controller ~= self.m_ownerController then
		return 
	else
		CoD.FileshareManager.Refresh( self, event )
	end
end

CoD.FileshareManager.DisableMTXForPS3 = function ()
	local f33_local0 = CoD.isPS3
	if f33_local0 then
		if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
			f33_local0 = Engine.IsInGame()
		else
			f33_local0 = false
		end
	end
	return f33_local0
end

LUI.createMenu.FileshareManager = function ( controller, data )
	local fileshareManager = CoD.Menu.New( "FileshareManager" )
	CoD.FileshareManager.SkipMtx = false
	if data ~= nil and data.groupName ~= nil and data.groupName == "renders" then
		CoD.FileshareManager.SkipMtx = true
	end
	if not Engine.IsInGame() then
		fileshareManager:addLargePopupBackground()
	end
	fileshareManager:setOwner( controller )
	fileshareManager:addTitle( Engine.Localize( "MENU_FILEMANAGER_CAPS" ), LUI.Alignment.Left )
	if data ~= nil then
		fileshareManager.m_category = data.category
		fileshareManager.m_groupName = data.groupName
		fileshareManager.m_pulse = true
		fileshareManager.m_tabbed = false
	else
		fileshareManager.m_pulse = false
		fileshareManager.m_tabbed = true
	end
	fileshareManager.m_isRefresh = false
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
	fileshareManager.spinner = spinner
	fileshareManager:addElement( spinner )
	fileshareManager.deleteButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_DELETE" ), fileshareManager, "fileshare_slot_deleteconfirmation", false, nil, false, nil, "X" )
	if not CoD.FileshareManager.DisableMTXForPS3() then
		fileshareManager.buyButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_STORE_BUY" ), fileshareManager, "fileshare_buy_storage", false, nil, false, nil, "B" )
	end
	fileshareManager:registerEventHandler( "fileshare_slots_available", CoD.FileshareManager.SlotsAvailable )
	fileshareManager:registerEventHandler( "fileshare_slot_deleteconfirmation", CoD.FileshareManager.SlotDeleteConfirmation )
	fileshareManager:registerEventHandler( "fileshare_buy_storage", CoD.FileshareManager.BuyStorage )
	fileshareManager:registerEventHandler( "fileshare_slots_refresh", CoD.FileshareManager.Refresh )
	fileshareManager:registerEventHandler( "mtx_changed", CoD.FileshareManager.HandleMTXChanged )
	if fileshareManager.m_category ~= nil then
		Engine.Exec( controller, "fileshareGetSlots " .. fileshareManager.m_groupName )
	else
		Engine.Exec( controller, "fileshareGetSlots" )
	end
	fileshareManager:addBackButton()
	return fileshareManager
end

