require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.GroupFractionLabel" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )

CoD.EmblemEditorMaterialInfo = InheritFrom( LUI.UIElement )
CoD.EmblemEditorMaterialInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorMaterialInfo )
	self.id = "EmblemEditorMaterialInfo"
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
	layerUsedValue:setLeftRight( 0, 0, 0, 234 )
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
	TextBox4:setTopBottom( 0, 0, 57, 85 )
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
	
	local rotationText = LUI.UIText.new()
	rotationText:setLeftRight( 0, 0, 15, 234 )
	rotationText:setTopBottom( 0, 0, 168, 196 )
	rotationText:setRGB( 0.56, 0.6, 0.61 )
	rotationText:setText( Engine.Localize( "MENU_EMBLEM_MATERIAL_ROTATION" ) )
	rotationText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotationText )
	self.rotationText = rotationText
	
	local rotationValue = LUI.UIText.new()
	rotationValue:setLeftRight( 0, 0, 15, 235 )
	rotationValue:setTopBottom( 0, 0, 168, 196 )
	rotationValue:setTTF( "fonts/escom.ttf" )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rotationValue:linkToElementModel( self, "material_angle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rotationValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rotationValue )
	self.rotationValue = rotationValue
	
	local scaleText = LUI.UIText.new()
	scaleText:setLeftRight( 0, 0, 15, 234 )
	scaleText:setTopBottom( 0, 0, 105, 134 )
	scaleText:setRGB( 0.56, 0.6, 0.61 )
	scaleText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PROPERTY_SCALE" ) )
	scaleText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	scaleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	scaleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scaleText )
	self.scaleText = scaleText
	
	local xScaleValue = LUI.UIText.new()
	xScaleValue:setLeftRight( 0, 0, 117, 157 )
	xScaleValue:setTopBottom( 0, 0, 106, 134 )
	xScaleValue:setTTF( "fonts/escom.ttf" )
	xScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	xScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	xScaleValue:linkToElementModel( self, "material_xscale", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			xScaleValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( xScaleValue )
	self.xScaleValue = xScaleValue
	
	local yScaleValue = LUI.UIText.new()
	yScaleValue:setLeftRight( 0, 0, 15, 234 )
	yScaleValue:setTopBottom( 0, 0, 106, 134 )
	yScaleValue:setTTF( "fonts/escom.ttf" )
	yScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	yScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	yScaleValue:linkToElementModel( self, "material_yscale", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			yScaleValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( yScaleValue )
	self.yScaleValue = yScaleValue
	
	local scaleX = LUI.UIText.new()
	scaleX:setLeftRight( 0, 0, 100, 172 )
	scaleX:setTopBottom( 0, 0, 106, 134 )
	scaleX:setRGB( 0.56, 0.6, 0.61 )
	scaleX:setText( Engine.Localize( "MENU_EMBLEM_X_TEXT" ) )
	scaleX:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	scaleX:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	scaleX:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scaleX )
	self.scaleX = scaleX
	
	local scaleY = LUI.UIText.new()
	scaleY:setLeftRight( 0, 0, 54, 194 )
	scaleY:setTopBottom( 0, 0, 106, 134 )
	scaleY:setRGB( 0.56, 0.6, 0.61 )
	scaleY:setText( Engine.Localize( "MENU_EMBLEM_Y_TEXT" ) )
	scaleY:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	scaleY:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	scaleY:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scaleY )
	self.scaleY = scaleY
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 1, 0, 0 )
	CategoryListLine0:setTopBottom( 0, 0, 142, 154 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.45 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.layerUsedValue:close()
		self.choosePaintSide:close()
		self.rotationValue:close()
		self.xScaleValue:close()
		self.yScaleValue:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

