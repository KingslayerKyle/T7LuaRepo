require( "ui.uieditor.menus.Lobby.Common.Overlays.LobbyFriendsOverlay" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.PrivateClientList" )
require( "ui.uieditor.widgets.Lobby.Debug.DebugLobbyListRow" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.PrivateHostList" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.GameClientList" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.GameHostList" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.menus.Lobby.Debug.DebugLobbyOnlinePublicGame" )
require( "ui.uieditor.menus.Lobby.Debug.DebugLobbyOnlineCustomGame" )
require( "ui.uieditor.widgets.Lobby.Debug.DebugArea" )

LUI.createMenu.DebugLobbyOnline = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DebugLobbyOnline" )
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
	bdrGameHost:setTopBottom( true, false, 439, 515 )
	bdrGameHost:setRGB( 1, 1, 1 )
	self:addElement( bdrGameHost )
	self.bdrGameHost = bdrGameHost
	
	local bdrGameClient = CoD.Border.new( self, controller )
	bdrGameClient:setLeftRight( true, false, 82.5, 399.5 )
	bdrGameClient:setTopBottom( true, false, 364, 441 )
	bdrGameClient:setRGB( 1, 1, 1 )
	self:addElement( bdrGameClient )
	self.bdrGameClient = bdrGameClient
	
	local bdrPrivateHost = CoD.Border.new( self, controller )
	bdrPrivateHost:setLeftRight( true, false, 82.5, 399.5 )
	bdrPrivateHost:setTopBottom( true, false, 213, 366 )
	bdrPrivateHost:setRGB( 1, 1, 1 )
	self:addElement( bdrPrivateHost )
	self.bdrPrivateHost = bdrPrivateHost
	
	local bdrPrivateClient = CoD.Border.new( self, controller )
	bdrPrivateClient:setLeftRight( true, false, 82.5, 399.5 )
	bdrPrivateClient:setTopBottom( true, false, 54, 213 )
	bdrPrivateClient:setRGB( 1, 1, 1 )
	self:addElement( bdrPrivateClient )
	self.bdrPrivateClient = bdrPrivateClient
	
	local lstPrivateClientList = CoD.PrivateClientList.new( self, controller )
	lstPrivateClientList:setLeftRight( true, false, 85, 395 )
	lstPrivateClientList:setTopBottom( true, false, 54, 211 )
	lstPrivateClientList:setRGB( 1, 1, 1 )
	lstPrivateClientList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstPrivateClientList.lstLobbyList:setVerticalCount( 4 )
	self:addElement( lstPrivateClientList )
	self.lstPrivateClientList = lstPrivateClientList
	
	local lstPrivateHostList = CoD.PrivateHostList.new( self, controller )
	lstPrivateHostList:setLeftRight( true, false, 85.5, 395.5 )
	lstPrivateHostList:setTopBottom( true, false, 211, 366 )
	lstPrivateHostList:setRGB( 1, 1, 1 )
	lstPrivateHostList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstPrivateHostList.lstLobbyList:setVerticalCount( 4 )
	self:addElement( lstPrivateHostList )
	self.lstPrivateHostList = lstPrivateHostList
	
	local lstGameClientList = CoD.GameClientList.new( self, controller )
	lstGameClientList:setLeftRight( true, false, 85.5, 395.5 )
	lstGameClientList:setTopBottom( true, false, 366, 441 )
	lstGameClientList:setRGB( 1, 1, 1 )
	lstGameClientList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstGameClientList.lstLobbyList:setVerticalCount( 1 )
	self:addElement( lstGameClientList )
	self.lstGameClientList = lstGameClientList
	
	local lstGameHostList = CoD.GameHostList.new( self, controller )
	lstGameHostList:setLeftRight( true, false, 85.5, 395.5 )
	lstGameHostList:setTopBottom( true, false, 439, 515 )
	lstGameHostList:setRGB( 1, 1, 1 )
	lstGameHostList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstGameHostList.lstLobbyList:setVerticalCount( 1 )
	self:addElement( lstGameHostList )
	self.lstGameHostList = lstGameHostList
	
	local btnPublic = CoD.button.new( self, controller )
	btnPublic:setLeftRight( true, false, 96, 250 )
	btnPublic:setTopBottom( true, false, 570, 600 )
	btnPublic:setRGB( 1, 1, 1 )
	btnPublic.buttoninternal0.Text0:setText( Engine.Localize( "MENU_MATCHMAKING_CAPS" ) )
	btnPublic:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		NavigateToLobby( self, "DebugLobbyOnlinePublicGame", false, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnPublic )
	self.btnPublic = btnPublic
	
	local btnCustom = CoD.button.new( self, controller )
	btnCustom:setLeftRight( true, false, 96, 250 )
	btnCustom:setTopBottom( true, false, 600, 630 )
	btnCustom:setRGB( 1, 1, 1 )
	btnCustom.buttoninternal0.Text0:setText( Engine.Localize( "MPUI_CUSTOM_MATCH_CAPS" ) )
	btnCustom:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		NavigateToLobby( self, "DebugLobbyOnlineCustomGame", false, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnCustom )
	self.btnCustom = btnCustom
	
	local DebugArea = CoD.DebugArea.new( self, controller )
	DebugArea:setLeftRight( true, false, 398, 1184 )
	DebugArea:setTopBottom( true, false, 54, 666 )
	DebugArea:setRGB( 1, 1, 1 )
	DebugArea.lblPath:setText( Engine.Localize( "PATH" ) )
	self:addElement( DebugArea )
	self.DebugArea = DebugArea
	
	lstPrivateClientList.navigation = {
		right = DebugArea,
		down = lstPrivateHostList
	}
	lstPrivateHostList.navigation = {
		up = lstPrivateClientList,
		right = DebugArea,
		down = lstGameClientList
	}
	lstGameClientList.navigation = {
		left = lstGameHostList,
		up = lstPrivateHostList,
		right = DebugArea,
		down = lstGameHostList
	}
	lstGameHostList.navigation = {
		left = lstGameClientList,
		up = lstGameClientList,
		right = DebugArea,
		down = btnPublic
	}
	btnPublic.navigation = {
		up = lstGameHostList,
		right = DebugArea,
		down = btnCustom
	}
	btnCustom.navigation = {
		up = btnPublic,
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
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_FRIENDS" ), "F", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlayClipOnElement( self, {
			elementName = "Background0",
			clipName = "MP"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "Background0",
			clipName = "ModeOnline"
		}, controller )
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
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			LobbyGoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "F") then
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
	btnPublic.id = "btnPublic"
	btnCustom.id = "btnCustom"
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
		self.btnPublic:processEvent( {
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
		self.btnPublic:close()
		self.btnCustom:close()
		self.DebugArea:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

