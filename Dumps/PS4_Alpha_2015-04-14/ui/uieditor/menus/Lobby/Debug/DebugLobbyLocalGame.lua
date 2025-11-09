require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.GameClientList" )
require( "ui.uieditor.widgets.Lobby.Debug.DebugLobbyListRow" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.GameHostList" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.PrivateClientList" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.PrivateHostList" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.widgets.Lobby.Debug.DebugArea" )

LUI.createMenu.DebugLobbyLocalGame = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DebugLobbyLocalGame" )
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
	
	local lstGameClientList = CoD.GameClientList.new( self, controller )
	lstGameClientList:setLeftRight( true, false, 85, 395 )
	lstGameClientList:setTopBottom( true, false, 54, 211 )
	lstGameClientList:setRGB( 1, 1, 1 )
	lstGameClientList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstGameClientList.lstLobbyList:setVerticalCount( 4 )
	self:addElement( lstGameClientList )
	self.lstGameClientList = lstGameClientList
	
	local lstGameHostList = CoD.GameHostList.new( self, controller )
	lstGameHostList:setLeftRight( true, false, 85.5, 395.5 )
	lstGameHostList:setTopBottom( true, false, 211, 366 )
	lstGameHostList:setRGB( 1, 1, 1 )
	lstGameHostList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstGameHostList.lstLobbyList:setVerticalCount( 4 )
	self:addElement( lstGameHostList )
	self.lstGameHostList = lstGameHostList
	
	local lstPrivateClientList = CoD.PrivateClientList.new( self, controller )
	lstPrivateClientList:setLeftRight( true, false, 85.5, 395.5 )
	lstPrivateClientList:setTopBottom( true, false, 366, 441 )
	lstPrivateClientList:setRGB( 1, 1, 1 )
	lstPrivateClientList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstPrivateClientList.lstLobbyList:setVerticalCount( 1 )
	self:addElement( lstPrivateClientList )
	self.lstPrivateClientList = lstPrivateClientList
	
	local lstPrivateHostList = CoD.PrivateHostList.new( self, controller )
	lstPrivateHostList:setLeftRight( true, false, 85.5, 395.5 )
	lstPrivateHostList:setTopBottom( true, false, 439, 515 )
	lstPrivateHostList:setRGB( 1, 1, 1 )
	lstPrivateHostList.lstLobbyList:setWidgetType( CoD.DebugLobbyListRow )
	lstPrivateHostList.lstLobbyList:setVerticalCount( 1 )
	self:addElement( lstPrivateHostList )
	self.lstPrivateHostList = lstPrivateHostList
	
	local btnStart = CoD.button.new( self, controller )
	btnStart:setLeftRight( true, false, 96, 345 )
	btnStart:setTopBottom( true, false, 527, 557 )
	btnStart:setRGB( 1, 1, 1 )
	btnStart.buttoninternal0.Text0:setText( Engine.Localize( "MPUI_START_MATCH_CAPS" ) )
	btnStart:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		LobbyLocalLaunchGame( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnStart )
	self.btnStart = btnStart
	
	local DebugArea = CoD.DebugArea.new( self, controller )
	DebugArea:setLeftRight( true, false, 398, 1184 )
	DebugArea:setTopBottom( true, false, 54, 666 )
	DebugArea:setRGB( 1, 1, 1 )
	DebugArea.lblPath:setText( Engine.Localize( "PATH" ) )
	self:addElement( DebugArea )
	self.DebugArea = DebugArea
	
	local btnCAC = CoD.button.new( self, controller )
	btnCAC:setLeftRight( true, false, 96, 345 )
	btnCAC:setTopBottom( true, false, 557, 587 )
	btnCAC:setRGB( 1, 1, 1 )
	btnCAC.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	btnCAC:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenCAC( self, element, controller, "", self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnCAC )
	self.btnCAC = btnCAC
	
	local btnChangeGameMode = CoD.button.new( self, controller )
	btnChangeGameMode:setLeftRight( true, false, 96, 345 )
	btnChangeGameMode:setTopBottom( true, false, 617, 647 )
	btnChangeGameMode:setRGB( 1, 1, 1 )
	btnChangeGameMode.buttoninternal0.Text0:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	btnChangeGameMode:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenChangeGameMode( self, element, controller, "", self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnChangeGameMode )
	self.btnChangeGameMode = btnChangeGameMode
	
	local btnChangeMap = CoD.button.new( self, controller )
	btnChangeMap:setLeftRight( true, false, 96, 345 )
	btnChangeMap:setTopBottom( true, false, 587, 617 )
	btnChangeMap:setRGB( 1, 1, 1 )
	btnChangeMap.buttoninternal0.Text0:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	btnChangeMap:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenChangeMap( self, element, controller, "", self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnChangeMap )
	self.btnChangeMap = btnChangeMap
	
	lstGameClientList.navigation = {
		right = DebugArea,
		down = lstGameHostList
	}
	lstGameHostList.navigation = {
		up = lstGameClientList,
		right = DebugArea,
		down = lstPrivateClientList
	}
	lstPrivateClientList.navigation = {
		left = lstPrivateHostList,
		up = lstGameHostList,
		right = DebugArea,
		down = lstPrivateHostList
	}
	lstPrivateHostList.navigation = {
		left = lstPrivateClientList,
		up = lstPrivateClientList,
		right = DebugArea,
		down = btnStart
	}
	btnStart.navigation = {
		up = lstPrivateHostList,
		right = DebugArea,
		down = btnCAC
	}
	DebugArea.navigation = {
		left = {
			lstGameHostList,
			lstPrivateClientList,
			lstPrivateHostList
		}
	}
	btnCAC.navigation = {
		up = btnStart,
		right = DebugArea,
		down = btnChangeMap
	}
	btnChangeGameMode.navigation = {
		up = btnChangeMap,
		right = DebugArea
	}
	btnChangeMap.navigation = {
		up = btnCAC,
		right = DebugArea,
		down = btnChangeGameMode
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
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
			clipName = "ModeLocal"
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
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	lstGameClientList.id = "lstGameClientList"
	lstGameHostList.id = "lstGameHostList"
	lstPrivateClientList.id = "lstPrivateClientList"
	lstPrivateHostList.id = "lstPrivateHostList"
	btnStart.id = "btnStart"
	DebugArea.id = "DebugArea"
	btnCAC.id = "btnCAC"
	btnChangeGameMode.id = "btnChangeGameMode"
	btnChangeMap.id = "btnChangeMap"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.lstGameClientList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.bdrGameHost:close()
		self.bdrGameClient:close()
		self.bdrPrivateHost:close()
		self.bdrPrivateClient:close()
		self.lstGameClientList:close()
		self.lstGameHostList:close()
		self.lstPrivateClientList:close()
		self.lstPrivateHostList:close()
		self.btnStart:close()
		self.DebugArea:close()
		self.btnCAC:close()
		self.btnChangeGameMode:close()
		self.btnChangeMap:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

