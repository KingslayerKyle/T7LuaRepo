CoD.DSPPromotionPopup = {}
CoD.DSPPromotionPopup.MessageTop = 80
CoD.DSPPromotionPopup.MessageWidth = 550
CoD.DSPPromotionPopup.MessageHeight = 160
CoD.DSPPromotionPopup.ImagePadding = 30
CoD.DSPPromotionPopup.MissingDLCTextHeight = 200
CoD.DSPPromotionPopup.GetAvailableDLCList = function ( missingDLCList )
	local totalDLCReleased = Dvar.ui_totalDLCReleased:get()
	for i = 2, totalDLCReleased, 1 do
		table.insert( missingDLCList, "dlc" .. i )
	end
	table.insert( missingDLCList, "dlczm0" )
end

CoD.DSPPromotionPopup.ShowAvailableDLC = function ( DSPPromotionPopup, y )
	local textFont = CoD.fonts.ExtraSmall
	local textHeight = CoD.textSize.ExtraSmall
	local availableDLCTextEl = LUI.UIElement.new()
	availableDLCTextEl:setLeftRight( true, false, 0, CoD.DSPPromotionPopup.MessageWidth )
	availableDLCTextEl:setTopBottom( true, false, y, y + CoD.DSPPromotionPopup.MissingDLCTextHeight )
	DSPPromotionPopup:addElement( availableDLCTextEl )
	local availableDLCList = {}
	CoD.DSPPromotionPopup.GetAvailableDLCList( availableDLCList )
	for i = 1, #availableDLCList, 1 do
		local ycoord = (i - 1) * textHeight
		local dlcName = LUI.UIText.new( nil, true )
		dlcName:setLeftRight( true, true, 0, 0 )
		dlcName:setTopBottom( true, false, ycoord, ycoord + textHeight )
		dlcName:setFont( textFont )
		dlcName:setText( Engine.Localize( "MENU_" .. availableDLCList[i] .. "_MAP_PACK_NAME" ) )
		dlcName:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		dlcName:setAlignment( LUI.Alignment.Left )
		availableDLCTextEl:addElement( dlcName )
	end
	return #availableDLCList * textHeight
end

CoD.DSPPromotionPopup.AddBodyText = function ( DSPPromotionPopup, y, text )
	local textFont = CoD.fonts.ExtraSmall
	local textHeight = CoD.textSize.ExtraSmall
	local numLines = Engine.GetNumTextLines( text, textFont, textHeight, CoD.DSPPromotionPopup.MessageWidth )
	local bodyHeight = numLines * textHeight
	local messageBodyEl = LUI.UIElement.new()
	messageBodyEl:setLeftRight( true, false, 0, CoD.DSPPromotionPopup.MessageWidth )
	messageBodyEl:setTopBottom( true, false, y, y + bodyHeight )
	DSPPromotionPopup:addElement( messageBodyEl )
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

