require( "ui.uieditor.widgets.Footer.fe_FooterButtonPromptWithContainer" )
require( "ui.uieditor.widgets.FooterButtonPrompt" )

local SetupPC = function ( self, controller, menu )
	self:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
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
	self:setLeftRight( 0, 0, 0, 646 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Abtn = CoD.FooterButtonPrompt.new( menu, controller )
	Abtn:setLeftRight( 0, 0, 0, 132 )
	Abtn:setTopBottom( 0, 0, 0, 48 )
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
	
	local Bbtn = CoD.FooterButtonPrompt.new( menu, controller )
	Bbtn:setLeftRight( 0, 0, 132, 252 )
	Bbtn:setTopBottom( 0, 0, 0, 48 )
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
	
	local Xbtn = CoD.FooterButtonPrompt.new( menu, controller )
	Xbtn:setLeftRight( 0, 0, 252, 384 )
	Xbtn:setTopBottom( 0, 0, 0, 48 )
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
	
	local feFooterButtonPromptWithContainer = CoD.fe_FooterButtonPromptWithContainer.new( menu, controller )
	feFooterButtonPromptWithContainer:setLeftRight( 0, 0, 384, 507 )
	feFooterButtonPromptWithContainer:setTopBottom( 0, 0, -22, 66 )
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
	
	local feFooterButtonPromptWithContainer0 = CoD.fe_FooterButtonPromptWithContainer.new( menu, controller )
	feFooterButtonPromptWithContainer0:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				local f12_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
				if f12_local0 then
					f12_local0 = IsGamepad( controller )
					if f12_local0 then
						f12_local0 = AlwaysFalse()
					end
				end
				return f12_local0
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				local f13_local0 = IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
				if f13_local0 then
					if not IsGamepad( controller ) then
						f13_local0 = IsPC()
						if f13_local0 then
							f13_local0 = AlwaysFalse()
						end
					else
						f13_local0 = false
					end
				end
				return f13_local0
			end
		}
	} )
	feFooterButtonPromptWithContainer0:linkToElementModel( feFooterButtonPromptWithContainer0, nil, true, function ( model )
		menu:updateElementState( feFooterButtonPromptWithContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
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
	feFooterButtonPromptWithContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( feFooterButtonPromptWithContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	feFooterButtonPromptWithContainer0:setLeftRight( 0, 0, 507, 643 )
	feFooterButtonPromptWithContainer0:setTopBottom( 0, 0, -23, 69 )
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
	self:addElement( feFooterButtonPromptWithContainer0 )
	self.feFooterButtonPromptWithContainer0 = feFooterButtonPromptWithContainer0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Abtn:close()
		self.Bbtn:close()
		self.Xbtn:close()
		self.feFooterButtonPromptWithContainer:close()
		self.feFooterButtonPromptWithContainer0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

