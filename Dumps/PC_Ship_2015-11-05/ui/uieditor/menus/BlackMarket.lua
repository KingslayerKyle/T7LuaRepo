require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BlackMarket.NextKeyProgress" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )

CoD.OverlayUtility.AddSystemOverlay( "PurchaseSupplyDropConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_BlackMarket",
	title = Engine.Localize( "MENU_PURCHASE_CONFIRMAITON" ),
	description = function ( f1_arg0, f1_arg1 )
		return Engine.Localize( "MPUI_BM_PURCHASE_CONFIRMATION_TEXT", f1_arg1.displayText )
	end,
	image = function ( f2_arg0, f2_arg1 )
		return f2_arg1.image
	end,
	cost = function ( f3_arg0, f3_arg1 )
		return f3_arg1.itemCost
	end,
	["cryptoKeyType.rarity"] = function ( f4_arg0, f4_arg1 )
		return CoD.BlackMarketUtility.CrateTypeStrings[f4_arg1.supplyDropType]
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "PurchaseSupplyDrop",
	listDatasource = function ( f5_arg0, f5_arg1 )
		DataSources.PurchaseSupplyDropMenuList = DataSourceHelpers.ListSetup( "PurchaseSupplyDropMenuList", function ( f6_arg0 )
			local f6_local0 = {}
			local f6_local1 = function ( f7_arg0, f7_arg1, f7_arg2 )
				return {
					models = {
						displayText = f7_arg0
					},
					properties = {
						action = f7_arg1,
						actionParam = f5_arg1,
						selectIndex = f7_arg2
					}
				}
			end
			
			local f6_local2 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
				local f8_local0 = GoBack( f8_arg4, f8_arg2 )
				if Engine.BuyLootCrate( f8_arg2, f8_arg3.supplyDropType, Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_CRYPTO_KEYS ) == false then
					
				else
					CoD.perController[f8_arg2].cryptokeysToSpend = f8_arg3.itemCost
					CoD.perController[f8_arg2].supplyDropType = CoD.BlackMarketUtility.CrateTypeStrings[f8_arg3.supplyDropType]
					Engine.SendClientScriptNotify( f8_arg2, "BlackMarket", "crate_camera", CoD.BlackMarketUtility.CrateTypeIds[f8_arg3.supplyDropType] )
					SendFrontendControllerZeroMenuResponse( f8_arg2, "BlackMarket", "roll" )
					Engine.PlaySound( "uin_bm_camera_pan" )
					OpenOverlay( f8_local0, "BM_Decryption", f8_arg2 )
				end
			end
			
			local f6_local3 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
				GoBack( f9_arg4, f9_arg2 )
			end
			
			table.insert( f6_local0, f6_local1( "MPUI_BM_TRADE_CRYPTOKEYS", f6_local2, true ) )
			table.insert( f6_local0, f6_local1( "MENU_CANCEL_CAPS", f6_local3, false ) )
			return f6_local0
		end, true )
		return "PurchaseSupplyDropMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "BurnDuplicatesConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_BlackMarket",
	title = function ( f10_arg0, f10_arg1 )
		if f10_arg1 == nil or f10_arg1 == -1 then
			return Engine.Localize( "MPUI_BM_BURN_CONFIRMATION_NODUPES" )
		else
			return Engine.Localize( "MPUI_BM_BURN_CONFIRMATION" )
		end
	end,
	description = function ( f11_arg0, f11_arg1 )
		if f11_arg1 == nil or f11_arg1 == -1 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_NO_DUPLICATES" )
		elseif f11_arg1 == 0 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_NONE" )
		elseif f11_arg1 == 1 then
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_ONE" )
		else
			return Engine.Localize( "MPUI_BM_BURN_DUPLICATE_DESCRIPTION_MULTIPLE", f11_arg1 )
		end
	end,
	image = "uie_t7_blackmarket_bribe",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "BurnDuplicates",
	totalDuplicates = CoD.BlackMarketUtility.GetNumDupesTotal,
	commonDuplicates = function ( f12_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f12_arg0, CoD.BlackMarketUtility.DropTypes.COMMON )
	end,
	rareDuplicates = function ( f13_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f13_arg0, CoD.BlackMarketUtility.DropTypes.RARE )
	end,
	legendaryDuplicates = function ( f14_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f14_arg0, CoD.BlackMarketUtility.DropTypes.LEGENDARY )
	end,
	epicDuplicates = function ( f15_arg0 )
		return CoD.BlackMarketUtility.GetNumDupesForType( f15_arg0, CoD.BlackMarketUtility.DropTypes.EPIC )
	end,
	listDatasource = function ( f16_arg0 )
		DataSources.BurnDuplicatesMenuList = DataSourceHelpers.ListSetup( "BurnDuplicatesMenuList", function ( f17_arg0, f17_arg1 )
			local f17_local0 = {}
			local f17_local1 = function ( f18_arg0, f18_arg1, f18_arg2 )
				return {
					models = {
						displayText = f18_arg0
					},
					properties = {
						action = f18_arg1,
						selectIndex = f18_arg2
					}
				}
			end
			
			local f17_local2 = f17_arg1.finishedBurningDuplicates
			if not f17_local2 and CoD.BlackMarketUtility.GetNumDupesTotal( f17_arg0 ) == 0 and not f17_arg1.isBurningDuplicates then
				f17_local2 = true
			end
			if f17_local2 then
				local f17_local3 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
					GoBack( f19_arg4, f19_arg2 )
				end
				
				local f17_local4 = {}
				return f17_local1( "MENU_OK_CAPS", f17_local3, true )
			elseif f17_arg1.isBurningDuplicates then
				return {}
			else
				local f17_local3 = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
					if f17_arg1.isBurningDuplicates then
						return 
					end
					f17_arg1.isBurningDuplicates = true
					f20_arg0:setState( "BurningDuplicates" )
					f17_arg1:updateDataSource( true )
					local f20_local0 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f20_arg2 ) * CoD.BlackMarketUtility.XPPerCryptoKey
					local f20_local1 = f20_local0 + CoD.BlackMarketUtility.GetXPEarnedForBurning( f20_arg2, CoD.BlackMarketUtility.GetNumDupesForType( f20_arg2, CoD.BlackMarketUtility.DropTypes.COMMON ), CoD.BlackMarketUtility.GetNumDupesForType( f20_arg2, CoD.BlackMarketUtility.DropTypes.RARE ), CoD.BlackMarketUtility.GetNumDupesForType( f20_arg2, CoD.BlackMarketUtility.DropTypes.LEGENDARY ), CoD.BlackMarketUtility.GetNumDupesForType( f20_arg2, CoD.BlackMarketUtility.DropTypes.EPIC ) )
					if Dvar.ui_cryptocommondupes:exists() then
						Dvar.ui_cryptocommondupes:set( 0 )
						Dvar.ui_cryptoraredupes:set( 0 )
						Dvar.ui_cryptolegendarydupes:set( 0 )
						Dvar.ui_cryptoepicdupes:set( 0 )
					end
					CoD.BlackMarketUtility.DoBurnCryptoKeyAnimation( f20_arg0.NextKeyProgress, f20_arg2, f20_local0, f20_local1, function ()
						f17_arg1.finishedBurningDuplicates = true
						f20_arg0:setState( "BurnedDuplicates" )
						local f21_local0 = math.floor( f20_local1 / CoD.BlackMarketUtility.XPPerCryptoKey )
						local f21_local1 = f20_arg0.textForBurning.text
						local f21_local2 = f21_local1
						f21_local1 = f21_local1.setText
						local f21_local3 = Engine.Localize
						local f21_local4
						if f21_local0 == 1 then
							f21_local4 = "MPUI_BM_BURNED_DESC_EARNED_ONE"
							if not f21_local4 then
							
							else
								f21_local1( f21_local2, f21_local3( f21_local4, f21_local0 ) )
								f17_arg1:updateDataSource()
							end
						end
						f21_local4 = "MPUI_BM_BURNED_DESC"
					end )
					SendFrontendControllerZeroMenuResponse( f20_arg2, "BlackMarket", "burn_duplicates" )
				end
				
				local f17_local4 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
					if f17_arg1.isBurningDuplicates then
						return 
					else
						GoBack( f22_arg4, f22_arg2 )
					end
				end
				
				table.insert( f17_local0, f17_local1( "MPUI_BURN_DUPLICATES_CAPS", f17_local3, false ) )
				table.insert( f17_local0, f17_local1( "MENU_CANCEL_CAPS", f17_local4, true ) )
				return f17_local0
			end
		end, true )
		return "BurnDuplicatesMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
