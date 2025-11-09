CoD.ScorePopup = {}
CoD.ScorePopup.ScoreFontName = "Condensed"
CoD.ScorePopup.ScoreTextHeight = CoD.textSize[CoD.ScorePopup.ScoreFontName]
CoD.ScorePopup.ScoreTextTop = -75
CoD.ScorePopup.DisplayTime = 1000
CoD.ScorePopup.StreakPauseTime = 500
CoD.ScorePopup.StreakMoveTime = 250
CoD.ScorePopup.StreakFadeTime = 200
CoD.ScorePopup.FlyingLeftOffSetStart = 30
CoD.ScorePopup.FlyingTopOffSetStart = -30
CoD.ScorePopup.FlyingAnimFrame = 0
CoD.ScorePopup.FlyingDuration = 800
CoD.ScorePopup.FlyingLeftAnimValues = {
	10,
	40,
	20,
	50,
	10,
	30,
	20,
	40,
	30,
	50
}
CoD.ScorePopup.FlyingTopAnimValues = {
	-60,
	-35,
	-50,
	-25,
	-60,
	-42,
	-50,
	-35,
	-42,
	-25
}
CoD.ScorePopup.new = function ( defaultAnimationState, controller )
	local self = CoD.SplitscreenScaler.new( defaultAnimationState, CoD.SplitscreenMultiplier )
	self:registerAnimationState( "hide", {
		alphaMultiplier = 0
	} )
	self:registerAnimationState( "show", {
		alphaMultiplier = 1
	} )
	self:animateToState( "hide" )
	self:setUseGameTime( true )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	
	local safeArea = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -safeAreaWidth / 2,
		right = safeAreaWidth / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -safeAreaHeight / 2,
		bottom = safeAreaHeight / 2
	} )
	self:addElement( safeArea )
	self.safeArea = safeArea
	
	local scoreFeedOffset = 220
	local scoreFeedWidth = 200
	local scoreFeedTopOffset = CoD.ScorePopup.ScoreTextTop + 30
	
	local scoreFeed = CoD.ScoreFeed.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -scoreFeedWidth + scoreFeedOffset,
		right = scoreFeedOffset,
		topAnchor = false,
		bottomAnchor = false,
		top = scoreFeedTopOffset,
		bottom = scoreFeedTopOffset - CoD.ScoreFeed.Height
	} )
	safeArea:addElement( scoreFeed )
	self.scoreFeed = scoreFeed
	
	scoreFeed.ScoreCount = 0
	self:registerEventHandler( "score_event", CoD.ScorePopup.Score )
	self:registerEventHandler( "streak_to_dpad", CoD.ScorePopup.StreakToDPad )
	self:registerEventHandler( "demo_jump", CoD.ScorePopup.Clear )
	self:registerEventHandler( "hud_update_refresh", CoD.ScorePopup.UpdateVisibility )
	local UpdateVisibility_Internal = function ( model )
		CoD.ScorePopup.UpdateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Internal )
	return self
end

CoD.ScorePopup.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
		if self.visible ~= true then
			self:animateToState( "show" )
			self.visible = true
		end
	elseif self.visible == true then
		self:animateToState( "hide" )
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.ScorePopup.FloatingCombatEfficiencyScoreFinish = function ( floatingText, event )
	if event.interrupted ~= true then
		floatingText.isUsed = false
		floatingText:setLeftRight( true, false, CoD.ScorePopup.FlyingLeftOffSetStart, CoD.ScorePopup.FlyingLeftOffSetStart + 150 )
		floatingText:setTopBottom( true, false, CoD.ScorePopup.FlyingTopOffSetStart, CoD.ScorePopup.FlyingTopOffSetStart + 30 )
		floatingText:setAlpha( 0 )
	end
end

