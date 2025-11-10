require( "T6.HUD.gametypes.GametypeBase" )

LUI.createMenu.gametype_hvt = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "gametype_hvt" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "gametype_hvt.buttonPrompts" )
	local f1_local1 = self
	
	local gametype_hvt_objective_layer = CoD.GametypeBase.new( "gametype_hvt_objective_layer", controller )
	self:addElement( gametype_hvt_objective_layer )
	self.gametype_hvt_objective_layer = gametype_hvt_objective_layer
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "gametype_hvt.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

