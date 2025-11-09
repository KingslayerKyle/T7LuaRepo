CoD.MTXPurchase = {}
LUI.createMenu.MTXPurchase = function ( controller, userData )
	local menuWidth = 480
	local msgText = Engine.Localize( CoD.CACUtility.GetMTXPurchaseMsg( userData.mtxName ) )
	local numLines = math.max( 5, Engine.GetNumTextLines( msgText, CoD.fonts.Default, CoD.textSize.Default, menuWidth ) )
	local menuHeight = CoD.textSize.Default * numLines + 160
	local mtxPurchaseMenu = CoD.Popup.SetupPopup( "MTXPurchase", controller, CoD.Popup.Type.STRETCHED )
	mtxPurchaseMenu:setWidthHeight( menuWidth, menuHeight )
	mtxPurchaseMenu:setOwner( controller )
	mtxPurchaseMenu.userData = userData
	mtxPurchaseMenu:registerEventHandler( "open_warning", CoD.MTXPurchase.OpenWarning )
	mtxPurchaseMenu:registerEventHandler( "cancel_action", CoD.Menu.ButtonPromptBack )
	mtxPurchaseMenu:addSelectButton()
	mtxPurchaseMenu:addBackButton()
	local titleText = "MPUI_" .. userData.mtxName
	mtxPurchaseMenu.title:setText( Engine.Localize( titleText ) )
	mtxPurchaseMenu.msg:setText( msgText )
	local buttonList = CoD.ButtonList.new()
	local top = -1 * (CoD.CoD9Button.Height * 3 + CoD.ButtonList.ButtonSpacing * 3)
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, top, 0 )
	mtxPurchaseMenu:addElement( buttonList )
	local yesButton = buttonList:addButton( Engine.Localize( "MENU_GO_TO_STORE" ) )
	yesButton:setActionEventName( "open_warning" )
	local noButton = buttonList:addButton( Engine.Localize( "MPUI_CANCEL" ) )
	noButton:setActionEventName( "cancel_action" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	return mtxPurchaseMenu
end

CoD.MTXPurchase.OpenWarning = function ( self, event )
	local isGameLobbyRunning = Engine.IsGameLobbyRunning()
	local inLobby = Engine.IsPartyLobbyRunning()
	if isGameLobbyRunning then
		local mtxStoreWarningMenu = self:openMenu( "MTXStoreWarning", event.controller, self.userData )
		if Engine.AloneInPrivatePartyIgnoreSplitscreen( true ) then
			mtxStoreWarningMenu.msg:setText( Engine.Localize( "MPUI_MTX_LEAVE_LOBBY_WARNING" ) )
		else
			mtxStoreWarningMenu.msg:setText( Engine.Localize( "MPUI_MTX_LEAVE_PARTY_WARNING" ) )
		end
		mtxStoreWarningMenu:setPreviousMenu( nil )
		self:close()
	elseif inLobby and not Engine.AloneInPrivatePartyIgnoreSplitscreen( true ) then
		local mtxStoreWarningMenu = self:openMenu( "MTXStoreWarning", event.controller, self.userData )
		mtxStoreWarningMenu.msg:setText( Engine.Localize( "MPUI_MTX_LEAVE_PARTY_WARNING" ) )
		mtxStoreWarningMenu:setPreviousMenu( nil )
		self:close()
	else
		CoD.MTXPurchase.GoToStore( self, event )
	end
end

LUI.createMenu.MTXStoreWarning = function ( controller, userData )
	local menuWidth = 480
	local menuHeight = CoD.textSize.Default * 5 + 160
	local mtxStoreWarningMenu = CoD.Popup.SetupPopup( "MTXPurchase", controller, CoD.Popup.Type.STRETCHED )
	mtxStoreWarningMenu:setWidthHeight( menuWidth, menuHeight )
	mtxStoreWarningMenu:setOwner( controller )
	mtxStoreWarningMenu.userData = userData
	mtxStoreWarningMenu:registerEventHandler( "go_to_store", CoD.MTXPurchase.GoToStore )
	mtxStoreWarningMenu:registerEventHandler( "cancel_action", CoD.Menu.ButtonPromptBack )
	mtxStoreWarningMenu:addSelectButton()
	mtxStoreWarningMenu:addBackButton()
	mtxStoreWarningMenu.title:setText( Engine.Localize( "MENU_WARNING" ) )
	local buttonList = CoD.ButtonList.new()
	local top = -1 * (CoD.CoD9Button.Height * 3 + CoD.ButtonList.ButtonSpacing * 3)
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, top, 0 )
	mtxStoreWarningMenu:addElement( buttonList )
	local yesButton = buttonList:addButton( Engine.Localize( "MENU_CONTINUE" ) )
	yesButton:setActionEventName( "go_to_store" )
	local noButton = buttonList:addButton( Engine.Localize( "MPUI_CANCEL" ) )
	noButton:setActionEventName( "cancel_action" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	return mtxStoreWarningMenu
end

CoD.MTXPurchase.GoToStore = function ( self, event )
	Engine.PurchaseMTX( event.controller, self.userData.mtxName, self.userData.openingMenuName )
end

