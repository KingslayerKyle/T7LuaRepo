require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerBar" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )

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
	self:setTopBottom( true, false, 0, 175 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local redColorValue = LUI.UIText.new()
	redColorValue:setLeftRight( true, true, 607, -23 )
	redColorValue:setTopBottom( true, false, 17.5, 42.5 )
	redColorValue:setTTF( "fonts/default.ttf" )
	redColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	redColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	redColorValue:linkToElementModel( self, "red", true, function ( model )
		local red = Engine.GetModelValue( model )
		if red then
			redColorValue:setText( Engine.Localize( red ) )
		end
	end )
	self:addElement( redColorValue )
	self.redColorValue = redColorValue
	
	local greenColorValue = LUI.UIText.new()
	greenColorValue:setLeftRight( true, true, 607, -23 )
	greenColorValue:setTopBottom( true, false, 62, 87 )
	greenColorValue:setTTF( "fonts/default.ttf" )
	greenColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	greenColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	greenColorValue:linkToElementModel( self, "green", true, function ( model )
		local green = Engine.GetModelValue( model )
		if green then
			greenColorValue:setText( Engine.Localize( green ) )
		end
	end )
	self:addElement( greenColorValue )
	self.greenColorValue = greenColorValue
	
	local blueColorValue = LUI.UIText.new()
	blueColorValue:setLeftRight( true, true, 607, -23 )
	blueColorValue:setTopBottom( true, false, 103, 128 )
	blueColorValue:setTTF( "fonts/default.ttf" )
	blueColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	blueColorValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	blueColorValue:linkToElementModel( self, "blue", true, function ( model )
		local blue = Engine.GetModelValue( model )
		if blue then
			blueColorValue:setText( Engine.Localize( blue ) )
		end
	end )
	self:addElement( blueColorValue )
	self.blueColorValue = blueColorValue
	
	local previewColor = LUI.UIImage.new()
	previewColor:setLeftRight( true, false, 32.54, 79.54 )
	previewColor:setTopBottom( true, false, 42, 123 )
	previewColor:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			previewColor:setRGB( color )
		end
	end )
	self:addElement( previewColor )
	self.previewColor = previewColor
	
	local separatorLine = LUI.UIImage.new()
	separatorLine:setLeftRight( true, false, 114.38, 116.38 )
	separatorLine:setTopBottom( true, false, 1.5, 148 )
	separatorLine:setAlpha( 0.1 )
	self:addElement( separatorLine )
	self.separatorLine = separatorLine
	
	local colorText = LUI.UITightText.new()
	colorText:setLeftRight( true, false, 32.54, 79.54 )
	colorText:setTopBottom( true, false, 8.5, 33.5 )
	colorText:setText( Engine.Localize( "MENU_EMBLEM_COLOR" ) )
	colorText:setTTF( "fonts/default.ttf" )
	self:addElement( colorText )
	self.colorText = colorText
	
	local redColor = LUI.UITightText.new()
	redColor:setLeftRight( true, false, 139, 173 )
	redColor:setTopBottom( true, false, 16.5, 41.5 )
	redColor:setText( Engine.Localize( "MENU_EMBLEM_RGB_RED" ) )
	redColor:setTTF( "fonts/default.ttf" )
	self:addElement( redColor )
	self.redColor = redColor
	
	local greenColor = LUI.UITightText.new()
	greenColor:setLeftRight( true, false, 139, 195 )
	greenColor:setTopBottom( true, false, 60, 85 )
	greenColor:setText( Engine.Localize( "MENU_EMBLEM_RGB_GREEN" ) )
	greenColor:setTTF( "fonts/default.ttf" )
	self:addElement( greenColor )
	self.greenColor = greenColor
	
	local blueColor = LUI.UITightText.new()
	blueColor:setLeftRight( true, false, 139, 178 )
	blueColor:setTopBottom( true, false, 104.25, 129.25 )
	blueColor:setText( Engine.Localize( "MENU_EMBLEM_RGB_BLUE" ) )
	blueColor:setTTF( "fonts/default.ttf" )
	self:addElement( blueColor )
	self.blueColor = blueColor
	
	local redBar = CoD.EmblemEditorColorMixerBar.new( menu, controller )
	redBar:setLeftRight( true, false, 216.47, 584.47 )
	redBar:setTopBottom( true, false, 20, 40 )
	redBar.bar:setShaderVector( 0, 0, 0, 0, 1 )
	redBar.bar:setShaderVector( 1, 1, 1, 1, 1 )
	redBar:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LEFT )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		return f6_local0
	end )
	redBar:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( redBar, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_DecrementColorComponent( self, element, controller, "red" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( redBar, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_IncrementColorComponent( self, element, controller, "red" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "" )
		return false
	end, false )
	self:addElement( redBar )
	self.redBar = redBar
	
	local greenBar = CoD.EmblemEditorColorMixerBar.new( menu, controller )
	greenBar:setLeftRight( true, false, 216.47, 584.47 )
	greenBar:setTopBottom( true, false, 63.25, 83.25 )
	greenBar.bar:setShaderVector( 0, 0, 0, 0, 1 )
	greenBar.bar:setShaderVector( 1, 1, 1, 1, 1 )
	greenBar:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LEFT )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		return f12_local0
	end )
	greenBar:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	menu:AddButtonCallbackFunction( greenBar, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_DecrementColorComponent( self, element, controller, "green" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( greenBar, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_IncrementColorComponent( self, element, controller, "green" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "" )
		return false
	end, false )
	self:addElement( greenBar )
	self.greenBar = greenBar
	
	local blueBar = CoD.EmblemEditorColorMixerBar.new( menu, controller )
	blueBar:setLeftRight( true, false, 216.47, 584.47 )
	blueBar:setTopBottom( true, false, 105.5, 128 )
	blueBar.bar:setShaderVector( 0, 0, 0, 0, 1 )
	blueBar.bar:setShaderVector( 1, 1, 1, 1, 1 )
	blueBar:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LEFT )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		return f18_local0
	end )
	blueBar:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	menu:AddButtonCallbackFunction( blueBar, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_DecrementColorComponent( self, element, controller, "blue" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( blueBar, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		EmblemChooseColor_IncrementColorComponent( self, element, controller, "blue" )
		PlaySoundSetSound( self, "manipulate_slider" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "" )
		return false
	end, false )
	self:addElement( blueBar )
	self.blueBar = blueBar
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, false, 148, 146 )
	Image0:setAlpha( 0.1 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local toggleSolidColorButton = CoD.PaintshopButtonPrompt.new( menu, controller )
	toggleSolidColorButton:setLeftRight( true, false, 4, 237 )
	toggleSolidColorButton:setTopBottom( true, false, 149.5, 180.5 )
	toggleSolidColorButton.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_SOLID_FILL" ) )
	toggleSolidColorButton:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local backButtonImage = Engine.GetModelValue( model )
		if backButtonImage then
			toggleSolidColorButton.buttonPromptImage:setImage( RegisterImage( backButtonImage ) )
		end
	end )
	self:addElement( toggleSolidColorButton )
	self.toggleSolidColorButton = toggleSolidColorButton
	
	local mixerFrame = CoD.EmblemEditorFrame.new( menu, controller )
	mixerFrame:setLeftRight( true, true, 0, 0 )
	mixerFrame:setTopBottom( true, true, 0, 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.redBar:close()
		element.greenBar:close()
		element.blueBar:close()
		element.toggleSolidColorButton:close()
		element.mixerFrame:close()
		element.redColorValue:close()
		element.greenColorValue:close()
		element.blueColorValue:close()
		element.previewColor:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

