CoD.StoreUtility = {}
CoD.StoreUtility.StoreFeaturedCategory = "FEATURED"
CoD.StoreUtility.InitSingleCategoryStoreMenu = function ( self, controller, category )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
	Engine.CreateModel( rootModel, "ready" )
	Engine.CreateModel( rootModel, "storeSource" )
	Engine.CreateModel( rootModel, "storeLocation" )
	local isCategoryListInFocusModel = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot.isCategoryListInFocus" )
	Engine.SetModelValue( isCategoryListInFocusModel, 0 )
	CoD.perController[controller].selectedStoreCategory = category
	local forceUpdateCategory = false
	Engine.FetchStoreProductsByCategory( controller, category, forceUpdateCategory )
	self.disablePopupOpenCloseAnim = true
end

CoD.StoreUtility.AddUpsellToDescriptionIfNeeded = function ( controller, id, description )
	if not Engine.IsMapValid( id ) and ShowPurchasableMap( controller, id ) then
		local dlcBit = Engine.GetDLCBitForMapName( id )
		local f2_local0 = dlcBit
		local dlcPack = CoD.DLCPackFromBit[dlcBit]
		local f2_local1 = f2_local0 and dlcPack
		if f2_local1 then
			return Engine.Localize( "MENU_DESCRIPTION_AND_UPSELL", description, "MENU_" .. f2_local1 .. "_REQUIRED_HINT" )
		end
	end
	return description
end

CoD.StoreUtility.PrependPurchaseIconIfNeeded = function ( controller, id, text )
	if not Engine.IsMapValid( id ) and ShowPurchasableMap( controller, id ) then
		local dlcBit = Engine.GetDLCBitForMapName( id )
		local f3_local0 = dlcBit
		local dlcPack = CoD.DLCPackFromBit[dlcBit]
		if f3_local0 and dlcPack then
			return Engine.Localize( "MENU_PURCHASE_ICON_AND_TEXT", text )
		end
	end
	return text
end

CoD.StoreUtility.AddListDLCListener = function ( list )
	list._previousDLCBits = Engine.GetDLCBits()
	if not list._updateTimer then
		list._updateTimer = LUI.UITimer.newElementTimer( 1000, false, function ()
			if list._previousDLCBits ~= Engine.GetDLCBits() then
				list._previousDLCBits = Engine.GetDLCBits()
				list:updateDataSource()
			end
		end )
		list:addElement( list._updateTimer )
	end
	LUI.OverrideFunction_CallOriginalSecond( list, "close", function ( list )
		if list._updateTimer then
			list._updateTimer:close()
			list._updateTimer = nil
		end
	end )
end

CoD.OverlayUtility.AddSystemOverlay( "PurchaseMapPackConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_MapPackFrame",
	title = function ( controller, params )
		return Engine.Localize( "MENU_" .. params.dlcPack .. "_REQUIRED_HINT" )
	end,
	description = function ( controller, params )
		return Engine.Localize( "MENU_" .. params.dlcPack .. "_DESC" )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( controller, params )
		DataSources.PurchaseMapPackMenuList = DataSourceHelpers.ListSetup( "PurchaseMapPackMenuList", function ( controller, list )
			local buttonsList = {}
			local addItemListButton = function ( displayText, action, selected, disabled )
				return {
					models = {
						displayText = displayText,
						disabled = disabled
					},
					properties = {
						action = action,
						actionParam = params,
						selectIndex = selected
					}
				}
			end
			
			table.insert( buttonsList, addItemListButton( Engine.ToUpper( Engine.Localize( "MENU_GO_TO_STORE" ) ), function ( self, element, controller, actionParam, menu )
				GoBackAndOpenOverlayOnParent( menu, "Store_DLC", controller )
			end, true, false ) )
			table.insert( buttonsList, addItemListButton( "MENU_CANCEL_CAPS", function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end, false, false ) )
			return buttonsList
		end, true )
		return "PurchaseMapPackMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
