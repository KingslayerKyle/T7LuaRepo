require( "ui.uieditor.widgets.KeyPrompt" )

CoD.FooterButtonPromptWithPCKey = InheritFrom( LUI.UIElement )
CoD.FooterButtonPromptWithPCKey.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FooterButtonPromptWithPCKey )
	self.id = "FooterButtonPromptWithPCKey"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 32 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 14, 38 )
	buttonPromptImage:setTopBottom( true, false, 4, 28 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 42, 88 )
	label:setTopBottom( true, false, 7, 25 )
	label:setText( Engine.Localize( "Select" ) )
	label:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, -40 )
	end )
	self:addElement( label )
	self.label = label
	
	local keyPrompt = CoD.KeyPrompt.new( menu, controller )
	keyPrompt:setLeftRight( true, false, 14, 38 )
	keyPrompt:setTopBottom( true, false, 4, 28 )
	keyPrompt:setAlpha( 0 )
	keyPrompt.keybind:setText( Engine.Localize( "" ) )
	self:addElement( keyPrompt )
	self.keyPrompt = keyPrompt
	
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
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
				keyPrompt:completeAnimation()
				self.keyPrompt:setAlpha( 0 )
				self.clipFinished( keyPrompt, {} )
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
				label:completeAnimation()
				self.label:setRGB( 0.5, 0.5, 0.5 )
				self.label:setAlpha( 0.5 )
				self.clipFinished( label, {} )
				keyPrompt:completeAnimation()
				self.keyPrompt:setAlpha( 0 )
				self.clipFinished( keyPrompt, {} )
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
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
				keyPrompt:completeAnimation()
				self.keyPrompt:setAlpha( 0 )
				self.clipFinished( keyPrompt, {} )
			end,
			Hide = function ()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( true, false, 0, 32 )
				self.buttonPromptImage:setTopBottom( true, false, 0, 31 )
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setRGB( 1, 1, 1 )
				self.buttonPromptImage:setAlpha( 1 )
				self.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 0.87, 0.37, 0 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
			end
		},
		DisabledPC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setRGB( 0.5, 0.5, 0.5 )
				self.buttonPromptImage:setAlpha( 0 )
				self.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage:setShaderVector( 0, 0, 0, 0, 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 0.5, 0.5, 0.5 )
				self.label:setAlpha( 0.5 )
				self.clipFinished( label, {} )
				keyPrompt:completeAnimation()
				self.keyPrompt:setAlpha( 0.5 )
				self.clipFinished( keyPrompt, {} )
			end
		},
		EnabledPC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setRGB( 1, 1, 1 )
				self.buttonPromptImage:setAlpha( 0 )
				self.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
				keyPrompt:completeAnimation()
				self.keyPrompt:setAlpha( 1 )
				self.clipFinished( keyPrompt, {} )
			end,
			Hide = function ()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( true, false, 0, 32 )
				self.buttonPromptImage:setTopBottom( true, false, 0, 31 )
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setRGB( 1, 1, 1 )
				self.buttonPromptImage:setAlpha( 0 )
				self.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 0.87, 0.37, 0 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
			end
		},
		InitialState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
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
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				local f15_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
				if f15_local0 then
					if not IsGamepad( controller ) then
						f15_local0 = not ShouldHideButtonPromptForPC( element, controller )
					else
						f15_local0 = false
					end
				end
				return f15_local0
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f16_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
				if f16_local0 then
					if not IsGamepad( controller ) then
						f16_local0 = not ShouldHideButtonPromptForPC( element, controller )
					else
						f16_local0 = false
					end
				end
				return f16_local0
			end
		},
		{
			stateName = "InitialState",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
		local f1_local4 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f1_local4( self, event )
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
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "DefaultState" ) then
			OverrideWidgetWidth( self, "0" )
			DisableMouseButton( self, controller )
		else
			RestoreWidgetWidth( self )
			EnableMouseButton( self, controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.keyPrompt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

