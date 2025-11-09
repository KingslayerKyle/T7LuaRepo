require( "ui.T6.SideBracketsImage" )

CoD.CoD9Button = {}
CoD.CoD9Button.Height = 30
CoD.CoD9Button.FontName = "Condensed"
CoD.CoD9Button.Font = CoD.fonts[CoD.CoD9Button.FontName]
CoD.CoD9Button.TextHeight = CoD.textSize[CoD.CoD9Button.FontName]
CoD.CoD9Button.BackgroundColor = {
	r = 1,
	g = 1,
	b = 1,
	a = 0.2
}
CoD.CoD9Button.BracketAnimDistance = 30
CoD.CoD9Button.ButtonOverAnimTime = 150
CoD.CoD9Button.BracketSpacer = 10
CoD.CoD9Button.PulseDuration = 650
CoD.CoD9Button.SetBracketContainerStates = function ( self, text, font, leftOffset )
	if font == nil then
		font = "Condensed"
	end
	local f1_local0 = {}
	local textDim = GetTextDimensions( text, CoD.fonts[font], CoD.textSize[font] )
	local textWidth = textDim[3]
	if leftOffset == nil then
		leftOffset = 0
	end
	self.container.leftOffset = leftOffset
	self.container.textWidth = textWidth
	self.container:setLeftRight( true, false, self.container.leftOffset - CoD.CoD9Button.BracketSpacer - CoD.CoD9Button.BracketAnimDistance, self.container.leftOffset + textWidth + CoD.CoD9Button.BracketSpacer + CoD.CoD9Button.BracketAnimDistance )
	self.container:setTopBottom( true, true, 0, 0 )
end

CoD.CoD9Button.SetLabel = function ( self, text, font, leftOffset )
	self.id = "CoD9Button." .. text
	self.label:setText( text )
	self.labelString = text
	CoD.CoD9Button.SetBracketContainerStates( self, text, font, leftOffset )
end

CoD.CoD9Button.Lock = function ( self )
	self:disable()
	self.lockImage = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -CoD.CoD9Button.Height,
		right = -6,
		topAnchor = true,
		bottomAnchor = true,
		top = 3,
		bottom = -3,
		material = RegisterMaterial( "lock" )
	} )
	self:addElement( self.lockImage )
	self:showNewIcon( false )
end

CoD.CoD9Button.ShowNewIcon = function ( self, show )
	if CoD.isSinglePlayer then
		self.newIcon = LUI.UIImage.new( {
			leftAnchor = false,
			rightAnchor = true,
			left = -CoD.CoD9Button.Height,
			right = 10,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0,
			material = RegisterMaterial( "menu_mp_lobby_new" )
		} )
		self:addElement( self.newIcon )
	elseif show and not self.lockImage then
		if not self.newIcon then
			self.newIcon = LUI.UIImage.new()
			self.newIcon:setLeftRight( true, false, self.container.textWidth + 10, self.container.textWidth + 10 + CoD.CACUtility.ButtonGridNewImageWidth )
			self.newIcon:setTopBottom( false, false, -CoD.CACUtility.ButtonGridNewImageHeight / 2, CoD.CACUtility.ButtonGridNewImageHeight / 2 )
			self.newIcon:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			self:addElement( self.newIcon )
		end
	elseif self.newIcon then
		self.newIcon:close()
		self.newIcon = nil
	end
end

CoD.CoD9Button.GainFocus = function ( self, event )
	local retVal = LUI.UIButton.gainFocus( self, event )
	if CoD.isZombie == true then
		self.brackets:beginAnimation( "selected", CoD.CoD9Button.ButtonOverAnimTime )
		self.brackets:setAlpha( 1 )
		self.container:beginAnimation( "selected", CoD.CoD9Button.ButtonOverAnimTime )
		self.container:setLeftRight( true, false, self.container.leftOffset - CoD.CoD9Button.BracketSpacer, self.container.leftOffset + self.container.textWidth + CoD.CoD9Button.BracketSpacer )
		self.container:setTopBottom( true, true, 0, 0 )
	end
	if self.background then
		self.background:beginAnimation( "selected", CoD.CoD9Button.ButtonOverAnimTime )
		self.background:setRGB( 1, 1, 1 )
		self.background:setAlpha( 1 )
	end
	self.buttonHasFocus = true
	CoD.CoD9Button.StartLabelPulse( self )
	self:dispatchEventToParent( {
		name = "button_gained_focus",
		button = self
	} )
	if self.disabled then
		self:dispatchEventToParent( {
			name = "COD9ButtonIsDisabled"
		} )
	elseif not self.actionPromptString then
		self:dispatchEventToParent( {
			name = "COD9ButtonIsEnabled"
		} )
	end
	return retVal
