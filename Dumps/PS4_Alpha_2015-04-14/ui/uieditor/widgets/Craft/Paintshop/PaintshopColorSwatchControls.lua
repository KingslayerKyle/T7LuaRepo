require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )

CoD.PaintshopColorSwatchControls = InheritFrom( LUI.UIElement )
CoD.PaintshopColorSwatchControls.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopColorSwatchControls )
	self.id = "PaintshopColorSwatchControls"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 109 )
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
	
	local toggleColorMixerButton = CoD.PaintshopButtonPrompt.new( menu, controller )
	toggleColorMixerButton:setLeftRight( true, false, 14, 247 )
	toggleColorMixerButton:setTopBottom( true, false, 81, 112 )
	toggleColorMixerButton:setRGB( 1, 1, 1 )
	toggleColorMixerButton.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_COLOR_MIXER" ) )
	toggleColorMixerButton:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			toggleColorMixerButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( toggleColorMixerButton )
	self.toggleColorMixerButton = toggleColorMixerButton
	
	local toggleSolidColorButton = CoD.PaintshopButtonPrompt.new( menu, controller )
	toggleSolidColorButton:setLeftRight( true, false, 14, 247 )
	toggleSolidColorButton:setTopBottom( true, false, 81, 112 )
	toggleSolidColorButton:setRGB( 1, 1, 1 )
	toggleSolidColorButton.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_SOLID_FILL" ) )
	toggleSolidColorButton:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			toggleSolidColorButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( toggleSolidColorButton )
	self.toggleSolidColorButton = toggleSolidColorButton
	
	local rsOpacity = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rsOpacity:setLeftRight( true, false, 27, 51 )
	rsOpacity:setTopBottom( true, false, 56, 80 )
	rsOpacity:setRGB( 1, 1, 1 )
	rsOpacity.label:setText( Engine.Localize( "" ) )
	rsOpacity:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rsOpacity.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rsOpacity )
	self.rsOpacity = rsOpacity
	
	local lsOpacity = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	lsOpacity:setLeftRight( true, false, 2, 26 )
	lsOpacity:setTopBottom( true, false, 56, 80 )
	lsOpacity:setRGB( 1, 1, 1 )
	lsOpacity.label:setText( Engine.Localize( "" ) )
	lsOpacity:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lsOpacity.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( lsOpacity )
	self.lsOpacity = lsOpacity
	
	local opacityText = LUI.UIText.new()
	opacityText:setLeftRight( false, true, -188, -3 )
	opacityText:setTopBottom( true, false, 60, 76 )
	opacityText:setRGB( 1, 1, 1 )
	opacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
	opacityText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( opacityText )
	self.opacityText = opacityText
	
	local ChangeColor = CoD.PaintshopButtonPrompt.new( menu, controller )
	ChangeColor:setLeftRight( true, false, 14, 247 )
	ChangeColor:setTopBottom( true, false, 30, 61 )
	ChangeColor:setRGB( 1, 1, 1 )
	ChangeColor.label:setText( Engine.Localize( "MENU_EMBLEM_CHANGE_COLOR" ) )
	ChangeColor:subscribeToGlobalModel( controller, "Controller", "left_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChangeColor.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ChangeColor )
	self.ChangeColor = ChangeColor
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( menu, controller )
	choosePaintSide:setLeftRight( true, true, 0, 0 )
	choosePaintSide:setTopBottom( true, false, 0, 27 )
	choosePaintSide:setRGB( 1, 1, 1 )
	choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( "MENU_CONTROLS" ) )
	choosePaintSide.leftBumper:setAlpha( 0 )
	choosePaintSide.rightBumper:setAlpha( 0 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				toggleColorMixerButton:completeAnimation()
				toggleColorMixerButton.label:completeAnimation()
				self.toggleColorMixerButton:setAlpha( 1 )
				self.toggleColorMixerButton.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_COLOR_MIXER" ) )
				self.clipFinished( toggleColorMixerButton, {} )
				toggleSolidColorButton:completeAnimation()
				self.toggleSolidColorButton:setAlpha( 0 )
				self.clipFinished( toggleSolidColorButton, {} )
			end
		},
		colorMixerMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				toggleColorMixerButton:completeAnimation()
				self.toggleColorMixerButton:setAlpha( 0 )
				self.clipFinished( toggleColorMixerButton, {} )
				toggleSolidColorButton:completeAnimation()
				self.toggleSolidColorButton:setAlpha( 1 )
				self.clipFinished( toggleSolidColorButton, {} )
			end
		},
		solidColorMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				toggleColorMixerButton:completeAnimation()
				self.toggleColorMixerButton:setAlpha( 1 )
				self.clipFinished( toggleColorMixerButton, {} )
				toggleSolidColorButton:completeAnimation()
				self.toggleSolidColorButton:setAlpha( 0 )
				self.clipFinished( toggleSolidColorButton, {} )
			end
		}
	}
	self.close = function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.toggleColorMixerButton:close()
		self.toggleSolidColorButton:close()
		self.rsOpacity:close()
		self.lsOpacity:close()
		self.ChangeColor:close()
		self.choosePaintSide:close()
		CoD.PaintshopColorSwatchControls.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

