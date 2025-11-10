require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_Internal" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.m_inputDisabled = true
end

LUI.createMenu.VHUD_MS = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_MS" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VHUD_MS.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local vhudmsInternal0 = CoD.vhud_ms_Internal.new( self, controller )
	vhudmsInternal0:setLeftRight( true, true, 0, 0 )
	vhudmsInternal0:setTopBottom( true, true, 0, 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudmsInternal0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VHUD_MS.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

