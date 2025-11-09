require( "ui.uieditor.widgets.Footer.fe_FooterButtonPromptWithContainer" )
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
	self:setLeftRight( true, false, 0, 870 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	local feFooterButtonPromptWithContainer0 = CoD.fe_FooterButtonPromptWithContainer.new( menu, controller )
	feFooterButtonPromptWithContainer0:setLeftRight( false, true, -91, 0 )
	feFooterButtonPromptWithContainer0:setTopBottom( false, true, -49, 12 )
	feFooterButtonPromptWithContainer0.label:setText( Engine.Localize( "" ) )
	feFooterButtonPromptWithContainer0:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			feFooterButtonPromptWithContainer0.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	feFooterButtonPromptWithContainer0:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, false, function ( model )
		feFooterButtonPromptWithContainer0:setModel( model, controller )
	end )
	feFooterButtonPromptWithContainer0:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller ) and AlwaysFalse()
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller ) and not IsLAN()
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsGamepad( controller ) then
					f8_local0 = AlwaysFalse()
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsGamepad( controller ) then
					f9_local0 = not IsLAN()
				else
					f9_local0 = false
				end
				return f9_local0
			end
		}
	} )
	if feFooterButtonPromptWithContainer0.m_eventHandlers.input_source_changed then
		local Image00 = feFooterButtonPromptWithContainer0.m_eventHandlers.input_source_changed
		feFooterButtonPromptWithContainer0:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return Image00( element, event )
		end )
	else
		feFooterButtonPromptWithContainer0:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	feFooterButtonPromptWithContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( feFooterButtonPromptWithContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	feFooterButtonPromptWithContainer0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( feFooterButtonPromptWithContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	feFooterButtonPromptWithContainer0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( feFooterButtonPromptWithContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( feFooterButtonPromptWithContainer0 )
	self.feFooterButtonPromptWithContainer0 = feFooterButtonPromptWithContainer0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 776, 779 )
	Image00:setTopBottom( true, false, -36, 92 )
	Image00:setAlpha( 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local feFooterButtonPromptWithContainer = CoD.fe_FooterButtonPromptWithContainer.new( menu, controller )
	feFooterButtonPromptWithContainer:setLeftRight( false, true, -176, -94 )
	feFooterButtonPromptWithContainer:setTopBottom( false, true, -49, 12 )
	feFooterButtonPromptWithContainer.label:setText( Engine.Localize( "" ) )
	feFooterButtonPromptWithContainer:subscribeToGlobalModel( controller, "Controller", "start_button_image", function ( model )
		local startButtonImage = Engine.GetModelValue( model )
		if startButtonImage then
			feFooterButtonPromptWithContainer.buttonPromptImage:setImage( RegisterImage( startButtonImage ) )
		end
	end )
	feFooterButtonPromptWithContainer:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_START, false, function ( model )
		feFooterButtonPromptWithContainer:setModel( model, controller )
	end )
	self:addElement( feFooterButtonPromptWithContainer )
	self.feFooterButtonPromptWithContainer = feFooterButtonPromptWithContainer
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( true, false, 691, 694 )
	Image000:setTopBottom( true, false, -39, 89 )
	Image000:setAlpha( 0 )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local ServerBrowserPrompt = CoD.fe_FooterButtonPromptWithContainer.new( menu, controller )
	ServerBrowserPrompt:setLeftRight( false, true, -279, -179 )
	ServerBrowserPrompt:setTopBottom( false, true, -49, 12 )
	ServerBrowserPrompt.label:setText( Engine.Localize( "Select" ) )
	ServerBrowserPrompt:subscribeToGlobalModel( controller, "Controller", "left_stick_button_image", function ( model )
		local leftStickButtonImage = Engine.GetModelValue( model )
		if leftStickButtonImage then
			ServerBrowserPrompt.buttonPromptImage:setImage( RegisterImage( leftStickButtonImage ) )
		end
	end )
	ServerBrowserPrompt:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, false, function ( model )
		ServerBrowserPrompt:setModel( model, controller )
	end )
	self:addElement( ServerBrowserPrompt )
	self.ServerBrowserPrompt = ServerBrowserPrompt
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 575, 591 )
	Image0:setTopBottom( true, false, -36, 92 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FooterButtonDoublePrompts = CoD.FooterButtonDoublePrompts.new( menu, controller )
	FooterButtonDoublePrompts:setLeftRight( false, true, -477, -295 )
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
	Padbtn:setLeftRight( false, true, -637.5, -477 )
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
	RJoystickbtn:setLeftRight( false, true, -728.5, -637.5 )
	RJoystickbtn:setTopBottom( false, true, -32, 0 )
	RJoystickbtn.label:setText( Engine.Localize( "" ) )
	RJoystickbtn.keyPrompt.keybind:setText( Engine.Localize( "" ) )
	RJoystickbtn:subscribeToGlobalModel( controller, "Controller", "right_stick_button_image", function ( model )
		local rightStickButtonImage = Engine.GetModelValue( model )
		if rightStickButtonImage then
			RJoystickbtn.buttonPromptImage:setImage( RegisterImage( rightStickButtonImage ) )
		end
	end )
	RJoystickbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, false, function ( model )
		RJoystickbtn:setModel( model, controller )
	end )
	self:addElement( RJoystickbtn )
	self.RJoystickbtn = RJoystickbtn
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feFooterButtonPromptWithContainer0:close()
		element.feFooterButtonPromptWithContainer:close()
		element.ServerBrowserPrompt:close()
		element.FooterButtonDoublePrompts:close()
		element.Padbtn:close()
		element.RJoystickbtn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

