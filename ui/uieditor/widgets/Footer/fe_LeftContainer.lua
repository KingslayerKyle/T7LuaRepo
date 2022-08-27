-- fec48851355ac7a679b683ebda84ccf2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FooterButtonPrompt" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.fe_LeftContainer = InheritFrom( LUI.UIElement )
CoD.fe_LeftContainer.new = function ( menu, controller )
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
	self:setClass( CoD.fe_LeftContainer )
	self.id = "fe_LeftContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 431 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Abtn = CoD.FooterButtonPrompt.new( menu, controller )
	Abtn:setLeftRight( true, false, 0, 88 )
	Abtn:setTopBottom( true, false, 0, 32 )
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
	Bbtn:setTopBottom( true, false, 0, 32 )
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
	Xbtn:setTopBottom( true, false, 0, 32 )
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
	
	local LTbtn = CoD.FooterButtonPrompt.new( menu, controller )
	LTbtn:setLeftRight( true, false, 256, 344 )
	LTbtn:setTopBottom( true, false, 0, 32 )
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Abtn:close()
		element.Bbtn:close()
		element.Xbtn:close()
		element.LTbtn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

