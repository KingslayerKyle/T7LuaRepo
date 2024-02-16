require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.ListButton" )
require( "ui.uieditor.menus.AccountLink.UmbrellaSignIn" )
require( "ui.uieditor.menus.AccountLink.TermsOfService" )

LUI.createMenu.UmbrellaNewUserBegin = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "UmbrellaNewUserBegin" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FrontendMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "UmbrellaNewUserBegin.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local DialogBackground0 = CoD.DialogBackground.new( menu, controller )
	DialogBackground0:setLeftRight( true, false, 164, 1116 )
	DialogBackground0:setTopBottom( true, false, 86, 634 )
	self:addElement( DialogBackground0 )
	self.DialogBackground0 = DialogBackground0
	
	local ListButton0 = CoD.ListButton.new( menu, controller )
	ListButton0:setLeftRight( true, false, 477, 837 )
	ListButton0:setTopBottom( true, false, 528, 563 )
	ListButton0.Text.Text0:setText( Engine.Localize( "ACCOUNT_LINK_SIGNIN" ) )
	ListButton0:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if IsInDefaultState( element ) then
			GoBackAndOpenOverlayOnParent( self, "UmbrellaSignIn", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ListButton0 )
	self.ListButton0 = ListButton0
	
	local ListButton1 = CoD.ListButton.new( menu, controller )
	ListButton1:setLeftRight( true, false, 477, 837 )
	ListButton1:setTopBottom( false, true, -157, -122 )
	ListButton1.Text.Text0:setText( Engine.Localize( "ACCOUNT_LINK_CREATE" ) )
	ListButton1:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if IsInDefaultState( element ) then
			GoBackAndOpenOverlayOnParent( self, "TermsOfService", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ListButton1 )
	self.ListButton1 = ListButton1
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 485, 795 )
	Label0:setTopBottom( true, false, 122.76, 170.76 )
	Label0:setText( Engine.Localize( "ACCOUNT_LINK_MARKETING" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	ListButton0.navigation = {
		down = ListButton1
	}
	ListButton1.navigation = {
		up = ListButton0
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		menu:addButtonPrompt( "alt2", Engine.Localize( "Skip" ), "", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( menu, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( menu, self, {
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
		if not self.occludedBy and event.button == "alt2" then
			AccountLink_SetAccountLinkViewed( self, element, controller )
			GoBack( self, controller )
			LobbyBeginPlay( self, event )
			PlaySoundSetSound( self, "action" )
			LoadSaveGameData( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ListButton0.id = "ListButton0"
	ListButton1.id = "ListButton1"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.ListButton0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DialogBackground0:close()
		self.ListButton0:close()
		self.ListButton1:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "UmbrellaNewUserBegin.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

