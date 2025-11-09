CoD.ConfirmPurchase = {}
CoD.ConfirmPurchase.PreviewHeight = 100
local Confirm_Button_Back = function ( self, event )
	CoD.perController[event.controller].purchaseEvent = nil
	CoD.perController[event.controller].purchaseEquipEvent = nil
	CoD.perController[event.controller].purchaseItemIndex = nil
	self:goBack()
end

local Confirm_Button_BuyAction = function ( self, event )
	Engine.PurchaseItem( event.controller, CoD.perController[event.controller].purchaseItemIndex )
	self.occludedMenu:processEvent( CoD.perController[event.controller].purchaseEvent )
	Confirm_Button_Back( self, event )
end

local Confirm_Button_BuyEquipAction = function ( self, event )
	local purchaseEquipEvent = CoD.perController[event.controller].purchaseEquipEvent
	local occludedMenu = self.occludedMenu
	Confirm_Button_BuyAction( self, event )
	self:close()
	if purchaseEquipEvent ~= nil then
		occludedMenu:processEvent( purchaseEquipEvent )
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

LUI.createMenu.ConfirmPurchase = function ( controller, removeBuyAndEquipButton )
	local confirmMenu = CoD.Menu.NewSmallPopup( "ConfirmPurchase" )
	confirmMenu.updatePreview = CoD.ConfirmPurchase.UpdatePreview
	confirmMenu:addSelectButton()
	confirmMenu:addBackButton()
	confirmMenu:registerEventHandler( "buy_equip_action", Confirm_Button_BuyEquipAction )
	confirmMenu:registerEventHandler( "buy_action", Confirm_Button_BuyAction )
	confirmMenu:registerEventHandler( "cancel_action", Confirm_Button_Back )
	confirmMenu:registerEventHandler( "button_prompt_back", Confirm_Button_Back )
	local top = 0
	confirmMenu.messageText = PopupTextLine( confirmMenu, top, CoD.textSize.Big, CoD.fonts.Big, Engine.Localize( "MPUI_CONFIRM_PURCHASE_CAPS" ) )
	top = top + CoD.textSize.Big
	confirmMenu.itemText = PopupTextLine( confirmMenu, top, CoD.textSize.Default, CoD.fonts.Default, Engine.Localize( "MPUI_UNLOCK_ITEM", Engine.GetItemName( CoD.perController[controller].purchaseItemIndex ) ) )
	top = top + CoD.textSize.Default
	local currentUnlocks = CoD.CAC.GetUnlockCountForGroup( controller, Engine.GetItemGroup( CoD.perController[controller].purchaseItemIndex ) )
	local unlockString = Engine.Localize( "MENU_UNLOCK_TOKEN_AVAILABLE", currentUnlocks )
	if currentUnlocks > 1 then
		unlockString = Engine.Localize( "MPUI_UNLOCK_TOKENS_AVAILABLE", currentUnlocks )
	end
	confirmMenu.tokenText = PopupTextLine( confirmMenu, top, CoD.textSize.Default, CoD.fonts.Default, unlockString )
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
	local previewHeight = CoD.ConfirmPurchase.PreviewHeight
	local previewWidth = previewHeight * 2
	local rightOffset = CoD.ConfirmPurchase.PreviewHeight + 2
	local bottomOffset = 40
	confirmMenu.previewImage = LUI.UIImage.new()
	confirmMenu.previewImage:setLeftRight( false, true, -rightOffset - previewWidth / 2, -rightOffset - previewWidth / 2 )
	confirmMenu.previewImage:setTopBottom( false, true, -bottomOffset - previewHeight, -bottomOffset )
	confirmMenu.previewImage:setAlpha( 0 )
	confirmMenu:addElement( confirmMenu.previewImage )
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

CoD.ConfirmPurchase.UpdatePreview = function ( self, itemIndex )
	local materialName, defaultWidth, defaultHeight = CoD.GetItemMaterialNameWidthAndHeight( itemIndex, true )
	local aspectRatio = defaultWidth / defaultHeight
	local previewWidth = CoD.ConfirmPurchase.PreviewHeight * aspectRatio
	local rightOffset = CoD.ConfirmPurchase.PreviewHeight + 2
	self.previewImage:beginAnimation( "change_material" )
	self.previewImage:setLeftRight( false, true, -rightOffset - previewWidth / 2, -rightOffset + previewWidth / 2 )
	self.previewImage:setImage( RegisterMaterial( materialName ) )
	self.previewImage:setAlpha( 1 )
end

CoD.ConfirmPurchase.OpenIfNecessary = function ( self, controller, itemIndex, button, removeBuyAndEquipButton )
	if not Engine.IsItemLocked( controller, itemIndex ) and not Engine.IsItemPurchased( controller, itemIndex ) and Engine.GetItemCost( itemIndex ) > 0 then
		if CoD.CAC.CanAffordUnlocksForItemIndex( controller, itemIndex ) then
			CoD.perController[controller].purchaseItemIndex = itemIndex
			CoD.perController[controller].purchaseEvent = {
				name = "purchased",
				controller = controller,
				button = button
			}
			CoD.perController[controller].purchaseEquipEvent = {
				name = "content_button_selected",
				controller = controller,
				contentIndex = itemIndex,
				button = button
			}
			local ConfirmPurchasePopup = self:openPopup( "ConfirmPurchase", controller, removeBuyAndEquipButton )
			ConfirmPurchasePopup:updatePreview( itemIndex )
			return ConfirmPurchasePopup
		end
		Engine.PlaySound( CoD.CACUtility.denySFX )
	end
	return nil
end

