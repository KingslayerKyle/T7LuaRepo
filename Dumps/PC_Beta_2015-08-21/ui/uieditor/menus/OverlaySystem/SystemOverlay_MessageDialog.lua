require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Compact_Layout" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = DataSources.MessageDialog.getModel( controller )
	local f1_local1 = CoD.SafeGetModelValue( f1_local0, "controller" )
	if CoD.SafeGetModelValue( f1_local0, "anyControllerAllowed" ) == true then
		self.anyControllerAllowed = true
	elseif f1_local1 ~= nil then
		self:setOwner( f1_local1 )
		self.anyControllerAllowed = false
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.disableDarkenElement = true
	f2_arg0.disableBlur = true
	local f2_local0 = Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f2_arg1 ), "message" ) )
	if f2_local0 ~= nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "MessageDialogBox: Opened with '" .. f2_local0 .. "'.\n" )
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "MessageDialogBox: Opened with no message.\n" )
	end
end

LUI.createMenu.SystemOverlay_MessageDialog = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SystemOverlay_MessageDialog" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SystemOverlay_MessageDialog.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local layout = CoD.systemOverlay_Compact_Layout.new( self, controller )
	layout:setLeftRight( true, true, 0, 0 )
	layout:setTopBottom( true, true, 0, 0 )
	layout:setAlpha( 0.99 )
	layout:linkToElementModel( self, nil, false, function ( model )
		layout:setModel( model, controller )
	end )
	self:addElement( layout )
	self.layout = layout
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if HasOverlayBackAction( menu ) then
			PerformOverlayBack( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if HasOverlayBackAction( menu ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		return false
	end, false )
	layout.buttons:setModel( self.buttonModel, controller )
	layout.id = "layout"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.layout:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.layout:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SystemOverlay_MessageDialog.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

