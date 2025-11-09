local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if CoD.isPC then
		
	else
		
	end
	f1_arg0.label:linkToElementModel( f1_arg0, "Label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.label:setText( Engine.Localize( modelValue ) )
		end
	end )
end

CoD.FooterButtonDoublePrompts = InheritFrom( LUI.UIElement )
CoD.FooterButtonDoublePrompts.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FooterButtonDoublePrompts )
	self.id = "FooterButtonDoublePrompts"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 189 )
	self:setTopBottom( true, false, 0, 32 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 11, 35 )
	buttonPromptImage:setTopBottom( true, false, 7, 25 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local buttonPromptImage1 = LUI.UIImage.new()
	buttonPromptImage1:setLeftRight( false, true, -29, -5 )
	buttonPromptImage1:setTopBottom( true, false, 7, 25 )
	buttonPromptImage1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage1:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage1 )
	self.buttonPromptImage1 = buttonPromptImage1
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 44, 157 )
	label:setTopBottom( true, false, 7, 25 )
	label:setText( Engine.Localize( "MPUI_CHANGE_ROLE" ) )
	label:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, -10 )
	end )
	self:addElement( label )
	self.label = label
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setRGB( 1, 1, 1 )
				self.buttonPromptImage:setAlpha( 0 )
				self.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( buttonPromptImage, {} )
				buttonPromptImage1:completeAnimation()
				self.buttonPromptImage1:setRGB( 1, 1, 1 )
				self.buttonPromptImage1:setAlpha( 0 )
				self.buttonPromptImage1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage1:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( buttonPromptImage1, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setRGB( 0.5, 0.5, 0.5 )
				self.buttonPromptImage:setAlpha( 0.5 )
				self.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage:setShaderVector( 0, 0, 0, 0, 0 )
				self.clipFinished( buttonPromptImage, {} )
				buttonPromptImage1:completeAnimation()
				self.buttonPromptImage1:setRGB( 0.5, 0.5, 0.5 )
				self.buttonPromptImage1:setAlpha( 0.5 )
				self.buttonPromptImage1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage1:setShaderVector( 0, 0, 0, 0, 0 )
				self.clipFinished( buttonPromptImage1, {} )
				label:completeAnimation()
				self.label:setRGB( 0.5, 0.5, 0.5 )
				self.label:setAlpha( 0.5 )
				self.clipFinished( label, {} )
			end
		},
		Enabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setRGB( 1, 1, 1 )
				self.buttonPromptImage:setAlpha( 1 )
				self.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( buttonPromptImage, {} )
				buttonPromptImage1:completeAnimation()
				self.buttonPromptImage1:setRGB( 1, 1, 1 )
				self.buttonPromptImage1:setAlpha( 1 )
				self.buttonPromptImage1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage1:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( buttonPromptImage1, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
			end,
			Hide = function ()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( true, false, 0, 32 )
				self.buttonPromptImage:setTopBottom( true, false, 0, 31 )
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS ) and IsGamepad( controller )
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS ) and IsGamepad( controller )
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if self.m_eventHandlers.input_source_changed then
		local f3_local4 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f3_local4( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "DefaultState" ) then
			OverrideWidgetWidth( self, "0" )
		else
			RestoreWidgetWidth( self )
		end
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

