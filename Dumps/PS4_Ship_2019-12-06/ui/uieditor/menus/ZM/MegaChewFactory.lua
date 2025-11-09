require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewMachine" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactoryVat" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactoryBottomLeftLabel" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactoryBuyDivinium" )

CoD.OverlayUtility.GetVialsImage = function ( f1_arg0 )
	local f1_local0 = "uie_t7_zm_icon_liquiddivinium_x3"
	if f1_arg0 == 9 then
		f1_local0 = "uie_t7_zm_icon_liquiddivinium_x9"
	elseif f1_arg0 > 9 and f1_arg0 < 100 then
		f1_local0 = "uie_t7_zm_icon_liquiddivinium_x20"
	elseif f1_arg0 >= 100 then
		f1_local0 = "uie_t7_zm_icon_liquiddivinium_x100"
	end
	return f1_local0
end

CoD.OverlayUtility.AddSystemOverlay( "NotEnoughVials", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_MegaChew",
	title = function ( f2_arg0, f2_arg1 )
		return Engine.Localize( "MENU_NOT_ENOUGH_DIVINIUM_CAPS" )
	end,
	description = function ( f3_arg0, f3_arg1 )
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_INSUFFICIENT_FUNDS" )
	end,
	image = function ( f4_arg0, f4_arg1 )
		return f4_arg1.image or "t7_hud_zm_vial_256"
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f5_arg0, f5_arg1 )
		DataSources.NotEnoughVialsList = DataSourceHelpers.ListSetup( "NotEnoughVialsList", function ( f6_arg0 )
			local f6_local0 = {}
			local f6_local1 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
				return {
					models = {
						displayText = f7_arg0,
						disabled = false
					},
					properties = {
						action = f7_arg1,
						actionParam = {},
						selectIndex = f7_arg2,
						showStoreButton = f7_arg3
					}
				}
			end
			
			local f6_local2 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
				local f8_local0 = GoBack( f8_arg4, f8_arg2 )
				f8_arg3.NotEnoughVials = true
				CoD.OverlayUtility.CreateOverlay( f8_arg2, f8_local0, "PurchaseVials", f8_arg2, f8_arg3 )
			end
			
			local f6_local3 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
				GoBack( f9_arg4, f9_arg2 )
			end
			
			if AreCodPointsEnabled( f6_arg0 ) then
				table.insert( f6_local0, f6_local1( "MENU_TRADE_FOR_DIVINIUM_CAPS", f6_local2, false, false ) )
			end
			table.insert( f6_local0, f6_local1( "MENU_OK", f6_local3, true, false ) )
			return f6_local0
		end, true )
		return "NotEnoughVialsList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.Overlays.PurchaseVials = {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_MegaChew",
	title = function ( f10_arg0, f10_arg1 )
		if IsUltraRareMegaGobblegumPromoActive( f10_arg0 ) then
			return "ZMUI_MEGACHEW_STORE_TITLE"
		else
			return "ZMUI_MEGACHEW_VIAL"
		end
	end,
	description = function ( f11_arg0, f11_arg1 )
		if IsUltraRareMegaGobblegumPromoActive( f11_arg0 ) then
			return "ZMUI_MEGACHEW_STORE_DESC"
		else
			return IsKeysForVialsOfferActive( f11_arg0 ) and "MPUI_BM_SPEND_FOR_VIALS" or "ZMUI_TRADE_CODPOINTS_FOR_VIALS_DESC"
		end
	end,
	image = function ( f12_arg0, f12_arg1 )
		return f12_arg1.image
	end,
	supportText = function ( f13_arg0, f13_arg1 )
		if f13_arg1.isFirstTime then
			return "ZMUI_URM_FIRST_TIME_PURCHASE_DESC"
		else
			return "ZMUI_URM_PURCHASE_DESC"
		end
	end,
	cost = function ( f14_arg0, f14_arg1 )
		return f14_arg1.itemCost
	end,
	vials = function ( f15_arg0, f15_arg1 )
		return 0
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "HorizontalList",
	listDatasource = function ( f16_arg0, f16_arg1 )
		DataSources.PurchaseVialsList = DataSourceHelpers.ListSetup( "PurchaseVialsList", function ( f17_arg0 )
			local f17_local0 = {}
			local f17_local1 = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4, f18_arg5, f18_arg6, f18_arg7, f18_arg8, f18_arg9 )
				local f18_local0 = f18_arg9 or CoD.OverlayUtility.GetVialsImage( f18_arg3 )
				local f18_local1 = {}
				local f18_local2 = {}
				local f18_local3
				if f18_arg3 and f18_arg3 > 0 then
					f18_local3 = Engine.Localize( f18_arg0, f18_arg4, f18_arg3 )
					if not f18_local3 then
					
					else
						f18_local2.displayText = f18_local3
						f18_local2.vials = f18_arg3
						f18_local2.itemCODPointCost = f18_arg4
						f18_local2.itemCost = f18_arg6
						f18_local2.itemCount = f18_arg6
						f18_local2.image = f18_local0
						f18_local2.disabled = false
						f18_local2.showRibbon = f18_arg7
						f18_local2.ribbonText = f18_arg8 or ""
						f18_local1.models = f18_local2
						f18_local1.properties = {
							action = f18_arg1,
							actionParam = {
								vials = f18_arg3,
								cost = f18_arg4,
								cryptokeyCost = f18_arg6
							},
							selectIndex = f18_arg2,
							showStoreButton = f18_arg5
						}
						return f18_local1
					end
				end
				f18_local3 = f18_arg0
			end
			
			local f17_local2 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
				local f19_local0 = GoBack( f19_arg4, f19_arg2 )
				f19_arg3.image = CoD.OverlayUtility.GetVialsImage( f19_arg3.vials )
				if Engine.GetCoDPoints( f19_arg2 ) < f19_arg3.cost and f19_arg3.cryptokeyCost == nil then
					if CoD.NotEnoughLD then
						f19_arg3.NotEnoughVials = true
					end
					CoD.OverlayUtility.CreateOverlay( f19_arg2, f19_local0, "GoToStoreConfirmation", f19_arg2, f19_arg3 )
				else
					CoD.OverlayUtility.CreateOverlay( f19_arg2, f19_local0, "PurchaseVialsConfirmation", f19_arg2, f19_arg3 )
				end
			end
			
			local f17_local3 = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
				local f20_local0 = GoBack( f20_arg4, f20_arg2 )
				f20_arg3.image = "uie_t7_zm_icon_ggtilepromo_5x"
				f20_arg3.skuId = Engine.DvarInt( nil, "loot_ld_urm_purchase_sku" )
				f20_arg3.isURM = true
				if Engine.GetCoDPoints( f20_arg2 ) < f20_arg3.cost and f20_arg3.cryptokeyCost == nil then
					CoD.OverlayUtility.CreateOverlay( f20_arg2, f20_local0, "GoToStoreConfirmation", f20_arg2, f20_arg3 )
				else
					CoD.OverlayUtility.CreateOverlay( f20_arg2, f20_local0, "UltraRareMegaPurchaseOverlay", f20_arg2, f20_arg3 )
				end
			end
			
			local f17_local4 = function ( f21_arg0, f21_arg1 )
				local f21_local0 = Engine.DvarInt( nil, f21_arg1 )
				if f21_local0 ~= 0 then
					local f21_local1 = f21_local0
				end
				return f21_local1 or f21_arg0
			end
			
			table.insert( f17_local0, f17_local1( "ZMUI_PURCHASE_VIALS", f17_local2, true, 3, f17_local4( 200, "loot_ld_x3_cpCost" ), true, nil, false ) )
			table.insert( f17_local0, f17_local1( "ZMUI_PURCHASE_VIALS", f17_local2, false, 9, f17_local4( 600, "loot_ld_x9_cpCost" ), true, nil, false ) )
			table.insert( f17_local0, f17_local1( "ZMUI_PURCHASE_VIALS", f17_local2, false, 20, f17_local4( 1000, "loot_ld_x20_cpCost" ), true, nil, not IsLiquidDiviniumSaleActive( f17_arg0 ), "MENU_25PERCENTOFF" ) )
			if IsKeysForVialsOfferActive( f17_arg0 ) then
				table.insert( f17_local0, f17_local1( "ZMUI_PURCHASE_VIALS", f17_local2, false, tonumber( Dvar.loot_vialsFromKeysOffer:get() ), 0, true, tonumber( Dvar.loot_vialsCost:get() ) ) )
			end
			if IsLiquidDiviniumMegaBundleActive( f17_arg0 ) then
				table.insert( f17_local0, f17_local1( "ZMUI_PURCHASE_VIALS", f17_local2, false, 100, f17_local4( 2000, "loot_ld_mega_bundle_cpCost" ), true, nil, true, "ZMUI_MEGA_BUNDLE" ) )
			end
			if IsUltraRareMegaGobblegumPromoActive( f17_arg0 ) then
				table.insert( f17_local0, f17_local1( "ZMUI_URM_PURCHASE_DESC", f17_local3, false, 0, f17_local4( 2500, "loot_ld_urm_gobblegum_cpCost" ), true, nil, false, "", "uie_t7_zm_icon_ggtilepromo_5x" ) )
			end
			return f17_local0
		end, true )
		return "PurchaseVialsList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	postCreateStep = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		local f22_local0 = IsLiquidDiviniumSaleActive( f22_arg1 )
		local f22_local1 = IsLiquidDiviniumMegaBundleActive( f22_arg1 )
		local f22_local2 = IsUltraRareMegaGobblegumPromoActive( f22_arg1 )
		if f22_arg3 and f22_arg3.NotEnoughVials then
			CoD.NotEnoughLD = true
		end
		f22_arg0:subscribeToGlobalModel( f22_arg1, "AutoeventsCycled", "cycled", function ()
			if f22_local0 ~= IsLiquidDiviniumSaleActive( f22_arg1 ) or f22_local1 ~= IsLiquidDiviniumMegaBundleActive( f22_arg1 ) or f22_local2 ~= IsUltraRareMegaGobblegumPromoActive( f22_arg1 ) then
				DelayGoBack( f22_arg0, f22_arg1 )
			end
		end )
	end
}
CoD.OverlayUtility.AddSystemOverlay( "GoToStoreConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_MegaChew",
	title = "MPUI_BM_NO_CURRENCY",
	description = function ( f24_arg0, f24_arg1 )
		if f24_arg1.isURM then
			return "ZMUI_URM_NOT_ENOUGH_COD_POINTS"
		else
			return "ZMUI_NOT_ENOUGH_COD_POINTS_TO_TRADE"
		end
	end,
	image = function ( f25_arg0, f25_arg1 )
		return f25_arg1.image
	end,
	supportText = function ( f26_arg0, f26_arg1 )
		if f26_arg1.isFirstTime then
			return "ZMUI_URM_FIRST_TIME_PURCHASE_DESC"
		else
			return "ZMUI_URM_PURCHASE_DESC"
		end
	end,
	cost = function ( f27_arg0, f27_arg1 )
		return f27_arg1.itemCost
	end,
	vials = function ( f28_arg0, f28_arg1 )
		return f28_arg1.vials
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f29_arg0, f29_arg1 )
		DataSources.GoToStoreConfirmationList = DataSourceHelpers.ListSetup( "GoToStoreConfirmationList", function ( f30_arg0 )
			local f30_local0 = {}
			local f30_local1 = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4, f31_arg5 )
				return {
					models = {
						displayText = f31_arg0,
						disabled = false
					},
					properties = {
						action = f31_arg1,
						selectIndex = f31_arg2
					}
				}
			end
			
			local f30_local2 = function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3, f32_arg4 )
				local f32_local0 = GoBack( f32_arg4, f32_arg2 )
				OpenSystemOverlay( f32_arg0, f32_local0, f32_arg2, "PurchaseVials", "" )
				MegaChewOpenCodPointsStore( f32_arg0, f32_arg1, f32_arg2, "PurchaseVials", f32_local0 )
			end
			
			local f30_local3 = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4 )
				GoBack( f33_arg4, f33_arg2 )
			end
			
			table.insert( f30_local0, f30_local1( "MPUI_PURCHASE_CODPOINTS_CAPS", f30_local2, true, 3, 200, true ) )
			table.insert( f30_local0, f30_local1( "MENU_CANCEL_CAPS", f30_local3, false ) )
			return f30_local0
		end, true )
		return "GoToStoreConfirmationList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = function ()
		return function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
			OpenSystemOverlay( f35_arg0, GoBack( f35_arg3, f35_arg2 ), f35_arg2, "PurchaseVials", "" )
		end
		
	end,
	postCreateStep = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		local f36_local0 = IsUltraRareMegaGobblegumPromoActive( f36_arg1 )
		if f36_arg3 and f36_arg3.NotEnoughVials then
			CoD.NotEnoughLD = true
		end
		f36_arg0:subscribeToGlobalModel( f36_arg1, "AutoeventsCycled", "cycled", function ()
			if f36_local0 ~= IsUltraRareMegaGobblegumPromoActive( f36_arg1 ) then
				DelayGoBack( f36_arg0, f36_arg1 )
			end
		end )
	end
} )
CoD.OverlayUtility.Overlays.PurchaseVialsConfirmation = {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_MegaChew",
	title = function ( f38_arg0, f38_arg1 )
		if f38_arg1.cryptokeyCost and not IsModelValueGreaterThanOrEqualTo( f38_arg0, "CryptoKeyProgress.keyCount", f38_arg1.cryptokeyCost ) then
			return "MPUI_BM_NO_CURRENCY"
		else
			return "ZMUI_CONFIRM_TRADE_CAPS"
		end
	end,
	description = function ( f39_arg0, f39_arg1 )
		if f39_arg1.cryptokeyCost then
			if IsModelValueGreaterThanOrEqualTo( f39_arg0, "CryptoKeyProgress.keyCount", f39_arg1.cryptokeyCost ) then
				return Engine.Localize( "MPUI_BM_SPEND_KEYS_FOR_VIALS" )
			else
				return Engine.Localize( "MPUI_BM_NOT_ENOUGH_CRYPTOKEYS" )
			end
		else
			return Engine.Localize( "ZMUI_TRADE_CONFIRMATION_DESC", f39_arg1.vials )
		end
	end,
	image = function ( f40_arg0, f40_arg1 )
		return f40_arg1.image
	end,
	cost = function ( f41_arg0, f41_arg1 )
		return f41_arg1.itemCost
	end,
	vials = function ( f42_arg0, f42_arg1 )
		return f42_arg1.vials
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "PurchaseSupplyDrop",
	listDatasource = function ( f43_arg0, f43_arg1 )
		DataSources.PurchaseVialsConfirmationList = DataSourceHelpers.ListSetup( "PurchaseVialsConfirmationList", function ( f44_arg0, f44_arg1 )
			local f44_local0 = {}
			if f44_arg1.purchasingVials then
				return {}
			end
			local f44_local1 = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4, f45_arg5, f45_arg6, f45_arg7 )
				local f45_local0 = {}
				local f45_local1 = {}
				local f45_local2
				if f45_arg5 then
					f45_local2 = Engine.Localize( f45_arg0, f45_arg5 )
					if not f45_local2 then
					
					else
						f45_local1.displayText = f45_local2
						f45_local1.vials = f45_arg4
						f45_local1.disabled = f45_arg3
						f45_local0.models = f45_local1
						f45_local0.properties = {
							action = f45_arg1,
							actionParam = {
								vials = f45_arg4,
								cost = f45_arg5,
								isCryptokeys = f45_arg7
							},
							selectIndex = f45_arg2,
							showStoreButton = f45_arg6
						}
						return f45_local0
					end
				end
				f45_local2 = f45_arg0
			end
			
			local f44_local2 = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3, f46_arg4 )
				local f46_local0 = 0
				if f46_arg3.isCryptokeys then
					f46_local0 = tonumber( Dvar.zm_vials_keys_id:get() )
				elseif f46_arg3.vials == 3 then
					f46_local0 = Dvar.zm_vials_3_id:get()
				elseif f46_arg3.vials == 6 then
					f46_local0 = Dvar.zm_vials_6_id:get()
				elseif f46_arg3.vials == 9 then
					f46_local0 = Dvar.zm_vials_9_id:get()
				elseif f46_arg3.vials == 20 then
					f46_local0 = Dvar.zm_vials_20_id:get()
				elseif f46_arg3.vials == 100 then
					f46_local0 = Engine.DvarInt( nil, "zm_vials_100_id" )
				end
				if f46_local0 == 0 or not Engine.PurchaseDWSKU( f46_arg2, f46_local0, false ) then
					LuaUtils.UI_ShowErrorMessageDialog( f46_arg2, "MPUI_BM_VIALS_PURCHASE_FAILED", "" )
					GoBack( f46_arg4, f46_arg2 )
					return 
				else
					f46_arg0:setState( "Purchasing" )
					f46_arg0.ZMDiviniumAnimFill:playClip( "Start" )
					f46_arg0.ZMDiviniumAnimFill.nextClip = "Loop"
					f44_arg1.purchasingVials = true
					f46_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
					f44_arg1.disabled = true
					f44_arg1:updateDataSource( true )
					f46_arg0.optionsHorizontal.disabled = true
					f46_arg0.optionsHorizontal.purchasingVials = true
					f46_arg0.optionsHorizontal:updateDataSource( true )
					CoD.Menu.UpdateAllButtonPrompts( f46_arg4, f46_arg2 )
					f46_arg0.ZMDiviniumAnimFill:registerEventHandler( "clip_over", function ( element, event )
						if Engine.IsInventoryBusy( f46_arg2 ) or Engine.GetPurchaseDWSKUResult( f46_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
							LUI.UIElement.clipOver( element, event )
						else
							element:playClip( "Stop" )
							element:registerEventHandler( "clip_over", function ( element, event )
								element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
								f46_arg0:setState( "DefaultState" )
								if Engine.GetPurchaseDWSKUResult( f46_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
									GoBack( f46_arg4, f46_arg2 )
								else
									LuaUtils.UI_ShowErrorMessageDialog( f46_arg2, "MPUI_BM_VIALS_PURCHASE_FAILED", "" )
									GoBack( f46_arg4, f46_arg2 )
								end
							end )
						end
					end )
				end
			end
			
			local f44_local3 = function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3, f49_arg4 )
				GoBack( f49_arg4, f49_arg2 )
			end
			
			if f43_arg1.cryptokeyCost then
				if IsModelValueGreaterThanOrEqualTo( f44_arg0, "CryptoKeyProgress.keyCount", f43_arg1.cryptokeyCost ) then
					table.insert( f44_local0, f44_local1( "MPUI_BM_TRADE_CRYPTOKEYS", f44_local2, true, false, f43_arg1.vials, f43_arg1.cryptokeyCost, false, true ) )
				end
			else
				table.insert( f44_local0, f44_local1( "ZMUI_PURCHASE_VIALS", f44_local2, true, false, f43_arg1.vials, f43_arg1.cost, false ) )
			end
			table.insert( f44_local0, f44_local1( "MENU_CANCEL_CAPS", f44_local3, false, false, false ) )
			return f44_local0
		end, true )
		return "PurchaseVialsConfirmationList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = function ()
		return function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
			local f51_local0 = GoBack( f51_arg3, f51_arg2 )
			if f51_local0.id ~= "Menu.BlackMarket" and not Engine.IsInventoryBusy( f51_arg2 ) and Engine.GetPurchaseDWSKUResult( f51_arg2 ) ~= Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
				CoD.OverlayUtility.CreateOverlay( f51_arg2, f51_local0, "PurchaseVials", f51_arg2, {} )
			end
		end
		
	end,
	postCreateStep = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
		local f52_local0 = IsLiquidDiviniumSaleActive( f52_arg1 )
		local f52_local1 = IsLiquidDiviniumMegaBundleActive( f52_arg1 )
		f52_arg0:subscribeToGlobalModel( f52_arg1, "AutoeventsCycled", "cycled", function ()
			if f52_local0 ~= IsLiquidDiviniumSaleActive( f52_arg1 ) or f52_local1 ~= IsLiquidDiviniumMegaBundleActive( f52_arg1 ) then
				DelayGoBack( f52_arg0, f52_arg1 )
			end
		end )
	end
}
CoD.OverlayUtility.AddSystemOverlay( "MegaChewFactoryWelcomePopup", {
	menuName = "SystemOverlay_Full",
	title = "MENU_BGB_FACTORY_WELCOME",
	description = "MENU_BGB_FACTORY_WELCOME_DESC",
	image = "t7_menu_zm_bubblegum_overlay",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f54_arg0, f54_arg1 )
		DataSources.MegaChewFactoryWelcomePopupList = DataSourceHelpers.ListSetup( "MegaChewFactoryWelcomePopupList", function ( f55_arg0 )
			local f55_local0 = {}
			local f55_local1 = function ( f56_arg0, f56_arg1, f56_arg2 )
				return {
					models = {
						displayText = f56_arg0,
						disabled = false
					},
					properties = {
						action = f56_arg1,
						selectIndex = f56_arg2
					}
				}
			end
			
			table.insert( f55_local0, f55_local1( "MENU_GOT_IT", function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg4 )
				SetSeenMegaChewFactoryFirstTimePopup( f57_arg2 )
				GoBack( f57_arg4, f57_arg2 )
				SetControllerModelValue( f57_arg2, "OpenBlackMarketIncentivesPopup", true )
			end, true ) )
			return f55_local0
		end, true )
		return "MegaChewFactoryWelcomePopupList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = function ()
		return function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3 )
			local f59_local0 = GoBack( f59_arg3, f59_arg2 )
		end
		
	end
} )
local PreLoadFunc = function ( self, controller )
	local f60_local0 = Engine.GetModelForController( controller )
	local f60_local1 = Engine.CreateModel( f60_local0, "MegaChewFactory" )
	Engine.SetModelValue( Engine.CreateModel( f60_local1, "getResultsOrKeepWaiting" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f60_local1, "disableInput" ), 0 )
	local f60_local2 = Engine.CreateModel( f60_local0, "OpenBlackMarketIncentivesPopup" )
	Engine.SetDvar( "live_autoEventPumpTime", 0 )
