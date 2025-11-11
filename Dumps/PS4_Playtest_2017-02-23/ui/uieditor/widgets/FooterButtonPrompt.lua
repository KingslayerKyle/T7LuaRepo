if IsPC() then
	require( "ui.uieditor.widgets.KeyPrompt" )
end
local ResizeButtonPrompt = function ( self )
	local promptToLabelSpacing = 4
	local promptLeft, promptWidth, _ = nil
	if Engine.LastInput_Gamepad() then
		_, _, promptLeft, _ = self.buttonPromptImage:getLocalLeftRight()
		promptWidth, _ = self.buttonPromptImage:getLocalSize()
	else
		_, _, promptLeft, _ = self.keyPrompt:getLocalLeftRight()
		promptWidth, _ = self.keyPrompt:getLocalSize()
	end
	local labelLA, labelRA, _, _ = self.label:getLocalLeftRight()
	local labelWidth, _ = self.label:getLocalSize()
	local labelStart = promptLeft + promptWidth + promptToLabelSpacing
	self.label:setLeftRight( labelLA, labelRA, labelStart, labelStart + labelWidth )
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	self:setLeftRight( leftanchor, rightanchor, left, left + labelStart + labelWidth )
end

local SetupForPC = function ( self, controller )
	self:setHandleMouse( true )
	self:registerEventHandler( "button_action", function ( self, event )
		CoD.PCUtil.SimulateButtonPressUsingElement( controller, self )
		self:playClip( "DefaultClip" )
		return true
	end )
	self:registerEventHandler( "input_source_changed", function ( self, event )
		ResizeButtonPrompt( self )
	end )
	self.keyPrompt:linkToElementModel( self, "Button", true, function ( model )
		if model then
			local button = Engine.GetModelValue( model )
			if button == Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE then
				self.keyPrompt.keybind:setText( Engine.Localize( "KEY_ESC_SHORT" ) )
			elseif button == Enum.LUIButton.LUI_KEY_XBA_PSCROSS then
				self.keyPrompt.keybind:setText( Engine.Localize( "KEY_ENTER" ) )
			end
			ResizeButtonPrompt( self )
		end
	end )
	self.keyPrompt:linkToElementModel( self, "KeyShortcut", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.keyPrompt.keybind:setText( Engine.Localize( modelValue ) )
			ResizeButtonPrompt( self )
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
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( 0, 0, 21, 57 )
	buttonPromptImage:setTopBottom( 0, 0, 6, 42 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( 0, 0, 63, 132 )
	label:setTopBottom( 0, 0, 10, 37 )
	label:setText( Engine.Localize( "Select" ) )
	label:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, -40 )
	end )
	self:addElement( label )
	self.label = label
	
	local keyPrompt = nil
	if IsPC() then
		keyPrompt = CoD.KeyPrompt.new( menu, controller )
		keyPrompt:setLeftRight( 0, 0, 21, 57 )
		keyPrompt:setTopBottom( 0, 0, 6, 42 )
		keyPrompt:setAlpha( 0 )
		keyPrompt.keybind:setText( Engine.Localize( "" ) )
		self:addElement( keyPrompt )
		self.keyPrompt = keyPrompt
		
	else
		keyPrompt = LUI.UIElement.createFake()
		self.keyPrompt = keyPrompt
	end
	self.resetProperties = function ()
		buttonPromptImage:completeAnimation()
		label:completeAnimation()
		keyPrompt:completeAnimation()
		buttonPromptImage:setLeftRight( 0, 0, 21, 57 )
		buttonPromptImage:setTopBottom( 0, 0, 6, 42 )
		buttonPromptImage:setRGB( 1, 1, 1 )
		buttonPromptImage:setAlpha( 1 )
		buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
		buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
		label:setRGB( 1, 1, 1 )
		label:setAlpha( 1 )
		keyPrompt:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
				self.buttonPromptImage:setTopBottom( 0, 0, 0, 46 )
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				label:completeAnimation()
				self.label:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( label, {} )
			end
		},
		DisabledPC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 3 or 2 )
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
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 2 or 1 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				keyPrompt:completeAnimation()
				self.keyPrompt:setAlpha( 1 )
				self.clipFinished( keyPrompt, {} )
			end,
			Hide = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( 0, 0, 0, 48 )
				self.buttonPromptImage:setTopBottom( 0, 0, 0, 46 )
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( label, {} )
			end
		},
		InitialState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				local f22_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
				if f22_local0 then
					f22_local0 = IsGamepad( controller )
					if f22_local0 then
						f22_local0 = not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
					end
				end
				return f22_local0
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				local f23_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
				if f23_local0 then
					f23_local0 = IsGamepad( controller )
					if f23_local0 then
						f23_local0 = not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
					end
				end
				return f23_local0
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				local f24_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
				if f24_local0 then
					if not IsGamepad( controller ) and not ShouldHideButtonPromptForPC( element, controller ) and not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL ) then
						f24_local0 = IsPC()
					else
						f24_local0 = false
					end
				end
				return f24_local0
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f25_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
				if f25_local0 then
					if not IsGamepad( controller ) and not ShouldHideButtonPromptForPC( element, controller ) and not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL ) then
						f25_local0 = IsPC()
					else
						f25_local0 = false
					end
				end
				return f25_local0
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
	self:linkToElementModel( self, "flags", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "flags"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "DefaultState" ) then
			OverrideWidgetWidth( self, "0" )
			DisableMouseButton( self, controller )
		else
			RestoreWidgetWidth( self )
			EnableMouseButton( self, controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.keyPrompt:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local currentEv = self
	OverrideWidgetWidth( self, "0" )
	return self
end

