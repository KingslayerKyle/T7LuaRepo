-- a8df1b5d76e5cbcbf199ab38af21ea08
-- This hash is used for caching, delete to decompile the file again

require( "ui.LUI.LUITimer" )

LUI.UIButtonRepeater = {}
LUI.UIButtonRepeater.FirstDelay = 420
LUI.UIButtonRepeater.Delay = 210
LUI.UIButtonRepeater.DelayReduction = 25
LUI.UIButtonRepeater.AccelInterval = 100
LUI.UIButtonRepeater.MinDelay = 33
LUI.UIButtonRepeater.new = function ( f1_arg0, f1_arg1, f1_arg2 )
	local self = LUI.UIElement.new()
	self.id = "LUIButtonRepeater"
	self:setPriority( -1000 )
	self.buttonName = f1_arg0
	if type( f1_arg1 ) == "string" then
		self.event = {
			name = f1_arg1,
			buttonRepeat = true
		}
	else
		f1_arg1.buttonRepeat = true
		self.event = f1_arg1
	end
	self.eventTarget = f1_arg2
	self.firstDelay = LUI.UIButtonRepeater.FirstDelay
	self.delay = LUI.UIButtonRepeater.Delay
	self.delayReduction = LUI.UIButtonRepeater.DelayReduction
	self.accelInterval = LUI.UIButtonRepeater.AccelInterval
	self.minDelay = LUI.UIButtonRepeater.MinDelay
	self.handleGamepadButton = LUI.UIButtonRepeater.HandleGamepadButton
	self.cancelRepetition = LUI.UIButtonRepeater.CancelRepetition
	self.sendButtonRepeat = LUI.UIButtonRepeater.SendButtonRepeat
	self:registerEventHandler( "repeat", LUI.UIButtonRepeater.Repeat )
	self:registerEventHandler( "accelerate", LUI.UIButtonRepeater.Accelerate )
	self:registerEventHandler( "menu_occluded", LUI.UIButtonRepeater.CancelRepetition )
	self:registerEventHandler( "controller_backed_out", LUI.UIButtonRepeater.CancelRepetition )
	if LUI.startswith( f1_arg0, "mouse" ) or LUI.startswith( f1_arg0, "touchpad" ) then
		self:setHandleMouseButton( true )
		self:registerEventHandler( "leftmousedown", LUI.UIButtonRepeater.LeftMouseDown )
		self:registerEventHandler( "leftmouseup", LUI.UIButtonRepeater.LeftMouseUp )
	end
	return self
end

LUI.UIButtonRepeater.HandleGamepadButton = function ( f2_arg0, f2_arg1 )
	if LUI.UIElement.handleGamepadButton( f2_arg0, f2_arg1 ) then
		return true
	else
		
	end
end

LUI.UIButtonRepeater.LeftMouseDown = function ( f3_arg0, f3_arg1 )
	if not f3_arg1.buttonRepeat then
		f3_arg0:cancelRepetition()
		f3_arg0.controller = f3_arg1.controller
		
		local repeatTimer = LUI.UITimer.new( f3_arg0.firstDelay, {
			name = "repeat",
			numRepeats = 1
		} )
		f3_arg0:addElement( repeatTimer )
		f3_arg0.repeatTimer = repeatTimer
		
		if f3_arg1.name ~= f3_arg0.event.name then
			f3_arg0:sendButtonRepeat()
		end
	end
end

LUI.UIButtonRepeater.LeftMouseUp = function ( f4_arg0, f4_arg1 )
	if not f4_arg1.buttonRepeat then
		f4_arg0:cancelRepetition()
	end
end

LUI.UIButtonRepeater.CancelRepetition = function ( f5_arg0 )
	local f5_local0 = f5_arg0.repeatTimer
	if f5_local0 ~= nil then
		f5_local0:close()
		f5_arg0.repeatTimer = nil
	end
	local f5_local1 = f5_arg0.accelTimer
	if f5_local1 ~= nil then
		f5_local1:close()
		f5_arg0.accelTimer = nil
	end
	f5_arg0.currentDelay = nil
end

LUI.UIButtonRepeater.SendButtonRepeat = function ( f6_arg0 )
	local f6_local0 = f6_arg0.eventTarget
	if f6_local0 == nil then
		f6_local0 = f6_arg0:getParent()
	end
	local f6_local1 = f6_arg0.event
	f6_local1.controller = f6_arg0.controller
	return f6_local0:processEvent( f6_local1 )
end

LUI.UIButtonRepeater.Repeat = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0.repeatTimer
	local f7_local1 = f7_arg1.numRepeats
	if f7_arg0.currentDelay == nil then
		f7_local0.interval = f7_arg0.delay
		if f7_arg0.accelTimer == nil then
			local accelTimer = LUI.UITimer.new( f7_arg0.accelInterval, "accelerate" )
			f7_arg0:addElement( accelTimer )
			f7_arg0.accelTimer = accelTimer
			
		end
	else
		f7_local0.interval = f7_arg0.currentDelay
	end
	if f7_arg0:isInputDisabledOnChain() then
		f7_arg0:cancelRepetition()
	else
		f7_arg0:sendButtonRepeat()
		f7_arg1.numRepeats = f7_local1 + 1
	end
end

LUI.UIButtonRepeater.Accelerate = function ( f8_arg0, f8_arg1 )
	local f8_local0 = f8_arg0.currentDelay
	if f8_local0 == nil then
		f8_local0 = f8_arg0.delay
	else
		f8_local0 = f8_local0 - f8_arg0.delayReduction
		if f8_local0 < f8_arg0.minDelay then
			f8_local0 = f8_arg0.minDelay
		end
	end
	f8_arg0.currentDelay = f8_local0
end

