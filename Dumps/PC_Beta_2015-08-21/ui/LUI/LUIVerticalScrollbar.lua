LUI.UIVerticalScrollbar = {}
LUI.UIVerticalScrollbar.InactiveDelay = 500
LUI.UIVerticalScrollbar.InactiveDuration = 250
LUI.UIVerticalScrollbar.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7 )
	local self = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = f1_arg2,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = f1_arg6
	} )
	self.id = "LUIVerticalScrollbar"
	self:registerAnimationState( "inactive", {
		left = 0,
		right = f1_arg1,
		leftAnchor = false,
		rightAnchor = true,
		alpha = f1_arg7
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
		red = f1_arg3,
		green = f1_arg4,
		blue = f1_arg5
	} )
	self:addElement( self.image )
	self.verticalList = f1_arg0
	self:registerEventHandler( "list_scroll", LUI.UIVerticalScrollbar.UpdateScrollbar )
	self:registerEventHandler( "focus_changed", LUI.UIVerticalScrollbar.FocusChanged )
	self:registerEventHandler( "inactive", LUI.UIVerticalScrollbar.Inactive )
	return self
end

LUI.UIVerticalScrollbar.UpdateScrollbar = function ( f2_arg0, f2_arg1 )
	if f2_arg1.list == f2_arg0.verticalList then
		if f2_arg1.noScroll then
			f2_arg0.image:setAlpha( 0 )
		else
			f2_arg0.image:setAlpha( 1 )
		end
		f2_arg0.image:registerAnimationState( "default", {
			top = f2_arg1.scrollHandlePosition,
			bottom = f2_arg1.scrollHandlePosition + f2_arg1.scrollHandleSize,
			topAnchor = true,
			bottomAnchor = false
		} )
		f2_arg0.image:animateToState( "default" )
	end
	f2_arg0:dispatchEventToChildren( f2_arg1 )
end

LUI.UIVerticalScrollbar.FocusChanged = function ( f3_arg0, f3_arg1 )
	if not CoD.useController then
		f3_arg0:animateToState( "default" )
	end
	if f3_arg0.inactiveTimer then
		f3_arg0.inactiveTimer:close()
		f3_arg0.inactiveTimer:reset()
		f3_arg0:addElement( f3_arg0.inactiveTimer )
	else
		f3_arg0.inactiveTimer = LUI.UITimer.new( LUI.UIVerticalScrollbar.InactiveDelay, "inactive", true )
		f3_arg0:addElement( f3_arg0.inactiveTimer )
	end
end

LUI.UIVerticalScrollbar.Inactive = function ( f4_arg0, f4_arg1 )
	f4_arg0:animateToState( "inactive", LUI.UIVerticalScrollbar.InactiveDuration )
end

