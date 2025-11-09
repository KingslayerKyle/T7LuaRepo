require( "ui.uieditor.widgets.button" )

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
end

LUI.createMenu.LobbyLeavePopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyLeavePopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local btnYes = CoD.button.new( self, controller )
	btnYes:setLeftRight( true, false, 495.5, 557.5 )
	btnYes:setTopBottom( true, false, 330, 360 )
	btnYes:setRGB( 1, 1, 1 )
	btnYes.buttoninternal0.Text0:setText( Engine.Localize( "YES" ) )
	btnYes:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SetResponseYes( self, controller )
		GoBack( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnYes )
	self.btnYes = btnYes
	
	local btnNo = CoD.button.new( self, controller )
	btnNo:setLeftRight( true, false, 583.5, 652.5 )
	btnNo:setTopBottom( true, false, 330, 360 )
	btnNo:setRGB( 1, 1, 1 )
	btnNo.buttoninternal0.Text0:setText( Engine.Localize( "NO" ) )
	btnNo:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SetResponseNo( self, controller )
		GoBack( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnNo )
	self.btnNo = btnNo
	
	local btnCancel = CoD.button.new( self, controller )
	btnCancel:setLeftRight( true, false, 681, 754 )
	btnCancel:setTopBottom( true, false, 330, 360 )
	btnCancel:setRGB( 1, 1, 1 )
	btnCancel.buttoninternal0.Text0:setText( Engine.Localize( "CANCEL" ) )
	btnCancel:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SetResponseCancel( self, controller )
		GoBack( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnCancel )
	self.btnCancel = btnCancel
	
	local lbLeaveWithParty = LUI.UITightText.new()
	lbLeaveWithParty:setLeftRight( true, false, 511.5, 717.5 )
	lbLeaveWithParty:setTopBottom( true, false, 266.92, 302.92 )
	lbLeaveWithParty:setRGB( 1, 1, 1 )
	lbLeaveWithParty:setText( Engine.Localize( "LEAVE WITH PARTY?" ) )
	lbLeaveWithParty:setTTF( "fonts/default.ttf" )
	self:addElement( lbLeaveWithParty )
	self.lbLeaveWithParty = lbLeaveWithParty
	
	btnYes.navigation = {
		right = btnNo
	}
	btnNo.navigation = {
		left = btnYes,
		right = btnCancel
	}
	btnCancel.navigation = {
		left = btnNo
	}
	btnYes.id = "btnYes"
	btnNo.id = "btnNo"
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
		self.btnYes:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.btnYes:close()
		self.btnNo:close()
		self.btnCancel:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

