require( "ui.T6.CardCarouselList" )

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
CoD.Codtv.CardSelected = function ( f1_arg0, f1_arg1 )
	Engine.PlaySound( "cac_grid_equip_item" )
	if f1_arg0.type == "dwcontent" then
		CoD.Codtv.DWContentCardSelected( f1_arg0, f1_arg1 )
	elseif f1_arg0.type == "video" then
		CoD.Codtv.VideoCardSelected( f1_arg0, f1_arg1 )
	elseif f1_arg0.type == "folder" then
		CoD.Codtv.FolderCardSelected( f1_arg0, f1_arg1 )
	elseif f1_arg0.type == "dwfolder" then
		CoD.Codtv.DWFolderCardSelected( f1_arg0, f1_arg1 )
	elseif f1_arg0.type == "dwfolder_next" or f1_arg0.type == "dwfolder_prev" then
		CoD.Codtv.DWFolderCardNextPrevSelected( f1_arg0, f1_arg1 )
	elseif f1_arg0.type == "custombutton" then
		CoD.Codtv.CustomButtonCardSelected( f1_arg0, f1_arg1 )
	end
end

CoD.Codtv.CardGainFocus = function ( f2_arg0, f2_arg1 )
	if f2_arg0.codtv ~= nil then
		f2_arg0.codtv.hintText:updateHintText( "" )
		f2_arg0.codtv.infoPanel:removeAllChildren()
		if f2_arg0.codtv.codtvIcon ~= nil and CoD.Codtv.ShowCODTVIcon( f2_arg0.codtv ) then
			f2_arg0.codtv.codtvIcon:setAlpha( 1 )
		end
	end
	if f2_arg0.type == "dwcontent" then
		CoD.Codtv.DWContentCardGainFocus( f2_arg0, f2_arg1 )
	elseif f2_arg0.type == "video" then
		CoD.Codtv.VideoCardGainFocus( f2_arg0, f2_arg1 )
	elseif f2_arg0.type == "folder" then
		CoD.Codtv.FolderCardGainFocus( f2_arg0, f2_arg1 )
	elseif f2_arg0.type == "dwfolder" then
		CoD.Codtv.DWFolderCardGainFocus( f2_arg0, f2_arg1 )
	elseif f2_arg0.type == "dwfolder_next" or f2_arg0.type == "dwfolder_prev" then
		CoD.Codtv.DWFolderCardNextPrevGainFocus( f2_arg0, f2_arg1 )
	elseif f2_arg0.type == "custombutton" then
		CoD.Codtv.CustomButtonGainFocus( f2_arg0, f2_arg1 )
	end
	CoD.CardCarousel.Card_GainFocus( f2_arg0, f2_arg1 )
	return true
end

CoD.Codtv.CardLoseFocus = function ( f3_arg0, f3_arg1 )
	if f3_arg0.type == "dwcontent" then
		CoD.Codtv.DWContentCardLoseFocus( f3_arg0, f3_arg1 )
	elseif f3_arg0.type == "video" then
		CoD.Codtv.VideoCardLoseFocus( f3_arg0, f3_arg1 )
	elseif f3_arg0.type == "folder" then
		CoD.Codtv.FolderCardLoseFocus( f3_arg0, f3_arg1 )
	elseif f3_arg0.type == "dwfolder" then
		CoD.Codtv.DWFolderCardLoseFocus( f3_arg0, f3_arg1 )
	elseif f3_arg0.type == "dwfolder_next" or f3_arg0.type == "dwfolder_prev" then
		CoD.Codtv.DWFolderCardNextPrevLoseFocus( f3_arg0, f3_arg1 )
	end
	if f3_arg0.codtv ~= nil then
		f3_arg0.codtv.hintText:updateHintText( "" )
		f3_arg0.codtv.infoPanel:removeAllChildren()
	end
	CoD.CardCarousel.Card_LoseFocus( f3_arg0, f3_arg1 )
	return true
end

CoD.Codtv.GetGenericCard = function ( f4_arg0 )
	local f4_local0 = f4_arg0:addNewCard()
	f4_local0.codtv = f4_arg0.codtv
	f4_local0.container = LUI.UIElement.new()
	f4_local0.container:setLeftRight( true, true, 0, 0 )
	f4_local0.container:setTopBottom( true, true, 0, 0 )
	f4_local0:addElement( f4_local0.container )
	f4_local0.bg = LUI.UIImage.new()
	f4_local0.bg:setLeftRight( true, true, 2, -2 )
	f4_local0.bg:setTopBottom( false, true, -CoD.textSize.Default - 3, -3 )
	f4_local0.bg:setRGB( 0, 0, 0 )
	f4_local0.container:addElement( f4_local0.bg )
	f4_local0.text = LUI.UIText.new()
	f4_local0.text:setLeftRight( true, true, 5, 0 )
	f4_local0.text:setTopBottom( false, true, -CoD.textSize.Default - 3, -3 )
	f4_local0.text:setFont( CoD.fonts.Default )
	f4_local0.text:setAlignment( LUI.Alignment.Left )
	f4_local0.container:addElement( f4_local0.text )
	f4_local0:registerEventHandler( "button_action", CoD.Codtv.CardSelected )
	f4_local0:registerEventHandler( "gain_focus", CoD.Codtv.CardGainFocus )
	f4_local0:registerEventHandler( "lose_focus", CoD.Codtv.CardLoseFocus )
	return f4_local0
end

CoD.Codtv.FolderCardSelected = function ( f5_arg0, f5_arg1 )
	f5_arg0.codtv.m_carouselContext = CoD.CardCarousel.GetCurrentCarouselInfo( f5_arg0 )
	f5_arg0.codtv.m_carouselContext.folderIndex = f5_arg0.codtv.m_currentFolderIndex
	f5_arg0.codtv:reload( f5_arg0.folderIndex )
end

CoD.Codtv.FolderCardGainFocus = function ( f6_arg0, f6_arg1 )
	f6_arg0.codtv.rightButtonPromptBar:removeAllChildren()
	f6_arg0.codtv.leftButtonPromptBar:removeAllChildren()
	f6_arg0.codtv:addBackButton()
	f6_arg0.codtv:addSelectButton()
end

CoD.Codtv.FolderCardLoseFocus = function ( f7_arg0, f7_arg1 )
	
end

CoD.Codtv.CustomButtonBuyStorageLoad = function ( f8_arg0, f8_arg1 )
	f8_arg0.centerImageContainer:close()
	f8_arg0:setupCenterImage( f8_arg1.imageName, 72, 72, 2, false )
end

CoD.Codtv.CustomButtonNewEmblemLoad = function ( f9_arg0, f9_arg1 )
	f9_arg0.centerImageContainer:close()
	f9_arg0:setupCenterImage( f9_arg1.imageName, 72, 72, 2, false )
end

CoD.Codtv.ShouldLoadCard = function ( f10_arg0, f10_arg1 )
	if f10_arg1.type == "custombutton" and f10_arg1.action == "buystorage" then
		return CoD.FileshareManager.ShouldShowMtx( f10_arg0 )
	else
		return true
	end
end

CoD.Codtv.FolderCardsLoad = function ( f11_arg0, f11_arg1, f11_arg2 )
	for f11_local0 = 1, f11_arg2.subfolderCount, 1 do
		if CoD.Codtv.ShouldLoadCard( f11_arg0, f11_arg2[f11_local0] ) then
			local f11_local3 = CoD.Codtv.GetGenericCard( f11_arg1 )
			f11_local3.text:setText( f11_arg2[f11_local0].name )
			if f11_arg2[f11_local0].imageName ~= nil and f11_arg2[f11_local0].imageType ~= nil and f11_arg2[f11_local0].imageType == "material" then
				f11_local3:setupCenterImage( f11_arg2[f11_local0].imageName, 128, 128, 2, false )
			end
			f11_local3.type = f11_arg2[f11_local0].type
			f11_local3.customAction = f11_arg2[f11_local0].action
			f11_local3.folderIndex = f11_arg2[f11_local0].folderIndex
			f11_local3.parentFolderIndex = f11_arg2[f11_local0].parentFolderIndex
			if f11_local3.type == "custombutton" and f11_local3.customAction ~= nil then
				if f11_local3.customAction == "buystorage" then
					CoD.Codtv.CustomButtonBuyStorageLoad( f11_local3, f11_arg2[f11_local0] )
				end
				if f11_local3.customAction == "newemblem" then
					CoD.Codtv.CustomButtonNewEmblemLoad( f11_local3, f11_arg2[f11_local0] )
				end
			end
		end
	end
end

CoD.Codtv.DWContentCardCanSave = function ( f12_arg0 )
	if f12_arg0.fileData == nil then
		return false
	elseif f12_arg0.fileData.category == "clip" or f12_arg0.fileData.category == "screenshot" or f12_arg0.fileData.category == "film" then
		return true
	else
		return false
	end
end

CoD.Codtv.DWContentCardSave = function ( f13_arg0, f13_arg1 )
	if f13_arg0 ~= nil and f13_arg0.fileData ~= nil and f13_arg0:isInFocus() then
		CoD.perController[f13_arg1.controller].fileshareSaveCategory = f13_arg0.fileData.category
		CoD.perController[f13_arg1.controller].fileshareSaveName = f13_arg0.fileData.name
		CoD.perController[f13_arg1.controller].fileshareSaveDescription = f13_arg0.fileData.description
		CoD.perController[f13_arg1.controller].fileshareSaveIsCopy = true
		CoD.perController[f13_arg1.controller].fileshareSaveFileID = f13_arg0.fileData.fileID
		CoD.perController[f13_arg1.controller].fileshareSaveIsPooled = f13_arg0.fileData.isPooled
		CoD.perController[f13_arg1.controller].fileshareSaveMap = f13_arg0.fileData.map
		CoD.perController[f13_arg1.controller].fileshareZmMapStartLocation = f13_arg0.fileData.zmMapStartLoc
		CoD.perController[f13_arg1.controller].fileshareZmMapStartLocationName = f13_arg0.fileData.zmMapStartLocName
		CoD.perController[f13_arg1.controller].fileshareGameType = f13_arg0.fileData.gameType
	end
end

CoD.Codtv.DWContentCardCanVote = function ( f14_arg0, f14_arg1 )
	local f14_local0 = Engine.GetXUID( f14_arg1.controller )
	if f14_local0 ~= nil and f14_local0 == f14_arg0.fileData.authorXuid then
		return false
	elseif f14_arg0.fileData == nil or f14_arg0.fileData.isPooled == true or f14_arg0.fileData.category == "ingamestore" then
		return false
	else
		return true
	end
end

CoD.Codtv.DWContentCardVote = function ( f15_arg0, f15_arg1 )
	if f15_arg0 ~= nil and f15_arg0.fileData ~= nil and f15_arg0.fileData.fileID ~= "0" and f15_arg0:isInFocus() then
		CoD.perController[f15_arg1.controller].voteData = f15_arg0.fileData
		CoD.perController[f15_arg1.controller].voteUpdateTarget = f15_arg0.codtv
		local f15_local0 = f15_arg0.codtv:openPopup( "FileshareVote", f15_arg0.codtv.m_ownerController )
	end
end

CoD.Codtv.DWContentCardCanReport = function ( f16_arg0, f16_arg1 )
	local f16_local0 = Engine.GetXUID( f16_arg1.controller )
	if f16_local0 ~= nil and f16_local0 == f16_arg0.fileData.authorXuid then
		return false
	elseif f16_arg0.fileData == nil or f16_arg0.fileData.isPooled == true or f16_arg0.fileData.category ~= "emblem" then
		return false
	else
		return true
	end
end

CoD.Codtv.DWContentCardReport = function ( f17_arg0, f17_arg1 )
	if f17_arg0 ~= nil and f17_arg0.fileData ~= nil and f17_arg0.fileData.fileID ~= "0" and f17_arg0:isInFocus() then
		CoD.perController[f17_arg1.controller].reportData = f17_arg0.fileData
		local f17_local0 = f17_arg0.codtv:openPopup( "FileshareReport", f17_arg0.codtv.m_ownerController )
	end
end

CoD.Codtv.DWFolderCardEmblemSelected = function ( f18_arg0, f18_arg1 )
	if f18_arg0.fileData == nil or f18_arg0.fileData.fileID == nil then
		return 
	else
		f18_arg0.codtv.m_previousFolderIndex = nil
		if Engine.IsFeatureBanned( CoD.FEATURE_BAN_EMBLEM_EDITOR ) then
			Engine.ExecNow( f18_arg1.controller, "banCheck " .. CoD.FEATURE_BAN_EMBLEM_EDITOR )
			return 
		else
			CoD.perController[f18_arg1.controller].emblemSaveSlot = f18_arg0.fileData.slot
			CoD.perController[f18_arg1.controller].emblemFileID = f18_arg0.fileData.fileID
			CoD.Codtv.Shutdown()
			f18_arg0.codtv:close()
		end
	end
end

CoD.Codtv.DWFolderCardLeagueIDSelected = function ( f19_arg0, f19_arg1 )
	if f19_arg0.fileData == nil or f19_arg0.fileData.fileID == nil then
		return 
	else
		CoD.Codtv.Shutdown()
		f19_arg0.codtv:goBack( f19_arg1.controller )
	end
end

CoD.EmblemOptions = {}
LUI.createMenu.EmblemSetIdentityConfirmation = function ( f20_arg0 )
	local f20_local0 = CoD.Popup.SetupPopup( "popup_chatrestricted", f20_arg0 )
	f20_local0.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	f20_local0.msg:setText( Engine.Localize( "MENU_EMBLEM_IDENTITY_SET" ) )
	f20_local0.anyControllerAllowed = true
	f20_local0.primaryButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), f20_local0, "emblem_set_identity_accept" )
	f20_local0:addLeftButtonPrompt( f20_local0.primaryButton )
	f20_local0:registerEventHandler( "emblem_set_identity_accept", CoD.EmblemOptions.SetIdentityAccept )
	return f20_local0
end

CoD.EmblemOptions.SetIdentityAccept = function ( f21_arg0, f21_arg1 )
	local f21_local0 = f21_arg0.occludedMenu
	f21_arg0:goBack( f21_arg1.controller )
	f21_local0:goBack( f21_arg1.controller )
end

CoD.EmblemOptions.SetIdentity = function ( f22_arg0, f22_arg1 )
	
end

CoD.EmblemOptions.ExecuteCopy = function ( f23_arg0 )
	Engine.FileShareCopy( f23_arg0.m_controller, f23_arg0.m_fileID, f23_arg0.m_isPooled, f23_arg0.m_slot )
end

CoD.EmblemOptions.CreateCopy = function ( f24_arg0, f24_arg1 )
	if f24_arg0.m_fileID ~= nil and f24_arg0.m_fileID ~= "0" and f24_arg0.m_nextSlot ~= nil then
		f24_arg0:openPopup( "Fileshare_BusyPopup", f24_arg1.controller, {
			title = Engine.Localize( "MENU_EMBLEM_COPY" ),
			message = Engine.Localize( "MENU_EMBLEM_COPY_WAIT" ),
			successNotice = Engine.Localize( "MENU_EMBLEM_COPY_SUCCESS" ),
			failureNotice = Engine.Localize( "MENU_EMBLEM_COPY_FAILURE" ),
			completionEvent = "fileshare_upload_complete",
			completionNotification = "delete_done",
			actionFunc = CoD.EmblemOptions.ExecuteCopy,
			m_controller = f24_arg1.controller,
			m_fileID = f24_arg0.m_fileID,
			m_isPooled = false,
			m_slot = f24_arg0.m_nextSlot
		} )
	end
end

CoD.EmblemOptions.Delete = function ( f25_arg0, f25_arg1 )
	f25_arg0:openPopup( "Fileshare_ConfirmationPopup", f25_arg1.controller, {
		title = Engine.Localize( "MENU_EMBLEM_DELETE" ),
		message = Engine.Localize( "MENU_EMBLEM_DELETE_WAIT" ),
		confirmationTitle = Engine.Localize( "MENU_EMBLEM_DELETE" ),
		confirmationMessage = Engine.Localize( "MENU_EMBLEM_DELETE_CONFIRMATION" ),
		successNotice = Engine.Localize( "MENU_EMBLEM_DELETE_SUCCESS" ),
		failureNotice = Engine.Localize( "MENU_EMBLEM_DELETE_FAILURE" ),
		actionFunc = CoD.FileshareManager.ExecuteDelete,
		m_controller = f25_arg1.controller,
		m_fileID = f25_arg0.m_fileID,
		completionEvent = "fileshare_delete_slot_done",
		completionNotification = "delete_done"
	} )
end

CoD.EmblemOptions.DeleteDone = function ( f26_arg0, f26_arg1 )
	f26_arg0:goBack( f26_arg1.controller )
end

