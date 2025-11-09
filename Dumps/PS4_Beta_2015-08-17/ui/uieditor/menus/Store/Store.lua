require( "ui.uieditor.widgets.Store.StoreProductButton" )
require( "ui.uieditor.widgets.Store.StoreRightPane" )
require( "ui.uieditor.widgets.Store.StoreSpinner" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
	Engine.CreateModel( rootModel, "ready" )
	Engine.CreateModel( rootModel, "storeSource" )
	Engine.CreateModel( rootModel, "storeLocation" )
	local forceUpdateCategory = false
	local categoryName = "BETA"
	Engine.FetchStoreProductsByCategory( controller, categoryName, forceUpdateCategory )
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Store.buttonPrompts" )
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
	
	local productList = LUI.UIList.new( self, controller, 8, 0, nil, true, false, 0, 0, false, false )
	productList:makeFocusable()
	productList:setLeftRight( true, false, 65, 816 )
	productList:setTopBottom( true, false, 116, 642 )
	productList:setDataSource( "StoreProductList" )
	productList:setWidgetType( CoD.StoreProductButton )
	productList:setHorizontalCount( 3 )
	productList:setVerticalCount( 3 )
	productList:setSpacing( 8 )
	productList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		RecordStoreOnItemGainFocus( self, element, controller, self )
		return retVal
	end )
	productList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		RecordStoreOnItemLoseFocus( self, element, controller, self )
		return retVal
	end )
	productList:subscribeToGlobalModel( controller, "StoreRoot", "ready", function ( model )
		local element = productList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( productList )
	self.productList = productList
	
	local rightPane = CoD.StoreRightPane.new( self, controller )
	rightPane:setLeftRight( true, false, 828, 1216 )
	rightPane:setTopBottom( true, false, 116, 642 )
	self:addElement( rightPane )
	self.rightPane = rightPane
	
	local itemStatus = LUI.UIText.new()
	itemStatus:setLeftRight( true, false, 64, 1216 )
	itemStatus:setTopBottom( true, false, 346, 371 )
	itemStatus:setText( Engine.Localize( "MENU_FILESHARE_LOADING" ) )
	itemStatus:setTTF( "fonts/escom.ttf" )
	itemStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( itemStatus )
	self.itemStatus = itemStatus
	
	local StoreSpinner = CoD.StoreSpinner.new( self, controller )
	StoreSpinner:setLeftRight( true, false, 620.43, 653 )
	StoreSpinner:setTopBottom( true, false, 309.35, 341.92 )
	StoreSpinner:setAlpha( 0 )
	self:addElement( StoreSpinner )
	self.StoreSpinner = StoreSpinner
	
	local frame = CoD.GenericMenuFrame.new( self, controller )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, true, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 70, 687.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( true, false, 871, 1216 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local MissionRecordVaultlines02 = CoD.MissionRecordVault_lines.new( self, controller )
	MissionRecordVaultlines02:setLeftRight( true, false, 58, 1290.14 )
	MissionRecordVaultlines02:setTopBottom( true, false, 114.56, 118.56 )
	MissionRecordVaultlines02:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines02 )
	self.MissionRecordVaultlines02 = MissionRecordVaultlines02
	
	local MissionRecordVaultlines020 = CoD.MissionRecordVault_lines.new( self, controller )
	MissionRecordVaultlines020:setLeftRight( true, false, 58, 1290.14 )
	MissionRecordVaultlines020:setTopBottom( true, false, 640.56, 644.56 )
	MissionRecordVaultlines020:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines020 )
	self.MissionRecordVaultlines020 = MissionRecordVaultlines020
	
	rightPane:linkToElementModel( productList, nil, false, function ( model )
		rightPane:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 0 )
				self.clipFinished( itemStatus, {} )
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
				self.itemStatus:setLeftRight( true, false, 450.5, 829.5 )
				self.itemStatus:setTopBottom( true, false, 360, 385 )
				self.itemStatus:setAlpha( 1 )
				self.itemStatus:setText( Engine.Localize( "MENU_STORE_FETCHING" ) )
				self.clipFinished( itemStatus, {} )
				StoreSpinner:completeAnimation()
				self.StoreSpinner:setLeftRight( true, false, 610.82, 661.18 )
				self.StoreSpinner:setTopBottom( true, false, 302.64, 353 )
				self.StoreSpinner:setAlpha( 1 )
				self.clipFinished( StoreSpinner, {} )
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
				StoreSpinner:completeAnimation()
				self.StoreSpinner:setAlpha( 0 )
				self.clipFinished( StoreSpinner, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				productList:completeAnimation()
				self.productList:setAlpha( 1 )
				self.clipFinished( productList, {} )
				rightPane:completeAnimation()
				self.rightPane:setAlpha( 1 )
				self.clipFinished( rightPane, {} )
				itemStatus:completeAnimation()
				self.itemStatus:setAlpha( 0 )
				self.clipFinished( itemStatus, {} )
				StoreSpinner:completeAnimation()
				self.StoreSpinner:setAlpha( 0 )
				self.clipFinished( StoreSpinner, {} )
				MissionRecordVaultlines02:completeAnimation()
				self.MissionRecordVaultlines02:setLeftRight( true, false, 58, 1303.14 )
				self.MissionRecordVaultlines02:setTopBottom( true, false, 127.56, 131.56 )
				self.clipFinished( MissionRecordVaultlines02, {} )
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
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "StoreRoot.ready"
		} )
	end )
	self:linkToElementModel( self, "purchasestatus", true, function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchasestatus"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
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
		HidePsStoreIcon( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualTo( element, controller, "purchasestatus", 0 ) then
			PurchaseProduct( self, element, controller )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "purchasestatus", 1 ) then
			PurchaseProduct( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualTo( element, controller, "purchasestatus", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PURCHASE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "purchasestatus", 1 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_DOWNLOAD" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		RedeemCode( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_STORE_REDEEM_CODE" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "MENU_LB_SCROLL_UP_SCROLL_DOWN" )
		return true
	end, false )
	productList.id = "productList"
	frame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.productList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.productList:close()
		self.rightPane:close()
		self.StoreSpinner:close()
		self.frame:close()
		self.FEMenuLeftGraphics:close()
		self.SelfIdentityBadge:close()
		self.MissionRecordVaultlines02:close()
		self.MissionRecordVaultlines020:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Store.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

