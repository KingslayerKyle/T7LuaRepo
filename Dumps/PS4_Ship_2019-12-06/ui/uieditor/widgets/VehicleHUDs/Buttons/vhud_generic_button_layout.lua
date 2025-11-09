require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_ButtonWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_key_mouse_layout" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if IsGamepad( f1_arg1 ) then
		f1_arg0.vhudgenerickeymouselayout:close()
		return 
	else
		f1_arg0.RightStick:close()
		f1_arg0.RightTrigger:close()
		f1_arg0.RightBumper:close()
		f1_arg0.LeftStick:close()
		f1_arg0.LeftTrigger:close()
		f1_arg0.LeftBumper:close()
		f1_arg0.L3Button:close()
		f1_arg0.R3Button:close()
	end
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local0( self, controller, menu )
end

CoD.vhud_generic_button_layout = InheritFrom( LUI.UIElement )
CoD.vhud_generic_button_layout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_generic_button_layout )
	self.id = "vhud_generic_button_layout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local RightStick = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	RightStick:setLeftRight( false, true, -342, -256 )
	RightStick:setTopBottom( false, true, -117, -8 )
	RightStick:setYRot( -30 )
	RightStick:setZRot( -4 )
	RightStick:subscribeToGlobalModel( controller, "VehicleController", "right_stick_move_image", function ( model )
		local rightStickMoveImage = Engine.GetModelValue( model )
		if rightStickMoveImage then
			RightStick.button0:setImage( RegisterImage( rightStickMoveImage ) )
		end
	end )
	RightStick:subscribeToGlobalModel( controller, "VehicleController", "right_stick_move_image", function ( model )
		local rightStickMoveImage = Engine.GetModelValue( model )
		if rightStickMoveImage then
			RightStick.button1:setImage( RegisterImage( rightStickMoveImage ) )
		end
	end )
	RightStick:subscribeToGlobalModel( controller, "VehicleController", "right_stick_move_image", function ( model )
		local rightStickMoveImage = Engine.GetModelValue( model )
		if rightStickMoveImage then
			RightStick.button:setImage( RegisterImage( rightStickMoveImage ) )
		end
	end )
	RightStick:linkToElementModel( self, "R_STICK", false, function ( model )
		RightStick:setModel( model, controller )
	end )
	self:addElement( RightStick )
	self.RightStick = RightStick
	
	local RightTrigger = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	RightTrigger:setLeftRight( false, true, -175, -89 )
	RightTrigger:setTopBottom( false, true, -128, -19 )
	RightTrigger:setYRot( -30 )
	RightTrigger:setZRot( -4 )
	RightTrigger:subscribeToGlobalModel( controller, "VehicleController", "right_trigger_button_image", function ( model )
		local rightTriggerButtonImage = Engine.GetModelValue( model )
		if rightTriggerButtonImage then
			RightTrigger.button0:setImage( RegisterImage( rightTriggerButtonImage ) )
		end
	end )
	RightTrigger:subscribeToGlobalModel( controller, "VehicleController", "right_trigger_button_image", function ( model )
		local rightTriggerButtonImage = Engine.GetModelValue( model )
		if rightTriggerButtonImage then
			RightTrigger.button1:setImage( RegisterImage( rightTriggerButtonImage ) )
		end
	end )
	RightTrigger:subscribeToGlobalModel( controller, "VehicleController", "right_trigger_button_image", function ( model )
		local rightTriggerButtonImage = Engine.GetModelValue( model )
		if rightTriggerButtonImage then
			RightTrigger.button:setImage( RegisterImage( rightTriggerButtonImage ) )
		end
	end )
	RightTrigger:linkToElementModel( self, "BUTTON_RTRIG", false, function ( model )
		RightTrigger:setModel( model, controller )
	end )
	self:addElement( RightTrigger )
	self.RightTrigger = RightTrigger
	
	local RightBumper = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	RightBumper:setLeftRight( false, true, -121, -35 )
	RightBumper:setTopBottom( false, true, -198, -89 )
	RightBumper:setYRot( -30 )
	RightBumper:setZRot( -4 )
	RightBumper:subscribeToGlobalModel( controller, "VehicleController", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RightBumper.button0:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	RightBumper:subscribeToGlobalModel( controller, "VehicleController", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RightBumper.button1:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	RightBumper:subscribeToGlobalModel( controller, "VehicleController", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RightBumper.button:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	RightBumper:linkToElementModel( self, "BUTTON_RSHLDR", false, function ( model )
		RightBumper:setModel( model, controller )
	end )
	self:addElement( RightBumper )
	self.RightBumper = RightBumper
	
	local LeftStick = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	LeftStick:setLeftRight( true, false, 252, 338 )
	LeftStick:setTopBottom( false, true, -117, -8 )
	LeftStick:setYRot( 30 )
	LeftStick:setZRot( 4 )
	LeftStick:subscribeToGlobalModel( controller, "VehicleController", "left_stick_move_image", function ( model )
		local leftStickMoveImage = Engine.GetModelValue( model )
		if leftStickMoveImage then
			LeftStick.button0:setImage( RegisterImage( leftStickMoveImage ) )
		end
	end )
	LeftStick:subscribeToGlobalModel( controller, "VehicleController", "left_stick_move_image", function ( model )
		local leftStickMoveImage = Engine.GetModelValue( model )
		if leftStickMoveImage then
			LeftStick.button1:setImage( RegisterImage( leftStickMoveImage ) )
		end
	end )
	LeftStick:subscribeToGlobalModel( controller, "VehicleController", "left_stick_move_image", function ( model )
		local leftStickMoveImage = Engine.GetModelValue( model )
		if leftStickMoveImage then
			LeftStick.button:setImage( RegisterImage( leftStickMoveImage ) )
		end
	end )
	LeftStick:linkToElementModel( self, "L_STICK", false, function ( model )
		LeftStick:setModel( model, controller )
	end )
	self:addElement( LeftStick )
	self.LeftStick = LeftStick
	
	local LeftTrigger = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	LeftTrigger:setLeftRight( true, false, 91, 177 )
	LeftTrigger:setTopBottom( false, true, -130, -21 )
	LeftTrigger:setYRot( 30 )
	LeftTrigger:setZRot( 4 )
	LeftTrigger:subscribeToGlobalModel( controller, "VehicleController", "left_trigger_button_image", function ( model )
		local leftTriggerButtonImage = Engine.GetModelValue( model )
		if leftTriggerButtonImage then
			LeftTrigger.button0:setImage( RegisterImage( leftTriggerButtonImage ) )
		end
	end )
	LeftTrigger:subscribeToGlobalModel( controller, "VehicleController", "left_trigger_button_image", function ( model )
		local leftTriggerButtonImage = Engine.GetModelValue( model )
		if leftTriggerButtonImage then
			LeftTrigger.button1:setImage( RegisterImage( leftTriggerButtonImage ) )
		end
	end )
	LeftTrigger:subscribeToGlobalModel( controller, "VehicleController", "left_trigger_button_image", function ( model )
		local leftTriggerButtonImage = Engine.GetModelValue( model )
		if leftTriggerButtonImage then
			LeftTrigger.button:setImage( RegisterImage( leftTriggerButtonImage ) )
		end
	end )
	LeftTrigger:linkToElementModel( self, "BUTTON_LTRIG", false, function ( model )
		LeftTrigger:setModel( model, controller )
	end )
	self:addElement( LeftTrigger )
	self.LeftTrigger = LeftTrigger
	
	local LeftBumper = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	LeftBumper:setLeftRight( true, false, 35, 121 )
	LeftBumper:setTopBottom( false, true, -197, -88 )
	LeftBumper:setYRot( 30 )
	LeftBumper:setZRot( 4 )
	LeftBumper:subscribeToGlobalModel( controller, "VehicleController", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LeftBumper.button0:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	LeftBumper:subscribeToGlobalModel( controller, "VehicleController", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LeftBumper.button1:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	LeftBumper:subscribeToGlobalModel( controller, "VehicleController", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LeftBumper.button:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	LeftBumper:linkToElementModel( self, "BUTTON_LSHLDR", false, function ( model )
		LeftBumper:setModel( model, controller )
	end )
	self:addElement( LeftBumper )
	self.LeftBumper = LeftBumper
	
	local L3Button = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	L3Button:setLeftRight( true, false, 329, 415 )
	L3Button:setTopBottom( false, true, -125.5, -16.5 )
	L3Button:setYRot( 30 )
	L3Button:setZRot( 4 )
	L3Button:subscribeToGlobalModel( controller, "VehicleController", "left_stick_button_image", function ( model )
		local leftStickButtonImage = Engine.GetModelValue( model )
		if leftStickButtonImage then
			L3Button.button0:setImage( RegisterImage( leftStickButtonImage ) )
		end
	end )
	L3Button:subscribeToGlobalModel( controller, "VehicleController", "left_stick_button_image", function ( model )
		local leftStickButtonImage = Engine.GetModelValue( model )
		if leftStickButtonImage then
			L3Button.button1:setImage( RegisterImage( leftStickButtonImage ) )
		end
	end )
	L3Button:subscribeToGlobalModel( controller, "VehicleController", "left_stick_button_image", function ( model )
		local leftStickButtonImage = Engine.GetModelValue( model )
		if leftStickButtonImage then
			L3Button.button:setImage( RegisterImage( leftStickButtonImage ) )
		end
	end )
	L3Button:linkToElementModel( self, "BUTTON_LSTICK", false, function ( model )
		L3Button:setModel( model, controller )
	end )
	self:addElement( L3Button )
	self.L3Button = L3Button
	
	local R3Button = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	R3Button:setLeftRight( false, true, -425, -339 )
	R3Button:setTopBottom( false, true, -127.5, -18.5 )
	R3Button:setYRot( -30 )
	R3Button:setZRot( -4 )
	R3Button:subscribeToGlobalModel( controller, "VehicleController", "right_stick_button_image", function ( model )
		local rightStickButtonImage = Engine.GetModelValue( model )
		if rightStickButtonImage then
			R3Button.button0:setImage( RegisterImage( rightStickButtonImage ) )
		end
	end )
	R3Button:subscribeToGlobalModel( controller, "VehicleController", "right_stick_button_image", function ( model )
		local rightStickButtonImage = Engine.GetModelValue( model )
		if rightStickButtonImage then
			R3Button.button1:setImage( RegisterImage( rightStickButtonImage ) )
		end
	end )
	R3Button:subscribeToGlobalModel( controller, "VehicleController", "right_stick_button_image", function ( model )
		local rightStickButtonImage = Engine.GetModelValue( model )
		if rightStickButtonImage then
			R3Button.button:setImage( RegisterImage( rightStickButtonImage ) )
		end
	end )
	R3Button:linkToElementModel( self, "BUTTON_RSTICK", false, function ( model )
		R3Button:setModel( model, controller )
	end )
	self:addElement( R3Button )
	self.R3Button = R3Button
	
	local vhudgenerickeymouselayout = CoD.vhud_generic_key_mouse_layout.new( menu, controller )
	vhudgenerickeymouselayout:setLeftRight( true, true, 0, 0 )
	vhudgenerickeymouselayout:setTopBottom( true, true, 0, 0 )
	vhudgenerickeymouselayout:linkToElementModel( self, nil, false, function ( model )
		vhudgenerickeymouselayout:setModel( model, controller )
	end )
	self:addElement( vhudgenerickeymouselayout )
	self.vhudgenerickeymouselayout = vhudgenerickeymouselayout
	
	local AXButton = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	AXButton:setLeftRight( false, true, -259, -173 )
	AXButton:setTopBottom( false, true, -123, -14 )
	AXButton:setYRot( -30 )
	AXButton:setZRot( -4 )
	AXButton:subscribeToGlobalModel( controller, "VehicleController", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			AXButton.button0:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	AXButton:subscribeToGlobalModel( controller, "VehicleController", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			AXButton.button1:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	AXButton:subscribeToGlobalModel( controller, "VehicleController", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			AXButton.button:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	AXButton:linkToElementModel( self, "BUTTON_A", false, function ( model )
		AXButton:setModel( model, controller )
	end )
	self:addElement( AXButton )
	self.AXButton = AXButton
	
	local BCircleButton = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	BCircleButton:setLeftRight( false, true, -258, -172 )
	BCircleButton:setTopBottom( false, true, -123, -14 )
	BCircleButton:setYRot( -30 )
	BCircleButton:setZRot( -4 )
	BCircleButton:subscribeToGlobalModel( controller, "VehicleController", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			BCircleButton.button0:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	BCircleButton:subscribeToGlobalModel( controller, "VehicleController", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			BCircleButton.button1:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	BCircleButton:subscribeToGlobalModel( controller, "VehicleController", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			BCircleButton.button:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	BCircleButton:linkToElementModel( self, "BUTTON_B", false, function ( model )
		BCircleButton:setModel( model, controller )
	end )
	self:addElement( BCircleButton )
	self.BCircleButton = BCircleButton
	
	local XSquareButton = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	XSquareButton:setLeftRight( true, false, 172, 258 )
	XSquareButton:setTopBottom( false, true, -123, -14 )
	XSquareButton:setYRot( 30 )
	XSquareButton:setZRot( 4 )
	XSquareButton:subscribeToGlobalModel( controller, "VehicleController", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			XSquareButton.button0:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	XSquareButton:subscribeToGlobalModel( controller, "VehicleController", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			XSquareButton.button1:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	XSquareButton:subscribeToGlobalModel( controller, "VehicleController", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			XSquareButton.button:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	XSquareButton:linkToElementModel( self, "BUTTON_X", false, function ( model )
		XSquareButton:setModel( model, controller )
	end )
	self:addElement( XSquareButton )
	self.XSquareButton = XSquareButton
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RightStick:close()
		element.RightTrigger:close()
		element.RightBumper:close()
		element.LeftStick:close()
		element.LeftTrigger:close()
		element.LeftBumper:close()
		element.L3Button:close()
		element.R3Button:close()
		element.vhudgenerickeymouselayout:close()
		element.AXButton:close()
		element.BCircleButton:close()
		element.XSquareButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