end

local f0_local1 = function ( f61_arg0 )
	if f61_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE_INSUFFICIENT_FUNDS then
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_INSUFFICIENT_FUNDS" )
	elseif f61_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE_BAD_RESPONE then
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_BAD_RESPONSE" )
	elseif f61_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE or f61_arg0 == Enum.LootResultType.LOOT_RESULT_INVALID then
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_BAD_RESPONSE" )
	else
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_BAD_RESPONSE" )
	end
end

local f0_local2 = function ( f62_arg0, f62_arg1 )
	if not CoD.perController[f62_arg0].MegaChewFactory_PendingLootRewardTask then
		return 
	end
	local f62_local0 = CoD.perController[f62_arg0].MegaChewFactory_PendingLootRewardTask
	if f62_arg1 then
		LUI.CoDMetrics.VialsSpentSuccessEvent( f62_arg0, f62_local0.vialsSpent, f62_local0.vialsBefore, Engine.GetZMVials( f62_arg0 ) )
	else
		LUI.CoDMetrics.VialsSpentFailureEvent( f62_arg0, f62_local0.vialsSpent, f62_local0.vialsBefore, Engine.GetZMVials( f62_arg0 ) )
	end
	CoD.perController[f62_arg0].MegaChewFactory_PendingLootRewardTask = nil
