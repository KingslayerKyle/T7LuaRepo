require( "ui.uieditor.widgets.Scoreboard.ScoreboardRowWidget" )

CoD.ScoreboardFactionScoresList = InheritFrom( LUI.UIElement )
CoD.ScoreboardFactionScoresList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 4
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardFactionScoresList )
	self.id = "ScoreboardFactionScoresList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 801 )
	self:setTopBottom( true, false, 0, 468 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Team1 = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, true )
	Team1:makeFocusable()
	Team1:setLeftRight( true, false, 0, 802 )
	Team1:setTopBottom( true, false, 0, 233 )
	Team1:setRGB( 1, 1, 1 )
	Team1:setDataSource( "ScoreboardTeam1List" )
	Team1:setWidgetType( CoD.ScoreboardRowWidget )
	Team1:setVerticalCount( 9 )
	Team1:setSpacing( 1 )
	self:addElement( Team1 )
	self.Team1 = Team1
	
	local Team2 = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, true )
	Team2:makeFocusable()
	Team2:setLeftRight( true, false, 0, 802 )
	Team2:setTopBottom( true, false, 237, 470 )
	Team2:setRGB( 1, 1, 1 )
	Team2:setDataSource( "ScoreboardTeam2List" )
	Team2:setWidgetType( CoD.ScoreboardRowWidget )
	Team2:setVerticalCount( 9 )
	Team2:setSpacing( 1 )
	self:addElement( Team2 )
	self.Team2 = Team2
	
	Team1.navigation = {
		down = Team2
	}
	Team2.navigation = {
		up = Team1
	}
	Team1.id = "Team1"
	Team2.id = "Team2"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Team1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.Team1:close()
		self.Team2:close()
		CoD.ScoreboardFactionScoresList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

