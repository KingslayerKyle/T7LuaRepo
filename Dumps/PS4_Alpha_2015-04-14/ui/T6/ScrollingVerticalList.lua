CoD.ScrollingVerticalList = {}
CoD.ScrollingVerticalList.ScrollBarWidth = 4
CoD.ScrollingVerticalList.ScrollBarInactiveWidth = 2
CoD.ScrollingVerticalList.new = function ( defaultAnimationState, spacing )
	local self = LUI.UIElement.new( defaultAnimationState )
	self.id = "ScrollingVerticalList"
	
	local verticalList = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = spacing
	} )
	verticalList:setUseStencil( true )
	self:addElement( verticalList )
	self.verticalList = verticalList
	
	verticalList:addElement( LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} ) )
	verticalList:addElement( LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} ) )
	
	local scrollbar = LUI.UIVerticalScrollbar.new( verticalList, CoD.ScrollingVerticalList.ScrollBarInactiveWidth, CoD.ScrollingVerticalList.ScrollBarWidth, 1, 1, 1, 0.5, 0.1 )
	self:addElement( scrollbar )
	self.scrollbar = scrollbar
	
	self.addElementToList = CoD.ScrollingVerticalList.AddElementToList
	return self
end

CoD.ScrollingVerticalList.AddElementToList = function ( self, childElement )
	self.verticalList:addElement( childElement )
	if childElement.m_focusable then
		local gainFocusListener = LUI.UIElement.new()
		gainFocusListener.id = "ScrollingVerticalList_GainFocusListener"
		gainFocusListener:registerEventHandler( "gain_focus", CoD.ScrollingVerticalList.GainFocusListenerTriggered )
		gainFocusListener.scrollbar = self.scrollbar
		childElement:addElement( gainFocusListener )
	end
end

CoD.ScrollingVerticalList.GainFocusListenerTriggered = function ( self, event )
	self.scrollbar:processEvent( {
		name = "focus_changed"
	} )
end

