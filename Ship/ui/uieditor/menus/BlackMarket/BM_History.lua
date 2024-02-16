-- 6a99caaee6758721ff287719b941fe42
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BlackMarket.LootDecryptionWidget" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.BlackMarket.BM_LogoRecently" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BlackMarket.BM_HorizontalCounter" )

DataSources.BlackMarketHistoryList = DataSourceHelpers.ListSetup( "BlackMarketHistoryList", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6, f2_arg7 )
		local f2_local0 = CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( f2_arg4 )]
		local f2_local1, f2_local2 = CoD.BlackMarketUtility.GetItemLockedTextAndAvailability( f1_arg0, f2_arg1, f2_arg2 )
		local f2_local3 = nil
		if f2_arg2 == "emblem" or f2_arg2 == "calling_card" then
			f2_local3 = Engine.Localize( "MPUI_EQUIP_PROMPT" )
		end
		local f2_local4 = nil
		if f2_arg5 ~= nil then
			local f2_local5 = os.date( "*t", f2_arg5 + (Engine.GetUTCOffset() or 0) )
			if f2_local5.hour > 12 then
				f2_local4 = Engine.Localize( "MPUI_BM_HISTORY_DATETIME_PM", f2_local5.month, f2_local5.day, f2_local5.hour - 12, string.format( "%02d", f2_local5.min ), string.format( "%02d", f2_local5.sec ) )
			else
				f2_local4 = Engine.Localize( "MPUI_BM_HISTORY_DATETIME_AM", f2_local5.month, f2_local5.day, f2_local5.hour, string.format( "%02d", f2_local5.min ), string.format( "%02d", f2_local5.sec ) )
			end
		end
		local f2_local5 = ""
		if f2_arg6 ~= nil and f2_arg6 > 1 then
			f2_local5 = Engine.Localize( "MPUI_BM_DUPLICATE_TEXT", f2_arg6 )
		end
		local f2_local6 = {
			models = {
				displayText = f2_arg0,
				hintText = f2_local3,
				dateTime = f2_local4,
				duplicateText = f2_local5,
				image = CoD.BlackMarketUtility.GetImageForLootItem( f2_arg1, f2_arg2 ),
				emblem = f2_arg1,
				category = f2_arg2,
				categoryName = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f2_arg1, f2_arg2 ),
				lockItemText = f2_local1,
				lockAvailabilityText = f2_local2,
				raritySet = f2_arg3,
				rarityName = f2_local0,
				rarity = f2_arg4,
				reveal = true,
				drop = f2_arg7
			},
			properties = {}
		}
		for f2_local7 = 1, 5, 1 do
			f2_local6.models["fakeloot" .. f2_local7] = {
				emblem = "blacktransparent",
				image = "blacktransparent",
				category = "camo",
				rarity = "common"
			}
		end
		return f2_local6
	end
	
	local f1_local2 = Engine.GetLootItems( f1_arg0, Enum.eModes.MODE_MULTIPLAYER, 0, 25 )
	local f1_local3 = 0
	local f1_local4 = 1
	local f1_local5 = 2
	local f1_local6 = 3
	local f1_local7 = 4
	local f1_local8 = 6
	if f1_local2 ~= nil then
		for f1_local9 = 1, #f1_local2, 1 do
			local f1_local12 = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, f1_local4, f1_local2[f1_local9].id )
			if f1_local12 ~= nil then
				local f1_local13 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f1_local12[1], f1_local5 )
				local f1_local14 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f1_local12[1], f1_local6 )
				local f1_local15 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f1_local12[1], f1_local3 )
				local f1_local16 = CoD.BlackMarketUtility.GetStringRefForLootItem( f1_arg0, f1_local15, f1_local13 )
				local f1_local17 = CoD.BlackMarketUtility.GetImageForLootItem( f1_local15, f1_local13 )
				local f1_local18 = CoD.BlackMarketUtility.GetSetPieceStringForLootItem( f1_arg0, f1_local15, f1_local13 )
				local f1_local19 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f1_local12[1], f1_local8 )
				if CoD.BlackMarketUtility.IsLimitedBlackMarketItem( f1_local15 ) then
					f1_local14 = "limited"
				end
				table.insert( f1_local0, f1_local1( f1_local16, f1_local15, f1_local13, f1_local18, f1_local14, f1_local2[f1_local9].datetime, f1_local2[f1_local9].count, f1_local19 ) )
			end
		end
	end
	return f1_local0
