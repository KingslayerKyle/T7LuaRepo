CoD.TypewriterText = {}
CoD.TypewriterText.new = function ( defaultAnimationState )
	local self = LUI.UIText.new( defaultAnimationState, true )
	self:registerEventHandler( "typewrite", CoD.TypewriterText.Typewrite )
	self:registerEventHandler( "transition_complete_typewrite", CoD.TypewriterText.TransitionComplete_Typewrite )
	return self
end

CoD.TypewriterText.Typewrite = function ( self, event )
	if not event.text then
		self:animateToState( "default" )
		self:setText( "" )
		return 
	end
	self.duration = event.duration
	if not self.duration then
		if event.perLetter then
			self.duration = string.len( event.text ) * event.perLetter
		else
			self.duration = 1000
		end
	end
	self.fullString = event.text
	self.timeElapsed = 0
	self.numLetters = Engine.CountCharacters( self.fullString )
	self:beginAnimation( "typewrite", 1 )
end

CoD.TypewriterText.TransitionComplete_Typewrite = function ( self, event )
	if not event.interrupted then
		self.timeElapsed = self.timeElapsed + event.lateness + 1
		local numChars = self.numLetters * self.timeElapsed / self.duration
		local substring = Engine.SubstringLeft( self.fullString, numChars )
		self:setText( substring )
		if substring ~= self.fullString then
			self:beginAnimation( "typewrite", 1 )
		end
	end
end