DataSources.BlackMarketCryptokeyList = DataSourceHelpers.ListSetup( "BlackMarketCryptokeyList", function ( f23_arg0 )
	local f23_local0 = {}
	local f23_local1 = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4, f24_arg5 )
		return {
			models = {
				displayText = f24_arg0,
				image = f24_arg1,
				hintText = Engine.Localize( f24_arg2 ),
				itemCount = f24_arg3
			},
			properties = {
				action = f24_arg4,
				actionParam = {
					displayText = f24_arg0,
					image = "uie_" .. f24_arg1 .. "_focus",
					itemCost = f24_arg3,
					supplyDropType = f24_arg5
				}
			}
		}
	end
	
	local f23_local2 = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
		CoD.OverlayUtility.CreateOverlay( f25_arg2, f25_arg0, "PurchaseSupplyDropConfirmation", f25_arg2, f25_arg3 )
	end
	
	table.insert( f23_local0, f23_local1( "MPUI_BM_COMMON_DROP", "t7_blackmarket_crate_common", "MPUI_BM_COMMON_KEY_HINT_TEXT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON ), f23_local2, CoD.BlackMarketUtility.DropTypes.COMMON ) )
	table.insert( f23_local0, f23_local1( "MPUI_BM_RARE_DROP", "t7_blackmarket_crate_rare", "MPUI_BM_RARE_KEY_HINT_TEXT", CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.RARE ), f23_local2, CoD.BlackMarketUtility.DropTypes.RARE ) )
	return f23_local0
end, true )
DataSources.BlackMarketCryptokeyList.getWidgetTypeForItem = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
	if f26_arg0.BlackMarketCryptokeyList[f26_arg3].properties then
		if f26_arg0.BlackMarketCryptokeyList[f26_arg3].properties.isBribeCoin then
			return CoD.BribeCoinWidget
		else
			return CoD.CryptokeyWidget
		end
	else
		return nil
	end