LUI.createMenu.EmblemOptions = function ( f27_arg0 )
	local f27_local0 = CoD.Menu.NewMediumPopup( "EmblemOptions" )
	f27_local0:setOwner( f27_arg0 )
	f27_local0.m_fileID = CoD.perController[f27_arg0].emblemOptionsFileID
	f27_local0.m_slotsRemaining = CoD.perController[f27_arg0].emblemOptionsSlotsRemaining
	f27_local0.m_nextSlot = CoD.perController[f27_arg0].emblemOptionsNextSlot
	f27_local0:addSelectButton()
	f27_local0:addBackButton()
	f27_local0:registerEventHandler( "emblem_set_identity", CoD.EmblemOptions.SetIdentity )
	f27_local0:registerEventHandler( "emblem_create_copy", CoD.EmblemOptions.CreateCopy )
	f27_local0:registerEventHandler( "emblem_delete", CoD.EmblemOptions.Delete )
	f27_local0:registerEventHandler( "delete_done", CoD.EmblemOptions.DeleteDone )
	local f27_local1 = 5
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f27_local1, f27_local1 + CoD.textSize.Big )
	self:setFont( CoD.fonts.Big )
	self:setAlignment( LUI.Alignment.Left )
	self:setText( Engine.Localize( "MENU_EMBLEM_OPTIONS_CAPS" ) )
	f27_local0:addElement( self )
	f27_local1 = f27_local1 + CoD.textSize.Big + 70
	local f27_local3 = CoD.ButtonList.new( {} )
	f27_local3:setLeftRight( true, false, 0, 500 )
	f27_local3:setTopBottom( true, true, f27_local1, 0 )
	f27_local0:addElement( f27_local3 )
	local f27_local4 = f27_local3:addButton( Engine.Localize( "MENU_EMBLEM_SET_IDENTITY" ), Engine.Localize( "MENU_EMBLEM_SET_IDENTITY_HINT" ) )
	f27_local4:setActionEventName( "emblem_set_identity" )
	f27_local4:processEvent( {
		name = "gain_focus"
	} )
	if f27_local0.m_slotsRemaining == 0 then
		local f27_local5 = f27_local3:addButton( Engine.Localize( "MENU_EMBLEM_CREATE_COPY" ), Engine.Localize( "MENU_EMBLEM_COPY_NOT_ALLOWED_HINT" ) )
		f27_local5:disable()
	else
		local f27_local5 = f27_local3:addButton( Engine.Localize( "MENU_EMBLEM_CREATE_COPY" ), Engine.Localize( "MENU_EMBLEM_COPY_ALLOWED_HINT" ) )
		f27_local5:setActionEventName( "emblem_create_copy" )
	end
	local f27_local5 = f27_local3:addButton( Engine.Localize( "MENU_DELETE_CAPS" ), Engine.Localize( "MENU_EMBLEM_DELETE_HINT" ) )
	f27_local5:setActionEventName( "emblem_delete" )
	f27_local3:addSpacer( CoD.CoD9Button.Height * 2 )
	local f27_local6 = LUI.UIImage.new()
	f27_local6:setLeftRight( false, true, -306, -50 )
	f27_local6:setTopBottom( true, false, 70, 326 )
	f27_local6:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_EMBLEM, f27_local0.m_fileID )
	f27_local0:addElement( f27_local6 )
	return f27_local0
end

CoD.StorePurchaseConfirmation = {}
CoD.StorePurchaseConfirmation.AButtonText = function ( f28_arg0 )
	if f28_arg0.isOfferPurchased ~= nil and f28_arg0.isOfferPurchased == 1 then
		f28_arg0.selectButton:setText( Engine.Localize( "MENU_STORE_DOWNLOAD" ) )
	else
		f28_arg0.selectButton:setText( Engine.Localize( "MENU_STORE_BUY" ) )
	end
end

CoD.StorePurchaseConfirmation.AButtonPressed = function ( f29_arg0, f29_arg1 )
	if f29_arg0.isOfferPurchased == 1 then
		Engine.ExecNow( f29_arg1.controller, "downloadSelectedOffer " .. f29_arg0.offerid .. " " .. f29_arg0.storeContentType )
	else
		Engine.ExecNow( f29_arg1.controller, "purchaseSelectedOffer " .. f29_arg0.offerid .. " " .. f29_arg0.storeContentType )
	end
	f29_arg0:goBack( f29_arg1.controller )
end

LUI.createMenu.StorePurchaseConfirmation = function ( f30_arg0 )
	local f30_local0 = CoD.Menu.New( "StorePurchaseConfirmation" )
	f30_local0:setOwner( f30_arg0 )
	f30_local0.unusedControllerAllowed = true
	f30_local0:registerEventHandler( "button_select_prompt", CoD.StorePurchaseConfirmation.AButtonPressed )
	f30_local0:addLargePopupBackground()
	f30_local0.isOfferPurchased = CoD.perController[f30_arg0].isofferpurchased
	f30_local0.folderIndex = CoD.perController[f30_arg0].folderIndex
	f30_local0.startIndex = CoD.perController[f30_arg0].startIndex
	f30_local0.offerid = CoD.perController[f30_arg0].offerid
	f30_local0.storeContentType = CoD.perController[f30_arg0].storeContentType
	f30_local0:addSelectButton( nil, nil, "button_select_prompt" )
	f30_local0:addBackButton()
	CoD.StorePurchaseConfirmation.AButtonText( f30_local0 )
	local f30_local1 = 0
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f30_local1, f30_local1 + CoD.textSize.Big )
	self:setFont( CoD.fonts.Big )
	self:setAlignment( LUI.Alignment.Left )
	self:setText( Engine.Localize( "MENU_PURCHASE_CONFIRMAITON" ) )
	f30_local0:addElement( self )
	f30_local1 = f30_local1 + CoD.textSize.Big + 20
	local f30_local3 = LUI.UIText.new()
	f30_local3:setLeftRight( true, true, 0, 0 )
	f30_local3:setTopBottom( true, false, f30_local1, f30_local1 + CoD.textSize.ExtraSmall )
	f30_local3:setFont( CoD.fonts.ExtraSmall )
	f30_local3:setAlignment( LUI.Alignment.Left )
	f30_local3:setupUITextUncached()
	f30_local3:setText( CoD.perController[f30_arg0].longDescription )
	f30_local0:addElement( f30_local3 )
	local f30_local4 = LUI.UIImage.new()
	f30_local4:setLeftRight( false, true, -128, 0 )
	f30_local4:setTopBottom( false, true, -62, -30 )
	f30_local4:setImage( RegisterMaterial( "playstation_store_ingame_logo" ) )
	f30_local0:addElement( f30_local4 )
	return f30_local0
end

CoD.Codtv.GetSelectedCard = function ( f31_arg0 )
	local f31_local0 = f31_arg0.m_cardCarouselList.cardCarousels[f31_arg0.m_cardCarouselList.m_currentCardCarouselIndex]
	if f31_local0 ~= nil then
		return f31_local0.horizontalList.cards[f31_local0.horizontalList.m_currentCardIndex]
	else
		return nil
	end
end

CoD.Codtv.EmblemOptions = function ( f32_arg0, f32_arg1 )
	local f32_local0 = CoD.Codtv.GetSelectedCard( f32_arg0 )
	if f32_local0 ~= nil and f32_local0.fileData ~= nil and f32_local0.fileData.category == "emblem" then
		CoD.perController[f32_arg1.controller].emblemOptionsFileID = f32_local0.fileData.fileID
		CoD.perController[f32_arg1.controller].emblemOptionsSlotsRemaining = f32_arg0.m_emblemSlotsRemaining
		CoD.perController[f32_arg1.controller].emblemOptionsNextSlot = f32_arg0.m_embemNextSlot
		f32_arg0:openMenu( "EmblemOptions", f32_arg1.controller )
		f32_arg0:close()
	end
end

CoD.Codtv.StorePurchaseConfirmation = function ( f33_arg0, f33_arg1 )
	local f33_local0 = CoD.Codtv.GetSelectedCard( f33_arg0 )
	if f33_local0 ~= nil and f33_local0.fileData ~= nil and f33_local0.fileData.category == "ingamestore" then
		CoD.perController[f33_arg1.controller].isofferpurchased = f33_local0.fileData.isOfferPurchased
		CoD.perController[f33_arg1.controller].longDescription = f33_local0.fileData.longDescription
		CoD.perController[f33_arg1.controller].folderIndex = f33_local0.fileData.folderIndex
		CoD.perController[f33_arg1.controller].startIndex = f33_local0.fileData.startIndex
		CoD.perController[f33_arg1.controller].offerid = f33_local0.fileData.offerid
		CoD.perController[f33_arg1.controller].storeContentType = f33_local0.fileData.storeContentType
		f33_arg0:openPopup( "StorePurchaseConfirmation", f33_arg1.controller )
	end
end

CoD.Codtv.IngameStoreSelectButtonPressed = function ( f34_arg0, f34_arg1 )
	if CoD.isPS3 then
		f34_arg0.codtv:processEvent( {
			name = "store_purchase_confirmation",
			controller = f34_arg1.controller
		} )
	else
		Engine.ExecNow( f34_arg1.controller, "downloadSelectedOffer " .. f34_arg0.fileData.offerid .. " " .. f34_arg0.fileData.storeContentType )
	end
end

function LoadFile( f35_arg0 )
	if f35_arg0 == nil then
		return 
	else
		Engine.SetDvar( "ui_mapname", f35_arg0.map )
		Engine.SetDvar( "ui_gametype", f35_arg0.gametype )
		Engine.SetDvar( "ui_demoname", "Film.demo" )
		Engine.LobbyUpdateDemoInformation( f35_arg0 )
	end
end

