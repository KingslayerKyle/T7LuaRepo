LUI.UIText = InheritFrom( LUI.UIElement )
LUI.UIText.addElement = function ( self, newChildElement )
	if newChildElement.id ~= "LUITimer" then
		DebugPrint( "WARNING: An element is being added to a UIText element. This will cause undesired behavior!" )
	end
	LUI.UIElement.addElement( self, newChildElement )
end

LUI.UIText.addElementBefore = function ( self, element )
	if newChildElement.id ~= "LUITimer" then
		DebugPrint( "WARNING: An element is being added to a UIText element. This will cause undesired behavior!" )
	end
	LUI.UIElement.addElementBefore( self, element )
end

LUI.UIText.addElementAfter = function ( self, element )
	if newChildElement.id ~= "LUITimer" then
		DebugPrint( "WARNING: An element is being added to a UIText element. This will cause undesired behavior!" )
	end
	LUI.UIElement.addElementAfter( self, element )
end

LUI.UIText.new = function ( defaultAnimationState, isUncached )
	if defaultAnimationState == nil then
		defaultAnimationState = {
			red = CoD.DefaultTextColor.r,
			green = CoD.DefaultTextColor.g,
			blue = CoD.DefaultTextColor.b
		}
	elseif defaultAnimationState.red == nil and defaultAnimationState.green == nil and defaultAnimationState.blue == nil then
		defaultAnimationState.red = CoD.DefaultTextColor.r
		defaultAnimationState.green = CoD.DefaultTextColor.g
		defaultAnimationState.blue = CoD.DefaultTextColor.b
	end
	local text = LUI.UIElement.new( defaultAnimationState )
	text:setClass( LUI.UIText )
	if not isUncached then
		text:setupUIText()
	else
		text:setupUITextUncached()
	end
	return text
end

LUI.UIText.TransitionComplete_OutState = function ( self, event )
	self:setText( self.replaceContentData.text )
	self:registerEventHandler( "transition_complete_" .. self.replaceContentData.outState, nil )
	self:animateToState( self.replaceContentData.inState, self.replaceContentData.inDuration )
	self.replaceContentData = nil
end

LUI.UIText.setText = function ( self, text, outState, inState, outDuration, inDuration )
	if outState ~= nil and inState ~= nil then
		self.replaceContentData = {}
		self.replaceContentData.outState = outState
		self.replaceContentData.inState = inState
		self.replaceContentData.outDuration = outDuration
		self.replaceContentData.inDuration = inDuration
		self.replaceContentData.text = text
		self:registerEventHandler( "transition_complete_" .. outState, LUI.UIText.TransitionComplete_OutState )
		self:animateToState( outState, outDuration )
		return 
	else
		self:setTextInC( text )
	end
end

LUI.UIText.getText = function ( self )
	if not self.getTextFromC then
		return "temporary text unless exes are posted - jcolvin"
	else
		return self:getTextFromC()
	end
end

LUI.UIText.id = "LUIText"
