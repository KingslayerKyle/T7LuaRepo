require( "ui.uieditor.widgets.Raids.RaidsPurchases" )

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
end

LUI.createMenu.RaidsPurchasesMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "RaidsPurchasesMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "RaidsPurchases"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local RaidsPurchases0 = CoD.RaidsPurchases.new( self, controller )
	RaidsPurchases0:setLeftRight( false, true, -493.88, -136.88 )
	RaidsPurchases0:setTopBottom( true, false, 130, 630 )
	RaidsPurchases0:setRGB( 1, 1, 1 )
	self:addElement( RaidsPurchases0 )
	self.RaidsPurchases0 = RaidsPurchases0
	
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
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESC") then
			CancelRaidPurchase( self, element, controller )
			GoBack( self, controller )
			PlaySoundSetSound( self, "cancel_purchase" )
			LockInput( self, controller, false )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		LockInput( self, controller, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	RaidsPurchases0.id = "RaidsPurchases0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.RaidsPurchases0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.RaidsPurchases0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

