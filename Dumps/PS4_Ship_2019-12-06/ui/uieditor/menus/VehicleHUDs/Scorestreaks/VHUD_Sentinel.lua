require( "ui.uieditor.widgets.VehicleHUDs.wasp.VHUD_Sentinel_Internal" )

LUI.createMenu.VHUD_Sentinel = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_Sentinel" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VHUD_Sentinel.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local VHUDSentinelInternal = CoD.VHUD_Sentinel_Internal.new( self, controller )
	VHUDSentinelInternal:setLeftRight( true, true, 0, 0 )
	VHUDSentinelInternal:setTopBottom( true, true, 0, 0 )
	VHUDSentinelInternal:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		VHUDSentinelInternal:setModel( model, controller )
	end )
	self:addElement( VHUDSentinelInternal )
	self.VHUDSentinelInternal = VHUDSentinelInternal
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VHUDSentinelInternal:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VHUD_Sentinel.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

