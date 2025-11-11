require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketSafeAreaContainer" )
require( "ui.uieditor.widgets.BlackMarket.BM_Description" )
require( "ui.uieditor.widgets.BlackMarket.BM_Promo" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )

local GoBackAndPurchaseCodpointsAction = function ( self, element, controller, actionParam, menu )
	GoBackAndOpenOverlayOnParent( menu, "Store_CodPoints", controller )
end

local PurchaseCodpointsAction = function ( self, element, controller, actionParam, menu )
	OpenOverlay( menu, "Store_CodPoints", controller )
end

CoD.OverlayUtility.AddSystemOverlay( "PurchaseSupplyDropConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_BlackMarket",
	title = function ( controller, params )
		if (params.itemCODPointCost == 0 or Engine.GetCoDPoints( controller ) < params.itemCODPointCost) and (params.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) < params.itemCost) then
			return "MPUI_BM_NO_CURRENCY"
		elseif params.again then
			return Engine.Localize( "MENU_PURCHASE_CONFIRMAITON" )
		else
			return Engine.ToUpper( Engine.Localize( params.displayText ) )
		end
	end,
	description = function ( controller, params )
		if params.again then
			return params.displayText
		elseif params.itemCODPointCost > 0 and Engine.GetCoDPoints( controller ) < params.itemCODPointCost and (params.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) < params.itemCost) then
			return Engine.Localize( "MPUI_BM_NO_CURRENCY_DESCRIPTION", params.displayText )
		elseif params.itemCODPointCost == 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) < params.itemCost then
			return Engine.Localize( "MPUI_BM_NEED_CRYPTOKEYS_PLAY_GAMES" )
		elseif params.itemCODPointCost == 0 then
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_KEYS_TEXT", params.displayText )
		elseif params.itemCost == 0 then
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_CODPOINTS_TEXT", params.displayText )
		else
			return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_TEXT", params.displayText )
		end
	end,
	image = function ( controller, params )
		return params.image
	end,
	cost = function ( controller, params )
		return params.itemCost
	end,
	codpointcost = function ( controller, params )
		return params.itemCODPointCost
	end,
	["cryptoKeyType.rarity"] = function ( controller, params )
		return CoD.BlackMarketUtility.GetCrateTypeString( params.supplyDropType )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "PurchaseSupplyDrop",
	listDatasource = function ( controller, params )
		DataSources.PurchaseSupplyDropMenuList = DataSourceHelpers.ListSetup( "PurchaseSupplyDropMenuList", function ( controller )
			local list = {}
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
			
			local TradeForCrateAction = function ( self, element, controller, actionParam, menu, currency )
				local BlackMarketMenu = GoBack( menu, controller )
				if Engine.BuyLootCrate( controller, actionParam.supplyDropType, currency ) == false then
					LuaUtils.UI_ShowErrorMessageDialog( controller, "MPUI_BM_CRATE_PURCHASED_FAILED", "" )
				else
					CoD.perController[controller].cryptokeysToSpend = actionParam.itemCost
					CoD.perController[controller].supplyDropType = actionParam.supplyDropType
					if currency == Enum.InventoryCurrency.INVENTORY_CURRENCY_COD_POINTS then
						CoD.perController[controller].codPointsSpent = actionParam.itemCODPointCost
					else
						CoD.perController[controller].codPointsSpent = 0
					end
					if actionParam.again then
						BlackMarketMenu = GoBack( BlackMarketMenu, controller )
						CoD.perController[controller].supplyDropQuickAnim = true
					else
						Engine.SendClientScriptNotify( controller, "BlackMarket", {
							param1 = "crate_camera",
							param2 = CoD.BlackMarketUtility.CrateTypeIds[actionParam.supplyDropType]
						} )
						SendFrontendControllerZeroMenuResponse( controller, "BlackMarket", "roll" )
						Engine.PlaySound( "uin_bm_camera_pan" )
						CoD.perController[controller].supplyDropQuickAnim = false
					end
					OpenOverlay( BlackMarketMenu, "BM_Decryption", controller )
				end
			end
			
			local TradeCryptoKeyAction = function ( self, element, controller, actionParam, menu )
				TradeForCrateAction( self, element, controller, actionParam, menu, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_CRYPTO_KEYS )
			end
			
			local TradeCODPointAction = function ( self, element, controller, actionParam, menu )
				TradeForCrateAction( self, element, controller, actionParam, menu, Enum.InventoryCurrency.INVENTORY_CURRENCY_COD_POINTS )
			end
			
			local CancelPurchaseAction = function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end
			
			if params.itemCODPointCost > 0 and Engine.GetCoDPoints( controller ) < params.itemCODPointCost and (params.itemCost == 0 or CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) < params.itemCost) then
				table.insert( list, addItemListButton( "MPUI_PURCHASE_CODPOINTS_CAPS", GoBackAndPurchaseCodpointsAction, true, false ) )
				table.insert( list, addItemListButton( "MENU_CANCEL_CAPS", CancelPurchaseAction, false, false ) )
			elseif params.itemCODPointCost == 0 and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) < params.itemCost then
				table.insert( list, addItemListButton( "MENU_CONTINUE_CAPS", CancelPurchaseAction, false, false ) )
			else
				if params.itemCost > 0 then
					table.insert( list, addItemListButton( Engine.Localize( "MPUI_BM_TRADE_CRYPTOKEYS", params.itemCost ), TradeCryptoKeyAction, true, CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) < params.itemCost ) )
				end
				if params.itemCODPointCost > 0 then
					table.insert( list, addItemListButton( Engine.Localize( "MPUI_BM_TRADE_COD_POINTS", params.itemCODPointCost ), TradeCODPointAction, false, Engine.GetCoDPoints( controller ) < params.itemCODPointCost ) )
				end
				table.insert( list, addItemListButton( "MENU_CANCEL_CAPS", CancelPurchaseAction, false, false ) )
			end
			return list
		end, true )
		return "PurchaseSupplyDropMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "BurnDuplicatesConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_BlackMarket",
	title = function ( controller, burnCount )
		if burnCount == nil or burnCount == -1 then
			return Engine.Localize( "MPUI_BM_BURN_CONFIRMATION_NODUPES" )
		else
			return Engine.Localize( "MPUI_BM_BURN_CONFIRMATION" )
		end
	end,
	description = function ( controller, burnCount )
		if burnCount == nil or burnCount == -1 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_NO_DUPLICATES" )
		elseif burnCount == 0 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_NONE" )
		elseif burnCount == 1 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_ONE" )
		else
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_MULTIPLE", burnCount )
		end
	end,
	image = "uie_t7_blackmarket_bribe",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "BurnDuplicates",
	totalDuplicates = CoD.BlackMarketUtility.GetNumDupesTotal,
	commonDuplicates = function ( controller )
		return CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON )
	end,
	rareDuplicates = function ( controller )
		return CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE )
	end,
	legendaryDuplicates = function ( controller )
		return CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY )
	end,
	epicDuplicates = function ( controller )
		return CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
	end,
	listDatasource = function ( controller )
		DataSources.BurnDuplicatesMenuList = DataSourceHelpers.ListSetup( "BurnDuplicatesMenuList", function ( controller, list )
			local buttonsList = {}
			local addItemListButton = function ( displayText, action, selected )
				return {
					models = {
						displayText = displayText
					},
					properties = {
						action = action,
						selectIndex = selected
					}
				}
			end
			
			local showOnlyOK = list.finishedBurningDuplicates
			if not showOnlyOK and CoD.BlackMarketUtility.GetNumDupesTotal( controller ) == 0 and not list.isBurningDuplicates then
				showOnlyOK = true
			end
			if showOnlyOK then
				local CloseAction = function ( self, element, controller, actionParam, menu )
					GoBack( menu, controller )
				end
				
				local f23_local0 = {}
				return addItemListButton( "MENU_OK_CAPS", CloseAction, true )
			elseif list.isBurningDuplicates then
				return {}
			end
			local BurnDuplicatesAction = function ( self, element, controller, actionParam, menu )
				if list.isBurningDuplicates then
					return 
				elseif Engine.BurnLootDuplicates == nil or not Engine.BurnLootDuplicates( controller, Enum.eModes.MODE_MULTIPLAYER ) then
					GoBack( menu, controller )
					LuaUtils.UI_ShowErrorMessageDialog( controller, "MPUI_BM_BURN_DUPLICATES_FAILED", "" )
					return 
				end
				list.isBurningDuplicates = true
				menu[CoD.OverlayUtility.GoBackPropertyName] = nil
				list.disabled = true
				self:setState( "BurningDuplicates" )
				self.BurningDuplicatesAnimation:playClip( "StartBurning" )
				self.BurningDuplicatesAnimation.nextClip = "Burning"
				list:updateDataSource( true )
				CoD.Menu.UpdateAllButtonPrompts( menu, controller )
				local lootXPBeforeMatch = CoD.BlackMarketUtility.GetProgressTowardNextKey( controller ) * CoD.BlackMarketUtility.XPPerCryptoKey
				local commonDupeCount = CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON )
				local rareDupeCount = CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE )
				local legendaryDupeCount = CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY )
				local epicDupeCount = CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
				local finalXP = lootXPBeforeMatch + CoD.BlackMarketUtility.GetXPEarnedForBurning( controller, commonDupeCount, rareDupeCount, legendaryDupeCount, epicDupeCount )
				if Dvar.ui_cryptocommondupes:exists() then
					Dvar.ui_cryptocommondupes:set( 0 )
					Dvar.ui_cryptoraredupes:set( 0 )
					Dvar.ui_cryptolegendarydupes:set( 0 )
					Dvar.ui_cryptoepicdupes:set( 0 )
				end
				Engine.PlaySound( "uin_bm_keyburn_loop" )
				self.BurningDuplicatesAnimation:registerEventHandler( "clip_over", function ( element, event )
					local burnState = Engine.GetBurnDupeState()
					if Engine.IsInventoryBusy( controller ) or burnState == Enum.LootBurnDupeState.LOOT_BURN_DUPE_REQUESTED or burnState == Enum.LootBurnDupeState.LOOT_BURN_DUPE_BUSY then
						Engine.PlaySound( "uin_bm_keyburn_loop" )
						LUI.UIElement.clipOver( element, event )
					else
						Engine.PlaySound( "uin_bm_keyburn_loop" )
						element:playClip( "StopBurning" )
						element:registerEventHandler( "clip_over", function ( element, event )
							Engine.PlaySound( "uin_bm_keyburn_done" )
							element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
							list.finishedBurningDuplicates = true
							menu[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
							list.disabled = false
							CoD.Menu.UpdateAllButtonPrompts( menu, controller )
							if burnState == Enum.LootBurnDupeState.LOOT_BURN_DUPE_FAILED then
								GoBack( menu, controller )
								LuaUtils.UI_ShowErrorMessageDialog( controller, "MPUI_BM_BURN_DUPLICATES_FAILED", "" )
								return 
							end
							self:setState( "BurnedDuplicates" )
							local numEarned = math.floor( finalXP / CoD.BlackMarketUtility.XPPerCryptoKey )
							local f28_local0 = self.textForBurning.text
							local f28_local1 = f28_local0
							f28_local0 = f28_local0.setText
							local f28_local2 = Engine.Localize
							local f28_local3
							if numEarned == 1 then
								f28_local3 = "MPUI_BM_BURNED_DESC_EARNED_ONE"
								if not f28_local3 then
								
								else
									f28_local0( f28_local1, f28_local2( f28_local3, numEarned ) )
									list:updateDataSource()
								end
							end
							f28_local3 = "MPUI_BM_BURNED_DESC"
						end )
					end
				end )
				SendFrontendControllerZeroMenuResponse( controller, "BlackMarket", "burn_duplicates" )
			end
			
			local CancelAction = function ( self, element, controller, actionParam, menu )
				if list.isBurningDuplicates then
					return 
				else
					GoBack( menu, controller )
				end
			end
			
			if Dvar.tu4_burnDuplicates:exists() and (Dvar.tu4_burnDuplicates:get() == true or Dvar.tu4_burnDuplicates:get() == "1") then
				table.insert( buttonsList, addItemListButton( "MPUI_BURN_DUPLICATES_CAPS", BurnDuplicatesAction, false ) )
			end
			table.insert( buttonsList, addItemListButton( "MENU_CANCEL_CAPS", CancelAction, true ) )
			return buttonsList
		end, true )
		return "BurnDuplicatesMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
