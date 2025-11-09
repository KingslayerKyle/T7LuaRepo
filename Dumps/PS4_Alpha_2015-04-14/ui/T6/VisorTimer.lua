CoD.VisorTimer = {}
CoD.VisorTimer.ContainerWidth = 100
CoD.VisorTimer.ContainerHeight = 30
CoD.VisorTimer.FontAlpha = 0.75
CoD.VisorTimer.Blue = CoD.visorBlue
CoD.VisorTimer.new = function ()
	local visorTimerLeftOffset = CoD.VisorLeftBracket.BracketWidth
	local visorTimerTopOffset = -CoD.VisorLeftBracket.BracketHeight / 2 + CoD.ObjectiveText.DefaultHeight + 20
	local visorTimer = LUI.UIElement.new()
	visorTimer:setLeftRight( true, false, visorTimerLeftOffset, CoD.VisorTimer.ContainerWidth + visorTimerLeftOffset )
	visorTimer:setTopBottom( false, false, -CoD.VisorTimer.ContainerHeight / 2 - visorTimerTopOffset, CoD.VisorTimer.ContainerHeight / 2 - visorTimerTopOffset )
	visorTimer.id = visorTimer.id .. ".VisorTimer"
	visorTimer:registerEventHandler( "hud_create_timer", CoD.VisorTimer.CreateTimer )
	visorTimer:registerEventHandler( "hud_destroy_timer", CoD.VisorTimer.DestroyTimer )
	return visorTimer
end

CoD.VisorTimer.CreateTimer = function ( self, event )
	local startTimeValue = event.data[1] * 1000
	startTimeValue = startTimeValue or 600000
	if event.data[2] ~= 0 then
		local isCountupTimer = true
	else
		local f2_local0 = false
	end
	if event.data[3] ~= 0 then
		local showHours = true
	else
		local f2_local1 = false
	end
	if event.data[4] ~= 0 then
		local showMinutes = true
	else
		local f2_local2 = false
	end
	if event.data[5] ~= 0 then
		local showMilliseconds = true
	else
		local f2_local3 = false
	end
	local secondHundrethsThreshold = event.data[6]
	if secondHundrethsThreshold then
		secondHundrethsThreshold = secondHundrethsThreshold * 1000
	else
		secondHundrethsThreshold = 30000
	end
	local fontType = CoD.fonts.Default
	local textSize = CoD.textSize.Default
	local timerText = LUI.UIText.new( nil, true )
	timerText:setLeftRight( true, true, 0, 0 )
	timerText:setTopBottom( false, false, -textSize / 2, textSize / 2 )
	timerText:setRGB( CoD.VisorTimer.Blue.r, CoD.VisorTimer.Blue.g, CoD.VisorTimer.Blue.b )
	timerText:setFont( fontType )
	timerText:setAlignment( LUI.Alignment.Left )
	timerText:setAlpha( CoD.VisorTimer.FontAlpha )
	self:addElement( timerText )
	if f2_local0 == false then
		CoD.CountdownTimer.Setup( timerText, secondHundrethsThreshold, f2_local2 )
		timerText:setTimeLeft( startTimeValue )
	else
		CoD.CountupTimer.Setup( timerText, f2_local1, f2_local3 )
		timerText:setTimeStart( startTimeValue )
	end
	self.timerText = timerText
end

CoD.VisorTimer.DestroyTimer = function ( self, event )
	if self.timerText then
		self.timerText:close()
	end
end