function OpenFile( f36_arg0, f36_arg1 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			LoadFile( f36_arg1 )
			f36_arg0:dispatchEventToRoot( {
				name = "close_all_popups",
				controller = f36_arg1.controller
			} )
		else
			Dvar.ui_errorTitle:set( Engine.Localize( "MENU_NOTICE_CAPS" ) )
			Dvar.ui_errorMessage:set( Engine.Localize( "MENU_FILESHARE_ONLY_HOST_ALLOWED_TO_LOAD" ) )
			CoD.Menu.OpenErrorPopup( f36_arg0, {
				controller = f36_arg1.controller
			} )
		end
	end
end

CoD.Codtv.DWContentCardSelected = function ( f37_arg0, f37_arg1 )
	if f37_arg0.codtv.m_rootRef == "ingamestore" then
		CoD.Codtv.IngameStoreSelectButtonPressed( f37_arg0, f37_arg1 )
	elseif f37_arg0.codtv.m_rootRef == "emblems" and f37_arg0.emblemDownloaded == true then
		CoD.Codtv.DWFolderCardEmblemSelected( f37_arg0, f37_arg1 )
	elseif f37_arg0.codtv.m_rootRef == "leagueidentity" then
		CoD.Codtv.DWFolderCardLeagueIDSelected( f37_arg0, f37_arg1 )
	elseif f37_arg0.codtv.m_rootRef == "combatrecord" then
		Engine.SetCombatRecordScreenshotInfo( f37_arg1.controller, f37_arg0.fileData.fileID, f37_arg0.fileData.summarySize, f37_arg0.fileData.name )
		f37_arg0:dispatchEventToParent( {
			name = "button_prompt_back",
			controller = f37_arg1.controller
		} )
	elseif f37_arg0.fileData.category == "customgame" then
		if Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
			if Engine.GameHost() then
				Engine.DownloadGameSettings( f37_arg1.controller, f37_arg0.fileData.fileID, f37_arg0.fileData.gameType )
				Dvar.fshCustomGameName:set( f37_arg0.fileData.name )
				f37_arg0.codtv:setPreviousMenu( nil )
				f37_arg0.codtv:goBack( f37_arg1.controller )
			else
				Dvar.ui_errorTitle:set( Engine.Localize( "MENU_NOTICE_CAPS" ) )
				Dvar.ui_errorMessage:set( Engine.Localize( "MENU_FILESHARE_ONLY_HOST_ALLOWED_TO_LOAD" ) )
				CoD.Menu.OpenErrorPopup( f37_arg0.codtv, f37_arg1 )
			end
		else
			f37_arg0.codtv:openPopup( "LoadCustomGames", f37_arg1.controller, {
				fileID = f37_arg0.fileData.fileID,
				gameType = f37_arg0.fileData.gameType,
				fileName = f37_arg0.fileData.name
			} )
		end
	elseif f37_arg0.fileData.category ~= "emblem" and f37_arg0 ~= nil and f37_arg0.fileData ~= nil and f37_arg0.fileData.fileID ~= nil and f37_arg0.fileData.fileID ~= "0" then
		local f37_local0 = f37_arg0.cardCarousel.cardCarouselList:getParent()
		local f37_local1 = f37_arg0.fileData.authorXUID
		if f37_arg0.fileData.authorXUID == nil then
			f37_local1 = Engine.DefaultID64Value()
		end
		local f37_local2 = {
			controller = f37_arg1.controller,
			fileID = f37_arg0.fileData.fileID,
			category = f37_arg0.fileData.category,
			fileSize = f37_arg0.fileData.fileSize,
			map = f37_arg0.fileData.map,
			matchID = f37_arg0.fileData.matchID,
			zmmapstartloc = f37_arg0.fileData.zmMapStartLoc,
			gametype = f37_arg0.fileData.gameType,
			authorXUID = f37_local1,
			duration = f37_arg0.fileData.durationInt,
			isPooled = f37_arg0.fileData.isPooled,
			fileName = "film.demo",
			description = f37_arg0.fileData.description,
			mainMode = f37_arg0.fileData.mainMode,
			isLiveStream = f37_arg0.fileData.isLiveStream,
			demoMode = "",
			isMetaDataValid = f37_arg0.fileData.isMetaDataValid,
			targetCarousel = f37_arg0.cardCarousel.cardCarouselList
		}
		CoD.perController[f37_arg1.controller].fileActionInfo = f37_arg0.fileData
		OpenFile( f37_local0, f37_local2 )
	end
end

CoD.Codtv.InGameStoreUpdateAButtonPromptString = function ( f38_arg0, f38_arg1 )
	if f38_arg0.fileData.category == "ingamestore" and not CoD.isPS3 then
		local f38_local0 = Engine.IsOfferPurchased( f38_arg1.controller, f38_arg0.fileData.offerid, f38_arg0.fileData.storeContentType )
		if f38_local0 ~= nil and f38_local0 == 1 then
			f38_arg0.codtv.selectButton:setText( Engine.Localize( "MENU_STORE_DOWNLOAD" ) )
		else
			f38_arg0.codtv.selectButton:setText( Engine.Localize( "MENU_STORE_BUY" ) )
		end
	end
end

CoD.Codtv.DWContentCardGainFocus = function ( f39_arg0, f39_arg1 )
	if f39_arg0.cardName ~= nil then
		f39_arg0.cardName:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	end
	if f39_arg0.durationText ~= nil then
		f39_arg0.durationText:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	end
	if f39_arg0.codtv ~= nil and f39_arg0.fileData ~= nil then
		CoD.Codtv.ShowFileInfoPanel( f39_arg0 )
	end
	f39_arg0.codtv.rightButtonPromptBar:removeAllChildren()
	f39_arg0.codtv.leftButtonPromptBar:removeAllChildren()
	f39_arg0.codtv:addBackButton()
	if CoD.isPC and f39_arg1.controller == nil then
		f39_arg1.controller = f39_arg0.codtv.m_ownerController
	end
	if CoD.Codtv.DWContentCardCanVote( f39_arg0, f39_arg1 ) and f39_arg0.codtv.voteButtonPrompt then
		f39_arg0.codtv:addRightButtonPrompt( f39_arg0.codtv.voteButtonPrompt )
	end
	if CoD.Codtv.DWContentCardCanSave( f39_arg0 ) and f39_arg0.codtv.saveButtonPrompt then
		f39_arg0.codtv:addRightButtonPrompt( f39_arg0.codtv.saveButtonPrompt )
	end
	if CoD.Codtv.DWContentCardCanReport( f39_arg0, f39_arg1 ) and f39_arg0.codtv.reportButtonPrompt then
		f39_arg0.codtv:addRightButtonPrompt( f39_arg0.codtv.reportButtonPrompt )
	end
	if f39_arg0.fileData ~= nil then
		if f39_arg0.codtv.m_rootRef == "emblems" or f39_arg0.codtv.m_rootRef == "leagueidentity" or f39_arg0.fileData.category ~= "emblem" then
			f39_arg0.codtv:addSelectButton()
		end
		CoD.Codtv.InGameStoreUpdateAButtonPromptString( f39_arg0, f39_arg1 )
		if f39_arg0.fileData.category == "customgame" and f39_arg0.fileData.gameType ~= nil then
			f39_arg0.mapImage:setLeftRight( false, false, -80, 80 )
			f39_arg0.mapImage:setTopBottom( false, false, -80, 80 )
		end
		if f39_arg0.fileData.category == "emblem" and f39_arg0.codtv.m_rootRef == "emblems" then
			f39_arg0.codtv:addRightButtonPrompt( f39_arg0.codtv.emblemOptionsPrompt )
			f39_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_DEFAULT_EMBLEM_DESCRIPTION" ) )
		end
	end
end

CoD.Codtv.DWContentCardLoseFocus = function ( f40_arg0, f40_arg1 )
	if f40_arg0.cardName ~= nil then
		f40_arg0.cardName:setRGB( 1, 1, 1 )
	end
	if f40_arg0.durationText ~= nil then
		f40_arg0.durationText:setRGB( 1, 1, 1 )
	end
	f40_arg0.codtv.leftButtonPromptBar:removeAllChildren()
	f40_arg0.codtv:addBackButton()
	if f40_arg0.fileData ~= nil and f40_arg0.fileData.category == "customgame" and f40_arg0.fileData.gameType ~= nil then
		f40_arg0.mapImage:setLeftRight( false, false, -50, 50 )
		f40_arg0.mapImage:setTopBottom( false, false, -50, 50 )
	end
end

CoD.Codtv.DWContentCardSummaryDownloaded = function ( f41_arg0, f41_arg1 )
	if not f41_arg0:isInFocus() then
		return 
	elseif f41_arg0.fileData.category == "film" then
		f41_arg0.codtv.infoPanel:showSummary( f41_arg1 )
		return 
	elseif f41_arg0.fileData.category ~= "clip" and f41_arg0.fileData.category ~= "screenshot" then
		return 
	elseif not f41_arg1.isValid then
		f41_arg0.mapImage:setupUIImage()
	end
end

CoD.Codtv.IngameStoreContentCardLoad = function ( f42_arg0, f42_arg1, f42_arg2 )
	if f42_arg0.fileData.fileID ~= "0" then
		f42_arg0.mapImage = LUI.UIImage.new()
		f42_arg0.mapImage:setLeftRight( true, true, 2, -2 )
		f42_arg0.mapImage:setTopBottom( true, true, 2, -CoD.textSize.ExtraSmall - 4 )
		f42_arg0:addElement( f42_arg0.mapImage )
	end
	f42_arg0.cardNameContainer = LUI.UIElement.new()
	f42_arg0.cardNameContainer:setUseStencil( true )
	f42_arg0.cardNameContainer:setLeftRight( true, true, 5, 0 )
	f42_arg0.cardNameContainer:setTopBottom( false, true, -CoD.textSize.ExtraSmall - 2, -2 )
	f42_arg0:addElement( f42_arg0.cardNameContainer )
	f42_arg0.cardName = LUI.UIText.new()
	f42_arg0.cardName:setLeftRight( true, true, 0, 0 )
	f42_arg0.cardName:setTopBottom( true, true, 0, 0 )
	f42_arg0.cardName:setFont( CoD.fonts.ExtraSmall )
	f42_arg0.cardName:setAlignment( LUI.Alignment.Left )
	f42_arg0.cardName:setText( f42_arg0.fileData.name )
	f42_arg0.cardName:setRGB( CoD.orange.r, CoD.orange.g, CoD.orange.b )
	f42_arg0.cardNameContainer:addElement( f42_arg0.cardName )
	if not f42_arg0:isInFocus() then
		f42_arg0.cardName:setRGB( 1, 1, 1 )
	end
end

CoD.Codtv.DWContentCardLoad = function ( f43_arg0, f43_arg1, f43_arg2 )
	if f43_arg1 == nil then
		f43_arg1 = {}
	end
	f43_arg0.text:setText( "" )
	f43_arg0.fileData = f43_arg1
	if (f43_arg0.fileData.fileID == nil or f43_arg0.fileData.fileID == "0") and f43_arg0.fileData.category ~= "ingamestore" then
		f43_arg0.fileData.fileID = "0"
		f43_arg0.fileData.name = Engine.Localize( "MENU_ERROR" )
		f43_arg0.fileData.description = Engine.Localize( "MENU_ERROR" )
	end
	if f43_arg0.fileData.durationInt == nil then
		f43_arg0.fileData.durationInt = 0
	end
	if f43_arg0.fileData.matchID == nil then
		f43_arg0.fileData.matchID = Engine.DefaultID64Value()
	end
	if f43_arg0.fileData.name == nil or f43_arg0.fileData.name == "" then
		if f43_arg1.gameTypeName ~= nil then
			f43_arg0.fileData.name = f43_arg1.gameTypeName
		else
			f43_arg0.fileData.name = ""
		end
	end
	if f43_arg0.fileData.category ~= nil and f43_arg0.fileData.category == "ingamestore" then
		CoD.Codtv.IngameStoreContentCardLoad( f43_arg0, f43_arg1, f43_arg2 )
		return 
	elseif f43_arg0.fileData.description == nil or f43_arg0.fileData.description == "" then
		if f43_arg0.fileData.category == "customgame" then
			f43_arg0.fileData.description = ""
		elseif f43_arg0.fileData.category ~= "emblem" then
			if not CoD.isZombie then
				if f43_arg1.mapName == nil then
					f43_arg1.mapName = "PRESENCE_UNKNOWN_MAP"
				end
				f43_arg0.fileData.description = Engine.Localize( "MENU_FILESHARE_GAMEONMAP", f43_arg1.gameTypeName, Engine.Localize( f43_arg1.mapName ) )
			elseif CoD.isZombie == true and f43_arg0.fileData.gameType == CoD.Zombie.GAMETYPE_ZCLASSIC then
				f43_arg0.fileData.description = ""
			else
				f43_arg0.fileData.description = f43_arg1.gameTypeName
				f43_arg0.fileData.description = Engine.Localize( "MENU_FILESHARE_GAMEONMAP", f43_arg0.fileData.description, f43_arg1.zmMapStartLocName )
			end
		else
			f43_arg0.fileData.description = ""
		end
	end
	if f43_arg0.fileData.fileID ~= "0" then
		local self = LUI.UIElement.new()
		self:setLeftRight( true, true, 2, -2 )
		self:setTopBottom( true, true, 2, -CoD.textSize.ExtraSmall - 4 )
		f43_arg0:addElement( self )
		f43_arg0.mapImage = LUI.UIImage.new()
		if f43_arg0.fileData.category == "emblem" then
			f43_arg0.mapImage:close()
			f43_arg0:setupCenterImage( nil, 100, 100, 1.9 )
			f43_arg0.mapImage = f43_arg0.centerImageContainer.centerImage
		else
			f43_arg0.mapImage:setLeftRight( true, true, 2, -2 )
			f43_arg0.mapImage:setTopBottom( true, true, 2, -CoD.textSize.ExtraSmall - 4 )
		end
		local f43_local1 = nil
		if not CoD.isZombie then
			if f43_arg0.fileData.category == "customgame" and f43_arg0.fileData.gameType ~= nil then
				f43_local1 = RegisterMaterial( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", f43_arg0.fileData.gameType, "image" ) )
				f43_arg0.mapImage:setLeftRight( false, false, -50, 50 )
				f43_arg0.mapImage:setTopBottom( false, false, -50, 50 )
			elseif f43_arg0.fileData.map ~= nil then
				f43_local1 = RegisterImage( CoD.GetMapValue( f43_arg0.fileData.map, "previewImage", "$black" ) )
			end
		elseif f43_arg0.fileData.zmMapStartLoc and f43_arg0.fileData.zmMapStartLoc ~= "default" then
			f43_local1 = RegisterMaterial( "menu_" .. CoD.Zombie.GetMapName( f43_arg0.fileData.map ) .. "_" .. Engine.StructTableLookupString( CoD.gametypesStructTable, "name", f43_arg0.fileData.gameType, "groupname" ) .. "_" .. f43_arg0.fileData.zmMapStartLoc )
			f43_arg0.mapImage:setRGB( 1, 1, 1 )
		else
			f43_arg0.mapImage:setRGB( 0, 0, 0 )
			f43_arg0.mapImage:setAlpha( 0.1 )
		end
		if f43_local1 ~= nil then
			f43_arg0.mapImage:setImage( f43_local1 )
		end
		if not f43_arg0.mapImage:getParent() then
			f43_arg0:addElement( f43_arg0.mapImage )
		end
		if f43_arg0.fileData.category ~= "screenshot" and f43_arg0.fileData.category ~= "emblem" and f43_arg0.fileData.category ~= "customgame" then
			local f43_local2 = LUI.UIImage.new()
			f43_local2:setLeftRight( false, true, -55, -8 )
			f43_local2:setTopBottom( true, false, 5, 5 + CoD.textSize.ExtraSmall )
			f43_local2:setRGB( 0, 0, 0 )
			f43_local2:setAlpha( 0.8 )
			f43_arg0:addElement( f43_local2 )
			f43_arg0.durationText = LUI.UIText.new()
			f43_arg0.durationText:setLeftRight( false, true, -55, -8 )
			f43_arg0.durationText:setTopBottom( true, false, 5, 5 + CoD.textSize.ExtraSmall )
			f43_arg0.durationText:setFont( CoD.fonts.ExtraSmall )
			f43_arg0.durationText:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
			f43_arg0.durationText:setAlignment( LUI.Alignment.Center )
			f43_arg0:addElement( f43_arg0.durationText )
			if f43_arg0.fileData.duration ~= nil then
				f43_arg0.durationText:setText( f43_arg0.fileData.duration )
			end
		end
		local f43_local2, f43_local3, f43_local4 = Engine.GetCombatRecordScreenshotInfo( f43_arg2, Engine.GetXUID64( f43_arg2 ) )
		if not (f43_arg0.fileData.category ~= "film" or f43_arg0.fileData.bookmarked ~= true) or not (f43_arg0.fileData.category ~= "film" or f43_arg0.fileData.isLiveStream ~= true) or f43_arg0.fileData.category == "screenshot" and f43_arg0.fileData.fileID == f43_local2 then
			f43_arg0.bookmark = LUI.UIImage.new()
			f43_arg0.bookmark:setLeftRight( true, false, 5, 37 )
			f43_arg0.bookmark:setTopBottom( true, false, 5, 37 )
			f43_arg0.bookmark:setImage( RegisterMaterial( "menu_mp_star_rating" ) )
			if f43_arg0.fileData.isLiveStream == true then
				if f43_arg0.fileData.isMetaDataValid == true then
					f43_arg0.bookmark:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
				else
					f43_arg0.bookmark:setRGB( CoD.green.r, CoD.green.g, CoD.green.b )
				end
			else
				f43_arg0.bookmark:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
			end
			f43_arg0.bookmark:setAlpha( 1 )
			f43_arg0:addElement( f43_arg0.bookmark )
		end
	end
	f43_arg0.cardNameContainer = LUI.UIElement.new()
	f43_arg0.cardNameContainer:setUseStencil( true )
	f43_arg0.cardNameContainer:setLeftRight( true, true, 5, 0 )
	f43_arg0.cardNameContainer:setTopBottom( false, true, -CoD.textSize.ExtraSmall - 2, -2 )
	f43_arg0:addElement( f43_arg0.cardNameContainer )
	f43_arg0.cardName = LUI.UIText.new()
	f43_arg0.cardName:setLeftRight( true, true, 0, 0 )
	f43_arg0.cardName:setTopBottom( true, true, 0, 0 )
	f43_arg0.cardName:setFont( CoD.fonts.ExtraSmall )
	f43_arg0.cardName:setAlignment( LUI.Alignment.Left )
	if true == Dvar.fshFileDebug:get() then
		local self = f43_arg0.fileData.fileID
		if f43_arg0.fileData.originID ~= nil then
			self = self .. " / " .. f43_arg0.fileData.originID
		end
		f43_arg0.cardName:setText( self )
	else
		f43_arg0.cardName:setText( f43_arg0.fileData.name )
	end
	f43_arg0.cardName:setRGB( CoD.orange.r, CoD.orange.g, CoD.orange.b )
	f43_arg0.cardNameContainer:addElement( f43_arg0.cardName )
	if not f43_arg0:isInFocus() then
		f43_arg0.cardName:setRGB( 1, 1, 1 )
		if f43_arg0.durationText ~= nil then
			f43_arg0.durationText:setRGB( 1, 1, 1 )
		end
	end
end

CoD.Codtv.UpdateIngameStorePurchaseElement = function ( f44_arg0, f44_arg1 )
	local f44_local0 = Engine.IsOfferPurchased( f44_arg1.controller, f44_arg0.fileData.offerid, f44_arg0.fileData.storeContentType )
	if f44_local0 ~= nil then
		f44_arg0.fileData.isOfferPurchased = f44_local0
		if f44_arg0:isInFocus() then
			CoD.Codtv.ShowIngameStorePanel( f44_arg0 )
			CoD.Codtv.InGameStoreUpdateAButtonPromptString( f44_arg0, f44_arg1 )
		end
	end
end

CoD.Codtv.ReloadInGameStoreMenu = function ( f45_arg0, f45_arg1 )
	if f45_arg0:isInFocus() then
		f45_arg0.codtv:reload( f45_arg0.codtv.m_rootFolderIndex )
	end
end

CoD.Codtv.EmblemDownloaded = function ( f46_arg0, f46_arg1 )
	if f46_arg0.fileData.fileID == f46_arg1.fileID then
		f46_arg0.emblemDownloaded = true
	end
end

CoD.Codtv.DWContentCardsCreate = function ( f47_arg0, f47_arg1, f47_arg2 )
	if f47_arg0 ~= nil then
		if f47_arg1.numresults > CoD.Codtv.CardsPerPage then
			f47_arg1.numresults = CoD.Codtv.CardsPerPage
		end
		for f47_local0 = 1, f47_arg1.numresults, 1 do
			local f47_local3 = CoD.Codtv.GetGenericCard( f47_arg0 )
			f47_local3.type = "dwcontent"
			f47_local3.folderIndex = f47_arg2
			CoD.Codtv.DWContentCardLoad( f47_local3, f47_arg1[f47_local0], f47_arg1.controller )
			if f47_local3.fileData.category == "ingamestore" then
				f47_local3:registerEventHandler( "refresh_offers_data", CoD.Codtv.UpdateIngameStorePurchaseElement )
				f47_local3:registerEventHandler( "reload_store_menu", CoD.Codtv.ReloadInGameStoreMenu )
			end
			if f47_local3.fileData.category == "emblem" then
				f47_local3:registerEventHandler( "emblemDownloaded", CoD.Codtv.EmblemDownloaded )
				f47_local3.text:setText( Engine.Localize( "MENU_EMBLEM_DEFAULT_TITLE" ) )
			end
			f47_local3:registerEventHandler( "card_load_content", CoD.Codtv.DWContentCardLoad )
			f47_local3:registerEventHandler( "card_vote", CoD.Codtv.DWContentCardVote )
			f47_local3:registerEventHandler( "card_report", CoD.Codtv.DWContentCardReport )
			f47_local3:registerEventHandler( "card_save", CoD.Codtv.DWContentCardSave )
			f47_local3:registerEventHandler( "fileshare_summary_downloaded", CoD.Codtv.DWContentCardSummaryDownloaded )
		end
	end
end

CoD.Codtv.DWFolderCardAddNextPrev = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3, f48_arg4, f48_arg5 )
	local f48_local0 = CoD.Codtv.GetGenericCard( f48_arg0 )
	f48_local0.bg:close()
	f48_local0.text:close()
	f48_local0.border:close()
	f48_local0.disableGrowShrink = true
	local self = LUI.UIElement.new()
	self:setTopBottom( true, false, 12, 72 )
	self:setUseStencil( true )
	f48_local0:addElement( self )
	local f48_local2 = LUI.UIImage.new()
	f48_local2:setImage( RegisterMaterial( "menu_next_prev_arrow" ) )
	f48_local2:setTopBottom( true, true, 0, 0 )
	f48_local2:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	f48_local2:setAlpha( 0 )
	f48_local0.arrowBg = f48_local2
	self:addElement( f48_local2 )
	local f48_local3 = LUI.UIImage.new()
	f48_local3:setImage( RegisterMaterial( "menu_next_prev_arrow_black" ) )
	f48_local3:setTopBottom( true, true, 2, -2 )
	f48_local0.arrow = f48_local3
	self:addElement( f48_local3 )
	local f48_local4 = LUI.UIText.new()
	f48_local4:setLeftRight( true, true, 10, -10 )
	f48_local4:setTopBottom( true, false, 22, 22 + CoD.textSize.Default )
	f48_local4:setText( f48_arg5 )
	f48_local4:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f48_local0.arrowText = f48_local4
	self:addElement( f48_local4 )
	f48_local0.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	f48_local0.spinner:setTopBottom( true, false, 80, 144 )
	f48_local0.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	f48_local0.spinner:setAlpha( 0 )
	f48_local0:addElement( f48_local0.spinner )
	if f48_arg4 == "dwfolder_prev" then
		self:setLeftRight( false, true, -146, -20 )
		f48_local0.spinner:setLeftRight( false, true, -89, -25 )
		f48_local4:setAlignment( LUI.Alignment.Right )
		f48_local3:setLeftRight( false, true, 0, -128 )
		f48_local2:setLeftRight( false, true, 0, -128 )
	else
		self:setLeftRight( true, false, 10, 136 )
		f48_local0.spinner:setLeftRight( true, false, 25, 89 )
		f48_local4:setAlignment( LUI.Alignment.Left )
		f48_local3:setLeftRight( true, false, 0, 128 )
		f48_local2:setLeftRight( true, false, 0, 128 )
	end
	f48_local0.type = f48_arg4
	f48_local0.folderIndex = f48_arg2
	f48_local0.startIndex = f48_arg3
	f48_local0:registerEventHandler( "fileshare_search_complete", CoD.Codtv.DWFolderCardSearchCompleted )
end

CoD.Codtv.DWFolderCardNextPrevSelected = function ( f49_arg0, f49_arg1 )
	f49_arg0.spinner:setAlpha( 1 )
	f49_arg0.m_dataRequested = true
	Engine.LoadCodtvDWContent( f49_arg0.codtv.m_ownerController, f49_arg0.folderIndex, f49_arg0.startIndex, f49_arg0.codtv.userData )
end

CoD.Codtv.DWFolderCardNextPrevGainFocus = function ( f50_arg0, f50_arg1 )
	f50_arg0.arrowBg:setAlpha( 1 )
	f50_arg0.arrowText:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	if f50_arg0.type == "dwfolder_prev" then
		f50_arg0.arrow:setLeftRight( false, true, -2, -126 )
	else
		f50_arg0.arrow:setLeftRight( true, false, 2, 126 )
	end
	f50_arg0.disableGrowShrink = true
end

CoD.Codtv.DWFolderCardNextPrevLoseFocus = function ( f51_arg0, f51_arg1 )
	f51_arg0.arrowBg:setAlpha( 0 )
	f51_arg0.arrowText:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	if f51_arg0.type == "dwfolder_prev" then
		f51_arg0.arrow:setLeftRight( false, true, 0, -128 )
	else
		f51_arg0.arrow:setLeftRight( true, false, 0, 128 )
	end
	f51_arg0.disableGrowShrink = true
end

CoD.Codtv.SetupDWCardNoData = function ( f52_arg0 )
	if f52_arg0 == nil then
		return 
	elseif f52_arg0.text ~= nil then
		f52_arg0.text:setText( Engine.Localize( "MENU_NO_DATA" ) )
	end
	if f52_arg0.spinner ~= nil then
		f52_arg0.spinner:setAlpha( 0 )
	end
	if f52_arg0.codtv ~= nil and f52_arg0.codtv.hintText ~= nil then
		if f52_arg0.codtv.m_rootRef == "ingamestore" then
			f52_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_STORE_EMPTY" ) )
		else
			f52_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_CODTV_FOLDER_EMPTY_HINT" ) )
		end
	end
	if f52_arg0.textBackground ~= nil then
		f52_arg0.textBackground:show()
	end
end

CoD.Codtv.SetCardIndexForMTXCarousel = function ( f53_arg0, f53_arg1 )
	if CoD.isPS3 == true and f53_arg0.codtv.m_rootRef == "ingamestore" then
		local f53_local0 = Engine.DvarInt( nil, "ui_mtxid" )
		if f53_local0 ~= CoD.Codtv.INVALID_MTX_ID then
			local f53_local1 = Engine.GetPS3MTXProductIndex( f53_local0 )
			if CoD.Codtv.CardsPerPage <= f53_arg1.startIndex + f53_local1 then
				f53_arg0.startIndex = f53_local1
				f53_arg1.startIndex = f53_local1
				f53_arg0.isItemOnFirstPage = false
				Engine.LoadCodtvDWContent( f53_arg0.codtv.m_ownerController, f53_arg0.folderIndex, f53_arg0.startIndex, f53_arg0.codtv.userData )
				Engine.SetDvar( "ui_mtxid", CoD.Codtv.INVALID_MTX_ID )
				return false
			end
			f53_arg0.cardCarousel.horizontalList.m_currentCardIndex = f53_local1 + 1
			Engine.SetDvar( "ui_mtxid", CoD.Codtv.INVALID_MTX_ID )
		end
	end
	return true
end

CoD.Codtv.DWFolderCardSearchCompleted = function ( f54_arg0, f54_arg1 )
	if f54_arg0.folderIndex == f54_arg1.contextid and f54_arg0.m_dataRequested == true then
		if f54_arg1.numresults == 0 then
			CoD.Codtv.SetupDWCardNoData( f54_arg0 )
		else
			if CoD.Codtv.SetCardIndexForMTXCarousel( f54_arg0, f54_arg1 ) == false then
				return 
			end
			local f54_local0 = f54_arg0.cardCarousel
			local f54_local1 = f54_arg0.folderIndex
			f54_local0:clearAllItems()
			Engine.Exec( f54_arg0.codtv.m_ownerController, "resetThumbnailViewer" )
			if f54_arg1.startIndex > 0 then
				local f54_local2 = f54_arg1.startIndex - CoD.Codtv.CardsPerPage
				if f54_local2 < 0 then
					f54_local2 = 0
				end
				CoD.Codtv.DWFolderCardAddNextPrev( f54_local0, f54_arg0.src, f54_arg0.folderIndex, f54_local2, "dwfolder_prev", Engine.Localize( "MENU_PREVIOUS" ) )
			end
			if f54_arg1.numresults > 0 then
				CoD.Codtv.DWContentCardsCreate( f54_local0, f54_arg1, f54_local1 )
			end
			local f54_local2 = f54_arg1.startIndex + f54_arg1.numresults
			if f54_arg1.totalFiles - f54_local2 > 0 then
				CoD.Codtv.DWFolderCardAddNextPrev( f54_local0, f54_arg0.src, f54_arg0.folderIndex, f54_local2, "dwfolder_next", Engine.Localize( "MENU_NEXT" ) )
			end
			if f54_arg0.type == "dwfolder_next" then
				f54_local0.horizontalList.m_currentCardIndex = 1
			elseif f54_arg0.type == "dwfolder_prev" then
				f54_local0.horizontalList.m_currentCardIndex = #f54_local0.horizontalList.cards
			elseif f54_arg0.type == "dwfolder" and f54_arg0.isItemOnFirstPage ~= nil and f54_arg0.isItemOnFirstPage == false then
				f54_local0.horizontalList.m_currentCardIndex = 2
				f54_arg0.isItemOnFirstPage = nil
			end
			f54_local0.cardCarouselList:focusCurrentCardCarousel( f54_arg1.controller )
		end
	end
end

CoD.Codtv.DWFolderCardSelected = function ( f55_arg0, f55_arg1 )
	
end

CoD.Codtv.DWFolderCardGainFocus = function ( f56_arg0, f56_arg1 )
	f56_arg0.codtv.rightButtonPromptBar:removeAllChildren()
	f56_arg0.codtv.leftButtonPromptBar:removeAllChildren()
	f56_arg0.codtv:addBackButton()
	f56_arg0.text:setText( "" )
	f56_arg0.spinner:setAlpha( 1 )
	f56_arg0.textBackground:hide()
end

CoD.Codtv.DWFolderCardLoseFocus = function ( f57_arg0, f57_arg1 )
	
end

CoD.Codtv.DWFolderCardsLoad = function ( f58_arg0, f58_arg1, f58_arg2 )
	local f58_local0 = CoD.Codtv.GetGenericCard( f58_arg0 )
	f58_local0.text:setText( "" )
	f58_local0.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	f58_local0.spinner:setLeftRight( false, false, -32, 32 )
	f58_local0.spinner:setTopBottom( false, false, -32, 32 )
	f58_local0.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	f58_local0.spinner:setAlpha( 1 )
	f58_local0:addElement( f58_local0.spinner )
	f58_local0.textBackground = LUI.UIImage.new( {
		material = RegisterMaterial( "menu_theater_nodata" )
	} )
	f58_local0.textBackground:setLeftRight( false, false, -64, 64 )
	f58_local0.textBackground:setTopBottom( false, false, -64, 64 )
	f58_local0.textBackground:setAlpha( 1 )
	f58_local0.textBackground:setPriority( -100 )
	f58_local0:addElement( f58_local0.textBackground )
	f58_local0.textBackground:hide()
	f58_local0.type = "dwfolder"
	f58_local0.folderIndex = f58_arg2
	f58_local0:registerEventHandler( "fileshare_search_complete", CoD.Codtv.DWFolderCardSearchCompleted )
end

CoD.Codtv.CustomButtonFileManagerSelected = function ( f59_arg0, f59_arg1 )
	f59_arg0.codtv:openPopup( "FileshareManager", f59_arg1.controller )
end

CoD.Codtv.CustomButtonNewEmblemSelected = function ( f60_arg0, f60_arg1 )
	if f60_arg0.codtv.m_emblemSlotsRemaining > 0 and f60_arg0.codtv.m_embemNextSlot ~= nil then
		f60_arg0.codtv.m_previousFolderIndex = nil
		if Engine.IsFeatureBanned( CoD.FEATURE_BAN_EMBLEM_EDITOR ) then
			Engine.ExecNow( f60_arg1.controller, "banCheck " .. CoD.FEATURE_BAN_EMBLEM_EDITOR )
			return 
		end
		CoD.perController[f60_arg1.controller].emblemSaveSlot = f60_arg0.codtv.m_embemNextSlot
		CoD.perController[f60_arg1.controller].emblemFileID = nil
		CoD.Codtv.Shutdown()
		f60_arg0.codtv:close()
	end
end

CoD.Codtv.CustomButtonBuyStorageSelected = function ( f61_arg0, f61_arg1 )
	if Engine.IsGuest( f61_arg1.controller ) then
		f61_arg0:dispatchEventToParent( {
			name = "open_no_guest_mtx",
			controller = f61_arg1.controller
		} )
	elseif CoD.isPS3 then
		f61_arg0:dispatchEventToParent( {
			name = "open_mtx_purchase",
			controller = f61_arg1.controller,
			userData = {
				mtxName = Dvar.fshMtxName:get(),
				openingMenuName = "codtv"
			}
		} )
	else
		Engine.SetStartCheckoutTimestampUTC()
		Engine.PurchaseMTX( f61_arg1.controller, Dvar.fshMtxName:get(), "codtv" )
	end
end

CoD.Codtv.CustomButtonCardSelected = function ( f62_arg0, f62_arg1 )
	if f62_arg0.customAction ~= nil then
		if f62_arg0.customAction == "filemanager" then
			CoD.Codtv.CustomButtonFileManagerSelected( f62_arg0, f62_arg1 )
		elseif f62_arg0.customAction == "newemblem" then
			CoD.Codtv.CustomButtonNewEmblemSelected( f62_arg0, f62_arg1 )
		elseif f62_arg0.customAction == "buystorage" then
			CoD.Codtv.CustomButtonBuyStorageSelected( f62_arg0, f62_arg1 )
		end
	end
end

CoD.Codtv.CustomButtonNewEmblemGainFocus = function ( f63_arg0, f63_arg1 )
	f63_arg0.codtv.rightButtonPromptBar:removeAllChildren()
	f63_arg0.codtv.leftButtonPromptBar:removeAllChildren()
	f63_arg0.codtv:addBackButton()
	if f63_arg0.codtv.m_emblemSlotsOccupied ~= nil and f63_arg0.codtv.m_emblemSlotsRemaining ~= nil then
		local f63_local0 = f63_arg0.codtv.m_emblemSlotsOccupied + f63_arg0.codtv.m_emblemSlotsRemaining
		if f63_arg0.codtv.m_emblemSlotsRemaining > 0 then
			f63_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_NEW_EMBLEM_HINT_SLOTS", f63_arg0.codtv.m_emblemSlotsOccupied, f63_local0 ) )
			f63_arg0.codtv:addSelectButton()
		elseif CoD.FileshareManager.ShouldShowMtx( f63_arg1.controller ) then
			f63_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_NEW_EMBLEM_HINT_FULL_MTX", f63_arg0.codtv.m_emblemSlotsOccupied, f63_local0 ) )
			f63_arg0.codtv.hintText:updateHintColor( {
				r = CoD.red.r,
				g = CoD.red.g,
				b = CoD.red.b,
				a = 1
			} )
		else
			f63_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_NEW_EMBLEM_HINT_FULL", f63_arg0.codtv.m_emblemSlotsOccupied, f63_local0 ) )
			f63_arg0.codtv.hintText:updateHintColor( {
				r = CoD.red.r,
				g = CoD.red.g,
				b = CoD.red.b,
				a = 1
			} )
		end
	else
		f63_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_NEW_EMBLEM_HINT" ) )
		f63_arg0.codtv:addSelectButton()
	end
end

CoD.Codtv.CustomButtonBuyStorageGainFocus = function ( f64_arg0, f64_arg1 )
	f64_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_MTX_MEDIA_STORAGE_DESC" ) )
	f64_arg0.codtv.rightButtonPromptBar:removeAllChildren()
	f64_arg0.codtv.leftButtonPromptBar:removeAllChildren()
	f64_arg0.codtv:addBackButton()
	f64_arg0.codtv:addSelectButton()
end

CoD.Codtv.CustomButtonGainFocus = function ( f65_arg0, f65_arg1 )
	if f65_arg0.customAction ~= nil then
		if f65_arg0.customAction == "newemblem" then
			CoD.Codtv.CustomButtonNewEmblemGainFocus( f65_arg0, f65_arg1 )
		elseif f65_arg0.customAction == "buystorage" then
			CoD.Codtv.CustomButtonBuyStorageGainFocus( f65_arg0, f65_arg1 )
		end
	end
end

CoD.Codtv.PlayTimer = nil
CoD.Codtv.VideoCardPlay = function ( f66_arg0, f66_arg1 )
	if CoD.Codtv.WebMPlayback ~= nil and Engine.WebM_IsBuffered( CoD.Codtv.WebMPlayback ) then
		Engine.WebM_Play( CoD.Codtv.WebMPlayback )
		f66_arg0.webmVideo:setAlpha( 1 )
		if f66_arg0.webmImage ~= nil then
			f66_arg0.webmImage:setAlpha( 0 )
		end
		Engine.PlayMenuMusic( "" )
	else
		if CoD.Codtv.PlayTimer ~= nil then
			CoD.Codtv.PlayTimer:close()
			CoD.Codtv.PlayTimer = nil
		end
		f66_arg0:registerEventHandler( "webm_video_play", CoD.Codtv.VideoCardPlay )
		CoD.Codtv.PlayTimer = LUI.UITimer.new( 250, "webm_video_play", true )
		f66_arg0:addElement( CoD.Codtv.PlayTimer )
	end
end

CoD.Codtv.VideoCardClearPlayback = function ( f67_arg0 )
	if f67_arg0 ~= nil then
		f67_arg0.webmVideo:setAlpha( 0 )
		if f67_arg0.webmImage ~= nil then
			f67_arg0.webmImage:setAlpha( 1 )
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

CoD.Codtv.VideoCardAutoPlay = function ( f68_arg0, f68_arg1 )
	if f68_arg0:isInFocus() and f68_arg0.url ~= "" and f68_arg0.m_thumbnailReady == true then
		CoD.Codtv.VideoCardClearPlayback()
		CoD.Codtv.WebMPlayback = Engine.WebM_Open( f68_arg0.url .. "_low.webm", CoD.Codtv.WebMPlaybackMaterial )
		CoD.Codtv.VideoCardPlay( f68_arg0 )
	end
end

CoD.Codtv.VideoCardDownloadThumbnailCheck = function ( f69_arg0, f69_arg1 )
	if f69_arg0.thumbnailDownloadTimer then
		f69_arg0.thumbnailDownloadTimer:close()
		f69_arg0.thumbnailDownloadTimer = nil
	end
	if f69_arg0.m_webmThumbIndex ~= nil and Engine.Url_Load_IsDone( f69_arg0.m_webmThumbIndex ) then
		f69_arg0.spinner:setAlpha( 0 )
		f69_arg0.webmImage:setAlpha( 1 )
		f69_arg0.m_thumbnailReady = true
	else
		f69_arg0.thumbnailDownloadTimer = LUI.UITimer.new( CoD.Codtv.ThumbnailDownloadCheckInterval, "download_thumbnail_check", true )
		f69_arg0:addElement( f69_arg0.thumbnailDownloadTimer )
	end
end

CoD.Codtv.VideoCardSelected = function ( f70_arg0, f70_arg1 )
	local f70_local0 = Engine.Url_Load_MeasureDownloadBandwidth( "akamai://rand.bin" )
	if string.sub( f70_arg0.url, -2, -2 ) == "_" or f70_local0 ~= -1 then
		if f70_arg0.autoPlayTimer ~= nil then
			f70_arg0.autoPlayTimer:close()
			f70_arg0.autoPlayTimer = nil
		end
		CoD.Codtv.VideoCardClearPlayback()
		f70_arg0.webmVideo:setAlpha( 0 )
		f70_arg0.webmImage:setAlpha( 1 )
		local f70_local1 = f70_arg0.url .. "_low.webm"
		local f70_local2 = "ps3"
		if CoD.isXBOX then
			f70_local2 = "xbox"
		end
		if f70_local0 > 524288 then
			f70_local1 = f70_arg0.url .. "_" .. f70_local2 .. "_4.webm"
		elseif f70_local0 > 393216 then
			f70_local1 = f70_arg0.url .. "_" .. f70_local2 .. "_3.webm"
		elseif f70_local0 > 262144 then
			f70_local1 = f70_arg0.url .. "_" .. f70_local2 .. "_2.webm"
		elseif f70_local0 > 131072 then
			f70_local1 = f70_arg0.url .. "_" .. f70_local2 .. "_1.webm"
		end
		if string.sub( f70_arg0.url, -2, -2 ) == "_" then
			f70_local1 = f70_arg0.url .. ".webm"
		end
		CoD.Codtv.WebMPlayback = Engine.WebM_Open( f70_local1, CoD.Codtv.WebMPlaybackMaterial )
		CoD.Codtv.VideoCardPlay( f70_arg0.codtv:openPopup( "Video_Player", f70_arg1.controller ) )
	end
end

CoD.Codtv.VideoCardGainFocus = function ( f71_arg0, f71_arg1 )
	f71_arg0.codtv.rightButtonPromptBar:removeAllChildren()
	f71_arg0.codtv.leftButtonPromptBar:removeAllChildren()
	f71_arg0.codtv:addBackButton()
	f71_arg0.codtv:addSelectButton()
	f71_arg0.autoPlayTimer = LUI.UITimer.new( CoD.Codtv.AutoPlayRetryDelay, "auto_play", true )
	f71_arg0:addElement( f71_arg0.autoPlayTimer )
end

CoD.Codtv.VideoCardLoseFocus = function ( f72_arg0, f72_arg1 )
	if f72_arg0.autoPlayTimer ~= nil then
		f72_arg0.autoPlayTimer:close()
	end
	CoD.Codtv.VideoCardClearPlayback()
	f72_arg0.webmVideo:setAlpha( 0 )
	if f72_arg0.m_thumbnailReady then
		f72_arg0.webmImage:setAlpha( 1 )
	else
		f72_arg0.webmImage:setAlpha( 0 )
	end
	Engine.PlayMenuMusic( "mus_mp_frontend" )
end

CoD.Codtv.VideoCardsLoad = function ( f73_arg0, f73_arg1 )
	if f73_arg1.videoCount > CoD.Codtv.MaxWebMMaterials then
		f73_arg1.videoCount = CoD.Codtv.MaxWebMMaterials
	end
	Engine.Url_Load_Init()
	Engine.Url_Load_MeasureDownloadBandwidth( "akamai://rand.bin" )
	Engine.Url_Load_Jpeg( "dummy://none", CoD.Codtv.WebMPlaybackMaterial )
	for f73_local0 = 1, f73_arg1.videoCount, 1 do
		local f73_local3 = CoD.Codtv.GetGenericCard( f73_arg0 )
		f73_local3.text:setText( f73_arg1[f73_local0].name )
		f73_local3.type = "video"
		f73_local3.url = f73_arg1[f73_local0].url
		f73_local3.webmVideo = LUI.UIImage.new()
		f73_local3.webmVideo:setLeftRight( true, true, 2, -2 )
		f73_local3.webmVideo:setTopBottom( true, true, 2, -28 )
		f73_local3.webmVideo:setAlpha( 0 )
		f73_local3.webmVideo:setImage( RegisterMaterial( CoD.Codtv.WebMPlaybackMaterial ) )
		f73_local3:addElement( f73_local3.webmVideo )
		f73_local3.webmImage = LUI.UIImage.new()
		f73_local3.webmImage:setLeftRight( true, true, 2, -2 )
		f73_local3.webmImage:setTopBottom( true, true, 2, -28 )
		f73_local3.webmImage:setAlpha( 0 )
		f73_local3.spinner = LUI.UIImage.new( {
			shaderVector0 = {
				0,
				0,
				0,
				0
			}
		} )
		f73_local3.spinner:setLeftRight( false, false, -32, 32 )
		f73_local3.spinner:setTopBottom( false, false, -32, 32 )
		f73_local3.spinner:setImage( RegisterMaterial( "lui_loader" ) )
		f73_local3.spinner:setAlpha( 0 )
		f73_local3:addElement( f73_local3.spinner )
		f73_local3.spinner:setAlpha( 1 )
		local f73_local4 = CoD.Codtv.WebMGetMaterial( f73_local0 )
		if f73_local4 ~= nil then
			f73_local3.webmImage:setImage( RegisterMaterial( f73_local4 ) )
		end
		f73_local3:addElement( f73_local3.webmImage )
		f73_local3.m_webmThumbIndex = nil
		f73_local3.m_thumbnailReady = false
		f73_local3:registerEventHandler( "download_thumbnail_check", CoD.Codtv.VideoCardDownloadThumbnailCheck )
		f73_local3:registerEventHandler( "auto_play", CoD.Codtv.VideoCardAutoPlay )
	end
end

CoD.Codtv.IsStoreContentFetching = function ( f74_arg0, f74_arg1 )
	if Engine.LoadCodtvDWContent( f74_arg0.codtv.m_ownerController, f74_arg0.folderIndex, f74_arg0.offset, f74_arg0.codtv.userData ) then
		f74_arg1.timer:close()
	end
end

CoD.Codtv.GetStoreContent = function ( f75_arg0, f75_arg1 )
	f75_arg0:registerEventHandler( "fetching_store_content_done", CoD.Codtv.IsStoreContentFetching )
	f75_arg0.offset = f75_arg1
	f75_arg0:addElement( LUI.UITimer.new( 1000, "fetching_store_content_done", false ) )
end

CoD.Codtv.CarouselGainFocus = function ( f76_arg0, f76_arg1 )
	local f76_local0 = f76_arg0.cards[1]
	if f76_local0 ~= nil then
		if f76_local0.type == "video" then
			for f76_local1 = 1, #f76_arg0.cards, 1 do
				local f76_local4 = f76_arg0.cards[f76_local1]
				local f76_local5 = CoD.Codtv.WebMGetMaterial( f76_local4.cardIndex )
				f76_local4.webmImage:setAlpha( 0 )
				f76_local4.m_thumbnailReady = false
				f76_local4.spinner:setAlpha( 1 )
				if f76_local5 ~= nil then
					Engine.WebM_Clear( f76_local5 )
					if f76_local4.url ~= "" then
						f76_local4.m_webmThumbIndex = Engine.Url_Load_Jpeg( f76_local4.url .. "_thumb.jpg", f76_local5 )
						if f76_local4.thumbnailDownloadTimer ~= nil then
							f76_local4.thumbnailDownloadTimer:close()
						end
						f76_local4.thumbnailDownloadTimer = LUI.UITimer.new( CoD.Codtv.ThumbnailDownloadCheckInterval, "download_thumbnail_check", true )
						f76_local4:addElement( f76_local4.thumbnailDownloadTimer )
					end
				end
			end
		elseif f76_local0.type == "dwfolder" then
			if f76_local0.codtv.m_rootRef == "ingamestore" then
				CoD.Codtv.GetStoreContent( f76_local0, 0 )
			else
				Engine.LoadCodtvDWContent( f76_local0.codtv.m_ownerController, f76_local0.folderIndex, 0, f76_local0.codtv.userData )
			end
			f76_local0.m_dataRequested = true
		else
			for f76_local1 = 1, #f76_arg0.cards, 1 do
				local f76_local4 = f76_arg0.cards[f76_local1]
				if f76_local4.type == "dwcontent" and f76_local4.fileData ~= nil and f76_local4.fileData.fileID ~= "0" then
					if f76_local4.fileData.category == "ingamestore" then
						f76_local4.mapImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_MOTD, f76_local4.fileData.fileID )
						Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_MOTD, f76_local4.fileData.fileID, 1 )
					end
					if f76_local4.fileData.summarySize > 0 and (f76_local4.fileData.category == "clip" or f76_local4.fileData.category == "screenshot") then
						f76_local4.mapImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, f76_local4.fileData.fileID )
						Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, f76_local4.fileData.fileID, f76_local4.fileData.summarySize )
					end
					if f76_local4.fileData.fileSize > 0 and f76_local4.fileData.category == "emblem" then
						f76_local4.mapImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_EMBLEM, f76_local4.fileData.fileID )
						if Engine.DvarBool( nil, "checkEmblemForRank" ) then
							Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_EMBLEM, f76_local4.fileData.fileID, f76_local4.fileData.fileSize, f76_local4.fileData.authorXuid )
						else
							Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_EMBLEM, f76_local4.fileData.fileID, f76_local4.fileData.fileSize )
						end
					end
					if f76_local4.mapImage ~= nil then
						f76_local4.mapImage:setupUIImage()
					end
				end
			end
		end
	end
	CoD.CardCarousel.HorizontalListGainFocus( f76_arg0, f76_arg1 )
