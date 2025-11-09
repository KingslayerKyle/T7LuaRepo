CoD.ConfirmLeave = {}
local ConfirmLeave_Button_ConfirmAction = function ( self, event )
	if self.confirmEvent == nil then
		return 
	else
		self:goBack( event.controller )
		self.occludedMenu:processEvent( {
			name = self.confirmEvent,
			controller = event.controller
		} )
	end
end

local ConfirmLeave_Button_CancelAction = function ( self, event )
	if self.cancelEvent == nil then
		return 
	else
		self.occludedMenu:processEvent( {
			name = self.cancelEvent,
			controller = event.controller
		} )
		self:goBack( event.controller )
	end
end

CoD.ConfirmLeave.SetConfirmEvent = function ( self, confirmEvent )
	self.confirmEvent = confirmEvent
end

CoD.ConfirmLeave.SetCancelEvent = function ( self, cancelEvent )
	self.cancelEvent = cancelEvent
end

CoD.ConfirmLeave.CustomAction = function ( confirmMenu, event )
	if event.button.leaveEvent == nil then
		return 
	elseif CoD.isZombie and (Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) == true or Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true) and not Engine.IsPrimaryLocalClient( event.controller ) then
		confirmMenu:openPopup( "NoLeave", event.controller )
		return 
	else
		confirmMenu:goBack( event.controller )
		confirmMenu.occludedMenu:processEvent( {
			name = event.button.leaveEvent,
			controller = event.controller
		} )
	end
end

LUI.createMenu.ConfirmLeave = function ( controller, leaveHandlerTextTable )
	local confirmMenu = CoD.Menu.NewSmallPopup( "ConfirmLeave" )
	confirmMenu:addSelectButton()
	confirmMenu:addBackButton()
	confirmMenu:registerEventHandler( "confirm_action", ConfirmLeave_Button_ConfirmAction )
	confirmMenu:registerEventHandler( "cancel_action", CoD.Menu.ButtonPromptBack )
	confirmMenu:registerEventHandler( "custom_action", CoD.ConfirmLeave.CustomAction )
	confirmMenu.setMessageText = CoD.ConfirmLeave.SetMessageText
	confirmMenu.setConfirmEvent = CoD.ConfirmLeave.SetConfirmEvent
	confirmMenu.setCancelEvent = CoD.ConfirmLeave.SetCancelEvent
	local top = 0
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, CoD.Menu.SmallPopupWidth )
	title:setTopBottom( true, false, top, top + CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	title:setAlignment( LUI.Alignment.Left )
	title:setText( leaveHandlerTextTable.titleText )
	confirmMenu:addElement( title )
	top = top + CoD.textSize.Big
	local msg = LUI.UIText.new()
	msg:setLeftRight( true, true, 0, 0 )
	msg:setTopBottom( true, false, top, top + CoD.textSize.Default )
	msg:setFont( CoD.fonts.Default )
	msg:setAlignment( LUI.Alignment.Left )
	confirmMenu:addElement( msg )
	if leaveHandlerTextTable ~= nil and leaveHandlerTextTable.messageText ~= nil then
		msg:setText( leaveHandlerTextTable.messageText )
	end
	local numButtons = 1
	local offset = 10
	if leaveHandlerTextTable and leaveHandlerTextTable.params and #leaveHandlerTextTable.params > 0 then
		numButtons = #leaveHandlerTextTable.params
		if numButtons == 2 and CoD.isZombie == true then
			offset = 0
		end
	end
	confirmMenu.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height * numButtons - CoD.CoD9Button.Height * 3 + offset,
		bottom = 0
	} )
	confirmMenu:addElement( confirmMenu.buttonList )
	if leaveHandlerTextTable ~= nil then
		for index, data in pairs( leaveHandlerTextTable.params ) do
			local newButton = confirmMenu.buttonList:addButton( data.leaveText )
			newButton:setActionEventName( "custom_action" )
			newButton.leaveEvent = data.leaveEvent
		end
	else
		local yesButton = confirmMenu.buttonList:addButton( Engine.Localize( "MPUI_YES" ) )
		yesButton:setActionEventName( "confirm_action" )
	end
	local noButton = confirmMenu.buttonList:addButton( Engine.Localize( "MPUI_CANCEL" ) )
	noButton:setActionEventName( "cancel_action" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	Engine.PlaySound( "uin_lobby_exit" )
	return confirmMenu
end

