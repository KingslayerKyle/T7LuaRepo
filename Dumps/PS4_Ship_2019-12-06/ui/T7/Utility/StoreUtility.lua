CoD.StoreUtility = {}
CoD.StoreUtility.ExtraSlotsProductDesc = "extra_slots"
CoD.StoreUtility.InventoryItems = {
	table = "gamedata/tables/common/inventory_items.csv",
	productDescColumn = 1,
	itemIdColumn = 2,
	costColumn = 3,
	titleColumn = 4,
	descColumn = 5,
	previewImageColumn = 6,
	productImageColumn = 7,
	categoryColumn = 8,
	metadataColumn = 9,
	ps4VisibilityColumn = 10,
	xb1VisibilityColumn = 11,
	pcVisibilityColumn = 12,
	nameContextualColumn = 13,
	descContextualColumn = 14,
	imageCallingCardColumn = 15,
	imageCamoColumn = 16,
	buttonLabelContextualColumn = 17,
	purchaseConfirmationColumn = 18
}
CoD.StoreUtility.CWLPackages = {
	"na_team_mtx",
	"eu_team_mtx",
	"anz_team_mtx",
	"cwl_mtx",
	"cwl_mtx_v2"
}
CoD.StoreUtility.MissingCoDPointsCurrencyList = {
	{
		currencyId = Enum.InventoryCurrency.INVENTORY_CURRENCY_200CP_COMPENSATION,
		skuId = 90026,
		ref = "MENU_REDEEM_ERROR_200_CODPOINTS"
	},
	{
		currencyId = Enum.InventoryCurrency.INVENTORY_CURRENCY_1100CP_COMPENSATION,
		skuId = 90027,
		ref = "MENU_REDEEM_ERROR_1100_CODPOINTS"
	},
	{
		currencyId = Enum.InventoryCurrency.INVENTORY_CURRENCY_2400CP_COMPENSATION,
		skuId = 90028,
		ref = "MENU_REDEEM_ERROR_2400_CODPOINTS"
	},
	{
		currencyId = Enum.InventoryCurrency.INVENTORY_CURRENCY_5000CP_COMPENSATION,
		skuId = 90029,
		ref = "MENU_REDEEM_ERROR_5000_CODPOINTS"
	},
	{
		currencyId = Enum.InventoryCurrency.INVENTORY_CURRENCY_13000CP_COMPENSATION,
		skuId = 90030,
		ref = "MENU_REDEEM_ERROR_13000_CODPOINTS"
	}
}
CoD.StoreUtility.MissingCurrencyList = {
	{
		currencyId = Enum.InventoryCurrency.INVENTORY_CURRENCY_CP_COMPENSATION,
		skuId = 90032,
		ref = "MENU_STORE_COD_POINTS"
	}
}
CoD.StoreUtility.GetSkuName = function ( f1_arg0 )
	for f1_local0 = 1, #CoD.StoreUtility.MissingCoDPointsCurrencyList, 1 do
		if CoD.StoreUtility.MissingCoDPointsCurrencyList[f1_local0].skuId == f1_arg0 then
			return CoD.StoreUtility.MissingCoDPointsCurrencyList[f1_local0].ref
		end
	end
	return ""
end

CoD.StoreUtility.GetMissingCurrencySkuName = function ( f2_arg0 )
	for f2_local0 = 1, #CoD.StoreUtility.MissingCurrencyList, 1 do
		if CoD.StoreUtility.MissingCurrencyList[f2_local0].skuId == f2_arg0 then
			return CoD.StoreUtility.MissingCurrencyList[f2_local0].ref
		end
	end
	return ""
end

CoD.StoreUtility.GetMissingCPSkuList = function ( f3_arg0 )
	local f3_local0 = {}
	for f3_local1 = 1, #CoD.StoreUtility.MissingCoDPointsCurrencyList, 1 do
		local f3_local4 = Engine.GetPlayerBalanceByCurrencyId( f3_arg0, CoD.StoreUtility.MissingCoDPointsCurrencyList[f3_local1].currencyId )
		if f3_local4 > 0 then
			table.insert( f3_local0, {
				skuId = CoD.StoreUtility.MissingCoDPointsCurrencyList[f3_local1].skuId,
				quantity = f3_local4
			} )
		end
	end
	return f3_local0
end

CoD.StoreUtility.GetMissingCurrencySkuList = function ( f4_arg0 )
	local f4_local0 = {}
	for f4_local1 = 1, #CoD.StoreUtility.MissingCurrencyList, 1 do
		local f4_local4 = Engine.GetPlayerBalanceByCurrencyId( f4_arg0, CoD.StoreUtility.MissingCurrencyList[f4_local1].currencyId )
		if f4_local4 > 0 then
			table.insert( f4_local0, {
				skuId = CoD.StoreUtility.MissingCurrencyList[f4_local1].skuId,
				quantity = f4_local4
			} )
		end
	end
	return f4_local0
