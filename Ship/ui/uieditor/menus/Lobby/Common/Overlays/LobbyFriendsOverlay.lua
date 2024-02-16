-- 8707dd461496adbb6d1a9a29120a01bf
-- This hash is used for caching, delete to decompile the file again

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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyFriendsOverlay.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local lblTitle = LUI.UITightText.new()
	lblTitle:setLeftRight( true, false, 128, 296 )
	lblTitle:setTopBottom( true, false, 72, 132 )
	lblTitle:setAlpha( 0 )
	lblTitle:setText( Engine.Localize( "MENU_FRIENDS" ) )
	lblTitle:setTTF( "fonts/default.ttf" )
	self:addElement( lblTitle )
	self.lblTitle = lblTitle
	
	local Friends = LUI.UIList.new( f1_local1, controller, 4, 0, nil, false, false, 0, 0, false, true )
	Friends:makeFocusable()
	Friends:setLeftRight( true, false, 320, 936 )
	Friends:setTopBottom( true, false, 168, 479 )
	Friends:setDataSource( "LobbyFriends" )
	Friends:setWidgetType( CoD.LobbyFriendsListRow )
	Friends:setVerticalCount( 9 )
	Friends:setSpacing( 4 )
	Friends:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	Friends:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( Friends, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		LobbyInviteFriend( self, f4_arg0, f4_arg2, "" )
		GoBack( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Friends )
	self.Friends = Friends
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( f1_local1, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -71.59, 506.41 )
	cac3dTitleIntermediary0:setTopBottom( true, false, 0.42, 146.42 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FRIENDS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		GoBack( self, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	Friends.id = "Friends"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.Friends:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Friends:close()
		element.cac3dTitleIntermediary0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyFriendsOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

