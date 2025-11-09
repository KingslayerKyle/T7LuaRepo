require( "ui.uieditor.widgets.ConfirmationDialog" )

LUI.createMenu.ConfirmQuitGame = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ConfirmQuitGame" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ConfirmQuitGame.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ConfirmationDialog = CoD.ConfirmationDialog.new( self, controller )
	ConfirmationDialog:setLeftRight( true, false, 313, 967 )
	ConfirmationDialog:setTopBottom( true, false, 179.5, 540.5 )
	ConfirmationDialog.Title:setText( Engine.Localize( "MPUI_END_GAME1" ) )
	ConfirmationDialog.TextBox0:setText( Engine.Localize( "" ) )
	ConfirmationDialog.Resume.buttoninternal0.Text0:setText( Engine.Localize( "MENU_NO" ) )
	ConfirmationDialog.Restart.buttoninternal0.Text0:setText( Engine.Localize( "MENU_YES" ) )
	self:addElement( ConfirmationDialog )
	self.ConfirmationDialog = ConfirmationDialog
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESC", function ( element, menu, controller, model )
		SetResponseNo( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_RESUMEGAME_CAPS" )
		return true
	end, false )
	ConfirmationDialog.id = "ConfirmationDialog"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ConfirmationDialog:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ConfirmationDialog:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ConfirmQuitGame.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

