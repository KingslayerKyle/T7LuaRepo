-- f875503964304045f06796995774b982
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.BlackMarket.BM_Logo" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BlackMarket.LootDecryptionWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_TradeAgainFocus" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketTradeAgainListItem" )
require( "ui.uieditor.widgets.BlackMarket.BM_DecryptionBonusKeys" )
require( "ui.uieditor.widgets.BlackMarket.BM_DecryptionCrate" )
require( "ui.uieditor.widgets.BlackMarket.BM_DecryptionTradeAgain" )
require( "ui.uieditor.widgets.BlackMarket.BM_DecryptionNoBundleUses" )
require( "ui.uieditor.widgets.BlackMarket.BM_Debug_LootItemStats" )
require( "ui.uieditor.widgets.BlackMarket.BM_GunMeter" )

local f0_local0 = function ()
	local f1_local0 = Dvar.loot_testIndex:get()
	local f1_local1 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f1_local0 + 1, 1 )
	if f1_local1 == nil or f1_local1 == "" then
		f1_local0 = 0
	else
		f1_local0 = f1_local0 + 1
	end
	Dvar.loot_testIndex:set( f1_local0 )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = f2_arg0[f2_arg2]
	f2_arg0[f2_arg2] = f2_arg0[f2_arg1]
	f2_arg0[f2_arg1] = f2_local0
end

local f0_local2 = function ( f3_arg0 )
	local f3_local0 = #f3_arg0
	while 1 < f3_local0 do
		f0_local1( f3_arg0, math.random( f3_local0 ), f3_local0 )
		f3_local0 = f3_local0 - 1
	end
end

