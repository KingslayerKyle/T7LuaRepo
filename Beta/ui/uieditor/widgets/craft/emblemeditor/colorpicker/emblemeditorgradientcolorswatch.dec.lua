require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemColorElement" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )

CoD.EmblemEditorGradientColorSwatch = InheritFrom( LUI.UIElement )
CoD.EmblemEditorGradientColorSwatch.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorGradientColorSwatch )
	self.id = "EmblemEditorGradientColorSwatch"
	self.soundSet = "SelectColor_ColorSwatchPicker"
	self:setLeftRight( true, false, 0, 710 )
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
	
	local lastSavedColor = CoD.EmblemColorElement.new( menu, controller )
	lastSavedColor:setLeftRight( true, false, 43, 81 )
	lastSavedColor:setTopBottom( true, false, 4.5, 148.5 )
	lastSavedColor:linkToElementModel( self, nil, false, function ( model )
		lastSavedColor:setModel( model, controller )
	end )
	lastSavedColor:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		if IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorNum", Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 ) then
			EmblemChooseColor_SelectionChanged( self, element, controller )
			SetProperty( self, "isColor0NoColor", false )
		elseif IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorNum", Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 ) then
			EmblemChooseColor_SelectionChanged( self, element, controller )
			SetProperty( self, "isColor1NoColor", false )
		end
		return retVal
	end )
	self:addElement( lastSavedColor )
	self.lastSavedColor = lastSavedColor
	
	local emblemColorSwatch = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	emblemColorSwatch:makeFocusable()
	emblemColorSwatch:setLeftRight( true, false, 82, 706 )
	emblemColorSwatch:setTopBottom( true, false, 4.5, 148.5 )
	emblemColorSwatch:setDataSource( "EmblemColorList" )
	emblemColorSwatch:setWidgetType( CoD.EmblemColorElement )
	emblemColorSwatch:setHorizontalCount( 13 )
	emblemColorSwatch:setVerticalCount( 9 )
	emblemColorSwatch:setSpacing( 0 )
	emblemColorSwatch:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorNum", Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 ) then
			EmblemChooseColor_SelectionChanged( self, element, controller )
			SetProperty( self, "isColor0NoColor", false )
		elseif IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorNum", Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 ) then
			EmblemChooseColor_SelectionChanged( self, element, controller )
			SetProperty( self, "isColor1NoColor", false )
		end
		return retVal
	end )
	self:addElement( emblemColorSwatch )
	self.emblemColorSwatch = emblemColorSwatch
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( true, false, 0, 710 )
	EmblemEditorFrame0:setTopBottom( true, false, 0, 175 )
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	local toggleColorMixerButton = CoD.PaintshopButtonPrompt.new( menu, controller )
	toggleColorMixerButton:setLeftRight( true, false, 4, 237 )
	toggleColorMixerButton:setTopBottom( true, false, 149.5, 180.5 )
	toggleColorMixerButton.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_COLOR_MIXER" ) )
	toggleColorMixerButton:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			toggleColorMixerButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( toggleColorMixerButton )
	self.toggleColorMixerButton = toggleColorMixerButton
	
	local noColor = CoD.EmblemColorElement.new( menu, controller )
	noColor:setLeftRight( true, false, 4, 42 )
	noColor:setTopBottom( true, false, 4.5, 148.5 )
	noColor.colorElement:setImage( RegisterImage( "uie_t7_menu_paintshop_transparent" ) )
	noColor:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		if IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorNum", Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 ) then
			EmblemChooseColor_SelectNoColor( self, element, controller )
			SetProperty( self, "isColor0NoColor", true )
		elseif IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorNum", Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 ) then
			EmblemChooseColor_SelectNoColor( self, element, controller )
			SetProperty( self, "isColor1NoColor", true )
		end
		return retVal
	end )
	noColor:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		EmblemChooseColor_NoColorLoseFocus( self, element, controller )
		return retVal
	end )
	self:addElement( noColor )
	self.noColor = noColor
	
	lastSavedColor.navigation = {
		left = noColor,
		right = emblemColorSwatch
	}
	emblemColorSwatch.navigation = {
		left = lastSavedColor
	}
	noColor.navigation = {
		right = lastSavedColor
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	lastSavedColor.id = "lastSavedColor"
	emblemColorSwatch.id = "emblemColorSwatch"
	noColor.id = "noColor"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lastSavedColor:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.lastSavedColor:close()
		self.emblemColorSwatch:close()
		self.EmblemEditorFrame0:close()
		self.toggleColorMixerButton:close()
		self.noColor:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

