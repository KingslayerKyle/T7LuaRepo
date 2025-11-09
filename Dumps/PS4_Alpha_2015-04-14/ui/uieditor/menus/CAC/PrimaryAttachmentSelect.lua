require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )

local GetEquippedPrimaryAttachmentLoudoutSlot = function ( self, controller, itemIndex )
	for index = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
		local slotName = "primaryattachment" .. index
		local model = self:getModel( controller, slotName .. ".itemIndex" )
		if model then
			local modelValue = Engine.GetModelValue( model )
			if itemIndex and modelValue == itemIndex then
				return slotName
			end
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].classModel )
	self.restoreState = function ( self )
		local classModel = self:getModel()
		local weaponCategory = CoD.perController[controller].weaponCategory
		local unlockableItems = self.selectionList.attachments
		local selectedItemIndex = Engine.GetModelValue( self:getModel( controller, weaponCategory .. ".itemIndex" ) )
		self.selectionList:findItem( {
			itemIndex = selectedItemIndex
		}, nil, true, nil )
	end
	
end

local PostLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].classModel )
	self:processEvent( {
		name = "update_from_data_source",
		controller = controller
	} )
	self:dispatchEventToChildren( {
		name = "update_state",
		controller = controller
	} )
	self.getEquippedLoadoutSlot = GetEquippedPrimaryAttachmentLoudoutSlot
	local nameModel = self:getModel( controller, "primary.name" )
	if nameModel then
		local nameModelValue = Engine.GetModelValue( nameModel )
		if nameModelValue and self.selectMenuWidget.background.titleLabel then
			self.selectMenuWidget.background.titleLabel:setText( nameModelValue .. " " .. Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
		end
	end
end

LUI.createMenu.PrimaryAttachmentSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PrimaryAttachmentSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryAttachment"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget:setRGB( 1, 1, 1 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setAlpha( 0 )
	selectMenuWidget:mergeStateConditions( {
		{
			stateName = "GridLayout",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local togglePrompt = CoD.buttonprompt_small.new( self, controller )
	togglePrompt:setLeftRight( true, false, 350, 564 )
	togglePrompt:setTopBottom( false, true, -56, -25 )
	togglePrompt:setRGB( 1, 1, 1 )
	togglePrompt.label:setText( Engine.Localize( "MENU_TOGGLE_ACV" ) )
	togglePrompt:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			togglePrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( togglePrompt )
	self.togglePrompt = togglePrompt
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 136, 589 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "WeaponAttachments" )
	selectionList:setWidgetType( CoD.GridItemButtonNew )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList.buttonPromptAddFunctions = {}
	selectionList.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsCACItemLocked( self, element, controller ) then
			SetClassAttachment( self, element, controller )
		else
			
		end
		return retVal
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FocusClassItem( self, element, controller )
		return retVal
	end )
	selectionList:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "T") and element:isInFocus() then
			ToggleAttachmentCosmeticVariant( self, element, controller )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt2( self, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		self:removeButtonPrompt( "alt2", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	selectionList:updateButtonPromptEventHandlers()
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListBoxes0:setRGB( 1, 1, 1 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	selectMenuWidget:linkToElementModel( selectionList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
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
			GetCustomClassModel( controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "selectMenuWidget", controller, "Update" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.LeftPanel:close()
		self.selectMenuWidget:close()
		self.togglePrompt:close()
		self.selectionList:close()
		self.cacElemsSideListBoxes0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

