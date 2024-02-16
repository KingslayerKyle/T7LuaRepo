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
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyFriendsOverlay.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local lblTitle = LUI.UITightText.new()
	lblTitle:setLeftRight( true, false, 128, 296 )
	lblTitle:setTopBottom( true, false, 72, 132 )
	lblTitle:setAlpha( 0 )
	lblTitle:setText( Engine.Localize( "MENU_FRIENDS" ) )
	lblTitle:setTTF( "fonts/default.ttf" )
	self:addElement( lblTitle )
	self.lblTitle = lblTitle
	
	local Friends = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, true )
	Friends:makeFocusable()
	Friends:setLeftRight( true, false, 320, 936 )
	Friends:setTopBottom( true, false, 168, 479 )
	Friends:setDataSource( "LobbyFriends" )
	Friends:setWidgetType( CoD.LobbyFriendsListRow )
	Friends:setVerticalCount( 9 )
	Friends:setSpacing( 4 )
	Friends:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Friends:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Friends, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		LobbyInviteFriend( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Friends )
	self.Friends = Friends
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -71.59, 506.41 )
	cac3dTitleIntermediary0:setTopBottom( true, false, 0.42, 146.42 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FRIENDS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	Friends.id = "Friends"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.Friends:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Friends:close()
		self.cac3dTitleIntermediary0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyFriendsOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

