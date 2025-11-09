require( "ui.uieditor.widgets.Leaderboard.Leaderboard" )

LUI.createMenu.FRLeaderboard = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FRLeaderboard" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FRLeaderboard.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Leaderboard = CoD.Leaderboard.new( self, controller )
	Leaderboard:setLeftRight( true, false, 226.5, 1006.5 )
	Leaderboard:setTopBottom( true, false, 142.5, 533.5 )
	self:addElement( Leaderboard )
	self.Leaderboard = Leaderboard
	
	Leaderboard.id = "Leaderboard"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Leaderboard:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Leaderboard:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FRLeaderboard.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

