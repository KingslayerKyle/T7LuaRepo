require( "ui.T6.CardCarouselList" )
require( "ui_mp.T6.Menus.FileActionPopup" )
require( "ui_mp.T6.Menus.FileshareManager" )
require( "ui_mp.T6.Menus.FileshareReport" )
require( "ui_mp.T6.Menus.FileshareSave" )
require( "ui_mp.T6.Menus.FileshareVote" )
require( "ui_mp.T6.Menus.FilesharePopup" )
require( "ui.T6.ScrollableTextContainer" )

CoD.Codtv = {}
CoD.Codtv.WebMPlayback = nil
CoD.Codtv.WebMPlaybackMaterial = "webm_720p_10"
CoD.Codtv.ItemWidth = 192
CoD.Codtv.ItemHeight = 146
CoD.Codtv.HighlightedItemWidth = 345.6
CoD.Codtv.HighligtedItemHeight = 230.4
CoD.Codtv.AutoPlayRetryDelay = 3000
CoD.Codtv.ThumbnailDownloadCheckInterval = 200
CoD.Codtv.ThumbnailsDownloaded = false
CoD.Codtv.DWContentLoadDelay = 100
CoD.Codtv.CardContentAnimDelay = 100
CoD.Codtv.InfoPanelTop = 250
CoD.Codtv.InfoPanelLeft = 350
CoD.Codtv.InfoPanelHeight = 300
CoD.Codtv.InfoPanelWidth = 520
CoD.Codtv.InfoPanelMovement = 30
CoD.Codtv.InfoPanelOutDelay = 50
CoD.Codtv.InfoPanelInDelay = 200
CoD.Codtv.EmblemLarge = 210
CoD.Codtv.EmblemSmall = 128
CoD.Codtv.CardsPerPage = 10
CoD.Codtv.MaxWebMMaterials = 8
CoD.Codtv.StoreDescriptionContainerWidth = CoD.Codtv.InfoPanelWidth - 25
CoD.Codtv.StoreDescriptionContainerHeight = 125
CoD.Codtv.ScrollableTextPauseTime = 5000
CoD.Codtv.ScrollableTextPerLineScrollTime = 2000
CoD.Codtv.INVALID_MTX_ID = -1
CoD.Codtv.CardSelected = function ( card, event )
	Engine.PlaySound( "cac_grid_equip_item" )
	if card.type == "dwcontent" then
		CoD.Codtv.DWContentCardSelected( card, event )
	elseif card.type == "video" then
		CoD.Codtv.VideoCardSelected( card, event )
	elseif card.type == "folder" then
		CoD.Codtv.FolderCardSelected( card, event )
	elseif card.type == "dwfolder" then
		CoD.Codtv.DWFolderCardSelected( card, event )
	elseif card.type == "dwfolder_next" or card.type == "dwfolder_prev" then
		CoD.Codtv.DWFolderCardNextPrevSelected( card, event )
	elseif card.type == "custombutton" then
		CoD.Codtv.CustomButtonCardSelected( card, event )
	end
end

CoD.Codtv.CardGainFocus = function ( card, event )
	if card.codtv ~= nil then
		card.codtv.hintText:updateHintText( "" )
		card.codtv.infoPanel:removeAllChildren()
		if card.codtv.codtvIcon ~= nil and CoD.Codtv.ShowCODTVIcon( card.codtv ) then
			card.codtv.codtvIcon:setAlpha( 1 )
		end
	end
	if card.type == "dwcontent" then
		CoD.Codtv.DWContentCardGainFocus( card, event )
	elseif card.type == "video" then
		CoD.Codtv.VideoCardGainFocus( card, event )
	elseif card.type == "folder" then
		CoD.Codtv.FolderCardGainFocus( card, event )
	elseif card.type == "dwfolder" then
		CoD.Codtv.DWFolderCardGainFocus( card, event )
	elseif card.type == "dwfolder_next" or card.type == "dwfolder_prev" then
		CoD.Codtv.DWFolderCardNextPrevGainFocus( card, event )
	elseif card.type == "custombutton" then
		CoD.Codtv.CustomButtonGainFocus( card, event )
	end
	CoD.CardCarousel.Card_GainFocus( card, event )
	return true
end

CoD.Codtv.CardLoseFocus = function ( card, event )
	if card.type == "dwcontent" then
		CoD.Codtv.DWContentCardLoseFocus( card, event )
	elseif card.type == "video" then
		CoD.Codtv.VideoCardLoseFocus( card, event )
	elseif card.type == "folder" then
		CoD.Codtv.FolderCardLoseFocus( card, event )
	elseif card.type == "dwfolder" then
		CoD.Codtv.DWFolderCardLoseFocus( card, event )
	elseif card.type == "dwfolder_next" or card.type == "dwfolder_prev" then
		CoD.Codtv.DWFolderCardNextPrevLoseFocus( card, event )
	end
	if card.codtv ~= nil then
		card.codtv.hintText:updateHintText( "" )
		card.codtv.infoPanel:removeAllChildren()
	end
	CoD.CardCarousel.Card_LoseFocus( card, event )
	return true
end

CoD.Codtv.GetGenericCard = function ( carousel )
	local card = carousel:addNewCard()
	card.codtv = carousel.codtv
	card.container = LUI.UIElement.new()
	card.container:setLeftRight( true, true, 0, 0 )
	card.container:setTopBottom( true, true, 0, 0 )
	card:addElement( card.container )
	card.bg = LUI.UIImage.new()
	card.bg:setLeftRight( true, true, 2, -2 )
	card.bg:setTopBottom( false, true, -CoD.textSize.Default - 3, -3 )
	card.bg:setRGB( 0, 0, 0 )
	card.container:addElement( card.bg )
	card.text = LUI.UIText.new()
	card.text:setLeftRight( true, true, 5, 0 )
	card.text:setTopBottom( false, true, -CoD.textSize.Default - 3, -3 )
	card.text:setFont( CoD.fonts.Default )
	card.text:setAlignment( LUI.Alignment.Left )
	card.container:addElement( card.text )
	card:registerEventHandler( "button_action", CoD.Codtv.CardSelected )
	card:registerEventHandler( "gain_focus", CoD.Codtv.CardGainFocus )
	card:registerEventHandler( "lose_focus", CoD.Codtv.CardLoseFocus )
	return card
end

CoD.Codtv.FolderCardSelected = function ( card, event )
	card.codtv.m_carouselContext = CoD.CardCarousel.GetCurrentCarouselInfo( card )
	card.codtv.m_carouselContext.folderIndex = card.codtv.m_currentFolderIndex
	card.codtv:reload( card.folderIndex )
end

CoD.Codtv.FolderCardGainFocus = function ( card, event )
	card.codtv.rightButtonPromptBar:removeAllChildren()
	card.codtv.leftButtonPromptBar:removeAllChildren()
	card.codtv:addBackButton()
	card.codtv:addSelectButton()
end

CoD.Codtv.FolderCardLoseFocus = function ( card, event )
	
end

CoD.Codtv.CustomButtonBuyStorageLoad = function ( card, data )
	card.centerImageContainer:close()
	card:setupCenterImage( data.imageName, 72, 72, 2, false )
end

CoD.Codtv.CustomButtonNewEmblemLoad = function ( card, data )
	card.centerImageContainer:close()
	card:setupCenterImage( data.imageName, 72, 72, 2, false )
end

CoD.Codtv.ShouldLoadCard = function ( controller, cardData )
	if cardData.type == "custombutton" and cardData.action == "buystorage" then
		return CoD.FileshareManager.ShouldShowMtx( controller )
	else
		return true
	end
end

CoD.Codtv.FolderCardsLoad = function ( controller, carousel, data )
	for i = 1, data.subfolderCount, 1 do
		if CoD.Codtv.ShouldLoadCard( controller, data[i] ) then
			local card = CoD.Codtv.GetGenericCard( carousel )
			card.text:setText( data[i].name )
			if data[i].imageName ~= nil and data[i].imageType ~= nil and data[i].imageType == "material" then
				card:setupCenterImage( data[i].imageName, 128, 128, 2, false )
			end
			card.type = data[i].type
			card.customAction = data[i].action
			card.folderIndex = data[i].folderIndex
			card.parentFolderIndex = data[i].parentFolderIndex
			if card.type == "custombutton" and card.customAction ~= nil then
				if card.customAction == "buystorage" then
					CoD.Codtv.CustomButtonBuyStorageLoad( card, data[i] )
				end
				if card.customAction == "newemblem" then
					CoD.Codtv.CustomButtonNewEmblemLoad( card, data[i] )
				end
			end
		end
	end
end

CoD.Codtv.DWContentCardCanSave = function ( card )
	if card.fileData == nil then
		return false
	elseif card.fileData.category == "clip" or card.fileData.category == "screenshot" or card.fileData.category == "film" then
		return true
	else
		return false
	end
end

CoD.Codtv.DWContentCardSave = function ( card, event )
	if card ~= nil and card.fileData ~= nil and card:isInFocus() then
		CoD.perController[event.controller].fileshareSaveCategory = card.fileData.category
		CoD.perController[event.controller].fileshareSaveName = card.fileData.name
		CoD.perController[event.controller].fileshareSaveDescription = card.fileData.description
		CoD.perController[event.controller].fileshareSaveIsCopy = true
		CoD.perController[event.controller].fileshareSaveFileID = card.fileData.fileID
		CoD.perController[event.controller].fileshareSaveIsPooled = card.fileData.isPooled
		CoD.perController[event.controller].fileshareSaveMap = card.fileData.map
		CoD.perController[event.controller].fileshareZmMapStartLocation = card.fileData.zmMapStartLoc
		CoD.perController[event.controller].fileshareZmMapStartLocationName = card.fileData.zmMapStartLocName
		CoD.perController[event.controller].fileshareGameType = card.fileData.gameType
		card.codtv:openPopup( "FileshareSave", event.controller )
	end
end

CoD.Codtv.DWContentCardCanVote = function ( card, event )
	local xuid = Engine.GetXUID( event.controller )
	if xuid ~= nil and xuid == card.fileData.authorXuid then
		return false
	elseif card.fileData == nil or card.fileData.isPooled == true or card.fileData.category == "ingamestore" then
		return false
	else
		return true
	end
end

CoD.Codtv.DWContentCardVote = function ( card, event )
	if card ~= nil and card.fileData ~= nil and card.fileData.fileID ~= "0" and card:isInFocus() then
		CoD.perController[event.controller].voteData = card.fileData
		CoD.perController[event.controller].voteUpdateTarget = card.codtv
		local popup = card.codtv:openPopup( "FileshareVote", card.codtv.m_ownerController )
	end
end

CoD.Codtv.DWContentCardCanReport = function ( card, event )
	local xuid = Engine.GetXUID( event.controller )
	if xuid ~= nil and xuid == card.fileData.authorXuid then
		return false
	elseif card.fileData == nil or card.fileData.isPooled == true or card.fileData.category ~= "emblem" then
		return false
	else
		return true
	end
end

CoD.Codtv.DWContentCardReport = function ( card, event )
	if card ~= nil and card.fileData ~= nil and card.fileData.fileID ~= "0" and card:isInFocus() then
		CoD.perController[event.controller].reportData = card.fileData
		local popup = card.codtv:openPopup( "FileshareReport", card.codtv.m_ownerController )
	end
end

CoD.Codtv.DWFolderCardEmblemSelected = function ( card, event )
	if card.fileData == nil or card.fileData.fileID == nil then
		return 
	else
		card.codtv.m_previousFolderIndex = nil
		if Engine.IsFeatureBanned( CoD.FEATURE_BAN_EMBLEM_EDITOR ) then
			Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_EMBLEM_EDITOR )
			return 
		else
			CoD.perController[event.controller].emblemSaveSlot = card.fileData.slot
			CoD.perController[event.controller].emblemFileID = card.fileData.fileID
			CoD.Codtv.Shutdown()
			card.codtv:close()
		end
	end
end

CoD.Codtv.DWFolderCardLeagueIDSelected = function ( card, event )
	if card.fileData == nil or card.fileData.fileID == nil then
		return 
	else
		Engine.Exec( controller, "emblemSetLeagueIdentity " .. card.fileData.fileID .. " " .. CoD.LeaguesData.CurrentTeamInfo.teamID )
		CoD.Codtv.Shutdown()
		card.codtv:goBack( event.controller )
	end
end

CoD.EmblemOptions = {}
LUI.createMenu.EmblemSetIdentityConfirmation = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_chatrestricted", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "MENU_EMBLEM_IDENTITY_SET" ) )
	popup.anyControllerAllowed = true
	popup.primaryButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), popup, "emblem_set_identity_accept" )
	popup:addLeftButtonPrompt( popup.primaryButton )
	popup:registerEventHandler( "emblem_set_identity_accept", CoD.EmblemOptions.SetIdentityAccept )
	return popup
end

CoD.EmblemOptions.SetIdentityAccept = function ( popup, event )
	local occludedMenu = popup.occludedMenu
	popup:goBack( event.controller )
	occludedMenu:goBack( event.controller )
end

CoD.EmblemOptions.SetIdentity = function ( emblemOptions, event )
	Engine.Exec( event.controller, "emblemSetIdentity " .. emblemOptions.m_fileID )
	emblemOptions:openPopup( "EmblemSetIdentityConfirmation", event.controller )
end

CoD.EmblemOptions.ExecuteCopy = function ( userData )
	Engine.FileShareCopy( userData.m_controller, userData.m_fileID, userData.m_isPooled, userData.m_slot )
end

CoD.EmblemOptions.CreateCopy = function ( emblemOptions, event )
	if emblemOptions.m_fileID ~= nil and emblemOptions.m_fileID ~= "0" and emblemOptions.m_nextSlot ~= nil then
		local userData = {
			title = Engine.Localize( "MENU_EMBLEM_COPY" ),
			message = Engine.Localize( "MENU_EMBLEM_COPY_WAIT" ),
			successNotice = Engine.Localize( "MENU_EMBLEM_COPY_SUCCESS" ),
			failureNotice = Engine.Localize( "MENU_EMBLEM_COPY_FAILURE" ),
			completionEvent = "fileshare_upload_complete",
			completionNotification = "delete_done",
			actionFunc = CoD.EmblemOptions.ExecuteCopy,
			m_controller = event.controller,
			m_fileID = emblemOptions.m_fileID,
			m_isPooled = false,
			m_slot = emblemOptions.m_nextSlot
		}
		emblemOptions:openPopup( "Fileshare_BusyPopup", event.controller, userData )
	end
end

CoD.EmblemOptions.Delete = function ( emblemOptions, event )
	local userData = {
		title = Engine.Localize( "MENU_EMBLEM_DELETE" ),
		message = Engine.Localize( "MENU_EMBLEM_DELETE_WAIT" ),
		confirmationTitle = Engine.Localize( "MENU_EMBLEM_DELETE" ),
		confirmationMessage = Engine.Localize( "MENU_EMBLEM_DELETE_CONFIRMATION" ),
		successNotice = Engine.Localize( "MENU_EMBLEM_DELETE_SUCCESS" ),
		failureNotice = Engine.Localize( "MENU_EMBLEM_DELETE_FAILURE" ),
		actionFunc = CoD.FileshareManager.ExecuteDelete,
		m_controller = event.controller,
		m_fileID = emblemOptions.m_fileID,
		completionEvent = "fileshare_delete_slot_done",
		completionNotification = "delete_done"
	}
	emblemOptions:openPopup( "Fileshare_ConfirmationPopup", event.controller, userData )
