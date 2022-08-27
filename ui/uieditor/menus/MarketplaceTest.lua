-- ba6d5638a0d9c4d9109328ce45efc006
-- This hash is used for caching, delete to decompile the file again

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
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setImage( RegisterImage( "uie_t7_campaign_bg_inf_01_c" ) )
	self:addElement( Background )
	self.Background = Background
	
	local MarketplaceList = LUI.UIList.new( f4_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	MarketplaceList:makeFocusable()
	MarketplaceList:setLeftRight( true, false, 167, 517 )
	MarketplaceList:setTopBottom( true, false, 262, 668 )
	MarketplaceList:setWidgetType( CoD.MarketplaceButton )
	MarketplaceList:setVerticalCount( 4 )
	MarketplaceList:setDataSource( "MarketplaceItem" )
	MarketplaceList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f4_local1:AddButtonCallbackFunction( MarketplaceList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		PurchaseDWSKU( self, f7_arg0, f7_arg2 )
		UpdateElementDataSource( self, "MarketplaceList" )
		UpdateElementDataSource( self, "PlayerInventoryList" )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	
	local PlayerInventoryList = LUI.UIList.new( f4_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	PlayerInventoryList:makeFocusable()
	PlayerInventoryList:setLeftRight( true, false, 759, 1109 )
	PlayerInventoryList:setTopBottom( true, false, 262, 668 )
	PlayerInventoryList:setWidgetType( CoD.PlayerInventoryButton )
	PlayerInventoryList:setVerticalCount( 4 )
	PlayerInventoryList:setDataSource( "PlayerInventoryItem" )
	PlayerInventoryList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
	f4_local1:AddButtonCallbackFunction( PlayerInventoryList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		RemoveFromPlayerInventory( self, f11_arg0, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Consume Item" )
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
	
	local PlayerBalancesList = LUI.UIList.new( f4_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	PlayerBalancesList:makeFocusable()
	PlayerBalancesList:setLeftRight( true, false, 294, 898 )
	PlayerBalancesList:setTopBottom( true, false, 112, 212 )
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
	CoD.Menu.AddNavigationHandler( f4_local1, self, controller )
	self:registerEventHandler( "refresh_dw_inventory_menu", function ( element, event )
		local f13_local0 = nil
		UpdateElementDataSource( self, "MarketplaceList" )
		UpdateElementDataSource( self, "PlayerInventoryList" )
		UpdateElementDataSource( self, "PlayerBalancesList" )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		GoBack( self, f14_arg2 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "Back Out" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		ReportItemUsageTime( self, f16_arg0, f16_arg2 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_RB, "Update Usage Time" )
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
		menu = f4_local1
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