end

CoD.Codtv.CarouselLoseFocus = function ( f77_arg0, f77_arg1 )
	local f77_local0 = f77_arg0.cards[1]
	local f77_local1 = f77_arg0.cards[#f77_arg0.cards]
	if f77_local0.type == "video" then
		for f77_local2 = 1, #f77_arg0.cards, 1 do
			local f77_local5 = f77_arg0.cards[f77_local2]
			f77_local5.webmImage:setAlpha( 0 )
			f77_local5.m_thumbnailReady = false
			f77_local5.spinner:setAlpha( 1 )
			if f77_local5.thumbnailDownloadTimer ~= nil then
				f77_local5.thumbnailDownloadTimer:close()
			end
			local f77_local6 = CoD.Codtv.WebMGetMaterial( f77_local5.cardIndex )
			if f77_local6 ~= nil then
				Engine.WebM_Clear( f77_local6 )
			end
		end
	end
	if f77_local0.type == "dwfolder_prev" then
		f77_local0.m_dataRequested = false
		f77_local0.spinner:setAlpha( 0 )
	end
	if f77_local1.type == "dwfolder_next" then
		f77_local1.m_dataRequested = false
		f77_local1.spinner:setAlpha( 0 )
	end
	if f77_local0.codtv.m_rootRef == "ingamestore" and CoD.isPS3 == true then
		local f77_local2 = f77_local0.codtv
		local f77_local3 = f77_local2.m_cardCarouselList.cardCarousels[f77_local2.m_cardCarouselList.m_currentCardCarouselIndex]
		local f77_local4 = f77_local0.folderIndex
		f77_local3:clearAllItems()
		local f77_local7 = Engine.GetCodtvContent( f77_local4 )
		if f77_local7 ~= nil and f77_local7.type == "dwfolder" then
			CoD.Codtv.DWFolderCardsLoad( f77_local3, f77_local7, f77_local4 )
		end
	end
	CoD.CardCarousel.HorizontalListLoseFocus( f77_arg0, f77_arg1 )
	Engine.Exec( f77_arg1.controller, "fileshareAbortSummary" )
	Engine.Exec( f77_arg1.controller, "resetThumbnailViewer" )
	Engine.PlayMenuMusic( "mus_mp_frontend" )
end

CoD.Codtv.CarouselSimulateMove = function ( f78_arg0, f78_arg1, f78_arg2 )
	local f78_local0 = f78_arg0.cardCarousels[f78_arg0.m_currentCardCarouselIndex]
	local f78_local1 = f78_local0.horizontalList.cards[f78_local0.horizontalList.m_currentCardIndex]
	f78_arg0:processEvent( {
		name = "gamepad_button",
		button = f78_arg1,
		controller = f78_arg2,
		down = true,
		immediate = true
	} )
	f78_arg0:processEvent( {
		name = "gamepad_button",
		button = f78_arg1,
		controller = f78_arg2,
		down = false,
		immediate = true
	} )
	CoD.perController[f78_arg2].fileActionInfo = f78_local0.horizontalList.cards[f78_local0.horizontalList.m_currentCardIndex].fileData
end

CoD.Codtv.CarouselMoveNext = function ( f79_arg0, f79_arg1 )
	CoD.Codtv.CarouselSimulateMove( f79_arg0, "right", f79_arg1.controller )
end

CoD.Codtv.CarouselMovePrev = function ( f80_arg0, f80_arg1 )
	CoD.Codtv.CarouselSimulateMove( f80_arg0, "left", f80_arg1.controller )
end

CoD.Codtv.GetCarouselList = function ( f81_arg0, f81_arg1 )
	local f81_local0 = nil
	if f81_arg0 ~= nil then
		f81_local0 = f81_arg0.m_ownerController
	end
	local f81_local1 = CoD.CardCarouselList.new( nil, f81_local0, CoD.Codtv.ItemWidth, CoD.Codtv.ItemHeight, CoD.Codtv.HighlightedItemWidth, CoD.Codtv.HighligtedItemHeight, {
		hintTextLeft = 353,
		hintTextWidth = 510,
		hintTextTop = -32
	} )
	local f81_local2 = CoD.textSize.Big + 10
	f81_local1:setLeftRight( true, true, 0, 0 )
	f81_local1:setTopBottom( true, true, f81_local2, 0 )
	f81_local1.titleListContainer.spacing = 0
	f81_local1.titleListContainer:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = -CoD.CoD9Button.Height,
		topAnchor = true,
		bottomAnchor = false,
		top = f81_local1.cardCarouselSize + 90,
		bottom = 0
	} )
	f81_local1.titleListContainer:animateToState( "default" )
	f81_local1:registerEventHandler( "move_next", CoD.Codtv.CarouselMoveNext )
	f81_local1:registerEventHandler( "move_prev", CoD.Codtv.CarouselMovePrev )
	if f81_arg0 ~= nil then
		for f81_local3 = 1, f81_arg1.subfolderCount, 1 do
			if f81_arg1[f81_local3] ~= nil then
				local f81_local6 = f81_arg1[f81_local3].name
				local f81_local7 = f81_arg1[f81_local3].folderIndex
				local f81_local8 = Engine.GetCodtvContent( f81_local7 )
				local f81_local9 = f81_local1:addCardCarousel( Engine.ToUpper( f81_local6 ) )
				f81_local9.codtv = f81_arg0
				if f81_local8 ~= nil then
					if f81_local8.type == "folder" then
						CoD.Codtv.FolderCardsLoad( f81_local0, f81_local9, f81_local8 )
					elseif f81_local8.type == "videofolder" then
						CoD.Codtv.VideoCardsLoad( f81_local9, f81_local8 )
					elseif f81_local8.type == "dwfolder" then
						CoD.Codtv.DWFolderCardsLoad( f81_local9, f81_local8, f81_local7 )
					end
				end
				f81_local9.horizontalList:registerEventHandler( "gain_focus", CoD.Codtv.CarouselGainFocus )
				f81_local9.horizontalList:registerEventHandler( "lose_focus", CoD.Codtv.CarouselLoseFocus )
				local f81_local10 = f81_local1.cardCarouselSize + 50
				f81_local9.title:registerAnimationState( "default", {
					leftAnchor = true,
					rightAnchor = false,
					left = 0,
					right = 0,
					topAnchor = true,
					bottomAnchor = false,
					top = f81_local10,
					bottom = f81_local10 + CoD.CardCarousel.TitleSize,
					font = CoD.fonts.Big
				} )
				f81_local9.title:animateToState( "default" )
			end
		end
	end
	return f81_local1