end

CoD.StoreUtility.HideProductPriceAndPurchaseStatus = function ( f5_arg0 )
	if IsDurango() and (f5_arg0 == "mappacks" or f5_arg0 == "zombies") then
		return true
	else
		return false
	end
end

CoD.StoreUtility.IsCodPointSalePackage = function ( f6_arg0 )
	if not IsJapaneseSku() and f6_arg0 == "cod_points_sale" then
		return true
	else
		return false
	end
end

CoD.StoreUtility.IsCWLV2Package = function ( f7_arg0 )
	if f7_arg0 == "cwl_mtx_v2" then
		return true
	else
		return false
	end
end

CoD.StoreUtility.IsCWLPackageEntitlement = function ( f8_arg0 )
	for f8_local3, f8_local4 in ipairs( CoD.StoreUtility.CWLPackages ) do
		if f8_local4 == f8_arg0 then
			return true
		end
	end
	return false
end

CoD.StoreUtility.IsCWLBackgroundAvailableOffline = function ( f9_arg0, f9_arg1 )
	if not IsLive() then
		local f9_local0 = Engine.TableLookup( nil, CoD.backgroundsTable, 1, f9_arg1, 10 )
		if f9_local0 ~= "" and CoD.StoreUtility.IsCWLPackageEntitlement( f9_local0 ) and Engine.GetProfileVarInt( f9_arg0, f9_local0 ) == 1 then
			return true
		end
	end
	return false
end

CoD.StoreUtility.GetDWItemsByCategory = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = Engine.TableFindRows( CoD.StoreUtility.InventoryItems.table, CoD.StoreUtility.InventoryItems.categoryColumn, f10_arg1 )
	if f10_local0 == nil or #f10_local0 == 0 or not AreCodPointsEnabled( 0 ) then
		return 
	end
	for f10_local1 = 1, #f10_local0, 1 do
		if CoD.StoreUtility.IsInventoryItemVisible( f10_arg0, Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.productDescColumn ) ) then
			local f10_local4 = Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED
			if Engine.GetInventoryItemQuantity( f10_arg0, Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.itemIdColumn ) ) > 0 then
				f10_local4 = Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED
			end
			local f10_local5 = Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.previewImageColumn )
			if f10_local5 == "t7_store_preview_cwl" and CoD.isPS4 then
				f10_local5 = "t7_store_preview_cwl_ps4"
			end
			local f10_local6 = Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.productImageColumn )
			if f10_local6 == "t7_store_product_cwl" and CoD.isPS4 then
				f10_local6 = "t7_store_product_cwl_ps4"
			end
			local f10_local7 = Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.descColumn )
			if CoD.isPS4 and Engine.LocalizeRefExists( f10_local7 .. "_PS4" ) then
				f10_local7 = f10_local7 .. "_PS4"
			end
			table.insert( f10_arg2, {
				models = {
					name = Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.titleColumn ),
					price = "^BBUTTON_COD_POINT_ICON^ " .. Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.costColumn ),
					desc = f10_local7,
					productID = Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.itemIdColumn ),
					skuID = Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.itemIdColumn ),
					previewImage = f10_local5,
					productImage = f10_local6,
					purchasestatus = f10_local4,
					serviceLabel = 0,
					metadata = Engine.TableLookupGetColumnValueForRow( CoD.StoreUtility.InventoryItems.table, f10_local0[f10_local1], CoD.StoreUtility.InventoryItems.metadataColumn )
				}
			} )
		end
	end
end

CoD.StoreUtility.DoesInventoryItemExistsByName = function ( f11_arg0 )
	local f11_local0 = Engine.TableFindRows( CoD.StoreUtility.InventoryItems.table, CoD.StoreUtility.InventoryItems.productDescColumn, f11_arg0 )
	if f11_local0 == nil or #f11_local0 == 0 or not AreCodPointsEnabled( 0 ) then
		return false
	else
		return true
	end
end

CoD.StoreUtility.SetupFocusCategory = function ( f12_arg0, f12_arg1 )
	if f12_arg1 ~= nil and LUI.startswith( f12_arg1, "store" ) then
		local f12_local0 = LUI.splitString( f12_arg1, "_" )
		if #f12_local0 == 2 then
			CoD.perController[f12_arg0].forceFocusCategory = Engine.ToUpper( f12_local0[2] )
			return 
		end
	end
	CoD.perController[f12_arg0].forceFocusCategory = nil