end

CoD.CoD9Button.LoseFocus = function ( self, event )
	LUI.UIButton.loseFocus( self, event )
	self:animateToState( "pulse_high", 1 )
	self:completeAnimation()
	self.buttonHasFocus = nil
	if CoD.isZombie == true then
		self.brackets:beginAnimation( "not_selected", CoD.CoD9Button.ButtonOverAnimTime )
		self.brackets:setAlpha( 0 )
		self.container:beginAnimation( "not_selected", CoD.CoD9Button.ButtonOverAnimTime )
		self.container:setLeftRight( true, false, self.container.leftOffset - CoD.CoD9Button.BracketSpacer - CoD.CoD9Button.BracketAnimDistance, self.container.leftOffset + self.container.textWidth + CoD.CoD9Button.BracketSpacer + CoD.CoD9Button.BracketAnimDistance )
		self.container:setTopBottom( true, true, 0, 0 )
	end
	if self.background then
		self.background:animateToState( "default", CoD.CoD9Button.ButtonOverAnimTime )
	end
end

CoD.CoD9Button.SetupTextElement = function ( textElement )
	textElement:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		alpha = 1
	} )
	local alphaDisabledValue = 0.5
	if CoD.isZombie then
		alphaDisabledValue = 0.3
		textElement:registerAnimationState( "button_over_disabled", {
			red = 0.18,
			green = 0.31,
			blue = 0.31,
			alpha = alphaDisabledValue
		} )
	end
	if CoD.isSinglePlayer then
		textElement:registerAnimationState( "disabled", {
			red = CoD.DisabledTextColor.r,
			green = CoD.DisabledTextColor.g,
			blue = CoD.DisabledTextColor.b
		} )
	else
		textElement:registerAnimationState( "disabled", {
			red = CoD.ButtonTextColor.r,
			green = CoD.ButtonTextColor.g,
			blue = CoD.ButtonTextColor.b,
			alpha = alphaDisabledValue
		} )
	end
	textElement.overDuration = CoD.CoD9Button.ButtonOverAnimTime
	textElement.upDuration = CoD.CoD9Button.ButtonOverAnimTime
	LUI.UIButton.SetupElement( textElement )
end

CoD.CoD9Button.StartAnimation = function ( self, prefix, duration, easeIn, easeOut )
	local suffix = ""
	if self.disabled == true then
		suffix = "_disabled"
	end
	self:animateToState( prefix .. suffix, duration, easeIn, easeOut )
end

CoD.CoD9Button.StartLabelPulse = function ( self )
	CoD.CoD9Button.StartAnimation( self, "pulse_high", 1 )
end

CoD.CoD9Button.TransitionCompletePulseHigh = function ( self, event )
	if event.interrupted ~= true then
		if self.buttonList ~= nil and self.buttonList.m_inputDisabled == true then
			CoD.CoD9Button.StartAnimation( self, "pulse_high", 1 )
		else
			CoD.CoD9Button.StartAnimation( self, "pulse_low", CoD.CoD9Button.PulseDuration, true, false )
		end
	end
end

CoD.CoD9Button.TransitionCompletePulseLow = function ( self, event )
	if event.interrupted ~= true then
		if self.buttonList ~= nil and self.buttonList.m_inputDisabled == true then
			CoD.CoD9Button.StartAnimation( self, "pulse_high", 1 )
		else
			CoD.CoD9Button.StartAnimation( self, "pulse_high", CoD.CoD9Button.PulseDuration, false, true )
		end
	end
end

CoD.CoD9Button.DisableInput = function ( self, event )
	if self.buttonHasFocus == true then
		CoD.CoD9Button.StartLabelPulse( self )
		if event.stopAnimation == true then
			self:completeAnimation()
		end
	end
end

CoD.CoD9Button.EnableInput = function ( self, event )
	if self.buttonHasFocus == true then
		CoD.CoD9Button.StartLabelPulse( self )
	end
