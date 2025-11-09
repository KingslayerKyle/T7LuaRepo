require( "ui.uieditor.menus.uie_FriendsList" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.menus.uie_MainLobby" )
require( "ui.uieditor.menus.uie_SystemLinkLobby" )
require( "ui.uieditor.widgets.Ticker" )

local PostLoadFunc = function ( self )
	self:registerEventHandler( "button_secondary", function ( element, event )
		NavigateToMenu( self, "MainMenu", false, event.controller )
		element:dispatchEventToChildren( event )
	end )
	self.anyControllerAllowed = true
end

LUI.createMenu.UIEditorMain = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "UIEditorMain" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local xboxliveButton = CoD.button.new( self, controller )
	xboxliveButton:setLeftRight( true, false, 112, 428 )
	xboxliveButton:setTopBottom( true, false, 429, 461 )
	xboxliveButton:setRGB( 1, 1, 1 )
	xboxliveButton.buttoninternal0.Text0:setText( Engine.Localize( "PLATFORM_XBOX_LIVE_CAPS" ) )
	xboxliveButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if IsPlayerSignedInToLive( controller ) and IsPlayerDoneFetchingDemonwareData( controller ) and not IsPlayerAGuest( controller ) and IsPlayerAllowedToViewMatureContent( controller ) and IsPlayerAllowedToPlayMultiplayerGames() then
			SwitchToMainLobby( self, controller )
			NavigateToMenu( self, "uie_MainLobby", true, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( xboxliveButton )
	self.xboxliveButton = xboxliveButton
	
	local systemlinkButton = CoD.button.new( self, controller )
	systemlinkButton:setLeftRight( true, false, 112, 428 )
	systemlinkButton:setTopBottom( true, false, 461, 493 )
	systemlinkButton:setRGB( 1, 1, 1 )
	systemlinkButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_SYSTEM_LINK_CAPS" ) )
	systemlinkButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if not IsPlayerAGuest( controller ) and IsPlayerSignedInToLive( controller ) then
			SwitchToSystemLinkLobby( self, controller )
			NavigateToMenu( self, "uie_SystemLinkLobby", true, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( systemlinkButton )
	self.systemlinkButton = systemlinkButton
	
	local localButton = CoD.button.new( self, controller )
	localButton:setLeftRight( true, false, 112, 428 )
	localButton:setTopBottom( true, false, 493, 525 )
	localButton:setRGB( 1, 1, 1 )
	localButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_LOCAL_CAPS" ) )
	localButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( localButton )
	self.localButton = localButton
	
	local optionsButton = CoD.button.new( self, controller )
	optionsButton:setLeftRight( true, false, 112, 428 )
	optionsButton:setTopBottom( true, false, 525, 557 )
	optionsButton:setRGB( 1, 1, 1 )
	optionsButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OPTIONS_CAPS" ) )
	self:addElement( optionsButton )
	self.optionsButton = optionsButton
	
	local storeButton = CoD.button.new( self, controller )
	storeButton:setLeftRight( true, false, 112, 428 )
	storeButton:setTopBottom( true, false, 557, 589 )
	storeButton:setRGB( 1, 1, 1 )
	storeButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_STORE_CAPS" ) )
	self:addElement( storeButton )
	self.storeButton = storeButton
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 112, 328 )
	Title:setTopBottom( true, false, 84, 144 )
	Title:setRGB( 1, 1, 1 )
	Title:setText( Engine.Localize( "MENU_BLACKOPS_CAPS" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local Ticker = CoD.Ticker.new( self, controller )
	Ticker:setLeftRight( true, false, 112, 912 )
	Ticker:setTopBottom( true, false, 606.5, 636.5 )
	Ticker:setRGB( 1, 1, 1 )
	self:addElement( Ticker )
	self.Ticker = Ticker
	
	xboxliveButton.navigation = {
		down = systemlinkButton
	}
	systemlinkButton.navigation = {
		up = xboxliveButton,
		down = localButton
	}
	localButton.navigation = {
		up = systemlinkButton,
		down = optionsButton
	}
	optionsButton.navigation = {
		up = localButton,
		down = storeButton
	}
	storeButton.navigation = {
		up = optionsButton
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_FRIENDS_CAPS" ), "F", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.shoulderr = function ( menu, element, event )
		menu:addButtonPrompt( "shoulderr", Engine.Localize( "MENU_JOIN" ), "J", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.shoulderr( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "F") then
			OpenPopup( self, "uie_FriendsList", controller )
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and event.button ~= "shoulderr" and event.button == "key_shortcut" and event.key == "J" then
			
		else
			
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	xboxliveButton.id = "xboxliveButton"
	systemlinkButton.id = "systemlinkButton"
	localButton.id = "localButton"
	optionsButton.id = "optionsButton"
	storeButton.id = "storeButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.xboxliveButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.xboxliveButton:close()
		self.systemlinkButton:close()
		self.localButton:close()
		self.optionsButton:close()
		self.storeButton:close()
		self.Ticker:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

