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
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0.45, 0 )
	Image0:setTopBottom( true, true, 31, 0 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 28, 2 )
	cacButtonBoxLrgInactiveStroke0:setRGB( 1, 1, 1 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local opacityText = LUI.UIText.new()
	opacityText:setLeftRight( true, false, 10, 85.46 )
	opacityText:setTopBottom( true, false, 71.5, 87.5 )
	opacityText:setRGB( 0.56, 0.6, 0.61 )
	opacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
	opacityText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( opacityText )
	self.opacityText = opacityText
	
	local opacityValue0 = LUI.UIText.new()
	opacityValue0:setLeftRight( true, false, 127.98, 157 )
	opacityValue0:setTopBottom( true, false, 72.5, 88.5 )
	opacityValue0:setRGB( 1, 1, 1 )
	opacityValue0:setTTF( "fonts/Entovo.ttf" )
	opacityValue0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	opacityValue0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	opacityValue0:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", "opacity", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			opacityValue0:setText( Engine.Localize( AppendString( modelValue, "%" ) ) )
		end
	end )
	self:addElement( opacityValue0 )
	self.opacityValue0 = opacityValue0
	
	local layersUsedValue0 = LUI.UIText.new()
	layersUsedValue0:setLeftRight( true, false, 117, 157 )
	layersUsedValue0:setTopBottom( true, false, 39, 55 )
	layersUsedValue0:setRGB( 1, 1, 1 )
	layersUsedValue0:setTTF( "fonts/Entovo.ttf" )
	layersUsedValue0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	layersUsedValue0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	layersUsedValue0:subscribeToGlobalModel( controller, "EmblemProperties", "layersUsedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			layersUsedValue0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( layersUsedValue0 )
	self.layersUsedValue0 = layersUsedValue0
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 10, 81.46 )
	TextBox4:setTopBottom( true, false, 38, 54 )
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
	choosePaintSide:setRGB( 1, 1, 1 )
	choosePaintSide.leftBumper:setAlpha( 0 )
	choosePaintSide.rightBumper:setAlpha( 0 )
	choosePaintSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( modelValue ) )
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
	
	self.close = function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.choosePaintSide:close()
		self.opacityValue0:close()
		self.layersUsedValue0:close()
		CoD.PaintshopColorLayerInfo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

