require( "ui.uieditor.widgets.CAC.OverCapacityItem_old" )

local PostLoadFunc = function ( self, controller )
	CoD.perController[controller].isOverCapacityMenuOpen = true
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		CoD.perController[controller].isOverCapacityMenuOpen = false
	end )
end

LUI.createMenu.OverCapacity_old = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "OverCapacity_old" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.91, 0.91, 0.91 )
	background:setImage( RegisterImage( "uie_t7_menu_mp_cac_backdrop" ) )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local bannerBacking = LUI.UIImage.new()
	bannerBacking:setLeftRight( true, false, 0, 1280 )
	bannerBacking:setTopBottom( true, false, 193, 526 )
	bannerBacking:setRGB( 0.82, 0.83, 0.83 )
	bannerBacking:setAlpha( 0.1 )
	bannerBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bannerBacking )
	self.bannerBacking = bannerBacking
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 66, 469 )
	title:setTopBottom( true, false, 202, 262 )
	title:setRGB( 0.5, 0.51, 0.52 )
	title:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_CAPS" ) )
	title:setTTF( "fonts/default.ttf" )
	self:addElement( title )
	self.title = title
	
	local menudescription = LUI.UITightText.new()
	menudescription:setLeftRight( true, false, 66, 675 )
	menudescription:setTopBottom( true, false, 262.02, 287.02 )
	menudescription:setRGB( 0.5, 0.51, 0.52 )
	menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC" ) )
	menudescription:setTTF( "fonts/default.ttf" )
	self:addElement( menudescription )
	self.menudescription = menudescription
	
	local itemCarousel = LUI.UIList.new( self, controller, 10, 200, nil, false, false, 100, 0, false, true )
	itemCarousel:makeFocusable()
	itemCarousel:setLeftRight( true, false, 0, 1330 )
	itemCarousel:setTopBottom( true, false, 321, 471 )
	itemCarousel:setRGB( 1, 1, 1 )
	itemCarousel:setDataSource( "OverCapacityList" )
	itemCarousel:setWidgetType( CoD.OverCapacityItem_old )
	itemCarousel:setHorizontalCount( 4 )
	itemCarousel:setSpacing( 10 )
	itemCarousel:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		RemoveOverflowItemFromClass( self, element, controller )
		ClearSavedState( self, controller )
		return retVal
	end )
	self:addElement( itemCarousel )
	self.itemCarousel = itemCarousel
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
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
			ClearSavedState( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	itemCarousel.id = "itemCarousel"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.itemCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.itemCarousel:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

