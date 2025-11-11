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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RemoveItemFromClass.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( 0, 0, 0, 1920 )
	background:setTopBottom( 0, 0, 0, 1080 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "" ) )
	background:linkToElementModel( self, nil, false, function ( model )
		background.buttons:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( 0, 0, 124, 1824 )
	titleLabel:setTopBottom( 0, 0, 212, 284 )
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
	menudescription:setLeftRight( 0, 0, 126, 1040 )
	menudescription:setTopBottom( 0, 0, 312, 350 )
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
	
	local itemList = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( 0, 0, 129, 2131 )
	itemList:setTopBottom( 0, 0, 389, 582 )
	itemList:setWidgetType( CoD.OverCapacityItem )
	itemList:setHorizontalCount( 10 )
	itemList:setSpacing( 8 )
	itemList:setDataSource( "RemoveItemFromClassList" )
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
		WeaponVariantRemoveItemFromClass( self, element, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( itemList )
	self.itemList = itemList
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
		self.titleLabel:close()
		self.menudescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "RemoveItemFromClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