end

CoD.EmblemOptions.DeleteDone = function ( emblemOptions, event )
	emblemOptions:goBack( event.controller )
end

LUI.createMenu.EmblemOptions = function ( controller )
	local emblemOptions = CoD.Menu.NewMediumPopup( "EmblemOptions" )
	emblemOptions:setOwner( controller )
	emblemOptions.m_fileID = CoD.perController[controller].emblemOptionsFileID
	emblemOptions.m_slotsRemaining = CoD.perController[controller].emblemOptionsSlotsRemaining
	emblemOptions.m_nextSlot = CoD.perController[controller].emblemOptionsNextSlot
	emblemOptions:addSelectButton()
	emblemOptions:addBackButton()
	emblemOptions:registerEventHandler( "emblem_set_identity", CoD.EmblemOptions.SetIdentity )
	emblemOptions:registerEventHandler( "emblem_create_copy", CoD.EmblemOptions.CreateCopy )
	emblemOptions:registerEventHandler( "emblem_delete", CoD.EmblemOptions.Delete )
	emblemOptions:registerEventHandler( "delete_done", CoD.EmblemOptions.DeleteDone )
	local top = 5
	local messageText = LUI.UIText.new()
	messageText:setLeftRight( true, true, 0, 0 )
	messageText:setTopBottom( true, false, top, top + CoD.textSize.Big )
	messageText:setFont( CoD.fonts.Big )
	messageText:setAlignment( LUI.Alignment.Left )
	messageText:setText( Engine.Localize( "MENU_EMBLEM_OPTIONS_CAPS" ) )
	emblemOptions:addElement( messageText )
	top = top + CoD.textSize.Big + 70
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, false, 0, 500 )
	buttonList:setTopBottom( true, true, top, 0 )
	emblemOptions:addElement( buttonList )
	local identityButton = buttonList:addButton( Engine.Localize( "MENU_EMBLEM_SET_IDENTITY" ), Engine.Localize( "MENU_EMBLEM_SET_IDENTITY_HINT" ) )
	identityButton:setActionEventName( "emblem_set_identity" )
	identityButton:processEvent( {
		name = "gain_focus"
	} )
	if emblemOptions.m_slotsRemaining == 0 then
		local copyButton = buttonList:addButton( Engine.Localize( "MENU_EMBLEM_CREATE_COPY" ), Engine.Localize( "MENU_EMBLEM_COPY_NOT_ALLOWED_HINT" ) )
		copyButton:disable()
	else
		local copyButton = buttonList:addButton( Engine.Localize( "MENU_EMBLEM_CREATE_COPY" ), Engine.Localize( "MENU_EMBLEM_COPY_ALLOWED_HINT" ) )
		copyButton:setActionEventName( "emblem_create_copy" )
	end
	local deleteButton = buttonList:addButton( Engine.Localize( "MENU_DELETE_CAPS" ), Engine.Localize( "MENU_EMBLEM_DELETE_HINT" ) )
	deleteButton:setActionEventName( "emblem_delete" )
	buttonList:addSpacer( CoD.CoD9Button.Height * 2 )
	local emblemImage = LUI.UIImage.new()
	emblemImage:setLeftRight( false, true, -306, -50 )
	emblemImage:setTopBottom( true, false, 70, 326 )
	emblemImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_EMBLEM, emblemOptions.m_fileID )
	emblemOptions:addElement( emblemImage )
	return emblemOptions
end

CoD.StorePurchaseConfirmation = {}
CoD.StorePurchaseConfirmation.AButtonText = function ( purchaseConfirmation )
	if purchaseConfirmation.isOfferPurchased ~= nil and purchaseConfirmation.isOfferPurchased == 1 then
		purchaseConfirmation.selectButton:setText( Engine.Localize( "MENU_STORE_DOWNLOAD" ) )
	else
		purchaseConfirmation.selectButton:setText( Engine.Localize( "MENU_STORE_BUY" ) )
	end
end

CoD.StorePurchaseConfirmation.AButtonPressed = function ( purchaseConfirmation, event )
	if purchaseConfirmation.isOfferPurchased == 1 then
		Engine.ExecNow( event.controller, "downloadSelectedOffer " .. purchaseConfirmation.offerid .. " " .. purchaseConfirmation.storeContentType )
	else
		Engine.ExecNow( event.controller, "purchaseSelectedOffer " .. purchaseConfirmation.offerid .. " " .. purchaseConfirmation.storeContentType )
	end
	purchaseConfirmation:goBack( event.controller )
end

