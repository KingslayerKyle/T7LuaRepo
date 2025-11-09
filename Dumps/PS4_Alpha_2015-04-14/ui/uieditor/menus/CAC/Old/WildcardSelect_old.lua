require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidget_old" )
require( "ui.uieditor.widgets.CAC.GridItemButton" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )

local GetEquippedBonusCardLoudoutSlot = function ( self, controller, itemIndex )
	for index = 1, CoD.CACUtility.maxBonusCards, 1 do
		local slotName = "bonuscard" .. index
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
	CoD.GenericCACSelectionPreLoadFunc( self, controller, "bonuscard", CoD.perController[controller].weaponCategory )
end

local PostLoadFunc = function ( self, controller )
	self.getEquippedLoadoutSlot = GetEquippedBonusCardLoudoutSlot
end

LUI.createMenu.WildcardSelect_old = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WildcardSelect_old" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Wildcard"
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
	selectMenuWidget.background.titleLabel:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	selectMenuWidget.selectionInfoWidget.previewImage.image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
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
	
	local selectionList = LUI.UIList.new( self, controller, 4, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "group" ) ) == "bonuscard"
	end, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 104.5, 436.5 )
	selectionList:setTopBottom( true, false, 151, 595 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "Unlockables" )
	selectionList:setWidgetType( CoD.GridItemButton )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 4 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsCACItemLocked( self, element, controller ) then
			SetClassItem( self, element, controller )
		end
		return retVal
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( self, controller )
	GridItemButtonBackdropSymbols:setLeftRight( true, false, 98, 1192.67 )
	GridItemButtonBackdropSymbols:setTopBottom( true, false, 144.5, 601.5 )
	GridItemButtonBackdropSymbols:setRGB( 1, 1, 1 )
	GridItemButtonBackdropSymbols:setAlpha( 0.96 )
	GridItemButtonBackdropSymbols:setZoom( -7.02 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	selectMenuWidget:linkToElementModel( selectionList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( selectionList, "image", true, function ( model )
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
		self.GridItemButtonBackdropContainer3x4:close()
		self.selectMenuWidget:close()
		self.selectionList:close()
		self.GridItemButtonBackdropSymbols:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

