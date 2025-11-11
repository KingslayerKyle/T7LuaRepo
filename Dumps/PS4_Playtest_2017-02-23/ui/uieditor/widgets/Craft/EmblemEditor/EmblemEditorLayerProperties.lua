require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.GroupFractionLabel" )

CoD.EmblemEditorLayerProperties = InheritFrom( LUI.UIElement )
CoD.EmblemEditorLayerProperties.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorLayerProperties )
	self.id = "EmblemEditorLayerProperties"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 252 )
	self:setTopBottom( 0, 0, 0, 288 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 0, 0 )
	Image0:setTopBottom( 0, 1, 0, 0 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 0, -3, 255 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 0, -2, 288 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local positionText = LUI.UIText.new()
	positionText:setLeftRight( 0, 0, 15, 244 )
	positionText:setTopBottom( 0, 0, 111, 139 )
	positionText:setRGB( 0.56, 0.6, 0.61 )
	positionText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PROPERTY_POSITION" ) )
	positionText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	positionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	positionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( positionText )
	self.positionText = positionText
	
	local scaleText = LUI.UIText.new()
	scaleText:setLeftRight( 0, 0, 15, 244 )
	scaleText:setTopBottom( 0, 0, 147, 175 )
	scaleText:setRGB( 0.56, 0.6, 0.61 )
	scaleText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PROPERTY_SCALE" ) )
	scaleText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	scaleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	scaleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scaleText )
	self.scaleText = scaleText
	
	local rotationText = LUI.UIText.new()
	rotationText:setLeftRight( 0, 0, 15, 244 )
	rotationText:setTopBottom( 0, 0, 201, 231 )
	rotationText:setRGB( 0.56, 0.6, 0.61 )
	rotationText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PROPERTY_ROTATION" ) )
	rotationText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotationText )
	self.rotationText = rotationText
	
	local opacityText = LUI.UIText.new()
	opacityText:setLeftRight( 0, 0, 15, 244 )
	opacityText:setTopBottom( 0, 0, 234, 262 )
	opacityText:setRGB( 0.56, 0.6, 0.61 )
	opacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
	opacityText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( opacityText )
	self.opacityText = opacityText
	
	local xPositionValue = LUI.UIText.new()
	xPositionValue:setLeftRight( 1, 1, -147, -95 )
	xPositionValue:setTopBottom( 0, 0, 111, 139 )
	xPositionValue:setTTF( "fonts/escom.ttf" )
	xPositionValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	xPositionValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	xPositionValue:linkToElementModel( self, "xposition", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			xPositionValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( xPositionValue )
	self.xPositionValue = xPositionValue
	
	local yPositionValue = LUI.UIText.new()
	yPositionValue:setLeftRight( 1, 1, -242, -8 )
	yPositionValue:setTopBottom( 0, 0, 111, 139 )
	yPositionValue:setTTF( "fonts/escom.ttf" )
	yPositionValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	yPositionValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	yPositionValue:linkToElementModel( self, "yposition", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			yPositionValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( yPositionValue )
	self.yPositionValue = yPositionValue
	
	local xScaleValue = LUI.UIText.new()
	xScaleValue:setLeftRight( 1, 1, -147, -95 )
	xScaleValue:setTopBottom( 0, 0, 147, 175 )
	xScaleValue:setTTF( "fonts/escom.ttf" )
	xScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	xScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	xScaleValue:linkToElementModel( self, "xscale", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			xScaleValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( xScaleValue )
	self.xScaleValue = xScaleValue
	
	local yScaleValue = LUI.UIText.new()
	yScaleValue:setLeftRight( 1, 1, -242, -8 )
	yScaleValue:setTopBottom( 0, 0, 147, 175 )
	yScaleValue:setTTF( "fonts/escom.ttf" )
	yScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	yScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	yScaleValue:linkToElementModel( self, "yscale", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			yScaleValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( yScaleValue )
	self.yScaleValue = yScaleValue
	
	local rotationValue = LUI.UIText.new()
	rotationValue:setLeftRight( 1, 1, -242, -8 )
	rotationValue:setTopBottom( 0, 0, 201, 229 )
	rotationValue:setTTF( "fonts/escom.ttf" )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rotationValue:linkToElementModel( self, "rotation", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rotationValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rotationValue )
	self.rotationValue = rotationValue
	
	local opacityValue = LUI.UIText.new()
	opacityValue:setLeftRight( 1, 1, -242, -8 )
	opacityValue:setTopBottom( 0, 0, 234, 262 )
	opacityValue:setTTF( "fonts/escom.ttf" )
	opacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	opacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	opacityValue:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "max_opacity", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			opacityValue:setText( Engine.Localize( AppendString( "%", modelValue ) ) )
		end
	end )
	self:addElement( opacityValue )
	self.opacityValue = opacityValue
	
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
	layerUsedValue:setLeftRight( 1, 1, -241, -7 )
	layerUsedValue:setTopBottom( 0, 0, 2, 37 )
	layerUsedValue:subscribeToGlobalModel( controller, "EmblemProperties", "layersUsedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			layerUsedValue.groupsUsedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( layerUsedValue )
	self.layerUsedValue = layerUsedValue
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 100, 157 )
	TextBox0:setTopBottom( 0, 0, 115, 137 )
	TextBox0:setRGB( 0.56, 0.6, 0.61 )
	TextBox0:setText( Engine.Localize( "MENU_EMBLEM_X_TEXT" ) )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( 0, 0, 100, 157 )
	TextBox1:setTopBottom( 0, 0, 147, 175 )
	TextBox1:setRGB( 0.56, 0.6, 0.61 )
	TextBox1:setText( Engine.Localize( "MENU_EMBLEM_X_TEXT" ) )
	TextBox1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( 1, 1, -209, -57 )
	TextBox2:setTopBottom( 0, 0, 111, 139 )
	TextBox2:setRGB( 0.56, 0.6, 0.61 )
	TextBox2:setText( Engine.Localize( "MENU_EMBLEM_Y_TEXT" ) )
	TextBox2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( 1, 1, -209, -57 )
	TextBox3:setTopBottom( 0, 0, 147, 175 )
	TextBox3:setRGB( 0.56, 0.6, 0.61 )
	TextBox3:setText( Engine.Localize( "MENU_EMBLEM_Y_TEXT" ) )
	TextBox3:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( 0, 0, 15, 244 )
	TextBox4:setTopBottom( 0, 0, 8, 36 )
	TextBox4:setRGB( 0.56, 0.6, 0.61 )
	TextBox4:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED" ) )
	TextBox4:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 1, 0, 0 )
	CategoryListLine:setTopBottom( 0, 0, 90, 102 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.45 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 1, 0, 0 )
	CategoryListLine0:setTopBottom( 0, 0, 182, 194 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.45 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local linkedLayerText = LUI.UIText.new()
	linkedLayerText:setLeftRight( 0, 0, 15, 244 )
	linkedLayerText:setTopBottom( 0, 0, 65, 93 )
	linkedLayerText:setRGB( 0.56, 0.6, 0.61 )
	linkedLayerText:setAlpha( 0 )
	linkedLayerText:setText( Engine.Localize( "MENU_LINKED_LAYERS" ) )
	linkedLayerText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	linkedLayerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	linkedLayerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( linkedLayerText )
	self.linkedLayerText = linkedLayerText
	
	local linkedLayersValue = LUI.UIText.new()
	linkedLayersValue:setLeftRight( 1, 1, -241, -7 )
	linkedLayersValue:setTopBottom( 0, 0, 65, 93 )
	linkedLayersValue:setAlpha( 0 )
	linkedLayersValue:setTTF( "fonts/escom.ttf" )
	linkedLayersValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	linkedLayersValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	linkedLayersValue:subscribeToGlobalModel( controller, "EmblemProperties", "linkedLayerCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			linkedLayersValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( linkedLayersValue )
	self.linkedLayersValue = linkedLayersValue
	
	local groupsUsedText = LUI.UIText.new()
	groupsUsedText:setLeftRight( 0, 0, 15, 244 )
	groupsUsedText:setTopBottom( 0, 0, 36, 64 )
	groupsUsedText:setRGB( 0.56, 0.6, 0.61 )
	groupsUsedText:setAlpha( 0 )
	groupsUsedText:setText( Engine.Localize( "MENU_EMBLEM_GROUPS_USED" ) )
	groupsUsedText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	groupsUsedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	groupsUsedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( groupsUsedText )
	self.groupsUsedText = groupsUsedText
	
	local groupsUsedValue = CoD.GroupFractionLabel.new( menu, controller )
	groupsUsedValue:mergeStateConditions( {
		{
			stateName = "GroupsFull",
			condition = function ( menu, element, event )
				return not IsGroupSlotAvailable( controller )
			end
		}
	} )
	groupsUsedValue:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.groupsUsed" ), function ( model )
		menu:updateElementState( groupsUsedValue, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.groupsUsed"
		} )
	end )
	groupsUsedValue:setLeftRight( 1, 1, -241, -7 )
	groupsUsedValue:setTopBottom( 0, 0, 29, 64 )
	groupsUsedValue:setAlpha( 0 )
	groupsUsedValue:subscribeToGlobalModel( controller, "EmblemProperties", "groupsUsedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			groupsUsedValue.groupsUsedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( groupsUsedValue )
	self.groupsUsedValue = groupsUsedValue
	
	self.resetProperties = function ()
		positionText:completeAnimation()
		xPositionValue:completeAnimation()
		yPositionValue:completeAnimation()
		scaleText:completeAnimation()
		xScaleValue:completeAnimation()
		yScaleValue:completeAnimation()
		rotationText:completeAnimation()
		rotationValue:completeAnimation()
		opacityValue:completeAnimation()
		opacityText:completeAnimation()
		TextBox3:completeAnimation()
		TextBox2:completeAnimation()
		TextBox1:completeAnimation()
		TextBox0:completeAnimation()
		cacButtonBoxLrgInactiveStroke0:completeAnimation()
		CategoryListLine:completeAnimation()
		CategoryListLine0:completeAnimation()
		Image0:completeAnimation()
		TextBox4:completeAnimation()
		groupsUsedValue:completeAnimation()
		linkedLayersValue:completeAnimation()
		positionText:setAlpha( 1 )
		xPositionValue:setAlpha( 1 )
		yPositionValue:setAlpha( 1 )
		scaleText:setAlpha( 1 )
		xScaleValue:setAlpha( 1 )
		yScaleValue:setAlpha( 1 )
		rotationText:setAlpha( 1 )
		rotationValue:setAlpha( 1 )
		opacityValue:setAlpha( 1 )
		opacityText:setAlpha( 1 )
		TextBox3:setAlpha( 1 )
		TextBox2:setAlpha( 1 )
		TextBox1:setAlpha( 1 )
		TextBox0:setAlpha( 1 )
		cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 0, -3, 255 )
		cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 0, -2, 288 )
		CategoryListLine:setAlpha( 0.45 )
		CategoryListLine0:setAlpha( 0.45 )
		Image0:setLeftRight( 0, 1, 0, 0 )
		Image0:setTopBottom( 0, 1, 0, 0 )
		TextBox4:setLeftRight( 0, 0, 15, 244 )
		TextBox4:setTopBottom( 0, 0, 8, 36 )
		groupsUsedValue:setLeftRight( 1, 1, -241, -7 )
		groupsUsedValue:setTopBottom( 0, 0, 29, 64 )
		linkedLayersValue:setLeftRight( 1, 1, -241, -7 )
		linkedLayersValue:setTopBottom( 0, 0, 65, 93 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 19 )
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 1, 0, 0 )
				self.Image0:setTopBottom( 0, 1, 0, -184 )
				self.clipFinished( Image0, {} )
				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 0, -3, 255 )
				self.cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 0, -2.5, 100.5 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke0, {} )
				positionText:completeAnimation()
				self.positionText:setAlpha( 0 )
				self.clipFinished( positionText, {} )
				scaleText:completeAnimation()
				self.scaleText:setAlpha( 0 )
				self.clipFinished( scaleText, {} )
				rotationText:completeAnimation()
				self.rotationText:setAlpha( 0 )
				self.clipFinished( rotationText, {} )
				opacityText:completeAnimation()
				self.opacityText:setAlpha( 0 )
				self.clipFinished( opacityText, {} )
				xPositionValue:completeAnimation()
				self.xPositionValue:setAlpha( 0 )
				self.clipFinished( xPositionValue, {} )
				yPositionValue:completeAnimation()
				self.yPositionValue:setAlpha( 0 )
				self.clipFinished( yPositionValue, {} )
				xScaleValue:completeAnimation()
				self.xScaleValue:setAlpha( 0 )
				self.clipFinished( xScaleValue, {} )
				yScaleValue:completeAnimation()
				self.yScaleValue:setAlpha( 0 )
				self.clipFinished( yScaleValue, {} )
				rotationValue:completeAnimation()
				self.rotationValue:setAlpha( 0 )
				self.clipFinished( rotationValue, {} )
				opacityValue:completeAnimation()
				self.opacityValue:setAlpha( 0 )
				self.clipFinished( opacityValue, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 0 )
				self.clipFinished( TextBox1, {} )
				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 0 )
				self.clipFinished( TextBox2, {} )
				TextBox3:completeAnimation()
				self.TextBox3:setAlpha( 0 )
				self.clipFinished( TextBox3, {} )
				TextBox4:completeAnimation()
				self.TextBox4:setLeftRight( 0, 0, 15, 252 )
				self.TextBox4:setTopBottom( 0, 0, 8, 36 )
				self.clipFinished( TextBox4, {} )
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setAlpha( 0 )
				self.clipFinished( CategoryListLine, {} )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 0 )
				self.clipFinished( CategoryListLine0, {} )
			end
		},
		EditModeLayerProperties = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ArabicFrontEnd = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 19 )
				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 0, -3, 255 )
				self.cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 0, -2, 102 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke0, {} )
				positionText:completeAnimation()
				self.positionText:setAlpha( 0 )
				self.clipFinished( positionText, {} )
				scaleText:completeAnimation()
				self.scaleText:setAlpha( 0 )
				self.clipFinished( scaleText, {} )
				rotationText:completeAnimation()
				self.rotationText:setAlpha( 0 )
				self.clipFinished( rotationText, {} )
				opacityText:completeAnimation()
				self.opacityText:setAlpha( 0 )
				self.clipFinished( opacityText, {} )
				xPositionValue:completeAnimation()
				self.xPositionValue:setAlpha( 0 )
				self.clipFinished( xPositionValue, {} )
				yPositionValue:completeAnimation()
				self.yPositionValue:setAlpha( 0 )
				self.clipFinished( yPositionValue, {} )
				xScaleValue:completeAnimation()
				self.xScaleValue:setAlpha( 0 )
				self.clipFinished( xScaleValue, {} )
				yScaleValue:completeAnimation()
				self.yScaleValue:setAlpha( 0 )
				self.clipFinished( yScaleValue, {} )
				rotationValue:completeAnimation()
				self.rotationValue:setAlpha( 0 )
				self.clipFinished( rotationValue, {} )
				opacityValue:completeAnimation()
				self.opacityValue:setAlpha( 0 )
				self.clipFinished( opacityValue, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 0 )
				self.clipFinished( TextBox1, {} )
				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 0 )
				self.clipFinished( TextBox2, {} )
				TextBox3:completeAnimation()
				self.TextBox3:setAlpha( 0 )
				self.clipFinished( TextBox3, {} )
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setAlpha( 0 )
				self.clipFinished( CategoryListLine, {} )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 0 )
				self.clipFinished( CategoryListLine0, {} )
				linkedLayersValue:completeAnimation()
				self.linkedLayersValue:setLeftRight( 1, 1, -237, -7 )
				self.linkedLayersValue:setTopBottom( 0, 0, 65, 93 )
				self.clipFinished( linkedLayersValue, {} )
				groupsUsedValue:completeAnimation()
				self.groupsUsedValue:setLeftRight( 1, 1, -237, -7 )
				self.groupsUsedValue:setTopBottom( 0, 0, 29, 64 )
				self.clipFinished( groupsUsedValue, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EditModeLayerProperties",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "ArabicFrontEnd",
			condition = function ( menu, element, event )
				local f20_local0
				if not IsInGame() then
					f20_local0 = IsArabicSku()
				else
					f20_local0 = false
				end
				return f20_local0
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.layerUsedValue:close()
		self.groupsUsedValue:close()
		self.xPositionValue:close()
		self.yPositionValue:close()
		self.xScaleValue:close()
		self.yScaleValue:close()
		self.rotationValue:close()
		self.opacityValue:close()
		self.linkedLayersValue:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

