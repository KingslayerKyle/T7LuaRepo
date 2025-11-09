require( "ui.uieditor.widgets.VehicleHUDs.dpsHUD_Internal" )

LUI.createMenu.VehicleHUD_DPS = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VehicleHUD_DPS" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.dpsHUD_Internal.new( self, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
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