local BlackMarketCryptoKeyListPrepare = function ( controller )
	local list = {}
	local addItemListButton = function ( displayText, image, focusImage, hintText, itemCost, itemCODPointCost, action, supplyDropType )
		if hintText == "MPUI_BM_RARE_KEY_HINT_TEXT" and Dvar.tu4_enableBonusCryptokeysHint:exists() and Dvar.tu4_enableBonusCryptokeysHint:get() == false then
			hintText = "MPUI_BM_RARE_KEY_HINT_TEXT_NOBONUS"
		end
		return {
			models = {
				displayText = displayText,
				image = image,
				hintText = hintText,
				itemCount = itemCost,
				itemCODPointCost = itemCODPointCost
			},
			properties = {
				action = action,
				supplyDropType = supplyDropType,
				actionParam = {
					displayText = displayText,
					image = focusImage,
					itemCost = itemCost,
					itemCODPointCost = itemCODPointCost,
					supplyDropType = supplyDropType
				}
			}
		}
	end
	
	local CryptoKeyAction = function ( self, element, controller, actionParam, menu )
		CoD.OverlayUtility.CreateOverlay( controller, self, "PurchaseSupplyDropConfirmation", controller, actionParam )
	end
	
	table.insert( list, addItemListButton( "MPUI_BM_COMMON_DROP", "t7_blackmarket_crate_common", "uie_t7_blackmarket_crate_common_focus", "MPUI_BM_COMMON_KEY_HINT_TEXT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.COMMON ), CryptoKeyAction, CoD.BlackMarketUtility.DropTypes.COMMON ) )
	table.insert( list, addItemListButton( "MPUI_BM_RARE_DROP", "t7_blackmarket_crate_rare", "uie_t7_blackmarket_crate_rare_focus", "MPUI_BM_RARE_KEY_HINT_TEXT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.RARE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.RARE ), CryptoKeyAction, CoD.BlackMarketUtility.DropTypes.RARE ) )
	if AreCodPointsEnabled( controller ) then
		local bribeId = Dvar.loot_bribeCrate_dwid:get()
		if CoD.BlackMarketUtility.BribeStrings[bribeId] ~= nil then
			local title = CoD.BlackMarketUtility.BribeStrings[bribeId]
			local image = CoD.BlackMarketUtility.BribeImages[bribeId]
			local hint = CoD.BlackMarketUtility.BribeHints[bribeId]
			table.insert( list, addItemListButton( title, image, image .. "_hover", hint, CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.BRIBE ), CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.BlackMarketUtility.DropTypes.BRIBE ), CryptoKeyAction, CoD.BlackMarketUtility.DropTypes.BRIBE ) )
		end
	end
	return list
end

DataSources.BlackMarketCryptokeyList = DataSourceHelpers.ListSetup( "BlackMarketCryptokeyList", BlackMarketCryptoKeyListPrepare, true )
DataSources.BlackMarketCryptokeyList.getWidgetTypeForItem = function ( list, dataItemModel, row, column )
	if list.BlackMarketCryptokeyList[column].properties then
		local isBribeCoin = list.BlackMarketCryptokeyList[column].properties.isBribeCoin
		if isBribeCoin then
			return CoD.BribeCoinWidget
		else
			return CoD.CryptokeyWidget
		end
	else
		return nil
	end
end

local BlackMarketListPrepare = function ( controller )
	local list = {}
	local addItemListButton = function ( displayText, action, hintText, disabled )
		return {
			models = {
				displayText = displayText,
				hintText = hintText,
				disabled = disabled
			},
			properties = {
				action = action
			}
		}
	end
	
	local BurnDuplicatesAction = function ( self, element, controller, actionParam, menu )
		local progressPct = CoD.BlackMarketUtility.GetProgressTowardNextKey( controller )
		local commonDupeCount = CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON )
		local rareDupeCount = CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE )
		local legendaryDupeCount = CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY )
		local epicDupeCount = CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
		local earnCount = CoD.BlackMarketUtility.GetNumKeysEarnedForBurning( controller, commonDupeCount, rareDupeCount, legendaryDupeCount, epicDupeCount )
		if commonDupeCount + rareDupeCount + legendaryDupeCount + epicDupeCount == 0 then
			earnCount = -1
		end
		CoD.OverlayUtility.CreateOverlay( controller, self, "BurnDuplicatesConfirmation", controller, earnCount, commonDupeCount, rareDupeCount, legendaryDupeCount, epicDupeCount )
	end
	
	local RecentlyAcquiredAction = function ( self, element, controller, actionParam, menu )
		OpenOverlay( menu, "BM_History", controller )
	end
	
	local disableStoreButton = false
	if Dvar.tu4_enableCodPoints:get() then
		local f34_local0 = table.insert
		local f34_local1 = list
		local f34_local2 = addItemListButton
		local f34_local3 = "MPUI_PURCHASE_CODPOINTS_CAPS"
		local f34_local4 = PurchaseCodpointsAction
		local f34_local5
		if disableStoreButton then
			f34_local5 = "MPUI_BM_STORE_DISABLED_HELP"
			if not f34_local5 then
			
			else
				f34_local0( f34_local1, f34_local2( f34_local3, f34_local4, f34_local5, disableStoreButton ) )
			end
		end
		f34_local5 = "MPUI_BM_STORE_HELP"
	end
	local itemCount = Engine.GetLootItemCount( controller, Enum.eModes.MODE_MULTIPLAYER )
	if itemCount ~= nil and itemCount > 0 then
		table.insert( list, addItemListButton( "MPUI_RECENTLY_ACQUIRED_CAPS", RecentlyAcquiredAction, "MPUI_BM_RECENTLY_ACQUIRED_HELP" ) )
	end
	if Dvar.tu4_burnDuplicates:exists() and (Dvar.tu4_burnDuplicates:get() == true or Dvar.tu4_burnDuplicates:get() == "1") then
		table.insert( list, addItemListButton( "MPUI_BURN_DUPLICATES_CAPS", BurnDuplicatesAction, "MPUI_BM_BURN_DUPLICATE_HELP" ) )
	end
	return list
