require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.Lobby.LobbyFriendsListRow" )

LUI.createMenu.LobbyFriendsOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyFriendsOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FriendsMenu"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyFriendsOverlay.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local lblTitle = LUI.UITightText.new()
	lblTitle:setLeftRight( 0, 0, 192, 444 )
	lblTitle:setTopBottom( 0, 0, 108, 198 )
	lblTitle:setAlpha( 0 )
	lblTitle:setText( Engine.Localize( "MENU_FRIENDS" ) )
	lblTitle:setTTF( "fonts/default.ttf" )
	self:addElement( lblTitle )
	self.lblTitle = lblTitle
	
	local Friends = LUI.UIList.new( self, controller, 6, 0, nil, false, false, 0, 0, false, false )
	Friends:makeFocusable()
	Friends:setLeftRight( 0, 0, 480, 1404 )
	Friends:setTopBottom( 0, 0, 254, 716 )
	Friends:setWidgetType( CoD.LobbyFriendsListRow )
	Friends:setVerticalCount( 9 )
	Friends:setSpacing( 6 )
	Friends:setDataSource( "LobbyFriends" )
	Friends:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	self:AddButtonCallbackFunction( Friends, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		LobbyInviteFriend( self, element, controller, "" )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( Friends )
	self.Friends = Friends
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( 0, 0, -107.5, 759.5 )
	cac3dTitleIntermediary0:setTopBottom( 0, 0, 1, 220 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FRIENDS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
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

