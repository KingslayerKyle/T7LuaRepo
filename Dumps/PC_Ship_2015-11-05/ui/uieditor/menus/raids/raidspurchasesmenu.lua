require( "ui.uieditor.widgets.Raids.RaidsPurchases" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.disableDarkenElement = true
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RaidsPurchasesMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local RaidsPurchases0 = CoD.RaidsPurchases.new( self, controller )
	RaidsPurchases0:setLeftRight( false, true, -493.88, -136.88 )
	RaidsPurchases0:setTopBottom( true, false, 130, 630 )
	self:addElement( RaidsPurchases0 )
	self.RaidsPurchases0 = RaidsPurchases0
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f3_local0 = nil
		LockInput( self, controller, true )
		if not f3_local0 then
			f3_local0 = self:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESC", function ( element, menu, controller, model )
		CancelRaidPurchase( self, element, controller )
		GoBack( self, controller )
		PlaySoundSetSound( self, "cancel_purchase" )
		LockInput( self, controller, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RaidsPurchases0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "RaidsPurchasesMenu.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

