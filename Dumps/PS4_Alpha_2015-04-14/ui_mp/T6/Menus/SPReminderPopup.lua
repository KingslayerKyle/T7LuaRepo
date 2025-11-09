CoD.SPReminderPopup = {}
CoD.SPReminderPopup.MessageTop = 80
CoD.SPReminderPopup.MessageWidth = 450
CoD.SPReminderPopup.MessageHeight = 160
CoD.SPReminderPopup.ImagePadding = 130
CoD.SPReminderPopup.MissingDLCTextHeight = 200
CoD.SPReminderPopup.GetMissingDLCList = function ( missingDLCList )
	local totalDLCReleased = Dvar.ui_totalDLCReleased:get()
	for i = 1, totalDLCReleased, 1 do
		if Engine.IsContentAvailableByPakName( "dlc" .. i ) == false then
			table.insert( missingDLCList, "dlc" .. i )
		end
	end
end

CoD.SPReminderPopup.GetAvailableDLC = function ()
	local totalDLCReleased = Dvar.ui_totalDLCReleased:get()
	local dlcAvailable = 0
	local multiplier = 10
	for i = 1, totalDLCReleased, 1 do
		if Engine.IsContentAvailableByPakName( "dlc" .. i ) == true then
			dlcAvailable = dlcAvailable * multiplier + i
		end
	end
	return dlcAvailable
end

CoD.SPReminderPopup.ShowMissingDLCString = function ( SPReminderPopup, missingDLCTextEl, y )
	local textFont = CoD.fonts.Default
	local textHeight = CoD.textSize.Default
	local missingDLCTextEl = LUI.UIElement.new()
	missingDLCTextEl:setLeftRight( true, false, 0, CoD.SPReminderPopup.MessageWidth )
	missingDLCTextEl:setTopBottom( true, false, y, y + CoD.SPReminderPopup.MissingDLCTextHeight )
	SPReminderPopup:addElement( missingDLCTextEl )
	local missingDLCList = {}
	CoD.SPReminderPopup.GetMissingDLCList( missingDLCList )
	for i = 1, #missingDLCList, 1 do
		local ycoord = (i - 1) * textHeight
		local dlcName = LUI.UIText.new( nil, true )
		dlcName:setLeftRight( true, true, 0, 0 )
		dlcName:setTopBottom( true, false, ycoord, ycoord + textHeight )
		dlcName:setFont( textFont )
		dlcName:setText( Engine.Localize( "MENU_" .. missingDLCList[i] .. "_MAP_PACK_NAME_DASH" ) )
		dlcName:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		dlcName:setAlignment( LUI.Alignment.Left )
		missingDLCTextEl:addElement( dlcName )
	end
	return #missingDLCList * textHeight
end

CoD.SPReminderPopup.AddBodyText = function ( SPReminderPopup, y, text )
	local textFont = CoD.fonts.ExtraSmall
	local textHeight = CoD.textSize.ExtraSmall
	local numLines = Engine.GetNumTextLines( text, textFont, textHeight, CoD.SPReminderPopup.MessageWidth )
	local bodyHeight = numLines * textHeight
	local messageBodyEl = LUI.UIElement.new()
	messageBodyEl:setLeftRight( true, false, 0, CoD.SPReminderPopup.MessageWidth )
	messageBodyEl:setTopBottom( true, false, y, y + bodyHeight )
	SPReminderPopup:addElement( messageBodyEl )
	local bodyMessage = LUI.UIText.new( nil, true )
	bodyMessage:setLeftRight( true, true, 0, 0 )
	bodyMessage:setTopBottom( true, false, 0, textHeight )
	bodyMessage:setFont( textFont )
	bodyMessage:setText( text )
	bodyMessage:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	bodyMessage:setAlignment( LUI.Alignment.Left )
	messageBodyEl:addElement( bodyMessage )
	return bodyHeight
end

