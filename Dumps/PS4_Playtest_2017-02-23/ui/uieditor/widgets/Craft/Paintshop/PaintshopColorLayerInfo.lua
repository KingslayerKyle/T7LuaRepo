require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.GroupFractionLabel" )
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
	self:setLeftRight( 0, 0, 0, 252 )
	self:setTopBottom( 0, 0, 0, 219 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 0, 0 )
	Image0:setTopBottom( 0, 1, 46, 0 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 1, -3, 3 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 42, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local color0OpacityText = LUI.UIText.new()
	color0OpacityText:setLeftRight( 0, 0, 15, 221 )
	color0OpacityText:setTopBottom( 0, 0, 108, 136 )
	color0OpacityText:setRGB( 0.56, 0.6, 0.61 )
	color0OpacityText:setText( Engine.Localize( "MENU_EMBLEM_COLOR_1_OPACITY" ) )
	color0OpacityText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	color0OpacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	color0OpacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( color0OpacityText )
	self.color0OpacityText = color0OpacityText
	
	local color0OpacityValue = LUI.UIText.new()
	color0OpacityValue:setLeftRight( 0, 0, 33, 242 )
	color0OpacityValue:setTopBottom( 0, 0, 104, 132 )
	color0OpacityValue:setTTF( "fonts/escom.ttf" )
	color0OpacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	color0OpacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	color0OpacityValue:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "opacity0", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			color0OpacityValue:setText( Engine.Localize( AppendString( "%", modelValue ) ) )
		end
	end )
	self:addElement( color0OpacityValue )
	self.color0OpacityValue = color0OpacityValue
	
	local layerUsedValue = CoD.GroupFractionLabel.new( menu, controller )
	layerUsedValue:mergeStateConditions( {
		{
			stateName = "GroupsFull",
			condition = function ( menu, element, event )
				return not IsEmptyLayerAvailable( controller )
			end
		}
	} )
	layerUsedValue:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.layersUsed" ), function ( model )
		menu:updateElementState( layerUsedValue, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.layersUsed"
		} )
	end )
	layerUsedValue:setLeftRight( 0, 0, 8, 242 )
	layerUsedValue:setTopBottom( 0, 0, 50, 85 )
	layerUsedValue:subscribeToGlobalModel( controller, "EmblemProperties", "layersUsedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			layerUsedValue.groupsUsedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( layerUsedValue )
	self.layerUsedValue = layerUsedValue
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( 0, 0, 15, 235 )
	TextBox4:setTopBottom( 0, 0, 54, 82 )
	TextBox4:setRGB( 0.56, 0.6, 0.61 )
	TextBox4:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED" ) )
	TextBox4:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( menu, controller )
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
	choosePaintSide:setLeftRight( 0, 1, 0, 0 )
	choosePaintSide:setTopBottom( 0, 0, 0, 40 )
	choosePaintSide:setAlpha( 0 )
	choosePaintSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( choosePaintSide )
	self.choosePaintSide = choosePaintSide
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 1, 0, 0 )
	CategoryListLine:setTopBottom( 0, 0, 86, 98 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.45 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local color1OpacityText = LUI.UIText.new()
	color1OpacityText:setLeftRight( 0, 0, 15, 221 )
	color1OpacityText:setTopBottom( 0, 0, 142, 170 )
	color1OpacityText:setRGB( 0.56, 0.6, 0.61 )
	color1OpacityText:setText( Engine.Localize( "MENU_EMBLEM_COLOR_2_OPACITY" ) )
	color1OpacityText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	color1OpacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	color1OpacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( color1OpacityText )
	self.color1OpacityText = color1OpacityText
	
	local color1OpacityValue = LUI.UIText.new()
	color1OpacityValue:setLeftRight( 0, 0, 33, 242 )
	color1OpacityValue:setTopBottom( 0, 0, 139, 167 )
	color1OpacityValue:setTTF( "fonts/escom.ttf" )
	color1OpacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	color1OpacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	color1OpacityValue:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "opacity1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			color1OpacityValue:setText( Engine.Localize( AppendString( "%", modelValue ) ) )
		end
	end )
	self:addElement( color1OpacityValue )
	self.color1OpacityValue = color1OpacityValue
	
	local rotationText = LUI.UIText.new()
	rotationText:setLeftRight( 0, 0, 15, 221 )
	rotationText:setTopBottom( 0, 0, 176, 204 )
	rotationText:setRGB( 0.56, 0.6, 0.61 )
	rotationText:setText( Engine.Localize( "MENU_EMBLEM_GRADIENT_ROTATION" ) )
	rotationText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotationText )
	self.rotationText = rotationText
	
	local rotationValue = LUI.UIText.new()
	rotationValue:setLeftRight( 0, 0, 33, 242 )
	rotationValue:setTopBottom( 0, 0, 176, 204 )
	rotationValue:setTTF( "fonts/escom.ttf" )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rotationValue:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "gradient_angle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rotationValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rotationValue )
	self.rotationValue = rotationValue
	
	self.resetProperties = function ()
		color1OpacityText:completeAnimation()
		color1OpacityValue:completeAnimation()
		color0OpacityText:completeAnimation()
		rotationText:completeAnimation()
		rotationValue:completeAnimation()
		color1OpacityText:setAlpha( 1 )
		color1OpacityValue:setAlpha( 1 )
		color0OpacityText:setText( Engine.Localize( "MENU_EMBLEM_COLOR_1_OPACITY" ) )
		rotationText:setAlpha( 1 )
		rotationValue:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				color0OpacityText:completeAnimation()
				self.color0OpacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
				self.clipFinished( color0OpacityText, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.layerUsedValue:close()
		self.choosePaintSide:close()
		self.color0OpacityValue:close()
		self.color1OpacityValue:close()
		self.rotationValue:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

