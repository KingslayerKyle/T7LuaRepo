require( "ui.uieditor.menus.Store.Store_CodPoints" )
require( "ui.uieditor.widgets.BlackMarket.BlackMarketTradeAgainListItem" )
require( "ui.uieditor.widgets.BlackMarket.BM_DecryptionBonusKeys" )
require( "ui.uieditor.widgets.BlackMarket.BM_DecryptionCrate" )
require( "ui.uieditor.widgets.BlackMarket.BM_DecryptionTradeAgain" )
require( "ui.uieditor.widgets.BlackMarket.BM_Logo" )
require( "ui.uieditor.widgets.BlackMarket.BM_TradeAgainFocus" )
require( "ui.uieditor.widgets.BlackMarket.LootDecryptionWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )

local IncrementTestIndex = function ()
	local index = Dvar.loot_testIndex:get()
	local id = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, index + 1, 1 )
	if id == nil or id == "" then
		index = 0
	else
		index = index + 1
	end
	Dvar.loot_testIndex:set( index )
end

local swap = function ( array, index1, index2 )
	local f2_local0 = array[index2]
	array[index2] = array[index1]
	array[index1] = f2_local0
end

local shuffle = function ( array )
	local counter = #array
	while 1 < counter do
		local index = math.random( counter )
		swap( array, index, counter )
		counter = counter - 1
	end
end

