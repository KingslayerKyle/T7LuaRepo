require( "ui.uieditor.widgets.Footer.FooterButtonDoublePrompts" )
require( "ui.uieditor.widgets.FooterButtonPrompt" )

CoD.fe_RightContainerWithoutRightBoxes = InheritFrom( LUI.UIElement )
CoD.fe_RightContainerWithoutRightBoxes.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_RightContainerWithoutRightBoxes )
	self.id = "fe_RightContainerWithoutRightBoxes"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1305 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, 1301, 1305 )
	Image00:setTopBottom( 0, 0, -54, 138 )
	Image00:setAlpha( 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 1276, 1300 )
	Image0:setTopBottom( 0, 0, -54, 138 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FooterButtonDoublePrompts = CoD.FooterButtonDoublePrompts.new( menu, controller )
	FooterButtonDoublePrompts:setLeftRight( 1, 1, -301, -28 )
	FooterButtonDoublePrompts:setTopBottom( 1, 1, -48, 0 )
	FooterButtonDoublePrompts.label:setText( Engine.Localize( "" ) )
	FooterButtonDoublePrompts:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FooterButtonDoublePrompts.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	FooterButtonDoublePrompts:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FooterButtonDoublePrompts.buttonPromptImage1:setImage( RegisterImage( modelValue ) )
		end
	end )
	FooterButtonDoublePrompts:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_LB, false, function ( model )
		FooterButtonDoublePrompts:setModel( model, controller )
	end )
	self:addElement( FooterButtonDoublePrompts )
	self.FooterButtonDoublePrompts = FooterButtonDoublePrompts
	
	local Padbtn = CoD.FooterButtonPrompt.new( menu, controller )
	Padbtn:setLeftRight( 1, 1, -542, -301 )
	Padbtn:setTopBottom( 1, 1, -48, 0 )
	Padbtn.label:setText( Engine.Localize( "" ) )
	Padbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Padbtn:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Padbtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	Padbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_BACK, false, function ( model )
		Padbtn:setModel( model, controller )
	end )
	self:addElement( Padbtn )
	self.Padbtn = Padbtn
	
	local RJoystickbtn = CoD.FooterButtonPrompt.new( menu, controller )
	RJoystickbtn:mergeStateConditions( {
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				local f7_local0
				if not ShouldHideButtonPromptForPC( element, controller ) and not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL ) then
					f7_local0 = IsPC()
					if f7_local0 then
						f7_local0 = AlwaysFalse()
					end
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f8_local0
				if not ShouldHideButtonPromptForPC( element, controller ) and not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL ) then
					f8_local0 = IsPC()
					if f8_local0 then
						f8_local0 = AlwaysFalse()
					end
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	RJoystickbtn:linkToElementModel( RJoystickbtn, nil, true, function ( model )
		menu:updateElementState( RJoystickbtn, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if RJoystickbtn.m_eventHandlers.input_source_changed then
		local currentEv = RJoystickbtn.m_eventHandlers.input_source_changed
		RJoystickbtn:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		RJoystickbtn:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	RJoystickbtn:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( RJoystickbtn, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	RJoystickbtn:linkToElementModel( RJoystickbtn, "flags", true, function ( model )
		menu:updateElementState( RJoystickbtn, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "flags"
		} )
	end )
	RJoystickbtn:setLeftRight( 1, 1, -678, -542 )
	RJoystickbtn:setTopBottom( 1, 1, -48, 0 )
	RJoystickbtn.label:setText( Engine.Localize( "" ) )
	RJoystickbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	RJoystickbtn:subscribeToGlobalModel( controller, "Controller", "move_right_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RJoystickbtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	RJoystickbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, false, function ( model )
		RJoystickbtn:setModel( model, controller )
	end )
	self:addElement( RJoystickbtn )
	self.RJoystickbtn = RJoystickbtn
	
	self.resetProperties = function ()
		RJoystickbtn:completeAnimation()
		RJoystickbtn:setLeftRight( 1, 1, -678, -542 )
		RJoystickbtn:setTopBottom( 1, 1, -48, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				RJoystickbtn:completeAnimation()
				self.RJoystickbtn:setLeftRight( 1, 1, -676, -542 )
				self.RJoystickbtn:setTopBottom( 1, 1, -48, 0 )
				self.clipFinished( RJoystickbtn, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FooterButtonDoublePrompts:close()
		self.Padbtn:close()
		self.RJoystickbtn:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

