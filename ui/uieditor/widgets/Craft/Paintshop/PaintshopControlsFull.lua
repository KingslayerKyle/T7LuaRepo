-- 09189f707e3e2295e28ed69bfe3ff2f0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorHeaderRight" )
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
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 345 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0.45, 0 )
	Image0:setTopBottom( true, true, 31, -16 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 28, -87 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local ColorPicker = CoD.PaintshopButtonPrompt.new( menu, controller )
	ColorPicker:setLeftRight( true, false, 14, 247 )
	ColorPicker:setTopBottom( true, false, 223, 258 )
	ColorPicker.label:setText( Engine.Localize( "MENU_EMBLEM_COLOR_PICKER" ) )
	ColorPicker:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			ColorPicker.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	self:addElement( ColorPicker )
	self.ColorPicker = ColorPicker
	
	local rsOpacity = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rsOpacity:setLeftRight( true, false, 27, 51 )
	rsOpacity:setTopBottom( true, false, 114, 138 )
	rsOpacity.label:setText( Engine.Localize( "" ) )
	rsOpacity:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			rsOpacity.buttonPromptImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	self:addElement( rsOpacity )
	self.rsOpacity = rsOpacity
	
	local lsOpacity = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	lsOpacity:setLeftRight( true, false, 2, 26 )
	lsOpacity:setTopBottom( true, false, 114, 138 )
	lsOpacity.label:setText( Engine.Localize( "" ) )
	lsOpacity:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			lsOpacity.buttonPromptImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	self:addElement( lsOpacity )
	self.lsOpacity = lsOpacity
	
	local opacityText = LUI.UIText.new()
	opacityText:setLeftRight( true, false, 55, 247 )
	opacityText:setTopBottom( true, false, 116, 135 )
	opacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
	opacityText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( opacityText )
	self.opacityText = opacityText
	
	local LayerOrder = CoD.PaintshopButtonPrompt.new( menu, controller )
	LayerOrder:setLeftRight( true, false, 14, 247 )
	LayerOrder:setTopBottom( true, false, 194, 225 )
	LayerOrder.label:setText( Engine.Localize( "MENU_CHANGE_EMBLEM_LAYER_ORDER" ) )
	LayerOrder:subscribeToGlobalModel( controller, "Controller", "dpad_lr_button_image", function ( model )
		local dpadLrButtonImage = Engine.GetModelValue( model )
		if dpadLrButtonImage then
			LayerOrder.buttonPromptImage:setImage( RegisterImage( dpadLrButtonImage ) )
		end
	end )
	self:addElement( LayerOrder )
	self.LayerOrder = LayerOrder
	
	local ToggleOutline = CoD.PaintshopButtonPrompt.new( menu, controller )
	ToggleOutline:setLeftRight( true, false, 14, 247 )
	ToggleOutline:setTopBottom( true, false, 166, 197 )
	ToggleOutline.label:setText( Engine.Localize( "PLATFORM_EMBLEM_TOGGLE_OUTLINE" ) )
	ToggleOutline:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ToggleOutline.buttonPromptImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( ToggleOutline )
	self.ToggleOutline = ToggleOutline
	
	local Flip = CoD.PaintshopButtonPrompt.new( menu, controller )
	Flip:setLeftRight( true, false, 13, 247 )
	Flip:setTopBottom( true, false, 140, 171 )
	Flip.label:setText( Engine.Localize( "PLATFORM_EMBLEM_TOGGLE_FLIP" ) )
	Flip:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local backButtonImage = Engine.GetModelValue( model )
		if backButtonImage then
			Flip.buttonPromptImage:setImage( RegisterImage( backButtonImage ) )
		end
	end )
	self:addElement( Flip )
	self.Flip = Flip
	
	local rotateText = LUI.UIText.new()
	rotateText:setLeftRight( true, false, 55, 247 )
	rotateText:setTopBottom( true, false, 91, 110 )
	rotateText:setText( Engine.Localize( "PLATFORM_EMBLEM_ROTATE_LAYER" ) )
	rotateText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotateText )
	self.rotateText = rotateText
	
	local rightTriggerButton = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rightTriggerButton:setLeftRight( true, false, 26, 49 )
	rightTriggerButton:setTopBottom( true, false, 87, 118 )
	rightTriggerButton.label:setText( Engine.Localize( "" ) )
	rightTriggerButton:subscribeToGlobalModel( controller, "Controller", "right_trigger_button_image", function ( model )
		local rightTriggerButtonImage = Engine.GetModelValue( model )
		if rightTriggerButtonImage then
			rightTriggerButton.buttonPromptImage:setImage( RegisterImage( rightTriggerButtonImage ) )
		end
	end )
	self:addElement( rightTriggerButton )
	self.rightTriggerButton = rightTriggerButton
	
	local leftTriggerButton = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	leftTriggerButton:setLeftRight( true, false, 2, 26 )
	leftTriggerButton:setTopBottom( true, false, 87, 118 )
	leftTriggerButton.label:setText( Engine.Localize( "" ) )
	leftTriggerButton:subscribeToGlobalModel( controller, "Controller", "left_trigger_button_image", function ( model )
		local leftTriggerButtonImage = Engine.GetModelValue( model )
		if leftTriggerButtonImage then
			leftTriggerButton.buttonPromptImage:setImage( RegisterImage( leftTriggerButtonImage ) )
		end
	end )
	self:addElement( leftTriggerButton )
	self.leftTriggerButton = leftTriggerButton
	
	local FixedScale = CoD.PaintshopButtonPrompt.new( menu, controller )
	FixedScale:setLeftRight( true, false, 14, 247 )
	FixedScale:setTopBottom( true, false, 62, 93 )
	FixedScale:setAlpha( 0 )
	FixedScale.label:setText( Engine.Localize( "MENU_EMBLEM_FIXED_SCALE" ) )
	FixedScale:subscribeToGlobalModel( controller, "Controller", "move_right_stick_button_image", function ( model )
		local moveRightStickButtonImage = Engine.GetModelValue( model )
		if moveRightStickButtonImage then
			FixedScale.buttonPromptImage:setImage( RegisterImage( moveRightStickButtonImage ) )
		end
	end )
	self:addElement( FixedScale )
	self.FixedScale = FixedScale
	
	local FreeScale = CoD.PaintshopButtonPrompt.new( menu, controller )
	FreeScale:setLeftRight( true, false, 14, 247 )
	FreeScale:setTopBottom( true, false, 62, 93 )
	FreeScale.label:setText( Engine.Localize( "MENU_EMBLEM_FREE_SCALE" ) )
	FreeScale:subscribeToGlobalModel( controller, "Controller", "move_right_stick_button_image", function ( model )
		local moveRightStickButtonImage = Engine.GetModelValue( model )
		if moveRightStickButtonImage then
			FreeScale.buttonPromptImage:setImage( RegisterImage( moveRightStickButtonImage ) )
		end
	end )
	self:addElement( FreeScale )
	self.FreeScale = FreeScale
	
	local Move = CoD.PaintshopButtonPrompt.new( menu, controller )
	Move:setLeftRight( true, false, 14, 247 )
	Move:setTopBottom( true, false, 35, 66 )
	Move.label:setText( Engine.Localize( "MENU_EMBLEM_MOVE_EMBLEM" ) )
	Move:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local moveLeftStickButtonImage = Engine.GetModelValue( model )
		if moveLeftStickButtonImage then
			Move.buttonPromptImage:setImage( RegisterImage( moveLeftStickButtonImage ) )
		end
	end )
	self:addElement( Move )
	self.Move = Move
	
	local materialPicker = CoD.PaintshopButtonPrompt.new( menu, controller )
	materialPicker:setLeftRight( true, false, 14, 247 )
	materialPicker:setTopBottom( true, false, 297, 321 )
	materialPicker.label:setText( Engine.Localize( "MENU_MATERIAL_PICKER" ) )
	materialPicker:subscribeToGlobalModel( controller, "Controller", "dpad_up_button_image", function ( model )
		local dpadUpButtonImage = Engine.GetModelValue( model )
		if dpadUpButtonImage then
			materialPicker.buttonPromptImage:setImage( RegisterImage( dpadUpButtonImage ) )
		end
	end )
	self:addElement( materialPicker )
	self.materialPicker = materialPicker
	
	local overrides = CoD.EmblemEditorHeaderRight.new( menu, controller )
	overrides:setLeftRight( true, true, 0, -0.45 )
	overrides:setTopBottom( true, false, 260, 288 )
	overrides.text:setText( Engine.Localize( "MENU_EMBLEM_OVERRIDES_CAPS" ) )
	overrides.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( overrides )
	self.overrides = overrides
	
	local PaintshopChooseSide0 = CoD.PaintshopChooseSide.new( menu, controller )
	PaintshopChooseSide0:setLeftRight( true, true, 0.45, 0 )
	PaintshopChooseSide0:setTopBottom( true, false, 1, 22 )
	PaintshopChooseSide0.text:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	PaintshopChooseSide0.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( PaintshopChooseSide0 )
	self.PaintshopChooseSide0 = PaintshopChooseSide0
	
	local cacButtonBoxLrgInactiveStroke00 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke00:setLeftRight( true, true, -2.22, 1.78 )
	cacButtonBoxLrgInactiveStroke00:setTopBottom( true, true, 288, -16 )
	self:addElement( cacButtonBoxLrgInactiveStroke00 )
	self.cacButtonBoxLrgInactiveStroke00 = cacButtonBoxLrgInactiveStroke00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0.5 )
				self.clipFinished( Image0, {} )

				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setAlpha( 1 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke0, {} )

				ColorPicker:completeAnimation()
				self.ColorPicker:setAlpha( 1 )
				self.clipFinished( ColorPicker, {} )

				rsOpacity:completeAnimation()
				self.rsOpacity:setAlpha( 1 )
				self.clipFinished( rsOpacity, {} )

				lsOpacity:completeAnimation()
				self.lsOpacity:setAlpha( 1 )
				self.clipFinished( lsOpacity, {} )

				opacityText:completeAnimation()
				self.opacityText:setAlpha( 1 )
				self.clipFinished( opacityText, {} )

				LayerOrder:completeAnimation()
				self.LayerOrder:setAlpha( 1 )
				self.clipFinished( LayerOrder, {} )

				ToggleOutline:completeAnimation()
				self.ToggleOutline:setAlpha( 1 )
				self.clipFinished( ToggleOutline, {} )

				Flip:completeAnimation()
				self.Flip:setAlpha( 1 )
				self.clipFinished( Flip, {} )

				rotateText:completeAnimation()
				self.rotateText:setLeftRight( true, false, 62, 247 )
				self.rotateText:setTopBottom( true, false, 93, 109 )
				self.rotateText:setAlpha( 1 )
				self.clipFinished( rotateText, {} )

				rightTriggerButton:completeAnimation()
				self.rightTriggerButton:setAlpha( 1 )
				self.clipFinished( rightTriggerButton, {} )

				leftTriggerButton:completeAnimation()
				self.leftTriggerButton:setAlpha( 1 )
				self.clipFinished( leftTriggerButton, {} )

				FreeScale:completeAnimation()
				self.FreeScale:setAlpha( 1 )
				self.clipFinished( FreeScale, {} )

				Move:completeAnimation()
				self.Move:setAlpha( 1 )
				self.clipFinished( Move, {} )

				PaintshopChooseSide0:completeAnimation()
				self.PaintshopChooseSide0:setAlpha( 1 )
				self.clipFinished( PaintshopChooseSide0, {} )

				cacButtonBoxLrgInactiveStroke00:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke00:setAlpha( 1 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke00, {} )
			end
		},
		BrowseModeControlsState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

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
				self.leftTriggerButton:setXRot( 0 )
				self.clipFinished( leftTriggerButton, {} )

				FixedScale:completeAnimation()
				self.FixedScale:setAlpha( 0 )
				self.clipFinished( FixedScale, {} )

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
				self:setupElementClipCounter( 19 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0.5 )
				self.clipFinished( Image0, {} )

				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setAlpha( 1 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke0, {} )

				ColorPicker:completeAnimation()
				self.ColorPicker:setAlpha( 1 )
				self.clipFinished( ColorPicker, {} )

				rsOpacity:completeAnimation()
				self.rsOpacity:setAlpha( 1 )
				self.clipFinished( rsOpacity, {} )

				lsOpacity:completeAnimation()
				self.lsOpacity:setAlpha( 1 )
				self.clipFinished( lsOpacity, {} )

				opacityText:completeAnimation()
				self.opacityText:setAlpha( 1 )
				self.clipFinished( opacityText, {} )

				LayerOrder:completeAnimation()
				self.LayerOrder:setAlpha( 1 )
				self.clipFinished( LayerOrder, {} )

				ToggleOutline:completeAnimation()
				self.ToggleOutline:setAlpha( 1 )
				self.clipFinished( ToggleOutline, {} )

				Flip:completeAnimation()
				self.Flip:setAlpha( 1 )
				self.clipFinished( Flip, {} )

				rotateText:completeAnimation()
				self.rotateText:setAlpha( 1 )
				self.clipFinished( rotateText, {} )

				rightTriggerButton:completeAnimation()
				self.rightTriggerButton:setAlpha( 1 )
				self.clipFinished( rightTriggerButton, {} )

				leftTriggerButton:completeAnimation()
				self.leftTriggerButton:setAlpha( 1 )
				self.clipFinished( leftTriggerButton, {} )

				FixedScale:completeAnimation()
				self.FixedScale:setAlpha( 1 )
				self.clipFinished( FixedScale, {} )

				FreeScale:completeAnimation()
				self.FreeScale:setAlpha( 0 )
				self.clipFinished( FreeScale, {} )

				Move:completeAnimation()
				self.Move:setAlpha( 1 )
				self.clipFinished( Move, {} )

				materialPicker:completeAnimation()
				self.materialPicker:setLeftRight( true, false, 14, 228 )
				self.materialPicker:setTopBottom( true, false, 299, 323 )
				self.materialPicker:setAlpha( 1 )
				self.clipFinished( materialPicker, {} )

				overrides:completeAnimation()
				self.overrides:setLeftRight( true, true, 0, -0.45 )
				self.overrides:setTopBottom( true, false, 261, 289 )
				self.overrides:setAlpha( 1 )
				self.clipFinished( overrides, {} )

				PaintshopChooseSide0:completeAnimation()
				self.PaintshopChooseSide0:setAlpha( 1 )
				self.clipFinished( PaintshopChooseSide0, {} )

				cacButtonBoxLrgInactiveStroke00:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke00:setLeftRight( true, true, -2.22, 1.78 )
				self.cacButtonBoxLrgInactiveStroke00:setTopBottom( true, true, 290, -14 )
				self.cacButtonBoxLrgInactiveStroke00:setAlpha( 1 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke00, {} )
			end
		},
		FreeScale = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0.5 )
				self.clipFinished( Image0, {} )

				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setAlpha( 1 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke0, {} )

				ColorPicker:completeAnimation()
				self.ColorPicker:setAlpha( 1 )
				self.clipFinished( ColorPicker, {} )

				rsOpacity:completeAnimation()
				self.rsOpacity:setAlpha( 1 )
				self.clipFinished( rsOpacity, {} )

				lsOpacity:completeAnimation()
				self.lsOpacity:setAlpha( 1 )
				self.clipFinished( lsOpacity, {} )

				opacityText:completeAnimation()
				self.opacityText:setAlpha( 1 )
				self.clipFinished( opacityText, {} )

				LayerOrder:completeAnimation()
				self.LayerOrder:setAlpha( 1 )
				self.clipFinished( LayerOrder, {} )

				ToggleOutline:completeAnimation()
				self.ToggleOutline:setAlpha( 1 )
				self.clipFinished( ToggleOutline, {} )

				Flip:completeAnimation()
				self.Flip:setAlpha( 1 )
				self.clipFinished( Flip, {} )

				rotateText:completeAnimation()
				self.rotateText:setAlpha( 1 )
				self.clipFinished( rotateText, {} )

				rightTriggerButton:completeAnimation()
				self.rightTriggerButton:setLeftRight( true, false, 26, 49 )
				self.rightTriggerButton:setTopBottom( true, false, 87, 118 )
				self.rightTriggerButton:setAlpha( 1 )
				self.clipFinished( rightTriggerButton, {} )

				leftTriggerButton:completeAnimation()
				self.leftTriggerButton:setLeftRight( true, false, 2, 26 )
				self.leftTriggerButton:setTopBottom( true, false, 87, 118 )
				self.leftTriggerButton:setAlpha( 1 )
				self.clipFinished( leftTriggerButton, {} )

				FixedScale:completeAnimation()
				self.FixedScale:setAlpha( 0 )
				self.clipFinished( FixedScale, {} )

				FreeScale:completeAnimation()
				self.FreeScale:setAlpha( 1 )
				self.clipFinished( FreeScale, {} )

				Move:completeAnimation()
				self.Move:setAlpha( 1 )
				self.clipFinished( Move, {} )

				materialPicker:completeAnimation()
				self.materialPicker:setAlpha( 1 )
				self.clipFinished( materialPicker, {} )

				overrides:completeAnimation()
				self.overrides:setAlpha( 1 )
				self.clipFinished( overrides, {} )

				PaintshopChooseSide0:completeAnimation()
				self.PaintshopChooseSide0:setAlpha( 1 )
				self.clipFinished( PaintshopChooseSide0, {} )

				cacButtonBoxLrgInactiveStroke00:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke00:setAlpha( 1 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke00, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.ColorPicker:close()
		element.rsOpacity:close()
		element.lsOpacity:close()
		element.LayerOrder:close()
		element.ToggleOutline:close()
		element.Flip:close()
		element.rightTriggerButton:close()
		element.leftTriggerButton:close()
		element.FixedScale:close()
		element.FreeScale:close()
		element.Move:close()
		element.materialPicker:close()
		element.overrides:close()
		element.PaintshopChooseSide0:close()
		element.cacButtonBoxLrgInactiveStroke00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

