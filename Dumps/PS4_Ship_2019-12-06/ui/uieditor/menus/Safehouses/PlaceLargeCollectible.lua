require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.collectibleItem" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

LUI.createMenu.PlaceLargeCollectible = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PlaceLargeCollectible" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PlaceLargeCollectible.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ImgVignetteFull = LUI.UIImage.new()
	ImgVignetteFull:setLeftRight( true, true, 0, 0 )
	ImgVignetteFull:setTopBottom( true, true, 0, 0 )
	ImgVignetteFull:setImage( RegisterImage( "uie_img_t7_hud_fx_vignette_fullblue" ) )
	ImgVignetteFull:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( ImgVignetteFull )
	self.ImgVignetteFull = ImgVignetteFull
	
	local collectibleItem0 = CoD.collectibleItem.new( self, controller )
	collectibleItem0:setLeftRight( false, false, -150, 150 )
	collectibleItem0:setTopBottom( false, false, -150, 150 )
	collectibleItem0:setAlpha( 0 )
	collectibleItem0:subscribeToGlobalModel( controller, "CollectiblesLayout", "BUNK_COLLECTIBLE_LARGE_1", function ( model )
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
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f11_local0 = nil
		SendClientScriptEnumNotifyForAdjustedClient( controller, "collectibles_slot_change", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_LARGE )
		if not f11_local0 then
			f11_local0 = self:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	collectibleItem0.id = "collectibleItem0"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
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
		element.collectibleItem0:close()
		element.GenericMenuFrame0:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlaceLargeCollectible.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

