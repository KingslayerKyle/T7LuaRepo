require( "ui.uieditor.widgets.MenuSpecificWidgets.MarketplaceButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.PlayerBalanceWidget" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.PlayerInventoryButton" )

DataSources.PlayerBalance = DataSourceHelpers.ListSetup( "PlayerBalance", function ( controller )
	local playerBalancesList = {}
	local playerBalanceObjectTable = Engine.GetPlayerBalanceItems( controller )
	for _, playerBalanceObject in pairs( playerBalanceObjectTable ) do
		table.insert( playerBalancesList, {
			models = {
				balanceId = playerBalanceObject.id,
				balanceAmount = playerBalanceObject.value
			}
		} )
	end
	return playerBalancesList
end, true )
DataSources.MarketplaceItem = DataSourceHelpers.ListSetup( "MarketplaceItem", function ( controller )
	local marketplaceList = {}
	local skuObjectTable = Engine.GetMarketplaceItems()
	if skuObjectTable ~= nil then
		for index, skuObject in pairs( skuObjectTable ) do
			local f2_local3 = skuObject.rentalDuration
			local f2_local4 = ""
			if skuObject.rentalDuration == 0 then
				f2_local3 = "Infinite"
			elseif skuObject.rentalDurationUnit == 0 then
				f2_local4 = "??s"
			elseif skuObject.rentalDurationUnit == 1 then
				f2_local4 = "ms"
			elseif skuObject.rentalDurationUnit == 2 then
				f2_local4 = "s"
			elseif skuObject.rentalDurationUnit == 3 then
				f2_local4 = "min"
			elseif skuObject.rentalDurationUnit == 4 then
				f2_local4 = "hours"
			elseif skuObject.rentalDurationUnit == 5 then
				f2_local4 = "days"
			elseif skuObject.rentalDurationUnit == 6 then
				f2_local4 = "weeks"
			end
			table.insert( marketplaceList, {
				models = {
					itemIndex = index,
					skuId = skuObject.skuId,
					productName = skuObject.name,
					skuPrice = skuObject.skuPrice,
					currencyId = skuObject.currencyId,
					productId = skuObject.productId,
					rentalDuration = f2_local3,
					rentalDurationUnit = f2_local4
				}
			} )
		end
	end
	return marketplaceList
end, true )
DataSources.PlayerInventoryItem = DataSourceHelpers.ListSetup( "PlayerInventoryItem", function ( controller )
	local playerInventoryList = {}
	local inventoryItemObjectTable = Engine.GetPlayerInventoryItems( controller )
	for index, inventoryItemObject in pairs( inventoryItemObjectTable ) do
		local f3_local3 = ""
		if inventoryItemObject.isConsumable then
			f3_local3 = "Yes"
		else
			f3_local3 = "No"
		end
		local expiryDurationText = inventoryItemObject.expiryDuration
		if inventoryItemObject.expiryDuration ~= nil and inventoryItemObject.expiryDuration < 0 then
			expiryDurationText = "N/A"
		end
		table.insert( playerInventoryList, {
			models = {
				itemIndex = index,
				itemId = inventoryItemObject.itemId,
				productName = inventoryItemObject.name,
				itemQuantity = inventoryItemObject.quantity,
				itemXp = inventoryItemObject.xp,
				isConsumable = f3_local3,
				expiryDuration = expiryDurationText
			}
		} )
	end
	return playerInventoryList
end, true )
LUI.createMenu.MarketplaceTest = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MarketplaceTest" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MarketplaceTest.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1920 )
	Background:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( Background )
	self.Background = Background
	
	local MarketplaceList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	MarketplaceList:makeFocusable()
	MarketplaceList:setLeftRight( 0, 0, 251, 776 )
	MarketplaceList:setTopBottom( 0, 0, 395, 1001 )
	MarketplaceList:setWidgetType( CoD.MarketplaceButton )
	MarketplaceList:setVerticalCount( 4 )
	MarketplaceList:setDataSource( "MarketplaceItem" )
	MarketplaceList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MarketplaceList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MarketplaceList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PurchaseDWSKU( self, element, controller )
		UpdateElementDataSource( self, "MarketplaceList" )
		UpdateElementDataSource( self, "PlayerInventoryList" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( MarketplaceList )
	self.MarketplaceList = MarketplaceList
	
	local MarketplaceLabel = LUI.UITightText.new()
	MarketplaceLabel:setLeftRight( 0, 0, 250, 550 )
	MarketplaceLabel:setTopBottom( 0, 0, 318, 393 )
	MarketplaceLabel:setText( Engine.Localize( "Marketplace" ) )
	MarketplaceLabel:setTTF( "fonts/default.ttf" )
	self:addElement( MarketplaceLabel )
	self.MarketplaceLabel = MarketplaceLabel
	
	local PlayerInventory = LUI.UITightText.new()
	PlayerInventory:setLeftRight( 0, 0, 1138, 1438 )
	PlayerInventory:setTopBottom( 0, 0, 318, 393 )
	PlayerInventory:setText( Engine.Localize( "Player Inventory" ) )
	PlayerInventory:setTTF( "fonts/default.ttf" )
	self:addElement( PlayerInventory )
	self.PlayerInventory = PlayerInventory
	
	local PlayerInventoryList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	PlayerInventoryList:makeFocusable()
	PlayerInventoryList:setLeftRight( 0, 0, 1139, 1664 )
	PlayerInventoryList:setTopBottom( 0, 0, 395, 1001 )
	PlayerInventoryList:setWidgetType( CoD.PlayerInventoryButton )
	PlayerInventoryList:setVerticalCount( 4 )
	PlayerInventoryList:setDataSource( "PlayerInventoryItem" )
	PlayerInventoryList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return retVal
	end )
	PlayerInventoryList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( PlayerInventoryList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		RemoveFromPlayerInventory( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Consume Item", nil )
		return true
	end, false )
	self:addElement( PlayerInventoryList )
	self.PlayerInventoryList = PlayerInventoryList
	
	local PlayerBalancesLabel = LUI.UITightText.new()
	PlayerBalancesLabel:setLeftRight( 0, 0, 441, 741 )
	PlayerBalancesLabel:setTopBottom( 0, 0, 96, 168 )
	PlayerBalancesLabel:setText( Engine.Localize( "Player Balances" ) )
	PlayerBalancesLabel:setTTF( "fonts/default.ttf" )
	self:addElement( PlayerBalancesLabel )
	self.PlayerBalancesLabel = PlayerBalancesLabel
	
	local PlayerBalancesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	PlayerBalancesList:makeFocusable()
	PlayerBalancesList:setLeftRight( 0, 0, 442, 1346 )
	PlayerBalancesList:setTopBottom( 0, 0, 168, 318 )
	PlayerBalancesList:setWidgetType( CoD.PlayerBalanceWidget )
	PlayerBalancesList:setHorizontalCount( 3 )
	PlayerBalancesList:setDataSource( "PlayerBalance" )
	self:addElement( PlayerBalancesList )
	self.PlayerBalancesList = PlayerBalancesList
	
	MarketplaceList.navigation = {
		up = PlayerBalancesList,
		right = PlayerInventoryList
	}
	PlayerInventoryList.navigation = {
		left = MarketplaceList,
		up = PlayerBalancesList
	}
	PlayerBalancesList.navigation = {
		down = {
			MarketplaceList,
			PlayerInventoryList
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "refresh_dw_inventory_menu", function ( element, event )
		local retVal = nil
		UpdateElementDataSource( self, "MarketplaceList" )
		UpdateElementDataSource( self, "PlayerInventoryList" )
		UpdateElementDataSource( self, "PlayerBalancesList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "Back Out", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		ReportItemUsageTime( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "Update Usage Time", nil )
		return true
	end, false )
	MarketplaceList.id = "MarketplaceList"
	PlayerInventoryList.id = "PlayerInventoryList"
	PlayerBalancesList.id = "PlayerBalancesList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.MarketplaceList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MarketplaceList:close()
		self.PlayerInventoryList:close()
		self.PlayerBalancesList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MarketplaceTest.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

