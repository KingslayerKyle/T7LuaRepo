require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_internal" )

LUI.createMenu.VHUD_SiegeBot = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_SiegeBot" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Siegebot"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VHUD_SiegeBot.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local vhudsiegebotinternal = CoD.vhud_siegebot_internal.new( self, controller )
	vhudsiegebotinternal:setLeftRight( true, true, 0, 0 )
	vhudsiegebotinternal:setTopBottom( true, true, 0, 0 )
	vhudsiegebotinternal:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		vhudsiegebotinternal:setModel( model, controller )
	end )
	self:addElement( vhudsiegebotinternal )
	self.vhudsiegebotinternal = vhudsiegebotinternal
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsiegebotinternal:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VHUD_SiegeBot.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

