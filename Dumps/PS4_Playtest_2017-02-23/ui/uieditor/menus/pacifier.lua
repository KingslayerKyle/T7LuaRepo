require( "ui.uieditor.widgets.button" )

LUI.createMenu.Pacifier = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Pacifier" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pacifier.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local imgBg = LUI.UIImage.new()
	imgBg:setLeftRight( 0, 0, 647, 1257 )
	imgBg:setTopBottom( 0, 0, 377, 624 )
	imgBg:setRGB( 1, 0, 0 )
	self:addElement( imgBg )
	self.imgBg = imgBg
	
	local lblPleaseWait = LUI.UITightText.new()
	lblPleaseWait:setLeftRight( 0, 0, 708, 855 )
	lblPleaseWait:setTopBottom( 0, 0, 468, 506 )
	lblPleaseWait:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
	lblPleaseWait:setTTF( "fonts/default.ttf" )
	self:addElement( lblPleaseWait )
	self.lblPleaseWait = lblPleaseWait
	
	local lblMessage = LUI.UITightText.new()
	lblMessage:setLeftRight( 0, 0, 708, 1164 )
	lblMessage:setTopBottom( 0, 0, 396, 468 )
	lblMessage:setText( Engine.Localize( "Creating Game Lobby." ) )
	lblMessage:setTTF( "fonts/default.ttf" )
	self:addElement( lblMessage )
	self.lblMessage = lblMessage
	
	local btnCancel = CoD.button.new( self, controller )
	btnCancel:setLeftRight( 1, 1, -756, -663 )
	btnCancel:setTopBottom( 1, 1, -456.5, -411.5 )
	btnCancel.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CANCEL" ) )
	btnCancel:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	btnCancel:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( btnCancel, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( btnCancel )
	self.btnCancel = btnCancel
	
	self:registerEventHandler( "pacifier_set_message", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.btnCancel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pacifier.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

