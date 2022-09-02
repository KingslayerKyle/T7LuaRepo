-- bd827497e691d5493f53da641bc532a8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )

local f0_local0 = function ( f1_arg0 )
	if IsElementInState( f1_arg0, "DefaultState" ) then
		OverrideWidgetWidth( f1_arg0, 0 )
	else
		local f1_local0 = Engine.LastInput_Gamepad()
		local f1_local1 = 4
		local f1_local2, f1_local3, f1_local4, f1_local5, f1_local6, f1_local7 = nil
		f1_local7, f1_local7, f1_local2, f1_local7 = f1_arg0.BumperButtonWithKeyMouseLeft:getLocalLeftRight()
		f1_local3, f1_local7 = f1_arg0.BumperButtonWithKeyMouseLeft:getLocalSize()
		f1_local5, f1_local6, f1_local7, f1_local7 = f1_arg0.BumperButtonWithKeyMouseRight:getLocalLeftRight()
		f1_local4, f1_local7 = f1_arg0.BumperButtonWithKeyMouseRight:getLocalSize()
		local f1_local8, f1_local9, f1_local10, f1_local11 = f1_arg0.label:getLocalLeftRight()
		local f1_local12 = f1_arg0.label:getTextWidth()
		local f1_local13 = f1_local2 + f1_local3 + f1_local1
		f1_arg0.label:setLeftRight( f1_local8, f1_local9, f1_local13, f1_local13 + f1_local12 )
		local f1_local14 = f1_local13 + f1_local12 + f1_local1
		if f1_local0 then
			f1_arg0.buttonPromptImage1:setLeftRight( f1_local5, f1_local6, f1_local14, f1_local14 + f1_local4 )
		else
			f1_arg0.BumperButtonWithKeyMouseRight:setLeftRight( f1_local5, f1_local6, f1_local14, f1_local14 + f1_local4 )
		end
		local f1_local15 = f1_local14 + f1_local4
		local f1_local16, f1_local17, f1_local18, f1_local19 = f1_arg0:getLocalLeftRight()
		f1_arg0:setLeftRight( f1_local16, f1_local17, f1_local18, f1_local18 + f1_local15 )
	end
	local f1_local0 = f1_arg0:getParent()
	if f1_local0 then
		f1_local0:setLayoutCached( false )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:setForceMouseEventDispatch( true )

	LUI.OverrideFunction_CallOriginalFirst( f2_arg0, "setState", function ( element, controller )
		f0_local0( f2_arg0 )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local1( self, controller, menu )
	end
	self.label:linkToElementModel( self, "Label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.label:setText( Engine.Localize( modelValue ) )
			if CoD.isPC then
				f0_local0( self )
			end
		end
	end )
end

CoD.FooterButtonDoublePrompts = InheritFrom( LUI.UIElement )
CoD.FooterButtonDoublePrompts.new = function ( menu, controller )
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
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FooterButtonDoublePrompts )
	self.id = "FooterButtonDoublePrompts"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 189 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local BumperButtonWithKeyMouseLeft = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	BumperButtonWithKeyMouseLeft:setLeftRight( true, false, 0, 45 )
	BumperButtonWithKeyMouseLeft:setTopBottom( true, false, 1, 31 )
	BumperButtonWithKeyMouseLeft:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			BumperButtonWithKeyMouseLeft.ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	BumperButtonWithKeyMouseLeft:registerEventHandler( "button_action", function ( element, event )
		local f8_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LB )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( BumperButtonWithKeyMouseLeft )
	self.BumperButtonWithKeyMouseLeft = BumperButtonWithKeyMouseLeft
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 45, 45 )
	buttonPromptImage:setTopBottom( true, false, 7, 25 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 45, 158 )
	label:setTopBottom( true, false, 7, 25 )
	label:setText( Engine.Localize( "MPUI_CHANGE_ROLE" ) )
	label:setTTF( "fonts/default.ttf" )

	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, -10 )
	end )
	self:addElement( label )
	self.label = label
	
	local BumperButtonWithKeyMouseRight = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	BumperButtonWithKeyMouseRight:setLeftRight( true, false, 158, 203 )
	BumperButtonWithKeyMouseRight:setTopBottom( true, false, 1, 31 )
	BumperButtonWithKeyMouseRight.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	BumperButtonWithKeyMouseRight:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			BumperButtonWithKeyMouseRight.ControllerImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	BumperButtonWithKeyMouseRight:registerEventHandler( "button_action", function ( element, event )
		local f11_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RB )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( BumperButtonWithKeyMouseRight )
	self.BumperButtonWithKeyMouseRight = BumperButtonWithKeyMouseRight
	
	local buttonPromptImage1 = LUI.UIImage.new()
	buttonPromptImage1:setLeftRight( true, false, 203, 203 )
	buttonPromptImage1:setTopBottom( true, false, 7, 25 )
	buttonPromptImage1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage1:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage1 )
	self.buttonPromptImage1 = buttonPromptImage1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BumperButtonWithKeyMouseLeft:completeAnimation()
				self.BumperButtonWithKeyMouseLeft:setAlpha( 0 )
				self.clipFinished( BumperButtonWithKeyMouseLeft, {} )

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

				BumperButtonWithKeyMouseRight:completeAnimation()
				self.BumperButtonWithKeyMouseRight:setAlpha( 0 )
				self.clipFinished( BumperButtonWithKeyMouseRight, {} )

				buttonPromptImage1:completeAnimation()
				self.buttonPromptImage1:setRGB( 1, 1, 1 )
				self.buttonPromptImage1:setAlpha( 0 )
				self.buttonPromptImage1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage1:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( buttonPromptImage1, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BumperButtonWithKeyMouseLeft:completeAnimation()
				self.BumperButtonWithKeyMouseLeft:setAlpha( 0.5 )
				self.clipFinished( BumperButtonWithKeyMouseLeft, {} )

				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )

				label:completeAnimation()
				self.label:setRGB( 0.5, 0.5, 0.5 )
				self.label:setAlpha( 0.5 )
				self.clipFinished( label, {} )

				BumperButtonWithKeyMouseRight:completeAnimation()
				self.BumperButtonWithKeyMouseRight:setAlpha( 0.5 )
				self.clipFinished( BumperButtonWithKeyMouseRight, {} )

				buttonPromptImage1:completeAnimation()
				self.buttonPromptImage1:setAlpha( 0 )
				self.clipFinished( buttonPromptImage1, {} )
			end
		},
		Enabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BumperButtonWithKeyMouseLeft:completeAnimation()
				self.BumperButtonWithKeyMouseLeft:setAlpha( 1 )
				self.clipFinished( BumperButtonWithKeyMouseLeft, {} )

				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )

				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )

				BumperButtonWithKeyMouseRight:completeAnimation()
				self.BumperButtonWithKeyMouseRight:setAlpha( 1 )
				self.clipFinished( BumperButtonWithKeyMouseRight, {} )

				buttonPromptImage1:completeAnimation()
				self.buttonPromptImage1:setAlpha( 0 )
				self.clipFinished( buttonPromptImage1, {} )
			end,
			Hide = function ()
				self:setupElementClipCounter( 5 )

				BumperButtonWithKeyMouseLeft:completeAnimation()
				self.BumperButtonWithKeyMouseLeft:setAlpha( 0 )
				self.clipFinished( BumperButtonWithKeyMouseLeft, {} )

				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( true, false, 0, 32 )
				self.buttonPromptImage:setTopBottom( true, false, 0, 31 )
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )

				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )

				BumperButtonWithKeyMouseRight:completeAnimation()
				self.BumperButtonWithKeyMouseRight:setAlpha( 0 )
				self.clipFinished( BumperButtonWithKeyMouseRight, {} )

				buttonPromptImage1:completeAnimation()
				self.buttonPromptImage1:setAlpha( 0 )
				self.clipFinished( buttonPromptImage1, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
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

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "DefaultState" ) then
			OverrideWidgetWidth( self, "0" )
		else
			RestoreWidgetWidth( self )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BumperButtonWithKeyMouseLeft:close()
		element.BumperButtonWithKeyMouseRight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