end

CoD.StoreUtility.InitSingleCategoryStoreMenu = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = Engine.CreateModel( Engine.GetModelForController( f13_arg1 ), "StoreRoot" )
	Engine.CreateModel( f13_local0, "ready" )
	Engine.CreateModel( f13_local0, "storeSource" )
	Engine.CreateModel( f13_local0, "storeLocation" )
	Engine.SetModelValue( Engine.CreateModel( f13_local0, "isCategoryListInFocus" ), 0 )
	CoD.perController[f13_arg1].selectedStoreCategory = f13_arg2
	Engine.SetStoreCategoryFetchParamaeters( f13_arg1, f13_arg2, false )
	f13_arg0.disablePopupOpenCloseAnim = true
end

CoD.StoreUtility.AddUpsellToDescriptionIfNeeded = function ( f14_arg0, f14_arg1, f14_arg2 )
	if not Engine.IsMapValid( f14_arg1 ) and ShowPurchasableMap( f14_arg0, f14_arg1 ) then
		local f14_local0 = Engine.GetDLCBitForMapName( f14_arg1 )
		local f14_local1 = f14_local0 and CoD.DLCPackFromBit[f14_local0]
		if f14_local1 then
			if IsDvarValueEqualTo( "ui_freeDLC1", "1" ) then
				return f14_arg2
			else
				return Engine.Localize( "MENU_DESCRIPTION_AND_UPSELL", f14_arg2, "MENU_" .. f14_local1 .. "_REQUIRED_HINT" )
			end
		end
	end
	return f14_arg2
end

CoD.StoreUtility.PrependPurchaseIconIfNeeded = function ( f15_arg0, f15_arg1, f15_arg2 )
	if not Engine.IsMapValid( f15_arg1 ) and ShowPurchasableMap( f15_arg0, f15_arg1 ) then
		local f15_local0 = Engine.GetDLCBitForMapName( f15_arg1 )
		if f15_local0 and CoD.DLCPackFromBit[f15_local0] then
			return Engine.Localize( "MENU_PURCHASE_ICON_AND_TEXT", f15_arg2 )
		end
	end
	return f15_arg2
end

CoD.StoreUtility.AddListDLCListener = function ( f16_arg0 )
	f16_arg0._previousDLCBits = Engine.GetDLCBits()
	if not f16_arg0._updateTimer then
		f16_arg0._updateTimer = LUI.UITimer.newElementTimer( 1000, false, function ()
			if f16_arg0._previousDLCBits ~= Engine.GetDLCBits() then
				f16_arg0._previousDLCBits = Engine.GetDLCBits()
				f16_arg0:updateDataSource()
			end
		end )
		f16_arg0:addElement( f16_arg0._updateTimer )
	end
	LUI.OverrideFunction_CallOriginalSecond( f16_arg0, "close", function ( element )
		if element._updateTimer then
			element._updateTimer:close()
			element._updateTimer = nil
		end
	end )
end

CoD.StoreUtility.GetInventoryItemValueByItemName = function ( f19_arg0, f19_arg1 )
	return Engine.TableLookup( nil, CoD.StoreUtility.InventoryItems.table, CoD.StoreUtility.InventoryItems.productDescColumn, f19_arg0, f19_arg1 )
end

CoD.StoreUtility.GetInventoryItemValueBySkuId = function ( f20_arg0, f20_arg1 )
	return Engine.TableLookup( nil, CoD.StoreUtility.InventoryItems.table, CoD.StoreUtility.InventoryItems.itemIdColumn, f20_arg0, f20_arg1 )
end

CoD.StoreUtility.IsCWLPackageV2Visible = function ( f21_arg0, f21_arg1 )
	local f21_local0 = "cwl_mtx"
	local f21_local1 = false
	if CoD.StoreUtility.IsCWLV2Package( f21_arg1 ) and not CoD.StoreUtility.IsInventoryItemPurchased( f21_arg0, f21_local0 ) then
		f21_local1 = true
	end
	return f21_local1
end

CoD.StoreUtility.IsInventoryItemVisible = function ( f22_arg0, f22_arg1 )
	local f22_local0 = CoD.StoreUtility.InventoryItems.ps4VisibilityColumn
	if IsDurango() then
		f22_local0 = CoD.StoreUtility.InventoryItems.xb1VisibilityColumn
	elseif IsPC() then
		f22_local0 = CoD.StoreUtility.InventoryItems.pcVisibilityColumn
	end
	local f22_local1 = tonumber( CoD.StoreUtility.GetInventoryItemValueByItemName( f22_arg1, f22_local0 ) ) == 1
	local f22_local2 = "cwl_mtx_v2"
	if f22_local1 and CoD.StoreUtility.IsCWLV2Package( f22_arg1 ) then
		return CoD.StoreUtility.IsCWLPackageV2Visible( f22_arg0, f22_arg1 )
	else
		return f22_local1
	end
