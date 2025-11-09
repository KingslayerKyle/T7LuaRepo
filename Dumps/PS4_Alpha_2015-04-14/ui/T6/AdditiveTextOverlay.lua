CoD.AdditiveTextOverlay = {}
CoD.AdditiveTextOverlay.PulseInTime = 500
CoD.AdditiveTextOverlay.PulseOutTime = 250
CoD.AdditiveTextOverlay.ColorShiftTime = 500
CoD.AdditiveTextOverlay.new = function ( width, height, baseColor, innerColor1, innerColor2, defaultAnimationState, glowMaterial )
	if glowMaterial == nil then
		if nil == CoD.AdditiveTextOverlay.GlowMaterial then
			CoD.AdditiveTextOverlay.GlowMaterial = RegisterMaterial( "hud_lui_scorefeed_glow" )
		end
		glowMaterial = CoD.AdditiveTextOverlay.GlowMaterial
	end
	local glowContainer = LUI.UIElement.new( defaultAnimationState )
	local glowTopOffset = -5
	local glowWidth = width * 2.5
	local glowHeight = height * 4
	
	local glow = LUI.UIImage.new( {
		left = -glowWidth / 2,
		top = -glowHeight / 2 + glowTopOffset,
		right = glowWidth / 2,
		bottom = glowHeight / 2 + glowTopOffset,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = baseColor.r,
		green = baseColor.g,
		blue = baseColor.b,
		material = glowMaterial
	} )
	glow:registerAnimationState( "initial", {
		red = 1,
		green = 1,
		blue = 1
	} )
	glow:registerAnimationState( "out", {
		left = -width / 2,
		top = 0,
		right = width / 2,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = 0,
		green = 0,
		blue = 0
	} )
	glow:setPriority( -100 )
	glow:animateToState( "initial" )
	glow:animateToState( "default", CoD.AdditiveTextOverlay.PulseInTime )
	glowContainer:addElement( glow )
	glowContainer.glow = glow
	
	local innerGlowWidth = glowWidth * 0.5
	local innerGlowHeight = glowHeight * 0.5
	
	local innerGlow = LUI.UIImage.new( {
		left = -innerGlowWidth / 2,
		top = -innerGlowHeight / 2 + glowTopOffset,
		right = innerGlowWidth / 2,
		bottom = innerGlowHeight / 2 + glowTopOffset,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = innerColor1.r,
		green = innerColor1.g,
		blue = innerColor1.b,
		material = glowMaterial
	} )
	innerGlow:registerAnimationState( "color", {
		red = innerColor1.r,
		green = innerColor1.g,
		blue = innerColor1.b
	} )
	innerGlow:registerAnimationState( "color2", {
		red = innerColor2.r,
		green = innerColor2.g,
		blue = innerColor2.b
	} )
	innerGlow:setPriority( -100 )
	innerGlow:animateToState( "color2", CoD.AdditiveTextOverlay.ColorShiftTime, true, true )
	innerGlow:registerEventHandler( "transition_complete_color", CoD.AdditiveTextOverlay.Color )
	innerGlow:registerEventHandler( "transition_complete_color2", CoD.AdditiveTextOverlay.Color2 )
	glowContainer:addElement( innerGlow )
	glowContainer.innerGlow = innerGlow
	
	glowContainer:setPriority( -100 )
	glowContainer.out = CoD.AdditiveTextOverlay.Out
	glowContainer:registerEventHandler( "out", CoD.AdditiveTextOverlay.Out )
	return glowContainer
end

CoD.AdditiveTextOverlay.newWithText = function ( text, fontName, baseColor, innerColor1, innerColor2, defaultAnimationState, alignment )
	local font = CoD.fonts[fontName]
	local height = CoD.textSize[fontName]
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( text, font, height )
	local width = textRight + textLeft
	local textContainer = LUI.UIElement.new( defaultAnimationState )
	local animationState = nil
	if alignment == LUI.Alignment.Left then
		animationState = {
			left = 0,
			top = 0,
			right = width,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		}
	else
		animationState = {
			left = 0,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true
		}
	end
	local label = LUI.UIText.new()
	label:setLeftRight( true, true, 0, 0 )
	label:setTopBottom( true, true, 0, 0 )
	label:setFont( font )
	label:setText( text )
	if alignment then
		label:setAlignment( alignment )
	end
	textContainer.text = text
	textContainer:addElement( label )
	textContainer.label = label
	
	local glow = CoD.AdditiveTextOverlay.new( width, height, baseColor, innerColor1, innerColor2, animationState )
	textContainer:addElement( glow )
	textContainer.glow = glow
	
	textContainer.innerColor1 = innerColor1
	textContainer.addAnimationStateForFont = CoD.AdditiveTextOverlay.TextContainer_AddAnimationStateForFont
	textContainer.out = CoD.AdditiveTextOverlay.TextContainer_Out
	textContainer.closeAfterTime = CoD.AdditiveTextOverlay.TextContainer_CloseAfterTime
	return textContainer
end

CoD.AdditiveTextOverlay.Color = function ( self, event )
	if event.interrupted ~= true then
		self:animateToState( "color2", CoD.AdditiveTextOverlay.ColorShiftTime, true, true )
	end
end

CoD.AdditiveTextOverlay.Color2 = function ( self, event )
	if event.interrupted ~= true then
		self:animateToState( "color", CoD.AdditiveTextOverlay.ColorShiftTime, true, true )
	end
end

CoD.AdditiveTextOverlay.Out = function ( self, event )
	self.glow:animateToState( "initial" )
	self.glow:animateToState( "out", CoD.AdditiveTextOverlay.PulseOutTime )
	self.innerGlow:close()
end

CoD.AdditiveTextOverlay.TextContainer_AddAnimationStateForFont = function ( self, fontName, stateName )
	local font = CoD.fonts[fontName]
	local textHeight = CoD.textSize[fontName]
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( self.text, font, textHeight )
	local width = textRight + textLeft
	local glowTopOffset = -5
	local glowWidth = width * 2.5
	local glowHeight = textHeight * 4
	self.glow.glow:registerAnimationState( stateName, {
		left = -glowWidth / 2,
		top = -glowHeight / 2 + glowTopOffset,
		right = glowWidth / 2,
		bottom = glowHeight / 2 + glowTopOffset,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	local innerGlowWidth = glowWidth * 0.5
	local innerGlowHeight = glowHeight * 0.5
	self.glow.innerGlow:registerAnimationState( stateName, {
		left = -innerGlowWidth / 2,
		top = -innerGlowHeight / 2 + glowTopOffset,
		right = innerGlowWidth / 2,
		bottom = innerGlowHeight / 2 + glowTopOffset,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		red = self.innerColor1.r,
		green = self.innerColor1.g,
		blue = self.innerColor1.b
	} )
	self.glow.innerGlow:registerEventHandler( "transition_complete_" .. stateName, CoD.AdditiveTextOverlay.Color )
end

CoD.AdditiveTextOverlay.TextContainer_Out = function ( self, time )
	self.glow:out()
	self.label:close()
end

CoD.AdditiveTextOverlay.TextContainer_CloseAfterTime = function ( self, time )
	self:addElement( LUI.UITimer.new( time, "out", true, self.glow ) )
	self:addElement( LUI.UITimer.new( time, "close", true, self.label ) )
end

