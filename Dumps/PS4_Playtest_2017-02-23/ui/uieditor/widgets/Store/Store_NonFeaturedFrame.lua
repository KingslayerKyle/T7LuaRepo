require( "ui.uieditor.widgets.Store.StoreProductButton" )
require( "ui.uieditor.widgets.Store.StoreRightPane" )
require( "ui.uieditor.widgets.Store.StoreSpinner" )

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
	self:setLeftRight( 0, 0, 0, 1350 )
	self:setTopBottom( 0, 0, 0, 795 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local productList = LUI.UIList.new( menu, controller, 15, 0, nil, false, false, 0, 0, false, false )
	productList:makeFocusable()
	productList:setLeftRight( 0, 0, 3, 752 )
	productList:setTopBottom( 0, 0, 4, 649 )
	productList:setWidgetType( CoD.StoreProductButton )
	productList:setHorizontalCount( 2 )
	productList:setVerticalCount( 3 )
	productList:setSpacing( 15 )
	productList:setDataSource( "StoreProductList" )
	productList:linkToElementModel( productList, "purchasestatus", true, function ( model )
		local element = productList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	productList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		SetGlobalModelValueArg( "StoreRoot.isCategoryListInFocus", 0 )
		return retVal
	end )
	productList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		return retVal
	end )
	productList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	productList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( productList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) then
			PurchaseProduct( self, element, controller )
			PlaySoundSetSound( self, "action" )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) then
			PurchaseProduct( self, element, controller )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) and not DoesPlayerHaveExtraSlotsItem( controller ) then
			OpenBuyExtraSlotsPackDialog( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE", nil )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD", nil )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "EXTRASLOTS" ) and not DoesPlayerHaveExtraSlotsItem( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE", nil )
			return true
		else
			return false
		end
	end, false )
	productList:subscribeToGlobalModel( controller, "StoreRoot", "ready", function ( model )
		local element = productList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( productList )
	self.productList = productList
	
	local rightPane = CoD.StoreRightPane.new( menu, controller )
	rightPane:setLeftRight( 0, 0, 763, 1345 )
	rightPane:setTopBottom( 0, 0, 3.5, 792.5 )
	self:addElement( rightPane )
	self.rightPane = rightPane
	
	local itemStatus = LUI.UIText.new()
	itemStatus:setLeftRight( 0, 0, 3, 1345 )
	itemStatus:setTopBottom( 0, 0, 342, 380 )
	itemStatus:setAlpha( 0 )
	itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
	itemStatus:setTTF( "fonts/escom.ttf" )
	itemStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( itemStatus )
	self.itemStatus = itemStatus
	
	local storeSpinner = CoD.StoreSpinner.new( menu, controller )
	storeSpinner:setLeftRight( 0, 0, 627, 723 )
	storeSpinner:setTopBottom( 0, 0, 246, 342 )
	storeSpinner:setAlpha( 0 )
	self:addElement( storeSpinner )
	self.storeSpinner = storeSpinner
	
	rightPane:linkToElementModel( productList, nil, false, function ( model )
		rightPane:setModel( model, controller )
	end )
	self.resetProperties = function ()
		rightPane:completeAnimation()
		itemStatus:completeAnimation()
		productList:completeAnimation()
		storeSpinner:completeAnimation()
		rightPane:setAlpha( 1 )
		itemStatus:setAlpha( 0 )
		itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
		productList:setAlpha( 1 )
		storeSpinner:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				rightPane:completeAnimation()
				self.rightPane:setAlpha( 0 )
				self.clipFinished( rightPane, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				productList:completeAnimation()
				self.productList:setAlpha( 0 )
				self.clipFinished( productList, {} )
				rightPane:completeAnimation()
				self.rightPane:setAlpha( 0 )
				self.clipFinished( rightPane, {} )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 1 )
				self.clipFinished( itemStatus, {} )
				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 1 )
				self.clipFinished( storeSpinner, {} )
			end
		},
		NoItems = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
			end
		},
		Ready = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				rightPane:completeAnimation()
				self.rightPane:setAlpha( 0 )
				self.clipFinished( rightPane, {} )
			end
		},
		ShowDetails = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 0 )
			end
		},
		{
			stateName = "NoItems",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 1 ) and not HasStoreItems( controller )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 1 ) and IsGlobalModelValueEqualTo( element, controller, "StoreRoot.isCategoryListInFocus", 1 )
			end
		},
		{
			stateName = "ShowDetails",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "StoreRoot.isCategoryListInFocus", 0 ) and IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "StoreRoot.ready" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "StoreRoot.ready"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "StoreRoot.isCategoryListInFocus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "StoreRoot.isCategoryListInFocus"
		} )
	end )
	self:subscribeToGlobalModel( controller, "StoreRoot", "ready", function ( model )
		local element = self
		if IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 1 ) and HasStoreItems( controller ) then
			MakeFocusable( element )
		elseif IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 0 ) then
			MakeNotFocusable( element, controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 1 ) and not HasStoreItems( controller ) then
			MakeNotFocusable( element, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.productList:close()
		self.rightPane:close()
		self.storeSpinner:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

