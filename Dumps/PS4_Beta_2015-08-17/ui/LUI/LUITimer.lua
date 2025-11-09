LUI.UITimer = {}
LUI.UITimer.priority = 10000
LUI.UITimer.create = function ( interval, disposable )
	local timer = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 1,
		bottom = 1,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	timer.id = "LUITimer"
	timer:setPriority( LUI.UITimer.priority )
	timer.reset = LUI.UITimer.Reset
	timer.processNow = LUI.UITimer.ProcessNow
	timer.interval = math.max( 1, interval )
	timer.disposable = disposable
	return timer
end

LUI.UITimer.new = function ( interval, event, disposable, eventTarget )
	local timer = LUI.UITimer.create( interval, disposable )
	if type( event ) == "string" then
		timer.timerEvent = {
			name = event,
			timer = timer
		}
	else
		event.timer = timer
		timer.timerEvent = event
	end
	timer.timerEventTarget = eventTarget
	timer:reset()
	return timer
end

LUI.UITimer.newElementTimer = function ( interval, disposable, fn, ... )
	local timer = LUI.UITimer.create( interval, disposable )
	local vargs = {
		n = select( "#", ... ),
		...
	}
	timer.timerEventFunction = function ( event )
		local args = LUI.ShallowCopy( vargs )
		table.insert( args, event )
		fn( unpack( args ) )
	end
	
	timer:reset()
	return timer
end

LUI.UITimer.Reset = function ( self )
	self:registerEventHandler( "transition_complete_default", nil )
	self:animateToState( "default", self.interval )
	self:registerEventHandler( "transition_complete_default", LUI.UITimer.Tick )
end

LUI.UITimer.Tick = function ( self, event )
	if event.interrupted then
		return 
	end
	local eventTarget = nil
	if self.timerEventTarget ~= nil then
		eventTarget = self.timerEventTarget
	else
		eventTarget = self:getParent()
	end
	local timerEvent = self.timerEvent or {}
	timerEvent.timeElapsed = self.interval + event.lateness
	if self.timerEventFunction then
		self.timerEventFunction( timerEvent )
	elseif timerEvent then
		eventTarget:processEvent( timerEvent )
	end
	if self.disposable then
		self:close()
	else
		self:reset()
	end
end

LUI.UITimer.ProcessNow = function ( self )
	local eventTarget = nil
	if self.timerEventTarget ~= nil then
		eventTarget = self.timerEventTarget
	else
		eventTarget = self:getParent()
	end
	local timerEvent = self.timerEvent
	timerEvent.timeElapsed = self.interval
	eventTarget:processEvent( timerEvent )
	if self.disposable then
		self:close()
	else
		self:reset()
	end
end

