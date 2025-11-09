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
	self.anyChildUsesUpdateState = true
	
	local systemOverlayFullArenaLayout = CoD.systemOverlay_Full_Arena_Layout.new( self, controller )
	systemOverlayFullArenaLayout:setLeftRight( true, true, 0, 0 )
	systemOverlayFullArenaLayout:setTopBottom( true, true, 0, 0 )
	systemOverlayFullArenaLayout:linkToElementModel( self, nil, false, function ( model )
		systemOverlayFullArenaLayout:setModel( model, controller )
	end )
	self:addElement( systemOverlayFullArenaLayout )
	self.systemOverlayFullArenaLayout = systemOverlayFullArenaLayout
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasOverlayContinueAction( menu ) then
			PerformOverlayContinue( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasOverlayContinueAction( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if HasOverlayBackAction( menu ) then
			PerformOverlayBack( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasOverlayBackAction( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
	systemOverlayFullArenaLayout.buttons:setModel( self.buttonModel, controller )
	systemOverlayFullArenaLayout.id = "systemOverlayFullArenaLayout"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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

