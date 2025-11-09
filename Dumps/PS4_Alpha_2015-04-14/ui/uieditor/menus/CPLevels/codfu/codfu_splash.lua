LUI.createMenu.codfu_splash = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_splash" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Splash = LUI.UIImage.new()
	Splash:setLeftRight( true, false, 128, 1152 )
	Splash:setTopBottom( true, false, 36, 1060 )
	Splash:setRGB( 1, 1, 1 )
	Splash:setImage( RegisterImage( "uie_codfu_splash" ) )
	Splash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Splash )
	self.Splash = Splash
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLAY" ), "SPACE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( menu, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "SPACE") then
			SendMenuResponse( self, "codfu_splash", "closed", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		LockInput( self, controller, true )
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
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

