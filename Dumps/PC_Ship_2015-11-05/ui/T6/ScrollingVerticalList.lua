CoD.ScrollingVerticalList = {}
CoD.ScrollingVerticalList.ScrollBarWidth = 4
CoD.ScrollingVerticalList.ScrollBarInactiveWidth = 2
CoD.ScrollingVerticalList.new = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
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
		spacing = controller
	} )
	verticalList:setUseStencil( true )
	self:addElement( verticalList )
	self.verticalList = verticalList
	
	self[verticalList.id] = verticalList
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

CoD.ScrollingVerticalList.AddElementToList = function ( f2_arg0, f2_arg1 )
	f2_arg0.verticalList:addElement( f2_arg1 )
	f2_arg0.verticalList[f2_arg1.id] = f2_arg1
	if f2_arg1.m_focusable then
		local self = LUI.UIElement.new()
		self.id = "ScrollingVerticalList_GainFocusListener"
		self:registerEventHandler( "gain_focus", CoD.ScrollingVerticalList.GainFocusListenerTriggered )
		self.scrollbar = f2_arg0.scrollbar
		f2_arg1:addElement( self )
	end
end

CoD.ScrollingVerticalList.GainFocusListenerTriggered = function ( f3_arg0, f3_arg1 )
	f3_arg0.scrollbar:processEvent( {
		name = "focus_changed"
	} )
end

