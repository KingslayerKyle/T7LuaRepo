require( "ui.uieditor.widgets.MenuSpecificWidgets.MarketplaceButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.PlayerInventoryButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.PlayerBalanceWidget" )

DataSources.PlayerBalance = DataSourceHelpers.ListSetup( "PlayerBalance", function ( f1_arg0 )
	local f1_local0 = {}
	for f1_local4, f1_local5 in pairs( Engine.GetPlayerBalanceItems( f1_arg0 ) ) do
		table.insert( f1_local0, {
			models = {
				balanceId = f1_local5.id,
				balanceAmount = f1_local5.value
			}
		} )
	end
	return f1_local0
end, true )
DataSources.MarketplaceItem = DataSourceHelpers.ListSetup( "MarketplaceItem", function ( f2_arg0 )
	local f2_local0 = {}
	local f2_local1 = Engine.GetMarketplaceItems()
	if f2_local1 ~= nil then
		for f2_local7, f2_local8 in pairs( f2_local1 ) do
			local f2_local5 = f2_local8.rentalDuration
			local f2_local6 = ""
			if f2_local8.rentalDuration == 0 then
				f2_local5 = "Infinite"
			elseif f2_local8.rentalDurationUnit == 0 then
				f2_local6 = "??s"
			elseif f2_local8.rentalDurationUnit == 1 then
				f2_local6 = "ms"
			elseif f2_local8.rentalDurationUnit == 2 then
				f2_local6 = "s"
			elseif f2_local8.rentalDurationUnit == 3 then
				f2_local6 = "min"
			elseif f2_local8.rentalDurationUnit == 4 then
				f2_local6 = "hours"
			elseif f2_local8.rentalDurationUnit == 5 then
				f2_local6 = "days"
			elseif f2_local8.rentalDurationUnit == 6 then
				f2_local6 = "weeks"
			end
			table.insert( f2_local0, {
				models = {
					itemIndex = f2_local7,
					skuId = f2_local8.skuId,
					productName = f2_local8.name,
					skuPrice = f2_local8.skuPrice,
					currencyId = f2_local8.currencyId,
					productId = f2_local8.productId,
					rentalDuration = f2_local5,
					rentalDurationUnit = f2_local6
				}
			} )
		end
	end
	return f2_local0
end, true )
DataSources.PlayerInventoryItem = DataSourceHelpers.ListSetup( "PlayerInventoryItem", function ( f3_arg0 )
	local f3_local0 = {}
	for f3_local6, f3_local7 in pairs( Engine.GetPlayerInventoryItems( f3_arg0 ) ) do
		local f3_local4 = ""
		if f3_local7.isConsumable then
			f3_local4 = "Yes"
		else
			f3_local4 = "No"
		end
		local f3_local5 = f3_local7.expiryDuration
		if f3_local7.expiryDuration ~= nil and f3_local7.expiryDuration < 0 then
			f3_local5 = "N/A"
		end
		table.insert( f3_local0, {
			models = {
				itemIndex = f3_local6,
				itemId = f3_local7.itemId,
				productName = f3_local7.name,
				itemQuantity = f3_local7.quantity,
				itemXp = f3_local7.xp,
				isConsumable = f3_local4,
				expiryDuration = f3_local5
			}
		} )
	end
	return f3_local0
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MarketplaceTest.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setImage( RegisterImage( "uie_t7_campaign_bg_inf_01_c" ) )
	self:addElement( Background )
	self.Background = Background
	
	local MarketplaceList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	MarketplaceList:makeFocusable()
	MarketplaceList:setLeftRight( true, false, 167, 517 )
	MarketplaceList:setTopBottom( true, false, 262, 668 )
	MarketplaceList:setDataSource( "MarketplaceItem" )
	MarketplaceList:setWidgetType( CoD.MarketplaceButton )
	MarketplaceList:setVerticalCount( 4 )
	MarketplaceList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	MarketplaceList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	self:AddButtonCallbackFunction( MarketplaceList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	
	local PlayerInventoryList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	PlayerInventoryList:makeFocusable()
	PlayerInventoryList:setLeftRight( true, false, 759, 1109 )
	PlayerInventoryList:setTopBottom( true, false, 262, 668 )
	PlayerInventoryList:setDataSource( "PlayerInventoryItem" )
	PlayerInventoryList:setWidgetType( CoD.PlayerInventoryButton )
	PlayerInventoryList:setVerticalCount( 4 )
	PlayerInventoryList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f9_local0
	end )
	PlayerInventoryList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( PlayerInventoryList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
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
	
	local PlayerBalancesList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "refresh_dw_inventory_menu", function ( self, event )
		local f13_local0 = nil
		UpdateElementDataSource( self, "MarketplaceList" )
		UpdateElementDataSource( self, "PlayerInventoryList" )
		UpdateElementDataSource( self, "PlayerBalancesList" )
		if not f13_local0 then
			f13_local0 = self:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "Back Out" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
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
		menu = self
	} )
	if not self:restoreState() then
		self.MarketplaceList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MarketplaceList:close()
		element.PlayerInventoryList:close()
		element.PlayerBalancesList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MarketplaceTest.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

