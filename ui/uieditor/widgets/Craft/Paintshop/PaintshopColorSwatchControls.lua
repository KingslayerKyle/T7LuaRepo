-- 3e7cb456be0df59e5ca194e542dfe436
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopBlendButtonPrompt" )

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
	self:setTopBottom( true, false, 0, 159 )
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
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 27, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local rsOpacity = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rsOpacity:setLeftRight( true, false, 27, 51 )
	rsOpacity:setTopBottom( true, false, 56, 80 )
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
	lsOpacity:setTopBottom( true, false, 56, 80 )
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
	opacityText:setLeftRight( false, true, -194, -9 )
	opacityText:setTopBottom( true, false, 60, 76 )
	opacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
	opacityText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( opacityText )
	self.opacityText = opacityText
	
	local ChangeColor = CoD.PaintshopButtonPrompt.new( menu, controller )
	ChangeColor:setLeftRight( true, false, 14, 247 )
	ChangeColor:setTopBottom( true, false, 30, 61 )
	ChangeColor.label:setText( Engine.Localize( "MENU_EMBLEM_CHANGE_COLOR" ) )
	ChangeColor:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local moveLeftStickButtonImage = Engine.GetModelValue( model )
		if moveLeftStickButtonImage then
			ChangeColor.buttonPromptImage:setImage( RegisterImage( moveLeftStickButtonImage ) )
		end
	end )
	self:addElement( ChangeColor )
	self.ChangeColor = ChangeColor
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( menu, controller )
	choosePaintSide:setLeftRight( true, true, 0, 0 )
	choosePaintSide:setTopBottom( true, false, 0, 27 )
	choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( "MENU_CONTROLS" ) )
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
	
	local rotateText = LUI.UIText.new()
	rotateText:setLeftRight( true, false, 56, 241 )
	rotateText:setTopBottom( true, false, 139, 155 )
	rotateText:setText( Engine.Localize( "MENU_EMBLEM_ROTATE_GRADIENT" ) )
	rotateText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotateText )
	self.rotateText = rotateText
	
	local rightTriggerButton = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rightTriggerButton:setLeftRight( true, false, 28, 51 )
	rightTriggerButton:setTopBottom( true, false, 133, 164 )
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
	leftTriggerButton:setLeftRight( true, false, 4, 28 )
	leftTriggerButton:setTopBottom( true, false, 133, 164 )
	leftTriggerButton.label:setText( Engine.Localize( "" ) )
	leftTriggerButton:subscribeToGlobalModel( controller, "Controller", "left_trigger_button_image", function ( model )
		local leftTriggerButtonImage = Engine.GetModelValue( model )
		if leftTriggerButtonImage then
			leftTriggerButton.buttonPromptImage:setImage( RegisterImage( leftTriggerButtonImage ) )
		end
	end )
	self:addElement( leftTriggerButton )
	self.leftTriggerButton = leftTriggerButton
	
	local ToggleOutline = CoD.PaintshopButtonPrompt.new( menu, controller )
	ToggleOutline:setLeftRight( true, false, 15, 248 )
	ToggleOutline:setTopBottom( true, false, 82, 113 )
	ToggleOutline.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_GRADIENT" ) )
	ToggleOutline:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ToggleOutline.buttonPromptImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( ToggleOutline )
	self.ToggleOutline = ToggleOutline
	
	local toggleBlend = CoD.PaintshopBlendButtonPrompt.new( menu, controller )
	toggleBlend:setLeftRight( true, false, 15, 229 )
	toggleBlend:setTopBottom( true, false, 108, 132 )
	toggleBlend.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_BLEND" ) )
	toggleBlend:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", nil, function ( model )
		toggleBlend:setModel( model, controller )
	end )
	toggleBlend:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			toggleBlend.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	self:addElement( toggleBlend )
	self.toggleBlend = toggleBlend
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				rsOpacity:completeAnimation()
				self.rsOpacity:setAlpha( 1 )
				self.clipFinished( rsOpacity, {} )
				lsOpacity:completeAnimation()
				self.lsOpacity:setAlpha( 1 )
				self.clipFinished( lsOpacity, {} )
				opacityText:completeAnimation()
				self.opacityText:setAlpha( 1 )
				self.clipFinished( opacityText, {} )
			end
		},
		Gradient = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				rsOpacity:completeAnimation()
				self.rsOpacity:setAlpha( 1 )
				self.clipFinished( rsOpacity, {} )
				lsOpacity:completeAnimation()
				self.lsOpacity:setAlpha( 1 )
				self.clipFinished( lsOpacity, {} )
				opacityText:completeAnimation()
				self.opacityText:setAlpha( 1 )
				self.clipFinished( opacityText, {} )
				rotateText:completeAnimation()
				self.rotateText:setAlpha( 0 )
				self.clipFinished( rotateText, {} )
				rightTriggerButton:completeAnimation()
				self.rightTriggerButton:setAlpha( 0 )
				self.clipFinished( rightTriggerButton, {} )
				leftTriggerButton:completeAnimation()
				self.leftTriggerButton:setAlpha( 0 )
				self.clipFinished( leftTriggerButton, {} )
				ToggleOutline:completeAnimation()
				ToggleOutline.label:completeAnimation()
				self.ToggleOutline.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_GRADIENT" ) )
				self.clipFinished( ToggleOutline, {} )
			end
		},
		Solid = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				rsOpacity:completeAnimation()
				self.rsOpacity:setAlpha( 1 )
				self.clipFinished( rsOpacity, {} )
				lsOpacity:completeAnimation()
				self.lsOpacity:setAlpha( 1 )
				self.clipFinished( lsOpacity, {} )
				opacityText:completeAnimation()
				self.opacityText:setAlpha( 1 )
				self.clipFinished( opacityText, {} )
				rotateText:completeAnimation()
				self.rotateText:setAlpha( 1 )
				self.rotateText:setText( Engine.Localize( "MENU_EMBLEM_ROTATE_GRADIENT" ) )
				self.clipFinished( rotateText, {} )
				rightTriggerButton:completeAnimation()
				self.rightTriggerButton:setAlpha( 1 )
				self.clipFinished( rightTriggerButton, {} )
				leftTriggerButton:completeAnimation()
				self.leftTriggerButton:setAlpha( 1 )
				self.clipFinished( leftTriggerButton, {} )
				ToggleOutline:completeAnimation()
				ToggleOutline.label:completeAnimation()
				self.ToggleOutline.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_SOLID" ) )
				self.clipFinished( ToggleOutline, {} )
			end
		},
		NoColor = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.rsOpacity:close()
		element.lsOpacity:close()
		element.ChangeColor:close()
		element.choosePaintSide:close()
		element.rightTriggerButton:close()
		element.leftTriggerButton:close()
		element.ToggleOutline:close()
		element.toggleBlend:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