end

CoD.Codtv.Shutdown = function ()
	CoD.Codtv.WebMShutdown()
	Engine.Url_Load_Destroy()
end

CoD.Codtv.ReloadMenu = function ( f83_arg0, f83_arg1 )
	CoD.Codtv.Shutdown()
	local f83_local0 = Engine.GetCodtvContent( f83_arg1 )
	if f83_arg1 == f83_arg0.m_rootFolderIndex then
		f83_arg0.m_previousFolderIndex = nil
	else
		f83_arg0.m_previousFolderIndex = f83_arg0.m_currentFolderIndex
	end
	f83_arg0.m_currentFolderIndex = f83_arg1
	f83_arg0:setTitle( Engine.ToUpper( f83_local0.name ) )
	f83_arg0.m_cardCarouselList:close()
	f83_arg0.m_cardCarouselList = CoD.Codtv.GetCarouselList( f83_arg0, f83_local0 )
	if f83_arg0.m_carouselContext ~= nil and f83_arg1 == f83_arg0.m_carouselContext.folderIndex then
		f83_arg0.m_cardCarouselList:setInitialCarousel( f83_arg0.m_carouselContext.carouselIndex, f83_arg0.m_carouselContext.cardIndex )
		f83_arg0.m_cardCarouselList:focusCurrentCardCarousel()
		f83_arg0.m_carouselContext = nil
	end
	f83_arg0.m_cardCarouselList:focusCurrentCardCarousel()
	f83_arg0.rightButtonPromptBar:removeAllChildren()
	f83_arg0:addElement( f83_arg0.m_cardCarouselList )
end

CoD.Codtv.AnimateOutAndGoBack = function ( f84_arg0 )
	CoD.Codtv.Shutdown()
	if f84_arg0.m_previousFolderIndex == nil then
		CoD.Menu.animateOutAndGoBack( f84_arg0 )
		Engine.PlayMenuMusic( "mus_mp_frontend" )
	else
		f84_arg0:reload( f84_arg0.m_previousFolderIndex )
		Engine.PlaySound( "cac_cmn_backout" )
	end
