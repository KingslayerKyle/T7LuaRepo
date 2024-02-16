require( "ui.uieditor.widgets.Footer.fe_FooterButtonPromptWithContainer" )
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
	self:setLeftRight( true, false, 0, 870 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	local feFooterButtonPromptWithContainer0 = CoD.fe_FooterButtonPromptWithContainer.new( menu, controller )
	feFooterButtonPromptWithContainer0:setLeftRight( false, true, -91, 0 )
	feFooterButtonPromptWithContainer0:setTopBottom( false, true, -49, 12 )
	feFooterButtonPromptWithContainer0.label:setText( Engine.Localize( "" ) )
	feFooterButtonPromptWithContainer0:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			feFooterButtonPromptWithContainer0.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	feFooterButtonPromptWithContainer0:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, false, function ( model )
		feFooterButtonPromptWithContainer0:setModel( model, controller )
	end )
	feFooterButtonPromptWithContainer0:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				local f6_local0 = IsGamepad( controller )
				if f6_local0 then
					f6_local0 = AlwaysFalse()
				end
				return f6_local0
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				local f7_local0 = IsGamepad( controller )
				if f7_local0 then
					f7_local0 = not IsLAN()
				end
				return f7_local0
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
		local currentEv = feFooterButtonPromptWithContainer0.m_eventHandlers.input_source_changed
		feFooterButtonPromptWithContainer0:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		feFooterButtonPromptWithContainer0:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
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
	
	local currentEv = LUI.UIImage.new()
	currentEv:setLeftRight( true, false, 776, 779 )
	currentEv:setTopBottom( true, false, -36, 92 )
	currentEv:setAlpha( 0 )
	self:addElement( currentEv )
	self.Image00 = currentEv
	
	local feFooterButtonPromptWithContainer = CoD.fe_FooterButtonPromptWithContainer.new( menu, controller )
	feFooterButtonPromptWithContainer:setLeftRight( false, true, -176, -94 )
	feFooterButtonPromptWithContainer:setTopBottom( false, true, -49, 12 )
	feFooterButtonPromptWithContainer.label:setText( Engine.Localize( "" ) )
	feFooterButtonPromptWithContainer:subscribeToGlobalModel( controller, "Controller", "start_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			feFooterButtonPromptWithContainer.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	feFooterButtonPromptWithContainer:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_START, false, function ( model )
		feFooterButtonPromptWithContainer:setModel( model, controller )
	end )
	self:addElement( feFooterButtonPromptWithContainer )
	self.feFooterButtonPromptWithContainer = feFooterButtonPromptWithContainer
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 678, 694 )
	Image0:setTopBottom( true, false, -36, 92 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FooterButtonDoublePrompts = CoD.FooterButtonDoublePrompts.new( menu, controller )
	FooterButtonDoublePrompts:setLeftRight( false, true, -374, -192 )
	FooterButtonDoublePrompts:setTopBottom( false, true, -32, 0 )
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
	Padbtn:setLeftRight( false, true, -534.5, -374 )
	Padbtn:setTopBottom( false, true, -32, 0 )
	Padbtn.label:setText( Engine.Localize( "" ) )
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
	RJoystickbtn:setLeftRight( false, true, -625.5, -534.5 )
	RJoystickbtn:setTopBottom( false, true, -32, 0 )
	RJoystickbtn.label:setText( Engine.Localize( "" ) )
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
		self.feFooterButtonPromptWithContainer0:close()
		self.feFooterButtonPromptWithContainer:close()
		self.FooterButtonDoublePrompts:close()
		self.Padbtn:close()
		self.RJoystickbtn:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

