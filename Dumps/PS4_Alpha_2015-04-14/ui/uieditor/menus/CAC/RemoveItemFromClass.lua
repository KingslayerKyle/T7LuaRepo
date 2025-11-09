require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.OverCapacityItem" )

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
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background:setRGB( 1, 1, 1 )
	self:addElement( background )
	self.background = background
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 83, 1216 )
	titleLabel:setTopBottom( true, false, 141, 189 )
	titleLabel:setRGB( 0.87, 0.88, 0.78 )
	titleLabel:setText( Engine.Localize( "MENU_REMOVE_ITEM_FROM_CLASS" ) )
	titleLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local menudescription = LUI.UITightText.new()
	menudescription:setLeftRight( true, false, 84, 693 )
	menudescription:setTopBottom( true, false, 208, 233 )
	menudescription:setRGB( 0.5, 0.51, 0.52 )
	menudescription:setText( Engine.Localize( "MENU_REMOVE_ITEM_FROM_CLASS_DESC" ) )
	menudescription:setTTF( "fonts/default.ttf" )
	self:addElement( menudescription )
	self.menudescription = menudescription
	
	local itemList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 86, 1421 )
	itemList:setTopBottom( true, false, 259, 388 )
	itemList:setRGB( 1, 1, 1 )
	itemList:setDataSource( "RemoveItemFromClassList" )
	itemList:setWidgetType( CoD.OverCapacityItem )
	itemList:setHorizontalCount( 10 )
	itemList:setSpacing( 5 )
	itemList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		WeaponVariantRemoveItemFromClass( self, element, controller )
		ClearSavedState( self, controller )
		return retVal
	end )
	self:addElement( itemList )
	self.itemList = itemList
	
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
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

