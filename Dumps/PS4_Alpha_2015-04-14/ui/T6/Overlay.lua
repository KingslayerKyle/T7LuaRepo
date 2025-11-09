CoD.Overlay = {}
CoD.Overlay.new = function ( frame, defaultAnimationState )
	local overlay = LUI.UIElement.new( defaultAnimationState )
	overlay.frame = frame
	overlay.leftButtonBar = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		spacing = 10
	} )
	overlay.rightButtonBar = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		spacing = 10,
		alignment = LUI.Alignment.Right
	} )
	overlay.frame.buttonPrompts:addElement( overlay.leftButtonBar )
	overlay.frame.buttonPrompts:addElement( overlay.rightButtonBar )
	overlay.close = CoD.Overlay.Close
	overlay.addBackButton = CoD.Overlay.AddBackButton
	overlay:registerEventHandler( "overlay_opening", CoD.Overlay.Opening )
	overlay:registerEventHandler( "overlay_closed", CoD.Overlay.Closed )
	overlay:registerEventHandler( "button_prompt_back", CoD.Overlay.Close )
	overlay:addBackButton()
	return overlay
end

CoD.Overlay.Opening = function ( self, event )
	self:addElement( LUI.UITimer.new( event.time, "overlay_opened", true ) )
	if self.title ~= nil then
		self.frame:fadeInTitle( self.title, event.time )
	end
end

CoD.Overlay.Closed = function ( self, event )
	self.leftButtonBar:close()
	self.rightButtonBar:close()
end

CoD.Overlay.Close = function ( self )
	self.frame:closeOverlay( self )
end

CoD.Overlay.AddBackButton = function ( self )
	self.backButton = CoD.ButtonPrompt.new( "secondary", "Back", self, "button_prompt_back" )
	self.leftButtonBar:addElement( self.backButton )
end

