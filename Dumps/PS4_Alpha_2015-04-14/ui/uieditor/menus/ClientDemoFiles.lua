require( "ui.uieditor.widgets.client_demo_files_button" )

LUI.createMenu.ClientDemoFiles = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ClientDemoFiles" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local List0 = LUI.UIList.new( self, controller, 13, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( true, false, 131.28, 631.28 )
	List0:setTopBottom( true, false, 141, 632 )
	List0:setRGB( 1, 1, 1 )
	List0:setDataSource( "ClientDemoFiles" )
	List0:setWidgetType( CoD.client_demo_files_button )
	List0:setVerticalCount( 8 )
	List0:setSpacing( 13 )
	List0:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		RunClientDemo( self, element, controller )
		return retVal
	end )
	self:addElement( List0 )
	self.List0 = List0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 131.28, 409.28 )
	Label0:setTopBottom( true, false, 68.5, 116.5 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setText( Engine.Localize( "MENU_CLIENT_DEMO" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	List0.id = "List0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.List0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.List0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

