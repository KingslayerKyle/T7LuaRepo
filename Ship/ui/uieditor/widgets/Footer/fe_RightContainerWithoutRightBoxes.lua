-- 71ec5dc33be8d4e0899cef040f4da1f8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Footer.FooterButtonDoublePrompts" )
require( "ui.uieditor.widgets.FooterButtonPrompt" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

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
	self:setLeftRight( true, false, 0, 870 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 867, 870 )
	Image00:setTopBottom( true, false, -36, 92 )
	Image00:setAlpha( 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 851, 867 )
	Image0:setTopBottom( true, false, -36, 92 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FooterButtonDoublePrompts = CoD.FooterButtonDoublePrompts.new( menu, controller )
	FooterButtonDoublePrompts:setLeftRight( false, true, -201, -19 )
	FooterButtonDoublePrompts:setTopBottom( false, true, -32, 0 )
	FooterButtonDoublePrompts.label:setText( Engine.Localize( "" ) )
	FooterButtonDoublePrompts:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			FooterButtonDoublePrompts.buttonPromptImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	FooterButtonDoublePrompts:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			FooterButtonDoublePrompts.buttonPromptImage1:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	FooterButtonDoublePrompts:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_LB, false, function ( model )
		FooterButtonDoublePrompts:setModel( model, controller )
	end )
	self:addElement( FooterButtonDoublePrompts )
	self.FooterButtonDoublePrompts = FooterButtonDoublePrompts
	
	local Padbtn = CoD.FooterButtonPrompt.new( menu, controller )
	Padbtn:setLeftRight( false, true, -361.5, -201 )
	Padbtn:setTopBottom( false, true, -32, 0 )
	Padbtn.label:setText( Engine.Localize( "" ) )
	Padbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Padbtn:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local backButtonImage = Engine.GetModelValue( model )
		if backButtonImage then
			Padbtn.buttonPromptImage:setImage( RegisterImage( backButtonImage ) )
		end
	end )
	Padbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_BACK, false, function ( model )
		Padbtn:setModel( model, controller )
	end )
	self:addElement( Padbtn )
	self.Padbtn = Padbtn
	
	local RJoystickbtn = CoD.FooterButtonPrompt.new( menu, controller )
	RJoystickbtn:setLeftRight( false, true, -452.5, -361.5 )
	RJoystickbtn:setTopBottom( false, true, -32, 0 )
	RJoystickbtn.label:setText( Engine.Localize( "" ) )
	RJoystickbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	RJoystickbtn:subscribeToGlobalModel( controller, "Controller", "move_right_stick_button_image", function ( model )
		local moveRightStickButtonImage = Engine.GetModelValue( model )
		if moveRightStickButtonImage then
			RJoystickbtn.buttonPromptImage:setImage( RegisterImage( moveRightStickButtonImage ) )
		end
	end )
	RJoystickbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, false, function ( model )
		RJoystickbtn:setModel( model, controller )
	end )
	RJoystickbtn:mergeStateConditions( {
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				local f11_local0
				if not ShouldHideButtonPromptForPC( element, controller ) then
					f11_local0 = AlwaysFalse()
				else
					f11_local0 = false
				end
				return f11_local0
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f12_local0
				if not ShouldHideButtonPromptForPC( element, controller ) then
					f12_local0 = AlwaysFalse()
				else
					f12_local0 = false
				end
				return f12_local0
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
		local f3_local6 = RJoystickbtn.m_eventHandlers.input_source_changed
		RJoystickbtn:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f3_local6( element, event )
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
	self:addElement( RJoystickbtn )
	self.RJoystickbtn = RJoystickbtn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				RJoystickbtn:completeAnimation()
				self.RJoystickbtn:setLeftRight( false, true, -450.5, -361.5 )
				self.RJoystickbtn:setTopBottom( false, true, -32, 0 )
				self.clipFinished( RJoystickbtn, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FooterButtonDoublePrompts:close()
		element.Padbtn:close()
		element.RJoystickbtn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
