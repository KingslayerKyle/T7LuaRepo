require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )

LUI.createMenu.CPResumeGameFlyout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPResumeGameFlyout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local ResumeInSafehouseBtn = CoD.List1ButtonLarge_PH.new( self, controller )
	ResumeInSafehouseBtn:setLeftRight( true, false, 243.43, 565.43 )
	ResumeInSafehouseBtn:setTopBottom( true, false, 179, 211 )
	ResumeInSafehouseBtn:setRGB( 1, 1, 1 )
	ResumeInSafehouseBtn:setYRot( 25 )
	ResumeInSafehouseBtn.btnDisplayText:setText( Engine.Localize( "MENU_RESUME_FROM_SAFEHOUSE_CAPS" ) )
	ResumeInSafehouseBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RESUME_FROM_SAFEHOUSE_CAPS" ) )
	ResumeInSafehouseBtn:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ResumeFromSafehouse( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ResumeInSafehouseBtn )
	self.ResumeInSafehouseBtn = ResumeInSafehouseBtn
	
	local ResumeFromCheckpointBtn = CoD.List1ButtonLarge_PH.new( self, controller )
	ResumeFromCheckpointBtn:setLeftRight( true, false, 243.43, 565.43 )
	ResumeFromCheckpointBtn:setTopBottom( true, false, 151, 183 )
	ResumeFromCheckpointBtn:setRGB( 1, 1, 1 )
	ResumeFromCheckpointBtn:setYRot( 25 )
	ResumeFromCheckpointBtn.btnDisplayText:setText( Engine.Localize( "MENU_RESUME_FROM_CHECKPOINT_CAPS" ) )
	ResumeFromCheckpointBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RESUME_FROM_CHECKPOINT_CAPS" ) )
	ResumeFromCheckpointBtn:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ResumeFromCheckpoint( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ResumeFromCheckpointBtn )
	self.ResumeFromCheckpointBtn = ResumeFromCheckpointBtn
	
	ResumeInSafehouseBtn.navigation = {
		up = ResumeFromCheckpointBtn,
		right = ResumeFromCheckpointBtn
	}
	ResumeFromCheckpointBtn.navigation = {
		right = ResumeInSafehouseBtn,
		down = ResumeInSafehouseBtn
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ResumeInSafehouseBtn.id = "ResumeInSafehouseBtn"
	ResumeFromCheckpointBtn.id = "ResumeFromCheckpointBtn"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ResumeFromCheckpointBtn:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.ResumeInSafehouseBtn:close()
		self.ResumeFromCheckpointBtn:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

