-- a6341d2cd2b9988f5ee58fa495d8c688
-- This hash is used for caching, delete to decompile the file again

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
	
	local collectibleItem0 = CoD.collectibleItem.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	f1_local1:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		PDV_SelectCollectibleSlot( self, f5_arg0, f5_arg2 )
		UploadStats( self, f5_arg2 )
		GoBack( self, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
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
	f1_local1:AddButtonCallbackFunction( collectibleItem0, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		PDV_ClearPreviewCollectible( self, f9_arg0, f9_arg2 )
		ClearSavedState( self, f9_arg2 )
		GoBack( self, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem0 )
	self.collectibleItem0 = collectibleItem0
	
	local collectibleItem1 = CoD.collectibleItem.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	f1_local1:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		PDV_SelectCollectibleSlot( self, f14_arg0, f14_arg2 )
		UploadStats( self, f14_arg2 )
		GoBack( self, f14_arg2 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
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
	f1_local1:AddButtonCallbackFunction( collectibleItem1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		PDV_ClearPreviewCollectible( self, f18_arg0, f18_arg2 )
		ClearSavedState( self, f18_arg2 )
		GoBack( self, f18_arg2 )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem1 )
	self.collectibleItem1 = collectibleItem1
	
	local collectibleItem2 = CoD.collectibleItem.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	f1_local1:AddButtonCallbackFunction( collectibleItem2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		PDV_SelectCollectibleSlot( self, f23_arg0, f23_arg2 )
		UploadStats( self, f23_arg2 )
		GoBack( self, f23_arg2 )
		return true
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem2, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if PDV_SlotHasCollectible( f25_arg0, f25_arg2 ) then
			PDV_ClearCollectible( self, f25_arg0, f25_arg2 )
			UploadStats( self, f25_arg2 )
			GoBack( self, f25_arg2 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( f26_arg0, f26_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem2, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		PDV_ClearPreviewCollectible( self, f27_arg0, f27_arg2 )
		ClearSavedState( self, f27_arg2 )
		GoBack( self, f27_arg2 )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem2 )
	self.collectibleItem2 = collectibleItem2
	
	local collectibleItem3 = CoD.collectibleItem.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	f1_local1:AddButtonCallbackFunction( collectibleItem3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
		PDV_SelectCollectibleSlot( self, f32_arg0, f32_arg2 )
		UploadStats( self, f32_arg2 )
		GoBack( self, f32_arg2 )
		return true
	end, function ( f33_arg0, f33_arg1, f33_arg2 )
		CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem3, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
		if PDV_SlotHasCollectible( f34_arg0, f34_arg2 ) then
			PDV_ClearCollectible( self, f34_arg0, f34_arg2 )
			UploadStats( self, f34_arg2 )
			GoBack( self, f34_arg2 )
			return true
		else
			
		end
	end, function ( f35_arg0, f35_arg1, f35_arg2 )
		CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( f35_arg0, f35_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem3, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		PDV_ClearPreviewCollectible( self, f36_arg0, f36_arg2 )
		ClearSavedState( self, f36_arg2 )
		GoBack( self, f36_arg2 )
		return true
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem3 )
	self.collectibleItem3 = collectibleItem3
	
	local collectibleItem4 = CoD.collectibleItem.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	f1_local1:AddButtonCallbackFunction( collectibleItem4, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		PDV_SelectCollectibleSlot( self, f41_arg0, f41_arg2 )
		UploadStats( self, f41_arg2 )
		GoBack( self, f41_arg2 )
		return true
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem4, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		if PDV_SlotHasCollectible( f43_arg0, f43_arg2 ) then
			PDV_ClearCollectible( self, f43_arg0, f43_arg2 )
			UploadStats( self, f43_arg2 )
			GoBack( self, f43_arg2 )
			return true
		else
			
		end
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( f44_arg0, f44_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem4, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
		PDV_ClearPreviewCollectible( self, f45_arg0, f45_arg2 )
		ClearSavedState( self, f45_arg2 )
		GoBack( self, f45_arg2 )
		return true
	end, function ( f46_arg0, f46_arg1, f46_arg2 )
		CoD.Menu.SetButtonLabel( f46_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( collectibleItem4 )
	self.collectibleItem4 = collectibleItem4
	
	local collectibleItem5 = CoD.collectibleItem.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	f1_local1:AddButtonCallbackFunction( collectibleItem5, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
		PDV_SelectCollectibleSlot( self, f50_arg0, f50_arg2 )
		UploadStats( self, f50_arg2 )
		GoBack( self, f50_arg2 )
		return true
	end, function ( f51_arg0, f51_arg1, f51_arg2 )
		CoD.Menu.SetButtonLabel( f51_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem5, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
		if PDV_SlotHasCollectible( f52_arg0, f52_arg2 ) then
			PDV_ClearCollectible( self, f52_arg0, f52_arg2 )
			UploadStats( self, f52_arg2 )
			GoBack( self, f52_arg2 )
			return true
		else
			
		end
	end, function ( f53_arg0, f53_arg1, f53_arg2 )
		CoD.Menu.SetButtonLabel( f53_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if PDV_SlotHasCollectible( f53_arg0, f53_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( collectibleItem5, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
		PDV_ClearPreviewCollectible( self, f54_arg0, f54_arg2 )
		ClearSavedState( self, f54_arg2 )
		GoBack( self, f54_arg2 )
		return true
	end, function ( f55_arg0, f55_arg1, f55_arg2 )
		CoD.Menu.SetButtonLabel( f55_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
	CoD.Menu.AddNavigationHandler( f1_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f56_local0 = nil
		SendClientScriptEnumNotifyForAdjustedClient( controller, "collectibles_slot_change", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_SMALL )
		if not f56_local0 then
			f56_local0 = element:dispatchEventToChildren( event )
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
		menu = f1_local1
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