LUI.createMenu.StorePurchaseConfirmation = function ( controller )
	local purchaseConfirmation = CoD.Menu.New( "StorePurchaseConfirmation" )
	purchaseConfirmation:setOwner( controller )
	purchaseConfirmation.unusedControllerAllowed = true
	purchaseConfirmation:registerEventHandler( "button_select_prompt", CoD.StorePurchaseConfirmation.AButtonPressed )
	purchaseConfirmation:addLargePopupBackground()
	purchaseConfirmation.isOfferPurchased = CoD.perController[controller].isofferpurchased
	purchaseConfirmation.folderIndex = CoD.perController[controller].folderIndex
	purchaseConfirmation.startIndex = CoD.perController[controller].startIndex
	purchaseConfirmation.offerid = CoD.perController[controller].offerid
	purchaseConfirmation.storeContentType = CoD.perController[controller].storeContentType
	purchaseConfirmation:addSelectButton( nil, nil, "button_select_prompt" )
	purchaseConfirmation:addBackButton()
	CoD.StorePurchaseConfirmation.AButtonText( purchaseConfirmation )
	local top = 0
	local title = LUI.UIText.new()
	title:setLeftRight( true, true, 0, 0 )
	title:setTopBottom( true, false, top, top + CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	title:setAlignment( LUI.Alignment.Left )
	title:setText( Engine.Localize( "MENU_PURCHASE_CONFIRMAITON" ) )
	purchaseConfirmation:addElement( title )
	top = top + CoD.textSize.Big + 20
	local longDescElement = LUI.UIText.new()
	longDescElement:setLeftRight( true, true, 0, 0 )
	longDescElement:setTopBottom( true, false, top, top + CoD.textSize.ExtraSmall )
	longDescElement:setFont( CoD.fonts.ExtraSmall )
	longDescElement:setAlignment( LUI.Alignment.Left )
	longDescElement:setupUITextUncached()
	longDescElement:setText( CoD.perController[controller].longDescription )
	purchaseConfirmation:addElement( longDescElement )
	local ps3StoreLogo = LUI.UIImage.new()
	ps3StoreLogo:setLeftRight( false, true, -128, 0 )
	ps3StoreLogo:setTopBottom( false, true, -62, -30 )
	ps3StoreLogo:setImage( RegisterMaterial( "playstation_store_ingame_logo" ) )
	purchaseConfirmation:addElement( ps3StoreLogo )
	return purchaseConfirmation
end

CoD.Codtv.GetSelectedCard = function ( codtv )
	local focussedCarousel = codtv.m_cardCarouselList.cardCarousels[codtv.m_cardCarouselList.m_currentCardCarouselIndex]
	if focussedCarousel ~= nil then
		return focussedCarousel.horizontalList.cards[focussedCarousel.horizontalList.m_currentCardIndex]
	else
		return nil
	end
end

CoD.Codtv.EmblemOptions = function ( codtv, event )
	local selectedCard = CoD.Codtv.GetSelectedCard( codtv )
	if selectedCard ~= nil and selectedCard.fileData ~= nil and selectedCard.fileData.category == "emblem" then
		CoD.perController[event.controller].emblemOptionsFileID = selectedCard.fileData.fileID
		CoD.perController[event.controller].emblemOptionsSlotsRemaining = codtv.m_emblemSlotsRemaining
		CoD.perController[event.controller].emblemOptionsNextSlot = codtv.m_embemNextSlot
		codtv:openMenu( "EmblemOptions", event.controller )
		codtv:close()
	end
end

CoD.Codtv.StorePurchaseConfirmation = function ( codtv, event )
	local selectedCard = CoD.Codtv.GetSelectedCard( codtv )
	if selectedCard ~= nil and selectedCard.fileData ~= nil and selectedCard.fileData.category == "ingamestore" then
		CoD.perController[event.controller].isofferpurchased = selectedCard.fileData.isOfferPurchased
		CoD.perController[event.controller].longDescription = selectedCard.fileData.longDescription
		CoD.perController[event.controller].folderIndex = selectedCard.fileData.folderIndex
		CoD.perController[event.controller].startIndex = selectedCard.fileData.startIndex
		CoD.perController[event.controller].offerid = selectedCard.fileData.offerid
		CoD.perController[event.controller].storeContentType = selectedCard.fileData.storeContentType
		codtv:openPopup( "StorePurchaseConfirmation", event.controller )
	end
end

CoD.Codtv.IngameStoreSelectButtonPressed = function ( card, event )
	if CoD.isPS3 then
		card.codtv:processEvent( {
			name = "store_purchase_confirmation",
			controller = event.controller
		} )
	else
		Engine.ExecNow( event.controller, "downloadSelectedOffer " .. card.fileData.offerid .. " " .. card.fileData.storeContentType )
	end
end

CoD.Codtv.DWContentCardSelected = function ( card, event )
	if card.codtv.m_rootRef == "ingamestore" then
		CoD.Codtv.IngameStoreSelectButtonPressed( card, event )
	elseif card.codtv.m_rootRef == "emblems" and card.emblemDownloaded == true then
		CoD.Codtv.DWFolderCardEmblemSelected( card, event )
	elseif card.codtv.m_rootRef == "leagueidentity" then
		CoD.Codtv.DWFolderCardLeagueIDSelected( card, event )
	elseif card.codtv.m_rootRef == "combatrecord" then
		local fileId = card.fileData.fileID
		local fileSize = card.fileData.summarySize
		local fileName = card.fileData.name
		Engine.SetCombatRecordScreenshotInfo( event.controller, fileId, fileSize, fileName )
		card:dispatchEventToParent( {
			name = "button_prompt_back",
			controller = event.controller
		} )
	elseif card.fileData.category == "customgame" then
		if Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
			if Engine.GameHost() then
				Engine.DownloadGameSettings( event.controller, card.fileData.fileID, card.fileData.gameType )
				Dvar.fshCustomGameName:set( card.fileData.name )
				card.codtv:setPreviousMenu( nil )
				card.codtv:goBack( event.controller )
			else
				Dvar.ui_errorTitle:set( Engine.Localize( "MENU_NOTICE_CAPS" ) )
				Dvar.ui_errorMessage:set( Engine.Localize( "MENU_FILESHARE_ONLY_HOST_ALLOWED_TO_LOAD" ) )
				CoD.Menu.OpenErrorPopup( card.codtv, event )
			end
		else
			local userInfo = {
				fileID = card.fileData.fileID,
				gameType = card.fileData.gameType,
				fileName = card.fileData.name
			}
			card.codtv:openPopup( "LoadCustomGames", event.controller, userInfo )
		end
	elseif card.fileData.category ~= "emblem" and card ~= nil and card.fileData ~= nil and card.fileData.fileID ~= nil and card.fileData.fileID ~= "0" then
		local menu = card.cardCarousel.cardCarouselList:getParent()
		local authorXUID = card.fileData.authorXUID
		if card.fileData.authorXUID == nil then
			authorXUID = Engine.DefaultID64Value()
		end
		local fileName = "film.demo"
		local info = {
			controller = event.controller,
			fileID = card.fileData.fileID,
			category = card.fileData.category,
			fileSize = card.fileData.fileSize,
			map = card.fileData.map,
			matchID = card.fileData.matchID,
			zmmapstartloc = card.fileData.zmMapStartLoc,
			gametype = card.fileData.gameType,
			authorXUID = authorXUID,
			duration = card.fileData.durationInt,
			isPooled = card.fileData.isPooled,
			fileName = fileName,
			description = card.fileData.description,
			mainMode = card.fileData.mainMode,
			isLiveStream = card.fileData.isLiveStream,
			demoMode = "",
			isMetaDataValid = card.fileData.isMetaDataValid,
			targetCarousel = card.cardCarousel.cardCarouselList
		}
		CoD.perController[event.controller].fileActionInfo = card.fileData
		CoD.FileAction.Open( menu, info )
	end
end

CoD.Codtv.InGameStoreUpdateAButtonPromptString = function ( card, event )
	if card.fileData.category == "ingamestore" and not CoD.isPS3 then
		local isOfferPurchased = Engine.IsOfferPurchased( event.controller, card.fileData.offerid, card.fileData.storeContentType )
		if isOfferPurchased ~= nil and isOfferPurchased == 1 then
			card.codtv.selectButton:setText( Engine.Localize( "MENU_STORE_DOWNLOAD" ) )
		else
			card.codtv.selectButton:setText( Engine.Localize( "MENU_STORE_BUY" ) )
		end
	end
end

CoD.Codtv.DWContentCardGainFocus = function ( card, event )
	if card.cardName ~= nil then
		card.cardName:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	end
	if card.durationText ~= nil then
		card.durationText:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	end
	if card.codtv ~= nil and card.fileData ~= nil then
		CoD.Codtv.ShowFileInfoPanel( card )
	end
	card.codtv.rightButtonPromptBar:removeAllChildren()
	card.codtv.leftButtonPromptBar:removeAllChildren()
	card.codtv:addBackButton()
	if CoD.isPC and event.controller == nil then
		event.controller = card.codtv.m_ownerController
	end
	if CoD.Codtv.DWContentCardCanVote( card, event ) and card.codtv.voteButtonPrompt then
		card.codtv:addRightButtonPrompt( card.codtv.voteButtonPrompt )
	end
	if CoD.Codtv.DWContentCardCanSave( card ) and card.codtv.saveButtonPrompt then
		card.codtv:addRightButtonPrompt( card.codtv.saveButtonPrompt )
	end
	if CoD.Codtv.DWContentCardCanReport( card, event ) and card.codtv.reportButtonPrompt then
		card.codtv:addRightButtonPrompt( card.codtv.reportButtonPrompt )
	end
	if card.fileData ~= nil then
		if card.codtv.m_rootRef == "emblems" or card.codtv.m_rootRef == "leagueidentity" or card.fileData.category ~= "emblem" then
			card.codtv:addSelectButton()
		end
		CoD.Codtv.InGameStoreUpdateAButtonPromptString( card, event )
		if card.fileData.category == "customgame" and card.fileData.gameType ~= nil then
			card.mapImage:setLeftRight( false, false, -80, 80 )
			card.mapImage:setTopBottom( false, false, -80, 80 )
		end
		if card.fileData.category == "emblem" and card.codtv.m_rootRef == "emblems" then
			card.codtv:addRightButtonPrompt( card.codtv.emblemOptionsPrompt )
			card.codtv.hintText:updateHintText( Engine.Localize( "MENU_DEFAULT_EMBLEM_DESCRIPTION" ) )
		end
	end
end

CoD.Codtv.DWContentCardLoseFocus = function ( card, event )
	if card.cardName ~= nil then
		card.cardName:setRGB( 1, 1, 1 )
	end
	if card.durationText ~= nil then
		card.durationText:setRGB( 1, 1, 1 )
	end
	card.codtv.rightButtonPromptBar:removeAllChildren()
	card.codtv.leftButtonPromptBar:removeAllChildren()
	card.codtv:addBackButton()
	if card.fileData ~= nil and card.fileData.category == "customgame" and card.fileData.gameType ~= nil then
		card.mapImage:setLeftRight( false, false, -50, 50 )
		card.mapImage:setTopBottom( false, false, -50, 50 )
	end
end

CoD.Codtv.DWContentCardSummaryDownloaded = function ( card, event )
	if not card:isInFocus() then
		return 
	elseif card.fileData.category == "film" then
		card.codtv.infoPanel:showSummary( event )
		return 
	elseif card.fileData.category ~= "clip" and card.fileData.category ~= "screenshot" then
		return 
	elseif not event.isValid then
		card.mapImage:setupUIImage()
	end
end

CoD.Codtv.IngameStoreContentCardLoad = function ( card, data, controller )
	if card.fileData.fileID ~= "0" then
		card.mapImage = LUI.UIImage.new()
		card.mapImage:setLeftRight( true, true, 2, -2 )
		card.mapImage:setTopBottom( true, true, 2, -CoD.textSize.ExtraSmall - 4 )
		card:addElement( card.mapImage )
	end
	card.cardNameContainer = LUI.UIElement.new()
	card.cardNameContainer:setUseStencil( true )
	card.cardNameContainer:setLeftRight( true, true, 5, 0 )
	card.cardNameContainer:setTopBottom( false, true, -CoD.textSize.ExtraSmall - 2, -2 )
	card:addElement( card.cardNameContainer )
	card.cardName = LUI.UIText.new()
	card.cardName:setLeftRight( true, true, 0, 0 )
	card.cardName:setTopBottom( true, true, 0, 0 )
	card.cardName:setFont( CoD.fonts.ExtraSmall )
	card.cardName:setAlignment( LUI.Alignment.Left )
	card.cardName:setText( card.fileData.name )
	card.cardName:setRGB( CoD.orange.r, CoD.orange.g, CoD.orange.b )
	card.cardNameContainer:addElement( card.cardName )
	if not card:isInFocus() then
		card.cardName:setRGB( 1, 1, 1 )
	end
end

CoD.Codtv.DWContentCardLoad = function ( card, data, controller )
	if data == nil then
		data = {}
	end
	card.text:setText( "" )
	card.fileData = data
	if (card.fileData.fileID == nil or card.fileData.fileID == "0") and card.fileData.category ~= "ingamestore" then
		card.fileData.fileID = "0"
		card.fileData.name = Engine.Localize( "MENU_ERROR" )
		card.fileData.description = Engine.Localize( "MENU_ERROR" )
	end
	if card.fileData.durationInt == nil then
		card.fileData.durationInt = 0
	end
	if card.fileData.matchID == nil then
		card.fileData.matchID = Engine.DefaultID64Value()
	end
	if card.fileData.name == nil or card.fileData.name == "" then
		if data.gameTypeName ~= nil then
			card.fileData.name = data.gameTypeName
		else
			card.fileData.name = ""
		end
	end
	if card.fileData.category ~= nil and card.fileData.category == "ingamestore" then
		CoD.Codtv.IngameStoreContentCardLoad( card, data, controller )
		return 
	elseif card.fileData.description == nil or card.fileData.description == "" then
		if card.fileData.category == "customgame" then
			card.fileData.description = ""
		elseif card.fileData.category ~= "emblem" then
			if not CoD.isZombie then
				if data.mapName == nil then
					data.mapName = "PRESENCE_UNKNOWN_MAP"
				end
				card.fileData.description = Engine.Localize( "MENU_FILESHARE_GAMEONMAP", data.gameTypeName, Engine.Localize( "PRESENCE_UNKNOWN_MAP" ) )
			else
				local gameType = card.fileData.gameType
				if CoD.isZombie == true and gameType == CoD.Zombie.GAMETYPE_ZCLASSIC then
					card.fileData.description = ""
				else
					card.fileData.description = data.gameTypeName
					card.fileData.description = Engine.Localize( "MENU_FILESHARE_GAMEONMAP", card.fileData.description, data.zmMapStartLocName )
				end
			end
		else
			card.fileData.description = ""
		end
	end
	if card.fileData.fileID ~= "0" then
		local mapImageElement = LUI.UIElement.new()
		mapImageElement:setLeftRight( true, true, 2, -2 )
		mapImageElement:setTopBottom( true, true, 2, -CoD.textSize.ExtraSmall - 4 )
		card:addElement( mapImageElement )
		card.mapImage = LUI.UIImage.new()
		if card.fileData.category == "emblem" then
			card.mapImage:close()
			local emblemCardHeight = 100
			local emblemCardWidth = 100
			local sizeMultiplier = 1.9
			card:setupCenterImage( nil, emblemCardWidth, emblemCardHeight, sizeMultiplier )
			card.mapImage = card.centerImageContainer.centerImage
		else
			card.mapImage:setLeftRight( true, true, 2, -2 )
			card.mapImage:setTopBottom( true, true, 2, -CoD.textSize.ExtraSmall - 4 )
		end
		local thumbImage = nil
		if not CoD.isZombie then
			if card.fileData.category == "customgame" and card.fileData.gameType ~= nil then
				thumbImage = RegisterMaterial( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", card.fileData.gameType, "image" ) )
				card.mapImage:setLeftRight( false, false, -50, 50 )
				card.mapImage:setTopBottom( false, false, -50, 50 )
			elseif card.fileData.map ~= nil then
				thumbImage = RegisterMaterial( "menu_" .. card.fileData.map .. "_map_select_final" )
			end
		elseif card.fileData.zmMapStartLoc and card.fileData.zmMapStartLoc ~= "default" then
			local gameType = card.fileData.gameType
			local gameTypeGroup = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gameType, "groupname" )
			thumbImage = RegisterMaterial( "menu_" .. CoD.Zombie.GetMapName( card.fileData.map ) .. "_" .. gameTypeGroup .. "_" .. card.fileData.zmMapStartLoc )
			card.mapImage:setRGB( 1, 1, 1 )
		else
			card.mapImage:setRGB( 0, 0, 0 )
			card.mapImage:setAlpha( 0.1 )
		end
		if thumbImage ~= nil then
			card.mapImage:setImage( thumbImage )
		end
		if not card.mapImage:getParent() then
			card:addElement( card.mapImage )
		end
		if card.fileData.category ~= "screenshot" and card.fileData.category ~= "emblem" and card.fileData.category ~= "customgame" then
			local durationBacking = LUI.UIImage.new()
			durationBacking:setLeftRight( false, true, -55, -8 )
			durationBacking:setTopBottom( true, false, 5, 5 + CoD.textSize.ExtraSmall )
			durationBacking:setRGB( 0, 0, 0 )
			durationBacking:setAlpha( 0.8 )
			card:addElement( durationBacking )
			card.durationText = LUI.UIText.new()
			card.durationText:setLeftRight( false, true, -55, -8 )
			card.durationText:setTopBottom( true, false, 5, 5 + CoD.textSize.ExtraSmall )
			card.durationText:setFont( CoD.fonts.ExtraSmall )
			card.durationText:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
			card.durationText:setAlignment( LUI.Alignment.Center )
			card:addElement( card.durationText )
			if card.fileData.duration ~= nil then
				card.durationText:setText( card.fileData.duration )
			end
		end
		local fileId, fileSize, fileName = Engine.GetCombatRecordScreenshotInfo( controller, Engine.GetXUID64( controller ) )
		if not (card.fileData.category ~= "film" or card.fileData.bookmarked ~= true) or not (card.fileData.category ~= "film" or card.fileData.isLiveStream ~= true) or card.fileData.category == "screenshot" and card.fileData.fileID == fileId then
			card.bookmark = LUI.UIImage.new()
			card.bookmark:setLeftRight( true, false, 5, 37 )
			card.bookmark:setTopBottom( true, false, 5, 37 )
			card.bookmark:setImage( RegisterMaterial( "menu_mp_star_rating" ) )
			if card.fileData.isLiveStream == true then
				if card.fileData.isMetaDataValid == true then
					card.bookmark:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
				else
					card.bookmark:setRGB( CoD.green.r, CoD.green.g, CoD.green.b )
				end
			else
				card.bookmark:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
			end
			card.bookmark:setAlpha( 1 )
			card:addElement( card.bookmark )
		end
	end
	card.cardNameContainer = LUI.UIElement.new()
	card.cardNameContainer:setUseStencil( true )
	card.cardNameContainer:setLeftRight( true, true, 5, 0 )
	card.cardNameContainer:setTopBottom( false, true, -CoD.textSize.ExtraSmall - 2, -2 )
	card:addElement( card.cardNameContainer )
	card.cardName = LUI.UIText.new()
	card.cardName:setLeftRight( true, true, 0, 0 )
	card.cardName:setTopBottom( true, true, 0, 0 )
	card.cardName:setFont( CoD.fonts.ExtraSmall )
	card.cardName:setAlignment( LUI.Alignment.Left )
	if true == Dvar.fshFileDebug:get() then
		local filename = card.fileData.fileID
		if card.fileData.originID ~= nil then
			filename = filename .. " / " .. card.fileData.originID
		end
		card.cardName:setText( filename )
	else
		card.cardName:setText( card.fileData.name )
	end
	card.cardName:setRGB( CoD.orange.r, CoD.orange.g, CoD.orange.b )
	card.cardNameContainer:addElement( card.cardName )
	if not card:isInFocus() then
		card.cardName:setRGB( 1, 1, 1 )
		if card.durationText ~= nil then
			card.durationText:setRGB( 1, 1, 1 )
		end
	end
end

CoD.Codtv.UpdateIngameStorePurchaseElement = function ( card, event )
	local isOfferPurchased = Engine.IsOfferPurchased( event.controller, card.fileData.offerid, card.fileData.storeContentType )
	if isOfferPurchased ~= nil then
		card.fileData.isOfferPurchased = isOfferPurchased
		if card:isInFocus() then
			CoD.Codtv.ShowIngameStorePanel( card )
			CoD.Codtv.InGameStoreUpdateAButtonPromptString( card, event )
		end
	end
end

CoD.Codtv.ReloadInGameStoreMenu = function ( card, event )
	if card:isInFocus() then
		card.codtv:reload( card.codtv.m_rootFolderIndex )
	end
end

CoD.Codtv.EmblemDownloaded = function ( card, event )
	if card.fileData.fileID == event.fileID then
		card.emblemDownloaded = true
	end
end

CoD.Codtv.DWContentCardsCreate = function ( carousel, event, folderIndex )
	if carousel ~= nil then
		if event.numresults > CoD.Codtv.CardsPerPage then
			event.numresults = CoD.Codtv.CardsPerPage
		end
		for i = 1, event.numresults, 1 do
			local card = CoD.Codtv.GetGenericCard( carousel )
			card.type = "dwcontent"
			card.folderIndex = folderIndex
			CoD.Codtv.DWContentCardLoad( card, event[i], event.controller )
			if card.fileData.category == "ingamestore" then
				card:registerEventHandler( "refresh_offers_data", CoD.Codtv.UpdateIngameStorePurchaseElement )
				card:registerEventHandler( "reload_store_menu", CoD.Codtv.ReloadInGameStoreMenu )
			end
			if card.fileData.category == "emblem" then
				card:registerEventHandler( "emblemDownloaded", CoD.Codtv.EmblemDownloaded )
				card.text:setText( Engine.Localize( "MENU_EMBLEM_DEFAULT_TITLE" ) )
			end
			card:registerEventHandler( "card_load_content", CoD.Codtv.DWContentCardLoad )
			card:registerEventHandler( "card_vote", CoD.Codtv.DWContentCardVote )
			card:registerEventHandler( "card_report", CoD.Codtv.DWContentCardReport )
			card:registerEventHandler( "card_save", CoD.Codtv.DWContentCardSave )
			card:registerEventHandler( "fileshare_summary_downloaded", CoD.Codtv.DWContentCardSummaryDownloaded )
		end
	end
end

CoD.Codtv.DWFolderCardAddNextPrev = function ( carousel, src, folderIndex, startIndex, type, text )
	local card = CoD.Codtv.GetGenericCard( carousel )
	card.bg:close()
	card.text:close()
	card.border:close()
	card.disableGrowShrink = true
	local container = LUI.UIElement.new()
	container:setTopBottom( true, false, 12, 72 )
	container:setUseStencil( true )
	card:addElement( container )
	local arrowBg = LUI.UIImage.new()
	arrowBg:setImage( RegisterMaterial( "menu_next_prev_arrow" ) )
	arrowBg:setTopBottom( true, true, 0, 0 )
	arrowBg:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	arrowBg:setAlpha( 0 )
	card.arrowBg = arrowBg
	container:addElement( arrowBg )
	local arrow = LUI.UIImage.new()
	arrow:setImage( RegisterMaterial( "menu_next_prev_arrow_black" ) )
	arrow:setTopBottom( true, true, 2, -2 )
	card.arrow = arrow
	container:addElement( arrow )
	local arrowText = LUI.UIText.new()
	arrowText:setLeftRight( true, true, 10, -10 )
	arrowText:setTopBottom( true, false, 22, 22 + CoD.textSize.Default )
	arrowText:setText( text )
	arrowText:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	card.arrowText = arrowText
	container:addElement( arrowText )
	card.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	card.spinner:setTopBottom( true, false, 80, 144 )
	card.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	card.spinner:setAlpha( 0 )
	card:addElement( card.spinner )
	if type == "dwfolder_prev" then
		container:setLeftRight( false, true, -146, -20 )
		card.spinner:setLeftRight( false, true, -89, -25 )
		arrowText:setAlignment( LUI.Alignment.Right )
		arrow:setLeftRight( false, true, 0, -128 )
		arrowBg:setLeftRight( false, true, 0, -128 )
	else
		container:setLeftRight( true, false, 10, 136 )
		card.spinner:setLeftRight( true, false, 25, 89 )
		arrowText:setAlignment( LUI.Alignment.Left )
		arrow:setLeftRight( true, false, 0, 128 )
		arrowBg:setLeftRight( true, false, 0, 128 )
	end
	card.type = type
	card.folderIndex = folderIndex
	card.startIndex = startIndex
	card:registerEventHandler( "fileshare_search_complete", CoD.Codtv.DWFolderCardSearchCompleted )
end

CoD.Codtv.DWFolderCardNextPrevSelected = function ( card, event )
	card.spinner:setAlpha( 1 )
	card.m_dataRequested = true
	Engine.LoadCodtvDWContent( card.codtv.m_ownerController, card.folderIndex, card.startIndex, card.codtv.userData )
end

CoD.Codtv.DWFolderCardNextPrevGainFocus = function ( card, event )
	card.arrowBg:setAlpha( 1 )
	card.arrowText:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	if card.type == "dwfolder_prev" then
		card.arrow:setLeftRight( false, true, -2, -126 )
	else
		card.arrow:setLeftRight( true, false, 2, 126 )
	end
	card.disableGrowShrink = true
end

CoD.Codtv.DWFolderCardNextPrevLoseFocus = function ( card, event )
	card.arrowBg:setAlpha( 0 )
	card.arrowText:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	if card.type == "dwfolder_prev" then
		card.arrow:setLeftRight( false, true, 0, -128 )
	else
		card.arrow:setLeftRight( true, false, 0, 128 )
	end
	card.disableGrowShrink = true
end

CoD.Codtv.SetupDWCardNoData = function ( card )
	if card == nil then
		return 
	elseif card.text ~= nil then
		card.text:setText( Engine.Localize( "MENU_NO_DATA" ) )
	end
	if card.spinner ~= nil then
		card.spinner:setAlpha( 0 )
	end
	if card.codtv ~= nil and card.codtv.hintText ~= nil then
		if card.codtv.m_rootRef == "ingamestore" then
			card.codtv.hintText:updateHintText( Engine.Localize( "MENU_STORE_EMPTY" ) )
		else
			card.codtv.hintText:updateHintText( Engine.Localize( "MENU_CODTV_FOLDER_EMPTY_HINT" ) )
		end
	end
	if card.textBackground ~= nil then
		card.textBackground:show()
	end
end

CoD.Codtv.SetCardIndexForMTXCarousel = function ( card, event )
	if CoD.isPS3 == true and card.codtv.m_rootRef == "ingamestore" then
		local mtxid = Engine.DvarInt( nil, "ui_mtxid" )
		if mtxid ~= CoD.Codtv.INVALID_MTX_ID then
			local index = Engine.GetPS3MTXProductIndex( mtxid )
			if CoD.Codtv.CardsPerPage <= event.startIndex + index then
				card.startIndex = index
				event.startIndex = index
				card.isItemOnFirstPage = false
				Engine.LoadCodtvDWContent( card.codtv.m_ownerController, card.folderIndex, card.startIndex, card.codtv.userData )
				Engine.SetDvar( "ui_mtxid", CoD.Codtv.INVALID_MTX_ID )
				return false
			end
			card.cardCarousel.horizontalList.m_currentCardIndex = index + 1
			Engine.SetDvar( "ui_mtxid", CoD.Codtv.INVALID_MTX_ID )
		end
	end
	return true
end

CoD.Codtv.DWFolderCardSearchCompleted = function ( card, event )
	if card.folderIndex == event.contextid and card.m_dataRequested == true then
		if event.numresults == 0 then
			CoD.Codtv.SetupDWCardNoData( card )
		else
			if CoD.Codtv.SetCardIndexForMTXCarousel( card, event ) == false then
				return 
			end
			local carousel = card.cardCarousel
			local folderIndex = card.folderIndex
			carousel:clearAllItems()
			Engine.Exec( card.codtv.m_ownerController, "resetThumbnailViewer" )
			if event.startIndex > 0 then
				local previousStartIndex = event.startIndex - CoD.Codtv.CardsPerPage
				if previousStartIndex < 0 then
					previousStartIndex = 0
				end
				CoD.Codtv.DWFolderCardAddNextPrev( carousel, card.src, card.folderIndex, previousStartIndex, "dwfolder_prev", Engine.Localize( "MENU_PREVIOUS" ) )
			end
			if event.numresults > 0 then
				CoD.Codtv.DWContentCardsCreate( carousel, event, folderIndex )
			end
			local endIndex = event.startIndex + event.numresults
			local filesRemaining = event.totalFiles - endIndex
			if filesRemaining > 0 then
				CoD.Codtv.DWFolderCardAddNextPrev( carousel, card.src, card.folderIndex, endIndex, "dwfolder_next", Engine.Localize( "MENU_NEXT" ) )
			end
			if card.type == "dwfolder_next" then
				carousel.horizontalList.m_currentCardIndex = 1
			elseif card.type == "dwfolder_prev" then
				carousel.horizontalList.m_currentCardIndex = #carousel.horizontalList.cards
			elseif card.type == "dwfolder" and card.isItemOnFirstPage ~= nil and card.isItemOnFirstPage == false then
				carousel.horizontalList.m_currentCardIndex = 2
				card.isItemOnFirstPage = nil
			end
			carousel.cardCarouselList:focusCurrentCardCarousel( event.controller )
		end
	end
end

CoD.Codtv.DWFolderCardSelected = function ( card, event )
	
end

CoD.Codtv.DWFolderCardGainFocus = function ( card, event )
	card.codtv.rightButtonPromptBar:removeAllChildren()
	card.codtv.leftButtonPromptBar:removeAllChildren()
	card.codtv:addBackButton()
	card.text:setText( "" )
	card.spinner:setAlpha( 1 )
	card.textBackground:hide()
end

CoD.Codtv.DWFolderCardLoseFocus = function ( card, event )
	
end

CoD.Codtv.DWFolderCardsLoad = function ( carousel, data, folderIndex )
	local card = CoD.Codtv.GetGenericCard( carousel )
	card.text:setText( "" )
	card.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	card.spinner:setLeftRight( false, false, -32, 32 )
	card.spinner:setTopBottom( false, false, -32, 32 )
	card.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	card.spinner:setAlpha( 1 )
	card:addElement( card.spinner )
	card.textBackground = LUI.UIImage.new( {
		material = RegisterMaterial( "menu_theater_nodata" )
	} )
	card.textBackground:setLeftRight( false, false, -64, 64 )
	card.textBackground:setTopBottom( false, false, -64, 64 )
	card.textBackground:setAlpha( 1 )
	card.textBackground:setPriority( -100 )
	card:addElement( card.textBackground )
	card.textBackground:hide()
	card.type = "dwfolder"
	card.folderIndex = folderIndex
	card:registerEventHandler( "fileshare_search_complete", CoD.Codtv.DWFolderCardSearchCompleted )
end

CoD.Codtv.CustomButtonFileManagerSelected = function ( card, event )
	card.codtv:openPopup( "FileshareManager", event.controller )
end

CoD.Codtv.CustomButtonNewEmblemSelected = function ( card, event )
	if card.codtv.m_emblemSlotsRemaining > 0 and card.codtv.m_embemNextSlot ~= nil then
		card.codtv.m_previousFolderIndex = nil
		if Engine.IsFeatureBanned( CoD.FEATURE_BAN_EMBLEM_EDITOR ) then
			Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_EMBLEM_EDITOR )
			return 
		end
		CoD.perController[event.controller].emblemSaveSlot = card.codtv.m_embemNextSlot
		CoD.perController[event.controller].emblemFileID = nil
		CoD.Codtv.Shutdown()
		card.codtv:close()
	end
