LUI.UIAnimNumber = {}
LUI.UIAnimNumber.new = function ( defaultAnimationState )
	local text = LUI.UIText.new( defaultAnimationState )
	text.setNumber = LUI.UIAnimNumber.SetNumber
	text.setLocalizedString = LUI.UIAnimNumber.SetLocalizedString
	text.layout = LUI.UIAnimNumber.Layout
	return text
end

LUI.UIAnimNumber.SetNumber = function ( self, number, duration )
	if duration == nil or self.currentNumber == nil then
		self.currentNumber = number
		self:setText( number )
		return 
	else
		self.startingNumber = self.currentNumber
		self.numberChange = number - self.startingNumber
		self.timeLeft = duration
		self.duration = duration
		self:setLayoutCached( false )
	end
end

LUI.UIAnimNumber.SetLocalizedString = function ( self, localizedString )
	self.localizedString = localizedString
end

LUI.UIAnimNumber.Layout = function ( self, event )
	local cacheLayout = true
	if self.timeLeft ~= nil then
		local timeLeft = self.timeLeft - event.deltaTime
		local currentNumber = nil
		if timeLeft < 0 then
			currentNumber = self.startingNumber + self.numberChange
			self.startingNumber = nil
			self.numberChange = nil
			self.timeLeft = nil
			self.duration = nil
		else
			self.timeLeft = timeLeft
			local lerpFraction = 1 - timeLeft / self.duration
			currentNumber = math.floor( self.startingNumber + self.numberChange * lerpFraction + 0.5 )
		end
		local localizedString = self.localizedString
		if localizedString ~= nil then
			self:setText( Engine.Localize( localizedString, currentNumber ) )
		else
			self:setText( currentNumber )
		end
		self.currentNumber = currentNumber
		cacheLayout = false
	end
	cacheLayout = self:updateElementLayout( event ) and cacheLayout
	self:layoutChildren( event )
	self:setLayoutCached( cacheLayout )
end

