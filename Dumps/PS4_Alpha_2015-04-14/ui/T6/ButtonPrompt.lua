require( "ui.T6.CoD9Button" )

if CoD == nil then
	CoD = {}
end
CoD.ButtonPrompt = {}
CoD.ButtonPrompt.FontName = "ExtraSmall"
CoD.ButtonPrompt.Height = 25
CoD.ButtonPrompt.TextHeight = CoD.textSize[CoD.ButtonPrompt.FontName]
CoD.ButtonPrompt.ButtonToTextSpacing = 3
CoD.ButtonPrompt.TextColor = {
	r = 0.43,
	g = 0.49,
	b = 0.53
}
local CoD_ButtonPromptElement_Enable = function ( self, event )
	self.disabled = nil
	self:animateToState( "enabled" )
	self:dispatchEventToChildren( event )
end

local CoD_ButtonPromptElement_Disable = function ( self, event )
	self.disabled = true
	self:animateToState( "disabled" )
	self:dispatchEventToChildren( event )
end

CoD.ButtonPrompt.Enable = function ( self )
	if self.disabled == true then
		self:processEvent( {
			name = "enable"
		} )
		self.disabled = nil
	end
end

CoD.ButtonPrompt.Disable = function ( self )
	if self.disabled == nil then
		self:processEvent( {
			name = "disable"
		} )
		self.disabled = true
	end
end

CoD.ButtonPrompt.SetupElement = function ( element )
	element:registerEventHandler( "enable", CoD_ButtonPromptElement_Enable )
	element:registerEventHandler( "disable", CoD_ButtonPromptElement_Disable )
end

