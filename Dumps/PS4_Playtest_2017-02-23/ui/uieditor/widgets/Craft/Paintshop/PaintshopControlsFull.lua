require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorHeaderRight" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChooseSide" )

CoD.PaintshopControlsFull = InheritFrom( LUI.UIElement )
CoD.PaintshopControlsFull.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopControlsFull )
	self.id = "PaintshopControlsFull"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 375 )
	self:setTopBottom( 0, 0, 0, 517 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 0, 0 )
	Image0:setTopBottom( 0, 1, 46, -24 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 1, -3, 3 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 42, -130 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local ColorPicker = CoD.PaintshopButtonPrompt.new( menu, controller )
	ColorPicker:setLeftRight( 0, 0, 21, 371 )
	ColorPicker:setTopBottom( 0, 0, 335, 387 )
	ColorPicker.label:setText( Engine.Localize( "MENU_EMBLEM_COLOR_PICKER" ) )
	ColorPicker:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ColorPicker.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ColorPicker )
	self.ColorPicker = ColorPicker
	
	local rsOpacity = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rsOpacity:setLeftRight( 0, 0, 40, 76 )
	rsOpacity:setTopBottom( 0, 0, 171, 207 )
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
	lsOpacity:setTopBottom( 0, 0, 171, 207 )
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
	opacityText:setLeftRight( 0, 0, 82, 370 )
	opacityText:setTopBottom( 0, 0, 174, 202 )
	opacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
	opacityText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( opacityText )
	self.opacityText = opacityText
	
	local LayerOrder = CoD.PaintshopButtonPrompt.new( menu, controller )
	LayerOrder:setLeftRight( 0, 0, 21, 371 )
	LayerOrder:setTopBottom( 0, 0, 291, 337 )
	LayerOrder.label:setText( Engine.Localize( "MENU_CHANGE_EMBLEM_LAYER_ORDER" ) )
	LayerOrder:subscribeToGlobalModel( controller, "Controller", "dpad_lr_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LayerOrder.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LayerOrder )
	self.LayerOrder = LayerOrder
	
	local ToggleOutline = CoD.PaintshopButtonPrompt.new( menu, controller )
	ToggleOutline:setLeftRight( 0, 0, 21, 371 )
	ToggleOutline:setTopBottom( 0, 0, 249, 295 )
	ToggleOutline.label:setText( Engine.Localize( "PLATFORM_EMBLEM_TOGGLE_OUTLINE" ) )
	ToggleOutline:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ToggleOutline.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ToggleOutline )
	self.ToggleOutline = ToggleOutline
	
	local Flip = CoD.PaintshopButtonPrompt.new( menu, controller )
	Flip:setLeftRight( 0, 0, 20, 371 )
	Flip:setTopBottom( 0, 0, 210, 256 )
	Flip.label:setText( Engine.Localize( "PLATFORM_EMBLEM_TOGGLE_FLIP" ) )
	Flip:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Flip.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Flip )
	self.Flip = Flip
	
	local rotateText = LUI.UIText.new()
	rotateText:setLeftRight( 0, 0, 82, 370 )
	rotateText:setTopBottom( 0, 0, 137, 165 )
	rotateText:setText( Engine.Localize( "PLATFORM_EMBLEM_ROTATE_LAYER" ) )
	rotateText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotateText )
	self.rotateText = rotateText
	
	local rightTriggerButton = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rightTriggerButton:setLeftRight( 0, 0, 39, 73 )
	rightTriggerButton:setTopBottom( 0, 0, 131, 177 )
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
	leftTriggerButton:setLeftRight( 0, 0, 3, 39 )
	leftTriggerButton:setTopBottom( 0, 0, 131, 177 )
	leftTriggerButton.label:setText( Engine.Localize( "" ) )
	leftTriggerButton:subscribeToGlobalModel( controller, "Controller", "left_trigger_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftTriggerButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( leftTriggerButton )
	self.leftTriggerButton = leftTriggerButton
	
	local FixedScale = CoD.PaintshopButtonPrompt.new( menu, controller )
	FixedScale:setLeftRight( 0, 0, 21, 371 )
	FixedScale:setTopBottom( 0, 0, 93, 139 )
	FixedScale:setAlpha( 0 )
	FixedScale.label:setText( Engine.Localize( "MENU_EMBLEM_FIXED_SCALE" ) )
	FixedScale:subscribeToGlobalModel( controller, "Controller", "move_right_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FixedScale.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( FixedScale )
	self.FixedScale = FixedScale
	
	local FreeScale = CoD.PaintshopButtonPrompt.new( menu, controller )
	FreeScale:setLeftRight( 0, 0, 21, 371 )
	FreeScale:setTopBottom( 0, 0, 93, 139 )
	FreeScale.label:setText( Engine.Localize( "MENU_EMBLEM_FREE_SCALE" ) )
	FreeScale:subscribeToGlobalModel( controller, "Controller", "move_right_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FreeScale.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( FreeScale )
	self.FreeScale = FreeScale
	
	local Move = CoD.PaintshopButtonPrompt.new( menu, controller )
	Move:setLeftRight( 0, 0, 21, 371 )
	Move:setTopBottom( 0, 0, 53, 99 )
	Move.label:setText( Engine.Localize( "MENU_EMBLEM_MOVE_EMBLEM" ) )
	Move:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Move.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Move )
	self.Move = Move
	
	local materialPicker = CoD.PaintshopButtonPrompt.new( menu, controller )
	materialPicker:setLeftRight( 0, 0, 21, 371 )
	materialPicker:setTopBottom( 0, 0, 446, 482 )
	materialPicker.label:setText( Engine.Localize( "MENU_MATERIAL_PICKER" ) )
	materialPicker:subscribeToGlobalModel( controller, "Controller", "dpad_up_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			materialPicker.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( materialPicker )
	self.materialPicker = materialPicker
	
	local overrides = CoD.EmblemEditorHeaderRight.new( menu, controller )
	overrides:setLeftRight( 0, 1, 0, 0 )
	overrides:setTopBottom( 0, 0, 390, 432 )
	overrides.text:setText( Engine.Localize( "MENU_EMBLEM_OVERRIDES_CAPS" ) )
	overrides.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( overrides )
	self.overrides = overrides
	
	local PaintshopChooseSide0 = CoD.PaintshopChooseSide.new( menu, controller )
	PaintshopChooseSide0:setLeftRight( 0, 1, 0, 0 )
	PaintshopChooseSide0:setTopBottom( 0, 0, 1, 33 )
	PaintshopChooseSide0.text:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	PaintshopChooseSide0.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( PaintshopChooseSide0 )
	self.PaintshopChooseSide0 = PaintshopChooseSide0
	
	local cacButtonBoxLrgInactiveStroke00 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke00:setLeftRight( 0, 1, -3, 3 )
	cacButtonBoxLrgInactiveStroke00:setTopBottom( 0, 1, 432, -24 )
	self:addElement( cacButtonBoxLrgInactiveStroke00 )
	self.cacButtonBoxLrgInactiveStroke00 = cacButtonBoxLrgInactiveStroke00
	
	self.resetProperties = function ()
		rotateText:completeAnimation()
		leftTriggerButton:completeAnimation()
		rightTriggerButton:completeAnimation()
		opacityText:completeAnimation()
		lsOpacity:completeAnimation()
		rsOpacity:completeAnimation()
		Move:completeAnimation()
		FreeScale:completeAnimation()
		Flip:completeAnimation()
		ToggleOutline:completeAnimation()
		LayerOrder:completeAnimation()
		ColorPicker:completeAnimation()
		materialPicker:completeAnimation()
		overrides:completeAnimation()
		cacButtonBoxLrgInactiveStroke0:completeAnimation()
		Image0:completeAnimation()
		PaintshopChooseSide0:completeAnimation()
		cacButtonBoxLrgInactiveStroke00:completeAnimation()
		FixedScale:completeAnimation()
		rotateText:setLeftRight( 0, 0, 82, 370 )
		rotateText:setTopBottom( 0, 0, 137, 165 )
		rotateText:setAlpha( 1 )
		leftTriggerButton:setAlpha( 1 )
		rightTriggerButton:setAlpha( 1 )
		opacityText:setAlpha( 1 )
		lsOpacity:setAlpha( 1 )
		rsOpacity:setAlpha( 1 )
		Move:setAlpha( 1 )
		FreeScale:setAlpha( 1 )
		Flip:setAlpha( 1 )
		ToggleOutline:setAlpha( 1 )
		LayerOrder:setAlpha( 1 )
		ColorPicker:setAlpha( 1 )
		materialPicker:setLeftRight( 0, 0, 21, 371 )
		materialPicker:setTopBottom( 0, 0, 446, 482 )
		materialPicker:setAlpha( 1 )
		overrides:setLeftRight( 0, 1, 0, 0 )
		overrides:setTopBottom( 0, 0, 390, 432 )
		overrides:setAlpha( 1 )
		cacButtonBoxLrgInactiveStroke0:setAlpha( 1 )
		Image0:setAlpha( 0.5 )
		PaintshopChooseSide0:setAlpha( 1 )
		cacButtonBoxLrgInactiveStroke00:setLeftRight( 0, 1, -3, 3 )
		cacButtonBoxLrgInactiveStroke00:setTopBottom( 0, 1, 432, -24 )
		cacButtonBoxLrgInactiveStroke00:setAlpha( 1 )
		FixedScale:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				rotateText:completeAnimation()
				self.rotateText:setLeftRight( 0, 0, 93, 371 )
				self.rotateText:setTopBottom( 0, 0, 140, 164 )
				self.clipFinished( rotateText, {} )
			end
		},
		BrowseModeControlsState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 18 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setAlpha( 0 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke0, {} )
				ColorPicker:completeAnimation()
				self.ColorPicker:setAlpha( 0 )
				self.clipFinished( ColorPicker, {} )
				rsOpacity:completeAnimation()
				self.rsOpacity:setAlpha( 0 )
				self.clipFinished( rsOpacity, {} )
				lsOpacity:completeAnimation()
				self.lsOpacity:setAlpha( 0 )
				self.clipFinished( lsOpacity, {} )
				opacityText:completeAnimation()
				self.opacityText:setAlpha( 0 )
				self.clipFinished( opacityText, {} )
				LayerOrder:completeAnimation()
				self.LayerOrder:setAlpha( 0 )
				self.clipFinished( LayerOrder, {} )
				ToggleOutline:completeAnimation()
				self.ToggleOutline:setAlpha( 0 )
				self.clipFinished( ToggleOutline, {} )
				Flip:completeAnimation()
				self.Flip:setAlpha( 0 )
				self.clipFinished( Flip, {} )
				rotateText:completeAnimation()
				self.rotateText:setAlpha( 0 )
				self.clipFinished( rotateText, {} )
				rightTriggerButton:completeAnimation()
				self.rightTriggerButton:setAlpha( 0 )
				self.clipFinished( rightTriggerButton, {} )
				leftTriggerButton:completeAnimation()
				self.leftTriggerButton:setAlpha( 0 )
				self.clipFinished( leftTriggerButton, {} )
				FreeScale:completeAnimation()
				self.FreeScale:setAlpha( 0 )
				self.clipFinished( FreeScale, {} )
				Move:completeAnimation()
				self.Move:setAlpha( 0 )
				self.clipFinished( Move, {} )
				materialPicker:completeAnimation()
				self.materialPicker:setAlpha( 0 )
				self.clipFinished( materialPicker, {} )
				overrides:completeAnimation()
				self.overrides:setAlpha( 0 )
				self.clipFinished( overrides, {} )
				PaintshopChooseSide0:completeAnimation()
				self.PaintshopChooseSide0:setAlpha( 0 )
				self.clipFinished( PaintshopChooseSide0, {} )
				cacButtonBoxLrgInactiveStroke00:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke00:setAlpha( 0 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke00, {} )
			end
		},
		FixedScale = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				FixedScale:completeAnimation()
				self.FixedScale:setAlpha( 1 )
				self.clipFinished( FixedScale, {} )
				FreeScale:completeAnimation()
				self.FreeScale:setAlpha( 0 )
				self.clipFinished( FreeScale, {} )
				materialPicker:completeAnimation()
				self.materialPicker:setLeftRight( 0, 0, 21.5, 342.5 )
				self.materialPicker:setTopBottom( 0, 0, 448, 484 )
				self.clipFinished( materialPicker, {} )
				overrides:completeAnimation()
				self.overrides:setLeftRight( 0, 1, 0, 0 )
				self.overrides:setTopBottom( 0, 0, 391, 433 )
				self.clipFinished( overrides, {} )
				cacButtonBoxLrgInactiveStroke00:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke00:setLeftRight( 0, 1, -3, 3 )
				self.cacButtonBoxLrgInactiveStroke00:setTopBottom( 0, 1, 435, -21 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke00, {} )
			end
		},
		FreeScale = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.ColorPicker:close()
		self.rsOpacity:close()
		self.lsOpacity:close()
		self.LayerOrder:close()
		self.ToggleOutline:close()
		self.Flip:close()
		self.rightTriggerButton:close()
		self.leftTriggerButton:close()
		self.FixedScale:close()
		self.FreeScale:close()
		self.Move:close()
		self.materialPicker:close()
		self.overrides:close()
		self.PaintshopChooseSide0:close()
		self.cacButtonBoxLrgInactiveStroke00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

