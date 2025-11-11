require( "ui.uieditor.widgets.Store.StoreFeaturedCenterButton" )
require( "ui.uieditor.widgets.Store.StoreProductButton" )
require( "ui.uieditor.widgets.Store.StoreSpinner" )

CoD.Store_FeaturedFrame = InheritFrom( LUI.UIElement )
CoD.Store_FeaturedFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Store_FeaturedFrame )
	self.id = "Store_FeaturedFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1350 )
	self:setTopBottom( 0, 0, 0, 795 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
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
	
	local button2 = CoD.StoreProductButton.new( menu, controller )
	button2:setLeftRight( 0, 0, 0, 400 )
	button2:setTopBottom( 0, 0, 570, 795 )
	button2:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button2", function ( model )
		button2:setModel( model, controller )
	end )
	button2:linkToElementModel( button2, "purchasestatus", true, function ( model )
		local element = button2
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button2:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	button2:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		return retVal
	end )
	menu:AddButtonCallbackFunction( button2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE", nil )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( button2 )
	self.button2 = button2
	
	local button6 = CoD.StoreProductButton.new( menu, controller )
	button6:setLeftRight( 0, 0, 860, 1260 )
	button6:setTopBottom( 0, 0, 570, 795 )
	button6:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button6", function ( model )
		button6:setModel( model, controller )
	end )
	button6:linkToElementModel( button6, "purchasestatus", true, function ( model )
		local element = button6
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button6:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	button6:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		return retVal
	end )
	menu:AddButtonCallbackFunction( button6, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE", nil )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( button6 )
	self.button6 = button6
	
	local button3 = CoD.StoreProductButton.new( menu, controller )
	button3:setLeftRight( 0, 0, 423, 823 )
	button3:setTopBottom( 0, 0, 570, 795 )
	button3:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button3", function ( model )
		button3:setModel( model, controller )
	end )
	button3:linkToElementModel( button3, "purchasestatus", true, function ( model )
		local element = button3
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button3:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	button3:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		return retVal
	end )
	menu:AddButtonCallbackFunction( button3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE", nil )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( button3 )
	self.button3 = button3
	
	local button1 = CoD.StoreFeaturedCenterButton.new( menu, controller )
	button1:setLeftRight( 0, 0, 0, 825 )
	button1:setTopBottom( 0, 0, 0, 560 )
	button1:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button1", function ( model )
		button1:setModel( model, controller )
	end )
	button1:linkToElementModel( button1, "purchasestatus", true, function ( model )
		local element = button1
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button1:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		SetGlobalModelValueArg( "StoreRoot.isCategoryListInFocus", 0 )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	button1:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		return retVal
	end )
	menu:AddButtonCallbackFunction( button1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE", nil )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( button1 )
	self.button1 = button1
	
	local button5 = CoD.StoreProductButton.new( menu, controller )
	button5:setLeftRight( 0, 0, 860, 1260 )
	button5:setTopBottom( 0, 0, 283, 508 )
	button5:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button5", function ( model )
		button5:setModel( model, controller )
	end )
	button5:linkToElementModel( button5, "purchasestatus", true, function ( model )
		local element = button5
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button5:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	button5:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		return retVal
	end )
	menu:AddButtonCallbackFunction( button5, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE", nil )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( button5 )
	self.button5 = button5
	
	local button4 = CoD.StoreProductButton.new( menu, controller )
	button4:setLeftRight( 0, 0, 860, 1260 )
	button4:setTopBottom( 0, 0, 0, 225 )
	button4:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button4", function ( model )
		button4:setModel( model, controller )
	end )
	button4:linkToElementModel( button4, "purchasestatus", true, function ( model )
		local element = button4
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button4:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	button4:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		return retVal
	end )
	menu:AddButtonCallbackFunction( button4, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE", nil )
			return true
		elseif IsSelfModelValueEqualToEnum( element, controller, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( button4 )
	self.button4 = button4
	
	button2.navigation = {
		up = button1,
		right = button3
	}
	button6.navigation = {
		left = button3,
		up = button5
	}
	button3.navigation = {
		left = button2,
		up = button1,
		right = button6
	}
	button1.navigation = {
		right = {
			button4,
			button5
		},
		down = {
			button2,
			button3
		}
	}
	button5.navigation = {
		left = button1,
		up = button4,
		down = button6
	}
	button4.navigation = {
		left = button1,
		down = button5
	}
	self.resetProperties = function ()
		itemStatus:completeAnimation()
		storeSpinner:completeAnimation()
		button2:completeAnimation()
		button6:completeAnimation()
		button3:completeAnimation()
		button1:completeAnimation()
		button4:completeAnimation()
		button5:completeAnimation()
		itemStatus:setAlpha( 0 )
		itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
		storeSpinner:setAlpha( 0 )
		button2:setAlpha( 1 )
		button6:setAlpha( 1 )
		button3:setAlpha( 1 )
		button1:setAlpha( 1 )
		button4:setAlpha( 1 )
		button5:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Loading = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 1 )
				self.clipFinished( itemStatus, {} )
				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 1 )
				self.clipFinished( storeSpinner, {} )
				button2:completeAnimation()
				self.button2:setAlpha( 0 )
				self.clipFinished( button2, {} )
				button6:completeAnimation()
				self.button6:setAlpha( 0 )
				self.clipFinished( button6, {} )
				button3:completeAnimation()
				self.button3:setAlpha( 0 )
				self.clipFinished( button3, {} )
				button1:completeAnimation()
				self.button1:setAlpha( 0 )
				self.clipFinished( button1, {} )
				button5:completeAnimation()
				self.button5:setAlpha( 0 )
				self.clipFinished( button5, {} )
				button4:completeAnimation()
				self.button4:setAlpha( 0 )
				self.clipFinished( button4, {} )
			end
		},
		NoItems = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 1 )
				self.itemStatus:setText( Engine.Localize( "MENU_STORE_NO_ITEMS" ) )
				self.clipFinished( itemStatus, {} )
				button2:completeAnimation()
				self.button2:setAlpha( 0 )
				self.clipFinished( button2, {} )
				button6:completeAnimation()
				self.button6:setAlpha( 0 )
				self.clipFinished( button6, {} )
				button3:completeAnimation()
				self.button3:setAlpha( 0 )
				self.clipFinished( button3, {} )
				button1:completeAnimation()
				self.button1:setAlpha( 0 )
				self.clipFinished( button1, {} )
				button5:completeAnimation()
				self.button5:setAlpha( 0 )
				self.clipFinished( button5, {} )
				button4:completeAnimation()
				self.button4:setAlpha( 0 )
				self.clipFinished( button4, {} )
			end
		},
		Ready = {
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
				return IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 1 )
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:subscribeToGlobalModel( controller, "StoreRoot", "ready", function ( model )
		local element = self
		if IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 1 ) then
			MakeFocusable( element )
			UpdateGlobalDataSource( controller, "StoreFeaturedProductList" )
		elseif IsGlobalModelValueEqualTo( element, controller, "StoreRoot.ready", 0 ) then
			MakeNotFocusable( element, controller )
		end
	end )
	button2.id = "button2"
	button6.id = "button6"
	button3.id = "button3"
	button1.id = "button1"
	button5.id = "button5"
	button4.id = "button4"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.button1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.storeSpinner:close()
		self.button2:close()
		self.button6:close()
		self.button3:close()
		self.button1:close()
		self.button5:close()
		self.button4:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

