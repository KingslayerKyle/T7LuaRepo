require( "T6.HUD.gametypes.GametypeBase" )

LUI.hudMenuType.gametype_tdm = "hud"
LUI.createMenu.gametype_tdm = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "gametype_tdm" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local gametype_tdm_objective_layer = CoD.GametypeBase.new( "gametype_tdm_objective_layer", controller )
	self:addElement( gametype_tdm_objective_layer )
	self.gametype_tdm_objective_layer = gametype_tdm_objective_layer
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

