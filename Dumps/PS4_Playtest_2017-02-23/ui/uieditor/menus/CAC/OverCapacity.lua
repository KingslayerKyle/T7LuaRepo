require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.OverCapacityItem" )
require( "ui.uieditor.widgets.CAC.popup_warninglabel" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Scrollbars.horizontalCounterHide" )

local PostLoadFunc = function ( self, controller )
	local itemIndex = CoD.perController[controller].overCapacityItemIndex
	local loadoutSlot = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	if loadoutSlot then
		local itemName = Engine.GetItemName( itemIndex )
		if LUI.startswith( loadoutSlot, "primaryattachment" ) then
			local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, "primary.itemIndex" ) )
			itemName = Engine.GetAttachmentName( weaponIndex, itemIndex )
		elseif LUI.startswith( loadoutSlot, "secondaryattachment" ) then
			local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, "secondary.itemIndex" ) )
			itemName = Engine.GetAttachmentName( weaponIndex, itemIndex )
		elseif LUI.startswith( loadoutSlot, "primarygadgetattachment" ) then
			local gadgetIndex = Engine.GetModelValue( Engine.GetModel( classModel, "primarygadget.itemIndex" ) )
			itemName = Engine.GetItemName( gadgetIndex )
		elseif LUI.startswith( loadoutSlot, "secondarygadgetattachment" ) then
			local gadgetIndex = Engine.GetModelValue( Engine.GetModel( classModel, "secondarygadget.itemIndex" ) )
			itemName = Engine.GetItemName( gadgetIndex )
		end
		self.popupwarninglabel.menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS", Engine.Localize( itemName ) ) )
	end
end

LUI.createMenu.OverCapacity = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "OverCapacity" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "OverCapacity.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( 0, 0, 0, 1920 )
	background:setTopBottom( 0, 0, 0, 1080 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_CAPS" ) )
	background:linkToElementModel( self, nil, false, function ( model )
		background.buttons:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local itemList = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( 0, 0, 151.5, 2354.5 )
	itemList:setTopBottom( 0, 0, 498, 691 )
	itemList:setWidgetType( CoD.OverCapacityItem )
	itemList:setHorizontalCount( 11 )
	itemList:setSpacing( 8 )
	itemList:setDataSource( "OverCapacityList" )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		RemoveOverflowItemFromClass( self, element, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, true )
	self:addElement( itemList )
	self.itemList = itemList
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 85, 139 )
	Image3:setTopBottom( 0.5, 0.5, 152, 157 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, 85, 139 )
	Image4:setTopBottom( 0.5, 0.5, -35, -30 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 108, 116 )
	LineSide0:setTopBottom( 0, 0, 525, 661 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 0, 0, 1779, 1833 )
	Image30:setTopBottom( 0.5, 0.5, 155, 161 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( 0, 0, 1779, 1833 )
	Image41:setTopBottom( 0.5, 0.5, -34, -29 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( 0, 0, 1802, 1810 )
	LineSide00:setTopBottom( 0, 0, 522, 677 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( 0, 0, 1789, 1813 )
	Image000000:setTopBottom( 0, 0, 582, 594 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local popupwarninglabel = CoD.popup_warninglabel.new( self, controller )
	popupwarninglabel:setLeftRight( 0, 0, 85, 1185 )
	popupwarninglabel:setTopBottom( 0, 0, 362, 414 )
	popupwarninglabel.menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS" ) )
	self:addElement( popupwarninglabel )
	self.popupwarninglabel = popupwarninglabel
	
	local custompopupwarninglabel0 = CoD.popup_warninglabel.new( self, controller )
	custompopupwarninglabel0:setLeftRight( 0, 0, 85, 1185 )
	custompopupwarninglabel0:setTopBottom( 0, 0, 362, 414 )
	custompopupwarninglabel0:setAlpha( 0 )
	custompopupwarninglabel0.menudescription:setText( GetCustomOverCapacityDescription( controller, "MENU_TOO_MANY_ITEMS_CUSTOM_DESC_CAPS" ) )
	self:addElement( custompopupwarninglabel0 )
	self.custompopupwarninglabel0 = custompopupwarninglabel0
	
	local Image000001 = LUI.UIImage.new()
	Image000001:setLeftRight( 0, 0, 106, 130 )
	Image000001:setTopBottom( 0, 0, 585, 597 )
	Image000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000001 )
	self.Image000001 = Image000001
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
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
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local horizontalCounter = CoD.horizontalCounterHide.new( self, controller )
	horizontalCounter:setLeftRight( 0.5, 0.5, -150, 150 )
	horizontalCounter:setTopBottom( 1, 1, -323, -285 )
	horizontalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListHorizontalCounter( self, element, "itemList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( horizontalCounter )
	self.horizontalCounter = horizontalCounter
	
	self.resetProperties = function ()
		custompopupwarninglabel0:completeAnimation()
		popupwarninglabel:completeAnimation()
		custompopupwarninglabel0:setAlpha( 0 )
		popupwarninglabel:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		CustomAllocation = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				popupwarninglabel:completeAnimation()
				self.popupwarninglabel:setAlpha( 0 )
				self.clipFinished( popupwarninglabel, {} )
				custompopupwarninglabel0:completeAnimation()
				self.custompopupwarninglabel0:setAlpha( 1 )
				self.clipFinished( custompopupwarninglabel0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CustomAllocation",
			condition = function ( menu, element, event )
				return not IsClassAllocationInState( controller, 10 )
			end
		}
	} )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.background:close()
		self.itemList:close()
		self.popupwarninglabel:close()
		self.custompopupwarninglabel0:close()
		self.PregameTimerOverlay:close()
		self.horizontalCounter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "OverCapacity.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

