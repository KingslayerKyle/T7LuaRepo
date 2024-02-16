-- 73dd3c764ddcec11104cc2063060c02d
-- This hash is used for caching, delete to decompile the file again

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
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local VHUDSentinelInternal = CoD.VHUD_Sentinel_Internal.new( f1_local1, controller )
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
		menu = f1_local1
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

