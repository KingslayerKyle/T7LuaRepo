require( "ui.uieditor.menus.Store.Store_CodPoints" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactoryBottomLeftLabel" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactoryVat" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewMachine" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )

CoD.OverlayUtility.AddSystemOverlay( "PurchaseVials", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_MegaChew",
	title = function ( controller, params )
		if Engine.GetCoDPoints( controller ) < 200 then
			return "MPUI_BM_NO_CURRENCY"
		else
			return Engine.Localize( "ZMUI_MEGACHEW_VIAL_NOTCAPS" )
		end
	end,
	description = function ( controller, params )
		if Engine.GetCoDPoints( controller ) < 200 then
			return Engine.Localize( "ZMUI_NOT_ENOUGH_COD_POINTS_TO_TRADE" )
		else
			return Engine.Localize( "ZMUI_TRADE_CODPOINTS_FOR_VIALS_DESC" )
		end
	end,
	image = function ( controller, params )
		return params.image
	end,
	cost = function ( controller, params )
		return params.itemCost
	end,
	vials = function ( controller, params )
		return 0
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "PurchaseSupplyDrop",
	listDatasource = function ( controller, params )
		DataSources.PurchaseSupplyDropMenuList = DataSourceHelpers.ListSetup( "PurchaseSupplyDropMenuList", function ( controller )
			local list = {}
			local addItemListButton = function ( displayText, action, selected, vials, cost )
				if cost == nil or Engine.GetCoDPoints( controller ) >= cost then
					local f8_local0 = false
				else
					local disabled = true
				end
				local f8_local1 = {}
				local f8_local2 = {}
				local f8_local3
				if vials then
					f8_local3 = Engine.Localize( displayText, cost, vials )
					if not f8_local3 then
					
					else
						f8_local2.displayText = f8_local3
						f8_local2.vials = vials
						f8_local2.disabled = f8_local0
						f8_local1.models = f8_local2
						f8_local1.properties = {
							action = action,
							actionParam = {
								vials = vials,
								cost = cost
							},
							selectIndex = selected
						}
						return f8_local1
					end
				end
				f8_local3 = displayText
			end
			
			local ConfirmPurchaseVialsAction = function ( self, element, controller, actionParam, menu )
				local parentMenu = GoBack( menu, controller )
				CoD.OverlayUtility.CreateOverlay( controller, parentMenu, "PurchaseVialsConfirmation", controller, actionParam )
			end
			
			local CancelPurchaseAction = function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end
			
			local PurchaseCodpointsAction = function ( self, element, controller, actionParam, menu )
				OpenOverlay( menu, "Store_CodPoints", controller )
			end
			
			if Engine.GetCoDPoints( controller ) < 200 then
				table.insert( list, addItemListButton( "MPUI_PURCHASE_CODPOINTS_CAPS", PurchaseCodpointsAction, true, false ) )
			else
				table.insert( list, addItemListButton( "ZMUI_PURCHASE_VIALS", ConfirmPurchaseVialsAction, true, 3, 200 ) )
				table.insert( list, addItemListButton( "ZMUI_PURCHASE_VIALS", ConfirmPurchaseVialsAction, false, 6, 400 ) )
				table.insert( list, addItemListButton( "ZMUI_PURCHASE_VIALS", ConfirmPurchaseVialsAction, false, 9, 600 ) )
			end
			table.insert( list, addItemListButton( "MENU_CANCEL_CAPS", CancelPurchaseAction, false, false ) )
			return list
		end, true )
		return "PurchaseSupplyDropMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PurchaseVialsConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_MegaChew",
	title = function ( controller, params )
		return Engine.Localize( "ZMUI_CONFIRM_TRADE" )
	end,
	description = function ( controller, params )
		return Engine.Localize( "ZMUI_TRADE_CONFIRMATION_DESC", params.cost, params.vials )
	end,
	image = function ( controller, params )
		return params.image
	end,
	cost = function ( controller, params )
		return params.itemCost
	end,
	vials = function ( controller, params )
		return params.vials
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "PurchaseSupplyDrop",
	listDatasource = function ( controller, params )
		DataSources.PurchaseSupplyDropMenuList = DataSourceHelpers.ListSetup( "PurchaseSupplyDropMenuList", function ( controller, list )
			local buttonsList = {}
			if list.purchasingVials then
				return {}
			else
				local addItemListButton = function ( displayText, action, selected, disabled, vials, cost )
					local f19_local0 = {}
					local f19_local1 = {}
					local f19_local2
					if vials then
						f19_local2 = Engine.Localize( displayText, cost, vials )
						if not f19_local2 then
						
						else
							f19_local1.displayText = f19_local2
							f19_local1.vials = vials
							f19_local1.disabled = disabled
							f19_local0.models = f19_local1
							f19_local0.properties = {
								action = action,
								actionParam = {
									vials = vials,
									cost = cost
								},
								selectIndex = selected
							}
							return f19_local0
						end
					end
					f19_local2 = displayText
				end
				
				local PurchaseVialsAction = function ( self, element, controller, actionParam, menu )
					local skuId = 0
					if actionParam.vials == 3 then
						skuId = Dvar.zm_vials_3_id:get()
					elseif actionParam.vials == 6 then
						skuId = Dvar.zm_vials_6_id:get()
					elseif actionParam.vials == 9 then
						skuId = Dvar.zm_vials_9_id:get()
					end
					if skuId == 0 or not Engine.PurchaseDWSKU( controller, skuId ) then
						LuaUtils.UI_ShowErrorMessageDialog( controller, "MPUI_BM_VIALS_PURCHASE_FAILED", "" )
						GoBack( menu, controller )
						return 
					else
						self:setState( "Purchasing" )
						self.BGBPurchasingVials:playClip( "StartPurchasing" )
						self.BGBPurchasingVials.nextClip = "Purchasing"
						list.purchasingVials = true
						list:updateDataSource()
						self.BGBPurchasingVials:registerEventHandler( "clip_over", function ( element, event )
							if Engine.IsInventoryBusy( controller ) or Engine.GetPurchaseDWSKUResult( controller ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
								LUI.UIElement.clipOver( element, event )
							else
								element:playClip( "StopPurchasing" )
								element:registerEventHandler( "clip_over", function ( element, event )
									element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
									self:setState( "DefaultState" )
									if Engine.GetPurchaseDWSKUResult( controller ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
										GoBack( menu, controller )
									else
										LuaUtils.UI_ShowErrorMessageDialog( controller, "MPUI_BM_VIALS_PURCHASE_FAILED", "" )
										GoBack( menu, controller )
									end
								end )
							end
						end )
					end
				end
				
				local CancelPurchaseAction = function ( self, element, controller, actionParam, menu )
					GoBack( menu, controller )
				end
				
				table.insert( buttonsList, addItemListButton( "ZMUI_PURCHASE_VIALS", PurchaseVialsAction, true, false, params.vials, params.cost ) )
				table.insert( buttonsList, addItemListButton( "MENU_CANCEL_CAPS", CancelPurchaseAction, false, false ) )
				return buttonsList
			end
		end, true )
		return "PurchaseSupplyDropMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = function ()
		return function ( self, element, controller, menu )
			local parentMenu = GoBack( menu, controller )
			if not Engine.IsInventoryBusy( controller ) and Engine.GetPurchaseDWSKUResult( controller ) ~= Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
				CoD.OverlayUtility.CreateOverlay( controller, parentMenu, "PurchaseVials", controller, {} )
			end
		end
		
	end
} )
local PreLoadFunc = function ( self, controller )
	local controllerModel = Engine.GetModelForController( controller )
	local megaChewFactoryModel = Engine.CreateModel( controllerModel, "MegaChewFactory" )
	local getResultsOrKeepWaitingModel = Engine.CreateModel( megaChewFactoryModel, "getResultsOrKeepWaiting" )
	Engine.SetModelValue( getResultsOrKeepWaitingModel, 0 )
	local disableInputModel = Engine.CreateModel( megaChewFactoryModel, "disableInput" )
	Engine.SetModelValue( disableInputModel, 0 )
end

local GetLootResultString = function ( result )
	if result == Enum.LootResultType.LOOT_RESULT_FAILURE_INSUFFICIENT_FUNDS then
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_INSUFFICIENT_FUNDS" )
	elseif result == Enum.LootResultType.LOOT_RESULT_FAILURE_BAD_RESPONE then
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_BAD_RESPONSE" )
	elseif result == Enum.LootResultType.LOOT_RESULT_FAILURE or result == Enum.LootResultType.LOOT_RESULT_INVALID then
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_NO_RESULT" )
	else
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_NO_RESULT" )
	end
end

local PostLoadFunc = function ( self, controller )
	local controllerModel = Engine.GetModelForController( controller )
	local megaChewFactoryModel = Engine.CreateModel( controllerModel, "MegaChewFactory" )
	local stats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
	stats.showMegaChewFactoryBreadcrumb:set( 0 )
	local megaChewVialDisplayModel = Engine.CreateModel( Engine.GetGlobalModel(), "MegaChewFactoryVialDisplay" )
	local f28_local0 = self.Label0
	local f28_local1 = f28_local0
	f28_local0 = f28_local0.subscribeToGlobalModel
	local f28_local2 = controller
	local f28_local3 = "MegaChewTokens"
	f28_local0( f28_local1, f28_local2, f28_local3, "remainingTokens", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Engine.SetModelValue( megaChewVialDisplayModel, modelValue )
			Engine.SendClientScriptNotify( controller, "mega_chew_remaining_tokens", {
				tokens = modelValue
			} )
		end
	end )
	f28_local0 = 3000
	f28_local1 = 32
	f28_local2 = 0
	f28_local3 = function ()
		if Engine.LootResultsReady( controller ) ~= false then
			local lootLastResult = Engine.LootFailureReason( controller )
			if lootLastResult == Enum.LootResultType.LOOT_RESULT_SUCCESS then
				local results = Engine.GetLootResults( controller )
				local controllerModel = Engine.GetModelForController( controller )
				local tokenModel = Engine.CreateModel( controllerModel, "MegaChewTokens" )
				Engine.SetModelValue( Engine.CreateModel( tokenModel, "remainingTokens" ), Engine.GetZMVials( controller ) )
				Engine.SendClientScriptNotify( controller, "mega_chew_results", {
					is_success = true,
					vat_0 = results[1],
					vat_1 = results[2],
					vat_2 = results[3]
				} )
				for resultIndex = 4, 6, 1 do
					local itemIndex = tonumber( Engine.TableLookup( "gamedata/stats/zm/zm_statsTable.csv", 0, 4, results[resultIndex] ) )
					if itemIndex then
						stats.itemStats[itemIndex].markedOld:set( 0 )
					end
				end
			else
				Engine.PlaySound( "uin_bm_denied" )
				Engine.SendClientScriptNotify( controller, "mega_chew_results", {
					is_success = false,
					vat_0 = "",
					vat_1 = "",
					vat_2 = ""
				} )
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetLootResultString( lootLastResult ) )
			end
		else
			f28_local2 = f28_local2 + 1
			if f28_local2 < f28_local1 then
				self:addElement( LUI.UITimer.newElementTimer( 250, true, f28_local3 ) )
			else
				Engine.SendClientScriptNotify( controller, "mega_chew_results", vat_0( {
					is_success = false
				} ) )
			end
		end
	end
	
	local getResultsOrKeepWaitingModel = Engine.CreateModel( megaChewFactoryModel, "getResultsOrKeepWaiting" )
	self:subscribeToModel( getResultsOrKeepWaitingModel, function ( model )
		local value = Engine.GetModelValue( model )
		if value and value ~= 0 then
			f28_local2 = 0
			self:addElement( LUI.UITimer.newElementTimer( f28_local0, true, f28_local3 ) )
		end
		Engine.SetModelValue( model, 0 )
	end )
	local queryLootModel = Engine.CreateModel( megaChewFactoryModel, "queryLoot" )
	local lootQueryResultModel = Engine.CreateModel( megaChewFactoryModel, "lootQueryResult" )
	self:subscribeToModel( queryLootModel, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if not modelValue or modelValue == 0 then
			return 
		else
			local lootQueryResult = Engine.SpendZMVials( controller, modelValue )
			if not lootQueryResult then
				PlaySoundAlias( "uin_bm_denied" )
				Engine.SetModelValue( lootQueryResultModel, 0 )
				Engine.SendClientScriptNotify( controller, "loot_query_result_ready", {} )
				LuaUtils.UI_ShowErrorMessageDialog( controller, Engine.Localize( "MENU_BGB_FACTORY_ERR_NO_RESULT" ) )
				return 
			else
				Engine.SetModelValue( getResultsOrKeepWaitingModel, 1 )
				Engine.SetModelValue( lootQueryResultModel, 1 )
				Engine.SendClientScriptNotify( controller, "loot_query_result_ready", {} )
				Engine.SetModelValue( queryLootModel, 0 )
			end
		end
	end )
end

LUI.createMenu.MegaChewFactory = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MegaChewFactory" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MegaChewFactory.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_MegaChew_FACTORY_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MegaChew_FACTORY_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local MegaChewMachine0 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine0:setLeftRight( 0, 0, 513, 705 )
	MegaChewMachine0:setTopBottom( 0, 0, 822, 1014 )
	MegaChewMachine0:setAlpha( 0 )
	MegaChewMachine0:subscribeToGlobalModel( controller, "MegaChewMachines", "machine0", function ( model )
		MegaChewMachine0:setModel( model, controller )
	end )
	MegaChewMachine0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local element = MegaChewMachine0
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MegaChewMachine0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MegaChewMachine0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MegaChewMachine0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryMachineSelect( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( MegaChewMachine0 )
	self.MegaChewMachine0 = MegaChewMachine0
	
	local MegaChewMachine1 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine1:setLeftRight( 0, 0, 864, 1056 )
	MegaChewMachine1:setTopBottom( 0, 0, 822, 1014 )
	MegaChewMachine1:setAlpha( 0 )
	MegaChewMachine1:subscribeToGlobalModel( controller, "MegaChewMachines", "machine1", function ( model )
		MegaChewMachine1:setModel( model, controller )
	end )
	MegaChewMachine1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local element = MegaChewMachine1
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MegaChewMachine1:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MegaChewMachine1:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MegaChewMachine1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryMachineSelect( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( MegaChewMachine1 )
	self.MegaChewMachine1 = MegaChewMachine1
	
	local MegaChewMachine2 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine2:setLeftRight( 0, 0, 1214, 1406 )
	MegaChewMachine2:setTopBottom( 0, 0, 822, 1014 )
	MegaChewMachine2:setAlpha( 0 )
	MegaChewMachine2:subscribeToGlobalModel( controller, "MegaChewMachines", "machine2", function ( model )
		MegaChewMachine2:setModel( model, controller )
	end )
	MegaChewMachine2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local element = MegaChewMachine2
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MegaChewMachine2:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MegaChewMachine2:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MegaChewMachine2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryMachineSelect( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( MegaChewMachine2 )
	self.MegaChewMachine2 = MegaChewMachine2
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, -461, -353 )
	Label0:setTopBottom( 0, 0, 1442, 1516 )
	Label0:setTTF( "fonts/default.ttf" )
	Label0:subscribeToGlobalModel( controller, "MegaChewTokens", "remainingTokens", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local console = CoD.CenterConsole.new( self, controller )
	console:setLeftRight( 0.5, 0.5, -555, 555 )
	console:setTopBottom( 0, 0, 184.5, 331.5 )
	self:addElement( console )
	self.console = console
	
	local MegaChewFactoryVatLeft = CoD.MegaChewFactoryVat.new( self, controller )
	MegaChewFactoryVatLeft:setLeftRight( 0, 0, 165, 705 )
	MegaChewFactoryVatLeft:setTopBottom( 0, 0, -469, -267 )
	Engine.SetupUI3DWindow( controller, 0, 540, 202 )
	MegaChewFactoryVatLeft:setUI3DWindow( 0 )
	MegaChewFactoryVatLeft.TextBox:setText( Engine.Localize( "$(MegaChewLabelLeft)" ) )
	self:addElement( MegaChewFactoryVatLeft )
	self.MegaChewFactoryVatLeft = MegaChewFactoryVatLeft
	
	local MegaChewFactoryVatMiddle = CoD.MegaChewFactoryVat.new( self, controller )
	MegaChewFactoryVatMiddle:setLeftRight( 0, 0, 864, 1404 )
	MegaChewFactoryVatMiddle:setTopBottom( 0, 0, -469, -267 )
	Engine.SetupUI3DWindow( controller, 1, 540, 202 )
	MegaChewFactoryVatMiddle:setUI3DWindow( 1 )
	MegaChewFactoryVatMiddle.TextBox:setText( Engine.Localize( "$(MegaChewLabelMiddle)" ) )
	self:addElement( MegaChewFactoryVatMiddle )
	self.MegaChewFactoryVatMiddle = MegaChewFactoryVatMiddle
	
	local MegaChewFactoryVatRight = CoD.MegaChewFactoryVat.new( self, controller )
	MegaChewFactoryVatRight:setLeftRight( 0, 0, 1576, 2116 )
	MegaChewFactoryVatRight:setTopBottom( 0, 0, -469, -267 )
	Engine.SetupUI3DWindow( controller, 2, 540, 202 )
	MegaChewFactoryVatRight:setUI3DWindow( 2 )
	MegaChewFactoryVatRight.TextBox:setText( Engine.Localize( "$(MegaChewLabelRight)" ) )
	self:addElement( MegaChewFactoryVatRight )
	self.MegaChewFactoryVatRight = MegaChewFactoryVatRight
	
	local MegaChewFactoryBottomLeftLabel = CoD.MegaChewFactoryBottomLeftLabel.new( self, controller )
	MegaChewFactoryBottomLeftLabel:setLeftRight( 0, 0, -989, -269 )
	MegaChewFactoryBottomLeftLabel:setTopBottom( 0, 0, 472.5, 607.5 )
	Engine.SetupUI3DWindow( controller, 3, 720, 135 )
	MegaChewFactoryBottomLeftLabel:setUI3DWindow( 3 )
	MegaChewFactoryBottomLeftLabel.TextBox:setText( Engine.Localize( "$(MegaChewLabelInstructions)" ) )
	self:addElement( MegaChewFactoryBottomLeftLabel )
	self.MegaChewFactoryBottomLeftLabel = MegaChewFactoryBottomLeftLabel
	
	MegaChewMachine0.navigation = {
		right = MegaChewMachine1
	}
	MegaChewMachine1.navigation = {
		left = MegaChewMachine0,
		right = MegaChewMachine2
	}
	MegaChewMachine2.navigation = {
		left = MegaChewMachine1
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codPoints" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codPoints"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		OpenCODPointsIntro( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			UploadStats( self, controller )
			Close( self, controller )
			HandleGoBackFromMegaChew( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_NAVIGATE", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if AreCodPointsEnabled( controller ) and not IsInventoryBusy( controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			OpenSystemOverlay( self, menu, controller, "PurchaseVials", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AreCodPointsEnabled( controller ) and not IsInventoryBusy( controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_TRADE_FOR_DIVINIUM", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if AreCodPointsEnabled( controller ) and not IsInventoryBusy( controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			OpenOverlay( self, "Store_CodPoints", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AreCodPointsEnabled( controller ) and not IsInventoryBusy( controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS", nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ForceLobbyButtonUpdate( controller )
		SendClientScriptNotify( controller, "resetMegaChewFactory", "" )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "MegaChewFactory.disableInput", function ( model )
		local element = self
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 1 ) then
			DisableNavigation( self, "MegaChewMachine0" )
			DisableNavigation( self, "MegaChewMachine1" )
			DisableNavigation( self, "MegaChewMachine2" )
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			EnableNavigation( self, "MegaChewMachine0" )
			EnableNavigation( self, "MegaChewMachine1" )
			EnableNavigation( self, "MegaChewMachine2" )
		end
	end )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	MegaChewMachine0.id = "MegaChewMachine0"
	MegaChewMachine1.id = "MegaChewMachine1"
	MegaChewMachine2.id = "MegaChewMachine2"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.MegaChewMachine0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GenericMenuFrame0:close()
		self.MegaChewMachine0:close()
		self.MegaChewMachine1:close()
		self.MegaChewMachine2:close()
		self.console:close()
		self.MegaChewFactoryVatLeft:close()
		self.MegaChewFactoryVatMiddle:close()
		self.MegaChewFactoryVatRight:close()
		self.MegaChewFactoryBottomLeftLabel:close()
		self.Label0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

