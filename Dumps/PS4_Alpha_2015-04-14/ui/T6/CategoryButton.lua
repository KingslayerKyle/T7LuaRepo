require( "ui.T6.CoD9Button" )

CoD.CategoryButton = {}
CoD.CategoryButton.Action = function ( self, event )
	if self.actionEventName ~= nil then
		self:dispatchEventToParent( {
			name = self.actionEventName,
			controller = event.controller,
			itemInfo = self.itemInfo
		} )
	end
end

CoD.CategoryButton.GainFocus = function ( self, event )
	local retVal = CoD.CoD9Button.GainFocus( self, event )
	if self.gainFocusEventName ~= nil then
		self:dispatchEventToParent( {
			name = self.gainFocusEventName,
			controller = event.controller,
			itemInfo = self.itemInfo,
			owner = self
		} )
	end
	return retVal
end

CoD.CategoryButton.LoseFocus = function ( self, event )
	CoD.CoD9Button.LoseFocus( self, event )
	if self.loseFocusEventName ~= nil then
		self:dispatchEventToParent( {
			name = self.loseFocusEventName,
			controller = event.controller
		} )
	end
end

CoD.CategoryButton.new = function ( defaultAnimationState, actionEventName, gainFocusEventName, loseFocusEventName, itemInfo )
	local categoryButton = CoD.CoD9Button.new( defaultAnimationState, actionEventName )
	categoryButton.id = "CoD9Button.CategoryButton." .. itemInfo.name
	categoryButton.gainFocusEventName = gainFocusEventName
	categoryButton.loseFocusEventName = loseFocusEventName
	categoryButton.itemInfo = itemInfo
	categoryButton:registerEventHandler( "button_action", CoD.CategoryButton.Action )
	categoryButton:registerEventHandler( "gain_focus", CoD.CategoryButton.GainFocus )
	categoryButton:registerEventHandler( "lose_focus", CoD.CategoryButton.LoseFocus )
	return categoryButton
end

