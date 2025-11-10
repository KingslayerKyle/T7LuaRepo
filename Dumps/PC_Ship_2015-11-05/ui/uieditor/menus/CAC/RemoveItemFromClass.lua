require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.OverCapacityItem" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RemoveItemFromClass.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
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
		local CACMenuNumItemsToRemove = Engine.GetModelValue( model )
		if CACMenuNumItemsToRemove then
			titleLabel:setText( GetRemoveItemTitle( controller, CACMenuNumItemsToRemove ) )
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
		local CACMenuNumItemsToRemove = Engine.GetModelValue( model )
		if CACMenuNumItemsToRemove then
			menudescription:setText( GetRemoveItemDescription( controller, CACMenuNumItemsToRemove ) )
		end
	end )
	self:addElement( menudescription )
	self.menudescription = menudescription
	
	local itemList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 86, 1421 )
	itemList:setTopBottom( true, false, 259, 388 )
	itemList:setDataSource( "RemoveItemFromClassList" )
	itemList:setWidgetType( CoD.OverCapacityItem )
	itemList:setHorizontalCount( 10 )
	itemList:setSpacing( 5 )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	self:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		WeaponVariantRemoveItemFromClass( self, element, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( itemList )
	self.itemList = itemList
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
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
		menu = self
	} )
	if not self:restoreState() then
		self.itemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.itemList:close()
		element.titleLabel:close()
		element.menudescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "RemoveItemFromClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

