require( "ui.uieditor.menus.CommunityEvent.winter_community_theme" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounterBlackMarket" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketSafeAreaContainer" )
require( "ui.uieditor.widgets.BlackMarket.BM_TopNavBtn" )
require( "ui.uieditor.widgets.BlackMarket.BM_Promo" )

DataSources.BurnDupeProgress = {
	getModel = function ( f1_arg0 )
		CoD.OverlayUtility.UpdateBurnDupeProgress()
		return Engine.CreateModel( Engine.GetGlobalModel(), "BurnDupeProgress" )
	end
}
DataSources.AutoeventsCycled = {
	getModel = function ( f2_arg0 )
		local f2_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" )
		local f2_local1 = Engine.CreateModel( f2_local0, "cycled" )
		if not Engine.GetModelValue( f2_local1 ) then
			Engine.SetModelValue( f2_local1, 1 )
		end
		return f2_local0
	end
}
DataSources.AutoeventsBribeTimer = {
	getModel = function ( f3_arg0 )
		local f3_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" )
		local f3_local1 = Engine.CreateModel( f3_local0, "autoevent_timer_bribe" )
		local f3_local2 = Engine.CreateModel( f3_local0, "autoevent_timer_lootbundle_promo" )
		local f3_local3 = Engine.CreateModel( f3_local0, "autoevent_timer_trifecta_promo" )
		local f3_local4 = Engine.CreateModel( f3_local0, "autoevent_timer_limited_time" )
		local f3_local5 = Engine.CreateModel( f3_local0, "autoevent_timer_rare100" )
		local f3_local6 = Engine.CreateModel( f3_local0, "autoevent_timer_rare_nodupe_20bundle" )
		local f3_local7 = Engine.CreateModel( f3_local0, "autoevent_timer_grandslam" )
		local f3_local8 = Engine.CreateModel( f3_local0, "autoevent_timer_rare_bundle_10for5" )
		if not Engine.GetModelValue( f3_local1 ) then
			Engine.SetModelValue( f3_local1, "00:00:00" )
		end
		if not Engine.GetModelValue( f3_local8 ) then
			Engine.SetModelValue( f3_local8, "00:00:00" )
		end
		if not Engine.GetModelValue( f3_local3 ) then
			Engine.SetModelValue( f3_local3, "00:00:00" )
		end
		if not Engine.GetModel( f3_local0, "autoevent_timer_bribe_red" ) then
			Engine.SetModelValue( Engine.CreateModel( f3_local0, "autoevent_timer_bribe_red" ), false )
		end
		if not Engine.GetModel( f3_local0, "autoevent_timer_lootbundle_promo_red" ) then
			Engine.SetModelValue( Engine.CreateModel( f3_local0, "autoevent_timer_lootbundle_promo_red" ), false )
		end
		if not Engine.GetModel( f3_local0, "autoevent_timer_trifecta_promo_red" ) then
			Engine.SetModelValue( Engine.CreateModel( f3_local0, "autoevent_timer_trifecta_promo_red" ), false )
		end
		if not Engine.GetModel( f3_local0, "autoevent_timer_rare_nodupe_20bundle_red" ) then
			Engine.SetModelValue( Engine.CreateModel( f3_local0, "autoevent_timer_rare_nodupe_20bundle_red" ), false )
		end
		return f3_local0
	end
}
CoD.OverlayUtility.UpdateBurnDupeProgress = function ()
	local f4_local0 = Engine.GetBurnDupeProgress()
	if f4_local0 == nil then
		f4_local0 = {
			total = 0,
			processed = 0
		}
	end
	local f4_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "BurnDupeProgress" )
	Engine.SetModelValue( Engine.CreateModel( f4_local1, "total" ), f4_local0.total )
	Engine.SetModelValue( Engine.CreateModel( f4_local1, "processed" ), f4_local0.processed )
	local f4_local2 = 0
	if f4_local0.processed > 0 and f4_local0.total > 0 then
		f4_local2 = f4_local0.processed / f4_local0.total
	end
	if f4_local2 > 1 then
		f4_local2 = 1
	end
	Engine.SetModelValue( Engine.CreateModel( f4_local1, "fraction" ), f4_local2 )
	Engine.SetModelValue( Engine.CreateModel( f4_local1, "progressString" ), f4_local0.processed .. " / " .. f4_local0.total )
end

local f0_local0 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
	if f5_arg3.itemCODPointCost > 0 then
		GoBackAndOpenStoreCodPointsOverlayOnParent( f5_arg4, f5_arg4.menuName, f5_arg2 )
	else
		GoBackAndOpenStoreCodPointsOverlayOnParent( f5_arg4, "BMCPStore", f5_arg2 )
	end
end

local f0_local1 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4 )
	OpenCodPointsStore( f6_arg0, f6_arg1, f6_arg2, "BMCPStore", f6_arg4 )
end

local f0_local2 = function ( f7_arg0 )
	local f7_local0
	if f7_arg0.supplyDropType ~= CoD.BlackMarketUtility.DropTypes.BUNDLE or f7_arg0.itemCODPointCost ~= 0 or f7_arg0.itemCost ~= 0 then
		f7_local0 = false
	else
		f7_local0 = true
	end
	return f7_local0
end

