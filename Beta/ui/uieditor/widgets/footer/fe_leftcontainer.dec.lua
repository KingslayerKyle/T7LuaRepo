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
	self:setLeftRight( true, false, 0, 431 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	local Abtn = CoD.FooterButtonPrompt.new( menu, controller )
	Abtn:setLeftRight( true, false, 0, 88 )
	Abtn:setTopBottom( true, false, 0, 32 )
	Abtn.label:setText( Engine.Localize( "" ) )
	Abtn:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Abtn.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	Abtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBA_PSCROSS, false, function ( model )
		Abtn:setModel( model, controller )
	end )
	Abtn:mergeStateConditions( {
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	Abtn:linkToElementModel( nil, true, function ( model )
		menu:updateElementState( Abtn, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if Abtn.m_eventHandlers.input_source_changed then
		local currentEv = Abtn.m_eventHandlers.input_source_changed
		Abtn:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		Abtn:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:addElement( Abtn )
	self.Abtn = Abtn
	
	local currentEv = CoD.FooterButtonPrompt.new( menu, controller )
	currentEv:setLeftRight( true, false, 88, 168 )
	currentEv:setTopBottom( true, false, 0, 32 )
	currentEv.label:setText( Engine.Localize( "" ) )
	currentEv:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	currentEv:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, false, function ( model )
		currentEv:setModel( model, controller )
	end )
	self:addElement( currentEv )
	self.Bbtn = currentEv
	
	local Xbtn = CoD.FooterButtonPrompt.new( menu, controller )
	Xbtn:setLeftRight( true, false, 168, 256 )
	Xbtn:setTopBottom( true, false, 0, 32 )
	Xbtn.label:setText( Engine.Localize( "" ) )
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Abtn:close()
		self.Bbtn:close()
		self.Xbtn:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