end

DataSources.BlackMarketList = DataSourceHelpers.ListSetup( "BlackMarketList", function ( f27_arg0 )
	local f27_local0 = {}
	local f27_local1 = function ( f28_arg0, f28_arg1 )
		return {
			models = {
				displayText = f28_arg0
			},
			properties = {
				action = f28_arg1
			}
		}
	end
	
	local f27_local2 = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4 )
		local f29_local0 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f29_arg2 )
		local f29_local1 = CoD.BlackMarketUtility.GetNumDupesForType( f29_arg2, CoD.BlackMarketUtility.DropTypes.COMMON )
		local f29_local2 = CoD.BlackMarketUtility.GetNumDupesForType( f29_arg2, CoD.BlackMarketUtility.DropTypes.RARE )
		local f29_local3 = CoD.BlackMarketUtility.GetNumDupesForType( f29_arg2, CoD.BlackMarketUtility.DropTypes.LEGENDARY )
		local f29_local4 = CoD.BlackMarketUtility.GetNumDupesForType( f29_arg2, CoD.BlackMarketUtility.DropTypes.EPIC )
		local f29_local5 = CoD.BlackMarketUtility.GetNumKeysEarnedForBurning( f29_arg2, f29_local1, f29_local2, f29_local3, f29_local4 )
		if f29_local1 + f29_local2 + f29_local3 + f29_local4 == 0 then
			f29_local5 = -1
		end
		CoD.OverlayUtility.CreateOverlay( f29_arg2, f29_arg0, "BurnDuplicatesConfirmation", f29_arg2, f29_local5, f29_local1, f29_local2, f29_local3, f29_local4 )
	end
	
	return f27_local0