LUI.createMenu.DSPPromotionPopup = function ( controller )
	local DSPPromotionPopup = CoD.Menu.New( "DSPPromotionPopup" )
	DSPPromotionPopup:addLargePopupBackground()
	DSPPromotionPopup:addTitle( Engine.Localize( "MPUI_DSPPROMOTION_TITLE" ) )
	local y = CoD.DSPPromotionPopup.MessageTop
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, CoD.MOTD.MessageWidth )
	title:setTopBottom( true, false, y, y + CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	title:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	title:setText( Engine.Localize( "MPUI_DSPPROMOTION_SUBTITLE" ) )
	DSPPromotionPopup:addElement( title )
	y = y + CoD.textSize.Big + 10
	local topBodyHeight = CoD.DSPPromotionPopup.AddBodyText( DSPPromotionPopup, y, Engine.Localize( "MPUI_DSPPROMOTION_BODY", UIExpression.GetSelfGamertag( controller ) ) )
	y = y + topBodyHeight + 10
	local dlcTextHeight = CoD.DSPPromotionPopup.ShowAvailableDLC( DSPPromotionPopup, y )
	y = y + dlcTextHeight + 20
	local bottomBodyHeight = CoD.DSPPromotionPopup.AddBodyText( DSPPromotionPopup, y, Engine.Localize( "MPUI_TREYARCH_WITH_DASH" ) )
	y = y + bottomBodyHeight + 10
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, CoD.DSPPromotionPopup.ImagePadding + CoD.DSPPromotionPopup.MessageWidth, CoD.DSPPromotionPopup.MessageWidth + CoD.DSPPromotionPopup.ImagePadding + 256 )
	image:setTopBottom( true, false, CoD.DSPPromotionPopup.MessageTop + 50, CoD.DSPPromotionPopup.MessageTop + 50 + 256 )
	image:setImage( RegisterMaterial( "menu_mp_missing_motd_spass" ) )
	image:setAlpha( 1 )
	DSPPromotionPopup:addElement( image )
	local choiceList = CoD.ButtonList.new()
	choiceList:setLeftRight( true, true, 0, 0 )
	choiceList:setTopBottom( true, false, 500, 500 + CoD.CoD9Button.Height * 5 )
	DSPPromotionPopup:addElement( choiceList )
	local remindLater = choiceList:addButton( UIExpression.ToUpper( controller, Engine.Localize( "MENU_VOTING_REMIND_LATER" ) ) )
	remindLater:setActionEventName( "dsppromotion_remindlater" )
	choiceList:addElement( remindLater )
	remindLater:processEvent( {
		name = "gain_focus"
	} )
	local goToStoreButton = choiceList:addButton( UIExpression.ToUpper( controller, Engine.Localize( "MENU_GO_TO_STORE" ) ) )
	goToStoreButton:setActionEventName( "dsppromotion_gotostore" )
	choiceList:addElement( goToStoreButton )
	local neverRemindAgain = choiceList:addButton( UIExpression.ToUpper( controller, Engine.Localize( "MENU_VOTING_NEVER_REMIND_AGAIN" ) ) )
	neverRemindAgain:setActionEventName( "dsppromotion_neverremind" )
	choiceList:addElement( neverRemindAgain )
	DSPPromotionPopup:addSelectButton()
	DSPPromotionPopup:addBackButton()
	DSPPromotionPopup:registerEventHandler( "dsppromotion_gotostore", CoD.DSPPromotionPopup.GoToStore )
	DSPPromotionPopup:registerEventHandler( "dsppromotion_remindlater", CoD.DSPPromotionPopup.RemindLater )
	DSPPromotionPopup:registerEventHandler( "dsppromotion_neverremind", CoD.DSPPromotionPopup.NeverRemindAgain )
	DSPPromotionPopup:registerEventHandler( "button_prompt_back", CoD.DSPPromotionPopup.ButtonPromptBack )
	DSPPromotionPopup:registerEventHandler( "signed_out", CoD.DSPPromotionPopup.SignedOut )
	return DSPPromotionPopup
end

CoD.DSPPromotionPopup.GoToStore = function ( DSPPromotionPopup, event )
	CoD.DSPPromotionPopup.SetDSPPromotionViewedTime( event.controller, "GOTOSTORE" )
	DSPPromotionPopup:goBack( event.controller )
	Engine.SetDvar( "ui_contextualMenuLocation", "dsppromotion" )
	CoD.MainLobby.OpenStore( DSPPromotionPopup.occludedMenu, event )
end

CoD.DSPPromotionPopup.SetDSPPromotionViewedTime = function ( controller, eventName )
	Engine.ExecNow( controller, "setDSPPromotionViewed" )
	Engine.ExecNow( controller, "uploadstats" )
	Engine.SendDSPPromotionRecordEvent( controller, eventName )
end

CoD.DSPPromotionPopup.RemindLater = function ( DSPPromotionPopup, event )
	CoD.DSPPromotionPopup.ButtonPromptBack( DSPPromotionPopup, event )
	DSPPromotionPopup.occludedMenu:processEvent( {
		name = "dsppromotion_popup_closed",
		controller = event.controller
	} )
end

CoD.DSPPromotionPopup.NeverRemindAgain = function ( DSPPromotionPopup, event )
	Engine.ExecNow( event.controller, "setDSPPromotionOptOut" )
	CoD.DSPPromotionPopup.SetDSPPromotionViewedTime( event.controller, "NEVERREMINDAGAIN" )
	DSPPromotionPopup:goBack( event.controller )
	DSPPromotionPopup.occludedMenu:processEvent( {
		name = "dsppromotion_popup_closed",
		controller = event.controller
	} )
end

CoD.DSPPromotionPopup.ButtonPromptBack = function ( DSPPromotionPopup, event )
	CoD.DSPPromotionPopup.SetDSPPromotionViewedTime( event.controller, "REMINDLATER" )
	DSPPromotionPopup:goBack( event.controller )
end

CoD.DSPPromotionPopup.SignedOut = function ( DSPPromotionPopup, event )
	local root = DSPPromotionPopup:getRoot()
	CoD.DSPPromotionPopup.ButtonPromptBack( DSPPromotionPopup, event )
	root:processEvent( {
		name = "open_popup",
		popupName = "signed_out",
		controller = event.controller
	} )
end

