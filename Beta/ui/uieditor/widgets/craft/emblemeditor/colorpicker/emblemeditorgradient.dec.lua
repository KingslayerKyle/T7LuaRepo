require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemGradientColorButton" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorGradientSliderBar" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorGradientTypeButton" )

CoD.EmblemEditorGradient = InheritFrom( LUI.UIElement )
CoD.EmblemEditorGradient.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorGradient )
	self.id = "EmblemEditorGradient"
	self.soundSet = "SelectColor_ColorSwatchPicker"
	self:setLeftRight( true, false, 0, 671 )
	self:setTopBottom( true, false, 0, 175 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ColorPickerBkgd0 = LUI.UIImage.new()
	ColorPickerBkgd0:setLeftRight( true, true, 0, 0 )
	ColorPickerBkgd0:setTopBottom( true, true, 0, 0 )
	ColorPickerBkgd0:setRGB( 0.09, 0.1, 0.12 )
	ColorPickerBkgd0:setZRot( 180 )
	self:addElement( ColorPickerBkgd0 )
	self.ColorPickerBkgd0 = ColorPickerBkgd0
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( true, false, 0, 671 )
	EmblemEditorFrame0:setTopBottom( true, false, 0, 175 )
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	local gradientColor0 = CoD.EmblemGradientColorButton.new( menu, controller )
	gradientColor0:setLeftRight( true, false, 21.73, 336.73 )
	gradientColor0:setTopBottom( true, false, 6.42, 38.42 )
	gradientColor0.colorName:setText( Engine.Localize( "MENU_EMBLEM_COLOR_1" ) )
	gradientColor0.buttonBorder:setAlpha( 1 )
	gradientColor0:subscribeToGlobalModel( controller, "EmblemSelectedLayerColor", "color", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gradientColor0.color:setRGB( modelValue )
		end
	end )
	gradientColor0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		EmblemGradient_Color0GainFocus( self, element, controller )
		return retVal
	end )
	gradientColor0:mergeStateConditions( {
		{
			stateName = "NoColor",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isColor0NoColor", 1 )
			end
		}
	} )
	gradientColor0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isColor0NoColor" ), function ( model )
		menu:updateElementState( gradientColor0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isColor0NoColor"
		} )
	end )
	self:addElement( gradientColor0 )
	self.gradientColor0 = gradientColor0
	
	local gradientColor1 = CoD.EmblemGradientColorButton.new( menu, controller )
	gradientColor1:setLeftRight( true, false, 339.89, 654.89 )
	gradientColor1:setTopBottom( true, false, 6.42, 38.42 )
	gradientColor1.colorName:setText( Engine.Localize( "MENU_EMBLEM_COLOR_2" ) )
	gradientColor1.buttonBorder:setAlpha( 1 )
	gradientColor1:subscribeToGlobalModel( controller, "EmblemSelectedLayerColor1", "color", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gradientColor1.color:setRGB( modelValue )
		end
	end )
	gradientColor1:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		EmblemGradient_Color1GainFocus( self, element, controller )
		return retVal
	end )
	gradientColor1:mergeStateConditions( {
		{
			stateName = "NoColor",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isColor1NoColor", 1 )
			end
		}
	} )
	gradientColor1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isColor1NoColor" ), function ( model )
		menu:updateElementState( gradientColor1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isColor1NoColor"
		} )
	end )
	self:addElement( gradientColor1 )
	self.gradientColor1 = gradientColor1
	
	local gradientSlider = CoD.EmblemEditorGradientSliderBar.new( menu, controller )
	gradientSlider:setLeftRight( true, false, 21.73, 650.73 )
	gradientSlider:setTopBottom( true, false, 83.5, 115.5 )
	gradientSlider.bar:setShaderVector( 0, 0, 0, 0, 1 )
	gradientSlider.bar:setShaderVector( 1, 1, 1, 1, 1 )
	gradientSlider:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		EmblemGradient_ColorGradientSliderGainFocus( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LEFT )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		return retVal
	end )
	gradientSlider:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( gradientSlider, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		EmblemGradient_UpdateGradientFillByStep( self, element, "-0.01", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( gradientSlider, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		EmblemGradient_UpdateGradientFillByStep( self, element, "0.01", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "" )
		return false
	end, false )
	self:addElement( gradientSlider )
	self.gradientSlider = gradientSlider
	
	local gradientSliderHeader = LUI.UIText.new()
	gradientSliderHeader:setLeftRight( true, false, 32.66, 232.66 )
	gradientSliderHeader:setTopBottom( true, false, 47.11, 72.11 )
	gradientSliderHeader:setText( Engine.Localize( "MENU_EMBLEM_GRADIENT_SLIDER" ) )
	gradientSliderHeader:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	gradientSliderHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gradientSliderHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( gradientSliderHeader )
	self.gradientSliderHeader = gradientSliderHeader
	
	local gradientType = CoD.EmblemEditorGradientTypeButton.new( menu, controller )
	gradientType:setLeftRight( true, false, 1.16, 424.16 )
	gradientType:setTopBottom( true, false, 138, 175 )
	gradientType:mergeStateConditions( {
		{
			stateName = "RadialState",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemSelectedLayerProperties.gradient_type", Enum.CustomizationGradientType.CUSTOMIZATION_GRADIENT_LINEAR )
			end
		},
		{
			stateName = "LinearState",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemSelectedLayerProperties.gradient_type", Enum.CustomizationGradientType.CUSTOMIZATION_GRADIENT_RADIAL )
			end
		}
	} )
	gradientType:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.gradient_type" ), function ( model )
		menu:updateElementState( gradientType, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemSelectedLayerProperties.gradient_type"
		} )
	end )
	self:addElement( gradientType )
	self.gradientType = gradientType
	
	local gradientFillValue = LUI.UIText.new()
	gradientFillValue:setLeftRight( true, false, 616.73, 650.73 )
	gradientFillValue:setTopBottom( true, false, 49.11, 74.11 )
	gradientFillValue:setTTF( "fonts/default.ttf" )
	gradientFillValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	gradientFillValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	gradientFillValue:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "gradient_fill", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gradientFillValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( gradientFillValue )
	self.gradientFillValue = gradientFillValue
	
	gradientColor0.navigation = {
		right = gradientColor1,
		down = gradientSlider
	}
	gradientColor1.navigation = {
		left = gradientColor0,
		down = gradientSlider
	}
	gradientSlider.navigation = {
		up = {
			gradientColor0,
			gradientColor1
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				gradientColor0:completeAnimation()
				self.gradientColor0:setAlpha( 1 )
				self.clipFinished( gradientColor0, {} )
				gradientColor1:completeAnimation()
				self.gradientColor1:setAlpha( 1 )
				self.clipFinished( gradientColor1, {} )
				gradientSlider:completeAnimation()
				self.gradientSlider:setAlpha( 1 )
				self.clipFinished( gradientSlider, {} )
				gradientSliderHeader:completeAnimation()
				self.gradientSliderHeader:setAlpha( 1 )
				self.clipFinished( gradientSliderHeader, {} )
				gradientType:completeAnimation()
				self.gradientType:setAlpha( 1 )
				self.clipFinished( gradientType, {} )
				gradientFillValue:completeAnimation()
				self.gradientFillValue:setAlpha( 1 )
				self.clipFinished( gradientFillValue, {} )
			end
		},
		Color0State = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				gradientColor0:completeAnimation()
				gradientColor0.buttonBorder:completeAnimation()
				self.gradientColor0:setAlpha( 1 )
				self.gradientColor0.buttonBorder:setAlpha( 1 )
				self.clipFinished( gradientColor0, {} )
				gradientColor1:completeAnimation()
				self.gradientColor1:setAlpha( 0.1 )
				self.clipFinished( gradientColor1, {} )
				gradientSlider:completeAnimation()
				self.gradientSlider:setAlpha( 0 )
				self.clipFinished( gradientSlider, {} )
				gradientSliderHeader:completeAnimation()
				self.gradientSliderHeader:setAlpha( 0 )
				self.clipFinished( gradientSliderHeader, {} )
				gradientType:completeAnimation()
				self.gradientType:setAlpha( 0 )
				self.clipFinished( gradientType, {} )
				gradientFillValue:completeAnimation()
				self.gradientFillValue:setAlpha( 0 )
				self.clipFinished( gradientFillValue, {} )
			end
		},
		Color1State = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				gradientColor0:completeAnimation()
				self.gradientColor0:setAlpha( 0.1 )
				self.clipFinished( gradientColor0, {} )
				gradientColor1:completeAnimation()
				gradientColor1.buttonBorder:completeAnimation()
				self.gradientColor1:setAlpha( 1 )
				self.gradientColor1.buttonBorder:setAlpha( 1 )
				self.clipFinished( gradientColor1, {} )
				gradientSlider:completeAnimation()
				self.gradientSlider:setAlpha( 0 )
				self.clipFinished( gradientSlider, {} )
				gradientSliderHeader:completeAnimation()
				self.gradientSliderHeader:setAlpha( 0 )
				self.clipFinished( gradientSliderHeader, {} )
				gradientType:completeAnimation()
				self.gradientType:setAlpha( 0 )
				self.clipFinished( gradientType, {} )
				gradientFillValue:completeAnimation()
				self.gradientFillValue:setAlpha( 0 )
				self.clipFinished( gradientFillValue, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	gradientColor0.id = "gradientColor0"
	gradientColor1.id = "gradientColor1"
	gradientSlider.id = "gradientSlider"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.gradientColor0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.EmblemEditorFrame0:close()
		self.gradientColor0:close()
		self.gradientColor1:close()
		self.gradientSlider:close()
		self.gradientType:close()
		self.gradientFillValue:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