DataSources.BlackMarketDecryptionList = DataSourceHelpers.ListSetup( "BlackMarketDecryptionList", function ( f4_arg0, f4_arg1 )
	local f4_local0 = {}
	local f4_local1 = function ()
		local f5_local0 = {}
		local f5_local1 = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
		local f5_local2 = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
		local f5_local3 = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
		local f5_local4 = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
		local f5_local5 = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
		f5_local0 = f5_local1
		for f5_local1 = 2, #f5_local0, 1 do
			f5_local5 = true
			while f5_local5 do
				f5_local5 = false
				for f5_local6 = 1, #f5_local0, 1 do
					if f5_local1 ~= f5_local6 and f5_local0[f5_local1][1] == f5_local0[f5_local6][1] then
						f5_local5 = true
						break
					end
				end
				if f5_local5 then
					f5_local0[f5_local1] = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
				end
			end
		end
		f5_local1 = {
			displayText = "",
			hintText = "",
			image = "blacktransparent",
			emblem = blacktransparent,
			category = "decal",
			categoryName = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( "", "decal" ),
			lockItemText = "",
			lockAvailabilityText = "",
			raritySet = "",
			rarityName = CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( CoD.BlackMarketUtility.DropTypes.COMMON )],
			rarity = CoD.BlackMarketUtility.DropTypes.COMMON,
			reveal = false,
			drop = 1
		}
		for f5_local2 = 1, 5, 1 do
			f5_local1["fakeloot" .. f5_local2] = {
				emblem = f5_local0[f5_local2][1],
				image = CoD.BlackMarketUtility.GetImageForLootItem( f5_local0[f5_local2][1], f5_local0[f5_local2][2] ),
				category = f5_local0[f5_local2][2],
				rarity = f5_local0[f5_local2][3]
			}
		end
		return {
			models = f5_local1,
			properties = {}
		}
	end
	
	local f4_local2 = CoD.perController[f4_arg0].cryptokeysToSpend
	local f4_local3 = Engine.GetLootResults( f4_arg0 )
	local f4_local4 = {
		"2104202505",
		"2132914613",
		"2033507461"
	}
	local f4_local5 = {
		"2122828615",
		"2054341474",
		"2106186559"
	}
	if Dvar.loot_fakeRarity:exists() then
		if Dvar.loot_fakeRarity:get() == "common" then
			f4_local3 = {
				"2088754833",
				"2081841575",
				"2093777929"
			}
		elseif Dvar.loot_fakeRarity:get() == "mixed" then
			f4_local3 = {
				"2058086710",
				"2112484188",
				"2114010313"
			}
		end
	elseif Engine.DvarBool( nil, "loot_fakeRare" ) then
		f4_local3 = f4_local4
	elseif Engine.DvarBool( nil, "loot_fakeCommon" ) then
		f4_local3 = f4_local5
	elseif f4_local3 == nil then
		if f4_local2 <= 10 then
			f4_local3 = f4_local5
		else
			f4_local3 = f4_local4
		end
	end
	if LUI.DEV and Dvar.loot_fakeItem:exists() and Dvar.loot_fakeItem:get() ~= "" then
		f4_local3[1] = Dvar.loot_fakeItem:get()
	end
	if LUI.DEV and Dvar.loot_testAll:exists() and Dvar.loot_testAll:get() == true then
		for f4_local6 = 1, 3, 1 do
			f4_local3[f4_local6] = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, Dvar.loot_testIndex:get(), 1 )
			f0_local0()
		end
	else
		table.remove( f4_local3, 4 )
		f0_local2( f4_local3 )
	end
	if Dvar.loot_showLootItemStats:exists() and tonumber( Dvar.loot_showLootItemStats:get() ) == 1 and f4_local3[1] ~= nil and f4_local3[1] ~= "" then
		local f4_local6 = 0
		local f4_local7 = 0
		local f4_local8 = 0
		local f4_local9 = 0
		local f4_local10 = 0
		local f4_local11 = 0
		local f4_local12 = 0
		local f4_local13 = 0
		local f4_local14 = 0
		local f4_local15 = 0
		local f4_local16 = 0
		local f4_local17 = 0
		for f4_local21, f4_local22 in ipairs( Engine.GetLootItems( f4_arg0, Enum.eModes.MODE_MULTIPLAYER, 0, 3500 ) ) do
			local f4_local23 = Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, 1, f4_local22.id, 3 )
			if f4_local23 == "common" then
				f4_local6 = f4_local6 + 1
				f4_local7 = f4_local7 + f4_local22.count - 1
			end
			if f4_local23 == "rare" then
				f4_local8 = f4_local8 + 1
				f4_local9 = f4_local9 + f4_local22.count - 1
			end
			if f4_local23 == "legendary" then
				if Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, 1, f4_local22.id, 2 ) == "melee_weapon" then
					local f4_local14 = f4_local14 + 1
					local f4_local15 = f4_local15 + f4_local22.count - 1
				else
					f4_local10 = f4_local10 + 1
					f4_local11 = f4_local11 + f4_local22.count - 1
					goto basicblock_43:
				end
			end
			if f4_local23 == "epic" then
				if Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, 1, f4_local22.id, 2 ) == "weapon" then
					f4_local16 = f4_local16 + 1
					f4_local17 = f4_local17 + f4_local22.count - 1
				else
					f4_local12 = f4_local12 + 1
					local f4_local13 = f4_local13 + f4_local22.count - 1
				end
			end
		end
		f4_local18 = Engine.CreateModel( Engine.GetModelForController( f4_arg0 ), "debugLootItemStats" )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "commonDiscreteCount" ), f4_local6 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "commonDupeCount" ), f4_local7 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "rareDiscreteCount" ), f4_local8 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "rareDupeCount" ), f4_local9 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "legendaryDiscreteCount" ), f4_local10 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "legendaryDupeCount" ), f4_local11 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "epicDiscreteCount" ), f4_local12 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "epicDupeCount" ), f4_local13 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "meleeDiscreteCount" ), f4_local14 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "meleeDupeCount" ), f4_local15 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "rangeDiscreteCount" ), f4_local16 )
		Engine.SetModelValue( Engine.CreateModel( f4_local18, "rangeDupeCount" ), f4_local17 )
	end
	local f4_local6 = 0
	local f4_local7 = 1
	local f4_local8 = 2
	local f4_local9 = 3
	local f4_local10 = 4
	local f4_local11 = 6
	local f4_local12 = #f4_local3
	if f4_local12 > 3 then
		f4_local12 = 3
	end
	for f4_local13 = 1, f4_local12, 1 do
		local f4_local16 = f4_local13
		table.insert( f4_local0, f4_local1() )
	end
	if Engine.LootResultsReady( f4_arg0 ) then
		for f4_local13 = f4_local12, 1, -1 do
			local f4_local17 = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, f4_local7, f4_local3[f4_local13] )
			if f4_local17 == nil then
				table.remove( f4_local0, f4_local13 )
			end
			local f4_local24 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f4_local17[1], f4_local8 )
			local f4_local18 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f4_local17[1], f4_local9 )
			local f4_local19 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f4_local17[1], f4_local6 )
			local f4_local20 = CoD.BlackMarketUtility.GetStringRefForLootItem( f4_arg0, f4_local19, f4_local24 )
			local f4_local21 = CoD.BlackMarketUtility.GetImageForLootItem( f4_local19, f4_local24 )
			local f4_local22 = CoD.BlackMarketUtility.GetSetPieceStringForLootItem( f4_arg0, f4_local19, f4_local24 )
			local f4_local23 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f4_local17[1], f4_local11 )
			if CoD.BlackMarketUtility.IsLimitedBlackMarketItem( f4_local19 ) then
				f4_local18 = "limited"
			end
			local f4_local25 = CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( f4_local18 )]
			local f4_local26, f4_local27 = CoD.BlackMarketUtility.GetItemLockedTextAndAvailability( f4_arg0, f4_local19, f4_local24 )
			local f4_local28 = nil
			if f4_local24 == "emblem" or f4_local24 == "calling_card" then
				f4_local28 = Engine.Localize( "MPUI_EQUIP_PROMPT" )
			end
			f4_local0[f4_local13].models.displayText = f4_local20
			f4_local0[f4_local13].models.hintText = f4_local28
			f4_local0[f4_local13].models.image = CoD.BlackMarketUtility.GetImageForLootItem( f4_local19, f4_local24 )
			f4_local0[f4_local13].models.emblem = f4_local19
			f4_local0[f4_local13].models.category = f4_local24
			f4_local0[f4_local13].models.categoryName = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f4_local19, f4_local24 )
			f4_local0[f4_local13].models.lockItemText = f4_local26
			f4_local0[f4_local13].models.lockAvailabilityText = f4_local27
			f4_local0[f4_local13].models.raritySet = f4_local22
			f4_local0[f4_local13].models.rarityName = f4_local25
			f4_local0[f4_local13].models.rarity = f4_local18
			f4_local0[f4_local13].models.reveal = false
			f4_local0[f4_local13].models.drop = f4_local23
			if Dvar.tu27_gunMeterOn:get() and CoD.perController[f4_arg0].supplyDropType ~= nil and not CoD.BlackMarketUtility.NoGunMeter[CoD.perController[f4_arg0].supplyDropType] and f4_local0[f4_local13].models.category == "weapon" then
				local f4_local29, f4_local30 = Engine.GetItemRarityOccurrences( f4_arg0, "rare", 51 )
				if f4_local29 == true then
					local f4_local31 = Engine.StorageGetBuffer( f4_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
					if f4_local31 ~= nil then
						f4_local31.periodicLadderRarities[CoD.BlackMarketUtility.periodicLadderRaritiesIndex.RARE]:set( f4_local30 )
						Engine.StorageWrite( f4_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
					end
				end
			end
			f4_local0[f4_local13].models.fakeloot3 = {
				emblem = f4_local19,
				image = CoD.BlackMarketUtility.GetImageForLootItem( f4_local19, f4_local24 ),
				category = f4_local24,
				rarity = f4_local18
			}
		end
		f4_arg1.ready = true
	end
	return f4_local0
end, true )
DataSources.BlackMarketTradeAgainList = DataSourceHelpers.ListSetup( "BlackMarketTradeAgainList", function ( f6_arg0, f6_arg1 )
	local f6_local0 = {}
	local f6_local1 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
		CoD.perController[f7_arg2].codPointsSpent = f7_arg3.itemCODPointCost
		CoD.OverlayUtility.CreateOverlay( f7_arg2, f7_arg0, "PurchaseSupplyDropConfirmation", f7_arg2, f7_arg3 )
	end
	
	local f6_local2 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
		CoD.BlackMarketUtility.TradeForCrateAction( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM, f6_arg1 )
	end
	
	local f6_local3 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
		local f9_local0 = GetIconForCurrentSupplyDrop( f6_arg0 )
		if f9_arg4 == CoD.BlackMarketUtility.DropTypes.BRIBE then
			f9_local0 = f9_local0 .. "_hover"
		elseif f9_arg4 == CoD.BlackMarketUtility.DropTypes.BUNDLE then
			f9_local0 = "uie_t7_blackmarket_crate_bundle"
		end
		local f9_local1 = Engine.Localize
		local f9_local2 = f9_arg3
		if f9_arg0 > 0 then
			local f9_local3 = f9_arg0
		end
		f9_local1 = f9_local1( f9_local2, f9_local3 or f9_arg1 )
		f9_local2 = Engine.Localize
		local f9_local4
		if f9_arg0 > 0 then
			f9_local4 = "MPUI_BM_CRYPTOKEYS"
			if not f9_local4 then
			
			else
				f9_local2 = f9_local2( f9_local4 )
				f9_local4 = Engine.Localize( "MPUI_BM_TRADE_AGAIN_TEXT", f9_local2, CoD.BlackMarketUtility.GetCrateTypeString( f9_arg4 ) )
				if f9_arg1 > 0 then
					f9_local4 = Engine.Localize( "MPUI_BM_SPEND_AGAIN_TEXT", f9_local2, CoD.BlackMarketUtility.GetCrateTypeString( f9_arg4 ) )
				end
				local f9_local5 = f6_local1
				if f9_arg2 > 0 then
					f9_local5 = f6_local2
				end
				return {
					models = {
						displayText = f9_local1,
						itemCost = f9_arg0,
						itemCODPointCost = f9_arg1,
						itemBundleCost = f9_arg2
					},
					properties = {
						action = f9_local5,
						actionParam = {
							displayText = f9_local4,
							image = f9_local0,
							itemCost = f9_arg0,
							itemCODPointCost = f9_arg1,
							supplyDropType = f9_arg4,
							again = true
						},
						selectIndex = f9_arg1 == CoD.perController[f6_arg0].codPointsSpent
					}
				}
			end
		end
		f9_local4 = "CGAME_SB_CP"
	end
	
	if not f6_arg1.updateSubscription then
		local f6_local4 = DataSources.CryptoKeyProgress.getModel( f6_arg0 )
		local f6_local5 = Engine.GetModel( f6_local4, "bundles" )
		local f6_local6 = function ( f10_arg0 )
			if CoD.BlackMarketUtility.GetBundleCountForCurrentDropType( f6_arg0 ) == 0 ~= f6_arg1.currentBundleCount == 0 then
				f6_arg1:updateDataSource( false )
			end
			if IsDecryptionCrateGenericReward( f6_arg1, f6_arg1.activeWidget, f6_arg0 ) then
				local f10_local0 = Engine.GetModel( f6_local4, "genericRewardBundles" )
				if f10_local0 then
					Engine.ForceNotifyModelSubscriptions( f10_local0 )
				end
			end
		end
		
		f6_arg1.updateSubscription = f6_arg1:subscribeToModel( f6_local5, f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "incentiveWeaponBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "incentiveRareBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "rangeWeaponNoDupesBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "meleeWeaponNoDupesBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "sixPackCommonBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "dailyDoubleRareBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "hundredBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "rareBundle10for5s" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "bundleExperimentRareBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "noDupesRareBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "codeBundleRareBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "weapon3XBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "limitedEditionCamoBundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "rare20Bundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "rare15Bundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "outfit3Bundles" ), f6_local6, false )
		f6_arg1:subscribeToModel( Engine.GetModel( f6_local4, "rare20LDBundles" ), f6_local6, false )
	end
	local f6_local4 = CoD.BlackMarketUtility.GetBundleCountForCurrentDropType( f6_arg0 )
	f6_arg1.currentBundleCount = f6_local4
	if CoD.perController[f6_arg0].currencySpent == Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM then
		if f6_local4 > 0 then
			table.insert( f6_local0, f6_local3( 0, 0, 1, "MPUI_BM_BUNDLE_OPEN", CoD.perController[f6_arg0].supplyDropType ) )
		elseif CoD.perController[f6_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.BUNDLE and IsBundleActive( f6_arg0 ) then
			local f6_local5 = CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.BUNDLE )
			if f6_local5 > 0 then
				table.insert( f6_local0, f6_local3( 0, f6_local5, 0, "MPUI_BM_TRADE_COD_POINTS_SHORT", CoD.BlackMarketUtility.DropTypes.BUNDLE ) )
			end
			local f6_local6 = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BUNDLE )
			if f6_local6 > 0 then
				table.insert( f6_local0, f6_local3( f6_local6, 0, 0, "MPUI_BM_TRADE_CRYPTOKEYS_SHORT", CoD.BlackMarketUtility.DropTypes.BUNDLE ) )
			end
		end
	elseif CoD.perController[f6_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.BRIBE and 0 == Dvar.loot_bribeCrate_dwid:get() then
		
	elseif CoD.perController[f6_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE and not IsNoDupesCrateActive( f6_arg0 ) then
		
	else
		local f6_local5 = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.perController[f6_arg0].supplyDropType ) or 0
		if f6_local5 > 0 then
			table.insert( f6_local0, f6_local3( f6_local5, 0, 0, "MPUI_BM_TRADE_CRYPTOKEYS_SHORT", CoD.perController[f6_arg0].supplyDropType ) )
		end
		local f6_local6 = CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.perController[f6_arg0].supplyDropType ) or 0
		if f6_local6 > 0 then
			table.insert( f6_local0, f6_local3( 0, f6_local6, 0, "MPUI_BM_TRADE_COD_POINTS_SHORT", CoD.perController[f6_arg0].supplyDropType ) )
		end
	end
	return f6_local0
