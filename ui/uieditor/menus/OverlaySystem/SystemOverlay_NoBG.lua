-- f10ce7c8afdfe23a6adb55f801ac076b
-- This hash is used for caching, delete to decompile the file again

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

LUI.createMenu.SystemOverlay_NoBG = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SystemOverlay_NoBG" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SystemOverlay_NoBG.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local layout = CoD.systemOverlay_Compact_Layout.new( f3_local1, controller )
	layout:setLeftRight( false, false, -640, 640 )
	layout:setTopBottom( false, false, -360, 360 )
	layout:setAlpha( 0.99 )
	layout.background:setAlpha( 0 )
	layout:linkToElementModel( self, nil, false, function ( model )
		layout:setModel( model, controller )
	end )
	self:addElement( layout )
	self.layout = layout
	
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if HasOverlayBackAction( f7_arg1 ) then
			PerformOverlayBack( self, f7_arg0, f7_arg2, f7_arg1 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if HasOverlayBackAction( f8_arg1 ) then
			return true
		else
			return false
		end
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		return false
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
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
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.layout:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.layout:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SystemOverlay_NoBG.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

