-- 31f64121e16b39f2b56b3ce77f8c9032
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )
require( "ui.uieditor.widgets.Store.StoreCategoryButton" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.originalOcclusionChange = f1_arg0.m_eventHandlers.occlusion_change
	f1_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded and event.occludedBy then
			if event.occludedBy.id == "Menu.PurchaseExtraSlotsConfirmation" then
				CoD.perController[f1_arg1].previouslySelectedStoreCategory = "EXTRAPACKS"
				ForceNotifyControllerModel( f1_arg1, "StoreRoot.ready" )
				Engine.HidePsStoreIcon()
			elseif event.occludedBy.id == "Menu.PurchaseInventoryItemConfirmation" then
				CoD.perController[f1_arg1].previouslySelectedStoreCategory = "EXTRAPACKS"
				ForceNotifyControllerModel( f1_arg1, "StoreRoot.ready" )
				Engine.HidePsStoreIcon()
			elseif event.occludedBy.id == "Menu.PurchaseOutfitItemConfirmation" then
				CoD.perController[f1_arg1].previouslySelectedStoreCategory = "OUTFITS"
				ForceNotifyControllerModel( f1_arg1, "StoreRoot.ready" )
				Engine.HidePsStoreIcon()
			elseif event.occludedBy.id == "Menu.Store_CodPoints" then
				CoD.perController[f1_arg1].selectedStoreCategory = CoD.perController[f1_arg1].previouslySelectedStoreCategory
				ForceNotifyControllerModel( f1_arg1, "StoreRoot.ready" )
				Engine.HidePsStoreIcon()
			end
		end
		element:originalOcclusionChange( event )
	end )
end

local PreLoadFunc = function ( self, controller )
	local f3_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "StoreRoot" )
	Engine.CreateModel( f3_local0, "ready" )
	Engine.CreateModel( f3_local0, "storeSource" )
	Engine.CreateModel( f3_local0, "storeLocation" )
	Engine.SetModelValue( Engine.CreateModel( f3_local0, "isCategoryListInFocus" ), 1 )
	Engine.SetModelValue( Engine.CreateModel( f3_local0, "isNonFeatureProductListInFocus" ), 1 )
	self.restoreState = function ( f4_arg0 )
		if CoD.perController[controller].forceFocusCategory ~= nil then
			local f4_local0 = f4_arg0.storeCategoryList:findItem( {
				category = CoD.perController[controller].forceFocusCategory
			}, nil, false )
			if f4_local0 then
				f4_arg0.storeCategoryList:processEvent( {
					name = "gain_focus",
					controller = controller,
					selectIndex = f4_local0.gridInfoTable.zeroBasedIndex
				} )
				return true
			end
		end
		return false
	end
	
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.Store = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Store" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Store.buttonPrompts" )
	local f5_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -638, 642 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setScale( 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local editorBackground = LUI.UIImage.new()
	editorBackground:setLeftRight( true, true, 0, 0 )
	editorBackground:setTopBottom( true, true, 0, 0 )
	editorBackground:setRGB( 0, 0, 0 )
	editorBackground:setAlpha( 0.75 )
	self:addElement( editorBackground )
	self.editorBackground = editorBackground
	
	local frame = CoD.GenericMenuFrame.new( f5_local1, controller )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, true, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f5_local1, controller )
	SelfIdentityBadge:setLeftRight( true, false, 871, 1216 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( f5_local1, controller )
	StartMenuCurrencyCounts:setLeftRight( false, true, -612, -408 )
	StartMenuCurrencyCounts:setTopBottom( true, false, 25, 55 )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local storeCategoryList = LUI.UIList.new( f5_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	storeCategoryList:makeFocusable()
	storeCategoryList:setLeftRight( true, false, 66, 296 )
	storeCategoryList:setTopBottom( true, false, 106.56, 640.56 )
	storeCategoryList:setWidgetType( CoD.StoreCategoryButton )
	storeCategoryList:setVerticalCount( 8 )
	storeCategoryList:setDataSource( "StoreCategoryList" )
	storeCategoryList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f8_local0 = nil
		SetLoseFocusToElement( self, "productFrame", controller )
		SetSelectedStoreCategory( self, element, controller )
		ForceNotifyControllerModel( controller, "StoreRoot.ready" )
		return f8_local0
	end )
	storeCategoryList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		SetControllerModelValue( controller, "StoreRoot.isCategoryListInFocus", 1 )
		return f9_local0
	end )
	storeCategoryList:mergeStateConditions( {
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	self:addElement( storeCategoryList )
	self.storeCategoryList = storeCategoryList
	
	local productFrame = LUI.UIFrame.new( f5_local1, controller, 0, 0, false )
	productFrame:setLeftRight( true, false, 316, 1216 )
	productFrame:setTopBottom( true, false, 106.56, 636.56 )
	self:addElement( productFrame )
	self.productFrame = productFrame
	
	productFrame:linkToElementModel( storeCategoryList, nil, false, function ( model )
		productFrame:setModel( model, controller )
	end )
	productFrame:linkToElementModel( storeCategoryList, "frameWidget", true, function ( model )
		local frameWidget = Engine.GetModelValue( model )
		if frameWidget then
			productFrame:changeFrameWidget( frameWidget )
		end
	end )
	storeCategoryList.navigation = {
		right = productFrame
	}
	productFrame.navigation = {
		left = storeCategoryList
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "StoreRoot.isCategoryListInFocus" ), function ( model )
		local f13_local0 = self
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "StoreRoot.isCategoryListInFocus"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, f5_local1, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	CoD.Menu.AddNavigationHandler( f5_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f14_local0 = nil
		ShowPsStoreIcon( controller )
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		RecordStoreLastFocusedItemViewed( self, f15_arg0, f15_arg2, f15_arg1 )
		GoBack( self, f15_arg2 )
		ClearMenuSavedState( f15_arg1 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if not IsPC() then
			RedeemCode( self, f17_arg0, f17_arg2 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if not IsPC() then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_STORE_REDEEM_CODE" )
			return true
		else
			return false
		end
	end, false )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if IsModelValueEqualTo( f19_arg2, "StoreRoot.isCategoryListInFocus", 0 ) and not IsPerControllerTablePropertyValue( f19_arg2, "selectedStoreCategory", "FEATURED" ) then
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if IsModelValueEqualTo( f20_arg2, "StoreRoot.isCategoryListInFocus", 0 ) and not IsPerControllerTablePropertyValue( f20_arg2, "selectedStoreCategory", "FEATURED" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "MENU_LB_SCROLL_UP_SCROLL_DOWN" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		HidePsStoreIcon( controller )
		SetControllerModelValue( controller, "StoreRoot.isCategoryListInFocus", 0 )
		SetGlobalModelValueArg( "UpdateOnStoreClose", 1 )
	end )
	frame:setModel( self.buttonModel, controller )
	storeCategoryList.id = "storeCategoryList"
	productFrame.id = "productFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f5_local1
	} )
	if not self:restoreState() then
		self.storeCategoryList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.frame:close()
		element.SelfIdentityBadge:close()
		element.StartMenuCurrencyCounts:close()
		element.storeCategoryList:close()
		element.productFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Store.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