end

DataSources.BlackMarketList = DataSourceHelpers.ListSetup( "BlackMarketList", BlackMarketListPrepare, true )
local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GameSettingsFlyoutOpen" ), false )
end

local PostLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
	if CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) >= CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON ) then
		SendFrontendControllerZeroMenuResponse( controller, "BlackMarket", "greeting" )
	else
		SendFrontendControllerZeroMenuResponse( controller, "BlackMarket", "greeting_broke" )
	end
	local currentStats = CoD.GetPlayerStats( controller )
	if currentStats then
		currentStats.blackMarketShowBreadcrumb:set( 0 )
	end
end

LUI.createMenu.BlackMarket = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BlackMarket" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BlackMarket.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
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
	FadeForStreamer:setLeftRight( 0, 0, 0, 1920 )
	FadeForStreamer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BLACK_MARKET" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local buttonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( 0, 0, 151, 467 )
	buttonList:setTopBottom( 0, 0, 558, 772 )
	buttonList:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	buttonList:setVerticalCount( 3 )
	buttonList:setDataSource( "BlackMarketList" )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "DefaultState" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "NotVisible" )
		return retVal
	end )
	self:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local cryptokeyList = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	cryptokeyList:makeFocusable()
	cryptokeyList:setLeftRight( 0, 0, 100, 1084 )
	cryptokeyList:setTopBottom( 0, 0, 201, 501 )
	cryptokeyList:setWidgetType( CoD.CryptokeyWidget )
	cryptokeyList:setHorizontalCount( 4 )
	cryptokeyList:setSpacing( 8 )
	cryptokeyList:setDataSource( "BlackMarketCryptokeyList" )
	cryptokeyList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	cryptokeyList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( cryptokeyList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, true )
	self:addElement( cryptokeyList )
	self.cryptokeyList = cryptokeyList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 126, 1052 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local burnDuplicatesHint = CoD.BM_Description.new( self, controller )
	burnDuplicatesHint:setLeftRight( 0, 0, 102, 870 )
	burnDuplicatesHint:setTopBottom( 0, 0, 749.5, 782.5 )
	self:addElement( burnDuplicatesHint )
	self.burnDuplicatesHint = burnDuplicatesHint
	
	local DescTitle = LUI.UITightText.new()
	DescTitle:setLeftRight( 0, 0, 103, 577 )
	DescTitle:setTopBottom( 0, 0, 159, 189 )
	DescTitle:setAlpha( 0.75 )
	DescTitle:setText( Engine.Localize( "MPUI_BLACK_MARKET_DESC" ) )
	DescTitle:setTTF( "fonts/escom.ttf" )
	DescTitle:setLetterSpacing( 0.85 )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	local BlackMarketSafeAreaContainer = CoD.BlackMarketSafeAreaContainer.new( self, controller )
	BlackMarketSafeAreaContainer:setLeftRight( 0, 0, 0, 1920 )
	BlackMarketSafeAreaContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( BlackMarketSafeAreaContainer )
	self.BlackMarketSafeAreaContainer = BlackMarketSafeAreaContainer
	
	local BMPromo = CoD.BM_Promo.new( self, controller )
	BMPromo:setLeftRight( 0, 0, 0, 447 )
	BMPromo:setTopBottom( 0, 0, 784, 1014 )
	BMPromo:setScale( 0.65 )
	self:addElement( BMPromo )
	self.BMPromo = BMPromo
	
	burnDuplicatesHint:linkToElementModel( buttonList, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			burnDuplicatesHint.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	buttonList.navigation = {
		up = cryptokeyList
	}
	cryptokeyList.navigation = {
		down = buttonList
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetElementStateByElementName( self, "GenericMenuFrame", controller, "Update" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "NotVisible" )
		PlayClipOnElement( self, {
			elementName = "FEMenuLeftGraphics",
			clipName = "Intro"
		}, controller )
		OpenCODPointsIntro( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		HandleGoBackFromBlackMarket( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendFrontendControllerZeroMenuResponse( controller, "BlackMarket", "closed" )
		CommitProfileChanges( controller )
		ForceLobbyButtonUpdate( controller )
		SendClientScriptNotify( controller, "BlackMarket", "cycle_stop" )
		ValidateMPLootWeapons( controller )
	end )
	GenericMenuFrame:setModel( self.buttonModel, controller )
	buttonList.id = "buttonList"
	cryptokeyList.id = "cryptokeyList"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FadeForStreamer:close()
		self.GenericMenuFrame:close()
		self.buttonList:close()
		self.cryptokeyList:close()
		self.FEMenuLeftGraphics:close()
		self.burnDuplicatesHint:close()
		self.BlackMarketSafeAreaContainer:close()
		self.BMPromo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BlackMarket.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

