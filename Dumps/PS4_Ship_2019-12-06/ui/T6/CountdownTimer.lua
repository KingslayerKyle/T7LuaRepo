CoD.CountdownTimer = {}
CoD.CountdownTimer.Setup = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg1 == nil then
		f1_arg1 = 30000
	end
	f1_arg0.secondHundrethsThreshold = f1_arg1
	f1_arg0.setTimeLeft = CoD.CountdownTimer.SetTimeLeft
	f1_arg0.showMinutes = f1_arg2
	f1_arg0.addTimedParentEvent = CoD.CountdownTimer.AddTimedParentEvent
	f1_arg0:registerEventHandler( "countdown_tick", CoD.CountdownTimer.CountdownTick )
end

CoD.CountdownTimer.SetTimeLeft = function ( f2_arg0, f2_arg1 )
	f2_arg0.countdownTimeLeft = f2_arg1
	if f2_arg1 <= 0 then
		f2_arg0:setText( "" )
		if f2_arg0.timedEvents then
			for f2_local0 = 1, #f2_arg0.timedEvents, 1 do
				local f2_local3 = f2_arg0.timedEvents[f2_local0]
				if not f2_local3.triggered and f2_arg1 < f2_local3.time then
					f2_arg0:dispatchEventToParent( f2_local3 )
					f2_local3.triggered = true
				end
			end
		end
		f2_arg0.timedEvents = nil
		if f2_arg0.countdownTimer ~= nil then
			f2_arg0.countdownTimer:close()
			f2_arg0.countdownTimer = nil
			f2_arg0:dispatchEventToParent( {
				name = "hud_destroy_timer"
			} )
		end
		return 
	end
	local f2_local0 = nil
	if f2_arg1 <= f2_arg0.secondHundrethsThreshold then
		f2_local0 = f2_arg1 % 100
		local countdownTimer = math.floor( f2_arg1 / 1000 )
		local f2_local2 = math.floor( f2_arg1 / 100 ) - countdownTimer * 10
		if f2_local2 == 0 then
			f2_local2 = "0"
		end
		f2_arg0:setText( countdownTimer .. "." .. f2_local2 )
	else
		f2_local0 = f2_arg1 % 1000
		local countdownTimer = math.floor( f2_arg1 / 60000 )
		local f2_local2 = math.floor( f2_arg1 / 1000 ) - countdownTimer * 60
		if f2_local2 < 10 then
			f2_local2 = "0" .. f2_local2
		end
		if f2_arg0.showMinutes == false then
			f2_arg0:setText( f2_local2 + countdownTimer * 60 )
		else
			f2_arg0:setText( countdownTimer .. ":" .. f2_local2 )
		end
	end
	if f2_local0 == 0 then
		f2_local0 = 1
	end
	if f2_arg0.countdownTimerTickDuration ~= f2_local0 then
		f2_arg0.countdownTimerTickDuration = f2_local0
		local countdownTimer = f2_arg0.countdownTimer
		if countdownTimer == nil then
			countdownTimer = LUI.UITimer.new( f2_local0, "countdown_tick" )
			f2_arg0:addElement( countdownTimer )
			f2_arg0.countdownTimer = countdownTimer
			
		else
			countdownTimer.interval = f2_local0
		end
	end
	if f2_arg0.countdownLow == nil and f2_arg1 <= 30000 then
		f2_arg0.countdownLow = true
		f2_arg0:processEvent( {
			name = "countdown_low",
			low = true
		} )
	elseif f2_arg0.countdownLow == true and f2_arg1 > 30000 then
		f2_arg0.countdownLow = nil
		f2_arg0:processEvent( {
			name = "countdown_nolongerlow"
		} )
	end
	if f2_arg0.timedEvents then
		for countdownTimer = 1, #f2_arg0.timedEvents, 1 do
			local f2_local5 = f2_arg0.timedEvents[countdownTimer]
			if not f2_local5.triggered and f2_arg1 < f2_local5.time then
				f2_arg0:dispatchEventToParent( f2_local5 )
				f2_local5.triggered = true
			end
		end
	end
end

CoD.CountdownTimer.CountdownTick = function ( f3_arg0, f3_arg1 )
	f3_arg0:setTimeLeft( f3_arg0.countdownTimeLeft - f3_arg1.timeElapsed )
end

CoD.CountdownTimer.AddTimedParentEvent = function ( f4_arg0, f4_arg1, f4_arg2 )
	if f4_arg0.timedEvents == nil then
		f4_arg0.timedEvents = {}
	end
	local f4_local0 = false
	for f4_local4, f4_local5 in ipairs( f4_arg0.timedEvents ) do
		if f4_arg1 == f4_local5.time and f4_arg2 == f4_local5.name then
			f4_local0 = true
			break
		end
	end
	if not f4_local0 then
		table.insert( f4_arg0.timedEvents, {
			name = f4_arg2,
			time = f4_arg1
		} )
	end
end

