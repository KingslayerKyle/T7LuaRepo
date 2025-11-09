require( "ui.T6.Brackets" )

CoD.BracketButton = {}
local CoD_BracketButton_HintTextListener_GainFocus, CoD_BracketButton_HintTextListener_LoseFocus = nil
CoD.BracketButton.new = function ( defaultAnimationState, actionEventName )
	local button = LUI.UIButton.new( defaultAnimationState, actionEventName )
	local brackets = CoD.Brackets.new( 12 )
	brackets:processEvent( {
		name = "fade",
		red = CoD.green.r,
		green = CoD.green.g,
		blue = CoD.green.b,
		alpha = 1
	} )
	brackets:setPriority( 100 )
	button:addElement( brackets )
	LUI.UIButton.SetupElement( brackets )
	brackets:registerAnimationState( "default", {
		alphaMultiplier = 0
	} )
	brackets:animateToState( "default" )
	brackets:registerAnimationState( "button_over", {
		alphaMultiplier = 1
	} )
	button.brackets = brackets
	button.setHintText = CoD.BracketButton.SetHintText
	return button
end

CoD.BracketButton.SetHintText = function ( self, hintText, hintTextElement )
	local hintTextListener = self.hintTextListener
	if hintTextListener == nil then
		if hintTextElement == nil then
			return 
		end
		hintTextListener = LUI.UIElement.new()
		self:addElement( hintTextListener )
		hintTextListener:registerEventHandler( "gain_focus", CoD_BracketButton_HintTextListener_GainFocus )
		hintTextListener:registerEventHandler( "lose_focus", CoD_BracketButton_HintTextListener_LoseFocus )
		self.hintTextListener = hintTextListener
	end
	if hintTextElement ~= nil then
		hintTextListener.hintTextElement = hintTextElement
	end
	if hintText ~= nil then
		hintTextListener.hintText = hintText
	end
end

CoD_BracketButton_HintTextListener_GainFocus = function ( self, event )
	local hintTextElement = self.hintTextElement
	local hintText = self.hintText
	if hintTextElement ~= nil and hintText ~= nil then
		hintTextElement:updateText( hintText )
	end
end

CoD_BracketButton_HintTextListener_LoseFocus = function ( self, event )
	local hintTextElement = self.hintTextElement
	if hintTextElement ~= nil then
		hintTextElement:removeText()
	end
end