CoD.ButtonPrompt.new = function ( button, text, eventOwner, eventName, isBlankButton, qualifier, DualButton, keyboardShortcutOverride, shortcutKey, bindPlayer )
	local height = CoD.ButtonPrompt.Height
	local textHeight = CoD.ButtonPrompt.TextHeight
	local textFont = CoD.fonts[CoD.ButtonPrompt.FontName]
	if LUI.DEVHideButtonPrompts then
		text = ""
	end
	local buttonPrompt = LUI.UIElement.new()
	buttonPrompt:setTopBottom( false, false, -height / 2, height / 2 )
	buttonPrompt.button = button
	buttonPrompt.enable = CoD.ButtonPrompt.Enable
	buttonPrompt.disable = CoD.ButtonPrompt.Disable
	buttonPrompt.setNew = CoD.ButtonPrompt.SetNew
	buttonPrompt.setText = CoD.ButtonPrompt.SetText
	CoD.ButtonPrompt.SetupElement( buttonPrompt )
	buttonPrompt:registerAnimationState( "enabled", {
		alpha = 1
	} )
	buttonPrompt:registerAnimationState( "disabled", {
		alpha = 1
	} )
	if eventOwner ~= nil and eventName ~= nil then
		local buttonEventHandler = function ( self, event )
			if not self.disabled and event.down == true then
				if event.button == button and (qualifier == nil or event.qualifier == qualifier) then
					eventOwner:processEvent( {
						name = eventName,
						controller = event.controller
					} )
					return true
				elseif CoD.isPC and event.button == "key_shortcut" and (event.key == shortcutKey or event.bind1 == bindPlayer) then
					eventOwner:processEvent( {
						name = eventName,
						controller = event.controller
					} )
					return true
				end
			end
		end
		
		buttonPrompt:registerEventHandler( "gamepad_button", buttonEventHandler )
	end
	local buttonText = LUI.UIText.new()
	buttonText:setTopBottom( false, false, -textHeight / 2, textHeight / 2 )
	buttonText:setFont( textFont )
	buttonText:setAlpha( 1 )
	buttonText:registerAnimationState( "enabled", {
		alpha = 1
	} )
	buttonText:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	buttonText:setRGB( CoD.ButtonPrompt.TextColor.r, CoD.ButtonPrompt.TextColor.g, CoD.ButtonPrompt.TextColor.b )
	CoD.ButtonPrompt.SetupElement( buttonText )
	buttonPrompt:addElement( buttonText )
	buttonText:setText( text )
	buttonPrompt.label = buttonText
	buttonPrompt.labelText = text
	local buttonImage = nil
	if not isBlankButton then
		buttonImage = LUI.UIText.new()
		buttonImage:setTopBottom( false, false, -height / 2, height / 2 )
		buttonImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		buttonImage:setFont( textFont )
		buttonImage:setAlpha( 1 )
		if buttonImage ~= nil then
			if CoD.isPC then
				if shortcutKey ~= nil then
					buttonImage.shortcutKey = shortcutKey
				end
				if keyboardShortcutOverride ~= nil then
					buttonImage.buttonStringShortCut = keyboardShortcutOverride
				else
					buttonImage.buttonStringShortCut = button
				end
			end
			local prompt = nil
			if CoD.useController and Engine.LastInput_Gamepad() then
				prompt = CoD.buttonStrings[button]
			elseif CoD.isPC then
				if shortcutKey then
					prompt = shortcutKey
				elseif string.sub( CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut], 1, 1 ) == "+" then
					prompt = Engine.GetKeyBindingLocalizedString( 0, CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut], 0 )
				elseif string.sub( CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut], 1, 1 ) == "@" then
					local toLocString = string.sub( CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut], 2 )
					prompt = Engine.Localize( toLocString )
				else
					prompt = CoD.buttonStringsShortCut[buttonImage.buttonStringShortCut]
				end
			end
			buttonImage:setText( prompt )
			buttonPrompt.prompt = prompt
			buttonImage:registerAnimationState( "enabled", {
				alpha = 1
			} )
			buttonImage:registerAnimationState( "disabled", {
				alpha = 0.25
			} )
			CoD.ButtonPrompt.SetupElement( buttonImage )
			buttonPrompt.buttonImage = buttonImage
			buttonPrompt:addElement( buttonImage )
		end
	end
	if CoD.useMouse and (buttonImage ~= nil or text ~= "") then
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
		buttonPrompt:addElement( mouseEventActionButton )
		if eventOwner ~= nil and eventName ~= nil then
			local buttonActionFunction = function ( self, event )
				eventOwner:processEvent( {
					name = eventName,
					controller = event.controller
				} )
				return true
			end
			
			mouseEventActionButton:registerEventHandler( "button_action", buttonActionFunction )
		end
		mouseEventActionButton:setHandleMouseMove( false )
		buttonPrompt:setHandleMouseMove( true )
		buttonPrompt:registerEventHandler( "mouseenter", CoD.ButtonPrompt.MouseEnter )
		buttonPrompt:registerEventHandler( "mouseleave", CoD.ButtonPrompt.MouseLeave )
		buttonPrompt:registerEventHandler( "input_source_changed", CoD.ButtonPrompt.InputSourceChanged )
	end
	CoD.ButtonPrompt.ResizeButtonPrompt( buttonPrompt )
	return buttonPrompt
end

