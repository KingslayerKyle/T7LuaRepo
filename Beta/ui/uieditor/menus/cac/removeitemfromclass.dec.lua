require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.OverCapacityItem" )

local PostLoadFunc = function ( self, controller )
	
end

LUI.createMenu.RemoveItemFromClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "RemoveItemFromClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RemoveItemFromClass.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( menu, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "" ) )
	self:addElement( background )
	self.background = background
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 83, 1216 )
	titleLabel:setTopBottom( true, false, 141, 189 )
	titleLabel:setRGB( 0.87, 0.88, 0.78 )
	titleLabel:setTTF( "fonts/escom.ttf" )
	titleLabel:subscribeToGlobalModel( controller, "PerController", "CACMenu.numItemsToRemove", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			titleLabel:setText( GetRemoveItemTitle( controller, modelValue ) )
		end
	end )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local menudescription = LUI.UITightText.new()
	menudescription:setLeftRight( true, false, 84, 693 )
	menudescription:setTopBottom( true, false, 208, 233 )
	menudescription:setRGB( 0.5, 0.51, 0.52 )
	menudescription:setTTF( "fonts/default.ttf" )
	menudescription:subscribeToGlobalModel( controller, "PerController", "CACMenu.numItemsToRemove", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			menudescription:setText( GetRemoveItemDescription( controller, modelValue ) )
		end
	end )
	self:addElement( menudescription )
	self.menudescription = menudescription
	
	local itemList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 86, 1421 )
	itemList:setTopBottom( true, false, 259, 388 )
	itemList:setDataSource( "RemoveItemFromClassList" )
	itemList:setWidgetType( CoD.OverCapacityItem )
	itemList:setHorizontalCount( 10 )
	itemList:setSpacing( 5 )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		WeaponVariantRemoveItemFromClass( self, element, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( itemList )
	self.itemList = itemList
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = menu
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
		self.titleLabel:close()
		self.menudescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "RemoveItemFromClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

