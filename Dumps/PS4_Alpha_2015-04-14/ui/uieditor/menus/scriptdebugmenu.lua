require( "ui.uieditor.widgets.MenuSpecificWidgets.ScriptDebugMenuListWidget" )

local ScriptDebugMenu_Close = function ( self, event )
	GoBack( self, event.controller )
	SendClientScriptDebugMenuCloseMenuNotify( self, nil, event.controller )
end

local PostLoadFunc = function ( self )
	self:registerEventHandler( "close_ScriptDebugMenu", ScriptDebugMenu_Close )
end

LUI.createMenu.ScriptDebugMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ScriptDebugMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local cscDebugMenuList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	cscDebugMenuList:makeFocusable()
	cscDebugMenuList:setLeftRight( true, false, 99, 699 )
	cscDebugMenuList:setTopBottom( true, false, 257, 511 )
	cscDebugMenuList:setRGB( 1, 1, 1 )
	cscDebugMenuList:setDataSource( "ClientscriptDebugMenu" )
	cscDebugMenuList:setWidgetType( CoD.ScriptDebugMenuListWidget )
	cscDebugMenuList:setVerticalCount( 8 )
	cscDebugMenuList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		SendClientScriptDebugMenuNotify( self, element, controller )
		return retVal
	end )
	self:addElement( cscDebugMenuList )
	self.cscDebugMenuList = cscDebugMenuList
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "A") then
			GoBack( self, controller )
			SendClientScriptDebugMenuCloseMenuNotify( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	cscDebugMenuList.id = "cscDebugMenuList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.cscDebugMenuList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.cscDebugMenuList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

