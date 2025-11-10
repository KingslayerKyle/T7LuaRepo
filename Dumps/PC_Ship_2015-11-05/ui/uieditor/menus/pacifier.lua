require( "ui.uieditor.widgets.button" )

function PostLoadFunc( f1_arg0 )
	
end

LUI.createMenu.Pacifier = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Pacifier" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pacifier.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local imgBg = LUI.UIImage.new()
	imgBg:setLeftRight( true, false, 431, 838 )
	imgBg:setTopBottom( true, false, 251.5, 416 )
	imgBg:setRGB( 1, 0, 0 )
	self:addElement( imgBg )
	self.imgBg = imgBg
	
	local lblPleaseWait = LUI.UITightText.new()
	lblPleaseWait:setLeftRight( true, false, 472, 570 )
	lblPleaseWait:setTopBottom( true, false, 312, 337 )
	lblPleaseWait:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
	lblPleaseWait:setTTF( "fonts/default.ttf" )
	self:addElement( lblPleaseWait )
	self.lblPleaseWait = lblPleaseWait
	
	local lblMessage = LUI.UITightText.new()
	lblMessage:setLeftRight( true, false, 472, 776 )
	lblMessage:setTopBottom( true, false, 264, 312 )
	lblMessage:setText( Engine.Localize( "Creating Game Lobby." ) )
	lblMessage:setTTF( "fonts/default.ttf" )
	self:addElement( lblMessage )
	self.lblMessage = lblMessage
	
	local btnCancel = CoD.button.new( self, controller )
	btnCancel:setLeftRight( false, true, -504, -442 )
	btnCancel:setTopBottom( false, true, -304, -274 )
	btnCancel.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CANCEL" ) )
	btnCancel:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	btnCancel:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( btnCancel, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( btnCancel )
	self.btnCancel = btnCancel
	
	self:registerEventHandler( "pacifier_set_message", function ( self, event )
		local f7_local0 = nil
		if not f7_local0 then
			f7_local0 = self:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	btnCancel.id = "btnCancel"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.btnCancel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.btnCancel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pacifier.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