local BlackMarketDecryptionListPrepare = function ( controller )
	local list = {}
	local addItemListButton = function ( displayText, image, category, setPieceString, rarity )
		local f5_local0 = {}
		local f5_local1 = CoD.BlackMarketUtility.GetFakeItem( controller )
		local f5_local2 = CoD.BlackMarketUtility.GetFakeItem( controller )
		local f5_local3 = CoD.BlackMarketUtility.GetFakeItem( controller )
		local f5_local4 = CoD.BlackMarketUtility.GetFakeItem( controller )
		local fakes = f5_local1
		for i = 2, #fakes, 1 do
			local anyDupe = true
			while anyDupe do
				anyDupe = false
				for j = 1, #fakes, 1 do
					if i ~= j and fakes[i][1] == fakes[j][1] then
						anyDupe = true
						break
					end
				end
				if anyDupe then
					fakes[i] = CoD.BlackMarketUtility.GetFakeItem( controller )
				end
			end
		end
		local rarityName = CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( rarity )]
		local lockItemText, f5_local3 = CoD.BlackMarketUtility.GetItemLockedTextAndAvailability( controller, image, category )
		local hintText = nil
		if category == "emblem" or category == "calling_card" then
			hintText = Engine.Localize( "MPUI_EQUIP_PROMPT" )
		end
		return {
			models = {
				displayText = displayText,
				hintText = hintText,
				image = CoD.BlackMarketUtility.GetImageForLootItem( image, category ),
				emblem = image,
				category = category,
				categoryName = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( image, category ),
				lockItemText = lockItemText,
				lockAvailabilityText = f5_local3,
				raritySet = setPieceString,
				rarityName = rarityName,
				rarity = rarity,
				reveal = false,
				["fakeloot1.emblem"] = fakes[1][1],
				["fakeloot1.image"] = CoD.BlackMarketUtility.GetImageForLootItem( fakes[1][1], fakes[1][2] ),
				["fakeloot1.category"] = fakes[1][2],
				["fakeloot1.rarity"] = fakes[1][3],
				["fakeloot2.emblem"] = image,
				["fakeloot2.image"] = CoD.BlackMarketUtility.GetImageForLootItem( image, category ),
				["fakeloot2.category"] = category,
				["fakeloot2.rarity"] = rarity,
				["fakeloot3.emblem"] = fakes[2][1],
				["fakeloot3.image"] = CoD.BlackMarketUtility.GetImageForLootItem( fakes[2][1], fakes[2][2] ),
				["fakeloot3.category"] = fakes[2][2],
				["fakeloot3.rarity"] = fakes[2][3],
				["fakeloot4.emblem"] = fakes[3][1],
				["fakeloot4.image"] = CoD.BlackMarketUtility.GetImageForLootItem( fakes[3][1], fakes[3][2] ),
				["fakeloot4.category"] = fakes[3][2],
				["fakeloot4.rarity"] = fakes[3][3],
				["fakeloot5.emblem"] = fakes[4][1],
				["fakeloot5.image"] = CoD.BlackMarketUtility.GetImageForLootItem( fakes[4][1], fakes[4][2] ),
				["fakeloot5.category"] = fakes[4][2],
				["fakeloot5.rarity"] = fakes[4][3]
			},
			properties = {}
		}
	end
	
	local keysSpent = CoD.perController[controller].cryptokeysToSpend
	if Engine.LootResultsReady( controller ) == false and Engine.GetLootResults( controller ) ~= nil then
		return list
	end
	local results = Engine.GetLootResults( controller )
	local fakeRareResults = {
		"2104202505",
		"2132914613",
		"2033507461"
	}
	local fakeCommonResults = {
		"2122828615",
		"2054341474",
		"2106186559"
	}
	if Dvar.loot_fakeRarity:exists() then
		if Dvar.loot_fakeRarity:get() == "common" then
			results = {
				"2088754833",
				"2081841575",
				"2093777929"
			}
		elseif Dvar.loot_fakeRarity:get() == "mixed" then
			results = {
				"2058086710",
				"2112484188",
				"2114010313"
			}
		end
	elseif Engine.GetDvarBool( "loot_fakeRare" ) then
		results = fakeRareResults
	elseif Engine.GetDvarBool( "loot_fakeCommon" ) then
		results = fakeCommonResults
	elseif results == nil then
		if keysSpent <= 10 then
			results = fakeCommonResults
		else
			results = fakeRareResults
		end
	end
	if LUI.DEV and Dvar.loot_fakeItem:exists() and Dvar.loot_fakeItem:get() ~= "" then
		results[1] = Dvar.loot_fakeItem:get()
	end
	if LUI.DEV and Dvar.loot_testAll:exists() and Dvar.loot_testAll:get() == true then
		for i = 1, 3, 1 do
			local index = Dvar.loot_testIndex:get()
			local id = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, index, 1 )
			results[i] = id
			IncrementTestIndex()
		end
	else
		table.remove( results, 4 )
		shuffle( results )
	end
	local nameColumn = 0
	local itemIdColumn = 1
	local typeColumn = 2
	local rarityColumn = 3
	local setColumn = 4
	local resultItems = #results
	if resultItems > 3 then
		resultItems = 3
	end
	for i = 1, resultItems, 1 do
		local lootRows = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, itemIdColumn, results[i] )
		if lootRows ~= nil then
			local category = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, lootRows[1], typeColumn )
			local rarity = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, lootRows[1], rarityColumn )
			local id = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, lootRows[1], nameColumn )
			local displayText = CoD.BlackMarketUtility.GetStringRefForLootItem( controller, id, category )
			local image = CoD.BlackMarketUtility.GetImageForLootItem( id, category )
			local setPieceString = CoD.BlackMarketUtility.GetSetPieceStringForLootItem( controller, id, category )
			table.insert( list, addItemListButton( displayText, id, category, setPieceString, rarity ) )
		end
	end
	return list
end

