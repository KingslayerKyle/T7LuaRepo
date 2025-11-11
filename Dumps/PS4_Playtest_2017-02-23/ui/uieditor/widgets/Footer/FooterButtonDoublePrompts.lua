local PostLoadFunc = function ( self, controller )
	if CoD.isPC then
		
	else
		
	end
	self.label:linkToElementModel( self, "Label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.label:setText( Engine.Localize( modelValue ) )
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
	self:setLeftRight( 0, 0, 0, 283 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( 0, 0, 16, 52 )
	buttonPromptImage:setTopBottom( 0, 0, 10, 37 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local buttonPromptImage1 = LUI.UIImage.new()
	buttonPromptImage1:setLeftRight( 1, 1, -44, -8 )
	buttonPromptImage1:setTopBottom( 0, 0, 10, 37 )
	buttonPromptImage1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage1:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage1 )
	self.buttonPromptImage1 = buttonPromptImage1
	
	local label = LUI.UITightText.new()
	label:setLeftRight( 0, 0, 66, 236 )
	label:setTopBottom( 0, 0, 10, 37 )
	label:setText( Engine.Localize( "MPUI_CHANGE_ROLE" ) )
	label:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, -10 )
	end )
	self:addElement( label )
	self.label = label
	
	self.resetProperties = function ()
		buttonPromptImage:completeAnimation()
		label:completeAnimation()
		buttonPromptImage1:completeAnimation()
		buttonPromptImage:setLeftRight( 0, 0, 16, 52 )
		buttonPromptImage:setTopBottom( 0, 0, 10, 37 )
		buttonPromptImage:setRGB( 1, 1, 1 )
		buttonPromptImage:setAlpha( 1 )
		buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
		buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
		label:setRGB( 1, 1, 1 )
		label:setAlpha( 1 )
		buttonPromptImage1:setRGB( 1, 1, 1 )
		buttonPromptImage1:setAlpha( 1 )
		buttonPromptImage1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
		buttonPromptImage1:setShaderVector( 0, 1, 0, 0, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				buttonPromptImage1:completeAnimation()
				self.buttonPromptImage1:setAlpha( 0 )
				self.clipFinished( buttonPromptImage1, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Hide = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( 0, 0, 0, 48 )
				self.buttonPromptImage:setTopBottom( 0, 0, 0.5, 46.5 )
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
				local f11_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
				if f11_local0 then
					f11_local0 = IsGamepad( controller )
					if f11_local0 then
						f11_local0 = not IsSelfModelValueNonEmptyString( self, controller, "Label" )
					end
				end
				return f11_local0
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
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:linkToElementModel( self, "Label", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Label"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
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

