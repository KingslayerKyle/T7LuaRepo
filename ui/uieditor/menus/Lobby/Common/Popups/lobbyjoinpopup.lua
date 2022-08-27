-- f6022a2f14bfb391ef7e9d871a224bba
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.buttonprompt" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.disableDarkenElement = true
end

LUI.createMenu.LobbyJoinPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyJoinPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyJoinPopup.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local lblTitle = LUI.UIText.new()
	lblTitle:setLeftRight( true, false, 515, 765 )
	lblTitle:setTopBottom( true, false, 312, 360 )
	lblTitle:setText( Engine.Localize( "Error" ) )
	lblTitle:setTTF( "fonts/default.ttf" )
	lblTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lblTitle )
	self.lblTitle = lblTitle
	
	local txtMessage = LUI.UIText.new()
	txtMessage:setLeftRight( true, false, 515, 765 )
	txtMessage:setTopBottom( true, false, 360, 385 )
	txtMessage:setText( Engine.Localize( "Unable to join session in progress" ) )
	txtMessage:setTTF( "fonts/default.ttf" )
	txtMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtMessage )
	self.txtMessage = txtMessage
	
	local btnpromptOk = CoD.buttonprompt.new( f2_local1, controller )
	btnpromptOk:setLeftRight( true, false, 780.45, 855.45 )
	btnpromptOk:setTopBottom( true, false, 473.4, 504.4 )
	btnpromptOk.label:setText( Engine.Localize( "OK" ) )
	self:addElement( btnpromptOk )
	self.btnpromptOk = btnpromptOk
	
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		GoBack( self, f3_arg2 )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_OK_CAPS" )
		return true
	end, false )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.btnpromptOk:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyJoinPopup.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