DataSources.BlackMarketDecryptionList = DataSourceHelpers.ListSetup( "BlackMarketDecryptionList", BlackMarketDecryptionListPrepare, true )
local BlackMarketTradeAgainListPrepare = function ( controller )
	local list = {}
	local tradeAgainAction = function ( self, element, controller, actionParam, menu )
		CoD.perController[controller].codPointsSpent = actionParam.itemCODPointCost
		CoD.OverlayUtility.CreateOverlay( controller, self, "PurchaseSupplyDropConfirmation", controller, actionParam )
	end
	
	local createTradeAgainListItem = function ( cryptoKeyCost, codPointCost, displayText, crateType )
		local image = GetIconForCurrentSupplyDrop( controller )
		local f8_local0 = Engine.Localize
		local f8_local1 = displayText
		if cryptoKeyCost > 0 then
			local f8_local2 = cryptoKeyCost
		end
		local listText = f8_local0( f8_local1, f8_local2 or codPointCost )
		f8_local1 = Engine.Localize
		local f8_local3
		if cryptoKeyCost > 0 then
			f8_local3 = "MPUI_BM_CRYPTOKEYS"
			if not f8_local3 then
			
			else
				local currencyString = f8_local1( f8_local3 )
				local popupTitle = Engine.Localize( "MPUI_BM_TRADE_AGAIN_TEXT", currencyString, CoD.BlackMarketUtility.GetCrateTypeString( crateType ) )
				if codPointCost > 0 then
					popupTitle = Engine.Localize( "MPUI_BM_SPEND_AGAIN_TEXT", currencyString, CoD.BlackMarketUtility.GetCrateTypeString( crateType ) )
				end
				return {
					models = {
						displayText = listText,
						itemCost = cryptoKeyCost,
						itemCODPointCost = codPointCost
					},
					properties = {
						action = tradeAgainAction,
						actionParam = {
							displayText = popupTitle,
							image = image,
							itemCost = cryptoKeyCost,
							itemCODPointCost = codPointCost,
							supplyDropType = crateType,
							again = true
						},
						selectIndex = codPointCost == CoD.perController[controller].codPointsSpent
					}
				}
			end
		end
		f8_local3 = "CGAME_SB_CP"
	end
	
	local cryptokeyCost = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.perController[controller].supplyDropType ) or 0
	if cryptokeyCost > 0 then
		table.insert( list, createTradeAgainListItem( cryptokeyCost, 0, "MPUI_BM_TRADE_CRYPTOKEYS_SHORT", CoD.perController[controller].supplyDropType ) )
	end
	local codPointCost = CoD.BlackMarketUtility.GetCrateCODPointCost( CoD.perController[controller].supplyDropType ) or 0
	if codPointCost > 0 then
		table.insert( list, createTradeAgainListItem( 0, codPointCost, "MPUI_BM_TRADE_COD_POINTS_SHORT", CoD.perController[controller].supplyDropType ) )
	end
	return list
end

DataSources.BlackMarketTradeAgainList = DataSourceHelpers.ListSetup( "BlackMarketTradeAgainList", BlackMarketTradeAgainListPrepare, true )
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
	
	local cryptoKeyModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CryptoKeyProgress" )
	Engine.SetModelValue( Engine.CreateModel( cryptoKeyModel, "bonusKeysAwarded" ), 0 )
end

local GetLootResultString = function ( result )
	if result == Enum.LootResultType.LOOT_RESULT_FAILURE_INSUFFICIENT_FUNDS then
		return Engine.Localize( "MENU_BM_ERR_INSUFFICIENT_FUNDS" )
	elseif result == Enum.LootResultType.LOOT_RESULT_FAILURE_BAD_RESPONE then
		return Engine.Localize( "MENU_BM_ERR_BAD_RESPONSE" )
	elseif result == Enum.LootResultType.LOOT_RESULT_FAILURE or result == Enum.LootResultType.LOOT_RESULT_INVALID then
		return Engine.Localize( "MENU_BM_ERR_NO_RESULT" )
	else
		return Engine.Localize( "MENU_BM_ERR_NO_RESULT" )
	end
end

