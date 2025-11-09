require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolHUD_Internal" )

LUI.createMenu.VehicleHUD_VTOL = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VehicleHUD_VTOL" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.vtolHUD_Internal.new( self, controller )
	internal:setLeftRight( false, false, -432, 432 )
	internal:setTopBottom( false, true, -324, -36 )
	internal:setRGB( 1, 1, 1 )
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
		controller = controller,
		menu = self
	} )
	self.close = function ( self )
		self.internal:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

