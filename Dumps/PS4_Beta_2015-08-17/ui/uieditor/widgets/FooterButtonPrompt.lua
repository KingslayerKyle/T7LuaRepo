require( "ui.uieditor.widgets.Border" )

local SetupForPC = function ( self, controller )
	self:setHandleMouse( true )
	self:registerEventHandler( "button_action", function ( self, event )
		local model = self:getModel()
		if model then
			local buttonModel = Engine.GetModel( model, "Button" )
			if buttonModel then
				local button = Engine.GetModelValue( buttonModel )
				local buttonBitModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. button )
				if buttonBitModel then
					Engine.SetModelValue( buttonBitModel, Enum.LUIButtonFlags.FLAG_DOWN )
				end
			end
		end
		self:playClip( "DefaultClip" )
	end )
	self:registerEventHandler( "update_state", function ( self, event )
		local model = self:getModel()
		if model then
			local buttonModel = Engine.GetModel( model, "Button" )
			if buttonModel then
				local button = Engine.GetModelValue( buttonModel )
				if button == Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE then
					self.keybind:setText( Engine.Localize( "KEY_ESC_SHORT" ) )
				end
			end
		end
		LUI.UIElement.updateState( self, event )
	end )
	self.keybind:linkToElementModel( self, "KeyShortcut", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.keybind:setText( Engine.Localize( modelValue ) )
		end
	end )
end

local PostLoadFunc = function ( self, controller )
	if CoD.isPC then
		SetupForPC( self, controller )
	end
	self.label:linkToElementModel( self, "Label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.label:setText( Engine.Localize( modelValue ) )
		end
	end )
end

CoD.FooterButtonPrompt = InheritFrom( LUI.UIElement )
CoD.FooterButtonPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FooterButtonPrompt )
	self.id = "FooterButtonPrompt"
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
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, -40 )
	end )
	self:addElement( label )
	self.label = label
	
	local keybind = LUI.UIText.new()
	keybind:setLeftRight( true, false, 14, 38 )
	keybind:setTopBottom( true, false, 4, 28 )
	keybind:setAlpha( 0 )
	keybind:setText( Engine.Localize( "" ) )
	keybind:setTTF( "fonts/default.ttf" )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( keybind )
	self.keybind = keybind
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, false, 11, 39 )
	Border:setTopBottom( true, false, 4, 28 )
	Border:setRGB( 0.79, 0.78, 0.78 )
	Border:setAlpha( 0 )
	self:addElement( Border )
	self.Border = Border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
				keybind:completeAnimation()
				self.keybind:setAlpha( 0 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
				keybind:completeAnimation()
				self.keybind:setAlpha( 0 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		Enabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
				keybind:completeAnimation()
				self.keybind:setAlpha( 0 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
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
				self:setupElementClipCounter( 4 )
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
				keybind:completeAnimation()
				self.keybind:setAlpha( 0.5 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setLeftRight( true, false, 11, 39 )
				self.Border:setTopBottom( true, false, 4, 28 )
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		EnabledPC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
				keybind:completeAnimation()
				self.keybind:setAlpha( 1 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setLeftRight( true, false, 11, 39 )
				self.Border:setTopBottom( true, false, 4, 28 )
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end,
			Hide = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( true, false, 0, 32 )
				self.buttonPromptImage:setTopBottom( true, false, 0, 31 )
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
				keybind:completeAnimation()
				self.keybind:setAlpha( 0 )
				self.clipFinished( keybind, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )
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
				keybind:completeAnimation()
				self.keybind:setAlpha( 1 )
				self.clipFinished( keybind, {} )
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
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS ) and not IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS ) and not IsGamepad( controller )
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
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "DefaultState" ) then
			OverrideWidgetWidth( self, "0" )
		else
			RestoreWidgetWidth( self )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

