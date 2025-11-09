CoD.DLCPopup = {}
CoD.DLCPopup.MessageTop = 80
CoD.DLCPopup.MessageWidth = 450
CoD.DLCPopup.MessageHeight = 310
CoD.DLCPopup.ImagePadding = -50
CoD.DLCPopup.DOWNLOADNOTSTARTED = 0
CoD.DLCPopup.DOWNLOADINPROGRESS = 1
CoD.DLCPopup.DOWNLOADFINISHED = 2
LUI.createMenu.DLCPopup = function ( controller )
	local DLCPopup = CoD.Menu.New( "DLCPopup" )
	CoD.perController[controller].IsDLCPopupViewed = "true"
	DLCPopup:addLargePopupBackground()
	local y = CoD.DLCPopup.MessageTop
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, CoD.MOTD.MessageWidth )
	title:setTopBottom( true, false, y, y + CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	title:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	title:setText( Engine.Localize( "MENU_DLC_POPUP_TITLE" ) )
	DLCPopup:addElement( title )
	y = y + CoD.textSize.Big + 10
	local messageEl = LUI.UIElement.new()
	messageEl:setLeftRight( true, false, 0, CoD.DLCPopup.MessageWidth )
	messageEl:setTopBottom( true, false, y, y + CoD.DLCPopup.MessageHeight )
	DLCPopup:addElement( messageEl )
	local message = LUI.UIText.new( nil, true )
	message:setLeftRight( true, true, 0, 0 )
	message:setTopBottom( true, false, 0, CoD.textSize.ExtraSmall )
	message:setFont( CoD.fonts.ExtraSmall )
	message:setText( Engine.Localize( "MENU_DLC_POPUP_DESCRIPTION" ) )
	message:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	message:setAlignment( LUI.Alignment.Left )
	messageEl:addElement( message )
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, CoD.DLCPopup.ImagePadding + CoD.DLCPopup.MessageWidth, CoD.DLCPopup.MessageWidth + CoD.DLCPopup.ImagePadding + 512 )
	image:setTopBottom( true, false, CoD.DLCPopup.MessageTop + 50, CoD.DLCPopup.MessageTop + 50 + 256 )
	image:setImage( RegisterMaterial( "menu_mp_nt_motd_big" ) )
	image:setAlpha( 1 )
	DLCPopup:addElement( image )
	
	local choiceList = CoD.ButtonList.new()
	choiceList:setLeftRight( true, true, 0, 0 )
	choiceList:setTopBottom( true, false, 500, 500 + CoD.CoD9Button.Height * 3 )
	DLCPopup:addElement( choiceList )
	DLCPopup.choiceList = choiceList
	
	DLCPopup.downloadChoice = DLCPopup.choiceList:addButton( Engine.Localize( "MENU_DLC_DOWNLOAD" ) )
	DLCPopup.downloadChoice:setActionEventName( "download_now" )
	DLCPopup.choiceList:addElement( DLCPopup.downloadChoice )
	DLCPopup.downloadChoice:processEvent( {
		name = "gain_focus"
	} )
	local event = {
		controller = controller
	}
	CoD.DLCPopup.CheckDownloadStatus( DLCPopup, event )
	DLCPopup.timer = LUI.UITimer.new( 10000, {
		name = "check_download_status",
		controller = event.controller
	}, false )
	DLCPopup:addElement( DLCPopup.timer )
	DLCPopup:addSelectButton()
	DLCPopup:addBackButton()
	DLCPopup:registerEventHandler( "download_now", CoD.DLCPopup.DownloadNow )
	DLCPopup:registerEventHandler( "skip_download", CoD.DLCPopup.SkipDownload )
	DLCPopup:registerEventHandler( "button_prompt_back", CoD.DLCPopup.ButtonPromptBack )
	DLCPopup:registerEventHandler( "check_download_status", CoD.DLCPopup.CheckDownloadStatus )
	DLCPopup:registerEventHandler( "continue", CoD.DLCPopup.SkipDownload )
	DLCPopup:registerEventHandler( "signed_out", CoD.DLCPopup.SignedOut )
	return DLCPopup
end

CoD.DLCPopup.SkipDownload = function ( DLCPopup, event )
	DLCPopup:goBack( event.controller )
	DLCPopup.occludedMenu:processEvent( {
		name = "dlcpopup_closed",
		controller = event.controller
	} )
end

CoD.DLCPopup.ButtonPromptBack = function ( DLCPopup, event )
	DLCPopup:goBack( event.controller )
	CoD.perController[event.controller].IsDLCPopupViewed = nil
end

CoD.DLCPopup.DownloadNow = function ( DLCPopup, event )
	Engine.ExecNow( event.controller, "buyOfferFromMOTD " .. CoD.perController[event.controller].ContentPublisherOfferID .. " " .. CoD.perController[event.controller].ContentType )
end

CoD.DLCPopup.CheckDownloadStatus = function ( DLCPopup, event )
	if CoD.isXBOX == true then
		local downloadstatus = Engine.CheckDownloadStatusByOfferID( event.controller, CoD.perController[event.controller].ContentPublisherOfferID )
		if downloadstatus == CoD.DLCPopup.DOWNLOADINPROGRESS then
			DLCPopup.downloadChoice:setLabel( Engine.Localize( "MENU_DLC_DOWNLOAD_AGAIN" ) )
		elseif downloadstatus == CoD.DLCPopup.DOWNLOADFINISHED and true == Engine.IsContentAvailableByPakName( "dlc0" ) then
			CoD.ButtonList.RemoveAllButtons( DLCPopup.choiceList )
			local continuechoice = DLCPopup.choiceList:addButton( Engine.Localize( "MENU_CONTINUE_CAPS" ) )
			continuechoice:setActionEventName( "continue" )
			DLCPopup.choiceList:addElement( continuechoice )
			continuechoice:processEvent( {
				name = "gain_focus"
			} )
		else
			DLCPopup.downloadChoice:setLabel( Engine.Localize( "MENU_DLC_DOWNLOAD" ) )
		end
	end
end

CoD.DLCPopup.SignedOut = function ( DLCPopup, event )
	local root = DLCPopup:getRoot()
	CoD.DLCPopup.ButtonPromptBack( DLCPopup, event )
	root:processEvent( {
		name = "open_popup",
		popupName = "signed_out",
		controller = event.controller
	} )
end

