require( "ui.uieditor.widgets.MPHudWidgets.FactionIcon" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.HUD.RoundStatus" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.HUD.WinningStatus" )

CoD.ScoreProgress = InheritFrom( LUI.UIElement )
CoD.ScoreProgress.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ScoreProgress )
	self.id = "ScoreProgress"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 175 )
	self.anyChildUsesUpdateState = true
	
	local backgroundBlend = LUI.UIImage.new()
	backgroundBlend:setLeftRight( true, false, 25, 325 )
	backgroundBlend:setTopBottom( false, true, -172, -22 )
	backgroundBlend:setRGB( 1, 1, 1 )
	backgroundBlend:setImage( RegisterImage( "uie_hud_mp_vis_left_lower_back" ) )
	backgroundBlend:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backgroundBlend )
	self.backgroundBlend = backgroundBlend
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 300 )
	background:setTopBottom( false, true, -150, 0 )
	background:setRGB( 1, 1, 1 )
	background:setImage( RegisterImage( "uie_hud_mp_vis_left_lower" ) )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( background )
	self.background = background
	
	local factionIcon = CoD.FactionIcon.new( menu, controller )
	factionIcon:setLeftRight( true, false, 45, 141 )
	factionIcon:setTopBottom( false, true, -113.5, -17.5 )
	factionIcon:setRGB( 1, 1, 1 )
	self:addElement( factionIcon )
	self.factionIcon = factionIcon
	
	local yourScore = LUI.UITightText.new()
	yourScore:setLeftRight( true, false, 161, 205 )
	yourScore:setTopBottom( true, false, 84, 114 )
	yourScore:setRGB( 1, 1, 1 )
	yourScore:setText( Engine.Localize( "MENU_NEW" ) )
	yourScore:setTTF( "fonts/default.ttf" )
	self:addElement( yourScore )
	self.yourScore = yourScore
	
	local enemyScore = LUI.UITightText.new()
	enemyScore:setLeftRight( true, false, 161, 206 )
	enemyScore:setTopBottom( true, false, 117, 147 )
	enemyScore:setRGB( 1, 1, 1 )
	enemyScore:setTTF( "fonts/default.ttf" )
	enemyScore:subscribeToGlobalModel( controller, "GameScore", "enemyScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			enemyScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( enemyScore )
	self.enemyScore = enemyScore
	
	local roundStatus = CoD.RoundStatus.new( menu, controller )
	roundStatus:setLeftRight( true, false, 29, 268 )
	roundStatus:setTopBottom( true, false, 30, 54 )
	roundStatus:setRGB( 1, 1, 1 )
	roundStatus:mergeStateConditions( {
		{
			stateName = "NoRoundLimit",
			condition = function ( menu, element, event )
				local f3_local0
				if not HasRoundLimit( controller ) then
					f3_local0 = IsSingleRound( controller )
				else
					f3_local0 = false
				end
				return f3_local0
			end
		},
		{
			stateName = "RoundLimit",
			condition = function ( menu, element, event )
				return HasRoundLimit( controller ) and not IsSingleRound( controller )
			end
		}
	} )
	self:addElement( roundStatus )
	self.roundStatus = roundStatus
	
	local winningStatus = CoD.WinningStatus.new( menu, controller )
	winningStatus:setLeftRight( true, false, 85, 309 )
	winningStatus:setTopBottom( false, true, -121, -96 )
	winningStatus:setRGB( 1, 1, 1 )
	winningStatus:mergeStateConditions( {
		{
			stateName = "Winning",
			condition = function ( menu, element, event )
				return IsYourTeamWinning( controller )
			end
		},
		{
			stateName = "Losing",
			condition = function ( menu, element, event )
				return IsYourTeamLosing( controller )
			end
		},
		{
			stateName = "Overtime",
			condition = function ( menu, element, event )
				return IsInOvertime( controller )
			end
		}
	} )
	if winningStatus.m_eventHandlers.hud_update_scores then
		local currentEv = winningStatus.m_eventHandlers.hud_update_scores
		winningStatus:registerEventHandler( "hud_update_scores", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		winningStatus:registerEventHandler( "hud_update_scores", LUI.UIElement.updateState )
	end
	if winningStatus.m_eventHandlers.hud_update_team_change then
		local currentEv = winningStatus.m_eventHandlers.hud_update_team_change
		winningStatus:registerEventHandler( "hud_update_team_change", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		winningStatus:registerEventHandler( "hud_update_team_change", LUI.UIElement.updateState )
	end
	if winningStatus.m_eventHandlers.hud_update_refresh then
		local currentEv = winningStatus.m_eventHandlers.hud_update_refresh
		winningStatus:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		winningStatus:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	self:addElement( winningStatus )
	self.winningStatus = winningStatus
	
	local currentEv = LUI.UITightText.new()
	currentEv:setLeftRight( true, false, 34, 85 )
	currentEv:setTopBottom( false, true, -121, -96 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:setTTF( "fonts/default.ttf" )
	currentEv:subscribeToGlobalModel( controller, "GameScore", "gameTimeEnd", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv:setupEndTimer( modelValue )
		end
	end )
	self:addElement( currentEv )
	self.endTimer = currentEv
	
	self.close = function ( self )
		self.factionIcon:close()
		self.roundStatus:close()
		self.winningStatus:close()
		self.enemyScore:close()
		self.endTimer:close()
		CoD.ScoreProgress.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

