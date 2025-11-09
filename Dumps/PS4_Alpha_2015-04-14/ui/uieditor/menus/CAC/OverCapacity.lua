require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.OverCapacityItem" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )
require( "ui.uieditor.widgets.CAC.popup_warninglabel" )
require( "ui.uieditor.widgets.CAC.cac_2lines" )

local PostLoadFunc = function ( self, controller )
	local itemIndex = CoD.perController[controller].OvercapacityItemIndex
	local loadoutSlot = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	if loadoutSlot then
		local itemName = Engine.GetItemName( itemIndex )
		if LUI.startswith( loadoutSlot, "primaryattachment" ) then
			local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, "primary.itemIndex" ) )
			local attachmentIndex = itemIndex
			itemName = Engine.GetAttachmentName( weaponIndex, itemIndex )
		elseif LUI.startswith( loadoutSlot, "secondaryattachment" ) then
			local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, "secondary.itemIndex" ) )
			local attachmentIndex = itemIndex
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background:setRGB( 1, 1, 1 )
	self:addElement( background )
	self.background = background
	
	local itemList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 101, 1436 )
	itemList:setTopBottom( true, false, 337, 466 )
	itemList:setRGB( 1, 1, 1 )
	itemList:setDataSource( "OverCapacityList" )
	itemList:setWidgetType( CoD.OverCapacityItem )
	itemList:setHorizontalCount( 10 )
	itemList:setSpacing( 5 )
	itemList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		RemoveOverflowItemFromClass( self, element, controller )
		ClearSavedState( self, controller )
		return retVal
	end )
	self:addElement( itemList )
	self.itemList = itemList
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( self, controller )
	StartMenuTitlePopup:setLeftRight( true, false, -51, 527 )
	StartMenuTitlePopup:setTopBottom( true, false, 112, 258 )
	StartMenuTitlePopup:setRGB( 1, 1, 1 )
	StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_CAPS" ) )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 101.56, 105.06 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -23.69, -20.19 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 350.06, 440.44 )
	LineSide0:setRGB( 1, 1, 1 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 192.83, 200.5 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 0, 1280 )
	CategoryListLine0:setTopBottom( true, false, 533.83, 541.5 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.25 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1186, 1222 )
	Image30:setTopBottom( false, false, 103.38, 107.06 )
	Image30:setRGB( 1, 1, 1 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1186, 1222 )
	Image41:setTopBottom( false, false, -22.75, -19.25 )
	Image41:setRGB( 1, 1, 1 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1201.5, 1206.5 )
	LineSide00:setTopBottom( true, false, 348.06, 451.44 )
	LineSide00:setRGB( 1, 1, 1 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 0, 1280 )
	CategoryListLine00:setTopBottom( true, false, 580.83, 588.5 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.25 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local CategoryListLine01 = LUI.UIImage.new()
	CategoryListLine01:setLeftRight( true, false, 0, 1280 )
	CategoryListLine01:setTopBottom( true, false, 130.83, 138.5 )
	CategoryListLine01:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine01:setAlpha( 0.25 )
	CategoryListLine01:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine01 )
	self.CategoryListLine01 = CategoryListLine01
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 1192.5, 1208.5 )
	Image000000:setTopBottom( true, false, 388, 396 )
	Image000000:setRGB( 1, 1, 1 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local popupwarninglabel = CoD.popup_warninglabel.new( self, controller )
	popupwarninglabel:setLeftRight( true, false, 101, 834 )
	popupwarninglabel:setTopBottom( true, false, 246.25, 281 )
	popupwarninglabel:setRGB( 1, 1, 1 )
	popupwarninglabel.menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS" ) )
	self:addElement( popupwarninglabel )
	self.popupwarninglabel = popupwarninglabel
	
	local Image000001 = LUI.UIImage.new()
	Image000001:setLeftRight( true, false, 70.5, 86.5 )
	Image000001:setTopBottom( true, false, 390, 398 )
	Image000001:setRGB( 1, 1, 1 )
	Image000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000001 )
	self.Image000001 = Image000001
	
	local cac2lines0 = CoD.cac_2lines.new( self, controller )
	cac2lines0:setLeftRight( true, false, 57, 93 )
	cac2lines0:setTopBottom( true, false, 244.25, 281 )
	cac2lines0:setRGB( 0.89, 0.31, 0.07 )
	self:addElement( cac2lines0 )
	self.cac2lines0 = cac2lines0
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			PlaySoundSetSound( self, "menu_no_selection" )
			ClearSavedState( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.background:close()
		self.itemList:close()
		self.StartMenuTitlePopup:close()
		self.popupwarninglabel:close()
		self.cac2lines0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

