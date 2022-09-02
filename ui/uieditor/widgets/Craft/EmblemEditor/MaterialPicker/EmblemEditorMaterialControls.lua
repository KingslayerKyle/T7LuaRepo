-- e954c9b3a5a269a6c05f778be808f81c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )

CoD.EmblemEditorMaterialControls = InheritFrom( LUI.UIElement )
CoD.EmblemEditorMaterialControls.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorMaterialControls )
	self.id = "EmblemEditorMaterialControls"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 145 )
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
	
	local ChangeColor = CoD.PaintshopButtonPrompt.new( menu, controller )
	ChangeColor:setLeftRight( true, false, 14, 247 )
	ChangeColor:setTopBottom( true, false, 30, 61 )
	ChangeColor.label:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_MATERIAL" ) )
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
	rotateText:setLeftRight( true, false, 55, 240 )
	rotateText:setTopBottom( true, false, 93.5, 109.5 )
	rotateText:setText( Engine.Localize( "MENU_EMBLEM_ROTATE_MATERIAL" ) )
	rotateText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rotateText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rotateText )
	self.rotateText = rotateText
	
	local rightTriggerButton = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rightTriggerButton:setLeftRight( true, false, 26, 49 )
	rightTriggerButton:setTopBottom( true, false, 87.5, 118.5 )
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
	leftTriggerButton:setTopBottom( true, false, 87.5, 118.5 )
	leftTriggerButton.label:setText( Engine.Localize( "" ) )
	leftTriggerButton:subscribeToGlobalModel( controller, "Controller", "left_trigger_button_image", function ( model )
		local leftTriggerButtonImage = Engine.GetModelValue( model )
		if leftTriggerButtonImage then
			leftTriggerButton.buttonPromptImage:setImage( RegisterImage( leftTriggerButtonImage ) )
		end
	end )
	self:addElement( leftTriggerButton )
	self.leftTriggerButton = leftTriggerButton
	
	local FreeScale = CoD.PaintshopButtonPrompt.new( menu, controller )
	FreeScale:setLeftRight( true, false, 14, 252 )
	FreeScale:setTopBottom( true, false, 58, 89 )
	FreeScale.label:setText( Engine.Localize( "MENU_EMBLEM_FREE_SCALE" ) )
	FreeScale:subscribeToGlobalModel( controller, "Controller", "right_stick_button_image", function ( model )
		local rightStickButtonImage = Engine.GetModelValue( model )
		if rightStickButtonImage then
			FreeScale.buttonPromptImage:setImage( RegisterImage( rightStickButtonImage ) )
		end
	end )
	FreeScale:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( FreeScale )
	self.FreeScale = FreeScale
	
	local FixedScale = CoD.PaintshopButtonPrompt.new( menu, controller )
	FixedScale:setLeftRight( true, false, 14, 247 )
	FixedScale:setTopBottom( true, false, 58, 89 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FreeScale:completeAnimation()
				self.FreeScale:setAlpha( 0 )
				self.clipFinished( FreeScale, {} )

				FixedScale:completeAnimation()
				self.FixedScale:setAlpha( 1 )
				self.clipFinished( FixedScale, {} )
			end
		},
		FixedScale = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FreeScale:completeAnimation()
				self.FreeScale:setAlpha( 0 )
				self.clipFinished( FreeScale, {} )

				FixedScale:completeAnimation()
				self.FixedScale:setAlpha( 1 )
				self.clipFinished( FixedScale, {} )
			end
		},
		FreeScale = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FreeScale:completeAnimation()
				self.FreeScale:setAlpha( 1 )
				self.clipFinished( FreeScale, {} )

				FixedScale:completeAnimation()
				self.FixedScale:setAlpha( 0 )
				self.clipFinished( FixedScale, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.ChangeColor:close()
		element.choosePaintSide:close()
		element.rightTriggerButton:close()
		element.leftTriggerButton:close()
		element.FreeScale:close()
		element.FixedScale:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

