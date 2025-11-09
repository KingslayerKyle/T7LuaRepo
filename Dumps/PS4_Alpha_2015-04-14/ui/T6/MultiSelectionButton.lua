require( "ui.T6.CoD9Button" )

CoD.MultiSelectionButton = {}
CoD.MultiSelectionButton.SelectionIconScale = 1.4
CoD.MultiSelectionButton.SelectionIconSize = CoD.CoD9Button.TextHeight * CoD.MultiSelectionButton.SelectionIconScale
CoD.MultiSelectionButton.SelectionIconOffset = 7
CoD.MultiSelectionButton.TextOffset = 5
CoD.MultiSelectionButton.TextLeft = CoD.MultiSelectionButton.SelectionIconSize + CoD.MultiSelectionButton.TextOffset
CoD.MultiSelectionButton.ClearStatusImage = function ( self )
	if self.statusImage ~= nil then
		self.statusImage:close()
		self.statusImage = nil
	end
end

CoD.MultiSelectionButton.GetSelectionIconSize = function ( materialName )
	if materialName == "lock" then
		return CoD.CoD9Button.TextHeight * 0.75
	else
		return CoD.CoD9Button.TextHeight * CoD.MultiSelectionButton.SelectionIconScale
	end
end

CoD.MultiSelectionButton.GetWidthOffset = function ( materialName )
	if materialName == "lock" then
		return -2
	else
		return CoD.MultiSelectionButton.SelectionIconOffset
	end
end

CoD.MultiSelectionButton.GetHeightOffset = function ( materialName )
	if materialName == "lock" then
		return -1
	else
		return CoD.MultiSelectionButton.SelectionIconOffset
	end
end

CoD.MultiSelectionButton.SetStatusImage = function ( self, materialName )
	local selectionIconSize = CoD.MultiSelectionButton.GetSelectionIconSize( materialName )
	local widthOffset = CoD.MultiSelectionButton.GetWidthOffset( materialName )
	local heightOffset = CoD.MultiSelectionButton.GetHeightOffset( materialName )
	self.statusImage = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = -widthOffset,
		right = -widthOffset + selectionIconSize,
		topAnchor = true,
		bottomAnchor = false,
		top = -heightOffset,
		bottom = -heightOffset + selectionIconSize,
		alpha = 1,
		material = RegisterMaterial( materialName )
	} )
	self:addElement( self.statusImage )
end

