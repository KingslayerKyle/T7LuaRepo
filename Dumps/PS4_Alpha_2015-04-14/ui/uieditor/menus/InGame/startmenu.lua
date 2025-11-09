require( "ui.uieditor.widgets.TabWidget" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionTab" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.OptionsTab" )

LUI.createMenu.StartMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local tabWidget = CoD.TabWidget.new( self, controller )
	tabWidget:setLeftRight( true, true, 0, 0 )
	tabWidget:setTopBottom( true, true, 0, 0 )
	tabWidget:setRGB( 1, 1, 1 )
	self:addElement( tabWidget )
	self.tabWidget = tabWidget
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.start = function ( menu, element, event )
		menu:addButtonPrompt( "start", Engine.Localize( "MENU_CLOSE" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.start( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESC") then
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "start" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	tabWidget.id = "tabWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.tabWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.tabWidget:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

