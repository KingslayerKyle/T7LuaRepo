require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.collectibleItem" )

LUI.createMenu.PlaceSmallCollectible = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PlaceSmallCollectible" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PlaceSmallCollectible.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ImgVignetteFull = LUI.UIImage.new()
	ImgVignetteFull:setLeftRight( true, true, 0, 0 )
	ImgVignetteFull:setTopBottom( true, true, 0, 0 )
	ImgVignetteFull:setImage( RegisterImage( "uie_img_t7_hud_fx_vignette_fullblue" ) )
	ImgVignetteFull:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( ImgVignetteFull )
	self.ImgVignetteFull = ImgVignetteFull
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "COLLECTIBLE_PLACE_COLLECTIBLE" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "COLLECTIBLE_PLACE_COLLECTIBLE" ) ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 84, -19 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local collectibleItem0 = CoD.collectibleItem.new( self, controller )
	collectibleItem0:setLeftRight( false, false, -569, -189.5 )
	collectibleItem0:setTopBottom( false, false, -257, 13 )
	collectibleItem0:setAlpha( 0.01 )
	collectibleItem0:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_1", function ( model )
		collectibleItem0:setModel( model, controller )
	end )
	collectibleItem0:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		PDV_ChangeFocusCollectibleSlot( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f3_local0
	end )
	collectibleItem0:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PDV_SelectCollectibleSlot( self, element, controller )
		UploadStats( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		if PDV_SlotHasCollectible( element, controller ) then
			PDV_ClearCollectible( self, element, controller )
			UploadStats( self, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		PDV_ClearPreviewCollectible( self, element, controller )
		ClearSavedState( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem0 )
	self.collectibleItem0 = collectibleItem0
	
	local collectibleItem1 = CoD.collectibleItem.new( self, controller )
	collectibleItem1:setLeftRight( false, false, -173.5, 178.5 )
	collectibleItem1:setTopBottom( false, false, -257, 13 )
	collectibleItem1:setAlpha( 0.01 )
	collectibleItem1:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_2", function ( model )
		collectibleItem1:setModel( model, controller )
	end )
	collectibleItem1:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		PDV_ChangeFocusCollectibleSlot( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f12_local0
	end )
	collectibleItem1:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	self:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PDV_SelectCollectibleSlot( self, element, controller )
		UploadStats( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		if PDV_SlotHasCollectible( element, controller ) then
			PDV_ClearCollectible( self, element, controller )
			UploadStats( self, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		PDV_ClearPreviewCollectible( self, element, controller )
		ClearSavedState( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem1 )
	self.collectibleItem1 = collectibleItem1
	
	local collectibleItem2 = CoD.collectibleItem.new( self, controller )
	collectibleItem2:setLeftRight( false, false, 192.5, 576 )
	collectibleItem2:setTopBottom( false, false, -257, 13 )
	collectibleItem2:setAlpha( 0.01 )
	collectibleItem2:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_3", function ( model )
		collectibleItem2:setModel( model, controller )
	end )
	collectibleItem2:registerEventHandler( "gain_focus", function ( element, event )
		local f21_local0 = nil
		if element.gainFocus then
			f21_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f21_local0 = element.super:gainFocus( event )
		end
		PDV_ChangeFocusCollectibleSlot( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f21_local0
	end )
	collectibleItem2:registerEventHandler( "lose_focus", function ( element, event )
		local f22_local0 = nil
		if element.loseFocus then
			f22_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f22_local0 = element.super:loseFocus( event )
		end
		return f22_local0
	end )
	self:AddButtonCallbackFunction( collectibleItem2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PDV_SelectCollectibleSlot( self, element, controller )
		UploadStats( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( collectibleItem2, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		if PDV_SlotHasCollectible( element, controller ) then
			PDV_ClearCollectible( self, element, controller )
			UploadStats( self, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( collectibleItem2, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		PDV_ClearPreviewCollectible( self, element, controller )
		ClearSavedState( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem2 )
	self.collectibleItem2 = collectibleItem2
	
	local collectibleItem3 = CoD.collectibleItem.new( self, controller )
	collectibleItem3:setLeftRight( false, false, -569, -186.25 )
	collectibleItem3:setTopBottom( false, false, 32.5, 308.5 )
	collectibleItem3:setAlpha( 0.01 )
	collectibleItem3:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_4", function ( model )
		collectibleItem3:setModel( model, controller )
	end )
	collectibleItem3:registerEventHandler( "gain_focus", function ( element, event )
		local f30_local0 = nil
		if element.gainFocus then
			f30_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f30_local0 = element.super:gainFocus( event )
		end
		PDV_ChangeFocusCollectibleSlot( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f30_local0
	end )
	collectibleItem3:registerEventHandler( "lose_focus", function ( element, event )
		local f31_local0 = nil
		if element.loseFocus then
			f31_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f31_local0 = element.super:loseFocus( event )
		end
		return f31_local0
	end )
	self:AddButtonCallbackFunction( collectibleItem3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PDV_SelectCollectibleSlot( self, element, controller )
		UploadStats( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( collectibleItem3, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		if PDV_SlotHasCollectible( element, controller ) then
			PDV_ClearCollectible( self, element, controller )
			UploadStats( self, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( collectibleItem3, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		PDV_ClearPreviewCollectible( self, element, controller )
		ClearSavedState( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem3 )
	self.collectibleItem3 = collectibleItem3
	
	local collectibleItem4 = CoD.collectibleItem.new( self, controller )
	collectibleItem4:setLeftRight( false, false, -173.5, 178.5 )
	collectibleItem4:setTopBottom( false, false, 32.5, 308.5 )
	collectibleItem4:setAlpha( 0.01 )
	collectibleItem4:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_5", function ( model )
		collectibleItem4:setModel( model, controller )
	end )
	collectibleItem4:registerEventHandler( "gain_focus", function ( element, event )
		local f39_local0 = nil
		if element.gainFocus then
			f39_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f39_local0 = element.super:gainFocus( event )
		end
		PDV_ChangeFocusCollectibleSlot( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f39_local0
	end )
	collectibleItem4:registerEventHandler( "lose_focus", function ( element, event )
		local f40_local0 = nil
		if element.loseFocus then
			f40_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f40_local0 = element.super:loseFocus( event )
		end
		return f40_local0
	end )
	self:AddButtonCallbackFunction( collectibleItem4, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PDV_SelectCollectibleSlot( self, element, controller )
		UploadStats( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( collectibleItem4, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		if PDV_SlotHasCollectible( element, controller ) then
			PDV_ClearCollectible( self, element, controller )
			UploadStats( self, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( collectibleItem4, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		PDV_ClearPreviewCollectible( self, element, controller )
		ClearSavedState( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem4 )
	self.collectibleItem4 = collectibleItem4
	
	local collectibleItem5 = CoD.collectibleItem.new( self, controller )
	collectibleItem5:setLeftRight( false, false, 192.5, 576 )
	collectibleItem5:setTopBottom( false, false, 32.5, 308.5 )
	collectibleItem5:setAlpha( 0.01 )
	collectibleItem5:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_SMALL_6", function ( model )
		collectibleItem5:setModel( model, controller )
	end )
	collectibleItem5:registerEventHandler( "gain_focus", function ( element, event )
		local f48_local0 = nil
		if element.gainFocus then
			f48_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f48_local0 = element.super:gainFocus( event )
		end
		PDV_ChangeFocusCollectibleSlot( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f48_local0
	end )
	collectibleItem5:registerEventHandler( "lose_focus", function ( element, event )
		local f49_local0 = nil
		if element.loseFocus then
			f49_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f49_local0 = element.super:loseFocus( event )
		end
		return f49_local0
	end )
	self:AddButtonCallbackFunction( collectibleItem5, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PDV_SelectCollectibleSlot( self, element, controller )
		UploadStats( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( collectibleItem5, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		if PDV_SlotHasCollectible( element, controller ) then
			PDV_ClearCollectible( self, element, controller )
			UploadStats( self, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( collectibleItem5, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		PDV_ClearPreviewCollectible( self, element, controller )
		ClearSavedState( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem5 )
	self.collectibleItem5 = collectibleItem5
	
	collectibleItem0.navigation = {
		right = collectibleItem1,
		down = collectibleItem3
	}
	collectibleItem1.navigation = {
		left = collectibleItem0,
		right = collectibleItem2,
		down = collectibleItem4
	}
	collectibleItem2.navigation = {
		left = collectibleItem1,
		down = collectibleItem5
	}
	collectibleItem3.navigation = {
		up = collectibleItem0,
		right = collectibleItem4
	}
	collectibleItem4.navigation = {
		left = collectibleItem3,
		up = collectibleItem1,
		right = collectibleItem5
	}
	collectibleItem5.navigation = {
		left = collectibleItem4,
		up = collectibleItem2
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f56_local0 = nil
		SendClientScriptEnumNotifyForAdjustedClient( controller, "collectibles_slot_change", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_SMALL )
		if not f56_local0 then
			f56_local0 = self:dispatchEventToChildren( event )
		end
		return f56_local0
	end )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	collectibleItem0.id = "collectibleItem0"
	collectibleItem1.id = "collectibleItem1"
	collectibleItem2.id = "collectibleItem2"
	collectibleItem3.id = "collectibleItem3"
	collectibleItem4.id = "collectibleItem4"
	collectibleItem5.id = "collectibleItem5"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.collectibleItem0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrame0:close()
		element.FEMenuLeftGraphics:close()
		element.collectibleItem0:close()
		element.collectibleItem1:close()
		element.collectibleItem2:close()
		element.collectibleItem3:close()
		element.collectibleItem4:close()
		element.collectibleItem5:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlaceSmallCollectible.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

