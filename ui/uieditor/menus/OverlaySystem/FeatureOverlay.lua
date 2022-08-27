-- bafba473cdac6201f0f31072038594aa
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.featureOverlay_Layout" )

LUI.createMenu.FeatureOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FeatureOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FeatureOverlay.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local layout = CoD.featureOverlay_Layout.new( f1_local1, controller )
	layout:setLeftRight( true, true, 0, 0 )
	layout:setTopBottom( true, true, 0, 0 )
	layout:linkToElementModel( self, nil, false, function ( model )
		layout:setModel( model, controller )
	end )
	self:addElement( layout )
	self.layout = layout
	
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if HasOverlayBackAction( f5_arg1 ) then
			PerformOverlayBack( self, f5_arg0, f5_arg2, f5_arg1 )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if HasOverlayBackAction( f6_arg1 ) then
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		return false
	end, false )
	layout.vlayout.buttons.buttons:setModel( self.buttonModel, controller )
	layout.id = "layout"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.layout:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.layout:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FeatureOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

