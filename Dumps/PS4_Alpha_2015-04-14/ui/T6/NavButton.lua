require( "ui.T6.SideBracketsImage" )

CoD.NavButton = {}
CoD.NavButton.BracketAnimDistance = 50
CoD.NavButton.ButtonOverAnimTime = 150
CoD.NavButton.ButtonActionSFX = "uin_main_enter"
CoD.NavButton.NormalTextFontName = "Condensed"
CoD.NavButton.SelectedTextFontName = "Big"
CoD.NavButton.new = function ( defaultAnimationState, buttonLabel, actionEventName, animDistance, animTime )
	if defaultAnimationState == nil then
		defaultAnimationState = CoD.GetDefaultAnimationState()
	end
	local button = LUI.UIButton.new( defaultAnimationState, actionEventName )
	button.id = "NavButton." .. buttonLabel
	button.m_animDist = CoD.NavButton.BracketAnimDistance
	if animDistance ~= nil then
		button.m_animDist = animDistance
	end
	button.m_animTime = CoD.NavButton.ButtonOverAnimTime
	if animTime ~= nil then
		button.m_animTime = animTime
	end
	local normalTextFontName = CoD.NavButton.NormalTextFontName
	local selectedTextFontName = CoD.NavButton.SelectedTextFontName
	local f1_local0 = {}
	local textDim = GetTextDimensions( buttonLabel, CoD.fonts[selectedTextFontName], CoD.textSize[selectedTextFontName] )
	button.m_textWidth = textDim[3] + 30
	local container = LUI.UIElement.new( {
		left = -button.m_textWidth / 2,
		right = button.m_textWidth / 2,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		topAnchor = true,
		bottomAnchor = true
	} )
	container:setUseStencil( true )
	button.container = container
	button:addElement( container )
	container:registerAnimationState( "carousel_set_start", {
		left = -10,
		right = 10,
		leftAnchor = false,
		rightAnchor = false
	} )
	container:registerAnimationState( "closed", {
		left = -10,
		right = 10,
		leftAnchor = false,
		rightAnchor = false
	} )
	container:registerAnimationState( "not_selected", {
		left = -(button.m_textWidth / 2) - button.m_animDist,
		right = button.m_textWidth / 2 + button.m_animDist,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		topAnchor = true,
		bottomAnchor = true
	} )
	container:registerAnimationState( "selected", {
		left = -button.m_textWidth / 2,
		right = button.m_textWidth / 2,
		top = 0,
		bottom = 0,
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true
	} )
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
	local labelText = LUI.UIText.new( {
		left = 0,
		right = 0,
		top = -CoD.textSize[normalTextFontName] / 2,
		bottom = CoD.textSize[normalTextFontName] / 2,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		red = CoD.DisabledTextColor.r,
		green = CoD.DisabledTextColor.g,
		blue = CoD.DisabledTextColor.b,
		font = CoD.fonts[normalTextFontName],
		alpha = CoD.DisabledAlpha
	} )
	labelText:registerAnimationState( "selected", {
		left = 0,
		right = 0,
		top = -CoD.textSize[selectedTextFontName] / 2,
		bottom = CoD.textSize[selectedTextFontName] / 2,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts[selectedTextFontName],
		red = CoD.trueOrange.r,
		green = CoD.trueOrange.g,
		blue = CoD.trueOrange.b,
		alpha = 1
	} )
	labelText:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	labelText:registerAnimationState( "fade_out", {
		alpha = 0
	} )
	labelText:setText( buttonLabel )
	button.labelText = labelText
	container:addElement( labelText )
	container:registerEventHandler( "transition_complete_closed", CoD.NavButton.Container_ClosedComplete )
	button:registerEventHandler( "button_action", CoD.NavButton.ButtonAction )
	button:registerEventHandler( "dispatch_action_event", CoD.NavButton.DispatchActionEvent )
	button:registerEventHandler( "gain_focus", CoD.NavButton.GainFocus )
	button:registerEventHandler( "lose_focus", CoD.NavButton.LoseFocus )
	button.openButton = CoD.NavButton.OpenButton
	button.closeButton = CoD.NavButton.CloseButton
	button.setupCarouselMode = CoD.NavButton.SetupCarouselMode
	button.setSFX = CoD.NavButton.SetSFX
	return button
end

