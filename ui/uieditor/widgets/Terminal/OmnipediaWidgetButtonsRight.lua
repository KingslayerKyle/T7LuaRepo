-- b40cd9abc4fc28332b0e87056d6dcb5b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FooterButtonPrompt" )

CoD.OmnipediaWidgetButtonsRight = InheritFrom( LUI.UIElement )
CoD.OmnipediaWidgetButtonsRight.new = function ( menu, controller )
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
	self:setClass( CoD.OmnipediaWidgetButtonsRight )
	self.id = "OmnipediaWidgetButtonsRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 870 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Padbtn = CoD.FooterButtonPrompt.new( menu, controller )
	Padbtn:setLeftRight( false, true, -160.5, 0 )
	Padbtn:setTopBottom( false, true, -32, 0 )
	Padbtn.label:setText( Engine.Localize( "" ) )
	Padbtn:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			Padbtn.buttonPromptImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	Padbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_RB, false, function ( model )
		Padbtn:setModel( model, controller )
	end )
	self:addElement( Padbtn )
	self.Padbtn = Padbtn
	
	local RJoystickbtn = CoD.FooterButtonPrompt.new( menu, controller )
	RJoystickbtn:setLeftRight( false, true, -251.5, -160.5 )
	RJoystickbtn:setTopBottom( false, true, -32, 0 )
	RJoystickbtn.label:setText( Engine.Localize( "" ) )
	RJoystickbtn:subscribeToGlobalModel( controller, "Controller", "move_right_stick_button_image", function ( model )
		local moveRightStickButtonImage = Engine.GetModelValue( model )
		if moveRightStickButtonImage then
			RJoystickbtn.buttonPromptImage:setImage( RegisterImage( moveRightStickButtonImage ) )
		end
	end )
	RJoystickbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, false, function ( model )
		RJoystickbtn:setModel( model, controller )
	end )
	self:addElement( RJoystickbtn )
	self.RJoystickbtn = RJoystickbtn
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Padbtn:close()
		element.RJoystickbtn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