CoD.ButtonPrompt.addUIEditorButtonPrompt = function ( owner, button, text, shortcutKey )
	local height = CoD.ButtonPrompt.Height
	local textHeight = CoD.ButtonPrompt.TextHeight
	local textFont = CoD.fonts[CoD.ButtonPrompt.FontName]
	if LUI.DEVHideButtonPrompts then
		text = ""
	end
	local buttonPrompt = LUI.UIElement.new()
	buttonPrompt:setTopBottom( false, false, -height / 2, height / 2 )
	buttonPrompt.button = button
	buttonPrompt.enable = CoD.ButtonPrompt.Enable
	buttonPrompt.disable = CoD.ButtonPrompt.Disable
	buttonPrompt.setNew = CoD.ButtonPrompt.SetNew
	buttonPrompt.setText = CoD.ButtonPrompt.SetText
	CoD.ButtonPrompt.SetupElement( buttonPrompt )
	buttonPrompt:registerAnimationState( "enabled", {
		alpha = 1
	} )
	buttonPrompt:registerAnimationState( "disabled", {
		alpha = 1
	} )
	local buttonText = LUI.UIText.new()
	buttonText:setTopBottom( false, false, -textHeight / 2, textHeight / 2 )
	buttonText:setFont( textFont )
	buttonText:setAlpha( 1 )
	buttonText:registerAnimationState( "enabled", {
		alpha = 1
	} )
	buttonText:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	CoD.ButtonPrompt.SetupElement( buttonText )
	buttonPrompt:addElement( buttonText )
	buttonText:setText( text )
	buttonPrompt.label = buttonText
	buttonPrompt.labelText = text
	local buttonImage = nil
	buttonImage = LUI.UIText.new()
	buttonImage:setTopBottom( false, false, -height / 2, height / 2 )
	buttonImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	buttonImage:setFont( textFont )
	buttonImage:setAlpha( 1 )
	buttonImage.shortcutKey = shortcutKey
	local prompt = nil
	if CoD.useController and Engine.LastInput_Gamepad() then
		prompt = CoD.buttonStrings[button]
	elseif CoD.isPC then
		if shortcutKey then
			prompt = shortcutKey
		elseif string.sub( shortcutKey, 1, 1 ) == "+" then
			prompt = Engine.GetKeyBindingLocalizedString( 0, shortcutKey, 0 )
		end
	end
	buttonImage:setText( prompt )
	buttonPrompt.prompt = prompt
	buttonImage:registerAnimationState( "enabled", {
		alpha = 1
	} )
	buttonImage:registerAnimationState( "disabled", {
		alpha = 0.25
	} )
	CoD.ButtonPrompt.SetupElement( buttonImage )
	buttonPrompt.buttonImage = buttonImage
	buttonPrompt:addElement( buttonImage )
	if CoD.useMouse and (buttonImage ~= nil or text ~= "") then
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
		buttonPrompt:addElement( mouseEventActionButton )
		if owner ~= nil then
			local buttonActionFunction = function ( self, event )
				owner:processEvent( {
					name = "gamepad_button",
					controller = event.controller,
					button = button,
					down = true
				} )
				return true
			end
			
			mouseEventActionButton:registerEventHandler( "button_action", buttonActionFunction )
		end
		mouseEventActionButton:setHandleMouseMove( false )
		buttonPrompt:setHandleMouseMove( true )
		buttonPrompt:registerEventHandler( "mouseenter", CoD.ButtonPrompt.MouseEnter )
		buttonPrompt:registerEventHandler( "mouseleave", CoD.ButtonPrompt.MouseLeave )
		buttonPrompt:registerEventHandler( "input_source_changed", CoD.ButtonPrompt.InputSourceChanged )
	end
	CoD.ButtonPrompt.ResizeButtonPrompt( buttonPrompt )
	buttonPrompt.SetText = CoD.ButtonPrompt.SetText
	return buttonPrompt
end

CoD.ButtonPrompt.ResizeButtonPrompt = function ( buttonPrompt )
	local newWidth = CoD.ButtonPrompt.ButtonToTextSpacing
	local height = CoD.ButtonPrompt.Height
	local textHeight = CoD.ButtonPrompt.TextHeight
	local textFont = CoD.fonts[CoD.ButtonPrompt.FontName]
	local f11_local0 = {}
	local labelTextDim = GetTextDimensions( buttonPrompt.labelText, textFont, textHeight )
	local labelTextWidth = labelTextDim[3] - labelTextDim[1]
	buttonPrompt.label:setLeftRight( false, true, -labelTextWidth, 0 )
	newWidth = newWidth + labelTextWidth
	if buttonPrompt.prompt ~= nil then
		local shortCutKeyWidth = nil
		if string.sub( buttonPrompt.prompt, 1, 2 ) == "^B" and not buttonPrompt.forceMeasureButtonWidth then
			shortCutKeyWidth = CoD.ButtonPrompt.Height
		else
			local f11_local1 = {}
			local shortCutKeyDim = GetTextDimensions( buttonPrompt.prompt, textFont, height )
			shortCutKeyWidth = shortCutKeyDim[3] - shortCutKeyDim[1]
		end
		buttonPrompt.buttonImage:setLeftRight( true, false, 0, shortCutKeyWidth )
		newWidth = newWidth + shortCutKeyWidth
	end
	if buttonPrompt.newIcon then
		local newIconSpacing = 5
		newWidth = newWidth + newIconSpacing
		buttonPrompt.newIcon:setLeftRight( true, false, newWidth, newWidth + CoD.CACUtility.ButtonGridNewImageWidth )
		buttonPrompt.label:setLeftRight( false, true, -labelTextWidth - CoD.CACUtility.ButtonGridNewImageRightAlignWidth - newIconSpacing, -CoD.CACUtility.ButtonGridNewImageRightAlignWidth - newIconSpacing )
		newWidth = newWidth + CoD.CACUtility.ButtonGridNewImageRightAlignWidth
	end
	buttonPrompt:setLeftRight( true, false, 0, newWidth )