LUI.createMenu.SPReminderPopup = function ( controller )
	local SPReminderPopup = CoD.Menu.New( "SPReminderPopup" )
	SPReminderPopup:addLargePopupBackground()
	SPReminderPopup:addTitle( Engine.Localize( "MPUI_SPREMINDER_TITLE" ) )
	local y = CoD.SPReminderPopup.MessageTop
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, CoD.MOTD.MessageWidth )
	title:setTopBottom( true, false, y, y + CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	title:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	title:setText( Engine.Localize( "MPUI_SPREMINDER_SUBTITLE" ) )
	SPReminderPopup:addElement( title )
	y = y + CoD.textSize.Big + 10
	local topBodyHeight = CoD.SPReminderPopup.AddBodyText( SPReminderPopup, y, Engine.Localize( "MPUI_SPREMINDER_TOP_BODY" ) )
	y = y + topBodyHeight + 10
	local dlcTextHeight = CoD.SPReminderPopup.ShowMissingDLCString( SPReminderPopup, missingDLCTextEl, y )
	y = y + dlcTextHeight + 10
	local bottomBodyHeight = CoD.SPReminderPopup.AddBodyText( SPReminderPopup, y, Engine.Localize( "MPUI_SPREMINDER_BOTTOM_BODY" ) )
	y = y + bottomBodyHeight + 10
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, CoD.SPReminderPopup.ImagePadding + CoD.SPReminderPopup.MessageWidth, CoD.SPReminderPopup.MessageWidth + CoD.SPReminderPopup.ImagePadding + 256 )
	image:setTopBottom( true, false, CoD.SPReminderPopup.MessageTop + 50, CoD.SPReminderPopup.MessageTop + 50 + 256 )
	image:setImage( RegisterMaterial( "menu_mp_missing_motd_big" ) )
	image:setAlpha( 1 )
	SPReminderPopup:addElement( image )
	local choiceList = CoD.ButtonList.new()
	choiceList:setLeftRight( true, true, 0, 0 )
	choiceList:setTopBottom( true, false, 500, 500 + CoD.CoD9Button.Height * 3 )
	SPReminderPopup:addElement( choiceList )
	local downloadNowBotton = choiceList:addButton( Engine.Localize( "MENU_DLC_DOWNLOAD_NOW" ) )
	downloadNowBotton:setActionEventName( "spreminder_downloadnow" )
	choiceList:addElement( downloadNowBotton )
	downloadNowBotton:processEvent( {
		name = "gain_focus"
	} )
	local skipButton = choiceList:addButton( Engine.Localize( "MENU_DLC_DOWNLOAD_NOT_NOW" ) )
	skipButton:setActionEventName( "spreminder_skipDownload" )
	choiceList:addElement( skipButton )
	SPReminderPopup:addSelectButton()
	SPReminderPopup:addBackButton()
	SPReminderPopup:registerEventHandler( "spreminder_downloadnow", CoD.SPReminderPopup.DownloadNow )
	SPReminderPopup:registerEventHandler( "spreminder_skipDownload", CoD.SPReminderPopup.SkipDownload )
	SPReminderPopup:registerEventHandler( "button_prompt_back", CoD.SPReminderPopup.ButtonPromptBack )
	SPReminderPopup:registerEventHandler( "signed_out", CoD.SPReminderPopup.SignedOut )
	return SPReminderPopup
end

CoD.SPReminderPopup.DownloadNow = function ( SPReminderPopup, event )
	CoD.SPReminderPopup.SetSPReminderViewedTime( event.controller, "DOWNLOAD" )
	SPReminderPopup:goBack( event.controller )
	Engine.SetDvar( "ui_contextualMenuLocation", "spreminder" )
	CoD.MainLobby.OpenStore( SPReminderPopup.occludedMenu, event )
end

CoD.SPReminderPopup.SetSPReminderViewedTime = function ( controller, eventName )
	Engine.ExecNow( controller, "setSPReminderViewed" )
	Engine.ExecNow( controller, "uploadstats" )
	local dlcAvailable = CoD.SPReminderPopup.GetAvailableDLC()
	Engine.SendSPReminderRecordEvent( controller, eventName, dlcAvailable )
end

CoD.SPReminderPopup.SkipDownload = function ( SPReminderPopup, event )
	CoD.SPReminderPopup.ButtonPromptBack( SPReminderPopup, event )
	SPReminderPopup.occludedMenu:processEvent( {
		name = "spreminder_popup_closed",
		controller = event.controller
	} )
end

CoD.SPReminderPopup.ButtonPromptBack = function ( SPReminderPopup, event )
	CoD.SPReminderPopup.SetSPReminderViewedTime( event.controller, "SKIPDOWNLOAD" )
	SPReminderPopup:goBack( event.controller )
end

CoD.SPReminderPopup.SignedOut = function ( SPReminderPopup, event )
	local root = SPReminderPopup:getRoot()
	CoD.SPReminderPopup.ButtonPromptBack( SPReminderPopup, event )
	root:processEvent( {
		name = "open_popup",
		popupName = "signed_out",
		controller = event.controller
	} )
end