CoD.OverlayUtility.AddSystemOverlay( "PurchaseSupplyDropConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_BlackMarket",
	title = function ( f8_arg0, f8_arg1 )
		if f0_local2( f8_arg1 ) then
			return Engine.Localize( "MPUI_BM_SUPPLY_DROPS_REMAINING" )
		elseif f8_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.BRIBE then
			if f8_arg1.again then
				return Engine.Localize( "MPUI_BM_BRIBE_REROLL" )
			else
				return Engine.Localize( CoD.BlackMarketUtility.GetCurrentBribePopupTitle() )
			end
		elseif (f8_arg1.itemCODPointCost == 0 or Engine.GetCoDPoints( f8_arg0 ) < f8_arg1.itemCODPointCost) and (f8_arg1.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f8_arg0 ) < f8_arg1.itemCost) then
			return "MPUI_BM_NO_CURRENCY"
		elseif f8_arg1.again then
			return Engine.Localize( "MENU_PURCHASE_CONFIRMAITON" )
		else
			return Engine.ToUpper( Engine.Localize( f8_arg1.displayText ) )
		end
	end,
	description = function ( f9_arg0, f9_arg1 )
		if f9_arg1.again then
			return f9_arg1.displayText
		elseif f0_local2( f9_arg1 ) then
			local f9_local0 = 0
			if not IsBundleActive( f9_arg0 ) then
				f9_local0 = f9_local0 + CoD.BlackMarketUtility.GetCurrentBundleCount( f9_arg0 )
			end
			if not IsHundredBundleActive( f9_arg0 ) then
				f9_local0 = f9_local0 + CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f9_arg0 )
			end
			if not IsRareBundle10for5Active( f9_arg0 ) then
				f9_local0 = f9_local0 + CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f9_arg0 )
			end
			return Engine.Localize( "MPUI_BM_OPEN_REMAINING_CRATES", f9_local0 )
		elseif (f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.BRIBE or f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.BUNDLE or f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE or f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5) and f9_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f9_arg0 ) < f9_arg1.itemCODPointCost then
			return Engine.Localize( "MPUI_BM_NO_CODPOINTS_DESCRIPTION", f9_arg1.displayText )
		elseif f9_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f9_arg0 ) < f9_arg1.itemCODPointCost and (f9_arg1.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f9_arg0 ) < f9_arg1.itemCost) then
			return Engine.Localize( "MPUI_BM_NO_CURRENCY_DESCRIPTION", f9_arg1.displayText )
		elseif f9_arg1.itemCODPointCost == 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f9_arg0 ) < f9_arg1.itemCost then
			return Engine.Localize( "MPUI_BM_NOT_ENOUGH_CRYPTOKEYS" )
		elseif f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.BRIBE then
			return Engine.Localize( CoD.BlackMarketUtility.GetCurrentBribePopupDescription() )
		elseif f9_arg1.itemCODPointCost == 0 then
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_KEYS_TEXT", f9_arg1.displayText )
		elseif f9_arg1.itemCost == 0 then
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_CODPOINTS_TEXT", f9_arg1.displayText )
		else
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_TEXT", f9_arg1.displayText )
		end
	end,
	image = function ( f10_arg0, f10_arg1 )
		return f10_arg1.image
	end,
	cost = function ( f11_arg0, f11_arg1 )
		return f11_arg1.itemCost
	end,
	codpointcost = function ( f12_arg0, f12_arg1 )
		return f12_arg1.itemCODPointCost
	end,
	supplyDropType = function ( f13_arg0, f13_arg1 )
		return f13_arg1.supplyDropType
	end,
	["cryptoKeyType.rarity"] = function ( f14_arg0, f14_arg1 )
		if f14_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE then
			return "MPUI_BM_RARE"
		else
			return CoD.BlackMarketUtility.GetCrateTypeString( f14_arg1.supplyDropType )
		end
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "PurchaseSupplyDrop",
	listDatasource = function ( f15_arg0, f15_arg1 )
		DataSources.PurchaseSupplyDropMenuList = DataSourceHelpers.ListSetup( "PurchaseSupplyDropMenuList", function ( f16_arg0, f16_arg1 )
			local f16_local0 = {}
			if f16_arg1.purchasingBundle then
				return {}
			end
			local f16_local1 = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
				return {
					models = {
						displayText = f17_arg0,
						disabled = f17_arg3
					},
					properties = {
						action = f17_arg1,
						actionParam = f15_arg1,
						selectIndex = f17_arg2
					}
				}
			end
			
			if f16_arg1.purchasedBundle then
				local f16_local2 = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4, f18_arg5 )
					f18_arg3.supplyDropType = f16_arg1.purchasedBundleType
					CoD.BlackMarketUtility.TradeForCrateAction( f18_arg0, f18_arg1, f18_arg2, f18_arg3, GoBack( f18_arg4, f18_arg2 ), Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f16_arg1 )
				end
				
				local f16_local3 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
					GoBack( f19_arg4, f19_arg2 )
				end
				
				if f16_arg1.purchasedBundleType == CoD.BlackMarketUtility.DropTypes.GRAND_SLAM then
					table.insert( f16_local0, f16_local1( "MENU_CONTINUE_CAPS", f16_local3, true, false ) )
				else
					table.insert( f16_local0, f16_local1( "MPUI_BM_OPEN_BUNDLE_NOW", f16_local2, true, false ) )
				end
				return f16_local0
			end
			local f16_local2 = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
				CoD.BlackMarketUtility.TradeForCrateAction( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_CRYPTO_KEYS, f16_arg1 )
			end
			
			local f16_local3 = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
				CoD.BlackMarketUtility.TradeForCrateAction( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_COD_POINTS, f16_arg1 )
			end
			
			local f16_local4 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
				f22_arg4 = GoBack( f22_arg4, f22_arg2 )
				f22_arg3.supplyDropType = CoD.BlackMarketUtility.DropTypes.RARE
				CoD.BlackMarketUtility.TradeForCrateAction( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f16_arg1 )
			end
			
			local f16_local5 = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
				f23_arg4 = GoBack( f23_arg4, f23_arg2 )
				f23_arg3.supplyDropType = CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE
				CoD.BlackMarketUtility.TradeForCrateAction( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f16_arg1 )
			end
			
			local f16_local6 = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
				f24_arg4 = GoBack( f24_arg4, f24_arg2 )
				f24_arg3.supplyDropType = CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR_5
				CoD.BlackMarketUtility.TradeForCrateAction( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f16_arg1 )
			end
			
			local f16_local7 = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
				GoBack( f25_arg4, f25_arg2 )
			end
			
			if f0_local2( f15_arg1 ) then
				local f16_local8 = f16_local4
				if IsBundleActive( f16_arg0 ) and not IsHundredBundleActive( f16_arg0 ) then
					f16_local8 = f16_local5
				end
				if IsBundleActive( f16_arg0 ) and not IsRareBundle10for5Active( f16_arg0 ) then
					f16_local8 = f16_local6
				end
				table.insert( f16_local0, f16_local1( "MPUI_BM_OPEN_BUNDLE_NOW", f16_local8, true, false ) )
				table.insert( f16_local0, f16_local1( "MPUI_BM_OPEN_BUNDLE_LATER", f16_local7, false, false ) )
			elseif f15_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f16_arg0 ) < f15_arg1.itemCODPointCost and (f15_arg1.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f16_arg0 ) < f15_arg1.itemCost) then
				table.insert( f16_local0, f16_local1( "MPUI_PURCHASE_CODPOINTS_CAPS", f0_local0, true, false ) )
				table.insert( f16_local0, f16_local1( "MENU_CANCEL_CAPS", f16_local7, false, false ) )
			elseif f15_arg1.itemCODPointCost == 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f16_arg0 ) < f15_arg1.itemCost then
				table.insert( f16_local0, f16_local1( "MENU_CONTINUE_CAPS", f16_local7, false, false ) )
			else
				if f15_arg1.itemCost > 0 then
					table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_TRADE_CRYPTOKEYS", f15_arg1.itemCost ), f16_local2, true, CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f16_arg0 ) < f15_arg1.itemCost ) )
				end
				if f15_arg1.itemCODPointCost > 0 then
					table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_TRADE_COD_POINTS", f15_arg1.itemCODPointCost ), f16_local3, false, Engine.GetCoDPoints( f16_arg0 ) < f15_arg1.itemCODPointCost ) )
				end
				if f15_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE then
					if not IsBundleActive( f16_arg0 ) then
						local f16_local8 = CoD.BlackMarketUtility.GetCurrentBundleCount( f16_arg0 ) + CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f16_arg0 ) + CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f16_arg0 )
						if f16_local8 > 0 then
							table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_OPEN_REMAINING_BUNDLE", f16_local8 ), f16_local4, false, false ) )
						end
					elseif not IsHundredBundleActive( f16_arg0 ) then
						local f16_local8 = CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f16_arg0 )
						if f16_local8 > 0 then
							table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_OPEN_REMAINING_BUNDLE", f16_local8 ), f16_local5, false, false ) )
						end
					elseif not IsRareBundle10for5Active( f16_arg0 ) then
						local f16_local8 = CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f16_arg0 )
						if f16_local8 > 0 then
							table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_OPEN_REMAINING_BUNDLE", f16_local8 ), f16_local6, false, false ) )
						end
					end
				end
				table.insert( f16_local0, f16_local1( "MENU_CANCEL_CAPS", f16_local7, false, false ) )
			end
			return f16_local0
		end, true )
		return "PurchaseSupplyDropMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	postCreateStep = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if f26_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.BRIBE then
			local f26_local0 = Dvar.loot_bribeCrate_dwid:get()
			f26_arg0:subscribeToGlobalModel( f26_arg1, "AutoeventsCycled", "cycled", function ()
				if f26_local0 ~= Dvar.loot_bribeCrate_dwid:get() or f26_local0 == 0 then
					DelayGoBack( f26_arg0, f26_arg1 )
				end
			end )
		end
		if f26_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE then
			local f26_local0 = IsLootSaleActive( f26_arg1 )
			f26_arg0:subscribeToGlobalModel( f26_arg1, "AutoeventsCycled", "cycled", function ()
				if f26_local0 ~= IsLootSaleActive( f26_arg1 ) then
					DelayGoBack( f26_arg0, f26_arg1 )
				end
			end )
		end
		if f26_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.BUNDLE then
			local f26_local0 = IsBundleActive( f26_arg1 )
			f26_arg0:subscribeToGlobalModel( f26_arg1, "AutoeventsCycled", "cycled", function ()
				if f26_local0 ~= IsBundleActive( f26_arg1 ) then
					DelayGoBack( f26_arg0, f26_arg1 )
				end
			end )
		end
		if f26_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE then
			local f26_local0 = IsHundredBundleActive( f26_arg1 )
			f26_arg0:subscribeToGlobalModel( f26_arg1, "AutoeventsCycled", "cycled", function ()
				if f26_local0 ~= IsHundredBundleActive( f26_arg1 ) then
					DelayGoBack( f26_arg0, f26_arg1 )
				end
			end )
		end
		if f26_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 then
			local f26_local0 = IsRareBundle10for5Active( f26_arg1 )
			f26_arg0:subscribeToGlobalModel( f26_arg1, "AutoeventsCycled", "cycled", function ()
				if f26_local0 ~= IsRareBundle10for5Active( f26_arg1 ) then
					DelayGoBack( f26_arg0, f26_arg1 )
				end
			end )
		end
		if f26_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE or f26_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE then
			local f26_local0 = IsNoDupesPromoActive( f26_arg1 )
			f26_arg0:subscribeToGlobalModel( f26_arg1, "AutoeventsCycled", "cycled", function ()
				if f26_local0 ~= IsNoDupesPromoActive( f26_arg1 ) then
					DelayGoBack( f26_arg0, f26_arg1 )
				end
			end )
		end
		if f26_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.GRAND_SLAM then
			local f26_local0 = IsGrandSlamActive( f26_arg1 )
			f26_arg0:subscribeToGlobalModel( f26_arg1, "AutoeventsCycled", "cycled", function ()
				if f26_local0 ~= IsGrandSlamActive( f26_arg1 ) then
					DelayGoBack( f26_arg0, f26_arg1 )
				end
			end )
		end
	end
} )
CoD.OverlayUtility.AddSystemOverlay( "BurnDuplicatesConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_BlackMarket",
	title = function ( f34_arg0, f34_arg1 )
		if f34_arg1 == nil or f34_arg1 == -1 then
			return Engine.Localize( "MPUI_BM_BURN_CONFIRMATION_NODUPES" )
		else
			return Engine.Localize( "MPUI_BM_BURN_CONFIRMATION" )
		end
	end,
	description = function ( f35_arg0, f35_arg1 )
		if f35_arg1 == nil or f35_arg1 == -1 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_NO_DUPLICATES" )
		elseif f35_arg1 == 0 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_NONE" )
		elseif f35_arg1 == 1 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_ONE" )
		else
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_MULTIPLE", f35_arg1 )
		end
	end,
	image = "uie_t7_blackmarket_bribe",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "BurnDuplicates",
	totalDuplicates = CoD.BlackMarketUtility.GetNumDupesTotal,
	commonDuplicates = function ( f36_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f36_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON )
	end,
	rareDuplicates = function ( f37_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f37_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE )
	end,
	legendaryDuplicates = function ( f38_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f38_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY )
	end,
	epicDuplicates = function ( f39_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f39_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
	end,
	listDatasource = function ( f40_arg0 )
		DataSources.BurnDuplicatesMenuList = DataSourceHelpers.ListSetup( "BurnDuplicatesMenuList", function ( f41_arg0, f41_arg1 )
			local f41_local0 = {}
			local f41_local1 = function ( f42_arg0, f42_arg1, f42_arg2 )
				return {
					models = {
						displayText = f42_arg0
					},
					properties = {
						action = f42_arg1,
						selectIndex = f42_arg2
					}
				}
			end
			
			local f41_local2 = f41_arg1.finishedBurningDuplicates
			if not f41_local2 and CoD.BlackMarketUtility.GetNumDupesTotal( f41_arg0 ) == 0 and not f41_arg1.isBurningDuplicates then
				f41_local2 = true
			end
			if f41_local2 then
				local f41_local3 = function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3, f43_arg4 )
					GoBack( f43_arg4, f43_arg2 )
				end
				
				local f41_local4 = {}
				return f41_local1( "MENU_OK_CAPS", f41_local3, true )
			elseif f41_arg1.isBurningDuplicates then
				return {}
			end
			local f41_local3 = function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3, f44_arg4 )
				if f41_arg1.isBurningDuplicates then
					return 
				end
				local f44_local0 = Engine.GetLobbyUIScreen()
				if f44_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINE.id and f44_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f44_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id and f44_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
					GoBack( f44_arg4, f44_arg2 )
					LuaUtils.UI_ShowErrorMessageDialog( f44_arg2, "MPUI_BM_BURN_DUPLICATES_FAILED", "" )
				end
				if Engine.BurnLootDuplicates == nil or not Engine.BurnLootDuplicates( f44_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
					GoBack( f44_arg4, f44_arg2 )
					LuaUtils.UI_ShowErrorMessageDialog( f44_arg2, "MPUI_BM_BURN_DUPLICATES_FAILED", "" )
					return 
				end
				f41_arg1.isBurningDuplicates = true
				f44_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
				f41_arg1.disabled = true
				f44_arg0:setState( "BurningDuplicates" )
				f44_arg0.BurningDuplicatesAnimation:playClip( "StartBurning" )
				f44_arg0.BurningDuplicatesAnimation.nextClip = "Burning"
				f41_arg1:updateDataSource( true )
				CoD.Menu.UpdateAllButtonPrompts( f44_arg4, f44_arg2 )
				local f44_local1 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f44_arg2 ) * CoD.BlackMarketUtility.XPPerCryptoKey + CoD.BlackMarketUtility.GetXPEarnedForBurning( f44_arg2, CoD.BlackMarketUtility.GetNumDupesForType( f44_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON ), CoD.BlackMarketUtility.GetNumDupesForType( f44_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE ), CoD.BlackMarketUtility.GetNumDupesForType( f44_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY ), CoD.BlackMarketUtility.GetNumDupesForType( f44_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC ) )
				if Dvar.ui_cryptocommondupes:exists() then
					Dvar.ui_cryptocommondupes:set( 0 )
					Dvar.ui_cryptoraredupes:set( 0 )
					Dvar.ui_cryptolegendarydupes:set( 0 )
					Dvar.ui_cryptoepicdupes:set( 0 )
				end
				Engine.PlaySound( "uin_bm_keyburn_loop" )
				CoD.OverlayUtility.UpdateBurnDupeProgress()
				f44_arg0.BurningDuplicatesAnimation:registerEventHandler( "clip_over", function ( element, event )
					local f45_local0 = Engine.GetBurnDupeState()
					if Engine.IsInventoryBusy( f44_arg2 ) or f45_local0 == Enum.LootBurnDupeState.LOOT_BURN_DUPE_REQUESTED or f45_local0 == Enum.LootBurnDupeState.LOOT_BURN_DUPE_BUSY then
						CoD.OverlayUtility.UpdateBurnDupeProgress()
						Engine.PlaySound( "uin_bm_keyburn_loop" )
						LUI.UIElement.clipOver( element, event )
					else
						CoD.OverlayUtility.UpdateBurnDupeProgress()
						Engine.PlaySound( "uin_bm_keyburn_loop" )
						element:playClip( "StopBurning" )
						element:registerEventHandler( "clip_over", function ( element, event )
							Engine.PlaySound( "uin_bm_keyburn_done" )
							CoD.OverlayUtility.UpdateBurnDupeProgress()
							element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
							f41_arg1.finishedBurningDuplicates = true
							f44_arg4[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack()
							f41_arg1.disabled = false
							CoD.Menu.UpdateAllButtonPrompts( f44_arg4, f44_arg2 )
							if f45_local0 == Enum.LootBurnDupeState.LOOT_BURN_DUPE_FAILED then
								GoBack( f44_arg4, f44_arg2 )
								LuaUtils.UI_ShowErrorMessageDialog( f44_arg2, "MPUI_BM_BURN_DUPLICATES_FAILED", "" )
								return 
							end
							f44_arg0:setState( "BurnedDuplicates" )
							local f46_local0 = math.floor( f44_local1 / CoD.BlackMarketUtility.XPPerCryptoKey )
							local f46_local1 = f44_arg0.textForBurning.text
							local f46_local2 = f46_local1
							f46_local1 = f46_local1.setText
							local f46_local3 = Engine.Localize
							local f46_local4
							if f46_local0 == 1 then
								f46_local4 = "MPUI_BM_BURNED_DESC_EARNED_ONE"
								if not f46_local4 then
								
								else
									f46_local1( f46_local2, f46_local3( f46_local4, f46_local0 ) )
									f41_arg1:updateDataSource()
								end
							end
							f46_local4 = "MPUI_BM_BURNED_DESC"
						end )
					end
				end )
				SendFrontendControllerZeroMenuResponse( f44_arg2, "BlackMarket", "burn_duplicates" )
			end
			
			local f41_local4 = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
				if f41_arg1.isBurningDuplicates then
					return 
				else
					GoBack( f47_arg4, f47_arg2 )
				end
			end
			
			if Dvar.tu4_burnDuplicates:exists() and (Dvar.tu4_burnDuplicates:get() == true or Dvar.tu4_burnDuplicates:get() == "1") then
				table.insert( f41_local0, f41_local1( "MPUI_BURN_DUPLICATES_CAPS", f41_local3, false ) )
			end
			table.insert( f41_local0, f41_local1( "MENU_CANCEL_CAPS", f41_local4, true ) )
			return f41_local0
		end, true )
		return "BurnDuplicatesMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PurchaseTrifectaConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_BlackMarket",
	title = function ( f48_arg0, f48_arg1 )
		if (f48_arg1.itemCODPointCost == 0 or Engine.GetCoDPoints( f48_arg0 ) < f48_arg1.itemCODPointCost) and (f48_arg1.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f48_arg0 ) < f48_arg1.itemCost) then
			return "MPUI_BM_NO_CURRENCY"
		else
			return Engine.ToUpper( Engine.Localize( f48_arg1.displayText ) )
		end
	end,
	description = function ( f49_arg0, f49_arg1 )
		if f49_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f49_arg0 ) < f49_arg1.itemCODPointCost and f49_arg1.itemCost > 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f49_arg0 ) < f49_arg1.itemCost then
			return Engine.Localize( "MPUI_BM_NO_CURRENCY_DESCRIPTION", f49_arg1.displayText )
		elseif f49_arg1.itemCost == 0 and Engine.GetCoDPoints( f49_arg0 ) < f49_arg1.itemCODPointCost then
			return Engine.Localize( "MPUI_BM_TRIFECTA_NEED_CODPOINTS", f49_arg1.displayText )
		elseif f49_arg1.itemCODPointCost == 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f49_arg0 ) < f49_arg1.itemCost then
			return Engine.Localize( "MPUI_BM_TRIFECTA_NEED_CRYPTOKEYS", f49_arg1.displayText )
		elseif f49_arg1.itemCODPointCost == 0 then
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_KEYS_TEXT", f49_arg1.displayText )
		elseif f49_arg1.itemCost == 0 then
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_CODPOINTS_TEXT", f49_arg1.displayText )
		else
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_TEXT", f49_arg1.displayText )
		end
	end,
	image = "t7_blackmarket_promo_triple_play",
	cost = function ( f50_arg0, f50_arg1 )
		return f50_arg1.itemCost
	end,
	codpointcost = function ( f51_arg0, f51_arg1 )
		return f51_arg1.itemCODPointCost
	end,
	supplyDropType = CoD.BlackMarketUtility.DropTypes.TRIFECTA,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "PurchaseSupplyDrop",
	listDatasource = function ( f52_arg0, f52_arg1 )
		DataSources.PurchaseTrifectaMenuList = DataSourceHelpers.ListSetup( "PurchaseTrifectaMenuList", function ( f53_arg0, f53_arg1 )
			local f53_local0 = {}
			if f53_arg1.purchasingBundle then
				return {}
			end
			local f53_local1 = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
				return {
					models = {
						displayText = f54_arg0,
						disabled = f54_arg3
					},
					properties = {
						action = f54_arg1,
						actionParam = f52_arg1,
						selectIndex = f54_arg2
					}
				}
			end
			
			local f53_local2 = function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3, f55_arg4 )
				local f55_local0 = Dvar.trifecta_cryptokeys_sku:get()
				if f55_local0 then
					CoD.BlackMarketUtility.TradeForTrifectaAction( f55_arg0, f55_arg1, f55_arg2, f55_arg3, f55_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_CRYPTO_KEYS, f53_arg1, f55_local0 )
				end
			end
			
			local f53_local3 = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3, f56_arg4 )
				local f56_local0 = Dvar.trifecta_cod_points_sku:get()
				if f56_local0 then
					CoD.BlackMarketUtility.TradeForTrifectaAction( f56_arg0, f56_arg1, f56_arg2, f56_arg3, f56_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_COD_POINTS, f53_arg1, f56_local0 )
				end
			end
			
			local f53_local4 = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg4 )
				GoBack( f57_arg4, f57_arg2 )
			end
			
			if f53_arg1.purchasedBundle then
				table.insert( f53_local0, f53_local1( "MENU_CONTINUE_CAPS", f53_local4, true, false ) )
				return f53_local0
			elseif f52_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f53_arg0 ) < f52_arg1.itemCODPointCost and (f52_arg1.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f53_arg0 ) < f52_arg1.itemCost) then
				table.insert( f53_local0, f53_local1( "MPUI_PURCHASE_CODPOINTS_CAPS", f0_local0, true, false ) )
				table.insert( f53_local0, f53_local1( "MENU_CANCEL_CAPS", f53_local4, false, false ) )
			elseif f52_arg1.itemCODPointCost == 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f53_arg0 ) < f52_arg1.itemCost then
				table.insert( f53_local0, f53_local1( "MENU_CONTINUE_CAPS", f53_local4, false, false ) )
			else
				if f52_arg1.itemCost > 0 then
					table.insert( f53_local0, f53_local1( Engine.Localize( "MPUI_BM_TRADE_CRYPTOKEYS", f52_arg1.itemCost ), f53_local2, true, CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f53_arg0 ) < f52_arg1.itemCost ) )
				end
				if f52_arg1.itemCODPointCost > 0 then
					table.insert( f53_local0, f53_local1( Engine.Localize( "MPUI_BM_TRADE_COD_POINTS", f52_arg1.itemCODPointCost ), f53_local3, false, Engine.GetCoDPoints( f53_arg0 ) < f52_arg1.itemCODPointCost ) )
				end
				table.insert( f53_local0, f53_local1( "MENU_CANCEL_CAPS", f53_local4, false, false ) )
			end
			return f53_local0
		end, true )
		return "PurchaseTrifectaMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	postCreateStep = function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
		local f58_local0 = IsTrifectaBundleActive( f58_arg1 )
		f58_arg0:subscribeToGlobalModel( f58_arg1, "AutoeventsCycled", "cycled", function ()
			if f58_local0 ~= IsTrifectaBundleActive( f58_arg1 ) then
				DelayGoBack( f58_arg0, f58_arg1 )
			end
		end )
	end
} )
DataSources.BlackMarketCryptokeyList = DataSourceHelpers.ListSetup( "BlackMarketCryptokeyList", function ( f60_arg0, f60_arg1 )
	local f60_local0 = {}
	local f60_local1 = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
	local f60_local2 = function ()
		if f60_local1 == Enum.LUIAlignment.LUI_ALIGNMENT_LEFT then
			f60_local1 = Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
		else
			f60_local1 = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
		end
	end
	
	local f60_local3 = function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3, f62_arg4, f62_arg5, f62_arg6, f62_arg7, f62_arg8, f62_arg9, f62_arg10 )
		if f62_arg3 == "MPUI_BM_RARE_KEY_HINT_TEXT" and Dvar.tu4_enableBonusCryptokeysHint:exists() and Dvar.tu4_enableBonusCryptokeysHint:get() == false then
			f62_arg3 = "MPUI_BM_RARE_KEY_HINT_TEXT_NOBONUS"
		end
		if not f62_arg8 then
			f62_arg8 = 1
		end
		local f62_local0 = f60_local1
		if f62_arg8 > 1 then
			f62_local0 = Enum.LUIAlignment.LUI_ALIGNMENT_CENTER
		else
			f60_local2()
		end
		return {
			models = {
				displayText = f62_arg0,
				displayTextTitle = f62_arg9 or f62_arg0,
				image = f62_arg1,
				hintText = f62_arg3,
				itemCount = f62_arg4,
				itemCODPointCost = f62_arg5,
				rewardCount = f62_arg10,
				hintTextAlign = f62_local0
			},
			properties = {
				action = f62_arg6,
				supplyDropType = f62_arg7,
				actionParam = {
					displayText = f62_arg0,
					image = f62_arg2,
					itemCost = f62_arg4,
					itemCODPointCost = f62_arg5,
					supplyDropType = f62_arg7
				},
				columnSpan = f62_arg8
			}
		}
	end
	
	local f60_local4 = function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3, f63_arg4 )
		CoD.OverlayUtility.CreateOverlay( f63_arg2, f63_arg0, "PurchaseSupplyDropConfirmation", f63_arg2, f63_arg3 )
	end
	
	local f60_local5 = function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3, f64_arg4 )
		f64_arg3.vials = tonumber( Dvar.loot_vialsFromKeysOffer:get() )
		f64_arg3.isCryptokeys = true
		f64_arg3.cryptokeyCost = f64_arg3.itemCost
		CoD.OverlayUtility.CreateOverlay( f64_arg2, f64_arg0, "PurchaseVialsConfirmation", f64_arg2, f64_arg3 )
	end
	
	local f60_local6 = function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4 )
		CoD.BlackMarketUtility.TradeForCrateAction( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f60_local0 )
	end
	
	local f60_local7 = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4 )
		CoD.OverlayUtility.CreateOverlay( f66_arg2, f66_arg0, "PurchaseTrifectaConfirmation", f66_arg2, f66_arg3 )
	end
	
	local f60_local8 = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
		if not IsSixPackBundleInCooldown( f67_arg2 ) then
			f60_local4( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
		end
	end
	
	local f60_local9 = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4 )
		if not IsDailyDoubleBundleInCooldown( f68_arg2 ) then
			f60_local4( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4 )
		end
	end
	
	if IsTrifectaBundleActive( f60_arg0 ) then
		local f60_local10 = 0
		local f60_local11 = 0
		if Dvar.trifecta_cryptokeys_drop_id:exists() and Engine.GetInventoryItemQuantity( f60_arg0, Dvar.trifecta_cryptokeys_drop_id:get() ) == 0 then
			f60_local10 = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.TRIFECTA )
		end
		if Dvar.trifecta_cod_points_drop_id:exists() and Engine.GetInventoryItemQuantity( f60_arg0, Dvar.trifecta_cod_points_drop_id:get() ) == 0 then
			f60_local11 = CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.TRIFECTA )
		end
		if f60_local10 > 0 or f60_local11 > 0 then
			table.insert( f60_local0, f60_local3( "MPUI_BM_TRIFECTA", "t7_blackmarket_promo_triple_play", "t7_blackmarket_promo_triple_play", "MPUI_BM_TRIFECTA_KEY_HINT_TEXT", f60_local10, f60_local11, f60_local7, CoD.BlackMarketUtility.DropTypes.TRIFECTA, 2, "MPUI_BM_TRIFECTA_PACKAGE_DESC" ) )
		end
	end
	if CoD.BlackMarketUtility.GetCurrentBribeString() ~= nil then
		local f60_local10 = CoD.BlackMarketUtility.GetCurrentBribeString()
		local f60_local11 = CoD.BlackMarketUtility.GetCurrentBribeImage()
		table.insert( f60_local0, f60_local3( f60_local10, f60_local11, f60_local11 .. "_hover", CoD.BlackMarketUtility.GetCurrentBribeHint(), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BRIBE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.BRIBE ), f60_local4, CoD.BlackMarketUtility.DropTypes.BRIBE, 2 ) )
	end
	if IsGrandSlamActive( f60_arg0 ) then
		local f60_local10 = 0
		local f60_local11 = 0
		if Engine.GetInventoryItemQuantity( f60_arg0, CoD.BlackMarketUtility.loot_grand_slam_drop_id ) == 0 then
			f60_local11 = CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.GRAND_SLAM ) or 0
		end
		if f60_local10 > 0 or f60_local11 > 0 then
			table.insert( f60_local0, f60_local3( "MPUI_BM_GRAND_SLAM", "t7_blackmarket_crate_bribe_grandslam_large", "t7_blackmarket_crate_bribe_grandslam_large", "MPUI_BM_GRAND_SLAM_KEY_HINT_TEXT", f60_local10, f60_local11, f60_local4, CoD.BlackMarketUtility.DropTypes.GRAND_SLAM, 2, "MPUI_BM_GRAND_SLAM_PACKAGE_DESC" ) )
		end
	end
	if IsHundredBundleActive( f60_arg0 ) then
		local f60_local10 = CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f60_arg0 )
		local f60_local11 = CoD.BlackMarketUtility.HundredBundleImage
		if f60_local10 > 0 then
			table.insert( f60_local0, f60_local3( CoD.BlackMarketUtility.HundredBundleTitle, f60_local11, f60_local11 .. "_glow", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f60_local10 ), 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE, 2 ) )
		else
			table.insert( f60_local0, f60_local3( CoD.BlackMarketUtility.HundredBundleTitle, f60_local11, f60_local11 .. "_glow", Engine.Localize( CoD.BlackMarketUtility.HundredBundleHint, Engine.DvarInt( nil, "loot_rare100_cpcost" ) ), 0, CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE ), f60_local4, CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE, 2, "MPUI_BM_HUNDRED_BUNDLE_PROMO_DESC" ) )
		end
		f60_arg1.currentHundredBundleCount = f60_local10
		if not f60_arg1.updateHundredBundleSubscription then
			f60_arg1.updateHundredBundleSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "hundredBundles" ), function ()
				if CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f60_arg0 ) ~= f60_arg1.currentHundredBundleCount then
					f60_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsRareBundle10for5Active( f60_arg0 ) then
		local f60_local10 = CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f60_arg0 )
		local f60_local11 = CoD.BlackMarketUtility.RareBundle10for5Image
		if f60_local10 > 0 then
			table.insert( f60_local0, f60_local3( CoD.BlackMarketUtility.RareBundle10for5Title, f60_local11, f60_local11 .. "_glow", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f60_local10 ), 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5, 2 ) )
		else
			table.insert( f60_local0, f60_local3( CoD.BlackMarketUtility.RareBundle10for5Title, f60_local11, f60_local11 .. "_glow", Engine.Localize( CoD.BlackMarketUtility.RareBundle10for5Hint, Engine.DvarInt( nil, "rare_bundle_10for5_cpCost" ) ), 0, CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 ), f60_local4, CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5, 2, "MPUI_BM_RARE_BUNDLE_10FOR5_PROMO_DESC" ) )
		end
		f60_arg1.currentRareBundle10for5Count = f60_local10
		if not f60_arg1.updateRareBundle10for5Subscription then
			f60_arg1.updateRareBundle10for5Subscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "rareBundle10for5s" ), function ()
				if CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f60_arg0 ) ~= f60_arg1.currentRareBundle10for5Count then
					f60_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsBundleActive( f60_arg0 ) then
		local f60_local10 = CoD.BlackMarketUtility.GetCurrentBundleCount( f60_arg0 )
		local f60_local11 = CoD.BlackMarketUtility.BundleImage
		if f60_local10 > 0 then
			table.insert( f60_local0, f60_local3( CoD.BlackMarketUtility.BundleTitle, f60_local11, f60_local11 .. "_glow", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f60_local10, Engine.DvarInt( nil, "loot_bundle_final_count" ) ), 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.RARE, 2 ) )
		else
			table.insert( f60_local0, f60_local3( CoD.BlackMarketUtility.BundleTitle, f60_local11, f60_local11 .. "_glow", Engine.Localize( CoD.BlackMarketUtility.BundleHint, Engine.DvarInt( nil, "loot_bundle_final_count" ), Engine.DvarInt( nil, "loot_bundle_cpCost" ) ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BUNDLE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.BUNDLE ), f60_local4, CoD.BlackMarketUtility.DropTypes.BUNDLE, 2, "MPUI_BM_BUNDLE_PROMO_DESC" ) )
		end
		f60_arg1.currentBundleCount = f60_local10
		if not f60_arg1.updateBundlesSubscription then
			f60_arg1.updateBundlesSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "bundles" ), function ()
				if CoD.BlackMarketUtility.GetCurrentBundleCount( f60_arg0 ) ~= f60_arg1.currentBundleCount then
					f60_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsKeysForVialsOfferActive( f60_arg0 ) then
		local f60_local10 = "t7_blackmarket_divinium_chip"
		local f60_local11 = "t7_blackmarket_divinium_chip"
		local f60_local12 = tonumber( Dvar.loot_vialsCost:get() or 60 )
		local f60_local13 = 0
		local f60_local14 = tonumber( Dvar.loot_vialsFromKeysOffer:get() )
		table.insert( f60_local0, f60_local3( Engine.Localize( "MPUI_BM_OFFER_DIVINIUM", f60_local14 ), f60_local10, f60_local11, Engine.Localize( "MPUI_BM_OFFER_DIVINIUM_HINT", f60_local12, f60_local14 ), f60_local12, f60_local13, f60_local5, CoD.BlackMarketUtility.DropTypes.TRADE_KEYS_FOR_VIALS, 2 ) )
	end
	local f60_local10 = nil
	if IsLootSaleActive( f60_arg0 ) then
		table.insert( f60_local0, f60_local3( "MPUI_BM_RARE_DROP", "uie_t7_blackmarket_crate_rare_focus", "uie_t7_blackmarket_crate_rare_focus", DvarLocalizedIntoStringMultiplied( "loot_salePercentOff", 100, "MPUI_BM_RARE_DROP_PROMO_HINT" ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.RARE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.RARE ), f60_local4, CoD.BlackMarketUtility.DropTypes.RARE, 2, "MPUI_BM_RARE_DROP_PROMO_DESC" ) )
	end
	local f60_local11 = #f60_local0 < 2
	local f60_local12 = f60_local3( "MPUI_BM_COMMON_DROP", "t7_blackmarket_crate_common", "uie_t7_blackmarket_crate_common_focus", "MPUI_BM_COMMON_KEY_HINT_TEXT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.COMMON ), f60_local4, CoD.BlackMarketUtility.DropTypes.COMMON )
	table.insert( f60_local0, f60_local12 )
	if not IsLootSaleActive( f60_arg0 ) then
		f60_local10 = f60_local3( "MPUI_BM_RARE_DROP", "t7_blackmarket_crate_rare", "uie_t7_blackmarket_crate_rare_focus", "MPUI_BM_RARE_KEY_HINT_TEXT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.RARE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.RARE ), f60_local4, CoD.BlackMarketUtility.DropTypes.RARE )
		table.insert( f60_local0, f60_local10 )
	end
	if IsSixPackBundleActive( f60_arg0 ) then
		local f60_local13 = CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f60_arg0 )
		if f60_local13 > 0 then
			table.insert( f60_local0, f60_local3( "MPUI_BM_SIX_PACK", "uie_t7_blackmarket_6pack_commons_closed", "uie_t7_blackmarket_6pack_commons_closed", Engine.Localize( "MPUI_BM_SIX_PACK_BUNDLES_REMAINING", f60_local13 ), 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.SIX_PACK ) )
		else
			table.insert( f60_local0, f60_local3( "MPUI_BM_SIX_PACK", "uie_t7_blackmarket_6pack_commons_closed", "uie_t7_blackmarket_6pack_commons_closed", Engine.Localize( "MPUI_BM_SIX_PACK_PROMO_HINT", Engine.DvarInt( nil, "loot_sixPack_final_count" ) ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.SIX_PACK ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.SIX_PACK ), f60_local8, CoD.BlackMarketUtility.DropTypes.SIX_PACK ) )
		end
		f60_local11 = false
		f60_arg1.currentSixPackCommonBundleCount = f60_local13
		if not f60_arg1.updateSixPackCommonSubscription then
			f60_arg1.updateSixPackCommonSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "sixPackCommonBundles" ), function ()
				local f72_local0 = CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f60_arg0 )
				if f72_local0 ~= f60_arg1.currentSixPackCommonBundleCount then
					f60_arg1.currentSixPackCommonBundleCount = f72_local0
					f60_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsDailyDoubleBundleActive( f60_arg0 ) then
		local f60_local13 = CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f60_arg0 )
		if f60_local13 > 0 then
			table.insert( f60_local0, f60_local3( "MPUI_BM_DAILY_DOUBLE", "uie_t7_blackmarket_dailydouble", "uie_t7_blackmarket_dailydouble", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f60_local13 ), 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE_RARE_BUNDLE ) )
		else
			table.insert( f60_local0, f60_local3( "MPUI_BM_DAILY_DOUBLE", "uie_t7_blackmarket_dailydouble", "uie_t7_blackmarket_dailydouble", Engine.Localize( "MPUI_BM_DAILY_DOUBLE_PROMO_HINT", Engine.DvarInt( nil, "loot_dailyDouble_final_count" ) ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE ), f60_local9, CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE ) )
		end
		f60_local11 = false
		f60_arg1.currentDailyDoubleRareBundleCount = f60_local13
		if not f60_arg1.updateDailyDoubleRareSubscription then
			f60_arg1.updateDailyDoubleRareSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "dailyDoubleRareBundles" ), function ()
				local f73_local0 = CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f60_arg0 )
				if f73_local0 ~= f60_arg1.currentDailyDoubleRareBundleCount then
					f60_arg1.currentDailyDoubleRareBundleCount = f73_local0
					f60_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if HasWeapon3XBundles( f60_arg0 ) then
		local f60_local13 = CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f60_arg0 )
		table.insert( f60_local0, f60_local3( "MPUI_BM_WEAPON_3X", "t7_blackmarket_bribe_gold_bribe_3_weapons", "t7_blackmarket_bribe_gold_bribe_3_weapons", "MPUI_BM_WEAPON_3X_HINT", 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.WEAPON_3X ) )
		f60_local11 = false
		f60_arg1.currentWeapon3XBundleCount = f60_local13
		if not f60_arg1.updateWeapon3XSubscription then
			f60_arg1.updateWeapon3XSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "weapon3XBundles" ), function ()
				local f74_local0 = CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f60_arg0 )
				if f74_local0 ~= f60_arg1.currentWeapon3XBundleCount then
					f60_arg1.currentWeapon3XBundleCount = f74_local0
					f60_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if HasLimitedEditionCamoBundles( f60_arg0 ) then
		local f60_local13 = CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f60_arg0 )
		table.insert( f60_local0, f60_local3( "MPUI_BM_LIMITED_CAMO_BUNDLE", "t7_blackmarket_bribe_gold_bribe_camo", "t7_blackmarket_bribe_gold_bribe_camo", "MPUI_BM_LIMITED_CAMO_BUNDLE_HINT", 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO ) )
		f60_local11 = false
		f60_arg1.currentlimitedEditionCamoBundleCount = f60_local13
		if not f60_arg1.updateLimitedEditionCamoSubscription then
			f60_arg1.updateLimitedEditionCamoSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "limitedEditionCamoBundles" ), function ()
				local f75_local0 = CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f60_arg0 )
				if f75_local0 ~= f60_arg1.currentlimitedEditionCamoBundleCount then
					f60_arg1.currentlimitedEditionCamoBundleCount = f75_local0
					f60_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsNoDupesCrateActive( f60_arg0 ) then
		table.insert( f60_local0, f60_local3( "MPUI_BM_NO_DUPES_CRATE", "uie_t7_blackmarket_crate_rare_focus", "uie_t7_blackmarket_crate_rare_focus", "MPUI_BM_NO_DUPES_CRATE_HINT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE ) or 0, CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE ) or 0, f60_local4, CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE, 1, "MPUI_BM_RARE_DROP" ) )
	end
	if IsNoDupesBundleActive( f60_arg0 ) then
		local f60_local13 = CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f60_arg0 )
		if f60_local13 > 0 then
			table.insert( f60_local0, f60_local3( "MPUI_BM_NO_DUPES_BUNDLE_TITLE", "uie_t7_blackmarket_crate_bundle_10", "uie_t7_blackmarket_crate_bundle_10", "MPUI_BM_NO_DUPES_CRATE_HINT", 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE, 1, "MPUI_BM_NO_DUPES_BUNDLE" ) )
		else
			table.insert( f60_local0, f60_local3( "MPUI_BM_NO_DUPES_BUNDLE_TITLE", "uie_t7_blackmarket_crate_bundle_10", "uie_t7_blackmarket_crate_bundle_10", Engine.Localize( "MPUI_BM_NO_DUPES_BUNDLE_HINT", 20 ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE ) or 0, CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE ) or 0, f60_local4, CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE, 1, "MPUI_BM_NO_DUPES_BUNDLE" ) )
		end
		f60_local11 = false
		f60_arg1.currentNoDupesRareBundleCount = f60_local13
		if not f60_arg1.updateNoDupesRareSubscription then
			f60_arg1.updateNoDupesRareSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "noDupesRareBundles" ), function ()
				local f76_local0 = CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f60_arg0 )
				if f76_local0 ~= f60_arg1.currentNoDupesRareBundleCount then
					f60_arg1.currentNoDupesRareBundleCount = f76_local0
					f60_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsBundleExperimentActive( f60_arg0 ) then
		local f60_local13 = CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f60_arg0 )
		local f60_local14 = Engine.Localize( "MPUI_BM_BUNDLE_EXPERIMENT", Engine.Localize( Engine.DvarString( nil, "loot_3pack_final_count_string_ref" ) ) )
		if f60_local13 > 0 then
			table.insert( f60_local0, f60_local3( f60_local14, "uie_t7_blackmarket_crate_bundle", "uie_t7_blackmarket_crate_bundle", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f60_local13 ), 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT ) )
		else
			table.insert( f60_local0, f60_local3( f60_local14, "uie_t7_blackmarket_crate_bundle", "uie_t7_blackmarket_crate_bundle", Engine.Localize( "MPUI_BM_BUNDLE_EXPERIMENT_HINT", Engine.DvarInt( nil, "loot_3pack_final_count" ) ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT ), f60_local4, CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT ) )
		end
		f60_local11 = false
		f60_arg1.currentBundleExperimentRareBundleCount = f60_local13
		if not f60_arg1.updateBundleExperimentRareSubscription then
			f60_arg1.updateBundleExperimentRareSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "bundleExperimentRareBundles" ), function ()
				local f77_local0 = CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f60_arg0 )
				if f77_local0 ~= f60_arg1.currentBundleExperimentRareBundleCount then
					f60_arg1.currentBundleExperimentRareBundleCount = f77_local0
					f60_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if HasCodeBundles( f60_arg0 ) then
		table.insert( f60_local0, f60_local3( "MPUI_BM_CODE_BUNDLE", "uie_t7_blackmarket_crate_bundle", "uie_t7_blackmarket_crate_bundle", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", CoD.BlackMarketUtility.GetCurrentCodeBundleRareBundleCount( f60_arg0 ) ), 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.CODE_BUNDLE ) )
		f60_local11 = false
	end
	f60_arg1.currentCodeBundleRareBundleCount = currentCodeBundleRareBundleCount
	if not f60_arg1.updateCodeBundleRareBundles then
		f60_arg1.updateCodeBundleRareBundles = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "codeBundleRareBundles" ), function ()
			local f78_local0 = CoD.BlackMarketUtility.GetCurrentCodeBundleRareBundleCount( f60_arg0 )
			if f78_local0 ~= f60_arg1.currentCodeBundleRareBundleCount then
				f60_arg1.currentCodeBundleRareBundleCount = f78_local0
				f60_arg1:updateDataSource( false )
			end
		end, false )
	end
	local f60_local13 = CoD.BlackMarketUtility.GetCurrentIncentiveRareBundleCount( f60_arg0 )
	if f60_local13 > 0 then
		local f60_local14 = "blacktransparent"
		table.insert( f60_local0, f60_local3( CoD.BlackMarketUtility.IncentiveRareBundleTitle, f60_local14, f60_local14, Engine.Localize( CoD.BlackMarketUtility.IncentiveRareBundleHint, f60_local13 ), 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.INCENTIVE_RARE_BUNDLE ) )
		f60_local11 = false
	end
	f60_arg1.currentIncentiveRareBundleCount = f60_local13
	if not f60_arg1.updateIncentiveRareSubscription then
		f60_arg1.updateIncentiveRareSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "incentiveRareBundles" ), function ()
			if CoD.BlackMarketUtility.GetCurrentIncentiveRareBundleCount( f60_arg0 ) ~= f60_arg1.currentIncentiveRareBundleCount then
				f60_arg1:updateDataSource( false )
			end
		end, false )
	end
	local f60_local14 = CoD.BlackMarketUtility.GetCurrentIncentiveWeaponBundleCount( f60_arg0 )
	if f60_local14 > 0 then
		local f60_local15 = "blacktransparent"
		table.insert( f60_local0, f60_local3( CoD.BlackMarketUtility.IncentiveWeaponBundleTitle, f60_local15, f60_local15, Engine.Localize( CoD.BlackMarketUtility.IncentiveWeaponBundleHint, f60_local14 ), 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.INCENTIVE_WEAPON_BUNDLE ) )
		f60_local11 = false
	end
	f60_arg1.currentIncentiveWeaponBundleCount = f60_local14
	if not f60_arg1.updateIncentiveWeaponSubscription then
		f60_arg1.updateIncentiveWeaponSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "incentiveWeaponBundles" ), function ()
			if CoD.BlackMarketUtility.GetCurrentIncentiveWeaponBundleCount( f60_arg0 ) ~= f60_arg1.currentIncentiveWeaponBundleCount then
				f60_arg1:updateDataSource( false )
			end
		end, false )
	end
	local f60_local15 = CoD.BlackMarketUtility.GetCurrentNoDupeRangeBundleCount( f60_arg0 )
	if f60_local15 > 0 then
		table.insert( f60_local0, f60_local3( "MPUI_BM_BRIBE_RANGE_WEAPON", "t7_blackmarket_bribe_weapon", "t7_blackmarket_bribe_weapon", "MPUI_BM_BRIBE_RANGE_WEAPON_KEY_HINT_TEXT", 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE, 1, "", f60_local15 ) )
		f60_local11 = false
	end
	f60_arg1.currentRangeWeaponNoDupesBundleCount = f60_local15
	if not f60_arg1.updateRangeWeaponNoDupesSubscription then
		f60_arg1.updateRangeWeaponNoDupesSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "rangeWeaponNoDupesBundles" ), function ()
			if CoD.BlackMarketUtility.GetCurrentNoDupeRangeBundleCount( f60_arg0 ) ~= f60_arg1.currentRangeWeaponNoDupesBundleCount then
				f60_arg1:updateDataSource( false )
			end
		end, false )
	end
	local f60_local16 = CoD.BlackMarketUtility.GetCurrentNoDupeMeleeBundleCount( f60_arg0 )
	if f60_local16 > 0 then
		table.insert( f60_local0, f60_local3( "MPUI_BM_BRIBE_MELEE_WEAPON", "t7_blackmarket_bribe_melee", "t7_blackmarket_bribe_melee", "MPUI_BM_BRIBE_MELEE_WEAPON_KEY_HINT_TEXT", 0, 0, f60_local6, CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE, 1, "", f60_local16 ) )
		f60_local11 = false
	end
	f60_arg1.currentMeleeWeaponNoDupesBundleCount = f60_local16
	if not f60_arg1.updateMeleeWeaponNoDupesSubscription then
		f60_arg1.updateMeleeWeaponNoDupesSubscription = f60_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f60_arg0 ), "meleeWeaponNoDupesBundles" ), function ()
			if CoD.BlackMarketUtility.GetCurrentNoDupeMeleeBundleCount( f60_arg0 ) ~= f60_arg1.currentMeleeWeaponNoDupesBundleCount then
				f60_arg1:updateDataSource( false )
			end
		end, false )
	end
	f60_local12.models.useTallVersion = f60_local11
	f60_local10.models.useTallVersion = f60_local11
	return f60_local0
