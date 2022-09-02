-- ecd8cb87d72f5c53319eff53a017551e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixer" )

CoD.EmblemEditorColorMixerContainer = InheritFrom( LUI.UIElement )
CoD.EmblemEditorColorMixerContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorColorMixerContainer )
	self.id = "EmblemEditorColorMixerContainer"
	self.soundSet = "SelectColor_ColorMixer"
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
	
	local colorMixer = CoD.EmblemEditorColorMixer.new( menu, controller )
	colorMixer:setLeftRight( true, true, 0, 0 )
	colorMixer:setTopBottom( true, true, 0, 0 )
	colorMixer:subscribeToGlobalModel( controller, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorMixer:setModel( model, controller )
	end )
	self:addElement( colorMixer )
	self.colorMixer = colorMixer
	
	colorMixer.id = "colorMixer"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.colorMixer:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.colorMixer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

