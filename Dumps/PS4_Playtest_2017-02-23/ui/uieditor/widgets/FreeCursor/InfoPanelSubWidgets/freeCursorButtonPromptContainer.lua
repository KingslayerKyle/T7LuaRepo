require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorButtonPrompt" )

CoD.freeCursorButtonPromptContainer = InheritFrom( LUI.UIElement )
CoD.freeCursorButtonPromptContainer.new = function ( menu, controller )
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
	self:setClass( CoD.freeCursorButtonPromptContainer )
	self.id = "freeCursorButtonPromptContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 792 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Abtn = CoD.freeCursorButtonPrompt.new( menu, controller )
	Abtn:setLeftRight( 0, 0, 0, 132 )
	Abtn:setTopBottom( 1, 1, -48, 0 )
	Abtn.label:setText( Engine.Localize( "" ) )
	Abtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Abtn:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Abtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	Abtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBA_PSCROSS, false, function ( model )
		Abtn:setModel( model, controller )
	end )
	self:addElement( Abtn )
	self.Abtn = Abtn
	
	local Bbtn = CoD.freeCursorButtonPrompt.new( menu, controller )
	Bbtn:setLeftRight( 0, 0, 132, 252 )
	Bbtn:setTopBottom( 1, 1, -48, 0 )
	Bbtn.label:setText( Engine.Localize( "" ) )
	Bbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Bbtn:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Bbtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	Bbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, false, function ( model )
		Bbtn:setModel( model, controller )
	end )
	self:addElement( Bbtn )
	self.Bbtn = Bbtn
	
	local Xbtn = CoD.freeCursorButtonPrompt.new( menu, controller )
	Xbtn:setLeftRight( 0, 0, 252, 384 )
	Xbtn:setTopBottom( 1, 1, -48, 0 )
	Xbtn.label:setText( Engine.Localize( "" ) )
	Xbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Xbtn:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Xbtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	Xbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, false, function ( model )
		Xbtn:setModel( model, controller )
	end )
	self:addElement( Xbtn )
	self.Xbtn = Xbtn
	
	local OptionsBtn = CoD.freeCursorButtonPrompt.new( menu, controller )
	OptionsBtn:setLeftRight( 0, 0, 384, 516 )
	OptionsBtn:setTopBottom( 1, 1, -48, 0 )
	OptionsBtn.label:setText( Engine.Localize( "" ) )
	OptionsBtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	OptionsBtn:subscribeToGlobalModel( controller, "Controller", "start_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			OptionsBtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	OptionsBtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_START, false, function ( model )
		OptionsBtn:setModel( model, controller )
	end )
	self:addElement( OptionsBtn )
	self.OptionsBtn = OptionsBtn
	
	local Ybtn = CoD.freeCursorButtonPrompt.new( menu, controller )
	Ybtn:setLeftRight( 0, 0, 516, 648 )
	Ybtn:setTopBottom( 1, 1, -48, 0 )
	Ybtn.label:setText( Engine.Localize( "" ) )
	Ybtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Ybtn:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Ybtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	Ybtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, false, function ( model )
		Ybtn:setModel( model, controller )
	end )
	self:addElement( Ybtn )
	self.Ybtn = Ybtn
	
	local LTbtn = CoD.freeCursorButtonPrompt.new( menu, controller )
	LTbtn:setLeftRight( 0, 0, 648, 780 )
	LTbtn:setTopBottom( 1, 1, -48, 0 )
	LTbtn.label:setText( Engine.Localize( "" ) )
	LTbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	LTbtn:subscribeToGlobalModel( controller, "Controller", "left_trigger_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LTbtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	LTbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_LTRIG, false, function ( model )
		LTbtn:setModel( model, controller )
	end )
	self:addElement( LTbtn )
	self.LTbtn = LTbtn
	
	local RTbtn = CoD.freeCursorButtonPrompt.new( menu, controller )
	RTbtn:setLeftRight( 0, 0, 780, 912 )
	RTbtn:setTopBottom( 1, 1, -48, 0 )
	RTbtn.label:setText( Engine.Localize( "" ) )
	RTbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	RTbtn:subscribeToGlobalModel( controller, "Controller", "right_trigger_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RTbtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	RTbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_RTRIG, false, function ( model )
		RTbtn:setModel( model, controller )
	end )
	self:addElement( RTbtn )
	self.RTbtn = RTbtn
	
	local LeftStick = CoD.freeCursorButtonPrompt.new( menu, controller )
	LeftStick:setLeftRight( 0, 0, 912, 1044 )
	LeftStick:setTopBottom( 1, 1, -48, 0 )
	LeftStick.label:setText( Engine.Localize( "" ) )
	LeftStick.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	LeftStick:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeftStick.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	LeftStick:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, false, function ( model )
		LeftStick:setModel( model, controller )
	end )
	self:addElement( LeftStick )
	self.LeftStick = LeftStick
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Abtn:close()
		self.Bbtn:close()
		self.Xbtn:close()
		self.OptionsBtn:close()
		self.Ybtn:close()
		self.LTbtn:close()
		self.RTbtn:close()
		self.LeftStick:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

