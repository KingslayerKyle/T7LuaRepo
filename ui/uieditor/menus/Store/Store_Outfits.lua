-- c58028869f75111c95a1aae1af444416
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )
require( "ui.uieditor.widgets.Store.Store_NonFeaturedFrame" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.originalOcclusionChange = f1_arg0.m_eventHandlers.occlusion_change
	f1_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded and event.occludedBy and event.occludedBy.id == "Menu.Store_CodPoints" then
			CoD.perController[f1_arg1].selectedStoreCategory = "OUTFITS"
			ForceNotifyControllerModel( f1_arg1, "StoreRoot.ready" )
		end
		element:originalOcclusionChange( event )
	end )
end

local PreLoadFunc = function ( self, controller )
	CoD.StoreUtility.InitSingleCategoryStoreMenu( self, controller, "OUTFITS" )
end

LUI.createMenu.Store_Outfits = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Store_Outfits" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Store_Outfits.buttonPrompts" )
	local f4_local1 = self
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
	
	local frame = CoD.GenericMenuFrame.new( f4_local1, controller )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, true, 0, 0 )
	frame.titleLabel:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	self:addElement( frame )
	self.frame = frame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 70, 687.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f4_local1, controller )
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
	
	local MissionRecordVaultlines02 = CoD.MissionRecordVault_lines.new( f4_local1, controller )
	MissionRecordVaultlines02:setLeftRight( true, false, 58, 1290.14 )
	MissionRecordVaultlines02:setTopBottom( true, false, 114.56, 118.56 )
	MissionRecordVaultlines02:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines02 )
	self.MissionRecordVaultlines02 = MissionRecordVaultlines02
	
	local MissionRecordVaultlines020 = CoD.MissionRecordVault_lines.new( f4_local1, controller )
	MissionRecordVaultlines020:setLeftRight( true, false, 58, 1290.14 )
	MissionRecordVaultlines020:setTopBottom( true, false, 640.56, 644.56 )
	MissionRecordVaultlines020:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines020 )
	self.MissionRecordVaultlines020 = MissionRecordVaultlines020
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( f4_local1, controller )
	StartMenuCurrencyCounts:setLeftRight( false, true, -612, -408 )
	StartMenuCurrencyCounts:setTopBottom( true, false, 25, 55 )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local StoreNonFeaturedFrame = CoD.Store_NonFeaturedFrame.new( f4_local1, controller )
	StoreNonFeaturedFrame:setLeftRight( true, false, 316, 1216 )
	StoreNonFeaturedFrame:setTopBottom( true, false, 106.56, 636.56 )
	self:addElement( StoreNonFeaturedFrame )
	self.StoreNonFeaturedFrame = StoreNonFeaturedFrame
	
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		GoBack( self, f7_arg2 )
		ClearMenuSavedState( f7_arg1 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if not IsPC() then
			RedeemCode( self, f9_arg0, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if not IsPC() then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_STORE_REDEEM_CODE" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetControllerModelValue( controller, "StoreRoot.isCategoryListinFocus", 0 )
		SetGlobalModelValueArg( "UpdateOnStoreClose", 1 )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "StoreRoot.ready", function ( model )
		local f12_local0 = self
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
		menu = f4_local1
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Store_Outfits.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

