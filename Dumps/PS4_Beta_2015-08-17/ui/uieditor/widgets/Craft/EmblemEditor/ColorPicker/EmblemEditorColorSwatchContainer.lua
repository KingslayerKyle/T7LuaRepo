require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemColorElement" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )

CoD.EmblemEditorColorSwatchContainer = InheritFrom( LUI.UIElement )
CoD.EmblemEditorColorSwatchContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorColorSwatchContainer )
	self.id = "EmblemEditorColorSwatchContainer"
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
	ColorPickerBkgd0:setAlpha( 0.9 )
	ColorPickerBkgd0:setZRot( 180 )
	self:addElement( ColorPickerBkgd0 )
	self.ColorPickerBkgd0 = ColorPickerBkgd0
	
	local lastSavedColor = CoD.EmblemColorElement.new( menu, controller )
	lastSavedColor:setLeftRight( true, false, 4, 42 )
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
		EmblemChooseColor_SelectionChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	lastSavedColor:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( lastSavedColor, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		EmblemChooseColor_SelectionChanged( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( lastSavedColor )
	self.lastSavedColor = lastSavedColor
	
	local emblemColorSwatch = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	emblemColorSwatch:makeFocusable()
	emblemColorSwatch:setLeftRight( true, false, 43, 667 )
	emblemColorSwatch:setTopBottom( true, false, 4.5, 148.5 )
	emblemColorSwatch:setDataSource( "EmblemColorList" )
	emblemColorSwatch:setWidgetType( CoD.EmblemColorElement )
	emblemColorSwatch:setHorizontalCount( 13 )
	emblemColorSwatch:setVerticalCount( 9 )
	emblemColorSwatch:setSpacing( 0 )
	emblemColorSwatch:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		EmblemChooseColor_SelectionChanged( self, element, controller )
		return retVal
	end )
	self:addElement( emblemColorSwatch )
	self.emblemColorSwatch = emblemColorSwatch
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( true, false, 0, 671 )
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
	
	lastSavedColor.navigation = {
		right = emblemColorSwatch
	}
	emblemColorSwatch.navigation = {
		left = lastSavedColor
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	lastSavedColor.id = "lastSavedColor"
	emblemColorSwatch.id = "emblemColorSwatch"
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
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

