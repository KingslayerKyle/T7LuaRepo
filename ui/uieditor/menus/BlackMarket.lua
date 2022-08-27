-- 6815c9c1b1204d9a5e2dc24b972da4b7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.ZMHD.ZMHD_Community_Theme" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounterBlackMarket" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketSafeAreaContainer" )
require( "ui.uieditor.widgets.BlackMarket.BM_TopNavBtn" )
require( "ui.uieditor.widgets.BlackMarket.BM_Promo" )
require( "ui.uieditor.widgets.BlackMarket.BM_GunMeter" )

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
			if not IsRare20BundleActive( f9_arg0 ) then
				f9_local0 = f9_local0 + CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f9_arg0 )
			end
			if not IsRare20LDBundleActive( f9_arg0 ) then
				f9_local0 = f9_local0 + CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f9_arg0 )
			end
			return Engine.Localize( "MPUI_BM_OPEN_REMAINING_CRATES", f9_local0 )
		elseif (f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.BRIBE or f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.BUNDLE or f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE or f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 or f9_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE_20BUNDLE) and f9_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f9_arg0 ) < f9_arg1.itemCODPointCost then
			if f9_arg1.displayText == "MPUI_BM_BRIBE_3X_GESTURES_TAUNTS" then
				f9_arg1.displayText = "MPUI_BM_BRIBE_3X_GESTURES_TAUNTS_PROMO_TITLE"
			end
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
						selectIndex = f17_arg2,
						disabledAllowNav = true
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
				if not IsRare20LDBundleActive( f22_arg2 ) and CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f22_arg2 ) > 0 then
					f22_arg3.supplyDropType = CoD.BlackMarketUtility.DropTypes.RARE_20LDBUNDLE
				end
				CoD.BlackMarketUtility.TradeForCrateAction( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f16_arg1 )
			end
			
			local f16_local5 = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
				f23_arg4 = GoBack( f23_arg4, f23_arg2 )
				f23_arg3.supplyDropType = CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE
				CoD.BlackMarketUtility.TradeForCrateAction( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f16_arg1 )
			end
			
			local f16_local6 = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
				f24_arg4 = GoBack( f24_arg4, f24_arg2 )
				f24_arg3.supplyDropType = CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5
				CoD.BlackMarketUtility.TradeForCrateAction( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f16_arg1 )
			end
			
			local f16_local7 = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
				f25_arg4 = GoBack( f25_arg4, f25_arg2 )
				f25_arg3.supplyDropType = CoD.BlackMarketUtility.DropTypes.RARE_20BUNDLE
				CoD.BlackMarketUtility.TradeForCrateAction( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f16_arg1 )
			end
			
			local f16_local8 = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4 )
				f26_arg4 = GoBack( f26_arg4, f26_arg2 )
				f26_arg3.supplyDropType = CoD.BlackMarketUtility.DropTypes.RARE_20LDBUNDLE
				CoD.BlackMarketUtility.TradeForCrateAction( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f16_arg1 )
			end
			
			local f16_local9 = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4 )
				GoBack( f27_arg4, f27_arg2 )
			end
			
			if f0_local2( f15_arg1 ) then
				local f16_local10 = f16_local4
				if IsBundleActive( f16_arg0 ) and not IsHundredBundleActive( f16_arg0 ) and CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f16_arg0 ) > 0 then
					f16_local10 = f16_local5
				end
				if IsBundleActive( f16_arg0 ) and not IsRareBundle10for5Active( f16_arg0 ) and CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f16_arg0 ) > 0 then
					f16_local10 = f16_local6
				end
				if IsBundleActive( f16_arg0 ) and not IsRare20BundleActive( f16_arg0 ) and CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f16_arg0 ) > 0 then
					f16_local10 = f16_local7
				end
				if IsBundleActive( f16_arg0 ) and not IsRare20LDBundleActive( f16_arg0 ) and CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f16_arg0 ) > 0 then
					f16_local10 = f16_local8
				end
				table.insert( f16_local0, f16_local1( "MPUI_BM_OPEN_BUNDLE_NOW", f16_local10, true, false ) )
				table.insert( f16_local0, f16_local1( "MPUI_BM_OPEN_BUNDLE_LATER", f16_local9, false, false ) )
			elseif f15_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f16_arg0 ) < f15_arg1.itemCODPointCost and (f15_arg1.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f16_arg0 ) < f15_arg1.itemCost) then
				table.insert( f16_local0, f16_local1( "MPUI_PURCHASE_CODPOINTS_CAPS", f0_local0, true, false ) )
				table.insert( f16_local0, f16_local1( "MENU_CANCEL_CAPS", f16_local9, false, false ) )
			elseif f15_arg1.itemCODPointCost == 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f16_arg0 ) < f15_arg1.itemCost then
				table.insert( f16_local0, f16_local1( "MENU_CONTINUE_CAPS", f16_local9, false, false ) )
			else
				if f15_arg1.itemCost > 0 then
					table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_TRADE_CRYPTOKEYS", f15_arg1.itemCost ), f16_local2, true, CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f16_arg0 ) < f15_arg1.itemCost ) )
				end
				if f15_arg1.itemCODPointCost > 0 then
					table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_TRADE_COD_POINTS", f15_arg1.itemCODPointCost ), f16_local3, false, Engine.GetCoDPoints( f16_arg0 ) < f15_arg1.itemCODPointCost ) )
				end
				if f15_arg1.supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE then
					if not IsBundleActive( f16_arg0 ) then
						local f16_local10 = CoD.BlackMarketUtility.GetCurrentBundleCount( f16_arg0 ) + CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f16_arg0 ) + CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f16_arg0 ) + CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f16_arg0 )
						if f16_local10 > 0 then
							table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_OPEN_REMAINING_BUNDLE", f16_local10 ), f16_local4, false, false ) )
						end
					elseif not IsHundredBundleActive( f16_arg0 ) then
						local f16_local10 = CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f16_arg0 )
						if f16_local10 > 0 then
							table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_OPEN_REMAINING_BUNDLE", f16_local10 ), f16_local5, false, false ) )
						end
					elseif not IsRareBundle10for5Active( f16_arg0 ) then
						local f16_local10 = CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f16_arg0 )
						if f16_local10 > 0 then
							table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_OPEN_REMAINING_BUNDLE", f16_local10 ), f16_local6, false, false ) )
						end
					elseif not IsRare20BundleActive( f16_arg0 ) then
						local f16_local10 = CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f16_arg0 )
						if f16_local10 > 0 then
							table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_OPEN_REMAINING_BUNDLE", f16_local10 ), f16_local7, false, false ) )
						end
					elseif not IsRare20LDBundleActive( f16_arg0 ) then
						local f16_local10 = CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f16_arg0 )
						if f16_local10 > 0 then
							table.insert( f16_local0, f16_local1( Engine.Localize( "MPUI_BM_OPEN_REMAINING_BUNDLE", f16_local10 ), f16_local8, false, false ) )
						end
					end
				end
				table.insert( f16_local0, f16_local1( "MENU_CANCEL_CAPS", f16_local9, false, false ) )
			end
			return f16_local0
		end, true )
		return "PurchaseSupplyDropMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	postCreateStep = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.BRIBE then
			local f28_local0 = Dvar.loot_bribeCrate_dwid:get()
			f28_arg0:subscribeToGlobalModel( f28_arg1, "AutoeventsCycled", "cycled", function ()
				if f28_local0 ~= Dvar.loot_bribeCrate_dwid:get() or f28_local0 == 0 then
					DelayGoBack( f28_arg0, f28_arg1 )
				end
			end )
		end
		if f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE then
			local f28_local0 = IsLootSaleActive( f28_arg1 )
			f28_arg0:subscribeToGlobalModel( f28_arg1, "AutoeventsCycled", "cycled", function ()
				if f28_local0 ~= IsLootSaleActive( f28_arg1 ) then
					DelayGoBack( f28_arg0, f28_arg1 )
				end
			end )
		end
		if f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.BUNDLE then
			local f28_local0 = IsBundleActive( f28_arg1 )
			f28_arg0:subscribeToGlobalModel( f28_arg1, "AutoeventsCycled", "cycled", function ()
				if f28_local0 ~= IsBundleActive( f28_arg1 ) then
					DelayGoBack( f28_arg0, f28_arg1 )
				end
			end )
		end
		if f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE then
			local f28_local0 = IsHundredBundleActive( f28_arg1 )
			f28_arg0:subscribeToGlobalModel( f28_arg1, "AutoeventsCycled", "cycled", function ()
				if f28_local0 ~= IsHundredBundleActive( f28_arg1 ) then
					DelayGoBack( f28_arg0, f28_arg1 )
				end
			end )
		end
		if f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 then
			local f28_local0 = IsRareBundle10for5Active( f28_arg1 )
			f28_arg0:subscribeToGlobalModel( f28_arg1, "AutoeventsCycled", "cycled", function ()
				if f28_local0 ~= IsRareBundle10for5Active( f28_arg1 ) then
					DelayGoBack( f28_arg0, f28_arg1 )
				end
			end )
		end
		if f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.Rare_20Bundle then
			local f28_local0 = IsRare20BundleActive( f28_arg1 )
			f28_arg0:subscribeToGlobalModel( f28_arg1, "AutoeventsCycled", "cycled", function ()
				if startingRare20BundleState ~= IsRare20BundleActive( f28_arg1 ) then
					DelayGoBack( f28_arg0, f28_arg1 )
				end
			end )
		end
		if f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.Rare_20LDBundle then
			local f28_local0 = IsRare20LDBundleActive( f28_arg1 )
			f28_arg0:subscribeToGlobalModel( f28_arg1, "AutoeventsCycled", "cycled", function ()
				if startingRare20LDBundleState ~= IsRare20LDBundleActive( f28_arg1 ) then
					DelayGoBack( f28_arg0, f28_arg1 )
				end
			end )
		end
		if f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE or f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE then
			local f28_local0 = IsNoDupesPromoActive( f28_arg1 )
			f28_arg0:subscribeToGlobalModel( f28_arg1, "AutoeventsCycled", "cycled", function ()
				if f28_local0 ~= IsNoDupesPromoActive( f28_arg1 ) then
					DelayGoBack( f28_arg0, f28_arg1 )
				end
			end )
		end
		if f28_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.GRAND_SLAM then
			local f28_local0 = IsGrandSlamActive( f28_arg1 )
			f28_arg0:subscribeToGlobalModel( f28_arg1, "AutoeventsCycled", "cycled", function ()
				if f28_local0 ~= IsGrandSlamActive( f28_arg1 ) then
					DelayGoBack( f28_arg0, f28_arg1 )
				end
			end )
		end
	end
} )
CoD.OverlayUtility.AddSystemOverlay( "BurnDuplicatesConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_BlackMarket",
	title = function ( f38_arg0, f38_arg1 )
		if f38_arg1 == nil or f38_arg1 == -1 then
			return Engine.Localize( "MPUI_BM_BURN_CONFIRMATION_NODUPES" )
		else
			return Engine.Localize( "MPUI_BM_BURN_CONFIRMATION" )
		end
	end,
	description = function ( f39_arg0, f39_arg1 )
		if f39_arg1 == nil or f39_arg1 == -1 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_NO_DUPLICATES" )
		elseif f39_arg1 == 0 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_NONE" )
		elseif f39_arg1 == 1 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_ONE" )
		else
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_MULTIPLE", f39_arg1 )
		end
	end,
	image = "uie_t7_blackmarket_bribe",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "BurnDuplicates",
	totalDuplicates = CoD.BlackMarketUtility.GetNumDupesTotal,
	commonDuplicates = function ( f40_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f40_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON )
	end,
	rareDuplicates = function ( f41_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f41_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE )
	end,
	legendaryDuplicates = function ( f42_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f42_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY )
	end,
	epicDuplicates = function ( f43_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f43_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
	end,
	listDatasource = function ( f44_arg0 )
		DataSources.BurnDuplicatesMenuList = DataSourceHelpers.ListSetup( "BurnDuplicatesMenuList", function ( f45_arg0, f45_arg1 )
			local f45_local0 = {}
			local f45_local1 = function ( f46_arg0, f46_arg1, f46_arg2 )
				return {
					models = {
						displayText = f46_arg0
					},
					properties = {
						action = f46_arg1,
						selectIndex = f46_arg2
					}
				}
			end
			
			local f45_local2 = f45_arg1.finishedBurningDuplicates
			if not f45_local2 and CoD.BlackMarketUtility.GetNumDupesTotal( f45_arg0 ) == 0 and not f45_arg1.isBurningDuplicates then
				f45_local2 = true
			end
			if f45_local2 then
				local f45_local3 = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
					GoBack( f47_arg4, f47_arg2 )
				end
				
				local f45_local4 = {}
				return f45_local1( "MENU_OK_CAPS", f45_local3, true )
			elseif f45_arg1.isBurningDuplicates then
				return {}
			end
			local f45_local3 = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3, f48_arg4 )
				if f45_arg1.isBurningDuplicates then
					return 
				end
				local f48_local0 = Engine.GetLobbyUIScreen()
				if f48_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINE.id and f48_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and f48_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id and f48_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
					GoBack( f48_arg4, f48_arg2 )
					LuaUtils.UI_ShowErrorMessageDialog( f48_arg2, "MPUI_BM_BURN_DUPLICATES_FAILED", "" )
				end
				if Engine.BurnLootDuplicates == nil or not Engine.BurnLootDuplicates( f48_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
					GoBack( f48_arg4, f48_arg2 )
					LuaUtils.UI_ShowErrorMessageDialog( f48_arg2, "MPUI_BM_BURN_DUPLICATES_FAILED", "" )
					return 
				end
				f45_arg1.isBurningDuplicates = true
				f48_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
				f45_arg1.disabled = true
				f48_arg0:setState( "BurningDuplicates" )
				f48_arg0.BurningDuplicatesAnimation:playClip( "StartBurning" )
				f48_arg0.BurningDuplicatesAnimation.nextClip = "Burning"
				f45_arg1:updateDataSource( true )
				CoD.Menu.UpdateAllButtonPrompts( f48_arg4, f48_arg2 )
				local f48_local1 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f48_arg2 ) * CoD.BlackMarketUtility.XPPerCryptoKey + CoD.BlackMarketUtility.GetXPEarnedForBurning( f48_arg2, CoD.BlackMarketUtility.GetNumDupesForType( f48_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON ), CoD.BlackMarketUtility.GetNumDupesForType( f48_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE ), CoD.BlackMarketUtility.GetNumDupesForType( f48_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY ), CoD.BlackMarketUtility.GetNumDupesForType( f48_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC ) )
				if Dvar.ui_cryptocommondupes:exists() then
					Dvar.ui_cryptocommondupes:set( 0 )
					Dvar.ui_cryptoraredupes:set( 0 )
					Dvar.ui_cryptolegendarydupes:set( 0 )
					Dvar.ui_cryptoepicdupes:set( 0 )
				end
				Engine.PlaySound( "uin_bm_keyburn_loop" )
				CoD.OverlayUtility.UpdateBurnDupeProgress()
				f48_arg0.BurningDuplicatesAnimation:registerEventHandler( "clip_over", function ( element, event )
					local f49_local0 = Engine.GetBurnDupeState()
					if Engine.IsInventoryBusy( f48_arg2 ) or f49_local0 == Enum.LootBurnDupeState.LOOT_BURN_DUPE_REQUESTED or f49_local0 == Enum.LootBurnDupeState.LOOT_BURN_DUPE_BUSY then
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
							f45_arg1.finishedBurningDuplicates = true
							f48_arg4[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack()
							f45_arg1.disabled = false
							CoD.Menu.UpdateAllButtonPrompts( f48_arg4, f48_arg2 )
							if f49_local0 == Enum.LootBurnDupeState.LOOT_BURN_DUPE_FAILED then
								GoBack( f48_arg4, f48_arg2 )
								LuaUtils.UI_ShowErrorMessageDialog( f48_arg2, "MPUI_BM_BURN_DUPLICATES_FAILED", "" )
								return 
							end
							f48_arg0:setState( "BurnedDuplicates" )
							local f50_local0 = math.floor( f48_local1 / CoD.BlackMarketUtility.XPPerCryptoKey )
							local f50_local1 = f48_arg0.textForBurning.text
							local f50_local2 = f50_local1
							f50_local1 = f50_local1.setText
							local f50_local3 = Engine.Localize
							local f50_local4
							if f50_local0 == 1 then
								f50_local4 = "MPUI_BM_BURNED_DESC_EARNED_ONE"
								if not f50_local4 then
								
								else
									f50_local1( f50_local2, f50_local3( f50_local4, f50_local0 ) )
									f45_arg1:updateDataSource()
								end
							end
							f50_local4 = "MPUI_BM_BURNED_DESC"
						end )
					end
				end )
				SendFrontendControllerZeroMenuResponse( f48_arg2, "BlackMarket", "burn_duplicates" )
			end
			
			local f45_local4 = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3, f51_arg4 )
				if f45_arg1.isBurningDuplicates then
					return 
				else
					GoBack( f51_arg4, f51_arg2 )
				end
			end
			
			if Dvar.tu4_burnDuplicates:exists() and (Dvar.tu4_burnDuplicates:get() == true or Dvar.tu4_burnDuplicates:get() == "1") then
				table.insert( f45_local0, f45_local1( "MPUI_BURN_DUPLICATES_CAPS", f45_local3, false ) )
			end
			table.insert( f45_local0, f45_local1( "MENU_CANCEL_CAPS", f45_local4, true ) )
			return f45_local0
		end, true )
		return "BurnDuplicatesMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PurchaseTrifectaConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_BlackMarket",
	title = function ( f52_arg0, f52_arg1 )
		if (f52_arg1.itemCODPointCost == 0 or Engine.GetCoDPoints( f52_arg0 ) < f52_arg1.itemCODPointCost) and (f52_arg1.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f52_arg0 ) < f52_arg1.itemCost) then
			return "MPUI_BM_NO_CURRENCY"
		else
			return Engine.ToUpper( Engine.Localize( f52_arg1.displayText ) )
		end
	end,
	description = function ( f53_arg0, f53_arg1 )
		if f53_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f53_arg0 ) < f53_arg1.itemCODPointCost and f53_arg1.itemCost > 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f53_arg0 ) < f53_arg1.itemCost then
			return Engine.Localize( "MPUI_BM_NO_CURRENCY_DESCRIPTION", f53_arg1.displayText )
		elseif f53_arg1.itemCost == 0 and Engine.GetCoDPoints( f53_arg0 ) < f53_arg1.itemCODPointCost then
			return Engine.Localize( "MPUI_BM_TRIFECTA_NEED_CODPOINTS", f53_arg1.displayText )
		elseif f53_arg1.itemCODPointCost == 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f53_arg0 ) < f53_arg1.itemCost then
			return Engine.Localize( "MPUI_BM_TRIFECTA_NEED_CRYPTOKEYS", f53_arg1.displayText )
		elseif f53_arg1.itemCODPointCost == 0 then
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_KEYS_TEXT", f53_arg1.displayText )
		elseif f53_arg1.itemCost == 0 then
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_CODPOINTS_TEXT", f53_arg1.displayText )
		else
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_TEXT", f53_arg1.displayText )
		end
	end,
	image = "t7_blackmarket_promo_triple_play",
	cost = function ( f54_arg0, f54_arg1 )
		return f54_arg1.itemCost
	end,
	codpointcost = function ( f55_arg0, f55_arg1 )
		return f55_arg1.itemCODPointCost
	end,
	supplyDropType = CoD.BlackMarketUtility.DropTypes.TRIFECTA,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "PurchaseSupplyDrop",
	listDatasource = function ( f56_arg0, f56_arg1 )
		DataSources.PurchaseTrifectaMenuList = DataSourceHelpers.ListSetup( "PurchaseTrifectaMenuList", function ( f57_arg0, f57_arg1 )
			local f57_local0 = {}
			if f57_arg1.purchasingBundle then
				return {}
			end
			local f57_local1 = function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
				return {
					models = {
						displayText = f58_arg0,
						disabled = f58_arg3
					},
					properties = {
						action = f58_arg1,
						actionParam = f56_arg1,
						selectIndex = f58_arg2
					}
				}
			end
			
			local f57_local2 = function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3, f59_arg4 )
				local f59_local0 = Dvar.trifecta_cryptokeys_sku:get()
				if f59_local0 then
					CoD.BlackMarketUtility.TradeForTrifectaAction( f59_arg0, f59_arg1, f59_arg2, f59_arg3, f59_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_CRYPTO_KEYS, f57_arg1, f59_local0 )
				end
			end
			
			local f57_local3 = function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3, f60_arg4 )
				local f60_local0 = Dvar.trifecta_cod_points_sku:get()
				if f60_local0 then
					CoD.BlackMarketUtility.TradeForTrifectaAction( f60_arg0, f60_arg1, f60_arg2, f60_arg3, f60_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_COD_POINTS, f57_arg1, f60_local0 )
				end
			end
			
			local f57_local4 = function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3, f61_arg4 )
				GoBack( f61_arg4, f61_arg2 )
			end
			
			if f57_arg1.purchasedBundle then
				table.insert( f57_local0, f57_local1( "MENU_CONTINUE_CAPS", f57_local4, true, false ) )
				return f57_local0
			elseif f56_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f57_arg0 ) < f56_arg1.itemCODPointCost and (f56_arg1.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f57_arg0 ) < f56_arg1.itemCost) then
				table.insert( f57_local0, f57_local1( "MPUI_PURCHASE_CODPOINTS_CAPS", f0_local0, true, false ) )
				table.insert( f57_local0, f57_local1( "MENU_CANCEL_CAPS", f57_local4, false, false ) )
			elseif f56_arg1.itemCODPointCost == 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f57_arg0 ) < f56_arg1.itemCost then
				table.insert( f57_local0, f57_local1( "MENU_CONTINUE_CAPS", f57_local4, false, false ) )
			else
				if f56_arg1.itemCost > 0 then
					table.insert( f57_local0, f57_local1( Engine.Localize( "MPUI_BM_TRADE_CRYPTOKEYS", f56_arg1.itemCost ), f57_local2, true, CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f57_arg0 ) < f56_arg1.itemCost ) )
				end
				if f56_arg1.itemCODPointCost > 0 then
					table.insert( f57_local0, f57_local1( Engine.Localize( "MPUI_BM_TRADE_COD_POINTS", f56_arg1.itemCODPointCost ), f57_local3, false, Engine.GetCoDPoints( f57_arg0 ) < f56_arg1.itemCODPointCost ) )
				end
				table.insert( f57_local0, f57_local1( "MENU_CANCEL_CAPS", f57_local4, false, false ) )
			end
			return f57_local0
		end, true )
		return "PurchaseTrifectaMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	postCreateStep = function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3 )
		local f62_local0 = IsTrifectaBundleActive( f62_arg1 )
		f62_arg0:subscribeToGlobalModel( f62_arg1, "AutoeventsCycled", "cycled", function ()
			if f62_local0 ~= IsTrifectaBundleActive( f62_arg1 ) then
				DelayGoBack( f62_arg0, f62_arg1 )
			end
		end )
	end
} )
DataSources.BlackMarketCryptokeyList = DataSourceHelpers.ListSetup( "BlackMarketCryptokeyList", function ( f64_arg0, f64_arg1 )
	local f64_local0 = {}
	local f64_local1 = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
	local f64_local2 = function ()
		if f64_local1 == Enum.LUIAlignment.LUI_ALIGNMENT_LEFT then
			f64_local1 = Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
		else
			f64_local1 = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
		end
	end
	
	local f64_local3 = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4, f66_arg5, f66_arg6, f66_arg7, f66_arg8, f66_arg9, f66_arg10 )
		if f66_arg3 == "MPUI_BM_RARE_KEY_HINT_TEXT" and Dvar.tu4_enableBonusCryptokeysHint:exists() and Dvar.tu4_enableBonusCryptokeysHint:get() == false then
			f66_arg3 = "MPUI_BM_RARE_KEY_HINT_TEXT_NOBONUS"
		end
		if not f66_arg8 then
			f66_arg8 = 1
		end
		local f66_local0 = f64_local1
		if f66_arg8 > 1 then
			f66_local0 = Enum.LUIAlignment.LUI_ALIGNMENT_CENTER
		else
			f64_local2()
		end
		return {
			models = {
				displayText = f66_arg0,
				displayTextTitle = f66_arg9 or f66_arg0,
				image = f66_arg1,
				hintText = f66_arg3,
				itemCount = f66_arg4,
				itemCODPointCost = f66_arg5,
				rewardCount = f66_arg10,
				hintTextAlign = f66_local0
			},
			properties = {
				action = f66_arg6,
				supplyDropType = f66_arg7,
				actionParam = {
					displayText = f66_arg0,
					image = f66_arg2,
					itemCost = f66_arg4,
					itemCODPointCost = f66_arg5,
					supplyDropType = f66_arg7
				},
				columnSpan = f66_arg8
			}
		}
	end
	
	local f64_local4 = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
		CoD.OverlayUtility.CreateOverlay( f67_arg2, f67_arg0, "PurchaseSupplyDropConfirmation", f67_arg2, f67_arg3 )
	end
	
	local f64_local5 = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4 )
		f68_arg3.vials = tonumber( Dvar.loot_vialsFromKeysOffer:get() )
		f68_arg3.isCryptokeys = true
		f68_arg3.cryptokeyCost = f68_arg3.itemCost
		CoD.OverlayUtility.CreateOverlay( f68_arg2, f68_arg0, "PurchaseVialsConfirmation", f68_arg2, f68_arg3 )
	end
	
	local f64_local6 = function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4 )
		CoD.BlackMarketUtility.TradeForCrateAction( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f64_local0 )
	end
	
	local f64_local7 = function ( f70_arg0, f70_arg1, f70_arg2, f70_arg3, f70_arg4 )
		OpenOutfitStore( f70_arg0, f70_arg1, f70_arg2, "BlackMarket", f70_arg4, nil )
	end
	
	local f64_local8 = function ( f71_arg0, f71_arg1, f71_arg2, f71_arg3, f71_arg4 )
		CoD.OverlayUtility.CreateOverlay( f71_arg2, f71_arg0, "PurchaseTrifectaConfirmation", f71_arg2, f71_arg3 )
	end
	
	local f64_local9 = function ( f72_arg0, f72_arg1, f72_arg2, f72_arg3, f72_arg4 )
		if not IsSixPackBundleInCooldown( f72_arg2 ) then
			f64_local4( f72_arg0, f72_arg1, f72_arg2, f72_arg3, f72_arg4 )
		end
	end
	
	local f64_local10 = function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3, f73_arg4 )
		if not IsDailyDoubleBundleInCooldown( f73_arg2 ) then
			f64_local4( f73_arg0, f73_arg1, f73_arg2, f73_arg3, f73_arg4 )
		end
	end
	
	if IsTrifectaBundleActive( f64_arg0 ) then
		local f64_local11 = 0
		local f64_local12 = 0
		if Dvar.trifecta_cryptokeys_drop_id:exists() and Engine.GetInventoryItemQuantity( f64_arg0, Dvar.trifecta_cryptokeys_drop_id:get() ) == 0 then
			f64_local11 = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.TRIFECTA )
		end
		if Dvar.trifecta_cod_points_drop_id:exists() and Engine.GetInventoryItemQuantity( f64_arg0, Dvar.trifecta_cod_points_drop_id:get() ) == 0 then
			f64_local12 = CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.TRIFECTA )
		end
		if f64_local11 > 0 or f64_local12 > 0 then
			table.insert( f64_local0, f64_local3( "MPUI_BM_TRIFECTA", "t7_blackmarket_promo_triple_play", "t7_blackmarket_promo_triple_play", "MPUI_BM_TRIFECTA_KEY_HINT_TEXT", f64_local11, f64_local12, f64_local8, CoD.BlackMarketUtility.DropTypes.TRIFECTA, 2, "MPUI_BM_TRIFECTA_PACKAGE_DESC" ) )
		end
	end
	if CoD.BlackMarketUtility.GetCurrentBribeString() ~= nil then
		local f64_local11 = CoD.BlackMarketUtility.GetCurrentBribeString()
		local f64_local12 = CoD.BlackMarketUtility.GetCurrentBribeImage()
		table.insert( f64_local0, f64_local3( f64_local11, f64_local12, f64_local12 .. "_hover", CoD.BlackMarketUtility.GetCurrentBribeHint(), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BRIBE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.BRIBE ), f64_local4, CoD.BlackMarketUtility.DropTypes.BRIBE, 2 ) )
	end
	if IsGrandSlamActive( f64_arg0 ) then
		local f64_local11 = 0
		local f64_local12 = 0
		if Engine.GetInventoryItemQuantity( f64_arg0, CoD.BlackMarketUtility.loot_grand_slam_drop_id ) == 0 then
			f64_local12 = CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.GRAND_SLAM ) or 0
		end
		if f64_local11 > 0 or f64_local12 > 0 then
			table.insert( f64_local0, f64_local3( "MPUI_BM_GRAND_SLAM", "t7_blackmarket_crate_bribe_grandslam_large", "t7_blackmarket_crate_bribe_grandslam_large", "MPUI_BM_GRAND_SLAM_KEY_HINT_TEXT", f64_local11, f64_local12, f64_local4, CoD.BlackMarketUtility.DropTypes.GRAND_SLAM, 2, "MPUI_BM_GRAND_SLAM_PACKAGE_DESC" ) )
		end
	end
	if IsHundredBundleActive( f64_arg0 ) then
		local f64_local11 = CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f64_arg0 )
		local f64_local12 = CoD.BlackMarketUtility.HundredBundleImage
		if f64_local11 > 0 then
			table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.HundredBundleTitle, f64_local12, f64_local12 .. "_glow", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f64_local11 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE, 2 ) )
		else
			table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.HundredBundleTitle, f64_local12, f64_local12 .. "_glow", Engine.Localize( CoD.BlackMarketUtility.HundredBundleHint, Engine.DvarInt( nil, "loot_rare100_cpcost" ) ), 0, CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE ), f64_local4, CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE, 2, "MPUI_BM_HUNDRED_BUNDLE_PROMO_DESC" ) )
		end
		f64_arg1.currentHundredBundleCount = f64_local11
		if not f64_arg1.updateHundredBundleSubscription then
			f64_arg1.updateHundredBundleSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "hundredBundles" ), function ()
				if CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f64_arg0 ) ~= f64_arg1.currentHundredBundleCount then
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsRareBundle10for5Active( f64_arg0 ) then
		local f64_local11 = CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f64_arg0 )
		local f64_local12 = CoD.BlackMarketUtility.RareBundle10for5Image
		if f64_local11 > 0 then
			table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.RareBundle10for5Title, f64_local12, f64_local12 .. "_glow", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f64_local11 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5, 2 ) )
		else
			table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.RareBundle10for5Title, f64_local12, f64_local12 .. "_glow", Engine.Localize( CoD.BlackMarketUtility.RareBundle10for5Hint, Engine.DvarInt( nil, "rare_bundle_10for5_cpCost" ) ), 0, CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 ), f64_local4, CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5, 2, "MPUI_BM_RARE_BUNDLE_10FOR5_PROMO_DESC" ) )
		end
		f64_arg1.currentRareBundle10for5Count = f64_local11
		if not f64_arg1.updateRareBundle10for5Subscription then
			f64_arg1.updateRareBundle10for5Subscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "rareBundle10for5s" ), function ()
				if CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f64_arg0 ) ~= f64_arg1.currentRareBundle10for5Count then
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsRare20BundleActive( f64_arg0 ) then
		local f64_local11 = CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f64_arg0 )
		local f64_local12 = CoD.BlackMarketUtility.BundleImage
		if f64_local11 > 0 then
			table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.BundleTitle, f64_local12, f64_local12 .. "_glow", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f64_local11 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.RARE_20BUNDLE, 2 ) )
		else
			table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.BundleTitle, f64_local12, f64_local12 .. "_glow", Engine.Localize( CoD.BlackMarketUtility.BundleHint, 20, Engine.DvarInt( nil, "loot_bundle_cpCost" ) ), 0, Engine.DvarInt( nil, "loot_bundle_cpCost" ), f64_local4, CoD.BlackMarketUtility.DropTypes.RARE_20BUNDLE, 2, Engine.Localize( CoD.BlackMarketUtility.PromoBundleDesc, 20 ) ) )
		end
		f64_arg1.currentRare20BundleCount = f64_local11
		if not f64_arg1.updateRare20BundleSubscription then
			f64_arg1.updateRare20BundleSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "rare20Bundles" ), function ()
				if CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f64_arg0 ) ~= f64_arg1.currentRare20BundleCount then
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsRare20LDBundleActive( f64_arg0 ) then
		local f64_local11 = CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f64_arg0 )
		local f64_local12 = CoD.BlackMarketUtility.BundleImage
		if f64_local11 > 0 then
			table.insert( f64_local0, f64_local3( "MPUI_BM_BRIBE_LDBUNDLE_BRIBE_TITLE", f64_local12, f64_local12 .. "_glow", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f64_local11 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.RARE_20LDBUNDLE, 2 ) )
		elseif Engine.GetInventoryItemQuantity( f64_arg0, CoD.BlackMarketUtility.rare20LDPackBundleSentinel ) == 0 then
			table.insert( f64_local0, f64_local3( "MPUI_BM_BRIBE_LDBUNDLE_BRIBE_TITLE", f64_local12, f64_local12 .. "_glow", "MPUI_BM_BRIBE_LDBUNDLE_BRIBE_HINT", 0, Engine.DvarInt( nil, "loot_bundle_cpCost" ), f64_local4, CoD.BlackMarketUtility.DropTypes.RARE_20LDBUNDLE, 2, "MPUI_BM_BRIBE_LDBUNDLE_BRIBE_DESC" ) )
		end
		f64_arg1.currentRare20LDBundleCount = f64_local11
		if not f64_arg1.updateRare20LDBundleSubscription then
			f64_arg1.updateRare20LDBundleSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "rare20LDBundles" ), function ()
				if CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f64_arg0 ) ~= f64_arg1.currentRare20LDBundleCount then
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsRare15BundleActive( f64_arg0 ) then
		local f64_local11 = CoD.BlackMarketUtility.GetCurrentOutfit3BundleCount( f64_arg0 )
		local f64_local12 = CoD.BlackMarketUtility.GetCurrentRare15BundleCount( f64_arg0 )
		local f64_local13 = CoD.BlackMarketUtility.BundleImage
		if f64_local12 == 0 and f64_local11 == 0 then
			table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.BundleAndBribeTitle, f64_local13, f64_local13 .. "_glow", Engine.Localize( CoD.BlackMarketUtility.BundleAndBribeHint, 15, 3, Engine.DvarInt( nil, "loot_bundle_cpCost" ) ), 0, Engine.DvarInt( nil, "loot_bundle_cpCost" ), f64_local4, CoD.BlackMarketUtility.DropTypes.RARE_15BUNDLE, 2, Engine.Localize( CoD.BlackMarketUtility.BundleAndBribeDesc, 15, 3 ) ) )
			f64_arg1.currentRare15BundleCount = f64_local12
			if not f64_arg1.updateRare15BundleSubscription then
				f64_arg1.updateRare15BundleSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "rare15Bundles" ), function ()
					if CoD.BlackMarketUtility.GetCurrentRare15BundleCount( f64_arg0 ) ~= f64_arg1.currentRare15BundleCount then
						f64_arg1:updateDataSource( false )
					end
				end, false )
			end
			f64_arg1.currentOutfit3BundleCount = f64_local11
			if not f64_arg1.updateOutfit3BundleSubscription then
				f64_arg1.updateOutfit3BundleSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "outfit3Bundles" ), function ()
					if CoD.BlackMarketUtility.GetCurrentOutfit3BundleCount( f64_arg0 ) ~= f64_arg1.currentOutfit3BundleCount then
						f64_arg1:updateDataSource( false )
					end
				end, false )
			end
		end
	end
	if Dvar.show_bm_outfit_widget:exists() and Dvar.show_bm_outfit_widget:get() == "1" then
		local f64_local11 = "uie_t7_blackmarket_crate_bribe_chip"
		table.insert( f64_local0, f64_local3( "MPUI_BM_OUTFIT_STORE_TITLE", f64_local11, f64_local11 .. "_glow", Engine.Localize( "MPUI_BM_OUTFIT_STORE_HINT" ), 0, 0, f64_local7, CoD.BlackMarketUtility.DropTypes.OUTFIT_STORE, 2, "MPUI_BM_OUTFIT_STORE_TITLE" ) )
	end
	if IsBundleActive( f64_arg0 ) then
		local f64_local11 = CoD.BlackMarketUtility.GetCurrentBundleCount( f64_arg0 )
		local f64_local12 = CoD.BlackMarketUtility.BundleImage
		if f64_local11 > 0 then
			table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.BundleTitle, f64_local12, f64_local12 .. "_glow", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f64_local11, Engine.DvarInt( nil, "loot_bundle_final_count" ) ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.RARE, 2 ) )
		else
			table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.BundleTitle, f64_local12, f64_local12 .. "_glow", Engine.Localize( CoD.BlackMarketUtility.BundleHint, Engine.DvarInt( nil, "loot_bundle_final_count" ), Engine.DvarInt( nil, "loot_bundle_cpCost" ) ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BUNDLE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.BUNDLE ), f64_local4, CoD.BlackMarketUtility.DropTypes.BUNDLE, 2, Engine.Localize( CoD.BlackMarketUtility.PromoBundleDesc, Engine.DvarInt( nil, "loot_bundle_final_count" ) ) ) )
		end
		f64_arg1.currentBundleCount = f64_local11
		if not f64_arg1.updateBundlesSubscription then
			f64_arg1.updateBundlesSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "bundles" ), function ()
				if CoD.BlackMarketUtility.GetCurrentBundleCount( f64_arg0 ) ~= f64_arg1.currentBundleCount then
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsKeysForVialsOfferActive( f64_arg0 ) then
		local f64_local11 = "t7_blackmarket_divinium_chip"
		local f64_local12 = "t7_blackmarket_divinium_chip"
		local f64_local13 = tonumber( Dvar.loot_vialsCost:get() or 60 )
		local f64_local14 = 0
		local f64_local15 = tonumber( Dvar.loot_vialsFromKeysOffer:get() )
		table.insert( f64_local0, f64_local3( Engine.Localize( "MPUI_BM_OFFER_DIVINIUM", f64_local15 ), f64_local11, f64_local12, Engine.Localize( "MPUI_BM_OFFER_DIVINIUM_HINT", f64_local13, f64_local15 ), f64_local13, f64_local14, f64_local5, CoD.BlackMarketUtility.DropTypes.TRADE_KEYS_FOR_VIALS, 2 ) )
	end
	local f64_local11 = nil
	if IsLootSaleActive( f64_arg0 ) then
		table.insert( f64_local0, f64_local3( "MPUI_BM_RARE_DROP", "uie_t7_blackmarket_crate_rare_focus", "uie_t7_blackmarket_crate_rare_focus", DvarLocalizedIntoStringMultiplied( "loot_salePercentOff", 100, "MPUI_BM_RARE_DROP_PROMO_HINT" ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.RARE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.RARE ), f64_local4, CoD.BlackMarketUtility.DropTypes.RARE, 2, "MPUI_BM_RARE_DROP_PROMO_DESC" ) )
	end
	local f64_local12 = #f64_local0 < 2
	local f64_local13 = f64_local3( "MPUI_BM_COMMON_DROP", "t7_blackmarket_crate_common", "uie_t7_blackmarket_crate_common_focus", "MPUI_BM_COMMON_KEY_HINT_TEXT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.COMMON ), f64_local4, CoD.BlackMarketUtility.DropTypes.COMMON )
	table.insert( f64_local0, f64_local13 )
	if not IsLootSaleActive( f64_arg0 ) then
		f64_local11 = f64_local3( "MPUI_BM_RARE_DROP", "t7_blackmarket_crate_rare", "uie_t7_blackmarket_crate_rare_focus", "MPUI_BM_RARE_KEY_HINT_TEXT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.RARE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.RARE ), f64_local4, CoD.BlackMarketUtility.DropTypes.RARE )
		table.insert( f64_local0, f64_local11 )
	end
	if IsSixPackBundleActive( f64_arg0 ) then
		local f64_local14 = CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f64_arg0 )
		if f64_local14 > 0 then
			table.insert( f64_local0, f64_local3( "MPUI_BM_SIX_PACK", "uie_t7_blackmarket_6pack_commons_closed", "uie_t7_blackmarket_6pack_commons_closed", Engine.Localize( "MPUI_BM_SIX_PACK_BUNDLES_REMAINING", f64_local14 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.SIX_PACK ) )
		else
			table.insert( f64_local0, f64_local3( "MPUI_BM_SIX_PACK", "uie_t7_blackmarket_6pack_commons_closed", "uie_t7_blackmarket_6pack_commons_closed", Engine.Localize( "MPUI_BM_SIX_PACK_PROMO_HINT", Engine.DvarInt( nil, "loot_sixPack_final_count" ) ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.SIX_PACK ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.SIX_PACK ), f64_local9, CoD.BlackMarketUtility.DropTypes.SIX_PACK ) )
		end
		f64_local12 = false
		f64_arg1.currentSixPackCommonBundleCount = f64_local14
		if not f64_arg1.updateSixPackCommonSubscription then
			f64_arg1.updateSixPackCommonSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "sixPackCommonBundles" ), function ()
				local f81_local0 = CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f64_arg0 )
				if f81_local0 ~= f64_arg1.currentSixPackCommonBundleCount then
					f64_arg1.currentSixPackCommonBundleCount = f81_local0
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsDailyDoubleBundleActive( f64_arg0 ) then
		local f64_local14 = CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f64_arg0 )
		if f64_local14 > 0 then
			table.insert( f64_local0, f64_local3( "MPUI_BM_DAILY_DOUBLE", "uie_t7_blackmarket_dailydouble", "uie_t7_blackmarket_dailydouble", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f64_local14 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE_RARE_BUNDLE ) )
		else
			table.insert( f64_local0, f64_local3( "MPUI_BM_DAILY_DOUBLE", "uie_t7_blackmarket_dailydouble", "uie_t7_blackmarket_dailydouble", Engine.Localize( "MPUI_BM_DAILY_DOUBLE_PROMO_HINT", Engine.DvarInt( nil, "loot_dailyDouble_final_count" ) ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE ), f64_local10, CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE ) )
		end
		f64_local12 = false
		f64_arg1.currentDailyDoubleRareBundleCount = f64_local14
		if not f64_arg1.updateDailyDoubleRareSubscription then
			f64_arg1.updateDailyDoubleRareSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "dailyDoubleRareBundles" ), function ()
				local f82_local0 = CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f64_arg0 )
				if f82_local0 ~= f64_arg1.currentDailyDoubleRareBundleCount then
					f64_arg1.currentDailyDoubleRareBundleCount = f82_local0
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	local f64_local14 = CoD.BlackMarketUtility.GetCurrentRare15BundleCount( f64_arg0 )
	if f64_local14 > 0 then
		local f64_local15 = CoD.BlackMarketUtility.BundleImage
		table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.BundleTitle, f64_local15, f64_local15 .. "_glow", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f64_local14 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.RARE_15BUNDLE ) )
		f64_arg1.currentRare15BundleCount = f64_local14
		if not f64_arg1.updateRare15BundleSubscription then
			f64_arg1.updateRare15BundleSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "rare15Bundles" ), function ()
				if CoD.BlackMarketUtility.GetCurrentRare15BundleCount( f64_arg0 ) ~= f64_arg1.currentRare15BundleCount then
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	local f64_local15 = CoD.BlackMarketUtility.GetCurrentOutfit3BundleCount( f64_arg0 )
	if f64_local15 > 0 then
		local f64_local16 = CoD.BlackMarketUtility.BundleImage
		table.insert( f64_local0, f64_local3( "MPUI_BM_BRIBE_OUTFIT_TRIPLE", f64_local16, f64_local16 .. "_glow", Engine.Localize( "MPUI_BM_OUTFIT_BRIBES_REMAINING", f64_local15 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.OUTFIT_3BUNDLE ) )
		f64_arg1.currentOutfit3BundleCount = f64_local15
		if not f64_arg1.updateOutfit3BundleSubscription then
			f64_arg1.updateOutfit3BundleSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "outfit3Bundles" ), function ()
				if CoD.BlackMarketUtility.GetCurrentOutfit3BundleCount( f64_arg0 ) ~= f64_arg1.currentOutfit3BundleCount then
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if HasWeapon3XBundles( f64_arg0 ) then
		local f64_local16 = CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f64_arg0 )
		table.insert( f64_local0, f64_local3( "MPUI_BM_WEAPON_3X", "t7_blackmarket_bribe_gold_bribe_3_weapons", "t7_blackmarket_bribe_gold_bribe_3_weapons", "MPUI_BM_WEAPON_3X_HINT", 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.WEAPON_3X ) )
		f64_local12 = false
		f64_arg1.currentWeapon3XBundleCount = f64_local16
		if not f64_arg1.updateWeapon3XSubscription then
			f64_arg1.updateWeapon3XSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "weapon3XBundles" ), function ()
				local f85_local0 = CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f64_arg0 )
				if f85_local0 ~= f64_arg1.currentWeapon3XBundleCount then
					f64_arg1.currentWeapon3XBundleCount = f85_local0
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if HasLimitedEditionCamoBundles( f64_arg0 ) then
		local f64_local16 = CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f64_arg0 )
		table.insert( f64_local0, f64_local3( "MPUI_BM_LIMITED_CAMO_BUNDLE", "t7_blackmarket_bribe_gold_bribe_camo", "t7_blackmarket_bribe_gold_bribe_camo", "MPUI_BM_LIMITED_CAMO_BUNDLE_HINT", 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO ) )
		f64_local12 = false
		f64_arg1.currentlimitedEditionCamoBundleCount = f64_local16
		if not f64_arg1.updateLimitedEditionCamoSubscription then
			f64_arg1.updateLimitedEditionCamoSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "limitedEditionCamoBundles" ), function ()
				local f86_local0 = CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f64_arg0 )
				if f86_local0 ~= f64_arg1.currentlimitedEditionCamoBundleCount then
					f64_arg1.currentlimitedEditionCamoBundleCount = f86_local0
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsNoDupesCrateActive( f64_arg0 ) then
		table.insert( f64_local0, f64_local3( "MPUI_BM_NO_DUPES_CRATE", "uie_t7_blackmarket_crate_rare_focus", "uie_t7_blackmarket_crate_rare_focus", "MPUI_BM_NO_DUPES_CRATE_HINT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE ) or 0, CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE ) or 0, f64_local4, CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE, 1, "MPUI_BM_RARE_DROP" ) )
	end
	if IsNoDupesBundleActive( f64_arg0 ) then
		local f64_local16 = CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f64_arg0 )
		if f64_local16 > 0 then
			table.insert( f64_local0, f64_local3( "MPUI_BM_NO_DUPES_BUNDLE_TITLE", "uie_t7_blackmarket_crate_bundle_10", "uie_t7_blackmarket_crate_bundle_10", "MPUI_BM_NO_DUPES_CRATE_HINT", 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE, 1, "MPUI_BM_NO_DUPES_BUNDLE" ) )
		else
			table.insert( f64_local0, f64_local3( "MPUI_BM_NO_DUPES_BUNDLE_TITLE", "uie_t7_blackmarket_crate_bundle_10", "uie_t7_blackmarket_crate_bundle_10", Engine.Localize( "MPUI_BM_NO_DUPES_BUNDLE_HINT", 20 ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE ) or 0, CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE ) or 0, f64_local4, CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE, 1, "MPUI_BM_NO_DUPES_BUNDLE" ) )
		end
		f64_local12 = false
		f64_arg1.currentNoDupesRareBundleCount = f64_local16
		if not f64_arg1.updateNoDupesRareSubscription then
			f64_arg1.updateNoDupesRareSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "noDupesRareBundles" ), function ()
				local f87_local0 = CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f64_arg0 )
				if f87_local0 ~= f64_arg1.currentNoDupesRareBundleCount then
					f64_arg1.currentNoDupesRareBundleCount = f87_local0
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if IsBundleExperimentActive( f64_arg0 ) then
		local f64_local16 = CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f64_arg0 )
		local f64_local17 = Engine.Localize( "MPUI_BM_BUNDLE_EXPERIMENT", Engine.Localize( Engine.DvarString( nil, "loot_3pack_final_count_string_ref" ) ) )
		if f64_local16 > 0 then
			table.insert( f64_local0, f64_local3( f64_local17, "uie_t7_blackmarket_crate_bundle", "uie_t7_blackmarket_crate_bundle", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", f64_local16 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT ) )
		else
			table.insert( f64_local0, f64_local3( f64_local17, "uie_t7_blackmarket_crate_bundle", "uie_t7_blackmarket_crate_bundle", Engine.Localize( "MPUI_BM_BUNDLE_EXPERIMENT_HINT", Engine.DvarInt( nil, "loot_3pack_final_count" ) ), CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT ), f64_local4, CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT ) )
		end
		f64_local12 = false
		f64_arg1.currentBundleExperimentRareBundleCount = f64_local16
		if not f64_arg1.updateBundleExperimentRareSubscription then
			f64_arg1.updateBundleExperimentRareSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "bundleExperimentRareBundles" ), function ()
				local f88_local0 = CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f64_arg0 )
				if f88_local0 ~= f64_arg1.currentBundleExperimentRareBundleCount then
					f64_arg1.currentBundleExperimentRareBundleCount = f88_local0
					f64_arg1:updateDataSource( false )
				end
			end, false )
		end
	end
	if HasCodeBundles( f64_arg0 ) then
		table.insert( f64_local0, f64_local3( "MPUI_BM_CODE_BUNDLE", "uie_t7_blackmarket_crate_bundle", "uie_t7_blackmarket_crate_bundle", Engine.Localize( "MPUI_BM_BUNDLES_REMAINING", CoD.BlackMarketUtility.GetCurrentCodeBundleRareBundleCount( f64_arg0 ) ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.CODE_BUNDLE ) )
		f64_local12 = false
	end
	f64_arg1.currentCodeBundleRareBundleCount = currentCodeBundleRareBundleCount
	if not f64_arg1.updateCodeBundleRareBundles then
		f64_arg1.updateCodeBundleRareBundles = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "codeBundleRareBundles" ), function ()
			local f89_local0 = CoD.BlackMarketUtility.GetCurrentCodeBundleRareBundleCount( f64_arg0 )
			if f89_local0 ~= f64_arg1.currentCodeBundleRareBundleCount then
				f64_arg1.currentCodeBundleRareBundleCount = f89_local0
				f64_arg1:updateDataSource( false )
			end
		end, false )
	end
	local f64_local16 = CoD.BlackMarketUtility.GetCurrentIncentiveRareBundleCount( f64_arg0 )
	if f64_local16 > 0 then
		local f64_local17 = "blacktransparent"
		table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.IncentiveRareBundleTitle, f64_local17, f64_local17, Engine.Localize( CoD.BlackMarketUtility.IncentiveRareBundleHint, f64_local16 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.INCENTIVE_RARE_BUNDLE ) )
		f64_local12 = false
	end
	f64_arg1.currentIncentiveRareBundleCount = f64_local16
	if not f64_arg1.updateIncentiveRareSubscription then
		f64_arg1.updateIncentiveRareSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "incentiveRareBundles" ), function ()
			if CoD.BlackMarketUtility.GetCurrentIncentiveRareBundleCount( f64_arg0 ) ~= f64_arg1.currentIncentiveRareBundleCount then
				f64_arg1:updateDataSource( false )
			end
		end, false )
	end
	local f64_local17 = CoD.BlackMarketUtility.GetCurrentIncentiveWeaponBundleCount( f64_arg0 )
	if f64_local17 > 0 then
		local f64_local18 = "blacktransparent"
		table.insert( f64_local0, f64_local3( CoD.BlackMarketUtility.IncentiveWeaponBundleTitle, f64_local18, f64_local18, Engine.Localize( CoD.BlackMarketUtility.IncentiveWeaponBundleHint, f64_local17 ), 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.INCENTIVE_WEAPON_BUNDLE ) )
		f64_local12 = false
	end
	f64_arg1.currentIncentiveWeaponBundleCount = f64_local17
	if not f64_arg1.updateIncentiveWeaponSubscription then
		f64_arg1.updateIncentiveWeaponSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "incentiveWeaponBundles" ), function ()
			if CoD.BlackMarketUtility.GetCurrentIncentiveWeaponBundleCount( f64_arg0 ) ~= f64_arg1.currentIncentiveWeaponBundleCount then
				f64_arg1:updateDataSource( false )
			end
		end, false )
	end
	local f64_local18 = CoD.BlackMarketUtility.GetCurrentNoDupeRangeBundleCount( f64_arg0 )
	if f64_local18 > 0 then
		table.insert( f64_local0, f64_local3( "MPUI_BM_BRIBE_RANGE_WEAPON", "t7_blackmarket_bribe_weapon", "t7_blackmarket_bribe_weapon", "MPUI_BM_BRIBE_RANGE_WEAPON_KEY_HINT_TEXT", 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE, 1, "", f64_local18 ) )
		f64_local12 = false
	end
	f64_arg1.currentRangeWeaponNoDupesBundleCount = f64_local18
	if not f64_arg1.updateRangeWeaponNoDupesSubscription then
		f64_arg1.updateRangeWeaponNoDupesSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "rangeWeaponNoDupesBundles" ), function ()
			if CoD.BlackMarketUtility.GetCurrentNoDupeRangeBundleCount( f64_arg0 ) ~= f64_arg1.currentRangeWeaponNoDupesBundleCount then
				f64_arg1:updateDataSource( false )
			end
		end, false )
	end
	local f64_local19 = CoD.BlackMarketUtility.GetCurrentNoDupeMeleeBundleCount( f64_arg0 )
	if f64_local19 > 0 then
		table.insert( f64_local0, f64_local3( "MPUI_BM_BRIBE_MELEE_WEAPON", "t7_blackmarket_bribe_melee", "t7_blackmarket_bribe_melee", "MPUI_BM_BRIBE_MELEE_WEAPON_KEY_HINT_TEXT", 0, 0, f64_local6, CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE, 1, "", f64_local19 ) )
		f64_local12 = false
	end
	f64_arg1.currentMeleeWeaponNoDupesBundleCount = f64_local19
	if not f64_arg1.updateMeleeWeaponNoDupesSubscription then
		f64_arg1.updateMeleeWeaponNoDupesSubscription = f64_arg1:subscribeToModel( Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f64_arg0 ), "meleeWeaponNoDupesBundles" ), function ()
			if CoD.BlackMarketUtility.GetCurrentNoDupeMeleeBundleCount( f64_arg0 ) ~= f64_arg1.currentMeleeWeaponNoDupesBundleCount then
				f64_arg1:updateDataSource( false )
			end
		end, false )
	end
	f64_local13.models.useTallVersion = f64_local12
	f64_local11.models.useTallVersion = f64_local12
	return f64_local0
