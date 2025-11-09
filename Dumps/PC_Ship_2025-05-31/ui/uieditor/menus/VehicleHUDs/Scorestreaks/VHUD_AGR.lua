require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_internal" )

LUI.createMenu.VHUD_AGR = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_AGR" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VHUD_AGR.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local vhudagrinternal0 = CoD.vhud_agr_internal.new( self, controller )
	vhudagrinternal0:setLeftRight( true, true, 0, 0 )
	vhudagrinternal0:setTopBottom( true, true, 0, 0 )
	vhudagrinternal0:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		vhudagrinternal0:setModel( model, controller )
	end )
	self:addElement( vhudagrinternal0 )
	self.vhudagrinternal0 = vhudagrinternal0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudagrinternal0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VHUD_AGR.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

