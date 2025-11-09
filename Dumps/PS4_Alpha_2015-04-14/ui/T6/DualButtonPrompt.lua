require( "ui.T6.ButtonPrompt" )

if CoD == nil then
	CoD = {}
end
CoD.DualButtonPrompt = {}
CoD.DualButtonPrompt.new = function ( buttonLeft, text, buttonRight, eventOwner, leftEventName, rightEventName, isBlankButton, alignment, offset, keyboardShortcutOverride, keyboardShortcutOverride2 )
	local textHeight = CoD.ButtonPrompt.TextHeight
	local textFont = CoD.fonts[CoD.ButtonPrompt.FontName]
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( text, textFont, textHeight )
	local buttonPromptWidth = CoD.ButtonPrompt.Height
	local rightMost = textRight + buttonPromptWidth + CoD.ButtonPrompt.ButtonToTextSpacing + buttonPromptWidth + CoD.ButtonPrompt.ButtonToTextSpacing
	local left = 0
	local right = rightMost
	local leftAnchor = true
	local rightAnchor = false
	if alignment == LUI.Alignment.Right then
		rightAnchor = true
		leftAnchor = false
		left = -rightMost
		right = 0
	end
	if alignment == LUI.Alignment.Center then
		rightAnchor = false
		leftAnchor = false
		left = -(rightMost / 2) + offset
		right = rightMost / 2 + offset
	end
	local dualButtonPrompt = LUI.UIHorizontalList.new( {
		left = left,
		top = -CoD.ButtonPrompt.Height / 2,
		right = right,
		bottom = CoD.ButtonPrompt.Height / 2,
		leftAnchor = leftAnchor,
		topAnchor = false,
		rightAnchor = rightAnchor,
		bottomAnchor = false,
		alignment = alignment
	} )
	dualButtonPrompt.id = dualButtonPrompt.id .. ".DualButtonPrompt"
	dualButtonPrompt.enable = CoD.ButtonPrompt.Enable
	dualButtonPrompt.disable = CoD.ButtonPrompt.Disable
	CoD.ButtonPrompt.SetupElement( dualButtonPrompt )
	dualButtonPrompt:registerAnimationState( "enabled", {
		alpha = 1
	} )
	dualButtonPrompt:registerAnimationState( "disabled", {
		alpha = 1
	} )
	if eventOwner ~= nil and rightEventName ~= nil then
		local buttonEventHandler = function ( self, event )
			if not self.disabled and event.down == true and event.button == buttonRight then
				eventOwner:processEvent( {
					name = rightEventName,
					controller = event.controller
				} )
				return true
			else
				self:dispatchEventToChildren( event )
			end
		end
		
		dualButtonPrompt:registerEventHandler( "gamepad_button", buttonEventHandler )
	end
	dualButtonPrompt.leftButton = CoD.ButtonPrompt.new( buttonLeft, text, eventOwner, leftEventName, isBlankButton, nil, true, keyboardShortcutOverride )
	if alignment ~= LUI.Alignment.Right then
		dualButtonPrompt:addElement( dualButtonPrompt.leftButton )
	end
	local buttonImage = nil
	if not isBlankButton then
		buttonImage = LUI.UIText.new()
		buttonImage:setLeftRight( true, false, 0, buttonPromptWidth )
		buttonImage:setTopBottom( false, false, -CoD.ButtonPrompt.Height / 2, CoD.ButtonPrompt.Height / 2 )
		buttonImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		buttonImage:setFont( textFont )
		buttonImage:setAlpha( 1 )
		if buttonImage ~= nil then
			if CoD.isPC then
				if keyboardShortcutOverride2 ~= nil then
					buttonImage.buttonStringShortCut = keyboardShortcutOverride2
				else
					buttonImage.buttonStringShortCut = buttonRight
				end
			end
			if CoD.useController and Engine.LastInput_Gamepad() then
				buttonImage:setText( CoD.buttonStrings[buttonRight] )
			elseif CoD.isPC then
				local shortCutKey = nil
				if string.sub( CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut], 1, 1 ) == "+" then
					shortCutKey = Engine.GetKeyBindingLocalizedString( 0, CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut], 0 )
				else
					shortCutKey = CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut]
				end
				buttonImage:setText( shortCutKey )
			end
			if CoD.useMouse then
				buttonImage.button = buttonRight
				buttonImage:registerEventHandler( "input_source_changed", CoD.DualButtonPrompt.InputSourceChanged )
				buttonImage:registerEventHandler( "mouseenter", CoD.DualButtonPrompt.MouseEnter )
				buttonImage:registerEventHandler( "mouseleave", CoD.DualButtonPrompt.MouseLeave )
				buttonImage:setHandleMouseMove( true )
			end
			buttonImage:registerAnimationState( "enabled", {
				alpha = 1
			} )
			buttonImage:registerAnimationState( "disabled", {
				alpha = 0.25
			} )
			if alignment ~= LUI.Alignment.Right then
				dualButtonPrompt:addSpacer( CoD.ButtonPrompt.ButtonToTextSpacing )
			end
			CoD.ButtonPrompt.SetupElement( buttonImage )
			dualButtonPrompt:addElement( buttonImage )
			if alignment == LUI.Alignment.Right then
				dualButtonPrompt:addSpacer( CoD.ButtonPrompt.ButtonToTextSpacing )
			end
		end
	end
	if CoD.useMouse then
		local mouseEventActionButton = LUI.UIButton.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true
		} )
		if buttonImage ~= nil then
			buttonImage:addElement( mouseEventActionButton )
		else
			dualButtonPrompt:addSpacer( buttonPromptWidth )
			dualButtonPrompt:addElement( mouseEventActionButton )
		end
		if eventOwner ~= nil and rightEventName ~= nil then
			local buttonActionFunction = function ( self, event )
				eventOwner:processEvent( {
					name = rightEventName,
					controller = event.controller
				} )
				return true
			end
			
			mouseEventActionButton:registerEventHandler( "button_action", buttonActionFunction )
		end
		mouseEventActionButton:setHandleMouseMove( false )
	end
	if alignment == LUI.Alignment.Right then
		dualButtonPrompt:addElement( dualButtonPrompt.leftButton )
	end
	return dualButtonPrompt
end

CoD.DualButtonPrompt.InputSourceChanged = function ( buttonImage )
	if CoD.useMouse then
		if CoD.useController and Engine.LastInput_Gamepad() then
			buttonImage:setText( CoD.buttonStrings[buttonImage.button] )
		else
			local shortCutKey = nil
			if string.sub( CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut], 1, 1 ) == "+" then
				shortCutKey = Engine.GetKeyBindingLocalizedString( 0, CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut], 0 )
			else
				shortCutKey = CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut]
			end
			buttonImage:setText( shortCutKey )
		end
	end
end

CoD.DualButtonPrompt.MouseEnter = function ( buttonImage, event )
	buttonImage:beginAnimation( "pop", 50 )
	buttonImage:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
end

CoD.DualButtonPrompt.MouseLeave = function ( buttonImage, event )
	local height = CoD.ButtonPrompt.TextHeight
	buttonImage:beginAnimation( "default", 50 )
	buttonImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
end

