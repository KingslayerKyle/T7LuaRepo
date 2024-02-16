CoD.Popup = {}
CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME = 30000
if CoD.isPS3 then
	CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME = 40000
end
if CoD.isXbox then
	CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME = 60000
end
CoD.Popup.Type = {}
CoD.Popup.Type.REGULAR = 1
CoD.Popup.Type.WIDE = 2
CoD.Popup.Type.STRETCHED = 3
CoD.Popup.StretchedWidth = CoD.Menu.SmallPopupWidth
CoD.Popup.StretchedHeight = CoD.Menu.SmallPopupHeight
if CoD.isZombie == true then
	CoD.Popup.StretchedWidth = CoD.Menu.SmallPopupWidth
	CoD.Popup.StretchedHeight = 300
end
LUI.createMenu.popup_contentrestricted = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_contentrestricted", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "PLATFORM_FILESHARE_ACCESSERROR_MSG" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_guest_contentrestricted = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_contentrestricted", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "MENU_GUEST_CONTENT_RESTRICTED" ) )
	popup:addBackButton()
	return popup
end

LUI.createMenu.popup_chatrestricted = function ( controller )
	local popup = CoD.Popup.SetupPopup( "popup_chatrestricted", controller )
	popup.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	popup.msg:setText( Engine.Localize( "PLATFORM_CHAT_DISABLED" ) )
	popup.anyControllerAllowed = true
	popup.primaryButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), popup, "restriction_accepted" )
	popup:addLeftButtonPrompt( popup.primaryButton )
	popup:addBackButton()
	popup:registerEventHandler( "restriction_accepted", CoD.Popup.ChatRestrictionAccepted )
	return popup
end

CoD.Popup.ChatRestrictionAccepted = function ( self, event )
	self:goBack( event.controller )
	if self.callingMenu ~= nil then
		CoD.MainMenu.OpenMainLobby( self.callingMenu, event )
	end
end

CoD.Popup.SetupPopup = function ( popupName, controller, popupType )
	local popup = CoD.Popup.CreatePopup( popupName, popupType )
	popup:setOwner( controller )
	popup:registerEventHandler( "menu_changed", CoD.Popup.MenuChanged )
	popup:registerEventHandler( "close_popup", CoD.Popup.Close )
	local top = 0
	local title = LUI.UIText.new()
	local popupWidth = CoD.Menu.SmallPopupWidth
	title:setLeftRight( true, true, 0, 0 )
	title:setTopBottom( true, false, top, top + CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	title:setAlignment( LUI.Alignment.Left )
	popup.title = title
	popup:addElement( title )
	top = top + CoD.textSize.Big + 10
	local msg = LUI.UIText.new()
	msg:setLeftRight( true, true, 0, 0 )
	if popupType == CoD.Popup.Type.WIDE then
		popupWidth = CoD.Menu.MediumPopupWidth
		msg:setLeftRight( true, false, 0, popupWidth / 2 )
	end
	msg:setTopBottom( true, false, top, top + CoD.textSize.Default )
	msg:setFont( CoD.fonts.Default )
	msg:setAlignment( LUI.Alignment.Left )
	popup.msg = msg
	popup:addElement( msg )
	local rightInfoContainer = LUI.UIElement.new()
	rightInfoContainer:setLeftRight( true, true, popupWidth / 2, 0 )
	rightInfoContainer:setTopBottom( true, true, 0, 0 )
	popup.rightInfoContainer = rightInfoContainer
	popup:addElement( rightInfoContainer )
	return popup
end

CoD.Popup.SetupPopupBusy = function ( popupName, controller, popupType )
	local popup = CoD.Popup.SetupPopup( popupName, controller, popupType )
	local iconHeight = 64
	local iconWidth = 64
	popup.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	popup.spinner:setLeftRight( true, true, CoD.Menu.SmallPopupWidth / 2 - iconWidth / 2, -(CoD.Menu.SmallPopupWidth / 2 - iconWidth / 2) )
	popup.spinner:setTopBottom( true, false, 60, 60 + iconHeight )
	popup.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	popup:addElement( popup.spinner )
	return popup
end

CoD.Popup.SetupPopupChoice = function ( popupName, controller, choiceCount, popupType )
	local popup = CoD.Popup.SetupPopup( popupName, controller, popupType )
	
	local choiceList = CoD.ButtonList.new()
	choiceList:setLeftRight( true, true, 0, 0 )
	choiceList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
	popup:addElement( choiceList )
	popup.choiceList = choiceList
	
	if choiceCount == nil then
		choiceCount = 2
	elseif choiceCount > 5 then
		choiceCount = 5
	end
	for i = 1, choiceCount, 1 do
		local choice = choiceList:addButton( "" )
		choice:setActionEventName( "button_prompt_back" )
		choiceList:addElement( choice )
		if i == 1 then
			popup.choiceA = choice
		end
		if i == 2 then
			popup.choiceB = choice
		end
		if i == 3 then
			popup.choiceC = choice
		end
		if i == 4 then
			popup.choiceD = choice
		end
	end
	popup:addSelectButton()
	return popup
end

CoD.Popup.SetWidthHeight = function ( self, popupWidth, popupHeight )
	local width = CoD.Popup.StretchedWidth
	if popupWidth then
		width = popupWidth
	end
	if Engine.IsInGame() then
		local smallWidth = width / 2 + 25
		local smallHeight = popupHeight / 2 + 10
		local heightOffset = 20
		self.smallPopupBackground:setLeftRight( false, false, -smallWidth, smallWidth )
		self.smallPopupBackground:setTopBottom( false, false, -smallHeight - heightOffset, smallHeight - heightOffset )
		self:setLeftRight( false, false, -width / 2, width / 2 )
		self:setTopBottom( false, false, -popupHeight / 2, popupHeight / 2 )
	elseif self.popupBG then
		self.popupBG:close()
		self:addSmallPopupBackground( nil, width, popupHeight )
	end
end

CoD.Popup.CreatePopup = function ( popupName, popupType )
	local popup = nil
	if popupType == nil then
		popupType = CoD.Popup.Type.REGULAR
	elseif popupType < CoD.Popup.Type.REGULAR or popupType > CoD.Popup.Type.STRETCHED then
		popupType = CoD.Popup.Type.REGULAR
	end
	if popupType == CoD.Popup.Type.WIDE then
		popup = CoD.Menu.NewMediumPopup( popupName )
	elseif popupType == CoD.Popup.Type.STRETCHED then
		popup = CoD.Menu.NewSmallPopup( popupName, nil, nil, CoD.Popup.StretchedWidth, CoD.Popup.StretchedHeight )
	else
		popup = CoD.Menu.NewSmallPopup( popupName )
	end
	popup.setWidthHeight = CoD.Popup.SetWidthHeight
	return popup
end

CoD.Popup.MenuChanged = function ( self, event )
	if self.occludedMenu == event.prevMenu then
		self:setOccludedMenu( event.nextMenu )
	end
end

CoD.Popup.Close = function ( self, event )
	if self.menuName == event.popupName then
		self:goBack()
		return true
	else
		
	end
end