end

CoD.Codtv.CustomButtonBuyStorageSelected = function ( card, event )
	if Engine.IsGuest( event.controller ) then
		card:dispatchEventToParent( {
			name = "open_no_guest_mtx",
			controller = event.controller
		} )
	elseif CoD.isPS3 then
		card:dispatchEventToParent( {
			name = "open_mtx_purchase",
			controller = event.controller,
			userData = {
				mtxName = Dvar.fshMtxName:get(),
				openingMenuName = "codtv"
			}
		} )
	else
		Engine.SetStartCheckoutTimestampUTC()
		Engine.PurchaseMTX( event.controller, Dvar.fshMtxName:get(), "codtv" )
	end
end

CoD.Codtv.CustomButtonCardSelected = function ( card, event )
	if card.customAction ~= nil then
		if card.customAction == "filemanager" then
			CoD.Codtv.CustomButtonFileManagerSelected( card, event )
		elseif card.customAction == "newemblem" then
			CoD.Codtv.CustomButtonNewEmblemSelected( card, event )
		elseif card.customAction == "buystorage" then
			CoD.Codtv.CustomButtonBuyStorageSelected( card, event )
		end
	end
end

CoD.Codtv.CustomButtonNewEmblemGainFocus = function ( card, event )
	card.codtv.rightButtonPromptBar:removeAllChildren()
	card.codtv.leftButtonPromptBar:removeAllChildren()
	card.codtv:addBackButton()
	if card.codtv.m_emblemSlotsOccupied ~= nil and card.codtv.m_emblemSlotsRemaining ~= nil then
		local totalSlots = card.codtv.m_emblemSlotsOccupied + card.codtv.m_emblemSlotsRemaining
		if card.codtv.m_emblemSlotsRemaining > 0 then
			card.codtv.hintText:updateHintText( Engine.Localize( "MENU_NEW_EMBLEM_HINT_SLOTS", card.codtv.m_emblemSlotsOccupied, totalSlots ) )
			card.codtv:addSelectButton()
		elseif CoD.FileshareManager.ShouldShowMtx( event.controller ) then
			card.codtv.hintText:updateHintText( Engine.Localize( "MENU_NEW_EMBLEM_HINT_FULL_MTX", card.codtv.m_emblemSlotsOccupied, totalSlots ) )
			local red = {
				r = CoD.red.r,
				g = CoD.red.g,
				b = CoD.red.b,
				a = 1
			}
			card.codtv.hintText:updateHintColor( red )
		else
			card.codtv.hintText:updateHintText( Engine.Localize( "MENU_NEW_EMBLEM_HINT_FULL", card.codtv.m_emblemSlotsOccupied, totalSlots ) )
			local red = {
				r = CoD.red.r,
				g = CoD.red.g,
				b = CoD.red.b,
				a = 1
			}
			card.codtv.hintText:updateHintColor( red )
		end
	else
		card.codtv.hintText:updateHintText( Engine.Localize( "MENU_NEW_EMBLEM_HINT" ) )
		card.codtv:addSelectButton()
	end
end

CoD.Codtv.CustomButtonBuyStorageGainFocus = function ( card, event )
	card.codtv.hintText:updateHintText( Engine.Localize( "MENU_MTX_MEDIA_STORAGE_DESC" ) )
	card.codtv.rightButtonPromptBar:removeAllChildren()
	card.codtv.leftButtonPromptBar:removeAllChildren()
	card.codtv:addBackButton()
	card.codtv:addSelectButton()
end

CoD.Codtv.CustomButtonGainFocus = function ( card, event )
	if card.customAction ~= nil then
		if card.customAction == "newemblem" then
			CoD.Codtv.CustomButtonNewEmblemGainFocus( card, event )
		elseif card.customAction == "buystorage" then
			CoD.Codtv.CustomButtonBuyStorageGainFocus( card, event )
		end
	end
end

CoD.Codtv.PlayTimer = nil
CoD.Codtv.VideoCardPlay = function ( element, event )
	if CoD.Codtv.WebMPlayback ~= nil and Engine.WebM_IsBuffered( CoD.Codtv.WebMPlayback ) then
		Engine.WebM_Play( CoD.Codtv.WebMPlayback )
		element.webmVideo:setAlpha( 1 )
		if element.webmImage ~= nil then
			element.webmImage:setAlpha( 0 )
		end
		Engine.PlayMenuMusic( "" )
	else
		if CoD.Codtv.PlayTimer ~= nil then
			CoD.Codtv.PlayTimer:close()
			CoD.Codtv.PlayTimer = nil
		end
		element:registerEventHandler( "webm_video_play", CoD.Codtv.VideoCardPlay )
		CoD.Codtv.PlayTimer = LUI.UITimer.new( 250, "webm_video_play", true )
		element:addElement( CoD.Codtv.PlayTimer )
	end
end

CoD.Codtv.VideoCardClearPlayback = function ( element )
	if element ~= nil then
		element.webmVideo:setAlpha( 0 )
		if element.webmImage ~= nil then
			element.webmImage:setAlpha( 1 )
		end
	end
	if nil ~= CoD.Codtv.WebMPlayback then
		Engine.WebM_Close( CoD.Codtv.WebMPlayback )
		CoD.Codtv.WebMPlayback = nil
	end
	if nil ~= CoD.Codtv.PlayTimer then
		CoD.Codtv.PlayTimer:close()
		CoD.Codtv.PlayTimer = nil
	end
	Engine.WebM_Clear( CoD.Codtv.WebMPlaybackMaterial )
	Engine.PlayMenuMusic( "mus_mp_frontend" )
end

CoD.Codtv.VideoCardAutoPlay = function ( card, event )
	if card:isInFocus() and card.url ~= "" and card.m_thumbnailReady == true then
		CoD.Codtv.VideoCardClearPlayback()
		CoD.Codtv.WebMPlayback = Engine.WebM_Open( card.url .. "_low.webm", CoD.Codtv.WebMPlaybackMaterial )
		CoD.Codtv.VideoCardPlay( card )
	end
end

CoD.Codtv.VideoCardDownloadThumbnailCheck = function ( card, event )
	if card.thumbnailDownloadTimer then
		card.thumbnailDownloadTimer:close()
		card.thumbnailDownloadTimer = nil
	end
	if card.m_webmThumbIndex ~= nil and Engine.Url_Load_IsDone( card.m_webmThumbIndex ) then
		card.spinner:setAlpha( 0 )
		card.webmImage:setAlpha( 1 )
		card.m_thumbnailReady = true
	else
		card.thumbnailDownloadTimer = LUI.UITimer.new( CoD.Codtv.ThumbnailDownloadCheckInterval, "download_thumbnail_check", true )
		card:addElement( card.thumbnailDownloadTimer )
	end
end

CoD.Codtv.VideoCardSelected = function ( card, event )
	local bandwidth = Engine.Url_Load_MeasureDownloadBandwidth( "akamai://rand.bin" )
	if string.sub( card.url, -2, -2 ) == "_" or bandwidth ~= -1 then
		if card.autoPlayTimer ~= nil then
			card.autoPlayTimer:close()
			card.autoPlayTimer = nil
		end
		CoD.Codtv.VideoCardClearPlayback()
		card.webmVideo:setAlpha( 0 )
		card.webmImage:setAlpha( 1 )
		local url = card.url .. "_low.webm"
		local platform = "ps3"
		if CoD.isXBOX then
			platform = "xbox"
		end
		if bandwidth > 524288 then
			url = card.url .. "_" .. platform .. "_4.webm"
		elseif bandwidth > 393216 then
			url = card.url .. "_" .. platform .. "_3.webm"
		elseif bandwidth > 262144 then
			url = card.url .. "_" .. platform .. "_2.webm"
		elseif bandwidth > 131072 then
			url = card.url .. "_" .. platform .. "_1.webm"
		end
		if string.sub( card.url, -2, -2 ) == "_" then
			url = card.url .. ".webm"
		end
		CoD.Codtv.WebMPlayback = Engine.WebM_Open( url, CoD.Codtv.WebMPlaybackMaterial )
		local videoPlayer = card.codtv:openPopup( "Video_Player", event.controller )
		CoD.Codtv.VideoCardPlay( videoPlayer )
	end
end

CoD.Codtv.VideoCardGainFocus = function ( card, event )
	card.codtv.rightButtonPromptBar:removeAllChildren()
	card.codtv.leftButtonPromptBar:removeAllChildren()
	card.codtv:addBackButton()
	card.codtv:addSelectButton()
	card.autoPlayTimer = LUI.UITimer.new( CoD.Codtv.AutoPlayRetryDelay, "auto_play", true )
	card:addElement( card.autoPlayTimer )
end

