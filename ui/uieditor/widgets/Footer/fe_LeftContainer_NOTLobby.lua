-- a63c397c46b9fde003f83414e6d3ca3d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FooterButtonPrompt" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	local f2_local0 = DataSources
	if f2_local0 then
		f2_local0 = DataSources.LiveEventViewer
		if f2_local0 then
			f2_local0 = DataSources.LiveEventViewer.getModel()
		end
	end
	if f2_local0 then
		local f2_local1 = Engine.GetModel( f2_local0, "currentQuality" )
		if f2_local1 then
			self:subscribeToModel( f2_local1, function ( model )
				local f3_local0 = self.Xbtn:getModel()
				if f3_local0 then
					f3_local0 = Engine.GetModel( f3_local0, "Label" )
				end
				if f3_local0 then
					Engine.ForceNotifyModelSubscriptions( f3_local0 )
				end
			end )
		end
	end
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.fe_LeftContainer_NOTLobby = InheritFrom( LUI.UIElement )
CoD.fe_LeftContainer_NOTLobby.new = function ( menu, controller )
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
	self:setClass( CoD.fe_LeftContainer_NOTLobby )
	self.id = "fe_LeftContainer_NOTLobby"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 528 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Abtn = CoD.FooterButtonPrompt.new( menu, controller )
	Abtn:setLeftRight( true, false, 0, 88 )
	Abtn:setTopBottom( false, true, -32, 0 )
	Abtn.label:setText( Engine.Localize( "" ) )
	Abtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Abtn:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			Abtn.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	Abtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBA_PSCROSS, false, function ( model )
		Abtn:setModel( model, controller )
	end )
	self:addElement( Abtn )
	self.Abtn = Abtn
	
	local Bbtn = CoD.FooterButtonPrompt.new( menu, controller )
	Bbtn:setLeftRight( true, false, 88, 168 )
	Bbtn:setTopBottom( false, true, -32, 0 )
	Bbtn.label:setText( Engine.Localize( "" ) )
	Bbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Bbtn:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			Bbtn.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	Bbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, false, function ( model )
		Bbtn:setModel( model, controller )
	end )
	self:addElement( Bbtn )
	self.Bbtn = Bbtn
	
	local Xbtn = CoD.FooterButtonPrompt.new( menu, controller )
	Xbtn:setLeftRight( true, false, 168, 256 )
	Xbtn:setTopBottom( false, true, -32, 0 )
	Xbtn.label:setText( Engine.Localize( "" ) )
	Xbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Xbtn:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			Xbtn.buttonPromptImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	Xbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, false, function ( model )
		Xbtn:setModel( model, controller )
	end )
	self:addElement( Xbtn )
	self.Xbtn = Xbtn
	
	local OptionsBtn = CoD.FooterButtonPrompt.new( menu, controller )
	OptionsBtn:setLeftRight( true, false, 256, 344 )
	OptionsBtn:setTopBottom( false, true, -32, 0 )
	OptionsBtn.label:setText( Engine.Localize( "" ) )
	OptionsBtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	OptionsBtn:subscribeToGlobalModel( controller, "Controller", "start_button_image", function ( model )
		local startButtonImage = Engine.GetModelValue( model )
		if startButtonImage then
			OptionsBtn.buttonPromptImage:setImage( RegisterImage( startButtonImage ) )
		end
	end )
	OptionsBtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_START, false, function ( model )
		OptionsBtn:setModel( model, controller )
	end )
	self:addElement( OptionsBtn )
	self.OptionsBtn = OptionsBtn
	
	local Ybtn = CoD.FooterButtonPrompt.new( menu, controller )
	Ybtn:setLeftRight( true, false, 344, 432 )
	Ybtn:setTopBottom( false, true, -32, 0 )
	Ybtn.label:setText( Engine.Localize( "" ) )
	Ybtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	Ybtn:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			Ybtn.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	Ybtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, false, function ( model )
		Ybtn:setModel( model, controller )
	end )
	self:addElement( Ybtn )
	self.Ybtn = Ybtn
	
	local LTbtn = CoD.FooterButtonPrompt.new( menu, controller )
	LTbtn:setLeftRight( true, false, 432, 520 )
	LTbtn:setTopBottom( false, true, -32, 0 )
	LTbtn.label:setText( Engine.Localize( "" ) )
	LTbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	LTbtn:subscribeToGlobalModel( controller, "Controller", "left_trigger_button_image", function ( model )
		local leftTriggerButtonImage = Engine.GetModelValue( model )
		if leftTriggerButtonImage then
			LTbtn.buttonPromptImage:setImage( RegisterImage( leftTriggerButtonImage ) )
		end
	end )
	LTbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_LTRIG, false, function ( model )
		LTbtn:setModel( model, controller )
	end )
	self:addElement( LTbtn )
	self.LTbtn = LTbtn
	
	local RTbtn = CoD.FooterButtonPrompt.new( menu, controller )
	RTbtn:setLeftRight( true, false, 520, 608 )
	RTbtn:setTopBottom( false, true, -32, 0 )
	RTbtn.label:setText( Engine.Localize( "" ) )
	RTbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	RTbtn:subscribeToGlobalModel( controller, "Controller", "right_trigger_button_image", function ( model )
		local rightTriggerButtonImage = Engine.GetModelValue( model )
		if rightTriggerButtonImage then
			RTbtn.buttonPromptImage:setImage( RegisterImage( rightTriggerButtonImage ) )
		end
	end )
	RTbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_RTRIG, false, function ( model )
		RTbtn:setModel( model, controller )
	end )
	self:addElement( RTbtn )
	self.RTbtn = RTbtn
	
	local LeftStick = CoD.FooterButtonPrompt.new( menu, controller )
	LeftStick:setLeftRight( true, false, 608, 696 )
	LeftStick:setTopBottom( false, true, -32, 0 )
	LeftStick.label:setText( Engine.Localize( "" ) )
	LeftStick.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	LeftStick:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local moveLeftStickButtonImage = Engine.GetModelValue( model )
		if moveLeftStickButtonImage then
			LeftStick.buttonPromptImage:setImage( RegisterImage( moveLeftStickButtonImage ) )
		end
	end )
	LeftStick:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, false, function ( model )
		LeftStick:setModel( model, controller )
	end )
	self:addElement( LeftStick )
	self.LeftStick = LeftStick
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Abtn:close()
		element.Bbtn:close()
		element.Xbtn:close()
		element.OptionsBtn:close()
		element.Ybtn:close()
		element.LTbtn:close()
		element.RTbtn:close()
		element.LeftStick:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

