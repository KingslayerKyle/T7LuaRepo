require( "ui.T6.CoDBase" )

CoD.LiveNotifications = {}
CoD.LiveNotifications.NotifyInTime = 250
CoD.LiveNotifications.NotifyVisibleTime = 2500
CoD.LiveNotifications.NotifyOutTime = 250
CoD.LiveNotifications.NotifyImageHeight = 64
CoD.LiveNotifications.NotifyimageWidth = 256
CoD.LiveNotifications.NotifyimageTop = -150
CoD.LiveNotifications.NotificationFontName = "Default"
CoD.LiveNotifications.NotificationFont = CoD.fonts[CoD.LiveNotifications.NotificationFontName]
CoD.LiveNotifications.NotificationFontHeight = CoD.textSize[CoD.LiveNotifications.NotificationFontName]
CoD.LiveNotifications.backgroundImage = "black"
CoD.LiveNotifications.BorderWidth = 5
CoD.LiveNotifications.Queue = {}
CoD.LiveNotifications.QueueBusy = false
CoD.LiveNotifications.Interval = 200
CoD.LiveNotifications.DisplayNotifyMessage = function ( self, event )
	Engine.PlaySound( "uin_alert_slideout" )
	local imageTop = CoD.LiveNotifications.NotifyimageTop
	local halfWidth = CoD.LiveNotifications.NotifyimageWidth / 2
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, CoD.LiveNotifications.NotifyimageWidth )
	background:setTopBottom( false, true, imageTop, imageTop + CoD.LiveNotifications.NotifyImageHeight )
	background:setImage( RegisterMaterial( CoD.LiveNotifications.backgroundImage ) )
	background:setAlpha( 0.7 )
	local notifyText = LUI.UIText.new()
	notifyText:setLeftRight( true, false, CoD.LiveNotifications.BorderWidth, CoD.LiveNotifications.NotifyimageWidth - 2 * CoD.LiveNotifications.BorderWidth )
	notifyText:setTopBottom( false, true, imageTop, imageTop + CoD.LiveNotifications.NotificationFontHeight )
	if CoD.isPC then
		notifyText:setAlignment( LUI.Alignment.Center )
	else
		notifyText:setAlignment( LUI.Alignment.Left )
	end
	notifyText:setFont( CoD.LiveNotifications.NotificationFont )
	notifyText:setText( event.message )
	local container = LUI.UIElement.new()
	container:setLeftRight( false, false, -halfWidth, halfWidth )
	container:setTopBottom( false, true, 0, CoD.LiveNotifications.NotifyImageHeight )
	container:setPriority( 50000 )
	container:addElement( background )
	container:addElement( notifyText )
	container:registerEventHandler( "outState", CoD.LiveNotifications.NotifyOut )
	container:registerEventHandler( "done", CoD.LiveNotifications.UpdateQueue )
	container:registerAnimationState( "in", {
		alpha = 1
	} )
	container:registerAnimationState( "out", {
		alpha = 0
	} )
	container:setPriority( 50000 )
	container:animateToState( "in", CoD.LiveNotifications.NotifyInTime )
	container:addElement( LUI.UITimer.new( CoD.LiveNotifications.NotifyVisibleTime - CoD.LiveNotifications.NotifyInTime - CoD.LiveNotifications.NotifyOutTime, "outState", true ) )
	self:addElement( container )
end

CoD.LiveNotifications.UpdateQueue = function ( self, event )
	CoD.LiveNotifications.QueueBusy = false
	CoD.LiveNotifications.ProcessQueue()
end

CoD.LiveNotifications.NotifyOut = function ( self, event )
	self:animateToState( "out", CoD.LiveNotifications.NotifyOutTime, true, false )
	self:addElement( LUI.UITimer.new( CoD.LiveNotifications.NotifyOutTime + CoD.LiveNotifications.Interval, "done", true ) )
end

CoD.LiveNotifications.NotifyMessage = function ( self, event )
	CoD.LiveNotifications.EnqueueNotifyMessage( self, event )
	CoD.LiveNotifications.ProcessQueue()
end

CoD.LiveNotifications.EnqueueNotifyMessage = function ( self, new_event )
	table.insert( CoD.LiveNotifications.Queue, {
		parent = self,
		event = new_event
	} )
end

CoD.LiveNotifications.ProcessQueue = function ()
	if not CoD.LiveNotifications.QueueBusy and #CoD.LiveNotifications.Queue > 0 then
		CoD.LiveNotifications.QueueBusy = true
		local queuedevent = CoD.LiveNotifications.Queue[1]
		table.remove( CoD.LiveNotifications.Queue, 1 )
		if queuedevent.parent ~= nil and queuedevent.event ~= nil then
			CoD.LiveNotifications.DisplayNotifyMessage( queuedevent.parent, queuedevent.event )
		end
	end
end

