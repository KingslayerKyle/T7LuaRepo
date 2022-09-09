-- 296ff7ed111c0f571c2ddf8df1485beb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Store.StoreSpinner" )
require( "ui.uieditor.widgets.Store.StoreVideoProductButton" )
require( "ui.uieditor.widgets.Store.StoreFeaturedCenterButton" )

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
	self:setLeftRight( true, false, 0, 900 )
	self:setTopBottom( true, false, 0, 530 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
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
	
	local button2 = CoD.StoreVideoProductButton.new( menu, controller )
	button2:setLeftRight( true, false, 0, 267 )
	button2:setTopBottom( true, false, 380, 530 )
	button2:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button2", function ( model )
		button2:setModel( model, controller )
	end )
	button2:linkToElementModel( button2, "purchasestatus", true, function ( model )
		local f3_local0 = button2
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button2:linkToElementModel( button2, "videoHighResRef", true, function ( model )
		local f4_local0 = button2
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "videoHighResRef"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	button2:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetGainFocus( self, element, controller )
		SetControllerModelValue( controller, "StoreRoot.isCategoryListInFocus", 0 )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f5_local0
	end )
	button2:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetLoseFocus( self, element, controller )
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( button2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if IsSelfModelValueEqualToEnum( f7_arg0, f7_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, f7_arg0, f7_arg2 )
			return true
		elseif IsSelfModelValueEqualToEnum( f7_arg0, f7_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, f7_arg0, f7_arg2 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if IsSelfModelValueEqualToEnum( f8_arg0, f8_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		elseif IsSelfModelValueEqualToEnum( f8_arg0, f8_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( button2, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if IsSelfModelValueNonEmptyString( f9_arg0, f9_arg2, "videoHighResRef" ) and IsElementPropertyValue( f9_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			OpenStoreFeatureFrameVOD( self, f9_arg0, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if IsSelfModelValueNonEmptyString( f10_arg0, f10_arg2, "videoHighResRef" ) and IsElementPropertyValue( f10_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( button2 )
	self.button2 = button2
	
	local button6 = CoD.StoreVideoProductButton.new( menu, controller )
	button6:setLeftRight( true, false, 573, 840 )
	button6:setTopBottom( true, false, 380, 530 )
	button6:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button6", function ( model )
		button6:setModel( model, controller )
	end )
	button6:linkToElementModel( button6, "purchasestatus", true, function ( model )
		local f12_local0 = button6
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button6:linkToElementModel( button6, "videoHighResRef", true, function ( model )
		local f13_local0 = button6
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "videoHighResRef"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	button6:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetGainFocus( self, element, controller )
		SetControllerModelValue( controller, "StoreRoot.isCategoryListInFocus", 0 )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f14_local0
	end )
	button6:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetLoseFocus( self, element, controller )
		return f15_local0
	end )
	menu:AddButtonCallbackFunction( button6, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if IsSelfModelValueEqualToEnum( f16_arg0, f16_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, f16_arg0, f16_arg2 )
			return true
		elseif IsSelfModelValueEqualToEnum( f16_arg0, f16_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, f16_arg0, f16_arg2 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if IsSelfModelValueEqualToEnum( f17_arg0, f17_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		elseif IsSelfModelValueEqualToEnum( f17_arg0, f17_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( button6, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if IsSelfModelValueNonEmptyString( f18_arg0, f18_arg2, "videoHighResRef" ) and IsElementPropertyValue( f18_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			OpenStoreFeatureFrameVOD( self, f18_arg0, f18_arg2 )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		if IsSelfModelValueNonEmptyString( f19_arg0, f19_arg2, "videoHighResRef" ) and IsElementPropertyValue( f19_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( button6 )
	self.button6 = button6
	
	local button3 = CoD.StoreVideoProductButton.new( menu, controller )
	button3:setLeftRight( true, false, 282, 549 )
	button3:setTopBottom( true, false, 380, 530 )
	button3:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button3", function ( model )
		button3:setModel( model, controller )
	end )
	button3:linkToElementModel( button3, "purchasestatus", true, function ( model )
		local f21_local0 = button3
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button3:linkToElementModel( button3, "videoHighResRef", true, function ( model )
		local f22_local0 = button3
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "videoHighResRef"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	button3:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetGainFocus( self, element, controller )
		SetControllerModelValue( controller, "StoreRoot.isCategoryListInFocus", 0 )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f23_local0
	end )
	button3:registerEventHandler( "lose_focus", function ( element, event )
		local f24_local0 = nil
		if element.loseFocus then
			f24_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f24_local0 = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetLoseFocus( self, element, controller )
		return f24_local0
	end )
	menu:AddButtonCallbackFunction( button3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, f25_arg0, f25_arg2 )
			return true
		elseif IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, f25_arg0, f25_arg2 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if IsSelfModelValueEqualToEnum( f26_arg0, f26_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		elseif IsSelfModelValueEqualToEnum( f26_arg0, f26_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( button3, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		if IsSelfModelValueNonEmptyString( f27_arg0, f27_arg2, "videoHighResRef" ) and IsElementPropertyValue( f27_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			OpenStoreFeatureFrameVOD( self, f27_arg0, f27_arg2 )
			return true
		else
			
		end
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		if IsSelfModelValueNonEmptyString( f28_arg0, f28_arg2, "videoHighResRef" ) and IsElementPropertyValue( f28_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( button3 )
	self.button3 = button3
	
	local button1 = CoD.StoreFeaturedCenterButton.new( menu, controller )
	button1:setLeftRight( true, false, 0, 550 )
	button1:setTopBottom( true, false, 0, 373 )
	button1:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button1", function ( model )
		button1:setModel( model, controller )
	end )
	button1:linkToElementModel( button1, "purchasestatus", true, function ( model )
		local f30_local0 = button1
		local f30_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( f30_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button1:linkToElementModel( button1, "videoHighResRef", true, function ( model )
		local f31_local0 = button1
		local f31_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "videoHighResRef"
		}
		CoD.Menu.UpdateButtonShownState( f31_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	button1:registerEventHandler( "gain_focus", function ( element, event )
		local f32_local0 = nil
		if element.gainFocus then
			f32_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f32_local0 = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		StoreFeatureFrameWidgetGainFocus( self, element, controller )
		SetControllerModelValue( controller, "Store.isCategoryListInFocus", 0 )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f32_local0
	end )
	button1:registerEventHandler( "lose_focus", function ( element, event )
		local f33_local0 = nil
		if element.loseFocus then
			f33_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f33_local0 = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		StoreFeatureFrameWidgetLoseFocus( self, element, controller )
		return f33_local0
	end )
	menu:AddButtonCallbackFunction( button1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
		if IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, f34_arg0, f34_arg2 )
			return true
		elseif IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, f34_arg0, f34_arg2 )
			return true
		else
			
		end
	end, function ( f35_arg0, f35_arg1, f35_arg2 )
		if IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		elseif IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( button1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		if IsSelfModelValueNonEmptyString( f36_arg0, f36_arg2, "videoHighResRef" ) and IsElementPropertyValue( f36_arg0, "frameWidgetName", "StoreFeaturePreviewMovieWidget" ) then
			OpenStoreFeatureFrameVOD( self, f36_arg0, f36_arg2 )
			return true
		else
			
		end
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		if IsSelfModelValueNonEmptyString( f37_arg0, f37_arg2, "videoHighResRef" ) and IsElementPropertyValue( f37_arg0, "frameWidgetName", "StoreFeaturePreviewMovieWidget" ) then
			CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( button1 )
	self.button1 = button1
	
	local button5 = CoD.StoreVideoProductButton.new( menu, controller )
	button5:setLeftRight( true, false, 573, 840 )
	button5:setTopBottom( true, false, 188.5, 338.5 )
	button5:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button5", function ( model )
		button5:setModel( model, controller )
	end )
	button5:linkToElementModel( button5, "purchasestatus", true, function ( model )
		local f39_local0 = button5
		local f39_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( f39_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button5:linkToElementModel( button5, "videoHighResRef", true, function ( model )
		local f40_local0 = button5
		local f40_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "videoHighResRef"
		}
		CoD.Menu.UpdateButtonShownState( f40_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	button5:registerEventHandler( "gain_focus", function ( element, event )
		local f41_local0 = nil
		if element.gainFocus then
			f41_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f41_local0 = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetGainFocus( self, element, controller )
		SetControllerModelValue( controller, "StoreRoot.isCategoryListInFocus", 0 )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f41_local0
	end )
	button5:registerEventHandler( "lose_focus", function ( element, event )
		local f42_local0 = nil
		if element.loseFocus then
			f42_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f42_local0 = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetLoseFocus( self, element, controller )
		return f42_local0
	end )
	menu:AddButtonCallbackFunction( button5, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		if IsSelfModelValueEqualToEnum( f43_arg0, f43_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, f43_arg0, f43_arg2 )
			return true
		elseif IsSelfModelValueEqualToEnum( f43_arg0, f43_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, f43_arg0, f43_arg2 )
			return true
		else
			
		end
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		if IsSelfModelValueEqualToEnum( f44_arg0, f44_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		elseif IsSelfModelValueEqualToEnum( f44_arg0, f44_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( button5, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
		if IsSelfModelValueNonEmptyString( f45_arg0, f45_arg2, "videoHighResRef" ) and IsElementPropertyValue( f45_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			OpenStoreFeatureFrameVOD( self, f45_arg0, f45_arg2 )
			return true
		else
			
		end
	end, function ( f46_arg0, f46_arg1, f46_arg2 )
		if IsSelfModelValueNonEmptyString( f46_arg0, f46_arg2, "videoHighResRef" ) and IsElementPropertyValue( f46_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			CoD.Menu.SetButtonLabel( f46_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( button5 )
	self.button5 = button5
	
	local button4 = CoD.StoreVideoProductButton.new( menu, controller )
	button4:setLeftRight( true, false, 573, 840 )
	button4:setTopBottom( true, false, 0, 150 )
	button4:subscribeToGlobalModel( controller, "StoreFeaturedProductList", "button4", function ( model )
		button4:setModel( model, controller )
	end )
	button4:linkToElementModel( button4, "purchasestatus", true, function ( model )
		local f48_local0 = button4
		local f48_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( f48_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	button4:linkToElementModel( button4, "videoHighResRef", true, function ( model )
		local f49_local0 = button4
		local f49_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "videoHighResRef"
		}
		CoD.Menu.UpdateButtonShownState( f49_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	button4:registerEventHandler( "gain_focus", function ( element, event )
		local f50_local0 = nil
		if element.gainFocus then
			f50_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f50_local0 = element.super:gainFocus( event )
		end
		RecordStoreOnItemGainFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetGainFocus( self, element, controller )
		SetControllerModelValue( controller, "StoreRoot.isCategoryListInFocus", 0 )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f50_local0
	end )
	button4:registerEventHandler( "lose_focus", function ( element, event )
		local f51_local0 = nil
		if element.loseFocus then
			f51_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f51_local0 = element.super:loseFocus( event )
		end
		RecordStoreOnItemLoseFocus( self, element, controller, menu )
		StoreVideoProductFrameWidgetLoseFocus( self, element, controller )
		return f51_local0
	end )
	menu:AddButtonCallbackFunction( button4, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
		if IsSelfModelValueEqualToEnum( f52_arg0, f52_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			PurchaseProduct( self, f52_arg0, f52_arg2 )
			return true
		elseif IsSelfModelValueEqualToEnum( f52_arg0, f52_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			PurchaseProduct( self, f52_arg0, f52_arg2 )
			return true
		else
			
		end
	end, function ( f53_arg0, f53_arg1, f53_arg2 )
		if IsSelfModelValueEqualToEnum( f53_arg0, f53_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f53_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		elseif IsSelfModelValueEqualToEnum( f53_arg0, f53_arg2, "purchasestatus", Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED ) then
			CoD.Menu.SetButtonLabel( f53_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( button4, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
		if IsSelfModelValueNonEmptyString( f54_arg0, f54_arg2, "videoHighResRef" ) and IsElementPropertyValue( f54_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			OpenStoreFeatureFrameVOD( self, f54_arg0, f54_arg2 )
			return true
		else
			
		end
	end, function ( f55_arg0, f55_arg1, f55_arg2 )
		if IsSelfModelValueNonEmptyString( f55_arg0, f55_arg2, "videoHighResRef" ) and IsElementPropertyValue( f55_arg0, "frameWidgetName", "StoreVideoProductButtonMovieWidget" ) then
			CoD.Menu.SetButtonLabel( f55_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 0 )
				self.itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
				self.clipFinished( itemStatus, {} )

				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 0 )
				self.clipFinished( storeSpinner, {} )

				button2:completeAnimation()
				self.button2:setAlpha( 1 )
				self.clipFinished( button2, {} )

				button6:completeAnimation()
				self.button6:setAlpha( 1 )
				self.clipFinished( button6, {} )

				button3:completeAnimation()
				self.button3:setAlpha( 1 )
				self.clipFinished( button3, {} )

				button1:completeAnimation()
				self.button1:setAlpha( 1 )
				self.clipFinished( button1, {} )

				button5:completeAnimation()
				self.button5:setAlpha( 1 )
				self.clipFinished( button5, {} )

				button4:completeAnimation()
				self.button4:setAlpha( 1 )
				self.clipFinished( button4, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 1 )
				self.itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
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
				self:setupElementClipCounter( 8 )

				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 1 )
				self.itemStatus:setText( Engine.Localize( "MENU_STORE_NO_ITEMS" ) )
				self.clipFinished( itemStatus, {} )

				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 0 )
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
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 0 )
				self.itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
				self.clipFinished( itemStatus, {} )

				storeSpinner:completeAnimation()
				self.storeSpinner:setAlpha( 0 )
				self.clipFinished( storeSpinner, {} )

				button2:completeAnimation()
				self.button2:setAlpha( 1 )
				self.clipFinished( button2, {} )

				button6:completeAnimation()
				self.button6:setAlpha( 1 )
				self.clipFinished( button6, {} )

				button3:completeAnimation()
				self.button3:setAlpha( 1 )
				self.clipFinished( button3, {} )

				button1:completeAnimation()
				self.button1:setAlpha( 1 )
				self.clipFinished( button1, {} )

				button5:completeAnimation()
				self.button5:setAlpha( 1 )
				self.clipFinished( button5, {} )

				button4:completeAnimation()
				self.button4:setAlpha( 1 )
				self.clipFinished( button4, {} )
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
				return IsModelValueEqualTo( controller, "StoreRoot.ready", 1 )
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:subscribeToGlobalModel( controller, "PerController", "StoreRoot.ready", function ( model )
		local f64_local0 = self
		if IsModelValueEqualTo( controller, "StoreRoot.ready", 1 ) then
			MakeFocusable( f64_local0 )
			UpdateGlobalDataSource( controller, "StoreFeaturedProductList" )
		elseif IsModelValueEqualTo( controller, "StoreRoot.ready", 0 ) then
			MakeNotFocusable( f64_local0 )
		end
	end )
	button2.id = "button2"
	button6.id = "button6"
	button3.id = "button3"
	button1.id = "button1"
	button5.id = "button5"
	button4.id = "button4"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.button1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.storeSpinner:close()
		element.button2:close()
		element.button6:close()
		element.button3:close()
		element.button1:close()
		element.button5:close()
		element.button4:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
