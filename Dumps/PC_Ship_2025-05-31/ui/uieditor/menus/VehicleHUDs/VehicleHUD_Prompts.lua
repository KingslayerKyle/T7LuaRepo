require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HelpContainer" )

LUI.createMenu.VehicleHUD_Prompts = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VehicleHUD_Prompts" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VehicleHUD_Prompts.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local helpContainer = CoD.VehicleGround_HelpContainer.new( self, controller )
	helpContainer:setLeftRight( true, true, 0, 0 )
	helpContainer:setTopBottom( true, true, 0, 0 )
	helpContainer:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		helpContainer:setModel( model, controller )
	end )
	self:addElement( helpContainer )
	self.helpContainer = helpContainer
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.helpContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VehicleHUD_Prompts.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

