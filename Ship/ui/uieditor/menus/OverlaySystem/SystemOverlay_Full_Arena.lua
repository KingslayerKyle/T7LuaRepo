-- 14fa0580de9f95972d9859c6930be54b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Full_Arena_Layout" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.disablePopupOpenCloseAnim = true
	f1_arg0.disableBlur = true
end

LUI.createMenu.SystemOverlay_Full_Arena = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SystemOverlay_Full_Arena" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SystemOverlay_Full_Arena.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local systemOverlayFullArenaLayout = CoD.systemOverlay_Full_Arena_Layout.new( f2_local1, controller )
	systemOverlayFullArenaLayout:setLeftRight( true, true, 0, 0 )
	systemOverlayFullArenaLayout:setTopBottom( true, true, 0, 0 )
	systemOverlayFullArenaLayout:linkToElementModel( self, nil, false, function ( model )
		systemOverlayFullArenaLayout:setModel( model, controller )
	end )
	self:addElement( systemOverlayFullArenaLayout )
	self.systemOverlayFullArenaLayout = systemOverlayFullArenaLayout
	
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if HasOverlayContinueAction( f4_arg1 ) then
			PerformOverlayContinue( self, f4_arg0, f4_arg2, f4_arg1 )
			return true
		else
			
		end
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		if HasOverlayContinueAction( f5_arg1 ) then
			CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
			return true
		else
			return false
		end
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if HasOverlayBackAction( f6_arg1 ) then
			PerformOverlayBack( self, f6_arg0, f6_arg2, f6_arg1 )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if HasOverlayBackAction( f7_arg1 ) then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
	systemOverlayFullArenaLayout.buttons:setModel( self.buttonModel, controller )
	systemOverlayFullArenaLayout.id = "systemOverlayFullArenaLayout"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.systemOverlayFullArenaLayout:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.systemOverlayFullArenaLayout:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SystemOverlay_Full_Arena.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

