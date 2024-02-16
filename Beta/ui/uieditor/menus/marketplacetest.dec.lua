require( "ui.uieditor.widgets.MenuSpecificWidgets.MarketplaceButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.PlayerInventoryButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.PlayerBalanceWidget" )

DataSources.PlayerBalance = DataSourceHelpers.ListSetup( "PlayerBalance", function ( controller )
	local playerBalancesList = {}
	local playerBalanceObjectTable = Engine.GetPlayerBalanceItems( controller )
	for _, playerBalanceObject in pairs( playerBalanceObjectTable ) do
		table.insert( playerBalancesList, {
			models = {
				balanceId = playerBalanceObject.id,
				balanceAmount = REG7.value
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
			elseif REG7.rentalDurationUnit == 0 then
				f2_local4 = "??s"
			elseif REG7.rentalDurationUnit == 1 then
				f2_local4 = "ms"
			elseif REG7.rentalDurationUnit == 2 then
				f2_local4 = "s"
			elseif REG7.rentalDurationUnit == 3 then
				f2_local4 = "min"
			elseif REG7.rentalDurationUnit == 4 then
				f2_local4 = "hours"
			elseif REG7.rentalDurationUnit == 5 then
				f2_local4 = "days"
			elseif REG7.rentalDurationUnit == 6 then
				f2_local4 = "weeks"
			end
			table.insert( marketplaceList, {
				models = {
					itemIndex = REG6,
					skuId = REG7.skuId,
					productName = REG7.name,
					skuPrice = REG7.skuPrice,
					currencyId = REG7.currencyId,
					productId = REG7.productId,
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
		local expiryDurationText = REG7.expiryDuration
		if REG7.expiryDuration ~= nil and REG7.expiryDuration < 0 then
			expiryDurationText = "N/A"
		end
		table.insert( playerInventoryList, {
			models = {
				itemIndex = REG6,
				itemId = REG7.itemId,
				productName = REG7.name,
				itemQuantity = REG7.quantity,
				itemXp = REG7.xp,
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MarketplaceTest.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setImage( RegisterImage( "uie_t7_campaign_bg_inf_01_c" ) )
	self:addElement( Background )
	self.Background = Background
	
	local MarketplaceList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	MarketplaceList:makeFocusable()
	MarketplaceList:setLeftRight( true, false, 167, 517 )
	MarketplaceList:setTopBottom( true, false, 262, 668 )
	MarketplaceList:setDataSource( "MarketplaceItem" )
	MarketplaceList:setWidgetType( CoD.MarketplaceButton )
	MarketplaceList:setVerticalCount( 4 )
	MarketplaceList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( MarketplaceList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		AddToPlayerInventory( self, element, controller )
		UpdateElementDataSource( self, "MarketplaceList" )
		UpdateElementDataSource( self, "PlayerInventoryList" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( MarketplaceList )
	self.MarketplaceList = MarketplaceList
	
	local MarketplaceLabel = LUI.UITightText.new()
	MarketplaceLabel:setLeftRight( true, false, 167, 367 )
	MarketplaceLabel:setTopBottom( true, false, 212, 262 )
	MarketplaceLabel:setText( Engine.Localize( "Marketplace" ) )
	MarketplaceLabel:setTTF( "fonts/default.ttf" )
	self:addElement( MarketplaceLabel )
	self.MarketplaceLabel = MarketplaceLabel
	
	local PlayerInventory = LUI.UITightText.new()
	PlayerInventory:setLeftRight( true, false, 759, 959 )
	PlayerInventory:setTopBottom( true, false, 212, 262 )
	PlayerInventory:setText( Engine.Localize( "Player Inventory" ) )
	PlayerInventory:setTTF( "fonts/default.ttf" )
	self:addElement( PlayerInventory )
	self.PlayerInventory = PlayerInventory
	
	local PlayerInventoryList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	PlayerInventoryList:makeFocusable()
	PlayerInventoryList:setLeftRight( true, false, 759, 1109 )
	PlayerInventoryList:setTopBottom( true, false, 262, 668 )
	PlayerInventoryList:setDataSource( "PlayerInventoryItem" )
	PlayerInventoryList:setWidgetType( CoD.PlayerInventoryButton )
	PlayerInventoryList:setVerticalCount( 4 )
	PlayerInventoryList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
	menu:AddButtonCallbackFunction( PlayerInventoryList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		RemoveFromPlayerInventory( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Consume Item" )
		return true
	end, false )
	self:addElement( PlayerInventoryList )
	self.PlayerInventoryList = PlayerInventoryList
	
	local PlayerBalancesLabel = LUI.UITightText.new()
	PlayerBalancesLabel:setLeftRight( true, false, 294, 494 )
	PlayerBalancesLabel:setTopBottom( true, false, 64, 112 )
	PlayerBalancesLabel:setText( Engine.Localize( "Player Balances" ) )
	PlayerBalancesLabel:setTTF( "fonts/default.ttf" )
	self:addElement( PlayerBalancesLabel )
	self.PlayerBalancesLabel = PlayerBalancesLabel
	
	local PlayerBalancesList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	PlayerBalancesList:makeFocusable()
	PlayerBalancesList:setLeftRight( true, false, 294, 898 )
	PlayerBalancesList:setTopBottom( true, false, 112, 212 )
	PlayerBalancesList:setDataSource( "PlayerBalance" )
	PlayerBalancesList:setWidgetType( CoD.PlayerBalanceWidget )
	PlayerBalancesList:setHorizontalCount( 3 )
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "Back Out" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		ReportItemUsageTime( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "Update Usage Time" )
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
		menu = menu
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

