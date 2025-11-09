require( "ui.uieditor.widgets.Store.StoreProductButton" )
require( "ui.uieditor.widgets.Store.StoreRightPane" )
require( "ui.uieditor.widgets.Store.StoreSpinner" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	self.onLoseFocus = function ( f2_arg0, f2_arg1 )
		if f2_arg0.playMovieDelayTimer then
			f2_arg0.playMovieDelayTimer:close()
			f2_arg0.playMovieDelayTimer = nil
		end
	end
	
	self.onListItemGainFocus = function ( f3_arg0, f3_arg1, f3_arg2 )
		local f3_local0 = CoD.SafeGetModelValue( f3_arg1:getModel(), "videoLowResRef" )
		if f3_arg0.playMovieDelayTimer then
			f3_arg0.playMovieDelayTimer:close()
			f3_arg0.playMovieDelayTimer = nil
		end
		if f3_arg0.rightPane and f3_arg0.rightPane.frameWidget and not f3_arg0.rightPane.frameWidget.framedWidget then
			f3_arg0.rightPane.frameWidget:changeFrameWidget( "CoD.StorePreviewImageWidget" )
			f3_arg1.rightPaneFrameWidget = "StorePreviewImageWidget"
		end
		if f3_arg0.rightPane and f3_arg0.rightPane.frameWidget and f3_arg0.rightPane.frameWidget.framedWidget and f3_local0 ~= nil and f3_local0 ~= "" then
			f3_arg0:registerEventHandler( "play_movie_delay", function ( element, event )
				element.rightPane.frameWidget:changeFrameWidget( "CoD.StorePreviewMovieWidget" )
				f3_arg1.rightPaneFrameWidget = "StorePreviewMovieWidget"
				if element.rightPane.frameWidget.framedWidget.storeMovie then
					element.rightPane.frameWidget.framedWidget.storeMovie:setupMoviePlayback( f3_local0, false, true )
				end
			end )
			f3_arg0.playMovieDelayTimer = LUI.UITimer.new( 2000, {
				name = "play_movie_delay",
				controller = f3_arg2
			}, true )
			f3_arg0:addElement( f3_arg0.playMovieDelayTimer )
			f3_arg0:registerEventHandler( "finished_movie_playback", function ( element, event )
				element.rightPane.frameWidget.framedWidget.storeMovie:setupMoviePlayback( "" )
				element:addElement( LUI.UITimer.newElementTimer( 1, true, function ()
					element.rightPane.frameWidget.framedWidget.storeMovie:setupMoviePlayback( f3_local0, false, true )
				end ) )
			end )
		end
	end
	
	self.onListItemLoseFocus = function ( f7_arg0, f7_arg1, f7_arg2 )
		if f7_arg0.rightPane and f7_arg0.rightPane.frameWidget then
			if f7_arg0.rightPane.frameWidget.framedWidget and f7_arg0.rightPane.frameWidget.framedWidget.storeMovie then
				f7_arg0.rightPane.frameWidget.framedWidget.storeMovie:setupMoviePlayback( "" )
			end
			f7_arg0.rightPane.frameWidget:changeFrameWidget( "CoD.StorePreviewImageWidget" )
			f7_arg1.rightPaneFrameWidget = "StorePreviewImageWidget"
		end
	end
	
end

CoD.Store_NonFeaturedFrame = InheritFrom( LUI.UIElement )
CoD.Store_NonFeaturedFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Store_NonFeaturedFrame )
	self.id = "Store_NonFeaturedFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 900 )
	self:setTopBottom( true, false, 0, 530 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local productList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	productList:makeFocusable()
	productList:setLeftRight( true, false, 2, 502 )
	productList:setTopBottom( true, false, 2, 433 )
	productList:setWidgetType( CoD.StoreProductButton )
	productList:setHorizontalCount( 2 )
	productList:setVerticalCount( 3 )
	productList:setSpacing( 10 )
	productList:setDataSource( "StoreProductList" )
	productList:linkToElementModel( productList, "purchasestatus", true, function ( model )
		local f9_local0 = productList
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	productList:linkToElementModel( productList, "videoHighResRef", true, function ( model )
		local f10_local0 = productList
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "videoHighResRef"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	productList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f11_local0 = nil
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		CallCustomElementFunction_Self( self, "onListItemGainFocus", element, controller )
		SetControllerModelValue( controller, "StoreRoot.isCategoryListInFocus", 0 )
		return f11_local0
	end )
	productList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f12_local0 = nil
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		CallCustomElementFunction_Self( self, "onListItemLoseFocus", element, controller )
		return f12_local0
	end )
	productList:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		SetControllerModelValue( controller, "StoreRoot.isNonFeatureProductListInFocus", 1 )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f13_local0
	end )
	productList:registerEventHandler( "lose_focus", function ( element, event )
		local f14_local0 = nil
		if element.loseFocus then
			f14_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f14_local0 = element.super:loseFocus( event )
		end
		SetControllerModelValue( controller, "StoreRoot.isNonFeatureProductListInFocus", 0 )
		CallCustomElementFunction_Self( self, "onLoseFocus", controller )
		return f14_local0
	end )
	menu:AddButtonCallbackFunction( productList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "ESPORTS" ) then
			PurchaseProduct( self, element, controller )
			PlaySoundSetSound( self, "action" )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "ESPORTS" ) then
			PurchaseProduct( self, element, controller )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) and not DoesPlayerHaveExtraSlotsItem( controller ) then
			OpenBuyExtraSlotsPackDialog( self, element, controller )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "ESPORTS" ) and not DoesPlayerHaveEsportsPackItem( element, controller ) then
			OpenBuyInventoryItemDialog( self, element, controller, "Store" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "ESPORTS" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "ESPORTS" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD" )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) and not DoesPlayerHaveExtraSlotsItem( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "ESPORTS" ) and not DoesPlayerHaveEsportsPackItem( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( productList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( element, menu, controller, model )
		if IsSelfModelValueNonEmptyString( element, controller, "videoHighResRef" ) and IsElementPropertyValue( element, "rightPaneFrameWidget", "StorePreviewMovieWidget" ) then
			OpenStoreNonFeatureFrameVOD( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueNonEmptyString( element, controller, "videoHighResRef" ) and IsElementPropertyValue( element, "rightPaneFrameWidget", "StorePreviewMovieWidget" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	productList:subscribeToGlobalModel( controller, "PerController", "StoreRoot.ready", function ( model )
		UpdateDataSource( self, productList, controller )
		SetFocusToCorrectDLCPack( self, controller )
	end )
	self:addElement( productList )
	self.productList = productList
	
	local rightPane = CoD.StoreRightPane.new( menu, controller )
	rightPane:setLeftRight( true, false, 509, 897 )
	rightPane:setTopBottom( true, false, 2, 528 )
	self:addElement( rightPane )
	self.rightPane = rightPane
	
	local itemStatus = LUI.UIText.new()
	itemStatus:setLeftRight( true, false, 2, 897 )
	itemStatus:setTopBottom( true, false, 227.92, 252.92 )
	itemStatus:setAlpha( 0 )
	itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
	itemStatus:setTTF( "fonts/escom.ttf" )
	itemStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( itemStatus )
	self.itemStatus = itemStatus
	
	local storeSpinner = CoD.StoreSpinner.new( menu, controller )
	storeSpinner:setLeftRight( true, false, 418, 482 )
	storeSpinner:setTopBottom( true, false, 163.92, 227.92 )
	storeSpinner:setAlpha( 0 )
	self:addElement( storeSpinner )
	self.storeSpinner = storeSpinner
	
	local verticalCounter = CoD.verticalCounter.new( menu, controller )
	verticalCounter:setLeftRight( true, false, 152, 352 )
	verticalCounter:setTopBottom( true, false, 455.5, 480.5 )
	verticalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local f20_local0 = nil
		SetAsListVerticalCounter( self, element, "productList" )
		if not f20_local0 then
			f20_local0 = element:dispatchEventToChildren( event )
		end
		return f20_local0
	end )
	self:addElement( verticalCounter )
	self.verticalCounter = verticalCounter
	
	rightPane:linkToElementModel( productList, nil, false, function ( model )
		rightPane:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				productList:completeAnimation()
				self.productList:setAlpha( 1 )
				self.clipFinished( productList, {} )
				rightPane:completeAnimation()
				self.rightPane:setAlpha( 0 )
				self.clipFinished( rightPane, {} )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 0 )
				self.itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
				self.clipFinished( itemStatus, {} )
				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 0 )
				self.clipFinished( storeSpinner, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				productList:completeAnimation()
				self.productList:setAlpha( 0 )
				self.clipFinished( productList, {} )
				rightPane:completeAnimation()
				self.rightPane:setAlpha( 0 )
				self.clipFinished( rightPane, {} )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 1 )
				self.itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
				self.clipFinished( itemStatus, {} )
				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 1 )
				self.clipFinished( storeSpinner, {} )
			end
		},
		NoItems = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				productList:completeAnimation()
				self.productList:setAlpha( 0 )
				self.clipFinished( productList, {} )
				rightPane:completeAnimation()
				self.rightPane:setAlpha( 0 )
				self.clipFinished( rightPane, {} )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 1 )
				self.itemStatus:setText( Engine.Localize( "MENU_STORE_NO_ITEMS" ) )
				self.clipFinished( itemStatus, {} )
				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 0 )
				self.clipFinished( storeSpinner, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				productList:completeAnimation()
				self.productList:setAlpha( 1 )
				self.clipFinished( productList, {} )
				rightPane:completeAnimation()
				self.rightPane:setAlpha( 0 )
				self.clipFinished( rightPane, {} )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 0 )
				self.itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
				self.clipFinished( itemStatus, {} )
				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 0 )
				self.clipFinished( storeSpinner, {} )
			end
		},
		ShowDetails = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				productList:completeAnimation()
				self.productList:setAlpha( 1 )
				self.clipFinished( productList, {} )
				rightPane:completeAnimation()
				self.rightPane:setAlpha( 1 )
				self.clipFinished( rightPane, {} )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 0 )
				self.itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
				self.clipFinished( itemStatus, {} )
				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 0 )
				self.clipFinished( storeSpinner, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "StoreRoot.ready", 0 )
			end
		},
		{
			stateName = "NoItems",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "StoreRoot.ready", 1 ) and not HasStoreItems( controller )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "StoreRoot.ready", 1 ) and IsModelValueEqualTo( controller, "StoreRoot.isCategoryListInFocus", 1 )
			end
		},
		{
			stateName = "ShowDetails",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "StoreRoot.ready", 1 ) and IsModelValueEqualTo( controller, "StoreRoot.isCategoryListInFocus", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "StoreRoot.ready" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "StoreRoot.ready"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "StoreRoot.isCategoryListInFocus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "StoreRoot.isCategoryListInFocus"
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "StoreRoot.ready", function ( model )
		local f33_local0 = self
		if IsModelValueEqualTo( controller, "StoreRoot.ready", 1 ) and HasStoreItems( controller ) then
			MakeFocusable( f33_local0 )
		elseif IsModelValueEqualTo( controller, "StoreRoot.ready", 0 ) then
			MakeNotFocusable( f33_local0 )
		elseif IsModelValueEqualTo( controller, "StoreRoot.ready", 1 ) and not HasStoreItems( controller ) then
			MakeNotFocusable( f33_local0 )
		end
	end )
	productList.id = "productList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.productList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.productList:close()
		element.rightPane:close()
		element.storeSpinner:close()
		element.verticalCounter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