end

CoD.CoD9Button.AddBackgroundElement = function ( self, animationState )
	if self.background or not animationState then
		return 
	elseif animationState.alpha == nil then
		animationState.alpha = 0
	end
	self.background = LUI.UIImage.new( animationState )
	LUI.UIButton.SetupElement( self.background )
	self.backgroundContainer:addElement( self.background )
end

CoD.CoD9Button.new = function ( defaultAnimationState, actionEventName, centerTextElement, menu, controller )
	local CoD9Button = LUI.UIButton.new( defaultAnimationState, actionEventName )
	CoD9Button.id = "CoD9Button"
	CoD9Button.setLabel = CoD.CoD9Button.SetLabel
	CoD9Button.lock = CoD.CoD9Button.Lock
	CoD9Button.showNewIcon = CoD.CoD9Button.ShowNewIcon
	CoD9Button.showZMNewIcon = CoD.CoD9Button.ShowZMNewIcon
	CoD9Button.showStarIcon = CoD.CoD9Button.ShowStarIcon
	CoD9Button.showRestrictedIcon = CoD.CoD9Button.ShowRestrictedIcon
	CoD9Button.addBackground = CoD.CoD9Button.AddBackgroundElement
	CoD9Button:registerEventHandler( "disable_input", CoD.CoD9Button.DisableInput )
	CoD9Button:registerEventHandler( "enable_input", CoD.CoD9Button.EnableInput )
	CoD9Button:registerEventHandler( "gain_focus", CoD.CoD9Button.GainFocus )
	CoD9Button:registerEventHandler( "lose_focus", CoD.CoD9Button.LoseFocus )
	local alphaHighDisabledValue = 0.5
	local alphaLowDisabledValue = 0.25
	if CoD.isZombie then
		alphaHighDisabledValue = 1
		alphaLowDisabledValue = 0.5
	end
	CoD9Button:registerAnimationState( "pulse_high", {
		alpha = 1
	} )
	CoD9Button:registerAnimationState( "pulse_low", {
		alpha = 0.5
	} )
	CoD9Button:registerAnimationState( "pulse_high_disabled", {
		alpha = alphaHighDisabledValue
	} )
	CoD9Button:registerAnimationState( "pulse_low_disabled", {
		alpha = alphaLowDisabledValue
	} )
	CoD9Button:registerEventHandler( "transition_complete_pulse_high", CoD.CoD9Button.TransitionCompletePulseHigh )
	CoD9Button:registerEventHandler( "transition_complete_pulse_low", CoD.CoD9Button.TransitionCompletePulseLow )
	CoD9Button:registerEventHandler( "transition_complete_pulse_high_disabled", CoD.CoD9Button.TransitionCompletePulseHigh )
	CoD9Button:registerEventHandler( "transition_complete_pulse_low_disabled", CoD.CoD9Button.TransitionCompletePulseLow )
	CoD9Button.container = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	CoD9Button:addElement( CoD9Button.container )
	CoD9Button.backgroundContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	CoD9Button:addElement( CoD9Button.backgroundContainer )
	if CoD.isZombie == true then
		CoD9Button.brackets = CoD.SideBracketsImage.new()
		CoD9Button.brackets:setAlpha( 0 )
		CoD9Button.container:addElement( CoD9Button.brackets )
	end
	local textAlignment = LUI.Alignment.Left
	if centerTextElement then
		textAlignment = LUI.Alignment.Center
	end
	CoD9Button.label = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.CoD9Button.TextHeight / 2,
		bottom = CoD.CoD9Button.TextHeight / 2,
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1,
		alignment = textAlignment
	} )
	CoD9Button.label:setTTF( "fonts/escom.ttf" )
	CoD.CoD9Button.SetupTextElement( CoD9Button.label )
	CoD9Button:addElement( CoD9Button.label )
	return CoD9Button
end