end, true )
local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].selectedEmblemTabStorageType = Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS
	self.restoreState = function ()
		if CoD.perController[controller].supplyDropQuickAnim then
			self.TradeAgainList:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end
		return true
	end
	
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "CryptoKeyProgress" ), "bonusKeysAwarded" ), 0 )
end

local f0_local4 = function ( f13_arg0 )
	if f13_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE_INSUFFICIENT_FUNDS then
		return Engine.Localize( "MENU_BM_ERR_INSUFFICIENT_FUNDS" )
	elseif f13_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE_BAD_RESPONE then
		return Engine.Localize( "MENU_BM_ERR_BAD_RESPONSE" )
	elseif f13_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE or f13_arg0 == Enum.LootResultType.LOOT_RESULT_INVALID then
		return Engine.Localize( "MENU_BM_ERR_NO_RESULT" )
	else
		return Engine.Localize( "MENU_BM_ERR_NO_RESULT" )
	end
end

local PostLoadFunc = function ( f14_arg0, f14_arg1 )
	local f14_local0 = 1500
	local f14_local1 = 100
	local f14_local2 = 200
	local f14_local3 = 800
	local f14_local4 = 1400
	local f14_local5 = 2000
	local f14_local6 = 500
	if CoD.perController[f14_arg1].supplyDropQuickAnim then
		f14_local0 = 0
		f14_arg0.disablePopupOpenCloseAnim = true
	end
	f14_arg0:setState( "DefaultState" )
	local f14_local7 = f14_arg0.decryptionList
	f14_local7.m_disableNavigation = true
	f14_local7 = function ()
		if Engine.IsCommonFastFileLoaded() and Engine.LootResultsReady( f14_arg1 ) then
			local f15_local0 = Engine.LootFailureReason( f14_arg1 )
			if f15_local0 == Enum.LootResultType.LOOT_RESULT_SUCCESS then
				f14_arg0.decryptionList:updateDataSource()
				f14_arg0.decryptionList:setMouseDisabled( true )
				if Dvar.loot_testAll:exists() and Dvar.loot_testAll:get() == true then
					f14_arg0:addElement( LUI.UITimer.newElementTimer( 1000, false, function ()
						f14_arg0.decryptionList:updateDataSource()
						for f16_local0 = 1, 3, 1 do
							local f16_local3 = f14_arg0.decryptionList:getItemAtPosition( 1, f16_local0 )
							if f16_local3 then
								local f16_local4 = f16_local3:getModel()
								Engine.SetModelValue( Engine.GetModel( f16_local4, "reveal" ), true )
								CoD.BlackMarketUtility.ShowToastIfApplicable( f14_arg1, CoD.SafeGetModelValue( f16_local4, "emblem" ), CoD.SafeGetModelValue( f16_local4, "category" ), f16_local0 )
							end
						end
					end ) )
				end
				CoD.BlackMarketUtility.SpendKeysForCrate( f14_arg1, CoD.perController[f14_arg1].cryptokeysToSpend )
				CoD.perController[f14_arg1].cryptokeysToSpend = 0
				local f15_local1 = f14_arg0.decryptionList:getItemAtPosition( 1, 1 )
				if f15_local1 then
					f15_local1:playClip( "StartFuzz" )
				end
				Engine.SendClientScriptNotify( f14_arg1, "BlackMarket", "cycle_start" )
				f14_arg0:addElement( LUI.UITimer.newElementTimer( f14_local2, true, function ()
					local f17_local0 = f14_arg0.decryptionList:getItemAtPosition( 1, 2 )
					if f17_local0 then
						f17_local0:playClip( "StartFuzz" )
					end
				end ) )
				f14_arg0:addElement( LUI.UITimer.newElementTimer( 2 * f14_local2, true, function ()
					local f18_local0 = f14_arg0.decryptionList:getItemAtPosition( 1, 3 )
					if f18_local0 then
						f18_local0:playClip( "StartFuzz" )
					end
				end ) )
				local f15_local2 = f14_local3
				if Dvar.loot_testAll:exists() and Dvar.loot_testAll:get() == true then
					f15_local2 = 0
					f14_local4 = 0
					f14_local5 = 0
					f14_local6 = 0
				end
				local f15_local3 = 0
				for f15_local4 = 1, 3, 1 do
					local f15_local7 = f15_local4
					local f15_local8 = f14_arg0.decryptionList:getItemAtPosition( 1, f15_local7 )
					if f15_local8 then
						local f15_local9 = f15_local8:getModel()
						local f15_local10 = CoD.BlackMarketUtility.GetRarityIDForString( CoD.SafeGetModelValue( f15_local9, "rarity" ) )
						if f15_local3 < f15_local10 then
							f15_local3 = f15_local10
						end
						f14_arg0:addElement( LUI.UITimer.newElementTimer( f15_local2 + (f15_local7 - 1) * f14_local4, true, function ()
							Engine.SetModelValue( Engine.GetModel( f15_local9, "reveal" ), true )
							Engine.PlaySound( "uin_bm_cycle_item_hit" )
							local f19_local0 = CoD.BlackMarketUtility.CrateTypeRevealAlias[f15_local10]
							if f19_local0 ~= nil then
								Engine.PlaySound( f19_local0 )
							end
							if f15_local7 == 3 then
								Engine.SendClientScriptNotify( f14_arg1, "BlackMarket", "cycle_stop" )
								f14_arg0.decryptionList.m_disableNavigation = false
								f14_arg0.decryptionList.m_focusable = true
							end
							CoD.BlackMarketUtility.ShowToastIfApplicable( f14_arg1, CoD.SafeGetModelValue( f15_local9, "emblem" ), CoD.SafeGetModelValue( f15_local9, "category" ), f15_local7 )
						end ) )
					end
				end
				local f15_local4 = CoD.BlackMarketUtility.CrateTypeIds[f15_local3]
				local f15_local5 = f15_local2 + f14_local4 + f14_local5 + f14_local6
				local f15_local6 = 0
				if CoD.perController[f14_arg1].supplyDropType ~= CoD.BlackMarketUtility.DropTypes.COMMON then
					local f15_local7 = Engine.GetLootResults( f14_arg1 )
					if f15_local7[4] ~= nil then
						f15_local6 = f15_local7[4]
					else
						f15_local6 = 0
					end
				end
				CoD.perController[f14_arg1].keysToNotShowYet = f15_local6
				DataSources.CryptoKeyProgress.getModel( f14_arg1 )
				f14_arg0:addElement( LUI.UITimer.newElementTimer( f15_local5, true, function ()
					Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f14_arg1 ), "CryptoKeyProgress" ), "bonusKeysAwarded" ), f15_local6 )
					if f15_local6 > 0 then
						Engine.PlaySound( "uin_bm_keydrop_anim" )
						f14_arg0:addElement( LUI.UITimer.newElementTimer( 850, true, function ()
							f14_arg0.StartMenuCurrencyCounts:playClip( "Bonus" )
							f14_arg0.StartMenuCurrencyCounts.BMCryptokeyCounterIcon:playClip( "Keybonus" )
							f14_arg0.BMDecryptionBonusKeys.BMWires1:playClip( "circuitanim" )
							f14_arg0.BMDecryptionBonusKeys.BMWires2:playClip( "circuitanim" )
							f14_arg0.BMDecryptionBonusKeys.BMWiresGlow:playClip( "circuitanim" )
						end ) )
						f14_arg0:addElement( LUI.UITimer.newElementTimer( 1225, true, function ()
							CoD.perController[f14_arg1].keysToNotShowYet = 0
							DataSources.CryptoKeyProgress.getModel( f14_arg1 )
						end ) )
						f14_arg0:addElement( LUI.UITimer.newElementTimer( 1725, true, function ()
							Engine.SendMenuResponse( f14_arg1, "BlackMarket", "complete_" .. f15_local4 )
						end ) )
					else
						Engine.SendMenuResponse( f14_arg1, "BlackMarket", "complete_" .. f15_local4 )
					end
					f14_arg0:setState( "Results" )
					CoD.Menu.UpdateButtonShownState( f14_arg0, f14_arg0, f14_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
					if not CoD.perController[f14_arg1].supplyDropQuickAnim then
						f14_arg0.decryptionList:processEvent( {
							name = "gain_focus",
							controller = f14_arg1
						} )
					end
					if not f14_arg0.autoEventTimer then
						if CoD.perController[f14_arg1].supplyDropType == CoD.BlackMarketUtility.DropTypes.BRIBE then
							local f20_local0 = Dvar.loot_bribeCrate_dwid:get()
							f14_arg0.autoEventTimer = f14_arg0:subscribeToGlobalModel( f14_arg1, "AutoeventsCycled", "cycled", function ()
								if f20_local0 ~= Dvar.loot_bribeCrate_dwid:get() or f20_local0 == 0 then
									if f14_arg0.TradeAgainList.hasListFocus then
										CoD.SwapFocusableElements( f14_arg1, f14_arg0.TradeAgainList, f14_arg0.decryptionList )
										f14_arg0.TradeAgainList.m_disableNavigation = true
									end
									f14_arg0.TradeAgainList:updateDataSource( true, false )
									if not f14_arg0.cancelTimer then
										f14_arg0.cancelTimer = LUI.UITimer.newElementTimer( 180000, true, function ()
											GoBack( f14_arg0, f14_arg1 )
										end )
										f14_arg0:addElement( f14_arg0.cancelTimer )
									end
								end
							end )
						elseif CoD.perController[f14_arg1].supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE then
							local f20_local0 = IsLootSaleActive( f14_arg1 )
							f14_arg0.autoEventTimer = f14_arg0:subscribeToGlobalModel( f14_arg1, "AutoeventsCycled", "cycled", function ()
								if f20_local0 ~= IsLootSaleActive( f14_arg1 ) then
									f14_arg0.TradeAgainList:updateDataSource( true, false )
								end
							end )
						end
					end
					f14_arg0.decryptionList:setMouseDisabled( false )
				end ) )
			else
				GoBack( f14_arg0, f14_arg1 )
				ClearMenuSavedState( f14_arg0 )
				LuaUtils.UI_ShowErrorMessageDialog( f14_arg1, f0_local4( f15_local0 ) )
			end
		else
			f14_arg0:addElement( LUI.UITimer.newElementTimer( 250, true, f14_local7 ) )
			f14_local3 = math.max( 0, f14_local3 - 250 )
		end
	end
	
	f14_arg0:addElement( LUI.UITimer.newElementTimer( f14_local0, true, function ()
		f14_arg0:setState( "Rolling" )
		f14_arg0.decryptionList:updateDataSource()
		f14_local7()
		f14_arg0:addElement( LUI.UITimer.newElementTimer( f14_local1, true, function ()
			local f28_local0 = f14_arg0.decryptionList:getItemAtPosition( 1, 1 )
			if f28_local0 then
				f28_local0:playClip( "StartFuzz" )
			end
			Engine.SendClientScriptNotify( f14_arg1, "BlackMarket", "cycle_start" )
		end ) )
		f14_arg0:addElement( LUI.UITimer.newElementTimer( f14_local1 + f14_local2, true, function ()
			local f29_local0 = f14_arg0.decryptionList:getItemAtPosition( 1, 2 )
			if f29_local0 then
				f29_local0:playClip( "StartFuzz" )
			end
		end ) )
		f14_arg0:addElement( LUI.UITimer.newElementTimer( f14_local1 + 2 * f14_local2, true, function ()
			local f30_local0 = f14_arg0.decryptionList:getItemAtPosition( 1, 3 )
			if f30_local0 then
				f30_local0:playClip( "StartFuzz" )
			end
		end ) )
	end ) )
	LUI.OverrideFunction_CallOriginalSecond( f14_arg0, "close", function ( element )
		CoD.perController[f14_arg1].keysToNotShowYet = 0
		DataSources.CryptoKeyProgress.getModel( f14_arg1 )
	end )
	f14_arg0:registerEventHandler( "bm_autoevents_tick", function ( element, event )
		Engine.SetDvar( "live_autoEventPumpTime", 0 )
	end )
	f14_arg0:addElement( LUI.UITimer.new( 100, "bm_autoevents_tick", false, f14_arg0 ) )