end

CoD.Codtv.GoBack = function ( f85_arg0, f85_arg1 )
	CoD.Codtv.Shutdown()
	Engine.PartyHostClearUIState()
	Engine.Exec( f85_arg1, "fileshareAbortSummary" )
	Engine.Exec( f85_arg1, "resetThumbnailViewer" )
	if Engine.DvarBool( nil, "tu5_checkStoreButtonPressed" ) then
		Dvar.ui_storeButtonPressed:set( false )
	end
	if f85_arg0.m_rootRef == "ingamestore" then
		Engine.SetDvar( "ui_contextualMenuLocation", "store" )
		if CoD.isPS3 == true then
			Engine.SetDvar( "ui_mtxid", CoD.Codtv.INVALID_MTX_ID )
			Engine.Exec( f85_arg1, "terminateStore" )
		end
	end
	CoD.Menu.goBack( f85_arg0, f85_arg1 )
end

CoD.Codtv.WebMGetMaterial = function ( f86_arg0 )
	if 1 <= f86_arg0 and f86_arg0 <= CoD.Codtv.MaxWebMMaterials then
		return "webm_720p_" .. f86_arg0 + 1
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
CoD.Codtv.UpdateVotesEvent = function ( f88_arg0, f88_arg1 )
	CoD.Codtv.UpdateVotes( CoD.Codtv.GetSelectedCard( f88_arg0 ), f88_arg0.infoPanel.customFilePanel )
end

CoD.Codtv.UpdateVotes = function ( f89_arg0, f89_arg1 )
	if f89_arg0 ~= nil and f89_arg0.fileData ~= nil and f89_arg0.fileData.isPooled == false then
		local f89_local0 = 0
		local f89_local1 = 0
		local f89_local2 = 0
		local f89_local3 = CoD.white
		local f89_local4 = CoD.white
		if f89_arg0.fileData.views ~= nil then
			f89_local0 = f89_arg0.fileData.views
			f89_arg1.viewPanel:setAlpha( 1 )
		else
			f89_arg1.viewPanel:setAlpha( 0 )
		end
		if f89_arg0.fileData.likes ~= nil then
			f89_local1 = f89_arg0.fileData.likes
		end
		if f89_arg0.fileData.dislikes ~= nil then
			f89_local2 = f89_arg0.fileData.dislikes
		end
		local f89_local5 = CoD.FileshareVote.GetVoteCategory( f89_arg0.fileData.category )
		local f89_local6 = nil
		if f89_arg0.fileData.originID ~= nil and f89_arg0.fileData.originID ~= "0" then
			f89_local6 = Engine.GetVote( f89_arg0.codtv.m_ownerController, f89_arg0.fileData.originID, f89_local5 )
		else
			f89_local6 = Engine.GetVote( f89_arg0.codtv.m_ownerController, f89_arg0.fileData.fileID, f89_local5 )
		end
		if f89_local6 ~= nil then
			if f89_local6 == "like" then
				f89_local3 = CoD.green
			elseif f89_local6 == "dislike" then
				f89_local4 = CoD.brightRed
			end
		end
		f89_arg1.viewPanel:update( f89_local0 )
		f89_arg1.likePanel:update( f89_local1, f89_local3 )
		f89_arg1.dislikePanel:update( f89_local2, f89_local4 )
	end
end

CoD.Codtv.SetInfoPanelGameModeDetails = function ( f90_arg0, f90_arg1, f90_arg2, f90_arg3, f90_arg4 )
	if f90_arg1 ~= nil and f90_arg2 ~= nil then
		f90_arg0.gameModeStat1Header:setText( f90_arg1 )
		f90_arg0.gameModeStat1:setText( f90_arg2 )
	else
		f90_arg0.gameModeStat1Header:setText( "" )
		f90_arg0.gameModeStat1:setText( "" )
	end
	if f90_arg3 ~= nil and f90_arg4 ~= nil then
		f90_arg0.gameModeStat2Header:setText( f90_arg3 )
		f90_arg0.gameModeStat2:setText( f90_arg4 )
	else
		f90_arg0.gameModeStat2Header:setText( "" )
		f90_arg0.gameModeStat2:setText( "" )
	end
end

CoD.Codtv.ResetInfoPanelGameModeDetails = function ( f91_arg0 )
	f91_arg0.gameModeStat1Header:setText( "" )
	f91_arg0.gameModeStat1:setText( "" )
	f91_arg0.gameModeStat2Header:setText( "" )
	f91_arg0.gameModeStat2:setText( "" )
end

CoD.Codtv.GetKDRatio = function ( f92_arg0, f92_arg1 )
	local f92_local0 = 0
	if f92_arg1 <= 0 then
		return f92_arg0
	else
		local f92_local1, f92_local2 = math.modf( f92_arg0 / f92_arg1 )
		return f92_local1 .. "." .. math.floor( f92_local2 * 100 )
	end
end

CoD.Codtv.SetInfoPanelGameMode.dom = function ( f93_arg0, f93_arg1, f93_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f93_arg0, Engine.Localize( "MPUI_CAPTURES_CAPS" ), f93_arg2.captures, Engine.Localize( "MPUI_DEFENDS_CAPS" ), f93_arg2.returns )
end

CoD.Codtv.SetInfoPanelGameMode.tdm = function ( f94_arg0, f94_arg1, f94_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f94_arg0, Engine.Localize( "MPUI_RATIO_CAPS" ), CoD.Codtv.GetKDRatio( f94_arg1.kills:get(), f94_arg1.deaths:get() ), Engine.Localize( "MPUI_ASSISTS_CAPS" ), f94_arg1.assists:get() )
end

CoD.Codtv.SetInfoPanelGameMode.dm = function ( f95_arg0, f95_arg1, f95_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f95_arg0, Engine.Localize( "MPUI_RATIO_CAPS" ), CoD.Codtv.GetKDRatio( f95_arg1.kills:get(), f95_arg1.deaths:get() ), Engine.Localize( "MPUI_HEADSHOTS_CAPS" ), f95_arg1.headshots:get() )
end

CoD.Codtv.SetInfoPanelGameMode.ctf = function ( f96_arg0, f96_arg1, f96_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f96_arg0, Engine.Localize( "MPUI_CAPTURES_CAPS" ), f96_arg2.captures, Engine.Localize( "MPUI_RETURNS_CAPS" ), f96_arg2.returns )
end

CoD.Codtv.SetInfoPanelGameMode.dem = function ( f97_arg0, f97_arg1, f97_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f97_arg0, Engine.Localize( "MPUI_PLANTS_CAPS" ), f97_arg2.plants, Engine.Localize( "MPUI_DEFUSES_CAPS" ), f97_arg2.defuses )
end

CoD.Codtv.SetInfoPanelGameMode.sab = function ( f98_arg0, f98_arg1, f98_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f98_arg0, Engine.Localize( "MPUI_PLANTS_CAPS" ), f98_arg2.plants, Engine.Localize( "MPUI_DEFUSES_CAPS" ), f98_arg2.defuses )
end

CoD.Codtv.SetInfoPanelGameMode.sd = function ( f99_arg0, f99_arg1, f99_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f99_arg0, Engine.Localize( "MPUI_PLANTS_CAPS" ), f99_arg2.plants, Engine.Localize( "MPUI_DEFUSES_CAPS" ), f99_arg2.defuses )
end

CoD.Codtv.SetInfoPanelGameMode.hq = function ( f100_arg0, f100_arg1, f100_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f100_arg0, Engine.Localize( "MPUI_CAPTURES_CAPS" ), f100_arg2.captures, Engine.Localize( "MPUI_DEFENDS_CAPS" ), f100_arg2.returns )
end

CoD.Codtv.SetInfoPanelGameMode.koth = function ( f101_arg0, f101_arg1, f101_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f101_arg0, Engine.Localize( "MPUI_CAPTURES_CAPS" ), f101_arg2.captures, Engine.Localize( "MPUI_DEFENDS_CAPS" ), f101_arg2.returns )
end

CoD.Codtv.SetInfoPanelGameMode.conf = function ( f102_arg0, f102_arg1, f102_arg2 )
	CoD.Codtv.SetInfoPanelGameModeDetails( f102_arg0, Engine.Localize( "MPUI_KILLS_CONFIRMED_CAPS" ), f102_arg2.captures, Engine.Localize( "MPUI_KILLS_DENIED_CAPS" ), f102_arg2.returns )
end

CoD.Codtv.CreateHintText = function ( f103_arg0, f103_arg1, f103_arg2, f103_arg3, f103_arg4 )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, false, f103_arg1, f103_arg1 + f103_arg3 )
	self:setTopBottom( true, false, f103_arg2, f103_arg2 + f103_arg4 )
	self:setUseStencil( true )
	self.hintTextElement = CoD.HintText.new( hintTextParams )
	self.hintTextElement:setLeftRight( true, true, 0, 0 )
	self.hintTextElement:setTopBottom( true, false, 0, CoD.textSize.Default )
	self.hintTextElement:setColor( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b, 0.4 )
	self:addElement( self.hintTextElement )
	self.updateHintColor = function ( f104_arg0, f104_arg1 )
		if f104_arg1 == nil then
			f104_arg0.hintTextElement:setColor( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b, 0.4 )
		else
			f104_arg0.hintTextElement:setColor( f104_arg1.r, f104_arg1.g, f104_arg1.b, f104_arg1.a )
		end
	end
	
	self.updateHintText = function ( f105_arg0, f105_arg1 )
		if f105_arg1 == "" then
			f105_arg0.hintTextElement:setAlpha( 0 )
		else
			f105_arg0.hintTextElement:setAlpha( 1 )
		end
		f105_arg0:updateHintColor( nil )
		f105_arg0.hintTextElement:updateText( f105_arg1 )
	end
	
	return self
end

CoD.Codtv.ShowPooledFilePanelSummary = function ( f106_arg0, f106_arg1 )
	if f106_arg0 == nil then
		return 
	end
	local f106_local0 = f106_arg0.pooledFilePanel
	if f106_local0 == nil then
		return 
	end
	f106_local0.loader:setAlpha( 0 )
	if f106_arg1.isValid == nil or f106_arg1.isValid == false then
		return 
	end
	local f106_local1 = f106_arg1.xuid
	if f106_arg0.codtv.m_rootRef == "playerchannel" and f106_arg0.codtv.m_playerChannelXuid ~= nil then
		f106_local1 = f106_arg0.codtv.m_playerChannelXuid
	end
	if f106_local1 == nil or f106_local1 == "" then
		return 
	end
	local f106_local2 = Engine.GetMatchRecordStats( f106_arg1.controller )
	local f106_local3, f106_local4, f106_local5, f106_local6, f106_local7, f106_local8, f106_local9 = nil
	local f106_local10 = 0
	local f106_local11 = 0
	if f106_local2 == nil then
		return 
	end
	local f106_local12 = f106_local2.header
	local f106_local13 = f106_local2.playerBuffer
	local f106_local14 = nil
	if false == CoD.isZombie then
		if f106_local12 ~= nil then
			f106_local3 = f106_local12.isDraw:get()
			f106_local4 = f106_local12.winningTeam:get()
			f106_local5 = f106_local12.teamCount:get()
			f106_local6 = f106_local12.gameModeID:get()
		end
		for f106_local15 = 1, #f106_local13, 1 do
			local f106_local18 = f106_local13[f106_local15 - 1]
			if f106_local18.xuid:get() == f106_local1 then
				f106_local14 = f106_local15 - 1
				f106_local7 = f106_local18.team:get()
				f106_local8 = f106_local18.position:get()
				f106_local9 = f106_local18.partyID:get()
				f106_local10 = f106_local18.score:get()
				f106_local0.kd:setText( f106_local18.kills:get() .. "/" .. f106_local18.deaths:get() )
			end
			local f106_local19 = f106_local18.score:get()
			if f106_local11 < f106_local19 then
				f106_local11 = f106_local19
			end
		end
		if f106_local12 ~= nil and f106_local5 > 1 then
			f106_local10 = 0
			f106_local11 = 0
			for f106_local15 = 1, f106_local5, 1 do
				if f106_local15 == f106_local7 then
					f106_local10 = f106_local12.teamScores[f106_local15]:get()
				end
				local f106_local18 = f106_local12.teamScores[f106_local15]:get()
				if f106_local11 < f106_local18 then
					f106_local11 = f106_local18
				end
			end
		end
	end
	local f106_local15 = {}
	if f106_local9 ~= nil and f106_local9 > 0 then
		for f106_local16 = 1, #f106_local13, 1 do
			local f106_local19 = f106_local13[f106_local16 - 1]
			if f106_local19.partyID:get() == f106_local9 then
				table.insert( f106_local15, f106_local19.gamertag:get() )
			end
		end
		table.sort( f106_local15 )
	end
	if #f106_local15 > 5 and f106_arg0.codtv.codtvIcon ~= nil then
		f106_arg0.codtv.codtvIcon:setAlpha( 0 )
	end
	if false == CoD.isZombie then
		local f106_local16 = {
			captures = 0,
			returns = 0,
			destroys = 0,
			plants = 0,
			defuses = 0
		}
		if f106_local14 ~= nil then
			local f106_local17 = f106_local2.gameEvents
			for f106_local20 = 1, #f106_local17, 1 do
				local f106_local21 = f106_local17[f106_local20 - 1]
				if f106_local14 == f106_local21.player:get() then
					local f106_local22 = f106_local21.eventType
					f106_local16.captures = f106_local16.captures + f106_local22.capture:get()
					f106_local16.returns = f106_local16.returns + f106_local22["return"]:get()
					f106_local16.destroys = f106_local16.destroys + f106_local22.destroy:get()
					f106_local16.plants = f106_local16.plants + f106_local22.plant:get()
					f106_local16.defuses = f106_local16.defuses + f106_local22.defuse:get()
				end
			end
		end
		CoD.Codtv.ResetInfoPanelGameModeDetails( f106_local0 )
		if f106_local6 ~= nil and f106_local14 ~= nil and f106_local13 ~= nil and CoD.Codtv.SetInfoPanelGameMode[f106_local6] ~= nil then
			CoD.Codtv.SetInfoPanelGameMode[f106_local6]( f106_local0, f106_local13[f106_local14], f106_local16 )
		end
		if f106_local5 == 1 then
			if f106_local8 == nil then
				f106_local0.gameResult:setText( "" )
			elseif f106_local3 == 1 then
				f106_local0.gameResult:setText( Engine.Localize( "MENU_FILESHARE_DRAW" ) )
				f106_local0.gameResult:setRGB( CoD.lightBlue.r, CoD.lightBlue.g, CoD.lightBlue.b )
			elseif f106_local8 < 3 then
				f106_local0.gameResult:setText( Engine.Localize( "MENU_FILESHARE_VICTORY" ) )
				f106_local0.gameResult:setRGB( CoD.brightGreen.r, CoD.brightGreen.g, CoD.brightGreen.b )
			else
				f106_local0.gameResult:setText( Engine.Localize( "MENU_FILESHARE_DEFEAT" ) )
				f106_local0.gameResult:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
			end
		elseif f106_local3 == 1 then
			f106_local0.gameResult:setText( Engine.Localize( "MENU_FILESHARE_DRAW" ) .. " " .. f106_local10 .. "-" .. f106_local11 )
			f106_local0.gameResult:setRGB( CoD.lightBlue.r, CoD.lightBlue.g, CoD.lightBlue.b )
		elseif f106_local7 == f106_local4 then
			f106_local0.gameResult:setText( Engine.Localize( "MENU_FILESHARE_VICTORY" ) .. " " .. f106_local10 .. "-" .. f106_local11 )
			f106_local0.gameResult:setRGB( CoD.brightGreen.r, CoD.brightGreen.g, CoD.brightGreen.b )
		else
			f106_local0.gameResult:setText( Engine.Localize( "MENU_FILESHARE_DEFEAT" ) .. " " .. f106_local10 .. "-" .. f106_local11 )
			f106_local0.gameResult:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
		end
	end
	if #f106_local15 > 0 then
		f106_local0.partyPanel:setAlpha( 1 )
		f106_local0.partyHeader:setAlpha( 1 )
		for f106_local16 = 1, 10, 1 do
			if f106_local16 <= #f106_local15 then
				f106_local0.teammates[f106_local16]:setText( f106_local15[f106_local16] )
			else
				f106_local0.teammates[f106_local16]:setText( "" )
			end
		end
	else
		f106_local0.partyHeader:setAlpha( 0 )
		f106_local0.partyPanel:setAlpha( 0 )
	end
	if false == CoD.isZombie then
		f106_local0.statsPanel:completeAnimation()
		f106_local0.statsPanel:beginAnimation( "fade_in", 250 )
		f106_local0.statsPanel:setAlpha( 1 )
	end
end

