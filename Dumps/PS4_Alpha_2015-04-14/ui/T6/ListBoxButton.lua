CoD.ListBoxButton = {}
CoD.ListBoxButton.click = function ( button, event )
	button:dispatchEventToParent( {
		name = event.name,
		controller = event.controller,
		mutables = button.body.m_mutables
	} )
	button.body:processEvent( event )
end

CoD.ListBoxButton.unclick = function ( button, event )
	button:animateToState( "button_highlighted", 5 )
	button.body:processEvent( event )
end

CoD.ListBoxButton.gainFocus = function ( button, event )
	local retVal = LUI.UIElement.gainFocus( button, event )
	button.body.buttonBorder:animateToState( "bg_highlighted", 0 )
	button:animateToState( "button_highlighted", 0 )
	button:dispatchEventToParent( {
		name = "listbox_button_gain_focus",
		controller = event.controller,
		mutables = button.body.m_mutables
	} )
	return retVal
end

CoD.ListBoxButton.loseFocus = function ( button, event )
	LUI.UIElement.loseFocus( button, event )
	button.body.buttonBorder:animateToState( "bg_not_highlighted", 0 )
	button:animateToState( "button_not_highlighted", 0 )
	button:dispatchEventToParent( {
		name = "listbox_button_lose_focus",
		controller = event.controller,
		mutables = button.body.m_mutables
	} )
end

CoD.ListBoxButton.setVisible = function ( button, vis )
	if vis == true then
		if button.m_visible == false then
			button:addElement( button.body )
			button.m_visible = true
		end
		button:makeFocusable()
	else
		if button.body ~= nil and button.m_visible == true then
			button:removeElement( button.body )
			button.m_visible = false
		end
		button:makeNotFocusable()
	end
end

CoD.ListBoxButton.GetBodyUIElement = function ( self )
	if self ~= nil then
		return self.body
	else
		return nil
	end
end

CoD.ListBoxButton.GetBackgroundUIImage = function ( self )
	if self ~= nil and self.body ~= nil then
		return self.body.buttonBg
	else
		return nil
	end
end

CoD.ListBoxButton.DisableHighlighting = function ( self )
	if self:getBackgroundUIImage() ~= nil then
		local f8_local0 = self:getBackgroundUIImage()
		f8_local0:registerAnimationState( "bg_highlighted", {} )
		f8_local0 = self:getBackgroundUIImage()
		f8_local0:registerAnimationState( "bg_not_highlighted", {} )
	end
end

CoD.ListBoxButton.DisableZooming = function ( self )
	self:registerAnimationState( "button_clicked", {} )
end

CoD.ListBoxButton.MouseEnter = function ( button, event )
	button:dispatchEventToParent( {
		name = "listbox_button_mouseenter",
		controller = event.controller,
		button = button
	} )
end

CoD.ListBoxButton.LeftMouseUp = function ( button, event )
	if button.m_visible then
		button:dispatchEventToParent( {
			name = "listbox_button_clicked",
			controller = event.controller,
			button = button
		} )
	end
end

CoD.ListBoxButton.new = function ( defaultAnimationState, highlightedZ, dataCallback )
	local button = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	button.body = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	button.id = "ListBoxButton"
	button.m_visible = false
	button.backgroundHighlightAlpha = 0.5
	button.backgroundNonHighlightAlpha = 0.2
	button.getBodyUIElement = CoD.ListBoxButton.GetBodyUIElement
	button.getBackgroundUIImage = CoD.ListBoxButton.GetBackgroundUIImage
	button.disableHighlighting = CoD.ListBoxButton.DisableHighlighting
	button.disableZooming = CoD.ListBoxButton.DisableZooming
	button:makeNotFocusable()
	button.getData = dataCallback
	button.setVisible = CoD.ListBoxButton.setVisible
	local buttonBg = LUI.UIImage.new()
	buttonBg:setLeftRight( true, true, 0, 0 )
	buttonBg:setTopBottom( true, true, 0, 0 )
	buttonBg:setAlpha( 0.1 )
	buttonBg:setRGB( 0, 0, 0 )
	local buttonBgGrad = LUI.UIImage.new()
	buttonBgGrad:setLeftRight( true, true, 0, 0 )
	buttonBgGrad:setTopBottom( true, true, 0, 0 )
	buttonBgGrad:setAlpha( 0.1 )
	buttonBgGrad:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	local buttonBorder = CoD.BorderT6.new( 1, CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b, 0 )
	buttonBorder:registerAnimationState( "bg_highlighted", {
		alpha = 1
	} )
	buttonBorder:registerAnimationState( "bg_not_highlighted", {
		alpha = 0
	} )
	button:registerAnimationState( "button_highlighted", {
		zoom = highlightedZ
	} )
	button:registerAnimationState( "button_not_highlighted", {
		zoom = 0
	} )
	button:registerAnimationState( "button_clicked", {
		zoom = -5
	} )
	button.body.buttonBorder = buttonBorder
	button.body.buttonBg = buttonBg
	button.body:addElement( buttonBg )
	button.body:addElement( buttonBgGrad )
	button.body:addElement( buttonBorder )
	button:registerEventHandler( "gain_focus", CoD.ListBoxButton.gainFocus )
	button:registerEventHandler( "lose_focus", CoD.ListBoxButton.loseFocus )
	button:registerEventHandler( "click", CoD.ListBoxButton.click )
	button:registerEventHandler( "unclick", CoD.ListBoxButton.unclick )
	if CoD.useMouse then
		button:setHandleMouse( true )
		button:registerEventHandler( "mouseenter", CoD.ListBoxButton.MouseEnter )
		button:registerEventHandler( "leftmouseup", CoD.ListBoxButton.LeftMouseUp )
		button:registerEventHandler( "leftmousedown", CoD.NullFunction )
	end
	return button
end

