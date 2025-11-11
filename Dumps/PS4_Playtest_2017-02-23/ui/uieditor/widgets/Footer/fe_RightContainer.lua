require( "ui.uieditor.widgets.Footer.FooterButtonDoublePrompts" )
require( "ui.uieditor.widgets.FooterButtonPrompt" )

local SetupPC = function ( self, controller, menu )
	self:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

CoD.fe_RightContainer = InheritFrom( LUI.UIElement )
CoD.fe_RightContainer.new = function ( menu, controller )
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
	self:setClass( CoD.fe_RightContainer )
	self.id = "fe_RightContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1305 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, 1164, 1168 )
	Image00:setTopBottom( 0, 0, -54, 138 )
	Image00:setAlpha( 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 1017, 1041 )
	Image0:setTopBottom( 0, 0, -54, 138 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FooterButtonDoublePrompts = CoD.FooterButtonDoublePrompts.new( menu, controller )
	FooterButtonDoublePrompts:setLeftRight( 1, 1, -561, -288 )
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
	Padbtn:setLeftRight( 1, 1, -802, -561 )
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
	RJoystickbtn:setLeftRight( 1, 1, -938, -802 )
	RJoystickbtn:setTopBottom( 1, 1, -48, 0 )
	RJoystickbtn.label:setText( Engine.Localize( "" ) )
	RJoystickbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	RJoystickbtn:subscribeToGlobalModel( controller, "Controller", "right_stick_button_image", function ( model )
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

