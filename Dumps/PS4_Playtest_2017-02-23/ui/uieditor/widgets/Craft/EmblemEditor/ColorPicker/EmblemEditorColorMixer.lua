require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerBar" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )

local SetupPC = function ( self, controller, menu )
	self.redBar.m_colorMixer = self
	self.redBar.m_color = "red"
	self.greenBar.m_colorMixer = self
	self.greenBar.m_color = "green"
	self.blueBar.m_colorMixer = self
	self.blueBar.m_color = "blue"
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

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
	self:setLeftRight( 0, 0, 0, 1006 )
	self:setTopBottom( 0, 0, 0, 262 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local redColorValue = LUI.UIText.new()
	redColorValue:setLeftRight( 0, 1, 910, -34 )
	redColorValue:setTopBottom( 0, 0, 26, 64 )
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
	greenColorValue:setLeftRight( 0, 1, 910, -34 )
	greenColorValue:setTopBottom( 0, 0, 93, 131 )
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
	blueColorValue:setLeftRight( 0, 1, 910, -34 )
	blueColorValue:setTopBottom( 0, 0, 154, 192 )
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
	previewColor:setLeftRight( 0, 0, 49, 119 )
	previewColor:setTopBottom( 0, 0, 63, 185 )
	previewColor:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			previewColor:setRGB( modelValue )
		end
	end )
	self:addElement( previewColor )
	self.previewColor = previewColor
	
	local separatorLine = LUI.UIImage.new()
	separatorLine:setLeftRight( 0, 0, 172, 175 )
	separatorLine:setTopBottom( 0, 0, 2, 222 )
	separatorLine:setAlpha( 0.1 )
	self:addElement( separatorLine )
	self.separatorLine = separatorLine
	
	local colorText = LUI.UITightText.new()
	colorText:setLeftRight( 0, 0, 49, 119 )
	colorText:setTopBottom( 0, 0, 12, 50 )
	colorText:setText( Engine.Localize( "MENU_EMBLEM_COLOR" ) )
	colorText:setTTF( "fonts/default.ttf" )
	self:addElement( colorText )
	self.colorText = colorText
	
	local redColor = LUI.UITightText.new()
	redColor:setLeftRight( 0, 0, 208, 259 )
	redColor:setTopBottom( 0, 0, 24, 62 )
	redColor:setText( Engine.Localize( "MENU_EMBLEM_RGB_RED" ) )
	redColor:setTTF( "fonts/default.ttf" )
	self:addElement( redColor )
	self.redColor = redColor
	
	local greenColor = LUI.UITightText.new()
	greenColor:setLeftRight( 0, 0, 208, 292 )
	greenColor:setTopBottom( 0, 0, 90, 128 )
	greenColor:setText( Engine.Localize( "MENU_EMBLEM_RGB_GREEN" ) )
	greenColor:setTTF( "fonts/default.ttf" )
	self:addElement( greenColor )
	self.greenColor = greenColor
	
	local blueColor = LUI.UITightText.new()
	blueColor:setLeftRight( 0, 0, 209, 267 )
	blueColor:setTopBottom( 0, 0, 156, 194 )
	blueColor:setText( Engine.Localize( "MENU_EMBLEM_RGB_BLUE" ) )
	blueColor:setTTF( "fonts/default.ttf" )
	self:addElement( blueColor )
	self.blueColor = blueColor
	
	local redBar = CoD.EmblemEditorColorMixerBar.new( menu, controller )
	redBar:setLeftRight( 0, 0, 325, 877 )
	redBar:setTopBottom( 0, 0, 30, 60 )
	redBar.bar:setShaderVector( 0, 0, 0, 0, 1 )
	redBar.bar:setShaderVector( 1, 1, 1, 1, 1 )
	redBar:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LEFT )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		return retVal
	end )
	redBar:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( redBar, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_DecrementColorComponent( self, element, controller, "red" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "", nil )
		return false
	end, false )
	menu:AddButtonCallbackFunction( redBar, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_IncrementColorComponent( self, element, controller, "red" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "", nil )
		return false
	end, false )
	self:addElement( redBar )
	self.redBar = redBar
	
	local greenBar = CoD.EmblemEditorColorMixerBar.new( menu, controller )
	greenBar:setLeftRight( 0, 0, 325, 877 )
	greenBar:setTopBottom( 0, 0, 95, 125 )
	greenBar.bar:setShaderVector( 0, 0, 0, 0, 1 )
	greenBar.bar:setShaderVector( 1, 1, 1, 1, 1 )
	greenBar:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LEFT )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		return retVal
	end )
	greenBar:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( greenBar, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_DecrementColorComponent( self, element, controller, "green" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "", nil )
		return false
	end, false )
	menu:AddButtonCallbackFunction( greenBar, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_IncrementColorComponent( self, element, controller, "green" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "", nil )
		return false
	end, false )
	self:addElement( greenBar )
	self.greenBar = greenBar
	
	local blueBar = CoD.EmblemEditorColorMixerBar.new( menu, controller )
	blueBar:setLeftRight( 0, 0, 325, 877 )
	blueBar:setTopBottom( 0, 0, 158, 192 )
	blueBar.bar:setShaderVector( 0, 0, 0, 0, 1 )
	blueBar.bar:setShaderVector( 1, 1, 1, 1, 1 )
	blueBar:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LEFT )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		return retVal
	end )
	blueBar:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( blueBar, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_DecrementColorComponent( self, element, controller, "blue" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "", nil )
		return false
	end, false )
	menu:AddButtonCallbackFunction( blueBar, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_IncrementColorComponent( self, element, controller, "blue" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "", nil )
		return false
	end, false )
	self:addElement( blueBar )
	self.blueBar = blueBar
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 0, 0 )
	Image0:setTopBottom( 0, 0, 221.5, 218.5 )
	Image0:setAlpha( 0.1 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local toggleSolidColorButton = CoD.PaintshopButtonPrompt.new( menu, controller )
	toggleSolidColorButton:setLeftRight( 0, 0, 6, 356 )
	toggleSolidColorButton:setTopBottom( 0, 0, 225, 271 )
	toggleSolidColorButton.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_SOLID_FILL" ) )
	toggleSolidColorButton:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			toggleSolidColorButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( toggleSolidColorButton )
	self.toggleSolidColorButton = toggleSolidColorButton
	
	local mixerFrame = CoD.EmblemEditorFrame.new( menu, controller )
	mixerFrame:setLeftRight( 0, 1, 0, 0 )
	mixerFrame:setTopBottom( 0, 1, 0, 0 )
	self:addElement( mixerFrame )
	self.mixerFrame = mixerFrame
	
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.redBar:close()
		self.greenBar:close()
		self.blueBar:close()
		self.toggleSolidColorButton:close()
		self.mixerFrame:close()
		self.redColorValue:close()
		self.greenColorValue:close()
		self.blueColorValue:close()
		self.previewColor:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

