-- cf1e0bb967be23b2bde27b531f8b4d11
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.collectibleItem" )

LUI.createMenu.PlaceMediumCollectible = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PlaceMediumCollectible" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PlaceMediumCollectible.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local ImgVignetteFull = LUI.UIImage.new()
	ImgVignetteFull:setLeftRight( true, true, 0, 0 )
	ImgVignetteFull:setTopBottom( true, true, 0, 0 )
	ImgVignetteFull:setImage( RegisterImage( "uie_img_t7_hud_fx_vignette_fullblue" ) )
	ImgVignetteFull:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( ImgVignetteFull )
	self.ImgVignetteFull = ImgVignetteFull
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( f1_local1, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "COLLECTIBLE_PLACE_COLLECTIBLE" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "COLLECTIBLE_PLACE_COLLECTIBLE" ) ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 84, -19 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local collectibleItem1 = CoD.collectibleItem.new( f1_local1, controller )
	collectibleItem1:setLeftRight( false, false, 8, 576 )
	collectibleItem1:setTopBottom( false, false, -260, 301 )
	collectibleItem1:setAlpha( 0.01 )
	collectibleItem1:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_MEDIUM_2", function ( model )
		collectibleItem1:setModel( model, controller )
	end )
	collectibleItem1:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		PDV_ChangeFocusCollectibleSlot( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f3_local0
	end )
	collectibleItem1:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	f1_local1:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		PDV_SelectCollectibleSlot( self, f5_arg0, f5_arg2 )
		UploadStats( self, f5_arg2 )
		GoBack( self, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if PDV_SlotHasCollectible( f7_arg0, f7_arg2 ) then
			PDV_ClearCollectible( self, f7_arg0, f7_arg2 )
			UploadStats( self, f7_arg2 )
			GoBack( self, f7_arg2 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( f8_arg0, f8_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		PDV_ClearPreviewCollectible( self, f9_arg0, f9_arg2 )
		ClearSavedState( self, f9_arg2 )
		GoBack( self, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem1 )
	self.collectibleItem1 = collectibleItem1
	
	local collectibleItem0 = CoD.collectibleItem.new( f1_local1, controller )
	collectibleItem0:setLeftRight( true, false, 64, 631 )
	collectibleItem0:setTopBottom( false, false, -260, 301 )
	collectibleItem0:setAlpha( 0.01 )
	collectibleItem0:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_MEDIUM_1", function ( model )
		collectibleItem0:setModel( model, controller )
	end )
	collectibleItem0:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		PDV_ChangeFocusCollectibleSlot( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f12_local0
	end )
	collectibleItem0:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	f1_local1:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		PDV_SelectCollectibleSlot( self, f14_arg0, f14_arg2 )
		UploadStats( self, f14_arg2 )
		GoBack( self, f14_arg2 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if PDV_SlotHasCollectible( f16_arg0, f16_arg2 ) then
			PDV_ClearCollectible( self, f16_arg0, f16_arg2 )
			UploadStats( self, f16_arg2 )
			GoBack( self, f16_arg2 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( f17_arg0, f17_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		PDV_ClearPreviewCollectible( self, f18_arg0, f18_arg2 )
		ClearSavedState( self, f18_arg2 )
		GoBack( self, f18_arg2 )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem0 )
	self.collectibleItem0 = collectibleItem0
	
	collectibleItem1.navigation = {
		left = collectibleItem0
	}
	collectibleItem0.navigation = {
		right = collectibleItem1
	}
	CoD.Menu.AddNavigationHandler( f1_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f20_local0 = nil
		SendClientScriptEnumNotifyForAdjustedClient( controller, "collectibles_slot_change", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_MEDIUM )
		if not f20_local0 then
			f20_local0 = element:dispatchEventToChildren( event )
		end
		return f20_local0
	end )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	collectibleItem1.id = "collectibleItem1"
	collectibleItem0.id = "collectibleItem0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.collectibleItem1:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrame0:close()
		element.FEMenuLeftGraphics:close()
		element.collectibleItem1:close()
		element.collectibleItem0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlaceMediumCollectible.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

