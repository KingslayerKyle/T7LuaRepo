require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.baseHealthWidget" )
require( "T6.HUD.gametypes.GametypeBase" )

LUI.createMenu.gametype_raid = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "gametype_raid" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "gametype_raid.buttonPrompts" )
	local menu = self
	
	local gametype_raid_objective_layer = CoD.GametypeBase.new( "gametype_raid_objective_layer", controller )
	self:addElement( gametype_raid_objective_layer )
	self.gametype_raid_objective_layer = gametype_raid_objective_layer
	
	self.anyChildUsesUpdateState = true
	
	local baseHealthWidget = CoD.baseHealthWidget.new( menu, controller )
	baseHealthWidget:setLeftRight( true, false, 15, 280 )
	baseHealthWidget:setTopBottom( true, false, 187, 217 )
	self:addElement( baseHealthWidget )
	self.baseHealthWidget = baseHealthWidget
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.baseHealthWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "gametype_raid.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

