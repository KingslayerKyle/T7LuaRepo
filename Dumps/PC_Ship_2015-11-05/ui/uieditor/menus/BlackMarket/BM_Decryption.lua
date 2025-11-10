require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BlackMarket.LootDecryptionWidget" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.BlackMarket.BM_Logo" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

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

DataSources.BlackMarketDecryptionList = DataSourceHelpers.ListSetup( "BlackMarketDecryptionList", function ( f4_arg0 )
	local f4_local0 = {}
	local f4_local1 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
		local f5_local0 = {}
		local f5_local1 = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
		local f5_local2 = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
		local f5_local3 = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
		local f5_local4 = CoD.BlackMarketUtility.GetFakeItem( f4_arg0 )
		f5_local0 = f5_local1
		for f5_local1 = 2, #f5_local0, 1 do
			local f5_local5 = true
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
		f5_local1 = CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( f5_arg4 )]
		f5_local2, f5_local3 = CoD.BlackMarketUtility.GetItemLockedTextAndAvailability( f4_arg0, f5_arg1, f5_arg2 )
		return {
			models = {
				displayText = f5_arg0,
				image = CoD.BlackMarketUtility.GetImageForLootItem( f5_arg1, f5_arg2 ),
				emblem = f5_arg1,
				category = f5_arg2,
				categoryName = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f5_arg1, f5_arg2 ),
				lockItemText = f5_local2,
				lockAvailabilityText = f5_local3,
				raritySet = f5_arg3,
				rarityName = f5_local1,
				rarity = f5_arg4,
				reveal = false,
				["fakeloot1.emblem"] = f5_local0[1][1],
				["fakeloot1.image"] = CoD.BlackMarketUtility.GetImageForLootItem( f5_local0[1][1], f5_local0[1][2] ),
				["fakeloot1.category"] = f5_local0[1][2],
				["fakeloot1.rarity"] = f5_local0[1][3],
				["fakeloot2.emblem"] = f5_arg1,
				["fakeloot2.image"] = CoD.BlackMarketUtility.GetImageForLootItem( f5_arg1, f5_arg2 ),
				["fakeloot2.category"] = f5_arg2,
				["fakeloot2.rarity"] = f5_arg4,
				["fakeloot3.emblem"] = f5_local0[2][1],
				["fakeloot3.image"] = CoD.BlackMarketUtility.GetImageForLootItem( f5_local0[2][1], f5_local0[2][2] ),
				["fakeloot3.category"] = f5_local0[2][2],
				["fakeloot3.rarity"] = f5_local0[2][3],
				["fakeloot4.emblem"] = f5_local0[3][1],
				["fakeloot4.image"] = CoD.BlackMarketUtility.GetImageForLootItem( f5_local0[3][1], f5_local0[3][2] ),
				["fakeloot4.category"] = f5_local0[3][2],
				["fakeloot4.rarity"] = f5_local0[3][3],
				["fakeloot5.emblem"] = f5_local0[4][1],
				["fakeloot5.image"] = CoD.BlackMarketUtility.GetImageForLootItem( f5_local0[4][1], f5_local0[4][2] ),
				["fakeloot5.category"] = f5_local0[4][2],
				["fakeloot5.rarity"] = f5_local0[4][3]
			},
			properties = {}
		}
	end
	
	local f4_local2 = CoD.perController[f4_arg0].cryptokeysToSpend
	if Engine.LootResultsReady( f4_arg0 ) == false and Engine.GetLootResults( f4_arg0 ) ~= nil then
		return f4_local0
	end
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
				"2087983550",
				"2074518358",
				"2003903605"
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
		f0_local2( f4_local3 )
	end
	local f4_local6 = 0
	local f4_local7 = 1
	local f4_local8 = 2
	local f4_local9 = 3
	local f4_local10 = 4
	for f4_local11 = 1, #f4_local3, 1 do
		local f4_local14 = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, f4_local7, f4_local3[f4_local11] )
		if f4_local14 ~= nil then
			local f4_local15 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f4_local14[1], f4_local8 )
			local f4_local16 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f4_local14[1], f4_local9 )
			local f4_local17 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f4_local14[1], f4_local6 )
			local f4_local18 = CoD.BlackMarketUtility.GetStringRefForLootItem( f4_arg0, f4_local17, f4_local15 )
			local f4_local19 = CoD.BlackMarketUtility.GetImageForLootItem( f4_local17, f4_local15 )
			table.insert( f4_local0, f4_local1( f4_local18, f4_local17, f4_local15, CoD.BlackMarketUtility.GetSetPieceStringForLootItem( f4_arg0, f4_local17, f4_local15 ), f4_local16 ) )
		end
	end
	return f4_local0
end, true )
local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].selectedEmblemTabStorageType = Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS
end

