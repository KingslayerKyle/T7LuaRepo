require( "ui.uieditor.widgets.button" )

function PostLoadFunc( self )
	
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
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local imgBg = LUI.UIImage.new()
	imgBg:setLeftRight( true, false, 431, 838 )
	imgBg:setTopBottom( true, false, 251.5, 416 )
	imgBg:setRGB( 1, 0, 0 )
	imgBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imgBg )
	self.imgBg = imgBg
	
	local lblPleaseWait = LUI.UITightText.new()
	lblPleaseWait:setLeftRight( true, false, 472, 570 )
	lblPleaseWait:setTopBottom( true, false, 312, 337 )
	lblPleaseWait:setRGB( 1, 1, 1 )
	lblPleaseWait:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
	lblPleaseWait:setTTF( "fonts/default.ttf" )
	self:addElement( lblPleaseWait )
	self.lblPleaseWait = lblPleaseWait
	
	local lblMessage = LUI.UITightText.new()
	lblMessage:setLeftRight( true, false, 472, 776 )
	lblMessage:setTopBottom( true, false, 264, 312 )
	lblMessage:setRGB( 1, 1, 1 )
	lblMessage:setText( Engine.Localize( "Creating Game Lobby." ) )
	lblMessage:setTTF( "fonts/default.ttf" )
	self:addElement( lblMessage )
	self.lblMessage = lblMessage
	
	local btnCancel = CoD.button.new( self, controller )
	btnCancel:setLeftRight( false, true, -504, -442 )
	btnCancel:setTopBottom( false, true, -304, -274 )
	btnCancel:setRGB( 1, 1, 1 )
	btnCancel.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CANCEL" ) )
	btnCancel:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		GoBack( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.btnCancel:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