end

CoD.StoreUtility.IsInventoryItemPurchased = function ( f23_arg0, f23_arg1 )
	return Engine.GetInventoryItemQuantity( f23_arg0, tonumber( CoD.StoreUtility.GetInventoryItemValueByItemName( f23_arg1, CoD.StoreUtility.InventoryItems.itemIdColumn ) ) ) > 0
end

CoD.StoreUtility.GetCWLPackageCallingCardModel = function ( f24_arg0, f24_arg1 )
	local f24_local0 = CoD.StoreUtility.GetInventoryItemValueByItemName( f24_arg1, CoD.StoreUtility.InventoryItems.itemIdColumn )
	local f24_local1 = CoD.StoreUtility.GetInventoryItemValueByItemName( f24_arg1, CoD.StoreUtility.InventoryItems.nameContextualColumn )
	local f24_local2 = CoD.StoreUtility.GetInventoryItemValueByItemName( f24_arg1, CoD.StoreUtility.InventoryItems.descContextualColumn )
	if CoD.isPS4 and Engine.LocalizeRefExists( f24_local2 .. "_PS4" ) then
		f24_local2 = f24_local2 .. "_PS4"
	end
	local f24_local3 = CoD.StoreUtility.GetInventoryItemValueByItemName( f24_arg1, CoD.StoreUtility.InventoryItems.imageCallingCardColumn )
	local f24_local4 = CoD.StoreUtility.GetInventoryItemValueByItemName( f24_arg1, CoD.StoreUtility.InventoryItems.buttonLabelContextualColumn )
	local f24_local5 = {}
	for f24_local9, f24_local10 in ipairs( Engine.GetBackgroundsForCategoryName( f24_arg0, "default" ) ) do
		if f24_local10.entitlement == f24_arg1 then
			table.insert( f24_local5, f24_local10.id )
		end
	end
	return {
		models = {
			title = Engine.Localize( f24_local1 ),
			description = Engine.Localize( f24_local2 ),
			iconId = 0,
			isLocked = false,
			isPackage = true,
			packageImage = f24_local3,
			packageLabel = Engine.Localize( f24_local4 ),
			skuId = tonumber( f24_local0 )
		},
		properties = {
			action = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
				OpenBuyInventoryItemDialog( f25_arg0, f25_arg1, f25_arg2, f25_arg1.source )
			end
			,
			includedItems = f24_local5,
			source = "CallingCard"
		}
	}
end

CoD.OverlayUtility.AddSystemOverlay( "PurchaseMapPackConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_MapPackFrame",
	title = function ( f26_arg0, f26_arg1 )
		if IsDvarValueEqualTo( "ui_freeDLC1", "1" ) then
			if f26_arg1.dlcPack == "DLC5_ORBIS" then
				f26_arg1.dlcPack = "DLC5"
			end
			return Engine.Localize( "MENU_" .. f26_arg1.dlcPack .. "_PURCHASE_DURING_PROMO" )
		else
			return Engine.Localize( "MENU_" .. f26_arg1.dlcPack .. "_REQUIRED_HINT" )
		end
	end,
	description = function ( f27_arg0, f27_arg1 )
		return Engine.Localize( "MENU_" .. f27_arg1.dlcPack .. "_DESC" )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f28_arg0, f28_arg1 )
		DataSources.PurchaseMapPackMenuList = DataSourceHelpers.ListSetup( "PurchaseMapPackMenuList", function ( f29_arg0, f29_arg1 )
			local f29_local0 = {}
			local f29_local1 = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
				return {
					models = {
						displayText = f30_arg0,
						disabled = f30_arg3
					},
					properties = {
						action = f30_arg1,
						actionParam = f28_arg1,
						selectIndex = f30_arg2
					}
				}
			end
			
			table.insert( f29_local0, f29_local1( Engine.ToUpper( Engine.Localize( "MENU_GO_TO_STORE" ) ), function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
				GoBackAndOpenStoreDLCOverlayOnParent( f31_arg4, f28_arg1.actionSource, f31_arg2 )
			end, true, false ) )
			table.insert( f29_local0, f29_local1( "MENU_CANCEL_CAPS", function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3, f32_arg4 )
				GoBack( f32_arg4, f32_arg2 )
			end, false, false ) )
			return f29_local0
		end, true )
		return "PurchaseMapPackMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
