CoD.CountdownTimer = {}
CoD.CountdownTimer.Setup = function ( textElement, secondHundrethsThreshold, showMinutes )
	if secondHundrethsThreshold == nil then
		secondHundrethsThreshold = 30000
	end
	textElement.secondHundrethsThreshold = secondHundrethsThreshold
	textElement.setTimeLeft = CoD.CountdownTimer.SetTimeLeft
	textElement.showMinutes = showMinutes
	textElement.addTimedParentEvent = CoD.CountdownTimer.AddTimedParentEvent
	textElement:registerEventHandler( "countdown_tick", CoD.CountdownTimer.CountdownTick )
end

CoD.CountdownTimer.SetTimeLeft = function ( self, millisecondsLeft )
	self.countdownTimeLeft = millisecondsLeft
	if millisecondsLeft <= 0 then
		self:setText( "" )
		if self.timedEvents then
			for index = 1, #self.timedEvents, 1 do
				local parentEvent = self.timedEvents[index]
				if not parentEvent.triggered and millisecondsLeft < parentEvent.time then
					self:dispatchEventToParent( parentEvent )
					parentEvent.triggered = true
				end
			end
		end
		self.timedEvents = nil
		if self.countdownTimer ~= nil then
			self.countdownTimer:close()
			self.countdownTimer = nil
			self:dispatchEventToParent( {
				name = "hud_destroy_timer"
			} )
		end
		return 
	end
	local tickDuration = nil
	if millisecondsLeft <= self.secondHundrethsThreshold then
		tickDuration = millisecondsLeft % 100
		local seconds = math.floor( millisecondsLeft / 1000 )
		local secondHundreths = math.floor( millisecondsLeft / 100 ) - seconds * 10
		if secondHundreths == 0 then
			secondHundreths = "0"
		end
		self:setText( seconds .. "." .. secondHundreths )
	else
		tickDuration = millisecondsLeft % 1000
		local minutes = math.floor( millisecondsLeft / 60000 )
		local seconds = math.floor( millisecondsLeft / 1000 ) - minutes * 60
		if seconds < 10 then
			seconds = "0" .. seconds
		end
		if self.showMinutes == false then
			self:setText( seconds + minutes * 60 )
		else
			self:setText( minutes .. ":" .. seconds )
		end
	end
	if tickDuration == 0 then
		tickDuration = 1
	end
	if self.countdownTimerTickDuration ~= tickDuration then
		self.countdownTimerTickDuration = tickDuration
		local timer = self.countdownTimer
		if timer == nil then
			timer = LUI.UITimer.new( tickDuration, "countdown_tick" )
			self:addElement( timer )
			self.countdownTimer = timer
			
		else
			timer.interval = tickDuration
		end
	end
	if self.countdownLow == nil and millisecondsLeft <= 30000 then
		self.countdownLow = true
		self:processEvent( {
			name = "countdown_low",
			low = true
		} )
	elseif self.countdownLow == true and millisecondsLeft > 30000 then
		self.countdownLow = nil
		self:processEvent( {
			name = "countdown_nolongerlow"
		} )
	end
	if self.timedEvents then
		for index = 1, #self.timedEvents, 1 do
			local parentEvent = self.timedEvents[index]
			if not parentEvent.triggered and millisecondsLeft < parentEvent.time then
				self:dispatchEventToParent( parentEvent )
				parentEvent.triggered = true
			end
		end
	end
end

CoD.CountdownTimer.CountdownTick = function ( self, event )
	self:setTimeLeft( self.countdownTimeLeft - event.timeElapsed )
end

CoD.CountdownTimer.AddTimedParentEvent = function ( self, time, eventName )
	if self.timedEvents == nil then
		self.timedEvents = {}
	end
	local dupeFound = false
	for index, parentEvent in ipairs( self.timedEvents ) do
		if time == parentEvent.time and eventName == parentEvent.name then
			dupeFound = true
			break
		end
	end
	if not dupeFound then
		table.insert( self.timedEvents, {
			name = eventName,
			time = time
		} )
	end
end