CoD.Codtv.VideoCardLoseFocus = function ( card, event )
	if card.autoPlayTimer ~= nil then
		card.autoPlayTimer:close()
	end
	CoD.Codtv.VideoCardClearPlayback()
	card.webmVideo:setAlpha( 0 )
	if card.m_thumbnailReady then
		card.webmImage:setAlpha( 1 )
	else
		card.webmImage:setAlpha( 0 )
	end
	Engine.PlayMenuMusic( "mus_mp_frontend" )
end

CoD.Codtv.VideoCardsLoad = function ( carousel, data )
	if data.videoCount > CoD.Codtv.MaxWebMMaterials then
		data.videoCount = CoD.Codtv.MaxWebMMaterials
	end
	Engine.Url_Load_Init()
	Engine.Url_Load_MeasureDownloadBandwidth( "akamai://rand.bin" )
	Engine.Url_Load_Jpeg( "dummy://none", CoD.Codtv.WebMPlaybackMaterial )
	for i = 1, data.videoCount, 1 do
		local card = CoD.Codtv.GetGenericCard( carousel )
		card.text:setText( data[i].name )
		card.type = "video"
		card.url = data[i].url
		card.webmVideo = LUI.UIImage.new()
		card.webmVideo:setLeftRight( true, true, 2, -2 )
		card.webmVideo:setTopBottom( true, true, 2, -28 )
		card.webmVideo:setAlpha( 0 )
		card.webmVideo:setImage( RegisterMaterial( CoD.Codtv.WebMPlaybackMaterial ) )
		card:addElement( card.webmVideo )
		card.webmImage = LUI.UIImage.new()
		card.webmImage:setLeftRight( true, true, 2, -2 )
		card.webmImage:setTopBottom( true, true, 2, -28 )
		card.webmImage:setAlpha( 0 )
		card.spinner = LUI.UIImage.new( {
			shaderVector0 = {
				0,
				0,
				0,
				0
			}
		} )
		card.spinner:setLeftRight( false, false, -32, 32 )
		card.spinner:setTopBottom( false, false, -32, 32 )
		card.spinner:setImage( RegisterMaterial( "lui_loader" ) )
		card.spinner:setAlpha( 0 )
		card:addElement( card.spinner )
		card.spinner:setAlpha( 1 )
		local materialName = CoD.Codtv.WebMGetMaterial( i )
		if materialName ~= nil then
			card.webmImage:setImage( RegisterMaterial( materialName ) )
		end
		card:addElement( card.webmImage )
		card.m_webmThumbIndex = nil
		card.m_thumbnailReady = false
		card:registerEventHandler( "download_thumbnail_check", CoD.Codtv.VideoCardDownloadThumbnailCheck )
		card:registerEventHandler( "auto_play", CoD.Codtv.VideoCardAutoPlay )
	end
end

CoD.Codtv.IsStoreContentFetching = function ( card, event )
	local isfetchingDone = Engine.LoadCodtvDWContent( card.codtv.m_ownerController, card.folderIndex, card.offset, card.codtv.userData )
	if isfetchingDone then
		event.timer:close()
	end
end

CoD.Codtv.GetStoreContent = function ( card, offset )
	card:registerEventHandler( "fetching_store_content_done", CoD.Codtv.IsStoreContentFetching )
	card.offset = offset
	local timer = LUI.UITimer.new( 1000, "fetching_store_content_done", false )
	card:addElement( timer )
end

CoD.Codtv.CarouselGainFocus = function ( carouselHorizontalList, event )
	local firstCard = carouselHorizontalList.cards[1]
	if firstCard ~= nil then
		if firstCard.type == "video" then
			for i = 1, #carouselHorizontalList.cards, 1 do
				local card = carouselHorizontalList.cards[i]
				local materialName = CoD.Codtv.WebMGetMaterial( card.cardIndex )
				card.webmImage:setAlpha( 0 )
				card.m_thumbnailReady = false
				card.spinner:setAlpha( 1 )
				if materialName ~= nil then
					Engine.WebM_Clear( materialName )
					if card.url ~= "" then
						card.m_webmThumbIndex = Engine.Url_Load_Jpeg( card.url .. "_thumb.jpg", materialName )
						if card.thumbnailDownloadTimer ~= nil then
							card.thumbnailDownloadTimer:close()
						end
						card.thumbnailDownloadTimer = LUI.UITimer.new( CoD.Codtv.ThumbnailDownloadCheckInterval, "download_thumbnail_check", true )
						card:addElement( card.thumbnailDownloadTimer )
					end
				end
			end
		elseif firstCard.type == "dwfolder" then
			if firstCard.codtv.m_rootRef == "ingamestore" then
				CoD.Codtv.GetStoreContent( firstCard, 0 )
			else
				Engine.LoadCodtvDWContent( firstCard.codtv.m_ownerController, firstCard.folderIndex, 0, firstCard.codtv.userData )
			end
			firstCard.m_dataRequested = true
		else
			for i = 1, #carouselHorizontalList.cards, 1 do
				local card = carouselHorizontalList.cards[i]
				if card.type == "dwcontent" and card.fileData ~= nil and card.fileData.fileID ~= "0" then
					if card.fileData.category == "ingamestore" then
						card.mapImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_MOTD, card.fileData.fileID )
						Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_MOTD, card.fileData.fileID, 1 )
					end
					if card.fileData.summarySize > 0 and (card.fileData.category == "clip" or card.fileData.category == "screenshot") then
						card.mapImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, card.fileData.fileID )
						Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, card.fileData.fileID, card.fileData.summarySize )
					end
					if card.fileData.fileSize > 0 and card.fileData.category == "emblem" then
						card.mapImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_EMBLEM, card.fileData.fileID )
						if Engine.DvarBool( nil, "checkEmblemForRank" ) then
							Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_EMBLEM, card.fileData.fileID, card.fileData.fileSize, card.fileData.authorXuid )
						else
							Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_EMBLEM, card.fileData.fileID, card.fileData.fileSize )
						end
					end
					if card.mapImage ~= nil then
						card.mapImage:setupUIImage()
					end
				end
			end
		end
	end
	CoD.CardCarousel.HorizontalListGainFocus( carouselHorizontalList, event )
end

CoD.Codtv.CarouselLoseFocus = function ( carouselHorizontalList, event )
	local firstCard = carouselHorizontalList.cards[1]
	local lastCard = carouselHorizontalList.cards[#carouselHorizontalList.cards]
	if firstCard.type == "video" then
		for i = 1, #carouselHorizontalList.cards, 1 do
			local card = carouselHorizontalList.cards[i]
			card.webmImage:setAlpha( 0 )
			card.m_thumbnailReady = false
			card.spinner:setAlpha( 1 )
			if card.thumbnailDownloadTimer ~= nil then
				card.thumbnailDownloadTimer:close()
			end
			local materialName = CoD.Codtv.WebMGetMaterial( card.cardIndex )
			if materialName ~= nil then
				Engine.WebM_Clear( materialName )
			end
		end
	end
	if firstCard.type == "dwfolder_prev" then
		firstCard.m_dataRequested = false
		firstCard.spinner:setAlpha( 0 )
	end
	if lastCard.type == "dwfolder_next" then
		lastCard.m_dataRequested = false
		lastCard.spinner:setAlpha( 0 )
	end
	if firstCard.codtv.m_rootRef == "ingamestore" and CoD.isPS3 == true then
		local codtv = firstCard.codtv
		local focussedCarousel = codtv.m_cardCarouselList.cardCarousels[codtv.m_cardCarouselList.m_currentCardCarouselIndex]
		local folderIndex = firstCard.folderIndex
		focussedCarousel:clearAllItems()
		local data = Engine.GetCodtvContent( folderIndex )
		if data ~= nil and data.type == "dwfolder" then
			CoD.Codtv.DWFolderCardsLoad( focussedCarousel, data, folderIndex )
		end
	end
	CoD.CardCarousel.HorizontalListLoseFocus( carouselHorizontalList, event )
	Engine.Exec( event.controller, "fileshareAbortSummary" )
	Engine.Exec( event.controller, "resetThumbnailViewer" )
	Engine.PlayMenuMusic( "mus_mp_frontend" )
end

CoD.Codtv.CarouselSimulateMove = function ( carouselList, buttonName, controller )
	local carousel = carouselList.cardCarousels[carouselList.m_currentCardCarouselIndex]
	local oldCard = carousel.horizontalList.cards[carousel.horizontalList.m_currentCardIndex]
	carouselList:processEvent( {
		name = "gamepad_button",
		button = buttonName,
		controller = controller,
		down = true,
		immediate = true
	} )
	carouselList:processEvent( {
		name = "gamepad_button",
		button = buttonName,
		controller = controller,
		down = false,
		immediate = true
	} )
	local newCard = carousel.horizontalList.cards[carousel.horizontalList.m_currentCardIndex]
	CoD.perController[controller].fileActionInfo = newCard.fileData
end

CoD.Codtv.CarouselMoveNext = function ( carouselList, event )
	CoD.Codtv.CarouselSimulateMove( carouselList, "right", event.controller )
end

CoD.Codtv.CarouselMovePrev = function ( carouselList, event )
	CoD.Codtv.CarouselSimulateMove( carouselList, "left", event.controller )
end

CoD.Codtv.GetCarouselList = function ( codtv, codtvRoot )
	local controller = nil
	if codtv ~= nil then
		controller = codtv.m_ownerController
	end
	local hintTextParams = {
		hintTextLeft = 353,
		hintTextWidth = 510,
		hintTextTop = -32
	}
	local carouselList = CoD.CardCarouselList.new( nil, controller, CoD.Codtv.ItemWidth, CoD.Codtv.ItemHeight, CoD.Codtv.HighlightedItemWidth, CoD.Codtv.HighligtedItemHeight, hintTextParams )
	local top = CoD.textSize.Big + 10
	carouselList:setLeftRight( true, true, 0, 0 )
	carouselList:setTopBottom( true, true, top, 0 )
	carouselList.titleListContainer.spacing = 0
	local titleListContainerDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = -CoD.CoD9Button.Height,
		topAnchor = true,
		bottomAnchor = false,
		top = carouselList.cardCarouselSize + 90,
		bottom = 0
	}
	carouselList.titleListContainer:registerAnimationState( "default", titleListContainerDefaultAnimState )
	carouselList.titleListContainer:animateToState( "default" )
	carouselList:registerEventHandler( "move_next", CoD.Codtv.CarouselMoveNext )
	carouselList:registerEventHandler( "move_prev", CoD.Codtv.CarouselMovePrev )
	if codtv ~= nil then
		for i = 1, codtvRoot.subfolderCount, 1 do
			if codtvRoot[i] ~= nil then
				local name = codtvRoot[i].name
				local folderIndex = codtvRoot[i].folderIndex
				local data = Engine.GetCodtvContent( folderIndex )
				local carousel = carouselList:addCardCarousel( Engine.ToUpper( name ) )
				carousel.codtv = codtv
				if data ~= nil then
					if data.type == "folder" then
						CoD.Codtv.FolderCardsLoad( controller, carousel, data )
					elseif data.type == "videofolder" then
						CoD.Codtv.VideoCardsLoad( carousel, data )
					elseif data.type == "dwfolder" then
						CoD.Codtv.DWFolderCardsLoad( carousel, data, folderIndex )
					end
				end
				carousel.horizontalList:registerEventHandler( "gain_focus", CoD.Codtv.CarouselGainFocus )
				carousel.horizontalList:registerEventHandler( "lose_focus", CoD.Codtv.CarouselLoseFocus )
				local titleTop = carouselList.cardCarouselSize + 50
				local titleDefaultAnimState = {
					leftAnchor = true,
					rightAnchor = false,
					left = 0,
					right = 0,
					topAnchor = true,
					bottomAnchor = false,
					top = titleTop,
					bottom = titleTop + CoD.CardCarousel.TitleSize,
					font = CoD.fonts.Big
				}
				carousel.title:registerAnimationState( "default", titleDefaultAnimState )
				carousel.title:animateToState( "default" )
			end
		end
	end
	return carouselList
end

CoD.Codtv.Shutdown = function ()
	CoD.Codtv.WebMShutdown()
	Engine.Url_Load_Destroy()
end

CoD.Codtv.ReloadMenu = function ( codtv, folderIndex )
	CoD.Codtv.Shutdown()
	local codtvRoot = Engine.GetCodtvContent( folderIndex )
	if folderIndex == codtv.m_rootFolderIndex then
		codtv.m_previousFolderIndex = nil
	else
		codtv.m_previousFolderIndex = codtv.m_currentFolderIndex
	end
	codtv.m_currentFolderIndex = folderIndex
	codtv:setTitle( Engine.ToUpper( codtvRoot.name ) )
	if codtv.m_rootRef == "emblems" then
		local emblemCategoryID = Engine.TableLookup( nil, "mp/filesharecategories.csv", 0, "emblem", 2 )
		local emblemGroup = Engine.GetFileshareCategories( codtv.m_ownerController, "emblem" )
		codtv.m_emblemSlotsOccupied = emblemGroup[1].occupied
		codtv.m_emblemSlotsRemaining = emblemGroup[1].remaining
		codtv.m_embemNextSlot = Engine.GetFileshareNextSlot( codtv.m_ownerController, emblemCategoryID )
	end
	codtv.m_cardCarouselList:close()
	codtv.m_cardCarouselList = CoD.Codtv.GetCarouselList( codtv, codtvRoot )
	if codtv.m_carouselContext ~= nil and folderIndex == codtv.m_carouselContext.folderIndex then
		codtv.m_cardCarouselList:setInitialCarousel( codtv.m_carouselContext.carouselIndex, codtv.m_carouselContext.cardIndex )
		codtv.m_cardCarouselList:focusCurrentCardCarousel()
		codtv.m_carouselContext = nil
	end
	codtv.m_cardCarouselList:focusCurrentCardCarousel()
	codtv.rightButtonPromptBar:removeAllChildren()
	codtv:addElement( codtv.m_cardCarouselList )
end

CoD.Codtv.AnimateOutAndGoBack = function ( codtv )
	CoD.Codtv.Shutdown()
	if codtv.m_previousFolderIndex == nil then
		CoD.Menu.animateOutAndGoBack( codtv )
		Engine.PlayMenuMusic( "mus_mp_frontend" )
	else
		codtv:reload( codtv.m_previousFolderIndex )
		Engine.PlaySound( "cac_cmn_backout" )
	end
end

CoD.Codtv.GoBack = function ( codtv, controller )
	CoD.Codtv.Shutdown()
	Engine.PartyHostClearUIState()
	Engine.Exec( controller, "fileshareAbortSummary" )
	Engine.Exec( controller, "resetThumbnailViewer" )
	if Engine.DvarBool( nil, "tu5_checkStoreButtonPressed" ) then
		Dvar.ui_storeButtonPressed:set( false )
	end
	if codtv.m_rootRef == "ingamestore" then
		Engine.SetDvar( "ui_contextualMenuLocation", "store" )
		if CoD.isPS3 == true then
			Engine.SetDvar( "ui_mtxid", CoD.Codtv.INVALID_MTX_ID )
			Engine.Exec( controller, "terminateStore" )
		end
	end
	CoD.Menu.goBack( codtv, controller )
end

