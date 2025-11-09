require( "ui.uieditor.widgets.MenuSpecificWidgets.ScriptDebugMenuListWidget" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	GoBack( f1_arg0, f1_arg1.controller )
	SendClientScriptDebugMenuCloseMenuNotify( f1_arg0, nil, f1_arg1.controller )
end

local PostLoadFunc = function ( f2_arg0 )
	f2_arg0:registerEventHandler( "close_ScriptDebugMenu", f0_local0 )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ScriptDebugMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local cscDebugMenuList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	cscDebugMenuList:makeFocusable()
	cscDebugMenuList:setLeftRight( true, false, 99, 699 )
	cscDebugMenuList:setTopBottom( true, false, 257, 511 )
	cscDebugMenuList:setDataSource( "ClientscriptDebugMenu" )
	cscDebugMenuList:setWidgetType( CoD.ScriptDebugMenuListWidget )
	cscDebugMenuList:setVerticalCount( 8 )
	cscDebugMenuList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	cscDebugMenuList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( cscDebugMenuList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SendClientScriptDebugMenuNotify( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( cscDebugMenuList )
	self.cscDebugMenuList = cscDebugMenuList
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		SendClientScriptDebugMenuCloseMenuNotify( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cscDebugMenuList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ScriptDebugMenu.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