end

local PostLoadFunc = function ( f63_arg0, f63_arg1 )
	local f63_local0 = Engine.CreateModel( Engine.GetModelForController( f63_arg1 ), "MegaChewFactory" )
	local f63_local1 = Engine.GetPlayerStats( f63_arg1, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
	f63_local1.showMegaChewFactoryBreadcrumb:set( 0 )
	local f63_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "MegaChewFactoryVialDisplay" )
	local f63_local3 = f63_arg0.Label0
	local f63_local4 = f63_local3
	f63_local3 = f63_local3.subscribeToGlobalModel
	local f63_local5 = f63_arg1
	local f63_local6 = "MegaChewTokens"
	f63_local3( f63_local4, f63_local5, f63_local6, "remainingTokens", function ( f64_arg0 )
		local modelValue = Engine.GetModelValue( f64_arg0 )
		if modelValue then
			Engine.SetModelValue( f63_local2, modelValue )
			Engine.SendClientScriptNotify( f63_arg1, "mega_chew_remaining_tokens", modelValue )
		end
	end )
	f63_local3 = 3000
	f63_local4 = 32
	f63_local5 = 0
	f63_local6 = function ()
		if Engine.LootResultsReady( f63_arg1 ) then
			local f65_local0 = Engine.LootFailureReason( f63_arg1 )
			if f65_local0 == Enum.LootResultType.LOOT_RESULT_SUCCESS then
				local f65_local1 = Engine.GetLootResults( f63_arg1 )
				Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f63_arg1 ), "MegaChewTokens" ), "remainingTokens" ), Engine.GetZMVials( f63_arg1 ) )
				f0_local2( f63_arg1, true )
				Engine.SendClientScriptNotify( f63_arg1, "mega_chew_results", true, f65_local1[1], f65_local1[2], f65_local1[3] )
				for f65_local2 = 4, 6, 1 do
					local f65_local5 = tonumber( Engine.TableLookup( nil, "gamedata/stats/zm/zm_statsTable.csv", 4, f65_local1[f65_local2], 0 ) )
					if f65_local5 then
						f63_local1.itemStats[f65_local5].markedOld:set( 0 )
					end
				end
			else
				Engine.PlaySound( "uin_bm_denied" )
				Engine.SendClientScriptNotify( f63_arg1, "mega_chew_results", false, "", "", "" )
				f0_local2( f63_arg1, false )
				LuaUtils.UI_ShowErrorMessageDialog( f63_arg1, f0_local1( f65_local0 ) )
			end
		else
			f63_local5 = f63_local5 + 1
			if f63_local5 < f63_local4 then
				f63_arg0:addElement( LUI.UITimer.newElementTimer( 250, true, f63_local6 ) )
			else
				Engine.SendClientScriptNotify( f63_arg1, "mega_chew_results", false )
			end
		end
	end
	
	local f63_local7 = Engine.CreateModel( f63_local0, "getResultsOrKeepWaiting" )
	f63_arg0:subscribeToModel( f63_local7, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue and modelValue ~= 0 then
			f63_local5 = 0
			f63_arg0:addElement( LUI.UITimer.newElementTimer( f63_local3, true, f63_local6 ) )
		end
		Engine.SetModelValue( model, 0 )
	end )
	local f63_local8 = Engine.CreateModel( f63_local0, "queryLoot" )
	local f63_local9 = Engine.CreateModel( f63_local0, "lootQueryResult" )
	Engine.SetModelValue( f63_local8, 0 )
	f63_arg0:subscribeToModel( f63_local8, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if not modelValue or modelValue == 0 then
			return 
		else
			CoD.perController[f63_arg1].MegaChewFactory_PendingLootRewardTask = {}
			CoD.perController[f63_arg1].MegaChewFactory_PendingLootRewardTask.vialsSpent = modelValue
			CoD.perController[f63_arg1].MegaChewFactory_PendingLootRewardTask.vialsBefore = Engine.GetZMVials( f63_arg1 )
			if not Engine.SpendZMVials( f63_arg1, modelValue ) then
				PlaySoundAlias( "uin_bm_denied" )
				Engine.SetModelValue( f63_local8, 0 )
				Engine.SetModelValue( f63_local9, 0 )
				Engine.SendClientScriptNotify( f63_arg1, "loot_query_result_ready" )
				f0_local2( f63_arg1, false )
				LuaUtils.UI_ShowErrorMessageDialog( f63_arg1, Engine.Localize( "MENU_BGB_FACTORY_ERR_BAD_RESPONSE" ) )
				return 
			else
				Engine.SetModelValue( f63_local7, 1 )
				Engine.SetModelValue( f63_local9, 1 )
				Engine.SendClientScriptNotify( f63_arg1, "loot_query_result_ready" )
				Engine.SetModelValue( f63_local8, 0 )
			end
		end
	end, false )
	f63_arg0:registerEventHandler( "bm_autoevents_tick", function ( element, event )
		Engine.SetDvar( "live_autoEventPumpTime", 0 )
	end )
	f63_arg0:addElement( LUI.UITimer.new( 100, "bm_autoevents_tick", false, f63_arg0 ) )
