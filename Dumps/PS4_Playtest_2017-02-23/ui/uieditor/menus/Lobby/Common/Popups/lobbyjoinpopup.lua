require( "ui.uieditor.widgets.buttonprompt" )

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
end

LUI.createMenu.LobbyJoinPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyJoinPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyJoinPopup.buttonPrompts" )
	local menu = self
	
	local lblTitle = LUI.UIText.new()
	lblTitle:setLeftRight( 0, 0, 772, 1147 )
	lblTitle:setTopBottom( 0, 0, 468, 540 )
	lblTitle:setText( Engine.Localize( "Error" ) )
	lblTitle:setTTF( "fonts/default.ttf" )
	lblTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lblTitle )
	self.lblTitle = lblTitle
	
	local txtMessage = LUI.UIText.new()
	txtMessage:setLeftRight( 0, 0, 772, 1147 )
	txtMessage:setTopBottom( 0, 0, 540, 578 )
	txtMessage:setText( Engine.Localize( "Unable to join session in progress" ) )
	txtMessage:setTTF( "fonts/default.ttf" )
	txtMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtMessage )
	self.txtMessage = txtMessage
	
	local btnpromptOk = CoD.buttonprompt.new( menu, controller )
	btnpromptOk:setLeftRight( 0, 0, 1171, 1283 )
	btnpromptOk:setTopBottom( 0, 0, 710, 756 )
	btnpromptOk.label:setText( Engine.Localize( "OK" ) )
	self:addElement( btnpromptOk )
	self.btnpromptOk = btnpromptOk
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_OK_CAPS", nil )
		return true
	end, false )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.btnpromptOk:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyJoinPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