end, true )
local PostLoadFunc = function ( f30_arg0, f30_arg1 )
	f30_arg0.disablePopupOpenCloseAnim = true
	if CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f30_arg1 ) > CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON ) then
		SendFrontendControllerZeroMenuResponse( f30_arg1, "BlackMarket", "greeting" )
	else
		SendFrontendControllerZeroMenuResponse( f30_arg1, "BlackMarket", "greeting_broke" )
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
	self.anyChildUsesUpdateState = true
	
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
	
	local NextKeyProgress = CoD.NextKeyProgress.new( self, controller )
	NextKeyProgress:setLeftRight( true, false, 66, 675 )
	NextKeyProgress:setTopBottom( false, true, -125, -75 )
	self:addElement( NextKeyProgress )
	self.NextKeyProgress = NextKeyProgress
	
	local buttonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 66, 346 )
	buttonList:setTopBottom( true, false, 396.63, 428.63 )
	buttonList:setDataSource( "BlackMarketList" )
	buttonList:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f34_local0 = nil
		if element.gainFocus then
			f34_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f34_local0 = element.super:gainFocus( event )
		end
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "DefaultState" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f34_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f35_local0 = nil
		if element.loseFocus then
			f35_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f35_local0 = element.super:loseFocus( event )
		end
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "NotVisible" )
		return f35_local0
	end )
	self:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local cryptokeyList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	cryptokeyList:makeFocusable()
	cryptokeyList:setLeftRight( true, false, 67, 392 )
	cryptokeyList:setTopBottom( true, false, 133.79, 333.79 )
	cryptokeyList:setDataSource( "BlackMarketCryptokeyList" )
	cryptokeyList:setWidgetType( CoD.CryptokeyWidget )
	cryptokeyList:setHorizontalCount( 2 )
	cryptokeyList:setSpacing( 5 )
	cryptokeyList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		local f38_local0 = cryptokeyList
		local f38_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		}
		CoD.Menu.UpdateButtonShownState( f38_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	cryptokeyList:linkToElementModel( cryptokeyList, "itemCount", true, function ( model )
		local f39_local0 = cryptokeyList
		local f39_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCount"
		}
		CoD.Menu.UpdateButtonShownState( f39_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	cryptokeyList:registerEventHandler( "gain_focus", function ( element, event )
		local f40_local0 = nil
		if element.gainFocus then
			f40_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f40_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f40_local0
	end )
	cryptokeyList:registerEventHandler( "lose_focus", function ( element, event )
		local f41_local0 = nil
		if element.loseFocus then
			f41_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f41_local0 = element.super:loseFocus( event )
		end
		return f41_local0
	end )
	self:AddButtonCallbackFunction( cryptokeyList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.keyCount", "itemCount" ) then
			ProcessListAction( self, element, controller )
			return true
		else
			PlaySoundSetSound( self, "action_denied" )
			return true
		end
	end, function ( element, menu, controller )
		if IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.keyCount", "itemCount" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		end
	end, true )
	self:addElement( cryptokeyList )
	self.cryptokeyList = cryptokeyList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local burnDuplicatesHint = CoD.cac_PrimaryWeaponDescription.new( self, controller )
	burnDuplicatesHint:setLeftRight( true, false, 68, 502 )
	burnDuplicatesHint:setTopBottom( true, false, 506, 528 )
	burnDuplicatesHint:setAlpha( 0 )
	burnDuplicatesHint.weaponDescTextBox:setText( Engine.Localize( "MPUI_BM_BURN_DUPLICATE_HELP" ) )
	self:addElement( burnDuplicatesHint )
	self.burnDuplicatesHint = burnDuplicatesHint
	
	local DescTitle = LUI.UITightText.new()
	DescTitle:setLeftRight( true, false, 69, 385 )
	DescTitle:setTopBottom( true, false, 106, 126 )
	DescTitle:setAlpha( 0.75 )
	DescTitle:setText( Engine.Localize( "MPUI_BLACK_MARKET_DESC" ) )
	DescTitle:setTTF( "fonts/escom.ttf" )
	DescTitle:setLetterSpacing( 0.85 )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	buttonList.navigation = {
		up = cryptokeyList
	}
	cryptokeyList.navigation = {
		down = buttonList
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f45_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetElementStateByElementName( self, "GenericMenuFrame", controller, "Update" )
		if not f45_local0 then
			f45_local0 = self:dispatchEventToChildren( event )
		end
		return f45_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f46_local0 = nil
		SetElementStateByElementName( self, "burnDuplicatesHint", controller, "NotVisible" )
		PlayClipOnElement( self, {
			elementName = "FEMenuLeftGraphics",
			clipName = "Intro"
		}, controller )
		if not f46_local0 then
			f46_local0 = self:dispatchEventToChildren( event )
		end
		return f46_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendFrontendControllerZeroMenuResponse( controller, "BlackMarket", "closed" )
		CommitProfileChanges( controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FadeForStreamer:close()
		element.GenericMenuFrame:close()
		element.NextKeyProgress:close()
		element.buttonList:close()
		element.cryptokeyList:close()
		element.FEMenuLeftGraphics:close()
		element.burnDuplicatesHint:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BlackMarket.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

