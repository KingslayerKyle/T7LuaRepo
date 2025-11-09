CoD.CountupTimer = {}
CoD.CountupTimer.Setup = function ( textElement, showHours, showMillliseconds )
	textElement.setTimeStart = CoD.CountupTimer.SetTimeStart
	textElement.showHours = showHours
	textElement.showMillliseconds = showMillliseconds
	textElement:registerEventHandler( "count_tick", CoD.CountupTimer.CountTick )
end

CoD.CountupTimer.SetTimeStart = function ( self, millisecondsStart )
	self.countTime = millisecondsStart
	local tickDuration = nil
	local sec = 1000
	local min = sec * 60
	local hour = min * 60
	tickDuration = millisecondsStart % 100
	local hours = math.floor( millisecondsStart / hour )
	local minutes = math.floor( millisecondsStart / min ) - hours * 60
	local seconds = math.floor( millisecondsStart / sec ) - hours * 60 * 60 - minutes * 60
	local secondHundreths = math.floor( millisecondsStart / 100 ) - hours * 60 * 60 * 10 - minutes * 60 * 10 - seconds * 10
	if hours < 10 then
		hours = "0" .. hours
	end
	if minutes < 10 then
		minutes = "0" .. minutes
	end
	if seconds < 10 then
		seconds = "0" .. seconds
	end
	if secondHundreths == 0 then
		secondHundreths = "00"
	else
		secondHundreths = "0" .. secondHundreths
	end
	if self.showHours == false then
		if self.showMillliseconds == false then
			self:setText( minutes .. ":" .. seconds )
		else
			self:setText( minutes .. ":" .. seconds .. ":" .. secondHundreths )
		end
	elseif self.showMillliseconds == false then
		self:setText( hours .. ":" .. minutes .. ":" .. seconds )
	else
		self:setText( hours .. ":" .. minutes .. ":" .. seconds .. ":" .. secondHundreths )
	end
	if tickDuration == 0 then
		tickDuration = 1
	end
	local timer = self.CountupTimer
	if timer == nil then
		timer = LUI.UITimer.new( tickDuration, "count_tick" )
		self:addElement( timer )
		self.CountupTimer = timer
		
	else
		timer.interval = tickDuration
	end
end

CoD.CountupTimer.CountTick = function ( self, event )
	self:setTimeStart( self.countTime + event.timeElapsed )
end