CoD.CoD9Button.ShowStarIcon = function ( self, show )
	if show then
		if self.restrictedIcon then
			self.restrictedIcon:close()
			self.restrictedIcon = nil
		end
		if not self.starIcon then
			if not CoD.CoD9Button.CustomizedMaterial then
				CoD.CoD9Button.CustomizedMaterial = RegisterMaterial( CoD.MPZM( "ui_host", "ui_host_zm" ) )
			end
			local starIconSize = 24
			local starIconLeftOffset = -5
			local starIconTopOffset = -1
			self.starIcon = LUI.UIImage.new()
			self.starIcon:setLeftRight( true, false, starIconLeftOffset - starIconSize, starIconLeftOffset )
			self.starIcon:setTopBottom( false, false, starIconTopOffset - starIconSize / 2, starIconTopOffset + starIconSize / 2 )
			self.starIcon:setImage( CoD.CoD9Button.CustomizedMaterial )
			self:addElement( self.starIcon )
		end
	elseif self.starIcon then
		self.starIcon:close()
		self.starIcon = nil
	end
end

CoD.CoD9Button.ShowRestrictedIcon = function ( self, show )
	if show then
		if self.starIcon then
			self.starIcon:close()
			self.starIcon = nil
		end
		if not self.restrictedIcon then
			local restrictedIconSize = 24
			local restrictedIconLeftOffset = -5
			local restrictedIconTopOffset = -1
			self.restrictedIcon = LUI.UIImage.new()
			self.restrictedIcon:setLeftRight( true, false, restrictedIconLeftOffset - restrictedIconSize, restrictedIconLeftOffset )
			self.restrictedIcon:setTopBottom( false, false, restrictedIconTopOffset - restrictedIconSize / 2, restrictedIconTopOffset + restrictedIconSize / 2 )
			self.restrictedIcon:setImage( RegisterMaterial( "cac_restricted" ) )
			self:addElement( self.restrictedIcon )
		end
	elseif self.restrictedIcon then
		self.restrictedIcon:close()
		self.restrictedIcon = nil
	end
end

CoD.CoD9Button.ShowZMNewIcon = function ( self, show, font, left )
	if show then
		if font == nil then
			font = "Condensed"
		end
		if left == nil then
			left = true
		end
		local f18_local0 = {}
		local textDim = GetTextDimensions( self.labelString, CoD.fonts[font], CoD.textSize[font] )
		local textWidth = textDim[3]
		if not self.newIcon then
			local newIconWidth = 64
			local newIconHeight = 32
			local newIconRightOffset = 25 + textWidth
			local newIconLeftOffset = 25
			local newIconTopOffset = -1
			self.newIcon = LUI.UIImage.new()
			if left then
				self.newIcon:setLeftRight( true, false, -newIconWidth + newIconLeftOffset, newIconLeftOffset )
			else
				self.newIcon:setLeftRight( true, false, newIconRightOffset, newIconRightOffset + newIconWidth )
			end
			self.newIcon:setTopBottom( false, false, -(newIconHeight / 2), newIconHeight / 2 )
			self.newIcon:setImage( RegisterMaterial( "menu_mp_lobby_new_small" ) )
			self:addElement( self.newIcon )
		end
	elseif self.newIcon then
		self.newIcon:close()
		self.newIcon = nil
	end
end

CoD.CoD9Button.RegistrationButtonOver = function ( self, event )
	self:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self:setAlpha( 0.75 )
	local button = self:getParent()
	if button and (button.lockImage or button.isLocked) then
		self:setRGB( 1, 1, 1 )
		self:setAlpha( 0.1 )
	end
end

CoD.CoD9Button.RegistrationButtonUp = function ( self, event )
	self:setRGB( 1, 1, 1 )
	self:setAlpha( 0.1 )
end

CoD.CoD9Button.RegistrationButtonSetLabel = function ( self, text, font, leftOffset )
	self.id = "CoD9RegistrationButton." .. text
	self.label:setText( text )
	self.labelString = text
	CoD.CoD9Button.SetBracketContainerStates( self, text, font, leftOffset )
end