CoD.Codtv.ShowPooledFilePanel = function ( f107_arg0 )
	local f107_local0 = f107_arg0.codtv.infoPanel
	local f107_local1 = f107_local0.pooledFilePanel
	f107_local1.playlist:setText( "" )
	f107_local1.time:setText( "" )
	f107_local1.partyHeader:setAlpha( 0 )
	f107_local1.partyPanel:setAlpha( 0 )
	f107_local1.bookmarked:setAlpha( 0 )
	f107_local1.kd:setText( "" )
	f107_local1.gameResult:setText( "" )
	CoD.Codtv.ResetInfoPanelGameModeDetails( f107_local1 )
	if CoD.isZombie == false then
		f107_local1.playlist:setText( Engine.Localize( "" ) )
	end
	if f107_arg0.fileData.bookmarked == true then
		f107_local1.bookmarked.bookmarkText:setText( Engine.Localize( "MENU_BOOKMARKED" ) )
		f107_local1.bookmarked.bookmarkText:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		f107_local1.bookmarked.starImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		f107_local1.bookmarked:setAlpha( 1 )
	elseif f107_arg0.fileData.isLiveStream == true then
		local f107_local2, f107_local3 = nil
		if f107_arg0.fileData.isMetaDataValid == true then
			f107_local3 = Engine.Localize( "MENU_LIVE_STREAM_OFFLINE" )
			f107_local2 = CoD.red
		else
			f107_local3 = Engine.Localize( "MENU_LIVE_STREAM_LIVE" )
			f107_local2 = CoD.green
		end
		f107_local1.bookmarked.bookmarkText:setText( f107_local3 )
		f107_local1.bookmarked.bookmarkText:setRGB( f107_local2.r, f107_local2.g, f107_local2.b )
		f107_local1.bookmarked.starImage:setRGB( f107_local2.r, f107_local2.g, f107_local2.b )
		f107_local1.bookmarked:setAlpha( 1 )
	end
	f107_local1.time:setText( f107_arg0.fileData.time )
	f107_arg0.codtv.hintText:updateHintText( f107_arg0.fileData.description )
	f107_local0:addElement( f107_local1 )
	f107_local1.loader:setAlpha( 1 )
	f107_local1.statsPanel:setAlpha( 0 )
end

CoD.Codtv.ShowCustomFilePanel = function ( f108_arg0 )
	local f108_local0 = f108_arg0.codtv.infoPanel
	local f108_local1 = f108_local0.customFilePanel
	f108_local1.optInfo:setText( "" )
	f108_local1.optInfo:setAlpha( 0 )
	f108_arg0.codtv.hintText:updateHintText( f108_arg0.fileData.description )
	if f108_arg0.fileData.fileID ~= nil and f108_arg0.fileData.fileID ~= "0" then
		local f108_local2 = f108_arg0.fileData.gameTypeName
		if f108_arg0.fileData.author ~= nil then
			if f108_arg0.fileData.category == "film" then
				f108_local1.author:setText( Engine.Localize( "MENU_FILESHARE_SAVED_BY" ) .. " " .. f108_arg0.fileData.author )
				f108_local1.optInfo:setText( f108_local2 )
			else
				f108_local1.author:setText( Engine.Localize( "MENU_FILESHARE_AUTHOR" ) .. " " .. f108_arg0.fileData.author )
			end
		end
		if f108_arg0.fileData.category == "customgame" then
			f108_local1.optInfo:setText( f108_local2 )
		end
		if f108_arg0.fileData.category == "screenshot" then
			local f108_local3, f108_local4, f108_local5 = Engine.GetCombatRecordScreenshotInfo( f108_arg0.codtv.m_ownerController, Engine.GetXUID64( f108_arg0.codtv.m_ownerController ) )
		end
		f108_local1.time:setText( f108_arg0.fileData.time )
		CoD.Codtv.UpdateVotes( f108_arg0, f108_local1 )
		f108_local0:addElement( f108_local1 )
	end
end

CoD.Codtv.ShowIngameStorePanel = function ( f109_arg0 )
	local f109_local0 = f109_arg0.codtv.infoPanel
	local f109_local1 = f109_local0.ingameStorePanel
	local f109_local2 = f109_arg0.fileData.description
	local f109_local3 = f109_arg0.fileData.itemCostString
	local f109_local4 = f109_arg0.fileData.isOfferPurchased
	if f109_local2 ~= nil then
		CoD.ScrollableTextContainer.SetupScrollingText( f109_local1.storeDescContainer, f109_local2, CoD.Codtv.StoreDescriptionContainerWidth, CoD.Codtv.StoreDescriptionContainerHeight, nil, CoD.fonts.Default, CoD.textSize.Default, CoD.Codtv.ScrollableTextPauseTime, CoD.Codtv.ScrollableTextPerLineScrollTime )
	else
		f109_local1.storeDescription:setText( "" )
	end
	if f109_local3 ~= nil then
		f109_local1.offerCost:setText( f109_local3 )
	else
		f109_local1.offerCost:setText( "" )
	end
	if f109_local4 ~= nil and f109_local4 == 1 then
		f109_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_PACKAGE_DOWNLOAD_DESCRIPTION" ) )
		f109_local1.purchasedElement:show()
	else
		f109_arg0.codtv.hintText:updateHintText( Engine.Localize( "MENU_PACKAGE_SELECTION_DESCRIPTION" ) )
		f109_local1.purchasedElement:hide()
	end
	f109_local0:addElement( f109_local1 )
end

CoD.Codtv.ShowFileInfoPanel = function ( f110_arg0 )
	if f110_arg0 ~= nil and f110_arg0.codtv ~= nil and f110_arg0.codtv.infoPanel ~= nil then
		if f110_arg0.fileData ~= nil then
			if f110_arg0.fileData.isPooled == true then
				CoD.Codtv.ShowPooledFilePanel( f110_arg0 )
			elseif f110_arg0.fileData.category == "ingamestore" then
				CoD.Codtv.ShowIngameStorePanel( f110_arg0 )
			else
				CoD.Codtv.ShowCustomFilePanel( f110_arg0 )
			end
		end
		f110_arg0.codtv.infoPanel:completeAnimation()
		f110_arg0.codtv.infoPanel:setAlpha( 0 )
		f110_arg0.codtv.infoPanel:beginAnimation( "fade_in", 250 )
		f110_arg0.codtv.infoPanel:setAlpha( 1 )
	end
end

CoD.Codtv.GetBacking = function ( f111_arg0, f111_arg1, f111_arg2, f111_arg3 )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, false, f111_arg1, f111_arg1 + f111_arg2 )
	self:setTopBottom( true, false, f111_arg0, f111_arg0 + f111_arg3 )
	local f111_local1 = LUI.UIImage.new()
	f111_local1:setLeftRight( true, true, 0, 0 )
	f111_local1:setTopBottom( true, false, 0, 1 )
	f111_local1:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	f111_local1:setAlpha( 0.5 )
	self:addElement( f111_local1 )
	local f111_local2 = LUI.UIImage.new()
	f111_local2:setLeftRight( true, true, 0, 0 )
	f111_local2:setTopBottom( false, true, -8, 0 )
	f111_local2:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	f111_local2:setImage( RegisterMaterial( "menu_sp_cac_single_dip" ) )
	f111_local2:setAlpha( 0.5 )
	self:addElement( f111_local2 )
	local f111_local3 = LUI.UIImage.new()
	f111_local3:setLeftRight( true, false, 0, 1 )
	f111_local3:setTopBottom( true, true, 0, 0 )
	f111_local3:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	f111_local3:setAlpha( 0.5 )
	self:addElement( f111_local3 )
	local f111_local4 = LUI.UIImage.new()
	f111_local4:setLeftRight( false, true, -1, 0 )
	f111_local4:setTopBottom( true, true, 0, 0 )
	f111_local4:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	f111_local4:setAlpha( 0.5 )
	self:addElement( f111_local4 )
	return self
end

CoD.Codtv.CreatePooledFilePanel = function ()
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 15, 0 )
	self:setTopBottom( true, true, 0, 0 )
	local f112_local1 = 20
	self.gameResult = LUI.UIText.new()
	self.gameResult:setLeftRight( true, true, 0, 0 )
	self.gameResult:setTopBottom( true, false, f112_local1, f112_local1 + CoD.textSize.Condensed )
	self.gameResult:setAlignment( LUI.Alignment.Left )
	self.gameResult:setFont( CoD.fonts.Condensed )
	self:addElement( self.gameResult )
	local f112_local2 = LUI.UIElement.new()
	f112_local2:setLeftRight( true, true, 0, 0 )
	f112_local2:setTopBottom( true, false, f112_local1, f112_local1 + CoD.textSize.Condensed )
	local f112_local3 = Engine.Localize( "MENU_BOOKMARKED" )
	local f112_local4 = {}
	f112_local4 = GetTextDimensions( f112_local3, CoD.fonts.Default, CoD.textSize.Default )
	local f112_local5 = f112_local4[3]
	local f112_local6 = LUI.UIText.new()
	f112_local6:setLeftRight( false, true, -f112_local5, 0 )
	f112_local6:setTopBottom( false, true, -CoD.textSize.Default, 0 )
	f112_local6:setAlignment( LUI.Alignment.Right )
	f112_local6:setFont( CoD.fonts.Default )
	f112_local6:setText( f112_local3 )
	f112_local6:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	f112_local2.bookmarkText = f112_local6
	f112_local2:addElement( f112_local6 )
	local f112_local7 = LUI.UIImage.new()
	f112_local7:setLeftRight( false, true, -f112_local5 - CoD.textSize.Default - 5, -f112_local5 - 5 )
	f112_local7:setTopBottom( false, true, -CoD.textSize.Default, 0 )
	f112_local7:setImage( RegisterMaterial( "menu_mp_star_rating" ) )
	f112_local7:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	f112_local2.starImage = f112_local7
	f112_local2:addElement( f112_local7 )
	self.bookmarked = f112_local2
	self.bookmarked:setAlpha( 0 )
	self:addElement( self.bookmarked )
	if CoD.isZombie then
		self.gameResult:setAlpha( 0 )
	end
	f112_local1 = f112_local1 + CoD.textSize.Condensed + 10
	self.loader = LUI.UIImage.new()
	self.loader:setLeftRight( false, false, -32, 32 )
	self.loader:setTopBottom( true, false, f112_local1, f112_local1 + 64 )
	self.loader:setImage( RegisterMaterial( "lui_loader" ) )
	self.loader:setShaderVector( 0, 0, 0, 0, 0 )
	self.loader:setAlpha( 0 )
	self:addElement( self.loader )
	local f112_local8 = 15
	local f112_local9 = 110
	local f112_local10 = 45
	local f112_local11 = f112_local8
	local f112_local12 = f112_local11 + f112_local9 + f112_local8
	local f112_local13 = f112_local12 + f112_local9 + f112_local8
	local f112_local14 = 74
	local f112_local15 = f112_local9 * 3 + f112_local8 * 4
	local f112_local16 = LUI.UIElement.new()
	f112_local16:setLeftRight( true, false, 0, f112_local15 )
	f112_local16:setTopBottom( true, false, f112_local1, f112_local1 + f112_local14 )
	self.statsPanel = f112_local16
	self:addElement( f112_local16 )
	if CoD.isZombie then
		f112_local16:setAlpha( 0 )
	end
	f112_local16:addElement( CoD.BorderT6.new( 1, CoD.offGray.r, CoD.offGray.g, CoD.offGray.b, 0.5 ) )
	local f112_local17 = 3
	local f112_local18 = LUI.UIText.new()
	f112_local18:setLeftRight( true, false, f112_local11, f112_local11 + f112_local9 )
	f112_local18:setTopBottom( true, false, f112_local17, f112_local17 + CoD.textSize.ExtraSmall )
	f112_local18:setAlignment( LUI.Alignment.Center )
	f112_local18:setFont( CoD.fonts.ExtraSmall )
	f112_local18:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	f112_local18:setText( Engine.Localize( "MENU_KILLS_CAPS" ) .. "/" .. Engine.Localize( "MENU_DEATHS_CAPS" ) )
	f112_local16:addElement( f112_local18 )
	self.gameModeStat1Header = LUI.UIText.new()
	self.gameModeStat1Header:setLeftRight( true, false, f112_local12, f112_local12 + f112_local9 )
	self.gameModeStat1Header:setTopBottom( true, false, f112_local17, f112_local17 + CoD.textSize.ExtraSmall )
	self.gameModeStat1Header:setAlignment( LUI.Alignment.Center )
	self.gameModeStat1Header:setFont( CoD.fonts.ExtraSmall )
	self.gameModeStat1Header:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	f112_local16:addElement( self.gameModeStat1Header )
	self.gameModeStat2Header = LUI.UIText.new()
	self.gameModeStat2Header:setLeftRight( true, false, f112_local13, f112_local13 + f112_local9 )
	self.gameModeStat2Header:setTopBottom( true, false, f112_local17, f112_local17 + CoD.textSize.ExtraSmall )
	self.gameModeStat2Header:setAlignment( LUI.Alignment.Center )
	self.gameModeStat2Header:setFont( CoD.fonts.ExtraSmall )
	self.gameModeStat2Header:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	f112_local16:addElement( self.gameModeStat2Header )
	f112_local17 = f112_local17 + CoD.textSize.ExtraSmall
	f112_local16:addElement( CoD.Codtv.GetBacking( f112_local17, f112_local11, f112_local9, f112_local10 ) )
	f112_local16:addElement( CoD.Codtv.GetBacking( f112_local17, f112_local12, f112_local9, f112_local10 ) )
	f112_local16:addElement( CoD.Codtv.GetBacking( f112_local17, f112_local13, f112_local9, f112_local10 ) )
	f112_local17 = f112_local17 + 5
	self.kd = LUI.UIText.new()
	self.kd:setLeftRight( true, false, f112_local11, f112_local11 + f112_local9 )
	self.kd:setTopBottom( true, false, f112_local17, f112_local17 + CoD.textSize.Condensed )
	self.kd:setAlignment( LUI.Alignment.Center )
	self.kd:setFont( CoD.fonts.Condensed )
	f112_local16:addElement( self.kd )
	self.gameModeStat1 = LUI.UIText.new()
	self.gameModeStat1:setLeftRight( true, false, f112_local12, f112_local12 + f112_local9 )
	self.gameModeStat1:setTopBottom( true, false, f112_local17, f112_local17 + CoD.textSize.Condensed )
	self.gameModeStat1:setAlignment( LUI.Alignment.Center )
	self.gameModeStat1:setFont( CoD.fonts.Condensed )
	f112_local16:addElement( self.gameModeStat1 )
	self.gameModeStat2 = LUI.UIText.new()
	self.gameModeStat2:setLeftRight( true, false, f112_local13, f112_local13 + f112_local9 )
	self.gameModeStat2:setTopBottom( true, false, f112_local17, f112_local17 + CoD.textSize.Condensed )
	self.gameModeStat2:setAlignment( LUI.Alignment.Center )
	self.gameModeStat2:setFont( CoD.fonts.Condensed )
	f112_local16:addElement( self.gameModeStat2 )
	f112_local1 = f112_local1 + f112_local14 + 15
	self.time = LUI.UIText.new()
	self.time:setLeftRight( true, true, 0, 0 )
	self.time:setTopBottom( true, false, f112_local1, f112_local1 + CoD.textSize.Default )
	self.time:setAlignment( LUI.Alignment.Left )
	self.time:setFont( CoD.fonts.Default )
	self.time:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	self:addElement( self.time )
	f112_local1 = f112_local1 + CoD.textSize.Default
	self.playlist = LUI.UIText.new()
	self.playlist:setLeftRight( true, true, 0, 0 )
	self.playlist:setTopBottom( true, false, f112_local1, f112_local1 + CoD.textSize.Default )
	self.playlist:setAlignment( LUI.Alignment.Left )
	self.playlist:setFont( CoD.fonts.Default )
	self.playlist:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	self:addElement( self.playlist )
	f112_local1 = f112_local1 + CoD.textSize.Default + 15
	self.partyHeader = LUI.UIText.new()
	self.partyHeader:setLeftRight( true, true, 0, 0 )
	self.partyHeader:setTopBottom( true, false, f112_local1, f112_local1 + CoD.textSize.ExtraSmall )
	self.partyHeader:setAlignment( LUI.Alignment.Left )
	self.partyHeader:setFont( CoD.fonts.ExtraSmall )
	self.partyHeader:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	self.partyHeader:setText( Engine.Localize( "MENU_PARTY_CAPS" ) )
	self:addElement( self.partyHeader )
	f112_local1 = f112_local1 + CoD.textSize.ExtraSmall
	
	local partyPanel = LUI.UIElement.new()
	partyPanel:setLeftRight( true, false, 0, 455 )
	partyPanel:setTopBottom( true, false, f112_local1, f112_local1 + 130 )
	self:addElement( partyPanel )
	self.partyPanel = partyPanel
	
	self.teammates = {}
	local f112_local20 = 0
	local f112_local21 = 220
	for f112_local22 = 1, 2, 1 do
		for f112_local25 = 1, 5, 1 do
			local f112_local28 = CoD.textSize.Default * (f112_local25 - 1)
			local f112_local29 = f112_local21 * (f112_local22 - 1)
			f112_local20 = f112_local20 + 1
			self.teammates[f112_local20] = LUI.UIText.new()
			self.teammates[f112_local20]:setLeftRight( true, false, f112_local29, f112_local29 + f112_local21 )
			self.teammates[f112_local20]:setTopBottom( true, false, f112_local28, f112_local28 + CoD.textSize.Default )
			self.teammates[f112_local20]:setAlignment( LUI.Alignment.Left )
			self.teammates[f112_local20]:setFont( CoD.fonts.Default )
			partyPanel:addElement( self.teammates[f112_local20] )
		end
	end
	return self