end, true )
LUI.createMenu.BM_History = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BM_History" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Blackmarket_extra"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BM_History.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f3_local1, controller )
	LeftPanel:setLeftRight( true, true, -45, 35 )
	LeftPanel:setTopBottom( true, true, -43, 102 )
	LeftPanel:setRGB( 0.48, 0.48, 0.48 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Screen = LUI.UIImage.new()
	Screen:setLeftRight( true, true, 0, 0 )
	Screen:setTopBottom( true, true, 0, 0 )
	Screen:setImage( RegisterImage( "uie_t7_blackmarket_recentcontraband_bg" ) )
	Screen:setupUIStreamedImage( 0 )
	self:addElement( Screen )
	self.Screen = Screen
	
	local decryptionList = LUI.UIList.new( f3_local1, controller, 50, 210, nil, false, false, 0, 0, false, false )
	decryptionList:makeFocusable()
	decryptionList:setLeftRight( true, false, 222.5, 1057.5 )
	decryptionList:setTopBottom( true, false, 189, 529 )
	decryptionList:setWidgetType( CoD.LootDecryptionWidget )
	decryptionList:setHorizontalCount( 3 )
	decryptionList:setSpacing( 50 )
	decryptionList:setDataSource( "BlackMarketHistoryList" )
	decryptionList:linkToElementModel( decryptionList, "category", true, function ( model )
		local f4_local0 = decryptionList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	decryptionList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f5_local0
	end )
	decryptionList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	f3_local1:AddButtonCallbackFunction( decryptionList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "E", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if IsSelfModelValueEqualTo( f7_arg0, f7_arg2, "category", "emblem" ) then
			BlackMarketSetAsEmblem( self, f7_arg0, f7_arg2 )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "ShowBadge"
			}, f7_arg2 )
			return true
		elseif IsSelfModelValueEqualTo( f7_arg0, f7_arg2, "category", "calling_card" ) then
			BlackMarketSetCallingCard( self, f7_arg0, f7_arg2 )
			PlayClipOnElement( self, {
				elementName = "SelfIdentityBadge",
				clipName = "ShowBadge"
			}, f7_arg2 )
			return true
		elseif IsSelfModelValueEqualTo( f7_arg0, f7_arg2, "category", "taunt" ) and BlackMarketListItemCanEquip( f7_arg0, f7_arg2 ) then
			BlackMarketSetTaunt( self, f7_arg0, f7_arg2 )
			return true
		elseif IsSelfModelValueEqualTo( f7_arg0, f7_arg2, "category", "gesture" ) and BlackMarketListItemCanEquip( f7_arg0, f7_arg2 ) then
			BlackMarketSetGesture( self, f7_arg0, f7_arg2 )
			return true
		elseif IsSelfModelValueEqualTo( f7_arg0, f7_arg2, "category", "specialist_outfit" ) and BlackMarketListItemCanEquip( f7_arg0, f7_arg2 ) then
			BlackMarketSetSpecialistTheme( self, f7_arg0, f7_arg2 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if IsSelfModelValueEqualTo( f8_arg0, f8_arg2, "category", "emblem" ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		elseif IsSelfModelValueEqualTo( f8_arg0, f8_arg2, "category", "calling_card" ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		elseif IsSelfModelValueEqualTo( f8_arg0, f8_arg2, "category", "taunt" ) and BlackMarketListItemCanEquip( f8_arg0, f8_arg2 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP" )
			return true
		elseif IsSelfModelValueEqualTo( f8_arg0, f8_arg2, "category", "gesture" ) and BlackMarketListItemCanEquip( f8_arg0, f8_arg2 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP" )
			return true
		elseif IsSelfModelValueEqualTo( f8_arg0, f8_arg2, "category", "specialist_outfit" ) and BlackMarketListItemCanEquip( f8_arg0, f8_arg2 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_EQUIP" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( decryptionList )
	self.decryptionList = decryptionList
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f3_local1, controller )
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
	
	local BMLogo = CoD.BM_LogoRecently.new( f3_local1, controller )
	BMLogo:setLeftRight( true, false, 101.58, 497.04 )
	BMLogo:setTopBottom( true, false, 71.17, 192.17 )
	BMLogo.RecentItems:setText( Engine.Localize( "MPUI_RECENT_CONTRABAND_CAPS" ) )
	self:addElement( BMLogo )
	self.BMLogo = BMLogo
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f3_local1, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:setAlpha( 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local f11_local0 = nil
		SizeToSafeArea( element, controller )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local horizontalCounter = CoD.BM_HorizontalCounter.new( f3_local1, controller )
	horizontalCounter:setLeftRight( false, false, -105, 95 )
	horizontalCounter:setTopBottom( false, false, 237, 262 )
	horizontalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		SetAsListHorizontalCounter( self, element, "decryptionList" )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:addElement( horizontalCounter )
	self.horizontalCounter = horizontalCounter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
				local decryptionListFrame2 = function ( decryptionList, event )
					local decryptionListFrame3 = function ( decryptionList, event )
						if not event.interrupted then
							decryptionList:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						decryptionList:setAlpha( 0.95 )
						if event.interrupted then
							self.clipFinished( decryptionList, event )
						else
							decryptionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						decryptionListFrame3( decryptionList, event )
						return 
					else
						decryptionList:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						decryptionList:registerEventHandler( "transition_complete_keyframe", decryptionListFrame3 )
					end
				end
				
				decryptionList:completeAnimation()
				self.decryptionList:setAlpha( 0 )
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
			end
		}
	}
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f17_local0 = nil
		SetMenuState( f3_local1, "DefaultState" )
		PlayClipOnElement( self, {
			elementName = "SelfIdentityBadge",
			clipName = "Hide"
		}, controller )
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		GoBack( self, f18_arg2 )
		ClearMenuSavedState( f18_arg1 )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	decryptionList.id = "decryptionList"
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.decryptionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.decryptionList:close()
		element.SelfIdentityBadge:close()
		element.BMLogo:close()
		element.feFooterContainerNOTLobby:close()
		element.horizontalCounter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BM_History.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

