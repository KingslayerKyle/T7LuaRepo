require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerBar" )

CoD.EmblemEditorColorMixer = InheritFrom( LUI.UIElement )
CoD.EmblemEditorColorMixer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorColorMixer )
	self.id = "EmblemEditorColorMixer"
	self.soundSet = "SelectColor_ColorMixer"
	self:setLeftRight( true, false, 0, 671 )
	self:setTopBottom( true, false, 0, 161 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, false, 0, 671 )
	border:setTopBottom( true, false, 0, 161 )
	border:setRGB( 1, 1, 1 )
	border:setAlpha( 0.1 )
	self:addElement( border )
	self.border = border
	
	local redColorValue = LUI.UIText.new()
	redColorValue:setLeftRight( false, true, -64, -23 )
	redColorValue:setTopBottom( true, false, 23.5, 48.5 )
	redColorValue:setRGB( 1, 1, 1 )
	redColorValue:setTTF( "fonts/default.ttf" )
	redColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	redColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	redColorValue:linkToElementModel( self, "red", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			redColorValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( redColorValue )
	self.redColorValue = redColorValue
	
	local greenColorValue = LUI.UIText.new()
	greenColorValue:setLeftRight( false, true, -64, -23 )
	greenColorValue:setTopBottom( true, false, 70, 95 )
	greenColorValue:setRGB( 1, 1, 1 )
	greenColorValue:setTTF( "fonts/default.ttf" )
	greenColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	greenColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	greenColorValue:linkToElementModel( self, "green", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			greenColorValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( greenColorValue )
	self.greenColorValue = greenColorValue
	
	local blueColorValue = LUI.UIText.new()
	blueColorValue:setLeftRight( false, true, -64, -23 )
	blueColorValue:setTopBottom( true, false, 112, 137 )
	blueColorValue:setRGB( 1, 1, 1 )
	blueColorValue:setTTF( "fonts/default.ttf" )
	blueColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	blueColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	blueColorValue:linkToElementModel( self, "blue", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			blueColorValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( blueColorValue )
	self.blueColorValue = blueColorValue
	
	local previewColor = LUI.UIImage.new()
	previewColor:setLeftRight( true, false, 32.54, 79.54 )
	previewColor:setTopBottom( true, false, 56, 137 )
	previewColor:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	previewColor:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			previewColor:setRGB( modelValue )
		end
	end )
	self:addElement( previewColor )
	self.previewColor = previewColor
	
	local separatorLine = LUI.UIImage.new()
	separatorLine:setLeftRight( true, false, 114.38, 116.38 )
	separatorLine:setTopBottom( true, false, 1.5, 161 )
	separatorLine:setRGB( 1, 1, 1 )
	separatorLine:setAlpha( 0.1 )
	separatorLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( separatorLine )
	self.separatorLine = separatorLine
	
	local colorText = LUI.UITightText.new()
	colorText:setLeftRight( true, false, 32.54, 79.54 )
	colorText:setTopBottom( true, false, 23.5, 48.5 )
	colorText:setRGB( 1, 1, 1 )
	colorText:setText( Engine.Localize( "MENU_EMBLEM_COLOR" ) )
	colorText:setTTF( "fonts/default.ttf" )
	self:addElement( colorText )
	self.colorText = colorText
	
	local redColor = LUI.UITightText.new()
	redColor:setLeftRight( true, false, 139, 173 )
	redColor:setTopBottom( true, false, 23.5, 48.5 )
	redColor:setRGB( 1, 1, 1 )
	redColor:setText( Engine.Localize( "MENU_EMBLEM_RGB_RED" ) )
	redColor:setTTF( "fonts/default.ttf" )
	self:addElement( redColor )
	self.redColor = redColor
	
	local greenColor = LUI.UITightText.new()
	greenColor:setLeftRight( true, false, 139, 195 )
	greenColor:setTopBottom( true, false, 68, 93 )
	greenColor:setRGB( 1, 1, 1 )
	greenColor:setText( Engine.Localize( "MENU_EMBLEM_RGB_GREEN" ) )
	greenColor:setTTF( "fonts/default.ttf" )
	self:addElement( greenColor )
	self.greenColor = greenColor
	
	local blueColor = LUI.UITightText.new()
	blueColor:setLeftRight( true, false, 139, 178 )
	blueColor:setTopBottom( true, false, 113.25, 138.25 )
	blueColor:setRGB( 1, 1, 1 )
	blueColor:setText( Engine.Localize( "MENU_EMBLEM_RGB_BLUE" ) )
	blueColor:setTTF( "fonts/default.ttf" )
	self:addElement( blueColor )
	self.blueColor = blueColor
	
	local redBar = CoD.EmblemEditorColorMixerBar.new( menu, controller )
	redBar:setLeftRight( true, false, 216.47, 584.47 )
	redBar:setTopBottom( true, false, 26, 46 )
	redBar:setRGB( 1, 1, 1 )
	redBar.bar:setShaderVector( 0, 0, 0, 0, 1 )
	redBar.bar:setShaderVector( 1, 1, 1, 1, 1 )
	redBar.buttonPromptAddFunctions = {}
	redBar.buttonPromptAddFunctions.left = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	redBar.buttonPromptAddFunctions.dpad_left = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	redBar.buttonPromptAddFunctions.right = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	redBar.buttonPromptAddFunctions.dpad_right = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	redBar:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "left" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_DecrementColorComponent( self, element, controller, "red" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not self.occludedBy and (not (event.button ~= "left" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_DecrementColorComponent( self, element, controller, "red" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not self.occludedBy and (event.button == "right" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_IncrementColorComponent( self, element, controller, "red" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not self.occludedBy and (not (event.button ~= "right" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_IncrementColorComponent( self, element, controller, "red" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	redBar:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.left( menu, element, event )
		element.buttonPromptAddFunctions.dpad_left( menu, element, event )
		element.buttonPromptAddFunctions.right( menu, element, event )
		element.buttonPromptAddFunctions.dpad_right( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	redBar:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "left", element )
		menu:removeButtonPrompt( "dpad_left", element )
		menu:removeButtonPrompt( "right", element )
		menu:removeButtonPrompt( "dpad_right", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( redBar )
	self.redBar = redBar
	
	local greenBar = CoD.EmblemEditorColorMixerBar.new( menu, controller )
	greenBar:setLeftRight( true, false, 216.47, 584.47 )
	greenBar:setTopBottom( true, false, 71.25, 91.25 )
	greenBar:setRGB( 1, 1, 1 )
	greenBar.bar:setShaderVector( 0, 0, 0, 0, 1 )
	greenBar.bar:setShaderVector( 1, 1, 1, 1, 1 )
	greenBar.buttonPromptAddFunctions = {}
	greenBar.buttonPromptAddFunctions.left = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	greenBar.buttonPromptAddFunctions.dpad_left = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	greenBar.buttonPromptAddFunctions.dpad_right = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	greenBar.buttonPromptAddFunctions.right = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	greenBar:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "left" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_DecrementColorComponent( self, element, controller, "green" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not self.occludedBy and (not (event.button ~= "left" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_DecrementColorComponent( self, element, controller, "green" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not self.occludedBy and (not (event.button ~= "right" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_IncrementColorComponent( self, element, controller, "green" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not self.occludedBy and (event.button == "right" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_IncrementColorComponent( self, element, controller, "green" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	greenBar:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.left( menu, element, event )
		element.buttonPromptAddFunctions.dpad_left( menu, element, event )
		element.buttonPromptAddFunctions.dpad_right( menu, element, event )
		element.buttonPromptAddFunctions.right( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	greenBar:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "left", element )
		menu:removeButtonPrompt( "dpad_left", element )
		menu:removeButtonPrompt( "dpad_right", element )
		menu:removeButtonPrompt( "right", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( greenBar )
	self.greenBar = greenBar
	
	local blueBar = CoD.EmblemEditorColorMixerBar.new( menu, controller )
	blueBar:setLeftRight( true, false, 216.47, 584.47 )
	blueBar:setTopBottom( true, false, 114.5, 137 )
	blueBar:setRGB( 1, 1, 1 )
	blueBar.bar:setShaderVector( 0, 0, 0, 0, 1 )
	blueBar.bar:setShaderVector( 1, 1, 1, 1, 1 )
	blueBar.buttonPromptAddFunctions = {}
	blueBar.buttonPromptAddFunctions.left = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	blueBar.buttonPromptAddFunctions.dpad_left = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	blueBar.buttonPromptAddFunctions.right = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	blueBar.buttonPromptAddFunctions.dpad_right = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	blueBar:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "left" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_DecrementColorComponent( self, element, controller, "blue" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not self.occludedBy and (not (event.button ~= "left" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_DecrementColorComponent( self, element, controller, "blue" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not self.occludedBy and (event.button == "right" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_IncrementColorComponent( self, element, controller, "blue" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not self.occludedBy and (not (event.button ~= "right" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			EmblemChooseColor_IncrementColorComponent( self, element, controller, "blue" )
			PlaySoundSetSound( self, "manipulate_slider" )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	blueBar:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.left( menu, element, event )
		element.buttonPromptAddFunctions.dpad_left( menu, element, event )
		element.buttonPromptAddFunctions.right( menu, element, event )
		element.buttonPromptAddFunctions.dpad_right( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	blueBar:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "left", element )
		menu:removeButtonPrompt( "dpad_left", element )
		menu:removeButtonPrompt( "right", element )
		menu:removeButtonPrompt( "dpad_right", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( blueBar )
	self.blueBar = blueBar
	
	redBar.navigation = {
		down = greenBar
	}
	greenBar.navigation = {
		up = redBar,
		down = blueBar
	}
	blueBar.navigation = {
		up = greenBar
	}
	redBar.id = "redBar"
	greenBar.id = "greenBar"
	blueBar.id = "blueBar"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.redBar:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.border:close()
		self.redBar:close()
		self.greenBar:close()
		self.blueBar:close()
		self.redColorValue:close()
		self.greenColorValue:close()
		self.blueColorValue:close()
		self.previewColor:close()
		CoD.EmblemEditorColorMixer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

