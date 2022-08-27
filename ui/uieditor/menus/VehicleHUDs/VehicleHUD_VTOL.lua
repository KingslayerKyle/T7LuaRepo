-- 1a4f04faaa271d1130d04e4775c485bb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolHUD_Internal" )

local PreLoadFunc = function ( self, controller )
	
end

LUI.createMenu.VehicleHUD_VTOL = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VehicleHUD_VTOL" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VehicleHUD_VTOL.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.vtolHUD_Internal.new( f2_local1, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	internal:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		internal:setModel( model, controller )
	end )
	self:addElement( internal )
	self.internal = internal
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VehicleHUD_VTOL.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