end

LUI.createMenu.MegaChewFactory = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MegaChewFactory" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MegaChewFactory.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_MegaChew_FACTORY_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MegaChew_FACTORY_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local MegaChewMachine0 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine0:setLeftRight( true, false, 342, 470 )
	MegaChewMachine0:setTopBottom( true, false, 548, 676 )
	MegaChewMachine0:setAlpha( 0 )
	MegaChewMachine0:subscribeToGlobalModel( controller, "MegaChewMachines", "machine0", function ( model )
		MegaChewMachine0:setModel( model, controller )
	end )
	MegaChewMachine0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local f71_local0 = MegaChewMachine0
		local f71_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( f71_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MegaChewMachine0:registerEventHandler( "gain_focus", function ( element, event )
		local f72_local0 = nil
		if element.gainFocus then
			f72_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f72_local0 = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f72_local0
	end )
	MegaChewMachine0:registerEventHandler( "lose_focus", function ( element, event )
		local f73_local0 = nil
		if element.loseFocus then
			f73_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f73_local0 = element.super:loseFocus( event )
		end
		return f73_local0
	end )
	self:AddButtonCallbackFunction( MegaChewMachine0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			OpenSystemOverlay( self, menu, controller, "NotEnoughVials", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( MegaChewMachine0 )
	self.MegaChewMachine0 = MegaChewMachine0
	
	local MegaChewMachine1 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine1:setLeftRight( true, false, 576, 704 )
	MegaChewMachine1:setTopBottom( true, false, 548, 676 )
	MegaChewMachine1:setAlpha( 0 )
	MegaChewMachine1:subscribeToGlobalModel( controller, "MegaChewMachines", "machine1", function ( model )
		MegaChewMachine1:setModel( model, controller )
	end )
	MegaChewMachine1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local f77_local0 = MegaChewMachine1
		local f77_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( f77_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MegaChewMachine1:registerEventHandler( "gain_focus", function ( element, event )
		local f78_local0 = nil
		if element.gainFocus then
			f78_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f78_local0 = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f78_local0
	end )
	MegaChewMachine1:registerEventHandler( "lose_focus", function ( element, event )
		local f79_local0 = nil
		if element.loseFocus then
			f79_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f79_local0 = element.super:loseFocus( event )
		end
		return f79_local0
	end )
	self:AddButtonCallbackFunction( MegaChewMachine1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			OpenSystemOverlay( self, menu, controller, "NotEnoughVials", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( MegaChewMachine1 )
	self.MegaChewMachine1 = MegaChewMachine1
	
	local MegaChewMachine2 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine2:setLeftRight( true, false, 809, 937 )
	MegaChewMachine2:setTopBottom( true, false, 548, 676 )
	MegaChewMachine2:setAlpha( 0 )
	MegaChewMachine2:subscribeToGlobalModel( controller, "MegaChewMachines", "machine2", function ( model )
		MegaChewMachine2:setModel( model, controller )
	end )
	MegaChewMachine2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local f83_local0 = MegaChewMachine2
		local f83_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( f83_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MegaChewMachine2:registerEventHandler( "gain_focus", function ( element, event )
		local f84_local0 = nil
		if element.gainFocus then
			f84_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f84_local0 = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f84_local0
	end )
	MegaChewMachine2:registerEventHandler( "lose_focus", function ( element, event )
		local f85_local0 = nil
		if element.loseFocus then
			f85_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f85_local0 = element.super:loseFocus( event )
		end
		return f85_local0
	end )
	self:AddButtonCallbackFunction( MegaChewMachine2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			OpenSystemOverlay( self, menu, controller, "NotEnoughVials", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( MegaChewMachine2 )
	self.MegaChewMachine2 = MegaChewMachine2
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, -307.61, -235.61 )
	Label0:setTopBottom( true, false, 961.5, 1010.5 )
	Label0:setTTF( "fonts/default.ttf" )
	Label0:subscribeToGlobalModel( controller, "MegaChewTokens", "remainingTokens", function ( model )
		local remainingTokens = Engine.GetModelValue( model )
		if remainingTokens then
			Label0:setText( Engine.Localize( remainingTokens ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local console = CoD.CenterConsole.new( self, controller )
	console:setLeftRight( false, false, -370, 370 )
	console:setTopBottom( true, false, 123, 221 )
	self:addElement( console )
	self.console = console
	
	local MegaChewFactoryVatLeft = CoD.MegaChewFactoryVat.new( self, controller )
	MegaChewFactoryVatLeft:setLeftRight( true, false, 110, 470 )
	MegaChewFactoryVatLeft:setTopBottom( true, false, -313.15, -178.15 )
	Engine.SetupUI3DWindow( controller, 0, 360, 135 )
	MegaChewFactoryVatLeft:setUI3DWindow( 0 )
	MegaChewFactoryVatLeft.TextBox:setText( Engine.Localize( "$(MegaChewLabelLeft)" ) )
	self:addElement( MegaChewFactoryVatLeft )
	self.MegaChewFactoryVatLeft = MegaChewFactoryVatLeft
	
	local MegaChewFactoryVatMiddle = CoD.MegaChewFactoryVat.new( self, controller )
	MegaChewFactoryVatMiddle:setLeftRight( true, false, 576, 936 )
	MegaChewFactoryVatMiddle:setTopBottom( true, false, -313.15, -178.15 )
	Engine.SetupUI3DWindow( controller, 1, 360, 135 )
	MegaChewFactoryVatMiddle:setUI3DWindow( 1 )
	MegaChewFactoryVatMiddle.TextBox:setText( Engine.Localize( "$(MegaChewLabelMiddle)" ) )
	self:addElement( MegaChewFactoryVatMiddle )
	self.MegaChewFactoryVatMiddle = MegaChewFactoryVatMiddle
	
	local MegaChewFactoryVatRight = CoD.MegaChewFactoryVat.new( self, controller )
	MegaChewFactoryVatRight:setLeftRight( true, false, 1051, 1411 )
	MegaChewFactoryVatRight:setTopBottom( true, false, -313.15, -178.15 )
	Engine.SetupUI3DWindow( controller, 2, 360, 135 )
	MegaChewFactoryVatRight:setUI3DWindow( 2 )
	MegaChewFactoryVatRight.TextBox:setText( Engine.Localize( "$(MegaChewLabelRight)" ) )
	self:addElement( MegaChewFactoryVatRight )
	self.MegaChewFactoryVatRight = MegaChewFactoryVatRight
	
	local MegaChewFactoryBottomLeftLabel = CoD.MegaChewFactoryBottomLeftLabel.new( self, controller )
	MegaChewFactoryBottomLeftLabel:setLeftRight( true, false, -659.07, -179.07 )
	MegaChewFactoryBottomLeftLabel:setTopBottom( true, false, 315, 405 )
	Engine.SetupUI3DWindow( controller, 3, 480, 90 )
	MegaChewFactoryBottomLeftLabel:setUI3DWindow( 3 )
	MegaChewFactoryBottomLeftLabel.TextBox:setText( Engine.Localize( "$(MegaChewLabelInstructions)" ) )
	self:addElement( MegaChewFactoryBottomLeftLabel )
	self.MegaChewFactoryBottomLeftLabel = MegaChewFactoryBottomLeftLabel
	
	local MegaChewFactoryBuyDivinium0 = CoD.MegaChewFactoryBuyDivinium.new( self, controller )
	MegaChewFactoryBuyDivinium0:setLeftRight( true, false, 93, 246 )
	MegaChewFactoryBuyDivinium0:setTopBottom( false, false, 45, 72 )
	MegaChewFactoryBuyDivinium0.Label0:setText( Engine.Localize( "MENU_PURCHASE" ) )
	MegaChewFactoryBuyDivinium0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 1 )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) and AreCodPointsEnabled( controller )
			end
		}
	} )
	MegaChewFactoryBuyDivinium0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		self:updateElementState( MegaChewFactoryBuyDivinium0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		} )
	end )
	MegaChewFactoryBuyDivinium0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		self:updateElementState( MegaChewFactoryBuyDivinium0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:addElement( MegaChewFactoryBuyDivinium0 )
	self.MegaChewFactoryBuyDivinium0 = MegaChewFactoryBuyDivinium0
	
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
		local f93_local0 = self
		local f93_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( f93_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f93_local0, self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( f93_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f93_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f94_local0 = self
		local f94_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f94_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f94_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codPoints" ), function ( model )
		local f95_local0 = self
		local f95_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codPoints"
		}
		CoD.Menu.UpdateButtonShownState( f95_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f95_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f96_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not f96_local0 then
			f96_local0 = self:dispatchEventToChildren( event )
		end
		return f96_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f97_local0 = nil
		if IsPerControllerTablePropertyValue( controller, "cameFromFeaturedCard", true ) and not HasSeenMegaChewFactoryFirstTimePopup( controller ) then
			OpenSystemOverlay( self, self, controller, "MegaChewFactoryWelcomePopup", "" )
		else
			OpenBlackMarketIncentivePopup( self, controller )
		end
		if not f97_local0 then
			f97_local0 = self:dispatchEventToChildren( event )
		end
		return f97_local0
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_NAVIGATE" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if AreCodPointsEnabled( controller ) and not IsInventoryBusy( controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			OpenCodPointsStore( self, element, controller, "MegaChewFactory", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AreCodPointsEnabled( controller ) and not IsInventoryBusy( controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ForceLobbyButtonUpdate( controller )
		SendClientScriptNotify( controller, "resetMegaChewFactory", "" )
		SetPerControllerTableProperty( controller, "cameFromFeaturedCard", nil )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "MegaChewFactory.disableInput", function ( model )
		local f107_local0 = self
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
	self:subscribeToGlobalModel( controller, "PerController", "OpenBlackMarketIncentivesPopup", function ( model )
		local f108_local0 = self
		if IsModelValueTrue( controller, "OpenBlackMarketIncentivesPopup" ) then
			OpenBlackMarketIncentivePopup( self, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrame0:close()
		element.MegaChewMachine0:close()
		element.MegaChewMachine1:close()
		element.MegaChewMachine2:close()
		element.console:close()
		element.MegaChewFactoryVatLeft:close()
		element.MegaChewFactoryVatMiddle:close()
		element.MegaChewFactoryVatRight:close()
		element.MegaChewFactoryBottomLeftLabel:close()
		element.MegaChewFactoryBuyDivinium0:close()
		element.Label0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

