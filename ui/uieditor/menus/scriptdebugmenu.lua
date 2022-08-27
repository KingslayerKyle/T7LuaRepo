-- 2a8faa2a1b06146821009d868e6a6e1f
-- This hash is used for caching, delete to decompile the file again

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
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local cscDebugMenuList = LUI.UIList.new( f3_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
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
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f3_local1:AddButtonCallbackFunction( cscDebugMenuList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		SendClientScriptDebugMenuNotify( self, f6_arg0, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( cscDebugMenuList )
	self.cscDebugMenuList = cscDebugMenuList
	
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		SendClientScriptDebugMenuCloseMenuNotify( self, f8_arg0, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	cscDebugMenuList.id = "cscDebugMenuList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
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