local PostLoadFunc = function ( self, controller )
	local delayBeforeFullscreenFade = 1500
	local delayBeforeListStartsShowing = 100
	local delayPerListItem = 200
	local delayUntilFirstItemReveals = 800
	local delayBeforeSecondReveal = 1400
	local delayBeforeLastReveal = 2000
	local delayBeforeShowFocus = 500
	if CoD.perController[controller].supplyDropQuickAnim then
		delayBeforeFullscreenFade = 0
		self.disablePopupOpenCloseAnim = true
	end
	self:setState( "DefaultState" )
	local f12_local0 = self.decryptionList
	f12_local0.m_disableNavigation = true
	f12_local0 = function ()
		if Engine.LootResultsReady( controller ) ~= false or Engine.GetLootResults( controller ) == nil then
			local lootLastResult = Engine.LootFailureReason( controller )
			if lootLastResult == Enum.LootResultType.LOOT_RESULT_SUCCESS then
				self:setState( "Rolling" )
				self.decryptionList:updateDataSource()
				if Dvar.loot_testAll:exists() and Dvar.loot_testAll:get() == true then
					local delayBetweenFakeResults = 1000
					self:addElement( LUI.UITimer.newElementTimer( delayBetweenFakeResults, false, function ()
						self.decryptionList:updateDataSource()
						for i = 1, 3, 1 do
							local item = self.decryptionList:getItemAtPosition( 1, i )
							if item then
								local itemModel = item:getModel()
								Engine.SetModelValue( Engine.GetModel( itemModel, "reveal" ), true )
								CoD.BlackMarketUtility.ShowToastIfApplicable( controller, CoD.SafeGetModelValue( itemModel, "emblem" ), CoD.SafeGetModelValue( itemModel, "category" ), i )
							end
						end
					end ) )
				end
				CoD.BlackMarketUtility.SpendKeysForCrate( controller, CoD.perController[controller].cryptokeysToSpend )
				CoD.perController[controller].cryptokeysToSpend = 0
				self:addElement( LUI.UITimer.newElementTimer( delayBeforeListStartsShowing, true, function ()
					local item = self.decryptionList:getItemAtPosition( 1, 1 )
					if item then
						item:playClip( "StartFuzz" )
					end
					Engine.SendClientScriptNotify( controller, "BlackMarket", {
						param1 = "cycle_start"
					} )
				end ) )
				self:addElement( LUI.UITimer.newElementTimer( delayBeforeListStartsShowing + delayPerListItem, true, function ()
					local item = self.decryptionList:getItemAtPosition( 1, 2 )
					if item then
						item:playClip( "StartFuzz" )
					end
				end ) )
				self:addElement( LUI.UITimer.newElementTimer( delayBeforeListStartsShowing + 2 * delayPerListItem, true, function ()
					local item = self.decryptionList:getItemAtPosition( 1, 3 )
					if item then
						item:playClip( "StartFuzz" )
					end
				end ) )
				local firstRevealTime = delayBeforeListStartsShowing + 2 * delayPerListItem + delayUntilFirstItemReveals
				if Dvar.loot_testAll:exists() and Dvar.loot_testAll:get() == true then
					firstRevealTime = 0
					delayBeforeSecondReveal = 0
					delayBeforeLastReveal = 0
					delayBeforeShowFocus = 0
				end
				local bestRarity = 0
				for i = 1, 3, 1 do
					local f13_local2 = i
					local item = self.decryptionList:getItemAtPosition( 1, f13_local2 )
					if item then
						local itemModel = item:getModel()
						local modelRarity = CoD.BlackMarketUtility.GetRarityIDForString( CoD.SafeGetModelValue( itemModel, "rarity" ) )
						if bestRarity < modelRarity then
							bestRarity = modelRarity
						end
						self:addElement( LUI.UITimer.newElementTimer( firstRevealTime + (f13_local2 - 1) * delayBeforeSecondReveal, true, function ()
							Engine.SetModelValue( Engine.GetModel( itemModel, "reveal" ), true )
							Engine.PlaySound( "uin_bm_cycle_item_hit" )
							local overlayAlias = CoD.BlackMarketUtility.CrateTypeRevealAlias[modelRarity]
							if overlayAlias ~= nil then
								Engine.PlaySound( overlayAlias )
							end
							if f13_local2 == 3 then
								Engine.SendClientScriptNotify( controller, "BlackMarket", {
									param1 = "cycle_stop"
								} )
								self.decryptionList.m_disableNavigation = false
							end
							CoD.BlackMarketUtility.ShowToastIfApplicable( controller, CoD.SafeGetModelValue( itemModel, "emblem" ), CoD.SafeGetModelValue( itemModel, "category" ), f13_local2 )
						end ) )
					end
				end
				local i = CoD.BlackMarketUtility.CrateTypeIds[bestRarity]
				local showFocusTime = firstRevealTime + delayBeforeSecondReveal + delayBeforeLastReveal + delayBeforeShowFocus
				local f13_local1 = 0
				if CoD.perController[controller].supplyDropType ~= CoD.BlackMarketUtility.DropTypes.COMMON then
					local f13_local2 = Engine.GetLootResults( controller )
					if f13_local2[4] ~= nil then
						f13_local1 = f13_local2[4]
					else
						f13_local1 = 0
					end
				end
				CoD.perController[controller].keysToNotShowYet = f13_local1
				DataSources.CryptoKeyProgress.getModel( controller )
				self:addElement( LUI.UITimer.newElementTimer( showFocusTime, true, function ()
					local cryptoKeyModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CryptoKeyProgress" )
					Engine.SetModelValue( Engine.CreateModel( cryptoKeyModel, "bonusKeysAwarded" ), f13_local1 )
					if f13_local1 > 0 then
						Engine.PlaySound( "uin_bm_keydrop_anim" )
						self:addElement( LUI.UITimer.newElementTimer( 850, true, function ()
							self.StartMenuCurrencyCounts:playClip( "Bonus" )
							self.StartMenuCurrencyCounts.BMCryptokeyCounterIcon:playClip( "Keybonus" )
							self.BMDecryptionBonusKeys.BMWires1:playClip( "circuitanim" )
							self.BMDecryptionBonusKeys.BMWires2:playClip( "circuitanim" )
							self.BMDecryptionBonusKeys.BMWiresGlow:playClip( "circuitanim" )
						end ) )
						self:addElement( LUI.UITimer.newElementTimer( 1225, true, function ()
							CoD.perController[controller].keysToNotShowYet = 0
							DataSources.CryptoKeyProgress.getModel( controller )
						end ) )
						self:addElement( LUI.UITimer.newElementTimer( 1725, true, function ()
							Engine.SendMenuResponse( controller, "BlackMarket", {
								param1 = "complete_" .. i
							} )
						end ) )
					else
						Engine.SendMenuResponse( controller, "BlackMarket", {
							param1 = "complete_" .. i
						} )
					end
					self:setState( "Results" )
					CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
					if not CoD.perController[controller].supplyDropQuickAnim then
						self.decryptionList:processEvent( {
							name = "gain_focus",
							controller = controller
						} )
					end
				end ) )
			else
				GoBack( self, controller )
				ClearMenuSavedState( self )
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetLootResultString( lootLastResult ) )
			end
		else
			self:addElement( LUI.UITimer.newElementTimer( 250, true, f12_local0 ) )
		end
	end
	
	self:addElement( LUI.UITimer.newElementTimer( delayBeforeFullscreenFade, true, f12_local0 ) )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		CoD.perController[controller].keysToNotShowYet = 0
		DataSources.CryptoKeyProgress.getModel( controller )
	end )
