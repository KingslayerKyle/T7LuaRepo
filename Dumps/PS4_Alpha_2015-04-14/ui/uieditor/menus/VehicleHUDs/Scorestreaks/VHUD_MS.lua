require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_Internal" )

LUI.createMenu.VHUD_MS = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_MS" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local vhudmsInternal0 = CoD.vhud_ms_Internal.new( self, controller )
	vhudmsInternal0:setLeftRight( false, false, -640, 640 )
	vhudmsInternal0:setTopBottom( false, false, -360, 360 )
	vhudmsInternal0:setRGB( 1, 1, 1 )
	vhudmsInternal0:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		vhudmsInternal0:setModel( model, controller )
	end )
	self:addElement( vhudmsInternal0 )
	self.vhudmsInternal0 = vhudmsInternal0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.vhudmsInternal0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

