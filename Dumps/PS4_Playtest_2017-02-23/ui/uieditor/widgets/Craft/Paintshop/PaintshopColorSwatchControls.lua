require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopBlendButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
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
	self:setLeftRight( 0, 0, 0, 375 )
	self:setTopBottom( 0, 0, 0, 238 )
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
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 41, 3 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local rsOpacity = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rsOpacity:setLeftRight( 0, 0, 40, 76 )
	rsOpacity:setTopBottom( 0, 0, 84, 120 )
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
	lsOpacity:setLeftRight( 0, 0, 3, 39 )
	lsOpacity:setTopBottom( 0, 0, 84, 120 )
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
	opacityText:setLeftRight( 1, 1, -291, -13 )
	opacityText:setTopBottom( 0, 0, 90, 114 )
	opacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
	opacityText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( opacityText )
	self.opacityText = opacityText
	
	local ChangeColor = CoD.PaintshopButtonPrompt.new( menu, controller )
	ChangeColor:setLeftRight( 0, 0, 21, 371 )
	ChangeColor:setTopBottom( 0, 0, 45, 91 )
	ChangeColor.label:setText( Engine.Localize( "MENU_EMBLEM_CHANGE_COLOR" ) )
	ChangeColor:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChangeColor.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ChangeColor )
	self.ChangeColor = ChangeColor
	
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
	choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( "MENU_CONTROLS" ) )
	self:addElement( choosePaintSide )
	self.choosePaintSide = choosePaintSide
	
	local rotateText = LUI.UIText.new()
	rotateText:setLeftRight( 0, 0, 84, 362 )
	rotateText:setTopBottom( 0, 0, 208, 232 )
	rotateText:setText( Engine.Localize( "MENU_EMBLEM_ROTATE_GRADIENT" ) )
	rotateText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotateText )
	self.rotateText = rotateText
	
	local rightTriggerButton = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rightTriggerButton:setLeftRight( 0, 0, 42, 76 )
	rightTriggerButton:setTopBottom( 0, 0, 200, 246 )
	rightTriggerButton.label:setText( Engine.Localize( "" ) )
	rightTriggerButton:subscribeToGlobalModel( controller, "Controller", "right_trigger_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightTriggerButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rightTriggerButton )
	self.rightTriggerButton = rightTriggerButton
	
	local leftTriggerButton = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	leftTriggerButton:setLeftRight( 0, 0, 6, 42 )
	leftTriggerButton:setTopBottom( 0, 0, 200, 246 )
	leftTriggerButton.label:setText( Engine.Localize( "" ) )
	leftTriggerButton:subscribeToGlobalModel( controller, "Controller", "left_trigger_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftTriggerButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( leftTriggerButton )
	self.leftTriggerButton = leftTriggerButton
	
	local ToggleOutline = CoD.PaintshopButtonPrompt.new( menu, controller )
	ToggleOutline:setLeftRight( 0, 0, 22, 372 )
	ToggleOutline:setTopBottom( 0, 0, 123, 169 )
	ToggleOutline.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_GRADIENT" ) )
	ToggleOutline:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ToggleOutline.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ToggleOutline )
	self.ToggleOutline = ToggleOutline
	
	local toggleBlend = CoD.PaintshopBlendButtonPrompt.new( menu, controller )
	toggleBlend:setLeftRight( 0, 0, 22.5, 343.5 )
	toggleBlend:setTopBottom( 0, 0, 162, 198 )
	toggleBlend.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_BLEND" ) )
	toggleBlend:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", nil, function ( model )
		toggleBlend:setModel( model, controller )
	end )
	toggleBlend:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			toggleBlend.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( toggleBlend )
	self.toggleBlend = toggleBlend
	
	self.resetProperties = function ()
		leftTriggerButton:completeAnimation()
		rightTriggerButton:completeAnimation()
		rotateText:completeAnimation()
		ToggleOutline:completeAnimation()
		lsOpacity:completeAnimation()
		rsOpacity:completeAnimation()
		opacityText:completeAnimation()
		leftTriggerButton:setAlpha( 1 )
		rightTriggerButton:setAlpha( 1 )
		rotateText:setAlpha( 1 )
		ToggleOutline.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_GRADIENT" ) )
		lsOpacity:setAlpha( 1 )
		rsOpacity:setAlpha( 1 )
		opacityText:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Gradient = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				rotateText:completeAnimation()
				self.rotateText:setAlpha( 0 )
				self.clipFinished( rotateText, {} )
				rightTriggerButton:completeAnimation()
				self.rightTriggerButton:setAlpha( 0 )
				self.clipFinished( rightTriggerButton, {} )
				leftTriggerButton:completeAnimation()
				self.leftTriggerButton:setAlpha( 0 )
				self.clipFinished( leftTriggerButton, {} )
			end
		},
		Solid = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ToggleOutline:completeAnimation()
				ToggleOutline.label:completeAnimation()
				self.ToggleOutline.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_SOLID" ) )
				self.clipFinished( ToggleOutline, {} )
			end
		},
		NoColor = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				rsOpacity:completeAnimation()
				self.rsOpacity:setAlpha( 0.2 )
				self.clipFinished( rsOpacity, {} )
				lsOpacity:completeAnimation()
				self.lsOpacity:setAlpha( 0.2 )
				self.clipFinished( lsOpacity, {} )
				opacityText:completeAnimation()
				self.opacityText:setAlpha( 0.2 )
				self.clipFinished( opacityText, {} )
				ToggleOutline:completeAnimation()
				ToggleOutline.label:completeAnimation()
				self.ToggleOutline.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_SOLID" ) )
				self.clipFinished( ToggleOutline, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.rsOpacity:close()
		self.lsOpacity:close()
		self.ChangeColor:close()
		self.choosePaintSide:close()
		self.rightTriggerButton:close()
		self.leftTriggerButton:close()
		self.ToggleOutline:close()
		self.toggleBlend:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