CoD.NavButton.ButtonAction = function ( navButton, event )
	if navButton.m_sfxName ~= nil then
		Engine.PlaySound( navButton.m_sfxName )
	else
		Engine.PlaySound( CoD.NavButton.ButtonActionSFX )
	end
	if navButton.m_isClosed == true then
		navButton:openButton()
		navButton.m_isClosed = nil
	else
		navButton:closeButton()
		navButton.m_ownerController = event.controller
		navButton.m_isClosed = true
	end
end

CoD.NavButton.DispatchActionEvent = function ( navButton )
	if navButton.actionEventName ~= nil then
		navButton:dispatchEventToParent( {
			name = navButton.actionEventName,
			controller = navButton.m_ownerController,
			button = navButton
		} )
	end
end

CoD.NavButton.Container_ClosedComplete = function ( container, event )
	container:dispatchEventToParent( {
		name = "dispatch_action_event"
	} )
end

CoD.NavButton.OpenButton = function ( navButton, duration )
	if duration == nil then
		duration = navButton.m_animTime
	end
	navButton.labelText:animateToState( "selected", duration )
	navButton.brackets:animateToState( "selected", duration )
	navButton.container:animateToState( "selected", duration )
end

CoD.NavButton.CloseButton = function ( navButton, duration )
	if duration == nil then
		duration = navButton.m_animTime
	end
	navButton.container:animateToState( "closed", duration )
	navButton.labelText:animateToState( "fade_out", duration )
end

CoD.NavButton.SetupCarouselMode = function ( navButton )
	navButton:registerEventHandler( "gain_focus", CoD.NavButton.CarouselMode_GainFocus )
	navButton:registerEventHandler( "lose_focus", CoD.NavButton.CarouselMode_LoseFocus )
	navButton:registerEventHandler( "carousel_scroll_complete", CoD.NavButton.CarouselScrollComplete )
	navButton:registerEventHandler( "carousel_mouse_enter", CoD.NavButton.CarouselMouseEnter )
	navButton:registerEventHandler( "carousel_mouse_leave", CoD.NavButton.CarouselMouseLeave )
end

CoD.NavButton.SetSFX = function ( navButton, sfxName )
	navButton.m_sfxName = sfxName
end

CoD.NavButton.CarouselMode_GainFocus = function ( navButton, event )
	local retVal = LUI.UIElement.gainFocus( navButton, event )
	navButton.labelText:animateToState( "selected", navButton.m_animTime )
	return retVal
end

CoD.NavButton.GainFocus = function ( navButton, event )
	local retVal = LUI.UIElement.gainFocus( navButton, event )
	navButton.labelText:animateToState( "selected", navButton.m_animTime )
	navButton.brackets:animateToState( "selected", navButton.m_animTime )
	navButton.container:animateToState( "selected", navButton.m_animTime )
	return retVal
end

CoD.NavButton.CarouselMode_LoseFocus = function ( navButton, event )
	LUI.UIElement.loseFocus( navButton, event )
	navButton.labelText:animateToState( "default", navButton.m_animTime )
	navButton.brackets:animateToState( "not_selected" )
	navButton.container:animateToState( "not_selected" )
end

CoD.NavButton.LoseFocus = function ( navButton, event )
	LUI.UIElement.loseFocus( navButton, event )
	navButton.labelText:animateToState( "default", navButton.m_animTime )
	navButton.brackets:animateToState( "not_selected" )
	navButton.container:animateToState( "not_selected" )
end

CoD.NavButton.CarouselScrollComplete = function ( navButton, event )
	navButton.brackets:animateToState( "selected", navButton.m_animTime )
	navButton.container:animateToState( "selected", navButton.m_animTime )
end

CoD.NavButton.CarouselMouseEnter = function ( navButton, event )
	local fontSize = nil
	if event.isSelected then
		fontSize = CoD.textSize[CoD.NavButton.SelectedTextFontName] * 1.1
	else
		fontSize = CoD.textSize[CoD.NavButton.NormalTextFontName] * 1.2
	end
	local labelText = navButton.labelText
	labelText:beginAnimation( "mouse_highlight", navButton.m_animTime )
	labelText:setTopBottom( false, false, -fontSize / 2, fontSize / 2 )
end

CoD.NavButton.CarouselMouseLeave = function ( navButton, event )
	if event.isSelected then
		navButton.labelText:animateToState( "selected", navButton.m_animTime )
	else
		navButton.labelText:animateToState( "default", navButton.m_animTime )
	end
end

