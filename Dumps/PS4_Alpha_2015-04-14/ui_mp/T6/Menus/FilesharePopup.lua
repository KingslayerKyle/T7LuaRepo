CoD.FilesharePopup = {}
CoD.FilesharePopup.Accept = function ( popup, event )
	local occludedMenu = popup.occludedMenu
	popup:goBack( event.controller )
	popup.occludedMenu:processEvent( {
		name = popup.m_completionNotification,
		controller = event.controller,
		success = popup.m_wasSuccessful
	} )
end

LUI.createMenu.FilesharePopup_Success = function ( controller, message )
	local popup = CoD.Popup.SetupPopup( "FilesharePopup_Success", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( message )
	popup.m_wasSuccessful = true
	local accept = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), popup, "fileshare_popup_accept", false, nil, false )
	popup:addLeftButtonPrompt( accept )
	popup:registerEventHandler( "fileshare_popup_accept", CoD.FilesharePopup.Accept )
	return popup
end

LUI.createMenu.FilesharePopup_Failure = function ( controller, message )
	local popup = CoD.Popup.SetupPopup( "FilesharePopup_Failure", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( message )
	popup.m_wasSuccessful = false
	local accept = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), popup, "fileshare_popup_accept", false, nil, false )
	popup:addLeftButtonPrompt( accept )
	popup:registerEventHandler( "fileshare_popup_accept", CoD.FilesharePopup.Accept )
	return popup
end

CoD.FilesharePopup.Done = function ( popup, event )
	if event.success == true then
		local successPopup = popup.occludedMenu:openPopup( "FilesharePopup_Success", popup.m_ownerController, popup.m_successNotice )
		successPopup.m_completionNotification = popup.m_completionNotification
	else
		local failurePopup = popup.occludedMenu:openPopup( "FilesharePopup_Failure", popup.m_ownerController, popup.m_failureNotice )
		failurePopup.m_completionNotification = popup.m_completionNotification
	end
	popup:close()
end

CoD.FilesharePopup.InPlaceDone = function ( popup, event )
	popup.spinner:close()
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	local accept = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), popup, "fileshare_popup_accept", false, nil, false )
	popup:addLeftButtonPrompt( accept )
	popup:registerEventHandler( "fileshare_popup_accept", CoD.FilesharePopup.Accept )
	popup:registerEventHandler( popup.completionEvent, nil )
	if event.success == true then
		popup.msg:setText( popup.m_successNotice )
		popup.m_wasSuccessful = true
	else
		popup.msg:setText( popup.m_failureNotice )
		popup.m_wasSuccessful = false
	end
end

LUI.createMenu.Fileshare_BusyPopup = function ( controller, info )
	local popup = CoD.Popup.SetupPopupBusy( "Fileshare_BusyPopup", controller )
	popup:setOwner( controller )
	popup.m_successNotice = info.successNotice
	popup.m_failureNotice = info.failureNotice
	popup.m_completionNotification = info.completionNotification
	popup.title:setText( info.title )
	popup.msg:setText( info.message )
	popup.completionEvent = info.completionEvent
	if info.inPlace ~= nil then
		popup:registerEventHandler( info.completionEvent, CoD.FilesharePopup.InPlaceDone )
	else
		popup:registerEventHandler( info.completionEvent, CoD.FilesharePopup.Done )
	end
	info:actionFunc()
	return popup
end

CoD.FilesharePopup.Confirmed = function ( popup, event )
	local deletePopup = popup:openMenu( "Fileshare_BusyPopup", event.controller, popup.m_userInfo )
	popup:close()
end

LUI.createMenu.Fileshare_ConfirmationPopup = function ( controller, info )
	local popup = CoD.Popup.SetupPopupChoice( "Fileshare_ConfirmationPopup", controller )
	popup.title:setText( info.confirmationTitle )
	popup.msg:setText( info.confirmationMessage )
	popup:addBackButton()
	popup.m_userInfo = info
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "fileshare_confirmation_yes" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "fileshare_confirmation_yes", CoD.FilesharePopup.Confirmed )
	return popup
end