end

LUI.createMenu.BM_Decryption = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BM_Decryption" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BM_Decryption.buttonPrompts" )
	local f33_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f33_local1, controller )
	LeftPanel:setLeftRight( true, true, -45, 35 )
	LeftPanel:setTopBottom( true, true, -43, 102 )
	LeftPanel:setRGB( 0.48, 0.48, 0.48 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Screen = LUI.UIImage.new()
	Screen:setLeftRight( true, true, 0, 0 )
	Screen:setTopBottom( true, true, 0, 0 )
	Screen:setImage( RegisterImage( "uie_t7_blackmarket_screen_bg" ) )
	Screen:setupUIStreamedImage( 0 )
	self:addElement( Screen )
	self.Screen = Screen
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f33_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -453, -110 )
	SelfIdentityBadge:setTopBottom( true, false, 15, 75 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local BMLogo = CoD.BM_Logo.new( f33_local1, controller )
	BMLogo:setLeftRight( true, false, 77.58, 376.04 )
	BMLogo:setTopBottom( true, false, 76.17, 197.17 )
	BMLogo.text:setText( Engine.Localize( "MPUI_CONTRABAND_CAPS" ) )
	self:addElement( BMLogo )
	self.BMLogo = BMLogo
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f33_local1, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:setAlpha( 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local f36_local0 = nil
		SizeToSafeArea( element, controller )
		if not f36_local0 then
			f36_local0 = element:dispatchEventToChildren( event )
		end
		return f36_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local TradeAgainBacking = LUI.UIImage.new()
	TradeAgainBacking:setLeftRight( true, true, 0, 0 )
	TradeAgainBacking:setTopBottom( true, true, 0, 0 )
	TradeAgainBacking:setImage( RegisterImage( "uie_t7_blackmarket_tradeagainframe" ) )
	self:addElement( TradeAgainBacking )
	self.TradeAgainBacking = TradeAgainBacking
	
	local decryptionList = LUI.UIList.new( f33_local1, controller, 50, 0, nil, false, false, 0, 0, false, false )
	decryptionList:makeFocusable()
	decryptionList:setLeftRight( false, false, -417.5, 417.5 )
	decryptionList:setTopBottom( true, false, 190, 530 )
	decryptionList:setWidgetType( CoD.LootDecryptionWidget )
	decryptionList:setHorizontalCount( 3 )
	decryptionList:setSpacing( 50 )
	decryptionList:setDataSource( "BlackMarketDecryptionList" )
	decryptionList:linkToElementModel( decryptionList, "category", true, function ( model )
		local f37_local0 = decryptionList
		local f37_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		}
		CoD.Menu.UpdateButtonShownState( f37_local0, f33_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	decryptionList:registerEventHandler( "gain_focus", function ( element, event )
		local f38_local0 = nil
		if element.gainFocus then
			f38_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f38_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f33_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f38_local0
	end )
	decryptionList:registerEventHandler( "lose_focus", function ( element, event )
		local f39_local0 = nil
		if element.loseFocus then
			f39_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f39_local0 = element.super:loseFocus( event )
		end
		return f39_local0
	end )
	f33_local1:AddButtonCallbackFunction( decryptionList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "E", function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
		if IsSelfModelValueEqualTo( f40_arg0, f40_arg2, "category", "emblem" ) then
			BlackMarketSetAsEmblem( self, f40_arg0, f40_arg2 )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "ShowBadge"
			}, f40_arg2 )
			return true
		elseif IsSelfModelValueEqualTo( f40_arg0, f40_arg2, "category", "calling_card" ) then
			BlackMarketSetCallingCard( self, f40_arg0, f40_arg2 )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "ShowBadge"
			}, f40_arg2 )
			return true
		elseif IsSelfModelValueEqualTo( f40_arg0, f40_arg2, "category", "taunt" ) and BlackMarketListItemCanEquip( f40_arg0, f40_arg2 ) then
			BlackMarketSetTaunt( self, f40_arg0, f40_arg2 )
			return true
		elseif IsSelfModelValueEqualTo( f40_arg0, f40_arg2, "category", "gesture" ) and BlackMarketListItemCanEquip( f40_arg0, f40_arg2 ) then
			BlackMarketSetGesture( self, f40_arg0, f40_arg2 )
			return true
		elseif IsSelfModelValueEqualTo( f40_arg0, f40_arg2, "category", "specialist_outfit" ) and BlackMarketListItemCanEquip( f40_arg0, f40_arg2 ) then
			BlackMarketSetSpecialistTheme( self, f40_arg0, f40_arg2 )
			return true
		else
			
		end
	end, function ( f41_arg0, f41_arg1, f41_arg2 )
		if IsSelfModelValueEqualTo( f41_arg0, f41_arg2, "category", "emblem" ) then
			CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP" )
			return true
		elseif IsSelfModelValueEqualTo( f41_arg0, f41_arg2, "category", "calling_card" ) then
			CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP" )
			return true
		elseif IsSelfModelValueEqualTo( f41_arg0, f41_arg2, "category", "taunt" ) and BlackMarketListItemCanEquip( f41_arg0, f41_arg2 ) then
			CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP" )
			return true
		elseif IsSelfModelValueEqualTo( f41_arg0, f41_arg2, "category", "gesture" ) and BlackMarketListItemCanEquip( f41_arg0, f41_arg2 ) then
			CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP" )
			return true
		elseif IsSelfModelValueEqualTo( f41_arg0, f41_arg2, "category", "specialist_outfit" ) and BlackMarketListItemCanEquip( f41_arg0, f41_arg2 ) then
			CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( decryptionList )
	self.decryptionList = decryptionList
	
	local BMTradeAgainFocus = CoD.BM_TradeAgainFocus.new( f33_local1, controller )
	BMTradeAgainFocus:setLeftRight( true, false, 61.43, 205.43 )
	BMTradeAgainFocus:setTopBottom( true, false, 183, 567 )
	self:addElement( BMTradeAgainFocus )
	self.BMTradeAgainFocus = BMTradeAgainFocus
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( f33_local1, controller )
	StartMenuCurrencyCounts:setLeftRight( false, true, -299, -95 )
	StartMenuCurrencyCounts:setTopBottom( true, false, 122, 152 )
	StartMenuCurrencyCounts:mergeStateConditions( {
		{
			stateName = "ShowKeysAndVials",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownOnlyCODPoints",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	StartMenuCurrencyCounts:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		f33_local1:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = f33_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	StartMenuCurrencyCounts:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		f33_local1:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = f33_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local TradeAgainList = LUI.UIList.new( f33_local1, controller, 15, 0, nil, false, false, 0, 0, false, false )
	TradeAgainList:makeFocusable()
	TradeAgainList:setLeftRight( true, false, 97.93, 174.93 )
	TradeAgainList:setTopBottom( true, false, 396, 467 )
	TradeAgainList:setWidgetType( CoD.BlackMarketTradeAgainListItem )
	TradeAgainList:setVerticalCount( 2 )
	TradeAgainList:setSpacing( 15 )
	TradeAgainList:setDataSource( "BlackMarketTradeAgainList" )
	TradeAgainList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codPoints" ), function ( model )
		local f47_local0 = TradeAgainList
		local f47_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codPoints"
		}
		CoD.Menu.UpdateButtonShownState( f47_local0, f33_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	TradeAgainList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		local f48_local0 = TradeAgainList
		local f48_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		}
		CoD.Menu.UpdateButtonShownState( f48_local0, f33_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	TradeAgainList:linkToElementModel( TradeAgainList, "itemCODPointCost", true, function ( model )
		local f49_local0 = TradeAgainList
		local f49_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCODPointCost"
		}
		CoD.Menu.UpdateButtonShownState( f49_local0, f33_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	TradeAgainList:registerEventHandler( "gain_list_focus", function ( element, event )
		local f50_local0 = nil
		SetElementStateByElementName( self, "BMTradeAgainFocus", controller, "Highlighted" )
		PlayClipOnElement( self, {
			elementName = "BMDecryptionCrate",
			clipName = "Focus"
		}, controller )
		return f50_local0
	end )
	TradeAgainList:registerEventHandler( "lose_list_focus", function ( element, event )
		local f51_local0 = nil
		SetElementStateByElementName( self, "BMTradeAgainFocus", controller, "Off" )
		PlayClipOnElement( self, {
			elementName = "BMDecryptionCrate",
			clipName = "DefaultClip"
		}, controller )
		return f51_local0
	end )
	TradeAgainList:registerEventHandler( "gain_focus", function ( element, event )
		local f52_local0 = nil
		if element.gainFocus then
			f52_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f52_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f33_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f52_local0
	end )
	TradeAgainList:registerEventHandler( "lose_focus", function ( element, event )
		local f53_local0 = nil
		if element.loseFocus then
			f53_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f53_local0 = element.super:loseFocus( event )
		end
		return f53_local0
	end )
	f33_local1:AddButtonCallbackFunction( TradeAgainList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
		if CanAffordTradeAgain( f54_arg0, f54_arg2 ) and IsMenuInState( f54_arg1, "Results" ) then
			ProcessListAction( self, f54_arg0, f54_arg2 )
			return true
		elseif IsSelfModelValueGreaterThan( f54_arg0, f54_arg2, "itemCODPointCost", 0 ) and IsMenuInState( f54_arg1, "Results" ) then
			OpenCodPointsStore( self, f54_arg0, f54_arg2, "BMTradeAgainCPStore", f54_arg1 )
			return true
		else
			return true
		end
	end, function ( f55_arg0, f55_arg1, f55_arg2 )
		if CanAffordTradeAgain( f55_arg0, f55_arg2 ) and IsMenuInState( f55_arg1, "Results" ) then
			CoD.Menu.SetButtonLabel( f55_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsSelfModelValueGreaterThan( f55_arg0, f55_arg2, "itemCODPointCost", 0 ) and IsMenuInState( f55_arg1, "Results" ) then
			CoD.Menu.SetButtonLabel( f55_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MPUI_PURCHASE_CODPOINTS" )
			return true
		else
			CoD.Menu.SetButtonLabel( f55_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		end
	end, true )
	TradeAgainList:subscribeToGlobalModel( controller, "AutoeventsCycled", "cycled", function ( model )
		UpdateDataSource( self, TradeAgainList, controller )
	end )
	self:addElement( TradeAgainList )
	self.TradeAgainList = TradeAgainList
	
	local BMDecryptionBonusKeys = CoD.BM_DecryptionBonusKeys.new( f33_local1, controller )
	BMDecryptionBonusKeys:setLeftRight( true, false, 1095, 1176 )
	BMDecryptionBonusKeys:setTopBottom( true, false, 313, 390 )
	BMDecryptionBonusKeys:subscribeToGlobalModel( controller, "CryptoKeyProgress", "bonusKeysAwarded", function ( model )
		local bonusKeysAwarded = Engine.GetModelValue( model )
		if bonusKeysAwarded then
			BMDecryptionBonusKeys.cryptokeyCount:setText( Engine.Localize( bonusKeysAwarded ) )
		end
	end )
	self:addElement( BMDecryptionBonusKeys )
	self.BMDecryptionBonusKeys = BMDecryptionBonusKeys
	
	local BMDecryptionCrate = CoD.BM_DecryptionCrate.new( f33_local1, controller )
	BMDecryptionCrate:setLeftRight( true, false, 98.43, 177.43 )
	BMDecryptionCrate:setTopBottom( true, false, 266.43, 345.43 )
	BMDecryptionCrate:setScale( 0.6 )
	self:addElement( BMDecryptionCrate )
	self.BMDecryptionCrate = BMDecryptionCrate
	
	local BMDecryptionTradeAgain = CoD.BM_DecryptionTradeAgain.new( f33_local1, controller )
	BMDecryptionTradeAgain:setLeftRight( true, false, 83.82, 200.04 )
	BMDecryptionTradeAgain:setTopBottom( true, false, 351.5, 368.5 )
	self:addElement( BMDecryptionTradeAgain )
	self.BMDecryptionTradeAgain = BMDecryptionTradeAgain
	
	local BMDecryptionNoBundleUses = CoD.BM_DecryptionNoBundleUses.new( f33_local1, controller )
	BMDecryptionNoBundleUses:setLeftRight( true, false, 89.32, 194.54 )
	BMDecryptionNoBundleUses:setTopBottom( true, false, 390, 407 )
	self:addElement( BMDecryptionNoBundleUses )
	self.BMDecryptionNoBundleUses = BMDecryptionNoBundleUses
	
	local DebugLootItemStats = CoD.BM_Debug_LootItemStats.new( f33_local1, controller )
	DebugLootItemStats:setLeftRight( true, false, 382.93, 582.93 )
	DebugLootItemStats:setTopBottom( true, false, 127, 152 )
	self:addElement( DebugLootItemStats )
	self.DebugLootItemStats = DebugLootItemStats
	
	local BMGunMeter0 = CoD.BM_GunMeter.new( f33_local1, controller )
	BMGunMeter0:setLeftRight( true, false, 465, 815 )
	BMGunMeter0:setTopBottom( true, false, 71.5, 172.5 )
	BMGunMeter0:setScale( 0.6 )
	self:addElement( BMGunMeter0 )
	self.BMGunMeter0 = BMGunMeter0
	
	decryptionList.navigation = {
		left = TradeAgainList
	}
	TradeAgainList.navigation = {
		right = decryptionList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 0 )
				self.clipFinished( Screen, {} )
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 0 )
				self.clipFinished( BMLogo, {} )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				TradeAgainBacking:completeAnimation()
				self.TradeAgainBacking:setAlpha( 0 )
				self.clipFinished( TradeAgainBacking, {} )
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 0 )
				self.clipFinished( decryptionList, {} )
				BMTradeAgainFocus:completeAnimation()
				self.BMTradeAgainFocus:setAlpha( 0 )
				self.clipFinished( BMTradeAgainFocus, {} )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
				TradeAgainList:completeAnimation()
				self.TradeAgainList:setAlpha( 0 )
				self.clipFinished( TradeAgainList, {} )
				BMDecryptionCrate:completeAnimation()
				self.BMDecryptionCrate:setAlpha( 0 )
				self.clipFinished( BMDecryptionCrate, {} )
				BMDecryptionTradeAgain:completeAnimation()
				self.BMDecryptionTradeAgain:setAlpha( 0 )
				self.clipFinished( BMDecryptionTradeAgain, {} )
				BMDecryptionNoBundleUses:completeAnimation()
				self.BMDecryptionNoBundleUses:setAlpha( 0 )
				self.clipFinished( BMDecryptionNoBundleUses, {} )
				BMGunMeter0:completeAnimation()
				self.BMGunMeter0:setAlpha( 0 )
				self.clipFinished( BMGunMeter0, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 10 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local ScreenFrame2 = function ( Screen, event )
					if not event.interrupted then
						Screen:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Screen:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Screen, event )
					else
						Screen:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Screen:completeAnimation()
				self.Screen:setAlpha( 0 )
				ScreenFrame2( Screen, {} )
				local BMLogoFrame2 = function ( BMLogo, event )
					if not event.interrupted then
						BMLogo:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					BMLogo:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMLogo, event )
					else
						BMLogo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 0 )
				BMLogoFrame2( BMLogo, {} )
				local feFooterContainerNOTLobbyFrame2 = function ( feFooterContainerNOTLobby, event )
					if not event.interrupted then
						feFooterContainerNOTLobby:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					feFooterContainerNOTLobby:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( feFooterContainerNOTLobby, event )
					else
						feFooterContainerNOTLobby:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				feFooterContainerNOTLobbyFrame2( feFooterContainerNOTLobby, {} )
				TradeAgainBacking:completeAnimation()
				self.TradeAgainBacking:setAlpha( 0 )
				self.clipFinished( TradeAgainBacking, {} )
				local decryptionListFrame2 = function ( decryptionList, event )
					if not event.interrupted then
						decryptionList:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
					end
					decryptionList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( decryptionList, event )
					else
						decryptionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 0 )
				decryptionListFrame2( decryptionList, {} )
				local StartMenuCurrencyCountsFrame2 = function ( StartMenuCurrencyCounts, event )
					if not event.interrupted then
						StartMenuCurrencyCounts:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					StartMenuCurrencyCounts:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( StartMenuCurrencyCounts, event )
					else
						StartMenuCurrencyCounts:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				StartMenuCurrencyCountsFrame2( StartMenuCurrencyCounts, {} )
				TradeAgainList:completeAnimation()
				self.TradeAgainList:setAlpha( 0 )
				self.clipFinished( TradeAgainList, {} )
				BMDecryptionCrate:completeAnimation()
				self.BMDecryptionCrate:setAlpha( 0 )
				self.clipFinished( BMDecryptionCrate, {} )
				BMDecryptionTradeAgain:completeAnimation()
				self.BMDecryptionTradeAgain:setAlpha( 0 )
				self.clipFinished( BMDecryptionTradeAgain, {} )
			end
		},
		Rolling = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
				local BMLogoFrame2 = function ( BMLogo, event )
					if not event.interrupted then
						BMLogo:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BMLogo:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( BMLogo, event )
					else
						BMLogo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 1 )
				BMLogoFrame2( BMLogo, {} )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				TradeAgainBacking:completeAnimation()
				self.TradeAgainBacking:setAlpha( 0 )
				self.clipFinished( TradeAgainBacking, {} )
				local decryptionListFrame2 = function ( decryptionList, event )
					if not event.interrupted then
						decryptionList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					decryptionList:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( decryptionList, event )
					else
						decryptionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 1 )
				decryptionListFrame2( decryptionList, {} )
				BMTradeAgainFocus:completeAnimation()
				self.BMTradeAgainFocus:setAlpha( 0 )
				self.clipFinished( BMTradeAgainFocus, {} )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
				TradeAgainList:completeAnimation()
				self.TradeAgainList:setAlpha( 0 )
				self.clipFinished( TradeAgainList, {} )
				BMDecryptionCrate:completeAnimation()
				self.BMDecryptionCrate:setAlpha( 0 )
				self.clipFinished( BMDecryptionCrate, {} )
				BMDecryptionTradeAgain:completeAnimation()
				self.BMDecryptionTradeAgain:setAlpha( 0 )
				self.clipFinished( BMDecryptionTradeAgain, {} )
				BMDecryptionNoBundleUses:completeAnimation()
				self.BMDecryptionNoBundleUses:setAlpha( 0 )
				self.clipFinished( BMDecryptionNoBundleUses, {} )
				BMGunMeter0:completeAnimation()
				self.BMGunMeter0:setAlpha( 0 )
				self.clipFinished( BMGunMeter0, {} )
				self.nextClip = "DefaultClip"
			end,
			Results = function ()
				self:setupElementClipCounter( 10 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
				local BMLogoFrame2 = function ( BMLogo, event )
					if not event.interrupted then
						BMLogo:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BMLogo:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( BMLogo, event )
					else
						BMLogo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 1 )
				BMLogoFrame2( BMLogo, {} )
				local feFooterContainerNOTLobbyFrame2 = function ( feFooterContainerNOTLobby, event )
					local feFooterContainerNOTLobbyFrame3 = function ( feFooterContainerNOTLobby, event )
						if not event.interrupted then
							feFooterContainerNOTLobby:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						end
						feFooterContainerNOTLobby:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( feFooterContainerNOTLobby, event )
						else
							feFooterContainerNOTLobby:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						feFooterContainerNOTLobbyFrame3( feFooterContainerNOTLobby, event )
						return 
					else
						feFooterContainerNOTLobby:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						feFooterContainerNOTLobby:setAlpha( 1 )
						feFooterContainerNOTLobby:registerEventHandler( "transition_complete_keyframe", feFooterContainerNOTLobbyFrame3 )
					end
				end
				
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				feFooterContainerNOTLobbyFrame2( feFooterContainerNOTLobby, {} )
				local TradeAgainBackingFrame2 = function ( TradeAgainBacking, event )
					if not event.interrupted then
						TradeAgainBacking:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TradeAgainBacking:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TradeAgainBacking, event )
					else
						TradeAgainBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TradeAgainBacking:completeAnimation()
				self.TradeAgainBacking:setAlpha( 0 )
				TradeAgainBackingFrame2( TradeAgainBacking, {} )
				local decryptionListFrame2 = function ( decryptionList, event )
					if not event.interrupted then
						decryptionList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					decryptionList:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( decryptionList, event )
					else
						decryptionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 1 )
				decryptionListFrame2( decryptionList, {} )
				local StartMenuCurrencyCountsFrame2 = function ( StartMenuCurrencyCounts, event )
					local StartMenuCurrencyCountsFrame3 = function ( StartMenuCurrencyCounts, event )
						if not event.interrupted then
							StartMenuCurrencyCounts:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						StartMenuCurrencyCounts:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( StartMenuCurrencyCounts, event )
						else
							StartMenuCurrencyCounts:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						StartMenuCurrencyCountsFrame3( StartMenuCurrencyCounts, event )
						return 
					else
						StartMenuCurrencyCounts:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						StartMenuCurrencyCounts:setAlpha( 1 )
						StartMenuCurrencyCounts:registerEventHandler( "transition_complete_keyframe", StartMenuCurrencyCountsFrame3 )
					end
				end
				
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				StartMenuCurrencyCountsFrame2( StartMenuCurrencyCounts, {} )
				local TradeAgainListFrame2 = function ( TradeAgainList, event )
					if not event.interrupted then
						TradeAgainList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TradeAgainList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TradeAgainList, event )
					else
						TradeAgainList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TradeAgainList:completeAnimation()
				self.TradeAgainList:setAlpha( 0 )
				TradeAgainListFrame2( TradeAgainList, {} )
				local BMDecryptionCrateFrame2 = function ( BMDecryptionCrate, event )
					if not event.interrupted then
						BMDecryptionCrate:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BMDecryptionCrate:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMDecryptionCrate, event )
					else
						BMDecryptionCrate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDecryptionCrate:completeAnimation()
				self.BMDecryptionCrate:setAlpha( 0 )
				BMDecryptionCrateFrame2( BMDecryptionCrate, {} )
				local BMDecryptionTradeAgainFrame2 = function ( BMDecryptionTradeAgain, event )
					if not event.interrupted then
						BMDecryptionTradeAgain:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BMDecryptionTradeAgain:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMDecryptionTradeAgain, event )
					else
						BMDecryptionTradeAgain:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDecryptionTradeAgain:completeAnimation()
				self.BMDecryptionTradeAgain:setAlpha( 0 )
				BMDecryptionTradeAgainFrame2( BMDecryptionTradeAgain, {} )
			end
		},
		Results = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
				local BMLogoFrame2 = function ( BMLogo, event )
					if not event.interrupted then
						BMLogo:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BMLogo:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( BMLogo, event )
					else
						BMLogo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 1 )
				BMLogoFrame2( BMLogo, {} )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 1 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				local TradeAgainBackingFrame2 = function ( TradeAgainBacking, event )
					if not event.interrupted then
						TradeAgainBacking:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TradeAgainBacking:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( TradeAgainBacking, event )
					else
						TradeAgainBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TradeAgainBacking:completeAnimation()
				self.TradeAgainBacking:setAlpha( 1 )
				TradeAgainBackingFrame2( TradeAgainBacking, {} )
				local decryptionListFrame2 = function ( decryptionList, event )
					if not event.interrupted then
						decryptionList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					decryptionList:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( decryptionList, event )
					else
						decryptionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 1 )
				decryptionListFrame2( decryptionList, {} )
				BMTradeAgainFocus:completeAnimation()
				self.BMTradeAgainFocus:setAlpha( 1 )
				self.clipFinished( BMTradeAgainFocus, {} )
				local StartMenuCurrencyCountsFrame2 = function ( StartMenuCurrencyCounts, event )
					if not event.interrupted then
						StartMenuCurrencyCounts:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					StartMenuCurrencyCounts:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( StartMenuCurrencyCounts, event )
					else
						StartMenuCurrencyCounts:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 1 )
				StartMenuCurrencyCountsFrame2( StartMenuCurrencyCounts, {} )
				local TradeAgainListFrame2 = function ( TradeAgainList, event )
					if not event.interrupted then
						TradeAgainList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TradeAgainList:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( TradeAgainList, event )
					else
						TradeAgainList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TradeAgainList:completeAnimation()
				self.TradeAgainList:setAlpha( 1 )
				TradeAgainListFrame2( TradeAgainList, {} )
				local BMDecryptionCrateFrame2 = function ( BMDecryptionCrate, event )
					if not event.interrupted then
						BMDecryptionCrate:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BMDecryptionCrate:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( BMDecryptionCrate, event )
					else
						BMDecryptionCrate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDecryptionCrate:completeAnimation()
				self.BMDecryptionCrate:setAlpha( 1 )
				BMDecryptionCrateFrame2( BMDecryptionCrate, {} )
				local BMDecryptionTradeAgainFrame2 = function ( BMDecryptionTradeAgain, event )
					if not event.interrupted then
						BMDecryptionTradeAgain:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BMDecryptionTradeAgain:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMDecryptionTradeAgain, event )
					else
						BMDecryptionTradeAgain:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDecryptionTradeAgain:completeAnimation()
				self.BMDecryptionTradeAgain:setAlpha( 1 )
				BMDecryptionTradeAgainFrame2( BMDecryptionTradeAgain, {} )
				BMDecryptionNoBundleUses:completeAnimation()
				self.BMDecryptionNoBundleUses:setAlpha( 1 )
				self.clipFinished( BMDecryptionNoBundleUses, {} )
			end,
			Reroll = function ()
				self:setupElementClipCounter( 10 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 1 )
				self.clipFinished( BMLogo, {} )
				local feFooterContainerNOTLobbyFrame2 = function ( feFooterContainerNOTLobby, event )
					if not event.interrupted then
						feFooterContainerNOTLobby:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					feFooterContainerNOTLobby:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( feFooterContainerNOTLobby, event )
					else
						feFooterContainerNOTLobby:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 1 )
				feFooterContainerNOTLobbyFrame2( feFooterContainerNOTLobby, {} )
				local TradeAgainBackingFrame2 = function ( TradeAgainBacking, event )
					if not event.interrupted then
						TradeAgainBacking:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TradeAgainBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TradeAgainBacking, event )
					else
						TradeAgainBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TradeAgainBacking:completeAnimation()
				self.TradeAgainBacking:setAlpha( 1 )
				TradeAgainBackingFrame2( TradeAgainBacking, {} )
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 1 )
				self.clipFinished( decryptionList, {} )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 1 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
				local TradeAgainListFrame2 = function ( TradeAgainList, event )
					if not event.interrupted then
						TradeAgainList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TradeAgainList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TradeAgainList, event )
					else
						TradeAgainList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TradeAgainList:completeAnimation()
				self.TradeAgainList:setAlpha( 1 )
				TradeAgainListFrame2( TradeAgainList, {} )
				local BMDecryptionCrateFrame2 = function ( BMDecryptionCrate, event )
					if not event.interrupted then
						BMDecryptionCrate:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BMDecryptionCrate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BMDecryptionCrate, event )
					else
						BMDecryptionCrate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDecryptionCrate:completeAnimation()
				self.BMDecryptionCrate:setAlpha( 1 )
				BMDecryptionCrateFrame2( BMDecryptionCrate, {} )
				local BMDecryptionTradeAgainFrame2 = function ( BMDecryptionTradeAgain, event )
					if not event.interrupted then
						BMDecryptionTradeAgain:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BMDecryptionTradeAgain:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BMDecryptionTradeAgain, event )
					else
						BMDecryptionTradeAgain:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDecryptionTradeAgain:completeAnimation()
				self.BMDecryptionTradeAgain:setAlpha( 1 )
				BMDecryptionTradeAgainFrame2( BMDecryptionTradeAgain, {} )
			end
		},
		Reroll = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 0.95 )
				self.clipFinished( BMLogo, {} )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				TradeAgainBacking:completeAnimation()
				self.TradeAgainBacking:setAlpha( 0 )
				self.clipFinished( TradeAgainBacking, {} )
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 0.95 )
				self.clipFinished( decryptionList, {} )
				BMTradeAgainFocus:completeAnimation()
				self.BMTradeAgainFocus:setAlpha( 0 )
				self.clipFinished( BMTradeAgainFocus, {} )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
				TradeAgainList:completeAnimation()
				self.TradeAgainList:setAlpha( 0 )
				self.clipFinished( TradeAgainList, {} )
				BMDecryptionCrate:completeAnimation()
				self.BMDecryptionCrate:setAlpha( 0 )
				self.clipFinished( BMDecryptionCrate, {} )
				BMDecryptionTradeAgain:completeAnimation()
				self.BMDecryptionTradeAgain:setAlpha( 0 )
				self.clipFinished( BMDecryptionTradeAgain, {} )
				BMDecryptionNoBundleUses:completeAnimation()
				self.BMDecryptionNoBundleUses:setAlpha( 0 )
				self.clipFinished( BMDecryptionNoBundleUses, {} )
				BMGunMeter0:completeAnimation()
				self.BMGunMeter0:setAlpha( 0 )
				self.clipFinished( BMGunMeter0, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 10 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				local BMLogoFrame2 = function ( BMLogo, event )
					if not event.interrupted then
						BMLogo:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					BMLogo:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMLogo, event )
					else
						BMLogo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 1 )
				BMLogoFrame2( BMLogo, {} )
				local feFooterContainerNOTLobbyFrame2 = function ( feFooterContainerNOTLobby, event )
					if not event.interrupted then
						feFooterContainerNOTLobby:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					feFooterContainerNOTLobby:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( feFooterContainerNOTLobby, event )
					else
						feFooterContainerNOTLobby:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				feFooterContainerNOTLobbyFrame2( feFooterContainerNOTLobby, {} )
				TradeAgainBacking:completeAnimation()
				self.TradeAgainBacking:setAlpha( 0 )
				self.clipFinished( TradeAgainBacking, {} )
				local decryptionListFrame2 = function ( decryptionList, event )
					if not event.interrupted then
						decryptionList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					decryptionList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( decryptionList, event )
					else
						decryptionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 0 )
				decryptionListFrame2( decryptionList, {} )
				BMTradeAgainFocus:completeAnimation()
				self.BMTradeAgainFocus:setAlpha( 0 )
				self.clipFinished( BMTradeAgainFocus, {} )
				StartMenuCurrencyCounts:completeAnimation()
				self.StartMenuCurrencyCounts:setAlpha( 0 )
				self.clipFinished( StartMenuCurrencyCounts, {} )
				TradeAgainList:completeAnimation()
				self.TradeAgainList:setAlpha( 0 )
				self.clipFinished( TradeAgainList, {} )
				BMDecryptionCrate:completeAnimation()
				self.BMDecryptionCrate:setAlpha( 0 )
				self.clipFinished( BMDecryptionCrate, {} )
				BMDecryptionTradeAgain:completeAnimation()
				self.BMDecryptionTradeAgain:setAlpha( 0 )
				self.clipFinished( BMDecryptionTradeAgain, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( f33_local1, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f99_local0 = nil
		if not IsPerControllerTablePropertyValue( controller, "supplyDropQuickAnim", true ) then
			SetMenuState( f33_local1, "DefaultState" )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "Hide"
			}, controller )
		else
			SetMenuState( f33_local1, "Reroll" )
			SetElementPropertyByElementName( self, "decryptionList", "m_focusable", false )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "Hide"
			}, controller )
			UpdateAllMenuButtonPrompts( f33_local1, controller )
		end
		if not f99_local0 then
			f99_local0 = element:dispatchEventToChildren( event )
		end
		return f99_local0
	end )
	f33_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f100_arg0, f100_arg1, f100_arg2, f100_arg3 )
		if IsMenuInState( f100_arg1, "Results" ) then
			GoBack( self, f100_arg2 )
			ClearMenuSavedState( f100_arg1 )
			return true
		else
			
		end
	end, function ( f101_arg0, f101_arg1, f101_arg2 )
		if IsMenuInState( f101_arg1, "Results" ) then
			CoD.Menu.SetButtonLabel( f101_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptNotify( controller, "BlackMarket", "normal_camera" )
		BlackMarketResultsOnClose( self, element, controller )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfInState( self, "Results" ) then
			CheckAndShowBonusCryptoKeys( self, controller )
			CheckAndShowGunMeter( self, controller, f33_local1 )
		end
	end )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	decryptionList.id = "decryptionList"
	TradeAgainList.id = "TradeAgainList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f33_local1
	} )
	if not self:restoreState() then
		self.decryptionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.SelfIdentityBadge:close()
		element.BMLogo:close()
		element.feFooterContainerNOTLobby:close()
		element.decryptionList:close()
		element.BMTradeAgainFocus:close()
		element.StartMenuCurrencyCounts:close()
		element.TradeAgainList:close()
		element.BMDecryptionBonusKeys:close()
		element.BMDecryptionCrate:close()
		element.BMDecryptionTradeAgain:close()
		element.BMDecryptionNoBundleUses:close()
		element.DebugLootItemStats:close()
		element.BMGunMeter0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BM_Decryption.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

