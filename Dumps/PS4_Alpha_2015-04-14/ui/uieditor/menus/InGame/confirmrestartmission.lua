require( "ui.uieditor.widgets.ConfirmationDialog" )

LUI.createMenu.ConfirmRestartMission = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ConfirmRestartMission" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local ConfirmationDialog = CoD.ConfirmationDialog.new( self, controller )
	ConfirmationDialog:setLeftRight( true, false, 313, 967 )
	ConfirmationDialog:setTopBottom( true, false, 179.5, 540.5 )
	ConfirmationDialog:setRGB( 1, 1, 1 )
	ConfirmationDialog.Title:setText( Engine.Localize( "MENU_CONTINUE_RESTART" ) )
	ConfirmationDialog.TextBox0:setText( Engine.Localize( "MENU_RESTART_LEVEL_TEXT" ) )
	ConfirmationDialog.Resume.buttoninternal0.Text0:setText( Engine.Localize( "MENU_RESUMEGAME_CAPS" ) )
	ConfirmationDialog.Restart.buttoninternal0.Text0:setText( Engine.Localize( "MENU_RESTART_MISSION_CAPS" ) )
	self:addElement( ConfirmationDialog )
	self.ConfirmationDialog = ConfirmationDialog
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_RESUMEGAME_CAPS" ), "ESC", element )
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
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESC") then
			SetResponseNo( self, controller )
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ConfirmationDialog.id = "ConfirmationDialog"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ConfirmationDialog:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.ConfirmationDialog:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