CoD.ScorePopup.FloatingCombatEfficiencyScore = function ( score, value, scoreFeed )
	if scoreFeed.floatingTextContainer then
		scoreFeed.floatingTextContainer:setTopBottom( true, false, 0, 30 )
	else
		local floatTextContainer = LUI.UIElement.new()
		floatTextContainer:setLeftRight( true, false, 0, 150 )
		floatTextContainer:setTopBottom( true, false, 0, 30 )
		floatTextContainer.floatingText = {}
		floatTextContainer:setAlpha( 0 )
		for i = 1, 16, 1 do
			local floatingText = LUI.UIText.new()
			floatingText:setLeftRight( true, false, CoD.ScorePopup.FlyingLeftOffSetStart, CoD.ScorePopup.FlyingLeftOffSetStart + 150 )
			floatingText:setTopBottom( true, false, CoD.ScorePopup.FlyingTopOffSetStart, CoD.ScorePopup.FlyingTopOffSetStart + 30 )
			floatingText.isUsed = false
			floatingText:registerEventHandler( "transition_complete_flying_out", CoD.ScorePopup.FloatingCombatEfficiencyScoreFinish )
			floatTextContainer.floatingText[i] = floatingText
			floatTextContainer:addElement( floatingText )
		end
		scoreFeed.floatingTextContainer = floatTextContainer
		scoreFeed.floatingTextContainer.count = 0
		scoreFeed:addElement( floatTextContainer )
	end
	local floatingTextContainer = scoreFeed.floatingTextContainer
	for i = 1, 2, 1 do
		local f5_local2 = i
		if floatingTextContainer ~= nil then
			floatingTextContainer:setAlpha( 1 )
			floatingTextContainer.count = floatingTextContainer.count + 1
			local floatingText = floatingTextContainer.floatingText[floatingTextContainer.count % 16 + 1]
			local valueText = nil
			CoD.ScorePopup.FlyingAnimFrame = CoD.ScorePopup.FlyingAnimFrame + 1
			if value > 0 then
				valueText = "+" .. value
				floatingTextContainer:setRGB( CoD.ScoreFeed.CombatEfficiencyColor1.r, CoD.ScoreFeed.CombatEfficiencyColor1.g, CoD.ScoreFeed.CombatEfficiencyColor1.b )
				floatingText:setText( valueText )
				floatingTextContainer.isUsed = true
				if #CoD.ScorePopup.FlyingLeftAnimValues < CoD.ScorePopup.FlyingAnimFrame then
					CoD.ScorePopup.FlyingAnimFrame = 1
				end
				local leftOffSet = CoD.ScorePopup.FlyingLeftAnimValues[CoD.ScorePopup.FlyingAnimFrame] + CoD.ScorePopup.FlyingLeftOffSetStart
				local topOffSet = CoD.ScorePopup.FlyingTopAnimValues[CoD.ScorePopup.FlyingAnimFrame] + CoD.ScorePopup.FlyingTopOffSetStart
				floatingText:setAlpha( 1 )
				floatingText:beginAnimation( "flying_out", CoD.ScorePopup.FlyingDuration, true, false )
				floatingText:setLeftRight( true, false, leftOffSet, leftOffSet + 150 )
				floatingText:setTopBottom( true, false, topOffSet, topOffSet + 16 )
			end
			value = score - value
		end
	end
end

CoD.ScorePopup.Score = function ( self, event )
	local scoreName = Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" )
	local score = event.data[2]
	local rampage = event.data[3]
	local combat_efficiency = Engine.HasPerk( event.controller, "specialty_combat_efficiency" )
	if event.data[4] > 0 then
		combat_efficiency = true
	end
	if scoreName ~= nil then
		local translatedReason = nil
		translatedReason = Engine.Localize( scoreName )
		if rampage ~= 0 then
			local totalScore = score + rampage
			if totalScore > 0 then
				CoD.ScorePopup.SetCenterScore( self, Engine.Localize( "MP_PLUS" ) .. totalScore, CoD.ScoreFeed.scoreTypes.ScoreStreak )
			else
				CoD.ScorePopup.SetCenterScore( self, totalScore, CoD.ScoreFeed.scoreTypes.ScoreStreak )
			end
			if self.streakLabel == nil then
				local streakLabelTop = -10
				local streakLabelWidth = CoD.DPadArea.CircleSize / 2
				local streakLabelLeft = -CoD.DPadArea.CircleSize / 2
				local streakLabelHeight = 45
				local streakLabelBigTextTop = 140
				local streakLabelBigTextHeight = 60
				local streakLabelFontName = "ExtraSmall"
				local streakLabelTextHeight = CoD.textSize[streakLabelFontName]
				local streakLabelDefaultAnimState = {
					leftAnchor = false,
					rightAnchor = false,
					left = -100,
					right = 100,
					topAnchor = true,
					bottomAnchor = false,
					top = streakLabelBigTextTop,
					bottom = streakLabelBigTextTop + streakLabelBigTextHeight,
					alpha = 1
				}
				local streakLabel = CoD.AdditiveTextOverlay.newWithText( Engine.Localize( "MP_STREAK_CAPS" ), CoD.ScorePopup.ScoreFontName, CoD.ScoreFeed.ScoreStreakColor1, CoD.ScoreFeed.ScoreStreakColor2, CoD.ScoreFeed.ScoreStreakColor3, streakLabelDefaultAnimState )
				streakLabel:registerAnimationState( "on_dpad", {
					leftAnchor = true,
					rightAnchor = false,
					left = streakLabelLeft,
					right = streakLabelLeft + streakLabelWidth,
					topAnchor = false,
					bottomAnchor = true,
					top = streakLabelTop - streakLabelTextHeight / 2,
					bottom = streakLabelTop + streakLabelTextHeight / 2
				} )
				streakLabel:addAnimationStateForFont( streakLabelFontName, "on_dpad" )
				streakLabel:addElement( LUI.UITimer.new( CoD.ScorePopup.StreakPauseTime, "streak_to_dpad", true, self ) )
				self.safeArea:addElement( streakLabel )
				self.streakLabel = streakLabel
			end
			self.scoreFeed:addRow( translatedReason, totalScore, CoD.ScoreFeed.scoreTypes.ScoreStreak )
		else
			local scoreType = CoD.ScoreFeed.scoreTypes.Normal
			if combat_efficiency then
				CoD.ScorePopup.FloatingCombatEfficiencyScore( score, event.data[4], self.scoreFeed )
				scoreType = CoD.ScoreFeed.scoreTypes.CombatEfficiency
			end
			self.scoreFeed.ScoreCount = self.scoreFeed.ScoreCount + score
			local displayedScore = false
			if self.scoreFeed.ScoreCount > 0 then
				CoD.ScorePopup.SetCenterScore( self, Engine.Localize( "MP_PLUS" ) .. self.scoreFeed.ScoreCount, scoreType )
				displayedScore = true
			elseif self.scoreFeed.ScoreCount < 0 then
				CoD.ScorePopup.SetCenterScore( self, self.scoreFeed.ScoreCount, scoreType )
				displayedScore = true
			end
			if scoreName ~= "SCORE_KILL" and displayedScore == true then
				self.scoreFeed:addRow( translatedReason, score, scoreType )
			end
		end
	elseif self.streakLabel ~= nil then
		self.streakLabel:out()
		self.streakLabel = nil
	end
