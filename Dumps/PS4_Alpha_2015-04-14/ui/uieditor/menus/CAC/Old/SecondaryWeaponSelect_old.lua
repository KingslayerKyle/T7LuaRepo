require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidget_old" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.LeftBumperWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.RightBumperWidget" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )
require( "ui.uieditor.widgets.CAC.GridItemButtonLarge" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponCategoryButton" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].classModel )
	DataSources.Unlockables.setCurrentFilterItem( "secondary" )
	self.restoreState = function ( self )
		local classModel = self:getModel()
		self.performingSetup = true
		local loadoutSlotName = CoD.perController[controller].weaponCategory
		local secondaryGroupCategory = self.weaponCategoryList.weaponGroupModel.secondary
		local selectedItemIndex = Engine.GetModelValue( self:getModel( controller, loadoutSlotName .. ".itemIndex" ) )
		self.lastSelectionTable = {}
		for i = 1, #secondaryGroupCategory, 1 do
			local group = Engine.GetModelValue( Engine.GetModel( secondaryGroupCategory[i], "weapon_category" ) )
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
			local group = Engine.GetModelValue( Engine.GetModel( secondaryGroupCategory[1], "weapon_category" ) )
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

LUI.createMenu.SecondaryWeaponSelect_old = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SecondaryWeaponSelect_old" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_SecondaryWeapon"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local BackdropImage = LUI.UIImage.new()
	BackdropImage:setLeftRight( true, false, 0, 1280 )
	BackdropImage:setTopBottom( true, false, 0, 720 )
	BackdropImage:setRGB( 1, 1, 1 )
	BackdropImage:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tempbackdrop" ) )
	BackdropImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BackdropImage )
	self.BackdropImage = BackdropImage
	
	local GridItemButtonBackdropContainer3x4 = CoD.GridItemButtonBackdropContainer3x4.new( self, controller )
	GridItemButtonBackdropContainer3x4:setLeftRight( true, false, 99, 443 )
	GridItemButtonBackdropContainer3x4:setTopBottom( true, false, 145.5, 601.5 )
	GridItemButtonBackdropContainer3x4:setRGB( 1, 1, 1 )
	self:addElement( GridItemButtonBackdropContainer3x4 )
	self.GridItemButtonBackdropContainer3x4 = GridItemButtonBackdropContainer3x4
	
	local selectMenuWidget = CoD.SelectMenuWidget_old.new( self, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget:setRGB( 1, 1, 1 )
	selectMenuWidget.background.titleLabel:setText( Engine.Localize( "MPUI_SECONDARY_CAPS" ) )
	selectMenuWidget.selectionInfoWidget.previewImage.image:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_4" ) )
	selectMenuWidget:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	selectMenuWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local weaponAttributes = CoD.WeaponAttributes.new( self, controller )
	weaponAttributes:setLeftRight( true, false, 477, 813 )
	weaponAttributes:setTopBottom( false, true, -192, -112 )
	weaponAttributes:setRGB( 1, 1, 1 )
	self:addElement( weaponAttributes )
	self.weaponAttributes = weaponAttributes
	
	local LeftBumperWidget = CoD.LeftBumperWidget.new( self, controller )
	LeftBumperWidget:setLeftRight( true, false, 105, 137 )
	LeftBumperWidget:setTopBottom( true, false, 103.5, 135.5 )
	LeftBumperWidget:setRGB( 1, 1, 1 )
	LeftBumperWidget:setAlpha( 0.7 )
	self:addElement( LeftBumperWidget )
	self.LeftBumperWidget = LeftBumperWidget
	
	local RightBumperWidget = CoD.RightBumperWidget.new( self, controller )
	RightBumperWidget:setLeftRight( true, false, 543.67, 575.67 )
	RightBumperWidget:setTopBottom( true, false, 103.5, 135.5 )
	RightBumperWidget:setRGB( 1, 1, 1 )
	RightBumperWidget:setAlpha( 0.7 )
	self:addElement( RightBumperWidget )
	self.RightBumperWidget = RightBumperWidget
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( self, controller )
	GridItemButtonBackdropSymbols:setLeftRight( true, false, 98, 1192.67 )
	GridItemButtonBackdropSymbols:setTopBottom( true, false, 144.5, 601.5 )
	GridItemButtonBackdropSymbols:setRGB( 1, 1, 1 )
	GridItemButtonBackdropSymbols:setAlpha( 0.96 )
	GridItemButtonBackdropSymbols:setZoom( -7.02 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	local weaponList = LUI.UIList.new( self, controller, 4, 0, nil, true, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 104.5, 436.5 )
	weaponList:setTopBottom( true, false, 151, 595 )
	weaponList:setRGB( 1, 1, 1 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:setWidgetType( CoD.GridItemButtonLarge )
	weaponList:setHorizontalCount( 3 )
	weaponList:setVerticalCount( 4 )
	weaponList:setSpacing( 4 )
	weaponList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsCACItemLocked( self, element, controller ) then
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
	
	local weaponCategoryList = LUI.GridLayout.new( self, controller, false, 0, 0, -6, 50, nil, nil, false, false, 0, 0, false, false )
	weaponCategoryList:setLeftRight( true, false, 140, 704 )
	weaponCategoryList:setTopBottom( true, false, 104.5, 142.5 )
	weaponCategoryList:setRGB( 1, 1, 1 )
	weaponCategoryList:setDataSource( "WeaponGroups" )
	weaponCategoryList:setWidgetType( CoD.WeaponCategoryButton )
	weaponCategoryList:setHorizontalCount( 3 )
	weaponCategoryList:setSpacing( -6 )
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
	
	selectMenuWidget:linkToElementModel( weaponList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
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
		self.GridItemButtonBackdropContainer3x4:close()
		self.selectMenuWidget:close()
		self.weaponAttributes:close()
		self.LeftBumperWidget:close()
		self.RightBumperWidget:close()
		self.GridItemButtonBackdropSymbols:close()
		self.weaponList:close()
		self.weaponCategoryList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

