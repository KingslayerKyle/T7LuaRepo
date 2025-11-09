require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )
require( "ui.uieditor.widgets.Store.Store_NonFeaturedFrame" )

local PreLoadFunc = function ( self, controller )
	CoD.StoreUtility.InitSingleCategoryStoreMenu( self, controller, "BO4" )
end

LUI.createMenu.Store_BO4 = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Store_BO4" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Store_BO4.buttonPrompts" )
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
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
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
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( self, controller )
	StartMenuCurrencyCounts:setLeftRight( false, true, -612, -408 )
	StartMenuCurrencyCounts:setTopBottom( true, false, 25, 55 )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local StoreNonFeaturedFrame = CoD.Store_NonFeaturedFrame.new( self, controller )
	StoreNonFeaturedFrame:setLeftRight( true, false, 316, 1216 )
	StoreNonFeaturedFrame:setTopBottom( true, false, 106.56, 636.56 )
	self:addElement( StoreNonFeaturedFrame )
	self.StoreNonFeaturedFrame = StoreNonFeaturedFrame
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f5_local0 = nil
		ShowPsStoreIcon( controller )
		if not f5_local0 then
			f5_local0 = self:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		RecordStoreLastFocusedItemViewed( self, element, controller, menu )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_STORE_REDEEM_CODE" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		HidePsStoreIcon( controller )
		SetControllerModelValue( controller, "StoreRoot.isCategoryListinFocus", 0 )
		SetGlobalModelValueArg( "UpdateOnStoreClose", 1 )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "StoreRoot.ready", function ( model )
		local f11_local0 = self
		if IsParamModelEqualTo( model, 1 ) then
			MakeElementFocusable( self, "StoreNonFeaturedFrame", controller )
			SetFocusToElement( self, "StoreNonFeaturedFrame", controller )
		end
	end )
	frame:setModel( self.buttonModel, controller )
	StoreNonFeaturedFrame.id = "StoreNonFeaturedFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.StoreNonFeaturedFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.frame:close()
		element.FEMenuLeftGraphics:close()
		element.SelfIdentityBadge:close()
		element.MissionRecordVaultlines02:close()
		element.MissionRecordVaultlines020:close()
		element.StartMenuCurrencyCounts:close()
		element.StoreNonFeaturedFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Store_BO4.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