CoD.Codtv.WebMGetMaterial = function ( cardIndex )
	if 1 <= cardIndex and cardIndex <= CoD.Codtv.MaxWebMMaterials then
		return "webm_720p_" .. cardIndex + 1
	else
		return nil
	end
end

CoD.Codtv.WebMShutdown = function ()
	if CoD.Codtv.WebMPlayback ~= nil then
		Engine.WebM_Close( CoD.Codtv.WebMPlayback )
		CoD.Codtv.WebMPlayback = nil
	end
end

CoD.Codtv.SetInfoPanelGameMode = {}
CoD.Codtv.UpdateVotesEvent = function ( codtv, event )
	local card = CoD.Codtv.GetSelectedCard( codtv )
	local container = codtv.infoPanel.customFilePanel
	CoD.Codtv.UpdateVotes( card, container )
end

CoD.Codtv.UpdateVotes = function ( card, container )
	if card ~= nil and card.fileData ~= nil and card.fileData.isPooled == false then
		local views = 0
		local likes = 0
		local dislikes = 0
		local likeColor = CoD.white
		local dislikeColor = CoD.white
		if card.fileData.views ~= nil then
			views = card.fileData.views
			container.viewPanel:setAlpha( 1 )
		else
			container.viewPanel:setAlpha( 0 )
		end
		if card.fileData.likes ~= nil then
			likes = card.fileData.likes
		end
		if card.fileData.dislikes ~= nil then
			dislikes = card.fileData.dislikes
		end
		local voteCategory = CoD.FileshareVote.GetVoteCategory( card.fileData.category )
		local vote = nil
		if card.fileData.originID ~= nil and card.fileData.originID ~= "0" then
			vote = Engine.GetVote( card.codtv.m_ownerController, card.fileData.originID, voteCategory )
		else
			vote = Engine.GetVote( card.codtv.m_ownerController, card.fileData.fileID, voteCategory )
		end
		if vote ~= nil then
			if vote == "like" then
				likeColor = CoD.green
			elseif vote == "dislike" then
				dislikeColor = CoD.brightRed
			end
		end
		container.viewPanel:update( views )
		container.likePanel:update( likes, likeColor )
		container.dislikePanel:update( dislikes, dislikeColor )
	end
end

CoD.Codtv.SetInfoPanelGameModeDetails = function ( infoPanel, heading1, text1, heading2, text2 )
	if heading1 ~= nil and text1 ~= nil then
		infoPanel.gameModeStat1Header:setText( heading1 )
		infoPanel.gameModeStat1:setText( text1 )
	else
		infoPanel.gameModeStat1Header:setText( "" )
		infoPanel.gameModeStat1:setText( "" )
	end
	if heading2 ~= nil and text2 ~= nil then
		infoPanel.gameModeStat2Header:setText( heading2 )
		infoPanel.gameModeStat2:setText( text2 )
	else
		infoPanel.gameModeStat2Header:setText( "" )
		infoPanel.gameModeStat2:setText( "" )
	end
end

CoD.Codtv.ResetInfoPanelGameModeDetails = function ( container )
	container.gameModeStat1Header:setText( "" )
	container.gameModeStat1:setText( "" )
	container.gameModeStat2Header:setText( "" )
	container.gameModeStat2:setText( "" )
end

CoD.Codtv.GetKDRatio = function ( kills, deaths )
	local kd = 0
	if deaths <= 0 then
		return kills
	else
		local kdIntegral, kdFractional = math.modf( kills / deaths )
		return kdIntegral .. "." .. math.floor( kdFractional * 100 )
	end
end

CoD.Codtv.SetInfoPanelGameMode.dom = function ( infoPanel, playerBuffer, events )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_CAPTURES_CAPS" ), events.captures, Engine.Localize( "MPUI_DEFENDS_CAPS" ), events.returns )
end

CoD.Codtv.SetInfoPanelGameMode.tdm = function ( infoPanel, playerBuffer, event )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_RATIO_CAPS" ), CoD.Codtv.GetKDRatio( playerBuffer.kills:get(), playerBuffer.deaths:get() ), Engine.Localize( "MPUI_ASSISTS_CAPS" ), playerBuffer.assists:get() )
end

CoD.Codtv.SetInfoPanelGameMode.dm = function ( infoPanel, playerBuffer, event )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_RATIO_CAPS" ), CoD.Codtv.GetKDRatio( playerBuffer.kills:get(), playerBuffer.deaths:get() ), Engine.Localize( "MPUI_HEADSHOTS_CAPS" ), playerBuffer.headshots:get() )
end

CoD.Codtv.SetInfoPanelGameMode.ctf = function ( infoPanel, playerBuffer, events )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_CAPTURES_CAPS" ), events.captures, Engine.Localize( "MPUI_RETURNS_CAPS" ), events.returns )
end

CoD.Codtv.SetInfoPanelGameMode.dem = function ( infoPanel, playerBuffer, events )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_PLANTS_CAPS" ), events.plants, Engine.Localize( "MPUI_DEFUSES_CAPS" ), events.defuses )
end

CoD.Codtv.SetInfoPanelGameMode.sab = function ( infoPanel, playerBuffer, events )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_PLANTS_CAPS" ), events.plants, Engine.Localize( "MPUI_DEFUSES_CAPS" ), events.defuses )
end

CoD.Codtv.SetInfoPanelGameMode.sd = function ( infoPanel, playerBuffer, events )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_PLANTS_CAPS" ), events.plants, Engine.Localize( "MPUI_DEFUSES_CAPS" ), events.defuses )
end

CoD.Codtv.SetInfoPanelGameMode.hq = function ( infoPanel, playerBuffer, events )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_CAPTURES_CAPS" ), events.captures, Engine.Localize( "MPUI_DEFENDS_CAPS" ), events.returns )
end

CoD.Codtv.SetInfoPanelGameMode.koth = function ( infoPanel, playerBuffer, events )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_CAPTURES_CAPS" ), events.captures, Engine.Localize( "MPUI_DEFENDS_CAPS" ), events.returns )
end

CoD.Codtv.SetInfoPanelGameMode.conf = function ( infoPanel, playerBuffer, events )
	CoD.Codtv.SetInfoPanelGameModeDetails( infoPanel, Engine.Localize( "MPUI_KILLS_CONFIRMED_CAPS" ), events.captures, Engine.Localize( "MPUI_KILLS_DENIED_CAPS" ), events.returns )
end

CoD.Codtv.CreateHintText = function ( controller, left, top, width, height )
	local container = LUI.UIElement.new()
	container:setLeftRight( true, false, left, left + width )
	container:setTopBottom( true, false, top, top + height )
	container:setUseStencil( true )
	container.hintTextElement = CoD.HintText.new( hintTextParams )
	container.hintTextElement:setLeftRight( true, true, 0, 0 )
	container.hintTextElement:setTopBottom( true, false, 0, CoD.textSize.Default )
	container.hintTextElement:setColor( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b, 0.4 )
	container:addElement( container.hintTextElement )
	container.updateHintColor = function ( container, color )
		if color == nil then
			container.hintTextElement:setColor( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b, 0.4 )
		else
			container.hintTextElement:setColor( color.r, color.g, color.b, color.a )
		end
	end
	
	container.updateHintText = function ( container, text )
		if text == "" then
			container.hintTextElement:setAlpha( 0 )
		else
			container.hintTextElement:setAlpha( 1 )
		end
		container:updateHintColor( nil )
		container.hintTextElement:updateText( text )
	end
	
	return container
end

CoD.Codtv.ShowPooledFilePanelSummary = function ( infoPanel, event )
	if infoPanel == nil then
		return 
	end
	local container = infoPanel.pooledFilePanel
	if container == nil then
		return 
	end
	container.loader:setAlpha( 0 )
	if event.isValid == nil or event.isValid == false then
		return 
	end
	local xuid = event.xuid
	if infoPanel.codtv.m_rootRef == "playerchannel" and infoPanel.codtv.m_playerChannelXuid ~= nil then
		xuid = infoPanel.codtv.m_playerChannelXuid
	end
	if xuid == nil or xuid == "" then
		return 
	end
	local matchRecordData = Engine.GetMatchRecordStats( event.controller )
	local isDraw, winningTeam, teamCount, gameMode, playerTeam, playerPosition, playerParty = nil
	local playerScore = 0
	local oppositionScore = 0
	if matchRecordData == nil then
		return 
	end
	local header = matchRecordData.header
	local players = matchRecordData.playerBuffer
	local playerIndex = nil
	if false == CoD.isZombie then
		if header ~= nil then
			isDraw = header.isDraw:get()
			winningTeam = header.winningTeam:get()
			teamCount = header.teamCount:get()
			gameMode = header.gameModeID:get()
		end
		for i = 1, #players, 1 do
			local player = players[i - 1]
			if player.xuid:get() == xuid then
				playerIndex = i - 1
				playerTeam = player.team:get()
				playerPosition = player.position:get()
				playerParty = player.partyID:get()
				playerScore = player.score:get()
				container.kd:setText( player.kills:get() .. "/" .. player.deaths:get() )
			end
			local otherScore = player.score:get()
			if oppositionScore < otherScore then
				oppositionScore = otherScore
			end
		end
		if header ~= nil and teamCount > 1 then
			playerScore = 0
			oppositionScore = 0
			for team = 1, teamCount, 1 do
				if team == playerTeam then
					playerScore = header.teamScores[team]:get()
				end
				local otherScore = header.teamScores[team]:get()
				if oppositionScore < otherScore then
					oppositionScore = otherScore
				end
			end
		end
	end
	local partyMembers = {}
	if playerParty ~= nil and playerParty > 0 then
		for i = 1, #players, 1 do
			local player = players[i - 1]
			if player.partyID:get() == playerParty then
				table.insert( partyMembers, player.gamertag:get() )
			end
		end
		table.sort( partyMembers )
	end
	if #partyMembers > 5 and infoPanel.codtv.codtvIcon ~= nil then
		infoPanel.codtv.codtvIcon:setAlpha( 0 )
	end
	if false == CoD.isZombie then
		local events = {
			captures = 0,
			returns = 0,
			destroys = 0,
			plants = 0,
			defuses = 0
		}
		if playerIndex ~= nil then
			local gameEvents = matchRecordData.gameEvents
			for i = 1, #gameEvents, 1 do
				local gameEvent = gameEvents[i - 1]
				if playerIndex == gameEvent.player:get() then
					local eventType = gameEvent.eventType
					events.captures = events.captures + eventType.capture:get()
					events.returns = events.returns + eventType["return"]:get()
					events.destroys = events.destroys + eventType.destroy:get()
					events.plants = events.plants + eventType.plant:get()
					events.defuses = events.defuses + eventType.defuse:get()
				end
			end
		end
		CoD.Codtv.ResetInfoPanelGameModeDetails( container )
		if gameMode ~= nil and playerIndex ~= nil and players ~= nil and CoD.Codtv.SetInfoPanelGameMode[gameMode] ~= nil then
			CoD.Codtv.SetInfoPanelGameMode[gameMode]( container, players[playerIndex], events )
		end
		if teamCount == 1 then
			if playerPosition == nil then
				container.gameResult:setText( "" )
			elseif isDraw == 1 then
				container.gameResult:setText( Engine.Localize( "MENU_FILESHARE_DRAW" ) )
				container.gameResult:setRGB( CoD.lightBlue.r, CoD.lightBlue.g, CoD.lightBlue.b )
			elseif playerPosition < 3 then
				container.gameResult:setText( Engine.Localize( "MENU_FILESHARE_VICTORY" ) )
				container.gameResult:setRGB( CoD.brightGreen.r, CoD.brightGreen.g, CoD.brightGreen.b )
			else
				container.gameResult:setText( Engine.Localize( "MENU_FILESHARE_DEFEAT" ) )
				container.gameResult:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
			end
		elseif isDraw == 1 then
			container.gameResult:setText( Engine.Localize( "MENU_FILESHARE_DRAW" ) .. " " .. playerScore .. "-" .. oppositionScore )
			container.gameResult:setRGB( CoD.lightBlue.r, CoD.lightBlue.g, CoD.lightBlue.b )
		elseif playerTeam == winningTeam then
			container.gameResult:setText( Engine.Localize( "MENU_FILESHARE_VICTORY" ) .. " " .. playerScore .. "-" .. oppositionScore )
			container.gameResult:setRGB( CoD.brightGreen.r, CoD.brightGreen.g, CoD.brightGreen.b )
		else
			container.gameResult:setText( Engine.Localize( "MENU_FILESHARE_DEFEAT" ) .. " " .. playerScore .. "-" .. oppositionScore )
			container.gameResult:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
		end
	end
	if #partyMembers > 0 then
		container.partyPanel:setAlpha( 1 )
		container.partyHeader:setAlpha( 1 )
		for i = 1, 10, 1 do
			if i <= #partyMembers then
				container.teammates[i]:setText( partyMembers[i] )
			else
				container.teammates[i]:setText( "" )
			end
		end
	else
		container.partyHeader:setAlpha( 0 )
		container.partyPanel:setAlpha( 0 )
	end
	if false == CoD.isZombie then
		container.statsPanel:completeAnimation()
		container.statsPanel:beginAnimation( "fade_in", 250 )
		container.statsPanel:setAlpha( 1 )
	end
end

CoD.Codtv.ShowPooledFilePanel = function ( card )
	local infoPanel = card.codtv.infoPanel
	local container = infoPanel.pooledFilePanel
	container.playlist:setText( "" )
	container.time:setText( "" )
	container.partyHeader:setAlpha( 0 )
	container.partyPanel:setAlpha( 0 )
	container.bookmarked:setAlpha( 0 )
	container.kd:setText( "" )
	container.gameResult:setText( "" )
	CoD.Codtv.ResetInfoPanelGameModeDetails( container )
	if CoD.isZombie == false then
		local playlistString = CoD.FileshareManager.GetPlaylistString( card.fileData )
		container.playlist:setText( Engine.Localize( playlistString ) )
	end
	if card.fileData.bookmarked == true then
		container.bookmarked.bookmarkText:setText( Engine.Localize( "MENU_BOOKMARKED" ) )
		container.bookmarked.bookmarkText:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		container.bookmarked.starImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		container.bookmarked:setAlpha( 1 )
	elseif card.fileData.isLiveStream == true then
		local color, text = nil
		if card.fileData.isMetaDataValid == true then
			text = Engine.Localize( "MENU_LIVE_STREAM_OFFLINE" )
			color = CoD.red
		else
			text = Engine.Localize( "MENU_LIVE_STREAM_LIVE" )
			color = CoD.green
		end
		container.bookmarked.bookmarkText:setText( text )
		container.bookmarked.bookmarkText:setRGB( color.r, color.g, color.b )
		container.bookmarked.starImage:setRGB( color.r, color.g, color.b )
		container.bookmarked:setAlpha( 1 )
	end
	container.time:setText( card.fileData.time )
	card.codtv.hintText:updateHintText( card.fileData.description )
	infoPanel:addElement( container )
	container.loader:setAlpha( 1 )
	container.statsPanel:setAlpha( 0 )
end

