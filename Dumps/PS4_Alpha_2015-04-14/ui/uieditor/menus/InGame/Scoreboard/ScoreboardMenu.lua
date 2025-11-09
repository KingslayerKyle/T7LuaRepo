require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidget" )

local PostLoadFunc = function ( self, controller )
	local numClients = 6
	local teamCount = Engine.GetCurrentTeamCount()
	if teamCount > 1 then
		numClients = math.max( Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES ), Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_AXIS ) )
	end
	if 6 < numClients then
		self.ScoreboardWidget:setTopBottom( true, false, 41, 684 )
	end
end

LUI.createMenu.ScoreboardMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ScoreboardMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local ScoreboardWidget = CoD.ScoreboardWidget.new( self, controller )
	ScoreboardWidget:setLeftRight( true, false, 148.5, 1131.5 )
	ScoreboardWidget:setTopBottom( true, false, 126, 769 )
	ScoreboardWidget:setRGB( 1, 1, 1 )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	ScoreboardWidget.id = "ScoreboardWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ScoreboardWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.ScoreboardWidget:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

