LUI.UIVerticalScrollbar = {}
LUI.UIVerticalScrollbar.InactiveDelay = 500
LUI.UIVerticalScrollbar.InactiveDuration = 250
LUI.UIVerticalScrollbar.new = function ( verticalList, scrollbarInactiveWidth, scrollBarWidth, red, green, blue, activeAlpha, inactiveAlpha )
	local self = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = scrollBarWidth,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = activeAlpha
	} )
	self.id = "LUIVerticalScrollbar"
	self:registerAnimationState( "inactive", {
		left = 0,
		right = scrollbarInactiveWidth,
		leftAnchor = false,
		rightAnchor = true,
		alpha = inactiveAlpha
	} )
	self:animateToState( "inactive" )
	self.image = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		red = red,
		green = green,
		blue = blue
	} )
	self:addElement( self.image )
	self.verticalList = verticalList
	self:registerEventHandler( "list_scroll", LUI.UIVerticalScrollbar.UpdateScrollbar )
	self:registerEventHandler( "focus_changed", LUI.UIVerticalScrollbar.FocusChanged )
	self:registerEventHandler( "inactive", LUI.UIVerticalScrollbar.Inactive )
	return self
end

LUI.UIVerticalScrollbar.UpdateScrollbar = function ( self, event )
	if event.list == self.verticalList then
		if event.noScroll then
			self.image:setAlpha( 0 )
		else
			self.image:setAlpha( 1 )
		end
		self.image:registerAnimationState( "default", {
			top = event.scrollHandlePosition,
			bottom = event.scrollHandlePosition + event.scrollHandleSize,
			topAnchor = true,
			bottomAnchor = false
		} )
		self.image:animateToState( "default" )
	end
	self:dispatchEventToChildren( event )
end

LUI.UIVerticalScrollbar.FocusChanged = function ( self, event )
	if not CoD.useController then
		self:animateToState( "default" )
	end
	if self.inactiveTimer then
		self.inactiveTimer:close()
		self.inactiveTimer:reset()
		self:addElement( self.inactiveTimer )
	else
		self.inactiveTimer = LUI.UITimer.new( LUI.UIVerticalScrollbar.InactiveDelay, "inactive", true )
		self:addElement( self.inactiveTimer )
	end
end

LUI.UIVerticalScrollbar.Inactive = function ( self, event )
	self:animateToState( "inactive", LUI.UIVerticalScrollbar.InactiveDuration )
end

