CoD.KeyboardButton = {}
CoD.KeyboardButton.TextHeight = 2.5 * CoD.textSize.Condensed
CoD.KeyboardButton.SetLabel = function ( self, text, font, leftOffset )
	self.id = "KeyboardButton." .. text
	self.label:setText( text )
end

CoD.KeyboardButton.GainFocus = function ( self, event )
	local retVal = LUI.UIButton.gainFocus( self, event )
	self.label:animateToState( "selected", CoD.KeyboardButton.ButtonOverAnimTime )
	self.background:animateToState( "selected", CoD.KeyboardButton.ButtonOverAnimTime )
	return retVal
end

CoD.KeyboardButton.LoseFocus = function ( self, event )
	LUI.UIButton.loseFocus( self, event )
	self.label:animateToState( "default", CoD.KeyboardButton.ButtonOverAnimTime )
	self.background:animateToState( "default", CoD.KeyboardButton.ButtonOverAnimTime )
end

CoD.KeyboardButton.SetupTextElement = function ( textElement )
	textElement:registerAnimationState( "selected", {
		alpha = 1
	} )
	LUI.UIButton.SetupElement( textElement )
end

CoD.KeyboardButton.Pressed = function ( self, event )
	local keyValue = self.def[1 + self.showIndex]
	if keyValue == nil then
		keyValue = self.def[1]
	end
	self.keyboardMenu:processEvent( {
		name = self.keyActionEvent,
		key = keyValue
	} )
end

CoD.KeyboardButton.PressedAnimationComplete = function ( self )
	self:animateToState( "selected", 250 )
end

CoD.KeyboardButton.IndexLabel = function ( self, slot )
	local index = slot + 1
	local newLabel = self.def[index]
	if newLabel ~= nil then
		self:setLabel( newLabel )
		self.showIndex = slot
	end
end

CoD.KeyboardButton.new = function ( keyDef, defaultAnimationState, keyboardMenu, actionEventName, tag, textHeight )
	if keyDef.width ~= nil then
		defaultAnimationState.right = defaultAnimationState.right + keyDef.width[tag]
	end
	local keyboardButton = LUI.UIButton.new( defaultAnimationState, actionEventName )
	keyboardButton.keyboardMenu = keyboardMenu
	keyboardButton.def = keyDef
	keyboardButton.showIndex = 0
	keyboardButton.setLabel = CoD.KeyboardButton.SetLabel
	keyboardButton.indexLabel = CoD.KeyboardButton.IndexLabel
	keyboardButton:registerEventHandler( "gain_focus", CoD.KeyboardButton.GainFocus )
	keyboardButton:registerEventHandler( "lose_focus", CoD.KeyboardButton.LoseFocus )
	keyboardButton.container = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	keyboardButton:addElement( keyboardButton.container )
	local sideEdge = 7
	local topEdge = 8
	keyboardButton.background = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = sideEdge,
		right = -sideEdge,
		topAnchor = true,
		bottomAnchor = true,
		top = topEdge,
		bottom = -topEdge,
		red = 0.6,
		green = 0.6,
		blue = 0.6,
		alpha = 0.95
	} )
	keyboardButton.background:registerAnimationState( "selected", {
		red = 0.9,
		blue = 0.9,
		green = 0.9,
		alpha = 1
	} )
	keyboardButton.background:registerAnimationState( "pressed", {
		red = 0.9,
		blue = 0,
		green = 0,
		alpha = 1
	} )
	keyboardButton.background:registerEventHandler( "transition_complete_pressed", CoD.KeyboardButton.PressedAnimationComplete )
	LUI.UIButton.SetupElement( keyboardButton.background )
	keyboardButton.container:addElement( keyboardButton.background )
	local font = "Condensed"
	local initialText = keyDef[1]
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( initialText, CoD.fonts[font], CoD.textSize[font] )
	local label = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -textRight / 2,
		right = textRight / 2,
		top = -textHeight / 2,
		bottom = textHeight / 2,
		topAnchor = false,
		bottomAnchor = false,
		alpha = 0.5,
		font = CoD.fonts.Condensed,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.5
	} )
	keyboardButton.label = label
	label:registerAnimationState( "selected", {
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	LUI.UIButton.SetupElement( label )
	keyboardButton:addElement( label )
	keyboardButton:setLabel( initialText )
	return keyboardButton
end

