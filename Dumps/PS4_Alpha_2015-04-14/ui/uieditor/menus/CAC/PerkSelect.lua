require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )

local GetEquippedPerkLoudoutSlot = function ( self, controller, itemIndex )
	for index = 1, CoD.CACUtility.maxSpecialtySlots, 1 do
		local slotName = "specialty" .. index
		local model = self:getModel( controller, slotName .. ".itemIndex" )
		if model then
			local modelValue = Engine.GetModelValue( model )
			if itemIndex and modelValue == itemIndex then
				return slotName
			end
		end
	end
end

local GetFilterWeaponCategory = function ( weaponCategory )
	if weaponCategory == "specialty4" then
		weaponCategory = "specialty1"
	elseif weaponCategory == "specialty5" then
		weaponCategory = "specialty2"
	elseif weaponCategory == "specialty6" then
		weaponCategory = "specialty3"
	end
	return weaponCategory
end

local PreLoadFunc = function ( self, controller )
	local weaponCategory = CoD.perController[controller].weaponCategory
	CoD.GenericCACSelectionPreLoadFunc( self, controller, GetFilterWeaponCategory( weaponCategory ), weaponCategory )
end

local PostLoadFunc = function ( self, controller )
	local weaponCategory = nil
	local realWeaponCategory = CoD.perController[controller].weaponCategory
	if realWeaponCategory ~= "" then
		weaponCategory = GetFilterWeaponCategory( realWeaponCategory )
	end
	if weaponCategory == "specialty1" then
		self.selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERK1_CAPS" ) )
	elseif weaponCategory == "specialty2" then
		self.selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERK2_CAPS" ) )
	elseif weaponCategory == "specialty3" then
		self.selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERK3_CAPS" ) )
	end
	self.getEquippedLoadoutSlot = GetEquippedPerkLoudoutSlot
end

LUI.createMenu.PerkSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PerkSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Perk"
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
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERKS_CAPS" ) )
	selectMenuWidget.selectionInfoWidget.previewImage.image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setAlpha( 0 )
	selectMenuWidget.selectionInfoWidget.cacWpnLvl0:setAlpha( 0 )
	selectMenuWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
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
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "group" ) ) == "specialty"
	end, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 136, 589 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "Unlockables" )
	selectionList:setWidgetType( CoD.GridItemButtonNew )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsCACItemLocked( self, element, controller ) then
			SetClassItem( self, element, controller )
		end
		return retVal
	end )
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
	selectMenuWidget:linkToElementModel( selectionList, "image_big", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.previewImage.image:setImage( RegisterImage( modelValue ) )
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
		self.selectionList:close()
		self.cacElemsSideListBoxes0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