end

CoD.Codtv.CreateCustomFilePanel = function ()
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 15, 0 )
	self:setTopBottom( true, true, 0, 0 )
	local f113_local1 = 50 + 60
	self.author = LUI.UIText.new()
	self.author:setLeftRight( true, true, 0, 0 )
	self.author:setTopBottom( true, false, f113_local1, f113_local1 + CoD.textSize.Default )
	self.author:setAlignment( LUI.Alignment.Left )
	self.author:setRGB( 0.8, 0.8, 0.8 )
	self:addElement( self.author )
	f113_local1 = f113_local1 + CoD.textSize.Default
	self.time = LUI.UIText.new()
	self.time:setLeftRight( true, true, 0, 0 )
	self.time:setTopBottom( true, false, f113_local1, f113_local1 + CoD.textSize.Default )
	self.time:setAlignment( LUI.Alignment.Left )
	self.time:setFont( CoD.fonts.Default )
	self.time:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	self:addElement( self.time )
	f113_local1 = f113_local1 + CoD.textSize.Default
	self.optInfo = LUI.UIText.new()
	self.optInfo:setLeftRight( true, true, 0, 0 )
	self.optInfo:setTopBottom( true, false, f113_local1, f113_local1 + CoD.textSize.Default )
	self.optInfo:setAlignment( LUI.Alignment.Left )
	self.optInfo:setFont( CoD.fonts.Default )
	self.optInfo:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	self:addElement( self.optInfo )
	return self
end

CoD.Codtv.CreateIngameStorePanel = function ()
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 25, 0 )
	self:setTopBottom( true, true, 0, 0 )
	local f114_local1 = 27
	self.purchasedElement = LUI.UIElement.new()
	self.purchasedElement:setLeftRight( true, true, 0, 250 )
	self.purchasedElement:setTopBottom( true, false, f114_local1, f114_local1 + CoD.textSize.Default )
	self:addElement( self.purchasedElement )
	self.purchasedChecker = LUI.UIImage.new()
	self.purchasedChecker:setLeftRight( true, false, 0, CoD.textSize.ExtraSmall )
	self.purchasedChecker:setTopBottom( false, false, -CoD.textSize.ExtraSmall / 2, CoD.textSize.ExtraSmall / 2 )
	self.purchasedChecker:setImage( RegisterMaterial( "menu_mp_killstreak_select" ) )
	self.purchasedElement:addElement( self.purchasedChecker )
	self.purchasedText = LUI.UIText.new()
	self.purchasedText:setLeftRight( true, true, CoD.textSize.Default + 5, 0 )
	self.purchasedText:setTopBottom( true, true, 0, 0 )
	self.purchasedText:setFont( CoD.fonts.Default )
	self.purchasedText:setRGB( 0.6, 0.6, 0.6 )
	self.purchasedText:setText( Engine.Localize( "MENU_STORE_OFFER_PURCHASED" ) )
	self.purchasedText:setAlignment( LUI.Alignment.Left )
	self.purchasedElement:addElement( self.purchasedText )
	f114_local1 = f114_local1 + CoD.textSize.Default + 10
	self.costString = LUI.UIText.new()
	self.costString:setLeftRight( true, true, 0, 300 )
	self.costString:setTopBottom( true, false, f114_local1, f114_local1 + CoD.textSize.Default )
	self.costString:setFont( CoD.fonts.Default )
	self.costString:setRGB( 0.3, 0.3, 0.3 )
	self.costString:setText( Engine.Localize( "MENU_COST" ) )
	self.costString:setAlignment( LUI.Alignment.Left )
	self:addElement( self.costString )
	local f114_local2 = {}
	f114_local2 = GetTextDimensions( Engine.Localize( "MENU_COST" ), CoD.fonts.Default, CoD.textSize.Default )
	self.offerCost = LUI.UIText.new()
	self.offerCost:setLeftRight( true, true, f114_local2[3] + 10, 0 )
	self.offerCost:setTopBottom( true, false, f114_local1, f114_local1 + CoD.textSize.Default )
	self.offerCost:setFont( CoD.fonts.Default )
	self.offerCost:setRGB( 0.6, 0.6, 0.6 )
	self.offerCost:setAlignment( LUI.Alignment.Left )
	self:addElement( self.offerCost )
	f114_local1 = f114_local1 + CoD.textSize.Default + 10
	self.descriptionHeader = LUI.UIText.new()
	self.descriptionHeader:setLeftRight( true, true, 0, 0 )
	self.descriptionHeader:setTopBottom( true, false, f114_local1, f114_local1 + CoD.textSize.Default )
	self.descriptionHeader:setFont( CoD.fonts.Default )
	self.descriptionHeader:setRGB( 0.3, 0.3, 0.3 )
	self.descriptionHeader:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	self.descriptionHeader:setAlignment( LUI.Alignment.Left )
	self:addElement( self.descriptionHeader )
	f114_local1 = f114_local1 + CoD.textSize.Default + 5
	self.storeDescContainer = LUI.UIElement.new()
	self.storeDescContainer:setUseStencil( true )
	self.storeDescContainer:setLeftRight( false, true, -CoD.Codtv.StoreDescriptionContainerWidth, 0 )
	self.storeDescContainer:setTopBottom( true, false, f114_local1, f114_local1 + CoD.Codtv.StoreDescriptionContainerHeight )
	self:addElement( self.storeDescContainer )
	return self
end

CoD.Codtv.CreateInfoPanel = function ( f115_arg0 )
	local self = LUI.UIElement.new()
	self:setLeftRight( false, true, -CoD.Codtv.InfoPanelWidth, 0 )
	self:setTopBottom( true, false, CoD.Codtv.InfoPanelTop, CoD.Codtv.InfoPanelTop + CoD.Codtv.InfoPanelHeight )
	self.m_ownerController = controller
	self.codtv = f115_arg0
	self.customFilePanel = CoD.Codtv.CreateCustomFilePanel()
	self.pooledFilePanel = CoD.Codtv.CreatePooledFilePanel()
	self.ingameStorePanel = CoD.Codtv.CreateIngameStorePanel()
	self.showSummary = CoD.Codtv.ShowPooledFilePanelSummary
	return self
end

CoD.Codtv.SavedState = nil
CoD.Codtv.OpenFileManager = function ( f116_arg0, f116_arg1 )
	CoD.Codtv.SavedState = {}
	CoD.Codtv.SavedState.rootRef = f116_arg0.m_rootRef
	CoD.Codtv.SavedState.rootFolderIndex = f116_arg0.m_rootFolderIndex
	CoD.Codtv.SavedState.currentFolderIndex = f116_arg0.m_currentFolderIndex
	CoD.Codtv.SavedState.previousFolderIndex = f116_arg0.m_previousFolderIndex
	CoD.Codtv.SavedState.carouselContext = f116_arg0.m_carouselContext
	local f116_local0 = f116_arg0:openPopup( "FileshareManager", f116_arg1.controller )
end

CoD.Codtv.ShowCODTVIcon = function ( f117_arg0 )
	if f117_arg0 ~= nil and f117_arg0.m_rootRef == "community" then
		return true
	else
		return false
	end
end

CoD.Codtv.ShowPS3StoreLogo = function ( f118_arg0 )
	if f118_arg0 ~= nil and f118_arg0.m_rootRef == "ingamestore" and CoD.isPS3 == true then
		return true
	else
		return false
	end
end

CoD.Codtv.SlotsAvailable = function ( f119_arg0, f119_arg1 )
	if f119_arg0.m_loaded == true then
		return 
	end
	f119_arg0.m_loaded = true
	f119_arg0.spinner:setAlpha( 0 )
	if f119_arg0.m_rootRef ~= nil and f119_arg0.m_rootRef ~= "" then
		local f119_local0 = Engine.GetCodtvRoot( f119_arg0.m_rootRef )
		if f119_local0 == nil then
			f119_arg0.occludedMenu:openPopup( "FileshareManager_Error", f119_arg1 )
			f119_arg0:close()
			return 
		end
		local f119_local1 = Engine.GetCodtvContent( f119_local0 )
		f119_arg0.m_rootFolderIndex = f119_local0
		f119_arg0.m_previousFolderIndex = nil
		f119_arg0.m_currentFolderIndex = f119_local0
		f119_arg0.hintText = CoD.Codtv.CreateHintText( f119_arg1, 0, 312, 350, 80 )
		f119_arg0:addElement( f119_arg0.hintText )
		f119_arg0.infoPanel = CoD.Codtv.CreateInfoPanel( f119_arg0 )
		f119_arg0:addElement( f119_arg0.infoPanel )
		if CoD.Codtv.ShowCODTVIcon( f119_arg0 ) == true or CoD.Codtv.ShowPS3StoreLogo( f119_arg0 ) == true then
			if f119_arg0.codtvIcon == nil and f119_arg0.m_rootRef ~= "ingamestore" then
				f119_arg0.codtvIcon = LUI.UIImage.new()
				f119_arg0.codtvIcon:setLeftRight( false, true, -256, 0 )
				f119_arg0.codtvIcon:setTopBottom( false, true, -109, -45 )
				f119_arg0.codtvIcon:setImage( RegisterMaterial( "menu_codtv_logo" ) )
				f119_arg0:addElement( f119_arg0.codtvIcon )
			elseif CoD.Codtv.ShowPS3StoreLogo( f119_arg0 ) == true then
				f119_arg0.codtvIcon = LUI.UIImage.new()
				f119_arg0.codtvIcon:setLeftRight( false, true, -128, 0 )
				f119_arg0.codtvIcon:setTopBottom( false, true, -62, -30 )
				f119_arg0.codtvIcon:setImage( RegisterMaterial( "playstation_store_ingame_logo" ) )
				f119_arg0:addElement( f119_arg0.codtvIcon )
			else
				f119_arg0.codtvIcon:setAlpha( 1 )
			end
		elseif f119_arg0.codtvIcon ~= nil then
			f119_arg0.codtvIcon:setAlpha( 1 )
		end
		if f119_local1 ~= nil then
			f119_arg0:addTitle( Engine.ToUpper( f119_local1.name ) )
			local f119_local2 = 454
			local f119_local3 = LUI.UIImage.new()
			f119_local3:setLeftRight( true, false, 0, CoD.Menu.Width / 2 - 85 )
			f119_local3:setTopBottom( true, false, f119_local2, f119_local2 + 1 )
			f119_local3:setAlpha( 0.05 )
			f119_arg0:addElement( f119_local3 )
			f119_arg0.m_cardCarouselList = CoD.Codtv.GetCarouselList( f119_arg0, f119_local1 )
			f119_arg0:addElement( f119_arg0.m_cardCarouselList )
			if f119_arg0.m_rootRef == "ingamestore" and true == CoD.isPS3 then
				f119_arg0.m_cardCarouselList:setInitialCarousel( Engine.DvarInt( nil, "ui_storeCategory" ), 0 )
				Engine.SetDvar( "ui_storeCategory", 1 )
			end
			f119_arg0.m_cardCarouselList:focusCurrentCardCarousel( f119_arg1 )
		end
	end
end

CoD.Codtv.MTXChanged = function ( f120_arg0, f120_arg1 )
	if f120_arg1.controller ~= f120_arg0.m_ownerController then
		return 
	elseif f120_arg0.m_rootRef ~= "ingamestore" then
		f120_arg0:reload( f120_arg0.m_rootFolderIndex )
	end
end

CoD.Codtv.OpenMTXPurchase = function ( f121_arg0, f121_arg1 )
	f121_arg0:openPopup( "MTXPurchase", f121_arg1.controller, f121_arg1.userData )
end

CoD.Codtv.OpenNoGuestMTX = function ( f122_arg0, f122_arg1 )
	local f122_local0 = f122_arg0:openPopup( "Error", controller )
	f122_local0:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
end

LUI.createMenu.CODTv = function ( f123_arg0 )
	local f123_local0 = CoD.perController[f123_arg0].codtvRoot
	local f123_local1 = CoD.Menu.New( "CODTv", nil, nil, f123_local0 )
	local self = LUI.UIImage.new( {
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
	self:setPriority( -100 )
	f123_local1:addElement( self )
	Engine.Exec( f123_arg0, "vote_getHistory" )
	f123_local1.m_rootRef = f123_local0
	f123_local1.m_loaded = false
	CoD.Codtv.WebMShutdown()
	f123_local1:addLargePopupBackground()
	f123_local1:setOwner( f123_arg0 )
	if f123_local0 == "ingamestore" then
		if CoD.Codtv.INVALID_MTX_ID == Engine.DvarInt( nil, "ui_mtxid" ) then
			Engine.SetStartCheckoutTimestampUTC()
		end
		Engine.SendDLCMenusViewedRecordEvent( f123_arg0, CoD.INGAMESTORE_MENU_VIEWED, "ingamestore" )
		f123_local1.unusedControllerAllowed = true
	end
	if f123_local0 == "playerchannel" then
		f123_local1.m_playerChannelXuid = CoD.perController[f123_arg0].playerChannelXuid
		f123_local1.userData = f123_local1.m_playerChannelXuid
		if CoD.isMultiplayer and not CoD.isZombie and f123_local1.m_playerChannelXuid ~= nil and f123_local1.m_playerChannelXuid ~= "" then
			f123_local1:addElement( CoD.MiniIdentity.GetMiniIdentity( f123_arg0, f123_local1.m_playerChannelXuid ) )
		end
	end
	if f123_local0 == "emblems" then
		f123_local1:setPreviousMenu( "Barracks" )
	end
	if f123_local0 == "leagueidentity" then
		f123_local1:setPreviousMenu( "LeagueTeamNamePopup" )
	end
	f123_local1:addBackButton()
	f123_local1:registerEventHandler( "fileshare_slots_available", CoD.Codtv.SlotsAvailable )
	if f123_local0 == "combatrecord" then
		f123_local1:setPreviousMenu( "CRCareer" )
	else
		f123_local1.saveButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_FILESHARE_SAVE" ), f123_local1, "card_save", false, nil, false, nil, "S" )
		f123_local1.reportButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_FILESHARE_REPORT_EMBLEM" ), f123_local1, "card_report", false, nil, false, nil, "S" )
		f123_local1.voteButtonPrompt = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_FILESHARE_LIKEDISLIKE" ), f123_local1, "card_vote", false, nil, false, nil, "R" )
		f123_local1.emblemOptionsPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_EMBLEM_OPTIONS" ), f123_local1, "fileshare_emblem_options", false, nil, false, nil, "O" )
	end
	f123_local1.reload = CoD.Codtv.ReloadMenu
	f123_local1.goBack = CoD.Codtv.GoBack
	f123_local1.animateOutAndGoBack = CoD.Codtv.AnimateOutAndGoBack
	f123_local1:registerEventHandler( "fileshare_open_manager", CoD.Codtv.OpenFileManager )
	f123_local1:registerEventHandler( "infopanel_update_votes", CoD.Codtv.UpdateVotesEvent )
	f123_local1:registerEventHandler( "fileshare_emblem_options", CoD.Codtv.EmblemOptions )
	f123_local1:registerEventHandler( "store_purchase_confirmation", CoD.Codtv.StorePurchaseConfirmation )
	f123_local1:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
	f123_local1:registerEventHandler( "mtx_changed", CoD.Codtv.MTXChanged )
	f123_local1:registerEventHandler( "open_mtx_purchase", CoD.Codtv.OpenMTXPurchase )
	f123_local1:registerEventHandler( "open_no_guest_mtx", CoD.Codtv.OpenNoGuestMTX )
	local f123_local3 = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	f123_local3:setImage( RegisterMaterial( "lui_loader" ) )
	f123_local3:setTopBottom( false, false, -32, 32 )
	f123_local3:setLeftRight( false, false, -32, 32 )
	f123_local1.spinner = f123_local3
	f123_local1:addElement( f123_local3 )
	Engine.Exec( f123_arg0, "fileshareGetSlots" )
	CoD.Codtv.SlotsAvailable( f123_local1, f123_arg0 )
	return f123_local1
end

LUI.createMenu.CODTv_Error = function ( f124_arg0 )
	local f124_local0 = CoD.Popup.SetupPopup( "CODTv_Error", f124_arg0 )
	f124_local0.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	f124_local0.msg:setText( Engine.Localize( "MENU_COD_TV_DISABLED_DUE_TO_LIVE_STREAM" ) )
	f124_local0:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	return f124_local0
end

