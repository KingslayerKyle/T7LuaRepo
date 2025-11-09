require( "ui.uieditor.widgets.buttonprompt" )

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
end

LUI.createMenu.LobbyJoinPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyJoinPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local lblTitle = LUI.UIText.new()
	lblTitle:setLeftRight( true, false, 515, 765 )
	lblTitle:setTopBottom( true, false, 312, 360 )
	lblTitle:setRGB( 1, 1, 1 )
	lblTitle:setText( Engine.Localize( "Error" ) )
	lblTitle:setTTF( "fonts/default.ttf" )
	lblTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lblTitle )
	self.lblTitle = lblTitle
	
	local txtMessage = LUI.UIText.new()
	txtMessage:setLeftRight( true, false, 515, 765 )
	txtMessage:setTopBottom( true, false, 360, 385 )
	txtMessage:setRGB( 1, 1, 1 )
	txtMessage:setText( Engine.Localize( "Unable to join session in progress" ) )
	txtMessage:setTTF( "fonts/default.ttf" )
	txtMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtMessage )
	self.txtMessage = txtMessage
	
	local btnpromptOk = CoD.buttonprompt.new( self, controller )
	btnpromptOk:setLeftRight( true, false, 780.45, 855.45 )
	btnpromptOk:setTopBottom( true, false, 473.4, 504.4 )
	btnpromptOk.label:setText( Engine.Localize( "OK" ) )
	self:addElement( btnpromptOk )
	self.btnpromptOk = btnpromptOk
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_OK_CAPS" ), "A", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "A") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.btnpromptOk:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

