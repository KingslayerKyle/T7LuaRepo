require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionScoresList" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardHeaderWidget" )

local UpdateWidgetSizes = function ( self )
	local team1ListHeight = self.ScoreboardFactionScoresList.Team1.height
	local team2ListHeight = self.ScoreboardFactionScoresList.Team2.height
	if not team1ListHeight or not team2ListHeight then
		return 
	end
	local factionWidget1Top = 35
	local factionWidget1Bottom = 35 + team1ListHeight - 1
	self.ScoreboardFactionWidget1:setTopBottom( true, false, factionWidget1Top, factionWidget1Bottom )
	local factionWidget2Top = factionWidget1Bottom + 5
	local factionWidget2Bottom = factionWidget2Top + team2ListHeight - 1
	self.ScoreboardFactionWidget2:setTopBottom( true, false, factionWidget2Top, factionWidget2Bottom )
	if team2ListHeight == 0 then
		self.ScoreboardFactionWidget2:close()
	end
end

local PostLoadFunc = function ( self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self.ScoreboardFactionScoresList.Team1, "updateLayout", function ( element )
		UpdateWidgetSizes( self )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self.ScoreboardFactionScoresList.Team2, "updateLayout", function ( element )
		UpdateWidgetSizes( self )
	end )
	local numTeams = Engine.GetCurrentTeamCount()
	if numTeams < 2 then
		self.ScoreboardFactionWidget2:close()
		self.ScoreboardFactionScoresList.Team2:close()
	end
end

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.ScoreboardWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardWidget )
	self.id = "ScoreboardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 980 )
	self:setTopBottom( true, false, 0, 526 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ScoreboardFactionScoresList = CoD.ScoreboardFactionScoresList.new( menu, controller )
	ScoreboardFactionScoresList:setLeftRight( true, false, 178.04, 943.04 )
	ScoreboardFactionScoresList:setTopBottom( true, false, 35, 647 )
	ScoreboardFactionScoresList:setRGB( 1, 1, 1 )
	self:addElement( ScoreboardFactionScoresList )
	self.ScoreboardFactionScoresList = ScoreboardFactionScoresList
	
	local ScoreboardFactionWidget1 = CoD.ScoreboardFactionWidget.new( menu, controller )
	ScoreboardFactionWidget1:setLeftRight( true, false, 0, 175 )
	ScoreboardFactionWidget1:setTopBottom( true, false, 35, 268 )
	ScoreboardFactionWidget1:setRGB( 1, 1, 1 )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "Scoreboard", "team1FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "Scoreboard", "team1Score", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "Scoreboard", "team1FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "Scoreboard", "team1Score", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.Score0.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreboardFactionWidget1 )
	self.ScoreboardFactionWidget1 = ScoreboardFactionWidget1
	
	local ScoreboardFactionWidget2 = CoD.ScoreboardFactionWidget.new( menu, controller )
	ScoreboardFactionWidget2:setLeftRight( true, false, 0, 175 )
	ScoreboardFactionWidget2:setTopBottom( true, false, 272, 505 )
	ScoreboardFactionWidget2:setRGB( 1, 1, 1 )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Scoreboard", "team2FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Scoreboard", "team2Score", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Scoreboard", "team2FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Scoreboard", "team2Score", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.Score0.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreboardFactionWidget2 )
	self.ScoreboardFactionWidget2 = ScoreboardFactionWidget2
	
	local ScoreboardHeaderWidget = CoD.ScoreboardHeaderWidget.new( menu, controller )
	ScoreboardHeaderWidget:setLeftRight( true, false, 0, 951 )
	ScoreboardHeaderWidget:setTopBottom( true, false, 0, 32 )
	ScoreboardHeaderWidget:setRGB( 1, 1, 1 )
	self:addElement( ScoreboardHeaderWidget )
	self.ScoreboardHeaderWidget = ScoreboardHeaderWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local ScoreboardFactionScoresListFrame2 = function ( ScoreboardFactionScoresList, event )
					local ScoreboardFactionScoresListFrame3 = function ( ScoreboardFactionScoresList, event )
						if not event.interrupted then
							ScoreboardFactionScoresList:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						ScoreboardFactionScoresList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ScoreboardFactionScoresList, event )
						else
							ScoreboardFactionScoresList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreboardFactionScoresListFrame3( ScoreboardFactionScoresList, event )
						return 
					else
						ScoreboardFactionScoresList:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						ScoreboardFactionScoresList:registerEventHandler( "transition_complete_keyframe", ScoreboardFactionScoresListFrame3 )
					end
				end
				
				ScoreboardFactionScoresList:completeAnimation()
				self.ScoreboardFactionScoresList:setAlpha( 0 )
				ScoreboardFactionScoresListFrame2( ScoreboardFactionScoresList, {} )
				local ScoreboardFactionWidget1Frame2 = function ( ScoreboardFactionWidget1, event )
					local ScoreboardFactionWidget1Frame3 = function ( ScoreboardFactionWidget1, event )
						if not event.interrupted then
							ScoreboardFactionWidget1:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						ScoreboardFactionWidget1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ScoreboardFactionWidget1, event )
						else
							ScoreboardFactionWidget1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreboardFactionWidget1Frame3( ScoreboardFactionWidget1, event )
						return 
					else
						ScoreboardFactionWidget1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ScoreboardFactionWidget1:registerEventHandler( "transition_complete_keyframe", ScoreboardFactionWidget1Frame3 )
					end
				end
				
				ScoreboardFactionWidget1:completeAnimation()
				self.ScoreboardFactionWidget1:setAlpha( 0 )
				ScoreboardFactionWidget1Frame2( ScoreboardFactionWidget1, {} )
				local ScoreboardFactionWidget2Frame2 = function ( ScoreboardFactionWidget2, event )
					local ScoreboardFactionWidget2Frame3 = function ( ScoreboardFactionWidget2, event )
						if not event.interrupted then
							ScoreboardFactionWidget2:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Bounce )
						end
						ScoreboardFactionWidget2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ScoreboardFactionWidget2, event )
						else
							ScoreboardFactionWidget2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreboardFactionWidget2Frame3( ScoreboardFactionWidget2, event )
						return 
					else
						ScoreboardFactionWidget2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						ScoreboardFactionWidget2:registerEventHandler( "transition_complete_keyframe", ScoreboardFactionWidget2Frame3 )
					end
				end
				
				ScoreboardFactionWidget2:completeAnimation()
				self.ScoreboardFactionWidget2:setAlpha( 0 )
				ScoreboardFactionWidget2Frame2( ScoreboardFactionWidget2, {} )
				local ScoreboardHeaderWidgetFrame2 = function ( ScoreboardHeaderWidget, event )
					if not event.interrupted then
						ScoreboardHeaderWidget:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
					end
					ScoreboardHeaderWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ScoreboardHeaderWidget, event )
					else
						ScoreboardHeaderWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreboardHeaderWidget:completeAnimation()
				self.ScoreboardHeaderWidget:setAlpha( 0 )
				ScoreboardHeaderWidgetFrame2( ScoreboardHeaderWidget, {} )
			end
		}
	}
	ScoreboardFactionScoresList.id = "ScoreboardFactionScoresList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardFactionScoresList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.ScoreboardFactionScoresList:close()
		self.ScoreboardFactionWidget1:close()
		self.ScoreboardFactionWidget2:close()
		self.ScoreboardHeaderWidget:close()
		CoD.ScoreboardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

