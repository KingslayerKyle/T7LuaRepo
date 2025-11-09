require( "ui.T6.SideBracketsImage" )

CoD.ImageNavButton = {}
CoD.ImageNavButton.BracketAnimDistance = 50
CoD.ImageNavButton.ButtonOverAnimTime = 150
CoD.ImageNavButton.ButtonActionSFX = "uin_main_enter"
CoD.ImageNavButton.new = function ( defaultAnimationState, buttonLabel, actionEventName, animDistance, animTime )
	if defaultAnimationState == nil then
		defaultAnimationState = CoD.GetDefaultAnimationState()
	end
	local button = LUI.UIButton.new( defaultAnimationState, actionEventName )
	button.id = "ImageNavButton." .. buttonLabel
	button.m_animDist = CoD.ImageNavButton.BracketAnimDistance
	if animDistance ~= nil then
		button.m_animDist = animDistance
	end
	button.m_animTime = CoD.ImageNavButton.ButtonOverAnimTime
	if animTime ~= nil then
		button.m_animTime = animTime
	end
	local container = LUI.UIElement.new( defaultAnimationState )
	button.container = container
	button:addElement( container )
	container:registerAnimationState( "carousel_set_start", defaultAnimationState )
	container:registerAnimationState( "closed", defaultAnimationState )
	container:registerAnimationState( "not_selected", {
		left = -button.m_animDist,
		right = button.m_animDist,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		topAnchor = true,
		bottomAnchor = true
	} )
	container:registerAnimationState( "selected", defaultAnimationState )
	container:animateToState( "not_selected" )
	local brackets = CoD.SideBracketsImage.new()
	brackets:registerAnimationState( "not_selected", {
		alpha = 0
	} )
	brackets:registerAnimationState( "selected", {
		alpha = 1
	} )
	brackets:animateToState( "not_selected" )
	button.brackets = brackets
	container:addElement( brackets )
	local labelImage = LUI.UIStreamedImage.new( {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		alpha = 0.8,
		material = RegisterMaterial( buttonLabel )
	} )
	labelImage:registerAnimationState( "selected", {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		alpha = 1,
		material = RegisterMaterial( buttonLabel )
	} )
	labelImage:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	labelImage:registerAnimationState( "fade_out", {
		alpha = 0
	} )
	button.labelImage = labelImage
	container:addElement( labelImage )
	container:registerEventHandler( "transition_complete_closed", CoD.ImageNavButton.Container_ClosedComplete )
	button:registerEventHandler( "button_action", CoD.ImageNavButton.ButtonAction )
	button:registerEventHandler( "dispatch_action_event", CoD.ImageNavButton.DispatchActionEvent )
	button:registerEventHandler( "gain_focus", CoD.ImageNavButton.GainFocus )
	button:registerEventHandler( "lose_focus", CoD.ImageNavButton.LoseFocus )
	button.openButton = CoD.ImageNavButton.OpenButton
	button.closeButton = CoD.ImageNavButton.CloseButton
	button.setupCarouselMode = CoD.ImageNavButton.SetupCarouselMode
	button.setSFX = CoD.ImageNavButton.SetSFX
	return button
end

CoD.ImageNavButton.ButtonAction = function ( ImageNavButton, event )
	if ImageNavButton.m_sfxName ~= nil then
		Engine.PlaySound( ImageNavButton.m_sfxName )
	else
		Engine.PlaySound( CoD.ImageNavButton.ButtonActionSFX )
	end
	if ImageNavButton.m_isClosed == true then
		ImageNavButton:openButton()
		ImageNavButton.m_isClosed = nil
	else
		ImageNavButton:closeButton()
		ImageNavButton.m_ownerController = event.controller
		ImageNavButton.m_isClosed = true
	end
end

CoD.ImageNavButton.DispatchActionEvent = function ( navButton )
	if navButton.actionEventName ~= nil then
		navButton:dispatchEventToParent( {
			name = navButton.actionEventName,
			controller = navButton.m_ownerController,
			button = navButton
		} )
	end
end

CoD.ImageNavButton.Container_ClosedComplete = function ( container, event )
	container:dispatchEventToParent( {
		name = "dispatch_action_event"
	} )
end

CoD.ImageNavButton.OpenButton = function ( navButton, duration )
	if duration == nil then
		duration = navButton.m_animTime
	end
	navButton.labelImage:animateToState( "selected", duration )
	navButton.brackets:animateToState( "selected", duration )
	navButton.container:animateToState( "selected", duration )
end

CoD.ImageNavButton.CloseButton = function ( navButton, duration )
	if duration == nil then
		duration = navButton.m_animTime
	end
	navButton.container:animateToState( "closed", duration )
	navButton.labelImage:animateToState( "fade_out", duration )
end

CoD.ImageNavButton.SetupCarouselMode = function ( navButton )
	navButton:registerEventHandler( "gain_focus", CoD.ImageNavButton.CarouselMode_GainFocus )
	navButton:registerEventHandler( "lose_focus", CoD.ImageNavButton.CarouselMode_LoseFocus )
	navButton:registerEventHandler( "carousel_scroll_complete", CoD.ImageNavButton.CarouselScrollComplete )
end

CoD.ImageNavButton.SetSFX = function ( navButton, sfxName )
	navButton.m_sfxName = sfxName
end

CoD.ImageNavButton.CarouselMode_GainFocus = function ( navButton, event )
	local retVal = LUI.UIElement.gainFocus( navButton, event )
	navButton.labelImage:animateToState( "selected", navButton.m_animTime )
	return retVal
end

CoD.ImageNavButton.GainFocus = function ( navButton, event )
	local retVal = LUI.UIElement.gainFocus( navButton, event )
	navButton.labelImage:animateToState( "selected", navButton.m_animTime )
	navButton.brackets:animateToState( "selected", navButton.m_animTime )
	navButton.container:animateToState( "selected", navButton.m_animTime )
	return retVal
end

CoD.ImageNavButton.CarouselMode_LoseFocus = function ( navButton, event )
	LUI.UIElement.loseFocus( navButton, event )
	navButton.labelImage:animateToState( "default", navButton.m_animTime )
	navButton.brackets:animateToState( "not_selected" )
	navButton.container:animateToState( "not_selected" )
end

CoD.ImageNavButton.LoseFocus = function ( navButton, event )
	LUI.UIElement.loseFocus( navButton, event )
	navButton.labelImage:animateToState( "default", navButton.m_animTime )
	navButton.brackets:animateToState( "not_selected" )
	navButton.container:animateToState( "not_selected" )
end

CoD.ImageNavButton.CarouselScrollComplete = function ( navButton, event )
	navButton.brackets:animateToState( "selected", navButton.m_animTime )
	navButton.container:animateToState( "selected", navButton.m_animTime )
end

