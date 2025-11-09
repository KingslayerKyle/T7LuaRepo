CoD.ConfirmPrestigeUnlock = {}
local Confirm_Button_Back = function ( self, event )
	CoD.perController[event.controller].prestigeUnlockEvent = nil
	CoD.perController[event.controller].prestigeUnlockEquipEvent = nil
	CoD.perController[event.controller].prestigeUnlockItemIndex = nil
	self:goBack()
end

local Confirm_Button_BuyAction = function ( self, event )
	Engine.PermanentlyUnlockItem( event.controller, CoD.perController[event.controller].prestigeUnlockItemIndex )
	self.occludedMenu:processEvent( CoD.perController[event.controller].prestigeUnlockEvent )
	Confirm_Button_Back( self, event )
end

local Confirm_Button_BuyEquipAction = function ( self, event )
	local prestigeUnlockEquipEvent = CoD.perController[event.controller].prestigeUnlockEquipEvent
	local occludedMenu = self.occludedMenu
	Confirm_Button_BuyAction( self, event )
	self:close()
	if prestigeUnlockEquipEvent ~= nil then
		occludedMenu:processEvent( prestigeUnlockEquipEvent )
	end
end

local PopupTextLine = function ( self, top, height, font, text )
	local messageText = LUI.UIText.new()
	messageText:setLeftRight( true, true, 0, 0 )
	messageText:setTopBottom( true, false, top, top + height )
	messageText:setFont( font )
	messageText:setAlignment( LUI.Alignment.Left )
	messageText:setText( text )
	self:addElement( messageText )
	return messageText
end

LUI.createMenu.ConfirmPrestigeUnlock = function ( controller, removeBuyAndEquipButton )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE_EXTRAS ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE_EXTRAS )
		return 
	end
	local confirmMenu = CoD.Menu.NewSmallPopup( "ConfirmPrestigeUnlock" )
	confirmMenu:addSelectButton()
	confirmMenu:addBackButton()
	confirmMenu:registerEventHandler( "buy_equip_action", Confirm_Button_BuyEquipAction )
	confirmMenu:registerEventHandler( "buy_action", Confirm_Button_BuyAction )
	confirmMenu:registerEventHandler( "cancel_action", Confirm_Button_Back )
	confirmMenu:registerEventHandler( "button_prompt_back", Confirm_Button_Back )
	local top = 0
	confirmMenu.messageText = PopupTextLine( confirmMenu, top, CoD.textSize.Big, CoD.fonts.Big, Engine.Localize( "MPUI_CONFIRM_PERMANENTLY_UNLOCK" ) )
	top = top + CoD.textSize.Big
	confirmMenu.itemText = PopupTextLine( confirmMenu, top, CoD.textSize.Default, CoD.fonts.Default, Engine.Localize( "MPUI_PERMANENT_UNLOCK_ITEM", Engine.GetItemName( CoD.perController[controller].prestigeUnlockItemIndex ) ) )
	top = top + CoD.textSize.Default
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 4 + 10,
		bottom = 0
	} )
	confirmMenu:addElement( buttonList )
	if not removeBuyAndEquipButton then
		local buyAndEquipButton = buttonList:addButton( Engine.Localize( "MENU_UNLOCK_AND_EQUIP" ) )
		buyAndEquipButton:setActionEventName( "buy_equip_action" )
	end
	local buyButton = buttonList:addButton( Engine.Localize( "MENU_UNLOCK" ) )
	buyButton:setActionEventName( "buy_action" )
	local noButton = buttonList:addButton( Engine.Localize( "MENU_CANCEL_UNLOCK" ) )
	noButton:setActionEventName( "cancel_action" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	return confirmMenu
end

CoD.ConfirmPrestigeUnlock.OpenIfNecessary = function ( self, controller, itemIndex, button, removeBuyAndEquipButton )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE_EXTRAS ) then
		Engine.ExecNow( controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE_EXTRAS )
		return 
	else
		CoD.perController[controller].prestigeUnlockItemIndex = itemIndex
		CoD.perController[controller].prestigeUnlockEvent = {
			name = "purchased",
			controller = controller,
			button = button
		}
		CoD.perController[controller].prestigeUnlockEquipEvent = {
			name = "content_button_selected",
			controller = controller,
			contentIndex = itemIndex,
			button = button
		}
		local ConfirmPrestigeUnlockPopup = self:openPopup( "ConfirmPrestigeUnlock", controller, removeBuyAndEquipButton )
		return ConfirmPrestigeUnlockPopup
	end
end

