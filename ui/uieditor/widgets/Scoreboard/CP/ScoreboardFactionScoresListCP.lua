-- 49c072ce3974ec1b396a0fe05d243b2e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardRowWidgetCP" )

CoD.ScoreboardFactionScoresListCP = InheritFrom( LUI.UIElement )
CoD.ScoreboardFactionScoresListCP.new = function ( menu, controller )
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
	self:setClass( CoD.ScoreboardFactionScoresListCP )
	self.id = "ScoreboardFactionScoresListCP"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 801 )
	self:setTopBottom( true, false, 0, 468 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Team1 = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, false )
	Team1:makeFocusable()
	Team1:setLeftRight( true, false, 0, 853 )
	Team1:setTopBottom( true, false, 0, 233 )
	Team1:setDataSource( "ScoreboardTeam1ListCP" )
	Team1:setWidgetType( CoD.ScoreboardRowWidgetCP )
	Team1:setVerticalCount( 9 )
	Team1:setSpacing( 1 )
	self:addElement( Team1 )
	self.Team1 = Team1
	
	Team1.id = "Team1"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Team1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Team1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

