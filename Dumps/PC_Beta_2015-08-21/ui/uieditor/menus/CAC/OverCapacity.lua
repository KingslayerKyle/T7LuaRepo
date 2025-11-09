require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.OverCapacityItem" )
require( "ui.uieditor.widgets.CAC.popup_warninglabel" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.perController[f1_arg1].overCapacityItemIndex
	local f1_local1 = CoD.perController[f1_arg1].weaponCategory
	local f1_local2 = CoD.perController[f1_arg1].classModel
	if f1_local1 then
		local f1_local3 = Engine.GetItemName( f1_local0 )
		if LUI.startswith( f1_local1, "primaryattachment" ) then
			f1_local3 = Engine.GetAttachmentName( Engine.GetModelValue( Engine.GetModel( f1_local2, "primary.itemIndex" ) ), f1_local0 )
		elseif LUI.startswith( f1_local1, "secondaryattachment" ) then
			f1_local3 = Engine.GetAttachmentName( Engine.GetModelValue( Engine.GetModel( f1_local2, "secondary.itemIndex" ) ), f1_local0 )
		elseif LUI.startswith( f1_local1, "primarygadgetattachment" ) then
			f1_local3 = Engine.GetItemName( Engine.GetModelValue( Engine.GetModel( f1_local2, "primarygadget.itemIndex" ) ) )
		elseif LUI.startswith( f1_local1, "secondarygadgetattachment" ) then
			f1_local3 = Engine.GetItemName( Engine.GetModelValue( Engine.GetModel( f1_local2, "secondarygadget.itemIndex" ) ) )
		end
		f1_arg0.popupwarninglabel.menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS", Engine.Localize( f1_local3 ) ) )
	end
end

LUI.createMenu.OverCapacity = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "OverCapacity" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "OverCapacity.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local itemList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 101, 1436 )
	itemList:setTopBottom( true, false, 337, 466 )
	itemList:setDataSource( "OverCapacityList" )
	itemList:setWidgetType( CoD.OverCapacityItem )
	itemList:setHorizontalCount( 10 )
	itemList:setSpacing( 5 )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		RemoveOverflowItemFromClass( self, element, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, true )
	self:addElement( itemList )
	self.itemList = itemList
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 101.56, 105.06 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -23.69, -20.19 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 350.06, 440.44 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1186, 1222 )
	Image30:setTopBottom( false, false, 103.38, 107.06 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1186, 1222 )
	Image41:setTopBottom( false, false, -22.75, -19.25 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1201.5, 1206.5 )
	LineSide00:setTopBottom( true, false, 348.06, 451.44 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 1192.5, 1208.5 )
	Image000000:setTopBottom( true, false, 388, 396 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local popupwarninglabel = CoD.popup_warninglabel.new( self, controller )
	popupwarninglabel:setLeftRight( true, false, 57, 790 )
	popupwarninglabel:setTopBottom( true, false, 246.25, 281 )
	popupwarninglabel.menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS" ) )
	self:addElement( popupwarninglabel )
	self.popupwarninglabel = popupwarninglabel
	
	local Image000001 = LUI.UIImage.new()
	Image000001:setLeftRight( true, false, 70.5, 86.5 )
	Image000001:setTopBottom( true, false, 390, 398 )
	Image000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000001 )
	self.Image000001 = Image000001
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "OverCapacity",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	background:setModel( self.buttonModel, controller )
	itemList.id = "itemList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.itemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.itemList:close()
		element.popupwarninglabel:close()
		element.PregameTimerOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "OverCapacity.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