CoD.Codtv.ShowCustomFilePanel = function ( card )
	local infoPanel = card.codtv.infoPanel
	local container = infoPanel.customFilePanel
	container.optInfo:setText( "" )
	container.optInfo:setAlpha( 0 )
	container.profileShot:setAlpha( 0 )
	card.codtv.hintText:updateHintText( card.fileData.description )
	if card.fileData.fileID ~= nil and card.fileData.fileID ~= "0" then
		local gameTypeString = CoD.FileshareManager.GetGametypeString( card.fileData )
		if card.fileData.author ~= nil then
			if card.fileData.category == "film" then
				container.author:setText( Engine.Localize( "MENU_FILESHARE_SAVED_BY" ) .. " " .. card.fileData.author )
				container.optInfo:setText( gameTypeString )
			else
				container.author:setText( Engine.Localize( "MENU_FILESHARE_AUTHOR" ) .. " " .. card.fileData.author )
			end
		end
		if card.fileData.category == "customgame" then
			container.optInfo:setText( gameTypeString )
		end
		if card.fileData.category == "screenshot" then
			local fileID, fileSize, fileName = Engine.GetCombatRecordScreenshotInfo( card.codtv.m_ownerController, Engine.GetXUID64( card.codtv.m_ownerController ) )
			if fileID == card.fileData.fileID then
				container.profileShot:setAlpha( 1 )
			end
		end
		container.time:setText( card.fileData.time )
		CoD.Codtv.UpdateVotes( card, container )
		infoPanel:addElement( container )
	end
end

CoD.Codtv.ShowIngameStorePanel = function ( card )
	local infoPanel = card.codtv.infoPanel
	local container = infoPanel.ingameStorePanel
	local desc = card.fileData.description
	local itemCostString = card.fileData.itemCostString
	local isOfferPurchased = card.fileData.isOfferPurchased
	if desc ~= nil then
		CoD.ScrollableTextContainer.SetupScrollingText( container.storeDescContainer, desc, CoD.Codtv.StoreDescriptionContainerWidth, CoD.Codtv.StoreDescriptionContainerHeight, nil, CoD.fonts.Default, CoD.textSize.Default, CoD.Codtv.ScrollableTextPauseTime, CoD.Codtv.ScrollableTextPerLineScrollTime )
	else
		container.storeDescription:setText( "" )
	end
	if itemCostString ~= nil then
		container.offerCost:setText( itemCostString )
	else
		container.offerCost:setText( "" )
	end
	if isOfferPurchased ~= nil and isOfferPurchased == 1 then
		card.codtv.hintText:updateHintText( Engine.Localize( "MENU_PACKAGE_DOWNLOAD_DESCRIPTION" ) )
		container.purchasedElement:show()
	else
		card.codtv.hintText:updateHintText( Engine.Localize( "MENU_PACKAGE_SELECTION_DESCRIPTION" ) )
		container.purchasedElement:hide()
	end
	infoPanel:addElement( container )
end

CoD.Codtv.ShowFileInfoPanel = function ( card )
	if card ~= nil and card.codtv ~= nil and card.codtv.infoPanel ~= nil then
		if card.fileData ~= nil then
			if card.fileData.isPooled == true then
				CoD.Codtv.ShowPooledFilePanel( card )
			elseif card.fileData.category == "ingamestore" then
				CoD.Codtv.ShowIngameStorePanel( card )
			else
				CoD.Codtv.ShowCustomFilePanel( card )
			end
		end
		card.codtv.infoPanel:completeAnimation()
		card.codtv.infoPanel:setAlpha( 0 )
		card.codtv.infoPanel:beginAnimation( "fade_in", 250 )
		card.codtv.infoPanel:setAlpha( 1 )
	end
end

CoD.Codtv.GetBacking = function ( top, left, width, height )
	local backing = LUI.UIElement.new()
	backing:setLeftRight( true, false, left, left + width )
	backing:setTopBottom( true, false, top, top + height )
	local upper = LUI.UIImage.new()
	upper:setLeftRight( true, true, 0, 0 )
	upper:setTopBottom( true, false, 0, 1 )
	upper:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	upper:setAlpha( 0.5 )
	backing:addElement( upper )
	local lower = LUI.UIImage.new()
	lower:setLeftRight( true, true, 0, 0 )
	lower:setTopBottom( false, true, -8, 0 )
	lower:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	lower:setImage( RegisterMaterial( "menu_sp_cac_single_dip" ) )
	lower:setAlpha( 0.5 )
	backing:addElement( lower )
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 0, 1 )
	left:setTopBottom( true, true, 0, 0 )
	left:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	left:setAlpha( 0.5 )
	backing:addElement( left )
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, -1, 0 )
	right:setTopBottom( true, true, 0, 0 )
	right:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	right:setAlpha( 0.5 )
	backing:addElement( right )
	return backing
end

CoD.Codtv.CreatePooledFilePanel = function ()
	local container = LUI.UIElement.new()
	container:setLeftRight( true, true, 15, 0 )
	container:setTopBottom( true, true, 0, 0 )
	local top = 20
	container.gameResult = LUI.UIText.new()
	container.gameResult:setLeftRight( true, true, 0, 0 )
	container.gameResult:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	container.gameResult:setAlignment( LUI.Alignment.Left )
	container.gameResult:setFont( CoD.fonts.Condensed )
	container:addElement( container.gameResult )
	local bookmarked = LUI.UIElement.new()
	bookmarked:setLeftRight( true, true, 0, 0 )
	bookmarked:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	local text = Engine.Localize( "MENU_BOOKMARKED" )
	local f110_local0 = {}
	local textDim = GetTextDimensions( text, CoD.fonts.Default, CoD.textSize.Default )
	local textLen = textDim[3]
	local bookmarkText = LUI.UIText.new()
	bookmarkText:setLeftRight( false, true, -textLen, 0 )
	bookmarkText:setTopBottom( false, true, -CoD.textSize.Default, 0 )
	bookmarkText:setAlignment( LUI.Alignment.Right )
	bookmarkText:setFont( CoD.fonts.Default )
	bookmarkText:setText( text )
	bookmarkText:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	bookmarked.bookmarkText = bookmarkText
	bookmarked:addElement( bookmarkText )
	local starImage = LUI.UIImage.new()
	starImage:setLeftRight( false, true, -textLen - CoD.textSize.Default - 5, -textLen - 5 )
	starImage:setTopBottom( false, true, -CoD.textSize.Default, 0 )
	starImage:setImage( RegisterMaterial( "menu_mp_star_rating" ) )
	starImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	bookmarked.starImage = starImage
	bookmarked:addElement( starImage )
	container.bookmarked = bookmarked
	container.bookmarked:setAlpha( 0 )
	container:addElement( container.bookmarked )
	if CoD.isZombie then
		container.gameResult:setAlpha( 0 )
	end
	top = top + CoD.textSize.Condensed + 10
	container.loader = LUI.UIImage.new()
	container.loader:setLeftRight( false, false, -32, 32 )
	container.loader:setTopBottom( true, false, top, top + 64 )
	container.loader:setImage( RegisterMaterial( "lui_loader" ) )
	container.loader:setShaderVector( 0, 0, 0, 0, 0 )
	container.loader:setAlpha( 0 )
	container:addElement( container.loader )
	local statBoxPadding = 15
	local boxWidth = 110
	local boxHeight = 45
	local box1Start = statBoxPadding
	local box2Start = box1Start + boxWidth + statBoxPadding
	local box3Start = box2Start + boxWidth + statBoxPadding
	local statsPanelHeight = 74
	local statsPanelWidth = boxWidth * 3 + statBoxPadding * 4
	local statsPanel = LUI.UIElement.new()
	statsPanel:setLeftRight( true, false, 0, statsPanelWidth )
	statsPanel:setTopBottom( true, false, top, top + statsPanelHeight )
	container.statsPanel = statsPanel
	container:addElement( statsPanel )
	if CoD.isZombie then
		statsPanel:setAlpha( 0 )
	end
	local statsPanelBorder = CoD.BorderT6.new( 1, CoD.offGray.r, CoD.offGray.g, CoD.offGray.b, 0.5 )
	statsPanel:addElement( statsPanelBorder )
	local statsPanelTop = 3
	local kd = LUI.UIText.new()
	kd:setLeftRight( true, false, box1Start, box1Start + boxWidth )
	kd:setTopBottom( true, false, statsPanelTop, statsPanelTop + CoD.textSize.ExtraSmall )
	kd:setAlignment( LUI.Alignment.Center )
	kd:setFont( CoD.fonts.ExtraSmall )
	kd:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	kd:setText( Engine.Localize( "MENU_KILLS_CAPS" ) .. "/" .. Engine.Localize( "MENU_DEATHS_CAPS" ) )
	statsPanel:addElement( kd )
	container.gameModeStat1Header = LUI.UIText.new()
	container.gameModeStat1Header:setLeftRight( true, false, box2Start, box2Start + boxWidth )
	container.gameModeStat1Header:setTopBottom( true, false, statsPanelTop, statsPanelTop + CoD.textSize.ExtraSmall )
	container.gameModeStat1Header:setAlignment( LUI.Alignment.Center )
	container.gameModeStat1Header:setFont( CoD.fonts.ExtraSmall )
	container.gameModeStat1Header:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	statsPanel:addElement( container.gameModeStat1Header )
	container.gameModeStat2Header = LUI.UIText.new()
	container.gameModeStat2Header:setLeftRight( true, false, box3Start, box3Start + boxWidth )
	container.gameModeStat2Header:setTopBottom( true, false, statsPanelTop, statsPanelTop + CoD.textSize.ExtraSmall )
	container.gameModeStat2Header:setAlignment( LUI.Alignment.Center )
	container.gameModeStat2Header:setFont( CoD.fonts.ExtraSmall )
	container.gameModeStat2Header:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	statsPanel:addElement( container.gameModeStat2Header )
	statsPanelTop = statsPanelTop + CoD.textSize.ExtraSmall
	local kdBacking = CoD.Codtv.GetBacking( statsPanelTop, box1Start, boxWidth, boxHeight )
	statsPanel:addElement( kdBacking )
	local gameMode1Backing = CoD.Codtv.GetBacking( statsPanelTop, box2Start, boxWidth, boxHeight )
	statsPanel:addElement( gameMode1Backing )
	local gameMode2Backing = CoD.Codtv.GetBacking( statsPanelTop, box3Start, boxWidth, boxHeight )
	statsPanel:addElement( gameMode2Backing )
	statsPanelTop = statsPanelTop + 5
	container.kd = LUI.UIText.new()
	container.kd:setLeftRight( true, false, box1Start, box1Start + boxWidth )
	container.kd:setTopBottom( true, false, statsPanelTop, statsPanelTop + CoD.textSize.Condensed )
	container.kd:setAlignment( LUI.Alignment.Center )
	container.kd:setFont( CoD.fonts.Condensed )
	statsPanel:addElement( container.kd )
	container.gameModeStat1 = LUI.UIText.new()
	container.gameModeStat1:setLeftRight( true, false, box2Start, box2Start + boxWidth )
	container.gameModeStat1:setTopBottom( true, false, statsPanelTop, statsPanelTop + CoD.textSize.Condensed )
	container.gameModeStat1:setAlignment( LUI.Alignment.Center )
	container.gameModeStat1:setFont( CoD.fonts.Condensed )
	statsPanel:addElement( container.gameModeStat1 )
	container.gameModeStat2 = LUI.UIText.new()
	container.gameModeStat2:setLeftRight( true, false, box3Start, box3Start + boxWidth )
	container.gameModeStat2:setTopBottom( true, false, statsPanelTop, statsPanelTop + CoD.textSize.Condensed )
	container.gameModeStat2:setAlignment( LUI.Alignment.Center )
	container.gameModeStat2:setFont( CoD.fonts.Condensed )
	statsPanel:addElement( container.gameModeStat2 )
	top = top + statsPanelHeight + 15
	container.time = LUI.UIText.new()
	container.time:setLeftRight( true, true, 0, 0 )
	container.time:setTopBottom( true, false, top, top + CoD.textSize.Default )
	container.time:setAlignment( LUI.Alignment.Left )
	container.time:setFont( CoD.fonts.Default )
	container.time:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	container:addElement( container.time )
	top = top + CoD.textSize.Default
	container.playlist = LUI.UIText.new()
	container.playlist:setLeftRight( true, true, 0, 0 )
	container.playlist:setTopBottom( true, false, top, top + CoD.textSize.Default )
	container.playlist:setAlignment( LUI.Alignment.Left )
	container.playlist:setFont( CoD.fonts.Default )
	container.playlist:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	container:addElement( container.playlist )
	top = top + CoD.textSize.Default + 15
	container.partyHeader = LUI.UIText.new()
	container.partyHeader:setLeftRight( true, true, 0, 0 )
	container.partyHeader:setTopBottom( true, false, top, top + CoD.textSize.ExtraSmall )
	container.partyHeader:setAlignment( LUI.Alignment.Left )
	container.partyHeader:setFont( CoD.fonts.ExtraSmall )
	container.partyHeader:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	container.partyHeader:setText( Engine.Localize( "MENU_PARTY_CAPS" ) )
	container:addElement( container.partyHeader )
	top = top + CoD.textSize.ExtraSmall
	
	local partyPanel = LUI.UIElement.new()
	partyPanel:setLeftRight( true, false, 0, 455 )
	partyPanel:setTopBottom( true, false, top, top + 130 )
	container:addElement( partyPanel )
	container.partyPanel = partyPanel
	
	container.teammates = {}
	local partyMemberIndex = 0
	local partyMemberWidth = 220
	for col = 1, 2, 1 do
		for player = 1, 5, 1 do
			local gamertagTop = CoD.textSize.Default * (player - 1)
			local gamertagLeft = partyMemberWidth * (col - 1)
			partyMemberIndex = partyMemberIndex + 1
			container.teammates[partyMemberIndex] = LUI.UIText.new()
			container.teammates[partyMemberIndex]:setLeftRight( true, false, gamertagLeft, gamertagLeft + partyMemberWidth )
			container.teammates[partyMemberIndex]:setTopBottom( true, false, gamertagTop, gamertagTop + CoD.textSize.Default )
			container.teammates[partyMemberIndex]:setAlignment( LUI.Alignment.Left )
			container.teammates[partyMemberIndex]:setFont( CoD.fonts.Default )
			partyPanel:addElement( container.teammates[partyMemberIndex] )
		end
	end
	return container
end

