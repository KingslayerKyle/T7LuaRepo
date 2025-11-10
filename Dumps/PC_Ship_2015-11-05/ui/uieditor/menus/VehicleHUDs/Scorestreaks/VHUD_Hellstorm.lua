require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_hellstorm_internal" )

LUI.createMenu.VHUD_Hellstorm = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_Hellstorm" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VHUD_Hellstorm.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local vhudhellstorminternal0 = CoD.vhud_hellstorm_internal.new( self, controller )
	vhudhellstorminternal0:setLeftRight( true, true, 0, 0 )
	vhudhellstorminternal0:setTopBottom( true, true, 0, 0 )
	vhudhellstorminternal0:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		vhudhellstorminternal0:setModel( model, controller )
	end )
	self:addElement( vhudhellstorminternal0 )
	self.vhudhellstorminternal0 = vhudhellstorminternal0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudhellstorminternal0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VHUD_Hellstorm.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

