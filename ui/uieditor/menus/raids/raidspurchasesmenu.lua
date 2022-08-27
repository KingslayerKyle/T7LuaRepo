-- 52345ac8ea67ef6988847de67485cc55
-- This hash is used for caching, delete to decompile the file again

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
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local RaidsPurchases0 = CoD.RaidsPurchases.new( f2_local1, controller )
	RaidsPurchases0:setLeftRight( false, true, -493.88, -136.88 )
	RaidsPurchases0:setTopBottom( true, false, 130, 630 )
	self:addElement( RaidsPurchases0 )
	self.RaidsPurchases0 = RaidsPurchases0
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		LockInput( self, controller, true )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESC", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		CancelRaidPurchase( self, f4_arg0, f4_arg2 )
		GoBack( self, f4_arg2 )
		PlaySoundSetSound( self, "cancel_purchase" )
		LockInput( self, f4_arg2, false )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	RaidsPurchases0.id = "RaidsPurchases0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
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

