require( "ui.uieditor.widgets.Lobby.LobbyFriendsListRow" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )

LUI.createMenu.LobbyFriendsOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyFriendsOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FriendsMenu"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local lblTitle = LUI.UITightText.new()
	lblTitle:setLeftRight( true, false, 128, 296 )
	lblTitle:setTopBottom( true, false, 72, 132 )
	lblTitle:setRGB( 1, 1, 1 )
	lblTitle:setAlpha( 0 )
	lblTitle:setText( Engine.Localize( "MENU_FRIENDS" ) )
	lblTitle:setTTF( "fonts/default.ttf" )
	self:addElement( lblTitle )
	self.lblTitle = lblTitle
	
	local Friends = LUI.UIList.new( self, controller, 4, 0, nil, false, false, 0, 0, false, true )
	Friends:makeFocusable()
	Friends:setLeftRight( true, false, 320, 936 )
	Friends:setTopBottom( true, false, 168, 479 )
	Friends:setRGB( 1, 1, 1 )
	Friends:setDataSource( "LobbyFriends" )
	Friends:setWidgetType( CoD.LobbyFriendsListRow )
	Friends:setVerticalCount( 9 )
	Friends:setSpacing( 4 )
	Friends:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		LobbyInviteFriend( self, element, controller )
		GoBack( self, controller )
		return retVal
	end )
	self:addElement( Friends )
	self.Friends = Friends
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -71.59, 506.41 )
	cac3dTitleIntermediary0:setTopBottom( true, false, 0.42, 146.42 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FRIENDS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
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
	Friends.id = "Friends"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Friends:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.Friends:close()
		self.cac3dTitleIntermediary0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

