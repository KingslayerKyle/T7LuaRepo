require( "ui.uieditor.widgets.KeyPrompt" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = 4
	local f1_local1, f1_local2, f1_local3 = nil
	if Engine.LastInput_Gamepad() then
		f1_local3, f1_local3, f1_local1, f1_local3 = f1_arg0.buttonPromptImage:getLocalLeftRight()
		f1_local2, f1_local3 = f1_arg0.buttonPromptImage:getLocalSize()
	else
		f1_local3, f1_local3, f1_local1, f1_local3 = f1_arg0.keyPrompt:getLocalLeftRight()
		f1_local2, f1_local3 = f1_arg0.keyPrompt:getLocalSize()
	end
	local f1_local4, f1_local5, f1_local6, f1_local7 = f1_arg0.label:getLocalLeftRight()
	local f1_local8, f1_local9 = f1_arg0.label:getLocalSize()
	local f1_local10 = f1_local1 + f1_local2 + f1_local0
	f1_arg0.label:setLeftRight( f1_local4, f1_local5, f1_local10, f1_local10 + f1_local8 )
	local f1_local11, f1_local12, f1_local13, f1_local14 = f1_arg0:getLocalLeftRight()
	f1_arg0:setLeftRight( f1_local11, f1_local12, f1_local13, f1_local13 + f1_local10 + f1_local8 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0:setHandleMouse( true )
	f2_arg0:registerEventHandler( "button_action", function ( element, event )
		CoD.PCUtil.SimulateButtonPressUsingElement( f2_arg1, element )
		element:playClip( "DefaultClip" )
		return true
	end )
	f2_arg0:registerEventHandler( "input_source_changed", function ( element, event )
		f0_local0( element )
	end )
	f2_arg0.keyPrompt:linkToElementModel( f2_arg0, "Button", true, function ( model )
		if model then
			local f5_local0 = Engine.GetModelValue( model )
			if f5_local0 == Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE then
				f2_arg0.keyPrompt.keybind:setText( Engine.Localize( "KEY_ESC_SHORT" ) )
			elseif f5_local0 == Enum.LUIButton.LUI_KEY_XBA_PSCROSS then
				f2_arg0.keyPrompt.keybind:setText( Engine.Localize( "KEY_ENTER" ) )
			end
			f0_local0( f2_arg0 )
		end
	end )
	f2_arg0.keyPrompt:linkToElementModel( f2_arg0, "KeyShortcut", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.keyPrompt.keybind:setText( Engine.Localize( modelValue ) )
			f0_local0( f2_arg0 )
		end
	end )
end

local PostLoadFunc = function ( f7_arg0, f7_arg1 )
	if CoD.isPC then
		f0_local1( f7_arg0, f7_arg1 )
	end
	f7_arg0.label:linkToElementModel( f7_arg0, "Label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f7_arg0.label:setText( Engine.Localize( modelValue ) )
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
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, -40 )
	end )
	self:addElement( label )
	self.label = label
	
	local f9_local3 = nil
	if IsPC() then
		f9_local3 = CoD.KeyPrompt.new( menu, controller )
	else
		f9_local3 = LUI.UIElement.createFake()
	end
	f9_local3:setLeftRight( true, false, 14, 38 )
	f9_local3:setTopBottom( true, false, 4, 28 )
	f9_local3:setAlpha( 0 )
	f9_local3.keybind:setText( Engine.Localize( "" ) )
	if IsPC() then
		self:addElement( f9_local3 )
	end
	self.keyPrompt = f9_local3
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
				f9_local3:completeAnimation()
				self.keyPrompt:setAlpha( 0 )
				self.clipFinished( f9_local3, {} )
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
				f9_local3:completeAnimation()
				self.keyPrompt:setAlpha( 0 )
				self.clipFinished( f9_local3, {} )
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
				f9_local3:completeAnimation()
				self.keyPrompt:setAlpha( 0 )
				self.clipFinished( f9_local3, {} )
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
				f9_local3:completeAnimation()
				self.keyPrompt:setAlpha( 0.5 )
				self.clipFinished( f9_local3, {} )
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
				f9_local3:completeAnimation()
				self.keyPrompt:setAlpha( 1 )
				self.clipFinished( f9_local3, {} )
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
				local f23_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
				if f23_local0 then
					if not IsGamepad( controller ) then
						f23_local0 = not ShouldHideButtonPromptForPC( element, controller )
					else
						f23_local0 = false
					end
				end
				return f23_local0
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f24_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
				if f24_local0 then
					if not IsGamepad( controller ) then
						f24_local0 = not ShouldHideButtonPromptForPC( element, controller )
					else
						f24_local0 = false
					end
				end
				return f24_local0
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
		local f9_local4 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f9_local4( self, event )
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