CoD.MultiSelectionButton.Lock = function ( self )
	CoD.MultiSelectionButton.ClearStatusImage( self )
	CoD.MultiSelectionButton.SetStatusImage( self, "lock" )
	self.statusImage:registerAnimationState( "can_unlock", {
		red = CoD.green.r,
		green = CoD.green.g,
		blue = CoD.green.b,
		alpha = 1
	} )
	self.statusImage:registerAnimationState( "cannot_unlock", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
end

CoD.MultiSelectionButton.Deselect = function ( self )
	CoD.MultiSelectionButton.ClearStatusImage( self )
	CoD.MultiSelectionButton.SetStatusImage( self, "menu_mp_pip_outline" )
	self.statusImage:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	self.statusImage:registerAnimationState( "hide", {
		alpha = 0
	} )
end

CoD.MultiSelectionButton.Select = function ( self )
	CoD.MultiSelectionButton.ClearStatusImage( self )
	local statusMaterialName = self.selectedMaterialName
	CoD.MultiSelectionButton.SetStatusImage( self, statusMaterialName or "menu_mp_pip_orange" )
end

CoD.MultiSelectionButton.Update = function ( self, event )
	self:enable()
	if self:isLocked() == true then
		self:dispatchEventToParent( {
			name = "increment_locked_count"
		} )
		CoD.MultiSelectionButton.Lock( self )
		self.statusImage:animateToState( "cannot_unlock" )
		self:disable()
	elseif self:isPurchased() == false then
		self:dispatchEventToParent( {
			name = "increment_locked_count"
		} )
		CoD.MultiSelectionButton.Lock( self )
		if self:canBeUnlocked() == true then
			self.statusImage:animateToState( "can_unlock" )
		else
			self.statusImage:animateToState( "cannot_unlock" )
			self:disable()
		end
	elseif self:isSelected() == true then
		CoD.MultiSelectionButton.Select( self )
	else
		CoD.MultiSelectionButton.Deselect( self )
		if event.selectionCountAtMax == true then
			self.statusImage:animateToState( "hide" )
			self:disable()
		end
	end
end

CoD.MultiSelectionButton.Action = function ( self, event )
	if self:isLocked() == true then
		self:dispatchEventToParent( {
			name = "cannot_unlock_multi_selection_button_action",
			controller = event.controller,
			button = self
		} )
	elseif self:isPurchased() == false then
		if self:canBeUnlocked() then
			self:dispatchEventToParent( {
				name = "can_unlock_multi_selection_button_action",
				controller = event.controller,
				button = self
			} )
		else
			self:dispatchEventToParent( {
				name = "cannot_unlock_multi_selection_button_action",
				controller = event.controller,
				button = self
			} )
		end
	elseif self:isSelected() == true then
		self:dispatchEventToParent( {
			name = "deselect_multi_selection_button_action",
			controller = event.controller,
			button = self
		} )
	else
		self:dispatchEventToParent( {
			name = "select_multi_selection_button_action",
			controller = event.controller,
			button = self
		} )
	end
end

CoD.MultiSelectionButton.Over = function ( self, event )
	LUI.UIButton.Over( self, event )
	if self:isLocked() == true then
		self:dispatchEventToParent( {
			name = "cannot_unlock_multi_selection_button_over",
			controller = event.controller,
			button = event.button
		} )
	elseif self:isPurchased() == false then
		if self:canBeUnlocked() == true then
			self:dispatchEventToParent( {
				name = "can_unlock_multi_selection_button_over",
				controller = event.controller,
				button = event.button
			} )
		else
			self:dispatchEventToParent( {
				name = "cannot_unlock_multi_selection_button_over",
				controller = event.controller,
				button = event.button
			} )
		end
	elseif self:isSelected() == true then
		self:dispatchEventToParent( {
			name = "selected_multi_selection_button_over",
			controller = event.controller,
			button = event.button
		} )
	else
		self:dispatchEventToParent( {
			name = "unselected_multi_selection_button_over",
			controller = event.controller,
			button = event.button
		} )
	end
	Engine.PlaySound( "uin_navigation_click" )
end

CoD.MultiSelectionButton.UpdateSelectionCount = function ( self, event )
	if self:isSelected() then
		self:dispatchEventToParent( {
			name = "increment_selection_count"
		} )
	end
end

CoD.MultiSelectionButton.New = function ( defaultAnimationState, actionEventName, fontName, buttonIndex )
	local multiSelectionButton = CoD.CoD9Button.new( defaultAnimationState, actionEventName )
	multiSelectionButton.id = "MultiSelectionButton"
	multiSelectionButton:registerEventHandler( "update_multi_selection_list_buttons", CoD.MultiSelectionButton.Update )
	multiSelectionButton:registerEventHandler( "button_action", CoD.MultiSelectionButton.Action )
	multiSelectionButton:registerEventHandler( "button_over", CoD.MultiSelectionButton.Over )
	multiSelectionButton:registerEventHandler( "update_selection_count", CoD.MultiSelectionButton.UpdateSelectionCount )
	local textHeight = CoD.CoD9Button.TextHeight
	local font = CoD.fonts.Condensed
	if fontName ~= nil then
		textHeight = CoD.textSize[fontName]
		font = CoD.fonts[fontName]
		CoD.MultiSelectionButton.SelectionIconSize = textHeight * CoD.MultiSelectionButton.SelectionIconScale
		CoD.MultiSelectionButton.TextLeft = CoD.MultiSelectionButton.SelectionIconSize + CoD.MultiSelectionButton.TextOffset
	end
	local labelDefaultAnimationState = {
		leftAnchor = true,
		rightAnchor = true,
		left = CoD.MultiSelectionButton.TextLeft,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -textHeight / 2,
		bottom = textHeight / 2,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		alpha = 1,
		font = font
	}
	multiSelectionButton.label:registerAnimationState( "default", labelDefaultAnimationState )
	multiSelectionButton.label:animateToState( "default" )
	multiSelectionButton.buttonBg = LUI.UIImage.new()
	multiSelectionButton.buttonBg:setLeftRight( true, true, 0, 0 )
	multiSelectionButton.buttonBg:setTopBottom( true, true, 0, 0 )
	multiSelectionButton.buttonBg:setAlpha( 0.2 )
	multiSelectionButton.buttonBg:setPriority( -100 )
	if buttonIndex % 2 == 0 then
		multiSelectionButton.buttonBg:setRGB( 0, 0, 0 )
	else
		multiSelectionButton.buttonBg:setRGB( 0.1, 0.1, 0.1 )
	end
	multiSelectionButton:addElement( multiSelectionButton.buttonBg )
	multiSelectionButton.buttonIndex = buttonIndex
	return multiSelectionButton
end