end

function resetAndCloseAfterTime( self, time )
	self.centerScoreNumber:addElement( LUI.UITimer.new( time, "out", true, self.glow ) )
	self.centerScoreNumber:addElement( LUI.UITimer.new( time, "reset", true, self ) )
	self.scoreFeed:addElement( LUI.UITimer.new( time, "reset", true, self ) )
	self.centerScoreNumber:addElement( LUI.UITimer.new( time, "close", true, self.label ) )
end

CoD.ScorePopup.Clear = function ( self, event )
	if self.centerScoreNumber ~= nil then
		self.centerScoreNumber:close()
		self.centerScoreNumber = nil
	end
	CoD.ScorePopup.Reset( self, event )
	self:dispatchEventToChildren( event )
end

CoD.ScorePopup.Reset = function ( self, event )
	self.ScoreCount = 0
end

CoD.ScorePopup.SetCenterScore = function ( self, text, scoreType )
	local color1, color2, color3, textColor = nil
	if scoreType == CoD.ScoreFeed.scoreTypes.CombatEfficiency then
		textColor = CoD.ScoreFeed.CombatEfficiencyTextColor
		color1 = CoD.ScoreFeed.CombatEfficiencyColor1
		color2 = CoD.ScoreFeed.CombatEfficiencyColor2
		color3 = CoD.ScoreFeed.CombatEfficiencyColor3
	elseif scoreType == CoD.ScoreFeed.scoreTypes.ScoreStreak then
		color1 = CoD.ScoreFeed.ScoreStreakColor1
		color2 = CoD.ScoreFeed.ScoreStreakColor2
		color3 = CoD.ScoreFeed.ScoreStreakColor3
	else
		color1 = CoD.ScoreFeed.Color1
		color2 = CoD.ScoreFeed.Color2
		color3 = CoD.ScoreFeed.Color3
	end
	if self.centerScoreNumber ~= nil then
		self.centerScoreNumber:close()
		self.centerScoreNumber = nil
	end
	local numberDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 40,
		right = 40,
		topAnchor = false,
		bottomAnchor = false,
		top = CoD.ScorePopup.ScoreTextTop,
		bottom = CoD.ScorePopup.ScoreTextTop + CoD.ScorePopup.ScoreTextHeight
	}
	local centerScoreNumber = CoD.AdditiveTextOverlay.newWithText( text, CoD.ScorePopup.ScoreFontName, color1, color2, color3, numberDefaultAnimState )
	if textColor ~= nil then
		centerScoreNumber.label:setRGB( textColor.r, textColor.g, textColor.b )
	end
	if scoreType == CoD.ScoreFeed.scoreTypes.CombatEfficiency then
		Engine.PlaySound( "gdt_ce_score" )
	end
	self:addElement( centerScoreNumber )
	self.centerScoreNumber = centerScoreNumber
	
	centerScoreNumber:registerEventHandler( "reset", CoD.ScorePopup.Reset )
	self.scoreFeed:registerEventHandler( "reset", CoD.ScorePopup.Reset )
	resetAndCloseAfterTime( self, CoD.ScorePopup.DisplayTime )
end

CoD.ScorePopup.StreakToDPad = function ( self, event )
	self.streakLabel:animateToState( "on_dpad", CoD.ScorePopup.StreakMoveTime )
	self.streakLabel.label:animateToState( "on_dpad", CoD.ScorePopup.StreakMoveTime )
	self.streakLabel.glow.glow:animateToState( "on_dpad", CoD.ScorePopup.StreakMoveTime )
	self.streakLabel.glow.innerGlow:animateToState( "on_dpad", CoD.ScorePopup.StreakMoveTime )
end

