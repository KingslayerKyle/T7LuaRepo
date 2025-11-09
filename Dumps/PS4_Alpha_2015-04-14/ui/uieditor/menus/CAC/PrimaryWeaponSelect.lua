require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.LeftBumperWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.RightBumperWidget" )
require( "ui.uieditor.menus.CAC.PrimaryWeaponVariantSelect" )
require( "ui.uieditor.widgets.CAC.WeaponItemListButtonNew" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponCategoryButton" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].classModel )
	DataSources.Unlockables.setCurrentFilterItem( "primary" )
	self.restoreState = function ( self )
		local classModel = self:getModel()
		self.performingSetup = true
		local loadoutSlotName = CoD.perController[controller].weaponCategory
		local primaryGroupCategory = self.weaponCategoryList.weaponGroupModel.primary
		local selectedItemIndex = Engine.GetModelValue( self:getModel( controller, loadoutSlotName .. ".itemIndex" ) )
		self.lastSelectionTable = {}
		for i = 1, #primaryGroupCategory, 1 do
			local group = Engine.GetModelValue( Engine.GetModel( primaryGroupCategory[i], "weapon_category" ) )
			self.lastSelectionTable[group] = 1
		end
		local focusedWidget = self.weaponList:findItem( {
			itemIndex = selectedItemIndex
		}, nil, false, nil )
		if focusedWidget then
			local groupModel = focusedWidget:getModel( controller, "group" )
			if groupModel then
				local groupValue = Engine.GetModelValue( groupModel )
				DataSources.Unlockables.setCurrentFilterItem( groupValue )
				self.weaponCategoryList:findItem( {
					weapon_category = groupValue
				}, nil, true, nil )
				self.weaponList:updateDataSource( true )
				focusedWidget = self.weaponList:findItem( {
					itemIndex = selectedItemIndex
				}, nil, false, nil )
			end
		else
			local group = Engine.GetModelValue( Engine.GetModel( primaryGroupCategory[1], "weapon_category" ) )
			DataSources.Unlockables.setCurrentFilterItem( group )
			self.weaponCategoryList:setActiveItem( self.weaponCategoryList:getItemAt( 1 ) )
			self.weaponList:updateDataSource( true )
			focusedWidget = self.weaponList:getFirstSelectableItem()
		end
		if focusedWidget then
			self.weaponList:processEvent( {
				name = "gain_focus",
				controller = controller,
				selectIndex = focusedWidget.gridInfoTable.zeroBasedIndex
			} )
		end
		self.performingSetup = false
		return true
	end
	
end

LUI.createMenu.PrimaryWeaponSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PrimaryWeaponSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget:setRGB( 1, 1, 1 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	selectMenuWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TabLeft = CoD.FE_TabIdle.new( self, controller )
	TabLeft:setLeftRight( true, false, -50.5, 117.5 )
	TabLeft:setTopBottom( true, false, 83, 125 )
	TabLeft:setRGB( 1, 1, 1 )
	self:addElement( TabLeft )
	self.TabLeft = TabLeft
	
	local TabRight = CoD.FE_TabIdle.new( self, controller )
	TabRight:setLeftRight( true, false, 1142, 1378 )
	TabRight:setTopBottom( true, false, 83, 125 )
	TabRight:setRGB( 1, 1, 1 )
	self:addElement( TabRight )
	self.TabRight = TabRight
	
	local LeftBumperWidget = CoD.LeftBumperWidget.new( self, controller )
	LeftBumperWidget:setLeftRight( true, false, 76, 108 )
	LeftBumperWidget:setTopBottom( true, false, 87, 119 )
	LeftBumperWidget:setRGB( 1, 1, 1 )
	LeftBumperWidget:setAlpha( 0.7 )
	self:addElement( LeftBumperWidget )
	self.LeftBumperWidget = LeftBumperWidget
	
	local RightBumperWidget = CoD.RightBumperWidget.new( self, controller )
	RightBumperWidget:setLeftRight( true, false, 1152, 1184 )
	RightBumperWidget:setTopBottom( true, false, 87, 119 )
	RightBumperWidget:setRGB( 1, 1, 1 )
	RightBumperWidget:setAlpha( 0.7 )
	self:addElement( RightBumperWidget )
	self.RightBumperWidget = RightBumperWidget
	
	local weaponList = LUI.UIList.new( self, controller, 7, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 77, 357 )
	weaponList:setTopBottom( true, false, 136, 633 )
	weaponList:setRGB( 1, 1, 1 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:setWidgetType( CoD.WeaponItemListButtonNew )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 7 )
	weaponList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if IsCACWeaponVariantAvailable( element, controller ) then
			NavigateToMenu( self, "PrimaryWeaponVariantSelect", true, controller )
		elseif not IsCACItemLocked( self, element, controller ) then
			SetClassItem( self, element, controller )
		end
		return retVal
	end )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FocusWeapon( self, element, controller )
		return retVal
	end )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local weaponCategoryList = LUI.GridLayout.new( self, controller, false, 0, 0, 2, 50, nil, nil, false, false, 0, 0, false, false )
	weaponCategoryList:setLeftRight( true, false, 118, 1086 )
	weaponCategoryList:setTopBottom( true, false, 85, 123 )
	weaponCategoryList:setRGB( 1, 1, 1 )
	weaponCategoryList:setDataSource( "WeaponGroups" )
	weaponCategoryList:setWidgetType( CoD.WeaponCategoryButton )
	weaponCategoryList:setHorizontalCount( 5 )
	weaponCategoryList:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if IsSelectPreviousTabEvent( event ) then
			SaveLastSelectedWeaponInGroup( self, element, controller )
			SelectPreviousItemIfPossible( self, element, controller )
			WeaponCategoryChange( self, element, controller )
		elseif IsSelectNextTabEvent( event ) then
			SaveLastSelectedWeaponInGroup( self, element, controller )
			SelectNextItemIfPossible( self, element, controller )
			WeaponCategoryChange( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( weaponCategoryList )
	self.weaponCategoryList = weaponCategoryList
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 4.13, 72 )
	ElemsSideList:setTopBottom( true, false, -12, 658 )
	ElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	selectMenuWidget:linkToElementModel( weaponList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( weaponList, "weaponAttributes", false, function ( model )
		selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Overkill = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				selectMenuWidget:completeAnimation()
				self.clipFinished( selectMenuWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Overkill",
			condition = function ( menu, element, event )
				return IsCACUsingOverkill( menu ) and IsCACEquippingSlot( controller, "secondary" )
			end
		}
	} )
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
	weaponList.id = "weaponList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.weaponList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.LeftPanel:close()
		self.selectMenuWidget:close()
		self.TabLeft:close()
		self.TabRight:close()
		self.LeftBumperWidget:close()
		self.RightBumperWidget:close()
		self.weaponList:close()
		self.weaponCategoryList:close()
		self.ElemsSideList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