end, true )
DataSources.BlackMarketCryptokeyList.getWidgetTypeForItem = function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
	if f83_arg0.BlackMarketCryptokeyList[f83_arg3].properties then
		if f83_arg0.BlackMarketCryptokeyList[f83_arg3].properties.isBribeCoin then
			return CoD.BribeCoinWidget
		else
			return CoD.CryptokeyWidget
		end
	else
		return nil
	end
end

DataSources.BlackMarketList = DataSourceHelpers.ListSetup( "BlackMarketList", function ( f84_arg0 )
	local f84_local0 = {}
	local f84_local1 = function ( f85_arg0, f85_arg1, f85_arg2, f85_arg3, f85_arg4, f85_arg5 )
		return {
			models = {
				displayText = f85_arg0,
				image = f85_arg2,
				disabled = f85_arg3,
				showBreadcrumb = f85_arg5
			},
			properties = {
				action = f85_arg1,
				selectIndex = f85_arg4
			}
		}
	end
	
	local f84_local2 = function ( f86_arg0, f86_arg1, f86_arg2, f86_arg3, f86_arg4 )
		local f86_local0 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f86_arg2 )
		local f86_local1 = CoD.BlackMarketUtility.GetNumDupesForType( f86_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON )
		local f86_local2 = CoD.BlackMarketUtility.GetNumDupesForType( f86_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE )
		local f86_local3 = CoD.BlackMarketUtility.GetNumDupesForType( f86_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY )
		local f86_local4 = CoD.BlackMarketUtility.GetNumDupesForType( f86_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
		local f86_local5 = CoD.BlackMarketUtility.GetNumKeysEarnedForBurning( f86_arg2, f86_local1, f86_local2, f86_local3, f86_local4 )
		if f86_local1 + f86_local2 + f86_local3 + f86_local4 == 0 then
			f86_local5 = -1
		end
		CoD.OverlayUtility.CreateOverlay( f86_arg2, f86_arg0, "BurnDuplicatesConfirmation", f86_arg2, f86_local5, f86_local1, f86_local2, f86_local3, f86_local4 )
	end
	
	local f84_local3 = function ( f87_arg0, f87_arg1, f87_arg2, f87_arg3, f87_arg4 )
		OpenOverlay( f87_arg4, "BM_History", f87_arg2 )
	end
	
	local f84_local4 = function ( f88_arg0, f88_arg1, f88_arg2, f88_arg3, f88_arg4 )
		CycleContracts( f88_arg2 )
		OpenOverlay( f88_arg4, "BM_Contracts", f88_arg2 )
		local f88_local0 = f88_arg1:getModel( f88_arg2, "showBreadcrumb" )
		if f88_local0 then
			Engine.SetModelValue( f88_local0, false )
		end
	end
	
	local f84_local5 = false
	if Dvar.tu4_enableCodPoints:get() then
		table.insert( f84_local0, f84_local1( "MPUI_BM_BUY", f0_local1, "uie_ui_codpoints_symbol_32x32", f84_local5, true ) )
	end
	if Dvar.show_contracts_button:get() then
		local f84_local6 = Engine.StorageGetBuffer( f84_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		table.insert( f84_local0, f84_local1( "MPUI_BM_CONTRACTS", f84_local4, "uie_ui_codpoints_symbol_32x32", nil, nil, IsCommunityContractBreadCrumbActive( f84_arg0 ) or f84_local6 and f84_local6.ui_seen_new_contracts:get() == 0 or IsTrifectaContractBreadcrumbActive( f84_arg0 ) ) )
	end
	local f84_local6 = Engine.GetLootItemCount( f84_arg0, Enum.eModes.MODE_MULTIPLAYER )
	if f84_local6 ~= nil and f84_local6 > 0 then
		table.insert( f84_local0, f84_local1( "MPUI_BM_RECENT", f84_local3, "uie_ui_codpoints_symbol_32x32" ) )
	end
	if Dvar.tu4_burnDuplicates:get() then
		table.insert( f84_local0, f84_local1( "MPUI_BM_DUPLICATES", f84_local2, "uie_ui_codpoints_symbol_32x32" ) )
	end
	return f84_local0
end, true )
local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GameSettingsFlyoutOpen" ), false )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "targetController" ), controller )
	Engine.SetDvar( "live_autoEventPumpTime", 0 )
end

local PostLoadFunc = function ( f90_arg0, f90_arg1 )
	f90_arg0.disablePopupOpenCloseAnim = true
	if CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f90_arg1 ) >= CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON ) then
		SendFrontendControllerZeroMenuResponse( f90_arg1, "BlackMarket", "greeting" )
	else
		SendFrontendControllerZeroMenuResponse( f90_arg1, "BlackMarket", "greeting_broke" )
	end
	local f90_local0 = CoD.GetPlayerStats( f90_arg1 )
	if f90_local0 then
		f90_local0.blackMarketShowBreadcrumb:set( 0 )
		f90_local0.extraBytes[0]:set( CoD.BlackMarketUtility.CurrentPromotionIndex )
	end
	local f90_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "cycled" )
	local f90_local2 = Engine.CreateModel( Engine.GetModelForController( f90_arg1 ), "six_pack_timer" )
	local f90_local3 = Engine.CreateModel( Engine.GetModelForController( f90_arg1 ), "daily_double_timer" )
	f90_arg0:subscribeToModel( f90_local1, function ( model )
		f90_arg0.cryptokeyList:updateDataSource( false )
	end, false )
	local f90_local4 = IsSixPackBundleInCooldown( f90_arg1 )
	local f90_local5 = IsDailyDoubleBundleInCooldown( f90_arg1 )
	f90_arg0:registerEventHandler( "bm_autoevents_tick", function ( element, event )
		Engine.SetDvar( "live_autoEventPumpTime", 0 )
		local f92_local0 = IsSixPackBundleInCooldown( f90_arg1 )
		local f92_local1 = IsDailyDoubleBundleInCooldown( f90_arg1 )
		if f90_local4 ~= f92_local0 or f90_local5 ~= f92_local1 then
			f90_local4 = f92_local0
			f90_local5 = f92_local1
			Engine.ForceNotifyModelSubscriptions( f90_local1 )
		end
		local f92_local2 = Engine.GetServerUTCTimeStr()
		local f92_local3 = false
		local f92_local4 = Engine.StorageGetBuffer( f90_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f92_local4 then
			local f92_local5 = tonumber( Engine.StringIntegerSubtraction( Engine.StringIntegerAddition( f92_local4.playerstatslist.ARENA_MAX_RANK.statvalue:getAsString(), Engine.DvarInt( nil, "loot_sixPack_cooloffSeconds" ) ), f92_local2 ) )
			if f92_local5 >= 0 then
				Engine.SetModelValue( f90_local2, LuaUtils.SecondsToTimeRemainingString( f92_local5 + 1, true ) )
				f92_local3 = true
			end
		end
		if not f92_local3 then
			local f92_local6 = Engine.GetInventoryItem( f90_arg1, Engine.DvarInt( nil, "loot_sixPack_consumable_id" ) )
			if f92_local6 then
				local f92_local5 = tonumber( Engine.StringIntegerSubtraction( f92_local6.expireTimeStr, f92_local2 ) )
				if f92_local5 >= -CoD.BlackMarketUtility.CooldownTimerBufferSeconds then
					Engine.SetModelValue( f90_local2, LuaUtils.SecondsToTimeRemainingString( f92_local5 + CoD.BlackMarketUtility.CooldownTimerBufferSeconds + 1, true ) )
				end
			end
		end
		local f92_local6 = Engine.GetInventoryItem( f90_arg1, Engine.DvarInt( nil, "loot_dailyDouble_consumable_id" ) )
		if f92_local6 then
			local f92_local5 = tonumber( Engine.StringIntegerSubtraction( f92_local6.expireTimeStr, f92_local2 ) )
			if f92_local5 >= -CoD.BlackMarketUtility.CooldownTimerBufferSeconds then
				Engine.SetModelValue( f90_local3, LuaUtils.SecondsToTimeRemainingString( f92_local5 + CoD.BlackMarketUtility.CooldownTimerBufferSeconds + 1, true ) )
			end
		end
	end )
	f90_arg0._bm_autoevent_timer = LUI.UITimer.new( 100, "bm_autoevents_tick", false, f90_arg0 )
	f90_arg0:addElement( f90_arg0._bm_autoevent_timer )
	LUI.OverrideFunction_CallOriginalSecond( f90_arg0, "close", function ( element )
		element._bm_autoevent_timer:close()
	end )
end

LUI.createMenu.BlackMarket = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BlackMarket" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BlackMarket.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel0:setLeftRight( true, true, 53.5, -735.5 )
	LeftPanel0:setTopBottom( true, true, 0, 46 )
	LeftPanel0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel0 )
	self.LeftPanel0 = LeftPanel0
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:setLeftRight( true, false, 0, 1280 )
	FadeForStreamer:setTopBottom( true, false, 0, 720 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BLACK_MARKET" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local verticalCounterBlackMarket = CoD.verticalCounterBlackMarket.new( self, controller )
	verticalCounterBlackMarket:setLeftRight( true, false, 198.5, 398.5 )
	verticalCounterBlackMarket:setTopBottom( true, false, 639.41, 664.41 )
	verticalCounterBlackMarket:registerEventHandler( "menu_loaded", function ( element, event )
		local f97_local0 = nil
		SetAsListVerticalCounter( self, element, "cryptokeyList" )
		if not f97_local0 then
			f97_local0 = element:dispatchEventToChildren( event )
		end
		return f97_local0
	end )
	self:addElement( verticalCounterBlackMarket )
	self.verticalCounterBlackMarket = verticalCounterBlackMarket
	
	local cryptokeyList = LUI.UIList.new( self, controller, 7, 0, nil, false, false, 0, 0, false, false )
	cryptokeyList:makeFocusable()
	cryptokeyList:setLeftRight( true, false, 66, 533 )
	cryptokeyList:setTopBottom( true, false, 151, 624 )
	cryptokeyList:setWidgetType( CoD.CryptokeyWidget )
	cryptokeyList:setHorizontalCount( 2 )
	cryptokeyList:setVerticalCount( 3 )
	cryptokeyList:setSpacing( 7 )
	cryptokeyList:setDataSource( "BlackMarketCryptokeyList" )
	cryptokeyList:registerEventHandler( "gain_focus", function ( element, event )
		local f98_local0 = nil
		if element.gainFocus then
			f98_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f98_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f98_local0
	end )
	cryptokeyList:registerEventHandler( "lose_focus", function ( element, event )
		local f99_local0 = nil
		if element.loseFocus then
			f99_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f99_local0 = element.super:loseFocus( event )
		end
		return f99_local0
	end )
	self:AddButtonCallbackFunction( cryptokeyList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsCryptokeyWidgetAvailable( self, element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsCryptokeyWidgetAvailable( self, element, controller ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( cryptokeyList )
	self.cryptokeyList = cryptokeyList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 77, 694.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local BlackMarketSafeAreaContainer = CoD.BlackMarketSafeAreaContainer.new( self, controller )
	BlackMarketSafeAreaContainer:setLeftRight( true, false, 0, 1280 )
	BlackMarketSafeAreaContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( BlackMarketSafeAreaContainer )
	self.BlackMarketSafeAreaContainer = BlackMarketSafeAreaContainer
	
	local buttonList0 = LUI.UIList.new( self, controller, 1, 0, nil, false, false, 0, 0, false, false )
	buttonList0:makeFocusable()
	buttonList0:setLeftRight( true, false, 67, 530 )
	buttonList0:setTopBottom( true, false, 104, 145 )
	buttonList0:setWidgetType( CoD.BM_TopNavBtn )
	buttonList0:setHorizontalCount( 4 )
	buttonList0:setSpacing( 1 )
	buttonList0:setDataSource( "BlackMarketList" )
	buttonList0:registerEventHandler( "gain_focus", function ( element, event )
		local f102_local0 = nil
		if element.gainFocus then
			f102_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f102_local0 = element.super:gainFocus( event )
		end
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "DefaultState" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f102_local0
	end )
	buttonList0:registerEventHandler( "lose_focus", function ( element, event )
		local f103_local0 = nil
		if element.loseFocus then
			f103_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f103_local0 = element.super:loseFocus( event )
		end
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "NotVisible" )
		return f103_local0
	end )
	self:AddButtonCallbackFunction( buttonList0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( buttonList0 )
	self.buttonList0 = buttonList0
	
	local BMPromo = CoD.BM_Promo.new( self, controller )
	BMPromo:setLeftRight( true, false, 441.5, 1459.5 )
	BMPromo:setTopBottom( true, false, 503.65, 656.65 )
	BMPromo:setScale( 0.8 )
	BMPromo:mergeStateConditions( {
		{
			stateName = "CodPoints",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Bribe",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Bundle",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	BMPromo:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		self:updateElementState( BMPromo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	BMPromo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codeBundleRareBundles" ), function ( model )
		self:updateElementState( BMPromo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codeBundleRareBundles"
		} )
	end )
	self:addElement( BMPromo )
	self.BMPromo = BMPromo
	
	cryptokeyList.navigation = {
		up = buttonList0
	}
	buttonList0.navigation = {
		down = cryptokeyList
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		local f111_local0 = self
		local f111_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		}
		CoD.Menu.UpdateButtonShownState( f111_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codeBundleRareBundles" ), function ( model )
		local f112_local0 = self
		local f112_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codeBundleRareBundles"
		}
		CoD.Menu.UpdateButtonShownState( f112_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f113_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetElementStateByElementName( self, "GenericMenuFrame", controller, "Update" )
		if not f113_local0 then
			f113_local0 = self:dispatchEventToChildren( event )
		end
		return f113_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f114_local0 = nil
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "NotVisible" )
		PlayClipOnElement( self, {
			elementName = "FEMenuLeftGraphics",
			clipName = "Intro"
		}, controller )
		OpenBlackMarketIncentivePopup( self, controller )
		OpenBlackMarketUnspentBundlePopupIfNeeded( self, controller )
		OpenBlackMarketWeaponContractErrorPopupIfNeeded( self, controller )
		OpenBlackMarketExperimentPromoPopupIfNeeded( self, controller )
		PlayMenuMusic( "black_market" )
		if not f114_local0 then
			f114_local0 = self:dispatchEventToChildren( event )
		end
		return f114_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		HandleGoBackFromBlackMarket( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "S", function ( element, menu, controller, model )
		if IsCodeBundlePromotionActive( controller ) then
			OpenStore( self, element, controller, "BlackMarket", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsCodeBundlePromotionActive( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if IsBooleanDvarSet( "ui_enablePromoMenu" ) then
			OpenOverlay( self, "winter_community_theme", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsBooleanDvarSet( "ui_enablePromoMenu" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_COMMUNITY_CHALLENGE" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendFrontendControllerZeroMenuResponse( controller, "BlackMarket", "closed" )
		CommitProfileChanges( controller )
		ForceLobbyButtonUpdate( controller )
		SendClientScriptNotify( controller, "BlackMarket", "cycle_stop" )
		ValidateMPLootWeapons( controller )
		PlayMenuMusicForCurrentLobby( "" )
	end )
	GenericMenuFrame:setModel( self.buttonModel, controller )
	cryptokeyList.id = "cryptokeyList"
	buttonList0.id = "buttonList0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.cryptokeyList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel0:close()
		element.FadeForStreamer:close()
		element.GenericMenuFrame:close()
		element.verticalCounterBlackMarket:close()
		element.cryptokeyList:close()
		element.FEMenuLeftGraphics:close()
		element.BlackMarketSafeAreaContainer:close()
		element.buttonList0:close()
		element.BMPromo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BlackMarket.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

