-- 55c12e9a98bdb17dcda9a66ece8742cc
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 168 )
	self:setTopBottom( true, false, 0, 192 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0.45, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, false, -2, 170 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, false, -1.45, 192 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local positionText = LUI.UIText.new()
	positionText:setLeftRight( true, false, 10, 162.94 )
	positionText:setTopBottom( true, false, 73.55, 92.55 )
	positionText:setRGB( 0.56, 0.6, 0.61 )
	positionText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PROPERTY_POSITION" ) )
	positionText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	positionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	positionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( positionText )
	self.positionText = positionText
	
	local scaleText = LUI.UIText.new()
	scaleText:setLeftRight( true, false, 10, 162.94 )
	scaleText:setTopBottom( true, false, 97.55, 116.55 )
	scaleText:setRGB( 0.56, 0.6, 0.61 )
	scaleText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PROPERTY_SCALE" ) )
	scaleText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	scaleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	scaleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scaleText )
	self.scaleText = scaleText
	
	local rotationText = LUI.UIText.new()
	rotationText:setLeftRight( true, false, 10, 162.94 )
	rotationText:setTopBottom( true, false, 134, 154 )
	rotationText:setRGB( 0.56, 0.6, 0.61 )
	rotationText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PROPERTY_ROTATION" ) )
	rotationText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotationText )
	self.rotationText = rotationText
	
	local opacityText = LUI.UIText.new()
	opacityText:setLeftRight( true, false, 10, 162.94 )
	opacityText:setTopBottom( true, false, 156, 175 )
	opacityText:setRGB( 0.56, 0.6, 0.61 )
	opacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
	opacityText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( opacityText )
	self.opacityText = opacityText
	
	local xPositionValue = LUI.UIText.new()
	xPositionValue:setLeftRight( false, true, -98, -63.04 )
	xPositionValue:setTopBottom( true, false, 73.55, 92.55 )
	xPositionValue:setTTF( "fonts/escom.ttf" )
	xPositionValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	xPositionValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	xPositionValue:linkToElementModel( self, "xposition", true, function ( model )
		local xposition = Engine.GetModelValue( model )
		if xposition then
			xPositionValue:setText( Engine.Localize( xposition ) )
		end
	end )
	self:addElement( xPositionValue )
	self.xPositionValue = xPositionValue
	
	local yPositionValue = LUI.UIText.new()
	yPositionValue:setLeftRight( false, true, -161, -5.06 )
	yPositionValue:setTopBottom( true, false, 73.55, 92.55 )
	yPositionValue:setTTF( "fonts/escom.ttf" )
	yPositionValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	yPositionValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	yPositionValue:linkToElementModel( self, "yposition", true, function ( model )
		local yposition = Engine.GetModelValue( model )
		if yposition then
			yPositionValue:setText( Engine.Localize( yposition ) )
		end
	end )
	self:addElement( yPositionValue )
	self.yPositionValue = yPositionValue
	
	local xScaleValue = LUI.UIText.new()
	xScaleValue:setLeftRight( false, true, -98, -63.04 )
	xScaleValue:setTopBottom( true, false, 97.55, 116.55 )
	xScaleValue:setTTF( "fonts/escom.ttf" )
	xScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	xScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	xScaleValue:linkToElementModel( self, "xscale", true, function ( model )
		local xscale = Engine.GetModelValue( model )
		if xscale then
			xScaleValue:setText( Engine.Localize( xscale ) )
		end
	end )
	self:addElement( xScaleValue )
	self.xScaleValue = xScaleValue
	
	local yScaleValue = LUI.UIText.new()
	yScaleValue:setLeftRight( false, true, -161, -5.06 )
	yScaleValue:setTopBottom( true, false, 97.55, 116.55 )
	yScaleValue:setTTF( "fonts/escom.ttf" )
	yScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	yScaleValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	yScaleValue:linkToElementModel( self, "yscale", true, function ( model )
		local yscale = Engine.GetModelValue( model )
		if yscale then
			yScaleValue:setText( Engine.Localize( yscale ) )
		end
	end )
	self:addElement( yScaleValue )
	self.yScaleValue = yScaleValue
	
	local rotationValue = LUI.UIText.new()
	rotationValue:setLeftRight( false, true, -161, -5.06 )
	rotationValue:setTopBottom( true, false, 134, 153 )
	rotationValue:setTTF( "fonts/escom.ttf" )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rotationValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rotationValue:linkToElementModel( self, "rotation", true, function ( model )
		local rotation = Engine.GetModelValue( model )
		if rotation then
			rotationValue:setText( Engine.Localize( rotation ) )
		end
	end )
	self:addElement( rotationValue )
	self.rotationValue = rotationValue
	
	local opacityValue = LUI.UIText.new()
	opacityValue:setLeftRight( false, true, -161, -5.06 )
	opacityValue:setTopBottom( true, false, 156, 175 )
	opacityValue:setTTF( "fonts/escom.ttf" )
	opacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	opacityValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	opacityValue:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "max_opacity", function ( model )
		local maxOpacity = Engine.GetModelValue( model )
		if maxOpacity then
			opacityValue:setText( Engine.Localize( AppendString( "%", maxOpacity ) ) )
		end
	end )
	self:addElement( opacityValue )
	self.opacityValue = opacityValue
	
	local layerUsedValue = CoD.GroupFractionLabel.new( menu, controller )
	layerUsedValue:setLeftRight( false, true, -161, -5 )
	layerUsedValue:setTopBottom( true, false, 1, 24.5 )
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
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 67, 104.96 )
	TextBox0:setTopBottom( true, false, 76.55, 91.55 )
	TextBox0:setRGB( 0.56, 0.6, 0.61 )
	TextBox0:setText( Engine.Localize( "MENU_EMBLEM_X_TEXT" ) )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 67, 104.96 )
	TextBox1:setTopBottom( true, false, 97.55, 116.55 )
	TextBox1:setRGB( 0.56, 0.6, 0.61 )
	TextBox1:setText( Engine.Localize( "MENU_EMBLEM_X_TEXT" ) )
	TextBox1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( false, true, -139.08, -38.06 )
	TextBox2:setTopBottom( true, false, 73.55, 92.55 )
	TextBox2:setRGB( 0.56, 0.6, 0.61 )
	TextBox2:setText( Engine.Localize( "MENU_EMBLEM_Y_TEXT" ) )
	TextBox2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( false, true, -139.08, -38.06 )
	TextBox3:setTopBottom( true, false, 97.55, 116.55 )
	TextBox3:setRGB( 0.56, 0.6, 0.61 )
	TextBox3:setText( Engine.Localize( "MENU_EMBLEM_Y_TEXT" ) )
	TextBox3:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 10, 162.94 )
	TextBox4:setTopBottom( true, false, 5, 24 )
	TextBox4:setRGB( 0.56, 0.6, 0.61 )
	TextBox4:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED" ) )
	TextBox4:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, 0, 0 )
	CategoryListLine:setTopBottom( true, false, 60, 68 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.45 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, true, 0, 0 )
	CategoryListLine0:setTopBottom( true, false, 121.5, 129.5 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.45 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local linkedLayerText = LUI.UIText.new()
	linkedLayerText:setLeftRight( true, false, 10, 162.94 )
	linkedLayerText:setTopBottom( true, false, 43, 62 )
	linkedLayerText:setRGB( 0.56, 0.6, 0.61 )
	linkedLayerText:setAlpha( 0 )
	linkedLayerText:setText( Engine.Localize( "MENU_LINKED_LAYERS" ) )
	linkedLayerText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	linkedLayerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	linkedLayerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( linkedLayerText )
	self.linkedLayerText = linkedLayerText
	
	local linkedLayersValue = LUI.UIText.new()
	linkedLayersValue:setLeftRight( false, true, -161, -5 )
	linkedLayersValue:setTopBottom( true, false, 43, 62 )
	linkedLayersValue:setAlpha( 0 )
	linkedLayersValue:setTTF( "fonts/escom.ttf" )
	linkedLayersValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	linkedLayersValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	linkedLayersValue:subscribeToGlobalModel( controller, "EmblemProperties", "linkedLayerCount", function ( model )
		local linkedLayerCount = Engine.GetModelValue( model )
		if linkedLayerCount then
			linkedLayersValue:setText( Engine.Localize( linkedLayerCount ) )
		end
	end )
	self:addElement( linkedLayersValue )
	self.linkedLayersValue = linkedLayersValue
	
	local groupsUsedText = LUI.UIText.new()
	groupsUsedText:setLeftRight( true, false, 10, 162.94 )
	groupsUsedText:setTopBottom( true, false, 24, 43 )
	groupsUsedText:setRGB( 0.56, 0.6, 0.61 )
	groupsUsedText:setAlpha( 0 )
	groupsUsedText:setText( Engine.Localize( "MENU_EMBLEM_GROUPS_USED" ) )
	groupsUsedText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	groupsUsedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	groupsUsedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( groupsUsedText )
	self.groupsUsedText = groupsUsedText
	
	local groupsUsedValue = CoD.GroupFractionLabel.new( menu, controller )
	groupsUsedValue:setLeftRight( false, true, -161, -5 )
	groupsUsedValue:setTopBottom( true, false, 19.5, 43 )
	groupsUsedValue:setAlpha( 0 )
	groupsUsedValue:subscribeToGlobalModel( controller, "EmblemProperties", "groupsUsedFraction", function ( model )
		local groupsUsedFraction = Engine.GetModelValue( model )
		if groupsUsedFraction then
			groupsUsedValue.groupsUsedValue:setText( Engine.Localize( groupsUsedFraction ) )
		end
	end )
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
	self:addElement( groupsUsedValue )
	self.groupsUsedValue = groupsUsedValue
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 23 )

				Image0:completeAnimation()
				self.Image0:setLeftRight( true, true, 0.45, 0 )
				self.Image0:setTopBottom( true, true, 0, -122 )
				self.clipFinished( Image0, {} )

				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setLeftRight( true, false, -2, 170 )
				self.cacButtonBoxLrgInactiveStroke0:setTopBottom( true, false, -1.45, 67 )
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
				self.TextBox4:setLeftRight( true, false, 10, 168 )
				self.TextBox4:setTopBottom( true, false, 5, 24 )
				self.TextBox4:setAlpha( 1 )
				self.clipFinished( TextBox4, {} )

				CategoryListLine:completeAnimation()
				self.CategoryListLine:setAlpha( 0 )
				self.clipFinished( CategoryListLine, {} )

				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 0 )
				self.clipFinished( CategoryListLine0, {} )

				linkedLayerText:completeAnimation()
				self.linkedLayerText:setLeftRight( true, false, 10, 162.94 )
				self.linkedLayerText:setTopBottom( true, false, 43, 62 )
				self.linkedLayerText:setAlpha( 0 )
				self.clipFinished( linkedLayerText, {} )

				linkedLayersValue:completeAnimation()
				self.linkedLayersValue:setAlpha( 0 )
				self.clipFinished( linkedLayersValue, {} )

				groupsUsedText:completeAnimation()
				self.groupsUsedText:setLeftRight( true, false, 10, 162.94 )
				self.groupsUsedText:setTopBottom( true, false, 24, 43 )
				self.groupsUsedText:setAlpha( 0 )
				self.clipFinished( groupsUsedText, {} )

				groupsUsedValue:completeAnimation()
				self.groupsUsedValue:setAlpha( 0 )
				self.clipFinished( groupsUsedValue, {} )
			end
		},
		EditModeLayerProperties = {
			DefaultClip = function ()
				self:setupElementClipCounter( 23 )

				Image0:completeAnimation()
				self.Image0:setLeftRight( true, true, 0.45, 0 )
				self.Image0:setTopBottom( true, true, 0, 0 )
				self.clipFinished( Image0, {} )

				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setLeftRight( true, false, -2, 170 )
				self.cacButtonBoxLrgInactiveStroke0:setTopBottom( true, false, -1.45, 192 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke0, {} )

				positionText:completeAnimation()
				self.positionText:setAlpha( 1 )
				self.clipFinished( positionText, {} )

				scaleText:completeAnimation()
				self.scaleText:setAlpha( 1 )
				self.clipFinished( scaleText, {} )

				rotationText:completeAnimation()
				self.rotationText:setAlpha( 1 )
				self.clipFinished( rotationText, {} )

				opacityText:completeAnimation()
				self.opacityText:setAlpha( 1 )
				self.clipFinished( opacityText, {} )

				xPositionValue:completeAnimation()
				self.xPositionValue:setAlpha( 1 )
				self.clipFinished( xPositionValue, {} )

				yPositionValue:completeAnimation()
				self.yPositionValue:setAlpha( 1 )
				self.clipFinished( yPositionValue, {} )

				xScaleValue:completeAnimation()
				self.xScaleValue:setAlpha( 1 )
				self.clipFinished( xScaleValue, {} )

				yScaleValue:completeAnimation()
				self.yScaleValue:setAlpha( 1 )
				self.clipFinished( yScaleValue, {} )

				rotationValue:completeAnimation()
				self.rotationValue:setAlpha( 1 )
				self.clipFinished( rotationValue, {} )

				opacityValue:completeAnimation()
				self.opacityValue:setAlpha( 1 )
				self.clipFinished( opacityValue, {} )

				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )

				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 1 )
				self.clipFinished( TextBox1, {} )

				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 1 )
				self.clipFinished( TextBox2, {} )

				TextBox3:completeAnimation()
				self.TextBox3:setAlpha( 1 )
				self.clipFinished( TextBox3, {} )

				TextBox4:completeAnimation()
				self.TextBox4:setLeftRight( true, false, 10, 162.94 )
				self.TextBox4:setTopBottom( true, false, 5, 24 )
				self.clipFinished( TextBox4, {} )

				CategoryListLine:completeAnimation()
				self.CategoryListLine:setAlpha( 0.45 )
				self.clipFinished( CategoryListLine, {} )

				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 0.45 )
				self.clipFinished( CategoryListLine0, {} )

				linkedLayerText:completeAnimation()
				self.linkedLayerText:setAlpha( 0 )
				self.clipFinished( linkedLayerText, {} )

				linkedLayersValue:completeAnimation()
				self.linkedLayersValue:setAlpha( 0 )
				self.clipFinished( linkedLayersValue, {} )

				groupsUsedText:completeAnimation()
				self.groupsUsedText:setLeftRight( true, false, 10, 162.94 )
				self.groupsUsedText:setTopBottom( true, false, 24, 43 )
				self.groupsUsedText:setAlpha( 0 )
				self.clipFinished( groupsUsedText, {} )

				groupsUsedValue:completeAnimation()
				self.groupsUsedValue:setAlpha( 0 )
				self.clipFinished( groupsUsedValue, {} )
			end
		},
		ArabicFrontEnd = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )

				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setLeftRight( true, false, -2, 170 )
				self.cacButtonBoxLrgInactiveStroke0:setTopBottom( true, false, -1.45, 68 )
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
				self.TextBox4:setLeftRight( true, false, 10, 162.94 )
				self.TextBox4:setTopBottom( true, false, 5, 24 )
				self.TextBox4:setAlpha( 1 )
				self.TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( TextBox4, {} )

				CategoryListLine:completeAnimation()
				self.CategoryListLine:setAlpha( 0 )
				self.clipFinished( CategoryListLine, {} )

				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 0 )
				self.clipFinished( CategoryListLine0, {} )

				linkedLayerText:completeAnimation()
				self.linkedLayerText:setLeftRight( true, false, 10, 162.94 )
				self.linkedLayerText:setTopBottom( true, false, 43, 62 )
				self.linkedLayerText:setAlpha( 0 )
				self.linkedLayerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( linkedLayerText, {} )

				linkedLayersValue:completeAnimation()
				self.linkedLayersValue:setLeftRight( false, true, -158, -5 )
				self.linkedLayersValue:setTopBottom( true, false, 43, 62 )
				self.linkedLayersValue:setAlpha( 0 )
				self.clipFinished( linkedLayersValue, {} )

				groupsUsedText:completeAnimation()
				self.groupsUsedText:setLeftRight( true, false, 10, 162.94 )
				self.groupsUsedText:setTopBottom( true, false, 24, 43 )
				self.groupsUsedText:setAlpha( 0 )
				self.groupsUsedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( groupsUsedText, {} )

				groupsUsedValue:completeAnimation()
				self.groupsUsedValue:setLeftRight( false, true, -158, -5 )
				self.groupsUsedValue:setTopBottom( true, false, 19.5, 43 )
				self.groupsUsedValue:setAlpha( 0 )
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
				local f19_local0
				if not IsInGame() then
					f19_local0 = IsArabicSku()
				else
					f19_local0 = false
				end
				return f19_local0
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.layerUsedValue:close()
		element.groupsUsedValue:close()
		element.xPositionValue:close()
		element.yPositionValue:close()
		element.xScaleValue:close()
		element.yScaleValue:close()
		element.rotationValue:close()
		element.opacityValue:close()
		element.linkedLayersValue:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

