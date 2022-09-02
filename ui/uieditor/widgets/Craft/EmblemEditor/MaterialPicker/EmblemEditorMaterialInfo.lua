-- fa2da75b555424444248a859a2295907
-- This hash is used for caching, delete to decompile the file again

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
	
	local layerUsedValue = CoD.GroupFractionLabel.new( menu, controller )
	layerUsedValue:setLeftRight( true, false, -0.05, 155.95 )
	layerUsedValue:setTopBottom( true, false, 33.5, 57 )
	layerUsedValue:subscribeToGlobalModel( controller, "EmblemProperties", "layersUsedFraction", function ( model )
		local layersUsedFraction = Engine.GetModelValue( model )
		if layersUsedFraction then
			layerUsedValue.groupsUsedValue:setText( Engine.Localize( layersUsedFraction ) )
		end
	end )
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
	self:addElement( layerUsedValue )
	self.layerUsedValue = layerUsedValue
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 10, 157 )
	TextBox4:setTopBottom( true, false, 38, 57 )
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
	
	local rotationText = LUI.UIText.new()
	rotationText:setLeftRight( true, false, 10, 155.94 )
	rotationText:setTopBottom( true, false, 111.5, 130.5 )
	rotationText:setRGB( 0.56, 0.6, 0.61 )
	rotationText:setText( Engine.Localize( "MENU_EMBLEM_MATERIAL_ROTATION" ) )
	rotationText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotationText )
	self.rotationText = rotationText
	
	local rotationValue = LUI.UIText.new()
	rotationValue:setLeftRight( true, false, 10, 157 )
	rotationValue:setTopBottom( true, false, 111.5, 130.5 )
	rotationValue:setTTF( "fonts/escom.ttf" )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rotationValue:linkToElementModel( self, "material_angle", true, function ( model )
		local materialAngle = Engine.GetModelValue( model )
		if materialAngle then
			rotationValue:setText( Engine.Localize( materialAngle ) )
		end
	end )
	self:addElement( rotationValue )
	self.rotationValue = rotationValue
	
	local scaleText = LUI.UIText.new()
	scaleText:setLeftRight( true, false, 10, 155.94 )
	scaleText:setTopBottom( true, false, 70, 89.5 )
	scaleText:setRGB( 0.56, 0.6, 0.61 )
	scaleText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PROPERTY_SCALE" ) )
	scaleText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	scaleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	scaleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scaleText )
	self.scaleText = scaleText
	
	local xScaleValue = LUI.UIText.new()
	xScaleValue:setLeftRight( true, false, 77.95, 104.94 )
	xScaleValue:setTopBottom( true, false, 70.5, 89.5 )
	xScaleValue:setTTF( "fonts/escom.ttf" )
	xScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	xScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	xScaleValue:linkToElementModel( self, "material_xscale", true, function ( model )
		local materialXscale = Engine.GetModelValue( model )
		if materialXscale then
			xScaleValue:setText( Engine.Localize( materialXscale ) )
		end
	end )
	self:addElement( xScaleValue )
	self.xScaleValue = xScaleValue
	
	local yScaleValue = LUI.UIText.new()
	yScaleValue:setLeftRight( true, false, 10, 155.94 )
	yScaleValue:setTopBottom( true, false, 70.5, 89.5 )
	yScaleValue:setTTF( "fonts/escom.ttf" )
	yScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	yScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	yScaleValue:linkToElementModel( self, "material_yscale", true, function ( model )
		local materialYscale = Engine.GetModelValue( model )
		if materialYscale then
			yScaleValue:setText( Engine.Localize( materialYscale ) )
		end
	end )
	self:addElement( yScaleValue )
	self.yScaleValue = yScaleValue
	
	local scaleX = LUI.UIText.new()
	scaleX:setLeftRight( true, false, 66.94, 114.96 )
	scaleX:setTopBottom( true, false, 70.5, 89.5 )
	scaleX:setRGB( 0.56, 0.6, 0.61 )
	scaleX:setText( Engine.Localize( "MENU_EMBLEM_X_TEXT" ) )
	scaleX:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	scaleX:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	scaleX:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scaleX )
	self.scaleX = scaleX
	
	local scaleY = LUI.UIText.new()
	scaleY:setLeftRight( true, false, 35.91, 128.97 )
	scaleY:setTopBottom( true, false, 70.5, 89.5 )
	scaleY:setRGB( 0.56, 0.6, 0.61 )
	scaleY:setText( Engine.Localize( "MENU_EMBLEM_Y_TEXT" ) )
	scaleY:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	scaleY:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	scaleY:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scaleY )
	self.scaleY = scaleY
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, true, 0, 0 )
	CategoryListLine0:setTopBottom( true, false, 95, 103 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.45 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.layerUsedValue:close()
		element.choosePaintSide:close()
		element.rotationValue:close()
		element.xScaleValue:close()
		element.yScaleValue:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

