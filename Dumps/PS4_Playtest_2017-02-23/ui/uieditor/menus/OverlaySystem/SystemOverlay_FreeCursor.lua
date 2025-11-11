require( "ui.uieditor.widgets.emptyFocusable" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_FreeCursor_Layout" )

LUI.createMenu.SystemOverlay_FreeCursor = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SystemOverlay_FreeCursor" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SystemOverlay_FreeCursor.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local layout = CoD.systemOverlay_FreeCursor_Layout.new( self, controller )
	layout:setLeftRight( 0, 1, 0, 0 )
	layout:setTopBottom( 0, 1, 0, 0 )
	layout:setAlpha( 0.99 )
	layout:linkToElementModel( self, nil, false, function ( model )
		layout:setModel( model, controller )
	end )
	self:addElement( layout )
	self.layout = layout
	
	local emptyFocusable = CoD.emptyFocusable.new( self, controller )
	emptyFocusable:setLeftRight( 0, 1, 0, 0 )
	emptyFocusable:setTopBottom( 0, 1, 0, 0 )
	self:addElement( emptyFocusable )
	self.emptyFocusable = emptyFocusable
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
			CoD.OverlayUtility.PerformOverlayACrossAction( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "$(overlayLabel)", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
			CoD.OverlayUtility.PerformOverlayBCircleAction( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "$(overlayLabel)", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "A", function ( element, menu, controller, model )
		if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
			CoD.OverlayUtility.PerformOverlayXSquareAction( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "$(overlayLabel)", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( element, menu, controller, model )
		if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
			CoD.OverlayUtility.PerformOverlayYTriangleAction( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "$(overlayLabel)", nil )
			return true
		else
			return false
		end
	end, false )
	layout.buttons:setModel( self.buttonModel, controller )
	layout.id = "layout"
	emptyFocusable.id = "emptyFocusable"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.layout:close()
		self.emptyFocusable:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SystemOverlay_FreeCursor.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

