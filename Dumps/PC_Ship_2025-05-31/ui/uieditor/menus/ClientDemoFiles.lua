require( "ui.uieditor.widgets.client_demo_files_button" )

LUI.createMenu.ClientDemoFiles = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ClientDemoFiles" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ClientDemoFiles.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local List0 = LUI.UIList.new( self, controller, 13, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( true, false, 131.28, 631.28 )
	List0:setTopBottom( true, false, 141, 632 )
	List0:setDataSource( "ClientDemoFiles" )
	List0:setWidgetType( CoD.client_demo_files_button )
	List0:setVerticalCount( 8 )
	List0:setSpacing( 13 )
	List0:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	List0:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( List0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		RunClientDemo( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( List0 )
	self.List0 = List0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 131.28, 409.28 )
	Label0:setTopBottom( true, false, 68.5, 116.5 )
	Label0:setText( Engine.Localize( "MENU_CLIENT_DEMO" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	List0.id = "List0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.List0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.List0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ClientDemoFiles.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

