-- 3b8bd0210eaae2d9743f69393f2f745e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Compact_Layout" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.disablePopupOpenCloseAnim = true
end

LUI.createMenu.SystemOverlay_Compact = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SystemOverlay_Compact" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SystemOverlay_Compact.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local layout = CoD.systemOverlay_Compact_Layout.new( f2_local1, controller )
	layout:setLeftRight( true, true, 0, 0 )
	layout:setTopBottom( true, true, 0, 0 )
	layout:setAlpha( 0.99 )
	layout:linkToElementModel( self, nil, false, function ( model )
		layout:setModel( model, controller )
	end )
	self:addElement( layout )
	self.layout = layout
	
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if HasOverlayBackAction( f6_arg1 ) then
			PerformOverlayBack( self, f6_arg0, f6_arg2, f6_arg1 )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if HasOverlayBackAction( f7_arg1 ) then
			return true
		else
			return false
		end
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		return false
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
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
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.layout:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.layout:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SystemOverlay_Compact.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

