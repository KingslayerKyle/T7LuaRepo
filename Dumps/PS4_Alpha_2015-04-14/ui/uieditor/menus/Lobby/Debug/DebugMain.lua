require( "ui.uieditor.menus.Lobby.Common.Overlays.LobbyFriendsOverlay" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.PrivateClientList" )
require( "ui.uieditor.widgets.Lobby.Debug.DebugLobbyListRow" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.PrivateHostList" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.GameClientList" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.GameHostList" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.menus.Lobby.Debug.DebugLobbyOnline" )
require( "ui.uieditor.menus.Lobby.Debug.DebugLobbyLANGame" )
require( "ui.uieditor.menus.Lobby.Debug.DebugLobbyLocalGame" )
require( "ui.uieditor.widgets.Lobby.Debug.DebugArea" )

LUI.createMenu.DebugMain = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DebugMain" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local bdrGameHost = CoD.Border.new( self, controller )
	bdrGameHost:setLeftRight( true, false, 82.5, 399.5 )
	bdrGameHost:setTopBottom( true, false, 363, 468 )
	bdrGameHost:setRGB( 1, 1, 1 )
	self:addElement( bdrGameHost )
	self.bdrGameHost = bdrGameHost
	
	local bdrGameClient = CoD.Border.new( self, controller )
	bdrGameClient:setLeftRight( true, false, 82.5, 399.5 )
	bdrGameClient:setTopBottom( true, false, 260, 365 )
	bdrGameClient:setRGB( 1, 1, 1 )
	self:addElement( bdrGameClient )
	self.bdrGameClient = bdrGameClient
	
	local bdrPrivateHost = CoD.Border.new( self, controller )
	bdrPrivateHost:setLeftRight( true, false, 82.5, 399.5 )
	bdrPrivateHost:setTopBottom( true, false, 157, 262 )
	bdrPrivateHost:setRGB( 1, 1, 1 )
	self:addElement( bdrPrivateHost )
	self.bdrPrivateHost = bdrPrivateHost
	
	local bdrPrivateClient = CoD.Border.new( self, controller )
	bdrPrivateClient:setLeftRight( true, false, 82.5, 399.5 )
	bdrPrivateClient:setTopBottom( true, false, 54, 159 )
	bdrPrivateClient:setRGB( 1, 1, 1 )
	self:addElement( bdrPrivateClient )
	self.bdrPrivateClient = bdrPrivateClient
	
	local lstPrivateClientList = CoD.PrivateClientList.new( self, controller )
	lstPrivateClientList:setLeftRight( true, false, 85, 395 )
	lstPrivateClientList:setTopBottom( true, false, 55, 185 )
	lstPrivateClientList:setRGB( 1, 1, 1 )
	lstPrivateClientList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstPrivateClientList.lstLobbyList:setVerticalCount( 2 )
	self:addElement( lstPrivateClientList )
	self.lstPrivateClientList = lstPrivateClientList
	
	local lstPrivateHostList = CoD.PrivateHostList.new( self, controller )
	lstPrivateHostList:setLeftRight( true, false, 86, 396 )
	lstPrivateHostList:setTopBottom( true, false, 157, 260 )
	lstPrivateHostList:setRGB( 1, 1, 1 )
	lstPrivateHostList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstPrivateHostList.lstLobbyList:setVerticalCount( 2 )
	self:addElement( lstPrivateHostList )
	self.lstPrivateHostList = lstPrivateHostList
	
	local lstGameClientList = CoD.GameClientList.new( self, controller )
	lstGameClientList:setLeftRight( true, false, 86, 396 )
	lstGameClientList:setTopBottom( true, false, 260, 363 )
	lstGameClientList:setRGB( 1, 1, 1 )
	lstGameClientList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstGameClientList.lstLobbyList:setVerticalCount( 2 )
	self:addElement( lstGameClientList )
	self.lstGameClientList = lstGameClientList
	
	local lstGameHostList = CoD.GameHostList.new( self, controller )
	lstGameHostList:setLeftRight( true, false, 86, 396 )
	lstGameHostList:setTopBottom( true, false, 365, 468 )
	lstGameHostList:setRGB( 1, 1, 1 )
	lstGameHostList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstGameHostList.lstLobbyList:setVerticalCount( 2 )
	self:addElement( lstGameHostList )
	self.lstGameHostList = lstGameHostList
	
	local btnOnline = CoD.button.new( self, controller )
	btnOnline:setLeftRight( true, false, 96, 240 )
	btnOnline:setTopBottom( true, false, 545, 575 )
	btnOnline:setRGB( 1, 1, 1 )
	btnOnline.buttoninternal0.Text0:setText( Engine.Localize( "MENU_ONLINE_CAPS" ) )
	btnOnline:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		NavigateToLobby( self, "DebugLobbyOnline", false, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnOnline )
	self.btnOnline = btnOnline
	
	local btnLAN = CoD.button.new( self, controller )
	btnLAN:setLeftRight( true, false, 96, 240 )
	btnLAN:setTopBottom( true, false, 577, 607 )
	btnLAN:setRGB( 1, 1, 1 )
	btnLAN.buttoninternal0.Text0:setText( Engine.Localize( "MENU_SYSTEM_LINK_CAPS" ) )
	btnLAN:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		NavigateToLobby( self, "DebugLobbyLANGame", false, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnLAN )
	self.btnLAN = btnLAN
	
	local btnLocal = CoD.button.new( self, controller )
	btnLocal:setLeftRight( true, false, 96, 240 )
	btnLocal:setTopBottom( true, false, 609, 639 )
	btnLocal:setRGB( 1, 1, 1 )
	btnLocal.buttoninternal0.Text0:setText( Engine.Localize( "MENU_LOCAL_CAPS" ) )
	btnLocal:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		NavigateToLobby( self, "DebugLobbyLocalGame", false, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnLocal )
	self.btnLocal = btnLocal
	
	local DebugArea = CoD.DebugArea.new( self, controller )
	DebugArea:setLeftRight( true, false, 398, 1184 )
	DebugArea:setTopBottom( true, false, 55, 667 )
	DebugArea:setRGB( 1, 1, 1 )
	DebugArea.lblPath:setText( Engine.Localize( "PATH" ) )
	self:addElement( DebugArea )
	self.DebugArea = DebugArea
	
	local lblWarningMessage = LUI.UITightText.new()
	lblWarningMessage:setLeftRight( true, false, 112, 463 )
	lblWarningMessage:setTopBottom( true, false, 522.5, 547.5 )
	lblWarningMessage:setRGB( 1, 1, 0 )
	lblWarningMessage:setText( Engine.Localize( "!!!!! ALL LISTS SHOULD BE EMPTY !!!!!" ) )
	lblWarningMessage:setTTF( "fonts/default.ttf" )
	self:addElement( lblWarningMessage )
	self.lblWarningMessage = lblWarningMessage
	
	lstPrivateClientList.navigation = {
		right = lstPrivateHostList,
		down = lstPrivateHostList
	}
	lstPrivateHostList.navigation = {
		left = lstPrivateClientList,
		up = lstPrivateClientList,
		right = DebugArea,
		down = lstGameClientList
	}
	lstGameClientList.navigation = {
		up = lstPrivateHostList,
		right = DebugArea,
		down = lstGameHostList
	}
	lstGameHostList.navigation = {
		up = lstGameClientList,
		right = DebugArea,
		down = btnOnline
	}
	btnOnline.navigation = {
		up = lstGameHostList,
		right = DebugArea,
		down = btnLAN
	}
	btnLAN.navigation = {
		up = btnOnline,
		right = DebugArea,
		down = btnLocal
	}
	btnLocal.navigation = {
		up = btnLAN,
		right = DebugArea
	}
	DebugArea.navigation = {
		left = {
			lstPrivateHostList,
			lstGameClientList,
			lstGameHostList
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_FRIENDS" ), "F", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetLobbyMenu( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "F") then
			OpenPopup( self, "LobbyFriendsOverlay", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	lstPrivateClientList.id = "lstPrivateClientList"
	lstPrivateHostList.id = "lstPrivateHostList"
	lstGameClientList.id = "lstGameClientList"
	lstGameHostList.id = "lstGameHostList"
	btnOnline.id = "btnOnline"
	btnLAN.id = "btnLAN"
	btnLocal.id = "btnLocal"
	DebugArea.id = "DebugArea"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.lstPrivateClientList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.bdrGameHost:close()
		self.bdrGameClient:close()
		self.bdrPrivateHost:close()
		self.bdrPrivateClient:close()
		self.lstPrivateClientList:close()
		self.lstPrivateHostList:close()
		self.lstGameClientList:close()
		self.lstGameHostList:close()
		self.btnOnline:close()
		self.btnLAN:close()
		self.btnLocal:close()
		self.DebugArea:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