end

CoD.ButtonPrompt.InputSourceChanged = function ( buttonPrompt, event )
	if buttonPrompt.buttonImage == nil then
		return 
	elseif CoD.useMouse then
		if CoD.useController and event.source == 0 then
			buttonPrompt.prompt = CoD.buttonStrings[buttonPrompt.button]
			buttonPrompt.buttonImage:setText( buttonPrompt.prompt )
		else
			if buttonPrompt.buttonImage.shortcutKey then
				buttonPrompt.prompt = buttonPrompt.buttonImage.shortcutKey
			elseif string.sub( CoD.buttonStringsShortCut[buttonPrompt.buttonImage.buttonStringShortCut], 1, 1 ) == "+" then
				buttonPrompt.prompt = Engine.GetKeyBindingLocalizedString( 0, CoD.buttonStringsShortCut[buttonPrompt.buttonImage.buttonStringShortCut], 0 )
			elseif string.sub( CoD.buttonStringsShortCut[buttonPrompt.buttonImage.buttonStringShortCut], 1, 1 ) == "@" then
				local toLocString = string.sub( CoD.buttonStringsShortCut[buttonPrompt.buttonImage.buttonStringShortCut], 2 )
				buttonPrompt.prompt = Engine.Localize( toLocString )
			else
				buttonPrompt.prompt = CoD.buttonStringsShortCut[buttonPrompt.buttonImage.buttonStringShortCut]
			end
			buttonPrompt.buttonImage:setText( buttonPrompt.prompt )
		end
		CoD.ButtonPrompt.ResizeButtonPrompt( buttonPrompt )
	end
end

CoD.ButtonPrompt.SetNew = function ( self, new )
	if new then
		if not self.newIcon then
			local newIcon = LUI.UIImage.new()
			newIcon:setLeftRight( true, false, 0, CoD.CACUtility.ButtonGridNewImageWidth )
			newIcon:setTopBottom( false, false, -CoD.CACUtility.ButtonGridNewImageHeight / 2, CoD.CACUtility.ButtonGridNewImageHeight / 2 )
			newIcon:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			self:addElement( newIcon )
			self.newIcon = newIcon
			
		end
	elseif self.newIcon then
		self.newIcon:close()
		self.newIcon = nil
	end
	CoD.ButtonPrompt.ResizeButtonPrompt( self )
end

CoD.ButtonPrompt.SetText = function ( buttonPrompt, newText )
	if LUI.DEVHideButtonPrompts then
		return 
	else
		buttonPrompt.label:setText( newText )
		buttonPrompt.labelText = newText
		CoD.ButtonPrompt.ResizeButtonPrompt( buttonPrompt )
	end
end

CoD.ButtonPrompt.MouseEnter = function ( buttonPrompt, event )
	if buttonPrompt.buttonImage == nil then
		return 
	else
		buttonPrompt.buttonImage:beginAnimation( "pop", 50 )
		buttonPrompt.buttonImage:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	end
end

CoD.ButtonPrompt.MouseLeave = function ( buttonPrompt, event )
	if buttonPrompt.buttonImage == nil then
		return 
	else
		local height = CoD.ButtonPrompt.TextHeight
		buttonPrompt.buttonImage:beginAnimation( "default", 50 )
		buttonPrompt.buttonImage:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	end
end