local f0_local4 = function ( f7_arg0 )
	if f7_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE_INSUFFICIENT_FUNDS then
		return Engine.Localize( "MENU_BM_ERR_INSUFFICIENT_FUNDS" )
	elseif f7_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE_BAD_RESPONE then
		return Engine.Localize( "MENU_BM_ERR_BAD_RESPONSE" )
	elseif f7_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE or f7_arg0 == Enum.LootResultType.LOOT_RESULT_INVALID then
		return Engine.Localize( "MENU_BM_ERR_NO_RESULT" )
	else
		return Engine.Localize( "MENU_BM_ERR_NO_RESULT" )
	end
end

local PostLoadFunc = function ( f8_arg0, f8_arg1 )
	local f8_local0 = 1500
	local f8_local1 = 100
	local f8_local2 = 200
	local f8_local3 = 800
	local f8_local4 = 1400
	local f8_local5 = 2000
	local f8_local6 = 500
	local f8_local7 = f8_arg0
	local f8_local8 = f8_arg0.setState
	f8_local8( f8_local7, "DefaultState" )
	f8_arg0:addElement( LUI.UITimer.newElementTimer( f8_local0, true, function ()
		if Engine.LootResultsReady( f8_arg1 ) ~= false or Engine.GetLootResults( f8_arg1 ) == nil then
			local f9_local0 = Engine.LootFailureReason( f8_arg1 )
			if f9_local0 == Enum.LootResultType.LOOT_RESULT_SUCCESS then
				f8_arg0:setState( "Rolling" )
				f8_arg0.decryptionList:updateDataSource()
				f8_arg0.decryptionList:setMouseDisabled( true )
				if Dvar.loot_testAll:exists() and Dvar.loot_testAll:get() == true then
					f8_arg0:addElement( LUI.UITimer.newElementTimer( 1000, false, function ()
						f8_arg0.decryptionList:updateDataSource()
						for f10_local0 = 1, 3, 1 do
							local f10_local3 = f8_arg0.decryptionList:getItemAtPosition( 1, f10_local0 )
							if f10_local3 then
								local f10_local4 = f10_local3:getModel()
								Engine.SetModelValue( Engine.GetModel( f10_local4, "reveal" ), true )
								CoD.BlackMarketUtility.ShowToastIfApplicable( f8_arg1, CoD.SafeGetModelValue( f10_local4, "emblem" ), CoD.SafeGetModelValue( f10_local4, "category" ), f10_local0 )
							end
						end
					end ) )
				end
				CoD.BlackMarketUtility.SpendKeysForCrate( f8_arg1, CoD.perController[f8_arg1].cryptokeysToSpend )
				CoD.perController[f8_arg1].cryptokeysToSpend = 0
				f8_arg0:addElement( LUI.UITimer.newElementTimer( f8_local1, true, function ()
					local f11_local0 = f8_arg0.decryptionList:getItemAtPosition( 1, 1 )
					if f11_local0 then
						f11_local0:playClip( "StartFuzz" )
					end
					Engine.SendClientScriptNotify( f8_arg1, "BlackMarket", "cycle_start" )
				end ) )
				f8_arg0:addElement( LUI.UITimer.newElementTimer( f8_local1 + f8_local2, true, function ()
					local f12_local0 = f8_arg0.decryptionList:getItemAtPosition( 1, 2 )
					if f12_local0 then
						f12_local0:playClip( "StartFuzz" )
					end
				end ) )
				f8_arg0:addElement( LUI.UITimer.newElementTimer( f8_local1 + 2 * f8_local2, true, function ()
					local f13_local0 = f8_arg0.decryptionList:getItemAtPosition( 1, 3 )
					if f13_local0 then
						f13_local0:playClip( "StartFuzz" )
					end
				end ) )
				local f9_local1 = f8_local1 + 2 * f8_local2 + f8_local3
				if Dvar.loot_testAll:exists() and Dvar.loot_testAll:get() == true then
					f9_local1 = 0
					f8_local4 = 0
					f8_local5 = 0
					f8_local6 = 0
				end
				local f9_local2 = 0
				for f9_local3 = 1, 3, 1 do
					local f9_local6 = f9_local3
					local f9_local7 = f8_arg0.decryptionList:getItemAtPosition( 1, f9_local6 )
					if f9_local7 then
						local f9_local8 = f9_local7:getModel()
						local f9_local9 = CoD.BlackMarketUtility.GetRarityIDForString( CoD.SafeGetModelValue( f9_local8, "rarity" ) )
						if f9_local2 < f9_local9 then
							f9_local2 = f9_local9
						end
						f8_arg0:addElement( LUI.UITimer.newElementTimer( f9_local1 + (f9_local6 - 1) * f8_local4, true, function ()
							Engine.SetModelValue( Engine.GetModel( f9_local8, "reveal" ), true )
							Engine.PlaySound( "uin_bm_cycle_item_hit" )
							local f14_local0 = CoD.BlackMarketUtility.CrateTypeRevealAlias[f9_local9]
							if f14_local0 ~= nil then
								Engine.PlaySound( f14_local0 )
							end
							if f9_local6 == 3 then
								Engine.SendClientScriptNotify( f8_arg1, "BlackMarket", "cycle_stop" )
							end
							CoD.BlackMarketUtility.ShowToastIfApplicable( f8_arg1, CoD.SafeGetModelValue( f9_local8, "emblem" ), CoD.SafeGetModelValue( f9_local8, "category" ), f9_local6 )
						end ) )
					end
				end
				local f9_local3 = CoD.BlackMarketUtility.CrateTypeIds[f9_local2]
				f8_arg0:addElement( LUI.UITimer.newElementTimer( f9_local1 + f8_local4 + f8_local5 + f8_local6, true, function ()
					Engine.SendMenuResponse( f8_arg1, "BlackMarket", "complete_" .. f9_local3 )
					f8_arg0:setState( "Results" )
					CoD.Menu.UpdateButtonShownState( f8_arg0, f8_arg0, f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
					f8_arg0.decryptionList:processEvent( {
						name = "gain_focus",
						controller = f8_arg1
					} )
					f8_arg0.decryptionList:setMouseDisabled( false )
				end ) )
			else
				GoBack( f8_arg0, f8_arg1 )
				ClearMenuSavedState( f8_arg0 )
				LuaUtils.UI_ShowErrorMessageDialog( f8_arg1, f0_local4( f9_local0 ) )
			end
		else
			f8_arg0:addElement( LUI.UITimer.newElementTimer( 250, true, f8_local8 ) )
		end
	end ) )
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
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
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
	
	local decryptionList = LUI.UIList.new( self, controller, 50, 0, nil, false, false, 0, 0, false, false )
	decryptionList:makeFocusable()
	decryptionList:setLeftRight( false, false, -417.5, 417.5 )
	decryptionList:setTopBottom( true, false, 189, 529 )
	decryptionList:setDataSource( "BlackMarketDecryptionList" )
	decryptionList:setWidgetType( CoD.LootDecryptionWidget )
	decryptionList:setHorizontalCount( 3 )
	decryptionList:setSpacing( 50 )
	decryptionList:linkToElementModel( decryptionList, "category", true, function ( model )
		local f17_local0 = decryptionList
		local f17_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		}
		CoD.Menu.UpdateButtonShownState( f17_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	decryptionList:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f18_local0
	end )
	decryptionList:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	self:AddButtonCallbackFunction( decryptionList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "E", function ( element, menu, controller, model )
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
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP" )
		if IsSelfModelValueEqualTo( element, controller, "category", "emblem" ) then
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "calling_card" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( decryptionList )
	self.decryptionList = decryptionList
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -453, -110 )
	SelfIdentityBadge:setTopBottom( true, false, 15, 75 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local BMLogo = CoD.BM_Logo.new( self, controller )
	BMLogo:setLeftRight( true, false, 100.58, 399.04 )
	BMLogo:setTopBottom( true, false, 71.17, 192.17 )
	self:addElement( BMLogo )
	self.BMLogo = BMLogo
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:setAlpha( 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local f22_local0 = nil
		SizeToSafeArea( element, controller )
		if not f22_local0 then
			f22_local0 = element:dispatchEventToChildren( event )
		end
		return f22_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 0 )
				self.clipFinished( Screen, {} )
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 0 )
				self.clipFinished( decryptionList, {} )
				BMLogo:completeAnimation()
				self.BMLogo:setAlpha( 0 )
				self.clipFinished( BMLogo, {} )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
			end,
			Rolling = function ()
				self:setupElementClipCounter( 5 )
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
			end
		},
		Rolling = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
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
				self.nextClip = "DefaultClip"
			end,
			Results = function ()
				self:setupElementClipCounter( 1 )
				local feFooterContainerNOTLobbyFrame2 = function ( feFooterContainerNOTLobby, event )
					if not event.interrupted then
						feFooterContainerNOTLobby:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					feFooterContainerNOTLobby:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( feFooterContainerNOTLobby, event )
					else
						feFooterContainerNOTLobby:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				feFooterContainerNOTLobbyFrame2( feFooterContainerNOTLobby, {} )
			end
		},
		Results = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
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
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f38_local0 = nil
		SetMenuState( self, "DefaultState" )
		PlayClipOnElement( self, {
			elementName = "SelfIdentityBadge",
			clipName = "Hide"
		}, controller )
		if not f38_local0 then
			f38_local0 = self:dispatchEventToChildren( event )
		end
		return f38_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "Results" ) then
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		if IsMenuInState( menu, "Results" ) then
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptNotify( controller, "BlackMarket", "normal_camera" )
		BlackMarketResultsOnClose( self, element, controller )
	end )
	decryptionList.id = "decryptionList"
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.decryptionList:close()
		element.SelfIdentityBadge:close()
		element.BMLogo:close()
		element.feFooterContainerNOTLobby:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BM_Decryption.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