CoD.Codtv.CreateCustomFilePanel = function ()
	local container = LUI.UIElement.new()
	container:setLeftRight( true, true, 15, 0 )
	container:setTopBottom( true, true, 0, 0 )
	local top = 50
	container.likePanel = CoD.FileshareManager.StatPanel( 0, top, "likes" )
	container:addElement( container.likePanel )
	container.dislikePanel = CoD.FileshareManager.StatPanel( 145, top, "dislikes" )
	container:addElement( container.dislikePanel )
	container.viewPanel = CoD.FileshareManager.StatPanel( 290, top, "views" )
	container:addElement( container.viewPanel )
	top = top + 60
	container.author = LUI.UIText.new()
	container.author:setLeftRight( true, true, 0, 0 )
	container.author:setTopBottom( true, false, top, top + CoD.textSize.Default )
	container.author:setAlignment( LUI.Alignment.Left )
	container.author:setRGB( 0.8, 0.8, 0.8 )
	container:addElement( container.author )
	top = top + CoD.textSize.Default
	container.time = LUI.UIText.new()
	container.time:setLeftRight( true, true, 0, 0 )
	container.time:setTopBottom( true, false, top, top + CoD.textSize.Default )
	container.time:setAlignment( LUI.Alignment.Left )
	container.time:setFont( CoD.fonts.Default )
	container.time:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	container:addElement( container.time )
	top = top + CoD.textSize.Default
	container.optInfo = LUI.UIText.new()
	container.optInfo:setLeftRight( true, true, 0, 0 )
	container.optInfo:setTopBottom( true, false, top, top + CoD.textSize.Default )
	container.optInfo:setAlignment( LUI.Alignment.Left )
	container.optInfo:setFont( CoD.fonts.Default )
	container.optInfo:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	container:addElement( container.optInfo )
	container.profileShot = CoD.FileshareManager.GetProfileShot( top, CoD.fonts.Default, CoD.textSize.Default )
	container.profileShot:setAlpha( 0 )
	container:addElement( container.profileShot )
	return container
end

CoD.Codtv.CreateIngameStorePanel = function ()
	local container = LUI.UIElement.new()
	container:setLeftRight( true, true, 25, 0 )
	container:setTopBottom( true, true, 0, 0 )
	local top = 27
	container.purchasedElement = LUI.UIElement.new()
	container.purchasedElement:setLeftRight( true, true, 0, 250 )
	container.purchasedElement:setTopBottom( true, false, top, top + CoD.textSize.Default )
	container:addElement( container.purchasedElement )
	container.purchasedChecker = LUI.UIImage.new()
	container.purchasedChecker:setLeftRight( true, false, 0, CoD.textSize.ExtraSmall )
	container.purchasedChecker:setTopBottom( false, false, -CoD.textSize.ExtraSmall / 2, CoD.textSize.ExtraSmall / 2 )
	container.purchasedChecker:setImage( RegisterMaterial( "menu_mp_killstreak_select" ) )
	container.purchasedElement:addElement( container.purchasedChecker )
	container.purchasedText = LUI.UIText.new()
	container.purchasedText:setLeftRight( true, true, CoD.textSize.Default + 5, 0 )
	container.purchasedText:setTopBottom( true, true, 0, 0 )
	container.purchasedText:setFont( CoD.fonts.Default )
	container.purchasedText:setRGB( 0.6, 0.6, 0.6 )
	container.purchasedText:setText( Engine.Localize( "MENU_STORE_OFFER_PURCHASED" ) )
	container.purchasedText:setAlignment( LUI.Alignment.Left )
	container.purchasedElement:addElement( container.purchasedText )
	top = top + CoD.textSize.Default + 10
	container.costString = LUI.UIText.new()
	container.costString:setLeftRight( true, true, 0, 300 )
	container.costString:setTopBottom( true, false, top, top + CoD.textSize.Default )
	container.costString:setFont( CoD.fonts.Default )
	container.costString:setRGB( 0.3, 0.3, 0.3 )
	container.costString:setText( Engine.Localize( "MENU_COST" ) )
	container.costString:setAlignment( LUI.Alignment.Left )
	container:addElement( container.costString )
	local f112_local0 = {}
	local text_dim = GetTextDimensions( Engine.Localize( "MENU_COST" ), CoD.fonts.Default, CoD.textSize.Default )
	container.offerCost = LUI.UIText.new()
	container.offerCost:setLeftRight( true, true, text_dim[3] + 10, 0 )
	container.offerCost:setTopBottom( true, false, top, top + CoD.textSize.Default )
	container.offerCost:setFont( CoD.fonts.Default )
	container.offerCost:setRGB( 0.6, 0.6, 0.6 )
	container.offerCost:setAlignment( LUI.Alignment.Left )
	container:addElement( container.offerCost )
	top = top + CoD.textSize.Default + 10
	container.descriptionHeader = LUI.UIText.new()
	container.descriptionHeader:setLeftRight( true, true, 0, 0 )
	container.descriptionHeader:setTopBottom( true, false, top, top + CoD.textSize.Default )
	container.descriptionHeader:setFont( CoD.fonts.Default )
	container.descriptionHeader:setRGB( 0.3, 0.3, 0.3 )
	container.descriptionHeader:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	container.descriptionHeader:setAlignment( LUI.Alignment.Left )
	container:addElement( container.descriptionHeader )
	top = top + CoD.textSize.Default + 5
	container.storeDescContainer = LUI.UIElement.new()
	container.storeDescContainer:setUseStencil( true )
	container.storeDescContainer:setLeftRight( false, true, -CoD.Codtv.StoreDescriptionContainerWidth, 0 )
	container.storeDescContainer:setTopBottom( true, false, top, top + CoD.Codtv.StoreDescriptionContainerHeight )
	container:addElement( container.storeDescContainer )
	return container
end

CoD.Codtv.CreateInfoPanel = function ( codtv )
	local infoPanel = LUI.UIElement.new()
	infoPanel:setLeftRight( false, true, -CoD.Codtv.InfoPanelWidth, 0 )
	infoPanel:setTopBottom( true, false, CoD.Codtv.InfoPanelTop, CoD.Codtv.InfoPanelTop + CoD.Codtv.InfoPanelHeight )
	infoPanel.m_ownerController = controller
	infoPanel.codtv = codtv
	infoPanel.customFilePanel = CoD.Codtv.CreateCustomFilePanel()
	infoPanel.pooledFilePanel = CoD.Codtv.CreatePooledFilePanel()
	infoPanel.ingameStorePanel = CoD.Codtv.CreateIngameStorePanel()
	infoPanel.showSummary = CoD.Codtv.ShowPooledFilePanelSummary
	return infoPanel
end

CoD.Codtv.SavedState = nil
CoD.Codtv.OpenFileManager = function ( codtv, event )
	CoD.Codtv.SavedState = {}
	CoD.Codtv.SavedState.rootRef = codtv.m_rootRef
	CoD.Codtv.SavedState.rootFolderIndex = codtv.m_rootFolderIndex
	CoD.Codtv.SavedState.currentFolderIndex = codtv.m_currentFolderIndex
	CoD.Codtv.SavedState.previousFolderIndex = codtv.m_previousFolderIndex
	CoD.Codtv.SavedState.carouselContext = codtv.m_carouselContext
	local fileManager = codtv:openPopup( "FileshareManager", event.controller )
end

CoD.Codtv.ShowCODTVIcon = function ( codtv )
	if codtv ~= nil and codtv.m_rootRef == "community" then
		return true
	else
		return false
	end
end

CoD.Codtv.ShowPS3StoreLogo = function ( codtv )
	if codtv ~= nil and codtv.m_rootRef == "ingamestore" and CoD.isPS3 == true then
		return true
	else
		return false
	end
end

CoD.Codtv.SlotsAvailable = function ( codtv, event )
	local controller = event.controller
	if codtv.m_loaded == true then
		return 
	end
	codtv.m_loaded = true
	codtv.spinner:setAlpha( 0 )
	if event.valid == false then
		codtv.occludedMenu:openPopup( "FileshareManager_Error", event.controller )
		codtv:close()
		return 
	elseif codtv.m_rootRef ~= nil and codtv.m_rootRef ~= "" then
		local folderIndex = Engine.GetCodtvRoot( codtv.m_rootRef )
		if folderIndex == nil then
			codtv.occludedMenu:openPopup( "FileshareManager_Error", event.controller )
			codtv:close()
			return 
		end
		local codtvRoot = Engine.GetCodtvContent( folderIndex )
		codtv.m_rootFolderIndex = folderIndex
		codtv.m_previousFolderIndex = nil
		codtv.m_currentFolderIndex = folderIndex
		codtv.hintText = CoD.Codtv.CreateHintText( controller, 0, 312, 350, 80 )
		codtv:addElement( codtv.hintText )
		codtv.infoPanel = CoD.Codtv.CreateInfoPanel( codtv )
		codtv:addElement( codtv.infoPanel )
		if CoD.Codtv.ShowCODTVIcon( codtv ) == true or CoD.Codtv.ShowPS3StoreLogo( codtv ) == true then
			if codtv.codtvIcon == nil and codtv.m_rootRef ~= "ingamestore" then
				codtv.codtvIcon = LUI.UIImage.new()
				codtv.codtvIcon:setLeftRight( false, true, -256, 0 )
				codtv.codtvIcon:setTopBottom( false, true, -109, -45 )
				codtv.codtvIcon:setImage( RegisterMaterial( "menu_codtv_logo" ) )
				codtv:addElement( codtv.codtvIcon )
			elseif CoD.Codtv.ShowPS3StoreLogo( codtv ) == true then
				codtv.codtvIcon = LUI.UIImage.new()
				codtv.codtvIcon:setLeftRight( false, true, -128, 0 )
				codtv.codtvIcon:setTopBottom( false, true, -62, -30 )
				codtv.codtvIcon:setImage( RegisterMaterial( "playstation_store_ingame_logo" ) )
				codtv:addElement( codtv.codtvIcon )
			else
				codtv.codtvIcon:setAlpha( 1 )
			end
		elseif codtv.codtvIcon ~= nil then
			codtv.codtvIcon:setAlpha( 1 )
		end
		if codtvRoot ~= nil then
			codtv:addTitle( Engine.ToUpper( codtvRoot.name ) )
			local lineTop = 454
			local line = LUI.UIImage.new()
			line:setLeftRight( true, false, 0, CoD.Menu.Width / 2 - 85 )
			line:setTopBottom( true, false, lineTop, lineTop + 1 )
			line:setAlpha( 0.05 )
			codtv:addElement( line )
			codtv.m_cardCarouselList = CoD.Codtv.GetCarouselList( codtv, codtvRoot )
			codtv:addElement( codtv.m_cardCarouselList )
			if codtv.m_rootRef == "ingamestore" and true == CoD.isPS3 then
				local carouselIndex = Engine.DvarInt( nil, "ui_storeCategory" )
				codtv.m_cardCarouselList:setInitialCarousel( carouselIndex, 0 )
				Engine.SetDvar( "ui_storeCategory", 1 )
			end
			codtv.m_cardCarouselList:focusCurrentCardCarousel( controller )
		end
		if codtv.m_rootRef == "emblems" then
			local emblemCategoryID = Engine.TableLookup( nil, CoD.fileShareCategoriesTable, 0, "emblem", 2 )
			local emblemGroup = Engine.GetFileshareCategories( event.controller, "emblem" )
			codtv.m_emblemSlotsOccupied = emblemGroup[1].occupied
			codtv.m_emblemSlotsRemaining = emblemGroup[1].remaining
			codtv.m_embemNextSlot = Engine.GetFileshareNextSlot( event.controller, emblemCategoryID )
		end
	end
end

CoD.Codtv.MTXChanged = function ( codtv, event )
	if event.controller ~= codtv.m_ownerController then
		return 
	elseif codtv.m_rootRef ~= "ingamestore" then
		codtv:reload( codtv.m_rootFolderIndex )
	end
end

CoD.Codtv.OpenMTXPurchase = function ( self, event )
	self:openPopup( "MTXPurchase", event.controller, event.userData )
end

CoD.Codtv.OpenNoGuestMTX = function ( self, event )
	local errorPopup = self:openPopup( "Error", controller )
	errorPopup:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
end

LUI.createMenu.CODTv = function ( controller )
	local codtvRootRef = CoD.perController[controller].codtvRoot
	local codtv = CoD.Menu.New( "CODTv", nil, nil, codtvRootRef )
	local background = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	background:setPriority( -100 )
	codtv:addElement( background )
	Engine.Exec( controller, "vote_getHistory" )
	codtv.m_rootRef = codtvRootRef
	codtv.m_loaded = false
	CoD.Codtv.WebMShutdown()
	codtv:addLargePopupBackground()
	codtv:setOwner( controller )
	if codtvRootRef == "ingamestore" then
		local mtxid = Engine.DvarInt( nil, "ui_mtxid" )
		if mtxid == CoD.Codtv.INVALID_MTX_ID then
			Engine.SetStartCheckoutTimestampUTC()
		end
		Engine.SendDLCMenusViewedRecordEvent( controller, CoD.INGAMESTORE_MENU_VIEWED, "ingamestore" )
		codtv.unusedControllerAllowed = true
	end
	if codtvRootRef == "playerchannel" then
		codtv.m_playerChannelXuid = CoD.perController[controller].playerChannelXuid
		codtv.userData = codtv.m_playerChannelXuid
		if CoD.isMultiplayer and not CoD.isZombie and codtv.m_playerChannelXuid ~= nil and codtv.m_playerChannelXuid ~= "" then
			codtv:addElement( CoD.MiniIdentity.GetMiniIdentity( controller, codtv.m_playerChannelXuid ) )
		end
	end
	if codtvRootRef == "emblems" then
		codtv:setPreviousMenu( "Barracks" )
	end
	if codtvRootRef == "leagueidentity" then
		codtv:setPreviousMenu( "LeagueTeamNamePopup" )
	end
	codtv:addBackButton()
	codtv:registerEventHandler( "fileshare_slots_available", CoD.Codtv.SlotsAvailable )
	if codtvRootRef == "combatrecord" then
		codtv:setPreviousMenu( "CRCareer" )
	else
		codtv.saveButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_FILESHARE_SAVE" ), codtv, "card_save", false, nil, false, nil, "S" )
		codtv.reportButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_FILESHARE_REPORT_EMBLEM" ), codtv, "card_report", false, nil, false, nil, "S" )
		codtv.voteButtonPrompt = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_FILESHARE_LIKEDISLIKE" ), codtv, "card_vote", false, nil, false, nil, "R" )
		codtv.emblemOptionsPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_EMBLEM_OPTIONS" ), codtv, "fileshare_emblem_options", false, nil, false, nil, "O" )
	end
	codtv.reload = CoD.Codtv.ReloadMenu
	codtv.goBack = CoD.Codtv.GoBack
	codtv.animateOutAndGoBack = CoD.Codtv.AnimateOutAndGoBack
	codtv:registerEventHandler( "fileshare_open_manager", CoD.Codtv.OpenFileManager )
	codtv:registerEventHandler( "infopanel_update_votes", CoD.Codtv.UpdateVotesEvent )
	codtv:registerEventHandler( "fileshare_emblem_options", CoD.Codtv.EmblemOptions )
	codtv:registerEventHandler( "store_purchase_confirmation", CoD.Codtv.StorePurchaseConfirmation )
	codtv:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
	codtv:registerEventHandler( "mtx_changed", CoD.Codtv.MTXChanged )
	codtv:registerEventHandler( "open_mtx_purchase", CoD.Codtv.OpenMTXPurchase )
	codtv:registerEventHandler( "open_no_guest_mtx", CoD.Codtv.OpenNoGuestMTX )
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
	codtv.spinner = spinner
	codtv:addElement( spinner )
	Engine.Exec( controller, "fileshareGetSlots" )
	return codtv
end

LUI.createMenu.CODTv_Error = function ( controller )
	local popup = CoD.Popup.SetupPopup( "CODTv_Error", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "MENU_COD_TV_DISABLED_DUE_TO_LIVE_STREAM" ) )
	popup:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	return popup
end

