require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )

CoD.PaintshopColorLayerInfo = InheritFrom( LUI.UIElement )
CoD.PaintshopColorLayerInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopColorLayerInfo )
	self.id = "PaintshopColorLayerInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 168 )
	self:setTopBottom( true, false, 0, 146 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0.45, 0 )
	Image0:setTopBottom( true, true, 31, 0 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 28, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local color0OpacityText = LUI.UIText.new()
	color0OpacityText:setLeftRight( true, false, 10, 107.46 )
	color0OpacityText:setTopBottom( true, false, 71.5, 87.5 )
	color0OpacityText:setRGB( 0.56, 0.6, 0.61 )
	color0OpacityText:setText( Engine.Localize( "MENU_EMBLEM_COLOR_1_OPACITY" ) )
	color0OpacityText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	color0OpacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	color0OpacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( color0OpacityText )
	self.color0OpacityText = color0OpacityText
	
	local color0OpacityValue = LUI.UIText.new()
	color0OpacityValue:setLeftRight( true, false, 122.98, 152 )
	color0OpacityValue:setTopBottom( true, false, 69.5, 88.5 )
	color0OpacityValue:setTTF( "fonts/escom.ttf" )
	color0OpacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	color0OpacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	color0OpacityValue:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "opacity0", function ( model )
		local opacity0 = Engine.GetModelValue( model )
		if opacity0 then
			color0OpacityValue:setText( Engine.Localize( AppendString( "%", opacity0 ) ) )
		end
	end )
	self:addElement( color0OpacityValue )
	self.color0OpacityValue = color0OpacityValue
	
	local layersUsedValue0 = LUI.UIText.new()
	layersUsedValue0:setLeftRight( true, false, 117, 157 )
	layersUsedValue0:setTopBottom( true, false, 39, 55 )
	layersUsedValue0:setTTF( "fonts/escom.ttf" )
	layersUsedValue0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	layersUsedValue0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	layersUsedValue0:subscribeToGlobalModel( controller, "EmblemProperties", "layersUsedFraction", function ( model )
		local layersUsedFraction = Engine.GetModelValue( model )
		if layersUsedFraction then
			layersUsedValue0:setText( Engine.Localize( layersUsedFraction ) )
		end
	end )
	self:addElement( layersUsedValue0 )
	self.layersUsedValue0 = layersUsedValue0
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 10, 81.46 )
	TextBox4:setTopBottom( true, false, 36, 55 )
	TextBox4:setRGB( 0.56, 0.6, 0.61 )
	TextBox4:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED" ) )
	TextBox4:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( menu, controller )
	choosePaintSide:setLeftRight( true, true, 0, 0 )
	choosePaintSide:setTopBottom( true, false, 0, 27 )
	choosePaintSide:setAlpha( 0 )
	choosePaintSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local viewStringRef = Engine.GetModelValue( model )
		if viewStringRef then
			choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( viewStringRef ) )
		end
	end )
	choosePaintSide:mergeStateConditions( {
		{
			stateName = "BrowseModeControlsState",
			condition = function ( menu, element, event )
				return IsPaintshop( controller ) and not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
			end
		}
	} )
	choosePaintSide:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		menu:updateElementState( choosePaintSide, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	self:addElement( choosePaintSide )
	self.choosePaintSide = choosePaintSide
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, 0, 0 )
	CategoryListLine:setTopBottom( true, false, 57, 65 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.45 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local color1OpacityText = LUI.UIText.new()
	color1OpacityText:setLeftRight( true, false, 10, 113.47 )
	color1OpacityText:setTopBottom( true, false, 94.5, 110.5 )
	color1OpacityText:setRGB( 0.56, 0.6, 0.61 )
	color1OpacityText:setText( Engine.Localize( "MENU_EMBLEM_COLOR_2_OPACITY" ) )
	color1OpacityText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	color1OpacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	color1OpacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( color1OpacityText )
	self.color1OpacityText = color1OpacityText
	
	local color1OpacityValue = LUI.UIText.new()
	color1OpacityValue:setLeftRight( true, false, 122.98, 152 )
	color1OpacityValue:setTopBottom( true, false, 92.5, 111.5 )
	color1OpacityValue:setTTF( "fonts/escom.ttf" )
	color1OpacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	color1OpacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	color1OpacityValue:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "opacity1", function ( model )
		local opacity1 = Engine.GetModelValue( model )
		if opacity1 then
			color1OpacityValue:setText( Engine.Localize( AppendString( "%", opacity1 ) ) )
		end
	end )
	self:addElement( color1OpacityValue )
	self.color1OpacityValue = color1OpacityValue
	
	local rotationText = LUI.UIText.new()
	rotationText:setLeftRight( true, false, 10, 113.47 )
	rotationText:setTopBottom( true, false, 115.5, 134.5 )
	rotationText:setRGB( 0.56, 0.6, 0.61 )
	rotationText:setText( Engine.Localize( "MENU_EMBLEM_GRADIENT_ROTATION" ) )
	rotationText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotationText )
	self.rotationText = rotationText
	
	local rotationValue = LUI.UIText.new()
	rotationValue:setLeftRight( true, false, 122.98, 152 )
	rotationValue:setTopBottom( true, false, 115.5, 131.5 )
	rotationValue:setTTF( "fonts/escom.ttf" )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rotationValue:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "gradient_angle", function ( model )
		local gradientAngle = Engine.GetModelValue( model )
		if gradientAngle then
			rotationValue:setText( Engine.Localize( gradientAngle ) )
		end
	end )
	self:addElement( rotationValue )
	self.rotationValue = rotationValue
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				color0OpacityText:completeAnimation()
				self.color0OpacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
				self.clipFinished( color0OpacityText, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
				color1OpacityText:completeAnimation()
				self.color1OpacityText:setAlpha( 0 )
				self.clipFinished( color1OpacityText, {} )
				color1OpacityValue:completeAnimation()
				self.color1OpacityValue:setAlpha( 0 )
				self.clipFinished( color1OpacityValue, {} )
				rotationText:completeAnimation()
				self.rotationText:setAlpha( 0 )
				self.clipFinished( rotationText, {} )
				rotationValue:completeAnimation()
				self.rotationValue:setAlpha( 0 )
				self.clipFinished( rotationValue, {} )
			end
		},
		GradientColorInfo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				color0OpacityText:completeAnimation()
				self.color0OpacityText:setText( Engine.Localize( "MENU_EMBLEM_COLOR_1_OPACITY" ) )
				self.clipFinished( color0OpacityText, {} )
				color0OpacityValue:completeAnimation()
				self.color0OpacityValue:setAlpha( 1 )
				self.clipFinished( color0OpacityValue, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
				color1OpacityText:completeAnimation()
				self.color1OpacityText:setLeftRight( true, false, 10, 113.47 )
				self.color1OpacityText:setTopBottom( true, false, 93.5, 109.5 )
				self.color1OpacityText:setAlpha( 1 )
				self.color1OpacityText:setText( Engine.Localize( "MENU_EMBLEM_COLOR_2_OPACITY" ) )
				self.clipFinished( color1OpacityText, {} )
				color1OpacityValue:completeAnimation()
				self.color1OpacityValue:setLeftRight( true, false, 127.98, 142.49 )
				self.color1OpacityValue:setTopBottom( true, false, 94.5, 110.5 )
				self.color1OpacityValue:setAlpha( 1 )
				self.clipFinished( color1OpacityValue, {} )
				rotationText:completeAnimation()
				self.rotationText:setAlpha( 1 )
				self.clipFinished( rotationText, {} )
				rotationValue:completeAnimation()
				self.rotationValue:setAlpha( 1 )
				self.clipFinished( rotationValue, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.choosePaintSide:close()
		element.color0OpacityValue:close()
		element.layersUsedValue0:close()
		element.color1OpacityValue:close()
		element.rotationValue:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

