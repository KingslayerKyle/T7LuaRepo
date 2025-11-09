CoD.ScoreFeed = {}
CoD.ScoreFeed.MaxRows = 4
CoD.ScoreFeed.RowHeight = 25
CoD.ScoreFeed.LabelOffset = -40
CoD.ScoreFeed.ExpandTime = 200
CoD.ScoreFeed.ShrinkTime = 150
CoD.ScoreFeed.RowScoreThresholds = {
	50,
	150
}
CoD.ScoreFeed.RowHeights = {
	18,
	20,
	22
}
CoD.ScoreFeed.RowFonts = {
	CoD.fonts.Dist,
	CoD.fonts.Dist,
	CoD.fonts.Dist
}
CoD.ScoreFeed.RowDurations = {
	1000,
	1000,
	1000
}
CoD.ScoreFeed.feedDuration = 1000
CoD.ScoreFeed.Spacing = 0
CoD.ScoreFeed.Height = CoD.ScoreFeed.RowHeights[#CoD.ScoreFeed.RowHeights] * CoD.ScoreFeed.MaxRows + CoD.ScoreFeed.Spacing * (CoD.ScoreFeed.MaxRows - 1)
CoD.ScoreFeed.Color1 = {
	r = CoD.blue.r * 0.25,
	g = CoD.blue.g * 0.25,
	b = CoD.blue.b * 0.25
}
CoD.ScoreFeed.Color2 = {
	r = 0.07,
	g = 0.04,
	b = 0.05
}
CoD.ScoreFeed.Color3 = {
	r = 0.06,
	g = 0,
	b = 0.12
}
CoD.ScoreFeed.ScoreStreakColor1 = {
	r = CoD.yellowGlow.r * 0.25,
	g = CoD.yellowGlow.g * 0.25,
	b = CoD.yellowGlow.b * 0.25
}
CoD.ScoreFeed.ScoreStreakColor2 = {
	r = 0.12,
	g = 0.06,
	b = 0
}
CoD.ScoreFeed.ScoreStreakColor3 = {
	r = 0.12,
	g = 0,
	b = 0
}
CoD.ScoreFeed.CombatEfficiencyTextColor = {
	r = CoD.blue.r * 0,
	g = CoD.blue.g * 1,
	b = CoD.blue.b * 1
}
CoD.ScoreFeed.CombatEfficiencyColor1 = {
	r = CoD.blue.r * 0.4,
	g = CoD.blue.g * 1,
	b = CoD.blue.b * 1
}
CoD.ScoreFeed.CombatEfficiencyColor2 = {
	r = CoD.blue.r * 0.6,
	g = CoD.blue.g * 1,
	b = CoD.blue.b * 1
}
CoD.ScoreFeed.CombatEfficiencyColor3 = {
	r = CoD.blue.r,
	g = CoD.blue.g,
	b = CoD.blue.b
}
CoD.ScoreFeed.scoreTypes = {}
CoD.ScoreFeed.scoreTypes.Normal = 0
CoD.ScoreFeed.scoreTypes.ScoreStreak = 1
CoD.ScoreFeed.scoreTypes.CombatEfficiency = 2
CoD.ScoreFeed.new = function ( defaultAnimationState )
	local self = LUI.UIVerticalList.new( defaultAnimationState )
	self:registerEventHandler( "time_up", CoD.ScoreFeed.Reset )
	self:registerEventHandler( "demo_jump", CoD.ScoreFeed.DemoJump )
	self.rows = {}
	self.addRow = CoD.ScoreFeed.AddRow
	return self
end

CoD.ScoreFeed.AddRow = function ( self, label, score, scoreType )
	local labelOffset = CoD.ScoreFeed.LabelOffset
	local rows = self.rows
	local maxRows = CoD.ScoreFeed.MaxRows
	local scoreThresholds = CoD.ScoreFeed.RowScoreThresholds
	local rowTypeIndex = #scoreThresholds + 1
	for index, threshold in ipairs( scoreThresholds ) do
		if score < threshold then
			rowTypeIndex = index
			break
		end
	end
	local rowFont = CoD.ScoreFeed.RowFonts[rowTypeIndex]
	local rowHeight = CoD.textSize.Default
	local rowDuration = CoD.ScoreFeed.RowDurations[rowTypeIndex]
	local extraTextSize = 3
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( label, rowFont, rowHeight + extraTextSize * 2 )
	local rowWidth = textRight + textLeft - labelOffset
	local row = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 2560,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		alpha = 1
	} )
	row:setPriority( -1 )
	self:addElement( row )
	row:setPriority( 0 )
	table.insert( rows, row )
	row:registerAnimationState( "expand", {
		top = 0,
		bottom = rowHeight + CoD.ScoreFeed.Spacing,
		topAnchor = true,
		bottomAnchor = false
	} )
	row:registerAnimationState( "shrink", {
		top = 0,
		bottom = 0,
		topAnchor = true,
		bottomAnchor = false
	} )
	row:registerAnimationState( "fade", {
		alpha = 0
	} )
	row:registerEventHandler( "transition_complete_expand", CoD.ScoreFeed.Row_Expand )
	row:registerEventHandler( "shrink", CoD.ScoreFeed.Row_Shrink )
	row:registerEventHandler( "transition_complete_shrink", row.close )
	row:registerEventHandler( "transition_complete_fade", row.close )
	row:animateToState( "expand", CoD.ScoreFeed.ExpandTime, true, true )
	if self.timer ~= nil then
		self.timer:close()
	end
	local timer = LUI.UITimer.new( rowDuration, "time_up", true )
	self:addElement( timer )
	self.timer = timer
	
	local backgroundColor, backgroundColor2, backgroundColor3, textColor = nil
	if scoreType == CoD.ScoreFeed.scoreTypes.CombatEfficiency then
		textColor = CoD.ScoreFeed.CombatEfficiencyTextColor
		backgroundColor = CoD.ScoreFeed.CombatEfficiencyColor1
		backgroundColor2 = CoD.ScoreFeed.CombatEfficiencyColor2
		backgroundColor3 = CoD.ScoreFeed.CombatEfficiencyColor3
	elseif scoreType == CoD.ScoreFeed.scoreTypes.ScoreStreak then
		backgroundColor = CoD.ScoreFeed.ScoreStreakColor1
		backgroundColor2 = CoD.ScoreFeed.ScoreStreakColor2
		backgroundColor3 = CoD.ScoreFeed.ScoreStreakColor3
	else
		backgroundColor = CoD.ScoreFeed.Color1
		backgroundColor2 = CoD.ScoreFeed.Color2
		backgroundColor3 = CoD.ScoreFeed.Color3
	end
	local scoreText = LUI.UIText.new()
	scoreText:setLeftRight( true, false, 0, 2560 )
	scoreText:setTopBottom( true, true, 0, -CoD.ScoreFeed.Spacing )
	scoreText:setAlignment( LUI.Alignment.Left )
	scoreText:setText( label )
	scoreText:setRGB( 1, 1, 1 )
	if textColor ~= nil then
		scoreText:setRGB( textColor.r, textColor.g, textColor.b )
	end
	row:addElement( scoreText )
	row.scoreText = scoreText
	
	if maxRows < #rows then
		rows[1]:animateToState( "fade", CoD.ScoreFeed.ExpandTime, true, true )
		table.remove( rows, 1 )
	end
end

CoD.ScoreFeed.Row_Expand = function ( self, event )
	
end

CoD.ScoreFeed.Reset = function ( self, event )
	self.timer = nil
	for i = 1, #self.rows, 1 do
		local row = self.rows[i]
		row.scoreText:close()
	end
end

CoD.ScoreFeed.Row_Shrink = function ( self, event )
	self:animateToState( "shrink", CoD.ScoreFeed.ShrinkTime, true, true )
end

CoD.ScoreFeed.DemoJump = function ( self, event )
	if self.timer ~= nil then
		self.timer:close()
		self.timer = nil
	end
	CoD.ScoreFeed.Reset( self, event )
end