end

LUI.createMenu.BM_Decryption = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BM_Decryption" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BM_Decryption.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 1, -68, 52 )
	LeftPanel:setTopBottom( 0, 1, -65, 153 )
	LeftPanel:setRGB( 0.48, 0.48, 0.48 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Screen = LUI.UIImage.new()
	Screen:setLeftRight( 0, 1, 0, 0 )
	Screen:setTopBottom( 0, 1, 0, 0 )
	Screen:setImage( RegisterImage( "uie_t7_blackmarket_screen_bg" ) )
	Screen:setupUIStreamedImage( 0 )
	self:addElement( Screen )
	self.Screen = Screen
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -679, -165 )
	SelfIdentityBadge:setTopBottom( 0, 0, 23, 113 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local BMLogo = CoD.BM_Logo.new( self, controller )
	BMLogo:setLeftRight( 0, 0, 116, 564 )
	BMLogo:setTopBottom( 0, 0, 115, 296 )
	self:addElement( BMLogo )
	self.BMLogo = BMLogo
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( 0, 1, 2, -2 )
	feFooterContainerNOTLobby:setTopBottom( 1, 1, -100, 0 )
	feFooterContainerNOTLobby:setAlpha( 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local TradeAgainBacking = LUI.UIImage.new()
	TradeAgainBacking:setLeftRight( 0, 1, 0, 0 )
	TradeAgainBacking:setTopBottom( 0, 1, 0, 0 )
	TradeAgainBacking:setImage( RegisterImage( "uie_t7_blackmarket_tradeagainframe" ) )
	self:addElement( TradeAgainBacking )
	self.TradeAgainBacking = TradeAgainBacking
	
	local decryptionList = LUI.UIList.new( self, controller, 75, 0, nil, false, false, 0, 0, false, false )
	decryptionList:makeFocusable()
	decryptionList:setLeftRight( 0.5, 0.5, -625.5, 625.5 )
	decryptionList:setTopBottom( 0, 0, 285, 795 )
	decryptionList:setWidgetType( CoD.LootDecryptionWidget )
	decryptionList:setHorizontalCount( 3 )
	decryptionList:setSpacing( 75 )
	decryptionList:setDataSource( "BlackMarketDecryptionList" )
	decryptionList:linkToElementModel( decryptionList, "category", true, function ( model )
		local element = decryptionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	decryptionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	decryptionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( decryptionList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualTo( element, controller, "category", "emblem" ) then
			BlackMarketSetAsEmblem( self, element, controller )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "ShowBadge"
			}, controller )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "calling_card" ) then
			BlackMarketSetCallingCard( self, element, controller )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "ShowBadge"
			}, controller )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "taunt" ) and BlackMarketListItemCanEquip( element, controller ) then
			BlackMarketSetTaunt( self, element, controller )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "gesture" ) and BlackMarketListItemCanEquip( element, controller ) then
			BlackMarketSetGesture( self, element, controller )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "specialist_outfit" ) and BlackMarketListItemCanEquip( element, controller ) then
			BlackMarketSetSpecialistTheme( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualTo( element, controller, "category", "emblem" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP", nil )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "calling_card" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP", nil )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "taunt" ) and BlackMarketListItemCanEquip( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP", nil )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "gesture" ) and BlackMarketListItemCanEquip( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP", nil )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "specialist_outfit" ) and BlackMarketListItemCanEquip( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( decryptionList )
	self.decryptionList = decryptionList
	
	local BMTradeAgainFocus = CoD.BM_TradeAgainFocus.new( self, controller )
	BMTradeAgainFocus:setLeftRight( 0, 0, 92, 308 )
	BMTradeAgainFocus:setTopBottom( 0, 0, 274, 850 )
	self:addElement( BMTradeAgainFocus )
	self.BMTradeAgainFocus = BMTradeAgainFocus
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( self, controller )
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
		self:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	StartMenuCurrencyCounts:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		self:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	StartMenuCurrencyCounts:setLeftRight( 1, 1, -449, -143 )
	StartMenuCurrencyCounts:setTopBottom( 0, 0, 183.5, 228.5 )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local TradeAgainList = LUI.UIList.new( self, controller, 22, 0, nil, false, false, 0, 0, false, false )
	TradeAgainList:makeFocusable()
	TradeAgainList:setLeftRight( 0, 0, 147, 262 )
	TradeAgainList:setTopBottom( 0, 0, 594, 700 )
	TradeAgainList:setWidgetType( CoD.BlackMarketTradeAgainListItem )
	TradeAgainList:setVerticalCount( 2 )
	TradeAgainList:setSpacing( 22 )
	TradeAgainList:setDataSource( "BlackMarketTradeAgainList" )
	TradeAgainList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codPoints" ), function ( model )
		local element = TradeAgainList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codPoints"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	TradeAgainList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		local element = TradeAgainList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	TradeAgainList:linkToElementModel( TradeAgainList, "itemCODPointCost", true, function ( model )
		local element = TradeAgainList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCODPointCost"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	TradeAgainList:registerEventHandler( "gain_list_focus", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "BMTradeAgainFocus", controller, "Highlighted" )
		PlayClipOnElement( self, {
			elementName = "BMDecryptionCrate",
			clipName = "Focus"
		}, controller )
		return retVal
	end )
	TradeAgainList:registerEventHandler( "lose_list_focus", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "BMTradeAgainFocus", controller, "Off" )
		PlayClipOnElement( self, {
			elementName = "BMDecryptionCrate",
			clipName = "DefaultClip"
		}, controller )
		return retVal
	end )
	TradeAgainList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	TradeAgainList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( TradeAgainList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if CanAffordTradeAgain( element, controller ) and IsMenuInState( menu, "Results" ) then
			ProcessListAction( self, element, controller )
			return true
		elseif IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 ) and IsMenuInState( menu, "Results" ) then
			OpenOverlay( self, "Store_CodPoints", controller, "", "" )
			return true
		else
			return true
		end
	end, function ( element, menu, controller )
		if CanAffordTradeAgain( element, controller ) and IsMenuInState( menu, "Results" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsSelfModelValueGreaterThan( element, controller, "itemCODPointCost", 0 ) and IsMenuInState( menu, "Results" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MPUI_PURCHASE_CODPOINTS", nil )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		end
	end, true )
	self:addElement( TradeAgainList )
	self.TradeAgainList = TradeAgainList
	
	local BMDecryptionBonusKeys = CoD.BM_DecryptionBonusKeys.new( self, controller )
	BMDecryptionBonusKeys:setLeftRight( 0, 0, 1642, 1764 )
	BMDecryptionBonusKeys:setTopBottom( 0, 0, 469, 585 )
	BMDecryptionBonusKeys:subscribeToGlobalModel( controller, "CryptoKeyProgress", "bonusKeysAwarded", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BMDecryptionBonusKeys.cryptokeyCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( BMDecryptionBonusKeys )
	self.BMDecryptionBonusKeys = BMDecryptionBonusKeys
	
	local BMDecryptionCrate = CoD.BM_DecryptionCrate.new( self, controller )
	BMDecryptionCrate:setLeftRight( 0, 0, 148, 266 )
	BMDecryptionCrate:setTopBottom( 0, 0, 394, 512 )
	BMDecryptionCrate:setScale( 0.5 )
	self:addElement( BMDecryptionCrate )
	self.BMDecryptionCrate = BMDecryptionCrate
	
	local BMDecryptionTradeAgain = CoD.BM_DecryptionTradeAgain.new( self, controller )
	BMDecryptionTradeAgain:setLeftRight( 0, 0, 125, 289 )
	BMDecryptionTradeAgain:setTopBottom( 0, 0, 528, 554 )
	self:addElement( BMDecryptionTradeAgain )
	self.BMDecryptionTradeAgain = BMDecryptionTradeAgain
	
	SelfIdentityBadge.navigation = {
		down = decryptionList
	}
	decryptionList.navigation = {
		left = TradeAgainList,
		up = SelfIdentityBadge
	}
	TradeAgainList.navigation = {
		right = decryptionList
	}
	self.resetProperties = function ()
		decryptionList:completeAnimation()
		Screen:completeAnimation()
		BMLogo:completeAnimation()
		StartMenuCurrencyCounts:completeAnimation()
		TradeAgainList:completeAnimation()
		TradeAgainBacking:completeAnimation()
		BMTradeAgainFocus:completeAnimation()
		BMDecryptionCrate:completeAnimation()
		BMDecryptionTradeAgain:completeAnimation()
		LeftPanel:completeAnimation()
		feFooterContainerNOTLobby:completeAnimation()
		decryptionList:setAlpha( 1 )
		Screen:setAlpha( 1 )
		BMLogo:setAlpha( 1 )
		StartMenuCurrencyCounts:setAlpha( 1 )
		TradeAgainList:setAlpha( 1 )
		TradeAgainBacking:setAlpha( 1 )
		BMTradeAgainFocus:setAlpha( 1 )
		BMDecryptionCrate:setAlpha( 1 )
		BMDecryptionTradeAgain:setAlpha( 1 )
		LeftPanel:setAlpha( 0 )
		feFooterContainerNOTLobby:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				Screen:completeAnimation()
				self.Screen:setAlpha( 0 )
				self.clipFinished( Screen, {} )
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 0 )
				self.clipFinished( BMLogo, {} )
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
			end,
			Rolling = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
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
				self.nextClip = "DefaultClip"
			end,
			Results = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
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
				self.nextClip = "DefaultClip"
			end,
			Reroll = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 0.95 )
				self.clipFinished( BMLogo, {} )
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
			end,
			Rolling = function ()
				self.resetProperties()
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if not IsPerControllerTablePropertyValue( controller, "supplyDropQuickAnim", true ) then
			SetMenuState( self, "DefaultState" )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "Hide"
			}, controller )
		else
			SetMenuState( self, "Reroll" )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "Hide"
			}, controller )
			UpdateAllMenuButtonPrompts( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "Results" ) then
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "Results" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptNotify( controller, "BlackMarket", "normal_camera" )
		BlackMarketResultsOnClose( self, element, controller )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "Results" ) and IsModelValueGreaterThan( controller, "CryptoKeyProgress.bonusKeysAwarded", 0 ) then
			SetElementStateByElementName( self, "BMDecryptionBonusKeys", controller, "Bonus" )
		end
	end )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	decryptionList.id = "decryptionList"
	TradeAgainList.id = "TradeAgainList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.decryptionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.SelfIdentityBadge:close()
		self.BMLogo:close()
		self.feFooterContainerNOTLobby:close()
		self.decryptionList:close()
		self.BMTradeAgainFocus:close()
		self.StartMenuCurrencyCounts:close()
		self.TradeAgainList:close()
		self.BMDecryptionBonusKeys:close()
		self.BMDecryptionCrate:close()
		self.BMDecryptionTradeAgain:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BM_Decryption.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