CoD.CoD9Button.NewRegistrationButton = function ( defaultAnimationState, actionEventName, centerTextElement, fontName )
	local CoD9RegistrationButton = LUI.UIButton.new( defaultAnimationState, actionEventName )
	CoD9RegistrationButton.id = "CoD9RegistrationButton"
	CoD9RegistrationButton.setLabel = CoD.CoD9Button.RegistrationButtonSetLabel
	CoD9RegistrationButton.lock = CoD.CoD9Button.Lock
	CoD9RegistrationButton.showNewIcon = CoD.CoD9Button.ShowNewIcon
	CoD9RegistrationButton.showZMNewIcon = CoD.CoD9Button.ShowZMNewIcon
	CoD9RegistrationButton.showRestrictedIcon = CoD.CoD9Button.ShowRestrictedIcon
	CoD9RegistrationButton.addBackground = CoD.CoD9Button.AddBackgroundElement
	CoD9RegistrationButton:registerEventHandler( "disable_input", CoD.CoD9Button.DisableInput )
	CoD9RegistrationButton:registerEventHandler( "enable_input", CoD.CoD9Button.EnableInput )
	CoD9RegistrationButton:registerEventHandler( "gain_focus", CoD.CoD9Button.GainFocus )
	CoD9RegistrationButton:registerEventHandler( "lose_focus", CoD.CoD9Button.LoseFocus )
	local alphaHighDisabledValue = 0.5
	local alphaLowDisabledValue = 0.25
	if CoD.isZombie then
		alphaHighDisabledValue = 1
		alphaLowDisabledValue = 0.5
	end
	CoD9RegistrationButton:registerAnimationState( "pulse_high", {
		alpha = 1
	} )
	CoD9RegistrationButton:registerAnimationState( "pulse_low", {
		alpha = 0.5
	} )
	CoD9RegistrationButton:registerAnimationState( "pulse_high_disabled", {
		alpha = alphaHighDisabledValue
	} )
	CoD9RegistrationButton:registerAnimationState( "pulse_low_disabled", {
		alpha = alphaLowDisabledValue
	} )
	CoD9RegistrationButton:registerEventHandler( "transition_complete_pulse_high", CoD.CoD9Button.TransitionCompletePulseHigh )
	CoD9RegistrationButton:registerEventHandler( "transition_complete_pulse_low", CoD.CoD9Button.TransitionCompletePulseLow )
	CoD9RegistrationButton:registerEventHandler( "transition_complete_pulse_high_disabled", CoD.CoD9Button.TransitionCompletePulseHigh )
	CoD9RegistrationButton:registerEventHandler( "transition_complete_pulse_low_disabled", CoD.CoD9Button.TransitionCompletePulseLow )
	CoD9RegistrationButton.container = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	CoD9RegistrationButton:addElement( CoD9RegistrationButton.container )
	CoD9RegistrationButton.backgroundContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	CoD9RegistrationButton:addElement( CoD9RegistrationButton.backgroundContainer )
	if CoD.isZombie == true then
		CoD9RegistrationButton.brackets = CoD.SideBracketsImage.new()
		CoD9RegistrationButton.brackets:setAlpha( 0 )
		CoD9RegistrationButton.container:addElement( CoD9RegistrationButton.brackets )
	end
	local textAlignment = LUI.Alignment.Left
	if centerTextElement then
		textAlignment = LUI.Alignment.Center
	end
	local fontNameToUse = "Condensed"
	local fontHeight = CoD.CoD9Button.TextHeight
	if fontName ~= nil then
		fontNameToUse = fontName
		fontHeight = CoD.textSize[fontNameToUse]
	end
	CoD9RegistrationButton.label = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 6,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -fontHeight / 2,
		bottom = fontHeight / 2,
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1,
		font = CoD.fonts[fontNameToUse],
		alignment = textAlignment
	} )
	CoD.CoD9Button.SetupTextElement( CoD9RegistrationButton.label )
	CoD9RegistrationButton:addElement( CoD9RegistrationButton.label )
	CoD9RegistrationButton.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	CoD9RegistrationButton.border:registerEventHandler( "button_over", CoD.CoD9Button.RegistrationButtonOver )
	CoD9RegistrationButton.border:registerEventHandler( "button_up", CoD.CoD9Button.RegistrationButtonUp )
	CoD9RegistrationButton:addElement( CoD9RegistrationButton.border )
	local backgroundInset = 4
	local bannerFontHeight = fontHeight
	local bannerTextSpacing = 2
	local bannerHeight = bannerFontHeight * 2 + bannerTextSpacing
	local activateContainerBackgroundGrad = LUI.UIImage.new()
	activateContainerBackgroundGrad:setLeftRight( true, true, backgroundInset, -backgroundInset )
	activateContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, bannerHeight * 0.6 )
	activateContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	activateContainerBackgroundGrad:setAlpha( 0.1 )
	CoD9RegistrationButton.backgroundContainer:addElement( activateContainerBackgroundGrad )
	return CoD9RegistrationButton
end

