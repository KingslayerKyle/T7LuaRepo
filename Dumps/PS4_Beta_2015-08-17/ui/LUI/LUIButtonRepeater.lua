require( "ui.LUI.LUITimer" )

LUI.UIButtonRepeater = {}
LUI.UIButtonRepeater.FirstDelay = 420
LUI.UIButtonRepeater.Delay = 210
LUI.UIButtonRepeater.DelayReduction = 25
LUI.UIButtonRepeater.AccelInterval = 100
LUI.UIButtonRepeater.MinDelay = 33
LUI.UIButtonRepeater.new = function ( buttonName, event, eventTarget )
	local buttonRepeater = LUI.UIElement.new()
	buttonRepeater.id = "LUIButtonRepeater"
	buttonRepeater:setPriority( -1000 )
	buttonRepeater.buttonName = buttonName
	if type( event ) == "string" then
		buttonRepeater.event = {
			name = event,
			buttonRepeat = true
		}
	else
		event.buttonRepeat = true
		buttonRepeater.event = event
	end
	buttonRepeater.eventTarget = eventTarget
	buttonRepeater.firstDelay = LUI.UIButtonRepeater.FirstDelay
	buttonRepeater.delay = LUI.UIButtonRepeater.Delay
	buttonRepeater.delayReduction = LUI.UIButtonRepeater.DelayReduction
	buttonRepeater.accelInterval = LUI.UIButtonRepeater.AccelInterval
	buttonRepeater.minDelay = LUI.UIButtonRepeater.MinDelay
	buttonRepeater.handleGamepadButton = LUI.UIButtonRepeater.HandleGamepadButton
	buttonRepeater.cancelRepetition = LUI.UIButtonRepeater.CancelRepetition
	buttonRepeater.sendButtonRepeat = LUI.UIButtonRepeater.SendButtonRepeat
	buttonRepeater:registerEventHandler( "repeat", LUI.UIButtonRepeater.Repeat )
	buttonRepeater:registerEventHandler( "accelerate", LUI.UIButtonRepeater.Accelerate )
	buttonRepeater:registerEventHandler( "menu_occluded", LUI.UIButtonRepeater.CancelRepetition )
	buttonRepeater:registerEventHandler( "controller_backed_out", LUI.UIButtonRepeater.CancelRepetition )
	if LUI.startswith( buttonName, "mouse" ) or LUI.startswith( buttonName, "touchpad" ) then
		buttonRepeater:setHandleMouseButton( true )
		buttonRepeater:registerEventHandler( "leftmousedown", LUI.UIButtonRepeater.LeftMouseDown )
		buttonRepeater:registerEventHandler( "leftmouseup", LUI.UIButtonRepeater.LeftMouseUp )
	end
	return buttonRepeater
end

LUI.UIButtonRepeater.HandleGamepadButton = function ( self, event )
	if LUI.UIElement.handleGamepadButton( self, event ) then
		return true
	else
		
	end
end

LUI.UIButtonRepeater.LeftMouseDown = function ( self, event )
	if not event.buttonRepeat then
		self:cancelRepetition()
		self.controller = event.controller
		
		local repeatTimer = LUI.UITimer.new( self.firstDelay, {
			name = "repeat",
			numRepeats = 1
		} )
		self:addElement( repeatTimer )
		self.repeatTimer = repeatTimer
		
		if event.name ~= self.event.name then
			self:sendButtonRepeat()
		end
	end
end

LUI.UIButtonRepeater.LeftMouseUp = function ( self, event )
	if not event.buttonRepeat then
		self:cancelRepetition()
	end
end

LUI.UIButtonRepeater.CancelRepetition = function ( self )
	local repeatTimer = self.repeatTimer
	if repeatTimer ~= nil then
		repeatTimer:close()
		self.repeatTimer = nil
	end
	local accelTimer = self.accelTimer
	if accelTimer ~= nil then
		accelTimer:close()
		self.accelTimer = nil
	end
	self.currentDelay = nil
end

LUI.UIButtonRepeater.SendButtonRepeat = function ( self )
	local eventTarget = self.eventTarget
	if eventTarget == nil then
		eventTarget = self:getParent()
	end
	local event = self.event
	event.controller = self.controller
	return eventTarget:processEvent( event )
end

LUI.UIButtonRepeater.Repeat = function ( self, event )
	local repeatTimer = self.repeatTimer
	local numRepeats = event.numRepeats
	if self.currentDelay == nil then
		repeatTimer.interval = self.delay
		if self.accelTimer == nil then
			local accelTimer = LUI.UITimer.new( self.accelInterval, "accelerate" )
			self:addElement( accelTimer )
			self.accelTimer = accelTimer
			
		end
	else
		repeatTimer.interval = self.currentDelay
	end
	if self:isInputDisabledOnChain() then
		self:cancelRepetition()
	else
		self:sendButtonRepeat()
		event.numRepeats = numRepeats + 1
	end
end

LUI.UIButtonRepeater.Accelerate = function ( self, event )
	local currentDelay = self.currentDelay
	if currentDelay == nil then
		currentDelay = self.delay
	else
		currentDelay = currentDelay - self.delayReduction
		if currentDelay < self.minDelay then
			currentDelay = self.minDelay
		end
	end
	self.currentDelay = currentDelay
end