end, true )
DataSources.BlackMarketCryptokeyList.getWidgetTypeForItem = function ( f94_arg0, f94_arg1, f94_arg2, f94_arg3 )
	if f94_arg0.BlackMarketCryptokeyList[f94_arg3].properties then
		if f94_arg0.BlackMarketCryptokeyList[f94_arg3].properties.isBribeCoin then
			return CoD.BribeCoinWidget
		else
			return CoD.CryptokeyWidget
		end
	else
		return nil
	end
end

DataSources.BlackMarketList = DataSourceHelpers.ListSetup( "BlackMarketList", function ( f95_arg0 )
	local f95_local0 = {}
	local f95_local1 = function ( f96_arg0, f96_arg1, f96_arg2, f96_arg3, f96_arg4, f96_arg5 )
		return {
			models = {
				displayText = f96_arg0,
				image = f96_arg2,
				disabled = f96_arg3,
				showBreadcrumb = f96_arg5
			},
			properties = {
				action = f96_arg1,
				selectIndex = f96_arg4
			}
		}
	end
	
	local f95_local2 = function ( f97_arg0, f97_arg1, f97_arg2, f97_arg3, f97_arg4 )
		local f97_local0 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f97_arg2 )
		local f97_local1 = CoD.BlackMarketUtility.GetNumDupesForType( f97_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON )
		local f97_local2 = CoD.BlackMarketUtility.GetNumDupesForType( f97_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE )
		local f97_local3 = CoD.BlackMarketUtility.GetNumDupesForType( f97_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY )
		local f97_local4 = CoD.BlackMarketUtility.GetNumDupesForType( f97_arg2, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
		local f97_local5 = CoD.BlackMarketUtility.GetNumKeysEarnedForBurning( f97_arg2, f97_local1, f97_local2, f97_local3, f97_local4 )
		if f97_local1 + f97_local2 + f97_local3 + f97_local4 == 0 then
			f97_local5 = -1
		end
		CoD.OverlayUtility.CreateOverlay( f97_arg2, f97_arg0, "BurnDuplicatesConfirmation", f97_arg2, f97_local5, f97_local1, f97_local2, f97_local3, f97_local4 )
	end
	
	local f95_local3 = function ( f98_arg0, f98_arg1, f98_arg2, f98_arg3, f98_arg4 )
		OpenOverlay( f98_arg4, "BM_History", f98_arg2 )
	end
	
	local f95_local4 = function ( f99_arg0, f99_arg1, f99_arg2, f99_arg3, f99_arg4 )
		CycleContracts( f99_arg2 )
		OpenOverlay( f99_arg4, "BM_Contracts", f99_arg2 )
		local f99_local0 = f99_arg1:getModel( f99_arg2, "showBreadcrumb" )
		if f99_local0 then
			Engine.SetModelValue( f99_local0, false )
		end
	end
	
	local f95_local5 = false
	if Dvar.tu4_enableCodPoints:get() then
		table.insert( f95_local0, f95_local1( "MPUI_BM_BUY", f0_local1, "uie_ui_codpoints_symbol_32x32", f95_local5, true ) )
	end
	if Dvar.show_contracts_button:get() then
		local f95_local6 = Engine.StorageGetBuffer( f95_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		table.insert( f95_local0, f95_local1( "MPUI_BM_CONTRACTS", f95_local4, "uie_ui_codpoints_symbol_32x32", nil, nil, IsCommunityContractBreadCrumbActive( f95_arg0 ) or f95_local6 and f95_local6.ui_seen_new_contracts:get() == 0 or IsTrifectaContractBreadcrumbActive( f95_arg0 ) ) )
	end
	local f95_local6 = Engine.GetLootItemCount( f95_arg0, Enum.eModes.MODE_MULTIPLAYER )
	if f95_local6 ~= nil and f95_local6 > 0 then
		table.insert( f95_local0, f95_local1( "MPUI_BM_RECENT", f95_local3, "uie_ui_codpoints_symbol_32x32" ) )
	end
	if Dvar.tu4_burnDuplicates:get() then
		table.insert( f95_local0, f95_local1( "MPUI_BM_DUPLICATES", f95_local2, "uie_ui_codpoints_symbol_32x32" ) )
	end
	return f95_local0
end, true )
local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GameSettingsFlyoutOpen" ), false )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "targetController" ), controller )
	Engine.SetDvar( "live_autoEventPumpTime", 0 )
end

local PostLoadFunc = function ( f101_arg0, f101_arg1 )
	f101_arg0.disablePopupOpenCloseAnim = true
	if CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f101_arg1 ) >= CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON ) then
		SendFrontendControllerZeroMenuResponse( f101_arg1, "BlackMarket", "greeting" )
	else
		SendFrontendControllerZeroMenuResponse( f101_arg1, "BlackMarket", "greeting_broke" )
	end
	local f101_local0 = CoD.GetPlayerStats( f101_arg1 )
	if f101_local0 then
		f101_local0.blackMarketShowBreadcrumb:set( 0 )
		f101_local0.extraBytes[0]:set( CoD.BlackMarketUtility.CurrentPromotionIndex )
	end
	local f101_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "cycled" )
	local f101_local2 = Engine.CreateModel( Engine.GetModelForController( f101_arg1 ), "six_pack_timer" )
	local f101_local3 = Engine.CreateModel( Engine.GetModelForController( f101_arg1 ), "daily_double_timer" )
	f101_arg0:subscribeToModel( f101_local1, function ( model )
		f101_arg0.cryptokeyList:updateDataSource( false )
	end, false )
	local f101_local4 = IsSixPackBundleInCooldown( f101_arg1 )
	local f101_local5 = IsDailyDoubleBundleInCooldown( f101_arg1 )
	f101_arg0:registerEventHandler( "bm_autoevents_tick", function ( element, event )
		Engine.SetDvar( "live_autoEventPumpTime", 0 )
		local f103_local0 = IsSixPackBundleInCooldown( f101_arg1 )
		local f103_local1 = IsDailyDoubleBundleInCooldown( f101_arg1 )
		if f101_local4 ~= f103_local0 or f101_local5 ~= f103_local1 then
			f101_local4 = f103_local0
			f101_local5 = f103_local1
			Engine.ForceNotifyModelSubscriptions( f101_local1 )
		end
		local f103_local2 = Engine.GetServerUTCTimeStr()
		local f103_local3 = false
		local f103_local4 = Engine.StorageGetBuffer( f101_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f103_local4 then
			local f103_local5 = tonumber( Engine.StringIntegerSubtraction( Engine.StringIntegerAddition( f103_local4.playerstatslist.ARENA_MAX_RANK.statvalue:getAsString(), Engine.DvarInt( nil, "loot_sixPack_cooloffSeconds" ) ), f103_local2 ) )
			if f103_local5 >= 0 then
				Engine.SetModelValue( f101_local2, LuaUtils.SecondsToTimeRemainingString( f103_local5 + 1, true ) )
				f103_local3 = true
			end
		end
		if not f103_local3 then
			local f103_local6 = Engine.GetInventoryItem( f101_arg1, Engine.DvarInt( nil, "loot_sixPack_consumable_id" ) )
			if f103_local6 then
				local f103_local5 = tonumber( Engine.StringIntegerSubtraction( f103_local6.expireTimeStr, f103_local2 ) )
				if f103_local5 >= -CoD.BlackMarketUtility.CooldownTimerBufferSeconds then
					Engine.SetModelValue( f101_local2, LuaUtils.SecondsToTimeRemainingString( f103_local5 + CoD.BlackMarketUtility.CooldownTimerBufferSeconds + 1, true ) )
				end
			end
		end
		local f103_local6 = Engine.GetInventoryItem( f101_arg1, Engine.DvarInt( nil, "loot_dailyDouble_consumable_id" ) )
		if f103_local6 then
			local f103_local5 = tonumber( Engine.StringIntegerSubtraction( f103_local6.expireTimeStr, f103_local2 ) )
			if f103_local5 >= -CoD.BlackMarketUtility.CooldownTimerBufferSeconds then
				Engine.SetModelValue( f101_local3, LuaUtils.SecondsToTimeRemainingString( f103_local5 + CoD.BlackMarketUtility.CooldownTimerBufferSeconds + 1, true ) )
			end
		end
	end )
	f101_arg0._bm_autoevent_timer = LUI.UITimer.new( 100, "bm_autoevents_tick", false, f101_arg0 )
	f101_arg0:addElement( f101_arg0._bm_autoevent_timer )
	LUI.OverrideFunction_CallOriginalSecond( f101_arg0, "close", function ( element )
		element._bm_autoevent_timer:close()
	end )
	if Dvar.tu27_showGunMeter:get() then
		f101_arg0.BMGunMeter0:setAlpha( 1 )
	end
	local f101_local6 = Engine.StorageGetBuffer( f101_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f101_local6.contracts[LuaUtils.BMContracts.specialContractIndex].index:get() == 3014 and f101_local6.contracts[LuaUtils.BMContracts.specialContractIndex].award_given:get() == 1 and Engine.GetInventoryItemQuantity( f101_arg1, 99104 ) == 0 then
		Engine.PurchaseDWSKU( f101_arg1, 99106 )
	end
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
	local f105_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel0 = CoD.FE_ButtonPanelShaderContainer.new( f105_local1, controller )
	LeftPanel0:setLeftRight( true, true, 53.5, -735.5 )
	LeftPanel0:setTopBottom( true, true, 0, 46 )
	LeftPanel0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel0 )
	self.LeftPanel0 = LeftPanel0
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f105_local1, controller )
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
		f105_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f105_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f105_local1, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BLACK_MARKET" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local verticalCounterBlackMarket = CoD.verticalCounterBlackMarket.new( f105_local1, controller )
	verticalCounterBlackMarket:setLeftRight( true, false, 198.5, 398.5 )
	verticalCounterBlackMarket:setTopBottom( true, false, 639.41, 664.41 )
	verticalCounterBlackMarket:registerEventHandler( "menu_loaded", function ( element, event )
		local f108_local0 = nil
		SetAsListVerticalCounter( self, element, "cryptokeyList" )
		if not f108_local0 then
			f108_local0 = element:dispatchEventToChildren( event )
		end
		return f108_local0
	end )
	self:addElement( verticalCounterBlackMarket )
	self.verticalCounterBlackMarket = verticalCounterBlackMarket
	
	local cryptokeyList = LUI.UIList.new( f105_local1, controller, 7, 0, nil, false, false, 0, 0, false, false )
	cryptokeyList:makeFocusable()
	cryptokeyList:setLeftRight( true, false, 66, 533 )
	cryptokeyList:setTopBottom( true, false, 151, 624 )
	cryptokeyList:setWidgetType( CoD.CryptokeyWidget )
	cryptokeyList:setHorizontalCount( 2 )
	cryptokeyList:setVerticalCount( 3 )
	cryptokeyList:setSpacing( 7 )
	cryptokeyList:setDataSource( "BlackMarketCryptokeyList" )
	cryptokeyList:registerEventHandler( "gain_focus", function ( element, event )
		local f109_local0 = nil
		if element.gainFocus then
			f109_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f109_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f105_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f109_local0
	end )
	cryptokeyList:registerEventHandler( "lose_focus", function ( element, event )
		local f110_local0 = nil
		if element.loseFocus then
			f110_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f110_local0 = element.super:loseFocus( event )
		end
		return f110_local0
	end )
	f105_local1:AddButtonCallbackFunction( cryptokeyList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f111_arg0, f111_arg1, f111_arg2, f111_arg3 )
		if IsElementInState( f111_arg0, "OutfitShop" ) then
			ProcessListAction( self, f111_arg0, f111_arg2 )
			return true
		elseif IsCryptokeyWidgetAvailable( self, f111_arg0, f111_arg2 ) then
			ProcessListAction( self, f111_arg0, f111_arg2 )
			return true
		else
			
		end
	end, function ( f112_arg0, f112_arg1, f112_arg2 )
		if IsElementInState( f112_arg0, "OutfitShop" ) then
			CoD.Menu.SetButtonLabel( f112_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_GO_TO_STORE" )
			return true
		elseif IsCryptokeyWidgetAvailable( self, f112_arg0, f112_arg2 ) then
			CoD.Menu.SetButtonLabel( f112_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( cryptokeyList )
	self.cryptokeyList = cryptokeyList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f105_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 77, 694.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local BlackMarketSafeAreaContainer = CoD.BlackMarketSafeAreaContainer.new( f105_local1, controller )
	BlackMarketSafeAreaContainer:setLeftRight( true, false, 0, 1280 )
	BlackMarketSafeAreaContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( BlackMarketSafeAreaContainer )
	self.BlackMarketSafeAreaContainer = BlackMarketSafeAreaContainer
	
	local buttonList0 = LUI.UIList.new( f105_local1, controller, 1, 0, nil, false, false, 0, 0, false, false )
	buttonList0:makeFocusable()
	buttonList0:setLeftRight( true, false, 67, 530 )
	buttonList0:setTopBottom( true, false, 104, 145 )
	buttonList0:setWidgetType( CoD.BM_TopNavBtn )
	buttonList0:setHorizontalCount( 4 )
	buttonList0:setSpacing( 1 )
	buttonList0:setDataSource( "BlackMarketList" )
	buttonList0:registerEventHandler( "gain_focus", function ( element, event )
		local f113_local0 = nil
		if element.gainFocus then
			f113_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f113_local0 = element.super:gainFocus( event )
		end
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "DefaultState" )
		CoD.Menu.UpdateButtonShownState( element, f105_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f113_local0
	end )
	buttonList0:registerEventHandler( "lose_focus", function ( element, event )
		local f114_local0 = nil
		if element.loseFocus then
			f114_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f114_local0 = element.super:loseFocus( event )
		end
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "NotVisible" )
		return f114_local0
	end )
	f105_local1:AddButtonCallbackFunction( buttonList0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f115_arg0, f115_arg1, f115_arg2, f115_arg3 )
		ProcessListAction( self, f115_arg0, f115_arg2 )
		return true
	end, function ( f116_arg0, f116_arg1, f116_arg2 )
		CoD.Menu.SetButtonLabel( f116_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( buttonList0 )
	self.buttonList0 = buttonList0
	
	local BMPromo = CoD.BM_Promo.new( f105_local1, controller )
	BMPromo:setLeftRight( true, false, 440.5, 1458.5 )
	BMPromo:setTopBottom( true, false, 498.91, 651.91 )
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
		f105_local1:updateElementState( BMPromo, {
			name = "model_validation",
			menu = f105_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	BMPromo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codeBundleRareBundles" ), function ( model )
		f105_local1:updateElementState( BMPromo, {
			name = "model_validation",
			menu = f105_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codeBundleRareBundles"
		} )
	end )
	self:addElement( BMPromo )
	self.BMPromo = BMPromo
	
	local BMGunMeter0 = CoD.BM_GunMeter.new( f105_local1, controller )
	BMGunMeter0:setLeftRight( true, false, 482, 832 )
	BMGunMeter0:setTopBottom( true, false, 94.5, 195.5 )
	BMGunMeter0:setAlpha( 0 )
	BMGunMeter0:setScale( 0.6 )
	self:addElement( BMGunMeter0 )
	self.BMGunMeter0 = BMGunMeter0
	
	cryptokeyList.navigation = {
		up = buttonList0
	}
	buttonList0.navigation = {
		down = cryptokeyList
	}
	CoD.Menu.AddNavigationHandler( f105_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f122_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f105_local1, true )
		SetElementStateByElementName( self, "GenericMenuFrame", controller, "Update" )
		if not f122_local0 then
			f122_local0 = element:dispatchEventToChildren( event )
		end
		return f122_local0
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f123_local0 = nil
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "NotVisible" )
		PlayClipOnElement( self, {
			elementName = "FEMenuLeftGraphics",
			clipName = "Intro"
		}, controller )
		OpenBlackMarketIncentivePopup( self, controller )
		OpenBlackMarketUnspentBundlePopupIfNeeded( f105_local1, controller )
		OpenBlackMarketWeaponContractErrorPopupIfNeeded( f105_local1, controller )
		OpenBlackMarketExperimentPromoPopupIfNeeded( f105_local1, controller )
		PlayMenuMusic( "black_market" )
		if not f123_local0 then
			f123_local0 = element:dispatchEventToChildren( event )
		end
		return f123_local0
	end )
	f105_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f124_arg0, f124_arg1, f124_arg2, f124_arg3 )
		SendClientScriptMenuChangeNotify( f124_arg2, f124_arg1, false )
		GoBack( self, f124_arg2 )
		ClearMenuSavedState( f124_arg1 )
		HandleGoBackFromBlackMarket( self, f124_arg0, f124_arg2, "", f124_arg1 )
		return true
	end, function ( f125_arg0, f125_arg1, f125_arg2 )
		CoD.Menu.SetButtonLabel( f125_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f105_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f126_arg0, f126_arg1, f126_arg2, f126_arg3 )
		if IsBooleanDvarSet( "ui_enablePromoMenu" ) then
			OpenOverlay( self, "ZMHD_Community_Theme", f126_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f127_arg0, f127_arg1, f127_arg2 )
		if IsBooleanDvarSet( "ui_enablePromoMenu" ) then
			CoD.Menu.SetButtonLabel( f127_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_COMMUNITY_CHALLENGE" )
			return true
		else
			return false
		end
	end, false )
	f105_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "S", function ( f128_arg0, f128_arg1, f128_arg2, f128_arg3 )
		OpenOutfitStore( self, f128_arg0, f128_arg2, "BlackMarket", f128_arg1 )
		return true
	end, function ( f129_arg0, f129_arg1, f129_arg2 )
		CoD.Menu.SetButtonLabel( f129_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_VIEW_STORE_OUTFITS" )
		return true
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
		menu = f105_local1
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
		element.BMGunMeter0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BlackMarket.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

