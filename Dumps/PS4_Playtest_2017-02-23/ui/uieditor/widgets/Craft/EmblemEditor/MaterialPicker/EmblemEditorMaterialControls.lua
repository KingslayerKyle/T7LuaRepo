require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )

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
	self:setLeftRight( 0, 0, 0, 375 )
	self:setTopBottom( 0, 0, 0, 217 )
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
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 42, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local ChangeColor = CoD.PaintshopButtonPrompt.new( menu, controller )
	ChangeColor:setLeftRight( 0, 0, 21, 371 )
	ChangeColor:setTopBottom( 0, 0, 45, 91 )
	ChangeColor.label:setText( Engine.Localize( "MENU_EMBLEM_CHOOSE_MATERIAL" ) )
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
	rotateText:setLeftRight( 0, 0, 82, 360 )
	rotateText:setTopBottom( 0, 0, 140, 164 )
	rotateText:setText( Engine.Localize( "MENU_EMBLEM_ROTATE_MATERIAL" ) )
	rotateText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
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
	
	local FreeScale = CoD.PaintshopButtonPrompt.new( menu, controller )
	FreeScale:setLeftRight( 0, 0, 21, 378 )
	FreeScale:setTopBottom( 0, 0, 87, 133 )
	FreeScale.label:setText( Engine.Localize( "MENU_EMBLEM_FREE_SCALE" ) )
	FreeScale:subscribeToGlobalModel( controller, "Controller", "right_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FreeScale.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	FreeScale:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( FreeScale )
	self.FreeScale = FreeScale
	
	local FixedScale = CoD.PaintshopButtonPrompt.new( menu, controller )
	FixedScale:setLeftRight( 0, 0, 21, 371 )
	FixedScale:setTopBottom( 0, 0, 87, 133 )
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
	
	self.resetProperties = function ()
		FixedScale:completeAnimation()
		FreeScale:completeAnimation()
		FixedScale:setAlpha( 0 )
		FreeScale:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.ChangeColor:close()
		self.choosePaintSide:close()
		self.rightTriggerButton:close()
		self.leftTriggerButton:close()
		self.FreeScale:close()
		self.FixedScale:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

