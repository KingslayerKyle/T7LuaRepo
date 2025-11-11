require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )
require( "ui.uieditor.widgets.Store.StoreCategoryButton" )

local PostLoadFunc = function ( self, controller )
	self.originalOcclusionChange = self.m_eventHandlers.occlusion_change
	self:registerEventHandler( "occlusion_change", function ( self, event )
		if not event.occluded then
			local category = "EXTRASLOTS"
			CoD.perController[controller].selectedStoreCategory = category
			ForceNotifyGlobalModel( controller, "StoreRoot.ready" )
			Engine.HidePsStoreIcon()
		end
		self:originalOcclusionChange( event )
	end )
end

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
	Engine.CreateModel( rootModel, "ready" )
	Engine.CreateModel( rootModel, "storeSource" )
	Engine.CreateModel( rootModel, "storeLocation" )
	local isCategoryListInFocusModel = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot.isCategoryListInFocus" )
	Engine.SetModelValue( isCategoryListInFocusModel, 1 )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.Store = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Store" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Store.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0.5, 0.5, -957, 963 )
	Background:setTopBottom( 0.5, 0.5, -540, 540 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local editorBackground = LUI.UIImage.new()
	editorBackground:setLeftRight( 0, 1, 0, 0 )
	editorBackground:setTopBottom( 0, 1, 0, 0 )
	editorBackground:setRGB( 0, 0, 0 )
	editorBackground:setAlpha( 0.75 )
	self:addElement( editorBackground )
	self.editorBackground = editorBackground
	
	local frame = CoD.GenericMenuFrame.new( self, controller )
	frame:setLeftRight( 0, 1, 0, 0 )
	frame:setTopBottom( 0, 1, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 105, 1031 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 0, 0, 1306, 1824 )
	SelfIdentityBadge:setTopBottom( 0, 0, 35, 125 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local MissionRecordVaultlines020 = CoD.MissionRecordVault_lines.new( self, controller )
	MissionRecordVaultlines020:setLeftRight( 0, 0, 87, 1935 )
	MissionRecordVaultlines020:setTopBottom( 0, 0, 961, 967 )
	MissionRecordVaultlines020:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines020 )
	self.MissionRecordVaultlines020 = MissionRecordVaultlines020
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( self, controller )
	StartMenuCurrencyCounts:setLeftRight( 1, 1, -918, -612 )
	StartMenuCurrencyCounts:setTopBottom( 0, 0, 37.5, 82.5 )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local storeCategoryList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	storeCategoryList:makeFocusable()
	storeCategoryList:mergeStateConditions( {
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	storeCategoryList:setLeftRight( 0, 0, 99, 444 )
	storeCategoryList:setTopBottom( 0, 0, 164, 756 )
	storeCategoryList:setWidgetType( CoD.StoreCategoryButton )
	storeCategoryList:setVerticalCount( 6 )
	storeCategoryList:setDataSource( "StoreCategoryList" )
	storeCategoryList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetSelectedStoreCategory( self, element, controller )
		SetGlobalModelValueArg( "StoreRoot.isCategoryListInFocus", 1 )
		return retVal
	end )
	self:addElement( storeCategoryList )
	self.storeCategoryList = storeCategoryList
	
	local productFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	productFrame:setLeftRight( 0, 0, 474, 1824 )
	productFrame:setTopBottom( 0, 0, 160, 955 )
	self:addElement( productFrame )
	self.productFrame = productFrame
	
	productFrame:linkToElementModel( storeCategoryList, nil, false, function ( model )
		productFrame:setModel( model, controller )
	end )
	productFrame:linkToElementModel( storeCategoryList, "frameWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			productFrame:changeFrameWidget( modelValue )
		end
	end )
	SelfIdentityBadge.navigation = {
		down = productFrame
	}
	storeCategoryList.navigation = {
		right = productFrame
	}
	productFrame.navigation = {
		left = storeCategoryList,
		up = SelfIdentityBadge
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "StoreRoot.isCategoryListInFocus" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "StoreRoot.isCategoryListInFocus"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowPsStoreIcon( controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		RecordStoreLastFocusedItemViewed( self, element, controller, menu )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not IsPC() then
			RedeemCode( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_STORE_REDEEM_CODE", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if IsGlobalModelValueEqualTo( element, controller, "StoreRoot.isCategoryListInFocus", 0 ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "FEATURED" ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsGlobalModelValueEqualTo( element, controller, "StoreRoot.isCategoryListInFocus", 0 ) and not IsPerControllerTablePropertyValue( controller, "selectedStoreCategory", "FEATURED" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "MENU_LB_SCROLL_UP_SCROLL_DOWN", nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		HidePsStoreIcon( controller )
		SetGlobalModelValueArg( "StoreRoot.isCategoryListInFocus", 0 )
		SetGlobalModelValueArg( "UpdateOnStoreClose", 1 )
	end )
	frame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	storeCategoryList.id = "storeCategoryList"
	productFrame.id = "productFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.storeCategoryList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.frame:close()
		self.FEMenuLeftGraphics:close()
		self.SelfIdentityBadge:close()
		self.MissionRecordVaultlines020:close()
		self.StartMenuCurrencyCounts:close()
		self.storeCategoryList:close()
		self.productFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Store.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

