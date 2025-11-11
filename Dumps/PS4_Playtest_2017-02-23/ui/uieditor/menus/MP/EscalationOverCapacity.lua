require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationSelectListItem" )

DataSources.EquippedEscalationItems = ListHelper_SetupDataSource( "EquippedEscalationItems", function ( controller )
	local equippedItems = {}
	if CoD.perController[controller].classModel and CoD.perController[controller].weaponCategory then
		local classModel = CoD.perController[controller].classModel
		local slotNameList = CoD.CACUtility.GetSlotListWithSlot( CoD.perController[controller].weaponCategory )
		for _, slotName in ipairs( slotNameList ) do
			local itemModel = classModel[slotName]
			local item = {
				models = {},
				properties = {}
			}
			item.models.itemIndex = itemModel.itemIndex:get()
			item.models.name = itemModel.name:get()
			item.models.image = itemModel.image:get()
			item.models.desc = itemModel.desc:get()
			item.models.cost = itemModel.cost:get()
			item.models.levelUnlockDescription = itemModel.levelUnlockDescription:get()
			item.models.slotName = slotName
			table.insert( equippedItems, item )
		end
	end
	return equippedItems
end )
DataSources.EscalationSwapItemData = {
	getModel = function ( controller )
		local itemIndex = CoD.CACUtility.EmptyItemIndex
		local slotType = 0
		if CoD.perController[controller].overCapacityItemIndex then
			itemIndex = CoD.perController[controller].overCapacityItemIndex
		end
		if CoD.perController[controller].weaponCategory and string.find( CoD.perController[controller].weaponCategory, "general" ) then
			slotType = 1
		end
		local f2_local0 = Engine.GetModelForController( controller )
		local model = f2_local0:create( "EscalationSwapItemData" )
		local f2_local1 = model:create( "itemIndex" )
		f2_local1:set( itemIndex )
		f2_local1 = model:create( "slotType" )
		f2_local1:set( slotType )
		return model
	end
}
LUI.createMenu.EscalationOverCapacity = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EscalationOverCapacity" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EscalationOverCapacity.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( 0, 0, 0, 1920 )
	background:setTopBottom( 0, 0, 0, 1080 )
	background:subscribeToGlobalModel( controller, "EscalationSwapItemData", "slotType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( SetValueIfNumberEqualTo( 1, "MPUI_TOO_MANY_CORES_CAPS", SetValueIfNumberEqualTo( 0, "MPUI_TOO_MANY_MAJORS_CAPS", modelValue ) ) ) )
		end
	end )
	background:linkToElementModel( self, nil, false, function ( model )
		background.buttons:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local desc = LUI.UITightText.new()
	desc:setLeftRight( 0, 0, 675, 1197 )
	desc:setTopBottom( 0, 0, 335, 373 )
	desc:setRGB( 0.5, 0.51, 0.52 )
	desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	desc:setLetterSpacing( 0.5 )
	desc:subscribeToGlobalModel( controller, "EscalationSwapItemData", "slotType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			desc:setText( Engine.Localize( SetValueIfNumberEqualTo( 1, "MPUI_TOO_MANY_CORES_DESC", SetValueIfNumberEqualTo( 0, "MPUI_TOO_MANY_MAJORS_DESC", modelValue ) ) ) )
		end
	end )
	self:addElement( desc )
	self.desc = desc
	
	local selectedItemImage = LUI.UIImage.new()
	selectedItemImage:setLeftRight( 0, 0, 225, 582 )
	selectedItemImage:setTopBottom( 0, 0, 339.5, 696.5 )
	selectedItemImage:subscribeToGlobalModel( controller, "EscalationSwapItemData", "itemIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectedItemImage:setImage( RegisterImage( GetItemImageFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( selectedItemImage )
	self.selectedItemImage = selectedItemImage
	
	local selectedItemLabel = LUI.UIText.new()
	selectedItemLabel:setLeftRight( 0, 0, 225, 582 )
	selectedItemLabel:setTopBottom( 0.5, 0.5, 171.5, 210.5 )
	selectedItemLabel:setTTF( "fonts/escom.ttf" )
	selectedItemLabel:setLetterSpacing( 0.6 )
	selectedItemLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	selectedItemLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	selectedItemLabel:subscribeToGlobalModel( controller, "EscalationSwapItemData", "itemIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectedItemLabel:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( selectedItemLabel )
	self.selectedItemLabel = selectedItemLabel
	
	local selectionList = LUI.UIList.new( self, controller, 15, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( 0, 0, 675, 1432 )
	selectionList:setTopBottom( 0, 0, 440, 524 )
	selectionList:setWidgetType( CoD.EscalationSelectListItem )
	selectionList:setHorizontalCount( 4 )
	selectionList:setSpacing( 15 )
	selectionList:setDataSource( "EquippedEscalationItems" )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SwapOverflowItemInClass( self, element, controller )
		GoBackAndUpdateStateOnPreviousMenu( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MPUI_REPLACE", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 0, 1242, 1296 )
	Image5:setTopBottom( 0.5, 0.5, -149, -144 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 1242, 1296 )
	Image0:setTopBottom( 0.5, 0.5, 29, 34 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 624, 678 )
	Image1:setTopBottom( 0.5, 0.5, -149, -144 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 624, 678 )
	Image2:setTopBottom( 0.5, 0.5, 29, 32 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 15, 69 )
	Image3:setTopBottom( 0.5, 0.5, 149, 154 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, 15, 69 )
	Image4:setTopBottom( 0.5, 0.5, -205, -200 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 38, 46 )
	LineSide0:setTopBottom( 0, 0, 345, 691 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( 0, 0, 10, 34 )
	Image40:setTopBottom( 0, 0, 443, 521 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 0, 0, 1847, 1901 )
	Image30:setTopBottom( 0.5, 0.5, 149, 154 )
	Image30:setZRot( 180 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( 0, 0, 1847, 1901 )
	Image41:setTopBottom( 0.5, 0.5, -205, -200 )
	Image41:setZRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( 0, 0, 1870, 1878 )
	LineSide00:setTopBottom( 0, 0, 345, 691 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	background:setModel( self.buttonModel, controller )
	selectionList.id = "selectionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.background:close()
		self.selectionList:close()
		self.desc:close()
		self.selectedItemImage:close()
		self.selectedItemLabel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EscalationOverCapacity.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

